Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB06ACD8CB9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 10:03:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bXjBRF3IpCj050d4KGBOgybCSQk3YZZ/9cX3bkt8pCc=; b=LZGKBaN8Y0sm4SV9vHreKqH0WK
	O4Kd6Q7JaaDz7SVyXNq5MNpRjVm4EyUV19AkahmZm068wTbYN3SkCUn59abSrS+fzhHXFWoNUfymp
	2M0+86RImjIxgadAlB9irMZQHsgpqFo7ABth/LZA43ClRIFgipKPRcB6D2+iijeZBGO8I+9htgwyJ
	TcBNKccis8c56SOt/RwgFtwlLL7tJHD7U88leM1o4n9CB49L7Pf6vXMWrXFi9nGbyzfWzNzGSWTFP
	Gmk6Tlz3vvvPr3z1UCDo41zZPjDX+11qH1frKR9wUS3HpYFW+GtYTqy3q5V1iN7/S7xUsSjb71YZ5
	aApNFxhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXFmb-00000007L8U-2izE;
	Wed, 10 Jun 2026 10:03:37 +0000
Received: from mail-eastus2azlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c110::1] helo=BN1PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXFmZ-00000007L7R-0mna
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 10:03:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M5dUBr6au6FcDRhc4UhqzmTqySzQ7juqo/0U6rBgKUDUK3G04sJpiV6shitpMVcwHK6SQNX5Jhd0FOGuMN8/sYX8W0/wY5HqJlSEWtpKuEe9nj2JCJClBnl+OwY6oWGhL/pVtQK24NcZdZEkFVPu67wg1BCNEeu/wUGwjwAEyZYEJkzg543ZQkHnQ5swjMp6sQQ0AbwZUpOBoDJsp+xCBb/O4R/1/hn7eX5FpXZDzGS3SEeuuqi/WMeclisWyDuFwzbhZthGbdn6vgFu4SO0noEnvq0SKOm+bI8NmGx6r/tLVIKuR5DNsVV/tbDO5yHMAfYvVai7uZrZdSEJbCCOUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bXjBRF3IpCj050d4KGBOgybCSQk3YZZ/9cX3bkt8pCc=;
 b=opkd63SsJpEwOCy7ceCwcsM6jcX3rzMGG92t0GnE8JLmUeXEjDObHv3lIBGZDxLG2f55D9fODLQNCzAoW/z4t4zffQJgV9eslbyiG/M+PrQYUlJAvwL8mdk49y8jT4+jPHeofuoz/GcNh9tUby6m/T2TM1dD59iK9IQ6T0QK/uOZ9gfBn/EIOaLd9eEYw0gZkDp+cxXO2TTBeRrjcHmJ9/7vUD8HQS/f4R/PgCLQFF+aL04brZrdH9Ap4qqvqXO3e3gw6A86RABRMi+/lr7HmMNvDJ3tCWkCZT5DVb4rMf36/YRv0XknGI3iKqqLVR4N72Um3prKneXkzIBzdrmiWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bXjBRF3IpCj050d4KGBOgybCSQk3YZZ/9cX3bkt8pCc=;
 b=fWXCuAsoHsoaqvlE59X77XJfOdionN1dqVwgXrMjKy1lxrrn8bZYMRqPciaTgUs0gwcr83TAaUP7Pq7DlQlhN1vsrmdAe5Uwo7e6Ezv8Y0dGZcSA5cNtaS42MBjxMsIyVS2O6em4vAIkfXS0ejnYKcQ/Le8tvilugRFBJSO7sZU=
