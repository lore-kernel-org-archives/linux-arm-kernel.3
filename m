Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EF50F513F2
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 03:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6hqwm3vcVsQRs3kqZO/NmZop4VIdM2cs07YuX7/GO1E=; b=OuOe/qGmtnKDEhoLNM1MTYbgAA
	zswyACXxrDFcyqwimMBc82AppFCGMBSDKikA8UjVw9My0oo3lmgNjmp1Yvt6RsmamatLl4NW0i9s5
	sOteHzfM7CRLdgWvSpkNc9ymUhi0VOhSiEQKgXJ/BE3F9DbG1ioQ/+GLY9+87jIjFC0CuryJy6ZOQ
	+1CegoMe09SOnGL9QukXg0quPdKomCgEt1aHvIZ2gYqA4J/Q9fZIBrt1AWehozh6V+LyyBww6fm+j
	GnnLqMIsqmPT85ClbDMCr0L2qgGpnpKLzqiLmltMjYY2GcsLGjyPpfwiCoPkm23c+bZ91S1x1HxMC
	PeTCBWZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyLvk-00000002xrJ-0biX;
	Fri, 06 Mar 2026 03:32:48 +0000
Received: from mail-swedencentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c202::7] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyLvh-00000002xoC-21i1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 03:32:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NY6ej711pl554NPOFJdlYYRYEv3f+w4Sef5s3j7977T8AZXJcaUNY5A7P/USahpPcwGivq3h8TwfSi1FgNjoWrCiKrisVrqCf7NG52Vi5VtieEbPeX0Rp+Lo874vZLVrW9YZKnjzaa8Y4XHxectu8sGctmWs/lNU0ej0ap5C6nHSRZEn/quTmMltD+UAygly9oU5385l0G3+kjwFyVe0X3WmO3GWibTUP6STPbti0UKURI5xhZm+CyKuZw4uqsa7IApMNtkaihMe0+pUc9XcddB8n9SqCT5pnviCLNhHdAMybXPEdMz/QosEpcF7uV6nOAQcfxIpc9JcOEpSKvpkhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6hqwm3vcVsQRs3kqZO/NmZop4VIdM2cs07YuX7/GO1E=;
 b=JMAFUYs1MLVOVkueGknxfPD6JS42jSXM5wL6HY/E6lRSTWD+WNTEd+SrRdzsKfgvebOCGY5rxmFsO/d4/DDroeSQQPQa1ZOcA9aZ7Dl83QYs/9eV8rE39YCETRzlJAsBUu6Fu8vG8HKS2RYJg+Vxu01SbhQPt9+SOd/7jQBbJnN/hR+OVvUbDJz6t3cgLJXfoSsDApaMv4bJss1UKGB1s5deAMCgpBnhN/1T1JdXlFDPvf/PemoTeRCDKXxHIMAMfxBebcI2H2A3JDo51zEs0Dqud9CvXFOTvUslJ57XqyP03bx9fLbyeSQ+lkOGDEQRGmplUkYf9rOiPeaAB8QFkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=ti.com smtp.mailfrom=phytec.de; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine header.from=phytec.de;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6hqwm3vcVsQRs3kqZO/NmZop4VIdM2cs07YuX7/GO1E=;
 b=aRJYX8O5KpBWojbKBzjJ6RHORyrC9nXdGATqiYHtcZ5lSxL3GKZArracQNwXK2NgwDQEKnKth2YzDANYv0PuME8ti6KRTYWCRcyQi5zQisZUa9bxYmBF3lZ+cW0JUSka5NJHGeuxEoXd/2xPytPwG9oBB5RHlts00UKQxae+J0jFWLKuZCNK+BkGTwFeaaixJBYz0f26Vj1ExDH7HvZdeGaTqtUskkd3eHipBPyRWFpBHH02G2PYPnEpiqf6ml/+Qie5++yNNi0KHXjFJ6DOF7Cdb9KFbIXQJwLQ+W1NCb3MHAIbRkguUQxBYlhTBUtV2X2yMo2UxPqSa1uE6VKcSg==
