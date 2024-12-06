Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33128E77173
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Dec 2024 20:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=u25LPRR1v8bS3rGFWIZfGsLOHQWvmBrZdCPOeIonz1g=; b=xYzrcu0RS2++T5ofrd92YmlbWF
	A84kuc2Qq3SxhQBST/flz6sgvCt2aBwPsmJxH5stF5RHAEUiLs9ic3qD38g4hCkoP7xv8Udt5ustj
	u3DyBuVcUb8XgBHasnsqBVUVLqbiOBu3anesJTcs4co5TwLcbu8xUyL/7/Yu/MZckYq3YGk7rR9E+
	gEnTjPAxwi2T2tszqfBForw2s2kk8owRUzcTwUX5BQq8IzeIK6JjoxkzhadWxUYJrFTC47LGWBaTc
	wSGRDkXAubhOxIK8YkjCz71WGxBZ7ezo0jq1ufkJa9nug3Sj1z1l7Nwvdvg97Ee2bmtofuSLTC8Vn
	oUC1shPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJeas-00000002dzp-0b0v;
	Fri, 06 Dec 2024 20:06:30 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJeVv-00000002cY4-1D6W
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Dec 2024 20:01:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1733515283; x=1765051283;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Nbyfn+1oYpcw+P1XPkh6jD6oqLO72wK92m4lABnV+GU=;
  b=Jv392VkrNL+5W84sAt53HPkDhEx1ma9YBwFHN5p6RRomY0IcIIR2k3ET
   Y1e0LTO1knxXaiRbxx9+VQtOiZn6EIfMBup4Rqzv8QQYNaWmML+F+DBbg
   TZ/UYT1xzdfDrt1cPTQfk3UgwiRYW57ZJs2JmY6CXtTXJsyekecULy2Fn
   RNhRGrioiYNgNuqLCeDvu3EhMOSFHul1UyWgjMFtFUz3wfCjDOzVPwPGb
   6NqFgABvTaUucThJwKvHfVRX3aKt8KsaWHt5lQMC5pPgyIHLWBHeIbl3D
   f2XitKCXAE+W0qttdMbKk0Qb5+jWTMKmZvllUejT0RYRU5Nn6l1Ojd8of
   A==;
X-CSE-ConnectionGUID: wHv5dacKTzaP3KMzdbJ8Aw==
X-CSE-MsgGUID: 1NUJjekURzSRYGbtL23iQg==
X-IronPort-AV: E=Sophos;i="6.12,214,1728975600"; 
   d="scan'208";a="202686982"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 06 Dec 2024 13:01:21 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 6 Dec 2024 13:01:09 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Fri, 6 Dec 2024 13:01:09 -0700
From: <Ryan.Wanner@microchip.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <mturquette@baylibre.com>, <sboyd@kernel.org>,
	<arnd@arndb.de>
CC: <dharma.b@microchip.com>, <mihai.sain@microchip.com>,
	<romain.sioen@microchip.com>, <varshini.rajendran@microchip.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>,
	<linux-gpio@vger.kernel.org>, <linux-spi@vger.kernel.org>,
	<linux-serial@vger.kernel.org>, Ryan Wanner <Ryan.Wanner@microchip.com>
Subject: [PATCH v3 00/13] Add support for SAMA7D65
Date: Fri, 6 Dec 2024 12:59:45 -0700
Message-ID: <cover.1733505542.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_120123_394835_A4BB6B19 
X-CRM114-Status: GOOD (  15.87  )
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

This series adds support for the SAMA7D65 SoC.

V2 of this series [1].

For the pinctrl and pit64 timers those will have DTB warnings due to
those bindings not being in the .yaml format.

Changes v1->v2:
- V1 set was sent incorrectly as multiple seprate patches v2 took all
  those patches and put them in 1 thread.

Changes v2->v3:
- Correct the patch order to follow correct practice.
- Correct flexcom dt-binding commit messge to reflect the changes in the
  coding style.
