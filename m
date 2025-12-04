Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61545D1D86A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Dec 2025 06:23:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6l0HMzCxDiyUfxstnEkfZMMZ5+gP7tJN+XR0Bg9NIsQ=; b=ysCwenkV4igG2LKydfVmwSRW19
	AWsTS0UYSz1UwEC/hzua8U7pL7IMPLl6t/HQWHpniVAfWhwjd7HKDoYS8Jcn7qxhgZs2SpSL4bkEd
	QFsEqKARYdyMcoO39oHZQ9eFDV74SMAumnXDNbVNpUwiYB8WXJw9Os/UNTfYm6ZOr3Z9hgiGrws3G
	VJyVLpuat4ekim4gQRCg5MGUJtFhbcQRvOqtxQ8+Op24zPAzRfDpfJu5dwu3lo4r25QlzpPeUF+WS
	hhz0tx9c1WUa5/gP42SXGUXcMTRIODfBBXaajXi10KsrepZrBpI+pzq1E/Kvd3lgy5x5dnURbMrX4
	4cW88AHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR2kY-00000007Xd5-42OF;
	Thu, 04 Dec 2025 06:23:34 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR2kV-00000007Xcg-2evl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Dec 2025 06:23:32 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4C7BD339;
	Wed,  3 Dec 2025 22:23:22 -0800 (PST)
Received: from [10.164.18.78] (unknown [10.164.18.78])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C12193F73B;
	Wed,  3 Dec 2025 22:23:19 -0800 (PST)
Message-ID: <2dfd54d7-fe2a-4921-85ff-a581392a777a@arm.com>
Date: Thu, 4 Dec 2025 11:53:17 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 08/12] mm: enable lazy_mmu sections to nest
To: Kevin Brodsky <kevin.brodsky@arm.com>, linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>,
 Andreas Larsson <andreas@gaisler.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Borislav Petkov
 <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 David Hildenbrand <david@redhat.com>, "David S. Miller"
 <davem@davemloft.net>, David Woodhouse <dwmw2@infradead.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>,
 Jann Horn <jannh@google.com>, Juergen Gross <jgross@suse.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Michal Hocko <mhocko@suse.com>,
 Mike Rapoport <rppt@kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
 Peter Zijlstra <peterz@infradead.org>,
 "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Suren Baghdasaryan <surenb@google.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
 Vlastimil Babka <vbabka@suse.cz>, Will Deacon <will@kernel.org>,
 Yeoreum Yun <yeoreum.yun@arm.com>, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org,
 xen-devel@lists.xenproject.org, x86@kernel.org
References: <20251124132228.622678-1-kevin.brodsky@arm.com>
 <20251124132228.622678-9-kevin.brodsky@arm.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20251124132228.622678-9-kevin.brodsky@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251203_222331_766624_E6A02196 
X-CRM114-Status: GOOD (  51.65  )
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

