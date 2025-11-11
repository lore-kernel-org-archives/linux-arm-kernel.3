Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5461ECCFA18
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 17:03:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aua8l6YRNgQP+NPu3nML7Xo2TxY8EffMn9iRDXN1Nuw=; b=x4jzgsJCQJ3feoBYQdDdpwigeI
	rYgPFi3Kc5zO+hJnZkLpVnp3mr4oRCajgbqHHuDU5pn+ef6Ea0V3wiCkN2b3wnoS29k3Io0YoCiJM
	45MT/Z94iWlwT8tHAoSVpBmqdocH9hR0fHVfRzADvCOdM4ur+4J2cONDatWZIic8Xt4ufpGUUvs2o
	nJKO9eSIyHzyikngha+QWQp4+Cb6+8nFCbxtLn2/Asw1272Vx2IwuD26UXlIBBMJ6imWKCRjYcdkc
	3LZnSXaHLbMzjEIMPy/+L1oA/WbyzJrpt5rWh1Lj05JmVfJISnR4FDoAJSTQxMtLvGIfOlyZ0vcd4
	9GUEx9lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIrm7-00000007VlT-0iF4;
	Tue, 11 Nov 2025 17:03:23 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIrm6-00000007Vl6-03bI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Nov 2025 17:03:22 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 32480497;
	Tue, 11 Nov 2025 09:03:13 -0800 (PST)
Received: from [10.1.31.216] (XHFQ2J9959.cambridge.arm.com [10.1.31.216])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 106E43F5A1;
	Tue, 11 Nov 2025 09:03:15 -0800 (PST)
Message-ID: <8f70692c-25a9-4bd0-94ab-43ab435e4b1b@arm.com>
Date: Tue, 11 Nov 2025 17:03:14 +0000
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
 <824bf705-e9d6-4eeb-9532-9059fa56427f@arm.com>
 <58fd1a6e-f2c4-421c-9b95-dea4b244a515@arm.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <58fd1a6e-f2c4-421c-9b95-dea4b244a515@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_090322_129161_ADDE9DE7 
X-CRM114-Status: GOOD (  40.04  )
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

