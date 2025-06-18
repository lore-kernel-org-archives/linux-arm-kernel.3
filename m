Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A478DC7115B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 10:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UYnRFTZ45S0BZCYHJEL9/estxYeR2eD0JqS9fCRB9Zg=; b=xYcDesAlmx+d9DNZI4SKSMH3vY
	tFMhoBCfxvobpovkJll6pqcTYGGAca11UQG2iuw5JDgoLTXYY+lKfbYfo/9DpMa5HBMaYoDWJopIz
	iLEtyo61QTPBusOotWvVY0/FB8PcqlgJh6RVP6yd930cW69VCIwi+aUWesssfS4p4hCJGXE9I1zmM
	mboOVlos+PdDQi8XBlFgD0L5HxkUGZMHni/3Gz3Di4HC7UV3KQhU/PR2F1HyP6PB6M2puVcQUUozq
	ZBXAyu13BVxDjg2AQMgf0xWCg7zrW+Vvq87fqNKb8+Ju65W5DFOEH733mTS3pbJgy2I/C0J+ZBeRG
	MQTROUig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRpc7-00000009hBv-44de;
	Wed, 18 Jun 2025 10:01:51 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRpMR-00000009eEs-2W1n
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 09:45:40 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-ad89ee255easo1222250366b.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Jun 2025 02:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750239938; x=1750844738; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UYnRFTZ45S0BZCYHJEL9/estxYeR2eD0JqS9fCRB9Zg=;
        b=KAHVdk+DBg6mFdPQsIBhzS8xD2H0cfAeeIanEWG4SZb0zx3FK0cKoZPHbFI+EhvvgJ
         iyeAWPRV+NErkzwd2E2qX5Kn1RfYM8jwgRrrod8xoXM+2FX4wBb6JteL+YSFK9/tR7hn
         Dx9iQzwyzvow/xiK2Hd3BoOdF06DI7E1F3GmsGL4rYfl4IlH3ZDTQ7q/AWnUIyz8mD4K
         SG8zx7m774ylAjPszUHY+72FMTwcXsijQ0xhwWeOJzPjJnyGL0My0G8CsnSEGyYPJ2Y3
         sfL+UOxZEJc7xOaLo6XtXHMXSzeJgEqF0Ej8q+qpIcOa7ioPbvowQr6TO+OHA/mgNhYd
         iUHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750239938; x=1750844738;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UYnRFTZ45S0BZCYHJEL9/estxYeR2eD0JqS9fCRB9Zg=;
        b=pJfxuLr9neGm97Kof4QBLWxJPn1QlP8VhlKvEZd49leiCk3awlHlRxD1vXNnYuji7f
         46pk3VZDYUxtWIhjcTDyYC59NiufYtG7UqV/vA9dKaHEXY61mHFlMzRtTJojt/mjok3b
         Z8mjKoMQdcoh08S1mwgy/cUPfi2tSHDdHaShcFSc4yj+lRk2o31b4dVI0VNqMA/XHq2/
         ICFC9quoy547CctGjcE6PlC0lb0ZZQXJwZTHSTsCaK7vygzWPWhSp+sz1pBLN8rjzDBI
         Kwlgix43FweFDCEMI6LTe4FQqC6GJvTPxaNEMQAFkoaKZcrMToU7AmEWfk1uU+aGYept
         M9RA==
X-Forwarded-Encrypted: i=1; AJvYcCUbx4txndm2L6/aSbkgqiOYluTL3qVvTLFizOiugfeRSDuqnatd+6bqaTi4ArK1Xf8dAfg4or2YH0WnZ2JHaYu/@lists.infradead.org
X-Gm-Message-State: AOJu0YzAwOxdd9pGxoTH/+i60O9UvljAB0Iv+gs8Drja+1QSkmegFAvS
	g69zYr2dcVSJR17+2dBAOsL60+JaZdk+4EoneOh1BVBgG/1FefiKJW+QAQPX1pB5Nxs=
X-Gm-Gg: ASbGnct9r0ui4OdPuF/beQyoKqEg0P8XlIwPUmRPAJM+edFhdS5vthxO/YiFzbmEmC8
	RHpkCbRCL5dJEPhlzdvs2icsdctUDAqxZsnod2h+QFmXSXyVNaNXThm4YE8tJuKNy9vpsyjg2hD
	htx69L17amYALJbJ9BOBm9bIadzxtwpiV/F2iJzeIzKdJKt4LBw/RQQzvebC6/XFRcBksZq5MVA
	XkmE8q2ibvh7pAKCfNiJe1p6snaYbS3flao9SvjMNCCxANLjFLHrqa9fId/U0JXQCdNmOZy4KOb
	61i/Hk3bBxZtC5mIb3yzs5+mgQaBCNkUfUerrNZqyRB1XwOq2hCZBmW97auRNG+YidJMKj30h3P
	Y3uOh6gtT7d0jxnWIG8LRoKqPQAOKIX9UtWoYr6iHnoU=
X-Google-Smtp-Source: AGHT+IHVR01GWZaWv7baTcjU5O0kFwotFGhrlpvKdhdubFxB0wxEVad57csE1YDZMPi3+Mm5z4P0Fw==
X-Received: by 2002:a17:907:3c90:b0:adb:2577:c0c5 with SMTP id a640c23a62f3a-adfad5c74fdmr1544262766b.38.1750239938008;
        Wed, 18 Jun 2025 02:45:38 -0700 (PDT)
Received: from localhost (host-79-23-237-223.retail.telecomitalia.it. [79.23.237.223])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adec8158d4dsm1015674366b.28.2025.06.18.02.45.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 02:45:37 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Wed, 18 Jun 2025 11:47:16 +0200
To: Bjorn Helgaas <helgaas@kernel.org>
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
	Stefan Wahren <wahrenst@gmx.net>,
	Herve Codina <herve.codina@bootlin.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>, Phil Elwell <phil@raspberrypi.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	kernel-list@raspberrypi.com, Matthias Brugger <mbrugger@suse.com>
Subject: Re: [PATCH stblinux/next 2/2] clk: rp1: Implement ramaining clock
 tree
Message-ID: <aFKLJELw3JuFI9GR@apocalypse>
References: <b70b9f2d50e3155509c2672e6779c0840f38ad5e.1750165398.git.andrea.porta@suse.com>
 <20250617145144.GA1135520@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250617145144.GA1135520@bhelgaas>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_024539_636743_02AACB12 
X-CRM114-Status: GOOD (  17.86  )
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

Hi Bjorn,

On 09:51 Tue 17 Jun     , Bjorn Helgaas wrote:
> On Tue, Jun 17, 2025 at 03:10:27PM +0200, Andrea della Porta wrote:
> > The RP1 clock generator driver currently defines only the fundamental
> > clocks such as the front PLLs for system, audio and video subsystems
> > and the ethernet clock.
> > 
> > Add the remaining clocks to the tree so as to be completed.
> 
> In subject, s/ramaining/remaining/

Ack.

> 
> I guess we actually get some functional benefit here (something that
> previously did not work, will start working after this patch)?  It
> would be good to mention that here.  "Completing the tree" sounds
> nice, but if I were being asked to merge this, I'd like to know what
> benefit it brings.

Sure, I will add details in the next revision.

Many thanks,
Andrea

> 
> Bjorn

