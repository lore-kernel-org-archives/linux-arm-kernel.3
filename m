Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDCFBC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 12:33:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5nFsbn+4co8jlRdot741K0pOyIQJYK89aMxELhjs1mw=; b=ncEOg134DkHmrOJfEKn2Mw47B9
	Z9W0MpTmRSox9ubSrP4Af37oEFqCO0NVugHm3tZtFBbRm5uM0XCKGWUX8/EUQXWEgKlHkyy8bXv/+
	bkcefDxXUW8wvWY7/6v1Zlz2UbboNkzV8mxOnIVBmzqbrNbJmkIfqC39GtQ27ZLH2WIfxE56Qc7HN
	p1FnGgTSYDZTdGAYxgyz9Yq2tZbAqhrWx94O2zLxfmZdAo8Ox/5f9S9DSlVehHWGYKNiVXpBIpU02
	pLiSAmSW/0pFSDwhoukm+LEyVbSZyO1XmCH4flOg9vckn2Lluufj3+z0jn3PvYkg3diQ0uH+8raNa
	BBYJsqwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgiVY-0000000CTmF-0q4o;
	Mon, 06 Jul 2026 12:33:08 +0000
Received: from mail-francesouthazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c207::3] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgiVW-0000000CTlp-1Jco
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 12:33:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YAWRrzXUBMwcHNAqq5IGHGt1A3vdPP+Wg8IyuK9Ua2Dk8xeflfnHPB0AVqgBSobq0V9tHsbW20XiXdpeccCJx7oBU5r1JQbg/6YIzHWakWPNN+JuF2iAIvvtd3zGpZjUVa7hFE9RxoQM+bGzJPHxdQwsDMV8XKRA1IpydkkkdWopEUv8W+6yWwhILbMoD8jbqhY6vnMjzgSb9gWp8Vuy+Fgi7uj/spLnTwxg4hDkBhAHxqJNDotgNOmBjOAvmGCNLVhIuyvDLeNhSclvLGKziQ25WXagkdFuzJgtsPZppcGdGrkbv2d37hMRjc+Xq22mhlGf7pRzr3AhUgVSWFOZrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5nFsbn+4co8jlRdot741K0pOyIQJYK89aMxELhjs1mw=;
 b=KlLJeNJisEtEVSKQN/zyL4IeOltca/9FEFuQzMvgH+9KGRRW8DLq6NovxymhwOQ7KX/DQwluxQ5d4e1FLUJKkRHpBhrPj8VPKP35KmOoHlK41ki7ANxvXwKFJpNmlcXXl0veiuspRynsWhi6usEjHGykupXGCBesERkRIEnpkqvkY/vjmgGXYFcJW2U1lhBDDOkYzehy67xOhMeT+SKfeGpp7UyqkAMNFgZ5lGk0TzwK2WNK9YDOfgitV/prfaKal/gdX8lUQ+uHK2yb9aLrzaG4jtvmPGlsRXmAhAeqhAiVfiZrpTavwt+4luB4oxV4eqLPLdNERCR5aF2Y8QJIzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5nFsbn+4co8jlRdot741K0pOyIQJYK89aMxELhjs1mw=;
 b=uIF0lHCR9O0rrFFQvgR2CMY33rj+zcat6wAEU/q74Qz+jTeexgaottnL70kyUa4lTE3r460v4TAdhonMPAAbgfyx+w91urzlSLXsdEZfx6cbBRwa3Q4Rhmz4P84VhWpcK2kNstN7o6mswPJ3XW3ECBLzN4ekk2C32FlsVyaWZBTNBba9rl0pj7g/hCD7g6OR2YOeDFdBoXRgeaNta8RvUMXdYjEe6bvP5pfOrsEDoeTbn9LFhEs0KSK2OPg+Wvup3LruSsToxmyip7nrlAyMHPRe0kgeUjizkpHTimTn2fvlhb0WOGIKD6WU23krDcsRs4LAjXEd5CTRZOybvMBwdg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by PA1PR04MB10700.eurprd04.prod.outlook.com (2603:10a6:102:48e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Mon, 6 Jul 2026
 12:32:59 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%3]) with mapi id 15.21.0181.012; Mon, 6 Jul 2026
 12:32:59 +0000
