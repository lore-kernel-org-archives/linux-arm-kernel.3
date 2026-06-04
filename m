Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E045CD6E6E
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Jun 2026 19:35:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D5XL0U6Si5emrgYD13kymNIHryijHlyLnmIY/dEdw9U=; b=yhSWI5Q3nMjNlITq+/nkrIaMT/
	I9lBiLiqgdzLYZxJ3Ipu756IczLxPCugV5PIH6mZw3TaWOGHdXX1tyN0O6rGeEecsX0slvke8HWVa
	JRKyZDN62rYi07Eq2tBGcgo50g8u1F/6BS6qizEqevDZ5Z/Pr89SlDVy13qvY0mBY0OJAJ2yE5IWd
	bddYkVIzdIcYCcUXplOGq5IsvgkMTpytj/YeYdtaxxcezt7YQ/yiVjnS066eJ9YZId33DhMbvoz1q
	Q26jKmLT2FAb4Wl/5EL8Ip8lcGoOQRKTFWhDKMIM0WNgxtHWybMhiqaPn+D3VYrZBLt8badALapmM
	tMZhmePw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVDq9-0000000HDgC-3qCH;
	Thu, 04 Jun 2026 19:34:53 +0000
Received: from mail-francesouthazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c207::3] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVDq7-0000000HDfq-2yFy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Jun 2026 19:34:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SzeHSkb+ZOxgjnjMtVXB+Fg16qGOxkVWkgEWCLPvhtB4W7tcvT1lpegEvxbnBQr10rxZu53rKSkd06u0TyVFuYgdIjCw/0iG8HJZARydMFjUUdz219nHPB7cvX15AMdvzYr5G01Wcyx14Wqvg8XpX/VvNNkv2yKXDoAQBPSuZGR4fwYv44x1wAIXUlHPC4ErKhMP1WHJwudFhNN+T2mH1G38EMXBk2y+EQ6NBxb65SuupSdkoJCLLhmxoNwrMFua9Izz26XT3z1QlNPE/i3D6AOIdOW8zLlkOxtjytTJsCSf7P2mbXqhuJ2dIqRAHxG0gKjkGSu9m2euzh4RWSX/tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D5XL0U6Si5emrgYD13kymNIHryijHlyLnmIY/dEdw9U=;
 b=t2QmVg5mQekSUWg1m++eJEgzYjxdJqqA0kUsGtuVT5B1wzbOjP8epKvuM3YD/DKY4IVxZpIKKqEmo6lUoWhS3GI0eG29fmBnpKEDUCHv+iOAqmwGVArvrat+xzjdwxT7AkKCiEMHl0F4Fe4l0pgwxmKAq5PcXfByABkhg/a6A+/pTpdFmFH28y0pOx3xu19mqm158U5BjIoS4dfI+GdqWSJk5Lf7WNI20dAR0SLffDRg5Wniq3nylxmlkZVVxNpBQs8QsWdPlpIZf9K64lY0LsfJw5lewy1trZC0X7ABSak0uini4peHfFU2OOffruWOcpQ8iyDpN+wEK31rJJMj5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D5XL0U6Si5emrgYD13kymNIHryijHlyLnmIY/dEdw9U=;
 b=TV8Ntqu+GuoEocFQZELTs5rdUNMCA5lAXaD/BYJPJBpIiFgufOG4HbUwpkyR0gfHB1t6ltMxh2B1NR/V+nX+zN20sw+g79Fa0ryP1HL4mMJ348rxoKG/EWY2MTs6WSwaKisys8WuXoqebaBwk+pfHLADpNmQzDWWo2yN7rlarlnJ0k3YeACBnEZDGNnkCHv+ZApLfeie9v4UPNP1zDQUpqh3qM6BUQ2uFmwZkc4dKuiHmfJN1JM8IqOqQ2PPeEf729KDiXWNjnLKqxsDCS3UWe11zOG2uksq8r1KbQz+/gPOqDwSIIuJ1XTJ6SFO6w2STZoC7fkKXBjhbRC2rxBajw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by PA6PR04MB11870.eurprd04.prod.outlook.com (2603:10a6:102:518::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Thu, 4 Jun 2026
 19:34:47 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.21.0092.006; Thu, 4 Jun 2026
 19:34:47 +0000
Date: Thu, 4 Jun 2026 15:34:38 -0400
From: Frank Li <Frank.li@nxp.com>
To: Richard Zhu <hongxing.zhu@nxp.com>
Cc: l.stach@pengutronix.de, lpieralisi@kernel.org, kwilczynski@kernel.org,
	mani@kernel.org, robh@kernel.org, bhelgaas@google.com,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2 2/2] PCI: imx6: Assert ref_clk_en after reference
 clock stabilizes on i.MX95
