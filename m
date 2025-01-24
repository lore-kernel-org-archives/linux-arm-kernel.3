Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E13BDC02181
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jan 2025 13:20:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	Content-Transfer-Encoding:Content-Type:Message-Id:Date:Subject:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HCn9yw89RDvVl8IQcyDeF2oyCpee4nnHDV42F/EJH68=; b=kt5x+E0xkAaXL34OT0L9JzLHT4
	iB4KicElGXEpFbTl8Jmp2ZEFEqLVwS1xAz6FKH34SXFEjk8j28Yx3k4htoGzXllMYNQSXa5YUgCUj
	7eW0q0oaEAGTX/8SPaJzj24US2hk8vliEB8eUXkgZTUa8hhrI3j8HLUEp83PqyrWbRzWQy6+kJ1ze
	WKzJNT9v2GXALTCj54Y0O5SvJO56xCc2NbX8EixfN4P9myyvCEpkO1Rntjgcjx9WpbZ5/GFrntI2k
	YgzGZJ67Trm9rU8L0c5CkToY0/cleRD8YSG5HWg8KsIN6tDDCce9njuFnvxpKrbqV3E7FhULbPi8v
	YSJHqCnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbJbv-0000000EjMO-0qGz;
	Fri, 24 Jan 2025 13:20:35 +0000
