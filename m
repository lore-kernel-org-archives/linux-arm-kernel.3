Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99E63D65C64
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Nov 2024 09:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mER75Q+4wG3UmVEMwASmKyWbuLRRLJol4qemiObTthM=; b=VWR/pxKcZ0ewOQpjIWGQQblcKw
	4gy6BdlGl6WYAQH3Tv7Q9gCl+IYiYDiPwM/lBN3gDR+ba3fhw6keUIPnk17HXhd63lldK/xsIugF2
	TBTc2nkdUXH7wvt70tYZ2BaYfC2xPN3fgM1h8AmXKiTwfMKGvqcLO+u6xVN8Q/R4zbcfxvFICqjNB
	Ga8tk2rZlyQTrf9poD67Da8PNAdl5K3Wv5PfMVrBvOFfi+QLgupYJJJv87I1SIwvgm0kI9JLBRHds
	bfMHAV0Wb6zvwq3JCFMDaDNCAmiUX4GOKCuMzk+NNoh2k9/m8Wq4yWUl82fu/PhJ0T2g6wI1d5wed
	19A7NGFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBWJ0-00000009OJx-0vA4;
	Thu, 14 Nov 2024 09:38:26 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBWH5-00000009Noz-0Eij
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Nov 2024 09:36:29 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 57D061474;
	Thu, 14 Nov 2024 01:36:51 -0800 (PST)
Received: from [10.57.89.178] (unknown [10.57.89.178])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C74D23F59E;
	Thu, 14 Nov 2024 01:36:18 -0800 (PST)
Message-ID: <0aabbc9e-8808-4aaa-a722-49ed3d45d15e@arm.com>
Date: Thu, 14 Nov 2024 09:36:17 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v1 04/57] mm/page_alloc: Make page_frag_cache
 boot-time page size compatible
Content-Language: en-GB
To: Vlastimil Babka <vbabka@suse.cz>,
 Andrew Morton <akpm@linux-foundation.org>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Ard Biesheuvel <ardb@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 David Hildenbrand <david@redhat.com>, Greg Marsden
 <greg.marsden@oracle.com>, Ivan Ivanov <ivan.ivanov@suse.com>,
 Kalesh Singh <kaleshsingh@google.com>, Marc Zyngier <maz@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <mbrugger@suse.com>,
 Miroslav Benes <mbenes@suse.cz>, Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org
References: <20241014105514.3206191-1-ryan.roberts@arm.com>
 <20241014105912.3207374-1-ryan.roberts@arm.com>
 <20241014105912.3207374-4-ryan.roberts@arm.com>
 <1d9f9188-42b1-4f83-87e7-e02a22b67caa@suse.cz>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <1d9f9188-42b1-4f83-87e7-e02a22b67caa@suse.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_013627_296069_D2CFBA9C 
X-CRM114-Status: GOOD (  25.18  )
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

On 14/11/2024 08:23, Vlastimil Babka wrote:
> On 10/14/24 12:58, Ryan Roberts wrote:
>> "struct page_frag_cache" has some optimizations that depend on page
>> size. Let's refactor it a bit so that those optimizations can be
>> determined at run-time for the case where page size is a boot-time
>> parameter. For compile-time page size, the compiler should dead code
>> strip and the result is very similar to before.
>>
>> One wrinkle is that we don't know if we need the size member until
>> runtime. So remove the ifdeffery and always define offset as u32 (needed
>> if PAGE_SIZE is >= 64K) and size as u16 (only used when PAGE_SIZE <=
>> 32K). We move the members around a bit so that the overall size of the
>> struct remains the same; 24 bytes for 64-bit and 16 bytes on 32 bit.
>>
>> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
> 
> Looks ok, but ideally the PAGE_FRAG_CACHE_MAX_ORDER #define should also be
> replaced by some variable that's populated just once. It can be static local
> to page_alloc.c as nothing else seems to use it.

I can certainly do that, but wouldn't that be penalizing a compile-time page
size configuration? My current change means that PAGE_FRAG_CACHE_MAX_ORDER still
resolves to a compile-time constant in that situation and the compiler can
eliminate conditional branches it knows will never be taken. Or perhaps you're
suggesting I conditionally make it a variable if PAGE_SIZE_MIN != PAGE_SIZE_MAX?

Thanks,
Ryan

