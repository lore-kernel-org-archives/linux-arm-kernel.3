Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ACA7C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 16:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hfsayn1suRAdKExU2SCJOYW20rvzhbLzUZJDd33jhGs=; b=y5zwLsVOFw8P+qtd2/8c8gJbHp
	rAW2Rdq6EOPfh591wJCsSNmDdY3c+x6BtYLTmAU1QA+8iH+XSOAcLcNBzNQT51B2XLBllIBogJG81
	DeQgLot57JegI5PsK+c6mEtDkqJ/l9heYZiwTGJMFZtBBfbhLBEkIwczb99Xqf0jXyc+ZHhqe7Gea
	jflPCjG8iPHTNUUJeJuhASbMdCn3sXz59+1/mHROf+8vgf357L/IXJ0RCtPHwj7EVLzdu+lInf9iK
	7lDd05hqLKOdasOZeFRDE1yUpEcfdvaqynYDevKLW5TAASCb1MTzdoFeuHl4Cz+rKvCnFmWtChr9w
	HnsFmLlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX0j8-000000092Lb-1Txx;
	Wed, 02 Jul 2025 16:54:30 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX0Du-00000008wCV-33cD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Jul 2025 16:22:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2668A454DB;
	Wed,  2 Jul 2025 16:22:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF392C4CEE7;
	Wed,  2 Jul 2025 16:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751473334;
	bh=Hfsayn1suRAdKExU2SCJOYW20rvzhbLzUZJDd33jhGs=;
	h=In-Reply-To:References:Subject:From:To:Date:From;
	b=pFslyyS3LTpJJt1LBlZ8liCXxnD9ohZn4e1Bp97jeZRXI0T45dPWirbfLvb2jOT1B
	 UebJ9q/f1bX9/WvKykTVX7VZrMtmOlno6D8yHsjOruEVNtmDXQ91LxQKJ9re6NXHl8
	 rP9bog3oApPfY7sbY3XLyibBR8zqAAkYSvfERWRSp6Bn9tkczQAejx/5lM6I5J6oPZ
	 Z4B5HxPojk/G+F/lgXGbh6rOrkVTsxQEQNIsRWG1eUCA32dngSS8yovG/LXCnrxetg
	 OqsQSBJbbFL2j788cBZN0AL5TyZt/nNZopHi/fgbjH6ACXB3n+hMsw49jS9bevqlC0
	 w+LPb6L2QUBag==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <17e5c6e0c085cfa0bf4b63b639cdc92c6a4c1418.1750714412.git.andrea.porta@suse.com>
References: <c20066500908db854aa4816b40e956296bab526a.1750714412.git.andrea.porta@suse.com> <17e5c6e0c085cfa0bf4b63b639cdc92c6a4c1418.1750714412.git.andrea.porta@suse.com>
Subject: Re: [PATCH v2 stblinux/next 2/2] clk: rp1: Implement remaining clock tree
From: Stephen Boyd <sboyd@kernel.org>
To: Andrea della Porta <andrea.porta@suse.com>, Andrew Lunn <andrew@lunn.ch>, Arnd Bergmann <arnd@arndb.de>, Bartosz Golaszewski <brgl@bgdev.pl>, Bjorn Helgaas <bhelgaas@google.com>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Catalin Marinas <catalin.marinas@arm.com>, Conor Dooley <conor+dt@kernel.org>, Dave Stevenson <dave.stevenson@raspberrypi.com>, Derek Kiernan <derek.kiernan@amd.com>, Dragan Cvetic <dragan.cvetic@amd.com>, Florian Fainelli <florian.fainelli@broadcom.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Herve Codina <herve.codina@bootlin.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Krzysztof Wilczynski <kw@linux.com>, Linus Walleij <linus.walleij@linaro.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, Luca Ceresoli <luca.ceresoli@bootlin.com>, Masahiro Yamada <masahiroy@kernel.org>, Matthias Brugger <mbrugger@suse.com>, Michael Turquette <mturquette@baylibre.com>, Phil Elwell <phil@raspberrypi.com>, Rob Herring <robh@kernel.
 org>, Saravana Kannan <saravanak@google.com>, Stefan Wahren <wahrenst@gmx.net>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Will Deacon <will@kernel.org>, devicetree@vger.kernel.org, kernel-list@raspberrypi.com, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org
Date: Wed, 02 Jul 2025 09:22:13 -0700
Message-ID: <175147333319.1004940.14279071596597163164@lazor>
User-Agent: alot/0.11
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_092214_786129_4A7E0BF1 
X-CRM114-Status: GOOD (  11.35  )
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

Quoting Andrea della Porta (2025-06-23 14:46:28)
> The RP1 clock generator driver currently defines only the fundamental
> clocks such as the front PLLs for system, audio and video subsystems
> and the ethernet clock.
>=20
> Add the remaining clocks to the tree so as to be completed, which means
> that the following RP1 peripherals could now consume their specific clocks
> and be enabled to work (provided that the relevant driver changes for each
> specific peripheral, if any, are committed):
>=20
> - ADC
> - Audio IN/OUT
> - DMA controller
> - I2S
> - MIPI DPI/DSI
> - PWM
> - SDIO
> - UART
> - Video Encoder
>=20
> Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> ---

Reviewed-by: Stephen Boyd <sboyd@kernel.org>

