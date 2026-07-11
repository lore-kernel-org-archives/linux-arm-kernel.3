Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A35EC44506
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Jul 2026 00:53:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mlySgRa3aXx13KatwQ5/JqusdclKYsr1UAq0hIkrSTo=; b=A5IVAksNTiPmNUiioAtNS2ggpx
	n3ycFk1Md+JDEPW4SgJa/Lud7m7lKfafNZuzqYysWZ5Id+3Oufpj54RQkQrGcAzfoW3JjjjtEqXWE
	6A6eKbAIYBu402b8a6L5ch1qXdR+QSvTB8dqV4qWIjWFfD+3MEpjH3InxRI80aY7P0e2uJXyB53q0
	aBkKVqz8ZepbfMCRA6P3xHFb0P3m6qXnb1nS2a4Od9XNEwHZEbs+R1IVNoz4cwMo7yb6qCpBIvVrk
	WIjDCotKYLMq88Wu51yPNodPQRQc3f8/Mk7qBU5KherImrSC++8+7myCUaoNuKcsF9Ea6MUMX7qlz
	vFQfUPAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiLyA-000000064Da-0udj;
	Sat, 11 Jul 2026 00:53:26 +0000
Received: from mail-eastusazlp17011000f.outbound.protection.outlook.com ([2a01:111:f403:c100::f] helo=BL2PR02CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiLy5-000000064A2-3RVJ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Jul 2026 00:53:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V3PIuKwzK2xiuHVFk/6a1JYDfXEMyvKGwlga8+ubTY0qndT5hV/w2d/MEqT/ZIiRt+6uCgrvzgDEYnkVusJr36uqVnGnBcBSATvBNl78qd/R0889I5+u9ZNxE5sLSj/e5X/ytQerS362LQFs/lHQBIUaTp4wkOQgKv+p9bMoeiiHgavrv4jPe3k4ts3PQWHOIwAFBkGIDA4ODzOT6cdSYYcAouT4rsP+rLVPM3GdzA63eKfiJvhXnjnHZl6ZK9e4Jjzzj2mLamSg1wUWqoTkv1EOXWULn6VT3JxDx8nUrQnj3Yevkel2Ld5cO61IkU56jF9ItLRoENKsVz3yapYjxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mlySgRa3aXx13KatwQ5/JqusdclKYsr1UAq0hIkrSTo=;
 b=v6Ontm29p1uwyKd5KQBUQ8vai7UcVcGg8iOpuiRzXKqJCPXVbQBmeen5xYWj2sJeX39LFfYpZ/vKwbYYXK5ME2IM7VBFvZX7BbkUlzSuHnKDLrLTmAiOePscgZ/D8kAx7D2SC29GerFErUozbvjXMMGBECSAB5zn0u7vmH5JgIKnM7cDf5SGUSo64ALnwBS9LMjUDpf/WHQR8F5wsEphcADR8XhUGXZsMtxcniupOGBuqp5Yd+m87mRHlNha4QYhRWvb/ThMqGdAW/GPGjMN4ZPxvrbgREfduDezQvqyS28kyagXdkwfGLKW8EhFF1edAr+D+D5XJPdQXilIVEfd7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mlySgRa3aXx13KatwQ5/JqusdclKYsr1UAq0hIkrSTo=;
 b=tZOuLfd3Ix8J4B2x7hMNBxulypdJjS32AUuSx5KZUDDDqoajxBi18eOOBpG7kvSMRergd7z9wAQtPpjwefTMNEOxDOytN9y+2TzryRFArdVEMrBLw1tVA3hIdt02Way40NXOkye0eRuSymPRgSFnxIiCOBPIoU4H4ns8eNIwpKnZXstUhAGKI21wFl2rPIXVC7oyzUOpyOvYRP8SXwSG0kAzo9erbYvcu3/mSoq8jHD63InJLbOIhcIWciNYTgRpOLTTXeqjNMUkf0IC96gNHgwl+hzWrdbIY0/lOvFS43NZo/jpLp08C2q1x3LwIA62c48puqyT05ryG47bU6ecDA==
Received: from SN7PR18CA0028.namprd18.prod.outlook.com (2603:10b6:806:f3::11)
 by PH7PR12MB8039.namprd12.prod.outlook.com (2603:10b6:510:26a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.16; Sat, 11 Jul
 2026 00:53:11 +0000
Received: from SN1PEPF000397B4.namprd05.prod.outlook.com
 (2603:10b6:806:f3:cafe::85) by SN7PR18CA0028.outlook.office365.com
 (2603:10b6:806:f3::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.14 via Frontend Transport; Sat,
 11 Jul 2026 00:53:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SN1PEPF000397B4.mail.protection.outlook.com (10.167.248.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Sat, 11 Jul 2026 00:53:11 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 10 Jul
 2026 17:52:56 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 10 Jul
 2026 17:52:56 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.10) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Fri, 10 Jul 2026 17:52:55 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: <will@kernel.org>, <robin.murphy@arm.com>, <jgg@nvidia.com>
CC: <joro@8bytes.org>, <praan@google.com>, <kevin.tian@intel.com>,
	<smostafa@google.com>, <linux-arm-kernel@lists.infradead.org>,
	<iommu@lists.linux.dev>, <linux-kernel@vger.kernel.org>, <jamien@nvidia.com>
Subject: [PATCH v8 1/9] iommu/arm-smmu-v3: Do not enable EVTQ/PRIQ interrupts in kdump kernel
Date: Fri, 10 Jul 2026 17:52:42 -0700
Message-ID: <35000f29472b5e12114073d614168c251551ff0a.1783729633.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1783729633.git.nicolinc@nvidia.com>
References: <cover.1783729633.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B4:EE_|PH7PR12MB8039:EE_
X-MS-Office365-Filtering-Correlation-Id: 5bc54865-6fdf-4240-baec-08dedee6c828
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|1800799024|82310400026|23010399003|376014|11063799006|56012099006|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: E5Fq4LwfUaKwc7KHCtZtmnfo0c/nXZj2TSgtgcWvSYjdG7Oo2VMUGmZXJ4+FhM/Pmr1GDdPSlPNcU888AfXf2WTDVm7Y8eer1I9NVXcwXwzcyqqMBQQBNOFSxKsj2IR/psCSiSckrkn3LDYpBAYn973SfaPK7z7bsKwM/VnxfL0qjUyDZAt03UY72z+rHBmFLWU9qs5o/XPEwDkpDFWRmRfrJ3RihsTvHBtdXR5F2ZGnnYjE/MK+oPENc8jvej/t91VhjzSpzyoP636mkpqMHfDLBnpshrFGmd9viLInsEnCf/OVWRSthhmZ/4wqMveFLhSgPIVwswDjY6OjY3h3xs92f1qTjZOdxKEe1F0NltCgY51X/wK1WY5pS7OgScmx/kBzno2b7nGkhcQ4GMfeGa1t/Jww86BH5PF3AgCZJAwJmRBu+xOv+57TwvxG0WthDJ/qlYzqiMgqC3IZiofOvZSAJvC4Nw3srdU9nPrki+I6BsXfedJHssCRl/IAd/kWDYa6AR6UrH+Rm3j+ymqDgMf6X77xFLNJUFuEq8scHwrxDxf8g2Jq1cwZml0KpNcDUgoYFGDvPQl07j2Lfj0oiARBTsgraBpC6gm8jGXAIu7UqBcQNB53ox+FIAlx/50uATg1ewkCbUlaEURxJswGiyBFqMmEqMGP60gxbK1tmgqSWZfR9QfUXQARf4ZUJB5dcz2rr6ObydsT0+t7fr7Rvg==
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(82310400026)(23010399003)(376014)(11063799006)(56012099006)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: aXGqDFhGbUX8gSJ8RFtu3Hk+dpGXaCY5MVCf1/dmNnA0E0U8kLd5jADCmikfj/V9twBZ695GN9pJ1XVkGEr/NOqYiuM3gV0lH6D57alJdt98f/Bx52z5XL8uQq4coKPGcYErrcvs99dOkV2xZC9nvH6lkH5lJY3YgHios03v4dciW7Z7XNXri04eaDuIN/RGjY0pLHNS2FkpTFgwWURe0e1klbK6TmxEA4inXo+ttKRrUlL1ho6s/zachA8ID8ElU+WPg5hVZRqetRQjeFLVSeaqwWC0afInExK+F6Nh7tldnogs+fa7w5Q8WIpt3hcq0bjHfIFZAbV08bIKqX7BZt/E1jAd1/LtjV6mGHt4aABLo1yhIowQxjzGh0X5zA2ng7NdgHlu1OBMIt1Jk2sKCxF3nC/uUanFl71mIiV+cPbxcZZzy47YbQarFAe7TDoC
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2026 00:53:11.3547
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bc54865-6fdf-4240-baec-08dedee6c828
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF000397B4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8039
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_175321_862149_245794FA 
X-CRM114-Status: GOOD (  18.24  )
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

In kdump cases, the crashed kernel's CDs and page tables can be corrupted,
which could trigger event spamming. Also, we cannot serve page requests.

Skip the IRQ setup for EVTQ/PRIQ in arm_smmu_setup_irqs().

Skip their IRQ handler registration in unique-IRQ and combined-IRQ cases.

Note that arm_smmu_device_reset() at this point still enables EVTQEN/PRIQEN
transiently before clearing them. A following change will skip the entire
queue setup, removing that transient enable window.

Reviewed-by: Kevin Tian <kevin.tian@intel.com>
Reviewed-by: Pranjal Shrivastava <praan@google.com>
Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 58 ++++++++++++++-------
 1 file changed, 39 insertions(+), 19 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index a10affb483a4f..404790d2c7210 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -2294,7 +2294,11 @@ static irqreturn_t arm_smmu_combined_irq_thread(int irq, void *dev)
 
 static irqreturn_t arm_smmu_combined_irq_handler(int irq, void *dev)
 {
-	arm_smmu_gerror_handler(irq, dev);
+	irqreturn_t ret = arm_smmu_gerror_handler(irq, dev);
+
+	/* In kdump, EVTQ/PRIQ are disabled and there is no thread to wake */
+	if (is_kdump_kernel())
+		return ret;
 	return IRQ_WAKE_THREAD;
 }
 
@@ -4625,6 +4629,21 @@ static void arm_smmu_setup_unique_irqs(struct arm_smmu_device *smmu)
 	arm_smmu_setup_msis(smmu);
 
 	/* Request interrupt lines */
+	irq = smmu->gerr_irq;
+	if (irq) {
+		ret = devm_request_irq(smmu->dev, irq, arm_smmu_gerror_handler,
+				       0, "arm-smmu-v3-gerror", smmu);
+		if (ret < 0)
+			dev_warn(smmu->dev, "failed to enable gerror irq\n");
+	} else {
+		dev_warn(smmu->dev,
+			 "no gerr irq - errors will not be reported!\n");
+	}
+
+	/* No EVTQ/PRIQ interrupts in kdump -- queues are disabled */
+	if (is_kdump_kernel())
+		return;
+
 	irq = smmu->evtq.q.irq;
 	if (irq) {
 		ret = devm_request_threaded_irq(smmu->dev, irq, NULL,
@@ -4637,16 +4656,6 @@ static void arm_smmu_setup_unique_irqs(struct arm_smmu_device *smmu)
 		dev_warn(smmu->dev, "no evtq irq - events will not be reported!\n");
 	}
 
-	irq = smmu->gerr_irq;
-	if (irq) {
-		ret = devm_request_irq(smmu->dev, irq, arm_smmu_gerror_handler,
-				       0, "arm-smmu-v3-gerror", smmu);
-		if (ret < 0)
-			dev_warn(smmu->dev, "failed to enable gerror irq\n");
-	} else {
-		dev_warn(smmu->dev, "no gerr irq - errors will not be reported!\n");
-	}
-
 	if (smmu->features & ARM_SMMU_FEAT_PRI) {
 		irq = smmu->priq.q.irq;
 		if (irq) {
@@ -4667,7 +4676,7 @@ static void arm_smmu_setup_unique_irqs(struct arm_smmu_device *smmu)
 static int arm_smmu_setup_irqs(struct arm_smmu_device *smmu)
 {
 	int ret, irq;
-	u32 irqen_flags = IRQ_CTRL_EVTQ_IRQEN | IRQ_CTRL_GERROR_IRQEN;
+	u32 irqen_flags = IRQ_CTRL_GERROR_IRQEN;
 
 	/* Disable IRQs first */
 	ret = arm_smmu_write_reg_sync(smmu, 0, ARM_SMMU_IRQ_CTRL,
@@ -4682,19 +4691,30 @@ static int arm_smmu_setup_irqs(struct arm_smmu_device *smmu)
 		/*
 		 * Cavium ThunderX2 implementation doesn't support unique irq
 		 * lines. Use a single irq line for all the SMMUv3 interrupts.
+		 *
+		 * In kdump, EVTQ/PRIQ are disabled, so no threaded handling.
 		 */
-		ret = devm_request_threaded_irq(smmu->dev, irq,
-					arm_smmu_combined_irq_handler,
-					arm_smmu_combined_irq_thread,
-					IRQF_ONESHOT,
-					"arm-smmu-v3-combined-irq", smmu);
+		if (is_kdump_kernel())
+			ret = devm_request_irq(smmu->dev, irq,
+					       arm_smmu_combined_irq_handler, 0,
+					       "arm-smmu-v3-combined-irq",
+					       smmu);
+		else
+			ret = devm_request_threaded_irq(
+				smmu->dev, irq, arm_smmu_combined_irq_handler,
+				arm_smmu_combined_irq_thread, IRQF_ONESHOT,
+				"arm-smmu-v3-combined-irq", smmu);
 		if (ret < 0)
 			dev_warn(smmu->dev, "failed to enable combined irq\n");
 	} else
 		arm_smmu_setup_unique_irqs(smmu);
 
-	if (smmu->features & ARM_SMMU_FEAT_PRI)
-		irqen_flags |= IRQ_CTRL_PRIQ_IRQEN;
+	/* No EVTQ/PRIQ IRQ generation in kdump -- queues are disabled */
+	if (!is_kdump_kernel()) {
+		irqen_flags |= IRQ_CTRL_EVTQ_IRQEN;
+		if (smmu->features & ARM_SMMU_FEAT_PRI)
+			irqen_flags |= IRQ_CTRL_PRIQ_IRQEN;
+	}
 
 	/* Enable interrupt generation on the SMMU */
 	ret = arm_smmu_write_reg_sync(smmu, irqen_flags,
-- 
2.43.0


