Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 734BDC87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Aug 2025 16:17:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JNR+fvCqZRhwlgDMXq+xgp6kgRY0reWURl4D5BcYyjY=; b=Q0MRaGMoOvAUUzD8tVf+IL5w+W
	LIuZVXsee4pgf0vPY/ShAiipK/BE/FRELdH55CU6sxmTMTgIyYx7XoFuWQ/4TjE11JI8MlJjdfTze
	tmenIuWsMsTnCA0kqMfyKUI8aexb5H5ShyjecOv062yWdFyQPuDbVNr7NE7SuOX04xP6iy2WZ4cYd
	KoUOC8pxWBf1ClwhjR76+hQ/QA6dtXoRiLPIjzC5a5NND2UXlC4e0Q7cVGXdz4fF9pTNqqfZPy4uS
	zgZ+FLASFwGj8XwEF690tglXZlTBwCc7UVf6q3TGIUv3hf3BgRbmXEFhKMu/lGqYQZxNOr2YyBRSs
	3AXd8/Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhsRb-00000006QQj-1KDx;
	Fri, 01 Aug 2025 16:17:19 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhsOy-00000006QEE-0QB6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Aug 2025 16:14:37 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C71381516;
	Fri,  1 Aug 2025 09:14:26 -0700 (PDT)
Received: from [10.57.87.210] (unknown [10.57.87.210])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F40503F673;
	Fri,  1 Aug 2025 09:14:32 -0700 (PDT)
Message-ID: <737dd4f2-c48b-449d-bb37-2f7ee0eb8fcd@arm.com>
Date: Fri, 1 Aug 2025 17:14:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: mm: split linear mapping if BBML2 is not
 supported on secondary CPUs
Content-Language: en-GB
To: Yang Shi <yang@os.amperecomputing.com>, will@kernel.org,
 catalin.marinas@arm.com, akpm@linux-foundation.org, Miko.Lenczewski@arm.com,
 dev.jain@arm.com, scott@os.amperecomputing.com, cl@gentwo.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250724221216.1998696-1-yang@os.amperecomputing.com>
 <20250724221216.1998696-5-yang@os.amperecomputing.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <20250724221216.1998696-5-yang@os.amperecomputing.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250801_091436_229579_764EFED2 
