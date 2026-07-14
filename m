Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7996CC4450C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 18:46:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aRHucy8CnAP6Bxyvyw8yydP/pRiw67ZAeW13REYiPYk=; b=4B93QXgZRyw9vCCYIDhG1WmGyK
	mSM3+I+MX9/jXLhoS2ofnYcCBn49nsG3h5uLjA7FwNDaefDbFiX/kBsiJG74MHEvaw+lERUzRmYC7
	Gix/KnJ24ETnPBznqkPKLMLixhiH7c7AJcbDL2QXBH64DMl4rlG6A8vpgWPVocj2M9NdgpnWS+Yoo
	Zi5IH/Tn7jAvYg9FwKo+f9VMS+LZrwCZJZPHDbAqZn3RrazxURysK4e07tl+oICqCt+By2BfnCV7U
	/vWAp0Z8XBl1hy7FRbhZspqJ+hCWw6OuCr57aEKi2wpLMZ25bOu1ceg/91apsJ1nZHBfLHxX0Q9Iv
	x4854A/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wji9O-0000000CugR-3aZe;
	Tue, 14 Jul 2026 18:46:38 +0000
Received: from mail-southcentralusazon11012026.outbound.protection.outlook.com ([40.93.195.26] helo=SN4PR2101CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wji9F-0000000CuUP-2utH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 18:46:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jm30z4KvtZVXLV288hh0wbg1UG682EvtaMEvOCk4THVZk/8NROBufMnniylNMGR8sWMOOk/ZLxPmDvoRydTuaS1KhexiarC18/B1HHnD0MOw4SGE+kPx3bxU8g2/oUOqSZYfTEMrBhgO0jMYSxruYXOlOSuhJPwYyg3nj23cq595e1KkWRPSPRGLrRYWpgZiBy75xvyvnrNaunDs3j9rjhG5m3NFAzkNG+4r6pZdA03E7ZV8CoQV7rAbDoDytePWAA/9QQgRnpIf98aq1eyWMLZlUBLUTkKmsv3nJzLv8ZV4L4AQbAL9wJnBrT8eTKW9so2CUraQFzS5Yaw6ztpL+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aRHucy8CnAP6Bxyvyw8yydP/pRiw67ZAeW13REYiPYk=;
 b=oL5ppIBAiPxgRT1IECHM6p5xunugK2l5DOYc1BsvYGgByKd6OvBnHO2ll0rJ/okvUlJbquPg1Vre5ypsF5FsJ973/7Lc8dV4ZFJiqVJrdWsOwkzcKryAv1RNZ2tjZ2DcJST0XYV6Qy1VF9ELIG0g+2ZBsfmTir/ajaimb8IZIAnotgWN/QbCLeMTzEE4Z69S7HSqlZ2YtGYm50IEJ6UcZQyF45uQ+36fHRrcUDfuV5AoyVZpm/tIrHXeNij/kYNubv0jlbp4emb8qFZmYTPSvkYT+XeC6q9BK1NNIA0yAkmbcBV2tZ+fVrrfUk1kfPEp+DLEFKuA+8S0IbbmfQCg/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aRHucy8CnAP6Bxyvyw8yydP/pRiw67ZAeW13REYiPYk=;
 b=sz1etU44RWZecm2rqahVzg8IJBwgEF8pElX+4b0SiymUOBxIUwlHZ5qLZz5ZHRJiluB73NMwLifSXyfOQk8hzxA/OErNRuUBwHLO7GfQSvEZkwJZ/alfMwfy5di/22gmRFxhW2B08uPYHuxagj/nRY0uPVHHdG+4JTly/kRoUt4MeZL1+ERdMEKrELbBcWlKNyJBbL1L08AxVI+w0GZ7LyYVH/5tNoS6x/Mg+G+JicqWw7sjJIxZ405BM7KcMKGYBdvOAawMD5Fh5nh++/OrGYsW0CQOP34nxD39RObBqaifobU5M4v1CJWHkrEan3rr6xETtOsv8hqZmM7jE/Zztw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by DS7PR12MB5933.namprd12.prod.outlook.com (2603:10b6:8:7c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Tue, 14 Jul
 2026 18:46:18 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%4]) with mapi id 15.21.0202.014; Tue, 14 Jul 2026
 18:46:18 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: iommu@lists.linux.dev,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Jean-Philippe Brucker <jpb@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Robin Murphy <robin.murphy@arm.com>,
	Will Deacon <will@kernel.org>
