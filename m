Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9584F4BB9C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 10:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ava05WHNzO1jfUGevvoYRh3wq4xwKKoVgpdqBOTSvFY=; b=DolhMKtnVwyZ2REgqR4vez+7Gv
	qoilfyw/VCDsiKT7Tv+SfOgCHyY5oSzyEGa83sMMic9jyL5HeoCqeLlyveTlitowXFB60yEsfjIc9
	yltEtsOW47/+C55rpLelkAuFCowo0NTYbs5oR2Hr/fGG3bOb8gNFhi6P3v2+WefNsDvce0nZl0KIB
	n4dokgsGxi/bTURY0tPIY9SFJWW33Z4faazy87U3LvjKrvx2H2AFhRsr4/32iQtspBHf50JT0Z4+f
	AJ1XfpTNeUSIm3qJyofWVAZlstUen1JPhh4ivWjRxViZL66QzA0Dkf/7PwU98+wpPIybGkn2o1Xet
	lR/Rtbig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvCXV-00000003qin-2und;
	Wed, 25 Feb 2026 10:54:45 +0000
Received: from mail-northeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvCXT-00000003qgs-2rWF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 10:54:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XOpmfE0/B/FR2L8Zs1PgrkjF2k5WU6v5EtIJMqGMBlSeh4Rv/rbSHSa3WeVniUSYnkznqMVqeDj3QsqbhVyf6NWHO3f9sRNt6tRlR/AN/3BZ2VxP42HxBmBNEaaFSoHMWN8gGwN31qhMvLOchzPqZTCOLBqS07D+mmw4/67qZX6Ac1pthnDlIX+TXMxa/qkLn8cQUiPSRemQ0yZIhu0LHcBf3g+7Q5s4JxeEhlNbJnHU/b9uMxoIdpl1ps/BIhOmzcOJ49Jy0Pnc4iIAVo74yzwwEe0QyBUMF8eKh78msbMY1TT7/DJ4se/5I1I6u+EJwuZ9ZMTf+H71QPl41rHLFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ava05WHNzO1jfUGevvoYRh3wq4xwKKoVgpdqBOTSvFY=;
 b=dasGd1uoeosEP2trWRrrQv+hgXWbXLcBsNitw8dCS/dMgw3fvv7VsjkEQzfmpiQukBbnSums6wU48BKvGbuGNwwh2YQ346HuxURwDfFPD2XCepy1V/eiaKlExHQEYPgoYQ+HJSWQXI4k03xtocQ7e5FlZamp8Qu2FIy1v/jNU1LMqtbQJ7RbBm2J7kpaSACJnkIhufA6vY0Rc/2kIuPPJvErg7KkzqDxC16O/1AQOAdrQJGoSKY7gwr8iyCRC2HLqScCVnQMB9kGPVm7g8+lY5k3Q6nwAiw2YCWaC1IBhxT7ujKbQqxmngZEfxZ7ock7CVOBqFmSDoBBZKGNYz8RDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ava05WHNzO1jfUGevvoYRh3wq4xwKKoVgpdqBOTSvFY=;
 b=YlALMSitfsS5DVFxSZlKIQm9q+ZJ2FGC8K26Nzxdh6cYqUe6vOAJ/vm3Pc9s4bXBDeMwkY13DPl1/Ag1SJqqX+WLATvdv412eR8uAUtrWEvPtK0M2FxdQzwTBm6SB77opeuAVd7vxyiZp2UXrkE2991sFeTh15CtK12eEAhHDTXs29almVQbw5DM0K/FhvS9Vl1HO/R30GWePnQm3dmM/6etvd3Rncy57OGb8Vdk03g4NZLBKzSUzMMKqinSehADk/i9/C3CDpLwhLnbTOoSu14mr9xqaUPTvQpAQEL58z7AY+TjUqKQarnCzgIBwbM7CZmkg0a2h2eHkr/DblOPbA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13) by AM9PR04MB7668.eurprd04.prod.outlook.com
 (2603:10a6:20b:2dd::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.23; Wed, 25 Feb
 2026 10:54:38 +0000
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994]) by VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994%5]) with mapi id 15.20.9632.017; Wed, 25 Feb 2026
 10:54:38 +0000
