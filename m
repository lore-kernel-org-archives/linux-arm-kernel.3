Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCB01C02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 10:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:
	Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DD+ssK7Im57vlq5FNxfqHbbrTwFIXn9O88i3TIuD0PI=; b=3NWm7ZlJyPGaHRFa50qABmtPtU
	Ya9SHnoTr3c67dRsmlttUdZc8VqJ04McoGCFvate4xJyUrJs+BiNmdH8u5nsjiAbgZa3SiAMi3gZ+
	Y0wCjSAAWERaOiI9PykJY1P7Bpkq7iLggkq1vnbeaE+NwQoddQoAXO93OH2UNB/1tPrwwBGMYgVa+
	Q3ZoEpLawYZWPBsBCXYOeI3zc3RS6UywnWDYISWxR98gSUi3BqDFlyWWBG+2B+IBLYg3BlYBxVdNA
	0ldMWWkdCFK3HuUjDEH8sg9NIdCvCA66Hkq8ITxNHxGMXNB57eSdoYCUnQI/GrrkOwqt2WJzDevHc
	yTxdzPOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tisxz-0000000EVvn-2jyD;
	Fri, 14 Feb 2025 10:30:39 +0000
Received: from mail-vk1-f170.google.com ([209.85.221.170])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tisvs-0000000EV90-3VUL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 10:28:29 +0000
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-52054c55991so1121520e0c.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Feb 2025 02:28:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739528906; x=1740133706;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DD+ssK7Im57vlq5FNxfqHbbrTwFIXn9O88i3TIuD0PI=;
        b=kb+KYDWG2aDp20Mpsop4QOSeEfhH6rIm1ZIcPqS7gafsaJpbOYFciMvsmcJQi2FIWo
         +GIXXhLoBZvUyAxFKaSx99yI11r2nvXOX4X25W93NeJHf9fsSFroTzxkaMTGmaBV0KNu
         nBfxo4rDTAFY2Mc9XNw10xgMawkfRDH6N9UMyKDByk0+FsUV179Ia7cWfCERCjuLi5Kc
         rKnBOTjOsi3LYiwU7XZyHB/lb2p63gu2+fg64miTK1zAk4DXnb5BHiVda2PvtpRpMP+J
         1EXT8Gq1i1j/LDYNYaU9PeWLCE7V0gpF21v1Sa4tob10MUcWBqApFIorEZ6NSU+kvubz
         j+zw==
X-Forwarded-Encrypted: i=1; AJvYcCXNcLfKEvOg4MGzYOWweJnnAWk69GYnoHvCy2tpujbvbL0XvB03N1yiGSAf4eknccTCv3f+0J0syjgL17rgWPyY@lists.infradead.org
X-Gm-Message-State: AOJu0Yzrf3oJED+YwY/XtBzUMon1tsMLmUwf+06niChW2SLxN7s3pv8r
	DAgWX+2s8DxuSBAo9LVomF3WkeipcN3EXNgRbyzYKqlg+0PImYMsfiXXnqUMU0g=
X-Gm-Gg: ASbGncvYpHgzcTuuzLqyi7Lhv27Xy+HhQ0gDc+4UFquB3BacsTyWFNIYD2Z+ao6izIs
	9w6+2jTs/n8LU8sLC2Cgzk5smNhBSHk6Tf5GxZbQdK4LXva0HTIjl9r3uD+MufvGytkF2oUQ8b0
	u+7+qHNwehhCOhguk5XqrAB1yDs66Wdl/ONrO/5d/k73qDjEpfvSV+LOBxV3IbjjGLRI/KKJqMP
	aBmSIEy66SFe8UQcQqVbPgxxw1QasuOqypMHIaoA+pxcdvcftT/dDxlIXAtirtuFUG+y3bVsYyz
	sO96rK6oqeNmK0cvlXBcEkAOtj4MQ3J0jqBYafnNul6P2YkTIlf3rA==
X-Google-Smtp-Source: AGHT+IEiSnrqUh0tpOugt8MtUFRDUcUBSEsXrtOQpFHChFjTYkJj3uNOpuuJPNj8MUu9wBCwQr8Gew==
X-Received: by 2002:a05:6122:2218:b0:50d:39aa:7881 with SMTP id 71dfb90a1353d-52078a353eamr4938000e0c.0.1739528906081;
        Fri, 14 Feb 2025 02:28:26 -0800 (PST)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com. [209.85.222.49])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5207aa60600sm533969e0c.13.2025.02.14.02.28.23
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Feb 2025 02:28:23 -0800 (PST)
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-868f322b8dfso712661241.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Feb 2025 02:28:23 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW5vPacy3LLmVI3PDcLeyl31qu2F2M2CaWNZUHcn+CBuPIn6zeRP7lH4RU6qy6hh31PAhq2nQhsA4xEWphlJ9Ix@lists.infradead.org
X-Received: by 2002:a05:6102:50a4:b0:4bb:ceeb:eaca with SMTP id
 ada2fe7eead31-4bc04dc0ad2mr4618891137.1.1739528903305; Fri, 14 Feb 2025
 02:28:23 -0800 (PST)
