Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F504C98304
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 20:17:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C1YzIONclGffYiuKAtKSov4mynmH/WVEWrAQXrYls7g=; b=Ihr/HQL0+RhI9STqJ8atvSlWR0
	Ju4m+kavj5Vp+sKjDL5/imBo5Ryrenn/XH0NAp6SgU1FrWPNS7tx8jY3Wu8f3SXupi94fJGKLN3zi
	1px/vUj3VHKV3o9Lu/YhLl34PVGL8HLZjCxi78Bu7GtptmPINL6tE1HsLO+hpBvxNASHkX8/qJEfg
	Ugbzs4RyT0nSf/qzvnRKnnlFgMQewLWLL7XzR4PuX+Gw0LYogMqxkvGqnR+BtONtpZ6QLPrKw2e0k
	0Z/MbeJ6DfOsMgm5lOb6/9nmruHzMZwK49LJ5UBoWfU+uiV7NUoij+8jdCYiK4ot38TPz9XEApD9w
	l28G9IMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9TOe-00000009R4m-1g1f;
	Wed, 23 Sep 2026 20:16:52 +0000
Received: from mail-westeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c201::1] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9TOc-00000009R4J-0uvm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 20:16:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q8vxcB5/K+zcC7gP6b5YfHBJmbwDnGH1WY89vOic+qN2UkD9lJBqXpr9PHA0k9EOjFHfBtD4iPdl7U5veQGwkaKDVWglW4xW2yWRG/yO7kxBejwo7omNtnqT9JZ3Hk8XCenh1N4jKJLBq2DkHRbbd3XQhjspIBPWJYybSQCbRlt7P6zClckiB68ZuR48HH6a2X6YAX49g54ZAOH4H5H4OAGExNjmsw/L3xWSZ1haO04aMezAcgeayAw6VAI6o0Ccr9Z7GI5fZSCi0R14AdWAK4zPSksNRlIN4fPS1C0nBwsmbE/LLBlZMIDgyfYDklDM2j92VcB35sufoSrpiSqZ8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C1YzIONclGffYiuKAtKSov4mynmH/WVEWrAQXrYls7g=;
 b=zTioLhCqQJl6AFMJ6ntWacuD8ljg/2D1ekDS53iJsUOALMiT7ziekmackKqS8WxLe3EAjegYcZX3h1UFtFYnD2VFnecsQuYXYU82AzRBHxNR9iE+4Hp8bSKt2SbfvRUY+YAm1kwo4E8ERq1b1BsRtOMnhYolB4Mgz/svRgfTpS8xjH4opLvj213ragwT1buhICOeM2dQKElb612hcYFv2sj/wDjaY/S/7U6GGNzE/EeS/SgjIvomDftRWu+XlG+ulg4nnzpx3pnLc/TNAK16raO1ucsh7IdwaBOv0ZCYI8RRjVvTjCW+6eL/5MhEfS8sNOjHg/3XdSwpWN7tIeHMPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C1YzIONclGffYiuKAtKSov4mynmH/WVEWrAQXrYls7g=;
 b=HuCP2dCkPLBruKOh1FI2uQcGSD7LSDjiHyxhb3Q8uaU+5br2jg6kElQDmGspWqHCD0OLxNnBjh2GgTV84+dIwal1fxDCAsg7i1DH4E2ngqCAqP4ZtuJ5C4OTMC6B0ejRNVJIqaULG7bmFhZwBDG0gulxa1F+WvcLK155/zDn622rVhafPEvttQT/HTQvOs6HpqiR9PR8ABrGd6zXPqltc2tP1FnR6xNL4VZWfy3NUH387NHWlezBIfVYmKPUFqW47Tr+Q7WkO8BPoYU34Ro/d/rci5fwnBXYaaNctmyb5xC5gUA6GGPlz1u3FCDWVHGR3DkufBKIJFvhUjbqXjrEtw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PAXPR04MB8510.eurprd04.prod.outlook.com (2603:10a6:102:211::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Wed, 23 Sep
 2026 20:16:43 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0428.015; Wed, 23 Sep 2026
 20:16:43 +0000
Date: Wed, 23 Sep 2026 16:16:34 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 0/7] arm64: dts: freescale: Add Toradex Lino and OSM
 iMX91/iMX93
