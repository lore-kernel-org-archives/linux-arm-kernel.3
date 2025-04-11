Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE765C36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 07:12:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nQbDphL96i6xWzKqJy+4U1CiWuUVk3FDeEocvyzqdQ8=; b=WNKRRHt4eTgFL5WQPgo7l8S74Q
	HkZbobfFWV0M0bFn6bf/91ijC2Yj474KzoUo8IDr/UbWWDT057SGJaQU9WuYQvaO6LCuwWoLO6/UF
	bcAhJ6v5Q1SAKZ1O/uTpA/5avH+e0yphA+m13ttDqmVbn4QmrNDDDPyyWh9twfpN+C/FkIhwGv3Sf
	AEBix4B4iOGYvczHPlQ2Kqu6s7EkusSrhxcg/SaAIebYJ6Unq5lT5wTtHs8rc9MQ6WlxzozkMj4vm
	Lps3En+pT0azh7VVqByvGov2I9qc1PJ+H038kcPRbOseLALotrA5Kq1RGF+3fzVzN+ndfHvmU7jFt
	SNOoKLtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u38YP-0000000CpLy-2mcG;
	Fri, 11 Apr 2025 07:11:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u382O-0000000CkQ0-0gQP
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 11 Apr 2025 06:38:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=nQbDphL96i6xWzKqJy+4U1CiWuUVk3FDeEocvyzqdQ8=; b=C655ReBx4lQ5qeiEn2yTLD1qmT
	2WBuTPIs2QQpGUjpSuTABezqR4K+uEfLpBk5MyRhDi8ZwjcLtcuWsl4w/ug5N80CXQIZ7YJjn8TeC
	nhDcKH/1BF3JhUmkGBCdvHjTp8WI/v0JSdRvRVigJiuXbwRibRq7foUFFLQeJKO93pgdOxcbQwVaM
	nRCvzTMC9u5l4zPiIf+fTPt2T6KI/nN6dc+liWvGjPhd8TrGlEU5Ymty1BWMslobBC+9LTvmtRXHQ
	ON5GDMC6nJ93G9xW649WyIXtjtoJ7o9JMGqGdhQM6G4CwKzGp8j7kHJNdWdtADLCt+TeelcrhuX3m
	YxLJBScw==;
