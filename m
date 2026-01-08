Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8779ED1D46C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 15:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=itYM5XXfo2h+u31p3OtnK0IaojSZwmQxOvrqjfzMQZk=; b=0dUtuQAJl76P8gb4vQKywMQZ4J
	Oriq6kX4jKxDMLCXQEL+SQ6nMb12zGZWex4ESWiH67vu1g0FJtw89o0ozKPwbfUFk1E5O9bNRV+/Q
	zyN4krifBqPDdu3NV40L+nu3yWKX1kifzEuIsM8m7Jq92I1zFPhOeVzJbucGEiN+auvQc5TfH83xD
	1tmKRE1WU+ouyeVsBaB8JGKE3zR7caak1L2YMQTeQGv/Juj+Jvqonslhueu5mByevuiFen6mqviuj
	52CLL/E5pg1if3NSZG0QJXtuwocW63b21ze0Gn47zOotZo1CqzyT4QScGtx8oltKp49ylcTfMHIio
	rr3ut67A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdrZt-0000000HS1C-1tPq;
	Thu, 08 Jan 2026 15:05:33 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdrZq-0000000HRzx-44w4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 15:05:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DE536417DA;
	Thu,  8 Jan 2026 15:05:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E261C116C6;
	Thu,  8 Jan 2026 15:05:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767884729;
	bh=HCzjlCvsEfLTEbpTDGVClTwcV3szxBt/hvrX9f5cyHI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=C4k9/PlEEPLA4oYhmOJEhlagONWaeFCfXjGKOQAeaF9iRaCbECpyQ/sx5eMnLOA93
	 jHFfx4jZJVqVT/UxmlXzci/rbXEOw/Y+PeoULJK/BpNV0u8dHn1eBFaPgSv74GBSiK
	 X4pokmhkwD1Imxrw55akCGWBbkbEJ/mwlqkyzvrGJ9Y8emMgh+c9jmwcSaI1WjVFHh
	 IQ7LpljLQTc54MsOrQ6bFXYdQKhXpimNK6Mwo30n/XoUVGD3aA2y0jzTbVRPInl4Mi
	 m5MnjP+ZgeRleTCa4Wrm4iAnHOJg2sP0jwPWrx2S6KEBedEZbtrhYBONAo8rCewEGS
	 VJSp2rNG/FAgw==
Date: Thu, 8 Jan 2026 15:05:24 +0000
From: Will Deacon <will@kernel.org>
To: Carl Worth <carl@os.amperecomputing.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Taehyun Noh <taehyun@utexas.edu>, andreyknvl@gmail.com,
	pcc@google.com, yeoreum.yun@arm.com
Subject: Re: [PATCH 1/2] arm64: mte: Unify kernel MTE policy and manipulation
 of TCO
Message-ID: <aV_HtIwNqabq16BF@willie-the-truck>
References: <20251030-mte-tighten-tco-v1-0-88c92e7529d9@os.amperecomputing.com>
 <20251030-mte-tighten-tco-v1-1-88c92e7529d9@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251030-mte-tighten-tco-v1-1-88c92e7529d9@os.amperecomputing.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_070531_050227_57FE8D6B 
X-CRM114-Status: GOOD (  41.35  )
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

