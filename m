Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6356CD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Jun 2026 22:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t6WBKtEJewNdt4lNyy+GlfMbn47YoGV7jxaMkewHWEM=; b=UOy8WsUGS/ffeoFzqbpDLXvJaE
	irOJZsGtWitH1Av4AMxTxrsYvSk2cOJBIlBDj3zuFHD/57mmusgnvddWcJ+BAUqocLebemhzXyjvu
	J4QSVioCODumDD3x+/rCmhmNI4dO2A+3OBt/O4I7VrABB4ky+w30lMSYW+THz8rMfKnLYihJh5NrN
	Omx86h4sNk0o6iBdpNTXl5W/h4p03g4PDw4e8/T/AV+EAMleM3D9keSL3xJVy2cfZ0bJbLFzhQYOk
	ilsnB00m6GxFEtR9Qzcm7ypUW/7kUuKQzzGrRhsZrcbpUGkO/bcEYlaLWlr67Vz8z1ZOGDsXKt6FQ
	5n1aGnEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbmnp-00000005QTo-0SVV;
	Mon, 22 Jun 2026 22:07:37 +0000
Received: from mail-northcentralusazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c105::7] helo=CH4PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbmnm-00000005QTR-2nv2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Jun 2026 22:07:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WswtxZ3RZN1uoJvQX2LLHHQDskGzkv97PUiLJPyPeyFoV2LgjfzJV1IyhsCm+7fpSJ8fzNbrI3bUHucSbRHFQPTaUNMGjl/zVhfIwM004mdc0iDlM8KzwY7g6m+2xCpRc1NDQL0US7dT2zI/vB8zFU7a1p012QndvTkm7FoECTSxnXFllD54M+kXHd5Eh6pnzMGi/C458t8+X7fbYZ0sZ0mD4wz3HcyfNVSdZmJLKMXtu8tCg6HOywXvzDFnaAl4kbdanokoLmcwJ22X3ppkPazqSZiPXtb1Ayo2j8l6tl4HXBCP0kNfz0Uv2lZ2SA9NYcBmGchJqEcZtc14bJ5OUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t6WBKtEJewNdt4lNyy+GlfMbn47YoGV7jxaMkewHWEM=;
 b=nrQLfQX8q/0KMbEago/ITVd6CdPEeHBYTmN5/gzDqvmeyjRFFHAklKNAsB8TP6gjOsqHDGhLJMC5fYLh1E6OGllDbvLqgFQyP+WURBd0mHXFth0Ma5zDt4/1WsEqWXIqCEvxVsAjjRDqHaW1YjHZjHn3eN/HcQm6p1omJhnKnimOeoDkR76LhYGeG5glCPQH8nz7sI11NmHIhQQHRvuNr3bs5xz3aAeilXNcfM3WPDMXZG6P1jVyovqr0gSpsg30cZSdS6udMFhhS+agb8cbipb6X5GNe9+igNjw6n+OKUCO2gw0M0vVtEsTZ6MvFGO4fp3NzfJzuZD6gcxxI6tviQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t6WBKtEJewNdt4lNyy+GlfMbn47YoGV7jxaMkewHWEM=;
 b=BPH7LgXEj9+ah/WOQiXxtV9OG2YRHeqFrzGqWVfiYS+WH3epQ17LE0XevPOuFHI4Gad6LOG+WGAeYvYLaiXJhX9l2O7hLCvSKYt00Ajx4Y9oDgiDsL0OFNJFTbbmrB1svrNqrs6ASwNswyBakxsl5qw70qv4K2m/Q6S44rcINJQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from BN0PR01MB6877.prod.exchangelabs.com (2603:10b6:408:161::22) by
 MW4PR01MB6257.prod.exchangelabs.com (2603:10b6:303:7f::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.20; Mon, 22 Jun 2026 22:07:25 +0000
Received: from BN0PR01MB6877.prod.exchangelabs.com
 ([fe80::3a8e:b149:407d:a9ee]) by BN0PR01MB6877.prod.exchangelabs.com
 ([fe80::3a8e:b149:407d:a9ee%6]) with mapi id 15.21.0139.009; Mon, 22 Jun 2026
 22:07:25 +0000
Message-ID: <9112dcf9-a224-48e8-a1c6-ac7f36817e4e@os.amperecomputing.com>
Date: Mon, 22 Jun 2026 15:07:21 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 1/3] mm/huge_memory: make persistent huge zero
 folio read-only
