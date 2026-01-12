Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C52FDD25030
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 05:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1wxUHTQPpYuJtALTPPAfj2EvEc5t4sXZ5ndjEbQ5ZSs=; b=T6WHvS1CfueSYtyMmX5ay519rh
	vYvUIJRJyJmbu0GGgM8qs011uSDi5BBCziVfx4q0eQs2kEtlKw1CGiFclrLf3q6wHRANzk+ZK30z/
	xUG8jyYPdL0Ex4rpHXEROHuuXp9R2IeB3pg+cnKJJ6JmqFJhV8Grfdu4lH96VgHJbKebEOSB/4El9
	LNcNSDDVrEi7qzJuKb3UNwf4vPslgImZ9KoobL/LUifAbwhZViU0lJ8iylkYY6iMlNVZCXhm2ADZY
	QFTeqXegtYNRQXc4gdzt5KfzJYmoWCo1ccaxSqtIRo0woZw/8imYeo0i+OD19hO8mlZDlwb/HOPoV
	qkJlUdmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfAkf-00000004nCG-0pyV;
	Mon, 12 Jan 2026 05:46:05 +0000
Received: from mail-westus2azon11012004.outbound.protection.outlook.com ([52.101.48.4] helo=MW6PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfAkc-00000004nAn-38nB;
	Mon, 12 Jan 2026 05:46:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SmHGReFuGxEW34t8bYIUEkC36drocefSKuRY67e2HV6AXAMUQAD5OrECf4EA2RDOzbZqLjPzUVtCTwEj141eWyN4Fk7m8y3+g/JoCkwHiP7aunIEeqoWAkQ65nHxDLFAEXlTxEh5zHsHWDUMlOrqXX8Nn/AokcJoMLN/Kc/xrkJtV0szDXJvQ48ykfC4Tl5I9V5Rae2b1hcWr8BpwgBNs9sOsRvbJOjINQ19vYXG9nMAPDUREtDCeTcQZQBaE5z2jsne/S3YngvxAlqlMvJ5bhmJ1j8EG5ooOtMhelK2fKuwLlm8pEZijv8iuC87h2EV3TQ2/DCJBYPxkjwZrN0miQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1wxUHTQPpYuJtALTPPAfj2EvEc5t4sXZ5ndjEbQ5ZSs=;
 b=TIc0SApyBsCumpZFCv/0BUYP+fqi6i//Stvq0ofo+4zv1JVhK3Fxgof8BBweO7Bpyv5lf66YwD22reY6hd8dmtSjsuv9t31N324qdh9sAcFqeNPJH0BogaqSRGn85ivah2qCS9iSfjQbjqN5xo99SWYnKSs2G4j0jiKPDrD1NzB4bz2yER9q5q8kkJ+CkpIXjzjpIiRMddvRUEzOL9wJ8PRPIuW3FEPjSdntsh9xsFGT/V/CM7Yx1V+L1RN3EVWFW4wTqNxDNovEwxJF4n8M77RJdiF/LKpQGctUuSQRRkUNHswvKQkcnX8oq2qa0UNFdRp++XncNvt1Q+N0bLxZdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1wxUHTQPpYuJtALTPPAfj2EvEc5t4sXZ5ndjEbQ5ZSs=;
 b=Gmgy8U/gBf1pFpV9aIfbFMkKRuagdmmqfkGtovp5wZ0i8zxNp2EO4epenC07o17FDZyn3AjPj+xvvFfByPG8kQcFMJSLboGug9wPEKnb6GiVIWuEcAZd0aZMjB7QFJFeFLeY/VVBYB1OMZYc1jf2ZDbu+E1mVHYhA7dZnTTQbXg=
Received: from CH2PR14CA0001.namprd14.prod.outlook.com (2603:10b6:610:60::11)
 by IA1PR10MB7335.namprd10.prod.outlook.com (2603:10b6:208:3d8::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Mon, 12 Jan
 2026 05:45:58 +0000
Received: from CH1PEPF0000A345.namprd04.prod.outlook.com
 (2603:10b6:610:60:cafe::62) by CH2PR14CA0001.outlook.office365.com
 (2603:10b6:610:60::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.7 via Frontend Transport; Mon,
 12 Jan 2026 05:45:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CH1PEPF0000A345.mail.protection.outlook.com (10.167.244.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Mon, 12 Jan 2026 05:45:57 +0000
Received: from DLEE202.ent.ti.com (157.170.170.77) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sun, 11 Jan
 2026 23:45:55 -0600
Received: from DLEE210.ent.ti.com (157.170.170.112) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sun, 11 Jan
 2026 23:45:55 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Sun, 11 Jan 2026 23:45:55 -0600
Received: from toolbox.dhcp.ti.com (uda0492258.dhcp.ti.com [10.24.73.74])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60C5jeQA4153405;
	Sun, 11 Jan 2026 23:45:51 -0600
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: <vkoul@kernel.org>, <neil.armstrong@linaro.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <sjakhade@cadence.com>,
	<rogerq@kernel.org>, <thomas.richard@bootlin.com>
CC: <andrew@lunn.ch>, <linux-phy@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <srk@ti.com>, <s-vadapalli@ti.com>
Subject: [PATCH v3 2/2] phy: cadence-torrent: Add PCIe + XAUI multilink configuration for 100MHz refclk
Date: Mon, 12 Jan 2026 11:16:31 +0530
Message-ID: <20260112054636.108027-3-s-vadapalli@ti.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20260112054636.108027-1-s-vadapalli@ti.com>
References: <20260112054636.108027-1-s-vadapalli@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A345:EE_|IA1PR10MB7335:EE_
X-MS-Office365-Filtering-Correlation-Id: e64ced8a-2c0b-4c27-6b91-08de519ddc1d
X-LD-Processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|34020700016|82310400026|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?R9JjaFTAIAquHk4NVXQ/R7Q0xNd1ern4WAzb+OCzdbSnd3hExoKl47RK/OG1?=
 =?us-ascii?Q?uA2c4tQCdoMs6IYiWQ3UpFrB0m5hNJ5KkvQtdz7cerX2QbXwlqjN49iT9ZNV?=
 =?us-ascii?Q?+1CuyhHQNWAm9CTlo/h6LTglSgrIOVGUtvUcQr+BxcS3RixwHOlIczjQ7W9c?=
 =?us-ascii?Q?jK+PysEyWJTqhmhtTep6ApvYx8Zd5Bky09+oIYvjdSsekM+N6RReloiqm/Ef?=
 =?us-ascii?Q?fuJEoI2LZBj7YO63B9Ej/PYgMrKXZWvwHT6ZuOWwa3ms3l7KDCZ09FSq3IBm?=
 =?us-ascii?Q?FveFTwiFKDrZQaBnFUQCGaaYu9Egzsv+EsPHLzvR1WY/TdKc+VVZKSGNwVXu?=
 =?us-ascii?Q?JjorRcf93tCVSzXV8NWPjr2RfPp2p4gaGXMrkk4wf1Ua8LZQI9mLsalp/zH8?=
 =?us-ascii?Q?dlhge3XSQphEkL1orwgsYCmezYmS0SLPNA4OheoePrXnRGlsvZXHw6c0qc90?=
 =?us-ascii?Q?zj2/C+MsXer/IPq7IVWRapdip9kL8jhXNwskhF4h64hVeO9t6zs4FKPIr9/p?=
 =?us-ascii?Q?gG0FVZB9v2Ku2raLrws8btk1pg9eEIFk3UnwNMHGWT32Oz41ln9K+1aT3fmR?=
 =?us-ascii?Q?UDb8d9WrgFyZL/8cXJ+otweZvRFUfLF7AXaf761jYhz09dBtAZLI5Mbu/bva?=
 =?us-ascii?Q?cSxrOlC5MzP8wEsImXmHpCGEEu7T8zSwfPSkq1ahmo8baywrSzRJJVYa081W?=
 =?us-ascii?Q?YZmYGxlCMxrd7RF1DF7MSGbqdzq+GyaIXE2ucnVNBbAtSvETEWmQkBuQcImu?=
 =?us-ascii?Q?mWaJ+qo/N+3hxfzLx4ityuH6glahHaYOylL88zOlAOiBQf0Pv/fZ/Fnb2wuS?=
 =?us-ascii?Q?HiqQM1+aYxDqtjrFVi8+/C9aKNR7gM4psP+V6/MfBcotYVbk6yDVaL4nOBR6?=
 =?us-ascii?Q?W0OQ1qo0kgExN0khwgi2WfFK8wBWzvu6E+/syt1K6me4qeqlzAaIljVg6MPU?=
 =?us-ascii?Q?jM7GjQVtp4/Qj1H88RWxbHrylb5ZKxMRkuP4OIxUeW7uFjErE6YPNAFtuqMs?=
 =?us-ascii?Q?qUR2DjUCBWZEo1nenLhNKr6ZDIdL9ETwhp0Vd/HubATKjKDJs34Kom7fx3Mu?=
 =?us-ascii?Q?tpLvOB0FuANE6CluElPypTIND0vxXOkK6bPHOcytGVXH8SXKQSrcaY4lqWhE?=
 =?us-ascii?Q?WPiH1K1OGAF71qWEhbPRMcpfGLHDVmo3x5PqvN1BrWGt3YelxSRM0a1kO1d4?=
 =?us-ascii?Q?JSZtDuJxzeJgp8n8NsfmnwQhPYqHdf3Ji63uBcQeMP6wzBlHOwQT1MPsB+x0?=
 =?us-ascii?Q?TJlMyGOLOo5H0STL6PMFB0ajQj6hpFR67K+VB6JYxstLlwjw2jxXbMDVhIs7?=
 =?us-ascii?Q?16bhqfQbIrZ7G0jVxSwEn5duBD+VwX56AZMx0wBrspd4EuNKiPyz4CD4X1Z9?=
 =?us-ascii?Q?6RtsF6oAro5wzKS/RA3RUdLdty8iMe5r0PiCw3f1o6cD3AjcXSZf9sJF+Mxu?=
 =?us-ascii?Q?D1qc2rx2KSdoDD2PgbQjYNhnjLYwWbFxZ+wCO+3ir4wSgBaSLXJXkp6n5Pvq?=
 =?us-ascii?Q?E7WJwWVM/C7VXI0niRTO8tpNTyX+cIPKKVleP3n1nK/m0SzDqw0t0hsw4RxI?=
 =?us-ascii?Q?n0VR3YjjK11JL4GuPgXWS4O4d3DBXmEoGd5cjdvL?=
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(34020700016)(82310400026)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 05:45:57.6827
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e64ced8a-2c0b-4c27-6b91-08de519ddc1d
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000A345.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB7335
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260111_214602_859347_9A4705BE 
X-CRM114-Status: GOOD (  15.37  )
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

The register sequences are fetched from a table by indexing entries based
on unique 'keys' generated by the Bitwise OR defined below:
	REFCLK0_RATE | REFCLK1_RATE | LINK0_TYPE | LINK1_TYPE | SSC_TYPE

As of now, LINK_TYPE is a 3-bit value corresponding to the PHY type.
With the introduction of TYPE_XAUI, we need a 4-bit value to represent
the LINK_TYPE as TYPE_XAUI has the numerical value 8. Hence, extend the
LINKx_MASK macros to 4-bit masks. While at it, extend REFCLKx_MASK macros
as well to 4-bit masks to support reference clock frequencies that will be
added in the future.

Adjust the 'LINKx_SHIFT' and the 'REFCLKx_SHIFT' macros to account for
the aforementioned changes made to the masks.

Signed-off-by: Swapnil Jakhade <sjakhade@cadence.com>
[s-vadapalli: elaborated on changes made to macros in the commit message]
Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
---

v2 of this patch is at:
https://lore.kernel.org/r/20260104114422.2868321-3-s-vadapalli@ti.com/
Changes since v2:
- The commit message has been updated to explain the changes made to the
  LINKx_MASK/SHIFT and REFCLKx_MASK/SHIFT macros to address feedback from
  Andrew Lunn <andrew@lunn.ch> at:
  https://lore.kernel.org/r/7fd42221-d602-4ce4-9f7f-6754ed91e7aa@lunn.ch/

Regards,
Siddharth.

 drivers/phy/cadence/phy-cadence-torrent.c | 143 ++++++++++++++++++++--
 1 file changed, 136 insertions(+), 7 deletions(-)

diff --git a/drivers/phy/cadence/phy-cadence-torrent.c b/drivers/phy/cadence/phy-cadence-torrent.c
index 877f22177c69..d446a0f97688 100644
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
 
@@ -709,6 +710,8 @@ static const char *cdns_torrent_get_phy_type(enum cdns_torrent_phy_type phy_type
 		return "USB";
 	case TYPE_USXGMII:
 		return "USXGMII";
+	case TYPE_XAUI:
+		return "XAUI";
 	default:
 		return "None";
 	}
@@ -3021,6 +3024,9 @@ static int cdns_torrent_phy_probe(struct platform_device *pdev)
 		case PHY_TYPE_USXGMII:
 			cdns_phy->phys[node].phy_type = TYPE_USXGMII;
 			break;
+		case PHY_TYPE_XAUI:
+			cdns_phy->phys[node].phy_type = TYPE_XAUI;
+			break;
 		default:
 			dev_err(dev, "Unsupported protocol\n");
 			ret = -EINVAL;
@@ -3405,6 +3411,95 @@ static DEFINE_NOIRQ_DEV_PM_OPS(cdns_torrent_phy_pm_ops,
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
@@ -4876,6 +4971,7 @@ static const struct cdns_torrent_vals_entry link_cmn_vals_entries[] = {
 	{CDNS_TORRENT_KEY_ANYCLK(TYPE_PCIE, TYPE_USB), &pcie_usb_link_cmn_vals},
 	{CDNS_TORRENT_KEY_ANYCLK(TYPE_PCIE, TYPE_DP), &pcie_dp_link_cmn_vals},
 	{CDNS_TORRENT_KEY_ANYCLK(TYPE_PCIE, TYPE_USXGMII), &pcie_usxgmii_link_cmn_vals},
+	{CDNS_TORRENT_KEY_ANYCLK(TYPE_PCIE, TYPE_XAUI), &pcie_xaui_link_cmn_vals},
 
 	{CDNS_TORRENT_KEY_ANYCLK(TYPE_PCIE_ML, TYPE_USB), &ml_pcie_usb_link_cmn_vals},
 
@@ -4902,6 +4998,8 @@ static const struct cdns_torrent_vals_entry link_cmn_vals_entries[] = {
 	{CDNS_TORRENT_KEY_ANYCLK(TYPE_USXGMII, TYPE_PCIE), &pcie_usxgmii_link_cmn_vals},
 	{CDNS_TORRENT_KEY_ANYCLK(TYPE_USXGMII, TYPE_SGMII), &usxgmii_sgmii_link_cmn_vals},
 	{CDNS_TORRENT_KEY_ANYCLK(TYPE_USXGMII, TYPE_QSGMII), &usxgmii_sgmii_link_cmn_vals},
+
+	{CDNS_TORRENT_KEY_ANYCLK(TYPE_XAUI, TYPE_PCIE), &pcie_xaui_link_cmn_vals},
 };
 
 static const struct cdns_torrent_vals_entry xcvr_diag_vals_entries[] = {
@@ -4916,6 +5014,7 @@ static const struct cdns_torrent_vals_entry xcvr_diag_vals_entries[] = {
 	{CDNS_TORRENT_KEY_ANYCLK(TYPE_PCIE, TYPE_USB), &pcie_usb_xcvr_diag_ln_vals},
 	{CDNS_TORRENT_KEY_ANYCLK(TYPE_PCIE, TYPE_DP), &pcie_dp_xcvr_diag_ln_vals},
 	{CDNS_TORRENT_KEY_ANYCLK(TYPE_PCIE, TYPE_USXGMII), &pcie_usxgmii_xcvr_diag_ln_vals},
+	{CDNS_TORRENT_KEY_ANYCLK(TYPE_PCIE, TYPE_XAUI), NULL},
 
 	{CDNS_TORRENT_KEY_ANYCLK(TYPE_PCIE_ML, TYPE_USB), &ml_pcie_usb_xcvr_diag_ln_vals},
 
@@ -4942,6 +5041,8 @@ static const struct cdns_torrent_vals_entry xcvr_diag_vals_entries[] = {
 	{CDNS_TORRENT_KEY_ANYCLK(TYPE_USXGMII, TYPE_PCIE), &usxgmii_pcie_xcvr_diag_ln_vals},
 	{CDNS_TORRENT_KEY_ANYCLK(TYPE_USXGMII, TYPE_SGMII), &usxgmii_sgmii_xcvr_diag_ln_vals},
 	{CDNS_TORRENT_KEY_ANYCLK(TYPE_USXGMII, TYPE_QSGMII), &usxgmii_sgmii_xcvr_diag_ln_vals},
+
+	{CDNS_TORRENT_KEY_ANYCLK(TYPE_XAUI, TYPE_PCIE), &xaui_pcie_xcvr_diag_ln_vals},
 };
 
 static const struct cdns_torrent_vals_entry pcs_cmn_vals_entries[] = {
@@ -4983,6 +5084,8 @@ static const struct cdns_torrent_vals_entry cmn_vals_entries[] = {
 
 	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_DP, NO_SSC), NULL},
 
+	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_XAUI, NO_SSC), NULL},
+
 	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE_ML, TYPE_USB, NO_SSC), &ml_pcie_100_no_ssc_cmn_vals},
 	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE_ML, TYPE_USB, EXTERNAL_SSC), &ml_pcie_100_no_ssc_cmn_vals},
 	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE_ML, TYPE_USB, INTERNAL_SSC), &ml_pcie_100_int_ssc_cmn_vals},
