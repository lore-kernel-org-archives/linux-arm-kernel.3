Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5951C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 09:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n3e/3Mz+2j77ICnsCAepz9q/sEHFkYkcB3C4JHFJ/B8=; b=TTNKx8g2FsUMu5j5JqmD6kTzHO
	EKbGBnP+K7NsITP/t8DrkGP4wB98Vt7IHJdgQXj2k7jPgLUTLL3vaBiAgFUkvz3P3hCgpwTAAeXuC
	RBjBbDRba0ie5FZm6R+BAx7cEgz6LieJ9EmQolvQbOOZ2Og0C9flks7hENRp1/uz3ZqiOptMFfA5I
	iR3yfulowztAZ+9NjYYUJdMZHpM56TqOQru6ctYzOsnPvqmAioGSYIYPkoXkP1O8qPpnssd4wYo3x
	CRfH+eJaIoddCmTqq5JKC9GjpzOqyisUT0ZdZPY4je4qLASWescUL9wnheH5w0N22xB2xhiaBS0Ub
	OvY8u6Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we85H-0000000E7hl-3oOG;
	Mon, 29 Jun 2026 09:15:19 +0000
Received: from mail-koreacentralazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c40f::6] helo=SEYPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we85A-0000000E7dp-10OS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 09:15:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hCwbNhdttbtiG1fZcvHW9I9d6Rn72OG08g+ZARVE77HUw99Du2SkT4t75N13gqtUQKsp6TlrQPcVNlUwk8FPjPCJGebGtOfC8PGsUTCY62hr51r4sCdD1cFW1EmYuA3q7X+uNh8DJOJbqKH+BLTjhmLXfExPhjeNdNF/kWithzgVkgFrL1uAhm8YXUAG8m85Rij7buvDJgBhGBIl9/R7LY2BN4BVB0ZP48xR5n53sLD+bY7yApKrKlj+THecG3o04rPHovgFg+SbpMpsP2NCOIE1bx0VaKE59oovEui0DkPLrY4WYG1PiPkPol6IVEqeKDPl8ojFlRPQ0UL86mE70g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n3e/3Mz+2j77ICnsCAepz9q/sEHFkYkcB3C4JHFJ/B8=;
 b=eIzMaNgUj1nzx3col+Q75BcmNjMu+S/i9tu+DB6p3m6BoWmYytbKi/RC2ppKwUDk86+jhEfB1C4x872a5FsbKYM1oyEK2+Eekm22SWBY7XvvoMVeEuiOg1/6icDHYWED5UMconuyYTto79AzIbq7M2XNdLvNvmHFpOz00WsaH1uzUXiUTOS8HqpeXLBTnJslz/m4Aemc78qzK2z74+/DqMZB56RQYU7YCskJMhvPtvkPqu1rxFeBRoDNRJ9OSB9YeskdTLoIzP7W2jJ/jK+MceKPYsMKVDLh7187qtSZ50/Z4Br0bI2pjNqCQJKMbDDij/Bwq8QFsNgpKyWLgeX3AA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=baylibre.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from TYWPR01CA0039.jpnprd01.prod.outlook.com (2603:1096:400:17f::14)
 by KL1PR0601MB5552.apcprd06.prod.outlook.com (2603:1096:820:c3::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 29 Jun
 2026 09:15:04 +0000
Received: from TY2PEPF0000AB89.apcprd03.prod.outlook.com
 (2603:1096:400:17f:cafe::68) by TYWPR01CA0039.outlook.office365.com
 (2603:1096:400:17f::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.19 via Frontend Transport; Mon,
 29 Jun 2026 09:15:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 TY2PEPF0000AB89.mail.protection.outlook.com (10.167.253.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Mon, 29 Jun 2026 09:15:03 +0000
Received: from cix (unknown [172.18.64.61])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id D1EAC40920FF;
	Mon, 29 Jun 2026 17:15:02 +0800 (CST)
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
Subject: [PATCH v7 1/4] dt-bindings: soc: cix: add sky1 audss cru controller
Date: Mon, 29 Jun 2026 17:14:57 +0800
Message-ID: <20260629091500.52540-2-joakim.zhang@cixtech.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260629091500.52540-1-joakim.zhang@cixtech.com>
References: <20260629091500.52540-1-joakim.zhang@cixtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PEPF0000AB89:EE_|KL1PR0601MB5552:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 02574d30-0ca7-4f35-575d-08ded5bee7d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|7416014|376014|1800799024|82310400026|36860700016|3023799007|22082099003|18002099003|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info: 05jFcdOyiw6Q15gFzbQpaqobh85VNXx/w9W5Mh6Sqcv6t9HM7CIGfP8qQclYbARBobaEkiyZD6rg1XIwEeV3NGL2rdvmO4PAQzE9TxUzsp0G7pX94MU8gJ2I3I0lUAHknxnJp5R1g7mOob9GNa5hpTF0ybGxSSUzs1znGh7tff66dtZgIF1H/zNlsUkbOKDwXWKvFT1QgR4UjIlalpnSLicUwumSrmj95DciLNFG5VHmGSbvHjj2AlhNM+j0z4O/CVvw9UtAlDHulKkR+isrHVut4vWzyBy6JouT9u+ZUNxedDtuiSDeFypLVXPGIGvQbDM7W+csdbIWPggBszUyC+suUPxi3FCrQQdKu0zH3o6g9RmY6x5EIyk25aMpAHOiUX5BEbnyd2aYfxKzNEfdRiwXFyaEeLL08irQXadJSxs7vhD4uxt1ItNomqlDJVLdOrQQw6kVioIPS1FacdGDKzgDiae6TP+7kxwfVYh9pttmXrsxDQKCyW9VjsFrv6PkuN2SysUNslPcsnhTbkbz4tqUu6b3kdz9EmoolICCmid64UZH09zdYfVGhBlvovSdDWPqj4swb1Hx9WPYnrrcdexShP5Zs1LYrSkFpc/8FzLAiIXvmSVbwcvTChbSWUCphDuG2XL6zvpDZsbWggERPQ==
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(1800799024)(82310400026)(36860700016)(3023799007)(22082099003)(18002099003)(56012099006)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 5S41tRCqPOFfJ33S8U6mYUydbdjQPkPW6T/LowgLO+dE5N8CVtH/28tQyREOWAzsF66K0E2AhbbPNceBizBD7AHTMbU+8SOUscEd4dmgI7NNB0fneVJ/a1dE7rcKQ5/FI4UItjKm0EfoHA2/783XDkBJIlulRrNUwx8rriRGz5pxxy9Na+8U8hSafzB5Dy1l4W2AqdwD4WQdlYVgiciZZG35WkQPzy+sBoxCxJA6Q8Z7ALfzLlF6Oxa6OKLK+qVooL3EBX2jOT7HQRPl+jWAhZhnJL3KbruZ6fxe4VeQpGCl7FBfHMCuPDnlNamF/7ngBnCf8jEjhBfHZua6qJHrxj9DmfYj/VbkKk41ugtOiTXaA90o+HsCnwFQAPgd6Dn9f4VLdVCAkwUheohKJMADCgAjyy61kUU2uFTVBmUp19mtUZMCDlwQcaqXD0hQ7Yrh
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 09:15:03.9183
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 02574d30-0ca7-4f35-575d-08ded5bee7d6
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: TY2PEPF0000AB89.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB5552
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_021512_291600_270FE420 
X-CRM114-Status: GOOD (  13.94  )
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


