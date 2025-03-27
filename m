Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0422C3600B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Mar 2025 09:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7lMrOeFxPSKQEwncRkG8y8bWLBwAZMVmj9Oxg/obSPg=; b=qC1KePXAgBAVQnTj6Ut9Al5+IJ
	ydXAg9FJ8+/viRTfgQ6RPZbyDUZ5+/neBTXbjQLbqebMuUYO0PDyroefd4gfHNAh2Qk/Ngvl2SGMu
	XQNxocdVE33QYuIkuYLnfTGxxeUJ5MHo9hywLfCfYzM5UDiqJJdhdyKw/9r3rEDrBl5ncYTkH1sbw
	fCqfsLYUwBJdmp854sC7G9wUz3FX5bqpIuiZmGiMp9wtVPKY+YeMKEggluLvBXxU8U/QPpEr5OR2d
	YPMBK9xMziRb8pQEebuUpgd7ZDZ2vh63x2XC8UkWbGAc9TiJN/hCmY1B3ZgA+4oCwC0XOvibx3rgl
	az4ACv9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txjFX-0000000AX9I-1d2m;
	Thu, 27 Mar 2025 09:10:07 +0000
Received: from mail-vk1-f175.google.com ([209.85.221.175])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txjDo-0000000AX09-2ZKb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Mar 2025 09:08:21 +0000
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-5242f137a1eso248800e0c.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Mar 2025 02:08:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743066498; x=1743671298;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7lMrOeFxPSKQEwncRkG8y8bWLBwAZMVmj9Oxg/obSPg=;
        b=sHeb5D/DCTvxfqd5fWZeokeUpHlcPaw47E94wxl7Nu18S/fStRvnGhC+C3w/5OeLV8
         nWXa77pjgjM2R+0m3hvfDRyfQGYIyl9dplRllGjhiAdaWG2Z3QxK6LrjImiApW+xK3cj
         xM+Sn/2mHsGA57SiMOApN2qLq6oBHihgASdziW7QKIVPH5i2zuVAH1bNBh3IkXxRBd0m
         +JqO9NYnTCPLTKKDsZr0g80JIdNc0IYmdTyvcILBSlIuj3Wu04hhHBWCqX1EF4m5oWLU
         fQgaBaBoiDy/w7GaQJkrs805WesTLzD9wX2zsrEzAbbDQvFTsPjxsLV+7rhyGXZJo5T7
         HmTg==
X-Forwarded-Encrypted: i=1; AJvYcCV4zabT/nrffcUr4JlMSndQhZBvu2szqvMX1MBOwsPGYVsQAB61rwP9Z0JhG56j+QpjCjZkQpKXiKkpNhOKhniJ@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/9d1O7reZ0Z89GL8SYgm0o2YFglig5COL4wwTQ/VZvrS3laZq
	ie++BebeukjNC7sj+7T7VMKozdxk2l23uHOgbPvVO0uzgzbkqcDZZGdWTJ3dkQk=
X-Gm-Gg: ASbGncsyjhoN5xyiMHFhsxr5No027hTXTyLsrsBzr84Br3aUk70Xy0YT3zB2RCPX7la
	kn5W3nugafvUZvD7k+88Yaj6yCDYdkrU6mG5PztSMNDisb91uRHxRNGYJQZbUrU/FUdHOVJ38Ls
	tBUTBjv0jSMtlC1DKfPyCeo9NecnNiGSAhf2c/y06LfxPbI+OhzblpfwP2Ovh1lqCVg/98Y2+w9
	urWkqPBvJWmSiVtOrqlhgmdNj8keL3MmTUJ77ed7pWvUTNHs8rcgos7gL0NWK/rlFWyDvGfn83L
	YavudHze39qAyHtukuKNaPd7c1rEQfTDbsHmmGrAjc7o1O4Fcx0X9gvZLnYVlabDNqX/QPTilOi
	cT3aymhI=
