Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64A24C44501
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 03:26:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vN6N1sy4wc7a1tYZYhgycBXYemMbKUwsQb6VzpueAlE=; b=n4Wvv+6bRKFLdXzbGGosnzoLNm
	+zebLl6Er8BAjZW7mID5vB/SOs8ce5WDd5X/bajBaNCWwre9pPNz68j8ydPRxgnvQu5NSa5gj+jDl
	7pVtmCuAAQOeyu+0MOPYswRtLu+2QSTfOvSOHP14mrtgH8/WmoIJebEZPRzjBtaXlQk4hHqDgz+mg
	j1Uq/WVNAUjKFtO2NJc9BmGfi35J74eF4GCvHNGZUH2rQ1v6kU+QsuPfgr7Wqricmu8G1LD2xC8IN
	8mygYvJw3RTebK63zyqH7ZpkKbdAvpxlqUhPKjwsgIyctryW0RBia5zBnlmyCtjiNtkH1GFApElmw
	qyF+pHgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkCji-0000000GLXg-36HW;
	Thu, 16 Jul 2026 03:26:10 +0000
Received: from canpmsgout01.his.huawei.com ([113.46.200.216])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkCje-0000000GLX2-3JXW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 03:26:09 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=vN6N1sy4wc7a1tYZYhgycBXYemMbKUwsQb6VzpueAlE=;
	b=ZCy0z04Feuvg0G+6lMDp0S/VApN9Ocx6mTLo5qHF7LmQK6nqpRmWKr8phIAGIvpLPx1qYsSRy
	QaxqWZAilqY1OsnINavfZk+4UnKefqnFeT30Q8juZfQ3w2SEmNqRgmKVQYUGAIOtI8254A7xsAu
	Jf9fjEyX91Ys/ajn+97sX7E=
Received: from mail.maildlp.com (unknown [172.19.163.0])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4h0yrF58Pyz1T4HL;
	Thu, 16 Jul 2026 11:16:45 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 6E60740537;
	Thu, 16 Jul 2026 11:25:57 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 16 Jul 2026 11:25:56 +0800
Message-ID: <b9fd95d3-4a11-427b-9341-93554f6a12c0@huawei.com>
Date: Thu, 16 Jul 2026 11:25:55 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: syscall: Ensure saved x0 is kept in-sync with
 tracer updates
To: Kees Cook <kees@kernel.org>
CC: Will Deacon <will@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, Yiqi Sun
	<sunyiqixm@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>
References: <20260714143600.23853-1-will@kernel.org>
 <ac39d21e-8800-4c4e-885e-4baf7af2a106@huawei.com>
 <202607152004.DEA95D63@keescook>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <202607152004.DEA95D63@keescook>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_202607_475021_D0922D43 
X-CRM114-Status: GOOD (  33.17  )
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



