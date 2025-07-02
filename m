Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53414C83038
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 18:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GmTsP+YmfNnuMWQQbypuFXWsaI2JGqqspfnoeDbXH7A=; b=DJ+sZBypL7U327eU3Z8oENTEfd
	uz23G12H7tXWLswTzL51ul5PE1eGRm63d/Vqm2iul/PZQlcvfxpWzctsSjT0TVG3oxniNDALZAu6+
	jZhszv/tz1e8Phc9l+FTlVbySzFnpyuZxylNxKaBVI5ENHJJlrFJFEtJ90jQV/gd8n6zl4M0uUG/h
	wCR8U5stetMAQB0TXR75GjGp6XcFMIkDQC1nbp0MNoE73jaX4Xov7zedpPYXH9BEXCpsPNXLCDLxx
	JdAxvLGsOxx1kq13KdDthcx2gNOtcuPqKf27kNwKZBWjLIssqjjovDcXldmrZJoL0YyzgELHAVAhU
	CK8iZ7hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX1lZ-00000009DGm-1cnb;
	Wed, 02 Jul 2025 18:01:05 +0000
Received: from relay.smtp-ext.broadcom.com ([192.19.144.207])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX1h4-00000009CYF-2T3P
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Jul 2025 17:56:28 +0000
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id BB7CBC0005DE;
	Wed,  2 Jul 2025 10:56:25 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com BB7CBC0005DE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1751478985;
	bh=2JufP1vE8BWmTAgWOhaC6QCXSRwArHKrkTbWIH5lo3k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=K6gmh1XIas7rreYOGWF7e3SvInmhH2x5EqJ8fTop24IEcvYAba46WnkVkN7rc6yEp
	 /uUZ3+WYmmWIKQ774jCOcjs0taXYigqQJHmXMu/tqDcjSA1Mn8gtwsBqtWTK2CDov7
	 hXnDTHl3HihzK5EDb1UDRtMuy552ayRhE5gSuj1I=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id 30F1118000A5F;
	Wed,  2 Jul 2025 10:56:25 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: bcm-kernel-feedback-list@broadcom.com,
	Andrea della Porta <andrea.porta@suse.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof Wilczynski <kw@linux.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Derek Kiernan <derek.kiernan@amd.com>,
	Dragan Cvetic <dragan.cvetic@amd.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Saravana Kannan <saravanak@google.com>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Herve Codina <herve.codina@bootlin.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Phil Elwell <phil@raspberrypi.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	kernel-list@raspberrypi.com,
	Matthias Brugger <mbrugger@suse.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH v2 stblinux/next 2/2] clk: rp1: Implement remaining clock tree
Date: Wed,  2 Jul 2025 10:56:24 -0700
Message-ID: <20250702175624.1714748-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <17e5c6e0c085cfa0bf4b63b639cdc92c6a4c1418.1750714412.git.andrea.porta@suse.com>
References: <c20066500908db854aa4816b40e956296bab526a.1750714412.git.andrea.porta@suse.com> <17e5c6e0c085cfa0bf4b63b639cdc92c6a4c1418.1750714412.git.andrea.porta@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_105626_693943_26B5CC80 
X-CRM114-Status: GOOD (  14.34  )
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

From: Florian Fainelli <f.fainelli@gmail.com>

On Mon, 23 Jun 2025 23:46:28 +0200, Andrea della Porta <andrea.porta@suse.com> wrote:
> The RP1 clock generator driver currently defines only the fundamental
> clocks such as the front PLLs for system, audio and video subsystems
> and the ethernet clock.
> 
> Add the remaining clocks to the tree so as to be completed, which means
> that the following RP1 peripherals could now consume their specific clocks
> and be enabled to work (provided that the relevant driver changes for each
> specific peripheral, if any, are committed):
> 
> - ADC
> - Audio IN/OUT
> - DMA controller
> - I2S
> - MIPI DPI/DSI
> - PWM
> - SDIO
> - UART
> - Video Encoder
> 
> Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/drivers/next, thanks!
--
Florian

