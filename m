Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF663C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 23:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EmBOuI/NahCYlWC/cHXwEZn8qEPNrXJqA70QvBzBnNs=; b=kglD2gTYiA42YNu6FZ54VuFai1
	sAuQ5bWUsx9qLIW/bYByUahd1+J72nuW5mZD+HCd/sUWp8861/jqBOV7pHxQ1a1491NoK0kWQclOD
	g5KFbQpX2raAlP2yWiVbXHkdSPSmHqkGstZalngdcilAk1PbfKTGP6CszcWE352jW3ZLZCAhXJjFz
	zc/IX/YDGDrfXctZqXr4ybQkTdX3QTn1KEYpFgHz5U9YqPid0Oi12qeInaKAqFC9NjvblzUOSrrjh
	orFNL1AwYrOW7eXjZjb8aRXVYrfxDVGoUVPih3XNWDIUYDPnflXK5BSdZNl35MCP1Ow/kQR3VtTIX
	neP+Qd0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thdA2-00000001q1N-1knw;
	Mon, 10 Feb 2025 23:25:54 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thb6U-00000001SUf-1sjp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Feb 2025 21:14:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1739222046; x=1770758046;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=41SDJqeOvWQc658it1sXNAN/P9R8aH989E9RDDpERWg=;
  b=zBoUTpdVvJiqA4tydrxve4Hg7W1yMijSh20hBQA2SICC6JpI3pGgTlwS
   Tcpag5CfTpz0aWS2OEkCUPW9/oViGsbVpy/BzC/B/XRrPItDA/nTdFb5P
   6thxFKHkKzCPZYkUyT4gUtkkmhsOG5XUTogc2tqJG//FaxNHAZXYcDaL+
   NdQ628gc+s39q65N9uGXvWc3nUZBnDmJqty3kRRWYLr84BaZd9wBAiiq5
   aDePNfH2CXd9ZXkRhDj0ZUdvUAKor8Jr2tVX4mKkPIUTNpCwIdGVEyDbc
   0OOOY9IbiFpjlzssgGkp5X4xwDW+yrzkAuCuTw3VqJ5uYu3h79PMof2KH
   Q==;
X-CSE-ConnectionGUID: AYqW9AG9RbOJ2Xf8Pt97Yw==
X-CSE-MsgGUID: 0K7I9XjESoy6ucluOHAdrA==
X-IronPort-AV: E=Sophos;i="6.13,275,1732604400"; 
   d="scan'208";a="205027961"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 10 Feb 2025 14:14:03 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 10 Feb 2025 14:13:45 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Mon, 10 Feb 2025 14:13:45 -0700
From: <Ryan.Wanner@microchip.com>
To: <lee@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <claudiu.beznea@tuxon.dev>, <sre@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<p.zabel@pengutronix.de>
CC: <linux@armlinux.org.uk>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-pm@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-rtc@vger.kernel.org>, "Ryan
 Wanner" <Ryan.Wanner@microchip.com>
Subject: [PATCH v2 00/15] Enable Power Modes Support for SAMA7D65 SoC
Date: Mon, 10 Feb 2025 14:13:00 -0700
Message-ID: <cover.1739221064.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_131406_629186_8383A73F 
X-CRM114-Status: GOOD (  13.63  )
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

From: Ryan Wanner <Ryan.Wanner@microchip.com>

This patch set adds support for low power modes for the SAMA7D65 SoC and
the required components and changes for low power modes.

The series includes changes in the asm code to account for the addtional
clocks that are in this SoC.

The Device tree additions are to enable all the components needed to
keep the SoC in low power mode.

There are some DTB check warnings but that is due to the dt-binding not
in the correct .yaml file format.

Changes v1 -> v2:
- Add missing compatible for ddr3phy, it is now in both syscon sets.
- Fix alphabetical ordering for sama7d65.
- Remove the incorrect reorganizing patch.
- Remove sama7g5-rtt as a compatible for sama7d65-rtt and add
  sama7d65-rtt as a compatible wake up source in the pm driver.

Li Bin (1):
  ARM: at91: pm: fix at91_suspend_finish for ZQ calibration

Ryan Wanner (14):
  dt-bindings: mfd: syscon: add microchip,sama7d65-ddr3phy
  dt-bindings: mfd: syscon: add microchip,sama7d65-sfrbu
  dt-bindings: sram: Add microchip,sama7d65-sram
  dt-bindings: power: reset: atmel,sama5d2-shdwc: Add
    microchip,sama7d65-shdwc
  dt-bindings: reset: atmel,at91sam9260-reset: add
    microchip,sama7d65-rstc
  dt-bindings: rtc: at91rm9200: add microchip,sama7d65-rtc
  dt-bindings: at91rm9260-rtt: add microchip,sama7d65-rtt
  ARM: at91: Add PM support to sama7d65
  ARM: at91: pm: add DT compatible support for sama7d65
  ARM: at91: PM: Add Backup mode for SAMA7D65
  ARM: at91: pm: Enable ULP0 for SAMA7D65
  power: reset: at91-sama5d2_shdwc: Add sama7d65 PMC
  ARM: dts: microchip: sama7d65: Add Reset and Shutdown and PM support
  ARM: dts: microchip: add shutdown controller and rtt timer

 .../devicetree/bindings/mfd/syscon.yaml       |  3 +
 .../power/reset/atmel,sama5d2-shdwc.yaml      |  5 +
 .../reset/atmel,at91sam9260-reset.yaml        |  5 +
 .../bindings/rtc/atmel,at91rm9200-rtc.yaml    |  3 +
 .../bindings/rtc/atmel,at91sam9260-rtt.yaml   |  3 +
 .../devicetree/bindings/sram/sram.yaml        |  1 +
 .../dts/microchip/at91-sama7d65_curiosity.dts | 14 +++
 arch/arm/boot/dts/microchip/sama7d65.dtsi     | 77 +++++++++++++++
 arch/arm/mach-at91/Kconfig                    |  1 +
 arch/arm/mach-at91/pm.c                       | 54 ++++++++---
 arch/arm/mach-at91/pm.h                       |  1 +
 arch/arm/mach-at91/pm_data-offsets.c          |  2 +
 arch/arm/mach-at91/pm_suspend.S               | 97 +++++++++++++++++--
 drivers/power/reset/at91-sama5d2_shdwc.c      |  1 +
 14 files changed, 245 insertions(+), 22 deletions(-)

-- 
2.43.0


