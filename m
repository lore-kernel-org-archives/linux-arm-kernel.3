Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80A56CD6E55
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 19:23:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZYpNyRp6J+uQZb0rThVYi4bzp/kulWviA1mIKaFTf/Q=; b=sUXRHwF9zzcIrLGuSUJ5WwKlN6
	Rv6kLwANnO+i7qe30kc7GI+4JzEyCXIagLuPtATaexA/zywhMUYrpgjK9nRjgsMeQejEEhYYmUh50
	R+17kviBoaf+DwVUnDqsKS9wWRgo65tJ62Vb5aKHxcomP6M8AuymizWagaJ2ejmVX5bP4sLeG8dpw
	B7CJUpGTyzHlgaZUexwfJmT1/ibDiPHMvlB6hjnNG6GWouAvbpKqpoHYY2oRrVOWlFs3Yh4lCbdBA
	pKCxES5VCvUOo1A0F0Io520grmXz1hmxDUUdGQ+zZv2LcABkKKlf9Jr6cEahLaaqz+NMssL6nvnaz
	g2feFU2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUrBM-0000000FkJz-3jGV;
	Wed, 03 Jun 2026 19:23:16 +0000
Received: from mail-westusazon11012058.outbound.protection.outlook.com ([52.101.43.58] helo=SJ2PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUrBI-0000000FkIo-2eAE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 19:23:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hj06vba+/vbMI4fAGB+3pkcZOCUbckZuj1nRWscBagMuF98jyROrYbTJjXPStdhg5KTpU3daojPV7PP14C5m9ge7LIxI9uXnTn4tbEq7pVZPlkOzgwpX2rio09oVxi0gexedCO2c29GQ34+OPsO4yuBwlqyXctsa1H63g4SYnuZHJdntvaYisFvc0oaCI1IXFSRJltmc8S6RUqvcr5Xzqnp4WbA6VdEzuOuipr19gfwdaYbrGTunXcsnAdwvBeXziolX4qBWbKpaN/CzleFQpK4MOW8mGXxgmod4NG9tUnDSOK14s/tNobwN/Y4R/58ZahOCiB823ErvxjRg8Rzh1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZYpNyRp6J+uQZb0rThVYi4bzp/kulWviA1mIKaFTf/Q=;
 b=yEAy6pGbB1JrBFnG4AbaOAXIoKMxrNoaBx22t7SAW+A7jO/FhEXfqXY5CY9JBhxZhIhnB9Ls4VcT09RdwEWFHIjFB47Pur/N6Aj1q1k37WS74ZKYitkHfcWVOPen8Q8JkIzaHZ6QBabirlMmuyH4a6OmsT9vscBXE2HKUz7byCeqwUKHMB5KZADrSElLivvsrPh862xgjP+rHGqm8sbnDiupHP+TQRHXl3Lw+Xu6UsL9+YrX+5k3fW3AJMZJ7thIzPXZ0uA19dH9Ro6mjMo95Ktf41bf1SCiI4hBQw2V8eU5rV3assE5eTB3OLNMhuNYjk8fkjVzydvkf31FSvB/Cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=microchip.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZYpNyRp6J+uQZb0rThVYi4bzp/kulWviA1mIKaFTf/Q=;
 b=wWD0t6dwUjEbXowvCbtcpPI0fjKlmxFF934Q/NdEdKurTOZb5GM7wLszl0+/gnfx7/bcH38qX/bLP+TwTVPxRHaYxVI0kME92+nKb2k7PQJy0TGErCLaMHe3Bqx2Kl975tgWZhGukeThvBL/HCn+MErUjCZy4nEKXEuCSPxPikQ=
Received: from CY5PR15CA0160.namprd15.prod.outlook.com (2603:10b6:930:67::28)
 by DM3PR10MB7971.namprd10.prod.outlook.com (2603:10b6:0:b::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.7; Wed, 3 Jun 2026 19:23:06 +0000
Received: from CH2PEPF0000009D.namprd02.prod.outlook.com
 (2603:10b6:930:67:cafe::48) by CY5PR15CA0160.outlook.office365.com
 (2603:10b6:930:67::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.7 via Frontend Transport; Wed, 3
 Jun 2026 19:23:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CH2PEPF0000009D.mail.protection.outlook.com (10.167.244.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Wed, 3 Jun 2026 19:23:06 +0000
Received: from DLEE203.ent.ti.com (157.170.170.78) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 3 Jun
 2026 14:23:05 -0500
Received: from DLEE202.ent.ti.com (157.170.170.77) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 3 Jun
 2026 14:23:05 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 3 Jun 2026 14:23:05 -0500
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 653JN5Mr2372249;
	Wed, 3 Jun 2026 14:23:05 -0500
From: Judith Mendez <jm@ti.com>
To: Judith Mendez <jm@ti.com>, Nishanth Menon <nm@ti.com>, Vignesh Raghavendra
	<vigneshr@ti.com>
CC: Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Andrew Davis <afd@ti.com>, Bryan Brattlof
	<bb@ti.com>, Jason Kridner <jkridner@gmail.com>, Robert Nelson
	<robertcnelson@gmail.com>, Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v6 2/3] arm64: dts: ti: Add k3-am62l3-beaglebadge
Date: Wed, 3 Jun 2026 14:23:04 -0500
Message-ID: <20260603192305.1347908-3-jm@ti.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260603192305.1347908-1-jm@ti.com>
References: <20260603192305.1347908-1-jm@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000009D:EE_|DM3PR10MB7971:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b96c721-1539-4826-3775-08dec1a58a23
X-LD-Processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|82310400026|36860700016|13003099007|18002099003|22082099003|3023799007|56012099006;
X-Microsoft-Antispam-Message-Info: XnW4feoTdUahyoLVVrWzu5UXM3vEhV+xECkYYePlcvvzSFNnqjK7PWXOFNred3VEhvAmchj3TsE38CvcD9kuioxU/5cZSGEKXfp4apIUeqaj4TW2mGk8qN1OzXisNC7HYYZx2VzGuSwl+OSILSx942cMZ6cIYr5EanmNz45n3zJ1N/jiOi6K5aKSo3srCPnCFgKzmugruaaiqCwBm6r1IJktJ++om5s1Iroewf1MXFFCoYOR8WrZJwWnjqNaPHItFmHVTLQoj97Z4ajOujLaPBzvo4cslBR8EDMeHdcnNo8tOb92KZKXCAJziPAhLxpnLMCH4XBAR51cGvZUXqoRVVhrlOR2F/LyMYIDhXW/KPSYPSoivfYmKQYWan7En3QJGUYiSemlVhYT+wzLEZ0dxAWhWxWeIf/xPEY7JateoA/c7zWk2vTwe82QlVCbJeHJv4aR5QXxRLs/j/rJ27RrNiuG+JGdhtgKe6wPOQTP+yEMPgEikvdv8OCg5ve4vQSifUdF3nolEDK2EYzDSYXOiwlOQbGMh0Z/gbOdtc5CL6HANSxTlUzV+t4MPXc0elwF5HKaJEIL85Ae8WE2SGnPJz9Fx7PjxznWuQqc74mEzOuqEJtJiIucLm2Xm5VzxBcxM/TtSHkwNAhojvRJATiGiMu9lJ/iyGI0lC3+t/jFbeLlzt9H3LnQvwrBu7ipE05a
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(82310400026)(36860700016)(13003099007)(18002099003)(22082099003)(3023799007)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 1iBLst6OoT44SjUEU+yaNs2W81r7Q3J6t9tDvv+VB/YNWOTVBfGVjXDQ6LyPIlTJoT+u4y0dRgmvgHxQfXJL4XXmWU/unbeWoweoHU/zulH9zEA8Yvm+EawpusiqCBtQ5MGsXIjlOWyo3lf9dVY0Puiv0i+ak6TS8KvICMFa1Q6pJlen79YkejCs5UANF5xy78E0BNwGzogo+9qYyaUtV1HLmMUUp/Y0ZzwggaTi0WCPbGPKBBwgqn4amlFjPAZhUmjhlCteEup3JQJZXcqJ+ciyzB9mmgsttXpoXUV8hF3Y/fELgJBU3CnJ6mHrfQUnKEjA5SPQ0OUdkNRSWW1j01IIgy3ebL0HJc44UbxGYD6tpJpXFpsAGMh8voJFv8M23jK7kZlImZhMa54ofUbV802tJza8jMBC8i/B7WgtMwboe33FqLnbK4Vx3RUFk+7q
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 19:23:06.3606
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b96c721-1539-4826-3775-08dec1a58a23
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF0000009D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR10MB7971
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_122312_737289_CC7551F9 
X-CRM114-Status: GOOD (  15.33  )
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

https://www.beagleboard.org/boards/beaglebadge

Co-developed-by: Andrew Davis <afd@ti.com>
Signed-off-by: Andrew Davis <afd@ti.com>
Signed-off-by: Judith Mendez <jm@ti.com>
---
Changes since v5:
- Fixed aliases/chosen nodes
- Sort Makefile items alphabetically
- Use dual license: GPL-2.0-only or MIT
---
 arch/arm64/boot/dts/ti/Makefile               |   1 +
 .../boot/dts/ti/k3-am62l3-beaglebadge.dts     | 657 ++++++++++++++++++
 2 files changed, 658 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62l3-beaglebadge.dts

diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
index 5269c9619b65c..3f1904a5b622f 100644
--- a/arch/arm64/boot/dts/ti/Makefile
+++ b/arch/arm64/boot/dts/ti/Makefile
@@ -40,6 +40,7 @@ dtb-$(CONFIG_ARCH_K3) += k3-am62a7-phyboard-lyra-rdk.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am62d2-evm.dtb
 
 # Boards with AM62Lx SoCs
+dtb-$(CONFIG_ARCH_K3) += k3-am62l3-beaglebadge.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am62l3-evm.dtb
 
 # Boards with AM62Px SoC
diff --git a/arch/arm64/boot/dts/ti/k3-am62l3-beaglebadge.dts b/arch/arm64/boot/dts/ti/k3-am62l3-beaglebadge.dts
new file mode 100644
index 0000000000000..ee2d562baf51a
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am62l3-beaglebadge.dts
@@ -0,0 +1,657 @@
+// SPDX-License-Identifier: GPL-2.0-only or MIT
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
+		stdout-path = "serial0:115200n8";
+	};
+
+	aliases {
+		i2c0 = &i2c0;
+		i2c1 = &i2c1;
+		i2c2 = &i2c2;
+		i2c4 = &wkup_i2c0;
+		mmc1 = &sdhci1;
+		serial0 = &uart0;
+		serial1 = &uart1;
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
+		gpios = <&gpio0 16 GPIO_ACTIVE_HIGH>;
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
+		enable-active-high;
+		gpios = <&wkup_gpio0 1 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&sensor_3v3_ena_pins_default>;
+		bootph-all;
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
+		bootph-all;
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
+		bootph-all;
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
+		bootph-all;
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
+		bootph-all;
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
+	gpio-line-names = "","","","","","","","","","",	/* 0-9 */
+			 "","","","","","BOOST_5V_ENA","VDD_3V3_SD_ENA","","","",	/* 10-19 */
+			 "","","","","","MCP23S18_RESET","BTN_SELECT","","","",	/* 20-29 */
+			 "","BTN_LEFT","BTN_UP","","LORA_RESET","","","","","",	/* 30-39 */
+			 "GAUGE_BATLOW","LORA_RFSW","BTN_DOWN","USB_RST","MBUS_INT","","","","","",	/* 40-49 */
+			 "","WLAN_EN","","","","","","","","",	/* 50-59 */
+			 "","","","","","","","","","",	/* 60-69 */
+			 "","","","","","","","","","",	/* 70-79 */
+			 "","","","","MBUS_RST","","","","LORA_BUSY","",	/* 80-89 */
+			 "","","","","LORA_DIO","BTN_RIGHT","","","","",	/* 90-99 */
+			 "","","","","BTN_BACK","","","","","",	/* 100-109 */
+			 "","","","","","","","","","",	/* 110-119 */
+			 "","","SD_CD","","","";	/* 120-125 */
+	pinctrl-names = "default";
+	pinctrl-0 = <&gpio0_pins_default>, <&usr_button_pins_default>, <&lora_control_pins_default>;
+	bootph-all;
+	status = "okay";
+};
+
+&wkup_gpio0 {
+	gpio-line-names = "","SENSOR_3V3_ENA","","","","","","";	/* 0-7 */
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


