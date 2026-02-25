Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6083FD3760
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 14:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NRnwp9JeeMuXV2IPWrFKL08ojPGCfMkvh4ICRPXvlx4=; b=0bldc/WmqDbxV2/jd6ZpGrrNAD
	TbL3qjvdGVKSMXeVO8QqaYtMHTYfYLqx+8d1GrDy4CUd6fhgBh80YduxlSW9vDQy5/70kQrkir1Kt
	z5CJ2RvjFqfKdmfegpElAcCn6tys27S+f9mTc9G1XiNSlKLWuYIT6TbKaiv3uB6GspiCg7z5r6QYh
	S8tArxOoL0PsTTFEl1wYJXSoJ7TePvOplnSbtgeJlLSS2Kd3iN0Ummp7B6yEKffJaht5V8WGtj20p
	0LoBMvfOS45NAs5nvqx0c/9uVF60L76ik71uuLkwJcLPKWxf+CWWVxtBhOY0ZMM7IMyNsngxOxyjk
	fa9JnY9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvFq6-00000004CaC-1WmK;
	Wed, 25 Feb 2026 14:26:10 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvFq4-00000004CZe-132a
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 14:26:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7D8E943AF9;
	Wed, 25 Feb 2026 14:26:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DC66C116D0;
	Wed, 25 Feb 2026 14:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772029566;
	bh=4Zuc2Y9/N0Q0CeGfuCJTQWoryvTqEgChCwBgzAT8okc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=CxpYOHbNRnMWhNAqNpFrfukLpdzeg1LRV0oAqS7UDI5b8GZrx5v/O5ao+ghL1UebI
	 ZQn3qMZBfq9IYorrdR/9wGj8EcxZXdNBmypOPG7gq5JoT01S5yxYCB4T59d5lg29eZ
	 6xN16q4cgYEsJARO3HUrgAyPhZ0JY+Z3dgyaVYSgDFJWjKZ/A3jgC/ktsqYX2UevCX
	 RGKpENC1W72otHAW6gF4NMAKERAgcq0l9KkLMTitGjP8ippq4coA5LVSgHUBJDgaFr
	 2QDY4d9b8L03kcJ2r9teoUSv4yE3KzdSVbHPUqYvH05yBMcDm5pl+5a0FC1KXZpiK3
	 K0cPoIVdbAhnw==
Message-ID: <2e7a1e24-3616-4b79-b943-b5f7efde2d31@kernel.org>
Date: Wed, 25 Feb 2026 15:25:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] mm: support batched checking of the young flag for
 MGLRU
To: Baolin Wang <baolin.wang@linux.alibaba.com>, akpm@linux-foundation.org
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
In-Reply-To: <84d2426c63c1eafeaa0cfbad7c5cc11e9c11b980.1771897150.git.baolin.wang@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_062608_337269_F1B5124F 
X-CRM114-Status: GOOD (  27.66  )
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

On 2/24/26 02:56, Baolin Wang wrote:
> Use the batched helper clear_young_ptes_notify() to check and clear the
> young flag to improve the performance during large folio reclamation when
> MGLRU is enabled.
> 
> Meanwhile, we can also support batched checking the young and dirty flag
> when MGLRU walks the mm's pagetable to update the folios' generation
> counter. Since MGLRU also checks the PTE dirty bit, use folio_pte_batch_flags()
> with FPB_MERGE_YOUNG_DIRTY set to detect batches of PTEs for a large folio.
> 
> Then we can remove the ptep_clear_young_notify() since it has no users now.
> 
> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> ---

[...]