From: Sherry Sun <sherry.sun@nxp.com>
To: hongxing.zhu@nxp.com,
	l.stach@pengutronix.de,
	Frank.Li@nxp.com,
	bhelgaas@google.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	s.hauer@pengutronix.de,
	festevam@gmail.com
Cc: imx@lists.linux.dev,
	kernel@pengutronix.de,
	linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V6 04/12] PCI: imx6: Add support for parsing the reset property in new Root Port binding
Date: Wed, 25 Feb 2026 18:55:15 +0800
Message-Id: <20260225105523.748775-5-sherry.sun@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20260225105523.748775-1-sherry.sun@nxp.com>
References: <20260225105523.748775-1-sherry.sun@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA5P287CA0104.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b5::12) To VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI0PR04MB12114:EE_|AM9PR04MB7668:EE_
X-MS-Office365-Filtering-Correlation-Id: ac14d23b-1e8a-4527-47c3-08de745c452d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|19092799006|1800799024|52116014|376014|7416014|38350700014|921020;
X-Microsoft-Antispam-Message-Info: 6gmQwRLbs88JqgtYIAH6qb8+Nc0SDjm62LpqFQ6VK+keUgBoqyUByNg0ob9OlrnA0XXOLai4DzMtR3eR2vVN3HHZ+W4pLPByfIjOX9HBAYibjJvCmMAIIlc4sfJP5axSxFDe5mTjmrtt+6J/QKZFPWqq5FQ8kWSu8hpW93Pb/tMremksBofKyGHWTu4jtpnvpeLurz48eVdKxlV2GqA6vdq8y+DVp5KEmKxNyk4BKEvF2tbc3Ap1VP5CfL7QVxZ8qNsNgtMKq3YHyLhCV2ySNjarQOsCeXw16/odsaXCLLxONnuvIuFTVeuMatC5XVpxih4kAGY6kExd5x9JLTifK4anJQXp6LAQp7fKAKDX8RByOrYPoY9UGmzMkrETQ4FKUXL90bE92rXWp738j2YbdWPcP0bufNlGpbgZIbo/1ibXneyqyQkrQbOGcSwJcdOTuJrHYP5TkG9BK2EyVJA8SRAGmVJZU1RjvZpOs7ykDfzUC6zXark25JI9R1xEumlE0anM/2bopWOxQ/qGj8LzYePYrLt7gCooZG2qoa2XA/9mKW+RHoSw+q+GH6ftyPA+5QURXVadLfgdsJ2JlLQPecEmDK1ohfuPlIFgC//bnj190FJfSrv++VnJ/niPo+obWikrBAmuZyPkt8c+uo9XA4FQO6XP9JUpIGbS+0A/ftEyGxxSDv8dVzbXOxl4xMhtw9sj99eTo7BfZygHKsoE5e0kuOXTAfH7DuRWFfqmmCVKKdfDF06sS+KWyZVLGOWAN0fJYHsezT5JYPY0wW8J01EytWIJD9EGoLfVekrNAyPkUYRpN1Bb8oPEteOuI/FC
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB12114.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(52116014)(376014)(7416014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MFvk7SALK+DqZ4kkmENP0IMfAkokeVjXSsWiq4yM5nDy8waEfcQz7Gx+eIJs?=
 =?us-ascii?Q?y3tIXou+J3zTrJ9gsUJcr5ibKqKl5DkkfsvAEfk/d5k4A/LD6RrRMuODhkhr?=
 =?us-ascii?Q?3hxm20v33ZFZkVs0MoHbVmdigoCNITBLFbREHUC7xH88aE04gYGxa4GwOhIV?=
 =?us-ascii?Q?1uv9MSS7kdki+9j7XDqua4UQnbtj9mxshSXaFH6JF6qmvTn95kXGT0adP3nQ?=
 =?us-ascii?Q?8fbexskjrSIlKOjvsAHzSEjDDKkCMoud8yzI0RRKXpebjRcsmkdkBn/kvLe6?=
 =?us-ascii?Q?AvkAmmhztZEFxyrP0zBMLAmho8NphsnfpdXXhkr6OEuQiKQcfOTm3vWGOFL3?=
 =?us-ascii?Q?FYnFUeGJjljxoP9XGBsGE2pw9M8Uraw/TRvdqUqzVUOVqb0jCK9VlIHpxM+X?=
 =?us-ascii?Q?2GvxovxB+OI2qdPu46TLMtgzUnQhjBAI0QJW6vse7WqAmboCpyJoVSSXy0Ov?=
 =?us-ascii?Q?lLLfvSTn2irXh5lW3GARRcA0JWnbctVX3Q2fIErIxjYtzv1RvCUcNk+aF8rM?=
 =?us-ascii?Q?uZZ+IG23EGOavuPd+qntDHXSuFYbdstBVx52js/WVODPx63XrT0vZOh/N5SH?=
 =?us-ascii?Q?wgY67c6M/E80S2x13bapmxSczbNaXhjzOp/C8ZOQa0bpfpXedbOKR0c6quv3?=
 =?us-ascii?Q?wBSs+JEGiDhAvD3Z8nl4k8Kd+TGcd7Z4RnGV0d8HqQzfdhqNyX5xkhRnhhDP?=
 =?us-ascii?Q?TMYh/aiOuaJXZGwM+Z2cbhRjvIX66xVcjs43nqbkvxQbu1PfUM3WVXtFXrf3?=
 =?us-ascii?Q?9nwoDqimWMmIGPf+wPLGD46C2Wb1HUQ6rRQOygrONgKJ4ShUqDtqPgVGYhYR?=
 =?us-ascii?Q?CJ0GAS61ejNh3skzacU0Nr98mOuWTj2Yyf6HCmVpxItexZS5iqrYXc6mqOTP?=
 =?us-ascii?Q?8sGGx+9oliX4sD1PzRjxbwv5yfm5qex5m+ljJs5ARtBCqB5YzJDQpzhOo6Jl?=
 =?us-ascii?Q?0nVIKRUc3g267GfuCIMCQUHC3nJQQOWC1JriHUR0ErAXbakiB/Rtp16xgL4/?=
 =?us-ascii?Q?+6f9x3X7svg9f5ym8lzPP5logTRL1CaQzdzF4hPPV9qHjHHa8h1iRayfkhv0?=
 =?us-ascii?Q?bVdDWSN/InB+3QN1CwBiYihh5i1uTLdO0vTNbabuaoQdBHLpbDTx8qdX+kji?=
 =?us-ascii?Q?LrbfMwnlfk0FuO0HOcAY1Ra+3JW5K0++jyU9ILVBK3UfGFkEJ9tq1BAVcq9s?=
 =?us-ascii?Q?cBmcggq+eqj8cw/i1svKjoP7pttctADNBp2Nxc3pqkMFuoNlmgTqY042TrQ3?=
 =?us-ascii?Q?FJ7WO/wWNSPBshxa/RA9SvIz1b//QqcLFlo+luG8AVZRi74whCeqss7Z7oeI?=
 =?us-ascii?Q?0UBFkYkQ4JtVnJ1mm1E7R1DQEh75Z+dnhTePZ5a6Sha5j/DodApvWxt4t9CY?=
 =?us-ascii?Q?FD1YqCPzjg6CqxjQQ4Kgt2C/B1YHt0jgMUj9hY8Wc4+3GLmQcoxULpZrYPII?=
 =?us-ascii?Q?ajLgOtiE4YrCaAZV4r7M/GZleAQuJS0uz+njY7D/ep2mDqC/cLXEqEV2ryrr?=
 =?us-ascii?Q?2a680YJYeKgO4i1xz3r28xrSD8Ubx86jvfk/6h2rM5+hbKVTIOeMmCpUBzye?=
 =?us-ascii?Q?CbceGG1Y3olDejqtvLqjRGJffsMk5dLOr5rHdepPW9i0fvESDoGQqp5kjpdi?=
 =?us-ascii?Q?q6zHg0H0uv1WYPtnPp/uU0C9PBE/iwD1d74THz6yQT5XYu26ZYiCPjBxS7PM?=
 =?us-ascii?Q?HxNBuTB0M/oZoZAjXRbfqvh//LWXMblrEh2MymUd4Os6fg3hmwLEyj5JQZfo?=
 =?us-ascii?Q?ufMRQTlUZg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac14d23b-1e8a-4527-47c3-08de745c452d
X-MS-Exchange-CrossTenant-AuthSource: VI0PR04MB12114.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 10:54:38.1536
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /WZWiwyyp02eBP+mLDcoU7dyjcBkqRwNouREu9vEVRQve1MWyKmcJMjR7owp3plA1UpTC5P5o8kjh/mMC2vREA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7668
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_025443_728040_A410DB6C 
X-CRM114-Status: GOOD (  20.44  )
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

The current DT binding for pci-imx6 specifies the 'reset-gpios' property
in the host bridge node. However, the PERST# signal logically belongs to
individual Root Ports rather than the host bridge itself. This becomes
important when supporting PCIe KeyE connector and PCI power control
framework for pci-imx6 driver, which requires properties to be specified
in Root Port nodes.

With the common Root Port parsing now handled in dw_pcie_host_init(),
update the reset GPIO handling to use the parsed port list from
bridge->ports. To maintain DT backwards compatibility, fallback to the
legacy method of parsing the host bridge node if the reset property is
not present in the Root Port node (indicated by an empty ports list).

Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
---
 drivers/pci/controller/dwc/pci-imx6.c | 76 +++++++++++++++++++++------
 1 file changed, 61 insertions(+), 15 deletions(-)

diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
index a5b8d0b71677..4860575f5005 100644
--- a/drivers/pci/controller/dwc/pci-imx6.c
+++ b/drivers/pci/controller/dwc/pci-imx6.c
@@ -34,6 +34,7 @@
 #include <linux/pm_runtime.h>
 
 #include "../../pci.h"
+#include "../pci-host-common.h"
 #include "pcie-designware.h"
 
 #define IMX8MQ_GPR_PCIE_REF_USE_PAD		BIT(9)
@@ -150,7 +151,6 @@ struct imx_lut_data {
 
 struct imx_pcie {
 	struct dw_pcie		*pci;
-	struct gpio_desc	*reset_gpiod;
 	struct clk_bulk_data	*clks;
 	int			num_clks;
 	bool			supports_clkreq;
@@ -897,29 +897,40 @@ static int imx95_pcie_core_reset(struct imx_pcie *imx_pcie, bool assert)
 
 static void imx_pcie_assert_core_reset(struct imx_pcie *imx_pcie)
 {
+	struct dw_pcie *pci = imx_pcie->pci;
+	struct pci_host_bridge *bridge = pci->pp.bridge;
+	struct pci_host_port *port;
+
 	reset_control_assert(imx_pcie->pciephy_reset);
 
 	if (imx_pcie->drvdata->core_reset)
 		imx_pcie->drvdata->core_reset(imx_pcie, true);
 
 	/* Some boards don't have PCIe reset GPIO. */
-	gpiod_set_value_cansleep(imx_pcie->reset_gpiod, 1);
+	if (bridge)
+		list_for_each_entry(port, &bridge->ports, list)
+			gpiod_set_value_cansleep(port->reset, 1);
 }
 
 static int imx_pcie_deassert_core_reset(struct imx_pcie *imx_pcie)
 {
+	struct dw_pcie *pci = imx_pcie->pci;
+	struct pci_host_bridge *bridge = pci->pp.bridge;
+	struct pci_host_port *port;
+
 	reset_control_deassert(imx_pcie->pciephy_reset);
 
 	if (imx_pcie->drvdata->core_reset)
 		imx_pcie->drvdata->core_reset(imx_pcie, false);
 
 	/* Some boards don't have PCIe reset GPIO. */
-	if (imx_pcie->reset_gpiod) {
-		msleep(100);
-		gpiod_set_value_cansleep(imx_pcie->reset_gpiod, 0);
-		/* Wait for 100ms after PERST# deassertion (PCIe r5.0, 6.6.1) */
-		msleep(100);
-	}
+	if (bridge)
+		list_for_each_entry(port, &bridge->ports, list)
+			if (port->reset) {
+				msleep(PCIE_T_PVPERL_MS);
+				gpiod_set_value_cansleep(port->reset, 0);
+				msleep(PCIE_RESET_CONFIG_WAIT_MS);
+			}
 
 	return 0;
 }
@@ -1233,6 +1244,44 @@ static void imx_pcie_disable_device(struct pci_host_bridge *bridge,
 	imx_pcie_remove_lut(imx_pcie, pci_dev_id(pdev));
 }
 
+static int imx_pcie_parse_legacy_binding(struct imx_pcie *pcie)
+{
+	struct device *dev = pcie->pci->dev;
+	struct pci_host_bridge *bridge = pcie->pci->pp.bridge;
+	struct pci_host_port *port;
+	struct gpio_desc *reset;
+
+	if (!bridge) {
+		dev_err(dev, "Bridge not allocated yet\n");
+		return -EINVAL;
+	}
+
+	/*
+	 * For DT backward compatibility: if no Root Port nodes were parsed
+	 * (indicated by empty ports list), parse reset-gpios from the host
+	 * bridge node.
+	 */
+	if (!list_empty(&bridge->ports))
+		return 0;
+
+	reset = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
+	if (IS_ERR(reset))
+		return PTR_ERR(reset);
+
+	if (!reset)
+		return 0;
+
+	port = devm_kzalloc(dev, sizeof(*port), GFP_KERNEL);
+	if (!port)
+		return -ENOMEM;
+
+	port->reset = reset;
+	INIT_LIST_HEAD(&port->list);
+	list_add_tail(&port->list, &bridge->ports);
+
+	return 0;
+}
+
 static int imx_pcie_host_init(struct dw_pcie_rp *pp)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
@@ -1240,6 +1289,10 @@ static int imx_pcie_host_init(struct dw_pcie_rp *pp)
 	struct imx_pcie *imx_pcie = to_imx_pcie(pci);
 	int ret;
 
+	ret = imx_pcie_parse_legacy_binding(imx_pcie);
+	if (ret)
+		return ret;
+
 	if (imx_pcie->vpcie) {
 		ret = regulator_enable(imx_pcie->vpcie);
 		if (ret) {
@@ -1688,13 +1741,6 @@ static int imx_pcie_probe(struct platform_device *pdev)
 			return PTR_ERR(imx_pcie->phy_base);
 	}
 
-	/* Fetch GPIOs */
-	imx_pcie->reset_gpiod = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
-	if (IS_ERR(imx_pcie->reset_gpiod))
-		return dev_err_probe(dev, PTR_ERR(imx_pcie->reset_gpiod),
-				     "unable to get reset gpio\n");
-	gpiod_set_consumer_name(imx_pcie->reset_gpiod, "PCIe reset");
-
 	/* Fetch clocks */
 	imx_pcie->num_clks = devm_clk_bulk_get_all(dev, &imx_pcie->clks);
 	if (imx_pcie->num_clks < 0)
-- 
2.37.1