@@ -5033,6 +5136,8 @@ static const struct cdns_torrent_vals_entry cmn_vals_entries[] = {
 
 	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_USB, TYPE_DP, NO_SSC), &usb_100_no_ssc_cmn_vals},
 
+	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_XAUI, TYPE_PCIE, NO_SSC), &xaui_100_no_ssc_cmn_vals},
+
 	{CDNS_TORRENT_KEY(CLK_156_25_MHZ, CLK_156_25_MHZ, TYPE_USXGMII, TYPE_NONE, NO_SSC), &sl_usxgmii_156_25_no_ssc_cmn_vals},
 
 	/* Dual refclk */
@@ -5077,6 +5182,8 @@ static const struct cdns_torrent_vals_entry cdns_tx_ln_vals_entries[] = {
 
 	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_DP, NO_SSC), NULL},
 
+	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_XAUI, NO_SSC), NULL},
+
 	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE_ML, TYPE_USB, NO_SSC), NULL},
 	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE_ML, TYPE_USB, EXTERNAL_SSC), NULL},
 	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE_ML, TYPE_USB, INTERNAL_SSC), NULL},
@@ -5127,6 +5234,8 @@ static const struct cdns_torrent_vals_entry cdns_tx_ln_vals_entries[] = {
 
 	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_USB, TYPE_DP, NO_SSC), &usb_100_no_ssc_tx_ln_vals},
 
