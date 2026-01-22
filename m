Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E014C44500
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 05:09:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KGSEaB9eBSrM37A1zwGiYUOW3itR/06j9ODUQdT80t0=; b=iS3dGV/hF7b3YpZNRvK/ErKAIf
	ZwLlswcn63Kt76PSgurhpTQxbf08QUn1Yc3r5IpcK11dzQHM+DHqNf+WXsAb98SO0uDClQAGIr26d
	BdhvPHOA0+8BVRQor3N3vDGkRI4us8iBzTZt0KGacijK9a3grIioZcsuE088xFg8F0GJfqym+9OLp
	zBsS4OgHgfVGoqFfhjlclX6WfX11YRqRIHHeRPxsQJNM1P3LVzhGKzJn7ENHuG5DuoX4tyEepPr5l
	K4C0GWwKXA9bYh+Z5wJtnU4tOGw4D8Y/mRMY3VFJjPLaKDnUkS8s8Kqs3CvY7O4OdQBdTDuCa+ZNa
	bixS4AEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vimwr-00000006S83-0AZN;
	Thu, 22 Jan 2026 05:09:37 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vimwo-00000006S7a-39b1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 05:09:36 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F39DC1476;
	Wed, 21 Jan 2026 21:09:23 -0800 (PST)
Received: from [10.163.165.53] (unknown [10.163.165.53])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 25F593F632;
	Wed, 21 Jan 2026 21:09:27 -0800 (PST)
Message-ID: <965a0b46-f32e-40e6-ab71-211f84d6c3cf@arm.com>
Date: Thu, 22 Jan 2026 10:39:25 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v5 PATCH] arm64: mm: show direct mapping use in /proc/meminfo
To: Yang Shi <yang@os.amperecomputing.com>, catalin.marinas@arm.com,
 will@kernel.org, ryan.roberts@arm.com, cl@gentwo.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260107002944.2940963-1-yang@os.amperecomputing.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20260107002944.2940963-1-yang@os.amperecomputing.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_210934_938428_763F4464 
X-CRM114-Status: GOOD (  41.97  )
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

Hello Yang,

