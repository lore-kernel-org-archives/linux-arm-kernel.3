Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 807FBCCD184
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 00:08:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DWGKQwdXarsgZqBcDhfjyGfWCe043TnNGtHvVfgtb6U=; b=wQrMefN7pjdlRgOFzRsaFF5Ksj
	4rK8I54JhTqgFanzaW+sV15d+rks8Jw3KVk/sLhdQFN355+5HiwFASQfS0uq21s7nG7qAsJAd8XLd
	FW95lD7QNBpPyl3QcBDFTL4VBs1Umk9g5UGm967apBEmWnoKqSAgs5gGvwNiDvU3/2ooUzdZ6YGnj
	X4OLoBgTAIEVP+2/A/a9y3OTKWUmYn8ONm2BImjEPgJ5uaSvApWb8GnJjPXHgPhkOir5Z5xXNh9ey
	CNCrB+SVg5faWQkQl1pvF13ltF+ChdHZomHOtZU//vVAqB0hz1+dbc35xSpReksE/LhvX9yNDgA8a
	cMqEW61Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v866V-0000000Bw3y-3PcM;
	Mon, 13 Oct 2025 00:07:55 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v865E-0000000BtuC-3CpJ;
	Mon, 13 Oct 2025 00:06:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=DWGKQwdXarsgZqBcDhfjyGfWCe043TnNGtHvVfgtb6U=; b=WgK7pNlsInNQ+BbZvcUDToRLGE
	tswEEWxwfcEvSMJb3ByhT0LhB/u347Hf0va2H+a6NKFfRTO+b9aoZ3wJrhDLiqJabqpPfszabhuKa
	jvizARv+DG0fHZOi+yYyYVkvTFaPwW+GKfVXizYvyZRMBDMaMdtOhFinsb/71/B5HeK1fswIt1izt
	fDnIHgibDP7Dv8VsFmDkd37YNf38gsz11347VIhu/ehRSdRcU/glFR9YcwAfqbHW89uRZOkxfgQt7
	yilquoUuZZQ0raFJ5zjJ7NS9WYvlfshr5O/vuBlR+wV3X2HQEqdK+L1H/CbYbGMXFRvGusQP+Sq3x
	WJWbOnMA==;
Received: from mail-westusazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c000::1] helo=BYAPR05CU005.outbound.protection.outlook.com)
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8659-0000000BExc-10G6;
	Mon, 13 Oct 2025 00:06:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YXgakykuBinN8SWpPnzoG9h3enORXjlObqMTpwz2RYBfkjPscZr0DFqZNtLUgRAIxWc0lhulLOvMOslmKYY3ylSuoBauSZyfzOHYApJx+nqKUDwwLvWqVcUP4z/qpP9L2FZl5HRDfTa2m/bocovBdygV3p2PFeBeZlxc64jmrHkPUD/mhz0NN6neUodv02X3kq9VJ7mQHCgqssm1ZsVtLLZW951UVUmw5m769erw+S+uUxXffHbSujWSS6j5v3MiPX0o9vdUhSArOI9qhlKhqboqXMG/IYF5QFnk1yRQX8cXTXEreEY7Gl+mRHDP1FKTNYzLxxp9MkuT0pWrhCep/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DWGKQwdXarsgZqBcDhfjyGfWCe043TnNGtHvVfgtb6U=;
 b=GAki4aTWz4KlyWDtudPSLg9u26mZ6y9nnFuLm+hiCqwJ3sOyLLB6zPnSgJS0DmilkAJZmE7dVA1srZRGqWRcWzoU6vcc8xdCSnvtT4C4pWx6ktCV1WDPznVzT5nA0wqgSXp13ejBTr1VJwxu1BjdaYLVkLXoM9MmhA4nq1lRwSnFH3M3ItclB67iRPW0VKc6GFPdvXrBs1HNJCKpII9rNvFBjiw4+Hb5lKHrcjBZbE9oP2GMbeScvY603vsq/M1GnzDqoIqE62SmOgd9LiIJB21S8bPHCLd+Ln50CZnc2+0bsuJg5OEH63jvMuULSI46vOuv7c37PUZwuvJI8D+9uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=8bytes.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DWGKQwdXarsgZqBcDhfjyGfWCe043TnNGtHvVfgtb6U=;
 b=OiABGYukCFw8bobJb/nW6sVZsWcLtRJznC40SENrisp9+1gdvtaV0ysnYbj7gfAYKCoKA1eyG7TX2+12sYOWNyUt9fDWlh57EMKo+2/l8YYWcJ2SxRnIm735rHzBjJJehx/Juioisq22W6xm+do+UhaJjVg+jBZL9/QbLcBWfa02lSGFS2nLdE345O7s7GQMvkPeDoq7l5O6mV0zvUSeTANmdkGtAueKd90su1F0mIJvMBz2u57rl76gyUGTw7fVfUYNodwGLrUuhWhtQjhodBh0ioDidl0rXrUfhAPBvPs4cGEMLUwMK62Ujn85idXP1QqUVjTie7qltd4Z+8onZw==