+	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_XAUI, TYPE_PCIE, NO_SSC), &xaui_100_no_ssc_tx_ln_vals},
+
 	{CDNS_TORRENT_KEY(CLK_156_25_MHZ, CLK_156_25_MHZ, TYPE_USXGMII, TYPE_NONE, NO_SSC), &usxgmii_156_25_no_ssc_tx_ln_vals},
 
 	/* Dual refclk */
@@ -5171,6 +5280,8 @@ static const struct cdns_torrent_vals_entry cdns_rx_ln_vals_entries[] = {
 
 	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_DP, NO_SSC), &pcie_100_no_ssc_rx_ln_vals},
 
+	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_XAUI, NO_SSC), &ml_pcie_100_no_ssc_rx_ln_vals},
+
 	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE_ML, TYPE_USB, NO_SSC), &ml_pcie_100_no_ssc_rx_ln_vals},
 	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE_ML, TYPE_USB, EXTERNAL_SSC), &ml_pcie_100_no_ssc_rx_ln_vals},
 	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE_ML, TYPE_USB, INTERNAL_SSC), &ml_pcie_100_no_ssc_rx_ln_vals},
@@ -5221,6 +5332,8 @@ static const struct cdns_torrent_vals_entry cdns_rx_ln_vals_entries[] = {
 
 	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_USB, TYPE_DP, NO_SSC), &usb_100_no_ssc_rx_ln_vals},
 