X-CRM114-Status: GOOD (  45.26  )
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
> 
> diff --git a/arch/arm64/include/asm/mmu.h b/arch/arm64/include/asm/mmu.h
> index 57f4b25e6f33..9bf50e8897e2 100644
> --- a/arch/arm64/include/asm/mmu.h
> +++ b/arch/arm64/include/asm/mmu.h
> @@ -56,6 +56,8 @@ typedef struct {
>   */
>  #define ASID(mm)	(atomic64_read(&(mm)->context.id) & 0xffff)
>  
> +extern bool linear_map_requires_bbml2;
> +
>  static inline bool arm64_kernel_unmapped_at_el0(void)
>  {
>  	return alternative_has_cap_unlikely(ARM64_UNMAP_KERNEL_AT_EL0);
> @@ -71,7 +73,9 @@ extern void create_pgd_mapping(struct mm_struct *mm, phys_addr_t phys,
>  			       pgprot_t prot, bool page_mappings_only);
>  extern void *fixmap_remap_fdt(phys_addr_t dt_phys, int *size, pgprot_t prot);
>  extern void mark_linear_text_alias_ro(void);
> -extern int split_kernel_pgtable_mapping(unsigned long start, unsigned long end);
> +extern int split_kernel_pgtable_mapping(unsigned long start, unsigned long end,
> +					unsigned int flags);
> +extern int linear_map_split_to_ptes(void *__unused);
>  
>  /*
>   * This check is triggered during the early boot before the cpufeature
> diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
> index 1c96016a7a41..23c01d679c40 100644
> --- a/arch/arm64/kernel/cpufeature.c
> +++ b/arch/arm64/kernel/cpufeature.c
> @@ -85,6 +85,7 @@
>  #include <asm/insn.h>
>  #include <asm/kvm_host.h>
>  #include <asm/mmu_context.h>
> +#include <asm/mmu.h>
>  #include <asm/mte.h>
>  #include <asm/hypervisor.h>
>  #include <asm/processor.h>
> @@ -2009,6 +2010,12 @@ static int __init __kpti_install_ng_mappings(void *__unused)
>  	return 0;
>  }
>  
> +static void __init linear_map_maybe_split_to_ptes(void)
> +{
> +	if (linear_map_requires_bbml2 && !system_supports_bbml2_noabort())
> +		stop_machine(linear_map_split_to_ptes, NULL, cpu_online_mask);
> +}
> +
>  static void __init kpti_install_ng_mappings(void)
>  {
>  	/* Check whether KPTI is going to be used */
> @@ -3855,6 +3862,7 @@ void __init setup_system_features(void)
>  {
>  	setup_system_capabilities();
>  
> +	linear_map_maybe_split_to_ptes();
>  	kpti_install_ng_mappings();
>  
>  	sve_setup();
> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
> index f63b39613571..22f2d0869fdd 100644
> --- a/arch/arm64/mm/mmu.c
> +++ b/arch/arm64/mm/mmu.c
> @@ -482,11 +482,11 @@ void create_kpti_ng_temp_pgd(pgd_t *pgdir, phys_addr_t phys, unsigned long virt,
>  
>  #define INVALID_PHYS_ADDR	-1
>  

[...]

I'll review the actual walker separately (I've run out of time today).


>  
> +extern u32 repaint_done;
> +
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

Is this correct? I would have thought the primary is waiting for the
secondaries, so "VAL == num_online_cpus() - 1" ?

> +
> +		memblock_mark_nomap(kernel_start, kernel_end - kernel_start);
> +		/* Split the whole linear mapping */
> +		for_each_mem_range(i, &start, &end) {

I think I asked this in the last round; but I just want to double check;
memblock is definitely still valid here and we are definitely going to get
exactly the same regions out as we did in map_mem()? I wonder if it's possible
between then and now that some other component has reserved some memory? In that
case we wouldn't walk that region?

Perhaps it would be safer (and simpler) to just walk all of [PAGE_OFFSET,
_stext) and [__init_begin, PAGE_END) and ignore the holes?

> +			if (start >= end)
> +				return -EINVAL;
> +
> +			vstart = __phys_to_virt(start);
> +			vend = __phys_to_virt(end);
> +			ret = split_kernel_pgtable_mapping(vstart, vend, flags);
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

You've defined the macro within "#ifdef CONFIG_UNMAP_KERNEL_AT_EL0" but then
need to use it outside of that scope.

But I don't think this needs to be a macro; I think it would be better as a
function (as I suggested in the last round). Then the text only needs to appear
once in the image and it can be used from both places (see below).

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

How about this instead?

---8<---
diff --git a/arch/arm64/mm/proc.S b/arch/arm64/mm/proc.S
index 8c75965afc9e..a116b2b8ad59 100644
--- a/arch/arm64/mm/proc.S
+++ b/arch/arm64/mm/proc.S
@@ -416,8 +416,30 @@ alternative_else_nop_endif
 __idmap_kpti_secondary:
 	/* Uninstall swapper before surgery begins */
 	__idmap_cpu_set_reserved_ttbr1 x16, x17
+	b scondary_cpu_wait
+
+	.unreq	swapper_ttb
+	.unreq	flag_ptr
+SYM_FUNC_END(idmap_kpti_install_ng_mappings)
+	.popsection
+#endif
+
+	.pushsection	".data", "aw", %progbits
+SYM_DATA(repaint_done, .long 1)
+	.popsection
+
+	.pushsection ".idmap.text", "a"
+SYM_TYPED_FUNC_START(bbml2_wait_for_repainting)
+	/* Must be same registers as in idmap_kpti_install_ng_mappings */
+	swapper_ttb	.req	x3
+	flag_ptr	.req	x4
+
+	mrs     swapper_ttb, ttbr1_el1
+	adr_l   flag_ptr, repaint_done
+	__idmap_cpu_set_reserved_ttbr1 x16, x17

 	/* Increment the flag to let the boot CPU we're ready */
+scondary_cpu_wait:
 1:	ldxr	w16, [flag_ptr]
 	add	w16, w16, #1
 	stxr	w17, w16, [flag_ptr]
@@ -436,9 +458,8 @@ __idmap_kpti_secondary:

 	.unreq	swapper_ttb
 	.unreq	flag_ptr
-SYM_FUNC_END(idmap_kpti_install_ng_mappings)
+SYM_FUNC_END(bbml2_wait_for_repainting)
 	.popsection
-#endif

 /*
  *	__cpu_setup
---8<---

Thanks,
Ryan


