Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C32BF47CB9
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 19:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R4U2IPGS+Hb4UGXKJOlJb8JzqJdjFjgSDZYHJvPywwM=; b=I3BWGbCLxqmnjvROyirfWZQYy1
	3njE29bKaNy4GVxCaoPIdS7GCfcmdfHc/r62Av9AKNj0M198qmc4FeQYGD8i3wrDHM1WdSXtRFnD/
	F6GU2g2kx3okN10QJZ2niK8GUB5zAcYetuzch2rZOXoSD7HQ5OKcxpnhzkCw+IfRdxDzz7r+praAd
	h5oh1SY+NgLc0kEdO7HRbHP2GOos13Fm9NLTBDCwOWQkdFwz4VTpW0fgpVlFazGiyzF7/qNiW+QKI
	C0Fg97YDsF/1PmaFQCwBQiIuGQhSIb4S7PFS8PHp9EQL/HDm5xqwROnuEIFvL0YiAZ8cPN8Rcn9Q0
	tzkn/IpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyEEI-00000002RFi-3rgq;
	Thu, 05 Mar 2026 19:19:26 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyEEF-00000002REg-3KIe
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 19:19:25 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D8799497;
	Thu,  5 Mar 2026 11:19:13 -0800 (PST)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 888263F694;
	Thu,  5 Mar 2026 11:19:18 -0800 (PST)
Date: Thu, 5 Mar 2026 19:19:15 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	James Morse <james.morse@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Mark Brown <broonie@kernel.org>, kvmarm@lists.linux.dev
Subject: Re: [PATCH 2/4] arm64: tlb: Pass the corresponding mm to
 __tlbi_sync_s1ish()
Message-ID: <aanXM7YWMAJW6qk7@arm.com>
References: <20260302165801.3014607-1-catalin.marinas@arm.com>
 <20260302165801.3014607-3-catalin.marinas@arm.com>
 <aamULrOkm8jd_9UY@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aamULrOkm8jd_9UY@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_111923_910535_519C65FA 
X-CRM114-Status: GOOD (  30.38  )
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

