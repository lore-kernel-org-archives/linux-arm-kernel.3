Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FE73F8A15E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Apr 2026 11:14:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yQRbIJIKrp1TwmDhYhB9Zfx6X03aWZARMa6qioX9YUo=; b=pxxa9NyRxW4L92pLcdMnDiZcdY
	uuxXUxsktiuEBCWLtgEPr21Jm7TX81vZP1DtHi4hsVT3x7NgjeIzaMCRxqwjfc9Prp4CQBsP6lRdd
	OvRxh83i/gmSVJs1DX0EXrrm/rxkGhbKt13yRt2OuEtlboNOQ5whtd6hBAb8FmSdr/SIE+yZ/L9o5
	PFf3sJCDULeyL3nuuN22mz2gCBiymz6hmMqc9BBpPmD+s8uqZCASkB1ZulQAyEORLKMbJozGGxKY+
	6NJf6C+8TMlAtH4XGdQth/6FXb2yjUGCy77XExfdMnMtkpclBlNQ3FznxnUC0kOWkOAAdgsYIgJSJ
	QvmaGxQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDKfi-00000002MQc-230p;
	Thu, 16 Apr 2026 11:14:10 +0000
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDKff-00000002MMg-2djT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Apr 2026 11:14:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oamXD/WvVhvhO7I+bOvh29OJVAKanB41IvbkomYzZndRSkCMvCaa/0YSM/6ZxtnNQoBZ+evmItFDzbHLOHq7OdLLtDTcUCKU4esdDoop+WUWGoUkyrDHyORI/ZnW7uMD1eJAws5yaRpmGvxkKfQep3etN/YpMN7gYM9VWgFpDR63gTkeqvQfbfK/9X41VO3qVWgPpTZWfh/N1p51PnVWA8mKFXOCzrb9qQt4WZo6KCZlvpMdW9syS38UyUZf9HuJ/8Gh7fsrpbFyjw+LuoPviNiKWc6LBVUR8qTyFeL19/g0kDwAC6odY9tpsHACLBXKlsy+fY0Gv0aC/8cw+FOPXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yQRbIJIKrp1TwmDhYhB9Zfx6X03aWZARMa6qioX9YUo=;
 b=p/1ebMdsC+9u3lCu3hsVYpUNNZx5FXDgZVKiqUFZzPzs1xg+3EZnsA5bZz3TDnvYJG+iKOTEQcM9yKTObyeGbhenIX0qBbbwlkOmr4fw0Vcr8uhX89aRZ7VOCtmm34CjEMfbvrRW1E0G7qYIpYwI07WDHl+N0GGF0Z+p/1AluI1PgF2pKJ1WaB/kJxvaeyUMq1VWzSx8W61BhRaCNlg8B9TxcGtqWZ/P/cyDqfArimtMErzXLo8JZqIvXS1qUl+NYQbUxY1mrASu+ZwEKiG7KrMEjkSqpt73yHhqsefd59ZqPUguvIcsa1M9QzMjS77nP5mvDGckYy0zS9+ya+Y94Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yQRbIJIKrp1TwmDhYhB9Zfx6X03aWZARMa6qioX9YUo=;
 b=DgRCY7oSg7aoSFFvuNwl7afWbCDl6cJNq78PRxqldYeE8JIUq8u8ZExs9WC9WtivrMvx+pLzNaUSYHM16ISutcWmzjk9J2igull7HNPiX7xtIoVUCGNYegIN8IZkOWzhIecI5QOHdi8e0VCuFVsGO23EIMUBjRjhQjIoFNVxrm5cQWbzxQuYtXiLHzoadYXzvHNuA1u6CvEFPZReDxqYnwKMc00GhW5IckYqotrrR8wYZnpTFyhpXQoPe3VvMQEVpoe/sbZtRvWBRLUTRkOtyQwEpdCs7dELaRGnxiTdf3UUvMOKpddDNx5cDXbC+Uxkcmie7wicFDr0tA1bW7Rs+g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13) by DBBPR04MB7897.eurprd04.prod.outlook.com
 (2603:10a6:10:1e7::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.21; Thu, 16 Apr
 2026 11:14:03 +0000
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994]) by VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994%6]) with mapi id 15.20.9818.023; Thu, 16 Apr 2026
 11:14:03 +0000
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
Subject: [PATCH V13 10/12] arm64: dts: imx8mq: Add Root Port node and PERST property
Date: Thu, 16 Apr 2026 19:14:20 +0800
Message-Id: <20260416111422.183860-11-sherry.sun@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20260416111422.183860-1-sherry.sun@nxp.com>
References: <20260416111422.183860-1-sherry.sun@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA0PR01CA0076.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::17) To VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI0PR04MB12114:EE_|DBBPR04MB7897:EE_
X-MS-Office365-Filtering-Correlation-Id: 074376b8-98f2-4c0e-3b53-08de9ba9447e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|19092799006|7416014|376014|52116014|1800799024|38350700014|921020|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: GKuJkLpCpiyoyuP53uk22/qB0U7OwGK7J9/J313o+EESP13acEs2yiLWIDCw2JzP68qfjxMTN3XGQHk5MIs/xpc9OY/fQCsAnyEWtbbZqsyHkZclNaLBbCJ0cmZ9lc9rbxmptUiYNO1PVOJrtRLX5jrIjlX5wtKisjU7MnYuP1j1lCcDj/gcG3iQL32+QzoCV93Nd38mXtXO5v41PIxGJH0yK2EiEliPtoWd8BfYzDMXz3ssjdqlJwamar5j3WObyVc61VjfCvNxSAFRw1258AD/KTxM5ZKIjathFcntbkS8WLafvSncHyfoLhVUxder5ubuPTpDXEtLvRLmaNcYNpL4mP2W+mRJQxdPiwIIohbmvknLm8aNh7KYyM/IO6t4sWlJgK4qaWt3LvC9LP9lxtTAXnJV7ELCw63Ywm7ZML0GeroZE/WVjnkP3qO5yuu5Kcf19yQmyXcy8JANxzD8CBpy7spe5WymnVPJwmiNQ3b4s/fIX5SDLOHclF+e0K3N2KoB6l2TVy4F/c0Mmu9GhLMoMR1n+/5Wy9woPBqqb93+hdPoZoTQdhRVns30nQGXjXO+4ANgVsHY1uKJaZladZPzMyIWxW3bRvIAELNPBhLCcdhbLBtj2ODtJ2lf3vVni9Y7cfg9QBOk2q03xK070ozWRGsXogCxHq4rtPZm80KgaFOigTC2O47PZf6NaHqMjZ1751Xfo+L/MLcD2WvuV0P9jx3o08MkSXfGP78I4yZlrdLg+3xYUFGW+Pn4Upl1kI1nrrgaRNsVsPxwL36BqAC+c+zAaLbGfly9iwFP3G/Rn3pJfTtMLvSPGALnXE5Z
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB12114.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(7416014)(376014)(52116014)(1800799024)(38350700014)(921020)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?riujvBByuEjZsPTtGWRkkDCDdn+qcIQGLHQ2i6e+SCqFfjwt3bwpm5MC83Ap?=
 =?us-ascii?Q?loarYtNqmQQUeRvnuk8XHjBq2bOXGEXjW8CM+huv/oZ9c4rKGyJo+Kc5ihLI?=
 =?us-ascii?Q?5aQ5Y3DBJVhOWCRLRpJ/Kcsz+r6YdUR+YDUGMarjahdvA3O8psQqAYvzpMjM?=
 =?us-ascii?Q?P7GEc2giZRMBDOO5qNXAts8sigMGUhOEBKnDak02ii+kP8Fl5JhLLgjWZ+X1?=
 =?us-ascii?Q?OAbI/5X4sJSDpYYc5y5Mgaj31unGSLqnbgLG+PzXhVujfCC98t1y5J+Y+enJ?=
 =?us-ascii?Q?GkvUGMsCm532bw7YysdcRJ+ck5WSuKWZui38rYiS7Qgs/jmYLfJZsKSEiZYI?=
 =?us-ascii?Q?JH+7oTftQwp3z5z2MNFSSF/GvTzBpMW9ZHVxb7R3zSZixXcB98C8PQQrJimc?=
 =?us-ascii?Q?sWq1DCl+jcJryoFczouSb1TSAzNHVttDzVV5oX6rR0tirKy09kuO7kNev2OE?=
 =?us-ascii?Q?EOCxnHFqMPBTLY/OiNp39udI6bdxIMl/GnLbnEuoZx+b3BR80EPJuREA19Ld?=
 =?us-ascii?Q?bUqW3wk+6zui10XbMnbyR130ogcgtOWjmej+NFujbmGUC91Y+Er4LPYVqsbt?=
 =?us-ascii?Q?7y1UZl6+c13rLu4IlC8befbDoK+GA7yK0dmPKqDpjaM3tlFw39Nk44T9xpr9?=
 =?us-ascii?Q?DxlMbg4qrrdS0c2rPJgjgxvUoBsGp6k2FihUHyIbIs1dWLooVXgzwX+44rae?=
 =?us-ascii?Q?rdwwH0aOOEkxIYzyhUg3e2oPqnScH4SRtZA6fLqymnXPihoDQUlqvgmXMQFd?=
 =?us-ascii?Q?12Rwr/BLE2/dvIpP7y6MAax9vH4PFJt+WeMIj9novDKYRSOCpzIn0JmLQrwe?=
 =?us-ascii?Q?uA2EZmH7Jh1nAts6bNfEk/6MFIRNlLS3DchmscuGSzSjt93ZjAjnPrUGoDt8?=
 =?us-ascii?Q?rRTUwRKwyY1UoJZwoagDKMP1B3WdyYQPgqg+1OHC9pvxwFTZKnozz056mOzT?=
 =?us-ascii?Q?LSdn9neMQRzUBx7MI4KK7t3OtgbjXl4LZgxAKjJwvjvLRioRbJXfx2xyuGZI?=
 =?us-ascii?Q?U6sN8MVNS1pSu+1g3TUEYciyXF8HptbnfUEotpH15IM2bQGQWzQSlfg51BBq?=
 =?us-ascii?Q?brYX5yPLh8PhJzh1N0oolc5HpRZi5MS9IzI3zhJ3+qjpofjdwCrK1+pnaC80?=
 =?us-ascii?Q?a3qpenbSNPQ108GhsD7C/C2vFuoMjMpeBkpjbFRYKLR4YJ4w0yxjTXMZCgDJ?=
 =?us-ascii?Q?eQKS1KWyQBNW8oTvC0aBZb0LPqF+Bd1wGgjLDMoRg7gX16dky+vXlFfPLKQ0?=
 =?us-ascii?Q?CMs0d/cWF1PwzjaJRl+TicCAIjC40mt68klnlBhe73G29YH7usAK80011H8P?=
 =?us-ascii?Q?DI6quoFYkS2t1j+YC35HEPkVCq4t30ivCg1NaSMA4F8DqS1kPjZ2/9fPUxjD?=
 =?us-ascii?Q?pxYLGcLFbahCF2avrJE1JJp4Szs7LFG9fyG/zR5L1INZbnVHx0zfpmeQrLlH?=
 =?us-ascii?Q?DJ4GRx7V2rLKJYoS+ObGmqtIMfbgdkpJyvW1VwLVIEjI0i2meGDTcQvbPvcB?=
 =?us-ascii?Q?iICjvZCg2avn9PQoFbhb9DtHtJPwfAkxjsQwGA6JofQYKWdj/xG7qWDH7yjV?=
 =?us-ascii?Q?DTtCeDnZ9xR/IGGX+FcfcRCd3CKh8MSG5IgyHCJSK2YAwO/Wc+ecFLhtRCzW?=
 =?us-ascii?Q?tH/Z4Tl+ivylntM2WirChL7DvmZ2YrkUIT9sSR8DjmwexJqgM3CX2OlBflvg?=
 =?us-ascii?Q?EADmKwmBQFDRQxM/5+KsPUIKr/8ev8P7iosJBL4D7w2RF/MBrLy0YYPDFsRo?=
 =?us-ascii?Q?q2TcTR6zhA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 074376b8-98f2-4c0e-3b53-08de9ba9447e
