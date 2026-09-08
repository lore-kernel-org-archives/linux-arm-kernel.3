Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDEA7C79F82
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 04:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=54x+ic7p5AvLCn1WaDLbC0t3N8vsMYyzJxRLU1kfPPg=; b=Z7Knbs3txfdPb1kZ2+WhKts4/i
	zeGo1HF4yf5W+zHKJxKsWFx49/4dqFYnn+bSl10qhjy1BmGrArEajMB4+3PJDFGLItxC2ueHxvAAQ
	PvslSKd6klrCZG2GO+B8JHycRZBZQ6S3apHZO8waePHYTL+ma5/Kk63YDMVfn4ma7xsQvXbexsT46
	gc+BRX+aQevDaT0SO7vwVfUrAtER1xiz5vOKHBbQU38+w1QzOdNAaiWiT9Z6iUN0Wov3HizF1hCCq
	nFxJMM+X++7gomJFU85aWaB6gF7O/UYr73I7tG4EgJV1bPfl4zJnvidqHPHVHuP83WVQiYeNWIo8R
	BOf/k3AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3nR3-000000081JQ-3UUd;
	Tue, 08 Sep 2026 04:27:53 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3nQx-000000081Is-1Mzd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 04:27:52 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 847191476;
	Mon,  7 Sep 2026 21:27:39 -0700 (PDT)
Received: from localhost (a085714.arm.com [10.164.19.28])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7A8713F528;
	Mon,  7 Sep 2026 21:27:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788841663; bh=hQJkvNi3bb05p4k/wBr7hrOWhHO3OdgSFqaZH/K7Pio=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rGXTvjNfsjYZ5xTnn8tyhlFX0kFcSi6jAtuHU6+/Kt9ZQdNKwjGhAiOza7Kt7ZXc4
	 OUH3+1Dcia4bBZrF+87mn/ntKj0rOAVUloAmgg/kSoQk1iBamIQ4a7CUcJKuhm1cqU
	 bUgvStjtQYXc+HMvAzXwFeJ1V9ac38ruBW8clF84=
Date: Tue, 8 Sep 2026 09:57:39 +0530
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, Mike Rapoport <rppt@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org
Subject: Re: [PATCH 1/2] arm64/mm: Move __check_safe_pte_update()
Message-ID: <afwvof4qixu5rzkgnpj272ntazog4zpdm6sietwugljizmtmel@q7ldx23yngl7>
References: <20260901065454.1906343-1-anshuman.khandual@arm.com>
 <20260901065454.1906343-2-anshuman.khandual@arm.com>
 <a70e45cc-dbf7-40da-81e8-ee6055f2692f@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a70e45cc-dbf7-40da-81e8-ee6055f2692f@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_212747_471474_A5D6CD7F 
X-CRM114-Status: GOOD (  32.30  )
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

On Mon, Sep 07, 2026 at 05:48:18PM +0200, David Hildenbrand (Arm) wrote:
> On 9/1/26 08:54, Anshuman Khandual wrote:
> > The page table entry print helpers and related macros which are defined in
> > <linux/pgtable.h> will not be accessible in platform <asm/pgtable.h> which
> > is basically caused by cycling dependency.
> > 
> > Move __check_safe_pte_update() inside arch/arm64/mm/mmu.c as a preparation
> > for subsequent usage of the afore mentioned generic MM helpers.
> > 
> > This does not cause any functional change.
> > 
> > Cc: Catalin Marinas <catalin.marinas@arm.com>
> > Cc: Will Deacon <will@kernel.org>
> > Cc: linux-arm-kernel@lists.infradead.org
> > Cc: linux-kernel@vger.kernel.org
> > Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> > ---
> > Should __check_safe_pte_update() be wrapped in #ifdef CONFIG_DEBUG_VM
> > along with dropping off current IS_ENABLED() test. That would ensure
> > the function never gets called when CONFIG_DEBUG_VM is disabled. That
> > will preserve current behaviour as the inline function gets dropped
> > when CONFIG_DEBUG_VM remains disabled.
> > 
> >  arch/arm64/include/asm/pgtable.h | 47 +-------------------------------
> >  arch/arm64/mm/mmu.c              | 45 ++++++++++++++++++++++++++++++
> >  2 files changed, 46 insertions(+), 46 deletions(-)
> > 
> > diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
> > index e89ec5f4787b..61fbfab3e06e 100644
> > --- a/arch/arm64/include/asm/pgtable.h
> > +++ b/arch/arm64/include/asm/pgtable.h
> > @@ -387,52 +387,7 @@ static inline pte_t __ptep_get(pte_t *ptep)
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
> > -{
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
> > -}
> > +void __check_safe_pte_update(struct mm_struct *mm, pte_t *ptep, pte_t pte);
> >  
> 
> That implies that any __set_ptes_anysz() will invoke another function call that
> will not be optimized out.

Right.

> 
> You should likely keep most of __check_safe_pte_update() in the header as an
> inline function (or at least the CONFIG_DEBUG_VM check), and only move the "slow
> path" code.
> 
> Alternatively, make the whole thing #ifdef CONFIG_DEBUG_VM and provide an empty
> inline helper for !CONFIG_DEBUG_VM.
> 
> That's probably the cleanest, because performance with CONFIG_DEBUG_VM is not
> really relevant.

Agreed, I had asked exact same question earlier as well.

> > Should __check_safe_pte_update() be wrapped in #ifdef CONFIG_DEBUG_VM
> > along with dropping off current IS_ENABLED() test. That would ensure
> > the function never gets called when CONFIG_DEBUG_VM is disabled. That
> > will preserve current behaviour as the inline function gets dropped
> > when CONFIG_DEBUG_VM remains disabled.

Will fold in the following changes.

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index 61fbfab3e06e..281a512f1fc6 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -387,7 +387,13 @@ static inline pte_t __ptep_get(pte_t *ptep)
 extern void __sync_icache_dcache(pte_t pteval);
 bool pgattr_change_is_safe(pteval_t old, pteval_t new);

+#ifdef CONFIG_DEBUG_VM
 void __check_safe_pte_update(struct mm_struct *mm, pte_t *ptep, pte_t pte);
+#else
+static inline void __check_safe_pte_update(struct mm_struct *mm, pte_t *ptep, pte_t pte)
+{
+}
+#endif

 static inline void __sync_cache_and_tags(pte_t pte, unsigned int nr_pages)
 {
diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index b5de4095d650..26f4cf7b753e 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -2408,15 +2408,13 @@ int arch_set_user_pkey_access(int pkey, unsigned long init_val)
  *
  *   PTE_DIRTY || (PTE_WRITE && !PTE_RDONLY)
  */
+#ifdef CONFIG_DEBUG_VM
 void __check_safe_pte_update(struct mm_struct *mm, pte_t *ptep, pte_t pte)
 {
        char pte_str_old[PTVAL_STR_MAX];
        char pte_str[PTVAL_STR_MAX];
        pte_t old_pte;

-       if (!IS_ENABLED(CONFIG_DEBUG_VM))
-               return;
-
        old_pte = __ptep_get(ptep);

        if (!pte_valid(old_pte) || !pte_valid(pte))
@@ -2442,3 +2440,4 @@ void __check_safe_pte_update(struct mm_struct *mm, pte_t *ptep, pte_t pte)
                     __func__, pte_str_old, pte_str);
 }
 #endif
+#endif

>
> 
> -- 
> Cheers,
> 
> David

