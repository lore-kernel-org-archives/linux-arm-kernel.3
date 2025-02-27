Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B835AC197BF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 19:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=my4qxunORK3CwP8tU8nqrGiUYlYJyARvmhikVXk6w3s=; b=g6e0T4y7MdVA6Xs/c86gASlhzY
	lE+xRnwLG+CaKVrr+dE2La1L5rdIyon8UIe4EDNKo1+pEfd63kFjjsNrfs7MTDGPD97CPmeg+muAr
	koK3pevcH0irF/Ln3l6aOSL33mjfNjV4YADWaD4fAn5E3t/qkE30g/l9mN0nMA7ZdVc29mxf3ca86
	e0nczf3jMFknp6MPs4023MgCpF23ihECwUl+jLzmrs/XZAnKf6yfxP+91vzxQ/x06Ek/UY6wiU6p8
	AMXSRl0uv/OX6fZ1afb31jjmQ7P2CDfaBdBUYQ55Ih/sZjaAx92mb+JiJXIj+ZpHKbSCqzNteU5U1
	/XsyaV/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnjix-00000008XCt-2Mmf;
	Thu, 27 Feb 2025 19:39:11 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tngCR-00000007y3o-2gPQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 15:53:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1740671603; x=1772207603;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=XiAlfy2hIb0teFrPDSk5k50YHK4Av/9RD2s1zu1v4Yw=;
  b=2A4p3auwM1GH+bO9NlvHdSIzN+abnKeZU3I7pQWRY6JQ+WYSw93WA3TE
   YuOC/adHzjtw0S6xOZBEMcn25o+kFYnGPdAvJZQy2Qnp/FYkHLukUyMoC
   5clpeGuhCzS5kYoubRPWEhb3GOYvWLQ9ruT8wNdhMHAAiPUs2uh7ieQyj
   T7olkGulTZqdasWxrVc3tqU9CLoKwkAWggKgJtjnyxn7HwzgRbozefD8r
   kksk4hTwADPReBVDDybo5VmuzIyGAQu7vvVgM9uh1yn2syG04O3hnk66Z
   JGTDVQ0OC6ngdpjoYgZNxqx2SsQyUa7R9kk6qDS1L9Zg8xMH7VcAmvea9
   g==;
X-CSE-ConnectionGUID: uJ81GKH9TgaiFMahOXtqRw==
X-CSE-MsgGUID: HqLtVomjSKCcqL7dRAzydg==
X-IronPort-AV: E=Sophos;i="6.13,320,1732604400"; 
   d="scan'208";a="42360406"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 27 Feb 2025 08:53:20 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 27 Feb 2025 08:52:44 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Thu, 27 Feb 2025 08:52:44 -0700
From: <Ryan.Wanner@microchip.com>
To: <lee@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <claudiu.beznea@tuxon.dev>, <sre@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<p.zabel@pengutronix.de>
CC: <linux@armlinux.org.uk>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-pm@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-rtc@vger.kernel.org>, "Ryan
 Wanner" <Ryan.Wanner@microchip.com>
Subject: [PATCH v3 00/21] Enable Power Modes Support for SAMA7D65 SoC
Date: Thu, 27 Feb 2025 08:51:47 -0700
Message-ID: <cover.1740671156.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_075323_684282_EA889963 
X-CRM114-Status: GOOD (  16.62  )
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

Changes from v2 -> v3:
- Correct mistake in v2 sfrbu dt-binding patch.
- Correct incorrect dt-binding addition and formatting for rtc and rtt bindings.
- Add missing SoB tag.
- Cleaned up commit message for Backup mode to describe SHDWC is status
  register is cleared for this SoC.
- Cleaned up variable naming and usage for mcks. Changed the mcks number
  to the correct number of clocks needed to be saved and corrected the
  ASM code accordingly.
- Removed the SHDWC from ULP0 wake-up source as it is not configured as
  a valid wake-up source for ULP0.
- Separated all the DTSI and DTS changes into individual patches.


Li Bin (1):
  ARM: at91: pm: fix at91_suspend_finish for ZQ calibration

Ryan Wanner (20):
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
  ARM: at91: pm: Enable ULP0/ULP1 for SAMA7D65
  power: reset: at91-sama5d2_shdwc: Add sama7d65 PMC
  ARM: dts: microchip: sama7d65: Add SRAM and DRAM components support
  ARM: dts: microchip: sama7d65: Add Reset Controller to sama7d65 SoC
  ARM: dts: microchip: sama7d65: Add Shutdown controller support
  ARM: dts: microchip: sama7d65: Add RTT and GPBR Support for sama7d65
    SoC
  ARM: dts: microchip: sama7d65: Add RTC support for sama7d65
  ARM: dts: microchip: sama7d65: Add SFRBU support to sama7d65
  ARM: dts: microchip: sama7d65: Enable shutdown controller
  ARM: dts: microchip: sama7d65: Add RTT timer to curiosity board

 .../devicetree/bindings/mfd/syscon.yaml       |   4 +
 .../power/reset/atmel,sama5d2-shdwc.yaml      |   5 +
 .../reset/atmel,at91sam9260-reset.yaml        |   3 +
 .../bindings/rtc/atmel,at91rm9200-rtc.yaml    |   4 +-
 .../bindings/rtc/atmel,at91sam9260-rtt.yaml   |   1 +
 .../devicetree/bindings/sram/sram.yaml        |   1 +
 .../dts/microchip/at91-sama7d65_curiosity.dts |  13 +++
 arch/arm/boot/dts/microchip/sama7d65.dtsi     |  77 +++++++++++++
 arch/arm/mach-at91/Kconfig                    |   1 +
 arch/arm/mach-at91/pm.c                       |  47 +++++---
 arch/arm/mach-at91/pm.h                       |   1 +
 arch/arm/mach-at91/pm_data-offsets.c          |   2 +
 arch/arm/mach-at91/pm_suspend.S               | 101 ++++++++++++++++--
 drivers/power/reset/at91-sama5d2_shdwc.c      |   1 +
 14 files changed, 238 insertions(+), 23 deletions(-)

-- 
2.43.0


