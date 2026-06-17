Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DCB0CD98EE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 06:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZKuX1jnSELfoUzMH9FY2KRQbowEs1opyDZkgcdjsgoA=; b=zSRb4H6/GQyWqRSElQXQmjk42Z
	vuePEykbP8VCg3GLVYFzgpW6CvEr/pcl1U6hjt5LZk/eDn+2boUL1BGcUCTdTpjeZwAL6Oq4AbewG
	193XPtHFWyvg9vn/cdM80ZRk1Z1/3mUJ5y7aXPu+sZTHIit7fTN4CWYHNn4jWJhPBctkLA7lAu92Z
	Sj7a+Y7Ahnh2VbTQmdxyZLZNidOg8VKmRySE6WyYe1rzWMm1kGm5JsbMNeWmhsdWpt3ad8XZEjXZD
	IUEANWCJoSb/Hmwc2dYn9EPunYxdjEqh+NC3BfKCEpJXEYWkHKey4TpWM+kFynkfCHM8vq00QknIE
	GWkCgmwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZjxf-0000000GioN-3hKz;
	Wed, 17 Jun 2026 06:41:19 +0000
Received: from mail-koreacentralazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c40f::6] helo=SEYPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZjxd-0000000Ginl-1fzg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Jun 2026 06:41:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tcko7tdsa0KQtqTTEdGhJ5YiDNH1b13zZGlk1mk1PRraFm6ekRd18fLHeVDb0puKuf844qr6uNLtpcWeEovxtZR2/mK0iDCpfKfEtvQyPb+/yUmP/48ZPC/Rpo2agbL0DHXJMzi4xlt0aq4xCy2yRSZzYe0y5b5BKKMeNEhqrM04B3hvdfcprENuuLp1usN5/bhkbWyxnUATt+mjwxRlBhnqov1k/8v8jIf10JfKKvQCESppHd7x5NZWbQyZGvynRbNzfpIDpSEtRrektVFeUiCkva2XhHhzgC7M6FKbsswp7VBFykatThtcCAxOvr3mjFTdHa3EPqLiR7ies+3c2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZKuX1jnSELfoUzMH9FY2KRQbowEs1opyDZkgcdjsgoA=;
 b=ihZLS+wFcKzaYHMRuTmp/Soyju7tipa4PYTg/KsVlsw+3eWf1iGPsMCtbTNWXpg9yNPT80v6rziDl/qxUcJRubrlYMM0tUEF73YqPEvKHOR8sZlDVWsgSb5BvJKDTmf0Conj7MQF7uWfAiRHQ3Zp1EoI0Q0VE0i1hVUH/Kl2t/sj9/QqAcq0EW15XTg+UPOQZkq7exXb1RuTde90FucfNBQxFOQW9ZUnGO6MnVfxFiCO87piQDWNMANEpyWC1PegI5AZLgfgMiF1WGc835R/N/LU1JBLJchQhUlfBTyqes2XYHNkHgWlqh2Knykh3B83d2lh0cx4TKNKuP8Y6NzubQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=baylibre.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI2PR04CA0017.apcprd04.prod.outlook.com (2603:1096:4:197::15)
 by TYQPR06MB8086.apcprd06.prod.outlook.com (2603:1096:405:2fa::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Wed, 17 Jun
 2026 06:41:06 +0000
Received: from SG2PEPF000B66CB.apcprd03.prod.outlook.com
 (2603:1096:4:197:cafe::17) by SI2PR04CA0017.outlook.office365.com
 (2603:1096:4:197::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.18 via Frontend Transport; Wed,
 17 Jun 2026 06:41:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG2PEPF000B66CB.mail.protection.outlook.com (10.167.240.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.8 via Frontend Transport; Wed, 17 Jun 2026 06:41:04 +0000
Received: from cix (unknown [172.18.64.61])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 6F49941D4009;
	Wed, 17 Jun 2026 14:41:03 +0800 (CST)
From: joakim.zhang@cixtech.com
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	bmasney@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	p.zabel@pengutronix.de,
	gary.yang@cixtech.com
Cc: cix-kernel-upstream@cixtech.com,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Joakim Zhang <joakim.zhang@cixtech.com>
Subject: [PATCH v4 resend 3/5] dt-bindings: clock: cix,sky1-audss-clock: add audss clock controller
Date: Wed, 17 Jun 2026 14:40:58 +0800
Message-ID: <20260617064100.1504617-4-joakim.zhang@cixtech.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260617064100.1504617-1-joakim.zhang@cixtech.com>
References: <20260617064100.1504617-1-joakim.zhang@cixtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66CB:EE_|TYQPR06MB8086:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 7da62746-df74-42d4-7315-08decc3b67b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|36860700016|82310400026|23010399003|376014|1800799024|56012099006|22082099003|18002099003|3023799007|6133799003;
X-Microsoft-Antispam-Message-Info: OAJ/ZvoThA5a7c6hBoYG4BPy6FKbNM0jFqoiCKebI+623mxix0VB7kqbWOyxWAWJysnX2aqm9zFwdwOravOXnZWpkRRz1yGbbWpIMv9/Pt6a1D5MDFYmXqTHfKGc92ppPbl8q1Ny0l/3Kmijv5AyxWzga9bz8D2PSH0JNE+DwAKQQ7mwxR4flDiefPjwAbklv3kq3+5ZXB9mqJjSpEeP03dh1XcBgoeOyb2EzEbI89nbx+NTEc35Ip30f48THiwHMY3N74LPHBuUBiVBuoirzpe8snfKlN+NIrBJuctftFCoFH5pr1eJRjA7/pAMpeBwSozBa3mm4DxKKIJSNONfH3BRJBUYK9GseeSTG/W38k090glr1ZYi+TaVV4d0r/eOrNULJ3tMbJh7y4jjqNA/8ceeJI2hYBthbjb9bAUTDHjSULkSk1b327JTZwEZkdeEUT2ZhhQCsutsRAeu/GNy3MtidS1fx0cLXcYRHLNEKAG4unBRRyRo6893uZ82RvLHHUnDkg6+NBblswbEz2h85D8U59EFvRDjMbDlEQ9f7TSiV0sUV+KtILLaN9aeigJR2POX7iGIqXn8CowlxFHpcj4sLJZVDRbKVnO1mYFdxDyMoZ6DNK2YgDAStFs1pQ+nbFFOdHKknFQjq+tl3+uVnS51/xt1KNf1GAoEG7W6o46AfGSxwIOyiQZyilr1+WEI
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(36860700016)(82310400026)(23010399003)(376014)(1800799024)(56012099006)(22082099003)(18002099003)(3023799007)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: p1X3h8umQlz3WvGqjvo/24B+NsxU53MQrEgc+lzhULGKpBfQ91u4PAD5rEWrAbKIbUjzRn3kmNsYiYB9NauRwKenajjMnUTw+HySm0vu6zaAWI9S2vHaF2bPUEX660aPNg8wTTvnW98fOCan0mObzYwtWXY2gE6Y/LGp6Nn2Su1dU73lYtYELbY4qVuF+/Fh9d/qxChARg+lXwyEjeRH9ULSWdJHXgUKdQq+cnO97g9gt/BcaD9rgcEKQetbOuBC/h7lCR2OlfX2TtIADqs94dDJKuQawwnmnvKTA8PMDsSLLAE7Ys4yP9qNjCC2u647FypbnarFjVeG9xH1SB1Qhf75GzMvwdgMB+vmCpB+ocMMS089bZaeya1Alt5s8BK89FWZ5wrvXuE9TRQOWpZrIvW6xJb5ZQ6sqFB2iqap2c95ye+SqO+RcLA4tdGqwgu6
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2026 06:41:04.6666
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7da62746-df74-42d4-7315-08decc3b67b9
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: SG2PEPF000B66CB.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYQPR06MB8086
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_234117_441989_C6998289 
X-CRM114-Status: GOOD (  13.89  )
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

The AUDSS CRU contains an internal clock tree of muxes, dividers and
gates for DSP, I2S, HDA, DMAC and related blocks. The clock provider is
a child node of the cix,sky1-audss-system-control syscon and accesses
registers through the parent MMIO region.

Signed-off-by: Joakim Zhang <joakim.zhang@cixtech.com>
---
 .../bindings/clock/cix,sky1-audss-clock.yaml  | 72 +++++++++++++++++++
 .../dt-bindings/clock/cix,sky1-audss-clock.h  | 60 ++++++++++++++++
 2 files changed, 132 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/cix,sky1-audss-clock.yaml
 create mode 100644 include/dt-bindings/clock/cix,sky1-audss-clock.h

diff --git a/Documentation/devicetree/bindings/clock/cix,sky1-audss-clock.yaml b/Documentation/devicetree/bindings/clock/cix,sky1-audss-clock.yaml
new file mode 100644
index 000000000000..8545eef0fa03
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/cix,sky1-audss-clock.yaml
@@ -0,0 +1,72 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/cix,sky1-audss-clock.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Cix Sky1 audio subsystem clock controller
+
+maintainers:
+  - Joakim Zhang <joakim.zhang@cixtech.com>
+
+description: |
+  Clock provider for the Cix Sky1 audio subsystem (AUDSS).
+
+  This node is a child of a cix,sky1-audss-system-control syscon node
+  (see cix,sky1-system-control.yaml). It does not have a reg property; clock
+  mux, divider and gate fields are accessed through the parent register block.
+
+  Software reset lines for AUDSS blocks are exposed on the parent syscon via
+  #reset-cells (provider). Reset indices are defined in
+  include/dt-bindings/reset/cix,sky1-audss-system-control.h.
+
+  Four SoC-level reference clocks listed in clocks/clock-names feed the AUDSS
+  clock tree. The provider exposes the internal AUDSS clocks to other devices
+  via #clock-cells; indices are defined in cix,sky1-audss-clock.h.
+
+  The parent cix,sky1-audss-system-control node describes the SoC syscon
+  NoC (or bus) reset via resets and the audio subsystem power domain via
+  power-domains.
+
+properties:
+  compatible:
+    const: cix,sky1-audss-clock
+
+  '#clock-cells':
+    const: 1
+    description:
+      Clock indices are defined in include/dt-bindings/clock/cix,sky1-audss-clock.h.
+
+  clocks:
+    items:
+      - description: I2S parent clock for sampling rates multiple of 8kHz.
+      - description: I2S parent clock for sampling rates multiple of 11.025kHz.
+      - description: clock feeding most devices in audss (NOC, DSP, SRAM, HDA, DMAC, I2S, and Mailbox).
+      - description: clock feeding for HDA, Timer and Watchdog, which is a dedicated 48MHz clock.
+
+  clock-names:
+    items:
+      - const: x8k
+      - const: x11k
+      - const: sys
+      - const: 48m
+
+required:
+  - compatible
+  - '#clock-cells'
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/cix,sky1.h>
+
+    clock-controller {
+        compatible = "cix,sky1-audss-clock";
+        #clock-cells = <1>;
+        clocks = <&scmi_clk CLK_TREE_AUDIO_CLK0>, <&scmi_clk CLK_TREE_AUDIO_CLK2>,
+                 <&scmi_clk CLK_TREE_AUDIO_CLK4>, <&scmi_clk CLK_TREE_AUDIO_CLK5>;
+        clock-names = "x8k", "x11k", "sys", "48m";
+    };
diff --git a/include/dt-bindings/clock/cix,sky1-audss-clock.h b/include/dt-bindings/clock/cix,sky1-audss-clock.h
new file mode 100644
index 000000000000..7e9bd3e6c7a1
--- /dev/null
+++ b/include/dt-bindings/clock/cix,sky1-audss-clock.h
@@ -0,0 +1,60 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright 2026 Cix Technology Group Co., Ltd.
+ */
+
+#ifndef _DT_BINDINGS_CLK_CIX_SKY1_AUDSS_CLOCK_H
+#define _DT_BINDINGS_CLK_CIX_SKY1_AUDSS_CLOCK_H
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
-- 
2.50.1


