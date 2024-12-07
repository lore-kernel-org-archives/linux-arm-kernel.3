Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20C86E7717B
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Dec 2024 12:25:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nQ4RRhd2E6TY+Bu5fIbqEbAQEz1MRYR2VOuTBXdoN1w=; b=rpoQT9BSghNc/pQRAd/cAorDyS
	RJHgEF/AUgzOHGsdvWvRcm8HHxX0fzmvxk6enFhpzxu+VUluDj+etnnNLo8lS6lgwBhi5tEiN3nZW
	ZgIZ4hkF653yzpT6F30REM1ZibCBdkwtygIYOr/FklpYke66DAKaTjud/hAsRMuGluIxhmq0SWPa7
	JO+yftlP0IeMmLDliK+ucmqsP85k0dSqMyai73WKbIf1LjUj9AEc59ewD2bcLTopzpa3b/E92MgnQ
	y8Y/zxLmhrA/toL3qwIGOWs3MDEWMJojYoNNfZ1siiFB9WT0t9mFhiXadEpMAygOg3QS0PdEDw8vV
	dP72lOag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJtsM-00000003v54-21so;
	Sat, 07 Dec 2024 12:25:34 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJtrJ-00000003uxV-2kRS
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Dec 2024 12:24:30 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-aa549f2fa32so550680266b.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 07 Dec 2024 04:24:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733574268; x=1734179068; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nQ4RRhd2E6TY+Bu5fIbqEbAQEz1MRYR2VOuTBXdoN1w=;
        b=kmsJ0TIx7SQao1yvzQoatY0eaNFUTuoGwVYbktJf0unApcYVFVGLfcBUk9io1VW/08
         sunmrLH27Q+bdcZc/Fh1tkWjOtjB+OZ2iSV1yax6x9iuJJkonuvQrSET9A1Ls4rh3id9
         F3ZzpCqSSzRsjlUQEehMFaIcakK4fMJ6AhNywHxubLjXuYX6NftoyYYDOsE2LzjdlWpm
         g6G0K/7Sa3aDZtzxmTJgTzgVe1IOKNTNDReKRXOGnN7VkJY4XP3OvHiR2jvQxc6pIFlA
         PRIpXwqQtHZUxQymc2fYQ+njaoN28BiNi7uaauOnLJIS3SjOgjuqx2zjGZepNGqjBWv9
         rtyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733574268; x=1734179068;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nQ4RRhd2E6TY+Bu5fIbqEbAQEz1MRYR2VOuTBXdoN1w=;
        b=Su6kv5UK5MP7BG62oN8iaCzy6eZSuPT8ddO2+Z254ILgnw55eQh5yvVJZ0lsQd/rr1
         TDGJvYHqZML2P6U9dLP+5qAglGulsYL6InPX/rr3gLJWX/Ep1vbpMVIzrcLJHhMtN8Me
         mX1jB8gdH/hlQUaKGhUF7HSLqLMbmv8SAhm/FLw3UnmXUqEmVz2CGuPS3uXQnanGjOYz
         qwGtlCmny+G7caFzJ4beogTgBhH3JCVtT3uP++pZYRQP6mMP8G0M8CfRXcmcvGWnUzIU
         hgoqybG+PDgkbGqlzOpSy9d1Xa7d9sngWP1BwoBexRjRgt65FYFZN7SeBjkxy/KTX5vb
         ThFA==
X-Forwarded-Encrypted: i=1; AJvYcCUhPyiJ6GeGbZ4i2SThZrHPXFkIpSLEEQoM2S64eh23s1bIUTzcKvnzdIkr3T10zvojfUiWgwyH0ud5m9F8tNnc@lists.infradead.org
X-Gm-Message-State: AOJu0YzWnhWCRcYn35ynbncEAxnD2VDJYB6gPITtMMfnXijUmM1Cs20x
	vTHc0qQACpyOlI11+MryRg59OneT8VbUdJbK4Bf1gc5XK+bAx8VaphxeBlHtCY+HUjbEYS0mJ8K
	KMVzXLX3Mh+1vAAkycOKTIP9TFpU=
