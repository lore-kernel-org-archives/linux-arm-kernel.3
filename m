Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7917C982F1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 11:22:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dX4FoIb0HdwM+Nydh05KmQqez7a6NenPujktGM+GEVk=; b=HGXa4JXsvz04pxzAMgB4kVo0Bx
	iVjTv6xsgn1PtxE0TLf69IQjklzlAjsh20Kxkm3wvRjj2hHspaDhHmfNNncju+jTnXG2mWF8Dn6vT
	ubj+7wGbU5yNqBaUqLJCrs3RCG7eevS/m4CNC1htajmRmFQcxS9qTKtZOnzfLuzNLRNRCf4l5uGX4
	SOY0NNNTt5jAg+Ax0RI4minXA+yYjKJ7HStQi5h/PEW7pNxN7o3bu9LTsP9c+CQ3WCV+9pLhezLIE
	LC3hKjLJP/uZgBgx/csBRZJ6esQpNbTXedes+1MaqYRZZERYJhIWR1RGpOK8eLqZEG+eFbpOZvhvD
	4p2eRTyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8yZh-00000005AAG-3AI2;
	Tue, 22 Sep 2026 11:22:13 +0000
Received: from mail-japaneastazon11023095.outbound.protection.outlook.com ([52.101.127.95] helo=TYDPR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8yZe-00000005A8O-1xxR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 11:22:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qw6vazNDkDSimZReaXheshFwbNZq4pDcJaM33CSJWGAGGEYmAN7p5EG8t6jRYUnbrkNKYeqDulSZcqosMBTqasTN6Zo5Ck72hlVEC2FLyM+AUELlCH06I1ow3ONN1QevmIcCpLYLtleuuVQgiVsqmb447Gm3IMuhqZs5GGPQV4v1TGbJ0VQzbmgv00Ue2KAr+REXfHThghzQsqZssUVHIcHc2/TPEhCbPZbDCLHlpPmadz/69xlPZjUvF1JQ8mG9SYvIvNzh7a26jJpQ5akUYMNm35VFqeoRtTU3k8EoyQ+ZL3uWCDRyJngqhz4tp8aLVTS/Kg6ejMsA+1p55eFVXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dX4FoIb0HdwM+Nydh05KmQqez7a6NenPujktGM+GEVk=;
 b=ApXspFmRFMSKOhmWMiwAvuQPSBROsyenT29Fq0OVQ6nOQb20+fY9Lio2QwXofHLk4EsMu02sI5gxqpVlBXYemPR+BDVZQ3KO5koOE8Pqnz/yLPQNBSkKRJsJR48Fnia1hRqkPH/qXadUkAYYy7J3bGTHfb+ygaH9tQ4VbSLOhTavoEn0S7dztDWcS2tF8ACS9UeNfGp86Wkw0K2L9wB3ejtxeC2reGWB/wdi+o8WtzpSsZlNsB8xfGgaRJ6/vC3pDdA88IHbkvjDqY5UjR3ScDb0maKxNudblUO3yB32kUEtBV6XwA3NldHIIwXQ3g8OQoD7yd6B/5t5Xy6I0DBRMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SG2PR01CA0190.apcprd01.prod.exchangelabs.com
 (2603:1096:4:189::11) by TYUPR06MB6220.apcprd06.prod.outlook.com
 (2603:1096:400:35c::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Tue, 22 Sep
 2026 11:21:58 +0000
Received: from SG1PEPF000082E6.apcprd02.prod.outlook.com
 (2603:1096:4:189:cafe::e) by SG2PR01CA0190.outlook.office365.com
 (2603:1096:4:189::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.16 via Frontend Transport; Tue,
 22 Sep 2026 11:21:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG1PEPF000082E6.mail.protection.outlook.com (10.167.240.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Tue, 22 Sep 2026 11:21:55 +0000
Received: from cix (unknown [172.18.64.61])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 809E3427F202;
	Tue, 22 Sep 2026 19:21:54 +0800 (CST)
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
Subject: [PATCH 1/4] ASoC: dt-bindings: Add Cadence I2S-SC controller
Date: Tue, 22 Sep 2026 19:21:31 +0800
Message-ID: <20260922112134.4167305-2-joakim.zhang@cixtech.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260922112134.4167305-1-joakim.zhang@cixtech.com>
References: <20260922112134.4167305-1-joakim.zhang@cixtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG1PEPF000082E6:EE_|TYUPR06MB6220:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 0b7a9767-9167-4644-ae3a-08df189bb585
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|23010399003|36860700016|82310400026|3023799007|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: V9PDg2W6pPdtNzb1+ufJN2HObPKN7wju904/CNv/z5y5ubLpYxwocBKvLzR/zhoed8z0wKCVv74GDhAPOC1mEEe0QmVU+KgHOxBLJlhzLxaTScctoKvti3/gVMA++qfQDQhjAJMyGS5bBybdn/BnIfS0TJcaynbypWdhH+UzCFsZB5Hj57JVSIgI9tFCBBp74nMkMVrocb+Z0RiTKtZe0QN09Bn7z7cZunQt5s0Lsa65U2Meb97sbHOfzMT2oIpAM36B3SV6mzQbWE7SA1JRSoLqHEDqEW+i2M01CgbnMubslS2VnphYzbBrvWCIr5BASKIokevgjszDx6qqyo9448MMUQh9C5mDKWgiVBJ+9NkWFK3aV4aWghflVAgYfkcNM9kWTwDkZ9fqr1k2ma8PBaTKe8+/tdoIzLT6dLtQRSa6+BboFIDH6+Fizu7u0XJWYBIkyNJLT4eOwjtzbOWDuAR8NaNaGmDATv4Lf114q3zjCsqiFPbkmj/s7HLO6HcXSNplNkXTn6QyM94yLJaphCrQ8fUPKve1LE/6HotYDIVjSdJrbomIB7zPZd7avnEOhQrtGxhVb6tdAQAz4MESB8b2h2iF3dzrDY9n7n9Jrlwa1M9+l+H1ojWRyxCfqnKXF/tki4mvV2yPq6etSLO9dA==
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(23010399003)(36860700016)(82310400026)(3023799007)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: duZOe3B2mqZYe/PeYwhm2kGunxiACNjb9ffZEVDp//C3htMs8aeizukTPeeobi25s6qguMflo2E77iA0PU/yFtRjbdIVO1w/sYjD059Zkw6ZxIeFcUeXCSrt7sFZlP9nQ7WCj7IPN45neU8JRq5ihBlx7PCSG4S5Y6iRPSguuK27b5uoc4jLjAjbZxnleQQf82NZKGu7QAg48+kvqpaFO2HzWEZsFfXc4w/POdmgYsz/9fRqPE2vL90go/t2hyEpylscrNCBaHR2iTHIdsh7T8TzboUpwhgCgGde9t04ICmehcA86pc7LTyOVH6LVnnOTqtDFUDvttzt5AZWD+Ni6Z2GmQ2743HSwJMS1Dsfhu99intHRRjAQsYCfVsREwDJmsGrIX2HoQY00LEhCvd3YXR6tLVe9Jra2z/ietu+S6bY4UGaWqN8aSsFi4zUwCea
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2026 11:21:55.2640
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b7a9767-9167-4644-ae3a-08df189bb585
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: SG1PEPF000082E6.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYUPR06MB6220
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_042210_511068_16CA1E85 
X-CRM114-Status: GOOD (  12.80  )
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
 .../bindings/sound/cix,sky1-i2s-sc.yaml       | 94 +++++++++++++++++++
 1 file changed, 94 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/cix,sky1-i2s-sc.yaml

diff --git a/Documentation/devicetree/bindings/sound/cix,sky1-i2s-sc.yaml b/Documentation/devicetree/bindings/sound/cix,sky1-i2s-sc.yaml
new file mode 100644
index 000000000000..413e2ade4664
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/cix,sky1-i2s-sc.yaml
@@ -0,0 +1,94 @@
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
+        compatible = "cix,sky1-audss-dmac";
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


