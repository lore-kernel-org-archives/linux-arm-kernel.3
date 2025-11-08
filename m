Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2746FCCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Nov 2025 08:08:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wyp2uxdJSaWI/GLKYnSpX8UVcm+Vvxd+5Dyzn0Jm0eA=; b=oQ61bDC9kV5llQkM9xvajSRfUM
	oh5jDbsX8AfYy79pbj9sXBCDWIvnRtJNmqzjEWKaJhq0etamB6oMloZLMzpg/dNLJ+4jZ1LPUUG55
	6F2SLf1IEB1Z2mRhgSxuoUjaDgKmiu/pRunTXIcTgtFmCoKwFLjgqAU0JcKBuRqH+ZtW1tCHlEAv8
	sWchEk26BBgwoE7sOHIUgnZNl/K+cUrj/CUDTfNFIE+ZSv+nuVplV5b9tOt38W1/JWOF3bl27Mtov
	0eIWZiIgOUYJ/C1qNBSQPMzTiIlDFLxu5AMLmLYMzGtqKV75FZfhhO3U+OLac6UDQ2ioIM1MjnCOo
	606yrPnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHe06-00000002jjs-026V;
	Sat, 08 Nov 2025 08:08:46 +0000
Received: from mail-westus3azon11012045.outbound.protection.outlook.com ([40.107.209.45] helo=PH8PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHe00-00000002jf5-3X2C
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Nov 2025 08:08:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MwtdNC4BBGTSfLHEzdd3xAkX0s+bnVRUQq5ms2xYcLKz4ICJh3OFmmBDkWqV0plPRQGPRgDQNnlsm2E2E9xcYUM2EGPrZPve9nXYGLmRDN+vBeRVg8CDXfN90FsODAbZlGD8/sHJ3bGcTQYg60ZD6uzLwX8RmwlES7SxtrKFS0Hc7SN8C2Kufy28HTJnee0UbCiueyrGDVOi9AdCMM/ogWuhZS3Tk8thCTf6gkeyjbMIuZUCVMxXrax3gNsxxMPTTtc/bt6x07mFo0vDvpJPcR/yJ4H0R0c69tq34AVksz24DKJy7FL7FPdxXCxBj+mmqg/+pHRIfrmEjAhmQt8HRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wyp2uxdJSaWI/GLKYnSpX8UVcm+Vvxd+5Dyzn0Jm0eA=;
 b=Fgvt21apYNdFdwYVKBpzAUYQG3qURi2Cb1iCM7DEMjFZL/QZ3orYOmJeSckefBggjSRnbowl5inhuqYEBvgonKkHhQHdFf6+iQPoUjsUEx65Azb8WBgIFRCV12q66OrJdF6wmo7DXTst9nKbeLAefhN+C0CAurwxPJ/BWHQp8mBPw3NbEhFnydlYmcXxJASH3A3NpVjFTHcHbQCZ6FqxiyP0ShxTpi3bDWp136soAEb1HFkID6tDh1+/IOTqVvprB9KPcImNAUl66w8FP/LhiVGAiY0fG6f87Hc6cEMUlvIilactPV2nrcCQH62eSi9wiF+JRxDFgpqtbk7dzxlsyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wyp2uxdJSaWI/GLKYnSpX8UVcm+Vvxd+5Dyzn0Jm0eA=;
 b=RSpuv50JIP659yMzxuGvkHOh9YeiO0CHWLRJc/UUND2ZGLqrCUvBaDla+xFq2s2ir/a/fZqyIFcBc8qUerRqdburav3Mh0yfeLNsteVGqpAm+B0guzE8Dc0CmpbzUCtymwqUKA12AWxdhdFHa6kT/A3C0yWcQMq60qwk3MKWt5RxJi4WPO/VOpjveFBTVgmAyfEeaEN1lsQcnexTbjRpAjPy1Xvna7V7iuefzcqixTUjgG0FyAeKRI5d4eJamErMy6T94dEI3GWJpryLLRdNJwNtcb8hz3RiYGNLgOqYxgFXAPm6dYtSeMox7wCZINBH1PgWQSEiZkQJLGQ66UG73Q==
Received: from MN2PR14CA0016.namprd14.prod.outlook.com (2603:10b6:208:23e::21)
 by IA1PR12MB7589.namprd12.prod.outlook.com (2603:10b6:208:42b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.13; Sat, 8 Nov
 2025 08:08:33 +0000
Received: from MN1PEPF0000F0DE.namprd04.prod.outlook.com
 (2603:10b6:208:23e:cafe::7) by MN2PR14CA0016.outlook.office365.com
 (2603:10b6:208:23e::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.15 via Frontend Transport; Sat,
 8 Nov 2025 08:08:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 MN1PEPF0000F0DE.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Sat, 8 Nov 2025 08:08:32 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sat, 8 Nov
 2025 00:08:18 -0800
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sat, 8 Nov
 2025 00:08:18 -0800
Received: from Asurada-Nvidia.nvidia.com (10.127.8.11) by mail.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Sat, 8 Nov 2025 00:08:17 -0800
From: Nicolin Chen <nicolinc@nvidia.com>
To: <will@kernel.org>
CC: <jean-philippe@linaro.org>, <robin.murphy@arm.com>, <joro@8bytes.org>,
	<jgg@nvidia.com>, <balbirs@nvidia.com>, <miko.lenczewski@arm.com>,
	<peterz@infradead.org>, <kevin.tian@intel.com>, <praan@google.com>,
	<linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v5 1/7] iommu/arm-smmu-v3: Explicitly set smmu_domain->stage for SVA
Date: Sat, 8 Nov 2025 00:08:02 -0800
Message-ID: <65c692221d1b1cf0e8df7329ba9183b92932c40c.1762588839.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1762588839.git.nicolinc@nvidia.com>
References: <cover.1762588839.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0DE:EE_|IA1PR12MB7589:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b725529-cd4b-4383-7828-08de1e9e0297
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|36860700013|7416014|376014|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?NhUYSMY3HbZ/TKrMOFZMWy3Jdzktw7fWVgZy1rxYgc1Tzg/VjSh0lpW0SL1u?=
 =?us-ascii?Q?+uAYIc7pC8A2RPgMd537sl+NdR/kboRaCBTm6C2Bn8IpYBPctCliMbMAIexh?=
 =?us-ascii?Q?Ht9cpjfd8kV9Ea17WbnnExeA4kugbJN9JYSqzjcXfP5yNj0S4ylwq6ricqX1?=
 =?us-ascii?Q?ZwQBXlhZ4PtIi7pLSC03p+rUBStaDiecDyGsF1VK/dtIBV1pJDc3gH3L0EJr?=
 =?us-ascii?Q?QGc8oN4yY9Z1e0OBHEjwvi0bAcSoCpRZOJUSnCS7ZfIzyti3dKsxR2vWmWNE?=
 =?us-ascii?Q?mP5ASshYSeYif4ZcsNShkIWALqQIr86jcpGPpj1qehoq7aeeznoZsNxrLjF+?=
 =?us-ascii?Q?CRro/VfIRS6adv3qSKp2CrogY+PjX4Ipv0VFlfbGAfnt2BJ9dlRqBTppqFhl?=
 =?us-ascii?Q?YbKVJtT2fa0dcomdO+srld7GfnkjpzB1qPtqcF+5N1wwdltUwMJB9NlmJDd/?=
 =?us-ascii?Q?FRByGVPzWXJV/ZzcdFhge/jncNFftCKsaDvFBA+PPGp0LD5uumIhIt2GpbB0?=
 =?us-ascii?Q?2HzR8bAZ37XRy1gSj4b7SIvdtw37ccLMY3bDUhMGOsG+iuKiAIEBMuCVaTP/?=
 =?us-ascii?Q?YNkI5Jqx3M3Qa94lt0fm56mQy9Xf/UG/EP+KVZAzPpBauEB+bQ82tLEn/ggd?=
 =?us-ascii?Q?kjqh+ravv1Ig8zA6d5EQlrKx3k9ox9v9WlBJ0dIOiXX8h2oxc4VB4bHyVJ1a?=
 =?us-ascii?Q?hKMiCMfT0R8RClkwzeqYTAr82DkNpw1gCOQAR5OEpbRtJcawJQBIYouGFGLA?=
 =?us-ascii?Q?fhbaFy3Nh0zf6btnKrQEDBLiOg2UxWtttL4Z8s4ZZ0AgmZqN8yOUbAZoHzEK?=
 =?us-ascii?Q?bhxmpwb6scvu5h98FOcKYaeU1rEClkPOJAIipzkZlGvxToS8hSu3nJl7+NAp?=
 =?us-ascii?Q?vAAuXCqFidhWI/vrJD0oZ/ijpIFEjxE9BQKTU1euudf58gSMD0x1nChAn0hW?=
 =?us-ascii?Q?cZQLNn1gix9Jh3s2M2IDsB4B1sMg1mnP1ogiYzYZaK4Omk+nBk9Q4/gwG0gY?=
 =?us-ascii?Q?GgVrkjsDREHnKsi1NkB0BbdyR5Dgpx/2AOnhQ/kVBm+dYxl2Y77/OFbWdxRn?=
 =?us-ascii?Q?xykge3edmNx6eT/GR9WUmkg1wCx2w6aXYzXTzzHCyLkcgsAxDl1rei8m9d+y?=
 =?us-ascii?Q?MtNL+arJX1uz+QQQBVgF65fImAgOJLYiK6Jg7FTJsEJifTNqnPtHpA/gqR9X?=
 =?us-ascii?Q?gZIdOdnvSew0EnKk8nfh5za2/bstJmO6YU4W6+yOJBU9jFLP7tmuMw2oSaFq?=
 =?us-ascii?Q?mQ52N1TymAmWHsutdKYstuwdZ2cvsrr7LZyP/YjDLbX9Z+MbitPAAwljx0Hp?=
 =?us-ascii?Q?8fp35ALuSjaQiUO+qfuRCUywUwz6njXQDTBK0NAW25dgG/OvjbsXfg/nuK/t?=
 =?us-ascii?Q?rAIv12BHw4mEg09jObDJleNgqoNj2kxbvn5C3cHhKdFLdDPAW93aE1sSHJMh?=
 =?us-ascii?Q?EXwczLBFLAhdHoYDhHthpT1jVgVbJ3RjHSywAGdqW6Z/ozfeODwMRaekE6r+?=
 =?us-ascii?Q?Fe7iZ6fQwIA0Y1+FqLuOsfPjfs+jdEfMl5k4XtweNxoV4z4guLCIkuxg2lEx?=
 =?us-ascii?Q?BGgCigKjt2UZIijDkbg=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(7416014)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2025 08:08:32.8418
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b725529-cd4b-4383-7828-08de1e9e0297
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000F0DE.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7589
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251108_000840_888676_D67FC1FF 
X-CRM114-Status: GOOD (  10.27  )
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

Both the ARM_SMMU_DOMAIN_S1 case and the SVA case use ASID, requiring ASID
based invalidation commands to flush the TLB.

Define an ARM_SMMU_DOMAIN_SVA to make the SVA case clear to share the same
path with the ARM_SMMU_DOMAIN_S1 case, which will be a part of the routine
to build a new per-domain invalidation array.

There is no function change.

Suggested-by: Jason Gunthorpe <jgg@nvidia.com>
Acked-by: Balbir Singh <balbirs@nvidia.com>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h     | 1 +
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c | 1 +
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c     | 3 +++
 3 files changed, 5 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
index ae23aacc38402..5c0b38595d209 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
@@ -858,6 +858,7 @@ struct arm_smmu_master {
 enum arm_smmu_domain_stage {
 	ARM_SMMU_DOMAIN_S1 = 0,
 	ARM_SMMU_DOMAIN_S2,
+	ARM_SMMU_DOMAIN_SVA,
 };
 
 struct arm_smmu_domain {
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c
index 59a480974d80f..6097f1f540d87 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c
@@ -346,6 +346,7 @@ struct iommu_domain *arm_smmu_sva_domain_alloc(struct device *dev,
 	 * ARM_SMMU_FEAT_RANGE_INV is present
 	 */
 	smmu_domain->domain.pgsize_bitmap = PAGE_SIZE;
+	smmu_domain->stage = ARM_SMMU_DOMAIN_SVA;
 	smmu_domain->smmu = smmu;
 
 	ret = xa_alloc(&arm_smmu_asid_xa, &asid, smmu_domain,
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 2a8b46b948f05..0312bb79f1247 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -3064,6 +3064,9 @@ static int arm_smmu_attach_dev(struct iommu_domain *domain, struct device *dev)
 		arm_smmu_install_ste_for_dev(master, &target);
 		arm_smmu_clear_cd(master, IOMMU_NO_PASID);
 		break;
+	default:
+		WARN_ON(true);
+		break;
 	}
 
 	arm_smmu_attach_commit(&state);
-- 
2.43.0


