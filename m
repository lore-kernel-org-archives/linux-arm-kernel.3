Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EB1FCD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 02:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FlFOu5MqxDFGL7C9V1EuJH8tdOybCgc7Gu6RlGlhbJ0=; b=mkgdMu5+862kwaFRat8LplXH72
	aBZoybmrxFdMS4o2yDrm1gKMd4p2XM8Ooz79ZfAVZnfVcnQ+QE/KwGc7dj/se0bztKxyIrVrfSfEY
	gr93cDYBXxD7JY0IozMJT+7xpdROPj55Ozgay0cJjty5G1zGVZg4G5pgE7l6ywPSoi/b1B1Iav2Nr
	DRNyi+XYzlgWO6cd/2YxS9L4H+3ZULUfORZH5gntyU643AqtQfBToSJXVSkhImYo2rKMW8/8FjLsC
	W3JAgpPNCvXIfP858FnTgSlh1sU46HP5gLBPWupLCDF3MaZ49nNoYgimmgQtx2nwdNCBwcvzUqYJe
	siLfiwTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPsoA-00000006QeM-3UDl;
	Thu, 21 May 2026 02:06:46 +0000
Received: from mail-westusazlp170120002.outbound.protection.outlook.com ([2a01:111:f403:c001::2] helo=SJ2PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPso6-00000006Qdt-1j8y
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 02:06:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NrNBYY/wPGMR9RFRHPIkiwi7kw8z0C17K6aoSPYc6fFhS8sUNSM0kACNu2w2q4nU5IZOQv9nU8cBA1VxKtWKllsKLp48T64ja9uEe3iy3Qwvu+9xVr/l3WWbXRIDoVLYX/wPoUy5JLqM2w94C03DcNi9imjFn0gr/intT7MMkg4j5csPIY5qbbun3xS5mUwKl45wS8srynaMQgJ6zwbuCHtKG9n+hYkKEpAJ1kMdtdNQpuBdLG5VpDkJ8X6zi1rVelYPSHhNQnLgjSoHg7sjNxqp5jtKKMzzpXGlVZQgpVFe91CkZPO1Kppl3ji4wITrcAclR6yupOafvvkfZy9vzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FlFOu5MqxDFGL7C9V1EuJH8tdOybCgc7Gu6RlGlhbJ0=;
 b=aWxBURMRkmnlIw2NmZ/euW4zMX5jcFA1EIOcdQ7TFgKyNrl1SsTdZ8cCFS5zGDHt4gz7hwmcVo0Sgjw622XMPk4FDCtC0kU2PUMSGSKknHTqr4xO+S6Ya1LoXgffw9HtqbMeytaA/d8pIXrxu15IGhRkRJAgtbiIidMJGFcLNlGPApgNlXWI7frkhde2D1a68lPQWreGEBjQN1f0TL3krYQOa3iH589WpEe6r8MbF+s40vlWnEljx9GRCHglQJhMKFq+DjcoHWnCed6M4WBMNlY4srMDxjSLL74IfHS7N1C1stG6gjOiE3N+iRkTFP8PTMIYyVT6JiY+Qfo32lZ4HQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FlFOu5MqxDFGL7C9V1EuJH8tdOybCgc7Gu6RlGlhbJ0=;
 b=Qa9lWWvTneo0d6AgzGB0t3CMfO+kl5N626NDmlkH9zmCXcQ3T6bsLgy1rUlprHhMxDAJ7cW0vLMdpvNspVNfVNnNsUbZoCMl6r3srY8RTQjZlzswqRO4bVg8h1H1rLQnzJRTTVE9+88WVeKwz0TVM08eXtkIO9hMPnyh5GN1648=
Received: from MN2PR16CA0061.namprd16.prod.outlook.com (2603:10b6:208:234::30)
 by SJ2PR10MB7013.namprd10.prod.outlook.com (2603:10b6:a03:4c6::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.16; Thu, 21 May
 2026 02:06:36 +0000
Received: from BL6PEPF00022573.namprd02.prod.outlook.com
 (2603:10b6:208:234:cafe::7c) by MN2PR16CA0061.outlook.office365.com
 (2603:10b6:208:234::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.16 via Frontend Transport; Thu, 21
 May 2026 02:06:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BL6PEPF00022573.mail.protection.outlook.com (10.167.249.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.11 via Frontend Transport; Thu, 21 May 2026 02:06:36 +0000
Received: from DLEE215.ent.ti.com (157.170.170.118) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 20 May
 2026 21:06:35 -0500
Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 20 May
 2026 21:06:35 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 20 May 2026 21:06:35 -0500
Received: from a0512632.dhcp.ti.com (a0512632.dhcp.ti.com [172.24.233.20])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 64L26UOE2630310;
	Wed, 20 May 2026 21:06:31 -0500
From: Swamil Jain <s-jain1@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<tomi.valkeinen@ideasonboard.com>
CC: <r-sharma3@ti.com>, <devarsht@ti.com>, <praneeth@ti.com>,
	<linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <s-jain1@ti.com>
Subject: [PATCH v2] arm64: dts: ti: Add LincolnTech OLDI LCD-185 Overlay for AM625-BeaglePlay
Date: Thu, 21 May 2026 07:36:30 +0530
Message-ID: <20260521020630.816220-1-s-jain1@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00022573:EE_|SJ2PR10MB7013:EE_
X-MS-Office365-Filtering-Correlation-Id: 38ab1d09-c0b3-4458-f2f6-08deb6dd968b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|82310400026|36860700016|1800799024|3023799007|18002099003|56012099003|13003099007|6133799003;
X-Microsoft-Antispam-Message-Info: uo2dqegCUelzlMFrGWrjpSDDjx3lvyN5vMeNzmoGj7QXky41geO2LfF06TaZzBo0wIqOxo1ZALrcUkuZVigCYX8J0veA+SV7k/W/8tV2gXAbX5N2DWiBnesetBTevuRF8qZdDy3EnsJDt4NZxxRfuSD7Brpqu6OsLOfXgC3jMSKFqCff139jmPtP07vXr/TYQqC2mMkfpwjVIhTfR9AzTv1zBfoxomppl/Pew1LSqPWSv+JDqCxP5/B1XHWyJh6Zsci6LUXLuiic2umi0AG4CHzEA5hCoeA7FfAIdRutDWAF7iewnexwR3ukdL+tsq34Wqx4vpYQWCPNBxVL4Lm3MA6x8QqTpcYVoM6LquUNF2MP1jZB08jwnyhlh9cHIA5SQMa4voB8lFLbAGNawVnjQdHKNE8XW4hQtpe0toM1B4wCoAtFmB2MLo0ut0tNWoAlcEzMPHLdZ+l8hbWXrx/gcYrd4qS4jh+4bO9IPaqTdHg1PNVBXU1pdT4yCT5V9L9Q6Nmt3kRLkFuCUsKThRxb0ghfFxCPIscD5yh/S1WAl7BzsHQGJGw+cLEKvLVqp0CV26DAjykLh6jn0c9A8PSbSYYVVVGRTzAB8FTirh8vHQKt27nIM+labIkCmCfSTm60MKBOSEn7KZX7BqstN/hhHa90qz7jnPDJhdz8XDJG6MY=
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700016)(1800799024)(3023799007)(18002099003)(56012099003)(13003099007)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: KUUgXEfmWIg+dWub6eycSyGyMXI4B82PcZQdpdIMOpxblNFICepVYsj1ogKwsW95uAX2HBDTE87eFI3RxApeHLlHWu6CLKlJA15gl6By2sfGkg8XRgxiVqLQ42va2M4ud++e2oFigMTRhHvL0jjEUyiUyqeNiwqGp8Uzhmobwy7oQwpw4hoiIXBSjQYEJQGDb5Gi+bkleOODVRwYSLK4GKuHjN70Abr4/tmybcF8OHqaj4ike5U+g2yapuPmTJBxvjLH4/QrCpJLN+DOTjw0xaB6FdOPHtVMQHY6eZwR0i5C7D52hVgiBbWdgetCIMPnv3SB+L30l3ZpD4ng5rWzD4eGAqNt1p8LmPJLbbXTO41t6gPkPcIHtq3srS+JIKF2lSQ9/RfgF/k3tJncE0ycr0Ep81z7QVwo3r3SzjnmKDCNpsNPLP7FxSMeNcXC0scr
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2026 02:06:36.1793
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 38ab1d09-c0b3-4458-f2f6-08deb6dd968b
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF00022573.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR10MB7013
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_190642_543979_236B2F75 
X-CRM114-Status: GOOD (  17.47  )
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

From: Aradhya Bhatia <a-bhatia1@ti.com>

The panel is Lincoln Technology Solutions LCD185-101CT[0]. It is a
Dual-Link LVDS panel and supports WUXGA resolution (1920x1200).
Furthermore, it has an i2c based touch controller: Goodix-GT928.

Add DT overlay for the OLDI panel to connect with BeaglePlay platform.

[0]: https://lincolntechsolutions.com/wp-content/uploads/2024/09/LCD185-101CTL1ARNTT_DS_R1.3.pdf

Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
Signed-off-by: Swamil Jain <s-jain1@ti.com>
---
Changelog:
v1->v2:
Move overlay-specific pinmux configurations from base device tree to
k3-am625-beagleplay-lincolntech-lcd185-panel.dtso file.

link to v1: https://lore.kernel.org/all/20260514225502.2327771-1-s-jain1@ti.com/
---
 arch/arm64/boot/dts/ti/Makefile               |   4 +
 ...5-beagleplay-lincolntech-lcd185-panel.dtso | 165 ++++++++++++++++++
 2 files changed, 169 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am625-beagleplay-lincolntech-lcd185-panel.dtso

diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
index 7642c06ca834..f0436a102fce 100644
--- a/arch/arm64/boot/dts/ti/Makefile
+++ b/arch/arm64/boot/dts/ti/Makefile
@@ -12,6 +12,7 @@
 dtb-$(CONFIG_ARCH_K3) += k3-am625-beagleplay.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am625-beagleplay-csi2-ov5640.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am625-beagleplay-csi2-tevi-ov5640.dtbo
+dtb-$(CONFIG_ARCH_K3) += k3-am625-beagleplay-lincolntech-lcd185-panel.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am625-phyboard-lyra-rdk.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am625-sk.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am625-tqma62xx-mba62xx.dtb
@@ -177,6 +178,8 @@ k3-am625-beagleplay-csi2-ov5640-dtbs := k3-am625-beagleplay.dtb \
 	k3-am625-beagleplay-csi2-ov5640.dtbo
 k3-am625-beagleplay-csi2-tevi-ov5640-dtbs := k3-am625-beagleplay.dtb \
 	k3-am625-beagleplay-csi2-tevi-ov5640.dtbo
+k3-am625-beagleplay-lincolntech-lcd185-panel-dtbs := k3-am625-beagleplay.dtb \
+	k3-am625-beagleplay-lincolntech-lcd185-panel.dtbo
 k3-am625-phyboard-lyra-disable-eth-phy-dtbs := k3-am625-phyboard-lyra-rdk.dtb \
 	k3-am6xx-phycore-disable-eth-phy.dtbo
 k3-am625-phyboard-lyra-disable-rtc-dtbs := k3-am625-phyboard-lyra-rdk.dtb \
@@ -287,6 +290,7 @@ k3-j784s4-evm-usxgmii-exp1-exp2-dtbs := k3-j784s4-evm.dtb \
 	k3-j784s4-evm-usxgmii-exp1-exp2.dtbo
 dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
 	k3-am625-beagleplay-csi2-tevi-ov5640.dtb \
+	k3-am625-beagleplay-lincolntech-lcd185-panel.dtb \
 	k3-am625-phyboard-lyra-disable-eth-phy.dtb \
 	k3-am625-phyboard-lyra-disable-rtc.dtb \
 	k3-am625-phyboard-lyra-disable-spi-nor.dtb \
diff --git a/arch/arm64/boot/dts/ti/k3-am625-beagleplay-lincolntech-lcd185-panel.dtso b/arch/arm64/boot/dts/ti/k3-am625-beagleplay-lincolntech-lcd185-panel.dtso
new file mode 100644
index 000000000000..e7cadd48d439
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am625-beagleplay-lincolntech-lcd185-panel.dtso
@@ -0,0 +1,165 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/**
+ * Lincoln tech Solutions OLDI panel (LCD185-101CT) and touch DT overlay for AM625-BeaglePlay
+ *
+ * AM625-BeaglePlay: https://www.beagleboard.org/boards/beagleplay
+ * Panel datasheet: https://lincolntechsolutions.com/wp-content/uploads/2024/09/LCD185-101CTL1ARNTT_DS_R1.3.pdf
+ *
+ * Copyright (C) 2026 Texas Instruments Incorporated - http://www.ti.com/
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+#include "k3-pinctrl.h"
+
+&{/} {
+	backlight: backlight {
+		compatible = "pwm-backlight";
+		pinctrl-names = "default";
+		pinctrl-0 = <&backlight_pins_default>;
+		brightness-levels = <0 4 8 16 32 64 128 255>;
+		default-brightness-level = <6>;
+		enable-gpios = <&main_gpio0 0 GPIO_ACTIVE_HIGH>;
+		pwms = <&epwm0 1 20000 0>;
+	};
+
+	lcd {
+		compatible = "lincolntech,lcd185-101ct";
+		backlight = <&backlight>;
+		/*
+		* Note that the OLDI TX 0 transmits the odd set of pixels
+		* while the OLDI TX 1 transmits the even set. This is a
+		* fixed configuration in the IP integration and is not
+		* changeable. The properties, "dual-lvds-odd-pixels" and
+		* "dual-lvds-even-pixels" have been used to merely
+		* identify if a Dual Link configuration is required.
+		* Swapping them will cause an error in the dss oldi driver.
+		*/
+		power-supply = <&vsys_5v0>;
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				dual-lvds-odd-pixels;
+				lcd_in0: endpoint {
+					remote-endpoint = <&oldi_0_out>;
+				};
+			};
+			port@1 {
+				reg = <1>;
+				dual-lvds-even-pixels;
+				lcd_in1: endpoint {
+					remote-endpoint = <&oldi_1_out>;
+				};
+			};
+		};
+	};
+};
+
+&main_pmx0 {
+	touchscreen_pins_default: touchscreen-default-pins {
+		pinctrl-single,pins = <
+			AM62X_IOPAD(0x01b4, PIN_OUTPUT, 7) /* (A13) SPI0_CS0.GPIO1_15 */
+			AM62X_IOPAD(0x00a0, PIN_INPUT, 7) /* (K25) GPMC0_WPn.GPIO0_39 */
+		>;
+	};
+
+	backlight_pins_default: bl-default-pins {
+		pinctrl-single,pins = <
+			AM62X_IOPAD(0x0000, PIN_OUTPUT, 7) /* (H24) OSPI0_CLK.GPIO0_0 */
+			AM62X_IOPAD(0x01b8, PIN_OUTPUT, 2) /* (C13) SPI0_CS1.EHRPWM0_B */
+		>;
+	};
+};
+
+&dss {
+	status = "okay";
+};
+
+&oldi0 {
+	status = "okay";
+	ti,companion-oldi = <&oldi1>;
+};
+
+&oldi1 {
+	status = "okay";
+	ti,secondary-oldi;
+	ti,companion-oldi = <&oldi0>;
+};
+
+&oldi0_port0 {
+	oldi_0_in: endpoint {
+		remote-endpoint = <&dpi0_out0>;
+	};
+};
+
+&oldi0_port1 {
+	oldi_0_out: endpoint {
+		remote-endpoint = <&lcd_in0>;
+	};
+};
+
+&oldi1_port0 {
+	oldi_1_in: endpoint {
+		remote-endpoint = <&dpi0_out1>;
+	};
+};
+
+&oldi1_port1 {
+	oldi_1_out: endpoint {
+		remote-endpoint = <&lcd_in1>;
+	};
+};
+
+&dss_ports {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	/* VP1: Output to OLDI */
+	port@0 {
+		reg = <0>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		dpi0_out0: endpoint@0 {
+			reg = <0>;
+			remote-endpoint = <&oldi_0_in>;
+		};
+		dpi0_out1: endpoint@1 {
+			reg = <1>;
+			remote-endpoint = <&oldi_1_in>;
+		};
+	};
+};
+
+&main_i2c2 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	eeprom@57 {
+		compatible = "atmel,24c256";
+		reg = <0x57>;
+	};
+
+	touchscreen@5d {
+		compatible = "goodix,gt928";
+		reg = <0x5d>;
+		pinctrl-names = "default";
+	        pinctrl-0 = <&touchscreen_pins_default>;
+		interrupt-parent = <&main_gpio0>;
+		interrupts = <39 IRQ_TYPE_EDGE_FALLING>;
+		irq-gpios = <&main_gpio0 39 GPIO_ACTIVE_HIGH>;
+		reset-gpios = <&main_gpio1 15 GPIO_ACTIVE_HIGH>;
+		touchscreen-size-x = <1920>;
+		touchscreen-size-y = <1200>;
+	};
+};
+
+&epwm0 {
+	status = "okay";
+};

