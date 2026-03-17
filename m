Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12671FB5E96
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 00:36:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BodVYCf/bHAYsaQjTusPJso3XYKgJ0tJukenrjo1MEs=; b=3vbzR5hFWdQ+oW75YdEx5wZ54r
	j6F6qcKztKs2/L2GlP80eu70dJnnl7OdgevZzbkmZ4v7oTBuwIUj5YQYy3/LC0TbM6cEA9isz/ppG
	ZWu9eLWMpryxKTUKX/Zl82v60LWCR9vrjA0QjCN5zGBG12HwvwTAbWUpEFGyqSWjWZhSyt9xAsLrh
	0us4kX/FHtVgJlb8A6PDcS4KqY7pGBPbLFydU2PcB8Kt9NhkEIg6A572P64E5/dts51qZWTFrPZ2D
	jjaWu3gZlvf6OTTsveSEGO4hy7fDsaskXeCdjOUOLVtLMeMJIEzhCcsGRTSW+tgLX4RtHVTsGJINZ
	MX89lmbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2IQN-0000000590I-1sIX;
	Tue, 17 Mar 2026 00:36:43 +0000
Received: from mail-northeuropeazon11011049.outbound.protection.outlook.com ([52.101.65.49] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2IQL-000000058za-0bpf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 00:36:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bAF9KM6HecTUY1Oqy6YrHA2gAN66WP0vi7SNGF6xv15zBwJ1Etj46fpOium4SqTqFiXDIfc71XLTcuhQok3Z2elfsPG/3pLWStGivqNsnFPPjKfbgAM1YjiWYlXP7PW9gBhjyq7DfVk5o4USxUolnUxj9xMw7ZXa0LvMCe1LmDGW3nLCsnZPQkKu16ufO9QywbYlzwFvU0/K075HwVfAfj7Kr3u6iCt4hB3/lRavTMQ7PN3YkuFoYJi3Auz0CgJvhnuh3L5+LdXQfcBf4kP5S6uNg0JgxaTFXxPTy9B+UYRVuQQ412qkrI8qpJDzSh8VeWMosXlg4b9/jcQkiHhWYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BodVYCf/bHAYsaQjTusPJso3XYKgJ0tJukenrjo1MEs=;
 b=n6obmp0OI+UkATbQSSD0zKA3QNVhHvTRaDQzTds3JoiHrgqG0MkJsdURJoMzpe7ZAwT2u7ttL0uinWWavI7Qq+LSVMYGPllX1m1ka4OQx2+oriP96i1k0+VDcY0x5Hl8UL/mZdgrZIvrc+/9qKFhDenX2e7VdeRQtE+FABFTwj71w5jR55B37AoWJClhdOC12hl2ntPCbpTAtxPBfa5KWWo1kAe4cVm9VrHoE72tdgMeVAJI82y+yZs48+hGD/aqS9gDBnsxXgBO7zV34fxu8Wy51M1zvAIjuPXVRK5iFceyWSvcCFGLECJGdbmHXpn31aGsgNKRMDjYDRc/DlQPqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BodVYCf/bHAYsaQjTusPJso3XYKgJ0tJukenrjo1MEs=;
 b=HwaMBhrnR9JlTHIDLhNXAYXHdK6gwSFnFDhNuBbwBtTqUI4e2p1mBdftSwC608AHiwzv6Jy4bxEXIP6HFfiKiTZTOe/XejMRN5oB6Esig9Uwzb/stErhVKRRu9J+NjQMd3feL0HO7+vVYiwzC77/bQNiMs15Y4Fo3Dj0plUWeVcAobEMwTLsmQeN9SObt/gfViuq1f+gerDNm+QMxvs6FADOAaJoxDMwR3g+v2TymVz0O53NRzTNAl0ykNRPu7idDiq0cWO6FhylGHNbSoSWhaRlsH6ecOgmGivZpu2m0VHbeI4R3dU4mCSgL8i/sP/sW+Iid0U5EB6SEGrje2KaPQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by PA1PR04MB10228.eurprd04.prod.outlook.com (2603:10a6:102:454::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.22; Tue, 17 Mar
 2026 00:36:14 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9700.010; Tue, 17 Mar 2026
 00:36:29 +0000
Date: Mon, 16 Mar 2026 20:36:30 -0400
From: Frank Li <Frank.li@nxp.com>
To: Josua Mayer <josua@solid-run.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Carlos Song <carlos.song@nxp.com>,
	Mikhail Anikin <mikhail.anikin@solid-run.com>,
	Yazan Shhady <yazan.shhady@solid-run.com>,
	Rabeeh Khoury <rabeeh@solid-run.com>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 04/10] arm64: dts: lx2160a: rename pinmux nodes for
 readability
Message-ID: <abiiDr4bLYIufKwp@lizhi-Precision-Tower-5810>
References: <20260314-lx2160-sd-cd-v5-0-83de721585e3@solid-run.com>
 <20260314-lx2160-sd-cd-v5-4-83de721585e3@solid-run.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260314-lx2160-sd-cd-v5-4-83de721585e3@solid-run.com>
X-ClientProxiedBy: SN7PR04CA0117.namprd04.prod.outlook.com
 (2603:10b6:806:122::32) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|PA1PR04MB10228:EE_
X-MS-Office365-Filtering-Correlation-Id: bee32e6d-4ea3-4e03-326b-08de83bd3b01
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|52116014|366016|19092799006|1800799024|38350700014|22082099003|56012099003|18002099003|7053199007;
X-Microsoft-Antispam-Message-Info: 02Mm3FDX8AQH7xAKS4cqg0fofuiGH5kX5yjHouKauB7V2tN1q2dHHYb0dqSS/xZZJ2mFHZgokbst/r18O2jyXhwoWYrm/pQtdf8twuFVnxk0HqgpvSxx6WojXNpW7v15vm1SLJ+ShkC+IRgtMzIsXWMJLTUhvJJrnjeWf0pe+2bM1BDIQqUramc8PLj9EhJyRq86edjmWcZQmpkc5EWhEJEg4fdvbJl7rlLM7GN2L4LCjU0gHd94Jt7oW9OPFPWhqhSakaheQ/x0vyQR6H0FJSV4h2aYB1FFOolx1L3B3UXH1oPP+LntdEnZvnn24Q1QcIcf3+76eEjqX4GQGpgQF8Gko+bK2TGt5o6UyZZdjgWdWpv3TDPOKqUpPiM3EW5xWHCzuOlHNAMpu6bepsFXfaplcT9dHt//HGNSxvkzuad+My46DI7Ejs1k7Yq7dDlz+KU8txG9w2B6Kt9XRXpk6FC4hZm6eZpvMCwaO7p34sAkCzCxNptkpCPiCV+NyXMwcxTs3MzK6rtnncGBeMM6mZRJR3cdtl8uiyJ8rNSOi/25XXWceo/9Ywbzr+dheIL3XpdZQqd5FxVr/QT7fvdL+R73W6NNg99d2ThMJH8131oqr+Kx3hS+eLiZCv7KfVY3OuCOUT/u9s37pfauKz9wK4WJvs5g+zuFwY2nhQMyi04pKpAR99vyZqteU4iMX6YT+FKFecD3ExjWuQZrtXiBIiPGSI5GFi/hs7pBOkjUUXsXj9CpBuNqB/BirmrmU4+H3A7oI343rZSCl14X7vlzFNzry1rBBSx3fi1eu5O9e/I=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(19092799006)(1800799024)(38350700014)(22082099003)(56012099003)(18002099003)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uemGThbcJfY3gPf/03JCBREYE2WOzayq9DFxTRxYlPe3gF+THOTXfhauiiNh?=
 =?us-ascii?Q?9meQnyNSsOKXDd/uWB4zWOa5eWvnGJiuso9dtkoW77mMjASbV55t7jD2gHGK?=
 =?us-ascii?Q?wQT7r9zTDFtD/3AqsjQ6PSAycjEtQgRYL/fLZsXXR/0vJLOyeXzOU/khMbdf?=
 =?us-ascii?Q?aFmfuOOo6FQwFM8TpHWH1RxHKAj2e5XEvfJM8R+5TKq9FWbvxCoJmGeQcsdN?=
 =?us-ascii?Q?ahGcOgymxGleVl93q7FIFlzNoi3nX3uPtfRJfzOQvU2Wq/Mdp1NhXvoM5PXD?=
 =?us-ascii?Q?RR6LD+G34fj6Nb3JKIO6wb6J/0T2MVFDc/PYAxq87aJEngN5wnHiAdYIpIsP?=
 =?us-ascii?Q?M3QZiJQzQM9GvGrlrp7gzGoRDc7bsz26VAzS2cqbbPKvmP8QoH6xuHZ79Liq?=
 =?us-ascii?Q?coeeVln+tv2dG20sCBWeFfNt25dkynOosy8x8P6eUMjLaN9P0uT11R6D0yPt?=
 =?us-ascii?Q?bCmCihk9OvDL69nAn74o5uEFrAiqTAe/vI5nwEtw4/c1nEvprrlrruCq5rzn?=
 =?us-ascii?Q?HTLj8DM77Jbd7aTGL9ER54Bqynhrldk9OGlm93PF1wdhBsq82uOi3sQsJdML?=
 =?us-ascii?Q?RtdTx8LDT1oyHiApvcyrMiaYaj5CG8M4SSzQsmf/dNA7nt1zqX40CmxljUWn?=
 =?us-ascii?Q?gHj+OBJ7c9963lSRAjK2/sGyYLsSkeQLLtPnBRRxmuMU8QNQ4PwE9924Zot7?=
 =?us-ascii?Q?GamV5HIAXQJoFRk/7W/Ke4k+3vpAMon72d+s7G8KSuiU0MsLi9o1gQJLfGfg?=
 =?us-ascii?Q?FkjVmYrE6tzxKWTGV6ygSpxa/UAoN+nED0+QEQwiNX240UBXZYiVlYrXymt4?=
 =?us-ascii?Q?5bMg+iVs/Ju3GYOmcH60AqSo8sCcEtm06Y85AWSM9eJ8MiZw5yrD2ODForBH?=
 =?us-ascii?Q?2bnvggvcldYYOlcjGqVJRy7NOwRvWmsgT+f/o0IdmpmhrQyolq3mks6+4m8N?=
 =?us-ascii?Q?v/RCIbO7Knj/E5kuKzH6skZnQGrD6kkHOdhRNnPFqGw9yv1tT0MEe4FhYvCx?=
 =?us-ascii?Q?yl3CCvytwoZDQ1u33fe1KvZm7QvR6OKWHWbkbaSwTKJTWUWeFSZwwZbg6hHU?=
 =?us-ascii?Q?SGJFbg2ZJLg1VJpZf4s+bcnWZyk/pXa2hfEUUT021k410xjC4aUwgOcQZjk/?=
 =?us-ascii?Q?x4jkpUu9wi8x/9IFR6Y6An4kHYlZtKj91IGDk993jg4yMw2rAtYv732aC7Iu?=
 =?us-ascii?Q?1fhVXHGk5OSRQ+Wpy+lgv/f7T97WtiNrzkbINLWNdK07yPEV4CdJJuOeV0DC?=
 =?us-ascii?Q?YGdbvb4bOVYA42eNzUfy66zj3b6VAZ3gUIsPnBh+uDg0Q7HIZO132UXdyVzZ?=
 =?us-ascii?Q?fwQOYog/5wmz7YSBLr8tY+WLLzdEKt7V9RJI0YCq27LSUEdnl/hxiHSt9Fru?=
 =?us-ascii?Q?iK7bs4gIUmSS9YfuPdYHkbFK9zIGoSmYERVXLoEkayh3Kpq9ISIO9Uyc8E+s?=
 =?us-ascii?Q?lAIAeV74wqKn4WX+kKKLnOwz95UNJSLRZxG+B4DiFgs2VrhTLf4gNK1WSShu?=
 =?us-ascii?Q?5X/IZTyRFRJJ5VmLd1yY1HRSyYkFUq5bTuQ0TiPmtT7xpmFXGwePcDOB+qsv?=
 =?us-ascii?Q?Z4veXhPctadaMsW5T9BHF+UvnwCPPVm4pp0TeF6Z85vtVvAJye/4uAf0d8zf?=
 =?us-ascii?Q?xP5RKVfi+QXY9QGFetonM+HbUFqs21hWKQCpCkL0V60s88uoEOMf+GFISGvl?=
 =?us-ascii?Q?QXrGxPacFmN8Gtcv4I9FysjylcIkiT/EeiW5+rwdfVWUtSL1hY693ZztuKQH?=
 =?us-ascii?Q?WYYjyGubgg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bee32e6d-4ea3-4e03-326b-08de83bd3b01
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 00:36:29.6875
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M6XxzW0OvEEkpcrXkuz69bX8Q3m135UX26FgnrXBYbIUudo0DENAEQ3aYvPI8HLJjXNlT+p4gauuHkC6yJDuxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10228
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_173641_187417_5FF534C0 
X-CRM114-Status: GOOD (  18.19  )
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

On Sat, Mar 14, 2026 at 01:05:14PM +0100, Josua Mayer wrote:
> LX2160A pinmux is done in groups by various length bitfields within
> configuration registers.
>
> Each group of pins is named in the reference manual after a primary
> function using soc-specific naming, e.g. IIC1 (for i2c0).
>
> Hardware block numbering starts from zero in device-tree but one in the
> reference manual.
>
> Rename the already defined pinmux nodes originally added for changing
> i2c pins between i2c and gpio functions reflecting the reference manual
> name (IIC) in the node name, and the device-tree name (i2c, gpio) in the
> label.
>
> This makes it more clear to future developers that these nodes do in
> fact configure a group of pins, and helps with cross-referencing
> documentation.
>
> No functional change intended.
>
> Fixes: 8a1365c7bbc1 ("arm64: dts: lx2160a: add pinmux and i2c gpio to support bus recovery")
> Signed-off-by: Josua Mayer <josua@solid-run.com>
> ---
>  arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi | 64 +++++++++++++-------------
>  1 file changed, 32 insertions(+), 32 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi b/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi
> index 41c9b4253f4a5..28500e8873909 100644
> --- a/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi
> +++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi
> @@ -750,8 +750,8 @@ i2c0: i2c@2000000 {
>  			clocks = <&clockgen QORIQ_CLK_PLATFORM_PLL
>  					    QORIQ_CLK_PLL_DIV(16)>;
>  			pinctrl-names = "default", "gpio";
> -			pinctrl-0 = <&i2c0_scl>;
> -			pinctrl-1 = <&i2c0_scl_gpio>;
> +			pinctrl-0 = <&i2c0_pins>;
> +			pinctrl-1 = <&gpio0_3_2_pins>;

why need change label name here. It should scl, why need change to pins?

Frank

