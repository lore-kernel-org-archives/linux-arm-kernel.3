Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 030FFC71133
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 22:48:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CFDo/s61HGI/ipYvEEpeQoPYlsEk7fdY5FiMLmsXslU=; b=ZL5NrklQ7N4SNjt5P6J7no2hb6
	suYLpaLJP+1ihmPEmXGij8Dh5whcMWViJT4Zozm8VVeiDG6uSb2Tu7s6qa/Gkg+vXKoJ9liKVzIYx
	emDoGnwZp5kjGypt42nY+Gac/GMDCj580jKyZOyn/BqcMZNRv8ONOB69VVVVu61uSGTKEuDdqzUBZ
	LIqqCQw2DGK7eKvRFA5PaQxLqeq+3blVXq5EQXKkgYPtTZk9wQwxIafZERBRMgYXFPd5SsgWCF+wC
	cy4uc8QwiuMfyq77QwGA4C+izXp4z4q7pnjrVXpKNeCExRhd1a0QuYAPbavJ1t10YHO6HY0jCDA6E
	7FwSJVcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP7lp-00000008Fmw-0wul;
	Tue, 10 Jun 2025 22:48:41 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP4DF-00000007s4P-0Fzl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 19:00:46 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BD0421691;
	Tue, 10 Jun 2025 12:00:24 -0700 (PDT)
Received: from [10.57.82.150] (unknown [10.57.82.150])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 22EAE3F66E;
	Tue, 10 Jun 2025 12:00:41 -0700 (PDT)
Message-ID: <e10d0c8f-c86b-4e26-8006-f38734993796@arm.com>
Date: Tue, 10 Jun 2025 20:00:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: Enable vmalloc-huge with ptdump
Content-Language: en-GB
To: Dev Jain <dev.jain@arm.com>, catalin.marinas@arm.com, will@kernel.org
Cc: anshuman.khandual@arm.com, quic_zhenhuah@quicinc.com,
 kevin.brodsky@arm.com, yangyicong@hisilicon.com, joey.gouly@arm.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 david@redhat.com
References: <20250610160048.11254-1-dev.jain@arm.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <20250610160048.11254-1-dev.jain@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_120045_188394_8E781AD4 
X-CRM114-Status: GOOD (  28.17  )
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

On 10/06/2025 17:00, Dev Jain wrote:
> arm64 disables vmalloc-huge when kernel page table dumping is enabled,
> because an intermediate table may be removed, potentially causing the
> ptdump code to dereference an invalid address. We want to be able to
> analyze block vs page mappings for kernel mappings with ptdump, so to
> enable vmalloc-huge with ptdump, synchronize between page table removal in
> pmd_free_pte_page()/pud_free_pmd_page() and ptdump pagetable walking. We
> use mmap_read_lock and not write lock because we don't need to synchronize
> between two different vm_structs; two vmalloc objects running this same
> code path will point to different page tables, hence there is no race.
> 
> For pud_free_pmd_page(), we isolate the PMD table to avoid taking the lock
> 512 times again via pmd_free_pte_page(). Note that there is no need to
> move __flush_tlb_kernel_pgtable() to immediately after pud_clear(); the
> only argument against this would be that we immediately require a
> dsb(ishst) (present in __flush_tlb_kernel_pgtable()) after pud_clear(),
> but that is not the case, since the transition is from
> valid -> invalid, not vice-versa.
> 
> No issues were observed with mm-selftests. No issues were observed while
> parallelly running test_vmalloc.sh and dumping the kernel pagetable through
> sysfs in a loop.
> 
> v1->v2:
>  - Take lock only when CONFIG_PTDUMP_DEBUGFS is on

I thought we agreed that we would use a static key and some rcu synchronize
magic? What was the reason for taking this approach?

I'm guessing CONFIG_PTDUMP_DEBUGFS is very much a debug feature that we wouldn't
expect to enable in production kernels; if that's the case, then perhaps this
approach is good enough. But given Will suggested a solution that would make it
zero overhead when ptdump is not active, why not just take that approach?

Thanks,
Ryan

