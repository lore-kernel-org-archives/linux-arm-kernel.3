Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57224CA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 23:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zOOpQyTNZCK8UOuOS3GvNc1278DVL36XcWchZwytNQI=; b=QAfqvjzgHuHf8ymB5JnAh8u7Tq
	zjnyQ2ZfD9rVrfEfPKGixBmvPXM+vQsl7ZH1F2OIKw2oIGvvAWdklg6qaU1va5VxdBZBwL7NWxfzI
	XAwUI558jYRo566/5NFLgNGkxONbigmoyqorUmC+Xe8DTSAlQB+L2knVGz7cZnxrRhCpsCvLT1jWu
	J78lHQ4eMBniE22K6/lw0NCqks+idBTwsb754QWHIdG+r+yfGEDm+KW3c3Jl42UV+Yc27KU6ubYEa
	6xl4HqSG2sKtql3Wl/ff1xpzyMXCrZ34ZVO9Y7VNWrsJf5MrP+I0VjAj85W2TACj6/EFD1FW1szC8
	UXfihkzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uorpF-0000000F92R-48Gf;
	Wed, 20 Aug 2025 23:02:37 +0000
Received: from mail-westeuropeazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c201::6] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uonen-0000000EhM3-2JKz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Aug 2025 18:35:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MVZEpQ2RrHWi18fiRG5yQxwJi6w6I6FSgs34OJVmHdxw2pT4w/nt8frp9LY/S52gfrRNC/+OQ8mQ+urN3rrgu3pm0Vw+0MUhwSK83ItQ7RjfwNcvOoqXmmFRpueNgZVOr1msKc8vXC3n3tcwh6TwFoL3MjgfxzEsu1TWwBYigbfnFy2s3OiqzCT+bSxCwQzYcfqI5D8+/8l+aLv2PsOrLgGWzt0T1u2XjJg3bAyDjrqmBR2E2CnvJI+m5Az+860ORzmr5S9ZR3SecKYx+ruX2uLTYEyQACTFxjvTaOciEpoRpMYdJ7ZjsTd03vp8+W05WygrTNVEtdyTQl3cK3x7gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zOOpQyTNZCK8UOuOS3GvNc1278DVL36XcWchZwytNQI=;
 b=iBFIoH4jN6KAgENmRspAkJ5xqv/Uj407by2L6xV6q/q+dAFPQPpSUDcmjGPQEa/Zk5VGMAktqhmaV5fDCP1i1ZI6BvX2foM8wJxKD2FmwOtgiuc1rFaY6w8npLyNXjp2QThM7IxvxI1eYiZpmwgOmsOoO8NN9LyT+tXuw8wp9sOEm7nsDmkphtHNyqMsU4nDkmWZDw09SoswnQBso2YfwsjAxl1seWa6wIqGTgy8vmMeF2iEt7xrPGf2ORE6OEfKGGgXWubGB36da0GqrZCktFUbYywZuhCOXSWbTsOyBonfu2lCgah8ptSmZfo5tGH7buZNkJeLX6SeCpByx6ujvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zOOpQyTNZCK8UOuOS3GvNc1278DVL36XcWchZwytNQI=;
 b=fUwRHyYgzBsdGB9DMEWwTJHL3khs8lZsnxtQS++AdXE5BZGJ9eY7tppUQE1UrZe6xz5IQFKv62hQ6aeSIkjOOQ+VodpzlJIA5vXMoiqASREdyjhLIYkVxqPY9HhMLoxIuAORBnGgNsLZ5FhetI1C3BlLc8OS7F0E3hM4QR0IfhDkNh6HGLj+PmaoWN+MREWWshGdHKEzW/KSMrkGFssp1waMSJX8rpwCqT1JMlFN80Rf6iDNx8NM3/8YgAp7si9DKEfWlPrVFzB1naiTrbuNNOz4qMFVS4U8p2QF0O4xHQJtowLLycEz8cmsKN1J3H4JG3ZCRnSTYVpM7H117FoH5A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by AS8PR04MB8484.eurprd04.prod.outlook.com (2603:10a6:20b:34c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.13; Wed, 20 Aug
 2025 18:35:26 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d%5]) with mapi id 15.20.9052.012; Wed, 20 Aug 2025
 18:35:26 +0000
