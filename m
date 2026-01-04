Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C62B1C2A074
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 Jan 2026 11:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Imd+cx9u0oPCIUPR9NmpXPOpSxfsxzUIQIGWucPJz3c=; b=fYzEORBW7pbMIuXUFyNnP2xwky
	Ejot0AIVqUbuPDpaaoB2Swa3tPVTK8+lP9i0457uJZFzJsu4EKHvpG/4y77fL7lu6p8QNa96u6hfy
	B1R8qFaK+J5z2MjIOA18ca5PkwoeDX697GZlpy0eBiPzfozQUHWw9Vvd+cMgyiseDVQLa84jczhtn
	2OqxYy4lcJ9k8DIbn8W7dT4GEuJVAeJwPEZaiEdBpnwu/8XGkw6gLQn5enj9v1ZpYz6f8Fir0qXy5
	407qR/WSGZt5wILWK7wmqSALP96e2CS9aRXp3VR7PzFzJv16Qs+y9dSNWviunhgo+fWJeoLhbIEn4
	N3/8d3fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcMWV-0000000ACCx-00jx;
	Sun, 04 Jan 2026 11:43:51 +0000
Received: from mail-westus3azlp170100009.outbound.protection.outlook.com ([2a01:111:f403:c107::9] helo=PH7PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcMWS-0000000ACBI-0KB5;
	Sun, 04 Jan 2026 11:43:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZlFc5YSUtgURTf+6RP1dkhXRqDniIy18yiRpMkyePsH7hB5Gt2zJFlEJDq2nFBMzBKIYvX1+j+h6L3qIaJ+job+5tno7vp4217Zr041tU/rEEzPqIjYqo69Ne4O39OKrKMFcocCE7GrFZbk4diEJ8w+1hZSJxpbNEn30sKXUxAS62L7Fb1YUrtdbCCG03baH4ItSJ2l5uhrWSmfn5AJmjg29N7EAGYMwZIUwIoeDkklXsNq179ZxgcR6PLUG2GfPEldxlRYNmC1Salddnfsc1T0S0vzI1p7N8iPfPh6GY/nZY6nl5UlQNWXdRP2Ust/0TUsNMOGj+DZz496rCRXTGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Imd+cx9u0oPCIUPR9NmpXPOpSxfsxzUIQIGWucPJz3c=;
 b=XqI54Ue3kPp7cAfO+fmblbjrWJF/fWV/Shku4WGrq23pCQnno6xDQrRG6iHSJGa/JJhBMFnHgMu8mErhMYe1xLumi6EPLrwJTWXP+/aAsfA6s45aICZr47N6gMFVX3BHrvirRzXwqJdctX0PmF9OtDAYXDtCrmoEGohdYuClKeH/gCK4Cked4HFA5+8E+esUeMS+DAKMuejlXH9hDcwN7EC4l/D0PNlCgKoYAwuR2+2jmQkiOf2D0EyPZ+Ez1+AEzVMk6gWY+xhw0auRnAdFye9EE8hf1lx34lw+17xROP1nGUQB6AsQhNLuEwIt0QmgiDCmA0LDHlpStcSJQAHebA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Imd+cx9u0oPCIUPR9NmpXPOpSxfsxzUIQIGWucPJz3c=;
 b=NmdWMS3z2/uhe51ezXNapcupAiLVz+MGlZTZczV499FXnPpNAev6sBCsuo+nQXKdCFqIfTRV374P0XymV1QbNaZJX/XbvWKCdaFyn2Mcx1PxQc2bBlGSk+na70p2NfMpvQKK/rBEsDMm2WnxxxWeyINi9P4cgWnuc2RpCqLC5yE=
Received: from SJ0PR13CA0190.namprd13.prod.outlook.com (2603:10b6:a03:2c3::15)
 by SA0PR10MB6428.namprd10.prod.outlook.com (2603:10b6:806:2c0::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Sun, 4 Jan
 2026 11:43:43 +0000
Received: from SJ5PEPF000001E9.namprd05.prod.outlook.com
 (2603:10b6:a03:2c3:cafe::73) by SJ0PR13CA0190.outlook.office365.com
 (2603:10b6:a03:2c3::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.1 via Frontend Transport; Sun, 4
 Jan 2026 11:43:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ5PEPF000001E9.mail.protection.outlook.com (10.167.242.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.1 via Frontend Transport; Sun, 4 Jan 2026 11:43:42 +0000
Received: from DLEE206.ent.ti.com (157.170.170.90) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sun, 4 Jan
 2026 05:43:41 -0600
Received: from DLEE202.ent.ti.com (157.170.170.77) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sun, 4 Jan
 2026 05:43:40 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Sun, 4 Jan 2026 05:43:40 -0600
Received: from toolbox.dhcp.ti.com (uda0492258.dhcp.ti.com [10.24.73.74])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 604BhTlD3538389;
	Sun, 4 Jan 2026 05:43:37 -0600
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: <vkoul@kernel.org>, <neil.armstrong@linaro.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <sjakhade@cadence.com>,
	<rogerq@kernel.org>
CC: <krzk@kernel.org>, <linux-phy@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <srk@ti.com>, <s-vadapalli@ti.com>
Subject: [PATCH v2 2/2] phy: cadence-torrent: Add PCIe + XAUI multilink configuration for 100MHz refclk
Date: Sun, 4 Jan 2026 17:14:18 +0530
Message-ID: <20260104114422.2868321-3-s-vadapalli@ti.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20260104114422.2868321-1-s-vadapalli@ti.com>
References: <20260104114422.2868321-1-s-vadapalli@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001E9:EE_|SA0PR10MB6428:EE_
X-MS-Office365-Filtering-Correlation-Id: 672edbc7-2aaa-4b24-9930-08de4b86831a
X-LD-Processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?oA6gO53BJIeWogA4X+4YV7de1gGKc9BfDXWfPYnpBDH4bEvSAc7mOd1gAQYS?=
 =?us-ascii?Q?4hWVZpuMGW6Xt5iDJgHuBMmfpLKsrf9UTZzNWdUN3kCTGtjqLQiZZjidUl9O?=
 =?us-ascii?Q?QBKywc25aH24hSmHqaCEfOqmbqBE9Y0mWETOFSyjPqnmYzMiVn1BWj49dJwE?=
 =?us-ascii?Q?ptSQZT6TffBgsnZbl0EUu9b/OhPUq+KcVTr8Oh/U0v29jUA9o+gjbsUqGOgn?=
 =?us-ascii?Q?LaxlkX+Ez3elaUMxenNyE43b7LJK8DCPriTLDCYc8bfSb9RQf5eKIOI5iGGC?=
 =?us-ascii?Q?o27lB/XQ4+MLa1lIWrL1Eilzt3or9O+Da2jhSc43xeYjdjhXz2Hmca0TL2k1?=
 =?us-ascii?Q?gCvTBJNRS1NhXBuIZ8WlhzeUYzU8Pg6owfKYnZ9/HWc8jXSzsyOwBGONOXU7?=
 =?us-ascii?Q?0KSqTKtpAT4S4vB0fx/FQOc8OYyqOJiMR85RdS9erAJMFZXrx3NLmKJpZ9Qt?=
 =?us-ascii?Q?d3r55uo/TLZS8eq2B7kheHpbUkngWtk94Fwp7IMgFLXRu4u4KHajcKiUZA6f?=
 =?us-ascii?Q?BJazjqaUEheWB5dwAGY+qhZvxO3kMM0BBcJcPWS+KTiznDRAmlkBZKHwkIf/?=
 =?us-ascii?Q?EwjxD7zJXTkv9PDakgjDIyqeg1eb5Skp/fJfyzBQxyWuYDdCa73R1WNiLNCf?=
 =?us-ascii?Q?yo1SnfZ+/InI5LLktz78oK4cfG9dXhHwkdsLiWSi0RH52G5ifx9rAjBD1DdM?=
 =?us-ascii?Q?gUC+DO2+HBmgDWpno8ruAFlaXIyKKS7svnUtgasaw/lXtt3jPZNNCUUZLxyR?=
 =?us-ascii?Q?sflEX92lbvU3A+51hlIZjZgo1VEdPeXbvZoa5FOjjS/skqWmr5SdioVZy44M?=
 =?us-ascii?Q?WQXk3hyZzFGU30hIz2aFkPQUBRiUtBmTndU6RdAJilZEWjQBR/fpqwDd8W6G?=
 =?us-ascii?Q?bO46QqaX41aQQ51nTtVjzKXbY0KVRk8omc58tVyaLvxwMAIab6CD/ya7lKsZ?=
 =?us-ascii?Q?BjfefZMPpcF2orlWXwi1g+KvKF8VGdZ1pzyMAAP0bkC5AKoVaRC0Ge1Sdop1?=
 =?us-ascii?Q?6kFgaUmM8t37cAOv3kLaNRKwcTiKC32WucX7T0JH4COnWAA8GWURRsPmwYuZ?=
 =?us-ascii?Q?JS/PhwtxAE9H0kQ8XXu1V12akKDOMQoliu+dRTqWSMYWSm/UTyoE9KhvJ8jB?=
 =?us-ascii?Q?hL+OFzsJAEZbYQ8R0ZilosK30e3L5Uo1jqg+r0pCNKscaoodVbIlGOCj1Qrz?=
 =?us-ascii?Q?hh4yX/uPaDhwTsLc29ZoHENFUVB86WrAvUb1I041pvAz1Ag9e4Xzpx12m/4U?=
 =?us-ascii?Q?9/rLfLmAuH2shlI/ZGzPC1kOKCuCoJHR1uyjsZfIj/KGDhYe1B7wLinU86ad?=
 =?us-ascii?Q?GOpC+/WyazjMG/qXN3N4yrRBPfoJtWWyi4PSEDSmJX8ASvK8mqThxLDkbst7?=
 =?us-ascii?Q?/OsghrH5VVul3bZOCzhVV3FV8oEuMV3YnKFPXd2bprtBGoesEtNMe/XOBfIf?=
 =?us-ascii?Q?EIVvuKSATRrpmPoEE1y1HRnjRLLh21YqmaC2s60ObuA2cwfN1Tot3i90ysFd?=
 =?us-ascii?Q?NenYNthhckinUSxsvOes94FRAklfyB5e3tBHzXnWtmBz/HYiZo1XVWldexPc?=
 =?us-ascii?Q?UyGVXqPX9zad/swgPGI=3D?=
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2026 11:43:42.9544
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 672edbc7-2aaa-4b24-9930-08de4b86831a
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001E9.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR10MB6428
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260104_034348_187146_27439B76 
X-CRM114-Status: GOOD (  12.85  )
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

From: Swapnil Jakhade <sjakhade@cadence.com>

Add register sequences for PCIe + XAUI multilink configuration for
100MHz reference clock.

Signed-off-by: Swapnil Jakhade <sjakhade@cadence.com>
Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
---

v1 of this patch is at:
https://lore.kernel.org/r/20251224054905.763399-3-s-vadapalli@ti.com/
No changes since v1.

Regards,
Siddharth.

 drivers/phy/cadence/phy-cadence-torrent.c | 143 ++++++++++++++++++++--
 1 file changed, 136 insertions(+), 7 deletions(-)

diff --git a/drivers/phy/cadence/phy-cadence-torrent.c b/drivers/phy/cadence/phy-cadence-torrent.c
index 37fa4bad6bd7..f0d870886cca 100644
--- a/drivers/phy/cadence/phy-cadence-torrent.c
+++ b/drivers/phy/cadence/phy-cadence-torrent.c
@@ -300,6 +300,7 @@ enum cdns_torrent_phy_type {
 	TYPE_USB,
 	TYPE_USXGMII,
 	TYPE_PCIE_ML,
+	TYPE_XAUI,
 };
 
 enum cdns_torrent_ref_clk {
@@ -320,14 +321,14 @@ enum cdns_torrent_ssc_mode {
 /* Unique key id for vals table entry
  * REFCLK0_RATE | REFCLK1_RATE | LINK0_TYPE | LINK1_TYPE | SSC_TYPE
  */
-#define REFCLK0_SHIFT	12
-#define REFCLK0_MASK	GENMASK(14, 12)
-#define REFCLK1_SHIFT	9
-#define REFCLK1_MASK	GENMASK(11, 9)
-#define LINK0_SHIFT	6
-#define LINK0_MASK	GENMASK(8, 6)
+#define REFCLK0_SHIFT	15
+#define REFCLK0_MASK	GENMASK(18, 15)
+#define REFCLK1_SHIFT	11
+#define REFCLK1_MASK	GENMASK(14, 11)
+#define LINK0_SHIFT	7
+#define LINK0_MASK	GENMASK(10, 7)
 #define LINK1_SHIFT	3
-#define LINK1_MASK	GENMASK(5, 3)
+#define LINK1_MASK	GENMASK(6, 3)
 #define SSC_SHIFT	0
 #define SSC_MASK	GENMASK(2, 0)
 
@@ -708,6 +709,8 @@ static const char *cdns_torrent_get_phy_type(enum cdns_torrent_phy_type phy_type
 		return "USB";
 	case TYPE_USXGMII:
 		return "USXGMII";
+	case TYPE_XAUI:
+		return "XAUI";
 	default:
 		return "None";
 	}
@@ -3020,6 +3023,9 @@ static int cdns_torrent_phy_probe(struct platform_device *pdev)
 		case PHY_TYPE_USXGMII:
 			cdns_phy->phys[node].phy_type = TYPE_USXGMII;
 			break;
+		case PHY_TYPE_XAUI:
+			cdns_phy->phys[node].phy_type = TYPE_XAUI;
+			break;
 		default:
 			dev_err(dev, "Unsupported protocol\n");
 			ret = -EINVAL;
@@ -3382,6 +3388,95 @@ static DEFINE_NOIRQ_DEV_PM_OPS(cdns_torrent_phy_pm_ops,
 			       cdns_torrent_phy_suspend_noirq,
 			       cdns_torrent_phy_resume_noirq);
 
+/* PCIe and XAUI link configuration */
+static const struct cdns_reg_pairs pcie_xaui_link_cmn_regs[] = {
+	{0x0003, PHY_PLL_CFG},
+	{0x0600, CMN_PDIAG_PLL1_CLK_SEL_M0}
+};
+
+static const struct cdns_reg_pairs xaui_pcie_xcvr_diag_ln_regs[] = {
+	{0x0011, XCVR_DIAG_HSCLK_SEL},
+	{0x0089, XCVR_DIAG_PLLDRC_CTRL}
+};
+
+static const struct cdns_torrent_vals pcie_xaui_link_cmn_vals = {
+	.reg_pairs = pcie_xaui_link_cmn_regs,
+	.num_regs = ARRAY_SIZE(pcie_xaui_link_cmn_regs),
+};
+
+static const struct cdns_torrent_vals xaui_pcie_xcvr_diag_ln_vals = {
+	.reg_pairs = xaui_pcie_xcvr_diag_ln_regs,
+	.num_regs = ARRAY_SIZE(xaui_pcie_xcvr_diag_ln_regs),
+};
+
+/* XAUI 100 MHz Ref clk, no SSC */
+static const struct cdns_reg_pairs xaui_100_no_ssc_cmn_regs[] = {
+	{0x0004, CMN_PLL1_DSM_DIAG_M0},
+	{0x0B17, CMN_PDIAG_PLL1_CP_PADJ_M0},
+	{0x0E01, CMN_PDIAG_PLL1_CP_IADJ_M0},
+	{0x0D05, CMN_PDIAG_PLL1_FILT_PADJ_M0},
+	{0x003E, CMN_PLL1_INTDIV_M0},
+	{0x8000, CMN_PLL1_FRACDIVL_M0},
+	{0x0002, CMN_PLL1_FRACDIVH_M0},
+	{0x002A, CMN_PLL1_HIGH_THR_M0},
+	{0x3102, CMN_PDIAG_PLL1_CTRL_M0},
+	{0x007F, CMN_TXPUCAL_TUNE},
+	{0x007F, CMN_TXPDCAL_TUNE}
+};
+
+static const struct cdns_reg_pairs xaui_100_no_ssc_tx_ln_regs[] = {
+	{0x00F3, TX_PSC_A0},
+	{0x04A2, TX_PSC_A2},
+	{0x04A2, TX_PSC_A3 },
+	{0x0000, TX_TXCC_CPOST_MULT_00}
+};
+
+static const struct cdns_reg_pairs ti_xaui_100_no_ssc_tx_ln_regs[] = {
+	{0x00F3, TX_PSC_A0},
+	{0x04A2, TX_PSC_A2},
+	{0x04A2, TX_PSC_A3 },
+	{0x0000, TX_TXCC_CPOST_MULT_00},
+	{0x4000, XCVR_DIAG_RXCLK_CTRL}
+};
+
+static const struct cdns_reg_pairs xaui_100_no_ssc_rx_ln_regs[] = {
+	{0x091D, RX_PSC_A0},
+	{0x0900, RX_PSC_A2},
+	{0x0100, RX_PSC_A3},
+	{0x03C7, RX_REE_GCSM1_EQENM_PH1},
+	{0x01C7, RX_REE_GCSM1_EQENM_PH2},
+	{0x0000, RX_DIAG_DFE_CTRL},
+	{0x0019, RX_REE_TAP1_CLIP},
+	{0x0019, RX_REE_TAP2TON_CLIP},
+	{0x0098, RX_DIAG_NQST_CTRL},
+	{0x0C01, RX_DIAG_DFE_AMP_TUNE_2},
+	{0x0000, RX_DIAG_DFE_AMP_TUNE_3},
+	{0x0000, RX_DIAG_PI_CAP},
+	{0x0031, RX_DIAG_PI_RATE},
+	{0x0001, RX_DIAG_ACYA},
+	{0x018C, RX_CDRLF_CNFG},
+};
+
+static const struct cdns_torrent_vals xaui_100_no_ssc_cmn_vals = {
+	.reg_pairs = xaui_100_no_ssc_cmn_regs,
+	.num_regs = ARRAY_SIZE(xaui_100_no_ssc_cmn_regs),
+};
+
+static const struct cdns_torrent_vals xaui_100_no_ssc_tx_ln_vals = {
+	.reg_pairs = xaui_100_no_ssc_tx_ln_regs,
+	.num_regs = ARRAY_SIZE(xaui_100_no_ssc_tx_ln_regs),
+};
+
+static const struct cdns_torrent_vals ti_xaui_100_no_ssc_tx_ln_vals = {
+	.reg_pairs = ti_xaui_100_no_ssc_tx_ln_regs,
+	.num_regs = ARRAY_SIZE(ti_xaui_100_no_ssc_tx_ln_regs),
+};
+
+static const struct cdns_torrent_vals xaui_100_no_ssc_rx_ln_vals = {
+	.reg_pairs = xaui_100_no_ssc_rx_ln_regs,
+	.num_regs = ARRAY_SIZE(xaui_100_no_ssc_rx_ln_regs),
+};
+
 /* USB and DP link configuration */
 static const struct cdns_reg_pairs usb_dp_link_cmn_regs[] = {
 	{0x0002, PHY_PLL_CFG},
@@ -4853,6 +4948,7 @@ static const struct cdns_torrent_vals_entry link_cmn_vals_entries[] = {
 	{CDNS_TORRENT_KEY_ANYCLK(TYPE_PCIE, TYPE_USB), &pcie_usb_link_cmn_vals},
 	{CDNS_TORRENT_KEY_ANYCLK(TYPE_PCIE, TYPE_DP), &pcie_dp_link_cmn_vals},
 	{CDNS_TORRENT_KEY_ANYCLK(TYPE_PCIE, TYPE_USXGMII), &pcie_usxgmii_link_cmn_vals},
+	{CDNS_TORRENT_KEY_ANYCLK(TYPE_PCIE, TYPE_XAUI), &pcie_xaui_link_cmn_vals},
 
 	{CDNS_TORRENT_KEY_ANYCLK(TYPE_PCIE_ML, TYPE_USB), &ml_pcie_usb_link_cmn_vals},
 
@@ -4879,6 +4975,8 @@ static const struct cdns_torrent_vals_entry link_cmn_vals_entries[] = {
 	{CDNS_TORRENT_KEY_ANYCLK(TYPE_USXGMII, TYPE_PCIE), &pcie_usxgmii_link_cmn_vals},
 	{CDNS_TORRENT_KEY_ANYCLK(TYPE_USXGMII, TYPE_SGMII), &usxgmii_sgmii_link_cmn_vals},
 	{CDNS_TORRENT_KEY_ANYCLK(TYPE_USXGMII, TYPE_QSGMII), &usxgmii_sgmii_link_cmn_vals},
+
+	{CDNS_TORRENT_KEY_ANYCLK(TYPE_XAUI, TYPE_PCIE), &pcie_xaui_link_cmn_vals},
 };
 
 static const struct cdns_torrent_vals_entry xcvr_diag_vals_entries[] = {
@@ -4893,6 +4991,7 @@ static const struct cdns_torrent_vals_entry xcvr_diag_vals_entries[] = {
 	{CDNS_TORRENT_KEY_ANYCLK(TYPE_PCIE, TYPE_USB), &pcie_usb_xcvr_diag_ln_vals},
 	{CDNS_TORRENT_KEY_ANYCLK(TYPE_PCIE, TYPE_DP), &pcie_dp_xcvr_diag_ln_vals},
 	{CDNS_TORRENT_KEY_ANYCLK(TYPE_PCIE, TYPE_USXGMII), &pcie_usxgmii_xcvr_diag_ln_vals},
+	{CDNS_TORRENT_KEY_ANYCLK(TYPE_PCIE, TYPE_XAUI), NULL},
 
 	{CDNS_TORRENT_KEY_ANYCLK(TYPE_PCIE_ML, TYPE_USB), &ml_pcie_usb_xcvr_diag_ln_vals},
 
@@ -4919,6 +5018,8 @@ static const struct cdns_torrent_vals_entry xcvr_diag_vals_entries[] = {
 	{CDNS_TORRENT_KEY_ANYCLK(TYPE_USXGMII, TYPE_PCIE), &usxgmii_pcie_xcvr_diag_ln_vals},
 	{CDNS_TORRENT_KEY_ANYCLK(TYPE_USXGMII, TYPE_SGMII), &usxgmii_sgmii_xcvr_diag_ln_vals},
 	{CDNS_TORRENT_KEY_ANYCLK(TYPE_USXGMII, TYPE_QSGMII), &usxgmii_sgmii_xcvr_diag_ln_vals},
+
+	{CDNS_TORRENT_KEY_ANYCLK(TYPE_XAUI, TYPE_PCIE), &xaui_pcie_xcvr_diag_ln_vals},
 };
 
 static const struct cdns_torrent_vals_entry pcs_cmn_vals_entries[] = {
@@ -4960,6 +5061,8 @@ static const struct cdns_torrent_vals_entry cmn_vals_entries[] = {
 
 	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_DP, NO_SSC), NULL},
 
+	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_XAUI, NO_SSC), NULL},
+
 	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE_ML, TYPE_USB, NO_SSC), &ml_pcie_100_no_ssc_cmn_vals},
 	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE_ML, TYPE_USB, EXTERNAL_SSC), &ml_pcie_100_no_ssc_cmn_vals},
 	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE_ML, TYPE_USB, INTERNAL_SSC), &ml_pcie_100_int_ssc_cmn_vals},
@@ -5010,6 +5113,8 @@ static const struct cdns_torrent_vals_entry cmn_vals_entries[] = {
 
 	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_USB, TYPE_DP, NO_SSC), &usb_100_no_ssc_cmn_vals},
 
+	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_XAUI, TYPE_PCIE, NO_SSC), &xaui_100_no_ssc_cmn_vals},
+
 	{CDNS_TORRENT_KEY(CLK_156_25_MHZ, CLK_156_25_MHZ, TYPE_USXGMII, TYPE_NONE, NO_SSC), &sl_usxgmii_156_25_no_ssc_cmn_vals},
 
 	/* Dual refclk */
