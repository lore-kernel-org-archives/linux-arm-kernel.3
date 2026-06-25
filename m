Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D7AACDB466
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Jun 2026 09:21:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2NRKFMEB60M14REC6e17ydzz/6qGu6OtMKv97n2hy+g=; b=woNxdqs2dFFRGJ43win+zjgrjK
	A780NXUfiMvMMg6cwDiHTLcHolvbfwJKPGUQtXrakNc+RCm+3LfCkUm35AnnODtuKd0jXPSOD3PXv
	8IuQhwTHIqnfh/5CTLNWDCTeL65+RETcTISggYw2ixIaP5nckyGQlE59EKf1E/w3OVQn32UomHkmo
	zVuiSKMnViWHSttfI6crsDaVD0Rhflo6FjuoOEtmCN3i1xFrofER8f3SJbOki43zJzTTXQfxC/1EU
	g1asEzgfwuCPfWnd9GA2OK7kArK7iLnV/o/Wsap55/peLrzWPt5WPWO6AiLCSUNkIvJkpBL+gNx4H
	S8C+BxwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcgGd-00000008ti2-2VP4;
	Thu, 25 Jun 2026 09:21:03 +0000
Received: from canpmsgout02.his.huawei.com ([113.46.200.217])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcgGY-00000008tXz-2gXo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Jun 2026 09:21:01 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=2NRKFMEB60M14REC6e17ydzz/6qGu6OtMKv97n2hy+g=;
	b=BF0PRly77fuUTBID/divq7ABykAp/8RGv1jJz9Qd6Wc8Zo5uHjM5ZBonrfumku5QNHaeCtLZZ
	fPHA2iefzZzA5i4B6biXm5IuiTzudkYZnf/Qg1hyldzonUU5+yaSJRNQDsb+s2yA58+YqLiO0YJ
	I8FzsCC0EDEvc0fji8480ps=
Received: from mail.maildlp.com (unknown [172.19.162.144])
	by canpmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4gmCgj1zgpzcb1d;
	Thu, 25 Jun 2026 17:10:09 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 9FD9040538;
	Thu, 25 Jun 2026 17:18:48 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 25 Jun 2026 17:18:47 +0800
Message-ID: <83aed271-5f28-4f30-a800-b94192cb06a6@huawei.com>
Date: Thu, 25 Jun 2026 17:18:46 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 07/11] arm64: syscall: Introduce
 syscall_exit_to_user_mode_work()
To: Ada Couprie Diaz <ada.coupriediaz@arm.com>, <mark.rutland@arm.com>
CC: <catalin.marinas@arm.com>, <will@kernel.org>, <oleg@redhat.com>,
	<tglx@kernel.org>, <peterz@infradead.org>, <luto@kernel.org>,
	<kees@kernel.org>, <wad@chromium.org>, <yeoreum.yun@arm.com>,
	<linusw@kernel.org>, <kevin.brodsky@arm.com>, <ldv@strace.io>,
	<thuth@redhat.com>, <james.morse@arm.com>, <song@kernel.org>,
	<anshuman.khandual@arm.com>, <broonie@kernel.org>, <ryan.roberts@arm.com>,
	<pengcan@kylinos.cn>, <liqiang01@kylinos.cn>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20260511092103.1974980-1-ruanjinjie@huawei.com>
 <20260511092103.1974980-8-ruanjinjie@huawei.com>
 <768cc347-c42f-411d-90c3-bfaa39afeaf7@arm.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <768cc347-c42f-411d-90c3-bfaa39afeaf7@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_022059_309784_3C488B1A 
X-CRM114-Status: GOOD (  41.21  )
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



On 6/24/2026 10:37 PM, Ada Couprie Diaz wrote:
> On 11/05/2026 10:20, Jinjie Ruan wrote:
>> Refactor the system call exit path to align with the generic entry
>> framework. This consolidates thread flag checking, rseq handling, and
>> syscall tracing into a structure that mirrors the generic
>> syscall_exit_to_user_mode_work() implementation.
>>
>> [Rationale]
>> The generic entry code employs a hierarchical approach for
>> syscall exit work:
>>
>> 1. syscall_exit_to_user_mode_work(): The entry point that handles
>>     rseq and checks if further exit work (tracing/audit) is required.
>>
>> 2. syscall_exit_work(): Performs the actual tracing, auditing, and
>>     ptrace reporting.
>>
>> [Changes]
>> - Rename and Encapsulate: Rename syscall_trace_exit() to
>>    syscall_exit_work() and make it static, as it is now an internal
>>    helper for the exit path.
>>
>> - New Entry Point: Implement syscall_exit_to_user_mode_work() to
>>    replace the manual flag-reading logic in el0_svc_common(). This
>>    function now encapsulates the rseq_syscall() call and the
>>    conditional execution of syscall_exit_work().
>>
>> - Simplify el0_svc_common(): Remove the complex conditional checks
>>    for tracing and CONFIG_DEBUG_RSEQ at the end of the syscall path,
>>    delegating this responsibility to the new helper.
> It is indeed simpler, however to me there are two changes to the behaviour,
> which are not called out (apologies if I missed some prior discussion
> when I looked for some) :
> 1. As pointed by the removed comment, in mainline we *always* trace on exit
>    if we traced on entry. This is why there are two `has_syscall_work()`
> checks
>    on exit, with a re-read of the flags after syscall execution in between.
>    This change only checks once on exit after updating the flags, so if
>    there was work on entry but the flags got cleared, it *won't* trace
> on exit.
>    Is this desired ? Can this change of behaviour have an impact ?

