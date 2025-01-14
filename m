Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B187E77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 03:41:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ED3v0KZ62Otclzj/DtPlHw7G1s3gURYmmZedtowKKdY=; b=3PGtx8q+tXox51UacH/38xRTRN
	geQeRyQjthCeg5ebf+fuql2jctfETkKulIXKjftggth4MDgpUqRcHrMq40lmSwoRyVGX7OSOEDuY7
	bREK0CpDVCvxcj/kGEm4n7+N8sJ2vxIEFXKy4IKJcoypYtXXxXqpqguaiHTWzX72GAmTBA49ZLbYf
	VQAw+mhlEZYO4irJ5p1h8qjhGcyplDg74z3GCOPzjMi0nLqlx5rS4mt3q6hV1BBrIFBKKjOiASDXh
	FCLzjyo1X4RkAehIpKSfqIbuZj9q+N40WU9lI9SaDyZMK8BUUL+8oP2DfdH7FfI0qdj57ysLIKvje
	cUJyYnZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXXo4-00000007N82-1I8r;
	Tue, 14 Jan 2025 03:41:32 +0000
Received: from out30-99.freemail.mail.aliyun.com ([115.124.30.99])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXXmm-00000007MxT-0e8V;
	Tue, 14 Jan 2025 03:40:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1736826007; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=ED3v0KZ62Otclzj/DtPlHw7G1s3gURYmmZedtowKKdY=;
	b=PgjjNH7N4PYC1crtK1RlhVquOiTALTD1eq0v0QqLL+XyNH+6y04YBdXCziYWi5XsWwNN7kSDJGYy7WRngsm9miPR94QlUApChV+RanBUPn2e8BHAK2uKmBT8a/mqGuSd1ch0uOeR6aYKHiEGO6/fQbgywQe/GrKJMqkZHxbJd9Q=
Received: from 30.74.144.113(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0WNdJbji_1736826004 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 14 Jan 2025 11:40:05 +0800
Message-ID: <c35845be-46dc-4868-b8f7-beb44eee04cc@linux.alibaba.com>
Date: Tue, 14 Jan 2025 11:40:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] mm: Avoid splitting pmd for lazyfree pmd-mapped
 THP in try_to_unmap
To: Barry Song <21cnbao@gmail.com>, akpm@linux-foundation.org,
 linux-mm@kvack.org
Cc: chrisl@kernel.org, david@redhat.com, ioworker0@gmail.com,
 kasong@tencent.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, ryan.roberts@arm.com, v-songbaohua@oppo.com,
 x86@kernel.org, linux-riscv@lists.infradead.org, ying.huang@intel.com,
 zhengtangquan@oppo.com, lorenzo.stoakes@oracle.com
References: <20250113033901.68951-1-21cnbao@gmail.com>
 <20250113033901.68951-5-21cnbao@gmail.com>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <20250113033901.68951-5-21cnbao@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_194012_887669_E5857626 
X-CRM114-Status: GOOD (  20.72  )
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



