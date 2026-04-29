Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C1C5CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 07:22:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8/YgeRMPs1947BIjmWAPT2oWeN++jyT+HkpDryUX+TY=; b=IrEAcmv4l81anAapwAe5CsvVwd
	Cm8Kpf4CbddLLFgbNqXcdpQMXRpVHxJsMe8YogipeLIeJP2d7K9caSmxKZSpK06gTmWnkAMGflGkg
	JMzzPCMHxEQJ47QBeHmBcaoiMyGyHHLwtBZQwO0I7Hof425GGvjcg7oXjrQdbkSm1L9aHs/9fUNrY
	IMZWtlc0hi9ryBgtpxdXN49Ux6k+xOrCBi0gBSAhlb9H8uEBJHb4opHm9sz4kmZ+qMnjArpMFBz6u
	gv+0cW9S8gKsGdZKyKK2OS2x8bQVkoi8kLfOQmxejVNPDylqT8zXIWcjhLNlZ7WZM4xtQ004ZSymk
	z+3nNw+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHzFU-000000038jI-1nvQ;
	Wed, 29 Apr 2026 07:22:20 +0000
Received: from mail-westusazon11012036.outbound.protection.outlook.com ([52.101.43.36] helo=SJ2PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHzFQ-000000038ge-44cB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 07:22:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uWg0OQgzX347cTF7FvIPKZiFgpSgYl6s3ZUT2Pn4WvYmEWLqFsRlctfLOCIUo5i9k7ONEfQtvOaPFpz1WLx74Q8P+ljvyAzIOw5YHJFoIQR5E7S4mipJQcngwOCwZiach65wXuKun7aa/V2JsRemQ4q/W8c5McPIJgTRrAT6Mz9pHi5OmfqdRTF9fDSiCvYM95Dp2k3QTmWRvDI/pVxZJlXPdfBTD0Nz27jnITQH11WkUjH3oWEORZhjJdtFJG1Zr1MkXVbMZ308p97JN8Qx/RPTjaL7g+I59tR49/KF76rs8h1ACq/qVVYM8n6Xn6MPtsarwbKwM3luM8vDeCScGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8/YgeRMPs1947BIjmWAPT2oWeN++jyT+HkpDryUX+TY=;
 b=SBhoz1swXPG0vnrcgT4Gn6xC5smmkBu0MG8mVjhtbtAD/OEyWsBK+qajxHtUB/MepgHsJ7u+CO7lr0VfMfPLj/D1kJYjFmUupBoYRqLgxCY6VoCWrY3VPzKNuDY5kpgbZMGSaTvTKkiti/5uByuZTqVlw8hBAL4BaoMuv5EsOUYTF/ihdWsoB2aCxP36w1IWRrCqt3pgiI0oi4reMxNZ8uQP8W3MH6UB/a9tmtfRD/2p5K2nxes4LpVPnVTI9TaADDqIixqL6KPFEnLyKs7MCFLYNPEmqHJ+U7rxScN1QmAXgZBG4wunf+Jjc4qftRO/g9BvJowVsY2DkvdINCn5jQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8/YgeRMPs1947BIjmWAPT2oWeN++jyT+HkpDryUX+TY=;
 b=rrDvVQIqiFQG0l7cIHmuqFzUFUuJgRZWal6BwzloqXzkKYgoAM3M+J9I9s0ToHrcMjmU/Loq9NLIuWfxe7Vxv0kEMZc4k07G1ebiAbUjHYw3m9qFmRHJuOOsYfIkIn2rNH6REkP4wIcKOXfr/iFSVxG78BAD3bzZY2q/pxjaC7LAcs1KwUZwtA6Y6sCmSNyr1rwl6dC2U1PLsEBgxZZJiFOhlccoejRraEmB2ZVkNUn89QvdcZC+gM0WNfKQO4pknRYtDt9U8UAiEHvNPIE30CbbdLZfcho4MXZzzaL4mbxDzTYUF+7n33viqp6JbvvKly3X7XOSEf4Zkl6EUXUGYw==
Received: from DS7PR03CA0270.namprd03.prod.outlook.com (2603:10b6:5:3b3::35)
 by SA1PR12MB8141.namprd12.prod.outlook.com (2603:10b6:806:339::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.16; Wed, 29 Apr
 2026 07:22:07 +0000
Received: from DM2PEPF00003FC4.namprd04.prod.outlook.com
 (2603:10b6:5:3b3:cafe::21) by DS7PR03CA0270.outlook.office365.com
 (2603:10b6:5:3b3::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.26 via Frontend Transport; Wed,
 29 Apr 2026 07:22:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 DM2PEPF00003FC4.mail.protection.outlook.com (10.167.23.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Wed, 29 Apr 2026 07:22:07 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 29 Apr
 2026 00:21:54 -0700
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Wed, 29 Apr 2026 00:21:53 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.12) by mail.nvidia.com
 (10.126.190.181) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Wed, 29 Apr 2026 00:21:52 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: <will@kernel.org>, <robin.murphy@arm.com>, <jgg@nvidia.com>,
	<kevin.tian@intel.com>
CC: <joro@8bytes.org>, <praan@google.com>, <kees@kernel.org>,
	<baolu.lu@linux.intel.com>, <miko.lenczewski@arm.com>, <smostafa@google.com>,
	<linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <stable@vger.kernel.org>, <jamien@nvidia.com>
Subject: [PATCH rc v4 5/5] iommu/arm-smmu-v3: Detect ARM_SMMU_OPT_KDUMP_ADOPT in probe()
Date: Wed, 29 Apr 2026 00:20:53 -0700
Message-ID: <bb1aa2d0d1fabadb76dfef9ea9cf44f4a96c65be.1777446969.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1777446969.git.nicolinc@nvidia.com>
References: <cover.1777446969.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM2PEPF00003FC4:EE_|SA1PR12MB8141:EE_
X-MS-Office365-Filtering-Correlation-Id: 28bcec21-9d7e-4d03-17d3-08dea5c00569
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|36860700016|1800799024|82310400026|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: F++yRXvsKp9LTDNFFI7TJAi2z9c8eblampBZV47bcnj9j8cY1AclUMWfXtovW46lkzOEtoUhQj2+2qxtnIGRhXQiXXzgb9xIyRsU+Pe6xuV70SRftdldKPAq0YrCz4jR6VHvH+Bg7lqnG3j65781VsTg5GtlRkA0uC4fioCMr9C9cAkPbEL0jvaqe9Izln9pFehaArSI2DoeAqwFli+H74XmwXAoQJ1mXgvO/Gug8v+DArt2sVSM0VmGE91LWmSMCijVglYkwwjkJitAdMCzTDXjynfdARy1hFo+QZaklMkZVFV2cumg6G2KvxPMe9tfWIJygh5S7f+s46rhyY+mIbC3638Yv5vfB6eky6p73+RFtdjbUwPrdx4AtYskOT1CplstQy5oOlo3q7y6oSleYSKit9thJOhepF6uvC5USU76RXSrGWAOs66ksEwXj1F00mW43HfRbTZCWhroNYrUDjxMgD0mrTJRpZM+D5ZMfYsykoimB/A24uUDrxZMzE7QDnsAOODI2PNb2ZDg185X9M3vNLmVnlnbgLHm4As8gGvGL19EIGx63sK55WBpweIpY2pNc7LzjWhXkDnJ1kaeE9wDuZUvEVnTjS4qu/aBnEHWrRXILIosEF8ah+v14SwXsqkcunTgNDN0yKDvC/jYQ708QVpM9Ns1l7wRNDfmgXySbV2mPzXIzeue9xfn/CkJXA5urQcr+C50mLfEQzv7QbDQFXsGQ9tpYjEvmo2DlA6Ry1X744oqW8m/sHesgYzoYzHsMu3hPpV3ipBn0v8VjQ==
X-Forefront-Antispam-Report: CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(7416014)(376014)(36860700016)(1800799024)(82310400026)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: PzHFUxtfp3HUzEU8brc3Dha8o2AdEllYYEyWSN4S6N0/UczVl59Ph02AMZi0D/fsR9Apm3Ff0NIaRWbmF7OHC99wjT3+xgV8EEKr43btODlVizC1kVTiY3FQTzh4aF5+MFme63g1RV55I1Vh4ZZquKBgTpt9DLujgj9SK9lFeE/k844S2G6IDkhhb0/bR1amolfydCPPljYzeSKOkn7tOdjWFbvPY6xUY5g0rg8evF/YzZrdif0AVLHrK7LOrLwzeU6Xm7939oRBKzfNmkHoIyoksw7NWeyEZWnEQpMuvnr1GcEV6HHoVxEa75cncENCGwjcO1V7Qs19+NQpfDsS774lfmt4x1m2C2Vn9lC9YlllkP70aEWFNX2SrwCPQ/cY/x4OYKh6RWZd81KdL0dkKUr7bhPFDPqbM0ZHdHxYEPshOpkHUCWrEZnuL+GNYFyT
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2026 07:22:07.4746
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 28bcec21-9d7e-4d03-17d3-08dea5c00569
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM2PEPF00003FC4.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8141
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_002217_015127_29423290 
X-CRM114-Status: GOOD (  13.68  )
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

arm_smmu_device_hw_probe() runs before arm_smmu_init_structures(), so it's
natural to decide whether the kdump kernel must adopt the crashed kernel's
stream table.

Given that memremap is used to adopt the old stream table, set this option
only on a coherent SMMU.

And make sure SMMU isn't in Service Failure Mode.

Fixes: b63b3439b856 ("iommu/arm-smmu-v3: Abort all transactions if SMMU is enabled in kdump kernel")
Cc: stable@vger.kernel.org # v6.12+
Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 34 +++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index f9332cf0b28a6..18e0d97cec401 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -5402,6 +5402,36 @@ static void arm_smmu_get_httu(struct arm_smmu_device *smmu, u32 reg)
 			  hw_features, fw_features);
 }
 
+static void arm_smmu_device_hw_probe_kdump(struct arm_smmu_device *smmu)
+{
+	u32 gerror, gerrorn, active;
+
+	/*
+	 * If SMMU is already active in kdump case, there could be in-flight DMA
+	 * from devices initiated by the crashed kernel.
+	 */
+	if (!(readl_relaxed(smmu->base + ARM_SMMU_CR0) & CR0_SMMUEN))
+		return;
+
+	/* For now, only support a coherent SMMU that works with MEMREMAP_WB */
+	if (!(smmu->features & ARM_SMMU_FEAT_COHERENCY)) {
+		dev_warn(smmu->dev,
+			 "kdump: non-coherent SMMU can't adopt stream table\n");
+		return;
+	}
+
+	gerror = readl_relaxed(smmu->base + ARM_SMMU_GERROR);
+	gerrorn = readl_relaxed(smmu->base + ARM_SMMU_GERRORN);
+	active = gerror ^ gerrorn;
+	if (active & GERROR_SFM_ERR) {
+		dev_warn(smmu->dev,
+			 "kdump: SMMU in Service Failure Mode, must reset\n");
+		return;
+	}
+
+	smmu->options |= ARM_SMMU_OPT_KDUMP_ADOPT;
+}
+
 static int arm_smmu_device_hw_probe(struct arm_smmu_device *smmu)
 {
 	u32 reg;
@@ -5616,6 +5646,10 @@ static int arm_smmu_device_hw_probe(struct arm_smmu_device *smmu)
 
 	dev_info(smmu->dev, "oas %lu-bit (features 0x%08x)\n",
 		 smmu->oas, smmu->features);
+
+	if (is_kdump_kernel())
+		arm_smmu_device_hw_probe_kdump(smmu);
+
 	return 0;
 }
 
-- 
2.43.0


