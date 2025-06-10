Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F32E5C5B543
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 12:36:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V8h3oqbg6NoP/SjTKtGT31BP/tzrrozOvMV8TV+y5V4=; b=dVuo67MdoPmyEGqoEdPLPMawQv
	JTHzgYs/9pSb8ZkbYY0dUTqTMInK3JKTL38kEWWI5QeSS/3zRI4tCGuPhiNS6nyv8AeW/wsIMgQpV
	vnq+5B+mUhQ3M+7yc16OjFoT5YCczDSoIzwW5ZgnLrnmWUu27HbOPdb0QyO6EF2ffYTL8LdgYkFdy
	WwOAFasTbh+8qKdgZ7XJaoaQhpz+VqPd433/ycGPUjUEcxWAnpQv/4V7A3D+V6ms3d4K9slCbI0zz
	K5Zv5kihWdXdIGhk+Pp+kIx0bJjsM9jbGHUbTC+yIo6xWs3lerjqkyatBJo1f/kPs9CJcOzxRnIIL
	pSQOBBcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOyDE-00000006n3T-1Yml;
	Tue, 10 Jun 2025 12:36:20 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOxe8-00000006hb9-39NB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 12:00:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 033B05C5493;
	Tue, 10 Jun 2025 11:57:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82832C4CEEF;
	Tue, 10 Jun 2025 12:00:02 +0000 (UTC)
Date: Tue, 10 Jun 2025 13:00:00 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] arm64/mm: Ensure lazy_mmu_mode never nests
Message-ID: <aEgeQCCzRt-B8_nW@arm.com>
References: <20250606135654.178300-1-ryan.roberts@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250606135654.178300-1-ryan.roberts@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_050004_876017_A5A7AFDA 
X-CRM114-Status: GOOD (  36.59  )
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

On Fri, Jun 06, 2025 at 02:56:52PM +0100, Ryan Roberts wrote:
> Commit 1ef3095b1405 ("arm64/mm: Permit lazy_mmu_mode to be nested")
> provided a quick fix to ensure that lazy_mmu_mode continues to work when
> CONFIG_DEBUG_PAGEALLOC is enabled, which can cause lazy_mmu_mode to
> nest.
> 
> The solution in that patch is the make the implementation tolerant to

s/is the make/is to make/

> nesting; when the inner nest exits lazy_mmu_mode, we exit then the outer
> exit becomes a nop. But this sacrifices the optimization opportunity for
> the remainder of the outer user.
[...]
> I wonder if you might be willing to take this for v6.16? I think its a neater
> solution then my first attempt - Commit 1ef3095b1405 ("arm64/mm: Permit
> lazy_mmu_mode to be nested") - which is already in Linus's master.
> 
> To be clear, the current solution is safe, I just think this is much neater.

Maybe better, though I wouldn't say much neater. One concern I have is
about whether we'll get other such nesting in the future and we need to
fix them in generic code. Here we control __kernel_map_pages() but we
may not for other cases.

Is it the fault of the arch code that uses apply_to_page_range() via
__kernel_map_pages()? It feels like it shouldn't care about the lazy
mode as that's some detail of the apply_to_page_range() implementation.
Maybe this API should just allow nesting.

> diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
> index 88db8a0c0b37..9f387337ccc3 100644
> --- a/arch/arm64/include/asm/pgtable.h
> +++ b/arch/arm64/include/asm/pgtable.h
> @@ -83,21 +83,11 @@ static inline void queue_pte_barriers(void)
>  #define  __HAVE_ARCH_ENTER_LAZY_MMU_MODE
>  static inline void arch_enter_lazy_mmu_mode(void)
>  {
> -	/*
> -	 * lazy_mmu_mode is not supposed to permit nesting. But in practice this
> -	 * does happen with CONFIG_DEBUG_PAGEALLOC, where a page allocation
> -	 * inside a lazy_mmu_mode section (such as zap_pte_range()) will change
> -	 * permissions on the linear map with apply_to_page_range(), which
> -	 * re-enters lazy_mmu_mode. So we tolerate nesting in our
> -	 * implementation. The first call to arch_leave_lazy_mmu_mode() will
> -	 * flush and clear the flag such that the remainder of the work in the
> -	 * outer nest behaves as if outside of lazy mmu mode. This is safe and
> -	 * keeps tracking simple.
> -	 */
> -
>  	if (in_interrupt())
>  		return;
> 
> +	VM_WARN_ON(test_thread_flag(TIF_LAZY_MMU));

This warning is good to have back.

> +
>  	set_thread_flag(TIF_LAZY_MMU);
>  }
> 
> @@ -119,6 +109,14 @@ static inline void arch_leave_lazy_mmu_mode(void)
>  	clear_thread_flag(TIF_LAZY_MMU);
>  }
> 
> +static inline bool arch_in_lazy_mmu_mode(void)
> +{
> +	if (in_interrupt())
> +		return false;
> +
> +	return test_thread_flag(TIF_LAZY_MMU);
> +}
> +
>  #ifdef CONFIG_TRANSPARENT_HUGEPAGE
>  #define __HAVE_ARCH_FLUSH_PMD_TLB_RANGE
> 
> diff --git a/arch/arm64/mm/pageattr.c b/arch/arm64/mm/pageattr.c
> index 04d4a8f676db..4da7a847d5f3 100644
> --- a/arch/arm64/mm/pageattr.c
> +++ b/arch/arm64/mm/pageattr.c
> @@ -293,18 +293,29 @@ int set_direct_map_valid_noflush(struct page *page, unsigned nr, bool valid)
>  }
> 
>  #ifdef CONFIG_DEBUG_PAGEALLOC
> -/*
> - * This is - apart from the return value - doing the same
> - * thing as the new set_direct_map_valid_noflush() function.
> - *
> - * Unify? Explain the conceptual differences?
> - */
>  void __kernel_map_pages(struct page *page, int numpages, int enable)
>  {
> +	bool lazy_mmu;
> +
>  	if (!can_set_direct_map())
>  		return;
> 
> +	/*
> +	 * This is called during page alloc or free, and maybe called while in
> +	 * lazy mmu mode. Since set_memory_valid() may also enter lazy mmu mode,
> +	 * this would cause nesting which is not supported; the inner call to
> +	 * exit the mode would exit, meaning that the outer lazy mmu mode is no
> +	 * longer benefiting from the optimization. So temporarily leave lazy
> +	 * mmu mode for the duration of the call.
> +	 */
> +	lazy_mmu = arch_in_lazy_mmu_mode();
> +	if (lazy_mmu)
> +		arch_leave_lazy_mmu_mode();
> +
>  	set_memory_valid((unsigned long)page_address(page), numpages, enable);
> +
> +	if (lazy_mmu)
> +		arch_enter_lazy_mmu_mode();
>  }
>  #endif /* CONFIG_DEBUG_PAGEALLOC */

So basically you are flattening the enter/leave_lazy_mmu_mode() regions.
Ideally this could have been done by the nesting
arch_enter_lazy_mmu_mode() automatically but that means this function
returning the current mode and arch_leave_lazy_mmu_mode() taking an
argument - more like the irq saving/restoring (even better renaming it
to arch_restore_lazy_mmu_mode()). I guess this won't go well with the mm
folk who don't seem willing to changes in this area.

FWIW, this patch is correct.

-- 
Catalin

