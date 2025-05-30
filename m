Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80634C5B543
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 May 2025 23:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UVan/pxs+as8xODMpc1TMcwQmUA/UQGQ+vVSz/HOxgM=; b=0ujgEbmqNA2VrdprgFEJp1jaq6
	GjhkowPPmsmYd1Und1To+aRpyjV7P9i832VLp0lWjHd+G4q4XO+Jyyv1PB8QP0CnrJ6aT5Coxg8AU
	sMmtGYa3xDF4w7ag13z9HuNW02SImsA7fBGFy8fhBPndiRAKaBej/iSBVcH0OWp1fo7+/Cr3OGuP3
	wKDKCuxFnr6rA3kvF7k1ev/K8/voz89B7zRG3AYv69nhPlp6W4x0Lg85j8SwoxcAhZgaTtiPUhBnu
	w3Oqujj0N6XbSBGlnsnjjpUiRfOrDb4kEREv7piB1du052dCBfpqNLsQFdQ32aK5fvA6fgOC6Vcar
	IctH5rcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uL9V6-00000002V3b-41QS;
	Fri, 30 May 2025 23:51:00 +0000
Received: from relay.smtp-ext.broadcom.com ([192.19.144.207])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uL9Kt-00000002Qcy-2BxI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 May 2025 23:40:29 +0000
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id B1AA2C003AB8;
	Fri, 30 May 2025 16:40:26 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com B1AA2C003AB8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1748648426;
	bh=HFiVtogORiAI/oF4a+jzZLzZYQ+/3mOas55PYUhzW9I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Xau7hgHNWZ/bUsjnADjxg13st9ZnP1ECq6XKHIdiZ6Uj/0aS/POb5yDLG55eUKwjh
	 5dYiccTqa6Sl3s+K7owrmJSZT6FAxkijkif2Lg/DMK1nUxpRK7MQ++iYniFbfDMUnn
	 qDsBKxxPXOwOrpjwT0skAxSmiqzm6PQ/S9yHxdg8=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id 2749B18000530;
	Fri, 30 May 2025 16:39:56 -0700 (PDT)
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
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
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
Subject: Re: [PATCH v12 06/13] arm64: dts: rp1: Add support for RaspberryPi's RP1 device
Date: Fri, 30 May 2025 16:39:55 -0700
Message-ID: <20250530233955.465160-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250529135052.28398-6-andrea.porta@suse.com>
References: <cover.1748526284.git.andrea.porta@suse.com> <20250529135052.28398-6-andrea.porta@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250530_164027_639799_183287FB 
X-CRM114-Status: GOOD (  13.47  )
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

On Thu, 29 May 2025 15:50:43 +0200, Andrea della Porta <andrea.porta@suse.com> wrote:
> RaspberryPi RP1 is a multi function PCI endpoint device that
> exposes several subperipherals via PCI BAR.
> 
> Add a dtb overlay that will be compiled into a binary blob
> and linked in the RP1 driver.
> 
> This overlay offers just minimal support to represent the
> RP1 device itself, the sub-peripherals will be added by
> future patches.
> 
> Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/devicetree/next, thanks!
--
Florian

