Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80353CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 10:24:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EyZ9A6ELR3XS9oS2QjtnwMtKbpyye6SoKGCZKPFbRtg=; b=MYITzuLfcPvj0WuBYoQ7KxbFEb
	mA0w1zkSaPws5PtK0mIanoWshoX0YTX/G5x8RTaXGi0JHTfb4pTOLIoIdyTY2VQdHKOetooeuIfy/
	9hDKC0KrE4w8moa2+Wx1DRcHNlDWN9gEKWYJ97KT55NkWKJ0k0EB5/jsBZuI93NX5B3I04tKuvMud
	DfEpiwF1aXBP8J1/CrgY8BznnQXlTf5NIirAmgx8u8Mj5C+jkvSJI6SySyr19a0KpHH7EAXDWC0hf
	RoIvLGt1IzWVE9qjFarM4+BEl61+KbdOtoxvrvBnx4EeTyWeUxCV1FgoDNIt+YypUuWJ5HgsF+mz+
	L3J1Q0pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIlY2-00000006wdl-48DX;
	Tue, 11 Nov 2025 10:24:26 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIlXz-00000006wdN-41KJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Nov 2025 10:24:25 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EEC872F;
	Tue, 11 Nov 2025 02:24:13 -0800 (PST)
Received: from [10.57.88.30] (unknown [10.57.88.30])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 11C6E3F63F;
	Tue, 11 Nov 2025 02:24:15 -0800 (PST)
Message-ID: <824bf705-e9d6-4eeb-9532-9059fa56427f@arm.com>
Date: Tue, 11 Nov 2025 10:24:14 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 07/12] mm: enable lazy_mmu sections to nest
Content-Language: en-GB
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
 Peter Zijlstra <peterz@infradead.org>, Suren Baghdasaryan
 <surenb@google.com>, Thomas Gleixner <tglx@linutronix.de>,
 Vlastimil Babka <vbabka@suse.cz>, Will Deacon <will@kernel.org>,
 Yeoreum Yun <yeoreum.yun@arm.com>, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org,
 xen-devel@lists.xenproject.org, x86@kernel.org
References: <20251029100909.3381140-1-kevin.brodsky@arm.com>
 <20251029100909.3381140-8-kevin.brodsky@arm.com>
 <999feffa-5d1d-42e3-bd3a-d949f2a9de9d@arm.com>
 <cc9dc398-b9c5-4bb8-94ad-7e7f3ddd5b4f@arm.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <cc9dc398-b9c5-4bb8-94ad-7e7f3ddd5b4f@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_022424_113287_2AD5D3C8 
X-CRM114-Status: GOOD (  44.28  )
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

On 10/11/2025 10:47, Kevin Brodsky wrote:
> On 07/11/2025 14:59, Ryan Roberts wrote:
>> On 29/10/2025 10:09, Kevin Brodsky wrote:
>>> [...]
>>>
>>> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
>>> index b5fdf32c437f..e6064e00b22d 100644
>>> --- a/include/linux/pgtable.h
>>> +++ b/include/linux/pgtable.h
>>> @@ -228,27 +228,86 @@ static inline int pmd_dirty(pmd_t pmd)
>>>   * of the lazy mode. So the implementation must assume preemption may be enabled
>>>   * and cpu migration is possible; it must take steps to be robust against this.
>>>   * (In practice, for user PTE updates, the appropriate page table lock(s) are
>>> - * held, but for kernel PTE updates, no lock is held). Nesting is not permitted
>>> - * and the mode cannot be used in interrupt context.
>>> + * held, but for kernel PTE updates, no lock is held). The mode cannot be used
>>> + * in interrupt context.
>> "The mode cannot be used in interrupt context"; except it is for arm64. KFENCE
>> and/or DEBUG_PAGEALLOC will request the arch to change linear map permissions,
>> which will enter lazy mmu (now using the new generic API). This can happen in
>> softirq context.
> 
> Are you happy with the wording update in patch 12?

Yes!

