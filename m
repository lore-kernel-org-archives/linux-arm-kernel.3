Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 982B8E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 19:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m8OqrRZduymo8jwJmOoPyNZCYbrUlj1UCyo267MKydA=; b=o9kioPYV7O4ojtc3tcTZR8EUZr
	9VYKeI5Nv37UYvWQNS7zbfgLjW40AKmDDp7/+ol62XUmJWg/gmYHjM6LGjVXHeul/c2lTwPXYqrDT
	x9dW8LLm68NJ0O9ATWNtReo+IjMMQIZlZ7cTn/y7mj4UnXRMK+j4692tUFd26CSNG9bFwTJjYh9rp
	ZUvO2tn03rf0FCQ49wl0muBc44yFPCG0vebqHZ0x+0EPgnnQLl9U0Bj3CtSaKSqXT7w22GE5lPy7H
	1VEua2sh8L78XkdtBROYq5NnqsznuN9mPIK6HUNe4IuRohO+dprWbYmQlrNoZJs/E/SQFkznL2Vjg
	QskhBvcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL607-0000000CX4D-3RCh;
	Tue, 10 Dec 2024 19:34:31 +0000
Received: from mail-centralusazlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c111::5] helo=DM1PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tL5z5-0000000CWxk-3rqf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 19:33:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lnjjrss+Lzj9tK5jnBDA2szZVsF+UQBGJprK+dpqGIc/dukh5H8vgbaaxpybM+kuISyuYo3end+k8o1AJCP1XIqtgliT7UUco+JTZHpHoG4C00Osf/dBUtOkU+UwIFtlYYXoYtqG1s6LlQWKvLqP9FTtBEIk5Nau8vAuFPYSj2A3SyJ0XvGeUWh8UPL7whmPu1gbQlLHMvwXedAxgt8XwQEpFnHKmu8IM3rZRFqO6pB9dQdYgUSYruJjLnoHtIUeK13ma6lUpxE2vGbMs6nqiFJLxQrN5u8D07Cyl/zw+50kMKc/wa3peZmb8fg4BP9o+U1SSn8iRm1ZID6wgnwn8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m8OqrRZduymo8jwJmOoPyNZCYbrUlj1UCyo267MKydA=;
 b=LTa/vbDcGeHp5MaPNj9OLfwjAl+REUlZ0Zr6BvWY8ILtC2p0W0IGMB+kMPB9NpaA+80hraFbvDGCdb5GAHm3N5ACpmTe/PIcDXFxeQkPHNyJ8n9rcAquMG8zIDGYkp2nLHHwtbOqRIK0qOP0ZzYYdCb7mtCzn7/1l8AmMHBw6iq+5u5fEJrBeV2hlNIrTn9XzcQUcTW2XDupaqbe0OFS6FVqxpAK9vEyL5wevIiE+d9+nQ22h+7syApb79wjcGAp6wC19EqX0wc2nKKNrbl/sNET0gV6mSjLUVaIy3FDlJehkuX/XdXDRQ5+kXP8feSj/28aOgXqT3WHX3jezHLabw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m8OqrRZduymo8jwJmOoPyNZCYbrUlj1UCyo267MKydA=;
 b=DW2Iw69zebXKq5qITmVGeb02n8ZADzaMb5zKGlhIMpTmRgIvEgRgIPSaolbHu3Fs2+Mxyh4P49CTAkOalIfoDeVIuZ4mCQ7D4NIZ5cQrN4tt79Cx7GzEy3ILWp2A0KJ7VpOS6TQTWD1wSeB4NKZFKHh1LCLJm8IPvp59BSLNEz8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from CH0PR01MB6873.prod.exchangelabs.com (2603:10b6:610:112::22) by
 BN0PR01MB7199.prod.exchangelabs.com (2603:10b6:408:15a::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8251.14; Tue, 10 Dec 2024 19:33:21 +0000
Received: from CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::3850:9112:f3bf:6460]) by CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::3850:9112:f3bf:6460%3]) with mapi id 15.20.8251.008; Tue, 10 Dec 2024
 19:33:20 +0000
