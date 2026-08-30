Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89777C61DEB
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 30 Aug 2026 22:27:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oR1CK28PTqKitvuH90iTIfQskiVl4FoOUAZtuExblJs=; b=hfsGvuXMn4JdPgFZ/itRgIt7hD
	17yKvTtRqDtUAOStEgPyJ8HgXQtxirhRu6JoGoaye9i8Yhw3pcfiy1jjq1Bv4fEZIg23hZ9AD2X4R
	kyg+ZlYZc517u83HXOK0xLZKNSkh6bW7zzew7bpy/96B5204k8iT/G2Crut+EfsZumeTWHVEkIOFC
	LJktKXfsucoWtW130s0/5GYTwrxZ2Q61hHsyA/nIbJvOIJvT35DRieiACidihtHUxaujMeBcIT9oQ
	BCy2vZb/ZSnigcPGebtdMbWLYOduy83LxhsospkDOTcFW5tFesFo96Ms2feRw+B/vJ9T+qUDrHviA
	mIeUY3Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0nzw-00000008Az4-2jj9;
	Sun, 30 Aug 2026 22:27:32 +0000
Received: from mail-eastus2azlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c110::1] helo=BN1PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0nzu-00000008Axl-1TaO
	for linux-arm-kernel@lists.infradead.org;
	Sun, 30 Aug 2026 22:27:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pkpB7v+l7Priox9aorSitCAUjYnvmkKpuWAi/pR6xWVNHLkmCoY39wFuQvYZ21NRA7QzQvh7g1lZji8vGhuMn+9XS63KY/2vTKAoRQWP7/d7SIQAYOYhaO82u7QBuCFds4rTeqeS2wHCbihwFMsgkoOD/rL7BjFGRzNjYwixRM39ZeGOEx00xS0kkrC8k5PmVq42CxioiIvVuTblZLc+pL54NtrC4WXsQN4KDdrglK1SHtITbNsvAgcnZ7aYeUteBrIH2FI4F2rbP88wBc0K1zNQ3QGsscT9t9SaihPn9qTT4iI9dHdTsAX/pXXGKufPTuDS6ysQC5RAzypMkSBwLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oR1CK28PTqKitvuH90iTIfQskiVl4FoOUAZtuExblJs=;
 b=GIh4hZn0lEePP92zbKddVKYLbm7wo22JWk8QWExmumL104HwHRa6O/PdNUINyuNfa1padfTeD+FvNt6OhncaCvr4ARlGOGyTyOmXA8kDL00jzXOO1opergkQCKWSo53F/bEy13EjODM0Du0129ZXAolGNBIeDa4IniGJri2S7ylQUYGZWm2Sg5zYB6Iv4Dg6/ag7HW/qVlvns1PaKTNHfOJIas8Jz9+DtdaYMeAP7PE1tI6G9qB8cqsVc6wRo0NHWZorH2dV97yZSBIkW5+fKks8ALtORbElMP9DH4CYA/biZKfYL9U56duWEr6f3YEn55ZqdMqv68izeeZC9ChoNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oR1CK28PTqKitvuH90iTIfQskiVl4FoOUAZtuExblJs=;
 b=RlBd1iCjB63hajcLOuZOX2WBbcvCO5QlD8preDdboD70nRfarKpSknokxWp+TrBbNyVWwRDU1mcj/aaBfv2NvM/x8lGxxg+TOyVqfbqpfbc6aBswjKzKZmdPeVdA/bVFNBc4l2+tzyiy/VvhHXc2Cn9Q/tNcfIPYbgx1dUa5pYG2bbBo2wMFYHWY5VwxhWKs2CRosw1162N4FqP6BRYsOOeLMuboa9oTm5qlJZcJ9FBG2Q8XqjhyG2NDEfNgCyHvT4Xfb2H1LMbYiR65ok+Wgt9vTL63TGoMWXfNE0836zi1FC4+Lj+XPwutsUGNtKRZwdk9Ct/tzJy5OvWGmeUBzg==
