Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C589C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 May 2025 15:13:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:References:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WrQE2DIrhi67RpAbStb7zA9zTnvOeRQx9GzjkHcLXW4=; b=iA6Nld2nKo08Sd5AnNSHRVvyJo
	6DoAqrbp85foXKaMbi32+4t28D57gfB8Q9Ho0u91pmbjQLQ+gZiF2A2Nar8nQHHhxsrv8heyBAFAq
	9EYeAanAEqfFbyV417zqTP7lpkE+31i7G1kVQqysyf1zkr8Bbnnvbt5RF4D0bbHhoV+Uszg5Gph+R
	n5k63tzwGFzVZJFRtirAEQECpLQaVqAcKPw/1ZUW5KKf51nO8PA/4cDc05QDPpOl6req6WI5/6N1g
	7dBhLCEtMPe2pJrJIbf4kjpaWgZZ9cv1q/VswiCscIi+jHNVr2QERan63jGx23sEUl4/ZrGKBxNVp
	aYOnoLnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uL1QC-00000000yrv-2lpi;
	Fri, 30 May 2025 15:13:24 +0000
Received: from mail-vi1eur05on20615.outbound.protection.outlook.com ([2a01:111:f403:2613::615] helo=EUR05-VI1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uL1O3-00000000yZ1-120g
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 May 2025 15:11:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OwGNHoduSomg4LYuz6PBL9HUFE47PXOK/iWDcfLVXeWhPyMnNYHQ606itjBsBdSrKrMd++SFGoqEtqqxOfi8F5CC/20YMizGjQNOxJYL9IjnJlLo5b7n9idb4buY200Yz2ZjA9cALBldKOANM6pBhSM2xFrj1xDcggk34iKOtEBwN5o3eZlnqMesikNWP2EpQ9OwtZAZr9kJttC7/GIKORYBeh0U6rI1Ke2GEXMu1RIvT18bqmlyZPyr6xF7ioiTdWyTMvcC2VXhywnwdkhzTxj2kDgF1uFR0cZW+NqURaEl01jRUGQsYt+wRKIKXWcoZwH3tElt6lfUt6LSf6+FDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WrQE2DIrhi67RpAbStb7zA9zTnvOeRQx9GzjkHcLXW4=;
 b=M/ApeHawnE9g0cG+0PqpwztRw6M5c3Byvf1SBdZWeNRfTOVkdPmvOMJHRMFlg3UWs6FcW271AqIibzUzf8gCdFXh3ULCgEq+IwOi6Mys/r6r8kqEoC4TU54mGLCbhvneSaBMXvUumtkcY2mGMUR/rJ4neansK5pbrWTPvIXPCr3GRhs18+o4zOV0bJ8Y1WBwgGyi7VZZ5v1lnjRpJCDzZpzuCcyc2imkvJ9Htv/saB2WfMUu8hAA89R+6KRndCaVvmWB6Yz0hpo4htbKwAWzAVOuzjlqpArvT0ap1DKx6pvGYITmQ2XTdCuX+Hw2PpXx06JpvmTeMlkTomxAOJGdQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WrQE2DIrhi67RpAbStb7zA9zTnvOeRQx9GzjkHcLXW4=;
 b=F3xtEBY3XMpTxnts0CO3ZQw3RnwnrC2BvJyrZWsrw5RgkUyVUSTyQUx/1YiffdxHpOdq2H2MjCkWWLPCi+28K8/J20jAgu1p8U+v/aqcdOZSPW43jRfS8B46pWhZdth1F2Y/ARyy3Fz+pdJa6oGDrOXn9iS0zzZIqQcmyK2KUpyZm94+H6SaXpEGDHXA/TZ9p9tWtlSaJxdyf0G8AzjCLCMjsKT7IqQ+lQM1xKzRieoMqvRIGUKXIS0D8oBlTZ3AuykwGNbK/PDnOUHzpGvcgAGNwwB4g4nWVXtTYI09zOhwXUKKo2pLoLxXfsilxUF4V3BJ2i55hMtZK0lYYlSLag==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by VI0PR04MB10661.eurprd04.prod.outlook.com (2603:10a6:800:265::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.30; Fri, 30 May
 2025 15:11:06 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%6]) with mapi id 15.20.8769.025; Fri, 30 May 2025
 15:11:06 +0000
