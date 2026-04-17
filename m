Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 728D6F43683
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Apr 2026 09:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FIcCuMZMtP7NnNb1CPgt8rirHGz7U8usKLgTyihFD+8=; b=buK/Di/b9jlirCda4LdLZP0Aav
	EuF82OJSNdPfkFGRQ8NDEOCnq92xP7He9pyDtkKrCYVk7geRlYQWNyLyfWKCSrl73R7k2mSdu7zxn
	3sNEsjoE96XablTn0a/zS1RAGzVI1hDM1T/4SgAp09vElqVmcWcCnk8UfmVp4Ma93svlLaEfbq9g8
	QRbgs5jIecnz3lKcGwAXD6bKxJmLlT8SWl9Mfh8vlsijoRf6Jq/wQxsRw/hTBtRbRWqwqk+e9tf6I
	8ob9J5XvgDy7Q/T0lvTUS41UDaxDPyFQ9vKZw9LhXFCwbHkQi24nCjFR30Ho2vQogXRvebtplicZ5
	PDHR6/LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDfld-00000003ql1-177p;
	Fri, 17 Apr 2026 09:45:41 +0000
Received: from mail-westeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c201::1] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDflb-00000003qkT-0EK9;
	Fri, 17 Apr 2026 09:45:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R0m+KZRyPd41YtImi1iMY8WW1qR8/Rr35gaRnyvwhZZSsEFG/AcEIHAo9U962brXJrLaqe1xbNTrkoUPsearxQqDfj/ZxXnU8TLK4t4ZcMkv5FBMUW9vQmf3ifITtYyowkojwvwssAK/Swd7B39B5Kwqa/lpJpxBu5Po4eVvbkNv+jH6+HllQXnZm/HpJhHp/HlmQ9EcZJ3pvz9LN/Kloz8A8qZ0yURxUPUJITxclQ+EcpYWrXZTH8bQ3hqRIH6FSWEpRODsdKAV5kszqrGjo7VGOjzZeEh9yG9NALlrDKn3rXgZ8zM/eKViu+BBDtg9uXqHrcbfixLDmIOBLyfqXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FIcCuMZMtP7NnNb1CPgt8rirHGz7U8usKLgTyihFD+8=;
 b=gR3bS9DX/wAJRlya9TI62XLrpJyMFziRkDw0AESsl65CRZqmrQULlGh9r9WTlPteqqiLY/ilv03YOrf4yIBP7iWtqXw5N1ZUQUA5tOilYZLj0pyVt8oWNC0iaopEVR9d3xW0mxBbJbJSLzHevALvk7GYdPTraqTIOVg/ZmMUhNVqodPWrACMYjgfE72H8ZPXC+bw5+HmajzECF5yuu+1W5/89YAIFBSvhcdXSSfdEWJUXwNwiU5Ltw1vyiGcXucxB/sE835JWgm8UvCxjKA2OmBFrAMyFnCbJq7SA/LtixUlFbZdDB6YV2D2bBo8rIBWJ4B26lmqo2JwA8DsuC9kGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FIcCuMZMtP7NnNb1CPgt8rirHGz7U8usKLgTyihFD+8=;
 b=nS5fWp8Jm4NDvOFAS1qlO873CG9xn2XytcIqJn3TX6P6GGWkjqeYfJCY6ug3Cy1+aR0fVPFwCGK4dklsfZzMTP4g07VSxIMVw4j9vL9GpiZ/Bz5VoM3ZyTc/KhhQo05s/Is+uHV5DpdGNdMXedrV2IRdmTz5qDhCGaeqWRhyMg1oe92iR2RIRqLETWrpeOcOmII5O6xzfEIP2Bi5f/NkgVNu/8Z7ayjaBToArdiYm1maQ5Rtexc461A+hC/DBpqlT0rv+iPrBUDWK8ZYQ4WqEybsEPBzOg8c0lSxDZ4yJ/+5O8i+Y/mLoSCkH4TThgAKPj9mA0MaBYyi3XvZNGY0gA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by PA4PR04MB7680.eurprd04.prod.outlook.com (2603:10a6:102:f3::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.25; Fri, 17 Apr
 2026 09:45:34 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9818.023; Fri, 17 Apr 2026
 09:45:34 +0000
Date: Fri, 17 Apr 2026 05:45:27 -0400
From: Frank Li <Frank.li@nxp.com>
To: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Cc: Michael Riesch <michael.riesch@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 5/5] media: synopsys: Add support for i.MX95
Message-ID: <aeIBN_sPsX4ydonk@lizhi-Precision-Tower-5810>
References: <20260415-csi2_imx95-v1-0-7d63f3508719@oss.nxp.com>
 <20260415-csi2_imx95-v1-5-7d63f3508719@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260415-csi2_imx95-v1-5-7d63f3508719@oss.nxp.com>
