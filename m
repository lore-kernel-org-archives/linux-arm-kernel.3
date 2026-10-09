Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 768B3CA6012
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 09:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v2o3tC8S8FaiUOJP7MVA4jQYf4M7+FC9FY1lAyKjGJ4=; b=cqKOBVO+1ZMfNLbPLnr8QQTT9K
	EMhlWb80FY8flCgLGZ1QF0pIweqPCNjyjRy5M1KPgWwvre6rU5eBrcMZ0ffGlVxCnLbyiNhPphh8C
	FKk9RAVnIfRCAOO1tCMyP+0Ks7hZgJicoTZl51pJvlpZ1n3UCyvrqD/jZUWmmE6l2c9WCZ6/ry17D
	5CKZfS97KgdTD6GONjxp54skmo4uvugWDyg1Wy+aVVW54suIRv1qVGiydsnZB7cLkuqKKaUPfIF5B
	e5kIKNoMIqA+fO6EBAiB5eI8MUs2xITwMrVz8io8NnL3CvZoOT/6jNH6uO/IsYzcyGZ91iTtunZyC
	gcy9dbeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF6ry-00000005uhL-334d;
	Fri, 09 Oct 2026 09:26:26 +0000
Received: from mail-japaneastazon11023133.outbound.protection.outlook.com ([52.101.127.133] helo=TYDPR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF6rt-00000005ucW-1dXy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 09:26:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RSVe1xZgnIwQUub1ON/IBfa9yPbgml9gp8siiAxN9F1jJD7pGV8RgW7bjhi5aSytDMEptb0tqeA+r68y8kOFGDxQO/cJA+oCLQa3SiFjgI9yJMeIvfIn0P8hjOlsK/hrMA5sWPcbn36luQ8PPE1Wwe7/b5e7bZrQ5pxIpdlAjKmaM+hgqwAGtLo3peW8kHqAuEq5dc87yNNZE6rIkrXBnp+Qf/2Eh2hUDokGDfWxsneSAazV5CH65vTqStq1gC3e3sYVTiTWFWK3HO3ulRJ0bvj7ISMAHEtWrz0CO37kbNNrdcuZJ9TWGCdm+bFnL+kmu6/RYyoYiNkecsgohvLCMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v2o3tC8S8FaiUOJP7MVA4jQYf4M7+FC9FY1lAyKjGJ4=;
 b=fxRXjaK6+XCaTbb3tIzNAbYObZBPojJ+fnZPdaRGxl2lbrcqmDfs/xZ72CSy6R1nFA83aAJ1DO4pEf/5uGzRKHg8+uNtfNwWT22WIwInqxljtHC9NSfngVNnS9F3omcH8oso+wU8pHPmDXYic1Yk/IpZVe2TlK6h/sWDMW0JUx19cZ9eT3WBexRHtbcit5ZHfkCAzFceBdwoEWON7qMG6zcPvdg42l4ROxTGtdmWOz0wAbuJDGg+luOzT3egHM9mxPkqB6Kugg/zT4PIWrxH0fzhTVnY1gxskU/SrBJdLJlSzM6YkSaR5qoF+cq3GJThFDy0rEZdeSQdyzCAbjQi+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from MEWPR01CA0160.ausprd01.prod.outlook.com (2603:10c6:220:1d9::10)
 by TYZPR06MB5736.apcprd06.prod.outlook.com (2603:1096:400:26b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.15; Fri, 9 Oct
 2026 09:26:03 +0000
Received: from OSA0EPF000000CD.apcprd02.prod.outlook.com
 (2603:10c6:220:1d9:cafe::a) by MEWPR01CA0160.outlook.office365.com
 (2603:10c6:220:1d9::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Fri, 9
 Oct 2026 09:26:00 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 OSA0EPF000000CD.mail.protection.outlook.com (10.167.240.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Fri, 9 Oct 2026 09:26:00 +0000
Received: from cix (unknown [172.18.64.61])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id DE23A4091E04;
	Fri,  9 Oct 2026 17:25:58 +0800 (CST)
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
Subject: [PATCH v3 1/4] ASoC: dt-bindings: Add Cadence I2S-SC controller
Date: Fri,  9 Oct 2026 17:25:49 +0800
Message-ID: <20261009092552.2377960-2-joakim.zhang@cixtech.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261009092552.2377960-1-joakim.zhang@cixtech.com>
References: <20261009092552.2377960-1-joakim.zhang@cixtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSA0EPF000000CD:EE_|TYZPR06MB5736:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 00f192fb-e6ea-4a40-ce0f-08df25e75506
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|36860700016|376014|82310400026|23010399003|1800799024|18002099003|22082099003|3023799007|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info: ALGKKfpVeSqVhUK3vXm4R1EB1t/IMQqg+tpSDTfKi5BrByxoXffLBykPQLiKmDqk2t4Zsl59yLGu03Oyzp9MfD+TyZVws5z8oSM76zVzg5tdLJfeS40MOXEUvuMQj71GV4iZEzNDAWg20ay7A0LosgbXLToEnImv3ubYlcez50XhaMyQyvdmIuSbiUiT4Sf92nhV9ugLNEVIg5w1K+3r/sK3R6LGe0Kxgk5WBHOtnPOP/+2IIjSJnEaBpUhFX5UFWLGnNnmR/jvNvBcSuUdy95heTCayFlCaHy+yobPPdp5n0+vKeb8d++RuIR+SyLc1yP4+z0DU2k75E9DQJfT8ResOq6eYbM70y7w/G7ViDIg3oYPzYoGPZ7/kBigmM9w5Kq6kM1cSJZ6E0Q0DHQnQZxQ/hCVfWKUKczZPD6O69MeLA0H8aoorGY3ypJ1cBl8d4fHSiY2tC77GIC1fIxg4b9Pn24qNV7VYyZLNf1YDyxnMXIJfGKkzwYyzC4RxB/P/bPzCqeMLnDFIo2sb8vdJ1HLDSIW2Syip199TJTqxzOvjWY4BIpXjef3lY7keNNF7eY68yzC5JPqvMXE+RwwESzIx9CGlaii1t7cOFX3k6eUXUW0BM4p00iQUKJoX4MIYZw1ciTpXGJLPAEibAL06hg==
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(36860700016)(376014)(82310400026)(23010399003)(1800799024)(18002099003)(22082099003)(3023799007)(10067099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: CNYyW0sisPGttwC7Ye8SNEoQ1pwpDr/aRKfMbrWxA28NHDssQoQCRQpxWhNaAu2lhnjKHTc41gFw5YXlFohEPDpkzULMfITurSgkuPJpUDAbK6E47pNgvmhWExoo7agxRHcEEP8h1Zp1eAFFgyO259S9FkFm5ogfaUQI/xp8UV68XIbtgK9jE2nC4FeQMpMoiV9amnYgFuthKAoGBx8YPVg3voYJFGR3PUCwbcD+6xCNmQelT690vju+6DdYqL/0wbFRghE94ySgtgAYtyYwnRch2rNkCL2dJODd2F8m9KXF5A00cfpQGD3cOKB6dFUu/a0Ub0TjBPLp95d2yTAq1bXZS8g3ggpPZq1DNx5evpllseu2N2chxjOx8Gpg+FBRa4qfsUCgdKb7RBpFD4lFRc8k57H4TdfSghNzOdGcIf5ggECFHbWRjSp8f98wE7om
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2026 09:26:00.1674
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 00f192fb-e6ea-4a40-ce0f-08df25e75506
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: OSA0EPF000000CD.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB5736
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_022621_566609_15656A57 
X-CRM114-Status: GOOD (  12.51  )
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

Add the DT binding for the Cadence I2S-SC controller integrated in
the CIX SKY1 audio subsystem. I2S-SC is a full-duplex stereo
controller supporting standard I2S, left/right-justified and DSP
formats, plus TDM operation with up to 16 slots.

Signed-off-by: Joakim Zhang <joakim.zhang@cixtech.com>
---
 .../bindings/sound/cix,sky1-i2s-sc.yaml       | 93 +++++++++++++++++++
 1 file changed, 93 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/cix,sky1-i2s-sc.yaml

diff --git a/Documentation/devicetree/bindings/sound/cix,sky1-i2s-sc.yaml b/Documentation/devicetree/bindings/sound/cix,sky1-i2s-sc.yaml
new file mode 100644
index 000000000000..3fdf2334c492
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/cix,sky1-i2s-sc.yaml
@@ -0,0 +1,93 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/cix,sky1-i2s-sc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Cadence I2S-SC controller
+
+maintainers:
+  - Joakim Zhang <joakim.zhang@cixtech.com>
+
+description: |
+  The Cadence I2S-SC controller integrated in the CIX SKY1 audio subsystem.
+  It supports full-duplex stereo playback and capture in standard I2S,
+  left/right-justified and DSP modes, as well as TDM operation with up to
+  16 slots. The transmitter and receiver are started and stopped together
+  by the controller.
+
+allOf:
+  - $ref: dai-common.yaml#
+
+properties:
+  compatible:
+    const: cix,sky1-i2s-sc
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
+    const: 0
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
+    i2s@7020000 {
+        compatible = "cix,sky1-i2s-sc";
+        reg = <0x7020000 0x10000>;
+        interrupts = <GIC_SPI 219 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&audss_cru 16>, <&audss_cru 26>,
+                 <&scmi_clk 100>, <&scmi_clk 101>;
+        clock-names = "hst", "i2s", "audio-clk0", "audio-clk2";
+        resets = <&audss_cru 0>;
+        dmas = <&audss_dmac 0>, <&audss_dmac 1>;
+        dma-names = "tx", "rx";
+        #sound-dai-cells = <0>;
+    };
-- 
2.50.1


