Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5156CD3427
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 10 May 2026 21:23:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wXF7/VnoFyjuP/yln8XBDFi+P1RESZRxh0nlAC/WRtM=; b=WmghB7YY3bzpX0Ni+j48+aNJ+P
	hMY2QZK8CelPC364nxS26IJjjvCHnvE2kKEhJEgVtIr6i5XauC206jWqG+Jfv6sPd0j+icP1U5ze2
	VdhDKRNjTUt5i3gg5UNLdSSYLtprXqmN/vaNKeTylyI5j3fUz1mw7CJGYc7baWfOCKuYYlbmoW4D7
	kozhedJ5QWh6wxXxtHnWqOfJD9PTb3SFiVIS7CXEC2ZH42AJhqRDke2VCYmpceEGzfilumz7zLAfa
	6URKZo7Euo6s5lxvMm5h45+oGfBXHD9SySYqGEc830O2GMlUsz2sJ7PynXoQum5gTpErhHDFp7EG1
	frHtn6OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMBcd-0000000Bdx5-2Dy3;
	Sun, 10 May 2026 21:23:35 +0000
Received: from mail-southcentralusazlp170130001.outbound.protection.outlook.com ([2a01:111:f403:c10c::1] helo=SA9PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMBca-0000000Bdul-06Le
	for linux-arm-kernel@lists.infradead.org;
	Sun, 10 May 2026 21:23:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZUPN3tCe7gZCir7K76KqtEUGUyb8qZEURzI9WTe6YAhjFKvW9b12J1uMqNVl1EY5o7DOQRTVX+QDFvXhjmj4jKQ03dLUXhKEjFFMyPM1xcFI4plAvrA1Ey97raQSA62m0lTZi49ewUAAaJkN38dBdJ1XnquCnUTmjzPRVrhYiTEvWuEYDVOchoiQyUan4dOQkhLNO7AWvygxZQXFU0x+8eqzwuiDq1t+wtxuOiX5789HvNmCcnUFruT9b5F6Yi0IM0UAXhiDB9vENxz4w+TtKiqt1tvcPMo/OuXvZfhEkBaGdpyT686WhPqV7zi9sH3vQnih0K8cgVfFfFzg8jO0BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wXF7/VnoFyjuP/yln8XBDFi+P1RESZRxh0nlAC/WRtM=;
 b=OeI3DoI2MH/qM9j3UaXC8xNOZ0TqSsz2eogC1O7aieXymMxgjoLEM1vyKtzgQtuPlbOFyHX20tqGg1mSJu27UBvy3MR0I0pWniMBBx1A/FONFGnybY0gAoMcUKV1ueAhGxTvFs+qwrr6n4ERqR4L1fNuDMS7A6MfN3AvpkJjQO5UNULwBaWtQ+e00jcgp9FGlUL9EmpHz/AKcZKCDiso/AdweScRvgVel9WJgGhnJ2A1XfWc3tNw1g7YpFGvhT/0UvPbtSoa9ZrXWH8/SJyRzVoB76XFMJUS568x0axkClDsIzP5hWWRU2Zv3ht5YtV76KiCI7RwuF/lPhQJ14iRYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wXF7/VnoFyjuP/yln8XBDFi+P1RESZRxh0nlAC/WRtM=;
 b=KLjZxg6Qtutu6qfmIvJ7Pw40a/5pJjWaNqh3+fhlQ1TAQmVlgg4SXHPR2/7YkIHhx8GynbmRu7RLgjmj5v7331IH+zVmLA3T1be++IuQhOhmLKGc2iAYKd7aC77LT91J+TvX0UMNDnhrex1Z68Pev+JjRnFkM0Irh2cP2wsc0XdLab2e0jHdR/6Ti9hznBl/KF5z13F9uvaPguquaEV937XlQyVJx9c4Xe2CSdFxKxVKoec4KVrF8AfnV8EL/CZBstMRpwFsqJdzPJjX7tGx9DSsxtZnFQWDS9z7jDpV1dz38X25CuEegNJVsYqfvqzHVlfFot4Agzra9gLSAlzBag==
Received: from BL1PR13CA0186.namprd13.prod.outlook.com (2603:10b6:208:2be::11)
 by MN0PR12MB5956.namprd12.prod.outlook.com (2603:10b6:208:37f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.22; Sun, 10 May
 2026 21:23:23 +0000
Received: from BL6PEPF0002256E.namprd02.prod.outlook.com
 (2603:10b6:208:2be:cafe::1c) by BL1PR13CA0186.outlook.office365.com
 (2603:10b6:208:2be::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.14 via Frontend Transport; Sun, 10
 May 2026 21:23:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 BL6PEPF0002256E.mail.protection.outlook.com (10.167.249.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Sun, 10 May 2026 21:23:22 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sun, 10 May
 2026 14:23:14 -0700
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Sun, 10 May 2026 14:23:14 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.126.190.181) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Sun, 10 May 2026 14:23:13 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: <will@kernel.org>, <robin.murphy@arm.com>, <jgg@nvidia.com>,
	<kevin.tian@intel.com>
CC: <joro@8bytes.org>, <praan@google.com>, <kees@kernel.org>,
	<baolu.lu@linux.intel.com>, <miko.lenczewski@arm.com>, <smostafa@google.com>,
	<linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <stable@vger.kernel.org>, <jamien@nvidia.com>
Subject: [PATCH v5 3/6] iommu/arm-smmu-v3: Suppress EVTQ/PRIQ events in kdump kernel
Date: Sun, 10 May 2026 14:23:02 -0700
Message-ID: <6e5828f3288aed6f9e9f4e0ca54e7fbd9f439274.1778416609.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1778416609.git.nicolinc@nvidia.com>
References: <cover.1778416609.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0002256E:EE_|MN0PR12MB5956:EE_
X-MS-Office365-Filtering-Correlation-Id: ecb94f07-4085-4892-1e46-08deaeda5da5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|376014|7416014|36860700016|1800799024|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: aaV897NE9K4IWIavoxdOA4drbCDAA/XHcl5OfMhjvtxtbEQSNYDw57l80nK8tjPDVHgg0VIlJwJoXYhlwObY37oU0HmjaEpkJ0D/O234b/+YDwIA+G0QZzmiorF/RUINmzetm+9E4mH7q0NHqbOGJTcl39tsWJ6zBNpCardkbrg2xGZ4wJHTHxwm99wcTQuUZf53FVjYL8Rdz7fYWbakCllAE3kAg/WhHiN/tH3BVfg37uPHB4d/2bPbHedc1c4ftaPQB9SFnrm8BTZnn0/pXZU+GRgr8s1vch/aB9UvvUx0qp6kZ+/TDqaczuB+tE9ZzzElCRMJgfdq7TJcGjD+jTxkQg06aj9f+bKkok3I0UMixX0qnOHc4bnRJuXf9ej1oOwnXE7OwqyR0wJd1LMWRyroJAhx4DrzF1nrS3EIgDaog92a72bQdrDGNYJU9xExNwwa06OLmR7xOFwFFt8NddmQoMXbqJUO8OTlt4zaf4NfTV/hIs92pchYsRfE3/N2DaiO6RToeo1qgfvvJ+QeCkIgsqxQJv6k9XK7lYrUnteKYLaDvteK6LKjq/rXMrei546jq1NHR52aYElR5yViuD47PfSCS9utgYVZhpbtotgDzzkj7fRQIAOCMzbAY3Eq8Ru0v59gUHRlR+yjTPautbQenAw86Ao+1mRuqD/cQpIbRzntfs5GJy92STYj1dn+KfIXSYXIh/COX9kqHK5JQT1tBFBca6KqM/dwpiY5U3o=
X-Forefront-Antispam-Report: CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(7416014)(36860700016)(1800799024)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 2G+Wk/IAvbRi6BATfPdAqvIGcLliC4Ha5LFKbNkUrKVXXI8uu/pHARrnGTP7pXbQd2AyowZ/0l4D/HOj9O99EX3NMgUCBABUPuD5uvczG+thiOMPA0BlcDxHDQt0oC+dbmIP5vknk8WNPmK3yCJhBfsjE+SDpzSmW9lwBeWRfr1hQFNQ3GqqyLRA6pvYXuQ6lJWcgQXs0MDEIG7m2zXurhkDqe5QDJm1CSP7kHLbOYrGevi2FVEQHqn/ahJ1G8HG6PB72ergVR+FMi2kbp6ALzihqSNlCeujhXwCI8wWFViaYRNygsdpWMy1KDIdPLDhekWDqiRgP76E0MRbO2wioFBrP7Te4vjUDFcmCFcDKdujVtE28TNKh4RiCiv+1NRmPFgVxO+SZCppNVCnGSvJ9YqwqCH8n+Xaqrat2QXMQMC/xz/csI/X50BX9vOMvJ8C
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2026 21:23:22.8478
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ecb94f07-4085-4892-1e46-08deaeda5da5
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0002256E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5956
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260510_142332_122892_41E283AF 
X-CRM114-Status: GOOD (  14.86  )
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

In kdump cases, the crashed kernel's CDs and page tables can be corrupted,
which could trigger event spamming. Also, we cannot serve page requests.

Skip the IRQ setup for EVTQ/PRIQ in arm_smmu_setup_irqs(), and guard the
thread functions against being entered via a combined-IRQ delivery while
the queue is disabled.

Fixes: b63b3439b856 ("iommu/arm-smmu-v3: Abort all transactions if SMMU is enabled in kdump kernel")
Cc: stable@vger.kernel.org # v6.12+
Reviewed-by: Kevin Tian <kevin.tian@intel.com>
Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 23 +++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 579c8af82d6b6..ebb0826d74541 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -2364,6 +2364,14 @@ static irqreturn_t arm_smmu_evtq_thread(int irq, void *dev)
 	static DEFINE_RATELIMIT_STATE(rs, DEFAULT_RATELIMIT_INTERVAL,
 				      DEFAULT_RATELIMIT_BURST);
 
+	/*
+	 * A combined IRQ might call into this function with the queue disabled.
+	 * E.g. kdump, where stale HW PROD vs SW CONS would drive a bogus drain
+	 * and a CONS write to a disabled queue.
+	 */
+	if (!(readl_relaxed(smmu->base + ARM_SMMU_CR0) & CR0_EVTQEN))
+		return IRQ_NONE;
+
 	do {
 		while (!queue_remove_raw(q, evt)) {
 			arm_smmu_decode_event(smmu, evt, &event);
@@ -2432,6 +2440,14 @@ static irqreturn_t arm_smmu_priq_thread(int irq, void *dev)
 	struct arm_smmu_ll_queue *llq = &q->llq;
 	u64 evt[PRIQ_ENT_DWORDS];
 
+	/*
+	 * A combined IRQ might call into this function with the queue disabled.
+	 * E.g. kdump, where stale HW PROD vs SW CONS would drive a bogus drain
+	 * and a CONS write to a disabled queue.
+	 */
+	if (!(readl_relaxed(smmu->base + ARM_SMMU_CR0) & CR0_PRIQEN))
+		return IRQ_NONE;
+
 	do {
 		while (!queue_remove_raw(q, evt))
 			arm_smmu_handle_ppr(smmu, evt);
@@ -5056,7 +5072,10 @@ static void arm_smmu_setup_unique_irqs(struct arm_smmu_device *smmu)
 static int arm_smmu_setup_irqs(struct arm_smmu_device *smmu)
 {
 	int ret, irq;
-	u32 irqen_flags = IRQ_CTRL_EVTQ_IRQEN | IRQ_CTRL_GERROR_IRQEN;
+	u32 irqen_flags = IRQ_CTRL_GERROR_IRQEN;
+
+	if (!is_kdump_kernel())
+		irqen_flags |= IRQ_CTRL_EVTQ_IRQEN;
 
 	/* Disable IRQs first */
 	ret = arm_smmu_write_reg_sync(smmu, 0, ARM_SMMU_IRQ_CTRL,
@@ -5082,7 +5101,7 @@ static int arm_smmu_setup_irqs(struct arm_smmu_device *smmu)
 	} else
 		arm_smmu_setup_unique_irqs(smmu);
 
-	if (smmu->features & ARM_SMMU_FEAT_PRI)
+	if (!is_kdump_kernel() && (smmu->features & ARM_SMMU_FEAT_PRI))
 		irqen_flags |= IRQ_CTRL_PRIQ_IRQEN;
 
 	/* Enable interrupt generation on the SMMU */
-- 
2.43.0


