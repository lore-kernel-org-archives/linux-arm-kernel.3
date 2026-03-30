Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B23CFFB3CEB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 09:45:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1gK5oPIwZRJnJdp4D/scfbfgF3FLbw7zD3sqOjpu2po=; b=SP/8O66Ct0AhRK2wXvtn9SIZXO
	lzkpuBOEq+9Ldi/GNJXKVTy8FDaI1QRFCWd44FiO9Nxbbdh1g+3OINjZyg6Stm4+5Iq7eF7x9FSM5
	Sldwc5N3hr/WRR0ZIdQV3/K1DLfuXfPDvyF1TGQyFrv+f/JeXk5s0das4LdPCvw8ewtwmsPZV9DqM
	N3lm3e/ifVgB7s6JVzeD7QGIaWtljf3lAug9WEhU1tpMjp0xkRkY2xehc+QEy040XVr3PXdmwBOOX
	SIEimqtvXXYIiPodA9TnbOpzFVtcnOWuH6LlaX+4ghciv/nHUKR5dCH7nGaX6cR18hHoTm6NfnIWn
	83dJlhhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w79BW-0000000AzMs-2CbL;
	Mon, 30 Mar 2026 09:45:26 +0000
Received: from mail-westcentralusazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c112::7] helo=CY3PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w79BO-0000000AzKP-2Pq8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Mar 2026 09:45:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jceKHeBJzhPw/O1O05qUMO5jz4huXmuZLjFOHg+rITQ/i3lBaMgE6alaBCKP3jEdwLiizXG2YgrH9/6mszZpVSSzBWYb9Fb8SNxue+CBTt91Tr6ROuvhAuiVzG8Ms+Ho4iq+6wwBK7VHbEv1lorLYXRgef+2DhAfSakBpRxqQjE007Hq+WrEnjBu9Ad2z541XWJmLdyVrW/a2Viw0sSdDY95fwvXQ2bx/iSqAxo/bp50a259KcyjZMJTYb57cF4YqL2ijXeER+/5m5wbatl7Xp6r49dFsW7nynVWgju7Nzks/18TznS4xk4mb0yw2o0vX6Ekki8xHKsgv+WY3JFmcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1gK5oPIwZRJnJdp4D/scfbfgF3FLbw7zD3sqOjpu2po=;
 b=dsv6v1e8rLDpGunDfIswzQoYssy6rbCgoWikULGyvRLNVejzHoth+HAGSX2ttyUO2nuKTet7VqETXLLo/VKcYLWjGNJYjWC04ioUyLN+bPNgcsFAXeEP+p/UtCuXWH7v1AgOIZd/hULKtt2xb3r7IVhpVm9eaRggVh3oPZNEceYCrI9mgrIYaLEYb5g47QWG+5SXOnqNp/jb0KqTsD3h+ZRu47QJAwa9cOtQD1E+gdkyihhI/PmoDljJcRCwa/YoSQoEb1O4QhDgXc4nEaflbyCgXc0agDj4yasABsXjyIczSClOhi734iX8qNM4P6TcdI16fCmVTFyw7EJTb9EN8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1gK5oPIwZRJnJdp4D/scfbfgF3FLbw7zD3sqOjpu2po=;
 b=bYf9PRT55SL0mRVnWgPSxXQxWo4a3bm4FmO7G5YngnhC+beRjKC8PnMXJCr/Q0GG2fbrXNCBO2Ud8K2P6otIIkvpILhh3P5Pz3B/Omw93HnA8LVZda0PtiTfUAcQQHe7v5E9ciBbC74qPWqdTs6n8Ru3aeWNsZl5zq8hMFf1Y0U=