X-Gm-Gg: ASbGnctvzFuVSepI4E66+aJ+44zLPcy5Lyfnd7kov+2jsCk43FqSW1JybDpsBsvwyJq
	wgBAu5e+V6qm74DaJdWyNcbuYfKEF3fY=
X-Google-Smtp-Source: AGHT+IGR0yviTsv6EI0Cf6ZzGRuPI9Rqzj5opuPmDdPb/4ZfUr5j5Og+KYs8tNZPu+yItNXL45088jAdwI3x7fjsYQI=
X-Received: by 2002:a17:907:1de6:b0:aa6:59ef:ec with SMTP id
 a640c23a62f3a-aa659ef01a8mr99491466b.1.1733574267541; Sat, 07 Dec 2024
 04:24:27 -0800 (PST)
MIME-Version: 1.0
References: <20241203-is_constexpr-refactor-v1-0-4e4cbaecc216@wanadoo.fr>
 <20241203-is_constexpr-refactor-v1-2-4e4cbaecc216@wanadoo.fr>
 <1d807c7471b9434aa8807e6e86c964ec@AcuMS.aculab.com> <CAMZ6RqLJLP+4d8f5gLfBdFeDVgqy23O+Eo8HRgKCthqBjSHaaw@mail.gmail.com>
 <9ef03cebb4dd406885d8fdf79aaef043@AcuMS.aculab.com> <CAHk-=wjmeU6ahyuwAymqkSpxX-gCNa3Qc70UXjgnxNiC8eiyOw@mail.gmail.com>
 <CAMZ6Rq+SzTA25XcMZnMnOJcrrq1VZpeT1xceinarqbXgDDo8VA@mail.gmail.com>
 <CAHk-=wiP8111QZZJNbcDNsYQ_JC-xvwRKr0qV9UdKn3HKK+-4Q@mail.gmail.com>
 <d23fe8a5dbe84bfeb18097fdef7aa4c4@AcuMS.aculab.com> <CAHk-=win8afdcergvJ6f2=rRrff8giGUW62qmYs9Ae6aw=wcnA@mail.gmail.com>
 <0f5c07b827c3468c8fa3928a93a98bfa@AcuMS.aculab.com> <e806dd51b1ac4e289131297fbf30fc37@AcuMS.aculab.com>
 <CAMZ6RqLOR3aCRW_js2agV+VFiHdazb4S2+NdT5G4=WbDKNB8bA@mail.gmail.com> <b1ff4a65594a4d39b2e9b8b44770214e@AcuMS.aculab.com>
In-Reply-To: <b1ff4a65594a4d39b2e9b8b44770214e@AcuMS.aculab.com>
From: Vincent Mailhol <vincent.mailhol@gmail.com>
Date: Sat, 7 Dec 2024 21:24:16 +0900
Message-ID: <CAMZ6RqJFReLJTd-O8s02oQNeB0SPQh3C-Mg+Nif5vMB9gFtQww@mail.gmail.com>
Subject: Re: [PATCH 02/10] compiler.h: add is_const() as a replacement of __is_constexpr()
To: David Laight <David.Laight@aculab.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, "w@1wt.eu" <w@1wt.eu>, 
	Luc Van Oostenryck <luc.vanoostenryck@gmail.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Yury Norov <yury.norov@gmail.com>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Jani Nikula <jani.nikula@linux.intel.com>, 
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
	Rikard Falkeborn <rikard.falkeborn@gmail.com>, 
	"linux-sparse@vger.kernel.org" <linux-sparse@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"llvm@lists.linux.dev" <llvm@lists.linux.dev>, 
	"linux-hardening@vger.kernel.org" <linux-hardening@vger.kernel.org>, 
	"intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, 
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
	"coresight@lists.linaro.org" <coresight@lists.linaro.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"uecker@tugraz.at" <uecker@tugraz.at>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241207_042429_702357_0F462075 
