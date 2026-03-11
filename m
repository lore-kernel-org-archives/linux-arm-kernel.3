Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F5DE103E2F4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 23:49:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rr33OtzLWS2/+XmntXKGBs3voY8lvtgUV8Ue9ndTRkM=; b=Y0QLA0ii7N7IHn4wrtleOybbWe
	sGfHqiYS7I4JP1URne0rj90kUB95zwaOpH8tWTMxOTy7aAelobEwJ13gbaJYeEPU/on5s3Fo/Q7av
	41wFuLsvfctxzxPmpemvFqyKTPCmOUaFobdBpRVpwVbMcSschbGkG/KiXS9aX8BFnccHuui/jAzjr
	Q7Q5+HHViORVHTyemiQg27Oj08fNkH4xqMTdXKSFmnuTOdmfRj7P7AiGowgIA8+YrKypaX7hsApb3
	xmk13CoDrIMmORe4aVpfuOjlRFmoGmCBdqcTNA39qq+cDXJqaw2lyY42L1AThaech/5NtrcrPPOkG
	WrfFHsVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0TIx-0000000Crqv-2g6I;
	Wed, 11 Mar 2026 23:49:31 +0000
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0TIq-0000000CrmL-1qlj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 23:49:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GlKNDBTm/M/AyWdE2ivGItbyqh4tGwKjOdhiUaGj4nGRRINXwGzSLjDQ8a1/J6HVbqiDw/FWSF8sxYY+qY5/mnwGVgmKLDDwhr9yd1oPo/qmvpeO68f6hQbBuAa8+rCuLfi/n/cKmCg+rfNi50iNnSLq2Jns89+bLkDcqsReNvF/u98yDaU/ZUmdQw+lRILYDHiV6/CBlYeR35UafyTsd1MOZcLXjJxuXNqP7YbJzeT1pc6ODX4ALLxJmTEgOHw7AT9KU9X09o4eZMuvZSN1hlTghiHDfVkFRPQ1jwpcO6eo9Agc6iJdh4OdeyDbuZvRt1G9pF3GoCEUQXjkI2eouA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rr33OtzLWS2/+XmntXKGBs3voY8lvtgUV8Ue9ndTRkM=;
 b=vWFiLZhA9diFc6pUro7l5GnZ9YPMpHKVHY0BBLFDKTlYBsB3YdfUrm7Nk28yynkfid+ORmGiML04xSICGEtTj074vrGjihvU1YcEQs91Tvgvje3ulLata89p1uAZB9jRNAxPEl5/9BtdrK+pSaosblzYC8uSJ6D81hdds6YgNc3L15pTh+r3taWK5xk3JKYEQaVdZWKcTWrUa39GTJ8Sjon1AkDCIY0iJC69ZFnALRa8m65vmraLrAO+YZgdypOA6CqfLx7AZN+KSR/+FsZqCwrU8rQc8Scg92tW2er2/FxkyJVEz2hwZdh6GYc6rg0ypz0c5oR6ZGRoIrpxvKvfxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=ti.com smtp.mailfrom=phytec.de; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine header.from=phytec.de;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rr33OtzLWS2/+XmntXKGBs3voY8lvtgUV8Ue9ndTRkM=;
 b=TApU6XjQ/ztc0ndb8QmWkzdGrm2Ohbq/KEbqGong4IUXsHVjyNEdcb6XsqT0dTG/MLZcn6HlZ5ajcV+/rftEybycLgluF7/a0Um+c0Xq2G2QS9gPNNxsSqW88mwIwqmlIERYHx8BUJ14kjs934SH863HE/XS3MkVZEZyWo4y/Rzv6bv5NHR+TBAPFia/Blqfq01qcQEpcsi1WVFKjh7YPa5GSaYJmtie8Oo4JRGzClCKQcHdo86wL+a5MMcz/uG66kIUeKA3skTJFtuokh5Qtjxch/Ga8FG6ZFsVkIz+9azxfnaWFCiAa2ueNpqMG/GrGV+FVQ4AOGuVYwDSSPsHbg==
