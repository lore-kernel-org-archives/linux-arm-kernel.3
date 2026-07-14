Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C0CEC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 20:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gTAQo2ZdJr7KL7ACFzpn34b6XHoSyP7nCp/LZkZwBC0=; b=GhEEqA3JHWg2x6uyQjdFfQGZCY
	bN7t9Fk4QEsY0VYkchdQptRcOAtmqtBQQdJhcyjl0b9pchDLzBnf5kml8tDUwrv7cVcuLx9QOom+c
	IXoCeaDkpd0et/By3V7fLHubEdmlX5YO2iy2Gw9Sm2QO/PSnkndE+RXDliRENuKvLw5a/c5+5iBn+
	nxASCaprq9c77VqrBgnRm6gL2X5X6lcoGv+dz30BLAQLBQVxneJyCkrWD/iU9kZ51onQSiUPal2XR
	0BPUTjcPS+twi1o8y1AWYw8beFIO00VWnC1Ps8tgRHnwdkHC+v7T1a86FFwdugaxBeeQn7f7SHI94
	yzr7vGTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjkAQ-0000000DH1v-2csR;
	Tue, 14 Jul 2026 20:55:50 +0000
Received: from mail-northcentralusazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c105::7] helo=CH4PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjkAH-0000000DGxc-3bfY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 20:55:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yhnlBE430LCepyGnEpiExlNe8naIG7s4hrfj0/Spgd+Br7p7CGBcjhYklxfFN7kgyMHotl5cZo2oYMfYrQ7jrpMr/3/CVHTZK0Mbr3Iu1K7cyoM/8YzHkoWKHXVQVGSti0FXO7d4kZ5grFXrxselOv/ArIVQHeWKAxT9PgMOcsLeMp6Xunu5qIpBpwr91VcTB4N9trjs3+Ln07eM8FGuMn/fnngJlB82pGte7Q4m2eHDHdGJdhkcu/BVp5BegrLImYsJDJqiA/hislpd7xwkP8g7obp4ia2Kv2gXwmcQoa4LaBqYk6aLByAU+c7VVfaCuGWxIh0D7yEWmerjmjWNKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gTAQo2ZdJr7KL7ACFzpn34b6XHoSyP7nCp/LZkZwBC0=;
 b=OT18JKLrADuX40xSZvDeUV12wa9u2iwl2rQS3VT+QwOZv9RTlbXj7m9c665OF/PqvO9t2TVQoJ2bOA6hVgQrmKjoTdwzJ8WOxFbAKYjGRTjmbtF8BtdxAP8tGZYFAvMmYZjtoes2XBoHsZOH1VX2YAEkAfT9GpEY4e0il986KjzFCl3J1pXNAxioTNmxwBc82bKYzybhnShT5g3AjG4PtX+4Wo1hY/fcRlKXkFI4G8G4FNuienwxFmpg+2rBbHyG4kDboSPSs3yXBlBLs1OB1dWbtgZGaIqh0Yflt/YvaewDz1PTxTEDeucEGzb05oOGL6/Gk92djOn0sK/2FqUvlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gTAQo2ZdJr7KL7ACFzpn34b6XHoSyP7nCp/LZkZwBC0=;
 b=MZr4MUcBtx5Lfla/Wes97PLJSxViZSdxPQhwfJufIUzaQFG4Mk7DJg4VimGAQzvDaR3hw17lzBKbY+ESXjD+Oqtfhb/srYaZI8p8MJOCLyEiuW6oJ9P6qgMVRf0JzdgwXziXdTwLO6nOYrwgrtfnxktCOo5F0rg+tOrBQAygf6s94fmoFu17lAP0KFpaBEuOlBcypF0XoPe8RA4HGSNIjXvz8z6jQ6bBdOd4JexJTLRkbe+dnmmDByD9UA+GsrSXDlxRSEANYmdFjvpddcde/+ugwvUuArT4YlGmOJPWgg4KMp6LzLrtGI7E19J3ph6be/3dla4dbFMA+IR3AMQ1+A==
