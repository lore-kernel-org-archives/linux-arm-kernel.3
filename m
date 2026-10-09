Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66E97CA6012
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 09:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TSfAUCc+8DHmKEG7UeOyflINpCAXvIE8EIpJ1qm9Sys=; b=h67ldGn1KqN/lHmkMRwWICr6QM
	ef5EHjeFwG5rS553fPwSk0lO0l5yWY71Leq4z8qkWu79zSbM2SapLcHDZXlL83nxGH1M97LbaQecV
	xFgJ6Ik8aDQPE92pIAHSTHb3ZyF0qC2bHfHQ4e4teWVqDZSNcpzzEqYcQE1krujRIq4xdR5dl20tR
	OYio9+KzA5B0lxfc4xQbIstgE3gFZzdHRk+eFwX5naUl2LkbUtTLw1GXtnuKhdXvN8cJYdK9C3Kua
	qwwu2QmSSwv4g3LWGMOQI8c+8mkvGpNiTq7Okdo/4ebmSiIN3Ylbqp7M3/Nmth0OUBxDlLTD3PFiV
	4j99LomA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF6rj-00000005uXz-20NG;
	Fri, 09 Oct 2026 09:26:11 +0000
Received: from mail-japaneastazon11022138.outbound.protection.outlook.com ([52.101.126.138] helo=TYPPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF6rf-00000005uWM-45jH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 09:26:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a2nW+qvL7qyAutpbPSmCzz8hHJ24NX2AONE8iSCURgKtR5QmInIP9/FZml/jSuUrbs22ZOowjF4uCKLnXqfeN+x8AeFktVZXjR/dsO3D327li56NRgBIajL4AFF9WCCyV1yghA3C3g+ayR5jf72WGhGj/z5FcAThwBBFh37U7gbOEqxKSM/wNp9l7EkcGG+MIURS9vmIk37HJGWhXbsG88+D47Dp4n59er5zf32jqbTOoFXvp4yEfbkwVNoM2uLE1nqo9a0httZAdyUHzm8STag/UTiaMYusaaEAUEnzICCMnlx5RUF8zdMTsm1EO0diEhWCbsD+RGjzFhVApDP24Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TSfAUCc+8DHmKEG7UeOyflINpCAXvIE8EIpJ1qm9Sys=;
 b=xcHxgN5k6N9XpKkbmFx8xJPntv/Hx44YkS8wrl8vLODoXHhkRLx5SLVkyVqU8m9bek8p0YHPpsetptPJZb0F1bLiojd0isE7mYc0508BgXsbuC4x0sIlNIRAtmBxyIvrdBAP4mpuvj/nRRZ1JHFuR0KzfEzhgU9TNf+H8wtCRFwp2x0bbOFobcTjcNSAHQZ5ORPMz9IV319ri0pC3/GHhVA8zOF9Xj2noh1cdbcFIJp1M1BVuOt0sm5sBWF+VddGRd/kzGWalVTq2UmUZiXFjp2Dq+JB6tOH48vNrtDVIXqIN1YqNOuwiEI8WnrIau4lxaJjhteqqJurjw8z0iGfNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI2PR06CA0008.apcprd06.prod.outlook.com (2603:1096:4:186::23)
 by SEZPR06MB5365.apcprd06.prod.outlook.com (2603:1096:101:7d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.16; Fri, 9 Oct
 2026 09:26:01 +0000
Received: from SG2PEPF000B66D0.apcprd03.prod.outlook.com
 (2603:1096:4:186:cafe::4b) by SI2PR06CA0008.outlook.office365.com
 (2603:1096:4:186::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Fri, 9
 Oct 2026 09:26:01 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG2PEPF000B66D0.mail.protection.outlook.com (10.167.240.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Fri, 9 Oct 2026 09:26:00 +0000
Received: from cix (unknown [172.18.64.61])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id BC62340920F2;
	Fri,  9 Oct 2026 17:25:59 +0800 (CST)
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
Subject: [PATCH v3 3/4] ASoC: dt-bindings: Add Cadence I2S-MC controller
Date: Fri,  9 Oct 2026 17:25:51 +0800
Message-ID: <20261009092552.2377960-4-joakim.zhang@cixtech.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261009092552.2377960-1-joakim.zhang@cixtech.com>
References: <20261009092552.2377960-1-joakim.zhang@cixtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66D0:EE_|SEZPR06MB5365:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: dbba321f-5ab1-45f1-93a7-08df25e75556
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|36860700016|82310400026|23010399003|6133799003|18002099003|10067099003|3023799007|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info: WBs1ceG0ZUYryAk2OLc5WTaYDyzbmnRu26zY+oWoYdgNvhxgW6HOGsXyMdiZiU/r4m6uON0hwJizRGorO/2GYlfpjJYdxCFmds0Q5Sof3qCc5KWnZ/4Y8t1PZfJJesryYNGdDpEIxWrOHZHkvZHyTROzbUsbB8DHgGCOgJOd/dx81hqLVt8NQpWWHS/RHSXmoG54m2ZENkqsH6/l50dsOklAy7qYH4gsDQlX6lKLDcgzH4a7L21qYSFHIyB3X1zZF6AK1KWE3VKdppcmoFd9XcQIC6cchD5jNkCQqrxp4UlKKRKa8UBWzysvKBXIo2zf6BT5+xII9HJ6La2Ltf0KzNYMSWjU6P2BWXTZcf7BBps8BOx6E6b1lrrGrNpMO4/uym4oevpwPBtkVIToNpPVswVdui2r1WZT5fId718P9/J8aGLfpYIG7pLe9QchHpOGAJkOFw/nG7lWMKYpzKKLpJe6zO5BeGyB4SlKQakSLI4RTlC1PvJfpxyQT+Zq9WIHQp1RFwvDe3TCIpVqdFiiz1R0Qz21k5636NTNm5nvoIbxCVHc85gluDkYph7fs81dbnJ7Z3XEpY6G15VHUk0jrguYb1og06TBSvT/QTV9iaPNrZpayv4+EllRII6nxjX6Z9aHbPjb4jaYqCcvbfWnTQ==
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(36860700016)(82310400026)(23010399003)(6133799003)(18002099003)(10067099003)(3023799007)(22082099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: f8EkEaPF3Qc5ztei8qP1SStWkTFgC9xqeroeWqbvpMRYNDdZwTmPP4kmQIjAHMHCvgER+LXny7fY59meRCdZhTO5S/R7YT0j/em0lNhQCgTtIsU3hAoJBJ/kWjsaVIoVKnJ28aei3SHmLAXiQIp1oE+xAV4cG5f6J3TRekOPy/tboclFCVF1oy8MOTtQeqqwUYj+4D72hoJ5AdESVC2O3kJ3pKcv2ZUwiSDp06DlDyOH4l8dN65cJrGJi1tPYJEYrEUqm8p98K75MVgN90ZAdP5vS8yzSjD44fUxavgIlGnBAM3qfawOg9UWn92Ojlv8qrgQhUejffmUiA0MgReZfhh2q3TkGiR0fQEQ3O2M5ZNnaNS2usI7P7nt5gJpb6QHBzm62J9ONGSvV4AO99gzg3lIzZQKT07jBMDaRdOV0K2iCrbOW5sTRgwP4AMEZtPW
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2026 09:26:00.7260
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dbba321f-5ab1-45f1-93a7-08df25e75556
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: SG2PEPF000B66D0.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB5365
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_022608_325211_DB355B07 
X-CRM114-Status: GOOD (  14.20  )
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


