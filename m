Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F3DBC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 12:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n3e/3Mz+2j77ICnsCAepz9q/sEHFkYkcB3C4JHFJ/B8=; b=vFpOvV6B71NmW1vuxVF9CvPVlI
	3LpzZFlXp1UFh7U1flMuqcBIi/n2jRh8gRh844FHC+5Cj797s8v8wzD5JQYNBvd5gXaaaDOcVbLPN
	hBXTERYpp++xR83i+LXFGPEwGDc7uK07HAybDtmDaAxyKn/6HI3dQBNdVBe72v8HQd2+vI1v2vbIE
	VQ4+1KQcIymt1EhnF7aiB12x9OiH3yXy27Ml2q0mukXuBYDEX7eIaaPPvpl2E6gz36/6IFAVxMuEr
	eM8sZnCvt2k+lh/QZ1dopogm+rleD5oia+KpUuyiDHNzMCpfufgwi9DEJgpQugu7Ab7NRuCXS44Sy
	vVR3xZwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weXpC-0000000H1iY-2X5f;
	Tue, 30 Jun 2026 12:44:26 +0000
Received: from mail-japaneastazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c405::5] helo=TYPPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weXp9-0000000H1fz-3sDq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 12:44:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yoPCXhI2IklHbnHp0cZjCt1IFK0ceDxegZMnCLsl7Druku4x7Rv6Rt+iRTLAjR2JoLWCdGfmCTJV6L+exts1dWJ7nbRAzR5aAo+E52+Izjuj0T0QR9EuUZklvN/4iL/BuRiNnh9U903nzrFPJwHYtegDpzsmtlwYGCcKBjI2pHQOWwYoCGf+v484DdjHXqOT2JDHnFM1O0mhVySgVc4Tx86LTxPeg4sKKaPYfDTIo2YgKYA5AUEzrkII7xFG2EkBC5SVDfwuYrx1hB+0QZhYFaU7NxgoNpNFhdnm8dthl8ULE3j8XWGpBn//yhowCcpuibUP6wzIOGA/LMZIJAl3/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n3e/3Mz+2j77ICnsCAepz9q/sEHFkYkcB3C4JHFJ/B8=;
 b=UgsngcGrRIfVMQFmYwVfZ2h0qAnuq9awBk94eIBawhxTlYqYAs0xpSQEppOKrh3M0/69/p5zuhRD7DxzLZHtVsxpkwH2XDGv1IX6hpirnb0Ip5CSa+o4U9+Mn00DqFW8+iJoR91nHMbtL0IWkT3Hz51J9VXEZ5hUwwTN73ZA5esnrzXRC0jdNqoPM/YqRMfRi/fIJXlRO437eINzh33UPIBu2pv3N0NPnC7JWR4nzxy5gNc6u0ZD8MxX3W2GOpnrd7M1ltRkuISyG3gDWDxjfEjsUDSgAGT8Ws85Ph7Qbyj30YVwOz9JFgRFikBIH4INM5xHjT6LTSFtLTO3FdmmrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=baylibre.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SG2P153CA0039.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::8) by
 KU2PPF40E30BD52.apcprd06.prod.outlook.com (2603:1096:d18::490) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.159.18; Tue, 30 Jun 2026 12:44:18 +0000