Received: from AS4P190CA0001.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:5de::7)
 by PA1P195MB3070.EURP195.PROD.OUTLOOK.COM (2603:10a6:102:4fe::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Wed, 11 Mar
 2026 23:49:18 +0000
Received: from AM4PEPF00025F9A.EURPRD83.prod.outlook.com
 (2603:10a6:20b:5de:cafe::6d) by AS4P190CA0001.outlook.office365.com
 (2603:10a6:20b:5de::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.27 via Frontend Transport; Wed,
 11 Mar 2026 23:49:20 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Postix.phytec.de (91.26.50.189) by
 AM4PEPF00025F9A.mail.protection.outlook.com (10.167.16.9) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.1 via Frontend Transport; Wed, 11 Mar 2026 23:49:18 +0000
Received: from lws-haller-privat.phytec.de (172.25.39.212) by Postix.phytec.de
 (172.25.0.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Thu, 12 Mar
 2026 00:49:16 +0100
From: Dominik Haller <d.haller@phytec.de>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, "Tero
 Kristo" <kristo@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <upstream@lists.phytec.de>, "Dominik
 Haller" <d.haller@phytec.de>
Subject: [PATCH v3 5/5] arm64: dts: ti: k3-am68-phyboard-izar: Add PEB-AV-15 overlay
Date: Wed, 11 Mar 2026 16:48:41 -0700
Message-ID: <20260311234844.56443-6-d.haller@phytec.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260311234844.56443-1-d.haller@phytec.de>
References: <20260311234844.56443-1-d.haller@phytec.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.25.39.212]
X-ClientProxiedBy: Postix.phytec.de (172.25.0.11) To Postix.phytec.de
 (172.25.0.11)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00025F9A:EE_|PA1P195MB3070:EE_
X-MS-Office365-Filtering-Correlation-Id: a6cdbe51-dfe4-4eb1-a99d-08de7fc8cf97
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700016|376014|1800799024|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: bRq9jG6+DgmXFDSksB/N/5zY+hKwXPbyqTAHJ1pijWsLtvqbmEgz7ivQKcuO86hJ0yvM+IbGvrma4DbV8cCPy19P9lzDV4hjMZiXzTtAdgjAdG+9C1ppCteevU6hNeKU/gLv3bnhZjYFMEVsbXuNAkzm7BS1ZzptlizIjeKM9fwPzZHlPF9shn7k/nWq/sMSx9M7dydSHY/L3tdvABuAYn3JGVC+dzVw33C3J26yugRfdYJWu/t+ACkPeQINMrFBQlgCystSlxKr6ZOp8UouaDdx85TPx9Evs6PnqsIfgx9Ul2x0ZzG7xMueA2QUfB75RxXnhWxDWNBdBQyzkj8iaTGz0HUF4j0PEO4KXsiJ7KT+3y81alGCJ24A6JKt7gAvF7kO6wjr5vCqGxtTVshZG5LH7D5pwnBkELzvrmjdvU96/djw7edM82GeW3JBbmueOxK9Q2aPxpb3eo+E02KfFu9+G221yvZ+Jxmm3vQGTFDjQ0/vk6cVktHANKtPnMZmjtdEyckhuFrOuVI4j+TiZb+bUW/yIAhW6yfttXFjPOVm1GfCFG/tShw3W0TErDXLyodD8TrrI5hRkrxQ4oaMWrCSQYbUtbp928iQYkoluWo7dMvCX6tORBfvjqL2xi5UzXR1gtnXeuvOpyLG0wq7OvAS3JSqu+8+spc9vE33I6zOb+erwOwqi9Sy7xJTE3fvbzopKjDtX1A/CaIdWv0/qP4O/LfbjpufQjrk+hL0x8knWKd4OWKmauJCT9EBNfF7TaI7gJmcahI/wa0sHXgqzA==
X-Forefront-Antispam-Report: CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Postix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(1800799024)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: t4QhLk7d4p688NyR7RixT2zZrxDijn7ie9xevvJ5BrZMDTfWqCOh9Sd53Ec4xftkBPO6lvGS1AcHwwLK1wGZei5u0CW2v0dxgtwpDMkhvAuEQ4gomn5vFNHm7bDy2XsbVI7H6/4aBpuiiwdqqlpJ91nc4iL33LW3nBQnfJZc7ZkNWTwdoiHQzBGKToUdJDX+n6JVZNGl+4aqXbExZm4XuGjLSUnXznek48qAyxgAIIIl0GQ5hgvKeKrZdVUpOdYr4LDM30diRElfylosY6b50htz5ofR8qNHyKY6xmdtszGHZZ1ToSGnXFQ7fnrPI6QnrMajpYW1XD1xWxECIvVxgOhE0ogv3lBsYkRIXlNZ2b9CFPmRQqM+7kdPNGsg72l0WOIFBkYsN1VfyUYJGwDcdMwjwRne4+2BtEH9IgEmdaCDs/PvoAZf+dP9CEJwPIRW
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2026 23:49:18.5749
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a6cdbe51-dfe4-4eb1-a99d-08de7fc8cf97
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: AM4PEPF00025F9A.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1P195MB3070
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_164924_483475_361280A0 
X-CRM114-Status: GOOD (  15.45  )
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
index 000000000000..a86971fcdee1
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am68-phyboard-izar-peb-av-15.dtso
@@ -0,0 +1,192 @@
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
+#include "k3-pinctrl.h"
+
+&{/} {
+	audio_refclk1: audio-clock {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
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
+	status = "okay";
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
+	#sound-dai-cells = <0>;
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
+			J721S2_IOPAD(0x03c, PIN_INPUT, 1) /* (U27) WCLK, MCASP0_AFSX.MCASP0_AFSX */
+			J721S2_IOPAD(0x038, PIN_INPUT, 1) /* (AB28) BCLK, MCASP0_ACLKX.MCASP0_ACLKX */
+			J721S2_IOPAD(0x040, PIN_OUTPUT, 1) /* (AC28) DOUT, MCASP0_AXR0.MCASP0_AXR0 */
+			J721S2_IOPAD(0x07c, PIN_INPUT, 1) /* (T27) DIN, MCASP0_AXR3.MCASP0_AXR3 */
+		>;
+	};
+};
-- 
2.43.0