To: "David Hildenbrand (Arm)" <david@kernel.org>,
 Xueyuan Chen <xueyuan.chen21@gmail.com>
Cc: dave.hansen@intel.com, akpm@linux-foundation.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 x86@kernel.org, catalin.marinas@arm.com, will@kernel.org, tglx@kernel.org,
 mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
 luto@kernel.org, peterz@infradead.org, hpa@zytor.com, ljs@kernel.org,
 liam@infradead.org, vbabka@kernel.org, rppt@kernel.org, surenb@google.com,
 mhocko@suse.com, ziy@nvidia.com, baolin.wang@linux.alibaba.com,
 npache@redhat.com, ryan.roberts@arm.com, dev.jain@arm.com,
 baohua@kernel.org, lance.yang@linux.dev, jannh@google.com
References: <0e5b23a6-4895-454a-9dfa-6dc21adc2991@kernel.org>
 <20260619025553.226940-1-xueyuan.chen21@gmail.com>
 <f679fc68-5ff6-4715-9a07-9eb3074b2d1e@kernel.org>
Content-Language: en-US
From: Yang Shi <yang@os.amperecomputing.com>
In-Reply-To: <f679fc68-5ff6-4715-9a07-9eb3074b2d1e@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0075.namprd05.prod.outlook.com
 (2603:10b6:a03:332::20) To BN0PR01MB6877.prod.exchangelabs.com
 (2603:10b6:408:161::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR01MB6877:EE_|MW4PR01MB6257:EE_
X-MS-Office365-Filtering-Correlation-Id: 24890140-7cd6-4392-b8fd-08ded0aaa482
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|7416014|18002099003|22082099003|55112099003|11063799006|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info: O7f9DGY7+wZtzH+4CAlQQ1VySvKdJqftAUl2W0ifjgr3sSg+d0JeglygzV75pzmiUma51djEJzKL0c8PsGlJAX+x2T9VUx7/jy900nz/f5LLzecMHreClLQ2iXrZ7wfpE5METHqB+fxrqgjG6mWMa5ZtWm7G9QiNb6e+Bzc27ynTul1nveJJdKEDiMNe9k2OE81+dBOY3GliLhTYD+zLhLxXQ+brAxxQbNuWZj6UJgbA5mvTvBqHzDLDZ+eC7MlarStDc5z4TIczCQ4+lC3XXklGI453UxaefBDYpMxLy2WZN3WBRjijThZN9bnp7Si/SNNZApWFi8GBYd47keH1n4VhcziUI/iGkkrInn6kUppdY7mU6vov12R/0SldwbcG7kpkfUW0NtgH57MW8wPPOA8UoGKEbzy8IkI09QVqolMU3cE1+cfbeYiGDmoM/VYmZkwIekuIQ53v54JMKQ/CzpOo3ObTg2OJyGERejp279RZt+nTLagymQLG6Edg4xpmX3JnSDEFemUvCwQfXLwDF/l6hGbPZZe3gE0h0zf92FnykCg88yMAHkSjH+XKaEO6XMsEn0wL2UpMmy8ukgzA4Krp9VRU4eseTHt9P4vFyXg1hxbCh7kx9aAAzXEykFScHtU14jbW0hfNW66JW7ydBuovna5R99ZyiiKmShshWeo=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR01MB6877.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(7416014)(18002099003)(22082099003)(55112099003)(11063799006)(56012099006)(4143699003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S05KdFlrYXVzbm04eERnV0VyMWxxeERlQ3psZTNwS3hKbTZlUHhwMDhuZFZT?=
 =?utf-8?B?S2VRZ0R0L3BuazJJVUVEdUtRMXhBY2d4b1ZlWnhhd25lS2tldTdoUG9NRm1J?=
 =?utf-8?B?WWZzMWFSSHAzbW9CdWxmWGc5Z3c0UnE0Nk1qaEtQeFdQdWNMK05YTGJYR1E2?=
 =?utf-8?B?NXBnTHA1Rm82bGlUNTFsRjc1SjFyOUFzV1dId0JwRlBlUlZhYTBNOWVzVUFY?=
 =?utf-8?B?WnNodGJCL0RkZ3lvcy95cFNvbUdhYUw5MktrWXo4NURLN2Fla0E0bXRmRFhV?=
 =?utf-8?B?aFpuZm93RUxxTVp6MzJPczN0T2FxSVpsdFdUR0NmMWQrU2Y2Um4vUnZhcWRR?=
 =?utf-8?B?dnh1blJWUjdVazI3b1VmdUk1NDQrajJOTENUMWFreGlFR3BwR0RtOXdiN2lo?=
 =?utf-8?B?b1hYNkFVaURzdjVHc1lCREV2S1dicmNUc2cwWmw0TXBuUjFpbEJ6eHNUU1pr?=
 =?utf-8?B?SlAyZ0dBZDNROUZEaVp2RytoWGdDZ3ZLUi93QldmbGMrakpTRzlVa0lhT1pr?=
 =?utf-8?B?R2VCKy9tZ0NwNUZtYzlibUlIWUU3c3U0VDRlRGt6ZEJwd1JWamc2S1YrZzRF?=
 =?utf-8?B?eS81NlJyM281NmNaZ3owWE5CblZsWTJYZkdKRXVFaGhZeXFidGJiajhyTUNm?=
 =?utf-8?B?KzBFbE9URERqWk1zVW40ZEE5MllDeG02dFdqdWxvVmp3a1BRaWlNU3BabmhK?=
 =?utf-8?B?dmd0bDNmd2JxSWhlbDQ0VUo0cXgrYVY0YVlES2hkL2ZxRGR0Sks4eWV5cmZv?=
 =?utf-8?B?d0JsVHo2WXVQZ0tlR1VKMGFDOXJLRjVORWx1NGttclZxZk9mMnBRNmRGNzdp?=
 =?utf-8?B?RjNhRGpWZE9GMnZvMDJKcVFKL0F2Z0JsYlZLaWY2ZWVpbnFBQUtWRHl6SlpV?=
 =?utf-8?B?Z2IrQWxiTEdhcy9ZYS9aQ1RKTmh0eGJDcVdmbWtHckx1c20wQTNFYU92ZGpW?=
 =?utf-8?B?amRSQll6a1Zja2c1Y2NiVndMYzRpa0RoSkhab3oxbkpyR3E0OHZmTlRkeGZs?=
 =?utf-8?B?dXdXcXFvRE9FR01kOG15RFJUSmtMcFcxLzMraDZvMUJBNmxPVmZ2eFg3U2ta?=
 =?utf-8?B?ZWhvK3JIWE93alpQNjFrWVRwOVRlcHc5VVZEYVZobkUwdU5NU3NkVXN4b3NJ?=
 =?utf-8?B?UTFxd3VDNmk0SzZjczVIQjRFOW5VSGNMYUlrZDRCdlNpOEhjRmNqL1phVkF6?=
 =?utf-8?B?bjFiYmhacFk4SHdQbHVRZ3hIOWZsQXVIaWFKNnBmRXJzREp4R1kvanBjanl3?=
 =?utf-8?B?TittdkFtamZKQkhuMDFqUjBkM1Y3cDN1MEY4bnlCSUR5TXZZOFhhSTVpczJX?=
 =?utf-8?B?ZjRTR3Q2RXJkUkJVYncrNWdURE9aTVc1Z1NZeW80Y0luOFJuVG13MGthUzBl?=
 =?utf-8?B?VVdPczd1S3RqbEVpdHFYWndFcmN3cTR0WWF5RE5PY3lHRTU3TldVZ1ZmeFNs?=
 =?utf-8?B?eURIMFU0N0ozMGFPYms0WVpPMkEyb1htWFVHMFJRYzBtSVBUVnJWc1FMTmNW?=
 =?utf-8?B?TXUvMjJtbWt2eWNCSEtnRFBjdUphRVZGM3VDa0NuV0NSZWtHVGd1Z1FzNDlz?=
 =?utf-8?B?dXFDb3FQVXpXYlBhdHRoaWtSQ0VlMXd4TjF5RjhqTG5RYVVHOEEwRDE0Vk1K?=
 =?utf-8?B?SkVQU2dZTk4yVlE1eGtEVXFrK0FXUXBWNlJqTkFhNlZBRE85NnR2UzZUcnVo?=
 =?utf-8?B?bkhVT05nbTFsQVBpUnFWa2JoNU13T2xxTGE4d25zNmczVEFDTERLdHVWVTY5?=
 =?utf-8?B?M0xoZTZVQllhbitHS1pOZkI3MElwc00vLzczeDZQQUhQY1NSenJWeC9VUDFy?=
 =?utf-8?B?eXk0elRqR2oyVkhYWGdCcFMvT3lHMmZYRzJKUStJMVhxQm03bjE4c3NVSU1w?=
 =?utf-8?B?bUtYOFhaa2k2UXdGTFA5ajNBMDJuREMvT0Jmby9zRXhjOHViNW1TbUhZTEVQ?=
 =?utf-8?B?M3B0ZlJpWmp1ODNLL1FENEdEUjBaSXJBVHhvTU1QNGY4N3ZZdTVZQmRYbmxu?=
 =?utf-8?B?bXlZWXd5THdQUm9mclFiNlRmbFZ3YWRsbXdKWUtDdXladEFIdWpKcm1yMktp?=
 =?utf-8?B?ajVINVZmUldsVFBNblNYNWJkMlByNFBVWituUm1US01TaXVjT1pPQlROOVBr?=
 =?utf-8?B?WDJnWnFtU0k4a3ljeno1aHJoNE9LYk1xTWJVc1p3TmwvanJaWXBpVGFFTEt3?=
 =?utf-8?B?eXB4K1ZrUHRiMHp0aXI5QUpReHRwNlVtbDYrY0psd2NZQ1U5bWRTVmh0MThT?=
 =?utf-8?B?bzRFamZZMWhqaW9JdHpiYTN6N0dFaWY4RDA4bHh5cnJFc01ieGZBTC8xb3JH?=
 =?utf-8?B?UzUyd3RYZVlCc0NwOTYzWHFSdEg0MzQ5TnBFZG13aFBkbGNkSHpORFE1MUda?=
 =?utf-8?Q?BW+DyuWwEpJ+ZsKc=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24890140-7cd6-4392-b8fd-08ded0aaa482
X-MS-Exchange-CrossTenant-AuthSource: BN0PR01MB6877.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2026 22:07:25.7312
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XoJZcvuP0uMvu6aaMGJGcAZSBaVMeq6H4S4Lvzgz7rrGSxtLxl7Vzqrs8HwqtZ4n7Q0pF6dBmkY2OK9ysa+ipp1+nYlzTdbWN0SrlOqGnUM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR01MB6257
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260622_150734_729226_4ADAC4F0 
X-CRM114-Status: GOOD (  21.69  )
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



On 6/19/26 4:09 AM, David Hildenbrand (Arm) wrote:
> On 6/19/26 04:55, Xueyuan Chen wrote:
>> On Thu, Jun 18, 2026 at 02:36:25PM +0200, David Hildenbrand (Arm) wrote:
>>
>> Hi, David
>>
>> [...]
>>
>>> Best to wait for some feedback.
>> Sure.
>>
>>> I do wonder whether we want to pass an address instead of a page.
>>>
>>> https://lore.kernel.org/r/20260410151746.61150-2-kalyazin@amazon.com
>>>
>>> Wants to convert existing ones as well.
>>>
>>> That would imply that the caller must check for highmem.
>>>
>>> But then, we could just use existing set_memory_ro(), right?
>>>
>> Agreed. Passing an address and reusing the existing set_memory_ro()
>> definitely makes things simpler.
>>
>> However, there is an arm64 specific limitation:
>> currently, the set_memory_r* api on arm64 only support the vmap
>> region and do not handle linear map addresses.
>>
>> If we go this route, should I extend the arm64 set_memory_r*
>> implementation in the next version? The plan would be to make it check
>> for the bblm2 feature and modify the linear map PTEs accordingly.
>> What do you think?
> Good point! It's not really clear on which ranges set_memory*() is supposed to
> work ...
>
> arm64 only works on vmalloc/vmap, x86 and riscv on ordinary directmap ... what a
> mess.

arm64 version works on vmalloc/vmap *and* the linear map alias if rodata 
is on (a.k.a. full before). It should be not hard to make it work for 
linear map address (w/o vmalloc/vmap alias). I think we can just follow 
riscv's implementation by doing:

if (vmalloc or vmap address)
     ...
else if (linear map address)
     ...

Thanks,
Yang

>
> Having a new direct-map specific function with clear semantics might indeed
> avoid even messing with that.
>
> So, yeah, given that we have
>
> 	set_direct_map_invalid_noflush
> 	set_direct_map_default_noflush
> 	set_direct_map_valid_noflush
>
> Let's add a
>
> 	set_direct_map_ro()
>
> Or (my preference)
>
> 	change_direct_map_ro()
>
> But given the existing naming scheme ... maybe just set_direct_map_ro() and
> we'll clean this up another day.
>
>
> Now, should there also be a "_noflush" in there, or who is supposed to flush the
> TLB (or don't we flush at all, because it's used early during boot so far)?
>
> In any case, for this function we should add excessive documentation and define
> clear semantics.
>


