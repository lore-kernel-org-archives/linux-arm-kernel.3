Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87AFCECD6E9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Feb 2026 21:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	Content-Transfer-Encoding:Content-Type:Message-Id:Date:Subject:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/+tEJgXe69jTJp0xaJnCL5ijJ36+CnQlrysVJPLlDXQ=; b=Garvf7ISCQBMZ2ySnvBheyBGYX
	O2QUlMU332QjeFpgsIG1L2xHp9GWrTqZ0PdRZF3QAsE4odnBe4qpzIPQQIK+qvzZyZ9cYY7b22c6a
	v36sQzTuBPAV7jpfhUz/1TnoyAgj3K4sfXmXqUwuSG6myau6Z9dtonHZCh45jTXKBgHv+hLsmYOLH
	noqCX44+/kBMzA1HwVjeFKPmGW/TR0+pfZKUEgti/YbkAz5w+AKEoKTCPWtSCBObATcmTLtxNStsM
	0WDmB3+pSqi3Albj/V7bv4SFQF34/C3rExaPHLiU51uBTWhwACt92SsykUKAsowb9ud7Xo3KlrfXa
	Sar/dgUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqHK2-000000012xt-1WKO;
	Wed, 11 Feb 2026 21:00:30 +0000
Received: from mail-northeuropeazon11010062.outbound.protection.outlook.com ([52.101.84.62] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqHJz-000000012wn-45Id
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Feb 2026 21:00:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LvXEytCZ29sI7EIkk5WT7CkmjGwq5vmGTgKdGxlNuf4ZCut99yevndYSBFadJDxHU5NiDLQ7ioEaMu5lEzU15lSMtQcfEfRuVyk/dq3woeekkawuKDPGYpIen85XV5huBppBF5lolc8tsoUR3qLswrEUQdL+cPxIQQSmEw1skNKwnRh8As1hiH0Xmv/CcxDKpmybTRMIRYpuPs8kSQATzAsa8FF/zm1o3fsyaPGwr9J+SC/YPPJIi798MkF0KBkaXdEHyGo7uHXiPWBUZiLd7yKgDN3xCmpSTwu85FNsFywIYWmSdIF7x/4GTfFtlxsF3QT7XgFiflSGFiPH+Z41kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/+tEJgXe69jTJp0xaJnCL5ijJ36+CnQlrysVJPLlDXQ=;
 b=sCLZp6jrzh3ZiTU00Ok5fmmPYNNgvROTBuHH+s0WAP69xbamX6DXAQnAeOJWtBfwngffhMH/ELdpe0ycc6ooNua9KnNvi+XRpy3V72ODRZ3fLbgsu/Wehg54Vaz7H259dPlo44GhF41FiWo2ilCY9xBdLYKox5Q+SR1sC/IzUECMRxjApruVhX9QDqTldV62isD1UBcN8/6nEKFrCdGEL/NXOj4MQbh1VpO/Kv5woHCjrUK4NToHfJfh63Da7aSLmNr3Vl1Wi9LhmxOgEi2up8Q10fOQYeLpPX9hskJGzozA0PmRKXZHxyM3cdbV/F8h/2aZkBqoOD9bHR9RDzCYIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/+tEJgXe69jTJp0xaJnCL5ijJ36+CnQlrysVJPLlDXQ=;
 b=a3oU6xOQ9UUAHJbHoO0Q57YHmgZ8AEowsT23bi8kFNe77gk75ibGGnq0lhZCjzetC7d2bGWB5gviwpCG/PoeRE1No1CbNiRK59SGaTdDwZme/7d3UrxuiC4zBNMwkMG9ksH8D+Sg7HVDVXoPRGyQewjQvmD2uE0COIP6l8TS2xIkn0UtjI98xnfFtNvMDJhvdV8O6jG/Yxp7JecMs4qo3V9aiLkR5K4Fzsrs0WR7Ca/ogPw+UhZZ4wHV+3n3tfzqB7jAYt6Mmkpbh/DAiRNBtclcqMsfS8uQ9+13DDBDoC9tsoetb4QNp8nUvCuc/ZKCa3Jzd53MkavFh7rpFTnfVw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AM9PR04MB8954.eurprd04.prod.outlook.com (2603:10a6:20b:409::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Wed, 11 Feb
 2026 21:00:19 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9587.010; Wed, 11 Feb 2026
 21:00:19 +0000
From: Frank Li <Frank.Li@nxp.com>
Subject: [PATCH 0/4] ARM: dts: imx: cleanup iomux related CHECK_DTBS
 warnings for imx1, imx25 and imx27
Date: Wed, 11 Feb 2026 15:59:59 -0500
Message-Id: <20260211-imx2_iomux_warning-v1-0-1c5233771b32@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAM/tjGkC/x3MTQqAIBBA4avErBN0KPu5SkRETTYLNZRKiO6et
 PwW7z0QKTBF6IsHAl0c2bsMVRaw7LMzJHjNBpSoJSol2Cac2NszTfccHDsjat3Um2o1YdVBDo9
 AG6d/Oozv+wHgqOJiZAAAAA==
X-Change-ID: 20260211-imx2_iomux_warning-5675f186e249
To: Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
 Jacky Bai <ping.bai@nxp.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 NXP S32 Linux Team <s32@nxp.com>, Linus Walleij <linusw@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770843616; l=2232;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=4ZuVoG4Tlk5YrVtd7ZlDJzbOcgkSExydEF8wGk7lXBo=;
 b=m0HL76ditFGOzGzEMjmu1F9ryMB5k3Oxg1K1I9qv/f/6gpOorfNlr/FHVVxAWmgOkGmQfdHD/
 egeRXLA6xLnAvNt8u5k/wWiPJerdE+jF8hi+novwmqOnnoL6LYanOR/
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH7P222CA0015.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:510:33a::28) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AM9PR04MB8954:EE_
X-MS-Office365-Filtering-Correlation-Id: 45ccb1fe-25eb-4483-5a9b-08de69b09093
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|19092799006|1800799024|376014|7416014|52116014|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cGd0anJWcDZPMDdWM1NLc3Y4R1dHdnc3ems0WSsvSTRpYnlTZkUxQk9HNnRt?=
 =?utf-8?B?a2ZQcnppc1prdVg2ZnFMKzA3WVJPWVV6MXBxRlBHaG9lS0J6eDhWa0hERjNj?=
 =?utf-8?B?SlFJY05kQnB1blgzdjY2NzI3OW9FRFZuSGFJTmdqRUhOanlULy9PeFhXbi9o?=
 =?utf-8?B?Z0xmZXAwK0RNY3JUalNqK2kwWmRYSldLc0owM3QwQkppY01lRnhobmhpcTVV?=
 =?utf-8?B?cWc4WEtFdlVKYzdHcmRRdUd3OXE4UHJ4YWRnNi9iZWNIMkc1cVltcFEzR1NI?=
 =?utf-8?B?UmEzcnp4Qzc4S1RSK3dIR2xUNkJvSjhKSG1sQlc3T0dVdlYyVDU0d2RXTWJW?=
 =?utf-8?B?b0p4WHZsZXBrNmVWKzlJc3h0WEV0OU5VQWJYTzc4RDNTTXhIUnNIcE14azY2?=
 =?utf-8?B?VXJPd09OcGExbWtqaTRiSmVyNEtvZDZmc1F6Z2NnbmxMbi9hRXcxNC96Zk5T?=
 =?utf-8?B?QS9PMVhYYUQ3WVl2Ylp0eUljVnJLUnBuR1hOL2JLNm8zOFlxTnNlTTVXWm03?=
 =?utf-8?B?WlZ4TDB1aDhRRFlpSkkzRkpGS0tLcnFONzNxQlJ6NS9HaDhGa0ovWHQ4WnNx?=
 =?utf-8?B?NjZCZlo5R1FiMnFIWHIvKzRMeGFqMjBSWW1MWndtU2doZlhKNCt1UFNjZnUz?=
 =?utf-8?B?bE9DZUFTcHF0YkYvd3MvV0NtalNnQnkwZFJub3pPNmVWNVQrbzJKRjVwR1gz?=
 =?utf-8?B?VEc3VncwQnRqcERpQU1lQitFMHM4RWlDVGE2Q3d2SzFJWTJpNDdMV3doS3JM?=
 =?utf-8?B?V3ZuV1lqOWdQek42NVVIYzZJcWhKY0ROZ3FUZ2dJOWdsN0tlUEFHdkRHMWho?=
 =?utf-8?B?UTJLY0prdEhyN2tzdHJmWmppTzRQMDNaT29USExKV2FLei9DZ3g3cGVEOTMw?=
 =?utf-8?B?a3FpNTB1WThjWkJ2QUtMYWZKWWM0bW9jaUxmTTkrUktld0t6ZUpJdnNlQlZR?=
 =?utf-8?B?MlhOb1Z6bGw0ZHFtRHpEc0pVdWg0eUZKcWFFc1pTRWJORXJodG9seERXRjNu?=
 =?utf-8?B?N0RVZWRmdDFlbEVMUEVaNTRpWFpEV0NGMEMvMnpxd3VabjZKcGpxcGNzc2tz?=
 =?utf-8?B?SC9hTmhsT3FhKzc4aXJMWkc2bGMxdmVTTHJmTnZuYk8vOUR4amxDMHJpNjdN?=
 =?utf-8?B?UnAzR243bXhXdlMvSjJXQ2xGYVN6ZUREd1hTamw5a0JFakhPMXliNEpadndi?=
 =?utf-8?B?eTN2QXZWWHZTYU9oUzFrUUUzV2tZTkhPT1pRUHhTOXRhUkZSR2hUMTVHQkN2?=
 =?utf-8?B?d1NEZ094NE1kRkFGZ0JiOUoyUFRKUGtNNzFBazRGbVBsV1hnb2l3U04xQlM4?=
 =?utf-8?B?ODA3eGJEdnFxNUF5Qld3YWdyMDQ0STRMWTZVcU8wTlg5TU1RczdhcWFucHox?=
 =?utf-8?B?VXJ5dG90OWNGY2w2NFJHWGhRd3gxZHBXKzVaY1pMKys0YUY3WmttZ2QwQWFl?=
 =?utf-8?B?L0tpVGZ1Y3M3M2J0VHBZUmUzeWRRRVhqTXdQcXBENURhTHR4Y3gxcG0wMjdx?=
 =?utf-8?B?eTFVR0RhMTk4KytOaCtoVGxRMXEvNm5NMHdLVnZnMUlSdEdDbC9QTUxyQWg0?=
 =?utf-8?B?WG5hVitadmFWNk5XeDhOOVlYSFZBWlN2eEptRm9PSWJuM2JrbS9CejhURnIw?=
 =?utf-8?B?YnZKTCtxbDRSb3cvYmxnSFJjUVVXVXF2NnFqL2Y2UXJUMnlxSTk4T1ozeE0y?=
 =?utf-8?B?NG84L2h6TDQya2NYaXRHa3BVUlkwNkgvdkd0VElzQjZHRkxjeUg4UENJL0VX?=
 =?utf-8?B?MW13MWFrWXVrRXFYbmRBaGdWSC9IUEJ5QjRXczMwZjB1OEZaRWoySG45Y1hv?=
 =?utf-8?B?L2I1MHE5N1RXU1d4a21rTHFPNHpudVdBYUZPa3Z4dVNJeXhmQ0pyQW5JMXRo?=
 =?utf-8?B?d01GRURSRHl5VmRXZXpRRklWR1hnYlZhb3VkYnU5Qmo3b2p5SFRjTVFTTkZ5?=
 =?utf-8?B?eWpSQXlFODRDeHVUaVF1aFhEOVNDbytBVHNURTJxUUFPZGRHK2NpenFQOTFO?=
 =?utf-8?B?Z3RPZ1h5T1hQbWIxZ1pJMkFJYVZOb2Nvc3pDY0FxWnJ3RTBTa2k2L0lZNGlx?=
 =?utf-8?B?a1JFOU5RbmhqNklhd2VQRGlJTG5JYWxGVWVEc3lYNzEvc2dkMStUYVhucmpl?=
 =?utf-8?B?Zlc0WjR3cGw2dHgwVDF2QzlIaTVFb2VhTVlROUx6NGRMVElyai81WWNxOVFs?=
 =?utf-8?Q?8GrgD4e+sPrSJ8nZaP7AiMhb4JkRo1E2AbPrnwqv5C2V?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(376014)(7416014)(52116014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aUsxYU04NEZHcU5TZlJOOU1IdzlVZlFMdnlPOFFpaE83OEFwMGFuUDNZOHE5?=
 =?utf-8?B?VjBxc2FwTHNhOUViUS9wNGVIMUxVaThLNDN0MmtoRkdtU3RBNzhUdExTV2Qx?=
 =?utf-8?B?RTh0SDJGK08wVHlRKzNaVVhGNVJ3N1ZBVWlwOFpwdWNKQ0I5MURUc3hqVGN5?=
 =?utf-8?B?QitBbHJsOXNrb0pZWldibVdDOXA0Q0RiVm5DV2REeWVjakIvbUJWQUp4dk1R?=
 =?utf-8?B?OWQyT01lWHMzazNZTTJNTWVCbURlb1VpTmg4Z3p2V0t5ekx0ZmRLZ21nQTRL?=
 =?utf-8?B?eXRVUmlRTEVFYVJvQkFFdlJ3bDNPRDVXT29IZzFCQUo5NjJybDdtdEZjSFBv?=
 =?utf-8?B?QTZuUTBxa2RHd1BkSG1sOGNKSkNkSG1OWTl0RlhwUGJSM1E1a0JVelVOSU1J?=
 =?utf-8?B?Rmkwc2xIUHYyN2RlTXlweC9UeC85dFk3U2ZaaUUxbDZ6UFBlNzRudXgwWmYw?=
 =?utf-8?B?bFNPemJEVjJzYm03aElsejJBbHJuZVZwUGVFcWpPcitaZlh2Nzk0Wmo4SmVW?=
 =?utf-8?B?Nlg5enFTM0ZyS0lyS0hDNDdSU1I4dWxaY2tJZXE4WmZLWk5TSG5GMWNoUXV5?=
 =?utf-8?B?T1FxNG5ML04yUVNiaUhGTDU5M1V5TUJ3SHpSNEhzcUNJbGVyUWJxRUk2WERj?=
 =?utf-8?B?ckZWV0NEMmxoWDVha2NQQkl0RGhLVVBoZzAybjN5ZU44cWMxaml5RnhhMy9r?=
 =?utf-8?B?Y3F3b3B6THJwcFdqRlhJb2tzSXBibUMvVFEyQ2hDQnQwNlZQc3Q3UkJSbkNv?=
 =?utf-8?B?WGhXa3luTkRLakw4aGdHQnIyak94M1VrU2tSUVBPOHlLeTlQbTJ5RE1PU0Fj?=
 =?utf-8?B?YmQrTUJLL2pzMnVzK2VCd2MrZ0FOWHFNVWRPVU42UUlUYy84MFAwUFExSDhv?=
 =?utf-8?B?aHgwaVphS3hiZForN2NJRW1iQ0pPNjIzRUxsUStIdEJYQ05pOVlId0tRVTJU?=
 =?utf-8?B?VmphZ2R0U21Fbm5HeFY2K0ZnTE5URlY3cEVOcmdVNVJGNnFvdkRGNlIwNVd2?=
 =?utf-8?B?T0Y4THdHUzI1UFJ6RkpIQ1dHM0tDTWNsZUdzOXd5NDZNZWVtTXk4cHkyR0pO?=
 =?utf-8?B?WWF0ME9tQ2lmelVKWDRBb1lHSVdHSktBWXdoY1ZxblBGd0pTOHlYSUpSYUJ0?=
 =?utf-8?B?S3RhdEJrZ2ZubUZIL0cvV1BxSnA5MWZWdjZVSnhBR3F0ZnhZTWhXTVgrSENw?=
 =?utf-8?B?d3lmVkErd01BVkxiV0VBazhGMGpGYXlPbW1XSEoxNENWZk0xOFErclEyK3NI?=
 =?utf-8?B?U1RtZ1B3c0VjUDErbnh5YnpzRUovcWM0SXRpYTJwZXBaYU45QTFBRG1jSG4v?=
 =?utf-8?B?SzRTVzJuaS9RYnVCMko3bFpLaG56SGJmcEFMbGJOb1VCaTIrc3BMRUFBNUVa?=
 =?utf-8?B?eFZYMWRScGhyYXozdk11WXp4bS9VTFZDbGMyRjJwM3Vhdm00dEFDWnBGWlZB?=
 =?utf-8?B?R09vc1B6OG04eVFuMXJ2UERIbk04TS96RmRuN0R5NDM0MFozYlJYNk5zSE1q?=
 =?utf-8?B?TDhtaVl2UjRWS2I2dEEvS3g0dC9lcWZOZEkyUXpZZHFSV3lrWFZxSWdhM09D?=
 =?utf-8?B?QWUvMCt0L2piVnZTSGxLNUhldFBDNVhzVWF5VDd1ZTBhSXNmdjUycmN2MTdI?=
 =?utf-8?B?dC9saDdzZDhVb0pYZjY2S25qeCtRN2Z0NEhpZDVqcDZsQm84NHd2Sm0rR3lF?=
 =?utf-8?B?UTVCTW9qZ3NXL2s1TEcvbTNuSXJjYndSQlRySEhFcWJuUTIwMzJDenhyMkpa?=
 =?utf-8?B?ZG5mSXVkekhYVnBmNGVZVUN1S1IxcWdDaWNkT0ZiTVZhZnNsVzRtU2syd1ov?=
 =?utf-8?B?Yi9LM1RRVWdmTXI1ZjZrTDVOV29WWlNMWmMyclJ1V0lpVzFCRzdpeHdwZjd3?=
 =?utf-8?B?Z0Y3anFKRWpwWWcxS1F4QklLVHN4TWVWV0lHQTRBWmZpSWlkakdWbXhWQ0E3?=
 =?utf-8?B?VENBeDhqZnBHUFlxdEQzWk56WDk0UnlQUlg3RlpDUDVWY25WS3I2cG9IRERH?=
 =?utf-8?B?eVM2eXpCOHF2aytIZlNtTmtNaXJSa21nZ0lTa0VhZSsvcTJQYXBVZERUWm5E?=
 =?utf-8?B?SHdJbzlmSGVuOGEyOFdXQVdUdngvdkpaNHJiZjR1VDdtNUpTSEF2Q2F3UmZt?=
 =?utf-8?B?T0t2QmExK2JLb1Y0VmVDNGZoVkdwYmJrVHNMOUV1UE5ZNUVTYlpYbjJPaUN5?=
 =?utf-8?B?TGZUa0JHMEVTd2plb3JvbFdXYWxBOG9LTTdaNXVIQlgxUDgvSDR3M2tpYjNL?=
 =?utf-8?B?Zjd0MVJveXFtTnZmclVCelhod2VCVWY1c2lyQ1lYY1hZamg1WlJmWmJOUk1U?=
 =?utf-8?Q?Ufgz+1T9etnJNnaFCR?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45ccb1fe-25eb-4483-5a9b-08de69b09093
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2026 21:00:19.6225
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dJxUGh0udt+ebxljRA3+flEOm0qZq9xhaCPhzG+PmE6mEP6s6bJmBLpepMzgkdZyKNq23w85nzRomkuZI6Vi3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8954
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_130028_031763_8F8593EB 
X-CRM114-Status: UNSURE (   9.15  )
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

Cleanup iomux related CHECK_DTBS warnings for imx1, imx25 and imx27.
1. convert txt to yaml format.
2. rename node name to pinmux.
3. remove redundant intermediate node in pinmux hierarchy at dts.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Frank Li (4):
      dt-bindings: pinctrl: convert fsl,imx27-pinctrl.txt to YAML
      dt-bindings: pinctrl: imx35: add compatible string fsl,imx25-iomuxc
      ARM: dts: imx: rename iomuxc to pinmux
      ARM: dts: imx: remove redundant intermediate node in pinmux hierarchy

 .../bindings/pinctrl/fsl,imx27-iomuxc.yaml         | 126 ++++++++++++
 .../bindings/pinctrl/fsl,imx27-pinctrl.txt         | 121 -----------
 .../bindings/pinctrl/fsl,imx35-pinctrl.yaml        |   1 +
 arch/arm/boot/dts/nxp/imx/imx1-ads.dts             | 108 +++++-----
 arch/arm/boot/dts/nxp/imx/imx1-apf9328.dts         |  92 ++++-----
 arch/arm/boot/dts/nxp/imx/imx1.dtsi                |   2 +-
 .../boot/dts/nxp/imx/imx25-eukrea-cpuimx25.dtsi    |  38 ++--
 .../imx25-eukrea-mbimxsd25-baseboard-cmo-qvga.dts  |   6 +-
 .../nxp/imx/imx25-eukrea-mbimxsd25-baseboard.dts   | 134 ++++++------
 arch/arm/boot/dts/nxp/imx/imx25-pdk.dts            | 190 +++++++++--------
 arch/arm/boot/dts/nxp/imx/imx25.dtsi               |   2 +-
 arch/arm/boot/dts/nxp/imx/imx27-apf27.dts          |  58 +++---
 arch/arm/boot/dts/nxp/imx/imx27-apf27dev.dts       | 194 +++++++++---------
 .../boot/dts/nxp/imx/imx27-eukrea-cpuimx27.dtsi    | 228 ++++++++++-----------
 .../nxp/imx/imx27-eukrea-mbimxsd27-baseboard.dts   | 194 +++++++++---------
 arch/arm/boot/dts/nxp/imx/imx27-pdk.dts            | 132 ++++++------
 .../dts/nxp/imx/imx27-phytec-phycard-s-rdk.dts     |  92 ++++-----
 .../dts/nxp/imx/imx27-phytec-phycard-s-som.dtsi    | 174 ++++++++--------
 .../boot/dts/nxp/imx/imx27-phytec-phycore-rdk.dts  | 206 +++++++++----------
 .../boot/dts/nxp/imx/imx27-phytec-phycore-som.dtsi | 154 +++++++-------
 arch/arm/boot/dts/nxp/imx/imx27.dtsi               |   2 +-
 21 files changed, 1115 insertions(+), 1139 deletions(-)
---
base-commit: ff0a13607e585c9e2158911d0173b9a47ac8624b
change-id: 20260211-imx2_iomux_warning-5675f186e249

Best regards,
--
Frank Li <Frank.Li@nxp.com>


