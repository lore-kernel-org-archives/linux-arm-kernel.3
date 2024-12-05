Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8139DE7716E
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 19:36:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gOoooPhx/l7HLxvA2brAhQv1Lnc9qpuTdTl2b6/0YwM=; b=LxrWf5TfcDocqAptJ7fZOVynVX
	m7uxGgj7d7BpmOYuR6ymbuWbl8Sp/SJoH0ABTtF/6xbjdQGrOlmcyqv7pojmvrvXPF4z3SusEU70t
	wQsZEFiyr8bGgU9Cg2+QUjHVPcV18lXjGqKb0THxQ/JYww13Jpjzt9/zLuCAdnW+yBjVPKBiYtPmf
	F9oqueadGzCvqF5Bz2Bw99YUtUxlZyXupJSKGIV//HVqtWfdAtlq111ZQUoZxcZLlQQDlpwIIctPX
	Fc0wpZkbztt1giy3F8DE4+BFlhR6+RR9UnwYW2rx6tavDq+fW++qeILBcSkUeNv4k7aTNT8B65mTB
	FQ92/lHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJHdj-0000000HDRZ-09Ge;
	Thu, 05 Dec 2024 19:35:55 +0000
Received: from out-16.smtpout.orange.fr ([193.252.22.16] helo=out.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJHcg-0000000HDI4-0HFA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 19:34:52 +0000
Received: from mail-wm1-f49.google.com ([209.85.128.49])
	by smtp.orange.fr with ESMTPSA
	id JHcYt5v5vKnkaJHcYtMYBG; Thu, 05 Dec 2024 20:34:42 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1733427282;
	bh=gOoooPhx/l7HLxvA2brAhQv1Lnc9qpuTdTl2b6/0YwM=;
	h=MIME-Version:From:Date:Message-ID:Subject:To;
	b=BGgpTcJ0m2dh5l+1sYwoRkxGSsDoFIyP2z1x1y00OT3vcT/qIivP80imprIzkzn2/
	 mwnaUWTyQjKq0UJXeMgRQFk0u6qsG6Sq3/ijMXxUvPkHhxwJcca64cWIynkT4svrAo
	 EnK0x1SEO/tSkrGgM1pOSWemgBoesZ9ybGL24VV2GnGAok8X/K1ExmhaTqSVuv/z++
	 njVovnYxpVcsTyPKa496hJtdapbse9fNMMTUcnI5i3ZAdkat3aJDxv0vJ95yMpam9l
	 L81tjywwsLFFYCBIeHsZcalmsJKDa8ud74VkgnSl8JnhvRaELlrz77/uAmEm1VqoZz
	 qzWyJ8RfmbJPA==
X-ME-Helo: mail-wm1-f49.google.com
X-ME-Auth: bWFpbGhvbC52aW5jZW50QHdhbmFkb28uZnI=
X-ME-Date: Thu, 05 Dec 2024 20:34:42 +0100
X-ME-IP: 209.85.128.49
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-434a2033562so12858445e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Dec 2024 11:34:42 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUwggIbQIgnkdrGCdJMuYJmdDVgJyUsX+XvmoqAEc0Jo13BcJjsKnw4c7JaSg79kYHk9yYDCT0axdYPZslzEPfC@lists.infradead.org
X-Gm-Message-State: AOJu0YwCfwLsfj+gms0p6jduCinffH6lq3SB6le8O5YCKbEyZNVNER89
	oitc1BC2g0Y15S1TbzeSHJplmbYY7cyxUZVl3lbGPaVrfVMrbESEn0/26rq2XiY2wWMssQuFgR2
	BR0hGkrlouL0h5F6F1JFDshlOgVE=
X-Google-Smtp-Source: AGHT+IFEdpgbM9v1hEJyP58q1rp9/ynE8X6JLZXjVWzmdZJjAWTc9kp//N1g8Aq1Xn7w0wSLoLE1A73y8EJUIxU21wE=
X-Received: by 2002:a17:906:319a:b0:aa5:f288:e7e3 with SMTP id
 a640c23a62f3a-aa5f7d15684mr942250466b.15.1733412700594; Thu, 05 Dec 2024
 07:31:40 -0800 (PST)
MIME-Version: 1.0
References: <20241203-is_constexpr-refactor-v1-0-4e4cbaecc216@wanadoo.fr>
 <20241203-is_constexpr-refactor-v1-2-4e4cbaecc216@wanadoo.fr> <1d807c7471b9434aa8807e6e86c964ec@AcuMS.aculab.com>
In-Reply-To: <1d807c7471b9434aa8807e6e86c964ec@AcuMS.aculab.com>
From: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Date: Fri, 6 Dec 2024 00:31:29 +0900
X-Gmail-Original-Message-ID: <CAMZ6RqLJLP+4d8f5gLfBdFeDVgqy23O+Eo8HRgKCthqBjSHaaw@mail.gmail.com>
Message-ID: <CAMZ6RqLJLP+4d8f5gLfBdFeDVgqy23O+Eo8HRgKCthqBjSHaaw@mail.gmail.com>
Subject: Re: [PATCH 02/10] compiler.h: add is_const() as a replacement of __is_constexpr()
To: David Laight <David.Laight@aculab.com>, Martin Uecker <muecker@gwdg.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, 
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
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_113450_516664_AE883633 
X-CRM114-Status: GOOD (  44.19  )
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

-CC: Martin Uecker <Martin.Uecker@med.uni-goettingen.de>
+CC: Martin Uecker <muecker@gwdg.de>
(seems that Martin changed his address)

On Thu. 5 Dec. 2024 at 03:39, David Laight <David.Laight@aculab.com> wrote:
> > Sent: 02 December 2024 17:33
> >
> > From: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
> >
> > __is_constexpr(), while being one of the most glorious one liner hack
> > ever witnessed by mankind, is overly complex. Following the adoption
> > of C11 in the kernel, this macro can be simplified through the use of
> > a _Generic() selection.
>
> You should give credit to some of the earlier patches that do the same.
> I'm sure there were some related ones from Linus - not applied yet.

ACK. Would adding a suggested--by Linus tag solve your concern?

> > First, split the macro in two:
> >
> >   - __is_const_zero(x): an helper macro; tells whether x is the
> >     integer constant expression 0 or something else.
> >
> >   - is_const(x): replacement of __is_constexpr(); tells whether x is a
> >     integer constant expression.
> >
> > The split serves two purposes: first make it easier to understand;
> > second, __is_const_zero() will be reused as a building block for other
> > is_const_*() macros that will be introduced later on.
> >
> > The core principle of __is_constexpr() to abuse the return type of the
> > ternary operator remains, but all the surrounding sizeof() hack
> > disappear.
> >
> > On a side note, while not relevant to the kernel, __is_constexpr()
> > relied on the GNU extension that sizeof(void) is 1. const_expr() does
> > not use any GNU extensions, making it ISO C compliant.
> >
> > __is_constexpr() is temporarily kept and will be removed once all its
> > users get migrated to is_const() (or one of its friend).
> >
> > Signed-off-by: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
> > ---
> >  include/linux/compiler.h | 41 ++++++++++++++++++++++++++++++++++++++++=
+
> >  1 file changed, 41 insertions(+)
> >
> > diff --git a/include/linux/compiler.h b/include/linux/compiler.h
> > index a2a56a50dd85227a4fdc62236a2710ca37c5ba52..30ce06df4153cfdc0fad9bc=
7bffab9097f8b0450 100644
> > --- a/include/linux/compiler.h
> > +++ b/include/linux/compiler.h
> > @@ -316,6 +316,47 @@ static inline void *offset_to_ptr(const int *off)
> >  #define statically_true(x) (__builtin_constant_p(x) && (x))
> >  #define statically_false(x) (__builtin_constant_p(x) && (x) =3D=3D 0)
> >
> > +/*
> > + * Whether x is the integer constant expression 0 or something else.
> > + *
> > + * Details:
> > + *   - The C11 standard defines in =C2=A76.3.2.3.3
> > + *       (void *)<integer constant expression with the value 0>
> > + *     as a null pointer constant (c.f. the NULL macro).
> > + *   - If x evaluates to the integer constant expression 0,
> > + *       (void *)(x)
> > + *     is a null pointer constant. Else, it is a void * expression.
> > + *   - In a ternary expression:
> > + *       condition ? operand1 : operand2
> > + *     if one of the two operands is of type void * and the other one
> > + *     some other pointer type, the C11 standard defines in =C2=A76.5.=
15.6
> > + *     the resulting type as below:
> > + *       if one operand is a null pointer constant, the result has the
> > + *       type of the other operand; otherwise [...] the result type is
> > + *       a pointer to an appropriately qualified version of void.
> > + *   - As such, in
> > + *       0 ? (void *)(x) : (char *)0
> > + *     if x is the integer constant expression 0, operand1 is a null
> > + *     pointer constant and the resulting type is that of operand2:
> > + *     char *. If x is anything else, the type is void *.
> > + *   - The (long) cast silences a compiler warning for when x is not 0=
.
> > + *   - Finally, the _Generic() dispatches the resulting type into a
> > + *     Boolean.
>
> The comment is absolutely excessive.
> I'm sure I managed about 2 lines in one of the patches I did.

I think that Linus made it  clear in:

  https://lore.kernel.org/all/CAHk-=3DwgfpLdt7SFFGcByTfHdkvv7AEa3MDu_s_W1kf=
OxQs49pw@mail.gmail.com/

that this deserves a detailed comment.

The details block in the current __is_constexpr() is 37 lines long,
the details block in __is_const_zero() takes 22 lines. So I would
argue that I made things better.

Unless more people share your concern, I am planning to keep this comment a=
s-is.

> > + *
> > + * Glory to Martin Uecker <Martin.Uecker@med.uni-goettingen.de>
>
> IIRC Martin has agreed in the past that the accreditation can
> be removed - especially since it refers to the 'sizeof (void)' trick.

I tried to look for such message:

  https://lore.kernel.org/all/?q=3Df%3A%22martin+uecker%22+__is_constexpr

but couldn't find it. Do you have the link?

@Martin, do you agree that I remove the accreditation?

> > + */
> > +#define __is_const_zero(x) \
> > +     _Generic(0 ? (void *)(long)(x) : (char *)0, char *: 1, void *: 0)
> > +
> > +/*
> > + * Returns a constant expression while determining if its argument is =
a
> > + * constant expression, most importantly without evaluating the argume=
nt.
>
> You need to differentiate between a 'constant integer expression'
> and a 'compile time constant'.

OK. This one was just copied from the previous __is_constexpr(). I will app=
ly
"s/constant expression/constant integer expression/g" in v2.

> > + *
> > + * If getting a constant expression is not relevant to you, use the mo=
re
> > + * powerful __builtin_constant_p() instead.
>
> __builtin_constant_p() is not 'more powerful' it is testing for
> something different.

I meant to say that __builtin_constant_p() is more powerful at
constant folding. But I agree that the comment is not clear.

What about this?

  If getting a constant integer expression is not relevant to you, use
  __builtin_constant_p() which not only returns true if the argument
  is an integer constant expression, but also if it is a compile time
  constant.


Yours sincerely,
Vincent Mailhol

