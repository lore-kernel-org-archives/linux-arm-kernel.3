Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CAEBCCD195
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 11:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zPE9WHNZsdRI3QmdRcH/wWeYzKksV+R5Ry8aWltKbjU=; b=GvD5Ip4l7FD4RRCQK6HgW6gOyx
	ynLld/3uXB2I2oqhEWDiQP9kQUfabblQ51/MjVubqffKkS0qB6tSYB+aet0woC8uKhD12GTXp8STP
	1Z/2/+9qH4w4WAMzA58jW5ViGOp9wDhFs8Oo0zl1a7JVik1Yt2l9mDTYIrFlYlRHqJLD832gouoDE
	EbLOky4FvDvHKj8AFUetVRrLuDx5NTwZ8GDh2oALNzP9ewKQlOk+hFu+sLUBdAgNCcbDlCgGeiwPQ
	MWBV8Sdpw2ZMkCoq3EINwPVofW5+HxOydUec372jEKpJWwBaOGBuPJKAN9b2aiOtEDGM/vmackJNW
	P1UIGeew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9iCg-00000007bkQ-05YH;
	Fri, 17 Oct 2025 11:00:58 +0000
Received: from mail-pg1-f173.google.com ([209.85.215.173])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9iCd-00000007bjO-2eR3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 11:00:56 +0000
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-b551350adfaso1598923a12.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Oct 2025 04:00:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760698854; x=1761303654;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zPE9WHNZsdRI3QmdRcH/wWeYzKksV+R5Ry8aWltKbjU=;
        b=bTFknuJgtaJKuAzIDxBDyv7oYBElD5MRtxgmP6XTD6ilMtT+VtQrtNpbqhowGhFAgy
         PGcGQ0V4pOsEMz7ovTLn2jXeTF4iHpaSMkoxa9XJfv2jhJfZSQZdta/m/5AhiL8SIkOE
         sXjidGcil6yYPFsSHZg/LB/QKVCEf/1ark9MYzvOS20AcULUI9m5FIfaOs0mTgrfTU1H
         WgAKMeB4Mw5wo1xgLQ1jvIDLqRRoEET842R3uwMZrsoszCrBvetmt0y+cafBGsYRTfhw
         s5DmqoXRxh0SR2GEaQGvZ83jFuqXd7e4ICjC80bm6yuSjIlgAfl+jGRiYtH3pXye+siK
         UK5Q==
X-Forwarded-Encrypted: i=1; AJvYcCVHP3pSUme7N28plAZVnjr4asJ+fqa39n8/QYtrZnXdbITwg3a1sDPDeH3YbwZE1NyhBaO2ww2eo281GdQkDZU0@lists.infradead.org
X-Gm-Message-State: AOJu0Yyhd492DeAMx7Dn4uyeBbMIUFZWI8fMZV1FETgLITmmGy3eqH+g
	Gg/XjtvB0yWVYEOhC4zppOmQ3dVzyqSl+mJO0bT3fYQjpBb5HBl5yw1OsA+405GS
X-Gm-Gg: ASbGncv/keAKvMkhUog9bdzKDe8+4q2BgKCM/rxjgcr9LftwHESnxlUDYojfUtbG1vC
	CLTHbTgEEn5M94LIUb9t2c0tV+dq+0jWLPqh5DgwY4AqxB7KociowRRmbQB/3LdtNpOK/Ri4X2K
	pOYES0tjfT9zowkhpe4JiTvARtlj49cvFNulr8U35iUAkeIbBvyfZspfEzxAShtENiiS77uWxhS
	vFoUQX0HEE/TgID8rdbsBx0XrbK6qerQ5rpuSLuhGqiKJDxEON6f/k19RHkTfl8hwTLN9ZRt+TE
	3d5R5hNP27mLISs5ocBv7UkGIqnXRoX6OmZuY8qgMY/Wp5EZsB6bPvh4LWq0caW8ZAGWb2M6iBv
	crciFr8AXNV2Z7t0b+Cfq6z+tNaFXxiB7TDh2TmOWNSlIOn5PYrcUD+ZzVge62dMxBLdmDr2Jo+
	9h3bA+w9Ecv8P4H3bbvWlglEYMRVPBtSPWk8kmeACGvjXICiNT
