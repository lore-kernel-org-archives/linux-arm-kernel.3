Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E831CCF9EB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 06:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gSuAIySYthgInpfZCWj25AM74uRVY8JMnX0CfDzGlWk=; b=r5sMsRMZRrUuGykxUeldH+11Kx
	fLT7YcuKqvWtxPwxjJa2TxRqjShvBx8h0Ejq4frp8V/lqxWq2/lJ4O3s2xiV5CB4x+hzFz6ReNcdt
	6A/LRvzk37G7xWDN6UqynF5F27F26kyO/bXOuuDk2BDK21Rkotf5VjSOnrAm6CFbU5uA4gCt5gMGo
	tgp3zb6rv1MzmPBHJ5GwRGSlrc4sulkjkyPRGF7ZMtzBF8iMUQX64bImqJ1Zlrnq4UWwZ8Nn3G4bM
	Kb89UPuwbhikgC9uiMswpR34yx2C5VJdQ8Q5qgzFPKwlhss3w3dgx2pMR4hmPjM4U3H3uX8MMmNm9
	w9fjWilQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEieX-00000005Tli-1EiM;
	Fri, 31 Oct 2025 06:30:25 +0000
Received: from mail-westus2azon11012021.outbound.protection.outlook.com ([52.101.48.21] helo=MW6PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEieU-00000005TlO-07kT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 06:30:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QiOGCv96jeTWLlRBAEQmomiwMCuBGIj3HYsVS3bVrDYjAeY2SzJi4hQRfqJVa1hZAFpjblpFiF5j5tBa+5vs1J5GQkLpWFJ/kdA+fv0oKXi/M+DY+OltGxB2gZeJAIQHZA1oIXa/nm2UqEI/2nu/IBk0UYcf5B9KEVB4wNRO295gkOs85dNk8jsTK3c+eAixYZY36ixICe5bgsDhQOwlH9nEdAZ5tjQ59cPTTPvLoyZLxaPlyWIzGismDdc/sK1cJ0B+6TOlVGJ1uqzkaIKQyD98qzvgCrZskTuz4L1etXHheTKach3fwCoBtcWFafVQGtTPxLm/KZx7+8SytvBsqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gSuAIySYthgInpfZCWj25AM74uRVY8JMnX0CfDzGlWk=;
 b=u+Dg+gfLhwGjbtZ2ZdQJ4DHPM/rsXBOTL4YZA92sHUekwCCqQ5PLrudr4HcQJPbpOBFxgE4JIwNxoDTj6tyNnf5A5Z9LsUMx+vBFiGBI0rSjrQ9/lyQGRaSaooRz/q8KXUXrIW7txVNPuWrlcxRwaHOFzngAwrH9Meevo+tSH5uYIcDgPJUsrRz7Ds6pV0b9TkbL77rAxkVdPAYmCyMU+S4i4pYwnLhGlzXvR4r3CF/yzwtG5rJ2v20rEoomcrI6+robvspErC+1O+tM0uh6jvJdEr3QNRljGn1enh45KGlyAgBffp8H3TOPwIs4fwntbMsbu9B5ov7cL77eN7qDqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gSuAIySYthgInpfZCWj25AM74uRVY8JMnX0CfDzGlWk=;
 b=E+rW/7oEcFMgU3Lcq7p0DIPNNTT3jqDlTIvvPPk1/CC6gKMajCyb4uwGV+0HBKJfHTTuS1ALm/ArwqwpoklALUffyfafgF5ZYAWJj+CUz4Zv9ux00lQCxk6W+UbJiWWKTLFHR3S5Q2gXY3oVOniFU+cZFVuUlLtgqg92PJ7QBTVuYgFMY1SHBEsaABNI8g5iB68eNEybeFrDXQkRZQoOVpG5zECo/IARfn6f0fAykc3Vkr3/NHARL3rnrmA4RYnTlxXM/w3m7TovZCs6LzOHMjO+/Ie56pPJ/ec1Fa6YoCf6f5kBOLAjA0cR8gfSa5TygTZJVsz9mPTdKZA47kBfog==
Received: from CH0PR08CA0023.namprd08.prod.outlook.com (2603:10b6:610:33::28)
 by CH8PR12MB9840.namprd12.prod.outlook.com (2603:10b6:610:271::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Fri, 31 Oct
 2025 06:30:17 +0000
Received: from CH1PEPF0000A34B.namprd04.prod.outlook.com
 (2603:10b6:610:33:cafe::e9) by CH0PR08CA0023.outlook.office365.com
 (2603:10b6:610:33::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.14 via Frontend Transport; Fri,
 31 Oct 2025 06:30:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH1PEPF0000A34B.mail.protection.outlook.com (10.167.244.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Fri, 31 Oct 2025 06:30:17 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 30 Oct
 2025 23:30:05 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 30 Oct
 2025 23:30:04 -0700
Received: from build-amhetre-focal-20250825.internal (10.127.8.10) by
 mail.nvidia.com (10.129.68.9) with Microsoft SMTP Server id 15.2.2562.20 via
 Frontend Transport; Thu, 30 Oct 2025 23:30:04 -0700
From: Ashish Mhetre <amhetre@nvidia.com>
To: <will@kernel.org>, <robin.murphy@arm.com>, <joro@8bytes.org>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<thierry.reding@gmail.com>, <jonathanh@nvidia.com>, <jgg@ziepe.ca>,
	<nicolinc@nvidia.com>
CC: <linux-tegra@nvidia.com>, <linux-arm-kernel@lists.infradead.org>,
	<iommu@lists.linux.dev>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>, Ashish Mhetre
	<amhetre@nvidia.com>
Subject: [PATCH 1/3] iommu/arm-smmu-v3: Add device-tree support for CMDQV driver
Date: Fri, 31 Oct 2025 06:29:57 +0000
Message-ID: <20251031062959.1521704-2-amhetre@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251031062959.1521704-1-amhetre@nvidia.com>
References: <20251031062959.1521704-1-amhetre@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A34B:EE_|CH8PR12MB9840:EE_
X-MS-Office365-Filtering-Correlation-Id: b3cb525a-b536-49e5-cde4-08de1846f514
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|82310400026|376014|1800799024|36860700013|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?rg1p4h0evvpjDT5OflZLuwGvPrXbyJhkxd9QbyKj2TUgWp9ZlsOpQYDN3WkA?=
 =?us-ascii?Q?I7vLBH3SbS1+1Iasa2oPHphhhxr8mWBTgLoBb7QrhprV+xwn3Zf8MXT49Bne?=
 =?us-ascii?Q?/hvC2hw9g2A/QGlvNyWcCiCjTGYPFg1opuUaxzfjaX1IoparcRIGCJMf6We8?=
 =?us-ascii?Q?AyNAvNIFiUaNWSUj1suunXyjg63ZzayIgJDgW206Gu/g5HtBZkGRlIuvBnZU?=
 =?us-ascii?Q?U245/tpQSAhVrMlnfz524lDv30SMqRo5wVqimmOMDoZEl8/9L9F880EKzcS9?=
 =?us-ascii?Q?+reGAvAEW2FG0aBw+tccexc/S7+m2BjNeRX4CLndDOulj3yrhGy3H/detMXR?=
 =?us-ascii?Q?2HMpqO8j0giQmlawOgOOUVJLCKn/4Q/fj/+t/ASM9IYlavye1mZp4nWd0Una?=
 =?us-ascii?Q?qVprlyLrV/vOKvySvjFZ8RL4L1RSV6WWni3HQZI+/gBFWlE2atv6/Tb3fWiY?=
 =?us-ascii?Q?pAUZjHD9ZUt/SoaqUIY3SWGZDijwh2ObBhKkX03XKI4F9jjz12gKoUg3HDvc?=
 =?us-ascii?Q?onJGSGs6HoxUlbhdSb//70sw1h1RWUOUS0juQAnb/OkCBIOmjlqlP1FareKA?=
 =?us-ascii?Q?KQwynE8ByRB4AHKZmo9TtJujtATdagqd4dkg2rFlxnRb9mV+vaY1bpg7ADPT?=
 =?us-ascii?Q?BjLkCp7hfjHXdHgDjC9KU/KVO1LKO1QNFvJgTHnuiA9vYmUUHlr5kNDsClDU?=
 =?us-ascii?Q?ikikoPaFOOglce2376egtDemjZtLuqb3YmWcVDZgSfGxAiOX1yYbrexe4U7u?=
 =?us-ascii?Q?re8GgnpPLTVCmLwQPavYWEcuwH1bWNpbCcESJPkacO9j2CqIzvCcouDzdsr+?=
 =?us-ascii?Q?PD3zTaUjVVwb+dV+Vy1PChmjqjGeoGBLsa23UCJ/1D7yp5rOvqreW7owyaU6?=
 =?us-ascii?Q?ibYEgSIk0bjGNuERK1NYmivey/jfEQdXrysrDpoHp3KfvIgfGWmG7yug4xhG?=
 =?us-ascii?Q?BFDSmfxWLk0/gvtv63Y0Z8nTwoPnwAaVCGTo41Q89BbO1M+QO8nmEEmKkKEv?=
 =?us-ascii?Q?mUEqmARd2EE8nQA5L0npPXnH5AOwVruwcZ9+kmU0nTtrDe8aLaptRlmhhNF1?=
 =?us-ascii?Q?E0u70oXXihDzHaGkQKNBDNLNncVmb4WdYf7QOXfnzjE//ohzrFda15QcsaL1?=
 =?us-ascii?Q?pOY520Jk+Ft6S4iOw2txoAe2j8ppXipqd5jO6O9MuNexneKlwKnlPeR2Izpg?=
 =?us-ascii?Q?OIkNpYeicn++/JudT8IvNWdsIVhzWFGFcfs0sHiYzmrHTYMo+nqgkiiJ8/E4?=
 =?us-ascii?Q?x9uzttvkfftpl8tn3pFpmloaTykrQb2Y5QE096RB22CNoKbOuMGpT9SVC4tE?=
 =?us-ascii?Q?Foq7O1qmmJ3l+bYSH3J3zVzAweKqREUnLdkvztOOhE4OxKsivCdWTTjLGciF?=
 =?us-ascii?Q?xFRevy5SHGsjZCScpJorUNMd01zgnDAjdd3ubbj3j5DB8JNVwqGXMN8PDYyb?=
 =?us-ascii?Q?8yEPKt5WWYvgnjWkWp7wIaJK0z8CYL2OKVN3JtkaA2oqzXEkTLB+48pgzsdK?=
 =?us-ascii?Q?iTRv2+1vofc1VzYgnwqqOA+HtMwv4w58rIPlkTZDTPt48y4Xr0NAstCevYHI?=
 =?us-ascii?Q?9u1RVG4qA8sThbt7MgV67pzHQlE5btd3JEpFHxGP?=
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(7416014)(82310400026)(376014)(1800799024)(36860700013)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2025 06:30:17.0066
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b3cb525a-b536-49e5-cde4-08de1846f514
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000A34B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR12MB9840
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_233022_120227_9E39553C 
X-CRM114-Status: GOOD (  20.87  )
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

Add device tree support to the CMDQV driver to enable usage on Tegra264
SoCs. The implementation mirrors the existing ACPI probe path, parsing
the nvidia,cmdqv phandle from the SMMU device tree node to associate
each SMMU with its corresponding CMDQV instance.

Remove the ACPI dependency from Kconfig as the driver now supports both
ACPI and device tree initialization through conditional compilation.

Signed-off-by: Ashish Mhetre <amhetre@nvidia.com>
---
 drivers/iommu/arm/Kconfig                     |  1 -
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c   | 30 +++++++++++++
 .../iommu/arm/arm-smmu-v3/tegra241-cmdqv.c    | 43 ++++++++++++++++++-
 3 files changed, 72 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/arm/Kconfig b/drivers/iommu/arm/Kconfig
index ef42bbe07dbe..5fac08b89dee 100644
--- a/drivers/iommu/arm/Kconfig
+++ b/drivers/iommu/arm/Kconfig
@@ -121,7 +121,6 @@ config ARM_SMMU_V3_KUNIT_TEST
 
 config TEGRA241_CMDQV
 	bool "NVIDIA Tegra241 CMDQ-V extension support for ARM SMMUv3"
-	depends on ACPI
 	help
 	  Support for NVIDIA CMDQ-Virtualization extension for ARM SMMUv3. The
 	  CMDQ-V extension is similar to v3.3 ECMDQ for multi command queues
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index a33fbd12a0dd..b2657eaa9e17 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -4530,6 +4530,34 @@ static int arm_smmu_device_hw_probe(struct arm_smmu_device *smmu)
 	return 0;
 }
 
+#ifdef CONFIG_TEGRA241_CMDQV
+static void tegra_cmdqv_dt_probe(struct device_node *smmu_node,
+				 struct arm_smmu_device *smmu)
+{
+	struct platform_device *pdev;
+	struct device_node *np;
+
+	np = of_parse_phandle(smmu_node, "nvidia,cmdqv", 0);
+	if (!np)
+		return;
+
+	pdev = of_find_device_by_node(np);
+	of_node_put(np);
+	if (!pdev)
+		return;
+
+	smmu->impl_dev = &pdev->dev;
+	smmu->options |= ARM_SMMU_OPT_TEGRA241_CMDQV;
+	dev_info(smmu->dev, "found companion CMDQV device: %s\n",
+			dev_name(smmu->impl_dev));
+}
+#else
+static void tegra_cmdqv_dt_probe(struct device_node *smmu_node,
+				 struct arm_smmu_device *smmu)
+{
+}
+#endif
+
 #ifdef CONFIG_ACPI
 #ifdef CONFIG_TEGRA241_CMDQV
 static void acpi_smmu_dsdt_probe_tegra241_cmdqv(struct acpi_iort_node *node,
@@ -4634,6 +4662,8 @@ static int arm_smmu_device_dt_probe(struct platform_device *pdev,
 	if (of_dma_is_coherent(dev->of_node))
 		smmu->features |= ARM_SMMU_FEAT_COHERENCY;
 
+	tegra_cmdqv_dt_probe(dev->of_node, smmu);
+
 	return ret;
 }
 
diff --git a/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c b/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c
index 378104cd395e..a5eb8e23083c 100644
--- a/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c
+++ b/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c
@@ -11,6 +11,8 @@
 #include <linux/iommufd.h>
 #include <linux/iopoll.h>
 #include <uapi/linux/iommufd.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
 
 #include <acpi/acpixf.h>
 
@@ -917,6 +919,26 @@ tegra241_cmdqv_find_acpi_resource(struct device *dev, int *irq)
 	return res;
 }
 
+static struct resource *
+tegra241_cmdqv_find_dt_resource(struct device *dev, int *irq)
+{
+	struct platform_device *pdev = to_platform_device(dev);
+	struct resource *res;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!res) {
+		dev_err(dev, "no memory resource found for CMDQV\n");
+		return NULL;
+	}
+
+	if (irq)
+		*irq = platform_get_irq_byname_optional(pdev, "cmdqv");
+	if (!irq || *irq <= 0)
+		dev_warn(dev, "no interrupt. errors will not be reported\n");
+
+	return res;
+}
+
 static int tegra241_cmdqv_init_structures(struct arm_smmu_device *smmu)
 {
 	struct tegra241_cmdqv *cmdqv =
@@ -1048,11 +1070,14 @@ struct arm_smmu_device *tegra241_cmdqv_probe(struct arm_smmu_device *smmu)
 
 	if (!smmu->dev->of_node)
 		res = tegra241_cmdqv_find_acpi_resource(smmu->impl_dev, &irq);
+	else
+		res = tegra241_cmdqv_find_dt_resource(smmu->impl_dev, &irq);
 	if (!res)
 		goto out_fallback;
 
 	new_smmu = __tegra241_cmdqv_probe(smmu, res, irq);
-	kfree(res);
+	if (!smmu->dev->of_node)
+		kfree(res);
 
 	if (new_smmu)
 		return new_smmu;
@@ -1346,4 +1371,20 @@ tegra241_cmdqv_init_vintf_user(struct arm_vsmmu *vsmmu,
 	return ret;
 }
 
+static const struct of_device_id tegra241_cmdqv_of_match[] = {
+	{ .compatible = "nvidia,tegra264-cmdqv" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, tegra241_cmdqv_of_match);
+
+static struct platform_driver tegra241_cmdqv_driver = {
+	.driver = {
+		.name = "tegra241-cmdqv",
+		.of_match_table = tegra241_cmdqv_of_match,
+	},
+};
+module_platform_driver(tegra241_cmdqv_driver);
+
+MODULE_DESCRIPTION("NVIDIA Tegra241 Command Queue Virtualization Driver");
+MODULE_LICENSE("GPL");
 MODULE_IMPORT_NS("IOMMUFD");
-- 
2.25.1


