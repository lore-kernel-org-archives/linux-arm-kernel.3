Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6124EE78D45
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Feb 2026 08:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TGbTfLLZD/gDNQDsOqhyyqWwiZVtJ78GG3mOzthMJgA=; b=xWIENertlxqlyfBKFvskkbw8ns
	zHDut2TC/Ppik7//iO+az7BxakEJB1tLNMQNwnWJxK+5+KMAQdP3M6SLS/PT2CIm16WOpI4fQWDt2
	N7F8YpSTLXgEL6iIp0WF5LQ51FXQqb2Bi/lEUoLn/hfDnHMXVZSgyDpm3LY4z8jzVoYtyMTwNZl+x
	BA5I2FFUwVBZg8zfjG72TGFpSagHdwgJYjnl2iZK1q077WIsGrtDm+BV8TgiPkhjFt8mXfIefJHsZ
	CkFy2v3wrTvMe6YKHSadU5/v8q/VNOESzFAWciDizaWJtmlyfef7zJgG80EeR777mOkczMsLF2332
	rWtLIyug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpMxo-0000000F3uZ-2WKR;
	Mon, 09 Feb 2026 08:49:48 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpMxm-0000000F3uD-0m9x
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Feb 2026 08:49:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0B7C34417D;
	Mon,  9 Feb 2026 08:49:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3BD6C116C6;
	Mon,  9 Feb 2026 08:49:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770626984;
	bh=hrBXFznTwdWmXs1zvNu9iVueNufa6xnW3w+yF3Djn+M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=TPEOF6/3AguXyv7ybUXpRZLxt7s0hAp01KEaZscFtoVxo/QpUBu5lI2i5wOWi1+MD
	 y3U6cc2RGmkB9FSiI4B7hmHsp1IL8xT63Pn3YuyW2x/hpjWR6c8Qbq046qN3rjaO+s
	 1uyIAt1Y0cpjQIuZgNY8fK4XAb/2YVpFL8twI+jBtCyAjRVisoPkqfWFU1QYPTEsBd
	 xKRXkoZZ046rUR0KjiGG4xOhZjl7TGeSSUY4Hh7Fkfr9ZlzH8MFG7IVAclUG4qTJlT
	 QXbh0YG6qbH3Ohoxj4lT4SWHiIz0z9GBovH4Rc9J8C24vdVv4Vm4zfcyG8WJyWyjSG
	 4MX0jadpTq1tQ==
Message-ID: <3d5cb9a4-6604-4302-a110-3d8ff91baa56@kernel.org>
Date: Mon, 9 Feb 2026 09:49:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/5] mm: rmap: support batched checks of the references
 for large folios
To: Baolin Wang <baolin.wang@linux.alibaba.com>, akpm@linux-foundation.org,
 catalin.marinas@arm.com, will@kernel.org
