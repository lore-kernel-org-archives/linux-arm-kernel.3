Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39478D66B85
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 19:45:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hjGwRrRHeV9FhtskgH+muWu/+jggYeeNnurTJDnS9vg=; b=Ge5DZqqx7kZNBDTl1O51fgIE6r
	SkwdDwKqFtlNNIoLMlwcoGbB+bexSWAh9Nbb9Lhoc0eyUQyPjB70XfR8f+5bEaR7ZEzAOXTipKLuP
	TxaU20rmhT7+vnJYawMHAXYhK2iWXXuT4oUlqFKATtVab3M5bp4iPs5q4hFOh0rUIchNlJhYOKAON
	NCqmfhf4VKvbg6JgoVqp1EI84U7L3bozbxw6ZSLbYCCoZkem0j819hispamOxIh5RkLCEDaZkYvOg
	TiBP4rLl47arVmcU2R2iZHnKgXydk3VRIw+pm0qXjgj+e50R4K5EkmfBkKJ1kf+fgbq78b9N1t2PI
	dflcSfsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVxSt-00000007Klq-094M;
	Wed, 17 Dec 2025 19:45:39 +0000
Received: from out-188.mta0.migadu.com ([2001:41d0:1004:224b::bc])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVxSo-00000007KlC-3FrL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Dec 2025 19:45:37 +0000
Message-ID: <26a8d10a-eede-4ebc-b51a-5c08ea02dda5@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1766000723;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hjGwRrRHeV9FhtskgH+muWu/+jggYeeNnurTJDnS9vg=;
	b=qUG314PwFgg2RdQNIFrCrdHqgfehWDIyEoqPBZ84evg+L/OJiFbWYwFwhXEOPtv40iv40j
	rscC47bEdPu78Yi6I8Mvvpx+pxe/Q+Xg4pSaTBWplNAmgnf+ZB/ZgfWjWn2UA63TvQUHXk
	oYX2AX4Xso4Wx/WXzA77PL1pL+GNrrM=
Date: Wed, 17 Dec 2025 11:45:14 -0800
MIME-Version: 1.0
Subject: Re: [PATCH bpf-next 2/2] bpf: arm64: Optimize recursion detection by
 not using atomics
Content-Language: en-GB
To: Puranjay Mohan <puranjay@kernel.org>
Cc: bot+bpf-ci@kernel.org, bpf@vger.kernel.org, ast@kernel.org,
 andrii@kernel.org, daniel@iogearbox.net, martin.lau@kernel.org,
 eddyz87@gmail.com, memxor@gmail.com, kernel-team@meta.com,
 catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com,
 linux-arm-kernel@lists.infradead.org, clm@meta.com, ihor.solodrai@linux.dev
References: <20251217162830.2597286-3-puranjay@kernel.org>
 <f144fd46b602b74fc4c1c2664082fbe893e7ec9c274fcc5fdf13d65151749e9c@mail.kernel.org>
 <51466fd3-c837-46a6-af50-28a8336fd8cd@linux.dev>
 <CANk7y0irgYcHLH_e9ozjX3wTeDb3GH-PA+6UiLRSBFzpYs8eVQ@mail.gmail.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yonghong Song <yonghong.song@linux.dev>
In-Reply-To: <CANk7y0irgYcHLH_e9ozjX3wTeDb3GH-PA+6UiLRSBFzpYs8eVQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_114536_387288_8ED10F52 
X-CRM114-Status: GOOD (  15.91  )
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



