Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C4B9C44507
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 00:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JICTE7c0vCrS4PXYk/rEUMbOzyQUYInz/SONMkwMn3A=; b=sjoGZj8MJf4DAHxcfp0eawknWg
	WH0vFciW7s9SthokDqTQT58zE3mvIiBCRThHPrPFQ9Yxd/YL2hbQOrtd0zgstPvCMZnNtSVi5f49+
	CX7C/9zorABKAy4TcTkmAS3zq2yYGd8ifjG+PmGpNGR+rpSG1qXEel28yHk0FjUihsROT2Gcq0ocF
	cu4Q/ERZgbOv+aU35aqufr3q8kb7IHVH9NTvFRznsaqnPjiLrmLkS6WGT5sM6C3kLaBHOGe5CqmaJ
	8kZGfDNepiRdGLytqx4nhRs8XEaNrsnVmkLs+B7vxUDFaBRK/gxUUx07XZK/3W5/ItmYv5jmtUl1O
	iy4SMbCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk9f2-0000000G77n-0QcF;
	Thu, 16 Jul 2026 00:09:08 +0000
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk9ez-0000000G773-1DAW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 00:09:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vc1Tp61zh7YoMugGbpoWrzIPmxJJxPY9VWXQ8Y0I4pTNd8wit9RzzzX409jlmfVYiJhowpW8+IsFPG7eGdIOAPwgBVVdfIJzFlk2gtHmqLoKrZIz/Vsuk2HiyPHThXsLT1H6iPDqpKA+1IXNtrHm78r5r86tUHZ/l2htPcrh2jeanNp0s8q2+nTx33UVk5dRcu0pGtqsZxVLoq970VTCJpcZ7d0RRbaYCWiolnCfx2cVUrNCSCRg5XuSdqs/EUOtd39PJCkZJ44YS2r36LHbNqdz8pvzL6BLOPe/MsHtKP1u3MA10ErSHK/0CASg47vhujO+xr2j/wmr6NI20oFrWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JICTE7c0vCrS4PXYk/rEUMbOzyQUYInz/SONMkwMn3A=;
 b=gRGc3JkjeUbsDvPj4uzsECMG2Okp8/bxYJa52uDAaW+2npbRveR8QZFGvdPlsqAvyC4TWX+rUt7VJ9Hli6smcG0gO9EErnuMoGK4kQVjz9s7oHQ37SqVflVP4xNEQ45ejueBGsvpqmvr7nJXVU5f83CSzpKiRXp/XgbAS1cjhM+22qcAEIR1R9T/IxixNGUU8Ncbut+HuzqIAUDDLxUhQ/07Tib6NOk4PazFrbQCbFKcoIsL+kJ3r22PtCTzoCcqy5b/vwGIZBA+1mlcGc44+bWh/pXkbAe8BmM2N1gshLMUvNpcN32GupjrJoeN/h3DtCLIdNKzutkF8Yc0Fkwiyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=ti.com smtp.mailfrom=phytec.de; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine header.from=phytec.de;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JICTE7c0vCrS4PXYk/rEUMbOzyQUYInz/SONMkwMn3A=;
 b=Atmpkyci96UxiQbppLmbKbaOikCVgiVOIO15q1OXERcjHjCVi3ig18gSGKSPVeXqqjafnOslWr2dg0PDchfxCI4i2oyHBlzO6YexNTkHxOhogWYoxC/0EEVkbLdfhnQkVt180baXSZjp6MrVJyY+TCwgnSwmrCoZGUqA/ViwSNbcOk8ZlZCO5l8VUoTljb+lHtrqsh7g3P9UAyZGniemqzlMaQ0Bl9jRx2JDa4reY+gKs8mL7YqvHXz3o/jUcLWuotnkpnTHG3/QHu2GqWdW1M/rzYWanV6owyLzTy1Rkb7OhsZ9FY4zn4ai2DeWVQ5Bs0MohYKzczgnlW3/Gbch8Q==
