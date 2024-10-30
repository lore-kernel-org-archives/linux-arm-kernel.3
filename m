Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FC6BD7497D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 07:46:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n1SoNm91qrjLAugamnbSRMscpKMtMqTYrHjzQIjV56U=; b=AyEVe4xWSYh4j0y1mW3LReo5Ok
	o/LEphtHSMocKfYk0LmEhfrbTF6WK0oju2nR8SJOUJ8Rci7qWHsPBfUSeBTJ14HEQtYBRnl3SWZ//
	2XAooDmMNJ04MyGm6U0xcgfPz4dtaEZ0N30dZ6hw30ERVozBUIWGstsmBonZTb0qpJwAhkgDobfx9
	sOtJORAMBb0c8qD+m5oMZ8RnIYJ5bgsf8LCAtARyQMKOVO/JgUfc+XKxrmOsCAOZv9AiNovun1K1v
	eM9FQaRLit47id8HOqfUacjrmzGzn6s8SG7LB8fmT98k9ws4uj1Xk0RJU2BDSpDBOfyBkkkzM7eEn
	MWj9MNFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t63PY-0000000HCFT-3HPZ;
	Wed, 30 Oct 2024 07:46:36 +0000
Received: from mail-db5eur02on2071c.outbound.protection.outlook.com ([2a01:111:f403:2608::71c] helo=EUR02-DB5-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t63Ni-0000000HBwa-14Ri
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 07:44:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zIrI8hiA7gYjUMU7VqKKmkQrs8qdsNuvupHt0vADU0odbmyIltvnhOaURIYvjbo5O14C87BauYvSPrOFCx2XqYHNGQa6fsJBvmgIBicFuI7zMI6BXbLHFsovXlwRzndiUPA6Kr2DgimqFycexd0yk/sdBq167aEjwMcKRxC/fiIILhqeCpyO8thECZle7iLGQc8gui7VRVa3WyPc8fM6iotiLEKjldiDwO3XEqCJeIPEOUfxsbi140GnrOws5fO+lpE8ui4JW4zJ5UUK432qXfzdgGvbflek0waSyKw/YxykdhZPVVJg/LYMoPf320iO2cwu7OQ9w9PFjszNJ15UKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n1SoNm91qrjLAugamnbSRMscpKMtMqTYrHjzQIjV56U=;
 b=WbqTG+dtN7ZOTmOITryuvrxrLY5HuMDRBc0AejC6DnvTWCOZMv0fnoivi8JTk3czCyin4zLCL5v8wAp4Ye5RxgV4nvx8wkv3/dZcu4YWIFh+e5Zqgme8Gzl389XVJx0YUFqkWcxp8WsKM4VlsIinSaCg5P4rGswbgaDYPUUSYRoImc4db/coah9l4cPST8tZ8NBCYnSeYvSnqS1UmXcGyDXC5QS7rJERmhtBlS0YqyG1KW1rTZZIxWyuB6f1JudwSCIkJL6qTGzP0BhSUbc/i19aOOSPBBQolC0817KLkaK8QbOJjgQTEDdrup5zYpI8LyTiOuCR+c+8bQ0ITpzWXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com;
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n1SoNm91qrjLAugamnbSRMscpKMtMqTYrHjzQIjV56U=;
 b=RH+6KObkrmpAyUZat4rarDdG3lskZSSs0gqt28x1gomSuhDl1F1C1kBnGqnIkKJTiW8ll+lvIp+9NnEuiayvOZxINSwZY5cz0j+HZqGZBjY0AQJkILezg+KJRjyJ9xmNeTugqpJU+XXDl4uInFwT58IG+/74TymXg7Kg40ae6TM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.de;
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:263::10)
 by DU0PR10MB6105.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:3e1::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.15; Wed, 30 Oct
 2024 07:44:28 +0000
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b854:7611:1533:2a19]) by PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b854:7611:1533:2a19%4]) with mapi id 15.20.8114.007; Wed, 30 Oct 2024
 07:44:28 +0000
Message-ID: <60dbaa12-68da-4485-ab75-b3fa8b93d06a@kontron.de>
Date: Wed, 30 Oct 2024 08:44:27 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] arm64: dts: imx8mp-kontron-dl: change touchscreen
 power-supply to AVDD28-supply
