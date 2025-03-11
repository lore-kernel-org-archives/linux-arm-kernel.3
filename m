Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A299DC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 20:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qhvw+OY5rWzXvgenwxNHj4+yj2zdbIVe/Hrx8rdxbSY=; b=yBeAvIHkRh4jsTcF4kmuBK1184
	ydTs22Dym09fMGRmoAVCQOYXNvU5LS9MLImQ/dHHi2sf5EihRxKxVyPEVLkcTQ04lRDOlOxmgFctd
	E+dh0Y7JAc9bTABZXyQZnlRFvUkogKVj1M06B6fnODXyq5HMInXb4vpzqwfUyiJZ4ulzK6KEIORi2
	iOg9koGJxED0Wwoa/ryqpCY9A2oN4X1X/NPtvvMFLEJvExw40x1SSCB6uBeyqD8Q3gEk4fNf0TORT
	ttbgZNfU/PKw3IOswf3CfI8IsxP0qAtOHl6lNFC0KyFlqmJV78BPT/hC1PzNXTx9ZudpEuq5ODGFT
	W/3pIm0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ts63H-00000006uYE-2CTD;
	Tue, 11 Mar 2025 20:18:11 +0000
Received: from mail-dm6nam12on20622.outbound.protection.outlook.com ([2a01:111:f403:2417::622] helo=NAM12-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ts5Xj-00000006oJD-2Q6Y
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Mar 2025 19:45:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q/70mEF+PT0Fut25SLEw7rKRW+2IxF1ypmZUmtZaq6oznv9TPdGAWwxPDnm3nxCaRlsGhIGe8pm6NjZDb0PfbAidPSRdb6m2OmKELi2ME5E42z32k0turNnh+zQK9z6fpAE7heldVmY/4OP6yfjzk2CGr39mUJHfRDeiz/fQar2bp8Y5Oeuby9uMMKhQO5llmNWybpoafLw6MUBPqOIHvaFVcv3KPAN73DPByHDGj98vd+r87Ud61rrjYMZJYDT+So1R9T39pBkzCRiZPu+rHJNeog4OY3vY3KqX7SVkXsntpwM4AlE8bJ6FT5AEw8kboMrwKIISGhjbrt+brfqLWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qhvw+OY5rWzXvgenwxNHj4+yj2zdbIVe/Hrx8rdxbSY=;
 b=sLUDllr8yobe7LGvwSpszNg6/Gs2aQpYmWQ/KXgCjAAaTGQl+2LSNOLODywoZPCH1nzpytVwBTRb1ulFGNuM9m2aSC+GMeUDDiav6hirNNZbtzQ1E4FhPJLqjCNt5wnGqOe0WIM+ubuWABviqskTDf5Q4O6SJ6RKS+UW5CmTBo4RkpRDGoHI2zP9PZ5vp2NYCUTtKP9TmcjBBcHUrxbUr7nU/clX9VzhTL1rMPCOlPnqEqV1wLFvhSBBwg/ddg4tPTRnHOqgWaibqijOCkymSL9tHv9RXpphFvTtClrhPIu3Ld310k6NJ5CyhxOxoZw1MlNSRNLWJF5sO9O56euCUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qhvw+OY5rWzXvgenwxNHj4+yj2zdbIVe/Hrx8rdxbSY=;
 b=Jxrrug03lCKqEEo/wpLJ2TbCVNt7SPj4deZ63/MFkm7kmrIe++z5YyTHOfRz5lTHqcWZEd3Lp8ZX2B+XwqxhODkQEF08ik9IRHVLYylvmkE+n6XmJeaSMI8D4+OmtTJz1icYv+uAbh9r3H9P3fyjEtKO9eNzmnlTu+fUmfhFQRHjXf5wvavD16SWT+NMJPBJBOu6IBMcqLdIMTaX6OpPX40RXmuQ6MjJM7ILD21UL3y4CJPSCsVPCyfm6I4KV53uuiGDLughdZI3yM77zOvMwggamX4x9XAwViVFE64gNiIDurykXrOnhmelONDTcVc4hp2hq4YTe9YvpGl9enNXWw==
Received: from BY5PR17CA0061.namprd17.prod.outlook.com (2603:10b6:a03:167::38)
 by PH7PR12MB6563.namprd12.prod.outlook.com (2603:10b6:510:211::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Tue, 11 Mar
 2025 19:45:29 +0000
Received: from SJ1PEPF00001CE1.namprd05.prod.outlook.com
 (2603:10b6:a03:167:cafe::72) by BY5PR17CA0061.outlook.office365.com
 (2603:10b6:a03:167::38) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.26 via Frontend Transport; Tue,
 11 Mar 2025 19:45:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 SJ1PEPF00001CE1.mail.protection.outlook.com (10.167.242.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8534.20 via Frontend Transport; Tue, 11 Mar 2025 19:45:29 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 11 Mar
 2025 12:45:14 -0700
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 11 Mar 2025 12:45:13 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.126.190.181) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Tue, 11 Mar 2025 12:45:12 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: <jgg@nvidia.com>
CC: <kevin.tian@intel.com>, <corbet@lwn.net>, <joro@8bytes.org>,
	<suravee.suthikulpanit@amd.com>, <will@kernel.org>, <robin.murphy@arm.com>,
	<dwmw2@infradead.org>, <baolu.lu@linux.intel.com>,
	<linux-kernel@vger.kernel.org>, <iommu@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kselftest@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <eric.auger@redhat.com>,
	<jean-philippe@linaro.org>, <mdf@kernel.org>, <mshavit@google.com>,
	<shameerali.kolothum.thodi@huawei.com>, <smostafa@google.com>,
	<ddutile@redhat.com>, <yi.l.liu@intel.com>, <praan@google.com>,
	<patches@lists.linux.dev>
Subject: [PATCH v9 04/14] iommufd: Rename fault.c to eventq.c
Date: Tue, 11 Mar 2025 12:44:22 -0700
Message-ID: <d726397e2d08028e25a1cb6eb9febefac35a32ba.1741719725.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1741719725.git.nicolinc@nvidia.com>
References: <cover.1741719725.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE1:EE_|PH7PR12MB6563:EE_
X-MS-Office365-Filtering-Correlation-Id: 71232a53-3dc8-4130-864b-08dd60d54716
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|1800799024|7416014|376014|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?avXwV5fn2xcFbR7gtB/hFyn/CchU6xlJalql+KAI39v1EqBc3TOgFy4IN7Ei?=
 =?us-ascii?Q?W/i1JzUZ+kscqKkGU8adF7w5gMuteqDsfG+niZq5yponNb8xBBwn6+THst2O?=
 =?us-ascii?Q?8lE3EcygZSCQfjDmVNsqji2ztL+GOg3L+MGSL1/6eg174WJWLyOrhuJ1cjMZ?=
 =?us-ascii?Q?fE6xziKMxkxHdBkgP7yZSojhlgXBH0XQnhNXzSgEuD/daRX/FJvmbSv4ByVh?=
 =?us-ascii?Q?uLHWu+tHVgxl2YyGdrpvoEealvEdWZ3Z37+44cbFx3ffbybjmclGEKTU/bfq?=
 =?us-ascii?Q?d6ki0gt6MSA2Udj6CLVDO18sIjuXc8xM50qRbenK2TB6dfF/wCl0tiDG8whN?=
 =?us-ascii?Q?baDWvoY9FQ+Cmpqz60DB7XXfO/F6bdSoBPPcG0JTlUEXw8GfEEJm69cUJB5P?=
 =?us-ascii?Q?7tMdiYMCyszklGzzoCL7MiWqlDgDNTgMYnuu4+uMQzKsC0R5yvwB+hlUJ+wb?=
 =?us-ascii?Q?zTWw9zs7rL4ICzOicjfvkoIR9adUOeDJhzbRlU/sBMAfJqD1r6JoStdRoq+6?=
 =?us-ascii?Q?RcmHCfNyJX+4nEou2Q9gxM1ZBGgbkaqd9GaCSDIMGoJk+KorT38vN70djcF7?=
 =?us-ascii?Q?yOBBC0PHYUkjJJtjww8coGRn4IKBjBuK3W1abFudgzj8rkezizfqBK8FCXsI?=
 =?us-ascii?Q?1HUp+Akn2r55XasFm845KZSnOEf1yr82aTUO6eUHWp2Uv0A/psCuXnBPB/6N?=
 =?us-ascii?Q?DlSdDtdi1gc9lG4mLucE6NZnxqFIhjk1I1oB82qABaxBrxqxDl6xPJpgm18q?=
 =?us-ascii?Q?RmW1/hurqw+Fn3hKnfjdr5FqjG3lMft0w/Z6nZG12jSRIyTTD912m4wFoOYU?=
 =?us-ascii?Q?lFaU3W0VW6vxW4ZeKpRy1pze7I7I3V8WzDSOZm2tAfqw+rGRWqix+HjPws+M?=
 =?us-ascii?Q?6OkC9EOK/qf52iY0XIjXYhUAXalZQaUYgkwieEhQV4yX3Q5kFCjCU6XLTllZ?=
 =?us-ascii?Q?P0pG7NHkOZji1RamoM+a+1kucDJGNofteJW3x4sPPqG6j9VVfMx+w5t6Hadg?=
 =?us-ascii?Q?ijS7N0/xyKBhof3smfbkQJyf4ft1sAtKKQIcfuALz2eYdE94+v+S+XKgAtlc?=
 =?us-ascii?Q?hRD9UNYRqio+HycgDUgpB8JWUG+IBIeWFZoQC13RyMl5kjP6TyywhmYsdT6p?=
 =?us-ascii?Q?Fn/7sSjR9xN0/HKMK7jv4FfEgTFCE0kjUtxQihiT8yLhvS1epBWnO1HTifzU?=
 =?us-ascii?Q?fErkeaJMwdOaq68x5h+ehKWkK51rfHW4q6dZBuhqVZgaO6mbre+kKnHEbBy0?=
 =?us-ascii?Q?u2UsNrpRQDlOC2OiJcyvmoXwaxeTglvPu7UeD7Qyqh6VvQmHlcL7qTfp5o+4?=
 =?us-ascii?Q?pY+oa8SUppPqFW+1tYt0MuwS/Rgbw8kVNQxQH1jjAhzMN3GbLakDuJlskR8K?=
 =?us-ascii?Q?7VTMYAEtnvBi44MIHZV8Kq9ZMA3Z4BoE2ZLkY0Qu/xRtc3qdForQdJWIIfQb?=
 =?us-ascii?Q?FurZBOU5due4njzqAZswnTeAC3xq4w9tgO6s+77qh2FYqz51phLGmQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(7416014)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2025 19:45:29.2968
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 71232a53-3dc8-4130-864b-08dd60d54716
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00001CE1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6563
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_124535_617410_10220CED 
X-CRM114-Status: UNSURE (   8.24  )
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
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
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


