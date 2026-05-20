Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4839ACD5BAB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 19:47:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=khMoKqyUxnlqHF91nNY1alM8Q2WjtA/+9KsiOfe/Cfw=; b=NOXZ4GO6U0zc/dmuUpb+iaLD14
	akLtZbYtzBRcSZB1jvGpgeWHMEPx+ZkRh/dWldP7KyWGyT+04nLR/EJ696/S7WmMjiWMFbZJSKnjy
	BepYqiwz8txUfuXf2pssA1L0Pwt3iOU7Q6TpQBM/QPd77Xc8BAF9I13Gl9ya6D0cp1X+iO1TbUaSG
	qLmw5toHd+d3uTgQ05LInTgdqP29npxMAKZHclfMTmr+elyVDBNkwoGyj30EUeSwwuZIn7HsFbk0I
	Gz7/37fvLEd3ZqxmOY/qp8VHhM+KBn1iwrm5Zz0X4CpinzzBlPrDdY0kFNR+XkmZmb7hQPYVvDzxn
	qEo6xhnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPmsi-00000005eVq-3x6d;
	Wed, 20 May 2026 19:47:04 +0000
Received: from mail-westcentralusazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c112::7] helo=CY3PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPmsg-00000005eTs-0qH0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 19:47:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aX36v/BCYXTpPHM4bsirsFnUpcre7IAYe1k89bdbwHgm0sywAEbHMVuh6SR0O7HpJdWlOaoAwv8D8dcj6ZnxSrkV83uMUUwTAARNml6+Yn4E1NTMfqcfbWj4Bzi9Uoq9ZQ2lXWSGMwhFnn/sMXXAKxweap4CPrlfDx4jg9Q3gW9+2/s+CCxAEiz0A/+CHTweHSHzIoJFbONcupYpOivJ03VhMqY8LOeEn90VnSAR36gr613w54I7qESMRoMyMcin7I1WmR5wPN0k533yE1X8qLYPAHjN/RTzF5DycyyPfUfDa81oFNOHDhpxLZ6eN/LHS7RZS6NyzM6Wlr4c3WALAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=khMoKqyUxnlqHF91nNY1alM8Q2WjtA/+9KsiOfe/Cfw=;
 b=MPrszM2xv4d/CwMbHB5R4+LTAGtLekIVrq0U+R9UEr7+952QVkoOVyDGLwM5r4lbl2ewhwx91ULLi/28dcR7MHUJNWGErBpNBR+jbPFadPg2V34I13WeJEGJKZgTrf1ZE/7rdQFqk/I/4uiSQ3WsJAM11BY/TEf583o3xAsyEZiaHFJzBMqXePt/4XWtiKn1w1kIaII19zeNJLeeeuyHjMfRXKUMYVlKQHRr52C1bK7TlURSd92JvhYHAnLnI8vH9y2L3Ltj/aM0EYejhUzxGRALQxrFWNnp/yO0rBDBOjyD8xT8ed0/lcIxVxst3jamoi8EflA3b2Tn3vMahMDFPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=huawei.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=khMoKqyUxnlqHF91nNY1alM8Q2WjtA/+9KsiOfe/Cfw=;
 b=BzjL8N5pkBjDXR+8gvb88AAlDNZX+JzrXDTuWmcfJqufFxo1glJGlF/YTfUkMn7b9eKJ5oRkBmiuMPStihVbXXIhvLMzBTIjWCS0WSfcYBDL+6Ybzdh6cBXf2YXwsxQpwJWy36HNdchHSQyrrFPA35qRIHMa0pGT36jZTqPCFHnvLKGvqVUsK3xPzSW0p6JNhIpXCYHyMqIcDDNxbnfad/BfhtIG81puCEqITQvDJP/je9UA3RsJT3Ch3AvLyK0aSPcrvnlxOX4h1JJa+t0mC4M4gLHVqm/o2qTwspgQulx+NADNnPSETiEfplYiY2GMTmG2dMLzbN2npgBHFNGDug==
