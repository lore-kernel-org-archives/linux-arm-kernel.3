Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CCF7D59D90
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Nov 2024 10:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vnO20sDXJKnMEKP0y4y9CZ1eLvXQs370Rx7MEisA1ys=; b=uupy4FReCkmsluumT5CaXtTn6y
	mb2VM6qwLTzbBv+hVkdMSyzbZ6A3quS3nnzx4lAuNqbUD8KD4hnA8oJade0i61emT5C72+/+gg3CQ
	j84pqykYcTN/F2lmujsAxrmVudyxs66KtouHlN5kdmGcCyACPicFbMUQSjth2YZak8JTHdfxSQl4q
	2yqWWGAMGi50izVgNXK3CQ7eBWaBvLvz6U8V1y8nfneyFIpIcCqHaTrlQPHskX0CEUWPUQUgSeOPq
	/dgDaKOZ7mEBOy8wc81z+WmwuoG9COxz5RGl0QlPI0fvDAg3p8sV9iCgN3fXvJKD60iu5UQCMkouF
	QyUJ7fmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFsdY-0000000AHMS-3uTD;
	Tue, 26 Nov 2024 10:17:40 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFsbb-0000000AGxR-2nwT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Nov 2024 10:15:41 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6C2B81682;
	Tue, 26 Nov 2024 02:16:08 -0800 (PST)
Received: from [10.57.89.250] (unknown [10.57.89.250])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 22E3E3F5A1;
	Tue, 26 Nov 2024 02:15:36 -0800 (PST)
Message-ID: <9a61c179-7c06-412f-a09f-0593151eb107@arm.com>
Date: Tue, 26 Nov 2024 10:15:34 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v1 15/57] stackdepot: Remove PAGE_SIZE compile-time
 constant assumption
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
 <20241014105912.3207374-15-ryan.roberts@arm.com>
 <2510b50b-4178-4c14-b2cc-db5a77a1c8d7@suse.cz>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <2510b50b-4178-4c14-b2cc-db5a77a1c8d7@suse.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_021539_795683_5D8930A1 
X-CRM114-Status: GOOD (  23.11  )
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

On 14/11/2024 11:15, Vlastimil Babka wrote:
> On 10/14/24 12:58, Ryan Roberts wrote:
>> To prepare for supporting boot-time page size selection, refactor code
>> to remove assumptions about PAGE_SIZE being compile-time constant. Code
>> intended to be equivalent when compile-time page size is active.
>>
>> "union handle_parts" previously calculated the number of bits required
>> for its pool index and offset members based on PAGE_SHIFT. This is
>> problematic for boot-time page size builds because the actual page size
>> isn't known until boot-time.
>>
>> We could use PAGE_SHIFT_MAX in calculating the worst case offset bits,
>> but bits would be wasted that could be used for pool index when
>> PAGE_SIZE is set smaller than MAX, the end result being that stack depot
>> can address less memory than it should.
>>
>> To avoid needing to dynamically define the offset and index bit widths,
>> let's instead fix the pool size and derive the order at runtime based on
>> the PAGE_SIZE. This means that the fields' widths can remain static,
>> with the down side being slightly increased risk of failing to allocate
>> the large folio.
>>
>> This only affects boot-time page size builds. compile-time page size
>> builds will still always allocate order-2 folios.
>>
>> Additionally, wrap global variables that are initialized with PAGE_SIZE
>> derived values using DEFINE_GLOBAL_PAGE_SIZE_VAR() so their
>> initialization can be deferred for boot-time page size builds.
> 
> This is done for pool_offset but given it's initialized by DEPOT_POOL_SIZE,
> it doesn't look derived from PAGE_SIZE?

Good spot; I think I initially did this when DEPOT_POOL_SIZE was still based on
PAGE_SIZE. But then I've subsequently re-defined DEPOT_POOL_SIZE to be
independent of PAGE_SIZE. I'll remove this part of the change.
> 
>>
>> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
> 
> Other than that,
> Acked-by: Vlastimil Babka <vbabka@suse.cz>

