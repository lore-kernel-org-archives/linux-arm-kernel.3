Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AAB8C83038
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 18:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OxZ+gTF+FRVOpebVs32DVGFkLNAHUQ6a4swqtaumMRY=; b=U27YkjSEIRD+9emcdJvaOeL1od
	P5QcYzRLv+XKs11JxaGxxSZ6zOBYYKzuSlH2hTQRlnS/aFBbHQYEaoKmCTHUdcKKHtAsTvxdtK7bU
	Z3ApERSTfOGjhABwdNnAd09XBMKPBGzVhQjhZtAtHWWD81Nr43ZvUXZ4nV1lH5Sf7ME4xAQ+ZUATO
	mfBRdI7yL8r5GETxE9ezAQceU2UQl5hfgH3csyAsfBdRI7wKrZDCziZvzAwKYc4zGIMrck6lf7+RE
	g0tN2BU/Svrn9IrzSLPvmJnRFfg9KXc8XINT3mbcMfz8AEfGfUM4HagL0m93yopzzVBvENAb/4VQj
	S2AoTgRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWfHI-00000006Hxm-0YRC;
	Tue, 01 Jul 2025 18:00:20 +0000
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWcjN-00000005rKW-17jS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 15:17:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rHmF2jisPrEUDEd5dtDSUF4hbkpl4QqxuSZMCRfz9g16ZXbhfEz2GXb3OzOrUVctWU9+o/MgpR32D/3VHSQnHB48bLy8dsKFlAlO1l7BtjNy7kaKBQS0VU+Jj5k234aDQ/36Ia3reqznL9elJ73LqZ0WlvTurK3eUvHW71nT/F7Nu96pL//Yk5FFa2gz5DKFysMe17wusUjBzBKWggeBJShoOQW2ouHTCtT1mnnZKORRTDap+msEDuTQeUXFsNqzxPxaIyEmFEqzsMO2RVWvpSVESFmSyS+r7FSlspEZDVknsu8JviH9qFE4mkmBIeLiakMjrGv0+HL5xU9VC984nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OxZ+gTF+FRVOpebVs32DVGFkLNAHUQ6a4swqtaumMRY=;
 b=RQq+qMmLPNqcT4rYMScKrv+bzj4R2SY2RlMAmGkzc6PUip0acHs2du4H+Dh+2qdkgw9ajkpvNsUDckYSbKcIkVRCKJk5gWT+yRKb633Y3cZSxeQn30OxaQbJre0X23JSLy7SnsBvyxkwOhjpNb0/b2PP/7gUo32aJZYde0ogvMSU5IDaqaSoMQfb3rE2GhljoaCtnM4ralrjkJqhErbNH+MWWyPh9qTrwxyja44YVivm4yUG+D9S2c+ciLEoCtQMCBhABjDfBTRChKxeqx38XmVGvpLn2jd41334YvgqpUVYYc7ucq0IZDCUmIpSR8uaxQ++UzzjUamnujfC17mPpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OxZ+gTF+FRVOpebVs32DVGFkLNAHUQ6a4swqtaumMRY=;
 b=H2bUSdGYFFw/0w4/GjHOuuOYJoD6pgu6WkcrY5tlrT0BBRD9HjsgAr1iXC9GoZzm1gPF+Zi/9v41bPplYH56E1qzgirM5FtNUzk4aUthEvnOIFwQE/cEfFsrLfKHSXspgXuzbz9K/6fB/M8awCVgpoI1LYA5/WphLYXnljRDhBj6vlPUhw+/Fp4LPLZwwWuGMsIMCOMhIRwj5iaRdCca0t5ppw4zClbA2LVN1NNlUaYQJ2pi0bgAtO8ukwnQdU2N1fhhG3BLOCknAqpzIsHfPa8SL/toAIPwCdThzxSLJLsPobi7GY/+lPPNGzFDYnoi563mQnLOa4reW7OwXaD5Xg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by VI1PR04MB9956.eurprd04.prod.outlook.com (2603:10a6:800:1e1::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.19; Tue, 1 Jul
 2025 15:17:04 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%7]) with mapi id 15.20.8880.029; Tue, 1 Jul 2025
 15:17:04 +0000
Date: Tue, 1 Jul 2025 11:16:59 -0400
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
Subject: Re: [PATCH 2/8] arm64: dts: fsl-ls1046a: Remove superfluous address
 and size cells
Message-ID: <aGP72QqVTvRBugP5@lizhi-Precision-Tower-5810>
References: <20250701062500.515735-1-alexander.stein@ew.tq-group.com>
 <20250701062500.515735-3-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250701062500.515735-3-alexander.stein@ew.tq-group.com>
X-ClientProxiedBy: AS4PR09CA0007.eurprd09.prod.outlook.com
 (2603:10a6:20b:5e0::8) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|VI1PR04MB9956:EE_
