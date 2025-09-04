Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9998CA1002
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 09:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b4LrV5039zmXiZB4R2+yiz3v81A0BrqjClljoXVA8DA=; b=oJq3llQtv/G7e1OEjV9qF8XT5M
	iaXxKkn0WvdtjyhKiB3/z2riTN9wC1hav9TxDU4RKrKJSuTw2HUXkFbz1Go6kSuoD6aW/nwx2JciP
	3VRzTreItkZ1v6hb9A3fO22m+o0kUJtLqdmhxt/Gz1C2PEUSj/rdJVEc9kgyhKB1qqQxZ9VylKLbu
	uZgUaeh+3IjKt5sQGfHi4wMOURsKUduKorWgdTsKzvry+cf5rr9pQwW8cmCa1JmXwJbGa/PUlplFi
	/38yupFYvD7SBTvp/zKecldtovg93du3XRGYs7n0nd3Kx2808NcQ+YXHe3lTJZUkJOszqgWhrem3o
	n3xbeu9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu6Sh-0000000Acka-2F5z;
	Thu, 04 Sep 2025 09:40:59 +0000
Received: from mail-swedencentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c202::7] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu5Ta-0000000AHhs-0yWg;
	Thu, 04 Sep 2025 08:37:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R/mFmJCdM58kP3XMx5fOLLyqhuytzY2FZ0rNFEK94tHiYP5yrgr2Shytf+Oe/LkoPfwZNwQB+pVZtkXqoA0wu8OLuomC8SU5wnJf1O7PjGcgQpQR/OGquzOO6Jl1g1iIMEN/VVvR8n4kE7L/ZJisZbKTiHv93M/G8Fm8XEOMYpMUQUHsE86sD6a8Nf9nsfrnHaaf82Z6583yaFQoOQgZrWMtPvDbb4m8PCyfTizds/F9sJcV09NGnflCCbhhAlwN+BsAmK3CK+KRo22/lX88Nhwbi1bR4zVPgHZY3at4krq+pdecVhC4n8zUww4lMJBkPuP0kqVz4z1E33g6eQVI5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b4LrV5039zmXiZB4R2+yiz3v81A0BrqjClljoXVA8DA=;
 b=VK1yQ6XpqdUIFhUuvIR9TbuykANP/DpaGbJ/WXkgBS9QzmOC3kddYiQ6A0qGNGN7/dYytdqXsN7aozDYnXJ7x3kVJ2rAgMlwiTXmCpVWyk2RxgYNjLv9af3+Mt739FMrQQJtrbeSqBkTYZt7GDdHuIM8EwPDvvoJL9rWbiNpeLxbLV4E0LUA/Ruc+dcZevfiHBHhJCDPe/4OviextW8Vz8iJm7VzKpfMU/ONMKjS/hQmUajjBtwGWpes0WAs/e54DkHQE4VTC7Dz0DTYuUy5sywNYV/SfpJ2vhyNzRzQRsysqUiRcvryiJK5Dylzcv1qloVCcMrOAjq+91CJK192Rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b4LrV5039zmXiZB4R2+yiz3v81A0BrqjClljoXVA8DA=;
 b=Osea4vEumcTBv941Orfsc9KjCxj0vTQuDlkCdFU34Q7rz6HFWWcB/+C0B9Jsl2sxdBcwg4pBM0mE2Uu7n4QdvJv1AFQoqWeOvqkkQFv2cpNl1LGne0CW9Pn/W+jUUnJRZGj7HWWU3FtSE7vmenqTsglyWdtkN4Kg90FiqR+XxDeBpM2qc3VHxxjvc/mkYEolA9nwXmKfSMlRIZJhuuArqM+vtF8WnCsBljoyRji4JnG5wVcHqHws+QiTzrzts7MXUA83WVxx08yaTQDafUA3WTMwPwxJZbGW4dOtmg4bja6fr/MntAC8UIo5U7aKdnBqykA/PK+7sAE2h6wa3pOX1g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DB8PR04MB6876.eurprd04.prod.outlook.com (2603:10a6:10:116::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.16; Thu, 4 Sep
 2025 08:37:47 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%7]) with mapi id 15.20.9094.016; Thu, 4 Sep 2025
 08:37:47 +0000
