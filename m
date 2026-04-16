Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7444FF8E493
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Apr 2026 23:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k1Mj1LBauyDdAO7B4BYNXH35KS6f5YoBnRkjbDINpVU=; b=osqrtGC1hBI9beCdIU/Uk6R60A
	kDIQZhRhesdtpaT6kmfAF5YWDLi/J186VMHZHbFDYGo6iz83x0h/v1FpZ1/VaoJ3Uo5fYjd5iIJ0+
	LYV5sgEGW28qaWlvTxrSeDPjnucNQ1e0rJ4ibKUSOoyWg8+K4BiS7hVbo1XxaNH0uqViJ+QAE8zmc
	po+YwwFwc4bvzLT3xNNnSGOCMZJ0alCFODumgZXhbZw656d39LQ7FHpMds0rMU130c13xnndOSAh9
	E4IhtUuw8wyoNDe+Bm6eg8mF1KKEfr2yH4j+CpkNczPQ8X2JphV6Sn7sX8NOqFWKmJ2ijglqIBtC9
	3WSNcCAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDW9H-00000003B48-20Zb;
	Thu, 16 Apr 2026 23:29:27 +0000
Received: from mail-eastus2azlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c110::3] helo=BN8PR05CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDW9E-00000003B2q-0PpV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Apr 2026 23:29:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yLsbqCtS9IwEg0v7J7RlUez/Fniqvodw/68rm4JAO5t2akwSCRgfPOonIU1a+BMvdduk9r239Nva5ecz86rttgrcljfQ0lh8878OwlNCeK+ApgVeawQqO9is2HV/h2RrQLtsd/bV+Xj43sBf22lc9HRZ4V2D5k7TWPE9/oUpHP5DTtWzT4zzVnHWLTXpnllbSaoeSJJEyod+BnstTNQc/gu4KeiOz6qpTqQK2VxEt+lFmdPIm8gCeC/D2JOMDUo3zxsZ7aFf/sweySbrRqRSXY3ZQUvzyv+nPq22b8IHn1J3QfNM69rQ4oNDRR8mhAE0JKAxGme/54+9+EXVY/xrmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k1Mj1LBauyDdAO7B4BYNXH35KS6f5YoBnRkjbDINpVU=;
 b=AHzPaEZvrzPLfzOkpZsJ0Ya7la6EfqtKJQm/UBO++M4ljbKuua470Q3AKZUh/ILexOhpZHWQGVDr9Jx2Xaqp8fzqx58CBoEnzVrO+ELEw7KmidwrXEycLf3NUtf7S8xNAtIUPEml5bsgO3F6X6dEXjONr/LHwYytiLMIVHNpSECpVhIiJOUpZH+K8n6FPmhL5+yLR0H6ogS4Lj4kYZeyTRdxzaXm6tLPuP3u1N/t5fYIIDakPbOVqZybJy8POIb74O2GbaDHNuVcVl2QCgLSz5j52AIf0kOBrQPpfNdcavQtqyocB+6u9dFaJ36ntyOcAvVkvF0ZdDla5w3AoXqfvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k1Mj1LBauyDdAO7B4BYNXH35KS6f5YoBnRkjbDINpVU=;
 b=LAlxWFwh5KjmkXCDMxUtHoUCM5MCr5CoNKz3ZAH8XMxnss4/5lVt+lhp0706oRBXQlNCnpekPy2yzOwrueZ9Y5UNeHTKkwOhwiJK1qy8xrwvGzdVQOUIkk8Tb55OQW/iMxs8PxviSq9lcxnxys4I6WmFXXGGUcjmdlAek/QB31A13PO12q+O9j+HyKtCpEF/EQHBnxVc919i66f7rpd3cxmM9iME9eCjEUMKGlGtLDPtdETr93Zo91zbaKOHfuoWfc+n28cSUlWo9VUiQDgC/TvyrCdjsqH/M61aBVsn++Ft6DEbcj+n516Ep490/cHIiFKB6cljxkI15/dmD8F90A==
