Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5336CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 18:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bCHWVa7FfaQzkzQRI5FqmMGR3iYEPwn+jDCM0HKnZIg=; b=NM504z1EI4k4XLHTjjRMI2Bemu
	zwlLm1jcVKs/fgPscZxqfHu8AekYXzTvbuHmp6apLbxMOyoVQ8EB3JBz0nenCxvjvAqSGhU42CIRV
	EZ0oO7pgavEAfUXa+qEvRunMTYZXUTAHuCc6idBo/jsH191PL19kHQ1VvipNqVjz+84uVOx/cFbcU
	iQCuU05n0DFncws8Zi6yrxWjFLz/kH/Pmecu7GS7hmRdxvbzwxaz5t8uuru0JfhJBixkCVaoKS3ZL
	V2UXLFoiYddNj81IuUxUpFuI2vD309Zkzjku5LjemTnwaRbfjiusFzd0l1Qyw67TzorZwCqkuduUV
	zy4d0a3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uub7C-00000003ltY-1cBS;
	Fri, 05 Sep 2025 18:24:50 +0000
Received: from mail-northeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuXNV-00000002Gi3-3xpf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Sep 2025 14:25:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ndueoNvsiEKywD8W98XmvX8yrdEGTKWOA8L3lI5jhI0pr3bgeMUAkKkmKwcZJdWwF1s8oI5JdNJkUXcH/mugXGiaLSep9GrGB+Ss3Tv/5RD0TQ81boHOTTwb8lvEPKg7y5LGaIcXeL7oJJVIZl7c3dAfG8cHRanX6cUEe1qWjKNE1YM8HmSRy+C9akSjgASQsbfewqV1CzgH77aHRN4apT/FtT//yM4Jr+kJ64D1bP43iA/iTiGUQfhv7lT2Of5irNAidy3HrkOg95lgX/tJPU+Vdklkwb5MoJCiBpkqqBuDgplUWdzCjolsP3uvWkXI9PPckl5sH93dmwQrJTqw5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bCHWVa7FfaQzkzQRI5FqmMGR3iYEPwn+jDCM0HKnZIg=;
 b=mfHTMgVNLkKZsuwoJS+OYt4Ar5wgKsSH/DnzyYAk5iE4w1B6GzFztdBmlMVy2lsw5DszR9tdEAYREF6parvTozR9HLFhySkE9AsiCv4l6MowZPzFREzCAtIvqbqj7NEdvrtT3upE8eEL3cmVu+vqB/V9iDA0CPa7V1+Z8g/psrcJEsHOX6TqeqwnJy1rDuMiWuo8PyRV9aaYdYDDUdAvlZ/lEnrUQYyxtd5n9WYBeT9HlWL5ck9pkgcNsqYL4eXhwOAf/BDddHVFzAE4aTpOaotSnjHwxq9zmYUAIY/04vJknN/YmXwBfU14tnBNKhQ+3ZOcprJil/LjP6+s9uobIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bCHWVa7FfaQzkzQRI5FqmMGR3iYEPwn+jDCM0HKnZIg=;
 b=cwStkFQeRJjXVSq05/rWBvdOv20gM50KROr9gg0x+/12MPBQ3er713fcXediujm8jJHLCErk2G8jkoOdeFRc6ai42kJlSx8HgB6HOIJVStqZJdc6Q4vWQtcSkeOpbGypo1BYM31WFIMD91+HQD/Jlptj7F8dr+2chPmL8zhfoeIQGprRumUzIR4L39JLI8RaUBj+o2oOYKdO0A1GluG+g8KXNjxZLJRbwkIe9x7WFGM5yK7huPgc82+kJyVfr/culmQUPnD2nqtSdhRHJyQmYOa5Bhdokb4gY38hlyvcX/c7V2R5d6H52MJpzB1rGkYSC9PtGZA2QB71wF3daPecgw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by PAXPR04MB9156.eurprd04.prod.outlook.com (2603:10a6:102:22f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.16; Fri, 5 Sep
 2025 14:25:17 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd%5]) with mapi id 15.20.9094.015; Fri, 5 Sep 2025
 14:25:17 +0000
