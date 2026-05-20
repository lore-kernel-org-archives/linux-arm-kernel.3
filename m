Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF9E5CD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 11:56:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1rx+U7HTwgc/Ctz6IMKkUJEj0SXZArluPbozkv1Fb0A=; b=j74umRYOANzFLtN0GO/9JL1wPV
	J0ganG3oIhQ2SwGoP3o1TC0G8C/12+UZFh1kkjW46M2sEY1+jb0bdb54bR97B+T4zKEb8FDdxzoMR
	I99WpDkYS5lF9/IFBYX62jZrjpyp+59FuQ3lA1c5bw+HJlxrzDYH4gCTB+q40ci8eErWl8lWRu3mI
	XTE2SRB9nXZ64KH5TQt1DS7M+sFGV0whOOUF5IJpCdEEUk2pYjI4X5ybqOHZZvxZiYIHC05IY7zIV
	++ON9Ufes0F2KE2ejU94KRgLY9ny6+uXEnaAT/xTgU5Z9ss+S+P1cZk1fvnliMV78BArbbFvvLPrg
	riIUXVmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPfXJ-00000004Uya-3PjZ;
	Wed, 20 May 2026 11:56:29 +0000
Received: from mail-eastus2azlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c110::1] helo=BN1PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPfXE-00000004Uwc-1nDA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 11:56:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SyceAJcAf0X9VlFbNOUiPDuWtqCSO3K/OFAXTefH8AYRuVpXxG2Ih7gsROqGiKz/V4PdtFx2dL8o8Jk1OxdI5AxG236D75K2k6w/YlB7nhLExQ5pnFS6DS0b9KDB9tqkqUjIfJoJVoI2jgFgfrQ96VwNkCCQ+/C2aOvBqF72aVdYIg16Qz7Kx3JarsDz76wExDhD763gxUPGPZXZQb8Est2QSM4HSiLunchMKFnjFdflhmXcwNWXa0epFdBpkaK5mwsd824h4po6KlHUTmGSmJibL/6hGGVjKzXEYRPerLTG05v5dplVaD1sGcIJLYPP97rBpTeOunLHHd3IlCpPfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1rx+U7HTwgc/Ctz6IMKkUJEj0SXZArluPbozkv1Fb0A=;
 b=Isl/vVWx4WXFL7IWrxeW5cbfXQQIVP/7+95AsozYOWnvalS+YRFZ0CF/kqgA2cF4EKR3MWJ1x9q83siA26dWWVK5X6PPkuPf/ywuKchkg/OpYkyV8pEQuj5g+IeCgN9Asfh46IF3td+uyIsGJ8IR4LdO9zkYNnGJ7DLoL/hvnjcQ7fXJ/iab6V7NArqtT/zLzOKu6TGtJYkG0Fhilk3LEHjQPfBNmRjPP8CYtKn/mMMd51DSkidKoQJE/2ucUHW0amo1KylWDehkkzrlI3oW7uwv12Bhvnx5uvU8R1dN5+9/1DvtHIxtK8Sxq5NKH6hvzTZJyZbMuLz2dTBUrUfaqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1rx+U7HTwgc/Ctz6IMKkUJEj0SXZArluPbozkv1Fb0A=;
 b=ecCSho8xjqzgO9I2TQPqE1zzycGPqEMUkojUG3RL1Rgy90PqNjGbmybtugjBkBrf3KcoA9PGKalvVI/+9558w2SoZHiuPXshrEzdP7sIC3fomujT6/chnzMHoEULxoURQnnNkS0vmo7Q/G3b55GLpGqNSnl51F1kSLtMdr+LOBg=
