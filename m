Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B84EEE77199
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 17:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sqWIeKVH4ZVvezMJBQc8VWW9UMvWwlEcM9KiCKB+PH4=; b=nlh/tmBdq3NvBJJy0AJXw4DQXw
	EHy1OZAI0cseD0rTFNhozArSnVlPX5VAnncIVFXphGdEELue839/QkM5I8vw35an6FnHJl9jhiupJ
	kpq61OpDMwqNn88mVuF8L5l1pQkgnFOhO0qrqnMdlqRQVNFAr7+IfkNGdSPo2O/aOb23bq5CaSs+H
	NKZVS6c0/uba9moYB5DIpej+zdj9M4B1v/OG0405BEmLaFSFLU0yP05lJKHbXyzlOaKN4eicsmp8A
	iXH5ZoZ5yB7mPVbJUaiHL279PF4AL1zB7Zqkk542RjJ+FHzu6l0/gua4mvgupoaccmr4/GfBOUBi6
	TIAQmMVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVDNU-00000005rNW-1Vkj;
	Tue, 07 Jan 2025 17:28:28 +0000
Received: from mail-bn8nam12on20601.outbound.protection.outlook.com ([2a01:111:f403:2418::601] helo=NAM12-BN8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVD6g-00000005mG7-3JN1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 17:11:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hprHhcNVe9zeC8hSlcS6NJKSSOCPZsmAEiAsYuq9Y1PIvrQZRdrys3t/c3JYC7jyshlWz5dqTcNEJcI0bmOmmjzIBU4bynHSh74Cfti/am/hqJuxQpru3dvvUWBzYLEt2e75WtCixoXEI8LX8oCpt2bb033Nu6C2KA0HZAulh1gxXI7gTbsZZU8ZsRx4GoDaEvPyBKfAfsS9Pd7NxDA4l3eGL96kLnoHVEEv1Itk8cl0TOnzOkWft/qt2Fj4rhCMTRU/1u7muizuM/cNjoGBJP8jBZJGUY1+l9RyzAYiRT3MpMh/uGiDDb++pOj2HsOTnredMRPtUjTDSSaCC8Wjbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sqWIeKVH4ZVvezMJBQc8VWW9UMvWwlEcM9KiCKB+PH4=;
 b=BS3NlSQv6PEYCab0fYBL+lUAvlXLjndWwmugHbXzgvlSDFNUFbIW8lFCrdStb32RiZ5fDQRaA4SAzqUF0nXPGpl0eFb3D7JN00NOqqPk7zRXFtzJWPSweFLuWToKXEL50pyG9Xl3ahMRkifXxjiQ8kd3snn7/pmhsVWapv0gwW1cR1rS2dX1/rhZc/wCL+y+8SUrvxC2T3LrRmNC6QHPwnQF4XXxGkuK7tMGWouHEG0GQ83TskdtfmwQD+A4DlyymCO45lpIKwUGoDjXEpzlwi2qHuIJ4KN/UcsOM+Zjnc7S4agpwVuyDhee8lI+t4vlteZt/2w8ZTnur3BuYCo/hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sqWIeKVH4ZVvezMJBQc8VWW9UMvWwlEcM9KiCKB+PH4=;
 b=Rui6VRosto4wV3MNOtOm50o32NGPsq+J8jFjmMEbHLF8W0Yk+3o+yNGDejNVwMb+j5YX8ibm1E7VNBZDc6FD+QpmiMtpukmGISMjQZuFD21Fu+SxhEyPnQfCG6RuHCND2vEYOabdnpNcJh8N8U4eOJwonAm+2gL4NpI78KddsdaJWms9n4yjCzwZjVL6kPQPO7qusZ+SEWbwvorGrQwVO6yHZ/nhXWjQmcO0ep8hycNzAI8nHvz6adA3OgEEX/IWhH1oThrglwPQqU3VUfbEWI7CmvIa7iWM/QivgZbcl/LRz+59wWGmzfl5x+LxBURZ59p3Ujl80S80jhejrf/viw==
Received: from SA1PR05CA0002.namprd05.prod.outlook.com (2603:10b6:806:2d2::8)
 by LV2PR12MB6015.namprd12.prod.outlook.com (2603:10b6:408:14f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.17; Tue, 7 Jan
 2025 17:10:55 +0000
Received: from SA2PEPF00003F66.namprd04.prod.outlook.com
 (2603:10b6:806:2d2:cafe::24) by SA1PR05CA0002.outlook.office365.com
 (2603:10b6:806:2d2::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8335.11 via Frontend Transport; Tue,
 7 Jan 2025 17:10:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SA2PEPF00003F66.mail.protection.outlook.com (10.167.248.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8335.7 via Frontend Transport; Tue, 7 Jan 2025 17:10:55 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 7 Jan 2025
 09:10:39 -0800
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 7 Jan 2025
 09:10:39 -0800
Received: from Asurada-Nvidia.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Tue, 7 Jan 2025 09:10:36 -0800
From: Nicolin Chen <nicolinc@nvidia.com>
To: <jgg@nvidia.com>, <kevin.tian@intel.com>, <corbet@lwn.net>,
	<will@kernel.org>
CC: <joro@8bytes.org>, <suravee.suthikulpanit@amd.com>,
	<robin.murphy@arm.com>, <dwmw2@infradead.org>, <baolu.lu@linux.intel.com>,
	<shuah@kernel.org>, <linux-kernel@vger.kernel.org>, <iommu@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kselftest@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <eric.auger@redhat.com>,
	<jean-philippe@linaro.org>, <mdf@kernel.org>, <mshavit@google.com>,
	<shameerali.kolothum.thodi@huawei.com>, <smostafa@google.com>,
	<ddutile@redhat.com>, <yi.l.liu@intel.com>, <patches@lists.linux.dev>
Subject: [PATCH v5 05/14] iommufd: Rename fault.c to eventq.c
Date: Tue, 7 Jan 2025 09:10:08 -0800
Message-ID: <af08ddec83b021cdcc6b2163042b04e369b6c5b3.1736237481.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1736237481.git.nicolinc@nvidia.com>
References: <cover.1736237481.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F66:EE_|LV2PR12MB6015:EE_
X-MS-Office365-Filtering-Correlation-Id: 88503494-eeac-4d81-7650-08dd2f3e3f94
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?hIPsPgbYyGgbMh5RLoCceazFnXw91ERJ3IUM4+DHmurkJWDpCLxTDabTlIwm?=
 =?us-ascii?Q?BMCnFGGF7MlUzMd0Irl5IyQoBj9BvaJKpskKzmudY8kxjAQnaJFPpi01xKsl?=
 =?us-ascii?Q?rp8eQam3e6W8Fokj3IfqEZCgAbMZqsFT0/dYbhPApX1zFwYp5jbJuUhkfk3d?=
 =?us-ascii?Q?Wa/CMkQuKf9GScJlZ2FcxjB4IP6OuVNk0gD83JwKpvTOPlTnQHsnv9PPdNLm?=
 =?us-ascii?Q?cuKslQpYtBp/QrW803bR5g8969mtn+GWW4MhjoMuzuDhR5BROACgOqgAMAC4?=
 =?us-ascii?Q?HDBtrBvib/hxUxNiqbfglFqV0Lvkif+kgGnjOp06i5SBEhJrfYSLwzo3gL3i?=
 =?us-ascii?Q?Mu1OItj/ZFnP6j8F1pQqX4/J4cQO1FRrDaUabPkXrz6ZKv24oZ3wut1OlR1E?=
 =?us-ascii?Q?5CH8kvvOkm/yRheqczzYSfMuEid0/l4CZgW9kzvCXNzG1r1PI0ID3hSDe0ry?=
 =?us-ascii?Q?omfr7l7m005EtPFb405FG10DHEOZFvJkfcr8fJlxaz8wGJSPvUim+wACUZ1Q?=
 =?us-ascii?Q?hwyOK1GBEOxWN1TzWtbrN0wv0eZu1gB0KJTl6ZXAa6wWAGnChcMOuae1RBnl?=
 =?us-ascii?Q?WH9s5LWiugWZBixxo7dHH+Zv7N6SXOF/OvVU5N07OfONQKer7CYvPU9nd9Cf?=
 =?us-ascii?Q?/ubu9aRgAyMpzz+Wsmux+GPCMv6tjZ3Yo1KdO+UWKSRFWCzGj/89GcN/T6FB?=
 =?us-ascii?Q?snYzKZe1yIrNhYDQU0R6Pi4CBU4vtrmw2LY/SuCGH/LVqLzSq3PcAJflP8sZ?=
 =?us-ascii?Q?vlsynkl5HorwbxQj85sAiOFsqLYo9RFnH4TJptOPXo3B7OL8mgD5mIr8EJtY?=
 =?us-ascii?Q?Vow0uXh2dGJZmnmTtf5KDwKGcDA+1B1YuEFZlpEg9jpPUW0D1O8Mi20ls/kA?=
 =?us-ascii?Q?bqQ6o6cBeIqT0BGZrI4HNzqxGpFHEAloJ1lJh6LFBUKqVpcn75vUvbrhFAqM?=
 =?us-ascii?Q?UQuikSKGOoxmhf5llo5A+Y6y7Ri4bTboUW/KOf6DswY3zu6GSmMyPBTgH7Jh?=
 =?us-ascii?Q?CWM0UyaMeYwjdiMVOV+1ua1G7WH7CDxu9flVzBzOZDpg9rIGmYwUd8HC/rUx?=
 =?us-ascii?Q?Tws5SJvD36DSareFVX6PPfB/UKHqSJNHP1Q3cuphervM49cAQeC4REm4Wpgi?=
 =?us-ascii?Q?/+LJLinfwT5OEPPjbVIpcdBcZlqLT6+5IjsB85eQOBhZF8bmZ/zGfVZR/BAo?=
 =?us-ascii?Q?O3o9Girb+GNqVDExbqIyfabWdKWpDESnTs8IeAqrbZHCtryzh7a8Q5spr6s6?=
 =?us-ascii?Q?ZbsXqujSuzKRrZQfSYMitJ84UqyZlDpZR85DH35cRd7+hLEIxAPmdkQ3OGf7?=
 =?us-ascii?Q?ZQ8GfmArcELFaYuXBP38KpsKWYyF7YGBH8nJSKvLx3WZaQbr+8oKmaUSCZ7u?=
 =?us-ascii?Q?Ia3/UqMmDWzWy4mDxo2ePPegU/WeGa3Txqnv9T50f+x1p0W9N9SAL6VNu2x7?=
 =?us-ascii?Q?5JidDxFXVPn9MCZGnzBmIu8nX/jrp9/gX7WfUVpCQZRFvOWxkP1yWA=3D=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2025 17:10:55.6088
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 88503494-eeac-4d81-7650-08dd2f3e3f94
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00003F66.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB6015
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_091106_840003_CFDEB420 
X-CRM114-Status: UNSURE (   8.71  )
X-CRM114-Notice: Please train this message.
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

Rename the file, aligning with the new eventq object.

Reviewed-by: Kevin Tian <kevin.tian@intel.com>
Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 drivers/iommu/iommufd/Makefile              | 2 +-
 drivers/iommu/iommufd/{fault.c => eventq.c} | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename drivers/iommu/iommufd/{fault.c => eventq.c} (100%)

diff --git a/drivers/iommu/iommufd/Makefile b/drivers/iommu/iommufd/Makefile
index cb784da6cddc..71d692c9a8f4 100644
--- a/drivers/iommu/iommufd/Makefile
+++ b/drivers/iommu/iommufd/Makefile
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 iommufd-y := \
 	device.o \
-	fault.o \
+	eventq.o \
 	hw_pagetable.o \
 	io_pagetable.o \
 	ioas.o \
diff --git a/drivers/iommu/iommufd/fault.c b/drivers/iommu/iommufd/eventq.c
similarity index 100%
rename from drivers/iommu/iommufd/fault.c
rename to drivers/iommu/iommufd/eventq.c
-- 
2.43.0