@@ -5054,6 +5159,8 @@ static const struct cdns_torrent_vals_entry cdns_tx_ln_vals_entries[] = {
 
 	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_DP, NO_SSC), NULL},
 
+	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_XAUI, NO_SSC), NULL},
+
 	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE_ML, TYPE_USB, NO_SSC), NULL},
 	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE_ML, TYPE_USB, EXTERNAL_SSC), NULL},
 	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE_ML, TYPE_USB, INTERNAL_SSC), NULL},
@@ -5104,6 +5211,8 @@ static const struct cdns_torrent_vals_entry cdns_tx_ln_vals_entries[] = {
 
 	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_USB, TYPE_DP, NO_SSC), &usb_100_no_ssc_tx_ln_vals},
 
+	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_XAUI, TYPE_PCIE, NO_SSC), &xaui_100_no_ssc_tx_ln_vals},
+
 	{CDNS_TORRENT_KEY(CLK_156_25_MHZ, CLK_156_25_MHZ, TYPE_USXGMII, TYPE_NONE, NO_SSC), &usxgmii_156_25_no_ssc_tx_ln_vals},
 
 	/* Dual refclk */
@@ -5148,6 +5257,8 @@ static const struct cdns_torrent_vals_entry cdns_rx_ln_vals_entries[] = {
 
 	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_DP, NO_SSC), &pcie_100_no_ssc_rx_ln_vals},
 