To: Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20241023152637.1301847-1-Frank.Li@nxp.com>
Content-Language: en-US, de-DE
From: Frieder Schrempf <frieder.schrempf@kontron.de>
In-Reply-To: <20241023152637.1301847-1-Frank.Li@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0008.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c8::19) To PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:263::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR10MB5681:EE_|DU0PR10MB6105:EE_
X-MS-Office365-Filtering-Correlation-Id: 1663c9c0-0e4e-4915-9bf7-08dcf8b6af12
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Q2tVNHJuVmlHUHhXZ3N0aHZhcHJBZXZYTlQyZmtkNWhqKzhWelduTmtNYkNL?=
 =?utf-8?B?YnFwSDFRSGJGbENBRkFlWmNsT0dSK0lpWmh6MWVnWDJWa2lsMkEzUnBPQ1Rq?=
 =?utf-8?B?a3dmbzF1ZDFQTkxkdGxmRU94QTNNaTdxL1hpNXRKUkx4UWJiUS9GTExWOFcz?=
 =?utf-8?B?RDN3TWhFWG1sYWloOFZyVGlOVG5PTHM4cEl6SW5DclNwUkU5YVV3c0xBTnJ1?=
 =?utf-8?B?bEswczl4M2RjNDU3Q2xzWTU3V3JYTWtPaHgwRndtck1RWlowMW5oRDBHUXMr?=
 =?utf-8?B?ZEh6aExLQ3ZHUDBVZEtSbGN2VU9hYjRCQUQ5NEV6M3llZk00a1pBdXhWWDFv?=
 =?utf-8?B?c2pvRUcyVGVaUGdsY09wZFFpbXFpUldHbDNqK09TZkVTdWVvRzRJOWZ4SE4z?=
 =?utf-8?B?SDRwd2dINHlHY2RiSE90eEZqNmlhTmFsYVlxbDZCVXh0Vk83N3VQdDZ0T0Mz?=
 =?utf-8?B?ZTlDc1podEM5VWs2RzY3V1dlZjF2WFlmMENMMGhvKzVVL2YwZFA4YllaK1Rx?=
 =?utf-8?B?QWhyZHRCY3BJUVZrMnhsa1laNGFNMDZucGQ2eTZlR2VwS1oxK1hCMENEaFJZ?=
 =?utf-8?B?TzBocG1oajBjRUlKT1JKZ01wcTlWa3dZYnhFUU0vaGxJQVdQK0RVS1AvNFdT?=
 =?utf-8?B?NVRnSjVsQVJjYkFvNi9QTlZ2Uzc0dzc3eWNpcmJvMU41KzZIK0s2eE0zYlZa?=
 =?utf-8?B?V1d5MXl5RVNNZVlNY3pjWHJuazRHV1RwdUMxYXdsYm8rTnpCdzNVcTl1eDht?=
 =?utf-8?B?QnNtaCtlZml2dEpQQlloOVBpYnRaK2hvWUtEdVI3UDRNOXdRRXJDR3FFNzlw?=
 =?utf-8?B?Mmxyc0xkYWMwRzZoMk13NDZPUGlqTGpzR3RxVzFrWk1lMmFhTWRxWVJtQk1i?=
 =?utf-8?B?NDJQTnJRUVE0RjVpNG1hL1dCdDNRRFUzRGxiMElSalVvRDR3cU5kL0EvY0oz?=
 =?utf-8?B?YURKYjdIUlFGNXp6VzRrQzN4bjIreDVXNmFmZEZCWFdFRGRkRXllbkZVRTZv?=
 =?utf-8?B?SzNFamJGUUtFaUZWUFR2VVFBbVQwcTFHY2NpamQ3d1B2UFdINU9heGdHeG1H?=
 =?utf-8?B?aE96Q2VnWWIxKzc1aDAva2Yzci9IYk9iQUI2Y2V5bytTOE4wZngwMkp5Znlu?=
 =?utf-8?B?S0RPaDVwbkpiUUhXZHlXZDhFN29oQjQzVkJqMVMwa2pqcTJJZUxrU0xsdkU3?=
 =?utf-8?B?ZGMwUnB2L2t0OC8zYzdqZlhtcjZvL3NmZjFMM2RqakRqUXNJVUh4V2YyUmR4?=
 =?utf-8?B?M01PZVF0VkhBRmFVSFlFWGJLMDA2WVRWM2hzUGtZaWlRMjZ6OENoc1pUUFo1?=
 =?utf-8?B?N3R4bUpsTWdYUkdRcUEvWGxrYmd2eUNPYzBpRUFVblZwcTc5WTZQczFaanRJ?=
 =?utf-8?B?V083S2RzZ1NoMG1DWmhTYUc4Yi9YeE1IekltR0Zobm5uczN0ejNGdGpDVnEv?=
 =?utf-8?B?cHFOV0N0NlVCdnBUNldpTDRKc3hselJLVzFlR0o3eW9mWFlVZUNOZ1hoZUE2?=
 =?utf-8?B?VzB5c2FLOVZTSXRoV1NCUW1HTTV3YlVzTnZYUXkyVGdXaklZYkJxV0lSengv?=
 =?utf-8?B?V20rUE84TGpndXhVdnZDMTdaVTNXK2tuS2lkYXFLYnUvWTg5NW4zb3JkekNK?=
 =?utf-8?B?TjNyRTRtbDFpYVZJRmhzZ3lrbXFxaWhzZ2xUcVZqNHp6YVZCQ2pKQ2pnTXpH?=
 =?utf-8?B?UGZzMEtFREJrK0gyRzZiQ0tQSkVXbG1Ja25NUEE0RUNnNTRRTUxUMHZlNENy?=
 =?utf-8?Q?OkCxVzfQIrnn+BT3Fk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NXZnOG0yYVI3YkVxNGFNdytzWkpOUXBoR2d1eG5hbEtTV2hzSDFoQndyODYw?=
 =?utf-8?B?N3ZjSXIzL0tCeFFMRGhTRUxwNTM2WG9pQ1MzbXMyZkJ3dzJ1cTZRNGwwSjdR?=
 =?utf-8?B?d3h6SUdMZ3hRdjM2RURWb211SmVNV3BJSk1ZdVl3Q1dMRk5yMGdlR0NBWWUr?=
 =?utf-8?B?SmxnaDFRRXdXN2RSMFhYa0dhMDhVeENBZEREbndCczNxaHZNODE4Tjc2dXlz?=
 =?utf-8?B?TENSTnlWbER4Q3NGd0lNMVNka2JIWUFMVzFMOEUzU2ZGeTJJMHczemsrWHdZ?=
 =?utf-8?B?cTVoRWJCWWJWa3ZRL3JpUzkvOGd2bWJyNEZVSXNNdkNZSnVlbTl3RTFkUnZJ?=
 =?utf-8?B?NzF0bEtrVUkxVnN5cDJFeWFoaGtuUmlRanZQMWpTUWZNVG1QZXUwd2VIc3J3?=
 =?utf-8?B?M1Z1Um1NdGd0U2Qwblh4bE5Lc21zRVBqQ0gzRXF4ZW9iVm00SVhXdm5WMFRp?=
 =?utf-8?B?WFMzQ0NZaHYrazZMNzBiR2srZis1NEd2OU1pK1ZVZHYrN2V1TjVRKzl0Z0tx?=
 =?utf-8?B?UWJpaGUyMG10REViL0w2ZWp6N29LMldlTmd1VFFhd3U0QTVveHk3NEZOUS8v?=
 =?utf-8?B?QWlSYS9CR2pzQUdUM1BnTUxtVCszYmZHZk1YakVMMTlaaG5sSXZINGlwVVZB?=
 =?utf-8?B?NDZlOTBWbmM4c0xhcDlnYVBzbDRMQU1kNVd2SFoyZzIxRDgvK20xakdRVkho?=
 =?utf-8?B?NUI1SjRPd2FXcFo4aEZGQWVoTmhpdTQxT0JjVjNGTVFCbFJXaEtUdUJ2VnJ1?=
 =?utf-8?B?NGg4b1NyTkk2SXZ2bDQ0SThuaXFseU9LVzN0M040VTdLdVBmbG5qRVdBeFBr?=
 =?utf-8?B?eVBmVEtXcnMyZ1A2SXpkWjVQWmJjVXZGSk4zMnJJQUpGbmNGeVcxb1ZNQjY5?=
 =?utf-8?B?emtlUTFqSE1aTHlXbjRVV1NSRElndlFPRW8rUjgrZlRma01ENUFNRHU2LytG?=
 =?utf-8?B?UlJyM2FvOE9pTTlod3p6V0lheGdmVG9NNEdLN3ZaSkszdVlGTTBwS0gxZU1F?=
 =?utf-8?B?c0VWeVVZdWFzVDFuRllCemhXU041VkVPK1Vuc0tuYjdDMVVvMnord21Oclcx?=
 =?utf-8?B?UThrRnE2WUFxZWI2b05UbDkvRFY2T2VjWTJwcVh1eUFnNVJiWG0yd2R5bFpL?=
 =?utf-8?B?TkFNdmIxMjc2bEwyZjJyODl4Nm50RTJjMm5HQWZ2cEhTVEpKQkdtalhGUzJY?=
 =?utf-8?B?MkdCczlEdkNkSW9Ccjg0d3doejhoZzVNWjBGaHVOMitwM3hicDFMK2F3bFdY?=
 =?utf-8?B?MmZmMHNCU0F2YzJaKy9ZMSs2c055TDc5aTZVZW8yaGZXbFgyT0dXbDRERGJh?=
 =?utf-8?B?T3dWVnozbGVUcW12RHBPQmxrRzNBTjQwK2Q0VDNhczdudlVBVTA4bVdJZmN0?=
 =?utf-8?B?TGdrRURBOVNpS0xITmVUREFpNjkvMk1LL1ZNUlluNnpTT2NQNklpV2VkSyto?=
 =?utf-8?B?NGVZdGIyclRVRmRsREJWTkY4N3h4QjBpUllqVWZZek8rUnVhSGgvakF4aGJW?=
 =?utf-8?B?UWE1OS9UTkxlalVjS0tDbTdzdUZDKzhMbm1SSW5DbkZlTi9yNDBISjJYSjA0?=
 =?utf-8?B?SGFHNVdoOS8xWklSNDBXSlYzcFdqbnBsQXhzeTlWaFZNaWc1NHlrL0NzZENl?=
 =?utf-8?B?MElmWDIycS9oZ3pNeHAvOGNWbndlZlR0dUR0MnJrbDJES1VUbmdRNlZxT3Ew?=
 =?utf-8?B?OWxmL2tWNmZwSXlnUUowY3FrRkFxZXVqNDFDWmZnTE13NzNGemsxRkRXUlA3?=
 =?utf-8?B?RXE4bkluYy9DcWZiTC9XVGZGdVU3NWFDTHdnY0dPVjRYUmlNSkp1Ti9YODhP?=
 =?utf-8?B?d0lva28zS3ZLbFptc1NBdHVYbXd3cXp0MW1rdGs1aVlKT1ZZT1FBUVpOQ1FK?=
 =?utf-8?B?UHNFWkNNNTUyTDZYMDk0N2JYa091bVBnUGR2OHcrWGVuWUlWOGlqa0lSYlBN?=
 =?utf-8?B?aVhqb1VpQ2dUREM3ZFd1aG03ZENUdjJOaGxpZ2o0bkRxa2drOFhJMHZWOVB6?=
 =?utf-8?B?dXlzTkZ1NWhXUFJsSURobnJ6dFNxVXhMUnRtTklnTy9lN29jU3lLSjVjUWU0?=
 =?utf-8?B?Vnh2N1FZQXI2WGJvaEZwaEQ5TzlIYlN2V3E4am1kbjljM1ZhV1NMYXEvS0Fk?=
 =?utf-8?B?aXZjZVl4SWpEZlBvdUhVVjZLMVpYUlhucFdua1J4UG4ydXFNaDE2dmFhZFBF?=
 =?utf-8?B?OEE9PQ==?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 1663c9c0-0e4e-4915-9bf7-08dcf8b6af12
