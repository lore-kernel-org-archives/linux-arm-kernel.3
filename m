Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A064C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Jul 2026 07:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RaWTjqm9JXhXtr4kD+z/Qmo/k+uwJ7cEWIhik1ibKBM=; b=wHxT6sVwtEoPOyfe4XjQUUTYZ3
	9TliC1w3vufSRFqDptC8FYnYgHtKTAI5JPl64mWD0LM/PhIu1AcMsVUb6JmqReDmaxgmFFVnbJEqD
	vF0idWChv7Cm8ep9ESXhJ4KBPHm+HXPL0okoZb450Mr5Kb3hWuxF6lNKfnG0wHe4Xzz6i9URX5xL+
	wWHOfQRmpI0zS2zDmvEQzT6kyCvjnWiAHaRW04yURcWRLtqmyyMTLk7s7PelGYajn4gqw+RNBxg0z
	2meP8BtA2vPWV70wDxY5EZfF+jU9lQjH5uM3NNqJdnYsZ32EmomPTR0hTxkvgVpD9z8naXOKKfQFu
	FbRH6ixQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiotR-00000007EtR-1qnX;
	Sun, 12 Jul 2026 07:46:29 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiotO-00000007Et4-49Sn
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Jul 2026 07:46:28 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6B1BA1682;
	Sun, 12 Jul 2026 00:46:21 -0700 (PDT)
Received: from [10.163.129.143] (unknown [10.163.129.143])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7C97F3F85F;
	Sun, 12 Jul 2026 00:46:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783842385; bh=nohsd7GiLakObGLBaDIO4H+sVaQd7yxCodOtnB+4Jxk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=YnV5CLLNFnCF8n0m7G1DlD52+qpTPsqCfAvqMWKko4vIjG5vQF3+EDtL/TowISGrD
	 Jks/j+ZCOhOowMhkoA7z0I626qdfwRYb+sNFzeo7vJarzWxk5cRtdIyqs/N/S0Vn+V
	 nbo69oXFxbzeFtCUOsbNptWEYbXqYGZaGsASZh48=
Message-ID: <daed9269-b397-4f6b-bfda-6d81e1be2f52@arm.com>
Date: Sun, 12 Jul 2026 13:16:17 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] Revert "arm64: Enable vmalloc-huge with ptdump"
To: Lorenzo Stoakes <ljs@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Suren Baghdasaryan <surenb@google.com>, "Liam R. Howlett"
 <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
 Shakeel Butt <shakeel.butt@linux.dev>, David Hildenbrand <david@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Michal Hocko <mhocko@suse.com>,
 Uladzislau Rezki <urezki@gmail.com>, Toshi Kani <toshi.kani@hpe.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: David Carlier <devnexen@gmail.com>, Ryan Roberts <ryan.roberts@arm.com>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20260710-series-vmap-race-fix-v1-0-5b3794c113fe@kernel.org>
 <20260710-series-vmap-race-fix-v1-2-5b3794c113fe@kernel.org>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <20260710-series-vmap-race-fix-v1-2-5b3794c113fe@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260712_004627_122660_4DC1AF95 
X-CRM114-Status: GOOD (  26.46  )
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



