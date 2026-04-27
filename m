Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DE1EFF8860
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 05:18:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DTMNjOPVTi0X49a5yAsXYHT4jx4G0soPi8Tzw5XdXOY=; b=dutVWHYNuOcPImxj7CQsTDHt1O
	LnJYMm4uVbvX2K+G/K3eZK43v9r69T87x1WGs29QNQp+gI8i4gYGH1w3KDpQdyzVjcP86/jBGAuY8
	kPAmDnoPfo+d22Ogq1y9Dyq9bya57j1yrEuAZrY63LG/rpgySQ0o2Oe8hVwFeJpZzJq1auHDOBZq7
	b8VI1RdM0mGpGnPeMiu8HOWqymwNBqW+DrYYgMamp0Z72QZp4qaXYAFMIRcRVaTOH1U4fCQZ9fAKm
	kJaE0faP1zhHL060Qqvyjo+MhCAlTGLJSWKsofpuLmdQQzVzqHUTcRWu89NtgN6eDjPWMEpWzxing
	WlQIm3Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHELr-0000000GARd-3KSg;
	Mon, 27 Apr 2026 05:17:47 +0000
Received: from mail-southcentralusazon11012050.outbound.protection.outlook.com ([40.93.195.50] helo=SN4PR2101CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHELo-0000000GAQx-1SR0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 05:17:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L9noDiXgzXdchEBEtH/w3Yh3wqzKogc0W38iVvQyDyeMkUP2zNgGc9H2zK7Mw6NhbWBp0qn5bagk28tNKP1z5ygIh1MYhhCRBlsLbSBCU5LnY1Ai0sd3iQf3Ns5/BkYR4NTDWOVmSs8C/OBFpyUGAckoajLVuNX/j8+Fbftz1ZNkV2x4t9w6QxED3Ya+hVPxbedmh0suJaZoSt521Xq3XLC1tcaHUi9GH2G5ugZ3JEg3S5y+uyA0yUmjRg9zCeTbuviwG2ejrzsYLsAHviKJDsZXZDWC49s6Re9O2U/rjPiME3sI2A2uFv/3e8xh7O1ArHFEWwFDObNVgxgd6EQoZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DTMNjOPVTi0X49a5yAsXYHT4jx4G0soPi8Tzw5XdXOY=;
 b=smhz24l04u5tzkwWcXainn1xHonvGZsG5onzNF1k1W/cy7hhfmKNftjxcwdgYymQVXniapEA9eZnkwTJf803r1nc9sXTzCKWlGGUi+jJly7VvyvqneT8qLx8PIaAiAeh9qa8W5RMoJM+zW0KalqDPLeOI/YYHJSPc6UaBRABpBYdwGQzom0XRlUfiHVGJBgv1NmzKChpl89W2G2j1QzyelDVB7BCXaeAMpouqDgRm/fE4CnxMlXtSBGcGgIMpNsfvOTAS+4ZSh3gCnNmQ0O+a1GEdxAUemRv9JcH2CYFR9RGdwPFVlDW2gN06SUAmfgcD4PH/2b11Tew8oyjnqqJ0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DTMNjOPVTi0X49a5yAsXYHT4jx4G0soPi8Tzw5XdXOY=;
 b=a5+tcBxPAI5gwfO+4J7bez48/0FeJxolHxPT5vEcaSr1PLv8jOZQc9dJAR9q4MwGkOKa4FVV7NhA6bzZEBLfcDu4N6gmmBp9Wh+WO37fqo66LAI6AH5EBeRiQFifL4mZLrssP9dKd2eiKI/x0xYiTxijNuw+8e7YaoDkmnKTZ4A=
Received: from BLAPR03CA0001.namprd03.prod.outlook.com (2603:10b6:208:32b::6)
 by DM4PR10MB7451.namprd10.prod.outlook.com (2603:10b6:8:18e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Mon, 27 Apr
 2026 05:17:37 +0000
Received: from BL6PEPF0001AB59.namprd02.prod.outlook.com
 (2603:10b6:208:32b:cafe::eb) by BLAPR03CA0001.outlook.office365.com
 (2603:10b6:208:32b::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.26 via Frontend Transport; Mon,
 27 Apr 2026 05:17:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BL6PEPF0001AB59.mail.protection.outlook.com (10.167.241.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Mon, 27 Apr 2026 05:17:37 +0000
Received: from DLEE208.ent.ti.com (157.170.170.97) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 27 Apr
 2026 00:17:36 -0500
Received: from DLEE207.ent.ti.com (157.170.170.95) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 27 Apr
 2026 00:17:36 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 27 Apr 2026 00:17:36 -0500
Received: from a0507033-hp.dhcp.ti.com (a0507033-hp.dhcp.ti.com [10.24.68.129])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 63R5HQUo2543740;
	Mon, 27 Apr 2026 00:17:32 -0500
From: Aksh Garg <a-garg7@ti.com>
To: <linux-pci@vger.kernel.org>, <linux-doc@vger.kernel.org>,
	<mani@kernel.org>, <kwilczynski@kernel.org>, <bhelgaas@google.com>,
	<corbet@lwn.net>, <kishon@kernel.org>, <skhan@linuxfoundation.org>,
	<lukas@wunner.de>, <cassel@kernel.org>, <alistair@alistair23.me>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<s-vadapalli@ti.com>, <danishanwar@ti.com>, <srk@ti.com>, <a-garg7@ti.com>
Subject: [PATCH v3 1/4] PCI/DOE: Move common definitions to the header file
Date: Mon, 27 Apr 2026 10:47:22 +0530
Message-ID: <20260427051725.223704-2-a-garg7@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260427051725.223704-1-a-garg7@ti.com>
References: <20260427051725.223704-1-a-garg7@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB59:EE_|DM4PR10MB7451:EE_
X-MS-Office365-Filtering-Correlation-Id: d71eee4e-fb87-469c-1dbd-08dea41c4c05
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|7416014|376014|36860700016|921020|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: idmqcuxh3wxiFtGgnWSR7zs1rRN7v8ENQfbhR/XAccaSlKEbkA14WBvsw2UgAvUMvj0T17TO4ndVBi2l1fUJnutPAobexokwJtm9gwbVii0fmaF4jMTjVb7/JgUWkViUZViMmgKurAnZDwHIywI+901r8Tt6naEUe7jDc/3El7SccZ2ApiF0yLdp3JUJo9DPhTVkC85qnw+rPbmAAr6s0USsd1KdJsAmL0YpZDFRE7JtpV39xwQrsMiO03xsOptmtyJdLSDlcPbtDnXuykTa+XER+6gdZttI4QoHZ3E1YbzHEFMxB0D9OAmLSiHk/EFKnZFSN+qVa8NVq5iHIGazBttddOpmOfzJp79ksRX6/0J83Z20AX/k38OkTTb4dIxUsjB4S9qkZKZwCX88NHE5980qOswa+Kto0lecgRk2Bg/3UwhBBgFvfrEIpn+5xwxzYEcRqedGLZVl7JvtscXIVpFU7R1LR2yrnC0Er36vrOO5pOunk05hiCsCCvZk8CGyzXeF+vnT3qa/6x2HE/HDRYn1fMkYxnlj6u0gKYF4CSks5P97HSmR1vWgHYnisDmwmOHxMtSDCDIG4Dqf4LBSHYIdoMD0B8XgRwPbdWocSkem39w1GJhT3fx/QqnTwelvqEK401Z00iF/a8F8OOx6UIuF+BOH+Ghja3yb6TYw11GkT+VVLOWhXb83owFj6rm4FStLwJAKtt5J2mLridHm5tPYh9XG5ztxhxApa2hLBtPzhyDOiuJhK1SdrZPEhouGzZqrpMCVzs63V4wLlx/4qKaPqKrj2+BGUHwW0ZglLeO0T761x3sE+go4eAEES97q2Qs/iECbAvTVMuX73GZFUg==
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(7416014)(376014)(36860700016)(921020)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: dvCfMHhi32JB0EfjnrQ2RLLWOJCtREbULRJ4jkjWS5pWA9v+R2SsRMqPzAINOdQCvbC2KHX6VPnp290IeJ2u6aN3hlNQAr8Tz61Lk0EFL9+SxnqbA8Gz0uXtrzvozfcK887svPkNrPpoMTBpuqSNCnNJyYtIVXYFvXoaiqZAV6+pIN+LBlnpl6GwA0xIyXA/lSp0Ncr+SpkdKB94O0mSpE4HzQB4oDWN0lap79C/AIZwiyVMrMvBe+Yn3eBHfQKYb6U/LwB6jbE7c2fiOgjifQ9Zq3cx4f7CxHXhSUQ9pyQMPKx0YZgdRls/dvNCQWvT6NHl0/8dx+DlI91QNvW34vkuep0HcUpXnAN/Dbm9TAtIjZYJmE7OKx89Dhdofilf5Y6PyzJIlRrYg+PuRG+8qaVRq6Oh6MZDtOQ5naCR2hjlbky2tYIk5SnyXpONKFnb
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2026 05:17:37.3434
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d71eee4e-fb87-469c-1dbd-08dea41c4c05
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB59.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB7451
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260426_221744_412851_68255B84 
X-CRM114-Status: GOOD (  12.41  )
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

Changes from v2 to v3:
- Rebased on 7.1-rc1.

Changes since v1:
- Moved the common macros that need not be visible outside the PCI core
  to drivers/pci/pci.h instead to include/linux/pci-doe.h as suggested
  by Lukas Wunner
- Removed the redundant empty inlines guarded with CONFIG_PCI_DOE in
  include/linux/pci-doe.h.

v2: https://lore.kernel.org/all/20260401073022.215805-2-a-garg7@ti.com/
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
index 4a14f88e543a..5844deee2b5f 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -683,6 +683,15 @@ struct pci_sriov {
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


