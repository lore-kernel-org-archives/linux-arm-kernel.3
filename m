Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 274E7D3514B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 07:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/8OEV205hOziypl1nmJRGmEg0Pk/aozqrUUWMUkOv9w=; b=Qy7bLt/gzhANiEYpCP0YOgUNWB
	Ljk+TY30+tjnj1O5oOzULNQVvJkN0LDgQpbr1S1GW1zb59u0bV2mONf0ZMgaMygpVUuAuqkozs2bF
	jY9flu4PoX9qvSgweKv5mGSzqa8VzwfcmYouss0OIKGGY1VPb0fNRxOOTeBkQ97E1I0at3RD7iKfq
	xNNELzqA4o0i4+zMo8s4kYBCHd4fLt9mVNFkcvKRemMZB1j5WtE+sr6f2nTfwrL6o8yZ50svO5bHz
	Kj7Q+aUahChH6p85vC8MLgb367XCEXqJZ9KZIuGXKmDLWeVmEe7KwSwYAMcj2ide7GAKBGVDITQdA
	ePjmvGTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7q2K-0000000EDlR-1geH;
	Wed, 01 Apr 2026 07:30:48 +0000
Received: from mail-westus2azlp170120002.outbound.protection.outlook.com ([2a01:111:f403:c007::2] helo=MW6PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7q2F-0000000EDki-0Wm3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Apr 2026 07:30:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mpKuFoTTlzomWiDl2ESic474u5ZvlmuYHLEJs93v4hBMI1xe7wULiYvbltqqZuQ0+uopLumAbs+ktdKSZw97XutLeAaWHBpGFUQ39mWsDtGUoAMcK/5SrnCg5Q5M0aOEYyiVsf4nPhztmyCwXw3lGEpJPGrKpfwTHPTndHc/EbsnPGauInUFKqoqmwGmvWhv5f2sxOHL3pM/ZAexgBwM6fJvSdw5clPZMuDy3rSzKkimxIcgSHIqa5BNVRM0YjjY5S2neq6NR1/vsZnFXDdXkQM3r73MJT1xPX1TY/xsZO42xMyhamiqnj6sTtJXwJsIHBbdCIs2qzx20hvfdqtn9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/8OEV205hOziypl1nmJRGmEg0Pk/aozqrUUWMUkOv9w=;
 b=CwLwHV3zhKwNjYZrOn44wgZiYb8VEvtwF7aR9CdGk97KxE50ouUJnZdml+tx6XlJJ3/zWYHiSqA4/Kf0qbqaLUqGDhYInMMNeoRd0glXLEbHQ+DESrOgDUdcBET2ptw9oGOceZJWxqQnu32gHeSd46shxmP13KjDv8XITuANLQ1lijO8PmuNERCpONWyTd9tvc7Gtz1tF5cPYz9DB5W+Cjo5hr7sa3uzG0ulX5RewIFlZ4J54VeGNiwABeuMrtMxchhczd+9U7NSBIkeXBc/ZvnzCGI8uielTIuPRpCJ8OjNVcrmrieC/VFrVsLuz6YgPpbi2O+aRSHKLqmpOdlg7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/8OEV205hOziypl1nmJRGmEg0Pk/aozqrUUWMUkOv9w=;
 b=C7uA3xbGLzUG5rmqVIlCvVyhVm7Dwi5QYsU8hvovXaeVsrDg2UYXeeyiqwMCkdn+5iI6+WvM7e5SD6d5aWuCbHEphzimgFXKk9ka1vAbfoFdnWdtFWYvo3sfZ0LsB6PMgvUAh/x+nEfMVE3cyifQn1JKp/wJ03Iu6Jq/mxW8E0o=
Received: from BL1P223CA0012.NAMP223.PROD.OUTLOOK.COM (2603:10b6:208:2c4::17)
 by MW5PR10MB5826.namprd10.prod.outlook.com (2603:10b6:303:19b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Wed, 1 Apr
 2026 07:30:37 +0000
Received: from BL02EPF00021F68.namprd02.prod.outlook.com
 (2603:10b6:208:2c4:cafe::2b) by BL1P223CA0012.outlook.office365.com
 (2603:10b6:208:2c4::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.30 via Frontend Transport; Wed,
 1 Apr 2026 07:30:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BL02EPF00021F68.mail.protection.outlook.com (10.167.249.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Wed, 1 Apr 2026 07:30:36 +0000
Received: from DFLE211.ent.ti.com (10.64.6.69) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 1 Apr
 2026 02:30:33 -0500
Received: from DFLE207.ent.ti.com (10.64.6.65) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 1 Apr
 2026 02:30:33 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 1 Apr 2026 02:30:33 -0500
Received: from a0507033-hp.dhcp.ti.com (a0507033-hp.dhcp.ti.com [172.24.231.225])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6317UN3Q3832504;
	Wed, 1 Apr 2026 02:30:28 -0500
From: Aksh Garg <a-garg7@ti.com>
To: <linux-pci@vger.kernel.org>, <linux-doc@vger.kernel.org>,
	<mani@kernel.org>, <kwilczynski@kernel.org>, <bhelgaas@google.com>,
	<corbet@lwn.net>, <kishon@kernel.org>, <skhan@linuxfoundation.org>,
	<lukas@wunner.de>, <cassel@kernel.org>, <alistair@alistair23.me>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<s-vadapalli@ti.com>, <danishanwar@ti.com>, <srk@ti.com>, <a-garg7@ti.com>
Subject: [PATCH v2 1/4] PCI/DOE: Move common definitions to the header file
Date: Wed, 1 Apr 2026 13:00:19 +0530
Message-ID: <20260401073022.215805-2-a-garg7@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260401073022.215805-1-a-garg7@ti.com>
References: <20260401073022.215805-1-a-garg7@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F68:EE_|MW5PR10MB5826:EE_
X-MS-Office365-Filtering-Correlation-Id: d8bf949e-ab45-4752-5275-08de8fc09115
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|82310400026|1800799024|36860700016|921020|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: QnYsR+k0hTGagduKICOj88AEPCVtSkNg/6NyjjoF5tKaneWlhHVYIpM0jpHlEByCD3sBaYpMe4QgKcbkGzgNMZ3PRxQ8zXvGfb3DqhxgAHseY1u7Y83Ez3Zv+2IhF48wOFzsP2vpg2XZ8qDa91+d7AQ3VYo8CkqIx0UV/dzulpOZc0DIa+88MTtXklUdTrzqHMBQYNXvIMXvEgT3k4LLSFPtHNZV/JdGRJgi82N/oN8iZGwGMuKF747nVSvoonzI26myoZnvAfYzrPq0jf6IFagsHmmTpKbwCEEj3hBtVjuVy/16bOy2/K23OMULUO/uBzJRQ2JGqImE0OL0v6tD3rT2ok4RFF+7kzztMEDZIhP9QfN6Q+36YaWw6NzsdAIGz/ht1gDXJozZOdPyoZGkQ2nXVZ7a8eD+zHtojQijJzlk/3KB7saUPJymzvdbc8EynItjIakvzACEm8QbaFktdijwidzWUMJZd22Dl614HodGR8QBeNDgIiRsfqw1O+E+bJTKP6uOZ4U6PkPIVbtonjQFoOrQ2VpdPMgJvmMZa+yXAEQoPoY5WIe7s2RE/y5Ly2JxPHXuoVBJxrLvvYOT0Z08HBW5e9lY1WB3a5lwYdn9Uf4kIWOOnwMEBUZtNSqzIas9oAHKoYIYF60cYskGx8VznAE6eKT73jRU39t864gXklx5cJzCaJrO1k5TKq+zaSAXwYWQL24WQKyqoz1PYmV+XUQOExw3yrlSmrnLh+rVkDTpx0Fc9E2ctdiU6yjtKqpzgTTM6v9tSn1ypVEu2hNvB8Tci629FRNG3tP+q319RitiE1PyNQphsGB9uIoo
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(7416014)(82310400026)(1800799024)(36860700016)(921020)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: aS6LAhxRx53RNyPfSfj+XoB83Xfcz4CHv8JocbC0PRB2AufYftbtlMB08V/X5fwljFheIh0NBkYYAbKQ/iRLho4e9S5cCnkteGEjavBpwfMRG6jOnb08K9EOy6/KVZwFwV11H8B0wadVr0H9uzH9D4XzhrkA9lhTH8BbCROqNMpjEpBTZpyqpAtDDiBywRFeDM0xzwQgzdPZe0Lp8GwsFryreepb2kAvv/MISBrZBnvCmaYLiavwyqBLuNm9iM7YQMQXvtNskqeowZ91YNqvxyzu3uYHGBp/r7gl406p+x7RPjir98ejNgIQtqBgCuHcgoOWvel4fFxGJI6HS/0aTSVusV/sWJI5aAE0tVe2swgTPSmRZmhV/SRwWPeoH6eoYNvAId06MHTsP0iAY54+hAPMcCqRB0Ifi/yVbkjLqsFZnvwjv5mbA0JLspNMMhF/
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2026 07:30:36.2531
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d8bf949e-ab45-4752-5275-08de8fc09115
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF00021F68.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR10MB5826
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_003043_373377_499B0099 
X-CRM114-Status: GOOD (  12.72  )
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

Move common macros and structures from drivers/pci/doe.c to
drivers/pci/pci.h to allow reuse across root complex and
endpoint DOE implementations.

PCI_DOE_MAX_LENGTH macro can be used outside the PCI core as well,
hence move the macro to include/linux/pci-doe.h.

These changes prepare the groundwork for the DOE endpoint implementation
that will reuse these common definitions.

Co-developed-by: Siddharth Vadapalli <s-vadapalli@ti.com>
Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
Signed-off-by: Aksh Garg <a-garg7@ti.com>
---

Changes since v1:
- Moved the common macros that need not be visible outside the PCI core
  to drivers/pci/pci.h instead to include/linux/pci-doe.h as suggested
  by Lukas Wunner
- Removed the redundant empty inlines guarded with CONFIG_PCI_DOE in
  include/linux/pci-doe.h.

v1: https://lore.kernel.org/all/20260213123603.420941-3-a-garg7@ti.com/

 drivers/pci/doe.c       | 11 -----------
 drivers/pci/pci.h       |  9 +++++++++
 include/linux/pci-doe.h |  3 +++
 3 files changed, 12 insertions(+), 11 deletions(-)

diff --git a/drivers/pci/doe.c b/drivers/pci/doe.c
index 7b41da4ec11a..e8d9e95644b3 100644
--- a/drivers/pci/doe.c
+++ b/drivers/pci/doe.c
@@ -28,12 +28,6 @@
 #define PCI_DOE_TIMEOUT HZ
 #define PCI_DOE_POLL_INTERVAL	(PCI_DOE_TIMEOUT / 128)
 
-#define PCI_DOE_FLAG_CANCEL	0
-#define PCI_DOE_FLAG_DEAD	1
-
-/* Max data object length is 2^18 dwords */
-#define PCI_DOE_MAX_LENGTH	(1 << 18)
-
 /**
  * struct pci_doe_mb - State for a single DOE mailbox
  *
@@ -63,11 +57,6 @@ struct pci_doe_mb {
 #endif
 };
 
-struct pci_doe_feature {
-	u16 vid;
-	u8 type;
-};
-
 /**
  * struct pci_doe_task - represents a single query/response
  *
diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index 13d998fbacce..66b7ec80f46f 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -681,6 +681,15 @@ struct pci_sriov {
 	bool		drivers_autoprobe; /* Auto probing of VFs by driver */
 };
 
+/* DOE Mailbox state flags */
+#define PCI_DOE_FLAG_CANCEL	0
+#define PCI_DOE_FLAG_DEAD	1
+
+struct pci_doe_feature {
+	u16 vid;
+	u8 type;
+};
+
 #ifdef CONFIG_PCI_DOE
 void pci_doe_init(struct pci_dev *pdev);
 void pci_doe_destroy(struct pci_dev *pdev);
diff --git a/include/linux/pci-doe.h b/include/linux/pci-doe.h
index bd4346a7c4e7..abb9b7ae8029 100644
--- a/include/linux/pci-doe.h
+++ b/include/linux/pci-doe.h
@@ -19,6 +19,9 @@ struct pci_doe_mb;
 #define PCI_DOE_FEATURE_CMA 1
 #define PCI_DOE_FEATURE_SSESSION 2
 
+/* Max data object length is 2^18 dwords */
+#define PCI_DOE_MAX_LENGTH		(1 << 18)
+
 struct pci_doe_mb *pci_find_doe_mailbox(struct pci_dev *pdev, u16 vendor,
 					u8 type);
 
-- 
2.34.1