Received: from AS4P192CA0001.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:5da::15)
 by GV1P195MB1714.EURP195.PROD.OUTLOOK.COM (2603:10a6:150:55::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Fri, 6 Mar
 2026 03:32:38 +0000
Received: from AMS1EPF0000004A.eurprd04.prod.outlook.com
 (2603:10a6:20b:5da:cafe::c9) by AS4P192CA0001.outlook.office365.com
 (2603:10a6:20b:5da::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.18 via Frontend Transport; Fri,
 6 Mar 2026 03:32:37 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Postix.phytec.de (91.26.50.189) by
 AMS1EPF0000004A.mail.protection.outlook.com (10.167.16.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Fri, 6 Mar 2026 03:32:37 +0000
Received: from lws-haller-privat.phytec.de (172.25.39.212) by Postix.phytec.de
 (172.25.0.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Fri, 6 Mar
 2026 04:32:33 +0100
From: Dominik Haller <d.haller@phytec.de>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, "Tero
 Kristo" <kristo@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <upstream@lists.phytec.de>, "Dominik
 Haller" <d.haller@phytec.de>
Subject: [PATCH v2 3/5] arm64: dts: ti: k3-am68-phyboard-izar: Add LVDS-Display
Date: Thu, 5 Mar 2026 19:31:46 -0800
Message-ID: <20260306033151.276202-4-d.haller@phytec.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260306033151.276202-1-d.haller@phytec.de>
References: <20260306033151.276202-1-d.haller@phytec.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.25.39.212]
X-ClientProxiedBy: Postix.phytec.de (172.25.0.11) To Postix.phytec.de
 (172.25.0.11)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF0000004A:EE_|GV1P195MB1714:EE_
X-MS-Office365-Filtering-Correlation-Id: 35abb26d-85e4-4b0a-2749-08de7b310359
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700016;
X-Microsoft-Antispam-Message-Info: 1qCHnhy0PMTX/7l1QKslN8Vv1rna6NVb+pgmoh2WM7IE0mPPi0+rsKes+8x3sDbC925H6CrTxIp/OytU7i2U8IUVG7P+br/DcNUluY3AmSFpaz4Te9U/Mk3Kr3wbqpRbwxrXkgzRrN7tHThCSt9Z0WqbXhGzdwKjIU74UAlTQV3vrzhGxPd/XDHKOD6aWd1J+iCJW7JWrNa2yf9JT+1UK0ll778S6U481XxCBIWtwjTqp6ngjzoUph0rPM8bdAskzms7lBCF0Eg1CA/nckN3E846czyM27uPTwufRkVzD2zkuQSQUG+6ORMmCXdCSWttXEnp9dDwrsaaR2ke6Abs2iWVNysfW9MygZ44ttcin2dQ5gOH5jAzRCFUBQQWGjHoefPgFvkfd4yYmUmy2QczBxOxeRqciaj+wA+ntniqUGBGZQocFjEN5GfDZlUM3weMFgSOFujGu01OGTyLmD+8GEMNVtuAO1Y4PaAGMOFwAkA32XTPT1ibIFKLdRCac4Tf1K87Cu/zWXQhllillvljYZPzug+zttnCtBCBQcqGbusTZw4RlAkiE6t+BfQ9JoXQnIVrFChHbI7PFPizTaEztizyRbCEEECQRaqGQrOS4jaaL9BnuXhEUxPMddK/NmaKnh3k74Qwd/nhfBfGCZP8rz9QqvHnJwPpAcGFlsFEsSjBUeaC0iKkkFoFAfa52Q6zxBmgBq4yoyNB06ISUcGSohDR1Zeh0bL2Md+i+W+803cy+KGJ4N2hs8bTtrTS48ufgGMiBN5j7ITNzBHWWrZkeg==
X-Forefront-Antispam-Report: CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Postix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: m05YySL4uVIYFyf9wB60RQx5ZcOE0iL10Vx4If8HJLimS6DCzZABqigjJhDz6Kk/DkJ3QojI5guTMRzftCQxIaWMtBOTPvnAIq9PZMFCv4WJonTN8DDw0nEYYvc9PjxhOTT9/xh1eb0X2Tnfq9tLom4GnJRAL4A+Z3AnHnG5IqB6Sk8ivRx2RZ3RXvVi9dIVhHKd0n4RSymAG77UWas+CdMVSfaIgN0aMfSSyDa0Tk55Vv7trqxcsK5r/JMnGdkX3NOpIbiUmDdwxOb7V1qhf2ot8+DIdyzrRVrToX+/dAcT3J/CYyBebp7IhfpEyw7zOr+O6OTtHKsU/Sl8VU6DHrgpRwMQTKkTNWnSJ3rar51BuzC9fmlAMnu4ZmqLPQngg/nG4F9cix3oogiKsrx8CKjWXkuBLGTpSIa5DfPatGxYYOHfqqbd3+9No1Z+P0tl
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 03:32:37.2531
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 35abb26d-85e4-4b0a-2749-08de7b310359
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: AMS1EPF0000004A.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1P195MB1714
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_193245_531878_7DA44297 
X-CRM114-Status: GOOD (  12.48  )
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

Add an overlay to use a powertip,ph128800t006-zhc01 10.1" LVDS display.

Signed-off-by: Dominik Haller <d.haller@phytec.de>
---
 arch/arm64/boot/dts/ti/Makefile               |   4 +
 ...-am68-phyboard-izar-lvds-ph128800t006.dtso | 125 ++++++++++++++++++
 2 files changed, 129 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am68-phyboard-izar-lvds-ph128800t006.dtso

diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
index ba01a929e06f..a188e62e32b4 100644
--- a/arch/arm64/boot/dts/ti/Makefile
+++ b/arch/arm64/boot/dts/ti/Makefile
@@ -132,6 +132,9 @@ dtb-$(CONFIG_ARCH_K3) += k3-j721e-sk-csi2-dual-imx219.dtbo
 
 # Boards with J721s2 SoC
 dtb-$(CONFIG_ARCH_K3) += k3-am68-phyboard-izar.dtb
+dtb-$(CONFIG_ARCH_K3) += k3-am68-phyboard-izar-lvds-ph128800t006.dtb
+k3-am68-phyboard-izar-lvds-ph128800t006-dtbs := k3-am68-phyboard-izar.dtb \
+	k3-am68-phyboard-izar-lvds-ph128800t006.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am68-sk-base-board.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am68-sk-base-board-pcie1-ep.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-j721s2-common-proc-board.dtb
@@ -319,6 +322,7 @@ dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
 	k3-am642-tqma64xxl-mbax4xxl-sdcard.dtb \
 	k3-am642-tqma64xxl-mbax4xxl-wlan.dtb \
 	k3-am67a-kontron-sa67-base-gpios.dtb \
+	k3-am68-phyboard-izar-lvds-ph128800t006.dtb \
 	k3-am68-sk-base-board-csi2-dual-imx219.dtb \
 	k3-am68-sk-base-board-pcie1-ep.dtb \
 	k3-am69-sk-csi2-dual-imx219.dtb \
diff --git a/arch/arm64/boot/dts/ti/k3-am68-phyboard-izar-lvds-ph128800t006.dtso b/arch/arm64/boot/dts/ti/k3-am68-phyboard-izar-lvds-ph128800t006.dtso
new file mode 100644
index 000000000000..f167d6cc43e7
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am68-phyboard-izar-lvds-ph128800t006.dtso
@@ -0,0 +1,125 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (C) 2026 PHYTEC Messtechnik GmbH
+ * Author: Dominik Haller <d.haller@phytec.de>
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/pwm/pwm.h>
+#include "k3-pinctrl.h"
+
+&{/} {
+	backlight_lvds: backlight {
+		compatible = "pwm-backlight";
+		brightness-levels = <0 32 64 96 128 160 192 224 255>;
+		default-brightness-level = <6>;
+		enable-gpios = <&exp2 12 GPIO_ACTIVE_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&backlight_pins_default>;
+		power-supply = <&bl_12v>;
+		pwms = <&main_ehrpwm0 1 44000 0>;
+	};
+
+	bl_12v: regulator-backlight {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		gpio = <&exp2 13 GPIO_ACTIVE_HIGH>;
+		regulator-name = "BL_12V";
+		regulator-min-microvolt = <12000000>;
+		regulator-max-microvolt = <12000000>;
+	};
+
+	panel-lvds {
+		compatible = "powertip,ph128800t006-zhc01";
+		backlight = <&backlight_lvds>;
+		power-supply = <&vcc_5v0>;
+
+		port {
+			panel_in: endpoint {
+				remote-endpoint = <&panel_bridge_out>;
+			};
+		};
+	};
+};
+
+&main_pmx0 {
+	backlight_pins_default: backlight-default-pins {
+		pinctrl-single,pins = <
+			J721S2_IOPAD(0x064, PIN_OUTPUT, 9) /* (W28) MCAN0_TX.EHRPWM0_B */
+		>;
+	};
+};
+
+&dphy_tx0 {
+	status = "okay";
+};
+
+&dss {
+	status = "okay";
+};
+
+&dss_ports {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	port@2 {
+		reg = <2>;
+		dpi2_out: endpoint {
+			remote-endpoint = <&dsi0_in>;
+		};
+	};
+};
+
+&dsi0 {
+	status = "okay";
+};
+
+&dsi0_ports {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	port@0 {
+		reg = <0>;
+		dsi0_out: endpoint {
+			remote-endpoint = <&panel_bridge_in>;
+		};
+	};
+
+	port@1 {
+		reg = <1>;
+		dsi0_in: endpoint {
+			remote-endpoint = <&dpi2_out>;
+		};
+	};
+};
+
+&main_ehrpwm0 {
+        status = "okay";
+};
+
+&sn65dsi83 {
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+			panel_bridge_in: endpoint {
+				remote-endpoint = <&dsi0_out>;
+				data-lanes = <1 2 3 4>;
+			};
+		};
+
+		port@2 {
+			reg = <2>;
+			panel_bridge_out: endpoint {
+				remote-endpoint = <&panel_in>;
+			};
+		};
+	};
+};
-- 
2.43.0