X-ClientProxiedBy: SA9PR11CA0004.namprd11.prod.outlook.com
 (2603:10b6:806:6e::9) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|PA4PR04MB7680:EE_
X-MS-Office365-Filtering-Correlation-Id: bd5e3606-ba74-4277-5007-08de9c661273
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|19092799006|1800799024|52116014|7416014|376014|38350700014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: B7heXnLqfsfdSbhdEf+UNUh17OSqvtyUTKSQj9lOHa+9UFtavv1VE/UtXmhLQqBNnnsgplcGOuC/4Hts2VW+M+TosZLxEcMxVI6yvaRFkuuy7Am6RN2EDjvi+SxReJQERhwu1X9weKEcBiKulXzEPqRrmPqZMUZC3YiOtoED5Gb+FYZyVI9R1wQGOjQva2+r9WrwEBXk0rdFoXXYtrpBnoa3jeuTY4Dl4CbtayVzqvuZVu0NAvWyUQIDfB/IT72LmQm1vPzZfqkCXOZFAxCKYtPLdGZ4G0rk+ylWX9ddChUc2fxCJOq6jB/fjmz4+Irt/W7VUOWGxCnN3+2iz64fcgGpxor3hnaAQUoIEqDkAqTmzkDlRhV7GmTGTmKjioVcvp7MjSV5VTHVqU43vL+l+frraIZuHgJ835RKCi+3jzyOBCwzh9TtfQwlEfGKrVajt4TKWTvCltzrOg5NbAaSS5vM6tJMcPg8UV4FKDLK1g84Q+CxsMp6VxMQiMEmkaDpmAjWLeYNGsx83Y5CZ9ajM6OWrM4alC9w9MtKkLKrJOVSTwCOnAIjAEjNT4UvOLiuGOQJv24J+HD39qJYkJ185VnJBTvOIOtio32dWp2JatbQVN+IBPx1ZtjbTKeavBjuM9rF7R1sQt3apv26o9bRNpXVJi66nk8+wph+Ihrpp86d+wnZ9fUOdGB0XBiNX/+KdD3MB3OQVArFKkpSt1wJpRvp+l+r6zrYtyZcOMhQlhOq5zZj1tt13ZO9Xm0/UJfVz2v61z1Xke8nq1qDQ1NNat0d+LKWr730YxeouBbhrPw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(52116014)(7416014)(376014)(38350700014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vTKHxdu560SjqHkzAAdpieVkKfmUY3hBQiBhXbWJxUct4AQN6AVzE+NwNOo5?=
 =?us-ascii?Q?aaHsTopyGy+b3VrbbBqSY5bEEOJrqotAn3EbSazD8dDEyOZYSfgxfGpnyJBd?=
 =?us-ascii?Q?TULBL8DGZKtBMlw/5KkspcT9aTqEshWAPRyi8mXtgcuMm7DuyOEfX6tc6XPm?=
 =?us-ascii?Q?E21ROMWdNn47VSclDD79Yto2bJ/Hg38ygZmr/GzDKMhY81nk7dFLXMsoUebc?=
 =?us-ascii?Q?VhCVK1RFVe29XlpYOH74pd1H8BVdhZzRIvdmzfK+xZK+GGXk34W8Rx1fBiFv?=
 =?us-ascii?Q?O97W2MgcpTsmpEsW2HqDeWmST4SPSl9ZMRKRh2LkOseUAdtI9SRjRJV6/Pnb?=
 =?us-ascii?Q?aHpoSC9R5Pygc9GGjY95+IrculE+89ZtC0dFhMyw74ZAJiWKPLWoyxNdlN92?=
 =?us-ascii?Q?vZpekFUPQm5yH64tfcF8/yQKxVfsCvw7/DF0hi0wSy/QNnv3VzuMD8sGlfl1?=
 =?us-ascii?Q?oeQ+BCZCB0kbSPEiYrgjglX4dVFVdflOWYRCjMok+E/Ppn+IU1AlFGpc2NIc?=
 =?us-ascii?Q?vJjjJBozABaQRao83oZUtnDEJ8LyKca6d1mqfD59hjSQQBG4qelqRu3ubf/k?=
 =?us-ascii?Q?5Z3ZFedZicQKOcSVXBR2lbC/WT+HrssAO/EllC4d0yM3doipOiPPXaUrfy/4?=
 =?us-ascii?Q?y/bLCTJM2LnQbUrSLMQEZmknGXD8P2Bp4R1q/JAaIbAkVsqCVRayK3k86HXw?=
 =?us-ascii?Q?9dGe4MDUS7c3Sr3vTKLa+zSLXrSS/8fKEQrPKQwTL3l4xuaVKkE70dIt+0gC?=
 =?us-ascii?Q?JqbG8AV4BSkrWRq5CnzttxLxtsCYg1GJ1DyhUrDvoelcgW42cRCsBTJ9Qq4+?=
 =?us-ascii?Q?iW6KWvpDYYHen+pL7zTu91UEsNw6R+Xzy00vyrImMm6UM7bbJI87ufjF+wCn?=
 =?us-ascii?Q?xgzp4LsTL6H9K21QTxkMiroFsvVmE3cHnWG5kYYDurmyfnjAzpuLtygx/B4Z?=
 =?us-ascii?Q?80qGF0qMT4BliysDYqg46I+S2dv+wcmp3grpnf73bAuBhoyHxaX+745g4ncX?=
 =?us-ascii?Q?NOUFVXEJ0kZa93etORm1AhbBbevhk+6vbXIXMRj4WzTeEObl5vLhXSGYH09B?=
 =?us-ascii?Q?tEf/rNO3CYpEp+szDemXrbT1ixjhRcTbbOgLBxD9KzPoivwv3mngDV91EdTC?=
 =?us-ascii?Q?e6NSCT2MvkX8u4VnPE0HuNki8gVh6lSndxda2VN2DJGwbvmlnoG7cUqGyEv7?=
 =?us-ascii?Q?1sfUI+OYxdvVERjOacckJkmPzk+mHsDB3xb18xngya75Q41XIGKFT4mmcLGg?=
 =?us-ascii?Q?OYtUyGgRZAfYUl+ZZ3vvBF8zhJvsp3INqyysoLCjv5KCdkEDib2O9E8UI4AC?=
 =?us-ascii?Q?QjEmz8HqNEI0596F6+7lyEbKPQoFWhaxa2IZ+Om9amkbj5I61yN2b/xFDFEP?=
 =?us-ascii?Q?j8y1pBATt/4EcGGs0dP1J/gb9ocUIkDYHqEYN6zZwaYSg6hvV07lT/sWskL4?=
 =?us-ascii?Q?sJxRrjatzMazr/BA9Ld/jQCH1sRaLtb3mFGYoToQt01c8jrWaxEjwMyCl5Qu?=
 =?us-ascii?Q?qMNQT5NDGy0oCFQpvdJZgPF0qy9mzh/JcPVUFQl3gCslFpg1CwZBtEpiHxap?=
 =?us-ascii?Q?Yub8JNL2IfKN++t/SIoad79YjN8D0Ky1Ishoq6kIvY+I5fSiofj9i2w/CAw9?=
 =?us-ascii?Q?vwFri61AZLnMn6Wqssl9woHbOimb2jx+ewc2pLJjuAgwYMA4/mnPFnhvi+Aa?=
 =?us-ascii?Q?yrHamnLrsGasMKscDXeFO8wyXZU399rWnZ3pDuN/aiANdDLrUcHsZzPg0aD/?=
 =?us-ascii?Q?ZV0WAHFD0A=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd5e3606-ba74-4277-5007-08de9c661273
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2026 09:45:34.5068
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5lKMgM1hrNKZuTOozcxYEsDxy92DYC/autgJj6ShOrgU5/F/VI+cmRCqvdwPItk+IQTxS3ru8+03y2GQj5VAQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7680
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260417_024539_123519_EDBB4894 
X-CRM114-Status: GOOD (  18.24  )
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

On Wed, Apr 15, 2026 at 11:46:56AM +0800, Guoniu Zhou wrote:
> Add support for the i.MX95 MIPI CSI-2 receiver. The i.MX95 variant is
> nearly identical to i.MX93, with the main difference being the use of
> IDI (Image Data Interface) instead of IPI (Image Pixel Interface).
> However, the IDI interface is transparent to software, requiring only
> a different register map definition while sharing the same PHY control
> functions with i.MX93.
>
> Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/media/platform/synopsys/dw-mipi-csi2rx.c | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>
> diff --git a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
> index 27e4c1027816..bbb41baf789e 100644
> --- a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
> +++ b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
> @@ -154,6 +154,17 @@ static const u32 imx93_regs[DW_MIPI_CSI2RX_MAX] = {
>  	[DW_MIPI_CSI2RX_IPI_SOFTRSTN] = DW_REG(0xa0),
>  };
>
> +static const u32 imx95_regs[DW_MIPI_CSI2RX_MAX] = {
> +	[DW_MIPI_CSI2RX_N_LANES] = DW_REG(0x4),
> +	[DW_MIPI_CSI2RX_RESETN] = DW_REG(0x8),
> +	[DW_MIPI_CSI2RX_PHY_SHUTDOWNZ] = DW_REG(0x40),
> +	[DW_MIPI_CSI2RX_DPHY_RSTZ] = DW_REG(0x44),
> +	[DW_MIPI_CSI2RX_PHY_STATE] = DW_REG(0x48),
> +	[DW_MIPI_CSI2RX_PHY_STOPSTATE] = DW_REG(0x4c),
> +	[DW_MIPI_CSI2RX_PHY_TST_CTRL0] = DW_REG(0x50),
> +	[DW_MIPI_CSI2RX_PHY_TST_CTRL1] = DW_REG(0x54),
> +};
> +
>  static const struct v4l2_mbus_framefmt default_format = {
>  	.width = 3840,
>  	.height = 2160,
> @@ -901,11 +912,22 @@ static const struct dw_mipi_csi2rx_drvdata imx93_drvdata = {
>  	.wait_for_phy_stopstate = imx93_csi2rx_wait_for_phy_stopstate,
>  };
>
> +static const struct dw_mipi_csi2rx_drvdata imx95_drvdata = {
> +	.regs = imx95_regs,
> +	.dphy_assert_reset = imx93_csi2rx_dphy_assert_reset,
> +	.dphy_deassert_reset = imx93_csi2rx_dphy_deassert_reset,
> +	.wait_for_phy_stopstate = imx93_csi2rx_wait_for_phy_stopstate,
> +};
> +
>  static const struct of_device_id dw_mipi_csi2rx_of_match[] = {
>  	{
>  		.compatible = "fsl,imx93-mipi-csi2",
>  		.data = &imx93_drvdata,
>  	},
> +	{
> +		.compatible = "fsl,imx95-mipi-csi2",
> +		.data = &imx95_drvdata,
> +	},
>  	{
>  		.compatible = "rockchip,rk3568-mipi-csi2",
>  		.data = &rk3568_drvdata,
>
> --
> 2.34.1
>