Date: Mon, 6 Jul 2026 20:36:26 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v2 11/15] arm64: dts: imx8mn-var-som-symphony: Enable I2C4
Message-ID: <akuhStAKJHcZ37ag@shlinux89>
References: <cover.1783330236.git.stefano.r@variscite.com>
 <94b2e50c4f11be384161eb8fdfc82a5c1d7ebc4c.1783330236.git.stefano.r@variscite.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <94b2e50c4f11be384161eb8fdfc82a5c1d7ebc4c.1783330236.git.stefano.r@variscite.com>
X-ClientProxiedBy: SI2PR02CA0050.apcprd02.prod.outlook.com
 (2603:1096:4:196::11) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|PA1PR04MB10700:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b975a2f-8b79-41df-880d-08dedb5ab67d
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|23010399003|19092799006|1800799024|376014|6133799003|18002099003|22082099003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info: ykXAEc+Cutn/SniwPFg+AbuprdZR2l0Ip2N3h46rigTXH5wObaMKMT8zrDLsk+IiwSgVo1Hob1Kuhg56HHTOZB5YNmDkUIYdT4TsMU9otlu/91fYQQJuI06cCS9uOb3tMLUHLe95Y0yW9zzfgMrG1aMC6tYe1aIviNL6rUJdIxkP+o4UzBdMvSL1dH8LjyJ1fifpQHXRzWDTA/N4uNIUlcxjtQmsOfmAReBocvEM5BgO1BLJI7vmjikHTgcQYS45MkYrE1+/7tZZ4z/xTsCL9hvLwzdyWZkyWA4ySYOE2P4X1E2h7mda53LZbYUbemIpXarVMMgp1h0OhpdeYQppXJquRyUlO65tGVxj1syD3boLYh98B9GgVKlpB+0ZItRGcrvCN82z5so9DgNEB0IKG6bb6MjNQjJV4FlwbHYzDILkvfi6kYbS36Dvn5loxZ91ih/g4sjsO3Xvmf87S/21KfYikZPu+WEAxuZoqoB4FpKvMsRgQhFUJDNWqXR98h36ETXfcEjtWUaWOCptOM1Mv2iLS2aMMNorAtbag0ylx9u7OHlPHqHqnUGTmp+1RomCA3pfFxVNvYSptMV7xfAIbg55ZtvUKCM4cFUzzjacA2akcXs4HfXj7ZfI/6xOtd3MUmZzIGn6E2fSAuRu+dRWN1im08G0FH7W6pNH/Zn9YyA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(23010399003)(19092799006)(1800799024)(376014)(6133799003)(18002099003)(22082099003)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4e3mc0CAnZz4hg8hqo5tBYXr34V9ePQAQ5rfrpNQ7fDyPzfhr8LBEST0Otyu?=
 =?us-ascii?Q?k9fRUT8EZAi5wUSx1MNMM2X1laHvlBwpWSOy3Z1SvJne5fKC11oTKv9xtJ+f?=
 =?us-ascii?Q?wFS1YzmEo2YTUH1G6lr972SDZUdZ5hGtHkqj2Y9scEbdcP1yhAD2VbD16D2x?=
 =?us-ascii?Q?mZ6jTBCkfh3OrtH5TgQEOks9liVWZin+MkyXN7QU6me+KbdxP+jmf1uGcKu7?=
 =?us-ascii?Q?bLb+UEczV7IVr1jPADSQkes7pW32hAguLSvM+DtYG5H+294wE5UbYbtZ8nEk?=
 =?us-ascii?Q?3Mco1Aw2U8LBuM/ZWAJNgSR2zin+zy7kdafzOE8ONrtK99B415PYNYr338DY?=
 =?us-ascii?Q?VXwAE02WGgSO1dK2zaIoiicLLffWXmmII/XsdaAy88gvU6auB85UY94pSzh7?=
 =?us-ascii?Q?gdas5LjXeOtrKJIwPHOZJ/emHUeqVL3xwGl8KoI0POJBLiCagSzaib1gJftH?=
 =?us-ascii?Q?ro5rlYhVH1YPAKj7f2kkjJI6Gc8PKQdUCfW/BeOfhJ8Me4J9tCU3bsl/LZR+?=
 =?us-ascii?Q?0BlUln+WzDKLJ78gOQquMTM7riKToRXbFHKk+qlOiSNRGswLQ7OKx4fbP64T?=
 =?us-ascii?Q?jXa1MD4abUZDLZdUk6tMrlTQNRmZaIjyD9U++Y8iUtLNVA5dGcdRdZ/4WGO3?=
 =?us-ascii?Q?99D++gIDZR09lwVp3qo4ypClXI8p3HqXWZAHfY+63pibpbTOjOyya5upgwUb?=
 =?us-ascii?Q?YMf24vAvKfS4ubtADpMXFEbmH8l+qPM2MklPfYibWAKgU7Jh2RyVrROyI+4/?=
 =?us-ascii?Q?b0Af7EjtlNIqI+zzeYkP9Fa+ZuewlGssqESi8/772O6MN0mPQjRoVEyBOYRF?=
 =?us-ascii?Q?BtnxX3N8Ua1ap3cRJVOib7UKBIn5m6Ka5fhLzLsAZXk/XtlX0up09zBuqU8R?=
 =?us-ascii?Q?IBh+GnxoNfjpcTYsYnGuqj+RXs46SLq1g0jhK1eD0NYH9mHorkQS7Pv7Pgcs?=
 =?us-ascii?Q?uqEYZAD/M0h87CvXix1hkwFui5Tms0geqqmEfM3x6/J5zZbn7dYGF2NHElRL?=
 =?us-ascii?Q?RwITv9U4jghsgQ/0dDNsvrmzYL3WqHIOHnF3KpnBGlRnRYAlMfZIRhZtnZhW?=
 =?us-ascii?Q?kZWH/1xP7rRJ0iXo4ldh1L7YHufdxYfmRJBwsPFuObHiI5+5StNF+ib/DVQM?=
 =?us-ascii?Q?+b5/L3pPsDO70kmFMSpdb4c6/4t8PWRLM8bvG/tYjljA4LdNEnVRl4zSdGCc?=
 =?us-ascii?Q?HzOLydbBZZfEh/PWnxOifa5h01b1/j++EA4d8Lmqcf2wQ2Rcwza03tz5veF0?=
 =?us-ascii?Q?EdOvFTKKNmKY3z5kFOcc9L8xvcRgvbvK7iMfkLTVwbENkEwozJJ/uETuCpm0?=
 =?us-ascii?Q?qLE7Q7eXiI5sczV2Hh5lz+A8s7efFjy8zR5foCtzn7nSU91NEcCB78KK3iOJ?=
 =?us-ascii?Q?V5fQI4MSkHHJVqrMdpYgtUVnmQuuxIDmixGB/gnw02QkAOj+f/Vl2xEohQZT?=
 =?us-ascii?Q?A2Rk97bT48w1MR4ohjhm/5g1S7XZa2eKHD+VzOvYngK3gOM/FOiRm7JtB5WQ?=
 =?us-ascii?Q?Xo/8x9sj3EhJ1dK331v1nR/AgkOWM4+zK4pz66+eu1IvrKnhX8jAhOP3FPkD?=
 =?us-ascii?Q?hHrHmdpLw5xwW77JLuWtHfbOUwbbX8z1RR+7Lzmmz3dkhPIRdcimEQDXYVvM?=
 =?us-ascii?Q?F+nF/nUz5PMf2U1LomQJqs5fdJH+su5Hrjm/5o5YAHIdhWk7eVTMSQD3A1bA?=
 =?us-ascii?Q?iS7tb8/MNDXNlvW4gE3o3rwNhKt2L7WxpW6nQLtKjGbfKtOIiB3sOllJ/zOn?=
 =?us-ascii?Q?twO9esvb4D6GKwTH6XchNXuj3lOfKAib4IlPfoiqo+q5+exeUBJg?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b975a2f-8b79-41df-880d-08dedb5ab67d
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2026 12:32:58.9608
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VAXhWM6MOwDeLW9KX+vYwN+XjByUF9oJxX3HWWJKS13D4QgIOGRraJqCrUJaC4Q3aEHtk3UAod5KT7vZKeMotUiKZ2JIwYwdrFcgl1j2QEMfB7zbJLsz5jmGTsvsb9Dw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10700
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_053306_374811_0581DA18 
X-CRM114-Status: UNSURE (   6.30  )
X-CRM114-Notice: Please train this message.
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

On Mon, Jul 06, 2026 at 11:34:41AM +0200, Stefano Radaelli wrote:
>From: Stefano Radaelli <stefano.r@variscite.com>
>
>Enable I2C4 on the Symphony carrier and add pinctrl configuration,
>including GPIO-based bus recovery support.
>
>Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>

Reviewed-by: Peng Fan <peng.fan@nxp.com>