Message-ID: <arQzon7UJ8tA6L8u@lizhi-Precision-Tower-5810>
References: <20260911091952.96233-1-francesco@dolcini.it>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911091952.96233-1-francesco@dolcini.it>
X-ClientProxiedBy: PH7P220CA0087.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:32c::35) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PAXPR04MB8510:EE_
X-MS-Office365-Filtering-Correlation-Id: 94e8f51b-1018-478a-da52-08df19af9578
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016|23010399003|19092799006|22082099003|18002099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info: 61fAPIGXisDUITkLBoj/KsXHygXy5EsCZQUUuNgTJCJaHvBw0yonfRgl5CEj90pFcr3fKmRBulym75RPc9w9vxACr3Rk4eElsdt4WkJq8NkRgo2H7/4kpzR0M7sOfP6Zd95BxsbnPshGpi6zwqUQxAdQJuZjsu6p3sY+XXkKBGu/VGjpnyIwB1daHllJlaYnmTeG1kdb/0QJ5wxbX92Nmjn6Ug3qvSSXxynAKLybNwOUIJIrAWsx9xzwG/Sz4l6JDzXLV7xGhTFmEolh67KIdQJAKmvnHpeuCc20xfsx85yw75KUG2twpiXXovrPPjsRj9DOGywrP0U8kzqdxAHWo82bnt8YO2BzHFk7ETKG2dRAEjdELl38jgBzOlhxgcuHb9G3fcGeAFS9O9KQO9MtRO5SpxkOLLtS8XSvBOA7L4xamlsFBoNRpLrjkPAK1ywr4mOwUs3whGDkwTROiZ5Mq7mlbHciJNJB7ZQ0UauNTGx24k8TIzxNTwiuju+ZhAUMr9OYF8AKc2RAhwOfVhf5BjSBoxwwvZl+eK671DB3NEq+r5fV7cpIrNcSWN+9cKNYXezkTNUdMxhJjCRoRPVqtW75FV5VxT2XpSBq6j1n0BI69dTXkKWAc7v169a4FnslVEjfpg4qHyQK0SefHJyDCabCLPWK2mLgW35O2VIyMuU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(23010399003)(19092799006)(22082099003)(18002099003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GbECbL1R1lp0p4MTYsm2uIAJV8vAGeDKzTohyiN9e/uxBPp6evrmJ1cFgbn1?=
 =?us-ascii?Q?hECVqYLGPNSZj4/E8N/efenpH6SbMjoSY/90CjXj0SZ6HUAmYpQCIrsNG0W/?=
 =?us-ascii?Q?jGfPoYBhBhih8XgjC8dnXaPoNiF0zpT4YXiBZIK3und54G2sMJkwn1Wq3XEM?=
 =?us-ascii?Q?f+Xfogk16sCrVQeAl8/1oGUTA+FNmdPaJ6gz8I0Mkga5H7w+Witd3pv1myGW?=
 =?us-ascii?Q?llZSc6ccC6pXJma7l3zDD/4wMkDHehaMiexarF90jVOIb5R0WtXni6v/6R8b?=
 =?us-ascii?Q?qN3OA+/la5w1UkqpMA6PN8A7d9CdI0hHlxt2AVlSmGlMYGprCXQv9gqd7QyK?=
 =?us-ascii?Q?rN8oFluE86kAuHxMOi86okeHwFZIsw+xFq+Fbbd9Ghp+Pj4EQKHoL7IiR4z3?=
 =?us-ascii?Q?b8FRZHWHn7KD/kGoFCEjTCBiNUNulup9VBys6xawk+e0XPR12B0DGeKKvZeU?=
 =?us-ascii?Q?C6vCGXRxpI8wsuCHIrhMens8Lqx52hG156uc8A6Fmy85UJpva6N0/sIgpFKm?=
 =?us-ascii?Q?LHVKw/bEfejn7xH1rcRh+4r6RmB8CLUxJ2+Dp8bJ/kns+VJPu23kEIx0c5fr?=
 =?us-ascii?Q?jcPUE2Tqgk8pT1oy4CVoZZje0HcmuprBdsrMvwE2Po5b6M/logaYYuhMD21j?=
 =?us-ascii?Q?xwRSSk83r8UUgKrJP+2sFGftibq8vt6zvvMH3kfEIETmvX8EKOidtQx1ehBJ?=
 =?us-ascii?Q?L7O7XFHGjjBKgcmZz/4e4GEw+SSgV2uCvVe4Y2lX38+ZO5TtDLwPJEVM0W6Y?=
 =?us-ascii?Q?jQAT1GOxosCAV5930j01lMJcFruZ10PQ5bfDWH1Jmxzs8XXqIIfd9kAlB8Ft?=
 =?us-ascii?Q?B8/bK1LeZUv3ptHkceGDqYGQsI5FPIB8Q+WPgz7AhlBomMcA2Pim6o6H+9Oa?=
 =?us-ascii?Q?GefBQ5brSpEQNLch8DWTgaayWsWQkgBeuQfdfnN7wxz2haXeY0in2GjXvRNw?=
 =?us-ascii?Q?8oLa1ESfofGtH05ZGUGczBfD6/isvbcOsUsfMSREoDzehkw8e+iKUiv9SSF4?=
 =?us-ascii?Q?LW5pNw/vi8v3SEL5m0gfXsAINNSXNwEZlBiL3A2bpGOpaiG1wa1ZtoX4Rauy?=
 =?us-ascii?Q?cJFFzAhZxc7WZ0T/boxxDEtTIKn4z4h8tTBEmKLDU33/dKE5A8lgRxnTklo7?=
 =?us-ascii?Q?RFtV01oz8DqGvhxzOIDiIDrZZVD7XWKoAjmuKYKs9yFUol/yevugSewDjqL0?=
 =?us-ascii?Q?z1FrIeNxBb4OgniuKHez60ZXxn4BVQRVamCg87874CjmAomtdl0FS0jIgzEd?=
 =?us-ascii?Q?BpwHzFWNOcwxCDsy2mBSSnjub0AK5BTUQWOA6NEgiNhWarwGP+DIN1s4zOzC?=
 =?us-ascii?Q?iwRYuciFu8MEEE1WwwTx6UvFzNyxYrURlMEraOY6O2eKcSdbfqsHNhse8oHS?=
 =?us-ascii?Q?LoHKvtNe7JtowTer6coXE5bfJreCoohE5EuvsrkD2+yIgufcvww9DO9i8Wqx?=
 =?us-ascii?Q?WivMCgVmbftS2xyWu4Tz3+rIq+u8V6BvAte//1OIFDQZHAH3r6U68cjINlZw?=
 =?us-ascii?Q?pMFqGDihSELZ/bDoks1g2EcVZQoB7BZv8BRPJ+ZjqT/RFs3ue/78irvRwoTu?=
 =?us-ascii?Q?RmpVegmqyMMYlrhkMTudOcH54BaGzPMAuYWTfe8OqnWmN29Zw1WzF1fUdEzK?=
 =?us-ascii?Q?czjgh8J9RtdNgVbRMQAZCHSvJeK/aMcyp35iGtqXIEZbpddAsUgufFqK83M9?=
 =?us-ascii?Q?gMR1sX9rNgXYi9tdFacabOJ9ebFFtIs05f+gGFYi6jyQgFYjkRQnS1eDA2CA?=
 =?us-ascii?Q?gk78ELHukKIQFUyjf3cWTruqIuCzBIV7IxrnmN8A5bM01aVHsZS7?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94e8f51b-1018-478a-da52-08df19af9578
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 20:16:42.9121
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7O1TW6r/eeGoTKIqYkhcFjO+uubFTNww14yDU5j9YU4IUzOIoabfMxu8Aln+kaWe00xuPGZojL6V+UYhEz5smJWrg3zcz6Lm5rWABczFOVWs2ZyF2fbaa4R3XQnSQ2Ca
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8510
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_131650_281825_E8ED22EB 
X-CRM114-Status: GOOD (  16.26  )
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

On Fri, Sep 11, 2026 at 11:19:43AM +0200, Francesco Dolcini wrote:
> From: Francesco Dolcini <francesco.dolcini@toradex.com>
>
> Add Device Tree support for the Toradex Lino and OSM SoM families,
> based on the NXP i.MX91 and i.MX93 SoCs.
>
> Both families are available with either i.MX91 or i.MX93 on the same
> PCB. Since the two SoCs are pin compatible, common Device Tree files
> are used to share the hardware description between the two variants.
>
> For the Lino family, add support for the Lino-Verdin Adapter, which
> allows Lino modules to be used with Verdin-compatible carrier boards.
> This series supports the Verdin Development Board and Dahlia carrier
> board.
>
> For the OSM family, add support for the OSM Development Board.

Please rebase.

Frank
>
> v2:
>  - add acked-by
>  - removed #.*cells properties that are already set in the soc dtsi
> v1: https://lore.kernel.org/all/20260910101616.139270-1-francesco@dolcini.it/
>
> Francesco Dolcini (7):
>   dt-bindings: arm: fsl: Add Lino iMX91/iMX93
>   dt-bindings: arm: fsl: Add Toradex OSM iMX91/iMX93
>   arm64: dts: freescale: Add Lino iMX93
>   arm64: dts: freescale: imx93-lino: Add dahlia
>   arm64: dts: freescale: Add Lino iMX91
>   arm64: dts: freescale: Add Toradex OSM iMX93
>   arm64: dts: freescale: Add Toradex OSM iMX91
>
>  .../devicetree/bindings/arm/fsl.yaml          |  30 +
>  arch/arm64/boot/dts/freescale/Makefile        |   8 +
>  .../freescale/imx91-lino-verdin-dahlia.dts    |  24 +
>  .../dts/freescale/imx91-lino-verdin-dev.dts   |  24 +
>  arch/arm64/boot/dts/freescale/imx91-lino.dtsi | 305 ++++++++++
>  .../dts/freescale/imx91-toradex-osm-dev.dts   |  22 +
>  .../boot/dts/freescale/imx91-toradex-osm.dtsi | 303 ++++++++++
>  .../freescale/imx93-imx91-lino-common.dtsi    | 536 ++++++++++++++++++
>  .../imx93-imx91-lino-verdin-common.dtsi       | 175 ++++++
>  ...imx93-imx91-lino-verdin-dahlia-common.dtsi | 198 +++++++
>  .../imx93-imx91-lino-verdin-dev-common.dtsi   | 216 +++++++
>  .../imx93-imx91-toradex-osm-common.dtsi       | 526 +++++++++++++++++
>  .../imx93-imx91-toradex-osm-dev-common.dtsi   | 324 +++++++++++
>  .../freescale/imx93-lino-verdin-dahlia.dts    |  24 +
>  .../dts/freescale/imx93-lino-verdin-dev.dts   |  24 +
>  arch/arm64/boot/dts/freescale/imx93-lino.dtsi | 359 ++++++++++++
>  .../dts/freescale/imx93-toradex-osm-dev.dts   |  22 +
>  .../boot/dts/freescale/imx93-toradex-osm.dtsi | 357 ++++++++++++
>  18 files changed, 3477 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/freescale/imx91-lino-verdin-dahlia.dts
>  create mode 100644 arch/arm64/boot/dts/freescale/imx91-lino-verdin-dev.dts
>  create mode 100644 arch/arm64/boot/dts/freescale/imx91-lino.dtsi
>  create mode 100644 arch/arm64/boot/dts/freescale/imx91-toradex-osm-dev.dts
>  create mode 100644 arch/arm64/boot/dts/freescale/imx91-toradex-osm.dtsi
>  create mode 100644 arch/arm64/boot/dts/freescale/imx93-imx91-lino-common.dtsi
>  create mode 100644 arch/arm64/boot/dts/freescale/imx93-imx91-lino-verdin-common.dtsi
>  create mode 100644 arch/arm64/boot/dts/freescale/imx93-imx91-lino-verdin-dahlia-common.dtsi
>  create mode 100644 arch/arm64/boot/dts/freescale/imx93-imx91-lino-verdin-dev-common.dtsi
>  create mode 100644 arch/arm64/boot/dts/freescale/imx93-imx91-toradex-osm-common.dtsi
>  create mode 100644 arch/arm64/boot/dts/freescale/imx93-imx91-toradex-osm-dev-common.dtsi
>  create mode 100644 arch/arm64/boot/dts/freescale/imx93-lino-verdin-dahlia.dts
>  create mode 100644 arch/arm64/boot/dts/freescale/imx93-lino-verdin-dev.dts
>  create mode 100644 arch/arm64/boot/dts/freescale/imx93-lino.dtsi
>  create mode 100644 arch/arm64/boot/dts/freescale/imx93-toradex-osm-dev.dts
>  create mode 100644 arch/arm64/boot/dts/freescale/imx93-toradex-osm.dtsi
>
> --
> 2.47.3
>