Cc: lorenzo.stoakes@oracle.com, ryan.roberts@arm.com,
 Liam.Howlett@oracle.com, vbabka@suse.cz, rppt@kernel.org, surenb@google.com,
 mhocko@suse.com, riel@surriel.com, harry.yoo@oracle.com, jannh@google.com,
 willy@infradead.org, baohua@kernel.org, dev.jain@arm.com,
 linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <cover.1766631066.git.baolin.wang@linux.alibaba.com>
 <18b3eb9c730d16756e5d23c7be22efe2f6219911.1766631066.git.baolin.wang@linux.alibaba.com>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 xsFNBFXLn5EBEAC+zYvAFJxCBY9Tr1xZgcESmxVNI/0ffzE/ZQOiHJl6mGkmA1R7/uUpiCjJ
 dBrn+lhhOYjjNefFQou6478faXE6o2AhmebqT4KiQoUQFV4R7y1KMEKoSyy8hQaK1umALTdL
 QZLQMzNE74ap+GDK0wnacPQFpcG1AE9RMq3aeErY5tujekBS32jfC/7AnH7I0v1v1TbbK3Gp
 XNeiN4QroO+5qaSr0ID2sz5jtBLRb15RMre27E1ImpaIv2Jw8NJgW0k/D1RyKCwaTsgRdwuK
 Kx/Y91XuSBdz0uOyU/S8kM1+ag0wvsGlpBVxRR/xw/E8M7TEwuCZQArqqTCmkG6HGcXFT0V9
 PXFNNgV5jXMQRwU0O/ztJIQqsE5LsUomE//bLwzj9IVsaQpKDqW6TAPjcdBDPLHvriq7kGjt
 WhVhdl0qEYB8lkBEU7V2Yb+SYhmhpDrti9Fq1EsmhiHSkxJcGREoMK/63r9WLZYI3+4W2rAc
 UucZa4OT27U5ZISjNg3Ev0rxU5UH2/pT4wJCfxwocmqaRr6UYmrtZmND89X0KigoFD/XSeVv
 jwBRNjPAubK9/k5NoRrYqztM9W6sJqrH8+UWZ1Idd/DdmogJh0gNC0+N42Za9yBRURfIdKSb
 B3JfpUqcWwE7vUaYrHG1nw54pLUoPG6sAA7Mehl3nd4pZUALHwARAQABzS5EYXZpZCBIaWxk
 ZW5icmFuZCAoQ3VycmVudCkgPGRhdmlkQGtlcm5lbC5vcmc+wsGQBBMBCAA6AhsDBQkmWAik
 AgsJBBUKCQgCFgICHgUCF4AWIQQb2cqtc1xMOkYN/MpN3hD3AP+DWgUCaYJt/AIZAQAKCRBN
 3hD3AP+DWriiD/9BLGEKG+N8L2AXhikJg6YmXom9ytRwPqDgpHpVg2xdhopoWdMRXjzOrIKD
 g4LSnFaKneQD0hZhoArEeamG5tyo32xoRsPwkbpIzL0OKSZ8G6mVbFGpjmyDLQCAxteXCLXz
 ZI0VbsuJKelYnKcXWOIndOrNRvE5eoOfTt2XfBnAapxMYY2IsV+qaUXlO63GgfIOg8RBaj7x
 3NxkI3rV0SHhI4GU9K6jCvGghxeS1QX6L/XI9mfAYaIwGy5B68kF26piAVYv/QZDEVIpo3t7
 /fjSpxKT8plJH6rhhR0epy8dWRHk3qT5tk2P85twasdloWtkMZ7FsCJRKWscm1BLpsDn6EQ4
 jeMHECiY9kGKKi8dQpv3FRyo2QApZ49NNDbwcR0ZndK0XFo15iH708H5Qja/8TuXCwnPWAcJ
 DQoNIDFyaxe26Rx3ZwUkRALa3iPcVjE0//TrQ4KnFf+lMBSrS33xDDBfevW9+Dk6IISmDH1R
 HFq2jpkN+FX/PE8eVhV68B2DsAPZ5rUwyCKUXPTJ/irrCCmAAb5Jpv11S7hUSpqtM/6oVESC
 3z/7CzrVtRODzLtNgV4r5EI+wAv/3PgJLlMwgJM90Fb3CB2IgbxhjvmB1WNdvXACVydx55V7
 LPPKodSTF29rlnQAf9HLgCphuuSrrPn5VQDaYZl4N/7zc2wcWM7BTQRVy5+RARAA59fefSDR
 9nMGCb9LbMX+TFAoIQo/wgP5XPyzLYakO+94GrgfZjfhdaxPXMsl2+o8jhp/hlIzG56taNdt
 VZtPp3ih1AgbR8rHgXw1xwOpuAd5lE1qNd54ndHuADO9a9A0vPimIes78Hi1/yy+ZEEvRkHk
 /kDa6F3AtTc1m4rbbOk2fiKzzsE9YXweFjQvl9p+AMw6qd/iC4lUk9g0+FQXNdRs+o4o6Qvy
 iOQJfGQ4UcBuOy1IrkJrd8qq5jet1fcM2j4QvsW8CLDWZS1L7kZ5gT5EycMKxUWb8LuRjxzZ
 3QY1aQH2kkzn6acigU3HLtgFyV1gBNV44ehjgvJpRY2cC8VhanTx0dZ9mj1YKIky5N+C0f21
 zvntBqcxV0+3p8MrxRRcgEtDZNav+xAoT3G0W4SahAaUTWXpsZoOecwtxi74CyneQNPTDjNg
 azHmvpdBVEfj7k3p4dmJp5i0U66Onmf6mMFpArvBRSMOKU9DlAzMi4IvhiNWjKVaIE2Se9BY
 FdKVAJaZq85P2y20ZBd08ILnKcj7XKZkLU5FkoA0udEBvQ0f9QLNyyy3DZMCQWcwRuj1m73D
 sq8DEFBdZ5eEkj1dCyx+t/ga6x2rHyc8Sl86oK1tvAkwBNsfKou3v+jP/l14a7DGBvrmlYjO
 59o3t6inu6H7pt7OL6u6BQj7DoMAEQEAAcLBfAQYAQgAJgIbDBYhBBvZyq1zXEw6Rg38yk3e
 EPcA/4NaBQJonNqrBQkmWAihAAoJEE3eEPcA/4NaKtMQALAJ8PzprBEXbXcEXwDKQu+P/vts
 IfUb1UNMfMV76BicGa5NCZnJNQASDP/+bFg6O3gx5NbhHHPeaWz/VxlOmYHokHodOvtL0WCC
 8A5PEP8tOk6029Z+J+xUcMrJClNVFpzVvOpb1lCbhjwAV465Hy+NUSbbUiRxdzNQtLtgZzOV
 Zw7jxUCs4UUZLQTCuBpFgb15bBxYZ/BL9MbzxPxvfUQIPbnzQMcqtpUs21CMK2PdfCh5c4gS
 sDci6D5/ZIBw94UQWmGpM/O1ilGXde2ZzzGYl64glmccD8e87OnEgKnH3FbnJnT4iJchtSvx
 yJNi1+t0+qDti4m88+/9IuPqCKb6Stl+s2dnLtJNrjXBGJtsQG/sRpqsJz5x1/2nPJSRMsx9
 5YfqbdrJSOFXDzZ8/r82HgQEtUvlSXNaXCa95ez0UkOG7+bDm2b3s0XahBQeLVCH0mw3RAQg
 r7xDAYKIrAwfHHmMTnBQDPJwVqxJjVNr7yBic4yfzVWGCGNE4DnOW0vcIeoyhy9vnIa3w1uZ
 3iyY2Nsd7JxfKu1PRhCGwXzRw5TlfEsoRI7V9A8isUCoqE2Dzh3FvYHVeX4Us+bRL/oqareJ
 CIFqgYMyvHj7Q06kTKmauOe4Nf0l0qEkIuIzfoLJ3qr5UyXc2hLtWyT9Ir+lYlX9efqh7mOY
 qIws/H2t
