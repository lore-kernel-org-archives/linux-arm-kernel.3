Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56ABDC8302D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Jun 2025 09:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1cgzhjY+K2VUhAwhVVQwZIeHki+ZMFQ5dSzLLVQN7yw=; b=uwwXK5Ufp+eRz5ICwF0MFICrHp
	+Z+2MnQpvduh8w9o61lCOdo5EtJSlFKqnafW8dkYBApeos/j9i1Lt8ymAp7EV3Q6n8JXbqK20EYl8
	qCMgxhFWjluJUME3SGUMkIuM5keLjACJnsbe6irTVu0O/5yG7fidA30u/XQqXmX1Zu0P7JhCn39x6
	mv8ygfyTia8i9HxvItapw7tV3drzJVLUFV5yrjvNsL/DMBxGuTJ9wySGODa+y6IjSE2Q2Q5ihyCca
	Zcp0cIYRY0i8XTcKg0fYoU8iW9GlB8KhuEEgFBwe0uQMM50V0dtNoQLr7HcdGdd1Ip5ZYyJ+lA03p
	k14Scnbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWB87-00000001nEq-08bL;
	Mon, 30 Jun 2025 09:48:51 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWB2Q-00000001mHy-0aOP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Jun 2025 09:42:59 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 652AC1D34;
	Mon, 30 Jun 2025 02:42:39 -0700 (PDT)
Received: from [10.1.34.165] (XHFQ2J9959.cambridge.arm.com [10.1.34.165])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3E6DB3F6A8;
	Mon, 30 Jun 2025 02:42:50 -0700 (PDT)
Message-ID: <e029c030-2b0c-412d-b203-4342250b2deb@arm.com>
Date: Mon, 30 Jun 2025 10:42:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/4] mm: Optimize mprotect() for MM_CP_PROT_NUMA by
 batch-skipping PTEs
Content-Language: en-GB
To: Dev Jain <dev.jain@arm.com>, akpm@linux-foundation.org
Cc: david@redhat.com, willy@infradead.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, catalin.marinas@arm.com, will@kernel.org,
 Liam.Howlett@oracle.com, lorenzo.stoakes@oracle.com, vbabka@suse.cz,
 jannh@google.com, anshuman.khandual@arm.com, peterx@redhat.com,
 joey.gouly@arm.com, ioworker0@gmail.com, baohua@kernel.org,
 kevin.brodsky@arm.com, quic_zhenhuah@quicinc.com,
 christophe.leroy@csgroup.eu, yangyicong@hisilicon.com,
 linux-arm-kernel@lists.infradead.org, hughd@google.com,
 yang@os.amperecomputing.com, ziy@nvidia.com
References: <20250628113435.46678-1-dev.jain@arm.com>
 <20250628113435.46678-2-dev.jain@arm.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <20250628113435.46678-2-dev.jain@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_024258_266544_F9EDC945 
X-CRM114-Status: GOOD (  29.05  )
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

