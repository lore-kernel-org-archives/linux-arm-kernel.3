Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DCD5D3B99A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Nov 2024 14:54:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/24GaUEBcY1lL9TWCnsGnALktEbuvfxWyf3MCzYWY2I=; b=OgqLpkXsjOREu9p2r0SMTxZW4Z
	ek5j5zKEX/sjhF6HMlV9vWcs6FE+A3bRiThfxBnRfIf6of277N0/25zsy8WKc4g1w3rS1N/+x+j3A
	R2/6l0YnKS62I5gKysTleukmJJaJBKR9VpmZi3wU1B+W34A4vuvEBdGkvzabuQzgJDelsnkKD8fL8
	28/hLKI04vp1zFT6K697zMFApAR8qoruoIpfVGY7q73nZ1gmvZOV/cxxb6JLG8yGUC/QM434yBmZ4
	ejn8s10vcpDKtdjJxYQiKnoPLtSUblr6HNz2XYbR5YjgCtesq5bm7v6jKpalNTse9SP6AiYceKh8r
	DGpQN2gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFwxD-0000000AvYV-2Rgn;
	Tue, 26 Nov 2024 14:54:15 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFwwE-0000000AvOb-37yA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Nov 2024 14:53:16 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1F046150C;
	Tue, 26 Nov 2024 06:53:44 -0800 (PST)
Received: from [10.1.29.199] (XHFQ2J9959.cambridge.arm.com [10.1.29.199])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2CB143F5A1;
	Tue, 26 Nov 2024 06:53:13 -0800 (PST)
Message-ID: <69746c3a-72af-4c28-8f04-bcfae7a78107@arm.com>
Date: Tue, 26 Nov 2024 14:53:11 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] mm/slab: Avoid build bug for calls to kmalloc with a
 large constant
Content-Language: en-GB
To: Vlastimil Babka <vbabka@suse.cz>, Dave Kleikamp
 <dave.kleikamp@oracle.com>, Andrew Morton <akpm@linux-foundation.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org
References: <20241014105514.3206191-1-ryan.roberts@arm.com>
 <20241014105912.3207374-1-ryan.roberts@arm.com>
 <20241014105912.3207374-6-ryan.roberts@arm.com>
 <44312f4a-8b9c-49ce-9277-5873a94ca1bb@oracle.com>
 <cb9cabed-0038-42b3-b9fc-c9ba62b12781@suse.cz>
 <7fb6c5a2-b9ae-4a29-a871-2f0bdc636e41@arm.com>
 <9675f4f0-6290-43aa-bf17-6b9c2b461485@suse.cz>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <9675f4f0-6290-43aa-bf17-6b9c2b461485@suse.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_065314_872544_6D47570B 
X-CRM114-Status: GOOD (  31.20  )
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

On 26/11/2024 12:36, Vlastimil Babka wrote:
> On 11/26/24 13:18, Ryan Roberts wrote:
>> On 14/11/2024 10:09, Vlastimil Babka wrote:
>>> On 11/1/24 21:16, Dave Kleikamp wrote:
>>>> When boot-time page size is enabled, the test against KMALLOC_MAX_CACHE_SIZE
>>>> is no longer optimized out with a constant size, so a build bug may
>>>> occur on a path that won't be reached.
>>>
>>> That's rather unfortunate, the __builtin_constant_p(size) part of
>>> kmalloc_noprof() really expects things to resolve at compile time and it
>>> would be better to keep it that way.
>>>
>>> I think it would be better if we based KMALLOC_MAX_CACHE_SIZE itself on
>>> PAGE_SHIFT_MAX and kept it constant, instead of introducing
>>> KMALLOC_SHIFT_HIGH_MAX only for some sanity checks.
>>>
>>> So if the kernel was built to support 4k to 64k, but booted as 4k, it would
>>> still create and use kmalloc caches up to 128k. SLUB should handle that fine
>>> (if not, please report it :)
>>
>> So when PAGE_SIZE_MAX=64K and PAGE_SIZE=4K, kmalloc will support up to 128K
>> whereas before it only supported up to 8K. I was trying to avoid that since I
>> assumed that would be costly in terms of extra memory allocated for those higher
>> order buckets that will never be used. But I have no idea how SLUB works in
>> practice. Perhaps memory for the cache is only lazily allocated so we won't see
>> an issue in practice?
> 
> Yes the e.g. 128k slabs themselves will be lazily allocated. There will be
> some overhead with the management structures (struct kmem_cache etc) but
> much smaller.
> To be completely honest, some extra overhead might come to be when the slabs
> are allocated ans later the user frees those allocations. kmalloc_large()
> wwould return them immediately, while a regular kmem_cache will keep one or
> more per cpu for reuse. But if that becomes a visible problem we can tune
> those caches to discard slabs more aggressively.