Received: from CH3P221CA0017.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:1e7::16)
 by DS0PR12MB999263.namprd12.prod.outlook.com (2603:10b6:8:424::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Sun, 30 Aug
 2026 22:27:23 +0000
Received: from BN5PEPF00046987.namprd02.prod.outlook.com
 (2603:10b6:610:1e7:cafe::56) by CH3P221CA0017.outlook.office365.com
 (2603:10b6:610:1e7::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.13 via Frontend Transport; Sun,
 30 Aug 2026 22:27:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 BN5PEPF00046987.mail.protection.outlook.com (10.167.245.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Sun, 30 Aug 2026 22:27:22 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Sun, 30 Aug
 2026 15:27:18 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Sun, 30 Aug 2026 15:27:17 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.14) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server id 15.2.2562.46 via Frontend
 Transport; Sun, 30 Aug 2026 15:27:17 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Will Deacon <will@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>
CC: Robin Murphy <robin.murphy@arm.com>, <joro@8bytes.org>, Kevin Tian
	<kevin.tian@intel.com>, David Woodhouse <dwmw2@infradead.org>, Lu Baolu
	<baolu.lu@linux.intel.com>, <linux-arm-kernel@lists.infradead.org>,
	<iommu@lists.linux.dev>, <linux-kernel@vger.kernel.org>, Pranjal Shrivastava
	<praan@google.com>
Subject: [PATCH v6 4/5] iommu/arm-smmu-v3-iommufd: Convert cache invalidation to the core array loop
Date: Sun, 30 Aug 2026 15:26:41 -0700
Message-ID: <5223275dbc8ef00af233f3fee01efa09e45f26b5.1788127877.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1788127877.git.nicolinc@nvidia.com>
References: <cover.1788127877.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN5PEPF00046987:EE_|DS0PR12MB999263:EE_
X-MS-Office365-Filtering-Correlation-Id: 22c58d72-7005-4ea2-b2e4-08df06e5dcbe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|7416014|376014|23010399003|36860700016|6133799003|3023799007|10067099003|5023799004|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: taGpjYxQFfW32DRhjU7+E/GjTCoTP9rZGKl4v1t+PSElYV08Uj6uEfA5NOWZFVI0Zv+e4xiX5Uzi/H5Dgrl/ngqO5n4igJGBtgy9bR+dJ3xYM1wP1H6sGuIZWwHT5K7mD4GIvPZIQwlkkWZALMcG1HRhBw9VOWilwCuJ8aojuxh0walJat/u3kpi+9CPqJiniiWtWljaHZrDpZLdf3uWXoYHwy5CZO9Ja9QwlgQEFlBYuEhgU0DLWHecDXayHbdgjF84DWNeBff/l5gTqw9OocxeU2Q9Zs5Z5jxGcSLoYscdjqsqwomnfXe6KbMbDHa4ameeHwVMieeJf6IkS7nAeoo1mmIaeATA03LYXkxTOs8b6McwkQWLcgyjlgpRsDqNjwZPVylCuME3U92K3Zl+M6VJA/JXTKfpowNrWjalwWzx6itQ68bEjTdBFJL07uBL8cKXU3qpM7cseF6Z2Fg6eih+I7DjNFmRMbg57NRs5QYJwWfu7gsjCN4ypipCKqCQD1UdQoTn7GZLyP3O9ChETfFX92ta+l2bz5P3a7sduDdxSw14+aE0r7E8KNL5ogYVdb18ruPO9TRhYtaas2Y1Wbi1kXOaV92snerjfW+K4sB7+zdFAvi+XMj5LepZ91fKx+UYxl1tpzQAZvB558INc7i3zPu4XDr8ZJg67mvge7U+o9byF7ADVONQj6AVNqSIxn0dN14ZbVIxCy3xlE6Fuw==
X-Forefront-Antispam-Report: CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(7416014)(376014)(23010399003)(36860700016)(6133799003)(3023799007)(10067099003)(5023799004)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Ov5Gqdh7z5xhyj93BT+S2+y0yJA1PQafrWsqCIkmhKhwa3+oQENwjaNc86XmQUVJ7ZK7XrqVd7Jy5W+JKIvQKNOWPQcFYLgujBltzawxd8hOrzrfblIqy0KIGWiPX0nAdK8B1fbr4+15b2RwrGfYfz9FbGRjl4qssY/zq2uAZub5WLhqMQBOUVlYH6HvlpXiwxUSXYejsaMRa8WBKFm98Nb66LVqZmGsEGUSrXcCjZOGiAJml2xJN0KyWV3uUKt2uYEuhYaw1oy2gs2fwetZusWn+DaqDj8spf20OP3VJ/7tgEZQfB/drFcdYUJVkQZQ+WkSe1fYGSuB+w5V81+FL8mazu3gG9rOgntgK+GoGV0EUT9IvXwRfOACfB6YDnLPPXtSow1SzPS6tfzryQs5BT+WNYGTV6NK2lW3kZCgbLnKbphY7vNdEbgi877i+fEK
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2026 22:27:22.8863
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 22c58d72-7005-4ea2-b2e4-08df06e5dcbe
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN5PEPF00046987.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB999263
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260830_152730_395736_16055CEF 
X-CRM114-Status: GOOD (  21.87  )
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

arm_vsmmu_cache_invalidate() allocated a buffer for the entire user request
array, walked the array converting each of the commands, and issued those
converted commands to the cmdq in CMDQ_BATCH_ENTRIES sized chunks, carrying
the sub-array bookkeeping all on its own.

The iommufd core now iterates the invalidation array and re-invokes the op
with the not-yet-handled sub-array, so the driver only has to proceed with
a single chunk per call.

Instead of a per-array allocation, use a fixed on-stack batch to copy from
the userspace array. If the copy fails due to nonzero padding (VMM violates
the ABI), fail the entire batch.

Convert the whole batch before issuing any of it: a malformed command is a
userspace bug, so the first illegal command fails the batch as a unit,
issuing nothing and leaving array->entry_num at zero, the same way the copy
above bails on nonzero padding. A batch that converts cleanly is issued in
full, so the op returns either a handled count with no error or zero with
an error.

A zero-length array now returns success once the data type gets validated,
matching the documented probe behavior, rather than the -EINVAL that the
full-array copy helper would previously return.

This also fixes two long-standing bugs:
 1) On a conversion failure the old code reported commands that it had
    converted but not yet issued, so user space advanced its consumer
    index past invalidations that never reached the cmdq.
 2) A zero-length array was rejected with -EINVAL, although the uAPI
    documents it as a valid request that only probes the data type.

