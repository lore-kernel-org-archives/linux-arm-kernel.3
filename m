Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D278FCCD199
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 16:06:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D4mf9FdrvOGmLornKgNki0gXD9BcM6SCmzEl3gfV4Zs=; b=l4hSmmWRHCDrXQ7iGTDctmOXZ6
	NZd0UPzH6+DCTZgd6oEldTxkuNGFHSHu4+ZYZfLYregVOSJnyyjagF8VcDsjQli8g4yF4nxZ8tZce
	Er4qNpF1IXlml0WGS19esk8lsOLTIRKH7qqsKpeDtPucZTvBinhUhHA0hI1gc7qWu4y7sSOZ+jTGA
	wxLYcELmisgOjV4GXIz3CNkbYAX0bellsGyhBAGHdfK30X7ULcfF1w18Au5PlkyL89sCL0nAUXm49
	5TTHbRuyk+WZF7gpIjiOojQFHKGk4NuOlneVnMLkHbWZgCOSuCNFZSu3Lwk8tHY1UPxBbznb9Y2T/
	ZBxRSzWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9myh-00000008NCr-2G92;
	Fri, 17 Oct 2025 16:06:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9myg-00000008NCe-3UUr
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 17 Oct 2025 16:06:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:Subject:Message-ID:
	Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=D4mf9FdrvOGmLornKgNki0gXD9BcM6SCmzEl3gfV4Zs=; b=Hzjc49iyw9W2DUnSmMdrOuiil3
	Tzg8YfqGYUK+wwsf2Lgl4TsUAJRgHwO54xxC+N4wREDWmgP1U1yCi1fgOtFIi5ln2nMdi0PKy9eG/
	23Cz8MovqJdrk41Gh29fAItIugw5dn8A5OS6z9qYmcgzaFODPLMcYnAaMoljwMBfetuL4nRphYpM6
	cgPsid86eTVusUKdeLN7L6/qFlUKFoZ59R4gg8fXPFMvaRoJID+tURjyudoZWK9iQR8mFNJ6OdwDb
	6nlRsvREs6+LAH2b+JFZl7npPpnc7sKKpvTkWte4JRNRUg8Vm0EcRhu1zWLvHm8qgZfy6OcmEvXgb
	pKvyKHJQ==;
Received: from mail-oi1-f179.google.com ([209.85.167.179])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9myU-00000007it8-2zMy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 16:06:46 +0000
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-4439f1cb764so882465b6e.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Oct 2025 09:06:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760717194; x=1761321994;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D4mf9FdrvOGmLornKgNki0gXD9BcM6SCmzEl3gfV4Zs=;
        b=vBX9Dak/DVDmPImf76AU+twFFw+pR1p7K3ljCm8a74FYVIeLA8fYO5pDh6c0E3Wbn3
         Os1Dzck0K0SZbpb0dPYQfxyi2ER1Qw0GZbVIE/qDLe9/H2GE1sjHbJ0zFwGMsyk5RGWo
         xcWSiMjO72Wmq7MrZxWFnsiAaKUvCad3Jv7tCKIz45VCyX0YMIBDk23sIr/DA+tQJosT
         eDFkPDXuyXu1aKROdN1uUS0z5HKftD7lCHKXQUR9nzeXVS2UITOEKob9BDBqeSkkLJKa
         oyn9OC+8yUCBwiek7AQI7J3w3K1C1hmNA4GRoPRyvQahE4U2dpVOmOUt0AWDsm7BXXqV
         lH+Q==
X-Forwarded-Encrypted: i=1; AJvYcCVQ6oEFGyIz8KLC8j4nZinxbBGiWkiGl3ImktKowSAUf/qoU1vWd30w805DG4fVI/rRQJyDDw6UngkTrcE6oS83@lists.infradead.org
X-Gm-Message-State: AOJu0YwNueOY01oEjaq3CvLqhfX419g1OTjwJaYVrcfDfBwD/1mREW0F
	I51c9NBdWoqYeYLcutasBbrpatfvzV3XMxqL/qtKyyMBoJpJgB1LOtXgwGl9BiTu
X-Gm-Gg: ASbGncvqOdscpYxC1mywS6EkXeW8Dht35YlgVwLNJ8CggGKWMPo5baWP8pMSMRcfryh
	Iwc2fmlyn7ioi4CLQ8YvXMvJgLxVTajDilyHB0efDk54g3QpsWS9wavj+0puc84ZllQLslyYW23
	jwBDYezsL7YxmtxNTpKXTCmPXgqUs418fsCGgsZTUdqrP46mtBenD7aehLq/ra/PUFfEOS3W2//
	dpPCys0b7I+a9DJ9YY2Ggt5ntRmng9xUX6reP1HBA6t47ruC6v9xG+uGJoo9iuXQ5+/PTSmvHb3
	tDaTZ9YcoZGcVIBXQYSMcby91hpwmPAfOvfcom/Fnj7LQvg2K01Jc6FrFVC0D7vxCPcrZar9dFv
	PKQW8UZhhwt3ml9ndklkEZS03QEPc8nuRS48Lz/F1NvBmAw7xSsNGVx5/UBDGnpV92/XuEvrkum
	XyJYXUlQ7Dgy18kXAKQXT51aHyalvrrFYrHKo1AomMRA==