+	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_XAUI, NO_SSC), &ml_pcie_100_no_ssc_rx_ln_vals},
+
 	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE_ML, TYPE_USB, NO_SSC), &ml_pcie_100_no_ssc_rx_ln_vals},
 	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE_ML, TYPE_USB, EXTERNAL_SSC), &ml_pcie_100_no_ssc_rx_ln_vals},
 	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE_ML, TYPE_USB, INTERNAL_SSC), &ml_pcie_100_no_ssc_rx_ln_vals},
@@ -5198,6 +5309,8 @@ static const struct cdns_torrent_vals_entry cdns_rx_ln_vals_entries[] = {
 
 	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_USB, TYPE_DP, NO_SSC), &usb_100_no_ssc_rx_ln_vals},
 
+	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_XAUI, TYPE_PCIE, NO_SSC), &xaui_100_no_ssc_rx_ln_vals},
+
 	{CDNS_TORRENT_KEY(CLK_156_25_MHZ, CLK_156_25_MHZ, TYPE_USXGMII, TYPE_NONE, NO_SSC), &usxgmii_156_25_no_ssc_rx_ln_vals},
 
 	/* Dual refclk */
@@ -5278,6 +5391,8 @@ static const struct cdns_torrent_vals_entry ti_tx_ln_vals_entries[] = {
 
 	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_DP, NO_SSC), NULL},
 
