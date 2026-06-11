Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62014CD98D2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 08:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BPsZ0B0ONx671vFXSioa/j5bisqcagwV0DeUFp6g4I8=; b=jtPpmUKC2r5W6AhjV1jSQSFZwW
	vY3/TymBuztz3JTsKsAnoeRnmWTP0mGmtcgm217HChpwF2tX8jYA9W6Kaf9Sqr8gxLMt4chJDmQKX
	XoF+oDm9F2iA/ivPDK0J6uk8FlZFlc+lJyEVsWzvxC/GFzJH5XEOTpPKVCvu6ZOSHzZoVd6pM23kD
	GvyfD/Iq7ct6vX/rdNJcVvzT8afBawABPhUUWjKlbfG9A9+WY4ei/pG7o2yrMaR5dhbyYNQA5utoQ
	VO9fXLDNYvLH+XXPG4nPT0QO3M48z8C6KPdW6eK1TalDD0VKvUG+5QVEpo0EPwTJL5bHUSkGXSwZU
	n2MfAC1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXb0G-000000092Dq-0W8b;
	Thu, 11 Jun 2026 08:43:08 +0000
Received: from mail-eastus2azlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c110::1] helo=BN1PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXb0E-000000092Ca-14J8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Jun 2026 08:43:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e3eT/U4LgDkSPbwZ9c5kE7bO+OAkN/sE3P8o1Apz8qRtABHiapx+AxFWCSYa0AkIwP/ajniE8V/jKVWgMI6d8B/d6oOAFD12v8ZJeKY/Mn4QxvEvSeKQozRvBWOOm71myHTKFmMuo6+DMbt4ZpxVCnwzTG3BYUXVFxDyN6xZcyCLiditCbmuztQbmQtD6IzMCFJUjFbwPIOlPmzQmUPov3oZvxmGsPFUyur0WlaLacfodyJ2CihiLVrsCt8xkEZm3nPUQDQ4LZus29j1NetQSjJLE3FcGxNYqzoEzbQWMV8M0fbaAvGAqPJivJojnv4Ax/xr6mad9WnQbPDAJoUxQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BPsZ0B0ONx671vFXSioa/j5bisqcagwV0DeUFp6g4I8=;
 b=ZwGlKPeA+91UuEXVjtB+cYZW8KbmuzITI+Xzmw4G1ADEvK6cRk/mwMTe8eDl+hBsYIwkABuY6se+sdnCyNVE1uv4Wb2jP+6jJmc05kr09cVMT6lvcxgrYFjxYWHQYNW6dbKO01KncCYtP29/Q9WRPAJmOGMPGOwYGamfRXIZfxwhhf8tyR9uSHgEaGbHead0eL0GTLoHoYn2Gl/AzuFBrBk1Uc4qRDF59Hd3nthXwWm8AAFz1rBMYLokjEZx7gWnehxHyCb5B2UlNppV+d1PspDTg4EBoCh3rrT8o5QVb/vNHLESwFPw0zKYaNct/nIUIsdKY8oP3oWtT+lNBV+w0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BPsZ0B0ONx671vFXSioa/j5bisqcagwV0DeUFp6g4I8=;
 b=dZMwZUuhwUemBYHIUqalm80fzTcg26UMHn7tziiA1t2qlNtYx1BiGUQ5Oo3Tf63vp+Z1PBXFm0uVGp9DlZGQ91d1QoBi5CcLSwBTFd+Oars6A3NiTls0JN7zAGTfdHCbqrr6wJY2exgpSWuLjOO6A73E1AjW92ziLP7CRlDnItsmzfbkWXg7c05a8xeGXnOe4NBCYR+oo9BcXagm+WKcqbdzn7NolKBNCGF6yZTnXMSpXO4BR46s59vQUHSziuBMIRn0/BeVoh0jMRVSQuKpoWcBEIswHJ6ggJDG3TJ2xc/LVAAIkXhppTKYO1P1yAUkZX+v2FD6KAw2k8bv+Qk3dA==
