Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C307CA5FA8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 16:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UVNWxTQExA9Zg+M9PtJFMaIglevIw20UcRzS7HYl46U=; b=d3k7D/xW9mTOjRir/jZYp4rNO8
	tgvq2Zw2S/JA3QyROfGnqVHtXW3EAwhcQwli9f/7UC3UjSmCYSngq7UlOmvkazL8nd2B9ov1r1byp
	L/DokkWR5sVUds63AcwKAwY9Ya+E3xMg9eciTiIbp93HFI9HyGjm3oD7KY8uya+5oAMMpZYUzUvAB
	PTFUlpzRXmoY5WXboJe0UO718lt2LphUvnZdrexWkiGe3Pcwr6yYFqXvn/WOKLCPqWYdJUff7nKqh
	SiUHJNMHAPqv/+2H3HRnBOMFayy/b8dpFvjz6Hj+NvchPi6P4LjA5cNiicJ4TdxgFpA/fXe3U5zma
	S2uKq+Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viEZx-00000004AFR-2yhJ;
	Tue, 20 Jan 2026 16:27:41 +0000
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viEZt-00000004AEv-3OEq;
	Tue, 20 Jan 2026 16:27:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K7PfiRUNdmpQO3sNua7HG48/kbdIdxZvBOoMkgm79Jz9AFldkPBvAgKSTeCXY3hcbWUk9Hy+TxFRviQT0Ii1XMMMRNYPaQguguFndFghfXcvYXqq4QcJA33f406aHQDjkZ4nPvqEKSCuo/D452nlSKaN0RiJAUW0ToXO+Gf0Lt++2XpIgZ6LwFQ02Z6j5pO0v8DIyk55mkVt0Lp+wiD3xrGBrlQCv7p5wvtms4XZ1qbRLo5GpLjmGpv16dbU0TFmBZlRNJMjNZCe+ayVuB/3Y+6vIBsOtqjDeOwVlzo5ZQEZmrxGOxjYxFcLR6D4x0Azr2rzIsrs+HxqgSwuBypE1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UVNWxTQExA9Zg+M9PtJFMaIglevIw20UcRzS7HYl46U=;
 b=Vksdef3tWBNi3JEZz97cNy3Y+pgi0o7v6Z2j8sYpqRT7NAJPHIvMjb8sB5YaDM4zS7Lj6ZKmYdNZwAlILQCP/AJ7580lyZddFD2m7PVA2Ido3UOoV6zZrtW7KLr7K/ZPb9RchkrdTAyD5jUCsGmj27THp3LCYJfoOgMbwYi9ZLJQ4z+BSpYK8bzgEYU2VYhQ80G1cQxsINYZnJtQoCJKyiCL9DiUn3iAWkUzKjVT8O+vYO6aXCd0kO4MO9KlBgFb1uO3FhamS5c90SggLSU8DXRjz9F+q7ei6NLMFfaDsSs7dA0Wj+Z4YdOrhwCu2ps2NrCemEQIlQGnN3PfAP4OEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UVNWxTQExA9Zg+M9PtJFMaIglevIw20UcRzS7HYl46U=;
 b=BRxvNInhMuoqaMzzzLk1bWqP9XwKZalk5zsFRDvNpR6iYBq7lvoOp61QgQfnoyRETb6U8l5On+d3hJuK01TlXXeD8Cy4/8GybJb0f3IQU/6UN6pdtekiQzyPfvhv+QBzzWViR/ioLD68l0FQgnGovq9KOkWvS0bAiluABNyaqAPkIs3g2KnMk26bnAKAXlJV1YnGJHXCVEvCmUUVAoshHf/ixPjNKQU8AxMl2QcKK9N0PBFVU5Hzx+KF7VMYc0jR8MyvdEJzfIszWFyzM9K0hGU7J0sgAz0kmT7ejPdS120ufB1cVCpbYd1wv1Mo091uJts1IgaUqdwLxhq0kLtGJQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by VI2PR04MB10764.eurprd04.prod.outlook.com (2603:10a6:800:271::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 16:27:33 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 16:27:33 +0000
Date: Tue, 20 Jan 2026 11:27:26 -0500
From: Frank Li <Frank.li@nxp.com>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: vkoul@kernel.org, neil.armstrong@linaro.org, shawnguo@kernel.org,
	kernel@pengutronix.de, festevam@gmail.com, jun.li@nxp.com,
	linux-phy@lists.infradead.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] phy: fsl-imx8mq-usb: set platform driver data
