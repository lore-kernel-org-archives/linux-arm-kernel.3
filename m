Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E341D43369
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Dec 2025 06:08:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uPgV8oQEt4Gvn9jLIueQlyMC3edLr4tqRhG5l9gSFtw=; b=ddaFux0oKU3zwWJXAEEyO3Z0lN
	xNmFOYDD5Wif83yaOS26OcbKu6Gk4TiTntBPacBDI7UVsXjGtive/z9/D2L62SLKnrl8UCNms005Y
	H1m0Ts1sHNAMpr3VEHNr9aKQpMpiK9KplGctVcBaadV3fQZEeryp86Ydv0cm0sgo9oOkVGlfgKH6Y
	j+u/eXKNJ0NhtJMJ8OmwOd8xS5a4EdUOOQn0nzOd3QDB91js9+FT2MShkZ7bDuGCOL9HH11UaBd9P
	p3WwCS3+UedDemEq2mn5Zng+ApOYD90wR8GYLtdREP+dU7i/M8AI8dM0v0GZEJnKjCCBGjtgjY3Fj
	XTtggtoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTwKM-000000008dx-3uEx;
	Fri, 12 Dec 2025 06:08:30 +0000
Received: from mail-northcentralusazon11010011.outbound.protection.outlook.com ([52.101.193.11] helo=CH1PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTwKK-000000008c8-0ZoR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Dec 2025 06:08:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d5B/qW5UcCi4EL3u8gq5UZs7twJnepn8gRutnTSc7HI7HSMfvjFtQki7ELKEgKWDevocT3Zf0ivxNELRR4K/g+QoVv4K+8sa1Z/cwvQPu1hbRnAK3yiGh+smNX9J8V2GRpqvIMNdx3iBt9LChhhPiLa0ChVMIX/DMU71aF1WmvzBM+Z33XlvG+5k281FLYUHDQjv5LXDAvndvjUxq+0/ktenziAPpbEUJXXdwPhDpJPp98YyXwUEegsY9HqoVasGIkrmIjBZMCPbE13cZRqPkbEXI2qeiQe0QM/tL8Q8mjW1/HyJ6stQHxCjT/JxWfk63cjWaaG/6xONYyZCkswk0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uPgV8oQEt4Gvn9jLIueQlyMC3edLr4tqRhG5l9gSFtw=;
 b=bnDxHWkaLjCEp/7+gz38XbmGVzY33nAeqnJC3uJwakNvnJfyGkibLI3xrc6XZdXUR9ES1qMB9/3bEHsggu616rjKWaNf3Jre0jbqFugx/SxstlzzmoYs6cbcCDUdhN/FlH4rBj2SCspn/81KIBiRjEQOJQJSJ+21aDHXYTqLnpBIRLCzO5A+1RM0bYgT4WY3QOWypNuPpJTY2c+MAumHg8kIFyEUfRyKjvPar4y/FdmuZgtKCPynS7v7FydgFlNJAh8nPPVVMUlaDzfEzIgBzZclt5KQkVSNNyXn3USTY3ylg/5KGnlC65ic9F8FGGMjIzOn3X/7V6ZfeamEHPImsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uPgV8oQEt4Gvn9jLIueQlyMC3edLr4tqRhG5l9gSFtw=;
 b=UZ5r1v/gIyXA/ZmL7MZwKDZxWtQKATFaF0I9NrAc177Dro6kkOBmOr8m0IpZzZD7QRvJmvcrV5C7jcrOWMX3lCHWdeOrpYtD8kDgt32i7iQSuKAVY/FhD8e4ewPhWSXRtNuuCqcTm+s0drNlgTuqgRw9rVnw7qwxZ4hRVwBdjDGmqgy4lh+XdCwGkHvwgIdughzM1BMK/pcwcLzGHVROxiQetbeGHABAhFetkpOORPi8/clDarMPXGjjX8m0NdFrl+3UFouUQ76dMb4HWHWIN0JjDJ/OCHof0sHyWvjJZJ/W5um3+9qgPXrt4A1rYNH0Fb3gAPFoioksRc2xKbcDiA==
Received: from BYAPR06CA0022.namprd06.prod.outlook.com (2603:10b6:a03:d4::35)
 by DS0PR12MB7679.namprd12.prod.outlook.com (2603:10b6:8:134::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.10; Fri, 12 Dec
 2025 06:08:21 +0000
Received: from SJ1PEPF00002314.namprd03.prod.outlook.com
 (2603:10b6:a03:d4:cafe::5b) by BYAPR06CA0022.outlook.office365.com
 (2603:10b6:a03:d4::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.9 via Frontend Transport; Fri,
 12 Dec 2025 06:08:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SJ1PEPF00002314.mail.protection.outlook.com (10.167.242.168) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Fri, 12 Dec 2025 06:08:20 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 11 Dec
 2025 22:08:07 -0800
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 11 Dec
 2025 22:08:06 -0800
Received: from build-amhetre-focal-20250825.internal (10.127.8.10) by
 mail.nvidia.com (10.129.68.7) with Microsoft SMTP Server id 15.2.2562.20 via
 Frontend Transport; Thu, 11 Dec 2025 22:08:06 -0800
From: Ashish Mhetre <amhetre@nvidia.com>
To: <will@kernel.org>, <robin.murphy@arm.com>, <joro@8bytes.org>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<nicolinc@nvidia.com>
CC: <thierry.reding@gmail.com>, <jonathanh@nvidia.com>, <vdumpa@nvidia.com>,
	<jgg@ziepe.ca>, <linux-arm-kernel@lists.infradead.org>,
	<iommu@lists.linux.dev>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>, Ashish Mhetre
	<amhetre@nvidia.com>
Subject: [PATCH V6 2/4] iommu/arm-smmu-v3: Add device-tree support for CMDQV driver
Date: Fri, 12 Dec 2025 06:08:01 +0000
Message-ID: <20251212060803.1712637-3-amhetre@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251212060803.1712637-1-amhetre@nvidia.com>
References: <20251212060803.1712637-1-amhetre@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002314:EE_|DS0PR12MB7679:EE_
X-MS-Office365-Filtering-Correlation-Id: a16591bd-ac0e-445b-16ac-08de3944d996
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|82310400026|7416014|36860700013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?yJLc9PDF5SFCM1LKqpIH++bXQ2yOvUwGn848QoW05ZgZKd77SlvRJNxaVzY1?=
 =?us-ascii?Q?rDtJcF/3W2GdQv8zC/3yj88Bp0QlXImpss8t6uMEpY0NCh4y2HgUS+IiyXtI?=
 =?us-ascii?Q?UC5DelQO2G2gvwXrvGKv7uGWUjEJBcWvmd/ePFfk3v/OV7AX7OO7XYvG2vgx?=
 =?us-ascii?Q?wSwYg04sFGG5YSyX7AjflbQy7vuJ4WGXZZDA4GLck6p0AGLbzIS5qsGIesge?=
 =?us-ascii?Q?pFppKZaRgK6YXwdLboHRIeB9Uh6mDDL/YS7nfToazQsqxsv8gWg25yU6AjlV?=
 =?us-ascii?Q?FK9XfwKQSQTvw+j3jopvQSAaku/mS1AesPUZu6nYl+1e32l3L+3WAgf2Nq0h?=
 =?us-ascii?Q?Fk+4mZ3z9NkxDYCY+1NJICqhrjnFDskJryW3L1HOggVC/NHEr2QDdGOeGh/X?=
 =?us-ascii?Q?9TOv+oRJdNXcU/sOEsCb/5gCVnsj2SUQjALQJU7lx0Ogb69qKjPDve5hWIsP?=
 =?us-ascii?Q?mXGdGG5yXi2eqwqq9E2GQoefMh7Nhf6KwE66ERlN+rBnqEz5DziamRh96jkD?=
 =?us-ascii?Q?JIWeSWCEKMy6iuGsoRPc8lrHtLqO4CVMCPsCw1JxtdgXTYxslT/eMMj44O+j?=
 =?us-ascii?Q?DQsAp/kGg2OojT0l/bZVpamZIV3k1wdQGI9Q4kvxaUo8Zlxnp/jTBpHjP3Fi?=
 =?us-ascii?Q?3oc+iZv2O9JBEKWouMKwhpva+fkCjhA0sr3n9BiGEIZyoHpV/vC6R7IKwMGG?=
 =?us-ascii?Q?aeAsUA13TKqbHsZz+Ptm2sIBl9ugaupJhnSAHPJWKo4KVwi8nZkbEmyqZMaO?=
 =?us-ascii?Q?3AQN+zzdhWIxPJmoyPyZmBSIwr/wTsl9xe4oSkeOFlesOthVl6h0bL35H5cS?=
 =?us-ascii?Q?fDcftsN/Bq9OPkJUbEc+cnCEgaprOlNN01D1UBQYUhTbcSf3N2GfUZR6XYl/?=
 =?us-ascii?Q?qHpr6eFQGAHgVCtNGFSfgjam08bJ9cYgU/GdJwvS2qMDepWtQlp4hdgnyElQ?=
 =?us-ascii?Q?GQlQe4fO4jAf0U9RVTaJgxJQPkDIJj0crOyYQf9+6drnMeLWxvPOgQvDrm66?=
 =?us-ascii?Q?WtFCZrXNlgJia8ls9pnym4uUY6jYN54mHx4ow8CZRGwkvR+Vlp3dTVTaizGt?=
 =?us-ascii?Q?Zd8Kt5EoZnfYnWc7NbhqKXCdUOXcNF3cchcPGzkFMXEyKcp0UrRPo3tWbz65?=
 =?us-ascii?Q?q4MVBIcUt9WFubZBAmQXtDcHmI3W7QhE2XgWiyx/JSXsjlzgy8sewzWoHDYO?=
 =?us-ascii?Q?8ZIODRLCaKnyf2VWJdSy7FLopP6OM832HInC7iE5xXPGQqUskqIYxZag6yOk?=
 =?us-ascii?Q?hRSRvUUHptmYZ9wioUSf2mBRB/7UpegqmEkMfGa9pT3VuI7K5Kga+0/+1KCT?=
 =?us-ascii?Q?SklmdGSTUm/XfuXoWNxQIqWQrYKqyjBATvbk5J5G6xZ0sMkAnWCnPjbtvtIL?=
 =?us-ascii?Q?LhJ5rUM/Dm/Fvn0uILfUGRc0G85Uqyj9/UanIt9NQxThvSsyrItMf/YCLg0P?=
 =?us-ascii?Q?Ak5fsuzsljwJogXY+mFp0lpnUkmXIKego+kZRwjSo+XSPJl4maz59unESWLP?=
 =?us-ascii?Q?6K1odZ0cVjI4MA3Rvc7OdHGljiJ4TRn7d6rZdqRstBTIUiPG2tYoCC+l/CzZ?=
 =?us-ascii?Q?8jJD8kXS1TWnZkgb5pk=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(7416014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 06:08:20.2950
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a16591bd-ac0e-445b-16ac-08de3944d996
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00002314.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7679
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_220828_192045_F4744210 
X-CRM114-Status: GOOD (  12.02  )
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
SoCs. The implementation parses the nvidia,cmdqv phandle from the SMMU
device tree node to associate each SMMU with its corresponding CMDQV
instance based on compatible string.

Reviewed-by: Nicolin Chen <nicolinc@nvidia.com>
Signed-off-by: Ashish Mhetre <amhetre@nvidia.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 32 +++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 42de3da54858..fbd16b210e88 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -4530,6 +4530,35 @@ static int arm_smmu_device_hw_probe(struct arm_smmu_device *smmu)
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
+	/* Tegra241 CMDQV driver is responsible for put_device() */
+	pdev = of_find_device_by_node(np);
+	of_node_put(np);
+	if (!pdev)
+		return;
+
+	smmu->impl_dev = &pdev->dev;
+	smmu->options |= ARM_SMMU_OPT_TEGRA241_CMDQV;
+	dev_info(smmu->dev, "found companion CMDQV device: %s\n",
+		 dev_name(smmu->impl_dev));
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
@@ -4634,6 +4663,9 @@ static int arm_smmu_device_dt_probe(struct platform_device *pdev,
 	if (of_dma_is_coherent(dev->of_node))
 		smmu->features |= ARM_SMMU_FEAT_COHERENCY;
 
+	if (of_device_is_compatible(dev->of_node, "nvidia,tegra264-smmu"))
+		tegra_cmdqv_dt_probe(dev->of_node, smmu);
+
 	return ret;
 }
 
-- 
2.25.1


