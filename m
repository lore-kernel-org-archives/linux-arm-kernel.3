Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF55CC83F26
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Jul 2025 09:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1R3wLojHI2jyxLalrUt6NRLinefciF1M/4eq+YtOci0=; b=r4oByV87Uq+aZK12QCaNJfeY7t
	BGaYZhaeZFjP8xTVytcNX/y+zDN0iW9PO/ekXEw6iBTJNeM9RTO8OXbZX+ZyateOKSgh9Iji/dpbo
	Fwya1TqwEoCiDVCliSG2GGp60ypz65En5ckflwAADj8l81hEH7cfSlb/n3gwYi/dywwt2Ajj/kupL
	M0Eki8KAemDB0RjrXE4WRkkU/Gnu+rjs7QlFYt9hEQ8/uRXi85Tt7qfCVLAXcfImrug8dX7tFBoFr
	7nzXg/uZZXX4upIBuQGp9/JGJi+JzJQi8B+JTm1qZmwTfFvmVUBzLGvSsW7RqsQh0BJi7m/lMB/iO
	sPO1dilg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugJlh-0000000E3Bm-41Xp;
	Mon, 28 Jul 2025 09:03:37 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugJMn-0000000E0lE-0h8g
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Jul 2025 08:37:54 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1ECAC1596;
	Mon, 28 Jul 2025 01:37:42 -0700 (PDT)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 26F6A3F673;
	Mon, 28 Jul 2025 01:37:46 -0700 (PDT)
Message-ID: <f14db9e0-95c8-4389-9a27-69f0ba9b5329@arm.com>
Date: Mon, 28 Jul 2025 09:37:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 04/36] cacheinfo: Expose the code to generate a
 cache-id from a device_node
To: James Morse <james.morse@arm.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Cc: Rob Herring <robh@kernel.org>, Rohit Mathew <rohit.mathew@arm.com>,
 Shanker Donthineni <sdonthineni@nvidia.com>, Zeng Heng
 <zengheng4@huawei.com>, Lecopzer Chen <lecopzerc@nvidia.com>,
 Carl Worth <carl@os.amperecomputing.com>,
 shameerali.kolothum.thodi@huawei.com,
 D Scott Phillips OS <scott@os.amperecomputing.com>, lcherian@marvell.com,
 bobo.shaobowang@huawei.com, tan.shaopeng@fujitsu.com,
 baolin.wang@linux.alibaba.com, Jamie Iles <quic_jiles@quicinc.com>,
 Xin Hao <xhao@linux.alibaba.com>, peternewman@google.com,
 dfustini@baylibre.com, amitsinght@marvell.com,
 David Hildenbrand <david@redhat.com>, Rex Nie <rex.nie@jaguarmicro.com>,
 Dave Martin <dave.martin@arm.com>, Koba Ko <kobak@nvidia.com>
References: <20250711183648.30766-1-james.morse@arm.com>
 <20250711183648.30766-5-james.morse@arm.com>
 <bfc4d1b5-c8c4-45de-b52a-833486368336@arm.com>
 <ccbf2f40-7e69-4b51-953f-113695b8c16e@arm.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <ccbf2f40-7e69-4b51-953f-113695b8c16e@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_013753_301235_24F819E9 
X-CRM114-Status: GOOD (  16.45  )
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

Hi James,

On 7/25/25 18:08, James Morse wrote:
> Hi Ben,
> 
> On 14/07/2025 12:40, Ben Horgan wrote:
>> On 7/11/25 19:36, James Morse wrote:
>>> The MPAM driver identifies caches by id for use with resctrl. It
>>> needs to know the cache-id when probe-ing, but the value isn't set
>>> in cacheinfo until device_initcall().
>>>
>>> Expose the code that generates the cache-id. The parts of the MPAM
>>> driver that run early can use this to set up the resctrl structures
>>> before cacheinfo is ready in device_initcall().
> 
>>> diff --git a/drivers/base/cacheinfo.c b/drivers/base/cacheinfo.c
>>> index 613410705a47..0fdd6358ee73 100644
>>> --- a/drivers/base/cacheinfo.c
>>> +++ b/drivers/base/cacheinfo.c
>>> @@ -207,8 +207,7 @@ static bool match_cache_node(struct device_node *cpu,
>>>    #define arch_compact_of_hwid(_x)    (_x)
>>>    #endif
>>>    -static void cache_of_set_id(struct cacheinfo *this_leaf,
>>> -                struct device_node *cache_node)
>>> +unsigned long cache_of_calculate_id(struct device_node *cache_node)
>>>    {
>>>        struct device_node *cpu;
>>>        u32 min_id = ~0;
>>> @@ -219,15 +218,23 @@ static void cache_of_set_id(struct cacheinfo *this_leaf,
>>>            id = arch_compact_of_hwid(id);
>>>            if (FIELD_GET(GENMASK_ULL(63, 32), id)) {
>>>                of_node_put(cpu);
>>> -            return;
>>> +            return ~0UL;
>>>            }
>>>              if (match_cache_node(cpu, cache_node))
>>>                min_id = min(min_id, id);
>>>        }
>>>    -    if (min_id != ~0) {
>>> -        this_leaf->id = min_id;
>>> +    return min_id;
> 
>> Looks like some 32bit/64bit confusion. Don't we want to return ~0UL if min_id == ~0?
> 
> Certainly some confusion - yup, because cache_of_calculate_id() needs to return something
> that is out of range and (u32)-1 might be valid...
> 
> I think changing min_id to be defined as:
> |	unsigned long min_id = ~0UL;
> 
> fixes this - any trip round the loop that doesn't match anything will eventually return ~0UL.
Yes, that would work.

> 
> 
> Thanks! - I always get the 'UL' suffixes wrong.
> 
> James

Thanks,

Ben


