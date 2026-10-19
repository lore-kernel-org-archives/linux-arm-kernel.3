Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2AEBCCF2D6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 12:21:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wifqgTMjUpU5OeCwXwTCYb+ig/fEObn40IsJFThxLJM=; b=zd+VHEZlvKxzF6c/GalKk88nOR
	xmiBf8hWtINp/wVCTCKZc6g47edN8AoPgaVCLI4xoVBAInfuQEE33CxEjH8+FV5JJQx5LmgMdXTdT
	1pKpKMeAzQ5cI3tG6IAYl2sIIvpSW5oDp3/sLQlAwzyhWRpiO4oERWtyhnLT2pqUoFS0vDgMngY6J
	pAm8kH9NgmIq2EKtDmgmPZTdMmfyM2JrigVvuD32r26tY6XqMhqXLlFMjnPOq3yuI0nrBgeij3eW0
	lvCTNRVBJDfxCAYvGkdu2gLqgF2+JEJUZ1oyuwGQd8FX5qF50D7abfHSWRoHM0Sb3HaOMC+FSOeMv
	6wZlxt3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xImMm-00000007NHN-3bto;
	Mon, 19 Oct 2026 12:21:24 +0000
Received: from mail-koreacentralazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c40f::6] helo=SEYPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xImMf-00000007NF3-3WMG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 12:21:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f6ZVnTRaOkINVqg6lrBVw7dzIDcDEeVDrnpyk1YEx45qtGmR6uswjC7nmQq9r0JQXMPoMizfcRvY7lkkAfaGnS3McFU2ZMT9qMr7GjavpOgswegQX6OMZRxwxj6xm5VyZNZfhYekImSmek0a/ACo7PKQaI769w9YXuvfV94TeS//aAVjFoqwWmnxtgN8QlvtMvyOkUPt/jTd+P8Ym5h+VQXCxNfRUEm2qzKGtWAZS+ghMeKw7Jyqg6ohUQGfJaB9s5mcJAIxPEgBIeC6BxqCs72+qfjuXkmy5muHdn2KCRGCtE7CB7ORCef2Ue/WL3XQXMB0O+riX74dWlvVRKKxug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wifqgTMjUpU5OeCwXwTCYb+ig/fEObn40IsJFThxLJM=;
 b=khOREtwzrVbHembC50oxBmaVXnDSZjXSrRrUawBxrB3JxMAkUXA+btoUy5tTPBXN+lMI1+ACX1Xp5DXF3qkwdRtsLMpKf4Wr/hzJLdG8m4OYk0VqrgDmw14vGQ0uFmIZXiIQ/dwGY/naBxDEtWR1dgmh/GEccffuXnydtm/3tx/dXVqR0NPfHO843YGBAjHziCC40/qJcuX73otJPhyxBEZI+6jWfAd8NKFVz2t55jdFfurOciBA9u23HkXjaZS9QwbQ1MF3ewfmm2nBeaqK+9ZL+44j0MFMDmSGjgatnoq4af7N803w9iUDDr29ZItXNFoh11BKVl760K5cKNz70w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from PS2PR03CA0011.apcprd03.prod.outlook.com (2603:1096:300:5b::23)
 by KUXPR06MB9177.apcprd06.prod.outlook.com (2603:1096:d10:a2::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Mon, 19 Oct
 2026 12:21:03 +0000
Received: from TY2PEPF0000AB84.apcprd03.prod.outlook.com
 (2603:1096:300:5b:cafe::19) by PS2PR03CA0011.outlook.office365.com
 (2603:1096:300:5b::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.14 via Frontend Transport; Mon,
 19 Oct 2026 12:21:03 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 TY2PEPF0000AB84.mail.protection.outlook.com (10.167.253.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Mon, 19 Oct 2026 12:21:03 +0000
Received: from cix (unknown [172.18.64.61])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 2D9E240920E2;
	Mon, 19 Oct 2026 20:21:01 +0800 (CST)
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
Subject: [PATCH v4 3/4] ASoC: dt-bindings: Add Cadence I2S-MC controller
Date: Mon, 19 Oct 2026 20:20:47 +0800
Message-ID: <20261019122048.1107179-4-joakim.zhang@cixtech.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261019122048.1107179-1-joakim.zhang@cixtech.com>
References: <20261019122048.1107179-1-joakim.zhang@cixtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PEPF0000AB84:EE_|KUXPR06MB9177:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: ecaa8bb9-c569-4e3b-47e6-08df2ddb717f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|36860700016|82310400026|1800799024|376014|7416014|6133799003|18002099003|22082099003|3023799007|10067099003|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info: ST7AhND6+xpFgTPX6biXCfi2HiNYXwWdPXiQO1XP1DcMs2qtJlemzJBXEUrfwp9MwAeKJV86eChALfs0b+sLmEEHuf3pIzoGfOeroks7eK2psZfBL1KzFSgjZOz1XE4duXFPwEuOW6KeacZpnej8FI7zSCc/WI/mLpd4q8Q4EnsHE76bPu2iFawpz3A8jXSPoKL6GcY4I3h/+hOx9ccA2X8YUg4qDFGFrtVvlokT3mwNExyjQA0pnHf5JWHzVlrzOUtSg7GaMoOrCkzA1VMnB8f7klJ96AMPgzQpaYSbe0PNFw0VnJ82MpslhOnXLW4IuiRRxUDQK8NeAbGe7EkSXI+REf6OoKaThmXBSIRzDURmscw35ODUiuVgigQwgAW4sbGqQ3hZY0EPcF+QXDfipYPxRc4lR5QHEDrqrW+PvaGfGH6uAyUlG0KZ4M6tTAxdnn/hYa61MHFNN5xnssRLLrI3Y5TXBuzGHUF0YkOeywizn74Ph0/4CYnc2YkWNrMgoNMDkBD5wcsFeiFNw/fma8/9bHbcYtKdWKZrRV6HyfHgEt/mnXdSjEDjF4uDs+3V4mW2OH5jNasiaFUM96pDc55VePAixnWpTPRLY6FdonptpyK2dNpaF4/Rem+9Bz8fkeNhlMpIJHaZOvW/kE2KAA==
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(82310400026)(1800799024)(376014)(7416014)(6133799003)(18002099003)(22082099003)(3023799007)(10067099003)(261009223027099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: mZQfxfE7Jx7i70/YBtlTiPJCqmyqwlAkPm27KhKGutgpL15mFo1JRC5EW2EYU2+aCk6oESYLjysfivBzehYHmLVvBIwxIq/Ipxtd1AtXULU6BstmFuXF8MSfrSpVq5xr9obDrTjGxCBmRx+a6fWe5AhQnnP7OGb/BYGIlGoNhQGtNDaJccVjEfyvDAl40UlIEsZObK9wXvlrKn97J2ky8Qixktdy+cWQgb5JW5e7qxxK3vWBipzoMcw7urU2gtUiANwwEaScBrKvFCPlEoXtPS2FoJu6LK0hrDZkR8ld0Z30714bsf3qvvoL7+EUt8eOXuespSjtKHbRVIYtjWLOhuxDtKURjJ5K+7YDwCtiulaSA8XQLq6CGggURNhb6tdWwPHMg0aQfYqLtsDvM2V6TCPkCYK92VtFwu6/NZgr01vNQr4ALl0SiqOA7K2i3MHo
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2026 12:21:03.2566
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ecaa8bb9-c569-4e3b-47e6-08df2ddb717f
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: TY2PEPF0000AB84.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KUXPR06MB9177
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_052117_920695_CC0BD79A 
X-CRM114-Status: GOOD (  13.86  )
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
 .../bindings/sound/cix,sky1-i2s-mc.yaml       | 119 ++++++++++++++++++
 1 file changed, 119 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/cix,sky1-i2s-mc.yaml

diff --git a/Documentation/devicetree/bindings/sound/cix,sky1-i2s-mc.yaml b/Documentation/devicetree/bindings/sound/cix,sky1-i2s-mc.yaml
new file mode 100644
index 000000000000..e750009edbdb
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/cix,sky1-i2s-mc.yaml
@@ -0,0 +1,119 @@
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
+    items:
+      - enum: [ tx, rx ]
+      - const: rx
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


