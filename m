Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0FEEC43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Jul 2026 07:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SN3Eqr9kVT0WJxI1+TbSrfMJ94BdyG0aA1uKrGqGcWc=; b=OdRb2Wzpqv1EM3GCQ+H5T6D4KW
	Ef8Fngv/UIXDMRmAJakyTOheMNr8cGl1b/mpfnj72eRRm/0aFOQFwPckfSvFJCZaHqUKbCZoC3lD/
	85weqfbgR1M2Hh3YJdeDObbR7R0EtOqThB/dEFOE2R20/MmwCSnlIE/BJv6QDMCnkOG+ImarT3VlY
	iUptklk5CcoVq975/3UIFGIFxbmGz9HfnadmfIPtmPH1PMhRcC+peeL2qAVB4dTvllcfVuMMvGt2e
	DibV6tHxisjUuhEbMPewaMaEaxr3DLUqKMiUFE0Uy0R6hZd4TRhwsvBN30PqTPr6eo6Cmenpt3Jsx
	t6ncL/Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wioqU-00000007Eih-065P;
	Sun, 12 Jul 2026 07:43:26 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wioqR-00000007EiH-2uCK
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Jul 2026 07:43:25 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5BDC01682;
	Sun, 12 Jul 2026 00:43:17 -0700 (PDT)
Received: from [10.163.129.143] (unknown [10.163.129.143])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8ECF53F85F;
	Sun, 12 Jul 2026 00:43:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783842201; bh=UYx5fo7e+lxcyM59ISiOU13g5eIgoyjRrIVDtKL9jW0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=UM3JYBV9OTPunMhOREV5sC8dPLz7aJpnp0FpbpEaiJeHy/lYgBBaRn2JyJ/+vUS9b
	 C7yMwQ1qtJP5l8lzEdfU1Sr3He1ud6P8jR573YExHwyIIZQC99cpw/T9zunBGIhJIL
	 tkpnh2iCeXxOpqU6JlnwaGudOBuSmCDc3g6D2EAM=
Message-ID: <d47ac961-4767-4ce4-9c75-f281beb24e42@arm.com>
Date: Sun, 12 Jul 2026 13:13:12 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] mm/vmalloc: acquire init_mm read lock on huge vmap
 promotion
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
 linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org,
 syzbot+fd95a72470f5a44e464c@syzkaller.appspotmail.com
References: <20260710-series-vmap-race-fix-v1-0-5b3794c113fe@kernel.org>
 <20260710-series-vmap-race-fix-v1-1-5b3794c113fe@kernel.org>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <20260710-series-vmap-race-fix-v1-1-5b3794c113fe@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260712_004323_826143_37490B28 
X-CRM114-Status: GOOD (  36.06  )
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



[-----]

> We also define a guard class for mmap_read_trylock() so we can use
> cleanup.h to make the scope handling cleaner in the implementation.
> 

Will this cause backport problems, I think this scoped guard thingy is
not that old?


