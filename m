Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 383C3C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 12:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IBAZlj7C7hcps8JLAgWiya/CF1H8oNeVn3aRR/lHjqQ=; b=2SdkkdSkFvhSKJXU0fQYt6grjK
	QzsKWWvU+EZ4plLY8M2DTphNxmjYykwDf7tC9mGbsTuRVzSI/CdJ4Wx9+0SklRSs1ENYYVVZZJz/v
	rvDQq1hSHIITT0d/3dqw4sIoUIjQtIS/dE5/gTXtaREnufZR248zK7Vs8PQ+DcEb5ODq4aH74FmK1
	cw4WNs27BEySFl7H0a8kAon3Vyw6ig5EZJv4zaWvoHdVS4RqWc8lkSUIqYrHw+sZxnxTydYIitCOc
	U6WPpwBuzy2kyusEeDghmeX4v5iT3PuevvTnCilmAgAJhHBTApE7R43G2zi57qDXN8cePpN4GonLh
	Z08WdW6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgiXT-0000000CU4t-39Hs;
	Mon, 06 Jul 2026 12:35:07 +0000
Received: from mail-swedencentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c202::7] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgiXP-0000000CU3Y-2SWz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 12:35:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mhGhTHkil9x1OwsOTkciZCtZ3sf2zyPcveIBSUlXc008YU+BNc08covLXB0sRrB7QK+1VCYwwO4un2XhD4hnMlXWAHqjN4NpZ/g8iCi9pBgjf1g4UTOT9/pAXXmwtlTSIT/A+yFFuthRgXhG/CJhS8ZrtaWfLpBX1S2pswRp2x3xxh7Nqh5VWjY+jhq7qAj1MK50usixFujS/61X9QznUdJ7D6gkzrDFVAZWewNSf6ioYZQpaUXccY7hDxvNYx5GP/8KrNf+Z0OQsjCHsWR37juFrKCfcZ94Epkqd8P+l2OysO8Oqjnxguv/xzW6Igd9YSZCsQo/acaUHYhL0BwAGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IBAZlj7C7hcps8JLAgWiya/CF1H8oNeVn3aRR/lHjqQ=;
 b=AyQ4rVHGTX1R110MfmLybewHMC360D2H4k7bAvnijCUDVoiwuFzjj3E0CAmbaYZzvqWsuSby/zcbpgosyxLLG7SrGcZbIpf6zircl+iamx4o6Jits1lIcAYEs3o/r7+0Z4CdpUM1p0521AsblO2KnNwNT22GAR1OLtKXXStHN1XuHNoRbgLS33tsWe4KDIg7fD8acp8tOfScMYCoZWyev4dudtyVaXIMFVmKPLvggv3cN4dCOqNlXWcCp697yxxHc1VIr9nfnYidWipEYOCbGRjXk5/otdo+d+3cT35cyFt3nINzL8GN10x4r88+EMeqGPtJ4Q7ntYp4TWTCqyp/NA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IBAZlj7C7hcps8JLAgWiya/CF1H8oNeVn3aRR/lHjqQ=;
 b=f9VlrHGdpT0Z7l4EIOpLjiiLSU73B/rmsc7gvpE8h1lCiOz8EOwXVmyjHeCBGpXHgK/VFYyUkjCVyO7oprC+DkeylOVTMwmWVyG8j5mSyRI84/C0z7l2Cvycopum4bE+VyqjK/FryBc8+BMTHW+9LZuiNUPg4kXWVHYdk4Ms80oo2+Uepnd8vtoZvnpEJ7bdxZOLbHX9usE6WpgXq9FbUtASDiPB0hDjeXpMOsUsU9BdbrsRVt5FCsXIXLC5yYO76QXFo5c9hWR6rgUTX+md+FIvbZAEZ/+Tn6G474DBGlVH56lM0wqJQTkYZTBnmvGvEH6LRlsixqE40zcore8yQg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by PAXPR04MB8576.eurprd04.prod.outlook.com (2603:10a6:102:217::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.13; Mon, 6 Jul
 2026 12:34:57 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%3]) with mapi id 15.21.0181.012; Mon, 6 Jul 2026
 12:34:56 +0000
