Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAE82E77187
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 18:03:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g7DcmqVqCpZ3fMHWgmE6Ln9GQ8N+m8FuaV9+0pNctqs=; b=dQyy+rNKqnbWTrDzgPyM7MVMMO
	y3Z2E2t31FQ68EBv9eHHZemSdat0rj3GSvL9qJDNlAgk6P+Q1JhXHLzaNn04AC6WmToYMTDiTSkZ3
	HsBksCyPCutKwhssjqRTnyCCF2slwu0HsEmxQSqB6XVp17lGvdT51/ZM/9/pbsIEuq1HlRw4pHUSc
	RRv0tFSDEZ0KEubaTzVIuPgGtlCvI1zN6IzfUSjEjxpbFDlNWpCLxJsmpb8Jf3HyofBM4YE6cg4uF
	pKgSIcYO9+gvLmLVHEMMXZTLUjiH5MpDiQJc6Z+ZLKNqzutST+PPQXY2dUseSr9xfYKfyWDW0f+kW
	mdy3lqqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNyO3-0000000HO2H-1gc3;
	Wed, 18 Dec 2024 18:03:07 +0000
Received: from mail-am0eur02on2060d.outbound.protection.outlook.com ([2a01:111:f403:2606::60d] helo=EUR02-AM0-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNyMt-0000000HNmY-1GCE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Dec 2024 18:01:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O+IAU5BdYuI2hvpHt194z2zdCCIW4m2pEDSpbEggK9hilOGKFGUPgEpJpr220uTtfDio14nOuCsgQNsFoWdZqqnB/vzwaLQlG4I6yUqiMa1P3WRYjVj9DKk+y6K3OMsW96jHd8GEBfv0wHA+5FQU/quYGoSMWdvBCnUKawdDvSiQV5SPlbpq52fK/Js3lkakcrk3B35gBTLqY2C7YzreuKfgheYHz64Fik/pT5vUBTEpgSPbv6brYBl7QXKSRk02N3Vo1hb/g909BdJnUL2CJ6GXPSWg+3wfy2GRIjJxNziQJlpg7AHYWx1Z0G1ZJHtgLjFYQAnjoUTPsXrfnWB4pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g7DcmqVqCpZ3fMHWgmE6Ln9GQ8N+m8FuaV9+0pNctqs=;
 b=mWkp38cbKvMWR8gUMYis88dI1S4yjcaJQ+gaFmryFqyUCkwKa0a+FrbGYP+l3N9TeLRc6Dyck8nB9HkhqTbtlv8U0wLFtfvJX7GcTxiV8TQGPmIW3ax4uqxZNogGRcFRoTYTQOeOJOQDXrjcmzDSBea7WPGnJaCK5ys+MsdpDxbkjgUzo77dXmL/I1AHK+bupqSJ3e9nR7AY28xd8l30vL9xCBNqvDItPaI6zZc6PIKuEBr0bhjcPCKaM/E931dQ1a6pwSWYV4gtMeLQfHMjUHJW0dNqi6G/tri1LbsgrccHyaDoaH06LIDhgkwDMVDU8XD6eHzd1PeItNbijtbLAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g7DcmqVqCpZ3fMHWgmE6Ln9GQ8N+m8FuaV9+0pNctqs=;
 b=j9i3DoFndz4NB34SUkX7xS6jRDoiVwIgpRGbfZ8HhTAEbOr8iHY/Pf8iSWgakyMPR2eH3CDCIDGNI7TOE51eLkr8oEsGZII7SlXfPJoyFoim1rh+GyT70pFpG4w7g3wbQTotQb5KwG45a4WADAmIcnhXEImoClfUMFiC1n0k5XJlvSA0xbNPjUsUws0w4R1zIl20CMipJjUIuNMH35cUTPlxPCdgIKuDNG7yuYZq0CC89WfVm3qpYAJgNcJUpxJxRVpTiRQYNV23ed84Ke4no1SELs2FUqhXelYAojqFvtlNNmIcDrNfhh4Su5xjbcsx5mZ7JWFa92vuKotfzIGj7w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by VI0PR04MB10342.eurprd04.prod.outlook.com (2603:10a6:800:219::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.21; Wed, 18 Dec
 2024 18:01:50 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8272.005; Wed, 18 Dec 2024
 18:01:50 +0000
Date: Wed, 18 Dec 2024 13:01:42 -0500
From: Frank Li <Frank.li@nxp.com>
To: Wei Fang <wei.fang@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64: dts: imx95: add NETC related nodes
Message-ID: <Z2MOBmqM0iXQnRrc@lizhi-Precision-Tower-5810>
References: <20241218061725.1608466-1-wei.fang@nxp.com>
 <20241218061725.1608466-2-wei.fang@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241218061725.1608466-2-wei.fang@nxp.com>
X-ClientProxiedBy: SJ0PR13CA0086.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::31) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|VI0PR04MB10342:EE_
X-MS-Office365-Filtering-Correlation-Id: 9135c049-373d-4860-7aad-08dd1f8e0c05
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?CPsnxgNQoBYrF13rpC1G4Tq9qAT09jJ20l/Buk3E4U42iqxnfmKEwxsxAc9Q?=
 =?us-ascii?Q?Ajt2kTWk2L96CXacKw5SPENA4Vin0v8nQfCMmdErDIUaCDYIjNkuYtO7wSk0?=
 =?us-ascii?Q?ALiSw5r5wRwZBjmdTBJk6ZEydeemM+3cHLlMjYjNcXx4qebHIOzWConBB+Xm?=
 =?us-ascii?Q?VrSVmfnZHlReaDHHhZUAZ3NwfX7/XkCX2o++Hmssp62PrqgP6r/uA6DEIRMB?=
 =?us-ascii?Q?4xY3QriFWh1WPBvtDLbREbYHhO0y8oOtkjQvbx3p1IEEWchQNLmk7peut6DS?=
 =?us-ascii?Q?D/Xrtylt2D/0+eYRpOrpfPMgc6f8zM3vAco7LYgNV+WFKGJ01h4dpZx28S7e?=
 =?us-ascii?Q?qJrSpWAhdaWCF7fbN9OZ/wnm6tbNxcEKvxWzWbEMqXGO0N2sJ1hRaHqVbHvK?=
 =?us-ascii?Q?VapvD1ER6iCVyQEmOqzcbxf61TSnYzYko7Ln0Qqcw25N2L9MRIKT5OsPGzJB?=
 =?us-ascii?Q?hbZgpZ39s3d0crkl2EZTDCUfRMa5Q3lRMSqn3P+fe9g7C5m08mUYDrodsK2s?=
 =?us-ascii?Q?CMfaZfOoBLC1Rk/Nht6WzFASCi1jtALOT3Axd4OUutgHVSN0x24yV2xPbsi5?=
 =?us-ascii?Q?qXu1ZAKwm0LitjIWcaKaNkbHMQYgN8suNiic1+ZxSkBfBKaeq+MZ1OvRd78e?=
 =?us-ascii?Q?bQ+7KjGgu5p7IrOnylyTQuWywTYXsXF1+kjI30nSn3sNq3y+XmRJmN/MHaQf?=
 =?us-ascii?Q?Y7VR2PB/lE/RPrRWBQo4EMq2qVSe4y403oYlIspLwamq+CfwQUcLl+cE4OLX?=
 =?us-ascii?Q?dpuz6yw5xCxxw9VQgWdKrhgoLzPWzPlpknzBBbudQWEqmw1NXtWeIhWO6VV5?=
 =?us-ascii?Q?QvJlpjv38Tq1cnrt32Jss8uJIugKmmT+Mjy3uQomA3jhDJPlNFceM5ChUpCw?=
 =?us-ascii?Q?k8DkIrT4MyboGm599huYFaBejTEokt8u6zpmwi3zh7BpDpodS0gFlxaodxth?=
 =?us-ascii?Q?u74zNIdljEOimkcLjfsFr+ix0wrOI2JP5XHequh+ZNKAFXI+iVcqQ6S9o+T8?=
 =?us-ascii?Q?I4wvaR6CjMff7Y03kwzsV9r2zqeTukXiDT9WocqGHuwOQjZPLXp1ZmffsxYI?=
 =?us-ascii?Q?n7fcMq1cih8oG8U27AJpxoFi1T0u9M234k3Y0eEHvjIe/VURnOdKMtDYSwVq?=
 =?us-ascii?Q?Yy20vFf2+CO3hHZNSCkxHMsCHyC476MLVj0dspWH6UZYFIOGkYp7Bgvt9Hux?=
 =?us-ascii?Q?Czj17YViN+YUpm+ilzMdyU0UWd4p48zWs7djhURLihTS4YAqQRW4q4WDf0uR?=
 =?us-ascii?Q?+BbB/PFCG+yfGXTFGMlqaUCepA1coyYJ40j1zMyFqwT+evzOeOIGND4PqvI0?=
 =?us-ascii?Q?upGOCrm+5rPfH4q9jqaMD0rFBE2fElFKe37ppJJIQAxaQMRAyw1rr7iFuVmd?=
 =?us-ascii?Q?Z8JYSTt0v6MQKIUmxXtXMpLn/xdmABMx3/OaJj/YlAqhGD08ZrR70nwuGBwa?=
 =?us-ascii?Q?S2UO393UjQ4KZfHtVpm+3wfy+g0+Ra5y?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FSRRDYiLR7aT/YAYSXR8GngYXKmPSpVKALoEtxt4mMdeIWl9qXHZ9y44eA/i?=
 =?us-ascii?Q?iFD1QY+CgAZqW9yzCs1LngHEx0WdGXs5s7TdNk6+acHNl1vJvPzcYOmf34Jd?=
 =?us-ascii?Q?jxGfQXVDEsX/Uu+Ydhvfzwe7+ynUBVaxgAtWCVflIKkmj7BvaKmK15/4Q0ms?=
 =?us-ascii?Q?x/MVOBKulJvSq3Rz+eX5UfYorF/dY3nOeHvOrhjO4V5KjMZoFA15ugM3XPT3?=
 =?us-ascii?Q?2IwEgYBjOMtReZ6sCAE8g4XxzhMVUGaXAJCk8wAKfrN6Mg0m8EsiXbSQBLoT?=
 =?us-ascii?Q?6uDTOhd70oftgleFUzGPBF+KmQ+hBN1LNN7ROz7/8q4cCSjYG28YK8yxX2b1?=
 =?us-ascii?Q?Eb63QWr2peFOEYZD3plD7n2aJYyfNNWXOMwYiEkB7H7BGmMwoaelXKMZ1WcZ?=
 =?us-ascii?Q?U8MwNfnUVvRyxoJRZE5uRZnBrfF8Oj5G8vqnCR2Oy19vvuP9EA+r8ctMVFR4?=
 =?us-ascii?Q?2IgAhxi+ZGOYG8CXO013efUaPL/zB62o5IDhELyzABGyB0w8c2bw3Dg8HGOe?=
 =?us-ascii?Q?yv4rwqkTXeh7Dm2GWnxo4dY5b9RV71LKxtQxKd6BVVQkGatwLzxoVkmz6zih?=
 =?us-ascii?Q?sloKlvYrJzcj/Fasj3KtYkckqQ9gjZbqWE0+x62tMR5y1xpg2bJs97eK5vtT?=
 =?us-ascii?Q?yuHQTGzQJ1PQyVyDmbdV7O92ryHLz4vKNHeYl/lp+Wx9G1fYKYj2KvkEZbsx?=
 =?us-ascii?Q?Z7zzw/03BOBIgURbAcAzuDHMQLl+hg9i0AY9fKCbskl9sAvq/zZe6uDT42Ex?=
 =?us-ascii?Q?PDPEhgvFZlj+F/zPXqSd7X98EC190Ce3IWylWaGsU94BGNtjqKiKKdVT2CEj?=
 =?us-ascii?Q?veVZd2yVdXFZyhOX/RcuAEyLV5i3R53JJG+G5A9pFS6x1jup5Xn7KcSFpdP8?=
 =?us-ascii?Q?4YvfflFfh1Iar+k4/6T0uiMxPYAR8mGIGFNYwZPrWkVSw3DrfJ+rnlxeFC5I?=
 =?us-ascii?Q?LxQ8wA6p0kmGbdAVegb/+wfmiRs1to31rtQH1ecKTxyv2QVpkhwd/a8hNVlG?=
 =?us-ascii?Q?ErfThnfXhOnyK3Ugh+AQ/tjnhIuxPyUf74onzNNold7xuNBAfA4v+sF8VzfM?=
 =?us-ascii?Q?t8q9Wf5sETLDxs9a+KpfajlTycTRZ4KkZWXpHfcggUfXpi9OAstVn/4zVSwe?=
 =?us-ascii?Q?+BqiDfWlXLJh/X8eALJMVH6mwfqZic2iNkgCHivrM0nwnzbVc/+cMUqTZRZK?=
 =?us-ascii?Q?AjsC8JGKGPoTln8xEep/xRBKwz7z9sXpFf4IopBgHpt1JgHp7gpbXEcdHcgn?=
 =?us-ascii?Q?ctqrpaLugTp4Eqi8x4pXarDMn1JZqUaGmlhhPv48pMfzX5aqeLitF4BjGQ8I?=
 =?us-ascii?Q?SZ4lLZ0TXniDh4AoXwVcSEByNsW8nNvMTmlznGUvXsJY1JBi/JOYJBQAV9P/?=
 =?us-ascii?Q?lvhKkA3x1b1qdOYoGrT1l/3llzsPTYWvwsOieXcomq6HlKg+en4wL4uLrDJO?=
 =?us-ascii?Q?sCoHqKmhzdLT/r09G44vIsgPyeVi+o8zmPHqJeMB7jrcBZIntxpSlYTNHgac?=
 =?us-ascii?Q?1Kwzpj2jUcplVE+lX0dKFBlEVQ0ut5T0xELe8K1M/STaJy3MhtiAZSjr61hL?=
 =?us-ascii?Q?lgcBxBkjgPiLrnsQwJm+sCS5pUGpzKQAaaaukjpz?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9135c049-373d-4860-7aad-08dd1f8e0c05
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2024 18:01:50.4947
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yYV3S6MGe+a3LMAJhD35e/vgn1l9w+Ovmyq3igEiGqVGOamZkjQLnnL7h7OGziLAAocC23HPnSYZQGUQSRWV5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10342
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_100155_352936_BC168EAE 
X-CRM114-Status: GOOD (  15.31  )
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

On Wed, Dec 18, 2024 at 02:17:24PM +0800, Wei Fang wrote:
> Add NETC related nodes for i.MX95.
>
> Signed-off-by: Wei Fang <wei.fang@nxp.com>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> ---
>  arch/arm64/boot/dts/freescale/imx95.dtsi | 93 ++++++++++++++++++++++++
>  1 file changed, 93 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
> index e9c7a8265d71..86f9fed9998c 100644
> --- a/arch/arm64/boot/dts/freescale/imx95.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
> @@ -1702,5 +1702,98 @@ ddr-pmu@4e090dc0 {
>  			reg = <0x0 0x4e090dc0 0x0 0x200>;
>  			interrupts = <GIC_SPI 91 IRQ_TYPE_LEVEL_HIGH>;
>  		};
> +
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
>  	};
>  };
> --
> 2.34.1
>

