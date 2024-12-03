Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55980E69EBD
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 22:16:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lzXk7UbAY3I4FC6TIIAdnFAX1qhMEmsh1l+dMSsHf/g=; b=o8i/DXN+cT897kehzTMlRu6bb5
	O0VkSln0QZbEey4qRNT/fm8huwc00r/JjM9c0MvaZMOpIpyT8bqE3+zxdfNfd37HeIDM2fxVEjJl1
	GlYfrMDB/HApATVC6jiCGNqO++tzmwXQao6vDeyvtB3PwDT/TWQgAVP9jcxMtnC/MNPM3HcRte8VQ
	v7SrbjYQVsqXMF0PTQ+qkdw/oEcZlwnCekLRMVolxI9PauT7KBsIna90Bf8XtN1qLKdxsymBBUPSw
	1lJbc87JvoskhRxXdDV/tbjOYdSF6BmJEd3jX9UcuCTKUEL++kG9KLFcONx5GuWZndZ+8Agbm2ynI
	9PSK4AjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIbBn-0000000At8F-2PfN;
	Tue, 03 Dec 2024 22:16:15 +0000
Received: from mail-dm6nam10on20625.outbound.protection.outlook.com ([2a01:111:f403:2413::625] helo=NAM10-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIb6o-0000000Arq2-43X2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 22:11:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HudT5q2r5ZiZ/PlOkG6gAq96BhkOXEAT+cDseBkA73yyPWfwVKHk97P88mscQ3NjfMwpyWd9wV6Vqv8ZBIlX7p666CweYZBabhOxnT3EsLkkMT4MoHoxKWtT3xGlOWlDkiVlksJ4uV2Y9sOXWUXusU+fQt3GOGpIuXPch3yxtMgCoRHCyO8rs1boKVBOt+WiKfr8M4RHfFpiVFP+BQ/VZTrj5LoFTRYwJy/co1+xv0/NXIjNCd+FmjlM+gsecL4WDUhs3Ndid88A9MimnSZzEO4xKHgDnY1OnGnCbt3aKmroTdVbaE/Udv2MzbWz7L4i6vMs2cyIWuC1Mc3IXg6TgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lzXk7UbAY3I4FC6TIIAdnFAX1qhMEmsh1l+dMSsHf/g=;
 b=rIJjiBQewO2M34IIFy4Pjo6+VsUrAqYFDi2F922390aY+XlRhOJKxcp9iIILYhr323UJlszQbJGEeNnHLCPPDNsBXuODXxdDGiY+roVTr/77n4Mo6PK07nDauAjbfkaBL019IktmnzcDPj56wtNAsAaiU3MGtevbRBlmqyA1VGEreF5unQ7zLNW8LVr0nTxLH/rErggACbHgELfsUVQEeqjXx+bstr1JniL3+7tPJPMRJWnhIAfESlQMXWaULdx/xQoBBet72rNvLqDmMQ9YgqvgqoyLtvm9ZF4CsY5to9r+5k7cpTR49OBZMrV0GL6elzXoUx2hgietxpATIgf3yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=google.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lzXk7UbAY3I4FC6TIIAdnFAX1qhMEmsh1l+dMSsHf/g=;
 b=gVFCGm6AulVqpeQ1hLBwQhZtMA6xnq6aux4w6WYA1auWZAQKQAX6S0hP8Ku3F40ovTZnNOgbyNuTERd39H8ENTkEdMUG34ZF1MqvyxKTem7YqoAi5WrvbZmvwPx+igTW/RqMHCpeWV9uX3fQL+iwHYg5fzqMGif/zSV+FixyMz0AYQL387l11r2Wx/0loF3PxCEhuiRI+1xJtl4614JPmFPk/k00iFofvcsikmxn1mihyk5GboZlsE5Xw4NXzyxww4FvP51gal2U/G5AwrpIDu7+YddgSrmgMj9a2ihcpdRfk6uxFiIyOXtWqZmkbiFPeRoG1NjFltAwWkRpIZgtlw==
Received: from BL1PR13CA0184.namprd13.prod.outlook.com (2603:10b6:208:2be::9)
 by IA0PR12MB7676.namprd12.prod.outlook.com (2603:10b6:208:432::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.19; Tue, 3 Dec
 2024 22:10:58 +0000
Received: from MN1PEPF0000F0E2.namprd04.prod.outlook.com
 (2603:10b6:208:2be:cafe::ff) by BL1PR13CA0184.outlook.office365.com
 (2603:10b6:208:2be::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8230.9 via Frontend Transport; Tue, 3
 Dec 2024 22:10:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 MN1PEPF0000F0E2.mail.protection.outlook.com (10.167.242.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8230.7 via Frontend Transport; Tue, 3 Dec 2024 22:10:58 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 3 Dec 2024
 14:10:42 -0800
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Tue, 3 Dec 2024 14:10:42 -0800
Received: from Asurada-Nvidia.nvidia.com (10.127.8.14) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Tue, 3 Dec 2024 14:10:41 -0800
From: Nicolin Chen <nicolinc@nvidia.com>
To: <jgg@nvidia.com>, <kevin.tian@intel.com>, <will@kernel.org>
CC: <corbet@lwn.net>, <joro@8bytes.org>, <suravee.suthikulpanit@amd.com>,
	<robin.murphy@arm.com>, <dwmw2@infradead.org>, <baolu.lu@linux.intel.com>,
	<shuah@kernel.org>, <linux-kernel@vger.kernel.org>, <iommu@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kselftest@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <eric.auger@redhat.com>,
	<jean-philippe@linaro.org>, <mdf@kernel.org>, <mshavit@google.com>,
	<shameerali.kolothum.thodi@huawei.com>, <smostafa@google.com>,
	<ddutile@redhat.com>, <yi.l.liu@intel.com>
Subject: [PATCH v2 07/13] iommufd/viommu: Add iommufd_viommu_report_irq helper
Date: Tue, 3 Dec 2024 14:10:12 -0800
Message-ID: <7e9842376e6235d9e3471356d035afe2bfe8f33b.1733263737.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1733263737.git.nicolinc@nvidia.com>
References: <cover.1733263737.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E2:EE_|IA0PR12MB7676:EE_
X-MS-Office365-Filtering-Correlation-Id: 3debc2dd-aa90-4e77-4257-08dd13e75d86
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?GEcJ0sQCWomq+fWJtM2R9RMO365cCjCAGyR9Ch48zIOSN3iO0C5hDF8AdhXg?=
 =?us-ascii?Q?nw+BuZ9XrolXxXd/js3CRONn3A/cE7GaDWlTXB/gI2Z1xwhUwqPVbW0h7izj?=
 =?us-ascii?Q?YI5T3neTQ6N8gxWHDwi8t6WvfqtKuAU9XlNXuYzQg4YjXnZ1ap+cIkrI+28j?=
 =?us-ascii?Q?oLr1YbG9nkmpycxbdWK3E+8i8yLGFvEsXNKv/CPnv3M00and5sXU/WW1uSNC?=
 =?us-ascii?Q?4VIcKleXJRc5lZz1wXwuz3JnpIg6y+9HOOP+gYbadJOsVJm3RMoOnuWtgbgI?=
 =?us-ascii?Q?oSPu/LW54lDAnM6Azf/esFhpRwHMuoUrUGcJv+u1+33Yy33xmb+fbrSqmUjc?=
 =?us-ascii?Q?i0VkaJZzwDwortSFUcz8Art9yBXcZtfiDRRhFJ9GT92qNSI8SgpWNS+ne989?=
 =?us-ascii?Q?c/V1pmlUbHXGYSX9q2ZKcvtEhYAXvxD1KrsJnyGC5cVpEfNJiQLHsAZe4DHu?=
 =?us-ascii?Q?RdErUTyZjLGClZEG/zsDnDUrkASDiX5d+p1QfB1Er0NFfMtJWUZuNlpDlPZ4?=
 =?us-ascii?Q?kbHxQrHtdpvdoVcVfS9kQBEthoAtxyyeZBiipNZ3wOx4vibCcohqO5UljfaV?=
 =?us-ascii?Q?oB0qrMlCe4HwzN/+Cr15yGotObkgB+jFWmySwTjqX5v+xTrB3qEHFOKZOqpS?=
 =?us-ascii?Q?DmEBIyy2+y8SSCyrknU3wucGLndnCAEGLSvmkxl+leqFmaKR6wyrcIvs/HjZ?=
 =?us-ascii?Q?PAWR87qzz+Ucm2HLxHn+ZpSNq3GGgLcfXGOsUlEeNNDsLh/VYAs6PUJ9hrvJ?=
 =?us-ascii?Q?OfTdJk2L4/L1nuKqPzgYzeUh5f4q8ELr8h7WlE5CBAaNhxcn1yGtQ70xqyhS?=
 =?us-ascii?Q?bzu5wLHM5j2wWE/Nl1BCoLNNM4GNLDsnzxXjHxTtJaeEDny5vneuPwPVAbwP?=
 =?us-ascii?Q?X5xkULM/1exd6G3yo6N7rDg5p8Dj5vaZ2WWQHsfl7jPCYUjpzcNRoPRiWVhZ?=
 =?us-ascii?Q?jGho9PbxinRG3S0UyutckcZa+XFN8ARB/EF89oRIfHnRyVlhljOao+yIczeY?=
 =?us-ascii?Q?fwzvnr4q5gMyeofAfBdEdHtANi5TRTsClhvglhzuVnZD6fVgSdWdzKgrhFmg?=
 =?us-ascii?Q?6Gbh20hD9iqxCpz0sj3vhT5naQPsl1M8BVCW9h6tfs58JF9p504ddgS6nP+h?=
 =?us-ascii?Q?QNOD3/EcyBBvr1S4f7c5/Je+WLMcZ43Ow992plSi/KdwK3H2zLyS7EMhqJUQ?=
 =?us-ascii?Q?BdEf8aRBKCzJswv4/dKWeDGqLyBdliffYSXaq0LH/vs6xoJ+ZQ+rtgjUZ6Jv?=
 =?us-ascii?Q?vXHqk0tC9ABEokYj/rqiMfxmeU+mMWz1bkEttqoPxTso+N/Sf7rWtYlFV3Gx?=
 =?us-ascii?Q?pZKkOk+fwC4YQ4inmMpnPAUFMK8szOYbCQt5GL4W+fWGE4ivChr/yZLhkOe+?=
 =?us-ascii?Q?ZYn+VoMJd+eZ+xHo5Z8eNkp2jg+2aoNjcwti1wFMOlIU/F6LGB9kCwgJ012I?=
 =?us-ascii?Q?RL2ckfmu4IsYTevVpMUSpBNBMgzzOLs2?=
X-Forefront-Antispam-Report: CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(7416014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2024 22:10:58.2525
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3debc2dd-aa90-4e77-4257-08dd13e75d86
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000F0E2.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7676
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_141106_997920_7363D409 
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

Similar to iommu_report_device_fault, this allows IOMMU drivers to report,
from threaded IRQ handlers to user space hypervisors, IRQs or events that
belong to a vIOMMU.

Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 include/linux/iommufd.h        |  9 ++++++++
 drivers/iommu/iommufd/driver.c | 41 ++++++++++++++++++++++++++++++++++
 2 files changed, 50 insertions(+)

diff --git a/include/linux/iommufd.h b/include/linux/iommufd.h
index 1f5376476cfa..2ce78edec4e9 100644
--- a/include/linux/iommufd.h
+++ b/include/linux/iommufd.h
@@ -192,6 +192,8 @@ struct device *iommufd_viommu_find_dev(struct iommufd_viommu *viommu,
 				       unsigned long vdev_id);
 unsigned long iommufd_viommu_get_vdev_id(struct iommufd_viommu *viommu,
 					 struct device *dev);
+int iommufd_viommu_report_irq(struct iommufd_viommu *viommu, unsigned int type,
+			      void *irq_ptr, size_t irq_len);
 #else /* !CONFIG_IOMMUFD_DRIVER_CORE */
 static inline struct iommufd_object *
 _iommufd_object_alloc(struct iommufd_ctx *ictx, size_t size,
@@ -211,6 +213,13 @@ iommufd_viommu_get_vdev_id(struct iommufd_viommu *viommu, struct device *dev)
 {
 	return 0;
 }
+
+static inline int iommufd_viommu_report_irq(struct iommufd_viommu *viommu,
+					    unsigned int type, void *irq_ptr,
+					    size_t irq_len)
+{
+	return -EOPNOTSUPP;
+}
 #endif /* CONFIG_IOMMUFD_DRIVER_CORE */
 
 /*
diff --git a/drivers/iommu/iommufd/driver.c b/drivers/iommu/iommufd/driver.c
index 817e430a11bc..339baa270d1e 100644
--- a/drivers/iommu/iommufd/driver.c
+++ b/drivers/iommu/iommufd/driver.c
@@ -67,5 +67,46 @@ unsigned long iommufd_viommu_get_vdev_id(struct iommufd_viommu *viommu,
 }
 EXPORT_SYMBOL_NS_GPL(iommufd_viommu_get_vdev_id, IOMMUFD);
 
+/* Typically called in driver's threaded IRQ handler */
+int iommufd_viommu_report_irq(struct iommufd_viommu *viommu, unsigned int type,
+			      void *irq_ptr, size_t irq_len)
+{
+	struct iommufd_eventq_virq *eventq_virq;
+	struct iommufd_virq *virq;
+	int rc = 0;
+
+	might_sleep();
+
+	if (!viommu)
+		return -ENODEV;
+	if (WARN_ON_ONCE(!irq_len || !irq_ptr))
+		return -EINVAL;
+
+	down_read(&viommu->virqs_rwsem);
+
+	eventq_virq = iommufd_viommu_find_eventq_virq(viommu, type);
+	if (!eventq_virq) {
+		rc = -EOPNOTSUPP;
+		goto out_unlock_vdev_ids;
+	}
+
+	virq = kzalloc(sizeof(*virq) + irq_len, GFP_KERNEL);
+	if (!virq) {
+		rc = -ENOMEM;
+		goto out_unlock_vdev_ids;
+	}
+	virq->irq_data = (void *)virq + sizeof(*virq);
+	memcpy(virq->irq_data, irq_ptr, irq_len);
+
+	virq->eventq_virq = eventq_virq;
+	virq->irq_len = irq_len;
+
+	iommufd_eventq_virq_handler(virq);
+out_unlock_vdev_ids:
+	up_read(&viommu->virqs_rwsem);
+	return rc;
+}
+EXPORT_SYMBOL_NS_GPL(iommufd_viommu_report_irq, IOMMUFD);
+
 MODULE_DESCRIPTION("iommufd code shared with builtin modules");
 MODULE_LICENSE("GPL");
-- 
2.43.0