On 24/11/25 6:52 PM, Kevin Brodsky wrote:
> Despite recent efforts to prevent lazy_mmu sections from nesting, it
> remains difficult to ensure that it never occurs - and in fact it
> does occur on arm64 in certain situations (CONFIG_DEBUG_PAGEALLOC).
> Commit 1ef3095b1405 ("arm64/mm: Permit lazy_mmu_mode to be nested")
> made nesting tolerable on arm64, but without truly supporting it:
> the inner call to leave() disables the batching optimisation before
> the outer section ends.
> 
> This patch actually enables lazy_mmu sections to nest by tracking
> the nesting level in task_struct, in a similar fashion to e.g.
> pagefault_{enable,disable}(). This is fully handled by the generic
> lazy_mmu helpers that were recently introduced.
> 
> lazy_mmu sections were not initially intended to nest, so we need to
> clarify the semantics w.r.t. the arch_*_lazy_mmu_mode() callbacks.
> This patch takes the following approach:
> 
> * The outermost calls to lazy_mmu_mode_{enable,disable}() trigger
>   calls to arch_{enter,leave}_lazy_mmu_mode() - this is unchanged.
> 
> * Nested calls to lazy_mmu_mode_{enable,disable}() are not forwarded
>   to the arch via arch_{enter,leave} - lazy MMU remains enabled so
>   the assumption is that these callbacks are not relevant. However,
>   existing code may rely on a call to disable() to flush any batched
>   state, regardless of nesting. arch_flush_lazy_mmu_mode() is
>   therefore called in that situation.
> 
> A separate interface was recently introduced to temporarily pause
> the lazy MMU mode: lazy_mmu_mode_{pause,resume}(). pause() fully
> exits the mode *regardless of the nesting level*, and resume()
> restores the mode at the same nesting level.
> 
> pause()/resume() are themselves allowed to nest, so we actually
> store two nesting levels in task_struct: enable_count and
> pause_count. A new helper in_lazy_mmu_mode() is introduced to
> determine whether we are currently in lazy MMU mode; this will be
> used in subsequent patches to replace the various ways arch's
> currently track whether the mode is enabled.
> 
> In summary (enable/pause represent the values *after* the call):
> 
> lazy_mmu_mode_enable()		-> arch_enter()	    enable=1 pause=0
>     lazy_mmu_mode_enable()	-> ø		    enable=2 pause=0
> 	lazy_mmu_mode_pause()	-> arch_leave()     enable=2 pause=1
> 	lazy_mmu_mode_resume()	-> arch_enter()     enable=2 pause=0
>     lazy_mmu_mode_disable()	-> arch_flush()     enable=1 pause=0
> lazy_mmu_mode_disable()		-> arch_leave()     enable=0 pause=0
> 
> Note: in_lazy_mmu_mode() is added to <linux/sched.h> to allow arch
> headers included by <linux/pgtable.h> to use it.
> 
> Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
> ---
>  arch/arm64/include/asm/pgtable.h |  12 ----
>  include/linux/mm_types_task.h    |   5 ++
>  include/linux/pgtable.h          | 115 +++++++++++++++++++++++++++++--
>  include/linux/sched.h            |  45 ++++++++++++
>  4 files changed, 158 insertions(+), 19 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
> index e596899f4029..a7d99dee3dc4 100644
> --- a/arch/arm64/include/asm/pgtable.h
> +++ b/arch/arm64/include/asm/pgtable.h
> @@ -82,18 +82,6 @@ static inline void queue_pte_barriers(void)
>  
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
>  	set_thread_flag(TIF_LAZY_MMU);>  }

Should not platform specific changes be deferred to subsequent patches until
nesting is completely enabled in generic first ? Although no problem as such
but would be bit cleaner.

>  
> diff --git a/include/linux/mm_types_task.h b/include/linux/mm_types_task.h
> index a82aa80c0ba4..11bf319d78ec 100644
> --- a/include/linux/mm_types_task.h
> +++ b/include/linux/mm_types_task.h
> @@ -88,4 +88,9 @@ struct tlbflush_unmap_batch {
>  #endif
>  };
>  
> +struct lazy_mmu_state {
> +	u8 enable_count;
> +	u8 pause_count;
> +};
> +

Should not this be wrapped with CONFIG_ARCH_HAS_LAZY_MMU_MODE as the task_struct
element 'lazy_mmu_state' is only available with the feature. Besides, is a depth
of 256 really expected here ? 4 bits for each element would not be sufficient for
a depth of 16 ?


>  #endif /* _LINUX_MM_TYPES_TASK_H */
> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
> index 8ff6fdb4b13d..24fdb6f5c2e1 100644
> --- a/include/linux/pgtable.h
> +++ b/include/linux/pgtable.h
> @@ -230,39 +230,140 @@ static inline int pmd_dirty(pmd_t pmd)
>   * (In practice, for user PTE updates, the appropriate page table lock(s) are
>   * held, but for kernel PTE updates, no lock is held). The mode is disabled in
>   * interrupt context and calls to the lazy_mmu API have no effect.
> - * Nesting is not permitted.
> + *
> + * The lazy MMU mode is enabled for a given block of code using:
> + *
> + *   lazy_mmu_mode_enable();
> + *   <code>
> + *   lazy_mmu_mode_disable();
> + *
> + * Nesting is permitted: <code> may itself use an enable()/disable() pair.
> + * A nested call to enable() has no functional effect; however disable() causes
> + * any batched architectural state to be flushed regardless of nesting. After a