In-Reply-To: <18b3eb9c730d16756e5d23c7be22efe2f6219911.1766631066.git.baolin.wang@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_004946_401039_37183FDA 
X-CRM114-Status: GOOD (  37.80  )
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

On 12/26/25 07:07, Baolin Wang wrote:
> Currently, folio_referenced_one() always checks the young flag for each PTE
> sequentially, which is inefficient for large folios. This inefficiency is
> especially noticeable when reclaiming clean file-backed large folios, where
> folio_referenced() is observed as a significant performance hotspot.
> 
> Moreover, on Arm64 architecture, which supports contiguous PTEs, there is already
> an optimization to clear the young flags for PTEs within a contiguous range.
> However, this is not sufficient. We can extend this to perform batched operations
> for the entire large folio (which might exceed the contiguous range: CONT_PTE_SIZE).
> 
> Introduce a new API: clear_flush_young_ptes() to facilitate batched checking
> of the young flags and flushing TLB entries, thereby improving performance
> during large folio reclamation. And it will be overridden by the architecture
> that implements a more efficient batch operation in the following patches.
> 
> While we are at it, rename ptep_clear_flush_young_notify() to
> clear_flush_young_ptes_notify() to indicate that this is a batch operation.
> 
> Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>
> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> ---
>   include/linux/mmu_notifier.h |  9 +++++----
>   include/linux/pgtable.h      | 31 +++++++++++++++++++++++++++++++
>   mm/rmap.c                    | 31 ++++++++++++++++++++++++++++---
>   3 files changed, 64 insertions(+), 7 deletions(-)
> 
> diff --git a/include/linux/mmu_notifier.h b/include/linux/mmu_notifier.h
> index d1094c2d5fb6..07a2bbaf86e9 100644
> --- a/include/linux/mmu_notifier.h
> +++ b/include/linux/mmu_notifier.h
> @@ -515,16 +515,17 @@ static inline void mmu_notifier_range_init_owner(
>   	range->owner = owner;
>   }
>   
> -#define ptep_clear_flush_young_notify(__vma, __address, __ptep)		\
> +#define clear_flush_young_ptes_notify(__vma, __address, __ptep, __nr)	\
>   ({									\
>   	int __young;							\
>   	struct vm_area_struct *___vma = __vma;				\
>   	unsigned long ___address = __address;				\
> -	__young = ptep_clear_flush_young(___vma, ___address, __ptep);	\
> +	unsigned int ___nr = __nr;					\
> +	__young = clear_flush_young_ptes(___vma, ___address, __ptep, ___nr);	\
>   	__young |= mmu_notifier_clear_flush_young(___vma->vm_mm,	\
>   						  ___address,		\
>   						  ___address +		\
> -							PAGE_SIZE);	\
> +						  ___nr * PAGE_SIZE);	\
>   	__young;							\
>   })
>   

Man that's ugly, Not your fault, but can this possibly be turned into an 
inline function in a follow-up patch.

[...]

