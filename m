Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DD59F36B9F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 02:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Oetyax/zJKsWLe34r4BV8nO3nP8kzMsqayC38SLS5ZQ=; b=3vEyrrRfFVM6KKJZCri9GAhD+d
	cI86bwp1dDQg/MBmGxygisiLMeH5uHzD/ejLs4uhrtYQoJHHqHqw0AKui9FlsvH0t+PcoVi9ThoHx
	+r4Z1YAo9b/DC/KV2sZPdnhzKn7RlNu6YYCdnlZc4/4VxU9DQuZiYUH0LBIZWOXJ5YUPKh0iuE+eK
	BTbtWOvJB+vce4KUC/tIra4wnbb6KHB+/LBnqwLXJTeEoX8i+FqBklw59bg22J5PP0e5VSzhf9Alv
	Oty6RjLJ2FVMSZ8Pwc2OdkCoHG84x1xUP9+i/jJd64Sbce069zJMx7ae+aPbT3lJ0H5xmSb/u/bv2
	3ZDDoI3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB1d8-0000000BSVB-0Yzq;
	Fri, 10 Apr 2026 02:29:58 +0000
Received: from mail-westeuropeazon11011016.outbound.protection.outlook.com ([52.101.70.16] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB1d5-0000000BST9-3SFx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Apr 2026 02:29:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ssM/gWSSn4nK9DRgfMxsbeubsmfsF6hSfQRxaIT7TiFALeLKYaQ4aGFhzpUsTGXIpt8yuRg4mBICxalcQoPNZyUi5pyB5lS9J1+Acazw3ZFyZwSemiywMPBCD9gpaIP6aGP+RZn97wZXFPuoe8VFKLxw7a97oalishORrI/BugbbKPobcA8WbNRVx9wFGo9pYxPbzFD4C0Yp7ksCrsiidNtQFM/97p1c9E4tZTrsYg6YgyU90jvmpWnfJJwt9xducQKt1gFouDI8ehZo3TaXrgq91kleTARahDqCpJjXaNTnLdm54TxdCF+qDUVUFUrn7iKtBH4y610FRUuJiPd/ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Oetyax/zJKsWLe34r4BV8nO3nP8kzMsqayC38SLS5ZQ=;
 b=GZji00QScJMgdiqszasYoQ0u/tMJhc4Ursfp2g2+7C960ldzzElCKL5mjkqPPSuJjEh0WDmnVwssCKUsGFzYLbGs5Y3WBIqGSXYibCnCROLAnKw6ZmysGUQTzmptO9gtfpgeSwDH0tkVuDkaWgv++3fK81qT1Y0zEd2Erw02BcuiM4+e/xsHA89IrP2OeQ22vdXV0KWBR7eP1T3rTijHgKtzimxpUnz9WiC7w3QXYlysCKf8JZtSknSwPRX014naReFCCRWeL+lfy275LNDjJZlOOmcVLBJaHkUvzpjUwupqZGxrytK+/8bchRWs25f2zMbz6kYfpCV5H/OfSMDJMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oetyax/zJKsWLe34r4BV8nO3nP8kzMsqayC38SLS5ZQ=;
 b=CDrMSJJmsNlytcQWIceY3Ra4WZoue42tM7cH9EPsV5+yScpqptLGZ2quJ14v4UUPGeL03DFo66zvWtdAyEo1VnYVHG7IiEPb3L+NvCcejMQPqxE+s+z1NPZlEEy7fTzETdN9cgXqwbwoKt5OzyKU/kVSJSxoLfSsXTjhdc9gXoKr3NR0nAlBrDTBShyzqDWHwRS6sBXmut6nI/3cRmZWqaMwVOqiSJEqx2cghD5/JFpGgrTQ8HhZOI+jh5z8/YV5TWumxtaBwkdD7nGZ0okZX41T9HH2TuIhQ/q46OhWoUKor+E3pVa8ouG32vJFiuC+76CVHeaUJogrwNx6MtO6aA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13) by AS5PR04MB9826.eurprd04.prod.outlook.com
 (2603:10a6:20b:673::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.42; Fri, 10 Apr
 2026 02:29:53 +0000
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994]) by VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994%6]) with mapi id 15.20.9769.018; Fri, 10 Apr 2026
 02:29:53 +0000
From: Sherry Sun <sherry.sun@nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	bhelgaas@google.com,
	hongxing.zhu@nxp.com,
	l.stach@pengutronix.de
Cc: imx@lists.linux.dev,
	linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V12 03/12] PCI: imx6: Assert PERST# before enabling regulators
