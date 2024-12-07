Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B09B4E7716E
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Dec 2024 07:44:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hd+JXxg1Trx18tJn2WFf9QCw9lSZFwBnHLKDbtoBF3M=; b=Mrk09ZOn+Dgzofo3WckFEQGFLb
	e2JKkCp9z9u/2dLhqd/3B6TRpLgJOMKNvOXf+JkbvxYePPz6+d4HnSFKHK/S5vgbWivGycw3d6u4f
	ZDLBMaPHNtnM8nw7gUADw+yrHlq7jpFixyHijVp6bfGWmtP6/6zK6lzy0Nz7OMBgDu4QOquDkWn4u
	IcthZAOJvGiiUmMjXURBmyB5QgqOVekRz8MKA4LB7zY0K9UWV9uYacVk09Q3tmxpoDp7C4MvngEJb
	sxGvdCsKHbKjZbE6sCoZ8gPKgYoFNl1G5tofXywV6S/4E8thlkMjV3ol+BxOWzNvOPNvaaULKn2Dt
	pDXVjPTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJpTr-00000003aaf-2gQP;
	Sat, 07 Dec 2024 07:43:59 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJpSo-00000003aRb-3FXa
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Dec 2024 07:42:56 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-a9a68480164so345140466b.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Dec 2024 23:42:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733557373; x=1734162173; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Hd+JXxg1Trx18tJn2WFf9QCw9lSZFwBnHLKDbtoBF3M=;
        b=hIHy0YfNRzGZyRs/gcusf7lB0oOvaaPJkPyN4nNMdGH1eq4zHhv/dWPMWfBaTxRWup
         uR7lqHQaoaSALkhxrf5Qs3CbPwOT1CuvIPRSN5NqvKf6qmjs7t+G0iXzEcMEFQ9eW/rc
         YCCmBpueWTtgu69Uk24jLGmJRugjO7PwuY5qw9cu5uIAHfRG+ERIzNHtBr4Gy5JyyXEH
         Jjc/9NYNjF+IDq/sGMVMR4lPIj3QioguBkpS3tOPZVbB0ueSIncoPGc2I7TcPkr/W7BH
         f3GfKGGwVq0Gk3dpCUIzBUFFb/VLxTDNylcWvu5PU+c6O8PDGWhMVeNFReOspNEEYm25
         00Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733557373; x=1734162173;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hd+JXxg1Trx18tJn2WFf9QCw9lSZFwBnHLKDbtoBF3M=;
        b=k3nvthAL4Lgca9gnl9F68zpAiUfpBU+mQm7zaLthL93m8NlZAsxJ6ox8MyxRWwTeNl
         9CA9iuictB1c4/diVgrHxNhEhw6dtGFNurkGoqV5oKb4bRj5W6drrYPX7eDJ2BeG+q7L
         U1a83+PAAN26p8iZyaNfAqmGD6S8KMW+WbW+mT7Yiik5uwTbf/q0c6KfJrywtAuOMfK5
         a3iYofdvkem3k5wzZr/A+lvpUVA9q1mQ2pjiKp3XUjZxTVU6jk3KJO0c6h09gFL8PlJa
         aI1C7gL86E627DHq4clc9N3VrJ/p57emXY5fc5wP+LiW8rpphvumgRS+hHEuKV6XuZ06
         xXkQ==
X-Forwarded-Encrypted: i=1; AJvYcCVxLuKXI9lhEWEogDMraqtW+B8x1iCX4Q7mWwKd65WAXb4FxqhbcELnHUxUwfB6LK36a+vLojmUEt6oYNbXcSLD@lists.infradead.org
X-Gm-Message-State: AOJu0YxySxVYHUfRxDzoSCMlan/zUvxCShiScgKFFT7FPy1oghr1ACAY
	55U/ZYb0ydqHYw2w3VpAMkdmsVBMknuVzLtKLs+BbAFY8mV+I4wipEFJUHAKVO31ZENm9Zo+LQz
	l9NAvYI+RP0wWl9LswPlfSRTCsPg=
X-Gm-Gg: ASbGncv5JVFiXL4iIgZ9wZz7WfnBs03OlDzyOCbrgpVCP3/9JccC21QkQB0fU4woYlA
	lVYM8ppA7xYWW+P3wN1jwWGvjw1AXZR0=
X-Google-Smtp-Source: AGHT+IFtbq3U+qyH15cm3qJcpaS8xIxfktbIH2S26u2IkmcJ4yPTJg9aqWHgPR/Bx1zVWKXpdweVI0tjzLEF2jmrRv0=
X-Received: by 2002:a17:906:31d1:b0:aa6:62d5:653 with SMTP id
 a640c23a62f3a-aa662d50b73mr25238766b.54.1733557372613; Fri, 06 Dec 2024
 23:42:52 -0800 (PST)
