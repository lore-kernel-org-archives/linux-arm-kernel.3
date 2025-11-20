Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02E24CF8861
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 15:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HMu0dqFHgALREtSBQrZo6Chf/2v7TekbqEU2pOdxQ/s=; b=q1F3jOyVOh5Qn9CpZJLJ1OG7EZ
	NfVLnEySV/HPwUagHzc35WA1lFFpCJHQb7jOjl77MQktxHNHAw5b1WQ2R1c9UBk38HY2cExqEVkG7
	Jnvgyj5JU1nK9x6ZDnenNJYyB3AHMEyysWho5YBJFgW+4Hy/cHhMUH1zUNS2ejumIIV93PtAc4ga1
	/0A/gfm6WP4dN9plucYVAs1gXwG3T7FquWKMuNxP2Qf8lzVGDSqN2or2FYQTskj6xmCRyHy281XHh
	xAs6WzH2ylOXsF2bG5/EGZ+9GnA8J9KwJPuzKPn4IqlSGenvtG4ZgmlkuxmpIbSj5YA3H5fO5vVKH
	XDkzzz1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM6Jn-00000006teo-0KPu;
	Thu, 20 Nov 2025 15:11:31 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM6Jk-00000006teA-0V96
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 15:11:29 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E1F22339;
	Thu, 20 Nov 2025 07:11:16 -0800 (PST)
Received: from [10.57.87.93] (unknown [10.57.87.93])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5EA3F3F66E;
	Thu, 20 Nov 2025 07:11:23 -0800 (PST)
Message-ID: <dc8a1580-a3ca-45dc-a82f-ab697011345c@arm.com>
Date: Thu, 20 Nov 2025 15:11:21 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: mm: fix direct map use over accounting
Content-Language: en-GB
To: Yang Shi <yang@os.amperecomputing.com>, catalin.marinas@arm.com,
 will@kernel.org, cl@gentwo.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251119235706.1944517-1-yang@os.amperecomputing.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <20251119235706.1944517-1-yang@os.amperecomputing.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_071128_270436_63408C43 
X-CRM114-Status: GOOD (  34.47  )
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

On 19/11/2025 23:57, Yang Shi wrote:
> The create_pgd_mapping() families may be used in other paths other than
> creating the linear map. And spliting kernel page table may be used for
> non-linear map either. So we need check whether the address is linear
> map address or not before accounting to direct map use. Encapsulate the
> linear map address check in the new add/sub helpers. The new helpers are
> nop if CONFIG_PROC_FS is not enabled.
> 
> Signed-off-by: Yang Shi <yang@os.amperecomputing.com>
> ---
>  arch/arm64/mm/mmu.c | 107 ++++++++++++++++++++++++++++----------------
>  1 file changed, 69 insertions(+), 38 deletions(-)
> 
> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
> index 8e87a80aa4f3..4f3f0dc23faa 100644
> --- a/arch/arm64/mm/mmu.c
> +++ b/arch/arm64/mm/mmu.c
> @@ -52,17 +52,6 @@
>  
>  DEFINE_STATIC_KEY_FALSE(arm64_ptdump_lock_key);
>  
> -enum direct_map_type {
> -	PTE,
> -	CONT_PTE,
> -	PMD,
> -	CONT_PMD,
> -	PUD,
> -	NR_DIRECT_MAP_TYPE,
> -};
> -
> -static unsigned long direct_map_size[NR_DIRECT_MAP_TYPE];
> -
>  u64 kimage_voffset __ro_after_init;
>  EXPORT_SYMBOL(kimage_voffset);
>  
> @@ -183,7 +172,18 @@ static void init_clear_pgtable(void *table)
>  	dsb(ishst);
>  }
>  
> +typedef enum direct_map_type {
> +	PTE,
> +	CONT_PTE,
> +	PMD,
> +	CONT_PMD,
> +	PUD,
> +	NR_DIRECT_MAP_TYPE,
> +} direct_map_type_t;

