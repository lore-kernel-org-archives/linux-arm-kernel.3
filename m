Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9EA7C83F27
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Jul 2025 11:48:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rCLpGdWUS8REAwOwDqtj2Tc6HRfOgEsVFR54SmJidZ8=; b=SoQBbyNBjQ2BKX9/Qftg0RKVhE
	VKhGPuTDljGQzqJC2Y1kSpmffpndlhQnIUFHafkbuvT772S/sYxPc3ZUBAX+MRCxC7JqOnJoN6Rpc
	PKiaD3wfZLDsdOxGIxkLDVkBPw9H81pxP9WHr0/4E1TwiQx6WROevDSk1qM/lkbbSx5A77J8Zddk4
	NKReHTth/sGw1vu2toT3Md60+wQZuhqnF/lz75GKBGAxhgy1IVvAIx+QPxucFiiCAtrVyOVe8aCwN
	/i2cRcHbFj9IW1VmcXSTCbOve2zm/8mkm8jvvxpg9uirMVb4gv1QHCJwoeZS3T4AjlAp1JlDqS1Mj
	g64821Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueBTg-00000002Ke1-2wDW;
	Tue, 22 Jul 2025 11:48:12 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueBH0-00000002IVE-3o1I
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Jul 2025 11:35:08 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D8A33152B;
	Tue, 22 Jul 2025 04:35:00 -0700 (PDT)
Received: from [10.1.30.167] (XHFQ2J9959.cambridge.arm.com [10.1.30.167])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6488A3F66E;
	Tue, 22 Jul 2025 04:35:03 -0700 (PDT)
Message-ID: <8f375e61-1a6d-4d9c-8980-849c0ab29063@arm.com>
Date: Tue, 22 Jul 2025 12:35:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/7] mm: Add batched versions of
 ptep_modify_prot_start/commit
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
References: <20250718090244.21092-1-dev.jain@arm.com>
 <20250718090244.21092-4-dev.jain@arm.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <20250718090244.21092-4-dev.jain@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_043507_055071_7D97206F 
X-CRM114-Status: GOOD (  28.60  )
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

On 18/07/2025 10:02, Dev Jain wrote:
> Batch ptep_modify_prot_start/commit in preparation for optimizing mprotect,
> implementing them as a simple loop over the corresponding single pte
> helpers. Architecture may override these helpers.
> 
> Signed-off-by: Dev Jain <dev.jain@arm.com>

Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>

