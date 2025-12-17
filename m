Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73456D66B85
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 21:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jyX1RZ+o/haZg35Gq9/j5AZEuWi7cJRqp8TrWJlBWaM=; b=R4/nN23Uhhq/L9djy1FWmk3gTC
	aXRucTz5GduCw0WijGaXXspCoyIz2Ig0yIUTHhrQSh3nNGA+fAGUfErhHOZ5+4ar3PLL0qBoLj4fF
	F+dVHLg1sy7DU8T51tCU9czE5x5zlya37bqIC7cT4uMkO7z9KRF5vykOHupFbT4ZfzG9eotCs61bn
	22V5t07LffTnOZSLMqmnWUseb4/wVjkjyQAx9PPfT6Bs1co8AUhwf8gnD3At/88L2LO8N3K1pBX/8
	Ovh/csn5DDflcADa+W/7s7N+o2iKbCdaRbpwJZqGHaWYZGzPJalc62nzYLDgFaeN4vyhJrQxMdXkj
	6VpOrRlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVz82-00000007QwO-1xTy;
	Wed, 17 Dec 2025 21:32:14 +0000
Received: from out-181.mta1.migadu.com ([2001:41d0:203:375::b5])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVz7z-00000007Qvq-1bw4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Dec 2025 21:32:13 +0000
Message-ID: <a0c04178-2159-4475-9be8-93320ffc2138@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1766007126;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jyX1RZ+o/haZg35Gq9/j5AZEuWi7cJRqp8TrWJlBWaM=;
	b=G1suqQGWpfrCJRHWkzGLYjq3+TjPPDn+YRsPyBtnqtbdcBFKbwMIgBo46P1GtGGvYi87Vi
	ykMZgpAvygFKK8cSzRalkIndT3OkNwI/6mBLuM9aOLmER49ZaOxhxlDmLuIUslE/Ku0eNN
	fEeec7C+WtolCdbKImuDXDJVxpCvjG0=
Date: Wed, 17 Dec 2025 13:31:58 -0800
MIME-Version: 1.0
Subject: Re: [PATCH bpf-next 2/2] bpf: arm64: Optimize recursion detection by
 not using atomics
Content-Language: en-GB
To: Puranjay Mohan <puranjay12@gmail.com>,
 Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: bot+bpf-ci@kernel.org, bpf <bpf@vger.kernel.org>,
 Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Martin KaFai Lau <martin.lau@kernel.org>, Eduard <eddyz87@gmail.com>,
 Kumar Kartikeya Dwivedi <memxor@gmail.com>,
 Kernel Team <kernel-team@meta.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Chris Mason <clm@meta.com>, Ihor Solodrai <ihor.solodrai@linux.dev>
References: <20251217162830.2597286-3-puranjay@kernel.org>
 <f144fd46b602b74fc4c1c2664082fbe893e7ec9c274fcc5fdf13d65151749e9c@mail.kernel.org>
 <CANk7y0h4JO2-tp9HjRHjcQdTOgmRSsw0rxmK-=G89AVY92U8Jw@mail.gmail.com>
 <CAADnVQ+E6Tgcf1E5x-wk_TA+Lz83cA=SL8EZUGL70bQpywwexg@mail.gmail.com>
 <CANk7y0jNj0SDOBr=3n_0jhQbLzaj--yVUF4oDA-ManQG-=bkhw@mail.gmail.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yonghong Song <yonghong.song@linux.dev>
In-Reply-To: <CANk7y0jNj0SDOBr=3n_0jhQbLzaj--yVUF4oDA-ManQG-=bkhw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_133212_046148_C0157D7E 
X-CRM114-Status: GOOD (  17.78  )
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



