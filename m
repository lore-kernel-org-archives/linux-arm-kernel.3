Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28A5FC624C6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 09:13:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BsPv7ss2onHvHdk/3P50JdoC99F+mm6qYKIbQPzl6Jc=; b=qqV8fAqY+q/kXv0kfSp6B7iNSy
	sZ8i8XIRmjWRnXKi+vB1olytPmNnAhD7vTrhLD9c7Aie0+6d6yxy6Nj8TS39dRTNbXSgZS98hT40r
	KBakROPiDzZ29ECMQV4oNCMY8+u+JmuG+nBLhLsLAMvxI2xD98INiq3XITFYidT8Bc5I0rkiiyUWr
	Ca1aGMfPcQI48m83lEFWiV1nhhAW3UbfGqei0lmFwtpxvWW4jg6kOOxbz1bqJUJ+DSO2KDifxy/Ky
	kyWmGX1nV4DVZ0WAxW3tDj/hlZPxJVMA6LdDx5MG3paD/Cfz5553aOirswbtXsi/0fd3NdoUNImAv
	xgzzaeFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1KXx-0000000BO7u-31y1;
	Tue, 01 Sep 2026 09:12:49 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1KXu-0000000BO6c-1yAa
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 09:12:47 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6CCA51692;
	Tue,  1 Sep 2026 02:12:41 -0700 (PDT)
Received: from [10.57.7.38] (unknown [10.57.7.38])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9B0C83F882;
	Tue,  1 Sep 2026 02:12:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788253965; bh=enREb1hLGIClDSI+lR+nr45S0v/YM3qCIAqmJ+ULnY8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=XH8iJLfvsMXeORfFTF89ERe9JUlZvJARNBcZWwfUQE2T9861yn/HMZogx9C4fIj3V
	 j7WfImyT5SkqS6Kxbi3g9xjYmkE/Wz2rbhh4orvh/nNpxbcjemwTfuBiPG5aYmfDwF
	 tsR3YlHncQ5sUPZO2Ei8CisvSYKyxf3IS2ErD+SA=
Message-ID: <9f7e0bc4-2825-4ef9-abb1-41e0ffea8e2d@arm.com>
Date: Tue, 1 Sep 2026 11:12:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 2/4] arm64: mm: Use fault handler to permit
 swapper_pg_dir updates
To: Ard Biesheuvel <ardb+git@google.com>, linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>
References: <20260827164409.3421848-6-ardb+git@google.com>
 <20260827164409.3421848-8-ardb+git@google.com>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <20260827164409.3421848-8-ardb+git@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_021246_591077_8484CB08 
X-CRM114-Status: GOOD (  23.83  )
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

