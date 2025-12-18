Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C290D711BB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Dec 2025 20:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4XywKSEXI4+bPF+ueIQgZkDCKwfZGgH4gJHexFcHMeI=; b=GbdRlM+ZixIdJNVYMms714Nbgi
	3KYUtkUgRTTbaG1kb8fFEgAhYlDnlAqnf+8lbPNQtHh0Q9mstke3L9c0yVfB7PTXJrjKG7/+ILe0H
	khKG4yy8g4Ah3ARYpqPzq4+gol8V1OPysnbP2iv4F2TLexKt2vk+KrLyLhOPfDLH+lAnZnUVE02xb
	FDxViNl6iJ0Fet5L/Ld8PU4BROUi6Cxz7Tg7O2ATIVgx+e2JdDCQdoyiy2cDpuh94cyca4Pc2NYpg
	uN4chC4YNGl4A23JMcCFnAogYHKAP82WbSS9AF6nYr1QsOfwUqCt0g2C6exKWCaittecbJLqNM9HQ
	VP18fRbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWKbG-000000099P1-15x5;
	Thu, 18 Dec 2025 20:27:50 +0000
Received: from mail-centralusazlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c111::5] helo=DM1PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWKbC-000000099Mn-1sP6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Dec 2025 20:27:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vX1UP2FFwhgxoNDxdpuwsjriiTc2eX/x7DQzFBKvYoeGVxLoNBD4FBJI2nvRjcJMbZdQmRRiS61V7AJ/Z1yT3/lZKLU4hTYhEpEb9KQxJWnAuvUJgN4RpObjbuF3rwG1rW6FzndUZgGVHq8O/cP6ok8wmLAZHbnOqEZCDjfVdvAazXPhQvSYVyrcOwhIN/jUHH2Mg8ypmSbVaNKPf//fIXEsthHu/QqGe9vwP+291ql2tV0Gl799I/1/sHaCBdvH4sAAyPFW35bVIthSW+kad4i6oZ/FDzVpGQj7kYJ0SrAJuYmcRjbYLY5ofusmPp7tJpA8T/1NQtLq5vukpTw/ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4XywKSEXI4+bPF+ueIQgZkDCKwfZGgH4gJHexFcHMeI=;
 b=d/yrtvicE3vZE4MxfyjeOJhr70w5aVYEaraljlIwb5nI6IYfwt2vwen4ANpVn2wd/dxiGKYZll3V5RSRDm8nlvy6GJo9rJ5Alo/QuIUXDcFGh8DdPlaIfhccjpg0GvcbVJUVJCVZ+g+q+GBZJCUmzVxe505LPTQAU1ADNM/wAOaanHmKgBuJPhAEHonuSnyI6s/DBXBn9iNaFBzo94slbci8R/El/qgCIUwj9VMHhQPvWfG5NiLGhDY1CbRSDuly2JkmTVggv1IFecVEUn2fD8LHOldKZ4rSlQxNXX2otLfhjNfNkJDLgU1NQrVNhZjPmDIHmaThVVJAfjj8jdD0CA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4XywKSEXI4+bPF+ueIQgZkDCKwfZGgH4gJHexFcHMeI=;
 b=OwE2ajHdRBbYiqqZbKLuEuSiF+2Qn/Fipl9RofXucTWga/rdA32CGcxlQmCFLh/DDRmeX4fI6qoYLX9Ch/e92/R2wthFO8f7e4sTxbcCPOVrokKXHjAEdUaFVQUCM5TGlc0V4pEPJ/0fMJOaTjQUO0frmdtXWROVVAZyOInhvcdswb+bW91uJvf6gaf1g88pJnIlhwEn2sCQknwWCnv79GO4c0kg/JZ2h0C0cHHho7cxwaCy72W0FXKrFPCXu7gQVQ8w/fx5hH47cYP+hDy6/75Mp59RLQfOk10fLgm3/M2X2idPrLRiQgjT58j0pr95kBVP4t9QHR+FzWCgqJ1uFw==
