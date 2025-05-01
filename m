Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29913C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 May 2025 23:42:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bYsN7MqH2yjwP7EYvHCKlM+UIZcLOOvjFYkTPTe9yPA=; b=1OhGzbB5a3j7l5OIW58KSPOglw
	5AXdhlM2PFbTinCw8tC5dVsGpev+RfnclJr/yDUCwR42z6DJPCqZWuWd1ii9ZhjFx5Fy6Izn47ull
	3t4krCIoziW+xB3BcOyTpgJPWheFDzdJdISKRe3/ymX2F4mk9wAGQS+QRWI5xr0ur9zdRZAP2xnYT
	uOj/N1gt7ch7Q5ded89r+YuFMnwGnocPDm3w5XwtTodIvvKkwL/ggLPrFKSk/QFHUTaj1XGZP4zh5
	5zkRr1pC2tcteI46OX4WteV2hnVZ9MwE9LFrvUcf/wmLaBX15FRuvGlhKjdMoJAAUbygAN86AuHOY
	WkzdebzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAdXS-00000000IH7-1GRP;
	Thu, 01 May 2025 23:41:58 +0000
Received: from mail-bn8nam12on20629.outbound.protection.outlook.com ([2a01:111:f403:2418::629] helo=NAM12-BN8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAcuo-00000000A1Y-3uhO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 May 2025 23:02:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bqnKX39v92b0S6zxm6bma23lo7NH8E4lpNyzfG4O2wqoS5+SqXchNKuZdsKZevXOn0Oto+kFk1OkCzIYniYqF+h5YUmSZ9X8yKBzplpy89iq5YkU1o0PtDS+OKEsV5X+z4wIB87ztAVmqyvljmMqMuKGeUXhipNt1fOvgzHLLRbj+wWLRMcY9sfn935ZctOQ/BzugW/LKIYAVIuV5++RW9Dgx/KQYr52QNrEhcbREZ19QRyP53h8gbFIsX/hz/96z6S5lcLCSG8cqPv50FVjtrsLYafXIfncVNdwLgw604wv+bkGS8wnbpf0/znz5zia3LTVfLOE6JijSwtz3I4ynA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bYsN7MqH2yjwP7EYvHCKlM+UIZcLOOvjFYkTPTe9yPA=;
 b=PggCqMHCD7ltCb84QTt+aB63me7UZD+Y+SAK1tIMaQiXSYsVXMwQXoyzM2SA2dCr95ReZn1+ZdAyLelwGjWeKE1t6Ciez3CXvIRWQ9YtoSMekm03dC1Z3+nM9/NyHv6haCQe/mpjUGtduG1XJDmiBd5WG32kCzymMvNJ1622S9Jm0T1+t+ILgmQpsSH6j6D3uW3ZykuS2PI3KvQq7AQID+mbhyI/B7Za1M1xTs7GHjksV1Ykuz9iDQUr9tazN8es49mmB5T51cg/e9ahz2Hs9AZ54otBq04ZYTaJwO+9UfWItslfbHc/p8AYaLQXLbELrIKSLTPoGmO0yPCvwvd8zA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bYsN7MqH2yjwP7EYvHCKlM+UIZcLOOvjFYkTPTe9yPA=;
 b=kTW+gPvGwjijb6v/QoB7hK7uWAD1JDd91ebtb7wf1L8/245G+T3JhiKvL7XwYizkLyiCtDu+R03wkBdvhKwtZkLupbBix61ktTZI7R/4dBig0D2oPc3JL3r6AdzNvUmAK9/PC8jF8MrcQu3SWwMRB0zc/MEEWc4qYfI6AcLn94k5W28w+n1qsx7XNTnDu8ZLJKLWyxt9DFwQM7qcywnQxJ8Iuf+wgRrIkDCYon2kQYvxbQMxOHzMAyjEAJUdu8oPG8gvI0DD2JddGPn3BDZvAqkw1gZ3cfjo7tyAhBaCMby4j+HroTZyV2Qo0FRIXX+MnhXzfeVtPhl0Ob1k97kM2g==
Received: from CH2PR07CA0018.namprd07.prod.outlook.com (2603:10b6:610:20::31)
 by MN0PR12MB5787.namprd12.prod.outlook.com (2603:10b6:208:376::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.20; Thu, 1 May
 2025 23:01:54 +0000
Received: from CH1PEPF0000A348.namprd04.prod.outlook.com
 (2603:10b6:610:20:cafe::78) by CH2PR07CA0018.outlook.office365.com
 (2603:10b6:610:20::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.42 via Frontend Transport; Thu,
 1 May 2025 23:01:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 CH1PEPF0000A348.mail.protection.outlook.com (10.167.244.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8699.20 via Frontend Transport; Thu, 1 May 2025 23:01:54 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 1 May 2025
 16:01:42 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 1 May 2025 16:01:42 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.14) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Thu, 1 May 2025 16:01:40 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: <jgg@nvidia.com>, <kevin.tian@intel.com>, <corbet@lwn.net>,
	<will@kernel.org>
CC: <bagasdotme@gmail.com>, <robin.murphy@arm.com>, <joro@8bytes.org>,
	<thierry.reding@gmail.com>, <vdumpa@nvidia.com>, <jonathanh@nvidia.com>,
	<shuah@kernel.org>, <jsnitsel@redhat.com>, <nathan@kernel.org>,
	<peterz@infradead.org>, <yi.l.liu@intel.com>, <mshavit@google.com>,
	<praan@google.com>, <zhangzekun11@huawei.com>, <iommu@lists.linux.dev>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-tegra@vger.kernel.org>,
	<linux-kselftest@vger.kernel.org>, <patches@lists.linux.dev>,
	<mochs@nvidia.com>, <alok.a.tiwari@oracle.com>, <vasant.hegde@amd.com>
Subject: [PATCH v3 03/23] iommufd/viommu: Allow driver-specific user data for a vIOMMU object
Date: Thu, 1 May 2025 16:01:09 -0700
Message-ID: <254637ea8929f57b9f89aa7aa1432671c5a554d4.1746139811.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1746139811.git.nicolinc@nvidia.com>
References: <cover.1746139811.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A348:EE_|MN0PR12MB5787:EE_
X-MS-Office365-Filtering-Correlation-Id: c1cdb203-47bd-444d-1d4b-08dd89042aac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|36860700013|82310400026|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?WeelL9xLwRAmymheDhFIsz/1er4rSnfolYpHLojR2trWpMp7XPJBik/IGQ7Q?=
 =?us-ascii?Q?AgD4fCyJEXqkiK9urNfHkQilAeybnLsxoD0H8DlmUKVQ0LVGH/A2rnPMwhm2?=
 =?us-ascii?Q?8+HAxz9ewmQsVUZtr1wnOPd/NORA0LZ06uIby1heYrC5p5i3Iywg+kPXPeuN?=
 =?us-ascii?Q?VUvfl6z1DLH7hC5VRGV8va6JW9cHBdO7wVztkZRP/Rm4QT5YZ4T+XKDtbHp4?=
 =?us-ascii?Q?uINhzRUU3ZJ9gAGVe552mg1ME9CuYFvWeSKreo7rsPm/AbzCxH2IvtQC7kl6?=
 =?us-ascii?Q?t+1Gubm/FwwEEYSNQNV7r0ZBs5Osxo8knP0c1sVzzA7MuFc0xyyaXcXtgEoV?=
 =?us-ascii?Q?JkIMm5BgU/poneRwUUm85f95YlPVzbR6ppI5zghDor3rTx5fhQoBdpwDC9mc?=
 =?us-ascii?Q?8pisZuTGRNoB449ON5SaB/nkH6yFIKyulZ4YQ/+iTSXDI2XqBwnHQ7iJITs6?=
 =?us-ascii?Q?FTJoWo2D+4Pljg2Iz7k2lNH3WIR1bgmVZzJiCkqIJsHYphOXIqFN1wQvcepK?=
 =?us-ascii?Q?kNp1dtw2VlWCINCMukCfyu3rX5p1FanzvaZq659OjaJdK4/l/uVMzNWo24/H?=
 =?us-ascii?Q?7grzzEEmSfh24TOiSOYYek59v7+fSiM18UEDglsU+YhQwMu1cY5yKDOiLpLT?=
 =?us-ascii?Q?5D/f0eUTUt5w88n1iZ6C3BVtnBXhL8bWpkU2oWDIKnRRTcC+p1ZPE9p/V5Jb?=
 =?us-ascii?Q?40App8rYGVZgqDN1RxPlZrJUG37W2spX9xU8gcuMfDZbS6cBsLYznEUwsCzM?=
 =?us-ascii?Q?4yg9hLeni77YmyI/Ap6hrPSeP0rR663HvyWU6u/rswmTuzQPIiG2fkyqiNSt?=
 =?us-ascii?Q?zt7/kFrlduoFb4Pt3mZ/ofQtt8YoTnPsKql3ipO6w3BEwCsyyUgM19MJhhmk?=
 =?us-ascii?Q?0M1TTJ1rlinV07ARlNTIc8dzSUmdZ+ul2/G6/ytrWnmCYjOLEEDYGyi5POhQ?=
 =?us-ascii?Q?6ohTTAYRZkELwdrJb58C3keIMqajPIgV8Dp7llH0149M5zwtgwIY+X2Zl4Eq?=
 =?us-ascii?Q?ty3jT4QSH8hSWmA/haXwordPeaPCIntlbQ7QjsKZyUCWkgB/MfqS6uwJ2ENA?=
 =?us-ascii?Q?kAebG639SgbrlqGfC6diPt1bbWoPG5JZ7MgAJihBCtO924wN3Dmu1NHsIHp+?=
 =?us-ascii?Q?L3xslHVB/L3pqiMR8Rf/TdU8vwheXS43UjyJPyGAB5HZkK84qXFWsrNky0OP?=
 =?us-ascii?Q?hXNBFO9tEvei8Uj6ybPDK6ZxR8OVA+lfoxMrKY+4JiMuAoBTB2DuVyMuUjXh?=
 =?us-ascii?Q?JOuLpRwRQRzR9c59QTbVJivcW1rM0+NJEoQgKZEIm0ikA+4Mn8afeL+P3ym8?=
 =?us-ascii?Q?yBatgAG3vLpRznCp80L/sDCnncleqGMrajRh+aAndyG2eIqBq5H8UuCTaakP?=
 =?us-ascii?Q?kX9oxu5PM4TzE14RMKKmm3tSU1hxqwkSNCN2huoFAdpS4ghdYwv37QviVMkj?=
 =?us-ascii?Q?LCrU8FAomWTYr4X3x8rlTN2BfVgZsQJcBAySaEr4lHDo6U0aCybtHBOZZf3v?=
 =?us-ascii?Q?BAPh3SjCKz9Gf2vXcWT3YDoxiWVrnR4xmRIp?=
X-Forefront-Antispam-Report: CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(7416014)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2025 23:01:54.3922
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c1cdb203-47bd-444d-1d4b-08dd89042aac
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000A348.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5787
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250501_160202_969716_421CC3D5 
X-CRM114-Status: GOOD (  13.35  )
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

The new type of vIOMMU for tegra241-cmdqv driver needs a driver-specific
user data. So, add data_len/uptr to the iommu_viommu_alloc uAPI and pass
it in via the viommu_alloc iommu op.

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
Acked-by: Pranjal Shrivastava <praan@google.com>
Acked-by: Alok Tiwari <alok.a.tiwari@oracle.com>
Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 include/uapi/linux/iommufd.h   | 6 ++++++
 drivers/iommu/iommufd/viommu.c | 8 +++++++-
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/include/uapi/linux/iommufd.h b/include/uapi/linux/iommufd.h
index f29b6c44655e..cc90299a08d9 100644
--- a/include/uapi/linux/iommufd.h
+++ b/include/uapi/linux/iommufd.h
@@ -965,6 +965,9 @@ enum iommu_viommu_type {
  * @dev_id: The device's physical IOMMU will be used to back the virtual IOMMU
  * @hwpt_id: ID of a nesting parent HWPT to associate to
  * @out_viommu_id: Output virtual IOMMU ID for the allocated object
+ * @data_len: Length of the type specific data
+ * @__reserved: Must be 0
+ * @data_uptr: User pointer to an array of driver-specific virtual IOMMU data
  *
  * Allocate a virtual IOMMU object, representing the underlying physical IOMMU's
  * virtualization support that is a security-isolated slice of the real IOMMU HW
@@ -985,6 +988,9 @@ struct iommu_viommu_alloc {
 	__u32 dev_id;
 	__u32 hwpt_id;
 	__u32 out_viommu_id;
+	__u32 data_len;
+	__u32 __reserved;
+	__aligned_u64 data_uptr;
 };
 #define IOMMU_VIOMMU_ALLOC _IO(IOMMUFD_TYPE, IOMMUFD_CMD_VIOMMU_ALLOC)
 
diff --git a/drivers/iommu/iommufd/viommu.c b/drivers/iommu/iommufd/viommu.c
index fffa57063c60..a65153458a26 100644
--- a/drivers/iommu/iommufd/viommu.c
+++ b/drivers/iommu/iommufd/viommu.c
@@ -17,6 +17,11 @@ void iommufd_viommu_destroy(struct iommufd_object *obj)
 int iommufd_viommu_alloc_ioctl(struct iommufd_ucmd *ucmd)
 {
 	struct iommu_viommu_alloc *cmd = ucmd->cmd;
+	const struct iommu_user_data user_data = {
+		.type = cmd->type,
+		.uptr = u64_to_user_ptr(cmd->data_uptr),
+		.len = cmd->data_len,
+	};
 	struct iommufd_hwpt_paging *hwpt_paging;
 	struct iommufd_viommu *viommu;
 	struct iommufd_device *idev;
@@ -48,7 +53,8 @@ int iommufd_viommu_alloc_ioctl(struct iommufd_ucmd *ucmd)
 	}
 
 	viommu = ops->viommu_alloc(idev->dev, hwpt_paging->common.domain,
-				   ucmd->ictx, cmd->type, NULL);
+				   ucmd->ictx, cmd->type,
+				   user_data.len ? &user_data : NULL);
 	if (IS_ERR(viommu)) {
 		rc = PTR_ERR(viommu);
 		goto out_put_hwpt;
-- 
2.43.0


