Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A634C02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 11:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:
	Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sOhOeuJi5yrz4/2ECZyl6aYLZu4BPC+rC7vskT2goxo=; b=FkhTfIGPjFiIJWZersMgiqL8bZ
	A92Rf5hKEOiLJp3iuZqrcyHCxYPi+qwqqre5X91RX6s7+JqqZvfjy1UxIsR/piTt9eCVXBvEtF07t
	1kFM8znUDmB7Os21FYzFhnqVKVbKFLGgWkV+VdYpT8HGr5t0/UK+9ybO2eFfKZI4KX8pzDpNmoTak
	pR+88rG5gzb6FjW5rCRoWJu30wPI0jqQDPIbZIlMzNUfpF3voAyIevP6H1Pu6rrIqkku9aKzP37mt
	cJ+rcHldE9EjEuC1vdbE5V5jsA9siNQudSisNgfIlNrIg/kr2CzzvLbxG/3ehOEzTuXdCZIGyOv3u
	mk0qg3hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1titSo-0000000EbCr-23i8;
	Fri, 14 Feb 2025 11:02:30 +0000
Received: from mail-vk1-f181.google.com ([209.85.221.181])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1titRN-0000000Eaw5-0MlO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 11:01:02 +0000
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-51faf3342b3so532925e0c.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Feb 2025 03:01:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739530859; x=1740135659;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sOhOeuJi5yrz4/2ECZyl6aYLZu4BPC+rC7vskT2goxo=;
        b=JSKliRElo2ytyGtw0ET/08qTj19V4r8ngEGRj5uGaqhBLhL5rluQ49X+jjOCtW1C+5
         UaRkAz1wcl4fQdCI5ZB7zZJcyJypOuNdtI5rQOkVMUO1IKE8PJSJPxkMC8+6hC14vXa6
         5JJwGNKt/C9oepflx9G3JoT3uJojfktjOCH9Xv7kL7uIoxulHyyTGkqXnaeCHum5cE9p
         keARS93mCLnpi6bTaU6tBoyy4hXLtemH+E4qquC5Pl7iY+7Pn87SYvNNbE0zGj2s6/rQ
         Mu4ThyBY9y9I19EJn3mSa0kHD6vxQ1uq/JOyw96b+dp3wS3G5YkIzgetl3qVgX5KkPpw
         I7mw==
X-Forwarded-Encrypted: i=1; AJvYcCWgHsKwCKm0icFQKYgv6NM28dD0MRrBqG6JqcNPk0NQlSIc26J0xSGZTmvfL42cfU3E7o//BaAJOD0PVw4JX82g@lists.infradead.org
X-Gm-Message-State: AOJu0Yy9Cq3ZnMcTsbAgclF3tafAfUenJzsTS9f/MLrZH4A+huRJVcry
	lGzmvhFk3EE9zGKvVy9bBfD5i1ao9nuOUlkI/m4boDni4FZHStyxUsl+0iTLpv8=
X-Gm-Gg: ASbGncvE2ncN39JzW7qo0rpPQVRXtlIhOmfsquTFoVr0jIviwZ1rnm86nKOgGBOSb1c
	HYnRbSdwy3kMcAHqSAY6KdH1T59vTKNioBmLVJ0lAYukUH4mn2xmIn3znG2Dhfnup8X2dPMX4v4
	bioT5MsvzM94nRI7fUSD+MxG3ZJ9QcpEr+7QIY2kwe+mvUmcvJiLExPfdudH4KZnLe/eKNrmiiX
	aElm/gM1OlXSKHPQFpUIMft2bNZVb7cHI/B5mFI6lNHr7oRmMecxYSoWF7KRCHX11SQUWbxND8v
	lX1NfU54Sg0GEs1YqlNEss5jZEcXghUPQsvketCXkho6Lgg2INZAoA==
