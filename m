Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42E55CCD195
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 19:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K4g0VVzLyXGV0fvnY7szZTrctHrqCHmUf0gj0rCNkJ0=; b=1qA8H+7KwJgzfi6Y0rDzL/uh8G
	ECbFXT/uU3ukK1/BPqidrHnJfioZsGsrv33mqCgLIC+CRGK6Qx9OKh8fa2DuZxgCtQFlgvGLlGLyY
	RgPjSl+TVGvDdrVxJS084MOgbjFSOd3h3ZRruZbpuXQkDp1bw++XPwiTn2uAgtKVKIEWQuTsHz4i8
	ew8pWdSOPzplJOF2FctafSm1nw68fx62uyxSOlVQTZqmvnb/BUiUAq13JwTJAmKMkU68Y3Tzo9OWT
	Pgxx4sucx1L5yso5eBbP2LUrZbL1Y6447uhsNF9hMTgK53EKNij3IfLqLvp07tWgt56r8wg/LgG3I
	uW5YMF5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v97Pb-00000002lQJ-0UhZ;
	Wed, 15 Oct 2025 19:43:51 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v97PW-00000002lNC-3p54
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 15 Oct 2025 19:43:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=K4g0VVzLyXGV0fvnY7szZTrctHrqCHmUf0gj0rCNkJ0=; b=R9hUEjbMQsoGhDRUlAsRaWBHF+
	Nj2kSvkS1EZCVLlrziqwsEJx5gWoDDRHojE0yYYjnJ25WqhudNFSxYT5p1RdymK4aSIAIVa35JoIw
	opOEjVcNbQYLVSbK839dzx56rS7q03zNQqgoiqndqMV/Y3MzLUMuC6RCrH94iJBqoc1BUAzW1jPLu
	kWE6wabm0yKJbb6WjZ4oKCI2I3XkyevQWrxfr/u+nQB4zHW8LpM14sgY/2TeGRM38JNmOPRh4Vm/w
	0sPjMV122n6Cm9eZLixAt15jGRBzxwAkcZPnA1VMrekTr9eyUBwzcLOykIi2VZH16/3CLQV5veLH0
	APb8BcIQ==;
Received: from mail-northcentralusazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c105::5] helo=CH5PR02CU005.outbound.protection.outlook.com)
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v97PR-00000005OWC-1MCE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Oct 2025 19:43:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QQ6eLahi61mAnRCBTSGEhbcbtrMJyERc6JyyCz7tPXPlfQL0HgzA53ymM3jQtYkfHzcInNrc1fJ1HOyiAYm2FdOEO7/1qvjjwmr1dKqHCpGYeNcbeElpT1Mit6JmSuNcvDMTnETsd7q+rxSFifhe4Wkm/POZGbcvLg2I0LrI7WGOgxVD5S7lxdGZcF5J7Mx1qvo77QWzBUP/ZCGPWnFA+RP+Xt1XE4tLm4pZZGpicIOtJfyi7if7WFAPAaiA/9bpGL1AQxPkshb6b0nTBlhwfvK/6sDShT5FJIl91FIaGpaSNl+avv5ZdN+LjmAMdRHj+un6TVrSkGzp1rv3vDAboA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K4g0VVzLyXGV0fvnY7szZTrctHrqCHmUf0gj0rCNkJ0=;
 b=mvyBUmmUF/oIVR74zNd0t0FnXMeWn9IJyq3QpUTt5rUg20nnjR32ZdqBcvs7OG+Va04qbkC5iKVad923IlU+7y7n81s5FOHbEJ8+7xaPMSF4viQXtMx/fEdPM70mgpCNUnpHUT8/tR13nkIlobGx81s7EGmiKEDOTZkqrRbXfo9eWj1GG7rj4GUZhEVPd4XEMeO39fXrxPlujXyCkRWTiYJHOioIGNZdV/wOcYEiCrsmrAjNGZ2R8KO9XCuh6AK+aBKqGLwv8kdiMvjLoaqNh0MEku0D6VNHH5gCv9ig3ZAh3r+o+X0u0zrheaRXDAFBfdVROqbzb2ZH9TV3fpXeBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K4g0VVzLyXGV0fvnY7szZTrctHrqCHmUf0gj0rCNkJ0=;
 b=X7kptX8Vo147SIep5zPP9o7zgvAkzBniUtIMOVFuGWV11HTEhnpGDifq7w3gO97ougrp9ba3DD+x8VZeE4GXFVwnh4rUTUITHzrsXL23susCD2WRwfvXkPfNZuMBguSYZ2pEAZ3kQ0r/eRENLXumLdMdG21MbfmDln72NkIN+MtEiMwVU1KzrPLxaZ8zxNjAQFgd7zps3mjaHOqsPRyCLSB5p7ZbaxThX+hqTew21i5rvxxOZkd6p4E3L/2zGJ83Zh7qjOo5jwSWIlsHOSchZ0QozBtE8yGOMOt/otWZ/dQGuZwmi2KnHMFXXb667mlAd1k5pPJNgnfKQBARd0djNA==
