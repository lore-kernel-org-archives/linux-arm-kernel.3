Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9110FFCC9B1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 05:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jWVNq7z851XphGFe4eTwIfKPYfgid8WH1HtPYuqkXNM=; b=DXFI4/nBVPSlfvCG3h7QMxbvsz
	em0cPzGGtBIAEL9BFFR8iT3febWf27xz+bVyvRtIRzgaxduDDLKRBDfwbmXfPSA9DdUqrhZtkIzhK
	3Cz1jauQ6Qb+6N81lrGPaalwVqAetGCFiWesT/3hzy+aQrkQlYmr7t991Cob51nbeg8OQiYue2i7h
	VKMHYcbLtjkngoksSkx7TckAPcSZogvpBSashPSiu4uGsj8YCMYwPGEuDTK8PhvCNhzsi2kRxiaNo
	//pfLihY8QU8aP+QB/cVwjoaEEsqT4q/CmFkzmSm0TotRRNxbwAJ8BVKyW/+OXDM+D33Wj74TPA9O
	cpTe8e/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0CHs-0000000AoEl-0cub;
	Wed, 11 Mar 2026 05:39:16 +0000
Received: from mail-westus2azon11010050.outbound.protection.outlook.com ([52.101.46.50] helo=CO1PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0CHo-0000000AoCo-2MGV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 05:39:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Orqafsx768NT9KKWVPg13DNgrvOJ3ol/kSS+JUhO53bzJGNHfn2u7ON0pxocjVXfXc9yjX2ZIG//L5dh0G9F16Q6rGXlEHOq6bL+6+r676pV3NzTFq/hNthtxs7l2ZS6v+xHq5tdq1GAtTlPCASjtkgUFJOrnPr/X8u0c3mMHT/CEDpCVZMzjIbG5n6LSITM2S7gRg+OSj5xd1mYREXLiReL9mXak4g4w6Ec5o0Xy7sEqEMdvpqG/Y86+ndiD+k5DP3MwCvK9rVAlLL8uNiTbkhoCKBnbtKA0cJdVsOgcRkVAvbkAUtkvkq2jK87vqpSJiNBw/K10FXET8cR0E7zOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jWVNq7z851XphGFe4eTwIfKPYfgid8WH1HtPYuqkXNM=;
 b=C32mosg2pP2euV1drXKvQYJt5RuZNSp0+xg1rQbEReGvXf9O9gPEAwxr/a81ZLZbmXugGGNehQ+yQBIC7HuVrEcco177V++SO5E+dBbsDp3vIs+nETQnQ4nzUSucakRn7juK22JGDSjw7w0DyeZxmZPhVi+KbeI077ZTqrkEXI9BdbFAa6lp0aVih0vgmJhHCwiZY3EpLKBJJC+tPMG711fAjh2Y1TRT7oq/kuGiJfrD3CGUfmhK8lQCgdWHmG0LJqv+1D2F2oFPLUNaj+cooEo8kjXAg5oz1h1pCWMUcupdjArj+WmvYSrCFdBx71MuNaprk1BwgJ0b3YA/w2Ng9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=kernel.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jWVNq7z851XphGFe4eTwIfKPYfgid8WH1HtPYuqkXNM=;
 b=MRooqF6BMx2rwDbCOu6ekeGSoWqMjtlnZwjbvxBcayW5y+X2inCpa2KmvV1omKax3DERT4LcEliMkqImyU0BVmN49M83iMLV+KizIVthhoJ060RaEQsQbzz5fYg5sgJ+IHQjN2GstHkggYgVdtJMWDSxSDG5UE2IfeLW80lykuI=
Received: from SJ0PR03CA0065.namprd03.prod.outlook.com (2603:10b6:a03:331::10)
 by CY5PR10MB5913.namprd10.prod.outlook.com (2603:10b6:930:2f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.12; Wed, 11 Mar
 2026 05:39:07 +0000
Received: from SJ5PEPF000001D4.namprd05.prod.outlook.com
 (2603:10b6:a03:331:cafe::26) by SJ0PR03CA0065.outlook.office365.com
 (2603:10b6:a03:331::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.26 via Frontend Transport; Wed,
 11 Mar 2026 05:38:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ5PEPF000001D4.mail.protection.outlook.com (10.167.242.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Wed, 11 Mar 2026 05:39:07 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 11 Mar
 2026 00:39:06 -0500
Received: from DLEE210.ent.ti.com (157.170.170.112) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 11 Mar
 2026 00:39:06 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 11 Mar 2026 00:39:06 -0500
Received: from fllv0122.itg.ti.com (fllv0122.itg.ti.com [10.247.120.72])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62B5d6Cm263432;
	Wed, 11 Mar 2026 00:39:06 -0500
Received: from localhost (meghana-pc.dhcp.ti.com [10.24.69.13] (may be forged))
	by fllv0122.itg.ti.com (8.14.7/8.14.7) with ESMTP id 62B5d5jN028456;
	Wed, 11 Mar 2026 00:39:05 -0500
From: Meghana Malladi <m-malladi@ti.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>
CC: Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>, <srk@ti.com>,
	<danishanwar@ti.com>, <m-malladi@ti.com>
Subject: [PATCH v3 1/2] arm64: dts: ti: k3-am642-evm: Add ICSSG0 overlay for dual EMAC support
Date: Wed, 11 Mar 2026 11:08:51 +0530
Message-ID: <20260311053852.1034244-2-m-malladi@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260311053852.1034244-1-m-malladi@ti.com>
References: <20260311053852.1034244-1-m-malladi@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D4:EE_|CY5PR10MB5913:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ec37c2c-c627-4741-8d8e-08de7f308367
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|376014|36860700016|1800799024|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: deygNpeZ5VKDftMXGXAF5DS7QG7XMC9UageDKa6e3CSOYLvJ5AWhf2aO+nvN3I9VnTdurLqFdZwp5vATM8eRdBq/w7oDxxTv2ukKd3iAIjWyiwHGGEr5ggghyf7EHp6gUvws/I2wjeBw3JULPosNeKbMxk2MJtNfmCk78bsX9S+pBMqUntX4VjdwldsKFuzWKlE3lmxO+jpCw3VjhQpSbdK47u97aIuDEjrpU2f/4fVaM1FcfcYM4fW6AzkMgEEnZGTEkx4IDDfW10WE4Ab/gLz97iPZDlD3/r7roFscwdSISnPyn0CaDKXJDtnbjHn0Vygim8WcoeKw5uVgtOjF6M25Wj3Khm6ynymxG5XQJxsczk+cpA1+kvt+hRRGa8uxvONYNKGJc5Jh4pqlhgB2GNxm90NYfTdyEBFQmUExc6KrY/Tm9MieLze9zxGO7i4lXIHXpgR0YOvnXaXf/Rb/W6/YbHgC/MPYmf2Nfq23kaRwOvqrUAjgxmHzJdeXzdmvfI9LLNWguUXv+wifyKNrFPjC+1RnDfCZ/ZtJtKd16aH83gDpwPVEfxDJVy7sCiHJDgMuAcHB0Bfc2/tT1Zcu6POtWpo/OXd0cTjMVq5glkggtGaANz2meRrTDs2gJlkwPvRXpTc0YFSL5rkMWwX6EMRhUj7rEaAS32vBXmxkB56AV9+ZODedHVEC7el/2/GUJKqxLh1rJ8aaNtrnev4crg==
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700016)(1800799024)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: lcXU5lYsxFe1iIOSdUkCjkSL/U52yPg7JRcAMU0cLSnnY8NsGp6ADxAQmha4pO4+QsYmsxrgf78zWyMyVT78efDRppL16fUHZCevghQL639/m8l+QjQThmICtZljHyZH1yhvk4I4+lQlkB2AuFa+KVDRzAUzvTK6VQbmbtw1BWuZtsg3b/yNPuPvutbwCaudfeDRHWAmUG6GAMS6G0iI0f1nIU0vFq0s/Cqo45WgpfxN4/YzC1Cpu1tgOODqJG0XGAH7LBHz8HMM0IXnyfwn9dNTgxm/bD3ov7SIg50ywo7W/0621sHmPMFc82sxy5H2QTK4/+se4nCUhPhGBqyZ/9N83kfQghmGEwrE39sfB4+NAdgsjcTmnB2Lkh4erPvvl2Dt//GOXCO9skW3fTDSd/T+KEhOUx8r03QXH9RBaaXjWlwTFQ557FwEw5Te4Sls
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2026 05:39:07.1672
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ec37c2c-c627-4741-8d8e-08de7f308367
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001D4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR10MB5913
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_223912_627571_8C587C1F 
X-CRM114-Status: GOOD (  16.22  )
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

Add device tree overlay to enable ICSSG0 dual EMAC support on AM642 EVM.
This overlay enables both ICSSG0 Ethernet interfaces (port0 and port1) in
dual EMAC mode.

Users can combine this with the existing ICSSG1 overlay to enable all four
ICSSG interfaces if needed.

Signed-off-by: Meghana Malladi <m-malladi@ti.com>
---

v3-v2
- Remove the aliases as they are not applicable for the overlay
- Address all comments from Vignesh Raghavendra <vigneshr@ti.com> and ran DT checks

 arch/arm64/boot/dts/ti/Makefile               |   4 +
 .../boot/dts/ti/k3-am642-evm-icssg0.dtso      | 168 ++++++++++++++++++
 2 files changed, 172 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am642-evm-icssg0.dtso

diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
index ba01a929e06f..d2cd124a5b08 100644
--- a/arch/arm64/boot/dts/ti/Makefile
+++ b/arch/arm64/boot/dts/ti/Makefile
@@ -62,6 +62,7 @@ dtb-$(CONFIG_ARCH_K3) += k3-am62x-sk-hdmi-audio.dtbo
 
 # Boards with AM64x SoC
 dtb-$(CONFIG_ARCH_K3) += k3-am642-evm.dtb
+dtb-$(CONFIG_ARCH_K3) += k3-am642-evm-icssg0.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am642-evm-icssg1-dualemac.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am642-evm-icssg1-dualemac-mii.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am642-evm-pcie0-ep.dtbo
@@ -218,6 +219,8 @@ k3-am62p5-sk-csi2-ov5640-dtbs := k3-am62p5-sk.dtb \
 	k3-am62x-sk-csi2-ov5640.dtbo
 k3-am62p5-sk-csi2-tevi-ov5640-dtbs := k3-am62p5-sk.dtb \
 	k3-am62x-sk-csi2-tevi-ov5640.dtbo
+k3-am642-evm-icssg0-dtbs := \
+	k3-am642-evm.dtb k3-am642-evm-icssg0.dtbo
 k3-am642-evm-icssg1-dualemac-dtbs := \
 	k3-am642-evm.dtb k3-am642-evm-icssg1-dualemac.dtbo
 k3-am642-evm-icssg1-dualemac-mii-dtbs := \
@@ -306,6 +309,7 @@ dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
 	k3-am62p5-sk-csi2-imx219.dtb \
 	k3-am62p5-sk-csi2-ov5640.dtb \
 	k3-am62p5-sk-csi2-tevi-ov5640.dtb \
+	k3-am642-evm-icssg0.dtb \
 	k3-am642-evm-icssg1-dualemac.dtb \
 	k3-am642-evm-icssg1-dualemac-mii.dtb \
 	k3-am642-evm-pcie0-ep.dtb \
diff --git a/arch/arm64/boot/dts/ti/k3-am642-evm-icssg0.dtso b/arch/arm64/boot/dts/ti/k3-am642-evm-icssg0.dtso
new file mode 100644
index 000000000000..f19acf1896c3
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am642-evm-icssg0.dtso
@@ -0,0 +1,168 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/**
+ * DT overlay for enabling ICSSG0 dual EMAC on AM642 EVM
+ *
+ * AM642 EVM Product link: https://www.ti.com/tool/TMDS64EVM
+ * DP83TG720 daughter card link: https://www.ti.com/tool/DP83TG720-IND-SPE-EVM
+ *
+ * Copyright (C) 2020-2026 Texas Instruments Incorporated - https://www.ti.com/
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include "k3-pinctrl.h"
+
+&{/} {
+	icssg0_eth: icssg0-eth {
+		compatible = "ti,am642-icssg-prueth";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pru_icssg0_rgmii1_pins_default>, <&pru_icssg0_rgmii2_pins_default>;
+		sram = <&oc_sram>;
+
+		dmas = <&main_pktdma 0xc100 0>, /* egress slice 0 */
+		       <&main_pktdma 0xc101 0>, /* egress slice 0 */
+		       <&main_pktdma 0xc102 0>, /* egress slice 0 */
+		       <&main_pktdma 0xc103 0>, /* egress slice 0 */
+		       <&main_pktdma 0xc104 0>, /* egress slice 1 */
+		       <&main_pktdma 0xc105 0>, /* egress slice 1 */
+		       <&main_pktdma 0xc106 0>, /* egress slice 1 */
+		       <&main_pktdma 0xc107 0>, /* egress slice 1 */
+		       <&main_pktdma 0x4100 0>, /* ingress slice 0 */
+		       <&main_pktdma 0x4101 0>; /* ingress slice 1 */
+		dma-names = "tx0-0", "tx0-1", "tx0-2", "tx0-3",
+			    "tx1-0", "tx1-1", "tx1-2", "tx1-3",
+			    "rx0", "rx1";
+
+		interrupt-parent = <&icssg0_intc>;
+		interrupts = <24 0 2>, <25 1 3>;
+		interrupt-names = "tx_ts0", "tx_ts1";
+
+		ti,prus = <&pru0_0>, <&rtu0_0>, <&tx_pru0_0>, <&pru0_1>, <&rtu0_1>, <&tx_pru0_1>;
+		firmware-name = "ti-pruss/am64x-sr2-pru0-prueth-fw.elf",
+				"ti-pruss/am64x-sr2-rtu0-prueth-fw.elf",
+				"ti-pruss/am64x-sr2-txpru0-prueth-fw.elf",
+				"ti-pruss/am64x-sr2-pru1-prueth-fw.elf",
+				"ti-pruss/am64x-sr2-rtu1-prueth-fw.elf",
+				"ti-pruss/am64x-sr2-txpru1-prueth-fw.elf";
+
+		ti,pruss-gp-mux-sel = <2>,	/* MII mode */
+				      <2>,
+				      <2>,
+				      <2>,	/* MII mode */
+				      <2>,
+				      <2>;
+
+		ti,mii-g-rt = <&icssg0_mii_g_rt>;
+		ti,mii-rt = <&icssg0_mii_rt>;
+		ti,iep = <&icssg0_iep0>,  <&icssg0_iep1>;
+		ti,pa-stats = <&icssg0_pa_stats>;
+
+		ethernet-ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			icssg0_emac0: port@0 {
+				reg = <0>;
+				phy-handle = <&icssg0_phy00>;
+				phy-mode = "rgmii-id";
+				ti,syscon-rgmii-delay = <&main_conf 0x4100>;
+				/* Filled in by bootloader */
+				local-mac-address = [00 00 00 00 00 00];
+			};
+
+			icssg0_emac1: port@1 {
+				reg = <1>;
+				phy-handle = <&icssg0_phy01>;
+				phy-mode = "rgmii-id";
+				ti,syscon-rgmii-delay = <&main_conf 0x4104>;
+				/* Filled in by bootloader */
+				local-mac-address = [00 00 00 00 00 00];
+			};
+		};
+	};
+};
+
+&main_pmx0 {
+	pru_icssg0_mdio_pins_default: pru-icssg0-mdio-pins {
+		pinctrl-single,pins = <
+			/* (P3) PRG0_MDIO0_MDC */
+			AM64X_IOPAD(0x0204, PIN_OUTPUT, 0)
+			/* (P2) PRG0_MDIO0_MDIO */
+			AM64X_IOPAD(0x0200, PIN_INPUT, 0)
+			/* (P16) GPIO0_32 - GPMC0_ADVn_ALE - GPIO_ETH0/1_RESETn# */
+			AM64X_IOPAD(0x0084, PIN_OUTPUT, 7)
+		>;
+	};
+
+	pru_icssg0_rgmii1_pins_default: pru-icssg0-rgmii1-pins {
+		pinctrl-single,pins = <
+			AM64X_IOPAD(0x0160, PIN_INPUT, 2)  /* (Y1) PRG0_PRU0_GPO0.PRG0_RGMII1_RD0 */
+			AM64X_IOPAD(0x0164, PIN_INPUT, 2)  /* (R4) PRG0_PRU0_GPO1.PRG0_RGMII1_RD1 */
+			AM64X_IOPAD(0x0168, PIN_INPUT, 2)  /* (U2) PRG0_PRU0_GPO2.PRG0_RGMII1_RD2 */
+			AM64X_IOPAD(0x016c, PIN_INPUT, 2)  /* (V2) PRG0_PRU0_GPO3.PRG0_RGMII1_RD3 */
+			AM64X_IOPAD(0x0178, PIN_INPUT, 2)  /* (T3) PRG0_PRU0_GPO6.PRG0_RGMII1_RXC */
+			AM64X_IOPAD(0x0170, PIN_INPUT, 2)  /* (AA2) PRG0_PRU0_GPO4.PRG0_RGMII1_RX_CTL */
+			AM64X_IOPAD(0x018c, PIN_OUTPUT, 2) /* (Y3) PRG0_PRU0_GPO11.PRG0_RGMII1_TD0 */
+			AM64X_IOPAD(0x0190, PIN_OUTPUT, 2) /* (AA3) PRG0_PRU0_GPO12.PRG0_RGMII1_TD1 */
+			AM64X_IOPAD(0x0194, PIN_OUTPUT, 2) /* (R6) PRG0_PRU0_GPO13.PRG0_RGMII1_TD2 */
+			AM64X_IOPAD(0x0198, PIN_OUTPUT, 2) /* (V4) PRG0_PRU0_GPO14.PRG0_RGMII1_TD3 */
+			AM64X_IOPAD(0x01a0, PIN_OUTPUT, 2) /* (U4) PRG0_PRU0_GPO16.PRG0_RGMII1_TXC */
+			AM64X_IOPAD(0x019c, PIN_OUTPUT, 2) /* (T5) PRG0_PRU0_GPO15.PRG0_RGMII1_TX_CTL */
+		>;
+	};
+
+	pru_icssg0_rgmii2_pins_default: pru-icssg0-rgmii2-pins {
+		pinctrl-single,pins = <
+			AM64X_IOPAD(0x01b0, PIN_INPUT, 2)  /* (Y2) PRG0_PRU1_GPO0.PRG0_RGMII2_RD0 */
+			AM64X_IOPAD(0x01b4, PIN_INPUT, 2)  /* (W2) PRG0_PRU1_GPO1.PRG0_RGMII2_RD1 */
+			AM64X_IOPAD(0x01b8, PIN_INPUT, 2)  /* (V3) PRG0_PRU1_GPO2.PRG0_RGMII2_RD2 */
+			AM64X_IOPAD(0x01bc, PIN_INPUT, 2)  /* (T4) PRG0_PRU1_GPO3.PRG0_RGMII2_RD3 */
+			AM64X_IOPAD(0x01c8, PIN_INPUT, 2)  /* (R5) PRG0_PRU1_GPO6.PRG0_RGMII2_RXC */
+			AM64X_IOPAD(0x01c0, PIN_INPUT, 2)  /* (W3) PRG0_PRU1_GPO4.PRG0_RGMII2_RX_CTL */
+			AM64X_IOPAD(0x01dc, PIN_OUTPUT, 2) /* (W4) PRG0_PRU1_GPO11.PRG0_RGMII2_TD0 */
+			AM64X_IOPAD(0x01e0, PIN_OUTPUT, 2) /* (Y4) PRG0_PRU1_GPO12.PRG0_RGMII2_TD1 */
+			AM64X_IOPAD(0x01e4, PIN_OUTPUT, 2) /* (T6) PRG0_PRU1_GPO13.PRG0_RGMII2_TD2 */
+			AM64X_IOPAD(0x01e8, PIN_OUTPUT, 2) /* (U6) PRG0_PRU1_GPO14.PRG0_RGMII2_TD3 */
+			AM64X_IOPAD(0x01f0, PIN_OUTPUT, 2) /* (AA4) PRG0_PRU1_GPO16.PRG0_RGMII2_TXC */
+			AM64X_IOPAD(0x01ec, PIN_OUTPUT, 2) /* (U5) PRG0_PRU1_GPO15.PRG0_RGMII2_TX_CTL */
+		>;
+	};
+
+	icssg0_iep0_pins_default: icssg0-iep0-pins {
+		pinctrl-single,pins = <
+			AM64X_IOPAD(0x01ac, PIN_OUTPUT, 2) /* (W1) PRG0_PRU0_GPO19.PRG0_IEP0_EDC_SYNC_OUT0 */
+		>;
+	};
+};
+
+&icssg0_mdio {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pru_icssg0_mdio_pins_default>;
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	icssg0_phy00: ethernet-phy@0 {
+		reg = <0x0>;
+	};
+
+	icssg0_phy01: ethernet-phy@a {
+		reg = <0xa>;
+	};
+};
+
+&icssg0_iep0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&icssg0_iep0_pins_default>;
+};
+
+&main_gpio0 {
+	phy-line-hog {
+		gpio-hog;
+		gpios = <32 GPIO_ACTIVE_HIGH>;
+		output-high;
+		line-name = "phy-hog-line";
+	};
+};
-- 
2.43.0


