Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF4D4CDE00E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Jun 2026 16:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XZa2aLM59D4xOOpXoe6buFQ1VgGBAiluuaiWjEnontA=; b=HhRGNuRdAZBnXjdXW8VumBufdN
	2dIAxuBqM23DOBLU6NrODlKWzlCowDMB0AetNKKEIVAobrVhi05vpoRCHjJUVxOlVrJz52G27Wj6U
	Up55yVDCds/Q6tbB9Y8U09C5FEAW87vrx/hrLXB0t3Vxt2/TGncA3fbZWMB5bqps/+cKOQ8B6bvIO
	SLSRyhHxfvs6CRQA73Crax10WgcQF9O7ZQEkkt6e26R+VKBR9WY5cjbiH/YG93EmgY/r6vnSaZ4rP
	PeMAY20yXrVIjMZqJ19hZdZFdDQQrZTL0CFGgtzCO2quaMakfZUe1tMPkAMDpBJiSPs7rk7KTeDlU
	uzbjfNOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcmXN-00000009RZa-3vZS;
	Thu, 25 Jun 2026 16:02:45 +0000
Received: from mail-northeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcmXL-00000009RXj-1H6D
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Jun 2026 16:02:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z5hAHXcQdv+LC4hs6CxwIEJCp4TEOAOD8S8KD1/iViVJcMLt1cNZ5ZWMPfGrHSCxfBrzlklh4rtnRhoHPFphvVgUlEtobOCbAzvH4WHgDjmFS4w96kBBuXf243txoipNxRkwKAh7Xitu6ztq76j2Kx1DHmHDuBRSdDPTJSpEoCFV2m6J2vXj/sdCkqAh3i3gli3zH58Xy+PkY9/M3a2xBIPfiY2TbPNcz5q4PNScAl0fLf72jizMTxCI+PXZsa9whcHl0ieFjDPD0d3EVbyAfOzBdF+BPLNWU/Sh48bBJv/3PG6NoQPm0ZEw70B1qmaTmw1cWoJR74A17ZkUx5zESA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XZa2aLM59D4xOOpXoe6buFQ1VgGBAiluuaiWjEnontA=;
 b=qeQmjTyOBZDTNcTu9bx8/ewY8zh9XaXtarB4wTDtSgylvwvADpwwRnvlcVloBRle02gLgGIq62rehQABg3ExgwyysSlX+4+b31XJoR94aEnY56mN4nhQzRXz/Hw9bfyup5O/ItoWztbQNx0o38u/zN8MPFAUh/iVEeAa2NbvlkexvPGgrFoGZASzzXSoqW/D121Am2RkNFUzTJncsOkUQv+U8QtLxcA2yBl+XT6mJ8Gckm0ScQ/+XNvXbLqFd586If/zp72iuHUCY0oKUlMmqsdRF0OEwjiDqPtyhW60vCzlrKg24cYs5I63xH2HWNaZAMnslVoANRYh80BKHkrtug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=ti.com smtp.mailfrom=phytec.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=phytec.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XZa2aLM59D4xOOpXoe6buFQ1VgGBAiluuaiWjEnontA=;
 b=hZn2UtvO7jPeoyeDM0nLfxtbat+nv0y15SFEBijEyLi6K9Vwt/pl31+v7p+822L1SmLCu/6pPHMwoS7dUhSBpJyYCDX8sufvooaovnIzMTOcmpZXU2SA/9BN+1FJjofrhw9GGgym+Uaa21LCWSvKQVPH8MehHU5vc3o7UKlISLCR7rUwu9IOIjJ0c4TNQh2OQH1WqzzLOIpcLzGN5TMAYHCS9mYFY7tFNo6H4iQubacb/mTG8KEbORF39P7O+NXWEay9qKKh8ToXPwcD4PEcS+h/csgSe0fjanifBuJRGF82OLBhXEmzhjVVIk4vtVZc6gqsIoLDS19kLBeCeSMcog==
Received: from AS4PR09CA0010.eurprd09.prod.outlook.com (2603:10a6:20b:5e0::14)
 by AM0P195MB0771.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:160::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.16; Thu, 25 Jun
 2026 16:02:35 +0000
Received: from AM4PEPF00027A65.eurprd04.prod.outlook.com
 (2603:10a6:20b:5e0:cafe::12) by AS4PR09CA0010.outlook.office365.com
 (2603:10a6:20b:5e0::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.16 via Frontend Transport; Thu,
 25 Jun 2026 16:02:35 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=phytec.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.com discourages use of 91.26.50.189 as permitted sender)