On Thu, Oct 30, 2025 at 08:49:31PM -0700, Carl Worth wrote:
> From: Taehyun Noh <taehyun@utexas.edu>
> 
> The kernel's primary knob for controlling MTE tag checking is the
> PSTATE.TCO bit (tag check override). TCO is enabled (which,
> confusingly _disables_ tag checking) by the hardware at the time of an
> exception. Then, at various times, when the kernel needs to enable
> tag-checking it clears TCO, (which in turn allows TCF0 or TCF to
> control whether tag-checking occurs).
> 
> Some of the TCO manipulation code has redundancy and confusing naming.
> 
> Fix the redundancy by introducing a new function user_uses_tagcheck
> which captures the existing repeated condition. The new function
> includes significant new comments to help explain the logic.
> 
> Fix the naming by renaming mte_disable_tco_entry() to
> set_kernel_mte_policy(). This function does not necessarily disable
> TCO, but does so only conditionally in the case of KASAN HW TAGS. The
> new name accurately describes the purpose of the function.
> 
> This commit should have no behavioral change.
> 
> Signed-off-by: Taehyun Noh <taehyun@utexas.edu>
> Co-developed-by: Carl Worth <carl@os.amperecomputing.com>
> Signed-off-by: Carl Worth <carl@os.amperecomputing.com>
> ---
>  arch/arm64/include/asm/mte.h     | 40 +++++++++++++++++++++++++++++++++-------
>  arch/arm64/kernel/entry-common.c |  4 ++--
>  arch/arm64/kernel/mte.c          |  2 +-
>  3 files changed, 36 insertions(+), 10 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/mte.h b/arch/arm64/include/asm/mte.h
> index 3b5069f4683d..70dabc884616 100644
> --- a/arch/arm64/include/asm/mte.h
> +++ b/arch/arm64/include/asm/mte.h
> @@ -224,7 +224,35 @@ static inline bool folio_try_hugetlb_mte_tagging(struct folio *folio)
>  }
>  #endif
>  
> -static inline void mte_disable_tco_entry(struct task_struct *task)
> +static inline bool user_uses_tagcheck(void)
> +{
> +	/*
> +	 * To decide whether userspace wants tag checking we only look
> +	 * at TCF0 (SCTLR_EL1.TCF0 bit 0 is set for both synchronous
> +	 * or asymmetric mode).
> +	 *
> +	 * There's an argument that could be made that the kernel
> +	 * should also consider the state of TCO (tag check override)
> +	 * since userspace does have the ability to set that as well,
> +	 * and that could suggest a desire to disable tag checking in
> +	 * spite of the state of TCF0. However, the Linux kernel has
> +	 * never historically considered the userspace state of TCO,
> +	 * (so changing this would be an ABI break), and the hardware
> +	 * unconditionally sets TCO when an exception occurs
> +	 * anyway.
> +	 *
> +	 * So, again, here we look only at TCF0 and do not consider
> +	 * TCO.
> +	 */
> +	return (current->thread.sctlr_user & (1UL << SCTLR_EL1_TCF0_SHIFT));
> +}
> +
> +/*
> + * Set the kernel's desired policy for MTE tag checking.
> + *
> + * This function should be used right after the kernel entry.
> + */
> +static inline void set_kernel_mte_policy(struct task_struct *task)
>  {
>  	if (!system_supports_mte())
>  		return;
> @@ -232,15 +260,13 @@ static inline void mte_disable_tco_entry(struct task_struct *task)
>  	/*
>  	 * Re-enable tag checking (TCO set on exception entry). This is only
>  	 * necessary if MTE is enabled in either the kernel or the userspace
> -	 * task in synchronous or asymmetric mode (SCTLR_EL1.TCF0 bit 0 is set
> -	 * for both). With MTE disabled in the kernel and disabled or
> -	 * asynchronous in userspace, tag check faults (including in uaccesses)
> -	 * are not reported, therefore there is no need to re-enable checking.
> +	 * task. With MTE disabled in the kernel and disabled or asynchronous
> +	 * in userspace, tag check faults (including in uaccesses) are not
> +	 * reported, therefore there is no need to re-enable checking.
>  	 * This is beneficial on microarchitectures where re-enabling TCO is
>  	 * expensive.

The comment implies that toggling TCO can be expensive, so it's not clear
to me that moving it to the uaccess routines in the next patch is
necessarily a good idea in general. I understand that you see improvements
with memcached, but have you tried exercising workloads that are heavy on
user accesses?

>  	 */
> -	if (kasan_hw_tags_enabled() ||
> -	    (task->thread.sctlr_user & (1UL << SCTLR_EL1_TCF0_SHIFT)))
> +	if (kasan_hw_tags_enabled() || user_uses_tagcheck())
>  		asm volatile(SET_PSTATE_TCO(0));
>  }
>  
> diff --git a/arch/arm64/kernel/entry-common.c b/arch/arm64/kernel/entry-common.c
> index f546a914f041..466562d1d966 100644
> --- a/arch/arm64/kernel/entry-common.c
> +++ b/arch/arm64/kernel/entry-common.c
> @@ -49,7 +49,7 @@ static noinstr irqentry_state_t enter_from_kernel_mode(struct pt_regs *regs)
>  
>  	state = __enter_from_kernel_mode(regs);
>  	mte_check_tfsr_entry();
> -	mte_disable_tco_entry(current);
> +	set_kernel_mte_policy(current);
>  
>  	return state;
>  }
> @@ -83,7 +83,7 @@ static void noinstr exit_to_kernel_mode(struct pt_regs *regs,
>  static __always_inline void __enter_from_user_mode(struct pt_regs *regs)
>  {
>  	enter_from_user_mode(regs);
> -	mte_disable_tco_entry(current);
> +	set_kernel_mte_policy(current);
>  }
>  
>  static __always_inline void arm64_enter_from_user_mode(struct pt_regs *regs)
> diff --git a/arch/arm64/kernel/mte.c b/arch/arm64/kernel/mte.c
> index 43f7a2f39403..0cc698714328 100644
> --- a/arch/arm64/kernel/mte.c
> +++ b/arch/arm64/kernel/mte.c
> @@ -289,7 +289,7 @@ void mte_thread_switch(struct task_struct *next)
>  	mte_update_gcr_excl(next);
>  
>  	/* TCO may not have been disabled on exception entry for the current task. */
> -	mte_disable_tco_entry(next);
> +	set_kernel_mte_policy(next);

So this passes 'next' as the task, but user_uses_tagcheck() looks at
current. Shouldn't you propagate the task through?

Will

