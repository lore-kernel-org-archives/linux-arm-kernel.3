Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08EEEC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 02:05:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f/YedpkzktZoscppGyX70s2xLcOczmnu7AO4ThumRnM=; b=vNNyYCRSZjSJnWZJ0HOsaEyMHA
	gjEw/nMVv86G0OBVZ5to9btYTyT0kuNa7XUYFlf8f49poAq2WuHIyCtYvKBw8cXbW6zQAGuWQ1gAc
	e4507DCYv3N6SRfP2nvCP70yKNGA4RrURxm3Qx9BUlzSJqbp0blhqEIyYMeovjw1ivbY5l8wHTwAs
	iArkodhdGOZx2nsLJXKoNDByLLeDeWcTjqIbTtv/NUnDiKAKHrjpRas4nCVyFInG2Bz9/qovtBHnF
	tG1REUYs2r1K1CS0kkyXM0OET7dwBeR0wD+zMhm3VyIT8eilqL5SeKqas28n3NDWm8obfsR/AI4Uu
	mmaUZ6Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ub8ZJ-00000000wXF-1DfP;
	Mon, 14 Jul 2025 02:05:25 +0000
Received: from mail-japaneastazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c405::5] helo=TYPPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ub8Wt-00000000wEZ-2uiw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Jul 2025 02:02:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VKHPet9DUClzE9Trp5nKpW3/NHV8bi4Mq7BLu2J+S2QqCpEWf60WSbZ4z9KoXB998gLoSQqS0QTwglVD1B6R1G0b3ehczU1ZSmLizmoJ0sBHMW2jKhZlQDNM+wKf3qRRfNxMBNETV595uR2cpWTYVU+r9j3GuzWPrMBK8KYUA/ZVfIwsVCCqRA7UcPxWcLl69Khuc+QjtsG827BlMTZgtuc/EjT/PKU+2HT9zhJIq9085Mf1HkSCDXNH2V2jrbpr3IJXpGxNtDHe7VkJWsw3+YHPvF7a2TMBEOyxWqkwO0ChkxRxdaUGUENow8H9hqfjw1Y1MR7KRAGfyvxnNBNgkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f/YedpkzktZoscppGyX70s2xLcOczmnu7AO4ThumRnM=;
 b=fpVaTcEHqaAwp/nkV9mcopMCRp9R8HeavWfk2X5pZhu8IaymTK458J0Z1wc0ZuXnd2eShWrtscCYC1p4k9IWpKDNYDhkK4gQNGxLTgcIAqaRWWT/xhj043gCCz+6C8xfEepRWmjwg6zxVExmMiXo0RnpjjcY+ASq61Styq0foH8v3VYKTV65B9E24MmJ8XMkZk2b5Uys+46Pd24DrhBrBwoI+U1F/3mqq8D2a03oEZMK2rQkv3A8Mb3yT7IPTLWKCa8l8uDtESLo4UBYp+U26FupwMDCz9eDSxasApDyye79i/A9BHXaevl33RWOfhDvTL36L9grJvxV1yVxpjcoPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f/YedpkzktZoscppGyX70s2xLcOczmnu7AO4ThumRnM=;
 b=ffILAC03DHpTZL5qA+ZomjRRK2rv+LCfoQXo7l8QY15e0E0UAqrFrwnZ+6tFivhRkd+nTJH7fWS2LJ0IttNgIr3ThdZtJ5HzuYZiZmO74+JstXD5/VbtcNfOwqGWy2Rnbrqv6qcYidzHu9jGqggAXxzw7gzXAQu+fMf6nIC0mM6kIhfWqSgf5HkzvChQr3H3XgQ11nOxNRL1uvLW6NbErHZc/w8lcLpOTGN43+fcKaeMYevY/UrG0FB22BuKEYkpipuwflx1A4O88tBg/BJgacrvuArCTvPJSAMRSp9z9Hg5GEtQHNtUsnhM2uZwdcKRvpLCKvgpSJWMd01vveHL8A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com (2603:1096:4:1af::9) by
 TYZPR06MB6144.apcprd06.prod.outlook.com (2603:1096:400:341::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8922.32; Mon, 14 Jul 2025 02:02:44 +0000
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666]) by SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666%4]) with mapi id 15.20.8880.024; Mon, 14 Jul 2025
 02:02:43 +0000
Message-ID: <717b22ff-b702-4051-aeb1-d05775213def@vivo.com>
Date: Mon, 14 Jul 2025 10:02:40 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] i2c: busses: Use min() to improve code
Content-Language: en-US
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: wsa+renesas@sang-engineering.com, Jonathan.Cameron@huawei.com,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 Andi Shyti <andi.shyti@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250709042347.550993-1-rongqianfeng@vivo.com>
 <aHFelLqnfsuaeh2Q@black.fi.intel.com>