From: Peng Fan <peng.fan@nxp.com>
Date: Thu, 04 Sep 2025 16:36:50 +0800
Subject: [PATCH v5 7/9] arm64: dts: imx95-15x15-evk: Use phys to replace
 xceiver-supply
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250904-can-v5-7-23d8129b5e5d@nxp.com>
References: <20250904-can-v5-0-23d8129b5e5d@nxp.com>
In-Reply-To: <20250904-can-v5-0-23d8129b5e5d@nxp.com>
To: Marc Kleine-Budde <mkl@pengutronix.de>, 
 Vincent Mailhol <mailhol.vincent@wanadoo.fr>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Aswath Govindraju <a-govindraju@ti.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Frank Li <frank.li@nxp.com>, 
 Haibo Chen <haibo.chen@nxp.com>
Cc: linux-can@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Peng Fan <peng.fan@nxp.com>, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756975018; l=1466;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=gCIkVJ5687w4JC/iXH2zdfPKdy1y9n7kFucnRZ0EZx0=;
 b=BG18LmANFjr3/XoQTB5rm4EBDRWiwHiFL1FxtRJsEwTEkPBgQtqDYNw15zIQTN5ltOc8EBQRc
 ZWBO3l/0e/4DG3726MKumdY9Ig2BfK5mmOLcjzpJnMIa2hPLJPWFDqs
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SG3P274CA0008.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::20)
 To PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DB8PR04MB6876:EE_