On 10/07/26 4:19 pm, Lorenzo Stoakes wrote:
> This partially reverts commit fa93b45fd397 ("arm64: Enable vmalloc-huge
> with ptdump"), retaining vmalloc-huge support but eliminating the now
> redundant mitigation against a race between huge vmap page table freeing
> and ptdump, as this issue has now been fixed at core.
> 
> We also simultaneously remove the arm64 ifdeffery when acquiring the mmap
> read lock upon vmap huge page table promotion as it is no longer required.
> 
> Signed-off-by: Lorenzo Stoakes <ljs@kernel.org>
> ---

As pointed out by Mike, the subject line doesn't fit. Perhaps just start with
"Partially revert ..."


Reviewed-by: Dev Jain <dev.jain@arm.com>

>  arch/arm64/include/asm/ptdump.h |  2 --
>  arch/arm64/mm/mmu.c             | 43 ++++-------------------------------------
>  arch/arm64/mm/ptdump.c          | 11 ++---------
>  mm/vmalloc.c                    | 15 +++-----------
>  4 files changed, 9 insertions(+), 62 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/ptdump.h b/arch/arm64/include/asm/ptdump.h
> index 5b374a6ab34a..50a195eda8ed 100644
> --- a/arch/arm64/include/asm/ptdump.h
> +++ b/arch/arm64/include/asm/ptdump.h
> @@ -7,8 +7,6 @@
>  
>  #include <linux/ptdump.h>
>  
> -DECLARE_STATIC_KEY_FALSE(arm64_ptdump_lock_key);
> -
>  #ifdef CONFIG_PTDUMP
>  
>  #include <linux/mm_types.h>
> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
> index f2be501468ce..f723bcf68174 100644
> --- a/arch/arm64/mm/mmu.c
> +++ b/arch/arm64/mm/mmu.c
> @@ -49,8 +49,6 @@
>  #define NO_CONT_MAPPINGS	BIT(1)
>  #define NO_EXEC_MAPPINGS	BIT(2)	/* assumes FEAT_HPDS is not used */
>  
> -DEFINE_STATIC_KEY_FALSE(arm64_ptdump_lock_key);
> -
>  u64 kimage_voffset __ro_after_init;
>  EXPORT_SYMBOL(kimage_voffset);
>  
> @@ -1857,8 +1855,7 @@ int pmd_clear_huge(pmd_t *pmdp)
>  	return 1;
>  }
>  
> -static int __pmd_free_pte_page(pmd_t *pmdp, unsigned long addr,
> -			       bool acquire_mmap_lock)
> +int pmd_free_pte_page(pmd_t *pmdp, unsigned long addr)
>  {
>  	pte_t *table;
>  	pmd_t pmd;
> @@ -1870,25 +1867,13 @@ static int __pmd_free_pte_page(pmd_t *pmdp, unsigned long addr,
>  		return 1;
>  	}
>  
> -	/* See comment in pud_free_pmd_page for static key logic */
>  	table = pte_offset_kernel(pmdp, addr);
>  	pmd_clear(pmdp);
>  	__flush_tlb_kernel_pgtable(addr);
> -	if (static_branch_unlikely(&arm64_ptdump_lock_key) && acquire_mmap_lock) {
> -		mmap_read_lock(&init_mm);
> -		mmap_read_unlock(&init_mm);
> -	}
> -
>  	pte_free_kernel(NULL, table);
>  	return 1;
>  }
>  
> -int pmd_free_pte_page(pmd_t *pmdp, unsigned long addr)
> -{
> -	/* If ptdump is walking the pagetables, acquire init_mm.mmap_lock */
> -	return __pmd_free_pte_page(pmdp, addr, /* acquire_mmap_lock = */ true);
> -}
> -
>  int pud_free_pmd_page(pud_t *pudp, unsigned long addr)
>  {
>  	pmd_t *table;
> @@ -1904,36 +1889,16 @@ int pud_free_pmd_page(pud_t *pudp, unsigned long addr)
>  	}
>  
>  	table = pmd_offset(pudp, addr);
> -
> -	/*
> -	 * Our objective is to prevent ptdump from reading a PMD table which has
> -	 * been freed. In this race, if pud_free_pmd_page observes the key on
> -	 * (which got flipped by ptdump) then the mmap lock sequence here will,
> -	 * as a result of the mmap write lock/unlock sequence in ptdump, give
> -	 * us the correct synchronization. If not, this means that ptdump has
> -	 * yet not started walking the pagetables - the sequence of barriers
> -	 * issued by __flush_tlb_kernel_pgtable() guarantees that ptdump will
> -	 * observe an empty PUD.
> -	 */
> -	pud_clear(pudp);
> -	__flush_tlb_kernel_pgtable(addr);
> -	if (static_branch_unlikely(&arm64_ptdump_lock_key)) {
> -		mmap_read_lock(&init_mm);
> -		mmap_read_unlock(&init_mm);
> -	}
> -
>  	pmdp = table;
>  	next = addr;
>  	end = addr + PUD_SIZE;
>  	do {
>  		if (pmd_present(pmdp_get(pmdp)))
> -			/*
> -			 * PMD has been isolated, so ptdump won't see it. No
> -			 * need to acquire init_mm.mmap_lock.
> -			 */
> -			__pmd_free_pte_page(pmdp, next, /* acquire_mmap_lock = */ false);
> +			pmd_free_pte_page(pmdp, next);
>  	} while (pmdp++, next += PMD_SIZE, next != end);
>  
> +	pud_clear(pudp);
> +	__flush_tlb_kernel_pgtable(addr);
>  	pmd_free(NULL, table);
>  	return 1;
>  }
> diff --git a/arch/arm64/mm/ptdump.c b/arch/arm64/mm/ptdump.c
> index 1c20144700d7..5a76c59b5ada 100644
> --- a/arch/arm64/mm/ptdump.c
> +++ b/arch/arm64/mm/ptdump.c
> @@ -283,13 +283,6 @@ void note_page_flush(struct ptdump_state *pt_st)
>  	note_page(pt_st, 0, -1, pte_val(pte_zero));
>  }
>  
> -static void arm64_ptdump_walk_pgd(struct ptdump_state *st, struct mm_struct *mm)
> -{
> -	static_branch_inc(&arm64_ptdump_lock_key);
> -	ptdump_walk_pgd(st, mm, NULL);
> -	static_branch_dec(&arm64_ptdump_lock_key);
> -}
> -
>  void ptdump_walk(struct seq_file *s, struct ptdump_info *info)
>  {
>  	unsigned long end = ~0UL;
> @@ -318,7 +311,7 @@ void ptdump_walk(struct seq_file *s, struct ptdump_info *info)
>  		}
>  	};
>  
> -	arm64_ptdump_walk_pgd(&st.ptdump, info->mm);
> +	ptdump_walk_pgd(&st.ptdump, info->mm, NULL);
>  }
>  
>  static void __init ptdump_initialize(void)
> @@ -360,7 +353,7 @@ bool ptdump_check_wx(void)
>  		}
>  	};
>  
> -	arm64_ptdump_walk_pgd(&st.ptdump, &init_mm);
> +	ptdump_walk_pgd(&st.ptdump, &init_mm, NULL);
>  
>  	if (st.wx_pages || st.uxn_pages) {
>  		pr_warn("Checked W+X mappings: FAILED, %lu W+X pages found, %lu non-UXN pages found\n",
> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index 9d0f1fdd6af3..537ff7b3c412 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -170,10 +170,7 @@ static int vmap_try_huge_pmd(pmd_t *pmd, unsigned long addr, unsigned long end,
>  	 * Therefore, acquire the mmap read lock to prevent use-after-free when
>  	 * freeing page tables.
>  	 */
> -#ifndef CONFIG_ARM64
> -	scoped_cond_guard(mmap_read_lock_try, return 0, &init_mm)
> -#endif
> -	{
> +	scoped_cond_guard(mmap_read_lock_try, return 0, &init_mm) {
>  		if (!pmd_free_pte_page(pmd, addr))
>  			return 0;
>  		return pmd_set_huge(pmd, phys_addr, prot);
> @@ -230,10 +227,7 @@ static int vmap_try_huge_pud(pud_t *pud, unsigned long addr, unsigned long end,
>  		return pud_set_huge(pud, phys_addr, prot);
>  
>  	/* See comment in vmap_try_huge_pmd(). */
> -#ifndef CONFIG_ARM64
> -	scoped_cond_guard(mmap_read_lock_try, return 0, &init_mm)
> -#endif
> -	{
> +	scoped_cond_guard(mmap_read_lock_try, return 0, &init_mm) {
>  		if (!pud_free_pmd_page(pud, addr))
>  			return 0;
>  		return pud_set_huge(pud, phys_addr, prot);
> @@ -290,10 +284,7 @@ static int vmap_try_huge_p4d(p4d_t *p4d, unsigned long addr, unsigned long end,
>  		return p4d_set_huge(p4d, phys_addr, prot);
>  
>  	/* See comment in vmap_try_huge_pmd(). */
> -#ifndef CONFIG_ARM64
> -	scoped_cond_guard(mmap_read_lock_try, return 0, &init_mm)
> -#endif
> -	{
> +	scoped_cond_guard(mmap_read_lock_try, return 0, &init_mm) {
>  		if (!p4d_free_pud_page(p4d, addr))
>  			return 0;
>  		return p4d_set_huge(p4d, phys_addr, prot);
> 


