Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C336DC4453A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 21:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UbvyjF1YD6l/fek9U+ybYuOPITCkN6FjyXZ33eO9YZE=; b=oTpf7LeoVA9gL1DPcUMGjPcs2F
	xG1yAxRgFuW4qasfMHO0d5MVVfMhoUO+Nbi+fWlupALSJ2NBb+yVJz27wXPW57GJGHyZMT+5VVFIr
	jWrMWBbVjSqdjyBL0TbVpR1hR3yNaVHKAgja2ESgNlt2zKqLb9NyVDf3cawwwfjVdMO0aa+OdU6aT
	qP0Ae5U7duZ3aA5hPj8BSAIfkLAvsNCWQbHDxL1vtr2C6+A7M/Ee5zqCBmuf0x8uDKCkBMYtZsgxj
	ogwGD+/d8Ynovrc4aOH9te2BgV87giNNFJPD18aAaqcjywvhxKRtnCmWYvqRkUb004PNiyzZl04fN
	YAy+oVfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmeh0-0000000Cq0P-3FXa;
	Wed, 22 Jul 2026 21:41:30 +0000
Received: from mail-northeuropeazon11022105.outbound.protection.outlook.com ([52.101.66.105] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmegt-0000000CpxT-0Rxk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 21:41:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gjg4JyNNjMU7C3yYUIi2hPuIoCZ2eNtPiHOaqJOTXbCNMoaeB3YP76WQ630iJcdOSiD2J3GKgLSpKgeIn8bVHAVUviOXKXDGXqm2jar314yNeyU9U6QQGGY6SVabhN0vY3pQDIAqoTAmo7A8OQOLiS/TNYlXSouG+Rk9ZmQom+yqz8gWYc55rXOczPt390BmVTxkNsfMFSCd2WcETrSoo45F+BQjFP+p76Y2DuEAwpBjYsOLBR6ViTWpRYNktVOUZC0W+fxJKSRXuSQp4bwD6UtGwDIz28xW+etueWYgj3PE+OwU03CkiXktRsGdU9fkBOCEI47L6ZLGvUGUTIY+qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UbvyjF1YD6l/fek9U+ybYuOPITCkN6FjyXZ33eO9YZE=;
 b=YAoUB8N4NJFKPnc0V6e1ubA0rCfbcOdJT7ptUksT7j0VpImMxJ724JXkQQbCdkGtO0Q5lqm/8jjyJwWVp1hdk2sfJXEScdZxzAwUQfBUgcgyDfZ4nDxXa9Dc3XYxVRcOtbbY3KJFzYaYjJfEW96dJTXqlUSmdqmPYSkALd39qDMlxxpW0FWtm/UDXR05WOgOQrGpaxMTO0+9G0v62y5qsmkZLyp5R8zxmCZ3J7pqtSniGVwQSQhYpe05r2I237SRwMYCkOCg1MLM29ynctC4rJjlDh9t+8SdJKgZH12yGKH9kSPIyrfay54lcMR2Cr7J5tEp0qrdDLxdOJsICoGVXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=ti.com smtp.mailfrom=phytec.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=phytec.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UbvyjF1YD6l/fek9U+ybYuOPITCkN6FjyXZ33eO9YZE=;
 b=OE5CerPRUfU7NlI1YAzpJlfleNWYleSYZPifEvDwIVgbR4+HA0uGtYOmCNrWEAiBiT3mIpCOlHiYVvvDeaGbLB2USgs2hD7Tv8gJDs5wJipNJZqjPbm7alAnueU0gF4Ns+elqEtuO7c7bDGtWF9eVx6cZKY7NDU9rsJq9fC5tuvwYwOtrLP9Lpgjckd13JMCxYBNWUFIiqgdoCUnj9isc+BOKbWPdgqTuhf6AF4nUJDHSw0z/31pjFZxzaBxus7ZnVv/LLw7j9EDdKEm96P1Xcu6FG/OjxFARe6YANQtVW14tkVDbjJMy84iD3qu8ZS/CsR53xta5ZQI2z0qtT0dAw==
Received: from DUZPR01CA0038.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:468::12) by DU0P195MB2075.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:10:40f::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Wed, 22 Jul
 2026 21:41:16 +0000
Received: from DB1PEPF000509F0.eurprd03.prod.outlook.com
 (2603:10a6:10:468:cafe::a1) by DUZPR01CA0038.outlook.office365.com
 (2603:10a6:10:468::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.10 via Frontend Transport; Wed,
 22 Jul 2026 21:41:16 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=phytec.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.com discourages use of 91.26.50.189 as permitted sender)
