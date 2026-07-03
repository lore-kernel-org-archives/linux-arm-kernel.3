Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09AF6C44500
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 05:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gTAQo2ZdJr7KL7ACFzpn34b6XHoSyP7nCp/LZkZwBC0=; b=K7ht3pbI925WTAqag+WeDnfG6z
	tF9j0FQGlB3jZqGUbNH6izgRk8ahIRkHeAxszPa4pTaddKSg2qd7uKIvF1chI5nebbo58ytnoUujJ
	8abdDMFhxlZG1dwMjGBV7JK2AE0Du2H78AOpt1edoHPS3QE1koxYylujpfYvYfHYn59pe1Ztf+hEC
	xineeTIEy42P0jvH0/ylBnkhm2BG1S5w/AbZz68glg5cbpZv2np1oswqNlBBY5gnv0ucT1k4uHjxO
	Kc6kf4ofUh9GLHJLxNgK+WtZ81QtptzNfSGPcBVbT0lGK28Wu5Ccb3rx9yrLksUq5U2w71TIUCBVt
	DJovSXhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfWVk-000000064tL-2K2G;
	Fri, 03 Jul 2026 05:32:24 +0000
Received: from mail-eastusazlp170120007.outbound.protection.outlook.com ([2a01:111:f403:c101::7] helo=BL0PR03CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfWVa-000000064gO-3tpr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 05:32:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kC2Evj8OWmdIafIJ6tdryyI3uZqAPv/W+FPdQqAEp19MIZSa477R0nUnuqMI+uYMnxO2A3dN99r5X0WJGzHVN6cIhRy8cYU72i6mFG9AfPVLNXj2i1Jxre5jIWgWrXrHMwi+UvtEhRVD+Z5xSsiwLjsCPOB9AkB1WncwEgR7CvmKwy39S283EKLvMLe1SEIi3qXpSvrPpKDc86AimpiRi+2ky9vI68e/EKEdHHnJZrcizOO7wFU36VufsEiB7vzPHYHWGOxlP8UssExZJcWAWu9m8gTwtqlVPGCzIYXnOKxTBStLIz+AVveJ2/cLYYEDy3wSBfaEjWuHjMuTkr5ewg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gTAQo2ZdJr7KL7ACFzpn34b6XHoSyP7nCp/LZkZwBC0=;
 b=aqILPZPfTIF5HxwYSmuR05uk/EXoJVqawkT9K8xk4yGg9XLtJuQPgIFG6TOVQlOW1hPhPc9a/b+nG4vRa9IOK25fYB/PhSwQrMCTmCpF8suqcxnU1GCRk5z2vghf3nFIdj8iBlR3LqHQa2u49hZJnb+Ezad4DFWZ9EaTql43bdOQzOpmbhN080SdbfhP8+EA1c4angoq3SX8IuHTGB+wlhiE+T/uJjNDJoMUW3UEULztfGlD3Das7eeqB0dix/yu1WYwuJvSwBnL75/T/psIE0KxhV8dy5n0/MHFh0kWUoTPr7AAMbLzulzB4U/ommLKu2eaOZpZr+zue7yzCyjqtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gTAQo2ZdJr7KL7ACFzpn34b6XHoSyP7nCp/LZkZwBC0=;
 b=bZ6oznS1qrWnFt0cqgPK+8hVJXehUyNYI4Qtq9/HqRNUIfyMeKNf9QuPuy563jisEyQaEGqjYbpxaQye/3ptZhmZJHxMEfF6I1Uf+xz3Xx3RIW7MSGYODlRA/8+M0HoGmH0OFU4oX9elbZvgoGpw9YJd0GCJBL/XgYLS2ppeO1OcU4IKJ9dKAGKjzUbAtNQuPrEDqUXSsQp9JT19DI9sMC4rg1lHww/PGfJi21YRe/c8d3IGanFyYMjjmwTWS+e5ZWtsZz01Hco+By+UcpeKBo2b1wOAysoBLABj52Hp+60rkptAMXxwiwhF9cRrUgEcW0k3h22C7h9WnJw8BTQu4w==
Received: from BN9PR03CA0688.namprd03.prod.outlook.com (2603:10b6:408:10e::33)
 by SJ2PR12MB8135.namprd12.prod.outlook.com (2603:10b6:a03:4f3::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.9; Fri, 3 Jul 2026
 05:32:06 +0000
Received: from BN2PEPF000044AC.namprd04.prod.outlook.com
 (2603:10b6:408:10e:cafe::2) by BN9PR03CA0688.outlook.office365.com
 (2603:10b6:408:10e::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.11 via Frontend Transport; Fri, 3
 Jul 2026 05:32:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN2PEPF000044AC.mail.protection.outlook.com (10.167.243.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Fri, 3 Jul 2026 05:32:06 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 2 Jul
 2026 22:31:46 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 2 Jul
 2026 22:31:46 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.11) by mail.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Thu, 2 Jul 2026 22:31:45 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Will Deacon <will@kernel.org>
CC: Robin Murphy <robin.murphy@arm.com>, "Joerg Roedel (AMD)"
	<joro@8bytes.org>, Jason Gunthorpe <jgg@nvidia.com>,
	<linux-tegra@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<iommu@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v1 04/11] iommu/tegra241-cmdqv: Don't run the error ISR before probe sets up vintfs
Date: Thu, 2 Jul 2026 22:31:30 -0700
Message-ID: <c1b474c1b2a2178770e45c200c5c42b6be4be4e8.1783054570.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1783054570.git.nicolinc@nvidia.com>
References: <cover.1783054570.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044AC:EE_|SJ2PR12MB8135:EE_
X-MS-Office365-Filtering-Correlation-Id: 65eedef2-29d0-4e0c-5470-08ded8c46bbb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|376014|82310400026|36860700016|22082099003|18002099003|3023799007|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: bW2tsmNqjVR8odVkNBb83MfMtwuvbqAYN3i9CJmjWda8M6Q8a8SmooiiKbQYbCechRplLPe0G92pBrJNRFN92B5Wx4h1Wl92BfSUJDmkc06+TMPWyJLrhp2W8dlLGt/p7EIMkAn3Mbz7GHQ7v2ATrTmAzhwnveWh4a18u+rVolbT6YO0bF6VYkbB7HL+TyAdepfY3tJqL95i2Z3gpfKkp7B3kPBRXkdqMKfCC0tFR9x3MaNubHWIzYD3T/XfzAY9iI/JqRe9A1XogqoXq9b9VB+9pQthccnzHHumFYyrPqd0S2UCsl1PxTIn8CuU0i0f6YxGiog4dWvgKg7dOlq2e7E7XToOktNFCHLOhZB7xYkBKoEXNkUh8M1rqew8iHWogkWXJ0Uu1jYAzcmpGDeG5+q/MBC5zW1mVgDi4ePdOqPzrOnWnbXayUKpHpwaxN6W6/2TIW0p3BvLXh7FzkxD9GLbGFbkYtSC+ICGbDorOImZl6VUMhoRscp0em2p1Cew6PuXF7X8UUkcK6JpWqvwW6Sc2o1dHbAtacRskaljbBaLETn71yM76JMrZE+Enkvv4GwF8Tjn4esBlcqkYh+Qz2YKoiaHo4hrxQXQi+kL3k/ILFqC4WM19zRJTKfZSgfcX4w4bGHEhTiAaV7VmKssAD+LlSFVFGLiYxmTPa3Zo+EVgDZOgHfcT4RnE0blu/RlupChGBh0IOJ0btFNx6b5nQ==
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(82310400026)(36860700016)(22082099003)(18002099003)(3023799007)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: +sjv9hhE7DrisLW8jvJsEtpC4O4rjJJa52mu8/5ESCKLroPm97aQ6HGqZTJCiEqgmq54KqPHKSyVcnpTPaB2K66+5jtmCss2kM6NDA+VV30iz/C4ss8FWXGo6RIxngOTbtCi5hkSXLhNbXSt1qGURTGyUmxgET5M4nFvugWwvCOT0RDEJA/tSwwM/+NQ95prpC/IeaHL9Ja/bn8qgB2ibLXKm+dSNZxYbu8GPyR67IEYkRMvuVR5VvoCawxwkShMeso+RyZsSAR/qTgR6EOAX4O9f7upuNNKtZZrDSBRMfZAon9x3icIf9FTwzkb1l2mA8SFqa5zRJNKD//NU0M/pHHwdkiZZVWhXZzzhKqkuCp5mfh9xlBFWmCtXS77cb1vzeYezhPMXFLwUMEym5ULatrxfTXLPCVGUaylSY80IfosA0VUN5ee5elyU7r5oOxp
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2026 05:32:06.3738
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 65eedef2-29d0-4e0c-5470-08ded8c46bbb
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000044AC.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8135
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_223214_984682_8AD68FCD 
X-CRM114-Status: GOOD (  13.47  )
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

__tegra241_cmdqv_probe() requests the error IRQ before it has allocated the
cmdqv->vintfs array and set cmdqv->num_vintfs. A CMDQV left enabled with a
latched error across a kexec fires the IRQ as soon as it is requested, and
tegra241_cmdqv_isr() then walks the uninitialized cmdqv->vintfs array.

Request the IRQ only after cmdqv->vintfs is allocated and zeroed, so that
a latched interrupt firing early runs the ISR against a valid array of NULL
slots that it safely skips.

Fixes: 918eb5c856f6 ("iommu/arm-smmu-v3: Add in-kernel support for NVIDIA Tegra241 (Grace) CMDQV")
Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 .../iommu/arm/arm-smmu-v3/tegra241-cmdqv.c    | 34 +++++++++++--------
 1 file changed, 19 insertions(+), 15 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c b/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c
index b89f021ba0b86..7e366030d9d70 100644
--- a/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c
+++ b/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c
@@ -973,17 +973,6 @@ __tegra241_cmdqv_probe(struct arm_smmu_device *smmu, struct resource *res,
 	cmdqv->dev = smmu->impl_dev;
 	cmdqv->base_phys = res->start;
 
-	if (cmdqv->irq > 0) {
-		ret = request_threaded_irq(irq, NULL, tegra241_cmdqv_isr,
-					   IRQF_ONESHOT, "tegra241-cmdqv",
-					   cmdqv);
-		if (ret) {
-			dev_err(cmdqv->dev, "failed to request irq (%d): %d\n",
-				cmdqv->irq, ret);
-			goto iounmap;
-		}
-	}
-
 	regval = readl_relaxed(REG_CMDQV(cmdqv, PARAM));
 	cmdqv->num_vintfs = 1 << FIELD_GET(CMDQV_NUM_VINTF_LOG2, regval);
 	cmdqv->num_vcmdqs = 1 << FIELD_GET(CMDQV_NUM_VCMDQ_LOG2, regval);
@@ -994,10 +983,25 @@ __tegra241_cmdqv_probe(struct arm_smmu_device *smmu, struct resource *res,
 	cmdqv->vintfs =
 		kzalloc_objs(*cmdqv->vintfs, cmdqv->num_vintfs);
 	if (!cmdqv->vintfs)
-		goto free_irq;
+		goto iounmap;
 
 	ida_init(&cmdqv->vintf_ids);
 
+	/*
+	 * Request the IRQ only after cmdqv->vintfs is allocated and zeroed, so
+	 * the ISR would not walk an uninitialized array.
+	 */
+	if (cmdqv->irq > 0) {
+		ret = request_threaded_irq(irq, NULL, tegra241_cmdqv_isr,
+					   IRQF_ONESHOT, "tegra241-cmdqv",
+					   cmdqv);
+		if (ret) {
+			dev_err(cmdqv->dev, "failed to request irq (%d): %d\n",
+				cmdqv->irq, ret);
+			goto free_vintfs;
+		}
+	}
+
 #ifdef CONFIG_IOMMU_DEBUGFS
 	if (!cmdqv_debugfs_dir) {
 		cmdqv_debugfs_dir =
@@ -1012,9 +1016,9 @@ __tegra241_cmdqv_probe(struct arm_smmu_device *smmu, struct resource *res,
 
 	return new_smmu;
 
-free_irq:
-	if (cmdqv->irq > 0)
-		free_irq(cmdqv->irq, cmdqv);
+free_vintfs:
+	ida_destroy(&cmdqv->vintf_ids);
+	kfree(cmdqv->vintfs);
 iounmap:
 	iounmap(base);
 	return NULL;
-- 
2.43.0


