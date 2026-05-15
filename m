Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD098CD4F49
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 15:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qWNTubrUCH2QFJya8zkLMBZ5fthywjc8PwH28Wy3+ro=; b=QPATG+V9NwW4nJh3zuBtkg0Rvt
	SwqtpUz2931Ka0hNqm5Jk8QLfaXBezhsBk0gBIdODsvBwLryEgHso1fPgTe+GzDxurmNXeqtEViwK
	8B7Ep3Rx/JURep3kbbQ8C0PPfA/9zTgSAPJaoMZrXHN5cm0f+CVpxiOr9W+lGbgHrBHgDjErImW8k
	rsjbn3ur2c7LEyNXoK8Eo/dkn9To2rFcB9avtLULvJaV3q0Ji9ntFmlye3uD9nJlYpR8hjhSlQ6Pc
	HKKENYcLR6ghRwqqKbsXjoDuGvFbjZT41td/kDxvgrzI7vocZ2Sz79epF5BQt0LSeXp2XwnpdQ3j6
	KdyKjIbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNua6-00000008lNe-2z6a;
	Fri, 15 May 2026 15:36:06 +0000
Received: from mail-northcentralusazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c105::7] helo=CH4PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNua1-00000008lKN-3As6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 15:36:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XfQzw11b2T/tyjiNQzMfOc7JkSNmPkgBypEUcc+179bu/xQKkeoTRT9Ll4p/5zii4mgXe8fvDFbUWFcoZYl9nCWIr+Y4s14j0KuDZxOQxv+GNznZjyYOsE6pRGWTvCCIdtJY/efCmCnjvmG3lBeBVmLoXSxNLtYHCgtZ8lzoJem1EDDC6TG0a8a4mYFjMLp1RmL32H3pa39+kOmnxG+/vT8RZziCOsDheL0l4dvsko12CT+4bBAPNjYkovB6blCGWaKvKvczl/KcA0EF5cYwuftVAlJSnQot9rMnOKDDAZNnCQL+Og4LYgkQsHLDsvazePY4yg9ppiFddNC4no+ShA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qWNTubrUCH2QFJya8zkLMBZ5fthywjc8PwH28Wy3+ro=;
 b=PkPhaedkfTBl9udU3ogqhst8ID17f6pj+v2N370vxWKD3SeTJ9//7SN9D+vZ9eGBGwqCy00N9FCAMGiJTcJ+/oKgdO9XNXloJtqMt3SwlYI098oPkkwoSiyVtrRptcxd/T2QZCjg/YAF638uGpZE3jXBBk/21JCk52+7qTxbMKysmZwjtcyUTKzcXFofzNc40oiYjL1rUALYiL7iIzyhwVeifn44oMvM1Q6vdGAVwjBHmN28tk+00PEzYb/Ydic9ubnSHAD8BgYd/WV8Gd9gS4zAhA4/WwBQAbHLVRptAFSvlhtHDRRsk+SoXLDdHdzz5lbCW4OSNZY39Dhea/VkAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=gmail.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qWNTubrUCH2QFJya8zkLMBZ5fthywjc8PwH28Wy3+ro=;
 b=AuQrFSd7uldGaIfahnDFDH4eJ9wzBfaNWDPs8/FsY75MWVO2d++KlGaZR+b4LtluM/kPbnn4RQY7MNRsYPYXyUZsey+0wxhKOyyaBggW5jv3QTZlj/BfzDlGTcHdUkAPtcoBnY/qgnC+Us/cN33h94gTKVXUgjYzgPSGlMXPmU8=
