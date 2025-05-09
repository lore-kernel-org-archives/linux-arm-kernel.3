Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52294C3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 03:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tSJQWa/2Z6c75YJU/11syyISuOMPfndvDnHYH5c9jyU=; b=EsXf0w46HY5Mkj6rJrdEbV5SMO
	DUJOrUyUPUQDTIBP1kXyQHH6OmVpzNZbPd3CTjGdTtnC2ZS2BuHE15SAQHodBiZB2rVtehwXZ5cFt
	C9LXzEf+ViXH074mnKfi0PJ/jj0iONhcshGD1Wnb+eWIrRE/VxePtI+3a9jzDoRRzec0MDeSfKZ4r
	tOPXXb7oVeQ0bFm1f/vshqFIMiUPfUHLb6HGilOX3XsIGCGBmOBPUOfgHaNxHKCaSJ7HhpWNpkfpM
	Fxw8WNNNGa+ePVG/YScCB1uYG1S1x/CgN72/UQ2nOtE7DLeuwYoMRPCrv74TdfNfZZMRrdKxqcuQ2
	3dE08WfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDED6-00000002KyU-3TLD;
	Fri, 09 May 2025 03:15:40 +0000
Received: from mail-sn1nam02on20606.outbound.protection.outlook.com ([2a01:111:f403:2406::606] helo=NAM02-SN1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDE1H-00000002IaS-1TYi
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 03:03:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yhqvhBE77Nw6uJRkHDhT+wvuNjePNBZAX7BFquuael8hwuR7tP+S0Nt3ZpCD4dR6RFPPw3FQ/Hy4PEIuPs+49tkhYyPXVej5feSphrkCTQSroeBOvzwdl7AzmNnKjeDlXLp2pb4e0Jou6IHwSQN9NzvkMsRPBrjIyRZcUKUybDe+XrO9DgC4N8g/VECXkHJzKvm7pnL4kPZA0IokWLcrLoHdlYqy3uZ3+R8VqC9ZYpIdi1nDBytDs8ArZOA6CTSivprumjksvO4R4KhejKy93Wf00Af6gbsAZ4wSWR23tkCfPH6I0tkuZZcVQUhiGSjZ7K3JUCEqWXH4bZVpfn2oPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tSJQWa/2Z6c75YJU/11syyISuOMPfndvDnHYH5c9jyU=;
 b=bFJqdSEyRRGE68Gd2e0wOzEHGuFm1BmUyVlZ/0KH5jcls2FdCcCtqfeAea4FjlMxqS3o9fRaPb/o38IQoNlNeNrYkRVpJNYmPmZ9ufWkwb7RGgjKcC2H7p2is53K5TAuaV3VOa9kKDf3gq3Xb6ajitHqi1LNos0+ClxNTrgOoAHUDs5JGGqdKpzzoY9yIlBzJjD4gi3m14zFULIWvLvmDtrbPv0vzZzIY/45IcHvlGKPGspEJj9CdC1eQxwzzoCgQGr4kouWMZnbImpGQz0trRa1se4rxLnhUy5ysRvJxn+pK55mCG08ezHHgUtu/4IwxMzD9PqpsMD3447Yt7yMZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tSJQWa/2Z6c75YJU/11syyISuOMPfndvDnHYH5c9jyU=;
 b=Zacq6w9o9wK044J3Gn68PLQDgfyAuPUdtt0NF9AReo8uvqN9hxS+u8aKlS0Xh2G+q8J+KxQVhQ5uQy3UZsfH+CmMFzVBG+2nXm1uAg6XsVDhzW/OjRwylxnhr4wGjU4cpM4BM3ZhoAU1HI2a8PlmnpcFzPRjQxhYglUeAfE5U4ga9NfSpZAC7hJtI3oBrXdEK3UGtvv0E1KKYU4nrMBHPIb8K2fX8QcAfkdiW6wQbr2r+++0o1Dbf0b98ja8T17tRnpMDvV1MjVOMvI6OarR6YgZKKew3u741lNIoMJSvoXeNKsYKl3frygq5z5IKXjhuTbd/2E/FSeI2ESiG11JZQ==
Received: from MW4PR03CA0309.namprd03.prod.outlook.com (2603:10b6:303:dd::14)
 by MN2PR12MB4112.namprd12.prod.outlook.com (2603:10b6:208:19a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Fri, 9 May
 2025 03:03:19 +0000
Received: from CO1PEPF000066EC.namprd05.prod.outlook.com
 (2603:10b6:303:dd:cafe::a7) by MW4PR03CA0309.outlook.office365.com
 (2603:10b6:303:dd::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.26 via Frontend Transport; Fri,
 9 May 2025 03:03:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 CO1PEPF000066EC.mail.protection.outlook.com (10.167.249.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.18 via Frontend Transport; Fri, 9 May 2025 03:03:19 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 8 May 2025
 20:03:09 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 8 May 2025 20:03:09 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.14) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Thu, 8 May 2025 20:03:07 -0700
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
Subject: [PATCH v4 05/23] iommufd/driver: Let iommufd_viommu_alloc helper save ictx to viommu->ictx
Date: Thu, 8 May 2025 20:02:26 -0700
Message-ID: <5288cec9804e7e394be3b7de6b246d8ca9c4792a.1746757630.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1746757630.git.nicolinc@nvidia.com>
References: <cover.1746757630.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000066EC:EE_|MN2PR12MB4112:EE_
X-MS-Office365-Filtering-Correlation-Id: fbe71881-68c0-451e-a1a5-08dd8ea60d16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|1800799024|7416014|376014|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?qrDtxpvqMyjyhQYloI4dnyyk6dzt3X/9+fsbxDNluLbYNgtMp1cZKuP7TK7v?=
 =?us-ascii?Q?Ep+pK1SuZ+79AOXH+o5LhX79HvKqMAnkRWWfhWxdcOV2MEvOXFni5LJAoLki?=
 =?us-ascii?Q?hyJL8rdXVUfeCeWEG+BU95mwpUdNA82m2+wLJD7UauBDP9dEVGW/NGV9I2t5?=
 =?us-ascii?Q?R6Kb4+lvNEO8yOlS4EV7yRkgGoAxt8JwNU5ZkIWf0AayOyKnauz1vNMFb2cu?=
 =?us-ascii?Q?5QyzYW4IiWLKCq08/OROP9nnn77PH3PH1JHfY6RNHZQ83Cr++n6+yWhbvY5Q?=
 =?us-ascii?Q?c3oDJJ41nwWf88mxKDgk5rp6d7R8A6z8PwaOtlUvY/ice42WulnIQq05dXuI?=
 =?us-ascii?Q?PdvJFnm2oy7TDwn4ujOaJNeraHKi+Hm0ctKBiy+/bSQzi9ceyEEx9xFCNIkK?=
 =?us-ascii?Q?/1RvNNMrxml/rrxEsNCRzH3i7/REDklAoDF2WyzMdXm2UVZmfIesWEhb2SyL?=
 =?us-ascii?Q?sMRmTnwX/Baa/mWgG3uyAkAYiBLX3E9sBr3iJhMCwZvO73VVfJ7UUD8l9MxY?=
 =?us-ascii?Q?fueMFmGbIKHFRiib/9DD6UYtfPht6qEgzUhAchia6eDtXyIkrQJMVM24kZF3?=
 =?us-ascii?Q?UMSzVJmGFBVOsmdpZz0/MxAd+w9eSppRmT2S8aA8125OXHxrizzG7itENJA1?=
 =?us-ascii?Q?BcD3/DyWA5we04ZmpoLbOlnNdbz3Ky6baQ59lzfeJn+5rW8V9ZP4CDEfWZln?=
 =?us-ascii?Q?dXN4DzlSyJZsRHm8xAzuXT5vV9nqII8s+nxgm23NANG2bHIbAMWpKMARuie0?=
 =?us-ascii?Q?NYQKfdB6F3xkB6MP70hArA2C80go+jBFtkfKt0j02feUGYydDv+lqIgDgLED?=
 =?us-ascii?Q?xLWaPUKrmDCXQ8xWsb1CwEYs3Y2o86qFb0Ny3MiBbTwbJLX7RyvYCHOSnSlR?=
 =?us-ascii?Q?v76CYxBTy/ebKhclCQ/lKZx/EZ1egZNlsF4RNrVRTrT35IYtFXNti7xoOtcK?=
 =?us-ascii?Q?zJFJZy/OOGq4bV0XU4pPYfqW3BxskCaPzpsvT58ONcifdfaSItC1cTvNIlq/?=
 =?us-ascii?Q?Tsz7FafkFdFtjddET9oZTLt+yKEBVAuFBFkK4GBcNBMZKLrvf0dl5JqCLs5v?=
 =?us-ascii?Q?bneBKgiGSnl9T1qVzUhDB5oQ69IxHRKZjYJGdx3dNI7yMHRPI7ryr3k8BbH3?=
 =?us-ascii?Q?WNhNekBDtQoyw6znayNVMOAM+EkKQSe/D6oUVlcJ8jiL0IDaPg83fW44N/qO?=
 =?us-ascii?Q?5SXk5zaxskFYOUQFHrdgPDbfDXEFo7f2f2idE2hQVMN2ciSpMukUDhac01ZQ?=
 =?us-ascii?Q?YmMhUe8BZGIr9TY2sqI/elp2yOF3YClFRzf7HU5zcBpLMoJqzHDbYk95aEz5?=
 =?us-ascii?Q?W3dcCmr80WHpaS86WMdxXVUGUi9dC6VwcJd1G5s3pYXwDNwLyPghYHbRPHk1?=
 =?us-ascii?Q?EwItAyt9pvgUEKvtulEOYsO6WrVzMuAo5uADHZam2aOVx0CAAljY1wEJ1VKS?=
 =?us-ascii?Q?25tfQcQtzE/+2RaXnhwsb2aYNW/Uo5dI+i4IVLT1jtUfiL+pvVq7bdE7stdV?=
 =?us-ascii?Q?HXFtUPNAPtN8rejPoPSUsk/gWD2DOowQDxVj?=
X-Forefront-Antispam-Report: CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(7416014)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2025 03:03:19.0906
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fbe71881-68c0-451e-a1a5-08dd8ea60d16
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000066EC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4112
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_200327_422453_1C7CB788 
X-CRM114-Status: GOOD (  12.48  )
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