- Add missing SoB tags to patches.
- Moved export clocks to DT patch to be included with the clock binding
  patch.
- Separate Kconfig changes and defconfig changes into different patches
  and removed unused Kconfig params.
- Correct confusing SoB and Co-developed chain.
- Removed unsued nodes in DTSI file and sorted includes
  alphanumerically.
- Fix incorrect dts formatting.
- Separate dts and pinmux changes into two patches.
- Combine PLL and MCK changes into core clock driver patch.
- Correct formatting in main clock driver.
- MMC dt-binding changes are applied for next so have been removed from
  the set [2].

1) https://lore.kernel.org/linux-arm-kernel/cover.1732030972.git.Ryan.Wanner@microchip.com/T/#m9691b4d58b62f36f6cbac1d06883c985766c2c0d
2) https://lore.kernel.org/linux-arm-kernel/cover.1732030972.git.Ryan.Wanner@microchip.com/T/#mccf6521c07e74e1c7dc61b09ae0ebdbbdde73a28

Dharma Balasubiramani (6):
  dt-bindings: mfd: atmel,sama5d2-flexcom: add
    microchip,sama7d65-flexcom
  dt-bindings: atmel-sysreg: add sama7d65 RAM and PIT
  dt-bindings: serial: atmel,at91-usart: add microchip,sama7d65-usart
  dt-bindings: pinctrl: at91-pio4: add microchip,sama7d65-pinctrl
  dt-bindings: clocks: atmel,at91sam9x5-sckc: add sama7d65
  dt-bindings: clock: Add SAMA7D65 PMC compatible string

Romain Sioen (2):
  dt-bindings: ARM: at91: Document Microchip SAMA7D65 Curiosity
  ARM: dts: microchip: add support for sama7d65_curiosity board

Ryan Wanner (5):
  clk: at91: sama7d65: add sama7d65 pmc driver
  ARM: dts: microchip: add sama7d65 SoC DT
  ARM: dts: at91: Add sama7d65 pinmux
  ARM: configs: at91: sama7: add new SoC config
  ARM: at91: add new SoC sama7d65

 .../devicetree/bindings/arm/atmel-at91.yaml   |    7 +
 .../devicetree/bindings/arm/atmel-sysregs.txt |   14 +-
 .../bindings/clock/atmel,at91rm9200-pmc.yaml  |    2 +
 .../bindings/clock/atmel,at91sam9x5-sckc.yaml |    1 +
 .../bindings/mfd/atmel,sama5d2-flexcom.yaml   |    9 +-
 .../pinctrl/atmel,at91-pio4-pinctrl.txt       |    1 +
 .../bindings/serial/atmel,at91-usart.yaml     |    1 +
 arch/arm/boot/dts/microchip/Makefile          |    3 +
 .../dts/microchip/at91-sama7d65_curiosity.dts |   89 ++
 .../arm/boot/dts/microchip/sama7d65-pinfunc.h |  947 ++++++++++++
 arch/arm/boot/dts/microchip/sama7d65.dtsi     |  145 ++
 arch/arm/configs/multi_v7_defconfig           |    1 +
 arch/arm/configs/sama7_defconfig              |    1 +
 arch/arm/mach-at91/Kconfig                    |    9 +
 drivers/clk/at91/Makefile                     |    1 +
 drivers/clk/at91/clk-master.c                 |    2 +-
 drivers/clk/at91/clk-sam9x60-pll.c            |    2 +-
 drivers/clk/at91/pmc.c                        |    1 +
 drivers/clk/at91/sama7d65.c                   | 1373 +++++++++++++++++
 include/dt-bindings/clock/at91.h              |    4 +
 20 files changed, 2600 insertions(+), 13 deletions(-)
 create mode 100644 arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dts
 create mode 100644 arch/arm/boot/dts/microchip/sama7d65-pinfunc.h
 create mode 100644 arch/arm/boot/dts/microchip/sama7d65.dtsi
 create mode 100644 drivers/clk/at91/sama7d65.c

-- 
2.43.0