Date: Fri, 5 Sep 2025 10:25:11 -0400
From: Frank Li <Frank.li@nxp.com>
To: Peng Fan <peng.fan@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Amit Kucheria <amit.kucheria@linaro.org>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: imx8mp: Correct thermal sensor index
Message-ID: <aLryx874/gRbBo9H@lizhi-Precision-Tower-5810>
References: <20250905-imx8mp-thermal-v1-1-64401ac8edb0@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250905-imx8mp-thermal-v1-1-64401ac8edb0@nxp.com>
X-ClientProxiedBy: AS4P195CA0008.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:5e2::13) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|PAXPR04MB9156:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f2268f6-5ba9-49b5-4b59-08ddec88091a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|1800799024|366016|52116014|376014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Vl6IqTVOd82m1vBEHH45aBpTzRLzazou0RlBlCoLQrpM1EcTdpzYy12sc+tK?=
 =?us-ascii?Q?ekt7pTB8QQE8Y6ebkFDIyHfvlL+yBkuvgItR/NXRfOFaiyOd2sMSluDs+ckb?=
 =?us-ascii?Q?hPvZVXfsRFREoeVku2StUowbB4Bm4lInU3SQh/Tw7YB0wbhDPlOEzkMBFiLF?=
 =?us-ascii?Q?x6JMXDPCFc6FEwXaILdEcGwpN4QOa8zEUDKKExcGMSdHQ5uRlw+zIwcZGmO6?=
 =?us-ascii?Q?2LoyPJBUuhwSV0M3mpqfL0/7SziXtYk+/zjBoPtVXd7mq9sP+fe72NJBUI10?=
 =?us-ascii?Q?y/L3Z1pa2FMB5lIDIz2qZizb4evcnQtcOZhJ7nYGhFePHAshTjNJ2P3Ay8Jx?=
 =?us-ascii?Q?uKPT2tCPPkWCvbAxIy0pF/tUbviPQIWfFOaCj9mcNVFj8ucfjj0akxdHVGsn?=
 =?us-ascii?Q?5KH6Tttj/+HOgZxsDUgLCMj40zHl9i3mQT5b5Fn/SL/Kr/LjEveZNzvIFN3x?=
 =?us-ascii?Q?moGDTFqtAfm9EH9mJjtqJ04MssmeADpPRja374NSD4D9+SpMaUZiM3OoFULO?=
 =?us-ascii?Q?PCd1a7P7LXRAK/ryG6Q6eK8GXP0Z7Ibdo50w8w82z5eleYgRG6bHVSUE4l1H?=
 =?us-ascii?Q?pqOhRNalXAnSRI/v/v/UkbXCTryc84wzG054ofF1/srTgaiQO5+0m3yR9r9d?=
 =?us-ascii?Q?MwIW1xJjWUbgyXWMLOuk3hCue4Jg0X9VY7hEP7w8kbrgUHMWJqXC9M2qeN86?=
 =?us-ascii?Q?d00IVjVdLONsJDzR9GG5P/GTZPi7tR42RdXEw7kdQ4UE0abmTaFKSclkodq6?=
 =?us-ascii?Q?R2MsbMhuyrsiojV2Aebal+k/+GQ0WT6PsYAnA1+fLjAb2AM8QDzufOHZ+/ZG?=
 =?us-ascii?Q?C75E6f8c6pTVYY3taDsDPbjJiBqtohQlYlaqyOLgIbwQJJAEeVJVMmbBxovN?=
 =?us-ascii?Q?B038861IL9/7bfs4rDk4Hs7QdsKY6R8gMlgGnFdaiZkxjnOU1VTuYYyCJ6iF?=
 =?us-ascii?Q?QxtL4kKDyRr60F/vngN+fdrhZc7N1OxDjisq675eT3lJt/QxMNcgVVFbYeJL?=
 =?us-ascii?Q?a3tj34752VZRGF8eBB/EGQ6v11c9CpPmOz12+SmX85fCBMFFL9siiLo03wYY?=
 =?us-ascii?Q?n6L8eS4gGOuV693JiC9lH/Vd+ACr4hhR00NPdWtIQYsJgTgdVQAHTa7vOKTC?=
 =?us-ascii?Q?89BB8KLdB0PvdvOlQqeQz3gW+s0hZ8UndUAFDYXdBD2zIG60kiBB/dTYPebA?=
 =?us-ascii?Q?MySFTcxkqjujwMghiyA8TxlIhS362jcPsGUlnvjXFe6yyMammgn9kDxwjag+?=
 =?us-ascii?Q?KdasX3Rsgw1Vgw6qoYdATvEo0CsAMHchWNKkOVkV4E+lLyGX6QNJuLN7s1p7?=
 =?us-ascii?Q?o0eVcuDC/3fVD6o/GwySx+Xqo15TS8YOrUQYoKbOJX6zqtciI2NoO6nYgXfg?=
 =?us-ascii?Q?JoE6Qwh0NprMx6ZZjAQHdi3jAiwzXHyQH8uD7YQs8b8Ng4YG4ZVQeQ+iPa6w?=
 =?us-ascii?Q?WcAwQZXXB3LuZz17LGrueSLVsJeo39n05kfVVCBdt6aNKxxFs4D+wA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(366016)(52116014)(376014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?H7Av4Au2WAKH6HSwXSt+WaSJyNdqjkzMdqJQWNe8ArtGleyt/icKc0a9eKu/?=
 =?us-ascii?Q?LC661d39D6Etsmh2IZk7hRxSnnUMhNU19S1/S7AmHkcsMC0lzH+FXyMM5eJT?=
 =?us-ascii?Q?9lLlw4iBTssycPBVYeK/ryOiroaQZyIHvYkK9iep0YxcAX45AyazPI0hSuin?=
 =?us-ascii?Q?vcKjI5AK2G/fJPSYtvX5HNStlauqgvgJzm/a5dDuBa6vXk8DDmd0BCRtvsrs?=
 =?us-ascii?Q?7WpMNQlScd1WC32lVUmuV+vhAPgUpHv3UlIK4DGSZ3zJjMMLl8ud8OW3ow8+?=
 =?us-ascii?Q?4dnGj5OdIw2322pBz3YEiCmFSSce6/aS5vcqtrYoKbj0qH2SvNGNqXc2QfXw?=
 =?us-ascii?Q?RCTBMX9rYk/+H0KL85FgQIuz9K0i7CrjAwOHHSggSNt6xCsxnKF0crDDT9wc?=
 =?us-ascii?Q?yuYtwODGjgUJXBFiBawgHll41JJ42xF3Gmc8X/EwazLLvOz8fKfFFaShwYp0?=
 =?us-ascii?Q?7AN+vEEWdbbYUDVwz+DqBGzc/DFy+6IZ/899zEOJNxqqRcxCYXk4r562Y8Bb?=
 =?us-ascii?Q?FznhGonWMmGGfL3CQSyNYirgHrrzYyh740Usunkb9EwWK5nYt0SGJRZIgNaW?=
 =?us-ascii?Q?Jq6qh3UPgQ1FgLWZjAFsn7KI0PnRg3bWOFLz8XP9rm5NkCICD60Pg0mCy9UI?=
 =?us-ascii?Q?LzZBw2WXy1csw3ou69k3MamwDr654pCMnhWKY5plJJzIO7vQdEJGtlCGSSlR?=
 =?us-ascii?Q?AxxEKfdPDM/tzSlAHjb4U0kzTFOYPyhvio7sf9sCdj44XRPRi+X+TyN8vsRe?=
 =?us-ascii?Q?kOLmaGmIbpp1qR5zGMojx3NkkHpaBFNSocE/C5KU6nGUMhrV+P8SxFPBn3IO?=
 =?us-ascii?Q?hWn/sg3N3mmxcFiZ0H8zdUn7RPzjDitmAaARld9k1UT5K9P4G4vCOSn0TAEU?=
 =?us-ascii?Q?AD28X9gFptwomU4L6W2KY/R7U27raq+lv/6ly1m7jNcMLC/Gzf+Vi0HlJdM5?=
 =?us-ascii?Q?gMR7wwfc+DjkjAixraezhkc8LJg6Wy6dG40e2L8Jr7Asb5yM2wYFCr62c139?=
 =?us-ascii?Q?J/qQshfVKoxu82UwZKL1Qh3HIJvEIx0e23ACqnYFre3o322lQ7/xwIhPaxHP?=
 =?us-ascii?Q?xs7mS/Q5ocRWhQTta0nbXl3aOWwRtNvQaS/dCvfRONk69RgtGi+nPP6LkSbg?=
 =?us-ascii?Q?B221PMhklnmZ9/X7KZpglsGcYaEjtHXq2jzUmAmgTxRasTxVzikAFll9yqdC?=
 =?us-ascii?Q?nsfQvgzS3wEgCUh4U+zVUP9oczRZzJ1PigYoWVdk9n+A6GuF/vrbc5UwkBWE?=
 =?us-ascii?Q?GFgLLQpAC3quVgZOLzw7f6xBJucaCRDs05nUU6eRtvEzWMAWWCST/YousLy0?=
 =?us-ascii?Q?qamwbLkQX2Q/8NRbsKsqi2ACIWinDmwjnj+TugRpZ+qqta7IC4xEX3W5eAwE?=
 =?us-ascii?Q?vD9FY92ywGltYzg3hyg8bvxcdxaEMhnrf2fPiEWp4ICa2PEk4R77apN4H9TN?=
 =?us-ascii?Q?u5Yfp3obWeY4jqUwcwKAQfPFoLs5Y2Edyno7tPGVXtORGzCb752KGJkoa6RE?=
 =?us-ascii?Q?7MrHvP1aU0uyv9QNzzk/I2L/DSDiMXHfwLFkb84spclZ+3u9CaRjHGDYrzIS?=
 =?us-ascii?Q?otnWodIsdIdk3ochRnmSjoNgtqbOYWbaTLYjbfw5?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f2268f6-5ba9-49b5-4b59-08ddec88091a
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2025 14:25:17.1173
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xI7C+7jYpKV5dC6KbMONIkguGuDo7Mb1nJbbONsqx64WEkwlpBYt9lPX4I+5lpI1JWv2LYwVv43wGHlJyCoG3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9156
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_072525_982122_EC29F7C0 
X-CRM114-Status: GOOD (  19.27  )
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

On Fri, Sep 05, 2025 at 11:01:09AM +0800, Peng Fan wrote:
> The TMU has two temperature measurement sites located on the chip. The
> probe 0 is located inside of the ANAMIX, while the probe 1 is located near
> the ARM core. This has been confirmed by checking with HW design team and
> checking RTL code.
>
> So correct the {cpu,soc}-thermal sensor index.
>
> Fixes: 30cdd62dce6b ("arm64: dts: imx8mp: Add thermal zones support")
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> ---
>  arch/arm64/boot/dts/freescale/imx8mp.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> index 5d10de3950c3488acc80f574c8c59b55b6fbf575..91e47b1d6902fc22a368511a57522aa7d55ae167 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> @@ -298,7 +298,7 @@ thermal-zones {
>  		cpu-thermal {
>  			polling-delay-passive = <250>;
>  			polling-delay = <2000>;
> -			thermal-sensors = <&tmu 0>;
> +			thermal-sensors = <&tmu 1>;
>  			trips {
>  				cpu_alert0: trip0 {
>  					temperature = <85000>;
> @@ -331,7 +331,7 @@ map0 {
>  		soc-thermal {
>  			polling-delay-passive = <250>;
>  			polling-delay = <2000>;
> -			thermal-sensors = <&tmu 1>;
> +			thermal-sensors = <&tmu 0>;
>  			trips {
>  				soc_alert0: trip0 {
>  					temperature = <85000>;
>
> ---
> base-commit: 4ac65880ebca1b68495bd8704263b26c050ac010
> change-id: 20250905-imx8mp-thermal-08271c5cb5c7
>
> Best regards,
> --
> Peng Fan <peng.fan@nxp.com>
>