On 2025/1/13 11:39, Barry Song wrote:
> From: Barry Song <v-songbaohua@oppo.com>
> 
> The try_to_unmap_one() function currently handles PMD-mapped THPs
> inefficiently. It first splits the PMD into PTEs, copies the dirty
> state from the PMD to the PTEs, iterates over the PTEs to locate
> the dirty state, and then marks the THP as swap-backed. This process
> involves unnecessary PMD splitting and redundant iteration. Instead,
> this functionality can be efficiently managed in
> __discard_anon_folio_pmd_locked(), avoiding the extra steps and
> improving performance.
> 
> The following microbenchmark redirties folios after invoking MADV_FREE,
> then measures the time taken to perform memory reclamation (actually
> set those folios swapbacked again) on the redirtied folios.
> 
>   #include <stdio.h>
>   #include <sys/mman.h>
>   #include <string.h>
>   #include <time.h>
> 
>   #define SIZE 128*1024*1024  // 128 MB
> 
>   int main(int argc, char *argv[])
>   {
>   	while(1) {
>   		volatile int *p = mmap(0, SIZE, PROT_READ | PROT_WRITE,
>   				MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
> 
>   		memset((void *)p, 1, SIZE);
>   		madvise((void *)p, SIZE, MADV_FREE);
>   		/* redirty after MADV_FREE */
>   		memset((void *)p, 1, SIZE);
> 
> 		clock_t start_time = clock();
>   		madvise((void *)p, SIZE, MADV_PAGEOUT);
>   		clock_t end_time = clock();
> 
>   		double elapsed_time = (double)(end_time - start_time) / CLOCKS_PER_SEC;
>   		printf("Time taken by reclamation: %f seconds\n", elapsed_time);
> 
>   		munmap((void *)p, SIZE);
>   	}
>   	return 0;
>   }
> 
> Testing results are as below,
> w/o patch:
> ~ # ./a.out
> Time taken by reclamation: 0.007300 seconds
> Time taken by reclamation: 0.007226 seconds
> Time taken by reclamation: 0.007295 seconds
> Time taken by reclamation: 0.007731 seconds
> Time taken by reclamation: 0.007134 seconds
> Time taken by reclamation: 0.007285 seconds
> Time taken by reclamation: 0.007720 seconds
> Time taken by reclamation: 0.007128 seconds
> Time taken by reclamation: 0.007710 seconds
> Time taken by reclamation: 0.007712 seconds
> Time taken by reclamation: 0.007236 seconds
> Time taken by reclamation: 0.007690 seconds
> Time taken by reclamation: 0.007174 seconds
> Time taken by reclamation: 0.007670 seconds
> Time taken by reclamation: 0.007169 seconds
> Time taken by reclamation: 0.007305 seconds
> Time taken by reclamation: 0.007432 seconds
> Time taken by reclamation: 0.007158 seconds
> Time taken by reclamation: 0.007133 seconds
> …
> 
> w/ patch
> 
> ~ # ./a.out
> Time taken by reclamation: 0.002124 seconds
> Time taken by reclamation: 0.002116 seconds
> Time taken by reclamation: 0.002150 seconds
> Time taken by reclamation: 0.002261 seconds
> Time taken by reclamation: 0.002137 seconds
> Time taken by reclamation: 0.002173 seconds
> Time taken by reclamation: 0.002063 seconds
> Time taken by reclamation: 0.002088 seconds
> Time taken by reclamation: 0.002169 seconds
> Time taken by reclamation: 0.002124 seconds
> Time taken by reclamation: 0.002111 seconds
> Time taken by reclamation: 0.002224 seconds
> Time taken by reclamation: 0.002297 seconds
> Time taken by reclamation: 0.002260 seconds
> Time taken by reclamation: 0.002246 seconds
> Time taken by reclamation: 0.002272 seconds
> Time taken by reclamation: 0.002277 seconds
> Time taken by reclamation: 0.002462 seconds
> …
> 
> This patch significantly speeds up try_to_unmap_one() by allowing it
> to skip redirtied THPs without splitting the PMD.
> 
> Suggested-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> Suggested-by: Lance Yang <ioworker0@gmail.com>
> Signed-off-by: Barry Song <v-songbaohua@oppo.com>
> ---
>   mm/huge_memory.c | 17 ++++++++++++++---
>   mm/rmap.c        | 11 ++++++++++-
>   2 files changed, 24 insertions(+), 4 deletions(-)
> 
> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> index 3d3ebdc002d5..aea49f7125f1 100644
> --- a/mm/huge_memory.c
> +++ b/mm/huge_memory.c
> @@ -3070,8 +3070,12 @@ static bool __discard_anon_folio_pmd_locked(struct vm_area_struct *vma,
>   	int ref_count, map_count;
>   	pmd_t orig_pmd = *pmdp;
>   
> -	if (folio_test_dirty(folio) || pmd_dirty(orig_pmd))
> +	if (pmd_dirty(orig_pmd))
> +		folio_set_dirty(folio);
> +	if (folio_test_dirty(folio) && !(vma->vm_flags & VM_DROPPABLE)) {
> +		folio_set_swapbacked(folio);
>   		return false;
> +	}
>   
>   	orig_pmd = pmdp_huge_clear_flush(vma, addr, pmdp);
>   
> @@ -3098,8 +3102,15 @@ static bool __discard_anon_folio_pmd_locked(struct vm_area_struct *vma,
>   	 *
>   	 * The only folio refs must be one from isolation plus the rmap(s).
>   	 */
> -	if (folio_test_dirty(folio) || pmd_dirty(orig_pmd) ||
> -	    ref_count != map_count + 1) {
> +	if (pmd_dirty(orig_pmd))
> +		folio_set_dirty(folio);
> +	if (folio_test_dirty(folio) && !(vma->vm_flags & VM_DROPPABLE)) {
> +		folio_set_swapbacked(folio);
> +		set_pmd_at(mm, addr, pmdp, orig_pmd);
> +		return false;
> +	}
> +
> +	if (ref_count != map_count + 1) {
>   		set_pmd_at(mm, addr, pmdp, orig_pmd);
>   		return false;
>   	}
> diff --git a/mm/rmap.c b/mm/rmap.c
> index 3ef659310797..02c4e4b2cd7b 100644
> --- a/mm/rmap.c
> +++ b/mm/rmap.c
> @@ -1671,7 +1671,7 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
>   	DEFINE_FOLIO_VMA_WALK(pvmw, folio, vma, address, 0);
>   	pte_t pteval;
>   	struct page *subpage;
> -	bool anon_exclusive, ret = true;
> +	bool anon_exclusive, lazyfree, ret = true;
>   	struct mmu_notifier_range range;
>   	enum ttu_flags flags = (enum ttu_flags)(long)arg;
>   	int nr_pages = 1;
> @@ -1724,9 +1724,18 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
>   		}
>   
>   		if (!pvmw.pte) {
> +			lazyfree = folio_test_anon(folio) && !folio_test_swapbacked(folio);

You've checked lazyfree here, so can we remove the duplicate check in 
unmap_huge_pmd_locked()? Then the code should be:

		if (lazyfree && unmap_huge_pmd_locked(...))
			goto walk_done;

>   			if (unmap_huge_pmd_locked(vma, pvmw.address, pvmw.pmd,
>   						  folio))
>   				goto walk_done;
> +			/*
> +			 * unmap_huge_pmd_locked has either already marked
> +			 * the folio as swap-backed or decided to retain it
> +			 * due to GUP or speculative references.
> +			 */
> +			if (lazyfree)
> +				goto walk_abort;
>   
>   			if (flags & TTU_SPLIT_HUGE_PMD) {
>   				/*

