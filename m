Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 134DAC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 05:06:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oNhA5Q6xdTHm9y5k8V8H63jiKzXIqrVsfDenrCBP2fM=; b=SlRJaSjLKgfZFMHio62xdKnV2x
	YBXAFUD3qkdS/GJFXLrgcwonfrje4ZD6mj5XjMXZrf0klBTYtCa0uDd/TMAoazzs8Q3yt2DzmqTjN
	9py5CyTaX7sGaSos0jEGRDkYMkUvn44wBm6c5e2kcQh7EwjEDjJ3r5U71B5N9lnB9bXIVQw/A8rfv
	m+QAurO1yc6aY3P2xDouUznWzAKyJ1MR574SZAYcMnlzKoPVzmVeAAFKqYktbTwzESSnkbeYRbX5N
	MARZ/O4aeGywD+ptF/yaHH0Ak/zC+etEpue0v1987I3Lp44425XcR/YMuLD19SlH24Sm9Yf1XcfKT
	JPMVUXwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4YVG-00000004WEq-16gP;
	Tue, 15 Apr 2025 05:06:34 +0000
Received: from mail-bn8nam12on20600.outbound.protection.outlook.com ([2a01:111:f403:2418::600] helo=NAM12-BN8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4YNR-00000004UsK-4Bc8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Apr 2025 04:58:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lFV69rXd/po+uPNRz4A8QwdzxCRoS19zSkJYFyxdMfsrmTzcQOOWpfhM4uNluEsdCJGtt8dPSzuFRUeJ8OWXITsHsvGRQkqwZW+EVUsOOqzzwA1Slcxj3eVvStrDekqF6uHQcj0mGIINWJDYaCxUoCpRyHskT0/OcrYyMU1/FN7TpyljPkzmbX/pgBAvRDJRfrHwcDL33E57tgvBt74SFCD1KCmzlAb22H40nEwNaaEx9AMLapdKz35cIwruek+TuPNbUxUNK3FuXkUtZ8n/NGhZTFCuah+/pZKpl0qW2pA7Iq9PlULvpomtbay/V6T6h2j4XGnDS7t0tiLlk1iMdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oNhA5Q6xdTHm9y5k8V8H63jiKzXIqrVsfDenrCBP2fM=;
 b=ufQ7DqnYkw9NEPBcLG/FFGayTikbxmLmBE6T5GFgJfkN/HoBcwHEdh6f0ovakgqdtPKQj6y/yKZ20OyIiKQotKacI9p7u+Z1KAu430GT5caXJxuoIpU5NpuGvQoJZylkIVPeFE+1XsarFnqmeXkWd4prw1xrH+WyRCsq8bHNMkfgsQVSPvcg8Ru6nghuBZzKjhuIMPI/UUbKIh5K/12MhFWFtpRD+BGF4RFpBp8I1dMtFGG8y3YTdpgDkzk8S5NsLKgd4D9FdMs4V1k84uQ1fIleCOE/0ArEzkkhizgLizWJpgGK2jj3MukWcCrvvqQSkxnl30K46ikypV0ZBT6dZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oNhA5Q6xdTHm9y5k8V8H63jiKzXIqrVsfDenrCBP2fM=;
 b=t/P9o+BvdTGPausmZWDlZ3B11zBNHieBHmdi7tpljytFweecpG1nbqbqp8bM4+cRHfUI/2C9oB3he4NT4+ho5PVFPrmg9SNqGjb6ZW5QaxQ2x4r2KpUQixpeunP8Cy3ptSIVd5ptvT5iWV/fhgj2AKL/auX4fb6Sbqt26dQd55GQsvgrTLMv4cOPs2tAKFZMIcKxZVuowvNEmy4PTA1t/oWVtFAhvBApjudeb4sbA2TxlqWg8ly9DCuu/OsK4AN2UdX54mtD47xBiCxC9ygDmG2ci/UxBh707U0gkiO7QZ4541+R11hOd9FxuLAZYcQyR1mvKr4KbUrEVGC2j7zyOw==
Received: from BN8PR04CA0012.namprd04.prod.outlook.com (2603:10b6:408:70::25)
 by IA0PR12MB8373.namprd12.prod.outlook.com (2603:10b6:208:40d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.35; Tue, 15 Apr
 2025 04:58:22 +0000
Received: from BL02EPF0002992D.namprd02.prod.outlook.com
 (2603:10b6:408:70:cafe::36) by BN8PR04CA0012.outlook.office365.com
 (2603:10b6:408:70::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.36 via Frontend Transport; Tue,
 15 Apr 2025 04:58:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BL02EPF0002992D.mail.protection.outlook.com (10.167.249.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8655.12 via Frontend Transport; Tue, 15 Apr 2025 04:58:22 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 14 Apr
 2025 21:58:10 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Mon, 14 Apr
 2025 21:58:09 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.11) by mail.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Mon, 14 Apr 2025 21:58:08 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: <will@kernel.org>, <robin.murphy@arm.com>, <jgg@nvidia.com>
CC: <joro@8bytes.org>, <kevin.tian@intel.com>, <praan@google.com>,
	<nathan@kernel.org>, <yi.l.liu@intel.com>, <peterz@infradead.org>,
	<mshavit@google.com>, <jsnitsel@redhat.com>, <smostafa@google.com>,
	<jeff.johnson@oss.qualcomm.com>, <zhangzekun11@huawei.com>,
	<linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <shameerali.kolothum.thodi@huawei.com>
Subject: [PATCH v2 01/11] iommu/arm-smmu-v3: Pass in vmid to arm_smmu_make_s2_domain_ste()
Date: Mon, 14 Apr 2025 21:57:36 -0700
Message-ID: <137d6eb98c2b7ea9d5cc2fb0f44f3c73065aa23a.1744692494.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1744692494.git.nicolinc@nvidia.com>
References: <cover.1744692494.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0002992D:EE_|IA0PR12MB8373:EE_
X-MS-Office365-Filtering-Correlation-Id: 8155f1f0-cd47-4ebc-725b-08dd7bda2614
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|30052699003|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?SwhY8zp0IDjlz6a/cHfsgXamb7fOR3Y67jaepVIebjY/boSu4sBqjkpj/A5p?=
 =?us-ascii?Q?6WMxyUo8FQL4wMNwkpLzlP2cdFTpFxaZDkYg+/AyJxXWHHCZxL3F5RF/hkyq?=
 =?us-ascii?Q?zlLEpYIhChjNuDgSH/YXzljUIpis3IBylwA8zCWf9081QAG8Iy5pGsreCeGA?=
 =?us-ascii?Q?1/ZRP58AePkUSUIGMmQ/HkdeIx+6BNAZg8gGMY5k+wm2HHtBEhmdWUm/HYrg?=
 =?us-ascii?Q?ARWWiIEU1HkZBpKxtIEjC/4Ynnu2mu+RAhjHAgYZ0nGCC+dccar2HzsAiOdc?=
 =?us-ascii?Q?5nDbALZinYDY9v0mWZgXx82BSjxg4ajruBcBwwuBMhQgrkbAgjnJF+m5yLTP?=
 =?us-ascii?Q?UuT0sQDfJZ1f44d6YI1gfAutqRQPd1dG+uaDQzhxY6cQOYKRZc7iRYRaas1c?=
 =?us-ascii?Q?wLm+7YXgXn8nBVal4we8Zw3Xge6fw374+suU1Deu2NheI88xHBUtO5q5eeL8?=
 =?us-ascii?Q?AarRD3alLgfnjHjuIsabaeBKB5uprMqc/XD2+oA/AW7UC3+qpp+kxMeqxDbj?=
 =?us-ascii?Q?N073iOwAKOGKH3kk0Q92V3/+H0V3kg7L/ecWrzbOXihJdxFhk0R2OqTR0LC9?=
 =?us-ascii?Q?+AcMwJt4/nGBKSMI+7EBE6WTALQn1rT3NjJvpdnYrCxxwRohXjJsHCCIhbf6?=
 =?us-ascii?Q?hXR70isqv5SCZwvw6DDV4rIWaX0Kk/x+58W0xkiTitg35JJ2gCEJQr+7WfZm?=
 =?us-ascii?Q?xEm1KPtLS/OIVDeMdQcu2zL0A2TXnGYwRMu2e9DdVD0DcOYuHrps+gMdjcNs?=
 =?us-ascii?Q?6nAfzRazbonwv9rqbO5sK9mZp9v3r2qWrbDWJXGmZrA7GoMSyzLMOwUmBBqF?=
 =?us-ascii?Q?Saq8tkxoDLr3bri9t6jHUVGDkLePn59qI8HgpjWo3I/sB2MY3RjBNvZoG60P?=
 =?us-ascii?Q?r/b+Tqva1XOootwMoQ4cGUyW3Lxb+rnTJSk27Trs+pb8BybJCi13FxAffjw4?=
 =?us-ascii?Q?C8TbQ2Fk1J2NWGLkSWnVuqlHyiajASp5G8wXuYHzjyjxhQcCLR8BBQGcEq8I?=
 =?us-ascii?Q?iQ9EQSztQ7mLzG4e5T3mR/2ua+WvjNofqeQEgrCGJCB7thkcl0sMxs5k95FR?=
 =?us-ascii?Q?+mRjgx2ANz9m9KHPc1k/nVmWSl+Pb0qldPw0+DNr+iJEMPvjgqmBY3/hG5/g?=
 =?us-ascii?Q?bweU+fhDTKMzyjNeLqe1WnUeH5vWEFgLdOqjaBgM3NrdHxo4qp9PhBC0EHTE?=
 =?us-ascii?Q?exeX2r2tcrOZY4hjz9USdsXIRpBLW6PTJ2ggSGTdYcQaDvI1HPwvClZ2T6Hr?=
 =?us-ascii?Q?aGgTBr8Cuh6Vnsj5UosivwC0w0VR24pFx0wNJRl68Web2cHy65zbVmoFNn0G?=
 =?us-ascii?Q?OW8ucHWtJ/vz4xO7gerqmrX7JBFD4fobEiI5/U+5G+HZyZ+/9LyEU4exc3Fa?=
 =?us-ascii?Q?1WOe7nonUZWe35uXr0M7dqd8sDYtetFRx4GAYdyk8IQoOutVArwnFDzFlMRI?=
 =?us-ascii?Q?NOznNFtlvuwwTVrHErvFObvwFyRh+2qQaBZgnU2Ft6NhxaAVjlaYvEFOf15K?=
 =?us-ascii?Q?K9KphwdEN25y1hSaStynQ4YoEqgvZK8Iq5U1?=
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(7416014)(30052699003)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2025 04:58:22.6408
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8155f1f0-cd47-4ebc-725b-08dd7bda2614
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0002992D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8373
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_215830_035424_30C1B40A 
X-CRM114-Status: GOOD (  12.73  )
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

An stage-2 STE requires a vmid that has been so far allocated per domain,
so arm_smmu_make_s2_domain_ste() has been extracting the vmid from the S2
domain.

To share an S2 parent domain across vSMMUs in the same VM, a vmid will be
no longer allocated for nor stored in the S2 domain, but per vSMMU, which
means the arm_smmu_make_s2_domain_ste() can get a vmid either from an S2
domain (non nesting parent) or a vSMMU.

Allow to pass in vmid explicitly to arm_smmu_make_s2_domain_ste(), giving
its callers a chance to pick the vmid between a domain or a vSMMU. Add a
WARN_ON_ONCE to validate the input vmid.

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Reviewed-by: Pranjal Shrivastava <praan@google.com>
Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h         | 2 +-
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c | 6 ++++--
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c    | 3 ++-
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c         | 8 +++++---
 4 files changed, 12 insertions(+), 7 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
index dd1ad56ce863..d4837a33fb81 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
@@ -894,7 +894,7 @@ struct arm_smmu_entry_writer_ops {
 void arm_smmu_make_abort_ste(struct arm_smmu_ste *target);
 void arm_smmu_make_s2_domain_ste(struct arm_smmu_ste *target,
 				 struct arm_smmu_master *master,
-				 struct arm_smmu_domain *smmu_domain,
+				 struct arm_smmu_domain *smmu_domain, u16 vmid,
 				 bool ats_enabled);
 
 #if IS_ENABLED(CONFIG_KUNIT)
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
index e4fd8d522af8..d86dba6691e8 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
@@ -34,8 +34,9 @@ static void arm_smmu_make_nested_cd_table_ste(
 	struct arm_smmu_ste *target, struct arm_smmu_master *master,
 	struct arm_smmu_nested_domain *nested_domain, bool ats_enabled)
 {
-	arm_smmu_make_s2_domain_ste(
-		target, master, nested_domain->vsmmu->s2_parent, ats_enabled);
+	arm_smmu_make_s2_domain_ste(target, master,
+				    nested_domain->vsmmu->s2_parent,
+				    nested_domain->vsmmu->vmid, ats_enabled);
 
 	target->data[0] = cpu_to_le64(STRTAB_STE_0_V |
 				      FIELD_PREP(STRTAB_STE_0_CFG,
@@ -78,6 +79,7 @@ static void arm_smmu_make_nested_domain_ste(
 	case STRTAB_STE_0_CFG_BYPASS:
 		arm_smmu_make_s2_domain_ste(target, master,
 					    nested_domain->vsmmu->s2_parent,
+					    nested_domain->vsmmu->vmid,
 					    ats_enabled);
 		break;
 	case STRTAB_STE_0_CFG_ABORT:
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c
index d2671bfd3798..7fac5a112c5c 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c
@@ -316,7 +316,8 @@ static void arm_smmu_test_make_s2_ste(struct arm_smmu_ste *ste,
 	io_pgtable.cfg.arm_lpae_s2_cfg.vtcr.sl = 3;
 	io_pgtable.cfg.arm_lpae_s2_cfg.vtcr.tsz = 4;
 
-	arm_smmu_make_s2_domain_ste(ste, &master, &smmu_domain, ats_enabled);
+	arm_smmu_make_s2_domain_ste(ste, &master, &smmu_domain,
+				    smmu_domain.s2_cfg.vmid, ats_enabled);
 }
 
 static void arm_smmu_v3_write_ste_test_s2_to_abort(struct kunit *test)
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index c32c0b92dc69..1ec5efca1d42 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -1656,10 +1656,9 @@ EXPORT_SYMBOL_IF_KUNIT(arm_smmu_make_cdtable_ste);
 
 void arm_smmu_make_s2_domain_ste(struct arm_smmu_ste *target,
 				 struct arm_smmu_master *master,
-				 struct arm_smmu_domain *smmu_domain,
+				 struct arm_smmu_domain *smmu_domain, u16 vmid,
 				 bool ats_enabled)
 {
-	struct arm_smmu_s2_cfg *s2_cfg = &smmu_domain->s2_cfg;
 	const struct io_pgtable_cfg *pgtbl_cfg =
 		&io_pgtable_ops_to_pgtable(smmu_domain->pgtbl_ops)->cfg;
 	typeof(&pgtbl_cfg->arm_lpae_s2_cfg.vtcr) vtcr =
@@ -1667,6 +1666,8 @@ void arm_smmu_make_s2_domain_ste(struct arm_smmu_ste *target,
 	u64 vtcr_val;
 	struct arm_smmu_device *smmu = master->smmu;
 
+	WARN_ON_ONCE(!vmid);
+
 	memset(target, 0, sizeof(*target));
 	target->data[0] = cpu_to_le64(
 		STRTAB_STE_0_V |
@@ -1690,7 +1691,7 @@ void arm_smmu_make_s2_domain_ste(struct arm_smmu_ste *target,
 		   FIELD_PREP(STRTAB_STE_2_VTCR_S2TG, vtcr->tg) |
 		   FIELD_PREP(STRTAB_STE_2_VTCR_S2PS, vtcr->ps);
 	target->data[2] = cpu_to_le64(
-		FIELD_PREP(STRTAB_STE_2_S2VMID, s2_cfg->vmid) |
+		FIELD_PREP(STRTAB_STE_2_S2VMID, vmid) |
 		FIELD_PREP(STRTAB_STE_2_VTCR, vtcr_val) |
 		STRTAB_STE_2_S2AA64 |
 #ifdef __BIG_ENDIAN
@@ -2990,6 +2991,7 @@ static int arm_smmu_attach_dev(struct iommu_domain *domain, struct device *dev)
 	}
 	case ARM_SMMU_DOMAIN_S2:
 		arm_smmu_make_s2_domain_ste(&target, master, smmu_domain,
+					    smmu_domain->s2_cfg.vmid,
 					    state.ats_enabled);
 		arm_smmu_install_ste_for_dev(master, &target);
 		arm_smmu_clear_cd(master, IOMMU_NO_PASID);
-- 
2.43.0