Received: from DSSP220CA0013.NAMP220.PROD.OUTLOOK.COM (2603:10b6:8:3d3::8) by
 CO1PR10MB4786.namprd10.prod.outlook.com (2603:10b6:303:6d::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.28; Mon, 30 Mar 2026 09:45:13 +0000
Received: from DS1PEPF0001708E.namprd03.prod.outlook.com
 (2603:10b6:8:3d3:cafe::c5) by DSSP220CA0013.outlook.office365.com
 (2603:10b6:8:3d3::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.28 via Frontend Transport; Mon,
 30 Mar 2026 09:45:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 DS1PEPF0001708E.mail.protection.outlook.com (10.167.17.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Mon, 30 Mar 2026 09:45:13 +0000
Received: from DLEE208.ent.ti.com (157.170.170.97) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 30 Mar
 2026 04:45:12 -0500
Received: from DLEE209.ent.ti.com (157.170.170.98) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 30 Mar
 2026 04:45:12 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 30 Mar 2026 04:45:12 -0500
Received: from moteen-ubuntu-desk.dhcp.ti.com (moteen-ubuntu-desk.dhcp.ti.com [10.24.50.20])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62U9j0bi505460;
	Mon, 30 Mar 2026 04:45:09 -0500
From: Moteen Shah <m-shah@ti.com>
To: <krzk+dt@kernel.org>, <robh@kernel.org>, <conor+dt@kernel.org>,
	<nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <u-kumar1@ti.com>, <gehariprasath@ti.com>,
	<y-abhilashchandra@ti.com>, <m-shah@ti.com>
Subject: [PATCH v3 2/2] arm64: dts: ti: Add audio overlay for k3-j721s2-evm
Date: Mon, 30 Mar 2026 15:14:59 +0530
Message-ID: <20260330094459.128648-3-m-shah@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260330094459.128648-1-m-shah@ti.com>
References: <20260330094459.128648-1-m-shah@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0001708E:EE_|CO1PR10MB4786:EE_
X-MS-Office365-Filtering-Correlation-Id: 96fd152b-07dd-4f69-ae03-08de8e410a6d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700016|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: U3XpkgzZVnPR99EAn4uqcEMUUH3VgBK1a7kqgFAcYCuwZ9LrFc5NzZv8WIYVsTSc3wtEih8SaYjZspKkV0q0HCcMG43SX7YQ9m7iVKt9T/sB3Bw7QyuO4qfW3sn9s61nTLwW5gkHIWwnufQbkGS5EMeA9m+S2c8qFaqCnmTAl73q8UEmiPbDiHY9tDgqWZwmw8ExpzYmS2g78m9wUaCEbt2HBZBrZ1KOIRHvQasliMW70tZg+5kfLZEmpsIjXEXxAR9DvT69s9gPaSIg9omfFRO5O8VbPk199twWErb/suV8AV03DahdXzzKfztGkRRJ2Y1e7pEk3VFby5n8Z0E7J3l0djoxbQx4LHaKcPSSDR8SONOGyfKgY4gluxaLpJ+tUIFMgP7z6OqeenW32n8wz7RjhLdcm9m/WEMEeLIOv2U4rhAtcAY+f+e6jD2VxZ3L2VFjjpb3A6jh2VZAQ8SDVeVZX8G4GcjWATl4HM0BmP1hgcnLg6AXYV1CfST3Sy0h5kZ9wOjmx30VAv/0rHzT7F3nQhv035N8Mph0w28O3ApUXFAWlDKJ6cnFioZaW01JsQQbergDYzeBUDQHW1BRETXknS3T/Hm1op0sbq37cP5rpiJZfE05SCPzH1v4Wr3+69LOiCfNgaJEZ8bPUaf8xiR3pVAGBuNSNVZmQpC/s0d94GvwTjvWiRpPp7BWyIXfYnv4LEYCuL8pDBTCcjlK7A==
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700016)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: UqmOpw92NPAeYn8jEtud96mUdbRzI5tL77EDgYAyhsShgQT0wltIXno8nKtUXWTeLJv61KyDeesZappMogYMal2yPTIjqCYDJUVs9NleaRKvlsU4FKsiTHS6fmabsFUCfAElVxDNhk+MV+vE2c2Wr46cF+Ez3EB4TiTvWD8vydoDVe2758PQlh9cU0lysRYwDVS42mFMaeiUWwD8S+YGJAxnyvvPlOfT/zWIKQKVvpkHjX9teB91VoQh0da5ZDl5iEGRWOZ6BY2SOSY+RQbSCkp/j90U32CxnQZe1KY6w9iYvMXVibS2ps3f+K5O1NdsKMAj0uomjvdu2hz02PY2YkkX7qT30AWDBG+fO3ONfY7x0amzLurLaj5JcPOJaWuF+wQX1np5M1oCpg+IGDQZ8qDsaUYPL46G+SREGwdq1Ebks9VcY+G6gKj6UtSyWrQY
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2026 09:45:13.1109
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 96fd152b-07dd-4f69-ae03-08de8e410a6d
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0001708E.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4786
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_024518_618155_5AC18C1A 
X-CRM114-Status: GOOD (  15.96  )
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

From: Jayesh Choudhary <j-choudhary@ti.com>

Add device tree overlay to enable analog audio support on J721S2-EVM
using PCM3168A codec connected to McASP4 serializers.

- Add nodes for sound-card, audio codec, I2C3 and McASP4
- Add pinmux for I2C3, McASP4, AUDIO_EXT_REFCLK1 and WKUP_GPIO_0
- Add GPIO expander (TCA6408) for codec control
- Add GPIO hogs to route I2C3 lines and McASP serializers
- Set idle-state to 0 in mux0 and mux1 for McASP signal routing

Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
Co-developed-by: Moteen Shah <m-shah@ti.com>
Signed-off-by: Moteen Shah <m-shah@ti.com>
---
 arch/arm64/boot/dts/ti/Makefile               |   4 +
 .../boot/dts/ti/k3-j721s2-evm-audio.dtso      | 161 ++++++++++++++++++
 2 files changed, 165 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-j721s2-evm-audio.dtso

diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
index ba01a929e06f..17048f2f5043 100644
--- a/arch/arm64/boot/dts/ti/Makefile
+++ b/arch/arm64/boot/dts/ti/Makefile
@@ -138,6 +138,7 @@ dtb-$(CONFIG_ARCH_K3) += k3-j721s2-common-proc-board.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-j721s2-evm-gesi-exp-board.dtbo
 k3-j721s2-evm-dtbs := k3-j721s2-common-proc-board.dtb k3-j721s2-evm-gesi-exp-board.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-j721s2-evm.dtb
+dtb-$(CONFIG_ARCH_K3) += k3-j721s2-evm-audio.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-j721s2-evm-pcie1-ep.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-j721s2-evm-usb0-type-a.dtbo
 
@@ -264,6 +265,8 @@ k3-j721e-evm-pcie1-ep-dtbs := k3-j721e-common-proc-board.dtb \
 	k3-j721e-evm-pcie1-ep.dtbo
 k3-j721e-sk-csi2-dual-imx219-dtbs := k3-j721e-sk.dtb \
 	k3-j721e-sk-csi2-dual-imx219.dtbo
+k3-j721s2-evm-audio-dtbs := k3-j721s2-common-proc-board.dtb \
+	k3-j721s2-evm-audio.dtbo
 k3-j721s2-evm-pcie1-ep-dtbs := k3-j721s2-common-proc-board.dtb \
 	k3-j721s2-evm-pcie1-ep.dtbo
 k3-j721s2-evm-usb0-type-a-dtbs := k3-j721s2-common-proc-board.dtb \
@@ -328,6 +331,7 @@ dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
 	k3-j721e-evm-pcie0-ep.dtb \
 	k3-j721e-evm-pcie1-ep.dtb \
 	k3-j721e-sk-csi2-dual-imx219.dtb \
+	k3-j721s2-evm-audio.dtb \
 	k3-j721s2-evm-pcie1-ep.dtb \
 	k3-j721s2-evm-usb0-type-a.dtb \
 	k3-j722s-evm-csi2-quad-rpi-cam-imx219.dtb \
diff --git a/arch/arm64/boot/dts/ti/k3-j721s2-evm-audio.dtso b/arch/arm64/boot/dts/ti/k3-j721s2-evm-audio.dtso
new file mode 100644
index 000000000000..2a3ff1cfc650
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-j721s2-evm-audio.dtso
@@ -0,0 +1,161 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Device Tree Overlay for J721S2 Audio Support
+ *
+ * Copyright (C) 2026 Texas Instruments Incorporated - https://www.ti.com/
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+
+#include "k3-pinctrl.h"
+
+&{/} {
+	codec_audio: sound {
+		compatible = "ti,j7200-cpb-audio";
+		model = "j721s2-cpb";
+
+		ti,cpb-mcasp = <&mcasp4>;
+		ti,cpb-codec = <&pcm3168a_1>;
+
+		clocks = <&k3_clks 213 0>, <&k3_clks 213 1>,
+			 <&k3_clks 157 299>, <&k3_clks 157 328>;
+		clock-names = "cpb-mcasp-auxclk", "cpb-mcasp-auxclk-48000",
+			      "cpb-codec-scki", "cpb-codec-scki-48000";
+	};
+
+	i2c_mux: mux-controller-2 {
+		compatible = "gpio-mux";
+		#mux-state-cells = <1>;
+		mux-gpios = <&wkup_gpio0 54 GPIO_ACTIVE_HIGH>;
+		idle-state = <1>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&main_i2c3_mux_pins_default>;
+	};
+};
+
+&main_pmx0 {
+	mcasp4_pins_default: mcasp4-default-pins {
+		pinctrl-single,pins = <
+			J721S2_IOPAD(0x0c8, PIN_OUTPUT_PULLDOWN, 1) /* (AD28) MCASP4_ACLKX */
+			J721S2_IOPAD(0x06c, PIN_OUTPUT_PULLDOWN, 1) /* (V26) MCASP4_AFSX */
+			J721S2_IOPAD(0x068, PIN_INPUT_PULLDOWN, 1) /* (U28) MCASP4_AXR1 */
+			J721S2_IOPAD(0x0c4, PIN_OUTPUT_PULLDOWN, 1) /* (AB26) MCASP4_AXR2 */
+			J721S2_IOPAD(0x070, PIN_OUTPUT_PULLDOWN, 1) /* (R27) MCASP4_AXR3 */
+		>;
+	};
+
+	audio_ext_refclk1_pins_default: audio-ext-refclk1-default-pins {
+		pinctrl-single,pins = <
+			J721S2_IOPAD(0x078, PIN_OUTPUT, 1) /* (Y25) MCAN2_RX.AUDIO_EXT_REFCLK1 */
+		>;
+	};
+};
+
+&wkup_pmx2 {
+	main_i2c3_mux_pins_default: main-i2c3-mux-default-pins {
+		pinctrl-single,pins = <
+			J721S2_WKUP_IOPAD(0x038, PIN_OUTPUT, 7) /* (B27) WKUP_GPIO0_54 */
+		>;
+	};
+};
+
+&exp2 {
+	p09-hog {
+		/* P09 - MCASP/TRACE_MUX_S0 */
+		gpio-hog;
+		gpios = <9 GPIO_ACTIVE_HIGH>;
+		output-low;
+		line-name = "MCASP/TRACE_MUX_S0";
+	};
+
+	p10-hog {
+		/* P10 - MCASP/TRACE_MUX_S1 */
+		gpio-hog;
+		gpios = <10 GPIO_ACTIVE_HIGH>;
+		output-high;
+		line-name = "MCASP/TRACE_MUX_S1";
+	};
+};
+
+&mux0 {
+	idle-state = <0>;
+};
+
+&mux1 {
+	idle-state = <0>;
+};
+
+&scm_conf {
+	#address-cells = <1>;
+	#size-cells = <1>;
+
+	audio_refclk1: clock-controller@42e4 {
+		compatible = "ti,am62-audio-refclk";
+		reg = <0x42e4 0x4>;
+		clocks = <&k3_clks 157 299>;
+		assigned-clocks = <&k3_clks 157 299>;
+		assigned-clock-parents = <&k3_clks 157 328>;
+		#clock-cells = <0>;
+	};
+};
+
+&k3_clks {
+	/* Configure AUDIO_EXT_REFCLK1 pin as output */
+	pinctrl-names = "default";
+	pinctrl-0 = <&audio_ext_refclk1_pins_default>;
+};
+
+&main_i2c3 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&main_i2c3_pins_default>;
+	clock-frequency = <400000>;
+	mux-states = <&i2c_mux 1>;
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	exp3: gpio@20 {
+		compatible = "ti,tca6408";
+		reg = <0x20>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		gpio-line-names = "CODEC_RSTZ", "CODEC_SPARE1",
+				  "UB926_RESETN", "UB926_LOCK",
+				  "UB926_PWR_SW_CNTRL", "UB926_TUNER_RESET",
+				  "UB926_GPIO_SPARE";
+	};
+
+	pcm3168a_1: audio-codec@44 {
+		compatible = "ti,pcm3168a";
+		reg = <0x44>;
+		#sound-dai-cells = <1>;
+		reset-gpios = <&exp3 0 GPIO_ACTIVE_LOW>;
+		clocks = <&audio_refclk1>;
+		clock-names = "scki";
+		VDD1-supply = <&vsys_3v3>;
+		VDD2-supply = <&vsys_3v3>;
+		VCCAD1-supply = <&vsys_5v0>;
+		VCCAD2-supply = <&vsys_5v0>;
+		VCCDA1-supply = <&vsys_5v0>;
+		VCCDA2-supply = <&vsys_5v0>;
+	};
+};
+
+&mcasp4 {
+	status = "okay";
+	#sound-dai-cells = <0>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&mcasp4_pins_default>;
+	op-mode = <0>;          /* MCASP_IIS_MODE */
+	tdm-slots = <2>;
+	auxclk-fs-ratio = <256>;
+	serial-dir = <	/* 0: INACTIVE, 1: TX, 2: RX */
+		0 2 1 1
+		0 0 0 0
+		0 0 0 0
+		0 0 0 0
+	>;
+};
-- 
2.34.1


