Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C063CF94CC2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Apr 2026 03:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QwrhT/2Ohun6boLPrQF9uIAhJhFLuGbHm0lufmcGtQs=; b=rob239cqOb0KrFOBRHkh9f3V+y
	tiI3ACR4TPcotuKDKccvpPfC6o+fxhDCyLV9iYEO/4MuqbxXkPfnPYfRcgaiy9q87BPGLGLZn5pv3
	LsYvMSdFF+JjjueJvgnUl4UpXv2xYIwKYjCYx4qmDm+ru3S7Ht5ehfinlOlQni+h61OFez6ZQOyB3
	+AOprvCiqLwYg5KV+Y23L2dOM+1RB4AWLn3Wvx8RiSAcpJQKdX0AKgn5KSHAw9kHh8u0iyHVRqlY4
	VSY5oostXyocb+7OonC1L0hRyn4Gsbvc7eCaiADgZ53Im3uhR+tkr8hMqegIOCIiK/Vjmpk6p4aIT
	i3Lw3Z6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFOeW-00000009YzP-2VcB;
	Wed, 22 Apr 2026 03:53:28 +0000
Received: from mail-westeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c201::1] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFOeU-00000009Yyy-1PtH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Apr 2026 03:53:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZDkgqze0/q9lCF6wXBo/onV17pj3Ndq/oaCCz+lsWqCoslsw8jl4NoIih27O6JArzhUp3HHr+cKBhWpE0+jPPsmEPe2U3628rh9KPpapknTN79LRiLiPS9h87q3kvbfG+5oiepmlFLHp5NGJgAg9OYADKEhVzIc20GzbUv0Ggj5XB55olc8aF/OoVpns9EMWV/LD5xZqDRY78/labtw4Ro/k4L1HQUZ3R/RQeIqf1FrNvLTQXD5kgA23YPPXQUvmtA4noS7jSy6eCg2tB55o4ihOms2a5OPkPaYECQqHuj5hnexBeDi2vfObc6bMP+q6VIgH3S75N4/VfTP2HJZ6Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QwrhT/2Ohun6boLPrQF9uIAhJhFLuGbHm0lufmcGtQs=;
 b=YStnSbPclEVQJM21EbBc5wpTZWULnC8u2xy1G3VsiFcCayzgj+ccfxBPuF3+Izf6QbP5iQsFr1pWqTymnBYswNG+1jMfilgOJ5fKMYiHthChz2HTtsqKiaRcnKQBCcNxbvsnKFMKPh+9FLNWIMWYTPT5BoNaHOG6+DfTrRQGkb5bJ6JFBdNExsviNu/YGbR/sfhLoWXfOiTwdz4fzQyV1LuVag0ZQAKBFCLYJBP4ST7E4xWmmW0IEqyfCDZuXu1u85Pneob085s4Da8j2rq0nTbc4p+OpAfeJRKNT/iSXaCv8K57RKhac81yd7IbZM0cAPKkKaax1kRKyyWsYm4ZMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QwrhT/2Ohun6boLPrQF9uIAhJhFLuGbHm0lufmcGtQs=;
 b=eV1a8guXyjetCCD3qUOA+HXEwxDjghUiLdkdlmxtTJCa6rdPt/te3Ayq4XanNjFx9AwDCEYVd71eAmNc8yd7sGcl8Gi93c4GDX6OdJP8yhldbjJS+vNLAyeI19hcFrnIx96ZEaZUtgupRUIIpxaFOdsP5yCwT1LPBDsYqrWOFkb/yHN+Ea/13d0rDp351NG57xShz478+Gt+8CVmOglJuqXiNN/ks5+iNBUW5uVdJ6Y+97Gsib2PEe9kF67ql4zCNYs3xQNPUMUnKPXKVLTVj8vlCjfQRcPzsfL0awabAbe7Y2zPYiEM+mW0QOqJuDUWxpZ2+r4W+H0T0bZ06inr8A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DB9PR04MB10066.eurprd04.prod.outlook.com (2603:10a6:10:4c1::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.18; Wed, 22 Apr
 2026 03:53:19 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9846.016; Wed, 22 Apr 2026
 03:53:19 +0000
Date: Tue, 21 Apr 2026 23:53:12 -0400
From: Frank Li <Frank.li@nxp.com>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	jun.li@nxp.com
Subject: Re: [PATCH 2/4] arm64: dts: imx95: switch usb3 controller to
 flattened model
Message-ID: <aehGKE8qLXiBKvvB@lizhi-Precision-Tower-5810>
References: <20260421105503.1416566-1-xu.yang_2@nxp.com>
 <20260421105503.1416566-2-xu.yang_2@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260421105503.1416566-2-xu.yang_2@nxp.com>
X-ClientProxiedBy: SA1P222CA0035.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:2d0::10) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DB9PR04MB10066:EE_
X-MS-Office365-Filtering-Correlation-Id: 4024a792-8395-4363-0de9-08dea022b0f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|52116014|376014|19092799006|38350700014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: vfVBKeIcaww/Mb6rjP4skUuFGTAiwlN4wOl1CLS7KLtNU0G/x/zXpKj+UcUtXnwTkif/6s8VEXVzn97ojQl+v8afQih2TuOgwr0zdCf7LGexj2vViKDndcPGzlLuv42BJpmUYIug87tLGKDXsQX2E7qe0nnFYFE/7gJyGpjsxq9bXpYSlZi8rKQt8lYyOjacVEKckig/UBqxdgZM42+e2eWhL4kAacWySsxvAESXHHJPSKgWolvF6/0EiCJ03GDvNmvt5Ut2G1bOOoatYD8tDFvXjL0ST9RHWO6+WY4VfTf0Y9TLmuyXfWbBz1/TuyWXieHItxB3UfdSx9Eo1l02AvcUpeJEjeblV8FpTYgR5+OXqXnS/rMhX1Bm8NHheFc1MLAWMIonNA2KVlqq/pk50ZFKU4Cg/5y7omeGGKeWcw7hCJ4DgV/7+oiKzacXHw3PDPuosBma/iO7CIFwLaYcWw9I5oYcHGdaxkedXp3gCPM8nlcaDcMlPdbShahcEyhZlvGZYYloeSjl0WJFjJaswJe0siCYJ2ZO4wYJO979FbJu+fL2UeO10ZXeDHhdXOTo7o9M3AOQ6rLu2/RAghmE7q5upGIGnT45P159RRYKon5h/I024rkUtC1mi6jD7NOn9M7oaLwPUG2vsuJ2RJ1aRp9ojkW9I95ahr20Rg/13EG+QTrEOd00A2PiAiyg2YwufFHTjRoKglGnUIeJuu6VYLMyN945eP8JtxHbQXOEJCRoDIG0GGW/C4iKR7tVXybiGu/5hwnCgWadM5kRUnrnEjjYO3gG623yXmTBQR+/A9Q=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(52116014)(376014)(19092799006)(38350700014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AxK09QCLl+DvtuElleodMMOrSZyypkBgnE7b3s1MRK48ACTYksYB5Q8PqU3j?=
 =?us-ascii?Q?yIf9xz1OYcGp1YKRCIsAzN32fqTrBosNiCOn6XoLgVoliJIeDmtFH9/CF6hN?=
 =?us-ascii?Q?fdICSEeo9GVb1dgz6cj6pWL47Rq6OMmmcOckyw4OUX4R/YleTGMM2F3Ni+j7?=
 =?us-ascii?Q?3IQ1DxaH34r9mND6tD1uEIEcSokDNVShS1KiDj6wG/4+ROoPpenlWezWUQci?=
 =?us-ascii?Q?NBLDnq8v6lBLq1bjB0m0LLc3VBQwTOCB4gZmGMX10OoBTA6UBqbFD4sK9E/4?=
 =?us-ascii?Q?FMZVinhzSCDZyESR9wyXJorgIi1nYaIQTd8RILZTlnVSoG9pSHzpXx58qe8X?=
 =?us-ascii?Q?LDxydPZcuaI9n8FFaO914MAWMTpfWaA8jZNqpgMjjaNUHct0ODOvucuhYnzA?=
 =?us-ascii?Q?3JWr5dliL4qNmNfC59Ajv8Xq3jWC0Fn5UvGjXZ2aRDu3RERmyOuGq7aHy7h3?=
 =?us-ascii?Q?siAMIZDNJQ/HY0RF9LXCQtdj8yyrC2V5LxOhTQRc8lzMAYfjXqEMqHjT3xlP?=
 =?us-ascii?Q?mWJBN5tiN4J4uT3eU7jToYKpec7Dg3UsEZTkZRzaPMvNEfzTLWkRE5z7yIYK?=
 =?us-ascii?Q?deEu4a0ULjXF/RJwVQF1pCnBzaQLbMzae3iJdEPyCoQezyqzS+Q7kzTEAg24?=
 =?us-ascii?Q?nalt/qxqDyDNXJ+2HsBKfPQCalvlTCyvrjzkNAi6NmmY9VD4OX6nGt91oF+1?=
 =?us-ascii?Q?FQobG3CW2duYnag3j5n+I6vf+cy92DZ6bDzzqejm50QxZmciLJo2obpRKQ3r?=
 =?us-ascii?Q?grXnUCGeIrDkOqeQb8YLnQcsztt4hUi58hwA0gPbp+9HOJLGB678BGTV0kW5?=
 =?us-ascii?Q?G8e7li6dFDsLSLR1Aj+RcJGPTM7DP/Gw7TRYRbKP42ll9GFGmCuFlvVenq41?=
 =?us-ascii?Q?s3hXEDRz6ldXkpH/avNzhMxdCVhCe4yKfSadJqDgCgWEI3NZm2wWAcbvqNNJ?=
 =?us-ascii?Q?2yJ7HHWvnthB22mHCmLbVmuNuY4ebf4O7RYjeVPDIMAZdWV/6cPSQhNkOdFx?=
 =?us-ascii?Q?BMKhya+Q0W5EOXNcnlqR2Gum1Z6ErwIoIMV1shBai3Fttnf9S+Ef6dAEkYqp?=
 =?us-ascii?Q?DulmyDmc2SaeQj3Pw76pcIaF2VzJHsHzzHOVMxr93zmhVu6po/HGlxtcYQlt?=
 =?us-ascii?Q?P2vZlLrGdB+ac7LT85NuXQEwayfLCGE3ULyDZtwVMVcaUiwWleB+YPTMcFFa?=
 =?us-ascii?Q?+/OC/r00wB+GoVv9eDt8ri5yDhVcT2HGla6YKv/+KecSfedwT++m8f+hcM93?=
 =?us-ascii?Q?TJ/faCipM8yS71gseEVciRsc4XUhq4lJIQSCmrqsWX3KmonlWrIpF2RYajJL?=
 =?us-ascii?Q?nmGqs0Eda6RXIJJfzBXbLIjdOa+EE3TOTFMLjwksWBJcbiDUg24UVz6Hdr4q?=
 =?us-ascii?Q?TwszKV4EUmdvUaoVbrc8pTezXagIhFmI4MWiPn+7HeNKiGKn8uJN3ErApfPx?=
 =?us-ascii?Q?5wEejUk0UzTIQPeNfhsDA1iJViPTD1PBDp/mPk8mFG+rf1T2IS/IPRn/drrj?=
 =?us-ascii?Q?cK9mPX7VmboSre2YeyG0C2SzYJ6pIyQVszPO0wtdj24ZelM7Lp21QA5MJHvi?=
 =?us-ascii?Q?xw7UaOpxuo5dGExs+wt3/ktAWDdNS/NZ1Ob1m5hX6uofrlF+338NhMXBWLW7?=
 =?us-ascii?Q?dXIbm2bWNZCB/psyEWuhJfZlQEQGOKVwN+oHPo0xnL/37en6fr1i3+I9uMBk?=
 =?us-ascii?Q?reytgtsoSyYceT42t1A85Qokc4ZnyWNqAg5qS1VUlDFNhuk9VfsgnvfrfPY5?=
 =?us-ascii?Q?LxJjA2YXWA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4024a792-8395-4363-0de9-08dea022b0f2
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2026 03:53:19.2865
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wCTqH+pOlV7Lwn30lWeEf5Dond9oiaKVWk8eN8kNmn3FKpRx45lv+vQz+7fSh5W55bE8q5WZYdBfXKX8TOTkLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB10066
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_205326_378852_7CFE3C60 
X-CRM114-Status: GOOD (  17.23  )
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

On Tue, Apr 21, 2026 at 06:55:01PM +0800, Xu Yang wrote:
> Switch to use flattened model for USB3 controller. To enable USB
> controller with restricted DMA access range to work correctly, add a
> pseudo simple-bus to constrain the dma address.

i.mx95 should fix >4G dma space's problem. Does it impact other no-nxp
boards?

Need do break compatible judgement such as

i.MX95 is new SoC and still is heave development. The break compatible is
accepable at development early phase.

You can rephrase it.

Frank

>
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/imx95.dtsi | 48 ++++++++++++------------
>  1 file changed, 24 insertions(+), 24 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
> index 71394871d8dd..91048501a692 100644
> --- a/arch/arm64/boot/dts/freescale/imx95.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
> @@ -1772,45 +1772,45 @@ smmu: iommu@490d0000 {
>  			};
>  		};
>
> -		usb3: usb@4c010010 {
> -			compatible = "fsl,imx95-dwc3", "fsl,imx8mp-dwc3";
> -			reg = <0x0 0x4c010010 0x0 0x04>,
> -			      <0x0 0x4c1f0000 0x0 0x20>;
> -			clocks = <&scmi_clk IMX95_CLK_HSIO>,
> -				 <&scmi_clk IMX95_CLK_32K>;
> -			clock-names = "hsio", "suspend";
> -			interrupts = <GIC_SPI 173 IRQ_TYPE_LEVEL_HIGH>;
> +		hsio_blk_ctl: syscon@4c0100c0 {
> +			compatible = "nxp,imx95-hsio-blk-ctl", "syscon";
> +			reg = <0x0 0x4c0100c0 0x0 0x1>;
> +			#clock-cells = <1>;
> +			clocks = <&clk_sys100m>;
> +			power-domains = <&scmi_devpd IMX95_PD_HSIO_TOP>;
> +		};
> +
> +		bus@4c100000 {
> +			compatible = "simple-bus";
>  			#address-cells = <2>;
>  			#size-cells = <2>;
> -			ranges;
> -			power-domains = <&scmi_devpd IMX95_PD_HSIO_TOP>;
>  			dma-ranges = <0x0 0x0 0x0 0x0 0x10 0x0>;
> -			status = "disabled";
> +			ranges;
>
> -			usb3_dwc3: usb@4c100000 {
> -				compatible = "snps,dwc3";
> -				reg = <0x0 0x4c100000 0x0 0x10000>;
> +			usb3: usb3_dwc3: usb@4c100000 {
> +				compatible = "nxp,imx8mp-dwc3";
> +				reg = <0x0 0x4c100000 0x0 0x10000>,
> +				      <0x0 0x4c010010 0x0 0x04>,
> +				      <0x0 0x4c1f0000 0x0 0x20>;
> +				reg-names = "core", "blkctl", "glue";
>  				clocks = <&scmi_clk IMX95_CLK_HSIO>,
> +					 <&scmi_clk IMX95_CLK_HSIO>,
>  					 <&scmi_clk IMX95_CLK_24M>,
>  					 <&scmi_clk IMX95_CLK_32K>;
> -				clock-names = "bus_early", "ref", "suspend";
> -				interrupts = <GIC_SPI 175 IRQ_TYPE_LEVEL_HIGH>;
> +				clock-names = "hsio", "bus_early", "ref", "suspend";
> +				interrupts = <GIC_SPI 175 IRQ_TYPE_LEVEL_HIGH>,
> +					     <GIC_SPI 173 IRQ_TYPE_LEVEL_HIGH>;
> +				interrupt-names = "dwc_usb3", "wakeup";
> +				power-domains = <&scmi_devpd IMX95_PD_HSIO_TOP>;
>  				phys = <&usb3_phy>, <&usb3_phy>;
>  				phy-names = "usb2-phy", "usb3-phy";
>  				snps,gfladj-refclk-lpm-sel-quirk;
>  				snps,parkmode-disable-ss-quirk;
>  				iommus = <&smmu 0xe>;
> +				status = "disabled";
>  			};
>  		};
>
> -		hsio_blk_ctl: syscon@4c0100c0 {
> -			compatible = "nxp,imx95-hsio-blk-ctl", "syscon";
> -			reg = <0x0 0x4c0100c0 0x0 0x1>;
> -			#clock-cells = <1>;
> -			clocks = <&clk_sys100m>;
> -			power-domains = <&scmi_devpd IMX95_PD_HSIO_TOP>;
> -		};
> -
>  		usb3_phy: phy@4c1f0040 {
>  			compatible = "fsl,imx95-usb-phy", "fsl,imx8mp-usb-phy";
>  			reg = <0x0 0x4c1f0040 0x0 0x40>,
> --
> 2.34.1
>

