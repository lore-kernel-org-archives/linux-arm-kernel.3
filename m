Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E4E5C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Mar 2025 08:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R6vLEQ6ultT+/1t0XudfBtE/0BDCTXC9+qH1WuQ4gc0=; b=QxtTnFhQgzzefsaiBKRuA4Cd53
	W7NJ5CUPdAvTjrJGvnR1h1Hn8oEB0td0PoFdX080059uCjyLF4iEjnodJEJtgTAkB0bcX/k7PdE7S
	nnTR+iwB+YngcCB23XOi5zXbbi1U4bgX40yvywDlPd6c6G1JoIQgQbO+4Tq5edXa3zeXvxqbSd/CA
	oTxHwOHrD4LYatcFzojNNZKWnqL/27iCyyqITrArPCHKCDWEiw4oiRERLB+vQ/KTxPCgrtbb7q91q
	qGtPQTKbvGwyQZRn/T/gf6XouY8KJ0CwzOsHUps3oq0CvfF8BimMoUlTqv5blrO2uETgc9kg2RodB
	xtJ9RHXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt0EI-0000000DQWp-38aW;
	Fri, 14 Mar 2025 08:17:18 +0000
Received: from mail-db8eur05on20604.outbound.protection.outlook.com ([2a01:111:f403:2614::604] helo=EUR05-DB8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt08W-0000000DPH4-0RqX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Mar 2025 08:11:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qct26eXfZqpR6bV6Yveje1tUz8/+qD+7bE9pMRTjs2qjVp8comsa7O2GOKka6hKKArmLSaw7ZacaguCZ/YGmjOCx9/+Q4Q7o5bumoE5ZElnHFCT3+i67LrS3QImrZaxO5x19FW+x3QIGlPCRUCWS3TDJZlBvT37rzcb8gSVCo9gZTNGvouOC9q+IlOtTZmmgSdinCMI0TE5PcCZ3BTgaQWI2e8ozQbNJsdg565sN0tYT87oEsK9HgWuDqHaqD+cvYZEgdvcvTqcfB2K1g7W7U2htmgnQGuDztXZyUYGFPWfWP+k+cJQ1/FMsnLVe5DkFVyRzK/+AEGgZ1WentEwY6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R6vLEQ6ultT+/1t0XudfBtE/0BDCTXC9+qH1WuQ4gc0=;
 b=ShKsHnbdoPOMqT2THd6G0/2Y8Cc0KlMd938smad/dxToE0cpIWhS4iYlc3BSS9kwJEusnCzglexD95tc0vP1JWmxH1w9bhKKDwVnviSCRI17gv4KhGzoNOV/oz/N9amJ7oRxbdsuwBdu1kPBEbwrTFKQOK4Ih6lZrrES3QIJbusz52qOnrI41M8mzsPQbdbyE70x1wAYtoqcTGlLga1QJuY0WVtuz6lcUoRRtFup6nszGW1p98wMtLO56mfz+jBCmLnhKEsaARyO9vt+bHVY8htjH3VFEy26VWQzEHdbxwHcxEUpaQoY0iEH9LPw8YBQz7LtHOkOsRjgoPOV3+VJhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R6vLEQ6ultT+/1t0XudfBtE/0BDCTXC9+qH1WuQ4gc0=;
 b=BbRHJBvTmCegynr7hnuBO6DkCNdKEKcD/dgqJHptoNzggmidYeHQh/Ry86uzvhYM3giQ/zJ/EhsTJcPRoX+9lLYskZ5YEq6NLPbEFK+P9qHarYL9wvM8UI0ZYOVHBSO+16cbi+nhQOA7CUSPNrv3UO8fcPK7pfftUgD9peszkht83PP4o8rEqQCVY6bO89drD/2w3E+3nI4Y7cpsCPOBEJYoz27eC4jt92PGBv8K04qqXJDha31wbEcusiZZQ2olvdt+X40zytKSc6rHQWljJejY/D83x7AlZAegDdBSago+R/mCsU3f6Ihljr72fj6dUTMq2KcwXMAMvMhhJShMlw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by GV1PR04MB10193.eurprd04.prod.outlook.com (2603:10a6:150:1a4::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.28; Fri, 14 Mar
 2025 08:11:14 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.8534.025; Fri, 14 Mar 2025
 08:11:14 +0000
Date: Fri, 14 Mar 2025 17:18:52 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: linux-kernel@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
	Peng Fan <peng.fan@nxp.com>, Abel Vesa <abelvesa@kernel.org>,
	linux-amarula@amarulasolutions.com,
	Fabio Estevam <festevam@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v10 11/18] clk: imx: add support for i.MX8MM anatop clock
 driver
Message-ID: <20250314091852.GA12210@nxa18884-linux>
References: <20250306112959.242131-1-dario.binacchi@amarulasolutions.com>
 <20250306112959.242131-12-dario.binacchi@amarulasolutions.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250306112959.242131-12-dario.binacchi@amarulasolutions.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SI2PR06CA0010.apcprd06.prod.outlook.com
 (2603:1096:4:186::6) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|GV1PR04MB10193:EE_
X-MS-Office365-Filtering-Correlation-Id: d7cf2cfe-2707-4ce2-0890-08dd62cfca16
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|7416014|366016|376014|1800799024|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?3CW5oQghKKdhaGxf8DpJiR6qN7jGztBzPxIU/7sB+iHtMHqjd7bTtRpPRv9x?=
 =?us-ascii?Q?BtN9Ojgb8QkPmTCiXfTnxXSBpZP7RC4DyQH34zrjFy3GsCizrxZ+6TfhYLyx?=
 =?us-ascii?Q?vWLj44u3XOIQ4cOFhTOoRTHrbynkPaKfVSnaX+AUXOctjSrmnN+s9Bc33j19?=
 =?us-ascii?Q?kvfUPYdiI4fmX1lxoGbzSdptgFG95cPcnZBOhQxo3Nw8G2WxFjjCeJxSSX+L?=
 =?us-ascii?Q?oNcapDx3OmEm7u7TFxz2XcjMVOVG7Jd5C0xw0QPK1+U0nVIWjd4TGqXLJsK8?=
 =?us-ascii?Q?7PsGgkCzfo5LWUbniFvwz9uM1REV/nfjWToaQfz6nArvqdzo5v+Rb+V53ZJd?=
 =?us-ascii?Q?Tmk6rtxoYx3+pAm8kq2KGkbuELGqW/of0LCw/xvNgYsmln0KU4yFkQ6OXttb?=
 =?us-ascii?Q?8NLWze9rtE1sETJpxaNLzRJ9fOuAAEFzyjHy1earxH/RBOQ45/XXUfnBv7Pd?=
 =?us-ascii?Q?W0RM35OCRmbku8pqgCClTPakNe5Dr6JrSPlT4QbsO9ZpLhzTXQlmhtK9JBdy?=
 =?us-ascii?Q?i+U38MxB7QsYSsjPQz7lvKek/EhOu7w4DXUBfvqfQ3BVjuQV5yoHzExEH32I?=
 =?us-ascii?Q?WlXsOBOwMaUzxPk2oz4FohpdXeB9boWq0w32Soef+z0Rry6w3xW2Hs46NypU?=
 =?us-ascii?Q?T5JTffLIY4qUptuX4dEJKTj9pxRJrbNRxjiP9lHrbLJ94HKeit33qmjJavVW?=
 =?us-ascii?Q?OX2gQof/3gRpIBtC3PdvYdiyqE+B1wSGBorHrOEBrenlhUONX3x4uuyMo90F?=
 =?us-ascii?Q?e/vGx0GnC1Ctsatx+HHitJwxWrYnK7jpyOiSfGQ9k4Z+CK6sfKKGOr1aJjFd?=
 =?us-ascii?Q?bl5wTmqi9PRihE7hV/PNB3jyc88EwOC/XbCh4dvFGgaWE/p6hKBP7BG5ernc?=
 =?us-ascii?Q?80/OijPDhgZo+xAOP75z5MllC9+NRZ+BCqVVAsiSy1tkBjw3o+aGSBCdC9Ii?=
 =?us-ascii?Q?+VaM5uKXPnDMS9NwQqwaEG+lMI8Hk0ARH0k7gDjwQDz6hJl/Z0x1Tt1DsHWX?=
 =?us-ascii?Q?JRuzMPbGh83HZpw7IJG5Wj3N4BedyPCJKmFimMc6o4WVNYaM5PMnD43mJwcC?=
 =?us-ascii?Q?T2Pmnvlp6g/CdCudkCs3bwvXiAi6ZO/F8dZLS1I5jKQO4phVICX+Z/SWqk8p?=
 =?us-ascii?Q?QtOU2gYblTOUwUbuJA/aOVbR6U3pfVQ6QiKmCEuSxXdgkWKIc/2Z3cd6eSFK?=
 =?us-ascii?Q?ovudrX0miv3HFzu6c81k57SeowxSa5oUtz65/YFaD2aDPC9oux+jVhBTKXK3?=
 =?us-ascii?Q?+it3HFOW+aZXaaXTzNSlaUp3obAnOsRhZulhx2Sb7PmpYx1Mh2EJrRGypYot?=
 =?us-ascii?Q?QOAEXglW7AHOPFCiXfTpWOGMHZeR8BjA4FcXo42Z1xgv0NF8AkFWg08kGFH1?=
 =?us-ascii?Q?oUKP0s4Dku57+U97c/ltOwzwmldMkzouXCBo6V7Hxq97lgMExufDwVhtfoUR?=
 =?us-ascii?Q?TjPTlZRdARyfUk5Bs1y7isBoIdUkZgFR?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(366016)(376014)(1800799024)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UyW5uKPBNq6rMtJS0vkS00BStZWADBaBit0BtqaRG454b1s2t9hbCqKq70Lc?=
 =?us-ascii?Q?S/DHbMbAVV+bu1jfpofVRJyPK6JYbi7PMlA1e/PTzmd1eOmP77/1eS3rDbZh?=
 =?us-ascii?Q?4iT6ZCklBLMJh5WV9uUK7GQJojkulF5ZzBf92epkRBgojZyKxyNB3tzRq3Bv?=
 =?us-ascii?Q?XmYCmbTqeIoFqZEkS0VMdJB/idrBuwpIsdPW2JUEhb3LEXqJEKvAKuTTbfK2?=
 =?us-ascii?Q?UmMuBiKFDtpSbyUCMKSGM+HVdRggSE5KN7wY2V6J006xCeR8tmGo0+lTGDpw?=
 =?us-ascii?Q?4/n5TCwNTjEehaSLH7B5DYooInGJ7sjAXKq/n6hX12K23aCh15zhxtEB9Ppj?=
 =?us-ascii?Q?bNSefrEcbAKIFgkTxR2uJwT7790tkcP59AJ4TqhysGSnKfcLzTBnw9y5eZah?=
 =?us-ascii?Q?m8myuWwmVNcoIghjh87s4a8F/H+EcLGuG8UOsaEHO85EBGcCzyIyf+0Y4uyy?=
 =?us-ascii?Q?l57T+A6AdghaaaaOp0q4efUy9qzamraDHwEDGetLRXPbnnRUND6TrsTijxxF?=
 =?us-ascii?Q?eqmPJrakHhNdcOof4tucDvHDEUktYT8ZXPWWEUoTe+xZO9JkrAxjPOrvpyNk?=
 =?us-ascii?Q?hsxG2z0QeWSFCNY/4+tX9x1i6lfKWM0tuu1XBUZBbgvgxMpzwdlVpAR56EnV?=
 =?us-ascii?Q?UMCzkYUVuBa2x0j0xHuIV6mo2kGdzSHPvG/SWcOtR9lbmoPi1LzjxE7SQzch?=
 =?us-ascii?Q?mOk/7E1xROq+5/iLj0yoUKLeD+PIR8Ki+BfwdvvChASnaeu2x2B3UkXKOuAG?=
 =?us-ascii?Q?puRBF3RPKfTHWcs96Np8oWynrFiW52KCHGnV6w5zIfyUtTMLTCNdANC2p6LL?=
 =?us-ascii?Q?HE/jDf79MrPQjL2RWlRYsxR/T8Q7LALMFdjwc9pENVxceTOJdOBhohrhqGYN?=
 =?us-ascii?Q?8IU2pshz/3rm/3LzU231a5bhD7xeLY8D9DuScRINzejWAfimyCn2IGhtGzf+?=
 =?us-ascii?Q?V10mVi/mGlRRIm77HQJYH+HwCWy52jfAdcM/YtnrIMrgqMsAEoAIz7Nw9F9L?=
 =?us-ascii?Q?fphOSGSZ7MD11SiV4zEWl0xW0vOtgYY1nt8nR0xEWl4Avn7gGosNqTR3tGjI?=
 =?us-ascii?Q?fSkEMpo5ZM0Flic/EdqBZBF3Kixe67ZFgBbPzrkP5h+Z2fdZECxjDs9p6qNF?=
 =?us-ascii?Q?F+SMvGjRjrGb2k1oJgE1pAPZWoiRq7ryWlRKMvzjfWYpdKqXT8RRSlZ3IAGN?=
 =?us-ascii?Q?JVl0k3Nm9Gq5cojhZQbBUpzB4cfrv57h2WZgnqRJs2WYOlJTtL7WozPMDSTl?=
 =?us-ascii?Q?3Btl1UeKDGKPoOZAWxtXiobry8l1M9jIdlcRyaMWqiB0yFc0+yfOYgxoVqCw?=
 =?us-ascii?Q?5vsUuU9BmgIgsB3KLZwp+QJYtumYXld6VNljd7Hk3dsNReEQR2aqgV09cVW1?=
 =?us-ascii?Q?fPh5urHhiOg1jBO8zcRpQP52rcFJDgLTjkrZoRKqaV6kcXv06NtaEhds7UB3?=
 =?us-ascii?Q?/E+WUL1A76pqcOi9dRiHBEv3Mkf3HnKY+fUXtPopI8mErDe7bcp/ub5uuWVD?=
 =?us-ascii?Q?6PcYB5Ti8RoH6Jgt8QjFaAdDHrZzVxo88PTn74nkyosfsKjnKDSPOndAXJ0l?=
 =?us-ascii?Q?tv2nzcRylZuB16D+zUybc44MI0JB+Mxgouuqxp8V?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7cf2cfe-2707-4ce2-0890-08dd62cfca16
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2025 08:11:14.7165
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tr0D8Wchlr1gQDcxywhPFuMc658FCE9dMuR23E1XcJdjOB5KuVFIOrngqV4N2y6DaOtZEJeeGNCxjdRDKx2ULA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10193
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_011120_153466_6AE71EB7 
X-CRM114-Status: UNSURE (   6.12  )
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

On Thu, Mar 06, 2025 at 12:28:00PM +0100, Dario Binacchi wrote:
>Support NXP i.MX8M anatop PLL module which generates PLLs to CCM root.
>By doing so, we also simplify the CCM driver code. The changes are
>backward compatible.
>
>Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Reviewed-by: Peng Fan <peng.fan@nxp.com>

