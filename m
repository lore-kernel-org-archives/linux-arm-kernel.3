Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1063D41D74
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Dec 2025 06:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lpZxhBhmDOWhgMdEyJsHTEdfQdNNvc9JqUtPx9KC9AA=; b=O6eSmWqK5F2Q9dxy+WRROvL5l+
	d4WARe/p5Q5t6GQdv/AP3C6jzVkHsFXCOpvQvWQHDjLWyeWu+PNosvRA5RZdO3oWWMY7VcOGLBfrH
	y3fk9eLl7wNlFKqLTm9RrpC6LTG/9RJEeYuVLQkDkdrBK2CkfBN66kxGuNkKqcNkSzkfVVuBSpxT8
	iRxekGtrN1KY2YAd3gX5VCpR6vzFP619SQEBHQ9mNGSQKkvvPSbxIIKdzSyb0qBMTRAiF8C8jOZPr
	FmUiumqL44sGpzajF2RYE3lAymxgGLk1bCy4z8DoJpZ8CK1IedMzZFKJNVeRSPLNlutsNHqR22+o6
	z05dKfHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV2OD-00000003AHR-3Gsm;
	Mon, 15 Dec 2025 06:49:01 +0000
Received: from mail-southcentralusazlp170120001.outbound.protection.outlook.com ([2a01:111:f403:c10d::1] helo=SN4PR2101CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV2Nz-00000003AEK-3jCu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Dec 2025 06:48:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XuzD1ubrTPtwg5zxekfWJF+++XGfkVJnOqQFTVZUMxZtk2tqHHHFHfvsTIpbF5RBlupzTF53YuUgR99tBhhjVZXeR7sIUsrulCVhAm9iNWciIxpxs6vBoHXvtpbA1JrByhTpbVR4e0M3eTGinlT7r2Kp74Jc9JQPsdv/BIaaYjboUazWtZSv1Xgk8mE+WtnhB83NqtkDpN2WOo5MeBY2ub29Vpx0vBw65RtDiYXylZ9fp9o7p/9LAow4lRyoHrkkXGJDEL3XKBaeTzk/+oXBrnU8wKEdyyLG1C0LbJeeIFQ9TvWK7JlmVqty/K99vd5HJW6QyJ9JwkpMHB8K2MBkGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lpZxhBhmDOWhgMdEyJsHTEdfQdNNvc9JqUtPx9KC9AA=;
 b=MrXcelSC+YpIL2JbMjbEzKbgtAuSELWiYpkwMSqUsowBUH4TlchNGJCJ3qPiuc7wj3ZkDJk1+4JRyzl17V7N5VAIWnfhrwmrTzXC9xaggKYDG996Ye+BcSsrR9aTuyOTClY3IfGxm/xtJ2f0B0i/PGBJsK84/ivVLsGgtC+fmh5PB2RW6sPEB19H9W83BzCVsMWW2+mfz2fKjX1ID243dOXSA/WpedifckHaxROBGPco2gQ+8wgfjDSWwzrmYaTl2HvNhOVjedKcs1427X2wgYg2QfkYu1B9PnhpGlajqNTrOwa3/mJQne2T+qA4TyZ/rDaXVBtNcO25reYkZGyT5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lpZxhBhmDOWhgMdEyJsHTEdfQdNNvc9JqUtPx9KC9AA=;
 b=FRZEDH2SSIfV6qa3aHw5O03etOmc46ElYHQ3gHUngPpwtkFa6kkVpOtUl9KbgYzzpLFpJImUQOF/V6VlP0H8bu5/xk1Y7pdXuy55KXvSs647y3FXz63poa8lQa3tvpPs3c7ybjXAfjrcr83HggyQdOxUONpPa1EhrCClHOzi54k1PTNzbbtkSf5LlG5fr5ecuZ4BfGFv+q6e9NCyAUHGq2pe+C/WzCkzqF4kDGzm9/qvlQMVZE47iy6Ir4JVrFwVXnC1422qWjVHj9CQgvOtEWnvzrXK3FjZ1jYYKDoIhtTn/h6kM/QUcHH0j4uWR/CA2vW8sWfhohld9A0yUxZzrQ==
Received: from CH0PR03CA0115.namprd03.prod.outlook.com (2603:10b6:610:cd::30)
 by CY3PR12MB9629.namprd12.prod.outlook.com (2603:10b6:930:101::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Mon, 15 Dec
 2025 06:48:40 +0000
Received: from CH3PEPF00000017.namprd21.prod.outlook.com
 (2603:10b6:610:cd:cafe::43) by CH0PR03CA0115.outlook.office365.com
 (2603:10b6:610:cd::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.13 via Frontend Transport; Mon,
 15 Dec 2025 06:48:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CH3PEPF00000017.mail.protection.outlook.com (10.167.244.122) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9456.0 via Frontend Transport; Mon, 15 Dec 2025 06:48:40 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sun, 14 Dec
 2025 22:48:25 -0800
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sun, 14 Dec
 2025 22:48:25 -0800
Received: from build-amhetre-focal-20250825.internal (10.127.8.10) by
 mail.nvidia.com (10.129.68.10) with Microsoft SMTP Server id 15.2.2562.20 via
 Frontend Transport; Sun, 14 Dec 2025 22:48:24 -0800
From: Ashish Mhetre <amhetre@nvidia.com>
To: <will@kernel.org>, <robin.murphy@arm.com>, <joro@8bytes.org>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<nicolinc@nvidia.com>
CC: <thierry.reding@gmail.com>, <jonathanh@nvidia.com>, <vdumpa@nvidia.com>,
	<jgg@ziepe.ca>, <linux-arm-kernel@lists.infradead.org>,
	<iommu@lists.linux.dev>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>, Ashish Mhetre
	<amhetre@nvidia.com>
Subject: [PATCH V7 2/4] iommu/arm-smmu-v3: Add device-tree support for CMDQV driver
Date: Mon, 15 Dec 2025 06:48:17 +0000
Message-ID: <20251215064819.3345361-3-amhetre@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251215064819.3345361-1-amhetre@nvidia.com>
References: <20251215064819.3345361-1-amhetre@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000017:EE_|CY3PR12MB9629:EE_
X-MS-Office365-Filtering-Correlation-Id: 2aa5c79d-f778-40b7-e391-08de3ba5fb63
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|7416014|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?adcMXv9WwdBldZQaxp/UYh0CuhJLjBeOytWIJoPM9BTqY/4/jumCSINL8mhI?=
 =?us-ascii?Q?MuZrqZ1HuvXDFzgV+qjXLDorjov3N/ZvbKJUIfqb9j0EERJhURKoxLszLgv5?=
 =?us-ascii?Q?s5IPTpvjGO+4uSHZMijSa960nZP+yxbI5bIYwYf897ASLriaOqt+pn6LV3v8?=
 =?us-ascii?Q?se0hf/Cp7vtTqC1sJHs6Aw71uXiN+XYHWb4wJeUh4LaHS5WR+C4677KeWBC/?=
 =?us-ascii?Q?FdF4VgmfV3RTSDMyLw0/S1RwkHB2dtLU3Y3Hc9caLIuDwwMsFcpbV8UFGX8f?=
 =?us-ascii?Q?n1no4ve7N/pmB7B7PZcsm+libZ+W4mjZPtG6ljc/KJ8l1lW2SGYYA/78kM3u?=
 =?us-ascii?Q?ekaUADtlFqvZvxqa5Xx0RiN7hWpWyYMJCnwdKN3GtiKZnXCBiZ1BLny49hL9?=
 =?us-ascii?Q?Abo5XmUKBRS87X2cJJ3GQSyT4Z0kZ3NqkWOskJ9AQyUmHKbkyGKogqGjQ3I/?=
 =?us-ascii?Q?WnPdB8SwLOGcqvxePkvblWfMfM6GBCNXCaUDpuEvM9QecAJGk/p2Dx7mBp5t?=
 =?us-ascii?Q?xUN/YENxVkiCM3DsUyxHSFiE9eRXpyTX5h6mDj0U/R1ZKEr/GHt41B+kvalb?=
 =?us-ascii?Q?mtdPOdnUXpIJGh8Yrfk8FEQg057I4ssnUWSBoX7oDVXeJ7fgRvc6r4jx7xS3?=
 =?us-ascii?Q?1iOV2U6NflDKGjgvIcynrIR5k1CZQGGiUNe7/R1W1lzomPTZT0b6GiQQ3IkO?=
 =?us-ascii?Q?K3GwvWmHAQGqyGJX/8TA6AlYLQVLK5u2iR5+jfGpKr3PRmslOsqOgupP2hIP?=
 =?us-ascii?Q?D+rl8kfBVo3c3VSPAlXe+nAYJdRBoOPF/6SHdjijblfuWkmVSoMp2Cw+Nqzo?=
 =?us-ascii?Q?IQdf5qtO90J/WxPlba1VXluQrVXFoSDEFbgadtM1bDgO6v4kGKB65ZgF6Tu4?=
 =?us-ascii?Q?umlSr6l2BtiPfWPqai2F6Smt9qyQy9kxWq2mLm0w0JpUyr58ChDFcsqjRsS4?=
 =?us-ascii?Q?ijY7TLErwJqBRD1wW3vM2BzcM/q9A2Q2/EkP9Z9jhd8AJBptH8aETAKENA5r?=
 =?us-ascii?Q?vQWsuVrh3h6WiGQPTL4X2Zyc3cgptPjDwhaYDAe76Sti4iK7l+pP9A/rQ4Fg?=
 =?us-ascii?Q?WdQKzrw4FztHXvSJq25G1Gn0ZgjdpxKtvZslUzgPIWU708eMxRkwimxOW/9n?=
 =?us-ascii?Q?thBmahSIYhRm+nMWz6AwvGmykFAFLCxUB2DRX9wUr0ppEaZnPkzhlz18SabT?=
 =?us-ascii?Q?4itJPGz1BzBjdh4KJdGDjgB1+6U7wHWhzL3X2OFJSIC+ZbzWmdaElhMRhJgi?=
 =?us-ascii?Q?eSV3MrCgQ0OH81DiFzAZdA1w3V/aFdkGQQUIGADwsL2TiXZZDozgoghawoFa?=
 =?us-ascii?Q?rZWlkpZzrQ2LWRJqeMv5gZdCdYvQ+jqI9ULvYuKbK5Aq79t4Hfy85cxWwYFf?=
 =?us-ascii?Q?tzjVO6WBsYBQwpaBcUj8cpYzTbm1GY13WT2LKOO8dVl3mlujH6fd1eThhS6a?=
 =?us-ascii?Q?KSUAvbzI882/O2kbSVrnSUTJ7VktukgJJ9C+5CCUBj47VEIc7z3zg5CtxZOb?=
 =?us-ascii?Q?gle1KjzToLtsYMlbjeDRktT2ZUnIgOeH/JL8i5uedbguxa9/OnB9xaqddEX6?=
 =?us-ascii?Q?VxwTJv7rX8lAPwOekWo=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(7416014)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2025 06:48:40.4753
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2aa5c79d-f778-40b7-e391-08de3ba5fb63
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH3PEPF00000017.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY3PR12MB9629
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251214_224847_927069_971E1725 
X-CRM114-Status: GOOD (  12.04  )
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
index dad3c0cb800b..0cd0013200f3 100644
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
@@ -4635,6 +4664,9 @@ static int arm_smmu_device_dt_probe(struct platform_device *pdev,
 	if (of_dma_is_coherent(dev->of_node))
 		smmu->features |= ARM_SMMU_FEAT_COHERENCY;
 
+	if (of_device_is_compatible(dev->of_node, "nvidia,tegra264-smmu"))
+		tegra_cmdqv_dt_probe(dev->of_node, smmu);
+
 	return ret;
 }
 
-- 
2.25.1


