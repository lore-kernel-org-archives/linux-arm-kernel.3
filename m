Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28BDCCD8CA7
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 22:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:From:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nJ/tMU9RtHzEdZMqEM7Uqz6kttNfMB7c8Fy4H6Bvi04=; b=MSKxI505hCbwHkGYkCZ12gzuhH
	QSxPraOgAOEUg3qnEmzQW10cTAVfDYB7Uh+Y6ieN/fF4xcumG9cjMuXnOBtWJYNGQJLHBxqyMrKcP
	YrPyfAYaMSAzN7EeqtpjHQKin2iqc0b/Tt6GdOfGuHmG7ko4xaPoNi6TZq0xJvTz/xTSse4756eqU
	n7QT6qqLslNYOUbaHDVFWtTHQ+iK+DkbBo8hmjrcP1P/AxkyluCAf9uKO8alvA0x1ei6PuSwyeoN3
	Z9xAp0CL28i0p4GbqDWlt3/M9GXQDLuqFgNSNRoSukCnIMKCTwGRbgAL3gRJLxRqHKMQNcQepykT2
	xy+eun2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWilT-00000004Vgl-2XiQ;
	Mon, 08 Jun 2026 22:48:15 +0000
Received: from mail-westus3azlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c107::3] helo=PH0PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWilQ-00000004Vfs-1UdV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 22:48:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A6wR2k6BYDDt/6jKJxaCdi/Z18ZW2Ketd6RBX8NGYUKbIcZJ3vPg6BhvAWLM8Bm/VKOjUwR08ZfcKSPx0DCrN0whZfiNW3UTCLXCd1tDvUwhKLAdIPdeXLwT+whLoG7ONtDcRJRIEjQw472PMir7k2/y3F/8WOmqhn9VgNWkwleSJTd4c0oz/YwVdMsx5piyob1bEphJSN8UgpBj7fzEZsqRSe+DdEqV1JYyIc2Ab7CbYxHVvjNQik0jkZWh2mV8bPy5vtpyE6taEbLsi2w1RuCfP+xGa/K53BxW3epgQezQ0qisaUNfbW8BZeqRst/bJZJKemrhPv09QAJ6aNLl/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nJ/tMU9RtHzEdZMqEM7Uqz6kttNfMB7c8Fy4H6Bvi04=;
 b=xp6B90HzKZVKl8suf9ps+Ym43ux0YfXZFYjqfisZbXmMQqn7bxwiQHlU62eve2/jrHJkfuCR6t9dVafYqmt2yy6F2SFM7EIrSXKn3A//al137SHbaTIkT+qAhVwFIeJehtUYpY4vtScRkmY+3pYYPN1HWefS7AeVnaOHKJsLzIXTd89Fh7PAxWi6TK+s1RHwFz5zFpxdqNgmjnmrZ0fAkNU2NTITPPwuhxodRyehUkadqOyfOtiAK2uS3xzlvrCLrVSNpF6LKCJOPJcTaXDu8Sal3Xy/SFd6ijkbCb2qbtFCfHXwGh9/di4rZXdJ2YjXbFeg/c0P3o8PE0+6AnhKXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nJ/tMU9RtHzEdZMqEM7Uqz6kttNfMB7c8Fy4H6Bvi04=;
 b=E2z8BGznZzc69ACriTdwHU0l8MYlwj/NbQD2RLLWyrqnM4Iug9FfRG3k7xd1ckx5SjeRzCzd4nylJ9ch1RGtCWX8Sfs8tgiPGqoWJFbXf9BgKbRwZ26Eszmbzc5I/1SvfHu6jDHjmh0IHN3ddisc0d1KqygYUu3IFSqA0JFylsY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from CH0PR01MB6873.prod.exchangelabs.com (2603:10b6:610:112::22) by
 DM4PR01MB7593.prod.exchangelabs.com (2603:10b6:8:5c::16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.13; Mon, 8 Jun 2026 22:48:00 +0000
Received: from CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::46eb:64a3:667c:c1a0]) by CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::46eb:64a3:667c:c1a0%3]) with mapi id 15.21.0092.011; Mon, 8 Jun 2026
 22:48:00 +0000
