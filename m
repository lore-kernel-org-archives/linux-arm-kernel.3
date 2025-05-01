Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7EF4C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 May 2025 23:44:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tSJQWa/2Z6c75YJU/11syyISuOMPfndvDnHYH5c9jyU=; b=tjw4rm1tTYPU5N0BaNIbXwlshr
	BMz/eXCafOmdKB7UIXQxGUvB4r6EdJc8g4lxasJcEZmuqzhF122MiufwTS45AHS9TWt8eGfZteKxm
	x2zj1e3OiDG5wGqf/HZGy2vQP5ym5WkTFLFLQOK4+FLxkelEh+w+UazTfykJl+s9J6hRYgL3e119Q
	0W+nzUzjoy8/OkKg34C91FSbNk5c9OGMOoJwC2OrnN5u/4cuqNaJIfM2Q3Fhc4SD6gTVlv9axAK6C
	cHBx2MJdUZ81LS8V8oqyRr3LA2WSLqLMGnsOgaIf8OwOlhMesX3FqzBVaePwOVOx6MNuiD6LQOgfj
	U4f+Y0ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAdZK-00000000IS2-0BGG;
	Thu, 01 May 2025 23:43:54 +0000
Received: from mail-bn8nam11on2062f.outbound.protection.outlook.com ([2a01:111:f403:2414::62f] helo=NAM11-BN8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAcup-00000000A2A-3Uc7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 May 2025 23:02:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aHWRh4CIje2g6mgHZLmPvC4qPKcJd61H9fHUTvUfoWFz5pswV6m9al/Y+5YufctgIcbPWXhWl2Vo23U4okuQ0RU/NSzGexMsR0NcGGid0cxHdz2xZpqrerj40dUJPndamWe4W5jO/+n2WHx2Leo4aqDPY+OFVQ8y5NqvY7EyYlXdbfmz565gHstFqLhb/UbfqsEWnHNp0/ch2gtwlvzfwIYNRKxoEe5LTRggFiuiJxvCBuXx8nFW8A09kLjIXHp6eDO5MDgnQjsIzjYNzC4MFUgeuyBUplT0XdOVhrGeFoer2Z6g3Al0EwNFcjyFg2M1BfS6EIruzvCF/4mzAzYDtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tSJQWa/2Z6c75YJU/11syyISuOMPfndvDnHYH5c9jyU=;
 b=owXh7gQUdwevdcdBq9r79KojVDEQhfIFbuvYeRpmJsWYloncSI8pr4JrFcVPBFwF2OELJ5KA9DSbR1/qbQu0EP1bAOF9a4JX4erVRpnt9AoHAMckkDpJmhEq/F+08qhqhNhxY5z3BBG1yWtIJU/Ssbvvhn4ms1hdSPWPldHS6Ff7dTGXglXkMVKagOFFzksapqRDb9uvBwN8BVIDxoM8R+3eBXvalzMfnTMG3zZ0eQ8L/KLngU2LWVSgqwR3cx4hmV7d5DvqEnrI1zYKiOtwLKJI5KRwHjl75+hZJm+6k5pqNMGQT1ROE2yQ7tZ1C77SWLW5lxRlhRqRmEgdzXgdYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tSJQWa/2Z6c75YJU/11syyISuOMPfndvDnHYH5c9jyU=;
 b=B0b3ithXyAayYV4foIo0IZvSasqKMLx9JtDzGP2zHwMtTroScjx0cxWTuYhBYVzpdZm/lDLBIynL0q6XXNFhF916tdHCfYSqjfnLrGCxCzLnyFU+7bSiE++H6WE2xoPZbcQu28P8pIUj/H/NJ/LeKjS/gjK47OgN660SqlRjPq4KyukWq9tgC9GV+QocvOB0YqlJhksZWDwT0IQLfm2eyfqgoMnbWu1FySOM8zOHAxq/pWOvlgWkp5PCjbiwXkCP7MhcUYLK8ZwAVpvnHBT/wJSpq8IFMPEOEoYTRLERenU4MxrWOScM/xiaoF9gq0JHbQ51wE08Fm0h3//5HuTffQ==
Received: from SA1P222CA0056.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:2c1::8)
 by SJ0PR12MB6943.namprd12.prod.outlook.com (2603:10b6:a03:44b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.20; Thu, 1 May
 2025 23:01:58 +0000
Received: from SN1PEPF000397B2.namprd05.prod.outlook.com
 (2603:10b6:806:2c1:cafe::5b) by SA1P222CA0056.outlook.office365.com
 (2603:10b6:806:2c1::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.41 via Frontend Transport; Thu,
 1 May 2025 23:01:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 SN1PEPF000397B2.mail.protection.outlook.com (10.167.248.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8699.20 via Frontend Transport; Thu, 1 May 2025 23:01:58 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 1 May 2025
 16:01:47 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 1 May 2025 16:01:47 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.14) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Thu, 1 May 2025 16:01:45 -0700
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
Subject: [PATCH v3 05/23] iommufd/driver: Let iommufd_viommu_alloc helper save ictx to viommu->ictx
Date: Thu, 1 May 2025 16:01:11 -0700
Message-ID: <f660913cd7f5f9bd853769cb89a2adbc705d803d.1746139811.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1746139811.git.nicolinc@nvidia.com>
References: <cover.1746139811.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B2:EE_|SJ0PR12MB6943:EE_
X-MS-Office365-Filtering-Correlation-Id: 06e035af-5b1e-4d52-733f-08dd89042ce1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?wvUxoi78aejG7jwupw+UMOsI02DuhTSKuPBlt9nFhZ7hRhW3okqdJGb77nZ8?=
 =?us-ascii?Q?Fwm+2cEDT8s8ydRkYm+Ha5M3r/ZuEMgmeBEVohkGTm47c9fjiw20MJMufPZh?=
 =?us-ascii?Q?gLevIww70CBHohj075CLVJpEt9rsk+8T3dV48f3dUy4VHavsvCbV3tEFAHZ1?=
 =?us-ascii?Q?mejXhb2pdmmOHRCPJMTWTu/s3kG1CEe3OgeWxd1EqMnzs03fyU+p092kBruX?=
 =?us-ascii?Q?5Ie1P3Mq7C2hIRrokL6sNHmvh4v/LIMf+oirwi8PzvQBRXEUTTui9ZEhpVRV?=
 =?us-ascii?Q?Wq/u1F0W6aR2KP3TrhiKsfkLV1oCxK/1nB5OJ0oUDAZXt55H1FBmJQcvo3X2?=
 =?us-ascii?Q?w02KF9JgEB4yC0PxhnQ9MVzelf3mUs5D9vxf+qPAYI+35ngOHsYrUWRXdQSw?=
 =?us-ascii?Q?vIM5ZHyPy1L5QLPF/6m9tvHiU6scoYEO2S1GpbgKxGxNzzkhzuFsXBfcYJZG?=
 =?us-ascii?Q?+cxZdxv44aKxBjNcW4CJsEajNufA+l7+Aux5hDHQz5twwcOnR9kCY6V8q6pk?=
 =?us-ascii?Q?ug5aKkcAAqvgS5ukUACMTAMxz6R0N1d9JMy3ur4RlNp/20C9RRlNsxLp7DP4?=
 =?us-ascii?Q?9m+q9YeTLe8cQewAQ2O8QUvQmsOLJb8M+oGKF1CHBO8YdC+nndJtM6WvTpjP?=
 =?us-ascii?Q?VuNzO1sfzRMTNGdeAYHzfubWrMFGNLEAep8qE4XfNTlbY5DE3PwrNNv6MnLQ?=
 =?us-ascii?Q?NwQPZanP6YoC5b7VnMI1aN/x4WVmSfH58rMhlPfMYuJVukbXHl4kt/zQkyvn?=
 =?us-ascii?Q?/Z8g3SKwtbU63vz93COCvz5/rkFFPlV5QgJlodKE16cjARv37bcvpBLtxHxL?=
 =?us-ascii?Q?+AmXMHN3DegnpSPF43mO1CZSlsnNmBcvvdp8O4O28KkUOnQRjXwt8ONfnjRT?=
 =?us-ascii?Q?JqQ2RHoozIth80fZ6/ypUPGgTR52MKr/3Tw3XpLWyIIuRq1Bf2yWDo/6Gf7N?=
 =?us-ascii?Q?g7Q6Gl/a4kuAuqiA/kM30JUrw4jt4CXMU1TnVnTq7Y8u5WApXuCZGwbTrsa+?=
 =?us-ascii?Q?Ovook+DpBKP8rRHm/icbyXxw5bbyVMEmsIhnlwplUE+PLVqOGhpxgqQ177VK?=
 =?us-ascii?Q?azurexWJ70/yIhFmxiP/OX8LBm/1hpFlydK3fPVkYRV6ayJyDf9Mgs/PUvAH?=
 =?us-ascii?Q?rwNOGPJqOsM0q3CHcdWpNblz1hMCCzRBmocrIkHrH6sgUSb0zvN+b/1rHqwh?=
 =?us-ascii?Q?9sZd3SmEzPpjUZV/KePH624WZ1d5qyzVtGE4XkdIBhbUojhX8+FznzR2YUS+?=
 =?us-ascii?Q?YDsL3/9hTBDebLt0Pc3fifGxzl8Nf4yA/byBupCkrkJhqKs67r3Odca5qfB1?=
 =?us-ascii?Q?pzjXdUVWmTptyE4+EmPGo4E0Tw9qHuP6DP9Mh4CHn+g47MF7papBXy16yv9z?=
 =?us-ascii?Q?Tzv2hdwSTVSmNbKtXh1l5G6huThtSNiZAhf7Uz+J4XUyeRcKy/bkV5EmWoaY?=
 =?us-ascii?Q?BlKjI8w0fPTewl8q4EtjtlRTV6jyvOORQyMHtRBLmaaRyWwZHGfgC2fsvkqr?=
 =?us-ascii?Q?EDIsEYf+Vnvo+N+LRB6WWZOACRcRmu96LvLR?=
X-Forefront-Antispam-Report: CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(7416014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2025 23:01:58.1072
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 06e035af-5b1e-4d52-733f-08dd89042ce1
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF000397B2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6943
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250501_160203_866444_5288CFCB 
X-CRM114-Status: GOOD (  12.00  )
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

When an IOMMU driver calls iommufd_viommu_alloc(), it must pass in an ictx
pointer as the underlying _iommufd_object_alloc() helper function requires
that to allocate a new object. However, neither the iommufd_viommu_alloc()
nor its underlying _iommufd_object_alloc() saves the ictx in the allocated
viommu object, although viommu could hold an ictx pointer.

When the IOMMU driver wants to use another iommufd function passing in the
allocated viommu, it could have avoided passing in the ictx pointer again,
if viommu->ictx is valid.

Save ictx to viommu->ictx in the iommufd_viommu_alloc(), in order to ease
a new vIOMMU-based helper that would then get the ictx from viommu->ictx.

Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 include/linux/iommufd.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/include/linux/iommufd.h b/include/linux/iommufd.h
index 422eda95d19e..dc6535e848df 100644
--- a/include/linux/iommufd.h
+++ b/include/linux/iommufd.h
@@ -262,8 +262,10 @@ static inline int iommufd_viommu_report_event(struct iommufd_viommu *viommu,
 		static_assert(offsetof(drv_struct, member.obj) == 0);          \
 		ret = (drv_struct *)_iommufd_object_alloc(                     \
 			ictx, sizeof(drv_struct), IOMMUFD_OBJ_VIOMMU);         \
-		if (!IS_ERR(ret))                                              \
+		if (!IS_ERR(ret)) {                                            \
 			ret->member.ops = viommu_ops;                          \
+			ret->member.ictx = ictx;                               \
+		}                                                              \
 		ret;                                                           \
 	})
 
-- 
2.43.0