>   
> +#ifndef clear_flush_young_ptes
> +/**
> + * clear_flush_young_ptes - Clear the access bit and perform a TLB flush for PTEs
> + *			    that map consecutive pages of the same folio.

With clear_young_dirty_ptes() description in mind, this should probably 
be "Mark PTEs that map consecutive pages of the same folio as clean and 
flush the TLB" ?

> + * @vma: The virtual memory area the pages are mapped into.
> + * @addr: Address the first page is mapped at.
> + * @ptep: Page table pointer for the first entry.
> + * @nr: Number of entries to clear access bit.
> + *
> + * May be overridden by the architecture; otherwise, implemented as a simple
> + * loop over ptep_clear_flush_young().
> + *
> + * Note that PTE bits in the PTE range besides the PFN can differ. For example,
> + * some PTEs might be write-protected.
> + *
> + * Context: The caller holds the page table lock.  The PTEs map consecutive
> + * pages that belong to the same folio.  The PTEs are all in the same PMD.
> + */
> +static inline int clear_flush_young_ptes(struct vm_area_struct *vma,
> +					 unsigned long addr, pte_t *ptep,
> +					 unsigned int nr)

Two-tab alignment on second+ line like all similar functions here.

> +{
> +	int i, young = 0;
> +
> +	for (i = 0; i < nr; ++i, ++ptep, addr += PAGE_SIZE)
> +		young |= ptep_clear_flush_young(vma, addr, ptep);
> +

Why don't we use a similar loop we use in clear_young_dirty_ptes() or 
clear_full_ptes() etc? It's not only consistent but also optimizes out 
the first check for nr.


for (;;) {
	young |= ptep_clear_flush_young(vma, addr, ptep);
	if (--nr == 0)
		break;
	ptep++;
	addr += PAGE_SIZE;
}

> +	return young;
> +}
> +#endif
> +
>   /*
>    * On some architectures hardware does not set page access bit when accessing
>    * memory page, it is responsibility of software setting this bit. It brings
> diff --git a/mm/rmap.c b/mm/rmap.c
> index e805ddc5a27b..985ab0b085ba 100644
> --- a/mm/rmap.c
> +++ b/mm/rmap.c
> @@ -828,9 +828,11 @@ static bool folio_referenced_one(struct folio *folio,
>   	struct folio_referenced_arg *pra = arg;
>   	DEFINE_FOLIO_VMA_WALK(pvmw, folio, vma, address, 0);
>   	int ptes = 0, referenced = 0;
> +	unsigned int nr;
>   
>   	while (page_vma_mapped_walk(&pvmw)) {
>   		address = pvmw.address;
> +		nr = 1;
>   
>   		if (vma->vm_flags & VM_LOCKED) {
>   			ptes++;
> @@ -875,9 +877,24 @@ static bool folio_referenced_one(struct folio *folio,
>   			if (lru_gen_look_around(&pvmw))
>   				referenced++;
>   		} else if (pvmw.pte) {
> -			if (ptep_clear_flush_young_notify(vma, address,
> -						pvmw.pte))
> +			if (folio_test_large(folio)) {
> +				unsigned long end_addr =
> +					pmd_addr_end(address, vma->vm_end);
> +				unsigned int max_nr =
> +					(end_addr - address) >> PAGE_SHIFT;

Good news: you can both fit into a single line as we are allowed to 
exceed 80c if it aids readability.

> +				pte_t pteval = ptep_get(pvmw.pte);
> +
> +				nr = folio_pte_batch(folio, pvmw.pte,
> +						     pteval, max_nr);
> +			}
> +
> +			ptes += nr;

I'm not sure about whether we should mess with the "ptes" variable that 
is so far only used for VM_LOCKED vmas. See below, maybe we can just 
avoid that.

> +			if (clear_flush_young_ptes_notify(vma, address,
> +						pvmw.pte, nr))

Could maybe fit that into a single line as well, whatever you prefer.

>   				referenced++;
> +			/* Skip the batched PTEs */
> +			pvmw.pte += nr - 1;
> +			pvmw.address += (nr - 1) * PAGE_SIZE;
>   		} else if (IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE)) {
>   			if (pmdp_clear_flush_young_notify(vma, address,
>   						pvmw.pmd))
> @@ -887,7 +904,15 @@ static bool folio_referenced_one(struct folio *folio,
>   			WARN_ON_ONCE(1);
>   		}
>   
> -		pra->mapcount--;
> +		pra->mapcount -= nr;
> +		/*
> +		 * If we are sure that we batched the entire folio,
> +		 * we can just optimize and stop right here.
> +		 */
> +		if (ptes == pvmw.nr_pages) {
> +			page_vma_mapped_walk_done(&pvmw);
> +			break;
> +		}
Why not check for !pra->mapcount? Then you can also drop the comment, 
because it's exactly the same thing we check after the loop to indicate 
what to return to the caller.

And you will not have to mess with the "ptes" variable?



Only minor stuff.

-- 
Cheers,

David

