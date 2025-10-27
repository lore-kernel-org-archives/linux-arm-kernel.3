Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FF20CCF9E5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 14:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rmvoGEBDMzqv/HiRNeMJ65K7Q4Rt+vnBw4Ih2pnUFUI=; b=SIj0WJ8vROPBrJ5OissNaqf/R4
	z0Si9zduAMMQCsIK6PtzdPxWvThLpFq1VygvRmrL1iCW4rj++XDs+qC7JwpgLxGEUxxWzNfSmFiO1
	7SNwFbxU3SG6LF75MZWYCFT6INMR6hXoeDL9GxkUMPjKbCrq+xJrxEJJVZALzb5Edq5EXxAGX0XZD
	Ge+te93kZVTeWdK3mdGXah9hZjYjnyCsYqdl0ZoR2rQXJ4TwjsSpxWatszFbmIGqMtV/6xYGM2DbC
	DHLulULf3d6sqv2ocMyejYQ8yqF9FhSkmlyrHD1uX9yF+EehMbj8yYfJENeGDa/+vPjtPjYWos4GC
	wN6eVBzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDOgI-0000000EAsI-3Vdj;
	Mon, 27 Oct 2025 14:58:46 +0000
Received: from mail-westeuropeazon11011037.outbound.protection.outlook.com ([52.101.70.37] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDOgG-0000000EAro-17bd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 14:58:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zCg4IpJUUTDPekhCLsWssImBivhVuWrkJPLK4A2Fh2+xWdUtym5wLE4/lVR6lu0gk6dpftY3furHK74C81iOfObkBgADp5wurDww8TgXqmKJ7cPrJ/n25XMk4ht4Cn/IBh9AbZ/AR157NAKTeMBS0lUPHHMwazxPCwlwDWGYy3/l0rtcQsIgeI6HcExX3rhAfohksO8jJYoXszQsbMlGqRcJWtjM738337TqIHbQFl/z7EBxtNcJpAWdF/xwP8kr4FT0Hn5WjV2Negzh2pFZr2+QSNZ9v30bd784wDm1lw7XDm7sVCCvrk0no2+r8tmZgWfAZp2Xy9/fW2gxCGlJCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rmvoGEBDMzqv/HiRNeMJ65K7Q4Rt+vnBw4Ih2pnUFUI=;
 b=ixWbvNQYAOtca9EREMoiFHhikMD3RFhlKMz5WgBX/gQkcekxM49dLFMs1OkvkKGvYEjrJX/Ff1OulpJ3AfmDg9fLxn24qWmfpDP/YJkTBYp6t41K1ZzHxh5Wmlm6Sj2cfRo9PGYmShv7O4/j3WPVd+jSY9Ie7waEXAYjldSiM2a2mGmkYAxJFpRghgORBQGe16cmYqsAkkwldMo3kEDEV9MR/EJbLdn/FJ4dNOsa4JTZC8mT15yLxHueQHzJmqZxqwwY8LyRzY9QtEe94o1Dy5TpALVwrKS0HK5F6nVoBa+Avmq0i9A0fhWnxxjVCdZ8jHlOxQBjOd6HXY9gc9M4pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rmvoGEBDMzqv/HiRNeMJ65K7Q4Rt+vnBw4Ih2pnUFUI=;
 b=Xxv9K3537zXXMCiAdCFGduk4ScWfFFpjBs8EbrGhY12LR1jfl2CRHctNwYihXn9aBrkTNn5TbNP6lpJj8z6trQvUO9QrnNucklMk6WuI8hKlSyn52Nf/qQXLXqxsWufcXMxaJmkam03tWV33WC/g3fgN5lvS26fPITYAOOfbfI9GvN7GvKL0krv8rmlJVOzHCLuPYf6CaN3YJNKus+dZZW3oDn1ALau9A4s7zjUnx7NtoWdpAf1hvMvh2vnDqJZJZg9v+LEi6PBxDBkyFyui8RX0DHzAKk9hEO7bK6EjoJQh8rf+HS3ZFvXp4iWJ1As0YJukiSAwG6xLL15OihuzEg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com (2603:10a6:20b:4ff::22)
 by AMBPR04MB11809.eurprd04.prod.outlook.com (2603:10a6:20b:6ee::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Mon, 27 Oct
 2025 14:58:33 +0000
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e]) by AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e%4]) with mapi id 15.20.9253.017; Mon, 27 Oct 2025
 14:58:33 +0000
