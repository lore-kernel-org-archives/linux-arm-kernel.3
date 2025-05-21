Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A453BC54E71
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 May 2025 14:27:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=whQyW0ip/MJuDd+Y8Jfp9nrkxQwEltJRp9mCDh0fGn0=; b=C4mTOdpSegt+wWlaYNtmOtmsZK
	4WUOALcR3xZfcV+IejdEiurwB7bJ1hCb39ViwZF/Zciz4zFv/s2G07MuJtJ/nrK9GjCuU5FHTYy05
	VkWIrQtH4+ObXSQ5RUe+GDXGO8OBLG9PJwsOaCOpnWx/DVfKWaXCc1v3gdE1nRddOI0Pqaa3KNORd
	lhIu3paFXRHjz6OC6NzCzPqgkzmXZKA/YwwQGEvw4xxbA4Ew5FOfgxDDVbys6X+46ykKMUxcBIub1
	5Ml3YPB7pZw+hGmQJlNkz1t2g+Eghid/pc2p+F2pWeGdnIDixTyaSWnlwSjDH3aUD6Y3zedCapeaz
	eQIUyIfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHkPh-0000000G6rk-3tJC;
	Wed, 21 May 2025 14:27:21 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHkDC-0000000G4UI-3WTf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 May 2025 14:14:28 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 267E11515;
	Wed, 21 May 2025 07:14:12 -0700 (PDT)
Received: from [10.57.94.227] (unknown [10.57.94.227])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4C36F3F5A1;
	Wed, 21 May 2025 07:14:22 -0700 (PDT)
Message-ID: <eb57601d-abac-492a-8e62-dc1c406af572@arm.com>
Date: Wed, 21 May 2025 15:14:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/5] arm64: Add batched version of
 ptep_modify_prot_start
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
 <20250519074824.42909-5-dev.jain@arm.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <20250519074824.42909-5-dev.jain@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250521_071426_984114_D0FFDC1E 
X-CRM114-Status: GOOD (  23.45  )
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
> Override the generic definition to use get_and_clear_full_ptes(). This helper
> does a TLBI only for the starting and ending contpte block of the range, whereas
> the current implementation will call ptep_get_and_clear() for every contpte block,
> thus doing a TLBI on every contpte block. Therefore, we have a performance win.
> The arm64 definition of pte_accessible() allows us to batch around it in clear_flush_ptes():
> #define pte_accessible(mm, pte)	\
> 	(mm_tlb_flush_pending(mm) ? pte_present(pte) : pte_valid(pte))
> 
> All ptes are obviously present in the folio batch, and they are also valid.
> 
> Signed-off-by: Dev Jain <dev.jain@arm.com>

Please squash this with the 

> ---
>  arch/arm64/include/asm/pgtable.h |  5 +++++
>  arch/arm64/mm/mmu.c              | 12 +++++++++---
>  include/linux/pgtable.h          |  4 ++++
>  mm/pgtable-generic.c             | 16 +++++++++++-----
>  4 files changed, 29 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
> index 2a77f11b78d5..8872ea5f0642 100644
> --- a/arch/arm64/include/asm/pgtable.h
> +++ b/arch/arm64/include/asm/pgtable.h
> @@ -1553,6 +1553,11 @@ extern void ptep_modify_prot_commit(struct vm_area_struct *vma,
>  				    unsigned long addr, pte_t *ptep,
>  				    pte_t old_pte, pte_t new_pte);
>  
> +#define modify_prot_start_ptes modify_prot_start_ptes
> +extern pte_t modify_prot_start_ptes(struct vm_area_struct *vma,
> +				    unsigned long addr, pte_t *ptep,
> +				    unsigned int nr);
> +
>  #ifdef CONFIG_ARM64_CONTPTE
>  
>  /*
> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
> index 8fcf59ba39db..fe60be8774f4 100644
> --- a/arch/arm64/mm/mmu.c
> +++ b/arch/arm64/mm/mmu.c
> @@ -1523,7 +1523,8 @@ static int __init prevent_bootmem_remove_init(void)
>  early_initcall(prevent_bootmem_remove_init);
>  #endif
>  
> -pte_t ptep_modify_prot_start(struct vm_area_struct *vma, unsigned long addr, pte_t *ptep)
> +pte_t modify_prot_start_ptes(struct vm_area_struct *vma, unsigned long addr,
> +			     pte_t *ptep, unsigned int nr)
>  {
>  	if (alternative_has_cap_unlikely(ARM64_WORKAROUND_2645198)) {
>  		/*
> @@ -1532,9 +1533,14 @@ pte_t ptep_modify_prot_start(struct vm_area_struct *vma, unsigned long addr, pte
>  		 * in cases where cpu is affected with errata #2645198.
>  		 */
>  		if (pte_user_exec(ptep_get(ptep)))
> -			return ptep_clear_flush(vma, addr, ptep);
> +			return clear_flush_ptes(vma, addr, ptep, nr);
>  	}
> -	return ptep_get_and_clear(vma->vm_mm, addr, ptep);
> +	return get_and_clear_full_ptes(vma->vm_mm, addr, ptep, nr, 0);
> +}

