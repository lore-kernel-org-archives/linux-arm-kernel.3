Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69DBAC83F26
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Jul 2025 17:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VGmF/e0xUNuc4dgy3WHAZwwfwaRpFv7s1KiekjzHtRs=; b=qB8iTyw7WUrohgL9x4J1+jy2pg
	rsAEmdMG6NPEhD3rcoP6MBrEgjSdtm/SvswYYpjx67cMB2/dRwXpiRYXvjsPOIWZGyW85W1tFGPaU
	pKQ7BgG3a1HAn5jEVbM4lb9ARPxG9/cxZEs1/twfYBgDlhEO3arJrtDPnXmu5H9qqILW7F6BOgiUM
	/gsfAVpWw4mkFifmONeiGlt7BRPZVg4rkZukuuWCaDIMhLs7A2pSQjk0jpPL+vGHMPSnnqIi6BMza
	0sZT+yj5V6nmtM+fR3VBxvxaXMZbdiAy+zYEuqVNpgjhJ8Wms10B+sZocl+rnQTx1yHSg4hFzmvcc
	0GXu4JeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhACz-000000023cG-29Ti;
	Wed, 30 Jul 2025 17:03:17 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhAAU-000000023MU-2iKQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Jul 2025 17:00:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7C9EB45AF0;
	Wed, 30 Jul 2025 17:00:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 213E3C4CEE3;
	Wed, 30 Jul 2025 17:00:36 +0000 (UTC)
Date: Wed, 30 Jul 2025 18:00:34 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Dev Jain <dev.jain@arm.com>
Cc: will@kernel.org, anshuman.khandual@arm.com, quic_zhenhuah@quicinc.com,
	ryan.roberts@arm.com, kevin.brodsky@arm.com,
	yangyicong@hisilicon.com, joey.gouly@arm.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	david@redhat.com, mark.rutland@arm.com, urezki@gmail.com
Subject: Re: [RESEND PATCH v5] arm64: Enable vmalloc-huge with ptdump
Message-ID: <aIpPsg1Kij8Knnjl@arm.com>
References: <20250723161827.15802-1-dev.jain@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250723161827.15802-1-dev.jain@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250730_100042_729912_16F8C725 
X-CRM114-Status: GOOD (  30.07  )
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

On Wed, Jul 23, 2025 at 09:48:27PM +0530, Dev Jain wrote:
> diff --git a/arch/arm64/include/asm/vmalloc.h b/arch/arm64/include/asm/vmalloc.h
> index 12f534e8f3ed..e835fd437ae0 100644
> --- a/arch/arm64/include/asm/vmalloc.h
> +++ b/arch/arm64/include/asm/vmalloc.h
> @@ -12,15 +12,13 @@ static inline bool arch_vmap_pud_supported(pgprot_t prot)
>  	/*
>  	 * SW table walks can't handle removal of intermediate entries.
>  	 */
> -	return pud_sect_supported() &&
> -	       !IS_ENABLED(CONFIG_PTDUMP_DEBUGFS);
> +	return pud_sect_supported();

Does the "SW table walks..." comment still make sense?

> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
> index 00ab1d648db6..49932c1dd34e 100644
> --- a/arch/arm64/mm/mmu.c
> +++ b/arch/arm64/mm/mmu.c
[...]
> @@ -1301,16 +1319,76 @@ int pud_free_pmd_page(pud_t *pudp, unsigned long addr)
>  	}
>  
>  	table = pmd_offset(pudp, addr);
> +
> +	/*
> +	 * Our objective is to prevent ptdump from reading a PMD table which has
> +	 * been freed.  Assume that ptdump_walk_pgd() (call this thread T1)
> +	 * executes completely on CPU1 and pud_free_pmd_page() (call this thread
> +	 * T2) executes completely on CPU2. Let the region sandwiched by the

I think "executes completely on CPU*" is confusing. Just talk about
threads as they can be migrated between CPUs and the memory model is
preserved.

> +	 * mmap_write_lock/unlock in T1 be called CS (the critical section).
> +	 *
> +	 * Claim: The CS of T1 will never operate on a freed PMD table.
> +	 *
> +	 * Proof:
> +	 *
> +	 * Case 1: The static branch is visible to T2.
> +	 *
> +	 * Case 1 (a): T1 acquires the lock before T2 can.
> +	 * T2 will block until T1 drops the lock, so pmd_free() will only be
> +	 * executed after T1 exits CS.

This assumes that there is some ordering between unlock and pmd_free()
(e.g. some poisoning of the old page). The unlock only gives us release
semantics, not acquire. It just happens that we have an atomic
dec-and-test down the __free_pages() path but I'm not convinced we
should rely on it unless free_pages() has clear semantics on ordering
related to prior memory writes.

> +	 *
> +	 * Case 1 (b): T2 acquires the lock before T1 can.
> +	 * The sequence of barriers issued in __flush_tlb_kernel_pgtable()
> +	 * ensures that an empty PUD (via pud_clear()) is visible to T1 before
> +	 * T1 can enter CS, therefore it is impossible for the CS to get hold
> +	 * of the address of the isolated PMD table.

Is this the effect of the barriers in the TLB flushing or the release
semantics of the unlock?

> +	 *
> +	 * Case 2: The static branch is not visible to T2.
> +	 *
> +	 * Since static_branch_enable() (via dmb(ish)) and mmap_write_lock()
> +	 * have acquire semantics, it is guaranteed that the static branch

Does static_branch_disable() have release semantics? I think it does via
some atomic_cmpxchg() but it's worth spelling it out.

> +	 * will be visible to all CPUs before T1 can enter CS. The static

As I mentioned on a previous version, this visibility is not absolute.
You could say that it will be observed by other CPUs before they observe
the write_lock.

> +	 * branch not being visible to T2 therefore guarantees that T1 has
> +	 * not yet entered CS .... (i)
> +	 * The sequence of barriers via __flush_tlb_kernel_pgtable() in T2
> +	 * implies that if the invisibility of the static branch has been
> +	 * observed by T2 (i.e static_branch_unlikely() is observed as false),
> +	 * then all CPUs will have observed an empty PUD ... (ii)
> +	 * Combining (i) and (ii), we conclude that T1 observes an empty PUD
> +	 * before entering CS => it is impossible for the CS to get hold of
> +	 * the address of the isolated PMD table. Q.E.D

OK, I nearly got lost. That's not a straightforward memory ordering with
as we have instruction updates with ISB as part of the TLB flushing. I
concluded last time I looked that this branch patching part works
because we also have kick_all_cpus_sync() as part of the static branch
update.

Stepping back to a simpler model, let's say that the static key is a
variable. I wrote this quick test for herd7 and the Linux kernel memory
model (fairly easy to play with):

-------------------------------------8<---------------------------------------
C pte_free_ptdump

(*
 * $ cd tools/memory-model
 * $ herd7 -conf linux-kernel.cfg path/to/pte_free_ptdump.litmus
 *)

{
	pmd = 1;				(* allocated pmd *)
	pte_page = 1;				(* valid pte page pointed at by the pmd *)
}

// pmd_free_pte_page()
P0(spinlock_t *init_mm, int *ptdump_lock_key, int *pmd, int *pte_page)
{
	WRITE_ONCE(*pmd, 0);			// pmd_clear()
	smp_mb();
	if (READ_ONCE(*ptdump_lock_key)) {	// static_branch() approximation
		spin_lock(init_mm);		// mmap_read_lock()
		spin_unlock(init_mm);		// mmap_read_unlock()
	}
	smp_mb();
	WRITE_ONCE(*pte_page, 0);		// pte_free_kernel()
}

// ptdump_walk_pgd()
P1(spinlock_t *init_mm, int *ptdump_lock_key, int *pmd, int *pte_page)
{
	int val;
	int page;

	WRITE_ONCE(*ptdump_lock_key, 1);	// static_branch_enable()
	smp_mb();
	spin_lock(init_mm);			// mmap_write_lock()
	val = READ_ONCE(*pmd);
	page = READ_ONCE(*pte_page);		// freed pte page?
	spin_unlock(init_mm);			// mmap_write_unlock()
	smp_mb();
	WRITE_ONCE(*ptdump_lock_key, 0);	// static_branch_disable()
}

exists(1:val=1 /\ 1:page=0)
-------------------------------------8<---------------------------------------

I sprinkled some necessary smp_mb() but in most cases we have
release/acquire semantics. It does show that we need a barrier before
the page freeing. We also need to acquire for enabling the static key
and release for disabling it.

Next step is to assess that replacing the static key variable read/write
with code patching preserves the model.

-- 
Catalin

