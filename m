Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 119F2C79F8C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 10:25:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6Oo8RomRSAKyfRy1FZeDtz2uQY6X/cSMNb0cISk3DsQ=; b=L9hQtNjVMB/lKQ1f3uNB1FsSMM
	ZCatFG6SKTPpJTZ2h6Iw6gklyYPvSG7NqiBkuVUdmxjmTS4xpbrqT5K2lOnni5UkUW2XSzAdAXso/
	G2Hi6wopA5AtyhmZrxvdpHUi4PBvTF0K7Y5ote2WnWdmFvL4mElCPydiQ5dmCfaLs3Nb0B09FlESC
	knsMdB9PDLTS+XE47ZxP6hkzAApq/IueuZGSwOAHNV4eM2G8q3UazMfyS6V6N85Q6g+3ZVePg+K0v
	VNAzyDiS/QUB++ttXIWQSSpgqeBFVIPOlH7w0VLFkzamrIZndY7171ucYkygHrxAVjgSJ7CP4Yt0I
	2d/hc8Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4FUG-0000000BPK0-2nac;
	Wed, 09 Sep 2026 10:25:04 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4FUF-0000000BPJS-0Nc8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 10:25:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 406D143877;
	Wed,  9 Sep 2026 10:25:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E061E1F00A3A;
	Wed,  9 Sep 2026 10:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788949501;
	bh=6Oo8RomRSAKyfRy1FZeDtz2uQY6X/cSMNb0cISk3DsQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=fpMCJhe5Bv9trGWnNlO4KnLJBp2H9xjzui7I1epfqOHOJzc1T5/kV4l4X2TuK3GNL
	 xOXCC4MFnfkWoclyvO4woNuwDTD0dQUHacH7WARP2RuGKN7zses/IbQN+//HmulpWG
	 Q45gxIXLAgDs1Kn4pJrqy+CAts28kJUZ1/3irGYFTHEeWk278ZXOrLOD7Fb9VfQDca
	 dTVaCS4JJvL6XULjgw2ax5OmwuAX9FtD7vbGom5hbD7QTPQoo/VtS/eOg6NrPB0f0Y
	 7whzNNPUWqdG8LqnXmMi7WCts/pd7tdrMJHKkFoPh8FtHJ9DwDM24FFMquDl6dtVOJ
	 fRcedjV/qi2SA==
Message-ID: <6fb6b2b8-daae-4707-aa98-c2c447782a44@kernel.org>
Date: Wed, 9 Sep 2026 12:24:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] mm: define generic pudp_invalidate() implementation
To: Jinjiang Tu <tujinjiang@huawei.com>, akpm@linux-foundation.org,
 ljs@kernel.org, catalin.marinas@arm.com, will@kernel.org,
 mark.rutland@arm.com, ryan.roberts@arm.com, peterx@redhat.com,
 dave.jiang@intel.com, linux-arm-kernel@lists.infradead.org,
 linux-mm@kvack.org
Cc: wangkefeng.wang@huawei.com, sunnanyong@huawei.com
References: <20260909090018.1991485-1-tujinjiang@huawei.com>
 <20260909090018.1991485-2-tujinjiang@huawei.com>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <20260909090018.1991485-2-tujinjiang@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 9/9/26 11:00, Jinjiang Tu wrote:
