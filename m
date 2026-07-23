Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9331DC531F7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 15:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Su8mcUR9YFhnTPYPiJSIa/mrW/RVdPNcEzgnPNm8aCU=; b=filkPfIPzmoMRU/xjxbWkgKjfM
	PzIKYjkLRNKXaXyCGS9vApiB2/TRKQaFGvwexiU/egGdZdqMWdEAbkm8rzGaUCzGv3Q19BXR5yguJ
	MV8ATxNQJCmcJo/y7T8Wo5U8aF3HmdfueEIpDozpbmq9iQ5Rl+V7RtC+lTVbMf9Jg5XLCUh28Bknp
	Ysz0DGwAYkFUmswwKgcavE2ADU4di3uhbibbq2wAYY3FCfLjoQd5JmxIzo/0/6/8RCsrKLIkzGbRC
	D/mdI9/d/UqheCdvVDYkX31j0CS1DGDHWSzgn3IF/o/ojh/bFZ7NKWHTvFWtx8u06agRiHnPMbEcl
	5ne80qDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmuvF-0000000EYKk-3rLk;
	Thu, 23 Jul 2026 15:01:17 +0000
Received: from mail-northeuropeazon11011045.outbound.protection.outlook.com ([52.101.65.45] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmuvD-0000000EYK4-1ev7;
	Thu, 23 Jul 2026 15:01:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Tnq3a2JCPS63oW+hvR5LA0/bvgXBEAYDcsVKkAq0z+CjLR81HG32xKMv8VhGiY1zGnpRiGzQWEKi8aUK8oJ++zkdj7C37GIwpLY3f96gAauFW8YtzIr0lFG2qGp4Yrx3PlGLN6IJa01QYDzkeNzg/BfK9hnkCmClCp8CslL+E0geSSP0a9CgHiwmDOgAvpq67Qrp3edm8b9CmokTZyj88F8QgGFUh+JX2RhkM04WpjhsLnCS1Sb/DbXNF8CpWxPamW2x/+sdAMKce/8/zoneVpYZjYKhmpSWfN2VOwbYtYqgww4NShaup1uFPdby2gMEja60y3rsnj7yQRnvAeWBrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Su8mcUR9YFhnTPYPiJSIa/mrW/RVdPNcEzgnPNm8aCU=;
 b=iujKGYxDCLz529LUzzFjxrFBrkATXYhgTgBHPgIqMHqotJOE5PYo52GHnfxZgPV9wDGT2zAki1Azp2bJ9O3vNG+IWtI9Hx6/02EBvXiwm7/eZIgq4VQ0tYoobWNvH2hhckF/VbNct02ULv0ENW03pBqIyRdw0Znyve5/TXglhv0Y+BM4/+shs80gmRubSNPNgKKobmu1obXATxccEM8uke4FmSJJIUc1Dnn9MaID9CGQJGB31DmUXrCdmEeEFo7CJZAiveAQwVH0SxOVKVrxKpA/hfljfAe452VwOe6jHut5SGKAuHXOref5aGhix/lUzBiCUclzrohdDQgrsvpZhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Su8mcUR9YFhnTPYPiJSIa/mrW/RVdPNcEzgnPNm8aCU=;
 b=TIzgtQKs0LkLsIRLcdYfAjkTjK3AH7Y/TrkJGKTiwJpYbIk52lJ35hIOarU7FHc9N9TW03iK+Z2oA98WSsiMoZzrCPwMRezSewc40iwON569XjnDTk8qPSS4CQ8TnqBRupOdgXWD16HtU14WhzXd1/v1BkgDSvk1pHT84yILJO90ytCFO8fmixyWNiek3sX4/GhXXBvkdZSkB0E4Ox5pnO4+qZxFCMlcAYKXd6NKkGcTVt2pxKM56XRHDGl4FKLveNX2iEnMHvCvUMHkrEggiARVz64sEgYUw5y1FWk6gSuIkgVIsY1umF4727WB7BVpEvNOEUlusScimMBF2LQICQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB6900.eurprd04.prod.outlook.com (2603:10a6:208:17d::10)
 by AM0PR04MB7011.eurprd04.prod.outlook.com (2603:10a6:208:193::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Thu, 23 Jul
 2026 15:01:10 +0000
Received: from AM0PR04MB6900.eurprd04.prod.outlook.com
 ([fe80::7fda:8431:ca1b:b023]) by AM0PR04MB6900.eurprd04.prod.outlook.com
 ([fe80::7fda:8431:ca1b:b023%5]) with mapi id 15.21.0245.010; Thu, 23 Jul 2026
 15:01:09 +0000
Date: Thu, 23 Jul 2026 18:01:05 +0300
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Vinod Koul <vkoul@kernel.org>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
	Ioana Ciornei <ioana.ciornei@nxp.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Tanjeff Moos <tanjeff.moos@westermo.com>,
	Michael Walle <mwalle@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Frank Li <Frank.Li@nxp.com>, linux-kernel@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 phy-next 0/9] RCW override for 10G Lynx dynamic
 protocol reconfiguration
Message-ID: <20260723150105.da2cqgtb7t5vw2d3@skbuf>
References: <20260721231603.67865-1-vladimir.oltean@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260721231603.67865-1-vladimir.oltean@nxp.com>
X-ClientProxiedBy: WA1P291CA0020.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::24) To AM0PR04MB6900.eurprd04.prod.outlook.com
 (2603:10a6:208:17d::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB6900:EE_|AM0PR04MB7011:EE_
X-MS-Office365-Filtering-Correlation-Id: a9c90f67-e9f9-4ac1-6150-08dee8cb3a64
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|1800799024|366016|7416014|376014|10070799003|23010399003|11063799006|10067099003|56012099006|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info: TUoR9Sjer26d2HB3+x+Dv4zOk0dZPP8MguT+nPSM1Faoz/4s+W98iKfE0Tnb9ho9FW9bN2einzEciZOElIREMTDQuyzJdP/vJ0J5N4w91Ryh1UmuH5rOpDK31G1h6bAY3+X8vRLDj3/6T+4jpqjtWGM7qV6bqup7NawMoBWsqyCcBrv6qSM5XvUnatkD2GhJ5MKuZ1zj/080PT4ha08BOn+JhzQED0r7pXZnmNKdQOA8n20LIwrNZCUoDla6AkHh5nqF3iZyDpIuYQ+dTkPAdhFw+uVfEfxJDI8Z7qm+/5NFm4tNNVwwr2jmt4Xz1YC6+isRydbpVTDEGq6UTFqa34EDLvyN9nqAmjT1Z2obYTS8P1wqsnWAr5DVWAstFo4+4CMXa1Ihax6QjB5tyIg+aS0SwtvD0VbyFnK9Q2iYJBVkVzAlNhov+y3yGiQQp4d+pOushvpPkOH0ClCfYHKIe1BPcboYnfTMkGamsi8ZWxFddl8XUeEb24k+nZkPB0F8OOUgG6NNO0+eHFJiqYSxkUQPiqaC4jW/GlQSbXcRdJKXP/t5WZYh5xsmlihAU6OtL4XE6dbTz7dZqocuD+f2a+2MHoW1c5z5AWv1+Ft93TCyKkxnufTXMz2yPVd9s0TgEB7wCKf78qi8SFcx6sydMuIg481pAMke/bAAe0uG/1Y=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB6900.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(366016)(7416014)(376014)(10070799003)(23010399003)(11063799006)(10067099003)(56012099006)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5zgYoT2K+4IswEkzDcL60ppXNn4eKvLQ5oGrVwLopS28cEclym83w8KMGtxE?=
 =?us-ascii?Q?bqW6zt7aBoKrjthCS/T6zCfp6+henwe8dcTiilb6mOzdXt+G5go6oKG++WRS?=
 =?us-ascii?Q?awxwstOmbdJQqqrS7UVYrhCGEw79SN+DAlNWXvFaK1EMGFCrMY8VsBgTE+Nk?=
 =?us-ascii?Q?uwo1jcT4CoEi2kfrx9Uz9WM3FG87UEJVdF4OY995gXaTZgxJ5A3GUViXyJ5H?=
 =?us-ascii?Q?jgypp4oVFpzG/5YtD3rvMUlHhwTv8Gn6uelJrtBNdaC2eKvKnhX9B305ps0N?=
 =?us-ascii?Q?1Rz30BD3tuFs7nQn8RSG/KVJbdA643JU36dIIp/1v4mDKdAuRm+7k9XpgHKZ?=
 =?us-ascii?Q?90rJoeAUhMGuxgn3oNPQ7NV4+TKF7XItHQsO4ew0QVf1pa5POJLx7sauDpiQ?=
 =?us-ascii?Q?cMQOV3mUR+Yw3egSxxlElp4rcHRRj6S0KJQ022Llpggu7U/lpmrnFeyfQ+or?=
 =?us-ascii?Q?obw0x+DwCxVNq4xM0jDzh3Ppi2Fx0MJ6qQRbaHtIDxgeJu9Lgxo7KwO21/YC?=
 =?us-ascii?Q?beB3jpMfn+HlOZ8BmStcXlerj+jf3MpAQgVeJyAOT+UpFTHnqbZOgf5ZiK+7?=
 =?us-ascii?Q?fDPFzTAnnAmNs5XkR+jNXl0Mq19sERcVPzwpLlTHF984QGlLzx9vlIcxqayu?=
 =?us-ascii?Q?yNmt+lfwILrJI2AiuMpVUkKBiuZ5urbE+19gIAQY615JE6U/GtlkqSdJYbyx?=
 =?us-ascii?Q?pBb3du8XhiHGbs+9nyodqMMiax9tBhfw7WGieaksMhd5ifd8tvEgt0QHNnb5?=
 =?us-ascii?Q?JroYcwsA5p9DhAqhvy047k5KUCXvY3nKi/r14cvfHbNOAycwcKBjwhIiBpH5?=
 =?us-ascii?Q?QUoVyKLHJwmGwtjvhfsAmYucDSMYLIs37cLLr2aQdO3phw6iZAJe+hXa38qR?=
 =?us-ascii?Q?+DOc3mvrcMskjxNGWYDf8VscYxaNvNmWeXl23Mg7JhFGli2Gf8QiVsYMqaS9?=
 =?us-ascii?Q?MOksu8GB/qG8d92J5bnf0Q41LMAXCIkx/ZO9o972aIFD3VqmrMaP30bylUer?=
 =?us-ascii?Q?l/NLbse/gN01U0qSjmtICOqoZzuHfZAqnmue5C+T/+Cv+Rxreg9W9mY+72EP?=
 =?us-ascii?Q?ZgPfDZPg2Ii+R+eQDWhq9zvSsQEVILUhoDeVMHN1ghD2gW02DhECmmSGKoOi?=
 =?us-ascii?Q?50+/zpjrkVYbmZZ53u3jp9PJj96NPxwxPcYpw108P+NPRE+URi9UiJALtTTY?=
 =?us-ascii?Q?x2ldvJT6QKnN5EBWwdP6CuDKE9ARiZ4esmUQDBXLj5Mn3PiEc1vFk63/ZlAb?=
 =?us-ascii?Q?DurgvzAUaC/J+09DWe2nUH8w//LffPw+jlvTglj27uU8aMNRlxsBiBk/gMuk?=
 =?us-ascii?Q?QK8QIa0DSQh7XGp6Qt5wSzBG3cySVsZQbyHPz3yFWGrLMauDCJ3oQuWabjRW?=
 =?us-ascii?Q?nk4t1IgyR/93PfQIzm7xq+P8sDBV7bwldmKq/ko0aad/kU1u7Oh6278GHSnx?=
 =?us-ascii?Q?KCAsHoqV+TfKTrazNOU0wmLm0IoOJyg9iN1KYcAinwQXFQzbOM8Q/0diNG0A?=
 =?us-ascii?Q?3UkJAGvibtTGmsvFJZqgsfpq5b07j5XOFjF9B7bsEfCP0Zl5lwdQvW5OF1pU?=
 =?us-ascii?Q?X0Xb2SkEKExoM9/VJ1bSNogKgA+ldI+Xxh6jL9toe1vfT/hv7bPSmpsCv4qf?=
 =?us-ascii?Q?DdJtqaq48n0WbgtLsqYTE2d/MldKfEugsy46mHY/9UPvM+fdsrvjNi6bsz90?=
 =?us-ascii?Q?i64bXvQfQoqdpne969lsTCtnbqEZkRP0hQonHOR2ND2p9WSVeBHDLxtQx6xg?=
 =?us-ascii?Q?5Y4+SIyGOPffBZlqwPl2LlmrppxjnGtcxwrHb3X2Cf4tHxTk1ZrgtjZKKMoh?=
X-MS-Exchange-AntiSpam-MessageData-1: GYl9YVPciE/VPXuv0qA1uQz4zlqKgCFOpTQ=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9c90f67-e9f9-4ac1-6150-08dee8cb3a64
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB6900.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 15:01:09.1176
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7if4pV/YghCoEv97r3NyphLfngKVS1mNg/E14U1M/mrSwf1oxtjgrD/j3gtp9ET4sWrTlzKEIjDV1Jwcn78MMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7011
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_080115_458414_5E90C2F0 
X-CRM114-Status: GOOD (  11.54  )
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

On Wed, Jul 22, 2026 at 02:15:54AM +0300, Vladimir Oltean wrote:
> Ioana Ciornei (4):
>   soc: fsl: guts: use a macro to encode the DCFG CCSR space
>   soc: fsl: guts: add a global structure to hold state
>   soc: fsl: guts: add a central fsl_guts_read() function
>   soc: fsl: guts: make it easier to determine on which SoC we are
>     running
> 
> Vladimir Oltean (5):
>   soc: fsl: guts: perform fsl_guts_init() error teardown in reverse
>     order of setup
>   soc: fsl: guts: make fsl_soc_data available after fsl_guts_init()
>   dt-bindings: fsl: layerscape-dcfg: define DCFG_DCSR region
>   soc: fsl: guts: implement the RCW override procedure
>   phy: lynx-10g: use RCW override procedure for dynamic protocol change

Even though I intended these changes for linux-phy (they are also
build-tested there), I'm fine either with these changes taken through
Vinod's tree with Christophe's ACK for patches 1-8, or through
Christophe's tree with Vinod's ACK for patch 9, really.

I see on Patchwork there's a minor issue in the commit message of patch 3/9:
https://patchwork.kernel.org/project/linux-phy/patch/20260721231603.67865-4-vladimir.oltean@nxp.com/
"WARNING: 'struture' may be misspelled - perhaps 'structure'?"

Could this be fixed up while applying, if there is no other feedback?

