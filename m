Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B83A1D66BBB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 23:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PGaBx+a+bo+0k46REkl6gOsGSESYdAY/iH34Eh+cNtY=; b=k6NF4JIeE2ibKSkUvJtwFRRqzF
	XFMw63ejg/5rdFa5CAQ5R6TvRMxAbcEhRgDpkbvrEVU8Ie4YJ1qnpxBhgljtrbD+pafOq4QhniCc8
	LQFtzvixK+djFV/Z4yfuDhxy5F+Cp+63E7xQoDDi4vFypKv8lZ4rG1Iy2FavmVE7RMSN+9inZLlpz
	4870wTcqTwhW3Oc40e4hep0fWFaH0ubY8zufM6lrLeprxz8oJp0W0UD4GIaj/RMCUJElrBcXImNR0
	WpuiLtrMQ5jsuMqPSSnxU19y/vXQHyctp4dsgtyq5KV9hkGkWmeWF6gg6XU5Yst2WC1/cowR9iQJL
	p2L135ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW0tX-00000007WvJ-1fYs;
	Wed, 17 Dec 2025 23:25:25 +0000
Received: from mail-westcentralusazon11010067.outbound.protection.outlook.com ([40.93.198.67] helo=CY7PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW0tN-00000007Wqo-3KoT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Dec 2025 23:25:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DEBMN+SymDzMIsU6vaxTMhw8DlBKgTMeqklyRXVWg7GLxD0IRkVdw8mPAbIw46+MuHzO8xqz1tG+KMq4WQ0ozjWtcQxEsslHOk5CKePdi/cV+5gCXH+4uNltJxdGiJPx4yuTDoXg8BhYGtxUCbB6ShWaDyo4Iz/+H+RVlmFob/nsJQDZoN8rq7gZxvzec5B6ZbkoVOW6WHNVXtcN/nrI3UjdYsMoq8qz06HQ6EY1cHyDBP2+7SFeLYApMAyXpAD3h8yn3dBEJSKcO8aoZXAyxey+dVZnXebl6SJyPGZur6gkhvvwRH0HDR8J0A3Mx2CJ8m0DqnN3kmHQfKVNDovnmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PGaBx+a+bo+0k46REkl6gOsGSESYdAY/iH34Eh+cNtY=;
 b=dh5W+yXWCmIf2Mfi9CHpL1kicneJ/PDtWGm9DBzovy54gMc022pNTWZkOydSRrVhWMGRlzgezkZT29wpv8jyWKeRjcT0wZPOl6Ckf3uQzNPCsoggcheak4WLwQO1MAqHnpRRPBp6Hd/XCt0S2PGlBE4/6ObmMMmvzL/koqCimB5QyPbaaExcQfK72QHXdnk2JImIOxiITNr48lLI/siJCaHre26OifxD9MxNrXwKMSW8jlDq2EtwImEtgTttbssRm/hibmKLW3WQOFh9i3FJo8okDpB8KCml/Z+j4UsgtAoARZrmldMsL7GsmH9jXsMQo2Ip4z8E4q6uHl0xn3XXJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PGaBx+a+bo+0k46REkl6gOsGSESYdAY/iH34Eh+cNtY=;
 b=m5WfbxJW4Rq/urELyIA0tc7eBWIYcNc4DqvoedH71esMHukQ8BJxZnn6n3IHfbnA69e8SdaQtFyk2aoCkeqe6B3RvxiRCIflhdP2zjc3XjhiUfR2kbidtFMQYqxDSKPLCAhdMYERd4l58+yht5CTRxYxD9qP1MuwCHmmb2otx/i4UFMelyhBKOG9mlvAmES4ziL5A9qab+MtYGWHigcS0L2VvDuAE2E+ysaeIaqWn5ya5Uw6q1ilKg5IX5KO++2X5LnZ+kFKK1fUzIWjwsLksj2InkZ8xAtR/a7naaUAWTBf+GEBo8INHwuFVDfOeQAYgpIqaztLBMucpDwYfcJR4Q==
Received: from CH0P223CA0010.NAMP223.PROD.OUTLOOK.COM (2603:10b6:610:116::20)
 by DM4PR12MB6351.namprd12.prod.outlook.com (2603:10b6:8:a2::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6; Wed, 17 Dec 2025 23:25:05 +0000
Received: from CH2PEPF00000144.namprd02.prod.outlook.com
 (2603:10b6:610:116:cafe::aa) by CH0P223CA0010.outlook.office365.com
 (2603:10b6:610:116::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.7 via Frontend Transport; Wed,
 17 Dec 2025 23:25:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH2PEPF00000144.mail.protection.outlook.com (10.167.244.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Wed, 17 Dec 2025 23:25:04 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 17 Dec
 2025 15:24:49 -0800
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 17 Dec
 2025 15:24:48 -0800
Received: from Asurada-Nvidia.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Wed, 17 Dec 2025 15:24:48 -0800
From: Nicolin Chen <nicolinc@nvidia.com>
To: <will@kernel.org>
CC: <jean-philippe@linaro.org>, <robin.murphy@arm.com>, <joro@8bytes.org>,
	<jgg@nvidia.com>, <balbirs@nvidia.com>, <miko.lenczewski@arm.com>,
	<peterz@infradead.org>, <kevin.tian@intel.com>, <praan@google.com>,
	<linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v8 4/7] iommu/arm-smmu-v3: Pre-allocate a per-master invalidation array
Date: Wed, 17 Dec 2025 15:24:29 -0800
Message-ID: <d6565a84698d93d6a2842b32bed492f87179af5e.1766013662.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1766013662.git.nicolinc@nvidia.com>
References: <cover.1766013662.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000144:EE_|DM4PR12MB6351:EE_
X-MS-Office365-Filtering-Correlation-Id: 17a0fa27-c851-4ebb-5fb9-08de3dc38286
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|376014|7416014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?PaoDL5ALd6MLSGr9l7ijwajc5skBMVCsvTx2qMgKKD7sR3agb1XIOe6S3u+6?=
 =?us-ascii?Q?X8zu0U7ogjNBJYaIqHXIRi9iQCUdIPAfTgpGWUQ63YgMDRIFioMTOnjmanpO?=
 =?us-ascii?Q?woCXGaQL+AqrMkskwwlGIEABYbHrNyqO47t4Pd2sXAoo4vk4fInt0jgIP9Eo?=
 =?us-ascii?Q?D5k4L0xFX8n0mcWsZEIoHsirTVfmQ5k4h8TOcXSeTMGjFei/jl+b/VdL80ef?=
 =?us-ascii?Q?6U2/Dm9bggfWXMR7ARn98bEqQaFnCGKKoDkYFKCLesYR1Xr2jt6mr/HIUlx2?=
 =?us-ascii?Q?31PcGl3W86f9ODYccK5cOLMGWJT1MIZzHWaSQPq8HPJZtf1Ao01O8EtbCbuN?=
 =?us-ascii?Q?Tv0K0dzzcdIpU1OuK1zWIbxLpfL5N/eT09aWKdiay0+nVD7zOf/A78dMMvn5?=
 =?us-ascii?Q?nxDdwFbJEmeXB1onP61hK5z/4sib2vAnK4n23Z9TkBg+qvD2vhkKhJZ1mEwt?=
 =?us-ascii?Q?UOQKNLROj8uT71EMfbxmFPgEyIPSCCVhoOGUNTbHBaBApZ3aTjfsNumIU9a9?=
 =?us-ascii?Q?gBve3ISteanUKZC6nUHKfGuqSOLusp9z8JdwfR7agIyb7EJ188zLyxHCPzLL?=
 =?us-ascii?Q?V6dhg8JMVEh7I+etlRS5gFQ+HHdaPsGgup02vR0AtacRLjI9AVUJoHC9dnLz?=
 =?us-ascii?Q?MoGub3dY2HLYMmNKtrxxhq5lBr71uBoDbdIOdJLcmCqTHNC9mYGbhq743FXM?=
 =?us-ascii?Q?WMtVCpruMNaoT62JHRyQk8zp6db/Dk/w3dZZHBj0u5IENIv1Bj/HpzAjnFQx?=
 =?us-ascii?Q?GPhZXnNkRdWK4EBau/1X2nj2HQL0B9SgnNY3AuzfvKeWApm/jbWy9nzDlNxe?=
 =?us-ascii?Q?bwBfkWz83vn99XjqbgPBU1f5bW3yNawqwFY+90jM4VQxSLD+cF96567rNNwX?=
 =?us-ascii?Q?YTARQ8d1CgZSlTsWe0FRDLUtGii9Vwqx+Q+NnbRWm4MEy5mdixYBPALEHgHQ?=
 =?us-ascii?Q?fUQx3PHYfZ/g+TVITIer8Dqn3Pnvg9IqbvXOIUVQ3U3V3tWEdA5uVMNziHNl?=
 =?us-ascii?Q?YhcDyGQrhaDy7Hc8zlXH1SNT3BJFUgh6gGSLqcP2oJFJFEtJW9chqpnk7tJH?=
 =?us-ascii?Q?IhWp2042NwvWCco3mlY92fktePkdKnkk84dDnf01LJL0pisg2ZWTHRVCeHtg?=
 =?us-ascii?Q?aNhaOqq9wmx79sLunxKwXi70w0Dg3WHOzifubdQEfLY5b6r6Cb5Cuu0e+I6h?=
 =?us-ascii?Q?FeFJEf65lvAakNytO1cmwj1TQC56xUOuIBlrUB4HkMuxZL4P32sFBL85K0ke?=
 =?us-ascii?Q?YwqJVYZkGDtGk9kMAaR6cXi6TOgqvYYYKopoUf9UhbnMHeLp18HaJhOrFSw5?=
 =?us-ascii?Q?VNPG70xfaDpiCgIVsOKjJGOV6kuDVNPx1d0cViV0EgoOqRGJBabyQjR0o9VN?=
 =?us-ascii?Q?A/LbvZMhkTeVO6mKuuRg85RmQzxDTwQcb9HqBnwyI2d3DKlSLgwjSuJsVzVV?=
 =?us-ascii?Q?yw/WkhkhU+8xwiunwElLCP5EYZPSdd7Me0H+1YzakiPzhMU6lGFEgdbnX8hs?=
 =?us-ascii?Q?2wz5UhIATmTgZ0TC7eQt/wqSy5/DfNP0GRIVl9TdG9Dvu0awK6dAiWU8QV6+?=
 =?us-ascii?Q?/H2NX0TUV1Y1AONSzcY=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(376014)(7416014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2025 23:25:04.9231
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 17a0fa27-c851-4ebb-5fb9-08de3dc38286
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF00000144.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6351
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_152513_844115_2B8DB099 
X-CRM114-Status: GOOD (  21.70  )
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