On 28/06/2025 12:34, Dev Jain wrote:
> In case of prot_numa, there are various cases in which we can skip to the
> next iteration. Since the skip condition is based on the folio and not
> the PTEs, we can skip a PTE batch. Additionally refactor all of this
> into a new function to clean up the existing code.
> 
> Signed-off-by: Dev Jain <dev.jain@arm.com>
> ---
>  mm/mprotect.c | 134 ++++++++++++++++++++++++++++++++------------------
>  1 file changed, 87 insertions(+), 47 deletions(-)
> 
> diff --git a/mm/mprotect.c b/mm/mprotect.c
> index 88709c01177b..af10a7fbe6b8 100644
> --- a/mm/mprotect.c
> +++ b/mm/mprotect.c
> @@ -83,6 +83,83 @@ bool can_change_pte_writable(struct vm_area_struct *vma, unsigned long addr,
>  	return pte_dirty(pte);
>  }
>  
> +static int mprotect_folio_pte_batch(struct folio *folio, unsigned long addr,
> +		pte_t *ptep, pte_t pte, int max_nr_ptes)
> +{
> +	const fpb_t flags = FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY;
> +
> +	if (!folio || !folio_test_large(folio) || (max_nr_ptes == 1))

The !folio check wasn't in the previous version. Why is it needed now?

> +		return 1;
> +
> +	return folio_pte_batch(folio, addr, ptep, pte, max_nr_ptes, flags,
> +			       NULL, NULL, NULL);
> +}
> +
> +static int prot_numa_skip_ptes(struct folio **foliop, struct vm_area_struct *vma,
> +		unsigned long addr, pte_t oldpte, pte_t *pte, int target_node,
> +		int max_nr_ptes)
> +{
> +	struct folio *folio = NULL;
> +	int nr_ptes = 1;
> +	bool toptier;
> +	int nid;
> +
> +	/* Avoid TLB flush if possible */
> +	if (pte_protnone(oldpte))
> +		goto skip_batch;
> +
> +	folio = vm_normal_folio(vma, addr, oldpte);
> +	if (!folio)
> +		goto skip_batch;
> +
> +	if (folio_is_zone_device(folio) || folio_test_ksm(folio))
> +		goto skip_batch;
> +
> +	/* Also skip shared copy-on-write pages */
> +	if (is_cow_mapping(vma->vm_flags) &&
> +	    (folio_maybe_dma_pinned(folio) || folio_maybe_mapped_shared(folio)))
> +		goto skip_batch;
> +
> +	/*
> +	 * While migration can move some dirty pages,
> +	 * it cannot move them all from MIGRATE_ASYNC
> +	 * context.
> +	 */
> +	if (folio_is_file_lru(folio) && folio_test_dirty(folio))
> +		goto skip_batch;
> +
> +	/*
> +	 * Don't mess with PTEs if page is already on the node
> +	 * a single-threaded process is running on.
> +	 */
> +	nid = folio_nid(folio);
> +	if (target_node == nid)
> +		goto skip_batch;
> +
> +	toptier = node_is_toptier(nid);
> +
> +	/*
> +	 * Skip scanning top tier node if normal numa
> +	 * balancing is disabled
> +	 */
> +	if (!(sysctl_numa_balancing_mode & NUMA_BALANCING_NORMAL) && toptier)
> +		goto skip_batch;
> +
> +	if (folio_use_access_time(folio)) {
> +		folio_xchg_access_time(folio, jiffies_to_msecs(jiffies));
> +
> +		/* Do not skip in this case */
> +		nr_ptes = 0;
> +		goto out;

This doesn't smell right... perhaps I'm not understanding the logic. Why do you
return nr_ptes = 0 if you end up in this conditional, but nr_ptes = 1 if you
don't take this conditional? I think you want to return nr_ptes == 0 for both
cases?...

> +	}
> +
> +skip_batch:
> +	nr_ptes = mprotect_folio_pte_batch(folio, addr, pte, oldpte, max_nr_ptes);
> +out:
> +	*foliop = folio;
> +	return nr_ptes;
> +}
> +
>  static long change_pte_range(struct mmu_gather *tlb,
>  		struct vm_area_struct *vma, pmd_t *pmd, unsigned long addr,
>  		unsigned long end, pgprot_t newprot, unsigned long cp_flags)
> @@ -94,6 +171,7 @@ static long change_pte_range(struct mmu_gather *tlb,
>  	bool prot_numa = cp_flags & MM_CP_PROT_NUMA;
>  	bool uffd_wp = cp_flags & MM_CP_UFFD_WP;
>  	bool uffd_wp_resolve = cp_flags & MM_CP_UFFD_WP_RESOLVE;
> +	int nr_ptes;
>  
>  	tlb_change_page_size(tlb, PAGE_SIZE);
>  	pte = pte_offset_map_lock(vma->vm_mm, pmd, addr, &ptl);
> @@ -108,8 +186,11 @@ static long change_pte_range(struct mmu_gather *tlb,
>  	flush_tlb_batched_pending(vma->vm_mm);
>  	arch_enter_lazy_mmu_mode();
>  	do {
> +		nr_ptes = 1;
>  		oldpte = ptep_get(pte);
>  		if (pte_present(oldpte)) {
> +			int max_nr_ptes = (end - addr) >> PAGE_SHIFT;
> +			struct folio *folio = NULL;
>  			pte_t ptent;
>  
>  			/*
> @@ -117,53 +198,12 @@ static long change_pte_range(struct mmu_gather *tlb,
>  			 * pages. See similar comment in change_huge_pmd.
>  			 */
>  			if (prot_numa) {
> -				struct folio *folio;
> -				int nid;
> -				bool toptier;
> -
> -				/* Avoid TLB flush if possible */
> -				if (pte_protnone(oldpte))
> -					continue;
> -
> -				folio = vm_normal_folio(vma, addr, oldpte);
> -				if (!folio || folio_is_zone_device(folio) ||
> -				    folio_test_ksm(folio))
> -					continue;
> -
> -				/* Also skip shared copy-on-write pages */
> -				if (is_cow_mapping(vma->vm_flags) &&
> -				    (folio_maybe_dma_pinned(folio) ||
> -				     folio_maybe_mapped_shared(folio)))
> -					continue;
> -
> -				/*
> -				 * While migration can move some dirty pages,
> -				 * it cannot move them all from MIGRATE_ASYNC
> -				 * context.
> -				 */
> -				if (folio_is_file_lru(folio) &&
> -				    folio_test_dirty(folio))
> -					continue;
> -
> -				/*
> -				 * Don't mess with PTEs if page is already on the node
> -				 * a single-threaded process is running on.
> -				 */
> -				nid = folio_nid(folio);
> -				if (target_node == nid)
> -					continue;
> -				toptier = node_is_toptier(nid);
> -
> -				/*
> -				 * Skip scanning top tier node if normal numa
> -				 * balancing is disabled
> -				 */
> -				if (!(sysctl_numa_balancing_mode & NUMA_BALANCING_NORMAL) &&
> -				    toptier)
> +				nr_ptes = prot_numa_skip_ptes(&folio, vma,
> +							      addr, oldpte, pte,
> +							      target_node,
> +							      max_nr_ptes);
> +				if (nr_ptes)
>  					continue;

...But now here nr_ptes == 0 for the "don't skip" case, so won't you process
that PTE twice because while (pte += nr_ptes, ...) won't advance it?

Suggest forcing nr_ptes = 1 after this conditional "continue"?

Thanks,
Ryan


> -				if (folio_use_access_time(folio))
> -					folio_xchg_access_time(folio,
> -						jiffies_to_msecs(jiffies));
>  			}
>  
>  			oldpte = ptep_modify_prot_start(vma, addr, pte);
> @@ -280,7 +320,7 @@ static long change_pte_range(struct mmu_gather *tlb,
>  				pages++;
>  			}
>  		}
> -	} while (pte++, addr += PAGE_SIZE, addr != end);
> +	} while (pte += nr_ptes, addr += nr_ptes * PAGE_SIZE, addr != end);
>  	arch_leave_lazy_mmu_mode();
>  	pte_unmap_unlock(pte - 1, ptl);
>  