Thanks!

> 
> 
>> ---
>>
>> ***NOTE***
>> Any confused maintainers may want to read the cover note here for context:
>> https://lore.kernel.org/all/20241014105514.3206191-1-ryan.roberts@arm.com/
>>
>>  include/linux/stackdepot.h | 6 +++---
>>  lib/stackdepot.c           | 6 +++---
>>  2 files changed, 6 insertions(+), 6 deletions(-)
>>
>> diff --git a/include/linux/stackdepot.h b/include/linux/stackdepot.h
>> index e9ec32fb97d4a..ac877a4e90406 100644
>> --- a/include/linux/stackdepot.h
>> +++ b/include/linux/stackdepot.h
>> @@ -32,10 +32,10 @@ typedef u32 depot_stack_handle_t;
>>  
>>  #define DEPOT_HANDLE_BITS (sizeof(depot_stack_handle_t) * 8)
>>  
>> -#define DEPOT_POOL_ORDER 2 /* Pool size order, 4 pages */
>> -#define DEPOT_POOL_SIZE (1LL << (PAGE_SHIFT + DEPOT_POOL_ORDER))
>> +#define DEPOT_POOL_ORDER 2 /* Pool size order, 4 pages of PAGE_SIZE_MAX */
>> +#define DEPOT_POOL_SIZE (1LL << (PAGE_SHIFT_MAX + DEPOT_POOL_ORDER))
>>  #define DEPOT_STACK_ALIGN 4
>> -#define DEPOT_OFFSET_BITS (DEPOT_POOL_ORDER + PAGE_SHIFT - DEPOT_STACK_ALIGN)
>> +#define DEPOT_OFFSET_BITS (DEPOT_POOL_ORDER + PAGE_SHIFT_MAX - DEPOT_STACK_ALIGN)
>>  #define DEPOT_POOL_INDEX_BITS (DEPOT_HANDLE_BITS - DEPOT_OFFSET_BITS - \
>>  			       STACK_DEPOT_EXTRA_BITS)
>>  
>> diff --git a/lib/stackdepot.c b/lib/stackdepot.c
>> index 5ed34cc963fc3..974351f0e9e3c 100644
>> --- a/lib/stackdepot.c
>> +++ b/lib/stackdepot.c
>> @@ -68,7 +68,7 @@ static void *new_pool;
>>  /* Number of pools in stack_pools. */
>>  static int pools_num;
>>  /* Offset to the unused space in the currently used pool. */
>> -static size_t pool_offset = DEPOT_POOL_SIZE;
>> +static DEFINE_GLOBAL_PAGE_SIZE_VAR(size_t, pool_offset, DEPOT_POOL_SIZE);
>>  /* Freelist of stack records within stack_pools. */
>>  static LIST_HEAD(free_stacks);
>>  /* The lock must be held when performing pool or freelist modifications. */
>> @@ -625,7 +625,7 @@ depot_stack_handle_t stack_depot_save_flags(unsigned long *entries,
>>  	 */
>>  	if (unlikely(can_alloc && !READ_ONCE(new_pool))) {
>>  		page = alloc_pages(gfp_nested_mask(alloc_flags),
>> -				   DEPOT_POOL_ORDER);
>> +				   get_order(DEPOT_POOL_SIZE));
>>  		if (page)
>>  			prealloc = page_address(page);
>>  	}
>> @@ -663,7 +663,7 @@ depot_stack_handle_t stack_depot_save_flags(unsigned long *entries,
>>  exit:
>>  	if (prealloc) {
>>  		/* Stack depot didn't use this memory, free it. */
>> -		free_pages((unsigned long)prealloc, DEPOT_POOL_ORDER);
>> +		free_pages((unsigned long)prealloc, get_order(DEPOT_POOL_SIZE));
>>  	}
>>  	if (found)
>>  		handle = found->handle.handle;
> 


