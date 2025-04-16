Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59B15C369C4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 18:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sWQ82odYg4rALaAgqnCLAExm8ViQ8XuviYu9g41oMgY=; b=y9+CWTNzMszKKVxbhYlz3alsM5
	PojqUt4tOuiATgrq/I7T8Q9Xu9LUUeakXdAIsGaJH8UIfMt0ZgqTWFjUgjBlhQgd9UjxDXjl3r9YC
	ixgA/IKsg/cLpo5JytkP5IX4y3NvjMVrXGFtYBX7kSsTMlLBYIe+jQHg+CGvZnpHpCaQOm+T2vnq6
	INt9b1OkHXmmaVWgrO7mIE1z/NAPuQY2QOBWLZE4Rj/R55YFe9OvGjTzmSEb0F7vEm8E9oi8MCoyj
	5VfH4hhw5iEVt4sYr216P7Nnz8P1xF76bKTs4m3fi7bTVF+090PUqaRkJzLbifqhqRetFvEO1KxL4
	Kfp3tdfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u57qa-0000000AcJW-1sCs;
	Wed, 16 Apr 2025 18:50:56 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u57oi-0000000Abxn-1brw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 18:49:01 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-5e5c7d6b96fso13155650a12.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Apr 2025 11:49:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744829339; x=1745434139; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sWQ82odYg4rALaAgqnCLAExm8ViQ8XuviYu9g41oMgY=;
        b=ctRx21oiKFjdDLJkZAZM+fpqw+B1+0AnEEoi5updDIr2V4TRY5Vgg+5u9wg5Ub0NW3
         pdW/l5f8YrDgxrBDlQTRXK32SbmMd/l8mVq2Z0aFZWnYqMD5tZ45OnqYfYGyseG1+rDP
         BmvIoOEWSMmrFCjanXB9zbWo95rRObqu/JtgLhh18hqZpm5FiYhj6WRBXF2o0gxqMibD
         u0+6KdcZIDJ4d3KTe+0+8LcO1JK/gZI/7nzIPWwh0bslU54aAtTOpyHKuyyqoRs8J05M
         MCJITarD15EN+iiKGvj/rXzcgmkQrkjJpShlNCKdvzeRrXl33zl76E3sndmoj6AEaGJK
         45hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744829339; x=1745434139;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sWQ82odYg4rALaAgqnCLAExm8ViQ8XuviYu9g41oMgY=;
        b=tStunx98Mt1M1bM23Xak70V0CHBnub6AAJunRJvMWPglpgijMWtMuuwQztDcqB1rBH
         ACF0lXjmmaJfMrSVdMjuI9iIFUUx3sPOFDDF5LpxEjDsHWLdbnRz7awlOH3FLaReI7Ny
         RVvcgOFmSveWg+rzKWGL/UEay4RsjKFx2jl+TPw3Xur6sZXjgDcPyWP4knVdwn//M1Sl
         QBtYzzfcJFHpc2VeME8xtwa86UJmNK+yYkp7ZLwGNqs4MQIcyjwIsPAVPAtM+tSDwJy8
         emWE5Xmy4kbr6Ovqqg7I/ZHHC7zIPGEaVliKaO2NydTMQ65Z9r8UbrQw/fpMYj1hFuJM
         Dr0g==
X-Forwarded-Encrypted: i=1; AJvYcCXUOuVslMfp2PFMId0BwNk7rYEzapVir8K6cpwdQoQEkHpmFPP7DpsQbP6En3WBNm3euBkC1rg01AaxFrgfL9A/@lists.infradead.org
X-Gm-Message-State: AOJu0Yyge+IKW3xOkjLx4KNiAw87iIHvAuxBGoDN9K2g+9b9PnBklcne
	rTwzztl+gTvGnQQ3D7izk0HhfTNczYomRTmjDhNvfE6AOCOi4t3m/aT3xJyREAE=
X-Gm-Gg: ASbGncveOpypfGeQIFNjjT8Yu/1X1x1keRX4aOhyV6muf1NT7JojbhdE6fDwSSUM2BO
	ALv0D2eCHYUb17wOzs562eytzyE3iktpaQl06iQdpw5PrX3LXe6BxEjVfHgOgimj3ydYeeJf9wx
	9Kf0n2cdZ/+8g/qQmH9NTDrgpJJRQCzubsqrHlR1LFIzdDNqUyonOglof3u+RyIUbeDqMRB43wx
	C7DuvyfVYd7DhSN2q4Zv0nPCDQwfq1Lv8vH44VwojVZJM7d+Gpx0OKgOq+V+2HvFi+aqG2AEqx7
	AqfGSrRtRSrAusvN3QautjksQUP7NYRA2414yyy0tXSYd/YitDA83neRFS8OIr+DnBdg3Zw=
X-Google-Smtp-Source: AGHT+IFqmJdOPJLqDBbmxHa4DqyKzt2zjQMRwOR1WFej9DRiHJ4e5/qp3awrDfh34SZMze5F9yH1XA==
X-Received: by 2002:a05:6402:278d:b0:5f3:7fe3:6838 with SMTP id 4fb4d7f45d1cf-5f4b75d87ccmr2873138a12.22.1744829338542;
        Wed, 16 Apr 2025 11:48:58 -0700 (PDT)
Received: from localhost (93-44-188-26.ip98.fastwebnet.it. [93.44.188.26])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f4c72ecac8sm574252a12.44.2025.04.16.11.48.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 11:48:58 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Wed, 16 Apr 2025 20:50:20 +0200
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Andrea della Porta <andrea.porta@suse.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof Wilczynski <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
	Derek Kiernan <derek.kiernan@amd.com>,
	Dragan Cvetic <dragan.cvetic@amd.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Saravana Kannan <saravanak@google.com>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-gpio@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>,
	Herve Codina <herve.codina@bootlin.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>, Phil Elwell <phil@raspberrypi.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	kernel-list@raspberrypi.com