Why the typedef? I think the Linux coding standard prefers `enum
direct_map_type` right?

> +
>  #ifdef CONFIG_PROC_FS
> +static unsigned long direct_map_size[NR_DIRECT_MAP_TYPE];

All of these symbols are getting long. How about we call it dm?

enum dm_type;
static unsigned long dm_meminfo[NR_DM_TYPE];
dm_meminfo_add();
dm_meminfo_sub();

That's a bit more plesent to my eye, at least.

> +
>  void arch_report_meminfo(struct seq_file *m)
>  {
>  	char *size[NR_DIRECT_MAP_TYPE];
> @@ -220,6 +220,35 @@ void arch_report_meminfo(struct seq_file *m)
>  		seq_printf(m, "DirectMap%s:	%8lu kB\n",
>  			size[PUD], direct_map_size[PUD] >> 10);
>  }
> +
> +static inline bool is_linear_map_addr(unsigned long addr)

So we are calling it direct map everywhere else but linear map here?

Perhaps is_dm_addr() ?

> +{
> +	return (addr >= PAGE_OFFSET) && (addr < _PAGE_END(VA_BITS_MIN));

I'm not sure if this is definitely correct? We have:

#define DIRECT_MAP_PHYSMEM_END	__pa(PAGE_END - 1)

Where PAGE_END is not _PAGE_END(VA_BITS_MIN) if KASAN is enabled. Not sure if we
should be using PAGE_END here or not?

> +}
> +
> +static inline void direct_map_meminfo_add(unsigned long addr, unsigned long size,
> +					  direct_map_type_t type)
> +{
> +	if (is_linear_map_addr(addr))
> +		direct_map_size[type] += size;
> +}
> +
> +static inline void direct_map_meminfo_sub(unsigned long addr, unsigned long size,
> +					  direct_map_type_t type)
> +{
> +	if (is_linear_map_addr(addr))
> +		direct_map_size[type] -= size;
> +}

Given these are non-atomic RMW operations, is there any risk of racing which
would break accounting? i.e.

THREAD A		THREAD B

read
			read
modify (+ N)
write
			modify (+ M)
			write

We would fail to account N here.

I think this is probably safe for the split case; we have the split lock for
that already. And I think for populating the initial linear map, that's single
threaded during boot.

But what about hot[un]plug? Is there anything stopping concurrent split with
linear map population due to hotplug?


