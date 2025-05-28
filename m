Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6418C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 May 2025 16:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EBA9YbNo0T4FeiIK+rqoC5jdvYeMw34OT2cuNUg9+Z0=; b=rm7sJbOo8KB73nYwJAsh8ky/m9
	Ytbxf3M6CeCInDZX3kVf2LDP40e6FkFTLhUdjSjuWwE2D82JIdFqWetIr+ic+YTfMd94qQraatNZR
	YHG6l2yBKhQqjxNmiUywKeXeNM2emu0Qk9IMTfZy0vUFiBhGZEH3M7kWmaIFORmRMHNxY6E3irw0f
	UOc5VYJlm8fOpOd4/d3yU/0lUKYVo7h/vSBQMFIDHzBJdQmZ6McJ40A3+VOPrl4dv8jSF1Vr5JLr1
	6zBBOYZDRRVp4+DCBImCv7Z7WCZHk2P/vHIYFvnNBrjAm8jVz0MDwB7wkRe8KMsp8+y34dYVDBViM
	kYUGY/7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKJeN-0000000DgVl-3rJF;
	Wed, 28 May 2025 16:29:07 +0000
Received: from mail-westeuropeazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c201::7] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKJSD-0000000DdLY-49EK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 May 2025 16:16:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JA/4oAPZ65W3t9QUFuapqJJ7nOB9kqmq4dL5TAHgcdhWL6+P4nj/XQTbYPTnkJyG0PwJTHM4XaWV3IRB8v6JDezOabBtEXSrACv1dVrSBIcmXFeHACq/q/h61OV0RuQJvmXpQAy3+hqKZbsLLzyaAyTvHmyz9TvVdUeQ3RooCS/43or9hU6eUb/8lCMRUWnfpKtCfrhoPFeuLFio2SO79yWa1w7woM5vVv7akBcSND2ZYOiNWCKMyMwoMGJWoOdpKzpQNJwWd/7M4g1dOe5El8cxlRt+Sq233bCBK9O1XbTwQK9vTx16bS4FZaU4CkPq9kfnIebUk5fVb463iLY3gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EBA9YbNo0T4FeiIK+rqoC5jdvYeMw34OT2cuNUg9+Z0=;
 b=QQ1f/xMHhR4o6cesMQWQpTe1v/Pe9yWwFmJPHdSMrO6ziqS/+4d7GYCG4avsTHC5ldCE8pKx/3fQNZCgT3L3Cx54QW+1S8pJP1DrgiKLINKxO9nvj4CNeUaZBUJGJQPQDeWWPjnR4+9qBmsjQlyv4H27yDpGRtcMdlRL5bxAvOyHK7ib5wba1lgHsNEcHYR3Z6WR8+2tuHIf+QM0D/A32Kzz2rBLBFAh8iryEEMQljNaotxHmvRsL6+zMEVQGgVynCN5QQifUkuXN0YM4GzDKXf/LpYwWeEPBY1GzWoMKefD+qNVLbsaVdDnSWvmYTdxYFvNefo7FoFld/PbPq8FSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EBA9YbNo0T4FeiIK+rqoC5jdvYeMw34OT2cuNUg9+Z0=;
 b=lQ1JVe07SfwaSDg6u+WTDx0t3vPdY7vVq9sM7rXSULDDTUO/oF4d738YYuL8iBJDQODed8PkhqdinDbgyw8TCH56XDfU6fh1l3J0AZrxm0ejGRw15mIZxRSK6PDGGEy60Q1rR7suO+K/9rZp2ahlxZIWf8FC5ECQRDS/u/xao1MgMjlI/mUaOVNjowJdqcmcJha+BVSj+4NIPEC9jtBwO8jb4HgggQzTV3Lmp+kLlRSXGnDI9yvFAfZM4EczFtjWD6EZThfOSjQemxMfW29ZxrkCPttbFRhJsr2VatjS7kp8Vr+h38+d1SaIZprou4hDKuBxpluIj9jQ8gLux6UPHQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AM8PR04MB7347.eurprd04.prod.outlook.com (2603:10a6:20b:1d0::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.27; Wed, 28 May
 2025 16:16:29 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8746.030; Wed, 28 May 2025
 16:16:29 +0000
Date: Wed, 28 May 2025 12:16:22 -0400
From: Frank Li <Frank.li@nxp.com>
To: Meng Li <Meng.Li@windriver.com>
Cc: shawnguo@kernel.org, robh@kernel.org, conor+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arch: arm64: dts: add big-endian property back into
 watchdog node
Message-ID: <aDc21jn9RfhOV2vS@lizhi-Precision-Tower-5810>
References: <20250528111751.3505224-1-Meng.Li@windriver.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250528111751.3505224-1-Meng.Li@windriver.com>
X-ClientProxiedBy: PH8PR15CA0016.namprd15.prod.outlook.com
 (2603:10b6:510:2d2::26) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AM8PR04MB7347:EE_
X-MS-Office365-Filtering-Correlation-Id: c8bf8b8a-c529-4aee-00de-08dd9e0300b7
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?GRI1HM2m2mECCjNP3ayBq+EciSk/RIo3hRRhoqdmvf1H28VAq8xFfwTFE8xU?=
 =?us-ascii?Q?IAQUCWiVvEv0bKDLwnl649Hbo1e4ub4LQDyRD++DBUZCmXSiYmFxHphjA0mb?=
 =?us-ascii?Q?D8XPpinhq67cHOy8XGLcws26mvhg7Ts/8SDSJQepY7vfiHrE5G4IRYfslnkL?=
 =?us-ascii?Q?THvEDa0LvlQrwsJVsXNpiG39oaCodEq0EODzzktJsYTCPcm+nba5zfsA23VV?=
 =?us-ascii?Q?PN5tYGKt2t2HukxZWD+w5qMkGU9AYLey74OGdKgZ9TUFliCG/iGdTf2pJdcE?=
 =?us-ascii?Q?r7YpWQ/NJEbOoLk8wdjlENciBixAX2ChCA5Hvyy1SG3ndynnhLoZJrXZw3xW?=
 =?us-ascii?Q?bpyccwaPo8aHtzj7Pm5xJP0sQMhI87XRV4uW/kKbCfQKOi+uZ1fqV+u/oCpW?=
 =?us-ascii?Q?tZ5RiAwg1k+w6iBr+cmzV2LY4fO/d5q0tUTvqZJfEFoD2xnKLNJfc2Rt4e9V?=
 =?us-ascii?Q?mZzvb7MlqjRPlbuOIJEix75ef960dsDCtcBaTxeEIlOM/ndoUwMFjPwJku12?=
 =?us-ascii?Q?7OcuG3boLinAgfsugDU9vwLoJ/qNFlQv6/CD7rKXiloSzuGDX41+TlZfKT/1?=
 =?us-ascii?Q?GXmBy9710uyiw4cLOTNWlLH2nAcGXxnECeI0kovM2jDdlKgfe2t2RLDfZReP?=
 =?us-ascii?Q?IkvosjsuGkzckDPnDLeUluUerTxVHXYW5QoKwfxjVHnjF7iOsvhMzzDiTSDX?=
 =?us-ascii?Q?3DAQvbXXrTNIhIcq7FnpImWLG6TLVpt2sanp1zPAJE41ZKjmVAlA+XyJkIn2?=
 =?us-ascii?Q?Yq72+a+++F7BYx4BT9X1fzb/5FtTNSXU1lIB1AekJMDxgou35SgpdfwdBSas?=
 =?us-ascii?Q?1NAIYyeJ3WRkI6KLT0ZhkwBynKRfgfAt90TxqhX3RXUFR35X2BeCbtVpM9Ys?=
 =?us-ascii?Q?276C4gM6ahLYtu9io8ezo0V8pxRoPoIZJA0YnuY18WcWO3QQc20ZmDeA44hj?=
 =?us-ascii?Q?hhMws2lLKCPBlUDYi+eSfZF6ygMhKNOHzLadubMj00K5jrtSnXOGYwAQuqTp?=
 =?us-ascii?Q?37ahio5SxA1A1zuAW7m6BpionGxPh5G7L36YQoAt0/0ZUVKdl5I47xeaLSao?=
 =?us-ascii?Q?Bacv74cp7geeedzwDR1If+1Dmt7R/vxhTB+B5LRZP2caUoVmMIF4lE279F9K?=
 =?us-ascii?Q?btSrq8KClWTe4sVoj35VLxeBpx44OM+oK50WneqJe1QBB4id0qb0R6/+Gc7+?=
 =?us-ascii?Q?SyLIXhc8/X6oWGDxVTs76VDNKNGvHy/edD2JNafRA/ODKKN77P0sAUCrEDqN?=
 =?us-ascii?Q?9tOhvDoJlk143bRwkGNPKIzhlILacffiPfm69eas2DvuYjaldQBn2CjKUizf?=
 =?us-ascii?Q?SCNE0t9u8yYV51mH99PYaaytLFY0l0bFZHKeJn5/pX8wtZ9UgONlqw9prYk0?=
 =?us-ascii?Q?4Mj6j9+SGbeg0aFP0DBCeBRxyqLz152OQjeG9lq7onB48i8vDS/CxuH8QMCi?=
 =?us-ascii?Q?yKHWsaq7nshrMKyTYWrcAe4V2gdUG3pgJE+9v5OIGxpmju/x1iztXg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rX/QzUEv23QJSs95U2y/q8uwJql4IFu9yzx/3KLu22/izxo03lyerpA4FSvM?=
 =?us-ascii?Q?U+ZX3GHlr1e+URb2C5VbU72DWEZ3KfLwAojRQbiRKx7q5OoDWoa+dtOVbloN?=
 =?us-ascii?Q?O58El3lWa3iQx09vqBuy/csmppdtUGajZTgRYp0jFhjbim1hPuVYB20ekNPY?=
 =?us-ascii?Q?z0lp4KyQeue1sWQKo8GTJIL0N4UnEO/mLvgivG1Q5+DTrYMn4LpgQi8bmZqt?=
 =?us-ascii?Q?n5wWbSiXiDy7ww/epXGl9SPYsNSQT8ZKUudB3ouiYLbWpc6RU47bwQS9YgVd?=
 =?us-ascii?Q?c/GrPymRM8jbsUbnz9iJpBz489Kcee7zhOe/+XPxsDugGU6oabO6Tc9zhiIH?=
 =?us-ascii?Q?BEcLQh5qY/92AeN8sAw3y6xrifeCbhjCQwWUKYB64BZL2uj1gInL/d+lAhOX?=
 =?us-ascii?Q?Jf0GMf2UY6p0VzNflReKq15AbV2JoFe9aYtgJnB0Wcnz0/ficZGSkhJG4HkJ?=
 =?us-ascii?Q?RdhvfFV7lZRk1KIo+LP0fQzleg52uxF9wkKIjtdL6VWYBUBorKV0ngPSOTY9?=
 =?us-ascii?Q?HKjUdZBTHe2UBhRh5KhU7WxjqUHDaAbjAARO0WYUpEJfRN2jcaOfgUUauh/J?=
 =?us-ascii?Q?JBe4N/oUPKFpQsMACr36JqNFu/tj3YqbGKtg1fIEBkcXfEncS5liV6qetH0K?=
 =?us-ascii?Q?QT+FOn7u1H2gWmqpvH7C2AMNYozOMfY32hSoJ/TaQzAuvmzNnpCODDKrIPRQ?=
 =?us-ascii?Q?VISOg2RW0JfropdkQrmg4FFKoyhteSH4sQisDBCGVRpECuPSUOljJMh+7xZS?=
 =?us-ascii?Q?eHpYtZ0UnrHCmbKI+7ahA9vtN7Xs3fsN9aHYpdS4wxEP4t5/6XV5d17wS6Pv?=
 =?us-ascii?Q?RpBaDfGkRqDQtvDuBlG+VliGorpxniidq/QYLtSFjdnkJqGgxuLHoNr0kLyB?=
 =?us-ascii?Q?T9zRNhNE7bE8tpEaCoL8jUQVJLKpeZ/kCQF8tzqqRLzKPeFoHcZgnUnJChSp?=
 =?us-ascii?Q?/OuwVFTyMcPaXOxRS26JD8HtDBjFCPWFyqqTMfxlEhP2WHah1zOooBJ8iOyL?=
 =?us-ascii?Q?DVfrXpNebfNRbjBNhmSTkar+HNKKRpluhOaA0dFE/3I5gKhLbqmAR9+1VwCd?=
 =?us-ascii?Q?V0oYsrNUmwT5KjOfnh4We2QXqle1y1bDyiw2n/ibzpWYw3rC1nLQAj8xLq7h?=
 =?us-ascii?Q?OyuYVXA+OhIk0LLTyHFpgNlYW80QLP05rgXWP4F6f7B9LGWVF14aOKLL/ao/?=
 =?us-ascii?Q?cjL0NpcJvIP44RLl889xTbE2dbcmA0yB2f1bGWuW4eHut/uqj33UYV/yKs2p?=
 =?us-ascii?Q?w8JEr9kXHO12M4zSO0ZSUYMZWJlHGOOvIIvbAjMj+2Lkd7WmkAXjtnZm0jyP?=
 =?us-ascii?Q?n7aLd0R4MnQ4HouPU2C5dCdRm7XPyWF5tegiweKS54juNv5AsMUHtIqqE3Wn?=
 =?us-ascii?Q?XDiCzTNAOi/L/nJqA1DN+xzxF9XZPSry0JvocP7NoYo5mEnAmmyy97qeg6Wo?=
 =?us-ascii?Q?siQA86vy1Yo15ipwtclY2FPA1VZ/wmwr3vBR+ymR8tsyORafbd4if4be9nLi?=
 =?us-ascii?Q?upMhXThJ8xIUAdaBdnNUjPbgi759ZLmkdEJAZY064R6ph4yuu3z6g46d01o6?=
 =?us-ascii?Q?2wKZPwDmO8d/5OBpQ/k=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8bf8b8a-c529-4aee-00de-08dd9e0300b7
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2025 16:16:29.2673
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6VOt0Jhg+wxLWs09Oc+QhPr2HuyG/VklgfyHjOgYGD5WuRFL9fMeaYItWdKw7IRuK5TS+E8n1Bw/wzm+t6EmLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7347
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_091634_033456_08AF6753 
X-CRM114-Status: GOOD (  15.36  )
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

On Wed, May 28, 2025 at 07:17:51PM +0800, Meng Li wrote:
> When verifying watchdog feature on NXP ls1046ardb board,
> it doesn't work. Because the big-endian is deleted by accident,
> add it back.
>
> Fixes: 7c8ffc5555cb ("arm64: dts: layerscape: remove big-endian for mmc nodes")

Sorry, forget previous comments. You are right. It is accident remove big-endian
at watchdog@2ad0000.

7c8ffc5555cb should only remove big-endina for mmc nodes.

Reviewed-by: Frank Li <Frank.Li@nxp.com>


> Cc: stable@vger.kernel.org
> Signed-off-by: Meng Li <Meng.Li@windriver.com>
> ---
>  arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
> index 4d75bff0d548..e15ec2e1cb04 100644
> --- a/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
> +++ b/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
> @@ -753,6 +753,7 @@ wdog0: watchdog@2ad0000 {
>  			interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
>  			clocks = <&clockgen QORIQ_CLK_PLATFORM_PLL
>  					    QORIQ_CLK_PLL_DIV(2)>;
> +			big-endian;
>  		};
>
>  		edma0: dma-controller@2c00000 {
> --
> 2.34.1
>