Message-ID: <86c2a7a4-43ef-4d0a-8a91-0629441aad3b@os.amperecomputing.com>
Date: Mon, 8 Jun 2026 15:47:56 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [v7 PATCH] arm64: mm: show direct mapping use in /proc/meminfo
From: Yang Shi <yang@os.amperecomputing.com>
To: Will Deacon <will@kernel.org>
Cc: catalin.marinas@arm.com, ryan.roberts@arm.com, cl@gentwo.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260519163657.1259416-1-yang@os.amperecomputing.com>
 <ah7uCj2V11MnAlaR@willie-the-truck>
 <1252b93e-0c6b-4e33-9bf9-e42cde5ba0d2@os.amperecomputing.com>
Content-Language: en-US
In-Reply-To: <1252b93e-0c6b-4e33-9bf9-e42cde5ba0d2@os.amperecomputing.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CY8P220CA0038.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:930:47::9) To CH0PR01MB6873.prod.exchangelabs.com
 (2603:10b6:610:112::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR01MB6873:EE_|DM4PR01MB7593:EE_
X-MS-Office365-Filtering-Correlation-Id: ca9417b3-efcc-4fc5-fc3b-08dec5affd5d
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|18002099003|22082099003|55112099003|11063799006|5023799004|6133799003|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info: OIxOcVowKdnfgnm7mj2QdluZqv+w3a9fbC+b1Mww1eeetX+/pkGaMDcIa7ZZboY+mWqDekgxT7ZDyqUC0iWXYdxsGw/M3RSshRCVspihc64w4cJSkoccnATOE58CZmVL5P+c+z8ER46d16iJZg/9Us3+xqs1gAWXVo42de8AMTWu9ZiTeD4wOX7nDeXmLHbYtLQ/KQVzeOzs2e8vX5k9KNZOQdX01CkBCjCs63DETwUHChwYAyoCSlRCPdo1+a92v9XpBNFIWFizelyXDk41NZon5QD8H6dcNIYYHo+6c73xd0IlOTBjTr/wJPZNhhQdCE7LvayVZ6kRJUep3ow2cyhrHA5eRbr05Qf395vDF4Zzcypz0zbxNPHtXzdKKIGb3+TCTi5EesCPSTXvdZvQoomH2xT0ud+UzmuIpvlfVgB0hIX3hW0M/OHNfNTLC4f8f+227MBajmBJhyONBYzH0IV3rn0nhV8JO8FMXWaefrrJF0cr3HEVFRavNJO6KNF3FUSB3z+iKDsJzYZXMm7VAHeN7SlLUb9A8yKN/KJAOaDzoDO1fsMNPdoDeY6+9zb/HHDXbRJr2CDHYLu2Ey4sI0aDTM5UewIl0OIEN6+njq/2tIaVZJ3f3kn830d6nBNIuQqRRftSO88Ew/4F6Aibpw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR01MB6873.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(18002099003)(22082099003)(55112099003)(11063799006)(5023799004)(6133799003)(4143699003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VnNpWkJOMUExV1lhV1lHSW9lc0EySW9iZG16YUNXYzVEcER1d2FOTFJVeHFS?=
 =?utf-8?B?dVpCNjQ2cGU3WUtiMW9JbDVwK0tBYWVTTy9aNmViUE5FOHBRSkc1eitYVXJv?=
 =?utf-8?B?dVVJY2M2ZGhmV0c0U2l1cS9pZ3RRektGRVptOVVZb1BlQ2dRaHF4cXJjWmZC?=
 =?utf-8?B?aFNjT3JzWHRLUWtzOENhcGFXQWY2S2NRT21ienQwQk5EdndlVFJXcUF0NHRV?=
 =?utf-8?B?a1VMdFZKWnVhVExpV3F6SGRkU2ZqUnk4QWNuMTNVSlRnMm9Sd0dYMFVGNk5N?=
 =?utf-8?B?dGNKVWdJS2VlbzUzQVlaMXZIZVBlWXZ0S3NJTE5ZU2pvbXk2SEV1UlBVOG8v?=
 =?utf-8?B?VzN6d2hhdWlNOXdBV2F2azJNUEpURll2SnVEUWNXdGh1aEdIc013dEl5SlFQ?=
 =?utf-8?B?VklLM2tVQWp6NDZXa3lwV0lCUndYY1lLNnRuSTlGWkVHblBxTHJ1eFBhZWxl?=
 =?utf-8?B?QmwxN25sc3hMdmZlbFhzVjF1d0ZEc3drT0NkYnRUaXRaOHMrM01YMWtWUDBG?=
 =?utf-8?B?SWZMMDlXamNsZ1FITHo2UkhOU1d2NmhWWHhwRDhxWkJTVUZLWTRodzdzTm9Q?=
 =?utf-8?B?SGlWZ1p2STZDdnNjK2RXc1kyZm8xTXEvaG92dVloclhjV1YwSklJZ3pGbGJM?=
 =?utf-8?B?amJGcXZKOENIZWpJUzFGYUUySlFqYUY0ZVdBSUhqZ0Jlekc5dkd5dm1teTQw?=
 =?utf-8?B?ZlFZKzlqSHNFOUhPeXBOREg5K2NIcWxZeE8vcWZRVVV2eEd1UTYwQnVhK3BQ?=
 =?utf-8?B?OGtwV3VscGtsQ3I3cmNrT2UvQ1RmeXlaY05TbGxKejBsdVpTenR1V3Zrb25B?=
 =?utf-8?B?VjBmNzQ1WTVQU25pVG5qZXJjaXFlQXlYUnkzWWt0TG4rK1ZkanhHTmppTUZK?=
 =?utf-8?B?S0haSWxQZ1NQMDE0dTZHTCtEN2UxZGpqakw3RjdOMm1zQ3Mxb2FPUjZvQk9X?=
 =?utf-8?B?NVhRS1RsYWwwSFVxaEJQWkFQcVFBRzRkWURaWFBQUzJKMTdKT1NaclJoR2FI?=
 =?utf-8?B?em9LTnorRVJuZnNYdjMwRlBvdWpYRUkzTHFTMmtjUWNMTDh4bXNYTFZRLzI3?=
 =?utf-8?B?bXVrSzA1a09JZGk1VUI2UU5KWkQ5QzdYOW1CM2JzMUIvOXRzZXNoQzJab2RZ?=
 =?utf-8?B?RnpqT3BkSUo5bURxbmx1TWhPUjlqTnNJMmNaQW0xZlZTNHd0Z3dHb3ZVTjlJ?=
 =?utf-8?B?U1FRN1lmRU1QS0Y5VkxnWUwrMWk2VkxocFlhcGU3REN3eDBmcE1xeENlWFZQ?=
 =?utf-8?B?M3hRUld3QmxhNnZZS3pZMG8reGpKMVhGc21COUhacU42MWh1YUQrMDYvOUtn?=
 =?utf-8?B?S1lhc3NlUzUyazZSQzFvbVNPTGRidjJvQTVtZmltSStaeHgvWWo4dm0wYzlE?=
 =?utf-8?B?aTJWd1dVcnc3dDZLT3MrZmVtbHU2WE9vQWhyanRQTjRGbHdHTjdieGoxcVhx?=
 =?utf-8?B?OFV4L284QVp4R0hPVHBqQjd0YXd6MkltMjhTYzlGSGlzT3dnMFZpRVlzNWpi?=
 =?utf-8?B?UVFqZEQzMUlHZjhkbllvQ0pOanlCTHJTN0E0bmtjZHpwY29heUg5OXl1Z2lR?=
 =?utf-8?B?ZTBNTE1nVkpEVUNqWWdwR3JuVUU0MDRQNEU1SERWUFRsdTZFeTZkYUJZZDVF?=
 =?utf-8?B?bjBkbkM4cmpzWkVZT0MySEVDTkJtcnlIc2czbGhPLzVUWXowMkxOeTJaWjEz?=
 =?utf-8?B?bzR0SzQ4ZjBmQWludlNjbkdJR0xxYkJHNUw3cStCRHlXTVczbUQ5c2h5OWJz?=
 =?utf-8?B?bTNPL2ZHdVYvM1FBb3hwYWc4RWRYcnllelRnNDJoRnJyczJyd09hcHlJL3lk?=
 =?utf-8?B?QXJhNktTKzlOT3pvb29mbkdkc1kwckxjL2lhYnhvZ0t2YTQ1UnB0cXBqN04r?=
 =?utf-8?B?aXBUVnQvTUN4NFlmRTlpVlNyVURXMXRoS3FRRDloNkJjSmVST0dyUGVmRzIz?=
 =?utf-8?B?MmNpZHJzZDh4cWd3RjNWNitXMnllVXlOU3ZGa0d1enVRWVMzMnJyRmt4TUhO?=
 =?utf-8?B?OGpSZ2ZZOEpoMFZMeG54TjhqbXlHZ04xakpOU2JlQ3FWQlRVZU5yT3p1THdw?=
 =?utf-8?B?UDg4UU1tZ1pib2ozenA1NjI4YXkwOTZHVUlvb0Z5cXZCUVhHQk5EWjk4bG85?=
 =?utf-8?B?alpacmNQZmMzdmJTb2JIcDFLbGRSTUxQbXNSb201SmJ5eEpPOHFPZGsxbzMv?=
 =?utf-8?B?U2JKZHRnaHpFN0JXdFJ5MzFtV0tDSVdubTd3NS8xRTJEcVlrZEZ0Qlh2VUpa?=
 =?utf-8?B?Qi9PNVFCNVpNeFF6Sk5scmc1aUhKSlNnbkZIcHVqMGxuQzA5QnlxT1BqdGxW?=
 =?utf-8?B?eVRoZFhkZXErUkNkTkEwaVBqbWJWVUpiNy9GSzNiOTlKQ2xDdkt5WUNNY3hs?=
 =?utf-8?Q?mY+UD2vaAP5DQB3s=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca9417b3-efcc-4fc5-fc3b-08dec5affd5d
X-MS-Exchange-CrossTenant-AuthSource: CH0PR01MB6873.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2026 22:48:00.0299
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sl9czdvadHMGHknN7F10pf1L8PS/zgDsWETFM3+e3IKs+hu2cx0bMOnQJqqTcDRUHx8luKDDSXtmwjyKJ3zWYSKVtdYlRKXmUBemGv25liw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR01MB7593
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_154812_416736_4A7EBB55 
X-CRM114-Status: GOOD (  39.92  )
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



On 6/2/26 1:38 PM, Yang Shi wrote:
>
>
> On 6/2/26 7:51 AM, Will Deacon wrote:
>> On Tue, May 19, 2026 at 09:36:57AM -0700, Yang Shi wrote:
>>> Since commit a166563e7ec3 ("arm64: mm: support large block mapping when
>>> rodata=full"), the direct mapping may be split on some machines instead
>>> keeping static since boot. It makes more sense to show the direct 
>>> mapping
>>> use in /proc/meminfo than before.
>>> This patch will make /proc/meminfo show the direct mapping use like the
>>> below (4K base page size):
>>> DirectMap4K:       94792 kB
>>> DirectMap64K:     134208 kB
>>> DirectMap2M:     1173504 kB
>>> DirectMap32M:    5636096 kB
>>> DirectMap1G:    529530880 kB
>>>
>>> Although just the machines which support BBML2_NOABORT can split the
>>> direct mapping, show it on all machines regardless of BBML2_NOABORT so
>>> that the users have consistent view in order to avoid confusion.
>>>
>>> Although ptdump also can tell the direct map use, but it needs to dump
>>> the whole kernel page table. It is costly and overkilling. It is also
>>> in debugfs which may not be enabled by all distros. So showing direct
>>> map use in /proc/meminfo seems more convenient and has less overhead.
>>>
>>> Signed-off-by: Yang Shi<yang@os.amperecomputing.com>
>>> ---
>>>   arch/arm64/mm/mmu.c | 192 
>>> +++++++++++++++++++++++++++++++++++++++-----
>>>   1 file changed, 171 insertions(+), 21 deletions(-)
>>>
>>> v7: * Rebased to v7.1-rc4
>>>      * Changed "dm" to "lm" to follow ARM convention per Will
>>>      * Used __is_lm_alias() instead of reinventing a new helper per 
>>> Will
>> Thanks, but Sashiko has pointed out a few nasty issues:
>>
>> https://sashiko.dev/#/patchset/20260519163657.1259416-1-yang@os.amperecomputing.com 
>>
>>
>> In particular, the potential for races updating the shared counters and
>> double-accounting of entries due to permission changes look like
>> interesting things to check.
>
> Hi Will,
>
> Thanks for reminding for Sashiko review. Please see the below response.

It has been one week. I have not seen any objection, so I will proceed 
with v8.

Thanks,
Yang

>
> #1
>> When features like memfd_secret remove pages from the direct map by 
>> calling
>> set_direct_map_invalid_noflush(), it clears the PTE_VALID bit via the 
>> pageattr
>> infrastructure.
>> Since this patch doesn't hook into those callbacks or set_pte() to 
>> invoke
>> lm_meminfo_sub(), could the unmapped memory continue to be accounted 
>> for,
>> leading to a persistent mismatch between the actual direct map size 
>> and the
>> reported statistics?
>
> The direct mapping counters in /proc/meminfo don't treat invalid 
> direct mapping differently if I read the x86 code correctly, as long 
> as the range is still mapped by page table regardless whether it is 
> valid or not. The counters are just updated when the mapping is 
> created, removed (for example, boot stage or hot plug/unplug), split 
> and collapsed. It seems like transient invalid direct mapping is not 
> considered as "removed". And it seems not bother anyone.
>
> I think we should follow the semantics and keep the consistency. We 
> can definitely make changes in the future if it turns out to be a real 
> problem.
>
>
> #2
>> Could concurrent calls to functions like split_pmd() (e.g., via
>> set_memory_ro() or set_memory_rw() during BPF JIT allocations or module
>> loading) cause data races and lost updates here?
>> These updates use non-atomic read-modify-write operations, and
>> apply_to_page_range() only locks individual page tables rather than 
>> using a
>> global lock.
>
> Sounds like a false positive. The direct mapping page table split is 
> serialized by pgtable_split_lock.
>
>
> #3
>> Does this code, as well as similar sections in init_pmd() and
>> alloc_init_pud(), double-count memory regions when updating permissions
>> of existing direct mappings?
>> When functions like update_mapping_prot() change the permissions of 
>> existing
>> valid direct map entries, this will unconditionally add the size 
>> again without
>> checking if the entry was already present (e.g., checking pte_none() 
>> first)
>> or subtracting the old size.
>
> Yes, it may double count when updating permission because updating 
> permission reuses the same functions. It sounds not hard to address. 
> We can check whether PUD/PMD/PTE is none. If it is none it means 
> kernel is creating new page table, then we count it. If it not none, 
> we skip accounting.
>
>
> #4
>> If a portion of a contiguous block is hot-removed, could this multiple
>> subtraction underflow the counter?
>> On ARM64, the memory hotplug block size can be smaller than a 
>> contiguous block
>> size (e.g., CONT_PMD_SIZE is 16GB with 64K base pages). If a partial 
>> chunk is
>> removed, this subtracts the full CONT_PMD_SIZE. However, it leaves the
>> PTE_CONT bit intact on the remaining valid PMDs.
>> A subsequent removal in the same contiguous block would see the PTE_CONT
>> bit again and subtract the full CONT_PMD_SIZE a second time, 
>> underflowing the
>> counter.
>
> It sounds like a false positive to me. This case should not happen at 
> all. We just can't unplug a portion of DIMM, right?
>
> For example, we plug a 16G dimm to the machine. We can offline a 
> portion of it (at section granularity), but we can't unplug a portion 
> of it, we just can unplug the whole dimm. The counters update happens 
> when unplug.
>
> Thanks,
> Yang
>
>> Will
>


