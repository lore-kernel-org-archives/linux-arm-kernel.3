Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34DD6C44508
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 01:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7LQSE4ObXe+eLQz9jmN5zD0xfrSVtiH9fs/JAkIQWgs=; b=HS9QqbF2EsTUhS9cjekGoMD6pO
	wfi/zf3u1gn0f7ZWIxjxtlHEDpp/DZAimRXUJoF1eopXCEcmZNajGOnXo23kaerfhZ8HG8Gbdy/5Q
	0mDOIhaYJ4UGihOGtUe78cNUmBXvcIPJ4sP5u83/0imsY6zw7rQo7gjAfnZ//2S9PYUbsCUXGDfkN
	t5fk+WTqnYm5JX3MDXUwPZx3UK+qBvANFaWrpYo8UAAosaKjztnTAD0j2jLLnojq5g0GUJxIZd9ZM
	itNwOCn+FtVgiNtRYet3v3GpraPXPKgi0qKYIPysfKUFxbBjpZfeHDZV0ccV72c6GhpTTF2IePCYR
	/vlTC5NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vijRn-00000006FwD-34D1;
	Thu, 22 Jan 2026 01:25:19 +0000
Received: from mail-southcentralusazon11013012.outbound.protection.outlook.com ([40.93.196.12] helo=SA9PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vijRY-00000006Fkr-1w0z
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 01:25:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nrwj5QxPCeCSehO7vQJnCd4Pbq5+sPzG+EpL5IhqdvrjSKVJQILIfoyJEtvP49x17xaIp7wwoVaAyTkcQh1nswqVihdBEPCgwwB1QHNBNKB3z5B0QNzkbmjJe1hXtp8NbpaOqBYNQimb3dVRSexhVTORxirXyUeaJ61pC1TO37MbqXzKAO6U+E04LaayhN24qJL2H+pAV/gArS8/etkSoMv/R9XQxlLg1yMqU875ag/+WCgmhB1GauzyW9DCIlct8CyZhVLkxRTW/GYxGgdvBVWL/J474UnBMWFKjqlV3GJ4dls1FS+3ZsU6DUEKQBDsftl3Jzcz0lTPkyfuKcEsBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7LQSE4ObXe+eLQz9jmN5zD0xfrSVtiH9fs/JAkIQWgs=;
 b=MWZAiK0OaaGVWIJ/ziTn6Z/SvKH15fexpcuR31yn00AyFkaNK1DBDxzya191kdu31u4O95KNCd9c1LeVlsYVP7Cnbga3sPCSZq2C9NAnZQu5y1Byf3Y6NWWB6wKLIH3y5H0tX9XsN98w2eREXscDPX1UImHT/5hEXAkGrWpmNKvJ2nG+4GkouaoZLal3whYq2OfkV6F+AnPUsA6gxe5TrSq+CBS7XB75JmeqpdA7SbyfJJyvEhtFYefBwU1REAgx1PzNcxQmT4ckkLc4yrLPD7iM8a+91s8a6hLQ8lui7c8WKRXQuKBPxo1IqktmWyb6+ozfBeJyGD6agxuuMWSIbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7LQSE4ObXe+eLQz9jmN5zD0xfrSVtiH9fs/JAkIQWgs=;
 b=oZO577M+Dvv3d34iioR/DYSWG8TMyjFwzZBdscLYLNJh7M0Z+7aiS1UhalHuqV1PlXtb8n3r7fLE20/JD/LSalFzkfYxWMW703tIKknrUVFluCrYSq6UnDUr3whklflSMcRxOzpj/Oo+JT/CqbbyyzY7Q3DwUqJJlzigkLZMQTgB4ODn1V5G1k3UtC2hVQhe8p6wzJPOVV/xu9fI3Xf5z/TUhgn65EjMcSpwb/yRw68fQQVvPfaMJzOz6Jqx7AvikElsvJJ2A8f2138WQOR5b90Dpj6OBU/p0D+NrKw13xTYhuNQaq4X4kjwSg7fDqbm8OvnKh//VTTX1YexTn+GAA==
Received: from SN7PR04CA0116.namprd04.prod.outlook.com (2603:10b6:806:122::31)
 by CH1PPF711010B62.namprd12.prod.outlook.com (2603:10b6:61f:fc00::614) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Thu, 22 Jan
 2026 01:24:53 +0000
Received: from SA2PEPF000015C9.namprd03.prod.outlook.com
 (2603:10b6:806:122:cafe::4b) by SN7PR04CA0116.outlook.office365.com
 (2603:10b6:806:122::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.9 via Frontend Transport; Thu,
 22 Jan 2026 01:24:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 SA2PEPF000015C9.mail.protection.outlook.com (10.167.241.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Thu, 22 Jan 2026 01:24:53 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 21 Jan
 2026 17:24:44 -0800
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Wed, 21 Jan 2026 17:24:44 -0800
Received: from Asurada-Nvidia.nvidia.com (10.127.8.12) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Wed, 21 Jan 2026 17:24:43 -0800
From: Nicolin Chen <nicolinc@nvidia.com>
To: <will@kernel.org>, <robin.murphy@arm.com>, <jgg@nvidia.com>
CC: <joro@8bytes.org>, <jpb@kernel.org>, <praan@google.com>,
	<miko.lenczewski@arm.com>, <linux-arm-kernel@lists.infradead.org>,
	<iommu@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	<patches@lists.linux.dev>
Subject: [PATCH v2 08/10] iommu/arm-smmu-v3: Introduce INV_TYPE_S2_VMID_VSMMU
Date: Wed, 21 Jan 2026 17:24:26 -0800
Message-ID: <58bda77b3965ca6d8871ca242f01bb50d2baf75b.1769044718.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1769044718.git.nicolinc@nvidia.com>
References: <cover.1769044718.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015C9:EE_|CH1PPF711010B62:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a2bf0d1-3f62-4077-304f-08de59550b9e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|36860700013|82310400026|1800799024|3613699012;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?j5lr7rnWNIZjKxyAtx1DzeeVr9MUTaPOGJR3y3cVpoQtnuh+ztGRDBkFl4z8?=
 =?us-ascii?Q?4U2yToQpfUdD13naTsB0IeutFyO1QGmjkv3mS0GACREWrxlJ1wu2iJxUQszh?=
 =?us-ascii?Q?338S8RDoWKSFwls7LKlW69yVSGTrUtKFZPHiT/JZvFuD2TtpYlp+B4iQoWmQ?=
 =?us-ascii?Q?3DcJIfkQJRiwRAM3zpLALZ+gr50E5bIxbp/a1+Yss8+DL/ZV9NBxTRUls+f7?=
 =?us-ascii?Q?D2cYDTf+uWCG42Yw1r82uhOclTedML/FY+Bo109aDJp5TvNbf+uPxW/Wk+s9?=
 =?us-ascii?Q?ZHjXi21aI1aqeFpZADRHQ5CGb7a1fYfhkO8cb3VbGQRtkNIzCfv15/FJ7oSn?=
 =?us-ascii?Q?hJ40b1J6lTMsfHRXdnOpHMmvD0VvPEF+haI9bBzHw8NuMR6WPe9zB8V2g0XK?=
 =?us-ascii?Q?Gpuc84TBAS3zEU2npccs/DekHTcHUGxIwqQZFZr3iT+wNrbRfjSjkhbD1zPr?=
 =?us-ascii?Q?0y0ABh9zmXV+Yja1UntJk/h1kyZ6+z/1zL2HVz4o2ycUXq6sXHljbduckX59?=
 =?us-ascii?Q?c/qeLf0VrVnd18loK4RGaEFB1MJhANvjqNyl6If7ACLRFlOl4uY7QwUnOdhz?=
 =?us-ascii?Q?UMPJTB+M+vcEGzbptOAsqm7owoeArs/FTGRrOCKfUCpjTI/JlwL50HtaLf3W?=
 =?us-ascii?Q?pC5WAlBUj4HL+/dE1vD+T8Rt+iNwk+ACIhPBNXH5gcrya4EoQVgVwP8EIcOZ?=
 =?us-ascii?Q?p5p2sFbo2QtVd0ZMq1U5xG7PPwvEGsNpmRRQrwgtIV/pMzYe4OSVxGWJYH20?=
 =?us-ascii?Q?oW3crsKHWcA/WK+6Y6GboVSIwUl+bH+wSiVlrW1aRXIRZnVFNm+anxTomPJ6?=
 =?us-ascii?Q?6GewFWrBtR052Ri3Kx24sovAYEyXhhp816sH89Oj3IAVXelKyfV5gzm0coQQ?=
 =?us-ascii?Q?aA2rFigUpCr7lql0qIbRFZE9MjZbqluMbuIIL7+SSO1A0oRBVfj0TEwkf+5T?=
 =?us-ascii?Q?uIWmO7W2Lwm034aNhx1rA95pr6UpbuWzCjJ1nb4kC7KEyj8hPupnfbG787LY?=
 =?us-ascii?Q?6cpAousvLzn1+SGrJ+AAMZfNQwBKHYCPViZ/m0vEnwMgER+F2SPJHEfsWRU4?=
 =?us-ascii?Q?4TRnEjtAJVzSspR/InxaD0uNvGMweu1k3inGYzJDJuctpyIbYMwSxDLJnbGi?=
 =?us-ascii?Q?bbfUsCClYduqLrBtVQXvYSP+b5YfIf49XC47UzT8SCtkDgCAkRd5vdBdcQdr?=
 =?us-ascii?Q?6grDRWrkRT316tThgY+7/+0l8SvdO3iNsdaINdHa0kHy/Iw0aU6nBHTIG9JT?=
 =?us-ascii?Q?wYnxMR16eO0+IS8ArZxc4W4yhkUbNGKRJiqd0JCreohHhtJOV600hirQPW8e?=
 =?us-ascii?Q?uzTxVA1KBqjHbAtMqquc6nROdQJRYu9Qxp8EJuCJPeFz9yIXDQ9bViJI2bbF?=
 =?us-ascii?Q?FmIP+q1LWPzMd7Am0rOKv14DSKi0fdaQHaoB3lecVpsJAqf/6e8OAW1RMBL3?=
 =?us-ascii?Q?6oCddhymuzWV1GJ/G+3E6bAr5slR8u/ZOEy6r+RHG7E//xSm4hRsQVwjVecU?=
 =?us-ascii?Q?HFewIdYjE9+4e3wPesI+FIT5XxyVogCMX9UQXJtV4Ey8+UNAtvIHWNxaUPSC?=
 =?us-ascii?Q?JcbaW8SLGGWy7aomVKc4ioiE8NLpfU3mi6rdwDAOCM57/xtYenJMFjAWRf5F?=
 =?us-ascii?Q?J1bI0qcdY12CGDfCtxd4Tr+C99yOnC1F6QM6aqAFlqlEqegWogR/jVF1pzbH?=
 =?us-ascii?Q?oStApn9uWaDyEzQ7RUjG3hdc2x0=3D?=
X-Forefront-Antispam-Report: CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(7416014)(36860700013)(82310400026)(1800799024)(3613699012);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 01:24:53.3902
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a2bf0d1-3f62-4077-304f-08de59550b9e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF000015C9.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPF711010B62
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_172504_503703_D1BFE6F2 
X-CRM114-Status: GOOD (  17.36  )
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

A VMID held by a vSMMU is required to setup hardware (e.g. tegra241-cmdqv)
during its initialization. So, it should be allocated in the ->viommu_init
callback. This makes the VMID lifecycle unique than a VMID allocated for a
naked S2 attachment.

Introduce an INV_TYPE_S2_VMID_VSMMU to accommodate this case.

Note that a second device attaching to a nested domain associated with the
same vSMMU instance will have an INV_TYPE_S2_VMID_VSMMU and reuse the VMID
held by the vSMMU. Devices attaching directly to the nesting parent domain
will have an INV_TYPE_S2_VMID and shouldn't resue the VMID from the vSMMU.

Suggested-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h |  1 +
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 18 +++++++++++++++---
 2 files changed, 16 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
index 386ac75879c0..8365660282d5 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
@@ -656,6 +656,7 @@ struct arm_smmu_cmdq_batch {
 enum arm_smmu_inv_type {
 	INV_TYPE_S1_ASID,
 	INV_TYPE_S2_VMID,
+	INV_TYPE_S2_VMID_VSMMU,
 	INV_TYPE_S2_VMID_S1_CLEAR,
 	INV_TYPE_ATS,
 	INV_TYPE_ATS_FULL,
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 8323f74c8923..6d3da3f82ec8 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -1904,7 +1904,8 @@ void arm_smmu_make_s2_domain_ste(struct arm_smmu_ste *target,
 	u64 vtcr_val;
 	struct arm_smmu_device *smmu = master->smmu;
 
-	WARN_ON(tag->type != INV_TYPE_S2_VMID);
+	WARN_ON(tag->type != INV_TYPE_S2_VMID &&
+		tag->type != INV_TYPE_S2_VMID_VSMMU);
 
 	memset(target, 0, sizeof(*target));
 	target->data[0] = cpu_to_le64(
@@ -2592,6 +2593,7 @@ static void __arm_smmu_domain_inv_range(struct arm_smmu_invs *invs,
 						   granule);
 			break;
 		case INV_TYPE_S2_VMID:
+		case INV_TYPE_S2_VMID_VSMMU:
 			cmd.tlbi.vmid = cur->id;
 			cmd.tlbi.leaf = leaf;
 			arm_smmu_inv_to_cmdq_batch(cur, &cmds, &cmd, iova, size,
@@ -3149,7 +3151,10 @@ int arm_smmu_domain_get_iotlb_tag(struct arm_smmu_domain *smmu_domain,
 		tag->type = INV_TYPE_S1_ASID;
 		break;
 	case ARM_SMMU_DOMAIN_S2:
-		tag->type = INV_TYPE_S2_VMID;
+		if (vsmmu)
+			tag->type = INV_TYPE_S2_VMID_VSMMU;
+		else
+			tag->type = INV_TYPE_S2_VMID;
 		break;
 	default:
 		return -EINVAL;
@@ -3163,6 +3168,12 @@ int arm_smmu_domain_get_iotlb_tag(struct arm_smmu_domain *smmu_domain,
 		return ret;
 
 	/* Allocate a new IOTLB cache tag (users counter == 0) */
+	if (tag->type == INV_TYPE_S2_VMID_VSMMU) {
+		/* Use the pre-allocated VMID from vSMMU */
+		tag->id = vsmmu->vmid;
+		return 0;
+	}
+
 	lockdep_assert_held(&arm_smmu_asid_lock);
 
 	if (tag->type == INV_TYPE_S1_ASID) {
@@ -3233,6 +3244,7 @@ arm_smmu_master_build_inv(struct arm_smmu_master *master,
 		}
 		break;
 	case INV_TYPE_S2_VMID:
+	case INV_TYPE_S2_VMID_VSMMU:
 		cur->size_opcode = CMDQ_OP_TLBI_S2_IPA;
 		cur->nsize_opcode = CMDQ_OP_TLBI_S12_VMALL;
 		break;
@@ -3280,7 +3292,7 @@ arm_smmu_master_build_invs(struct arm_smmu_master *master, bool ats_enabled,
 		return NULL;
 
 	/* All the nested S1 ASIDs have to be flushed when S2 parent changes */
-	if (nesting) {
+	if (tag->type == INV_TYPE_S2_VMID_VSMMU) {
 		if (!arm_smmu_master_build_inv(master,
 					       INV_TYPE_S2_VMID_S1_CLEAR,
 					       tag->id, IOMMU_NO_PASID, 0))
-- 
2.43.0