Date: Fri, 30 May 2025 11:10:59 -0400
From: Frank Li <Frank.li@nxp.com>
To: "Li, Meng" <Meng.Li@windriver.com>
Cc: "Rob Herring (Arm)" <robh@kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"shawnguo@kernel.org" <shawnguo@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>
Subject: Re: [PATCH] arch: arm64: dts: add big-endian property back into
 watchdog node
Message-ID: <aDnKgx2L9/LL3U4z@lizhi-Precision-Tower-5810>
References: <20250528111751.3505224-1-Meng.Li@windriver.com>
 <174843567469.3636722.5654586098186872724.robh@kernel.org>
 <CH3PR11MB877336C35ECB8432FF57C821F166A@CH3PR11MB8773.namprd11.prod.outlook.com>
 <aDiFrp/firrNlFEY@lizhi-Precision-Tower-5810>
 <CH3PR11MB8773E3192B27DD05E145556EF161A@CH3PR11MB8773.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CH3PR11MB8773E3192B27DD05E145556EF161A@CH3PR11MB8773.namprd11.prod.outlook.com>
X-ClientProxiedBy: PH7PR17CA0047.namprd17.prod.outlook.com
 (2603:10b6:510:323::29) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|VI0PR04MB10661:EE_
X-MS-Office365-Filtering-Correlation-Id: c206a39f-bf19-43e4-41bc-08dd9f8c334a
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|376014|1800799024|366016|7053199007|13003099007|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TVRsd3BFaEQxYjcrNFdKaTZmaWdweHMxRDN5Mk1BTFdUK05iRElRcElKeFNN?=
 =?utf-8?B?VGVReFhHNExkSjNGM2NiU0hhY2NQK2JiU1ZKYlJhTGF0YjArN2tpaFg5QUYv?=
 =?utf-8?B?azRaZG9XRG92czJ4N3I3cVJSODJhWXBuU0hWbzJJVEMvdlF0d1lpZitOOVhL?=
 =?utf-8?B?YXZwR1lxcUhGNjlqazYvbVdvWmhFUHllZUNzZmxIZTQ3bmVhS3VLbVVCaWpn?=
 =?utf-8?B?bWhDYTlETysybzZyUlRpaEJMRXdtc1loRVV5MDFDUlVxNStGVzh3a0ZFZVVK?=
 =?utf-8?B?OVIvY0pmNEZhUEcwQ2o5TWlRcStqQmc3UkxDZUVvZmpyUjRaK2MwbkpqWE1z?=
 =?utf-8?B?SmRQWTFuR2pyeDJGdmJSV2Vxa3hBTkRYcS96ZS9XYnFPSnBhQUNiaDZMb1Nw?=
 =?utf-8?B?V3hlS29pMWdNbG9ZUHpEOFl1aXJpZDl4RUVSYzFYcG5DaktpRUV6c1F0M2Vn?=
 =?utf-8?B?VGpMQTd0cnpjT2dvWmFtODc5b21lZVl1bU0wZ0hmenIxNjZuQ2hXOXFGYXdG?=
 =?utf-8?B?am04ZUs3dGh1R1RWUTl2TW51b0Ixc3VDeWROcHVJY3FQaFJWR1VLMFdVeE9j?=
 =?utf-8?B?cVpsMEFJTnQrdUtTSHIvekwyUG1iLzFlcE9vaTU2c3NUOWFabzNhaUZKeGs2?=
 =?utf-8?B?Nm80MEd6ditId05ZNjgxMXorMlFDbGZ5SUZzV3RPWTdNSEEvdS9WOEhYOFZx?=
 =?utf-8?B?M1Zic1NKd1FRU0VyZmRxWk9ONzVuQ1BjWk8vOE5lRDNDMEt4eExGOEtLV1ZD?=
 =?utf-8?B?ZVJxNk85MXAzU2dDVnhqcHI2WlpiWHlBT0xOaEZGUzlTcW1pWGhQU0lLQzVu?=
 =?utf-8?B?a0dQaFV5K2xkamJ0TFE1cnhSVXBqTHhNS3JmWG9Vbk0ySjhIL3JOZ3oyc3dS?=
 =?utf-8?B?L1NYVE1pLzRvZCtaUWlHMDI1Qmp4SUZqdHk3RUFWNmxJQW1GRWR5Q0hhei9y?=
 =?utf-8?B?aFQrYnNUcjZjbTJUc2FHTDJ0ME1iNGpJUU1ZRkZoMzErUEVVeWF1QllxcWpw?=
 =?utf-8?B?UWo1Z1paL055NXNXb2xud0svTmhGTldtcGNtdE83ZDBuYnljazFhbHFjdzQ0?=
 =?utf-8?B?ekV3Ti82akFSNFJFcHM3RVhYb21CUWNzLzhLYzJaQ0tGSy82U05QdVhkTERM?=
 =?utf-8?B?VjBlUjFuQnZPNS85aVRCQW5YYXFTWnJ2SzYrcUU4MEVxWWp1bDRhdndQZVNw?=
 =?utf-8?B?aFpuUE8yNi9aZUVpQ3dzcjQ5OW1xakxLR1RwM2dvMTJMcDJZWWllS0dvaW5u?=
 =?utf-8?B?U21nb3RhTDNJNldBRkQweGhqZFFxRWVOSHhFNUwzVVRBMFZhNEkrdmpRZ0Rw?=
 =?utf-8?B?MzZ1aG0wS01rOXd1Sy92dDFWcVErSE1NRHUzenJhdmVrTDBPV1M1UTBLaFF5?=
 =?utf-8?B?R1NGK0lBVGw4ZDZvNElOZnBNL3AxQmkvZGczTE84SGozRm9KSi9IVEdGN0dL?=
 =?utf-8?B?eE9HUGwrV05WSUFhVUFKdFcxYTRKeVlCejNyK1dPdkdkR3QycUk1M01zeHk0?=
 =?utf-8?B?Lyt3VFA4NXBSemgrbllzeUtZS1A4a21lWTNWaEc1ZzJUMHJxdEN2VFFKYzFM?=
 =?utf-8?B?OGVTVHFjWFE0QXY0dGt3RWN1Y0FqQlkzaUx6UVJXenpBeWJJRHJGNmdmTUM4?=
 =?utf-8?B?QS9OUi9PVEQyRTJsZi9RK29BOGMwV3ducFUwSDZNZGNGL2JwWFhjT0tKZzhl?=
 =?utf-8?B?eC9jQ3JQczBTdW5oQmE2L3puMjhZYXA3NTYrUy9FTVQ4S3Y5WWZGVEs0b2gw?=
 =?utf-8?B?d1lTejVXTlQvQnZaTnd2dkVEQTFqM3pCMFBsM1QzREorbWJacnN6cnd2ZnUx?=
 =?utf-8?B?cmpXRVVvTWlTdjdjQmZHR0xITDMwNjZqZGN4NmhhYVBLNkhPS0R0UkJBTTBD?=
 =?utf-8?B?YVM4em1paUZPbjdwUlVtMVpBTUpmWVJ2YTllNTdzdmlicWF1WDJSVG0zbDh5?=
 =?utf-8?Q?k6OxYFJxB/o=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(7053199007)(13003099007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bVFJVWl2bmhwZXoxc2pKdzZBdWhNV2JNc0JGTm9oRkt2K0NYYlFQNFlheG1C?=
 =?utf-8?B?STV2RXhsbWhPbFFjOVZUbzNEdVBzaUV6M1JOVlcrczJBbjJkNlhMRTFlMHpC?=
 =?utf-8?B?ZitMRkpPOHFoaG5XbE54OHpUYmZoNkNMUjlrK3BaZGRyd2xUVjZ4VFlRSVZK?=
 =?utf-8?B?ajgvWi8rWWdwY1VCZjR5cDllNmp3d0VtZVhHNVlJeCtvTlhHREptOWVSREsr?=
 =?utf-8?B?Uk1tQ0NpRWRnYVB5dnpVb1ltY09EZmRRcjd5bmcweTY5ajFrYnhNb0s5R05s?=
 =?utf-8?B?V08zK2pyZEdDV29GSzcrMGFCTjA2Vk91Nlp5VDNBMEY1NjJXVjdYMG1qSjFh?=
 =?utf-8?B?Ulo5NklqVThCOTBXRTVRQ0VSMFNKTGJQQ3hGUFI2Mm5sZWxQaGs1WnE0N2FS?=
 =?utf-8?B?WlhmUlRUSGc2dlR3R1Y4MDdQOFgzL2YyRVh6OVhFa1Y0cEhwVDJzaDN2cVNp?=
 =?utf-8?B?bjFwSUlWMVdoRjRpMzJRNHFOdktDSy9ZVEEvbFV5OEdaVVBCbFluRi9KektQ?=
 =?utf-8?B?cDIwZWk0ZnZ0U056NnNTbWlyalh3cy9GSkFFbTlpdjRnM2Q0Z1Q2ZjNSNVhm?=
 =?utf-8?B?Y3NUcW82c3ZBV2loMFlVVzBLdTQ3c1BDNGo4ZUt4dEJqdWZIZG03a056c1Fm?=
 =?utf-8?B?UGtkNWdXQmsrNUloZXhSMmtzY0txQnQ2Qlo3Z21PT2tld0tZb3ZScjhLQm9y?=
 =?utf-8?B?YTdtM3YyMVJ0VHUvQjA0RWJ0VCtVejhYVkZyZVFYeFlWRmxQQ1YwY0dHQjZ4?=
 =?utf-8?B?TkU3bTFHQmxvMTJubFdBUFBESy9QUXFQSzJHRDVEWWJpRFNKeXVzMHRGOG5q?=
 =?utf-8?B?RldjYUo2VWJzZzRhVmI3VmkzTmVKWWhXRXZoY0pxUlcvN2ZjUWtLUFhxK0N6?=
 =?utf-8?B?ckdaZGdONlVtWWVJMmMzS2JudE9FUmE4UzFuWDRtTDZBbHhpVExrYVdtMzZF?=
 =?utf-8?B?RXBsZVRQU3VLWktkVklOQ2krNnFac3FxYkFoMzc3ZnpMdTZ1disrQXY3b1ZL?=
 =?utf-8?B?KythOUw3V2NaemdMUHF3SWFUcWpwSjFlR2VCTUt0QlpDbUplTFBSRWJNcDBh?=
 =?utf-8?B?cXozaGVKckxuRU9vTGxib293dStCUFRUZ3VlZHJMeXVVc01jTURTMEZUczVJ?=
 =?utf-8?B?c21mbWVoeHJ5SzlQdDhrdXFVbm1ZT2pSQzJNMEUycnVXcjk1RWZVWWdUUDBQ?=
 =?utf-8?B?eXRkbFphZUZTalZZYzhvUVlOYkpndUdDanhmcUNkVk9LZDVDNDV3ampvSE81?=
 =?utf-8?B?aUlMdjFBaHZlUXJQSlV1dURETGdKMDJOT09yZ2JXeFIzS29aekxmV1F4bEZa?=
 =?utf-8?B?bUowcjdwVHg1TDVCaUZVUmdpdHJEN2RaQkRTaVY1VTlxZnVZY0kwU09qRU52?=
 =?utf-8?B?MU1EUzBqVXpNU0hEQjdHN2JXdEI3M3ZNQTRURlpHV1lpQVNCZmRkejJVayts?=
 =?utf-8?B?QzZwOVBJT2hoQk05T1A0bE45UGx1SWdrU014eVN3U0JSR1RkMkpNWWxkTHRU?=
 =?utf-8?B?ZDlEQzg1V1JPSnNwdklucSt3d2FtZ3FWRUx3S3FUQldMR3labCtnOWZmTDl3?=
 =?utf-8?B?NnpxZzVQY3ZKVzhhMk1qeFlpOHUvR3RTb09CaWJsWVRQTVZoUUFCTExuTVhk?=
 =?utf-8?B?M1lvNDNzOGFoWEg2TVYrRWdsanZrMmhXc2prMStmbmFjVUxIVlloNjRHZzdB?=
 =?utf-8?B?MU95OHMyU3JJMW5tSE9LSVZkbVhPRVdSQ3hYZ3lBd1RpUlBPb2JRa3lRbzA3?=
 =?utf-8?B?YTRNNUxiRmZUUUNBNC9rcS95OEJXUkRNWFRZUm85M2IvSEtQRklMVUxodjNl?=
 =?utf-8?B?aXlQNlFsT3pmOEVVREVxb1ZOdTJXZ0J4WDEyV0JWODFYTG5UNHNxRjBMbnZ1?=
 =?utf-8?B?L0JFcXhtTitjZTE2cG54ZGVrakhYZWxNZnlUOUlscWZmcUppcHB4QkNrcU1Q?=
 =?utf-8?B?OGpqMVJ6RGJicFZvRTNQUXF0WEhveVVwM2tjc0RocWppOEpQbnpqb3hNQlU1?=
 =?utf-8?B?eFNMMk9BRSs5aFAzOGVMbTREZXhCWS9VWFpXNDFMbkVXZHhxTUtZNDVtREw4?=
 =?utf-8?B?dGZZUkZVams2ZzN3N1c5MTVlYnlKZjJ3YS8rakVoQy9oMmkyOVpsSUpCUUR2?=
 =?utf-8?Q?EYbTV8ElIv2jg56mIuCIlV6JD?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c206a39f-bf19-43e4-41bc-08dd9f8c334a
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2025 15:11:06.2875
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8yTXcw/iea8lf9XZhgFJnVczhR2FxGLDVN6ZgC3E773ldPTNTeu6jgW2xSrQHzHh+aiqARIwq52ukKlpbv66iQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10661
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250530_081111_460753_190C26B6 
X-CRM114-Status: GOOD (  42.39  )
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

On Fri, May 30, 2025 at 02:12:20AM +0000, Li, Meng wrote:
>
>
> > -----Original Message-----
> > From: Frank Li <Frank.li@nxp.com>
> > Sent: Friday, May 30, 2025 12:05 AM
> > To: Li, Meng <Meng.Li@windriver.com>
> > Cc: Rob Herring (Arm) <robh@kernel.org>; devicetree@vger.kernel.org;
> > shawnguo@kernel.org; linux-kernel@vger.kernel.org; linux-arm-
> > kernel@lists.infradead.org; conor+dt@kernel.org
> > Subject: Re: [PATCH] arch: arm64: dts: add big-endian property back into
> > watchdog node
> >
> > CAUTION: This email comes from a non Wind River email account!
> > Do not click links or open attachments unless you recognize the sender and
> > know the content is safe.
> >
> > On Thu, May 29, 2025 at 04:07:27AM +0000, Li, Meng wrote:
> > > Hi Frank,
> > >
> > > Do you have any suggestions for this issue?
> > > Could you please help check whether we need to fix this issue?
> >
> > Fix binding doc
> >
> > diff --git a/Documentation/devicetree/bindings/watchdog/fsl-imx-wdt.yaml
> > b/Documentation/devicetree/bindings/watchdog/fsl-imx-wdt.yaml
> > index 0da953cb71272..8006efb69ec71 100644
> > --- a/Documentation/devicetree/bindings/watchdog/fsl-imx-wdt.yaml
> > +++ b/Documentation/devicetree/bindings/watchdog/fsl-imx-wdt.yaml
> > @@ -36,6 +36,7 @@ properties:
> >                - fsl,imx8mq-wdt
> >                - fsl,ls1012a-wdt
> >                - fsl,ls1043a-wdt
> > +              - fsl,ls1046a-wdt
> >                - fsl,vf610-wdt
> >            - const: fsl,imx21-wdt
> >
> > @@ -103,6 +104,7 @@ allOf:
> >                enum:
> >                  - fsl,ls1012a-wdt
> >                  - fsl,ls1043a-wdt
> > +                - fsl,ls1046a-wdt
> >
> > fix dtsi
> >
> > diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
> > b/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
> > index 0baf256b44003..096ed81a9bc4d 100644
> > --- a/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
> > @@ -687,7 +687,7 @@ lpuart5: serial@29a0000 {
> >                 };
> >
> >                 wdog0: watchdog@2ad0000 {
> > -                       compatible = "fsl,imx21-wdt";
> > +                       compatible = "fsl,ls1046a-wdt", "fsl,imx21-wdt";
> >
> >
>
> I have a question.
> I checked the code of ./drivers/watchdog/imx2_wdt.c, there is below item imx2_wdt_dt_ids[]
> { .compatible = "fsl,ls1043a-wdt", .data = &imx_wdt_legacy },
> Do you think we also need to add another below item for ls1046?

{ .compatible = "fsl,imx21-wdt", .data = &imx_wdt_legacy }, it is enough
by use fallback fsl,imx21-wdt.

> { .compatible = "fsl,ls1046a-wdt", .data = &imx_wdt_legacy },
>
> Another question
> I also checked the code ./arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi, and I found out below item in watchdog@2ad0000 node
> compatible = "fsl,ls1043a-wdt", "fsl,imx21-wdt";
> but in imx2_wdt_dt_ids[], there is also the below item, it also can support the ls1043a and ls1046a platforms
> { .compatible = "fsl,imx21-wdt", .data = &imx_wdt_legacy },
> So, I think maybe we can remove the { .compatible = "fsl,ls1043a-wdt", .data = &imx_wdt_legacy }.

Yes, but not nessesary to do that. leave it as it.

>
> Based on above description, there are 2 solutions, add { .compatible = "fsl,ls1046a-wdt", .data = &imx_wdt_legacy }, or remove { .compatible = "fsl,ls1043a-wdt", .data = &imx_wdt_legacy }.
> What is your suggestion？

leave driver code unchange. the current driver can work.

Frank

>
> Thanks,
> LImeng
>
>
>
> > Frank
> > >
> > > Thanks,
> > > LImeng
> > >
> > > > -----Original Message-----
> > > > From: Rob Herring (Arm) <robh@kernel.org>
> > > > Sent: Wednesday, May 28, 2025 8:37 PM
> > > > To: Li, Meng <Meng.Li@windriver.com>
> > > > Cc: devicetree@vger.kernel.org; shawnguo@kernel.org; linux-
> > > > kernel@vger.kernel.org; Frank.Li@nxp.com; linux-arm-
> > > > kernel@lists.infradead.org; conor+dt@kernel.org; Li, Meng
> > > > <Meng.Li@windriver.com>
> > > > Subject: Re: [PATCH] arch: arm64: dts: add big-endian property back
> > > > into watchdog node
> > > >
> > > > CAUTION: This email comes from a non Wind River email account!
> > > > Do not click links or open attachments unless you recognize the
> > > > sender and know the content is safe.
> > > >
> > > > On Wed, 28 May 2025 19:17:51 +0800, Meng Li wrote:
> > > > > When verifying watchdog feature on NXP ls1046ardb board, it
> > > > > doesn't work. Because the big-endian is deleted by accident, add it back.
> > > > >
> > > > > Fixes: 7c8ffc5555cb ("arm64: dts: layerscape: remove big-endian
> > > > > for mmc nodes")
> > > > > Cc: stable@vger.kernel.org
> > > > > Signed-off-by: Meng Li <Meng.Li@windriver.com>
> > > > > ---
> > > > >  arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi | 1 +
> > > > >  1 file changed, 1 insertion(+)
> > > > >
> > > >
> > > >
> > > > My bot found new DTB warnings on the .dts files added or changed in
> > > > this series.
> > > >
> > > > Some warnings may be from an existing SoC .dtsi. Or perhaps the
> > > > warnings are fixed by another series. Ultimately, it is up to the
> > > > platform maintainer whether these warnings are acceptable or not. No
> > > > need to reply unless the platform maintainer has comments.
> > > >
> > > > If you already ran DT checks and didn't see these error(s), then
> > > > make sure dt- schema is up to date:
> > > >
> > > >   pip3 install dtschema --upgrade
> > > >
> > > >
> > > > This patch series was applied (using b4) to base:
> > > >  Base: attempting to guess base-commit...
> > > >  Base: failed to guess base
> > > >
> > > > If this is not the correct base, please add 'base-commit' tag (or
> > > > use b4 which does this automatically)
> > > >
> > > > New warnings running 'make CHECK_DTBS=y for
> > > > arch/arm64/boot/dts/freescale/' for 20250528111751.3505224-1-
> > > > Meng.Li@windriver.com:
> > > >
> > > > arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dtb: watchdog@2ad0000
> > > > (fsl,imx21-wdt): big-endian: False schema does not allow True
> > > >         from schema $id:
> > > > http://devicetree.org/schemas/watchdog/fsl-imx-
> > > > wdt.yaml#
> > > > arch/arm64/boot/dts/freescale/fsl-ls1046a-frwy.dtb:
> > watchdog@2ad0000
> > > > (fsl,imx21-wdt): big-endian: False schema does not allow True
> > > >         from schema $id:
> > > > http://devicetree.org/schemas/watchdog/fsl-imx-
> > > > wdt.yaml#
> > > > arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dtb: watchdog@2ad0000
> > > > (fsl,imx21-wdt): big-endian: False schema does not allow True
> > > >         from schema $id:
> > > > http://devicetree.org/schemas/watchdog/fsl-imx-
> > > > wdt.yaml#
> > > > arch/arm64/boot/dts/freescale/fsl-ls1046a-tqmls1046a-mbls10xxa.dtb:
> > > > watchdog@2ad0000 (fsl,imx21-wdt): big-endian: False schema does not
> > > > allow True
> > > >         from schema $id:
> > > > http://devicetree.org/schemas/watchdog/fsl-imx-
> > > > wdt.yaml#
> > > >
> > > >
> > > >
> > > >
> > >

