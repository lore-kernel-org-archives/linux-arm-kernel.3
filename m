Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11588C79FB7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 04:05:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cXhFOuqDM6JUeRauAhoieNZSOIkvbDqCyTIjuUkB6yk=; b=h1Khz3/F/VYHAf95mFaRHzjaig
	0LER3HjWwhF9QlQMC7rgRqBaD2HRZ7NTQrcfxwMqzYXtnv02bqQ9FI3+RsDNRy9Sd+Qj6AFF4ruz8
	vSgwKf6JdZ3GVf0mDKqcnT/hUZCWCdFMJp/+WHXXm1+Mk9E2YAMtsjH1EtM2PyxFSen8uxzl5Eq3w
	JVvMtYtv+NdMAhkxfpG+lwd8p/O6kw9VSNHvqWDyP8xMMruqtJT0I6TeYlAOU3SlGyiJAz4pzC6eL
	2w6iYxJoemweqTym9jQ72a0wSpIAEbzU9sxKpuEmVKTuz1KZMQ5FHrPge6uGQTDsH9cBMQULf9m6h
	degcnTHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4W2D-0000000DL2v-06Cs;
	Thu, 10 Sep 2026 04:05:13 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4W2A-0000000DL2U-1Gaz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 04:05:11 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EC607153B;
	Wed,  9 Sep 2026 21:05:02 -0700 (PDT)
Received: from localhost (a085714.arm.com [10.164.19.28])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DAB983F7B4;
	Wed,  9 Sep 2026 21:05:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789013106; bh=rAWrnAEYwtxB463a6X/NBqTWvXFmxUTkIqzzvCsxG78=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tCD5v4VUvLSUKDwb09dHubBqZMyi0aXPHA7yJz72TlE/XLQq4uYoYeyVilQgXOZKc
	 UZ9s09iK+VC5GbdAALOudg5bQ05HkZVwdMpybiLdve6B2m/peyyq3TQ4200H8aRkIN
	 rt3JRDGreOcdVN26eSoiOLR5jUGp1QSoUaQLEVWQ=
Date: Thu, 10 Sep 2026 09:35:03 +0530
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, Mike Rapoport <rppt@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org
Subject: Re: [PATCH V2 1/2] arm64/mm: Move __check_safe_pte_update()
Message-ID: <u3uvjnmd7k7f7dijdvsykta3pcxyxhvztncu4apvg5eb6rvtyh@kmdgfebs6dns>
References: <20260909040005.4148136-1-anshuman.khandual@arm.com>
 <20260909040005.4148136-2-anshuman.khandual@arm.com>
 <04358f9d-3b64-47c0-94dc-f1ef19c22f78@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <04358f9d-3b64-47c0-94dc-f1ef19c22f78@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_210510_536076_121824CA 
X-CRM114-Status: GOOD (  31.61  )
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