Received: from Postix.phytec.de (91.26.50.189) by
 DB1PEPF000509F0.mail.protection.outlook.com (10.167.242.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.5 via Frontend Transport; Wed, 22 Jul 2026 21:41:15 +0000
Received: from wl-jma.com (172.25.39.17) by Postix.phytec.de (172.25.0.11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Wed, 22 Jul
 2026 23:41:12 +0200
From: John Ma <jma@phytec.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <upstream@lists.phytec.de>, John Ma
	<jma@phytec.com>
Subject: [PATCH 2/2] arm64: dts: ti: Add support for the phyCORE-AM62Px
Date: Wed, 22 Jul 2026 14:40:52 -0700
Message-ID: <20260722214052.1962414-2-jma@phytec.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260722214052.1962414-1-jma@phytec.com>
References: <20260722214052.1962414-1-jma@phytec.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.25.39.17]
X-ClientProxiedBy: Postix.phytec.de (172.25.0.11) To Postix.phytec.de
 (172.25.0.11)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509F0:EE_|DU0P195MB2075:EE_
X-MS-Office365-Filtering-Correlation-Id: 94100d38-dce1-411c-9939-08dee839f4e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|23010399003|82310400026|36860700016|22082099003|18002099003|3023799007|13003099007|10067099003|11063799006|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info: qLdsFpbOtscKSiAfjqVcHFgm8tR2LDHM0LHOgfDUnBrTqIIpq7FzACkww4KjseyA+CcxsN1pjZSrqjsQ11wSK+3not/U/QJD7GqSNqU+4/BclW3PGcmnxzwED0g+aG3TjdC7pDct8BcucIeYzo5wTo2I30MG3896cML+VQ0XXccds38LJ+SUr8JgTBYqIoJCQMTe04aaAv41mm3vtOaMq4xEa9ktWZ63OKM3cQAXJgQZg8d4pKEQx00O9Tu1IGNbdub19LR7UkrgnHA9iE33Alvt69v9YWhm4BaQDXHD5ePx8ynNeh4oRc7YoBEFR5anLIkS5bGOZAkIrMSaInWcoqNXzmL4S7acnIrL6xGv7kTXxBMWW+NTFi9GP3o3EccJdaK7LUf9Kdjx6Xqfq5rXGMNFpOAThp7Vz2DIdcgrM2jywevLTq881YOBiJDJ9sTP2Sa4+pp7+2f9fIXAgzNFywHh7nBniMREgRbdjcOpjuaDvDklODVgwJrg4LH7Xt+G+OY0m9UjBR0tEbKjuF61SsnRZXbT2OMlkPhMY9UdcD6jKiZWCRkcmMJtGfdeLQGJNf5ZboaCR28R48kwJ2NFy+A3COjCgmN8D1kHIub84Eg3Y37bv9bdZIGVW+Y1sHlU+0KqsqCEaA5vbUX7Z1to7HHlzKXF3XCie1JEWtjOU2APWNK8z72FlUONMdcpSmB3J327bLvyB95/IRXWtv6SdA==
X-Forefront-Antispam-Report: CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Postix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(82310400026)(36860700016)(22082099003)(18002099003)(3023799007)(13003099007)(10067099003)(11063799006)(56012099006)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: BomKBYPBwgNMcjJpKd0STLgDgxsuslJ1ARuroth2PRkpw1yMTjAEbz7nY+ubexobg4a08B+kcPCZX7wiL9Iw8wy0QbV6uGTotGOblRLYOAZUmXRFlmh6sVrbfhoA7psOKfZL1I/ac4Hx+uo42DhTg8jgH67rGAi+EX6uCnYk9TA77t3otYBOIy0vjTW6rkKxRqic1lImBUB1ot8qIIXw5qZ5R/36IPE7mpUYEYdmXxz0q5b9NJo97ARxyxlG834+tgKLcTCaD/YNGQdLDdpg9qOCg28foe8IDqHhcgWupEZXzXow66ezfAR+HHrfYcACJVcz52Gnh15cNSPxt5/T4fvA+ghfT6gi+z/dtyUQcggdK1KrXamEvGWlEidBUc4DvIEBO9oyWR04av4rOGlL9g4jPVVuYBv9o6LfqBeHFTuiuIGFNeq37ZVQ//v8wXsW
X-OriginatorOrg: phytec.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2026 21:41:15.1801
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 94100d38-dce1-411c-9939-08dee839f4e3
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509F0.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0P195MB2075
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_144123_306551_07CE11CA 
X-CRM114-Status: GOOD (  16.15  )
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

Add support for the PHYTEC phyCORE-AM62Px SoM [1] and the
corresponding phyBOARD-Lynx carrier board [2]. The phyCORE-AM62Px SoM
uses the TI AM62Px SoC and can come with different sizes and models of
DDR, eMMC, and SPI NOR Flash.

Supported features:
  * Audio playback and recording
  * CAN
  * Debug UART
  * eMMC
  * Ethernet
  * GPIO buttons
  * Heartbeat LED
  * I2C EEPROM
  * I2C RTC
  * Micro SD card
  * SPI NOR flash
  * SPI Accelerometer
  * USB

[1] https://www.phytec.com/product/phycore-am62px/
[2] https://www.phytec.com/product/phyboard-am62px-development-kit/

Signed-off-by: John Ma <jma@phytec.com>
---
 arch/arm64/boot/dts/ti/Makefile               |   1 +
 .../boot/dts/ti/k3-am62p-phycore-som.dtsi     | 339 +++++++++++
 .../boot/dts/ti/k3-am62p5-phyboard-lynx.dts   | 549 ++++++++++++++++++
 3 files changed, 889 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62p-phycore-som.dtsi
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62p5-phyboard-lynx.dts

diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
index f4d109ef6798..dce7e0c1cbd6 100644
--- a/arch/arm64/boot/dts/ti/Makefile
+++ b/arch/arm64/boot/dts/ti/Makefile
@@ -81,6 +81,7 @@ dtb-$(CONFIG_ARCH_K3) += k3-am62l3-beaglebadge.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am62l3-evm.dtb
 
 # Boards with AM62Px SoC
+dtb-$(CONFIG_ARCH_K3) += k3-am62p5-phyboard-lynx.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am62p5-sk.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am62p5-var-som-symphony.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am62p5-verdin-dev-nau8822-btl.dtbo
diff --git a/arch/arm64/boot/dts/ti/k3-am62p-phycore-som.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-phycore-som.dtsi
new file mode 100644
index 000000000000..434dd81a611d
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am62p-phycore-som.dtsi
@@ -0,0 +1,339 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (C) 2026 PHYTEC America LLC
+ * Author: John Ma <jma@phytec.com>
+ *
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/leds/common.h>
+#include <dt-bindings/net/ti-dp83867.h>
+
+/ {
+	model = "PHYTEC phyCORE-AM62P5";
+	compatible = "phytec,am62p-phycore-som", "ti,am62p5";
+
+	aliases {
+		ethernet0 = &cpsw_port1;
+		gpio0 = &main_gpio0;
+		gpio1 = &main_gpio1;
+		i2c0 = &wkup_i2c0;
+		mmc0 = &sdhci0;
+		rtc0 = &i2c_som_rtc;
+		rtc1 = &wkup_rtc0;
+		spi0 = &ospi0;
+	};
+
+	memory@80000000 {
+		/* 2G RAM */
+		reg = <0x00000000 0x80000000 0x00000000 0x80000000>;
+		device_type = "memory";
+		bootph-all;
+	};
+
+	reserved_memory: reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		wkup_r5fss0_core0_dma_memory_region: memory@9c800000 {
+			compatible = "shared-dma-pool";
+			reg = <0x00 0x9c800000 0x00 0x100000>;
+			no-map;
+		};
+
+		wkup_r5fss0_core0_memory_region: memory@9c900000 {
+			compatible = "shared-dma-pool";
+			reg = <0x00 0x9c900000 0x00 0x1e00000>;
+			no-map;
+		};
+
+		secure_tfa_ddr: tfa@9e780000 {
+			reg = <0x00 0x9e780000 0x00 0x80000>;
+			no-map;
+		};
+
+		secure_ddr: optee@9e800000 {
+			reg = <0x00 0x9e800000 0x00 0x01800000>; /* for OP-TEE */
+			no-map;
+		};
+	};
+
+	vcc_5v0_som: regulator-vcc-5v0-som {
+		compatible = "regulator-fixed";
+		regulator-name = "VCC_5V0_SOM";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
+	leds {
+		compatible = "gpio-leds";
+		pinctrl-names = "default";
+		pinctrl-0 = <&leds_pins_default>;
+
+		led-0 {
+			color = <LED_COLOR_ID_GREEN>;
+			gpios = <&main_gpio0 13 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "heartbeat";
+			function = LED_FUNCTION_HEARTBEAT;
+		};
+	};
+
+	opp-table {
+		/* Requires VDD_CORE at 0v85 */
+		opp-1400000000 {
+			opp-hz = /bits/ 64 <1400000000>;
+			opp-supported-hw = <0x01 0x0004>;
+			clock-latency-ns = <6000000>;
+		};
+	};
+};
+
+&main_pmx0 {
+	main_mdio0_pins_default: main-mdio0-default-pins {
+		pinctrl-single,pins = <
+			AM62PX_IOPAD(0x0160, PIN_OUTPUT_PULLUP, 0) /* (F17) MDIO0_MDC */
+			AM62PX_IOPAD(0x015c, PIN_INPUT_PULLUP, 0) /* (F16) MDIO0_MDIO */
+		>;
+		bootph-all;
+	};
+
+	main_rgmii1_pins_default: main-rgmii1-default-pins {
+		pinctrl-single,pins = <
+			AM62PX_IOPAD(0x014c, PIN_INPUT, 0) /* (B15) RGMII1_RD0 */
+			AM62PX_IOPAD(0x0150, PIN_INPUT, 0) /* (B16) RGMII1_RD1 */
+			AM62PX_IOPAD(0x0154, PIN_INPUT, 0) /* (A14) RGMII1_RD2 */
+			AM62PX_IOPAD(0x0158, PIN_INPUT, 0) /* (B14) RGMII1_RD3 */
+			AM62PX_IOPAD(0x0148, PIN_INPUT, 0) /* (A16) RGMII1_RXC */
+			AM62PX_IOPAD(0x0144, PIN_INPUT, 0) /* (A15) RGMII1_RX_CTL */
+			AM62PX_IOPAD(0x0134, PIN_INPUT, 0) /* (A18) RGMII1_TD0 */
+			AM62PX_IOPAD(0x0138, PIN_INPUT, 0) /* (C17) RGMII1_TD1 */
+			AM62PX_IOPAD(0x013c, PIN_INPUT, 0) /* (A17) RGMII1_TD2 */
+			AM62PX_IOPAD(0x0140, PIN_INPUT, 0) /* (C16) RGMII1_TD3 */
+			AM62PX_IOPAD(0x0130, PIN_INPUT, 0) /* (B17) RGMII1_TXC */
+			AM62PX_IOPAD(0x012c, PIN_INPUT, 0) /* (B18) RGMII1_TX_CTL */
+		>;
+		bootph-all;
+	};
+
+	ospi0_pins_default: ospi0-default-pins {
+		pinctrl-single,pins = <
+			AM62PX_IOPAD(0x0000, PIN_OUTPUT, 0) /* (P23) OSPI0_CLK */
+			AM62PX_IOPAD(0x002c, PIN_OUTPUT, 0) /* (M25) OSPI0_CSn0 */
+			AM62PX_IOPAD(0x000c, PIN_INPUT, 0) /* (L25) OSPI0_D0 */
+			AM62PX_IOPAD(0x0010, PIN_INPUT, 0) /* (N24) OSPI0_D1 */
+			AM62PX_IOPAD(0x0014, PIN_INPUT, 0) /* (N25) OSPI0_D2 */
+			AM62PX_IOPAD(0x0018, PIN_INPUT, 0) /* (M24) OSPI0_D3 */
+			AM62PX_IOPAD(0x001c, PIN_INPUT, 0) /* (N21) OSPI0_D4 */
+			AM62PX_IOPAD(0x0020, PIN_INPUT, 0) /* (N22) OSPI0_D5 */
+			AM62PX_IOPAD(0x0024, PIN_INPUT, 0) /* (P21) OSPI0_D6 */
+			AM62PX_IOPAD(0x0028, PIN_INPUT, 0) /* (N20) OSPI0_D7 */
+			AM62PX_IOPAD(0x0008, PIN_INPUT, 0) /* (P22) OSPI0_DQS */
+		>;
+		bootph-all;
+	};
+
+	leds_pins_default: leds-default-pins {
+		pinctrl-single,pins = <
+			AM62PX_IOPAD(0x0034, PIN_OUTPUT, 7) /* (L22) OSPI0_CSn2.GPIO0_13 */
+		>;
+	};
+
+	pmic_irq_pins_default: pmic-irq-default-pins {
+	       pinctrl-single,pins = <
+			AM62PX_IOPAD(0x01f4, PIN_INPUT, 7) /* (C23) EXTINTn.GPIO1_31 */
+	       >;
+	};
+};
+
+&cpsw3g {
+	pinctrl-names = "default";
+	pinctrl-0 = <&main_rgmii1_pins_default>;
+	bootph-all;
+	status = "okay";
+};
+
+&cpsw_port1 {
+	phy-mode = "rgmii-id";
+	phy-handle = <&cpsw3g_phy1>;
+	bootph-all;
+	status = "okay";
+};
+
+&cpsw3g_mdio {
+	pinctrl-names = "default";
+	pinctrl-0 = <&main_mdio0_pins_default>;
+	bootph-all;
+	status = "okay";
+
+	cpsw3g_phy1: ethernet-phy@1 {
+		reg = <1>;
+		ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_00_NS>;
+		ti,fifo-depth = <DP83867_PHYCR_FIFO_DEPTH_4_B_NIB>;
+		ti,min-output-impedance;
+	};
+};
+
+&fss {
+	bootph-all;
+};
+
+&mcu_pmx0 {
+	wkup_i2c0_pins_default: wkup-i2c0-default-pins {
+		pinctrl-single,pins = <
+			AM62PX_MCU_IOPAD(0x04c, PIN_INPUT_PULLUP, 0) /* (A13) WKUP_I2C0_SCL */
+			AM62PX_MCU_IOPAD(0x050, PIN_INPUT_PULLUP, 0) /* (C11) WKUP_I2C0_SDA */
+		>;
+		bootph-all;
+	};
+};
+
+&ospi0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&ospi0_pins_default>;
+	status = "okay";
+
+	serial_flash: flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0x0>;
+		spi-tx-bus-width = <8>;
+		spi-rx-bus-width = <8>;
+		spi-max-frequency = <25000000>;
+		vcc-supply = <&vdd_1v8>;
+		cdns,tshsl-ns = <60>;
+		cdns,tsd2d-ns = <60>;
+		cdns,tchsh-ns = <60>;
+		cdns,tslch-ns = <60>;
+		cdns,read-delay = <0>;
+		bootph-all;
+	};
+};
+
+&sdhci0 {
+	non-removable;
+	bootph-all;
+	ti,driver-strength-ohm = <50>;
+	status = "okay";
+};
+
+&wkup_i2c0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&wkup_i2c0_pins_default>;
+	clock-frequency = <400000>;
+	status = "okay";
+
+	pmic@30 {
+		compatible = "ti,tps65219";
+		reg = <0x30>;
+		buck1-supply = <&vcc_5v0_som>;
+		buck2-supply = <&vcc_5v0_som>;
+		buck3-supply = <&vcc_5v0_som>;
+		ldo1-supply = <&vdd_3v3_som>;
+		ldo2-supply = <&vdd_1v8_som>;
+		ldo3-supply = <&vdd_3v3_som>;
+		ldo4-supply = <&vdd_3v3_som>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&pmic_irq_pins_default>;
+		interrupt-parent = <&main_gpio1>;
+		interrupts = <31 IRQ_TYPE_EDGE_FALLING>;
+		interrupt-controller;
+		#interrupt-cells = <1>;
+
+		ti,power-button;
+		system-power-controller;
+
+		regulators {
+			vdd_3v3_som: buck1 {
+				regulator-name = "VDD_3V3_SOM";
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			vdd_1v8_som: buck2 {
+				regulator-name = "VDD_1V8_SOM";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			vdd_lpddr4: buck3 {
+				regulator-name = "VDD_LPDDR4";
+				regulator-min-microvolt = <1100000>;
+				regulator-max-microvolt = <1100000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			vddshv5_sdio: ldo1 {
+				regulator-name = "VDDSHV5_SDIO";
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-allow-bypass;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			vdd_1v2: ldo2 {
+				regulator-name = "VDD_1V2";
+				regulator-min-microvolt = <1200000>;
+				regulator-max-microvolt = <1200000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			vdd_1v8_phy: ldo3 {
+				regulator-name = "VDD_1V8_PHY";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			vdda_1v8: ldo4 {
+				regulator-name = "VDDA_1V8";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+		};
+	};
+
+	vdd_core: regulator-vdd-core@40 {
+		compatible = "ti,tps62873";
+		reg = <0x40>;
+		bootph-pre-ram;
+		regulator-name = "VDD_CORE";
+		regulator-min-microvolt = <850000>;
+		regulator-max-microvolt = <850000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
+	eeprom@50 {
+		compatible = "atmel,24c32";
+		pagesize = <32>;
+		reg = <0x50>;
+		vcc-supply = <&vdd_3v3_som>;
+	};
+
+	som_eeprom_opt: eeprom@51 {
+		compatible = "atmel,24c32";
+		pagesize = <32>;
+		reg = <0x51>;
+		vcc-supply = <&vdd_3v3_som>;
+	};
+
+	i2c_som_rtc: rtc@52 {
+		compatible = "microcrystal,rv3028";
+		reg = <0x52>;
+	};
+};
+
+#include "k3-am62p-ti-ipc-firmware.dtsi"
diff --git a/arch/arm64/boot/dts/ti/k3-am62p5-phyboard-lynx.dts b/arch/arm64/boot/dts/ti/k3-am62p5-phyboard-lynx.dts
new file mode 100644
index 000000000000..6bc909a6944f
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am62p5-phyboard-lynx.dts
@@ -0,0 +1,549 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (C) 2026 PHYTEC America LLC
+ * Author: John Ma <jma@phytec.com>
+ *
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/leds/common.h>
+#include <dt-bindings/net/ti-dp83867.h>
+#include "k3-am62p5.dtsi"
+#include "k3-am62p-phycore-som.dtsi"
+
+/ {
+	compatible = "phytec,am62p5-phyboard-lynx",
+		     "phytec,am62p-phycore-som", "ti,am62p5";
+	model = "PHYTEC phyBOARD-Lynx AM62P5";
+
+	aliases {
+		ethernet1 = &cpsw_port2;
+		mmc1 = &sdhci1;
+		serial2 = &main_uart0;
+		serial3 = &main_uart1;
+		spi1 = &main_spi0;
+		usb0 = &usb0;
+		usb1 = &usb1;
+	};
+
+	can_tc0: can-phy0 {
+		compatible = "ti,tcan1042";
+		#phy-cells = <0>;
+		max-bitrate = <8000000>;
+		standby-gpios = <&gpio_exp0 7 GPIO_ACTIVE_HIGH>;
+	};
+
+	usb0_connector: connector {
+		compatible ="gpio-usb-b-connector", "usb-c-connector";
+		label = "USB-C";
+		data-role = "dual";
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&main_usbc_power_pins_default>;
+
+		id-gpios = <&main_gpio1 50 GPIO_ACTIVE_HIGH>;
+
+		port {
+			usb0_con: endpoint {
+				remote-endpoint = <&usb0_ep>;
+			};
+		};
+	};
+
+	keys {
+		compatible = "gpio-keys";
+		autorepeat;
+		pinctrl-names = "default";
+		pinctrl-0 = <&gpio_keys_pins_default>;
+
+		key-home {
+			label = "home";
+			linux,code = <KEY_HOME>;
+			gpios = <&main_gpio0 72 GPIO_ACTIVE_HIGH>;
+		};
+
+		key-menu {
+			label = "menu";
+			linux,code = <KEY_MENU>;
+			gpios = <&gpio_exp0 11 GPIO_ACTIVE_HIGH>;
+		};
+	};
+
+	leds {
+		compatible = "gpio-leds";
+		pinctrl-names = "default";
+	};
+
+	sound {
+		compatible = "simple-audio-card";
+		simple-audio-card,name = "phyBOARD-Lynx";
+		simple-audio-card,format = "dsp_b";
+		simple-audio-card,bitclock-master = <&sound_master>;
+		simple-audio-card,frame-master = <&sound_master>;
+		simple-audio-card,bitclock-inversion;
+		simple-audio-card,widgets =
+			"Microphone", "Mic Jack",
+			"Headphone", "Headphone Jack",
+			"Line", "Stereo Jack",
+			"Speaker", "L SPKR",
+			"Speaker", "R SPKR";
+		simple-audio-card,routing =
+			"MIC1RP", "Mic Jack",
+			"Mic Jack", "MICBIAS",
+			"Headphone Jack", "HPL",
+			"Headphone Jack", "HPR",
+			"MIC1LM", "Stereo Jack",
+			"MIC1LP", "Stereo Jack",
+			"L SPKR", "SPL",
+			"R SPKR", "SPR";
+		simple-audio-card,cpu {
+			sound-dai = <&mcasp2>;
+		};
+
+		sound_master: simple-audio-card,codec {
+			sound-dai = <&audio_codec>;
+			clocks = <&audio_refclk1>;
+		};
+	};
+
+	vdd_1v8: regulator-vdd-1v8 {
+		compatible = "regulator-fixed";
+		regulator-name = "VDD_1V8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
+	vdd_3v3: regulator-vdd-3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "VDD_3V3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
+	vdd_3v3_aud: regulator-vdd-3v3-aud {
+		compatible = "regulator-fixed";
+		regulator-name = "VDD_3V3_AUD";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
+	vdd_3v3_mmc: regulator-vdd-3v3-mmc {
+		compatible = "regulator-fixed";
+		regulator-name = "VDD_3V3_MMC";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
+	vdd_speaker: regulator-vdd-speaker {
+		compatible = "regulator-fixed";
+		regulator-name = "VDD_SPEAKER";
+		regulator-min-microvolt = <5000000>;
+			regulator-max-microvolt = <5000000>;
+			regulator-always-on;
+			regulator-boot-on;
+	};
+};
+
+&main_pmx0 {
+	accel_irq_pins_default: accel-irq-default-pins {
+		pinctrl-single,pins = <
+			AM62PX_IOPAD(0x0084, PIN_INPUT, 7) /* (R25) GPMC0_ADVn_ALE.GPIO0_32 */
+			AM62PX_IOPAD(0x0094, PIN_INPUT, 7) /* (T24) GPMC0_BE1n.GPIO0_36 */
+		>;
+	};
+
+	audio_ext_refclk1_pins_default: audio-ext-refclk1-default-pins {
+		pinctrl-single,pins = <
+			AM62PX_IOPAD(0x00a0, PIN_OUTPUT, 1) /* (P24) GPMC0_WPn.AUDIO_EXT_REFCLK1 */
+		>;
+	};
+
+	gpio_keys_pins_default: gpio-keys-default-pins {
+		pinctrl-single,pins = <
+			AM62PX_IOPAD(0x0128, PIN_INPUT, 7) /* (K25) MMC2_SDWP.GPIO0_72 */
+		>;
+	};
+
+	main_dpi_pins_default: main-dpi-default-pins {
+		pinctrl-single,pins = <
+			AM62PX_IOPAD(0x0100, PIN_OUTPUT, 0) /* (W20) VOUT0_VSYNC */
+			AM62PX_IOPAD(0x00f8, PIN_OUTPUT, 0) /* (AC20) VOUT0_HSYNC */
+			AM62PX_IOPAD(0x0104, PIN_OUTPUT, 0) /* (Y21) VOUT0_PCLK */
+			AM62PX_IOPAD(0x00fc, PIN_OUTPUT, 0) /* (W21) VOUT0_DE */
+			AM62PX_IOPAD(0x00b8, PIN_OUTPUT, 0) /* (AE24) VOUT0_DATA0 */
+			AM62PX_IOPAD(0x00bc, PIN_OUTPUT, 0) /* (W23) VOUT0_DATA1 */
+			AM62PX_IOPAD(0x00c0, PIN_OUTPUT, 0) /* (AA23) VOUT0_DATA2 */
+			AM62PX_IOPAD(0x00c4, PIN_OUTPUT, 0) /* (Y23) VOUT0_DATA3 */
+			AM62PX_IOPAD(0x00c8, PIN_OUTPUT, 0) /* (AB23) VOUT0_DATA4 */
+			AM62PX_IOPAD(0x00cc, PIN_OUTPUT, 0) /* (AD23) VOUT0_DATA5 */
+			AM62PX_IOPAD(0x00d0, PIN_OUTPUT, 0) /* (AC23) VOUT0_DATA6 */
+			AM62PX_IOPAD(0x00d4, PIN_OUTPUT, 0) /* (AE23) VOUT0_DATA7 */
+			AM62PX_IOPAD(0x00d8, PIN_OUTPUT, 0) /* (AE22) VOUT0_DATA8 */
+			AM62PX_IOPAD(0x00dc, PIN_OUTPUT, 0) /* (AC22) VOUT0_DATA9 */
+			AM62PX_IOPAD(0x00e0, PIN_OUTPUT, 0) /* (W22) VOUT0_DATA10 */
+			AM62PX_IOPAD(0x00e4, PIN_OUTPUT, 0) /* (AE21) VOUT0_DATA11 */
+			AM62PX_IOPAD(0x00e8, PIN_OUTPUT, 0) /* (AD21) VOUT0_DATA12 */
+			AM62PX_IOPAD(0x00ec, PIN_OUTPUT, 0) /* (AC21) VOUT0_DATA13 */
+			AM62PX_IOPAD(0x00f0, PIN_OUTPUT, 0) /* (AA20) VOUT0_DATA14 */
+			AM62PX_IOPAD(0x00f4, PIN_OUTPUT, 0) /* (Y20) VOUT0_DATA15 */
+		>;
+	};
+
+	gpio_exp0_int_pins_default: gpio-exp0-int-default-pins {
+		pinctrl-single,pins = <
+			AM62PX_IOPAD(0x0044, PIN_INPUT, 7) /* (U20) GPMC0_AD2.GPIO0_17 */
+		>;
+	};
+
+	gpio_exp1_int_pins_default: gpio-exp1-int-default-pins {
+		pinctrl-single,pins = <
+			AM62PX_IOPAD(0x0050, PIN_INPUT, 7) /* (T21) GPMC0_AD5.GPIO0_20 */
+		>;
+	};
+
+	main_i2c0_pins_default: main-i2c0-default-pins {
+		pinctrl-single,pins = <
+			AM62PX_IOPAD(0x01e0, PIN_INPUT_PULLUP, 0) /* (B25) I2C0_SCL */
+			AM62PX_IOPAD(0x01e4, PIN_INPUT_PULLUP, 0) /* (A24) I2C0_SDA */
+		>;
+	};
+
+	main_i2c1_pins_default: main-i2c1-default-pins {
+		pinctrl-single,pins = <
+			AM62PX_IOPAD(0x01e8, PIN_INPUT_PULLUP, 0) /* (C24) I2C1_SCL */
+			AM62PX_IOPAD(0x01ec, PIN_INPUT_PULLUP, 0) /* (B24) I2C1_SDA */
+		>;
+		bootph-all;
+	};
+
+	main_mcan0_pins_default: main-mcan0-default-pins {
+		pinctrl-single,pins = <
+			AM62PX_IOPAD(0x01dc, PIN_INPUT, 0) /* (F20) MCAN0_RX */
+			AM62PX_IOPAD(0x01d8, PIN_OUTPUT, 0) /* (B23) MCAN0_TX */
+		>;
+	};
+
+	main_mcasp2_pins_default: main-mcasp2-default-pins {
+		pinctrl-single,pins = <
+			AM62PX_IOPAD(0x0070, PIN_INPUT, 3) /* (AD25) GPMC0_AD13.MCASP2_ACLKX */
+			AM62PX_IOPAD(0x006c, PIN_INPUT, 3) /* (Y24) GPMC0_AD12.MCASP2_AFSX */
+			AM62PX_IOPAD(0x0064, PIN_OUTPUT, 3) /* (AA25) GPMC0_AD10.MCASP2_AXR2 */
+			AM62PX_IOPAD(0x0068, PIN_INPUT, 3) /* (W24) GPMC0_AD11.MCASP2_AXR3 */
+		>;
+	};
+
+	main_mmc1_pins_default: main-mmc1-default-pins {
+		pinctrl-single,pins = <
+			AM62PX_IOPAD(0x023c, PIN_INPUT_PULLUP, 0) /* (H20) MMC1_CMD */
+			AM62PX_IOPAD(0x0234, PIN_OUTPUT, 0) /* (J24) MMC1_CLK */
+			AM62PX_IOPAD(0x0230, PIN_INPUT_PULLUP, 0) /* (H21) MMC1_DAT0 */
+			AM62PX_IOPAD(0x022c, PIN_INPUT_PULLUP, 0) /* (H23) MMC1_DAT1 */
+			AM62PX_IOPAD(0x0228, PIN_INPUT_PULLUP, 0) /* (H22) MMC1_DAT2 */
+			AM62PX_IOPAD(0x0224, PIN_INPUT_PULLUP, 0) /* (H25) MMC1_DAT3 */
+			AM62PX_IOPAD(0x0240, PIN_INPUT_PULLUP, 0) /* (D23) MMC1_SDCD */
+		>;
+		bootph-all;
+	};
+
+	main_rgmii2_pins_default: main-rgmii2-default-pins {
+		pinctrl-single,pins = <
+			AM62PX_IOPAD(0x0184, PIN_INPUT, 0) /* (E19) RGMII2_RD0 */
+			AM62PX_IOPAD(0x0188, PIN_INPUT, 0) /* (E16) RGMII2_RD1 */
+			AM62PX_IOPAD(0x018c, PIN_INPUT, 0) /* (E17) RGMII2_RD2 */
+			AM62PX_IOPAD(0x0190, PIN_INPUT, 0) /* (C19) RGMII2_RD3 */
+			AM62PX_IOPAD(0x0180, PIN_INPUT, 0) /* (D19) RGMII2_RXC */
+			AM62PX_IOPAD(0x017c, PIN_INPUT, 0) /* (F19) RGMII2_RX_CTL */
+			AM62PX_IOPAD(0x016c, PIN_INPUT, 0) /* (B19) RGMII2_TD0 */
+			AM62PX_IOPAD(0x0170, PIN_INPUT, 0) /* (A21) RGMII2_TD1 */
+			AM62PX_IOPAD(0x0174, PIN_INPUT, 0) /* (D17) RGMII2_TD2 */
+			AM62PX_IOPAD(0x0178, PIN_INPUT, 0) /* (A19) RGMII2_TD3 */
+			AM62PX_IOPAD(0x0168, PIN_INPUT, 0) /* (D16) RGMII2_TXC */
+			AM62PX_IOPAD(0x0164, PIN_INPUT, 0) /* (A20) RGMII2_TX_CTL */
+		>;
+		bootph-all;
+	};
+
+	main_spi0_pins_default: main-spi0-default-pins {
+		pinctrl-single,pins = <
+			AM62PX_IOPAD(0x01bc, PIN_INPUT, 0) /* (B21) SPI0_CLK */
+			AM62PX_IOPAD(0x01b4, PIN_OUTPUT, 0) /* (D20) SPI0_CS0 */
+			AM62PX_IOPAD(0x01c0, PIN_OUTPUT, 0) /* (B20) SPI0_D0 */
+			AM62PX_IOPAD(0x01c4, PIN_INPUT, 0) /* (C21) SPI0_D1 */
+		>;
+	};
+
+	main_uart0_pins_default: main-uart0-default-pins {
+		pinctrl-single,pins = <
+			AM62PX_IOPAD(0x01d0, PIN_INPUT, 0) /* (A23) UART0_CTSn */
+			AM62PX_IOPAD(0x01d4, PIN_OUTPUT, 0) /* (C22) UART0_RTSn */
+			AM62PX_IOPAD(0x01c8, PIN_INPUT, 0) /* (A22) UART0_RXD */
+			AM62PX_IOPAD(0x01cc, PIN_OUTPUT, 0) /* (B22) UART0_TXD */
+		>;
+		bootph-all;
+	};
+
+	main_uart1_pins_default: main-uart1-default-pins {
+		pinctrl-single,pins = <
+			AM62PX_IOPAD(0x01ac, PIN_INPUT, 2) /* (G23) MCASP0_AFSR.UART1_RXD */
+			AM62PX_IOPAD(0x01b0, PIN_OUTPUT, 2) /* (G20) MCASP0_ACLKR.UART1_TXD */
+		>;
+		bootph-all;
+	};
+
+	main_usb1_pins_default: main-usb1-default-pins {
+		pinctrl-single,pins = <
+			AM62PX_IOPAD(0x0258, PIN_OUTPUT, 0) /* (G21) USB1_DRVVBUS */
+		>;
+	};
+
+	main_usbc_power_pins_default: main-usbc-power-default-pins {
+		pinctrl-single,pins = <
+			AM62PX_IOPAD(0x0254, PIN_INPUT, 7) /* (G22) USB0_DRVVBUS.GPIO1_50 */
+		>;
+	};
+};
+
+&audio_refclk1 {
+	assigned-clock-rates = <25000000>;
+};
+
+&cpsw3g {
+	pinctrl-names = "default";
+	pinctrl-0 = <&main_rgmii1_pins_default>, <&main_rgmii2_pins_default>;
+};
+
+&cpsw_port2 {
+	phy-mode = "rgmii-id";
+	phy-handle = <&cpsw3g_phy2>;
+	status = "okay";
+};
+
+&cpsw3g_mdio {
+	cpsw3g_phy2: ethernet-phy@2 {
+		reg = <2>;
+		ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_00_NS>;
+		ti,fifo-depth = <DP83867_PHYCR_FIFO_DEPTH_4_B_NIB>;
+		ti,min-output-impedance;
+	};
+};
+
+&main_i2c0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&main_i2c0_pins_default>;
+	clock-frequency = <400000>;
+	status = "okay";
+};
+
+&main_i2c1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&main_i2c1_pins_default>;
+	clock-frequency = <100000>;
+	status = "okay";
+
+	audio_codec: audio-codec@18 {
+		compatible = "ti,tlv320aic3110";
+		reg = <0x18>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&audio_ext_refclk1_pins_default>;
+		reset-gpios = <&gpio_exp0 2 GPIO_ACTIVE_LOW>;
+		#sound-dai-cells = <0>;
+		ai31xx-micbias-vg = <2>;
+
+		HPVDD-supply = <&vdd_3v3_aud>;
+		SPRVDD-supply = <&vdd_speaker>;
+		SPLVDD-supply = <&vdd_speaker>;
+		AVDD-supply = <&vdd_3v3_aud>;
+		IOVDD-supply = <&vdd_3v3_aud>;
+		DVDD-supply = <&vdd_1v8>;
+	};
+
+	gpio_exp0: gpio@20 {
+		pinctrl-names = "default";
+		pinctrl-0 = <&gpio_exp0_int_pins_default>;
+		compatible = "ti,tca6416";
+		reg = <0x20>;
+		vcc-supply = <&vdd_3v3>;
+		interrupt-parent = <&main_gpio0>;
+		interrupts = <17 IRQ_TYPE_EDGE_FALLING>;
+		#gpio-cells = <2>;
+		gpio-controller;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		gpio-line-names = "HDMI_RESETn", "ETH1_RESETn",
+				   "AUDIO_RESETn", "USB_HUB_EN",
+				   "DSI0_TP_RST", "USB_HUB_GLOBAL_RSTz",
+				   "LVDS_BKLT_EN", "CAN0_nEN",
+				   "WL_HOST_WAKE", "BT_HOST_WAKE",
+				   "USER_LED2", "USER_BUT2",
+				   "UART1_nSHDN", "UART1_MODE_SEL",
+				   "DE485_F232", "UART1_LB";
+
+		bootph-all;
+
+		p0-hog {
+			/* P0 - HDMI_RESETn */
+			gpio-hog;
+			gpios = <0 GPIO_ACTIVE_HIGH>;
+			output-high;
+		};
+
+		p1-hog {
+			/* P1 - ETH1_RESETn */
+			gpio-hog;
+			gpios = <1 GPIO_ACTIVE_HIGH>;
+			output-high;
+		};
+
+		p5-hog {
+			/* P5 - USB_HUB_GLOBAL_RSTz */
+			gpio-hog;
+			gpios = <5 GPIO_ACTIVE_HIGH>;
+			output-high;
+		};
+	};
+
+	gpio_exp1: gpio@21 {
+		pinctrl-names = "default";
+		pinctrl-0 = <&gpio_exp1_int_pins_default>;
+		compatible = "ti,tca6416";
+		reg = <0x21>;
+		vcc-supply = <&vdd_3v3>;
+		interrupt-parent = <&main_gpio0>;
+		interrupts = <20 IRQ_TYPE_EDGE_FALLING>;
+		#gpio-cells = <2>;
+		gpio-controller;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		gpio-line-names = "CSI0_OE", "CSI0_SHUTTER",
+				   "CSI0_TRIGGER", "CSI0_STROBE",
+				   "DSI_LED_COMM", "MCU_LIGHT_INTn",
+				   "MCU_TEMP_INTn", "M2_BT_DEV_WAKE",
+				   "AUDIO_GPIO", "nFAN_OUT",
+				   "", "",
+				   "", "",
+				   "", "";
+
+		bootph-all;
+	};
+
+	eeprom@51 {
+		compatible = "atmel,24c32";
+		reg = <0x51>;
+		pagesize = <32>;
+		vcc-supply = <&vdd_3v3>;
+	};
+};
+
+&main_mcan0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&main_mcan0_pins_default>;
+	phys = <&can_tc0>;
+	status = "okay";
+};
+
+&main_spi0 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&main_spi0_pins_default>;
+	ti,pindir-d0-out-d1-in;
+	status = "okay";
+
+	accelerometer@0 {
+		compatible = "adi,adxl345";
+		reg = <0>;
+		interrupt-parent = <&main_gpio0>;
+		interrupts = <32 IRQ_TYPE_LEVEL_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&accel_irq_pins_default>;
+		spi-cpha;
+		spi-cpol;
+		spi-max-frequency = <5000000>;
+	};
+};
+
+&main_uart0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&main_uart0_pins_default>;
+	bootph-all;
+	status = "okay";
+};
+
+&main_uart1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&main_uart1_pins_default>;
+	status = "okay";
+	bootph-all;
+};
+
+&mcasp2 {
+	#sound-dai-cells = <0>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&main_mcasp2_pins_default>;
+
+	op-mode = <0>;          /* MCASP_IIS_MODE */
+	tdm-slots = <2>;
+
+	serial-dir = <  /* 0: INACTIVE, 1: TX, 2: RX */
+	       0 0 1 2
+	       0 0 0 0
+	       0 0 0 0
+	       0 0 0 0
+	>;
+	status = "okay";
+};
+
+&sdhci1 {
+	vmmc-supply = <&vdd_3v3_mmc>;
+	vqmmc-supply = <&vddshv5_sdio>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&main_mmc1_pins_default>;
+	disable-wp;
+	no-1-8-v;
+	bootph-all;
+	status = "okay";
+};
+
+&usbss0 {
+	ti,vbus-divider;
+	bootph-pre-ram;
+	status = "okay";
+};
+
+&usb0 {
+	dr_mode = "otg";
+	usb-role-switch;
+	maximum-speed = "high-speed";
+
+	port {
+		usb0_ep: endpoint {
+			remote-endpoint = <&usb0_con>;
+		};
+	};
+};
+
+/* Required for USB DFU Boot */
+&usb0_phy_ctrl {
+	bootph-pre-ram;
+};
+
+&usbss1 {
+	ti,vbus-divider;
+	status = "okay";
+};
+
+&usb1 {
+	dr_mode = "host";
+	pinctrl-names = "default";
+	pinctrl-0 = <&main_usb1_pins_default>;
+};
-- 
2.43.0


