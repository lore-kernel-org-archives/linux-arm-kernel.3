Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99443C2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 May 2025 11:24:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZEsqiemneZI+AU3cTt3mng1ZVDC1GiTfBQhHVwejIXM=; b=1zl02yBhiPi1UEdBKoCFDpn2Wr
	i+prNAmZvOB07o9LaTQNg8y8RFR3+GCHsQTbkouSFD2ASWqK+uPwJekjeA9fQUlubueWrcP18kwjt
	m+SCTwD0zpPwunHMdsh5HvBrto16vCJhIiPOGTmKpIyipVvrdTg7vSN3E2GpKuvphcvG2qt2XXtdV
	kDibsxM7Db2V5q6MPrgEHQFpyTaV5iTbS2+wjswHh/STKSf45MPCekPyUw1RWHqmZdF9dEcXfQ4HD
	xjc8CH8tZw37WNHZergh75ch5ANfxMUyV13UgmP5dQxPg1ZREdCzioKK5wqq2RIl59ke6s3U8lYpd
	IR+Tr+Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGybH-00000008ysu-3dMy;
	Mon, 19 May 2025 11:24:07 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGyYW-00000008yZH-0DEf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 May 2025 11:21:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=ZEsqiemneZI+AU
	3cTt3mng1ZVDC1GiTfBQhHVwejIXM=; b=jy60X/F4hCCcdr5dQIh2u4zmxgLQkF
	VEp32TNN/A0oPxvDiS6RjY/IfB72VQUg+T7elrMH5q2BP+ONQMlsubgV3Aicurkl
	ntDy1NI/rgJc0iA8jl2OlT/H9fEG1MwTJ47Xhzavk6FBsHMTVp2ttrfpEbpTNOLO
	J6oEadiUhd00CMzOkubw2WFflrhfzc/vmJGzGXI3+rMLCBsdUpfD/Q4FvAV/K18Z
	BP92IaiBPj14fG9QZVsHdnmds4Gl0M/Dbe+90XKUSiNQtCA7KeTr3t4xgJBLqd5A
	cN2MWupH42fMb5gRM54wV9NC1M6Efp8GRSAiZpJ5LYeH4JcOnRnyeaxQ==
Received: (qmail 2456768 invoked from network); 19 May 2025 13:21:09 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 19 May 2025 13:21:09 +0200
X-UD-Smtp-Session: l3s3148p1@1hMnVHs1VMJZz6+V
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Gregory Clement <gregory.clement@bootlin.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Rob Herring <robh@kernel.org>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Subject: [PATCH 0/4] ARM: dts: use recent scl/sda gpio bindings
Date: Mon, 19 May 2025 13:21:02 +0200
Message-ID: <20250519112107.2980-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_042116_361484_0239D0E2 
X-CRM114-Status: UNSURE (   8.26  )
X-CRM114-Notice: Please train this message.
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

Some ARM boards still use the deprecated 'gpios' property to describe a
GPIO based I2C bus. Let them use the proper '{scl|sda}-gpios' property.

Based on linux-next as of 20250516. No dependencies. I suggest that
patches go via their subsystem trees.

Tested on Calao USB boards using AT91 chipsets.

Wolfram Sang (4):
  ARM: dts: cirrus: ep7211: use recent scl/sda gpio bindings
  ARM: dts: marvell: kirkwood: use recent scl/sda gpio bindings
  ARM: dts: microchip: use recent scl/sda gpio bindings
  ARM: dts: stm32: use recent scl/sda gpio bindings

 arch/arm/boot/dts/cirrus/ep7211-edb7211.dts       |  4 ++--
 arch/arm/boot/dts/marvell/kirkwood-km_common.dtsi |  4 ++--
 arch/arm/boot/dts/microchip/at91rm9200.dtsi       |  5 ++---
 arch/arm/boot/dts/microchip/at91sam9260.dtsi      |  5 ++---
 arch/arm/boot/dts/microchip/at91sam9261.dtsi      |  4 ++--
 arch/arm/boot/dts/microchip/at91sam9263.dtsi      |  5 ++---
 arch/arm/boot/dts/microchip/at91sam9g45.dtsi      |  5 ++---
 arch/arm/boot/dts/microchip/at91sam9n12.dtsi      |  5 ++---
 arch/arm/boot/dts/microchip/at91sam9rl.dtsi       |  8 ++++----
 arch/arm/boot/dts/microchip/at91sam9x5.dtsi       | 15 ++++++---------
 arch/arm/boot/dts/st/ste-nomadik-s8815.dts        |  4 ++--
 11 files changed, 28 insertions(+), 36 deletions(-)

-- 
2.47.2