Date: Wed, 20 Aug 2025 14:35:21 -0400
From: Frank Li <Frank.li@nxp.com>
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
	imx@lists.linux.dev
Subject: Re: [PATCH] arm64: dts: imx95: Fix JPEG encoder node assigned clock
Message-ID: <aKYVaXUE2ZTsGf7d@lizhi-Precision-Tower-5810>
References: <20250820162747.209626-1-marek.vasut@mailbox.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250820162747.209626-1-marek.vasut@mailbox.org>
X-ClientProxiedBy: AM0PR02CA0133.eurprd02.prod.outlook.com
 (2603:10a6:20b:28c::30) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|AS8PR04MB8484:EE_
X-MS-Office365-Filtering-Correlation-Id: 737668a1-54dd-4a6b-c51e-08dde0185490
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|52116014|19092799006|366016|1800799024|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Bb9Zr9HbLXBkYcAqovy4CUPofeWCYvG98EyvI7xRW+qfWRS4soyD/4XW+Rof?=
 =?us-ascii?Q?a//PoAU7dF5RVKQvoYOqeri9/fKDNnLPt6EjuSBun57BDa9+FBNslgHuadZG?=
 =?us-ascii?Q?/BFeIBlblC+11k2Mtrabln1SRudDFQDOuAdcZdR35XHwPyUxv2fWregTwprj?=
 =?us-ascii?Q?zBKM6AjfOG25VM+DLd9T8M+dS22I1+qZ/8CvamQDtkoWsUqITvW5+DY81mw5?=
 =?us-ascii?Q?Pi1FYk9BbKRrK7cBHnsFrkK0A29GpSaU6mHfRD65PpViA8R4zq+oNxhawSTb?=
 =?us-ascii?Q?2T1Ih/pNjOlHOIRuKs4LxMkGE59bf40tFO/Aj4EvPty9cCFekfMcEXjWx0to?=
 =?us-ascii?Q?T88r7RZ8Rjrr6u7PgsYhWVFEE6wMLc98gGvn6wN4rVmScZoPmFLD3Dzo6A9R?=
 =?us-ascii?Q?Vp17t24Zk2B0pbenoTGSroDcrXu7v8x3QTfG2h6g4WNZ9urMIP7A4MMp0Jnw?=
 =?us-ascii?Q?AV54Fnu/kmY+ZvFGiUkTKPfXCmULsTBDa92hNxJJGlkUd0+T+mQHXbpi5K1P?=
 =?us-ascii?Q?xNoLyVau+Xg5falbiTU16CZJnTVDiWYH6SMIQC2CveFok5G77eylwbVMUpB3?=
 =?us-ascii?Q?Dpr9+sjp+okjxD92TK7AvYi0LqxZxqsE2joC6Doeej67Ci9ifQrh73AxhnBe?=
 =?us-ascii?Q?2GCZDsP0SPMNm9FegZ3R7TFqxFWz2z8eY08eQ12sQbCLuOsSaQDYt3OZf+DG?=
 =?us-ascii?Q?eVL5zVivIjKF6N0q4lvelr46ft/alWcoaS2owGqsdATVv561XVNWFqJCRjij?=
 =?us-ascii?Q?H/j87RzZq93ne8kVMgyDXKTdQ7khsx7Ve5fIshMZb5UHRRNpiPJ9ajYPF2Su?=
 =?us-ascii?Q?lo5S/sAarxKSV8mPO6xYSzuOiNfxjte7FRLkq/qKEyvWhctlXYaxp09eJHMH?=
 =?us-ascii?Q?OO3FQ7w9dTBv3LHohdiENKhD7261+BiK6oUblO2lk+xLtR5jhsIwvNS8LS/x?=
 =?us-ascii?Q?qsFeDBI4GYSrgir+ON8zRtWT8837kmrNkDpJ4acU/J1wMj7SZyY6Y/TXdLqr?=
 =?us-ascii?Q?ey1XvQVfWnAEVjRlxzYTKTQYJYlKh7fLSfU/IWW3Qx/I3xkSpPGPAZCp9bkW?=
 =?us-ascii?Q?30wNERSpz7g+YSovuUeJStdTWvPASF5LBkcWyeeIIQdKiLsMIPCD2WZ85FWt?=
 =?us-ascii?Q?TuZ0D2nl0Bw75apPINDNjmTG1Q2nCt67dlasic0FycmY327jYX5peu2g9Tv3?=
 =?us-ascii?Q?e1axS6qS/XKIVP4iN28mqTLxO3DBb5PNw17wgF5PoDA3GeZeas42LrU+r6f5?=
 =?us-ascii?Q?ztFiRNnGtIV+QWmo6loU6H0wh5zjg4UCa6zk4sybH7c4VqD35GVebrvhw6R4?=
 =?us-ascii?Q?50xyMlN9PvTGbUhjMFUfHMHIjf94YWd6V2ONxmVnasNcm+XwFT7XcfGjo3Cu?=
 =?us-ascii?Q?JTRTeIIjwDq/Q8BbYRiX1dUPpCfI6G1vP6slkETNsAz3TqIDPMrfeJyPjw4G?=
 =?us-ascii?Q?hFxMRUaw90OMSxtBVN1K7vu/AhQA2yHmUPYLovPIBugCPrGZV/odmA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(19092799006)(366016)(1800799024)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TGd0hGwkG0usB2XaN0V73g0zNYbZ0AKDg/5wOF/H142Q5/5OIzdIDwI3VCkP?=
 =?us-ascii?Q?SdBiCuh72F7uLugmGLyVFP9NaBdwg7ypXx5wyVHLiEALgC7Gemp7smFpsb7C?=
 =?us-ascii?Q?LGuWSVzLgfVssFd3BsNa9bc3yeWCtxMY/t2YuC25AYv0C+wwIAxYsDwv2wmB?=
 =?us-ascii?Q?q9y+Y4VlGiWKXfha6bjaPfFuYw2HHUODWA29ihXykEjJ0+/l18nsnYGDiVil?=
 =?us-ascii?Q?6DLxkiCbmZasvxRIK38gOeYnlTASCuoYz/FrXFfyYvJuu4NLKd3+hm9Nod7P?=
 =?us-ascii?Q?wf05qV+dfudFxV2bFai9/+fA3AuxEVkWJZ4rnvYWSFeXvp9Cg5KULTlyBjdD?=
 =?us-ascii?Q?D1NIicxNShA2uRleCBztklZSxe9Q58LLe1XBUagfdADEEiIRHD3a27TaWCLk?=
 =?us-ascii?Q?VIFxSQHaNJLHWuzRyekiSV3xpEzH/MJHGSdYpAXyCm7r9usCi9NOogJ3umuP?=
 =?us-ascii?Q?kgRujt+N4W5rlSLsDjJ8kvAh7B7v8RgHwtIsRoH4VCb95AJhA99k7AC6uWI8?=
 =?us-ascii?Q?YOY8Q6MhQczkVcz15HbMDUIPR3YvtTFOWUperoXju59u2bmwJQLayBVW6fIW?=
 =?us-ascii?Q?29c6215RVJuQ244LWbLN2RuBrVmHfpvZU3FMdJ07k0cnycRMLrOI8zN5cEvK?=
 =?us-ascii?Q?wRdh3ywhGHiGaYf83xuZw4gwJzTzKg6oRjk9lHnOf4rrB8Rm+NdgRMM6QZeK?=
 =?us-ascii?Q?fdIQRSHVUQ4hUjivTcDb+r9xNFr5uHBFlgVyWc0foxKb403wK4cMuAgEQ0pp?=
 =?us-ascii?Q?OAyInPfhrqZPusgZCV400okSS03Bthg7xFBAlA3D6h3/Ue2KNIj8zyLfmPmm?=
 =?us-ascii?Q?7l7/gt7AsHsBajrawXIi+pT/U8D3unRVb4004JY5mvmYyz2+dJRFCX9MQsxy?=
 =?us-ascii?Q?njg1uqVROcJm8Mfd+Kz132QS3Xjpju/shtxb5vmebVn+spLEcyVeiGDV/sOt?=
 =?us-ascii?Q?mSpw/2wiGZzQpKB2JyEmWzNPEoFmmCgCspkk2vmqWa+RnpvYYVRKhV6Wds5H?=
 =?us-ascii?Q?uczAEPwL1cmiCo4+KDIHFqvSJKhLnvqYgPWjklZQX3tK8f5fof8wQsh1pqxh?=
 =?us-ascii?Q?ZSnVmOzxZwWkG5PNzJMefpdfANIlqZX8S/u7MsjaYn4zC1Z3qW8BY4TDJVpp?=
 =?us-ascii?Q?A8jlGTziUiigBmwJYzvis2XYMqdMciXiURrsRZa6r99PSPxvD34JvLz5VHZo?=
 =?us-ascii?Q?gTYaZZVIy4Fsa7JhFN6xSSez7nq3tCDL+YALrrnaKLF6jQku0rLMK/klvjgw?=
 =?us-ascii?Q?cOG/aW+/012zwv5t3zwKGTNU9GZwYT8LYqGGd/zmBkZRbRUJxyDb77C8XfjL?=
 =?us-ascii?Q?uPWQXTkFUB6pxIVWAEsU4imnOGT5JS51+qGi4WulleYhPDM5LAp1EPI+9+qp?=
 =?us-ascii?Q?YtJGeKkJvXvbFssS3INJQ+Twxyt1CUKu7WeCZq+wu5FtzMo4kbC8IE0kHl16?=
 =?us-ascii?Q?AznHXPxOtnaNNdgZyVM841QIdokMndLgJtKXYKjPCwVK2cRKOu29J8rjH8lK?=
 =?us-ascii?Q?zjcQB6xFttCDGeouvWzoceOHSRFJtdUqJQ1XSUGV7tMlFli2ReR6VMt09ZGc?=
 =?us-ascii?Q?lV/RwRp12yyJ/r5u2G1x41516HSZEFYxDhKziYWu?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 737668a1-54dd-4a6b-c51e-08dde0185490
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2025 18:35:26.1936
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DKzJ282OZBgFGHZ9pEUKV3h0/mK6izQpUW+KU6AChhCLPJnlwRscwrf1r5hZ8gxr50u++haE0T04GeWU20cWmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8484
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_113533_591758_F6E6179D 
X-CRM114-Status: GOOD (  18.37  )
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