> x86 and riscv have identical pudp_invalidate() implementations. Move it to
> mm/pgtable-generic.c with the __HAVE_ARCH_PUDP_INVALIDATE override guard.
> PowerPC keeps its own implementation. In the later patch, arm64 will use
> the generic implementation too.
> 
> No functional change intended.
> 
> Signed-off-by: Jinjiang Tu <tujinjiang@huawei.com>
> ---
>  arch/powerpc/include/asm/book3s/64/pgtable.h |  1 +
>  arch/riscv/include/asm/pgtable.h             |  3 ---
>  arch/riscv/mm/pgtable.c                      |  9 ---------
>  arch/x86/include/asm/pgtable.h               |  3 ---
>  arch/x86/mm/pgtable.c                        | 12 ------------
>  include/linux/pgtable.h                      |  7 +++++++
>  mm/pgtable-generic.c                         | 14 ++++++++++++++
>  7 files changed, 22 insertions(+), 27 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/book3s/64/pgtable.h b/arch/powerpc/include/asm/book3s/64/pgtable.h
> index f4db7d7fbd5c..55d33c5537f1 100644
> --- a/arch/powerpc/include/asm/book3s/64/pgtable.h
> +++ b/arch/powerpc/include/asm/book3s/64/pgtable.h
> @@ -1419,6 +1419,7 @@ static inline pgtable_t pgtable_trans_huge_withdraw(struct mm_struct *mm,
>  #define __HAVE_ARCH_PMDP_INVALIDATE
>  extern pmd_t pmdp_invalidate(struct vm_area_struct *vma, unsigned long address,
>  			     pmd_t *pmdp);
> +#define __HAVE_ARCH_PUDP_INVALIDATE
>  extern pud_t pudp_invalidate(struct vm_area_struct *vma, unsigned long address,
>  			     pud_t *pudp);
>  
> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
> index 40b1ed4f3ea8..327fa378032b 100644
> --- a/arch/riscv/include/asm/pgtable.h
> +++ b/arch/riscv/include/asm/pgtable.h
> @@ -1159,9 +1159,6 @@ static inline pud_t pud_mkinvalid(pud_t pud)
>  	return __pud(pud_val(pud) & ~(_PAGE_PRESENT | _PAGE_PROT_NONE));
>  }
>  
> -extern pud_t pudp_invalidate(struct vm_area_struct *vma, unsigned long address,
> -			     pud_t *pudp);
> -
>  static inline pud_t pud_modify(pud_t pud, pgprot_t newprot)
>  {
>  	return pte_pud(pte_modify(pud_pte(pud), newprot));
> diff --git a/arch/riscv/mm/pgtable.c b/arch/riscv/mm/pgtable.c
> index 9c4427d0b187..156e385e7db4 100644
> --- a/arch/riscv/mm/pgtable.c
> +++ b/arch/riscv/mm/pgtable.c
> @@ -154,15 +154,6 @@ pmd_t pmdp_collapse_flush(struct vm_area_struct *vma,
>  	return pmd;
>  }
>  
> -pud_t pudp_invalidate(struct vm_area_struct *vma, unsigned long address,
> -		      pud_t *pudp)
> -{
> -	VM_WARN_ON_ONCE(!pud_present(*pudp));
> -	pud_t old = pudp_establish(vma, address, pudp, pud_mkinvalid(*pudp));
> -
> -	flush_pud_tlb_range(vma, address, address + HPAGE_PUD_SIZE);
> -	return old;
> -}
>  #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
>  
>  pte_t pte_mkwrite(pte_t pte, struct vm_area_struct *vma)
> diff --git a/arch/x86/include/asm/pgtable.h b/arch/x86/include/asm/pgtable.h
> index d5f4917c1edc..97051c02385e 100644
> --- a/arch/x86/include/asm/pgtable.h
> +++ b/arch/x86/include/asm/pgtable.h
> @@ -1387,9 +1387,6 @@ static inline pud_t pudp_establish(struct vm_area_struct *vma,
>  extern pmd_t pmdp_invalidate_ad(struct vm_area_struct *vma,
>  				unsigned long address, pmd_t *pmdp);
>  
> -pud_t pudp_invalidate(struct vm_area_struct *vma, unsigned long address,
> -		      pud_t *pudp);
> -
>  /*
>   * Page table pages are page-aligned.  The lower half of the top
>   * level is used for userspace and the top half for the kernel.
> diff --git a/arch/x86/mm/pgtable.c b/arch/x86/mm/pgtable.c
> index cb03f5a2b243..0945908631dc 100644
> --- a/arch/x86/mm/pgtable.c
> +++ b/arch/x86/mm/pgtable.c
> @@ -519,18 +519,6 @@ pmd_t pmdp_invalidate_ad(struct vm_area_struct *vma, unsigned long address,
>  }
>  #endif
>  
> -#if defined(CONFIG_TRANSPARENT_HUGEPAGE) && \
> -	defined(CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD)
> -pud_t pudp_invalidate(struct vm_area_struct *vma, unsigned long address,
> -		     pud_t *pudp)
> -{
> -	VM_WARN_ON_ONCE(!pud_present(*pudp));
> -	pud_t old = pudp_establish(vma, address, pudp, pud_mkinvalid(*pudp));
> -	flush_pud_tlb_range(vma, address, address + HPAGE_PUD_SIZE);
> -	return old;
> -}
> -#endif
> -
>  /**
>   * reserve_top_address - Reserve a hole in the top of the kernel address space
>   * @reserve: Size of hole to reserve
> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
> index 8c093c119e5a..32173005b087 100644
> --- a/include/linux/pgtable.h
> +++ b/include/linux/pgtable.h
> @@ -1318,6 +1318,13 @@ extern pmd_t pmdp_invalidate_ad(struct vm_area_struct *vma,
>  				unsigned long address, pmd_t *pmdp);
>  #endif
>  
> +#ifndef __HAVE_ARCH_PUDP_INVALIDATE
> +#ifdef CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD
> +extern pud_t pudp_invalidate(struct vm_area_struct *vma, unsigned long address,
> +			     pud_t *pudp);

No "extern" please.

Staring at this file, I do wonder why we are not smarter about combining blocks. E.g., here simply:

diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index e3c8ab96941c5..8c9fe3bf580d4 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -1229,9 +1229,9 @@ static inline void pmdp_set_wrprotect(struct mm_struct *mm,
 }
 #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
 #endif
-#ifndef __HAVE_ARCH_PUDP_SET_WRPROTECT
-#ifdef CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
+#ifdef CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD
+#ifndef __HAVE_ARCH_PUDP_SET_WRPROTECT
 static inline void pudp_set_wrprotect(struct mm_struct *mm,
                                      unsigned long address, pud_t *pudp)
 {
@@ -1245,9 +1245,13 @@ static inline void pudp_set_wrprotect(struct mm_struct *mm,
 {
        BUILD_BUG();
 }
-#endif /* CONFIG_TRANSPARENT_HUGEPAGE */
-#endif /* CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD */
 #endif
+#ifndef __HAVE_ARCH_PUDP_INVALIDATE
+pud_t pudp_invalidate(struct vm_area_struct *vma, unsigned long address,
+               pud_t *pudp);
+#endif
+#endif /* CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD */
+#endif /* CONFIG_TRANSPARENT_HUGEPAGE */

> +#endif
> +#endif
> +
>  #ifndef __HAVE_ARCH_PTE_SAME
>  static inline int pte_same(pte_t pte_a, pte_t pte_b)
>  {
> diff --git a/mm/pgtable-generic.c b/mm/pgtable-generic.c
> index b91b1a98029c..ac1175d9a59a 100644
> --- a/mm/pgtable-generic.c
> +++ b/mm/pgtable-generic.c
> @@ -217,6 +217,20 @@ pmd_t pmdp_invalidate_ad(struct vm_area_struct *vma, unsigned long address,
>  }
>  #endif
>  
> +#ifndef __HAVE_ARCH_PUDP_INVALIDATE
> +#ifdef CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD

I'd revert these and similarly see if they can be combined somehow (likely combining with
pudp_huge_clear_flush is harder as we are quite inconsistent with it, gluing it to
__HAVE_ARCH_PMDP_HUGE_CLEAR_FLUSH).

Which raises the question whether we could also piggy-back on __HAVE_ARCH_PMDP_SET_WRPROTECT
(I suspect no without a closer look.)

-- 
Cheers,

David

