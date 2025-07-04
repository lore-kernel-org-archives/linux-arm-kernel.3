Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E70DC83030
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Jul 2025 06:01:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YCTK7Bzon0zL0bQ/WW0ID3IQGu/Ok/LvSbcM1gm1QxU=; b=HRqttNDtPjpskZ4Jpv31v9qYFe
	pOlQjTIHOLQ4mtRteyheAGaKIyYSohTHZdHHNh+2lPmfo974zATnRNxt+z8i1/Yml6i6z/+njaDuR
	IAdknifhuPBYSE99Dc9mdp5r/K3SNSk4BGOeyah2YmMvA8bSmwA2jkGKQlsqFlbrPGBSP46dFfCf7
	UIJUc9Flrusx5Ny3ka1pGxDLDDJSMj+mQSTs8RWlqP9Ka8R3oO6+arHeRGh0HlC6mClDP6x/wx1Xk
	/nU+zibVXDKDhaZ+tDBOJysg7jzpnZ+fq8OlNXbraCqFo9s2/wEkWQiSbUHpJSnCDc/1N04YcWt1n
	VG1Ocp3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXZU8-0000000DMKs-3vYS;
	Fri, 04 Jul 2025 06:01:20 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXZRn-0000000DM9a-1brG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Jul 2025 05:58:56 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EE439152B;
	Thu,  3 Jul 2025 22:58:37 -0700 (PDT)
Received: from [10.163.88.118] (unknown [10.163.88.118])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1EF993F63F;
	Thu,  3 Jul 2025 22:58:47 -0700 (PDT)
Message-ID: <4e76b35e-8afb-469a-9e61-fa8e0f344859@arm.com>
Date: Fri, 4 Jul 2025 11:28:44 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] arm64: Enable vmalloc-huge with ptdump
To: Dev Jain <dev.jain@arm.com>, catalin.marinas@arm.com, will@kernel.org
Cc: quic_zhenhuah@quicinc.com, ryan.roberts@arm.com, kevin.brodsky@arm.com,
 yangyicong@hisilicon.com, joey.gouly@arm.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 david@redhat.com
References: <20250626052524.332-1-dev.jain@arm.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20250626052524.332-1-dev.jain@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_225855_522006_EC546783 
X-CRM114-Status: GOOD (  41.51  )
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



On 26/06/25 10:55 AM, Dev Jain wrote:
> arm64 disables vmalloc-huge when kernel page table dumping is enabled,
> because an intermediate table may be removed, potentially causing the
> ptdump code to dereference an invalid address. We want to be able to

Please keep this paragraph separate explaining the current scenario. It
might be worth adding bit more details such CONFIG_PTDUMP_DEBUGFS config
dependency in vmalloc()'s arch call backs arch_vmap_pud|pmd_supported().
 > analyze block vs page mappings for kernel mappings with ptdump, so to
> enable vmalloc-huge with ptdump, synchronize between page table removal in
> pmd_free_pte_page()/pud_free_pmd_page() and ptdump pagetable walking. We

Please keep this paragraph separate explaining what is the benefit of
enabling ptdump with huge vmalloc() mappings. This will establish the
required motivation to change the current scenario.

> use mmap_read_lock and not write lock because we don't need to synchronize
> between two different vm_structs; two vmalloc objects running this same
> code path will point to different page tables, hence there is no race.

Different page tables ? OR different areas in same page table i.e init_mm.

> 
> For pud_free_pmd_page(), we isolate the PMD table to avoid taking the lock
> 512 times again via pmd_free_pte_page().

This talks about subsequent optimization without establishing the base
solution first.
 > 
> We implement the locking mechanism using static keys, since the chance
> of a race is very small. Observe that the synchronization is needed
> to avoid the following race:
> 
> CPU1							CPU2
> 						take reference of PMD table
> pud_clear()
> pte_free_kernel()
> 						walk freed PMD table
> 
> and similar race between pmd_free_pte_page and ptdump_walk_pgd.
> 
> Therefore, there are two cases: if ptdump sees the cleared PUD, then
> we are safe. If not, then the patched-in read and write locks help us
> avoid the race.
> 
> To implement the mechanism, we need the static key access from mmu.c and
> ptdump.c. Note that in case !CONFIG_PTDUMP_DEBUGFS, ptdump.o won't be a
> target in the Makefile, therefore we cannot initialize the key there, as
> is being done, for example, in the static key implementation of
> hugetlb-vmemmap. Therefore, include asm/cpufeature.h, which includes
> the jump_label mechanism. Declare the key there and define the key to false
> in mmu.c.

