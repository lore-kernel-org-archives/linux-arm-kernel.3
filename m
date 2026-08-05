Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0240CC55ABA
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 17:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sUxrUiiVXc47znSk1gJJeh0wPZJwcabbJNZXK79h48U=; b=ybItpGkd2voWZOUre026W5hhTm
	VU/KJwMMzYFrVDbnJHDeD/DTBF/wEwzx7wOC5X9eCCBho/JjzrHDMT282jfU4WzpdQ0thq5B3qKuW
	n2WMtf3GXW3uAmgBEQoA2pNFu0XCnqGBw2E2p2XDtWRXOu7dpUDCB0zRHL8xVbrmFok3NYFC1CnCI
	RWlTuLPyPZzGMgsfggwfojKew5FhuTsXGCGVmRqx+WnuoQzURimWjhj+PB2nkLDaBrfoQYp7YoVQj
	h+6h7Iefr58GLnqsfwdHFTl1+y5YbLJi8PTSuzopueCNl2FL+ANZm/H6Fybf6rtg6exJcSEdUmyvM
	ugCcjyAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrfOx-00000004KdT-3MOT;
	Wed, 05 Aug 2026 17:27:35 +0000
Received: from mail-francesouthazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c207::3] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrfOu-00000004Kcj-3CF5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Aug 2026 17:27:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eh0wyQFaEbS1ccmnnOx438ZU7n8JyDyelhZGERt6qjmxRCkR1aKHmQErExJ75kbTXZh3g31WXCeNRtOEr7knI7U8xHvT85O58S4P+VdTQbrvAAOk7xQU6p0//xSPSO2lqvB5+TQzm0VF+EOjzPTWj51AF8Nn+taxW3ZqCVJbUDqh0f7xKr89bs7inF2r9JZ+klhiblLXNZtDz+rE97FIxwCFV8LiQlxRIrD1Q2I9FNyjkqWprW5PBweze3IiTes/8GJQwT/4esrrw2xgpWfN0dC+4sGfG4/GmwTbnfm+KD+tF9M+Sqhjp8MnQCfUdvcLT7aNNhJWgymaPzQID8jQDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sUxrUiiVXc47znSk1gJJeh0wPZJwcabbJNZXK79h48U=;
 b=LR+zZxLi+HkS5HHMgMwY5r65f9TzRCvhLF+/uQqC7py5NlYOKpMigKo+8M6SfwCTis5Bucl3hXSAxD2TgRbWhADZlmk/CjvwowEPPUm/IFS4nj/zPQxYGTKfDjuo7U7SPHryjVtPvOOmuXBNPOqbcqQhr//7I/1+3nb2LsRwPA+tG6rzsp/NIW54qHosJA8wrsFfo9z064kiM+EMIQK1YBa+g4rtsAh47uwdG9bSaJyjy+H4ooMahHiKE+eq4i0vyRj9qWaZyZZrNfsTZKg8XxTCPZLwdDsv084O972duCE9PGDHvVABq60uP3OITaadBu/IJf1q6DNMHcJC/pj0sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=ti.com smtp.mailfrom=phytec.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=phytec.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sUxrUiiVXc47znSk1gJJeh0wPZJwcabbJNZXK79h48U=;
 b=o2N8fEXriEa60efRclRjZBMvX52dW0e65+6VFR2d6XsM33OTVz28YnnRVhYT7LTmbkoq3MkzqmVjE9ib+NotMPQdHJMYZSf9GSOOHrlaxd51qkBLRMCFVRyUUk5Qa1Z/d94agRQZNjfIiojrrl9Y7P+5FdYJw19nPvyYqe/bXfwqu2NMY05BqE0WTFf8/4Y6lGmh19eZV+WGUvdavn8Gok0JGz88BGYA1UXDg03h2wBXR4Zfvh61aqPjmdbPzwMpo+ilEOvMWovzRUjZkqpGjlxnd0YHgYNaqfrrLwy+MqHwOuRAu3WUVCCVQ8m7AVDsz7d8QiSle+CJXdSNby2LDQ==
