Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D33DAEDB7F2
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Apr 2026 10:42:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yQRbIJIKrp1TwmDhYhB9Zfx6X03aWZARMa6qioX9YUo=; b=SCnTv+Ekp1fYZCjLn//gyKmKTe
	M9U7kwpxFR6WrY20j1B3ES2Gz981Vk8wBMtciuR7andHKzJPxcYdiU8UzkXhbnDZ6oo3BnMwqWGDc
	kTD1tDC6ifaTzsPCks8ubw0DvGSNTFzb42PDjyuVUtAVoh5HaTIVkrM7eI28sevAsRiC6SRbdB9yU
	fBnCTzA7cimlcXuAiPqv73eILA27KNIufKKmPViXhzWtE+v4CRTLqfUGVvdSee8WpusERI4RrBGTM
	C85AwSCjFtWHgHhalH2F9sh7986ukStgTfM+ToR9TGSGJX9AYQU+c5OSVQouAR2EF1cm0F9m44pA4
	/taD/NLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA3tW-00000006Jkq-04VJ;
	Tue, 07 Apr 2026 10:42:54 +0000
Received: from mail-westeuropeazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c201::6] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA3tR-00000006JgB-1lv5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Apr 2026 10:42:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MynvQSOYbq93zrUNeuU9rTTUYCKeHI/bA8opquIaZpAEgJKL3hf99xMcxpIwsT82sYBmYMDGW3rCDdMdyrn4nLIEYidATvpx9hM082WxobSRLXjIUhHLIXjLqWg8fd8hXxxn4apIriwWmpnyOkE+xWjA1uwbfy/eBmgl14Xze3i3hAEc5nq7/EWcfLZL9RnmxaeXaw/0IVqglOeB28+gLIvFmx1uiGjgwBD+Dw+A7LP8/MiTTEMNM1NFV6GF5zdHNR4GvvLMtOtmBwDVewfLnmGAr3MuXkd2hQsvtAUrGYp1ufITlFMPxCxDtjim7h31KqdSNkBIQO+kPXSj+/LQ7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yQRbIJIKrp1TwmDhYhB9Zfx6X03aWZARMa6qioX9YUo=;
 b=mqzeaAlMniNgUM87oPy1VGWpfG+rF/bVA5wNCrVx//j1IOxATdwju0RksEVukOALLOj2xntdmNaLbfINrC3KzrWtlsk/NAu8opx0b5mWis+tw5acfv2su71TCqlzPW7n2xWt9xpxooR2Jr4XpRxDVSZHUmwZovEZWHbas/guEvBnYhlHso+YcTYJlgFI2vWuqaU/7mdNTfyhcU9VRjEWDzsOuIKJKNNMbU74qZPmf4VoqcaJtFASnMGVwTPoLVYaJj0++tvf0UcZ0jo6dRY2//0jv/jY/9CtZ+4NS5bBmto+ZQZ/HlDYf0VpfWu/vpcUzNdFYFbbKIUkYEm3wc8YOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yQRbIJIKrp1TwmDhYhB9Zfx6X03aWZARMa6qioX9YUo=;
 b=jOFemykDfLa2+sHE3eClVkHBRF10lnZqp/ZlPYnHDeATvFl79gVpTvuj1OmDwOT0XQm2Kq/dz35HteLt3JjrzMof1KZNzaUbDQA2/fvbeTyqipuRfqAhpIU+ELGd3JJTeMzP/njEPUsgHfXB2KKds6ccTfDYTVkBHsTq1NZOjECczicrQQMzM8a1v7VoPzytlmZeUaZ0qUr7L5cpeC3U6VI8meJA7pCIpiCHK7PUzq9sH9JH0RbbYTzZF3yGzPImkk73K3DgtRYi4v+WO049Esi0aw2Q9Axb9jyiPLr/+y2nfgLIxRJaXbuf01a8BkA93cziqetI2vuwgmEeCSuU/Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13) by DB9PR04MB8281.eurprd04.prod.outlook.com
 (2603:10a6:10:25f::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Tue, 7 Apr
 2026 10:42:46 +0000
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994]) by VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994%6]) with mapi id 15.20.9769.018; Tue, 7 Apr 2026
 10:42:46 +0000
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
Subject: [PATCH V11 10/12] arm64: dts: imx8mq: Add Root Port node and PERST property
Date: Tue,  7 Apr 2026 18:41:52 +0800
Message-Id: <20260407104154.2842132-11-sherry.sun@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20260407104154.2842132-1-sherry.sun@nxp.com>
References: <20260407104154.2842132-1-sherry.sun@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA5P287CA0060.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d3::9) To VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI0PR04MB12114:EE_|DB9PR04MB8281:EE_
X-MS-Office365-Filtering-Correlation-Id: c9f2e2c6-b634-493e-46f9-08de949267d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|52116014|376014|7416014|366016|1800799024|38350700014|921020|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: FU5aQxywObTVZ4USsG+sWsmOdUmXfftxHDXE5dPPypPj28VLx6FkRwUNljAQbgUeSCqGxbgwXEhHstaA02gTowxq3zTP+vQWqGrPcLCklWl7d3gSy+JsbskSOWdx93EfOCOpP6WKk+4VOIplTSf8aJTxR2PlqLoyoGwdhXDkqsvqEfcZ/JE8K/ePf8lXTNML8kXW3JX73rCKxlD0yQ+PRokVcyyf44F/rca30AwkGEybYcQ6n7dv1rZHJF6Jzrqy8fQJcadz+HL5aSiFRLfLjqbhbOY7cPxjXnyMM07nDATj4cJGHkUpjntKXVFBQwMEqu3LdZa0dvaHrJKPKjA1qhShUrJoO5WSUas22iLzNX7wEG8zhz3O6MeDvkrOxMt97C3cNN1b3bfvQfiMlLJYYqSn1apVMtfzhZZsl9lDC2DgJl5rOS+3FANjFX3GCz7K0wucm4+8Um5HBiTSIysjEHmIy0gW4MYbM4M3DWiaPmx9/2amd3TIJtchosUQwtNy55g5xqUmOyxU6IfALGuxlulm5wI7Uhc+UaQLhePo5GzonRfRuzT0FyP+iv+CUMt6hc4gj3NJTinOzZLVgDs7BzbX1pc/cXJ6cmV2aL1m6WEJcm0/wqxAKQEk4NBvMwqVUShnuFdGQvqb5WBy7ksVh+n2JWK3Qi/v6sikYwbP8nQEca6+BJ7jXEGkkxKRG1a+HVqAg5QV/bE/vjaQEfEzj84Lm0jHHe9AX6nsBTC4LaPW7Jps1byvq6ai5s3Oolvg7AQt7uUdrEhn0ZU41AJWm8nyG3VJFkyFtMFYQx8spAP5O9VJamkDsJ1YVbYSx71+
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB12114.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(52116014)(376014)(7416014)(366016)(1800799024)(38350700014)(921020)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?34jyQIoPd6IOR3KYywrO25KpLkHXQu60hV0pmJmuihrW28pVUymGCPnSzzaQ?=
 =?us-ascii?Q?7ml9+5Z4pVvBqtizf22ftvnIR0n+iouXsyM9tfuUwuA2bWlUMpdvfljSaJh2?=
 =?us-ascii?Q?5oQat/TYLinmUWxivdXPPMiPLCNZ/alcUqRuPGSquCsYK52DdrZCWQyxvlpE?=
 =?us-ascii?Q?KChejJsbH2x1/3lYqB7IxOS+30FSEmvNK9r2v95wT+uI6mMCLmcetx72eGNe?=
 =?us-ascii?Q?/zeb7vsTvlIo0KMowp79QZuHyPPdjtEBOatm9JFsn+6BTAi3aSFRaeY+zL9b?=
 =?us-ascii?Q?rSVIT1wnI0r6gLC8y6uX2E3A8b+oFfI7uhVIsloygHQKzj28G3ptB18RQAy8?=
 =?us-ascii?Q?vMyRmaUzVgzC048CKjgU6RrUUOhEEU8j47xmkYJApfDhTa4otrs2ceEyj5Bb?=
 =?us-ascii?Q?rXjgRZDY2TOk5eJWm1VoT4o3/Ih6n8JjjyFlQZt0Z50T2hhtoLjlW5j79Q3+?=
 =?us-ascii?Q?KhbDwqb7iiqu8i6BUNxJv/PpKmU4mnNyZybPJ/o86cHqrbTZJR2kr8vI+p+1?=
 =?us-ascii?Q?99sae1Jb3nFP0ZUudjd21koMtYhBTomFnWWfbY3xeE2ZnHDtX4KJwie3RWOO?=
 =?us-ascii?Q?lB0Lf5T3hsvROH/V3VYrqdhlU57YMMdK3VsDwUq+Kc9jab7EQhhKKGaIb8tv?=
 =?us-ascii?Q?paSLSmp9neRr69nEPgVwlg2LPGbWb+FgKXoGmJVFUX1Q6WIcLuzIHU4Lvj0I?=
 =?us-ascii?Q?+UPzMj5XDtd/As2WoHB+hA69iy7aBThNRFKJe14J0cna3Piu/x5yv48GIJox?=
 =?us-ascii?Q?p1/VF7WDmarHXSh31/rUGKwpELdqtOAVl5zYISKogm2LVNn6ItWYveyuTc6v?=
 =?us-ascii?Q?US8c0DnClSYbg7D5Lm0KKb23js69nQTq7FzhLElyEHeV22QxKYFrKZNdh9Na?=
 =?us-ascii?Q?t5wvzyrx8hA3jxaip/EA0pybW6cPqDthtBSmJwWfrkyBGtFBxXuYNebot5of?=
 =?us-ascii?Q?nXkj6gFdE+mBQAr70bYEI4vEZ1hTdYMJT5rz1jjBZta8/EhIouXwrAfP95UN?=
 =?us-ascii?Q?GWutFT2cVxHhAdu0iCBtOs/82hBl8HGAuU6yo/t+4gs6tBhB7FjPH76biYNH?=
 =?us-ascii?Q?Tpu/LfakTtzGHSm1L7PZlLitkx+weXzLtZEadYwsHiypn2TXcV8CIpHc8akK?=
 =?us-ascii?Q?PXDWXQm1gAQc9nRSzPF3tKhUCqMf0TIQPpQO5fLjccXItZizmdB0yOtBdw1b?=
 =?us-ascii?Q?mCDgWDC3tBmtApN+lFNQ1HfPOwz8LOp/ywzgDHytvVPrxx7TiH9rIwDjVSjR?=
 =?us-ascii?Q?h206OrG6yN6SZjyQ0b5CvF3KIKM83eEneZfirCfYvvvw1zEYj1xhtUwvnvKj?=
 =?us-ascii?Q?GzvauiboW1yZkYZpvHqdSiEvjCDv65zL8Pm74piYhN/ZZypMRzDMIZJPTmuo?=
 =?us-ascii?Q?036IF+QSUU/mRKhAJlJgXGC9yxFUXJyNb9Ghlthq0YpvQUVTboVvDgB1JkV1?=
 =?us-ascii?Q?N4ZLZy0tOg0IvWee3/75eZpAsMdCQHBl4AAA1piPprNKVSEZxAydGyekm9HL?=
 =?us-ascii?Q?EvYw2aZwANii1GhZLORLkMET/HMjTsz55QpHdioAUYzhMGBB7+YPy4bOC8Hp?=
 =?us-ascii?Q?xcRHZsczgLaTclq0NJd1zqGWK4wya77xoNU9mYeSChevUGvPkqm63ha+s+l0?=
 =?us-ascii?Q?VKg18bPf7JpZY8N1kSvFkWQGbKBGWUnxKmLXRoSlPFMK0V/1yg1BpNqgKq6x?=
 =?us-ascii?Q?97EhkW7z+7hIUApRr+QfOKeyl6Xc9wy9bswomEAn5OGI/faCEsRJgWH7x4Mo?=
 =?us-ascii?Q?7tBDkgq0KQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9f2e2c6-b634-493e-46f9-08de949267d3
X-MS-Exchange-CrossTenant-AuthSource: VI0PR04MB12114.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2026 10:42:46.3592
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i6yd4DRYUmkEANNCulExYn1+n5JSAMtbJQlMbuxh70UsbFd0p8f8FOL485famyiE2Y30Z9sZwTMxn4Ktv0uh/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8281
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_034249_515800_4EE76460 
X-CRM114-Status: GOOD (  10.55  )
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


