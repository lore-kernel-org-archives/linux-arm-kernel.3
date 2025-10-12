Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51096CCD18A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Oct 2025 23:58:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NPoppCKHD8SPZBpqix/l4W3LqITOl3uJs5lCc1U1ve8=; b=VSkeOLg2DQUc5KnXz4Y/36NuAy
	IHOR7wbTH7a6qv7bbIOhsE/yRxw2x4ztNkXs32mTEVa7TFgHqQNUo/zeeW8rqwnq7w02ZjosQBWFu
	P/K2vSYLa9445pazGVLjyslU5bTyoMA8DYW0VZi0f2EDcMyzygd6PcOomF6y9DmHdiv4UM2uB0pv2
	PlWPTvvdSwN4it+GIxGHx5hXRRfheJI+gxUMu94rWNi161s/BIdAJuHzLQM0ITCrVX264okWIrd30
	fa1eEJVpQeO7CZjuKonF1O6xtK8a4Nu9tNGjyMzpEq4hL6RmMy6QA/RzjDnWlg1OdnLJmL5kVXmzB
	pK9EmPVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v85xK-0000000BrQz-1ADM;
	Sun, 12 Oct 2025 23:58:26 +0000
Received: from mail-westus2azlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c005::5] helo=CO1PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v85x7-0000000Br8G-2fJk;
	Sun, 12 Oct 2025 23:58:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TrwMawDWQuymroLz9lHNG+8E5EOH3jehcfFjyh9DGUPX9whBQbfY8EwoXNb2zm5zO5UZTRVqoSYLgQulfsYoieSbyyBy4AMo1QEvVKF3gtnuwX8Eu9neySFzAUzjerA+rsQJgH/tjWH4w9/UFdsxIXoYPJMMF9G9a2R83de/NZ1tmkFl5Xgcm5ldcB81QC4cF2AutQoMBGm0brOizaFNAGDg9L0DeuLmwB7pEUPf1YfXvgqJ3jMMlktA4Zqv5pOKzJe0Ed0ketFkKLUN7VX1W+JVU+PD2YU7A/ukMC9ZS9FnISgxCCmG/jdmukbAiiFyalK65s5phUGf7PzT5OpNag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NPoppCKHD8SPZBpqix/l4W3LqITOl3uJs5lCc1U1ve8=;
 b=CGlbli/3uDu2qxzJ3AVI6pSVR7VaIaWWTMme6BBkbBRnSKJUedyUC/Oe1uuCxIJg7R03MxHTijdnVxVDYk3TqjYvZzBql65A3mhI50sKmnrPRXQXqzaaCi6gR7XkQF1uVNYyRWw1ssXz/YYpv14J49ZRJG+ux+ZycbvBi0mb9FYwnF+ahV336RKQ5S9YcFShcxOKGYnwAKu6PqydqzYtAIDL3xaJK4ft3IVYpvQ+n/I/6GcPpD5go1Q8awqBY3yYqgNUcg4Drg09ln2T7xLtsBWqsD+JGCsnTk3IkWTweXfv30v3J+wSM9XsETocBJAd3ZkwiIT7FcXP0LenNqW4Nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=8bytes.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NPoppCKHD8SPZBpqix/l4W3LqITOl3uJs5lCc1U1ve8=;
 b=LsJWqmSpCMW15XT5WNKQApHSHNDYRxNsNbcsYrvdorpLTGswS9FCx3sNJyrj9vAPM9G70KeGbSh9khdi8smDSxC62m4Pyr9nNInCrx2RPG5xMEYwmBFnvrcDYAjvckl2I2x6Ba6pRNsStPV9eHBmqhOW+6JvyJdXK4skXxVa+lKoiASUKtUhOTiUvTfQRYL1mkdVG/KlgYMEAV8En9P5cCPHQNfMXGbfAetF2mBpQUIDdz0b4FARlKbw1PWIcxVChhAO8GvRVUaBWFgrLAVJeOwCBsyMVkAFe+S9dJt2ChLB0tR1qSll7C+5zKdH/eJYRH60qFr8JmEmdLhzSlq8TQ==
