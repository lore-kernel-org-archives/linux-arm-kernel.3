Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7816EC2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 May 2025 12:02:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DfQkYQfqeMSURiM/DFU9h+9CEORjXc9d9ebItDMOWts=; b=1HAcctakstAiInQFtfIE73kmBW
	y9Q/1BrKe5hnGBOV4cwwIlbsjKFXYMI+WAddbJTPsS/L/wqNo424uKS/hOtF6a1NFBPSKxnOOVkW3
	psGRTcbdAWwi/o+prFHvz7497P2z2B8XJB4S/BHPprQhws9IanrfJ7bZeSibTvMi/S7Z8zADIhJjo
	ExeZ79PZWS0Ve4q4htgahVdchv/nYnJmfOCO8tB+cLms28vQUFc96cOihVxAetGP26dzTKZM7YCwr
	vag7rSs0WNSM4wZfpU4N51K7mrZbIf/PYynrfoN8PvRrpGBIlZEv2g1V+qhIA5jWLzvqxcPLuY2mW
	aDTakTmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHi9I-0000000FiPk-14jn;
	Wed, 21 May 2025 12:02:16 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHi5y-0000000FhoH-1ACf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 May 2025 11:58:51 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 092FB1515;
	Wed, 21 May 2025 04:58:36 -0700 (PDT)
Received: from [10.57.94.227] (unknown [10.57.94.227])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1B24B3F5A1;
	Wed, 21 May 2025 04:58:45 -0700 (PDT)
Message-ID: <00555927-bfa1-4df0-8107-7080447acaa6@arm.com>
Date: Wed, 21 May 2025 12:58:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/5] mm: Optimize mprotect() by batch-skipping PTEs
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
References: <20250519074824.42909-1-dev.jain@arm.com>
 <20250519074824.42909-2-dev.jain@arm.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <20250519074824.42909-2-dev.jain@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250521_045850_415593_0622E632 
X-CRM114-Status: GOOD (  22.46  )
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

On 19/05/2025 08:48, Dev Jain wrote:
> In case of prot_numa, there are various cases in which we can skip to the
> next iteration. Since the skip condition is based on the folio and not
> the PTEs, we can skip a PTE batch.
> 
> Signed-off-by: Dev Jain <dev.jain@arm.com>
> ---
>  mm/mprotect.c | 36 +++++++++++++++++++++++++++++-------
>  1 file changed, 29 insertions(+), 7 deletions(-)
> 
> diff --git a/mm/mprotect.c b/mm/mprotect.c
> index 88608d0dc2c2..1ee160ed0b14 100644
> --- a/mm/mprotect.c
> +++ b/mm/mprotect.c
> @@ -83,6 +83,18 @@ bool can_change_pte_writable(struct vm_area_struct *vma, unsigned long addr,
>  	return pte_dirty(pte);
>  }
>  
> +static int mprotect_batch(struct folio *folio, unsigned long addr, pte_t *ptep,

Perhaps it should be called mprotect_folio_pte_batch() to match the existing
madvise_folio_pte_batch()?

> +		pte_t pte, int max_nr_ptes)
> +{
> +	const fpb_t flags = FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY;
> +
> +	if (!folio_test_large(folio) || (max_nr_ptes == 1))
> +		return 1;
> +
> +	return folio_pte_batch(folio, addr, ptep, pte, max_nr_ptes, flags,
> +			       NULL, NULL, NULL);
> +}
> +
>  static long change_pte_range(struct mmu_gather *tlb,
>  		struct vm_area_struct *vma, pmd_t *pmd, unsigned long addr,
>  		unsigned long end, pgprot_t newprot, unsigned long cp_flags)
> @@ -94,6 +106,7 @@ static long change_pte_range(struct mmu_gather *tlb,
>  	bool prot_numa = cp_flags & MM_CP_PROT_NUMA;
>  	bool uffd_wp = cp_flags & MM_CP_UFFD_WP;
>  	bool uffd_wp_resolve = cp_flags & MM_CP_UFFD_WP_RESOLVE;
> +	int nr_ptes;
>  
>  	tlb_change_page_size(tlb, PAGE_SIZE);
>  	pte = pte_offset_map_lock(vma->vm_mm, pmd, addr, &ptl);
> @@ -108,8 +121,10 @@ static long change_pte_range(struct mmu_gather *tlb,
>  	flush_tlb_batched_pending(vma->vm_mm);
>  	arch_enter_lazy_mmu_mode();
>  	do {
> +		nr_ptes = 1;
>  		oldpte = ptep_get(pte);
>  		if (pte_present(oldpte)) {
> +			int max_nr_ptes = (end - addr) >> PAGE_SHIFT;
>  			pte_t ptent;
>  
>  			/*
> @@ -126,15 +141,18 @@ static long change_pte_range(struct mmu_gather *tlb,
>  					continue;
>  
>  				folio = vm_normal_folio(vma, addr, oldpte);
> -				if (!folio || folio_is_zone_device(folio) ||
> -				    folio_test_ksm(folio))
> +				if (!folio)
>  					continue;

You modify mprotect_batch() to handle folio == NULL later, perhaps just add that
here, then you don't need to unpick this conditional and can just goto
skip_branch, even for the !folio case.

Thanks,
Ryan

>  
> +				if (folio_is_zone_device(folio) ||
> +				    folio_test_ksm(folio))
> +					goto skip_batch;
> +
>  				/* Also skip shared copy-on-write pages */
>  				if (is_cow_mapping(vma->vm_flags) &&
>  				    (folio_maybe_dma_pinned(folio) ||
>  				     folio_maybe_mapped_shared(folio)))
> -					continue;
> +					goto skip_batch;
>  
>  				/*
>  				 * While migration can move some dirty pages,
> @@ -143,7 +161,7 @@ static long change_pte_range(struct mmu_gather *tlb,
>  				 */
>  				if (folio_is_file_lru(folio) &&
>  				    folio_test_dirty(folio))
> -					continue;
> +					goto skip_batch;
>  
>  				/*
>  				 * Don't mess with PTEs if page is already on the node
> @@ -151,7 +169,7 @@ static long change_pte_range(struct mmu_gather *tlb,
>  				 */
>  				nid = folio_nid(folio);
>  				if (target_node == nid)
> -					continue;
> +					goto skip_batch;
>  				toptier = node_is_toptier(nid);
>  
>  				/*
> @@ -159,8 +177,12 @@ static long change_pte_range(struct mmu_gather *tlb,
>  				 * balancing is disabled
>  				 */
>  				if (!(sysctl_numa_balancing_mode & NUMA_BALANCING_NORMAL) &&
> -				    toptier)
> +				    toptier) {
> +skip_batch:
> +					nr_ptes = mprotect_batch(folio, addr, pte,
> +								 oldpte, max_nr_ptes);
>  					continue;
> +				}
>  				if (folio_use_access_time(folio))
>  					folio_xchg_access_time(folio,
>  						jiffies_to_msecs(jiffies));
> @@ -280,7 +302,7 @@ static long change_pte_range(struct mmu_gather *tlb,
>  				pages++;
>  			}
>  		}
> -	} while (pte++, addr += PAGE_SIZE, addr != end);
> +	} while (pte += nr_ptes, addr += nr_ptes * PAGE_SIZE, addr != end);
>  	arch_leave_lazy_mmu_mode();
>  	pte_unmap_unlock(pte - 1, ptl);
>  


