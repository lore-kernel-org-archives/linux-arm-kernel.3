Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AAC9C9833F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 13:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kzF82E4zZ6nxM5Y4/tKbnnewCR2Jh9fR2pKwojzSo4M=; b=GqqarjuuLgUontuKZeFBlmweTr
	jWazWeFuNdvTYm72BFyht/IAcofG/zroB/hFBZUFjF6hPSypEMse8wBfIeUYIJeevyu6LVkAUhkvQ
	hGoxBB7CcdS7TKwI0813joe6UuTEOZdykUg/p9FLSiTyUHzX5WzswL5LUvwLwYtZ0YB6SP3heELF1
	a+Paq6NR6i2/BwU+jJC3k3oFa4tLGLe7d3qS7+O6v2mERUN1S1VPtbjTFum6HJGTYz0wet7FRrYI8
	xmpM6XQjxYUHpRoiZytStAVgkk2rSKzzWZtKFvvZX8joAbkFNTnqT6GdemU0v70Lrj60uGD20FKyo
	u0p3cu0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBBkY-00000000hno-23ez;
	Mon, 28 Sep 2026 13:50:34 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBBkW-00000000hmc-0JM4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 13:50:33 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AA4C01655;
	Mon, 28 Sep 2026 06:50:25 -0700 (PDT)
Received: from localhost (a085714.arm.com [10.164.19.28])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6346F3F763;
	Mon, 28 Sep 2026 06:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790603429; bh=3xb5/4gLWOZNOoh0bz4RtCRodVK49XjhDPLq6nhdnww=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=C6yTxntLWRLp6mdeRlk3M5pdaIoF+yUUjdB+wuC6pq0DDQGx9ZCG2B+ZBrhqPB6yj
	 +eZP/4yF/U/G1T0Vnsj6Z6hjxVZ5Tx3sfxYKbni7kCTMEEtBk2AHj0AZhYvtCX/TUm
	 bsV/KVunWuD5bdfLffJTFEfWcGmkRVhTTSlbnEfk=
Date: Mon, 28 Sep 2026 19:20:25 +0530
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-arm-kernel@lists.infradead.org, 
	Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org
Subject: Re: [PATCH V3 1/2] arm64/mm: Move __check_safe_pte_update()
Message-ID: <4zgj7ok5c7dzercy4u6psfr3vx3n22dvwvztalfhfiwxx5y5ij@xv2lpuyba627>
References: <20260916044933.2689426-1-anshuman.khandual@arm.com>
 <20260916044933.2689426-2-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260916044933.2689426-2-anshuman.khandual@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_065032_252974_FC7DF37D 
X-CRM114-Status: GOOD (  35.87  )
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