Hi, Ada,

After rework, `syscall_exit_to_user_mode_work()` will be executed
unconditionally, regardless of whether the conditions below evaluate to
true or false. You can see how this is handled in the finer-grained
refactoring split which will be shown in v16.

	if (!has_syscall_work(flags) && !IS_ENABLED(CONFIG_DEBUG_RSEQ))

>> - Helper Migration: Move has_syscall_work() to asm/syscall.h
>>    to allow its reuse across ptrace.c and syscall.c.
>>
>> - Clean up RSEQ: Remove the explicit IS_ENABLED(CONFIG_DEBUG_RSEQ)
>>    check in the caller, as rseq_syscall() is already a no-op when the
>>    config is disabled.
> 2. `rseq_syscall()` is indeed a no-op, but removing the explicit check here
>    does change the behaviour : in mainline we *always* trace on exit if
>    `CONFIG_DEBUG_RSEQ` is enabled, bypassing the `has_syscall_work()`
> check.
>    This change does not bypass the `has_syscall_work()` check if
>    `CONFIG_DEBUG_RSEQ` is enabled, so there might be a change of behaviour.
>    Same questions as above : is this change desired ? Can it have an
> impact ?

This should not introduce any functional changes.

Except for "audit", the internal code execution of
`syscall_trace_exit()` is gated by the "_TIF_SYSCALL_TRACEPOINT,
_TIF_SYSCALL_TRACE, or _TIF_SINGLESTEP" TIF flags.

And gating audit_syscall_exit() behind `_TIF_SYSCALL_AUDIT` introduces
no functional changes.

The `SYSCALL_AUDIT` flag and its context are
statically allocated via audit_alloc() at fork and only freed via
audit_free() at do_exit(). Since the flag remains persistent and static
throughout syscall execution, checking the `_TIF_SYSCALL_AUDIT` flag is
completely equivalent to evaluating audit_context() in
audit_syscall_exit().

I probably moved too fast with this refactoring. I'll split this into
smaller, more granular steps in v16 to make the logic clearer and easier
to follow."

> 
> I understand that the change is to align with the generic entry, but it
> seems
> like this could have an impact that I do not really understand, so I prefer
> asking !
> 
> Apart from the above everything looks OK to me, but I'd like
> some confirmation that the change of behaviours either do not exist or
> are OK !

Thank you for the review.