> +#else
> +static inline void direct_map_meminfo_add(unsigned long addr, unsigned long size,
> +					  direct_map_type_t type)
> +{
> +}
> +
> +static inline void direct_map_meminfo_sub(unsigned long addr, unsigned long size,
> +					  direct_map_type_t type)
> +{
> +}
>  #endif
>  
>  static void init_pte(pte_t *ptep, unsigned long addr, unsigned long end,
> @@ -286,9 +315,9 @@ static void alloc_init_cont_pte(pmd_t *pmdp, unsigned long addr,
>  		init_pte(ptep, addr, next, phys, __prot);
>  
>  		if (pgprot_val(__prot) & PTE_CONT)
> -			direct_map_size[CONT_PTE] += next - addr;
> +			direct_map_meminfo_add(addr, (next - addr), CONT_PTE);
>  		else
> -			direct_map_size[PTE] += next - addr;
> +			direct_map_meminfo_add(addr, (next - addr), PTE);
>  
>  		ptep += pte_index(next) - pte_index(addr);
>  		phys += next - addr;
> @@ -326,9 +355,9 @@ static void init_pmd(pmd_t *pmdp, unsigned long addr, unsigned long end,
>  			 * to avoid double counting.
>  			 */
>  			if (pgprot_val(prot) & PTE_CONT)
> -				direct_map_size[CONT_PMD] += next - addr;
> +				direct_map_meminfo_add(addr, (next - addr), CONT_PMD);
>  			else
> -				direct_map_size[PMD] += next - addr;
> +				direct_map_meminfo_add(addr, (next - addr), PMD);
>  			/*
>  			 * After the PMD entry has been populated once, we
>  			 * only allow updates to the permission attributes.
> @@ -435,7 +464,7 @@ static void alloc_init_pud(p4d_t *p4dp, unsigned long addr, unsigned long end,
>  		    (flags & NO_BLOCK_MAPPINGS) == 0) {
>  			pud_set_huge(pudp, phys, prot);
>  
> -			direct_map_size[PUD] += next - addr;
> +			direct_map_meminfo_add(addr, (next - addr), PUD);
>  			/*
>  			 * After the PUD entry has been populated once, we
>  			 * only allow updates to the permission attributes.
> @@ -596,20 +625,21 @@ pgd_pgtable_alloc_special_mm(enum pgtable_type pgtable_type)
>  	return pa;
>  }
>  
> -static void split_contpte(pte_t *ptep)
> +static void split_contpte(unsigned long addr, pte_t *ptep)
>  {
>  	int i;
>  
> -	direct_map_size[CONT_PTE] -= CONT_PTE_SIZE;
> +	direct_map_meminfo_sub(addr, CONT_PTE_SIZE, CONT_PTE);
>  
>  	ptep = PTR_ALIGN_DOWN(ptep, sizeof(*ptep) * CONT_PTES);
>  	for (i = 0; i < CONT_PTES; i++, ptep++)
>  		__set_pte(ptep, pte_mknoncont(__ptep_get(ptep)));
>  
> -	direct_map_size[PTE] += CONT_PTE_SIZE;
> +	direct_map_meminfo_add(addr, CONT_PTE_SIZE, PTE);

We have a pattern here where memory disappears from one bucket then reappears in
another. Userspace could sample in between the 2 operations. Is that ok? Nobody
has told me what the use cases for this feature are yet (beyond "it might be
useful for debug"). So I can't tell...


Overall, my opinion is that this patch is not quite cooked yet. Personally I'd
prefer to see the first half reverted then we can wait another cycle until this
is ready and apply it all in one go.

Thanks,
Ryan


>  }
>  
> -static int split_pmd(pmd_t *pmdp, pmd_t pmd, gfp_t gfp, bool to_cont)
> +static int split_pmd(unsigned long addr, pmd_t *pmdp, pmd_t pmd, gfp_t gfp,
> +		     bool to_cont)
>  {
>  	pmdval_t tableprot = PMD_TYPE_TABLE | PMD_TABLE_UXN | PMD_TABLE_AF;
>  	unsigned long pfn = pmd_pfn(pmd);
> @@ -631,13 +661,13 @@ static int split_pmd(pmd_t *pmdp, pmd_t pmd, gfp_t gfp, bool to_cont)
>  	if (to_cont)
>  		prot = __pgprot(pgprot_val(prot) | PTE_CONT);
>  
> -	direct_map_size[PMD] -= PMD_SIZE;
> +	direct_map_meminfo_sub(addr, PMD_SIZE, PMD);
>  	for (i = 0; i < PTRS_PER_PTE; i++, ptep++, pfn++)
>  		__set_pte(ptep, pfn_pte(pfn, prot));
>  	if (to_cont)
> -		direct_map_size[CONT_PTE] += PMD_SIZE;
> +		direct_map_meminfo_add(addr, PMD_SIZE, CONT_PTE);
>  	else
> -		direct_map_size[PTE] += PMD_SIZE;
> +		direct_map_meminfo_add(addr, PMD_SIZE, PTE);
>  
>  	/*
>  	 * Ensure the pte entries are visible to the table walker by the time
> @@ -649,20 +679,21 @@ static int split_pmd(pmd_t *pmdp, pmd_t pmd, gfp_t gfp, bool to_cont)
>  	return 0;
>  }
>  
> -static void split_contpmd(pmd_t *pmdp)
> +static void split_contpmd(unsigned long addr, pmd_t *pmdp)
>  {
>  	int i;
>  
> -	direct_map_size[CONT_PMD] -= CONT_PMD_SIZE;
> +	direct_map_meminfo_sub(addr, CONT_PMD_SIZE, CONT_PMD);
>  
>  	pmdp = PTR_ALIGN_DOWN(pmdp, sizeof(*pmdp) * CONT_PMDS);
>  	for (i = 0; i < CONT_PMDS; i++, pmdp++)
>  		set_pmd(pmdp, pmd_mknoncont(pmdp_get(pmdp)));
>  
> -	direct_map_size[PMD] += CONT_PMD_SIZE;
> +	direct_map_meminfo_add(addr, CONT_PMD_SIZE, PMD);
>  }
>  
> -static int split_pud(pud_t *pudp, pud_t pud, gfp_t gfp, bool to_cont)
> +static int split_pud(unsigned long addr, pud_t *pudp, pud_t pud, gfp_t gfp,
> +		     bool to_cont)
>  {
>  	pudval_t tableprot = PUD_TYPE_TABLE | PUD_TABLE_UXN | PUD_TABLE_AF;
>  	unsigned int step = PMD_SIZE >> PAGE_SHIFT;
> @@ -685,13 +716,13 @@ static int split_pud(pud_t *pudp, pud_t pud, gfp_t gfp, bool to_cont)
>  	if (to_cont)
>  		prot = __pgprot(pgprot_val(prot) | PTE_CONT);
>  
> -	direct_map_size[PUD] -= PUD_SIZE;
> +	direct_map_meminfo_sub(addr, PUD_SIZE, PUD);
>  	for (i = 0; i < PTRS_PER_PMD; i++, pmdp++, pfn += step)
>  		set_pmd(pmdp, pfn_pmd(pfn, prot));
>  	if (to_cont)
> -		direct_map_size[CONT_PMD] += PUD_SIZE;
> +		direct_map_meminfo_add(addr, PUD_SIZE, CONT_PMD);
>  	else
> -		direct_map_size[PMD] += PUD_SIZE;
> +		direct_map_meminfo_add(addr, PUD_SIZE, PMD);
>  
>  	/*
>  	 * Ensure the pmd entries are visible to the table walker by the time
> @@ -746,7 +777,7 @@ static int split_kernel_leaf_mapping_locked(unsigned long addr)
>  	if (!pud_present(pud))
>  		goto out;
>  	if (pud_leaf(pud)) {
> -		ret = split_pud(pudp, pud, GFP_PGTABLE_KERNEL, true);
> +		ret = split_pud(addr, pudp, pud, GFP_PGTABLE_KERNEL, true);
>  		if (ret)
>  			goto out;
>  	}
> @@ -764,14 +795,14 @@ static int split_kernel_leaf_mapping_locked(unsigned long addr)
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
> @@ -788,7 +819,7 @@ static int split_kernel_leaf_mapping_locked(unsigned long addr)
>  	if (!pte_present(pte))
>  		goto out;
>  	if (pte_cont(pte))
> -		split_contpte(ptep);
> +		split_contpte(addr, ptep);
>  
>  out:
>  	return ret;
> @@ -875,7 +906,7 @@ static int split_to_ptes_pud_entry(pud_t *pudp, unsigned long addr,
>  	int ret = 0;
>  
>  	if (pud_leaf(pud))
> -		ret = split_pud(pudp, pud, gfp, false);
> +		ret = split_pud(addr, pudp, pud, gfp, false);
>  
>  	return ret;
>  }
> @@ -889,8 +920,8 @@ static int split_to_ptes_pmd_entry(pmd_t *pmdp, unsigned long addr,
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
> @@ -908,7 +939,7 @@ static int split_to_ptes_pte_entry(pte_t *ptep, unsigned long addr,
>  	pte_t pte = __ptep_get(ptep);
>  
>  	if (pte_cont(pte))
> -		split_contpte(ptep);
> +		split_contpte(addr, ptep);
>  
>  	return 0;
>  }