Received: from mail-am6eur05on20611.outbound.protection.outlook.com ([2a01:111:f403:2612::611] helo=EUR05-AM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbJaa-0000000Ej8G-1bBl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jan 2025 13:19:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IxFTXW0nihzgOSHmi1SCUsXdkD3us78U0+B/3Huc0FuErzfeeFTxQNyYChecYt9lrl7z3tZ314msKUNm546OmB5ZG27RiPPfiEdU8wAXE22TTWAvYrKEodLJLvx0eNaWFvLjANcGex8WJNL3Bwrm2wd1t9biA0XrrQ4WcQssy6Nn8pkkDFjXDEFfMOlQmo1MNf3dmpaMVF9NM9vaKCJbNG0vXotLDH8ndoL2/rGLrn/43toBAdvpOSyER21VGXvm2mYyKDr0uwc8zIWC5S6DvIsQV8suBgjUWAprOgRHvtZjQJvcJ/nGMbVxeiH+cnEdxZjiE2JPM8Nj5b47NCsmsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HCn9yw89RDvVl8IQcyDeF2oyCpee4nnHDV42F/EJH68=;
 b=W0MUKJCP5Y9wIVqUqCmV03Qj3BEm4rpP44ZeFCrnPBOFl/8rYAdXEuEvpcf4CNTaNxYpanGB6ENa48W68aCBpJd6MrZZBp+CroaVefJaoNX0i3dwJLt1/x4+cMHHWAkdZpeDQjKYA7iruXTEaIvrqtQnl/H0txNboBNr+cc0/ko2u1PcOl9Ttg44iHlUO4fzl9OrIMz5NFPTHugss6daNbKpCu9xYoMasjdfUphy1rzdQD8xPfQy46fWqorAbn1YIaa87YLrxyH6JsYiFuC7NRjjy2jBEdxyoORebQ1cJVJOeBox6sAdUKudymJwwpkZ9ATzx8ycshxx6BtPhChWxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HCn9yw89RDvVl8IQcyDeF2oyCpee4nnHDV42F/EJH68=;
 b=wtYWvVWjBLz93Gp56HVYbJ/QuRba1uFEYfcfNhPcd0TNSzfPLcMTLH6HVqWjmeiwwP0QwgjeufFD9Zfo7zLh+10y9GyAXd9rno7jgOe6e4/6jBbjN3RMY1uZ72ph0Q3+Nv94iv0/xpHAUK6eHeEuTs+DF4e1AWN/p7jFpu2s6LWxVeJUxHmG3PgP3D5MmbysfPIlofZ3poiVdpA8fEV1uCPmtDzEu2UC/NZKrmYz0s2rUFKXUnwFd4+pKP/6nEtoyjSBC0jfm9E1VR9UiHk1L9PtXdr0xV40SLmHT0ide3ZRsPZQX6AgknAKk9i7g/n94BfBKR6dtlWymNavCbMJ5w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PAWPR04MB10007.eurprd04.prod.outlook.com (2603:10a6:102:387::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.18; Fri, 24 Jan
 2025 13:19:02 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8377.009; Fri, 24 Jan 2025
 13:19:02 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Subject: [PATCH 0/3] clk: Support spread spectrum and use it in clk-scmi
Date: Fri, 24 Jan 2025 22:25:16 +0800
Message-Id: <20250124-clk-ssc-v1-0-2d39f6baf2af@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMyik2cC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDQyMT3eScbN3i4mTdtOTkFJM0M4MU81RTJaDqgqLUtMwKsEnRsbW1AHp
 Io5RZAAAA
X-Change-ID: 20250124-clk-ssc-fccd4f60d7e5
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Sudeep Holla <sudeep.holla@arm.com>, 
 Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Dario Binacchi <dario.binacchi@amarulasolutions.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SG2PR02CA0127.apcprd02.prod.outlook.com
 (2603:1096:4:188::7) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|PAWPR04MB10007:EE_
X-MS-Office365-Filtering-Correlation-Id: 4947ea18-8793-4485-c860-08dd3c79ab59
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y2VrbnVHcm1FY09DS2tmS0FoUHZMQlYxZlZtaTdvRm16d0w0eUl4Q3QyUnBS?=
 =?utf-8?B?c2JnYlhlYnhGWGg3ZDJPOTdCdXJ4U2tJdTdNci9KRUo0MG9SS2U0S1drRytp?=
 =?utf-8?B?VW1tMytLWWFKVUhoNU9LUGpCZFJlOVBMRVdZNm42bE5FN1BwWldObk9ma21w?=
 =?utf-8?B?TDlLVjJwbXJaS3RzZkhHSndlRVU3SHBZVCt5WmV1aHZCK05oQkcyRmRsc0t2?=
 =?utf-8?B?NkU4ZXEyUHJxdWpkS3dXWnVPNXZwY0dzNHRtYlVFViswRUtMVHRVVFZKaTBX?=
 =?utf-8?B?dE5YOFN6V2JTQnp0eGc3SVJMSzlRSW1xcXBKc1FWVXpGRWZBVEpTWTJCZmM0?=
 =?utf-8?B?Q0tyUnhpVDQxc0JiUlM5TUJheEpTZjdjekY5QVRaL2I0d0hGR3dqYzFsSHBM?=
 =?utf-8?B?SzVDekZyTk1GdGg2bXloc2VNSkg3NzFPSjFLSVR2eC9oeHZMejhTemdmdkdP?=
 =?utf-8?B?QUFRRjZ3ZHFEd2hYd0htRVpiTCtTWTV0Uk8vMFBWV3lVdEc1eUEvb25ISmZt?=
 =?utf-8?B?RytIa3NOU0llM09KeVJqWWRCSGZ5K3RnWUl5ZVZuc3UzVWNHNVRnNFAxbzVx?=
 =?utf-8?B?bHV4VE5KK0RDOEtxcGgrWGtLZGZLSUN5WENBL01tME54TXNVMlhjMHFCdDdy?=
 =?utf-8?B?MFNBWWlJcXpXYnNKM0dVaFR1YW1UYlBCQlFTK1ZDVms4N2RJenJIcUYvTWVC?=
 =?utf-8?B?NHRnZmVTdGp1eG9mR0RSSkcvRmJPbGJWMk5TajdmUGF1aDZOc1ZFRDN2SXpQ?=
 =?utf-8?B?c1dvL2x2NXE4UGZ2RFJ6OHIxZDdxeFJQaG82OHhnUUZHUmkxRzZ1QlQ2R3Jl?=
 =?utf-8?B?ZmFSMm9ubFZkVGpoRTdnT24xRVJnTWNmNXJSbzBwUUQzU1NBVUVGRDB1TFBZ?=
 =?utf-8?B?V094NDk5cWRVdGNGVkVCeXdVVDFuQ0VWcjVQc2t2eTNMbHg2bk1jTmduaHhE?=
 =?utf-8?B?L1V4RVpGZlN3aVJXSnlreXJaUUNwbVdHTEZEYWJWU2R5c3ZIVlNoZnM3MXpY?=
 =?utf-8?B?enV4Q1ZhNllQZ1ZFMzJBeEVxcnFNbjdWa2sxaWNJYTlZS3AyTDlpcDNxZXAy?=
 =?utf-8?B?MnBwYVo5U0NDSk41WHI0NmNna2gwTHlXb0NneS84a25nNzIxN2tscWtKNGww?=
 =?utf-8?B?MkVNdUtad0dVTGNSc202QVhsazhnQStENTNZZ2hzYkRUWmVPaG1WWUNaSDZY?=
 =?utf-8?B?clZ3K1U0MFBSWklOQzNCcEhpd0t2bCtiWVZObFNhcFI0T0Z6cGpzb3FZeWE3?=
 =?utf-8?B?OHQ0NEVxRmdEd2xNT0xmM0JGaGhyQUZFQ2c1TkQ3WVF3b2RhZFZSdkZidFFS?=
 =?utf-8?B?UVN4cFBNSm9OaE5tbzRRZ0pIWkxYSXlGak5zREZPUGppZzUvV1dXd1gyQlU2?=
 =?utf-8?B?czNTL3hwSFJxUGhvdnozLzFTdGRBeEV4dThXaUdzNWc2eWR1QTBkM1dXV0gw?=
 =?utf-8?B?Y0ZqOUpablZRY3FxMEh6MDVGTStxY3loMCtTYlZsZlA4dGZRNkNnQmRvLzJI?=
 =?utf-8?B?djVZU2dlaEVpVUF0TzdXaytxdEJNOFB2aHFCbWhBdkFDa014RFpkSTYwazhU?=
 =?utf-8?B?SGVTM2JYS1lkOGVCNUpyN25Hc0FhZzMyUnFGNXkrL0UxS0xhNm1pOCtSZHNn?=
 =?utf-8?B?NTZML0Y1Y1oweFV5TXNTUVZIN0VGL2RZVHVNWTRqSTFBKzNMOCtUdGo2dlJv?=
 =?utf-8?B?aGgyT0E3dTRGR3JhdFpMWVAvazVUYkNJbEh4elZCZVBrUk9EWFNXY2VJV0R0?=
 =?utf-8?B?bEdkWmQ5em9vVit2TUoxSVp6NmRYVHlreWZXQ21rdTlDQU9EbzFpbXN2Zmg3?=
 =?utf-8?B?dWFWVXpDeWc4b08xU0ZxUkF5TGJieHEzOTVPRDMxVFZiTDkwc09lVyt6UEha?=
 =?utf-8?B?UGovYlB1VUtFdmpKNVBSa1gwNGtPdHlYLzNFL2NOUmNWUXB2MzNsN2h2SzY1?=
 =?utf-8?Q?Cuzv3k43QzwQKJcDc0UvtyHAZZXrspAv?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cU9acEdSemMxRUZ3emczeHBpVjR6N2FiSGtCMExubUM1dDh3SkVNZ3Y0TDdN?=
 =?utf-8?B?Z2NxQVRnTzNoNllYZHZxUWZZMnhDZk5WV2szT0ovOTBKeXgxLzdEcnZuQ0hY?=
 =?utf-8?B?SGd1bDdobGxhN0ljS3FMMmNNRVhnR1pKZHVlSmYxaVdRUUx6Z2ErVlBRKzQx?=
 =?utf-8?B?QTNqQWJOSmRTTDZKS0U2TU9tbVBuVG9MWUZlSmtwajdmRk52NDN5OE5KaTVJ?=
 =?utf-8?B?bDdtajRoUzZzQUVRNlI3dmt1Y3ZLUDU4RUplaTZHT3RxdVF5SEcrZGpPWWMw?=
 =?utf-8?B?dUU4ZmE4VXN2K1BmaFZTczBmaW5lcHhETWFFWXZJL1dmNkcyY2ZwUGJLeTFF?=
 =?utf-8?B?eDEzOGNoUndOUGdTeS9DNUI2RzhGMFRucTk5azZpd0R0cG52WWx1amVNa2E1?=
 =?utf-8?B?dEJrS3lTdEtET2o4MW5xWngwZ0Ezanp3bEoyTlFjZ2krcXg2c1B6OXB5L1A3?=
 =?utf-8?B?V2lDaEUraGt0bndZaU1aTldhV09CSFI1OUw4WEorZW56V3BERUExTStPR2NV?=
 =?utf-8?B?WFVoeU1KNnVEblkxRDRlbWU3bXNaNHlFdWkrZ2FnMDV1WjhnaTN5ODU5bTNF?=
 =?utf-8?B?dlBxQVBOYWVMam9ydUlPZy9qcUVrT0dEMzhWRWtzTDZTY0srVUNMRUNXdmpi?=
 =?utf-8?B?VVN5NlF2MU5PNmw3OUl4UnhTSzVUS3VsMkxnY2JQUkFuOGN2YkkrUDVyVzhC?=
 =?utf-8?B?T3YzTEZ4S2NmdGJLQWRWU0EyNFFuNkpzMmVNU3l0bjVOa2luMWxMQVlHU3N1?=
 =?utf-8?B?MUFBdjBCU2ZHQ1Q5eGkyNGMvbzM5UVdFSi9OcDd2bW5zQk1wS3Y3c2VtNEZ1?=
 =?utf-8?B?QzhaODYxM2dRdkZudFhwVzQwWE14eFNFWEE2cWhlenM2N2t1S05lQzNFaWlN?=
 =?utf-8?B?Q3Y2M2FwNUJKa3AxRm5aNW81VWEwLzRpeG5ERVVLakV1a01pck56OXNuTHB2?=
 =?utf-8?B?UEozQWhubG1md0lDTE9wazNiYi8rOU4rR1A4RVpwUmF0eEJWTkc1UzJwSFBx?=
 =?utf-8?B?V1pWa2NkdFY0bnd0UnNpWFhpTlpUOGlVUFU2c2t4SVZFV0lrT3JFY1dnNXF2?=
 =?utf-8?B?RlVZRkpEL1hudlNUbTIyVUNjMm9KMlNHb0Y0NlpiUGl6Tnl2VDFrUFZEa0p4?=
 =?utf-8?B?WkMwelBXRHFuT21tMmxYSkJUeGVValk5cVRSM0hvakl1ek92cFI1MFJnU0xx?=
 =?utf-8?B?MHlEYXJ4bFdsbGZFN0hhbTlaWFBuNkVUODB1Q3RVSFRzUFhxTWZrdkxTN0xv?=
 =?utf-8?B?UDN4K2ZaM3BaT2w2Y2FOTG4vWEhGeXdJcmJkalpTUGllRUp1MUhJTHdROEwv?=
 =?utf-8?B?MWM2Mi8wMFYwdzJ1anhxYlNTYTV4UXJSY1FLb2Q2ZlhNSUliZ1luZk5kRFZV?=
 =?utf-8?B?YVVVdW4wWjIvNkROWHEybXhBR0JMeDBuRm5iMXI3ZURsd3V1aDBaT3p3SUVE?=
 =?utf-8?B?WkZ0SDVBU3VZb0JlWHlHdDB2dnJDOTc4M0VVMG9HYUpzNzVwYnFRMThYL1Rk?=
 =?utf-8?B?NUUrazNieElpWVNMaForTDVHd2YxN1FUd29aVCtzQmZoMG1Nam1KZXl2dkp5?=
 =?utf-8?B?cjBXRDM0T3JmMDFLS2hzQ3F2TUhGZDJ0YzIrU3B6L3MwY2NiRTBRV1VSSUsx?=
 =?utf-8?B?clZYM0NMMi9ObEllb05IWWx1UitrTjJnckVZV2lFUG1NMytSNnBPcVlTMjdM?=
 =?utf-8?B?Mm56bGhnUnBTaVMvSE9YNkJ1cXMwYkR2bzhhQUplWnVRc1pRalEzZHNFNmhy?=
 =?utf-8?B?VzN5dFlkaU5KNlB0SU9sYWhXREIvK0x3TmlrRjR5V3pXbG5xb05UOWVJYVdr?=
 =?utf-8?B?NkZMMkRJY3FUNFF2K1lQaFMvWFBsMkViUE8zWEpLWU5sdXZDSnkwamc5dHYy?=
 =?utf-8?B?T2tiK2dhek5iNXRndlZZYzVBZkNrRXU4d28wNTJ3UkJYeXZtOTluNVlVRnJR?=
 =?utf-8?B?ZnROWFBOOEN4SmJCbXRTY2NKTFJNdUxqblk3S3NHMTM4VVBZNTArRVhUMTIw?=
 =?utf-8?B?a2ROWWFnVmVKWTNkQUErOHRibGZyT0ZEck5qZ0Mrdk85Tkc1OGMzWXBWQUp4?=
 =?utf-8?B?Qm5FZm5vc1RXbDVkUUtYcE1Ba2VQd0JFWkF4bzE5NmdMMTYwNTJTdGV0RW9j?=
 =?utf-8?Q?L01gj2k3kjM66H0jbAJRBRrW6?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4947ea18-8793-4485-c860-08dd3c79ab59
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2025 13:19:02.2180
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: REFortzIY6Z813YnfB2UdHEgWKDQ+uLbLvh977Uz8yNsBuyLFblMuCCtfTXiXWdqiX3WPPoSRFuD/kT3Knprzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB10007
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250124_051912_437770_C33F1E52 
X-CRM114-Status: UNSURE (   8.19  )
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

- Introduce clk_set_spread_spectrum to set the parameters for enabling
  spread spectrum of a clock.
- Parse 'assigned-clock-sscs' and configure it by default before using the
  clock. The pull request for this property is at [1]
  This property is parsed before parsing clock rate.

- Enable this feature for clk-scmi on i.MX95.
  This may not the best, since checking machine compatibles.
  I am thinking to provide an API scmi_get_vendor_info, then driver
  could use it for OEM stuff, such as
  if (scmi_get_vendor_info returns NXP_IMX)
      ops->set_spread_spectrum = scmi_clk_set_spread_spectrum_imx;

[1] https://github.com/devicetree-org/dt-schema/pull/154

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
Peng Fan (3):
      clk: Introduce clk_set_spread_spectrum
      clk: conf: Support assigned-clock-sscs
      clk: scmi: Support spread spectrum

 drivers/clk/clk-conf.c        | 68 +++++++++++++++++++++++++++++++++++++++++++
 drivers/clk/clk-scmi.c        | 37 +++++++++++++++++++++++
 drivers/clk/clk.c             | 39 +++++++++++++++++++++++++
 include/linux/clk-provider.h  | 22 ++++++++++++++
 include/linux/clk.h           | 22 ++++++++++++++
 include/linux/scmi_protocol.h |  5 ++++
 6 files changed, 193 insertions(+)
---
base-commit: 5ffa57f6eecefababb8cbe327222ef171943b183
change-id: 20250124-clk-ssc-fccd4f60d7e5

Best regards,
-- 
Peng Fan <peng.fan@nxp.com>


