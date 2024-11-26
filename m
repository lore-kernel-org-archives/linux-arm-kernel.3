Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A4A9D3B994
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Nov 2024 14:27:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M+h5DxED7xTpGVtMCw7uarfhqfox7mW4cS7od/IH8dA=; b=hd0FYgWrSvOAT2A4QQsMTovTN9
	wsqHKPlDObMc45kwIrgS9myj2KVQkqMjueUdIN/o7KLw23wG3bQ/SUr0JERSdoQRR3KuBvOHJ+nMl
	3idPSPy9KOuiq9DOPagoTmopB/yc4/Eun3fnUCQ25eaqdvIwNeoc/9+9XfO9uYWnCco5KaVB3Xy56
	uniE0Z+E2NufvuHsZk2+Fg0MdSkGE+000AtkaOhn5hP78kQ9K+vu3hdvxrVoaWX1lvStnZelVVg28
	YfawpJ8kQBD5XBJOpwSKm03ImhyzbXoxksxaoShybg0TF87T02uswxO+NIcq1vwgNFUb+YtPfjr79
	bH3UHEag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFwXO-0000000ArbD-2zPW;
	Tue, 26 Nov 2024 14:27:34 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFwWR-0000000ArVI-0hYZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Nov 2024 14:26:36 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9A8891A00;
	Tue, 26 Nov 2024 06:27:03 -0800 (PST)
Received: from [10.1.29.199] (XHFQ2J9959.cambridge.arm.com [10.1.29.199])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A8A543F5A1;
	Tue, 26 Nov 2024 06:26:32 -0800 (PST)
Message-ID: <eec0427f-5519-400e-ae8e-ba743e1a3f33@arm.com>
Date: Tue, 26 Nov 2024 14:26:31 +0000
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
X-CRM114-CacheID: sfid-20241126_062635_293554_22EE6F34 
X-CRM114-Status: GOOD (  25.64  )
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
> 
>> I'm happy to make this change if you're certain it's the right approach; please
>> confirm.
> 
> Yes it's much better option than breaking the build-time-constant part of
> kmalloc_noprof().

OK, I'll take this approach as you suggest.

Thanks,
Ryan

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