> One wrinkle here is commit fa93b45fd397 ("arm64: Enable vmalloc-huge with
> ptdump"), which addresses the issue for arm64 only by explicitly acquiring
> the mmap read lock on kernel page table freeing should a concurrent ptdump
> be in progress.
> 
> This is problematic as vmap may acquire the mmap read lock prior to ptdump
> attempting to acquire an mmap write lock, leading to a deadlock when the
> mmap read lock is slept upon on page table freeing due to rwsem
> anti-starvation.
> 
> We work around this by predicating the mmap lock being taken on
> !CONFIG_ARM64 for the time being.
> 
> With this patch applied, a follow up will partially revert commit
> fa93b45fd397 ("arm64: Enable vmalloc-huge with ptdump") and at that stage
> remove the arm64 ifdeffery.
> 
> We also update walk_page_range_debug() to assert the mmap write lock
> unconditionally and update the comment here to reflect this change.
> 
> The issue has existed as long as ptdump was available and vmap freed page
> tables when promoting to a huge leaf entry, that is, since commit
> b6bdb7517c3d ("mm/vmalloc: add interfaces to free unmapped page table") for
> huge ioremap, and commit 121e6f3258fe ("mm/vmalloc: hugepage vmalloc
> mappings") for huge vmalloc.
> 
> Since the former is the earlier of the two we choose that for our Fixes
> tag.
> 
> This patch is based on work by David Carlier (linked), with gratitude!
> 
> Fixes: b6bdb7517c3d ("mm/vmalloc: add interfaces to free unmapped page table")
> Cc: <stable@vger.kernel.org>
> Reported-by: syzbot+fd95a72470f5a44e464c@syzkaller.appspotmail.com
> Closes: https://lore.kernel.org/all/6a287988.39669fcc.33b062.00a0.GAE@google.com/T/
> Link: https://lore.kernel.org/linux-mm/20260706203128.162335-1-devnexen@gmail.com/
> Signed-off-by: Lorenzo Stoakes <ljs@kernel.org>
> ---
>  include/linux/mmap_lock.h |  1 +
>  mm/pagewalk.c             | 22 +++++++++++----------
>  mm/vmalloc.c              | 50 ++++++++++++++++++++++++++++++++++++++---------
>  3 files changed, 54 insertions(+), 19 deletions(-)
> 
> diff --git a/include/linux/mmap_lock.h b/include/linux/mmap_lock.h
> index 04b8f61ece5d..6b5c2390cc30 100644
> --- a/include/linux/mmap_lock.h
> +++ b/include/linux/mmap_lock.h
> @@ -621,6 +621,7 @@ static inline void mmap_read_unlock(struct mm_struct *mm)
>  
>  DEFINE_GUARD(mmap_read_lock, struct mm_struct *,
>  	     mmap_read_lock(_T), mmap_read_unlock(_T))
> +DEFINE_GUARD_COND(mmap_read_lock, _try, mmap_read_trylock(_T))
>  
>  static inline void mmap_read_unlock_non_owner(struct mm_struct *mm)
>  {
> diff --git a/mm/pagewalk.c b/mm/pagewalk.c
> index 3ae2586ff45b..bbcfd68d0907 100644
> --- a/mm/pagewalk.c
> +++ b/mm/pagewalk.c
> @@ -678,6 +678,8 @@ int walk_kernel_page_table_range_lockless(unsigned long start, unsigned long end
>   * will also not lock the PTEs for the pte_entry() callback.
>   *
>   * This is for debugging purposes ONLY.
> + *
> + * The mmap write lock must be held.
>   */
>  int walk_page_range_debug(struct mm_struct *mm, unsigned long start,
>  			  unsigned long end, const struct mm_walk_ops *ops,
> @@ -691,6 +693,16 @@ int walk_page_range_debug(struct mm_struct *mm, unsigned long start,
>  		.no_vma		= true
>  	};
>  
> +	/*
> +	 * When walking userland page tables, an mmap write lock must be held to
> +	 * account for munmap() downgrading to an mmap read lock when tearing
> +	 * down page tables.
> +	 *
> +	 * When walking kernel page tables, an mmap write lock must also be held
> +	 * to account for page table freeing on vmap huge page mapping.
> +	 */
> +	mmap_assert_write_locked(mm);
> +
>  	/* For convenience, we allow traversal of kernel mappings. */
>  	if (mm == &init_mm)
>  		return walk_kernel_page_table_range(start, end, ops,
> @@ -700,16 +712,6 @@ int walk_page_range_debug(struct mm_struct *mm, unsigned long start,
>  	if (!check_ops_safe(ops))
>  		return -EINVAL;
>  
> -	/*
> -	 * The mmap lock protects the page walker from changes to the page
> -	 * tables during the walk.  However a read lock is insufficient to
> -	 * protect those areas which don't have a VMA as munmap() detaches
> -	 * the VMAs before downgrading to a read lock and actually tearing
> -	 * down PTEs/page tables. In which case, the mmap write lock should
> -	 * be held.
> -	 */
> -	mmap_assert_write_locked(mm);
> -
>  	return walk_pgd_range(start, end, &walk);
>  }
>  
> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index 1afca3568b9b..9d0f1fdd6af3 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -43,6 +43,7 @@
>  #include <asm/tlbflush.h>
>  #include <asm/shmparam.h>
>  #include <linux/page_owner.h>
> +#include <linux/cleanup.h>
>  
>  #define CREATE_TRACE_POINTS
>  #include <trace/events/vmalloc.h>
> @@ -158,10 +159,25 @@ static int vmap_try_huge_pmd(pmd_t *pmd, unsigned long addr, unsigned long end,
>  	if (!IS_ALIGNED(phys_addr, PMD_SIZE))
>  		return 0;
>  
> -	if (pmd_present(*pmd) && !pmd_free_pte_page(pmd, addr))
> -		return 0;
> +	if (!pmd_present(*pmd))
> +		return pmd_set_huge(pmd, phys_addr, prot);
>  
> -	return pmd_set_huge(pmd, phys_addr, prot);
> +	/*
> +	 * Kernel page table walkers either walk ranges they own exclusively
> +	 * using the mmap lock for mutual exclusion, or hold the mmap write lock
> +	 * on init_mm (ptdump being the motivating case).
> +	 *
> +	 * Therefore, acquire the mmap read lock to prevent use-after-free when
> +	 * freeing page tables.
> +	 */
> +#ifndef CONFIG_ARM64
> +	scoped_cond_guard(mmap_read_lock_try, return 0, &init_mm)
> +#endif
> +	{
> +		if (!pmd_free_pte_page(pmd, addr))
> +			return 0;
> +		return pmd_set_huge(pmd, phys_addr, prot);
> +	}
>  }
>  
Note that we do not need to take the lock around pmd_set_huge - we don't
care if ptdump observes a temporarily cleared pmd entry. So how about keeping
this outside the guard block. Otherwise right now we have an inconsistency:
for !pmd_present() we do pmd_set_huge() without locking, but for pmd_present()
we do pmd_set_huge() with locking.