X-MS-Exchange-CrossTenant-AuthSource: PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2024 07:44:28.6481
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n1uUeW0gvjxji0L5b2zEcvFXWpv+SsKL9Bfv4tzvnJ8KUFi6OjfEOKroPTQbf+587h9JZ51ZYK+/R02QEbLo5lJlStYgCDYfIYmeHeBNrWM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB6105
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_004442_536729_FD72D09C 
X-CRM114-Status: GOOD (  14.04  )
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

On 23.10.24 5:26 PM, Frank Li wrote:
> Update the touchscreen power-supply from 'power-supply' to 'AVDD28-supply' and
> 'VDDIO-supply' as per the binding documentation in goodix.yaml.
> 
> Fix below warning:
> arch/arm64/boot/dts/freescale/imx8mp-kontron-dl.dtb: touchscreen@5d:
>     'power-supply' does not match any of the regexes: 'pinctrl-[0-9]+'
>         from schema $id: http://devicetree.org/schemas/input/touchscreen/goodix.yaml
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Thanks for the fix!

Reviewed-by: Frieder Schrempf <frieder.schrempf@kontron.de>

> ---
>  arch/arm64/boot/dts/freescale/imx8mp-kontron-dl.dtso | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-kontron-dl.dtso b/arch/arm64/boot/dts/freescale/imx8mp-kontron-dl.dtso
> index 134bdf156607c..a3cba41d2b531 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp-kontron-dl.dtso
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-kontron-dl.dtso
> @@ -80,7 +80,8 @@ touchscreen@5d {
>  		interrupt-parent = <&gpio1>;
>  		interrupts = <6 8>;
>  		irq-gpios = <&gpio1 6 0>;
> -		power-supply = <&reg_vcc_panel>;
> +		AVDD28-supply = <&reg_vcc_panel>;
> +		VDDIO-supply = <&reg_vcc_panel>;
>  		reset-gpios = <&gpio1 7 0>;
>  	};
>  };


