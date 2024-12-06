Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9D67E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Dec 2024 14:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GBRrBlRLVT7TL533lKb1vFLdI9Y/T44KcDVsiEUWS/k=; b=nXdQ1X5FiH4SSsrvcuUyYrHXLp
	M6BJmHQk6DcmCWpawjlLRSLPkW1ASpPl2mqJT/iSQqEs01Xlt741pVnJ6/tjznIg2zKHPBZOL3/nN
	6N7ObCcUDRuCGmJnRgDHurycLQb/r9JhlKPJgBaLVTwOWGBX+2v2Gnm534xupJDhY6GBaKPxn1z9/
	TueTd9+O+kMpTq7ciOSahNhrdu73Y6Plqa2ADMc6LA1wvkwzufLh+bt+E/O32ngB/rOqSra8a4idD
	fGsbdZVAMS8uIHpKq8B2tjWK2oPOkcGZik38IC6aGYNKhMgZ/hIBLw3jLmpHHZzVre/CD0Fb8i7pz
	y6SqJaPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJvee-000000041Wf-0X2h;
	Sat, 07 Dec 2024 14:19:32 +0000
Received: from [193.252.22.11] (helo=out.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJvda-000000041TV-3jTD
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Dec 2024 14:18:29 +0000
Received: from mail-ej1-f48.google.com ([209.85.218.48])
	by smtp.orange.fr with ESMTPSA
	id JvdWtWtOlagYUJvdWtG8IS; Sat, 07 Dec 2024 15:18:22 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1733581102;
	bh=GBRrBlRLVT7TL533lKb1vFLdI9Y/T44KcDVsiEUWS/k=;
	h=MIME-Version:From:Date:Message-ID:Subject:To;
	b=hJz/YKdZ1usBYAyRs3ScjivrSrTa1+2FFltqArz3joPuyiW3IsPnhdg/K7s6XQVEG
	 P3ry5jxDrDjaG2TEVyDLUNKHiJRjbrYGKHnODlWJru19F9dsBrq6JCEOTQKnsXjpX1
	 Y/MJcSsLLvr/6j3sngDXJLqau/tBNrvAWa19zOtpPyHjGicgY1cfTFiONnnFrVlM+K
	 rWFkuN+P8rTmEsWH7h/J1EZXWgtXosqM+3MBzVtFfAg+49tODxUU67HVQbvH1iR6/h
	 tWmk2HDtdQFxulfNyYrdp3FgFMvGRNlMG0CrC8TMfMgBalNEMwqp9M7njYf6N7G38c
	 7FYgWLau1kqQA==
X-ME-Helo: mail-ej1-f48.google.com
X-ME-Auth: bWFpbGhvbC52aW5jZW50QHdhbmFkb28uZnI=
X-ME-Date: Sat, 07 Dec 2024 15:18:22 +0100
X-ME-IP: 209.85.218.48
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-aa6413fc7c5so184642166b.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 07 Dec 2024 06:18:22 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVyRT4ximwLi/aUTlUDXa3R+j3U0aRxeehrYgvGoMA8yKddaytc4p8QLmZJDLQp05BAhl5FhWsIWi3i7h/vi6zd@lists.infradead.org
X-Gm-Message-State: AOJu0YzLEsEeQxgOov9Bw90JLE8iM3L2Rh7gEj6sAhMeW24PZ2Gj6Q+C
	T/xtN1uHXGiZeyLxnm23YV7hTKwXOXI/16QROcttt9xMq7wD1l0FEEAXg1LDEuxP+zd34SVd+wj
	jT3+vSY79HLEQ5zuoptBi2umCk/Q=
X-Google-Smtp-Source: AGHT+IFeJU5P21g2+KpTjso/RWJ0896W/J65sLmbtkloH76ZizTy87kZbTnF4kB92tm0ezpnDi5dm2fIynDl5PgBmTs=
X-Received: by 2002:a05:6402:5253:b0:5d1:2377:5af3 with SMTP id
 4fb4d7f45d1cf-5d3be661fc5mr3945565a12.5.1733469604117; Thu, 05 Dec 2024
 23:20:04 -0800 (PST)
MIME-Version: 1.0
References: <20241203-is_constexpr-refactor-v1-0-4e4cbaecc216@wanadoo.fr>
 <20241203-is_constexpr-refactor-v1-2-4e4cbaecc216@wanadoo.fr>
 <1d807c7471b9434aa8807e6e86c964ec@AcuMS.aculab.com> <CAMZ6RqLJLP+4d8f5gLfBdFeDVgqy23O+Eo8HRgKCthqBjSHaaw@mail.gmail.com>
 <9ef03cebb4dd406885d8fdf79aaef043@AcuMS.aculab.com> <CAHk-=wjmeU6ahyuwAymqkSpxX-gCNa3Qc70UXjgnxNiC8eiyOw@mail.gmail.com>
In-Reply-To: <CAHk-=wjmeU6ahyuwAymqkSpxX-gCNa3Qc70UXjgnxNiC8eiyOw@mail.gmail.com>
From: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Date: Fri, 6 Dec 2024 16:19:52 +0900
X-Gmail-Original-Message-ID: <CAMZ6RqKLrDB-xkm2G242yU7L=tzxCR9NTwca-1yuWSSEHAOrxQ@mail.gmail.com>
Message-ID: <CAMZ6RqKLrDB-xkm2G242yU7L=tzxCR9NTwca-1yuWSSEHAOrxQ@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20241207_061827_341489_CDDA0E1A 
X-CRM114-Status: GOOD (  28.25  )
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

On Fri. 6 Dec. 2024 at 15:14, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
> On Thu, 5 Dec 2024 at 18:26, David Laight <David.Laight@aculab.com> wrote:
> >
> > From: Vincent Mailhol
> > > ACK. Would adding a suggested--by Linus tag solve your concern?
>
> I'm genberally the one person who doesn't need any more credit ;)
>
> > I actually suspect the first patches to change __is_constexpr() to
> > use _Generic were from myself.
>
> Yes. And David was also I think the one who suggested something else
> than "!!" originally too.

