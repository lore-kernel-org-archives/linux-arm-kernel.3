Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A15FC02195
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 08:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=D1xGNMY3PMKmOTr/4/9zhHeSUVNlQLgtR+tR0j2OTq4=; b=EMVYBDB64Y1Udu6UYshmClFYQQ
	//4BMJtMFplfycRGlheW1mn5nSJNofrSSWC+vIQaFX4/76EIomciUux0JncMluu8XpIuBTBX6eoi/
	hqfYxB8Adu3bNIGA2kqDDBW+abn/ebg6odOL0QgjimGngWYOk4qRE0mN9PDneCamMPFp/HhiGAxx/
	Ee8WaOw2yO5AjlJKUeP3pSiwK82nSBNglKkup1IBr1H3Y401pB370E57wbZFCq0xudMkcpn5oQ1hk
	/iKwtBO4MU7RzuqoE0OYM8xsXfyTL9tVEKkV1k5vHIwojVFGzURgHYYzrqRd5brSp0tlL75VVfVtA
	/UNyYlNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1terXw-0000000EmRu-2sEU;
	Mon, 03 Feb 2025 08:11:08 +0000
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1terWc-0000000EmD0-1WS9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 08:09:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MRoaEPU9YTTr1ud1b8H4kFGVd2xcqrSeltH4IEJ9ucjtViS7W41CaUANqemveJY6hxskqIJueyobANC0ev5vRw13HlbHdz3aWGp9mEVdkCoXx62V1OJPSyrbrT8Ift77NL/yjcwQLyIJfuaeeyqKGDqJy4de8KAdnJMfk/0CQ1cZ5Ya3qjU3sArvi5fIJl0A5ojna5iEGgWm/dwytiG6MeSJj+fpJJGBQVGvbeF2fyY+ZqluIIb0dIoUAY3n8YQrmRzEfkPRbVF4Ml85o5Vl1QOePrv2KDS9i5d3Cp8V3jMiKKw3CzlMLXv4r7q0ISPpuoISnMaGU++NN6XmsHB4Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D1xGNMY3PMKmOTr/4/9zhHeSUVNlQLgtR+tR0j2OTq4=;
 b=R2yihYrEII1QeBs/tYqvnQhlKrQlOIHhc2W/DcLhdx+YHpkPo4wKNIfMUc3jxTpN8160Z+tL4e8VaWchRBb5X4AJYKuuOU+nTeDJRWHj9hBqz4qBrltUqkkyedS5U0dIAlIw1h9tzDp3nl/ydlED21UB8PsQkq1W/sTkZwu95w4CinVT3vC1geD8aaum6mpWfvFO9mOo29ITeFM4u30edZWPPct2ya0pgIv93Ti5zw/tMVXwZlebgO12sRjDbBNpkNQCrg8r9Kp3qOnp25c0MBgQsW2isZQM6z2cOvj1Rtl+OymXsO97MmHPWH0AUOzWQQMUeU6DxolLphLQXkMgig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D1xGNMY3PMKmOTr/4/9zhHeSUVNlQLgtR+tR0j2OTq4=;
 b=iSCB57ALuaKFIpWVBF5sWb0wisoTAbxeyNKJ1v5+VrmIbWy6NqwmGlPZaIin782EPvp8f3VyBBlX51rUHEbG7eL0X1Wnt1v1LlZksm8/fcNivc4FkVmEjq8e5ByJaci1Gj9nyGTsLZjw9UsPJwrHsk4bdQr06nFQ0rB7bFebJvKTXOqk4hC5WcA9/pCuyB425ifpmeVxzgedJ4/md8/n2qwhWa/qJmB7UljHNXaSZCwVuY+UYtDqDV741lnJSLzvglObeHvbACyWjRQAiOeI77JWg8nJRpbadonRtY8Z8djwtQmawLg2bSQ7SEOmhIlAevTFPzLHimkZZE+uU9plWQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS4PR04MB9550.eurprd04.prod.outlook.com (2603:10a6:20b:4f9::17)
 by DU2PR04MB8838.eurprd04.prod.outlook.com (2603:10a6:10:2e1::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Mon, 3 Feb
 2025 08:09:37 +0000
Received: from AS4PR04MB9550.eurprd04.prod.outlook.com
 ([fe80::e28d:10f8:289:baf7]) by AS4PR04MB9550.eurprd04.prod.outlook.com
 ([fe80::e28d:10f8:289:baf7%7]) with mapi id 15.20.8398.021; Mon, 3 Feb 2025
 08:09:37 +0000
From: Larisa Grigore <larisa.grigore@oss.nxp.com>
To: Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	s32@nxp.com,
	clizzi@redhat.com,
	aruizrui@redhat.com,
	eballetb@redhat.com,
	Larisa Grigore <larisa.grigore@oss.nxp.com>
Subject: [PATCH v2 1/2] arm64: dts: s32g: add the eDMA nodes
Date: Mon,  3 Feb 2025 10:09:19 +0200
Message-ID: <20250203080919.1814455-1-larisa.grigore@oss.nxp.com>
X-Mailer: git-send-email 2.47.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4PR10CA0025.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d8::14) To AS4PR04MB9550.eurprd04.prod.outlook.com
 (2603:10a6:20b:4f9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9550:EE_|DU2PR04MB8838:EE_
X-MS-Office365-Filtering-Correlation-Id: ed4b55d1-71c7-487d-b285-08dd442a19d8
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NnhCT09yNWgvLzhjMFlseEI4U0JPeWEzYS9lVllHcnc1bnROMXF5bXFxSng4?=
 =?utf-8?B?aHlIWWV0WFhnck9lSWY3dlVmMURiNlllL1FwelVFL2EzOUZXZldWWmFyWjJI?=
 =?utf-8?B?aDk0clF6WklrVkdRQUp0M2JKbkdCMGRCSmRyTzU5U2tUenFDeHhHMXNZeC8r?=
 =?utf-8?B?VVJKdUFubTVOeW55L21uVXNUZGcyRmZ2aWhXenh2SlZaRFdrTGp6SjlESmtz?=
 =?utf-8?B?cVc5UkJJK2dMc3JGaUEyd0lFemhYSTE3QS9saVJvR1V2QkdaN3NSbjVhQlVK?=
 =?utf-8?B?QmtZYXF6TWgwMmxRdDJNRHN4dXlNZEpYTGprT2ppQkNvRFMyZklFcENnU0pY?=
 =?utf-8?B?YysxMm4vMXdETmJEK2JqRi9qZlNneGpnb3Q5SGtuZUlzTzdQQ2krZXVycEkz?=
 =?utf-8?B?YTlCOHFnK0VZcWNUVS9PTkFNV1ZINHhRK2RTMm82ZERQMDN6eGZXYldZdm9r?=
 =?utf-8?B?RnNQdTF2emMvWXY0cjRtT0UyQ29nVDJsV0pWRkNDWU10WE9vKzJONW1CRnV4?=
 =?utf-8?B?QVd4NGQzbEdnVjloWThOVVJ0UU9CT29YaHdOL0ZDaDN1Qk5kT0FRNGRCaS96?=
 =?utf-8?B?YTZoNXFkVWQvZ0FmK3V1RE01TTRiOUpGcWRBa2ZLb1g4MGpJZmVGTGdqMTBw?=
 =?utf-8?B?L1VGL21CZmJwYmJNMTJ4cU1pQ2YwbDIwRksxcUFMSGFTcXZtT0lpZXl4bmk4?=
 =?utf-8?B?ZU80ZisvYUd5dnNKcUYyd0ZHU2o3Lzd4bjJYeWZDMWJ0Yk1OYnY1bEtXWkto?=
 =?utf-8?B?U3YrNWVhL0k5QWxYaldxVVFCYlpJK3d3Vi9tdEdEd0VXZHAvSGRpZmdrVXNZ?=
 =?utf-8?B?TmFuVXd3OFFRRzB6NjJJUlRWZmc2TnpaZElRTVpFV3E3NEJwT2JaU1pQUHEz?=
 =?utf-8?B?alBGK3NUWGF3TjJ0V284K0o4SGdFV1k4T1hXWkxqcGRhMFRXUlpOaGRxeWxZ?=
 =?utf-8?B?OUg0bldCeGJ1SVh6YnB3eWhRVHhyZkpmSm5vNzZzNThQWUsvK0t3aWFNMUNn?=
 =?utf-8?B?NE04ZElGSkJYb25lQURnYUllUTVqUXZmUStzbkVlMW1sdG9jRFd5WU1HZGVE?=
 =?utf-8?B?aUIrOGJVSUxYUkhqMU4rRTdPTEtncFY2Rm1sMzRMaUFsZ1pUWlUxQzBZL0g1?=
 =?utf-8?B?c3J0ekN4dTl0djk5WURKd1JkMGNpNTZPNXdDNjJRT1VwWjRIOXVJcCt5dVlH?=
 =?utf-8?B?c0tyK1lPNzJBQ0FjM1lDemNBMmxxaGtvcFUrdEhOLy90Q001WGFpNFYzMGJj?=
 =?utf-8?B?K2dWaVlCVmx1MU1LYmo5WDErbVBBMFR0OFM2OWhrQ1JNSGFYa0pWRDBjNksv?=
 =?utf-8?B?VERGNEhLWGlOKzh3eDBzWkc2MDc4V0pqZXNTTVZsb2VOOUlvcmxKTkFxbG5D?=
 =?utf-8?B?dkI5cXQzUVpMU3BQZ1ljb2cvdEFwYitITUY5SGVIUC9EdjFtUklZWlQ3UVFN?=
 =?utf-8?B?d2lLNCtGM1VMSGVkbWFmK2JCUE9uWFBjckJQaXVkY005TTNzZVgraUtiM0d5?=
 =?utf-8?B?a25uUS9RMzBSK0tZTVh1VEk0MElLbzlVSGhHeHV5bkZTbFlIS2kyelR3bXZu?=
 =?utf-8?B?TzJiaW1kaUdHZklRelZtanlkMmwzbGx4MHRwMHhOMWVqUlJycHVwRFE3Um1X?=
 =?utf-8?B?NnBqNWswQWlDMnA2aU5IU2VYOU1kMWZCeU1zREdRZnJ4VVpSSGQwYlNDU3Jj?=
 =?utf-8?B?VEdySXBmZ3hCUnpLOGIzK1NvZGcvUEpjeWZTeXZZTHlkSmx6VnoyQ1hiU3pp?=
 =?utf-8?B?MUVoU1ZLUUwxZmpEazZCMzl3Q2FHRy84OEhuZGx2T01iUHVqT05JZFNiMzhH?=
 =?utf-8?B?OHZrU3FjNWxqNDZLcExwRjBIL2h3OEJjRzl4VVA4Vnc0M1dVOHNrQi8zYi95?=
 =?utf-8?B?bEZ3VUgrOGJBLy9qMU9GaitWTzYvWVN1SE1mTkhVQnZvb20wTk56Szd4akxJ?=
 =?utf-8?Q?psgqelz6QaQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9550.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VHVOUlhEL21COCtpTm52VXBseHYwQlBMK3ZPVklUTmU4aWFtTDhqMG1ydlE4?=
 =?utf-8?B?K3YySkRLYkdIODkyb0JZYXo2bURaUDJKMTBLdm5tQzNJOCtnNnl1d1hDM1Ir?=
 =?utf-8?B?VDh1ME04cVlDUWdvcmI5ZnlvSnB5dFBsVU5JTlVTZVJpMWFISE5HamlQbHM4?=
 =?utf-8?B?a0Zkem5YekNzTzZRTllMMCtUYTBsWUg3SW1PdWtzQjhOTUVaT1k4NWIyY0JE?=
 =?utf-8?B?dWRhOTRvZEdRN3JabzRMMEl1WEZRcWczTTNHMnM4c1YvZ2I4b3dmcXNkZnl0?=
 =?utf-8?B?N3pkT3pVam00bUVuaWpnUFJOVUk3Tng5STQrQmhTVE5lNm5CVFpzdE9TV2Rq?=
 =?utf-8?B?ZHNEbEpwV1N1STVVYUcwa1lJeGtjU0ZYVklKNDZuaFEramxaNzVzM1liYTUr?=
 =?utf-8?B?bjRIdHZtNmY3Ulp0Vm0wSGZOb052Z2dWT1JmWWgybXhLYmNWbUprWFhEWjlV?=
 =?utf-8?B?Y3J5bXBlb1dxRy9xcXUyS2ZIVjVhVUloUmRqNzBEV2JjRmFRREVyWFgrbzlQ?=
 =?utf-8?B?c1NJUGJKTG9NTFMwaGs2bmY5UEtKRkFXZkYrK3dLOGlScmZ1SEVnemxsd0J1?=
 =?utf-8?B?Q0M5ZmlkMW5JZTdoVzg1SGMzUlo2UEc3bkMzR2g4ZklGQXlMdWh6Y3ZoeVQr?=
 =?utf-8?B?TytMT2oycWVBbWlTODJoT1htdFFRVG5yZERlSjRlazZ2VC95K08wODJzbTdY?=
 =?utf-8?B?Y2RVTTdOcEpaSU9QSmNwNm9hbHBxM1BEK240TWRRSklOb0RvcGNlSk5LNEpn?=
 =?utf-8?B?dDB3cG1OMTBnbEJPaXQ2QUU2emh4K0llaVQ2MkdDcUFnQkNQNEhTTUpad2Jm?=
 =?utf-8?B?TTVUU0YyUGlWcFhuRGJneEIzelc2d1l2emdCQlVmTkU3a0NETDBvTlEvajZR?=
 =?utf-8?B?UW5mMjQwU0w2QWxJSDlvbWNXYTV3dkZtQVB3U0hKbmtnWEdyRmwwN0h3dnMz?=
 =?utf-8?B?STUvR0lFUG1sTVpCZlQ2ZXVJMHlNVjJrREJsZXBYcXpXUGtQcmZqVkFOTHov?=
 =?utf-8?B?L1c2ZWJwcFhmZW84TFIvTHRremQ4WnVtYm52Q2RNOEloeWpLN0YxYmVSRDJp?=
 =?utf-8?B?ajhvd280dnAvVTVZSlg4UXNzOHp2RFJwSnVRcDI5R3NZT3U4c3owWEZBQk5n?=
 =?utf-8?B?aU5HdzRVVFVXdG9PMTl6WU1GMVkrYXNVZGhuVFoycVZhRnNoRjhMNzhETHZ4?=
 =?utf-8?B?MUFtNUt6QUxtakxRd05vSHUybEM2Sk8xZHl4M24xRGpqS1JyUE95dmJpUXFm?=
 =?utf-8?B?NmtOVjBSTWlRQ1laS0ZpYnJGS0ZqU0NlU1JRb1pJZXQ4UVlJMzdXZHkwNVZS?=
 =?utf-8?B?dmZnNFUvUkZRUFcyYUdjYmREcVlvK3Nlc2xmdXp1RWdzSFg2YWVnZGRhM2d2?=
 =?utf-8?B?OUl3akNEUHcxNHFlbisyRnhFd3JuMUszMlF2TE5na0ZMZlowRjB4TythdjB4?=
 =?utf-8?B?cnA2NVNZMGVYdmZrWnNnaWRPclRUbE8wT3dSamhSV0UwMDc1TFp1OVU0REt6?=
 =?utf-8?B?NktUK2U3bnFmdDdaamZhbjB5elp5ZmFibzUyc3BBNU44NGFSdzRReENCNUta?=
 =?utf-8?B?dmJxS09SejhhM3dUdVR1U2UwbTVDMGsvaWV2Q21obDY5LzNyK1VOUmJrZ2Zv?=
 =?utf-8?B?ZzBORzk1MUtSUUxBenZBWFJldFRHNjhRWHM1clNpOFZDaUhkYm5TZExDNmdk?=
 =?utf-8?B?ajJnTlNZeFlWUkJuUVl3TmhQWjN3T1lsNEsxM3BOTTNKRXNmU2ZXdGM3ZktD?=
 =?utf-8?B?RWJQZURLNUltaGlOMlVBSW5FcFNWeTdGUGR2YnZObFgyaDgxWUYwZGdlLytv?=
 =?utf-8?B?d2dMcFhzaFFNMjdoYVorUjZYd1dCUS9yTEdWaEJjU0thQmlyTTFoMGNNUnNF?=
 =?utf-8?B?eThXSkdnc2FQVTc4TkJ2dDBuMWlxZW0xajdDWW9DZk1oVFpBbWNNSzR0anM4?=
 =?utf-8?B?ckNHNjNiUkZ6dDM0MjNxT1ZHZzVDS3dURnBQYUJKN2hIbXdWSXpEVzlRajZP?=
 =?utf-8?B?ZU1JdHpLLzhCSGVNVmxNMC9LQnJiSDY2V2dlUy9IdFVTdFc4RHhnY01KZkda?=
 =?utf-8?B?YUtuUXM2ajh0dVZMYy9qMWZHREhpLy9SOFBiOGd6a0FkdmVVdTJWcys1Y3Zk?=
 =?utf-8?Q?caqDsuPPWGzZj+FOvxKueMGsJ?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed4b55d1-71c7-487d-b285-08dd442a19d8
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9550.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2025 08:09:37.0339
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k1LCiswWUSxAGW1VgU5Wdg8h9zPBei4xXv1WRojQcHdnm1KzgPnqMaj+3vM2q+7m6F6FBBTj+LVCjulsVJKlQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8838
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_000946_399354_05C128C8 
X-CRM114-Status: UNSURE (   9.44  )
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

Add the two eDMA nodes in the device tree in order to enable the probing
of the S32G2/S32G3 eDMA driver.

Signed-off-by: Larisa Grigore <larisa.grigore@oss.nxp.com>
---

v2: Moved #dma-cells before dma-channels and clock-names after clocks.

 arch/arm64/boot/dts/freescale/s32g2.dtsi | 34 ++++++++++++++++++++++++
 arch/arm64/boot/dts/freescale/s32g3.dtsi | 34 ++++++++++++++++++++++++
 2 files changed, 68 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/s32g2.dtsi b/arch/arm64/boot/dts/freescale/s32g2.dtsi
index 7be430b78c83..64eac1dde05b 100644
--- a/arch/arm64/boot/dts/freescale/s32g2.dtsi
+++ b/arch/arm64/boot/dts/freescale/s32g2.dtsi
@@ -317,6 +317,23 @@ usdhc0-200mhz-grp4 {
 			};
 		};
 