On 7/16/2026 11:05 AM, Kees Cook wrote:
> On Thu, Jul 16, 2026 at 10:57:34AM +0800, Jinjie Ruan wrote:
>>
>>
>> On 7/14/2026 10:35 PM, Will Deacon wrote:
>>> When seccomp support was originally added to arm64 in a1ae65b21941
>>> ("arm64: add seccomp support"), seccomp was erroneously called _before_
>>> the ptrace syscall-enter-stop and therefore the tracer could trivially
>>> manipulate the syscall register state after the seccomp check had
>>> passed. This was subsequently fixed in a5cd110cb836 ("arm64/ptrace: run
>>> seccomp after ptrace") by moving the seccomp check after the tracer has
>>> run. Unfortunately, a decade later, that fix has been reported to be
>>> incomplete.
>>>
>>> On arm64, both the first argument to a syscall and its eventual return
>>> value are allocated to register x0. In order to facilitate syscall
>>> restarting and querying of syscall arguments on the syscall exit path,
>>> the original value of x0 is stashed in 'struct pt_regs::orig_x0' early
>>> during the syscall entry path and is returned for the first argument by
>>> syscall_get_arguments(). Unlike 32-bit Arm, this stashed value is not
>>> directly exposed via ptrace() and so changes to register x0 made by the
>>> tracer on a syscall-enter-stop are not reflected in 'orig_x0'. This
>>> means that seccomp and audit can observe a stale value for the register
>>> compared to the argument that will be observed by the actual syscall.
>>>
>>> Re-sync 'orig_x0' from x0 on the syscall entry path following a
>>> potential ptrace stop (i.e. PTRACE_EVENTMSG_SYSCALL_ENTRY or
>>> SECCOMP_RET_TRACE). This behaviour is limited to native tasks (because
>>> compat tasks expose 'orig_r0' to ptrace) where the syscall is not being
>>> skipped (because x0 is updated to hold the return value of -ENOSYS in
>>> that case).
>>>
>>> Cc: Kees Cook <kees@kernel.org>
>>> Cc: Jinjie Ruan <ruanjinjie@huawei.com>
>>> Cc: Mark Rutland <mark.rutland@arm.com>
>>> Reported-by: Yiqi Sun <sunyiqixm@gmail.com>
>>> Link: https://lore.kernel.org/all/20260529065444.1336608-1-sunyiqixm@gmail.com/
>>> Suggested-by: Catalin Marinas <catalin.marinas@arm.com>
>>> Fixes: a5cd110cb836 ("arm64/ptrace: run seccomp after ptrace")
>>> Signed-off-by: Will Deacon <will@kernel.org>
>>> ---
>>>  arch/arm64/kernel/ptrace.c | 24 ++++++++++++++++++++++++
>>>  1 file changed, 24 insertions(+)
>>>
>>> diff --git a/arch/arm64/kernel/ptrace.c b/arch/arm64/kernel/ptrace.c
>>> index 4d08598e2891..57e8c6714d44 100644
>>> --- a/arch/arm64/kernel/ptrace.c
>>> +++ b/arch/arm64/kernel/ptrace.c
>>> @@ -2408,6 +2408,21 @@ static void report_syscall_exit(struct pt_regs *regs)
>>>  	}
>>>  }
>>>  
>>> +static void update_syscall_orig_x0_after_ptrace(struct pt_regs *regs)
>>> +{
>>> +	/*
>>> +	 * Keep orig_x0 authoritative so that seccomp (via
>>> +	 * syscall_get_arguments()), audit and the restart path all see the same
>>> +	 * first argument the syscall is dispatched with, even if it has been
>>> +	 * updated by a tracer. Skip this for NO_SYSCALL (set either by the user
>>> +	 * or the tracer), as regs[0] holds the return value (see the comment in
>>> +	 * el0_svc_common()) and can be unwound using syscall_rollback().
>>> +	 * For compat tasks, orig_r0 is provided directly through GPR index 17.
>>> +	 */
>>> +	if (!is_compat_task() && regs->syscallno != NO_SYSCALL)
>>> +		regs->orig_x0 = regs->regs[0];
>>> +}
>>> +
>>>  int syscall_trace_enter(struct pt_regs *regs)
>>>  {
>>>  	unsigned long flags = read_thread_flags();
>>> @@ -2417,12 +2432,21 @@ int syscall_trace_enter(struct pt_regs *regs)
>>>  		ret = report_syscall_entry(regs);
>>>  		if (ret || (flags & _TIF_SYSCALL_EMU))
>>>  			return NO_SYSCALL;
>>> +
>>> +		/*
>>> +		 * Ensure ptrace changes to x0 are visible to seccomp
>>> +		 * ptrace exits (SECCOMP_RET_TRACE).
>>> +		 */
>>> +		update_syscall_orig_x0_after_ptrace(regs);
>>>  	}
>>>  
>>>  	/* Do the secure computing after ptrace; failures should be fast. */
>>>  	if (secure_computing() == -1)
>>>  		return NO_SYSCALL;
>>>  
>>> +	/* Ensure seccomp updates to x0 are visible to audit. */
>>> +	update_syscall_orig_x0_after_ptrace(regs);
>>
>>
>> Hi, will
>>
>> I think unconditionally updating orig_x0 here is unnecessary, we could
>> Expand seccomp check in place as below the same as generic entry.
>>
>> In this way, in most cases where seccomp is not used, the overhead of
>> updating orig_x0 is eliminated. Moreover, we only need to define an
>> architecture-specific version of the seccomp function, thus avoiding the
>> pain of switching from arm64 to the generic entry.
>>
>> So this patch can be like below.
>>
>> int syscall_trace_enter(struct pt_regs *regs)
>>  {
>>         unsigned long flags = read_thread_flags();
>> @@ -2420,12 +2435,24 @@ int syscall_trace_enter(struct pt_regs *regs)
>>
>>                 /* ptrace might have changed work flags */
>>                 flags = read_thread_flags();
>> +               /*
>> +                * Ensure ptrace changes to x0 during a regular
>> syscall-enter-stop
>> +                * (PTRACE_SYSCALL) are visible to subsequent seccomp trace
>> +                * and audit checking.
>> +                */
>> +               update_syscall_orig_x0_after_ptrace(regs);
>>         }
>>
>>         /* Do the secure computing after ptrace; failures should be fast. */
>>         if (unlikely(flags & _TIF_SECCOMP)) {
>>                 if (!__seccomp_permit_syscall())
>>                         return NO_SYSCALL;
>> +
>> +               /*
>> +                * Ensure tracer changes to x0 during seccomp ptrace
>> exit processing
>> +                * (SECCOMP_RET_TRACE) are visible to audit.
>> +                */
>> +               update_syscall_orig_x0_after_ptrace(regs);
>>         }
>>
>>
>> Author: Jinjie Ruan <ruanjinjie@huawei.com>
>> Date:   Tue Oct 29 19:08:03 2024 +0800
>>
>>     arm64: ptrace: Expand seccomp check in place
>>
>>     Refactor syscall_trace_enter() by open-coding the seccomp check
>>     to align with the generic entry framework. While the original call to
>>     seccomp_permit_syscall() internally re-reads the thread flags and is
>>     therefore safe against flag changes during ptrace stops, the new
>>     open-coded version must explicitly re-read the flags after ptrace
>>     handling to preserve that safety.
>>
>>     [Background]
>>     The generic entry implementation expands the seccomp check in-place
>>     instead of using the seccomp_permit_syscall() wrapper. It directly
>>     tests SYSCALL_WORK_SECCOMP and calls the underlying
>>     __seccomp_permit_syscall() function to handle syscall filtering.
>>
>>     [Changes]
>>     1. After ptrace handling, re-read thread flags:
>>        This ensures that any _TIF_SECCOMP set during the ptrace stop is
>>        observed before the seccomp check.
>>
>>     2. Open-code seccomp check:
>>        - Instead of calling the seccomp_permit_syscall() wrapper, explicitly
>>          check the updated 'flags' parameter for _TIF_SECCOMP.
>>        - Call __seccomp_permit_syscall() directly if the flag is set.
>>
>>     [Why this matters]
>>     - Aligns the arm64 syscall path with the generic entry implementation,
>>       simplifying future migration to the generic entry framework.
>>
>>     - No functional changes are intended; seccomp behavior remains
>> identical.
>>       The explicit re-read ensures the open-coded version retains the same
>>       safety as the original wrapper, preventing the race condition
>> described
>>       in the generic entry fix.
>>
>>     - Performance: Non-ptrace fast path avoids atomic test_bit overhead via
>>       cached flags.
>>
>>     Cc: Mark Rutland <mark.rutland@arm.com>
>>     Cc: Will Deacon <will@kernel.org>
>>     Cc: Catalin Marinas <catalin.marinas@arm.com>
>>     Link:
>> https://lore.kernel.org/all/20260713025712.416366-1-ruanjinjie@huawei.com/
>>     Reviewed-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
>>     Reviewed-by: Linus Walleij <linusw@kernel.org>
>>     Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
>>     Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>
>>     Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
>>
>> diff --git a/arch/arm64/kernel/ptrace.c b/arch/arm64/kernel/ptrace.c
>> index 5709e9d3c321..941752656ea6 100644
>> --- a/arch/arm64/kernel/ptrace.c
>> +++ b/arch/arm64/kernel/ptrace.c
>> @@ -2417,11 +2417,16 @@ int syscall_trace_enter(struct pt_regs *regs)
>>                 ret = report_syscall_entry(regs);
>>                 if (ret || (flags & _TIF_SYSCALL_EMU))
>>                         return NO_SYSCALL;
>> +
>> +               /* ptrace might have changed the flags */
>> +               flags = read_thread_flags();
>>         }
>>
>>         /* Do the secure computing after ptrace; failures should be fast. */
>> -       if (!seccomp_permit_syscall())
>> -               return NO_SYSCALL;
>> +       if (unlikely(flags & _TIF_SECCOMP)) {
>> +               if (!__seccomp_permit_syscall())
>> +                       return NO_SYSCALL;
>> +       }
>>
>>         if (test_thread_flag(TIF_SYSCALL_TRACEPOINT))
>>                 trace_sys_enter(regs, regs->syscallno);
> 
> Do we have a corresponding seccomp_bpf.c selftest we can add for this? I
> would really like to have a regression test that would catch this
> issue...

Hi Kees,

I also believe that we need a test case to prevent functional regression.

I have provided a reproducible case and test results in the link below.
If everyone finds it reasonable, I can modify it into a test case and
submit it.

Link:
https://lore.kernel.org/all/1d55c62e-7c08-4b2b-a009-b770c5ac13bc@huawei.com/

> 
> -Kees
> 


