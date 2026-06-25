Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D2FFCDE008
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Jun 2026 11:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lbzw4iCdEMIVr8Rm+02JZsgUDjGn908N2EuKEXL1dA4=; b=DsNdmPpRHFc3fFUxyxFGlxVa1z
	6mlBoVim/LkI+IFycAIMVLeY2O8gR9OciWAI6PAcS0qWp2M7YN9MV2m+TXFuur1vJpDI/T02PlPUH
	Tq81l7nA4HW8+vF1odIjbayki6wXXgRqcp86JxlKxul9qjIEjEd0n47JzfzsSb4eKemRU/Fj4jF33
	/FmOc12R/z6KP76+cFyC30e8507ccolTIflDGtzh5yNiMcGgOrwN1fvlO2QFWQQ6gJpW3uDJ9XlZp
	5e5KBwOAKHrjnGyLo+xvdl4zPl6oYEFQr6I2Y5RSbVTAzog1u8XaSED6uvwv+0RhvKGGbY8Pjrtpt
	Hoil9yKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wciF9-000000095iR-275f;
	Thu, 25 Jun 2026 11:27:39 +0000
Received: from canpmsgout10.his.huawei.com ([113.46.200.225])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wciF5-000000095hj-3fAF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Jun 2026 11:27:37 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=Lbzw4iCdEMIVr8Rm+02JZsgUDjGn908N2EuKEXL1dA4=;
	b=qiacUhhsOGncoVteo8geEM+b3wh3Hpw61ByC3JbyDn3fSo6yee7FrlCjIYrhUWbq2HoOYxoXJ
	ffm62qqErbVVhrshZO/jW1avQu9/8GJAwHovdFZIEg+ptyPsLcy3t8+PePqsDv6uD2cVe2ZZ/Z+
	OK7qM7dR2z3/gHcu+O7J/DY=
Received: from mail.maildlp.com (unknown [172.19.163.200])
	by canpmsgout10.his.huawei.com (SkyGuard) with ESMTPS id 4gmGWb1W42z1K96q;
	Thu, 25 Jun 2026 19:18:19 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 063B940563;
	Thu, 25 Jun 2026 19:27:24 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 25 Jun 2026 19:27:22 +0800
Message-ID: <8b0c9b40-b539-40df-b2f9-e83289b00cb4@huawei.com>
Date: Thu, 25 Jun 2026 19:27:21 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 10/11] arm64: entry: Convert to generic entry
To: Ada Couprie Diaz <ada.coupriediaz@arm.com>
CC: <catalin.marinas@arm.com>, <will@kernel.org>, <oleg@redhat.com>,
	<tglx@kernel.org>, <peterz@infradead.org>, <luto@kernel.org>,
	<kees@kernel.org>, <wad@chromium.org>, <mark.rutland@arm.com>,
	<yeoreum.yun@arm.com>, <linusw@kernel.org>, <kevin.brodsky@arm.com>,
	<ldv@strace.io>, <thuth@redhat.com>, <james.morse@arm.com>,
	<song@kernel.org>, <anshuman.khandual@arm.com>, <broonie@kernel.org>,
	<ryan.roberts@arm.com>, <pengcan@kylinos.cn>, <liqiang01@kylinos.cn>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20260511092103.1974980-1-ruanjinjie@huawei.com>
 <20260511092103.1974980-11-ruanjinjie@huawei.com>
 <cfa07466-225b-476f-adf9-346bd1377a4d@arm.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <cfa07466-225b-476f-adf9-346bd1377a4d@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_042736_246767_3D31E150 
X-CRM114-Status: GOOD (  35.28  )
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



On 6/24/2026 11:32 PM, Ada Couprie Diaz wrote:
> On 11/05/2026 10:21, Jinjie Ruan wrote:
>> Implement the generic entry framework for arm64 to handle system call
>> entry and exit. This follows the migration of x86, RISC-V, and LoongArch,
>> consolidating architecture-specific syscall tracing and auditing into
>> the common kernel entry infrastructure.
> If I understand correctly, as Syscall User Dispatch is gated being
> `CONFIG_GENERIC_ENTRY` only and handled via ptrace, this patch
> effectively enables Syscall User Dispatch for arm64.
> I think it would be great to mention it here explicitly !

Hi, Ada,

Yes, I mentioned it in the cover letter, will add it in next version.

>>
>> [Background]
>> Arm64 has already adopted generic IRQ entry. Completing the conversion
>> to the generic syscall entry framework reduces architectural divergence,
>> simplifies maintenance, and allows arm64 to automatically benefit from
>> improvements in the common entry code.
>>
>> [Changes]
>>
>> 1. Kconfig and Infrastructure:
>> - Select GENERIC_ENTRY and remove GENERIC_IRQ_ENTRY (now implied).
>>
>> - Migrate struct thread_info to use the syscall_work field instead
>>    of TIF flags for syscall-related tasks.
>>
>> 2. Thread Info and Flags:
>> - Remove definitions for TIF_SYSCALL_TRACE, TIF_SYSCALL_AUDIT,
>>    TIF_SYSCALL_TRACEPOINT, TIF_SECCOMP, and TIF_SYSCALL_EMU.
>>
>> - Replace _TIF_SYSCALL_WORK and _TIF_SYSCALL_EXIT_WORK with the
>>    generic SYSCALL_WORK bitmask.
>>
>> - Map single-step state to SYSCALL_EXIT_TRAP in debug-monitors.c.
>>
>> 3. Architecture-Specific Hooks (asm/entry-common.h):
>> - Implement arch_ptrace_report_syscall_entry() and _exit() by
>>    porting the existing arm64 logic to the generic interface.
>>
>> - Add arch_syscall_is_vdso_sigreturn() to asm/syscall.h to
>>    support Syscall User Dispatch (SUD).
> Related to the above : I feel this is missing an important information.
> Given that SUD is only controlled by `CONFIG_GENERIC_ENTRY`,
> converting to generic entry _requires_ supporting SUD, so we do it here.
> I think this would be important to mention, as I otherwise felt like this
> change did not belong in this patch.