From: Qianfeng Rong <rongqianfeng@vivo.com>
In-Reply-To: <aHFelLqnfsuaeh2Q@black.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR06CA0226.apcprd06.prod.outlook.com
 (2603:1096:4:68::34) To SI2PR06MB5140.apcprd06.prod.outlook.com
 (2603:1096:4:1af::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SI2PR06MB5140:EE_|TYZPR06MB6144:EE_
X-MS-Office365-Filtering-Correlation-Id: 193339a8-b70a-435e-4ddb-08ddc27a8535
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VncyMGNqbS9ObDUwSEpGOE81VEY4NDcvOVhXdC9Pd3hPbnZDK1lTMi9Uejhr?=
 =?utf-8?B?czc3Rm42Q1VLS09Lb0RMYVNMbHJabjdDeVozKzVLVkpQVUNxU2FkOFJzdW5a?=
 =?utf-8?B?UVZPbXE3QmN0MVJiTXN2bjZkRVFPYlRLeEMvcnJCR09RMGhTZk9SY2hHaHlt?=
 =?utf-8?B?NDZIZWorQWhyNGNGTENCay9KUG1HUDY2ODdSSDJoT0RCNXlQa3Z6WmJsbFdx?=
 =?utf-8?B?dEhSM05GYWZKZ1A3aFlBWWpVeWQwM2xXTERhRmc2UkJiSGE2WjVQVldscWtB?=
 =?utf-8?B?RjltekxWNG1PYk1vamYzaFExdnV6TWRjNiswMklwUDdYSmxzQjAvZFNmNDNS?=
 =?utf-8?B?MXNZMTlkMjRsZlVYaGROWmVNeDB0STMzTGpoZ1pDeEpuaWYxUGV4WS92cmd6?=
 =?utf-8?B?dmY2dnJOYTVidTBRNThvdlJUUWllcjA5aElRVDJWOHA0RngwWFlMQ0xIOExJ?=
 =?utf-8?B?L25WZTg4em9WWVNhY0V3SHNVU2lsUnkzZWFYdHZ6LzRrZjU4cThrRVpzeFhS?=
 =?utf-8?B?MEpYK1pNVHhiZ2Jza0xsN2xTL2RJd1MrK1Zub29jUzAwNEx6YXBkU28vcXdS?=
 =?utf-8?B?YUQ0dUpmR1U3aXNYenV0U0NnUXFaYldRZ0Z1VXh6STdOUE1Hd3RlOStkUDUz?=
 =?utf-8?B?VSthWXBkeUZBOGUrQjJkWW5qaVFGbmRvY1R1UWRjTkdQc09mWEFRTWt5Qm1z?=
 =?utf-8?B?ckVmODM3Y216UkpQWk1TbmdPV3NES0pVeTQxemRuV1pEaXlrR01CVTZ0dFp3?=
 =?utf-8?B?cnhzTC9FdmZ6WjQzQ3JKSTVQeU5LUzkzUi9qRzh6M0IrWnRxTlFGV1pvWnRw?=
 =?utf-8?B?YWUrSjFGUkJOWnJIdWRZMlBqOTRZRndoeUdXYVArMFg5aTNFa2NuLzhSazc1?=
 =?utf-8?B?L2NQWDBXdjJrc0FXRENleXhnekJFNTBVc1g3cXJoRkllRHBMYW41Tkk2WVIz?=
 =?utf-8?B?cXlPSFcwaFpTMjBuZDVjMC94QWFLVnFtb1llR2JSMlpYL2ZOYzF6LzZNdUdl?=
 =?utf-8?B?ZFNzeDY2b1ZYMDVuWThYaVV4dHZwMG9nU09tOEp5Nm12R1lIejJZM2xFelNE?=
 =?utf-8?B?V2UweWtxdUVXb05vT2JxNXdURFhlYzFhanFFWTZuaklDc1h0aExYQ1dFS0NK?=
 =?utf-8?B?aXBUSVZleThCa2ZkcnBNb05jTGlwR2YzQVpjZWlmSFhnWTVsYmZJU29LcWtV?=
 =?utf-8?B?Njc0alUwQk53VjNQbkJld2FhcG1yMlBzR25CMldsOXhUUHBVNzFYN2xJQzlr?=
 =?utf-8?B?WUhNbUZlMFFDQTNQb3ByeXBGNU1Fa29kRFdYSS91RVQ0WmNEd3BRbWsrdnA5?=
 =?utf-8?B?cWpVa0pvazByNTZWWGRTb1U1SHl1UHZSTytJOHl3dTYvU2R3cHhqQlllODl0?=
 =?utf-8?B?UzQ3dDFBNURaV2ZpcUVtcjJqdHBuZ0tPajNaYUhiRnlaMFAzZjh5eGdBd0Ey?=
 =?utf-8?B?OEUzcXBWemFGem90UFVnSGxkRTlNMGwxOVFsR2RJVHlJZEsrdms4Z2hqaXJI?=
 =?utf-8?B?aGxMQXk1cGEyVFM3RnhFY0VSc3h2Q2NKNWpncnhLZXpuUlVzZTdWbUlSaUlU?=
 =?utf-8?B?a3g0a09UdFhHSzQvR1JzOGJsdzFjSmpBVTlseE9NSDZGcVVmdzh3eVNwS2M4?=
 =?utf-8?B?M3NmWDlLRmlteGtGWHVpcHB2RWk3NzRZNDNidnE3SysxdG5oTlJYWWl5NlY0?=
 =?utf-8?B?OS9RcVQ1d3JIcE16Y3BYZllQSVhzK1VmMGo3V1pDZGdwQ2F0RHFZampObVBp?=
 =?utf-8?B?aVlpQ2RYc1ljQkR1V3J1TlNSeUpRNSsvS1VyMTdRRE91a1JVWXY3UmpPbFo5?=
 =?utf-8?B?TWo1MkMrTW5oUTFCVVJndjJsZU5MSXUyLzJzV3Y4UDl0bDVnaVc2Qzk2ZEph?=
 =?utf-8?B?QnlIS3Qxc3dXanR2UjhhNnVvdGczQWp6VHdQSnk3NS9uSlR6SDNOd25LL2Fz?=
 =?utf-8?Q?7mhZboBBSdg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI2PR06MB5140.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SDcxaDlwdFFybll4Vno4eFNReXFJL2wxaC9JaXU1WHFyN1FhSmQ5ZkdVNnpI?=
 =?utf-8?B?Q2ROdmtkRFhHdUJQUmNvMjhOUGwzWVBpK1R4Z1dNMXZocko3YmY1Y1AyNFd0?=
 =?utf-8?B?SzFEVlZyazZpRCtiTGJJcHE2elRiaWhXY2JPT0xYNkdVMUV6R3BoTFNqVlBk?=
 =?utf-8?B?Q3o2ZHR2OVpMU1IrSGxhWElycW50NFo3ZGNkbGhJWVJzczJlV2FTb2p5bVVF?=
 =?utf-8?B?YmVBRlZjeGsxdE9oei93R1JuTzg0SXFlOTUxMzYyMkhoRHcwY1UxSDE1TGRL?=
 =?utf-8?B?SVZ3Q3o4ZFRqVElPZE1ubWlZWFZ5YXJkbTZRUDVaSStUUmNpRFhJRWZXMkNy?=
 =?utf-8?B?RjNqMjdOV0cyRnFDM2lkaE1hVFBLWXB1QzVZUWVTdVcyRHhIa3JyLyt5QkZj?=
 =?utf-8?B?cTlLYlozT2hpcGFkWDkvbnZCRkwwVkFMWUxkU0xQTzZqU1JDb3JZdHd2WHJh?=
 =?utf-8?B?Zk9MTWt5bW94ZUloYVVvZHdORDREZmphRVNXVEZqSituTnVUbUhQZ0w0YU9Y?=
 =?utf-8?B?eXRsK3FjdXJlWUdDNnpnTTR4UVE2UzgvOURjYmJTdENvTGNhUU5ZOHJaeFNj?=
 =?utf-8?B?MHhIblhFaWFLVk1RWjJybGFUb0tsaEd4U3M2Q2RodUdwNTdaUDNhK0FSZDgw?=
 =?utf-8?B?a0Y1bFkwV2FFMkVERWhuMFFXRlNFVTlEQ0diL2hQYWRDdjdGdktlekFPRXQ0?=
 =?utf-8?B?bzEwcmthbzJiUU1DMlBXK3E1RE4vSVFIUUhYNkxSbk1lbWs0YVlkVXUrbm1V?=
 =?utf-8?B?b2k4SGNIMGlPWXovMUpHUUFyNzlibHdRR09ZaDFmcGxGd0x1K25NcUJ2ZXIz?=
 =?utf-8?B?dUxnM3pwRk1JZmpiMGtwZ0x1UEVodUE5UkVBN2JoWkw2WmdzWW5qcXVxQmZP?=
 =?utf-8?B?OXp1b3JJYi9QNGxHOFhySTZrdzczUCthOXV2Y3M1SUJtWmErQWltNGdwNC94?=
 =?utf-8?B?UDNCM3VzYjZIVno1Tm5NNk83NGpmcGJqTUpTUUxQdWJDRlgzNkdxMExvYWVh?=
 =?utf-8?B?NDRaZUMwUytNYVovbzdXc1YwT0NtdlBSaVBnYUR2VDQ0WFF4b1dUWUp0TlNn?=
 =?utf-8?B?cnZQeVBWdzZja3J2RWVJNytEMHE3aWVRc3JUd2lZL2dIOEFaRDZITkphSUNv?=
 =?utf-8?B?aWpTZjcxcUx4RFEwZTBqZzhLWGMvZVpXa01KQVAyQk9jVDZqalF1c1FIendU?=
 =?utf-8?B?bGpmZjlZdXZpNldKaTd0cUl5cUNIdVRtRzRxTTFlQ2FnSk1JTXBpR1JTUWtZ?=
 =?utf-8?B?RlcrRXdaN25sS0N0MnArTW9QZGJEeUV2UXhFenZEdkdYTDVZR0pScDAyYjYx?=
 =?utf-8?B?dW1ic01nOHJvM3lCbmt1dUNoM1Q3b0ZXMlhGbkRnNjkwR1dFeS9QTWpzVmRK?=
 =?utf-8?B?Q1hOTmU5TExwTVR1a29aK3puMEozY0tIZnJvTm83aEdzVlVpTHVGSlVoSVhk?=
 =?utf-8?B?RnJJUUg2VUx0aVd6SXZwOWQvT1gwdGRqRVZlUmYzbFRqaGp3QXZPdnp2RDMw?=
 =?utf-8?B?aUdQcE1peHFYdFF3S25KTjNYUDcySWlXTTNTbDU2UVJ3UjdHQW5XRzhzN3dm?=
 =?utf-8?B?UkFQUVlwQ3hxTmY5NklSaExMWFdzWnZqWVhrT29JaXo0Mm5zSm1Ja0lvOFZq?=
 =?utf-8?B?WVkrSEhzME5qQnJSU1NuWkZBZ0M3UnovOXBQczNsNkZSNHplajNnRVJMa3Rs?=
 =?utf-8?B?YklnRG9haktIOHk4ZWh5eEQ3Tk1QUlZBRksxZnVDWGNUNWx6V3Q3U3R3Y244?=
 =?utf-8?B?c1k2dXJuN1greFFnSjJ6T1NjRUF3UStzc2ZCZ3psZFZGQjdOTFlsR0RCTk9s?=
 =?utf-8?B?Yk0wa1BDajhLeXNwSXArcGFYQy85K2ZrSEtNWVFPYlVXUmY0RG1WNlB5WG1V?=
 =?utf-8?B?WFlPdXRmOGNLRFhhT1M3dUs0S3pqa3B1NjNTMlYySVUwVGNRZDRuSG9TcTBR?=
 =?utf-8?B?dlplaUVTSk1yejBVdjlRZlZjcHN6Qk1wWGdGYnpKa0tIZnAwYzVQYnBzQ3Ey?=
 =?utf-8?B?QVBxQXhpNG9tQmdDOUluRThhMElpVCsxazI2RzlzbUVzVnVEcHk2dFpPQ2FG?=
 =?utf-8?B?NjlRZnpXSndTVGl2blcrSmhSYnFvN25NRTAwcjVmY2JlV0JxY0RqMHN0ME9N?=
 =?utf-8?Q?ABRohXLX5Q5rEdGx7ropbw4fp?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 193339a8-b70a-435e-4ddb-08ddc27a8535
X-MS-Exchange-CrossTenant-AuthSource: SI2PR06MB5140.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2025 02:02:43.4531
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BrUA+QG6bpPGCKu0esxnDvA5lovyyb0FNZ8cCtaiY38Eb0pLEH5ZHnNwwwSpGcis9a/qGcenTlmAX9MGPEjcIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB6144
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250713_190255_745443_3DC17B8A 
X-CRM114-Status: UNSURE (   6.80  )
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

>>   #include <linux/of.h>
>>   #include <linux/pinctrl/consumer.h>
>>   #include <linux/platform_device.h>
>> +#include <linux/minmax.h>
> Do not blindly add a new inclusion to the end of the list. The list as you may
> notice even on this small context suggests that it's ordered. Please, keep
> things in order.
Thanks for your reminder. Best regards, Qianfeng