+	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_XAUI, NO_SSC), NULL},
+
 	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE_ML, TYPE_USB, NO_SSC), NULL},
 	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE_ML, TYPE_USB, EXTERNAL_SSC), NULL},
 	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE_ML, TYPE_USB, INTERNAL_SSC), NULL},
@@ -5328,6 +5443,8 @@ static const struct cdns_torrent_vals_entry ti_tx_ln_vals_entries[] = {
 
 	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_USB, TYPE_DP, NO_SSC), &usb_100_no_ssc_tx_ln_vals},
 
+	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_XAUI, TYPE_PCIE, NO_SSC), &ti_xaui_100_no_ssc_tx_ln_vals},
+
 	{CDNS_TORRENT_KEY(CLK_156_25_MHZ, CLK_156_25_MHZ, TYPE_USXGMII, TYPE_NONE, NO_SSC), &usxgmii_156_25_no_ssc_tx_ln_vals},
 
 	/* Dual refclk */
@@ -5406,6 +5523,8 @@ static const struct cdns_torrent_vals_entry ti_j7200_cmn_vals_entries[] = {
 
 	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_DP, NO_SSC), NULL},
 
+	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_XAUI, NO_SSC), NULL},
+
 	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE_ML, TYPE_USB, NO_SSC), &ml_pcie_100_no_ssc_cmn_vals},
 	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE_ML, TYPE_USB, EXTERNAL_SSC), &ml_pcie_100_no_ssc_cmn_vals},
 	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE_ML, TYPE_USB, INTERNAL_SSC), &ml_pcie_100_int_ssc_cmn_vals},
