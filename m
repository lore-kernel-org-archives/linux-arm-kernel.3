Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFF92D6CFAE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 03:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=woDzO2zUgchQJ6Ma3ecL5GoUnkPxk2UdS8rUm0Lznzg=; b=gJy1kXgp3toVyR2XSujTva9Y9n
	sRFL2zRt/YdQLZjoG0SgWcqaJ6uJ1ByAAYJH+uaYnScx4w27jEO+eFmgxdztNEMMEXKQzXb8R+Fjp
	5FR90q8oNay6AfRuaoEevcxeh5dp0qiiBbbKk9EBw/Z6r89FNCXb/30UUsmPvmV9lq4SYnaW9WDAx
	Vrtguidy7XfJnJIc8/y7mus0lXrRIjszdDC579g3GTHooARy/1MJl4JOXr+ddNJ7DZyV1XROtfshy
	kaxoh+D7wgBcL1XXKIA0FqduRUuhlWxmllzOAf/aiI59hjYFdJ5+aleinOjNzHq/D35WMzpjZpErI
	Yhfp9RWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vj7lV-000000087EL-2Lsv;
	Fri, 23 Jan 2026 03:23:17 +0000
Received: from mail-westus3azlp170100009.outbound.protection.outlook.com ([2a01:111:f403:c107::9] helo=PH7PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vj7lT-000000087Dv-1GJd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 03:23:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ld80aIIxwqLq2fJDyLDc5x0+vDfFp/tSSIvoiQz7zplgPyEmBP6hAYFhUJUD40REZUFLcYT0Df6xojzghGnwrhyBnbwPC/YzmIN6EiaVeVoxMHKPBq9EVGW/vqP1peuhs3Fi5YLWVS9Z9qCGtXsRjW7JwwffCxEIWMEdpDswPhUIwP1WjYDaQFqVg4E7YntfzGagjGykso4lrQOvCVBB3DfeTyWABntoODxH4UVFGqskdUZZcirXXAr6qkCcZUW9fH+HTGYrOn1TS/Xaswf/WbdcwWGDFwxUwjqqXGDPtxvFvjcSRbxZ1BX8L0faDnoNbI4H1HaDO7m9km8i+3diMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=woDzO2zUgchQJ6Ma3ecL5GoUnkPxk2UdS8rUm0Lznzg=;
 b=aE1DuX/ablvfjoTdM2KQwFFyDUMvWC10mp5vMmwDrnHHZmgK4ZlubZhHe/id1fgOI+WIRalBxg1mZ1YP2J/AkS8KXTDQCZH5gIjgflr6RwhpI/bogpgK8j7ycIsl2mVVU+e7O4GQ8oBRnf0Dp01jAgbsgScdLZuSVdF5GY2jNvkrC8j1KaGcTm8nqFf4Dg+JR36mbWsM7mdJW9e/MgeQUe08nW21TG79KwvCpC7kzoVrN20FG8LpAbEe5lfGCXVV9u0CDIayRkDWNKr1feEUKVrv014z/HvqPrh0ctkhB9/ng3hucDgRWOx20lb500slfTvzl2MrXh4CY2F1mn55XQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=woDzO2zUgchQJ6Ma3ecL5GoUnkPxk2UdS8rUm0Lznzg=;
 b=VUcj+RQxKw0i17wxrBtAwVVRMZqQm7FpPlntbv965s/EhGJsMjJ1GNnEfeWY/clRKn5G0idZ6OR2tM8ho91+MtUsiomx9HQ47xCRKrsY2Ge/3hYtN5Ps8vIT92XIffMCPLw4rYvIb+cDxnyHpRhvfbDcf/r+3zaQ7HcGWpczZCo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from CH0PR01MB6873.prod.exchangelabs.com (2603:10b6:610:112::22) by
 PH0PR01MB6198.prod.exchangelabs.com (2603:10b6:510:16::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.9; Thu, 22 Jan 2026 19:48:09 +0000
Received: from CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::46eb:64a3:667c:c1a0]) by CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::46eb:64a3:667c:c1a0%4]) with mapi id 15.20.9542.010; Thu, 22 Jan 2026
 19:48:09 +0000
Message-ID: <f7de4036-6463-460c-9174-9b893c41097a@os.amperecomputing.com>
Date: Thu, 22 Jan 2026 11:48:06 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [v5 PATCH] arm64: mm: show direct mapping use in /proc/meminfo
To: Anshuman Khandual <anshuman.khandual@arm.com>, catalin.marinas@arm.com,
 will@kernel.org, ryan.roberts@arm.com, cl@gentwo.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260107002944.2940963-1-yang@os.amperecomputing.com>
 <965a0b46-f32e-40e6-ab71-211f84d6c3cf@arm.com>