> 
>>
>> page_alloc
>> ---
>>
>> ***NOTE***
>> Any confused maintainers may want to read the cover note here for context:
>> https://lore.kernel.org/all/20241014105514.3206191-1-ryan.roberts@arm.com/
>>
>>  include/linux/mm_types.h | 13 ++++++-------
>>  mm/page_alloc.c          | 31 ++++++++++++++++++-------------
>>  2 files changed, 24 insertions(+), 20 deletions(-)
>>
>> diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
>> index 4854249792545..0844ed7cfaa53 100644
>> --- a/include/linux/mm_types.h
>> +++ b/include/linux/mm_types.h
>> @@ -544,16 +544,15 @@ static inline void *folio_get_private(struct folio *folio)
>>  
>>  struct page_frag_cache {
>>  	void * va;
>> -#if (PAGE_SIZE < PAGE_FRAG_CACHE_MAX_SIZE)
>> -	__u16 offset;
>> -	__u16 size;
>> -#else
>> -	__u32 offset;
>> -#endif
>>  	/* we maintain a pagecount bias, so that we dont dirty cache line
>>  	 * containing page->_refcount every time we allocate a fragment.
>>  	 */
>> -	unsigned int		pagecnt_bias;
>> +	unsigned int pagecnt_bias;
>> +	__u32 offset;
>> +	/* size only used when PAGE_SIZE < PAGE_FRAG_CACHE_MAX_SIZE, in which
>> +	 * case PAGE_FRAG_CACHE_MAX_SIZE is 32K and 16 bits is sufficient.
>> +	 */
>> +	__u16 size;
>>  	bool pfmemalloc;
>>  };
>>  
>> diff --git a/mm/page_alloc.c b/mm/page_alloc.c
>> index 91ace8ca97e21..8678103b1b396 100644
>> --- a/mm/page_alloc.c
>> +++ b/mm/page_alloc.c
>> @@ -4822,13 +4822,18 @@ static struct page *__page_frag_cache_refill(struct page_frag_cache *nc,
>>  	struct page *page = NULL;
>>  	gfp_t gfp = gfp_mask;
>>  
>> -#if (PAGE_SIZE < PAGE_FRAG_CACHE_MAX_SIZE)
>> -	gfp_mask = (gfp_mask & ~__GFP_DIRECT_RECLAIM) |  __GFP_COMP |
>> -		   __GFP_NOWARN | __GFP_NORETRY | __GFP_NOMEMALLOC;
>> -	page = alloc_pages_node(NUMA_NO_NODE, gfp_mask,
>> -				PAGE_FRAG_CACHE_MAX_ORDER);
>> -	nc->size = page ? PAGE_FRAG_CACHE_MAX_SIZE : PAGE_SIZE;
>> -#endif
>> +	if (PAGE_SIZE < PAGE_FRAG_CACHE_MAX_SIZE) {
>> +		gfp_mask = (gfp_mask & ~__GFP_DIRECT_RECLAIM) |  __GFP_COMP |
>> +			   __GFP_NOWARN | __GFP_NORETRY | __GFP_NOMEMALLOC;
>> +		page = alloc_pages_node(NUMA_NO_NODE, gfp_mask,
>> +					PAGE_FRAG_CACHE_MAX_ORDER);
>> +		/*
>> +		 * Cast to silence warning due to 16-bit nc->size. Not real
>> +		 * because PAGE_SIZE only less than PAGE_FRAG_CACHE_MAX_SIZE
>> +		 * when PAGE_FRAG_CACHE_MAX_SIZE is 32K.
>> +		 */
>> +		nc->size = (__u16)(page ? PAGE_FRAG_CACHE_MAX_SIZE : PAGE_SIZE);
>> +	}
>>  	if (unlikely(!page))
>>  		page = alloc_pages_node(NUMA_NO_NODE, gfp, 0);
>>  
>> @@ -4870,10 +4875,10 @@ void *__page_frag_alloc_align(struct page_frag_cache *nc,
>>  		if (!page)
>>  			return NULL;
>>  
>> -#if (PAGE_SIZE < PAGE_FRAG_CACHE_MAX_SIZE)
>>  		/* if size can vary use size else just use PAGE_SIZE */
>> -		size = nc->size;
>> -#endif
>> +		if (PAGE_SIZE < PAGE_FRAG_CACHE_MAX_SIZE)
>> +			size = nc->size;
>> +
>>  		/* Even if we own the page, we do not use atomic_set().
>>  		 * This would break get_page_unless_zero() users.
>>  		 */
>> @@ -4897,10 +4902,10 @@ void *__page_frag_alloc_align(struct page_frag_cache *nc,
>>  			goto refill;
>>  		}
>>  
>> -#if (PAGE_SIZE < PAGE_FRAG_CACHE_MAX_SIZE)
>>  		/* if size can vary use size else just use PAGE_SIZE */
>> -		size = nc->size;
>> -#endif
>> +		if (PAGE_SIZE < PAGE_FRAG_CACHE_MAX_SIZE)
>> +			size = nc->size;
>> +
>>  		/* OK, page count is 0, we can safely set it */
>>  		set_page_count(page, PAGE_FRAG_CACHE_MAX_SIZE + 1);
>>  
> 


