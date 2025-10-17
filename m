Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7617CCD19A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 10:55:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XCpfZFAx3hiLnczCJXcXTR7Dek411X8RRc+fD4xQf5M=; b=gDLLLnLn4TcotW3P6haqyCICGL
	LuWcOrNqyEl7wV+R6qzmEP5ES8y6XCgS8pk9w899A3hB2e0whfoiq3neHmWIpylrSbq5PzqCOezLz
	L8reJjU4uJuJtZtLrA0hrvNcyzJO9AQzdbyd5DhD2jx6FCcP2hoPSg/U/+iECftDMDIbgBZu720p3
	G3aVAIYM1dLlD1u4/WBoQNs5fa/y83SyX/47m19Uju8dWPCr58CnLK22GozwZB9fWkDZw9qCa08zg
	deqbGvdizUdOVvB42o8cT5rKbZrJkDmJ/zFqSnTcDpbVdJPzXNXe9OB0S+JPiqgoshEhXcDMEIKH3
	ZNhTw/Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9i7C-00000007atI-3I8u;
	Fri, 17 Oct 2025 10:55:18 +0000
Received: from mail-vs1-f48.google.com ([209.85.217.48])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9i7A-00000007as6-0PKt
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 10:55:17 +0000
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-5d3fb34ba53so1398329137.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Oct 2025 03:55:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760698514; x=1761303314;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XCpfZFAx3hiLnczCJXcXTR7Dek411X8RRc+fD4xQf5M=;
        b=dMspSJwZkooHueFkkF79Wr30X3Jc5S1A0ZWWsE8EfJ0etZaFuc0672bFbaZHgUmdrI
         tidNBKIsjgxcscIomPXji6zl9GAbWYYyTnbkBNpkVCi8ClZrTrOhg9TBsme7i9GiP1LE
         qwP460rj68S4VtywaFno2SNSHzO26Z7ECy8K44vnmr1H1Hy3M7xICPktQibTlue7Hdhu
         Rv4JNsBGK+14H6fyzDpkzxOkhSpwGd+260c+j4ZgbaF8dYodqnHXB3ATj9aZoxtvky+p
         hLKU1CmiBhhJgyC9yHvifW+ZtObdJbjbZ9YTl9Go4Ya2c+bXZy90oCh5Cey9avl0tT+A
         WgLw==
X-Forwarded-Encrypted: i=1; AJvYcCW7n3TjxEYnPZHFiJzu5wXn77Onusnv2BYLtoZvoRza65AlN6LZG0kHxdp8Sbhsf0zYxVAf4FlZdbLlqRb8tlka@lists.infradead.org
X-Gm-Message-State: AOJu0YxnnK3nkDNhyAKjAXJ79QZkFl2/HaIAUVB81TbdhcAFXiYWixqe
	6SQFqbIXdRWuzuQetvhoRbkuBIU11bQb8rgMmOXrhw+DqzzMrY4yq6okm6QKaAuw
X-Gm-Gg: ASbGncvQDgAOJAsqjWqcuw3Gpq56iFPZgaBeiGfHsrlPlIp3BEidpt1kSVGtcp83sjQ
	z/2bz4xejB1bnpsmZIvvr/wDln5iVjKgo+KwfA7Z8oDU+IzYJBwW1Z3ZCAC1X3CTFqo07F+aWB3
	STSmmceKJCnrSkUMAX/vZx2HfKarmR1/i2UM3iEBsNJLXj/mwonVGWE6ifn1XKkKFlnsX8qO7Hk
	DznVh8CdjrmfFDXiZAYER7eIpYIC9NaYcUUG7/1XpqtkgqigRMpUqUsC5jagW//fFzxIrIFshVO
	8Si1hs6zDyun5BmP/oolIoejiEGhKHz7OZUD4D+X6uEFWuUq2z7Qk8FQuA2OPYwrvXKftH5MAbj
	Go5lLxtF4MaNgvCHQT2M70tE/3Te82Mdb3q9kYzUio78TtKHgZBfd0yWrLiqXTFtQIiVHWyPL/9
	dSo2DML2xhr+0Bf7ndI5aIaEoCNyU8uAGE7ORRzymUakLcfb/q
X-Google-Smtp-Source: AGHT+IEcEvSpsJGVVxSWUXvnX3oJ+Y8726Wk5PFky+bHFljAKW1s0wAqFZVxZQSPCU/IJdssykZ5+A==
X-Received: by 2002:a05:6102:3a0a:b0:5be:57a1:3eda with SMTP id ada2fe7eead31-5d7dd555917mr1535809137.2.1760698513464;
        Fri, 17 Oct 2025 03:55:13 -0700 (PDT)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com. [209.85.217.48])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-930bf76b8acsm6231369241.12.2025.10.17.03.55.11
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Oct 2025 03:55:11 -0700 (PDT)
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-5d967b67003so54478137.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Oct 2025 03:55:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXwgORvXPn37RqbKxSKeaEz3Yq87wq9S4UIF1E1WciF2Hq8E1tMjbhqVxp282rOcVqptZBrimxxS3I8w/hy84e0@lists.infradead.org
X-Received: by 2002:a05:6102:c49:b0:5a1:f09f:524e with SMTP id
 ada2fe7eead31-5d7dd59bcd6mr1313646137.16.1760698511065; Fri, 17 Oct 2025
 03:55:11 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1739540679.git.geert+renesas@glider.be> <2d30e5ffe70ce35f952b7d497d2959391fbf0580.1739540679.git.geert+renesas@glider.be>
 <20250214073402.0129e259@kernel.org>
In-Reply-To: <20250214073402.0129e259@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 17 Oct 2025 12:55:00 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU+0HGG22FbO3wNmXtbUm9RhTopYrGghF6UrkFu-iww2A@mail.gmail.com>
X-Gm-Features: AS18NWCjFk9wo7Q1aPnnkBYJzaq6xcQVQAXawyeid30N8a2RlJlAbXrKkziomTs
Message-ID: <CAMuHMdU+0HGG22FbO3wNmXtbUm9RhTopYrGghF6UrkFu-iww2A@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20251017_035516_148993_868A8DA5 
X-CRM114-Status: GOOD (  32.91  )
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

On Fri, 14 Feb 2025 at 16:34, Jakub Kicinski <kuba@kernel.org> wrote:
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
> I really really think that people should just use the static inline
> helpers if the field is not constant. And we should do something like
> below so that people can actually find them.
>
> diff --git a/include/linux/bitfield.h b/include/linux/bitfield.h
> index 63928f173223..e02afcd7aeee 100644
> --- a/include/linux/bitfield.h
> +++ b/include/linux/bitfield.h
> @@ -156,6 +156,80 @@
>                 (typeof(_mask))(((_reg) & (_mask)) >> __bf_shf(_mask)); \
>         })
>
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
> +}

Unfortunately gcc emits actual divisions or __*div*() calls, and
multiplications in the non-constant case.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