Date: Fri, 10 Apr 2026 10:30:46 +0800
Message-Id: <20260410023055.2439146-4-sherry.sun@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20260410023055.2439146-1-sherry.sun@nxp.com>
References: <20260410023055.2439146-1-sherry.sun@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0020.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::9) To VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI0PR04MB12114:EE_|AS5PR04MB9826:EE_
X-MS-Office365-Filtering-Correlation-Id: a78ac298-cd06-4de6-e507-08de96a90c02
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|19092799006|52116014|7416014|376014|38350700014|921020|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: NXO5/HNJAdxfIg1EJqSYs4Y1yiuoKWkisJV+be4BmZP/Hgj2T1Ice2pluCNMdjL5+hSf1wO8itqDhYGElbqQ46Njc0nfUVsDyVaR77RY/u5/axYtAdkbwtgLoOuN9W1LED9Y7mzCwqADr/Ws6TktLloddgRinmV+z6xB8kxk5yX1pDhZkVffCGJs7T7FrzYfH/pYvSwq4KGOds5MnZaXx7uTCDz5W1xZ88dI5a9Lav+jFkczZTCx7YuKzYge03eSJRFEdB5z9QB6WKTzbNPLQ+iG6LdOXspH13pXbDOOY0FMp1nLQeXZDp0xXvePVy505AMQNl5B/hOybNhxOXVHKKCSZW0AcvURrw7JWbK36WEIQiZlCps0GWMnF0LxuGqjpYmFTe6xtkj/+hcU1P/jro44tkEEdzbAUOxBEm0M99JvwvaUzOCFTQD7q3/TUCJ3o+haVeVHgnjjMElbDdbTdhUFPMFOx3H1Tek+8tYqoirWejT/uXpBFdiBv1J52f6IEW0EN7aUmb4G8DJN7YqkPUGncnv/p0WJserTjoADcMLHc4dIlhMDhd0o3FUXIj18dYbWn6dxCwjWPRYOvlZZljRwrNTy1z5kH9EWZidBu+3hHqdiFifPUb7ACqmkTCKvw7nmJpizoGpbqf1D5ODHk6cPOl0NlDBtiBNcIl6ALLAIcANVtTdDwKekMxVl0xwBk/R/K/fQG76mImP6u42oHkgjYSNhkR7LNaz5ttY+HWQQQVxIvoOTvRjM2tyrZtdS38RUjxbzrvXMJiBxaFfNq/aSAEysNgFu5pWDJqj/WDb0YcEngueNAg9J1MOvVpgs
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB12114.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(52116014)(7416014)(376014)(38350700014)(921020)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PvPfq0hQrOutZ3sYjZyrJs6b6IN1svsDMfSMxpQuwPJptV6ZfXhvsi+bNo3o?=
 =?us-ascii?Q?8mmNwPeBc0GRsBmD+loLFhlBO98b0bppEX1IGbik/QCXt+EY2Qw5wP0tD3kH?=
 =?us-ascii?Q?q2xejI0CeFbFMEa88sDnfYz6J4UUGTFPJ9wSdsDV+SXM+B+tLEhgixm0yzFQ?=
 =?us-ascii?Q?rAiF2hUIITe3Una2NZRuMEDxmdruj5IhG0tQkTgdWGv984IUp8FX9oSXo8wO?=
 =?us-ascii?Q?Lp/dZgt1U5yuiUWrmZ9aXUqr6eEWUCkxneYfuTUmcPkCA519KmderBpTBLSz?=
 =?us-ascii?Q?nPAIZOe+0vX1YanSuhSh49dsPWQWlx8BDFNkX96EO9mbUopxFQHD5bfmRcuO?=
 =?us-ascii?Q?/d52USrBpQPPiCJnt95axKOOWYorw+/QJvrmF4rfWYqw0cp7k3ENHbzXktD0?=
 =?us-ascii?Q?Lv+XSLtCXsNkVkeK5m9I2NT3woFgewrt7GNOs4lp1cUdKnGN02gW21rSFFs2?=
 =?us-ascii?Q?KaY745fuUQr1T4t5K3IpbOdF02ObKh27Ade6L/m0pHYKhKgMyp+tETq9eMt9?=
 =?us-ascii?Q?lEaMU/AdCVXzW+mkezLf0rQew2gk/ryV0ARqEHEgX+hzqwl1M5KsvElIGfXA?=
 =?us-ascii?Q?DxoFw2ZBNVJPPvo2Qjj/bQGu5VJgPoBuWmQZV3fzUi2y2AHhYVyEwCquxaU8?=
 =?us-ascii?Q?bC/Ts2HqoeICnk4XweAE1/mKuwqO3Inrfn1pvcHEC24ek84+iTAXsBHCRL8P?=
 =?us-ascii?Q?Qs1QNR3EtBlE5T/OYduMoR4UUqmUCtcBw6eIVE6xLnspfziybkBw7YHx1hv+?=
 =?us-ascii?Q?vSDD69NKpPjB8snSJ3W4O85OuTloam1ujAmhcrhAd59ifWyumd5R/e4CyQjH?=
 =?us-ascii?Q?7hZbIkX/ATLOUAV9EjIOG+vwBm1vvAXG7p05W6+xsB+aP7dyT3yCxz3u/2Im?=
 =?us-ascii?Q?cHedA5LFq0eOUi0/aIYZ1UPxXJtDw1TJzarVGTbt4UzLkzk/iPU0SbCteb8c?=
 =?us-ascii?Q?NvGMwljuDQYewm+hkAr7v9yH5r/y6rkU13N5ScHu9DKXV4HZ5cn+uy6uJm9Z?=
 =?us-ascii?Q?sPEr9xBRsU5dJ+MwSYp+sBCsgq7BCXxmAX1Bd/nf1fWcsEQssxaT2tflXnSt?=
 =?us-ascii?Q?chsBr+fWWTg9g0KDRlo1q38MNAY2XDbvcUAUgE62xLvHZTXa8ClIlJQ0YWWT?=
 =?us-ascii?Q?3bGPT3i1MPWyRVZkXvAyGaVBEh/o//q77wVqsRYvBvs+iEK6ftSGDL2b+l5s?=
 =?us-ascii?Q?BQTRIGHmVFUla06+dvDgpj2VyLMuKDKPIQJgdEWzUOSBRAMDIoTo1f+j6DKb?=
 =?us-ascii?Q?O70mfjQTmOmkaV3dvjkXVPgqpo4L7dTIP2N81uyQUlJORlWXrYs0zFJxooY9?=
 =?us-ascii?Q?RVk+CqCLXYdQfAXaXzYiinaqiBWvarHiLaN2stjQmGqeojoVXEYtneZf1FOX?=
 =?us-ascii?Q?cS4WNOg6yoQgIF6H4lbjcA0AJNvnZv4NJrWM24zTExQmocMTFU85LZK4Alke?=
 =?us-ascii?Q?OjFUbiDY8uMVq5Q68S0xzmYThD+DAZ3FWORq5nsG0KF1W2LUVadxV36l7uZs?=
 =?us-ascii?Q?DKKYvH7Lv59dXV61gv93AvEbnwrEDMAiD7ZtwnwzbY6xrZYeyexQiy1oEM7h?=
 =?us-ascii?Q?zUKdD0E3oFfjODB12UsrWBMiQuqKB1LJ0eYgjR537SvTsH9d4WLvca1FQUYy?=
 =?us-ascii?Q?2yp5Qn3Af02Z6ErcTK1K2/4rJm+wmWGefBtlWh29wxXTKWUFSzAJ6pFaDiw+?=
 =?us-ascii?Q?B7DGtvI19+pIsg86dTegXxLzPUnbshrBBkDKYDAn4EcqRugYF7idmAE8fDL5?=
 =?us-ascii?Q?40A0tz/omg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a78ac298-cd06-4de6-e507-08de96a90c02