Message-ID: <414b3388-c2e5-45ae-9f1d-c35310fdbf8b@os.amperecomputing.com>
Date: Tue, 10 Dec 2024 11:33:16 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/3] arm64: support FEAT_BBM level 2 and large block
 mapping when rodata=full
To: Will Deacon <will@kernel.org>
Cc: catalin.marinas@arm.com, cl@gentwo.org, scott@os.amperecomputing.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20241118181711.962576-1-yang@os.amperecomputing.com>
 <20241210113151.GC14735@willie-the-truck>
Content-Language: en-US
From: Yang Shi <yang@os.amperecomputing.com>
In-Reply-To: <20241210113151.GC14735@willie-the-truck>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN7PR04CA0234.namprd04.prod.outlook.com
 (2603:10b6:806:127::29) To CH0PR01MB6873.prod.exchangelabs.com
 (2603:10b6:610:112::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR01MB6873:EE_|BN0PR01MB7199:EE_
X-MS-Office365-Filtering-Correlation-Id: 173a7b04-c757-4b97-6b56-08dd195180e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YVQ4azhlRXRVdXNmOEs5VGJIUFpRR01kT3FJVkwwNTFnak5LMDVYNUprMGlQ?=
 =?utf-8?B?aUhZN1ZKUDhhU2I4VWw1Mytua2xaK21XNGwzVVQzT1JTSmNPb1JvaXF3VzU3?=
 =?utf-8?B?UytPQWJlMm83eVhGdDEyWWlCWjgvcDMwR2w2NEFKOXdBWW91UGkrS0RTcDFs?=
 =?utf-8?B?T2FWQUhkbWE4OFZFYkpOVXFQMkQrZ2FGUUkzNXg4dDNwZVB1ZFlPU0R2NWpO?=
 =?utf-8?B?U052TVdxWlEwRFBza2NveGV4emc3bFhpRytGYUNRdkJXdm1pYlZ4emU5TnlD?=
 =?utf-8?B?MmlYcnQ2dlpJNWRrU0ZMZWJLci9pZkt5Mkt2NEJlejBpNWh5SFlPbVQvd0hV?=
 =?utf-8?B?bHZqSzdSZE45cVgyRFpjWFJYdGNrbG9tK0NqRFlsSFo4RjlGMllWK01mQ3BV?=
 =?utf-8?B?MVJkdUNpM0xCa292WHU3aTBDRzkwUG1XQUR3ZnlFZ1JQOWNhdkNJOWFHTDdJ?=
 =?utf-8?B?UzdEOGxMU2Ftc3lrNHF0Qm5HUzFvaG96cm5DcVhtNHF0UTR2ZjV2NHFINDgr?=
 =?utf-8?B?OW9JVXdsK1cwbXpaVEYyeXJXcGhyVVoxOXRmM21NN1JWL1RNNW9rRDB6b1ZB?=
 =?utf-8?B?eU5LOXNza3VvRDJpNFFvRWFPQzhBeW9RY0pYS2xPMGU4M0phM1NqUmdqTjNx?=
 =?utf-8?B?MGZlT1ZWMGF4bWp5dVI3Zm5vNDNKNEpSN0YrU2p4aUhXcVVuMXNCaHhoOHBD?=
 =?utf-8?B?OHJVdWhBM25kRGExamZwem96bzVCRHFKc04rTHdwMzhOUk5RYkNMbVlhcStH?=
 =?utf-8?B?c3phNjBpdDd3SnRSblNoQ3pIbS84TWlHRkVVUlhIbWZSYzhXM095K0hjcHBL?=
 =?utf-8?B?ajRuV1VzUEJpakdDem1peUNaZlVIOEcwcDIvNnA4bGdFbUR4Vkx3REVpZ1pF?=
 =?utf-8?B?ejBMR2VxUkt5OHhXaExlYnBrbnBOaGhFTkpFVDRaTE1xTlJ6ZEtBd2krZ1d6?=
 =?utf-8?B?bnNMRTRDMEwvTFdDeHd3NUE2Wlc3bEFNOHhxQnd5VUxoYlB5UUw5TEY4UGVp?=
 =?utf-8?B?b0ozNlVKZjVCTXBxNitrcnp2MG9McGZyWE9pQlNaMUx1MmJOcjhzQUJnZm9H?=
 =?utf-8?B?RlNiSjIyeTdIQ1pFM3FtSXFKZUxZaTNEbUZoOUtaenJBdk8xZC9LZ3IxN1kx?=
 =?utf-8?B?OS9UckljR0oyYm16SjY5NXM4QjlKSlRhREIwNHc4dVhHYitwTWRUejh5S1Q2?=
 =?utf-8?B?QWRONXJDU0xyN21NMjhVeTFXYjd5b0pyVjhWR0Jicm1nbXpIQWdXaXVZZ1Q2?=
 =?utf-8?B?ZnpGcUxhK2xnMjFqejUwZXFGdHBlSHlpMHRIUXlIUnllcXNQQXJPbU1kc1Av?=
 =?utf-8?B?VjBELzJoYi9mNWxOQmdiRk5rU2ZxVzIvV1lyZnRhejNPSmdXSWdoNEZwM2NB?=
 =?utf-8?B?TTVaRHAvSDQxMVhFWUtWSnFOV0hrWXF0Ly9DWXFNdXlYdkFjcG9Pdm9qZ01m?=
 =?utf-8?B?aXBrSFFxZTJ3OFdIbncxQ0tmWnZjNFRoTEJyMkd0N29jdWZBQ3grZW5OTCsy?=
 =?utf-8?B?eEtDNWVYU05pN3pIZndXZmUwTFNmVWl2U21FUCswWHJHb0lxdWlucEhEREwz?=
 =?utf-8?B?UUdFVVNGWm9KaFFUOGpmSVdOS1JwVWRZZlVYNmtBbmRvVDduQzREeUhKdTh2?=
 =?utf-8?B?T0hMSVdxVTNVOU1raHlMVktudklYYzdiZHFOTjBoNjBDOS9FRWFFZmpkcVRE?=
 =?utf-8?B?YmlkTDFMWDcxdVVMd2hFdmpjZFhKY3RKV3JPMmd3VzdjMkdCR21WaDVjV25T?=
 =?utf-8?B?YURDdkQ0UXdBSkZuaVYxS0IxNkV4YzBWODdEcTd1UVR2Szllcno5SWZyRisr?=
 =?utf-8?Q?DwadXs/gWWHIr2JrqI+HpngD4jkwv2woLUcSA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR01MB6873.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TkRjMnYwSlB0Yjlpa2FNRUFxekdWaGgvT2U4bGloNEd6dHR4MWNCTU9tVDc0?=
 =?utf-8?B?bk50YTE0aThUSDd2ZGZ6QjdtdFF0ZGxrNUVZcmlVYlVONFlSSWRTTitTb3Rw?=
 =?utf-8?B?bXdFVzRkdGx2MXBNbnJqV0hORk5uWFh6L3BSNlFGSUVxdnIyNER6WTk1VXdx?=
 =?utf-8?B?VFphM3V4K1B2WHJzYktBK0JJcDdxRnN1RHNLa0MwSnllbHJtMDRwZ1JsTzFS?=
 =?utf-8?B?NUp1MVd1eXlidklUOGdZVjZLeU04TkFNT1FBdGljRjRuTVhpL0tkN1RSeHpS?=
 =?utf-8?B?VmkrZWRFZjV2UmYyY3RkemUreUlRcHZtNFN5Z1JCdjJueUc0ZmJOSFdvN0tF?=
 =?utf-8?B?VkFFY3N0UFRuM25UVWt1SlNZa29zbUM4MzdYbWFmR29xUHRUc21ma01PMU1N?=
 =?utf-8?B?eStpV1l2aWQ0QVRieTI2MnVWQk9YaHZPYW5HWUNjQU91ZmtqelZ0cnppRHNV?=
 =?utf-8?B?SUlvcmJLa1luR1NLUmQxaHAxN1FSdWU3T2ZvTDZXNVFablloREZLVVJwOStK?=
 =?utf-8?B?YXl6MUN4UitERjFhNThtcDFCYUxUMVl2V21JS2hSZnJUNDY0c3FJemFWMXIx?=
 =?utf-8?B?cnlpN1pwUEJVbnpFRFdXMU8xU3ZCUE1MT1lOR25ucUJELzdPQ09mMUovZHJE?=
 =?utf-8?B?dVNjdlVIVlkrRE5kWm1neGJPMTlSMTRUNkdiZkNMeWJqNFdzc1ZvcW5lelpP?=
 =?utf-8?B?TWwrMUlRNlhIZ0hHV3g4ZFJDbE1BYWlhMElKSE1KMVpnbE5tVTNCeWhpSmJ3?=
 =?utf-8?B?eDdDRVF0S0VCQUJ3ZjkwcGk3MmVlYmtqaXpIbmZWMVArNGkxczdsWUl4YzZj?=
 =?utf-8?B?ZTRWN0o5Kzl2Nmt2b1lWM0ZraEtEY2YyaHhGYjdEcmd5czVuQmNpODl6TmlH?=
 =?utf-8?B?NHhGVFhIbXBHUXhUbEJwTnROUmc5SHVtVXFYbEhpeEpVQnZSbFEvcDB4QzQy?=
 =?utf-8?B?OGVleXMrL0FyK1krVEdacllFTjZ1YnNIcVNtQ0NFbjB2b2NHVHZLR3g4MzRZ?=
 =?utf-8?B?RmU0RU5kN2hISWFDMHVtN0RXMmhSTUdlUHVWbkZZUkRZSlBzU0NnZ1lVM1pv?=
 =?utf-8?B?Z21GVTRBMTdaRHpYQXFPc1pEeG9TU3NPeGlZUVF6YnVMNXZkZ3A4cmdGNUE2?=
 =?utf-8?B?QWtVZk9QWkVxdmxHWHBWQi9LM0JNVnQvczV2S0FtRkx5QVBnc0RDaWozZ2lQ?=
 =?utf-8?B?MGZWMmtPSHpjOFBTYUsvVE9teDNJNkY5NEhGVkVaZ3VOMWFuTDNRc251QTRl?=
 =?utf-8?B?angyOUN4aFZFS21tZFl1MGJRSFd0S2JVajk0ZlpFTU1td2dwVWlhbWo5a1lQ?=
 =?utf-8?B?MmM0QnpPQm5nWXZXR0I1THRSOU9kNm9DUTVHTU9md2taTHQyZEJvTDNjV2dJ?=
 =?utf-8?B?MURQRDBlcGMwQnVpSzREVjNHMTlUd3FNMGxRSnM2Ym93MzcrMlZNR2ZySFRZ?=
 =?utf-8?B?UDEyd1pUWDJac3d1Y3NRSm5sNUk1Ulp5Nnc3clg4Y1pBWWFqVExmZFlLNFd5?=
 =?utf-8?B?V0ozdHBOL3BHSW55Q3k0Vm56SFFkaUJqR1V4Ym5maDBKcDhiOWF0elI3SlNi?=
 =?utf-8?B?LzljWXJwbWJFR2hVcmlnOFZNTjRaQmlucVdBVis0bEc3Ymt1N3Y2KzY3UGZB?=
 =?utf-8?B?dENBUEsvcHp0M2NNK3lyQW9GREJuMFlubERCOEl6RzExV2lEY0x2NzFyWkFG?=
 =?utf-8?B?STJmdHBHa0tFbVozcjg4L0pFSWpUc2tTL3NPOU82NU51bkdpdTJEeDdYMi9w?=
 =?utf-8?B?ZDNFR2hJZEQwQU9aaWZSc1o0dGNBRXFlWHEzb3o0aDNXRkJPbU1Bc1cwNUxO?=
 =?utf-8?B?bjJaQmNNWGlFY1MvdnJqMVU5b3RlRUo4ajlKQ2pQaFg2bmFmYUdZZmUydnl4?=
 =?utf-8?B?c3h3YTNQc3FrYndQNjhqMXJZMy9kTFdJSTZSdnRuaDFLbkE1UUtBR2pPRTFW?=
 =?utf-8?B?OWZGUUs5VGw1ZlpmKzJHa3F5OGgyeDQyV05aYjQzOWpkMXJzMXhVdmw5Nmp3?=
 =?utf-8?B?cGZMdStxa1hUYUtPS0xSOWxtZXFBb0lTelhiT0p6akZjODBZcTFZMnIvcXBi?=
 =?utf-8?B?bE12VTdpK0tPazEyNWd0N1RuR3kxT2FCMmVSbnpzdG4xQkIzeVQ2bHhFMHB3?=
 =?utf-8?B?d08rVVZDeG5jTVBGNTdZWnpWY2NZSlNiZnR5WElKMlA1cFZBK0d2UU50YVVO?=
 =?utf-8?Q?qlWNMMXCwPNAOz7e/FWWwLM=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 173a7b04-c757-4b97-6b56-08dd195180e9
X-MS-Exchange-CrossTenant-AuthSource: CH0PR01MB6873.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2024 19:33:20.4171
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4hhj9PEeYpgK1/pVfC5jVsW/SZ1N59eki2BlFAzwwRTH5WUweqtf9KBo8NxcaHH7w0QWSZ25lBxAT9oabgC9O0F5EEM++X3AeQKA0OlIl8o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR01MB7199
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_113327_982515_0A3C98A5 
X-CRM114-Status: GOOD (  15.70  )
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



On 12/10/24 3:31 AM, Will Deacon wrote:
> On Mon, Nov 18, 2024 at 10:16:07AM -0800, Yang Shi wrote:
>> When rodata=full kernel linear mapping is mapped by PTE due to arm's
>> break-before-make rule.
>>
>> This resulted in a couple of problems:
>>    - performance degradation
>>    - more TLB pressure
>>    - memory waste for kernel page table
>>
>> There are some workarounds to mitigate the problems, for example, using
>> rodata=on, but this compromises the security measurement.
>>
>> With FEAT_BBM level 2 support, splitting large block page table to
>> smaller ones doesn't need to make the page table entry invalid anymore.
>> This allows kernel split large block mapping on the fly.
> I think you can still get TLB conflict aborts in this case, so this
> doesn't work. Hopefully the architecture can strengthen this in the
> future to give you what you need.

Hi Will,

Thanks for responding. This is a little bit surprising. I thought 
FEAT_BBM level 2 can handle the TLB conflict gracefully. At least its 
description made me assume so. And Catalin also mentioned FEAT_BBM level 
2 can be used to split vmemmap page table in HVO patch discussion 
(https://lore.kernel.org/all/Zo68DP6siXfb6ZBR@arm.com/).

It sounds a little bit contradicting if the TLB conflict still can 
happen with FEAT_BBM level 2. It makes the benefit of FEAT_BBM level 2 
much less than expected.

Is it out of question to handle the TLB conflict aborts? IIUC we should 
just need flush TLB then resume, and it doesn't require to hold any 
locks as well.

And I chatted with our architects, I was told the TLB conflict abort 
doesn't happen on AmpereOne. Maybe this is why I didn't see the problem 
when I tested the patches.

Thanks,
Yang


>
> Will