Received: from BN9PR03CA0341.namprd03.prod.outlook.com (2603:10b6:408:f6::16)
 by DS7PR10MB5901.namprd10.prod.outlook.com (2603:10b6:8:87::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9913.11; Fri, 15 May 2026 15:35:54 +0000
Received: from BN2PEPF000055DC.namprd21.prod.outlook.com
 (2603:10b6:408:f6:cafe::2e) by BN9PR03CA0341.outlook.office365.com
 (2603:10b6:408:f6::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9913.14 via Frontend Transport; Fri,
 15 May 2026 15:35:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN2PEPF000055DC.mail.protection.outlook.com (10.167.245.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.0 via Frontend Transport; Fri, 15 May 2026 15:35:53 +0000
Received: from DFLE211.ent.ti.com (10.64.6.69) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 15 May
 2026 10:35:41 -0500
Received: from DFLE209.ent.ti.com (10.64.6.67) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 15 May
 2026 10:35:41 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Fri, 15 May 2026 10:35:41 -0500
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 64FFZfoo4155355;
	Fri, 15 May 2026 10:35:41 -0500
From: Judith Mendez <jm@ti.com>
To: Judith Mendez <jm@ti.com>, Nishanth Menon <nm@ti.com>, Vignesh Raghavendra
	<vigneshr@ti.com>
CC: Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Andrew Davis <afd@ti.com>, Bryan Brattlof
	<bb@ti.com>, Jason Kridner <jkridner@gmail.com>, Robert Nelson
	<robertcnelson@gmail.com>
Subject: [PATCH v4 2/3] arm64: dts: ti: Add k3-am62l3-beaglebadge
Date: Fri, 15 May 2026 10:35:40 -0500
Message-ID: <20260515153541.294698-3-jm@ti.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260515153541.294698-1-jm@ti.com>
References: <20260515153541.294698-1-jm@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DC:EE_|DS7PR10MB5901:EE_
X-MS-Office365-Filtering-Correlation-Id: c5165047-ccb8-4b64-a8e3-08deb297a682
X-LD-Processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700016|376014|1800799024|3023799003|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: rvTDA0xytVn7mfHHPBEVdEtI2rXy3EwrEy50DE7ViCMpiKFeH1F8H5Dii6O99IHNbUkhRczEldZdNEHq581fCQhsIpXiiBj51tkiSXgqtwxpP+JZwGwrUOvefkWZ33dJx1E+1VVG+eYITKWUZJFAnbGEYYhc1QRCuwOCAS5GQjSxi1uYhErYDd/7HipasCLohGKpE99czvAzL4sUwmQU6uAUB9FFMgnEJ9kqVPPXNZjw49GVXuPZM/tFN4+RwFPb4EZOIHzH4d4vslB/PYTdrS5Wi05WYftI+57q3Ug0ubRWXYNE6zbd4leVLrUR/KVJjW0oH+ftknSFPZ1v/X8wLyYEDiAgb34YTb7wvJS4/6VwglmijBdfsKd6NzWj6M/vuPSTaIpWC/o7ucP3aWvkDPViYrjypKa4cBv7I2er461cz94XVNjz9uVux8wxvVn1FS/t1vJ2/B8MPCCAxQK0UwgfLjeIpCjUnwpKDiDSP0cZYNGoUO6QdI4j3hcaxxyUWnQXxPKtv98cOajgk8CVPClS+qgVss7HWxUYZxmH/l5KLnvpi2dEHQmj7P13kmBS+SRzyhI/vgAdzUUZ8vm41zTjCeNCiVkPzITuJC8XDdqNJvE2SUub1VbtNxyT07xjO95JpOf3OAXigKe0hM0RSg==
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(1800799024)(3023799003)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: dnCX3bsIsnHigSPpAkkurWpz/0gX8SEAvvPK4qxNhmWRvGk3dKin8uzlFnHTmhn3pe8kTuHu3jsglGflaCZa10ztU7wbL7xz1k/A8UdYdkNevqVBTrWxs+xhG7eyZU4ZPeG0FlXgpkSTUBS5696QBdDnc+IFzd886V3cOE7OoHv/5kq9AgLo/tqJwH3lLkXtGMbc5TIrMjzIWrdA90wdmXKkAUoH3AKDJNI4Jy+TH8DNfqEo53CKMLwhnkZwLUeFGH48OmETjWgnoQHTU98OSmHQp9oZrGGOKH0Fp+fHvnEHAgq8q948n13KuxmuQzBqQwenIM7J1pa+himAVlu0YojyJKWT9LugBzPCymKOxX2Pw1P6uZtNVQDMSietRQEyTMNnN5XIQYQDyWGuhys5rDUAG7HCzO0+/7wgB9v9dacPNtAnxKVDevIrMxKdU830
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2026 15:35:53.5404
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c5165047-ccb8-4b64-a8e3-08deb297a682
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000055DC.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5901
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_083601_875354_4E805C6F 
X-CRM114-Status: GOOD (  15.29  )
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

BeagleBoard.org BeagleBadge is a compact, affordable open source
hardware single board computer based on the Texas Instruments AM62L3
SoC designed for IoT and embedded applications with low power
consumption. Expansion is provided over open standards based headers
including QWIIC and GPIO interfaces.

https://github.com/beagleboard/BeagleBadge

Co-developed-by: Andrew Davis <afd@ti.com>
Signed-off-by: Andrew Davis <afd@ti.com>
Signed-off-by: Judith Mendez <jm@ti.com>
---
Changelog since v3:
- Add missing newline in commit message
- Drop beagleboard URL
- Drop uneeded header files
- Add boothph flags in wkup_i2c0 & PMC nodes
---
 arch/arm64/boot/dts/ti/Makefile               |   1 +
 .../boot/dts/ti/k3-am62l3-beaglebadge.dts     | 700 ++++++++++++++++++
 2 files changed, 701 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62l3-beaglebadge.dts

diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
index 5269c9619b65c..4e377ca011cd8 100644
--- a/arch/arm64/boot/dts/ti/Makefile
+++ b/arch/arm64/boot/dts/ti/Makefile
@@ -41,6 +41,7 @@ dtb-$(CONFIG_ARCH_K3) += k3-am62d2-evm.dtb
 
 # Boards with AM62Lx SoCs
 dtb-$(CONFIG_ARCH_K3) += k3-am62l3-evm.dtb
+dtb-$(CONFIG_ARCH_K3) += k3-am62l3-beaglebadge.dtb
 
 # Boards with AM62Px SoC
 dtb-$(CONFIG_ARCH_K3) += k3-am62p5-sk.dtb
diff --git a/arch/arm64/boot/dts/ti/k3-am62l3-beaglebadge.dts b/arch/arm64/boot/dts/ti/k3-am62l3-beaglebadge.dts
new file mode 100644
index 0000000000000..30fc9c83b1f44
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am62l3-beaglebadge.dts
@@ -0,0 +1,700 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * https://www.beagleboard.org/boards/beaglebadge
+ *
+ * Copyright (C) 2026 Texas Instruments Incorporated - https://www.ti.com/
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/leds/common.h>
+#include "k3-am62l3.dtsi"
+#include "k3-pinctrl.h"
+
+/ {
+	compatible = "beagle,am62l3-beaglebadge", "ti,am62l3";
+	model = "BeagleBoard.org BeagleBadge";
+
+	chosen {
+		stdout-path = &uart0;
+	};
+
+	aliases {
+		gpio0 = &gpio0;
+		gpio2 = &wkup_gpio0;
+		i2c0 = &i2c0;
+		i2c1 = &i2c1;
+		i2c2 = &i2c2;
+		i2c4 = &wkup_i2c0;
+		mmc1 = &sdhci1;
+		mmc2 = &sdhci2;
+		serial3 = &uart1;
+		usb0 = &usb0;
+		usb1 = &usb1;
+	};
+
+	memory@80000000 {
+		/* 256MB */
+		reg = <0x00000000 0x80000000 0x00000000 0x10000000>;
+		device_type = "memory";
+		bootph-all;
+	};
+
+	thermal-zones {
+		wkup0-thermal {
+			polling-delay-passive = <250>;	/* milliSeconds */
+			polling-delay = <500>;		/* milliSeconds */
+			thermal-sensors = <&vtm0 0>;
+
+			trips {
+				crit0 {
+					temperature = <125000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+		};
+	};
+
+	gpio_keys: gpio-keys {
+		compatible = "gpio-keys";
+		autorepeat;
+
+		button-select {
+			label = "SELECT";
+			linux,code = <KEY_SELECT>;
+			gpios = <&gpio0 26 GPIO_ACTIVE_LOW>;
+		};
+
+		button-back {
+			label = "BACK";
+			linux,code = <KEY_BACK>;
+			gpios = <&gpio0 104 GPIO_ACTIVE_LOW>;
+		};
+
+		button-up {
+			label = "UP";
+			linux,code = <KEY_UP>;
+			gpios = <&gpio0 32 GPIO_ACTIVE_LOW>;
+		};
+
+		button-down {
+			label = "DOWN";
+			linux,code = <KEY_DOWN>;
+			gpios = <&gpio0 42 GPIO_ACTIVE_LOW>;
+		};
+
+		button-left {
+			label = "LEFT";
+			linux,code = <KEY_LEFT>;
+			gpios = <&gpio0 31 GPIO_ACTIVE_LOW>;
+		};
+
+		button-right {
+			label = "RIGHT";
+			linux,code = <KEY_RIGHT>;
+			gpios = <&gpio0 95 GPIO_ACTIVE_LOW>;
+		};
+	};
+
+	multicolor-led {
+		compatible = "pwm-leds-multicolor";
+
+		multi-led {
+			color = <LED_COLOR_ID_RGB>;
+			max-brightness = <255>;
+
+			led-red {
+				pwms = <&ecap2 0 10000000 0>;
+				color = <LED_COLOR_ID_RED>;
+			};
+
+			led-green {
+				pwms = <&ecap1 0 10000000 0>;
+				color = <LED_COLOR_ID_GREEN>;
+			};
+
+			led-blue {
+				pwms = <&epwm1 1 10000000 0>;
+				color = <LED_COLOR_ID_BLUE>;
+			};
+		};
+	};
+
+	seven-segment-left {
+		compatible = "gpio-7-segment";
+		segment-gpios = <&mcp23s18 0 GPIO_ACTIVE_LOW>,
+				<&mcp23s18 1 GPIO_ACTIVE_LOW>,
+				<&mcp23s18 2 GPIO_ACTIVE_LOW>,
+				<&mcp23s18 3 GPIO_ACTIVE_LOW>,
+				<&mcp23s18 4 GPIO_ACTIVE_LOW>,
+				<&mcp23s18 5 GPIO_ACTIVE_LOW>,
+				<&mcp23s18 6 GPIO_ACTIVE_LOW>,
+				<&mcp23s18 7 GPIO_ACTIVE_LOW>;
+	};
+
+	seven-segment-right {
+		compatible = "gpio-7-segment";
+		segment-gpios = <&mcp23s18 8 GPIO_ACTIVE_LOW>,
+				<&mcp23s18 9 GPIO_ACTIVE_LOW>,
+				<&mcp23s18 10 GPIO_ACTIVE_LOW>,
+				<&mcp23s18 11 GPIO_ACTIVE_LOW>,
+				<&mcp23s18 12 GPIO_ACTIVE_LOW>,
+				<&mcp23s18 13 GPIO_ACTIVE_LOW>,
+				<&mcp23s18 14 GPIO_ACTIVE_LOW>,
+				<&mcp23s18 15 GPIO_ACTIVE_LOW>;
+	};
+
+	pwm-beeper {
+		compatible = "pwm-beeper";
+		pwms = <&epwm0 1 1000000 0>;
+		amp-supply = <&sensor_3v3>;
+	};
+
+	vsys_out: regulator-0 {
+		/* output of BQ24070 */
+		compatible = "regulator-fixed";
+		regulator-name = "VSYS_OUT";
+		regulator-min-microvolt = <4400000>;
+		regulator-max-microvolt = <4400000>;
+		regulator-always-on;
+		regulator-boot-on;
+		bootph-all;
+	};
+
+	vcc_3v3_main: regulator-1 {
+		/* output of TPS62A06 */
+		compatible = "regulator-fixed";
+		regulator-name = "VCC_3V3_MAIN";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		vin-supply = <&vsys_out>;
+		regulator-always-on;
+		regulator-boot-on;
+		bootph-all;
+	};
+
+	vdd_3v3: regulator-2 {
+		/* output of TPS22965 */
+		compatible = "regulator-fixed";
+		regulator-name = "VDD_3V3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		vin-supply = <&vcc_3v3_main>;
+		regulator-always-on;
+		regulator-boot-on;
+		bootph-all;
+	};
+
+	vdd_3v3_sd: regulator-3 {
+		/* TPS22918DBVR */
+		compatible = "regulator-fixed";
+		regulator-name = "VDD_3V3_SD";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		vin-supply = <&vdd_3v3>;
+		regulator-boot-on;
+		enable-active-high;
+		gpio = <&gpio0 16 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&vdd_3v3_sd_ena_pins_default>;
+		bootph-all;
+	};
+
+	sensor_3v3: regulator-4 {
+		/* TPS22918DBVR */
+		compatible = "regulator-fixed";
+		regulator-name = "Sensor_3V3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		vin-supply = <&vdd_3v3>;
+		regulator-boot-on;
+		regulator-always-on;
+		enable-active-high;
+		gpio = <&wkup_gpio0 1 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&sensor_3v3_ena_pins_default>;
+		bootph-all;
+	};
+
+	wlan_en: regulator-5 {
+		compatible = "regulator-fixed";
+		regulator-name = "wlan_en";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		enable-active-high;
+		gpios = <&gpio0 51 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&wlan_en_pins_default>;
+	};
+};
+
+&pmx0 {
+	uart0_pins_default: uart0-default-pins {
+		pinctrl-single,pins = <
+			AM62LX_IOPAD(0x01b8, PIN_OUTPUT, 0) /* (C13) UART0_TXD */
+			AM62LX_IOPAD(0x01b4, PIN_INPUT, 0) /* (D13) UART0_RXD */
+		>;
+		bootph-all;
+	};
+
+	uart0_pins_wakeup: uart0-wakeup-pins {
+		pinctrl-single,pins = <
+			AM62LX_IOPAD(0x01b8, PIN_OUTPUT, 0) /* (C13) UART0_TXD */
+			AM62LX_IOPAD(0x01b4, PIN_INPUT | PIN_WKUP_EN, 0) /* (D13) UART0_RXD */
+		>;
+		bootph-all;
+	};
+
+	uart1_pins_default: uart1-default-pins {
+		pinctrl-single,pins = <
+			AM62LX_IOPAD(0x019c, PIN_OUTPUT, 2) /* (A12) MCASP0_ACLKR.UART1_TXD */
+			AM62LX_IOPAD(0x0198, PIN_INPUT, 2) /* (C11) MCASP0_AFSR.UART1_RXD */
+			AM62LX_IOPAD(0x0180, PIN_INPUT, 2) /* (A8) MCASP0_AXR3.UART1_CTSn */
+			AM62LX_IOPAD(0x0184, PIN_OUTPUT, 2) /* (B10) MCASP0_AXR2.UART1_RTSn */
+		>;
+		bootph-all;
+	};
+
+	usr_button_pins_default: usr-button-default-pins {
+		pinctrl-single,pins = <
+			AM62LX_IOPAD(0x00a4, PIN_INPUT, 7) /* (H18) GPMC0_AD11.GPIO0_26 */
+			AM62LX_IOPAD(0x01e4, PIN_INPUT, 7) /* (D16) EXT_REFCLK1.GPIO0_104 */
+			AM62LX_IOPAD(0x00c0, PIN_INPUT, 7) /* (N19) GPMC0_ADVn_ALE.GPIO0_32 */
+			AM62LX_IOPAD(0x00e8, PIN_INPUT, 7) /* (L19) GPMC0_CSn1.GPIO0_42 */
+			AM62LX_IOPAD(0x00b8, PIN_INPUT, 7) /* (L21) GPMC0_CLK.GPIO0_31 */
+			AM62LX_IOPAD(0x01c0, PIN_INPUT, 7) /* (B13) UART0_RTSn.GPIO0_95 */
+		>;
+	};
+
+	i2c0_pins_default: i2c0-default-pins {
+		pinctrl-single,pins = <
+			AM62LX_IOPAD(0x01cc, PIN_INPUT_PULLUP, 0) /* (B7) I2C0_SCL */
+			AM62LX_IOPAD(0x01d0, PIN_INPUT_PULLUP, 0) /* (A7) I2C0_SDA */
+		>;
+		bootph-all;
+	};
+
+	i2c1_pins_default: i2c1-default-pins {
+		pinctrl-single,pins = <
+			AM62LX_IOPAD(0x01d4, PIN_INPUT_PULLUP, 0) /* (D7) I2C1_SCL */
+			AM62LX_IOPAD(0x01d8, PIN_INPUT_PULLUP, 0) /* (A6) I2C1_SDA */
+		>;
+		bootph-all;
+	};
+
+	i2c2_qwiic_pins_default: i2c2-qwiic-default-pins {
+		pinctrl-single,pins = <
+			AM62LX_IOPAD(0x01dc, PIN_INPUT_PULLUP, 0) /* (B8) I2C2_SCL */
+			AM62LX_IOPAD(0x01e0, PIN_INPUT_PULLUP, 0) /* (D8) I2C2_SDA */
+		>;
+		bootph-all;
+	};
+
+	vdd_3v3_sd_ena_pins_default: vdd-3v3-sd-ena-default-pins {
+		pinctrl-single,pins = <
+			AM62LX_IOPAD(0x07c, PIN_OUTPUT, 7) /* (L23) GPMC0_AD1.GPIO0_16 */
+		>;
+		bootph-all;
+	};
+
+	sensor_3v3_ena_pins_default: sensor-3v3-ena-default-pins {
+		pinctrl-single,pins = <
+			AM62LX_IOPAD(0x004, PIN_OUTPUT, 7) /* (AA23) WKUP_UART0_TXD.WKUP_GPIO0_1 */
+		>;
+	};
+
+	mmc1_pins_default: mmc1-default-pins {
+		pinctrl-single,pins = <
+			AM62LX_IOPAD(0x0230, PIN_INPUT, 0) /* (Y3) MMC1_CMD */
+			AM62LX_IOPAD(0x0228, PIN_OUTPUT, 0) /* (Y2) MMC1_CLK */
+			AM62LX_IOPAD(0x0224, PIN_INPUT, 0) /* (AA1) MMC1_DAT0 */
+			AM62LX_IOPAD(0x0220, PIN_INPUT, 0) /* (Y4) MMC1_DAT1 */
+			AM62LX_IOPAD(0x021c, PIN_INPUT, 0) /* (AA2) MMC1_DAT2 */
+			AM62LX_IOPAD(0x0218, PIN_INPUT, 0) /* (AB2) MMC1_DAT3 */
+			AM62LX_IOPAD(0x0234, PIN_INPUT, 7) /* (B6) MMC1_SDCD.GPIO0_122 */
+		>;
+		bootph-all;
+	};
+
+	mmc2_pins_default: mmc2-default-pins {
+		pinctrl-single,pins = <
+			AM62LX_IOPAD(0x010c, PIN_INPUT, 0) /* (U23) MMC2_CMD */
+			AM62LX_IOPAD(0x0104, PIN_OUTPUT, 0) /* (R23) MMC2_CLK */
+			AM62LX_IOPAD(0x0108, PIN_INPUT, 0) /* () MMC2_CLKLB */
+			AM62LX_IOPAD(0x0100, PIN_INPUT, 0) /* (U22) MMC2_DAT0 */
+			AM62LX_IOPAD(0x00fc, PIN_INPUT, 0) /* (T22) MMC2_DAT1 */
+			AM62LX_IOPAD(0x00f8, PIN_INPUT, 0) /* (T23) MMC2_DAT2 */
+			AM62LX_IOPAD(0x00f4, PIN_INPUT, 0) /* (R22) MMC2_DAT3 */
+		>;
+	};
+
+	wlan_en_pins_default: wlan-en-default-pins {
+		pinctrl-single,pins = <
+			AM62LX_IOPAD(0x0110, PIN_OUTPUT, 7) /* (T20) MMC2_SDCD.GPIO0_51 */
+		>;
+	};
+
+	usb1_pins_default: usb1-default-pins {
+		pinctrl-single,pins = <
+			AM62LX_IOPAD(0x0248, PIN_INPUT | PIN_DS_PULLUD_ENABLE |
+				PIN_DS_PULL_UP, 0) /* (A5) USB1_DRVVBUS */
+		>;
+		bootph-all;
+	};
+
+	pwm_beeper_pins_default: pwm-beeper-default-pins {
+		pinctrl-single,pins = <
+			AM62LX_IOPAD(0x00b0, PIN_OUTPUT, 4) /* (F22) GPMC0_AD14.EHRPWM0_B */
+		>;
+	};
+
+	pmic_irq_pins_default: pmic-irq-default-pins {
+		pinctrl-single,pins = <
+			AM62LX_IOPAD(0x01e8, PIN_INPUT, 0) /* (C8) EXTINTn */
+		>;
+		bootph-all;
+	};
+
+	wkup_i2c0_pins_default: wkup-i2c0-default-pins {
+		pinctrl-single,pins = <
+			AM62LX_IOPAD(0x0010, PIN_INPUT_PULLUP, 0) /* (AB22) WKUP_I2C0_SCL */
+			AM62LX_IOPAD(0x0014, PIN_INPUT_PULLUP, 0) /* (AA22) WKUP_I2C0_SDA */
+		>;
+		bootph-all;
+	};
+
+	rgb_led_ecap2_pins_default: rgb-led-ecap2-default-pins {
+		pinctrl-single,pins = <
+			AM62LX_IOPAD(0x0190, PIN_OUTPUT, 2) /* (A11) MCASP0_ACLKX.ECAP2_IN_APWM_OUT */
+		>;
+	};
+
+	rgb_led_ecap1_pins_default: rgb-led-ecap1-default-pins {
+		pinctrl-single,pins = <
+			AM62LX_IOPAD(0x0188, PIN_OUTPUT, 2) /* (A9) MCASP0_AXR1.ECAP1_IN_APWM_OUT */
+		>;
+	};
+
+	rgb_led_epwm1_pins_default: rgb-led-epwm1-default-pins {
+		pinctrl-single,pins = <
+			AM62LX_IOPAD(0x018c, PIN_OUTPUT, 5) /* (B9) MCASP0_AXR0.EHRPWM1_B */
+		>;
+	};
+
+	spi1_pins_default: spi1-default-pins {
+		pinctrl-single,pins = <
+			AM62LX_IOPAD(0x008c, PIN_OUTPUT, 4) /* (H22) GPMC0_AD5.SPI1_CLK */
+			AM62LX_IOPAD(0x0088, PIN_OUTPUT, 4) /* (K23) GPMC0_AD4.SPI1_CS0 */
+			AM62LX_IOPAD(0x0080, PIN_INPUT, 4) /* (K22) GPMC0_AD2.SPI1_D0 */
+			AM62LX_IOPAD(0x0084, PIN_OUTPUT, 4) /* (J23) GPMC0_AD3.SPI1_D1 */
+		>;
+		bootph-all;
+	};
+
+	spi3_pins_default: spi3-default-pins {
+		pinctrl-single,pins = <
+			AM62LX_IOPAD(0x00d0, PIN_OUTPUT, 5) /* (P22) GPMC0_BE1n.SPI3_CLK */
+			AM62LX_IOPAD(0x00cc, PIN_OUTPUT, 5) /* (P23) GPMC0_BE0n_CLE.SPI3_CS0 */
+			AM62LX_IOPAD(0x00d4, PIN_INPUT, 5) /* (N23) GPMC0_WAIT0.SPI3_D0 */
+			AM62LX_IOPAD(0x00d8, PIN_OUTPUT, 5) /* (N22) GPMC0_WAIT1.SPI3_D1 */
+		>;
+	};
+
+	mcp23s18_reset_pins_default: mcp23s18-reset-default-pins {
+		pinctrl-single,pins = <
+			AM62LX_IOPAD(0x00a0, PIN_OUTPUT, 7) /* (H21) GPMC0_AD10.GPIO0_25 */
+		>;
+	};
+
+	epwm2_pins_default: epwm2-default-pins {
+		pinctrl-single,pins = <
+			AM62LX_IOPAD(0x00c4, PIN_OUTPUT, 4) /* (N20) GPMC0_OEn_REn.EHRPWM2_A */
+		>;
+	};
+
+	lora_control_pins_default: lora-control-default-pins {
+		pinctrl-single,pins = <
+			AM62LX_IOPAD(0x00c8, PIN_OUTPUT, 7) /* (M19) GPMC0_WEn.GPIO0_34 */
+			AM62LX_IOPAD(0x00e4, PIN_OUTPUT, 7) /* (L20) GPMC0_CSn0.GPIO0_41 */
+			AM62LX_IOPAD(0x01a4, PIN_INPUT, 7) /* (D11) SPI0_CS1.GPIO0_88 */
+			AM62LX_IOPAD(0x01bc, PIN_INPUT, 7) /* (B14) UART0_CTSn.GPIO0_94 */
+		>;
+	};
+
+	gpio0_pins_default: gpio0-default-pins {
+		pinctrl-single,pins = <
+			AM62LX_IOPAD(0x0078, PIN_OUTPUT, 7) /* (L22) GPMC0_AD0.GPIO0_15 */
+			AM62LX_IOPAD(0x00e0, PIN_INPUT, 7) /* (M21) GPMC0_DIR.GPIO0_40 */
+			AM62LX_IOPAD(0x00ec, PIN_OUTPUT, 7) /* (M23) GPMC0_CSn2.GPIO0_43 */
+			AM62LX_IOPAD(0x00f0, PIN_INPUT, 7) /* (M22) GPMC0_CSn3.GPIO0_44 */
+			AM62LX_IOPAD(0x0194, PIN_OUTPUT, 7) /* (B11) MCASP0_AFSX.GPIO0_84 */
+		>;
+	};
+};
+
+&uart0 {
+	wakeup-source;
+	pinctrl-0 = <&uart0_pins_default>;
+	pinctrl-1 = <&uart0_pins_wakeup>;
+	pinctrl-names = "default", "wakeup";
+	bootph-all;
+	status = "okay";
+};
+
+&uart1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart1_pins_default>;
+	bootph-all;
+	status = "okay";
+};
+
+&i2c0 {
+	clock-frequency = <400000>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c0_pins_default>;
+	bootph-all;
+	status = "okay";
+
+	/* T&H Sensor */
+	th-sensor@44 {
+		compatible = "sensirion,sht4x";
+		reg = <0x44>;
+	};
+
+	/* EEPROM */
+	eeprom@50 {
+		/* FT24C32A-ELRT */
+		compatible = "atmel,24c32";
+		reg = <0x50>;
+	};
+
+	/* Fuel Gauge */
+	fuel-gauge@55 {
+		compatible = "ti,bq27541";
+		reg = <0x55>;
+	};
+
+	/* IMU Sensor */
+	accelerometer@6a {
+		compatible = "st,lsm6ds3tr-c";
+		reg = <0x6a>;
+		vdd-supply = <&vcc_3v3_main>;
+		vddio-supply = <&vcc_3v3_main>;
+	};
+};
+
+&i2c1 {
+	clock-frequency = <400000>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c1_pins_default>;
+	bootph-all;
+	status = "okay";
+};
+
+&i2c2 {
+	clock-frequency = <400000>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c2_qwiic_pins_default>;
+	bootph-all;
+	status = "okay";
+};
+
+&wkup_i2c0 {
+	clock-frequency = <400000>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&wkup_i2c0_pins_default>;
+	bootph-all;
+	status = "okay";
+
+	tps65214: pmic@30 {
+		compatible = "ti,tps65214";
+		reg = <0x30>;
+		interrupt-parent = <&gic500>;
+		interrupts = <GIC_SPI 224 IRQ_TYPE_LEVEL_HIGH>;
+		buck1-supply = <&vcc_3v3_main>;
+		buck2-supply = <&vcc_3v3_main>;
+		buck3-supply = <&vcc_3v3_main>;
+		ldo1-supply = <&vcc_3v3_main>;
+		ldo2-supply = <&vcc_3v3_main>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pmic_irq_pins_default>;
+		ti,power-button;
+		bootph-all;
+
+		regulators {
+			buck1_reg: buck1 {
+				regulator-name = "VDD_CORE";
+				regulator-min-microvolt = <750000>;
+				regulator-max-microvolt = <750000>;
+				regulator-always-on;
+				regulator-boot-on;
+			};
+
+			buck2_reg: buck2 {
+				regulator-name = "VDD_1V8";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-always-on;
+				regulator-boot-on;
+			};
+
+			buck3_reg: buck3 {
+				regulator-name = "VDD_LPDDR4";
+				regulator-min-microvolt = <1100000>;
+				regulator-max-microvolt = <1100000>;
+				regulator-always-on;
+				regulator-boot-on;
+			};
+
+			ldo1_reg: ldo1 {
+				regulator-name = "VDDA_1V8";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-always-on;
+				regulator-boot-on;
+			};
+
+			ldo2_reg: ldo2 {
+				regulator-name = "PMIC_VDD_RTC";
+				regulator-min-microvolt = <750000>;
+				regulator-max-microvolt = <750000>;
+				regulator-always-on;
+				regulator-boot-on;
+			};
+		};
+	};
+};
+
+&gpio0 {
+	gpio-line-names ="","","","","","","","","","",									/* 0-9 */
+			 "","","","","","BOOST_5V_ENA","VDD_3V3_SD_ENA","","","",					/* 10-19 */
+			 "","","","","","MCP23S18_RESET","BTN_SELECT","","","",						/* 20-29 */
+			 "","BTN_LEFT","BTN_UP","","LORA_RESET","","","","","",						/* 30-39 */
+			 "FUEL_GAUGE_BATLOW","LORA_RFSW","BTN_DOWN","USB_HUB_RST","MIKROBUS_INT","","","","","",	/* 40-49 */
+			 "","WLAN_EN","","","","","","","","",								/* 50-59 */
+			 "","","","","","","","","","",									/* 60-69 */
+			 "","","","","","","","","","",									/* 70-79 */
+			 "","","","","MIKROBUS_RST","","","","LORA_BUSY","",						/* 80-89 */
+			 "","","","","LORA_DIO","BTN_RIGHT","","","","",						/* 90-99 */
+			 "","","","","BTN_BACK","","","","","",								/* 100-109 */
+			 "","","","","","","","","","",									/* 110-119 */
+			 "","","SD_CD","","","";									/* 120-125 */
+	pinctrl-names = "default";
+	pinctrl-0 = <&gpio0_pins_default>, <&usr_button_pins_default>, <&lora_control_pins_default>;
+	bootph-all;
+	status = "okay";
+};
+
+&wkup_gpio0 {
+	gpio-line-names ="","SENSOR_3V3_ENA","","","","","","";								/* 0-7 */
+	bootph-all;
+	status = "okay";
+};
+
+&sdhci1 {
+	/* SD/MMC */
+	vmmc-supply = <&vdd_3v3_sd>;
+	disable-wp;
+	cd-gpios = <&gpio0 122 GPIO_ACTIVE_LOW>;
+	cd-debounce-delay-ms = <100>;
+	ti,fails-without-test-cd;
+	pinctrl-names = "default";
+	pinctrl-0 = <&mmc1_pins_default>;
+	bootph-all;
+	status = "okay";
+};
+
+&sdhci2 {
+	vmmc-supply = <&wlan_en>;
+	bus-width = <4>;
+	non-removable;
+	cap-power-off-card;
+	keep-power-in-suspend;
+	pinctrl-names = "default";
+	pinctrl-0 = <&mmc2_pins_default>;
+	ti,driver-strength-ohm = <50>;
+	ti,fails-without-test-cd;
+	status = "okay";
+};
+
+&epwm0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pwm_beeper_pins_default>;
+	status = "okay";
+};
+
+&epwm1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&rgb_led_epwm1_pins_default>;
+	status = "okay";
+};
+
+&epwm2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&epwm2_pins_default>;
+	status = "okay";
+};
+
+&ecap1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&rgb_led_ecap1_pins_default>;
+	status = "okay";
+};
+
+&ecap2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&rgb_led_ecap2_pins_default>;
+	status = "okay";
+};
+
+&usbss0 {
+	ti,vbus-divider;
+	status = "okay";
+};
+
+&usb0 {
+	usb-role-switch;
+	bootph-all;
+	status = "okay";
+};
+
+&usbss1 {
+	ti,vbus-divider;
+	bootph-all;
+	status = "okay";
+};
+
+&usb1 {
+	dr_mode = "host";
+	pinctrl-names = "default";
+	pinctrl-0 = <&usb1_pins_default>;
+	bootph-all;
+	status = "okay";
+};
+
+&spi1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&spi1_pins_default>;
+	status = "okay";
+
+	mcp23s18: gpio@0 {
+		compatible = "microchip,mcp23s18";
+		reg = <0>;
+		spi-max-frequency = <10000000>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		reset-gpios = <&gpio0 25 GPIO_ACTIVE_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&mcp23s18_reset_pins_default>;
+		microchip,spi-present-mask = /bits/ 8 <0x01>;
+	};
+};
+
+&spi3 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&spi3_pins_default>;
+	status = "okay";
+};
-- 
2.54.0