On 12/17/25 10:44 AM, Puranjay Mohan wrote:
> On Wed, Dec 17, 2025 at 6:24 PM Yonghong Song <yonghong.song@linux.dev> wrote:
>>
>>
>> On 12/17/25 8:56 AM, bot+bpf-ci@kernel.org wrote:
>>>> diff --git a/include/linux/bpf.h b/include/linux/bpf.h
>>>> index 2da986136d26..654fb94bf60c 100644
>>>> --- a/include/linux/bpf.h
>>>> +++ b/include/linux/bpf.h
>>> [ ... ]
>>>
>>>> @@ -2006,12 +2009,32 @@ struct bpf_struct_ops_common_value {
>>>>
>>>>    static inline bool bpf_prog_get_recursion_context(struct bpf_prog *prog)
>>>>    {
>>>> +#ifdef CONFIG_ARM64
>>>> +    u8 rctx = interrupt_context_level();
>>>> +    u8 *active = this_cpu_ptr(prog->active);
>>>> +
>>>> +    active[rctx]++;
>>>> +    barrier();
>>>> +    if (get_unaligned_le32(active) != BIT(rctx * 8))
>>>> +            return false;
>>>> +
>>>> +    return true;
>>>> +#else
>>>>       return this_cpu_inc_return(*(prog->active)) == 1;
>>>> +#endif
>>>>    }
>>> Can preemption between the increment and check cause a counter leak on
>>> CONFIG_PREEMPT_RCU systems? The trampoline calls this function under
>>> rcu_read_lock_dont_migrate() which allows preemption on PREEMPT_RCU
>>> (documented at include/linux/rcupdate.h:856).
>>>
>>> Consider this scenario on an ARM64 system with PREEMPT_RCU:
>>>
>>> 1. Thread A increments active[0] to 1
>>> 2. Preemption occurs before Thread A reaches the check
>>> 3. Thread B on same CPU increments active[0] to 2
>>> 4. Thread B checks: sees 2 != BIT(0), returns false
>>> 5. Thread A resumes, checks: sees 2 != BIT(0), returns false
>>> 6. Both threads return false, neither runs BPF
>>> 7. Neither calls bpf_prog_put_recursion_context() (see
>>>      __bpf_prog_enter_recur() at kernel/bpf/trampoline.c:952)
>>> 8. Counter permanently stuck at 2, all future BPF on this CPU fails
>>>
>>> The old atomic code handled this correctly because this_cpu_inc_return()
>>> completes atomically, ensuring Thread A reads the value 1 before Thread B
>>> can interfere. With non-atomic operations, Thread A increments but hasn't
>>> read the value yet, allowing Thread B to interfere and cause both threads
>>> to see the modified value.
>>>
>>> Is there a guarantee that same-context preemption cannot occur in the BPF
>>> execution path on ARM64, or does this need additional synchronization?
>> AI is correct here. See below for another thread:
>>     https://lore.kernel.org/bpf/20251217093326.1745307-1-chen.dylane@linux.dev/T/#m906fd4502fbbedd4609c586122a393363003312a
>> where preempt_disable is necessary to prevent the above scenario.
> See my other reply, the above scenario presented by AI is wrong
> because step 7 is wrong.

Thanks for explanation. I missed the case that bpf_trampoline_exit()
is always executed. In such cases, the active[rctx] counter will be
always corrected.

>
>> But adding preempt_disable may impact the overall system-level performance.
>>
>> Does this patch can improve performance for *all* ARM64 cpu versions?
>> Do you have numbers to show how much performance improvement?
> This should improve performance on all arm64 CPUs because atomics are
> expensive because they are atomic across all cpus.

Good to know. Thanks!

>
> I see a 33% improvement in the fentry trigger benchmark, but I can do
> more benchmarking.
>
>>>> @@ -2006,12 +2009,32 @@ struct bpf_struct_ops_common_value {
>>>>
>>>>    static inline void bpf_prog_put_recursion_context(struct bpf_prog *prog)
>>>>    {
>>>> +#ifdef CONFIG_ARM64
>>>> +    u8 rctx = interrupt_context_level();
>>>> +    u8 *active = this_cpu_ptr(prog->active);
>>>> +
>>>> +    barrier();
>>>> +    active[rctx]--;
>>>> +#else
>>>>       this_cpu_dec(*(prog->active));
>>>> +#endif
>>>>    }
>> [...]