X-CRM114-Status: GOOD (  37.58  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Sat. 7 Dec. 2024 at 20:19, David Laight <David.Laight@aculab.com> wrote:
> From: Vincent Mailhol
> > Sent: 07 December 2024 07:43
> ...
> > > So maybe the slightly long lines:
> > > #define const_true(x) _Generic(0 ? (void *)((x) + 0 ? 0L : 1L) : (char *)0, char *: 1, void *: 0)
> > > #define const_expr(x) _Generic(0 ? (void *)((x) + 0 ? 0L : 0L) : (char *)0, char *: 1, void *: 0)
>
> Clearly they can be implemented in terms of a common define.
> But I don't see a need for a const_zero() and nested expansions make extra
> work for the compiler.
>
> >
> > This still throws a -Wnull-pointer-arithmetic on clang on const_expr(NULL):
> >   https://godbolt.org/z/vo5W7efdE
>
> I was worried about that one.
>
> > I just do not see a method to silence that one. So three options:
> >
> >   1. is_const() does not accept pointers and throws a constraint violation:
> >        #define is_const(x) __is_const_zero(0 * (x))
> >      This is my current patch.
>
> Is that going to affect things like const_true(x << y)?

No warnings for const_true(x << y). See by yourself:

  https://godbolt.org/z/v79x3dnor

> Disallowing that seems counter-productive.
> (Remember it might be passed into a #define that is then
> checking its argument for being constant.)

I understand how a static inline may use __builtin_constant_p() to
check if its argument is NULL. But I am having a hard time
understanding how this would look like with macros and with
is_const().

Do you know one real life example where you have to pass NULL to a
function like macro which can not be written as a static inline
function?

And if that real life use case does not exist, then disallowing it
looks sane: it will push the developper to do the right thing: write a
static inline with __builting_constant_p().

> >   2. is_const() accept pointers but is_const(NULL) returns false:
> >        #define is_const(x) __is_const_zero((x) != (x))
> >      This keeps the current __is_constexpr() behaviour.
>
> No good - expands everything twice.

And? __is_const_zero() does not evaluate its arguments, so no side effect:

  https://godbolt.org/z/W988P4v9e

Or am I missing something else?

> >   3. is_const() accepts pointers and is_const(NULL) return true:
> >
> >        #define const_expr(x) _Generic(0 ? (void *)((x) + 0 ? 0L : 0L)
> > : (char *)0, char *: 1, void *: 0)
> >
> >      David's latest proposal, it requires to remove the
> >      -Wnull-pointer-arithmetic clang warning.
>
> Only for const_expr(NULL) - and since clang gets that wrong
> maybe the warning is a good thing.
>
> You can just add:
> #define const_NULL(ptr) const_true(!(ptr))
> Probably the only place where you actually want to test for zero.

Which goes back to my first point: if we have to declare const_NULL(),
then we probably do not want is_const() to accept NULL so that the
user sees the mismatch (and I am not acknowledging that we need
const_NULL(): as long as no use case arize, no need for it).

> > I vote for 1. or 2. (with a preference for 1.). IMHO, we are just
> > adding an unreasonable level of complexity for making the macro treat
> > NULL as an integer. Would someone find a solution for 3. that does not
> > yield a warning, then why not. But if we have to remove a compiler
> > check for a theoretical use case that does not even exist in the
> > kernel, then it is not worth the trade off.
> >
> > Concerning is_const(var << 2), the patch I submitted works fine as-is
> > with all scalars including that (var << 2):
> >
> >   https://godbolt.org/z/xer4aMees
> >
> > And can we ignore the case (!(var << 2))? This is not a warning
> > because of the macro, but because of the caller! If I do any of:
> >
> >           if (!(var << 2)) {}
> >           (void)__builtin_constant_p(!(var << 2));
> >
> > I also got the warning. The point is that the macro should not
> > generate *new* warnings. If the given argument already raises a
> > warning, it is the caller's responsibility to fix.
>
> Except it could easily happen way inside some other expansion.
> Perhaps someone optimises frobnicate(x) for constant input.
> Suddenly frobnicate(!(var << 2)) generates a compile error.

Then, that person will see that compile error and will modify
frobnicate() to remove the compile error. End of the story.

My point is simple: if the use case you are mentioning is valid, why
did it never collide with __builtin_constant_p() that we have been
using for many years?

And I am sure that there are hundreds of examples of macro that will
either pass their argument as-is to an if() or to the ternary operator
without accounting for if their input is (!(var << 2)). So why did not
these collide?


Yours sincerely,
Vincent Mailhol