Reviewed-by: Kevin Tian <kevin.tian@intel.com>
Reviewed-by: Pranjal Shrivastava <praan@google.com>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 .../arm/arm-smmu-v3/arm-smmu-v3-iommufd.c     | 68 +++++++++++--------
 1 file changed, 38 insertions(+), 30 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
index 747b9d47ff7e4..ab1078a97d801 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
@@ -478,49 +478,57 @@ int arm_vsmmu_cache_invalidate(struct iommufd_viommu *viommu,
 			       struct iommu_user_data_array *array)
 {
 	struct arm_vsmmu *vsmmu = container_of(viommu, struct arm_vsmmu, core);
+	struct arm_vsmmu_invalidation_cmd cmds[CMDQ_BATCH_ENTRIES - 1];
 	struct arm_smmu_device *smmu = vsmmu->smmu;
-	struct arm_vsmmu_invalidation_cmd *last;
-	struct arm_vsmmu_invalidation_cmd *cmds;
-	struct arm_vsmmu_invalidation_cmd *cur;
-	struct arm_vsmmu_invalidation_cmd *end;
+	struct iommu_user_data_array batch = {
+		.type = array->type,
+		.uptr = array->uptr,
+		.entry_len = array->entry_len,
+	};
+	u32 processed = 0;
 	int ret;
-
-	cmds = kzalloc_objs(*cmds, array->entry_num);
-	if (!cmds)
-		return -ENOMEM;
-	cur = cmds;
-	end = cmds + array->entry_num;
+	u32 i;
 
 	static_assert(sizeof(*cmds) == 2 * sizeof(u64));
+
+	if (array->type != IOMMU_VIOMMU_INVALIDATE_DATA_ARM_SMMUV3) {
+		ret = -EINVAL;
+		goto out;
+	}
+
+	/* A zero-length array only probes the type, validated above */
+	if (!array->entry_num)
+		return 0;
+
+	/*
+	 * The core re-invokes this op for the remaining requests, so copy one
+	 * cmdq batch worth of commands into a fixed on-stack buffer rather than
+	 * allocating for the whole array.
+	 */
+	batch.entry_num = min_t(u32, array->entry_num, ARRAY_SIZE(cmds));
 	ret = iommu_copy_struct_from_full_user_array(
-		cmds, sizeof(*cmds), array,
+		cmds, sizeof(*cmds), &batch,
 		IOMMU_VIOMMU_INVALIDATE_DATA_ARM_SMMUV3);
 	if (ret)
 		goto out;
 
-	last = cmds;
-	while (cur != end) {
-		ret = arm_vsmmu_convert_user_cmd(vsmmu, cur);
+	/*
+	 * Convert the whole batch. Sending an illegal command is a VMM bug, so
+	 * a single one fails the entire batch, issuing nothing.
+	 */
+	for (i = 0; i < batch.entry_num; i++) {
+		ret = arm_vsmmu_convert_user_cmd(vsmmu, &cmds[i]);
 		if (ret)
 			goto out;
-
-		/* FIXME work in blocks of CMDQ_BATCH_ENTRIES and copy each block? */
-		cur++;
-		if (cur != end && (cur - last) != CMDQ_BATCH_ENTRIES - 1)
-			continue;
-
-		/* FIXME always uses the main cmdq rather than trying to group by type */
-		ret = __arm_smmu_cmdq_issue_cmdlist(smmu, &smmu->cmdq, &last->cmd,
-						    cur - last, true);
-		if (ret) {
-			cur--;
-			goto out;
-		}
-		last = cur;
 	}
+
+	/* FIXME always uses the main cmdq rather than trying to group by type */
+	ret = __arm_smmu_cmdq_issue_cmdlist(smmu, &smmu->cmdq, &cmds->cmd,
+					    batch.entry_num, true);
+	if (!ret)
+		processed = batch.entry_num;
 out:
-	array->entry_num = cur - cmds;
-	kfree(cmds);
+	array->entry_num = processed;
 	return ret;
 }
 
-- 
2.43.0


