Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D9E8C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 May 2025 00:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hn6044iiGT0BmuYHa+YrkuqRYn+AFrLF0MWGm0vklJM=; b=UNvqRYZSPHZ8/KjNIqnBCf0fUN
	co82J57n5mkEUcVYK5vHkyZ1JTcM4m+1X5o3XezcsDoBXByBqFIe+zBSNQV4ag2N4Puk6pA91XSQp
	eE2C3MeahVLk6DCnzA89oNWSORkJi5h0HXiI9498P/2lT57mjYfRUlVNhPK0ercCKs72kHVlYFdEQ
	pKI2KI9VqP9iHS1A7fhbdpMV2AD9l45eBLLYohPwriByxaAD7EclXDKWTVOBXbauHFzcImaqZkN43
	J9zlexOv4vNc3Lw726xQEt7F+N0hCpFLiHa2q6ipzIfNEPn/axj+kcywglCUTC69nm1MEl620ieqA
	gvEI4Yqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAdvl-00000000Kk7-2ruX;
	Fri, 02 May 2025 00:07:05 +0000
Received: from mail-dm3nam02on20630.outbound.protection.outlook.com ([2a01:111:f403:2405::630] helo=NAM02-DM3-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAcvU-00000000AOL-1XDS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 May 2025 23:02:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aUrBqRk86RKjrdWQjCovSScAPqvlBilv8MGroydTB5bwovvGCUTD3Ndu644Xc1qjS4/yXjUmnOQyLuo3ZqWjznl2yt1X1Oo+NV3qwzh0VM7exKOaItLJHOMMZ7xIGtfl4v/HcGIvWP9tBfms0rimKgZeY1pqwNVwZMobD7GnONLPOpnpeUgEX1SqW81w9vJIZSZ0TREXKKtxrRzcZkVAhYgUBlUsWXc3R5DeEU6N26ZeeX6SAIoibJ6dyrBZ2f1vDyikxGKK8aObnvaK8pads3rC64Zc1AIiL/k4ahtSnzXnUdi/AxKcbt56z0DcabETWZJ3AJSVCVMAEyGzhYsGCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hn6044iiGT0BmuYHa+YrkuqRYn+AFrLF0MWGm0vklJM=;
 b=kcKi4ECg3wXUe+dvvBnJ96dxd/4YNHrW0aCEWTuOGYSKruhXgcdCiG0rVnVKT7ondh8esQfbFr81IieC92g3wPn6JliY4VtaMdTnBMxbTmlMlzHxOPd0oHj+yLcoYHBY8RI/+x+0EfRxbGjBSUdn1tUM4it/UlmwuMlQb59vulGGaoeLheRj4QCCczHk+D8w3HwnTxDCWrC0ffLbyhNkAoQxgUNSN1JjpxDjf5112f903TaD79gVGUsXhMyHFjTUUS/dquKRQ9PVkrV/WfKpCFUZKdD0nkiHcLWxKpZv/VWJf4vY9+kNMxDl59XtJVunGxa7BMWIC0+JCUI49c8XAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hn6044iiGT0BmuYHa+YrkuqRYn+AFrLF0MWGm0vklJM=;
 b=FINfwVO8Q/yxunKv6EOeXZBg0Q0Hn0S57AIvTEmSXDgS3cahYbwNffNCDfSQz1jcDUJHUJyVhyxsA234wtH3pOAzPedmFtvFqUlo8EtF3LDBMa1p7XinCE+mRlPoBE4M8pLOd8YEYTybj+1FFJTc4ciOxlxjBx02cqKc6bWfYjAFKo3wTruCO2iapUEM2NQx3Hxo2uK5ebKrprC2BDd/afW6nsczrG931THkgfjey69bjAdlTbWuX21N43x5Ym5xQGdxZMIYg61zxvP/oB/3md5f21T06YRjws0AFCM6lpvNxsPSF2kaELC+G2WnJzyBuEx25skDMUycFyOttheHpA==
Received: from CH5P222CA0021.NAMP222.PROD.OUTLOOK.COM (2603:10b6:610:1ee::10)
 by SJ1PR12MB6265.namprd12.prod.outlook.com (2603:10b6:a03:458::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.19; Thu, 1 May
 2025 23:02:37 +0000
Received: from CH1PEPF0000A345.namprd04.prod.outlook.com
 (2603:10b6:610:1ee:cafe::58) by CH5P222CA0021.outlook.office365.com
 (2603:10b6:610:1ee::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.42 via Frontend Transport; Thu,
 1 May 2025 23:02:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 CH1PEPF0000A345.mail.protection.outlook.com (10.167.244.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8699.20 via Frontend Transport; Thu, 1 May 2025 23:02:36 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 1 May 2025
 16:02:21 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 1 May 2025 16:02:20 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.14) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Thu, 1 May 2025 16:02:18 -0700
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
Subject: [PATCH v3 19/23] iommu/tegra241-cmdqv: Use request_threaded_irq
Date: Thu, 1 May 2025 16:01:25 -0700
Message-ID: <a0079db492d0f578356b43badea4d4417346af6c.1746139811.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1746139811.git.nicolinc@nvidia.com>
References: <cover.1746139811.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A345:EE_|SJ1PR12MB6265:EE_
X-MS-Office365-Filtering-Correlation-Id: 9cd8d162-c062-4eda-ec42-08dd890443f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?BIvIuPM8CKQK3v4qCfT2SeDRWxGV1cuYeVJ3UbX/3eeOSq3WgnDnHsIQi8em?=
 =?us-ascii?Q?r69xKyWarO0IJ6aKOX041/aLJmsf7kbi1u5VFuSeZYLN4mJhVTkQHwA+QBcY?=
 =?us-ascii?Q?kORuU/nqXPWPLv/MOfVFtft9a37EXE2GlLfQUKpBmJG+bEf5w/yLzYwAcK/r?=
 =?us-ascii?Q?krHa90weMBHYjLMp4jKWIlSIE1Hx+L+aTS8Mx1jsTascYemXW5u/FNK2QN9M?=
 =?us-ascii?Q?HSxpudRwLORGAnlzFZosgO1xYEuIz3qp4P2wn1+Jqmiq8l4Vq43C15HkSpk2?=
 =?us-ascii?Q?tT12Eg3j3/v49g/pk8ScmWCuIzpc7b82PmUU285GfPQEzjP+uUa7CJ2pMiuw?=
 =?us-ascii?Q?WjlBxRo7K+tjFo56GyaEnOUX0z/DjEf95sgv+UPGYbsX8cAsIRA6+Y4YQ/sm?=
 =?us-ascii?Q?8aV9RD7ethsLA3tc1PQa6rHxu8v5NxErlQBClkcI5K5iBJRhvBS6Nyj09Yzq?=
 =?us-ascii?Q?W4c9BmWhX4V9UFcba9yNkKHlPgQ17rUKcppQ33E4qg53ol2wRJDi2P8gldeh?=
 =?us-ascii?Q?RcIirkHZ3E3faF5VFkbJE/RvP1cQ6XloOf/e6hEF3NAemF5iobWMqeX89UDA?=
 =?us-ascii?Q?ADUPChTfLxfD4twX3edYrn+0WFyghppY6DcA7fdJ7uFg6Ke/KoAYX7Yfd+K2?=
 =?us-ascii?Q?gpDA51RxP4d4hP7sK02vMH/BMcPYO47BwYS/+MsTANtbJ0vDR++qoxyfXg63?=
 =?us-ascii?Q?Z8IMe7I6O/3mibrAlgA8NwfcwNgdCfd4e0P/ZaTKPePlqBr6Hl3WxWwGCX/G?=
 =?us-ascii?Q?5BhD8tIzwZLI+QahjUSMUHipr6kouTfhmzMUoMFf0CdkMbbtt/Yti98sv7jG?=
 =?us-ascii?Q?znNu+yXDXxtlVn1n+JHsy5mW+ywE/zJEhrXv+LlnETxT9U+Gmn0u0Y3NV3md?=
 =?us-ascii?Q?nMOlmXH86C4wYqFiBvinfvDm2z8xO0Rmli6Ey45arHCr9GeBTpYRkdjMBQTc?=
 =?us-ascii?Q?bvkspMKg3Oi/wllJYRjrN3J8yutawdxa2pYERm9QgVOAVDvagLMOjXlBPzha?=
 =?us-ascii?Q?iPamVjv+XRRcDwSmspFeJVPu//kkgRrnJTK/DRyNTQvR4cDyeYY35SHyP9z7?=
 =?us-ascii?Q?+gwdV+dSN1iTyu4K3NhOYUJaDrOjNwufx6/mFDinIgM+AcuQ8TCXOJIeBJvt?=
 =?us-ascii?Q?y3F1dR6ADPBEtsIF+WNOfKOZ4Nn3dFplohI8A/29wOwRhUCMGrahclH6PFGs?=
 =?us-ascii?Q?Et/IGxcibd/90uxp61DIjWKT5hB25Pdqqx+dr1/jZBr95X4z/DgOQcc7QSM2?=
 =?us-ascii?Q?LhTUZI/WVYN+cbT7sATkUG4+zWDvvpfC6Jlx9tUQKI8DYaoQGpAOzEIya0u7?=
 =?us-ascii?Q?kxo5+4GoX+6gBEzoLhc/xqjArRba9ZLRlpo+oONmAKTj9fiRWww04mhvPumD?=
 =?us-ascii?Q?gNSOqKdoGHvP8H0wO7CPGaIj7AA2Uk4NwqU5spkJbwv71obyFayk5FnQPwlb?=
 =?us-ascii?Q?n7Bi8vPEVKt3ZGDBngn1mPv1vxjS5Zoz/xPMIIVZxfJ0uuRrQCPmWxQfaIZL?=
 =?us-ascii?Q?wJdCnrgikRrv2oI4DvVTtEhHBNYnejq050ki?=
X-Forefront-Antispam-Report: CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2025 23:02:36.7817
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cd8d162-c062-4eda-ec42-08dd890443f3
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000A345.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6265
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250501_160244_399873_F1D9C14B 
X-CRM114-Status: GOOD (  10.96  )
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

A vEVENT can be reported only from a threaded IRQ context. Change to using
request_threaded_irq to support that.

Acked-by: Pranjal Shrivastava <praan@google.com>
Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c b/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c
index dd7d030d2e89..ba029f7d24ce 100644
--- a/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c
+++ b/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c
@@ -824,8 +824,9 @@ __tegra241_cmdqv_probe(struct arm_smmu_device *smmu, struct resource *res,
 	cmdqv->dev = smmu->impl_dev;
 
 	if (cmdqv->irq > 0) {
-		ret = request_irq(irq, tegra241_cmdqv_isr, 0, "tegra241-cmdqv",
-				  cmdqv);
+		ret = request_threaded_irq(irq, NULL, tegra241_cmdqv_isr,
+					   IRQF_ONESHOT, "tegra241-cmdqv",
+					   cmdqv);
 		if (ret) {
 			dev_err(cmdqv->dev, "failed to request irq (%d): %d\n",
 				cmdqv->irq, ret);
-- 
2.43.0