> ---
>  include/linux/pgtable.h | 84 ++++++++++++++++++++++++++++++++++++++++-
>  mm/mprotect.c           |  4 +-
>  2 files changed, 85 insertions(+), 3 deletions(-)
> 
> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
> index cf1515c163e2..e3b99920be05 100644
> --- a/include/linux/pgtable.h
> +++ b/include/linux/pgtable.h
> @@ -1331,7 +1331,9 @@ static inline pte_t ptep_modify_prot_start(struct vm_area_struct *vma,
>  
>  /*
>   * Commit an update to a pte, leaving any hardware-controlled bits in
> - * the PTE unmodified.
> + * the PTE unmodified. The pte returned from ptep_modify_prot_start() may
> + * additionally have young and/or dirty bits set where previously they were not,
> + * so the updated pte may have these additional changes.

nit: I still find this difficult to parse (Although I expect you might tell me
that this is the text I suggested last time around :) ). I think you mean that
"it is permissable for young and/or dirty bits to be set in old_pte, despite
beling clear when originally returned by ptep_modify_prot_start()".

Anyway, no big deal. I think we all know what it's getting at.

Thanks,
Ryan


>   */
>  static inline void ptep_modify_prot_commit(struct vm_area_struct *vma,
>  					   unsigned long addr,
> @@ -1340,6 +1342,86 @@ static inline void ptep_modify_prot_commit(struct vm_area_struct *vma,
>  	__ptep_modify_prot_commit(vma, addr, ptep, pte);
>  }
>  #endif /* __HAVE_ARCH_PTEP_MODIFY_PROT_TRANSACTION */
> +
> +/**
> + * modify_prot_start_ptes - Start a pte protection read-modify-write transaction
> + * over a batch of ptes, which protects against asynchronous hardware
> + * modifications to the ptes. The intention is not to prevent the hardware from
> + * making pte updates, but to prevent any updates it may make from being lost.
> + * Please see the comment above ptep_modify_prot_start() for full description.
> + *
> + * @vma: The virtual memory area the pages are mapped into.
> + * @addr: Address the first page is mapped at.
> + * @ptep: Page table pointer for the first entry.
> + * @nr: Number of entries.
> + *
> + * May be overridden by the architecture; otherwise, implemented as a simple
> + * loop over ptep_modify_prot_start(), collecting the a/d bits from each pte
> + * in the batch.
> + *
> + * Note that PTE bits in the PTE batch besides the PFN can differ.
> + *
> + * Context: The caller holds the page table lock.  The PTEs map consecutive
> + * pages that belong to the same folio. All other PTE bits must be identical for
> + * all PTEs in the batch except for young and dirty bits.  The PTEs are all in
> + * the same PMD.
> + */
> +#ifndef modify_prot_start_ptes
> +static inline pte_t modify_prot_start_ptes(struct vm_area_struct *vma,
> +		unsigned long addr, pte_t *ptep, unsigned int nr)
> +{
> +	pte_t pte, tmp_pte;
> +
> +	pte = ptep_modify_prot_start(vma, addr, ptep);
> +	while (--nr) {
> +		ptep++;
> +		addr += PAGE_SIZE;
> +		tmp_pte = ptep_modify_prot_start(vma, addr, ptep);
> +		if (pte_dirty(tmp_pte))
> +			pte = pte_mkdirty(pte);
> +		if (pte_young(tmp_pte))
> +			pte = pte_mkyoung(pte);
> +	}
> +	return pte;
> +}
> +#endif
> +
> +/**
> + * modify_prot_commit_ptes - Commit an update to a batch of ptes, leaving any
> + * hardware-controlled bits in the PTE unmodified.
> + *
> + * @vma: The virtual memory area the pages are mapped into.
> + * @addr: Address the first page is mapped at.
> + * @ptep: Page table pointer for the first entry.
> + * @old_pte: Old page table entry (for the first entry) which is now cleared.
> + * @pte: New page table entry to be set.
> + * @nr: Number of entries.
> + *
> + * May be overridden by the architecture; otherwise, implemented as a simple
> + * loop over ptep_modify_prot_commit().
> + *
> + * Context: The caller holds the page table lock. The PTEs are all in the same
> + * PMD. On exit, the set ptes in the batch map the same folio. The ptes set by
> + * ptep_modify_prot_start() may additionally have young and/or dirty bits set
> + * where previously they were not, so the updated ptes may have these
> + * additional changes.
> + */
> +#ifndef modify_prot_commit_ptes
> +static inline void modify_prot_commit_ptes(struct vm_area_struct *vma, unsigned long addr,
> +		pte_t *ptep, pte_t old_pte, pte_t pte, unsigned int nr)
> +{
> +	int i;
> +
> +	for (i = 0; i < nr; ++i, ++ptep, addr += PAGE_SIZE) {
> +		ptep_modify_prot_commit(vma, addr, ptep, old_pte, pte);
> +
> +		/* Advance PFN only, set same prot */
> +		old_pte = pte_next_pfn(old_pte);
> +		pte = pte_next_pfn(pte);
> +	}
> +}
> +#endif
> +
>  #endif /* CONFIG_MMU */
>  
>  /*
> diff --git a/mm/mprotect.c b/mm/mprotect.c
> index 97adc62c50ab..4977f198168e 100644
> --- a/mm/mprotect.c
> +++ b/mm/mprotect.c
> @@ -204,7 +204,7 @@ static long change_pte_range(struct mmu_gather *tlb,
>  				}
>  			}
>  
> -			oldpte = ptep_modify_prot_start(vma, addr, pte);
> +			oldpte = modify_prot_start_ptes(vma, addr, pte, nr_ptes);
>  			ptent = pte_modify(oldpte, newprot);
>  
>  			if (uffd_wp)
> @@ -230,7 +230,7 @@ static long change_pte_range(struct mmu_gather *tlb,
>  			    can_change_pte_writable(vma, addr, ptent))
>  				ptent = pte_mkwrite(ptent, vma);
>  
> -			ptep_modify_prot_commit(vma, addr, pte, oldpte, ptent);
> +			modify_prot_commit_ptes(vma, addr, pte, oldpte, ptent, nr_ptes);
>  			if (pte_needs_flush(oldpte, ptent))
>  				tlb_flush_pte_range(tlb, addr, PAGE_SIZE);
>  			pages++;


