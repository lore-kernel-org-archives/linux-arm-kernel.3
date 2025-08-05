Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06D18C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Aug 2025 08:37:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g/epGZNl5Ot7I4AE94PURV5Kgw3cT58izJ4/jkTSKko=; b=h5hiBrQaQPvUJAEVecjJLZmrbc
	2cCF8TLlXYMEdx0fD8vcylcnbZO1JOrjYUDisGODOBlI7eg298Xw7XwN7L9WX0exYejI80+Y1U8ug
	cpNY2o2Y5jmfyY57SG4u9YIXezvKjb5UMPmW2ffctDY7nrPwG/fLOmhGhyumM4QAor+Fd8leXLZhy
	0pVhLTWiFCWVhz1fnxwVx6iu/csz15S06PN6hbETeexSy9gMWnJgtJFqaez9WNa+F/MCJRd8xn+JZ
	MNlVHKsOhivZM/00sJLpiwXkNvD9GuwHcmjqd1JAoLtaa+aBF9IqwnF3wyTJ06L48cKRgYrKxGKJi
	zN9DMiTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujDAG-0000000CCSp-3iKK;
	Tue, 05 Aug 2025 08:36:56 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujCVC-0000000C5Zb-0IXq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Aug 2025 07:54:31 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BE877339;
	Tue,  5 Aug 2025 00:54:20 -0700 (PDT)
Received: from [10.57.87.210] (unknown [10.57.87.210])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 086A43F673;
	Tue,  5 Aug 2025 00:54:26 -0700 (PDT)
Message-ID: <86d3af99-0011-43fc-9533-4d51ffcc9a0a@arm.com>
Date: Tue, 5 Aug 2025 08:54:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: mm: split linear mapping if BBML2 is not
 supported on secondary CPUs
To: Yang Shi <yang@os.amperecomputing.com>, will@kernel.org,
 catalin.marinas@arm.com, akpm@linux-foundation.org, Miko.Lenczewski@arm.com,
 dev.jain@arm.com, scott@os.amperecomputing.com, cl@gentwo.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250724221216.1998696-1-yang@os.amperecomputing.com>
 <20250724221216.1998696-5-yang@os.amperecomputing.com>
From: Ryan Roberts <ryan.roberts@arm.com>
Content-Language: en-GB
In-Reply-To: <20250724221216.1998696-5-yang@os.amperecomputing.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_005430_211698_EE698BD8 
X-CRM114-Status: GOOD (  38.32  )
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

Hi Yang,

On 24/07/2025 23:11, Yang Shi wrote:
> The kernel linear mapping is painted in very early stage of system boot.
> The cpufeature has not been finalized yet at this point.  So the linear
> mapping is determined by the capability of boot CPU.  If the boot CPU
> supports BBML2, large block mapping will be used for linear mapping.
> 
> But the secondary CPUs may not support BBML2, so repaint the linear mapping
> if large block mapping is used and the secondary CPUs don't support BBML2
> once cpufeature is finalized on all CPUs.
> 
> If the boot CPU doesn't support BBML2 or the secondary CPUs have the
> same BBML2 capability with the boot CPU, repainting the linear mapping
> is not needed.
> 
> Signed-off-by: Yang Shi <yang@os.amperecomputing.com>
> ---
>  arch/arm64/include/asm/mmu.h   |   6 +-
>  arch/arm64/kernel/cpufeature.c |   8 ++
>  arch/arm64/mm/mmu.c            | 173 +++++++++++++++++++++++++++------
>  arch/arm64/mm/pageattr.c       |   2 +-
>  arch/arm64/mm/proc.S           |  57 ++++++++---
>  5 files changed, 196 insertions(+), 50 deletions(-)

[...]