X-MS-Office365-Filtering-Correlation-Id: 5abe24ac-baf9-4139-5888-08ddeb8e535d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|376014|7416014|1800799024|366016|19092799006|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dUhoWVo2bVJKdEZFZWYzcEFsWjRhaEFKQmNyMHppU2cwSXBzTkg0ZHFGaGtm?=
 =?utf-8?B?WTQwYUk1Sk5GOTBkSVJHbHBtUy9pWG9kVWVyNFNRR0VIWWVCeEhDSllHWFRt?=
 =?utf-8?B?TStwQk9wMVJoTXA4L0xucnRMRDVaL1RGMWdWYmZUM1ZwRitldW9CZW8wZXFD?=
 =?utf-8?B?NWdSZHFyWTJFc2EzdGlGd2ozQzhWQ08xQ3NxbThUWjRlT2taT2liOWUwK1pH?=
 =?utf-8?B?TDMwaWl1d1RPVmdlYUUzV3h0Y3ZuVGw3NUpGNnN4NnpxNENmZ3FnVGRYSTcr?=
 =?utf-8?B?RXBrVFloNUxlLzVML3VBeCtxNjZCc3Z3cFFQRTJBVTJ3aHk2YjJPRHhucWZq?=
 =?utf-8?B?S210OG9NZi8wNVVrSkFJK3MvTDRyT2M5a05YY1hIVXpqMXFWeTBNZjJvRjRU?=
 =?utf-8?B?VHhZamxOY0ZZUTFxVERwM3pPV2VKTHlGS29wcUUrYVhYVisreldRMXJyMHhw?=
 =?utf-8?B?dzcrb01aYkh6Z2xzRWlWM3h1ei9ObS8wZ3dKaEZEalQ4U05TYkVhZ21aTEZo?=
 =?utf-8?B?cDNDRWtSQm9aUVRjaFc4Qy93d2VXM1RUVVcvTVkzcGx6V05PeUl6S0Q0b3NG?=
 =?utf-8?B?Z3I1TnF3RXp1QWNYUENQOHFsMW9nQ0dOQ0hLZ3ZlVGRFR01Eam5NN1VockNN?=
 =?utf-8?B?b3g1djVlbW5TZFRCdkpVN0YyUHJldFo2ZDdjdkMzQzh1d3R2ZUsyUlJoeGNu?=
 =?utf-8?B?VnJCVS9VeWZsV1hzNWszRW5hNGxIY1FUUXhwbUJoOElKanQzeE10RUgra3Ur?=
 =?utf-8?B?K1JBcUtHZTFLUXg5N01aYnNLdDc3bGpYR1QyOXBwdmRtWlRKcWZoYm1Mb0FX?=
 =?utf-8?B?S1pWd3hwT0ZVaW9CY1dxWlFmamRxK1laY3pJQ2crWThSSmY5a08vbE5mNDgr?=
 =?utf-8?B?R01yaFMrNk1EeWRneWc4VHhWS0w5TmdaRDg1aVRFUXZyUTZabmNqRmtKbTZK?=
 =?utf-8?B?Skd6UFpHa1BQYktmRlp2SXV4WXIybGlzcjVTZUQyclVWcDhjZGN3RWxjMmlT?=
 =?utf-8?B?QVJ4bENXY0JwVWcwancwcEpsdXRHMkFxUDdEcFIwMVlNQ3pKQ2NMdmswSzYv?=
 =?utf-8?B?WlVCTUtLZ2Y4amRMaHU3N2czWkRLeDNFMytXcm0xR29Vb1JzTmVOTk1ZaFM1?=
 =?utf-8?B?TUFkNG0wTDlITTFjS011dW4xRU1sQ3FaY29GbE5sbGd1TjY2RVBjQXorMHpl?=
 =?utf-8?B?Q2pEYUxsdjl1aFNpZTZmeGVTQnAxOGRlRExWeVY0UnNaTFpMa0pleERHRDBH?=
 =?utf-8?B?cFk4VXF0Qk9CZ2dXenNRUzBHVE1WVHFvN1AyQTRuUzhvbURLS0dlSFRvRVBM?=
 =?utf-8?B?Z21iM1VPclUvRHhWQWdSalVIUm5hcEtvb3MyYmprcVM1ZnNNOGtXOTNyZWo1?=
 =?utf-8?B?aDQ5VDlyakpBUDdMVy9xaDIySnlOUVdna21nZGtvcFRvUFN0LzRyQ25XS3p6?=
 =?utf-8?B?UEFvQndmUUxueXJtZ29tc1N1K2ZvV09PcnZpRVhtTThyWVQwOElNaGtUSWVJ?=
 =?utf-8?B?alJySzFtalA4aEV2QmFVWHhmOWNJd1k4cnVCWEZMMkZiaURoWGxtMmtnRkZk?=
 =?utf-8?B?SnZ0MkpESmxlV3dtb1ZkZnVEQzJQSUNlT2EvNzdxM1g3VmIrUTFiSXdyQ1VK?=
 =?utf-8?B?THNZZUFpYWp1VUJvWFU1YWRDT0t2U29WN1NkOG1SSDl0elpQZSt2bm1rTWd5?=
 =?utf-8?B?a0krcDFxd2wyYXpNOEJUd2ErSzREdGdqcy9LczlQL1ZWUUR5elNtQnpvSXFL?=
 =?utf-8?B?MDJXRVNLQlV6UXlwODAySkhicjZMMGxYQkJvLzZTcVZJU1pQbUZINi9zZDJZ?=
 =?utf-8?B?bDBnM1IxbXhxelp3RnlNNXluQThGcVlCMGF6aG5VTThNVFBqTmVSMitDNlNx?=
 =?utf-8?B?b05malNsanZwSUl3d3VuMkNuMU1TYVUzTjhZMGswYktyek9zd21wM3RVSHlY?=
 =?utf-8?B?Yzc2ejIwU2FwR1RyK3V4QTBQSTVrazhMNkFnUkhoTFNydmlnWWxUd2RtQmRW?=
 =?utf-8?Q?qMAtPIbiBsekRvG+BKazYmQcCDiBUg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(1800799024)(366016)(19092799006)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R2lQZ1RkZkZ2aGI0eVpOc2F2YmpOc2tQcmpRSDNQcW9UVmhpbkFZbFV0MDZP?=
 =?utf-8?B?dUpDS1FTU0dzY3hMeDBMNWp5TUo5QW55Z3F5bFh0THpGemtmQ1hNdUNWdmRR?=
 =?utf-8?B?MnZWVWpocjB4VHFLdFZVRkhXTC9kNVdHa2hGcmNsa1NJMndlYnh1NTNYVmh1?=
 =?utf-8?B?cjY3dDlmeWVmWTlrRmVJOG1BTHQyUzdVblltYlV1ZU1ISHA5SFFsY3puSGVI?=
 =?utf-8?B?ZXFvMHlQcUsrREZOQUozYW1PMDhHUG5PMmlVbWxzRHdwY2FscGJUakY0M0hG?=
 =?utf-8?B?cCtXM25yWmEzS251REdlVnhsWDFRR2gxeUlUb09xUVFvZ0Q5bFd5TE1zWTBn?=
 =?utf-8?B?blRrRFRiTkhhbkU2UTl5T3h3K0FPNklMK2l4SjZxZjNWLzdOaHZaY2dPRFpF?=
 =?utf-8?B?VXFQNWRaNFU2WTUrR2JxM0NQVHJrWVlWQUVGSEJRT0RXYk9kV3lTRkFGN0pw?=
 =?utf-8?B?Yno2VEdqSDdGMFowWjFBakpaaHVQSUdQRUFNczB4M0ptR0FJUUJ6dkU3eHB5?=
 =?utf-8?B?TWdmaHQ5U3FPaXp1WkwzMnhMcWNyY2Q3R01IcmM5V0x0d0FPUEovZnNvSzZs?=
 =?utf-8?B?MFh3aVh4UEJOVzNRZmVtbytnczJaeUwwYmhtczNweHM3T0Y2dUdzdkkrb1Zz?=
 =?utf-8?B?dmtVRzhkRnJYL2tselJ3dTRJVXgrZnVKa2J1M2JleTNwN1JWUDhzQ1dSNE1S?=
 =?utf-8?B?RnpObzJOcXlVa29nOXFXOEF6emhPM01EUXlyTVFWOXhvWmtCRjRnUlBnYVQ1?=
 =?utf-8?B?SEg0NzUvR3A3TS9ndjNoK0hXdW91L1o5bzFvYmFzVDhhc0NnMDlNMzBJYWF6?=
 =?utf-8?B?a0ROYmR2ei80SjlzY2VxY3VHQUZGM0UrcGQrYUZ3Mk9RZVJpRjlyTHQ0Nnky?=
 =?utf-8?B?NHNML29nZmlULzJ2TExpRGxGNzBROHZPSms3Zk1zb2liK0NncjZ5NFh5NnpF?=
 =?utf-8?B?dE5VM2NHbjdXTnBpRjFveXU0QmlEbEQ0d0dvS296dGZySytONlU0L2tJRHJ1?=
 =?utf-8?B?b0dFU0VWYVlhNUY4dytJbjB1SzFqSGs4SFQ3bHMwTTFNRnM0Yk8ycTVrbThj?=
 =?utf-8?B?M3MxYys1VjkveVJJRm9Qanc2eUIrV3dDU1RBTnB5b0NseWhLck1CNTU5Mkpy?=
 =?utf-8?B?MjBjTFpwOTBTdXlyOFNobmlUQjh0cHhWYmlqMWJTYTFJQ01QUXdrSEJWSlJz?=
 =?utf-8?B?K21uTlh4MUVCWFd4OXBwSnZYcTB2UmxGVDJDbUtWMzFZdzFLRVpiaWZjd2Jh?=
 =?utf-8?B?Qlh2N0lNcWswcFBjTEx1YW1ORktiTHpkYmR6ZlhPNE5kc3pqQ1R6ZzFjTWR6?=
 =?utf-8?B?RVZUZWN6OHlhS1VadlFFZDN4SWFDVGhyWjBUdUJEU1dMdHBSdDE1S3BVWHRa?=
 =?utf-8?B?R1VndzFoT05uMjI1T05kWThkRk9QTk9nL01NbHUrdy8xbldpM3hFTWJYWDZt?=
 =?utf-8?B?Q25DZk5HU2tIM2RVeEFEMGQ2a2tWcEZJUEZqejZWcjJMZHM4YkF2VnJhV1Jj?=
 =?utf-8?B?QnhwVUExaGVWeW9BQmJueVBRbnhZTFFhOFVzTkYydVl4bFFpVmU2OGlISmxP?=
 =?utf-8?B?d0VUTkFnQXVkSEpQSDVpZ2MvRUNpQURVYm1SQ1h1eEFFM2hiMFBycXNBRDZF?=
 =?utf-8?B?Z2Q5eVFvKzVXWVV5ZWQrOUprRGJJM0U4OXJiR3NqbmJJeDNpOGNsOUxTSTlN?=
 =?utf-8?B?ZXdrUUplV1p1UGo5dGxDWUFJT1Y5c2FteFVSWWZDQ1B6cTVIc25jSnFtMXF2?=
 =?utf-8?B?U3ByV3FUMFJSYW1PTEZLczJUS0pEZjkvUkl5NWhvQjdPRmZwbWRDR05PWjBR?=
 =?utf-8?B?aXlqSWhHSkh2YlZPR2JLQ0xJTWpuNENXY21tY0xmVW4zQ0lkVmdHakxjSHFh?=
 =?utf-8?B?aXRWbWtpdEI2Q0pmeVBldk9XckVVcWtEbG1YNW0wS3hTY3dwditUanlMVkxh?=
 =?utf-8?B?RWhwczJ2WnVlcjhXaEg3Skdld0licGxCNU0vT0JSOExmOG95M3BMeDhYL0xy?=
 =?utf-8?B?WSt4aUt1dmNzeEliRVhWNis4enB2UmJEL0pUbWtBVnB4MmF6WE9GVjlodjgy?=
 =?utf-8?B?V1c2WFBhTllIL0h1K0cxeGtSTHNZQTNQdzZnMHAyYmVLYm9iZll0VTNPanBU?=
 =?utf-8?Q?4btkOW8ez3iWigruLgrpAR66q?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5abe24ac-baf9-4139-5888-08ddeb8e535d
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2025 08:37:47.4756
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZJVH9r995Ng0jMJwyKc8mGnMpOb5HhIbVRtr4SUA26PWse0qVinFegp/CTBzpB1VL5MQ0oyJpBsXpKjEraddew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6876
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_013750_276096_2516FEC3 
X-CRM114-Status: GOOD (  11.07  )
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

