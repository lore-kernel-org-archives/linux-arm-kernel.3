Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 059A5C44508
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jan 2026 20:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xsovVrkBgH43clmg3SuW+mi4DQBVVu69QHWs5Yc3dOg=; b=1Rtmpkc4AoIOq83V8Uh2oSevxn
	WxSBfYLpAVbJVjKKVFagOCj31YMCRTaTuig19da9/Y0jAuHNJ1ZpAN8HOShEqqMb1VDIYLZCcail6
	3wdTQDMSSzRJJeE+QG9fHkyN4GfGrUe5Fhih0vqR0Nfi21eRvZrM1fyO7vRJeSQB+orHp20oQuqyu
	PgFWTXffG88wCYDHcD4OAia2nY9T6dxNYYW4uPrgvtMEUqrt1OnmHaqStJFTV/8ZaafpmQsMe9ql+
	K0jhIbfwfThW90ybJlP5iC5H6hA3Aub1YcdNahMjTdR84Q1ozk2s55DUs/LTJc87wAELaQBWogr2n
	crM5tsiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vieSI-000000060lt-3RIK;
	Wed, 21 Jan 2026 20:05:30 +0000
Received: from mail-westeuropeazon11011044.outbound.protection.outlook.com ([52.101.70.44] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vieSG-000000060lY-2MJC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Jan 2026 20:05:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mDsyfvb+Kr9BZQyjsyI/Neo/pfSzVHAa8yIhqoktxt8Fll9OnVLLEq9xMfHRU+3xGesDmNk2eE8MZjsBc+n0qN/M0KCg2dwNTVNdPGNTsoLaSXfizHgQgqaZBdE7FhG1q3N9O2MTGPBAMy+U+YIvSftcLjdfoe7Dz+4dmjlnsJk2tkm5NmYYtXs22qWz93Qz/cwWvRvR5ArzsWM/IwUB34S0aP52tUwLn39p7XxiCUfK4v59VcOH6GMYdRZ4d6Kzk1FBHBMjMwVUrIgTCLEByv56/W6Q+4UjkKiPKZp40kXYOKi3yKjATtD3WUhjGHbLpm9tPhfoT7X9fPIjZicLRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xsovVrkBgH43clmg3SuW+mi4DQBVVu69QHWs5Yc3dOg=;
 b=hnrDlPdVpS6cjpKRhMynAUMdlN0eJyDWRlTGmHDhqDrgOI0VNi215oBfiKeUdPHq6py7awjPGtu72nEhpFSp/SqI8lqnwjpFeBXLGxX7XRZYmMCy3FIuydwOE7gfxzcD8xV/QBixVxUi5aK18VQ3ww6QE1WyjYwY5SR39ib6HiNBD4A3ENdJTzt0hfb93G69awQ4ZP94acmncTvPSvCz0riX8Ever9NVRp6fYCVDGMoZjOw+Om2gUJXYBGYDHBkqyM2Y862hLSLo9JRgGGi8Uws2MyjJeDAhnnN1EsShGH/x4lXGaq5QS1olnAzXPNlDyzgtvBkKpIsCmP8CZf2W9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xsovVrkBgH43clmg3SuW+mi4DQBVVu69QHWs5Yc3dOg=;
 b=STxFThMd5kUDt0W7L6EXuS68jh0eCdI8FRXXjpMegz7/w9yA5hTiHdp04R5q5QMrxEGQGl64bKRF9sRiErV/UgGWP0Vpq+EB6dLNoB7obDCDz50+RwGdxDW0RKYSVz0yMNam+0FTw0+pLFOjIoi9MVJaEYd+YJJytAwIIKGQkcFg9xF7Kw7hW/PUoW968PYH2WON57ybqi3ZSTVnFaWznhBhNmgace6myBcgNPtyeQdAZROsD1WvVnIIIbvSZfP0sKmk6wDVnN8lj8nVm9AD8hQDlX9x/pmcM5pe4wp7ItfakTXktxnWrSGWPiO6tjjui1EZQluLQ4McVawHZ4EZgg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by AM9PR04MB8097.eurprd04.prod.outlook.com (2603:10a6:20b:3e9::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 21 Jan
 2026 20:05:23 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9520.011; Wed, 21 Jan 2026
 20:05:23 +0000
Date: Wed, 21 Jan 2026 15:05:14 -0500
From: Frank Li <Frank.li@nxp.com>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] arm64: dts: imx8-apalis: Fix LEDs name collision
Message-ID: <aXExepw/T8OLcNwF@lizhi-Precision-Tower-5810>
References: <20260119103411.50397-1-francesco@dolcini.it>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260119103411.50397-1-francesco@dolcini.it>
X-ClientProxiedBy: PH8P220CA0019.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:345::10) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|AM9PR04MB8097:EE_
X-MS-Office365-Filtering-Correlation-Id: e94edb99-8371-4c1a-7a16-08de59286977
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|52116014|19092799006|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+MnbkIsuuViqo+gqFVbh2NQZtOZx0Fi0bbZymhggBW+9n13vJW8pVGDp4S5C?=
 =?us-ascii?Q?neiS4dQfydOvPiZgV9PQX1gpyag0PIloFOCigIuQt0hPF2zArtGrLf2QAtgE?=
 =?us-ascii?Q?gFY96CseDFc17s5r+tj9eE4HTakf7Eq31hbRrZm2wZwg0Q62BeWrV8ZD0yfy?=
 =?us-ascii?Q?03mp7UefnU3xHamZO2nkzyc2U+0a1p0m/V0svu6F1K988+Vch2bYIDVKcihB?=
 =?us-ascii?Q?Cwkgi/bBPxscCg+pUeEIFuPy20RYP4JK0Dg5XGStw0XMnYQbqTIytwrK05j+?=
 =?us-ascii?Q?PuC4gdYIKVw/d5cpNpn/A76Jw09kdlTssT6+IIWdneRVOk8vEwkxOM4J8NUg?=
 =?us-ascii?Q?Ccr8z2uXPEBsbU1Z9j6c4iFmfu+bSfi00pAEKLw+kb6Pb+SvfGfU9tQgegXY?=
 =?us-ascii?Q?mQASOu2Wk8WRI0JnGsiqPlt8wcToL7dbCRcM5YgjRzPlRq8Qu6y/tUoVq9Gh?=
 =?us-ascii?Q?cttqOJpHrF+SiUtQuu5YQzfrEtCGIsa11NJftNz55IC1sd3ofxXG5NHvpwTK?=
 =?us-ascii?Q?SUyhn7OeLFbM4WKOEb9kqeUUvpGBhHhRfvflVsr/SP+zghF4PZsP5jSTlOLB?=
 =?us-ascii?Q?txoeiZm6DxCt/XrbMod+4B5gh5elWJ7VI4KROU/+y/lvMGsAYPhh9YnAaavP?=
 =?us-ascii?Q?iOaR4LntWsRxwv5t1xJ8GsEY2le2SQAMWQuye/OZD+bYVx5Nfii0z9X3PVdc?=
 =?us-ascii?Q?d0ercucW+HTSyYHgSbWiNkE2IgcSN4ae8oUhg0K6hT61fecb7L2gjSlnVkTp?=
 =?us-ascii?Q?Asfmcg9llbuQdtiGcih9yryK92E4cfTXxTv0VQvVDc14t+XP7M9mtPF4EPGj?=
 =?us-ascii?Q?9mrFJrvczjIgzPuH9tRyvxC5AxjawpnnTQYu0ukULj5wKq+ruNKrOpmSQTjl?=
 =?us-ascii?Q?UDo7Ath71m2nEPKPiU/VxNQZrLbvaXV6puhd+TTu405A5yhbh0L146kpDCED?=
 =?us-ascii?Q?KKa89VIbfMTWSKvqB0T3kmGhJXd2JN/MpMQ3SG5EX99lXrOWuBuO8EyeAMPe?=
 =?us-ascii?Q?ffSBDjPcOBBiea3pUDF8LKj1M6yb6Du6EetBCXzER0qskBhY+U9IXKYDYlTX?=
 =?us-ascii?Q?2KnVzb4KGES76oQZNnLMrJVNHRsdbcIu3PmLA/ZrIbl3ciZujNp4YK+ENL3v?=
 =?us-ascii?Q?QH18qHacru+UpVMyghixEZcMSFe+ResF0eT+dsLtEo8IrVVLuEHfaI8TeG0T?=
 =?us-ascii?Q?6Qnn3zQL+bZ7tmAHRsFtfrwnssuBAXYCOgK1tit5w43v3jgtsLZVKJvSlJwI?=
 =?us-ascii?Q?W5LNu/BDRUeslggs3FeeHbyqk4eCjEbu2UIZfq0HsTSuePuzhnfjGSNYy0cL?=
 =?us-ascii?Q?2T1IUT6vtIsO1TxIgOLFS/CNI0TCKSwQ5tGRc2Id65KatHgRnfSUKhoYLOlV?=
 =?us-ascii?Q?QcsD+Oo4N0YVYlwzabl/aVesEcCpst2/2AzgOKrz4C6pmpAXH1RF1rzUKrHX?=
 =?us-ascii?Q?kNqvIVEjUmwz5jTi50Rdl/RaPXKgZaNylqizLmyvayn49DzujIF15Njv6hG+?=
 =?us-ascii?Q?pb1YwiUxLv1FzvW+vrVfRdyOoC1b1MSiZ4IqBIq3uUGXPzc12uJeld6MO9GY?=
 =?us-ascii?Q?6zQDsLP7b/tFH/ue61LZovIYb0F6n22a/RgNwCtcBcMtRS6tMDeifrOQq6mX?=
 =?us-ascii?Q?C+GGxfgTDubx3orzduUi8fs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(19092799006)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tp0wNZ2aXPB2/YIXlzbmCMTgd2zKa9udTXu2EcHt4gDkMo0AyK115oBQmtXE?=
 =?us-ascii?Q?1YXo2MBVF3vb1jRymc29z+l91Pdf7xjwutUU4JrCuzQiz8VD5IIR5PQg/mnp?=
 =?us-ascii?Q?gRNMNIyZhwYQH1XfK/RrX6xRbXeYBEAXFKDyzuZFzPOUhMSW9y0VCbI4FlqN?=
 =?us-ascii?Q?Ah7roU6w0TV277SWqOaqmGJfNqJfjgtGUqcG6v52LqanoscJDmBs78U83dTF?=
 =?us-ascii?Q?EGsA2hv74ixKaUragY9x7Rtl5SnxKqVWrgpFNob/PJDd3k2XiJdReNITw5IW?=
 =?us-ascii?Q?GM92nS1bnPkUBFlxPSD4qE/wdvpF1hKtwQeTHrtUYi/V4Q5Az3IfHw8SwSHu?=
 =?us-ascii?Q?EpshbIQ45n/yVAqWBj44gsEZLaJxhN6MDpMh7jNuIoCIfUFbkXgjBoyNiasO?=
 =?us-ascii?Q?w3rqWkNzOYbjH5f9ZE2HADqAd43QkIOsXVNF99hSn6BlrzbgsDnk86ygvFOv?=
 =?us-ascii?Q?Th5BUktMbAgPG7jIVy09sDYzbElzXuaI+C1LngbWdjcIrZTk31rjLBGEKmby?=
 =?us-ascii?Q?QTzr3ObN/vaitwTSQ8ZDdC7+WdbYsPehQqszjCMSCVQebj8TIk5j7hDbHcZu?=
 =?us-ascii?Q?29ei7URfA8EAMxx5uIeSWwWxZnXpQNN/9Wvlm5LPA//GIIkIR0EjdThAkgxx?=
 =?us-ascii?Q?P5rMspQLvl8VX+hqwZYJC4kk47+LZhXQzDyNuzOzzeTrUXRQ70s2Lb5DLCfR?=
 =?us-ascii?Q?/peifBldGq2XNgqIA61qQWaM/kJOv3+sv+cN2FNoc3wg5/DsG1MKB4Y33Eqd?=
 =?us-ascii?Q?+Bmu9HoKLqU59EOkzhUffZdloKm0g6m5p62aMDLEr9SFsj9e9BFAFw8DxTos?=
 =?us-ascii?Q?8FMQU3EXpNfhfoL8+mLbwMlKq6HarOB/f3LcN1hyN16vpp/G9GlVXTgaktNA?=
 =?us-ascii?Q?rGlp92H7T+pVKyths3skDLYCBviPh9URhG7v2VuSuPbAlO08nsznzy7msV4e?=
 =?us-ascii?Q?H9dcBnuvLl5NVzScKHNvja1NVH3agf/SuA8YfH9H/hMh+kwx/deeQCoflFut?=
 =?us-ascii?Q?Ded4d7yXysFxF+vEZQQgFQ7pGbF8v5l3vnEo40O9p2xNJG9epnmj0Lxxpc9S?=
 =?us-ascii?Q?Xggl69VbfV9ktKuwJtOcTIhGOfkEVk13yVxCuvBjYnKmQvS8fHpsM8Nh6/WU?=
 =?us-ascii?Q?8XlacMROA5FvPW7aIc1bkRMnecoeNJ/rcIZxPciTJrJuIFJMev4Zl/u4qVf6?=
 =?us-ascii?Q?1xyNKqio+TP9/2r5MpmQcdvfPVVAQiwkuZWU5UguUUgnCglWdmaI7eP6BxhO?=
 =?us-ascii?Q?H//LLgplCJk8IOtfZT7u6g20B/CLUCKZ7iMk+2EgWv4KorKpEsGhu3QdEOuK?=
 =?us-ascii?Q?SVemaCfioFCCv3TQdXxettx9n+y5FAlzfdB4L7cveqsXfVyHUvQXJnnINuej?=
 =?us-ascii?Q?S4xM8UXORc3ICiJEZXVRdzfBiif02NLwWTF3KBUla1lxguCecgkVK4x2yiMn?=
 =?us-ascii?Q?ZbOh5/5tf6jbV9ah9+nGAFMlHNjwEzxGR2Jqdh6ryMAXNf7BJOsjlasPbh0A?=
 =?us-ascii?Q?JU1PIj93QEC2BxNYxJEQ8sUYhR42ipmjsXrsG18ps5RNv3A4swiHw61sTu/L?=
 =?us-ascii?Q?9KyaUiKTcx8nmIWbzjRxMHK/A87LFKZYSvHlbakG4KN93ycUb9tplpsn6ZIJ?=
 =?us-ascii?Q?GKdqhagcB7h6iwVUQkHKVov/yDxEJ/Ub8ko11fYtMAxem0j0CJ0yQxUFF5iv?=
 =?us-ascii?Q?u/kMhsX54CiSdiUhSHzu/0ncu6h7fw1/1tf9PRo40G9NhoHz?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e94edb99-8371-4c1a-7a16-08de59286977
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 20:05:23.8319
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DfnNulLh+18Qkpm+bPsYOEgz7BnE9n8x8H3iv9Y2bjkgCncauTbpdWN0qJtal0M1YcuMqWUgjexEMW5bCEUAEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8097
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_120528_612988_BA3D6CA8 
X-CRM114-Status: GOOD (  16.50  )
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