Cc: David Matlack <dmatlack@google.com>,
	Nicolin Chen <nicolinc@nvidia.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	patches@lists.linux.dev,
	Pranjal Shrivastava <praan@google.com>,
	Samiullah Khawaja <skhawaja@google.com>,
	Mostafa Saleh <smostafa@google.com>
Subject: [PATCH v3 6/8] iommu/arm-smmu-v3: Populate the tlbi at the top of the call chain
Date: Tue, 14 Jul 2026 15:46:06 -0300
Message-ID: <6-v3-4e7f64f4e094+85e-smmu_tlbi_jgg@nvidia.com>
In-Reply-To: <0-v3-4e7f64f4e094+85e-smmu_tlbi_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN9PR03CA0520.namprd03.prod.outlook.com
 (2603:10b6:408:131::15) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|DS7PR12MB5933:EE_
X-MS-Office365-Filtering-Correlation-Id: bd4ec764-acde-48dc-3b97-08dee1d82d2c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|7416014|366016|1800799024|56012099006|22082099003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info: fjf3mBhjr8mmrSMB6yNBQmIE6PRZ1Rii5jVUPFLyPhwn4SgfSHPSV+djZKlBkMCZ0JWxa+PEsfNRx9w+ReU8Ke6J/A2B6si4rWAbGtKWRylf+QDasX+1Cw1/wyrqZiDsYsCkNJa2yuF/b3xKvvlNZRwcI0rUMFa8jytgXmtEVLG2sHlonYC0V9UHkbi531OJlvtUxrLlqGLbpUq5StajgPXyMbbdcwrSv7k3WOeTdsMIrBIoR+LdvEWaOb6ELC7zkAoobE5P9w8NrGcY6Lsva1Ltp59E8fNHGU5Loa/WDZN09x+6Y3uwc4QHuLyMOmZtaWcxNRBvBAgtKPiJavZ/L/BbHLT56cqCRNqlI/2Yzf1eryKk7XwCsOIbhOlYWCh3RSSS3n46Z2nsNQgLhV8DfcRNzvFrjUQtFAg8DIPK04gG02zsyMOHwLFQfLXu19lbPk4wUHk/q5GXtdDGiFPPqqS7lkJRT21sF6ubG5lV5obmuBngXAedyd3/AGj1hyHmHU/ZxR64gV9r2uDAiw93pG1qM73WfWvLONtgeQB1slay1N7WfyZZATbCn27GqnfG8n6PA7Vv1n4kmjwugEuzHfVj2XX33vfESLFH1LC8JYOQ9ByO7BTRoSfNn9OQfQy7MNtRdpNpsRWfGYIezpk8FXmoSy4TprBwZRvrJiDnkIU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(366016)(1800799024)(56012099006)(22082099003)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?s0IaVfoUCCthQjEQvzaubH6nXga/c6/OLyfnFdvSg575b0kgCNRL36JoHDqj?=
 =?us-ascii?Q?TZl8YMB8+/fed+KevCQSLe0DfTknUZv4mNopV/V9C9E4gckZnh4UvPfFI8fh?=
 =?us-ascii?Q?nkM69OSzeTKafC0n9wqZOLkFY3TIHFY3U3xQlxAdzWAKwFurFeDiyACAWBPS?=
 =?us-ascii?Q?h2KnCLvaHTRP/9M4TDmbrS42baTDlL5HLPkEUUmUEvHa789n7iW1naUVnuLu?=
 =?us-ascii?Q?n3dzk0T9ykyz4IDzyJVudimCEsFB4BILzUz2Kv7uIrOE2YKsfVqVXHAneZL7?=
 =?us-ascii?Q?VRw86rbJUxsbBZjKPrs1uSD1iYFA6+IzT0r9Z3Nn2j3NxW/wQp5ID129Cu09?=
 =?us-ascii?Q?ebFBEkr5Z/N3Uc/Sbm+UU4KmUOgeB7f0heWeEn0Vp4OpUNhUIwBHUsmCt+wb?=
 =?us-ascii?Q?jBF7n5uGNYh3C1x7Wv2fRSXOYet2TUzZF6WwUav3Miqmzk5OVX89GI5jOaLl?=
 =?us-ascii?Q?vQ5s9uxGDgU0+ihRqCKgHa875x/juai3mkLgW1pqiN+rBFOGJpLbRWx6tth3?=
 =?us-ascii?Q?Qn0wQAonLTMhS65mVvByikKCDvl6EkxcOFuWaDJusIGk0IlpBO1UsfJZ4m3N?=
 =?us-ascii?Q?4Kfhp0M486xDesu6232B6UAkh8BpZrITBp/2fiieApVVbqPMD7tSBHZTSEpX?=
 =?us-ascii?Q?llXYvEWs6TH80HTGIEihAZ1QrwlQa75o62+v2DYg1TSLsrwkGWR4hRvVIdbP?=
 =?us-ascii?Q?zrdRxFG48A5KiOmyBBkXDojCwZoVe5I6wFMaj6B/bFFI5l4o69KxbliqUM/T?=
 =?us-ascii?Q?1VLPqf3/aPolk1HjPc/Wqk3TiyItp7wOyT0xBehenie2Nk4LJHoCA7+8izbU?=
 =?us-ascii?Q?H2V2nOHPyOt/E9KgIPV8YQN4YVX0bB0Z/Lg7GMdFmkKaNaOeB5q2GVoY6oQa?=
 =?us-ascii?Q?iAMgHaAAkO1iWx5cX+H6WpW0TlCNtxjs+sSlyFhJ+3Lr4yd7PT3N/rtcnNpa?=
 =?us-ascii?Q?id1VQxBz/WkA/tYjMzqoDcgwy27lZuq6hiAmTn9hh2gGANBdka0hUymtmjB0?=
 =?us-ascii?Q?yLoK5wihBR4TN7BK+6FvlH+R4wJ3MnSSG2pJ4bDbQgDpT5W4lJIuv4Y0S6kN?=
 =?us-ascii?Q?tMwWya7n3x1ev6K/fuJX6WtWwwWQqt0dRTjPsnOLBl//YCnBdfy6Ek/vcMYU?=
 =?us-ascii?Q?ZwNATe+fdmOBZWS8EPs1JoWS4o8jDRSKMr4oUYm+uPUb9J002HNIwZS92zXh?=
 =?us-ascii?Q?wEkZBWAZcwrEr/CzNPKJCpd7FRC5xg89JFj8A2ghhhW9iJew2GANZT2q3grk?=
 =?us-ascii?Q?oPwP50LLPE9bR1OhBasXQB9m+1lKIJl/w/k44qEtA5kkrcp27/YssAhSL3Vo?=
 =?us-ascii?Q?RjqoVZG5nM7PZh33lqoUQHRwAdn3ZRVEPUoloYPC55c71S5R3OGqYoCpWES4?=
 =?us-ascii?Q?u+/sX4JX/mmEz+SzoODsvADosJmKOpGKrsYGgQFb83Npk7UV4iPJQN0vzkFh?=
 =?us-ascii?Q?3wvJXPiXBrq5uQ/DCJEAz5X7ZTSt4Ndr7xiFCRjr9GOR0SrR6I/8LThh0J+7?=
 =?us-ascii?Q?MPRIcHOHMUtkDvO+T3BB76hsBvqg9KdYdbL6rvCGvZMHNZy6bjlvmmxi2UWs?=
 =?us-ascii?Q?pGFP5DdQ/QZiSi717Vf0bMlxZAY6bXEFF9VtfuKVKy6Z/XvIlXnRnxVJ5nS9?=
 =?us-ascii?Q?C15qus+8zh2+AxVA3fyVOKFSo9wnIxjZM+Z8RnSsmWmq4WQt7TK54D3+vAU7?=
 =?us-ascii?Q?NzU68E1Tmm+SBCDklJr2OjEKUHfvEtc99enQTDUNOn5E2qvL?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd4ec764-acde-48dc-3b97-08dee1d82d2c
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2026 18:46:12.2344
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SS2ws/6FQnkeHz59bkpUwRLulCcBlcEmUQly8He4Tm91DnFRroLKFZWa4+Tq6UA9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5933
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_114629_760959_C69B59B1 
X-CRM114-Status: GOOD (  18.63  )
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