Above write up is convoluted and not very clear. Please rewrite the solution
description while avoiding too much implementation and code file details that
can be derived from the patch itself.

> 
> No issues were observed with mm-selftests. No issues were observed while
> parallelly running test_vmalloc.sh and dumping the kernel pagetable through
> sysfs in a loop.
Please provide some more details about test_vmallo.sh which seems to be a
custom script.

> 
> Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>
> Signed-off-by: Dev Jain <dev.jain@arm.com>
> ---
> v3->v4:
>  - Lock-unlock immediately
>  - Simplify includes
> 
> v2->v3:
>  - Use static key mechanism
> 
> v1->v2:
>  - Take lock only when CONFIG_PTDUMP_DEBUGFS is on
>  - In case of pud_free_pmd_page(), isolate the PMD table to avoid taking
>    the lock 512 times again via pmd_free_pte_page()
> 
>  arch/arm64/include/asm/ptdump.h |  2 ++
>  arch/arm64/mm/mmu.c             | 44 ++++++++++++++++++++++++++++++---
>  arch/arm64/mm/ptdump.c          |  5 +++-
>  3 files changed, 46 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/ptdump.h b/arch/arm64/include/asm/ptdump.h
> index fded5358641f..5b331f2a7be1 100644
> --- a/arch/arm64/include/asm/ptdump.h
> +++ b/arch/arm64/include/asm/ptdump.h
> @@ -7,6 +7,8 @@
>  
>  #include <linux/ptdump.h>
>  
> +DECLARE_STATIC_KEY_FALSE(ptdump_lock_key);
> +
>  #ifdef CONFIG_PTDUMP
>  
>  #include <linux/mm_types.h>
> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
> index 00ab1d648db6..9d3be249047c 100644
> --- a/arch/arm64/mm/mmu.c
> +++ b/arch/arm64/mm/mmu.c
> @@ -46,6 +46,8 @@
>  #define NO_CONT_MAPPINGS	BIT(1)
>  #define NO_EXEC_MAPPINGS	BIT(2)	/* assumes FEAT_HPDS is not used */
>  
> +DEFINE_STATIC_KEY_FALSE(ptdump_lock_key);
> +ptdump_lock_key sounds too generic even though this locking
requirement is currently arm64 platform specific. Otherwise
this might just appear as a locking from the generic ptdump
Could this be renamed as arm64_ptdump_lock_key instead ?

>  enum pgtable_type {
>  	TABLE_PTE,
>  	TABLE_PMD,
> @@ -1267,7 +1269,7 @@ int pmd_clear_huge(pmd_t *pmdp)
>  	return 1;
>  }
>  
> -int pmd_free_pte_page(pmd_t *pmdp, unsigned long addr)
> +static int __pmd_free_pte_page(pmd_t *pmdp, unsigned long addr, bool lock)
>  {

'lock' argument needs explanation here in a comment.

>  	pte_t *table;
>  	pmd_t pmd;
> @@ -1279,13 +1281,24 @@ int pmd_free_pte_page(pmd_t *pmdp, unsigned long addr)
>  		return 1;
>  	}
>  
> +	/* See comment in pud_free_pmd_page for static key logic */
>  	table = pte_offset_kernel(pmdp, addr);
>  	pmd_clear(pmdp);
>  	__flush_tlb_kernel_pgtable(addr);

Or here ?