Message-ID: <aW+s7tZ5BnwUARxp@lizhi-Precision-Tower-5810>
References: <20260120111646.3159766-1-xu.yang_2@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260120111646.3159766-1-xu.yang_2@nxp.com>
X-ClientProxiedBy: SA9PR13CA0140.namprd13.prod.outlook.com
 (2603:10b6:806:27::25) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|VI2PR04MB10764:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b7ec267-825e-45d4-a83a-08de5840cff6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|366016|376014|19092799006|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?RDQZL4kpZpj6LPIU/dhoxBW9no9mvNIDA1UienBsFGSD1xdSx8Ue9lE4Rt9p?=
 =?us-ascii?Q?SAiY0QgGICXb16BKYjMHkPeas/lvYJqfBo40Ffey/6RT4e/qS+mgq3RlgB9Q?=
 =?us-ascii?Q?/7teyuBT/ZggHrNcIDem41Uq1VIqvcCTtZnQpINMlDqkJVQ303JjR/VeovX8?=
 =?us-ascii?Q?K1I7XR1/OExuXUygZ9AKG0Opewti5CmPE/mlREKNm8mU3qsoJYJ6t1sntzjz?=
 =?us-ascii?Q?ETY6YvsqlB7A6puzGpJlP5iX2gDF5eFxXCKi1ceq37W9pLjWaxP8d7y6KjcP?=
 =?us-ascii?Q?7VQiukrQ75Z4TIL7qoxZSitXZZz23mJmeRDio315cGNsfjBZsOJ3sCLOffOr?=
 =?us-ascii?Q?Y5og6S9thJMHn3kfd1BWYmOvbLoJ/ELxy3WyxZ1AaZ5zJ5CqF+g4rDDhFdZX?=
 =?us-ascii?Q?A7h1HYPleoCePDql8EFA8rICskqPDyUEgpcyEtE0M3ZdNqFy06qu+xXQSeJB?=
 =?us-ascii?Q?ND9gYW2lsD/z7/AYfJFXREAuBPoIF+r191mhu60HMJkYsmZRNU951Hy+r8Ki?=
 =?us-ascii?Q?xnvebCUrwSlRFa8BFq7MUvXcJdqDMwCWU1rrsq8vob9B9NTawws4dg4CKsQs?=
 =?us-ascii?Q?esbiWNQyDtMiA2pk9MGneGlJfW5JvcWybAm9/kQ9chgy9PBROD7sPlP5dhqh?=
 =?us-ascii?Q?ePixhLloGX6abDVVdJxuRy7UjXCT5JRbpY3953q0geQ97aFZVsnkWVNKyU6Z?=
 =?us-ascii?Q?Jivagzu65agEXlCO1t1kzwaNlPRAx1rcnzvRcHSf4dsj6a76NKaL3xnKIwCl?=
 =?us-ascii?Q?zs1BW1t0kgt0FovGB5z09qybr3h7qdTFJmx7zxuZrD+wQrA2sDvEFf9/tVse?=
 =?us-ascii?Q?GZUr9eZ98+h7zvt9rPPp0mpFsIQsQdoJqtveAAqeDE1ndJuREqRcnC51f5Hw?=
 =?us-ascii?Q?Ur+qziKQDsg8E0H6Gru8+hf/+04S6XwtQHNT/3lXAlF7XNtA4XiO54g3f48h?=
 =?us-ascii?Q?wD46piHFH63vWkFxv05Ec7TutMEt1yVmeY50YD5nV9YYXnPnKrCgaCqOb19d?=
 =?us-ascii?Q?EeL8wxeYIec+0kgFtkhZpfJ+9SqKrYCczXcVdnNOgjT8KMlmr7+chAqpJiyj?=
 =?us-ascii?Q?2T60l5LHLE/6cIifaB3Q6UPAP6hRvhiSQzaXtTO/xt6ooLG8Racz7JzZa2ol?=
 =?us-ascii?Q?7HKXK92SXwvSSjJgHxZn8Yytoup0m44Cozx59CI5tAN+sOw2VaTkoRUWi+5T?=
 =?us-ascii?Q?/a0D/j8m6ew/M7QmPLc3d6OUS+saWHi9NUQCkDQoQvtloHEM4pa/QUuVzO58?=
 =?us-ascii?Q?YmzgeNEnt4J0Ag5ueTHUjrrRsoh2fp1p/zPwdHzaNNf6Sz0DdZcNrt0vl57F?=
 =?us-ascii?Q?hyfvdxnIDSMVkErLptUUUT27p+kYW4FzHfyTC9WUfEeBhh+9QriePuK1q3at?=
 =?us-ascii?Q?Z36bNxq2FG9gyKAwkH51Hun3dBo04IPjYPWLELy3/jJmghMH3/kgrAnK0Usw?=
 =?us-ascii?Q?XhpD0wYEls7ar+yaJss9wQAdCrax7+dcv3uL2G/vtdh22OyC6ROowlRb7KDf?=
 =?us-ascii?Q?LrXp92JGrJdNq4I4Kz/F/FILT41aF5ZoQ1EWKwKeAgUal53lREn7+rp5xKFD?=
 =?us-ascii?Q?YL1kn0hBQ38uzNSDXa2x9kXJUO9VuHdU60MVs8XxiO/enyPOVdUAGJr2ECMT?=
 =?us-ascii?Q?9QcSRd8Oduy6e83xgLMgpoQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(376014)(19092799006)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4iRyyhyAQpUnofNKTmcHlodLpts8IdjcAsoAiseF1shAzHmNws92bfcZs5Qj?=
 =?us-ascii?Q?Aelnm/B9oKsgxlW+pnSmNmcMd6v0bwwZSuPUPI5wEU7TrRfopKf+J9Jnejda?=
 =?us-ascii?Q?ekPvGRBAbyR0AU0NQ+Uo6CJGA7abAmJ+9qeapXlOMJmt85b853gcmivVLght?=
 =?us-ascii?Q?0KC6WLXrvr3xqI73S4oxeHrY66jZdCN9+f0qKJB7N21GRrdHqa/kCQ4rg2km?=
 =?us-ascii?Q?hql2rTLyGea0uKskhaOfGn/l4JznYw56lfZD2SRF4zSBP/I3u+JFLp6y6P1+?=
 =?us-ascii?Q?Cy65zeUs77jgja2g3pKOt5u1wv2dYAc3iFSvufsecNthbMwKiRehyGUrqXER?=
 =?us-ascii?Q?YqyuF4EyBVQulX4IRNVjMn4dk/5NV4oOEFVuA88fLmC0GG1zty4nLiXF+NbR?=
 =?us-ascii?Q?77nTd/KDZRW3MMppdbahQ897Q9x32OzQGarasDdocVD2a1UuG9t78qL3h5mV?=
 =?us-ascii?Q?GP6G0i9Ahb5l2KKCabwyabCXaB2TXsMgPRnLGVXcOIwU7erPhWWIXxdCwf63?=
 =?us-ascii?Q?hbJSWWhQ/U/5uVepUsHUKD4UIB5EcGv9mlNKa0YfmfsgNnXiGNHK1zvIxemL?=
 =?us-ascii?Q?F/jOqVG1AreuUFESgcSVqqsEWajY+/wEkHSpIHlf4XGuj0CB7yRqI0GO/7U0?=
 =?us-ascii?Q?pAt2k671ev6gD4AfRo4JDnGeSOLy1Plyco7mNvlvmmd6W4TvFn18MajCYVGM?=
 =?us-ascii?Q?eRhc54JZe6eZLbbOkQTBlexpb4xUT0Gbh8DW6P0/0aVcP3+Sif1lCeRu2M8p?=
 =?us-ascii?Q?rg/t/uq5lwqhXV8NRBS0B4/e7ZrF9UqobzJ6SQ/k4vWdO1nwQlkiLq0NaUFs?=
 =?us-ascii?Q?UXmqLeiSyvPR/seJWx5DI2WJBdPlzsRBOADRIBTXXEp0d9LV3TYeejWm2kGT?=
 =?us-ascii?Q?LOfrmXp/Gh5zGukTV2ZOd/51QjHrUQmqchtzQqrJXSboqGRMTSd1GAo1Souk?=
 =?us-ascii?Q?Hg6g0X6Pk3yr6TaIdGy/3P+9HXDTFLm9xhvyhjE6EaWkPf4vmCQP76jyYhTA?=
 =?us-ascii?Q?JSipf3G8YER7FGKKrEDAcVo5jtB/5HuvP1xg/hqwwF/O4aNFfnlFxQXLRhxL?=
 =?us-ascii?Q?ILhVDexDZre5YVRE69gGQDBeJyaPm4nwlG5UYy7ZakDMM0cB3c5jPw4K/l4J?=
 =?us-ascii?Q?VcVV4fEXi2JHBOVLzvX6Wr/Y1c78KUaGPTa6cphfa+QIIkJI3VxTYzYlcHkG?=
 =?us-ascii?Q?ElJjPYyUP7bGRXjL2HS8LndiCsn5lIYGrA74RfGAxLWidZgs4v8GbEJa5YzZ?=
 =?us-ascii?Q?N0elVCpvvCC+HlL4/PKvOczYpoKRpKDZOMOnzROZe9Y5uLcXLtRxeWGHeZa4?=
 =?us-ascii?Q?Q+3/z0wemK7KWSiwRJyYgs7i+goAvLO8SwW2z+QMFYLwWFBEgDVKnPjnocU3?=
 =?us-ascii?Q?zGHXXrFU26okCKgVi4GJG+O+l4V2acfl6naunuer11UJW+aRTU12UGy0leDK?=
 =?us-ascii?Q?OVPOzh5+TkozDQ3+QYux0rBTBaEbueO3uRIP35rihm8+3s8NEOR3gkvKba0V?=
 =?us-ascii?Q?SSLiq0dW8F0OZb5cxOM7QvcR9EHJTDhA+AndC4qR+IDu1VJx1Q+Axek3B1+A?=
 =?us-ascii?Q?KDAJEwUt4lP0oslIP0SSAbp+OavRfBDjiubjvZQDT16OyvUin5UeICKrpv8g?=
 =?us-ascii?Q?7ufuMDlmJDP63QxV0KddwDmdrVLfziXhC5z9JdPS8jwML+sIkmzx+4kM4N8J?=
 =?us-ascii?Q?K5JrXm37zfNOx2i5xr96o2tojBJUbMbVtK045S5Ip8SlWQuPL8EWaz8BzFIY?=
 =?us-ascii?Q?0XcpPZUJsg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b7ec267-825e-45d4-a83a-08de5840cff6
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 16:27:33.3527
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r/2D7DcHKeMgnlE4TwuFD3V3EUtl/ZfI0mRMQ90xzMyQeUpRUlQZpi3xEbLrWBOPCw7YfMvUhzOv/5NQ5UX7FQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10764
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_082737_849363_856A1BB9 
X-CRM114-Status: GOOD (  15.60  )
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

On Tue, Jan 20, 2026 at 07:16:46PM +0800, Xu Yang wrote:
> Add missing platform_set_drvdata() as the data will be used in remove().
>
> Fixes: b58f0f86fd61 ("phy: fsl-imx8mq-usb: add tca function driver for imx95")
> Cc: stable@vger.kernel.org
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/phy/freescale/phy-fsl-imx8mq-usb.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> index e9c113edd470..028c4c9dea40 100644
> --- a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> +++ b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> @@ -778,6 +778,8 @@ static int imx8mq_usb_phy_probe(struct platform_device *pdev)
>  	if (!imx_phy)
>  		return -ENOMEM;
>
> +	platform_set_drvdata(pdev, imx_phy);
> +
>  	imx_phy->clk = devm_clk_get(dev, "phy");
>  	if (IS_ERR(imx_phy->clk)) {
>  		dev_err(dev, "failed to get imx8mq usb phy clock\n");
> --
> 2.34.1
>