Each of these has their own unique situation, populate the tlbi right
at the top and pass it into arm_smmu_domain_inv_range(). They will
diverge further when the iommupt invalidation scheme is introduced.

Reviewed-by: Nicolin Chen <nicolinc@nvidia.com>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 .../iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c   | 21 ++++----
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c   | 54 ++++++++++---------
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h   | 15 ++++--
 3 files changed, 51 insertions(+), 39 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c
index 5d4dde3d1cfe87..52f4afe3178d21 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c
@@ -139,16 +139,19 @@ static void arm_smmu_mm_arch_invalidate_secondary_tlbs(struct mmu_notifier *mn,
 {
 	struct arm_smmu_domain *smmu_domain =
 		container_of(mn, struct arm_smmu_domain, mmu_notifier);
-	size_t size;
+	struct arm_smmu_tlbi tlbi = {
+		.tgsz_lg2 = smmu_domain->tgsz_lg2,
+		.iova = start,
+		/*
+		 * The mm_types defines vm_end as the first byte after the end
+		 * address, different from IOMMU subsystem using the last
+		 * address of an address range.
+		 */
+		.size = end - start,
+		.iopte_size = PAGE_SIZE,
+	};
 
-	/*
-	 * The mm_types defines vm_end as the first byte after the end address,
-	 * different from IOMMU subsystem using the last address of an address
-	 * range. So do a simple translation here by calculating size correctly.
-	 */
-	size = end - start;
-
-	arm_smmu_domain_inv_range(smmu_domain, start, size, PAGE_SIZE, false);
+	arm_smmu_domain_tlbi(&tlbi, smmu_domain);
 }
 
 static void arm_smmu_mm_release(struct mmu_notifier *mn, struct mm_struct *mm)
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index c712b4d003ec76..c74da1a8ea54f9 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -2664,25 +2664,13 @@ static void arm_smmu_domain_tlbi_inv(struct arm_smmu_tlbi *tlbi,
 	}
 }
 
