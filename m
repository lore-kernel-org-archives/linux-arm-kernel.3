Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50BD3C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 23:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aIKd40IUXI/r9ZqSbNnkU/yqImINFpW3+OnPGlNZvYU=; b=J5sXEwq7TWD4cEsHuPvpoE0a8y
	KeT1jm8U9ZZSq/EY5WIoqhrDPzCprlrJnAvpZcMiCd/4g9jmLrlkhr4Sr75LenOuApooLAHP2r3Lp
	MCdpgp1UOlCsfcmocn1CKL3tveu2YP4h6nNmfkWjx6QT8TF8AAGLnH2kP3ZIGW5Eh731/V0x4V/hk
	HdN0Q16utrB5XL51oHLSEonzv/UhXs+2sIVdYkpOgsrMFxZx7x7M9zmWneEgq+sHKbPL1Ks3qe4EJ
	fhz7HfRT0yyy0E4c2p74RAklqsT50i4I36Q1PdWpqW8xPMlctFbwguf4qkJD9dU4RPb584J0GEWa+
	rCx/8aww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua0JV-0000000DE6P-3AoZ;
	Thu, 10 Jul 2025 23:04:25 +0000
Received: from mail-westeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c201::1] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZxjP-0000000Cuu1-2Pwi
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 20:19:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=emVDN7kapTtoFeTJLUJ/kjZP1WMzscAtgqUVsoWERN3CnZx1s9go7gVOeHzvhRmNWVkMF2pzPix+KMg3+Igl1Z7KK6VppN7PbYFneWIjhoC36RUixTgQUDIw6QwdkWFXuIeUenHJfMSx429mg5KoKvR8kgOjuStNdA2OOBevUGfV0EoW34KKBIMV3296qVwBuM78CrU2xbGmGq2i/mBJcAo7X8IQDdP3wxNTdDue/zlNMMV8N8boisQV3V+ctRxiJXxj7A1YECiz2EA25k+xZR4JOGVq9SWP2Ll1L98J/UkZR9mDlHay+thWFXr5adSEPjBg0KLpRHQCXkHfDiGNMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aIKd40IUXI/r9ZqSbNnkU/yqImINFpW3+OnPGlNZvYU=;
 b=OV/25PzlPS26l9jYBKjQkF//B2/tdSuXypq9Otkp7tblhyqSe0JaFOIjxiRkMOra9mJdcqfrQSl5aG7wW2qBRMUt84i0FxLRIIWYyp802epzJv8qp8JTmRrYt/uVNIijmvRIxlllJb7BxBFrDchiECOVrVjPwnuCnUza1cw5kbw6ci9iEPRL7roJ38ylXCjNLODX3lpvPyZsyR2O2wjUZxYEHUqiuK+CeCarSfl4TccH3kHiMAOdgj+f/QitQ5qMhr/v4Q2j0XLHbTx6ROlLgcQX2PGEU9N6xyMyjIdCiPSoq75lXdQieM9Hnjmlmgn7J2b7LKDPW9xs3nkuEe4agQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aIKd40IUXI/r9ZqSbNnkU/yqImINFpW3+OnPGlNZvYU=;
 b=jbfUFct1jv3wQblQ/7M2zWLVi/wfz/BxQvLL0fPmgLDiNBUqbUHYWYx4nKbiX66+D01+Glrn5jNRo9Sn6eneBVyGMaiaOiLQDxpsvhW284Kj1RApT3SSk/WRJGXJzD7IObe97rFqPVy6o02+UvkI03iRJhDsu7wmgSSXmm9Sg8JIRWmvSx//Db+8EF++1SoLFdL2U1FxyLcxHsLmEZrkjjTuyhP1Gi5cXtgnIkVLt9ANaNMz29V6VnBfB+/CpDfhzZy+H0z6HAVxrHZfD852tqiejEhUpaepYrkQ8gATLIMWMlqowVUatSCMmpU4DEFFjQQF+rGuhFnumrXEdCcDNg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by DB8PR04MB6780.eurprd04.prod.outlook.com (2603:10a6:10:f9::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.29; Thu, 10 Jul
 2025 20:18:46 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d%5]) with mapi id 15.20.8901.028; Thu, 10 Jul 2025
 20:18:45 +0000
