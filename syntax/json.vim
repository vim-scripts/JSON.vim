" Vim syntax file
" Language:	JSON
" Maintainer:	Jeroen Ruigrok van der Werven <asmodai@in-nomine.org>
" Last Change:	2007-07-06
" Version:      0.1
" {{{1

" Syntax setup {{{2
" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded

if !exists("main_syntax")
  if version < 600
    syntax clear
  elseif exists("b:current_syntax")
    finish
  endif
  let main_syntax = 'json'
endif

" Syntax: Strings {{{2
" TODO: Fix up string keys displaying.
syn region  jsonString    start=+"+  skip=+\\\\\|\\"+  end=+"\|$+  contains=jsonEscape

" Syntax: Escape sequences {{{3
syn match   jsonEscape    "\\["\\/bfnrt]" contained
syn match   jsonEscape    "\\u\x\{4}" contained

" Syntax: Numbers {{{2
" TODO: Fix up displaying.
syn cluster jsonNumber    contains=jsonInteger,jsonFraction,jsonExponent
syn match   jsonInteger   "-\=\d\+"
syn match   jsonFraction  ".\s+\d+"
syn match   jsonExponent  "[eE][-\+]\=\s+\d\+"

" Syntax: Boolean {{{2
syn keyword jsonBoolean   true false

" Syntax: Null {{{2
syn keyword jsonNull      null

" Syntax: Braces and Parentheses {{{2
syn match   jsonBraces	   "[{}\[\]]"
syn match   jsonParens	   "[()]"

" Define the default highlighting. {{{1
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_json_syn_inits")
  if version < 508
    let did_json_syn_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif
  HiLink jsonString             String
  HiLink jsonEscape             Special
  HiLink jsonInteger		Number
  HiLink jsonFraction		Number
  HiLink jsonExponent		Number
  HiLink jsonBraces		Operator
  HiLink jsonNull		Function
  HiLink jsonBoolean		Boolean
  delcommand HiLink
endif

let b:current_syntax = "json"
if main_syntax == 'json'
  unlet main_syntax
endif

" Vim settings {{{2
" vim: ts=8 fdm=marker