> 
>>> + *
>>> + * The lazy MMU mode is enabled for a given block of code using:
>>> + *
>>> + *   lazy_mmu_mode_enable();
>>> + *   <code>
>>> + *   lazy_mmu_mode_disable();
>>> + *
>>> + * Nesting is permitted: <code> may itself use an enable()/disable() pair.
>>> + * A nested call to enable() has no functional effect; however disable() causes
>>> + * any batched architectural state to be flushed regardless of nesting. After a
>>> + * call to disable(), the caller can therefore rely on all previous page table
>>> + * modifications to have taken effect, but the lazy MMU mode may still be
>>> + * enabled.
>>> + *
>>> + * In certain cases, it may be desirable to temporarily pause the lazy MMU mode.
>>> + * This can be done using:
>>> + *
>>> + *   lazy_mmu_mode_pause();
>>> + *   <code>
>>> + *   lazy_mmu_mode_resume();
>>> + *
>>> + * This sequence must only be used if the lazy MMU mode is already enabled.
>>> + * pause() ensures that the mode is exited regardless of the nesting level;
>>> + * resume() re-enters the mode at the same nesting level. <code> must not modify
>>> + * the lazy MMU state (i.e. it must not call any of the lazy_mmu_mode_*
>>> + * helpers).
>>> + *
>>> + * in_lazy_mmu_mode() can be used to check whether the lazy MMU mode is
>>> + * currently enabled.
>>>   */
>> Nice documentation!
> 
> Thanks!
> 
>>>  #ifdef CONFIG_ARCH_HAS_LAZY_MMU_MODE
>>>  static inline void lazy_mmu_mode_enable(void)
>>>  {
>>> -	arch_enter_lazy_mmu_mode();
>>> +	struct lazy_mmu_state *state = &current->lazy_mmu_state;
>>> +
>>> +	VM_WARN_ON_ONCE(state->nesting_level == U8_MAX);
>>> +	/* enable() must not be called while paused */
>>> +	VM_WARN_ON(state->nesting_level > 0 && !state->active);
>>> +
>>> +	if (state->nesting_level++ == 0) {
>> Hmm... for the arm64 case of calling this in an interrupt, Is it safe?
>>
>> If a task is calling this function and gets interrupted here, nesting_level==1
>> but active==false. The interrupt then calls this function and increments from 1
>> to 2 but arch_enter_lazy_mmu_mode() hasn't been called.
>>
>> More dangerously (I think), when the interrupt handler calls
>> lazy_mmu_mode_disable(), it will end up calling arch_flush_lazy_mmu_mode() which
>> could be an issue because as far as the arch is concerned, it's not in lazy mode.
>>
>> The current arm64 implementation works because setting and clearing the thread
>> flags is atomic.
>>
>> Perhaps you need to disable preemption around the if block?
> 
> As you found out this is addressed in patch 12, but indeed I hadn't
> realised that this patch leaves the generic API in an unsafe situation
> w.r.t. interrupts. We at least need to have in_interrupt() checks in the
> generic layer by the time we get to this patch.

Yeah that should solve it.

> 
>>> +		state->active = true;
>>> +		arch_enter_lazy_mmu_mode();
>>> +	}
>>>  }
>>>  
>>>  static inline void lazy_mmu_mode_disable(void)
>>>  {
>>> -	arch_leave_lazy_mmu_mode();
>>> +	struct lazy_mmu_state *state = &current->lazy_mmu_state;
>>> +
>>> +	VM_WARN_ON_ONCE(state->nesting_level == 0);
>>> +	VM_WARN_ON(!state->active);
>>> +
>>> +	if (--state->nesting_level == 0) {
>>> +		state->active = false;
>>> +		arch_leave_lazy_mmu_mode();
>>> +	} else {
>>> +		/* Exiting a nested section */
>>> +		arch_flush_lazy_mmu_mode();
>>> +	}
>>>  }
>>>  
>>>  static inline void lazy_mmu_mode_pause(void)
>>>  {
>>> +	struct lazy_mmu_state *state = &current->lazy_mmu_state;
>>> +
>>> +	VM_WARN_ON(state->nesting_level == 0 || !state->active);
>> nit: do you need the first condition? I think when nesting_level==0, we expect
>> to be !active?
> 
> I suppose this should never happen indeed - I was just being extra
> defensive.
> 
> Either way David suggested allowing pause()/resume() to be called
> outside of any section so the next version will bail out on
> nesting_level == 0.

Ignoring my current opinion that we don't need pause/resume at all for now; Are
you suggesting that pause/resume will be completely independent of
enable/disable? I think that would be best. So enable/disable increment and
decrement the nesting_level counter regardless of whether we are paused.
nesting_level 0 => 1 enables if not paused. nesting_level 1 => 0 disables if not
paused. pause disables nesting_level >= 1, resume enables if nesting_level >= 1.

Perhaps we also need nested pause/resume? Then you just end up with 2 counters;
enable_count and pause_count. Sorry if this has already been discussed.

> 
>>> +
>>> +	state->active = false;
>>>  	arch_leave_lazy_mmu_mode();
>>>  }
>>>  
>>>  static inline void lazy_mmu_mode_resume(void)
>>>  {
>>> +	struct lazy_mmu_state *state = &current->lazy_mmu_state;
>>> +
>>> +	VM_WARN_ON(state->nesting_level == 0 || state->active);
>> Similar argument?
>>
>>> +
>>> +	state->active = true;
>>>  	arch_enter_lazy_mmu_mode();
>>>  }
>>>  #else
>>> diff --git a/include/linux/sched.h b/include/linux/sched.h
>>> index cbb7340c5866..11566d973f42 100644
>>> --- a/include/linux/sched.h
>>> +++ b/include/linux/sched.h
>>> @@ -1441,6 +1441,10 @@ struct task_struct {
>>>  
>>>  	struct page_frag		task_frag;
>>>  
>>> +#ifdef CONFIG_ARCH_HAS_LAZY_MMU_MODE
>>> +	struct lazy_mmu_state		lazy_mmu_state;
>>> +#endif
>>> +
>>>  #ifdef CONFIG_TASK_DELAY_ACCT
>>>  	struct task_delay_info		*delays;
>>>  #endif
>>> @@ -1724,6 +1728,18 @@ static inline char task_state_to_char(struct task_struct *tsk)
>>>  	return task_index_to_char(task_state_index(tsk));
>>>  }
>>>  
>>> +#ifdef CONFIG_ARCH_HAS_LAZY_MMU_MODE
>>> +static inline bool in_lazy_mmu_mode(void)
>>> +{
>>> +	return current->lazy_mmu_state.active;
>>> +}
>>> +#else
>>> +static inline bool in_lazy_mmu_mode(void)
>>> +{
>>> +	return false;
>> Just pointing out that this isn't really a correct implementation:
>>
>> lazy_mmu_mode_enable()
>> ASSERT(in_lazy_mmu_mode()) << triggers for arches without lazy mmu
>> lazy_mmu_mode_disable()
>>
>> Although it probably doesn't matter in practice?
> 
> I'd say that the expectation is invalid - lazy MMU mode can only be
> enabled if the architecture supports it. In fact as you pointed out
> above the API may be called in interrupt context but it will have no
> effect, so this sequence would always fail in interrupt context.

Yep, but previously there was no way to query the current state so it didn't
matter. Now you have a query API so it might matter if/when people come along
and use it in unexpected ways.

> 
> Worth nothing that in_lazy_mmu_mode() is only ever called from arch code
> where lazy MMU is implemented. I added the fallback as a matter of
> principle, but it isn't actually required.

Yes, I agree that's the intent. I'm just wondering if it's possible to enforce
that only arch code uses this. Perhaps add some docs to explain that it's only
intended for arches that implement lazy_mmu, and don't define it for arches that
don't, which would catch any generic users?

Thanks,
Ryan

> 
> - Kevin