Received: from BY5PR17CA0065.namprd17.prod.outlook.com (2603:10b6:a03:167::42)
 by SA1PR12MB999254.namprd12.prod.outlook.com (2603:10b6:806:4dd::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.20; Thu, 16 Apr
 2026 23:29:17 +0000
Received: from CO1PEPF00012E7F.namprd03.prod.outlook.com
 (2603:10b6:a03:167:cafe::26) by BY5PR17CA0065.outlook.office365.com
 (2603:10b6:a03:167::42) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.52 via Frontend Transport; Thu,
 16 Apr 2026 23:29:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CO1PEPF00012E7F.mail.protection.outlook.com (10.167.249.54) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Thu, 16 Apr 2026 23:29:16 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 16 Apr
 2026 16:29:00 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 16 Apr
 2026 16:28:59 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.11) by mail.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Thu, 16 Apr 2026 16:28:55 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, "Joerg
 Roedel" <joro@8bytes.org>, Bjorn Helgaas <bhelgaas@google.com>, "Jason
 Gunthorpe" <jgg@nvidia.com>
CC: "Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
	Pranjal Shrivastava <praan@google.com>, Mostafa Saleh <smostafa@google.com>,
	Lu Baolu <baolu.lu@linux.intel.com>, Kevin Tian <kevin.tian@intel.com>,
	<linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <linux-acpi@vger.kernel.org>,
	<linux-pci@vger.kernel.org>, <vsethi@nvidia.com>, Shuai Xue
	<xueshuai@linux.alibaba.com>
Subject: [PATCH v3 03/11] iommu: Add reset_device_done callback for hardware fault recovery
Date: Thu, 16 Apr 2026 16:28:32 -0700
Message-ID: <c90693e75c0610da38103a683b558d5596bd843b.1776381841.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1776381841.git.nicolinc@nvidia.com>
References: <cover.1776381841.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E7F:EE_|SA1PR12MB999254:EE_
X-MS-Office365-Filtering-Correlation-Id: 28176e69-ce49-4ae4-eea3-08de9c0ffa0b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|82310400026|36860700016|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: RHXSxaU+/ahkQGbw7rsLod1xXamHmpKclaIwJfaBI/NPetf8rSHjSg0EJppclzeMQVS0oQeIFmOX1sepJG12mMXYlhIbq9lPYl30TGuSpZJfYG5vCfQdAADuu417ciFRbAxZIotEsS9v57Nd0MzaoTm4CF5cmFvC/Xe4bqCoJyJU5jK11J6B3K3dwgx2pEPAqgz+catmOPxz8qzYVhuejRzAn6Zzsf4cJUVr7z4pSIRnK2jAgXFFHq4mrxgi+qboioa8pZYdaU6qyvuE91cssRmysx8JgJC7Ko84RurhNHwg6TQ4sIui0aWlcW8Yk7ZKlIeh4M6EOAxlRepW1IeEZUTCDhphSVwrhrDQy+v8gNOHZtNGzLXTOZjRH87DqqjyRZtzaluJlKVqFsYWDzlcVsSoR4LR3RpfKUPnvKl6nOvK6BTgpf7TVp5oQkHbXZxp4bl3MJQYvrYbsv2I6VwJ/UMzd5b6uVEWm9NBaIyHJ5InJdFjx2OWrzkVDqqrDeHPadyR6EOW89DNvbESwgB943mqd5dAYnwaSx03sB0bTpGTQ4F9kg+ipmLQrYW9lVac5VjTkKweKSXgAV2b/J49syIwNSE45KNu3qIy9KG+oRDwmHoOZHNVptLrSrJ1QOLfzK8ke7nr2mnlVFOXQ4bvMSGHdo6MgK9Zf7QkQoSsfBClRmcJ2JujLrgm3NhVo7YVrrbLqWBsZibsb+pXOSSkz5K7HPUOV9GBSG587EWoPqcD+A+9hQ0snTmUBEUNoQkNAP77EDGEbBfJHOOe/X/eSg==
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(82310400026)(36860700016)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 5wVyJpGHSORQ2Eh/pNsSTi6EL1PKrQiUa1khw7wv3S9FgyLjZ+7J6+WHxwZhBY7ADefoIRUxrSGV08FxsDYvcWxpgmYqqsw7aD8/VWKwKtLzDpfCnDDxt+uFqgTLH8lCP5YsIlxI54HXnjkwLVWbc3s6HvlJq28cRdhddvsbv586dbiUPmU7RN8P4vdk/E/WOKQTYuyt1Ww5h2dcN2hfO7ypkxa6Tnzg/fTp5k/CUDzKhSvLzfaaHDVdBAB4oacykgsaRAvo1z+Ao0leYk+xX7qA2e/F1Zixm/1iWNderKfuDUkxVhvlbg16L7nVo37p5cctebxeOjqpQo/vvj/xs5XbGKT6obTjwYFCH45olRbg+lDK5Nayzz85Zh3p1izR3wVyx0wcX0H7K3KkduzgKp4FHs5EBro1A6mxUHq0p0hwRx3P6z+Z7JqZUJcGiFR9
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2026 23:29:16.5769
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 28176e69-ce49-4ae4-eea3-08de9c0ffa0b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF00012E7F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB999254
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260416_162924_141261_5AA49BC8 
X-CRM114-Status: GOOD (  16.88  )
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