@@ -5456,6 +5575,8 @@ static const struct cdns_torrent_vals_entry ti_j7200_cmn_vals_entries[] = {
 
 	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_USB, TYPE_DP, NO_SSC), &usb_100_no_ssc_cmn_vals},
 
+	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_XAUI, TYPE_PCIE, NO_SSC), &xaui_100_no_ssc_cmn_vals},
+
 	{CDNS_TORRENT_KEY(CLK_156_25_MHZ, CLK_156_25_MHZ, TYPE_USXGMII, TYPE_NONE, NO_SSC), &sl_usxgmii_156_25_no_ssc_cmn_vals},
 
 	/* Dual refclk */
@@ -5500,6 +5621,8 @@ static const struct cdns_torrent_vals_entry ti_j7200_tx_ln_vals_entries[] = {
 
 	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_DP, NO_SSC), NULL},
 
+	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_XAUI, NO_SSC), NULL},
+
 	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE_ML, TYPE_USB, NO_SSC), NULL},
 	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE_ML, TYPE_USB, EXTERNAL_SSC), NULL},
 	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE_ML, TYPE_USB, INTERNAL_SSC), NULL},
@@ -5550,6 +5673,8 @@ static const struct cdns_torrent_vals_entry ti_j7200_tx_ln_vals_entries[] = {
 
 	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_USB, TYPE_DP, NO_SSC), &usb_100_no_ssc_tx_ln_vals},
 
