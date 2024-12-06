Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9636E7716E
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Dec 2024 05:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WL9xGcicUYweWPrIZdM4obw40wyP2AJI744Zi36nKfc=; b=3JLYMJyqb3tP/6LF1Yutv4HLo4
	NWlkRsIQVQUkdUkq7/qznCCgnmw9QFLjF7V60p909Xgxfe2qfXqFE0eLi5dMyYH7ywt2FS/2n2mC2
	QfT0XC3/B1JSRI/U5zs+SfpaRvrPZyMiGrgkhLqTNHcxGMUanaR2QBY+q7COekAtKM7l181z0U16g
	aiRCsg0o49lZg8ugOD06TX5zaHwE3/pv8aoyJA9qVjImQKOfr2EWqagMmCJY4KDqacXcGMikndc1F
	5tI9pc9HoPBpv1ow4Eabfm8isUQBwflwzl+eLmPMJnBRq2XirexiJt50IqUrri15vCt2fqWmlClZN
	bFlQ5Avg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJn8o-00000003QYd-1NXB;
	Sat, 07 Dec 2024 05:14:06 +0000
Received: from out-16.smtpout.orange.fr ([193.252.22.16] helo=out.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJn7k-00000003QTO-3i6U
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Dec 2024 05:13:03 +0000
Received: from mail-lf1-f47.google.com ([209.85.167.47])
	by smtp.orange.fr with ESMTPSA
	id Jn7ftmlOQqhuoJn7fto2Pp; Sat, 07 Dec 2024 06:12:57 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1733548377;
	bh=WL9xGcicUYweWPrIZdM4obw40wyP2AJI744Zi36nKfc=;
	h=MIME-Version:From:Date:Message-ID:Subject:To;
	b=MW5eAPmIqfQKOR9Km6v/ULaG9XoTvvwH4S5w1NV42mcC1FOUnjlfHh3WI/cPi4n1o
	 BBQjFRKzpmtFj14nkXFdtWe0ZYJGCstfqV2mwEp+xme9p9LcRkcSWEhHdShVYeyYCQ
	 eWknneqPhXUsUy0AofhE4Emt1tKivrca1XDYONF2bFPMiXPqBrv8moDOC5l5E53/Xa
	 F3cfsgMUPdu1fYKigvtEAVXmm3cyLsDw4BoF/uCv94vfe2e+ZEe/sv90d+hxQ9eC/j
	 iQKYEhhufrRTQiiWkzliiOhcsD7dOHfaeOFMNjulkFsPyVtzNNbUA45pdYPdt7BzHd
	 h7suQ4G+J8Y7Q==
X-ME-Helo: mail-lf1-f47.google.com
X-ME-Auth: bWFpbGhvbC52aW5jZW50QHdhbmFkb28uZnI=
X-ME-Date: Sat, 07 Dec 2024 06:12:57 +0100
X-ME-IP: 209.85.167.47
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-53dde4f0f23so2480629e87.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Dec 2024 21:12:55 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXBDCpvVxUKe/CccanTUapebU/qsfxlH0pvEJ+/6JWDeNyLCzKtP0bSlsqQjhCgU0GG2xbETCjChkkAS8pbiRCp@lists.infradead.org
X-Gm-Message-State: AOJu0YyMu5ZoG+pChJ3JLKLVaWQ8UkCer1O2ROMIKN+9qgBFFLEV5vpx
	96nKQUcFkNGU2F7gwuIglKWTKRQF2PP44XmS/j9UKT8caCVpmHa5WV2APXVe+1lm0vf9kP1yU+B
	mFb7QaE/A0K8RlOSjfXrseVUhad4=
X-Google-Smtp-Source: AGHT+IF0UkbZeO6DhnG4OpInkasGFbpfvjfWezi2XR8vGYhVDKgOfxRspF7qPi3YhfQ2NuvOk/LKXDlfFe/grz4kS7w=
X-Received: by 2002:a17:906:b399:b0:aa5:33f0:c50e with SMTP id
 a640c23a62f3a-aa63a287c66mr153642666b.57.1733474989334; Fri, 06 Dec 2024
 00:49:49 -0800 (PST)
MIME-Version: 1.0
References: <20241203-is_constexpr-refactor-v1-0-4e4cbaecc216@wanadoo.fr>
 <20241203-is_constexpr-refactor-v1-2-4e4cbaecc216@wanadoo.fr>
 <1d807c7471b9434aa8807e6e86c964ec@AcuMS.aculab.com> <CAMZ6RqLJLP+4d8f5gLfBdFeDVgqy23O+Eo8HRgKCthqBjSHaaw@mail.gmail.com>
 <9ef03cebb4dd406885d8fdf79aaef043@AcuMS.aculab.com> <CAHk-=wjmeU6ahyuwAymqkSpxX-gCNa3Qc70UXjgnxNiC8eiyOw@mail.gmail.com>
 <CAMZ6RqKLrDB-xkm2G242yU7L=tzxCR9NTwca-1yuWSSEHAOrxQ@mail.gmail.com>
In-Reply-To: <CAMZ6RqKLrDB-xkm2G242yU7L=tzxCR9NTwca-1yuWSSEHAOrxQ@mail.gmail.com>
From: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Date: Fri, 6 Dec 2024 17:49:37 +0900
X-Gmail-Original-Message-ID: <CAMZ6RqJzPqfY4Uy3EWTTqRgN2Gq0hDr2R4zSDMEaMT_CS=05tw@mail.gmail.com>
Message-ID: <CAMZ6RqJzPqfY4Uy3EWTTqRgN2Gq0hDr2R4zSDMEaMT_CS=05tw@mail.gmail.com>
Subject: Re: [PATCH 02/10] compiler.h: add is_const() as a replacement of __is_constexpr()
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: David Laight <David.Laight@aculab.com>, 
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
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, uecker@tugraz.at
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_211301_339834_C9713F84 
X-CRM114-Status: GOOD (  34.80  )
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

On Fri. 6 Dec. 2024 at 16:19, Vincent Mailhol
<mailhol.vincent@wanadoo.fr> wrote:
> On Fri. 6 Dec. 2024 at 15:14, Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
> > On Thu, 5 Dec 2024 at 18:26, David Laight <David.Laight@aculab.com> wrote:

(...)

> > I may have liked "!!" for being very idiomatic and traditional C, but
> > there were those pesky compilers that warn about "integer in bool
> > context" or whatever the annoying warning was when then doing the
> > "multiply by zero" to turn a constant expression into a constant zero
> > expression.
> >
> > So that
> >
> >   #define is_const(x) __is_const_zero(0 * (x))
> >
> > causes issues when 'x' is not an integer expression (think
> > "is_const(NULL)" or "is_const(1 == 2)".
>
> But 1 == 2 has already an integer type as proven by:
>
>   #define is_int(x) _Generic(x, int: 1, default: 0)
>   static_assert(is_int(1 == 2));
>
> So, it leaves us with the case is_const(pointer). To which I would
> question if we really want to support this. By definition, an
> expression with a pointer type can not be an *integer* constant
> expression. So one part of me tells me that it is a sane thing to
> *not* support this case and throw a warning if the user feeds
> is_cont() with a pointer.
>
> If we just what to accept pointer arguments but still return false
> (because those are not integers), one solution is:
>
>   #define is_const(x) __is_const_zero((long)(x) * 0l)
>
> This would be consistent with __is_constexpr(): it does accept NULL
> (i.e. no warnings), but does not recognize it as an integer constant
> expression, e.g.:
>
>   is_const(NULL);
>
> returns false with no warnings.
>
> > Side note: I think "(x) == 0" will make sparse unhappy when 'x' is a
> > pointer, because it results that horrid "use integer zero as NULL
> > without a cast" thing when the plain zero gets implicitly cast to a
> > pointer. Which is a really nasty and broken C pattern and should never
> > have been silent.
> >
> > I think David suggested using ((x)?0:0) at some point. Silly
> > nonsensical and complex expression, but maybe that finally gets rid of
> > all the warnings:
> >
> >      #define is_const(x) __is_const_zero((x)?0:0)
> >
> > might work regardless of the type of 'x'.
> >
> > Or does that trigger some odd case too?
>
> Following a quick test, this seems to work and to return true if given
> NULL as an argument (contrary to the current __is_const_expr()). So if
> we want to go beyond the C standard and extend the meaning of integer
> constant expression in the kernel to also include constant pointers, I
> agree that this is the way to go!

I just came up with a new idea:

  #define is_const(x) __is_const_zero((x) != (x))

Similarly to ((x)?0:0), this seems to work with everything (including
with NULL), but arguably a bit less ugly.

> Side question, Linus, what do you think about the __is_const_zero()
> documentation in
>
>   https://lore.kernel.org/all/20241203-is_constexpr-refactor-v1-2-4e4cbaecc216@wanadoo.fr/
>
> Do you think I am too verbose as pointed out by David? Some people
> (including me and Yuri) like it that way, but if you also think this
> is too much, I will make it shorter.
>
> Thanks,
>
>
> Yours sincerely,
> Vincent Mailhol