Date: Mon, 6 Jul 2026 20:38:24 +0800
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
Subject: Re: [PATCH v2 14/15] arm64: dts: imx8mn-var-som-symphony: enable PWM1
Message-ID: <akuhwJBsk+MljAEP@shlinux89>
References: <cover.1783330236.git.stefano.r@variscite.com>
 <e7b7b016bda85d2d3fe3e804ec868565049a3791.1783330236.git.stefano.r@variscite.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e7b7b016bda85d2d3fe3e804ec868565049a3791.1783330236.git.stefano.r@variscite.com>
X-ClientProxiedBy: SI2P153CA0014.APCP153.PROD.OUTLOOK.COM (2603:1096:4:140::6)
 To AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|PAXPR04MB8576:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c7dfed0-370c-4305-ebf4-08dedb5afcbb
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024|19092799006|23010399003|11063799006|4143699003|56012099006|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: bniCa98JlmhIfPPANiMvetjaIAH+Dbd1gvOEq2MHxtjTrlbj+64/D60q0M810cNsRmo4I3BSQmP0P3hOrgM00IJoizfoxD/n0uOzfswFUjRpbCgvUlgBOX5Aui1qhcDU5Jl5jdMWMK4GdGsto/hRdaf1XWrruBjCtLmW5dEFxgyAy5MtR0l3MquL2Bnnkpz8o8pw5OxYphqBMQWlPnRgm0x2R9DI3r02OJAts0E6NO/HPT7ES8VcNprwajB5J8lQkb3OEAz/8cwrWlvCLW0iBjye89FuCtbvgg8Eutt337u0gPWS2UByt1+M9tdJnY4xmCPMzTp3oLLCz1BIqJrcHQrhFkl4c/ywc2WBNnM5AePLuzw/G+7xQGxzO8ZUb03YMwgLqys2P0YLJ6rLkRSuPg36snmaX3PV+BVmzFj21xVLHqUw7xv28Z2Yt5E/rsK1R+eNqzzd9LyUsJ/IWpjESLhWQ/thSRYvf3/mOkV2ieXY8ObHapqtH4tECe1dOfO1GJRGkyEoPv+eZ/jkpOoqhhZQWgx7bK8l+gGEfIFSMMTgpfiiLXaFjUXfOGXyHETZTSocrn3RcpUTBuKdlTvEAxa2wT0dx2q5kVoKvFz5UvKO5clTUTgGmL5Sg3IGk4vIFLjnV0kQIym4nuNXY/lMKSFFV3lZVF/6a6oQVlS5JmY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(19092799006)(23010399003)(11063799006)(4143699003)(56012099006)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UN323iTsaB7ReANP5hL0imHxO1Ug6WHmhids/0MyyRkfJngrQiJQWecsWLKm?=
 =?us-ascii?Q?BDaY/dXTd2BbPUf5do51okZ/HB81fC6IgKGtprwmUiH+oC+3smI82AuWpdTM?=
 =?us-ascii?Q?nr7BscL+5vTKBbnNcUj+vb/h1jgPl54DRDnlvbVtLwRLC6SCwwNTm/b6jIgp?=
 =?us-ascii?Q?PxSz7MyNaFYmqdX4Kqiv+t8qW02UMNQTSv+VeqerqiYhhxxCthUfXIiRvPby?=
 =?us-ascii?Q?hr2v94i7rc6mHQaPYk0BDseEOYwzPzHVjJgi3HAE9paXesmAxMQTAUxPfqDH?=
 =?us-ascii?Q?7djUdONxC3V+d/9IF4k7WKqqG2m4uJB2++lbJcCv2WHQNWZyjSmxxfKso8QW?=
 =?us-ascii?Q?ogGMsGAIWG9ekLvQ96OeIixLDP7Slmhu/YjDdDXuXVC7Y8jvexNYWRu/4xqL?=
 =?us-ascii?Q?lPOWGJP+ARajFTqJQt02uak4hOFGG5KCcMUdSAq03d4KEFvs0FZNKo67btV+?=
 =?us-ascii?Q?5HCexsvrzAzSY9LbTVPAarslRAOTiODaXGnEZuTeGr6BNvs+NeNJBYQuKi/E?=
 =?us-ascii?Q?LanZ+FSyyfQiUY1CV0NmVv5T/LpM3eM/+kr8ec7PfiTU77CwfbZbeZBtYbMj?=
 =?us-ascii?Q?idIejO/InN+DZErxQoJRrXqr1JFgF35lXfdYWe9sFyJHd14oj6XF/l9x7kk6?=
 =?us-ascii?Q?Y34eRE3RgBRsEojzICD1CDhXhOF+DVslYYgzRkIbpWcjDTdhM4DQp79Vzf2n?=
 =?us-ascii?Q?D9PwWWfh+WoU20FQUmPHEv2jIfWjy7VaoZkFn5Nueei4JOsgyskyd3BYFcEq?=
 =?us-ascii?Q?MjyINkFdRMsGpQ8rTWXTltfBFryZDZfRlC5pC/5hCy8grp7cvBurwD40GRdx?=
 =?us-ascii?Q?uIEYqPwZmkZ3EEaHPriYFWM4F0Vy4o7Kwx7zAr20A5JS5+jNRgHEMWIuPUzz?=
 =?us-ascii?Q?AwbPVWv0i1CpBxws8r0fxaLCmfUPjD8mcbwMQd1bDwJ2BQsqw5cGkP09oOoV?=
 =?us-ascii?Q?2xjk2HGDs8TTXOuULJj4mciT6eR8jMFDdXnpBXM+SE2DVDSN91VCU6YCkejJ?=
 =?us-ascii?Q?IsE/uP1Mmwl/Giqaq8XRGswnl790fmQJoFkOcUxq0IqPmnkcyxxfc8GoBt6n?=
 =?us-ascii?Q?xzX5JvVdfnB5o0cUNkec1MP9+0ggwlFNdvBcI3Rfmd97HyZpE6vAu7gAu3Db?=
 =?us-ascii?Q?YFSeaJxc5yXhQ9OLBI/z3UYOtyfzZYGsZ8VrsXI1vVAEJjaWAXXE92eU83Z4?=
 =?us-ascii?Q?GC89IBxbStXHNnDnyIZFK4MfLBB5Rd5D4gBRKXRm5Qkt3HYhHTStLMKGOIj0?=
 =?us-ascii?Q?Dgf7OR7o/Zxv6GbNMf94GyugMqLy+0kWWW71GZHgW8XKyeG9cT4C1cD+yYDn?=
 =?us-ascii?Q?mu8xmDX8EcPdlQ4VQPeHOjUcsM7bCv8Q0wvntYVSPWPdMb0MK2Rbq34il5th?=
 =?us-ascii?Q?/3FBDn7iLQU62wqHzjZQ0UY2EXDmLFEpKYv/t/qnFjlPeUeI5RnAA4ayRCLA?=
 =?us-ascii?Q?r60mDjx6ed7rvsr2nEbv6KWDq14rSC+xbciQuwT/K4A3lBMpxNZyhpOhNKDd?=
 =?us-ascii?Q?HYW2tj9crqbE42leQcbbegezkl2AN5+OrKP6NZrPwvKwB2MkJZRyh61nOw5x?=
 =?us-ascii?Q?K5DWsPXAcb7HnUwrS5c0koCg1wA4YPTH85qjKLyoEJuv8xxSTucWs5GkYdIy?=
 =?us-ascii?Q?F4FOhXhlzYDpkLldutmQjvfO7lG89iTx6puW8gLQQr3U/p4baS9eZlvNw8lb?=
 =?us-ascii?Q?JEZBW2U+PfTdYYKw7l0dOxaIIR/8iTUk1jHKqAhIduQJSAf1qV5kfDhfe/ve?=
 =?us-ascii?Q?qahKEiNIlovIDusAxbrk2vWhUDcVT68zgjuOtHKeVf9JyaOlC5R7?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c7dfed0-370c-4305-ebf4-08dedb5afcbb
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2026 12:34:56.8136
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c3JxTAc1B3/h/yqTtMdk2DqGAbfKDuJw17bou6UHtF4nTkD2g763YwMGLh+GCrtC1WnvqKYJo+AxS0WcJ097I59znwlrKRUhCZBV0bsLpef4VE9ONClqfe9isim3Hxij
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8576
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_053503_625952_CE6D5455 
X-CRM114-Status: UNSURE (   6.82  )
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

On Mon, Jul 06, 2026 at 11:34:44AM +0200, Stefano Radaelli wrote:
>From: Stefano Radaelli <stefano.r@variscite.com>
>
>Enable PWM1 on the Symphony carrier board and add the corresponding
>pinctrl configuration.
>
>Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>

Reviewed-by: Peng Fan <peng.fan@nxp.com>

