Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E663ACCD18A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 00:06:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3v0/G/vWFpwNFlvBx1Xplw6jWYY18YMwHMSdAL9y5WM=; b=lxIhrx0ftaq+hXREJWXhliTC8i
	Z+7kvjZzNbYL66LzM27zls6UjH/YYUtz9Oyoi3089cr+leg/fNe0Sgbl5SF3ulFAa2NVxdY+vCiC8
	AN1lvVQNhrfwwOvAfJ645E/w5NSqX5fX3WMoKUnFaa2hqMuWHF1IDs7Np/PhwngzsaZMfERhCaNEW
	omobQtjBTAkh+SPd8mwccEwhTAYeZpQ0uLQ5lcdhaafhkRwDPsH0QPj8GzeKT7PqZ4jTqMUOL+4Bb
	XDW+kMsyXMmVUt27CvzX8HEv2YGIc+YlSa4EDubwn1C9HtvmRSCdi2UowBAnlrGRn77IHReveR+ID
	HtsnXKeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v864p-0000000BtMO-1Cxa;
	Mon, 13 Oct 2025 00:06:11 +0000
Received: from mail-northcentralusazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c105::7] helo=CH4PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v864i-0000000BtBL-3NPT;
	Mon, 13 Oct 2025 00:06:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qFg1TXGgLHUflvBajhJvWDP8KuQDakfiZvUPtM1iz/ytdg72p1ntggDbFv5yXOTR4DFZbF/oS90mm0gSXUTXAIkltpA9bnwysgtM2V77MhkWE3klUzryyEzMjmJASgJkSieMPASYp8ACe6TE3W2Q2eOsyuDFP95wkF0oP+JyusH17ZyDMvbBwcKJHiLGqa3n0BIXy9/Z7ObUKqiqnd6uZjJDn84+tPLZ+dOWgWA6jS7R3bVlW5eYrDA3LnPtMhyx+H2jNrvb8KfVM6eO7tfBy6jLjIBEcXM7iPuaKfVXbzXe1FznWiI5KWbWOSarOpJJgOC75sKst3BRb/KIpQwj7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3v0/G/vWFpwNFlvBx1Xplw6jWYY18YMwHMSdAL9y5WM=;
 b=ybhrwsixJYt+ABRHef6WWW07KMX4G6MFyoj9zEgLc403uHN9vfuRzgYYcTeSZWqGVYDaRQ4n8q5vlw3wyGxzZuW/9+LzUAfXCTQXSbQYoJ7+UjHUVtXUdlra3XqmNkmRQK1oR7yNXl7h6VFSjzu5v1pd/+wYXFVcwDKK3uknWSfOfG+fIYSZ+v/3g3Ckdf8eo4DzZp857nfsqNtZh8Rc22niqhc2WJHhatGzcnt4OLv+7E7pz7qXtgx9KEUl75Pg1fSJ4391cfX9Zj9vncKRij1X+SmMh8HrGPamqB3fXiCgfR45mrkLPZ7+cXuvvUcf/Ls1pS4tk0OzB4D+qIjtTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=8bytes.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3v0/G/vWFpwNFlvBx1Xplw6jWYY18YMwHMSdAL9y5WM=;
 b=JLKOqKox2HWEmzbQjA4wmvZE3lp55xVLwOjM+euGWYNcopFA/0OeOUyqBh+SCMDoASf2fXuWhL1ZrRPbEg4ipE2rgTw9RrmMDPmcJ3Q5OjsFfncuHTKm1JtqcryR8iKO4YVVBAuyrqd20nGPWJhSYkPzpfPJnF+5xnrlWY5Fkn2M6R2AdxW4x2O7YIQuAyyZubsC2irNrWZ7G9qUVDvNcCitc+5GH+ftDrmnnI4IKMUxoGCkk3y88gbasMkmzqnI/EyTHM+Y7bB7VN/kNUpgysnsPtDovPw3P4dwX10A76tVXvFjh+tXOBhz2t7uXa5T7ROzdgct2zOw6BryyTxafA==
