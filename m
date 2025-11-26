Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4BDCD1036F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 01:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bg12Yw8tY3diF76Z9B9BKu6uy1ZeELmLDqKgcSNmnuU=; b=mH3D41omxUOSZNxzOB7dbZ3tnt
	M+SZhewQMiEwXo3gyx7SwQqip/vIC8ifH4q4VpFFO5Tb7Nnz8CDcksh8yzNY3arUwgw06UjOPC3lV
	m4+WW2ZRIZSsT15pnMRJDbG9QdtKHmsOytoVj1OZhAKbG6HbWHjPQdBtcz6fbcaK39I/d34dTVVVt
	v+6ae7deTUFTQnkfnQf5+2y8Fon39MTICbBPRl8xzNqoswJ5o229GVOQPPY1udFhc2rc0YiYppfJ6
	zfUMmzLyiq0AvNbls7GhowfwQ+GBPIIEvNzOq9JdB+Enkoh894WqTPhwHlPerpcXtY7+u1q5brnL3
	DzpOtKmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vO43l-0000000E9do-0MlM;
	Wed, 26 Nov 2025 01:11:05 +0000
Received: from mail-westus2azlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c005::5] helo=CO1PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vO43i-0000000E9d0-29QP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 01:11:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zcjt5Aje1lQld2sv/HQaXIpGAUE/zSsh8neShRPMB8t0iP5pGrrceBwZrlj7NKDFQyTlkjfd7nAU7Q0VwBs9guPFi08P96vPHQMlra9Syav97WsjqfXjGa1iYMHiYAtqMnXFo2kBftLbdSwUh0gtoOqr57OExJv2vd+kQYYSyOxRxDXoXfsGX2HkroINQQLLDV7+s22DFh0sA6uf8JAT13raxEVbCc76jIg+IIPdEHJ3rSHn6XCP3+iFZ25nY/4rFPoymQhI5UepcetHwKeYFm8Gt04ngX/Jq4DP+G1uzZTb7UAAF6N6JGuvQEdn4sgbpQBSoOn+1o2qvG3x12CcIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bg12Yw8tY3diF76Z9B9BKu6uy1ZeELmLDqKgcSNmnuU=;
 b=tQf6ACtJqQ4WKStcW+iq2E+Cfpbg8W/fg6utq9xmkUSKnpErTDR4Z92YfYsfpAmByvQ4xM1WpwuPvK86b4Kdjg/ZEW+zVY+NSpN/p2jl0pYEDJ3MoDXmv3geGz1hXpTkjUw/kof4axiAhpwhbhpLR1zOED3s/HB3VYQu6veWNHl89DdklZNU7cx9E+sQTlqdfz9uLcXDDw/DylrmPVXiDWWcxLLEZUUeoA5urnwCcMj37mSO/bbVOhcXfAvf0S9aMhu0eKbf0YZgF4P0qKYvkKeGv1/BLPE+af27w8y/M/3vcrNipB2UwgNxoqdHwesDe1IjrraYbSUjgd9VLafz6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bg12Yw8tY3diF76Z9B9BKu6uy1ZeELmLDqKgcSNmnuU=;
 b=uNWFm7ycfj8MoBsyc9yKBIDfadIKUyJp7xdBmtD1fawiPASwFx/Wp2dTkbqJ3/sYFb4RfKC9P5qivYBTLOiMLrKSGrPe7yAP8eiFWYkW9ubLl2/W0TC6VLhp/FnU6gw03rJQ4aHUNM6EAugQHhnSOnvKZQcjuZKns/gLhwW+niaUe6Xxzn+Rw9hvQyInPCCh7p/5C5KkV5MYO/oti+MOdxEKMCcD01/95Ua18WHlNcU8/RAm/7F7DH4UVxrmYR9/nvslJV/zMUydvHOQUUbSMtQ5QdvRDiH2lWMmPbzcN1aglbHL3kT679LRroKYJ0HgpjFBqsXQp/WU+fg7xXhLmw==