+		edma0: dma-controller@40144000 {
+			compatible = "nxp,s32g2-edma";
+			reg = <0x40144000 0x24000>,
+			      <0x4012c000 0x3000>,
+			      <0x40130000 0x3000>;
+			#dma-cells = <2>;
+			dma-channels = <32>;
+			interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "tx-0-15",
+					  "tx-16-31",
+					  "err";
+			clocks = <&clks 63>, <&clks 64>;
+			clock-names = "dmamux0", "dmamux1";
+		};
+
 		uart0: serial@401c8000 {
 			compatible = "nxp,s32g2-linflexuart",
 				     "fsl,s32v234-linflexuart";
@@ -333,6 +350,23 @@ uart1: serial@401cc000 {
 			status = "disabled";
 		};
 
+		edma1: dma-controller@40244000 {
+			compatible = "nxp,s32g2-edma";
+			reg = <0x40244000 0x24000>,
+			      <0x4022c000 0x3000>,
+			      <0x40230000 0x3000>;
+			#dma-cells = <2>;
+			dma-channels = <32>;
+			interrupts = <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "tx-0-15",
+					  "tx-16-31",
+					  "err";
+			clocks = <&clks 63>, <&clks 64>;
+			clock-names = "dmamux0", "dmamux1";
+		};
+
 		uart2: serial@402bc000 {
 			compatible = "nxp,s32g2-linflexuart",
 				     "fsl,s32v234-linflexuart";
diff --git a/arch/arm64/boot/dts/freescale/s32g3.dtsi b/arch/arm64/boot/dts/freescale/s32g3.dtsi
index 6c572ffe37ca..4f6201d6c08a 100644
--- a/arch/arm64/boot/dts/freescale/s32g3.dtsi
+++ b/arch/arm64/boot/dts/freescale/s32g3.dtsi
@@ -374,6 +374,23 @@ usdhc0-200mhz-grp4 {
 			};
 		};
 
+		edma0: dma-controller@40144000 {
+			compatible = "nxp,s32g3-edma", "nxp,s32g2-edma";
+			reg = <0x40144000 0x24000>,
+			      <0x4012c000 0x3000>,
+			      <0x40130000 0x3000>;
+			#dma-cells = <2>;
+			dma-channels = <32>;
+			interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "tx-0-15",
+					  "tx-16-31",
+					  "err";
+			clocks = <&clks 63>, <&clks 64>;
+			clock-names = "dmamux0", "dmamux1";
+		};
+
 		uart0: serial@401c8000 {
 			compatible = "nxp,s32g3-linflexuart",
 				     "fsl,s32v234-linflexuart";
@@ -390,6 +407,23 @@ uart1: serial@401cc000 {
 			status = "disabled";
 		};
 
+		edma1: dma-controller@40244000 {
+			compatible = "nxp,s32g3-edma", "nxp,s32g2-edma";
+			reg = <0x40244000 0x24000>,
+			      <0x4022c000 0x3000>,
+			      <0x40230000 0x3000>;
+			#dma-cells = <2>;
+			dma-channels = <32>;
+			interrupts = <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "tx-0-15",
+					  "tx-16-31",
+					  "err";
+			clocks = <&clks 63>, <&clks 64>;
+			clock-names = "dmamux0", "dmamux1";
+		};
+
 		uart2: serial@402bc000 {
 			compatible = "nxp,s32g3-linflexuart",
 				     "fsl,s32v234-linflexuart";
-- 
2.47.0