Received: from DS7PR03CA0160.namprd03.prod.outlook.com (2603:10b6:5:3b2::15)
 by MW4PR12MB7119.namprd12.prod.outlook.com (2603:10b6:303:220::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Thu, 18 Dec
 2025 20:27:37 +0000
Received: from DS3PEPF0000C381.namprd04.prod.outlook.com
 (2603:10b6:5:3b2:cafe::51) by DS7PR03CA0160.outlook.office365.com
 (2603:10b6:5:3b2::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.6 via Frontend Transport; Thu,
 18 Dec 2025 20:27:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DS3PEPF0000C381.mail.protection.outlook.com (10.167.23.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Thu, 18 Dec 2025 20:27:37 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 18 Dec
 2025 12:27:23 -0800
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 18 Dec
 2025 12:27:23 -0800
Received: from Asurada-Nvidia.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Thu, 18 Dec 2025 12:27:22 -0800
From: Nicolin Chen <nicolinc@nvidia.com>
To: <will@kernel.org>, <robin.murphy@arm.com>, <jgg@nvidia.com>
CC: <joro@8bytes.org>, <jpb@kernel.org>, <praan@google.com>,
	<miko.lenczewski@arm.com>, <linux-arm-kernel@lists.infradead.org>,
	<iommu@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	<patches@lists.linux.dev>
Subject: [PATCH v1 8/9] iommu/arm-smmu-v3: Remove ASID/VMID from arm_smmu_domain
Date: Thu, 18 Dec 2025 12:26:54 -0800
Message-ID: <cfc55bbfdf1dfbc23740f9cad1f4a324c40ce463.1766088963.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1766088962.git.nicolinc@nvidia.com>
References: <cover.1766088962.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C381:EE_|MW4PR12MB7119:EE_
X-MS-Office365-Filtering-Correlation-Id: e7f08ce6-cb38-417c-d229-08de3e73e283
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|1800799024|82310400026|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?4KoaL8DhnUgMKXxfMY+ctRsV6RnxTIeFYItUMlWIzoyLyEvqykkdsfymfHfd?=
 =?us-ascii?Q?whZ6LXxwmIWoLbEkcrgkvKcOWIJ1Rz9t+XxmDF6FsjFxwdG3oIpHJR+vayu1?=
 =?us-ascii?Q?nEkMX6psM/6EToW1+X6v4TZDWtxnPgu4PxP/aYarZpTl1hvVp7nIhmhsA3Ia?=
 =?us-ascii?Q?qK6t/00Y6BmOlv4hfvS7axcd2AP6HYMiS4l6Qf+fKod2f1+OzGA5/oiEysfo?=
 =?us-ascii?Q?uVtOgPvjSkO/PRsVw9QRA/BOZodXgyZ7Z7R/vtjRo3fx6fkt79eQyac6S7pn?=
 =?us-ascii?Q?FcpOkhjgDJ6EXp1r2xAdYKS93ZCmmaAsQLrOErh0tnTwGHu2Q+VFNHxW8jEK?=
 =?us-ascii?Q?05CI+NHI+/kRR1a1IenpOD3zhgx2tttqOVNrVlR2mz5SGTAkekfHicR4Z3zn?=
 =?us-ascii?Q?s/DhXsAtnds6ZHPxbltywhAPD8fo66BY5YVXD5z410Y8jGla/wBCYk1ToslP?=
 =?us-ascii?Q?NYZ1zVrRcI/EvTB67k5+1THqXEzTkYm7qcMF15IXoVQ4XMv8QlUJ/W+cb77L?=
 =?us-ascii?Q?pfkgN001SoU7eCo8++3HQdnij8zeKjrdGUG+KZJiYHlO3lW2Jw9l2bjqSUVd?=
 =?us-ascii?Q?5d2hfs8tc8OzlOAE40bp15lZ5E/9aXsWIXnqLYZyQbAFpLHRbrD1YMKMXwil?=
 =?us-ascii?Q?L8r5/g/gzprp6wwyhH+IpCY69OvQMgj0mPT1U2Vc79G5jZz8833jErwPqRqw?=
 =?us-ascii?Q?qdpNLAfypZYBSjjluJ0JKQC4ZXYl/jusvNCLEosZ8si9kLENXNjAqTrpfah5?=
 =?us-ascii?Q?Jx9Ih0AxH1a+W7k0ZIlUxHk1+zlsjk6semL4Db6y8ffsR+QSBjoJ5uXeczQ9?=
 =?us-ascii?Q?qK7JFV/EQzTu9fkWqZwmxt68gPvdX00DroXavNXlPBWfQyNEvIe/qbCxB9bO?=
 =?us-ascii?Q?5IvwiQzCrCIq/Jbx5L9XY1EZVYvF1grjjfpAfgaS2BnMa2ZjvDcRKcbWwYUg?=
 =?us-ascii?Q?PnlD5f7OoxZcGojtSit36tBLS6wh57k6b4lSLLG9UziBLJU0TJ5UExTQdJHY?=
 =?us-ascii?Q?p1i5y/cf1RILb2WqUJpO2Zo5nSdwkDzb06rbNYx3jWuEzYtVnchH3QLgv700?=
 =?us-ascii?Q?Zw0IdRIKhdoR6boWfd3nO/J/TGOYiTZhQP8uYKsoek6kd7AHqPUlkKXLlpaF?=
 =?us-ascii?Q?2M8XnwXHL9M/ATfD6H9PndlhjT3tLY4BqaB5gEBodHnxR5qbXrIdIVgh9enn?=
 =?us-ascii?Q?SzMiyv5w8BaDKtr5DtTCvqOp7YQUDZj8WCR3biUxVZmXu6mqxK5EVFb7VcXB?=
 =?us-ascii?Q?rYkyYPqkF8UAxecxGNiPtbZWsS6ranrpRb/2LMhpiIVWD/KhN1j11eCXteOp?=
 =?us-ascii?Q?Me9FMME8InwNnnFxyB0Ko5jzZ95GiELzvMZ/pusi2T0wyFrnODcm4upGCVYr?=
 =?us-ascii?Q?4ULQco18e57Bod8tv5kmf07EONuEpyxIwz6ZdndiOet+E0RH4qisS422YwUt?=
 =?us-ascii?Q?GdQZIpS4X7UaiVHnJsgkhx9/JH6XTwxqn5HN+UW8ZhfzeGQk2Vxcg9/rDS0g?=
 =?us-ascii?Q?Ytly4AchlHfXd9TFEAMzpYRa5eFQUZci7blYOctykKiU1JFI4yhPtVjfA7ft?=
 =?us-ascii?Q?vG7ZjOVG1J0BcoUtri8=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(7416014)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 20:27:37.4102
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e7f08ce6-cb38-417c-d229-08de3e73e283
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF0000C381.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7119
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_122746_676999_6DF41A63 
X-CRM114-Status: GOOD (  17.48  )
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

Now ASID/VMID are stored in the arm_smmu_master. These are dead code now.

Remove all.

Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h   |  8 ---
 .../iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c   | 20 +------
 .../iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c  |  3 -
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c   | 58 -------------------
 4 files changed, 1 insertion(+), 88 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
index e38d2394e3be..4d7b7eb52dfd 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
@@ -792,10 +792,6 @@ static inline bool arm_smmu_ssids_in_use(struct arm_smmu_ctx_desc_cfg *cd_table)
 	return cd_table->used_ssids;
 }
 
-struct arm_smmu_s2_cfg {
-	u16				vmid;
-};
-
 struct arm_smmu_strtab_cfg {
 	union {
 		struct {
@@ -974,10 +970,6 @@ struct arm_smmu_domain {
 	atomic_t			nr_ats_masters;
 
 	enum arm_smmu_domain_stage	stage;
-	union {
-		struct arm_smmu_ctx_desc	cd;
-		struct arm_smmu_s2_cfg		s2_cfg;
-	};
 
 	struct iommu_domain		domain;
 
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c
index 0e534f2b72e0..ea5ce3e6514e 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c
@@ -282,14 +282,6 @@ static void arm_smmu_sva_domain_free(struct iommu_domain *domain)
 	 */
 	arm_smmu_domain_inv(smmu_domain);
 
-	/*
-	 * Notice that the arm_smmu_mm_arch_invalidate_secondary_tlbs op can
-	 * still be called/running at this point. We allow the ASID to be
-	 * reused, and if there is a race then it just suffers harmless
-	 * unnecessary invalidation.
-	 */
-	xa_erase(&arm_smmu_asid_xa, smmu_domain->cd.asid);
-
 	/*
 	 * Actual free is defered to the SRCU callback
 	 * arm_smmu_mmu_notifier_free()
@@ -308,7 +300,6 @@ struct iommu_domain *arm_smmu_sva_domain_alloc(struct device *dev,
 	struct arm_smmu_master *master = dev_iommu_priv_get(dev);
 	struct arm_smmu_device *smmu = master->smmu;
 	struct arm_smmu_domain *smmu_domain;
-	u32 asid;
 	int ret;
 
 	if (!(master->smmu->features & ARM_SMMU_FEAT_SVA))
@@ -327,22 +318,13 @@ struct iommu_domain *arm_smmu_sva_domain_alloc(struct device *dev,
 	smmu_domain->domain.pgsize_bitmap = PAGE_SIZE;
 	smmu_domain->stage = ARM_SMMU_DOMAIN_SVA;
 	smmu_domain->smmu = smmu;
-
-	ret = xa_alloc(&arm_smmu_asid_xa, &asid, smmu_domain,
-		       XA_LIMIT(1, (1 << smmu->asid_bits) - 1), GFP_KERNEL);
-	if (ret)
-		goto err_free;
-
-	smmu_domain->cd.asid = asid;
 	smmu_domain->mmu_notifier.ops = &arm_smmu_mmu_notifier_ops;
 	ret = mmu_notifier_register(&smmu_domain->mmu_notifier, mm);
 	if (ret)
-		goto err_asid;
+		goto err_free;
 
 	return &smmu_domain->domain;
 
-err_asid:
-	xa_erase(&arm_smmu_asid_xa, smmu_domain->cd.asid);
 err_free:
 	arm_smmu_domain_free(smmu_domain);
 	return ERR_PTR(ret);
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c
index 5c8cb43f849c..b174ac2dfb4b 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c
@@ -458,9 +458,6 @@ static void arm_smmu_test_make_s1_cd(struct kunit *test, struct arm_smmu_cd *cd,
 	struct io_pgtable io_pgtable = {};
 	struct arm_smmu_domain smmu_domain = {
 		.pgtbl_ops = &io_pgtable.ops,
-		.cd = {
-			.asid = asid,
-		},
 	};
 
 	io_pgtable.cfg.arm_lpae_s1_cfg.ttbr = 0xdaedbeefdeadbeefULL;
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 5052988b0e4e..04e21af9c578 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -2812,66 +2812,17 @@ struct arm_smmu_domain *arm_smmu_domain_alloc(void)
 static void arm_smmu_domain_free_paging(struct iommu_domain *domain)
 {
 	struct arm_smmu_domain *smmu_domain = to_smmu_domain(domain);
-	struct arm_smmu_device *smmu = smmu_domain->smmu;
 
 	free_io_pgtable_ops(smmu_domain->pgtbl_ops);
-
-	/* Free the ASID or VMID */
-	if (smmu_domain->stage == ARM_SMMU_DOMAIN_S1) {
-		/* Prevent SVA from touching the CD while we're freeing it */
-		mutex_lock(&arm_smmu_asid_lock);
-		xa_erase(&arm_smmu_asid_xa, smmu_domain->cd.asid);
-		mutex_unlock(&arm_smmu_asid_lock);
-	} else {
-		struct arm_smmu_s2_cfg *cfg = &smmu_domain->s2_cfg;
-		if (cfg->vmid)
-			ida_free(&smmu->vmid_map, cfg->vmid);
-	}
-
 	arm_smmu_domain_free(smmu_domain);
 }
 
-static int arm_smmu_domain_finalise_s1(struct arm_smmu_device *smmu,
-				       struct arm_smmu_domain *smmu_domain)
-{
-	int ret;
-	u32 asid = 0;
-	struct arm_smmu_ctx_desc *cd = &smmu_domain->cd;
-
-	/* Prevent SVA from modifying the ASID until it is written to the CD */
-	mutex_lock(&arm_smmu_asid_lock);
-	ret = xa_alloc(&arm_smmu_asid_xa, &asid, smmu_domain,
-		       XA_LIMIT(1, (1 << smmu->asid_bits) - 1), GFP_KERNEL);
-	cd->asid	= (u16)asid;
-	mutex_unlock(&arm_smmu_asid_lock);
-	return ret;
-}
-
-static int arm_smmu_domain_finalise_s2(struct arm_smmu_device *smmu,
-				       struct arm_smmu_domain *smmu_domain)
-{
-	int vmid;
-	struct arm_smmu_s2_cfg *cfg = &smmu_domain->s2_cfg;
-
-	/* Reserve VMID 0 for stage-2 bypass STEs */
-	vmid = ida_alloc_range(&smmu->vmid_map, 1, (1 << smmu->vmid_bits) - 1,
-			       GFP_KERNEL);
-	if (vmid < 0)
-		return vmid;
-
-	cfg->vmid	= (u16)vmid;
-	return 0;
-}
-
 static int arm_smmu_domain_finalise(struct arm_smmu_domain *smmu_domain,
 				    struct arm_smmu_device *smmu, u32 flags)
 {
-	int ret;
 	enum io_pgtable_fmt fmt;
 	struct io_pgtable_cfg pgtbl_cfg;
 	struct io_pgtable_ops *pgtbl_ops;
-	int (*finalise_stage_fn)(struct arm_smmu_device *smmu,
-				 struct arm_smmu_domain *smmu_domain);
 	bool enable_dirty = flags & IOMMU_HWPT_ALLOC_DIRTY_TRACKING;
 
 	pgtbl_cfg = (struct io_pgtable_cfg) {
@@ -2891,7 +2842,6 @@ static int arm_smmu_domain_finalise(struct arm_smmu_domain *smmu_domain,
 		if (enable_dirty)
 			pgtbl_cfg.quirks |= IO_PGTABLE_QUIRK_ARM_HD;
 		fmt = ARM_64_LPAE_S1;
-		finalise_stage_fn = arm_smmu_domain_finalise_s1;
 		break;
 	}
 	case ARM_SMMU_DOMAIN_S2:
@@ -2900,7 +2850,6 @@ static int arm_smmu_domain_finalise(struct arm_smmu_domain *smmu_domain,
 		pgtbl_cfg.ias = smmu->ias;
 		pgtbl_cfg.oas = smmu->oas;
 		fmt = ARM_64_LPAE_S2;
-		finalise_stage_fn = arm_smmu_domain_finalise_s2;
 		if ((smmu->features & ARM_SMMU_FEAT_S2FWB) &&
 		    (flags & IOMMU_HWPT_ALLOC_NEST_PARENT))
 			pgtbl_cfg.quirks |= IO_PGTABLE_QUIRK_ARM_S2FWB;
@@ -2918,13 +2867,6 @@ static int arm_smmu_domain_finalise(struct arm_smmu_domain *smmu_domain,
 	smmu_domain->domain.geometry.force_aperture = true;
 	if (enable_dirty && smmu_domain->stage == ARM_SMMU_DOMAIN_S1)
 		smmu_domain->domain.dirty_ops = &arm_smmu_dirty_ops;
-
-	ret = finalise_stage_fn(smmu, smmu_domain);
-	if (ret < 0) {
-		free_io_pgtable_ops(pgtbl_ops);
-		return ret;
-	}
-
 	smmu_domain->pgtbl_ops = pgtbl_ops;
 	smmu_domain->smmu = smmu;
 	return 0;
-- 
2.43.0