+	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_XAUI, TYPE_PCIE, NO_SSC), &xaui_100_no_ssc_rx_ln_vals},
+
 	{CDNS_TORRENT_KEY(CLK_156_25_MHZ, CLK_156_25_MHZ, TYPE_USXGMII, TYPE_NONE, NO_SSC), &usxgmii_156_25_no_ssc_rx_ln_vals},
 
 	/* Dual refclk */
@@ -5301,6 +5414,8 @@ static const struct cdns_torrent_vals_entry ti_tx_ln_vals_entries[] = {
 
 	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_DP, NO_SSC), NULL},
 
+	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_XAUI, NO_SSC), NULL},
+
 	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE_ML, TYPE_USB, NO_SSC), NULL},
 	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE_ML, TYPE_USB, EXTERNAL_SSC), NULL},
 	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE_ML, TYPE_USB, INTERNAL_SSC), NULL},
@@ -5351,6 +5466,8 @@ static const struct cdns_torrent_vals_entry ti_tx_ln_vals_entries[] = {
 
 	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_USB, TYPE_DP, NO_SSC), &usb_100_no_ssc_tx_ln_vals},
 
+	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_XAUI, TYPE_PCIE, NO_SSC), &ti_xaui_100_no_ssc_tx_ln_vals},
+
 	{CDNS_TORRENT_KEY(CLK_156_25_MHZ, CLK_156_25_MHZ, TYPE_USXGMII, TYPE_NONE, NO_SSC), &usxgmii_156_25_no_ssc_tx_ln_vals},
 
 	/* Dual refclk */
