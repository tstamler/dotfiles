function! KatanaNodeEdgeHighlighting()
  if (stridx(expand('%:p'), 'katana') >= 0)
    " absolute path of open buffer contains the word "katana"
    syn match katanaNode /node\|Node/
    syn match katanaEdge /edge\|Edge/
    hi katanaNode cterm=bold ctermfg=Cyan
    hi katanaEdge cterm=bold ctermfg=Red
  endif
endfunction()

" Call this function every time a color scheme is loaded
autocmd bufenter * :call KatanaNodeEdgeHighlighting()
autocmd filetype * :call KatanaNodeEdgeHighlighting()

function! KatanaFixPaths() abort
  let qflist = getqflist()
  for i in qflist
    "let bufname = bufname(i.bufnr)
    ":bd i.bufnr
    "let newname = substitute(bufname, '/source/', g:katana_root_dir, '')
    "let newname = substitute(newname, '^from ', '', '')
    "let newname = substitute(newname, '\^M', '', '')
    "let i.bufnr = bufnr(newname, 1)
    "let newtext = substitute(i.text, '/source/', g:katana_root_dir, '')
    "let newtext = substitute(newtext, '^from ', '', '')
    "let newtext = substitute(newtext, '\^M', '', '')
    "let i.text = newtext
  endfor
  call setqflist(qflist)
  :cnext
endfunction

function! s:Main() abort
  "let s:dev_script = findfile('scripts/dev', '.;')
  "if s:dev_script != ''
    "let g:katana_root_dir = fnamemodify(s:dev_script, ':h:h') . '/'
    "let &makeprg = s:dev_script . ' build $*'

    "autocmd QuickFixCmdPost make :call KatanaFixPaths()
  "endif
endfunction

autocmd bufenter * :call s:Main()
