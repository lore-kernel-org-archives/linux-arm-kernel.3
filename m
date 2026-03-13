Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4535A106FD66
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 02:09:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yQRbIJIKrp1TwmDhYhB9Zfx6X03aWZARMa6qioX9YUo=; b=S/uTU+3WUnoKPMH3A6c4lKaIkc
	QNrSx2BHurxlL/wO2jHkOQMO4PjUIGHi7ZixtEOsbpcUKELdR+t8xdA2V71PPEJO+XofExc7OfZdH
	7Nd7alYCJ4PNtmvRRi0QNxRES2gEfnt2Qo0oS1KlvOuFXY7RLjMIHI+2/+5Z5UtYcV+zPFRt00rvH
	6gXTkFxAUQCf390C3krEFIlBxTmN30ekMdgkMM91vPqd5y+Fwal7++u8PmLRAvhoMJPrKo0VeVnOI
	mNV0Qn8E5NikafLuBvFKl2lEozBCyW1QifQvrmqJuQXqjCsl0Wcj1Bq/HbkiB8uYOt5tD7P1vlr+m
	p29c2TwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0rxY-0000000GAbq-0oUP;
	Fri, 13 Mar 2026 02:09:04 +0000
Received: from mail-northeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0rxT-0000000GAVA-3Gbn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 02:09:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MQAXuntQRwuS2lyw46wtAi7aLpZCgrd74jRfXt3Dov7Iczg987Hay0f9O+EZk8kud/KFNcyO8S/KZHHFad+KwJAjgVIzU31m+HnhrGTL8MTO/NkpBu4rU7D6cxGQX4TYCWWzZbbPTJlRIuU6lJHidAom8r8+ZSZ02yK6qqst0UmFPIBUnnRGbdNthnNqmt+luRt7ekdqoK1tUohkN812VTNnJPzMhrD9m3CQU1MHltHg6VBt2xdBOfMt7KgpV9rPufpUmq3ar1JuLOfr6VpykMfw9F1z4r+k/RD6fjugrA48XAkHv6b3p1dRIUdnABlKG/I6UeBCzwtqtBKCrrp/cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yQRbIJIKrp1TwmDhYhB9Zfx6X03aWZARMa6qioX9YUo=;
 b=Uv/gH2cA9tYzMbVBM+FUzb8yUqeB9r9OowvbDgi6MiQgdzmPhve5FJcJ2DEzcR7t+U/TwkkofMh6DuEkYR4YecSEb9/x2YXogb0MEJVdnqYwZW6Ir/EkgTMKKJqS0r30Cp71KYfumHCo4wKat1F8vse1x/bwabULUlchouT+aOQ4KpwCqQMnvlofdsruPoNbfn/VQnkAexAzT9tRNSMf0j6hgs1+yzvTdms3BZayjvRG+qtcwG8XzOn+QTzLBcKxq/zaJYjhhVB7cD/T6lFhucJtybntFICQairoAXDcxiHCxkk29prl6e1AsWmxQ2ofJ6VavjEPQTuy+SpEPZN9Sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yQRbIJIKrp1TwmDhYhB9Zfx6X03aWZARMa6qioX9YUo=;
 b=cDGmBZ/vVOTyc4fh4RJBo4k0h5XEmrBUNSR4l7UaVmLKve7h9E3nEm5jlJIB70gw5975WEZ3KHlNloGqptHbYVARURlC0MLw7r8kDoICehO96tbgoR9/ghTgWwFveUI7g8CG35RfvQBtG7aEDl5Qx7QHptF5y0tGMFzIxfMXBeeYqb13VcpaTTrWh0+7660INk4Pr3ZGVPAXWAoGFa7PMld4AGTuf7atpm62IQ+eCzU7Nr/IIU7BPatQqncbucRRWKlSqPq7N/7B3LQFgrrI6RB4mKdTjYipayBY1+sNVLv4OLvVchEDbdcjCZx4wFak16gQTAG2cEmA0dWbP2mQGw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13) by DB8PR04MB6844.eurprd04.prod.outlook.com
 (2603:10a6:10:112::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.15; Fri, 13 Mar
 2026 02:08:40 +0000
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994]) by VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994%5]) with mapi id 15.20.9700.010; Fri, 13 Mar 2026
 02:08:53 +0000
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
Subject: [PATCH V8 11/13] arm64: dts: imx8mq: Add Root Port node and PERST property
Date: Fri, 13 Mar 2026 10:08:21 +0800
Message-Id: <20260313020823.1592389-12-sherry.sun@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20260313020823.1592389-1-sherry.sun@nxp.com>
References: <20260313020823.1592389-1-sherry.sun@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0020.apcprd02.prod.outlook.com
 (2603:1096:3:17::32) To VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI0PR04MB12114:EE_|DB8PR04MB6844:EE_