Date: Mon, 27 Oct 2025 10:58:22 -0400
From: Frank Li <Frank.li@nxp.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Shawn Guo <shawnguo@kernel.org>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	bjorn.andersson@oss.qualcomm.com, imx@lists.linux.dev,
	Ze Huang <huang.ze@linux.dev>
Subject: Re: [PATCH v5 4/4] arm64: dts: layerscape: add dma-coherent for usb
 node
Message-ID: <aP+IjjTf8O0aOV5U@lizhi-Precision-Tower-5810>
References: <20250929-ls_dma_coherence-v5-0-2ebee578eb7e@nxp.com>
 <20250929-ls_dma_coherence-v5-4-2ebee578eb7e@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250929-ls_dma_coherence-v5-4-2ebee578eb7e@nxp.com>
X-ClientProxiedBy: BY3PR04CA0018.namprd04.prod.outlook.com
 (2603:10b6:a03:217::23) To AS4PR04MB9621.eurprd04.prod.outlook.com
 (2603:10a6:20b:4ff::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9621:EE_|AMBPR04MB11809:EE_
X-MS-Office365-Filtering-Correlation-Id: 23854e8b-a23e-437f-376f-08de15694c8c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|1800799024|52116014|7416014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?hnOl10SarPj1CyGh2jeW2o/dtdnnw/wlfYZlwWX4w2/YIlnb6Ltmfa3rDC3W?=
 =?us-ascii?Q?348djGWoSz11q06x5edpG2u29HvmGDbfhjIY/aoD3mIMcoc5tzm81XcYRwYl?=
 =?us-ascii?Q?9AAsFOSJF0EBwQkgjnMAM5kg0edqjHM0CNYLbXkOcTSj+BbjzVda91DIB27l?=
 =?us-ascii?Q?zomkWekVgYqkSDVbKvx+i7iMwP0lcNppM6FIivsOddVi4Ry6weOJunXjpmHA?=
 =?us-ascii?Q?lLlVlF4C+lc1Gue9C/tcfGsVTLRwMkn1aZfjM/IRygtEbi1CTPcKW32ELDHC?=
 =?us-ascii?Q?R/Ahm1qqbD/h5dhNBxAdZFWl04FwRd4L5jzTsc0xIPxpt50WGSDXkNlDBZHI?=
 =?us-ascii?Q?Hcyfu/y5IHKijP479YqvAbjQlAYDh8DTkLVxWfTNMGAfd5Gf9Kof+1x71pqg?=
 =?us-ascii?Q?EpLEtnfgxNrABsttaC46r45IVVvqWgbIbj0QtuAyNiAW8nMrL1RRW+/JFUuM?=
 =?us-ascii?Q?u9cTYPPwsn7B1vTM7ky/EMDV8DJpxsvlH9szLRHgpHhX/vsZfxPBR5aZ6LNk?=
 =?us-ascii?Q?ZabX3SK75Xtg/zMGCXxPFMWcLtaDUc49xWehULWX6hRdlyQ6PS9+7/QqGAat?=
 =?us-ascii?Q?AS8MwDMbQtcFQZE6kT28kfKd7zj6/t8YzQVbCwu7nI1ncGOSVW1LeBZLBAP8?=
 =?us-ascii?Q?CBCEJBUdActkVbWigh+aCkfZt122j2BdrY5Kml9mJGt4Uza6w37Vmb4pUoK1?=
 =?us-ascii?Q?2bI/azXBdNniVZhLHeygCD5+G95E93phz3Mrq9bg3G3dcGxmx9XmH5H+NWtL?=
 =?us-ascii?Q?4ccrEtG2A3Phwy4lb2eRsaezruX3ox3J0IOVFe6KAI7BzMVkj5az2xUBNbr0?=
 =?us-ascii?Q?BrSxczsMnvKvsVt0abZMNRjR+LXV7dBz/kjDw+wIi6NdR4gUVKOEh7DBvAoj?=
 =?us-ascii?Q?Vp1nAYj9Qq5AjTqHGME6pS0aWS1wKAvxwAfw87b37rS2d3bZa3ijWTxhSAi4?=
 =?us-ascii?Q?oAoKQYP/JsJL3xwv+bcFEAdcEjewsaPaNSL7iE84bo2ts0z9GXf48YaNbMzj?=
 =?us-ascii?Q?dkcYoDnj5SQ4lITJ6Z498xDJ1N1/5+UpU3p5mglZXbfYyKbRUrJwiNW/tQak?=
 =?us-ascii?Q?W62u/agDIRwu58fc8ji3r8zB06tRd4uTwYvQcy4SOGrYVN+CLM+oBDFFMaVh?=
 =?us-ascii?Q?xm3OdtVMsS/4FIHLs2rDbLOQ5ccDfP8QxxVJdkklAnkmBkgicDH9IQ3foLos?=
 =?us-ascii?Q?xOxZCCtwn0XRgYmpf7vZkcX/vPG47wnl7c8Fcpfgk14kT4iuXMLLBBRYrSlk?=
 =?us-ascii?Q?Z3Tto+1Z2yTh8hVGdlGKINIZWBMTvlpo7xLNGHXoKFBXpi0s3aGBSTN5a9Ix?=
 =?us-ascii?Q?TqOqEqQTXMBflt/aFUOzff4cSK32/TZiBymB+9I71BqF54R/Q1KlWp0fb6X5?=
 =?us-ascii?Q?kunbjN7H7OnX3aBqiHBCBUbAXtkEFyev1pxx4/ZujPJai85YQHpn9vRqpipY?=
 =?us-ascii?Q?+6cDuDgazbjgrc96QXQAjOfcEfFLl7K7bFsN9qWIRf7fosuI94jNCNQxuCdD?=
 =?us-ascii?Q?M/2RG0UA3NSXiQAa+pZRrOqc3N5koxbBoeyu?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9621.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(52116014)(7416014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Yad47a1plt6H/AuW3BgufX4o/TpNwr43lnYvPP/GRMUQb3ihKdo1jhRxcUPi?=
 =?us-ascii?Q?x/zZmFsDvjhxkmwDsR5tmjlYNAw94h7w7147JCPgQZx3UUko3e4bhO+SNC6s?=
 =?us-ascii?Q?bNugneErr/+5x1781qrPpB+N4hQobatwXtEs69elwWkO3rx35NUn87d/sUz+?=
 =?us-ascii?Q?jYhgAXBi2Wtmymjw+szbUjwSBJag5Ze99R8Du+9jWbVk9t5V+q+MX8bXeoPV?=
 =?us-ascii?Q?05WEUsnG67BJ/FqD3SnKST8AXUWZ65Td0D9CaUt4xSj5KjZo5o8T7986AKL6?=
 =?us-ascii?Q?0/jsyLWElI0CHTzOsiehKrfSee0d33LsirXtr5vXS3VbXdjez1DrrDuM4H0i?=
 =?us-ascii?Q?aDzx8HNXKYmCh8t+6YkKuHa0cxaA5HlokS+ZLGnOU2scuNXXELyDklN4/u6i?=
 =?us-ascii?Q?ALCoBwhT/tPEiYtEW8PlfNSj+7bFxvRqGpe6pQCwdSo/+c1/Z3uj2mjW9Fvd?=
 =?us-ascii?Q?lm70Gfu8MieMzL6DekYrhuvbl/IuOB2ZSJ7eFWnEWYTeyEEL+3Qr85Fds3ja?=
 =?us-ascii?Q?8NM82QD+sPCbirjqa1mrbCJ1Mi9iKXxJ0jjp97Opp3RNlyijJPjGpHwWaXzt?=
 =?us-ascii?Q?kF9Me1ZJPJFgtqI9vbiuXr68lz+tbsjq6ylZ8wuFHJNibYvkh0nrekLdzm2g?=
 =?us-ascii?Q?mG9HDG22X8/cMQp6h22cifUPdCDR/K9f7GyKDACA0Lco3a9PRzZSKY08zA7h?=
 =?us-ascii?Q?EASdkOtgSmX6gdDnzJLeo/bXxj4l34Vv9cLWD/8UzbmESuI8tYfa/I0kzoqS?=
 =?us-ascii?Q?WXrvgqHck0lz1mlVcL8pq6xLFx9IT2fzsTNxz49JgqEhypA8pbLnpwGdlLSu?=
 =?us-ascii?Q?ttW4NE/cdAPBZiCXT3oQqxDXVjeR6ivP59dyHMVC/NJTlvOtqmwK9l94ELIe?=
 =?us-ascii?Q?OjvMTgBI1vjmMbLuHok7BlYAl8mieht/1JtVCY3KTntPGHc9ypRIp/DwfUB1?=
 =?us-ascii?Q?KLmD8VlIySQh4XfsLvBs3aZ207V+ixc9SLWDwfgtCHNlumfwKdBBlYODMTR4?=
 =?us-ascii?Q?+6QSK4M5n0bfGzTd9RYIm7qA0NtvYZz4CsvEswD+/nEM+rbAVfwSdTH4rPcn?=
 =?us-ascii?Q?jmwwPMFArMEKMsn8pNPe43W4sbqk11sBMgTRGdI4BT00gdKg/bRMEGm+CThQ?=
 =?us-ascii?Q?/pDvoLx0Hic5JTAT8BmF0txtxc8HTwaZGEgwUr19pK87WXq7NGDnY6H/LDog?=
 =?us-ascii?Q?yweXPnnM1XlH2Kj3QW5r9NF8FVtZwVP84KbGRxrvfAr9G4ghTVE/BvS1cUV/?=
 =?us-ascii?Q?QufBLzlizzxH5+4JB8SyDMP+oXHpgxY9/7dIE4kFA7PdcU3cO7EFZA+FWXDc?=
 =?us-ascii?Q?YEMY6FBNNfuVKIE+zYE4OQ4/dSrYBzd9+hggbCZfz/ENhlwCHd+8cf/jjHCU?=
 =?us-ascii?Q?/liuRl8Y57LeUedCdxLr/IvEp8DiBlcBLIJ9XkO4ukod95CYzlx2vI7zEXN0?=
 =?us-ascii?Q?lXomjiOfR6mW7HOOYIkAtcRohxZgOBGC4iBdb64Vw/FnJP/0UdtCFRfG+R2E?=
 =?us-ascii?Q?jtDk8LEpLyMUCGBCl32CwIblCw4SYZLPvWtthQ1zWipGlmEyPj2pP+9B/n03?=
 =?us-ascii?Q?llypaI+cXED9HOn044I=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23854e8b-a23e-437f-376f-08de15694c8c
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9621.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 14:58:33.6277
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zdN0UvdNOICxXChcs1VS9m+uaop6dHKgLF5TeX2GdCSJ/j09Z620x+IMuk7p5GLO7TQ5pUd8t2uwqz8liJZ+Cw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR04MB11809
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_075844_504839_26133090 
X-CRM114-Status: GOOD (  16.24  )
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

On Mon, Sep 29, 2025 at 10:24:17AM -0400, Frank Li wrote:
> Add SOC special compatible string, remove fallback snps,dwc3 to let flatten
> dwc3-layerscape driver to be probed and enable dma-coherence for usb node
> since commit add layerscape dwc3 support, which set correct gsbustcfg0
> value.

Shanw Guo:

	Binding and driver already were picked by Greg. Can you please
pick up dts part?

Frank Li

>
> Add iommus property to run at old uboot, which use fixup add iommus by
> check compatible string snsp,dwc3 compatible string.
>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> change in v3 - v4
> - none
> ---
>  arch/arm64/boot/dts/freescale/fsl-ls1012a.dtsi | 3 ++-
>  arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi | 8 ++++++--
>  arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi | 9 ++++++---
>  arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi | 9 ++++++---
>  arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi | 8 ++++++--
>  arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi | 8 ++++++--
>  6 files changed, 32 insertions(+), 13 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1012a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1012a.dtsi
> index fc3e138077b86cd5e3cf95c3d336cb3c6e1c45ef..ef80bf6a604f475c670e2d626a727e94fcb2a17a 100644
> --- a/arch/arm64/boot/dts/freescale/fsl-ls1012a.dtsi
> +++ b/arch/arm64/boot/dts/freescale/fsl-ls1012a.dtsi
> @@ -493,10 +493,11 @@ QORIQ_CLK_PLL_DIV(4)>,
>  		};
>
>  		usb0: usb@2f00000 {
> -			compatible = "snps,dwc3";
> +			compatible = "fsl,ls1012a-dwc3", "fsl,ls1028a-dwc3";
>  			reg = <0x0 0x2f00000 0x0 0x10000>;
>  			interrupts = <GIC_SPI 60 IRQ_TYPE_LEVEL_HIGH>;
>  			dr_mode = "host";
> +			dma-coherent;
>  			snps,quirk-frame-length-adjustment = <0x20>;
>  			snps,dis_rxdet_inp3_quirk;
>  			snps,incr-burst-type-adjustment = <1>, <4>, <8>, <16>;
> diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
> index 7d172d7e5737c4b6e42ee88676c5763fa7415260..e7f9c9319319a69d8c70d1e26446b899c3599f95 100644
> --- a/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
> +++ b/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
> @@ -613,9 +613,11 @@ gpio3: gpio@2320000 {
>  		};
>
>  		usb0: usb@3100000 {
> -			compatible = "fsl,ls1028a-dwc3", "snps,dwc3";
> +			compatible = "fsl,ls1028a-dwc3";
>  			reg = <0x0 0x3100000 0x0 0x10000>;
>  			interrupts = <GIC_SPI 80 IRQ_TYPE_LEVEL_HIGH>;
> +			iommus = <&smmu 1>;
> +			dma-coherent;
>  			snps,dis_rxdet_inp3_quirk;
>  			snps,quirk-frame-length-adjustment = <0x20>;
>  			snps,incr-burst-type-adjustment = <1>, <4>, <8>, <16>;
> @@ -623,9 +625,11 @@ usb0: usb@3100000 {
>  		};
>
>  		usb1: usb@3110000 {
> -			compatible = "fsl,ls1028a-dwc3", "snps,dwc3";
> +			compatible = "fsl,ls1028a-dwc3";
>  			reg = <0x0 0x3110000 0x0 0x10000>;
>  			interrupts = <GIC_SPI 81 IRQ_TYPE_LEVEL_HIGH>;
> +			iommus = <&smmu 2>;
> +			dma-coherent;
>  			snps,dis_rxdet_inp3_quirk;
>  			snps,quirk-frame-length-adjustment = <0x20>;
>  			snps,incr-burst-type-adjustment = <1>, <4>, <8>, <16>;
> diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi
> index 73315c51703943d9ee5e1aa300c388ff6482423f..50d9b03a284a2aa4e13aa3323c25bbc5fe08f3d0 100644
> --- a/arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi
> +++ b/arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi
> @@ -833,10 +833,11 @@ aux_bus: bus {
>  			dma-ranges = <0x0 0x0 0x0 0x0 0x100 0x00000000>;
>
>  			usb0: usb@2f00000 {
> -				compatible = "snps,dwc3";
> +				compatible = "fsl,ls1043a-dwc3", "fsl,ls1028a-dwc3";
>  				reg = <0x0 0x2f00000 0x0 0x10000>;
>  				interrupts = <GIC_SPI 60 IRQ_TYPE_LEVEL_HIGH>;
>  				dr_mode = "host";
> +				dma-coherent;
>  				snps,quirk-frame-length-adjustment = <0x20>;
>  				snps,dis_rxdet_inp3_quirk;
>  				usb3-lpm-capable;
> @@ -845,10 +846,11 @@ usb0: usb@2f00000 {
>  			};
>
>  			usb1: usb@3000000 {
> -				compatible = "snps,dwc3";
> +				compatible = "fsl,ls1043a-dwc3", "fsl,ls1028a-dwc3";
>  				reg = <0x0 0x3000000 0x0 0x10000>;
>  				interrupts = <GIC_SPI 61 IRQ_TYPE_LEVEL_HIGH>;
>  				dr_mode = "host";
> +				dma-coherent;
>  				snps,quirk-frame-length-adjustment = <0x20>;
>  				snps,dis_rxdet_inp3_quirk;
>  				usb3-lpm-capable;
> @@ -857,10 +859,11 @@ usb1: usb@3000000 {
>  			};
>
>  			usb2: usb@3100000 {
> -				compatible = "snps,dwc3";
> +				compatible = "fsl,ls1043a-dwc3", "fsl,ls1028a-dwc3";
>  				reg = <0x0 0x3100000 0x0 0x10000>;
>  				interrupts = <GIC_SPI 63 IRQ_TYPE_LEVEL_HIGH>;
>  				dr_mode = "host";
> +				dma-coherent;
>  				snps,quirk-frame-length-adjustment = <0x20>;
>  				snps,dis_rxdet_inp3_quirk;
>  				usb3-lpm-capable;
> diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
> index 770d91ef0310d971d044a1f55cc5e2cb738acc47..22173d69713d1bd2abca986e76668ad437dd34e4 100644
> --- a/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
> +++ b/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
> @@ -749,10 +749,11 @@ aux_bus: bus {
>  			dma-ranges = <0x0 0x0 0x0 0x0 0x100 0x00000000>;
>
>  			usb0: usb@2f00000 {
> -				compatible = "snps,dwc3";
> +				compatible = "fsl,ls1046a-dwc3", "fsl,ls1028a-dwc3";
>  				reg = <0x0 0x2f00000 0x0 0x10000>;
>  				interrupts = <GIC_SPI 60 IRQ_TYPE_LEVEL_HIGH>;
>  				dr_mode = "host";
> +				dma-coherent;
>  				snps,quirk-frame-length-adjustment = <0x20>;
>  				snps,dis_rxdet_inp3_quirk;
>  				snps,incr-burst-type-adjustment = <1>, <4>, <8>, <16>;
> @@ -760,10 +761,11 @@ usb0: usb@2f00000 {
>  			};
>
>  			usb1: usb@3000000 {
> -				compatible = "snps,dwc3";
> +				compatible = "fsl,ls1046a-dwc3", "fsl,ls1028a-dwc3";
>  				reg = <0x0 0x3000000 0x0 0x10000>;
>  				interrupts = <GIC_SPI 61 IRQ_TYPE_LEVEL_HIGH>;
>  				dr_mode = "host";
> +				dma-coherent;
>  				snps,quirk-frame-length-adjustment = <0x20>;
>  				snps,dis_rxdet_inp3_quirk;
>  				snps,incr-burst-type-adjustment = <1>, <4>, <8>, <16>;
> @@ -771,10 +773,11 @@ usb1: usb@3000000 {
>  			};
>
>  			usb2: usb@3100000 {
> -				compatible = "snps,dwc3";
> +				compatible = "fsl,ls1046a-dwc3", "fsl,ls1028a-dwc3";
>  				reg = <0x0 0x3100000 0x0 0x10000>;
>  				interrupts = <GIC_SPI 63 IRQ_TYPE_LEVEL_HIGH>;
>  				dr_mode = "host";
> +				dma-coherent;
>  				snps,quirk-frame-length-adjustment = <0x20>;
>  				snps,dis_rxdet_inp3_quirk;
>  				snps,incr-burst-type-adjustment = <1>, <4>, <8>, <16>;
> diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
> index 9d5726378aa015eff10578bf095908a58b9d9eee..b2f6cd237be046123de9342e2167aa32248a8a16 100644
> --- a/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
> +++ b/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
> @@ -489,10 +489,12 @@ esdhc: mmc@2140000 {
>  		};
>
>  		usb0: usb@3100000 {
> -			compatible = "snps,dwc3";
> +			compatible = "fsl,ls1088a-dwc3", "fsl,ls1028a-dwc3";
>  			reg = <0x0 0x3100000 0x0 0x10000>;
>  			interrupts = <GIC_SPI 80 IRQ_TYPE_LEVEL_HIGH>;
>  			dr_mode = "host";
> +			iommus = <&smmu 1>;
> +			dma-coherent;
>  			snps,quirk-frame-length-adjustment = <0x20>;
>  			snps,dis_rxdet_inp3_quirk;
>  			snps,incr-burst-type-adjustment = <1>, <4>, <8>, <16>;
> @@ -500,10 +502,12 @@ usb0: usb@3100000 {
>  		};
>
>  		usb1: usb@3110000 {
> -			compatible = "snps,dwc3";
> +			compatible = "fsl,ls1088a-dwc3", "fsl,ls1028a-dwc3";
>  			reg = <0x0 0x3110000 0x0 0x10000>;
>  			interrupts = <GIC_SPI 81 IRQ_TYPE_LEVEL_HIGH>;
>  			dr_mode = "host";
> +			iommus = <&smmu 2>;
> +			dma-coherent;
>  			snps,quirk-frame-length-adjustment = <0x20>;
>  			snps,dis_rxdet_inp3_quirk;
>  			snps,incr-burst-type-adjustment = <1>, <4>, <8>, <16>;
> diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi b/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi
> index c9541403bcd8239a48d4ef79c7c4f9e3b607b556..d899c0355e51dd457a4e7259709cea98a488f557 100644
> --- a/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi
> +++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi
> @@ -1094,24 +1094,28 @@ ftm_alarm0: rtc@2800000 {
>  		};
>
>  		usb0: usb@3100000 {
> -			compatible = "snps,dwc3";
> +			compatible = "fsl,lx2160a-dwc3", "fsl,ls1028a-dwc3";
>  			reg = <0x0 0x3100000 0x0 0x10000>;
>  			interrupts = <GIC_SPI 80 IRQ_TYPE_LEVEL_HIGH>;
>  			dr_mode = "host";
>  			snps,quirk-frame-length-adjustment = <0x20>;
>  			usb3-lpm-capable;
> +			iommus = <&smmu 1>;
> +			dma-coherent;
>  			snps,dis_rxdet_inp3_quirk;
>  			snps,incr-burst-type-adjustment = <1>, <4>, <8>, <16>;
>  			status = "disabled";
>  		};
>
>  		usb1: usb@3110000 {
> -			compatible = "snps,dwc3";
> +			compatible = "fsl,lx2160a-dwc3", "fsl,ls1028a-dwc3";
>  			reg = <0x0 0x3110000 0x0 0x10000>;
>  			interrupts = <GIC_SPI 81 IRQ_TYPE_LEVEL_HIGH>;
>  			dr_mode = "host";
>  			snps,quirk-frame-length-adjustment = <0x20>;
>  			usb3-lpm-capable;
> +			iommus = <&smmu 2>;
> +			dma-coherent;
>  			snps,dis_rxdet_inp3_quirk;
>  			snps,incr-burst-type-adjustment = <1>, <4>, <8>, <16>;
>  			status = "disabled";
>
> --
> 2.34.1
>

