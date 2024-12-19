Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBEE0E77184
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 18:05:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YqDKKM0EQKrHHkkkz16JqqJ8D5tCHvZgB1trCa7yURk=; b=3LHRrOX4KD8AUIUqirgK4tZJXt
	gf4KWEm8Yh9R8qxkmvHVywMbhAg3GKoSAgHqNySRv7sgfF459mxuEulEF1wPiLc3Ni8Z2aEP08cjj
	3IJT+Gzu52qD868tXIg5a00xhGbKaS+9xIPk5Z41oscyzyrLePSLhGG7a9n/Qmgra16QtySXl0fRw
	Oh9r97iofnEhYKmpPUbgYJei9Pc09oiGcgQ5YK79PbeoH6WaKAm4FCGy+PIjjOPGzVGJ55rUbghRM
	9cU49HRHVEhmE+4xaEKkfbvaVXziPqdjwqYSvCVt+mWV/4voZ3Nh8barHEBCj5TEoZ8HT238y1QgR
	22bRq+vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOKtZ-00000002gS1-0Rxf;
	Thu, 19 Dec 2024 18:05:09 +0000
Received: from mail-westeuropeazlp170100000.outbound.protection.outlook.com ([2a01:111:f403:c201::] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOKfa-00000002czr-2WnE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Dec 2024 17:50:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QEBjmYBbNiThL1c5w9Aaj9AyBjfx1GlyEvJSTJRN/tOM84NqEOs7XD8Yh+KAjWf5RL/vBc9c5qJn4fXvTqyyqrrdLj7IpLRBlbzv/vmz2NHTZCGROSKzA112UyoTMDJe/ocyLeORQqODNdIImZbAkepz1p0KJ0Z1KdGsOElSSRvXcJGjbdCX0gSpfT/9Rlt01UMvNmudj7ZZ/E9d54NT11P4YGvCc6GVY5Vktv66qImUpyxGxJ7dU/ieEc7rM0QRcqGmttj0pFTCocfG38kpOlJVIITWXR++bfETK6wBkqxxkDfmyK9hz2FC+SC6CmG9QUFfL5GpXwTNg43UtpkZ4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YqDKKM0EQKrHHkkkz16JqqJ8D5tCHvZgB1trCa7yURk=;
 b=RZRabe9+w8Lwxhdpcgwb+6wT9lY39lhp3JpdF3f5SndmcpV2T0F8r1whikJzwp0Bq4BX5/F8jR35PA6Qme08uvrbyr6+aX0Kb7au5Y7BigmJJAcyP7/hZ0g6GjlNfbT74+UN+H8jB6zKwmFLz18dElKg4iJ0qdeRUiYsoGoX+VdR83IJ5APdDhr0RR+YOGMRF7zGGumLWnCbdMUIFd/Rv1/W4tdXVNGQtWclD9SYpOcyqmCsWYdeNs6gYyuqm3Ma7zka+X53t2uNTutglE46taDCzivvCNUwgqs+NCI1bRcP9oI/MfXgvxznOjcSqF5EZhsfJe7AZZwDNUrd0YN/qQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YqDKKM0EQKrHHkkkz16JqqJ8D5tCHvZgB1trCa7yURk=;
 b=CXBI8mI49HAYpNDHAS0MnSuttLidFKv2FJXNHVxRyTj56gzz8C79KWuSD9q4duHUtqKis12BpPXqorI2dSmqfjdu1iiSxSwc9XUmH53auBMRsICTWTnNlpmq4zEbWt48DlkvBS8sJ9Fc29y3ZBPzW3Yd3HoqFfZKjkFqH8fiP3cdlT4r5En6V/iuTZsL9LNWczwg5UkBi4/tZh5RSwsmHXqyzWeFz8/zUaOBxqwvSnJ2n1qtsz3zdnXYOnhsMpBvYhWW2lENtLrJ3oNcNOyOkPrK5/kt9eh6LCo1ZCgRkMp3eSpaxzL2RX4O6UmZEzGq31k37HC8/gGvh4qOH56T8g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PAXPR04MB8750.eurprd04.prod.outlook.com (2603:10a6:102:20c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.22; Thu, 19 Dec
 2024 17:50:40 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8272.005; Thu, 19 Dec 2024
 17:50:40 +0000
Date: Thu, 19 Dec 2024 12:50:32 -0500
From: Frank Li <Frank.li@nxp.com>
To: Wei Fang <wei.fang@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] arm64: dts: imx95: add NETC related nodes
Message-ID: <Z2Rc6EOSpuY0FMty@lizhi-Precision-Tower-5810>
References: <20241219061340.1633173-1-wei.fang@nxp.com>
 <20241219061340.1633173-2-wei.fang@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241219061340.1633173-2-wei.fang@nxp.com>
X-ClientProxiedBy: BYAPR01CA0050.prod.exchangelabs.com (2603:10b6:a03:94::27)
 To PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PAXPR04MB8750:EE_
X-MS-Office365-Filtering-Correlation-Id: 69c2bca1-2fee-498c-1076-08dd2055a6e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|52116014|1800799024|7416014|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?3jbEh9X4U0YK7gqq3tymdbLy1IKp6ir1DvWwsZSXAcDiwf2F3xUjsaxt0h0l?=
 =?us-ascii?Q?Dhxn6jo1ewzQHDVFz1qNM8gNn1jMRI2Q9w83FfV9u2VI7dp1NozJXPxqWQGd?=
 =?us-ascii?Q?PMraO1o7J07PmVaAWnEYawCrWB9Ol/DVMSy0MPrgdBWm4EbFjPYydOTA6dZo?=
 =?us-ascii?Q?ybUKmxIM+Vu2Yj70xQq4Z75iRUTd6Kp8WMEj48I5D2pUo/qBcy5yEILKl7sm?=
 =?us-ascii?Q?VuTwDhZjbAa0SgO0wfwjii1JwSLOdQGg6rep8/80tTveLccvLkeZUn7hY3Lg?=
 =?us-ascii?Q?oz7Wg5/MG5EE8q3BsM+vUEsVYVTRGpDjSiWu5e7/KD7nbRSKGbrlxsEkVcW9?=
 =?us-ascii?Q?NPOqA3GWHDcMPbclG1xSMenAMiKltPWGK+KSyebaeC1WaF5Qo5z1ztM7C3He?=
 =?us-ascii?Q?3qwR77MpXH35HiLu79ttWDHCu0t7Dw4Cx4914GPmb9Zopklg0so3+DzNUbFK?=
 =?us-ascii?Q?3QCtoWm3ECFuhtRw6gBIaloM5a29y1DiR7FfEqQYLkyNQf27ldWeHsPAW64d?=
 =?us-ascii?Q?mJ6ozKHxCRF+WqU56/fLtg4Zua6pU7Uzca9wBkWEdEOQ68UbCHsiE0weROZr?=
 =?us-ascii?Q?xvSQwx1MPD7i0DP/ZaW7MLLKPTtx66VXMTbBZjRA28RwScOa/F2w5AVz9Ab/?=
 =?us-ascii?Q?8l2d1IE2rxb7pF5f5CdzpxnItcoHseIL19J+xftIf7FGgO8XNt5Dv3nFUN9a?=
 =?us-ascii?Q?3kcRL22vB6ZmeuOcw6+JQ14Ge/miv+l4xAFU5BmPs8T8xCUUQNZFGAxLxUyK?=
 =?us-ascii?Q?HlKH1U82mjOc+5NF7RYP+3Hx+SYoYHv05TizqeJplNiGuZdOp70E00/BLPzu?=
 =?us-ascii?Q?1GU9XCHojOSEAPrh+xlfR2185ECs41YUq2zAfN+tfcNL8XS7V/y6D1i2IVn8?=
 =?us-ascii?Q?lmU4x42jvBzI65O4xQWZvqg6Y+d7SL4ZeMb/iZJjnq0UR2XCZBd8r2aQM7ie?=
 =?us-ascii?Q?zjU0aYBlfq6a72LxlPSR2s22zurHm5BP55OqykVJyDSrOXatBLcOdGYcd3Rm?=
 =?us-ascii?Q?Ly6qjsFWjapSrns8QcisvwFMKvGbAEu/KbnO4bKO8hQ2rus4BZ2GkRMm910N?=
 =?us-ascii?Q?jBnXbn2w2GGoaGwPuhat+wUpZRuwJytXCx0hJ0YaJznDXvMiTz0LN/KvhQou?=
 =?us-ascii?Q?KNpYPjHj/xJfPK6Fm9O0rSGQwXed/oo0D1UFSkwmoqLY7JJ91wQKE/p/gnXB?=
 =?us-ascii?Q?3tej2RscD37hfPdgQ4kgJXbFMrQt5qzv5NORQ+vx80KGqPEbRyNY+ck78kiL?=
 =?us-ascii?Q?sDj9tfkThP+nn3Mx14LARobRottFCIazmvEQkw5NqFwRFI1GSBcgc1pgRigP?=
 =?us-ascii?Q?x5rz5nzq8ulfiRB4zP37jQGOkgSb8OuKc+T/p6AHlzKYr1sJBsm9ghkDsc/z?=
 =?us-ascii?Q?7X3XtlUIRMAHzMjbl5S+nFoGgJ48Rm7/Dh9vLPN2XtIn4Og8/+Vp76Pdb7X8?=
 =?us-ascii?Q?Ny66tioUeDuD5fZWAqrZBob09sko8u6i?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PGs+FF1b/dzkyCnsp8c+GsTniaw+OdEP/nVeqjWLscT8J0nc+oJQFqyio3vd?=
 =?us-ascii?Q?fnq9Io8yxzta1OG71JNuaYLEe+8x93K9QWH5P5/C5ou96FdVfQcs4c+zNhhL?=
 =?us-ascii?Q?owO+Hn4iePtMvquCEUt1i2SPJ7yy1oqg9c9hthJkS0vLJZzdM0uO/kO7gQeX?=
 =?us-ascii?Q?qxDlZH6tqsDwlJCCZUPcp3oVfbb4I4GACHiDj6NiN/8ZVAzAESfGj3U1z2mn?=
 =?us-ascii?Q?TBGpOU64gFLejezXamBBVOLx+SnNGPpN8ngJYreRdMvIOIotuV9YdDr0UP1j?=
 =?us-ascii?Q?c6Jp1RJhrgXBCx+94msmR+uMa54LcJhVHztw10y5Ndru5oPIvrrf2oGEdRTt?=
 =?us-ascii?Q?CZe7Rs1nkZspQRvv7iAniU011jnX+BOm9AZQSR1M1ktKQCYcGit0juUYTNtv?=
 =?us-ascii?Q?ss730+khIdNP6mbaHxjGXODjSjh5K8DeUXLGWDGLClaCwIJotD7lWLqNKkLk?=
 =?us-ascii?Q?jEVXsqQuziWDaBV7ShywMTo/wXqrZ7rJ1N3/CIzCQF8Lbo4HBQpBho8XKGsd?=
 =?us-ascii?Q?5BEK4BzZ6O6oovw88+e3/0bhr6GY+9/GVfuLap/Dtf8g+PjM3Jtq9C5jdOOW?=
 =?us-ascii?Q?N37rZDvy1Fo1UFnBTEeVMHqBBOig5SlaPY5MTURYKWGAuQcPXyExb0+1oQDL?=
 =?us-ascii?Q?yCxlEhm0aKxvSgtW7zSo9tguOv3ZN+1/3vtULVjBUA/3pSqYrb4qf/3myNPD?=
 =?us-ascii?Q?VuY85B5Reh6t9dQWoZy4btXbxftQqwgXNDjmxU8h0XbIiq2IEK7lBCaf+FJf?=
 =?us-ascii?Q?ok+w8ltBxppsfn4ruKuTI7g0+v6diqEXfNk+z/dET+yMgYyN5A7/GlWWzW+p?=
 =?us-ascii?Q?IeS1FYHRn0oQryrr+qxzi03mOhVEgxOlNNPmyQUz/F8wFbw8L2mSMeC0JhNm?=
 =?us-ascii?Q?SDkd0UwgZHoDvtKuNA/HDSUN2jr55SopBwGGryd8zR/Ht21Up/68LMSKxNxu?=
 =?us-ascii?Q?Q71gPhdZqmRcKQycXziMBgd9mcGYzyFg3Guxn62zfvStNWpPcHVReJrPsmFg?=
 =?us-ascii?Q?wkGV6NK4SODZDjTx3TvMC0fuAMMSvCEQ9yKMNCQwh8WSG8s3b/aZNYTerl1A?=
 =?us-ascii?Q?osSuz/xIwtJiL0rUqcZV2h+1rKOFHYqyhjKcKP2ES7FEjr+LseEX3cjnp0u7?=
 =?us-ascii?Q?TAyKO3VzpHQGVrLETVicv5eEGMuT3lZsIjLli8p/1JbBjslBjV5eqH5yPnUq?=
 =?us-ascii?Q?PWgTNaGoI8yQtlfqXJAiRkgN5ruCjussT8Eh9OEOVdB7cFRIOrETrxZMNVlc?=
 =?us-ascii?Q?MddlAg1sX7ouaWJ+6jwZAU8E2Pt4ZGu+mbisgKcMSQUdNQJ7iy5qpw6tG0Ks?=
 =?us-ascii?Q?SCQEUGfnnkFv+nQzNp9Lul6spBd/flPPHESMNKx1yWi4XL7hgeL0UcTXi2WW?=
 =?us-ascii?Q?zxs3TXRYnvLmBG2NFPz4QSiLgS2F0WE1ToQEWA8sFzFvGCM7L4f5LdiiCE9x?=
 =?us-ascii?Q?PNBQKa6U4qc8uk/GrVJgVMb9BRig+TTU5ILqOE6I6dGajKqrEBwzs6B5Hc89?=
 =?us-ascii?Q?NxViq+KS/LWu/1d5ucw/RPqdTXxHyIBD2/hvO2ry6sF2Q4Y5XWbK0rRqjbiH?=
 =?us-ascii?Q?yoeo9OSnFXftcC+fFr2rt+qvJgAU1Bk2ByPNUGcs?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69c2bca1-2fee-498c-1076-08dd2055a6e9
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2024 17:50:40.1984
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h1Ebdh99r+7G2+3zE4wQh1XWMBkKBj7rtvyDceA2burQjSywuKu2p6IYp/MXCIv2WjAzbS4jVWrXu0qxFQ5qyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8750
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_095042_644986_9A9AA8DA 
X-CRM114-Status: GOOD (  15.90  )
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

On Thu, Dec 19, 2024 at 02:13:39PM +0800, Wei Fang wrote:
> Add NETC related nodes for i.MX95.
>
> Signed-off-by: Wei Fang <wei.fang@nxp.com>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> ---
>  arch/arm64/boot/dts/freescale/imx95.dtsi | 94 ++++++++++++++++++++++++
>  1 file changed, 94 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
> index e9c7a8265d71..8b0eb1d835e8 100644
> --- a/arch/arm64/boot/dts/freescale/imx95.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
> @@ -1697,10 +1697,104 @@ sai2: sai@4c880000 {
>  			status = "disabled";
>  		};
>
> +		netc_blk_ctrl: system-controller@4cde0000 {
> +			compatible = "nxp,imx95-netc-blk-ctrl";
> +			reg = <0x0 0x4cde0000 0x0 0x10000>,
> +			      <0x0 0x4cdf0000 0x0 0x10000>,
> +			      <0x0 0x4c81000c 0x0 0x18>;
> +			reg-names = "ierb", "prb", "netcmix";
> +			#address-cells = <2>;
> +			#size-cells = <2>;
> +			ranges;
> +			power-domains = <&scmi_devpd IMX95_PD_NETC>;
> +			assigned-clocks = <&scmi_clk IMX95_CLK_ENET>,
> +					  <&scmi_clk IMX95_CLK_ENETREF>;
> +			assigned-clock-parents = <&scmi_clk IMX95_CLK_SYSPLL1_PFD2>,
> +						 <&scmi_clk IMX95_CLK_SYSPLL1_PFD0>;
> +			assigned-clock-rates = <666666666>, <250000000>;
> +			clocks = <&scmi_clk IMX95_CLK_ENET>;
> +			clock-names = "ipg";
> +			status = "disabled";
> +
> +			netc_bus0: pcie@4ca00000 {
> +				compatible = "pci-host-ecam-generic";
> +				reg = <0x0 0x4ca00000 0x0 0x100000>;
> +				#address-cells = <3>;
> +				#size-cells = <2>;
> +				device_type = "pci";
> +				bus-range = <0x0 0x0>;
> +				msi-map = <0x0 &its 0x60 0x1>,	//ENETC0 PF
> +					  <0x10 &its 0x61 0x1>, //ENETC0 VF0
> +					  <0x20 &its 0x62 0x1>, //ENETC0 VF1
> +					  <0x40 &its 0x63 0x1>, //ENETC1 PF
> +					  <0x80 &its 0x64 0x1>, //ENETC2 PF
> +					  <0x90 &its 0x65 0x1>, //ENETC2 VF0
> +					  <0xa0 &its 0x66 0x1>, //ENETC2 VF1
> +					  <0xc0 &its 0x67 0x1>; //NETC Timer
> +					 /* ENETC0~2 and Timer BAR0 - non-prefetchable memory */
> +				ranges = <0x82000000 0x0 0x4cc00000  0x0 0x4cc00000  0x0 0xe0000
> +					 /* Timer BAR2 - prefetchable memory */
> +					 0xc2000000 0x0 0x4cd00000  0x0 0x4cd00000  0x0 0x10000
> +					 /* ENETC0~2: VF0-1 BAR0 - non-prefetchable memory */
> +					 0x82000000 0x0 0x4cd20000  0x0 0x4cd20000  0x0 0x60000
> +					 /* ENETC0~2: VF0-1 BAR2 - prefetchable memory */
> +					 0xc2000000 0x0 0x4cd80000  0x0 0x4cd80000  0x0 0x60000>;
> +
> +				enetc_port0: ethernet@0,0 {
> +					compatible = "pci1131,e101";
> +					reg = <0x000000 0 0 0 0>;
> +					clocks = <&scmi_clk IMX95_CLK_ENETREF>;
> +					clock-names = "ref";
> +					status = "disabled";
> +				};
> +
> +				enetc_port1: ethernet@8,0 {
> +					compatible = "pci1131,e101";
> +					reg = <0x004000 0 0 0 0>;
> +					clocks = <&scmi_clk IMX95_CLK_ENETREF>;
> +					clock-names = "ref";
> +					status = "disabled";
> +				};
> +
> +				enetc_port2: ethernet@10,0 {
> +					compatible = "pci1131,e101";
> +					reg = <0x008000 0 0 0 0>;
> +					status = "disabled";
> +				};
> +
> +				netc_timer: ethernet@18,0 {
> +					reg = <0x00c000 0 0 0 0>;
> +					status = "disabled";
> +				};
> +			};
> +
> +			netc_bus1: pcie@4cb00000 {
> +				compatible = "pci-host-ecam-generic";
> +				reg = <0x0 0x4cb00000 0x0 0x100000>;
> +				#address-cells = <3>;
> +				#size-cells = <2>;
> +				device_type = "pci";
> +				bus-range = <0x1 0x1>;
> +					 /* EMDIO BAR0 - non-prefetchable memory */
> +				ranges = <0x82000000 0x0 0x4cce0000  0x0 0x4cce0000  0x0 0x20000
> +					 /* EMDIO BAR2 - prefetchable memory */
> +					 0xc2000000 0x0 0x4cd10000  0x0 0x4cd10000  0x0 0x10000>;
> +
> +				netc_emdio: mdio@0,0 {
> +					compatible = "pci1131,ee00";
> +					reg = <0x010000 0 0 0 0>;
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +					status = "disabled";
> +				};
> +			};
> +		};
> +
>  		ddr-pmu@4e090dc0 {
>  			compatible = "fsl,imx95-ddr-pmu", "fsl,imx93-ddr-pmu";
>  			reg = <0x0 0x4e090dc0 0x0 0x200>;
>  			interrupts = <GIC_SPI 91 IRQ_TYPE_LEVEL_HIGH>;
>  		};
> +
>  	};
>  };
> --
> 2.34.1
>