Content-Language: en-US
From: Yang Shi <yang@os.amperecomputing.com>
In-Reply-To: <965a0b46-f32e-40e6-ab71-211f84d6c3cf@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CY8PR10CA0048.namprd10.prod.outlook.com
 (2603:10b6:930:4b::14) To CH0PR01MB6873.prod.exchangelabs.com
 (2603:10b6:610:112::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR01MB6873:EE_|PH0PR01MB6198:EE_
X-MS-Office365-Filtering-Correlation-Id: 0736f29c-fd91-4527-0d53-08de59ef2b6c
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?a25zWXB5Nkg2dFJKVzZ6Qkx1dWJPZEFBWHRDVVN1MTZzSTd3R3VxNTluOURG?=
 =?utf-8?B?OUpWVVRMbXk1SnVYNmRSaFFXK3ZvVWhOc2ZUR3I2OVFLYUV5Y1plQ1hibEMv?=
 =?utf-8?B?Y0ZhajRVUmdFYU9ubmU4RE1XdWQxMS9TbGF0WmpERmY5ZHY5OVJGMml3Z2Jy?=
 =?utf-8?B?Wk9VVTV6V3FMdGprVDZSL0dOQjZqemNLRzdudDZ0R21vYWFYR1NqRkgraWFx?=
 =?utf-8?B?M29JVDg3M21pbG40L0hkR084RjRBc3R1RGViSHVPQ0RCS2NvWE5aUE8wNXVT?=
 =?utf-8?B?OGFRSUg0VU5zaHhwazNNanlyazNlSGthaXMrVEYxa2lmdkxlcHZGM2tGVUlF?=
 =?utf-8?B?UjFFWUNLRVEwdi83UGJVM2c3Ykc2MnBGQi9rbnRBcE9icHJwSkRCTUREM3cy?=
 =?utf-8?B?N3VsR3pDaEsvajdQd0RiNlZiNndhTVFqRUdvdDJ0MXNVd2ZwTlJGMWsxQzBk?=
 =?utf-8?B?WFlKR3h2WkN2TG0wOGhxWnl4K0tNNTFmRFA4Y2M4S1dJWkRhWlZ6TjJHSVgr?=
 =?utf-8?B?eHAzdHViWVRpWkJRTmtnYTI1RlR4SDBuZUJFQ1hXWDRrWDBjbWxNZnN6Q0Iv?=
 =?utf-8?B?bnpORFVZUEsyVkdBNFZ6dFFZcTNDc3JaRndvYnNyeW0zOXM5eFEvSXV6QmQr?=
 =?utf-8?B?R1p6OWFSYTZmZGJGNWhlaWt2NU5qMm1xazYrL0k3a1lNRjJnY0lIZGN1Rmli?=
 =?utf-8?B?bWN6a2xHcWFJOFc4Vm94c05oYUw2T3dOdi80TTRUVEFIMVgvaGxrL3JsaXZJ?=
 =?utf-8?B?Q2puTDR6am1SOUl2eWgxL1UrdmV2dFN2OVNveHhpMjVxYmNHMlNKRG5Ta1J0?=
 =?utf-8?B?RnY0TWNaVUFpNXFqRjRucGpHb1lPcW5iakJ5bzhPMlc1OEJkRGQ3dEVGRDF3?=
 =?utf-8?B?SUI3QlBNd0xaOE1WQXdRMmRxN21HYWZmRUxxWGtpV1kvWk9yUG9MZ2dKd1pm?=
 =?utf-8?B?QjQ2M0paejZOQ0xQNE12QWJKL2EzRE9paERrTVlVUGJHRk44TnlZbjNSMXNH?=
 =?utf-8?B?R1YrODhRTzA2YWNPRmJOd3ZFMlpOSWhNQnFRdjQxSDVIR0RFUDZYd0Q0SnZt?=
 =?utf-8?B?aThMcFhydUdBY014QkFnMkUzaCs3TWNmVkRKeVN3dnU2SlFXMW9CTm5VK1U5?=
 =?utf-8?B?SXpPbTlZbEVrRmt6YVNiTXoyU0xmZTFNUEtQYjc0eXlzeS9IMTgvK3RXVFN0?=
 =?utf-8?B?UnE2SkZaMEhKQVlPV2VVemNQNFVtVWs3YVRsOXZwNHU0ZHd2M0F4SGUwZENE?=
 =?utf-8?B?QTJwU1BYRERscUEvSW9XbjFjOFpvbjM3Q3JvWUJXZnVaeWlweGhxeGZPK3FL?=
 =?utf-8?B?UVNhUW45ZG9pVG5EZ1NrL0JTazNCcGQ0UCtTbExyRnB2Q0Z0NXJ3dUUzOTU5?=
 =?utf-8?B?Y0hKL0lKRzJFWlM1QW9UaHlnZzl5Rzk2T0RVNDJad21DZ0RvZGtQMFNEMExT?=
 =?utf-8?B?WlFHMDBtbGNYNUZlVVRpV0Eva0tVTG8yM0pvckFod1BUYVZGbW9vTjVOVkVz?=
 =?utf-8?B?YUNTRlJoL0tQK0tGdjlzM1RpMk9yaHo1V1k5MWNwb1AzS3VqMEJ3RitNdHFO?=
 =?utf-8?B?b0RqMmduVnVFMFdkNk0wdVZ1UHFrQ0VTQU1RdEM2VFlvSmwrNVZRZzQyZS9K?=
 =?utf-8?B?cWpSaWVSSlphSDR0eUZrN1Q2WnFkczJNd216WHhrenJBZEdwRnRQM3pGSDV0?=
 =?utf-8?B?bzA3WFdHT2MvV0lYbEQ2cExOT0tZUU95bExCRTFiNldPRGlFY3dpMTVtWnJy?=
 =?utf-8?B?TzNmMUlaS2xsckdmZTJJNEFyRnVlTEgvODdEeVdmUkhPYzJGV1k1SDFuVE9C?=
 =?utf-8?B?ZzZYSU5hYUQvN2ZmejQ5elVjMkJPQkoxY21xVmMyVjFBbXJoTWNvckp5ckhx?=
 =?utf-8?B?MFllUC93UEZITlZ1ZXE4bVd4eHN3Nld3NDg2NSszeUpWOXFVSnpuclRoYkdE?=
 =?utf-8?B?NU41dms0dklrQ05KU0VsZjhmN2JBY1pRL3VFLzFBN3JMdXlJWnRITkZNUFpu?=
 =?utf-8?B?OGYzU01xTS80QWdiUmRSWnhTd2E3d1BzQ0NDNm5jUUxodC9WdmtpcDUrcUhu?=
 =?utf-8?B?d1NwSU01Z1FCL3EwNVZyb3dCbnpmUm5SQkt0NGdaMEpqL2VXS0V3V2lKaEpr?=
 =?utf-8?Q?qKHo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR01MB6873.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RWlhVExXUWVQcnplR2VBYng0bUdKbjNvOUFyNlpoVkpPWGNPcEQ1eGl1MG1M?=
 =?utf-8?B?RW1TV2xMdEhFck93ZGtRaDI1VmFyckVDTGJuMmttUGF6RWVBNFZHZE5zdGVP?=
 =?utf-8?B?Qm54elFZWi9TWmFiaFpWS1VGVU9uQXZvT1dCZGhOTG1jTUp4UG91TCtRMGUr?=
 =?utf-8?B?TFpXNGllZnBFTklkdmc1VW9hdE55NDFrWEs0ZGtBV0VSSE9XOU9oMEpQL1hZ?=
 =?utf-8?B?WU9Kd1FIU1ZoWUJpcExJSG1NNUZHOWkrbG5ieEhpZ2c4K05vazh6aUdzTWox?=
 =?utf-8?B?RGw4bHhzZm9wTktpR0JCQmsvWWRGSU91WUdpbUsvVlVlL2wrb3dvL1k2MlJm?=
 =?utf-8?B?dUR4U1Npb3BDWDNsNW5QY3VEd2NiTE5jOGkzNjN4NDdtdW1TWFpSQkRtMm9M?=
 =?utf-8?B?anlMdnh5Y3pPQXNJYnVlbUdIT3N2dXdvNlBaSVVaQW9kOVBPZXk3d2RTQVpV?=
 =?utf-8?B?RzZNYlMzY2pqdEJhdzk2U3BQK2ptL01kb0wvYUlWSmk0ZTh1bUVsS0szbGVj?=
 =?utf-8?B?enk0SmRLN3pva1F0a2xjcXpQZVJ2VTAxcVNlb1BNWXRhWWZzMUpOaGhxZ1F5?=
 =?utf-8?B?K2NSRUp6MUd5SVA1Nk8rUGszK095RXY5aFR2ZlhPR1JSaGx0TmdwNWU1RTFB?=
 =?utf-8?B?TmF3eFg0S0w3L3R4NWVHUGZXTnp5ZWdNNkJBTUMybnpCbnRaUzdNNW5zU0Zi?=
 =?utf-8?B?Z1VJbDgrYVFCUzZFd2YwbzNjOVJvWjhrS3NxdDROQkNCYTFVR1l4NE9SVit3?=
 =?utf-8?B?dlAxbUlmZVF6eitXVE94djZGZk1sRFF2bk9ORUtHQU53SU5lamJRZEFUV1dr?=
 =?utf-8?B?SVpuUVkzdEk3c1hPaXBESGRZSGVFdGVrbThrYVhjWmZxaHVTZ2xkZW5BakJT?=
 =?utf-8?B?STNKNS9Kb2JTVjFuWG4zUUhOZkxYMEFhdWUyeEhvTUdIeXZBMS9GOWJqbUgr?=
 =?utf-8?B?VExsdDR6NmpabWExRXB3KzdnalZ3MmFPSzdLQm1zRndiM0FKT3hRVXJlQ1h0?=
 =?utf-8?B?aVk3aC9YblROZWtrWjU2NEQ3MjQyL2E3aFNRM0c5R2c5Z1ErOWpRb0t4aElx?=
 =?utf-8?B?bDNTNjU4OG52ZGJROUp1S3hEMGhPNVdxY2FpeVN0a0cwaldoMG9UQno4MXFJ?=
 =?utf-8?B?TU1KWGdQTWdGd0RIQXFqdHlwckdZOUtWUHFEbVZuY2Q4WjgxRmNWcFkrMy91?=
 =?utf-8?B?THoxRmJicnhnN0QrZFkva1VKMEJQa1ZsRHRlejZxaFZIVU5BaGFNZXNBL014?=
 =?utf-8?B?NjdpMEZRUGdiL1dmMjVlRjhOVXh5cFFFZkdOQUVGR2FIYnlFZ3djRnRHSjVB?=
 =?utf-8?B?dy84ZVJFYlZqa1pWWUtEUVFraHlYNGhCbjdXZGNIemV4UlNJRVRpRTIyZ3Nq?=
 =?utf-8?B?c3hSRTI5S0ZlWmJ1ZlRXa1FuM2plNkNCNUpIS3JScTF0Qm5HQTBZRnNxNi9v?=
 =?utf-8?B?NWtYNVpTUjMrV3BmZ09Jbk5kUmhzR20vMUV2ZHhhTE1NUndhS0lkYXlSWUFR?=
 =?utf-8?B?dERTUHM0NGVGTnVmRUY1cG90UUdYRDRUUGN1M2pyZXRnU3IzeWVtMHdJdmE0?=
 =?utf-8?B?d2VIZEc1WndPOWtyekU4QVZ0Tzh1bjNxK21aKzhuWDVIdWJ3aExHclpaMzIz?=
 =?utf-8?B?UDZibzIwRzJBUmk5KzNWODYrSVFHUFYrV0xiaXdlVUFFL2dVbllCYm1QWENM?=
 =?utf-8?B?R2ZsaGwvTlJ5UzhySi9nRWxlaW9wdnB4NE1oYXlQN1k3TS96enBKaFcxbW1w?=
 =?utf-8?B?MUg0Z2VCdzdNTW8wYW54ZzFsbS9HNjF2S0lpbXpvSWIxK1EyOVRTcWN3QmZw?=
 =?utf-8?B?Y2V4aVI5cElEUDBGMk5xRFJWeTBPT3QwMXlSNzNyTTYyZlRrS1Z4VHFIUFBm?=
 =?utf-8?B?Q3ZtTis2NEVkUmRaaEtmVVNabkk0ZEtxUmFhdUpKbXdvUEJVNFp5K25yU0lX?=
 =?utf-8?B?U1J1MjZ3UGN0YzZCUDhXYzl5aW56dW1oakZ2b1EydGpBNmFwUjROVUFrUlNV?=
 =?utf-8?B?OTRRVGd6a01ZUGhlOHZvRzNZanM3eEVPamtYZEt0TDkyMzdFMFFSZDFRMHh0?=
 =?utf-8?B?VUpXeGdGQ2ppampsM3BXZjRyOE52QzIwdVFZKzEyQmhpaU84cE9pdFFtaklG?=
 =?utf-8?B?ZXEwRDZjbzJ2RS9ibForVzBMTWZORW9FV2xUZGVyUDBJNjF2OWxYalVtckQr?=
 =?utf-8?B?QlpOTDBabXJVa1RmaEltcWs1Y0I3Ync0U0dQem51ZVNQN3MvcU1sSVgxV29Y?=
 =?utf-8?B?M0NpeG1ncWYxenJ0Q2xKbWxzQUk4Qi9aTTlpUjBpR0ZadW9aSjFyYWlpVGlt?=
 =?utf-8?B?dFF5RGNUWGtoUWdoMVlRMTY2WW5zYmVPeDRtZ0hsSXJzSkFLSkZpTEJEMTJE?=
 =?utf-8?Q?BD6fkhIoS2mhzqLs=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0736f29c-fd91-4527-0d53-08de59ef2b6c
X-MS-Exchange-CrossTenant-AuthSource: CH0PR01MB6873.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 19:48:09.6329
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J/Ac6PTHiyMhobL7mqpJxu7i8PK6JY13B1gSwndfASlzL1M36PtiHHP4thx9j2AMlbxwIs+n1iirrJ0+iA9FPNV4Z0QOEe1f0kTsOYnevwA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR01MB6198
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_192315_401767_1F8DC1B1 
X-CRM114-Status: GOOD (  30.01  )
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



On 1/21/26 9:09 PM, Anshuman Khandual wrote:
> Hello Yang,
>
> On 07/01/26 5:59 AM, Yang Shi wrote:
>> Since commit a166563e7ec3 ("arm64: mm: support large block mapping when
>> rodata=full"), the direct mapping may be split on some machines instead
>> keeping static since boot. It makes more sense to show the direct mapping
>> use in /proc/meminfo than before.
> I guess the direct mapping here refers to linear map ? IIUC it is called
> direct map on x86 and linear map on arm64 platforms. Then should not it
> be renamed as s/DirectMap/LinearMap instead ? This will align with names
> from ptdump as well.
>
> Before the above mentioned commit, linear could get altered with memory
> hotplug and remove events as well.

Yes, direct mapping and linear mapping are interchangeable in this 
series. Using "DirectMap" in /proc/meminfo keeps the compatibility with x86.

>
>> This patch will make /proc/meminfo show the direct mapping use like the
>> below (4K base page size):
>> DirectMap4K:	   94792 kB
>> DirectMap64K:	  134208 kB
>> DirectMap2M:	 1173504 kB
>> DirectMap32M:	 5636096 kB
>> DirectMap1G:	529530880 kB
> If /proc/meminfo interface is getting updated via  arch_report_meminfo()
> why not add stats for all kernel virtual address space ranges including
> vmemmap, vmalloc etc aka all address range headers in ptdump as many of
> those could change during system runtime. What makes linear mapping any
> special ?

/proc/meminfo does show vmalloc info:

VmallocTotal:   135288315904 kB
VmallocUsed:      115664 kB
VmallocChunk:          0 kB

And /proc/vmallocinfo gives much more details.

Or you meant showing something like Vmalloc4K/Vmalloc2M? It may be 
useful. But AFAICT, large vmalloc mapping has not been widely used on 
arm64 yet.
"cat /sys/kernel/debug/kernel_page_tables | grep -e BLK" on my AmpereOne 
machine (v6.19-rc4 kernel) doesn't show any large block mapping in 
vmalloc area except the area used by kernel image.

And I agree with Will it should not be part of this patch. We can add it 
in the future if it turns out to be useful.

Thanks,
Yang

>
>> Although just the machines which support BBML2_NOABORT can split the
>> direct mapping, show it on all machines regardless of BBML2_NOABORT so
>> that the users have consistent view in order to avoid confusion.
>>
>> Although ptdump also can tell the direct map use, but it needs to dump
>> the whole kernel page table. It is costly and overkilling. It is also
>> in debugfs which may not be enabled by all distros. So showing direct
>> map use in /proc/meminfo seems more convenient and has less overhead.
> Agreed a /proc/meminfo based broader kernel virtual address space stats
> display will complement ptdump which provides more granular information
> about their mapping (with additional cost and setup) but it should cover
> all the regions in kernel virtual space.
>
>> Signed-off-by: Yang Shi <yang@os.amperecomputing.com>
>> ---
>> v5: * Rebased to v6.19-rc4
>>      * Fixed the build error for !CONFIG_PROC_FS
>> v4: * Used PAGE_END instead of _PAGE_END(VA_BITS_MIN) per Ryan
>>      * Used shorter name for the helpers and variables per Ryan
>>      * Fixed accounting for memory hotunplug
>> v3: * Fixed the over-accounting problems per Ryan
>>      * Introduced helpers for add/sub direct map use and #ifdef them with
>>        CONFIG_PROC_FS per Ryan
>>      * v3 is a fix patch on top of v2
>> v2: * Counted in size instead of the number of entries per Ryan
>>      * Removed shift array per Ryan
>>      * Use lower case "k" per Ryan
>>      * Fixed a couple of build warnings reported by kernel test robot
>>      * Fixed a couple of poential miscounts
>>
>>   arch/arm64/mm/mmu.c | 202 +++++++++++++++++++++++++++++++++++++++-----
>>   1 file changed, 181 insertions(+), 21 deletions(-)
>>
>> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
>> index 8e1d80a7033e..422441c9a992 100644
>> --- a/arch/arm64/mm/mmu.c
>> +++ b/arch/arm64/mm/mmu.c
>> @@ -29,6 +29,7 @@
>>   #include <linux/mm_inline.h>
>>   #include <linux/pagewalk.h>
>>   #include <linux/stop_machine.h>
>> +#include <linux/proc_fs.h>
>>   
>>   #include <asm/barrier.h>
>>   #include <asm/cputype.h>
>> @@ -171,6 +172,85 @@ static void init_clear_pgtable(void *table)
>>   	dsb(ishst);
>>   }
>>   
>> +enum dm_type {
>> +	PTE,
>> +	CONT_PTE,
>> +	PMD,
>> +	CONT_PMD,
>> +	PUD,
>> +	NR_DM_TYPE,
>> +};
>> +
>> +#ifdef CONFIG_PROC_FS
>> +static unsigned long dm_meminfo[NR_DM_TYPE];
>> +
>> +void arch_report_meminfo(struct seq_file *m)
>> +{
>> +	char *size[NR_DM_TYPE];
>> +
>> +#if defined(CONFIG_ARM64_4K_PAGES)
>> +	size[PTE] = "4k";
>> +	size[CONT_PTE] = "64k";
>> +	size[PMD] = "2M";
>> +	size[CONT_PMD] = "32M";
>> +	size[PUD] = "1G";
>> +#elif defined(CONFIG_ARM64_16K_PAGES)
>> +	size[PTE] = "16k";
>> +	size[CONT_PTE] = "2M";
>> +	size[PMD] = "32M";
>> +	size[CONT_PMD] = "1G";
>> +#elif defined(CONFIG_ARM64_64K_PAGES)
>> +	size[PTE] = "64k";
>> +	size[CONT_PTE] = "2M";
>> +	size[PMD] = "512M";
>> +	size[CONT_PMD] = "16G";
>> +#endif
>> +
>> +	seq_printf(m, "DirectMap%s:	%8lu kB\n",
>> +			size[PTE], dm_meminfo[PTE] >> 10);
>> +	seq_printf(m, "DirectMap%s:	%8lu kB\n",
>> +			size[CONT_PTE],
>> +			dm_meminfo[CONT_PTE] >> 10);
>> +	seq_printf(m, "DirectMap%s:	%8lu kB\n",
>> +			size[PMD], dm_meminfo[PMD] >> 10);
>> +	seq_printf(m, "DirectMap%s:	%8lu kB\n",
>> +			size[CONT_PMD],
>> +			dm_meminfo[CONT_PMD] >> 10);
>> +	if (pud_sect_supported())
>> +		seq_printf(m, "DirectMap%s:	%8lu kB\n",
>> +			size[PUD], dm_meminfo[PUD] >> 10);
>> +}
>> +
>> +static inline bool is_dm_addr(unsigned long addr)
>> +{
>> +	return (addr >= PAGE_OFFSET) && (addr < PAGE_END);
>> +}
>> +
>> +static inline void dm_meminfo_add(unsigned long addr, unsigned long size,
>> +				  enum dm_type type)
>> +{
>> +	if (is_dm_addr(addr))
>> +		dm_meminfo[type] += size;
>> +}
>> +
>> +static inline void dm_meminfo_sub(unsigned long addr, unsigned long size,
>> +				  enum dm_type type)
>> +{
>> +	if (is_dm_addr(addr))
>> +		dm_meminfo[type] -= size;
>> +}
>> +#else
>> +static inline void dm_meminfo_add(unsigned long addr, unsigned long size,
>> +				  enum dm_type type)
>> +{
>> +}
>> +
>> +static inline void dm_meminfo_sub(unsigned long addr, unsigned long size,
>> +				  enum dm_type type)
>> +{
>> +}
>> +#endif
>> +
>>   static void init_pte(pte_t *ptep, unsigned long addr, unsigned long end,
>>   		     phys_addr_t phys, pgprot_t prot)
>>   {
>> @@ -236,6 +316,11 @@ static int alloc_init_cont_pte(pmd_t *pmdp, unsigned long addr,
>>   
>>   		init_pte(ptep, addr, next, phys, __prot);
>>   
>> +		if (pgprot_val(__prot) & PTE_CONT)
>> +			dm_meminfo_add(addr, (next - addr), CONT_PTE);
>> +		else
>> +			dm_meminfo_add(addr, (next - addr), PTE);
>> +
>>   		ptep += pte_index(next) - pte_index(addr);
>>   		phys += next - addr;
>>   	} while (addr = next, addr != end);
>> @@ -266,6 +351,17 @@ static int init_pmd(pmd_t *pmdp, unsigned long addr, unsigned long end,
>>   		    (flags & NO_BLOCK_MAPPINGS) == 0) {
>>   			pmd_set_huge(pmdp, phys, prot);
>>   
>> +			/*
>> +			 * It is possible to have mappings allow cont mapping
>> +			 * but disallow block mapping. For example,
>> +			 * map_entry_trampoline().
>> +			 * So we have to increase CONT_PMD and PMD size here
>> +			 * to avoid double counting.
>> +			 */
>> +			if (pgprot_val(prot) & PTE_CONT)
>> +				dm_meminfo_add(addr, (next - addr), CONT_PMD);
>> +			else
>> +				dm_meminfo_add(addr, (next - addr), PMD);
>>   			/*
>>   			 * After the PMD entry has been populated once, we
>>   			 * only allow updates to the permission attributes.
>> @@ -389,6 +485,7 @@ static int alloc_init_pud(p4d_t *p4dp, unsigned long addr, unsigned long end,
>>   		    (flags & NO_BLOCK_MAPPINGS) == 0) {
>>   			pud_set_huge(pudp, phys, prot);
>>   
>> +			dm_meminfo_add(addr, (next - addr), PUD);
>>   			/*
>>   			 * After the PUD entry has been populated once, we
>>   			 * only allow updates to the permission attributes.
>> @@ -575,16 +672,21 @@ pgd_pgtable_alloc_special_mm(enum pgtable_type pgtable_type)
>>   	return  __pgd_pgtable_alloc(NULL, GFP_PGTABLE_KERNEL, pgtable_type);
>>   }
>>   
>> -static void split_contpte(pte_t *ptep)
>> +static void split_contpte(unsigned long addr, pte_t *ptep)
>>   {
>>   	int i;
>>   
>> +	dm_meminfo_sub(addr, CONT_PTE_SIZE, CONT_PTE);
>> +
>>   	ptep = PTR_ALIGN_DOWN(ptep, sizeof(*ptep) * CONT_PTES);
>>   	for (i = 0; i < CONT_PTES; i++, ptep++)
>>   		__set_pte(ptep, pte_mknoncont(__ptep_get(ptep)));
>> +
>> +	dm_meminfo_add(addr, CONT_PTE_SIZE, PTE);
>>   }
>>   
>> -static int split_pmd(pmd_t *pmdp, pmd_t pmd, gfp_t gfp, bool to_cont)
>> +static int split_pmd(unsigned long addr, pmd_t *pmdp, pmd_t pmd, gfp_t gfp,
>> +		     bool to_cont)
>>   {
>>   	pmdval_t tableprot = PMD_TYPE_TABLE | PMD_TABLE_UXN | PMD_TABLE_AF;
>>   	unsigned long pfn = pmd_pfn(pmd);
>> @@ -606,8 +708,13 @@ static int split_pmd(pmd_t *pmdp, pmd_t pmd, gfp_t gfp, bool to_cont)
>>   	if (to_cont)
>>   		prot = __pgprot(pgprot_val(prot) | PTE_CONT);
>>   
>> +	dm_meminfo_sub(addr, PMD_SIZE, PMD);
>>   	for (i = 0; i < PTRS_PER_PTE; i++, ptep++, pfn++)
>>   		__set_pte(ptep, pfn_pte(pfn, prot));
>> +	if (to_cont)
>> +		dm_meminfo_add(addr, PMD_SIZE, CONT_PTE);
>> +	else
>> +		dm_meminfo_add(addr, PMD_SIZE, PTE);
>>   
>>   	/*
>>   	 * Ensure the pte entries are visible to the table walker by the time
>> @@ -619,16 +726,21 @@ static int split_pmd(pmd_t *pmdp, pmd_t pmd, gfp_t gfp, bool to_cont)
>>   	return 0;
>>   }
>>   
>> -static void split_contpmd(pmd_t *pmdp)
>> +static void split_contpmd(unsigned long addr, pmd_t *pmdp)
>>   {
>>   	int i;
>>   
>> +	dm_meminfo_sub(addr, CONT_PMD_SIZE, CONT_PMD);
>> +
>>   	pmdp = PTR_ALIGN_DOWN(pmdp, sizeof(*pmdp) * CONT_PMDS);
>>   	for (i = 0; i < CONT_PMDS; i++, pmdp++)
>>   		set_pmd(pmdp, pmd_mknoncont(pmdp_get(pmdp)));
>> +
>> +	dm_meminfo_add(addr, CONT_PMD_SIZE, PMD);
>>   }
>>   
>> -static int split_pud(pud_t *pudp, pud_t pud, gfp_t gfp, bool to_cont)
>> +static int split_pud(unsigned long addr, pud_t *pudp, pud_t pud, gfp_t gfp,
>> +		     bool to_cont)
>>   {
>>   	pudval_t tableprot = PUD_TYPE_TABLE | PUD_TABLE_UXN | PUD_TABLE_AF;
>>   	unsigned int step = PMD_SIZE >> PAGE_SHIFT;
>> @@ -651,8 +763,13 @@ static int split_pud(pud_t *pudp, pud_t pud, gfp_t gfp, bool to_cont)
>>   	if (to_cont)
>>   		prot = __pgprot(pgprot_val(prot) | PTE_CONT);
>>   
>> +	dm_meminfo_sub(addr, PUD_SIZE, PUD);
>>   	for (i = 0; i < PTRS_PER_PMD; i++, pmdp++, pfn += step)
>>   		set_pmd(pmdp, pfn_pmd(pfn, prot));
>> +	if (to_cont)
>> +		dm_meminfo_add(addr, PUD_SIZE, CONT_PMD);
>> +	else
>> +		dm_meminfo_add(addr, PUD_SIZE, PMD);
>>   
>>   	/*
>>   	 * Ensure the pmd entries are visible to the table walker by the time
>> @@ -707,7 +824,7 @@ static int split_kernel_leaf_mapping_locked(unsigned long addr)
>>   	if (!pud_present(pud))
>>   		goto out;
>>   	if (pud_leaf(pud)) {
>> -		ret = split_pud(pudp, pud, GFP_PGTABLE_KERNEL, true);
>> +		ret = split_pud(addr, pudp, pud, GFP_PGTABLE_KERNEL, true);
>>   		if (ret)
>>   			goto out;
>>   	}
>> @@ -725,14 +842,14 @@ static int split_kernel_leaf_mapping_locked(unsigned long addr)
>>   		goto out;
>>   	if (pmd_leaf(pmd)) {
>>   		if (pmd_cont(pmd))
>> -			split_contpmd(pmdp);
>> +			split_contpmd(addr, pmdp);
>>   		/*
>>   		 * PMD: If addr is PMD aligned then addr already describes a
>>   		 * leaf boundary. Otherwise, split to contpte.
>>   		 */
>>   		if (ALIGN_DOWN(addr, PMD_SIZE) == addr)
>>   			goto out;
>> -		ret = split_pmd(pmdp, pmd, GFP_PGTABLE_KERNEL, true);
>> +		ret = split_pmd(addr, pmdp, pmd, GFP_PGTABLE_KERNEL, true);
>>   		if (ret)
>>   			goto out;
>>   	}
>> @@ -749,7 +866,7 @@ static int split_kernel_leaf_mapping_locked(unsigned long addr)
>>   	if (!pte_present(pte))
>>   		goto out;
>>   	if (pte_cont(pte))
>> -		split_contpte(ptep);
>> +		split_contpte(addr, ptep);
>>   
>>   out:
>>   	return ret;
>> @@ -835,7 +952,7 @@ static int split_to_ptes_pud_entry(pud_t *pudp, unsigned long addr,
>>   	int ret = 0;
>>   
>>   	if (pud_leaf(pud))
>> -		ret = split_pud(pudp, pud, gfp, false);
>> +		ret = split_pud(addr, pudp, pud, gfp, false);
>>   
>>   	return ret;
>>   }
>> @@ -849,8 +966,8 @@ static int split_to_ptes_pmd_entry(pmd_t *pmdp, unsigned long addr,
>>   
>>   	if (pmd_leaf(pmd)) {
>>   		if (pmd_cont(pmd))
>> -			split_contpmd(pmdp);
>> -		ret = split_pmd(pmdp, pmd, gfp, false);
>> +			split_contpmd(addr, pmdp);
>> +		ret = split_pmd(addr, pmdp, pmd, gfp, false);
>>   
>>   		/*
>>   		 * We have split the pmd directly to ptes so there is no need to
>> @@ -868,7 +985,7 @@ static int split_to_ptes_pte_entry(pte_t *ptep, unsigned long addr,
>>   	pte_t pte = __ptep_get(ptep);
>>   
>>   	if (pte_cont(pte))
>> -		split_contpte(ptep);
>> +		split_contpte(addr, ptep);
>>   
>>   	return 0;
>>   }
>> @@ -1444,37 +1561,57 @@ static bool pgtable_range_aligned(unsigned long start, unsigned long end,
>>   	return true;
>>   }
>>   
>> -static void unmap_hotplug_pte_range(pmd_t *pmdp, unsigned long addr,
>> +static void unmap_hotplug_pte_range(pte_t *ptep, unsigned long addr,
>>   				    unsigned long end, bool free_mapped,
>>   				    struct vmem_altmap *altmap)
>>   {
>> -	pte_t *ptep, pte;
>> +	pte_t pte;
>>   
>>   	do {
>> -		ptep = pte_offset_kernel(pmdp, addr);
>>   		pte = __ptep_get(ptep);
>>   		if (pte_none(pte))
>>   			continue;
>>   
>>   		WARN_ON(!pte_present(pte));
>>   		__pte_clear(&init_mm, addr, ptep);
>> +		dm_meminfo_sub(addr, PAGE_SIZE, PTE);
>>   		flush_tlb_kernel_range(addr, addr + PAGE_SIZE);
>>   		if (free_mapped)
>>   			free_hotplug_page_range(pte_page(pte),
>>   						PAGE_SIZE, altmap);
>> -	} while (addr += PAGE_SIZE, addr < end);
>> +	} while (ptep++, addr += PAGE_SIZE, addr < end);
>> +}
>> +
>> +static void unmap_hotplug_cont_pte_range(pmd_t *pmdp, unsigned long addr,
>> +					 unsigned long end, bool free_mapped,
>> +					 struct vmem_altmap *altmap)
>> +{
>> +	unsigned long next;
>> +	pte_t *ptep, pte;
>> +
>> +	do {
>> +		next = pte_cont_addr_end(addr, end);
>> +		ptep = pte_offset_kernel(pmdp, addr);
>> +		pte = __ptep_get(ptep);
>> +
>> +		if (pte_present(pte) && pte_cont(pte)) {
>> +			dm_meminfo_sub(addr, CONT_PTE_SIZE, CONT_PTE);
>> +			dm_meminfo_add(addr, CONT_PTE_SIZE, PTE);
>> +		}
>> +
>> +		unmap_hotplug_pte_range(ptep, addr, next, free_mapped, altmap);
>> +	} while (addr = next, addr < end);
>>   }
>>   
>> -static void unmap_hotplug_pmd_range(pud_t *pudp, unsigned long addr,
>> +static void unmap_hotplug_pmd_range(pmd_t *pmdp, unsigned long addr,
>>   				    unsigned long end, bool free_mapped,
>>   				    struct vmem_altmap *altmap)
>>   {
>>   	unsigned long next;
>> -	pmd_t *pmdp, pmd;
>> +	pmd_t pmd;
>>   
>>   	do {
>>   		next = pmd_addr_end(addr, end);
>> -		pmdp = pmd_offset(pudp, addr);
>>   		pmd = READ_ONCE(*pmdp);
>>   		if (pmd_none(pmd))
>>   			continue;
>> @@ -1482,6 +1619,7 @@ static void unmap_hotplug_pmd_range(pud_t *pudp, unsigned long addr,
>>   		WARN_ON(!pmd_present(pmd));
>>   		if (pmd_sect(pmd)) {
>>   			pmd_clear(pmdp);
>> +			dm_meminfo_sub(addr, PMD_SIZE, PMD);
>>   
>>   			/*
>>   			 * One TLBI should be sufficient here as the PMD_SIZE
>> @@ -1494,7 +1632,28 @@ static void unmap_hotplug_pmd_range(pud_t *pudp, unsigned long addr,
>>   			continue;
>>   		}
>>   		WARN_ON(!pmd_table(pmd));
>> -		unmap_hotplug_pte_range(pmdp, addr, next, free_mapped, altmap);
>> +		unmap_hotplug_cont_pte_range(pmdp, addr, next, free_mapped, altmap);
>> +	} while (pmdp++, addr = next, addr < end);
>> +}
>> +
>> +static void unmap_hotplug_cont_pmd_range(pud_t *pudp, unsigned long addr,
>> +					 unsigned long end, bool free_mapped,
>> +					 struct vmem_altmap *altmap)
>> +{
>> +	unsigned long next;
>> +	pmd_t *pmdp, pmd;
>> +
>> +	do {
>> +		next = pmd_cont_addr_end(addr, end);
>> +		pmdp = pmd_offset(pudp, addr);
>> +		pmd = READ_ONCE(*pmdp);
>> +
>> +		if (pmd_leaf(pmd) && pmd_cont(pmd)) {
>> +			dm_meminfo_sub(addr, CONT_PMD_SIZE, CONT_PMD);
>> +			dm_meminfo_add(addr, CONT_PMD_SIZE, PMD);
>> +		}
>> +
>> +		unmap_hotplug_pmd_range(pmdp, addr, next, free_mapped, altmap);
>>   	} while (addr = next, addr < end);
>>   }
>>   
>> @@ -1515,6 +1674,7 @@ static void unmap_hotplug_pud_range(p4d_t *p4dp, unsigned long addr,
>>   		WARN_ON(!pud_present(pud));
>>   		if (pud_sect(pud)) {
>>   			pud_clear(pudp);
>> +			dm_meminfo_sub(addr, PUD_SIZE, PUD);
>>   
>>   			/*
>>   			 * One TLBI should be sufficient here as the PUD_SIZE
>> @@ -1527,7 +1687,7 @@ static void unmap_hotplug_pud_range(p4d_t *p4dp, unsigned long addr,
>>   			continue;
>>   		}
>>   		WARN_ON(!pud_table(pud));
>> -		unmap_hotplug_pmd_range(pudp, addr, next, free_mapped, altmap);
>> +		unmap_hotplug_cont_pmd_range(pudp, addr, next, free_mapped, altmap);
>>   	} while (addr = next, addr < end);
>>   }
>>   