Message-ID: <aiHTTvInYK0uj_G9@lizhi-Precision-Tower-5810>
References: <20260518072715.3166514-1-hongxing.zhu@nxp.com>
 <20260518072715.3166514-3-hongxing.zhu@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260518072715.3166514-3-hongxing.zhu@nxp.com>
X-ClientProxiedBy: PH7P223CA0008.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:510:338::6) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|PA6PR04MB11870:EE_
X-MS-Office365-Filtering-Correlation-Id: 72fa82f4-f5f3-4c05-5a18-08dec2705607
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|19092799006|52116014|376014|7416014|3023799007|22082099003|56012099006|18002099003|11063799006|4143699003|38350700014;
X-Microsoft-Antispam-Message-Info: qvCxhfZbNYuex1dldaoL0q5mSlMfLDfwsOTG/fWIpT81v5GiGw7wVrRA4Bh6PprHdbhJRaSYJzroYLbIUITC/mejJW0Q0ZXg3FhTeXmlcTpjZk2tr4nOiPdkjMllAbRXYkAnZGP2TAiRYG3h9nM6ULAtkpqdhSUw8RvkfEl00/KgMmXVmRQ8SBt2Jfrq+/D6ZLdD5m6BPHALBvK61HyOBweONgBU44CMEAB1ZntbNLEJv8f5ZxSNyZHz+sOmYpuTzc2mcWE15wKuNYrbubthlI1u4AAzdKij11ntVgkZKosyvTGrQWdgLvYMqX4lix1fedy1PUGUHyTLimZF7RqsCX69y7ba/g0xuT8InXTytHe0zOlUS7EDV4+7zFhJDUfsehS1JjdF/8k6MkrNd5NGAQx0+NGpyRekkceRdNoizqmhO6flzlXlVCkL0qOSG557xr0PR8PPanDV15PUD2Y1f7NcrcXbzJqW361VRUSszQTFCrhVBoKHChAmC9fSz3xYQ/SPu1MxJ6pt6A0uzm9ITWaNl6AecCDne6Kso/ZJrjZy7dSaYlcDBATMXromo4JkHpY0Lx3pWbRSmyxRB9++PNaMcVmvGRFkSnvF+sTIeRSAg+pkNJ9rVC0eT12hjgSVFogyYYuWBMEnDhmnV4sedEySjGCfqJ4k1hs8U5FDCavCWdAAqb6eLlzwBtbDCyv6C1yEQE2oEYMSC6uMf+a9L5sI31Kc8MDEZQqVhmVjzFI7ULBRFNdW80yambshk3K8
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(52116014)(376014)(7416014)(3023799007)(22082099003)(56012099006)(18002099003)(11063799006)(4143699003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Paujby2OD8pA8vRzpi/6c68KvateV0injJSTUzSfAkRA2TGlYxlV8brQjxah?=
 =?us-ascii?Q?QQOAvnwyqm/XCYz+Sr+rAgghfMMRFsB2uwMN+JE3J5QYH8fztpOz8qvWKurQ?=
 =?us-ascii?Q?Z4XvHWr2iR/ZGEjmV26nnRjsm1ulw8rZ2dC7UZI5jkGFAEMMzEBweaj/g6mE?=
 =?us-ascii?Q?GYnIDllLUrkS9NMfFm04ZtEQrs4IsJY2MKrynK1r/YWJOQK/0NZwv7FF8nW3?=
 =?us-ascii?Q?Zk0CLBkpVkIvy67sU34ppS6U54kFl0vAfktmd5wqGpnhGTDjlNhJgsF6gUyJ?=
 =?us-ascii?Q?hJ/CCZYJENccxuw+ZO5zysXzdD2SsxNCJDMhOdpfpiCVzUOwd5jBEkGvye9A?=
 =?us-ascii?Q?J7jwNbF+nCeIkbf+wYAadL8u3Am2qABLIYxm9+fKccCG13pSctGKo8PSCBvE?=
 =?us-ascii?Q?Z7yfj5p7EMLy3e+wiuqPST3OoqkYB8rdmqQXjjCIig29jAwBo3ZKHXUDV/al?=
 =?us-ascii?Q?C1vp+q6Tb8039cliVWX//RjVq18DdM5EyNOo7lFJwDzYSA2FGDTpe/idNDz4?=
 =?us-ascii?Q?9roKQUkSBCZfRFQgJ/WwCDErn5YUNp99ds80qAyRozRVqeSsh/onK5QrnWC5?=
 =?us-ascii?Q?n7YC17pAXAu4FwOHhzDaIzYEBDIG+05ghKTo9YyPn5e9oXErZ9cT7d4SlpP8?=
 =?us-ascii?Q?0PfBqZ8tGvIl0VCyJTAe8RUWZ4eQrKia3Z6DoicVLHztTJmkuF8w90x0pYqd?=
 =?us-ascii?Q?yNKwLuT92rbojomnUw0HEMYY1+FuQNegJcKsKyck/q8q7R5QGt0kA9XErGMR?=
 =?us-ascii?Q?VLvc8tYqhV46DLlZyDidddHrViPydD+JQxUk3yYlrd8xKLmtdfI4lYOx1+4A?=
 =?us-ascii?Q?mYFs96n3s+lz8RfU9m+efVvulkq5ydBCf5/nkUCzvr1PXElHh7BdTiQaRbBG?=
 =?us-ascii?Q?UAOjXi1w5IiTC620TtH3lTWgphD3JSoPg+feicggAjoqxvKzwFLuQddZitcG?=
 =?us-ascii?Q?n5X8DSP0PgWrd0fsQq+UDspoaR+QCOq4WiQ6wamduktZsx9dL1eb53zypM15?=
 =?us-ascii?Q?oG6a73A2+yKxdd6yRn4+5xKKgf8O8zNx3DQ5XQM/RUqLPe46iNmU9924SvTV?=
 =?us-ascii?Q?dNorWCjnWT1X9CAzMUBD6xp3zdPoKchwCCajOOvLKbLDFLGPYPAbqBlFIs7a?=
 =?us-ascii?Q?FWtz1+oaRkrq68tyRzjopw0MJ1OFSc85sWp9ZBDK4seJ2XiGcOrqg4eI/bFl?=
 =?us-ascii?Q?8gf9NgaH44Uca18xr3zgwZX+VnAcODtC29TwBp0KA14ql+xVfllc+jDHJhMN?=
 =?us-ascii?Q?K/ZhseZKxHrFznPgj9pZgRNLz0bRvkE0Ph696WHzaGe15PFrMrOEKjEks9wl?=
 =?us-ascii?Q?rklULa0sngT4s2KE6+21HnblSupBSWVutW2mWMVIcUWKphhzdh+cgcU7pQVT?=
 =?us-ascii?Q?KkXEOaGUYIXVEVBrlFC/Pg415UEcsUpCR296Ud3Hic1xr8PVG1zFGC0DuI2y?=
 =?us-ascii?Q?aV8WOaIdX7Skaq8x0atguXjQn07LEG1CdrrhggpSPkqvOLaXbjJDDsdYMcwJ?=
 =?us-ascii?Q?sYq9KRFhpCDcaoaOwOWbg4nGAEUAJ3uco8Nn8TxFdjtvzNJLV53A6R0go7Iv?=
 =?us-ascii?Q?SblhRHOkx8Wu5SUQNMTVd3P9hCOiyzk+WkCZ0paFu79o3xFafBf+PbDItWZq?=
 =?us-ascii?Q?opVRYNoM2t0hThkr6UDNqLEfrw9dBWMJnP74Ot9aDpmNqwzC7ek9Pc56bVKK?=
 =?us-ascii?Q?YLjBfxzdhZ6VHc+0mNcCRXgtPttSMSsqkK6VSfhUrTmPYbSibyq7m8VHnjH7?=
 =?us-ascii?Q?L2zHmPm7RA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72fa82f4-f5f3-4c05-5a18-08dec2705607
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2026 19:34:47.0717
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HRnUAXF3F7NCM8J2oNDcCJUKcd/h1vHXJQ+jqtEFZtSFlZQO0wvr4Aa/cFDtM0OrkvzMXvY/s6WSvIWGXYVWvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR04MB11870
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_123451_813536_DD2792D3 
X-CRM114-Status: GOOD (  23.39  )
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

On Mon, May 18, 2026 at 03:27:15PM +0800, Richard Zhu wrote:
> According to the PHY Databook Common Block Signals section, the
> ref_clk_en signal must remain de-asserted until the reference clock is
> running at the appropriate frequency. Once the clock is stable,
> ref_clk_en can be asserted. For lower power states where the reference
> clock to the PHY is disabled, ref_clk_en should also be de-asserted.
>
> Move the ref_clk_en bit manipulation into imx95_pcie_enable_ref_clk()
> to ensure the reference clock stabilizes before ref_clk_en is asserted
> and before the PHY reset is de-asserted. This aligns with the timing
> requirements specified in the PHY documentation.
>
> Fixes: d8574ce57d76 ("PCI: imx6: Add external reference clock input mode support")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/pci/controller/dwc/pci-imx6.c | 28 +++++++++++++++++++++------
>  1 file changed, 22 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
> index 66e760015c92..c4b079c93648 100644
> --- a/drivers/pci/controller/dwc/pci-imx6.c
> +++ b/drivers/pci/controller/dwc/pci-imx6.c
> @@ -270,8 +270,6 @@ static int imx95_pcie_init_pre_reset(struct imx_pcie *imx_pcie)
>
>  static int imx95_pcie_init_phy(struct imx_pcie *imx_pcie)
>  {
> -	bool ext = imx_pcie->enable_ext_refclk;
> -
>  	/*
>  	 * ERR051624: The Controller Without Vaux Cannot Exit L23 Ready
>  	 * Through Beacon or PERST# De-assertion
> @@ -290,10 +288,6 @@ static int imx95_pcie_init_phy(struct imx_pcie *imx_pcie)
>  			IMX95_PCIE_PHY_CR_PARA_SEL,
>  			IMX95_PCIE_PHY_CR_PARA_SEL);
>
> -	regmap_update_bits(imx_pcie->iomuxc_gpr, IMX95_PCIE_SS_RW_REG_0,
> -			   IMX95_PCIE_REF_CLKEN,
> -			   ext ? 0 : IMX95_PCIE_REF_CLKEN);
> -
>  	return 0;
>  }
>
> @@ -742,7 +736,29 @@ static void imx95_pcie_clkreq_override(struct imx_pcie *imx_pcie, bool enable)
>
>  static int imx95_pcie_enable_ref_clk(struct imx_pcie *imx_pcie, bool enable)
>  {
> +	bool ext = imx_pcie->enable_ext_refclk;
> +
>  	imx95_pcie_clkreq_override(imx_pcie, enable);
> +	/*
> +	 * The ref_clk_en signal must remain de-asserted until the
> +	 * reference clock is running at appropriate frequency, at which
> +	 * point this bit can be asserted. For lower power states where
> +	 * the reference clock to the PHY is disabled, it may also be
> +	 * de-asserted.
> +	 * +------------------- -+--------+----------------+
> +	 * | External clock mode | Enable | PCIE_REF_CLKEN |
> +	 * +---------------------+--------+----------------+
> +	 * | TRUE                | X      | 1b'0           |
> +	 * +---------------------+--------+----------------+
> +	 * | FALSE               | TRUE   | 1b'1           |
> +	 * +---------------------+--------+----------------+
> +	 * | FALSE               | FALSE  | 1b'0           |
> +	 * +---------------------+--------+----------------+
> +	 */
> +	regmap_update_bits(imx_pcie->iomuxc_gpr, IMX95_PCIE_SS_RW_REG_0,
> +			   IMX95_PCIE_REF_CLKEN,
> +			   ext || !enable ? 0 : IMX95_PCIE_REF_CLKEN);
> +
>  	return 0;
>  }
>
> --
> 2.37.1
>

