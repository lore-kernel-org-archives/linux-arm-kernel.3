Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FB2BCD5BAF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 05:25:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WN4DrYikmuZNlC6Gk0i+kSIthM58oE/Z6lQ3GB+gflU=; b=1pzMXIeCXK3tN1jHib9XgvN3So
	VHzKD9ZWwlE5Y8wjTQJAaKFehIr0IZ0RQNqFzTomhEFHeiwGBFSnWfOwGB2NAGK9JvzMrk/ZZ4Fer
	QPg9lOGlr3MBrvpY6VfBWKVUKVUElv/COf+SikTl5uU6RgTFW7mrRoO9ULdIFYjNRB1jt35rzHLpf
	2xwKP2HO5Gb/PrbmMPVVEDA5DprSnYv3KIR22eL3G9ikE+0Kl/X/+16WiYhuzI+cCXLslv7nTKsRd
	8wJRj4bZJB3zV0qNOobWv9HEgoQPGHWVZld9CxB4TIykyUZvZ5uFJRqmO42MZQR+l78Trmu++yLUU
	Pmmp0+JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQINn-00000009qVH-32Kz;
	Fri, 22 May 2026 05:25:15 +0000
Received: from mail-eastus2azlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c110::3] helo=BN8PR05CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQINa-00000009qNs-3QWK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 05:25:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KNYuhTMl0dyVl4YQO7KSWSbnWjJKX0u3ANemgSWUR9tfH2B9ZYRKaZfHP+FgkoxCB/pIb4DyKDo2W+PCrPbWnZWZqqD+17LkThTO1bU1px6AMnUAYapBq1QjWYkvDKNlC+56+Z0iTWAdCImkpHDcmMz8Vlo//LEF27FEC6UfJBoHH4THRQTwJrjY2jSfs/bUfqU5AlqiJCvSlXfVP02XY7LN5jLkuKdq0woYJdPJdGOmFXfXSCnRvhFSwNGIDcRnjF7jEJjDAH8gYWCMbt/czTtd1oGTVPuTcksSWSTvXw/bDhHlSKTZQZT6j1XGB74SZFJzPHfOnYX7cmzahm3CFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WN4DrYikmuZNlC6Gk0i+kSIthM58oE/Z6lQ3GB+gflU=;
 b=Mf+MawdgqKaR5O/+JPDwUHUchGccr/5ajbR8is4GHRm4gy9NM0RZwzQJJmQrHFi09vuBFb3QJZZnwRGtERUxkJk2wU64RvczmpG6/xQXIPBNERGrnq67czt5WTctTLcoKxVBh21oQ/QsrU3P/Fh//oXBJy25UQAMqR5TW7o9jSbJ14mfcrBI5j90q5CoNinZnvicb4SJP8eYI9daCh4FD9EAI7FtQUrE+mJzUiQnlddBBLQ5RET/3rOYVuNl0S4+G7YCRbsCri5UZLR7eCCkKNg9ytoiJqNPp7XxRsKclEwNeBbWHKXo7tOPmSm7/tTqxSuKu/NPURiJn8yPlvfdYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WN4DrYikmuZNlC6Gk0i+kSIthM58oE/Z6lQ3GB+gflU=;
 b=aLpHA9GZi07ix1mhiXG2CBjO+68RiX8IzRgK6DGPq76dRjF8KW8RJkERznRnlm5K2LafhLrwcFu+zCVFFrdX5XIzjBfPqVi37xpRj8iqHgtuMNYU5pQNDUFo3jTDLsOYAfycCcbewbdcyeT/dkgPatZC/tibI/ZUgJbSZNym4pE=