Received: from AS4P192CA0011.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:5da::8)
 by GV4P195MB2723.EURP195.PROD.OUTLOOK.COM (2603:10a6:150:28a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Wed, 5 Aug
 2026 17:27:25 +0000
Received: from AM4PEPF00027A65.eurprd04.prod.outlook.com
 (2603:10a6:20b:5da:cafe::85) by AS4P192CA0011.outlook.office365.com
 (2603:10a6:20b:5da::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.15 via Frontend Transport; Wed, 5
 Aug 2026 17:27:25 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=phytec.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.com discourages use of 91.26.50.189 as permitted sender)
Received: from Postix.phytec.de (91.26.50.189) by
 AM4PEPF00027A65.mail.protection.outlook.com (10.167.16.86) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.8 via Frontend Transport; Wed, 5 Aug 2026 17:27:24 +0000
Received: from wl-jma.com (172.25.39.17) by Postix.phytec.de (172.25.0.11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 5 Aug
 2026 19:27:21 +0200
From: John Ma <jma@phytec.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <w.egorov@phytec.de>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <upstream@lists.phytec.de>, John Ma
	<jma@phytec.com>
Subject: [PATCH v2 2/2] arm64: dts: ti: Add support for the phyCORE-AM62Px
Date: Wed, 5 Aug 2026 10:26:58 -0700
Message-ID: <20260805172658.3892154-2-jma@phytec.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260805172658.3892154-1-jma@phytec.com>
References: <20260805172658.3892154-1-jma@phytec.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.25.39.17]
X-ClientProxiedBy: Postix.phytec.de (172.25.0.11) To Postix.phytec.de
 (172.25.0.11)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00027A65:EE_|GV4P195MB2723:EE_
X-MS-Office365-Filtering-Correlation-Id: 44fa551d-eb84-484c-8fa0-08def316d059
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|36860700016|23010399003|376014|13003099007|6133799003|56012099006|11063799006|10067099003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: KV3rzaE1CX0YRfYG2/mBOJsfuTIzOrEhYVRowclVtGruZ+arz66r6vOniPDf8MSujUmqGHqJXB5Wd4BXgEkQ82N5e8H6aFpkyFEC82TEvNvBtsOdpACJDCqTKx3R5e2IXW8gKnsFTj6iEYy9zG3bbgUmuSdrGJAdKps6kqdaAx43/dcHgcRkeB4AUD/OQDuAdgpS/DV+rcxiq31PYnxGoFAt9M6OuaguFCb+F98DhSP4ZSof0gTxbCbjK8HHtZF2uDXaB1VqyjzavKNDpPvK30TGKZKmbLi4ZBQ8IMBNUattq0EMiKc6vZkWTxG2wIotCSSFKbW6529E1S3mxnxbNNr5eyYBBN08ghBHzrKZ+6yeADd6goYt49+oVoN6lX0OC/Hd64x5sxYP3PeD0KrRyn+OHO6s/792oxiTFxnVNDD0rnuVkJ4xY4xeU9e5mPMvrM648bsG/YSLnRZjo59GpnuB7arEN6x/ULf3nXr2RCzBP0+wVPD0Mve8guXO2dSsOumINMlMiMDKISbjj6bd1OjrhIWR3ZXAFpnAuCX/jRZWMNlVSh8A7IJz/63gmG8OkQgNcK3y9IaG9eTKSocoFj4rIcUoipJW28nS9HsB5pSFqiR4Xbi9oIP8t3S6ePjNeI929FOJl+pBmqVS2VaMsZSQTtcUHyYG1xFIdje0udKEoSUsf7krNK30hxDJteRDopPa29E8JlbwHGa+xx/VDQ==
X-Forefront-Antispam-Report: CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Postix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(23010399003)(376014)(13003099007)(6133799003)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 38UQJ/L4hPq8QEj+FMM7wYEIKp5dpUWCwlYPngPTetljnOvMi/6oZELYMMUSLA/nDvW7smz0VemKGDOfXGLnXEZ7pJAB2kFOMc16s1y9FvME62uOnQ2IZJRQOzrNXpqRFAfuwxcsFh6BEuLaseT/nBbb4Jyh9nNwmD/3xh85V8GCMspoP0suJ/opoMj37PIr7fK6LEPtAxtHsiNdP+TkW08BzcSlRJo67SwMUxCo0GccPaLuvz0yx8qWkZAEaFwdTdMN7z+5V7xflCyJN6bPnS74/rugErUj8xtnDtESwXaWmmRDYjSTsN+r6S+SLcfrMYC/C6KWDOk64nov7P5BSKJ7Cnur0ikvIZ6LyF7eaLbl2+hcxgQG9MtWNHir5SNO++tIebmMdQ8yWkV/1+RPyMycoxccpv0vBif/ZMOVrEqktsKfBVMYAKVqf1uei792
X-OriginatorOrg: phytec.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2026 17:27:24.3121
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 44fa551d-eb84-484c-8fa0-08def316d059
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: AM4PEPF00027A65.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4P195MB2723
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_102732_969344_FADCD9FA 
X-CRM114-Status: GOOD (  16.38  )
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

Test results:
https://gist.github.com/jma-phytec/fd7911a834e39b3fac0104690668882e

Signed-off-by: John Ma <jma@phytec.com>
---
v2:
  - added bootph-all in cpsw3g_phy1 node
  - fixed ti,fifo-depth property deprecated issue
  - update ospi vcc-supply label from SoM
  - added bootph-all in wkup_i2c0 node
  - sorted nodes in alphabetical order
  - sorted vendor property
  - removed unsed leds from phyboard lynx dts
  - added chosen/stdout-path
  - update usb0_connector node with proper name
  - fixed missing space
  - removed unused pinmux
  - removed bootph-all from rgmii2 pinmux
  - added interrupt-names for adxl345 node
  - sorted status property in main_uart1

 arch/arm64/boot/dts/ti/Makefile               |   1 +
 .../boot/dts/ti/k3-am62p-phycore-som.dtsi     | 340 ++++++++++++
 .../boot/dts/ti/k3-am62p5-phyboard-lynx.dts   | 522 ++++++++++++++++++
 3 files changed, 863 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62p-phycore-som.dtsi
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62p5-phyboard-lynx.dts

diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
index 371f9a043fe5..b223681cdfbf 100644
--- a/arch/arm64/boot/dts/ti/Makefile
+++ b/arch/arm64/boot/dts/ti/Makefile
@@ -76,6 +76,7 @@ dtb-$(CONFIG_ARCH_K3) += k3-am62d2-evm.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am62l3-evm.dtb
 
 # Boards with AM62Px SoC
+dtb-$(CONFIG_ARCH_K3) += k3-am62p5-phyboard-lynx.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am62p5-sk.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am62p5-var-som-symphony.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am62p5-verdin-nonwifi-dahlia.dtb
diff --git a/arch/arm64/boot/dts/ti/k3-am62p-phycore-som.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-phycore-som.dtsi
new file mode 100644
index 000000000000..4f273f3dc2ad
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am62p-phycore-som.dtsi
@@ -0,0 +1,340 @@
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
+	leds_pins_default: leds-default-pins {
+		pinctrl-single,pins = <
+			AM62PX_IOPAD(0x0034, PIN_OUTPUT, 7) /* (L22) OSPI0_CSn2.GPIO0_13 */
+		>;
+	};
+
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
+	pmic_irq_pins_default: pmic-irq-default-pins {
+	       pinctrl-single,pins = <
+			AM62PX_IOPAD(0x01f4, PIN_INPUT, 7) /* (C23) EXTINTn.GPIO1_31 */
+	       >;
+	};
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
+&cpsw3g {
+	pinctrl-names = "default";
+	pinctrl-0 = <&main_rgmii1_pins_default>;
+	bootph-all;
+	status = "okay";
+};
+
+&cpsw3g_mdio {
+	pinctrl-names = "default";
+	pinctrl-0 = <&main_mdio0_pins_default>;
+	status = "okay";
+
+	cpsw3g_phy1: ethernet-phy@1 {
+		reg = <1>;
+		bootph-all;
+		tx-fifo-depth = <DP83867_PHYCR_FIFO_DEPTH_4_B_NIB>;
+		ti,min-output-impedance;
+		ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_00_NS>;
+	};
+};
+
+&cpsw_port1 {
+	phy-mode = "rgmii-id";
+	phy-handle = <&cpsw3g_phy1>;
+	bootph-all;
+	status = "okay";
+};
+
+&fss {
+	bootph-all;
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
+		vcc-supply = <&vdd_1v8_som>;
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
+	bootph-all;
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
+		system-power-controller;
+		ti,power-button;
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
index 000000000000..d7949690406c
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am62p5-phyboard-lynx.dts
@@ -0,0 +1,522 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (C) 2026 PHYTEC America LLC
+ * Author: John Ma <jma@phytec.com>
+ *
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
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
+	chosen {
+		stdout-path = &main_uart0;
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
+		compatible = "gpio-usb-b-connector", "usb-b-connector";
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
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+		regulator-boot-on;
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
+	gpio_keys_pins_default: gpio-keys-default-pins {
+		pinctrl-single,pins = <
+			AM62PX_IOPAD(0x0128, PIN_INPUT, 7) /* (K25) MMC2_SDWP.GPIO0_72 */
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
+&cpsw3g_mdio {
+	cpsw3g_phy2: ethernet-phy@2 {
+		reg = <2>;
+		tx-fifo-depth = <DP83867_PHYCR_FIFO_DEPTH_4_B_NIB>;
+		ti,min-output-impedance;
+		ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_00_NS>;
+	};
+};
+
+&cpsw_port2 {
+	phy-mode = "rgmii-id";
+	phy-handle = <&cpsw3g_phy2>;
+	status = "okay";
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
+		pinctrl-names = "default";
+		pinctrl-0 = <&accel_irq_pins_default>;
+		spi-cpha;
+		spi-cpol;
+		spi-max-frequency = <5000000>;
+		interrupt-parent = <&main_gpio0>;
+		interrupts = <32 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "INT1";
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
+	bootph-all;
+	status = "okay";
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