On 12/17/25 10:56 AM, Puranjay Mohan wrote:
> On Wed, Dec 17, 2025 at 6:46 PM Alexei Starovoitov
> <alexei.starovoitov@gmail.com> wrote:
>> On Wed, Dec 17, 2025 at 10:13 AM Puranjay Mohan <puranjay@kernel.org> wrote:
>>> On Wed, Dec 17, 2025 at 4:56 PM <bot+bpf-ci@kernel.org> wrote:
>>>>> diff --git a/include/linux/bpf.h b/include/linux/bpf.h
>>>>> index 2da986136d26..654fb94bf60c 100644
>>>>> --- a/include/linux/bpf.h
>>>>> +++ b/include/linux/bpf.h
>>>> [ ... ]
>>>>
>>>>> @@ -2006,12 +2009,32 @@ struct bpf_struct_ops_common_value {
>>>>>
>>>>>   static inline bool bpf_prog_get_recursion_context(struct bpf_prog *prog)
>>>>>   {
>>>>> +#ifdef CONFIG_ARM64
>>>>> +     u8 rctx = interrupt_context_level();
>>>>> +     u8 *active = this_cpu_ptr(prog->active);
>>>>> +
>>>>> +     active[rctx]++;
>>>>> +     barrier();
>>>>> +     if (get_unaligned_le32(active) != BIT(rctx * 8))
>>>>> +             return false;
>>>>> +
>>>>> +     return true;
>>>>> +#else
>>>>>        return this_cpu_inc_return(*(prog->active)) == 1;
>>>>> +#endif
>>>>>   }
>>>> Can preemption between the increment and check cause a counter leak on
>>>> CONFIG_PREEMPT_RCU systems? The trampoline calls this function under
>>>> rcu_read_lock_dont_migrate() which allows preemption on PREEMPT_RCU
>>>> (documented at include/linux/rcupdate.h:856).
>>>>
>>>> Consider this scenario on an ARM64 system with PREEMPT_RCU:
>>>>
>>>> 1. Thread A increments active[0] to 1
>>>> 2. Preemption occurs before Thread A reaches the check
>>>> 3. Thread B on same CPU increments active[0] to 2
>>>> 4. Thread B checks: sees 2 != BIT(0), returns false
>>>> 5. Thread A resumes, checks: sees 2 != BIT(0), returns false
>>>> 6. Both threads return false, neither runs BPF
>>>> 7. Neither calls bpf_prog_put_recursion_context() (see
>>>>     __bpf_prog_enter_recur() at kernel/bpf/trampoline.c:952)
>>>> 8. Counter permanently stuck at 2, all future BPF on this CPU fails
>>> Step 7 is incorrect. Looking at the JIT-generated code, the exit
>>> function is ALWAYS called, regardless of whether the enter function
>>> returns 0 or a start time:
>>>
>>>    // x86 JIT at arch/x86/net/bpf_jit_comp.c:2998-3050
>>>    call bpf_trampoline_enter()    // Line 2998
>>>    test rax, rax                   // Line 3006
>>>    je skip_exec                    // Conditional jump
>>>    ... BPF program execution ...   // Lines 3011-3023
>>>    skip_exec:                      // Line 3037 (jump lands here)
>>>    call bpf_trampoline_exit()      // Line 3049 - ALWAYS executed
>>>
>>>    The bpf_trampoline_exit() call is after the skip_exec label, so it
>>> executes in both cases.
>>>
>>> What Actually Happens:
>>>
>>>    Initial state: active[0] = 0
>>>
>>>    Thread A (normal context, rctx=0):
>>>    1. active[0]++ → active[0] = 1
>>>    2. Preempted before barrier()
>>>
>>>    Thread B (scheduled on same CPU, normal context, rctx=0):
>>>    3. active[0]++ → active[0] = 2
>>>    4. barrier()
>>>    5. get_unaligned_le32(active) → reads 0x00000002
>>>    6. Check: 0x00000002 != BIT(0) = 0x00000001 → returns false
>>>    7. __bpf_prog_enter_recur returns 0
>>>    8. JIT checks return value, skips BPF execution
>>>    9. JIT ALWAYS calls __bpf_prog_exit_recur (see
>>> arch/arm64/net/bpf_jit_comp.c:2362)
>>>    10. bpf_prog_put_recursion_context(prog) executes
>>>    11. barrier(), active[0]-- → active[0] = 1
>>>
>>>    Thread A resumes:
>>>    12. barrier()
>>>    13. get_unaligned_le32(active) → reads 0x00000001 (Thread B already
>>> decremented!)
>>>    14. Check: 0x00000001 == BIT(0) = 0x00000001 → returns true ✓
>>>    15. __bpf_prog_enter_recur returns start_time
>>>    16. BPF program executes
>>>    17. __bpf_prog_exit_recur called
>>>    18. bpf_prog_put_recursion_context(prog) executes
>>>    19. barrier(), active[0]-- → active[0] = 0 ✓
>>>
>>>    Final State
>>>
>>>    - Counter returns to 0 ✓
>>>    - No leak ✓
>>>    - Thread B detected interference and aborted ✓
>>>    - Thread A executed successfully ✓
>>>    - Only ONE thread executed the BPF program ✓
>>>
>>>
>>> Now that I think of it, there is another race condition that leads to
>>> NEITHER program running:
>>>
>>> Consider this scenario on an arm64 system with PREEMPT_RCU:
>>>
>>> 1. Thread A increments active[0] from 0 to 1
>>> 2. Thread A is preempted before reaching barrier()
>>> 3. Thread B (same CPU, same context) increments active[0] from 1 to 2
>>> 4. Thread B executes barrier() and checks: sees 2 != BIT(0), returns false
>>> 5. Thread A resumes, executes barrier() and checks: sees 2 != BIT(0),
>>> returns false
>>> 6. Both threads return false to __bpf_prog_enter_recur()
>>> 7. Both skip BPF program execution
>>> 8. Both call bpf_prog_put_recursion_context() and decrement: 2->1->0
>>> 9. Neither BPF program executes, but the counter correctly returns to 0
>>>
>>> This means the patch is changing the behaviour in case of recursion
>>> from "One program gets to run" to
>>> "At most one program gets to run", but given the performance benefits,
>>> I think we can accept this change.
>> Agree. It's fine, but we can mitigate it, but doing this rctx trick
>> only when RCU is not preemptable. Which pretty much would mean
>> that PREEMPT_RT will use atomic and !RT will use rctx
>> and this 'no prog executes' will not happen.
>
> The issue is also with sleepable programs, they use
> rcu_read_lock_trace() and can end up with
> 'no prog executes' scenario.
>
> What do you think is the best approach for them?

For sleepable programs, maybe we can use the original approach like
   return this_cpu_inc_return(*(prog->active)) == 1;
?
This should solve the 'no prog execution' issue.



