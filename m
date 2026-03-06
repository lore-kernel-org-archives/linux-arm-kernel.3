Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA040F513F2
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 03:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=psYX1MhmbIcEfhGzTCukgaNBdhLNSreflv9wbBZzQO4=; b=fWmiHfQBt88I2FpG4m05EmC9IY
	YFe8rpzD25LbqxRZEfp3wScDU0V8F8c7UgCIrotTWc+HXkJQ1xJhQ9m2jXrOc2uCByJ/Ni+dJCNF9
	04zbrWi3+Yd8tfJdN8MV6KrTygeDrsrKjOjgJVXKsui9s24Yq4J22Cdd7QOOcHYdQcxhCIRIhF/9s
	7kC19gq8yRb1ZbE65s2uJLkd8r9VyHirk4l57d3cIhhrXQXUG4lUpLRomM7HjDY5p0edge1aEcHGv
	PV8yWw8arnCTk29Fak01dQs0vAQAS9VQ1xhs6hAbKu1Ar9aw6Fh6sYit51ikuy7GEJ+U79gkhuzhW
	JJwW5jfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyLvn-00000002xuB-2I8U;
	Fri, 06 Mar 2026 03:32:51 +0000
Received: from mail-westeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c201::1] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyLvk-00000002xqB-3QVE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 03:32:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JAeezQBdcdE/LBcXdKhNT1HWM+uIyIqaLo3BR18tfQV92kUT6/fSzvfRpDWrQKNcffOoyvy3Sus92RfW5x3XzEtNEPXz2rH3FvFkP9ll5K05F++FQkMg5MUnWaV3YErl76Cm7U+pyaEuDwsDKikHnOvzkxnhhiE9Imh9FlNNYOgy2vIlTZGGHvQFp7EeopAYxK0GexdLP8J39YCraF0jYFnvfu3YcnwkCYMtGN90Tcau7tff/XS4XkIvP+Omapko8dKf/u9z4EvM3KHG9gOYbOdPIo4sJ0AzMfspqcapWElyLiyeoerAJ+88iJLieUivbnf40CQFZiGCuvCDQX5i0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=psYX1MhmbIcEfhGzTCukgaNBdhLNSreflv9wbBZzQO4=;
 b=kHcSo9Ix91lDGewEdsxHxfN2SGQ3yWSzrBGuiIATWg7Ojb5Wv8eYwtxEJ0lH/W6/QTCulQc32PF0EID40BwMvaSwn3u4FxZYb3+M3iz/1bVtMorlad0d3bL+tvKvvRZes+WbaGe7CeBqYU0Gqs6WOYAXA+Dit/QIBKi/B/Bpsf3VDnkrfowrS1bAx9JOQMHe247zkB7RoYG8KpUK4f2LmluvNIB+YHgLtiWiZN41KrOZJJS1lRh1FGSqCFoXiDO0VEZDRUbrcI8VtIeTbqmZFKEKlaoJCaC3e5Ty0OxOUlx32ZA9jgbnWCy3H6i3kQlgkGJAaVHKr/yOYqMhR1mVkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=ti.com smtp.mailfrom=phytec.de; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine header.from=phytec.de;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=psYX1MhmbIcEfhGzTCukgaNBdhLNSreflv9wbBZzQO4=;
 b=tyZMw7nMOxmm98cuyFbRJwYp+E6f6Q3Llomg5On5hIV8BKMpAaOs3bQT42Y/8GJLL5WM3/olEKefeeThMK7acNKAduYjhNZFKDh2jdJdVQ01U3bPxHMANGpm4w+l4I6w1WxCd8L/82hZPRZ3cSzAY4NDkSUzS74MJ3/Z4Em4hkP6rmzYQsrknPi+X/sn4rnOT4WItO48yzXYf3MvToNh1cAS6EEEQxxWyYzqdrEIKdRTGX10sRcMEdnAB+BPwSEJO36JxmbApZwGAfkaUOffQA8pAGDAEZmxyHB1NKGs/ql5/yrWqoZI5ZG/scjZHCmJP1cCIoxwYDMeQCy1VcrQgw==