Received: from DS7PR03CA0030.namprd03.prod.outlook.com (2603:10b6:5:3b8::35)
 by PH7PR12MB7306.namprd12.prod.outlook.com (2603:10b6:510:20a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.13; Thu, 11 Jun
 2026 08:42:55 +0000
Received: from SN1PEPF0002BA4C.namprd03.prod.outlook.com (2603:10b6:5:3b8::4)
 by DS7PR03CA0030.outlook.office365.com (2603:10b6:5:3b8::35) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.12
 via Frontend Transport; Thu, 11 Jun 2026 08:42:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SN1PEPF0002BA4C.mail.protection.outlook.com (10.167.242.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Thu, 11 Jun 2026 08:42:54 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 11 Jun
 2026 01:42:35 -0700
Received: from NV-2Y5XW94.nvidia.com (10.126.231.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 11 Jun
 2026 01:42:32 -0700
From: Shameer Kolothum <skolothumtho@nvidia.com>
To: <iommu@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
CC: <nicolinc@nvidia.com>, <jgg@ziepe.ca>, <joro@8bytes.org>,
	<will@kernel.org>, <robin.murphy@arm.com>, <nathanc@nvidia.com>,
	<mochs@nvidia.com>, <skolothumtho@nvidia.com>
Subject: [PATCH v2 1/2] iommu/arm-smmu-v3: Manage teardown with devm
Date: Thu, 11 Jun 2026 09:42:04 +0100
Message-ID: <20260611084205.686559-2-skolothumtho@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260611084205.686559-1-skolothumtho@nvidia.com>
References: <20260611084205.686559-1-skolothumtho@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.37]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA4C:EE_|PH7PR12MB7306:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ab88a2b-f382-475a-03f6-08dec7956e35
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|23010399003|376014|1800799024|82310400026|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: CVlt6SaRcaYF0tY1BSCrfUzbZQyll8QevUQkEHB56vJ+G3gnVMkMz6gCmXJr7guIJ24T0mJ5A1BfJnNmrFCEUIwmD97Jy21wUUxxxiQU9uKMx0QTU1t83goGgQMKxjm38XU27YAmdf82ygRDSq/0k6Z4HWuiyuH25VzDMV9p4a70QtnXHNBQsXhkOJ6hdL496C1Aui7BXT8a4BNC3qk2lqgmRrlHTZptIx+KAiFYk52Xl3AKThgg/d8n67nfMNGUpTBGP75eNwHOlF0tkRAcqRjVjjAzMs5RtXWIi50P/dClEY5B9KemrAWALnH+7A7b1JEL+56YpzAf4J+sPMvNIvNE8Fq8uqjzo7w7RmUvSKxvjfNsgKzCeALETGw1+xkRL0DLzRnHp9v15jQA4+Plbev32OMisbsYsqX9EOBTLgN5PB22rWKI18Lre2jxhWuMyczbkP16ibJS60cON1UIabt/J3OXYrR11li6H4Kxk5d5dbImgD8ZaYYGFpYNMkftBf/OIGewngipwtYatxgPmegVd+Vq84ibWewYeEksEeIuIXzlooP4EdzMWvcthgZoFm+oErGZkcvMhKNXgBHtevR+Zy9ev0MUGRXhU+QKRKHM/QiINnpScLOIpjbjGMT24u83KwTrZkGnon5KFJtjtTTnJ2g1G1vbAhj53yG7glWL5jTtiM9xAg03MK2F10WpahpD6p+ebOpOwM7RQcmSB5e72Nj7YBUU4PRSEqs1Erg=
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(376014)(1800799024)(82310400026)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: ZB9yfHJmO0YC/7A5R8w+E/DPPu4uCEZ659iBGr3FxWNMCy6U6rpnO7CSNlMuN8XrFrxDrJCyHvX+QlZsmZJYABvGJ5G0U6QfaLnIJJVk8YGIzyvr25DxgGzoWJJmyrXw8UL3ru9oRQyUpJqvcbMmU4a03iU2lS/LCSt5EKizixMYcMKOwD40vOsctwE6DElfOBbtf8jvCL4MFtZZA7iNlONClztZdcwbtSvpfRm7vEO9ElLFSpyer3jurGDOMBLcSoIPTLL+MI8S/ZpqwXE2k60nYtt2jo3/ZPOtMMfgAzf8CmobSuJ6MJvGtMlNAXx2LZLD8upoMY082Kyf7Rt1jztjCvA/ieLPTOwc+Yn8wJPyyXKAo3214UqENnLNRNOjc6KXyEJBBdU6DM2xZPtofHC7sjM3AXDqWBV0qbg6zkw5Pd7vKthGIT6/id15MV9O
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 08:42:54.4707
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ab88a2b-f382-475a-03f6-08dec7956e35
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002BA4C.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7306
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_014306_301452_4B4532FE 
X-CRM114-Status: GOOD (  14.78  )
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

arm_smmu_device_remove() manually frees the IOPF queue, destroys the
vmid_map and disables the device, while the IRQs and queues are devm
managed. devm unwinds only after remove() returns, so the cleanup runs
in the wrong order. The IOPF queue is freed before the event-queue IRQ
whose handler uses it.

Manage all of it with devm so the unwind order is correct. Free the IOPF
queue and vmid_map via devm actions, and disable the device from one
registered after arm_smmu_device_reset().

This is also a prerequisite for fixing a Tegra241 CMDQV CMD_SYNC
use-after-free in the subsequent patch.

Suggested-by: Jason Gunthorpe <jgg@ziepe.ca>
Signed-off-by: Shameer Kolothum <skolothumtho@nvidia.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 50 ++++++++++++++-------
 1 file changed, 34 insertions(+), 16 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index e8d7dbe495f0..00261e77e7bc 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -4464,6 +4464,16 @@ int arm_smmu_cmdq_init(struct arm_smmu_device *smmu,
 	return 0;
 }
 
+static void arm_smmu_free_iopf_action(void *data)
+{
+	iopf_queue_free(data);
+}
+
+static void arm_smmu_destroy_vmid_map(void *data)
+{
+	ida_destroy(data);
+}
+
 static int arm_smmu_init_queues(struct arm_smmu_device *smmu)
 {
 	int ret;
@@ -4491,6 +4501,11 @@ static int arm_smmu_init_queues(struct arm_smmu_device *smmu)
 		smmu->evtq.iopf = iopf_queue_alloc(dev_name(smmu->dev));
 		if (!smmu->evtq.iopf)
 			return -ENOMEM;
+		ret = devm_add_action_or_reset(smmu->dev,
+					       arm_smmu_free_iopf_action,
+					       smmu->evtq.iopf);
+		if (ret)
+			return ret;
 	}
 
 	/* priq */
@@ -4569,7 +4584,8 @@ static int arm_smmu_init_strtab(struct arm_smmu_device *smmu)
 
 	ida_init(&smmu->vmid_map);
 
-	return 0;
+	return devm_add_action_or_reset(smmu->dev, arm_smmu_destroy_vmid_map,
+					&smmu->vmid_map);
 }
 
 static int arm_smmu_init_structures(struct arm_smmu_device *smmu)
@@ -4782,6 +4798,11 @@ static int arm_smmu_device_disable(struct arm_smmu_device *smmu)
 	return ret;
 }
 