On Wed, Sep 09, 2026 at 05:12:24PM +0200, David Hildenbrand (Arm) wrote:
> On 9/9/26 06:00, Anshuman Khandual wrote:
> > The page table entry print helpers and related macros which are defined in
> > <linux/pgtable.h> will not be accessible in platform <asm/pgtable.h> which
> > is basically caused by cycling dependency.
> > 
> > Move __check_safe_pte_update() inside arch/arm64/mm/mmu.c as a preparation
> > for subsequent usage of the afore mentioned generic MM helpers. While here
> > drop IS_ENABLED(CONFIG_DEBUG_VM), although wrap __check_safe_pte_update()
> > inside #ifdef CONFIG_DEBUG_VM that preserves the current code optimization
> > which is achieved via the static inline functions.
> > 
> > This does not cause any functional change.
> > 
> > Cc: Catalin Marinas <catalin.marinas@arm.com>
> > Cc: Will Deacon <will@kernel.org>
> > Cc: linux-arm-kernel@lists.infradead.org
> > Cc: linux-kernel@vger.kernel.org
> > Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> > ---
> > Changes in V2:
> > 
> > - Moved __check_safe_pte_update() inside #ifdef CONFIG_DEBUG_VM
> > - Added empty stub for __check_safe_pte_update() when !CONFIG_DEBUG_VM
> > - Dropped IS_ENABLED(CONFIG_DEBUG_VM) from __check_safe_pte_update()
> > 
> >  arch/arm64/include/asm/pgtable.h | 49 ++++----------------------------
> >  arch/arm64/mm/mmu.c              | 44 ++++++++++++++++++++++++++++
> >  2 files changed, 49 insertions(+), 44 deletions(-)
> > 
> > diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
> > index e89ec5f4787b..281a512f1fc6 100644
> > --- a/arch/arm64/include/asm/pgtable.h
> > +++ b/arch/arm64/include/asm/pgtable.h
> > @@ -387,52 +387,13 @@ static inline pte_t __ptep_get(pte_t *ptep)
> >  extern void __sync_icache_dcache(pte_t pteval);
> >  bool pgattr_change_is_safe(pteval_t old, pteval_t new);
> >  
> > -/*
> > - * PTE bits configuration in the presence of hardware Dirty Bit Management
> > - * (PTE_WRITE == PTE_DBM):
> > - *
> > - * Dirty  Writable | PTE_RDONLY  PTE_WRITE  PTE_DIRTY (sw)
> > - *   0      0      |   1           0          0
> > - *   0      1      |   1           1          0
> > - *   1      0      |   1           0          1
> > - *   1      1      |   0           1          x
> > - *
> > - * When hardware DBM is not present, the software PTE_DIRTY bit is updated via
> > - * the page fault mechanism. Checking the dirty status of a pte becomes:
> > - *
> > - *   PTE_DIRTY || (PTE_WRITE && !PTE_RDONLY)
> > - */
> > -
> > -static inline void __check_safe_pte_update(struct mm_struct *mm, pte_t *ptep,
> > -					   pte_t pte)
> > +#ifdef CONFIG_DEBUG_VM
> > +void __check_safe_pte_update(struct mm_struct *mm, pte_t *ptep, pte_t pte);
> > +#else
> > +static inline void __check_safe_pte_update(struct mm_struct *mm, pte_t *ptep, pte_t pte)
> >  {
> > -	pte_t old_pte;
> > -
> > -	if (!IS_ENABLED(CONFIG_DEBUG_VM))
> > -		return;
> > -
> > -	old_pte = __ptep_get(ptep);
> > -
> > -	if (!pte_valid(old_pte) || !pte_valid(pte))
> > -		return;
> > -	if (mm != current->active_mm && atomic_read(&mm->mm_users) <= 1)
> > -		return;
> > -
> > -	/*
> > -	 * Check for potential race with hardware updates of the pte
> > -	 * (__ptep_set_access_flags safely changes valid ptes without going
> > -	 * through an invalid entry).
> > -	 */
> > -	VM_WARN_ONCE(!pte_young(pte),
> > -		     "%s: racy access flag clearing: 0x%016llx -> 0x%016llx",
> > -		     __func__, pte_val(old_pte), pte_val(pte));
> > -	VM_WARN_ONCE(pte_write(old_pte) && !pte_dirty(pte),
> > -		     "%s: racy dirty state clearing: 0x%016llx -> 0x%016llx",
> > -		     __func__, pte_val(old_pte), pte_val(pte));
> > -	VM_WARN_ONCE(!pgattr_change_is_safe(pte_val(old_pte), pte_val(pte)),
> > -		     "%s: unsafe attribute change: 0x%016llx -> 0x%016llx",
> > -		     __func__, pte_val(old_pte), pte_val(pte));
> >  }
> > +#endif
> 
> [...]
> 
> > +#ifdef CONFIG_DEBUG_VM
> > +void __check_safe_pte_update(struct mm_struct *mm, pte_t *ptep, pte_t pte)
> > +{
> > +	pte_t old_pte;
> > +
> > +	old_pte = __ptep_get(ptep);
> > +
> > +	if (!pte_valid(old_pte) || !pte_valid(pte))
> > +		return;
> > +	if (mm != current->active_mm && atomic_read(&mm->mm_users) <= 1)
> > +		return;
> > +
> > +	/*
> > +	 * Check for potential race with hardware updates of the pte
> > +	 * (__ptep_set_access_flags safely changes valid ptes without going
> > +	 * through an invalid entry).
> > +	 */
> > +	VM_WARN_ONCE(!pte_young(pte),
> > +		     "%s: racy access flag clearing: 0x%016llx -> 0x%016llx",
> > +		     __func__, pte_val(old_pte), pte_val(pte));
> > +	VM_WARN_ONCE(pte_write(old_pte) && !pte_dirty(pte),
> > +		     "%s: racy dirty state clearing: 0x%016llx -> 0x%016llx",
> > +		     __func__, pte_val(old_pte), pte_val(pte));
> > +	VM_WARN_ONCE(!pgattr_change_is_safe(pte_val(old_pte), pte_val(pte)),
> > +		     "%s: unsafe attribute change: 0x%016llx -> 0x%016llx",
> > +		     __func__, pte_val(old_pte), pte_val(pte));
> > +}
> > +#endif
> 
> #endif /* CONFIG_DEBUG_VM */
> 
> Might be helpful here.
> 
> Consider the same in the case above

Sure will update the same both in here and also for the declrations
in the header file as well.

> 
> Reviewed-by: David Hildenbrand (Arm) <david@kernel.org>

Thanks for the review.

> 
> -- 
> Cheers,
> 
> David

