Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EB28D29DC9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 05:50:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1zKb8HIHKomQNp5r9LcD44rm4A+Iaf/7LA0/rxGGiyg=; b=oUce0F3LWfFSmHTorXjrB99z+t
	e/8329A6ToxUUrEFvNEhUx61hkMwUT2my30yiWWJIe1Y1B7FzR97M43fmPzK6vmQ4HgczLSVr3vkO
	kF1iJ2PGwJoJsts7pa8c4NzbwngLlwrfWC/MU8XhwmWjBtmaFiLRVmQSEqdB4k1ld+0sbsPam+tgH
	1OUwuSU14gbGtI5jtAS6UCJmEvv3ikEKWQGsAePUAW9YCfiU6vCJij1dRsnx5XuuJYnhd7TLUMpu9
	aA77BO3iqeT/0X16CPQLrKI922IVEP9cCu3NKqRNJObY68OsvGe9TDTKWpk2AfEevKo7VAoQ3JFAa
	YXC34WVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfXI4-00000006ZBP-2bqn;
	Tue, 13 Jan 2026 05:50:04 +0000
Received: from mail-southcentralusazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c10d::3] helo=SN4PR0501CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfXHy-00000006Z9b-2ugA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Jan 2026 05:50:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dPIxsmeqBRJUoeb7ZJsZxFFMDKj1BdabscbcQvqa4rYPljmxI7/akuQZpoW5ek+UUdGR5BiZs1hiXapumSieraa83jPMtSViJ3fQWrBdhYDJ1eEMhHajQ/JBj+3tnmX3RX8Xeb8vMdTpM1/1qnM3e7s4xjwtOCpmBi5dhRj1UiJJd+C7FiI/+Q6rJ/m/0mcEXrtc4ZScA138t1YKrcjhn6zACqc3kcgHinLe9WIwalb3iAeeWZrDcKQOpT77LZxF3Ww2aJnSOLmBWnAiMzh37iTccIgZK/1CrTIXbfOHsavtpSxUphP/BOE2EPOH4z8DtQXAA2Fn4WaD0Zoca9kOlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1zKb8HIHKomQNp5r9LcD44rm4A+Iaf/7LA0/rxGGiyg=;
 b=DBXyXozagcwxEWAozk2LxCxI2En948FKFWs1nnXSbC9PAWWZUS/FT+kP2PAohisbrxgq3FGke0onkrznTm/KLbTcBXXlcRGLOLpN1etfbOz62i8x0sIJw1DazXa3KSYiteYXAzAd+Q53WXQisoLbP9D7a/e7Al10IMqiXtLJXlHhnCnPfBxZ7c51GozhauMtUgzfPzRvJEShQoY0fsq2oytSdRyhWEQBfgRaU4DaRfGXJsHPvje+dUohQwY5iYSyaDpVXw0G/l77XrAB9lOSYusz9rM6ETdxfhcKKG6lcEGmB2vKP6tBwR98Q9ceXD3KFXHmqT602A7l20Zw3nwz6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1zKb8HIHKomQNp5r9LcD44rm4A+Iaf/7LA0/rxGGiyg=;
 b=NQAu+3tGi6vDJb07BNRCkta5o41iqJ2aL2AaiJG26zHtxDQ73XXdAit27rDKmL2B3QzBPojJ1lNjdYe55091uZtewkR3fQArgrZshKvPBV0LVPABE/SzxQKCuhvN/njWbzljcsjMjXiq7X1IQbHxHKKWBlMikXAMJwJ8oc9+wbD1hxURAGnTgdxhDbDuW/d8i+MnS/+Q5Xo/KlHvPIJkKvLexnImX9btNgJrxx2lf4PV2hOsmLa4HvBtaOcT4Lx8XYPS2KSJq/f6VtWybyOxllAAhj2gdZkBuCjArPdg+3ELpYZYfi/6uvSTQUyKpt7yOB1zYTX64QwrL/7/0DUxbQ==