> +int __init linear_map_split_to_ptes(void *__unused)
> +{
> +	typedef void (repaint_wait_fn)(void);
> +	extern repaint_wait_fn bbml2_wait_for_repainting;
> +	repaint_wait_fn *wait_fn;
> +
> +	int cpu = smp_processor_id();
> +
> +	wait_fn = (void *)__pa_symbol(bbml2_wait_for_repainting);
> +
> +	/*
> +	 * Repainting just can be run on CPU 0 because we just can be sure
> +	 * CPU 0 supports BBML2.
> +	 */
> +	if (!cpu) {
> +		phys_addr_t kernel_start = __pa_symbol(_stext);
> +		phys_addr_t kernel_end = __pa_symbol(__init_begin);
> +		phys_addr_t start, end;
> +		unsigned long vstart, vend;
> +		int flags = NO_BLOCK_MAPPINGS | NO_CONT_MAPPINGS;
> +		u64 i;
> +		int ret;
> +
> +		/*
> +		 * Wait for all secondary CPUs get prepared for repainting
> +		 * the linear mapping.
> +		 */
> +		smp_cond_load_acquire(&repaint_done, VAL == num_online_cpus());
> +
> +		memblock_mark_nomap(kernel_start, kernel_end - kernel_start);
> +		/* Split the whole linear mapping */
> +		for_each_mem_range(i, &start, &end) {
> +			if (start >= end)
> +				return -EINVAL;
> +
> +			vstart = __phys_to_virt(start);
> +			vend = __phys_to_virt(end);
> +			ret = split_kernel_pgtable_mapping(vstart, vend, flags);

I've been thinking about this; I think the best approach is to use the pagewalk
API here, then you don't need to implement your own pgtable walker; you can just
implement the pud, pmd and pte callbacks to do the splitting and they can reuse
common split helper functions. This reduces code size quite a bit I think. And
also means that for split_kernel_pgtable_mapping() you can just pass a single
address and don't need to iterate over every entry.

I started prototyping this to prove to myself that it is possible and ended up
with quite a clean implementation. I'm going to post that as a v6 RFC shortly -
I hope that's ok. I've retained you as primary author since it's all based on
your work. I'm hoping that the posting will speed up review so we can hopefully
get this into 6.18.

Thanks,
Ryan

> +			if (ret)
> +				panic("Failed to split linear mappings\n");
> +
> +			flush_tlb_kernel_range(vstart, vend);
> +		}
> +		memblock_clear_nomap(kernel_start, kernel_end - kernel_start);
> +
> +		/*
> +		 * Relies on dsb in flush_tlb_kernel_range() to avoid
> +		 * reordering before any page table split operations.
> +		 */
> +		WRITE_ONCE(repaint_done, 0);
> +	} else {
> +		/*
> +		 * The secondary CPUs can't run in the same address space
> +		 * with CPU 0 because accessing the linear mapping address
> +		 * when CPU 0 is repainting it is not safe.
> +		 *
> +		 * Let the secondary CPUs run busy loop in idmap address
> +		 * space when repainting is ongoing.
> +		 */
> +		cpu_install_idmap();
> +		wait_fn();
> +		cpu_uninstall_idmap();
> +	}
> +
> +	return 0;
> +}
> +
>  #ifdef CONFIG_KFENCE
>  
>  bool __ro_after_init kfence_early_init = !!CONFIG_KFENCE_SAMPLE_INTERVAL;
> @@ -1079,7 +1174,8 @@ void __pi_map_range(u64 *pgd, u64 start, u64 end, u64 pa, pgprot_t prot,
>  		    int level, pte_t *tbl, bool may_use_cont, u64 va_offset);
>  
>  static u8 idmap_ptes[IDMAP_LEVELS - 1][PAGE_SIZE] __aligned(PAGE_SIZE) __ro_after_init,
> -	  kpti_ptes[IDMAP_LEVELS - 1][PAGE_SIZE] __aligned(PAGE_SIZE) __ro_after_init;
> +	  kpti_ptes[IDMAP_LEVELS - 1][PAGE_SIZE] __aligned(PAGE_SIZE) __ro_after_init,
> +	  bbml2_ptes[IDMAP_LEVELS - 1][PAGE_SIZE] __aligned(PAGE_SIZE) __ro_after_init;
>  
>  static void __init create_idmap(void)
>  {
> @@ -1104,6 +1200,19 @@ static void __init create_idmap(void)
>  			       IDMAP_ROOT_LEVEL, (pte_t *)idmap_pg_dir, false,
>  			       __phys_to_virt(ptep) - ptep);
>  	}
> +
> +	/*
> +	 * Setup idmap mapping for repaint_done flag.  It will be used if
> +	 * repainting the linear mapping is needed later.
> +	 */
> +	if (linear_map_requires_bbml2) {
> +		u64 pa = __pa_symbol(&repaint_done);
> +		ptep = __pa_symbol(bbml2_ptes);
> +
> +		__pi_map_range(&ptep, pa, pa + sizeof(u32), pa, PAGE_KERNEL,
> +			       IDMAP_ROOT_LEVEL, (pte_t *)idmap_pg_dir, false,
> +			       __phys_to_virt(ptep) - ptep);
> +	}
>  }
>  
>  void __init paging_init(void)
> diff --git a/arch/arm64/mm/pageattr.c b/arch/arm64/mm/pageattr.c
> index 6566aa9d8abb..4471d7e510a1 100644
> --- a/arch/arm64/mm/pageattr.c
> +++ b/arch/arm64/mm/pageattr.c
> @@ -140,7 +140,7 @@ static int update_range_prot(unsigned long start, unsigned long size,
>  	data.set_mask = set_mask;
>  	data.clear_mask = clear_mask;
>  
> -	ret = split_kernel_pgtable_mapping(start, start + size);
> +	ret = split_kernel_pgtable_mapping(start, start + size, 0);
>  	if (WARN_ON_ONCE(ret))
>  		return ret;
>  
> diff --git a/arch/arm64/mm/proc.S b/arch/arm64/mm/proc.S
> index 80d470aa469d..f0f9c49a4466 100644
> --- a/arch/arm64/mm/proc.S
> +++ b/arch/arm64/mm/proc.S
> @@ -239,6 +239,25 @@ SYM_FUNC_ALIAS(__pi_idmap_cpu_replace_ttbr1, idmap_cpu_replace_ttbr1)
>  	dsb	nshst
>  	.endm
>  
> +	.macro wait_for_boot_cpu, tmp1, tmp2, tmp3, tmp4
> +	/* Increment the flag to let the boot CPU know we're ready */
> +1:	ldxr	\tmp3, [\tmp2]
> +	add	\tmp3, \tmp3, #1
> +	stxr	\tmp4, \tmp3, [\tmp2]
> +	cbnz	\tmp4, 1b
> +
> +	/* Wait for the boot CPU to finish its job */
> +	sevl
> +1:	wfe
> +	ldxr	\tmp3, [\tmp2]
> +	cbnz	\tmp3, 1b
> +
> +	/* All done, act like nothing happened */
> +	msr	ttbr1_el1, \tmp1
> +	isb
> +	ret
> +	.endm
> +
>  /*
>   * void __kpti_install_ng_mappings(int cpu, int num_secondaries, phys_addr_t temp_pgd,
>   *				   unsigned long temp_pte_va)
> @@ -416,29 +435,35 @@ alternative_else_nop_endif
>  __idmap_kpti_secondary:
>  	/* Uninstall swapper before surgery begins */
>  	__idmap_cpu_set_reserved_ttbr1 x16, x17
> +	wait_for_boot_cpu swapper_ttb, flag_ptr, w16, w17
>  
> -	/* Increment the flag to let the boot CPU we're ready */
> -1:	ldxr	w16, [flag_ptr]
> -	add	w16, w16, #1
> -	stxr	w17, w16, [flag_ptr]
> -	cbnz	w17, 1b
> +	.unreq	swapper_ttb
> +	.unreq	flag_ptr
> +SYM_FUNC_END(idmap_kpti_install_ng_mappings)
> +	.popsection
> +#endif
>  
> -	/* Wait for the boot CPU to finish messing around with swapper */
> -	sevl
> -1:	wfe
> -	ldxr	w16, [flag_ptr]
> -	cbnz	w16, 1b
> +/*
> + * Wait for repainting is done. Run on secondary CPUs
> + * only.
> + */
> +	.pushsection	".data", "aw", %progbits
> +SYM_DATA(repaint_done, .long 1)
> +	.popsection
>  
> -	/* All done, act like nothing happened */
> -	msr	ttbr1_el1, swapper_ttb
> -	isb
> -	ret
> +	.pushsection ".idmap.text", "a"
> +SYM_TYPED_FUNC_START(bbml2_wait_for_repainting)
> +	swapper_ttb	.req	x0
> +	flag_ptr	.req	x1
> +	mrs     swapper_ttb, ttbr1_el1
> +	adr_l   flag_ptr, repaint_done
> +	__idmap_cpu_set_reserved_ttbr1 x16, x17
> +	wait_for_boot_cpu swapper_ttb, flag_ptr, w16, w17
>  
>  	.unreq	swapper_ttb
>  	.unreq	flag_ptr
> -SYM_FUNC_END(idmap_kpti_install_ng_mappings)
> +SYM_FUNC_END(bbml2_wait_for_repainting)
>  	.popsection
> -#endif
>  
>  /*
>   *	__cpu_setup


