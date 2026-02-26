Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B337F55450
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 05:56:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A9qs2zE0FueYonacX/ztnskZqTvxRHERhL76d+GCneQ=; b=OTA9jKesQv2xcAGjwD3pcInJE3
	qRBJiwgG3Efo0BpdaOy3fN6UY6+FX3qJP0kSYOHKs54CDg96GYzD0rJdUUq0G0wT3g3VrgDDHIL4v
	O94stUbwiJhigpbUoFIbwketzCrGOOB6iBEHTHPMA8A5aBjiHkyKBoI7tkUmNfDdkQSoxN0/xzJwk
	n0/iF4XDQX1P9Ssm9JxrbMhhuY4B2n8DIOh5cGgwl5gDW9tdT4OeMLuPwrp8u0GIHLWLj0FNNSGPw
	gr8kZvCQWBFDbPK1msCRHss7djvVDhgqVJnVE0dKJB5Ib+VwU/0wd0bIO5yhECZYaDIYU5q1zG6TO
	aBHMmYeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvUMm-00000005SKc-14pg;
	Thu, 26 Feb 2026 05:56:52 +0000
Received: from out30-111.freemail.mail.aliyun.com ([115.124.30.111])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvUMb-00000005SG6-0wxN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 05:56:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1772085395; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=A9qs2zE0FueYonacX/ztnskZqTvxRHERhL76d+GCneQ=;
	b=ynFE88XbQ2RUsHDIpN5jmAQdQMfxRV9vNA34YQE/KK8tFgfoLr9oU0ZTJYQlwRWCQT1ca1I4kSOVaJO7rRus6RivwrMcWvIEh1l3H/+5N3sNTA/kHSZalQZ54e6javYbcRB/HR+0M6ZEYiIF+EtqMhZe/RR3YsP1JSyBebAtdLA=
Received: from 30.74.144.118(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0WzqFsiZ_1772085389 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 26 Feb 2026 13:56:30 +0800
Message-ID: <0871edb9-08a2-46a0-ade6-af842a12e0d3@linux.alibaba.com>
Date: Thu, 26 Feb 2026 13:56:28 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] mm: support batched checking of the young flag for
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
References: <cover.1771897150.git.baolin.wang@linux.alibaba.com>
 <84d2426c63c1eafeaa0cfbad7c5cc11e9c11b980.1771897150.git.baolin.wang@linux.alibaba.com>
 <2e7a1e24-3616-4b79-b943-b5f7efde2d31@kernel.org>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <2e7a1e24-3616-4b79-b943-b5f7efde2d31@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_215642_354943_AE3959EF 
X-CRM114-Status: GOOD (  31.16  )
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