X-Google-Smtp-Source: AGHT+IGIaEPP0Wqv9M703acPKyppA4XXxL7Zu3kx7n5B6eFM+5Y0ukIFkwtZldshB6yY3Jp7LCpZxg==
X-Received: by 2002:a05:6808:250a:b0:43f:65da:73e6 with SMTP id 5614622812f47-443a313a0a9mr2036481b6e.45.1760717193469;
        Fri, 17 Oct 2025 09:06:33 -0700 (PDT)
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com. [209.85.167.182])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-443a6e690d2sm494588b6e.13.2025.10.17.09.06.33
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Oct 2025 09:06:33 -0700 (PDT)
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-4439f1cb764so882451b6e.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Oct 2025 09:06:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWnbW6THMGeQXNtzf5mo0XLkP/kDoldnlPhiivS62ZP8grEn4q6Xg4uAO+C/FRaEXH7iYP3XC8ibDcDA8A6Qn74@lists.infradead.org
X-Received: by 2002:a05:6102:40c6:10b0:5d7:dec6:389a with SMTP id
 ada2fe7eead31-5d7dec64177mr1309355137.9.1760716852567; Fri, 17 Oct 2025
 09:00:52 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1739540679.git.geert+renesas@glider.be> <2d30e5ffe70ce35f952b7d497d2959391fbf0580.1739540679.git.geert+renesas@glider.be>
 <20251017081912.2ad26705@kernel.org>
In-Reply-To: <20251017081912.2ad26705@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 17 Oct 2025 18:00:41 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVS5KmVkv_pmc+R-EXik-Z1_7nuiHM=vm1Cu8v91wmLBQ@mail.gmail.com>
X-Gm-Features: AS18NWD4CQztq7yi6j63q-9XtnW0otWo2wOw8z0_Fp7R-6z_qrlZWB5IqFYEbBg
Message-ID: <CAMuHMdVS5KmVkv_pmc+R-EXik-Z1_7nuiHM=vm1Cu8v91wmLBQ@mail.gmail.com>
Subject: Re: [PATCH treewide v3 2/4] bitfield: Add non-constant
 field_{prep,get}() helpers
To: Jakub Kicinski <kuba@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Giovanni Cabiddu <giovanni.cabiddu@intel.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	David Miller <davem@davemloft.net>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Crt Mori <cmo@melexis.com>, 
	Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, Jacky Huang <ychuang3@nuvoton.com>, 
	Shan-Chun Hung <schung@nuvoton.com>, Yury Norov <yury.norov@gmail.com>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Johannes Berg <johannes@sipsolutions.net>, Alex Elder <elder@ieee.org>, 
	David Laight <david.laight.linux@gmail.com>, Vincent Mailhol <mailhol.vincent@wanadoo.fr>, 
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org, linux-crypto@vger.kernel.org, 
	qat-linux@intel.com, linux-gpio@vger.kernel.org, 
	linux-aspeed@lists.ozlabs.org, linux-iio@vger.kernel.org, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Jonathan Cameron <Jonathan.Cameron@huawei.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_170644_338023_72E5F0F2 
X-CRM114-Status: GOOD (  36.98  )
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

Hi Jakub,

On Fri, 17 Oct 2025 at 17:19, Jakub Kicinski <kuba@kernel.org> wrote:
> On Fri, 14 Feb 2025 14:55:51 +0100 Geert Uytterhoeven wrote:
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
> >
> > This is deliberately not merged into the existing FIELD_{GET,PREP}()
> > macros, as people expressed the desire to keep stricter variants for
> > increased safety, or for performance critical paths.
>
> We already have helpers for this, please just don't know they exist :/
>
> The "const" version of the helpers are specifically defined to work
> on masks generated with BIT() and GENMASK(). If the mask is not
> constant we should expect it to have a well defined width.
>
> I strongly prefer that we do this instead and convert the users to
> the fixed-width version:
>
> ---->8----------------
>
> Subject: bitfield: open code the fixed-width non-const helpers so that people see them
>
> There is a number of useful helpers defined in bitfield.h but
> they are mostly invisible to the reader because they are all
> generated by macros. Open code the 32b versions (which are
> most commonly used) to give developers a chance to discover them.
>
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>

Thanks, but this is more or less the same code which you suggested
before [1], and to which I just replied[2] after looking at the
generated assembler output on various architectures.

> @@ -188,6 +193,81 @@ static __always_inline u64 field_mask(u64 field)
>         return field / field_multiplier(field);
>  }
>  #define field_max(field)       ((typeof(field))field_mask(field))
> +
> +/**
> + * u32_encode_bits() - prepare a u32 bitfield element (non-const)
> + * @v: value to put in the field
> + * @field: shifted mask defining the field's length and position
> + *
> + * Equivalent of FIELD_PREP() for u32, field does not have to be constant.
> + *
> + * Note that the helper is available for other field widths (generated below).
> + */
> +static __always_inline __u32 u32_encode_bits(u32 v, u32 field)
> +{
> +       if (__builtin_constant_p(v) && (v & ~field_mask(field)))
> +               __field_overflow();
> +       return ((v & field_mask(field)) * field_multiplier(field));

Unfortunately gcc emits actual divisions or __*div*() calls, and
multiplications in the non-constant case.

So I don't think this is suitable as-is.

> +}

[1] https://lore.kernel.org/all/20250214073402.0129e259@kernel.org
[2] https://lore.kernel.org/all/CAMuHMdU+0HGG22FbO3wNmXtbUm9RhTopYrGghF6UrkFu-iww2A@mail.gmail.com

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