On 11/11/2025 15:56, Kevin Brodsky wrote:
> On 11/11/2025 10:24, Ryan Roberts wrote:
>> [...]
>>
>>>>> +		state->active = true;
>>>>> +		arch_enter_lazy_mmu_mode();
>>>>> +	}
>>>>>  }
>>>>>  
>>>>>  static inline void lazy_mmu_mode_disable(void)
>>>>>  {
>>>>> -	arch_leave_lazy_mmu_mode();
>>>>> +	struct lazy_mmu_state *state = &current->lazy_mmu_state;
>>>>> +
>>>>> +	VM_WARN_ON_ONCE(state->nesting_level == 0);
>>>>> +	VM_WARN_ON(!state->active);
>>>>> +
>>>>> +	if (--state->nesting_level == 0) {
>>>>> +		state->active = false;
>>>>> +		arch_leave_lazy_mmu_mode();
>>>>> +	} else {
>>>>> +		/* Exiting a nested section */
>>>>> +		arch_flush_lazy_mmu_mode();
>>>>> +	}
>>>>>  }
>>>>>  
>>>>>  static inline void lazy_mmu_mode_pause(void)
>>>>>  {
>>>>> +	struct lazy_mmu_state *state = &current->lazy_mmu_state;
>>>>> +
>>>>> +	VM_WARN_ON(state->nesting_level == 0 || !state->active);
>>>> nit: do you need the first condition? I think when nesting_level==0, we expect
>>>> to be !active?
>>> I suppose this should never happen indeed - I was just being extra
>>> defensive.
>>>
>>> Either way David suggested allowing pause()/resume() to be called
>>> outside of any section so the next version will bail out on
>>> nesting_level == 0.
>> Ignoring my current opinion that we don't need pause/resume at all for now; Are
>> you suggesting that pause/resume will be completely independent of
>> enable/disable? I think that would be best. So enable/disable increment and
>> decrement the nesting_level counter regardless of whether we are paused.
>> nesting_level 0 => 1 enables if not paused. nesting_level 1 => 0 disables if not
>> paused. pause disables nesting_level >= 1, resume enables if nesting_level >= 1.
> 
> This is something else. Currently the rules are:
> 
> [A]
> 
> // pausing forbidden
> enable()
>     pause()
>     // pausing/enabling forbidden
>     resume()
> disable()
> 
> David suggested allowing:
> 
> [B]
> 
> pause()
> // pausing/enabling forbidden
> resume()
> 
> Your suggestion is also allowing:
> 
> [C]
> 
> pause()
>     // pausing forbidden
>     enable()
>     disable()
> resume()

I think the current kasan kasan_depopulate_vmalloc_pte() path will require [C]
if CONFIG_DEBUG_PAGEALLOC is enabled on arm64. It calls __free_page() while
paused. I guess CONFIG_DEBUG_PAGEALLOC will cause __free_page() ->
debug_pagealloc_unmap_pages() ->->-> update_range_prot() -> lazy_mmu_enable().

Arguably you could move the resume() to before the __free_page(). But it just
illustrates that it's all a bit brittle at the moment...

> 
>> Perhaps we also need nested pause/resume? Then you just end up with 2 counters;
>> enable_count and pause_count. Sorry if this has already been discussed.
> 
> And finally:
> 
> [D]
> 
> pause()
>     pause()
>         enable()
>         disable()
>     resume()
> resume()
> 
> I don't really mind either way, but I don't see an immediate use for [C]
> and [D] - the idea is that the paused section is short and controlled,
> not made up of arbitrary calls. 

If my thinking above is correct, then I've already demonstrated that this is not
the case. So I'd be inclined to go with [D] on the basis that it is the most robust.

Keeping 2 nesting counts (enable and pause) feels pretty elegant to me and gives
the fewest opportunities for surprises.

Thanks,
Ryan

> A potential downside of allowing [C] and
> [D] is that it makes it harder to detect unintended nesting (fewer
> VM_WARN assertions). Happy to implement it if this proves useful though.
> 
> OTOH the idea behind [B] is that it allows the caller of
> pause()/resume() not to care about whether lazy MMU is actually enabled
> or not - i.e. the kasan helpers would keep working even if
> apply_to_page_range() didn't use lazy MMU any more.
> 
>>>>> +
>>>>> +	state->active = false;
>>>>>  	arch_leave_lazy_mmu_mode();
>>>>>  }
>>>>>  
>>>>>  static inline void lazy_mmu_mode_resume(void)
>>>>>  {
>>>>> +	struct lazy_mmu_state *state = &current->lazy_mmu_state;
>>>>> +
>>>>> +	VM_WARN_ON(state->nesting_level == 0 || state->active);
>>>> Similar argument?
>>>>
>>>>> +
>>>>> +	state->active = true;
>>>>>  	arch_enter_lazy_mmu_mode();
>>>>>  }
>>>>>  #else
>>>>> diff --git a/include/linux/sched.h b/include/linux/sched.h
>>>>> index cbb7340c5866..11566d973f42 100644
>>>>> --- a/include/linux/sched.h
>>>>> +++ b/include/linux/sched.h
>>>>> @@ -1441,6 +1441,10 @@ struct task_struct {
>>>>>  
>>>>>  	struct page_frag		task_frag;
>>>>>  
>>>>> +#ifdef CONFIG_ARCH_HAS_LAZY_MMU_MODE
>>>>> +	struct lazy_mmu_state		lazy_mmu_state;
>>>>> +#endif
>>>>> +
>>>>>  #ifdef CONFIG_TASK_DELAY_ACCT
>>>>>  	struct task_delay_info		*delays;
>>>>>  #endif
>>>>> @@ -1724,6 +1728,18 @@ static inline char task_state_to_char(struct task_struct *tsk)
>>>>>  	return task_index_to_char(task_state_index(tsk));
>>>>>  }
>>>>>  
>>>>> +#ifdef CONFIG_ARCH_HAS_LAZY_MMU_MODE
>>>>> +static inline bool in_lazy_mmu_mode(void)
>>>>> +{
>>>>> +	return current->lazy_mmu_state.active;
>>>>> +}
>>>>> +#else
>>>>> +static inline bool in_lazy_mmu_mode(void)
>>>>> +{
>>>>> +	return false;
>>>> Just pointing out that this isn't really a correct implementation:
>>>>
>>>> lazy_mmu_mode_enable()
>>>> ASSERT(in_lazy_mmu_mode()) << triggers for arches without lazy mmu
>>>> lazy_mmu_mode_disable()
>>>>
>>>> Although it probably doesn't matter in practice?
>>> I'd say that the expectation is invalid - lazy MMU mode can only be
>>> enabled if the architecture supports it. In fact as you pointed out
>>> above the API may be called in interrupt context but it will have no
>>> effect, so this sequence would always fail in interrupt context.
>> Yep, but previously there was no way to query the current state so it didn't
>> matter. Now you have a query API so it might matter if/when people come along
>> and use it in unexpected ways.
> 
> I suppose the best we can do is document it alongside those helpers
> (David has already suggested some documentation, see patch 11).
> 
>>> Worth nothing that in_lazy_mmu_mode() is only ever called from arch code
>>> where lazy MMU is implemented. I added the fallback as a matter of
>>> principle, but it isn't actually required.
>> Yes, I agree that's the intent. I'm just wondering if it's possible to enforce
>> that only arch code uses this. Perhaps add some docs to explain that it's only
>> intended for arches that implement lazy_mmu, and don't define it for arches that
>> don't, which would catch any generic users?
> 
> Yep sounds like the best option - a lot less risk of misuse if it can't
> be called from generic code :) The build would still succeed on arch's
> that implement it, but the kernel CI should catch such calls sooner or
> later.
> 
> - Kevin