X-MS-Office365-Filtering-Correlation-Id: 81ec077a-ba45-4f35-cded-08de80a5799a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|19092799006|52116014|376014|921020|38350700014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 4LuKF9BjIlRMj3pW4JZWw6QT/wIzl/Ga041dSrUmObd0iLGg9/Mz6QbE21QIWMgMFF2oG4Keej672KNXsZDgL+Bd+ojUBrVzO/WyP+ZaybVJmoGdQ0V5Zw1+ouPNDxtON7ChoNdE41hZqQqXXQav/bl3QbEdhOvGoCVMbN7zm0pFq45wiu9bIfJX8cb2UGAe1MPv8fmORj3jyyboet9CtguTf8A5Y6EgYzCVVDZDA46m802KPuljtL8qfWend1RkMmKjN8tgzfqupMKHGTrYyrbEPnYjVtpoHvZFc5FVmybBTC2tJ3rQPKZAr/HD+CHdR9pDamkKUkq6ogflLdt+ty24sJ69rR2ed4W47t0LtDPU8iyXgl1rL3cIavvFPF32Uy29RnBVeUOHfwRx7QMh27J1ePXb02T8YC6c/aRe5wSJ+nGeSvSbXV34Og3gVT2J595FRJgOeTMqCuQRpKIf9lBFbfEziIKRiTCDT5XgK7cUUmDm/OdUYNKCmgr6uRbuYst2SyvrtTjrK99IwH3I4udLYXClQCvHacYw2awEVTMEIHp/Ufg7KDhR6oJQhaavB2DS7AX/k+V+SruhUACRs5KYmDBMUoohIE2Q4pA3mR6w82vJR4vEfvLdHWRRrvEgiqhS8aVcXlX3CAnHoBwrWhbIxhoRhy3OAPZjjrbvBsdhqlorSK8Wb1VbvEgry9QrxOgSBxluX0eqDZQAQtbTJmOzgCozbnxgJBsqVcrqGMZDEj+r/euPRbHYou5X9PBLKtCWW0NR7+AiDaVbK1S5l1kIwZCRTEDSEtGemR9nFhU8hSAW79NiDo6yDNC4Q50V
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB12114.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(19092799006)(52116014)(376014)(921020)(38350700014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UcA4gFU4BCfA404ahr/1/7UREyjslPxkFoj4RDTPwfs7sOHzYZDB5RfhXUze?=
 =?us-ascii?Q?Vpbh59Ouu0Ee5ZKJmgZpxAGor/PkhyeeS2j/bhpWfkRV8GLBy22EBCi2/cK6?=
 =?us-ascii?Q?V1nBCOCS98rESxLLLmgn9aA88wU+yYVPNCtbwin78FCvfeouQ3pr0NunyMCE?=
 =?us-ascii?Q?QKhkazca1yL029/PI1SmLOBwIIfB732numfCOU/EIVhJ+kXj5O7xHT0dkQ9f?=
 =?us-ascii?Q?Q4CAY/EfPxKoIDR90wiKVBl2azABc2aGtJGz9J0vNdTJozqHtc7QIu11gvZt?=
 =?us-ascii?Q?2ARyVmy2gz6OHHOtuR4pxxVGcX2sht8/ppOMrscwTS3LmkCVTethBnP04Ro7?=
 =?us-ascii?Q?WNzdeXT9kM47FImcwe/LKtPG1T/lhMfCdRJHSGoKDINIfVlqGhn9ReJZlIJk?=
 =?us-ascii?Q?8epG+yfnNs4U8WOBC4Elk8ZtZUMX+zdfEltUObTgfGvtD7qhidM9KS3rgqbN?=
 =?us-ascii?Q?ijrtE8rWHvUqF/72yAav9j/0x9J6Rm44skKYJCls5SqzFLcTl8GpUgoWnIL+?=
 =?us-ascii?Q?5oGyQ6QgXWyV/Thrs1TpaGdflb9vaxJdS0rGrL65OwMklAS2BcWscn3HICTM?=
 =?us-ascii?Q?/4L9/G+Gm5Gi510A1BfSGeV7Xa0qCRNO2gIo5JxmwvMOaQF48TUcVhVLMu12?=
 =?us-ascii?Q?0MtmY43mT8znXu6ekniByQA9tJo7+MsnBNWlScdmcAT2QSDmVLXQRrcCa6a0?=
 =?us-ascii?Q?sfbRT1OI+T1wEVGydN06MvwHRlEVL3Gmb9gZdc6IaEbtYc09iyRnxK+qTKpR?=
 =?us-ascii?Q?8HcoycuAmKoj1rwomMuIyH6FLCEBaql+otzGGTZ7BV1wIoqgxrQfYhlDpnea?=
 =?us-ascii?Q?/ULlLfCKLBrYQiyLW5tQ9/qkvcgSjDkO4Tp6Rh4r/3Q7FTKlwGDvswyx55No?=
 =?us-ascii?Q?UkUWzfIsA2go1q9XcTqT5jMCQMl+//ZCPitJYP8jNVDhx6o7FJ7nnvC1SJtF?=
 =?us-ascii?Q?XwUUSrHJoFhqWnrMY+zZ6SQth+crFAe0rGK8gS3PhoT5zG92EeBIrUpbEeg4?=
 =?us-ascii?Q?v42elLW48XYKt83OWdQzjT/yVyjB58MRJgQzokego7QiQ5SowDKPlQYYbW1M?=
 =?us-ascii?Q?kyclUSeRIURHvZncPnRI+arufjRhiXNDK9BALddFGz34r6yxYOC6HgS7yB1c?=
 =?us-ascii?Q?i6h5BkeHtWVqeQxJnRLDllhz6jkJ+KLIkRdbVs/8g6zmwI7KWWI9VukFsjWI?=
 =?us-ascii?Q?5hooGsfqb2A/v5OiqQ8B6ArQnBay1zUq6pOqgx+wPOUuiX+4DiqW47+RkTjF?=
 =?us-ascii?Q?zOseUG6BNv2x/Ez4jhY2s/hvcDX+wGuM+8I8xu7M0zETAGDDg99XPQse6Paw?=
 =?us-ascii?Q?o1CSpGSMsRjfVrKt1kzCAkEO67u1fe3E25YoIKdf4xyKFnXKiuTcGHSiJ/7S?=
 =?us-ascii?Q?bqSWWqyKnG7vaP9/rYDexoh+hLkJ0UVYJm3Dw0od5BUJFAmWp6AY2Di1TBOF?=
 =?us-ascii?Q?MYfVZOoivIZwLUYQdJUKnrmOmV9347KeXNPk903AcUhtvi+JV6GGGxMls4/n?=
 =?us-ascii?Q?lRk6iIiS2K74LvY5F8IE8Hx2WVxSCbjdjfE1yykzxvTlWlCVCgREJlZlecVc?=
 =?us-ascii?Q?s1d5NnpDcBw/zt8iSUbovTXsZE5F91Vmpp6tnrEUqoiawPihYClfqoeAuk25?=
 =?us-ascii?Q?BXZMEq4oIWZG9GSji9VTM+fnxnkYxmmuY2Ws8WBKHzm02ai68JmiP2msaEre?=
 =?us-ascii?Q?ln5wZHxJkAgv3hdN3UqNWHuWG3sdpES3sVpbvmcdjSjkeZ3eSTyd+1JonmgY?=
 =?us-ascii?Q?HBT3VH+dzQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81ec077a-ba45-4f35-cded-08de80a5799a
X-MS-Exchange-CrossTenant-AuthSource: VI0PR04MB12114.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 02:08:53.3634
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7EgSaOtUJYqXGCZe8sZuGPY5CJ5NSEHNHMMLU5uw9+Nl9gNDcLnOn6hFgzXPS9fzwWCulrHgnCxrGBpgtLUNPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6844
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_190900_900100_83517C0C 
X-CRM114-Status: GOOD (  10.15  )
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