Received: from OSA0EPF000000C8.apcprd02.prod.outlook.com
 (2603:1096:4:c6:cafe::10) by SG2P153CA0039.outlook.office365.com
 (2603:1096:4:c6::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.2 via Frontend Transport; Tue, 30
 Jun 2026 12:44:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 OSA0EPF000000C8.mail.protection.outlook.com (10.167.240.54) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Tue, 30 Jun 2026 12:44:17 +0000
Received: from cix (unknown [172.18.64.61])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 7320741C1E43;
	Tue, 30 Jun 2026 20:44:15 +0800 (CST)
From: joakim.zhang@cixtech.com
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	bmasney@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	p.zabel@pengutronix.de
Cc: cix-kernel-upstream@cixtech.com,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Joakim Zhang <joakim.zhang@cixtech.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v8 1/4] dt-bindings: soc: cix: add sky1 audss cru controller
Date: Tue, 30 Jun 2026 20:44:10 +0800
Message-ID: <20260630124413.1814379-2-joakim.zhang@cixtech.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260630124413.1814379-1-joakim.zhang@cixtech.com>
References: <20260630124413.1814379-1-joakim.zhang@cixtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSA0EPF000000C8:EE_|KU2PPF40E30BD52:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: d97b6b87-cb72-4b20-cb8a-08ded6a54cb5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|23010399003|36860700016|1800799024|376014|7416014|3023799007|56012099006|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: yyN6e4MdCGUDfQMPGAzzXQZzp5M6vl22RseVqqzIZhsSvX1B0e6FHbnguA9Q+Dc5pDyZip3gNyfVmevBrIUpb321zTWiEDvwus8geZ3QKUQT3V6l7Ace/OJ55d2LiwNS9iSHCyIUW9FFCmwNxSrmBzt56NYf78qvUdoO1TatmcYs89/chYCg4ukp6dGCGaBort8c/cDrdifYDE4EAiu57CG94furKxAQvMm6UuTbJ2Ar/dXiSDt+mLk+i7qx7ub3xkekjf0sXvZQdAyc7TToZ9oyzBxe95TWE3WSTbtPPrnXdBwFPdtPyj2X2VPmGUOLLs1z6eH6CqKAqnT8CR56haK6Dk041HBbKPUF34yWhTzNO+7YGxZAquiC8rGWF//Ruh9L51gRi5vqzBWzzE6A0bjGoNl+m8la4BK0F4s0qDfVsk7BeCiVQi6sk8uXwIUBKc0Re0DXntO8+ffLEyt0wLuTTt4yppZy0oAscbHj7YXs7K9XHOJsbRaINCa0ul0SyiB/XEMasIMzJnz4gxZq588QlAjcs8+QwIpHqXs1jBUvN4es4x0GsGD09431XG9OaeIFcPNQ+JplwAgbyX2zgAd3T8LN9jHYXjittu2GvYWqOdxltVAs3N2uBFRtDyIp+q7T3ZXgH+7e/b7n0TfXuQ==
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(36860700016)(1800799024)(376014)(7416014)(3023799007)(56012099006)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: xkJ8EpG6MQArXbJdGQyV+cyUlE9uQW89LTjvXjgB2sXLV0fw4Vvv9uLve4C1iqsMOc1BxMPeDp4nJviqYq02vj1Amhy1LMVPXKmTrjRa3ZcVEClU17bMjPmD19IqCwLxljR28nHkG0rmRkRD0ou8BSUwLjq/dgCCSacLSsbqVAikVeNCx1F+ienHdkjLxNVnEdK2CIZS187TASNcgLU8mcJzBnITc9iPuGpPu/QYEK3w607xKK3Xk6tTMvpYVEv7dPDxjdShumMfj6tO8xhyKhfbiPly1TjxBudzFbxyvKE+NKHn6fXJTtUxpkly6JNU0z/gxAvaWPmI9bRbScaBMKvv/OvwiEqoc0BnPxG15OwyEb5pWQA25CoqNywK8WJJd99/XAy56LZ1l63j6ZNtxu8HnRGWruQuKnna1eW5DvnoOyu0RhKBfO+ApRjkx66g
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 12:44:17.2664
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d97b6b87-cb72-4b20-cb8a-08ded6a54cb5
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: OSA0EPF000000C8.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KU2PPF40E30BD52
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_054424_581147_ED79E315 
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