+	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_XAUI, TYPE_PCIE, NO_SSC), &ti_xaui_100_no_ssc_tx_ln_vals},
+
 	{CDNS_TORRENT_KEY(CLK_156_25_MHZ, CLK_156_25_MHZ, TYPE_USXGMII, TYPE_NONE, NO_SSC), &usxgmii_156_25_no_ssc_tx_ln_vals},
 
 	/* Dual refclk */
@@ -5594,6 +5719,8 @@ static const struct cdns_torrent_vals_entry ti_j7200_rx_ln_vals_entries[] = {
 
 	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_DP, NO_SSC), &pcie_100_no_ssc_rx_ln_vals},
 
+	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_XAUI, NO_SSC), &pcie_100_no_ssc_rx_ln_vals},
+
 	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE_ML, TYPE_USB, NO_SSC), &pcie_100_no_ssc_rx_ln_vals},
 	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE_ML, TYPE_USB, EXTERNAL_SSC), &pcie_100_no_ssc_rx_ln_vals},
 	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE_ML, TYPE_USB, INTERNAL_SSC), &pcie_100_no_ssc_rx_ln_vals},
@@ -5644,6 +5771,8 @@ static const struct cdns_torrent_vals_entry ti_j7200_rx_ln_vals_entries[] = {
 
 	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_USB, TYPE_DP, NO_SSC), &usb_100_no_ssc_rx_ln_vals},
 
+	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_XAUI, TYPE_PCIE, NO_SSC), &xaui_100_no_ssc_rx_ln_vals},
+
 	{CDNS_TORRENT_KEY(CLK_156_25_MHZ, CLK_156_25_MHZ, TYPE_USXGMII, TYPE_NONE, NO_SSC), &usxgmii_156_25_no_ssc_rx_ln_vals},
 
 	/* Dual refclk */
-- 
2.51.1


