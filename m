Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBF59CAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Sep 2025 01:49:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KiWATjJlRyNXagDcw5KRHJfeXKRLsAKy/bPmDguzbG0=; b=1XF8pLHUFUymKmecJCj5L+Zl6Y
	ADLlNdK56Y0ArYN/0U+0fnMi9rBzA2bVLYUwCsB3xt/sRzFNiNE749+geaUiihqUOyXOp/IvlhT1f
	GCaev+pacrt3yH68+QfCLJ1GeexWWXrnavoEGhKnC4Ut9+e03Udf2b1Unk/aRq5LLiqwrYX/d7+Zd
	eo4FRWo8ol1SBCm2TZWetLGcaxu9+rySzT8xHCwcFv1mYbjHPPQanKKySAVSzn0C1WxPUTVQMKSLH
	07WKrWlL6bKT4wPSf0fpEpGIOmZcIbweYz5djQJ3mgr9vWJxHkniixNrhzmbnXazlhF1wyVg6VTFn
	lD2GHGNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0s9e-0000000C3MJ-1pvN;
	Tue, 23 Sep 2025 01:49:18 +0000
Received: from out-186.mta1.migadu.com ([2001:41d0:203:375::ba])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0s9b-0000000C3LX-06V6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Sep 2025 01:49:16 +0000
Message-ID: <9471bd83-911f-433d-8ce2-f83f080ed264@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1758592150;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KiWATjJlRyNXagDcw5KRHJfeXKRLsAKy/bPmDguzbG0=;
	b=NsZlq29cN7YJE4XCbL77ung8YpUPS/Ew9mPVomMh00fJjOeP0PekGP1EtxZgGpMCHL7cOg
	hn8YGsfqo2M5EI3luUBnZUXQOc4F7+KZLHXZfeHrkKaRVyvNSVVMtRyO46aE7/0e6fCf2M
	ugvJETzfOwEkWEw7g7wKHzc6mVClt/E=
Date: Tue, 23 Sep 2025 09:48:45 +0800
MIME-Version: 1.0
Subject: Re: [PATCH 1/1] mm/thp: fix MTE tag mismatch when replacing
 zero-filled subpages
Content-Language: en-US
To: Catalin Marinas <catalin.marinas@arm.com>,
 David Hildenbrand <david@redhat.com>
Cc: akpm@linux-foundation.org, lorenzo.stoakes@oracle.com,
 usamaarif642@gmail.com, yuzhao@google.com, ziy@nvidia.com,
 baolin.wang@linux.alibaba.com, baohua@kernel.org, voidice@gmail.com,
 Liam.Howlett@oracle.com, cerasuolodomenico@gmail.com, hannes@cmpxchg.org,
 kaleshsingh@google.com, npache@redhat.com, riel@surriel.com,
 roman.gushchin@linux.dev, rppt@kernel.org, ryan.roberts@arm.com,
 dev.jain@arm.com, ryncsn@gmail.com, shakeel.butt@linux.dev,
 surenb@google.com, hughd@google.com, willy@infradead.org,
 matthew.brost@intel.com, joshua.hahnjy@gmail.com, rakie.kim@sk.com,
 byungchul@sk.com, gourry@gourry.net, ying.huang@linux.alibaba.com,
 apopple@nvidia.com, qun-wei.lin@mediatek.com, Andrew.Yang@mediatek.com,
 casper.li@mediatek.com, chinwen.chang@mediatek.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-mm@kvack.org, ioworker0@gmail.com,
 stable@vger.kernel.org
References: <20250922021458.68123-1-lance.yang@linux.dev>
 <aNGGUXLCn_bWlne5@arm.com> <a3412715-6d9d-4809-9588-ba08da450d16@redhat.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Lance Yang <lance.yang@linux.dev>
In-Reply-To: <a3412715-6d9d-4809-9588-ba08da450d16@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_184915_419293_A8137ED2 
X-CRM114-Status: GOOD (  23.73  )
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