Just wondering if there is a method for these generic helpers to ensure that platform
really does the required flushing on _disable() or the expected platform semantics is
only described via this comment alone ?

> + * call to disable(), the caller can therefore rely on all previous page table
> + * modifications to have taken effect, but the lazy MMU mode may still be
> + * enabled.
> + *
> + * In certain cases, it may be desirable to temporarily pause the lazy MMU mode.
> + * This can be done using:
> + *
> + *   lazy_mmu_mode_pause();
> + *   <code>
> + *   lazy_mmu_mode_resume();
> + *
> + * pause() ensures that the mode is exited regardless of the nesting level;
> + * resume() re-enters the mode at the same nesting level. Any call to the
> + * lazy_mmu_mode_* API between those two calls has no effect. In particular,
> + * this means that pause()/resume() pairs may nest.
> + *
> + * in_lazy_mmu_mode() can be used to check whether the lazy MMU mode is
> + * currently enabled.

Just wondering - could a corresponding test be included probably via KUNIT_TEST
to ensure the above described semantics are being followed.

>   */
>  #ifdef CONFIG_ARCH_HAS_LAZY_MMU_MODE
> +/**
> + * lazy_mmu_mode_enable() - Enable the lazy MMU mode.
> + *
> + * Enters a new lazy MMU mode section; if the mode was not already enabled,
> + * enables it and calls arch_enter_lazy_mmu_mode().
> + *
> + * Must be paired with a call to lazy_mmu_mode_disable().
> + *
> + * Has no effect if called:
> + * - While paused - see lazy_mmu_mode_pause()
> + * - In interrupt context
> + */
>  static inline void lazy_mmu_mode_enable(void)
>  {
> -	if (in_interrupt())
> +	struct lazy_mmu_state *state = &current->lazy_mmu_state;
> +
> +	if (in_interrupt() || state->pause_count > 0)
>  		return;
>  
> -	arch_enter_lazy_mmu_mode();
> +	VM_WARN_ON_ONCE(state->enable_count == U8_MAX);
> +
> +	if (state->enable_count++ == 0)
> +		arch_enter_lazy_mmu_mode();

When lazy_mmu_mode_enable() gets called for the first time with state->enable_count as 0,
then arch_enter_lazy_mmu_mode() will not get called ? Bit confused.

>  }
>  
> +/**
> + * lazy_mmu_mode_disable() - Disable the lazy MMU mode.
> + *
> + * Exits the current lazy MMU mode section. If it is the outermost section,
> + * disables the mode and calls arch_leave_lazy_mmu_mode(). Otherwise (nested
> + * section), calls arch_flush_lazy_mmu_mode().
> + *
> + * Must match a call to lazy_mmu_mode_enable().
> + *
> + * Has no effect if called:
> + * - While paused - see lazy_mmu_mode_pause()
> + * - In interrupt context
> + */
>  static inline void lazy_mmu_mode_disable(void)
>  {
> -	if (in_interrupt())
> +	struct lazy_mmu_state *state = &current->lazy_mmu_state;
> +
> +	if (in_interrupt() || state->pause_count > 0)
>  		return;
>  
> -	arch_leave_lazy_mmu_mode();
> +	VM_WARN_ON_ONCE(state->enable_count == 0);
> +
> +	if (--state->enable_count == 0)
> +		arch_leave_lazy_mmu_mode();
> +	else /* Exiting a nested section */
> +		arch_flush_lazy_mmu_mode();
> +
>  }
>  
> +/**
> + * lazy_mmu_mode_pause() - Pause the lazy MMU mode.
> + *
> + * Pauses the lazy MMU mode; if it is currently active, disables it and calls
> + * arch_leave_lazy_mmu_mode().
> + *
> + * Must be paired with a call to lazy_mmu_mode_resume(). Calls to the
> + * lazy_mmu_mode_* API have no effect until the matching resume() call.
> + *
> + * Has no effect if called:
> + * - While paused (inside another pause()/resume() pair)
> + * - In interrupt context
> + */
>  static inline void lazy_mmu_mode_pause(void)
>  {
> +	struct lazy_mmu_state *state = &current->lazy_mmu_state;
> +
>  	if (in_interrupt())
>  		return;
>  
> -	arch_leave_lazy_mmu_mode();
> +	VM_WARN_ON_ONCE(state->pause_count == U8_MAX);
> +
> +	if (state->pause_count++ == 0 && state->enable_count > 0)
> +		arch_leave_lazy_mmu_mode();
>  }
>  
> +/**
> + * lazy_mmu_mode_pause() - Resume the lazy MMU mode.
> + *
> + * Resumes the lazy MMU mode; if it was active at the point where the matching
> + * call to lazy_mmu_mode_pause() was made, re-enables it and calls
> + * arch_enter_lazy_mmu_mode().
> + *
> + * Must match a call to lazy_mmu_mode_pause().
> + *
> + * Has no effect if called:
> + * - While paused (inside another pause()/resume() pair)
> + * - In interrupt context
> + */
>  static inline void lazy_mmu_mode_resume(void)
>  {
> +	struct lazy_mmu_state *state = &current->lazy_mmu_state;
> +
>  	if (in_interrupt())
>  		return;
>  
> -	arch_enter_lazy_mmu_mode();
> +	VM_WARN_ON_ONCE(state->pause_count == 0);
> +
> +	if (--state->pause_count == 0 && state->enable_count > 0)
> +		arch_enter_lazy_mmu_mode();
>  }

