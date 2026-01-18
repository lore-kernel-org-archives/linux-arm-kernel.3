Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 006BFD4A5F4
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Jan 2026 16:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WBF4k0F+B5SMUxaMnRzNewxPWXXvN3yT7disMFt4lmA=; b=fU8yRmj81I1Vl+/uRAghY1XE7G
	4FUrjNZIicSW506gR5vi09GFDUYajcO7MvA9COZM7BFb3yHp0SWA6DZp3+ola6ePwnTIM/ZWmHLPJ
	x1K67c1hFLGONYcGtiJi2LhDm/TOYx6IuG/m/Cw9UMD3Ab02lhmPD6zLsVqZZpJGZEfX4l58rzhwD
	/F/cW3YsRm+0le86I6Car15hRKIZ7XG1E1Hd+mPhovnoUo/+qmKBBv0Smo32JRYl7+Y3Sjj1nBUHF
	XSpj27AgviDUK/6jJz7Zcqk4Tuq5TP+eufKrSxINaAXZjm7/c0yUyRfK41sAk3G2KUjROnusOd6o0
	Mgaq/GNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhVeI-00000000TWT-3Tgp;
	Sun, 18 Jan 2026 16:29:10 +0000
Received: from mail-francecentralazon11013050.outbound.protection.outlook.com ([40.107.162.50] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhVe9-00000000TIu-2yN4
	for linux-arm-kernel@lists.infradead.org;
	Sun, 18 Jan 2026 16:29:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m2ZHJ2Gjb0Za+OgQmJ/CcB31JDNELfSgwYX6YjUAXMGiULMCSMm8VTPqkyidfKxEbmmZNKi2XTrqeAGqIxz4FFqTBwefAkfglwR3a21hOAk+1DO+IRIBPTmsuX/jTDPiwap05R952AKkl3KNixtaqmPOfnxxH51PoG4UA1BdkuIMXXbGIsWnPFD51CX39sBml50d0Uo4n9MNmlCuTp7k+yML1y2E7xapVUMF+LbWgXdhc/qDps8xRP35RQP0T0EhjBZ1uO+KuUleBYJh8cyDnknV/OoFEdqaQ14GhYX+ZqvkBNH9iQYzyXhWdN02uW+N2TjcRk+oFwq++j3vN2AckQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WBF4k0F+B5SMUxaMnRzNewxPWXXvN3yT7disMFt4lmA=;
 b=Zj3EnIt/bllMPWTymx0R0rJxRiugehsL+ZPkSlfXcK2RZHrXadhLTwrIrXa0u4Ty3KoauXsox4gqTbcJ7hsmCauT1DzFL3zZn0lcLV/kxJojPb6pqMVer/rQw5MV1N/WkwP9vNkL1rnuFU1xVwCbidqFJ7P8Oxe1SM00sLguBBGpDkMGT7UqmVmXrqcr0+/Kakw7cvwkIvNWOqJomnrH4mq8hL2FeLt+0wUVmzpLHD7wCCRMAdmnpOht+Wjq+jxNp78OXS7BW7AfohDtahVXij6ZWGWitVmk9kF73FqD/bUcTG5rmNcxn2mwh3TV5f1kgSNjrZt3WyHaU1r27uD4TQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WBF4k0F+B5SMUxaMnRzNewxPWXXvN3yT7disMFt4lmA=;
 b=eCFmWzU00r79AOgoYYxiyuoKQoD/zR411m9flU/UCZ778fuGl/0Heq4wVgIIqkqSbpZiPHvp45rI7wioCuAYKsjLPvNmQstEgBzuTHloeiaNi9xlZ/AY+lvGySxdcjhb/NuPvO4TpQX3/6BYbP2qiqeidNGIdDc2lWg+OPofG2EyvbnWb5D6DOc9mppWTqAOnVpIZd9xarEeCXHiLJuhs1NxonJeiyxfvkuQIO+B8bQsS73GAUmZ82EoIbnHznm/MQ7bdUV1J8P5SrBNQyEMzSUBrHPqKf4e2eK4GaRK5SMd00RO7iiqxwpR1lXVbPIY+fSXBBvfqMvfjiTYKzdODg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by AS5PR04MB11348.eurprd04.prod.outlook.com (2603:10a6:20b:6ca::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.11; Sun, 18 Jan
 2026 16:28:52 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9520.006; Sun, 18 Jan 2026
 16:28:52 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Sun, 18 Jan 2026 11:28:04 -0500
Subject: [PATCH v3 7/9] arm64: dts: imx8mn: add wakeup-source for usb phy
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260118-misc_dts-v3-7-d3564716cbf6@nxp.com>
References: <20260118-misc_dts-v3-0-d3564716cbf6@nxp.com>
In-Reply-To: <20260118-misc_dts-v3-0-d3564716cbf6@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nsc@kernel.org>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-kbuild@vger.kernel.org, Frank Li <Frank.Li@nxp.com>, 
 Li Jun <jun.li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768753702; l=750;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=/VWZbS+hj41hTosxD4U940fd60kDz94wX0PuVEj/l6E=;
 b=xu+uxkYW6+EOy4wo1wbZC6/CeRtc38TXISOa3ToKMO0KTJcwKupGD7dH7ys+TMw6JlAhw0Ukv
 LaVy7vHt9VpC8TYHk370I8bVQJsPZYrps0Mq1uI+cdvbh4WP1aBXiIe
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH7P220CA0158.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:33b::34) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|AS5PR04MB11348:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c5728cb-fcea-4ca9-a882-08de56aea85a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|52116014|7416014|19092799006|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M1ZlaHBUUFRLcENZd3lZZEp3cjhrRHl6ZktHc3VWdC9oUVpLQ0JhVWNMZmpm?=
 =?utf-8?B?bFloVy92NFFtMGNTMW1JZUtCWmk5cVVwUm5KdUhmVGFKTDFJZWh4STJSMHk4?=
 =?utf-8?B?T3BCSDZjM0JtcTB1cXhoUGg0QVhpRUd4eVp3Z09vSkhQZ1daV2RTUFp3amNr?=
 =?utf-8?B?NEpxeHNrdUYydnBhMTBMSUZXVjVrbjlrRXk5Z0pRZENDOVJOWThyYmZhOU81?=
 =?utf-8?B?R0QwUVhtajNRR0JFWlNPQWVzWWR1NUlkVGxMNU5odkpxVE01aVN4SWVRMm00?=
 =?utf-8?B?L0JOcmtoL2hXSEYvL2Rkckc1WWMvSHBnN3dIdExDUDg0UXMxbU1zTUNURTUz?=
 =?utf-8?B?OGJqVlZEWXcvMVJzWVBSV0xWWGVGbVpvQ3pVOXhsbUxRM1llU1h4MXIxZC9I?=
 =?utf-8?B?N1ZxV1dwQk54VGNOd3pPQ3BKRGNRMlJ6cmwrL3BLNXQrZFh4c2JVQ1BkQnVy?=
 =?utf-8?B?Si9FdTY1Q28xbXlKa0p2MmQrc0xzd01UMi8zRm9EdzdzTUIvVm96TnlZWmxR?=
 =?utf-8?B?UWFIbTBXY0NwVVZwL0JnRXMwemJBZXUvNktzblZYcEpxY0xKS1JtUW1OL2dF?=
 =?utf-8?B?WCtiM2ZaVEFDTS9nbVg1VjNKMUlMVWF2Z05rallwMWdwSjNyd0xGVUdnQSt3?=
 =?utf-8?B?RUVtVVFJNmxzdFRnckx3MXlNVUNteFdVWHdObXV4dXl5Ni9vTDVYbGdscnlh?=
 =?utf-8?B?bjVTQzVEZldZcGMwanJ4dWRKZjloY0NiNnMxVnBhWFFXcVA3UVU2Q2NCb3FV?=
 =?utf-8?B?SkVxYnlqMHBoWG0yVm53WGcwb2RKSzRJZStkUjRXdEo5K1N1T1lGT0RZZHdk?=
 =?utf-8?B?VktOTGh6bEQvS2NwU01TYTQ5YVh2UzZvOCtrSlg4WGVrLzBySlJTM0FPQnRJ?=
 =?utf-8?B?K2lVK1BlVGNOb0poUlBtV3FYYkJ5aHlZVm5IYzNnd2ZCUkttR2p6VlNOaW56?=
 =?utf-8?B?TTI3eG5PUjJkeHJCWVZuMC9ZRUtrRmZvdDIzYW9WSmNINm0yV1dMR3NuTkxB?=
 =?utf-8?B?eEtWa3pmYTBuMC9TeHExaDFSRXpTOWlyM0dvKzd0Zm5qOERVTVBtazBTNncv?=
 =?utf-8?B?MWk3QU9YT290TmNVSnNpUXFab0VaR1pUZ2pLYWY3UXc5a3BmTkFITTM5bkx0?=
 =?utf-8?B?Y2FtU3BxSUJuSEtoYWlscW9tb28yS2ZLNGJQdDFmMGZVWjlxTWp4MmNXYmRp?=
 =?utf-8?B?T01MdGVwTXdnMjVhbjR3bkkvbzdlU1NxbTJwR2ZPWERJRVh5NU44VGlBMHY1?=
 =?utf-8?B?Vmcyamx6VDNyTWZ6bG44SW9BU281NzNkM09hZUk1MEQxZGxkVS9aYnJtdk95?=
 =?utf-8?B?NDNuNkhaZXJxL3pqeEFSblQ2V0s3K1VNczNVTXpGMiszQjBQTm9vYm4wb2px?=
 =?utf-8?B?R0t4dmJYWlRwczYzT1VxeEFhblZDUy9VSG8xd2hxck1sYVhqTnJRR0MwSDVv?=
 =?utf-8?B?a1Z1R3U0Sjg1NFM4clJPRWVaQ2VWTG83Q0tUeCt0OHBTUzhFYjdyVmcrMFZ6?=
 =?utf-8?B?M2d5UFVTblBUbnViNld5T0lrVU13aGtWM1FOeThFVjdkMmdtSmFFZGtOd2Ir?=
 =?utf-8?B?OXlsVHJOdWRpNDdzWXcyczZ1N1IxeWlSWnVRclYxcXUyaHUvc0NIbEVEMVFw?=
 =?utf-8?B?dEQ0L2dPekhFZ0tNTXV5eDBCUFN3VTZEL3F6RFdHbXBNNktqT1F5bi9GRi80?=
 =?utf-8?B?RndWMHlZRDZxTXYzNlJiQThDU1VpUFpROWhWM3l2MTNJby9ZWk1qVG1NcEFX?=
 =?utf-8?B?MWs2amhjOENOck9jdHloRkFkV2k1cWxkV1pXTlJGdkJ2U1NRZ2Z2OFBPN3A2?=
 =?utf-8?B?YW4wakdIcm5ydlhFYVljOXoyMGFnQW9mU3pGWVlzcW0vdVE5RGhwbk1JcjlY?=
 =?utf-8?B?bStrWnUwZ1ZVaFRXMXk1YlNWQTZDSno0b29BbW11bUM4UzR6RGIvQU5MeXhI?=
 =?utf-8?B?YVdoQlVjSXVjRHZQSlJjUzZOd0xqU1BFL0o3RGpqd2oyOG1qejhkekw2OVd4?=
 =?utf-8?B?QXlUZFJ3dDVQSkhxOW5DWWtqbXdUVk02NlVLbzFjeTVEd3lQeHZ2SnZFMi9L?=
 =?utf-8?B?bWdwTDZpWHFRUVV3QmY0ZElPWFVIT1VnNVlvMlBSVG5GRUVhSDErQ2ZHTEVu?=
 =?utf-8?B?SlUwTzVvVXk4T0xxNTJ6OWVrbDJHcnk2QXlTWWg5dDNkMldrdFZBbUxpT2l0?=
 =?utf-8?Q?vVJzd0GgxXRA4wJVlevR32U=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(19092799006)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cjY5SHNPNENDMzFpeFJKaXhzQXczR3VFcGhCYzU5dkFKTEdsSXFPMVdOWVBN?=
 =?utf-8?B?UHRuc1Q2VEZaZzkvWERoNjVxSXJRbDY4aUpHK1dlRTVyZXhsNkwvemNpMS9B?=
 =?utf-8?B?OTd4bFg5ay9hSzVKb21BRDVlL0NrS2hFWlBRRk90cTBKT1k2R005UmNJYk0v?=
 =?utf-8?B?RkorcU1vLzVWZVY3VlFFQ2lNYjdvSnVyc3FDWitTMGNWU3FmVjhYODhsbkdi?=
 =?utf-8?B?Z2t1TWVrbW5jSEFFYjJadTFwbGQwUW5heUtXYWhjOWNTS25sR0ZoVnIyTVE4?=
 =?utf-8?B?aVFhUlJvMnB5LzU2ZkxacmQrNWxzWStuTFgrRUhrK1QyMmZmSE1mOHRGTmhN?=
 =?utf-8?B?NGZRL2JpSmlHODhWQTJHNmlJU3JMVVZiRzRGNG9HaFJlQUozZjlPQjBDS2VL?=
 =?utf-8?B?c3V5OWFnK3JHN2Jlam5YQXducEF2Y2ZGdGxKMXBRLzBaN0ZPZUpvWDFyQnpl?=
 =?utf-8?B?NWpFL05RRG0vZHNtR0J5QzQ1Y1RpR21JVjFvazZNSGREajdsa21zRTBZSnlC?=
 =?utf-8?B?cTJwOFRXVUs3QUtLQXRvODFJWEp6MHFHUExia1h0c2dmTE01UzY0bElSVEZN?=
 =?utf-8?B?UVNPZ2wwVzdGNU5MTURFdFVkelNnSHlCRmlESGhsZ3NSSldVc0VGOURIdktF?=
 =?utf-8?B?VEhWMk42T3YyQkxJSm5ua0lJZU9SdStSdEk5N0FWaThQUEtmWnBySXFBZTFN?=
 =?utf-8?B?dUhoSjJZRDhKVHJiODM2d1BiRk03dVUxbUVTVUhpOW9zWWNMSjZITWZVRDFY?=
 =?utf-8?B?UUhEQmdnblBaU3prZ3d0L1BPaVhGUmRrWHoxaTVzdy9FYVV2RGJMZzBPa04y?=
 =?utf-8?B?clRaNDJqSStyMWJhWlNiYXhrNUk4ZkM0VnA3QXVQNW9OUFhVNEdqWUJYU2Z0?=
 =?utf-8?B?dUwvcmdnbStZalA2NDYyVVpOSGRLaUNEOTRmNndJMTlUazBYOHlIZ1hpMUdq?=
 =?utf-8?B?Rlk2aVJLWnkxcWVWR09kdndWaVRheE1Td05WOGhVVEdGNUM2dURSTjVuUUs4?=
 =?utf-8?B?QTdXaTB5dXNOVzJKM21kMFhtSHh3Q1NaM2dSRkRSbzhKSnNiRkxiQy9tSEZD?=
 =?utf-8?B?dE5XeDB3K0Z4Y3RhazMzSDdhZ3JHc1lPMU5ZN0ZmbWNnZm56Um5meGM1TVJW?=
 =?utf-8?B?R3o4SVdqY0I4SStFNXRNS1BndzNLUUZCUEpGU1hkWDdRYTRndVlxdzhrbGgw?=
 =?utf-8?B?dittQXovbm91Zmt3TDRsRlJ5WE5LR3BqR1I3dFJUQzZtRDhKOWJOeGdoUjZD?=
 =?utf-8?B?dDBqNEhRMVZzL09yOU1JMU5MUC9IQTcwbkJieVoyZnhBUXFoY0NGK2krVktE?=
 =?utf-8?B?WHgraTZkWC9kdWV5Zm95cUJNQTI2WU1ub2JzZ1ZzVGdhalFTNmdCNjFPZVJv?=
 =?utf-8?B?SzVYbmlabndMTU1FMG1UV2hqT3N4Q2JnZTBYaWo1UGN6UWhDd2kwbjFZY0gx?=
 =?utf-8?B?b3BLNTRVT1FHVUcrYWZIVzk0UE5tcUF3OVRzTmxDOXRXeW04aUtTOElBSXY0?=
 =?utf-8?B?V1JnN0RHbG1TL2p1WEFDMzR0VGw5WnhYVzlNekl1MXJPNndUMm9GQll2bURB?=
 =?utf-8?B?c0xtZUVMOWNpenJjTXJBT2hzdUFpc1EzZFNXc0hSYUM5K1NoSGFxTkw0R0Yz?=
 =?utf-8?B?d1J1QzVjS0MyVWN3dGJQMFFCdkltZ3BDSy8vTWhrNWxQT29rWXg3SzZ1UWhr?=
 =?utf-8?B?ZHJMTWhEbUFiR0RtSFF1alFYbzJlTStDNWtUQzY3SUlHRDhLcmcvNWVIT05x?=
 =?utf-8?B?OHNlb2JSWXNLMVZORnZ1cmN2YmxhUGM5cHhXbWhjbmNhMlNtaWt3RUZGbFZK?=
 =?utf-8?B?UnhzbUQwaEZVbWxhaWhzUlpaQng4K3ZOT29WWXBjVFRISlV0a2tMYUoyTlpz?=
 =?utf-8?B?MkVQZ21mOVlXRFVKWXlmekxieUNpUlYrMkFLaVJtWEVrS3NhLytwVytiOFlE?=
 =?utf-8?B?NDMvcW1rU0QzSGppbmI4cWw5Z1RNa2lLMVdTZno2VmV6WW94VW16bTlOQTJv?=
 =?utf-8?B?UTJobSs2NVRmL0RsR2NRVHI4WTgxejB1aGdKMTAwWmlvUEx6eG5FWC9haXRj?=
 =?utf-8?B?UVpSb3kxTmt5R0c3Wm1XMnR5eUVuS3dFRGhlaVkzeTllcUdLTWRuN09XMG9X?=
 =?utf-8?B?Ulh5S0JZWndsTElSQ0l1VlMyVXgwcW1kRmJPL2xHdmxtckdPanNrT2tSd2kr?=
 =?utf-8?B?UXVMeVNMTzdGbzNyMnJHZEpxR0hITWZKbm5qeDBMQmw3MXZnbTV5U1QyelJ6?=
 =?utf-8?B?YTVWejg1UjZBNjdKTFYwMzRlVHdvSW1IYUJFV3k3aFNEeVpWbGNDeEdLemVZ?=
 =?utf-8?Q?vh2RSQXtJTdq/9FYp3?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c5728cb-fcea-4ca9-a882-08de56aea85a
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2026 16:28:48.3311
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WmjQ/W8Hrw5/bbloLhexXA3hD/igN2BOsz00K/ATarnLseZ5MejZ0+3FlJ1LdkT3AHMa4KM1VmMEwfj0UkVAAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB11348
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260118_082902_196568_09AEDD1E 
X-CRM114-Status: UNSURE (   9.56  )
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

From: Li Jun <jun.li@nxp.com>

USB phy can be wakeup source to support wakeup system from USB.

Signed-off-by: Li Jun <jun.li@nxp.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mn.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn.dtsi b/arch/arm64/boot/dts/freescale/imx8mn.dtsi
index b98b3d0ddf25aa4b98f8320ecc7f44e22271178e..f65258aed3b72cf98e82432a59dce2acb001ad95 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn.dtsi
@@ -1322,5 +1322,6 @@ usbphynop1: usbphynop1 {
 		assigned-clock-parents = <&clk IMX8MN_SYS_PLL1_100M>;
 		clock-names = "main_clk";
 		power-domains = <&pgc_otg1>;
+		wakeup-source;
 	};
 };

-- 
2.34.1