Ack. Then, I will add a suggested-by tag to credit David!

> I may have liked "!!" for being very idiomatic and traditional C, but
> there were those pesky compilers that warn about "integer in bool
> context" or whatever the annoying warning was when then doing the
> "multiply by zero" to turn a constant expression into a constant zero
> expression.
>
> So that
>
>   #define is_const(x) __is_const_zero(0 * (x))
>
> causes issues when 'x' is not an integer expression (think
> "is_const(NULL)" or "is_const(1 == 2)".

But 1 == 2 has already an integer type as proven by:

  #define is_int(x) _Generic(x, int: 1, default: 0)
  static_assert(is_int(1 == 2));

So, it leaves us with the case is_const(pointer). To which I would
question if we really want to support this. By definition, an
expression with a pointer type can not be an *integer* constant
expression. So one part of me tells me that it is a sane thing to
*not* support this case and throw a warning if the user feeds
is_cont() with a pointer.

If we just what to accept pointer arguments but still return false
(because those are not integers), one solution is:

  #define is_const(x) __is_const_zero((long)(x) * 0l)

This would be consistent with __is_constexpr(): it does accept NULL
(i.e. no warnings), but does not recognize it as an integer constant
expression, e.g.:

  is_const(NULL);

returns false with no warnings.

> Side note: I think "(x) == 0" will make sparse unhappy when 'x' is a
> pointer, because it results that horrid "use integer zero as NULL
> without a cast" thing when the plain zero gets implicitly cast to a
> pointer. Which is a really nasty and broken C pattern and should never
> have been silent.
>
> I think David suggested using ((x)?0:0) at some point. Silly
> nonsensical and complex expression, but maybe that finally gets rid of
> all the warnings:
>
>      #define is_const(x) __is_const_zero((x)?0:0)
>
> might work regardless of the type of 'x'.
>
> Or does that trigger some odd case too?

Following a quick test, this seems to work and to return true if given
NULL as an argument (contrary to the current __is_const_expr()). So if
we want to go beyond the C standard and extend the meaning of integer
constant expression in the kernel to also include constant pointers, I
agree that this is the way to go!

Side question, Linus, what do you think about the __is_const_zero()
documentation in

  https://lore.kernel.org/all/20241203-is_constexpr-refactor-v1-2-4e4cbaecc216@wanadoo.fr/

Do you think I am too verbose as pointed out by David? Some people
(including me and Yuri) like it that way, but if you also think this
is too much, I will make it shorter.

Thanks,


Yours sincerely,
Vincent Mailhol