MIME-Version: 1.0
References: <20241203-is_constexpr-refactor-v1-0-4e4cbaecc216@wanadoo.fr>
 <20241203-is_constexpr-refactor-v1-2-4e4cbaecc216@wanadoo.fr>
 <1d807c7471b9434aa8807e6e86c964ec@AcuMS.aculab.com> <CAMZ6RqLJLP+4d8f5gLfBdFeDVgqy23O+Eo8HRgKCthqBjSHaaw@mail.gmail.com>
 <9ef03cebb4dd406885d8fdf79aaef043@AcuMS.aculab.com> <CAHk-=wjmeU6ahyuwAymqkSpxX-gCNa3Qc70UXjgnxNiC8eiyOw@mail.gmail.com>
 <CAMZ6Rq+SzTA25XcMZnMnOJcrrq1VZpeT1xceinarqbXgDDo8VA@mail.gmail.com>
 <CAHk-=wiP8111QZZJNbcDNsYQ_JC-xvwRKr0qV9UdKn3HKK+-4Q@mail.gmail.com>
 <d23fe8a5dbe84bfeb18097fdef7aa4c4@AcuMS.aculab.com> <CAHk-=win8afdcergvJ6f2=rRrff8giGUW62qmYs9Ae6aw=wcnA@mail.gmail.com>
 <0f5c07b827c3468c8fa3928a93a98bfa@AcuMS.aculab.com> <e806dd51b1ac4e289131297fbf30fc37@AcuMS.aculab.com>
In-Reply-To: <e806dd51b1ac4e289131297fbf30fc37@AcuMS.aculab.com>
From: Vincent Mailhol <vincent.mailhol@gmail.com>
Date: Sat, 7 Dec 2024 16:42:41 +0900
Message-ID: <CAMZ6RqLOR3aCRW_js2agV+VFiHdazb4S2+NdT5G4=WbDKNB8bA@mail.gmail.com>
Subject: Re: [PATCH 02/10] compiler.h: add is_const() as a replacement of __is_constexpr()
To: David Laight <David.Laight@aculab.com>, Linus Torvalds <torvalds@linux-foundation.org>, w@1wt.eu
Cc: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>, Nathan Chancellor <nathan@kernel.org>, 
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
X-CRM114-CacheID: sfid-20241206_234254_812005_BF7EF18D 
X-CRM114-Status: GOOD (  17.89  )
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

On Sat. 7 Dec. 2024 at 05:24, David Laight <David.Laight@aculab.com> wrote:
> > > > #define const_NULL(x) _Generic(0 ? (x) : (char *)0, char *: 1, void *: 0)
> > > > #define const_true(x) const_NULL((x) ? NULL : (void *)1L))
> > > > #define const_expr(x) const_NULL((x) ? NULL : NULL))
> > > > I send this morning.
> > > > Needs 's/char/struct kjkjkjkjui/' applied.
> > >
> > > Oh Christ. You really are taking this whole ugly to another level.
> >
> > I sort of liked that version in a perverse sort of way.
> > It does give you a simple test for NULL (unless you've used 'struct kjkjkjkjui').
>
> Except const_NULL() really doesn't work at all - so you are lucky :-)
>
> So maybe the slightly long lines:
> #define const_true(x) _Generic(0 ? (void *)((x) + 0 ? 0L : 1L) : (char *)0, char *: 1, void *: 0)
> #define const_expr(x) _Generic(0 ? (void *)((x) + 0 ? 0L : 0L) : (char *)0, char *: 1, void *: 0)

This still throws a -Wnull-pointer-arithmetic on clang on const_expr(NULL):

  https://godbolt.org/z/vo5W7efdE

I just do not see a method to silence that one. So three options:

  1. is_const() does not accept pointers and throws a constraint
     violation:

       #define is_const(x) __is_const_zero(0 * (x))

     This is my current patch.

  2. is_const() accept pointers but is_const(NULL) returns false:

       #define is_const(x) __is_const_zero((x) != (x))

     This keeps the current __is_constexpr() behaviour.

  3. is_const() accepts pointers and is_const(NULL) return true:

       #define const_expr(x) _Generic(0 ? (void *)((x) + 0 ? 0L : 0L)
: (char *)0, char *: 1, void *: 0)

     David's latest proposal, it requires to remove the
     -Wnull-pointer-arithmetic clang warning.

I vote for 1. or 2. (with a preference for 1.). IMHO, we are just
adding an unreasonable level of complexity for making the macro treat
NULL as an integer. Would someone find a solution for 3. that does not
yield a warning, then why not. But if we have to remove a compiler
check for a theoretical use case that does not even exist in the
kernel, then it is not worth the trade off.

Concerning is_const(var << 2), the patch I submitted works fine as-is
with all scalars including that (var << 2):

  https://godbolt.org/z/xer4aMees

And can we ignore the case (!(var << 2))? This is not a warning
because of the macro, but because of the caller! If I do any of:

          if (!(var << 2)) {}
          (void)__builtin_constant_p(!(var << 2));

I also got the warning. The point is that the macro should not
generate *new* warnings. If the given argument already raises a
warning, it is the caller's responsibility to fix.


Yours sincerely,
Vincent Mailhol

