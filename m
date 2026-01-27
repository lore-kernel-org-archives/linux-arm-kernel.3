Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBDF1D2D8E3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 10:10:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kKviwgEmWHsQnrzQDjTsxjCmthmvFhSBQCaJ3jESCJ4=; b=pJqsft+vdlC88/5dARRHoFFik1
	+YAPAHBbGSxZYL0AkZPl9gb1NBpW2exU2RjW0k63ACDtOwTyDKVNHF8E/EH5NUDDZWZ9zqBEAHwjz
	H7GoGkbJAed4XaqFI6TmAoF44VCAbEv0RtuqfceXhzjm61LNhF7p3TYyjk/gLmaE5blGf7fnLClLX
	kbUOs0h7O5ewtM3Vah9qBP/TYtsCIl/l4ODRtcpOWr69QTmbRWymVaXlHv0gelMZ1UYAhzO/OjTUY
	OwAqQUfqdIuq6l9NSJ+sb8Spywx6kUlIAaCdVxxJDvSVo7o6tch7nAPR734APzxg93Ul+gZmo/jmo
	Q5jXWppQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkg1n-0000000E1jV-3WAe;
	Tue, 27 Jan 2026 10:10:31 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkg1k-0000000E1j4-2QLj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 10:10:29 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A18521595;
	Tue, 27 Jan 2026 02:10:20 -0800 (PST)
Received: from [10.57.94.246] (unknown [10.57.94.246])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4F6283F73F;
	Tue, 27 Jan 2026 02:10:25 -0800 (PST)
Message-ID: <49dfb613-3075-4b55-8873-9b72aa4de85c@arm.com>
Date: Tue, 27 Jan 2026 10:10:23 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/10] arm64: mm: Drop redundant pgd_t* argument from
 map_mem()
Content-Language: en-GB
To: Ard Biesheuvel <ardb+git@google.com>, linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, will@kernel.org,
 catalin.marinas@arm.com, mark.rutland@arm.com,
 Ard Biesheuvel <ardb@kernel.org>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Liz Prucka <lizprucka@google.com>, Seth Jenkins <sethjenkins@google.com>,
 Kees Cook <kees@kernel.org>, linux-hardening@vger.kernel.org
References: <20260126092630.1800589-12-ardb+git@google.com>
 <20260126092630.1800589-19-ardb+git@google.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <20260126092630.1800589-19-ardb+git@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_021028_771390_B21DCDAD 
X-CRM114-Status: GOOD (  18.05  )
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

On 26/01/2026 09:26, Ard Biesheuvel wrote:
> From: Ard Biesheuvel <ardb@kernel.org>
> 
> __map_memblock() and map_mem() always operate on swapper_pg_dir, so
> there is no need to pass around a pgd_t pointer between them.
> 
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>

nice simplification:

Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>

> ---
>  arch/arm64/mm/mmu.c | 25 ++++++++++----------
>  1 file changed, 12 insertions(+), 13 deletions(-)
> 
> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
> index 377bdc4d84a1..80587cd47ce7 100644
> --- a/arch/arm64/mm/mmu.c
> +++ b/arch/arm64/mm/mmu.c
> @@ -1020,11 +1020,11 @@ static void update_mapping_prot(phys_addr_t phys, unsigned long virt,
>  	flush_tlb_kernel_range(virt, virt + size);
>  }
>  
> -static void __init __map_memblock(pgd_t *pgdp, phys_addr_t start,
> -				  phys_addr_t end, pgprot_t prot, int flags)
> +static void __init __map_memblock(phys_addr_t start, phys_addr_t end,
> +				  pgprot_t prot, int flags)
>  {
> -	early_create_pgd_mapping(pgdp, start, __phys_to_virt(start), end - start,
> -				 prot, early_pgtable_alloc, flags);
> +	early_create_pgd_mapping(swapper_pg_dir, start, __phys_to_virt(start),
> +				 end - start, prot, early_pgtable_alloc, flags);
>  }
>  
>  void __init mark_linear_text_alias_ro(void)
> @@ -1072,13 +1072,13 @@ static phys_addr_t __init arm64_kfence_alloc_pool(void)
>  	return kfence_pool;
>  }
>  
> -static void __init arm64_kfence_map_pool(phys_addr_t kfence_pool, pgd_t *pgdp)
> +static void __init arm64_kfence_map_pool(phys_addr_t kfence_pool)
>  {
>  	if (!kfence_pool)
>  		return;
>  
>  	/* KFENCE pool needs page-level mapping. */
> -	__map_memblock(pgdp, kfence_pool, kfence_pool + KFENCE_POOL_SIZE,
> +	__map_memblock(kfence_pool, kfence_pool + KFENCE_POOL_SIZE,
>  			pgprot_tagged(PAGE_KERNEL),
>  			NO_BLOCK_MAPPINGS | NO_CONT_MAPPINGS);
>  	memblock_clear_nomap(kfence_pool, KFENCE_POOL_SIZE);
> @@ -1114,11 +1114,11 @@ bool arch_kfence_init_pool(void)
>  #else /* CONFIG_KFENCE */
>  
>  static inline phys_addr_t arm64_kfence_alloc_pool(void) { return 0; }
> -static inline void arm64_kfence_map_pool(phys_addr_t kfence_pool, pgd_t *pgdp) { }
> +static inline void arm64_kfence_map_pool(phys_addr_t kfence_pool) { }
>  
>  #endif /* CONFIG_KFENCE */
>  
> -static void __init map_mem(pgd_t *pgdp)
> +static void __init map_mem(void)
>  {
>  	static const u64 direct_map_end = _PAGE_END(VA_BITS_MIN);
>  	phys_addr_t kernel_start = __pa_symbol(_text);
> @@ -1163,7 +1163,7 @@ static void __init map_mem(pgd_t *pgdp)
>  		 * if MTE is present. Otherwise, it has the same attributes as
>  		 * PAGE_KERNEL.
>  		 */
> -		__map_memblock(pgdp, start, end, pgprot_tagged(PAGE_KERNEL),
> +		__map_memblock(start, end, pgprot_tagged(PAGE_KERNEL),
>  			       flags);
>  	}
>  
> @@ -1177,10 +1177,9 @@ static void __init map_mem(pgd_t *pgdp)
>  	 * Note that contiguous mappings cannot be remapped in this way,
>  	 * so we should avoid them here.
>  	 */
> -	__map_memblock(pgdp, kernel_start, kernel_end,
> -		       PAGE_KERNEL, NO_CONT_MAPPINGS);
> +	__map_memblock(kernel_start, kernel_end, PAGE_KERNEL, NO_CONT_MAPPINGS);
>  	memblock_clear_nomap(kernel_start, kernel_end - kernel_start);
> -	arm64_kfence_map_pool(early_kfence_pool, pgdp);
> +	arm64_kfence_map_pool(early_kfence_pool);
>  }
>  
>  void mark_rodata_ro(void)
> @@ -1402,7 +1401,7 @@ static void __init create_idmap(void)
>  
>  void __init paging_init(void)
>  {
> -	map_mem(swapper_pg_dir);
> +	map_mem();
>  
>  	memblock_allow_resize();
>  