Received: from BY5PR04CA0001.namprd04.prod.outlook.com (2603:10b6:a03:1d0::11)
 by DM6PR10MB4219.namprd10.prod.outlook.com (2603:10b6:5:216::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.23; Wed, 10 Jun
 2026 10:03:32 +0000
Received: from CO1PEPF00012E5F.namprd05.prod.outlook.com
 (2603:10b6:a03:1d0:cafe::77) by BY5PR04CA0001.outlook.office365.com
 (2603:10b6:a03:1d0::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.11 via Frontend Transport; Wed,
 10 Jun 2026 10:03:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CO1PEPF00012E5F.mail.protection.outlook.com (10.167.249.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Wed, 10 Jun 2026 10:03:30 +0000
Received: from DFLE202.ent.ti.com (10.64.6.60) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 10 Jun
 2026 05:03:07 -0500
Received: from DFLE207.ent.ti.com (10.64.6.65) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 10 Jun
 2026 05:03:06 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 10 Jun 2026 05:03:06 -0500
Received: from a0507033-hp.dhcp.ti.com (a0507033-hp.dhcp.ti.com [10.24.68.129])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 65AA2u8v3620198;
	Wed, 10 Jun 2026 05:03:02 -0500
From: Aksh Garg <a-garg7@ti.com>
To: <linux-pci@vger.kernel.org>, <linux-doc@vger.kernel.org>,
	<mani@kernel.org>, <kwilczynski@kernel.org>, <bhelgaas@google.com>,
	<corbet@lwn.net>, <kishon@kernel.org>, <skhan@linuxfoundation.org>,
	<lukas@wunner.de>, <cassel@kernel.org>, <alistair@alistair23.me>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<s-vadapalli@ti.com>, <danishanwar@ti.com>, <srk@ti.com>, <a-garg7@ti.com>
Subject: [PATCH v5 1/4] PCI/DOE: Move common definitions to the header file
Date: Wed, 10 Jun 2026 15:32:53 +0530
Message-ID: <20260610100256.1889111-2-a-garg7@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260610100256.1889111-1-a-garg7@ti.com>
References: <20260610100256.1889111-1-a-garg7@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E5F:EE_|DM6PR10MB4219:EE_
X-MS-Office365-Filtering-Correlation-Id: 887bc934-585f-4f33-319d-08dec6d7862f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|82310400026|1800799024|36860700016|7416014|376014|18002099003|22082099003|921020|56012099006;
X-Microsoft-Antispam-Message-Info: 8aohYqsYJK5+KZQLezcj/VbPpcVr/Ci4YK5qeH2cPF5lXXHcfd/neMQfauyu1PBhCwChoM68vd92WXZExBnax8jahCEl56ZY1kQYQT6CviDSp+yfS7VYSG83Vzu+48QTtJAVx5PlHrrSmDqPWY+InRyAIhmJkgKAYqblaF0QUDH44FcSYI2b9G/H8gSn69lWZhO0dtuSrmiUndfhjwB16U3em+T02TRYIPiqCHNaOuWG8M5E1UlFc7iKgdk3oZQheI/VL9QekoBZUa9MA2dlRgu6Z+cino7apPPIG121ED4e6eDo/iuUzjlocjdeQ2JtMNRlli8hikLOy+iBczypAoBEtPcemhbOXtj/dqwL7s9L8um1w/VerY+J9li7NlKjyjtIlBd/sQFeQ9LXuwdSLyMxlKUSo1nXe2zkvBQ93ooYZ64xvDHOAeRRqOKNb53g+hunvZrytdSIuBhS4gode5gN0lm8yDs9751demtPa1V5FkU8gwitnVve6B73f2SbgzjTMGcM2GKaVVjPjUfDa5nL27QMLyTvgvke7dNZTyKgxl6dtfI3i0jDyYmbXeRKhaJXa1E4Nk7WnvXSZX1Tik8qov611cHXj4oK5vMY78DgahRU3igh5fMptuINDMUc6XFTZq/h8q5MHk3irmBO+dZiSzdnI4yuJe137cv1qp84IsKK1UU7zjsKdvKLU+PQG40VDX/B/Z+D2XRzydhjHWW+n6m63vkJSw5ioCXDJ4fFU1NFQ+cBZ2h+eGRmPWGLnn19FWdjiYaR1PoPRIwWHfopGUPH4ttzLbht+0a1LCI=
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(1800799024)(36860700016)(7416014)(376014)(18002099003)(22082099003)(921020)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: SIj89zQaBzjnGg9phwiKSr1szUATMa0EC8nGPB5qwvNJvG3pbCbMqxjWRZlqE67QizyiGgSKuwyYYVYySfjvPECno4W9V6DXn04H1tSGFwF73+jBJdJZ5J17A+2YMZr85+D7CpUCYHfMtl/DZnyZRWzsEMkiyygw//yjZiOhdg84AjQORkaY6/9VcgUzLqu0SOkTO0iBvGhfbwdr14eieci/gHkKBGIB/zS2Ug7xfsb5GWIoMymthZ+aun755/4HQnz+QDVPC78LgKhjYeqawfDCImX/B3cPEYIiodGqVm0ymqHNnPpLhscM6fieST1CHQoFilzNJe6xpqXtOsIncVUOn7bC6MwMZj1pV4lEd0vYfVh2fOKd9+7JeevAFZzXd7YJrxtq6h+a2O24Sp9jvH/C8eYJxU0wHLTOnbNa5txlk6ZTL3dd7yS486MxUy/q
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 10:03:30.3424
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 887bc934-585f-4f33-319d-08dec6d7862f
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF00012E5F.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB4219
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_030335_232184_76E13C20 
X-CRM114-Status: GOOD (  12.73  )
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

Changes from v4 to v5:
- None.

Changes from v3 to v4:
- None.

Changes from v2 to v3:
- Rebased on 7.1-rc1.

Changes since v1:
- Moved the common macros that need not be visible outside the PCI core
  to drivers/pci/pci.h instead to include/linux/pci-doe.h as suggested
  by Lukas Wunner
- Removed the redundant empty inlines guarded with CONFIG_PCI_DOE in
  include/linux/pci-doe.h.

v4: https://lore.kernel.org/all/20260522052434.802034-2-a-garg7@ti.com/
v3: https://lore.kernel.org/all/20260427051725.223704-2-a-garg7@ti.com/
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