Received: from PH8P221CA0024.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:2d8::30)
 by LV8PR12MB9450.namprd12.prod.outlook.com (2603:10b6:408:202::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.19; Tue, 14 Jul
 2026 20:55:30 +0000
Received: from CY4PEPF0000FCC2.namprd03.prod.outlook.com
 (2603:10b6:510:2d8:cafe::40) by PH8P221CA0024.outlook.office365.com
 (2603:10b6:510:2d8::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.10 via Frontend Transport; Tue,
 14 Jul 2026 20:55:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 CY4PEPF0000FCC2.mail.protection.outlook.com (10.167.242.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.223.9 via Frontend Transport; Tue, 14 Jul 2026 20:55:29 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Tue, 14 Jul
 2026 13:55:14 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Tue, 14 Jul 2026 13:55:14 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.11) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Tue, 14 Jul 2026 13:55:13 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Will Deacon <will@kernel.org>
CC: Robin Murphy <robin.murphy@arm.com>, "Joerg Roedel (AMD)"
	<joro@8bytes.org>, Jason Gunthorpe <jgg@nvidia.com>,
	<linux-tegra@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<iommu@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 04/11] iommu/tegra241-cmdqv: Don't run the error ISR before probe sets up vintfs
Date: Tue, 14 Jul 2026 13:55:01 -0700
Message-ID: <c1b474c1b2a2178770e45c200c5c42b6be4be4e8.1784059577.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1784059577.git.nicolinc@nvidia.com>
References: <cover.1784059577.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC2:EE_|LV8PR12MB9450:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e0fc20f-8f3a-429b-8dd5-08dee1ea3d1e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|36860700016|82310400026|23010399003|22082099003|18002099003|3023799007|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: N0oU3YTP2zJ95hTsDkmK0bsBVX+Aa/bIKXPdIrsWsDAoXFo+boJ/Tj+0pfi8lKgDaLXgUhbr/R3wg69YTU6cbklMrDRyUWjOetXqMCGIwzotUzOqaarmpfQttiJ4kytl0dXkydh/TRpWUrCVnoqmxov1zX6oZk8XQiRo8qKnEXqLkCag+nGgPwLljJK83OjOboXY39XvHIXTEae8e6ZyuerccyRnbK08yu2UfMmSITRgtY3QcQXgnAy9X8TkO4EK5D27ttg65FLASd7Q+v/ZfVYXS29FHQdbgc3obNO+Y8pvCB/7EQPZuCtENU7MmK7sI0fL/xY5iIpi2fek2IAjeShOwgqyBJl+9fUlF/VoqJcbSFgbgi7LFyW4pyDZfrBCaDLj9JvD+f0MwIBFE6sUbz+58X6zSjQhG12ZBiByeio2XNo5ZTdGNxYAJCnT7exDVtc3znts6G+Q1qPjMF7iGXH4efAY9Y9YYJIzcGAePFonkV4jrzbRNQlx/aM3f/SZBbILrjzpn087K63VSLqBO1KcrFYcsNU6mRkixl/ijl8bmfU1/D1U4/KlRxzfkVDwck5khY9+Zoz8Rbryb/CBhFuQIKUi04iGUSR2Msjuq4xVJHdF1MjvzUs4dG15QKXNdIxHvkz/U+hRNApDhT6SpF/LC+JLxG9QnJYx/jcs0Jv6iTOXg9rPjwnMQhYWcG4RSDgwskTnY37HZNjLpiDWQA==
X-Forefront-Antispam-Report: CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700016)(82310400026)(23010399003)(22082099003)(18002099003)(3023799007)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: JNwUwnSCMXND1xHS5CuAM13Y0ZoA2GcBz9rd9EiNCQHeX0sZIDMtCZZcRbSP3ZNsIfbsNH7vs2aFL9tYxa2JbzNsbEWB9glZFanVV7zt7Ar+pwF++UzMyELS33GXdgMTP5NI2XkmOJn7oLKOe134wD6VyNg72mnjgkZHxqOvyv6pvWhG/gHU01c7fetPXmwThB9iDLc7/rp2bK2SsbSfUF9x1qgrKC5aApRv9SE7ZA7aG2vwiGMY/2O0BfP+EzRdSW/yCSFUEHZtjxegWtzCvhGwD2ng6E3ZfJNcrjYSGrrZ2u36swgGIHlazWOqa3HLhEDPeS0lrzcZ4WjVdhFHWOwURt/UIwLMZ/ASsRSWQhrSarSisV1otX8UlUSVddII7S3PWPgm0h1YQYIfUQghzxtaPf5Ih677SkHBIoHLptnllr7S59VFBGTWL+IZUtjV
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2026 20:55:29.5870
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e0fc20f-8f3a-429b-8dd5-08dee1ea3d1e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000FCC2.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9450
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_135541_906131_A8D214CB 
X-CRM114-Status: GOOD (  13.86  )
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