-void arm_smmu_domain_inv_range(struct arm_smmu_domain *smmu_domain,
-			       unsigned long iova, size_t size,
-			       unsigned int granule, bool leaf)
+void arm_smmu_domain_tlbi(struct arm_smmu_tlbi *tlbi,
+			  struct arm_smmu_domain *smmu_domain)
 {
-	struct arm_smmu_tlbi tlbi = {
-		.tgsz_lg2 = smmu_domain->tgsz_lg2,
-		.iova = iova,
-		.size = size,
-		.iopte_size = granule,
-		.leaf_only = leaf,
-	};
 	struct arm_smmu_invs *invs;
 
-	if (!size || size == SIZE_MAX) {
-		tlbi.single.use_full_inv = true;
-		tlbi.range.use_full_inv = true;
-	} else {
-		arm_smmu_tlbi_calc_single(&tlbi);
-	}
+	if (!tlbi->single.use_full_inv)
+		arm_smmu_tlbi_calc_single(tlbi);
 
 	/*
 	 * An invalidation request must follow some IOPTE change and then load
@@ -2701,7 +2689,7 @@ void arm_smmu_domain_inv_range(struct arm_smmu_domain *smmu_domain,
 	 *
 	 *  [CPU0]                        | [CPU1]
 	 *  change IOPTE on new domain:   |
-	 *  arm_smmu_domain_inv_range() { | arm_smmu_install_new_domain_invs()
+	 *  arm_smmu_domain_tlbi() {      | arm_smmu_install_new_domain_invs()
 	 *    smp_mb(); // ensures IOPTE  | arm_smmu_install_ste_for_dev {
 	 *              // seen by SMMU   |   dma_wmb(); // ensures invs update
 	 *    // load the updated invs    |              // before updating STE
@@ -2719,8 +2707,8 @@ void arm_smmu_domain_inv_range(struct arm_smmu_domain *smmu_domain,
 	 * this matches the instances used for invalidation.
 	 */
 	if (invs->has_range_inv) {
-		if (!tlbi.range.use_full_inv)
-			arm_smmu_tlbi_calc_range(&tlbi);
+		if (!tlbi->range.use_full_inv)
+			arm_smmu_tlbi_calc_range(tlbi);
 	}
 
 	/*
@@ -2731,10 +2719,10 @@ void arm_smmu_domain_inv_range(struct arm_smmu_domain *smmu_domain,
 		unsigned long flags;
 
 		read_lock_irqsave(&invs->rwlock, flags);
-		arm_smmu_domain_tlbi_inv(&tlbi, invs);
+		arm_smmu_domain_tlbi_inv(tlbi, invs);
 		read_unlock_irqrestore(&invs->rwlock, flags);
 	} else {
-		arm_smmu_domain_tlbi_inv(&tlbi, invs);
+		arm_smmu_domain_tlbi_inv(tlbi, invs);
 	}
 
 	rcu_read_unlock();
@@ -2750,12 +2738,23 @@ static void arm_smmu_tlb_inv_page_nosync(struct iommu_iotlb_gather *gather,
 	iommu_iotlb_gather_add_page(domain, gather, iova, granule);
 }
 
+/*
+ * Called by io-pgtable-arm.c for each single table level it wants to remove.
+ * size is the size of the table level and granule is the tg in bytes. This must
+ * clear the walk cache and any leaves within the range.
+ */
 static void arm_smmu_tlb_inv_walk(unsigned long iova, size_t size,
 				  size_t granule, void *cookie)
 {
 	struct arm_smmu_domain *smmu_domain = cookie;
+	struct arm_smmu_tlbi tlbi = {
+		.tgsz_lg2 = smmu_domain->tgsz_lg2,
+		.iova = iova,
+		.size = size,
+		.iopte_size = smmu_domain->tgsz_lg2,
+	};
 
-	arm_smmu_domain_inv_range(smmu_domain, iova, size, granule, false);
+	arm_smmu_domain_tlbi(&tlbi, smmu_domain);
 }
 
 static const struct iommu_flush_ops arm_smmu_flush_ops = {
@@ -4023,13 +4022,18 @@ static void arm_smmu_iotlb_sync(struct iommu_domain *domain,
 				struct iommu_iotlb_gather *gather)
 {
 	struct arm_smmu_domain *smmu_domain = to_smmu_domain(domain);
+	struct arm_smmu_tlbi tlbi = {
+		.tgsz_lg2 = smmu_domain->tgsz_lg2,
+		.iova = gather->start,
+		.size = gather->end - gather->start + 1,
+		.iopte_size = gather->pgsize,
+		.leaf_only = true,
+	};
 
 	if (!gather->pgsize)
 		return;
 
-	arm_smmu_domain_inv_range(smmu_domain, gather->start,
-				  gather->end - gather->start + 1,
-				  gather->pgsize, true);
+	arm_smmu_domain_tlbi(&tlbi, smmu_domain);
 }
 
 static phys_addr_t
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
index e1dcfb99b5e413..053288cdf48e87 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
@@ -1171,14 +1171,19 @@ int arm_smmu_set_pasid(struct arm_smmu_master *master,
 		       struct arm_smmu_domain *smmu_domain, ioasid_t pasid,
 		       struct arm_smmu_cd *cd, struct iommu_domain *old);
 
-void arm_smmu_domain_inv_range(struct arm_smmu_domain *smmu_domain,
-			       unsigned long iova, size_t size,
-			       unsigned int granule, bool leaf);
+void arm_smmu_domain_tlbi(struct arm_smmu_tlbi *tlbi,
+			  struct arm_smmu_domain *smmu_domain);
 
 static inline void arm_smmu_domain_inv(struct arm_smmu_domain *smmu_domain)
 {
-	arm_smmu_domain_inv_range(smmu_domain, 0, 0, smmu_domain->tgsz_lg2,
-				  false);
+	/* Prefilled for invalidate all */
+	struct arm_smmu_tlbi tlbi = {
+		.tgsz_lg2 = smmu_domain->tgsz_lg2,
+		.single.use_full_inv = true,
+		.range.use_full_inv = true,
+	};
+
+	arm_smmu_domain_tlbi(&tlbi, smmu_domain);
 }
 
 void __arm_smmu_cmdq_skip_err(struct arm_smmu_device *smmu,
-- 
2.43.0


