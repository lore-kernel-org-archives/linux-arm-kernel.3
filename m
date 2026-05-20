Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4181BCD4F3D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 17:04:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BJu42PT9BqfkjBUZL7cxrw4KMZZNtEXVIeX0LWsPkYs=; b=o8rPnDCi2ykUnZkqUNAbLZCPYR
	rQww348aE5tHWrjoU1MBt6lwPi5h4GKWPwx+2PCieLaErUGMa2VazaRWyKSM+h15j0O4y/xEDiU7j
	CeyYGyunn7I7oUpMxr+RMN8VGRHm5cbmJEQHwB7Y/ksrarAoqpeu4HnNMh7VBiWC+8FGvn8xxolhK
	GmlDnUkewSIZIiaxWgQpfteDOta8uNMQnEpPFoyAMHo8gmdyG6ZySISk1HWc9KMSjak+357fE0Wd5
	c/7rhphnV8ZRdk8Y9FuNSS/FvgEBOwR3Sp32TtFcjEv8yLOdgZLiKwgTQKFBZXW6C2A1ZMVQjxvMI
	SK4Qw5Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPkLa-00000005FVx-1CLb;
	Wed, 20 May 2026 17:04:42 +0000
Received: from mail-westusazon11012002.outbound.protection.outlook.com ([52.101.43.2] helo=SJ2PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPkLI-00000005FLP-3Bv6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 17:04:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RJOIg2sYya4Q2ZxVHtzQSCfqmH/TY7zVRNKz6LXLeToYjmR/OM9lvG9qXU76UGuAMIs4ZacQDh03p9sHNhlObcRHc+ogvnC2pILhsQLBlpcRIIAQCRP6DJipl+GKX5Ww6XbF0W93p0KfZYDk3bWnYN/fh90HGkFEtc8h0p/X7YDV1TSvd85m7IneXpDRTF87ZHekwN1S3leAnGKSs03B8RQ7QB0bm1A0wWK8DejqZnTiykb9wiIKxehHLwU4YOy9GPpPIji9ET8K1K+VLTKkSEYbkOcetd+EMRIZPyk4D7lzET7Nr84s8yLW9rUCpgDcqMLAptceWtvzVW8mECAn0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BJu42PT9BqfkjBUZL7cxrw4KMZZNtEXVIeX0LWsPkYs=;
 b=TM86hvsC+R/DYDqPg7WXsp4+nMi6kjWLWrQ87wzcnY1FTRcNIbTv6JILd4GXf9poq5cvIrnPTPEYBsaaaIBDv/Jm56K1MntA7VpE7zlxeyyQr1w+8ifd7i6QdThdZDWKciFu0Ypvnph51CimagsMHlgaMCxTp/CyLC2rrP0DXmhU8kgUORubTF5QkOB+CjPE9v7kVQqxNyYJA2P1lLsNnPf8Q1eyDDWwSbczmvWxuzLxc00GWiUegK+fvdcX+sP4o66x/Xm1HDy3tkNIDGSZlBePoIwiDBQShJUrtaYIaxyKEJYl3yPGO+qwLAvf8kqb4RwXvV5OL7NeUMAWMorIJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BJu42PT9BqfkjBUZL7cxrw4KMZZNtEXVIeX0LWsPkYs=;
 b=ufCu40f1sn++O6Gq8ACKtopgXs0VOHg+GROneogU7UdAGGiWz/PAQHmVf7E2ZAz11qxlB4RbNWH3XupzzRdimQLi+qPYM4rvj5if8Gf/oLIJ1imzxZKdbuitR7Ai8XhN6ib+sZVJXCSnKqjUg3Wzkaas5WWxkvn8TwrpvLTHaKBFcxgAuZOfCl52zWrKOl6/Cz7QYI+nEnXIXESb2FLxatZ1X954ZZThfhu2WcOjWTYGNPPrPuKGOYGMmn2SJjAJ/iSoCdxLvaKuiByyNVlAbZjupbOlKDetJC2FEHSzaAw2iBUB4BvB2NsDIlPoA9yxNnkVhVf884YaQAT4KuAL+g==
Received: from LV3P220CA0009.NAMP220.PROD.OUTLOOK.COM (2603:10b6:408:234::18)
 by DS7PR12MB8417.namprd12.prod.outlook.com (2603:10b6:8:eb::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Wed, 20 May
 2026 17:04:17 +0000
Received: from BL6PEPF0001AB56.namprd02.prod.outlook.com
 (2603:10b6:408:234:cafe::b6) by LV3P220CA0009.outlook.office365.com
 (2603:10b6:408:234::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.16 via Frontend Transport; Wed, 20
 May 2026 17:04:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 BL6PEPF0001AB56.mail.protection.outlook.com (10.167.241.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.11 via Frontend Transport; Wed, 20 May 2026 17:04:15 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 20 May
 2026 10:03:46 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Wed, 20 May 2026 10:03:46 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Wed, 20 May 2026 10:03:45 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: <will@kernel.org>, <robin.murphy@arm.com>, <jgg@nvidia.com>
CC: <joro@8bytes.org>, <praan@google.com>, <kees@kernel.org>,
	<baolu.lu@linux.intel.com>, <kevin.tian@intel.com>,
	<miko.lenczewski@arm.com>, <smostafa@google.com>,
	<linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <stable@vger.kernel.org>, <jamien@nvidia.com>
Subject: [PATCH rc v6 3/7] iommu/arm-smmu-v3: Do not enable EVTQ/PRIQ interrupts in kdump kernel
Date: Wed, 20 May 2026 10:03:20 -0700
Message-ID: <e643786d849d274c1d8dcfc03795f572aef812bd.1779265413.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1779265413.git.nicolinc@nvidia.com>
References: <cover.1779265413.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB56:EE_|DS7PR12MB8417:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b96b98b-ab8d-4842-cddb-08deb691d2a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|7416014|22082099003|56012099003|18002099003|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info: rMocYgcaMdOTJK9ONTrTyCISwmzh+7kS23PkuV03soUQqmspNhDkjuwHqrX1gUjFFhPS0CG3Ljhnujb+01aoTX6eo93O8DN8BDFlhAQRul34SbwXFkQY/2rygo9pzyhHDDlot0pf1DP4R1H5X3GLBkVaJUUoqiTO46w/d3Mh0ZoYxCf/lcDsI5ik+6sNtAI++dsI0iL5I051Dsc22wOt6rCIfpsUafZvR1tM3x2kobbfjFEDPo0QKqMqstY3OewjT0PVb88ho7IiSgC7UNIQ9EUFrq2Yf3StLFNByM7Mpfb6jL7aIOGYuMZMm2Eu+dz7bMEJ6jJEhfpc41hwde3ZYZbRwj84PcCqv5zhXN1FMBY31Ik7oX7bfiCsOg/R9r1wx5fAdYjTkzw1Q8RkRPRLKbXGTdGBpb4/hAjewVqqH1BcCJ5uBrS7TIFhNKXIdi9nGeNy4CkkxMGfy5Wr8/j5nbeUtrzCnUMOz9T4kXHMbOIt4T1fUR0z+uq7rdFX2oJ1Tva5NzmoFA5TdsJhejtNmPrtkd1C6qiCf/561dKfX9FuO2FlSIDX9xfy6WyqvPq6HcC2Blijsa7D4+jSwZWRArQoSZ9G/iC7tsu6KQOwg3tBRQxjH0gcKeW2Ivz1xzjwX0wPbac/HdQahFCZi1N8GlpS9dPZ3Ec2zmMPNSwoeXidDQgVIo6Qb+i5eaB3mOPNr0836MDZHcNHEPAr/GhYEeHHrMC6UiWaV56C8JZwGT4=
X-Forefront-Antispam-Report: CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(7416014)(22082099003)(56012099003)(18002099003)(11063799006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: s4k9Ro+EhB5cYXldOrrj2dzSV9+6dbqnUYqitPiP5C61duZ0UkrgNLko1dD49hkPUQvB5r3ia6zvUYQQkeM5j9W8n7A8sfKz7aYWTy1xnabBQ2cRVpbBBdJz5PwdK47figVk4raR4Uc6IJ0skKZ0g6jE4ddud0uGphvcFqA4Ng2b+paNN3I8xzWbK0ko1itGt/QFTWuUiM0cOXjPnRb7d6ZcXZ1N8xoH3iNk91O1TOdJrZG6XgU16F08OiMVTeeK2htwZofmHSd+OakBkuVV9G3ldqGp4MOMRt7697H0CmTIoep8swevX6UmgrcDnl62sfB5EAhUNbu3wFbgOcgZWVaF1lPAi/TtBVyoSHxHuhsX2L1SwJKnpc0UqvYjJHrtYk08+2fIKLspzal9j7NTvjpiX91IRfwVPYnsN850/++EB99BaFlMAjiMuYCJMchm
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 17:04:15.1291
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b96b98b-ab8d-4842-cddb-08deb691d2a5
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB56.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8417
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_100427_723034_0A0DD4A4 
X-CRM114-Status: GOOD (  18.71  )
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

Fixes: b63b3439b856 ("iommu/arm-smmu-v3: Abort all transactions if SMMU is enabled in kdump kernel")
Cc: stable@vger.kernel.org # v6.12+
Reviewed-by: Kevin Tian <kevin.tian@intel.com>
Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 58 ++++++++++++++-------
 1 file changed, 39 insertions(+), 19 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 2d7eb42449eaf..e00b28e36f9c4 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -2464,7 +2464,11 @@ static irqreturn_t arm_smmu_combined_irq_thread(int irq, void *dev)
 
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
 
@@ -4963,6 +4967,21 @@ static void arm_smmu_setup_unique_irqs(struct arm_smmu_device *smmu)
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
@@ -4975,16 +4994,6 @@ static void arm_smmu_setup_unique_irqs(struct arm_smmu_device *smmu)
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
@@ -5005,7 +5014,7 @@ static void arm_smmu_setup_unique_irqs(struct arm_smmu_device *smmu)
 static int arm_smmu_setup_irqs(struct arm_smmu_device *smmu)
 {
 	int ret, irq;
-	u32 irqen_flags = IRQ_CTRL_EVTQ_IRQEN | IRQ_CTRL_GERROR_IRQEN;
+	u32 irqen_flags = IRQ_CTRL_GERROR_IRQEN;
 
 	/* Disable IRQs first */
 	ret = arm_smmu_write_reg_sync(smmu, 0, ARM_SMMU_IRQ_CTRL,
@@ -5020,19 +5029,30 @@ static int arm_smmu_setup_irqs(struct arm_smmu_device *smmu)
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


