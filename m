Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4605EC83038
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 17:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xslb0+wQ9/vg4U3DnNCXbJDzSLSQ2sx14avlL623MA8=; b=IeJCvMlkentUbRRH8Izj/qHft4
	MAxdqaN4mqqwfCs9BCn29zVl9e1ITgCvV86sMY3NQ0lIpnK/NmKTxzBQFox4LTTFy3Tx2lECKOKd5
	Xq1WvVEHx+6xxvuHVM8l7w60QsIcozYKjzXCXClrhklK10moelzIq6QjvtaTBjh46f/ilp/t4kXsc
	yEogVpzZJ233w2CQyvMR73G56gWPtHFrrehZVakLnD8a4jswIrvyiwD2YmOs8WgEUs5Hlic6EV0Ll
	P61oEE8jfFcsrgxyG1aKNQnYkTv43IP1k7p5FM6pzdzAKHD2+drUJUUo0XjtIM+KT02RPFfDRXCu1
	CZsmVbkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWf83-00000006GvD-38GM;
	Tue, 01 Jul 2025 17:50:47 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWcin-00000005rAa-07nB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 15:16:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AtjZ+yZJCpYCe/aE3mWG32SY7qjPmxLlP4fzrOY0Xd5LDMYh/g7Xr1RYD3/0MaNDS3SeD3/xfI7+Eel2hRGZbNTq7hSRAgFopPhk2eJDOVm1OFiezoFN/+wG+kTfleiQscrFk4Mj9vI2NuNnnrWHFFZCiRaw6X9aegL6iku5d/U6ipnrSX4j49+KMjcjXRvjrgFmOe7gdm7Eel2pNoLuHRAp6XfElBT3vdSDtOro5Jv3wDlN4tdIVhGDqpPw3AnLe+6rp1jpkcH24q2P9WlnL+cK9ZjbYqEDQkFcP5zrZPhTS/h2cNMHan7f6VBwOwbGgGynSysqf10VNexEFdtnxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xslb0+wQ9/vg4U3DnNCXbJDzSLSQ2sx14avlL623MA8=;
 b=jZF6d9UBTgcwNJj6S7llrKnAl7WKALYj/Zyn/cEKTqR5X1Q+y636F41HFdK6CCLsmf01CL+KFaSvkayv+jmTaANKLStaodPre7+cvAPjI3mPy3Lcvo1+IR3EIHnRG6dbAcLbq4Nxyl+2q9TBWF8Jy+2boLXbRdRUIiwYdybOnnqQNq8bIcf0WVqV1NmmC/9zPV8jTLSHt1A2WilYrP4Go3LsRSpwZ08Rk2Qbwg+dT3kq4ROhzfD6MeWlnrceC9GSJDIfKaIfppGMZMaLE8K6XRZDe5a11DYPFijeZIzXUZJbA/oSOwr4hDdOa93MxUHOTSaP5P3rqjrRWeTvP/DRug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xslb0+wQ9/vg4U3DnNCXbJDzSLSQ2sx14avlL623MA8=;
 b=UKBC9RJBovNYr5dzDwrmE+IT4AhdJxuBo0dpl4XsRB9o4e/E4sXFSxj0oipWkRzOEVuLOmrtD9vNBVPrDZlmAdUqdX4y/r8b1jbNTv5VPLlorgYhj8NmRZ60li7rEXCOKvmFI2i0w9gm811aZwxlIXt3ZYi31k6oD523IbTaPtJ1oN4nWfv7HIjw62Td+q7JJY91CGQzq+u40o0uZQHud1kJTC6BzSdODgXNlLxortZb0FQpR4LkO0ghhtYhq6Lk3OGeNeU4+LjCgy9v3ZaQhqQbhZ2750VsuY52Yar+Dw7ed2VRrbak0dt9YH6dxDQ15Ia+cL/9i176gvdugbrBRQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by VI1PR04MB9956.eurprd04.prod.outlook.com (2603:10a6:800:1e1::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.19; Tue, 1 Jul
 2025 15:16:29 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%7]) with mapi id 15.20.8880.029; Tue, 1 Jul 2025
 15:16:28 +0000