When an IOMMU hardware detects an error due to a faulty device (e.g. an ATS
invalidation timeout), IOMMU drivers may quarantine the device by disabling
specific hardware features or dropping translation capabilities.

To recover from these states, the IOMMU driver needs a reliable signal that
the underlying physical hardware has been cleanly reset (e.g., via PCIe AER
or a sysfs Function Level Reset) so as to lift the quarantine.

Introduce a reset_device_done callback in struct iommu_ops. Trigger it from
the existing pci_dev_reset_iommu_done() path to notify the underlying IOMMU
driver that the device's internal state has been sanitized.

Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 include/linux/iommu.h |  4 ++++
 drivers/iommu/iommu.c | 12 ++++++++++++
 2 files changed, 16 insertions(+)

diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index d3685967e960a..3c5c5fa5cdc6a 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -626,6 +626,9 @@ __iommu_copy_struct_to_user(const struct iommu_user_data *dst_data,
  * @release_device: Remove device from iommu driver handling
  * @probe_finalize: Do final setup work after the device is added to an IOMMU
  *                  group and attached to the groups domain
+ * @reset_device_done: Notify the driver that a device has reset successfully.
+ *                     Note that the core invokes the callback function while
+ *                     holding the group->mutex
  * @device_group: find iommu group for a particular device
  * @get_resv_regions: Request list of reserved regions for a device
  * @of_xlate: add OF master IDs to iommu grouping
@@ -683,6 +686,7 @@ struct iommu_ops {
 	struct iommu_device *(*probe_device)(struct device *dev);
 	void (*release_device)(struct device *dev);
 	void (*probe_finalize)(struct device *dev);
+	void (*reset_device_done)(struct device *dev);
 	struct iommu_group *(*device_group)(struct device *dev);
 
 	/* Request/Free a list of reserved regions for a device */
diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 28d4c1f143a08..df23ef0a26e6c 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -4071,12 +4071,14 @@ EXPORT_SYMBOL_GPL(pci_dev_reset_iommu_prepare);
 void pci_dev_reset_iommu_done(struct pci_dev *pdev, bool reset_succeeds)
 {
 	struct iommu_group *group = pdev->dev.iommu_group;
+	const struct iommu_ops *ops;
 	struct group_device *gdev;
 	unsigned long pasid;
 	void *entry;
 
 	if (!pci_ats_supported(pdev) || !dev_has_iommu(&pdev->dev))
 		return;
+	ops = dev_iommu_ops(&pdev->dev);
 
 	guard(mutex)(&group->mutex);
 
@@ -4105,6 +4107,16 @@ void pci_dev_reset_iommu_done(struct pci_dev *pdev, bool reset_succeeds)
 		return;
 	}
 
+	/*
+	 * A PCI device might have been in an error state, so the IOMMU driver
+	 * had to quarantine the device by disabling specific hardware features
+	 * or dropping translation capability. Here notify the IOMMU driver as
+	 * a reliable signal that the faulty PCI device has been cleanly reset
+	 * so now it can lift its quarantine and restore full functionality.
+	 */
+	if (ops->reset_device_done)
+		ops->reset_device_done(&pdev->dev);
+
 	/* Re-attach RID domain back to group->domain */
 	if (group->domain != group->blocking_domain) {
 		WARN_ON(__iommu_attach_device(group->domain, &pdev->dev,
-- 
2.43.0