Received: from SA1P222CA0099.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:35e::13)
 by SJ0PR12MB8615.namprd12.prod.outlook.com (2603:10b6:a03:484::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.11; Wed, 26 Nov
 2025 01:10:55 +0000
Received: from SA2PEPF00003AE6.namprd02.prod.outlook.com
 (2603:10b6:806:35e:cafe::f7) by SA1P222CA0099.outlook.office365.com
 (2603:10b6:806:35e::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.12 via Frontend Transport; Wed,
 26 Nov 2025 01:10:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SA2PEPF00003AE6.mail.protection.outlook.com (10.167.248.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.7 via Frontend Transport; Wed, 26 Nov 2025 01:10:54 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 25 Nov
 2025 17:10:38 -0800
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 25 Nov
 2025 17:10:38 -0800
Received: from Asurada-Nvidia.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Tue, 25 Nov 2025 17:10:37 -0800
From: Nicolin Chen <nicolinc@nvidia.com>
To: <will@kernel.org>
CC: <jean-philippe@linaro.org>, <robin.murphy@arm.com>, <joro@8bytes.org>,
	<jgg@nvidia.com>, <balbirs@nvidia.com>, <miko.lenczewski@arm.com>,
	<peterz@infradead.org>, <kevin.tian@intel.com>, <praan@google.com>,
	<linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v6 1/7] iommu/arm-smmu-v3: Explicitly set smmu_domain->stage for SVA
Date: Tue, 25 Nov 2025 17:10:06 -0800
Message-ID: <479dc34a38e05ab3c88fc55703c4286a5233e7a0.1764119291.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1764119291.git.nicolinc@nvidia.com>
References: <cover.1764119291.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AE6:EE_|SJ0PR12MB8615:EE_
X-MS-Office365-Filtering-Correlation-Id: d786c05c-a5bb-4d8a-68e9-08de2c88a636
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|82310400026|7416014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?yhKi3cSxowA2VagDuNl4bvUNoW9MWFBXDATmLO5XK/SoPFblGouikWoecg1F?=
 =?us-ascii?Q?SCdfgT0KmCaYcUT/1s4HIMjTX5hevkQRP34PG+E+zoryzxaZDX+UzUt7Q/sE?=
 =?us-ascii?Q?WhNi12fEce4ZEcPhDv4462s09xzWb/ySENVXgJcik3Ic5WZyH/fDyiPHHc7e?=
 =?us-ascii?Q?Rks29Xm0Zihnfq9ZcEKGpd99xAOwjJp5c7t5n97LQB8Buu2VnSP0xNdVZVgI?=
 =?us-ascii?Q?vHS3vF+FTVrqGFS3E4umFf7G+J+CnTW2olJcGBDRpr7E/W7lx0xIv1sJYOdP?=
 =?us-ascii?Q?NCSUe6r2RbcPMtFBo84Kvhw2E/LtPqN8bPPeFSPz+8yzkXXJxjqe3TBOfIFj?=
 =?us-ascii?Q?8MrPyiXZqwmtK9lUG2uWqCUC5j4chVl0JLpm9QwYngUhYa3VG4ZMSf4QgrO2?=
 =?us-ascii?Q?/Txj901N8CM10NloHWXuZItVbq43SucUaFGf7tA7Nrl+NzQ86pR0p1zP1qkG?=
 =?us-ascii?Q?W0XXCOA6dWXS39NBfz7yNmwlG6yYDNVnT84uGtSCYTwNcAVGi2sQVR+h7emQ?=
 =?us-ascii?Q?vhH/Sej5MOTjSuDAeikv5VyGXQlvLdk+3pUWF1dH+lVvfOXYoxmAb5SQDu0Y?=
 =?us-ascii?Q?F8HpQsnxjKsTCm2NVDCadLo1lttHgiaQOa9Eeb16NjxIOHqxS/08bJISE8d3?=
 =?us-ascii?Q?1aLiB6D1EC6T9C2EJ7+GDp9IjCH+VAfNPR0ittZljk3GYMkKhyq7fxmOZ+gJ?=
 =?us-ascii?Q?WxVJ8JGWTXCkbRx8qEUy7pxXILwkuUGdOw6o8RpxNwx2dajCvsfRemmOPGet?=
 =?us-ascii?Q?x8Rs1ylZsguwmEroRF/blQYtE8aJ8N1UenLco0TfhJSW4IoZpTVOwkqXR/CC?=
 =?us-ascii?Q?g/IwxDUIDblDphwmuKI+ycjKh3v55QemZkzuBjmRqDnUFRDJ4s5OPODTGqdj?=
 =?us-ascii?Q?Oxz0Gt6xdCP9Az68ekcpEkhYgzuQulqRsV2dVwhPdp5gYb7QclqtWctj4bdI?=
 =?us-ascii?Q?FRtFRPW6Cb0EqydLzGzWkmNGhhm0ruxArFbyrCApTaw19gt0SU/LQ08i38Mu?=
 =?us-ascii?Q?Usf5G0oalqp/QtL/oFB9aV7eCbB3Q/NpG8zVy3P9EbTuGAw2F7ZpScJZ8+Yv?=
 =?us-ascii?Q?F3MwTy8lJW3HZ3+5/oOLQ5P0C6gVBKAqUIWaggk9gbZARvKL2F1l6QggGb28?=
 =?us-ascii?Q?xXSrawTHQu0BNXLxvCae/UoOMQ7JCbgm4LYbRqPw+SHHduY1zKLYgiAIWr+B?=
 =?us-ascii?Q?zD5Hz1eX+Pm/fzfgdZrf0oMZd3GcDub4Bs2CtGW7n1a8scuB52t6gV+SJKPE?=
 =?us-ascii?Q?yS9s51Hh2jjPObFCApGfkpEwizX2fqehTgj3CHIDrAO/+Cyou2nMYztl6JKz?=
 =?us-ascii?Q?/LuxCqy+SHgRVLdBE7a781woMr+bPHV7ApXWmDSk+YEe4IwL79tN/WZ1yJ9H?=
 =?us-ascii?Q?ovb4ZSHpQqMmoWMQ5QLKF7sKnbWD8FQXHWE5MsnjkeZjbB6eoB+386HgyyAb?=
 =?us-ascii?Q?V8FeGrD9USa0N7C3K8Zzo00EiKMHw/Rid5LHO2146HzHqgfiYZM4MxO4IRBr?=
 =?us-ascii?Q?IoxWnl+qEFtnwNmhqVDbkvyapbpDAFUAM4TILa7h3eZGOL1dw1EKGbeMuh+D?=
 =?us-ascii?Q?G7woHKB5fAg2EfoLe74=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(82310400026)(7416014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 01:10:54.7488
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d786c05c-a5bb-4d8a-68e9-08de2c88a636
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00003AE6.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB8615
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251125_171102_551788_402CBD79 
X-CRM114-Status: GOOD (  10.94  )
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
index ae23aacc3840..5c0b38595d20 100644
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
index 59a480974d80..6097f1f540d8 100644
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
index d16d35c78c06..9d9f24a08062 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -3065,6 +3065,9 @@ static int arm_smmu_attach_dev(struct iommu_domain *domain, struct device *dev,
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


