Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47B0BFC9EC0
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 23:42:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uCIFdBM1YuCtwa+6IU8DISbQwkjb7xYTIzOJwDaaeu4=; b=aC/nKQmN6fo5w7mzznZw+1ft5X
	fk1SWE1Wj8l9vZrX0kniuUuAGs+4hb9Sxx8f/SBcJ5tr3293tV2rm85IDROA1h3QtAyYUhw2rYyI8
	vqMZj3OgUViSs22LyzrobSdheBbz6KeiyEOcQwp/C9re4PO6UufCIHCU5yXdkpzs8Cg6cQJe6gqm0
	I8uJDsnyAIqahr1hUMmXwTMhejGAucIhKyWcjKm7TvKNXJ5ZyxnA068SwfgUNvE4Ps3C1Yqm+jLRG
	7VbjqQhIJQpg9nLeWatfpZiohLmWEVnxsntq6cIfD3mGqK1M4MEVcPBxfZesipxDKvJCGW/PUMv6y
	MwTgKSng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyenz-00000004fGP-2CAz;
	Fri, 06 Mar 2026 23:42:03 +0000
Received: from mail-westus3azon11010010.outbound.protection.outlook.com ([52.101.201.10] helo=PH7PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyenx-00000004fEy-0vgy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 23:42:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j20foTg1pI1vT8bpZ8TD/FsQhXjB4YRcRP4cTu3djLKrBpZ/HWBPP0uo1IlywKVwYB4ttqENo845vT/x/aFQCKFJbZLbXoS2wHpC0yevAmVZcMg1kDF7S5km0PC5sUVq2qiKQPK3e3jqIGtyXC/SR6kvuQaIS9NECCPivoMzteUL8ZKmh+yiVso8Wo1250yfrnRiGAE5XdwAtLn6Dfc8Lv1k1bU7hDYm1g2CZiA82lIvIm0kV3U94jhtW6A/7PcK63TwVYme9DYJOawmrgC3atWqS5k3RiJjsS2e7lNS9csCUnwrfbl8L3ismCwiNgegGco4vUHFXU3wUgT5aM9Fjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uCIFdBM1YuCtwa+6IU8DISbQwkjb7xYTIzOJwDaaeu4=;
 b=WIgkReISLOoNhqgWWlgM5gT6pi49lA4h0/ak6NQlITtU37phZvKB6Dw968XUJcwK9RHDipTgjb/KWiJfTh9s3eESZwpgVFK7QZ/v/TC6vTE8bPIjyVAPx6q1CcVfFnsPJpq3YSuglBPR9h4QZw9b11/3IBcFXiYZEhhy2nqpN/vBfWWAOBCsKPbQrZ+Q0CB5QNtWCrWezH980Q6YXqWJ/iUSD3FLKhB3WrDSawXV6NLopaqrg5gxyR/qYKaReUcnpjI8wnZNxQ887nFjiwM/bLF4EY/FNxNoN5wRwHrRsUY4/cCgRKxqZR/I+Z0DcXSkaAmLk3nODXEykjUzQFM94g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=huawei.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uCIFdBM1YuCtwa+6IU8DISbQwkjb7xYTIzOJwDaaeu4=;
 b=iXo/vAK8a3VhA+DsA1avi4cf1C64XpoWxT8MnkGmGoiAzC/D1sDiu2SC2xqVLIHyxS+deNCr0/W4JtfrxDYVwVaemLnea6E0S1glHYsybQdiacWaYgCPDm1/FHS38xA0FDWMSe5AjVWE9C7TxjrxnBRWcEWyoTbFPRgotZGlOZSg+lL0+y9XXrHWIazLQFrjgsMxQ/UrgBO+FiRkw7NCdrubOXwwPfagrGGtdXqigX82pse5vxAUyDtczakc5mVvoTFbC3D/Xus4u1Kkey8h+M+JbJcRBzi4Flb7tBdvmrkLcyRLwHSbRh8UskacLLHW5mgw8zsoZ6+xVtWDhk3l1Q==
Received: from SJ0PR05CA0154.namprd05.prod.outlook.com (2603:10b6:a03:339::9)
 by SJ5PPFDF5E260D0.namprd12.prod.outlook.com (2603:10b6:a0f:fc02::9a6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Fri, 6 Mar
 2026 23:41:51 +0000
Received: from SJ1PEPF00001CDD.namprd05.prod.outlook.com
 (2603:10b6:a03:339:cafe::bb) by SJ0PR05CA0154.outlook.office365.com
 (2603:10b6:a03:339::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.17 via Frontend Transport; Fri,
 6 Mar 2026 23:41:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SJ1PEPF00001CDD.mail.protection.outlook.com (10.167.242.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Fri, 6 Mar 2026 23:41:51 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 6 Mar
 2026 15:41:36 -0800
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 6 Mar
 2026 15:41:35 -0800
Received: from Asurada-Nvidia.nvidia.com (10.127.8.10) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Fri, 6 Mar 2026 15:41:34 -0800
From: Nicolin Chen <nicolinc@nvidia.com>
To: <jgg@nvidia.com>, <will@kernel.org>, <robin.murphy@arm.com>,
	<bhelgaas@google.com>
CC: <joro@8bytes.org>, <praan@google.com>, <baolu.lu@linux.intel.com>,
	<kevin.tian@intel.com>, <miko.lenczewski@arm.com>,
	<linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <linux-pci@vger.kernel.org>,
	<dan.j.williams@intel.com>, <jonathan.cameron@huawei.com>,
	<vsethi@nvidia.com>, <linux-cxl@vger.kernel.org>
Subject: [PATCH v3 3/3] iommu/arm-smmu-v3: Allow ATS to be always on
Date: Fri, 6 Mar 2026 15:41:17 -0800
Message-ID: <0e8d1ee1557c54943dd15ff836576de4c3aa58b6.1772833963.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1772833963.git.nicolinc@nvidia.com>
References: <cover.1772833963.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CDD:EE_|SJ5PPFDF5E260D0:EE_
X-MS-Office365-Filtering-Correlation-Id: 609a9724-0578-4277-1f8f-08de7bd9f0c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|7416014|376014|82310400026|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: b7YMSoslTGO86cKxDqyh5HoEVFgGk71+wSAg8xXR5DQlzvW3lLkbww1YMXwEPpcNTILIDDbF7G8C7KFl4VTRVDSJGcYmeoQGhmfSvZWwhv6YFMa5rrh33U/h9dkNRLe9EJEZh92ZOzmnC6iawGdL0A/EGNRDononkax5RTz3kuenbOrWbGhYQLTJS5hUjE7MPe9xm0mr6bddmEJKrHgss4lpbpRT9ji6V+mi6Ezlabiw2yg5iLNKsMDDANKXu2DVeW+NwDglWqqUbLgcMjGhqPCgOhYxbnAuwhMKyr+IEPbewLDCfIpsyqo0+0DKUuFGERefs8jeTBoKh5zT225ojvVYSU6AvgFsBe8gydw5H5aQiOuMDATTJM76uV6R5sYC2svm5+te9FhMK7Y1KRlHXZi1q0uwUts1Z8hcXn67D2jmbzeI8PglDMgIjmFhzomEIKZw/W6CD9x5nR4tYwkxeEuqwZzdvjqpNEc2kWCdhHEIg+k4caDVan+5bYrQ3pZV+bz6vJZCqTfnt27ckQsuMUPL/uw9H0pZslZ9BgxchJEw82JFyUYXnIT5YlKPGZqK2yGpDWPo0gND6GE3hv8VyKg/Wdv9kGQOUag/Vxej9f+6strzdTEIzGytjRNflWlm/Urc6ds6wucqy9jG+UOGXb5fPEq+ikPiImrIE2yKWkAkJd1TtwzWdFBdO4+YJKGFbwpnjtm+ZV1PVLfOYBybyfMhwZWKSLSiSugWcXAVHRizQJhy0AA9CFQV9OlS3ncIfXMPnslt3K73CpqH+ggiPw==
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(7416014)(376014)(82310400026)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: k0R8SvDviAXZuG34mSEy4cSjlNwBY0xxZ7TFfBJWFbp1C6c07fQ3M4g35cOYtReNQchfT7Ip2IrvlQ+/FLRKz9OBvsz9i/i77utx/y7OD4qFkebG8QWKC6oV/3OLJ5nSmoPc7b/BbUq9/qE7q3KKVBx9oaxREaW5zOZUcG1oylUDaz3S7xc6v9CxQwhLmxEJl8Y7ROvnTkBQz28RYfwa7h2X3jOhadHZd09oZJtdqHWL5mcMEBgWKGIUOzaXh/rlL1q5kF0e3eZaMAdyBTDnUqGwwUmb+Xvp5pt7Hxi1nvv6k4d2neUfC6cgItbHcJXQvf2X8Km1fPVcfNtHa16vKFaEZq0LO+4SlS0vvOiRnQvZvoW58MvJtjUatbaXMSyCJLFUzdsMERmrvV8KjAvaj55dFNn+vsByiq9cFu8rLy5Jf7im4OclPno1ORj3TGyv
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 23:41:51.0492
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 609a9724-0578-4277-1f8f-08de7bd9f0c7
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00001CDD.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFDF5E260D0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_154201_266186_B6BFDC59 
X-CRM114-Status: GOOD (  29.34  )
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

When a device's default substream attaches to an identity domain, the SMMU
driver currently sets the device's STE between two modes:

  Mode 1: Cfg=Translate, S1DSS=Bypass, EATS=1
  Mode 2: Cfg=bypass (EATS is ignored by HW)

When there is an active PASID (non-default substream), mode 1 is used. And
when there is no PASID support or no active PASID, mode 2 is used.

The driver will also downgrade an STE from mode 1 to mode 2, when the last
active substream becomes inactive.

However, there are PCIe devices that demand ATS to be always on. For these
devices, their STEs have to use the mode 1 as HW ignores EATS with mode 2.

Change the driver accordingly:
  - always use the mode 1
  - never downgrade to mode 2
  - allocate and retain a CD table (see note below)

Note that these devices might not support PASID, i.e. doing non-PASID ATS.
In such a case, the ssid_bits is set to 0. However, s1cdmax must be set to
a !0 value in order to keep the S1DSS field effective. Thus, when a master
requires ats_always_on, set its s1cdmax to minimal 1, meaning the CD table
will have a dummy entry (SSID=1) that will be never used.

Now, for these device, arm_smmu_cdtab_allocated() will always return true,
v.s. false prior to this change. When its default substream is attached to
an IDENTITY domain, its first CD is NULL in the table, which is a totally
valid case. Thus, add "!master->ats_always_on" to the condition.

Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h |  1 +
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 72 ++++++++++++++++++---
 2 files changed, 65 insertions(+), 8 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
index 3c6d65d36164f..f966d474b61fd 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
@@ -848,6 +848,7 @@ struct arm_smmu_master {
 	bool				ats_enabled : 1;
 	bool				ste_ats_enabled : 1;
 	bool				stall_enabled;
+	bool				ats_always_on;
 	unsigned int			ssid_bits;
 	unsigned int			iopf_refcount;
 };
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 4d00d796f0783..ef98e79b4e75d 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -1482,8 +1482,11 @@ void arm_smmu_clear_cd(struct arm_smmu_master *master, ioasid_t ssid)
 	if (!arm_smmu_cdtab_allocated(&master->cd_table))
 		return;
 	cdptr = arm_smmu_get_cd_ptr(master, ssid);
-	if (WARN_ON(!cdptr))
+	if (!cdptr) {
+		/* Only ats_always_on allows a NULL CD on default substream */
+		WARN_ON(!master->ats_always_on || ssid);
 		return;
+	}
 	arm_smmu_write_cd_entry(master, ssid, cdptr, &target);
 }
 
@@ -1496,6 +1499,22 @@ static int arm_smmu_alloc_cd_tables(struct arm_smmu_master *master)
 	struct arm_smmu_ctx_desc_cfg *cd_table = &master->cd_table;
 
 	cd_table->s1cdmax = master->ssid_bits;
+
+	/*
+	 * When a device doesn't support PASID (non default SSID), ssid_bits is
+	 * set to 0. This also sets S1CDMAX to 0, which disables the substreams
+	 * and ignores the S1DSS field.
+	 *
+	 * On the other hand, if a device demands ATS to be always on even when
+	 * its default substream is IOMMU bypassed, it has to use EATS that is
+	 * only effective with an STE (CFG=S1translate, S1DSS=Bypass). For such
+	 * use cases, S1CDMAX has to be !0, in order to make use of S1DSS/EATS.
+	 *
+	 * Set S1CDMAX no lower than 1. This would add a dummy substream in the
+	 * CD table but it should never be used by an actual CD.
+	 */
+	if (master->ats_always_on)
+		cd_table->s1cdmax = max_t(u8, cd_table->s1cdmax, 1);
 	max_contexts = 1 << cd_table->s1cdmax;
 
 	if (!(smmu->features & ARM_SMMU_FEAT_2_LVL_CDTAB) ||
@@ -3250,7 +3269,8 @@ static int arm_smmu_blocking_set_dev_pasid(struct iommu_domain *new_domain,
 	 * When the last user of the CD table goes away downgrade the STE back
 	 * to a non-cd_table one, by re-attaching its sid_domain.
 	 */
-	if (!arm_smmu_ssids_in_use(&master->cd_table)) {
+	if (!master->ats_always_on &&
+	    !arm_smmu_ssids_in_use(&master->cd_table)) {
 		struct iommu_domain *sid_domain =
 			iommu_driver_get_domain_for_dev(master->dev);
 
@@ -3274,6 +3294,8 @@ static void arm_smmu_attach_dev_ste(struct iommu_domain *domain,
 		.old_domain = old_domain,
 		.ssid = IOMMU_NO_PASID,
 	};
+	bool ats_always_on = master->ats_always_on &&
+			     s1dss != STRTAB_STE_1_S1DSS_TERMINATE;
 
 	/*
 	 * Do not allow any ASID to be changed while are working on the STE,
@@ -3285,7 +3307,7 @@ static void arm_smmu_attach_dev_ste(struct iommu_domain *domain,
 	 * If the CD table is not in use we can use the provided STE, otherwise
 	 * we use a cdtable STE with the provided S1DSS.
 	 */
-	if (arm_smmu_ssids_in_use(&master->cd_table)) {
+	if (ats_always_on || arm_smmu_ssids_in_use(&master->cd_table)) {
 		/*
 		 * If a CD table has to be present then we need to run with ATS
 		 * on because we have to assume a PASID is using ATS. For
@@ -3581,6 +3603,40 @@ static void arm_smmu_remove_master(struct arm_smmu_master *master)
 	kfree(master->streams);
 }
 
+static int arm_smmu_master_prepare_ats(struct arm_smmu_master *master)
+{
+	bool s1p = master->smmu->features & ARM_SMMU_FEAT_TRANS_S1;
+	unsigned int stu = __ffs(master->smmu->pgsize_bitmap);
+	struct pci_dev *pdev = to_pci_dev(master->dev);
+	int ret;
+
+	if (!arm_smmu_ats_supported(master))
+		return 0;
+
+	if (!pci_ats_always_on(pdev))
+		goto out_prepare;
+
+	/*
+	 * S1DSS is required for ATS to be always on for identity domain cases.
+	 * However, the S1DSS field is ignored if !IDR0_S1P or !IDR1_SSIDSIZE.
+	 */
+	if (!s1p || !master->smmu->ssid_bits) {
+		dev_info_once(master->dev,
+			      "SMMU doesn't support ATS to be always on\n");
+		goto out_prepare;
+	}
+
+	master->ats_always_on = true;
+
+	ret = arm_smmu_alloc_cd_tables(master);
+	if (ret)
+		return ret;
+
+out_prepare:
+	pci_prepare_ats(pdev, stu);
+	return 0;
+}
+
 static struct iommu_device *arm_smmu_probe_device(struct device *dev)
 {
 	int ret;
@@ -3629,14 +3685,14 @@ static struct iommu_device *arm_smmu_probe_device(struct device *dev)
 	    smmu->features & ARM_SMMU_FEAT_STALL_FORCE)
 		master->stall_enabled = true;
 
-	if (dev_is_pci(dev)) {
-		unsigned int stu = __ffs(smmu->pgsize_bitmap);
-
-		pci_prepare_ats(to_pci_dev(dev), stu);
-	}
+	ret = arm_smmu_master_prepare_ats(master);
+	if (ret)
+		goto err_disable_pasid;
 
 	return &smmu->iommu;
 
+err_disable_pasid:
+	arm_smmu_disable_pasid(master);
 err_free_master:
 	kfree(master);
 	return ERR_PTR(ret);
-- 
2.43.0