X-Google-Smtp-Source: AGHT+IG4BkezgtKKLdHgFAiuDNaPxCkSI9dZDVrSJ9x6n51IDfQCCykwIkgwWv9YUvhBts3rYrMI5A==
X-Received: by 2002:a05:6a21:329a:b0:334:823a:ff2e with SMTP id adf61e73a8af0-334a85b9f90mr4893013637.40.1760698854290;
        Fri, 17 Oct 2025 04:00:54 -0700 (PDT)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com. [209.85.216.45])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6a228a5b78sm5674713a12.14.2025.10.17.04.00.53
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Oct 2025 04:00:54 -0700 (PDT)
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-33bb0472889so1929902a91.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Oct 2025 04:00:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVjvTXJUPtigRo2UwEBZ+8o655la4o0dyzm2G5yVtMOVH9AfRmzNAfmc2egyTtC0T84rsRS1sDgW8ImkKxusoJn@lists.infradead.org
X-Received: by 2002:a05:6102:5111:b0:5d5:f766:333e with SMTP id
 ada2fe7eead31-5d7dd5934demr1126362137.15.1760698513447; Fri, 17 Oct 2025
 03:55:13 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1739540679.git.geert+renesas@glider.be> <2d30e5ffe70ce35f952b7d497d2959391fbf0580.1739540679.git.geert+renesas@glider.be>
 <20250214073402.0129e259@kernel.org> <20250214164614.29bbc620@pumpkin>
In-Reply-To: <20250214164614.29bbc620@pumpkin>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 17 Oct 2025 12:55:02 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXost7vL5uTocMGtrqhEk5AY3QUWvyP5w7_hBtf3MkMfA@mail.gmail.com>
X-Gm-Features: AS18NWAcP6voBjoIoEi-7RxJ0pdmzXqhfe5FdHBNP60R0y-DyUBofdEL44euygw
Message-ID: <CAMuHMdXost7vL5uTocMGtrqhEk5AY3QUWvyP5w7_hBtf3MkMfA@mail.gmail.com>
Subject: Re: [PATCH treewide v3 2/4] bitfield: Add non-constant
 field_{prep,get}() helpers
To: David Laight <david.laight.linux@gmail.com>
Cc: Jakub Kicinski <kuba@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Giovanni Cabiddu <giovanni.cabiddu@intel.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	David Miller <davem@davemloft.net>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Crt Mori <cmo@melexis.com>, 
	Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, Jacky Huang <ychuang3@nuvoton.com>, 
	Shan-Chun Hung <schung@nuvoton.com>, Yury Norov <yury.norov@gmail.com>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Johannes Berg <johannes@sipsolutions.net>, Alex Elder <elder@ieee.org>, 
	Vincent Mailhol <mailhol.vincent@wanadoo.fr>, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-crypto@vger.kernel.org, qat-linux@intel.com, linux-gpio@vger.kernel.org, 
	linux-aspeed@lists.ozlabs.org, linux-iio@vger.kernel.org, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Jonathan Cameron <Jonathan.Cameron@huawei.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_040055_672084_BAD243FB 
X-CRM114-Status: GOOD (  30.52  )
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

Hi David,

On Fri, 14 Feb 2025 at 17:46, David Laight <david.laight.linux@gmail.com> wrote:
> On Fri, 14 Feb 2025 07:34:02 -0800
> Jakub Kicinski <kuba@kernel.org> wrote:
> > On Fri, 14 Feb 2025 14:55:51 +0100 Geert Uytterhoeven wrote:
> > > The existing FIELD_{GET,PREP}() macros are limited to compile-time
> > > constants.  However, it is very common to prepare or extract bitfield
> > > elements where the bitfield mask is not a compile-time constant.
> > >
> > > To avoid this limitation, the AT91 clock driver and several other
> > > drivers already have their own non-const field_{prep,get}() macros.
> > > Make them available for general use by consolidating them in
> > > <linux/bitfield.h>, and improve them slightly:
> > >   1. Avoid evaluating macro parameters more than once,
> > >   2. Replace "ffs() - 1" by "__ffs()",
> > >   3. Support 64-bit use on 32-bit architectures.
> > >
> > > This is deliberately not merged into the existing FIELD_{GET,PREP}()
> > > macros, as people expressed the desire to keep stricter variants for
> > > increased safety, or for performance critical paths.
> >
> > I really really think that people should just use the static inline
> > helpers if the field is not constant. And we should do something like
> > below so that people can actually find them.
>
> Especially since you really don't want to be calling ffs() on variables.

It is not that bad, as most temporary architectures have an instruction
for that.

> Much better to have saved the low bit and field width/mask.

While that would allow some space saving (only 10 or 12 bits needed to
store low + width), gcc would generate quite some code to create the
mask (even on PowerPC, where I expected a single instruction would
do ;-).


Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