+static void arm_smmu_disable_action(void *data)
+{
+	arm_smmu_device_disable(data);
+}
+
 static void arm_smmu_write_strtab(struct arm_smmu_device *smmu)
 {
 	struct arm_smmu_strtab_cfg *cfg = &smmu->strtab_cfg;
@@ -5540,7 +5561,7 @@ static int arm_smmu_device_probe(struct platform_device *pdev)
 	/* Initialise in-memory data structures */
 	ret = arm_smmu_init_structures(smmu);
 	if (ret)
-		goto err_free_iopf;
+		return ret;
 
 	/* Record our private device structure */
 	platform_set_drvdata(pdev, smmu);
@@ -5550,30 +5571,30 @@ static int arm_smmu_device_probe(struct platform_device *pdev)
 
 	/* Reset the device */
 	ret = arm_smmu_device_reset(smmu);
+	if (ret) {
+		arm_smmu_device_disable(smmu);
+		return ret;
+	}
+
+	/* Register last so it unwinds first, while the CMDQ is still up. */
+	ret = devm_add_action_or_reset(smmu->dev, arm_smmu_disable_action, smmu);
 	if (ret)
-		goto err_disable;
+		return ret;
 
 	/* And we're up. Go go go! */
 	ret = iommu_device_sysfs_add(&smmu->iommu, dev, NULL,
 				     "smmu3.%pa", &ioaddr);
 	if (ret)
-		goto err_disable;
+		return ret;
 
 	ret = iommu_device_register(&smmu->iommu, &arm_smmu_ops, dev);
 	if (ret) {
 		dev_err(dev, "Failed to register iommu\n");
-		goto err_free_sysfs;
+		iommu_device_sysfs_remove(&smmu->iommu);
+		return ret;
 	}
 
 	return 0;
-
-err_free_sysfs:
-	iommu_device_sysfs_remove(&smmu->iommu);
-err_disable:
-	arm_smmu_device_disable(smmu);
-err_free_iopf:
-	iopf_queue_free(smmu->evtq.iopf);
-	return ret;
 }
 
 static void arm_smmu_device_remove(struct platform_device *pdev)
@@ -5582,9 +5603,6 @@ static void arm_smmu_device_remove(struct platform_device *pdev)
 
 	iommu_device_unregister(&smmu->iommu);
 	iommu_device_sysfs_remove(&smmu->iommu);
-	arm_smmu_device_disable(smmu);
-	iopf_queue_free(smmu->evtq.iopf);
-	ida_destroy(&smmu->vmid_map);
 }
 
 static void arm_smmu_device_shutdown(struct platform_device *pdev)
-- 
2.43.0


