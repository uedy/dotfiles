filetype on
filetype plugin indent on

"---------------------
" 文字
"---------------------
" 読み込み時の文字コード
set encoding=utf-8
" Vim Script内でマルチバイトを使う場合
scriptencoding utf-8
" 保存時の文字コード
set fileencoding=utf-8
" 読み込み時の文字コードの自動判別. 左側が優先される
set fileencodings=ucs-boms,utf-8,euc-jp,cp932
" 改行コードの自動判別. 左側が優先される
set fileformats=unix,dos,mac
set list
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%

"---------------------
" 行
"---------------------
" 行数表示
set number
" 折り返し
set wrap

"---------------------
" インデント（初期設定向け）
"---------------------
set noexpandtab
set tabstop=4
set shiftwidth=4
set autoindent

"---------------------
" 作らない系
"---------------------
"スワップファイルを作らない
set noswapfile
"バックアップファイルを作らない
set nobackup
"undoファイルを作らない
set noundofile

"---------------------
" その他
"---------------------
" クリップボードの共有
set clipboard=unnamed
" イントロダクション非表示
set shortmess+=I
" 大文字小文字区別をなしにする
set ignorecase

set wildmenu " コマンドモードの補完
set history=5000 " 保存するコマンド履歴の数
"---------------------
" vim側の画面分割
"---------------------
" 画面分割
nmap ss :split<Return><C-w>w
nmap sv :vsplit<Return><C-w>w
" 画面移動
nmap <Space> <C-w>w
map s<left> <C-w>h
map s<up> <C-w>k
map s<down> <C-w>j
map s<right> <C-w>l
map sh <C-w>h
map sk <C-w>k
map sj <C-w>j
map sl <C-w>l
" 画面リサイズ
nmap <C-w><left> <C-w><
nmap <C-w><right> <C-w>>
nmap <C-w><up> <C-w>+
nmap <C-w><down> <C-w>-

"---------------------
" vimfilerの設定（ファイル表示）
"---------------------
nmap sf :VimFilerBufferDir<Return>
nmap sF :VimFilerExplorer -find<Return>
nmap sb :Unite buffer<Return>
let g:vimfiler_as_default_explorer = 1
let g:vimfiler_safe_mode_by_default = 0
let g:vimfiler_enable_auto_cd = 0
let g:vimfiler_tree_leaf_icon = ''
let g:vimfiler_tree_opened_icon = '▾'
let g:vimfiler_tree_closed_icon = '▸'
let g:vimfiler_marked_file_icon = '✓'

set background=dark
"---------------------
" aleの設定（Lintエラー）
"---------------------
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

highlight Pmenu ctermfg=white ctermbg=black
highlight PmenuSel ctermfg=white ctermbg=gray
hi Comment ctermfg=lightblue
" reset augroup
augroup MyAutoCmd
    autocmd!
augroup END

" ENV
let $CACHE = empty($XDG_CACHE_HOME) ? expand('$HOME/.cache') : $XDG_CACHE_HOME
let $CONFIG = empty($XDG_CONFIG_HOME) ? expand('$HOME/.config') : $XDG_CONFIG_HOME
let $DATA = empty($XDG_DATA_HOME) ? expand('$HOME/.local/share') : $XDG_DATA_HOME

" Load rc file
function! s:load(file) abort
    let s:path = expand('$CONFIG/nvim/rc/' . a:file . '.vim')

    if filereadable(s:path)
        execute 'source' fnameescape(s:path)
    endif
endfunction
call s:load('plugins')
"---------------------
" カラースキーム
"---------------------
colorscheme kalisi
