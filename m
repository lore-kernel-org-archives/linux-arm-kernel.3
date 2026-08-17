Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8213AC5DF66
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Aug 2026 10:53:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QnqL1jhWyigtOy8qSZQIO8ZgAGVVwsq5hn8b4Iisrf4=; b=Dw9nBwft0H4JcsbcKyyluyAnEf
	ummuYTQ+pBRShibegB7ZkaLIECpcYxyGgVOfCol5a90SuZAN6aKK4esvVopAdut09Q1ZCCpeIvuxc
	L7KrBCfg/KerxHLRJwsPZ6y7JkAuCpf9zjtErWpBVZkRNkMRxswiBmq/Gd3d6B7/KPWK6LuGftO/C
	E/rOQgGl7P/yAkx2I1U8jeUgU7fOgov1K/Fi+hWN2bNkWQ0bf9Z66goTufYvMyfWSO3Hs6OhoQWuu
	lIsTYslP/MwBnx0OycYGkfUpDNGS3n0/Q4MG1NRWdeED/r3c4l3sTmg10nkGHfl5HL8v2Yoilwxfw
	WQ556pbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvuxw-00000005yAI-3cu9;
	Mon, 17 Aug 2026 10:53:16 +0000
Received: from mail-westus3azlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c107::3] helo=PH0PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvuxt-00000005y82-1F4H
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Aug 2026 10:53:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PP+4uf1oNJPM4Ci2F3UO+3qYp3W4XfJ7Dnmj+WetWO2pfyizfHi7nnUamnhzxBABuaB40kNuHxyIB0loY7SgJuhyNftgunVfeiu5nG/iZa6JdSm7UmxZ+G9VL/A7zM1NW+8TblIAphXFJ4DkDx9UiODbMmdiYsHcvppHdw2K1y5q7OBQrcCeHoZ2kaYbrdMWlG7Pz+HM9kxQ0Owv5feuAzJre0b8M95lyEyp/AwRdyR8JLcbGB/YcgFhcoF6t43P9XvcbgW6pWc/sJEi9cQzqB7cCTPbIt/z8MMIJiuAf+evrJFuzppVe7nMYgica7av6YZV//fAb/0OGDzaa7o3/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QnqL1jhWyigtOy8qSZQIO8ZgAGVVwsq5hn8b4Iisrf4=;
 b=fTDMi3hLYUnLeovgUkyoEG2KK9hSJ2XDbkB4FNdrg7fEFuZrgQAR0n4eCn/UyAfyEBIMODpDymHbvRTffbhaO3JjxsatAATqLM/TUyZ8usewgpYEYMl436gkasrDU1L3ptA/8FEiiJqct2aQMA+0r+Eikxg7gjA79ZGzKrEYMCDKXPMzdSdugUyqYgn5K8nygYWCLZthZPEOHYad0SAuUfMRSVpcUAWWrn5+0S3goLMbiRsPH+jSYjzimqKhO0Vgfct67gonrCAZ1EUGbXdf4G8G0yQLX7bOTPKtbJjQIzjKnJ8ZWrE0vZLiJsSSRULaDyWB9ykisBwh0jQ3INtgGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linutronix.de smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QnqL1jhWyigtOy8qSZQIO8ZgAGVVwsq5hn8b4Iisrf4=;
 b=DJ960OVjGFV48UXWgBmtmCm1nuREuTYHKxkdy8BwuT5vxEbfjaWGJ6btQl33JeixAa+pFD/G9RIFqpv5zRoC25RHQC1M5i47JQZqgPK1MeYTHMzKqDryp5EDTkTHCIavvaJwG2aafTyzBfw3IM3ZeogBRxzzTieWTtxF6cJRtiU=
