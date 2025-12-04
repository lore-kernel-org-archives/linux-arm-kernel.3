Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEBBDD1F9C5
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Dec 2025 11:52:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/D90w5HbPCz2bt7xnv+mJ1PnVxBYxNP9wTE7H670eFI=; b=TPWINY4udQHdhUFZHgFPgf9BhE
	2IETkFxLIEvuuk4MW6e+RDeFozapLk6yrl7eXVaACkK/8yPwNTNgh6svJCzrGkBleDZQ7vCdb/u/4
	vh3z9nWhAabi3QGJyBluLUX2lk3v0zy3O6ug8dG6C4XdMHP3iWan6SjUM2NYPm7ueVTJnJkRwDdTG
	MR+pT2PhhtDGrXG04j/fSZ+HbYhelSb6pCIXNcaZWvb6Oc1dGnZMQ9ecr1WruHUkaDv6DwpdDqmyq
	HQRCrnwTbKMnxiw+nD1+2Gn8r09ZxvraX8fbuqLbPbpZ8cDeRTnakPWE7yVuv+iZHS2KzxVTfR+EA
	0A9jgmFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR7tB-00000007wH4-3CpH;
	Thu, 04 Dec 2025 11:52:49 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR7t8-00000007wGb-3J8W
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Dec 2025 11:52:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BE65D404ED;
	Thu,  4 Dec 2025 11:52:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68460C4CEFB;
	Thu,  4 Dec 2025 11:52:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764849165;
	bh=u1Zp6G/Tnzzf/H5X3ENLn84JA+wr9i7r3UFkx+PY1cA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ISfT7eeAMaUkykWFftAF34p60f1XrKRSCDcOgF5EQ7sjgQQQ6kR+ZfcxZf3nREGvz
	 3ImEd584csKzW2sprI2y59/eBKWA2YlWw7s0K9vR4XEpOPMmlPP8wvttqFfXSE4zN6
	 oekU1nlMo+H/Bg6n4zYp/bTOGvrxv/gOpiDiNlxCA9Y4OE+4DDcmSt+S8/kIsT/ev5
	 Uux8ESGp7F4HLNoZUmXHGJYu5mcFtULBpaUzDu9+oyUtKeFcenBNNa96Vy0OfGm27t
	 Z0EcKxK9WF0aNa8nPuC5BwJT+8bBhjdQ74Oz3kptWtnS35Y+COG+101Ok84TWX356P
	 FasrAKF5f+8MA==
Message-ID: <93d04ef8-0364-4013-8839-ba599d930cb2@kernel.org>
Date: Thu, 4 Dec 2025 12:52:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 08/12] mm: enable lazy_mmu sections to nest
To: Anshuman Khandual <anshuman.khandual@arm.com>,
 Kevin Brodsky <kevin.brodsky@arm.com>, linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>,
 Andreas Larsson <andreas@gaisler.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Borislav Petkov
 <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 "David S. Miller" <davem@davemloft.net>,
 David Woodhouse <dwmw2@infradead.org>, "H. Peter Anvin" <hpa@zytor.com>,
 Ingo Molnar <mingo@redhat.com>, Jann Horn <jannh@google.com>,
 Juergen Gross <jgross@suse.com>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
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
 <2dfd54d7-fe2a-4921-85ff-a581392a777a@arm.com>
From: "David Hildenbrand (Red Hat)" <david@kernel.org>
Content-Language: en-US
In-Reply-To: <2dfd54d7-fe2a-4921-85ff-a581392a777a@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251204_035246_873023_F56031F0 
X-CRM114-Status: GOOD (  28.94  )
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

Some comments from my side:


>>   static inline void arch_enter_lazy_mmu_mode(void)
>>   {
>> -	/*
>> -	 * lazy_mmu_mode is not supposed to permit nesting. But in practice this
>> -	 * does happen with CONFIG_DEBUG_PAGEALLOC, where a page allocation
>> -	 * inside a lazy_mmu_mode section (such as zap_pte_range()) will change
>> -	 * permissions on the linear map with apply_to_page_range(), which
>> -	 * re-enters lazy_mmu_mode. So we tolerate nesting in our
>> -	 * implementation. The first call to arch_leave_lazy_mmu_mode() will
>> -	 * flush and clear the flag such that the remainder of the work in the
>> -	 * outer nest behaves as if outside of lazy mmu mode. This is safe and
>> -	 * keeps tracking simple.
>> -	 */
>> -
>>   	set_thread_flag(TIF_LAZY_MMU);>  }
> 
> Should not platform specific changes be deferred to subsequent patches until
> nesting is completely enabled in generic first ? Although no problem as such
> but would be bit cleaner.

