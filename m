Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39E54F33A76
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 14:33:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HbF3wrIdze74YEh3XbAuwCSMxrsnLMas5453JoP+biE=; b=A4dHdoj1U2oSS/krWOaYNNm3Br
	AEyiMCX52Xv8L/fzjUiWHpoZ82/1p3fUoaBu974z6s6W7X1l2AK9Uahz7+s4kSwUr2Kl/q9pvJPbr
	9OBRSXAPk7bFlNQ13xTdsFDA39v4MBYEcLfWJNmAoY6aGWX4tFIUYg3KX7DrX6Iigolutrz3Omabm
	oLKpTmWkgIbWEtnhavNdflznTzCegNiXiGE6Xmmp51Mfg3PkkOIWiRxpp9U9qzqYbbT/Vnbn7d5UH
	obrG2k1OV0lqJbERrQ/sftGxNd5SCkeb1LurOhULTq93hy5YiFnuh4utA8bJuD5FZjrD1VTT1fb8V
	Bo38mI8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy9lW-00000001zzJ-216i;
	Thu, 05 Mar 2026 14:33:26 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy9lV-00000001zyz-1Waq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 14:33:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7AD1E61340;
	Thu,  5 Mar 2026 14:33:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5C03C116C6;
	Thu,  5 Mar 2026 14:33:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772721203;
	bh=OySpI3JAnSwg1LMlIlUl9oekpXMcX1pam0E670cUMlI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UcLlkiAZydHSIkmBx6iTHRlXL4y3Xwh715dQq62HjfdsJBtNkTt6iw1gg1roh8eeR
	 zG0m0Bo5DOXFm6l/PcEXfObxLrqSkfIeSBHINfFi3zyEvsItPVAgyPqS6oY+z9HMff
	 nvEjSQ/TCsNopnVGNEEOfJI79ulhjopHRontWqiU0CNB4bJpIdoU0V/hsA1uUO3weA
	 lW9VteU9+InuEjGwo0G5K2zNr9qg+Kf1WSSzAdcfKvbeEcX1qmMWD3R8rxqJdRTcJm
	 1w3tD6Ce5WdXCils/R0lC1EE21biRLhnOhjyy5gNzb0yHPNWqacJPN0+o8LXSDX/F3
	 4W1uzIwAT9OOg==
Date: Thu, 5 Mar 2026 14:33:18 +0000
From: Will Deacon <will@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	James Morse <james.morse@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Mark Brown <broonie@kernel.org>, kvmarm@lists.linux.dev
Subject: Re: [PATCH 2/4] arm64: tlb: Pass the corresponding mm to
 __tlbi_sync_s1ish()
Message-ID: <aamULrOkm8jd_9UY@willie-the-truck>
References: <20260302165801.3014607-1-catalin.marinas@arm.com>
 <20260302165801.3014607-3-catalin.marinas@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260302165801.3014607-3-catalin.marinas@arm.com>
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

On Mon, Mar 02, 2026 at 04:57:55PM +0000, Catalin Marinas wrote:
> The mm structure will be used for workarounds that need limiting to
> specific tasks.
> 
> Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> ---
>  arch/arm64/include/asm/tlbflush.h | 10 +++++-----
>  arch/arm64/kernel/sys_compat.c    |  2 +-
>  2 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/tlbflush.h b/arch/arm64/include/asm/tlbflush.h
> index 19be0f7bfca5..14f116bfec73 100644
> --- a/arch/arm64/include/asm/tlbflush.h
> +++ b/arch/arm64/include/asm/tlbflush.h
> @@ -185,7 +185,7 @@ do {										\
>   * Complete broadcast TLB maintenance issued by the host which invalidates
>   * stage 1 information in the host's own translation regime.
>   */
> -static inline void __tlbi_sync_s1ish(void)
> +static inline void __tlbi_sync_s1ish(struct mm_struct *mm)
>  {
>  	dsb(ish);
>  	__repeat_tlbi_sync(vale1is, 0);
> @@ -317,7 +317,7 @@ static inline void flush_tlb_mm(struct mm_struct *mm)
>  	asid = __TLBI_VADDR(0, ASID(mm));
>  	__tlbi(aside1is, asid);
>  	__tlbi_user(aside1is, asid);
> -	__tlbi_sync_s1ish();
> +	__tlbi_sync_s1ish(mm);
>  	mmu_notifier_arch_invalidate_secondary_tlbs(mm, 0, -1UL);
>  }
>  
> @@ -371,7 +371,7 @@ static inline void flush_tlb_page(struct vm_area_struct *vma,
>  				  unsigned long uaddr)
>  {
>  	flush_tlb_page_nosync(vma, uaddr);
> -	__tlbi_sync_s1ish();
> +	__tlbi_sync_s1ish(vma->vm_mm);
>  }
>  
>  static inline bool arch_tlbbatch_should_defer(struct mm_struct *mm)
> @@ -391,7 +391,7 @@ static inline bool arch_tlbbatch_should_defer(struct mm_struct *mm)
>   */
>  static inline void arch_tlbbatch_flush(struct arch_tlbflush_unmap_batch *batch)
>  {
> -	__tlbi_sync_s1ish();
> +	__tlbi_sync_s1ish(NULL);

Hmm, it seems a bit rubbish to pass NULL here as that means that we'll
deploy the mitigation regardless of the mm flags when finishing the
batch.

It also looks like we could end up doing the workaround multiple times
if arch_tlbbatch_add_pending() is passed a large enough region that we
call __flush_tlb_range_limit_excess() fires.

So perhaps we should stash the mm in 'struct arch_tlbflush_unmap_batch'
alongside some state to track whether or not we have uncompleted TLB
maintenance in flight?

Will

