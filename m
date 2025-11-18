Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AA76CEE342
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 17:35:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qkqhC7sljj8IfAo5xmYhjBdfyg7/dNxJk27Fn0CCpHM=; b=RGMHFIoOyAjrpD/itD9k67tQU4
	z4h+dsEHmmEn6VNsPALUGOWm7ge3IScmtQ2Z+KyBfmTB2o7PhRk4PTeijpI6XLP950ayeAnetxDmq
	sVaWYD8orRnQ7GcCj+IafDjOJK/PYXTq0qlCjT6d/AForjkjoALJqZtVNLfMOgvHHEnDda8RmBVBM
	hvgaBL0rSat6U5zQyFn2+F+GF4QPg0LijR3rHHlDxBDTrWyBBc2ZN4b3Lz0Ye1/JpbUHCcClGD4LX
	9L3Ak1h+Y402ulUxbUBuBK/DqA8avKKBBp7bmi6Lm9iRKOYo+mPg3zUUfFXycaFXlhnPzPRJ5C99v
	LfRBY97Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLPbs-00000000sGA-1hfs;
	Tue, 18 Nov 2025 17:35:20 +0000
Received: from mail-southcentralusazon11022111.outbound.protection.outlook.com ([40.93.195.111] helo=SN4PR2101CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLPbp-00000000sFj-3lQf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 17:35:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iUjNFhEhG3iiigAAJGMlqTcV+7kGXxj5pNz0bwaXoDCPwMk/adPZykGCliW8AHULSbtWM7bXcNhG0Pr/oLFoW+GTCTkU8lYtywXBcegxtvbdYoRZwwYksfND0t29mdEJudyo8ieGlYjsMi3QB1cE51oKLTPKbCg5j7sMbACR2S0R0xA39ZKgp2qaKrhWmg3S1j1c/fYK7c3bo82eb38v0V9a21tT6c5G+qQ82ZSqEdp24wv4V8p6nVEtaCaabWy6sM/YcDjSek/MDp5IDCKDAAveCbTTlnFCjVjf2DTmORcDPCYLPNDlbkDaps71PBp+NxzTCJJF++ck0l/8NJaBvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qkqhC7sljj8IfAo5xmYhjBdfyg7/dNxJk27Fn0CCpHM=;
 b=exZ8mdfB6CbNnCXSv9axdQesmvEATQ+brkK11hIf+4kXa0t+I38nS5oad/EYCBv1M0x8JKKIGZAhPnombd8VMAVqKtvWyHUkuVbWNbYOVv1FCKBSWAsetr302+EXi8ERjBGicaCQ110j9Z4r5aFhZ5mHx2O6xVV8aIR3FUZJTaP7RHADvAgtOizwDxkjF7nr8CbFKXHGmjDVAvPj6X10ALhEQUruTq7XRY+v4NC6BuQS3vkpZkwzsVXv1iUT3y39u5ZoR46Ukffp6/O4AJQNo1b6QUgatcwRZxSkuF/bXC9+jb4VYVSv75G0Swv72D7N+FjdmeApgzAEG6GhEvwuxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qkqhC7sljj8IfAo5xmYhjBdfyg7/dNxJk27Fn0CCpHM=;
 b=cCu2mV1M4D3XiJODQ82950FdH1zs/yKgOrOkIPqGfUDjnzL5mxlR7PqlIBFTALtdYmpdcp8HZ5Nb54P6BQ0LlbrxFR/PAleSxuU0zgljQiKJ3T7Eaqv0QLbStDi59SMfKrhRBpS7MutqcVuvcUD7VM+D3S5dzKvAWNhflJwyl2A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from CH0PR01MB6873.prod.exchangelabs.com (2603:10b6:610:112::22) by
 CH3PR01MB8742.prod.exchangelabs.com (2603:10b6:610:207::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.20; Tue, 18 Nov 2025 17:35:11 +0000
Received: from CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::3850:9112:f3bf:6460]) by CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::3850:9112:f3bf:6460%3]) with mapi id 15.20.9320.021; Tue, 18 Nov 2025
 17:35:11 +0000
