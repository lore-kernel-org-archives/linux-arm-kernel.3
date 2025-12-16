Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D7CBD5B87E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Dec 2025 02:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PGaBx+a+bo+0k46REkl6gOsGSESYdAY/iH34Eh+cNtY=; b=XT0kvk1j8cRPjb27cbSoaq6Byj
	4/pyTUGBRzKEXnsF6IHqPeWib4dXT1qeLhBv4gMQ+jQiwy87Ydm+hT9nQyg7rTpSV6oqr1lx6pVLd
	350G9jRrNBDbz/oW+7uKfYB/PxjiVgOdzRKCC5d2vomVbdtJPUC8/hENGBY9Zh2Pw8aoLVzqrYCqP
	ryC8l821Al3K6u0XWaIyQF/Xlfic5nM41lvrZ99fO5dZfykHubovJ8sMgfAZ7T7cUtpqruMn1kHbY
	SZYND7Y+KKMKUhrEh9mNWM9/ZzNMG2zGg9WFb237krQyzhhIwkFSALjZXb+UAQn/RkUjsU0J/17r0
	O5gwZ7iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVKWC-00000004YXD-2B5q;
	Tue, 16 Dec 2025 02:10:28 +0000
Received: from mail-westus2azlp170120002.outbound.protection.outlook.com ([2a01:111:f403:c007::2] helo=MW6PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVKW8-00000004YUK-17A9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Dec 2025 02:10:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j+WAP3WvetFfRyviYinlsvz5yE9dhoqo2+4WORYM4+/498mWvQMXdSzPBG62bT298bqn+RnxnrayHRY6Ue4+1xHmYIymXqt0Dw8V2U/YQa644czbGZLScysKsUwOO5/ag+oJfHFw/auzpaJcghEMsHZFwBQ426WnVObFm9Wvqze2g9xkgXSLXMAP2mqUZiVAtpOsf9RUFF/OfHSAH24qMZhcBVMMBDgcf9xeFKVW4Oo6XCcbMMkqYrr7isV/AqyzRsiidZ58lllU07uslbt8lycfUhXuR3socCxFEViV1s9ibaErHPuT1SDjmGrBki3dqxHIewIMqeXnmW/L5HNJNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PGaBx+a+bo+0k46REkl6gOsGSESYdAY/iH34Eh+cNtY=;
 b=HzvWRTzMujAiOuuUu8y1e2UJ+cC0YP3zJtFIOnk7/ctL0Ag4YX54wjpG+ExUg74jKXQqzEB+rRSTAb0YwgcbaMt1ss3Ds2ZkrEnuz+7VlCHCrxXP22vaSa5mkCnww1VFRppzsQQRL2X51TXmfTDm6oJ3a/aLtcQ9cQEK5mshHpMj0tm8qn8mGi3nb+TmZUKWI6k+YQL0670Fhd0h+ezvtX3UrSG5exzoRFs58LWK0K3wCPE60A0fYoOGJKbt+jw2H0heeXJuTn0Z2L8Ai8Ft1UtCISkfZ7I1QvoaIE0Q67iZMHUSaazQuli9acBNOz0w+7eEKhW72+FAV9W4VRTN+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PGaBx+a+bo+0k46REkl6gOsGSESYdAY/iH34Eh+cNtY=;
 b=f3eXzDGKFnbZeaepEbavkk6/RJysumJBC7QpTk8xADSMcHni+GHI56OXX4Nhp0C6ITPr87NCv0c+0/XEG1zKgsTRbvj2rDFeGd6S2xaGqE8hFXr0sT/xZ/UzjexBJzAoWS7Q0glKgEzYPgJ5PJByfdvcGBfEGjfs8c8nYCVlmyqHaRP+ucmVxTYoOW0RH7tCxIfHUhHWqS6Zu6K/PLe2FkVSzqUhobCVinIRm64dgBGNP6x3MmIi4yWJfpbkKNbnR1WqK8K7vMENIQgHrFyyJNqm7fm7VncgtiNPePZDlGmTX7lS/B/mW1Y2VGDKIh0nFp6udRvfYTxl/T/+ZE+A+A==
Received: from PH8PR20CA0003.namprd20.prod.outlook.com (2603:10b6:510:23c::16)
 by CYYPR12MB8853.namprd12.prod.outlook.com (2603:10b6:930:cb::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Tue, 16 Dec
 2025 02:10:17 +0000
Received: from CY4PEPF0000E9D6.namprd05.prod.outlook.com
 (2603:10b6:510:23c:cafe::5c) by PH8PR20CA0003.outlook.office365.com
 (2603:10b6:510:23c::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.13 via Frontend Transport; Tue,
 16 Dec 2025 02:10:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CY4PEPF0000E9D6.mail.protection.outlook.com (10.167.241.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Tue, 16 Dec 2025 02:10:17 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 15 Dec
 2025 18:10:05 -0800
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 15 Dec
 2025 18:10:05 -0800
Received: from Asurada-Nvidia.nvidia.com (10.127.8.12) by mail.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Mon, 15 Dec 2025 18:10:04 -0800
From: Nicolin Chen <nicolinc@nvidia.com>
To: <will@kernel.org>
CC: <jean-philippe@linaro.org>, <robin.murphy@arm.com>, <joro@8bytes.org>,
	<jgg@nvidia.com>, <balbirs@nvidia.com>, <miko.lenczewski@arm.com>,
	<peterz@infradead.org>, <kevin.tian@intel.com>, <praan@google.com>,
	<linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v7 4/7] iommu/arm-smmu-v3: Pre-allocate a per-master invalidation array
Date: Mon, 15 Dec 2025 18:09:33 -0800
Message-ID: <a45b303a2ac706abdd3d733a9ac58e57c68ec0c8.1765850465.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1765850465.git.nicolinc@nvidia.com>
References: <cover.1765850465.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D6:EE_|CYYPR12MB8853:EE_
X-MS-Office365-Filtering-Correlation-Id: 322a853b-0d5d-48ca-8dfb-08de3c4841c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|376014|7416014|36860700013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?/UXXqmexxJwUTbCgc9QOJf7ExZ4YBKnENcDxCUgpnchX61/pjzX3lbAsv9LQ?=
 =?us-ascii?Q?DcaMNqend1poxBEWpU13GCCiEo/O6HxcO3Rx8g3jGwebE3toRsONS3LSyS2x?=
 =?us-ascii?Q?6KCasHqXAb5gtK2cO+RTdnK5vdCjrwjdcB0EcnHStkb7k3PaLUpBTTMmaKM/?=
 =?us-ascii?Q?LXbq+Kit/Or+ohpkG5OOtGLERcj1GxLllXM50pw2tcE9BDPOv9gfhlgOVsv2?=
 =?us-ascii?Q?d25rZdIAHg7tStvAcpvq6QYYiCkfJ3ZdUDaTc5dLytRCU5Q9DNgaL8wjp09l?=
 =?us-ascii?Q?EiLfDO+5BQHjuyocD4DvQWFZw/nFMiawMNHvAjTHoVKGZE1rltxzaAboQlps?=
 =?us-ascii?Q?vrcyNPvlPcRV1RhETSPUOrGPhsyFgyEp+sdwcUTgxLEFGvSpksFR4F8V6Psv?=
 =?us-ascii?Q?wm03ik9zOWKB9iGzVZqF18B+4RGksVdof8YAdGZfWD9FEkdQBMO5sEBKpK6G?=
 =?us-ascii?Q?isjQVo7YsDVuvK3/e05fTkNQJSbCdRvIuCAkva1FJrKsTKtkSR08ah7dX/na?=
 =?us-ascii?Q?rg75iUoyE65oIqnHh0y4LHqutSI1h7h9RMyW6eUWZzN8FqdUKtbLmAumdxFb?=
 =?us-ascii?Q?nKLT5g2t5k8A+olYzQ0rjkT2/9aWtheVJ7ZqPakcMRRXBL8SDDaz1dEbWI6B?=
 =?us-ascii?Q?TPO84TdDqzAjZcMpOsGemsiGO3pmXCz+aozdiSa8oNpnx721hirhDFGWUh3n?=
 =?us-ascii?Q?U19w8YhUAPU8bQnpMoGhoEwVZOMELiMFl0aNC74gBkS5RSuZ4xvMUI7zmsNm?=
 =?us-ascii?Q?ZYErJOW3BNia9T0VxXsNU7PZASRHYE6ARQFjyqvhFhCOESfFoAP+VbX4Iach?=
 =?us-ascii?Q?74wt0xO0RtNzcRTXg9C9vZTHmWuCimWcY+M9YR5p70iGrDIEtvErQSVAVIzJ?=
 =?us-ascii?Q?05SMCoaksVMQ0RxrWR0FU/WoQ7bIy9hgqC1bvJlV6QcIauWKVW3Su4m3b/nx?=
 =?us-ascii?Q?S+HThPwCP7V6YayHiJAMroPRnLAZNbyjsuzA4PsJz+RAUlTOfoYxidMZEbvD?=
 =?us-ascii?Q?2hOUSPs5No9deoSIoqpKf22cHo01qttaPgoEdXKfmTiAC5BI5/aKj/XbnvgR?=
 =?us-ascii?Q?cUxCoXFHWI9JtbYMqtdMoTp3LBDzDuEuAzquKdw83XSdAPUZ6+mLBZS6Vl2m?=
 =?us-ascii?Q?MHJV6b3TO6uTahEh7J3dIcSn/gRdLtiE/oNj+ctgM0XN5nqsjPODOe4Zv5V4?=
 =?us-ascii?Q?EQQCJtEWLMqiub6CQI0NtppvN5h2m4NH+EOediEvBUNm1v7B79kI4GwE8Foe?=
 =?us-ascii?Q?ieM/Fg8vw+CBJF0+Si3lwzSvQ/7GFYCkOWnb60HqXWNllk0z4d18icqbT578?=
 =?us-ascii?Q?bWVr+e7VjHgvF0oE4ICQIPd+l66PgJKQ72kxOon6ut4Gvl+AebNwsB86/DJm?=
 =?us-ascii?Q?/KHtD9hNt8k95JauDwHfPiAqrEQW+ssKM5p4tNN6MiO+gktSkhjDvevyRctJ?=
 =?us-ascii?Q?rboecqg/+iq0Y82wgBRv/CMDef2ahHZjdhfnPaFNyCSUBX8qOiKZNFuYKB8z?=
 =?us-ascii?Q?ulvBQY/EAde4GJRQZVki4J6AVgA8KnYscWsQikz/D2LoT05Zi4Y6I6OxIx2O?=
 =?us-ascii?Q?lnGZQe8tU/9QFPuQ4rs=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(7416014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 02:10:17.0757
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 322a853b-0d5d-48ca-8dfb-08de3c4841c3
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000E9D6.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8853
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_181024_310211_A4CAFF83 
X-CRM114-Status: GOOD (  20.59  )
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

When a master is attached from an old domain to a new domain, it needs to
build an invalidation array to delete and add the array entries from/onto
the invalidation arrays of those two domains, passed via the to_merge and
to_unref arguments into arm_smmu_invs_merge/unref() respectively.

Since the master->num_streams might differ across masters, a memory would
have to be allocated when building an to_merge/to_unref array which might
fail with -ENOMEM.

On the other hand, an attachment to arm_smmu_blocked_domain must not fail
so it's the best to avoid any memory allocation in that path.

Pre-allocate a fixed size invalidation array for every master. This array
will be used as a scratch to fill dynamically when building a to_merge or
to_unref invs array. Sort fwspec->ids in an ascending order to fit to the
arm_smmu_invs_merge() function.

Co-developed-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h |  8 ++++
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 41 +++++++++++++++++++--
 2 files changed, 45 insertions(+), 4 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
index a9441dc9070e..f98774962012 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
@@ -930,6 +930,14 @@ struct arm_smmu_master {
 	struct arm_smmu_device		*smmu;
 	struct device			*dev;
 	struct arm_smmu_stream		*streams;
+	/*
+	 * Scratch memory for a to_merge or to_unref array to build a per-domain
+	 * invalidation array. It'll be pre-allocated with enough enries for all
+	 * possible build scenarios. It can be used by only one caller at a time
+	 * until the arm_smmu_invs_merge/unref() finishes. Must be locked by the
+	 * iommu_group mutex.
+	 */
+	struct arm_smmu_invs		*build_invs;
 	struct arm_smmu_vmaster		*vmaster; /* use smmu->streams_mutex */
 	/* Locked by the iommu core using the group mutex */
 	struct arm_smmu_ctx_desc_cfg	cd_table;
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 39e89176fa87..cc85e7a10ea8 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -3709,12 +3709,22 @@ static int arm_smmu_init_sid_strtab(struct arm_smmu_device *smmu, u32 sid)
 	return 0;
 }
 
+static int arm_smmu_stream_id_cmp(const void *_l, const void *_r)
+{
+	const typeof_member(struct arm_smmu_stream, id) *l = _l;
+	const typeof_member(struct arm_smmu_stream, id) *r = _r;
+
+	return cmp_int(*l, *r);
+}
+
 static int arm_smmu_insert_master(struct arm_smmu_device *smmu,
 				  struct arm_smmu_master *master)
 {
 	int i;
 	int ret = 0;
 	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(master->dev);
+	bool ats_supported = dev_is_pci(master->dev) &&
+			     pci_ats_supported(to_pci_dev(master->dev));
 
 	master->streams = kcalloc(fwspec->num_ids, sizeof(*master->streams),
 				  GFP_KERNEL);
@@ -3722,14 +3732,35 @@ static int arm_smmu_insert_master(struct arm_smmu_device *smmu,
 		return -ENOMEM;
 	master->num_streams = fwspec->num_ids;
 
-	mutex_lock(&smmu->streams_mutex);
+	if (!ats_supported) {
+		/* Base case has 1 ASID entry or maximum 2 VMID entries */
+		master->build_invs = arm_smmu_invs_alloc(2);
+	} else {
+		/* ATS case adds num_ids of entries, on top of the base case */
+		master->build_invs = arm_smmu_invs_alloc(2 + fwspec->num_ids);
+	}
+	if (!master->build_invs) {
+		kfree(master->streams);
+		return -ENOMEM;
+	}
+
 	for (i = 0; i < fwspec->num_ids; i++) {
 		struct arm_smmu_stream *new_stream = &master->streams[i];
-		struct rb_node *existing;
-		u32 sid = fwspec->ids[i];
 
-		new_stream->id = sid;
+		new_stream->id = fwspec->ids[i];
 		new_stream->master = master;
+	}
+
+	/* Put the ids into order for sorted to_merge/to_unref arrays */
+	sort_nonatomic(master->streams, master->num_streams,
+		       sizeof(master->streams[0]), arm_smmu_stream_id_cmp,
+		       NULL);
+
+	mutex_lock(&smmu->streams_mutex);
+	for (i = 0; i < fwspec->num_ids; i++) {
+		struct arm_smmu_stream *new_stream = &master->streams[i];
+		struct rb_node *existing;
+		u32 sid = new_stream->id;
 
 		ret = arm_smmu_init_sid_strtab(smmu, sid);
 		if (ret)
@@ -3759,6 +3790,7 @@ static int arm_smmu_insert_master(struct arm_smmu_device *smmu,
 		for (i--; i >= 0; i--)
 			rb_erase(&master->streams[i].node, &smmu->streams);
 		kfree(master->streams);
+		kfree(master->build_invs);
 	}
 	mutex_unlock(&smmu->streams_mutex);
 
@@ -3780,6 +3812,7 @@ static void arm_smmu_remove_master(struct arm_smmu_master *master)
 	mutex_unlock(&smmu->streams_mutex);
 
 	kfree(master->streams);
+	kfree(master->build_invs);
 }
 
 static struct iommu_device *arm_smmu_probe_device(struct device *dev)
-- 
2.43.0