Received: from mail-dm6nam04on20615.outbound.protection.outlook.com ([2a01:111:f403:2409::615] helo=NAM04-DM6-obe.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u382L-00000008wdS-0V6m
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Apr 2025 06:38:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wr2HaipsicnR+lA+ybJvYozitdU19qxLSl8Qof2HJYsuRlaCpwGjZYjvMXHYyeqtqBj6MXIUD8inUjjOxIHtnbFyGIKQ1LoRGFWLUbQzpBELqDfUFILGARnnh6YWdxYpPj/I+4n+hQZwKkAavDstl2zuY5E/HAeOn15dVXzpR8NeNz3Gb/gUfT+sMJw7U76mxf5o8vLqt7O/wSiHOJyVO4qjdpvvYLALgOrul6aOWRBe1rEgmIwMZBdgU2Kope7aW/6pV/7J0dC6DkOXpF49d5Sby3WB3qG5yg35+AmFY6XZtyZe2aSkF2qQaH5cuZYRrTdtBVhOp1jM9hmFi8sgwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nQbDphL96i6xWzKqJy+4U1CiWuUVk3FDeEocvyzqdQ8=;
 b=yBFitigRHJ6Zgt6yXo1YXbl+/vjKwcHRsydAsWC+v0iPGWecolyOmkKBf70H1URvVinI3oLBCQl9md8rijAWHDjtqsQVUZD3cXCHbwTUwU7qe//bEdoRQMeaUKWEDciA9//qRv7PuX6/jHLLNwsVdo53UvPIeEOwUCKw78hJ3APXhyuRZWA/eh+t/ejUqzLxPp15pPB2rnIEGeUihlYOZOl5gUrvWVJoYCi/HgOUXxGON7LWhQ9Cj9xGFji+odPtn5Fp/ZkCM6gheadAb38u9jXbuKQ+Xt4jO+zgMGW9cdxNsChHx0bd43fb3xzqgg9xGaJEgX+tqUL95HNiKlNbzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nQbDphL96i6xWzKqJy+4U1CiWuUVk3FDeEocvyzqdQ8=;
 b=HrZDtLeQm4YWE2MAzTnNTZXlcZwIQpwprgnENC2Dn+sJzDeNyWdt2tvBN9FWEzkxX8/ShhZkrfuMxLnQk7gJ26codYjFsEpzLQ75gbplZRwjHjvFnydMq+WUzLTus0wiQIVH173rDG8rFMpOEDZaR1o7ilL6xenUn08zsnwmSRck+sbiIo5aFE+pBJyyAJVt8OUY1b9zfR0HTC4qBVmqN0x3GGQs8sFc3y/W6EwXp86wLlhLy3cH62G+CzcxZGWRJFVpPV6mQgoDOG8WgT2A9/aL9NesXN7h2ljiQd+81qtvybu2hmDkpAn8GlZhCZVWFv44z7+Jp9FPmQx8droJOA==
Received: from BYAPR04CA0009.namprd04.prod.outlook.com (2603:10b6:a03:40::22)
 by BN7PPF0FD1DEA27.namprd12.prod.outlook.com (2603:10b6:40f:fc02::6c8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.22; Fri, 11 Apr
 2025 06:38:43 +0000
Received: from SJ5PEPF000001F0.namprd05.prod.outlook.com
 (2603:10b6:a03:40:cafe::c2) by BYAPR04CA0009.outlook.office365.com
 (2603:10b6:a03:40::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.26 via Frontend Transport; Fri,
 11 Apr 2025 06:38:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SJ5PEPF000001F0.mail.protection.outlook.com (10.167.242.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8632.13 via Frontend Transport; Fri, 11 Apr 2025 06:38:42 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 10 Apr
 2025 23:38:31 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Thu, 10 Apr
 2025 23:38:31 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Thu, 10 Apr 2025 23:38:29 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: <jgg@nvidia.com>, <kevin.tian@intel.com>, <corbet@lwn.net>,
	<will@kernel.org>
CC: <robin.murphy@arm.com>, <joro@8bytes.org>, <thierry.reding@gmail.com>,
	<vdumpa@nvidia.com>, <jonathanh@nvidia.com>, <shuah@kernel.org>,
	<praan@google.com>, <nathan@kernel.org>, <peterz@infradead.org>,
	<yi.l.liu@intel.com>, <jsnitsel@redhat.com>, <mshavit@google.com>,
	<zhangzekun11@huawei.com>, <iommu@lists.linux.dev>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-tegra@vger.kernel.org>,
	<linux-kselftest@vger.kernel.org>, <patches@lists.linux.dev>
Subject: [PATCH v1 14/16] iommu/arm-smmu-v3: Add vsmmu_alloc impl op
Date: Thu, 10 Apr 2025 23:37:53 -0700
Message-ID: <c5193cce7c23590b54e6d03e77fedfcb02037cef.1744353300.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1744353300.git.nicolinc@nvidia.com>
References: <cover.1744353300.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F0:EE_|BN7PPF0FD1DEA27:EE_
X-MS-Office365-Filtering-Correlation-Id: 3535baf5-f58c-4c9d-bff0-08dd78c38061
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ULv9ZKOvjh/1WhHFspUGCR0cdFyOuAf/M928Xi0+u+S/4oR8hZUyPa9fLb71?=
 =?us-ascii?Q?6XVCKnpM8LQfnT5huv7X7HrkoRDVA98Z1C5xX1QccDAhBi4LV/74Nm6uahir?=
 =?us-ascii?Q?K8tNRRPVX76eyAvE6FrUWQ07Aa0d77Es+/yh5GiRqvWSX6rKdiv/prZRNrPS?=
 =?us-ascii?Q?2eo4FvZg+f/IN9NL70V6bD6Img3Sdu0B1O9bpkaWgraVS/kX6HzpMQG5RlP2?=
 =?us-ascii?Q?ULPLxGhTTRIXOmKpnHJBl3uGrqBzJexlWhVMBZB6wgZ2JwqV3Zo/FyD99CdA?=
 =?us-ascii?Q?nb/soTfSWvcTC7tkOVynwQbTLWTNSCXg9jc3NSqVVmTvVEmzmotrhlSIIa/X?=
 =?us-ascii?Q?QICUWV0rRIsUjYIyHAo7Lqpi/Iqim9cDf5CEagOTplXb2LPycuXOBByiydPc?=
 =?us-ascii?Q?95eMDKLso9OC2iXaTiR+cJuRU8m/gJq65pfcRlZ3g3xPyNN0RmvyLrw2phJz?=
 =?us-ascii?Q?Ua4XAAsd2vmBSNW8Iwc1K1EbHktS0HVy4SyLLHkpYd4U2NmjzjkkL9qVXc2T?=
 =?us-ascii?Q?QxPoEwOCMpCJNrO9eaMuNSlJgN0FhOPp0Tenagx/hdm9hMhTbRv+1dkACWAS?=
 =?us-ascii?Q?ZBPLTpNgI4s7tQdrycPSuoCeC5UoeCED+nPgcZ72Skz2d3nEU5s/YwDbo9bq?=
 =?us-ascii?Q?j34xHIjUwfzm7vGwNI6bw9qZUbr+CAhHU012UMeQtHtsK11FAZGPiJaF+oti?=
 =?us-ascii?Q?pZwwXLQYJ9t46XFN6ILay4O2N6wBh+h0EoL/h72OFRkUVcjs3HxnlgJCvh4g?=
 =?us-ascii?Q?Sqw+AUbs0XQO87BXTzW2205rfYDxUW5Ghs0PmzMWxULj96aAgN/MPFqBQG4n?=
 =?us-ascii?Q?JRep3V8RhmOWALnGgf1UFEGYkTpzp7uiLpemwwF6ZYw4XjgXGXXBAjkYgObd?=
 =?us-ascii?Q?ncRZKyINIUXAYB/En+QKzzSH24O9LKtZ6c1H/vnnFAOXzj2pCfwwzbX4MA3e?=
 =?us-ascii?Q?fNPHn1hR9dXj04o7ZYTDFJRoGUUktWDBWS7WEhOQqTcShD4q+rn7YFkqd9TM?=
 =?us-ascii?Q?lcmgaNAaP4pdxHew294dz3icv46YeRBD6BAxJy4AdIvQi7Dx84qw2iW/R5n9?=
 =?us-ascii?Q?vbh6nhGN5eqqoDdde4mKXy2YfE5UCPpZMaP7Yib5iodJxxCwssxWpP0cnZ3/?=
 =?us-ascii?Q?5n+Yv0yWFQ8hH0HcO2FPQlXhDN2m3+ERr5vrSaZl3JhSgkTim/YS8JMD/4ow?=
 =?us-ascii?Q?T62PGI3ZS4dDjiyaD9m6CGwpLLTxU8DwIMvI2JljZ2w9f4S8/dvqjWrYQ0bt?=
 =?us-ascii?Q?bQgPcbFw1oz9LPzhwCRnA1B/Z6W8xxa0CygbthLY6RrFQDzvjFE3XPOzJtES?=
 =?us-ascii?Q?Hj1BohGpCGNKhIKxi8itbN05ofcU+saexxYA7IgXOFzis+kDnV9M2IGR7w8k?=
 =?us-ascii?Q?egQRbY++MfaYfiYjTE5MPQ1SxTtK7RZlQkCRK54gYF56kp8yGkZJ8F8SNjrU?=
 =?us-ascii?Q?yCmx8cokJIldYhMt6vQuCNpdSiGuw95V+eKi3+lTYONS1zAF54p9ljdstW4t?=
 =?us-ascii?Q?VsIpDLmbjvygYMKGMfp11lIozO3w1ujO8pVF?=
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2025 06:38:42.4011
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3535baf5-f58c-4c9d-bff0-08dd78c38061
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001F0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPF0FD1DEA27
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_073849_320749_AD1E8D82 
X-CRM114-Status: GOOD (  14.06  )
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

An impl driver might support its own vIOMMU object, as the following patch
will add IOMMU_VIOMMU_TYPE_TEGRA241_CMDQV.

Add a vsmmu_alloc op to give impl a try, upon failure fallback to standard
vsmmu allocation for IOMMU_VIOMMU_TYPE_ARM_SMMUV3.

Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h     |  6 ++++++
 .../iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c | 17 +++++++++++------
 2 files changed, 17 insertions(+), 6 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
index 6b8f0d20dac3..a5835af72417 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
@@ -16,6 +16,7 @@
 #include <linux/sizes.h>
 
 struct arm_smmu_device;
+struct arm_smmu_domain;
 
 /* MMIO registers */
 #define ARM_SMMU_IDR0			0x0
@@ -720,6 +721,11 @@ struct arm_smmu_impl_ops {
 	int (*init_structures)(struct arm_smmu_device *smmu);
 	struct arm_smmu_cmdq *(*get_secondary_cmdq)(
 		struct arm_smmu_device *smmu, struct arm_smmu_cmdq_ent *ent);
+	struct arm_vsmmu *(*vsmmu_alloc)(
+		struct arm_smmu_device *smmu,
+		struct arm_smmu_domain *smmu_domain, struct iommufd_ctx *ictx,
+		unsigned int viommu_type,
+		const struct iommu_user_data *user_data);
 };
 
 /* An SMMUv3 instance */
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
index 66855cae775e..aa8653af50f2 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
@@ -392,10 +392,7 @@ struct iommufd_viommu *arm_vsmmu_alloc(struct device *dev,
 		iommu_get_iommu_dev(dev, struct arm_smmu_device, iommu);
 	struct arm_smmu_master *master = dev_iommu_priv_get(dev);
 	struct arm_smmu_domain *s2_parent = to_smmu_domain(parent);
-	struct arm_vsmmu *vsmmu;
-
-	if (viommu_type != IOMMU_VIOMMU_TYPE_ARM_SMMUV3)
-		return ERR_PTR(-EOPNOTSUPP);
+	struct arm_vsmmu *vsmmu = NULL;
 
 	if (!(smmu->features & ARM_SMMU_FEAT_NESTING))
 		return ERR_PTR(-EOPNOTSUPP);
@@ -423,8 +420,16 @@ struct iommufd_viommu *arm_vsmmu_alloc(struct device *dev,
 	    !(smmu->features & ARM_SMMU_FEAT_S2FWB))
 		return ERR_PTR(-EOPNOTSUPP);
 
-	vsmmu = iommufd_viommu_alloc(ictx, struct arm_vsmmu, core,
-				     &arm_vsmmu_ops);
+	if (master->smmu->impl_ops && master->smmu->impl_ops->vsmmu_alloc)
+		vsmmu = master->smmu->impl_ops->vsmmu_alloc(
+			master->smmu, s2_parent, ictx, viommu_type, user_data);
+	if (PTR_ERR(vsmmu) == -EOPNOTSUPP) {
+		if (viommu_type != IOMMU_VIOMMU_TYPE_ARM_SMMUV3)
+			return ERR_PTR(-EOPNOTSUPP);
+		/* Fallback to standard SMMUv3 type if viommu_type matches */
+		vsmmu = iommufd_viommu_alloc(ictx, struct arm_vsmmu, core,
+					     &arm_vsmmu_ops);
+	}
 	if (IS_ERR(vsmmu))
 		return ERR_CAST(vsmmu);
 
-- 
2.43.0