Received: from SJ0PR03CA0157.namprd03.prod.outlook.com (2603:10b6:a03:338::12)
 by DM4PR12MB6638.namprd12.prod.outlook.com (2603:10b6:8:b5::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.17; Mon, 17 Aug 2026 10:53:03 +0000
Received: from SJ5PEPF000001D0.namprd05.prod.outlook.com
 (2603:10b6:a03:338:cafe::3c) by SJ0PR03CA0157.outlook.office365.com
 (2603:10b6:a03:338::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.17 via Frontend Transport; Mon,
 17 Aug 2026 10:53:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ5PEPF000001D0.mail.protection.outlook.com (10.167.242.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.3 via Frontend Transport; Mon, 17 Aug 2026 10:53:03 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 17 Aug
 2026 05:53:02 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 17 Aug
 2026 05:53:01 -0500
Received: from xhdtunimkar40.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.45 via Frontend
 Transport; Mon, 17 Aug 2026 05:52:59 -0500
From: Tushar Nimkar <tushar.nimkar@amd.com>
To: Thomas Gleixner <tglx@linutronix.de>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
CC: Michal Simek <michal.simek@amd.com>, Anirudha Sarangi
	<anirudha.sarangi@amd.com>, <git-dev@amd.com>, Tushar Nimkar
	<tushar.nimkar@amd.com>
Subject: [PATCH 2/2] irqchip: Add Xilinx Versal NET SMMU CSR interrupt controller driver
Date: Mon, 17 Aug 2026 16:22:51 +0530
Message-ID: <20260817105251.1557770-1-tushar.nimkar@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D0:EE_|DM4PR12MB6638:EE_
X-MS-Office365-Filtering-Correlation-Id: 55386b49-1baf-42f9-756c-08defc4db64f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|23010399003|376014|36860700016|18002099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info: RjlT8Bf16h/7yYxB+npsmsGV0rNoui0FncOeoGLRQWCWc8vgVBv49ZbEkRd+khKcv+UR74GzwhcMSofIFDdoTJSdo8pBEsaB15myIIRz0REz87VcPCkfqnmMexXvwgKxy/vyD1TzMdABUP7UhgDouXNlgpUVsqCzxa+Zt4LP1OuRZi/P0WPEDWxFXFVW2X5etKKjI/t9BmlUEhX5tgfOC+6UvJcAmSZ0qhoOledE11jmSoxBVdWDeLYpvh9rdc4fWvW5RMod05vI9fmeA1Rx6lJNhp+//SrGRN99QBzwNbjBuOjb8abBgBY3DNUr4damPxfZQlmM/hVpCYztQuFvoAuId0PgRbn8KjfNHOrhPBfee0n77AlB0TnI1kDGELL7bnRAZ8fk8Frahl4Tv0nwYfbx3VRYUdW8+5THNJUrYf2owFPe9MpfJwLc2ARHDVQ/xnKJJMmN1QutdnCdei6LawkJNluGKqiz5Mn/mW/ffwNshYqDF7LH4OQQRBi4H20s+lrr2PszeMtXs5GKqD6XBh4IzPDkggs3Df81nE6iER5vclRqa82w4ohMfdBAZ2cM9CbvjtwmWLLzPVQ02tPOlTRpduxJOcHdwx0IDtfpBnRHg9w+7MlJoYGZzHaGdU2SzB539GHM5P/hCALeHRLzTJ3kOhrccPdg3DewrJLGzC9FyI9a2dj2/hZ5BrsGEsrcBINU1tlNbLsp2Z3HX5Dybg==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(23010399003)(376014)(36860700016)(18002099003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: LncLvw19NXNNCXqWAU25Gv6y0DEbSQDpRjJciX1wO2d+hvDHhaxV5CDIXeRV9KxFZtW0i+0XrGJ4tWRxHY3RlnZQChFqNnoo89JxRFx8xWEnxlrbW430vgifi/QjMRx1+MhJF3zrdbq/ECjsfiTLHLtq5isGfZwkjEPfUwmMTO8eb3cR/5O4/pFElEcKtqDyi53i3Yhd+6zpUWaEV+FZsqGzH23sYc6ndrDWReAEveiFDm/QCREUlz3bbV5waCbxvSnrZLNlWvIivi22FE6a+vm3PNHjG+0YDNKcV+TsifFaxzY1X9yGydixSfpvwkz6Ctg9IEpkf4zrjmzIsfUVrb9l/kF0oNcHYCqMDtrfLq0yR0dKbaj3/lQ5noGAB/eE1ymmUFmJL0RYPkgN7b0FPpeqYCD3c/rA6bAJTEk4MLy60sOFuGEFAR37gB0ysXCE
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2026 10:53:03.3188
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 55386b49-1baf-42f9-756c-08defc4db64f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001D0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6638
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_035313_419668_49C550DD 
X-CRM114-Status: GOOD (  27.77  )
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

From: Anirudha Sarangi <anirudha.sarangi@amd.com>

The Xilinx Versal NET SoC implements a Control and Status Register (CSR)
block in front of the ARM SMMUv3 to manage EVENTQ, PRIQ and GLOBAL
interrupts. Interrupts are enabled, cleared, and acknowledged
through this block by writing to the relevant registers. Once an
interrupt is acknowledged, it is forwarded to the parent interrupt
controller for further processing.

Add an irqchip driver for the CSR block. The driver registers as an
interrupt controller and chains to the upstream SMMUv3 driver, so
that the standard SMMUv3 driver does not require modification while still
supporting Xilinx SoCs.

The CSR block can also gate the SMMUv3 CMDQ_SYNC completion interrupt
(bit 1), but it is intentionally left unsupported. The Linux arm-smmu-v3
driver signals CMDQ_SYNC completion via polling or MSI and never requests
a wired CMD_SYNC interrupt, so there is no in-kernel consumer for it.
Exposing it as a child line would only risk spurious, never-acked
interrupts, and it is omitted from the DT binding for the same reason.

This driver is intended to operate in conjunction with the ARM SMMUv3
driver and the kernel's IOMMU DMA infrastructure. These dependencies
are not selected directly in Kconfig to avoid introducing dependency
recursion.

Signed-off-by: Anirudha Sarangi <anirudha.sarangi@amd.com>
Co-developed-by: Tushar Nimkar <tushar.nimkar@amd.com>
Signed-off-by: Tushar Nimkar <tushar.nimkar@amd.com>
---
 MAINTAINERS                           |  10 ++
 drivers/irqchip/Kconfig               |  10 ++
 drivers/irqchip/Makefile              |   1 +
 drivers/irqchip/irq-xilinx-smmu-csr.c | 225 ++++++++++++++++++++++++++
 4 files changed, 246 insertions(+)
 create mode 100644 drivers/irqchip/irq-xilinx-smmu-csr.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 5c9c9b5cf44a..bf790567e756 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -29881,6 +29881,16 @@ F:	Documentation/misc-devices/xilinx_sdfec.rst
 F:	drivers/misc/xilinx_sdfec.c
 F:	include/uapi/misc/xilinx_sdfec.h
 
+XILINX SMMU CSR IRQ DRIVER
+M:	Anirudha Sarangi <anirudha.sarangi@amd.com>
+M:	Tushar Nimkar <tushar.nimkar@amd.com>
+L:	git@amd.com
+L:	linux-arm-kernel@lists.infradead.org
+L:	linux-kernel@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/interrupt-controller/xlnx,versal-net-smmu-csr.yaml
+F:	drivers/irqchip/irq-xilinx-smmu-csr.c
+
 XILINX TRNG DRIVER
 M:	Mounika Botcha <mounika.botcha@amd.com>
 M:	Harsh Jain <h.jain@amd.com>
diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index 20b77fbc51ee..a08bda407a63 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -840,4 +840,14 @@ config SUNPLUS_SP7021_INTC
 	  chained controller, routing all interrupt source in P-Chip to
 	  the primary controller on C-Chip.
 
+config IRQCHIP_XILINX_SMMU_CSR
+	bool "Xilinx SMMU CSR Interrupt Driver"
+	depends on ARCH_ZYNQMP
+	select IRQ_DOMAIN
+	help
+	  This driver does the initial handling of SMMU interrupts before
+	  forwarding them to the ARM SMMU v3 driver.  It is intended for
+	  ZynqMP-class platforms where a vendor CSR block mediates SMMU
+	  interrupts.
+
 endmenu
diff --git a/drivers/irqchip/Makefile b/drivers/irqchip/Makefile
index ab33cccd8471..16a5fd126c9a 100644
--- a/drivers/irqchip/Makefile
+++ b/drivers/irqchip/Makefile
@@ -135,3 +135,4 @@ obj-$(CONFIG_APPLE_AIC)			+= irq-apple-aic.o
 obj-$(CONFIG_MCHP_EIC)			+= irq-mchp-eic.o
 obj-$(CONFIG_SOPHGO_SG2042_MSI)		+= irq-sg2042-msi.o
 obj-$(CONFIG_SUNPLUS_SP7021_INTC)	+= irq-sp7021-intc.o
+obj-$(CONFIG_IRQCHIP_XILINX_SMMU_CSR)	+= irq-xilinx-smmu-csr.o
diff --git a/drivers/irqchip/irq-xilinx-smmu-csr.c b/drivers/irqchip/irq-xilinx-smmu-csr.c
new file mode 100644
index 000000000000..189185d89746
--- /dev/null
+++ b/drivers/irqchip/irq-xilinx-smmu-csr.c
@@ -0,0 +1,225 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Xilinx Versal Net SMMU CSR interrupt controller driver
+ *
+ * Copyright (C) 2026 Advanced Micro Devices, Inc.
+ *
+ * Vendor CSR block that gates the ARM SMMUv3 wired interrupts. Chains
+ * off the single GIC parent line and demultiplexes the CSR status into
+ * three children (eventq, gerror, priq), each enabled/acked
+ * via SMMU_CSR_IER/IDR/ISR that the ARM SMMUv3 driver requests individually.
+ */
+
+#include <linux/bitops.h>
+#include <linux/io.h>
+#include <linux/irqchip.h>
+#include <linux/irqchip/chained_irq.h>
+#include <linux/of_address.h>
+#include <linux/of_irq.h>
+#include <linux/slab.h>
+#include <linux/spinlock.h>
+
+/* Interrupt types */
+#define SMMU_INTR_EVENT		BIT(0)
+#define SMMU_INTR_GLOBAL	BIT(2)
+#define SMMU_INTR_PRI		BIT(3)
+
+/* Mask for all SMMU interrupts */
+#define SMMU_INTR_ALL		(SMMU_INTR_EVENT | \
+				 SMMU_INTR_GLOBAL | SMMU_INTR_PRI)
+
+#define SMMU_CSR_ISR		0x24	/* Interrupt Status */
+#define SMMU_CSR_IER		0x2c	/* Interrupt Enable */
+#define SMMU_CSR_IDR		0x30	/* Interrupt Disable */
+
+/**
+ * struct xilinx_smmu_csr - SMMU CSR interrupt controller context
+ * @base: MMIO base address of the CSR registers
+ * @domain: IRQ domain for the child interrupts
+ * @parent_irq: parent (GIC) IRQ this block is chained to
+ * @lock: protects the SMMU_CSR_IER/IDR/ISR read and writes
+ */
+struct xilinx_smmu_csr {
+	void __iomem		*base;
+	struct irq_domain	*domain;
+	int			parent_irq;
+	raw_spinlock_t		lock;
+};
+
+enum xilinx_smmu_csr_irq {
+	SMMU_CSR_IRQ_EVENTQ = 0,
+	SMMU_CSR_IRQ_GERROR = 2,
+	SMMU_CSR_IRQ_PRIQ = 3,
+	SMMU_CSR_IRQ_NR,
+};
+
+static u32 xilinx_smmu_csr_hwirq_mask(irq_hw_number_t hwirq)
+{
+	if (hwirq >= SMMU_CSR_IRQ_NR)
+		return 0;
+
+	return BIT(hwirq) & SMMU_INTR_ALL;
+}
+
+static void xilinx_smmu_csr_irq_mask(struct irq_data *d)
+{
+	struct xilinx_smmu_csr *csr = irq_data_get_irq_chip_data(d);
+	u32 mask = xilinx_smmu_csr_hwirq_mask(d->hwirq);
+
+	if (!mask)
+		return;
+
+	raw_spin_lock(&csr->lock);
+	writel(mask, csr->base + SMMU_CSR_IDR);
+	raw_spin_unlock(&csr->lock);
+}
+
+static void xilinx_smmu_csr_irq_unmask(struct irq_data *d)
+{
+	struct xilinx_smmu_csr *csr = irq_data_get_irq_chip_data(d);
+	u32 mask = xilinx_smmu_csr_hwirq_mask(d->hwirq);
+
+	if (!mask)
+		return;
+
+	raw_spin_lock(&csr->lock);
+	writel(mask, csr->base + SMMU_CSR_IER);
+	raw_spin_unlock(&csr->lock);
+}
+
+static void xilinx_smmu_csr_irq_ack(struct irq_data *d)
+{
+	struct xilinx_smmu_csr *csr = irq_data_get_irq_chip_data(d);
+	u32 mask = xilinx_smmu_csr_hwirq_mask(d->hwirq);
+
+	if (!mask)
+		return;
+
+	raw_spin_lock(&csr->lock);
+	writel(mask, csr->base + SMMU_CSR_ISR);
+	raw_spin_unlock(&csr->lock);
+}
+
+static struct irq_chip xilinx_smmu_csr_chip = {
+	.name		= "xlnx-smmu-csr",
+	.irq_mask	= xilinx_smmu_csr_irq_mask,
+	.irq_unmask	= xilinx_smmu_csr_irq_unmask,
+	.irq_ack	= xilinx_smmu_csr_irq_ack,
+};
+
+static void xilinx_smmu_csr_irq_handler(struct irq_desc *desc)
+{
+	struct xilinx_smmu_csr *csr = irq_desc_get_handler_data(desc);
+	struct irq_chip *chip = irq_desc_get_chip(desc);
+	u32 status, pending;
+
+	chained_irq_enter(chip, desc);
+	raw_spin_lock(&csr->lock);
+	status = readl(csr->base + SMMU_CSR_ISR);
+	raw_spin_unlock(&csr->lock);
+
+	/* Only service sources we support; SMMU_CSR_ISR latches raw status */
+	pending = status & SMMU_INTR_ALL;
+
+	while (pending) {
+		irq_hw_number_t hwirq = __ffs(pending);
+		int ret;
+
+		ret = generic_handle_domain_irq(csr->domain, hwirq);
+		if (ret) {
+			raw_spin_lock(&csr->lock);
+			writel(BIT(hwirq), csr->base + SMMU_CSR_ISR);
+			raw_spin_unlock(&csr->lock);
+			pr_err_ratelimited("xilinx-smmu-csr: Failed to handle domain IRQ %lu: %d\n",
+					   hwirq, ret);
+		}
+
+		pending &= ~BIT(hwirq);
+	}
+
+	chained_irq_exit(chip, desc);
+}
+
+static int xilinx_smmu_csr_domain_map(struct irq_domain *d, unsigned int virq,
+				      irq_hw_number_t hwirq)
+{
+	struct xilinx_smmu_csr *csr = d->host_data;
+
+	if (!xilinx_smmu_csr_hwirq_mask(hwirq))
+		return -EINVAL;
+
+	irq_set_chip_and_handler(virq, &xilinx_smmu_csr_chip, handle_level_irq);
+	irq_set_chip_data(virq, csr);
+	irq_set_status_flags(virq, IRQ_LEVEL);
+
+	return 0;
+}
+
+static const struct irq_domain_ops xilinx_smmu_csr_domain_ops = {
+	.map	= xilinx_smmu_csr_domain_map,
+	.xlate	= irq_domain_xlate_onecell,
+};
+
+static int __init xilinx_smmu_csr_init(struct device_node *node,
+				       struct device_node *parent)
+{
+	struct xilinx_smmu_csr *csr;
+	int ret;
+
+	if (WARN_ON_ONCE(!parent))
+		return -EINVAL;
+
+	if (irq_find_matching_fwnode(of_fwnode_handle(node),
+				     DOMAIN_BUS_ANY))
+		return -ENODEV;
+
+	csr = kzalloc(sizeof(*csr), GFP_KERNEL);
+	if (!csr)
+		return -ENOMEM;
+
+	raw_spin_lock_init(&csr->lock);
+
+	csr->base = of_iomap(node, 0);
+	if (!csr->base) {
+		ret = -ENOMEM;
+		goto free;
+	}
+
+	/* Start from a known state: all sources disabled, latches cleared. */
+	writel(SMMU_INTR_ALL, csr->base + SMMU_CSR_IDR);
+	writel(SMMU_INTR_ALL, csr->base + SMMU_CSR_ISR);
+
+	csr->domain = irq_domain_create_linear(of_fwnode_handle(node), SMMU_CSR_IRQ_NR,
+					       &xilinx_smmu_csr_domain_ops,
+					       csr);
+	if (!csr->domain) {
+		pr_err("%pOF: failed to create irq domain\n", node);
+		ret = -ENOMEM;
+		goto unmap;
+	}
+
+	csr->parent_irq = irq_of_parse_and_map(node, 0);
+	if (!csr->parent_irq) {
+		pr_err("%pOF: failed to map parent irq\n", node);
+		ret = -EINVAL;
+		goto remove_domain;
+	}
+
+	irq_set_chained_handler_and_data(csr->parent_irq,
+					 xilinx_smmu_csr_irq_handler, csr);
+
+	pr_debug("%pOF: Xilinx SMMU CSR interrupt controller registered\n", node);
+
+	return 0;
+
+remove_domain:
+	irq_domain_remove(csr->domain);
+unmap:
+	iounmap(csr->base);
+free:
+	kfree(csr);
+	return ret;
+}
+
+IRQCHIP_DECLARE(xilinx_smmu_csr, "xlnx,versal-net-smmu-csr",
+		xilinx_smmu_csr_init);
-- 
2.34.1