Received: from DM6PR11CA0072.namprd11.prod.outlook.com (2603:10b6:5:14c::49)
 by MN2PR12MB4438.namprd12.prod.outlook.com (2603:10b6:208:267::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Tue, 13 Jan
 2026 05:49:52 +0000
Received: from CY4PEPF0000EE34.namprd05.prod.outlook.com
 (2603:10b6:5:14c:cafe::8d) by DM6PR11CA0072.outlook.office365.com
 (2603:10b6:5:14c::49) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.7 via Frontend Transport; Tue,
 13 Jan 2026 05:49:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 CY4PEPF0000EE34.mail.protection.outlook.com (10.167.242.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Tue, 13 Jan 2026 05:49:52 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 12 Jan
 2026 21:49:39 -0800
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Mon, 12 Jan 2026 21:49:39 -0800
Received: from build-amhetre-focal-20250825.internal (10.127.8.10) by
 mail.nvidia.com (10.126.190.182) with Microsoft SMTP Server id 15.2.2562.20
 via Frontend Transport; Mon, 12 Jan 2026 21:49:38 -0800
From: Ashish Mhetre <amhetre@nvidia.com>
To: <will@kernel.org>, <robin.murphy@arm.com>, <joro@8bytes.org>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<nicolinc@nvidia.com>
CC: <thierry.reding@gmail.com>, <jonathanh@nvidia.com>, <vdumpa@nvidia.com>,
	<jgg@ziepe.ca>, <linux-arm-kernel@lists.infradead.org>,
	<iommu@lists.linux.dev>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>, Ashish Mhetre
	<amhetre@nvidia.com>
Subject: [PATCH V8 2/4] iommu/arm-smmu-v3: Add device-tree support for CMDQV driver
Date: Tue, 13 Jan 2026 05:49:33 +0000
Message-ID: <20260113054935.1945785-3-amhetre@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260113054935.1945785-1-amhetre@nvidia.com>
References: <20260113054935.1945785-1-amhetre@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE34:EE_|MN2PR12MB4438:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c778492-5dc4-430f-9547-08de52679234
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|376014|7416014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?DoeeorB6W6WaATn6zbMh+c/l64bj8g9QqyiSsKPEoN1QSMNTxKUY+eALIDQ9?=
 =?us-ascii?Q?EULEFY5LX6KAxtFsO/DFqIS+KCOlE8ix9yt5AH3PibLwsLlINyvMEmDzIN8x?=
 =?us-ascii?Q?rHgd+MZLUMHiZVtBe34vgtFE/MjX7jboN8D3XWGGgbdF71evsaDPdrUrxWiC?=
 =?us-ascii?Q?u48491cZfVlVV5HdOJqYeMwD4taB4TcWd5a0j2XDiC6WE+RHrwv9ReoHKq/H?=
 =?us-ascii?Q?sGGG5o2mUeEsTLqDFAA0dNinWBte3+gBRLBOdm4QcEfQufwHFXyUDYadXMx7?=
 =?us-ascii?Q?chF2HIr7XJyAOsefD1X7/OOxh9e2bFgpKrRb29b6btT6/vIDgrdbbHWPT7ey?=
 =?us-ascii?Q?JG1fWfn/q4uGrFy6o6osYyrjcAtQ6ARYW6AQSyluOhtW8OUk/WC7c4jETRXI?=
 =?us-ascii?Q?9K7Q77QhiLjulridmQU19xoCqAn1XNATsBJfusKRJzLfPn0wFaQ/Y4eMtzox?=
 =?us-ascii?Q?yXp8BwP3AuXKH/rnwKzF1aBUOBjdG4vh8+eNLGlirWrFM8WfTUBvBkCl255t?=
 =?us-ascii?Q?dYtYH0oUL/YncIgapD1QA9QjBuD4xKCK5wwm39xlRxvDGZ9FLqyEBcMS6VSI?=
 =?us-ascii?Q?SXQ2WkUtbVhKlTHwYCNhw0SY29fXcMnhPMYR+6SUC/LhppR/kCopFfC49Kd0?=
 =?us-ascii?Q?i+XzQHisPLMmMeat7sXwnZgNLLwIrU+JuU3mZCR0u7933lamujzZU8F4FVlV?=
 =?us-ascii?Q?E1cObPrxXQO3TLqj8Yw7xVYboTSOSMfygjZT00E7q0nB509qEMl6mbTQrNJZ?=
 =?us-ascii?Q?yCUvTK/IbJ78T78VQLFbAVskEN0UQ5nJ0mF1YRD3G5g4tYeWomYE25jgZd9D?=
 =?us-ascii?Q?GBdAOBJzdtFwM3KE+OOZYs12XYrWf3Pc3bzLyuALndWHUo1E7RfgRY44PujK?=
 =?us-ascii?Q?fzpTKBFEAi1PxOGJ2Qd7ShWrZUzCp6uwilYOFISyoMmThI8yw0TNOcZZ1g5H?=
 =?us-ascii?Q?JzHQOOCt1BrW7+su+sWKP3rw+IxCBvHwLuU6d2cZU2kd+qcYwNPFAziW+Rar?=
 =?us-ascii?Q?igLxWor0iQest28WPNNGgYJLs8qP9m+HqacEE2cs3IRwkqM4HXoiwIk78ye3?=
 =?us-ascii?Q?eNSb3JxnwdpdfzHqjTYdCbFRgTD0txjpfXBp9p1WG0Z2GmSX4KmoLX0gtR1x?=
 =?us-ascii?Q?6yjLhUJuMMlw25hKAd6jJcx4cABY/RD5uCmg/HqH1ZvTnpBugfsoOzWgz5m2?=
 =?us-ascii?Q?N0riZlqLgGRw1ZxpbEx2mXut9eqaCxEVIEzk5AT1md4Qg0QMYZuIQUxJDp8b?=
 =?us-ascii?Q?HuBGdtI5n3SpCYWonu501/G/NH2xTn8wsbIhw88UclM4cHgsmjA0v4/J9WhV?=
 =?us-ascii?Q?Vx6uFa+BU7fDDk44S4R9vq3Ugvvji6lmrnu23PsErm3dvZ2eJ528TfQLPD7j?=
 =?us-ascii?Q?/sdlZ0QtVMprJrCUTxFoW7Vwt3Y19IYoFm4RLt6ur/cM3CNO/2afBE0WtwQx?=
 =?us-ascii?Q?B4d4BCZ75R7JLPjTz+pG/239UphMuEs/WUWk84LkJfL1dT0fHWQLooZaEhcG?=
 =?us-ascii?Q?/EJJq0S4FeQGA98z6kVoiXdwZvKAmqqnI6ChvZsmQiP+cNoemj57Zqp0tp5q?=
 =?us-ascii?Q?rnhgT6BtEFTpGTKYa1M=3D?=
X-Forefront-Antispam-Report: CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(376014)(7416014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 05:49:52.0170
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c778492-5dc4-430f-9547-08de52679234
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE34.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4438
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_215001_489348_9CEC73B3 
X-CRM114-Status: GOOD (  13.14  )
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
index dad3c0cb800b..8653c52977d7 100644
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
+	dev_dbg(smmu->dev, "found companion CMDQV device: %s\n",
+		dev_name(smmu->impl_dev));
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