The Cix Sky1 Audio Subsystem (AUDSS) Clock and Reset Unit (CRU)
groups clock muxing, gating and block-level software reset control
in a single register block.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Joakim Zhang <joakim.zhang@cixtech.com>
---
 .../bindings/soc/cix/cix,sky1-audss-cru.yaml  | 92 +++++++++++++++++++
 .../dt-bindings/clock/cix,sky1-audss-cru.h    | 60 ++++++++++++
 .../dt-bindings/reset/cix,sky1-audss-cru.h    | 25 +++++
 3 files changed, 177 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/cix/cix,sky1-audss-cru.yaml
 create mode 100644 include/dt-bindings/clock/cix,sky1-audss-cru.h
 create mode 100644 include/dt-bindings/reset/cix,sky1-audss-cru.h

diff --git a/Documentation/devicetree/bindings/soc/cix/cix,sky1-audss-cru.yaml b/Documentation/devicetree/bindings/soc/cix/cix,sky1-audss-cru.yaml
new file mode 100644
index 000000000000..50dd0593e1d9
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/cix/cix,sky1-audss-cru.yaml
@@ -0,0 +1,92 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/cix/cix,sky1-audss-cru.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Cix Sky1 audio subsystem clock and reset unit
+
+maintainers:
+  - Joakim Zhang <joakim.zhang@cixtech.com>
+
+description: |
+  The Cix Sky1 Audio Subsystem (AUDSS) Clock and Reset Unit (CRU) groups
+  audio-related clock muxing, gating and block-level software reset control
+  in a single register block.
+
+  A single device node exposes both the clock controller and software reset
+  lines. The clock driver registers as a platform driver; the reset controller
+  is registered by an auxiliary driver bound from the clock driver.
+
+  Four SoC-level reference clocks listed in clocks/clock-names feed the AUDSS
+  clock tree. Internal AUDSS clocks are exposed via #clock-cells; indices are
+  defined in include/dt-bindings/clock/cix,sky1-audss-cru.h.
+
+  Block-level software reset indices are exposed via #reset-cells; indices
+  are defined in include/dt-bindings/reset/cix,sky1-audss-cru.h.
+
+  The SoC syscon NoC (or bus) reset is described via resets. The audio
+  subsystem power domain is described via power-domains.
+
+properties:
+  compatible:
+    const: cix,sky1-audss-cru
+
+  reg:
+    maxItems: 1
+
+  '#clock-cells':
+    const: 1
+    description:
+      Clock indices are defined in include/dt-bindings/clock/cix,sky1-audss-cru.h.
+
+  '#reset-cells':
+    const: 1
+    description:
+      Reset indices are defined in include/dt-bindings/reset/cix,sky1-audss-cru.h.
+
+  clocks:
+    items:
+      - description: I2S parent clock for sampling rates multiple of 8kHz.
+      - description: I2S parent clock for sampling rates multiple of 11.025kHz.
+      - description: Clock feeding most devices in AUDSS (NOC, DSP, SRAM, HDA, DMAC, I2S, and mailbox).
+      - description: Clock feeding HDA, timer and watchdog, which is a dedicated 48 MHz clock.
+
+  clock-names:
+    items:
+      - const: x8k
+      - const: x11k
+      - const: sys
+      - const: 48m
+
+  power-domains:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - '#clock-cells'
+  - '#reset-cells'
+  - clocks
+  - clock-names
+  - power-domains
+  - resets
+
+additionalProperties: false
+
+examples:
+  - |
+    audss_cru: clock-controller@7110000 {
+        compatible = "cix,sky1-audss-cru";
+        reg = <0x7110000 0x10000>;
+        #clock-cells = <1>;
+        #reset-cells = <1>;
+        clocks = <&scmi_clk 76>, <&scmi_clk 78>,
+                 <&scmi_clk 70>, <&scmi_clk 71>;
+        clock-names = "x8k", "x11k", "sys", "48m";
+        power-domains = <&smc_devpd 0>;
+        resets = <&s5_syscon 31>;
+    };
diff --git a/include/dt-bindings/clock/cix,sky1-audss-cru.h b/include/dt-bindings/clock/cix,sky1-audss-cru.h
new file mode 100644
index 000000000000..8c58ef8bf682
--- /dev/null
+++ b/include/dt-bindings/clock/cix,sky1-audss-cru.h
@@ -0,0 +1,60 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright 2026 Cix Technology Group Co., Ltd.
+ */
+
+#ifndef _DT_BINDINGS_CLOCK_CIX_SKY1_AUDSS_CRU_H
+#define _DT_BINDINGS_CLOCK_CIX_SKY1_AUDSS_CRU_H
+
+#define CLK_AUD_CLK4_DIV2	0
+#define CLK_AUD_CLK4_DIV4	1
+#define CLK_AUD_CLK5_DIV2	2
+
+#define CLK_DSP_CLK		3
+#define CLK_DSP_BCLK		4
+#define CLK_DSP_PBCLK		5
+
+#define CLK_SRAM_AXI		6
+
+#define CLK_HDA_SYS		7
+#define CLK_HDA_HDA		8
+
+#define CLK_DMAC_AXI		9
+
+#define CLK_WDG_APB		10
+#define CLK_WDG_WDG		11
+
+#define CLK_TIMER_APB		12
+#define CLK_TIMER_TIMER		13
+
+#define CLK_MB_0_APB		14	/* MB0: ap->dsp */
+#define CLK_MB_1_APB		15	/* MB1: dsp->ap */
+
+#define CLK_I2S0_APB		16
+#define CLK_I2S1_APB		17
+#define CLK_I2S2_APB		18
+#define CLK_I2S3_APB		19
+#define CLK_I2S4_APB		20
+#define CLK_I2S5_APB		21
+#define CLK_I2S6_APB		22
+#define CLK_I2S7_APB		23
+#define CLK_I2S8_APB		24
+#define CLK_I2S9_APB		25
+#define CLK_I2S0		26
+#define CLK_I2S1		27
+#define CLK_I2S2		28
+#define CLK_I2S3		29
+#define CLK_I2S4		30
+#define CLK_I2S5		31
+#define CLK_I2S6		32
+#define CLK_I2S7		33
+#define CLK_I2S8		34
+#define CLK_I2S9		35
+
+#define CLK_MCLK0		36
+#define CLK_MCLK1		37
+#define CLK_MCLK2		38
+#define CLK_MCLK3		39
+#define CLK_MCLK4		40
+
+#endif
diff --git a/include/dt-bindings/reset/cix,sky1-audss-cru.h b/include/dt-bindings/reset/cix,sky1-audss-cru.h
new file mode 100644
index 000000000000..55e9f3797b30
--- /dev/null
+++ b/include/dt-bindings/reset/cix,sky1-audss-cru.h
@@ -0,0 +1,25 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright 2026 Cix Technology Group Co., Ltd.
+ */
+#ifndef DT_BINDINGS_RESET_CIX_SKY1_AUDSS_CRU_H
+#define DT_BINDINGS_RESET_CIX_SKY1_AUDSS_CRU_H
+
+#define AUDSS_I2S0_SW_RST	0
+#define AUDSS_I2S1_SW_RST	1
+#define AUDSS_I2S2_SW_RST	2
+#define AUDSS_I2S3_SW_RST	3
+#define AUDSS_I2S4_SW_RST	4
+#define AUDSS_I2S5_SW_RST	5
+#define AUDSS_I2S6_SW_RST	6
+#define AUDSS_I2S7_SW_RST	7
+#define AUDSS_I2S8_SW_RST	8
+#define AUDSS_I2S9_SW_RST	9
+#define AUDSS_WDT_SW_RST	10
+#define AUDSS_TIMER_SW_RST	11
+#define AUDSS_MB0_SW_RST	12
+#define AUDSS_MB1_SW_RST	13
+#define AUDSS_HDA_SW_RST	14
+#define AUDSS_DMAC_SW_RST	15
+
+#endif
-- 
2.50.1