X-MS-Exchange-CrossTenant-AuthSource: VI0PR04MB12114.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2026 02:29:52.9682
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kUYRISYHLrk0Yesz0npnmieClaf6FTzsF37oqSrPGPpixTMXFXI8Bs3zxyhhdEec6VXQtx1qcsQoGODE8HrwTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9826
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_192955_858639_F61C4D40 
X-CRM114-Status: GOOD (  18.13  )
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

The PCIe endpoint may start responding or driving signals as soon as
its supply is enabled, even before the reference clock is stable.
Asserting PERST# before enabling the regulator ensures that the
endpoint remains in reset throughout the entire power-up sequence,
until both power and refclk are known to be stable and link
initialization can safely begin.

Currently, the driver enables the vpcie3v3aux regulator in
imx_pcie_probe() before PERST# is asserted in imx_pcie_host_init(),
which may cause PCIe endpoint undefined behavior during early
power-up. However, there is no issue so far because PERST# is
requested as GPIOD_OUT_HIGH in imx_pcie_probe(), which guarantees
that PERST# is asserted before enabling the vpcie3v3aux regulator.

This is prepare for the upcoming changes that will parse the reset
property using the new Root Port binding, which will use GPIOD_ASIS
when requesting the reset GPIO. With GPIOD_ASIS, the GPIO state is not
guaranteed, so explicit sequencing is required.

Fix the power sequencing by:
1. Moving vpcie3v3aux regulator enable from probe to
   imx_pcie_host_init(), where it can be properly sequenced with PERST#.
2. Moving imx_pcie_assert_perst() before regulator and clock enable to
   ensure correct ordering.

Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
---
 drivers/pci/controller/dwc/pci-imx6.c | 49 +++++++++++++++++++++------
 1 file changed, 39 insertions(+), 10 deletions(-)

diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
index 915061ea75b9..d99da7e42590 100644
--- a/drivers/pci/controller/dwc/pci-imx6.c
+++ b/drivers/pci/controller/dwc/pci-imx6.c
@@ -168,6 +168,8 @@ struct imx_pcie {
 	u32			tx_swing_full;
 	u32			tx_swing_low;
 	struct regulator	*vpcie;
+	struct regulator	*vpcie_aux;
+	bool			vpcie_aux_enabled;
 	struct regulator	*vph;
 	void __iomem		*phy_base;
 
@@ -1222,6 +1224,13 @@ static void imx_pcie_disable_device(struct pci_host_bridge *bridge,
 	imx_pcie_remove_lut(imx_pcie, pci_dev_id(pdev));
 }
 
+static void imx_pcie_vpcie_aux_disable(void *data)
+{
+	struct regulator *vpcie_aux = data;
+
+	regulator_disable(vpcie_aux);
+}
+
 static void imx_pcie_assert_perst(struct imx_pcie *imx_pcie, bool assert)
 {
 	if (assert) {
@@ -1242,6 +1251,24 @@ static int imx_pcie_host_init(struct dw_pcie_rp *pp)
 	struct imx_pcie *imx_pcie = to_imx_pcie(pci);
 	int ret;
 
+	imx_pcie_assert_perst(imx_pcie, true);
+
+	/* Keep 3.3Vaux supply enabled for the entire PCIe controller lifecycle */
+	if (imx_pcie->vpcie_aux && !imx_pcie->vpcie_aux_enabled) {
+		ret = regulator_enable(imx_pcie->vpcie_aux);
+		if (ret) {
+			dev_err(dev, "failed to enable vpcie_aux regulator: %d\n",
+				ret);
+			return ret;
+		}
+		imx_pcie->vpcie_aux_enabled = true;
+
+		ret = devm_add_action_or_reset(dev, imx_pcie_vpcie_aux_disable,
+					       imx_pcie->vpcie_aux);
+		if (ret)
+			return ret;
+	}
+
 	if (imx_pcie->vpcie) {
 		ret = regulator_enable(imx_pcie->vpcie);
 		if (ret) {
@@ -1251,25 +1278,24 @@ static int imx_pcie_host_init(struct dw_pcie_rp *pp)
 		}
 	}
 
+	ret = imx_pcie_clk_enable(imx_pcie);
+	if (ret) {
+		dev_err(dev, "unable to enable pcie clocks: %d\n", ret);
+		goto err_reg_disable;
+	}
+
 	if (pp->bridge && imx_check_flag(imx_pcie, IMX_PCIE_FLAG_HAS_LUT)) {
 		pp->bridge->enable_device = imx_pcie_enable_device;
 		pp->bridge->disable_device = imx_pcie_disable_device;
 	}
 
 	imx_pcie_assert_core_reset(imx_pcie);
-	imx_pcie_assert_perst(imx_pcie, true);
 
 	if (imx_pcie->drvdata->init_phy)
 		imx_pcie->drvdata->init_phy(imx_pcie);
 
 	imx_pcie_configure_type(imx_pcie);
 
-	ret = imx_pcie_clk_enable(imx_pcie);
-	if (ret) {
-		dev_err(dev, "unable to enable pcie clocks: %d\n", ret);
-		goto err_reg_disable;
-	}
-
 	if (imx_pcie->phy) {
 		ret = phy_init(imx_pcie->phy);
 		if (ret) {
@@ -1782,9 +1808,12 @@ static int imx_pcie_probe(struct platform_device *pdev)
 	of_property_read_u32(node, "fsl,max-link-speed", &pci->max_link_speed);
 	imx_pcie->supports_clkreq = of_property_read_bool(node, "supports-clkreq");
 
-	ret = devm_regulator_get_enable_optional(&pdev->dev, "vpcie3v3aux");
-	if (ret < 0 && ret != -ENODEV)
-		return dev_err_probe(dev, ret, "failed to enable Vaux supply\n");
+	imx_pcie->vpcie_aux = devm_regulator_get_optional(&pdev->dev, "vpcie3v3aux");
+	if (IS_ERR(imx_pcie->vpcie_aux)) {
+		if (PTR_ERR(imx_pcie->vpcie_aux) != -ENODEV)
+			return PTR_ERR(imx_pcie->vpcie_aux);
+		imx_pcie->vpcie_aux = NULL;
+	}
 
 	imx_pcie->vpcie = devm_regulator_get_optional(&pdev->dev, "vpcie");
 	if (IS_ERR(imx_pcie->vpcie)) {
-- 
2.37.1