>  - In case of pud_free_pmd_page(), isolate the PMD table to avoid taking
>    the lock 512 times again via pmd_free_pte_page()
> 
> Signed-off-by: Dev Jain <dev.jain@arm.com>
> ---
>  arch/arm64/include/asm/vmalloc.h |  6 ++---
>  arch/arm64/mm/mmu.c              | 43 +++++++++++++++++++++++++++++---
>  2 files changed, 42 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/vmalloc.h b/arch/arm64/include/asm/vmalloc.h
> index 12f534e8f3ed..e835fd437ae0 100644
> --- a/arch/arm64/include/asm/vmalloc.h
> +++ b/arch/arm64/include/asm/vmalloc.h
> @@ -12,15 +12,13 @@ static inline bool arch_vmap_pud_supported(pgprot_t prot)
>  	/*
>  	 * SW table walks can't handle removal of intermediate entries.
>  	 */
> -	return pud_sect_supported() &&
> -	       !IS_ENABLED(CONFIG_PTDUMP_DEBUGFS);
> +	return pud_sect_supported();
>  }
>  
>  #define arch_vmap_pmd_supported arch_vmap_pmd_supported
>  static inline bool arch_vmap_pmd_supported(pgprot_t prot)
>  {
> -	/* See arch_vmap_pud_supported() */
> -	return !IS_ENABLED(CONFIG_PTDUMP_DEBUGFS);
> +	return true;
>  }
>  
>  #define arch_vmap_pte_range_map_size arch_vmap_pte_range_map_size
> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
> index 8fcf59ba39db..fa98a62e4baf 100644
> --- a/arch/arm64/mm/mmu.c
> +++ b/arch/arm64/mm/mmu.c
> @@ -1267,7 +1267,25 @@ int pmd_clear_huge(pmd_t *pmdp)
>  	return 1;
>  }
>  
> -int pmd_free_pte_page(pmd_t *pmdp, unsigned long addr)
> +#ifdef CONFIG_PTDUMP_DEBUGFS
> +static inline void ptdump_synchronize_lock(void)
> +{
> +	/* Synchronize against ptdump_walk_pgd() */
> +	mmap_read_lock(&init_mm);
> +}
> +
> +static inline void ptdump_synchronize_unlock(void)
> +{
> +	mmap_read_unlock(&init_mm);
> +}
> +#else	/* CONFIG_PTDUMP_DEBUGFS */
> +
> +static inline void ptdump_synchronize_lock(void)	{}
> +static inline void ptdump_synchronize_unlock(void)	{}
> +
> +#endif	/* CONFIG_PTDUMP_DEBUGFS */
> +
> +static int __pmd_free_pte_page(pmd_t *pmdp, unsigned long addr, bool lock)
>  {
>  	pte_t *table;
>  	pmd_t pmd;
> @@ -1280,12 +1298,23 @@ int pmd_free_pte_page(pmd_t *pmdp, unsigned long addr)
>  	}
>  
>  	table = pte_offset_kernel(pmdp, addr);
> +
> +	if (lock)
> +		ptdump_synchronize_lock();
>  	pmd_clear(pmdp);
> +	if (lock)
> +		ptdump_synchronize_unlock();
> +
>  	__flush_tlb_kernel_pgtable(addr);
>  	pte_free_kernel(NULL, table);
>  	return 1;
>  }
>  
> +int pmd_free_pte_page(pmd_t *pmdp, unsigned long addr)
> +{
> +	return __pmd_free_pte_page(pmdp, addr, true);
> +}
> +
>  int pud_free_pmd_page(pud_t *pudp, unsigned long addr)
>  {
>  	pmd_t *table;
> @@ -1301,14 +1330,22 @@ int pud_free_pmd_page(pud_t *pudp, unsigned long addr)
>  	}
>  
>  	table = pmd_offset(pudp, addr);
> +
> +	/*
> +	 * Isolate the PMD table; in case of race with ptdump, this helps
> +	 * us to avoid taking the lock in __pmd_free_pte_page()
> +	 */
> +	ptdump_synchronize_lock();
> +	pud_clear(pudp);
> +	ptdump_synchronize_unlock();
> +
>  	pmdp = table;
>  	next = addr;
>  	end = addr + PUD_SIZE;
>  	do {
> -		pmd_free_pte_page(pmdp, next);
> +		__pmd_free_pte_page(pmdp, next, false);
>  	} while (pmdp++, next += PMD_SIZE, next != end);
>  
> -	pud_clear(pudp);
>  	__flush_tlb_kernel_pgtable(addr);
>  	pmd_free(NULL, table);
>  	return 1;