The TJA1051T/3 used on i.MX95-15x15-EVK is actually high-speed CAN
transceiver, not a regulator supply. So use phys to reflect the truth.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts b/arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts
index 148243470dd4ab03afdae949c8316f31467d1377..a15f021498869918945405cc7f34ea7e27ae6aea 100644
--- a/arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts
@@ -106,12 +106,11 @@ reg_audio_switch1: regulator-audio-switch1 {
 		gpio = <&pcal6524 0 GPIO_ACTIVE_LOW>;
 	};
 
-	reg_can2_stby: regulator-can2-stby {
-		compatible = "regulator-fixed";
-		regulator-max-microvolt = <3300000>;
-		regulator-min-microvolt = <3300000>;
-		regulator-name = "can2-stby";
-		gpio = <&pcal6524 14 GPIO_ACTIVE_LOW>;
+	flexcan2_phy: can-phy {
+		compatible = "nxp,tja1051";
+		#phy-cells = <0>;
+		max-bitrate = <5000000>;
+		silent-gpios = <&pcal6524 14 GPIO_ACTIVE_HIGH>;
 	};
 
 	reg_m2_pwr: regulator-m2-pwr {
@@ -317,7 +316,7 @@ &enetc_port1 {
 &flexcan2 {
 	pinctrl-0 = <&pinctrl_flexcan2>;
 	pinctrl-names = "default";
-	xceiver-supply = <&reg_can2_stby>;
+	phys = <&flexcan2_phy>;
 	status = "okay";
 };
 

-- 
2.37.1