X-Google-Smtp-Source: AGHT+IEZHIfPA48zqzbwv3dQDGRLELlBwkYSI4r0o68M9K7AT7ZXyNphw7pPgOsj158XSBA9ZovZ5w==
X-Received: by 2002:a05:6122:829a:b0:51f:4139:c30f with SMTP id 71dfb90a1353d-52067d8d86amr9257201e0c.11.1739530858959;
        Fri, 14 Feb 2025 03:00:58 -0800 (PST)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com. [209.85.217.49])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-52098c98d26sm17861e0c.8.2025.02.14.03.00.58
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Feb 2025 03:00:58 -0800 (PST)
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-4bbd554fe87so509841137.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Feb 2025 03:00:58 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXjCwACfAahQkswYWz0yXiYbTV7/uS1bMv6eJZDo0+aCPcXGQGFOsLFW95DGud9ewtadx7anwvdQe8gmXI/Pj4j@lists.infradead.org
X-Received: by 2002:a05:6102:32c6:b0:4b2:adfb:4f91 with SMTP id
 ada2fe7eead31-4bbf2312e79mr9166519137.21.1739530858000; Fri, 14 Feb 2025
 03:00:58 -0800 (PST)
MIME-Version: 1.0
References: <cover.1738329458.git.geert+renesas@glider.be> <1824412519cb8791ab428065116927ee7b77cf35.1738329459.git.geert+renesas@glider.be>
 <e20a177a-30cd-4088-89e1-b479aba1356c@wanadoo.fr> <20250204073011.5f6ca125@kernel.org>
In-Reply-To: <20250204073011.5f6ca125@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 14 Feb 2025 12:00:44 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWe1Fe4ZvWHB1tf_NQNg6W9PmJzpEK_28g+ix9an3jw_Q@mail.gmail.com>
X-Gm-Features: AWEUYZljxHasbqOWVQ67DCDXNharhoOj8Y29FWByT7hZT_VuVaki-I-AuDEVuCo
Message-ID: <CAMuHMdWe1Fe4ZvWHB1tf_NQNg6W9PmJzpEK_28g+ix9an3jw_Q@mail.gmail.com>
Subject: Re: [PATCH treewide v2 1/3] bitfield: Add non-constant
 field_{prep,get}() helpers
To: Jakub Kicinski <kuba@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_030101_130246_EC2BFC52 
X-CRM114-Status: GOOD (  25.89  )
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
Cc: Giovanni Cabiddu <giovanni.cabiddu@intel.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Crt Mori <cmo@melexis.com>, linux-aspeed@lists.ozlabs.org, linux-iio@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, linux-kernel@vger.kernel.org, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Shan-Chun Hung <schung@nuvoton.com>, linux-clk@vger.kernel.org, Lars-Peter Clausen <lars@metafoo.de>, Herbert Xu <herbert@gondor.apana.org.au>, Bartosz Golaszewski <brgl@bgdev.pl>, Takashi Iwai <tiwai@suse.com>, qat-linux@intel.com, Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, Linus Walleij <linus.walleij@linaro.org>, Jacky Huang <ychuang3@nuvoton.com>, Yury Norov <yury.norov@gmail.com>, linux-sound@vger.kernel.org, linux-gpio@vger.kernel.org, Alex Elder <elder@ieee.org>, Jaroslav Kysela <perex@perex.cz>, Vincent Mailhol <mailhol.vincent@wanadoo.fr>, linux-arm-kernel@lists.infradead.org, Stephen Boyd <sboyd@kernel.org>, linux-renesas-soc@vger.kernel.org, linux-crypto@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>, "David S . Miller" <davem@davemloft.net>, Jonathan Cameron <jic23@kernel.org>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi Jakub,

On Tue, 4 Feb 2025 at 16:30, Jakub Kicinski <kuba@kernel.org> wrote:
> On Sun, 2 Feb 2025 17:26:04 +0900 Vincent Mailhol wrote:
> > On 31/01/2025 at 22:46, Geert Uytterhoeven wrote:
> > > The existing FIELD_{GET,PREP}() macros are limited to compile-time
> > > constants.  However, it is very common to prepare or extract bitfield
> > > elements where the bitfield mask is not a compile-time constant.
> >
> > Why is it that the existing FIELD_{GET,PREP}() macros must be limited to
> > compile time constants?
>
> Hard no, some high performance networking drivers use this on
> the fastpath. We want to make sure that the compiler doesn't
> do anything stupid, and decomposes the masks at build time.
>
> The macros work just fine for a *lot* of code:
>
> $ git grep -E 'FIELD_(PREP|GET)\(' | wc -l
> 22407

Indeed.

> BTW aren't u32_get_bits(), u32_replace_bits() etc. not what
> you need in the first place? I think people don't know about
> those, with all due respect the way they are coded up looks
> like an IOCCC submission..

These support only compile-time constants, too.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

