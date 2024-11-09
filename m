Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D3BBD64075
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 Nov 2024 06:03:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VDCsucoqKNwEFGz7GO3myzJx524PBXAsZR6DsVkLebw=; b=Edv9ypsTeS9YukEd4IaZXLgoMK
	CWUQtuKN2hgH+IP5nmYT/gE/XeG9sRfUcj2RMn5fkdLQQzKkG+BbQ4pdAQ5bT+C5BbS5ACVUVDjFR
	azf/hc38Fr98Q73CPB9w7Q8CyG+hswt2mBJVHBPUNiJ+5GWrhl9XdHz5aTwS+i4Zwo1BuMpuIpsms
	mAJuwFdp1CB+/O0HcmohgI2KBa2ZTjAqxd+8oG3BAkgMCwt3uF2mJGWuNdPL8k/Mn/Tf+4Ey+0DBB
	Spzlq2iHqT1dq4sn0+NzJ9OdugVK21CFU1pKCf8YXf/ViGn6LGNgKIfJ8cY3A5cikg5bY3hDogLpu
	n5Ds2Mfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9eZC-0000000Cl29-0q6n;
	Sat, 09 Nov 2024 06:03:26 +0000
Received: from mail-mw2nam12on20614.outbound.protection.outlook.com ([2a01:111:f403:200a::614] helo=NAM12-MW2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9eLZ-0000000CjVo-3HT2
	for linux-arm-kernel@lists.infradead.org;
	Sat, 09 Nov 2024 05:49:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l8B+ABRE8I4yx5KqnT+cYj0+3YHmJQjoLxWtdbMKY5MnIR+9OoG86gtl7+hP1edz+UqoPyU0Ak11erq2G8peQ++1P232GFF7yBpBGuWW3hz6JsrgiBCzmGJAf4O8qtIQxz/uApXQzY6SfHt5xgADR/yn1puIon0vLGgiWZurNxYyYe99q9V7m/RNEFblxZ0i8UpeI3y7A8XyGpo/2PGyQwQxTWKP8oD1AMgjGvevZTws2mvkWk2QxDfE+iDcZb6S6TCiIK3R0xKOOWnt9MW7+ROBMUmCwo8XfkuddL2ihh/uf3fRw4pcjImPnDRNb5k2BoHgrcZvAi7yGSIsAQAHew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VDCsucoqKNwEFGz7GO3myzJx524PBXAsZR6DsVkLebw=;
 b=c6J3dMcfEmE8JLWH769wZ5yrTsNNak7qi2OtOQbXQdDh46jNeW94NB5LDBhFVrh5bOPeSuxtZQgnNY88IFz/e+d3wbTQq3mD7SG+aQXDdjkNLhMYDfU11e/70WSRfOZ9HjUs7UZbb8oqIKNrJUXaIb4r+/5HxB4vGT7eJ6NmhZfyR7Ob0KpND8QQ2cgQ8LUbm6YjoDjPMIAdTcvcdjdinFwPED/0X9b3y5Apwlebz1FyuvoQxpiqC2lYhll11SbqHzbvJlm3FYsQVzwNexVZRaFesKK1P7sxoBo1XXp7o4xHBIXHqeRD5O+Ar7nTPk7vPKU5f5G5Wf2QfAsyYyw7xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VDCsucoqKNwEFGz7GO3myzJx524PBXAsZR6DsVkLebw=;
 b=j6AuxkNK8uCesbS92SMSGvXKbPSjND/KaCgAvrDZKiXldI+9UX3okxt683Zd3F7z7UCgzUWnZBH8DMymVZ633XveNuIM1yFEtroY0MsQ3I+krmvgiXJLspB0eQ41YJTICs03iMH6AKwHR7sM43JHK0R1vmZLLsrY5pwUXhzqbOuQdxPr/RpzSKrUw2kgqkiQm9LmY+y5PUI8Xe/VPGTa6qCJG40Lnm7hTZO93ilLhIQ0DgiSyQePZ/e05dMnarx1IqR8Nq5xdBUYr+9onfB31XPqOwsJZBzWLGFMRHIVw0KCcs+4B/QKqDM8BL8dpNECHGHA2GuqPsUda0ssY2xFdg==
Received: from BN9PR03CA0262.namprd03.prod.outlook.com (2603:10b6:408:ff::27)
 by SN7PR12MB8103.namprd12.prod.outlook.com (2603:10b6:806:355::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.19; Sat, 9 Nov
 2024 05:49:13 +0000
Received: from BL02EPF0001A104.namprd05.prod.outlook.com
 (2603:10b6:408:ff:cafe::a5) by BN9PR03CA0262.outlook.office365.com
 (2603:10b6:408:ff::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.21 via Frontend
 Transport; Sat, 9 Nov 2024 05:49:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 BL02EPF0001A104.mail.protection.outlook.com (10.167.241.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8137.17 via Frontend Transport; Sat, 9 Nov 2024 05:49:12 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 8 Nov 2024
 21:49:03 -0800
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Fri, 8 Nov 2024 21:49:02 -0800
Received: from Asurada-Nvidia.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Fri, 8 Nov 2024 21:49:01 -0800
From: Nicolin Chen <nicolinc@nvidia.com>
To: <maz@kernel.org>, <tglx@linutronix.de>, <bhelgaas@google.com>,
	<alex.williamson@redhat.com>
CC: <jgg@nvidia.com>, <leonro@nvidia.com>,
	<shameerali.kolothum.thodi@huawei.com>, <robin.murphy@arm.com>,
	<dlemoal@kernel.org>, <kevin.tian@intel.com>, <smostafa@google.com>,
	<andriy.shevchenko@linux.intel.com>, <reinette.chatre@intel.com>,
	<eric.auger@redhat.com>, <ddutile@redhat.com>, <yebin10@huawei.com>,
	<brauner@kernel.org>, <apatel@ventanamicro.com>,
	<shivamurthy.shastri@linutronix.de>, <anna-maria@linutronix.de>,
	<nipun.gupta@amd.com>, <marek.vasut+renesas@mailbox.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-pci@vger.kernel.org>, <kvm@vger.kernel.org>
Subject: [PATCH RFCv1 5/7] PCI/MSI: Extract a common __pci_alloc_irq_vectors function
Date: Fri, 8 Nov 2024 21:48:50 -0800
Message-ID: <0c09c2b1cef3eb085a2f4fd33105eb18aed2b611.1731130093.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1731130093.git.nicolinc@nvidia.com>
References: <cover.1731130093.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A104:EE_|SN7PR12MB8103:EE_
X-MS-Office365-Filtering-Correlation-Id: a84e2032-2e31-45be-a94f-08dd00823d2e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?jU6MCsoweLdVtWf3F1s+Vge4zLy4yxylCa+JsSdnVT62SYTR8w9DNhU03YB0?=
 =?us-ascii?Q?BGf6pSFaRxtxiqHSJGjLQeAWbFyzL+aKAUWU3OHU6tySbixiFFxMVyQb03wN?=
 =?us-ascii?Q?P3ZU7TXrIIWQEtM/Cj2yzxPTxdeqUZBfO1tHgtk4iMTVA7DM/Ryve3WVH6mO?=
 =?us-ascii?Q?NgewTRKkiRUNV2UTcZBeTkwq3ee7/Pf0b0lWc6aP/xQ75TETGoAnpOEhIfER?=
 =?us-ascii?Q?fbTenYdhanqo0ZTMftVIqr4D2mctFh/aag4LO1x/vtR/XKAmLYMDUCXEC4hv?=
 =?us-ascii?Q?3njMMJvTfn8mA0RX7/QgFsX3vfMEg/R9IakQP2pstJIZmWzppPKDtqgix7cb?=
 =?us-ascii?Q?oHsQgmVAn/iKFN+SHeCT64hNAwjM+KdLkwWt1yfJkr4pENYoe5UQm67M7AvP?=
 =?us-ascii?Q?u0HT/+yagE0vaMBhnwQ0VBZOuJm2kIBpuyjwFeTAjswKThCvIcs6wxV2p+GV?=
 =?us-ascii?Q?HIYojQ7zAjjgchF+jHJCJ+aHwSsCAGtcE4UXsbrh1gdfLkSWyG3N4hbspaJJ?=
 =?us-ascii?Q?J1AHkmutq6eFeA63+qve6lR91VLpIODqjDrdxtVTHvAQxfhj3T+jH8ug4NXq?=
 =?us-ascii?Q?ggV6ufAv/bZ0IjF4CzLWkm1DBAitOg6AjAOqz8ufx5Bw4YejD9N65iM9cqCE?=
 =?us-ascii?Q?guP0rJWCt3eTcvziJDCjDA67jUlck2nRK5ZSb78FJm07lWvE5XhqmPNWEmoO?=
 =?us-ascii?Q?c6w6XobJXoLkBqxDPVg1sp518xbeGYzjFxcv9aDqyih9lb4QhkE2zCJAcT5e?=
 =?us-ascii?Q?md71kS+rHQRBduig0Sm5MrKJ4nwAkXBw8IDBmG6BamuEm87j0ei2D++my7uE?=
 =?us-ascii?Q?1PpdlIgLwPjX194kHWqbGQ2an/awDuKCE0rE+M6hDUbYTBbswd+iGhD0ycPj?=
 =?us-ascii?Q?wQKEdHYCv6YUuNl312MaQ9SIJpM+nHAKs97RdLtYcyeaAsYg92UAklNj4M+3?=
 =?us-ascii?Q?WnEstexyfFVJxzloAu0Rha8qfy5aDQxhf7w8v/n06/k3oui06Y2cF8dWs2RD?=
 =?us-ascii?Q?YF9z+g/WkG4Bfx5iqhS6yAkIzN+2qz7xYevXk2rXjztDZLxRnNRertLd/on6?=
 =?us-ascii?Q?kALPJoUbiv1k8wiO0ghMMMZwp6BfmwJP5plkHz0mQeunmUaHafaAKncu7qaq?=
 =?us-ascii?Q?pGYIZ8Ss9rCPkTg8V+Cgnf/Mw2TakP7W/ddTr0TWL3Xi3LfTwUVkKe5hKOT5?=
 =?us-ascii?Q?ak5BFge14w2ZB5ohdhs5sWhDwfZOYYwhlK+ExHNMuz7AcoeO/JpZkF0lgqP/?=
 =?us-ascii?Q?1NaKygJlje8YN/8Dg6pd3YKSeeTaWcPJcIeYqJ3MRBFVztujxqBpE0hTAPIW?=
 =?us-ascii?Q?oks5s5ZganaEl++b0u+FLjI3Fn6Gmi5/Gt4t3ndjvxge9hAtiu7ZBA8nVS6E?=
 =?us-ascii?Q?iGsX3AHIRalxALHDx5MRHw/Nq2WMA6wVwSLqBDXr9PgxVIDwsw=3D=3D?=
X-Forefront-Antispam-Report: CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2024 05:49:12.6663
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a84e2032-2e31-45be-a94f-08dd00823d2e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A104.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8103
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_214921_850174_2B858BBC 
X-CRM114-Status: GOOD (  16.58  )
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

Extract a common function from the existing callers, to prepare for a new
helper that provides an array of msi_iovas. Also, extract the msi_iova(s)
from the array and pass in properly down to __pci_enable_msi/msix_range().

Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 drivers/pci/msi/api.c | 113 ++++++++++++++++++++++++++----------------
 1 file changed, 70 insertions(+), 43 deletions(-)

diff --git a/drivers/pci/msi/api.c b/drivers/pci/msi/api.c
index 99ade7f69cd4..dff3d7350b38 100644
--- a/drivers/pci/msi/api.c
+++ b/drivers/pci/msi/api.c
@@ -204,6 +204,72 @@ void pci_disable_msix(struct pci_dev *dev)
 }
 EXPORT_SYMBOL(pci_disable_msix);
 
+static int __pci_alloc_irq_vectors(struct pci_dev *dev, unsigned int min_vecs,
+				   unsigned int max_vecs, unsigned int flags,
+				   struct irq_affinity *affd,
+				   dma_addr_t *msi_iovas)
+{
+	struct irq_affinity msi_default_affd = {0};
+	int nvecs = -ENOSPC;
+
+	if (flags & PCI_IRQ_AFFINITY) {
+		if (!affd)
+			affd = &msi_default_affd;
+	} else {
+		if (WARN_ON(affd))
+			affd = NULL;
+	}
+
+	if (flags & PCI_IRQ_MSIX) {
+		struct msix_entry *entries = NULL;
+
+		if (msi_iovas) {
+			int count = max_vecs - min_vecs + 1;
+			int i;
+
+			entries = kcalloc(max_vecs - min_vecs + 1,
+					  sizeof(*entries), GFP_KERNEL);
+			if (!entries)
+				return -ENOMEM;
+			for (i = 0; i < count; i++) {
+				entries[i].entry = i;
+				entries[i].iova = msi_iovas[i];
+			}
+		}
+
+		nvecs = __pci_enable_msix_range(dev, entries, min_vecs,
+						max_vecs, affd, flags);
+		kfree(entries);
+		if (nvecs > 0)
+			return nvecs;
+	}
+
+	if (flags & PCI_IRQ_MSI) {
+		nvecs = __pci_enable_msi_range(dev, min_vecs, max_vecs, affd,
+					       msi_iovas ? *msi_iovas :
+							   PHYS_ADDR_MAX);
+		if (nvecs > 0)
+			return nvecs;
+	}
+
+	/* use INTx IRQ if allowed */
+	if (flags & PCI_IRQ_INTX) {
+		if (min_vecs == 1 && dev->irq) {
+			/*
+			 * Invoke the affinity spreading logic to ensure that
+			 * the device driver can adjust queue configuration
+			 * for the single interrupt case.
+			 */
+			if (affd)
+				irq_create_affinity_masks(1, affd);
+			pci_intx(dev, 1);
+			return 1;
+		}
+	}
+
+	return nvecs;
+}
+
 /**
  * pci_alloc_irq_vectors() - Allocate multiple device interrupt vectors
  * @dev:      the PCI device to operate on
@@ -235,8 +301,8 @@ EXPORT_SYMBOL(pci_disable_msix);
 int pci_alloc_irq_vectors(struct pci_dev *dev, unsigned int min_vecs,
 			  unsigned int max_vecs, unsigned int flags)
 {
-	return pci_alloc_irq_vectors_affinity(dev, min_vecs, max_vecs,
-					      flags, NULL);
+	return __pci_alloc_irq_vectors(dev, min_vecs, max_vecs,
+				       flags, NULL, NULL);
 }
 EXPORT_SYMBOL(pci_alloc_irq_vectors);
 
@@ -256,47 +322,8 @@ int pci_alloc_irq_vectors_affinity(struct pci_dev *dev, unsigned int min_vecs,
 				   unsigned int max_vecs, unsigned int flags,
 				   struct irq_affinity *affd)
 {
-	struct irq_affinity msi_default_affd = {0};
-	int nvecs = -ENOSPC;
-
-	if (flags & PCI_IRQ_AFFINITY) {
-		if (!affd)
-			affd = &msi_default_affd;
-	} else {
-		if (WARN_ON(affd))
-			affd = NULL;
-	}
-
-	if (flags & PCI_IRQ_MSIX) {
-		nvecs = __pci_enable_msix_range(dev, NULL, min_vecs, max_vecs,
-						affd, flags);
-		if (nvecs > 0)
-			return nvecs;
-	}
-
-	if (flags & PCI_IRQ_MSI) {
-		nvecs = __pci_enable_msi_range(dev, min_vecs, max_vecs,
-					       affd, PHYS_ADDR_MAX);
-		if (nvecs > 0)
-			return nvecs;
-	}
-
-	/* use INTx IRQ if allowed */
-	if (flags & PCI_IRQ_INTX) {
-		if (min_vecs == 1 && dev->irq) {
-			/*
-			 * Invoke the affinity spreading logic to ensure that
-			 * the device driver can adjust queue configuration
-			 * for the single interrupt case.
-			 */
-			if (affd)
-				irq_create_affinity_masks(1, affd);
-			pci_intx(dev, 1);
-			return 1;
-		}
-	}
-
-	return nvecs;
+	return __pci_alloc_irq_vectors(dev, min_vecs, max_vecs,
+				       flags, affd, NULL);
 }
 EXPORT_SYMBOL(pci_alloc_irq_vectors_affinity);
 
-- 
2.43.0