Date: Thu, 10 Jul 2025 16:18:39 -0400
From: Frank Li <Frank.li@nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 06/72] ARM: dts: nxp: imx6qdl-wandboard: Replace
 clock-frequency in camera sensor node
Message-ID: <aHAgHygUe6rWB/TA@lizhi-Precision-Tower-5810>
References: <20250710174808.5361-1-laurent.pinchart@ideasonboard.com>
 <20250710174808.5361-7-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250710174808.5361-7-laurent.pinchart@ideasonboard.com>
X-ClientProxiedBy: AM0PR01CA0089.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:10e::30) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|DB8PR04MB6780:EE_
X-MS-Office365-Filtering-Correlation-Id: eb00ff95-794b-4d9a-d6ca-08ddbfeef88b
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|52116014|366016|19092799006|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+fs6/cmtn2IWVGFnu82RkVd/XjI8uy3fQ5XNWR4VkCGQxs9MlLys8Yg1WMMg?=
 =?us-ascii?Q?ty29tD5u1mLBANaWm1F1X5rk+oBgloeibAKlVRVtaLdusRY6uhyJzVo1CkUU?=
 =?us-ascii?Q?R0vanX5MXs5kiQzpMTore0AVDV0HwMpZQ44x5b+x4ILSOcT2/53ErY1P3XFp?=
 =?us-ascii?Q?FZzurQW0MHsjjRpkJF7FE9TQ8hGYcPLHfA1sYZtUmtdPuLwXhkt5bW6ui9Dp?=
 =?us-ascii?Q?uI7QK5i6maGG/VzXg/Nq+1j3j3TTgymJiba+FgtCSdWB9cPaDIaiRgI9CV42?=
 =?us-ascii?Q?yjIO3l3msluciKYrE7evK8l2kcZ2ZwAzN4evG9phbfYYdc3b3jrzGOk0Q04a?=
 =?us-ascii?Q?Ow8wg9NFe47+6WL8POWbvVkTT9ZsLHn8gAKJCXb3Sb9mCHn1Bx1PdzShXG+p?=
 =?us-ascii?Q?iXEq0/vDvdUKiwuDrJHrm9UNO6iqtFIRH5NvKKRsV5OJmqPf85JyGVl9c6JM?=
 =?us-ascii?Q?M68G8+akJ9bMqVp8v2jMScwTzPbsfRa0DEyEfv0HzNGanbAMnrx3hvU5v27c?=
 =?us-ascii?Q?IcEX3ovIfkTXM6oATLWO9ikohOgiQdGf79OhcjsieFRtCr59sQCvb8GIjAHZ?=
 =?us-ascii?Q?kZZDMqEdLBd3gDa5osh95esjPWvAF6EwgBHkCyxnSdUEqDZE+ELZJ7EmDyuT?=
 =?us-ascii?Q?rIWc/q30qH9e/xxx6oYsx7Nrs7Oc6TMVZD8UZkSmlxyZWbpfi/A6zSjER3PM?=
 =?us-ascii?Q?CPXwk18rTwQTGP6h6pSdMx5IvntVtS3Fb2jP//yQOOPv1dXjO4ibO27tLSpR?=
 =?us-ascii?Q?jQAcbhTY4dP0dgzx2OOaEtEO+t2pQIyPl6nmkfYDjG9dnLhB3nkII0OMqbnt?=
 =?us-ascii?Q?riixVAm+ifxRC+xM91PXR0fBJA0nHVRRT9/tGUM8RGyd3MB43Tjx6DLakhcG?=
 =?us-ascii?Q?rVf/r7J1xcawQJ3tvyl3ZV191CsOiKsnVJa658HQlNvErWp/5AM4KHxqJA5x?=
 =?us-ascii?Q?Zh9DC1ZHCn6bkJaBCgqQ9rYgmkIYeOX17UdLaZis3SK9aOt3rhWCkiLlggYu?=
 =?us-ascii?Q?lE4eRtAyoZKQmox1KAd8XCzydLf7RIrogHHSvJcFtHIqWDOQPz0nZtIlDs2+?=
 =?us-ascii?Q?fhebxu+tB4hPlB7vWzWqirAWqgJJa/AyFRj/qHWYne83ajMwLT1CzVcqovT2?=
 =?us-ascii?Q?7h7M5WhpPv4LfBPi6oVjFuDe1GcTz0wtPEQcTLmc/7gU+B7bbpFTCV6+OzSE?=
 =?us-ascii?Q?cceAC1/Iohe1q1Z74I+2BpjhSZSHJRElJiGEnyszSkhmanwiQ+N9OPJWomHD?=
 =?us-ascii?Q?0gx3vw0QhXiQjhQhacd5Igl8OZCy/zBRoaBZqWkUrFwcgvTWd+mP0zbqTBi5?=
 =?us-ascii?Q?ryRYvehuql6p9dWx4yRIWN9l1IZJo1sCEfdJcyW+vGiGSlem40a+NnmcorJS?=
 =?us-ascii?Q?MpG/VkrzA+kdXT1Bsx60Tc253iBI7QxhY0zrLO6l83IetrrAWuaFJb2LPBlV?=
 =?us-ascii?Q?TTOGo1x89QMOy2YPftOkMQ+NOGwxsU+jTrCur+exfzqIcQSfruyVeA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(52116014)(366016)(19092799006)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yrG8NXf2RC6ROCyCEwQZfhL5BSKSWZ8iIcXq8qtzhNqW+VCG6G+RZ8tfoxm4?=
 =?us-ascii?Q?2EgWtKi60c1nXoDLpOOSYbQac9FEWP+zJqoNonWEFbVt+MfgCKEJSa8DOsTC?=
 =?us-ascii?Q?VS/DGIbNCaVMzYIHdaUcbhY6iJpzFHDNRlQffm9m3HVFtsYMHb05DgIPxKpI?=
 =?us-ascii?Q?pFhn3x0hz2UlpMmTwt8/0Nq++NOwbivofq22AWfZ4+9ixGwNUgCvatitnFHh?=
 =?us-ascii?Q?s+8T6/Oifzn05tK31M7M6EAi27B8qG9tmduDCI1zeoz4fN1WJWeohJuD2PBr?=
 =?us-ascii?Q?RyXwNcB/rb9lq7TiFSu+7ysCU4B4bkg+oePbi+T/FqpmuU7OxbP3slvITkgO?=
 =?us-ascii?Q?V5KMBsMhTLwBjwVuHFnVA1rSoYr7umLltIMwSywX0T5tRiMU9jBByWhbnzdU?=
 =?us-ascii?Q?CkI5I7Dndz18mAw2+rQSEpDTsoZojfidMiMt3/E2ewIDYTgv/aDJW/sjhdEX?=
 =?us-ascii?Q?K3YeOufHhLNRqOAohlS6v2pq3A/5Wd0cirIomrmU8HAx8R10RYrRHeWNJFf+?=
 =?us-ascii?Q?4Pa5Fy9yISV4Xv5jvyFwOEkg89NGlsNCtqFr5sr2gaKgP67OPYemh9wLdlSt?=
 =?us-ascii?Q?moY+8ni8kFqAe0nvx6Zdp80eS9hevTtlpiFinaTiBvG4ral3p3fJWguHy21B?=
 =?us-ascii?Q?LLNDSWgWTCF12f2RHvAqHl48S/XqfSpOxa3WQmXg3H66xgiu7wYaalMrdlCB?=
 =?us-ascii?Q?KmdXqXEMOI3hW5SfNlqMcRE2DDxploRCsx/yiZYNGuSa2f24cGFCS6cf0rnR?=
 =?us-ascii?Q?EZ19Li5mqUUFyagj6+Mi+iSZ4wfg8ZpO9Nj4E19Psb3PqZp5xAVmWlYbi+z8?=
 =?us-ascii?Q?nUdMylEiPErHUxsdc1pZpN4h7ZGZujspU3QqDz7ZC1gZqkY//KH1IatngZfV?=
 =?us-ascii?Q?k7x0BzPyHhEKiRh/M9f0Elw/TqCnjZbup85goCJm2rUulbp8gVtI0ESoUfE7?=
 =?us-ascii?Q?Xm86uz5cVMiTDAqaMTnPVKDthBc7J3ri7EPP+nOl2czlddin4mpSD7gFmhS/?=
 =?us-ascii?Q?FBe96bRXqIQvE7wEbaIzsrhK4n4SQPAny5E9ALZj/rvGTLJs+jMOTY1Moyv5?=
 =?us-ascii?Q?xODrXdA07UdcQQOzFEZBEvL8P8x58uJxxicO++ievIJorCj4VbiyQwy76sSx?=
 =?us-ascii?Q?VfW5YN+ELoio5SvHEDb30+oyU/ajYb8nCaBmooJOkUzzEaslWCp4MtMQk56Z?=
 =?us-ascii?Q?oDPh+I2pRbvxf1PtD7aSBL+7IBrz2Ufds5HMvd3O9fxgcmavgih//ENhYf7t?=
 =?us-ascii?Q?hB3+NavTfVxfFoB/+56+WvyBVVeNyZNXW4kDKHVqMXAqiCZS7phhjLaDT4ER?=
 =?us-ascii?Q?41fWQIOPZ2Y8s7h+SjdqZ+LVvi22D3Xz7h4y3EN47vyF0we6dnP7lxhAg8oc?=
 =?us-ascii?Q?uuniRiHMYDnqnBLdecikI3R7PvQJg70+HqWgZ7gWeVFQLOYrAEBtu5+CzM5Q?=
 =?us-ascii?Q?8r3xpZupT1n2VdTq9vqx1AiNXufGXJwlol4VQvlE8LeX4r0Ve6tgdRUgb4qG?=
 =?us-ascii?Q?RwfPM8G1Eob26jf8r1NzEcXOvsbmv1kkLjZb7+Sg7yZ/89FbHRwL2otwRDy/?=
 =?us-ascii?Q?PluWb0Lx8Q2F5a3adqG74EqHO2M5coXn2D4B7Nad?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb00ff95-794b-4d9a-d6ca-08ddbfeef88b
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2025 20:18:45.6735
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fAwzdgg4/Rz/H8q73DorQPfWCs14erOtUYNtiEV60tYu8sRAtWVfkcRBNdp+6pwS6CkeVKrL1AkkjtbsJF1AxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6780
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_131859_617634_EC4F3695 
X-CRM114-Status: GOOD (  16.88  )
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