Received: from Postix.phytec.de (91.26.50.189) by
 AM4PEPF00027A65.mail.protection.outlook.com (10.167.16.86) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Thu, 25 Jun 2026 16:02:33 +0000
Received: from phytec.com (172.25.39.17) by Postix.phytec.de (172.25.0.11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 25 Jun
 2026 18:02:30 +0200
From: Nathan Morrisson <nmorrisson@phytec.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <upstream@lists.phytec.de>
Subject: [PATCH 2/2] arm64: dts: ti: Add support for the phyCORE-AM67x
Date: Thu, 25 Jun 2026 09:02:14 -0700
Message-ID: <20260625160214.4001298-2-nmorrisson@phytec.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260625160214.4001298-1-nmorrisson@phytec.com>
References: <20260625160214.4001298-1-nmorrisson@phytec.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.25.39.17]
X-ClientProxiedBy: Postix.phytec.de (172.25.0.11) To Postix.phytec.de
 (172.25.0.11)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00027A65:EE_|AM0P195MB0771:EE_
X-MS-Office365-Filtering-Correlation-Id: 58d02e6c-7726-4087-9896-08ded2d32b26
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700016|376014|1800799024|23010399003|22082099003|18002099003|3023799007|11063799006|6133799003|56012099006;
X-Microsoft-Antispam-Message-Info: q6W/8fT0ZahmBAslhtpCR6ElyhrLDGWRCUkGVq65O9ts33Dxw2rgP4vd/vmFXJzft4Ku6MfpaN1Mkik+9GS771ilkyRfas78nSVgt6TRjba0MYNNy4WJSy702Cvbq2JAomLWKnmtCOBSCElypx9zYnE7HkExilTr5A9vd4iJqVZW1Mseso+Dqd50d/lQnxqGbY3YYw0yvIkPerGFh4+Qx40kkN9HDtX/m+tmZVI2UsjeRhkrky4M9UsUZITd1fl93enzmkYT77CqItScLtLOLeuDdDl+W49MHhw/8MLL0n4kOOCeHUFkS8LPAb32aPeAFv5/n1mMNmNuSEzrfFq+3d42KYL3E6625VxWQgwwL9l43JdJVoRjOuvs2YTN7bkztTYnGzdg2+gtibtCT7xyCdxMWkHxEDNC++n+MkeNF9PYn5q2IGU9N7dHV6qaL/IJfvvdt6ZpxtXCcSJ1J8TO+RtLQ1NsNj3Akbpg+2FCt6eNZz8q/u8Jt0tYQ3nYrWTo+5cKZIRtTkbS3ULtDXAheM4LiQqqqXP5ujaibltqmlP5gMi6eDgegiLjhtXy3EsaaOv0N1FhUbrLJb4t7Urfr8Wy+YaskJoUYdIxPcFBstWXB4MFyW5xnWueGj+hc6wY+jgn8LaHBsPmD802SHMc6TT69ipGSawgFAsXyjOggawQXja6//kk3BbfYmr1+2eDVXoYgXOIggbwreTb+TJtNA==
X-Forefront-Antispam-Report: CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Postix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(1800799024)(23010399003)(22082099003)(18002099003)(3023799007)(11063799006)(6133799003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Uz3APTWDsRDTGOPTboJ9uXMPYCK7XW/b1QYt8aTwo46wWvy9WaPWAENWcGu7lEUY6yJQO043x2NYkRPGTD5Cl75yyCwH0x3oJa6V2Dg02qLbLM7pLCH4l4TMBZIMEIYypsR0n11yYw9yYYo29oO83OzDSbDldvsv+/O0YhgP6PRZVgcMF1nx2/+QnMyiJRggn8AL3qNHTF/fQnhbGhaXETTg/uoWRP0Os8tNNnseQVXo7J60D/sGjiFK8OCCroqsey/GXHH3dzf53gHWJ2TKvL+jVi2m9KT7Inf1bMEOIO47XxTH8vKYF4DLbIpD3jEi+fwWdNvPPG2Ms64jLOjb+kGN5WT6tiQDtcRMGA87V/0xhCJkwnBhktbseKI10lwG6EXUiQHJdj/F5lYXUECFSsb2Bhs7XxlumLzxOigjI/UU3oiz9cXINs6/0fq7hsmu
X-OriginatorOrg: phytec.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2026 16:02:33.6599
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 58d02e6c-7726-4087-9896-08ded2d32b26
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: AM4PEPF00027A65.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0P195MB0771
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_090243_521033_5BC928CA 
X-CRM114-Status: GOOD (  15.05  )
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

Add support for the PHYTEC phyCORE-AM67x SoM [1] and the
corresponding phyBOARD-Rigel carrier board [2]. The phyCORE-AM67x SoM
uses the TI AM67x SoC and can come with different sizes and models of
DDR, eMMC, and SPI NOR Flash.

Supported features:
  * Audio playback and recording
  * CAN
  * Debug UART
  * eMMC
  * Ethernet
  * GPIO buttons
  * Heartbeat LED
  * I2C Current sensor
  * I2C EEPROM
  * I2C Light sensor
  * I2C RTC
  * Micro SD card
  * PCIe
  * SPI NOR flash
  * USB

[1] https://www.phytec.com/product/phycore-am67x/
[2] https://www.phytec.com/product/phyboard-am67x-development-kit/

Signed-off-by: Nathan Morrisson <nmorrisson@phytec.com>
---
 arch/arm64/boot/dts/ti/Makefile               |   1 +
 .../boot/dts/ti/k3-am67-phycore-som.dtsi      | 328 ++++++++++++
 .../boot/dts/ti/k3-am6754-phyboard-rigel.dts  | 502 ++++++++++++++++++
 3 files changed, 831 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am67-phycore-som.dtsi
 create mode 100644 arch/arm64/boot/dts/ti/k3-am6754-phyboard-rigel.dts

diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
index 371f9a043fe5..623ee2369132 100644
--- a/arch/arm64/boot/dts/ti/Makefile
+++ b/arch/arm64/boot/dts/ti/Makefile
@@ -184,6 +184,7 @@ dtb-$(CONFIG_ARCH_K3) += k3-j721s2-evm-pcie1-ep.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-j721s2-evm-usb0-type-a.dtbo
 
 # Boards with J722s SoC
+dtb-$(CONFIG_ARCH_K3) += k3-am6754-phyboard-rigel.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am67a-beagley-ai.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-j722s-evm.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-j722s-evm-csi2-quad-rpi-cam-imx219.dtbo
diff --git a/arch/arm64/boot/dts/ti/k3-am67-phycore-som.dtsi b/arch/arm64/boot/dts/ti/k3-am67-phycore-som.dtsi
new file mode 100644
index 000000000000..8a40f648098e
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am67-phycore-som.dtsi
@@ -0,0 +1,328 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (C) 2026 PHYTEC America LLC
+ * Author: Nathan Morrisson <nmorrisson@phytec.com>
+ */
+
+#include <dt-bindings/net/ti-dp83867.h>
+#include <dt-bindings/leds/common.h>
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+
+/ {
+	compatible = "phytec,am67-phycore-som", "ti,j722s";
+	model = "PHYTEC phyCORE-AM67";
+
+	aliases {
+		ethernet0 = &cpsw_port1;
+		gpio0 = &main_gpio0;
+		mmc0 = &sdhci0;
+		rtc0 = &i2c_som_rtc;
+		rtc1 = &wkup_rtc0;
+		spi0 = &ospi0;
+	};
+
+	memory@80000000 {
+		/* 4G RAM */
+		reg = <0x00000000 0x80000000 0x00000000 0x80000000>,
+		      <0x00000008 0x80000000 0x00000000 0x80000000>;
+		device_type = "memory";
+		bootph-all;
+	};
+
+	reserved_memory: reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		secure_tfa_ddr: tfa@9e780000 {
+			reg = <0x00 0x9e780000 0x00 0x80000>;
+			no-map;
+		};
+
+		secure_ddr: optee@9e800000 {
+			reg = <0x00 0x9e800000 0x00 0x01800000>;
+			no-map;
+		};
+
+		wkup_r5fss0_core0_dma_memory_region: memory@a0000000 {
+			compatible = "shared-dma-pool";
+			reg = <0x00 0xa0000000 0x00 0x100000>;
+			no-map;
+		};
+
+		wkup_r5fss0_core0_memory_region: memory@a0100000 {
+			compatible = "shared-dma-pool";
+			reg = <0x00 0xa0100000 0x00 0xf00000>;
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
+};
+
+&main_pmx0 {
+	leds_pins_default: leds-default-pins {
+		pinctrl-single,pins = <
+			J722S_IOPAD(0x034, PIN_OUTPUT, 7)	/* (K22) OSPI0_CSN2.GPIO0_13 */
+		>;
+	};
+
+	mdio_pins_default: mdio-default-pins {
+		pinctrl-single,pins = <
+			J722S_IOPAD(0x0160, PIN_OUTPUT, 0)	/* (AC24) MDIO0_MDC */
+			J722S_IOPAD(0x015c, PIN_INPUT, 0)	/* (AD25) MDIO0_MDIO */
+		>;
+		bootph-all;
+	};
+
+	ospi0_pins_default: ospi0-default-pins {
+		pinctrl-single,pins = <
+			J722S_IOPAD(0x000, PIN_OUTPUT, 0)	/* (L24) OSPI0_CLK */
+			J722S_IOPAD(0x02c, PIN_OUTPUT, 0)	/* (K26) OSPI0_CSn0 */
+			J722S_IOPAD(0x00c, PIN_INPUT, 0)	/* (K27) OSPI0_D0 */
+			J722S_IOPAD(0x010, PIN_INPUT, 0)	/* (L27) OSPI0_D1 */
+			J722S_IOPAD(0x014, PIN_INPUT, 0)	/* (L26) OSPI0_D2 */
+			J722S_IOPAD(0x018, PIN_INPUT, 0)	/* (L25) OSPI0_D3 */
+			J722S_IOPAD(0x01c, PIN_INPUT, 0)	/* (L21) OSPI0_D4 */
+			J722S_IOPAD(0x020, PIN_INPUT, 0)	/* (M26) OSPI0_D5 */
+			J722S_IOPAD(0x024, PIN_INPUT, 0)	/* (N27) OSPI0_D6 */
+			J722S_IOPAD(0x028, PIN_INPUT, 0)	/* (M27) OSPI0_D7 */
+			J722S_IOPAD(0x008, PIN_INPUT, 0)	/* (L22) OSPI0_DQS */
+			J722S_IOPAD(0x038, PIN_INPUT, 7)	/* (J22) OSPI0_CSn3.GPIO0_14 */
+		>;
+		bootph-all;
+	};
+
+	pmic_irq_pins_default: pmic-irq-default-pins {
+		pinctrl-single,pins = <
+			J722S_IOPAD(0x030, PIN_INPUT, 7)	/* (K23) OSPI0_CSN1.GPIO0_12 */
+		>;
+	};
+
+	rgmii1_pins_default: rgmii1-default-pins {
+		pinctrl-single,pins = <
+			J722S_IOPAD(0x014c, PIN_INPUT, 0)	/* (AC25) RGMII1_RD0 */
+			J722S_IOPAD(0x0150, PIN_INPUT, 0)	/* (AD27) RGMII1_RD1 */
+			J722S_IOPAD(0x0154, PIN_INPUT, 0)	/* (AE24) RGMII1_RD2 */
+			J722S_IOPAD(0x0158, PIN_INPUT, 0)	/* (AE26) RGMII1_RD3 */
+			J722S_IOPAD(0x0148, PIN_INPUT, 0)	/* (AE27) RGMII1_RXC */
+			J722S_IOPAD(0x0144, PIN_INPUT, 0)	/* (AD23) RGMII1_RX_CTL */
+			J722S_IOPAD(0x0134, PIN_OUTPUT, 0)	/* (AF27) RGMII1_TD0 */
+			J722S_IOPAD(0x0138, PIN_OUTPUT, 0)	/* (AE23) RGMII1_TD1 */
+			J722S_IOPAD(0x013c, PIN_OUTPUT, 0)	/* (AG25) RGMII1_TD2 */
+			J722S_IOPAD(0x0140, PIN_OUTPUT, 0)	/* (AF24) RGMII1_TD3 */
+			J722S_IOPAD(0x0130, PIN_OUTPUT, 0)	/* (AG26) RGMII1_TXC */
+			J722S_IOPAD(0x012c, PIN_OUTPUT, 0)	/* (AF25) RGMII1_TX_CTL */
+		>;
+		bootph-all;
+	};
+};
+
+&mcu_pmx0 {
+	wkup_i2c0_pins_default: wkup-i2c0-default-pins {
+		pinctrl-single,pins = <
+			J722S_MCU_IOPAD(0x04c, PIN_INPUT_PULLUP, 0)	/* (B9) WKUP_I2C0_SCL */
+			J722S_MCU_IOPAD(0x050, PIN_INPUT_PULLUP, 0)	/* (D11) WKUP_I2C0_SDA */
+		>;
+		bootph-all;
+	};
+};
+
+&cpsw3g {
+	pinctrl-names = "default";
+	pinctrl-0 = <&rgmii1_pins_default>;
+	bootph-all;
+	status = "okay";
+};
+
+&cpsw3g_mdio {
+	pinctrl-names = "default";
+	pinctrl-0 = <&mdio_pins_default>;
+	status = "okay";
+
+	cpsw3g_phy1: ethernet-phy@1 {
+		compatible = "ethernet-phy-ieee802.3-c22";
+		reg = <1>;
+		ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_00_NS>;
+		tx-fifo-depth = <DP83867_PHYCR_FIFO_DEPTH_4_B_NIB>;
+		ti,min-output-impedance;
+	};
+};
+
+&cpsw_port1 {
+	phy-mode = "rgmii-id";
+	phy-handle = <&cpsw3g_phy1>;
+	status = "okay";
+};
+
+&cpsw_port2 {
+	status = "disabled";
+};
+
+&ospi0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&ospi0_pins_default>;
+	bootph-all;
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
+		ldo1-supply = <&vdd_3v3>;
+		ldo2-supply = <&vdd_1v8>;
+		ldo3-supply = <&vdd_3v3>;
+		ldo4-supply = <&vdd_3v3>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&pmic_irq_pins_default>;
+		interrupt-parent = <&main_gpio0>;
+		interrupts = <12 IRQ_TYPE_EDGE_FALLING>;
+		interrupt-controller;
+		#interrupt-cells = <1>;
+
+		system-power-controller;
+		ti,power-button;
+
+		regulators {
+			vdd_3v3: buck1 {
+				regulator-name = "VDD_3V3";
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			vdd_1v8: buck2 {
+				regulator-name = "VDD_1V8";
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
+			vddshv_sdio: ldo1 {
+				regulator-name = "VDDSHV_SDIO";
+				regulator-min-microvolt = <1800000>;
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
+			vdda_1v8_phy: ldo3 {
+				regulator-name = "VDDA_1V8_PHY";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			vdd_1v8_pll: ldo4 {
+				regulator-name = "VDD_1V8_PLL";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+		};
+	};
+
+	vdd_core: regulator-vdd-core@44 {
+		compatible = "ti,tps62873";
+		reg = <0x44>;
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
+		reg = <0x50>;
+		pagesize = <32>;
+	};
+
+	som_eeprom_opt: eeprom@51 {
+		compatible = "atmel,24c32";
+		reg = <0x51>;
+		pagesize = <32>;
+	};
+
+	i2c_som_rtc: rtc@52 {
+		compatible = "microcrystal,rv3028";
+		reg = <0x52>;
+	};
+};
+
+#include "k3-j722s-ti-ipc-firmware.dtsi"
diff --git a/arch/arm64/boot/dts/ti/k3-am6754-phyboard-rigel.dts b/arch/arm64/boot/dts/ti/k3-am6754-phyboard-rigel.dts
new file mode 100644
index 000000000000..7853d4f5d3b9
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am6754-phyboard-rigel.dts
@@ -0,0 +1,502 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (C) 2026 PHYTEC America LLC
+ * Author: Nathan Morrisson <nmorrisson@phytec.com>
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/phy/phy.h>
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+#include "k3-serdes.h"
+#include "k3-j722s.dtsi"
+#include "k3-am67-phycore-som.dtsi"
+
+/ {
+	compatible = "phytec,am6754-phyboard-rigel",
+		     "phytec,am67-phycore-som", "ti,j722s";
+	model = "PHYTEC phyBOARD-Rigel AM67";
+
+	aliases {
+		gpio1 = &main_gpio1;
+		mmc1 = &sdhci1;
+		serial2 = &main_uart0;
+		usb0 = &usb0;
+		usb1 = &usb1;
+	};
+
+	can_tc0: can-phy0 {
+		compatible = "ti,tcan1042";
+		#phy-cells = <0>;
+		max-bitrate = <8000000>;
+		standby-gpios = <&gpio_exp1 1 GPIO_ACTIVE_HIGH>;
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
+		id-gpios = <&main_gpio1 15 GPIO_ACTIVE_HIGH>;
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
+			gpios = <&main_gpio1 23 GPIO_ACTIVE_HIGH>;
+		};
+
+		key-menu {
+			label = "menu";
+			linux,code = <KEY_MENU>;
+			gpios = <&gpio_exp1 4 GPIO_ACTIVE_HIGH>;
+		};
+	};
+
+	pcie_refclk0: pcie-refclk0 {
+		compatible = "gpio-gate-clock";
+		pinctrl-names = "default";
+		pinctrl-0 = <&main_pcie_usb_sel_pins_default>;
+		clocks = <&serdes_refclk>;
+		#clock-cells = <0>;
+		enable-gpios = <&main_gpio0 22 GPIO_ACTIVE_LOW>;
+	};
+
+	vcc_1v8: regulator-vcc-1v8 {
+		compatible = "regulator-fixed";
+		regulator-name = "VCC_1V8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
+	vcc_3v3_aud: regulator-vcc-3v3-aud {
+		compatible = "regulator-fixed";
+		regulator-name = "VCC_3V3_AUD";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
+	vcc_3v3_mmc: regulator-vcc-3v3-mmc {
+		/* TPS22963C OUTPUT */
+		compatible = "regulator-fixed";
+		regulator-name = "VCC_3V3_MMC";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
+	vcc_3v3_sw: regulator-vcc-3v3-sw {
+		compatible = "regulator-fixed";
+		regulator-name = "VCC_3V3_SW";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
+	vcc_speaker: regulator-vcc-speaker {
+		compatible = "regulator-fixed";
+		regulator-name = "VCC_SPEAKER";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
+	sound {
+		compatible = "simple-audio-card";
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
+			"SPL", "L SPKR",
+			"SPR", "R SPKR";
+		simple-audio-card,name = "phyBOARD-Rigel";
+		simple-audio-card,format = "dsp_b";
+		simple-audio-card,bitclock-master = <&sound_master>;
+		simple-audio-card,frame-master = <&sound_master>;
+		simple-audio-card,bitclock-inversion;
+
+		simple-audio-card,cpu {
+			sound-dai = <&mcasp0>;
+		};
+
+		sound_master: simple-audio-card,codec {
+			sound-dai = <&audio_codec>;
+			clocks = <&audio_refclk1>;
+		};
+	};
+};
+
+&main_pmx0 {
+	audio_ext_refclk1_pins_default: audio-ext-refclk1-default-pins {
+		pinctrl-single,pins = <
+			J722S_IOPAD(0x0a0, PIN_OUTPUT, 1)	/* (N24) GPMC0_WPn.AUDIO_EXT_REFCLK1 */
+		>;
+	};
+
+	gpio_exp0_int_pins_default: gpio-exp0-int-default-pins {
+		pinctrl-single,pins = <
+			J722S_IOPAD(0x0054, PIN_INPUT, 7)	/* (T21) GPMC0_AD6.GPIO0_21 */
+		>;
+	};
+
+	gpio_exp1_int_pins_default: gpio-exp1-int-default-pins {
+		pinctrl-single,pins = <
+			J722S_IOPAD(0x0244, PIN_INPUT, 7)	/* (A24) MMC1_SDWP.GPIO1_49 */
+		>;
+	};
+
+	gpio_exp2_int_pins_default: gpio-exp2-int-default-pins {
+		pinctrl-single,pins = <
+			J722S_IOPAD(0x0050, PIN_INPUT, 7)	/* (T24) GPMC0_AD5.GPIO0_20 */
+		>;
+	};
+
+	gpio_keys_pins_default: gpio-keys-default-pins {
+		pinctrl-single,pins = <
+			J722S_IOPAD(0x01d4, PIN_INPUT, 7)	/* (B21) UART0_RTSn.GPIO1_23 */
+		>;
+	};
+
+	main_i2c0_pins_default: main-i2c0-default-pins {
+		pinctrl-single,pins = <
+			J722S_IOPAD(0x01e0, PIN_INPUT_PULLUP, 0)	/* (D23) I2C0_SCL */
+			J722S_IOPAD(0x01e4, PIN_INPUT_PULLUP, 0)	/* (B22) I2C0_SDA */
+		>;
+		bootph-all;
+	};
+
+	main_i2c1_pins_default: main-i2c1-default-pins {
+		pinctrl-single,pins = <
+			J722S_IOPAD(0x01e8, PIN_INPUT_PULLUP, 0)	/* (C24) I2C1_SCL */
+			J722S_IOPAD(0x01ec, PIN_INPUT_PULLUP, 0)	/* (A22) I2C1_SDA */
+		>;
+		bootph-all;
+	};
+
+	main_mcan0_pins_default: main-mcan0-default-pins {
+		pinctrl-single,pins = <
+			J722S_IOPAD(0x1dc, PIN_INPUT, 0)	/* (C22) MCAN0_RX */
+			J722S_IOPAD(0x1d8, PIN_OUTPUT, 0)	/* (D22) MCAN0_TX */
+		>;
+	};
+
+	main_mcasp0_pins_default: main-mcasp0-default-pins {
+		pinctrl-single,pins = <
+			J722S_IOPAD(0x1a8, PIN_INPUT, 0)	/* (C26) MCASP0_AFSX */
+			J722S_IOPAD(0x1a4, PIN_INPUT, 0)	/* (D25) MCASP0_ACLKX */
+			J722S_IOPAD(0x198, PIN_OUTPUT, 0)	/* (A26) MCASP0_AXR2 */
+			J722S_IOPAD(0x194, PIN_INPUT, 0)	/* (A25) MCASP0_AXR3 */
+		>;
+	};
+
+	main_mcasp1_pins_default: main-mcasp1-default-pins {
+		pinctrl-single,pins = <
+			J722S_IOPAD(0x0090, PIN_INPUT, 2)	/* (P27) GPMC0_BE0n_CLE.MCASP1_ACLKX */
+			J722S_IOPAD(0x0098, PIN_INPUT, 2)	/* (V21) GPMC0_WAIT0.MCASP1_AFSX */
+			J722S_IOPAD(0x008c, PIN_OUTPUT, 2)	/* (N23) GPMC0_WEn.MCASP1_AXR0 */
+		>;
+	};
+
+	main_mmc1_pins_default: main-mmc1-default-pins {
+		pinctrl-single,pins = <
+			J722S_IOPAD(0x023c, PIN_INPUT, 0)	/* (H22) MMC1_CMD */
+			J722S_IOPAD(0x0234, PIN_INPUT, 0)	/* (H24) MMC1_CLK */
+			J722S_IOPAD(0x0230, PIN_INPUT, 0)	/* (H23) MMC1_DAT0 */
+			J722S_IOPAD(0x022c, PIN_INPUT, 0)	/* (H20) MMC1_DAT1 */
+			J722S_IOPAD(0x0228, PIN_INPUT, 0)	/* (J23) MMC1_DAT2 */
+			J722S_IOPAD(0x0224, PIN_INPUT, 0)	/* (H25) MMC1_DAT3 */
+			J722S_IOPAD(0x0240, PIN_INPUT, 0)	/* (B24) MMC1_SDCD */
+		>;
+		bootph-all;
+	};
+
+	main_pcie_pins_default: main-pcie-default-pins {
+		pinctrl-single,pins = <
+			J722S_IOPAD(0x07c, PIN_INPUT, 7)	/* (T23) GPMC0_CLK.GPIO0_31 */
+		>;
+	};
+
+	main_pcie_usb_sel_pins_default: main-pcie-usb-sel-default-pins {
+		pinctrl-single,pins = <
+			J722S_IOPAD(0x058, PIN_INPUT, 7)	/* (T22) GPMC0_AD7.GPIO0_22 */
+		>;
+	};
+
+	main_uart0_pins_default: main-uart0-default-pins {
+		pinctrl-single,pins = <
+			J722S_IOPAD(0x01c8, PIN_INPUT, 0)	/* (F19) UART0_RXD */
+			J722S_IOPAD(0x01cc, PIN_OUTPUT, 0)	/* (F20) UART0_TXD */
+		>;
+		bootph-all;
+	};
+
+	main_usbc_power_pins_default: main-usbc-power-default-pins {
+		pinctrl-single,pins = <
+			J722S_IOPAD(0x1b4, PIN_INPUT, 7)	/* (B20) SPI0_CS0.GPIO1_15 */
+		>;
+	};
+};
+
+&audio_refclk1 {
+	assigned-clock-rates = <25000000>;
+};
+
+&main_i2c0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&main_i2c0_pins_default>;
+	clock-frequency = <400000>;
+	status = "okay";
+
+	veml6030: light-sensor@10 {
+		compatible = "vishay,veml6030";
+		reg = <0x10>;
+		vdd-supply = <&vcc_3v3_sw>;
+	};
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
+		#sound-dai-cells = <0>;
+		ai3xx-micbias-vg = <2>;
+		reset-gpios = <&gpio_exp1 7 GPIO_ACTIVE_LOW>;
+
+		HPVDD-supply = <&vcc_3v3_aud>;
+		SPRVDD-supply = <&vcc_speaker>;
+		SPLVDD-supply = <&vcc_speaker>;
+		AVDD-supply = <&vcc_3v3_aud>;
+		IOVDD-supply = <&vcc_3v3_aud>;
+		DVDD-supply = <&vcc_1v8>;
+	};
+
+	gpio_exp0: gpio@20 {
+		compatible = "nxp,pcf8574";
+		reg = <0x20>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&gpio_exp0_int_pins_default>;
+		interrupt-parent = <&main_gpio0>;
+		interrupts = <21 IRQ_TYPE_LEVEL_LOW>;
+		gpio-line-names = "CSI3_STROBE", "CSI3_TRIGGER",
+				  "CSI3_SHUTTER", "CSI3_OE",
+				  "CSI2_STROBE", "CSI2_TRIGGER",
+				  "CSI2_SHUTTER", "CSI2_OE";
+	};
+
+	gpio_exp1: gpio@21 {
+		compatible = "nxp,pcf8574";
+		reg = <0x21>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&gpio_exp1_int_pins_default>;
+		interrupt-parent = <&main_gpio1>;
+		interrupts = <49 IRQ_TYPE_LEVEL_LOW>;
+		gpio-line-names = "GPIO0_HDMI_RST", "GPIO1_CAN_nEN",
+				  "GPIO2_LED", "GPIO3_MCU_CAN0_nEN",
+				  "GPIO4_BUT2", "GPIO5_MCU_CAN1_nEN",
+				  "GPIO6_AUDIO_GPIO", "GPIO7_AUDIO_USER_RESET";
+	};
+
+	gpio_exp2: gpio@23 {
+		compatible = "nxp,pcf8574";
+		reg = <0x23>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&gpio_exp2_int_pins_default>;
+		interrupt-parent = <&main_gpio0>;
+		interrupts = <20 IRQ_TYPE_LEVEL_LOW>;
+		gpio-line-names = "CSI1_STROBE", "CSI1_TRIGGER",
+				  "CSI1_SHUTTER", "CSI1_OE",
+				  "CSI0_STROBE", "CSI0_TRIGGER",
+				  "CSI0_SHUTTER", "CSI0_OE";
+	};
+
+	current-sensor@40 {
+		compatible = "ti,ina233";
+		reg = <0x40>;
+		shunt-resistor = <18000>;
+	};
+
+	eeprom@51 {
+		compatible = "atmel,24c02";
+		reg = <0x51>;
+		pagesize = <16>;
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
+&main_uart0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&main_uart0_pins_default>;
+	bootph-all;
+	status = "okay";
+};
+
+&mcasp0 {
+	#sound-dai-cells = <0>;
+	op-mode = <0>; /* MCASP_IIS_MODE */
+	pinctrl-names = "default";
+	pinctrl-0 = <&main_mcasp0_pins_default>;
+	tdm-slots = <2>;
+	serial-dir = < /* 0: INACTIVE, 1: TX, 2: RX */
+	       0 0 1 2
+	       0 0 0 0
+	       0 0 0 0
+	       0 0 0 0
+	>;
+	status = "okay";
+};
+
+&mcasp1 {
+	#sound-dai-cells = <0>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&main_mcasp1_pins_default>;
+	op-mode = <0>; /* MCASP_IIS_MODE */
+	tdm-slots = <2>;
+	serial-dir = < /* 0: INACTIVE, 1: TX, 2: RX */
+	       1 0 2 0
+	       0 0 0 0
+	       0 0 0 0
+	       0 0 0 0
+	>;
+	status = "okay";
+};
+
+&pcie0_rc {
+	pinctrl-names = "default";
+	pinctrl-0 = <&main_pcie_pins_default>;
+	num-lanes = <1>;
+	phys = <&serdes1_pcie_link>;
+	phy-names = "pcie-phy";
+	reset-gpios = <&main_gpio0 31 GPIO_ACTIVE_HIGH>;
+	status = "okay";
+};
+
+&sdhci1 {
+	/* SD/MMC */
+	vmmc-supply = <&vcc_3v3_mmc>;
+	vqmmc-supply = <&vddshv_sdio>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&main_mmc1_pins_default>;
+	disable-wp;
+	no-1-8-v;
+	bootph-all;
+	status = "okay";
+};
+
+&serdes_ln_ctrl {
+	idle-states = <J722S_SERDES0_LANE0_USB>,
+		      <J722S_SERDES1_LANE0_PCIE0_LANE0>;
+};
+
+&serdes0 {
+	status = "okay";
+
+	serdes0_usb_link: phy@0 {
+		reg = <0>;
+		cdns,num-lanes = <1>;
+		#phy-cells = <0>;
+		cdns,phy-type = <PHY_TYPE_USB3>;
+		resets = <&serdes_wiz0 1>;
+	};
+};
+
+&serdes_wiz0 {
+	status = "okay";
+};
+
+&serdes1 {
+	status = "okay";
+
+	serdes1_pcie_link: phy@0 {
+		reg = <0>;
+		cdns,num-lanes = <1>;
+		#phy-cells = <0>;
+		cdns,phy-type = <PHY_TYPE_PCIE>;
+		resets = <&serdes_wiz1 1>;
+	};
+};
+
+&serdes_wiz1 {
+	clocks = <&k3_clks 280 0>, <&k3_clks 280 1>, <&pcie_refclk0>;
+	status = "okay";
+};
+
+&usbss0 {
+	ti,vbus-divider;
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
+&usbss1 {
+	ti,vbus-divider;
+	status = "okay";
+};
+
+&usb1 {
+	dr_mode = "host";
+	phys = <&serdes0_usb_link>;
+	phy-names = "cdns3,usb3-phy";
+	maximum-speed = "super-speed";
+};
-- 
2.43.0