MIME-Version: 1.0
References: <cover.1738329458.git.geert+renesas@glider.be> <1824412519cb8791ab428065116927ee7b77cf35.1738329459.git.geert+renesas@glider.be>
 <20250131190335.4c18fb3c@pumpkin>
In-Reply-To: <20250131190335.4c18fb3c@pumpkin>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 14 Feb 2025 11:28:11 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVP+GBFMfd-C_7oiXHKSbycPv6adxJdM-Kt03+m9UqDiw@mail.gmail.com>
X-Gm-Features: AWEUYZm97sUT3mKi6JQWzWdUxKryfF3L2VZZmMQJHiBs0ICC7K3YkCuZ7Ruhdt0
Message-ID: <CAMuHMdVP+GBFMfd-C_7oiXHKSbycPv6adxJdM-Kt03+m9UqDiw@mail.gmail.com>
Subject: Re: [PATCH treewide v2 1/3] bitfield: Add non-constant
 field_{prep,get}() helpers
To: David Laight <david.laight.linux@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_022828_875167_B047A602 
X-CRM114-Status: GOOD (  33.53  )
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
Cc: Giovanni Cabiddu <giovanni.cabiddu@intel.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Crt Mori <cmo@melexis.com>, linux-aspeed@lists.ozlabs.org, linux-iio@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, Jaroslav Kysela <perex@perex.cz>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Shan-Chun Hung <schung@nuvoton.com>, linux-clk@vger.kernel.org, Lars-Peter Clausen <lars@metafoo.de>, Herbert Xu <herbert@gondor.apana.org.au>, Bartosz Golaszewski <brgl@bgdev.pl>, Takashi Iwai <tiwai@suse.com>, qat-linux@intel.com, Joel Stanley <joel@jms.id.au>, Jakub Kicinski <kuba@kernel.org>, Andrew Jeffery <andrew@codeconstruct.com.au>, Linus Walleij <linus.walleij@linaro.org>, Jacky Huang <ychuang3@nuvoton.com>, Yury Norov <yury.norov@gmail.com>, linux-sound@vger.kernel.org, linux-gpio@vger.kernel.org, Alex Elder <elder@ieee.org>, linux-arm-kernel@lists.infradead.org, Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-crypto@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>, "David S . Miller" <davem@davemloft.net>, Jonathan Cameron <jic23@kernel.org>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi David,

On Fri, 31 Jan 2025 at 20:03, David Laight <david.laight.linux@gmail.com> wrote:
> On Fri, 31 Jan 2025 14:46:51 +0100
> Geert Uytterhoeven <geert+renesas@glider.be> wrote:
> > The existing FIELD_{GET,PREP}() macros are limited to compile-time
> > constants.  However, it is very common to prepare or extract bitfield
> > elements where the bitfield mask is not a compile-time constant.
> >
> > To avoid this limitation, the AT91 clock driver and several other
> > drivers already have their own non-const field_{prep,get}() macros.
> > Make them available for general use by consolidating them in
> > <linux/bitfield.h>, and improve them slightly:
> >   1. Avoid evaluating macro parameters more than once,
> >   2. Replace "ffs() - 1" by "__ffs()",
> >   3. Support 64-bit use on 32-bit architectures.
> ...
> > diff --git a/include/linux/bitfield.h b/include/linux/bitfield.h
> > index 63928f1732230700..c62324a9fcc81241 100644
> > --- a/include/linux/bitfield.h
> > +++ b/include/linux/bitfield.h
> > @@ -203,4 +203,38 @@ __MAKE_OP(64)
> >  #undef __MAKE_OP
> >  #undef ____MAKE_OP
> >
> > +/**
> > + * field_prep() - prepare a bitfield element
> > + * @_mask: shifted mask defining the field's length and position
> > + * @_val:  value to put in the field
> > + *
> > + * field_prep() masks and shifts up the value.  The result should be
> > + * combined with other fields of the bitfield using logical OR.
> > + * Unlike FIELD_PREP(), @_mask is not limited to a compile-time constant.
> > + */
> > +#define field_prep(_mask, _val)                                              \
>
> You don't need an _ prefix on the 'parameters' - it doesn't gain anything.

I just followed the style of all other macros in this file.
I can add a new patch converting the existing macros, though...

>
> > +     ({                                                              \
> > +             typeof(_mask) __mask = (_mask);                         \
>
> Use: __auto_type __mask = (_mask);

Likewise ;-)

> > +             unsigned int __shift = sizeof(_mask) <= 4 ?             \
> > +                                    __ffs(__mask) : __ffs64(__mask); \
> > +             (((typeof(_mask))(_val) << __shift) & (__mask));        \
>
> There are a lot of () in that line, perhaps:
>
>                 __auto_type(__mask) = (_mask);
>                 typeof (__mask) __val = (_val);
>                 unsigned int __shift = ...;
>
>                 (__val << __shift) & __mask;
>
> Note the typeof (__mask) - avoids line-length 'bloat' when the arguments are non-trivial.

OK, thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