X-MS-Office365-Filtering-Correlation-Id: fa58b15a-72c5-48b4-1e51-08ddb8b255c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|52116014|19092799006|366016|1800799024|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?4ToKZG5b7kiZsjy1aOgal9tVweDIwGZaUZX0/nbdxFSfoi9PtW2WpH3E+1kf?=
 =?us-ascii?Q?RO2IynBDQ3ZntKXKhp76ivhaK36ncvh0XmOSIyUMxS0XAMYiWX1OTKH3cPnI?=
 =?us-ascii?Q?4QUYbZnHrsG4MfkEOggBPdIMby5cA5UL2OLTw7Jr4jvpGRoOE+U4RyuhcIOK?=
 =?us-ascii?Q?rdyLrtX8HC15UGIggt4HhdhS/dc1CefVGe1uEkYud/7Ie1V3n9ZiDRaTdIMW?=
 =?us-ascii?Q?2Knp9fONjw6Wrig3N+A0ZWLXZ9wZgunab5H1cakV5JQR7rfGHO3+6Zio1f52?=
 =?us-ascii?Q?EjH/Ru3W2LRGPjoUOOLNZ9/go0eEyP40/emmNAKgSOc5EuuBTfDsMJpQjbtD?=
 =?us-ascii?Q?VqpB9L8WVCfXxu/3WzbWg1HODYxbJLgc3W0+Rj/Ik2QY72zTdcCgJ/OOx9y6?=
 =?us-ascii?Q?hJElAcS9lPFsj84YWQ3nz9GeWSlWZjH4yNKIcb0F88bp20/ns/+OAy6888Z0?=
 =?us-ascii?Q?+vbym21IKwY5QCoDQMEymq37zvrkP5UgU6WWsz472US4OY92USCYOmOpSdrj?=
 =?us-ascii?Q?OiXgyE2Y/n95tLzk3BwDIdtt2OC+mLGEiRLJL4kgFf086ORuD/oS56wXe8Oy?=
 =?us-ascii?Q?NQ2/aa+b9Qz0T52DzI+h+ok2N0sDf9/4B5g7pRnD8Wo0yAdpElwM+1kMy9MP?=
 =?us-ascii?Q?4V4pPgBE5Rx4bcDsccW+rJrqIm+FuwcDe/03UXp7SN4FztKndePISz+cyagk?=
 =?us-ascii?Q?9u4AXezvExD813zB0YtVms+IE5zDINs54nADuSm8hJy788JnX96vcox0CFLN?=
 =?us-ascii?Q?/WfMDgkyzy35pDd94+AU8TxJNCc8uKOy6/mMeSsHb9iYLwNmKlQ07EqvYptW?=
 =?us-ascii?Q?AHpY1TxPM9v8t+1lYV8aPeWB791krpb7g+zBfMK10o9I/a34HwcN+3o7MUfb?=
 =?us-ascii?Q?DUxEnVMex6hI5saL8qOPZ01pEcUO8MmzjSPifhLwSFsPVkHtLEodEjdRPRV9?=
 =?us-ascii?Q?DB42fBQ/EIoRYhNLRBOynL5OdzWPaOSfMYo4VPSi6grqUVOMAmEsSMNv8hSD?=
 =?us-ascii?Q?XBLmF3645+5kTk3KID4NUEHDnAmc6Bz3V7ClElsog6Qa190TjIOsNI8S1aou?=
 =?us-ascii?Q?9Az8KbyexWXeuqOGtOc/Jh+YFNipXQzoVzt5EMDY9j08u1WBvgK8FlknYoce?=
 =?us-ascii?Q?oYsjQhE+0aW8s0pzZvACSO4qDUScdApLCHrJh0e9wYnhfLcycls3SZNHp/t1?=
 =?us-ascii?Q?nqi44cGlsRVaioZPPIjg0Z+kD0cQq+dix5MhB6O0S45Y+VmOr6hSn6gtF+iu?=
 =?us-ascii?Q?lqcD7yQuyR37T39/f/pQlhB46+nAdSe+c6scUPJrvXWbxYjHP+pAD0frFDR1?=
 =?us-ascii?Q?a4NCxjJallQ1dx9M2OsfMjf80ZwI1hM1/JqnGaF91RgyNLSQvVq2h/fKKvt+?=
 =?us-ascii?Q?vsL1FxJaTupTybd0DmGDrPGovPp5DVpiATeC5OH0fGp2huJ0b9syHHYajmNE?=
 =?us-ascii?Q?iNZS8G47fzyA/nBZN2TzBTwYJHCi8KMORUIE5mvom56YY45JUvxFTQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(19092799006)(366016)(1800799024)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lsAYZ8S/WZp7dH56D56vYnTBMcECx7W0C5En43D+QzYdjs5c5Yi+n43jr3EV?=
 =?us-ascii?Q?F+NPd4875Af6XvQhC4djSKDWkgBdiS2YWwJ4AShi7x267tGyjMw7qMARYuT/?=
 =?us-ascii?Q?K5EsryxgPP3wRVwpuOOfOG3h1rOoy9+wbO7WIZlyJd78Ll7kmWS+kzfamvvs?=
 =?us-ascii?Q?aRIsznt4DHffvx/p37/nf7hjL6LkoBHCwQMWrTIhaf+qZSkhy1ig443Lheqc?=
 =?us-ascii?Q?O65EgHNLp2JCHULw200H9F2KtghZOLhUXvCmwMS1V/Sj5HCMieQ3jymaQrIy?=
 =?us-ascii?Q?4XFApXndBwcvpRm7hH54MFocqQ2BPHeQIZ31/lp54l2FsMvdUykmfYaQ1pjk?=
 =?us-ascii?Q?D0UsyXRjn0lLhrDa7hSKnP14yveGfs3PWYmVkICtMG9wJj7cTZys2Njpic7b?=
 =?us-ascii?Q?jtVlxtK/ZOFHs5eoa3O9zDLX6FmUjKNb5/NbKELo575WCUW3wWJsByInzML5?=
 =?us-ascii?Q?lA0l/SNq/eQhYv8FVbp7MhEQ6PQ230FCrpyl9ANTmWmBEVrpBPqhvkBJh1Wm?=
 =?us-ascii?Q?jShpuPpveDsE4MtqZ57hdpkETl321m2eJHEJc3wJwUPR3/56m9K/yoBph3xN?=
 =?us-ascii?Q?/nLCXuNN3TjlH/nUIIz5MTAoJ8wk3sR/6zmmnw3oJuG1Zjxr/vjeIgJnakOO?=
 =?us-ascii?Q?vrKSlI74Ja/8FhBmQIBOdoZb6m1mw33YWGb+5RR9e2Jus+i7NFUnhjMiDvhl?=
 =?us-ascii?Q?ILn5hcz0Q1QEejVrWw53551KVqrW5SP0CN2cXw4failWOmgekyEgsaxo+SBt?=
 =?us-ascii?Q?YRCT5hG3XI0XOVFy/yJq5ch3y4khEHsS4ZLKT5uOjeNM1Ce6VfWRwWLbRx5d?=
 =?us-ascii?Q?z3n6fy/+5ckZlwk1FB97fIGtDxtaZXtc7DWh3wBM1T6M8LtnaRADeoSz72RC?=
 =?us-ascii?Q?ROGE+AHXSsmtGRTq8Yj/nVGJGU5v/M/XsGii7CqIh/eIduNRLQfhOnW6Hjk5?=
 =?us-ascii?Q?tyVa3ehTzgXWHAuiPljJoqNuE2pRc9b0pTrZng1N+NdD1AYnjCk6P/iVrSue?=
 =?us-ascii?Q?JkiqU19X14wYzUx5Ds/lmuRqnejdcv7mcU5pFnRjqPSlQHSQUHDul9YBAAAU?=
 =?us-ascii?Q?0hIB06ZMffEoxAZaDZQrOjGJ/MctdpvUFHC/4j8bDndhcHpGO6gsbyK0GWSA?=
 =?us-ascii?Q?nxUkwCwuz2/00AfFG+mTxlQviHi2G8K7jHkWQJK89kFjnNXIZDHHwVwA9dpy?=
 =?us-ascii?Q?oPf/v7fEpBE0vYcQH9EpUz4JtweqCRE0nCh/rI6CGbOxA/AChaOmetBznQ+K?=
 =?us-ascii?Q?/TXBaQeVA3VqVEfb6IFlQAKceJVjEHYJq46pynyAlJR9f+Me1SLEeIPIpnx6?=
 =?us-ascii?Q?MIz/HEIb185Gf6B53Z5A0nttVfAskh+DiPQdklRFgS4dryOK5oPdwlCKKCTu?=
 =?us-ascii?Q?1uia4OC24bnlMrXzGxZXH1huX88O7s2rJ6rvK462Ub/jcTWb60gOx26k8D6K?=
 =?us-ascii?Q?CJxj70jBc6o3debwBN9wVahK1O5iWM3saNQryWR96ElxeQjaqjtJNkVZ+dFi?=
 =?us-ascii?Q?wogAQcELk5ueUb2o98xmNxqVlhQ5sg7LjL+BGrl0GLHz7pLbbPeNt5wyTf6y?=
 =?us-ascii?Q?Wn1QSArBRZIbDSsrzP5M5lKn1DbPPOz7GQiuvDpE?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa58b15a-72c5-48b4-1e51-08ddb8b255c5
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 15:17:04.1558
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8Un7CwaDW5gmzCAu3qod2FigTNWrzzwOuGIT144aTVraOWiZHmusF38iuq0MQKBJerl32gahNL3CfF4VbwWl7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB9956
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_081709_361843_B9BDDAC0 
X-CRM114-Status: GOOD (  14.26  )
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

On Tue, Jul 01, 2025 at 08:24:50AM +0200, Alexander Stein wrote:
> The jedec SPI-NOR flash node itself has no partitions, but the partitions
> subnode.
>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>
>  arch/arm64/boot/dts/freescale/fsl-ls1046a-tqmls1046a.dtsi | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1046a-tqmls1046a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1046a-tqmls1046a.dtsi
> index 4a8f8bc688f52..cafb35f674aa4 100644
> --- a/arch/arm64/boot/dts/freescale/fsl-ls1046a-tqmls1046a.dtsi
> +++ b/arch/arm64/boot/dts/freescale/fsl-ls1046a-tqmls1046a.dtsi
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