Received: from CY5PR17CA0014.namprd17.prod.outlook.com (2603:10b6:930:17::23)
 by IA1PR12MB6556.namprd12.prod.outlook.com (2603:10b6:208:3a0::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Mon, 13 Oct
 2025 00:05:55 +0000
Received: from CY4PEPF0000EE3C.namprd03.prod.outlook.com
 (2603:10b6:930:17:cafe::b7) by CY5PR17CA0014.outlook.office365.com
 (2603:10b6:930:17::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9203.12 via Frontend Transport; Mon,
 13 Oct 2025 00:05:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CY4PEPF0000EE3C.mail.protection.outlook.com (10.167.242.13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.7 via Frontend Transport; Mon, 13 Oct 2025 00:05:54 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.34; Sun, 12 Oct
 2025 17:05:31 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sun, 12 Oct
 2025 17:05:30 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.12) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Sun, 12 Oct 2025 17:05:28 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: <joro@8bytes.org>, <jgg@nvidia.com>, <kevin.tian@intel.com>
CC: <suravee.suthikulpanit@amd.com>, <will@kernel.org>,
	<robin.murphy@arm.com>, <sven@kernel.org>, <j@jannau.net>,
	<jean-philippe@linaro.org>, <robin.clark@oss.qualcomm.com>,
	<dwmw2@infradead.org>, <baolu.lu@linux.intel.com>, <yong.wu@mediatek.com>,
	<matthias.bgg@gmail.com>, <angelogioacchino.delregno@collabora.com>,
	<tjeznach@rivosinc.com>, <pjw@kernel.org>, <palmer@dabbelt.com>,
	<aou@eecs.berkeley.edu>, <heiko@sntech.de>, <schnelle@linux.ibm.com>,
	<mjrosato@linux.ibm.com>, <wens@csie.org>, <jernej.skrabec@gmail.com>,
	<samuel@sholland.org>, <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
	<iommu@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	<asahi@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
	<linux-arm-msm@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<linux-riscv@lists.infradead.org>, <linux-rockchip@lists.infradead.org>,
	<linux-s390@vger.kernel.org>, <linux-sunxi@lists.linux.dev>,
	<linux-tegra@vger.kernel.org>, <virtualization@lists.linux.dev>,
	<patches@lists.linux.dev>
Subject: [PATCH v1 01/20] iommu: Lock group->mutex in iommu_deferred_attach()
Date: Sun, 12 Oct 2025 17:04:58 -0700
Message-ID: <f371aeacc81b069f5279fa0e2e8f58afc3902c35.1760312725.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1760312725.git.nicolinc@nvidia.com>
References: <cover.1760312725.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3C:EE_|IA1PR12MB6556:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b9185ca-84aa-4a27-39a7-08de09ec478c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|7416014|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?vN3bJGBS3zeTYl+olBOIhGmJi9yfUmB5qaGsuPfMuTZcVgfm9sMXo4I9LaSK?=
 =?us-ascii?Q?sks4M6VCj1HGRubXgmBby7Oy4AfKFJQFTiOWV4YaOyivXdix80OUCRSDxxtH?=
 =?us-ascii?Q?TmuHxXuOwdHJ/4kcATM5F8fhqE1kEL0CsVW3XaQOw/MSQu/m0wO1k8FEvLqD?=
 =?us-ascii?Q?IvhzfpHb7I9zCExaV+tXWI4owUFCPcelqTHsMe48heLBGzuMj+fQh3COrABy?=
 =?us-ascii?Q?wARBbq2j6AA43s/VStsUm0VFhgSHj26/SQP/eyjI+2Y4BbZbK1WTxbFYviFK?=
 =?us-ascii?Q?W1kTXM6RBCGPGZvVevcXHTPpZdVOGRL6HVg9lEqWBdTuRMV//6b2HW6+Hzpe?=
 =?us-ascii?Q?MuCtfF0dO2b+0jlRcaZ9moNN5cI1ozl3ZRnAh+p/1n6BCcypVy2lzBcKtrDO?=
 =?us-ascii?Q?iyDSkQLaJStjJwDDW/2N1HwtS+Z8xodQRASMoqVSc8HlD6zvPF5JyeEjmnnc?=
 =?us-ascii?Q?aFOtHTjHf/jkDi9bErnB46sfFJfoWVNtLwSbY/u4mgezT2a+KyY3zx0kSPzo?=
 =?us-ascii?Q?uDPr19c+7jEET9bpMDizfEsFKVn8RAUw1sIHqrZETZNaxlqYVAUOus/aAJyX?=
 =?us-ascii?Q?GqN4jnJZoPNmi0Af17IbKq8XG5LP0/Fyv0WB8iqve/BfHjBSa5/1RgS55vvZ?=
 =?us-ascii?Q?+oHI7umtXQKLRhdlJDK0Go2nlXbnJAKn1T3ZoCP2AsQ0Wny1X+VQOIBszYMb?=
 =?us-ascii?Q?eJSRD+Q6vbnY/o+b2T/3MDF+4Rn5HRme5WUAK5ncYfqMKLa7L+AVdqShgkI7?=
 =?us-ascii?Q?LgZX5avVFT3Sxt0d62xFczMaXVP7dz23GZRnnnVlnDwwLB3Tu5fWx10ZSEbj?=
 =?us-ascii?Q?2pQRB6w7nzFPPbZd3300VjFW4dWFk1bFj1BSYlzIBNVZTqGujdxJO6bpmXuE?=
 =?us-ascii?Q?YwO34sSSMFZcTeEik0uektpquzTTrVLPEuFARDYMtxpUIDZOHF7h7EN1RJIV?=
 =?us-ascii?Q?IykmYfLTJ35o0Q+TQbjm8EzoAulv/J51Rmh7H1EvMeVjayIgnzGThJmoBj75?=
 =?us-ascii?Q?h8mLzaj+s8cD+jmoqYZpxixItS7dPVYw4RrSnw9BEmgCbGX8Xz9UY56OCh/4?=
 =?us-ascii?Q?kh1ENnSqCKgqOrr6ejq27/KhybZl/2dxTujSkYlKIZYwdtfwGdeNfhXAXT9s?=
 =?us-ascii?Q?Csxifs6G28tf0KcU74YFe9bIQvmVwZNwzkpRugVIspzI+1RnzZS8tu2xHMSO?=
 =?us-ascii?Q?bha5t/NNV+gEms/VIn/yMxlS1rI0BlPaXDIT+WR4Zw1HhVTdGbkK1pzBTpEp?=
 =?us-ascii?Q?w0zvgPNSu3pp1sR4YL7vW0pqbUXwtKWeiLCU6Af9EXrfT1y8PgF8LInn0pp/?=
 =?us-ascii?Q?26EKYigrnCDWdS54xgkxTu4vkCOPzxheg3HxlsOOuOpaSmSfnmbpDPI7QNzG?=
 =?us-ascii?Q?0UApKNReF3KH26hTZPomfRK4fky7K7zXUoVCSt32TKLGVfoc85lx611b94E0?=
 =?us-ascii?Q?5ExA8uNtvAD8aCcYWFKr7oPWxce82x5YCAJSzAyUk3nq08iZ/8+nnMGEBPRi?=
 =?us-ascii?Q?hB0Owwj9seGqWiHVU/VyE/SMcTUt8OlX/dH7RhoLL5YPpHnGUjQfz1/GJU1y?=
 =?us-ascii?Q?/u7ZM+LPpy0beowxg6g=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 00:05:54.9746
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b9185ca-84aa-4a27-39a7-08de09ec478c
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE3C.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6556
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251012_170604_887474_BBEFBFD7 
X-CRM114-Status: GOOD (  13.79  )
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

The iommu_deferred_attach() function invokes __iommu_attach_device() while
not holding the group->mutex, like other __iommu_attach_device() callers.

Though there is no pratical bug being triggered so far, it would be better
to apply the same locking to this __iommu_attach_device(), since the IOMMU
drivers nowaday are more aware of the group->mutex -- some of them use the
iommu_group_mutex_assert() function that could be potentially in the path
of an attach_dev callback function invoked by the __iommu_attach_device().

The iommu_deferred_attach() will soon need to invoke a new domain op that
must be locked with __iommu_attach_device under group->mutex.

So, grab the mutex to guard __iommu_attach_device() like other callers.

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Reviewed-by: Kevin Tian <kevin.tian@intel.com>
Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 drivers/iommu/iommu.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 2ca990dfbb884..170e522b5bda4 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -2185,10 +2185,17 @@ EXPORT_SYMBOL_GPL(iommu_attach_device);
 
 int iommu_deferred_attach(struct device *dev, struct iommu_domain *domain)
 {
-	if (dev->iommu && dev->iommu->attach_deferred)
-		return __iommu_attach_device(domain, dev, NULL);
+	/*
+	 * This is called on the dma mapping fast path so avoid locking. This is
+	 * racy, but we have an expectation that the driver will setup its DMAs
+	 * inside probe while being single threaded to avoid racing.
+	 */
+	if (!dev->iommu || !dev->iommu->attach_deferred)
+		return 0;
 
-	return 0;
+	guard(mutex)(&dev->iommu_group->mutex);
+
+	return __iommu_attach_device(domain, dev, NULL);
 }
 
 void iommu_detach_device(struct iommu_domain *domain, struct device *dev)
-- 
2.43.0


