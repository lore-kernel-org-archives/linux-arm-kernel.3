Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01A84FC9EC0
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 23:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dIAeS2SDhDN3D2rj4M7gOIYpLMP7babZHNEGc61sqo0=; b=wxPENmTRB7L+sj0R+sTnKHvINm
	e79lJKxS0mASO64Hm/gcjf5EE7NWQlMlnvRyb8GEdMcWc5p8MbHf55f4FVkBpAQCQmrtE1QA3zyUL
	7k9M7VtoPJzS8jiGCsl9YkV8d4YdhZ32yov4X/+vzUDdPl6QI2q7Ni5Tsm9V2qsK11s7urA9Ebwug
	yGv43F3pjavISC0nIbvJWtb+NNtArvO2s72W1dheC/ZyenOq4iJbWRiUEUCC1Bt3ZpxwhYKIkNPkk
	J2MQ/Uxu4fpGBSK8l+xAUo3IbVzp1zmnCAgxtw2w6/U9GK9brHjFcyezg/EY+1BDXX3nQ/elEHDqQ
	tiHqSe6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyenx-00000004fFD-0tjw;
	Fri, 06 Mar 2026 23:42:01 +0000
Received: from mail-northcentralusazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c105::5] helo=CH5PR02CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyenu-00000004fDY-4BAi
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 23:42:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BLD+IlU5oK4MmosZIhfuy5/LlVK04k3ZreJL/WnWd2XpaulOST3dZWg/q6dAbO6FI6yxUnlZI8XvfAdG9JRW4xxIyec/oJjxpBX6c1LSQfEQLMUBH6+nMI4ZJJNQL7XOPGCqWY4MWG+Hjz1gLuty7OxyikEivo1i82eXok9LRd4ZgKVD3M+8EAHXnxACuBW2Gw8TRZRk7gAGWnO/V/exHAJBtx+lqtKl7JMLksKFVYjuQgiNgBYx6HwFSyJp/UNX/2sZb92kpX4iyMJXCyBxHUcMYxX4bkrT4TEn2KZSMCnSYrx6lrjNpYNbIf/GFcxbWAUVyuf/Nl4k73adBsG0cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dIAeS2SDhDN3D2rj4M7gOIYpLMP7babZHNEGc61sqo0=;
 b=M577/lNnbthUPmh4S4EoTmH1c7x7AHFNXySwba7F2yJnraSB910Rp1Dedg2YHzKu/tl7F0FAEPqgZ1JW3mPpMUJ4m8PZjDU3Tvq8mklETAEsixI0+A3Ns9YA+QpD6qu0ePeY6vvCHpS4LDiPN4//Y0QA0QKfR0F5o7PP0Es5UxUKPolT2OVxdVOEemjPgzAzRchQeczp+Qo8alZbR3unwfmiaPEBPKgwEVLgd9Vr+XmkyLdHBj2Bax5hj+t/AMkprjPCAtIDGlHlBbxGQu2TPgyLtx8LXb9Yl1DI4PXE08ubnEGIGEkajtsa6YcTVOOB7ajkYg9dbWFP6Im9KJ+V8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=huawei.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dIAeS2SDhDN3D2rj4M7gOIYpLMP7babZHNEGc61sqo0=;
 b=BRlzg2c6cRrw5HFbUJahl1OYRHdDVh3y5vcoHfPMYf8ilbHOfdblHaW3XIgOABjz0rUGivlvbHscJqQUL1LX3+NcIjU4HLP+gRJYMJ4Q774PUi+aXBPBqPh7G9iO+EtHvv0Uq8h6jVjWbllU0NJoWrLTKzyIfte1Z9N/n0iYQBdbNae5QjhchnSA6dcd8XT3NqtoAA2kM36zz8kiOJowIkiZbiL8HY9s78wC0Xz0Lfmo2D14vGokPCdwfPK82F9tC8bEkrDYYNZMVyvruPjCR9nQ0Gl/JviGZmb1vfkqmhidTG1uhlSG8/Dr0eneuJkFKggYJlAcQlI0cMVpbfAe3A==