Received: from DS7PR05CA0037.namprd05.prod.outlook.com (2603:10b6:8:2f::24) by
 SA0PR12MB4383.namprd12.prod.outlook.com (2603:10b6:806:94::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9203.12; Mon, 13 Oct 2025 00:06:22 +0000
Received: from CY4PEPF0000EE3B.namprd03.prod.outlook.com
 (2603:10b6:8:2f:cafe::36) by DS7PR05CA0037.outlook.office365.com
 (2603:10b6:8:2f::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9228.9 via Frontend Transport; Mon,
 13 Oct 2025 00:06:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CY4PEPF0000EE3B.mail.protection.outlook.com (10.167.242.14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.7 via Frontend Transport; Mon, 13 Oct 2025 00:06:21 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.34; Sun, 12 Oct
 2025 17:06:08 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sun, 12 Oct
 2025 17:06:08 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.12) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Sun, 12 Oct 2025 17:06:05 -0700
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
Subject: [PATCH v1 15/20] iommu/fsl_pamu_domain: Implement fsl_pamu_domain_test_device
Date: Sun, 12 Oct 2025 17:05:12 -0700
Message-ID: <a54211182e22db598b2a26f589e8f5f34ad78f98.1760312725.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1760312725.git.nicolinc@nvidia.com>
References: <cover.1760312725.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3B:EE_|SA0PR12MB4383:EE_
X-MS-Office365-Filtering-Correlation-Id: 648676e8-fa86-4032-ba1c-08de09ec5787
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?cjKGuBkhvATy7P5wvlyqpU+4kWPsr++cvALZcrMgzZFimlnwyZAoFf7DoVU1?=
 =?us-ascii?Q?n9WKfJ+5VYrquRHxkubNTRmPXX3d3zLgSFq4HJToRc8+gYIwZ4R2MDY9qgtW?=
 =?us-ascii?Q?RbHZLIHFrNEH0filGdROHzuebd3IPj4CteKKu6HrBWlQUOXFOyrttXqvS78Y?=
 =?us-ascii?Q?Z4VuexamY2f5z9X7bZeDSpyuocDebAS/bKVknqsHceDHl+GCgjht0AGEAeAp?=
 =?us-ascii?Q?7bqbOdq8SKCuQuHPtpNcvk0vSTZh+W3bnJX+TRO3rKP53OQyPPdUq7A/orYF?=
 =?us-ascii?Q?glCvvjGr6xI6XlzhKOFRhEtBjHUEIRyUIrGz0DR+FVJ9nUQH6zjZ7XhVikz+?=
 =?us-ascii?Q?oieZ/USCvMMzbRKE4GkX3LT2OSgCz6Rv1nYHMfWHLV73qMAd1xu/2VDNwGBh?=
 =?us-ascii?Q?w/iTuqvplwcTJRWc91yjT0qHT+98ro8ySCDF8F2epV/8Qz8V7rff2gJFiLm2?=
 =?us-ascii?Q?ROeY8MrdozaOBJrzUnvi2ElmLwWzh3+cXbPS9CU05TikLidRtDuDtVyaD6qQ?=
 =?us-ascii?Q?jgLMoF4P2HHTpZ72Yo9Hg441jGSCqNiCUA64pgSwugqLZKhsXMbg0E1m/AjL?=
 =?us-ascii?Q?/aq/5QMacmv4COEkdFeUozKRKMaTbpDKxO7i61kS79Ub0Nhs8HizQcddC8YJ?=
 =?us-ascii?Q?ymezPHGTYo0V39cbdnYPH5x6dHGGYdSfWMiggnFjD7YQECeRU25e71EAZrsA?=
 =?us-ascii?Q?okaeBCSz7lmNmgy7EKiw8O7erFwUX3A+vGW65tYUcN8jmlgjOC3Z+YjXqUzt?=
 =?us-ascii?Q?ztZ0jPEQNvieaviggQsSHY/GJnexdxaSfdkZohRdvtjtEa5QKc+//Ixwec5z?=
 =?us-ascii?Q?9dfnRzU2Tw/Vz5uRPYCO8WqCpvtE3PXHTAXKTx5uL8hxtaWiJ2OsyIwnysIo?=
 =?us-ascii?Q?6nMdSPPflOqIZ7tJ1IE/P0NLpPzIMHAYupGeFe/onUkKSH3yrzPIhif84WAk?=
 =?us-ascii?Q?xDyqOXtV2GIS0j4Pj7Cs/ThUJGlfuiGFo2esz2Z3TrUJiwhlalvsP4xlsWZ3?=
 =?us-ascii?Q?adcbIm9YZJQcxPSgNf8w5LwgEzeUfMwt519DbwgefB+1fwBDfaIYP0A9Jjxq?=
 =?us-ascii?Q?c4yoG/Cm7JmDy+OhevmBynLv3uiVA7WjENz6kVTykXfwu0RrLNKCYTEVCel+?=
 =?us-ascii?Q?RXuykEB125StESaw5ISxA7nkG+3axua1KK/odVa7WY9qo+B7imnW4u2AhRBO?=
 =?us-ascii?Q?B4PESwZ52u9ZUk291nDrAv93bVS9jyo7Pi3mVi8ReL6lilbm175ZdwQFqEk8?=
 =?us-ascii?Q?aZFCI0pu1czQBW3vP9akmPrN3wnlGV54lpkjdFn/3YMo2r5XyUqYQSf5fWSt?=
 =?us-ascii?Q?p2xQCmyd+rfzIu4Rv9HaSwp/FhnUZZzPviBj4dIkwbN1UcAwu0XU2dK4O1zM?=
 =?us-ascii?Q?+oC5hxqXJUBYeUHlbB1koPiw6ylT8RJVpKtFI3B00coxLeF3UQ1hJSo+uJP8?=
 =?us-ascii?Q?X+WdLwZ1x8jWhzV0eC2NAj6TFsd4OR8zyIZzvXnKxZoIlqpln5lXNDCH4iv/?=
 =?us-ascii?Q?XynDHplYZKI6sqARh8GZ2gRejhmupITntoarT9R1sKMQlWRjQ+PLjG5Q0y1e?=
 =?us-ascii?Q?f9aMZ1I4Wuy69dqgyks=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 00:06:21.7879
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 648676e8-fa86-4032-ba1c-08de09ec5787
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE3B.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4383
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_010632_546457_EA833043 
X-CRM114-Status: GOOD (  13.49  )
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

Move sanity and compatibility tests from the attach_dev callback to the
new test_dev callback function. The IOMMU core makes sure an attach_dev
call must be invoked after a successful test_dev call.

Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 drivers/iommu/fsl_pamu_domain.c | 50 +++++++++++++++++++++++++--------
 1 file changed, 38 insertions(+), 12 deletions(-)

diff --git a/drivers/iommu/fsl_pamu_domain.c b/drivers/iommu/fsl_pamu_domain.c
index 9664ef9840d2c..fbdaa74936394 100644
--- a/drivers/iommu/fsl_pamu_domain.c
+++ b/drivers/iommu/fsl_pamu_domain.c
@@ -237,6 +237,43 @@ static int update_domain_stash(struct fsl_dma_domain *dma_domain, u32 val)
 	return ret;
 }
 
+static int fsl_pamu_domain_test_device(struct iommu_domain *domain,
+				       struct device *dev, ioasid_t pasid,
+				       struct iommu_domain *old)
+{
+	struct fsl_dma_domain *dma_domain = to_fsl_dma_domain(domain);
+	const u32 *liodn;
+	int len, i;
+
+	/* Use LIODN of the PCI controller while attaching a PCI device. */
+	if (dev_is_pci(dev)) {
+		/*
+		 * make dev point to pci controller device so we can get the
+		 * LIODN programmed by u-boot.
+		 */
+		dev = pci_bus_to_host(to_pci_dev(dev)->bus)->parent;
+	}
+
+	liodn = of_get_property(dev->of_node, "fsl,liodn", &len);
+	if (!liodn) {
+		pr_debug("missing fsl,liodn property at %pOF\n", dev->of_node);
+		return -ENODEV;
+	}
+
+	guard(spin_lock_irqsave)(&dma_domain->domain_lock);
+
+	for (i = 0; i < len / sizeof(u32); i++) {
+		/* Ensure that LIODN value is valid */
+		if (liodn[i] < PAACE_NUMBER_ENTRIES)
+			continue;
+		pr_debug("Invalid liodn %d, attach device failed for %pOF\n",
+			 liodn[i], dev->of_node);
+		return -ENODEV;
+	}
+
+	return 0;
+}
+
 static int fsl_pamu_attach_device(struct iommu_domain *domain,
 				  struct device *dev, struct iommu_domain *old)
 {
@@ -263,21 +300,9 @@ static int fsl_pamu_attach_device(struct iommu_domain *domain,
 	}
 
 	liodn = of_get_property(dev->of_node, "fsl,liodn", &len);
-	if (!liodn) {
-		pr_debug("missing fsl,liodn property at %pOF\n", dev->of_node);
-		return -ENODEV;
-	}
 
 	spin_lock_irqsave(&dma_domain->domain_lock, flags);
 	for (i = 0; i < len / sizeof(u32); i++) {
-		/* Ensure that LIODN value is valid */
-		if (liodn[i] >= PAACE_NUMBER_ENTRIES) {
-			pr_debug("Invalid liodn %d, attach device failed for %pOF\n",
-				 liodn[i], dev->of_node);
-			ret = -ENODEV;
-			break;
-		}
-
 		attach_device(dma_domain, liodn[i], dev);
 		ret = pamu_set_liodn(dma_domain, dev, liodn[i]);
 		if (ret)
@@ -434,6 +459,7 @@ static const struct iommu_ops fsl_pamu_ops = {
 	.probe_device	= fsl_pamu_probe_device,
 	.device_group   = fsl_pamu_device_group,
 	.default_domain_ops = &(const struct iommu_domain_ops) {
+		.test_dev	= fsl_pamu_domain_test_device,
 		.attach_dev	= fsl_pamu_attach_device,
 		.iova_to_phys	= fsl_pamu_iova_to_phys,
 		.free		= fsl_pamu_domain_free,
-- 
2.43.0