On Thu, Mar 05, 2026 at 02:33:18PM +0000, Will Deacon wrote:
> On Mon, Mar 02, 2026 at 04:57:55PM +0000, Catalin Marinas wrote:
> > The mm structure will be used for workarounds that need limiting to
> > specific tasks.
> > 
> > Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
> > Cc: Will Deacon <will@kernel.org>
> > Cc: Mark Rutland <mark.rutland@arm.com>
> > ---
> >  arch/arm64/include/asm/tlbflush.h | 10 +++++-----
> >  arch/arm64/kernel/sys_compat.c    |  2 +-
> >  2 files changed, 6 insertions(+), 6 deletions(-)
> > 
> > diff --git a/arch/arm64/include/asm/tlbflush.h b/arch/arm64/include/asm/tlbflush.h
> > index 19be0f7bfca5..14f116bfec73 100644
> > --- a/arch/arm64/include/asm/tlbflush.h
> > +++ b/arch/arm64/include/asm/tlbflush.h
> > @@ -185,7 +185,7 @@ do {										\
> >   * Complete broadcast TLB maintenance issued by the host which invalidates
> >   * stage 1 information in the host's own translation regime.
> >   */
> > -static inline void __tlbi_sync_s1ish(void)
> > +static inline void __tlbi_sync_s1ish(struct mm_struct *mm)
> >  {
> >  	dsb(ish);
> >  	__repeat_tlbi_sync(vale1is, 0);
> > @@ -317,7 +317,7 @@ static inline void flush_tlb_mm(struct mm_struct *mm)
> >  	asid = __TLBI_VADDR(0, ASID(mm));
> >  	__tlbi(aside1is, asid);
> >  	__tlbi_user(aside1is, asid);
> > -	__tlbi_sync_s1ish();
> > +	__tlbi_sync_s1ish(mm);
> >  	mmu_notifier_arch_invalidate_secondary_tlbs(mm, 0, -1UL);
> >  }
> >  
> > @@ -371,7 +371,7 @@ static inline void flush_tlb_page(struct vm_area_struct *vma,
> >  				  unsigned long uaddr)
> >  {
> >  	flush_tlb_page_nosync(vma, uaddr);
> > -	__tlbi_sync_s1ish();
> > +	__tlbi_sync_s1ish(vma->vm_mm);
> >  }
> >  
> >  static inline bool arch_tlbbatch_should_defer(struct mm_struct *mm)
> > @@ -391,7 +391,7 @@ static inline bool arch_tlbbatch_should_defer(struct mm_struct *mm)
> >   */
> >  static inline void arch_tlbbatch_flush(struct arch_tlbflush_unmap_batch *batch)
> >  {
> > -	__tlbi_sync_s1ish();
> > +	__tlbi_sync_s1ish(NULL);
> 
> Hmm, it seems a bit rubbish to pass NULL here as that means that we'll
> deploy the mitigation regardless of the mm flags when finishing the
> batch.
> 
> It also looks like we could end up doing the workaround multiple times
> if arch_tlbbatch_add_pending() is passed a large enough region that we
> call __flush_tlb_range_limit_excess() fires.
> 
> So perhaps we should stash the mm in 'struct arch_tlbflush_unmap_batch'
> alongside some state to track whether or not we have uncompleted TLB
> maintenance in flight?

The problem is that arch_tlbbatch_flush() can be called to synchronise
multiple mm structures that were touched by TTU. We can't have the mm in
arch_tlbflush_unmap_batch. But we can track if any of the mms had
MMCF_SME_DVMSYNC flag set, something like below (needs testing, tidying
up). TBH, I did not notice any problem in benchmarking as I guess we
haven't exercised the TTU path much, so did not bother to optimise it.

For the TTU case, I don't think we need to worry about the excess limit
and doing the IPI twice. But I'll double check the code paths tomorrow.

diff --git a/arch/arm64/include/asm/tlbbatch.h b/arch/arm64/include/asm/tlbbatch.h
index fedb0b87b8db..e756eaca6cb8 100644
--- a/arch/arm64/include/asm/tlbbatch.h
+++ b/arch/arm64/include/asm/tlbbatch.h
@@ -7,6 +7,8 @@ struct arch_tlbflush_unmap_batch {
 	 * For arm64, HW can do tlb shootdown, so we don't
 	 * need to record cpumask for sending IPI
 	 */
+
+	bool sme_dvmsync;
 };

 #endif /* _ARCH_ARM64_TLBBATCH_H */
diff --git a/arch/arm64/include/asm/tlbflush.h b/arch/arm64/include/asm/tlbflush.h
index e3ea0246a4f4..c1141a684854 100644
--- a/arch/arm64/include/asm/tlbflush.h
+++ b/arch/arm64/include/asm/tlbflush.h
@@ -201,10 +201,15 @@ do {										\
  * Complete broadcast TLB maintenance issued by the host which invalidates
  * stage 1 information in the host's own translation regime.
  */
-static inline void __tlbi_sync_s1ish(struct mm_struct *mm)
+static inline void __tlbi_sync_s1ish_no_sme_dvmsync(void)
 {
 	dsb(ish);
 	__repeat_tlbi_sync(vale1is, 0);
+}
+
+static inline void __tlbi_sync_s1ish(struct mm_struct *mm)
+{
+	__tlbi_sync_s1ish_no_sme_dvmsync();
 	sme_dvmsync(mm);
 }

@@ -408,7 +413,11 @@ static inline bool arch_tlbbatch_should_defer(struct mm_struct *mm)
  */
 static inline void arch_tlbbatch_flush(struct arch_tlbflush_unmap_batch *batch)
 {
-	__tlbi_sync_s1ish(NULL);
+	__tlbi_sync_s1ish_no_sme_dvmsync();
+	if (batch->sme_dvmsync) {
+		batch->sme_dvmsync = false;
+		sme_dvmsync(NULL);
+	}
 }

 /*
@@ -613,6 +622,8 @@ static inline void arch_tlbbatch_add_pending(struct arch_tlbflush_unmap_batch *b
 		struct mm_struct *mm, unsigned long start, unsigned long end)
 {
 	__flush_tlb_range_nosync(mm, start, end, PAGE_SIZE, true, 3);
+	if (test_bit(ilog2(MMCF_SME_DVMSYNC), &mm->context.flags))
+		batch->sme_dvmsync = true;
 }

 static inline bool __pte_flags_need_flush(ptdesc_t oldval, ptdesc_t newval)


