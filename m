Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1810DC87FC5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 22:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/Uyw5Q0+gndKZkeMm6D3w50lqnd0tcVbSLyo9AZC6nc=; b=0KhRaXvQubslaO0b3q35f0I2Oi
	OGIeGJXhbL/G/wpSqXIHo3cbAqgr26MxokO0go5jSpWp+qBXjxRKyQqHVJBiGj61Kuwst6Lx06weN
	yoaxVlZeByfgrYZQJkpzmzvBLEdgfSRGUrziaOpfhZsZjZ/OvzdZdhBAb21MDyodHM7w+wTVRxAFY
	w6tzdf/cp+V2QMNx+oJUdjfL1RfrupRl5fT8Qmai1ARaKtNlZ8iQQ/5FcMPgc/Lnii8irDcw0hBi9
	RmEU2yqjD6BV5R3TkCH0u0BCv0/IqK0KlRfzwGbL7nxYHchTnibKUm+Ce51MVAxLddUWPvcjAsL3q
	B00obx3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf4GQ-00000008a2s-20tv;
	Thu, 24 Jul 2025 22:18:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf49t-00000008Z2w-1zCr
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 24 Jul 2025 22:11:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=/Uyw5Q0+gndKZkeMm6D3w50lqnd0tcVbSLyo9AZC6nc=; b=SMMMqENdfrOGUie9SCGon8wthJ
	XwFRbITzXgjouV5p57NdC55VlwwJKTI9t0iSjVbhmUEhtcfIszfCmgQcz7bhcvVCYpmCdDXtNKCaf
	//KwaBCvxnDvFQrIeHdnjcNpQF3sHpTnJxuC/Bv0QVKOyliXrCMIUr/3MzavO1XEYqMae41EN8ojQ
	3yCyvlZlOzQAtKUOqQiUuXNBU4CNgDcUacu6qmy9XTWBrDDs+ozme6n1saEMxN1fTLgt5RE5XJs6Z
	1ZO91S1S08uLKh8lfX7dxfaiSg+pgHtWh4EHgM+zgoMUGjjMHfIbYaPBR9I+Nwj7qOgPuqKgGWIW7
	m56ku77A==;