Date: Tue, 1 Jul 2025 11:16:23 -0400
From: Frank Li <Frank.li@nxp.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux@ew.tq-group.com,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH 1/8] arm64: dts: fsl-ls1043a: Remove superfluous address
 and size cells
Message-ID: <aGP7xwc7sqR9yVu0@lizhi-Precision-Tower-5810>
References: <20250701062500.515735-1-alexander.stein@ew.tq-group.com>
 <20250701062500.515735-2-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250701062500.515735-2-alexander.stein@ew.tq-group.com>
X-ClientProxiedBy: AS4P191CA0018.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d9::14) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|VI1PR04MB9956:EE_
X-MS-Office365-Filtering-Correlation-Id: 3516b7a8-f51c-4381-3dc5-08ddb8b240a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|52116014|19092799006|366016|1800799024|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?4WvVI4z4T45/u18BjvkW8EWa61No8/9tUECCyi4rIY6qyCE1AMm2D8pBMQlo?=
 =?us-ascii?Q?ZJ06bmEeCKT+6movqyea7TM2xrOoSu0kREY+3lyi0Wc9uasXGexk6DMVTUAV?=
 =?us-ascii?Q?Q2R2ewpUET2ONR2l1A1ODYuSxfQQnxNPmz9O4tvAVFqIaCBYtKQtiFosYr5d?=
 =?us-ascii?Q?qU5q/tNsj0fkef/5fEm+uAT9lalvgd/EOeJSex2NdCneyUyN6SKE0dfHiTBg?=
 =?us-ascii?Q?jd+kv3DA3YJsJoWV0viMvXcRDXIQ5bjcJflKilpCf0PDi4sRg9V6utfeqlTv?=
 =?us-ascii?Q?c1odQjgqhpx68SRSOkGjqA0eSXakA3RLaMxhqBv9R6H0490za02sIfHWQcs5?=
 =?us-ascii?Q?/gOc9ijm7nGJpqI10MJWrZ3UdFIrdidlI9exdSWrFub8EPWhFZz3jfMgS1x5?=
 =?us-ascii?Q?CCuIauTAZGrJOvOQkaJt2tffLJdwTKjp4QVx5DFer/2M5HC1H07Qk0xdk1uK?=
 =?us-ascii?Q?s+aJRd1My68ITxmdExdkre0nT9Wi1ld4ro/p2Ck9QFOb3kWSd9qr+Yj2GUvM?=
 =?us-ascii?Q?z8b/7jnkGiD8HMAJBCBnkwuhyJEzEdx2vJIBQenkC7JtbCfPw7aLRdHzYIcr?=
 =?us-ascii?Q?bmNxOTR4Xl/BJBWfTO3VnRd/HoKbSdIvnSyY7Yfqpy9wOfHFtHF6moys2VjE?=
 =?us-ascii?Q?BfoJfAYMYVo/DVYRN1h87ygrm74MyBL06XarvvJVnVc5oMpk1BHocj1f2L89?=
 =?us-ascii?Q?j4JnNfOLKwpdpntIuFmalTQznYrG3k18vsjEmVQyp2deYUBkb4dDQ7cBD8jZ?=
 =?us-ascii?Q?eBQvb2MU7iGiXme7SO4ykOLkiAdGEJC3BaGvaVjtKyCXuKsDmDM3hEL510eP?=
 =?us-ascii?Q?GykMwDcoz99Su94s2FK0m1TRqsPgaqdcWoEFywD+clCy6l31bXtkG0r7KOVK?=
 =?us-ascii?Q?fpdIx+krNMsDLoasynVc279jp3k7PzDzEEiIl2RtjRVJKi3zswk92DtIFjMX?=
 =?us-ascii?Q?cuZvUplkFg47m6M69IsG1Ok8DP0K4tuDB7JG2wGcHioDsTJvoi03l/lovRfB?=
 =?us-ascii?Q?13qoH2QPc78b42RbbPH3dPrldRH8jb+dSePgv6jyuDMy2ci4TKZhGTKMD0TM?=
 =?us-ascii?Q?kmQFG5MO0wkealjIcAkYbeklg1j3oSFfJU2pXogXlnLdZvYrzSwkIMcGNcXG?=
 =?us-ascii?Q?83/T0hVYol6iM04HXpwb/4dZ2rFxS7EbjYlylK8pw/myIpnbrz5ko3cNRYtS?=
 =?us-ascii?Q?1H6uj4j3/g0DCWmF1rciTvB9YhD2z366V25DOlqyAp86s+wwoHsxpqTB5J/U?=
 =?us-ascii?Q?oSpcU4Cgz5y/8+c4Hcr0bEu4uftbPVeiIYrwYqTHWx41+71ZCHyirB60YQsq?=
 =?us-ascii?Q?vdl6XpH3qSjAU/8gPDl+U2o+s5G5FdJb7O0g+0s3+2ftXaZqibf/Ytvt9Baj?=
 =?us-ascii?Q?arlrl+kBWNTM/Xc7Ir/EKp4zN1hFkly1aCynZPTAa5vESCIrN70zC6QqSLGJ?=
 =?us-ascii?Q?w6DoA2Og2vyFJKJwJBPKP4zFjDsPqREvf6FDsuSLR4mW9L8EdlYYb4JiB16o?=
 =?us-ascii?Q?9Y1RFMQskIUCs7g=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(19092799006)(366016)(1800799024)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ynRQ3eaFprRC0Wz/47H9xuumWf6kw3AiziRXsvLINtZ0YO+0kbDtaFxfczNH?=
 =?us-ascii?Q?iTxiHh1VcAvmEuUw/VAoHt2n63CrANgg2B5pyAdESy8AS6zG8P1m1Ckq2qvx?=
 =?us-ascii?Q?G18qKGg3L333Xd6VeHL+TFm+4S+4cWdfN53JeNzk5Bwp/CDU9l+TUTpCDg9V?=
 =?us-ascii?Q?JWDi/zpjJvO4cCcMnRsnccYh1AFvFojdujf5KICCfZ+gMTRxQn4+8P2mkPz0?=
 =?us-ascii?Q?2ZGOI/E0ya4r4z9PpJkjaPufSL8ThfJTa6Z9mIbt/VjnKU+hpZ/Ef+tjDmC5?=
 =?us-ascii?Q?tkq8C89wH0KjYxEtHQGxFfUrX/o8jQCxhmeDuS4h6LBK5gSPUPRIf2Rrm5wi?=
 =?us-ascii?Q?JgjyE2Us+2v8f4hbQ6FtLnGzF0y3kRNOAFSswkm8/dwXyIehr6IqnFalBlCa?=
 =?us-ascii?Q?IoOinqoM+ht5V2hfbJmZJZQ3I0F3jIfxyloR6DoGIsbrQMPio4Pd9kysAfM6?=
 =?us-ascii?Q?tcv45dAI40QkVlS01ogHwzHEVKkkw/zrF/zaRtjsoYmJNiQ94VBO9dwTMNaL?=
 =?us-ascii?Q?o1TEOOrKp/8FPeDsPqrtyk4dA2fzY8Ms7JDXw9+ZlfqjYbE65a/4WDFRwMfp?=
 =?us-ascii?Q?7/Y/378LxdEgXTZrqwltXOBoBtclqj5YYEe8lrDO/O6LnGHTswaLbpqjfYl6?=
 =?us-ascii?Q?Dvd4lkxGZZC+a7unRR7kFU4G/36cNkFQddhCF/KegCFJ6s8xbOfWJKSn4XyR?=
 =?us-ascii?Q?WdbjYwJnPd4rBMyw3TKlNhbf/SnAUmXeu7n2+j3gyGM5bXZOVKAds+b1IVJm?=
 =?us-ascii?Q?u2EKIceCceTT80Ya5hN7QfN+C6tugqH0Fdev23HsUsf1Nq0d9kP3K2+SBuzm?=
 =?us-ascii?Q?wJ36qH3XRjBV3kW2nZncdqnUJTFcm5ZH0V/Hzig6gE0U/TpeJmhi8Lx9qR/Q?=
 =?us-ascii?Q?AdxnVWxAILYAgs4WJgBMGkGYe7tojJRlDilNHzpJZbr74RsnOaYkF21DRK4m?=
 =?us-ascii?Q?9s8tEvWGJRjfe9gmGwGgSE3oIS/vCHJeOArQlZzMzNaPOlKvgRBv8muSO4Or?=
 =?us-ascii?Q?JyEyo1UN5P8lV30F+ismZdVqY9QXV4g1hG2aJwCUOXXzY+Knkx6auKvgmlq7?=
 =?us-ascii?Q?GZKfY4unwig1Y3I9JyyK2ZkCLj+DOUyT+S3nacxG6e+0FY1132oKpHpQZlxE?=
 =?us-ascii?Q?Camu1R6z/KDtJQsTatsC/O8TuxfRcx3T67OeFcTpgAaSNhKvcKq+6Mcv2lI/?=
 =?us-ascii?Q?X9VUvzbYq5X7C7qwHXLBP17cneg2OTF0lGv5XgSsVW6RxQRTJXstyWdl6pb/?=
 =?us-ascii?Q?0auyNZoB7golFb0usl5J6bYYZtbkg395ZwyefcKlAca3lapgu3Gtu2oJD30a?=
 =?us-ascii?Q?WaUNKSL6+FZAfMTQjSfSGUNbOJ9IhtQfQkIQsx1gEK1ZJDyICoPQ3UNex2LO?=
 =?us-ascii?Q?W9tFSOHdBOKK6BiLwhygAew5BSB5bxI9phq8SioTTD0Z9POZWKXRhKlguunD?=
 =?us-ascii?Q?hNawX1lmOao8ADhH3OJfr20ODEa5xFwgInNIZD3FdPg8s/EiIQ4wdR4vu2ea?=
 =?us-ascii?Q?dtliMyyEgK0QxEe8AvPauVdf6elI3e5qa/oWbsWF5MlWO6i7D5fTMLm+JNAF?=
 =?us-ascii?Q?UtdBzhJU/d9Qs+ipMrSO4at4DlWQDF5Q4vKaLtlc?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3516b7a8-f51c-4381-3dc5-08ddb8b240a5
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 15:16:28.6866
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EACsyzCbJ6/6/SzSu6DuDkh9LLkwSXJTAYn7Zu6AaloOTLqFTFI60RV5CYhLY2Q3FTbS1LWGjAlBUNdlfq/dUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB9956
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_081633_075392_3FB72CF6 
X-CRM114-Status: GOOD (  14.43  )
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

On Tue, Jul 01, 2025 at 08:24:49AM +0200, Alexander Stein wrote:
> The jedec SPI-NOR flash node itself has no partitions, but the partitions
> subnode.
>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Reviewed-by: Frank Li <Frank.Li@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/fsl-ls1043a-tqmls1043a.dtsi | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1043a-tqmls1043a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1043a-tqmls1043a.dtsi
> index 12d5f3938e5d6..e39eaa1759365 100644
> --- a/arch/arm64/boot/dts/freescale/fsl-ls1043a-tqmls1043a.dtsi
> +++ b/arch/arm64/boot/dts/freescale/fsl-ls1043a-tqmls1043a.dtsi
> @@ -17,8 +17,6 @@ &qspi {
>  	qflash0: flash@0 {
>  		compatible = "jedec,spi-nor";
>  		reg = <0>;
> -		#address-cells = <1>;
> -		#size-cells = <1>;
>  		spi-max-frequency = <62500000>;
>  		spi-rx-bus-width = <4>;
>  		spi-tx-bus-width = <4>;
> --
> 2.43.0
>

