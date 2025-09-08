Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CA6ACA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 06:53:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8qqoeVnRECMfD1Pp4tZ2Fwc6QXLvQlgWCLGshn4ZE9I=; b=Gapvd8C8w+Jy1A7avmH2O7C/3u
	SU63zWMNIgqbYK9pudg0WbmzYA5b8lEcsXnrtxtVQQtdeFo2STYjTrDpqdcwUsLNIeEi4BDqHxyJJ
	tqNDyH2DfTG6nza/XSgF0CYFi3C3xPLJCwzkIpxnYFKbcLb4SsoRlkg3bQIurBIt7fChXK7Qz0RDz
	HAKY1y4H4qaWiZlyMLdGhOW0yuf95mqF63MCpMDBgZ2Kr8jeYLqrEi6MHet1Vb7ybqDGN4g9yjLUj
	GItcoXXV3vcXp5F1rZMwOpnNf8g8/j7qbwPkiy/1itduYMZi+BoQm9RgdT4zBaJvP6GYN55zeYAHG
	/lCrUgYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvsDq-00000004rwI-3mAz;
	Tue, 09 Sep 2025 06:52:58 +0000
Received: from mail-dm6nam11on20616.outbound.protection.outlook.com ([2a01:111:f403:2415::616] helo=NAM11-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvlIM-00000002xTz-1Irs
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 23:29:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yE5iTYUpUahyl7fL/pg3Hp6Yy/2GMp4lJxem1nGJKMwRmMbJP/vZ/QjVy3Y3oVE9ozInYccdowSwfF76qxpzfz4cN9IxGlmv2rP/bV51digOoWnXdkgdzpGUsmiIQuIOQyfBDqEI5ONzDr3eVxf2eU2d0efZf6TtVQx7kiga+3vKYb9ieDSofy3ZXBXhKyuAD3S6lLU14Kc/1TrS+7EueKCECC12JYSgXWVLJBen9RN3x+am198wIusma9fwj+xydVaUmVWGr1EmGihqfanmtmMmvKD6VyuLAQGXL9+wtgo+ootYT+CKXRHRCNNSspTUN+Tp52YFmRP8dte9fWbaIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8qqoeVnRECMfD1Pp4tZ2Fwc6QXLvQlgWCLGshn4ZE9I=;
 b=U3CfmWDVv1gHVd2u1mpkjFN6EG0avRV/MbzJaRmxwbBSS6gyGiadloptEa8cLxkeUIqpW9EnV7J6hmQJQe7BnNg52xjToCO9nmTpfJopJo5/2vC07xciQvtvKf1PaIZX19k5O3MjUxoKfskJZKDJzG5TH0GKth7zBkvO7MrkFZD4V2Ny30mPCMA/hWXi6aMqC9L7K5DATIAh3kUUWctHsyGDhm0OOOIA3akBau3LkuJtTAkjYnCwXMARV5XKkmfpUtE7nnAZm1z2vYvu+nR6fpH9WPVm5760mtrnEKaQ8VWA4NG83RH9neCoO1Sz+hLxGavGsJWX2WwnGDyH2imGLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8qqoeVnRECMfD1Pp4tZ2Fwc6QXLvQlgWCLGshn4ZE9I=;
 b=XaysIz9qsKJGFX6AnYMkZzm3zCN+XlABR1y7qBaPIqAicp+VGnLC1bTAu4zw7sQhqJptAg/7DvJo5QVGATw/+kNanvMnRFErtOxlPmpbPyB4xISsNAaFXDQSi49LgPs6dX9T6I/I+z3idjj1HjC7H22JalDavFZ7lHwLJnBPS8oWNvVfUT0+oUNcZgdBs7JWns+kqJPef790Qr4HeYRuX2AcPom1VMNpDEVK1LVDTIduP+RlBYBTdnR6re/nB0ZzwS69NiyZ5F8oB+Ye8E+OBCECjynpbfITC3X8juMHt1j/gpMQwbeHIOFW0d+UU8Fk0ipia7/hLYWV9L9Q6ZLWoQ==
Received: from BYAPR05CA0090.namprd05.prod.outlook.com (2603:10b6:a03:e0::31)
 by MN2PR12MB4374.namprd12.prod.outlook.com (2603:10b6:208:266::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.19; Mon, 8 Sep
 2025 23:28:55 +0000
Received: from CY4PEPF0000FCC1.namprd03.prod.outlook.com
 (2603:10b6:a03:e0:cafe::19) by BYAPR05CA0090.outlook.office365.com
 (2603:10b6:a03:e0::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.13 via Frontend Transport; Mon,
 8 Sep 2025 23:28:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 CY4PEPF0000FCC1.mail.protection.outlook.com (10.167.242.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9115.13 via Frontend Transport; Mon, 8 Sep 2025 23:28:54 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Mon, 8 Sep
 2025 16:28:40 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 8 Sep 2025 16:28:40 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Mon, 8 Sep 2025 16:28:39 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: <jgg@nvidia.com>, <will@kernel.org>, <robin.murphy@arm.com>
CC: <joro@8bytes.org>, <jean-philippe@linaro.org>, <miko.lenczewski@arm.com>,
	<balbirs@nvidia.com>, <peterz@infradead.org>, <smostafa@google.com>,
	<kevin.tian@intel.com>, <praan@google.com>,
	<linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <patches@lists.linux.dev>
Subject: [PATCH rfcv2 2/8] iommu/arm-smmu-v3: Explicitly set smmu_domain->stage for SVA
Date: Mon, 8 Sep 2025 16:26:56 -0700
Message-ID: <390fe709e756a54168fcd43e1323998456f2d8d5.1757373449.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1757373449.git.nicolinc@nvidia.com>
References: <cover.1757373449.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC1:EE_|MN2PR12MB4374:EE_
X-MS-Office365-Filtering-Correlation-Id: e8924a8f-4e61-42a3-0e62-08ddef2f7a41
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|82310400026|7416014|36860700013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?oows/SxeqP2RXJ+ozrBU8BqovvJEIkBQRaX05HpS3SLs43ytMKKACMZAEBn1?=
 =?us-ascii?Q?Kp1HqJ8eHtt75D0lAhmF3Tn5vqDq9P3wDqfzqR+w5eVB2IjG+HsOjwiBE7ES?=
 =?us-ascii?Q?gN+vl8qCI5o1Owpdq7i58AJTZUXznKpk+uOV/OAbRVGtycGlLNk/QWPAlxxe?=
 =?us-ascii?Q?syVijvULD9fkuqh7MeO1Orhqj8EOwa1+r5jSZnrHy9tZlh3H/xBOg/60ze6r?=
 =?us-ascii?Q?pqdnoA2OpSP63bcmhR95Sxu8vG3x+toN8rxjsrvZGdbC4YVerbb8dIlRgnss?=
 =?us-ascii?Q?6Hvf9qCJ4F+qoHBBoH4Vrvwlj6bTLugXd/dfz6PhLAmy8OZhTCkFGZFRONnN?=
 =?us-ascii?Q?WVY/DVLz+YggN7aNJa2XFFBpDNTZlRLUjo2C1cDTgiziTqPmXr7cKojmJmfD?=
 =?us-ascii?Q?0BruAzTcrr9MVZFPJFKzNjq5zQAXXlCsA0+0rL1sAZvIdbMMrsquQR05BhGz?=
 =?us-ascii?Q?IJeMsz+/Ye3IzH75XlFoVEmEtPHbMH/9Q7peDHn9wFbE1mtoVaVlHQcv+n95?=
 =?us-ascii?Q?xPtRhis/wl0DbV0dqCY6WEAuSs58pnhVw1HEql3sEzexnRfGYg93mcym4Hjw?=
 =?us-ascii?Q?IAS11KRJtOEy4waM0PehioLIjZMdF9bYalEtm+SyFU/aXcrnPGlrMHjAf+M5?=
 =?us-ascii?Q?6yc6tvcOBC4h0xOZv7kLlE/C0FdzHUqka1Sn7ze3VFSh7qEG1Z52w55wfDXY?=
 =?us-ascii?Q?BAcWNbjyT2cnB0XO6BVU5cbTsgAC2QKmTqnXNWrhpBhg1yNIYet2fv7TyOm2?=
 =?us-ascii?Q?aztgyuKIpoxPqWB27x5DfTfYphlWYh4EG0mM1VVoVN3sTokRgtbOWYaHrxxj?=
 =?us-ascii?Q?H51BaVIsXVz2BhJUEconWdxYQWe20kyQoKo2efSIizyt80tUTTMggfolvwAc?=
 =?us-ascii?Q?byh+xyp9fOaMjdug49hOCbcjTwmXqxrjZBLkFKMlzqHkF6OHPyJM1OjBawuX?=
 =?us-ascii?Q?dFFeX/YzuRkO3Ajul2zr7Y6ZYGRYZKxlQIwE0XzpjloyJtsut0nOZRYojCdS?=
 =?us-ascii?Q?xPnq3QGhs3CvWAzezIlJ5mJPKkG1nn2ePSreJQ8cBpsANPm1QQSFfXBecmOc?=
 =?us-ascii?Q?+WHOXavwaDYsAKGvBGrHF+aYuKxTdB/hk7fJtMWD3kaZyoTRyP5OkmhNtGxX?=
 =?us-ascii?Q?qegpRAs4vApTC0jhf7VC2Vbl1N8KAxYGf3Yv/mjqAF14bL7OVZTKQjw/oq1r?=
 =?us-ascii?Q?LRA0bv8ptgo117N/SaSlhpe+bu41vJ6K0ye9ssoHB7nUO5JO9cb8V2uiGUe1?=
 =?us-ascii?Q?IsX/tdBYJ2tBvz2POvWKMp6JngMubApIUb60V1eBoAoGYdAc04A0qwGWF7Xn?=
 =?us-ascii?Q?m3GIUeI6jnEud+l0yBKR5p8FXcd0ynThoNfUql9+NhHe0WpH4GVFyr6zyJde?=
 =?us-ascii?Q?7caQF7JZ0OJzFg+w54rsCWqUg1vSfI5NpPZKOVnWOxpxDLV5nqUwYvAZGGRF?=
 =?us-ascii?Q?za16fWnYGv0ygHPcNWBCNFAsSuFdtIZnu5ZX6k7dGO0++rCdi1y1ZhsMwzqr?=
 =?us-ascii?Q?DpI4kSfLXs/zKJEYStJz0vBywTHk0x0AQwIA?=
X-Forefront-Antispam-Report: CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(7416014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2025 23:28:54.9084
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e8924a8f-4e61-42a3-0e62-08ddef2f7a41
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000FCC1.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4374
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_162910_346126_CAF735C6 
X-CRM114-Status: GOOD (  10.66  )
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
index cccf8f52ee0d5..0016ec699acfe 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -3070,6 +3070,9 @@ static int arm_smmu_attach_dev(struct iommu_domain *domain, struct device *dev)
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