Received: from DU2P251CA0017.EURP251.PROD.OUTLOOK.COM (2603:10a6:10:230::16)
 by GV1P195MB1667.EURP195.PROD.OUTLOOK.COM (2603:10a6:150:52::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.11; Thu, 16 Jul
 2026 00:08:53 +0000
Received: from DU2PEPF00028D0D.eurprd03.prod.outlook.com
 (2603:10a6:10:230:cafe::ad) by DU2P251CA0017.outlook.office365.com
 (2603:10a6:10:230::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.11 via Frontend Transport; Thu,
 16 Jul 2026 00:08:53 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Postix.phytec.de (91.26.50.189) by
 DU2PEPF00028D0D.mail.protection.outlook.com (10.167.242.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.223.9 via Frontend Transport; Thu, 16 Jul 2026 00:08:52 +0000
Received: from lws-haller-privat.phytec.de (172.25.39.212) by Postix.phytec.de
 (172.25.0.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Thu, 16 Jul
 2026 02:08:49 +0200
From: Dominik Haller <d.haller@phytec.de>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, "Tero
 Kristo" <kristo@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: <upstream@lists.phytec.de>, Dominik Haller <d.haller@phytec.de>,
	<linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH] arm64: dts: ti: k3-am68-phyboard-izar: Add pwm fan
Date: Wed, 15 Jul 2026 17:08:25 -0700
Message-ID: <20260716000827.84982-1-d.haller@phytec.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.25.39.212]
X-ClientProxiedBy: Postix.phytec.de (172.25.0.11) To Postix.phytec.de
 (172.25.0.11)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D0D:EE_|GV1P195MB1667:EE_
X-MS-Office365-Filtering-Correlation-Id: ef6fd8e2-cce8-4700-ec07-08dee2ce6b4a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|36860700016|1800799024|23010399003|82310400026|56012099006|11063799006|3023799007|18002099003|10067099003|13003099007;
X-Microsoft-Antispam-Message-Info: ESxilgMLcGTUrZ5zmwtCia/l3JgMH1cjQFjHf3f6mE2Zr4mw+Prquu9m5dZ/eCVVAa1zf4cgic9HnTD/+3xd2BWDQEAqVJzDOStZtlKrh0FAhvPm6DiUVPWrieBpzSfJXlsp27tPGFtVEJAs3mkQh/5EGsIGU4Oo588ZC6dWyjFGP4ksAVzOEFCS+L4Qta1ihVXAcvspjkJTYFqNXAO2+T99X2O641wPF297kPjh7cDtPYkghx2r+1qM6/FFxLhGj+uoA3ZtUvxo8RvXtrR4gnaRNqPo4eRsTUu5Wb6KKRG9mTW9OX/HxdjdnSxjBK32gGXTExsJTTjLhzT/aGMehQp6KTgB+vLl+Pkc9Be4pCIMJjBrpKQbl/8mGV2EJdfIcOC6Q8krfVUSlKOnIEgjrvBUkRYLxqX7S7A9LKQG2lnNQv9mdSu4fQ41MxCO8k9HbHV9pQfNG8ux9xfHVIdUwbAr+g698r9XsEPlhLT7O05E0vEd/4HAQxYHTRsclcX9jeI6HFOf695qd5F/YGdpLw/gZxtWVBj/fdqnUFj+U/V+CPo+TRnW36TnnP+ywwmLvm6CYLX0d1JidLFWK+cYsr8ERzhwNt3MhbXJC/GNksSjOO19gOdmaq53//ra2hPZF63TXihPwl4JYEgnCuFokmxztwEJmy8PjrJYzF8xqH7hwXwEgl7YgSJRxe50+dXsmKJ3MYneV4cBdG5Xa/6YKg==
X-Forefront-Antispam-Report: CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Postix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(1800799024)(23010399003)(82310400026)(56012099006)(11063799006)(3023799007)(18002099003)(10067099003)(13003099007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: xYllibsOJ8DhrSCdJeBU8idQvZ6ygrfLTxOTn0htmS2TOOlCbEUTzhVglfXIN9IBKbclrXGrwt6uLy3E76LCd2dKgQgYrBPJKKToePh4sNAvszbJwdJTkcvHcStGHAcrX87p0rPsxR+gqqTJpiLRzULK4fsqFyeDplAJLigz7mbOQ/rzzGzCVlfg9kAbJNfANWecV3KD/wLBUS9z8s1cvUQSp90L0HukqcoVONDUh/ZWlUD6ZC52DyuLOJVjTcrXlKDJQMk1B60v4xjwgvVUwi5MItGlWY1jMDtQJKGBGwVsy8Zvx7TJ7+MLZbYi4WMcUYU3Iw0LBeBLc19mpP4Gq0IBEG5s7X8fdrHZthourNWk76QzS+sR5OudnOeHTydXh2t+lMX0ygV0HeexZ7pkITGg/Fykl1TZYodvhvtbKFjNVZUijE6KOWK11iIG2EAn
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2026 00:08:52.3672
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ef6fd8e2-cce8-4700-ec07-08dee2ce6b4a
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF00028D0D.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1P195MB1667
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_170905_349786_4B2D17C4 
X-CRM114-Status: GOOD (  13.76  )
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

Add an overlay to control the pwm fan[0] that comes with the kit.

[0] https://www.sepa-europe.com/en/2023/06/16/axial-fan-lf40p/

Signed-off-by: Dominik Haller <d.haller@phytec.de>
---
 arch/arm64/boot/dts/ti/Makefile               |  6 +-
 .../dts/ti/k3-am68-phyboard-izar-pwm-fan.dtso | 74 +++++++++++++++++++
 2 files changed, 79 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am68-phyboard-izar-pwm-fan.dtso

diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
index 371f9a043fe5..bf03d895aed8 100644
--- a/arch/arm64/boot/dts/ti/Makefile
+++ b/arch/arm64/boot/dts/ti/Makefile
@@ -173,7 +173,10 @@ k3-am68-phyboard-izar-lvds-ph128800t006-dtbs := k3-am68-phyboard-izar.dtb \
 	k3-am68-phyboard-izar-lvds-ph128800t006.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am68-phyboard-izar-peb-av-15.dtb
 k3-am68-phyboard-izar-peb-av-15-dtbs := k3-am68-phyboard-izar.dtb \
-        k3-am68-phyboard-izar-peb-av-15.dtbo
+	k3-am68-phyboard-izar-peb-av-15.dtbo
+dtb-$(CONFIG_ARCH_K3) += k3-am68-phyboard-izar-pwm-fan.dtb
+k3-am68-phyboard-izar-pwm-fan-dtbs := k3-am68-phyboard-izar.dtb \
+	k3-am68-phyboard-izar-pwm-fan.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am68-sk-base-board.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am68-sk-base-board-pcie1-ep.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-j721s2-common-proc-board.dtb
@@ -387,6 +390,7 @@ dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
 	k3-am642-tqma64xxl-mbax4xxl-wlan.dtb \
 	k3-am68-phyboard-izar-lvds-ph128800t006.dtb \
 	k3-am68-phyboard-izar-peb-av-15.dtb \
+	k3-am68-phyboard-izar-pwm-fan.dtb \
 	k3-am68-sk-base-board-csi2-dual-imx219.dtb \
 	k3-am68-sk-base-board-pcie1-ep.dtb \
 	k3-am69-sk-csi2-dual-imx219.dtb \
diff --git a/arch/arm64/boot/dts/ti/k3-am68-phyboard-izar-pwm-fan.dtso b/arch/arm64/boot/dts/ti/k3-am68-phyboard-izar-pwm-fan.dtso
new file mode 100644
index 000000000000..8c1a51216a90
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am68-phyboard-izar-pwm-fan.dtso
@@ -0,0 +1,74 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (C) 2026 PHYTEC Messtechnik GmbH
+ * Author: Dominik Haller <d.haller@phytec.de>
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/pwm/pwm.h>
+#include "k3-pinctrl.h"
+
+&{/} {
+	pwmfan: pwm-fan {
+		compatible = "pwm-fan";
+		pinctrl-names = "default";
+		pinctrl-0 = <&main_pwmfan_default_pins>;
+		#cooling-cells = <2>;
+		cooling-levels = <0 90 150 255>;
+		/* frequency needs to be the same as lvds backlight */
+		pwms = <&main_ehrpwm0 0 44000 PWM_POLARITY_INVERTED>;
+	};
+};
+
+&main_pmx0 {
+	main_pwmfan_default_pins: main-pwmfan-default-pins {
+		pinctrl-single,pins = <
+			J721S2_IOPAD(0x0cc, PIN_OUTPUT, 5) /* (AE27) SPI0_CS0.EHRPWM0_A */
+		>;
+	};
+};
+
+&main_ehrpwm0 {
+	status = "okay";
+};
+
+&main3_thermal {
+	trips {
+		cpu_low: cpu-low {
+			hysteresis = <3000>;
+			temperature = <55000>;
+			type = "active";
+		};
+
+		cpu_med: cpu-med {
+			hysteresis = <3000>;
+			temperature = <60000>;
+			type = "active";
+		};
+
+		cpu_high: cpu-high {
+			hysteresis = <3000>;
+			temperature = <65000>;
+			type = "active";
+		};
+	};
+
+	cooling-maps {
+		map1 {
+			cooling-device = <&pwmfan 1 1>;
+			trip = <&cpu_low>;
+		};
+
+		map2 {
+			cooling-device = <&pwmfan 2 2>;
+			trip = <&cpu_med>;
+		};
+
+		map3 {
+			cooling-device = <&pwmfan 3 3>;
+			trip = <&cpu_high>;
+		};
+	};
+};
-- 
2.43.0