X-Google-Smtp-Source: AGHT+IG0HV59z3epIbfw3pOwTsWJ8FDDFn6cVGjMOYsqbb3uvMfFwg7Z9EWJy8NbWCTlJPm6GboaZg==
X-Received: by 2002:a05:6122:401b:b0:520:6773:e5c5 with SMTP id 71dfb90a1353d-52600a3ec62mr2218047e0c.7.1743066498078;
        Thu, 27 Mar 2025 02:08:18 -0700 (PDT)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com. [209.85.222.50])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-525a7645dc5sm2549961e0c.31.2025.03.27.02.08.17
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Mar 2025 02:08:17 -0700 (PDT)
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-86d3805a551so369199241.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Mar 2025 02:08:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWvGrZonp7Z2qNYJpx9c2sjb06H8vo6GhCihUJnW65/i7QUsdROiaIs4pD2UH6LRIw6RbkwyIDwpyPPuhOeVg+H@lists.infradead.org
X-Received: by 2002:a05:6102:4a81:b0:4bb:c4ff:5cb9 with SMTP id
 ada2fe7eead31-4c586fa8f21mr2548472137.15.1743066496881; Thu, 27 Mar 2025
 02:08:16 -0700 (PDT)
MIME-Version: 1.0
References: <20250326143945.82142-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250326143945.82142-16-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <41c6f512-47a5-4723-bbdc-64ed85ae8391@kernel.org> <CAMuHMdVKfL-FRhDaFfOACV8R=ziqXdhmeW7Xd4WYXqHnSbR0ZA@mail.gmail.com>
In-Reply-To: <CAMuHMdVKfL-FRhDaFfOACV8R=ziqXdhmeW7Xd4WYXqHnSbR0ZA@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 27 Mar 2025 10:08:05 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU5HSt5cRN8WFB5DrOZjo+Fc55X5bB6V6GzFT_Akiqdrw@mail.gmail.com>
X-Gm-Features: AQ5f1Jo3lRIg1W6_ThZ_8jOIWrU0aCRCv9UzPJYRRcdVuf2lBsxdUWR2mmZthkU
Message-ID: <CAMuHMdU5HSt5cRN8WFB5DrOZjo+Fc55X5bB6V6GzFT_Akiqdrw@mail.gmail.com>
Subject: Re: [PATCH 15/15] arm64: defconfig: Enable Renesas RZ/V2N SoC
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Prabhakar <prabhakar.csengg@gmail.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mmc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250327_020820_649767_21F5B08F 
X-CRM114-Status: GOOD (  30.24  )
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

On Thu, 27 Mar 2025 at 09:55, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Thu, 27 Mar 2025 at 08:43, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> > On 26/03/2025 15:39, Prabhakar wrote:
> > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > >
> > > Enable support for the Renesas RZ/V2N (R9A09G056) SoC in the ARM64
> > > defconfig.
> > >
> > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > ---
> > >  arch/arm64/configs/defconfig | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> > > index 11e7d0ad8656..c7b41f86c128 100644
> > > --- a/arch/arm64/configs/defconfig
> > > +++ b/arch/arm64/configs/defconfig
> > > @@ -1483,6 +1483,7 @@ CONFIG_ARCH_R9A07G054=y
> > >  CONFIG_ARCH_R9A08G045=y
> > >  CONFIG_ARCH_R9A09G011=y
> > >  CONFIG_ARCH_R9A09G047=y
> > > +CONFIG_ARCH_R9A09G056=y
> >
> > So the pattern will keep growing and none of you will ever bother to fix
> > it, because you have your patchset to throw over the wall.
>
> Yes, the pattern will keep on growing.
> Just like the minimum kernel size will keep on growing, especially if
> you can no longer compile a kernel without support for SoCs you do not
> intend to run the kernel on.  Not everyone has GiBs of RAM to spare...

<pling! :->

/me remembers
https://lore.kernel.org/all/6323eb7a-03e9-4678-ac4f-f90052d0aace@kernel.org/

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