Received: from AM0P190CA0014.EURP190.PROD.OUTLOOK.COM (2603:10a6:208:190::24)
 by BESP195MB2850.EURP195.PROD.OUTLOOK.COM (2603:10a6:b10:ee::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Fri, 6 Mar
 2026 03:32:43 +0000
Received: from AMS1EPF0000004E.eurprd04.prod.outlook.com
 (2603:10a6:208:190:cafe::13) by AM0P190CA0014.outlook.office365.com
 (2603:10a6:208:190::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.22 via Frontend Transport; Fri,
 6 Mar 2026 03:32:43 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Postix.phytec.de (91.26.50.189) by
 AMS1EPF0000004E.mail.protection.outlook.com (10.167.16.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Fri, 6 Mar 2026 03:32:42 +0000
Received: from lws-haller-privat.phytec.de (172.25.39.212) by Postix.phytec.de
 (172.25.0.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Fri, 6 Mar
 2026 04:32:40 +0100
From: Dominik Haller <d.haller@phytec.de>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, "Tero
 Kristo" <kristo@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <upstream@lists.phytec.de>, "Dominik
 Haller" <d.haller@phytec.de>
Subject: [PATCH v2 5/5] arm64: dts: ti: k3-am68-phyboard-izar: Add PEB-AV-15 overlay
Date: Thu, 5 Mar 2026 19:31:48 -0800
Message-ID: <20260306033151.276202-6-d.haller@phytec.de>
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
X-MS-TrafficTypeDiagnostic: AMS1EPF0000004E:EE_|BESP195MB2850:EE_
X-MS-Office365-Filtering-Correlation-Id: b4a0b19a-6da4-481f-a47c-08de7b31069e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700016;
X-Microsoft-Antispam-Message-Info: zGQBKbU2ty5gVlmXfgXvl3K7FYztmNN2QPgbLz1QyddjVxeAm9VV+ufUeppO6SzzvK9JdU01824N8yl8iUU3pEaWJzPAzt6+gXZL3vWugjdWlMKyVROAVOu69ydfJjhMEOOzIksfK14YaXjnK85uvy39hl/iKEVPRdsRiAtz8jUqObXzMBhLAoNf6J2SKtYfJLccyf0EUc6tc+yoqqKp7P9nxAUPkrn5DvzMCSMuLa3pAeFJU22qX5jUpbG2qqS8aGzmtMEuNdSO+eSKTnEahwrhT7GsPY9VVZ5Tf6Bjl58kCAkgA7TJ5qIWnbq2eDVfIxM4OjTswjJRDeTe968dHftBmgZinmohOHqjQvVP1stBFrMZwN80McMfTb162WvxubTBv9dCpEOl9ZwU3WFkK54xvcD86f+arQ5ivvC+7TtnAXG9CzcfdQeyqWbw4xZ4+T5CykpqeoIcMrzGdYm5ebUClkFy4PYy3WwJ3nzZ7hXJEubagohQ9BKCYMcnRE0CoErBlbMomS3Ls+2Qf0W00nrEYFKIMhVB/oSPoTXuF2/7YP9pv0zWIzexQcZkDoJOAzytP1VPVd4ZGL0rygmpfLv862mzQ0Tcis/wPWj+V4B4lw3Z+7ZZbxT9EDR3wWhps4XZTkYVYb92KTkj6Bu1TT7NcNxISbBUUMbVmvlQvxp/X4rHQtzlPOXYtOhVs9naPd245DxzDHvYSKw2ZcmCLtZ/0FRbW8PkwGYnqtLyazvRNvGyR5//11IzOiG3kpuuRwq8aFg3aYVz5pnZGp0xrQ==
X-Forefront-Antispam-Report: CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Postix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 6DFXPmL2BC5ASzRsDyPJN0uA/X1LhhDgKLACasOYUCU/ehQzNflh2qm9Iy2ZKCUEbiRMp2dO055qkUvw2lwf+wdaQRXVXm6pfhtJs60XWZtT+Pki6nOv2KJ8BgxWFKKeXItn+MDN76X6dQ/ZbHNXSm84BsSN2ZppdZaawAecM4Y9x/zqGZV0mbgHYY3EzpwMyiKAQbdRZhr8wq1EX5ahVSs9mDauc9SdN3tiQcnu6AfZxSQes1J4fd5MJfotZYII/Ui0je0w2xv6ztuAXVd0xqLFNL/n5CPRveO4c3rVg/Ilvcgf75t8b+/6icZwHNzKEjyNumXmSdAK2AENIEjruQ5sYrhNvLnJtwKUkYnGRJ0sfqk5T47fCqI0w5Y+P7vhQxQeP0o0x+rVYDNBWFDNXTBdShOpxDf+ZqT48e8FyGKcIbXNCvJ0vUhLiSBJRhyO
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 03:32:42.7386
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b4a0b19a-6da4-481f-a47c-08de7b31069e
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: AMS1EPF0000004E.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BESP195MB2850
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_193248_866544_3FED85A9 
X-CRM114-Status: GOOD (  14.11  )
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

Add an overlay to use the PEB-AV-15 AV-Adapter. It's a small expansion board
using a Lontium LT8912B DSI->HDMI bridge and a TLV320AIC3007 audio codec.

Signed-off-by: Dominik Haller <d.haller@phytec.de>
---
 arch/arm64/boot/dts/ti/Makefile               |   4 +
 .../ti/k3-am68-phyboard-izar-peb-av-15.dtso   | 192 ++++++++++++++++++
 2 files changed, 196 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am68-phyboard-izar-peb-av-15.dtso

diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
index a188e62e32b4..ae5994818ad2 100644
--- a/arch/arm64/boot/dts/ti/Makefile
+++ b/arch/arm64/boot/dts/ti/Makefile
@@ -135,6 +135,9 @@ dtb-$(CONFIG_ARCH_K3) += k3-am68-phyboard-izar.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am68-phyboard-izar-lvds-ph128800t006.dtb
 k3-am68-phyboard-izar-lvds-ph128800t006-dtbs := k3-am68-phyboard-izar.dtb \
 	k3-am68-phyboard-izar-lvds-ph128800t006.dtbo
+dtb-$(CONFIG_ARCH_K3) += k3-am68-phyboard-izar-peb-av-15.dtb
+k3-am68-phyboard-izar-peb-av-15-dtbs := k3-am68-phyboard-izar.dtb \
+        k3-am68-phyboard-izar-peb-av-15.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am68-sk-base-board.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am68-sk-base-board-pcie1-ep.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-j721s2-common-proc-board.dtb
@@ -323,6 +326,7 @@ dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
 	k3-am642-tqma64xxl-mbax4xxl-wlan.dtb \
 	k3-am67a-kontron-sa67-base-gpios.dtb \
 	k3-am68-phyboard-izar-lvds-ph128800t006.dtb \
+	k3-am68-phyboard-izar-peb-av-15.dtb \
 	k3-am68-sk-base-board-csi2-dual-imx219.dtb \
 	k3-am68-sk-base-board-pcie1-ep.dtb \
 	k3-am69-sk-csi2-dual-imx219.dtb \
diff --git a/arch/arm64/boot/dts/ti/k3-am68-phyboard-izar-peb-av-15.dtso b/arch/arm64/boot/dts/ti/k3-am68-phyboard-izar-peb-av-15.dtso
new file mode 100644
index 000000000000..cb75199c59fe
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am68-phyboard-izar-peb-av-15.dtso
@@ -0,0 +1,192 @@
+// SPDX-License-Identifier: GPL-2.0-only or MIT
+/*
+ * Copyright (C) 2026 PHYTEC Messtechnik GmbH
+ * Author: Dominik Haller <d.haller@phytec.de>
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include "k3-pinctrl.h"
+
+&{/} {
+	audio_refclk1: audio-clock {
+		#clock-cells = <0>;
+		compatible = "fixed-clock";
+		clock-frequency = <19200000>;
+	};
+
+	hdmi: hdmi-connector {
+		compatible = "hdmi-connector";
+		label = "hdmi";
+		type = "a";
+		ddc-i2c-bus = <&main_i2c2>;
+
+		port {
+			hdmi_connector_in: endpoint {
+				remote-endpoint = <&lt8912b_out>;
+			};
+		};
+	};
+
+	reg_audio_3v3: regulator-audio-3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "VCC3V3_AUDIO";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+	};
+
+	reg_audio_1v8: regulator-audio-1v8 {
+		compatible = "regulator-fixed";
+		regulator-name = "VCC1V8_AUDIO";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-always-on;
+	};
+
+	sound {
+		compatible = "simple-audio-card";
+		simple-audio-card,name = "PEB-AV-15";
+		simple-audio-card,widgets =
+			"Headphone", "Headphone Jack",
+			"Microphone", "Mic Jack";
+		simple-audio-card,routing =
+			"Headphone Jack", "HPLOUT",
+			"Headphone Jack", "HPROUT",
+			"MIC3R", "Mic Jack",
+			"Mic Jack", "Mic Bias";
+		simple-audio-card,format = "dsp_b";
+		simple-audio-card,bitclock-inversion;
+		simple-audio-card,bitclock-master = <&link0_codec>;
+		simple-audio-card,frame-master = <&link0_codec>;
+
+		link0_cpu: simple-audio-card,cpu {
+			sound-dai = <&mcasp0>;
+		};
+
+		link0_codec: simple-audio-card,codec {
+			sound-dai = <&audio_codec>;
+			clocks = <&audio_refclk1>;
+		};
+	};
+
+};
+
+&dphy_tx1 {
+        status = "okay";
+};
+
+&dsi1 {
+	status= "okay";
+};
+
+&dsi1_ports {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	port@0 {
+		reg = <0>;
+		dsi1_out: endpoint {
+			remote-endpoint = <&lt8912b_in>;
+		};
+	};
+
+	port@1 {
+		reg = <1>;
+		dsi1_in: endpoint {
+			remote-endpoint = <&dpi3_out>;
+		};
+	};
+};
+
+&dss {
+	status = "okay";
+};
+
+&dss_ports {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        port@3 {
+                reg = <3>;
+                dpi3_out: endpoint {
+                        remote-endpoint = <&dsi1_in>;
+                };
+        };
+};
+
+&mcasp0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&mcasp0_pins>;
+
+	#sound-dai-cells= <0>;
+
+	op-mode = <0>;	/* MCASP_IIS_MODE */
+	tdm-slots = <2>;
+
+	/* 4 serializers */
+	serial-dir = <  /* 0: INACTIVE, 1: TX, 2: RX */
+		2 0 0 1
+		0 0 0 0
+		0 0 0 0
+		0 0 0 0
+	>;
+
+	tx-num-evt = <32>;
+	rx-num-evt = <32>;
+	status = "okay";
+};
+
+&main_i2c2 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	audio_codec: audio-codec@18 {
+		compatible = "ti,tlv320aic3007";
+		reg = <0x18>;
+		#sound-dai-cells= <0>;
+		ai3x-micbias-vg = <2>;
+		AVDD-supply = <&reg_audio_3v3>;
+		IOVDD-supply = <&reg_audio_3v3>;
+		DRVDD-supply = <&reg_audio_3v3>;
+		DVDD-supply = <&reg_audio_1v8>;
+
+	};
+
+	bridge@48 {
+		compatible = "lontium,lt8912b";
+		reg = <0x48>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				lt8912b_in: endpoint {
+					data-lanes = <0 1 2 3>;
+					remote-endpoint = <&dsi1_out>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+				lt8912b_out: endpoint {
+					remote-endpoint = <&hdmi_connector_in>;
+				};
+			};
+		};
+	};
+};
+
+&main_pmx0 {
+	mcasp0_pins: mcasp0-default-pins {
+		pinctrl-single,pins = <
+			J721S2_IOPAD(0x03C, PIN_INPUT, 1) /* (U27) WCLK, MCASP0_AFSX.MCASP0_AFSX */
+			J721S2_IOPAD(0x038, PIN_INPUT, 1) /* (AB28) BCLK, MCASP0_ACLKX.MCASP0_ACLKX */
+			J721S2_IOPAD(0x040, PIN_OUTPUT, 1) /* (AC28) DOUT, MCASP0_AXR0.MCASP0_AXR0 */
+			J721S2_IOPAD(0x07C, PIN_INPUT, 1) /* (T27) DIN, MCASP0_AXR3.MCASP0_AXR3 */
+		>;
+	};
+};
-- 
2.43.0