Received: from SJ0PR13CA0022.namprd13.prod.outlook.com (2603:10b6:a03:2c0::27)
 by SJ5PPF28EF61683.namprd12.prod.outlook.com (2603:10b6:a0f:fc02::98e) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Wed, 15 Oct
 2025 19:43:21 +0000
Received: from MWH0EPF000A6730.namprd04.prod.outlook.com
 (2603:10b6:a03:2c0:cafe::ac) by SJ0PR13CA0022.outlook.office365.com
 (2603:10b6:a03:2c0::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9228.10 via Frontend Transport; Wed,
 15 Oct 2025 19:43:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 MWH0EPF000A6730.mail.protection.outlook.com (10.167.249.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.7 via Frontend Transport; Wed, 15 Oct 2025 19:43:21 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Wed, 15 Oct
 2025 12:43:04 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 15 Oct
 2025 12:43:03 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.12) by mail.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Wed, 15 Oct 2025 12:43:02 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: <will@kernel.org>, <jgg@nvidia.com>
CC: <jean-philippe@linaro.org>, <robin.murphy@arm.com>, <joro@8bytes.org>,
	<balbirs@nvidia.com>, <miko.lenczewski@arm.com>, <peterz@infradead.org>,
	<kevin.tian@intel.com>, <praan@google.com>,
	<linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v3 2/7] iommu/arm-smmu-v3: Add an inline arm_smmu_domain_free()