Thanks for the excellent point.

I completely agree that bundling Syscall User Dispatch (SUD) support
with the core generic entry conversion makes the patch bloated and less
focused.

To address this, I will extract the Syscall User Dispatch support into a
completely standalone patch in the next version.

And I noticed that arch_syscall_is_vdso_sigreturn() returns false for
most architectures. It would make sense to refactor it to return false
by default.

> 
> General question that follows : does it make sense to require an arch
> to support Syscall User Dispatch to be able to convert to generic entry ?
> (I assume not really, given that only `arch_syscall_is_vdso_sigreturn()` is
> required on the arch side, but I am curious)

No, converting to generic entry doesn't architecturally require an arch
to force-enable SUD, but since the generic entry framework already
includes SUD support, the arch naturally gains the capability.

It is worth noting that enabling this capability has zero impact by
default. The functionality remains entirely dormant unless a userspace
application explicitly configures it via
prctl(PR_SET_SYSCALL_USER_DISPATCH, ...). Otherwise, the kernel logic
won't take effect at all.

Separating it into its own patch will make this relationship much
clearer in v16.

> 
>>
>> 4. Cleanup and Refactoring:
>> - Remove redundant arm64-specific syscall tracing functions from
>>    ptrace.c, including syscall_trace_enter(), syscall_exit_work(),
>>    and related audit/step helpers.
>>
>> - Update el0_svc_common() in syscall.c to use the generic
>>    syscall_work checks and entry/exit call sites.
>>
>> [Why this matters]
>> - Unified Interface: Aligns arm64 with the modern kernel entry standard.
>>
>> - Improved Maintainability: Bug fixes in kernel/entry/common.c now
>>    apply to arm64 automatically.
>>
>> - Feature Readiness: Simplifies the implementation of future
>>    cross-architecture syscall features.
>>
>> [Compatibility]
>> This conversion maintains full ABI compatibility with existing
>> userspace. The ptrace register-saving behavior, seccomp filtering, and
>> syscall tracing semantics remain identical to the previous
>> implementation.
> I agree, would it make sense to mention that there is no change related
> to RSEQ as arm64 does not have `HAVE_GENERIC_TIF_BITS` ? As that is
> part of generic entry, but is indeed a no-op for us.

Agreed. I will update the commit message to include this information in
v16. Thanks!

>>
>> Cc: Mark Rutland <mark.rutland@arm.com>
>> Cc: Will Deacon <will@kernel.org>
>> Cc: Catalin Marinas <catalin.marinas@arm.com>
>> Cc: Thomas Gleixner <tglx@kernel.org>
>> Cc: Peter Zijlstra <peterz@infradead.org>
>> Reviewed-by: Linus Walleij <linusw@kernel.org>
>> Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
>> Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
>> Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>
>> Suggested-by: Kevin Brodsky <kevin.brodsky@arm.com>
>> Suggested-by: Mark Rutland <mark.rutland@arm.com>
>> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
>> ---
>> [...]
>> diff --git a/arch/arm64/kernel/debug-monitors.c b/arch/arm64/kernel/
>> debug-monitors.c
>> index 29307642f4c9..e67643a70405 100644
>> --- a/arch/arm64/kernel/debug-monitors.c
>> +++ b/arch/arm64/kernel/debug-monitors.c
>> @@ -385,11 +385,18 @@ void user_enable_single_step(struct task_struct
>> *task)
>>         if (!test_and_set_ti_thread_flag(ti, TIF_SINGLESTEP))
>>           set_regs_spsr_ss(task_pt_regs(task));
>> +
>> +    /*
>> +     * Ensure that a trap is triggered once stepping out of a system
>> +     * call prior to executing any user instruction.
>> +     */
> I was a bit confused by the comment in isolation at first : we already
> have a signal that we are stepping and would need a trap, `TIF_SINGLESTEP`.
> Would it make sense to mention here that this is for/handled by the generic
> entry code ?
> Something along the lines of "[...], as the generic entry code does not
> check for `TIF_SINGLESTEP`.", or "Ensure that the generic entry code
> triggers a trap [...]", if you think its useful ?
>> +    set_task_syscall_work(task, SYSCALL_EXIT_TRAP);

That makes a lot of sense. The clarification is definitely useful to
prevent confusion for anyone looking at this architecture-specific bit
in the future.

I will update the comment in v16 to explicitly mention that this is
handled to ensure the generic entry code correctly triggers the trap, as
per your suggestion.

Thanks for the feedback!

Best regards,
Jinjie

>>   }
>>   NOKPROBE_SYMBOL(user_enable_single_step);
>>     void user_disable_single_step(struct task_struct *task)
>>   {
>>       clear_ti_thread_flag(task_thread_info(task), TIF_SINGLESTEP);
>> +    clear_task_syscall_work(task, SYSCALL_EXIT_TRAP);
>>   }
>>   NOKPROBE_SYMBOL(user_disable_single_step);
> 
> Apart from my minor nitpicks :
> 
> Reviewed-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
> 
> Thanks,
> Ada
> 
> 


