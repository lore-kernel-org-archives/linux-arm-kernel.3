Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF12DC9833E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 05:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TSfAUCc+8DHmKEG7UeOyflINpCAXvIE8EIpJ1qm9Sys=; b=n+pykIRf3qhKd7jSZR7a0WNpta
	UN8jeYzQeD9NBpi0b4WOmy4ahP6RfcESui6MseETaHYeaHi0nb6Hrq4loY8yIcSdbuI04F9rYQQlc
	yyBC3zeArTp3g2tp/CQ7a9cf63E/U/Fx7kWxhuoI6pqpiRqoWj6li4fwIR7Jj7Uwxp0J/uE/81MAB
	GDVTcuOQWloFROKjt44cdTw22EDx0mDlaJeudoVLCeHsJHR+KeqpXSM90cVPXdY446zc5x3KVV6lt
	xdIEZIO/H0JyY9YXVFiJmxAg1S5FNthS8v0ujVut6E7KZKG2NwJebPyhyBe65VlECLlFaFp5XfuJ8
	XxMd4f+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB42k-0000000HNId-1vSy;
	Mon, 28 Sep 2026 05:36:50 +0000
Received: from mail-japaneastazon11022118.outbound.protection.outlook.com ([52.101.126.118] helo=TYPPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB42a-0000000HNEY-0V9R
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 05:36:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TCVQ3JwsSlxGmHgk572lCAWp38ODcgAy5EfLjnns6P2epynDcGYdm7RMkj7kh6ivIjONuEoRoPnr1+27dVNWpFflNtsZ8KQhAWINSPYaaek/4C92XyhL/NWpHgzf9uD9DlJ9GiIcOx5Tf0bHOXTHZsxU1usdom7KnAC+HRgI0H4XQhRZLWKJnHwnoVo59R6ULDzEg33iS2LEt9J6eVS7MwytJWpGH0UiIwYdOyTSWpR3EDj6uHhNgWa3Hoq5mrq1EcX2K7kas0BiR+xz6t5ZNJL0sn7+XgtfxNmreajnfXddw5cN4BB3NFKIZkyHWa3xAZ7nERxWj9zXcC7/Rj8C/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TSfAUCc+8DHmKEG7UeOyflINpCAXvIE8EIpJ1qm9Sys=;
 b=T1wFYtxsArC9qO39tppVKAnula+U+3eU7H05OYa1NZ9bQRSeiPwGcjWUCwO4SYtYohEg1KI1FpwzaPGKA7PERBJFve7FCet3yCOowlfKLH2aK37FxiZg4facN2uAF++a/3KUnKgy2/tzyBEvAIGNJq0S4nR5F8BiiwRVEirEi2NvBbu3biTxAL1VZw9Oc5LtFzZk5sENjRq3hktehHh2QO6/nq6QDvRSb8R035/q51pEcziEISWpYMk1q3YBDTD0X0QzwnhiZuUW+sqn1Xbv+1O0ro9vBlTptj+/ikUG0RhVkRFZ+4oIeD5xFGVG/n0f+SkBJW4LSIGGcP0UVupxVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from PS2PR01CA0057.apcprd01.prod.exchangelabs.com
 (2603:1096:300:57::21) by KUYPR06MB9182.apcprd06.prod.outlook.com
 (2603:1096:d10:94::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.23; Mon, 28 Sep
 2026 05:36:31 +0000
Received: from TY2PEPF0000AB88.apcprd03.prod.outlook.com
 (2603:1096:300:57:cafe::a) by PS2PR01CA0057.outlook.office365.com
 (2603:1096:300:57::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.23 via Frontend Transport; Mon,
 28 Sep 2026 05:36:30 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 TY2PEPF0000AB88.mail.protection.outlook.com (10.167.253.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Mon, 28 Sep 2026 05:36:30 +0000
Received: from cix (unknown [172.18.64.61])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 98ABF40920E2;
	Mon, 28 Sep 2026 13:36:29 +0800 (CST)
From: joakim.zhang@cixtech.com
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	p.zabel@pengutronix.de
Cc: cix-kernel-upstream@cixtech.com,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Joakim Zhang <joakim.zhang@cixtech.com>
Subject: [PATCH v2 3/4] ASoC: dt-bindings: Add Cadence I2S-MC controller
Date: Mon, 28 Sep 2026 13:36:12 +0800
Message-ID: <20260928053613.2158446-4-joakim.zhang@cixtech.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260928053613.2158446-1-joakim.zhang@cixtech.com>
References: <20260928053613.2158446-1-joakim.zhang@cixtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PEPF0000AB88:EE_|KUYPR06MB9182:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 4fe26d98-f62e-48fc-59aa-08df1d227337
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|36860700016|1800799024|7416014|376014|82310400026|56012099006|10067099003|18002099003|22082099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info: Dhh47N/CT06uFJSU1kHF4X6xJdjQp0p/5CtdBFBGBaI633uRgZ+FU9JoacQYemHJOwOkjJIxEJznof1wGjpCBvcnYbQFuDXXzA6KhLMU3uvcIMQ4hvgcLH14dQNp0roX0MNNlqRs1PR0/aCQALKaUeIORO8pMHItYBytBRPlQfcC+STdftARMaz+MfmbqSGNXEE9ENBnT8KjwFJgGrFOjrLSa+GzChObAJ1KPPbJWVmnFJTOdFZOUQ560d22jKQmPoGTKwjGDJa5jT1nY5t7h7u5OM2nusFdlwhHt2J6eEL1XbCxLZ/ESmWjateecFGtnHVVdrsg0b4O+cNnPJst2gXGznumprazCELpNYUCcDBoBKENYm3tPEFJkWuyS3RXWBQyrAI2UjIy5ClS9u84Kfi0vTjSjwJ7hP+9U+4sHfRztykWv/IqwdH6blc4x5rkB8klV/75GwlAMJ66UItDQnF0+1Bl+eprOlhsyDeRgEP/vBPYGoa/86nCV0e3gbUliHYe+WfIUzIPwHw30PkIqjzhPwEpsMCuSEpi1Yxd4xhQsdsA+Wsx4jM9I1/BJLfeUBRC/af3rm7dKex5KIz7e842bFT7jN76hOSSxgPLF19uTd6ue38wH9voFE9Mgrmf5hwmdy9FHdKP9RucHZy8Zg==
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(1800799024)(7416014)(376014)(82310400026)(56012099006)(10067099003)(18002099003)(22082099003)(6133799003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: kynyvDfKzM81+AouJN0VFXYB5nSi/l8DNAZ5dS+BqL2oxoNqpre9bY5tOAM+S3nfX/5g1/MS/0VsFitxyScKKiUAXCiPA+b+1LdQkiCDQrVKHnIDnX1woMr9voCCsh29k/E6yTX7qjQKISk8qqrofTbqsshruYHmur2BWvlai63R4rm48bvmrqObed9kaKsRrVl1Z9IVqQzA3OKis+PlVtUHOtv64a5ISMZkxMdpet6pheNwE9A1nujTeLouI4znFIKjcU/5FVo8KXdZhJwAX3kzzoEpoGlXPs02cocf8W/e21wh3mIaGizmeBYN1ahXxTWX8ZnPPWZyjJNQFGsU9PLz2MX0HfHkdp01bNIkUSl7f50BHUA4hzmkvPTbBl0uMpLMvdvZ/uYYoL1AH2H/w4KohmCGK1lWgVWHHjzvf/LNC4+M0hWvt7noapkoui/W
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 05:36:30.6900
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fe26d98-f62e-48fc-59aa-08df1d227337
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: TY2PEPF0000AB88.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KUYPR06MB9182
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260927_223640_172656_A3CBD48A 
X-CRM114-Status: GOOD (  13.96  )
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

From: Joakim Zhang <joakim.zhang@cixtech.com>

Add the DT binding for the Cadence I2S-MC multi-channel controller
integrated in the CIX SKY1 audio subsystem. The controller exposes a
transmit DAI and a receive DAI and moves audio through a configurable
set of its 8 data pins. Which pins are wired out and in which
direction is fixed by the board design and described by the
cix,pin-out-num, cix,pin-rx-mask and cix,pin-tx-mask properties.

Signed-off-by: Joakim Zhang <joakim.zhang@cixtech.com>
---
 .../bindings/sound/cix,sky1-i2s-mc.yaml       | 123 ++++++++++++++++++
 1 file changed, 123 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/cix,sky1-i2s-mc.yaml

diff --git a/Documentation/devicetree/bindings/sound/cix,sky1-i2s-mc.yaml b/Documentation/devicetree/bindings/sound/cix,sky1-i2s-mc.yaml
new file mode 100644
index 000000000000..22528bb2940e
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/cix,sky1-i2s-mc.yaml
@@ -0,0 +1,123 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/cix,sky1-i2s-mc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Cadence I2S-MC controller
+
+maintainers:
+  - Joakim Zhang <joakim.zhang@cixtech.com>
+
+description: |
+  The Cadence I2S-MC multi-channel controller integrated in the CIX SKY1
+  audio subsystem. It provides up to 8-channel playback and capture through
+  a configurable number of I2S data pins, and exposes two DAIs: a transmit
+  DAI and a receive DAI.
+
+allOf:
+  - $ref: dai-common.yaml#
+
+properties:
+  compatible:
+    const: cix,sky1-i2s-mc
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 4
+
+  clock-names:
+    items:
+      - const: hst
+      - const: i2s
+      - const: audio-clk0
+      - const: audio-clk2
+
+  resets:
+    maxItems: 1
+
+  dmas:
+    minItems: 1
+    maxItems: 2
+    description:
+      One DMA channel for instances wired for a single direction, either
+      "tx" or "rx", or two channels for both transmit and receive.
+
+  dma-names:
+    minItems: 1
+    maxItems: 2
+    items:
+      enum: [ tx, rx ]
+
+  "#sound-dai-cells":
+    const: 1
+    description:
+      Cell selects the DAI, 0 for the transmit DAI (i2s-mc-aif1) and
+      1 for the receive DAI (i2s-mc-aif2).
+
+  cix,pin-out-num:
+    $ref: /schemas/types.yaml#/definitions/uint8
+    minimum: 1
+    maximum: 8
+    description:
+      Number of I2S data output pins wired on this instance. Which of
+      the 8 controller data pins are wired out is fixed by the board
+      design and can be any subset.
+
+  cix,pin-rx-mask:
+    $ref: /schemas/types.yaml#/definitions/uint8
+    description:
+      Bit mask of I2S data pins used for capture, bit N selects data
+      pin N.
+
+  cix,pin-tx-mask:
+    $ref: /schemas/types.yaml#/definitions/uint8
+    description:
+      Bit mask of I2S data pins used for playback, bit N selects data
+      pin N. The rx and tx masks must not overlap, and the number of
+      set bits must not exceed cix,pin-out-num.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - resets
+  - dmas
+  - dma-names
+  - "#sound-dai-cells"
+  - cix,pin-out-num
+  - cix,pin-rx-mask
+  - cix,pin-tx-mask
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    audss_dmac: dma-controller {
+        #dma-cells = <1>;
+    };
+
+    i2s@7050000 {
+        compatible = "cix,sky1-i2s-mc";
+        reg = <0x7050000 0x10000>;
+        interrupts = <GIC_SPI 222 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&audss_cru 17>, <&audss_cru 27>,
+                 <&scmi_clk 100>, <&scmi_clk 101>;
+        clock-names = "hst", "i2s", "audio-clk0", "audio-clk2";
+        resets = <&audss_cru 1>;
+        dmas = <&audss_dmac 2>, <&audss_dmac 3>;
+        dma-names = "tx", "rx";
+        #sound-dai-cells = <1>;
+        cix,pin-out-num = /bits/ 8 <2>;
+        cix,pin-rx-mask = /bits/ 8 <0x1>;
+        cix,pin-tx-mask = /bits/ 8 <0x2>;
+    };
-- 
2.50.1