X-MS-Exchange-CrossTenant-AuthSource: VI0PR04MB12114.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2026 11:14:03.6208
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ERnO7kflBYsNCZ0bT6+R/H7R6N/PbpGA37bjQLFfm4LP3qFodpLeH8W820TZyosioDcL9d+G10wPccSQ57hQ+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7897
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260416_041407_668698_5427317A 
X-CRM114-Status: GOOD (  10.18  )
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

Since describing the PCIe PERST# property under Host Bridge node is now
deprecated, it is recommended to add it to the Root Port node, so
creating the Root Port node and add the reset-gpios property in Root
Port.

Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mq-evk.dts | 10 +++++++++
 arch/arm64/boot/dts/freescale/imx8mq.dtsi    | 22 ++++++++++++++++++++
 2 files changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq-evk.dts b/arch/arm64/boot/dts/freescale/imx8mq-evk.dts
index d48f901487d4..e7d87ea81b69 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mq-evk.dts
@@ -369,6 +369,7 @@ mipi_dsi_out: endpoint {
 &pcie0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie0>;
+	/* This property is deprecated, use reset-gpios from the Root Port node. */
 	reset-gpio = <&gpio5 28 GPIO_ACTIVE_LOW>;
 	clocks = <&clk IMX8MQ_CLK_PCIE1_ROOT>,
 		 <&pcie0_refclk>,
@@ -389,9 +390,14 @@ &pcie0_ep {
 	status = "disabled";
 };
 
+&pcie0_port0 {
+	reset-gpios = <&gpio5 28 GPIO_ACTIVE_LOW>;
+};
+
 &pcie1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie1>;
+	/* This property is deprecated, use reset-gpios from the Root Port node. */
 	reset-gpio = <&gpio5 12 GPIO_ACTIVE_LOW>;
 	clocks = <&clk IMX8MQ_CLK_PCIE2_ROOT>,
 		 <&pcie0_refclk>,
@@ -414,6 +420,10 @@ &pcie1_ep {
 	status = "disabled";
 };
 
+&pcie1_port0 {
+	reset-gpios = <&gpio5 12 GPIO_ACTIVE_LOW>;
+};
+
 &pgc_gpu {
 	power-supply = <&sw1a_reg>;
 };
diff --git a/arch/arm64/boot/dts/freescale/imx8mq.dtsi b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
index 6a25e219832c..e60872aeeb49 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
@@ -1768,6 +1768,17 @@ pcie0: pcie@33800000 {
 			assigned-clock-rates = <250000000>, <100000000>,
 			                       <10000000>;
 			status = "disabled";
+
+			pcie0_port0: pcie@0 {
+				compatible = "pciclass,0604";
+				device_type = "pci";
+				reg = <0x0 0x0 0x0 0x0 0x0>;
+				bus-range = <0x01 0xff>;
+
+				#address-cells = <3>;
+				#size-cells = <2>;
+				ranges;
+			};
 		};
 
 		pcie0_ep: pcie-ep@33800000 {
@@ -1846,6 +1857,17 @@ pcie1: pcie@33c00000 {
 			assigned-clock-rates = <250000000>, <100000000>,
 			                       <10000000>;
 			status = "disabled";
+
+			pcie1_port0: pcie@0 {
+				compatible = "pciclass,0604";
+				device_type = "pci";
+				reg = <0x0 0x0 0x0 0x0 0x0>;
+				bus-range = <0x01 0xff>;
+
+				#address-cells = <3>;
+				#size-cells = <2>;
+				ranges;
+			};
 		};
 
 		pcie1_ep: pcie-ep@33c00000 {
-- 
2.37.1


