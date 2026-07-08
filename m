Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7506AC43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 19:45:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jljs3sagk1VTXhPhgMdrFxfPA3jCnRW751d6bs78X/A=; b=Jmh6CU00cdDjSZW1gHTU7veqXo
	FdTLKEtzTf83VcV8Sglbt9dvzav2jSATkIM2Swhb+yI/wa7SLNUbWfZ1tZRG/jPz5xXPDGy44wiVa
	hcuaXSkERjykEHQroIE19pFrcM4FE/BDu3PJJI/HjS7UNzftyaePx6SvrLlE6Fw/wKf/7RgiOZ+6P
	Rrnhwa1xvGiG/UJenRe/BA702XuBZYY/79kZr47TXRQ8iCQR1v5rFiapN+I1rmmsbNUEFyb7DtZfp
	rx1AdOqz3SDmeousMSir4A1N9/8+97/HPXIqn3H7n0e0Wsz+tJ4KSpt15njdbbBE56OFj5XrWuElI
	KalxCpKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whYCf-00000000HwE-0Tz9;
	Wed, 08 Jul 2026 19:45:05 +0000
Received: from mail-eastusazon11011004.outbound.protection.outlook.com ([52.101.52.4] helo=BL2PR02CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whYCc-00000000HuD-27oD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 19:45:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vSZGjje0A0YgU+NK9kCkc1N8k85LoiGagFDwgR5JjopoRwTRbpXNxnEKfgKlJ3WjaGHkph2YSG/A9zXegEBUEpR9p9ZAJOeEKnNjP8yUW6FSmQPzL0wLIDJrw3CQM7DyOtOniVNU4tFT/ogGf7bVbgC3jOlXksnU53tTkg1V3QBmfLVeL4yfKKuY9CvjgnNpEPv+AexJudjdArS8lW5evd68F40b08hPkzFUOwlLcl9mUo/jsIUie9C4tvDfDXkjomM2tPIIgbUo120Ddcd9qP/O1PgqsAK7YPolFqtGXh+bOTBI2IXwdLGhQYMIi9k/EXA1B8aBBKx8YEEdyXBfBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jljs3sagk1VTXhPhgMdrFxfPA3jCnRW751d6bs78X/A=;
 b=NRWL4wcoiI2IZGm90GuZd7fKBZxRgfQShRboVuOlpjSUrpCDO4S5tFSn4f+09OVsPtnzDUqtqVG8VuBs7nRzAsQdIiZdGhaJvCxsQheRuBrFLMIQuZ0KopcvJ9njaoq0g+ijnXZDxIgruSlS6diboXfMzdqH5pclhVlN1ZrCeRGHLh3daLQxqmAAcz6fat4HupKZIwBRu+5xNKvZurzX4vhmhLO9Xm154/79Z6gbpRoJ/nIEmFsxUupy2CKrBSyPGgpyeFMXDSudePcDWMWYGfImE2qAsUGaEB0OjQO49Q5b/LQNn3+67cM3J3ywglLtB1BUMt6mHG6W2kv3NoxzIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jljs3sagk1VTXhPhgMdrFxfPA3jCnRW751d6bs78X/A=;
 b=LjRGfpw8H1YSmbCWiG1iSFXGUXSBETOos0fyM5KZOev2ICqnWpcV/TSYGtcEtwvQdK3Ct1PH9pTTNFWtd7+d4bC5E2DeQi2fuPzG1DcpPY6ZmhdjOXKLqUqP0MChYFbNibBTDpeACgJlrKsKw6C81sMaVmpFaalRa0GtAF4wxD8aNfL/yOtgSD+KVAH46JNU9UlYzWySz2GHnlC6G0XkWj4a5PCJM4sh1n6fL6vxcXt41Hj9WaGI9p8g1Qaj7HUs33k7Q97jf7t2jd9VAltzAAQqO7uI5jgDPrzhtf3xSOzMuictplfgeRhpEZoJb6VtfH54Q51Jqpyh030IJkqp1w==
Received: from BY3PR03CA0005.namprd03.prod.outlook.com (2603:10b6:a03:39a::10)
 by IA1PR12MB8359.namprd12.prod.outlook.com (2603:10b6:208:3fc::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Wed, 8 Jul
 2026 19:44:50 +0000
Received: from SJ1PEPF00002314.namprd03.prod.outlook.com
 (2603:10b6:a03:39a:cafe::14) by BY3PR03CA0005.outlook.office365.com
 (2603:10b6:a03:39a::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.10 via Frontend Transport; Wed, 8
 Jul 2026 19:44:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 SJ1PEPF00002314.mail.protection.outlook.com (10.167.242.168) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Wed, 8 Jul 2026 19:44:50 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Wed, 8 Jul
 2026 12:44:41 -0700
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Wed, 8 Jul 2026 12:44:40 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.10) by mail.nvidia.com
 (10.126.190.181) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Wed, 8 Jul 2026 12:44:40 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Will Deacon <will@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>, "Kevin
 Tian" <kevin.tian@intel.com>, Lu Baolu <baolu.lu@linux.intel.com>
CC: Robin Murphy <robin.murphy@arm.com>, <joro@8bytes.org>, David Woodhouse
	<dwmw2@infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<iommu@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 4/5] iommu/arm-smmu-v3-iommufd: Convert cache invalidation to the core array loop
Date: Wed, 8 Jul 2026 12:44:19 -0700
Message-ID: <e21c0adeb86fcb82238b1f9d29f7ba7ae423ea47.1783539724.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1783539724.git.nicolinc@nvidia.com>
References: <cover.1783539724.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002314:EE_|IA1PR12MB8359:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e18d9dc-f85c-4688-ca81-08dedd295fb7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|82310400026|36860700016|376014|18002099003|22082099003|3023799007|5023799004|56012099006|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info: mB5YD6aRbmInq89AlyyRt2zotGA49lWk7oLy3xO1lkJC+I6miCAgW4FGlNXDQ33we2aGkW3O6qLxkU/0Kzr+np3Kjm+feVo27GBC+8ra+HJVJwCfpMEDR17PTIRdTrSznsiFmbMO3SRVwzB6O2iI0lf3J7Fu9DrjqRPP2THaOTJ10o/TpVjc6qdwtgaCI6ZMW/Z2K6Efld1cHnjprivI5+7p/PEGPeydSPPser8ADxHOKv+X0VEoad82s9eOSbYAp9+zQJvq3xAKPr/5EsF0ANi6FAxd8n1aRUau8GeoFKINt+qjB59lJkrjLXo43GT00mOrYzHnR6Thn9UHkRWCZ1ft81N5dVTwRVNdiCgmYe2cAIgZxRbBDNZmmcu5D5CjpkQSx+d5PZrQcAMkihyk1NaJ/TXNqY0/V0sFP8icXSK8hVV8Zvc8rQwj/ArIAS44JTcHiHL9Kbj5FtSmBscZCsu1Fyf1N3xrSWxH46KYjOMdlA0Ond/InVa2gZyKxUicqYiTa/6Fn0ChSziRvcPBuEhUD+Nwic3GoS5NR2a35O0h8o32bqqu9ndmTWUcDe9C6DXjyv1na9KbUxi64Kh1GDh+xtsnJ0XvMruxuahr+Dj/SD1VKeD+vzLiT17E4nmDSjkmVturBbjFYAAQwnWItfCjmDL6MDH63Vjj/MGrqUfMU6i4RtPQB6rLWgmIVIuzjkquXR6+l67sYIpKgcQ8Zg==
X-Forefront-Antispam-Report: CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(82310400026)(36860700016)(376014)(18002099003)(22082099003)(3023799007)(5023799004)(56012099006)(11063799006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: qbbm0O0pXllL156nXY71ggAX0yPTHFWucRTofLCDtlzXOzqgxW/rlEoWp/JdD039vYbn+HkISngmVqrwvMCI7kr/Eage8nbmIXlcWtF/qqHp6LQN/UVyLgzmRZgXsPyGmdAHElOj4Shf8Zo+HWd9FU8UZv4vue6xoVg4R5PjPwXH/4JfED6qbnfvEDVcW0RHgBL2LQJNHxo5JXTSsi9qxk8MYQHZvfFrDfJ5tzzT20AbM0e7n0dGscujhlOUYDSNuWa1MJSQgTlaP8UVGM5SQWSpNkd0PS4TPpmbixa4OZBeZ5bE4aKGQmtqJ370Aq+nP6AtObhHyqQZu7gPIcGvBqyuOlir3T4J8qKFurI2lqAdoN6Lubd3f+Am/B2EgkepapuBt9CsOpGXqFFDta010ZXmqEJKF6WHB9AwOfRKUnk0wkP2jkmlQpNTzP8v0g1r
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 19:44:50.2242
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e18d9dc-f85c-4688-ca81-08dedd295fb7
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00002314.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8359
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_124502_560406_EF95B435 
X-CRM114-Status: GOOD (  22.92  )
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
Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 .../arm/arm-smmu-v3/arm-smmu-v3-iommufd.c     | 68 +++++++++++--------
 1 file changed, 38 insertions(+), 30 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
index a5cfbc2499034..678ea842ba541 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
@@ -448,49 +448,57 @@ int arm_vsmmu_cache_invalidate(struct iommufd_viommu *viommu,
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
-		ret = arm_smmu_cmdq_issue_cmdlist(smmu, &smmu->cmdq, &last->cmd,
-						  cur - last, true);
-		if (ret) {
-			cur--;
-			goto out;
-		}
-		last = cur;
 	}
+
+	/* FIXME always uses the main cmdq rather than trying to group by type */
+	ret = arm_smmu_cmdq_issue_cmdlist(smmu, &smmu->cmdq, &cmds->cmd,
+					  batch.entry_num, true);
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