On 07/01/26 5:59 AM, Yang Shi wrote:
> Since commit a166563e7ec3 ("arm64: mm: support large block mapping when
> rodata=full"), the direct mapping may be split on some machines instead
> keeping static since boot. It makes more sense to show the direct mapping
> use in /proc/meminfo than before.

I guess the direct mapping here refers to linear map ? IIUC it is called
direct map on x86 and linear map on arm64 platforms. Then should not it
be renamed as s/DirectMap/LinearMap instead ? This will align with names
from ptdump as well.

Before the above mentioned commit, linear could get altered with memory
hotplug and remove events as well.

> This patch will make /proc/meminfo show the direct mapping use like the
> below (4K base page size):
> DirectMap4K:	   94792 kB
> DirectMap64K:	  134208 kB
> DirectMap2M:	 1173504 kB
> DirectMap32M:	 5636096 kB
> DirectMap1G:	529530880 kB

If /proc/meminfo interface is getting updated via  arch_report_meminfo()
why not add stats for all kernel virtual address space ranges including
vmemmap, vmalloc etc aka all address range headers in ptdump as many of
those could change during system runtime. What makes linear mapping any
special ?

> 
> Although just the machines which support BBML2_NOABORT can split the
> direct mapping, show it on all machines regardless of BBML2_NOABORT so
> that the users have consistent view in order to avoid confusion.
> 
> Although ptdump also can tell the direct map use, but it needs to dump
> the whole kernel page table. It is costly and overkilling. It is also
> in debugfs which may not be enabled by all distros. So showing direct
> map use in /proc/meminfo seems more convenient and has less overhead.

Agreed a /proc/meminfo based broader kernel virtual address space stats
display will complement ptdump which provides more granular information
about their mapping (with additional cost and setup) but it should cover
all the regions in kernel virtual space.

> 
> Signed-off-by: Yang Shi <yang@os.amperecomputing.com>
> ---
> v5: * Rebased to v6.19-rc4
>     * Fixed the build error for !CONFIG_PROC_FS
> v4: * Used PAGE_END instead of _PAGE_END(VA_BITS_MIN) per Ryan
>     * Used shorter name for the helpers and variables per Ryan
>     * Fixed accounting for memory hotunplug
> v3: * Fixed the over-accounting problems per Ryan
>     * Introduced helpers for add/sub direct map use and #ifdef them with
>       CONFIG_PROC_FS per Ryan
>     * v3 is a fix patch on top of v2
> v2: * Counted in size instead of the number of entries per Ryan
>     * Removed shift array per Ryan
>     * Use lower case "k" per Ryan
>     * Fixed a couple of build warnings reported by kernel test robot
>     * Fixed a couple of poential miscounts
> 
>  arch/arm64/mm/mmu.c | 202 +++++++++++++++++++++++++++++++++++++++-----
>  1 file changed, 181 insertions(+), 21 deletions(-)
> 
> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
> index 8e1d80a7033e..422441c9a992 100644
> --- a/arch/arm64/mm/mmu.c
> +++ b/arch/arm64/mm/mmu.c
> @@ -29,6 +29,7 @@
>  #include <linux/mm_inline.h>
>  #include <linux/pagewalk.h>
>  #include <linux/stop_machine.h>
> +#include <linux/proc_fs.h>
>  
>  #include <asm/barrier.h>
>  #include <asm/cputype.h>
> @@ -171,6 +172,85 @@ static void init_clear_pgtable(void *table)
>  	dsb(ishst);
>  }
>  
> +enum dm_type {
> +	PTE,
> +	CONT_PTE,
> +	PMD,
> +	CONT_PMD,
> +	PUD,
> +	NR_DM_TYPE,
> +};
> +
> +#ifdef CONFIG_PROC_FS
> +static unsigned long dm_meminfo[NR_DM_TYPE];
> +
> +void arch_report_meminfo(struct seq_file *m)
> +{
> +	char *size[NR_DM_TYPE];
> +
> +#if defined(CONFIG_ARM64_4K_PAGES)
> +	size[PTE] = "4k";
> +	size[CONT_PTE] = "64k";
> +	size[PMD] = "2M";
> +	size[CONT_PMD] = "32M";
> +	size[PUD] = "1G";
> +#elif defined(CONFIG_ARM64_16K_PAGES)
> +	size[PTE] = "16k";
> +	size[CONT_PTE] = "2M";
> +	size[PMD] = "32M";
> +	size[CONT_PMD] = "1G";
> +#elif defined(CONFIG_ARM64_64K_PAGES)
> +	size[PTE] = "64k";
> +	size[CONT_PTE] = "2M";
> +	size[PMD] = "512M";
> +	size[CONT_PMD] = "16G";
> +#endif
> +
> +	seq_printf(m, "DirectMap%s:	%8lu kB\n",
> +			size[PTE], dm_meminfo[PTE] >> 10);
> +	seq_printf(m, "DirectMap%s:	%8lu kB\n",
> +			size[CONT_PTE],
> +			dm_meminfo[CONT_PTE] >> 10);
> +	seq_printf(m, "DirectMap%s:	%8lu kB\n",
> +			size[PMD], dm_meminfo[PMD] >> 10);
> +	seq_printf(m, "DirectMap%s:	%8lu kB\n",
> +			size[CONT_PMD],
> +			dm_meminfo[CONT_PMD] >> 10);
> +	if (pud_sect_supported())
> +		seq_printf(m, "DirectMap%s:	%8lu kB\n",
> +			size[PUD], dm_meminfo[PUD] >> 10);
> +}
> +
> +static inline bool is_dm_addr(unsigned long addr)
> +{
> +	return (addr >= PAGE_OFFSET) && (addr < PAGE_END);
> +}
> +
> +static inline void dm_meminfo_add(unsigned long addr, unsigned long size,
> +				  enum dm_type type)
> +{
> +	if (is_dm_addr(addr))
> +		dm_meminfo[type] += size;
> +}
> +
> +static inline void dm_meminfo_sub(unsigned long addr, unsigned long size,
> +				  enum dm_type type)
> +{
> +	if (is_dm_addr(addr))
> +		dm_meminfo[type] -= size;
> +}
> +#else
> +static inline void dm_meminfo_add(unsigned long addr, unsigned long size,
> +				  enum dm_type type)
> +{
> +}
> +
> +static inline void dm_meminfo_sub(unsigned long addr, unsigned long size,
> +				  enum dm_type type)
> +{
> +}
> +#endif
> +
>  static void init_pte(pte_t *ptep, unsigned long addr, unsigned long end,
>  		     phys_addr_t phys, pgprot_t prot)
>  {
> @@ -236,6 +316,11 @@ static int alloc_init_cont_pte(pmd_t *pmdp, unsigned long addr,
>  
>  		init_pte(ptep, addr, next, phys, __prot);
>  
> +		if (pgprot_val(__prot) & PTE_CONT)
> +			dm_meminfo_add(addr, (next - addr), CONT_PTE);
> +		else
> +			dm_meminfo_add(addr, (next - addr), PTE);
> +
>  		ptep += pte_index(next) - pte_index(addr);
>  		phys += next - addr;
>  	} while (addr = next, addr != end);
> @@ -266,6 +351,17 @@ static int init_pmd(pmd_t *pmdp, unsigned long addr, unsigned long end,
>  		    (flags & NO_BLOCK_MAPPINGS) == 0) {
>  			pmd_set_huge(pmdp, phys, prot);
>  
> +			/*
> +			 * It is possible to have mappings allow cont mapping
> +			 * but disallow block mapping. For example,
> +			 * map_entry_trampoline().
> +			 * So we have to increase CONT_PMD and PMD size here
> +			 * to avoid double counting.
> +			 */
> +			if (pgprot_val(prot) & PTE_CONT)
> +				dm_meminfo_add(addr, (next - addr), CONT_PMD);
> +			else
> +				dm_meminfo_add(addr, (next - addr), PMD);
>  			/*
>  			 * After the PMD entry has been populated once, we
>  			 * only allow updates to the permission attributes.
> @@ -389,6 +485,7 @@ static int alloc_init_pud(p4d_t *p4dp, unsigned long addr, unsigned long end,
>  		    (flags & NO_BLOCK_MAPPINGS) == 0) {
>  			pud_set_huge(pudp, phys, prot);
>  
> +			dm_meminfo_add(addr, (next - addr), PUD);
>  			/*
>  			 * After the PUD entry has been populated once, we
>  			 * only allow updates to the permission attributes.
> @@ -575,16 +672,21 @@ pgd_pgtable_alloc_special_mm(enum pgtable_type pgtable_type)
>  	return  __pgd_pgtable_alloc(NULL, GFP_PGTABLE_KERNEL, pgtable_type);
>  }
>  
> -static void split_contpte(pte_t *ptep)
> +static void split_contpte(unsigned long addr, pte_t *ptep)
>  {
>  	int i;
>  
> +	dm_meminfo_sub(addr, CONT_PTE_SIZE, CONT_PTE);
> +
>  	ptep = PTR_ALIGN_DOWN(ptep, sizeof(*ptep) * CONT_PTES);
>  	for (i = 0; i < CONT_PTES; i++, ptep++)
>  		__set_pte(ptep, pte_mknoncont(__ptep_get(ptep)));
> +
> +	dm_meminfo_add(addr, CONT_PTE_SIZE, PTE);
>  }
>  
> -static int split_pmd(pmd_t *pmdp, pmd_t pmd, gfp_t gfp, bool to_cont)
> +static int split_pmd(unsigned long addr, pmd_t *pmdp, pmd_t pmd, gfp_t gfp,
> +		     bool to_cont)
>  {
>  	pmdval_t tableprot = PMD_TYPE_TABLE | PMD_TABLE_UXN | PMD_TABLE_AF;
>  	unsigned long pfn = pmd_pfn(pmd);
> @@ -606,8 +708,13 @@ static int split_pmd(pmd_t *pmdp, pmd_t pmd, gfp_t gfp, bool to_cont)
>  	if (to_cont)
>  		prot = __pgprot(pgprot_val(prot) | PTE_CONT);
>  
> +	dm_meminfo_sub(addr, PMD_SIZE, PMD);
>  	for (i = 0; i < PTRS_PER_PTE; i++, ptep++, pfn++)
>  		__set_pte(ptep, pfn_pte(pfn, prot));
> +	if (to_cont)
> +		dm_meminfo_add(addr, PMD_SIZE, CONT_PTE);
> +	else
> +		dm_meminfo_add(addr, PMD_SIZE, PTE);
>  
>  	/*
>  	 * Ensure the pte entries are visible to the table walker by the time
> @@ -619,16 +726,21 @@ static int split_pmd(pmd_t *pmdp, pmd_t pmd, gfp_t gfp, bool to_cont)
>  	return 0;
>  }
>  
> -static void split_contpmd(pmd_t *pmdp)
> +static void split_contpmd(unsigned long addr, pmd_t *pmdp)
>  {
>  	int i;
>  
> +	dm_meminfo_sub(addr, CONT_PMD_SIZE, CONT_PMD);
> +
>  	pmdp = PTR_ALIGN_DOWN(pmdp, sizeof(*pmdp) * CONT_PMDS);
>  	for (i = 0; i < CONT_PMDS; i++, pmdp++)
>  		set_pmd(pmdp, pmd_mknoncont(pmdp_get(pmdp)));
> +
> +	dm_meminfo_add(addr, CONT_PMD_SIZE, PMD);
>  }
>  
> -static int split_pud(pud_t *pudp, pud_t pud, gfp_t gfp, bool to_cont)
> +static int split_pud(unsigned long addr, pud_t *pudp, pud_t pud, gfp_t gfp,
> +		     bool to_cont)
>  {
>  	pudval_t tableprot = PUD_TYPE_TABLE | PUD_TABLE_UXN | PUD_TABLE_AF;
>  	unsigned int step = PMD_SIZE >> PAGE_SHIFT;
> @@ -651,8 +763,13 @@ static int split_pud(pud_t *pudp, pud_t pud, gfp_t gfp, bool to_cont)
>  	if (to_cont)
>  		prot = __pgprot(pgprot_val(prot) | PTE_CONT);
>  
> +	dm_meminfo_sub(addr, PUD_SIZE, PUD);
>  	for (i = 0; i < PTRS_PER_PMD; i++, pmdp++, pfn += step)
>  		set_pmd(pmdp, pfn_pmd(pfn, prot));
> +	if (to_cont)
> +		dm_meminfo_add(addr, PUD_SIZE, CONT_PMD);
> +	else
> +		dm_meminfo_add(addr, PUD_SIZE, PMD);
>  
>  	/*
>  	 * Ensure the pmd entries are visible to the table walker by the time
> @@ -707,7 +824,7 @@ static int split_kernel_leaf_mapping_locked(unsigned long addr)
>  	if (!pud_present(pud))
>  		goto out;
>  	if (pud_leaf(pud)) {
> -		ret = split_pud(pudp, pud, GFP_PGTABLE_KERNEL, true);
> +		ret = split_pud(addr, pudp, pud, GFP_PGTABLE_KERNEL, true);
>  		if (ret)
>  			goto out;
>  	}
> @@ -725,14 +842,14 @@ static int split_kernel_leaf_mapping_locked(unsigned long addr)
>  		goto out;
>  	if (pmd_leaf(pmd)) {
>  		if (pmd_cont(pmd))
> -			split_contpmd(pmdp);
> +			split_contpmd(addr, pmdp);
>  		/*
>  		 * PMD: If addr is PMD aligned then addr already describes a
>  		 * leaf boundary. Otherwise, split to contpte.
>  		 */
>  		if (ALIGN_DOWN(addr, PMD_SIZE) == addr)
>  			goto out;
> -		ret = split_pmd(pmdp, pmd, GFP_PGTABLE_KERNEL, true);
> +		ret = split_pmd(addr, pmdp, pmd, GFP_PGTABLE_KERNEL, true);
>  		if (ret)
>  			goto out;
>  	}
> @@ -749,7 +866,7 @@ static int split_kernel_leaf_mapping_locked(unsigned long addr)
>  	if (!pte_present(pte))
>  		goto out;
>  	if (pte_cont(pte))
> -		split_contpte(ptep);
> +		split_contpte(addr, ptep);
>  
>  out:
>  	return ret;
> @@ -835,7 +952,7 @@ static int split_to_ptes_pud_entry(pud_t *pudp, unsigned long addr,
>  	int ret = 0;
>  
>  	if (pud_leaf(pud))
> -		ret = split_pud(pudp, pud, gfp, false);
> +		ret = split_pud(addr, pudp, pud, gfp, false);
>  
>  	return ret;
>  }
> @@ -849,8 +966,8 @@ static int split_to_ptes_pmd_entry(pmd_t *pmdp, unsigned long addr,
>  
>  	if (pmd_leaf(pmd)) {
>  		if (pmd_cont(pmd))
> -			split_contpmd(pmdp);
> -		ret = split_pmd(pmdp, pmd, gfp, false);
> +			split_contpmd(addr, pmdp);
> +		ret = split_pmd(addr, pmdp, pmd, gfp, false);
>  
>  		/*
>  		 * We have split the pmd directly to ptes so there is no need to
> @@ -868,7 +985,7 @@ static int split_to_ptes_pte_entry(pte_t *ptep, unsigned long addr,
>  	pte_t pte = __ptep_get(ptep);
>  
>  	if (pte_cont(pte))
> -		split_contpte(ptep);
> +		split_contpte(addr, ptep);
>  
>  	return 0;
>  }
> @@ -1444,37 +1561,57 @@ static bool pgtable_range_aligned(unsigned long start, unsigned long end,
>  	return true;
>  }
>  
> -static void unmap_hotplug_pte_range(pmd_t *pmdp, unsigned long addr,
> +static void unmap_hotplug_pte_range(pte_t *ptep, unsigned long addr,
>  				    unsigned long end, bool free_mapped,
>  				    struct vmem_altmap *altmap)
>  {
> -	pte_t *ptep, pte;
> +	pte_t pte;
>  
>  	do {
> -		ptep = pte_offset_kernel(pmdp, addr);
>  		pte = __ptep_get(ptep);
>  		if (pte_none(pte))
>  			continue;
>  
>  		WARN_ON(!pte_present(pte));
>  		__pte_clear(&init_mm, addr, ptep);
> +		dm_meminfo_sub(addr, PAGE_SIZE, PTE);
>  		flush_tlb_kernel_range(addr, addr + PAGE_SIZE);
>  		if (free_mapped)
>  			free_hotplug_page_range(pte_page(pte),
>  						PAGE_SIZE, altmap);
> -	} while (addr += PAGE_SIZE, addr < end);
> +	} while (ptep++, addr += PAGE_SIZE, addr < end);
> +}
> +
> +static void unmap_hotplug_cont_pte_range(pmd_t *pmdp, unsigned long addr,
> +					 unsigned long end, bool free_mapped,
> +					 struct vmem_altmap *altmap)
> +{
> +	unsigned long next;
> +	pte_t *ptep, pte;
> +
> +	do {
> +		next = pte_cont_addr_end(addr, end);
> +		ptep = pte_offset_kernel(pmdp, addr);
> +		pte = __ptep_get(ptep);
> +
> +		if (pte_present(pte) && pte_cont(pte)) {
> +			dm_meminfo_sub(addr, CONT_PTE_SIZE, CONT_PTE);
> +			dm_meminfo_add(addr, CONT_PTE_SIZE, PTE);
> +		}
> +
> +		unmap_hotplug_pte_range(ptep, addr, next, free_mapped, altmap);
> +	} while (addr = next, addr < end);
>  }
>  
> -static void unmap_hotplug_pmd_range(pud_t *pudp, unsigned long addr,
> +static void unmap_hotplug_pmd_range(pmd_t *pmdp, unsigned long addr,
>  				    unsigned long end, bool free_mapped,
>  				    struct vmem_altmap *altmap)
>  {
>  	unsigned long next;
> -	pmd_t *pmdp, pmd;
> +	pmd_t pmd;
>  
>  	do {
>  		next = pmd_addr_end(addr, end);
> -		pmdp = pmd_offset(pudp, addr);
>  		pmd = READ_ONCE(*pmdp);
>  		if (pmd_none(pmd))
>  			continue;
> @@ -1482,6 +1619,7 @@ static void unmap_hotplug_pmd_range(pud_t *pudp, unsigned long addr,
>  		WARN_ON(!pmd_present(pmd));
>  		if (pmd_sect(pmd)) {
>  			pmd_clear(pmdp);
> +			dm_meminfo_sub(addr, PMD_SIZE, PMD);
>  
>  			/*
>  			 * One TLBI should be sufficient here as the PMD_SIZE
> @@ -1494,7 +1632,28 @@ static void unmap_hotplug_pmd_range(pud_t *pudp, unsigned long addr,
>  			continue;
>  		}
>  		WARN_ON(!pmd_table(pmd));
> -		unmap_hotplug_pte_range(pmdp, addr, next, free_mapped, altmap);
> +		unmap_hotplug_cont_pte_range(pmdp, addr, next, free_mapped, altmap);
> +	} while (pmdp++, addr = next, addr < end);
> +}
> +
> +static void unmap_hotplug_cont_pmd_range(pud_t *pudp, unsigned long addr,
> +					 unsigned long end, bool free_mapped,
> +					 struct vmem_altmap *altmap)
> +{
> +	unsigned long next;
> +	pmd_t *pmdp, pmd;
> +
> +	do {
> +		next = pmd_cont_addr_end(addr, end);
> +		pmdp = pmd_offset(pudp, addr);
> +		pmd = READ_ONCE(*pmdp);
> +
> +		if (pmd_leaf(pmd) && pmd_cont(pmd)) {
> +			dm_meminfo_sub(addr, CONT_PMD_SIZE, CONT_PMD);
> +			dm_meminfo_add(addr, CONT_PMD_SIZE, PMD);
> +		}
> +
> +		unmap_hotplug_pmd_range(pmdp, addr, next, free_mapped, altmap);
>  	} while (addr = next, addr < end);
>  }
>  
> @@ -1515,6 +1674,7 @@ static void unmap_hotplug_pud_range(p4d_t *p4dp, unsigned long addr,
>  		WARN_ON(!pud_present(pud));
>  		if (pud_sect(pud)) {
>  			pud_clear(pudp);
> +			dm_meminfo_sub(addr, PUD_SIZE, PUD);
>  
>  			/*
>  			 * One TLBI should be sufficient here as the PUD_SIZE
> @@ -1527,7 +1687,7 @@ static void unmap_hotplug_pud_range(p4d_t *p4dp, unsigned long addr,
>  			continue;
>  		}
>  		WARN_ON(!pud_table(pud));
> -		unmap_hotplug_pmd_range(pudp, addr, next, free_mapped, altmap);
> +		unmap_hotplug_cont_pmd_range(pudp, addr, next, free_mapped, altmap);
>  	} while (addr = next, addr < end);
>  }
>  