I think we can do this more precisely with respect to tlbis and also without 
needing to create a new clear_flush_ptes() helper:


pte_t modify_prot_start_ptes(struct vm_area_struct *vma, unsigned long addr,
			     pte_t *ptep, unsigned int nr)
{
	pte_t pte = get_and_clear_full_ptes(vma->vm_mm, addr, ptep, nr, 0);

	if (alternative_has_cap_unlikely(ARM64_WORKAROUND_2645198)) {
		/*
		 * Break-before-make (BBM) is required for all user space mappings
		 * when the permission changes from executable to non-executable
		 * in cases where cpu is affected with errata #2645198.
		 */
		if (pte_accessible(vma->vm_mm, pte) && pte_user_exec(pte))
			__flush_tlb_range(vma, addr, nr * PAGE_SIZE,
					  PAGE_SIZE, true, 3);
	}

	return pte;
}


> +
> +pte_t ptep_modify_prot_start(struct vm_area_struct *vma, unsigned long addr, pte_t *ptep)
> +{
> +	return modify_prot_start_ptes(vma, addr, ptep, 1);
>  }
>  
>  void ptep_modify_prot_commit(struct vm_area_struct *vma, unsigned long addr, pte_t *ptep,
> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
> index e40ed57e034d..41f4a8de5c28 100644
> --- a/include/linux/pgtable.h
> +++ b/include/linux/pgtable.h
> @@ -828,6 +828,10 @@ extern pte_t ptep_clear_flush(struct vm_area_struct *vma,
>  			      pte_t *ptep);
>  #endif
>  
> +extern pte_t clear_flush_ptes(struct vm_area_struct *vma,
> +			      unsigned long address,
> +			      pte_t *ptep, unsigned int nr);
> +
>  #ifndef __HAVE_ARCH_PMDP_HUGE_CLEAR_FLUSH
>  extern pmd_t pmdp_huge_clear_flush(struct vm_area_struct *vma,
>  			      unsigned long address,
> diff --git a/mm/pgtable-generic.c b/mm/pgtable-generic.c
> index 5a882f2b10f9..e238f88c3cac 100644
> --- a/mm/pgtable-generic.c
> +++ b/mm/pgtable-generic.c
> @@ -90,17 +90,23 @@ int ptep_clear_flush_young(struct vm_area_struct *vma,
>  }
>  #endif
>  
> -#ifndef __HAVE_ARCH_PTEP_CLEAR_FLUSH
> -pte_t ptep_clear_flush(struct vm_area_struct *vma, unsigned long address,
> -		       pte_t *ptep)
> +pte_t clear_flush_ptes(struct vm_area_struct *vma, unsigned long address,
> +		       pte_t *ptep, unsigned int nr)
>  {
>  	struct mm_struct *mm = (vma)->vm_mm;
>  	pte_t pte;
> -	pte = ptep_get_and_clear(mm, address, ptep);
> +	pte = get_and_clear_full_ptes(mm, address, ptep, nr, 0);
>  	if (pte_accessible(mm, pte))
> -		flush_tlb_page(vma, address);
> +		flush_tlb_range(vma, address, address + nr * PAGE_SIZE);
>  	return pte;
>  }

Let's not create a new generic helper if only arm64 is using it. We would 
also want to add a doc header to describe this helper. My proposal avoids 
this.

Thanks,
Ryan

> +
> +#ifndef __HAVE_ARCH_PTEP_CLEAR_FLUSH
> +pte_t ptep_clear_flush(struct vm_area_struct *vma, unsigned long address,
> +		       pte_t *ptep)
> +{
> +	return clear_flush_ptes(vma, address, ptep, 1);
> +}
>  #endif
>  
>  #ifdef CONFIG_TRANSPARENT_HUGEPAGE