On Wed, Aug 20, 2025 at 06:27:26PM +0200, Marek Vasut wrote:
> The assigned clock for JPEG encoder IP has to be IMX95_CLK_VPUBLK_JPEG_ENC
> and not IMX95_CLK_VPUBLK_JPEG_DEC (_ENC at the end, not _DEC). This is a
> simple copy-paste error, fix it.
>
> Fixes: 153c039a7357 ("arm64: dts: imx95: add jpeg encode and decode nodes")
> Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> ---
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: imx@lists.linux.dev
> Cc: linux-arm-kernel@lists.infradead.org
> ---
>  arch/arm64/boot/dts/freescale/imx95.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
> index 4ca6a7ea586ea..8296888bce594 100644
> --- a/arch/arm64/boot/dts/freescale/imx95.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
> @@ -1843,7 +1843,7 @@ jpegenc: jpegenc@4c550000 {
>  				     <GIC_SPI 294 IRQ_TYPE_LEVEL_HIGH>;
>  			clocks = <&scmi_clk IMX95_CLK_VPU>,
>  				 <&vpu_blk_ctrl IMX95_CLK_VPUBLK_JPEG_ENC>;
> -			assigned-clocks = <&vpu_blk_ctrl IMX95_CLK_VPUBLK_JPEG_DEC>;
> +			assigned-clocks = <&vpu_blk_ctrl IMX95_CLK_VPUBLK_JPEG_ENC>;
>  			assigned-clock-parents = <&scmi_clk IMX95_CLK_VPUJPEG>;
>  			power-domains = <&scmi_devpd IMX95_PD_VPU>;
>  		};
> --
> 2.50.1
>

