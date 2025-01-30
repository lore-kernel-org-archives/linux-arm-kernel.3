Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B96BC0218A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jan 2025 17:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3N2KbXyT5aPmBA3tpd0Kn9Onh5DrKN17W678yt10avg=; b=uCC8uyjUIn7YEZTUUqrgtFesxr
	eegCBd7Hd/STvIQhQv15qu26wTncgsA02FcW0ze0kuBsT6ZHhO+XX5RBY/4RJPWoO0RTcm8dGixM0
	3CER4rHLsMH6hx08My8Su9X5ktLylw60Os/pjl1N+9G+GuuPppCaOelN/7A7/BeWQ9WrIGUtf308J
	p0e1nDXY1muSAE4OQW/TDcJCt0nMV/0vSd1Z9C1TnBNoNGASRK+8c3QsBwck/KzyTpwTjGnn/fIJ8
	E0z0NMB/i47fH5zHDjwKq64EP794P3RVs6RlFZMkdPHeICgqNIkc+3rK8a9lNDwajAclkiiAn29SX
	vQ5XWSEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdYbD-00000009Jpx-1ui4;
	Thu, 30 Jan 2025 17:45:07 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdYSi-00000009IQI-3HdX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jan 2025 17:36:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1738258580; x=1769794580;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=yxEQ9VGHDfq2nWGMnw03UM1R+QlVtJhdj130QDeiT9s=;
  b=qayrRl/GCPqsf7Tj5a2JYu3BZxuHZAQJO7BA+bbk2dWXag5aHTFHaUlW
   n6GGdsLAkAyJmaFBwLcklf4TZwDuk0wypBX/sfWfr5Enp3t5Q5KyT28qF
   l+ObcmXYIqEX6RwKicxRpS32SRJeTxnv29lZw0tHHPgPxu1OYT8CYXzta
   Ece0kOVCGyvmsnMZLAiDBU1Bxv83mEFK/oCzLOD0a4sX1hwz+MjlqJsM3
   pGe6TbuSKv8k+NjG4o1PSt4MnJqas6zzII0WNXo22R0czJUkQVYzrhz0Q
   spfAcKCUcZffPXQgXLYEzm7/AvKn0MoVf/9MsBEnMWU+agI3UL3KjV3RX
   w==;
X-CSE-ConnectionGUID: Qux6TnwtQkq+U6Cg6JCAlA==
X-CSE-MsgGUID: mge+dKGoQCeO7z84WNBudA==
X-IronPort-AV: E=Sophos;i="6.13,246,1732604400"; 
   d="scan'208";a="204623002"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 30 Jan 2025 10:36:19 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 30 Jan 2025 10:35:39 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Thu, 30 Jan 2025 10:35:39 -0700
From: <Ryan.Wanner@microchip.com>
To: <lee@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <claudiu.beznea@tuxon.dev>, <sre@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<p.zabel@pengutronix.de>, <linux@armlinux.org.uk>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-pm@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-rtc@vger.kernel.org>, Ryan Wanner <Ryan.Wanner@microchip.com>
Subject: [PATCH 00/16] Enable Power Modes Support for SAMA7D65 SoC
Date: Thu, 30 Jan 2025 10:33:40 -0700
Message-ID: <cover.1738257860.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250130_093620_879982_BBF099C5 
X-CRM114-Status: GOOD (  12.70  )
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


Li Bin (1):
  ARM: at91: pm: fix at91_suspend_finish for ZQ calibration

Ryan Wanner (15):
  dt-bindings: mfd: syscon: add microchip,sama7d65-ddr3phy
  dt-bindings: mfd: syscon: add microchip,sama7d65-sfrbu
  dt-bindings: sram: Add microchip,sama7d65-sram
  dt-bindings: power: reset: atmel,sama5d2-shdwc: Add
    microchip,sama7d65-shdwc
  dt-bindings: reset: atmel,at91sam9260-reset: add
    microchip,sama7d65-rstc
  dt-bindings: rtc: at91rm9200: Reorganize compatible items
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
 .../bindings/rtc/atmel,at91rm9200-rtc.yaml    |  6 +-
 .../bindings/rtc/atmel,at91sam9260-rtt.yaml   |  5 +
 .../devicetree/bindings/sram/sram.yaml        |  1 +
 .../dts/microchip/at91-sama7d65_curiosity.dts | 14 +++
 arch/arm/boot/dts/microchip/sama7d65.dtsi     | 77 +++++++++++++++
 arch/arm/mach-at91/Kconfig                    |  1 +
 arch/arm/mach-at91/pm.c                       | 53 +++++++---
 arch/arm/mach-at91/pm.h                       |  1 +
 arch/arm/mach-at91/pm_data-offsets.c          |  2 +
 arch/arm/mach-at91/pm_suspend.S               | 97 +++++++++++++++++--
 drivers/power/reset/at91-sama5d2_shdwc.c      |  1 +
 14 files changed, 247 insertions(+), 24 deletions(-)

-- 
2.43.0


