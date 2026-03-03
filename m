Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93CF6E67A6B
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Mar 2026 06:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LY/fRLCch2WMY1U+LqLFNZMzn9HmzfAceCungi2ykLY=; b=DGQcFgFhKANefD4ZBWO6Ywij1s
	okA3S/+SS3EDNTjbeYmHmTjINgH/qVYWe44kMZ1eX6ynl+ihy2uOByCsliRsm2RRgXhYYMp8Mzbhw
	rz7F4GU2wMdUsQjobdlwMFoiAefi5wcOBqjLDliIoosJ5FTxB2Bntk/HhOLresIilO9xoVL/T+tiD
	Yrz/akM6v3AB+FoQ8Y1HmAcUvLY3OIC/2tZN8xYY95TGokZqrbPiMaDMOp7qT5jAjLX0jyYOjcgPt
	Xfya2YN/Lmav6cmi34ofKcbjZbi6N21n2Qa4sr8H28DvrkRBAVzZa20tWbl3SixuVMq2HG9hDDGz9
	YzzrbZXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxIrX-0000000Ea9J-2Mtt;
	Tue, 03 Mar 2026 06:04:07 +0000
Received: from out30-130.freemail.mail.aliyun.com ([115.124.30.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxIrE-0000000Ea8K-1aEL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Mar 2026 06:04:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1772517818; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=LY/fRLCch2WMY1U+LqLFNZMzn9HmzfAceCungi2ykLY=;
	b=Kns+8coiC1eiefxHRGe8kr4aBRfgIi8a7bjdBB0AtlEGJ1HONlpyh1C0dqDKTNLxHwWSRK3aFSiaqno/8m/RP6i5mv4Sxn9AHxlwalSrv7B9OEpaCkMkGDSEU5SRINrsYdNNyJcrJ5lMGhi2+U8xvPOcZFCKKHD7gZBhJ5ees2Q=
Received: from 30.74.144.119(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0X-8iWyn_1772517815 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 03 Mar 2026 14:03:36 +0800
Message-ID: <3701c315-b19c-4c87-aff3-cc76e1009a43@linux.alibaba.com>
Date: Tue, 3 Mar 2026 14:03:35 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] mm: support batched checking of the young flag for
 MGLRU
To: "David Hildenbrand (Arm)" <david@kernel.org>, akpm@linux-foundation.org
Cc: catalin.marinas@arm.com, will@kernel.org, lorenzo.stoakes@oracle.com,
 ryan.roberts@arm.com, Liam.Howlett@oracle.com, vbabka@suse.cz,
 rppt@kernel.org, surenb@google.com, mhocko@suse.com, riel@surriel.com,
 harry.yoo@oracle.com, jannh@google.com, willy@infradead.org,
 baohua@kernel.org, dev.jain@arm.com, axelrasmussen@google.com,
 yuanchu@google.com, weixugc@google.com, hannes@cmpxchg.org,
 zhengqi.arch@bytedance.com, shakeel.butt@linux.dev, linux-mm@kvack.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <cover.1772185080.git.baolin.wang@linux.alibaba.com>
 <f84233f95f209d59c3bc9c72a757af09337f0d40.1772185080.git.baolin.wang@linux.alibaba.com>
 <7f2973f0-0a34-4e4f-8ed6-13c531f77453@kernel.org>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <7f2973f0-0a34-4e4f-8ed6-13c531f77453@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_220404_532100_0EB2926C 
X-CRM114-Status: GOOD (  34.91  )
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



On 3/2/26 5:57 PM, David Hildenbrand (Arm) wrote:
> On 2/27/26 10:44, Baolin Wang wrote:
>> Use the batched helper test_and_clear_young_ptes_notify() to check and clear
>> the young flag to improve the performance during large folio reclamation when
>> MGLRU is enabled.
>>
>> Meanwhile, we can also support batched checking the young and dirty flag
>> when MGLRU walks the mm's pagetable to update the folios' generation
>> counter. Since MGLRU also checks the PTE dirty bit, use folio_pte_batch_flags()
>> with FPB_MERGE_YOUNG_DIRTY set to detect batches of PTEs for a large folio.
>>
>> Then we can remove the ptep_test_and_clear_young_notify() since it has
>> no users now.
>>
>> Note that we also update the 'young' counter and 'mm_stats[MM_LEAF_YOUNG]' counter
>> with the batched count in the lru_gen_look_around() and walk_pte_range(). However,
>> the batched operations may inflate these two counters, because in a large folio not
>> all PTEs may have been accessed. (Additionally, tracking how many PTEs have been
>> accessed within a large folio is not very meaningful, since the mm core actually
>> tracks access/dirty on a per-folio basis, not per page). The impact analysis is as
>> follows:
>>
>> 1. The 'mm_stats[MM_LEAF_YOUNG]' counter has no functional impact and is mainly for
>> debugging.
>>
>> 2. The 'young' counter is used to decide whether to place the current PMD entry into the
>> bloom filters by suitable_to_scan() (so that next time we can check whether it has been
>> accessed again), which may set the hash bit in the bloom filters for a PMD entry that
>> hasn’t seen much access. However, bloom filters inherently allow some error, so this
>> effect appears negligible.
> 
> 
> Doesn't checkpatch complain about long lines in the patch description?

Will update the commit message.

>> Reviewed-by: Rik van Riel <riel@surriel.com>
>> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
>> ---
> 
> ...
> 
>> index a5f0a264ad56..a1b3967afe41 100644
>> --- a/mm/internal.h
>> +++ b/mm/internal.h
>> @@ -1843,10 +1843,4 @@ static inline int pmdp_test_and_clear_young_notify(struct vm_area_struct *vma,
>>   
>>   #endif /* CONFIG_MMU_NOTIFIER */
>>   
>> -static inline int ptep_test_and_clear_young_notify(struct vm_area_struct *vma,
>> -		unsigned long addr, pte_t *ptep)
>> -{
>> -	return test_and_clear_young_ptes_notify(vma, addr, ptep, 1);
>> -}
>> -
>>   #endif	/* __MM_INTERNAL_H */
>> diff --git a/mm/rmap.c b/mm/rmap.c
>> index 11cc6171344f..beb423f3e8ec 100644
>> --- a/mm/rmap.c
>> +++ b/mm/rmap.c
>> @@ -958,25 +958,21 @@ static bool folio_referenced_one(struct folio *folio,
>>   			return false;
>>   		}
>>   
>> +		if (pvmw.pte && folio_test_large(folio)) {
>> +			const unsigned long end_addr = pmd_addr_end(address, vma->vm_end);
>> +			const unsigned int max_nr = (end_addr - address) >> PAGE_SHIFT;
>> +			pte_t pteval = ptep_get(pvmw.pte);
>> +
>> +			nr = folio_pte_batch(folio, pvmw.pte, pteval, max_nr);
>> +			ptes += nr;
> 
> Could we move that "ptes += nr;" just before the "pra->mapcount -= nr;"?
> 
> Would make the whole thing look less weird (only incrementing "ptes" with large folios).

OK. Sounds reasonable.

>> +		}
>> +
>>   		if (lru_gen_enabled() && pvmw.pte) {
>> -			if (lru_gen_look_around(&pvmw))
>> +			if (lru_gen_look_around(&pvmw, nr))
>>   				referenced++;
>>   		} else if (pvmw.pte) {
>> -			if (folio_test_large(folio)) {
>> -				unsigned long end_addr = pmd_addr_end(address, vma->vm_end);
>> -				unsigned int max_nr = (end_addr - address) >> PAGE_SHIFT;
>> -				pte_t pteval = ptep_get(pvmw.pte);
>> -
>> -				nr = folio_pte_batch(folio, pvmw.pte,
>> -						     pteval, max_nr);
>> -			}
>> -
>> -			ptes += nr;
>>   			if (clear_flush_young_ptes_notify(vma, address, pvmw.pte, nr))
>>   				referenced++;
>> -			/* Skip the batched PTEs */
>> -			pvmw.pte += nr - 1;
>> -			pvmw.address += (nr - 1) * PAGE_SIZE;
>>   		} else if (IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE)) {
>>   			if (pmdp_clear_flush_young_notify(vma, address,
>>   						pvmw.pmd))
>> @@ -995,6 +991,10 @@ static bool folio_referenced_one(struct folio *folio,
>>   			page_vma_mapped_walk_done(&pvmw);
>>   			break;
>>   		}
>> +
>> +		/* Skip the batched PTEs */
>> +		pvmw.pte += nr - 1;
>> +		pvmw.address += (nr - 1) * PAGE_SIZE;
>>   	}
>>   
>>   	if (referenced)
>> diff --git a/mm/vmscan.c b/mm/vmscan.c
>> index 0a5622420987..7457b3c06fa3 100644
>> --- a/mm/vmscan.c
>> +++ b/mm/vmscan.c
>> @@ -3474,6 +3474,7 @@ static bool walk_pte_range(pmd_t *pmd, unsigned long start, unsigned long end,
>>   	struct pglist_data *pgdat = lruvec_pgdat(walk->lruvec);
>>   	DEFINE_MAX_SEQ(walk->lruvec);
>>   	int gen = lru_gen_from_seq(max_seq);
>> +	unsigned int nr;
>>   	pmd_t pmdval;
>>   
>>   	pte = pte_offset_map_rw_nolock(args->mm, pmd, start & PMD_MASK, &pmdval, &ptl);
>> @@ -3492,11 +3493,13 @@ static bool walk_pte_range(pmd_t *pmd, unsigned long start, unsigned long end,
>>   
>>   	lazy_mmu_mode_enable();
>>   restart:
>> -	for (i = pte_index(start), addr = start; addr != end; i++, addr += PAGE_SIZE) {
>> +	for (i = pte_index(start), addr = start; addr != end; i += nr, addr += nr * PAGE_SIZE) {
>>   		unsigned long pfn;
>>   		struct folio *folio;
>> -		pte_t ptent = ptep_get(pte + i);
>> +		pte_t *cur_pte = pte + i;
>> +		pte_t ptent = ptep_get(cur_pte);
>>   
>> +		nr = 1;
> 
> 
> Looking at this again, we should get rid of "i" completely and instead
> * rename pte to start_pte
> * Add a new pte, which we increment in the loop
> 
> So we end up with something like
> 
> diff --git a/mm/vmscan.c b/mm/vmscan.c
> index 54cf4924d223..150cbb2253b9 100644
> --- a/mm/vmscan.c
> +++ b/mm/vmscan.c
> @@ -3486,9 +3486,8 @@ static void walk_update_folio(struct lru_gen_mm_walk *walk, struct folio *folio,
>   static bool walk_pte_range(pmd_t *pmd, unsigned long start, unsigned long end,
>                             struct mm_walk *args)
>   {
> -       int i;
>          bool dirty;
> -       pte_t *pte;
> +       pte_t *start_pte, pte;
>          spinlock_t *ptl;
>          unsigned long addr;
>          int total = 0;
> @@ -3499,29 +3498,31 @@ static bool walk_pte_range(pmd_t *pmd, unsigned long start, unsigned long end,
>          struct pglist_data *pgdat = lruvec_pgdat(walk->lruvec);
>          DEFINE_MAX_SEQ(walk->lruvec);
>          int gen = lru_gen_from_seq(max_seq);
> +       unsigned int nr;
>          pmd_t pmdval;
>   
> -       pte = pte_offset_map_rw_nolock(args->mm, pmd, start & PMD_MASK, &pmdval, &ptl);
> -       if (!pte)
> +       start_pte = pte_offset_map_rw_nolock(args->mm, pmd, start & PMD_MASK, &pmdval, &ptl);
> +       if (!start_pte)
>                  return false;
>   
>          if (!spin_trylock(ptl)) {
> -               pte_unmap(pte);
> +               pte_unmap(start_pte);
>                  return true;
>          }
>   
>          if (unlikely(!pmd_same(pmdval, pmdp_get_lockless(pmd)))) {
> -               pte_unmap_unlock(pte, ptl);
> +               pte_unmap_unlock(start_pte, ptl);
>                  return false;
>          }
>   
>          lazy_mmu_mode_enable();
>   restart:
> -       for (i = pte_index(start), addr = start; addr != end; i++, addr += PAGE_SIZE) {
> +       for (addr = start, pte = start_pte; addr != end; addr += nr * PAGE_SIZE, pte += nr) {
>                  unsigned long pfn;
>                  struct folio *folio;
> -               pte_t ptent = ptep_get(pte + i);
> +               pte_t ptent = ptep_get(pte);
>   
> +               nr = 1;
>                  total++;
>                  walk->mm_stats[MM_LEAF_TOTAL]++;
>   
> @@ -3533,7 +3534,16 @@ static bool walk_pte_range(pmd_t *pmd, unsigned long start, unsigned long end,
>                  if (!folio)
>                          continue;

Thanks for the code. I considered simplifying the logic this way, but 
this logic would be incorrect. Because the 'start' can be updated by the 
get_next_vma() below, when we goto restart, we will get a new 'i' value 
by 'pte_index(start)', so I kept the 'i' variable.

>>   	walk_update_folio(walk, last, gen, dirty);
>> @@ -4166,7 +4178,7 @@ static void lru_gen_age_node(struct pglist_data *pgdat, struct scan_control *sc)
>>    * the PTE table to the Bloom filter. This forms a feedback loop between the
>>    * eviction and the aging.
>>    */
>> -bool lru_gen_look_around(struct page_vma_mapped_walk *pvmw)
>> +bool lru_gen_look_around(struct page_vma_mapped_walk *pvmw, unsigned int nr)
>>   {
>>   	int i;
>>   	bool dirty;
>> @@ -4184,12 +4196,13 @@ bool lru_gen_look_around(struct page_vma_mapped_walk *pvmw)
>>   	struct lruvec *lruvec;
>>   	struct lru_gen_mm_state *mm_state;
>>   	unsigned long max_seq;
>> +	pte_t *cur_pte;
>>   	int gen;
>>   
>>   	lockdep_assert_held(pvmw->ptl);
>>   	VM_WARN_ON_ONCE_FOLIO(folio_test_lru(folio), folio);
>>   
>> -	if (!ptep_test_and_clear_young_notify(vma, addr, pte))
>> +	if (!test_and_clear_young_ptes_notify(vma, addr, pte, nr))
>>   		return false;
>>   
>>   	if (spin_is_contended(pvmw->ptl))
>> @@ -4229,10 +4242,12 @@ bool lru_gen_look_around(struct page_vma_mapped_walk *pvmw)
>>   
>>   	pte -= (addr - start) / PAGE_SIZE;
>>   
>> -	for (i = 0, addr = start; addr != end; i++, addr += PAGE_SIZE) {
>> +	for (i = 0, addr = start, cur_pte = pte; addr != end;
>> +	     i += nr, cur_pte += nr, addr += nr * PAGE_SIZE) {
>>   		unsigned long pfn;
>> -		pte_t ptent = ptep_get(pte + i);
>> +		pte_t ptent = ptep_get(cur_pte);
>>   
>> +		nr = 1;
> 
> Can't you just use pte and increment that, right?
> 
> "pte" is not used afterwards.

Yes. Will do. Thanks for your comments.

