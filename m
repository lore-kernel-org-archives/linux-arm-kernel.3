Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4250E1091912
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 19:52:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YNqS754zc2dQMi4reEzTKmYlvcdRMZaozl2XYiOFbyw=; b=2YoBsHa4uhxSzpivUrH1mL6Q1Y
	8P/ut9vGFcKSzrgULV8yD+Iioy3QvCVajx5DXKoqKWPmF9hZgCUywIv3KgMxhNjvDG7czaSZ8bQa3
	yMpSKa75HVAYOv1EGcCBmHfID/dg9ZfPUWa3hSFrIV6Mf2+bSOgUfp7BGRcLiFm//5Qzml5QDFV4Z
	/BcGR15LpBi5TKRhVfs+PJqMQ+X3VLE7wIgQMU8S5oQLG3UtJtOYNx5aaa3FAdPWEWXV2hLvRKQAb
	UTQ1uKythdQ/fwqjxdY9cCeWdtvzPr1JpbYHFUzTVDqBhI9M1zJFJMym2sMpLOSaAUsUsg9juZuHS
	OO4sbEiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3JQC-0000000BTNg-1msr;
	Thu, 19 Mar 2026 19:52:44 +0000
Received: from mail-eastusazon11011071.outbound.protection.outlook.com ([52.101.52.71] helo=BL2PR02CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3JQ1-0000000BTI7-1k3S
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Mar 2026 19:52:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T3wFAxw9OpDu9DGsgAPJyC6BUrpUZhNhhkUeWUs0UyUcnazyeaD9OmfZ6iT/8B9Yeg9h0MOttRsT4yeTVGuJ9+4cAEAJfe7vM0CImuzgYFZ6dx83i9A36suyCI6RLqxV+8iNdzBc6qi6t/5eGKoPEDzqJGaILTx34Q9XLFm53vLrHdLQJyfw6E35c0DPQ6InoolVB4KtLkbeggQKoId5M08t6Aa2+hTaNqX/WPJg/82XEa+ErnXTzCznHB1ppmwlUZyEhpz4uTCVwRYdq3+8Swn5Ip9FM7UxJ8gvEZ9Cnj9v4Pg1MJvZ5KoPuDcYKMby3bnJcjAsRZ26KQ9OmX3qGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YNqS754zc2dQMi4reEzTKmYlvcdRMZaozl2XYiOFbyw=;
 b=hVtcLpxAk4bTNnf+KgCLoQIAnTWG0WBRcyFpqTSLpwtNsIh6o4PCDAGmfyrRZzxdzVULA//VgO7CV1/XO5fy21g3LXzU6cTGvtRLK4u3aoHo6goejEpkoFoy7nR58MEG28zImaGmjeJvyCbeAfagTn9X7zPWj01FAtQQG8tM2RrJLTNvF6xVoKrtiq8cjhaAjFsP0Ea803ZGcR5ag3GifFAboXUe1NNe8OB73JzwipHLKsqpNIMnla97X7asrmI7XARSTT+Z4fwpGREkOTemtOMXsjN+Cn+8HiNkvvYXLGVgTqynRM28HsJoMN8s5N/yTyi4syYCNFT0iq/p0d+nDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YNqS754zc2dQMi4reEzTKmYlvcdRMZaozl2XYiOFbyw=;
 b=ADDD7Z26MoYMSdgDC5WT6dbFm2ffz3r0H5KaqRLyOA/w3eDUXl6EoZZNi1nWT8Ebay9FkcsvmlpkljINOX/ADb+phmmS/fyDgDG+DiBFe6LGyUg2BOvdy4ZCSzzKkDpajQy9qVYlSQpxgxIAtnePR3S9FOx6aVfh7Hexw9pVQ3w5PwsKFWEXpYbpaMeVE8UzlF71jAWQS8+g5c0cy4ETi4hjbiHq3QTByMbwZUADuYW4XwQij6ZgK7yoIUnlZYR6AEFa6akdCMD84NjgV8LH23+MBTCrNMg2BhjDhnQdz4Nbu1f73HdRJMZB1R3T+T8OVuG83eh4tFbrF2/Igtusfw==
Received: from SJ0PR05CA0196.namprd05.prod.outlook.com (2603:10b6:a03:330::21)
 by LV8PR12MB9261.namprd12.prod.outlook.com (2603:10b6:408:1ed::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.9; Thu, 19 Mar
 2026 19:52:24 +0000
Received: from SJ5PEPF000001C8.namprd05.prod.outlook.com
 (2603:10b6:a03:330:cafe::28) by SJ0PR05CA0196.outlook.office365.com
 (2603:10b6:a03:330::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.20 via Frontend Transport; Thu,
 19 Mar 2026 19:52:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SJ5PEPF000001C8.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Thu, 19 Mar 2026 19:52:23 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 19 Mar
 2026 12:52:06 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 19 Mar
 2026 12:52:05 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Thu, 19 Mar 2026 12:52:04 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: <will@kernel.org>, <jgg@nvidia.com>
CC: <robin.murphy@arm.com>, <joro@8bytes.org>, <jpb@kernel.org>,
	<praan@google.com>, <smostafa@google.com>,
	<linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<jonathan.cameron@huawei.com>
Subject: [PATCH v4 02/10] iommu/arm-smmu-v3: Pass in arm_smmu_make_cd_fn to arm_smmu_set_pasid()
Date: Thu, 19 Mar 2026 12:51:48 -0700
Message-ID: <d629f81f2a30bb6fa06ec00b35134cb6bab80a48.1773949042.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1773949042.git.nicolinc@nvidia.com>
References: <cover.1773949042.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001C8:EE_|LV8PR12MB9261:EE_
X-MS-Office365-Filtering-Correlation-Id: 83452367-6268-46c2-6871-08de85f10a3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|7416014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: ga3oTRC8Dv4jGNKSl+2jsErVQDwA2U0dDpcEntA9hKaPn26xAv2YRwujjpiYHknWXmJO4grdElkmAL1PZLxDkFs8fNo/pltIhF+IvgqAMyZJYhb7cZUMjlrUZfrFizb6UtgQXC8Rf45YvUZaayZUC0yuj3KFg+83wPznVU+ckvwupjIiS4oaGddrO37kE13eoS6ZqtrwGJe8wLkqQhogi2j9Xp15tXvbs36si6FTi0EckwGSkSBmVaP4flcjC2yZETNC2huPjbVGEqdi2s2zq/YoSHprgFpyVMyCKm1CXv8YVYUyO86neCTWwZ38IXmCHm5m0AGJL+9Jf7ugA+8unObziI8hlvudw1USgNwG1QdppsCMJ/j/rz3Uw9b0YUY/iNbXyagalnA+lvcfSQn4ffEycqtRbty5hQ2T1/mPynbuWumheJSN25YwyUtaXeCsgmQyw3K7Beu1xCA6hCSjgqycATTMLyG/0oNYlARP3LRFzlhyYko9GqOAyd374LQsvc4d92NQMUmFhbdPGzzIgAUpkadLUgf16oLzcX2AZYZZI1dH3q+Rj6kfc/nMIKD8Fh8RdChogn70+2pXyMafq8g5c0jspKChY9l517WqLWn55h4sD2HuGfB+WmQs0mRrohbuPM5+ufjiivf78Na8zrlURbvIUUs8DpnRdi4cuQSTJtk1butxe92LQCf1LGsnvNGUFmETaa4h+TIyz9IOmi7pSNNzYsyTENciX6GhtuH/pgN1jPw4PpBedADl3u+on8cognwQm91h9avxDf3Ieg==
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(7416014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: svNs8CrAdelQ5vjrGDW/yn/VHMOu00g4cc10zRlRQqzVfSP3J8YKGPBW4eQDMtO+Zbdadw/XQXYQBkQLQTuLg7eEXTd6Rm0nKnM8217xLIYTSdTtuwcBj+P/QqcgmA0vZRcYIxb/dIGwBHoszcPWrWKp+SPqDds8lNLL4Ok16+xDX+Y9YW0kx9CZfPq3UqyeRxS3ML01YM0okeetANlHNT7FDE0ETcg/HEp5GUqNmr6m5FVBsDEFrkrgxGVc/1HS+ie+swvNO7V6z9u49UgDUfecukjjRNxLFUD5v99bi4aOg7CH+x3lgHZkFJ4eItmUHNJlYh+vO3e43ENtz5EtXTv2LfSMnuTxcrWMdtd4r3CdfXjuo0bLLz5Ujlj8x2GGsnH+sLrWMBBks9dj8oYOFyV/di9V7xNyTR7kDR7Ot51/4D5y26s7krge69XV/GqX
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2026 19:52:23.7364
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 83452367-6268-46c2-6871-08de85f10a3e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001C8.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9261
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_125233_452191_D1D67EB0 
X-CRM114-Status: GOOD (  16.35  )
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

To install a domain (CD) to a substream, the common flow in the driver is:
 - Make an S1 or SVA CD outside arm_smmu_asid_lock
 - Invoke arm_smmu_set_pasid() where it takes arm_smmu_asid_lock, and fix
   the ASID in the CD.

The reason for such a flow is for the timing of arm_smmu_asid_lock, since
it was too early to take the mutex outside the function.

Tidy it up by passing in a function pointer for CD making,, which supports
both existing functions: arm_smmu_make_s1_cd() and arm_smmu_make_sva_cd().

Then arm_smmu_set_pasid() can make a CD inside the lock where ASID is safe
to access.

Suggested-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h   |  7 ++++++-
 .../iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c   |  4 ++--
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c   | 19 ++++---------------
 3 files changed, 12 insertions(+), 18 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
index dd5d2b5acf664..a31f9f7f39d3a 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
@@ -1076,9 +1076,14 @@ void arm_smmu_write_cd_entry(struct arm_smmu_master *master, int ssid,
 			     struct arm_smmu_cd *cdptr,
 			     const struct arm_smmu_cd *target);
 
+typedef void (*arm_smmu_make_cd_fn)(struct arm_smmu_cd *target,
+				    struct arm_smmu_master *master,
+				    struct arm_smmu_domain *smmu_domain);
+
 int arm_smmu_set_pasid(struct arm_smmu_master *master,
 		       struct arm_smmu_domain *smmu_domain, ioasid_t pasid,
-		       struct arm_smmu_cd *cd, struct iommu_domain *old);
+		       struct arm_smmu_cd *cd, struct iommu_domain *old,
+		       arm_smmu_make_cd_fn make_cd_fn);
 
 void arm_smmu_domain_inv_range(struct arm_smmu_domain *smmu_domain,
 			       unsigned long iova, size_t size,
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c
index 414fc899140f7..4370cb88c57cf 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c
@@ -273,8 +273,8 @@ static int arm_smmu_sva_set_dev_pasid(struct iommu_domain *domain,
 	 * This does not need the arm_smmu_asid_lock because SVA domains never
 	 * get reassigned
 	 */
-	arm_smmu_make_sva_cd(&target, master, smmu_domain);
-	ret = arm_smmu_set_pasid(master, smmu_domain, id, &target, old);
+	ret = arm_smmu_set_pasid(master, smmu_domain, id, &target, old,
+				 arm_smmu_make_sva_cd);
 
 	mmput(domain->mm);
 	return ret;
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 01030ffd2fe23..78d45952db7da 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -3738,13 +3738,8 @@ static int arm_smmu_s1_set_dev_pasid(struct iommu_domain *domain,
 	if (smmu_domain->stage != ARM_SMMU_DOMAIN_S1)
 		return -EINVAL;
 
-	/*
-	 * We can read cd.asid outside the lock because arm_smmu_set_pasid()
-	 * will fix it
-	 */
-	arm_smmu_make_s1_cd(&target_cd, master, smmu_domain);
 	return arm_smmu_set_pasid(master, to_smmu_domain(domain), id,
-				  &target_cd, old);
+				  &target_cd, old, arm_smmu_make_s1_cd);
 }
 
 static void arm_smmu_update_ste(struct arm_smmu_master *master,
@@ -3774,7 +3769,8 @@ static void arm_smmu_update_ste(struct arm_smmu_master *master,
 
 int arm_smmu_set_pasid(struct arm_smmu_master *master,
 		       struct arm_smmu_domain *smmu_domain, ioasid_t pasid,
-		       struct arm_smmu_cd *cd, struct iommu_domain *old)
+		       struct arm_smmu_cd *cd, struct iommu_domain *old,
+		       arm_smmu_make_cd_fn make_cd_fn)
 {
 	struct iommu_domain *sid_domain =
 		iommu_driver_get_domain_for_dev(master->dev);
@@ -3805,14 +3801,7 @@ int arm_smmu_set_pasid(struct arm_smmu_master *master,
 	if (ret)
 		goto out_unlock;
 
-	/*
-	 * We don't want to obtain to the asid_lock too early, so fix up the
-	 * caller set ASID under the lock in case it changed.
-	 */
-	cd->data[0] &= ~cpu_to_le64(CTXDESC_CD_0_ASID);
-	cd->data[0] |= cpu_to_le64(
-		FIELD_PREP(CTXDESC_CD_0_ASID, smmu_domain->cd.asid));
-
+	make_cd_fn(cd, master, smmu_domain);
 	arm_smmu_write_cd_entry(master, pasid, cdptr, cd);
 	arm_smmu_update_ste(master, sid_domain, state.ats_enabled);
 
-- 
2.43.0


