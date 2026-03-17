Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63CD7FEDA16
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 19:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aegLmu1eE3TBW+yxrEgVOqRgd37SSAQVOx05m4K1Jmg=; b=V0PFjmz6X2vuTlO3odSqgKTOyR
	4Flytd3NjGWrJbAqMcRQTEcZHeCobeYz+Et9jMpUEhrg5b25Sx0xmYG76LTdshd+4w8QGTLK4v4L/
	Tjcxpbi5/wh3E2lHgO1E1ReY1eeaql2IeHmcaMluM4mb2Q2r41OW4yn6GRhE45LnNsH9XZcentBeg
	Rqg/ht3vLHg3q5vmhe567I4YngWCwX6Twmcx9dagvGPdO1S/I+K0rrJl07C2UfqBUiQENJzP3ekGH
	yfAIUNczEg9WVH/jDhv3jeSKBLKgNL6RmccLN3g6+0dadrbE8Rg+V17kPbwV8h/7mQoP19n1utUxY
	lCUhBuZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2ZuI-000000077KJ-02HJ;
	Tue, 17 Mar 2026 19:16:46 +0000
Received: from mail-westus3azlp170100009.outbound.protection.outlook.com ([2a01:111:f403:c107::9] helo=PH7PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2ZuB-000000077Gl-0c19
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 19:16:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F4NtSXyP4VbrPNig4Q9FUm90QOy0ImEAO6hrlD1F0FkYxH0gBO6o14Jh1TjR+slWCXmxYvsWOGVGL05gjEPH0Mgx1qHC8QAX3HhMpWzvWIxe1c0Mh8NbHZSNoF//r1umMdGr9BWysFaBVD3Dc9trHLbkTVWjNSkYTWYEObofnED+pHg2aMM1u9kNQ2IFvoii/LQqRnM16of5iWMUtCyvFMRJgCFkjBsda8HjGgqOpu54+pIxHjd4aZZ3SIkz+0j840kd89CLCUFbVtACgix5cHJmlOJbhQLI1ngu/zk8QdceI2+s5MS5VJv5MfMP+nGrtnFxcM0OHcdW+ZReR+6MMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aegLmu1eE3TBW+yxrEgVOqRgd37SSAQVOx05m4K1Jmg=;
 b=xe8cj/gYSy45Llzuhj7gLPiNO/6VbeisJX3w8zxbph9u7Bgqqg+PcFWxGHqEsUw2n9QKCsMWpPPNOrzURyB300dEikby2LeH03jzs7wxbNuFbJxeFk1azPfYmQq0tghemEaZOAbyIP9ZsoziZeWE8/vVlPeToORLScQdfUD6w8wLOqPAB+Z6ZeGKUAPYib7I/ID461XpD8B1LexMPQ/SuOdxMtdOPVDhu2nVqMP5KlPLNqGaGvAlsyHz2exD94BtmKxLLYID6sctOCP8mN4L0SHBGjKkkx3ztK+I9y8HYl1UtECxLNqHVKmalRR99bz0dVIU2XnWcv842R8Lxmw9sA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aegLmu1eE3TBW+yxrEgVOqRgd37SSAQVOx05m4K1Jmg=;
 b=hzXi+aA7GG2n9IG2bC4bd+cdr31xYHjQn3GONG00SdAp2mU/aQJLcykDf2xCjQ/5QR72iFgUOtECtW0AvYBYoVaF2aXX6nhWGnpW3L2yoz51MJfgdPy47Qztk/SI1PnsSEDDB4AewStW64TWsKMiPni6drK+/xwtWdgO4hXCeLF21eNUN5hLXn6YJcDsC+tX7Igbd0dDf1vbXgJ+5OiUyrTpPCQOqOIC6NDOZL5ODBGvU946wscClLt6UavRTXqmENI+bT9mp7Uio45wJg6LIYuvYaZZCsKu9BI3UyNv4EashNUciOTHrWsTMT95ZrcXVomab1Es/DVJKqcZ7EIxhQ==
Received: from BN9PR03CA0858.namprd03.prod.outlook.com (2603:10b6:408:13d::23)
 by BL1PR12MB5969.namprd12.prod.outlook.com (2603:10b6:208:398::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.17; Tue, 17 Mar
 2026 19:16:29 +0000
Received: from BN1PEPF00004689.namprd05.prod.outlook.com
 (2603:10b6:408:13d:cafe::5b) by BN9PR03CA0858.outlook.office365.com
 (2603:10b6:408:13d::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.27 via Frontend Transport; Tue,
 17 Mar 2026 19:16:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN1PEPF00004689.mail.protection.outlook.com (10.167.243.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Tue, 17 Mar 2026 19:16:29 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Mar
 2026 12:16:06 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Mar
 2026 12:16:05 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Tue, 17 Mar 2026 12:16:04 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: <will@kernel.org>, <robin.murphy@arm.com>, <joro@8bytes.org>,
	<bhelgaas@google.com>, <jgg@nvidia.com>
CC: <rafael@kernel.org>, <lenb@kernel.org>, <praan@google.com>,
	<baolu.lu@linux.intel.com>, <xueshuai@linux.alibaba.com>,
	<kevin.tian@intel.com>, <linux-arm-kernel@lists.infradead.org>,
	<iommu@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	<linux-acpi@vger.kernel.org>, <linux-pci@vger.kernel.org>,
	<vsethi@nvidia.com>
Subject: [PATCH v2 3/7] iommu: Add iommu_report_device_broken() to quarantine a broken device
Date: Tue, 17 Mar 2026 12:15:36 -0700
Message-ID: <c5390aeaeccfa86a1c79f26d2c0ff5df380940a4.1773774441.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1773774441.git.nicolinc@nvidia.com>
References: <cover.1773774441.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004689:EE_|BL1PR12MB5969:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ca3b226-705d-4bc9-2251-08de8459b15f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|36860700016|82310400026|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: YB4xbCU4NQuiMeY8Yg3+bPTyqu9NNPHo83HX83sUW9MeWzmeg7fUDVQOnBcu0d9iHaNYFg0OS/bBYmjReHMKu4+ZGBnp/y8zEIZyxZ6FzLU59E2EmfXYXGhHgHLk8+kXESltj0HQ+wBVaSHO5yrScBwYZ6ZpM6uBI7/q4PYq439zXMayt0ri7pO1dEmYSpAnYzAtswyv677Vdz/P/UiSe6GaUZHkHI8QYYvh9zIdALj9iEgVPCf1/J9QvAE8QDPQKDR4qw47YUo6iXupuq/CJjLELMO8vhQYg66wdDAk2mRGwmzVY4hgB+wfS15mw985mm0nnVpAjzjLYlGBwGoKz9GCpryskfQTUHB59tRkdDY0BMeWdnFcNBz/2/2Flr7xvU8D1kINS+FXG6ERHwk/4Cb7lblGLdDaLGclqxWmZa4Fh0QymqgaDqmNvyj6pG4qFatRxaNOfk4DpUmE7AQovnxEnMhNhL+Bc0AjnEV/gI+Ub1DbH4kqYN7AnDC101OI7rIjlTk7/3sdhDVe9x+xch1VmwxvaptppXPv1deGduy/favtiRqjIcDL6Eu52hW22MrcFVIFjTWtJVkcZuu4SbOfM4f/V/gAIl/gCDKoPTGNWOeHRAc6GmaYFqI3FYYvPqNtxS8MNxa+7IXHnVP9WbFgVAoNWLKeur/r3xYc9FJ2cuI8PINIp7wk2E8CM1m0Tjry0EZHvrz+VP5Kw7+kAC3iQhrXm89+T5hC1iw/G4DgTpSTpDo9VtC8QKD6uda3dvKPH20WH9lecM8QMBcOnA==
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(36860700016)(82310400026)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: xfkCZd4B+bKLGz5sG3sBWj9EFmuwoY1AFjjIR6ATlMESFHv8VNCJ/fprj18L+iuWWBiaIS/PMHkWxINkS3f1NVvteV15QxVu9MC1JxKJAqnhqKppXgXOxUmPZKDXupuX9AQX5HX74tDYkoKLChTcvPC7+WGlDxx08eELsoNuAP2ow0PG3eECWFhxGCsYRUdlIvtoXV02GSMZjJH+/R7BoCqtvatrHZezYWCVrX7EIj/RXmiSGHLcobfQh/COLGjSdbmmYlOlo4Bv17Xd2YNoG0AM6mDRErJAMGNf76o/+4+gewypIP7m39v9uUGJz6WCORPPYDUvPa4PURIKMJw29sSLesxdS3DxgwFEg14Luzn4YeH+LfWDV/n4E2NnzWSO3QB4ZjqT82sfL8onotZXk5+d65zMOK4tX04k5gbcSUNac6wOJEzMHwyC5MaOekMp
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 19:16:29.4103
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ca3b226-705d-4bc9-2251-08de8459b15f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00004689.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5969
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_121640_835185_EDFB19C6 
X-CRM114-Status: GOOD (  20.64  )
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

However, the core-level states of the faulty device are out of sync, as the
device can be still attached to a translation domain or even potentially be
moved to a new domain that might overwrite the driver-level quarantine.

Given that such an error can be likely an ISR, introduce a broken_work per
iommu_group, and add a helper function to allow driver to report the broken
device, so as to completely quarantine it in the core.

Use the existing pci_dev_reset_iommu_prepare() function to shift the device
to its resetting_domain/blocking_domain. A later pci_dev_reset_iommu_done()
call will clear it and move it out of the quarantine.

Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 include/linux/iommu.h |  2 ++
 drivers/iommu/iommu.c | 59 +++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 61 insertions(+)

diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index 9ba12b2164724..9b5f94e566ff9 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -891,6 +891,8 @@ static inline struct iommu_device *__iommu_get_iommu_dev(struct device *dev)
 #define iommu_get_iommu_dev(dev, type, member) \
 	container_of(__iommu_get_iommu_dev(dev), type, member)
 
+void iommu_report_device_broken(struct device *dev);
+
 static inline void iommu_iotlb_gather_init(struct iommu_iotlb_gather *gather)
 {
 	*gather = (struct iommu_iotlb_gather) {
diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index fcd2902d9e8db..2f297f689a3a3 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -55,6 +55,8 @@ struct iommu_group {
 	struct list_head devices;
 	struct xarray pasid_array;
 	struct mutex mutex;
+	struct work_struct broken_work;
+	bool requires_reset;
 	void *iommu_data;
 	void (*iommu_data_release)(void *iommu_data);
 	char *name;
@@ -146,6 +148,7 @@ static struct group_device *iommu_group_alloc_device(struct iommu_group *group,
 						     struct device *dev);
 static void __iommu_group_free_device(struct iommu_group *group,
 				      struct group_device *grp_dev);
+static void iommu_group_broken_worker(struct work_struct *work);
 static void iommu_domain_init(struct iommu_domain *domain, unsigned int type,
 			      const struct iommu_ops *ops);
 
@@ -1057,6 +1060,7 @@ struct iommu_group *iommu_group_alloc(void)
 	if (!group)
 		return ERR_PTR(-ENOMEM);
 
+	INIT_WORK(&group->broken_work, iommu_group_broken_worker);
 	group->kobj.kset = iommu_group_kset;
 	mutex_init(&group->mutex);
 	INIT_LIST_HEAD(&group->devices);
@@ -4031,6 +4035,7 @@ void pci_dev_reset_iommu_done(struct pci_dev *pdev)
 	if (WARN_ON(!group->blocking_domain))
 		return;
 
+	WRITE_ONCE(group->requires_reset, false);
 	/*
 	 * A PCI device might have been in an error state, so the IOMMU driver
 	 * had to quarantine the device by disabling specific hardware feature
@@ -4062,6 +4067,60 @@ void pci_dev_reset_iommu_done(struct pci_dev *pdev)
 }
 EXPORT_SYMBOL_GPL(pci_dev_reset_iommu_done);
 
+static void iommu_group_broken_worker(struct work_struct *work)
+{
+	struct iommu_group *group =
+		container_of(work, struct iommu_group, broken_work);
+	struct pci_dev *pdev = NULL;
+	struct device *dev;
+
+	scoped_guard(mutex, &group->mutex) {
+		/* Do not block the device again if it has been recovered */
+		if (!READ_ONCE(group->requires_reset))
+			goto out_put;
+		if (list_is_singular(&group->devices)) {
+			/* Note: only support group with a single device */
+			dev = iommu_group_first_dev(group);
+			if (dev_is_pci(dev)) {
+				pdev = to_pci_dev(dev);
+				pci_dev_get(pdev);
+			}
+		}
+	}
+
+	if (pdev) {
+		/*
+		 * Quarantine the device completely. This will be cleared upon
+		 * a pci_dev_reset_iommu_done() call indicating the recovery.
+		 */
+		pci_dev_lock(pdev);
+		pci_dev_reset_iommu_prepare(pdev);
+		pci_dev_unlock(pdev);
+		pci_dev_put(pdev);
+	}
+out_put:
+	iommu_group_put(group);
+}
+
+void iommu_report_device_broken(struct device *dev)
+{
+	struct iommu_group *group = iommu_group_get(dev);
+
+	if (!group)
+		return;
+
+	if (READ_ONCE(group->requires_reset)) {
+		iommu_group_put(group);
+		return;
+	}
+	WRITE_ONCE(group->requires_reset, true);
+
+	/* Put the group now or later in iommu_group_broken_worker() */
+	if (!schedule_work(&group->broken_work))
+		iommu_group_put(group);
+}
+EXPORT_SYMBOL_GPL(iommu_report_device_broken);
+
 #if IS_ENABLED(CONFIG_IRQ_MSI_IOMMU)
 /**
  * iommu_dma_prepare_msi() - Map the MSI page in the IOMMU domain
-- 
2.43.0