Should not state->pause/enable_count tests and increment/decrement be handled
inside include/linux/sched via helpers like in_lazy_mmu_mode() ? This is will
ensure cleaner abstraction with respect to task_struct.

>  #else
>  static inline void lazy_mmu_mode_enable(void) {}
> diff --git a/include/linux/sched.h b/include/linux/sched.h
> index b469878de25c..847e242376db 100644
> --- a/include/linux/sched.h
> +++ b/include/linux/sched.h
> @@ -1441,6 +1441,10 @@ struct task_struct {
>  
>  	struct page_frag		task_frag;
>  
> +#ifdef CONFIG_ARCH_HAS_LAZY_MMU_MODE
> +	struct lazy_mmu_state		lazy_mmu_state;
> +#endif
> +
>  #ifdef CONFIG_TASK_DELAY_ACCT
>  	struct task_delay_info		*delays;
>  #endif
> @@ -1724,6 +1728,47 @@ static inline char task_state_to_char(struct task_struct *tsk)
>  	return task_index_to_char(task_state_index(tsk));
>  }
>  
> +#ifdef CONFIG_ARCH_HAS_LAZY_MMU_MODE
> +/**
> + * __task_lazy_mmu_mode_active() - Test the lazy MMU mode state for a task.
> + * @tsk: The task to check.
> + *
> + * Test whether @tsk has its lazy MMU mode state set to active (i.e. enabled
> + * and not paused).
> + *
> + * This function only considers the state saved in task_struct; to test whether
> + * current actually is in lazy MMU mode, in_lazy_mmu_mode() should be used
> + * instead.
> + *
> + * This function is intended for architectures that implement the lazy MMU
> + * mode; it must not be called from generic code.
> + */
> +static inline bool __task_lazy_mmu_mode_active(struct task_struct *tsk)
> +{
> +	struct lazy_mmu_state *state = &tsk->lazy_mmu_state;
> +
> +	return state->enable_count > 0 && state->pause_count == 0;
> +}
> +
> +/**
> + * in_lazy_mmu_mode() - Test whether we are currently in lazy MMU mode.
> + *
> + * Test whether the current context is in lazy MMU mode. This is true if both:
> + * 1. We are not in interrupt context
> + * 2. Lazy MMU mode is active for the current task
> + *
> + * This function is intended for architectures that implement the lazy MMU
> + * mode; it must not be called from generic code.
> + */
> +static inline bool in_lazy_mmu_mode(void)
> +{
> +	if (in_interrupt())
> +		return false;
> +
> +	return __task_lazy_mmu_mode_active(current);
> +}
> +#endif
> +
>  extern struct pid *cad_pid;
>  
>  /*