Received: from MW4PR04CA0151.namprd04.prod.outlook.com (2603:10b6:303:85::6)
 by PH8PR12MB8431.namprd12.prod.outlook.com (2603:10b6:510:25a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.24; Wed, 20 May
 2026 19:46:44 +0000
Received: from MWH0EPF000A6734.namprd04.prod.outlook.com
 (2603:10b6:303:85:cafe::22) by MW4PR04CA0151.outlook.office365.com
 (2603:10b6:303:85::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.16 via Frontend Transport; Wed, 20
 May 2026 19:46:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 MWH0EPF000A6734.mail.protection.outlook.com (10.167.249.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.11 via Frontend Transport; Wed, 20 May 2026 19:46:43 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 20 May
 2026 12:46:25 -0700
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Wed, 20 May 2026 12:46:25 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.126.190.181) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Wed, 20 May 2026 12:46:24 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: <jgg@nvidia.com>, <will@kernel.org>, <joro@8bytes.org>,
	<bhelgaas@google.com>
CC: <robin.murphy@arm.com>, <praan@google.com>, <baolu.lu@linux.intel.com>,
	<kevin.tian@intel.com>, <miko.lenczewski@arm.com>,
	<linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <linux-pci@vger.kernel.org>,
	<dan.j.williams@intel.com>, <jonathan.cameron@huawei.com>,
	<vsethi@nvidia.com>, <linux-cxl@vger.kernel.org>, <nirmoyd@nvidia.com>
Subject: [PATCH v5 2/3] PCI: Allow ATS to be always on for pre-CXL devices
Date: Wed, 20 May 2026 12:46:09 -0700
Message-ID: <35e75bf0abfa48f76bc87d73a772a3faf6271a9f.1779304390.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1779304390.git.nicolinc@nvidia.com>
References: <cover.1779304390.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6734:EE_|PH8PR12MB8431:EE_
X-MS-Office365-Filtering-Correlation-Id: 7be7019e-c070-4087-2dfd-08deb6a8853b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|7416014|11063799006|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: A3wapzF8B7LzrXBNDuQ1Yfy2l2LiJ0i3OKYsufNLgo4TjsZj8SN+t2R+vKKI9GKmFqB3/0dCaAhdQPoyuJmawLcgZYqE2/sq5BnKNUz2NDTb4kIBzRAQSyaJUrDYyMGiSptrVSRwKGLAREZzzcsXHaVFmPvZ6an4RMioR7TlP33JhmZot2tuwLgyV7v3/N9WDRT7loqjjXWcrrFCPD157mZmRaAPS1jpawSYO6FLTjtev6wNuG9FJExY3Yr1CBsOuVCrl8yfJh9utEvR06oqnn9ZDpAWnZ6Up3ffx+akeo9/k4pz/e6hnJ/CfMCrjGoLmwB9zLDpRHJwZfsL3weHysahlEfVzfATLm1guUmGgANqtAXTwxDYwDhq5cQlPupieWbKhk59A/XT5MAL+5S8Ez1tnrgu9d76mdsTlr9Qm5A+i9UtqQ2FpN5jLDOP0XakIzB7trzdr38+92P4cdgAU/oW4C+q6woUDo1dWr7W1opQAAyWtHyro2kJaRGGDMBWC2j2DUeB0eThA27mqzo6+F9RGadM04/bMEaJ20MrH4Ll8vNYU5hZaf+XKDcE3N4HqKlF0rG+BX7vc8WeFCkqDSiahygkCiw6dvMi5AzDouTYZMV1IwkBR6x+CAN9k1eRfXrlOhAU/yYYAZWTL14xlgXHJc+u6Q5ugs2hC5K7Zvc5epyp84daDHlektJLcBXl0tZWneAOl/pykYltLkd/eHfuy8ECHndoaeoYqYECxC4=
X-Forefront-Antispam-Report: CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(7416014)(11063799006)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: qdPHCZ6tOPVuN+06il3pbZJu97AE1zVyPJFYnVYy/XegWbFFpK6dZNuplbU6+w6Zh5Vc+AVTB9SiEty35tMNxz0UisYdlZ0qTAAArsQiJ15wJysEGdqGSVXxSeZ1vJI946ISq2pxFg4qryJZSLbF8N+ohblBf5KojM2e6PVyKam4rfahukVKh571e3xhn+4AJxU1Eo13R/NotPdLulvURfonQVmdJqZvmb4ZgXScbrgqhxIElom24sSVQE0cTHzit6siQexfcui2/dW+xhHgL07JXujIbz9biKr9SJaKwooLswxIE53PfsNypsHGtd8qZlL+VKHBcx1GHEesgob5I3QX8BLqL9CJSsPUvJ/t5x+Ua1Mkkxu9c/fvkaWkkhSGwRxybvKUmb+hFtC2sH6vlvnsRRT4wiyx5MLVlbjb0pfJxvbNceuTnADAKIFz0bfM
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 19:46:43.7034
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7be7019e-c070-4087-2dfd-08deb6a8853b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000A6734.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB8431
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_124702_294923_2BAF7261 
X-CRM114-Status: GOOD (  15.89  )
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

Some NVIDIA GPU/NIC devices, though they don't implement CXL config space,
have many CXL-like properties. Call this kind "pre-CXL".

Similar to CXL.cache capability, these pre-CXL devices also require the ATS
function even when their RIDs are IOMMU bypassed, i.e. keep ATS "always on"
v.s. "on demand" when a non-zero PASID line gets enabled in SVA use cases.

Introduce pci_dev_specific_ats_required() quirk function to scan a list of
IDs for these devices. Then, include it in pci_ats_required().

Suggested-by: Jason Gunthorpe <jgg@nvidia.com>
Reviewed-by: Nirmoy Das <nirmoyd@nvidia.com>
Tested-by: Nirmoy Das <nirmoyd@nvidia.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Reviewed-by: Kevin Tian <kevin.tian@intel.com>
Reviewed-by: Dave Jiang <dave.jiang@intel.com>
Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 drivers/pci/pci.h    |  9 +++++++++
 drivers/pci/ats.c    |  3 ++-
 drivers/pci/quirks.c | 42 ++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 53 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index 4a14f88e543a2..e8ad27abb1cfe 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -1155,6 +1155,15 @@ static inline int pci_dev_specific_reset(struct pci_dev *dev, bool probe)
 }
 #endif
 
+#if defined(CONFIG_PCI_QUIRKS) && defined(CONFIG_PCI_ATS)
+bool pci_dev_specific_ats_required(struct pci_dev *dev);
+#else
+static inline bool pci_dev_specific_ats_required(struct pci_dev *dev)
+{
+	return false;
+}
+#endif
+
 #if defined(CONFIG_PCI_QUIRKS) && defined(CONFIG_ARM64)
 int acpi_get_rc_resources(struct device *dev, const char *hid, u16 segment,
 			  struct resource *res);
diff --git a/drivers/pci/ats.c b/drivers/pci/ats.c
index ebdf761843867..3a04d5b04c883 100644
--- a/drivers/pci/ats.c
+++ b/drivers/pci/ats.c
@@ -247,7 +247,8 @@ bool pci_ats_required(struct pci_dev *pdev)
 	if (pdev->is_virtfn)
 		pdev = pci_physfn(pdev);
 
-	return pci_cxl_ats_required(pdev);
+	return pci_cxl_ats_required(pdev) ||
+	       pci_dev_specific_ats_required(pdev);
 }
 EXPORT_SYMBOL_GPL(pci_ats_required);
 
diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
index caaed1a01dc02..c0242f3e9f063 100644
--- a/drivers/pci/quirks.c
+++ b/drivers/pci/quirks.c
@@ -5715,6 +5715,48 @@ DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_INTEL, 0x1457, quirk_intel_e2000_no_ats);
 DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_INTEL, 0x1459, quirk_intel_e2000_no_ats);
 DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_INTEL, 0x145a, quirk_intel_e2000_no_ats);
 DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_INTEL, 0x145c, quirk_intel_e2000_no_ats);
+
+static bool quirk_nvidia_gpu_ats_required(struct pci_dev *pdev)
+{
+	switch (pdev->device) {
+	case 0x2e00 ... 0x2e3f: /* GB20B */
+		return true;
+	}
+	return false;
+}
+
+static const struct pci_dev_ats_required {
+	u16 vendor;
+	u16 device;
+	bool (*ats_required)(struct pci_dev *dev);
+} pci_dev_ats_required[] = {
+	/* NVIDIA GPUs */
+	{ PCI_VENDOR_ID_NVIDIA, PCI_ANY_ID, quirk_nvidia_gpu_ats_required },
+	/* NVIDIA CX10 Family NVlink-C2C */
+	{ PCI_VENDOR_ID_MELLANOX, 0x2101, NULL },
+	{ 0 }
+};
+
+/*
+ * Some NVIDIA devices do not implement CXL config space, but present as PCIe
+ * devices that can issue CXL-like cache operations like CXL.cache. Thus, they
+ * require ATS to obtain host physical addresses, like pci_cxl_ats_required().
+ */
+bool pci_dev_specific_ats_required(struct pci_dev *pdev)
+{
+	const struct pci_dev_ats_required *i;
+
+	for (i = pci_dev_ats_required; i->vendor; i++) {
+		if (i->vendor != pdev->vendor)
+			continue;
+		if (i->ats_required && i->ats_required(pdev))
+			return true;
+		if (!i->ats_required && i->device == pdev->device)
+			return true;
+	}
+
+	return false;
+}
 #endif /* CONFIG_PCI_ATS */
 
 /* Freescale PCIe doesn't support MSI in RC mode */
-- 
2.43.0


