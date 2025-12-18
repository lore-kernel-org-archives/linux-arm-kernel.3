Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69F3DD711BA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Dec 2025 20:28:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DroMvMesd+mZDYn8+Fi/Vv9qWLe43u4WdLYYl77HAyw=; b=2pavDbuYgrPKLAVjvbo3bjDUTd
	kNdXjfg293T2Al8hqTJOomFoHELHnlJiHpgtNeb06aoyyiVNhygGaMsdBu0fUyfj7lL1VZc7G2l68
	/8Xitzvqaw43Zhir1CXVmpTgGWT7/SpVjQTgzIUs2KqPuvJp2FN/MSsvbWEfQoqocks/hB/B5i1nr
	doIg8siEQZFx1P88uZB5cC+qjxZNaHbkf6nj+b7EeVQbop2JWeWZkOGQMtk+bQPYNd8YiIDC5qYXC
	zGGtTvAgGjL0TDkDT+7768Ob57UBHXqGAZC0E/5uO6cXxk3xu00Rg/sVr6m0JvTYGb+ke//e3N/cT
	X/3TP+Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWKbN-000000099TT-0q1B;
	Thu, 18 Dec 2025 20:27:57 +0000
Received: from mail-eastusazon11011002.outbound.protection.outlook.com ([52.101.52.2] helo=BL2PR02CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWKbH-000000099PQ-31Hw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Dec 2025 20:27:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZC88Yir7ChOkE/7w7K4YZApiCCDTlsp6ETjWmMV7p2HrwNhUhAXY+p4SuMhWogP9NxQgrQR4KI3DHyjByJtlQV4Aks0mXZZAYzcfHm0cimWdivb6odA/0bqIhcBtusd2/npZ6GvmK52zDUGGXJKoy0NiGVT/rIkZTbLgMXntsMuz9Zxc4lXdG7q4hJEhgFbg3WQFA7mGDCCNyNNX5KaRGQz5lV4NJJn+Pa9bjHxwJqTOJDe/sBWXcfek8R/CGAgVLFlXABlgFwNw0rBkN/lVkVfBsLASXJc/cCegb2+hZpFQ2i3FKaor0gn0WX+LfeNq4+d9gu9ocDyesAhKxc/t0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DroMvMesd+mZDYn8+Fi/Vv9qWLe43u4WdLYYl77HAyw=;
 b=EtfE9afokmrelzr2rWBbGrN3PllLa5TTKnsYlq97D86yPZN9vrpijzJB0oO6zMHyZPvF/xjeE5N77wrPCs4X8BjzqCt28ls5BGJP4/76gHlO7peBLHHZV7qsoytHk2kfUWql297Bf+I36KpkRjF+WK9XUFMSdjstzTflNRu5KzdzSw3qcLJ0x4SRYtp9bQ/n6qK8crqq56uOjTjlPtmkf/Ee8fj6TrfnjfH/8ABxUA/8dRau0UxMvQQrhRQehyzFF4lJX+sn4VPdIMwtFmL5ipd5aizwhEJUyTF2luYEJgOgo/A+gfmZKt9U/m9BAtrIzfTXrZn0J+rN8p02aw06HQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DroMvMesd+mZDYn8+Fi/Vv9qWLe43u4WdLYYl77HAyw=;
 b=lv3wdOCo4Nz1LnuXztVdaBBI4fQanpRIhoIqfuF6i2IzJiVMh6sxZEcSk+bo+jbGg7vyKAEGeKKEYdUnUyzbPPb231x5WrdG8SSA3QqP4aCOcUyiPzrmssi7XYXeMB1CHua89GXZMZXuhUdHZqbQHSjKgSVVhUeJZtHIeq1N09LETgrcN71gjXxIPv605kFyl0B+tbE9pzsv9dwE2iTpWwiadRNziFcDWvoReUHStRvRjqIfA5tAXbtxKi4I62dAuYYpXWJvf2fMEHVBR7X/km+kL7nw+3IaQxJfrKo8+4Ja/Heksfv8FmbcuMnzjq0LLlZtPftQw6DjZyEGWfIZCQ==
Received: from DM6PR08CA0008.namprd08.prod.outlook.com (2603:10b6:5:80::21) by
 SN7PR12MB7324.namprd12.prod.outlook.com (2603:10b6:806:29b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Thu, 18 Dec
 2025 20:27:43 +0000
Received: from CY4PEPF0000EDD7.namprd03.prod.outlook.com
 (2603:10b6:5:80:cafe::37) by DM6PR08CA0008.outlook.office365.com
 (2603:10b6:5:80::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.7 via Frontend Transport; Thu,
 18 Dec 2025 20:27:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CY4PEPF0000EDD7.mail.protection.outlook.com (10.167.241.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Thu, 18 Dec 2025 20:27:42 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 18 Dec
 2025 12:27:21 -0800
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 18 Dec
 2025 12:27:20 -0800
Received: from Asurada-Nvidia.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Thu, 18 Dec 2025 12:27:19 -0800
From: Nicolin Chen <nicolinc@nvidia.com>
To: <will@kernel.org>, <robin.murphy@arm.com>, <jgg@nvidia.com>
CC: <joro@8bytes.org>, <jpb@kernel.org>, <praan@google.com>,
	<miko.lenczewski@arm.com>, <linux-arm-kernel@lists.infradead.org>,
	<iommu@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	<patches@lists.linux.dev>
Subject: [PATCH v1 6/9] iommu/arm-smmu-v3: Use dummy ASID/VMID in arm_smmu_master_build_invs()
Date: Thu, 18 Dec 2025 12:26:52 -0800
Message-ID: <2cfda3d1f80ca3548a77d5da9261112e3f00a404.1766088962.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1766088962.git.nicolinc@nvidia.com>
References: <cover.1766088962.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD7:EE_|SN7PR12MB7324:EE_
X-MS-Office365-Filtering-Correlation-Id: 09942766-8783-4cc2-cec7-08de3e73e5d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|1800799024|82310400026|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?YY8RuMEuIX9L7DIHC6e5QyIk+E+1bItbIDqNvWdrWa+JdcbNH2hYdUiPyJ/k?=
 =?us-ascii?Q?O2tdaxkPOVGTDMexfbuFGZzR/zdnezE0f21YrjPpEMoJW59zl8w3c+U0wEoU?=
 =?us-ascii?Q?9u8UhgK3mh3eOZA/LiVNlzkbUu4j418LN5RwqXWnLVvoMuXBkXEYUDRrDP1p?=
 =?us-ascii?Q?OMS2iXIhqyrwrLtcT7xBGgihwVWl6a+xH9hdYeJSCIMWiqfQyjG71oRHZAuy?=
 =?us-ascii?Q?NUbM6skjAO+En+oMI1DjKQeob68N0vI76rrfG4Y/BKdKTCxwg3hxZefL71Hx?=
 =?us-ascii?Q?ze8Hp4UHI5Mfqpaagi0FRTIzppQfFH7Bl06G4Mg7Ar4ZiBOBa0rRbWR2NZxO?=
 =?us-ascii?Q?xbv+PNINZP7aRrD/OR6OTM2sTdAUBdkuWwDGMe705VrH1b/N7nboUGpQ6UEc?=
 =?us-ascii?Q?AOgpkFX8m5LRjQtYLxSOtPxzXoxuYKr9tQp8R0JBds4RsRvSFczyMjYImwyb?=
 =?us-ascii?Q?cH467sKZ/HGvw26DbVtTt4anb2dBJHRZySMmymLljuFbiyTbWQKL06kDGQE6?=
 =?us-ascii?Q?2bNTUfrnDmWtNOWl5vHl9uRFja7FiXMD6nqRTbuwJ21wmxgqBkmYFthPrUna?=
 =?us-ascii?Q?aehwvxdo1c8xfunC3JdmM3jATrKCvL6TMcFlXPhQyLKNZAHtjw+gIlj963oh?=
 =?us-ascii?Q?NA8UP6VJX6m6KBNCVyJZ1lT2JO9Ip1fPdWmIhjjbbgrmUq5wHggM81BGuwxM?=
 =?us-ascii?Q?M7KDhaqssZh08ymLBAVj5lYtm1TSoel+OTX5kBzGMIYlZNyJDeu3p+pymSXb?=
 =?us-ascii?Q?X+xlujKqfzZvfFsSpvmaZ4XWqoDHMZLnsSpuUHrOkD10VBOJVeJmzcjgv2ai?=
 =?us-ascii?Q?AlhUHrUIJykN+OKNCM4luaUP5V/5HTgtIKbskRHpWMrYKPknYSRrcK3p52w1?=
 =?us-ascii?Q?XVLZojMi4tzLImnd89tQzb+rWVNHSfTTrU/NpdSCPYcVgZfTzFCzwIqKE82l?=
 =?us-ascii?Q?u7Xdx8X2FbhN+LMRztCr9R0mueg/E4hNYhwt6jpeiSfbehn06H+E6hA93O7z?=
 =?us-ascii?Q?Q8N/d4WXg50+RjVoxvyOvkrpL1/sOM3WtlSMxZsFFgrtUuqx+f/rLjUvJJFt?=
 =?us-ascii?Q?X+ZwFbrw4G4KbAeWja1u7LLzqSo+88RP/nICLaFAnGUyKC28Ofzwpg68FBCb?=
 =?us-ascii?Q?ydLf7faWrJawHjCPGbqEoELtso97JHTLqcHW/07CXucC2Pv5ym8fA+nIfoqW?=
 =?us-ascii?Q?X+uVMJLhA9iiQZXHqoEFMhane862HivhEL5qufzguHJ34zQxDlqNq0QUSqkI?=
 =?us-ascii?Q?3ZUXv/nmunqW2E5WlTGF5m7dIBw2zk5K2tN6YDEb+nFBp1HXOFTulvMJ59oj?=
 =?us-ascii?Q?x7a18RY/FX5XWT8/AlUFuL5iS8OXyYAbixmRoJR0KedzcStN/+smM5wIXl0d?=
 =?us-ascii?Q?6vKZ5k73XplL+J064l8OJqaYhqDJTZJCLm3EynYqd2MH+Xu5HzJK5evSJnHw?=
 =?us-ascii?Q?3zGeV2sXheJK3xj4BChPFMmVW/HG7woeIwjWcooVCWRyhaZ/Ry+NbvbNqBXb?=
 =?us-ascii?Q?Cu62GWep9q18Np4j5EtuzPnM48CFpi5i0SNp5kWvuNQn7kT4pV/Bt/dKJt3j?=
 =?us-ascii?Q?PduZe+hrWO2J0GpwUgo=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(7416014)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 20:27:42.9673
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 09942766-8783-4cc2-cec7-08de3e73e5d2
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EDD7.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7324
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_122751_771681_4C7260B7 
X-CRM114-Status: GOOD (  17.38  )
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

The arm_smmu_inv_cmp() function no longer enforces ASID/VMID values on an
iotlb tag entry, to allow sharing an existing tag in the domain->invs. If
no tag is found on the same SMMU, a new tag will be allocated.

Therefore, there is no point in passing in any id to the iotlb entries in
the master->build_invs array. Use a dummy ID=0 that is out of range of an
ID allocation, so as to set free cd->asid and s2_cfg->vmid. An ATS entry
must still have a specific ID.

Since CD/STE has the ASID/VMID coming from the master structure, lift the
cur->id check in arm_smmu_invs_merge(), to use the new ID allocation path.

Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 29 ++++++++-------------
 1 file changed, 11 insertions(+), 18 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index d6ae630d0de3..d51bad1002ff 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -1148,17 +1148,6 @@ struct arm_smmu_invs *arm_smmu_invs_merge(struct arm_smmu_invs *invs,
 		if (cmp < 0 && i < invs->num_invs)
 			continue;
 
-		/*
-		 * Currently the @to_merge array always carries an id (> 0) that
-		 * is also installed in the CD/STE. So, we cannot allocate a new
-		 * ID at this moment, because that would misalign with what's in
-		 * the CD/STE. To not break the existing flow, bypass the new ID
-		 * allocating code. We will lift this bypass line once rework is
-		 * done.
-		 */
-		if (cur->id)
-			continue;
-
 		/* No found. Allocate a new one */
 		if (j == 0) {
 			/* KUNIT test doesn't pass in an alloc_id function */
@@ -3331,11 +3320,16 @@ arm_smmu_master_build_invs(struct arm_smmu_master *master, bool ats_enabled,
 	if (master->smmu->features & ARM_SMMU_FEAT_RANGE_INV)
 		pgsize = __ffs(smmu_domain->domain.pgsize_bitmap);
 
+	/*
+	 * Each SMMU has only one iotlb tag in the array, so leave the iotlb tag
+	 * ID to be 0. The merge() and unref() will find the existing one in the
+	 * array to refcount_inc/dec. In case of missing a match, merge() should
+	 * allocate a new ID while unref() should WARN_ON.
+	 */
 	switch (smmu_domain->stage) {
 	case ARM_SMMU_DOMAIN_SVA:
 	case ARM_SMMU_DOMAIN_S1:
-		if (!arm_smmu_master_build_inv(master, INV_TYPE_S1_ASID,
-					       smmu_domain->cd.asid,
+		if (!arm_smmu_master_build_inv(master, INV_TYPE_S1_ASID, 0,
 					       IOMMU_NO_PASID, pgsize))
 			return NULL;
 		master->build_invs->alloc_id = arm_smmu_inv_alloc_asid;
@@ -3343,8 +3337,7 @@ arm_smmu_master_build_invs(struct arm_smmu_master *master, bool ats_enabled,
 		master->build_invs->smmu_domain = smmu_domain;
 		break;
 	case ARM_SMMU_DOMAIN_S2:
-		if (!arm_smmu_master_build_inv(master, INV_TYPE_S2_VMID,
-					       smmu_domain->s2_cfg.vmid,
+		if (!arm_smmu_master_build_inv(master, INV_TYPE_S2_VMID, 0,
 					       IOMMU_NO_PASID, pgsize))
 			return NULL;
 		master->build_invs->alloc_id = arm_smmu_inv_alloc_vmid;
@@ -3357,9 +3350,9 @@ arm_smmu_master_build_invs(struct arm_smmu_master *master, bool ats_enabled,
 
 	/* All the nested S1 ASIDs have to be flushed when S2 parent changes */
 	if (nesting) {
-		if (!arm_smmu_master_build_inv(
-			    master, INV_TYPE_S2_VMID_S1_CLEAR,
-			    smmu_domain->s2_cfg.vmid, IOMMU_NO_PASID, 0))
+		if (!arm_smmu_master_build_inv(master,
+					       INV_TYPE_S2_VMID_S1_CLEAR, 0,
+					       IOMMU_NO_PASID, 0))
 			return NULL;
 	}
 
-- 
2.43.0


