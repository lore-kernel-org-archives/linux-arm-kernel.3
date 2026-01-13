Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C657D2D10A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 14:36:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PGPbLlqDOLwQRMC1kxenFnMECjQprx4FIjaMtpLMPxc=; b=Rluy7wKPPsRVzJFS4STjLt2H8J
	RL20H2k6ed1NZT4QZZHAqw+ohxPZ8X+Yu2WGD1ZuUVo/ZXlkLEqdnI38Zsu0SIHyPqw9sridbKQm2
	7TcCC1O0hfQJTZjOU/zKuDEslAxXEcP74RCie4TYW1xLVYe3S9BYV+flOKDh3U8ykyuUFcwExAlFx
	/Ou9uIZW7CQShmhB8TXKJdc7uRM7OlJCavWgKVv1Uh/J0tiGYVPRDGRDwCbOroo5ET+gw1B2IMRIC
	+eGXMq/BVdd/tSLlqBhGeWhyRfVI+RFZTUe1Tv6HvvV82HPgnY+7VBZqU1C/hynL1w5YFwGqzlUcC
	ppOv6D4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vffVQ-00000007Gjg-48dS;
	Tue, 13 Jan 2026 14:36:24 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vffVM-00000007GiY-1GMH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Jan 2026 14:36:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9C9B443EFF;
	Tue, 13 Jan 2026 14:36:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3251EC116C6;
	Tue, 13 Jan 2026 14:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768314979;
	bh=86Z4hip+MUJJL8uGRUXrdvceXjZOkg+bAtzv4ooLyQQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XcRvGe4+FkVFuNga/qwlr3GpLaunQJzkLHMWsU6pv87ukMtBR5LXj5WfSgx+dxQ1q
	 6AbuSZClYds2lbhVOEJEU0fQX0h5s5T5gcqwAY1mNjokigwRq2WyOgBXkExU78x+T+
	 xn08npHhIJI/Gff4fSvXAkROuczjUl7g1qEqsRKncEn/yiGKV2ErNthyNQzIYD0ACN
	 SshrZvph9QcKxUc8PLCVwViI7eUISaOsOieWvZuffgQLpDCklbVmEOfHMXcQ3C0x0Q
	 M4FqshbjxKgFFJi+7OG8fZN/QMBmnV+XyedfMgbn3EZugXJWpthnT2hVjB+lA5W+qx
	 +N1NlX+zXVqBA==
Date: Tue, 13 Jan 2026 14:36:14 +0000
From: Will Deacon <will@kernel.org>
To: Yang Shi <yang@os.amperecomputing.com>
Cc: catalin.marinas@arm.com, ryan.roberts@arm.com, cl@gentwo.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [v5 PATCH] arm64: mm: show direct mapping use in /proc/meminfo
Message-ID: <aWZYXhrT6D2M-7-N@willie-the-truck>
References: <20260107002944.2940963-1-yang@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260107002944.2940963-1-yang@os.amperecomputing.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_063620_383378_9134DCC0 
X-CRM114-Status: GOOD (  37.50  )
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

On Tue, Jan 06, 2026 at 04:29:44PM -0800, Yang Shi wrote:
> Since commit a166563e7ec3 ("arm64: mm: support large block mapping when
> rodata=full"), the direct mapping may be split on some machines instead
> keeping static since boot. It makes more sense to show the direct mapping
> use in /proc/meminfo than before.
> This patch will make /proc/meminfo show the direct mapping use like the
> below (4K base page size):
> DirectMap4K:	   94792 kB
> DirectMap64K:	  134208 kB
> DirectMap2M:	 1173504 kB
> DirectMap32M:	 5636096 kB
> DirectMap1G:	529530880 kB
> 
> Although just the machines which support BBML2_NOABORT can split the
> direct mapping, show it on all machines regardless of BBML2_NOABORT so
> that the users have consistent view in order to avoid confusion.
> 
> Although ptdump also can tell the direct map use, but it needs to dump
> the whole kernel page table. It is costly and overkilling. It is also
> in debugfs which may not be enabled by all distros. So showing direct
> map use in /proc/meminfo seems more convenient and has less overhead.
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

const?

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

This seems a bit brittle to me. If somebody adds support for l1 block
mappings for !4k pages in future, they will forget to update this and
we'll end up returning kernel stack in /proc/meminfo afaict.

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

I don't understand the comment you're adding here. If somebody passes
NO_BLOCK_MAPPINGS then that also prevents contiguous entries except at
level 3.

It also doesn't look you handle the error case properly when the mapping
fails.

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

Is the existing code correct for contiguous entries here? I'd have
thought that we'd need to make the range non-contiguous before knocking
out the TLB.

Will