Message-ID: <7147bd7c-f4b2-4757-96f5-d9b61405ec91@os.amperecomputing.com>
Date: Tue, 18 Nov 2025 09:35:08 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [v2 PATCH] arm64: mm: make linear mapping permission update more
 robust for patial range
To: Nathan Chancellor <nathan@kernel.org>
Cc: ryan.roberts@arm.com, dev.jain@arm.com, cl@gentwo.org,
 catalin.marinas@arm.com, will@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251023204428.477531-1-yang@os.amperecomputing.com>
 <20251118164115.GA3977565@ax162>
Content-Language: en-US
From: Yang Shi <yang@os.amperecomputing.com>
In-Reply-To: <20251118164115.GA3977565@ax162>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR07CA0049.namprd07.prod.outlook.com
 (2603:10b6:a03:60::26) To CH0PR01MB6873.prod.exchangelabs.com
 (2603:10b6:610:112::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR01MB6873:EE_|CH3PR01MB8742:EE_
X-MS-Office365-Filtering-Correlation-Id: 29ed9a3f-5ce8-4ef0-aab9-08de26c8d331
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SytJNFBMYlQrRHRrUVJaR3pMd1VnekM4VHBad0RxSk9ONFVPaTl2YjJxZGp0?=
 =?utf-8?B?cTJCWURoeWJEdWUwRVdXUjJaSncwQzN1SGZoajF4dDlIZm5tcHRoWFVEZ3p0?=
 =?utf-8?B?NndadDJzektBZmVIblNiN2xDc0laZGhQZThFZFdacVpoK3cvRVl5NEpwUkxR?=
 =?utf-8?B?cnh2K25KMjR1Y0ZuVG8vYXFJRjROeXhHTVhHNzdOSSsxdyt6dEVTYmhWRDZh?=
 =?utf-8?B?Ym5ZMVBwUjBMaVgzOU93MVRjTE9ET1QzNjVDTlBEOCtSTmlZUTh3NHhkWTBk?=
 =?utf-8?B?Z2JKSWZ4Uis4OTA0N1A1a3BKY1BVRi9IcnlrUnV1N3hLSTFLRlpjaW40YjFZ?=
 =?utf-8?B?ZWQzVUovRS80eC9MVnZqcllSU1ZCelo1eGlCZlRQajBMQlM3cGo2Q1dZZjR4?=
 =?utf-8?B?ZXcwV04yd0xqZ0IrRUNxditKSG9meVkxNmtNKzJoNHRuWUxNMjZqWjhUOHAz?=
 =?utf-8?B?Ry9FMVBSVlZyQWtiWUE0ZmkwSHZ0SjlCTEJrbEhTSkVxY3hPOWRJa3Y0N2kx?=
 =?utf-8?B?WTBDQWpJRXpCNDVVbG9Tb2hFTDNpdWZxTkJVOWhoS0xmR002M1IvOEhPanZx?=
 =?utf-8?B?S0VITlU1M0xVaFNWa0FrR1pFQTZGNm1hZ3BZdlZDYnBtUlZJVFVteVpjMmRI?=
 =?utf-8?B?aEw2QytTNkczRkE5eVF2K2J4eFNBQ0w3QlRIMzN1eEhTLzgxS1paK3RtUUYz?=
 =?utf-8?B?Sk5EUXQ0c2F3S3VhUFpvT1pzYlFXOTdHcjBrZFUxUVEzTzhPc2dPbkJPT0Z3?=
 =?utf-8?B?R2VPNnVpWVloTDd0dTJoRGM2bnNUVlA5MW1vRXJaeVZrZXJ6MGxXdzZKWStT?=
 =?utf-8?B?b1lQOGxUOWJnRkpzY0RlVm5jOWc5Tm01TEtBbjZkYkRiUkdRaitGNC83Mjlv?=
 =?utf-8?B?WWlNcEZwSkt0Uk1LdGlCaHhXbVIwVFNvK0xGS2VUQW1FdGorL21EODRlSkdx?=
 =?utf-8?B?MlBaSUlGN0JLL2Z1UytYY0d2QXZVMlh4Q2lDc0VmeFBmcitWWmR0SnozR0F1?=
 =?utf-8?B?RG5JTUlkaGZvdnU1NHJibXM3UmN2YklNeHdGa09xRld4encwemZpRjB3aE04?=
 =?utf-8?B?RlYrVk1FcXhOT3h0TXFHdDlyR1RLRU0yMk1tcWdvK0M1MWRNZTYraXNNVmEr?=
 =?utf-8?B?eSt5M280U3oza3FTQ3lMV1BwRmROdEZ1SEU1cXpoUlVPbUhrZ0VWQm9FRzBm?=
 =?utf-8?B?MWtoWnJXay9ZbmJFcU9KSzFhbWQwMnVZdVhrd3d4WG45SmtLMkRUQzVBK3Z4?=
 =?utf-8?B?c3FOVkswT3pTSzdPdFl3SXVpMHpoQ1kzWlZEcUQzZkc1U2R2YS9UUXMvQ3NP?=
 =?utf-8?B?RVZ1Ykpkbm5icVV3L05QYmRlNXNyaGlRY09vNEtjcHFNWkhwRy8xcVZkbEQx?=
 =?utf-8?B?dnlaWHg4dXZOMjdoenhyU2w1OURzMytDTHZiUk9sNCtaUTNNc2pLUkI1SHVm?=
 =?utf-8?B?dVppWEllcXNvd1JoSlNNL1JrQnE4SnJyTEI1RzJzeGV6V3RCcnE1OFZDTWxE?=
 =?utf-8?B?aTFPZmEyWHVJeGxYcXVpZ1lUM3FtaCtLa1kvYjZJWTA5Smx2RnJ4d285dW95?=
 =?utf-8?B?enNjakhsY2NRR1hjaGx3YmUwcmlxbmxXWXBMK3BMZGRiazFvWHloKzlXa1RP?=
 =?utf-8?B?cVBYeHZ0VmRzZjBCdDE0c2tXQ0ZRc2QyVjJnMHB6TnhXWWU5Ulorc2lzakRZ?=
 =?utf-8?B?aUZXd1l5MWVjNlQwRzRVOHJrWnR0ck9CaGlqR3ZKRk9nUXk1SUdaTU9vbUg5?=
 =?utf-8?B?N2lTS1hWWjdYSS9VdmMzTi95ZUQvV096d3hVVTNhNUt2TGVYbkVIRTVNNDMz?=
 =?utf-8?B?TDB6ZHZ1OU5zdFBnR1lEVFlrK290N3RPbTJWWXNVak9qdE05R3M4ZHVGeENs?=
 =?utf-8?B?N1Z1WHo1L2phTkREK1VxN3JsQzRsRTFma0l1S1JjanBscktaMTlFeCtXVE9T?=
 =?utf-8?Q?gJTCKa4C2BSUfTc1UUDyPkstBjdycnpm?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR01MB6873.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OHNmeE02NW9FU3R5TmQ4bmdtZVdqT0IwUGF5WFNrRzhzeW90U2E5S0I0VGlE?=
 =?utf-8?B?b0lOYyszYlQzcVR0L2R6WjhTZm1rZytiTTlKV2hpN1pnUXRTV0RlU2ZLb09l?=
 =?utf-8?B?RzRQeXFWT0RnemROdlNobGZOb3ZhaWlOUkFxZ0YweE1CVjVtODI1MVBHQlFl?=
 =?utf-8?B?V2JoVXpMSHVwVURCbUpqWFZoWUVQQk1UWFNWd3U0WDNYdi9BNXJ4cU1wZWN2?=
 =?utf-8?B?bFE1TG5YTExFdkpjTHo5L0VIcHZkNmdZaWpwNFBvaSs1NDQrTjZ0L05sR3lY?=
 =?utf-8?B?Yjl4KysxNUY5VUxTVjdwbHF6cVBSSXZOWFNVZUJ5TmpTYUE0WWpQTDZQa1cv?=
 =?utf-8?B?N3JKcENKK1hpZ3dBRklETXBISmlRU2JVTExCQnkwdU5mbTdpamhjR2xDVVhr?=
 =?utf-8?B?WjlNSmxNOVNCazJXT3poeWw0cUVHMWZlekNDeEhJZDJXeEg1RXJhQURmeWxJ?=
 =?utf-8?B?YTNXbm1BKzI2Y0pDRXJTTnVYeXBqRGVnVjNwYndRb2pIcU5nNkhuU05KUWY3?=
 =?utf-8?B?NU91VHEwOWV0ZE8xV2xleE1FL2E3WEtLMElSMGJjTDlnUm9vTUlPSm04dEJs?=
 =?utf-8?B?bjJnNVdIRmM2NmkvNG0xL0tWQkRiYy9pRDNNMWxNWXc4b29FRU9FL3NoUHpY?=
 =?utf-8?B?ZkpWU3dFTlRnREhMQ2tLSVpBd0twQVk2NmJMenlaL3RwWEFBd0c5djZjZ0lz?=
 =?utf-8?B?RDFKcklkMkJwdDZ2cWhrMTlMOHIrOFlCMldKN3hVQXZEVVF0TE9sUWFwOXU2?=
 =?utf-8?B?OFJVVmJUMnN5aXRLSFJvb3ZvQWRZUjBRZGUwNE9OcXRmckthTGRRU2lDdDdS?=
 =?utf-8?B?YnBKN3BOUUk0dXFKcDlVNndxR1hsMktOQlhGKzd6TDhtQjJwWTFIZEx6eVhD?=
 =?utf-8?B?dnFQOXRpNnZDVHRoVEpjU2xtQUh3eUpTcmt4VXMxSjhSMkMwN0tmS3BncEdi?=
 =?utf-8?B?bXMvUTZGc3JVVlJnbTVtY0h2VitSamZqeVJENGZaUTF5VWR6ZzNWVVRrRkdY?=
 =?utf-8?B?ZVNWencrNlErNTVhLzNQbWQrMWhPdit6VDVDbWVQM2ZqV0R0T2JzUkhZWU1p?=
 =?utf-8?B?cVRGakwwb1RCcW5DdWF2SEVsNnkrZUFBRXFHYTRxYW0xZ2JzZkJVVmNack5p?=
 =?utf-8?B?TmhXcjNlQVkwL1h5c3Zoajk5K3Z3TGM3eC9LR2trZUxQYkNmSllUeXJlMmdm?=
 =?utf-8?B?MWJ0MUkyYnphdzU5V3ZHRUxRVjIvZ1locWcybmNxWlU3WFYxdnBYZm9zMVJS?=
 =?utf-8?B?NUpJMFVKUzl2bUNJdDhaOXA5S2VPTmIvR0tsWXYzM3RCS2R1K3N0dld4M01G?=
 =?utf-8?B?d2psNFR6RFczZFBGZWxYVWpkbi9hREhqb2xZSjRFcjhwUEVWRVgrOHpSTnky?=
 =?utf-8?B?cHJYalBVNTlWY3pqUjVKMUh0ZUVEU1JUdDVKbUp0d0Q5eFZrYjZnamhXb0ZD?=
 =?utf-8?B?alg2Z2tkcndEMThpclZmODlmSFd3ZXI4WjdYSGRBQk56WnlobW1uQTBucXNS?=
 =?utf-8?B?djc5SW1Rc3M3RUNJSzM2WElkNnNrdXpvazJZcnhtYzZWNUZNOUNsU25xNTRQ?=
 =?utf-8?B?NVpzTVZzRTBWakZyMEtoV3Y0YlRWVWVIMFBlb1Y2ekVMRHp0TXcxMmFFWEN5?=
 =?utf-8?B?WG9iSHMzMGpReVBybG5oNEZ2aTNUdTJCWXdUeFJpTGhYNElMSE9MVkp1K0g0?=
 =?utf-8?B?STdyRWIwS3pZNDVYSnFUbFlnQ2tMWnJPak1GOWZhcmRaMlNRNlozeEpjMUlq?=
 =?utf-8?B?dEdWWHk1VkVjV0xIU3NUZmNHendnK2plSmxpSWQxUkM4aDBWZi9qRFg2WC9H?=
 =?utf-8?B?YnJ1bW1tV0hWM1VlM0xtRmt4anNBNHF4S01jbXd6aElLMnN6SzlKaURnbS9X?=
 =?utf-8?B?MzE2L0gyaEFvKzg4QXRKREtTcGlrUHZQRkFGR0NQcG93REFGR2JqSG5kSmF4?=
 =?utf-8?B?OE8vMjJmdHdvYm04SHRvWHRWYTlVdjNqMm1JeFJDRHA4RlBMY0dzSCttVFdy?=
 =?utf-8?B?dFNpMzlUSldRYUJZTC9xYjdvNFRvWGMrSmVDdVljeDl6TEFIVzBKRjFtSkdh?=
 =?utf-8?B?QXNaem15STVNWTcvME5Md1JWUGMxdTlCeStxOHNQaHplM3dDUEI1di8wcDkx?=
 =?utf-8?B?Y2poZk4vVThUekIwUUZEck5JbnVmdmNaMkk1SUM5R0kzUFlOc2JvUjFCVm9U?=
 =?utf-8?Q?PbVpJF5S6XcuzRQMHmcy7e8=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29ed9a3f-5ce8-4ef0-aab9-08de26c8d331
X-MS-Exchange-CrossTenant-AuthSource: CH0PR01MB6873.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 17:35:11.3231
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sjkoPoWtN47VFKRml/YMtU3RQagvVxxtVVE75loteg6NqdHOqgs7PacAtC4uaXrW2otjv7W02WXPZ9JcLu2blX9bIYlcf2bMoCFMfJV0vwk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR01MB8742
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_093518_001798_F2596519 
X-CRM114-Status: GOOD (  21.84  )
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



On 11/18/25 8:41 AM, Nathan Chancellor wrote:
> Hi Yang,
>
> On Thu, Oct 23, 2025 at 01:44:28PM -0700, Yang Shi wrote:
>> The commit fcf8dda8cc48 ("arm64: pageattr: Explicitly bail out when changing
>> permissions for vmalloc_huge mappings") made permission update for
>> partial range more robust. But the linear mapping permission update
>> still assumes update the whole range by iterating from the first page
>> all the way to the last page of the area.
>>
>> Make it more robust by updating the linear mapping permission from the
>> page mapped by start address, and update the number of numpages.
>>
>> Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>
>> Reviewed-by: Dev Jain <dev.jain@arm.com>
>> Signed-off-by: Yang Shi <yang@os.amperecomputing.com>
>> ---
>> v2: * Dropped the fixes tag per Ryan and Dev
>>      * Simplified the loop per Dev
>>      * Collected R-bs
>>
>>   arch/arm64/mm/pageattr.c | 6 +++---
>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/arch/arm64/mm/pageattr.c b/arch/arm64/mm/pageattr.c
>> index 5135f2d66958..08ac96b9f846 100644
>> --- a/arch/arm64/mm/pageattr.c
>> +++ b/arch/arm64/mm/pageattr.c
>> @@ -148,7 +148,6 @@ static int change_memory_common(unsigned long addr, int numpages,
>>   	unsigned long size = PAGE_SIZE * numpages;
>>   	unsigned long end = start + size;
>>   	struct vm_struct *area;
>> -	int i;
>>   
>>   	if (!PAGE_ALIGNED(addr)) {
>>   		start &= PAGE_MASK;
>> @@ -184,8 +183,9 @@ static int change_memory_common(unsigned long addr, int numpages,
>>   	 */
>>   	if (rodata_full && (pgprot_val(set_mask) == PTE_RDONLY ||
>>   			    pgprot_val(clear_mask) == PTE_RDONLY)) {
>> -		for (i = 0; i < area->nr_pages; i++) {
>> -			__change_memory_common((u64)page_address(area->pages[i]),
>> +		unsigned long idx = (start - (unsigned long)area->addr) >> PAGE_SHIFT;
>> +		for (; numpages; idx++, numpages--) {
>> +			__change_memory_common((u64)page_address(area->pages[idx]),
>>   					       PAGE_SIZE, set_mask, clear_mask);
>>   		}
>>   	}
>> -- 
>> 2.47.0
>>

Hi Nathan,

> I am seeing a KASAN failure when booting in QEMU after this change in
> -next as commit 37cb0aab9068 ("arm64: mm: make linear mapping permission
> update more robust for patial range"):

Thanks for reporting this problem. It looks like I forgot to use 
untagged address when calculating idx.

Can you please try the below patch?

diff --git a/arch/arm64/mm/pageattr.c b/arch/arm64/mm/pageattr.c
index 08ac96b9f846..0f6417e3f9f1 100644
--- a/arch/arm64/mm/pageattr.c
+++ b/arch/arm64/mm/pageattr.c
@@ -183,7 +183,7 @@ static int change_memory_common(unsigned long addr, 
int numpages,
          */
         if (rodata_full && (pgprot_val(set_mask) == PTE_RDONLY ||
                             pgprot_val(clear_mask) == PTE_RDONLY)) {
-               unsigned long idx = (start - (unsigned long)area->addr) 
 >> PAGE_SHIFT;
+               unsigned long idx = (start - (unsigned 
long)kasan_reset_tag(area->addr)) >> PAGE_SHIFT;
                 for (; numpages; idx++, numpages--) {
__change_memory_common((u64)page_address(area->pages[idx]),
                                                PAGE_SIZE, set_mask, 
clear_mask);

Yang

>
>    $ make -skj"$(nproc)" ARCH=arm64 CROSS_COMPILE=aarch64-linux- mrproper virtconfig
>
>    $ scripts/config -e KASAN -e KASAN_SW_TAGS
>
>    $ make -skj"$(nproc)" ARCH=arm64 CROSS_COMPILE=aarch64-linux- olddefconfig Image.gz
>
>    $ curl -LSs https://github.com/ClangBuiltLinux/boot-utils/releases/download/20241120-044434/arm64-rootfs.cpio.zst | zstd -d >rootfs.cpio
>
>    $ qemu-system-aarch64 \
>        -display none \
>        -nodefaults \
>        -machine virt,gic-version=max \
>        -append 'console=ttyAMA0 earlycon' \
>        -kernel arch/arm64/boot/Image.gz \
>        -initrd rootfs.cpio \
>        -cpu host \
>        -enable-kvm \
>        -m 1G \
>        -smp 8 \
>        -serial mon:stdio
> [    0.000000] Booting Linux on physical CPU 0x0000000000 [0x413fd0c1]
> [    0.000000] Linux version 6.18.0-rc1-00012-g37cb0aab9068 (nathan@aadp) (aarch64-linux-gcc (GCC) 15.2.0, GNU ld (GNU Binutils) 2.45) #1 SMP PREEMPT Tue Nov 18 09:31:02 MST 2025
> ...
> [    0.148789] ==================================================================
> [    0.149929] BUG: KASAN: invalid-access in change_memory_common+0x258/0x2d0
> [    0.151006] Read of size 8 at addr f96680000268a000 by task swapper/0/1
> [    0.152031]
> [    0.152274] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.18.0-rc1-00012-g37cb0aab9068 #1 PREEMPT
> [    0.152288] Hardware name: linux,dummy-virt (DT)
> [    0.152292] Call trace:
> [    0.152295]  show_stack+0x18/0x30 (C)
> [    0.152309]  dump_stack_lvl+0x60/0x80
> [    0.152320]  print_report+0x480/0x498
> [    0.152331]  kasan_report+0xac/0xf0
> [    0.152343]  kasan_check_range+0x90/0xb0
> [    0.152353]  __hwasan_load8_noabort+0x20/0x34
> [    0.152364]  change_memory_common+0x258/0x2d0
> [    0.152375]  set_memory_ro+0x18/0x24
> [    0.152386]  bpf_prog_pack_alloc+0x200/0x2e8
> [    0.152397]  bpf_jit_binary_pack_alloc+0x78/0x188
> [    0.152409]  bpf_int_jit_compile+0xa4c/0xc74
> [    0.152420]  bpf_prog_select_runtime+0x1c0/0x2bc
> [    0.152430]  bpf_prepare_filter+0x5a4/0x7c0
> [    0.152443]  bpf_prog_create+0xa4/0x100
> [    0.152454]  ptp_classifier_init+0x80/0xd0
> [    0.152465]  sock_init+0x12c/0x178
> [    0.152474]  do_one_initcall+0xa0/0x260
> [    0.152484]  kernel_init_freeable+0x2d8/0x358
> [    0.152495]  kernel_init+0x20/0x140
> [    0.152510]  ret_from_fork+0x10/0x20
> [    0.152519] ==================================================================
> [    0.170107] Disabling lock debugging due to kernel taint
> [    0.170917] Unable to handle kernel paging request at virtual address 006680000268a000
> [    0.172112] Mem abort info:
> [    0.172555]   ESR = 0x0000000096000004
> [    0.173131]   EC = 0x25: DABT (current EL), IL = 32 bits
> [    0.173954]   SET = 0, FnV = 0
> [    0.174481]   EA = 0, S1PTW = 0
> [    0.174957]   FSC = 0x04: level 0 translation fault
> [    0.175714] Data abort info:
> [    0.176160]   ISV = 0, ISS = 0x00000004, ISS2 = 0x00000000
> [    0.177014]   CM = 0, WnR = 0, TnD = 0, TagAccess = 0
> [    0.177797]   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
> [    0.178648] [006680000268a000] address between user and kernel address ranges
> [    0.179735] Internal error: Oops: 0000000096000004 [#1]  SMP
> [    0.180603] Modules linked in:
> [    0.181075] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Tainted: G    B               6.18.0-rc1-00012-g37cb0aab9068 #1 PREEMPT
> [    0.182793] Tainted: [B]=BAD_PAGE
> [    0.183369] Hardware name: linux,dummy-virt (DT)
> [    0.184159] pstate: 40400005 (nZcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> [    0.185366] pc : change_memory_common+0x258/0x2d0
> [    0.186179] lr : change_memory_common+0x258/0x2d0
> [    0.187004] sp : ffff8000800e7900
> [    0.187581] x29: ffff8000800e7940 x28: f8ff00000268a000 x27: 00003e0040000000
> [    0.188818] x26: ffffff0000000000 x25: 0000000000200000 x24: ffff8000804e9000
> [    0.190046] x23: 0008000000000000 x22: 0000000000000080 x21: 0067800000001000
> [    0.191283] x20: 0067800000000000 x19: 66ff000002ff9d20 x18: 00000000781044e3
> [    0.192519] x17: 0000000000000000 x16: 0000000000000000 x15: 0000000000000000
> [    0.193758] x14: 0000000000000000 x13: 746e696174206c65 x12: 6e72656b206f7420
> [    0.195001] x11: 65756420676e6967 x10: 6775626564206b63 x9 : 0000000000000007
> [    0.196218] x8 : ffff78000800e776 x7 : 00000000000000ff x6 : ffff700000277000
> [    0.197429] x5 : 0000000000000000 x4 : efff800000000000 x3 : ffffd8c39bb09964
> [    0.198647] x2 : 0000000000000001 x1 : 55ff000002770000 x0 : 0000000000000000
> [    0.199869] Call trace:
> [    0.200298]  change_memory_common+0x258/0x2d0 (P)
> [    0.201117]  set_memory_ro+0x18/0x24
> [    0.201747]  bpf_prog_pack_alloc+0x200/0x2e8
> [    0.202499]  bpf_jit_binary_pack_alloc+0x78/0x188
> [    0.203325]  bpf_int_jit_compile+0xa4c/0xc74
> [    0.204070]  bpf_prog_select_runtime+0x1c0/0x2bc
> [    0.204886]  bpf_prepare_filter+0x5a4/0x7c0
> [    0.205621]  bpf_prog_create+0xa4/0x100
> [    0.206305]  ptp_classifier_init+0x80/0xd0
> [    0.207019]  sock_init+0x12c/0x178
> [    0.207615]  do_one_initcall+0xa0/0x260
> [    0.208293]  kernel_init_freeable+0x2d8/0x358
> [    0.209049]  kernel_init+0x20/0x140
> [    0.209660]  ret_from_fork+0x10/0x20
> [    0.210293] Code: 9410db81 f940127c 8b140380 9410db7e (f8746b9c)
> [    0.211341] ---[ end trace 0000000000000000 ]---
> [    0.212148] Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b
> [    0.213317] SMP: stopping secondary CPUs
> [    0.213963] ---[ end Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b ]---
>
> # bad: [0c1c7a6a83feaf2cf182c52983ffe330ffb50280] Add linux-next specific files for 20251117
> # good: [6a23ae0a96a600d1d12557add110e0bb6e32730c] Linux 6.18-rc6
> git bisect start '0c1c7a6a83feaf2cf182c52983ffe330ffb50280' '6a23ae0a96a600d1d12557add110e0bb6e32730c'
> # bad: [821f0a31ee487bfc74b13faa30aa0f75d997f4de] Merge branch 'master' of https://git.kernel.org/pub/scm/linux/kernel/git/herbert/cryptodev-2.6.git
> git bisect bad 821f0a31ee487bfc74b13faa30aa0f75d997f4de
> # bad: [21cf360c8ba83adf9484d5dee36b803b3aec484f] Merge branch 'next' of https://git.kernel.org/pub/scm/linux/kernel/git/uml/linux.git
> git bisect bad 21cf360c8ba83adf9484d5dee36b803b3aec484f
> # bad: [fa87311c638d397ba4d20b57f1e643e0c7f43bc6] Merge branch 'for-next' of https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git
> git bisect bad fa87311c638d397ba4d20b57f1e643e0c7f43bc6
> # good: [880e7ed723955d5ed056394b6420c0438e601630] Merge branch 'mm-unstable' of https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
> git bisect good 880e7ed723955d5ed056394b6420c0438e601630
> # bad: [e9d0f4c5024eb6a75396140378f3149b6d7e597f] Merge branch 'for-next/perf' of https://git.kernel.org/pub/scm/linux/kernel/git/will/linux.git
> git bisect bad e9d0f4c5024eb6a75396140378f3149b6d7e597f
> # good: [40e8a782180dde6542d6e17222fb71604254a6f2] Merge branch 'kbuild-next' of https://git.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git
> git bisect good 40e8a782180dde6542d6e17222fb71604254a6f2
> # good: [3622990efaab066897a2c570b6e90f4b9f30b200] perf script: Change metric format to use json metrics
> git bisect good 3622990efaab066897a2c570b6e90f4b9f30b200
> # good: [4eed2baf8f1622f503396eda30d360ecc46fc1a5] Merge branch 'for-next' of https://git.kernel.org/pub/scm/linux/kernel/git/rmk/linux.git
> git bisect good 4eed2baf8f1622f503396eda30d360ecc46fc1a5
> # good: [cdcfd8a60eb28122cb7e4863a29bc9f24206ccba] Merge branch 'for-next/typos' into for-next/core
> git bisect good cdcfd8a60eb28122cb7e4863a29bc9f24206ccba
> # bad: [f27acb65b4696bf1a251b077b9d6e8ec73516ba6] Merge branch 'for-next/core' of https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux
> git bisect bad f27acb65b4696bf1a251b077b9d6e8ec73516ba6
> # good: [a04fbfb8a175d4904727048b97fcdef12e392ed1] arm64/sysreg: Add ICH_VMCR_EL2
> git bisect good a04fbfb8a175d4904727048b97fcdef12e392ed1
> # good: [c320dbb7c80d93a762c01b4a652d9292629869e7] arm64/mm: Elide TLB flush in certain pte protection transitions
> git bisect good c320dbb7c80d93a762c01b4a652d9292629869e7
> # bad: [c464aa07b92ecd1c31f87132f271ac5916724818] Merge branches 'for-next/misc' and 'for-next/sysreg' into for-next/core
> git bisect bad c464aa07b92ecd1c31f87132f271ac5916724818
> # bad: [37cb0aab9068e8d7907822405fe5545a2cd7af0b] arm64: mm: make linear mapping permission update more robust for patial range
> git bisect bad 37cb0aab9068e8d7907822405fe5545a2cd7af0b
> # first bad commit: [37cb0aab9068e8d7907822405fe5545a2cd7af0b] arm64: mm: make linear mapping permission update more robust for patial range
>
> If there is any information I can provide or patches I can test, I am
> more than happy to do so.
>
> Cheers,
> Nathan