Sorry to keep pushing on this, now that I've actually looked at the code, I feel
I have a slightly better understanding:

void *kmalloc_noprof(size_t size, gfp_t flags)
{
	if (__builtin_constant_p(size) && size) {
		
		if (size > KMALLOC_MAX_CACHE_SIZE)
			return __kmalloc_large_noprof(size, flags); <<< (1)

		index = kmalloc_index(size);
		return __kmalloc_cache_noprof(...);   <<< (2)
	}
	return __kmalloc_noprof(size, flags);   <<< (3)
}

So if size and KMALLOC_MAX_CACHE_SIZE are constant, we end up with this
resolving either to a call to (1) or (2), decided at compile time. If
KMALLOC_MAX_CACHE_SIZE is not constant, (1), (2) and the runtime conditional
need to be kept in the function.

But intuatively, I would have guessed that given the choice between the overhead
of keeping that runtime conditional vs keeping per-cpu slab caches for extra
sizes between 16K and 128K, then the runtime conditional would be preferable. I
would guess that quite a bit of memory could get tied up in those caches?

Why is your preference the opposite? What am I not understanding?


> 
>> I'm happy to make this change if you're certain it's the right approach; please
>> confirm.
> 
> Yes it's much better option than breaking the build-time-constant part of
> kmalloc_noprof().
> 
>>>
>>> Maybe we could also stop adding + 1 to PAGE_SHIFT_MAX if it's >=64k, so the
>>> cache size is max 64k and not 128k but that should be probably evaluated
>>> separately from this series.
>>
>> I'm inferring from this that perhaps there is a memory cost with having the
>> higher orders defined but unused.
> 
> Yeah as per above, should not be too large and we could tune it down if
> necessary.
> 
>> Thanks,
>> Ryan
>>
>>>
>>> Vlastimil
>>>
>>>> Found compiling drivers/net/ethernet/qlogic/qed/qed_sriov.c
>>>>
>>>> Signed-off-by: Dave Kleikamp <dave.kleikamp@oracle.com>
>>>> ---
>>>>
>>>> Ryan,
>>>>
>>>> Please consider incorporating this fix or something similar into your
>>>> mm patch in the boot-time pages size patches.
>>>>
>>>>   include/linux/slab.h | 3 ++-
>>>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/include/linux/slab.h b/include/linux/slab.h
>>>> index 9848296ca6ba..a4c7507ab8ec 100644
>>>> --- a/include/linux/slab.h
>>>> +++ b/include/linux/slab.h
>>>> @@ -685,7 +685,8 @@ static __always_inline unsigned int __kmalloc_index(size_t size,
>>>>   	if (size <= 1024 * 1024) return 20;
>>>>   	if (size <=  2 * 1024 * 1024) return 21;
>>>>   
>>>> -	if (!IS_ENABLED(CONFIG_PROFILE_ALL_BRANCHES) && size_is_constant)
>>>> +	if (!IS_ENABLED(CONFIG_ARM64_BOOT_TIME_PAGE_SIZE) &&
>>>> +	    !IS_ENABLED(CONFIG_PROFILE_ALL_BRANCHES) && size_is_constant)
>>>>   		BUILD_BUG_ON_MSG(1, "unexpected size in kmalloc_index()");
>>>>   	else
>>>>   		BUG();
>>>
>>
> 


