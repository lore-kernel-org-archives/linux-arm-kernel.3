Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9C8ED5B87C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Dec 2025 05:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tRhxoTZ+3IIdYwTnJoWC2Y2iVLI35ww6bqSlIUl0XxQ=; b=NCAApA8K9Pys5p8mrykVje7cOJ
	mAiY9GWadjwrUiDx/bBiRSYzK1tM0h2YgQt58KHVR/I3a3Axvc/g2PtMscfYBQ4REuCJBlT8Aq5R1
	ikYEHF90hA+/tDBOIqhONRhkLTKqhcBaGrliWz9eEa6Jhmu5f4rHAp36le7PLYfIOvxM48shCUS/Z
	d3A7vHCEpQ51j5JOy6MIThqQjseu9Y5bGDepbBFS/BVsj9WIKyU4OQceKUzh2ENquHK3dj+gBM+9U
	zd/nAf3/J9aNJsQGFpM+juDCJhB2WDmNf57Q87YkW2/4Jshy9h/tT00OevDw/GfxDy34rilrsM9Ln
	1A7H0MUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVNvh-00000004jHb-2KbU;
	Tue, 16 Dec 2025 05:49:01 +0000
Received: from out30-132.freemail.mail.aliyun.com ([115.124.30.132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVNve-00000004jGj-3uyl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Dec 2025 05:49:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1765864136; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=tRhxoTZ+3IIdYwTnJoWC2Y2iVLI35ww6bqSlIUl0XxQ=;
	b=ley2j58OCPEN3x20n8oxg6pFGJnGlk8GrMo6CL7d8+SvNvePqBKLUq2zNhA69T4xehYYRq+rk92Sb5AO9y9kgdahimDadEQI3sKh+agUOHv59vqzALUkG+xmRYVzLfABQHgGGMmxtztC3YRqcbWinHXYjt1b+HgXMU/N+v/YZE8=
Received: from 30.74.144.116(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0Wuxvaan_1765864133 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 16 Dec 2025 13:48:53 +0800
Message-ID: <eb871ca2-47c8-4b10-a61d-321716f6c147@linux.alibaba.com>
Date: Tue, 16 Dec 2025 13:48:52 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] mm: rmap: support batched unmapping for file large
 folios
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: akpm@linux-foundation.org, david@kernel.org, catalin.marinas@arm.com,
 will@kernel.org, ryan.roberts@arm.com, Liam.Howlett@oracle.com,
 vbabka@suse.cz, rppt@kernel.org, surenb@google.com, mhocko@suse.com,
 riel@surriel.com, harry.yoo@oracle.com, jannh@google.com,
 willy@infradead.org, baohua@kernel.org, linux-mm@kvack.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <cover.1765439380.git.baolin.wang@linux.alibaba.com>
 <af330c9ea188bd0f28189b1e6e5803f6de9d2abe.1765439381.git.baolin.wang@linux.alibaba.com>
 <70d1dedc-b4fc-4eb6-baf6-9e54b6a62249@lucifer.local>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <70d1dedc-b4fc-4eb6-baf6-9e54b6a62249@lucifer.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_214859_126380_B0F4B040 
X-CRM114-Status: GOOD (  19.02  )
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



On 2025/12/15 20:38, Lorenzo Stoakes wrote:
> On Thu, Dec 11, 2025 at 04:16:56PM +0800, Baolin Wang wrote:
>> Similar to folio_referenced_one(), we can apply batched unmapping for file
>> large folios to optimize the performance of file folios reclamation.
>>
>> Performance testing:
>> Allocate 10G clean file-backed folios by mmap() in a memory cgroup, and try to
>> reclaim 8G file-backed folios via the memory.reclaim interface. I can observe
>> 75% performance improvement on my Arm64 32-core server.
> 
> Again, you must test on non-arm64 architectures and report the numbers for this
> also.

Yes, I've tested on the x86 machine, and will add the data in the commit 
message.

>> W/o patch:
>> real    0m1.018s
>> user    0m0.000s
>> sys     0m1.018s
>>
>> W/ patch:
>> real	0m0.249s
>> user	0m0.000s
>> sys	0m0.249s
>>
>> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
>> ---
>>   mm/rmap.c | 7 ++++---
>>   1 file changed, 4 insertions(+), 3 deletions(-)
>>
>> diff --git a/mm/rmap.c b/mm/rmap.c
>> index ec232165c47d..4c9d5777c8da 100644
>> --- a/mm/rmap.c
>> +++ b/mm/rmap.c
>> @@ -1855,9 +1855,10 @@ static inline unsigned int folio_unmap_pte_batch(struct folio *folio,
>>   	end_addr = pmd_addr_end(addr, vma->vm_end);
>>   	max_nr = (end_addr - addr) >> PAGE_SHIFT;
>>
>> -	/* We only support lazyfree batching for now ... */
>> -	if (!folio_test_anon(folio) || folio_test_swapbacked(folio))
>> +	/* We only support lazyfree or file folios batching for now ... */
>> +	if (folio_test_anon(folio) && folio_test_swapbacked(folio))
> 
> Why is it now ok to support file-backed batched unmapping when it wasn't in
> Barry's series (see [0])? You don't seem to be justifying this?

Barry's series[0] is merely aimed at optimizing lazyfree anonymous large 
folios and does not continue to optimize anonymous large folios or 
file-backed large folios at that point.

Subsequently, Barry sent out a new patch (see [1]) to optimize anonymous 
large folios. As for file-backed large folios, the batched unmapping 
support is relatively simple, since we only need to clear the PTE 
entries for file-backed large folios.

> [0]:https://lore.kernel.org/all/20250214093015.51024-4-21cnbao@gmail.com/T/#u

[1] https://lore.kernel.org/all/20250513084620.58231-1-21cnbao@gmail.com/

>>   		return 1;
>> +
>>   	if (pte_unused(pte))
>>   		return 1;
>>
>> @@ -2223,7 +2224,7 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
>>   			 *
>>   			 * See Documentation/mm/mmu_notifier.rst
>>   			 */
>> -			dec_mm_counter(mm, mm_counter_file(folio));
>> +			add_mm_counter(mm, mm_counter_file(folio), -nr_pages);
> 
> Was this just a bug before?

Nope. Before this patch, we never supported batched unmapping for 
file-backed large folios, so the 'nr_pages' was always 1. After this 
patch, we should use the number of pages in this file-backed large folio.