Received: from mail-bn8nam11on20630.outbound.protection.outlook.com ([2a01:111:f403:2414::630] helo=NAM11-BN8-obe.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf498-0000000Bhvz-3eJU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Jul 2025 22:11:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TMZQsyUfx3fKCelSCi+0RjZw9Lh9B4YzkObSufr53885qYrMAJPF2i3iA9b3Ck97oB8lu9ykENflHYP5XZb0o11BRGAOKySrDxDn9lrwKpTsBgqDAXbnw449JoB75RHgWQI7frjeFRb6oiczizRZfjU8DnAORVxXJbYY/BgHSKaKR6PnczA9+LB7ahpRwC7yqsOXlDEzXpFv+5neKApvzzRmc/tWrUR/8TtFUDCOHmTJJZenbT+3plXptXmIPecAY+zf896S9SfjC5UJ725mIcBwXkq5xXi8Io7ScAIu266k0OA680bt5F2eb7MNVd9/zMIdLFXKUFU2tMCTcTWs0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/Uyw5Q0+gndKZkeMm6D3w50lqnd0tcVbSLyo9AZC6nc=;
 b=wZmDT+7Qb3DcZZMeNaXJ+uhM6V17OHtH6mCNws8k9tfQj3p0xGmPpjzyMAtyEBH8N1ZjmFgPzKXpnJityr/oKGOYotUG3jCPxMgV/2l5IWG+9T6+PDuhkR+nvTFiIe6qCZWnsPtaMU2t+fCzKaKwQJAM0eaSSvcIpJrq4ylWSWCk1NiZJAgsEcX7aMnzJiXbH4AdBYhYOSeoIW7ejwdLZL1K/t7ZIeDmDpzDs7w7v+haLa6/m8CE8/JetPXB7chLxTGYhoXe/jHRFCp9waXz6GayPTb3g9LapOrvoEM4FePeFPp+KExnrInhT4McvGknpC02WmV1U/pb8HN8vwrKQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/Uyw5Q0+gndKZkeMm6D3w50lqnd0tcVbSLyo9AZC6nc=;
 b=i6oBnzfEc/jQU2JG//zVGxVeLt7q6fQ0wreMVLQpBAuEcQGF18q3S4LqM6YyqRR+cQQPHUPCUnPjtg+Ms0J/SOmRwRz0X2gpKHUdD09D0LXAn9PXqrH0FiPv1ZjupemsF5XAwSWPuCqZ++vUP58jJwnowdVEpFBCcpRWuKbKlVO+Gfo+Nza9JryyIS3JDZbZv3kOsFxT9tBalk4YkM2iKx9R30k8mIeF/NDfsxaKEfRJWNmDdc3Sld7onPGENcbqBA4wGIti2cWCFBavvrPsRTphLVP1R9TgSxxQgXrhp2eXf3GbMcWDh3x3bUcWic0Tbu0lPHE8IDKGbWrzlo5yFg==
Received: from BN0PR04CA0142.namprd04.prod.outlook.com (2603:10b6:408:ed::27)
 by MW6PR12MB7087.namprd12.prod.outlook.com (2603:10b6:303:238::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.22; Thu, 24 Jul
 2025 22:10:28 +0000
Received: from BL6PEPF0001AB50.namprd04.prod.outlook.com
 (2603:10b6:408:ed:cafe::3a) by BN0PR04CA0142.outlook.office365.com
 (2603:10b6:408:ed::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.21 via Frontend Transport; Thu,
 24 Jul 2025 22:10:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BL6PEPF0001AB50.mail.protection.outlook.com (10.167.242.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8964.20 via Frontend Transport; Thu, 24 Jul 2025 22:10:28 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Thu, 24 Jul
 2025 15:10:10 -0700
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Thu, 24 Jul
 2025 15:10:09 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.14) by mail.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Thu, 24 Jul 2025 15:10:09 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: <jgg@nvidia.com>, <will@kernel.org>
CC: <joro@8bytes.org>, <robin.murphy@arm.com>,
	<linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<praan@google.com>
Subject: [PATCH v4 1/2] iommu/arm-smmu-v3: Do not bother impl_ops if IOMMU_VIOMMU_TYPE_ARM_SMMUV3
Date: Thu, 24 Jul 2025 15:10:01 -0700
Message-ID: <20250724221002.1883034-2-nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250724221002.1883034-1-nicolinc@nvidia.com>
References: <20250724221002.1883034-1-nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB50:EE_|MW6PR12MB7087:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b626f9f-9154-4167-6c36-08ddcafee5f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?nlGlLIJrQYQIKJSARoLe7yzTEOd8ezLU9Se6ND1hbeV5ndKuZUdZgdcMP9hS?=
 =?us-ascii?Q?6gBeX4pla0Q1g37HoK5kjCIrtYWBEUslZ7aYiAlKDlfTs2TmkA7t4VKrsMtb?=
 =?us-ascii?Q?Rph+GbR5aOIVoq/39XxkAYNn+jbi29sbKEr3MlS2bL8V7f5gOx1g1jBb0Ugw?=
 =?us-ascii?Q?FlviTItoN2pkKKk/tgoMvvxKWWeS5NjbYncYTuOYLxHrASzNjaAdAqsgKAE+?=
 =?us-ascii?Q?LXxTjQjRUrp4Vfy0c5xY/NbR3Z4/lHZfUdJ4vHeDrNDNNwD10ToAqcKJ3tXG?=
 =?us-ascii?Q?zjKUXLGJtrSn647QGkLR7gIymxCFygzgkdnaSeV6guaNQHHBjiXncmkNs9Y7?=
 =?us-ascii?Q?o/tmto/aBHfWK5zcvYidGRkgs1fgFryGGEM5rKrqmBQYWR7Dt04z728sHjkB?=
 =?us-ascii?Q?4T4q2J2Uy3SHVt9XWBzHQJNGleFX8GJg/FOXMB6PFmelAcikhU93kmPmFqHB?=
 =?us-ascii?Q?KZubPdo5eKBXgYUHZCP4qf2B2/i5VGNqVZ6rlCfKbZGZgRMKzsQrDP3CVtSI?=
 =?us-ascii?Q?48LQiKcS6/p05sTRn40R+taD07yErBqkDROv+yR7FvrbhAugtSoQXMPCrB/1?=
 =?us-ascii?Q?lXzWns19IQsfwNZTm5J+SWlT1k9+eTR6CH89actXt4pSo0lvUT59Ubyw+ChD?=
 =?us-ascii?Q?EAxuqZsn10QOyLtBVM8/bOIRlQ3eVtlGhr/q3h5TC94GJA+bpW67+zc0pexL?=
 =?us-ascii?Q?kgDmQ08oiFuimpcEmqHFLuW4E7DsBfpwviLJTxXe699JEjB9FM1Mg8svdmEG?=
 =?us-ascii?Q?HQxsXdrDEkU+5B46Uzt9SK5Dw1Tb5A/oegnBxiVHfOsbzbLkyplUJFG34gIj?=
 =?us-ascii?Q?0DMjVe8WzSiCMV+n8noNTrJQY055dWyM6ssOlDKDy2gPdlagHEfyY9gTq7+K?=
 =?us-ascii?Q?mptFr1OIQQ/UwcNuM6dB5MOPFu4UGX2YHlaQrv8T3/jCv+zknvIIq9iDB8xn?=
 =?us-ascii?Q?SP2a2Zbn1vxvJVaP4/TrtUxCBZrS//VGPtRGAkHLK/qyxQpNW/tJg9+19bYZ?=
 =?us-ascii?Q?tj6BOpR5RU+tQd4cJ/G34pyOQfZbDiJyUtR+izsdzC3zRbfNQB18+LyDuXh4?=
 =?us-ascii?Q?ZEY59h/EcZp87fQfQS+SgIUMBZAB2rd6ZP1mQ39h0BHng8I36WADXgqLoSvL?=
 =?us-ascii?Q?HVH0JwJlR4P157bC/iknXKl4DaBQ+3VF+2auoKT5TFJfAtuHt3f6JLOKyOR7?=
 =?us-ascii?Q?p1zTVcTSB5tmzokOUVMmvmKcdJrfBswMfyM+WKK4GMioFN7GCudE6X7FSnrd?=
 =?us-ascii?Q?8rggMa4CzubzIMy0Q2yUK8dcXZoW68DkATbZ6EbhZ7AJECXVG2JsAuEmZB2E?=
 =?us-ascii?Q?ps1TgkTl1UeS74N8X04RRAASMgZ32She5driZXXlsEwIg7Grz81yXfMXdWff?=
 =?us-ascii?Q?LimasQhBVns6bHFzcOe9yMQq4EhPHWkjH3Jalrejnpp3IfzsLBZZpo4Qhlxv?=
 =?us-ascii?Q?K6R/QQxrlNNLMPFad47b/mrHv8DzlNV1oeroig//1rWkWRIFgbHPuhI4jKLi?=
 =?us-ascii?Q?y5P3xezsK8cEbDHpPc+n27boe7aRj6qluio/?=
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2025 22:10:28.2988
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b626f9f-9154-4167-6c36-08ddcafee5f1
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB50.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB7087
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_231039_261826_7B00FC47 
X-CRM114-Status: GOOD (  16.26  )
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

When viommu type is IOMMU_VIOMMU_TYPE_ARM_SMMUV3, always return or init the
standard struct arm_vsmmu, instead of going through impl_ops that must have
its own viommu type than the standard IOMMU_VIOMMU_TYPE_ARM_SMMUV3.

Given that arm_vsmmu_init() is called after arm_smmu_get_viommu_size(), any
unsupported viommu->type must be a corruption. And it must be a driver bug
that its vsmmu_size and vsmmu_init ops aren't paired. Warn these two cases.

Suggested-by: Will Deacon <will@kernel.org>
Acked-by: Will Deacon <will@kernel.org>
Reviewed-by: Pranjal Shrivastava <praan@google.com>
Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 .../arm/arm-smmu-v3/arm-smmu-v3-iommufd.c     | 27 +++++++++++--------
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c   | 14 ++++++++++
 2 files changed, 30 insertions(+), 11 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
index d9bea8f1f636d..b963b9b3de542 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
@@ -420,14 +420,13 @@ size_t arm_smmu_get_viommu_size(struct device *dev,
 	    !(smmu->features & ARM_SMMU_FEAT_S2FWB))
 		return 0;
 
-	if (smmu->impl_ops && smmu->impl_ops->vsmmu_size &&
-	    viommu_type == smmu->impl_ops->vsmmu_type)
-		return smmu->impl_ops->vsmmu_size;
+	if (viommu_type == IOMMU_VIOMMU_TYPE_ARM_SMMUV3)
+		return VIOMMU_STRUCT_SIZE(struct arm_vsmmu, core);
 
-	if (viommu_type != IOMMU_VIOMMU_TYPE_ARM_SMMUV3)
+	if (!smmu->impl_ops || !smmu->impl_ops->vsmmu_size ||
+	    viommu_type != smmu->impl_ops->vsmmu_type)
 		return 0;
-
-	return VIOMMU_STRUCT_SIZE(struct arm_vsmmu, core);
+	return smmu->impl_ops->vsmmu_size;
 }
 
 int arm_vsmmu_init(struct iommufd_viommu *viommu,
@@ -447,12 +446,18 @@ int arm_vsmmu_init(struct iommufd_viommu *viommu,
 	/* FIXME Move VMID allocation from the S2 domain allocation to here */
 	vsmmu->vmid = s2_parent->s2_cfg.vmid;
 
-	if (smmu->impl_ops && smmu->impl_ops->vsmmu_init &&
-	    viommu->type == smmu->impl_ops->vsmmu_type)
-		return smmu->impl_ops->vsmmu_init(vsmmu, user_data);
+	if (viommu->type == IOMMU_VIOMMU_TYPE_ARM_SMMUV3) {
+		viommu->ops = &arm_vsmmu_ops;
+		return 0;
+	}
 
-	viommu->ops = &arm_vsmmu_ops;
-	return 0;
+	/*
+	 * Unsupported type should be rejected by arm_smmu_get_viommu_size.
+	 * Seeing one here indicates a kernel bug or some data corruption.
+	 */
+	if (WARN_ON(viommu->type != smmu->impl_ops->vsmmu_type))
+		return -EOPNOTSUPP;
+	return smmu->impl_ops->vsmmu_init(vsmmu, user_data);
 }
 
 int arm_vmaster_report_event(struct arm_smmu_vmaster *vmaster, u64 *evt)
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 181d07bc1a9d4..9f4ad37058010 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -4703,6 +4703,7 @@ static void arm_smmu_impl_remove(void *data)
 static struct arm_smmu_device *arm_smmu_impl_probe(struct arm_smmu_device *smmu)
 {
 	struct arm_smmu_device *new_smmu = ERR_PTR(-ENODEV);
+	const struct arm_smmu_impl_ops *ops;
 	int ret;
 
 	if (smmu->impl_dev && (smmu->options & ARM_SMMU_OPT_TEGRA241_CMDQV))
@@ -4713,11 +4714,24 @@ static struct arm_smmu_device *arm_smmu_impl_probe(struct arm_smmu_device *smmu)
 	if (IS_ERR(new_smmu))
 		return new_smmu;
 
+	ops = new_smmu->impl_ops;
+	if (ops) {
+		/* vsmmu_size and vsmmu_init ops must be paired */
+		if (WARN_ON(!ops->vsmmu_size != !ops->vsmmu_init)) {
+			ret = -EINVAL;
+			goto err_remove;
+		}
+	}
+
 	ret = devm_add_action_or_reset(new_smmu->dev, arm_smmu_impl_remove,
 				       new_smmu);
 	if (ret)
 		return ERR_PTR(ret);
 	return new_smmu;
+
+err_remove:
+	arm_smmu_impl_remove(new_smmu);
+	return ERR_PTR(ret);
 }
 
 static int arm_smmu_device_probe(struct platform_device *pdev)
-- 
2.43.0


