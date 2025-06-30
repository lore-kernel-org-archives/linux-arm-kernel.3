Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87767C8302D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Jun 2025 10:24:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=odcu7nnUmXKebXvYQD8nU2XRX2NcefscWVOfflxgmrU=; b=bq72giHcXuoUTurkYSFFJzaMyX
	i0YcnWgCDh+45KN/l3vBDouFtlT4cClz5J4jMmIlUPzpgEAD75snuVAgWoTAmbCyuasaKzAf7sM8L
	ldl+vGbnC5s9nn0ulWExGfq7tsa3s+mXzRnQ/4i0dq4nRYPqpDfcPraKIMQXyYW9n3Ui+2ENIzr8e
	JIE3hS3qrlCQMzBr72igxwetMzRMmGvCI1yeBgkeVRAmO0Tx+qIGawOFdGeW9cTiqaY6rupYJ0di7
	Fc6efjXMx+M6h6FKbkk5BRd/NNAAaXNb+IvhvfKtop65UBlCtbBxf9Tcc2nmEQPZV9obQXK7dz+ds
	hnJW0S+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWBgP-00000001sa0-29oN;
	Mon, 30 Jun 2025 10:24:17 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWBSz-00000001qNi-08rR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Jun 2025 10:10:26 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8A8F91D34;
	Mon, 30 Jun 2025 03:10:08 -0700 (PDT)
Received: from [10.1.34.165] (XHFQ2J9959.cambridge.arm.com [10.1.34.165])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2E1573F58B;
	Mon, 30 Jun 2025 03:10:18 -0700 (PDT)
Message-ID: <5f2eb53d-5fce-411f-857b-2ac16295a9f9@arm.com>
Date: Mon, 30 Jun 2025 11:10:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] mm: Add batched versions of
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
References: <20250628113435.46678-1-dev.jain@arm.com>
 <20250628113435.46678-3-dev.jain@arm.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <20250628113435.46678-3-dev.jain@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_031025_161071_EDA2FC53 
X-CRM114-Status: GOOD (  30.78  )
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
> Batch ptep_modify_prot_start/commit in preparation for optimizing mprotect.
> Architecture can override these helpers; in case not, they are implemented
> as a simple loop over the corresponding single pte helpers.
> 
> Signed-off-by: Dev Jain <dev.jain@arm.com>
> ---
>  include/linux/pgtable.h | 83 ++++++++++++++++++++++++++++++++++++++++-
>  mm/mprotect.c           |  4 +-
>  2 files changed, 84 insertions(+), 3 deletions(-)
> 
> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
> index cf1515c163e2..662f39e7475a 100644
> --- a/include/linux/pgtable.h
> +++ b/include/linux/pgtable.h
> @@ -1331,7 +1331,8 @@ static inline pte_t ptep_modify_prot_start(struct vm_area_struct *vma,
>  
>  /*
>   * Commit an update to a pte, leaving any hardware-controlled bits in
> - * the PTE unmodified.
> + * the PTE unmodified. The pte may have been "upgraded" w.r.t a/d bits compared
> + * to the old_pte, as in, it may have a/d bits on which were off in old_pte.

I find this last sentance a bit confusing. I think what you are trying to say is
somehthing like:

"""
old_pte is the value returned from ptep_modify_prot_start() but may additionally
have have young and/or dirty bits set where previously they were not.
"""

?

>   */
>  static inline void ptep_modify_prot_commit(struct vm_area_struct *vma,
>  					   unsigned long addr,
> @@ -1340,6 +1341,86 @@ static inline void ptep_modify_prot_commit(struct vm_area_struct *vma,
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
> + * pages that belong to the same folio.  The PTEs are all in the same PMD.
> + * Since the batch is determined from folio_pte_batch, the PTEs must differ
> + * only in a/d bits (and the soft dirty bit; see fpb_t flags in
> + * mprotect_folio_pte_batch()).

This last sentence is confusing... You had previous said the PFN can differ, but
here you imply on a, d and sd bits are allowed to differ.

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
> + * PMD. On exit, the set ptes in the batch map the same folio. The pte may have
> + * been "upgraded" w.r.t a/d bits compared to the old_pte, as in, it may have
> + * a/d bits on which were off in old_pte.

Same comment as for ptep_modify_prot_start().

> + */
> +#ifndef modify_prot_commit_ptes
> +static inline void modify_prot_commit_ptes(struct vm_area_struct *vma, unsigned long addr,
> +		pte_t *ptep, pte_t old_pte, pte_t pte, unsigned int nr)
> +{
> +	int i;
> +
> +	for (i = 0; i < nr; ++i) {
> +		ptep_modify_prot_commit(vma, addr, ptep, old_pte, pte);
> +		ptep++;
> +		addr += PAGE_SIZE;
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
> index af10a7fbe6b8..627b0d67cc4a 100644
> --- a/mm/mprotect.c
> +++ b/mm/mprotect.c
> @@ -206,7 +206,7 @@ static long change_pte_range(struct mmu_gather *tlb,
>  					continue;
>  			}
>  
> -			oldpte = ptep_modify_prot_start(vma, addr, pte);
> +			oldpte = modify_prot_start_ptes(vma, addr, pte, nr_ptes);

You're calling this with nr_ptes = 0 for the prot_numa case. But the
implementation expects minimum nr_ptes == 1.

>  			ptent = pte_modify(oldpte, newprot);
>  
>  			if (uffd_wp)
> @@ -232,7 +232,7 @@ static long change_pte_range(struct mmu_gather *tlb,
>  			    can_change_pte_writable(vma, addr, ptent))
>  				ptent = pte_mkwrite(ptent, vma);
>  
> -			ptep_modify_prot_commit(vma, addr, pte, oldpte, ptent);
> +			modify_prot_commit_ptes(vma, addr, pte, oldpte, ptent, nr_ptes);
>  			if (pte_needs_flush(oldpte, ptent))
>  				tlb_flush_pte_range(tlb, addr, PAGE_SIZE);
>  			pages++;