Received: from SJ0PR13CA0175.namprd13.prod.outlook.com (2603:10b6:a03:2c7::30)
 by MN2PR12MB4128.namprd12.prod.outlook.com (2603:10b6:208:1dd::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.5; Fri, 6 Mar
 2026 23:41:51 +0000
Received: from SJ1PEPF00002314.namprd03.prod.outlook.com
 (2603:10b6:a03:2c7:cafe::b1) by SJ0PR13CA0175.outlook.office365.com
 (2603:10b6:a03:2c7::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.19 via Frontend Transport; Fri,
 6 Mar 2026 23:41:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SJ1PEPF00002314.mail.protection.outlook.com (10.167.242.168) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Fri, 6 Mar 2026 23:41:50 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 6 Mar
 2026 15:41:34 -0800
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 6 Mar
 2026 15:41:34 -0800
Received: from Asurada-Nvidia.nvidia.com (10.127.8.10) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Fri, 6 Mar 2026 15:41:33 -0800
From: Nicolin Chen <nicolinc@nvidia.com>
To: <jgg@nvidia.com>, <will@kernel.org>, <robin.murphy@arm.com>,
	<bhelgaas@google.com>
CC: <joro@8bytes.org>, <praan@google.com>, <baolu.lu@linux.intel.com>,
	<kevin.tian@intel.com>, <miko.lenczewski@arm.com>,
	<linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <linux-pci@vger.kernel.org>,
	<dan.j.williams@intel.com>, <jonathan.cameron@huawei.com>,
	<vsethi@nvidia.com>, <linux-cxl@vger.kernel.org>
Subject: [PATCH v3 2/3] PCI: Allow ATS to be always on for pre-CXL devices
Date: Fri, 6 Mar 2026 15:41:16 -0800
Message-ID: <c715b10b49d50eea5429454108d4221c1a78efaf.1772833963.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1772833963.git.nicolinc@nvidia.com>
References: <cover.1772833963.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002314:EE_|MN2PR12MB4128:EE_
X-MS-Office365-Filtering-Correlation-Id: b499e92e-f763-4f9c-4a23-08de7bd9f05c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|82310400026|1800799024|36860700016;
X-Microsoft-Antispam-Message-Info: W2WV7QlWLaK/59di+i/v/PJmh1Q+J+rT8g0BDlt0pZrX1up3zPuceuGzaIJu9sRSN10nKzEEM5R5hKweMO2W/MTGxH7Tvt2b8TmFL5ww4sJ6YTriTVcV/xilyogxWi7EkjwgNqHEiTUt8dehy+qt3UZbqK8VE3YX/GwHYLCdS35z85VZwPIE0TKgZcMvNgDU5BWBpbmZakD/Nvq5nPP+m8/P/Ltg6D/3Z0X+JhFeRN6pLovSRs4c+R0m6k5JygyS5rK2INfmjGvxJ6/RPYOIIyk8c4h6XgX8xLGQJHzccHmaJ64EvFjJV8wplfl+IN2jdNbTepZ/PzGsVk+Lu9yEmsZeSkfD3DlkEFIQEGEMl5NU1l1bYTWLH2gGTbTaZllMyITq2fbp+cZcSlUWRLZ3oDdORRdUXEW5PAFUdGDcvAYzK+jcMP3Ug305q6Vs9GiCI+Nc2Xx7S0tAABbdgSldfaWIK94f0dRbyxXM9EyOA5q6BwHuoCtUO3X3TQQdZ7K9BiMDu67JhxRWLplB6Q34a2hNLDYoG8E24f/mCjsEuq5cQmgaeH5ZhDjNycA6aUuRYw13PlXI0A0+SkuobuI7T7RmxZozvSVyzyU2+lFMxaSIWwjLI2f3l6dgLZZRp5cB49owO4eiDGf2QoxxdfAZFTFbF7NxA2Z82TecIgnB+BelnnczWvpL+4eSs/6AgRmUtyHHGWsJoXunq/AonKloF4dcAx0hpuXN0N6E4wGDvM0HyJonfia0kdDX4y4YkNl3jrlqkHHZjFHyqWPbDjzzsQ==
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(7416014)(82310400026)(1800799024)(36860700016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: QYWY1w/DklE97ybIxn+7BSms6WhUFWZUfTV0ySA54RmJDDpw69/IasVzqA2UPWC8Ggj2lGBS6HrRSeZRifOj9P3Dd/HCdFdjYjCFCv4iHRiUE3JFE0Du2HVREQ51ZktO1TbSELRiBmeQLZLLIPe0bYJubwBev0p+BBTGI5RrmY1lPL2UmS5KOj7C6Ieam0qn0jZDk9h9XxS6F+5UHDOVthO2Be7NAXMnKPuhCdXBc29n9rbEMw+teTmJAQca5ZEV6ed0YVGiTPmd42BxWCGnaVVBFNLKFOjrQiAfKsXe49DZ9jIO9PUjfy/xWUvTdvf6yV8e04I3fmdMmqYveJj8xGyYd2QDfOx8KbSiVOrDx+oAPxfs02LJMzkWDMtRcph3Yr2Qfa16y6OkeW/f/o36DOvJuwWvhdVilxDErffyckcs5i+l7SduOzMXS7hGe2+Q
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 23:41:50.2587
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b499e92e-f763-4f9c-4a23-08de7bd9f05c
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00002314.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4128
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_154159_060320_E45B7D1E 
X-CRM114-Status: GOOD (  13.75  )
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

Some NVIDIA GPU/NIC devices, although don't implement the CXL config space,
they have many CXL-like properties. Call this kind "pre-CXL".

Similar to CXL.cache capaiblity, these pre-CXL devices also require the ATS
function even when their RIDs are IOMMU bypassed, i.e. keep ATS "always on"
v.s. "on demand" when a non-zero PASID line gets enabled in SVA use cases.

Introduce pci_dev_specific_ats_always_on() quirk function to scan a list of
IDs for these device. Then, include it pci_ats_always_on().

Suggested-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 drivers/pci/pci.h    |  9 +++++++++
 drivers/pci/ats.c    |  3 ++-
 drivers/pci/quirks.c | 26 ++++++++++++++++++++++++++
 3 files changed, 37 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index 13d998fbacce6..13fa71f965900 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -1150,6 +1150,15 @@ static inline int pci_dev_specific_reset(struct pci_dev *dev, bool probe)
 }
 #endif
 
+#if defined(CONFIG_PCI_QUIRKS) && defined(CONFIG_PCI_ATS)
+bool pci_dev_specific_ats_always_on(struct pci_dev *dev);
+#else
+static inline bool pci_dev_specific_ats_always_on(struct pci_dev *dev)
+{
+	return false;
+}
+#endif
+
 #if defined(CONFIG_PCI_QUIRKS) && defined(CONFIG_ARM64)
 int acpi_get_rc_resources(struct device *dev, const char *hid, u16 segment,
 			  struct resource *res);
diff --git a/drivers/pci/ats.c b/drivers/pci/ats.c
index cf262eb6e6890..e6995b536ad4c 100644
--- a/drivers/pci/ats.c
+++ b/drivers/pci/ats.c
@@ -243,7 +243,8 @@ bool pci_ats_always_on(struct pci_dev *pdev)
 	if (pdev->is_virtfn)
 		pdev = pci_physfn(pdev);
 
-	return pci_cxl_ats_always_on(pdev);
+	return pci_cxl_ats_always_on(pdev) ||
+	       pci_dev_specific_ats_always_on(pdev);
 }
 EXPORT_SYMBOL_GPL(pci_ats_always_on);
 
diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
index 48946cca4be72..21451e62f284e 100644
--- a/drivers/pci/quirks.c
+++ b/drivers/pci/quirks.c
@@ -5714,6 +5714,32 @@ DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_INTEL, 0x1457, quirk_intel_e2000_no_ats);
 DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_INTEL, 0x1459, quirk_intel_e2000_no_ats);
 DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_INTEL, 0x145a, quirk_intel_e2000_no_ats);
 DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_INTEL, 0x145c, quirk_intel_e2000_no_ats);
+
+static const struct pci_dev_ats_always_on {
+	u16 vendor;
+	u16 device;
+} pci_dev_ats_always_on[] = {
+	/* NVIDIA GPUs */
+	{ PCI_VENDOR_ID_NVIDIA, 0x2e12, },
+	{ PCI_VENDOR_ID_NVIDIA, 0x2e2a, },
+	{ PCI_VENDOR_ID_NVIDIA, 0x2e2b, },
+	/* NVIDIA CX10 Family NVlink-C2C */
+	{ PCI_VENDOR_ID_MELLANOX, 0x2101, },
+	{ 0 }
+};
+
+/* Some pre-CXL devices require ATS on the RID when it is IOMMU-bypassed */
+bool pci_dev_specific_ats_always_on(struct pci_dev *pdev)
+{
+	const struct pci_dev_ats_always_on *i;
+
+	for (i = pci_dev_ats_always_on; i->vendor; i++) {
+		if (i->vendor == pdev->vendor && i->device == pdev->device)
+			return true;
+	}
+
+	return false;
+}
 #endif /* CONFIG_PCI_ATS */
 
 /* Freescale PCIe doesn't support MSI in RC mode */
-- 
2.43.0