Received: from BN0PR04CA0007.namprd04.prod.outlook.com (2603:10b6:408:ee::12)
 by EAYPR10MB997831.namprd10.prod.outlook.com (2603:10b6:303:2c0::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Wed, 20 May
 2026 11:56:18 +0000
Received: from BN2PEPF000055DC.namprd21.prod.outlook.com
 (2603:10b6:408:ee:cafe::43) by BN0PR04CA0007.outlook.office365.com
 (2603:10b6:408:ee::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.16 via Frontend Transport; Wed, 20
 May 2026 11:56:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BN2PEPF000055DC.mail.protection.outlook.com (10.167.245.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.0 via Frontend Transport; Wed, 20 May 2026 11:56:17 +0000
Received: from DLEE215.ent.ti.com (157.170.170.118) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 20 May
 2026 06:56:17 -0500
Received: from DLEE210.ent.ti.com (157.170.170.112) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 20 May
 2026 06:56:16 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 20 May 2026 06:56:16 -0500
Received: from moteen-ubuntu-desk.dhcp.ti.com (moteen-ubuntu-desk.dhcp.ti.com [10.24.50.20])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 64KBu3SX1386033;
	Wed, 20 May 2026 06:56:12 -0500
From: Moteen Shah <m-shah@ti.com>
To: <krzk+dt@kernel.org>, <robh@kernel.org>, <conor+dt@kernel.org>,
	<nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <u-kumar1@ti.com>, <gehariprasath@ti.com>,
	<y-abhilashchandra@ti.com>, <m-shah@ti.com>
Subject: [PATCH v5 2/2] arm64: dts: ti: Add audio overlay for k3-j721s2-evm
Date: Wed, 20 May 2026 17:26:03 +0530
Message-ID: <20260520115603.2662930-3-m-shah@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260520115603.2662930-1-m-shah@ti.com>
References: <20260520115603.2662930-1-m-shah@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DC:EE_|EAYPR10MB997831:EE_
X-MS-Office365-Filtering-Correlation-Id: 20336df9-2315-4edc-6863-08deb666cd14
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|36860700016|82310400026|1800799024|18002099003|56012099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info: sxhRfoIP4xJ58GuYqGRTsf+URudfk1mXMR3M+gv0qxvudHWWhW0vExP1fzu/mxMQfVkWNEFxlt/OAVcBTCta/jX/1gaPvYA0cYILwE2uo80fEFzRx+bDRllpRKeCbkDYKQvrX55kL8I828xPGMIgILFkkuA1j44uLNUToogWXuqXPVCr5kaRmiGtirQBQLnXRWOtfTcFouAKuICkcaUvfrjucbC3MnqpOy27OaasYhOzJETszICQ5i/aosDvUrPxUc/OFwaYKwpmaMgjSzcOh67KisN82mH9ohGoQQZ7EZyTS6LijEnccUfMv5RxwOn32f12sNtb409pFWSTczNNEAvpz8LQ82Np+g/6Kfxc7cdzjTL1ISRpu6hKgv4IrYlvFfO1IwxDu+CHm8T2ZCOj1eRsIQCHFkz3FGD3VSK3FlDw3QmaC/VcCwZKnNtCeRtTTvp09rtad/xs2ThSsCkhnAeeDIhRJ1rmZOkmorRtZV6IPhhg5uu3CjW/Ccisgvi7Ra3mXfvF8hfd+HhsSdqQmyvnQuzL8WfjYlJieut7V1vRv5ThVX00PKe5jnnalgUXj9s6Gpo1cP+NqPjBBm7o2ZSu3lGdPzqWYoIpK6TYTKs8hIh698rOPbPwZTzb362C/82FlV2k0e/wWvJGtE6X4QlIP2zTn/Ot4NRxIZD0EcE=
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(82310400026)(1800799024)(18002099003)(56012099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: m2pNpWGjqG4wZEvJnQ5uWwyp2h9/UPr0bViUF33A1HAewRIQqNT2N874EOTEAxcGDb5Z5js45cUo0kSe5ZvXor8eHP2yoc5RYGe7yJrCfv2Ivf+7KxixWY1A0ZOngsKcYhwwk6sO0Utx8kACowNc3G4WUN5xv4BmnsvhKQvjWSQTn60dtstkoe+DB9ny65tAfXEq04O3WNMMfJNFHwAPK51c9+iKFH1DqqGU4GEFtHw9x94Y9GmQf63SYdUp2Tw+NXyhdkYdEoaGqNFT1IrP11tH5pLr58sei4SFUBtCwXHOY0hfeLXjHFnR/Uj+928yHqw33lfq1c7dq6GzG2Ma0sxnHt6GaQ+CLK7jqXmI7q/B5YBCLvDJ2SBPMt7WpHKKxbrTo325E+NbmmAjaoRGNEV/kniyfkeRoktdBiajcitB7E+GtmW1Vy/v6O5FIeu3
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 11:56:17.5531
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 20336df9-2315-4edc-6863-08deb666cd14
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000055DC.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: EAYPR10MB997831
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_045624_474694_A0A7F7D1 
X-CRM114-Status: GOOD (  16.21  )
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
- Disable main_mcan3 and main_mcan5 as they conflict with McASP4 signal routing via mux0 and mux1

Reviewed-by: Hari Prasath Gujulan Elango <gehariprasath@ti.com>
Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
Co-developed-by: Moteen Shah <m-shah@ti.com>
Signed-off-by: Moteen Shah <m-shah@ti.com>
---
 arch/arm64/boot/dts/ti/Makefile               |   4 +
 .../boot/dts/ti/k3-j721s2-evm-audio.dtso      | 171 ++++++++++++++++++
 2 files changed, 175 insertions(+)
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
index 000000000000..c467aa9ce647
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-j721s2-evm-audio.dtso
@@ -0,0 +1,171 @@
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
+&main_mcan3 {
+	/* Conflicts with McASP4 signal routing via mux0 */
+	status = "disabled";
+};
+
+&main_mcan5 {
+	/* Conflicts with McASP4 signal routing via mux1 */
+	status = "disabled";
+};
+
+&scm_conf {
+	#address-cells = <1>;
+	#size-cells = <1>;
+
+	audio_refclk1: clock-controller@42e4 {
+		compatible = "ti,j721s2-audio-refclk", "ti,am62-audio-refclk";
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