Date: Wed, 15 Oct 2025 12:42:47 -0700
Message-ID: <a4febbb5533127a20f61796e1afc21bc4a132203.1760555863.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1760555863.git.nicolinc@nvidia.com>
References: <cover.1760555863.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6730:EE_|SJ5PPF28EF61683:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a9bff2f-970f-4028-e4df-08de0c231915
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Jbd5bmYe0iIHZ5sjeF2TAXoqMapziwaVQ1iJZlSCfLfojug1+T89+qhwg7+Q?=
 =?us-ascii?Q?jdvlkSu3aUt4TcLWMYcjRnx5UFSMExuxKSDvOkZKkWKo+jCadW2deeCRX1o9?=
 =?us-ascii?Q?4Zyn2BK+/bXhLJcNTP/7IzPWjlw0AK9aorCKCy5mRGOUKeAT0pw4o2dLGX1t?=
 =?us-ascii?Q?HdfQk9f0xi1KYSBLyicDGhcINUQTT7sQfweR5P22qHJrMei9piBhldU+Jmr4?=
 =?us-ascii?Q?ctAoRFXvJLzr1yX2i9M2UVFBmP0SM0QYwS4p/9QyRF/L1erL7b4WP+baCpbv?=
 =?us-ascii?Q?uNwDzXvo+uLOJxuUksqEkqh9GgFVcpSC8kJg10kh1G4D4lLUNG74qLgRxT/a?=
 =?us-ascii?Q?xMUIMZ07JIAKGaAL+HZN/q+5k0mSfsLLP9YS+77WBVOw9nQcWRTwMZFozhU+?=
 =?us-ascii?Q?kLalymuhTP1BTl3xuP+ByFl6/ur1NmhADG/QAiBB9HNv7+Cn0guN/sIG8Phl?=
 =?us-ascii?Q?QV/TPs4jPu2jcWbxdZNJ9KMvTZ9SjIvCrP+yDkJKejHH2RfdanBG5EUUCwRW?=
 =?us-ascii?Q?AcDvYXtBhd0LzfCOSzb5UhsW16hnZXJpQdjTphc3dqRHdHh6Byc+jiq98VKG?=
 =?us-ascii?Q?BJsrLd97dzoU6sluAf1lk6gO5JBWpQP+Crjr4+m96nIHJkXcfGPJ/mjYXO7O?=
 =?us-ascii?Q?6UbUahsl6S1T+ovP8grwCBlYRl+bIMJeDZ0eLEHSz/pXltKmEiVS9vK/fzUL?=
 =?us-ascii?Q?WNzganACXRYkTABDVUAdEPeoeA+7RMAwt5Qm0B8TmDX+JXIrLAvjsodaOMtA?=
 =?us-ascii?Q?Otn1LREanI0mKrfVL+v3Ia/lpmN2UCgWP90b4wcd30dDCIrc04H4bfLdSHOI?=
 =?us-ascii?Q?nCilisTOuVLxQWyjj1Qp0SD1neQOR4JHyP8KWRPla6+vPixcK/aJGec5DIwH?=
 =?us-ascii?Q?nNGg+fstvpQ0CN6ZO4oaSWWfR6DOjvZccv81+KHGTRf7ftAhfoU3wIF4vC1W?=
 =?us-ascii?Q?g+do/aP7vZI8XuKspgF0M7V74wK9LBjTkixWkSxt4cwTFWAL1T2rhtIq1Ush?=
 =?us-ascii?Q?1qiYrKolTU298DkiJztNl2uAyc1FbobxYa31KJuaNZTDaCxfa8kcjTq/hwIk?=
 =?us-ascii?Q?o2LUpjsweh6Vt7xld0O9C+zrQavaBFBKwehrfqnzFrsQFyrusLtgG4HjHRQD?=
 =?us-ascii?Q?GUfas1Cl8AELBgRD/020XDPncCVlwkLLB/tCXUHpoELSIoJnAmsY5X7nc7eP?=
 =?us-ascii?Q?QxqjvUlBPJQ5+Of6vqE3fRow2GI2TTBFDHBVvYBwWBqyokAXXtdgWjsgZ68y?=
 =?us-ascii?Q?vytJehN8W2nsaVDCkAMC61ENFe8Wigh055aawBHhXdcP4MS+ppM06miH0uY4?=
 =?us-ascii?Q?UpVOjJNvbm3L9bao0EdZA8T1fnmbdo8QHZTVRrcCZIJDQMhB9O2ao7cKCMey?=
 =?us-ascii?Q?XrYCssykcV3BmqUu4xDSIpyThqkUUwHfuj8YtxBTs9Z9MV/rknLk3XyKLvc7?=
 =?us-ascii?Q?SuLr9v0jlxjcmL+UUIx7j9ZTmjoKoPkwTMCDHqL0lMv/p6ogkzLdj4q9NxPp?=
 =?us-ascii?Q?Kw1agvZRtUIa8bDIfNakB2jEsqg9oPR8F8TNyCvsfN/E7qSCM1NurWYhRd2Z?=
 =?us-ascii?Q?oc+cr+9xrGD7STWMd18=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(7416014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2025 19:43:21.5989
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a9bff2f-970f-4028-e4df-08de0c231915
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000A6730.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF28EF61683
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_204342_721465_ED8A174D 
X-CRM114-Status: GOOD (  11.05  )
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

There will be a bit more things to free than smmu_domain itself. So keep a
simple inline function in the header to share aross files.

Suggested-by: Jason Gunthorpe <jgg@nvidia.com>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h     | 5 +++++
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c | 2 +-
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c     | 4 ++--
 3 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
index 5c0b38595d209..96a23ca633cb6 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
@@ -954,6 +954,11 @@ extern struct mutex arm_smmu_asid_lock;
 
 struct arm_smmu_domain *arm_smmu_domain_alloc(void);
 
+static inline void arm_smmu_domain_free(struct arm_smmu_domain *smmu_domain)
+{
+	kfree(smmu_domain);
+}
+
 void arm_smmu_clear_cd(struct arm_smmu_master *master, ioasid_t ssid);
 struct arm_smmu_cd *arm_smmu_get_cd_ptr(struct arm_smmu_master *master,
 					u32 ssid);
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c
index 6097f1f540d87..fc601b494e0af 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c
@@ -365,6 +365,6 @@ struct iommu_domain *arm_smmu_sva_domain_alloc(struct device *dev,
 err_asid:
 	xa_erase(&arm_smmu_asid_xa, smmu_domain->cd.asid);
 err_free:
-	kfree(smmu_domain);
+	arm_smmu_domain_free(smmu_domain);
 	return ERR_PTR(ret);
 }
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 0312bb79f1247..00d43080efaa8 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -2492,7 +2492,7 @@ static void arm_smmu_domain_free_paging(struct iommu_domain *domain)
 			ida_free(&smmu->vmid_map, cfg->vmid);
 	}
 
-	kfree(smmu_domain);
+	arm_smmu_domain_free(smmu_domain);
 }
 
 static int arm_smmu_domain_finalise_s1(struct arm_smmu_device *smmu,
@@ -3353,7 +3353,7 @@ arm_smmu_domain_alloc_paging_flags(struct device *dev, u32 flags,
 	return &smmu_domain->domain;
 
 err_free:
-	kfree(smmu_domain);
+	arm_smmu_domain_free(smmu_domain);
 	return ERR_PTR(ret);
 }
 
-- 
2.43.0