>  
> -static inline int ptep_clear_young_notify(struct vm_area_struct *vma,
> -					  unsigned long addr, pte_t *ptep)
> -{
> -	return clear_young_ptes_notify(vma, addr, ptep, 1);
> -}
> -
>  static inline int pmdp_clear_young_notify(struct vm_area_struct *vma,
>  					  unsigned long addr, pmd_t *pmdp)
>  {
> @@ -1847,12 +1841,6 @@ static inline int pmdp_clear_young_notify(struct vm_area_struct *vma,
>  #define clear_young_ptes_notify	test_and_clear_young_ptes
>  #define pmdp_clear_young_notify	pmdp_test_and_clear_young
>  
> -static inline int ptep_clear_young_notify(struct vm_area_struct *vma,
> -					  unsigned long addr, pte_t *ptep)
> -{
> -	return test_and_clear_young_ptes(vma, addr, ptep, 1);
> -}
> -

Oh, we remove the last user, nice.


>  #endif /* CONFIG_MMU_NOTIFIER */
>  
>  #endif	/* __MM_INTERNAL_H */
> diff --git a/mm/rmap.c b/mm/rmap.c
> index be785dfc9336..1c147251ae28 100644
> --- a/mm/rmap.c
> +++ b/mm/rmap.c
> @@ -958,25 +958,21 @@ static bool folio_referenced_one(struct folio *folio,
>  			return false;
>  		}
>  
> +		if (pvmw.pte && folio_test_large(folio)) {
> +			unsigned long end_addr = pmd_addr_end(address, vma->vm_end);
> +			unsigned int max_nr = (end_addr - address) >> PAGE_SHIFT;

Both could be const.

> +			pte_t pteval = ptep_get(pvmw.pte);

I wonder if there could be a way to avoid this ptep_get() by letting
page_vma_mapped_walk() just provide the last value it used (in
check_pte() I guess). Something for another patch.

> +
> +			nr = folio_pte_batch(folio, pvmw.pte, pteval, max_nr);
> +			ptes += nr;
> +		}
> +
>  		if (lru_gen_enabled() && pvmw.pte) {
> -			if (lru_gen_look_around(&pvmw))
> +			if (lru_gen_look_around(&pvmw, nr))
>  				referenced++;
>  		} else if (pvmw.pte) {
> -			if (folio_test_large(folio)) {
> -				unsigned long end_addr = pmd_addr_end(address, vma->vm_end);
> -				unsigned int max_nr = (end_addr - address) >> PAGE_SHIFT;
> -				pte_t pteval = ptep_get(pvmw.pte);
> -
> -				nr = folio_pte_batch(folio, pvmw.pte,
> -						     pteval, max_nr);
> -			}
> -
> -			ptes += nr;
>  			if (clear_flush_young_ptes_notify(vma, address, pvmw.pte, nr))
>  				referenced++;
> -			/* Skip the batched PTEs */
> -			pvmw.pte += nr - 1;
> -			pvmw.address += (nr - 1) * PAGE_SIZE;
>  		} else if (IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE)) {
>  			if (pmdp_clear_flush_young_notify(vma, address,
>  						pvmw.pmd))
> @@ -995,6 +991,12 @@ static bool folio_referenced_one(struct folio *folio,
>  			page_vma_mapped_walk_done(&pvmw);
>  			break;
>  		}
> +
> +		/* Skip the batched PTEs */
> +		if (nr > 1) {
> +			pvmw.pte += nr - 1;
> +			pvmw.address += (nr - 1) * PAGE_SIZE;
> +		}

As nr >= 1, you can just unconditionaly do

pvmw.pte += nr - 1;
pvmw.address += (nr - 1) * PAGE_SIZE;

>  	}
>  
>  	if (referenced)
> diff --git a/mm/vmscan.c b/mm/vmscan.c
> index 728868c61750..d83962468b2e 100644
> --- a/mm/vmscan.c
> +++ b/mm/vmscan.c
> @@ -3494,6 +3494,7 @@ static bool walk_pte_range(pmd_t *pmd, unsigned long start, unsigned long end,
>  	struct pglist_data *pgdat = lruvec_pgdat(walk->lruvec);
>  	DEFINE_MAX_SEQ(walk->lruvec);
>  	int gen = lru_gen_from_seq(max_seq);
> +	unsigned int nr;
>  	pmd_t pmdval;
>  
>  	pte = pte_offset_map_rw_nolock(args->mm, pmd, start & PMD_MASK, &pmdval, &ptl);
> @@ -3512,11 +3513,13 @@ static bool walk_pte_range(pmd_t *pmd, unsigned long start, unsigned long end,
>  
>  	lazy_mmu_mode_enable();
>  restart:
> -	for (i = pte_index(start), addr = start; addr != end; i++, addr += PAGE_SIZE) {
> +	for (i = pte_index(start), addr = start; addr != end; i += nr, addr += nr * PAGE_SIZE) {
>  		unsigned long pfn;
>  		struct folio *folio;
> -		pte_t ptent = ptep_get(pte + i);
> +		pte_t *ptep = pte + i;
> +		pte_t ptent = ptep_get(ptep);


Existing "pte vs ptent" vs. "ptep vs. pte" is already confusing.
Combining them into "pte vs. ptep vs. ptent" is no good.

If you need another variable, call it "cur_pte". Or rename "pte" to
"start_pte".

>  
> +		nr = 1;
>  		total++;
>  		walk->mm_stats[MM_LEAF_TOTAL]++;
>  
> @@ -3528,7 +3531,14 @@ static bool walk_pte_range(pmd_t *pmd, unsigned long start, unsigned long end,
>  		if (!folio)
>  			continue;
>  
> -		if (!ptep_clear_young_notify(args->vma, addr, pte + i))
> +		if (folio_test_large(folio)) {
> +			unsigned int max_nr = (end - addr) >> PAGE_SHIFT;
> +
> +			nr = folio_pte_batch_flags(folio, NULL, ptep, &ptent,
> +						   max_nr, FPB_MERGE_YOUNG_DIRTY);
> +		}
> +
> +		if (!clear_young_ptes_notify(args->vma, addr, ptep, nr))
>  			continue;
>  
>  		if (last != folio) {
> @@ -4186,7 +4196,7 @@ static void lru_gen_age_node(struct pglist_data *pgdat, struct scan_control *sc)
>   * the PTE table to the Bloom filter. This forms a feedback loop between the
>   * eviction and the aging.
>   */
> -bool lru_gen_look_around(struct page_vma_mapped_walk *pvmw)
> +bool lru_gen_look_around(struct page_vma_mapped_walk *pvmw, unsigned int batched)

What is "batched"? Did you mean "nr_ptes" ? Or just the initial value
for "nr" ?

[...]

>  
> -		if (!ptep_clear_young_notify(vma, addr, pte + i))
> +		if (folio_test_large(folio)) {
> +			unsigned int max_nr = (end - addr) >> PAGE_SHIFT;

Can be const.

> +
> +			nr = folio_pte_batch_flags(folio, NULL, ptep, &ptent,
> +						   max_nr, FPB_MERGE_YOUNG_DIRTY);
> +		}

I guess we might benefit from a FPB_MERGE_YOUNG only here. But this
should work.

-- 
Cheers,

David