Subject: Re: [PATCH v8 09/13] arm64: dts: Add board DTS for Rpi5 which
 includes RP1 node
Message-ID: <Z__77DivbIHIPiNi@apocalypse>
References: <cover.1742418429.git.andrea.porta@suse.com>
 <c6498d8cf8dfade1980b566e99a9a91551fd8b53.1742418429.git.andrea.porta@suse.com>
 <526751d2-c7e8-4097-9454-c9049b880225@gmx.net>
 <Z__sMg-RJ6B-3OL4@apocalypse>
 <8da98fc4-f24e-40ba-b705-9faf31766398@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8da98fc4-f24e-40ba-b705-9faf31766398@gmx.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_114900_423783_FA08FE40 
X-CRM114-Status: GOOD (  36.43  )
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

Hi Stefan,

On 20:18 Wed 16 Apr     , Stefan Wahren wrote:
> Hi Andrea,
> 
> Am 16.04.25 um 19:43 schrieb Andrea della Porta:
> > Hi Stefan,
> > 
> > On 13:48 Mon 14 Apr     , Stefan Wahren wrote:
> > > Hi Andrea,
> > > 
> > > Am 19.03.25 um 22:52 schrieb Andrea della Porta:
> > > > Add the board 'monolithic' DTS for RaspberryPi 5 which includes
> > > > the RP1 node definition.  The inclusion treeis as follow (the
> > > > arrow points to the includer):
> > > > 
> > > > rp1-common.dtsi ----> rp1-nexus.dtsi ----> bcm2712-rpi-5-b-monolithic.dts
> > > >                                                  ^
> > > >                                                  |
> > > >                                              bcm2712-rpi-5-b.dts
> > > sorry for the delay. I'm not happy with the monolithic appendix.
> > > 
> > > How about bcm2712-rpi-5-b-rp1.dts or something more self-explaining?Regards
> > Sure, good catch. I'd go even further saying that we can rename (or merge if
> > the destination file already exists) as:
> > 
> > bcm2712-rpi-5-b.dts             ->  bcm2712-rpi-5-b-norp1.dts (or some better suffix other than -norp1)
> > bcm2712-rpi-5-b-monolithic.dts  ->  bcm2712-rpi-5-b.dts
> > 
> > so the monolithic one, which seems to be the 'safest' option as of now,
> > would be the default dtb. Do you think it could be ok?
> i like the idea (include rp1 into default dtb), but not a fan of negative
> logic in naming. Unfortunately I don't have better idea.
> 

Hmm ok... I'd propose 'bcm2712-rpi-5-b-ovl-rp1.dts'. Could it work?

Regards,
Andrea

> Regards
> > 
> > > > This is designed to maximize the compatibility with downstream DT
> > > > while ensuring that a fully defined DT (one which includes the RP1
> > > > node as opposed to load it from overlay at runtime) is present
> > > > since early boot stage.
> > > > 
> > > > Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> > > > ---
> > > > Right now bcm2712-rpi-5-b.dts is the overlay-ready DT which will make
> > > > the RP1 driver to load the RP1 dtb overlay at runtime, while
> > > > bcm2712-rpi-5-b-monolithic.dts is the fully defined one (i.e. it
> > > > already contains RP1 node, so no overlay is loaded nor needed).
> > > > Depending on which one we want to be considered the default, we can
> > > > swap the file names to align with downstream naming convention that
> > > > has only the fully defined DT called bcm2712-rpi-5-b.dts.
> > > Could you please move some of this good explanation into this dts file as
> > > comment?
> > Sure.
> > 
> > Thanks,
> > Andrea
> > 
> > > > ---
> > > >    arch/arm64/boot/dts/broadcom/Makefile                     | 1 +
> > > >    .../boot/dts/broadcom/bcm2712-rpi-5-b-monolithic.dts      | 8 ++++++++
> > > >    2 files changed, 9 insertions(+)
> > > >    create mode 100644 arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-monolithic.dts
> > > > 
> > > > diff --git a/arch/arm64/boot/dts/broadcom/Makefile b/arch/arm64/boot/dts/broadcom/Makefile
> > > > index 3d0efb93b06d..4836c6da5bee 100644
> > > > --- a/arch/arm64/boot/dts/broadcom/Makefile
> > > > +++ b/arch/arm64/boot/dts/broadcom/Makefile
> > > > @@ -7,6 +7,7 @@ dtb-$(CONFIG_ARCH_BCM2835) += bcm2711-rpi-400.dtb \
> > > >    			      bcm2711-rpi-4-b.dtb \
> > > >    			      bcm2711-rpi-cm4-io.dtb \
> > > >    			      bcm2712-rpi-5-b.dtb \
> > > > +			      bcm2712-rpi-5-b-monolithic.dtb \
> > > >    			      bcm2712-d-rpi-5-b.dtb \
> > > >    			      bcm2837-rpi-3-a-plus.dtb \
> > > >    			      bcm2837-rpi-3-b.dtb \
> > > > diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-monolithic.dts b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-monolithic.dts
> > > > new file mode 100644
> > > > index 000000000000..3aeee678b0bc
> > > > --- /dev/null
> > > > +++ b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-monolithic.dts
> > > > @@ -0,0 +1,8 @@
> > > > +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> > > > +/dts-v1/;
> > > > +
> > > > +#include "bcm2712-rpi-5-b.dts"
> > > > +
> > > > +&pcie2 {
> > > > +	#include "rp1-nexus.dtsi"
> > > > +};
> 