> +	if (static_branch_unlikely(&ptdump_lock_key) && lock) {
> +		mmap_read_lock(&init_mm);
> +		mmap_read_unlock(&init_mm);
> +	}
> +
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
> @@ -1301,16 +1314,39 @@ int pud_free_pmd_page(pud_t *pudp, unsigned long addr)
>  	}
>  
>  	table = pmd_offset(pudp, addr);
> +	/*
> +	 * Isolate the PMD table; in case of race with ptdump, this helps
> +	 * us to avoid taking the lock in __pmd_free_pte_page().
> +	 *
> +	 * Static key logic:
> +	 *
> +	 * Case 1: If ptdump does static_branch_enable(), and after that we
> +	 * execute the if block, then this patches in the read lock, ptdump has
> +	 * the write lock patched in, therefore ptdump will never read from
> +	 * a potentially freed PMD table.
> +	 *
> +	 * Case 2: If the if block starts executing before ptdump's
> +	 * static_branch_enable(), then no locking synchronization
> +	 * will be done. However, pud_clear() + the dsb() in
> +	 * __flush_tlb_kernel_pgtable will ensure that ptdump observes an
> +	 * empty PUD. Thus, it will never walk over a potentially freed
> +	 * PMD table.
> +	 */
> +	pud_clear(pudp);
> +	__flush_tlb_kernel_pgtable(addr);
> +	if (static_branch_unlikely(&ptdump_lock_key)) {

		/* case 1 - ptdump comes first
		 *
		 * mmap_read_lock() here will wait on mmap_write_lock()
	 	 * taken in generic ptdump until it has been released.
		 */

> +		mmap_read_lock(&init_mm);
> +		mmap_read_unlock(&init_mm);
> +	}
	} else {
		/* case 2 - pud_free_pmd_page() comes first
		 * 
		 * pud_clear() and __flush_tlb_kernel_pgtable() are
		 * sufficient for ptdump to observe an empty PUD.
		 */	 
	}> +
>  	pmdp = table;
>  	next = addr;
>  	end = addr + PUD_SIZE;
>  	do {
>  		if (pmd_present(pmdp_get(pmdp)))
> -			pmd_free_pte_page(pmdp, next);
> +			__pmd_free_pte_page(pmdp, next, false);
>  	} while (pmdp++, next += PMD_SIZE, next != end);
>  
> -	pud_clear(pudp);
> -	__flush_tlb_kernel_pgtable(addr);
>  	pmd_free(NULL, table);
>  	return 1;
>  }
> diff --git a/arch/arm64/mm/ptdump.c b/arch/arm64/mm/ptdump.c
> index 421a5de806c6..41c9ea61813b 100644
> --- a/arch/arm64/mm/ptdump.c
> +++ b/arch/arm64/mm/ptdump.c
> @@ -25,7 +25,6 @@
>  #include <asm/pgtable-hwdef.h>
>  #include <asm/ptdump.h>
>  
> -

Stray change. Please drop it.

>  #define pt_dump_seq_printf(m, fmt, args...)	\
>  ({						\
>  	if (m)					\
> @@ -311,7 +310,9 @@ void ptdump_walk(struct seq_file *s, struct ptdump_info *info)
>  		}
>  	};
>  
> +	static_branch_enable(&ptdump_lock_key);
>  	ptdump_walk_pgd(&st.ptdump, info->mm, NULL);
> +	static_branch_disable(&ptdump_lock_key);
>  }
>  
>  static void __init ptdump_initialize(void)
> @@ -353,7 +354,9 @@ bool ptdump_check_wx(void)
>  		}
>  	};
>  
> +	static_branch_enable(&ptdump_lock_key);
>  	ptdump_walk_pgd(&st.ptdump, &init_mm, NULL);
> +	static_branch_disable(&ptdump_lock_key);
>  
>  	if (st.wx_pages || st.uxn_pages) {
>  		pr_warn("Checked W+X mappings: FAILED, %lu W+X pages found, %lu non-UXN pages found\n",Although tempting but I guess encapsulating above ptdump_walk_pgd()
locking sequence inside a new helper arm64_ptdump_walk_pgd() while
also explaining this locking might be worth ?

PUD/PMD vmalloc mappings need to be enabled via these arch callback
changes via dropping the current CONFIG_PTDUMP_DEBUGFS dependency.

#define arch_vmap_pud_supported arch_vmap_pud_supported
static inline bool arch_vmap_pud_supported(pgprot_t prot)
{
	return pud_sect_supported()
}

#define arch_vmap_pmd_supported arch_vmap_pmd_supported
static inline bool arch_vmap_pmd_supported(pgprot_t prot)
{
	return return.
}