On 2025/9/23 01:59, David Hildenbrand wrote:
> On 22.09.25 19:24, Catalin Marinas wrote:
>> On Mon, Sep 22, 2025 at 10:14:58AM +0800, Lance Yang wrote:
>>> From: Lance Yang <lance.yang@linux.dev>
>>>
>>> When both THP and MTE are enabled, splitting a THP and replacing its
>>> zero-filled subpages with the shared zeropage can cause MTE tag mismatch
>>> faults in userspace.
>>>
>>> Remapping zero-filled subpages to the shared zeropage is unsafe, as the
>>> zeropage has a fixed tag of zero, which may not match the tag 
>>> expected by
>>> the userspace pointer.
>>>
>>> KSM already avoids this problem by using memcmp_pages(), which on arm64
>>> intentionally reports MTE-tagged pages as non-identical to prevent 
>>> unsafe
>>> merging.
>>>
>>> As suggested by David[1], this patch adopts the same pattern, 
>>> replacing the
>>> memchr_inv() byte-level check with a call to pages_identical(). This
>>> leverages existing architecture-specific logic to determine if a page is
>>> truly identical to the shared zeropage.
>>>
>>> Having both the THP shrinker and KSM rely on pages_identical() makes the
>>> design more future-proof, IMO. Instead of handling quirks in generic 
>>> code,
>>> we just let the architecture decide what makes two pages identical.
>>>
>>> [1] https://lore.kernel.org/all/ 
>>> ca2106a3-4bb2-4457-81af-301fd99fbef4@redhat.com
>>>
>>> Cc: <stable@vger.kernel.org>
>>> Reported-by: Qun-wei Lin <Qun-wei.Lin@mediatek.com>
>>> Closes: https://lore.kernel.org/all/ 
>>> a7944523fcc3634607691c35311a5d59d1a3f8d4.camel@mediatek.com
>>> Fixes: b1f202060afe ("mm: remap unused subpages to shared zeropage 
>>> when splitting isolated thp")
>>> Suggested-by: David Hildenbrand <david@redhat.com>
>>> Signed-off-by: Lance Yang <lance.yang@linux.dev>
>>
>> Functionally, the patch looks fine, both with and without MTE.
>>
>> Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

Thanks for taking time to review!

>>
>>> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
>>> index 32e0ec2dde36..28d4b02a1aa5 100644
>>> --- a/mm/huge_memory.c
>>> +++ b/mm/huge_memory.c
>>> @@ -4104,29 +4104,20 @@ static unsigned long 
>>> deferred_split_count(struct shrinker *shrink,
>>>   static bool thp_underused(struct folio *folio)
>>>   {
>>>       int num_zero_pages = 0, num_filled_pages = 0;
>>> -    void *kaddr;
>>>       int i;
>>>       for (i = 0; i < folio_nr_pages(folio); i++) {
>>> -        kaddr = kmap_local_folio(folio, i * PAGE_SIZE);
>>> -        if (!memchr_inv(kaddr, 0, PAGE_SIZE)) {
>>> -            num_zero_pages++;
>>> -            if (num_zero_pages > khugepaged_max_ptes_none) {
>>> -                kunmap_local(kaddr);
>>> +        if (pages_identical(folio_page(folio, i), ZERO_PAGE(0))) {
>>> +            if (++num_zero_pages > khugepaged_max_ptes_none)
>>>                   return true;
>>
>> I wonder what the overhead of doing a memcmp() vs memchr_inv() is. The
>> former will need to read from two places. If it's noticeable, it would
>> affect architectures that don't have an MTE equivalent.
>>
>> Alternatively we could introduce something like folio_has_metadata()
>> which on arm64 simply checks PG_mte_tagged.
> 
> We discussed something similar in the other thread (I suggested 
> page_is_mergable()). I'd prefer to use pages_identical() for now, so we 
> have the same logic here and in ksm code.
> 
> (this patch here almost looks like a cleanup :) )

Yeah, let's keep it as-is for now.

Using the same pages_identical() pattern as KSM makes the logic
consistent.

And it's simple enough to be easily backported to stable trees ;)

> 
> If this becomes a problem, what we could do is in pages_identical() 
> would be simply doing the memchr_inv() in case is_zero_pfn(). KSM might 
> benefit from that as well when merging with the shared zeropage through 
> try_to_merge_with_zero_page().

Right, there is room for that optimization. I will look into it as a
follow-up patch after this one is settled and backported, especially if
the performance overhead turns out to be a real concern :)

Cheers,
Lance

