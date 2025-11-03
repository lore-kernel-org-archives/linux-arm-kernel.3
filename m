Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DC9ECCFA03
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 18:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CGbhjmpZVWXoSy9UYKPfoXYpdHSekQkl2moVN/7/8dc=; b=vkKOGEBDGHWIeXBjxEvfHkS7kr
	GOiSmuh5zVBgNtI2K/3EhkzlJO7tBFad3YtI+tJY9cjUjBT6FguTmRHO8zLSle4LzHHH6wdhS5lv+
	PAcleifbW2aMSzGERDr8fyXuAOFUYRJPBULabr+tJ5cOaI5i5R2G+ATaN1WaTm0JLjfjjZEBQF0uv
	FbyJtXlXBsHGfdKimwTPmUQmiNetwhrZg1sSx0lXLSzDVK9FJiRAyP3R9Q1eOYi2OckV2tabUZkzW
	Pm5GxmQ4JpY3FgZSIGwkyVf0Fq+syfCUGSf1nrdFXaWKcugrzyc2HzuFfyB2uE9pdmUrQOYbDY4kz
	feuUD7kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFywp-0000000ASSk-0UcQ;
	Mon, 03 Nov 2025 18:06:31 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFywn-0000000ASSW-3MYy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 18:06:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D726D600AC;
	Mon,  3 Nov 2025 18:06:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDF47C4CEE7;
	Mon,  3 Nov 2025 18:06:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762193188;
	bh=AnbfUwPzkbHols+QiT2l5c4xTQZEscZ7pxRKBf3sdYM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=qsRz6HJRxpQGx9VQ8+UjPgABTqHGOwBwaVGe22cJ6Ie0R+SJmoWPXMvJ+ypcmAZzL
	 rWRXW0IMFLZ+lQZut8028LHNqCrMNVf3bBB/+9LkBCjPlK6Tqu33AcnclRvzwHZOHb
	 2DBxizgEOHFVrPNl9FgyxyxDg33F4b/Te9VmocyQHmjXU1rCr9TLN64SWohgZtG2lj
	 +0bUCjj14/4gJ30GUDWDRFjnVhYDFhDKdyeMeC0xQyS5ZBBLQU3lEmbSEbgNlTWdKJ
	 10dd568pgIFgTPug9DUhnf1NoCbXqfacF+0+UmPt/MSv23X8H9QBWVf4+wbDN70vUx
	 ZTF30IA6wUplg==
Message-ID: <f6ee43c3-7175-48a5-a483-f89650ce02bc@kernel.org>
Date: Mon, 3 Nov 2025 19:06:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] arm64: mm: Don't sleep in split_kernel_leaf_mapping()
 when in atomic context
To: Ryan Roberts <ryan.roberts@arm.com>, catalin.marinas@arm.com,
 will@kernel.org, yang@os.amperecomputing.com, ardb@kernel.org,
 dev.jain@arm.com, scott@os.amperecomputing.com, cl@gentwo.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Guenter Roeck <groeck@google.com>
References: <20251103125738.3073566-1-ryan.roberts@arm.com>
 <e5fee14a-4569-49c8-9f42-844839e51e85@kernel.org>
 <8df1d593-f176-422d-8b87-844986ac38a6@arm.com>
From: "David Hildenbrand (Red Hat)" <david@kernel.org>
Content-Language: en-US
In-Reply-To: <8df1d593-f176-422d-8b87-844986ac38a6@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 03.11.25 18:28, Ryan Roberts wrote:
> On 03/11/2025 15:38, David Hildenbrand (Red Hat) wrote:
>>
>>>    }
>>>
>>> +static inline bool force_pte_mapping(void)
>>> +{
>>> +    bool bbml2 = system_capabilities_finalized() ?
>>> +        system_supports_bbml2_noabort() : cpu_supports_bbml2_noabort();
>>
>> You are only moving this function. Still, there is some room for improvement I
>> want to point out :)
>>
>> bbml2 could be a const (or a helper function like bbml2_supported).
>>
>>> +
>>> +    return (!bbml2 && (rodata_full || arm64_kfence_can_set_direct_map() ||
>>> +               is_realm_world())) ||
>>> +        debug_pagealloc_enabled();
>>
>>
>> I suspect this could be made a bit easier to read.
>>
>>      if (debug_pagealloc_enabled())
>>          return true;
>>      if (bbml2)
>>          return false;
>>      return rodata_full || arm64_kfence_can_set_direct_map() || is_realm_world();
> 
> Yeah, I guess that's a bit nicer. I'd prefer to tidy it up in as separate commit
> though. (feel free ;-) )

Separate commit is fine (hoping you can do it once this lands :P ).

> 
>>
>>
>>> +}
>>> +
>>>    static DEFINE_MUTEX(pgtable_split_lock);
>>>
>>>    int split_kernel_leaf_mapping(unsigned long start, unsigned long end)
>>> @@ -723,6 +733,16 @@ int split_kernel_leaf_mapping(unsigned long start,
>>> unsigned long end)
>>>        if (!system_supports_bbml2_noabort())
>>>            return 0;
>>>
>>> +    /*
>>> +     * If the region is within a pte-mapped area, there is no need to try to
>>> +     * split. Additionally, CONFIG_DEBUG_PAGEALLOC and CONFIG_KFENCE may
>>> +     * change permissions from softirq context so for those cases (which are
>>> +     * always pte-mapped), we must not go any further because taking the
>>> +     * mutex below may sleep.
>>> +     */
>>> +    if (force_pte_mapping() || is_kfence_address((void *)start))
>>> +        return 0;
>>> +
>>
>> We're effectively performing two system_supports_bbml2_noabort() checks,
>> similarly in
>> arch_kfence_init_pool().
>>
>> I wonder if there is a clean way to avoid that.
> 
> I thought about this too. But system_supports_bbml2_noabort() is actually a
> magic alternatives patching thing; 

Makes sense, so likely just another nop in the final code.

> the code is updated so it's zero overhead. I
> decided this was the simplest and clearest way to do it. But I'm open to other
> ideas...

Given that we have two such call sequences, I was wondering if we could 
have a helper that better expresses+documents the desired semantics.

static bool pte_leaf_split_possible()
{
	/*
	 * !BBML2_NOABORT systems should never run into scenarios where
          * we would have to split. So exit early and let calling code
	 * detect it + raise a warning.
	 */
	if (!system_supports_bbml2_noabort())
		return false;
	return force_pte_mapping();
}

Something like that maybe.

-- 
Cheers

David