@@ -5429,6 +5546,8 @@ static const struct cdns_torrent_vals_entry ti_j7200_cmn_vals_entries[] = {
 
 	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_DP, NO_SSC), NULL},
 
+	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_XAUI, NO_SSC), NULL},
+
 	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE_ML, TYPE_USB, NO_SSC), &ml_pcie_100_no_ssc_cmn_vals},
 	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE_ML, TYPE_USB, EXTERNAL_SSC), &ml_pcie_100_no_ssc_cmn_vals},
 	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE_ML, TYPE_USB, INTERNAL_SSC), &ml_pcie_100_int_ssc_cmn_vals},
@@ -5479,6 +5598,8 @@ static const struct cdns_torrent_vals_entry ti_j7200_cmn_vals_entries[] = {
 
 	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_USB, TYPE_DP, NO_SSC), &usb_100_no_ssc_cmn_vals},
 
+	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_XAUI, TYPE_PCIE, NO_SSC), &xaui_100_no_ssc_cmn_vals},
+
 	{CDNS_TORRENT_KEY(CLK_156_25_MHZ, CLK_156_25_MHZ, TYPE_USXGMII, TYPE_NONE, NO_SSC), &sl_usxgmii_156_25_no_ssc_cmn_vals},
 
 	/* Dual refclk */