Received: from SN1PR12CA0070.namprd12.prod.outlook.com (2603:10b6:802:20::41)
 by DM6PR12MB4075.namprd12.prod.outlook.com (2603:10b6:5:21d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Sun, 12 Oct
 2025 23:58:04 +0000
Received: from SA2PEPF000015C6.namprd03.prod.outlook.com
 (2603:10b6:802:20:cafe::89) by SN1PR12CA0070.outlook.office365.com
 (2603:10b6:802:20::41) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9203.12 via Frontend Transport; Sun,
 12 Oct 2025 23:58:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SA2PEPF000015C6.mail.protection.outlook.com (10.167.241.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.7 via Frontend Transport; Sun, 12 Oct 2025 23:58:03 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Sun, 12 Oct
 2025 16:57:59 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sun, 12 Oct
 2025 16:57:58 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.12) by mail.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Sun, 12 Oct 2025 16:57:55 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: <joro@8bytes.org>, <jgg@nvidia.com>, <kevin.tian@intel.com>
CC: <suravee.suthikulpanit@amd.com>, <will@kernel.org>,
	<robin.murphy@arm.com>, <sven@kernel.org>, <j@jannau.net>,
	<robin.clark@oss.qualcomm.com>, <m.szyprowski@samsung.com>,
	<krzk@kernel.org>, <dwmw2@infradead.org>, <baolu.lu@linux.intel.com>,
	<yong.wu@mediatek.com>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>, <tjeznach@rivosinc.com>,
	<pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<heiko@sntech.de>, <schnelle@linux.ibm.com>, <mjrosato@linux.ibm.com>,
	<orsonzhai@gmail.com>, <baolin.wang@linux.alibaba.com>, <wens@csie.org>,
	<jernej.skrabec@gmail.com>, <samuel@sholland.org>,
	<thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
	<jean-philippe@linaro.org>, <iommu@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <asahi@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, <linux-arm-msm@vger.kernel.org>,
	<linux-samsung-soc@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<linux-riscv@lists.infradead.org>, <linux-rockchip@lists.infradead.org>,
	<linux-s390@vger.kernel.org>, <linux-sunxi@lists.linux.dev>,
	<linux-tegra@vger.kernel.org>, <virtualization@lists.linux.dev>,
	<patches@lists.linux.dev>
Subject: [PATCH v1 3/6] iommu/exynos-iommu: Set release_domain to exynos_identity_domain
Date: Sun, 12 Oct 2025 16:57:39 -0700
Message-ID: <56175bec385d24af9eb2a38632e1d6ce889025e3.1760312540.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1760312540.git.nicolinc@nvidia.com>
References: <cover.1760312540.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015C6:EE_|DM6PR12MB4075:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f7ef840-c66a-48ba-6ce8-08de09eb2e97
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|376014|7416014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?O5ON+E57VtgaAvyRQrKFuVui5tOCkGZ2emh2s9achGkNkEjFgq9njENeor71?=
 =?us-ascii?Q?l4gP+TM5N2yRLQha1zcClg2MNvB8Pqis33thqTjrSG73S3MtuzfLqx5/22Rz?=
 =?us-ascii?Q?TyMDZBl2GGAEafO1zqwOSdKeefAhY3C881BiC5S/Ksa8hygjllriRpUNeGx4?=
 =?us-ascii?Q?MD9b+eZifZmP450ygGZhDKppLCNIo9bvaM2uhT9DxQMgw9Rkk7zFqrGj6cH1?=
 =?us-ascii?Q?54vDn0hqofO2awmRAHv2vnmC1y4WbdE7vPWXvvxff9D+zGBZc82i+JSOhd9x?=
 =?us-ascii?Q?+PCDUPPdl/QDXA6OugU2ik26odN8lYxRohPyFuNAG7vCz5B6R97tHRpEtdrj?=
 =?us-ascii?Q?Kp1nkteYRriEQklmW9iDGQrBNaAGJpBRaVaKy7OBfa4To1XQh3S/p8uGlPIZ?=
 =?us-ascii?Q?lF19evy/68fgkADRQzGF2x9GHanE5CEutQorCGkeEHsDFttCFRVmmQ32dt5z?=
 =?us-ascii?Q?Ip39Xqn93FiOoACVv8bS3nnOaJJORTukE02PbSpBVSVdtpFbtUr/cKpEsv4k?=
 =?us-ascii?Q?9cc4Tzd65tmiNNi7u4FfHJNjLVQoa56tHjRTRPtA+qLd+osmIz1hLa+28QqF?=
 =?us-ascii?Q?Rg2+Gi6ks0GyLvFa25aDN0i14o3Ovf31XgU2MpQnRSwGp5UGYrYlSrklKGch?=
 =?us-ascii?Q?s0I6IDgxo6H9haVQLRxs9Pe/ZV4N3ByaCOy7wihniUK+c2Dgg76WaWOIZP5E?=
 =?us-ascii?Q?GNg4bV2Rx+U6nRmuf6YcFXDQ6hg+Ta8mybTqKBVya9D8hpyRgcd14qRvXbGm?=
 =?us-ascii?Q?zYfKqphMkNmAUhCk6NQfreyl1WTWpRnBza9Nid1VZ0P94Y8o7TbqbRPLqt5x?=
 =?us-ascii?Q?3l6gp3g3VaMe/lQd1DoVBOCAs2OAMPmq5QSP7OQy3wWL9tYtVG+5lw9IA7NQ?=
 =?us-ascii?Q?JoTObAFYkc7szdgojywmNZ1Ee8t9SZgF+yh1/7c7jQwZP3K+uUUp/SSX0pNA?=
 =?us-ascii?Q?LNb3wNCtg+alw55sITMrpnPTbKMHi4ksVuBHFWX3ZwH6FH3WHTX63xSpvlpt?=
 =?us-ascii?Q?z7DE1mHx3qOHcoJIQ/N/UfqpOAyhdqMYJAD4sDlpYZSLGp/2GZyrxMDRFFuK?=
 =?us-ascii?Q?/SA39M2/plBY9KnasGSlUkdhex3OIrcvv1jv8d8GZqYfz30nsNt5dIDINGHL?=
 =?us-ascii?Q?IzUPjLzxxLY2VY8yJ2oai7Ohmg1zQi/6UI/KCiHlhCcSWGHy4LmAOPrSvXH4?=
 =?us-ascii?Q?5zdAKomljAhNOmGy0miFO949/IBum6hS48Bx8U85jNY5ndAjuk9twZUVQDQS?=
 =?us-ascii?Q?xBFLjPxLRtIqLufyH5GCoyJZWsJbEqF5vplUGqj5jLJ6D4zVZdXd+b1irjrZ?=
 =?us-ascii?Q?Sw87bkA/Sm+hN5aRvdysxuNMAcQAKheAgr+lA3WF0aFQ3QVEMHJ397s9BWBY?=
 =?us-ascii?Q?65OsuDpwaexSyB0qRjJfXouxi8JkZLxcohxRofZKj0ktZ96gmqNLiODwX6sf?=
 =?us-ascii?Q?h1z8smqWpm+3tVfv1D9h3Swx/A1d4YJiKXeiBa5gb6Q4tpvnhomZkyXCfsv+?=
 =?us-ascii?Q?QIYpyS08gHCHnyyYosWEXiU0DUByNeOSfrl2QN4Jz4C+Lw6K3zxx1UOS44p8?=
 =?us-ascii?Q?CdNUFH1a53l5PRhvwZA=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(7416014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2025 23:58:03.5731
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f7ef840-c66a-48ba-6ce8-08de09eb2e97
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF000015C6.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4075
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251012_165813_703821_900FD859 
X-CRM114-Status: GOOD (  11.50  )
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

Following a coming core change to pass in the old domain pointer into the
attach_dev op and its callbacks, exynos_iommu_identity_attach() will need
this new argument too, which the release_device op doesn't provide.

Instead, the core provides a release_domain to attach to the device prior
to invoking the release_device callback. Thus, simply use that.

Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 drivers/iommu/exynos-iommu.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/iommu/exynos-iommu.c b/drivers/iommu/exynos-iommu.c
index b6edd178fe25e..0857519ca7188 100644
--- a/drivers/iommu/exynos-iommu.c
+++ b/drivers/iommu/exynos-iommu.c
@@ -1429,8 +1429,6 @@ static void exynos_iommu_release_device(struct device *dev)
 	struct exynos_iommu_owner *owner = dev_iommu_priv_get(dev);
 	struct sysmmu_drvdata *data;
 
-	WARN_ON(exynos_iommu_identity_attach(&exynos_identity_domain, dev));
-
 	list_for_each_entry(data, &owner->controllers, owner_node)
 		device_link_del(data->link);
 }
@@ -1476,6 +1474,7 @@ static int exynos_iommu_of_xlate(struct device *dev,
 
 static const struct iommu_ops exynos_iommu_ops = {
 	.identity_domain = &exynos_identity_domain,
+	.release_domain = &exynos_identity_domain,
 	.domain_alloc_paging = exynos_iommu_domain_alloc_paging,
 	.device_group = generic_device_group,
 	.probe_device = exynos_iommu_probe_device,
-- 
2.43.0