Received: from CH0PR03CA0285.namprd03.prod.outlook.com (2603:10b6:610:e6::20)
 by MN2PR10MB4400.namprd10.prod.outlook.com (2603:10b6:208:198::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Fri, 22 May
 2026 05:24:57 +0000
Received: from DS2PEPF00003445.namprd04.prod.outlook.com
 (2603:10b6:610:e6:cafe::91) by CH0PR03CA0285.outlook.office365.com
 (2603:10b6:610:e6::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.17 via Frontend Transport; Fri, 22
 May 2026 05:24:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 DS2PEPF00003445.mail.protection.outlook.com (10.167.17.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.7 via Frontend Transport; Fri, 22 May 2026 05:24:55 +0000
Received: from DFLE207.ent.ti.com (10.64.6.65) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 22 May
 2026 00:24:55 -0500
Received: from DFLE203.ent.ti.com (10.64.6.61) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 22 May
 2026 00:24:55 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Fri, 22 May 2026 00:24:55 -0500
Received: from a0507033-hp.dhcp.ti.com (a0507033-hp.dhcp.ti.com [10.24.68.129])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 64M5OZpY1350956;
	Fri, 22 May 2026 00:24:50 -0500
From: Aksh Garg <a-garg7@ti.com>
To: <linux-pci@vger.kernel.org>, <linux-doc@vger.kernel.org>,
	<mani@kernel.org>, <kwilczynski@kernel.org>, <bhelgaas@google.com>,
	<corbet@lwn.net>, <kishon@kernel.org>, <skhan@linuxfoundation.org>,
	<lukas@wunner.de>, <cassel@kernel.org>, <alistair@alistair23.me>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<s-vadapalli@ti.com>, <danishanwar@ti.com>, <srk@ti.com>, <a-garg7@ti.com>
Subject: [PATCH v4 3/4] PCI: endpoint: Add support for DOE initialization and setup in EPC core
Date: Fri, 22 May 2026 10:54:33 +0530
Message-ID: <20260522052434.802034-4-a-garg7@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260522052434.802034-1-a-garg7@ti.com>
References: <20260522052434.802034-1-a-garg7@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003445:EE_|MN2PR10MB4400:EE_
X-MS-Office365-Filtering-Correlation-Id: 3377759a-ca0f-480d-5e19-08deb7c275c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|82310400026|376014|7416014|1800799024|921020|18002099003|56012099003|22082099003|5023799004|6133799003;
X-Microsoft-Antispam-Message-Info: fp0xe8681MXLvMA7iRaglZr/DmbZPdbjJ+tPbvepdI9cY/PlP1bXTSXGSAX9EZFuXhX6KSUbNH5r8VabLuCzFeCK2NiCl1mLOhIEWJbbrGG7XwGM4QC8noEFjpvpJHEuSFj8UNjquXq4lgjfASDeyS1uUQvC0CS6vqLmyS247iM4OIKmHOm9IuCrN/03IhsJmkPygCVEiXSlv6Bv9HKDAoyr7R1+eWbdQV+QjtJp4/oi4nQ+u5NNssv5FaxfB3x0mAsnJX0MMIOgRaxKc2I2sEmbi0ig93SHVc3BScnDR3i03ENyGEetJspDbj9sqEwicFDdcdW5e8FKihmF8sza87GtYCuXp+ywTLaIz66rJCfLl8gLpBBOC/HvC9qkvOUI1aw30KpENsV0zMVIMLtmDeCkXjGNInK1m1G+tqVTU7rzYbbeYiAFPpwR2WzYhU7GgBrTBYcC622An6coDZf1Epy9L7RMQQpWoRKKORWrhSb+TBckhf0x5XpGNeV8gwFK3Crq4glH6GtoDjz1RBEIDcMdDXPU+w3GLqJJR5dK7Mg/HQAYs8z9h7/0hgCxdd1ulEbXJEqCc03EatgIFVDN4IWMTYm4xh2cwbEGZx0NT0Uc7hgIIP3Jo4xOZnD5rTQIF9OTAR16pP1HouyYUu3m5k0JogaKKBQU4b9oR9+GaDW9UnHCJtQ9tFAd1Ueo9wWlKMoOIozc4GNTujf8VSZbvhU4a3bvR2ZhpdYES1XmIxfSgdn6WEChHIi+ZL/Q3BVqRRAOoCQmfcKUswHCsA4+QOngXWgeAmpFnSUypz3vjlQ=
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(7416014)(1800799024)(921020)(18002099003)(56012099003)(22082099003)(5023799004)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 4FsXalaSOOgwZ/SgT4THSvDq5bQ9U+QAk8JgwMyw/hGd8t70W7lfzAfHTWXOhac1KJf7vFrPLkB2O1JKsH6iFkMsOodD32sRieSiG47Kbtq4opKGVfu87UFCruj6hHUPKECIo55m9kmVuqDFfugd0Fk0LqkAqGoNXNzKSw77f845nuWE8ePgS8RtlXdhUtlB9cG6c4Q7Vel1mH5L17JDQobrWNFiVyVjengMfOAaiQ1MT2dQsWpfQyRib2c47TKWOBOw8vGaH8HnamaZIFMx+qOSp7iCc3Lt29Vyk3TV7Lx8rioKBXjEIAqDz4gwcgwchXlK5N+ZhwOYheBWWilVZhuFDQXexn/0WWU9YKCZVl3YW5PD/OwdZqno/p+7/3++Nh0vaQ3a6AT/6W4h1GcLkQ5Ny4OLzH9PEledJyPTPI0aUXyUlCkury5crXwwAttA
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2026 05:24:55.9477
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3377759a-ca0f-480d-5e19-08deb7c275c3
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF00003445.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4400
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_222502_931529_CD07919E 
X-CRM114-Status: GOOD (  25.57  )
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

Add pci_epc_init_capabilities() in EPC core driver to initialize and
setup the capabilities supported by the EPC driver. This calls
pci_epc_doe_setup() to setup the DOE framework for an endpoint controller,
which discovers the DOE capabilities (extended capability ID 0x2E), and
registers each discovered DOE mailbox for all the functions in the
endpoint controller.

Add pci_epc_deinit_capabilities() in EPC core driver for cleanup of the
resources used by the capabilities of the EPC driver. This calls
pci_ep_doe_destroy() to destroy all DOE mailboxes and free associated
resources.

Co-developed-by: Siddharth Vadapalli <s-vadapalli@ti.com>
Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
Signed-off-by: Aksh Garg <a-garg7@ti.com>
---

Changes from v3 to v4:
- Call DOE setup and destroy APIs directly within the EPC core, instead of
  relying on the EPC drivers to call them individually. EPC drivers do not
  need to explicitly handle DOE setup, rather the EPC core manages this
  transparently. (Suggested by Manivannan Sadhasivam).
- Removed pci_epc_doe_destroy() API, which was just calling pci_ep_doe_destroy().
  Instead, called pci_ep_doe_destroy() directly during cleanup.
- Called pci_ep_doe_init() before the "!epc->ops->find_ext_capability" check,
  because if doe-capable=1 and find_ext_capability() op is undefined, this
  would not initialize the epc->doe_mbs xarray. However during cleanup, the
  check "!epc->ops->find_ext_capability" would be unnecessary, and it will
  try to destroy the epc->doe_mbs xarray even when it was not initialized.

Changes from v2 to v3:
- Rebased on 7.1-rc1.

Changes since v1:
- New patch added to v2 (not present in v1)

v3: https://lore.kernel.org/all/20260427051725.223704-4-a-garg7@ti.com/
v2: https://lore.kernel.org/all/20260401073022.215805-4-a-garg7@ti.com/

This patch is introduced based on the feedback provided by Manivannan
Sadhasivam at [1].

[1]: https://lore.kernel.org/all/p57x6jleaim5w7t2k3v7tioujnaxuovfpj5euop5ogefvw23se@y5fw3che5p5d/

 drivers/pci/endpoint/pci-epc-core.c | 92 +++++++++++++++++++++++++++++
 include/linux/pci-epc.h             |  6 ++
 2 files changed, 98 insertions(+)

diff --git a/drivers/pci/endpoint/pci-epc-core.c b/drivers/pci/endpoint/pci-epc-core.c
index 6c3c58185fc5..af7889b541c0 100644
--- a/drivers/pci/endpoint/pci-epc-core.c
+++ b/drivers/pci/endpoint/pci-epc-core.c
@@ -14,6 +14,8 @@
 #include <linux/pci-epf.h>
 #include <linux/pci-ep-cfs.h>
 
+#include "../pci.h"
+
 static const struct class pci_epc_class = {
 	.name = "pci_epc",
 };
@@ -842,6 +844,71 @@ void pci_epc_linkdown(struct pci_epc *epc)
 }
 EXPORT_SYMBOL_GPL(pci_epc_linkdown);
 
+/**
+ * pci_epc_doe_setup() - Discover and setup DOE mailboxes for all functions
+ * @epc: the EPC device on which DOE mailboxes has to be setup
+ *
+ * Discover DOE (Data Object Exchange) capabilities for all physical functions
+ * in the endpoint controller and register DOE mailboxes.
+ *
+ * Returns: 0 on success, -errno on failure
+ */
+static int pci_epc_doe_setup(struct pci_epc *epc)
+{
+	u16 cap_offset = 0;
+	u8 func_no;
+	int ret;
+
+	if (!epc->ops || !epc->ops->find_ext_capability)
+		return -EINVAL;
+
+	/* Discover DOE capabilities for all functions */
+	for (func_no = 0; func_no < epc->max_functions; func_no++) {
+		while ((cap_offset = epc->ops->find_ext_capability(epc, func_no, 0,
+								   cap_offset,
+								   PCI_EXT_CAP_ID_DOE))) {
+			/* Register this DOE mailbox */
+			ret = pci_ep_doe_add_mailbox(epc, func_no, cap_offset);
+			if (ret) {
+				dev_warn(&epc->dev,
+					 "[pf%d:offset %x] failed to add DOE mailbox\n",
+					 func_no, cap_offset);
+			}
+		}
+	}
+
+	dev_dbg(&epc->dev, "DOE mailboxes setup complete\n");
+	return 0;
+}
+
+/**
+ * pci_epc_init_capabilities() - Initialize EPC capabilities
+ * @epc: the EPC device whose capabilities need to be initialized
+ *
+ * Invoke to initialize capabilities supported by the EPC device.
+ */
+static void pci_epc_init_capabilities(struct pci_epc *epc)
+{
+	const struct pci_epc_features *epc_features;
+	int ret;
+
+	epc_features = pci_epc_get_features(epc, 0, 0);
+	if (!epc_features)
+		return;
+
+	if (IS_ENABLED(CONFIG_PCI_ENDPOINT_DOE) && epc_features->doe_capable) {
+		ret = pci_ep_doe_init(epc);
+		if (ret) {
+			dev_warn(&epc->dev, "DOE initialization failed: %d\n", ret);
+			return;
+		}
+
+		ret = pci_epc_doe_setup(epc);
+		if (ret)
+			dev_warn(&epc->dev, "DOE setup failed: %d\n", ret);
+	}
+}
+
 /**
  * pci_epc_init_notify() - Notify the EPF device that EPC device initialization
  *                         is completed.
@@ -857,6 +924,8 @@ void pci_epc_init_notify(struct pci_epc *epc)
 	if (IS_ERR_OR_NULL(epc))
 		return;
 
+	pci_epc_init_capabilities(epc);
+
 	mutex_lock(&epc->list_lock);
 	list_for_each_entry(epf, &epc->pci_epf, list) {
 		mutex_lock(&epf->lock);
@@ -890,6 +959,27 @@ void pci_epc_notify_pending_init(struct pci_epc *epc, struct pci_epf *epf)
 }
 EXPORT_SYMBOL_GPL(pci_epc_notify_pending_init);
 
+/**
+ * pci_epc_deinit_capabilities() - Cleanup EPC capabilities
+ * @epc: the EPC device whose capabilities need to be cleaned up
+ *
+ * Invoke to cleanup capabilities supported by the EPC device,
+ * and free the associated resources.
+ */
+static void pci_epc_deinit_capabilities(struct pci_epc *epc)
+{
+	const struct pci_epc_features *epc_features;
+
+	epc_features = pci_epc_get_features(epc, 0, 0);
+	if (!epc_features)
+		return;
+
+	if (IS_ENABLED(CONFIG_PCI_ENDPOINT_DOE) && epc_features->doe_capable) {
+		pci_ep_doe_destroy(epc);
+		dev_dbg(&epc->dev, "DOE mailboxes destroyed\n");
+	}
+}
+
 /**
  * pci_epc_deinit_notify() - Notify the EPF device about EPC deinitialization
  * @epc: the EPC device whose deinitialization is completed
@@ -903,6 +993,8 @@ void pci_epc_deinit_notify(struct pci_epc *epc)
 	if (IS_ERR_OR_NULL(epc))
 		return;
 
+	pci_epc_deinit_capabilities(epc);
+
 	mutex_lock(&epc->list_lock);
 	list_for_each_entry(epf, &epc->pci_epf, list) {
 		mutex_lock(&epf->lock);
diff --git a/include/linux/pci-epc.h b/include/linux/pci-epc.h
index dd26294c8175..11474e337db3 100644
--- a/include/linux/pci-epc.h
+++ b/include/linux/pci-epc.h
@@ -84,6 +84,8 @@ struct pci_epc_map {
  * @start: ops to start the PCI link
  * @stop: ops to stop the PCI link
  * @get_features: ops to get the features supported by the EPC
+ * @find_ext_capability: ops to find extended capability offset for a function
+ *			 in endpoint controller
  * @owner: the module owner containing the ops
  */
 struct pci_epc_ops {
@@ -115,6 +117,8 @@ struct pci_epc_ops {
 	void	(*stop)(struct pci_epc *epc);
 	const struct pci_epc_features* (*get_features)(struct pci_epc *epc,
 						       u8 func_no, u8 vfunc_no);
+	u16	(*find_ext_capability)(struct pci_epc *epc, u8 func_no,
+				       u8 vfunc_no, u16 start, u8 cap);
 	struct module *owner;
 };
 
@@ -270,6 +274,7 @@ struct pci_epc_bar_desc {
  * @msi_capable: indicate if the endpoint function has MSI capability
  * @msix_capable: indicate if the endpoint function has MSI-X capability
  * @intx_capable: indicate if the endpoint can raise INTx interrupts
+ * @doe_capable: indicate if the endpoint function has DOE capability
  * @bar: array specifying the hardware description for each BAR
  * @align: alignment size required for BAR buffer allocation
  */
@@ -280,6 +285,7 @@ struct pci_epc_features {
 	unsigned int	msi_capable : 1;
 	unsigned int	msix_capable : 1;
 	unsigned int	intx_capable : 1;
+	unsigned int	doe_capable : 1;
 	struct	pci_epc_bar_desc bar[PCI_STD_NUM_BARS];
 	size_t	align;
 };
-- 
2.34.1