On Mon, Jan 19, 2026 at 11:34:09AM +0100, Francesco Dolcini wrote:
> From: Francesco Dolcini <francesco.dolcini@toradex.com>
>
> Ixora boards have multiple instances of status leds, to avoid a name
> collision add the function-enumerator property.
>
> This fixes the following Linux kernel warnings:
>
>   leds-gpio leds: Led green:status renamed to green:status_1 due to name collision
>   leds-gpio leds: Led red:status renamed to red:status_1 due to name collision
>
> Fixes: c083131c9021 ("arm64: dts: freescale: add apalis imx8 aka quadmax carrier board support")
> Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>

Reviewed-by: Frank Li <Frank.Li@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/imx8-apalis-ixora-v1.1.dtsi | 4 ++++
>  arch/arm64/boot/dts/freescale/imx8-apalis-ixora-v1.2.dtsi | 4 ++++
>  2 files changed, 8 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8-apalis-ixora-v1.1.dtsi b/arch/arm64/boot/dts/freescale/imx8-apalis-ixora-v1.1.dtsi
> index 7022de46b8bf..abb131d247c3 100644
> --- a/arch/arm64/boot/dts/freescale/imx8-apalis-ixora-v1.1.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8-apalis-ixora-v1.1.dtsi
> @@ -21,6 +21,7 @@ led-1 {
>  			color = <LED_COLOR_ID_GREEN>;
>  			default-state = "off";
>  			function = LED_FUNCTION_STATUS;
> +			function-enumerator = <1>;
>  			gpios = <&lsio_gpio5 27 GPIO_ACTIVE_HIGH>;
>  		};
>
> @@ -29,6 +30,7 @@ led-2 {
>  			color = <LED_COLOR_ID_RED>;
>  			default-state = "off";
>  			function = LED_FUNCTION_STATUS;
> +			function-enumerator = <1>;
>  			gpios = <&lsio_gpio5 29 GPIO_ACTIVE_HIGH>;
>  		};
>
> @@ -37,6 +39,7 @@ led-3 {
>  			color = <LED_COLOR_ID_GREEN>;
>  			default-state = "off";
>  			function = LED_FUNCTION_STATUS;
> +			function-enumerator = <2>;
>  			gpios = <&lsio_gpio5 20 GPIO_ACTIVE_HIGH>;
>  		};
>
> @@ -45,6 +48,7 @@ led-4 {
>  			color = <LED_COLOR_ID_RED>;
>  			default-state = "off";
>  			function = LED_FUNCTION_STATUS;
> +			function-enumerator = <2>;
>  			gpios = <&lsio_gpio5 21 GPIO_ACTIVE_HIGH>;
>  		};
>  	};
> diff --git a/arch/arm64/boot/dts/freescale/imx8-apalis-ixora-v1.2.dtsi b/arch/arm64/boot/dts/freescale/imx8-apalis-ixora-v1.2.dtsi
> index 12732ed7f811..a0b452b92b3e 100644
> --- a/arch/arm64/boot/dts/freescale/imx8-apalis-ixora-v1.2.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8-apalis-ixora-v1.2.dtsi
> @@ -21,6 +21,7 @@ led-1 {
>  			color = <LED_COLOR_ID_GREEN>;
>  			default-state = "off";
>  			function = LED_FUNCTION_STATUS;
> +			function-enumerator = <1>;
>  			gpios = <&lsio_gpio5 27 GPIO_ACTIVE_HIGH>;
>  		};
>
> @@ -29,6 +30,7 @@ led-2 {
>  			color = <LED_COLOR_ID_RED>;
>  			default-state = "off";
>  			function = LED_FUNCTION_STATUS;
> +			function-enumerator = <1>;
>  			gpios = <&lsio_gpio5 29 GPIO_ACTIVE_HIGH>;
>  		};
>
> @@ -37,6 +39,7 @@ led-3 {
>  			color = <LED_COLOR_ID_GREEN>;
>  			default-state = "off";
>  			function = LED_FUNCTION_STATUS;
> +			function-enumerator = <2>;
>  			gpios = <&lsio_gpio5 20 GPIO_ACTIVE_HIGH>;
>  		};
>
> @@ -45,6 +48,7 @@ led-4 {
>  			color = <LED_COLOR_ID_RED>;
>  			default-state = "off";
>  			function = LED_FUNCTION_STATUS;
> +			function-enumerator = <2>;
>  			gpios = <&lsio_gpio5 21 GPIO_ACTIVE_HIGH>;
>  		};
>  	};
> --
> 2.47.3
>