On 2/25/26 10:25 PM, David Hildenbrand (Arm) wrote:
> On 2/24/26 02:56, Baolin Wang wrote:
>> Use the batched helper clear_young_ptes_notify() to check and clear the
>> young flag to improve the performance during large folio reclamation when
>> MGLRU is enabled.
>>
>> Meanwhile, we can also support batched checking the young and dirty flag
>> when MGLRU walks the mm's pagetable to update the folios' generation
>> counter. Since MGLRU also checks the PTE dirty bit, use folio_pte_batch_flags()
>> with FPB_MERGE_YOUNG_DIRTY set to detect batches of PTEs for a large folio.
>>
>> Then we can remove the ptep_clear_young_notify() since it has no users now.
>>
>> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
>> ---
> 
> [...]
> 
>>   
>> -static inline int ptep_clear_young_notify(struct vm_area_struct *vma,
>> -					  unsigned long addr, pte_t *ptep)
>> -{
>> -	return clear_young_ptes_notify(vma, addr, ptep, 1);
>> -}
>> -
>>   static inline int pmdp_clear_young_notify(struct vm_area_struct *vma,
>>   					  unsigned long addr, pmd_t *pmdp)
>>   {
>> @@ -1847,12 +1841,6 @@ static inline int pmdp_clear_young_notify(struct vm_area_struct *vma,
>>   #define clear_young_ptes_notify	test_and_clear_young_ptes
>>   #define pmdp_clear_young_notify	pmdp_test_and_clear_young
>>   
>> -static inline int ptep_clear_young_notify(struct vm_area_struct *vma,
>> -					  unsigned long addr, pte_t *ptep)
>> -{
>> -	return test_and_clear_young_ptes(vma, addr, ptep, 1);
>> -}
>> -
> 
> Oh, we remove the last user, nice.
> 
> 
>>   #endif /* CONFIG_MMU_NOTIFIER */
>>   
>>   #endif	/* __MM_INTERNAL_H */
>> diff --git a/mm/rmap.c b/mm/rmap.c
>> index be785dfc9336..1c147251ae28 100644
>> --- a/mm/rmap.c
>> +++ b/mm/rmap.c
>> @@ -958,25 +958,21 @@ static bool folio_referenced_one(struct folio *folio,
>>   			return false;
>>   		}
>>   
>> +		if (pvmw.pte && folio_test_large(folio)) {
>> +			unsigned long end_addr = pmd_addr_end(address, vma->vm_end);
>> +			unsigned int max_nr = (end_addr - address) >> PAGE_SHIFT;
> 
> Both could be const.

Ack.

> 
>> +			pte_t pteval = ptep_get(pvmw.pte);
> 
> I wonder if there could be a way to avoid this ptep_get() by letting
> page_vma_mapped_walk() just provide the last value it used (in
> check_pte() I guess). Something for another patch.

Well, we’d need to add a new field to ‘struct page_vma_mapped_walk’ to 
store the last value (e.g., pvmw.pteval), but this makes me wonder if it 
is worth adding a new field just to avoid a lightweight read (which 
should have no obvious performance impact).

>> +
>> +			nr = folio_pte_batch(folio, pvmw.pte, pteval, max_nr);
>> +			ptes += nr;
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
>> @@ -995,6 +991,12 @@ static bool folio_referenced_one(struct folio *folio,
>>   			page_vma_mapped_walk_done(&pvmw);
>>   			break;
>>   		}
>> +
>> +		/* Skip the batched PTEs */
>> +		if (nr > 1) {
>> +			pvmw.pte += nr - 1;
>> +			pvmw.address += (nr - 1) * PAGE_SIZE;
>> +		}
> 
> As nr >= 1, you can just unconditionaly do
> 
> pvmw.pte += nr - 1;
> pvmw.address += (nr - 1) * PAGE_SIZE;

Actually, I want to filter out the THP case where the 'pvmw.pte' is 
NULL. But it shouldn’t be a problem, because 'nr' is always 1 for the 
THP case. I can remove the check.

>>   	}
>>   
>>   	if (referenced)
>> diff --git a/mm/vmscan.c b/mm/vmscan.c
>> index 728868c61750..d83962468b2e 100644
>> --- a/mm/vmscan.c
>> +++ b/mm/vmscan.c
>> @@ -3494,6 +3494,7 @@ static bool walk_pte_range(pmd_t *pmd, unsigned long start, unsigned long end,
>>   	struct pglist_data *pgdat = lruvec_pgdat(walk->lruvec);
>>   	DEFINE_MAX_SEQ(walk->lruvec);
>>   	int gen = lru_gen_from_seq(max_seq);
>> +	unsigned int nr;
>>   	pmd_t pmdval;
>>   
>>   	pte = pte_offset_map_rw_nolock(args->mm, pmd, start & PMD_MASK, &pmdval, &ptl);
>> @@ -3512,11 +3513,13 @@ static bool walk_pte_range(pmd_t *pmd, unsigned long start, unsigned long end,
>>   
>>   	lazy_mmu_mode_enable();
>>   restart:
>> -	for (i = pte_index(start), addr = start; addr != end; i++, addr += PAGE_SIZE) {
>> +	for (i = pte_index(start), addr = start; addr != end; i += nr, addr += nr * PAGE_SIZE) {
>>   		unsigned long pfn;
>>   		struct folio *folio;
>> -		pte_t ptent = ptep_get(pte + i);
>> +		pte_t *ptep = pte + i;
>> +		pte_t ptent = ptep_get(ptep);
> 
> 
> Existing "pte vs ptent" vs. "ptep vs. pte" is already confusing.
> Combining them into "pte vs. ptep vs. ptent" is no good.
> 
> If you need another variable, call it "cur_pte". Or rename "pte" to
> "start_pte".

OK. "cur_pte" sounds good to me.

>> +		nr = 1;
>>   		total++;
>>   		walk->mm_stats[MM_LEAF_TOTAL]++;
>>   
>> @@ -3528,7 +3531,14 @@ static bool walk_pte_range(pmd_t *pmd, unsigned long start, unsigned long end,
>>   		if (!folio)
>>   			continue;
>>   
>> -		if (!ptep_clear_young_notify(args->vma, addr, pte + i))
>> +		if (folio_test_large(folio)) {
>> +			unsigned int max_nr = (end - addr) >> PAGE_SHIFT;
>> +
>> +			nr = folio_pte_batch_flags(folio, NULL, ptep, &ptent,
>> +						   max_nr, FPB_MERGE_YOUNG_DIRTY);
>> +		}
>> +
>> +		if (!clear_young_ptes_notify(args->vma, addr, ptep, nr))
>>   			continue;
>>   
>>   		if (last != folio) {
>> @@ -4186,7 +4196,7 @@ static void lru_gen_age_node(struct pglist_data *pgdat, struct scan_control *sc)
>>    * the PTE table to the Bloom filter. This forms a feedback loop between the
>>    * eviction and the aging.
>>    */
>> -bool lru_gen_look_around(struct page_vma_mapped_walk *pvmw)
>> +bool lru_gen_look_around(struct page_vma_mapped_walk *pvmw, unsigned int batched)
> 
> What is "batched"? Did you mean "nr_ptes" ? Or just the initial value
> for "nr" ?

There is already an 'nr' variable in this function. "nr_ptes" sounds 
good to me, and will use it.

>> -		if (!ptep_clear_young_notify(vma, addr, pte + i))
>> +		if (folio_test_large(folio)) {
>> +			unsigned int max_nr = (end - addr) >> PAGE_SHIFT;
> 
> Can be const.

Ack.

> 
>> +
>> +			nr = folio_pte_batch_flags(folio, NULL, ptep, &ptent,
>> +						   max_nr, FPB_MERGE_YOUNG_DIRTY);
>> +		}
> 
> I guess we might benefit from a FPB_MERGE_YOUNG only here. But this
> should work.

I’ve thought about it. Instead of adding another flag and some new 'if' 
branches for folio_pte_batch_flags(), and given that it brings no 
performance improvement for MGLRU, I still prefer the current 
FPB_MERGE_YOUNG_DIRTY method. :)

Thanks for reviewing.