> 
> Thanks,
> Ada
> 
>> Cc: Mark Rutland <mark.rutland@arm.com>
>> Cc: Will Deacon <will@kernel.org>
>> Cc: Catalin Marinas <catalin.marinas@arm.com>
>> Reviewed-by: Linus Walleij <linusw@kernel.org>
>> Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
>> Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>
>> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
>> ---
>> v15
>> - Make syscall_exit_to_user_mode_work() __always_inline to keep
>>    the fast-path performance as Sashiko pointed out.
>> ---
>>   arch/arm64/include/asm/syscall.h | 18 +++++++++++++++++-
>>   arch/arm64/kernel/ptrace.c       |  5 +----
>>   arch/arm64/kernel/syscall.c      | 20 +-------------------
>>   3 files changed, 19 insertions(+), 24 deletions(-)
>>
>> diff --git a/arch/arm64/include/asm/syscall.h b/arch/arm64/include/
>> asm/syscall.h
>> index 30b203ef156b..b331e09b937f 100644
>> --- a/arch/arm64/include/asm/syscall.h
>> +++ b/arch/arm64/include/asm/syscall.h
>> @@ -8,6 +8,7 @@
>>   #include <uapi/linux/audit.h>
>>   #include <linux/compat.h>
>>   #include <linux/err.h>
>> +#include <linux/rseq.h>
>>     typedef long (*syscall_fn_t)(const struct pt_regs *regs);
>>   @@ -121,6 +122,21 @@ static inline int syscall_get_arch(struct
>> task_struct *task)
>>   }
>>     int syscall_trace_enter(struct pt_regs *regs, unsigned long flags);
>> -void syscall_trace_exit(struct pt_regs *regs, unsigned long flags);
>> +void syscall_exit_work(struct pt_regs *regs, unsigned long flags);
>> +
>> +static inline bool has_syscall_work(unsigned long flags)
>> +{
>> +    return unlikely(flags & _TIF_SYSCALL_WORK);
>> +}
>> +
>> +static __always_inline void syscall_exit_to_user_mode_work(struct
>> pt_regs *regs)
>> +{
>> +    unsigned long flags = read_thread_flags();
> 
>             ^-- This only reflects the post-syscall flags
> 
>> +
>> +    rseq_syscall(regs);
>> +
>> +    if (has_syscall_work(flags) || flags & _TIF_SINGLESTEP)
>> +        syscall_exit_work(regs, flags);
>> +}
>>     #endif    /* __ASM_SYSCALL_H */
>> diff --git a/arch/arm64/kernel/ptrace.c b/arch/arm64/kernel/ptrace.c
>> index 15a45eeb56da..256aa20377e1 100644
>> --- a/arch/arm64/kernel/ptrace.c
>> +++ b/arch/arm64/kernel/ptrace.c
>> @@ -28,7 +28,6 @@
>>   #include <linux/hw_breakpoint.h>
>>   #include <linux/regset.h>
>>   #include <linux/elf.h>
>> -#include <linux/rseq.h>
>>     #include <asm/compat.h>
>>   #include <asm/cpufeature.h>
>> @@ -2454,10 +2453,8 @@ int syscall_trace_enter(struct pt_regs *regs,
>> unsigned long flags)
>>       return syscall;
>>   }
>>   -void syscall_trace_exit(struct pt_regs *regs, unsigned long flags)
>> +void syscall_exit_work(struct pt_regs *regs, unsigned long flags)
>>   {
>> -    rseq_syscall(regs);
>> -
>>       audit_syscall_exit(regs);
> 
>      ^-- This was always called if entry had work or CONFIG_DEBUG_RSEQ
> was enabled,
>          which is not the case anymore (same for the rest of the function)

As explained above, thank you!

> 
>>         if (flags & _TIF_SYSCALL_TRACEPOINT)
>> diff --git a/arch/arm64/kernel/syscall.c b/arch/arm64/kernel/syscall.c
>> index f6f87b042995..dac7bcc4bbdf 100644
>> --- a/arch/arm64/kernel/syscall.c
>> +++ b/arch/arm64/kernel/syscall.c
>> @@ -54,11 +54,6 @@ static void invoke_syscall(struct pt_regs *regs,
>> unsigned int scno,
>>       syscall_set_return_value(current, regs, 0, ret);
>>   }
>>   -static inline bool has_syscall_work(unsigned long flags)
>> -{
>> -    return unlikely(flags & _TIF_SYSCALL_WORK);
>> -}
>> -
>>   static void el0_svc_common(struct pt_regs *regs, int scno, int sc_nr,
>>                  const syscall_fn_t syscall_table[])
>>   {
>> @@ -120,21 +115,8 @@ static void el0_svc_common(struct pt_regs *regs,
>> int scno, int sc_nr,
>>       }
>>         invoke_syscall(regs, scno, sc_nr, syscall_table);
>> -
>> -    /*
>> -     * The tracing status may have changed under our feet, so we have to
>> -     * check again. However, if we were tracing entry, then we always
>> trace
>> -     * exit regardless, as the old entry assembly did.
>> -     */
>> -    if (!has_syscall_work(flags) && !IS_ENABLED(CONFIG_DEBUG_RSEQ)) {
> 
>                       ^-- We always traced exit if CONFIG_DEBUG_RSEQ is
> enabled
>          ^-- `flags` is unchanged since entry, and exit was always
> traced if there was work.

As explained above, thank you!

Best regards,
Jinjie

> 
>> -        flags = read_thread_flags();
>> -        if (!has_syscall_work(flags) && !(flags & _TIF_SINGLESTEP))
>> -            return;
>> -    }
>> -
>>   trace_exit:
>> -    flags = read_thread_flags();
>> -    syscall_trace_exit(regs, flags);
>> +    syscall_exit_to_user_mode_work(regs);
>>   }
>>     void do_el0_svc(struct pt_regs *regs)
> 


