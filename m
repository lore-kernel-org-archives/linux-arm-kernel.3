Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 538BBE74903
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Dec 2025 05:48:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i8gWbB02EUhMW53pST/VyoRtkxSCuXqs5ibMue9LsRw=; b=kP5GgkxZaxn5MigUqjs0HU99JL
	SX7mclvKxiDps4C1upYPsCisZUv40EJ3/wN8L+aD/4gTgbsfj/oGa829NjOZYZaNr7v2Ho3u+rQrL
	VGWo4pNnUidMkJbrZdkmQdEHr+Bl6+15Go29rDkNV14TCc7toaTurVgDhZBrunoE7p50/3yh3PlSe
	l2MXNqndr26UXXVvZli+HpBMAQpvFA7LFON9imJIw7p50LgWiqEiKPW0fvYMl8qTswSs2BZ6CGmHT
	xzG7CXCfV0Sw0x89txNHiuy9qIT2gH0cogJwYPhF+d9smxmNiim+EoT2SJh+3JUlBrX9i73L/JNRc
	m5i8pMpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYHjk-0000000GScj-1lMD;
	Wed, 24 Dec 2025 05:48:40 +0000
Received: from mail-westus3azon11010023.outbound.protection.outlook.com ([52.101.201.23] helo=PH7PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYHjf-0000000GSaP-33op;
	Wed, 24 Dec 2025 05:48:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gGa0zCeJHGbjONYC8n25ZFZkfLKWETE3ifNGoIdEgCJBqysjYAX4B3awKPCqQS1j/RC1RI0mdi+MVYgk2NLmeZSXEEk7hK+jxIYKarLprNP1ShUTGPmCW2AAKwr/77lQ35q7hgk0Zv9g9HYFQSy29oyD0snWj7mKV8c5zLXii0hNY6Q7x+G5JUwm44E9rFs3dMfYbKn2IozIvTsBEHeUIBxFj5S32VL2ccUb5gUD8zbAfymCh2IEG/9gUXId2/Z3HNAwHdHZ4CPXFri1ZFUpHSPQik0Fgfi7LxIbgLuKNpTN3Koge1bpQpgcGSt6tNEFekbI2UR/PQ+dfzI17P/9Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i8gWbB02EUhMW53pST/VyoRtkxSCuXqs5ibMue9LsRw=;
 b=NdsCBWVFa/e35jbC6W3VynCthVo/cY+Uh6pMZ1GWu+j5ZxNNhpHKGh96oXN0l/DSYLRUn5o+z7v/qHe6Fns+L/HasJRfPknUlUd7czZXv7RrXIGMSSJ/E8CnH9hegcxUzMLtBh5WGv39pjw3zzyO+QV9Gg5nXqHav625L/JzL+jdl/R+1/tV4izIB+0wjH8aBwy+MX+md/aAr8JHZeKDGowm2f03ME0HwhFhbmoPTfM/Past4jIMJG6GZFA/Sk0pZ8+HzoXUpNplHKUvKUvOzTuR4mj0MbJzpSsi6JGieBt345nyz88Gky0fc7kzzgGL2ljqsu0BgLeZQ8bujDZ7Dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i8gWbB02EUhMW53pST/VyoRtkxSCuXqs5ibMue9LsRw=;
 b=RM6b87Zsw3vuTeCwNlPzU5EZ7luROc57rWMut+HSwY0XNRFfK74zkN3pXid9hZaFzCNfGYJrnbKL933x1hpCTV/YNNpNZ13yevwutEVI/d7UHwatYvjj87UTRN8zvKlC4zQGpdc9CGkXfGBc2PykNFCFm7XXpAIlZepPrygUDuk=
Received: from SJ0PR03CA0366.namprd03.prod.outlook.com (2603:10b6:a03:3a1::11)
 by SA3PR10MB6952.namprd10.prod.outlook.com (2603:10b6:806:31b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.11; Wed, 24 Dec
 2025 05:48:31 +0000
Received: from CO1PEPF000075ED.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1:cafe::b8) by SJ0PR03CA0366.outlook.office365.com
 (2603:10b6:a03:3a1::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9456.11 via Frontend Transport; Wed,
 24 Dec 2025 05:48:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CO1PEPF000075ED.mail.protection.outlook.com (10.167.249.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9456.9 via Frontend Transport; Wed, 24 Dec 2025 05:48:30 +0000
Received: from DFLE202.ent.ti.com (10.64.6.60) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 23 Dec
 2025 23:48:26 -0600
Received: from DFLE200.ent.ti.com (10.64.6.58) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 23 Dec
 2025 23:48:26 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 23 Dec 2025 23:48:26 -0600
Received: from toolbox.dhcp.ti.com (uda0492258.dhcp.ti.com [10.24.73.74])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5BO5mFtE079101;
	Tue, 23 Dec 2025 23:48:23 -0600
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: <vkoul@kernel.org>, <neil.armstrong@linaro.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <sjakhade@cadence.com>,
	<rogerq@kernel.org>
CC: <linux-phy@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<srk@ti.com>, <s-vadapalli@ti.com>
Subject: [PATCH 2/2] phy: cadence-torrent: Add PCIe + XAUI multilink configuration for 100MHz refclk
Date: Wed, 24 Dec 2025 11:18:59 +0530
Message-ID: <20251224054905.763399-3-s-vadapalli@ti.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251224054905.763399-1-s-vadapalli@ti.com>
References: <20251224054905.763399-1-s-vadapalli@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075ED:EE_|SA3PR10MB6952:EE_
X-MS-Office365-Filtering-Correlation-Id: ef405a7e-a98f-4bca-24a4-08de42b01157
X-LD-Processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Ikkxwg9bqGGwgtDSt0dbaYug+OK2XAGZISi6gdrpHwl8LS3l58zY3nO4SsSa?=
 =?us-ascii?Q?tKGevInrlV2guEJpt6DN+V4xX4JsmBpt64ERJO2TMjmyLwNo/m4FgufUEmQ6?=
 =?us-ascii?Q?darMC/7ctvAQI1bgK4FNUGMWvUxR0H8rIiBf39Ic0zCxCe1+n/17C7t37C9g?=
 =?us-ascii?Q?rR37RQuuU7f5ZF0L45RQgeJe0dH/zosMNOBVnaW49DU7zOP4q7HAwAa+OYwe?=
 =?us-ascii?Q?HA6eXGR2h/xJyIXQrzsdLpm7rmfkPAba7LXF1Yw/6k/GqrEWCiJwW7L+B1HX?=
 =?us-ascii?Q?cbZ9e9x/NzWXzuotA5yEbxvbHdkMiWsWD+istM2sE9Azu7yWBpj1ObhkX1qx?=
 =?us-ascii?Q?DRpv/Xyx4lTssNsAXd64uqtg8Eh0wejLdEGcK5ajiHUSIhzOYYNd8WRIXstW?=
 =?us-ascii?Q?Wp6BFJsQX8XCGxfHzMxzdCTu9Oj937kdS8zCQsU64chtxegMDJg1BB14dEBE?=
 =?us-ascii?Q?p4aSw/cPtlXTTwiXyaSxdagB9tfXAiwuSE9MFff6f++Zwfv87quKf3qoS6VG?=
 =?us-ascii?Q?Nhv7IWbz1Lfzg9P9xb8a+PHkurdgWMQDsDyRW9pW26flFmQIn/rAWEQihrYh?=
 =?us-ascii?Q?E1OeVz+igsnudIPKaKyH/3It0lL40Bw7l3z/6TURNjSdgp4m8Ic9zp+Rl+lC?=
 =?us-ascii?Q?IeqGCEAKwlQMv5birPiP3Pq7qz1muAO9mycoJAhQEiWihVasmDEwAyK/vox5?=
 =?us-ascii?Q?RM8oM+CbIdiNpE6Ka4Mo5UNoSOGxQc0X9McEAhqj0gUMWOc3V2GN1TuUIBmq?=
 =?us-ascii?Q?Ivk0McryEAp5pb8hm5kF+SckPnqps+HBwEgpmPIhVHERGbh7qXt9weVrb78U?=
 =?us-ascii?Q?BDUkWF+jOKFqk5/PruL7mIn5U0QqOQNezTAsvEJI1p9N7ZPf88WKsiEE6ukG?=
 =?us-ascii?Q?8fM/TF9I56oZexnCP2wlyQWVS7nIqX8QiDGjWV0yyebr8XOdgS7YKYWITwF/?=
 =?us-ascii?Q?6bXgR8V1actjvmh4wKusft8ZzmEW0P2NpeYsG3KD5x1ZicAqjReQ35SF9vJz?=
 =?us-ascii?Q?Q9qooAUwsUb7nJANmyVsUneRa/vDOLMHcy9Ls60TmgW9PnCjksoKuu1LKjny?=
 =?us-ascii?Q?Qnu6aTTsxH82OIYBDMKZIC52U7MMWbJRW7It9xpICB1dLGSYk1AHm61be9PO?=
 =?us-ascii?Q?KqAdYEF10VtdIT8hMGNTdM/f2aXwhmytJd/RWzxUny3Tr4ZT3p4qDLSa13XS?=
 =?us-ascii?Q?iSxtRTBQgIOKZi0zFz9h1n0Bllm3vWXzJEPYKEO1Py0JjcxWqtTIwM9Y3PNO?=
 =?us-ascii?Q?bniMin8CdrVTtS/Uzbdoj96NL2JDCTehU/yGrBpYjku8U/07OeBYO2fvp1ao?=
 =?us-ascii?Q?yopb3yI+UwAiWKhkbzpd5cq3X06gCDmMl9piISaLlFqbbiZNKnBLB36Ltdvb?=
 =?us-ascii?Q?ku4ilqV2AT8Se1vZmTWRQ8tcR72MJ58nGr4bWMWvUAF/Go3I17EREAmFKJlo?=
 =?us-ascii?Q?99fW/sXwrHbVnume0tDqgOh6BQsMe9Zn+Ri2y+x+WeXjJ1GQYqvO8m3dv5/g?=
 =?us-ascii?Q?fik4fZaBpv04RU2VUUgadbD+KU6hugSwpVYcfgME7ATGCzHQHaBElxK/TYjn?=
 =?us-ascii?Q?G/LTWZoiHaD9V2wgE18=3D?=
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(7416014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Dec 2025 05:48:30.4561
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ef405a7e-a98f-4bca-24a4-08de42b01157
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000075ED.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR10MB6952
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_214835_797064_D4838D45 
X-CRM114-Status: GOOD (  11.85  )
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


