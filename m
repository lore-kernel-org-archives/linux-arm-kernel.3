Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDB5CEDF158
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Feb 2026 12:36:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jh+mfC1wvKkKTWubSh2Q8+CqecpPrVQExyBW5vZyxzY=; b=2MG2i0KxkeaNGXtEbrh8CWK/B9
	wFfBSBLfOxfmwV+eNnEmrUpzCFRVWsJEPi+7+ZOcOr/+I5LuvIFPfCItDcd85JnvnzL/KA0aOPeQH
	d7Pa/JlcMSuz3aGRCVgCaPcFeeIXseqhMHoIoIxYxQ0Xwg6X30endc37jWsppZDx15D6O9OGBVPgr
	/Bs3TAZiuQ0zDqYSIPvA8QeTkcDvIm7WR6sAVlFpnEqE10umWA3pChS8GZvIQh13feYoxD8JtMx80
	7M/psl8mz3haQFtBZfdKccKuTlxuxaPiV/kh4EoiBDcPcUcZVYRoV95NNdzxmIolRGRGcxafYctgt
	5sgdAbXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqsPL-00000003RyN-0h0c;
	Fri, 13 Feb 2026 12:36:27 +0000
Received: from mail-westusazon11010060.outbound.protection.outlook.com ([52.101.85.60] helo=BYAPR05CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqsPI-00000003RxI-36Xp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Feb 2026 12:36:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PXyixvVZF2t3sTHLKHxxC9q8Ht2xC1tADSnijDr6FPgLBwlGHwSqXGb17yOSQ8qNsRcUFPCq7moGEaDACfqnvErpHly4XWXDeSSpd9///OIcL4dXF4htLf55rkGrpucRmyGMLmX1Oa/IBcxHqwO4qtiGgrUbEA3NjHEwUddCOyQfZT0st+Ygy2E4RvrP9ZrpNcfLq2OZ4cIMGC9txnv8wBHMb+Y/KeO2GuK/gTw/yJ/PrgmhZnEAahFCOBRrGO5N5IBqmq/NwvAyPEJnD693/wsyywP+gao2vRWdSPC399FHb6G19j2Pj0PriFWNkXQ/j5IdSrqWdlNOkzjtZcE7nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jh+mfC1wvKkKTWubSh2Q8+CqecpPrVQExyBW5vZyxzY=;
 b=sRJRpMv2d9c9MBOKH1Rvsg1/mnfT7Wcq+VizDOeyjz4xUiU8gO+FMZtZpwu7SKbYaQqsOg0Vt8VL7DAiAhhfdozA8PjFuu9XwK7LkeJGLaCbmM5EMbE7FE5jwXrno2lYane+0uGF/rpuobfVDfmp4CeMWdurvvc2VercDomHa1pEsCXU22xCsgJgaLmJGMae2F1Fq0/RDsJ9x66mf8Ue1UvVKjwp+MlP1Hsi3C8F98VgmE4AX+MMj4cI0U/DsrhltPfu23bqp+8Chd38EUYZ40COXOtGUUAP7CC03AiwyitocD4vJHAzxF0vwopzlZ7zB+XpMrImWlBnmBzqZBqi0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jh+mfC1wvKkKTWubSh2Q8+CqecpPrVQExyBW5vZyxzY=;
 b=pr2qWklGIgikfjfW0X22NLOcgOv11cPgIfv9QYVkRamgrR8o4gyqVML4wcm1rIr1c2vCyd6UeLKUCn7LUWdhk1dw8JIqVufvzck8VoM34ToUDvujdnXe42l6+fZb//IvaXhSzM2iXSBsau2Xj1DHd+Fl9ImvshSKtgfyQMB6/yw=
Received: from SJ0PR03CA0359.namprd03.prod.outlook.com (2603:10b6:a03:39c::34)
 by CH3PR10MB6739.namprd10.prod.outlook.com (2603:10b6:610:147::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.14; Fri, 13 Feb
 2026 12:36:20 +0000
Received: from SJ1PEPF00001CE4.namprd03.prod.outlook.com
 (2603:10b6:a03:39c:cafe::e3) by SJ0PR03CA0359.outlook.office365.com
 (2603:10b6:a03:39c::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.11 via Frontend Transport; Fri,
 13 Feb 2026 12:36:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ1PEPF00001CE4.mail.protection.outlook.com (10.167.242.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.8 via Frontend Transport; Fri, 13 Feb 2026 12:36:19 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 13 Feb
 2026 06:36:17 -0600
Received: from DLEE208.ent.ti.com (157.170.170.97) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 13 Feb
 2026 06:36:16 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 13 Feb 2026 06:36:16 -0600
Received: from a0507033-hp.dhcp.ti.com (a0507033-hp.dhcp.ti.com [172.24.231.225])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61DCa6A8751418;
	Fri, 13 Feb 2026 06:36:13 -0600
From: Aksh Garg <a-garg7@ti.com>
To: <linux-pci@vger.kernel.org>, <linux-doc@vger.kernel.org>,
	<bhelgaas@google.com>, <corbet@lwn.net>, <cassel@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<s-vadapalli@ti.com>, <danishanwar@ti.com>, <srk@ti.com>, <a-garg7@ti.com>
Subject: [RFC PATCH 2/4] PCI/DOE: Move common definitions to the header file
Date: Fri, 13 Feb 2026 18:06:01 +0530
Message-ID: <20260213123603.420941-3-a-garg7@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260213123603.420941-1-a-garg7@ti.com>
References: <20260213123603.420941-1-a-garg7@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE4:EE_|CH3PR10MB6739:EE_
X-MS-Office365-Filtering-Correlation-Id: e8514f98-8c1a-4bd9-0aa7-08de6afc7d48
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?CJ94M+g6C0pGgKStZz6ACTUtpEoQO1ra6iWvcVvKg0NEZZjISW9AuAq3+5YD?=
 =?us-ascii?Q?iX23bNJ/iheAvtyg812e9765/pIBcezgjDHUmnBb+Q2SMknZd3Hvtt/NSVDC?=
 =?us-ascii?Q?XkFJMNb6sM91qxWYQ0/WwYbyLJwvYexuLhlnIgtfzZilpCXvUMDYz4z9LsRH?=
 =?us-ascii?Q?DRvcZ61bMoasMpmA0KtIIGCBspG+IJSIJ+g98ma2i3IEEDlxqy8V+KSnkqtn?=
 =?us-ascii?Q?p4YfWLToss7UOhfNWDWPWh5UnJMJl0LMSFEAih22cMd3CKHdEr584fSSmH6C?=
 =?us-ascii?Q?AYxJ6nGLAl1kqf2LrljJ8kN0dsqf4c+W6qxs6dtJymaaVYPShGOE/Ybiegs6?=
 =?us-ascii?Q?yLfRgUNJcV8U0JSiklVPONz4TlYT2azgS15RuSzGSyLz1ZUXZ3YtkpfIYhlP?=
 =?us-ascii?Q?Tg9kJTVj+HhoxLNYTQwVxKwOr3UnYHT9JOEJqSUm2gNBN+MN/yvgZe9s1m0L?=
 =?us-ascii?Q?YH3HtGzDAiGpzNcyQXY54U1KDd5u2h5lvWPtuTSTm62mGfg1STp5XArgllim?=
 =?us-ascii?Q?Hd9Lb556vOoiFWqTTdcgNetW5QlyYygY3sYrzqF1fCzLLxu2Tvo/hvKBEkkx?=
 =?us-ascii?Q?Q5tAWYtAXusJIZsBNDubK+X9ouXny+2xaS0BMbMGOdEpuuY5TpjZ4d9DzNoX?=
 =?us-ascii?Q?bm4lolGFY51t0AtvYcPJuCCkpA72VTQKGHmfiYKMzX3xAbb4Q1RlkVN8utz5?=
 =?us-ascii?Q?NYS/ZzpgFA8TP5grR3qWeHcW02fQyXg53kgjdBjcAZ3yVoeYFtW7yrAoEoRX?=
 =?us-ascii?Q?mXcjGNnuEWsKOGgIbUtA/eKwtgPeQKug/yzByYx0i+rQZbn1Ea5dAOUBDyAj?=
 =?us-ascii?Q?yzkgKlSC1ZExY46m6+PGl6k7uCtXtpRtRF9BtLCNdWAXPf8akLCYUHoGzOoS?=
 =?us-ascii?Q?cC35UEB5n8CZ2JJGfMCUXEywXRsLreMhSVFjLlY+AFCjreHhYh3qQI5Wab6u?=
 =?us-ascii?Q?MFfko6syN+yWJsBa7BuyiZJDHbCkP/2SsJRATjeWYSd/JBDqCorhLn2mxQCK?=
 =?us-ascii?Q?m/y1L5LzUa8W3z7WmhEasIWOLqZnFe4JYjMCQKMoAgX2umWI/e1A/zf4fv/O?=
 =?us-ascii?Q?IFBc/obAbxBFbxE9ENXJ4Mz+9fyPoszmID0aPtGaKiF9iekOfW7b0B1C13By?=
 =?us-ascii?Q?S2wTb5d/peBko/avnsVqjgDjf/1aOb8Su4uxfucIAfNomNJHG+eAYTLdmmxm?=
 =?us-ascii?Q?PwE4uA9dFfo2vfFtmK6hkpiRH/WfXV4xSwZiGqQCaLGPY9vwuMOdsgqrAms+?=
 =?us-ascii?Q?ij5Ib+vYnlISi68OQ/7h+IfKZqKpZIYR+oqwMprhqX5mljoptbFwSPT9hrEb?=
 =?us-ascii?Q?TSXC+9kBXgMDra3sUrxlaCOe2VCnbJvYm8OpJY/mrnP4tDc1WLfcEGJDOKfn?=
 =?us-ascii?Q?g4KomKrNti0X3hSU90dUnWP+SY+RkvefI+vEJZ7WmarSB+PCewWQmEmBpyQg?=
 =?us-ascii?Q?f/qwedrz9urbF418g0tlJvmkyV6bCBlIp0RQUDF1Gp4zcPO00S/NplwnewPs?=
 =?us-ascii?Q?8yP1nfVjSvLqS71ePGt9kPUyWK7ikOafHmzZPyuAHZjXtcGpJ7e0WH2RVXe3?=
 =?us-ascii?Q?0A4gaBiJnxkcQ5m0kRh8zelgrbzVjKnwcmyE41PjXzulP5Tw9suUq1MWhM0g?=
 =?us-ascii?Q?PiFz7cp+BKfoZZ6WJnaUybBxgoxjqFdXuesiiHXmeH3u1koSjjMGSMIv51YS?=
 =?us-ascii?Q?rOovFw=3D=3D?=
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: he0cH4+sm+36IRSPJUGXsTLGX7cJxKueaNP0BtFrlltH9kE+Y87IZP4oMKwUuj5TL0+u6fD/SG5Xp1P2USjVqC8d0OMAfpVAxPKbYzSLVUOXnmSsVD0niMqLv5vSZS6i8F0xg3VFDM+Vit32+kCX6Br0XR6spgXqvJhH6nXcG3I9uz8xfUHcIC2qmKg75u+4cZUowrDnXrG2mDETc205Ijz/gXmB4hGy39J/REHY5b42k3RM5RJDeolTEq7+ZJYNCY+3lf2J6pnt+y97H2NRTvbiJrZXt0JQ4d/O95zUXvAfiZCO8h2E6V919tzIBq8izgl6iT0WYeOH7zwWJKDaji94iWTOSU84ECaaKcEqJ9LIeiw+3VftqRLMG86/NJlLBz2oTxIXEkFGSjwwHhbNwR0ehqHHDFijUoNJB9bIF4xpb5Ss21j4BRoBTiUSHbg6
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2026 12:36:19.8085
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e8514f98-8c1a-4bd9-0aa7-08de6afc7d48
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00001CE4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB6739
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260213_043624_795128_D04A6158 
X-CRM114-Status: GOOD (  10.56  )
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

From: Aksh Garg <a-garg7@ti.com>

Move common macros and structures from drivers/pci/doe.c to
include/linux/pci-doe.h to allow reuse across root complex and
endpoint DOE implementations.

Also add CONFIG_PCI_DOE guards around the root complex DOE APIs to
maintain proper conditional compilation.

These changes prepare the groundwork for the DOE endpoint implementation
that will reuse these common definitions.

Co-developed-by: Siddharth Vadapalli <s-vadapalli@ti.com>
Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
Signed-off-by: Aksh Garg <a-garg7@ti.com>
---
 drivers/pci/doe.c       | 11 -----------
 include/linux/pci-doe.h | 38 +++++++++++++++++++++++++++++++++-----
 2 files changed, 33 insertions(+), 16 deletions(-)

diff --git a/drivers/pci/doe.c b/drivers/pci/doe.c
index 62be9c8dbc52..0171ef3215a7 100644
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
diff --git a/include/linux/pci-doe.h b/include/linux/pci-doe.h
index bd4346a7c4e7..a966626c47f9 100644
--- a/include/linux/pci-doe.h
+++ b/include/linux/pci-doe.h
@@ -13,12 +13,25 @@
 #ifndef LINUX_PCI_DOE_H
 #define LINUX_PCI_DOE_H
 
-struct pci_doe_mb;
+/* Mailbox state flags */
+#define PCI_DOE_FLAG_CANCEL		0
+#define PCI_DOE_FLAG_DEAD		1
+
+/* Max data object length is 2^18 dwords */
+#define PCI_DOE_MAX_LENGTH		(1 << 18)
 
-#define PCI_DOE_FEATURE_DISCOVERY 0
-#define PCI_DOE_FEATURE_CMA 1
-#define PCI_DOE_FEATURE_SSESSION 2
+#define PCI_DOE_FEATURE_DISCOVERY	0
+#define PCI_DOE_FEATURE_CMA		1
+#define PCI_DOE_FEATURE_SSESSION	2
 
+struct pci_doe_feature {
+	u16 vid;
+	u8 type;
+};
+
+struct pci_doe_mb;
+
+#ifdef CONFIG_PCI_DOE
 struct pci_doe_mb *pci_find_doe_mailbox(struct pci_dev *pdev, u16 vendor,
 					u8 type);
 
@@ -26,4 +39,19 @@ int pci_doe(struct pci_doe_mb *doe_mb, u16 vendor, u8 type,
 	    const void *request, size_t request_sz,
 	    void *response, size_t response_sz);
 
-#endif
+#else
+static inline struct pci_doe_mb *pci_find_doe_mailbox(struct pci_dev *pdev,
+						      u16 vendor, u8 type)
+{
+	return NULL;
+}
+
+static inline int pci_doe(struct pci_doe_mb *doe_mb, u16 vendor, u8 type,
+			  const void *request, size_t request_sz,
+			  void *response, size_t response_sz)
+{
+	return -EOPNOTSUPP;
+}
+#endif /* CONFIG_PCI_DOE */
+
+#endif /* LINUX_PCI_DOE_H */
-- 
2.34.1