On Wed, Sep 16, 2026 at 10:19:32AM +0530, Anshuman Khandual wrote:
> The page table entry print helpers and related macros which are defined in
> <linux/pgtable.h> will not be accessible in platform <asm/pgtable.h> which
> is basically caused by cycling dependency.
> 
> Move __check_safe_pte_update() inside arch/arm64/mm/mmu.c as a preparation
> for subsequent usage of the afore mentioned generic MM helpers. While here
> drop IS_ENABLED(CONFIG_DEBUG_VM), although wrap __check_safe_pte_update()
> inside #ifdef CONFIG_DEBUG_VM that preserves the current code optimization
> which is achieved via the static inline functions.
> 
> This does not cause any functional change.
> 
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Reviewed-by: David Hildenbrand (Arm) <david@kernel.org>
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> ---
>  arch/arm64/include/asm/pgtable.h | 49 ++++----------------------------
>  arch/arm64/mm/mmu.c              | 44 ++++++++++++++++++++++++++++
>  2 files changed, 49 insertions(+), 44 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
> index e89ec5f4787b..763c5a411d64 100644
> --- a/arch/arm64/include/asm/pgtable.h
> +++ b/arch/arm64/include/asm/pgtable.h
> @@ -387,52 +387,13 @@ static inline pte_t __ptep_get(pte_t *ptep)
>  extern void __sync_icache_dcache(pte_t pteval);
>  bool pgattr_change_is_safe(pteval_t old, pteval_t new);
>  
> -/*
> - * PTE bits configuration in the presence of hardware Dirty Bit Management
> - * (PTE_WRITE == PTE_DBM):
> - *
> - * Dirty  Writable | PTE_RDONLY  PTE_WRITE  PTE_DIRTY (sw)
> - *   0      0      |   1           0          0
> - *   0      1      |   1           1          0
> - *   1      0      |   1           0          1
> - *   1      1      |   0           1          x
> - *
> - * When hardware DBM is not present, the software PTE_DIRTY bit is updated via
> - * the page fault mechanism. Checking the dirty status of a pte becomes:
> - *
> - *   PTE_DIRTY || (PTE_WRITE && !PTE_RDONLY)
> - */
> -
> -static inline void __check_safe_pte_update(struct mm_struct *mm, pte_t *ptep,
> -					   pte_t pte)
> +#ifdef CONFIG_DEBUG_VM
> +void __check_safe_pte_update(struct mm_struct *mm, pte_t *ptep, pte_t pte);
> +#else
> +static inline void __check_safe_pte_update(struct mm_struct *mm, pte_t *ptep, pte_t pte)
>  {
> -	pte_t old_pte;
> -
> -	if (!IS_ENABLED(CONFIG_DEBUG_VM))
> -		return;
> -
> -	old_pte = __ptep_get(ptep);
> -
> -	if (!pte_valid(old_pte) || !pte_valid(pte))
> -		return;
> -	if (mm != current->active_mm && atomic_read(&mm->mm_users) <= 1)
> -		return;
> -
> -	/*
> -	 * Check for potential race with hardware updates of the pte
> -	 * (__ptep_set_access_flags safely changes valid ptes without going
> -	 * through an invalid entry).
> -	 */
> -	VM_WARN_ONCE(!pte_young(pte),
> -		     "%s: racy access flag clearing: 0x%016llx -> 0x%016llx",
> -		     __func__, pte_val(old_pte), pte_val(pte));
> -	VM_WARN_ONCE(pte_write(old_pte) && !pte_dirty(pte),
> -		     "%s: racy dirty state clearing: 0x%016llx -> 0x%016llx",
> -		     __func__, pte_val(old_pte), pte_val(pte));
> -	VM_WARN_ONCE(!pgattr_change_is_safe(pte_val(old_pte), pte_val(pte)),
> -		     "%s: unsafe attribute change: 0x%016llx -> 0x%016llx",
> -		     __func__, pte_val(old_pte), pte_val(pte));
>  }
> +#endif /* CONFIG_DEBUG_VM */
>  
>  static inline void __sync_cache_and_tags(pte_t pte, unsigned int nr_pages)
>  {
> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
> index 79d90226fd5d..cb49469707a8 100644
> --- a/arch/arm64/mm/mmu.c
> +++ b/arch/arm64/mm/mmu.c
> @@ -2392,4 +2392,48 @@ int arch_set_user_pkey_access(int pkey, unsigned long init_val)
>  
>  	return 0;
>  }
> +
> +/*
> + * PTE bits configuration in the presence of hardware Dirty Bit Management
> + * (PTE_WRITE == PTE_DBM):
> + *
> + * Dirty  Writable | PTE_RDONLY  PTE_WRITE  PTE_DIRTY (sw)
> + *   0      0      |   1           0          0
> + *   0      1      |   1           1          0
> + *   1      0      |   1           0          1
> + *   1      1      |   0           1          x
> + *
> + * When hardware DBM is not present, the software PTE_DIRTY bit is updated via
> + * the page fault mechanism. Checking the dirty status of a pte becomes:
> + *
> + *   PTE_DIRTY || (PTE_WRITE && !PTE_RDONLY)
> + */
> +#ifdef CONFIG_DEBUG_VM
> +void __check_safe_pte_update(struct mm_struct *mm, pte_t *ptep, pte_t pte)
> +{
> +	pte_t old_pte;
> +
> +	old_pte = __ptep_get(ptep);
> +
> +	if (!pte_valid(old_pte) || !pte_valid(pte))
> +		return;
> +	if (mm != current->active_mm && atomic_read(&mm->mm_users) <= 1)
> +		return;
> +
> +	/*
> +	 * Check for potential race with hardware updates of the pte
> +	 * (__ptep_set_access_flags safely changes valid ptes without going
> +	 * through an invalid entry).
> +	 */
> +	VM_WARN_ONCE(!pte_young(pte),
> +		     "%s: racy access flag clearing: 0x%016llx -> 0x%016llx",
> +		     __func__, pte_val(old_pte), pte_val(pte));
> +	VM_WARN_ONCE(pte_write(old_pte) && !pte_dirty(pte),
> +		     "%s: racy dirty state clearing: 0x%016llx -> 0x%016llx",
> +		     __func__, pte_val(old_pte), pte_val(pte));
> +	VM_WARN_ONCE(!pgattr_change_is_safe(pte_val(old_pte), pte_val(pte)),
> +		     "%s: unsafe attribute change: 0x%016llx -> 0x%016llx",
> +		     __func__, pte_val(old_pte), pte_val(pte));
> +}
> +#endif /* CONFIG_DEBUG_VM */
>  #endif
> -- 
> 2.43.0
>

Hello Andrew,

Could you please squash in the following changes from David which fixes
the build issue reported earlier. Problem is the #ifdef CONFIG_DEBUG_VM
block was inserted inside the existing #ifdef CONFIG_ARCH_HAS_PKEYS not
after it as would have been expected. OR do we need a respin here along
with the change ?

- Anshuman

From 448f146f16394713b28295236588ccab3a173827 Mon Sep 17 00:00:00 2001
From: "David Hildenbrand (Arm)" <david@kernel.org>
Date: Mon, 28 Sep 2026 09:42:06 +0200
Subject: [PATCH] fixup: arm64/mm: move __check_safe_pte_update()

Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
---
 arch/arm64/mm/mmu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index e589fb00d1e3..7343ac9294f8 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -2392,6 +2392,7 @@ int arch_set_user_pkey_access(int pkey, unsigned long init_val)

 	return 0;
 }
+#endif

 /*
  * PTE bits configuration in the presence of hardware Dirty Bit Management
@@ -2440,4 +2441,3 @@ void __check_safe_pte_update(struct mm_struct *mm, pte_t *ptep, pte_t pte)
 		     __func__, pte_str_old, pte_str);
 }
 #endif /* CONFIG_DEBUG_VM */
-#endif