This could indeed be done in a separate patch. But I also don't see a 
problem with updating the doc in this patch.

> 
>>   
>> diff --git a/include/linux/mm_types_task.h b/include/linux/mm_types_task.h
>> index a82aa80c0ba4..11bf319d78ec 100644
>> --- a/include/linux/mm_types_task.h
>> +++ b/include/linux/mm_types_task.h
>> @@ -88,4 +88,9 @@ struct tlbflush_unmap_batch {
>>   #endif
>>   };
>>   
>> +struct lazy_mmu_state {
>> +	u8 enable_count;
>> +	u8 pause_count;
>> +};
>> +
> 
> Should not this be wrapped with CONFIG_ARCH_HAS_LAZY_MMU_MODE as the task_struct
> element 'lazy_mmu_state' is only available with the feature.

No strong opinion; the compiler will ignore it either way. And less 
ifdef is good, right? :)

... and there is nothing magical in there that would result in other 
dependencies.

> Besides, is a depth
> of 256 really expected here ? 4 bits for each element would not be sufficient for
> a depth of 16 ?


We could indeed use something like

struct lazy_mmu_state {
	u8 enable_count : 4;
	u8 pause_count : 4;
};

but then, the individual operations on enable_count/pause_count need 
more instructions.

Further, as discussed, this 1 additional byte barely matters given the 
existing size of the task struct.

No strong opinion.

> 
>>    */
>>   #ifdef CONFIG_ARCH_HAS_LAZY_MMU_MODE
>> +/**
>> + * lazy_mmu_mode_enable() - Enable the lazy MMU mode.
>> + *
>> + * Enters a new lazy MMU mode section; if the mode was not already enabled,
>> + * enables it and calls arch_enter_lazy_mmu_mode().
>> + *
>> + * Must be paired with a call to lazy_mmu_mode_disable().
>> + *
>> + * Has no effect if called:
>> + * - While paused - see lazy_mmu_mode_pause()
>> + * - In interrupt context
>> + */
>>   static inline void lazy_mmu_mode_enable(void)
>>   {
>> -	if (in_interrupt())
>> +	struct lazy_mmu_state *state = &current->lazy_mmu_state;
>> +
>> +	if (in_interrupt() || state->pause_count > 0)
>>   		return;
>>   
>> -	arch_enter_lazy_mmu_mode();
>> +	VM_WARN_ON_ONCE(state->enable_count == U8_MAX);
>> +
>> +	if (state->enable_count++ == 0)
>> +		arch_enter_lazy_mmu_mode();
> 
> When lazy_mmu_mode_enable() gets called for the first time with state->enable_count as 0,
> then arch_enter_lazy_mmu_mode() will not get called ? Bit confused.


state->enable_count++ returns the old value (0). Are you thinking of
++state->enable_count?

But maybe I misudnerstood your concern.

[...]

>> +/**
>> + * lazy_mmu_mode_pause() - Resume the lazy MMU mode.
>> + *
>> + * Resumes the lazy MMU mode; if it was active at the point where the matching
>> + * call to lazy_mmu_mode_pause() was made, re-enables it and calls
>> + * arch_enter_lazy_mmu_mode().
>> + *
>> + * Must match a call to lazy_mmu_mode_pause().
>> + *
>> + * Has no effect if called:
>> + * - While paused (inside another pause()/resume() pair)
>> + * - In interrupt context
>> + */
>>   static inline void lazy_mmu_mode_resume(void)
>>   {
>> +	struct lazy_mmu_state *state = &current->lazy_mmu_state;
>> +
>>   	if (in_interrupt())
>>   		return;
>>   
>> -	arch_enter_lazy_mmu_mode();
>> +	VM_WARN_ON_ONCE(state->pause_count == 0);
>> +
>> +	if (--state->pause_count == 0 && state->enable_count > 0)
>> +		arch_enter_lazy_mmu_mode();
>>   }
> 
> Should not state->pause/enable_count tests and increment/decrement be handled
> inside include/linux/sched via helpers like in_lazy_mmu_mode() ? This is will
> ensure cleaner abstraction with respect to task_struct.

I don't think this is required given that this code here implements
CONFIG_ARCH_HAS_LAZY_MMU_MODE support.

-- 
Cheers

David

