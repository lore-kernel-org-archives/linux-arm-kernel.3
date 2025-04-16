Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D18E5C369C4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 18:42:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hf73Zqm591Z4cwB1QMdZKpjmrpXWTvATJ+WgcmCQVhs=; b=iBFEbFnd1a8xomd4vxU42Yh7tk
	Ugyt+sPn1GrOZauXTtyHb7WA9O7khNA7SEL1SktjzhE1TNnGY25y8fE/pPN19LhkshNls0QSCfm+G
	NqdY+aiHKEFVhH1f6rhr+/0/r57Mq511BE8g7s8i+qcdiMoQEFxFRIAjofD7JgNNvTJVI7r8RYkBc
	K5ztuZ9qIw4zscBsr662Bzgzr87wPhJlLGKWXrnsi2VOfg8b0TYNa1nqT1vXv/QQalyNYtGo93Z3p
	idTiWEQUUHVSuwO7OPBfro9E7+3izxB9njhhQCvper7hbq3M66aPH2YCtaU9m6UbQSNTeZK+jzSRg
	xh1UFUrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u57iR-0000000AazH-4BD3;
	Wed, 16 Apr 2025 18:42:31 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u57gH-0000000AaUV-1gg8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 18:40:18 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-ac29fd22163so1141393766b.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Apr 2025 11:40:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744828815; x=1745433615; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hf73Zqm591Z4cwB1QMdZKpjmrpXWTvATJ+WgcmCQVhs=;
        b=FSocyMw8G/OMOj1weqARjc0igF0HnlSElNc3V2fkPRHU3iJX/MLzRYovxw5jKSFE8+
         MxohbvsPi8g4v8gf61bD05/0cIaz3g8VbTEqzErFsLWt/18o9MdAIT2mrmG5sb96SS2c
         pTRaig01rvUxpLEcCd/OlB+Saum6yVNjtY8w2JgLfaAe9BFv1/LpYBkTBvUSPzeZDPoy
         sDhAqqOMSh9F475YJc5C5Xp7gr2TaX6NBZujtNvub1DDTTydovRcD1kTxU1n90m2iLaY
         DY4ANFCcgJmYRYZ7fWZ/X5yh573jb6UGssks2Nz2DYg8jl2nr2lsjtk8GbTU0s9KZWfx
         yQkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744828815; x=1745433615;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hf73Zqm591Z4cwB1QMdZKpjmrpXWTvATJ+WgcmCQVhs=;
        b=uCkjk8N+7vSjIs9MHKwe2N7lwfCLcf25CAfawnn7W8b1cAZJAKWLgt5TSgTdCOrRQT
         cCq10D6jS7T4UnRCBWkszpeDFnV1fRuT58G4kExAf0RvbjxhHLr78Kdx9WYEPjjNzBS9
         UlPEGYL6RgtgZLWSPS5LhNOhuNytMJYDHgx2HfcA2jQ4QVNL6yYmiTPazPxUvfTe+y4A
         V6p9GO4eQVa2MC4WmLSzOHpHJail0CrWObx8OQfT0JaerzXt4v4McWFxtwIGiOGKUUhI
         Vs2zoEH5u8zOGdUBgPG5BZv/DcSPjfADOiuwzTOwS3RwERsg7aQbx6N/YxTPMFSJGmST
         O5bA==
X-Forwarded-Encrypted: i=1; AJvYcCWtlK3Fhgxow35QsK5/GSo12rAzZtfpfRJ2VCnCQ/EyJWJHM17PsY8tWUor2XiES6QaxvxRd9kCR1NGNdCLI2w2@lists.infradead.org
X-Gm-Message-State: AOJu0YxjRdR5MVyKUrIyMtk1xN5KPdt/AwHXkqWvrhxtr9caLwqgce55
	c7CYfgHB5HgMTSggsHdzhxKMcF1fD5r4jizMJPJuPwzHbLnrT4Ccs62fv0kIvpU=
X-Gm-Gg: ASbGnct+lLjtBESBgYG3HZx50cW5xOBfoiBK9bvGWrK2ZWZsGOq7s/zFbp8dy/WtD/a
	C81P4vDcEy9en0xdJMoqvJ1PLMHGQcOp5xnbFAxzpjQp1vzjD206ADNWyCiAGiCewqcs6YHs4ao
	nx+RzR/lQHjm0ukvpM/jXZu5IvX0xvh/AnRpdKwnYk1KYLhSPXjaVvwZT0CjcrUhGachzI9neoM
	wdTU0VnDiPjF9X18JnyvoU86Ifv6gg8ojE9QBXexcqAglZRPUG+xtZOmRZEoWgw87akkNkjaIc0
	3e1804kkyoHpgCuj6D0mzYSLcE4RlvgwCuUmVoJl7orUVknxEXbcs23LOhk0xx50T6w3MLY=
X-Google-Smtp-Source: AGHT+IHvwwjkQBu7DihmtTvqsvfxr52Defd8zqRFD9EThPH0EkutvTV+muEgyvB55Eg0nTCHnjLeIA==
X-Received: by 2002:a17:906:f5a9:b0:ac2:cf0b:b809 with SMTP id a640c23a62f3a-acb429ed4d2mr324522566b.31.1744828815585;
        Wed, 16 Apr 2025 11:40:15 -0700 (PDT)
Received: from localhost (93-44-188-26.ip98.fastwebnet.it. [93.44.188.26])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb3d34a5a8sm174672666b.183.2025.04.16.11.40.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 11:40:15 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Wed, 16 Apr 2025 20:41:37 +0200
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
Subject: Re: [PATCH v8 11/13] arm64: dts: bcm2712: Add external clock for RP1
 chipset on Rpi5
Message-ID: <Z__54c628WTjznoG@apocalypse>
References: <cover.1742418429.git.andrea.porta@suse.com>
 <7c26a0b52e00a39930ba02f7552abdd1be4c828c.1742418429.git.andrea.porta@suse.com>
 <45c1a50c-2ecd-4201-85e5-9a0e94f06fa3@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <45c1a50c-2ecd-4201-85e5-9a0e94f06fa3@gmx.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_114017_443506_DA2A1463 
X-CRM114-Status: GOOD (  20.06  )
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

On 13:55 Mon 14 Apr     , Stefan Wahren wrote:
> Hi Andrea,
> 
> Am 19.03.25 um 22:52 schrieb Andrea della Porta:
> > The RP1 found on Raspberry Pi 5 board needs an external crystal at 50MHz.
> > Add clk_rp1_xosc node to provide that.
> > 
> > Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> > Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
> i'm fine with the patch content, but I think this is necessary before
> Patch 9 is applied?

True. Thanks for pointing that out.

Cheers,
Andrea

> > ---
> >   arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts | 7 +++++++
> >   1 file changed, 7 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
> > index fbc56309660f..1850a575e708 100644
> > --- a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
> > +++ b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
> > @@ -16,6 +16,13 @@ chosen: chosen {
> >   		stdout-path = "serial10:115200n8";
> >   	};
> > 
> > +	clk_rp1_xosc: clock-50000000 {
> > +		compatible = "fixed-clock";
> > +		#clock-cells = <0>;
> > +		clock-output-names = "rp1-xosc";
> > +		clock-frequency = <50000000>;
> > +	};
> > +
> >   	/* Will be filled by the bootloader */
> >   	memory@0 {
> >   		device_type = "memory";
> 