On Thu, Jul 10, 2025 at 08:47:02PM +0300, Laurent Pinchart wrote:
> The clock-frequency for camera sensors has been deprecated in favour of
> the assigned-clocks and assigned-clock-rates properties. Replace it in
> the device tree.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  arch/arm/boot/dts/nxp/imx/imx6qdl-wandboard.dtsi | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-wandboard.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-wandboard.dtsi
> index 26489eccd5fb..e5ac78ffb31c 100644
> --- a/arch/arm/boot/dts/nxp/imx/imx6qdl-wandboard.dtsi
> +++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-wandboard.dtsi
> @@ -136,8 +136,11 @@ camera@3c {
>  		pinctrl-names = "default";
>  		pinctrl-0 = <&pinctrl_ov5645>;
>  		reg = <0x3c>;
> +

unnecessary empty line here

Frank Li

>  		clocks = <&clks IMX6QDL_CLK_CKO2>;
> -		clock-frequency = <24000000>;
> +		assigned-clocks = <&clks IMX6QDL_CLK_CKO2>;
> +		assigned-clock-rates = <24000000>;
> +
>  		vdddo-supply = <&reg_1p8v>;
>  		vdda-supply = <&reg_2p8v>;
>  		vddd-supply = <&reg_1p5v>;
> --
> Regards,
>
> Laurent Pinchart
>

