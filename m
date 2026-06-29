Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 400A5C43327
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 23:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aXmnj89xoCIvMuBaqwQHNMn4ouTM94E3AMMPwYX8YnE=; b=H+CvNTllLyN1PrpXfERv0q3Ayu
	2Wmixm8Ql8ql/KFkpe4HSsPwimzut9E4/wWv6vrrds0U4BQDcpS19g6oeUWqHTp6FxB3akv3CGTqw
	bK0xB6w1rG1UicsvUSCXlqhKA8UCjzqK0+MCg/jUsktCu7HmYatNNR6m35p6QzlCQlMRXrKaHII/x
	NXz1JchPqtO7DI6hvwkBySs2/9S838tpp3gXsOjKWzcGCrYBxaS795lH7i4hv9sORt4kzhFo7dd5j
	ttvqr+Y11q+o277gnee1u22DOOhpJ3xprYtXFrBTTpNuzkcyr3qqhpLLao4RwxidF2VE/1JFddwIV
	ttlB0bpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weL63-0000000FZgP-2Kap;
	Mon, 29 Jun 2026 23:08:59 +0000
Received: from mail-eastus2azon11011007.outbound.protection.outlook.com ([52.101.57.7] helo=BN8PR05CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weL61-0000000FZfp-21Eb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 23:08:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Uc3ahcSUZ21a12rWF2jtEAqfdbDWOEreffg9gY1JUlKll7Ia0Ah/aSJXTpu7cgoMdU3DJ2fC/3JsoNTlHbG884sQr4y0cJeVcfJGGL4KvEPw7mB+xnb1J2WcKR/7plwwBMlcjkxK3vTII/b/fkMMT81ncNcc1nse/k33Q+nGpakubxK6BeEkyk2rnGcip/BV5I8WJetVSUJ0YEGvm5+PtTvbNP++ByTFk5mjh478gIn5VxyFPq0EDBJQc7he3QByF3QpsXWqmcjP5e+iohMObGVAHxE3hrubkUm5m3rDj2H7uUYugklwCeSyfoHEagDjxwiufsks4llViF42Olwndg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aXmnj89xoCIvMuBaqwQHNMn4ouTM94E3AMMPwYX8YnE=;
 b=JGdrYZmE4cUdRp2bb4mG0oLH84wZKqOGJGciE5ZuJO00vYhEVrTjbo/xAQdXROjYTUUUkpbAqPTaAgLTHwT18Uxyqs9srhbl1fvr8EaPZ8EIYcpzbe//is+OwLUHw/g4nNosAKxoyg9W7ZiWMaaJxOf/iLmVUHi9rK2OMIiFB6t/bQi5ko2/24AovGjUDGkoOG8vqV/2CIMnI90wmNyGt/2j/PqsL9qvwsuwKBTiV9JzkAiPr1ictohxiDRTl0ORTmZ9GjR6NcWgASBoOWEcMEMlE5pozy3c/WZn9234ougbk3Wxgxm3sjB6HK4GgO8bgNmenwrjV+MIezfsVgj4FA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aXmnj89xoCIvMuBaqwQHNMn4ouTM94E3AMMPwYX8YnE=;
 b=cjMhh6YBoe3mgICt10bzP1EOtS/87FVd9VIB7X8iE65QXQAQC+XuiBu2JL9r2hy9hxOoe8NKP2LwrBtZzIbZVJJRiQ6SXoJmp+2kZsWTXvv9aPZJe0V+khQIGEnJkLUz6QMuyaectFWp9EMxJEwAFGkz4OnaBeYBMFoVMq9mSkuMJi/o5g+60QG9v2beqbvqVtcRqI5N6tBkCGpUkMKFSEa1E0uVq3M0OfZsGUI0X7IfOSQwWj4XAhOfpoArad3O0du+sgGXca8vp9LoYzcEHdUkFtLzWU9WqWn/4IqgAw9i6ZUnRoabUNTq5ikaN0Pbjao/M/dvRE1R3fc9Z6dLgQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA1PR12MB6089.namprd12.prod.outlook.com (2603:10b6:208:3ef::9)
 by DM4PR12MB7528.namprd12.prod.outlook.com (2603:10b6:8:110::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 29 Jun
 2026 23:08:49 +0000
Received: from IA1PR12MB6089.namprd12.prod.outlook.com
 ([fe80::abd0:32b3:6f57:1d3c]) by IA1PR12MB6089.namprd12.prod.outlook.com
 ([fe80::abd0:32b3:6f57:1d3c%3]) with mapi id 15.21.0159.018; Mon, 29 Jun 2026
 23:08:49 +0000
Message-ID: <ba15e106-9066-4e55-be2f-6767a32e123d@nvidia.com>
Date: Mon, 29 Jun 2026 18:08:37 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/2] arm64: errata: NVIDIA Olympus device store/load
 ordering
To: Vladimir Murzin <vladimir.murzin@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Jason Gunthorpe <jgg@nvidia.com>, linux-arm-kernel@lists.infradead.org,
 Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, Vikram Sethi <vsethi@nvidia.com>,
 Jason Sequeira <jsequeira@nvidia.com>
References: <20260625182425.3194066-1-sdonthineni@nvidia.com>
 <381fb71c-0a2c-4dec-98a3-56ad88e190c6@arm.com>
Content-Language: en-US
From: Shanker Donthineni <sdonthineni@nvidia.com>
In-Reply-To: <381fb71c-0a2c-4dec-98a3-56ad88e190c6@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA0PR11CA0156.namprd11.prod.outlook.com
 (2603:10b6:806:1bb::11) To IA1PR12MB6089.namprd12.prod.outlook.com
 (2603:10b6:208:3ef::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR12MB6089:EE_|DM4PR12MB7528:EE_
X-MS-Office365-Filtering-Correlation-Id: dc5f1675-6057-4256-1142-08ded63360ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|6133799003|5023799004|4143699003|11063799006|22082099003|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: ehSy+PHotvoJ0NwkQyMoTpIzbvg2MK/TTJD6HN8d19Q+sWsL8HnFxNZSwn808EYvsmzIwai/Qb/rkkiImHzr3ZndPcPSpRNt6IwOoDKpSNt6v5oGF6fTiiYeKuVnjg7WvWOpJXnDqL5BCs/BeEQkoDoNMrTlPaT8HZoqMq1kQYI51IJD8ZnQBKu0TSHmmrseaYReAnMWhByc1iAbJTGU9RsxiGvtjdMKnktq5BsnwxxdINbfpnooVFGKAu5nlFcrCnJQ2WL/cqXvYHpJ2yr0pY39sKifwyWkPUdNI8cajS3Dye+Qxlfa0Q40QKCbErXrxjv0XgKfFBGkttIVy4TF9xEIXO/OL9E7BT/zD+MVM4+I74bZOwsNRAyOo3cFLC7+C3p1S38R/UqOj7DJTX/DDlk0MNuOPC268A7ety7NjYEYKXyo+8MO6981TzGWxfryJz24vPxTE8pYptepYcndt736rlgIJYwi4Y35xKf6dNy02DnE2depS5scMfKerTBQFBHUIhWFnVPcdqQknTa3+6MX58jyArlrjgQDorptks8mXKXihdrxd9se6UFtR8CrVf6xVzN+uWjdgYBFoW+nhuJUXxNrgNnbk6b3MzqGEs09AzMlKyn5xiDkw8n6ueDNOzSVdJtePjWOeGa2/wMbuhEo5kfTcja2NIyLS9bheg0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR12MB6089.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(6133799003)(5023799004)(4143699003)(11063799006)(22082099003)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c282S2QrcURRbXhtMlNOMG9lUVREazZodTJJMGFOSDhacUQ0TFBsZHo0OTZh?=
 =?utf-8?B?K0RJTEd2ZTJZbldFSE1rdjJaciszLzRkcDNuRk5aWWNWd1BEdmNjVEtCR2g1?=
 =?utf-8?B?Y1NXUVZFQkN6QXBEVGxUTHNoVXJaTnNKYXVBU3lzNUpJWFRQSlFJdS9FOHVy?=
 =?utf-8?B?SHY1d2xoc1hid1dSUFlOUjlMdS8vcjhjUnF1L0FXVVFnb0dzb1FOK0h6ejNo?=
 =?utf-8?B?VWI5M2ZZVVJ5ZjNLbnFJWFRuWldVQkEzN1p4YXZvUmhySmgxTGhHODJ2NXpF?=
 =?utf-8?B?dWZ4QjViT1luaitwWFI4WjZpOEdrNTFmOUNaVlZxWjZqZVROeit4dUNzVzB3?=
 =?utf-8?B?WEg3Wks1emxzK005d2pKSjl5TVYyWkdjZEFwSUhnNnBGVFdGZFRMTFBmWGJj?=
 =?utf-8?B?dGRlKzRzZnJYWG5qZ3ZCMjQyWjljWEgvUVlqSW1iVXJOQ3RJRmYwSjYyV0or?=
 =?utf-8?B?N0NGOGNSUGhoMjF6ZS9pd20ySjBLbFJTNmtiK0hpSkhWTXVrdXFXc0txY3g5?=
 =?utf-8?B?bWl1YkE5RS9lMUtTbG51Zzg0Kys3Y0VEbUc2YXVlUHhPeHBiZ1VHYlJpVWVV?=
 =?utf-8?B?a0hoLzBUdWdnME5sVlc2a2RodUhtd1JUSGljT0s5aHVCL0RsMVNydFNpbGR6?=
 =?utf-8?B?WG4zVXhiUDdsT0IraWRPQ0FOT0E4dW1kck9pZnJ3WkdBeEd0TTNFR0h5dlpl?=
 =?utf-8?B?QXNZWlZoS3oxL1FSZ0lmTEZkb1ovOEMyUjY3OHQ2ZWM2ZnFVQXlRYmhYcVpk?=
 =?utf-8?B?Q3BFVWsvcXJ5WjVML21uVG5QZkd1V3Rjd2hQYW9hMjJMN0ZlcEVJcVRiUnJ2?=
 =?utf-8?B?K0Yxd21XUUVFcmo1SUVqWGRoL3Qvbk00N2YwbU1hQUVPVHAyR1FWaExsakNr?=
 =?utf-8?B?T1c2bXBjb1NVVkhubXpMVy8vUW5HTlN5OG0vOE03T3RVMjNyT0ppZlJTQytP?=
 =?utf-8?B?YnppMWpMdDhNSmJ6dkM1N1ZnN0V4Y3BQV1RZaksxMkhYRzgwVklsRnZkb3lw?=
 =?utf-8?B?VVlBelQzd1dDM01uY3lhK1RNTUx6b0VZRmVHT200bENNU1ExUkR6d0R2aXBn?=
 =?utf-8?B?VXhIb0FhazUrNmliekFMWnJhbUt3YXVpVTJZUFkvLzBoYVZPWnBpdVJlRU9G?=
 =?utf-8?B?TFlEdVNlY2hyaDVOL0xIblRKa3JoUE9VRGdlUEJGY3U1dmNzdlMzL1J3WWRv?=
 =?utf-8?B?NUJ0SHl3djhCbmhSWDZoZjFKWE9HU2tmVjE5MjFHVkdUWmZzUktyWlpaRUkv?=
 =?utf-8?B?MWo4S1lRaUNqR05kSWVBeWtTZ1hYaGdQVGdHby9ja2dNUVZWQ1R1dmt2QVNu?=
 =?utf-8?B?M2ZVWEh4RW5FTkk2Z2M2QndNWmpJdkp4NktvUGE5MG5NS2VXNkYySi80K1FH?=
 =?utf-8?B?ZHBYbTZ3bUE3ajBwUk03Vmx6NW4rVUgzVm4rU0xpRjBTMkJSR3doNXVWZlZu?=
 =?utf-8?B?Y28zMEFuUlhCeVlPM01CTWRwNXNXR0txVnB2Zm9ZblVyUVh0ZTFjaFJseFFq?=
 =?utf-8?B?Q3Fyam80RzRKMUxxSk0vOVY4WTZPKzdaREp2cFFsRkRLNERBM0Z5dDNDWUs4?=
 =?utf-8?B?QXkrOUlKbkdLakNGaVRWOExBQUxkclpFOUFmMkVtZFk0aEM2dFVldFlVKzlv?=
 =?utf-8?B?c2dMSHlUendZdk44TkpFZ3VTTzkvKzhKSnhDTzBJcnI1QzRiajUxZzE0NXJV?=
 =?utf-8?B?Vjl4WDBBdzVBMkVWdmFZWUlUcWpST2pRVjFndjBkNDNPTHdFdTUySUNyK0I2?=
 =?utf-8?B?MmhQR1EwT2FEbmZmdjhNNW9kNVlCRW5wdCtQd2R4QmNQYXc3dDFMcm1sWndB?=
 =?utf-8?B?RlZtREV2cDhHV1NkMUlFRkdSZ3NJRHFmNWI4b2ViNnh1RzBtbWpwMjhZU1dn?=
 =?utf-8?B?SGFPdERMbDFuU01OV1llbzRLcTFleDBuZjRDKytyMjBqbkhwVjFBV3cwYTVn?=
 =?utf-8?B?L1BCQ25XTkpkT29kbDBSSFZCL2J0NldHbGp6SkwrM25wUWRmODlOOGwwUDdp?=
 =?utf-8?B?VFQ4VDVyb0dDVUNDN0NGVENvNzFQb2lpZ1NoSTlHaXZnekpzSjhJZmNuRHdQ?=
 =?utf-8?B?KzRGY0VqdXZUSGU2YktJbThHM3FwMkdYM1NQb3pCNXFvQk9xeENKcmtsTVYr?=
 =?utf-8?B?U0pKVG5FbXN3Q09wTUJPbzV0TlorU0xnWElmSHh5VFdjeVlIUVp0Vm41N25V?=
 =?utf-8?B?ZWZuN0kxL215Nzl5RWNVdEpSeDduRTlBd0Q4akRyRTQ2dFZLREdHWHVNdDBl?=
 =?utf-8?B?THFEN0s3NGptcjdJSFg1MUdSTGlNVmkrNE1PQjBZWUo1aVJZRlRSSWVHTUFI?=
 =?utf-8?B?RnprbUMwK0swb3BsVFgxNFRMM0ZvbFBCdC9DdFZUdDkra3BvdEdHQT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc5f1675-6057-4256-1142-08ded63360ed
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB6089.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 23:08:49.2638
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NE0PhN6WnBjX7Vo/NGXwPUNzuiWmHmDWxzCDV9Cv3bIMDcgCr+b+BprtOKvdAw94wjAQ62tgtx1jn+JYaR7PJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7528
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_160857_634932_CD8E63B1 
X-CRM114-Status: GOOD (  20.48  )
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


Hi Vladimir,


On 6/29/2026 5:45 AM, Vladimir Murzin wrote:
> External email: Use caution opening links or attachments
>
>
> Hi,
>
> On 6/25/26 19:24, Shanker Donthineni wrote:
>> This series works around the NVIDIA Olympus device store/load ordering
>> erratum (T410-OLY-1027): a Device-nGnR* load can be observed by a
>> peripheral before an older, non-overlapping Device-nGnR* store to the
>> same peripheral, breaking the program order that drivers rely on for
>> MMIO and potentially leaving a device in an incorrect state.
>>
>> Patch 1 adds the workaround. It promotes the raw MMIO store helpers
>> (__raw_writeb/w/l/q, and therefore writel()/writel_relaxed()) to
>> store-release on affected CPUs, and promotes the trailing DGH of the
>> write-combining __iowrite{32,64}_copy() helpers to dmb osh. Everything is
>> gated on a new ARM64_WORKAROUND_DEVICE_STORE_RELEASE cpucap and patched
>> in only on affected parts, so it is a no-op elsewhere.
>>
>> Patch 2 provides arm64 memset_io()/memcpy_toio(). The generic versions
>> are built on __raw_write*(), so patch 1 would promote every store in a
>> block to a store-release; as each STLR drains the write-combining buffer,
>> block MMIO becomes O(n) store-releases. The arm64 versions emit plain
>> STR in the loop and order the whole block with a single trailing dmb osh,
>> keeping block MMIO at one-barrier cost.
>>
>> Performance: NVIDIA Olympus, write-combining MMIO to a device BAR, single
>> PE pinned; per-call cost in ns. Consecutive writes ping-pong between two
>> buffers so repeated stores are not coalesced. iowrite64/iowrite32 =
>> __iowrite{64,32}_copy().
>>
>> Table 1 - workaround off (CONFIG_NVIDIA_OLYMPUS_1027_ERRATUM=n)
>> +-------+-----------+-----------+-----------+-------------+
>> |  size | iowrite64 | iowrite32 | memset_io | memcpy_toio |
>> +-------+-----------+-----------+-----------+-------------+
>> |    8B |   67.9 ns |   67.8 ns |    3.6 ns |    3.6 ns   |
>> |   16B |   67.9 ns |   67.8 ns |    4.0 ns |    4.0 ns   |
>> |   32B |   67.9 ns |   67.9 ns |    4.6 ns |    4.6 ns   |
>> |   64B |   69.1 ns |   69.1 ns |   69.1 ns |   69.0 ns   |
>> |  128B |  138.3 ns |  138.3 ns |  138.4 ns |  138.3 ns   |
>> |  256B |  276.6 ns |  276.6 ns |  276.6 ns |  276.7 ns   |
>> |  512B |  276.6 ns |  276.5 ns |  276.6 ns |  276.6 ns   |
>> |   1KB |  276.6 ns |  278.4 ns |  276.6 ns |  276.6 ns   |
>> |   2KB |  278.4 ns |  278.4 ns |  275.9 ns |  276.6 ns   |
>> |   4KB |  365.7 ns |  365.7 ns |  365.7 ns |  365.7 ns   |
>> +-------+-----------+-----------+-----------+-------------+
>> relaxed/no-flush: memset_io()/memcpy_toio() issue plain stores with no
>> trailing dgh() or barrier, unlike __iowrite*_copy() which ends with dgh().
>>
>> Table 2 - workaround on, arm64 memset_io/memcpy_toio (this series)
>> +-------+-----------+-----------+-----------+-------------+
>> |  size | iowrite64 | iowrite32 | memset_io | memcpy_toio |
>> +-------+-----------+-----------+-----------+-------------+
>> |    8B |  231.6 ns |  231.6 ns |  232.4 ns |  232.4 ns   |
>> |   16B |  231.7 ns |  231.9 ns |  232.7 ns |  232.6 ns   |
>> |   32B |  231.9 ns |  232.7 ns |  232.9 ns |  232.9 ns   |
>> |   64B |  232.7 ns |  235.0 ns |  233.7 ns |  233.6 ns   |
>> |  128B |  233.6 ns |  235.8 ns |  234.4 ns |  234.3 ns   |
>> |  256B |  237.7 ns |  276.8 ns |  264.0 ns |  276.7 ns   |
>> |  512B |  237.7 ns |  277.1 ns |  238.1 ns |  277.6 ns   |
>> |   1KB |  253.7 ns |  279.3 ns |  276.1 ns |  294.1 ns   |
>> |   2KB |  295.0 ns |  318.7 ns |  288.5 ns |  308.3 ns   |
>> |   4KB |  365.9 ns |  381.4 ns |  365.7 ns |  381.3 ns   |
>> +-------+-----------+-----------+-----------+-------------+
>> all four helpers end with a single trailing barrier (dmb osh).
>>
>> Table 3 - workaround on, generic per-store memset_io/memcpy_toio
>> +-------+-----------+-----------+-------------+--------------+
>> |  size | iowrite64 | iowrite32 |   memset_io |  memcpy_toio |
>> +-------+-----------+-----------+-------------+--------------+
>> |    8B |  231.6 ns |  231.6 ns |    229.0 ns |    229.0 ns  |
>> |   16B |  231.7 ns |  231.9 ns |    458.4 ns |    458.5 ns  |
>> |   32B |  231.9 ns |  232.7 ns |    917.4 ns |    917.5 ns  |
>> |   64B |  232.7 ns |  234.8 ns |   1835.4 ns |   1835.5 ns  |
>> |  128B |  233.6 ns |  235.8 ns |   3670.9 ns |   3670.8 ns  |
>> |  256B |  237.7 ns |  276.7 ns |   7341.6 ns |   7341.6 ns  |
>> |  512B |  237.7 ns |  279.4 ns |  14001.4 ns |  14001.3 ns  |
>> |   1KB |  253.7 ns |  279.1 ns |  28631.5 ns |  28631.8 ns  |
>> |   2KB |  279.4 ns |  317.9 ns |  57276.3 ns |  57275.2 ns  |
>> |   4KB |  365.7 ns |  381.5 ns | 114564.4 ns | 114563.6 ns  |
>> +-------+-----------+-----------+-------------+--------------+
>> the generic memset_io()/memcpy_toio() build on __raw_write*(), which the
>> workaround promotes to store-release, so every store is individually
>> ordered - hence O(n) in the store count.
>>
>> Tables 2 and 3 show why patch 2 is needed: the generic per-store block
>> writers collapse to O(n) under the workaround (4KB ~314x slower, ~115 us
>> vs ~366 ns), while the arm64 versions stay flat at one-barrier cost.
> That's interesting. With the way the patch set is structured, it
> now looks like:
>
> 1. Fix the erratum, but cause a performance regression.
> 2. Restore the performance regression and (re)apply the erratum
>     workaround.
>
> Would it make sense to avoid introducing the performance
> regression in the first place by structuring the patch set
> slightly differently?
>
> 1. (Re)introduce arm64 memset_io()/memcpy_toio().
> 2. Fix the erratum once for all
>
> What do you reckon?

Yes, that ordering makes sense.

I can restructure v5 so that patch 1 introduces the arm64 memset_{to}io()
implementations while preserving the existing behavior. Patch 2 will
then add the complete erratum workaround, including the conditional
trailing DMB for those block-write helpers. This avoids introducing
the intermediate performance regression and keeps each commit
independently usable.

Will and Catalin, could you please share your thoughts on this approach?

-Shanker