@@ -5523,6 +5644,8 @@ static const struct cdns_torrent_vals_entry ti_j7200_tx_ln_vals_entries[] = {
 
 	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_DP, NO_SSC), NULL},
 
+	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_XAUI, NO_SSC), NULL},
+
 	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE_ML, TYPE_USB, NO_SSC), NULL},
 	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE_ML, TYPE_USB, EXTERNAL_SSC), NULL},
 	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE_ML, TYPE_USB, INTERNAL_SSC), NULL},
@@ -5573,6 +5696,8 @@ static const struct cdns_torrent_vals_entry ti_j7200_tx_ln_vals_entries[] = {
 
 	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_USB, TYPE_DP, NO_SSC), &usb_100_no_ssc_tx_ln_vals},
 
+	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_XAUI, TYPE_PCIE, NO_SSC), &ti_xaui_100_no_ssc_tx_ln_vals},
+
 	{CDNS_TORRENT_KEY(CLK_156_25_MHZ, CLK_156_25_MHZ, TYPE_USXGMII, TYPE_NONE, NO_SSC), &usxgmii_156_25_no_ssc_tx_ln_vals},
 
 	/* Dual refclk */
@@ -5617,6 +5742,8 @@ static const struct cdns_torrent_vals_entry ti_j7200_rx_ln_vals_entries[] = {
 
 	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_DP, NO_SSC), &pcie_100_no_ssc_rx_ln_vals},
 
+	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_XAUI, NO_SSC), &pcie_100_no_ssc_rx_ln_vals},
+
 	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE_ML, TYPE_USB, NO_SSC), &pcie_100_no_ssc_rx_ln_vals},
 	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE_ML, TYPE_USB, EXTERNAL_SSC), &pcie_100_no_ssc_rx_ln_vals},
 	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE_ML, TYPE_USB, INTERNAL_SSC), &pcie_100_no_ssc_rx_ln_vals},
@@ -5667,6 +5794,8 @@ static const struct cdns_torrent_vals_entry ti_j7200_rx_ln_vals_entries[] = {
 
 	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_USB, TYPE_DP, NO_SSC), &usb_100_no_ssc_rx_ln_vals},
 
+	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_XAUI, TYPE_PCIE, NO_SSC), &xaui_100_no_ssc_rx_ln_vals},
+
 	{CDNS_TORRENT_KEY(CLK_156_25_MHZ, CLK_156_25_MHZ, TYPE_USXGMII, TYPE_NONE, NO_SSC), &usxgmii_156_25_no_ssc_rx_ln_vals},
 
 	/* Dual refclk */
-- 
2.51.1