On 27/08/2026 18:44, Ard Biesheuvel wrote:
> From: Ard Biesheuvel <ardb@kernel.org>
>
> Instead of checking the destination of a page table descriptor update
> against the virtual address of swapper_pg_dir in the kernel image, and
> taking a dedicated path to perform such updates via a fixmap alias,
> rely on a fault handler to do so if the plain store faulted.
>
> This is more efficient for the general case, and makes it more
> straight-forward to extend this logic to other page tables that may have
> been allocated statically in the .rodata region of the kernel image.
>
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> ---
>  arch/arm64/include/asm/fixmap.h  |  1 +
>  arch/arm64/include/asm/pgtable.h | 49 +++++++++-----------
>  arch/arm64/mm/mmu.c              | 18 +++----
>  3 files changed, 32 insertions(+), 36 deletions(-)
>
> diff --git a/arch/arm64/include/asm/fixmap.h b/arch/arm64/include/asm/fixmap.h
> index 9191125738e9..8db791dcb4cb 100644
> --- a/arch/arm64/include/asm/fixmap.h
> +++ b/arch/arm64/include/asm/fixmap.h
> @@ -99,6 +99,7 @@ enum fixed_addresses {
>  	FIX_PUD,
>  	FIX_P4D,
>  	FIX_PGD,

Doesn't FIX_PTVAL replace FIX_PGD (i.e. we can remove it)?

> +	FIX_PTVAL,
>  
>  	__end_of_fixed_addresses
>  };
> diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
> index 6000905a2e86..799cd9d52c28 100644
> --- a/arch/arm64/include/asm/pgtable.h
> +++ b/arch/arm64/include/asm/pgtable.h
> @@ -35,6 +35,7 @@
>  #include <asm/cmpxchg.h>
>  #include <asm/fixmap.h>
>  #include <asm/por.h>
> +#include <asm/uaccess.h>
>  #include <linux/mmdebug.h>
>  #include <linux/mm_types.h>
>  #include <linux/sched.h>
> @@ -814,7 +815,7 @@ extern pgd_t idmap_pg_dir[];
>  extern pgd_t tramp_pg_dir[];
>  extern pgd_t reserved_pg_dir[];
>  
> -extern void set_swapper_pgd(pgd_t *pgdp, pgd_t pgd);
> +void try_set_readonly_ptval(ptval_t *ptvalp, ptval_t ptval);
>  
>  static inline bool in_swapper_pgdir(void *addr)
>  {
> @@ -824,17 +825,14 @@ static inline bool in_swapper_pgdir(void *addr)
>  
>  static inline void set_pmd(pmd_t *pmdp, pmd_t pmd)
>  {
> -#ifdef __PAGETABLE_PMD_FOLDED
> -	if (in_swapper_pgdir(pmdp)) {
> -		set_swapper_pgd((pgd_t *)pmdp, __pgd(pmd_val(pmd)));
> -		return;
> -	}
> -#endif /* __PAGETABLE_PMD_FOLDED */
> -
> -	WRITE_ONCE(*pmdp, pmd);
> +	__put_kernel_nofault(pmdp, &pmd, pmd_t, fault);
>  
>  	if (pmd_valid(pmd))
>  		queue_pte_barriers();
> +	return;
> +
> +fault:
> +	try_set_readonly_ptval(&pmd_val(*pmdp), pmd_val(pmd));
>  }
>  
>  static inline void pmd_clear(pmd_t *pmdp)
> @@ -890,15 +888,14 @@ static inline bool pgtable_l4_enabled(void);
>  
>  static inline void set_pud(pud_t *pudp, pud_t pud)
>  {
> -	if (!pgtable_l4_enabled() && in_swapper_pgdir(pudp)) {
> -		set_swapper_pgd((pgd_t *)pudp, __pgd(pud_val(pud)));
> -		return;
> -	}
> -
> -	WRITE_ONCE(*pudp, pud);
> +	__put_kernel_nofault(pudp, &pud, pud_t, fault);
>  
>  	if (pud_valid(pud))
>  		queue_pte_barriers();
> +	return;
> +
> +fault:
> +	try_set_readonly_ptval(&pud_val(*pudp), pud_val(pud));
>  }
>  
>  static inline void pud_clear(pud_t *pudp)
> @@ -971,13 +968,12 @@ static inline bool mm_pud_folded(const struct mm_struct *mm)
>  
>  static inline void set_p4d(p4d_t *p4dp, p4d_t p4d)
>  {
> -	if (in_swapper_pgdir(p4dp)) {
> -		set_swapper_pgd((pgd_t *)p4dp, __pgd(p4d_val(p4d)));
> -		return;
> -	}
> -
> -	WRITE_ONCE(*p4dp, p4d);
> +	__put_kernel_nofault(p4dp, &p4d, p4d_t, fault);
>  	queue_pte_barriers();
> +	return;
> +
> +fault:
> +	try_set_readonly_ptval(&p4d_val(*p4dp), p4d_val(p4d));
>  }
>  
>  static inline void p4d_clear(p4d_t *p4dp)
> @@ -1099,13 +1095,12 @@ static inline bool mm_p4d_folded(const struct mm_struct *mm)
>  
>  static inline void set_pgd(pgd_t *pgdp, pgd_t pgd)
>  {
> -	if (in_swapper_pgdir(pgdp)) {
> -		set_swapper_pgd(pgdp, __pgd(pgd_val(pgd)));
> -		return;
> -	}
> -
> -	WRITE_ONCE(*pgdp, pgd);
> +	__put_kernel_nofault(pgdp, &pgd, pgd_t, fault);
>  	queue_pte_barriers();
> +	return;
> +
> +fault:
> +	try_set_readonly_ptval(&pgd_val(*pgdp), pgd_val(pgd));
>  }
>  
>  static inline void pgd_clear(pgd_t *pgdp)
> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
> index 9c1aa838e9d5..b97e4bf99ca5 100644
> --- a/arch/arm64/mm/mmu.c
> +++ b/arch/arm64/mm/mmu.c
> @@ -63,34 +63,34 @@ static bool rodata_is_rw __ro_after_init = true;
>   */
>  long __section(".mmuoff.data.write") __early_cpu_boot_status;
>  
> -static DEFINE_SPINLOCK(swapper_pgdir_lock);

Might be nicer to change this in a separate patch as AFAICT it's not
related/required for this patch.

>  static DEFINE_MUTEX(fixmap_lock);
>  
> -void noinstr set_swapper_pgd(pgd_t *pgdp, pgd_t pgd)
> +void noinstr try_set_readonly_ptval(ptval_t *ptvalp, ptval_t ptval)
>  {
> -	pgd_t *fixmap_pgdp;
> +	static DEFINE_SPINLOCK(lock);
> +
> +	BUG_ON(!in_swapper_pgdir(ptvalp));
>  
>  	/*
>  	 * Don't bother with the fixmap if swapper_pg_dir is still mapped
>  	 * writable in the kernel mapping.
>  	 */
>  	if (rodata_is_rw) {

Is that ever a valid situation? If rodata_is_rw, then we shouldn't be
here in the first place and that deserves a BUG_ON(), no?

- Kevin

> -		WRITE_ONCE(*pgdp, pgd);
> +		WRITE_ONCE(*ptvalp, ptval);
>  		dsb(ishst);
>  		isb();
>  		return;
>  	}
>  
> -	spin_lock(&swapper_pgdir_lock);
> -	fixmap_pgdp = pgd_set_fixmap(__pa_symbol(pgdp));
> -	WRITE_ONCE(*fixmap_pgdp, pgd);
> +	guard(spinlock)(&lock);
> +	ptvalp = (ptval_t *)set_fixmap_offset(FIX_PTVAL, __pa_symbol(ptvalp));
> +	WRITE_ONCE(*ptvalp, ptval);
>  	/*
>  	 * We need dsb(ishst) here to ensure the page-table-walker sees
>  	 * our new entry before set_p?d() returns. The fixmap's
>  	 * flush_tlb_kernel_range() via clear_fixmap() does this for us.
>  	 */
> -	pgd_clear_fixmap();
> -	spin_unlock(&swapper_pgdir_lock);
> +	clear_fixmap(FIX_PTVAL);
>  }
>  
>  pgprot_t phys_mem_access_prot(struct file *file, unsigned long pfn,

