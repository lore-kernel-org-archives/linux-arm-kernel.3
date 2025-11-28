Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E11A7D116F1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Nov 2025 13:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KpgBSwJJdj750wXmYMnSJGWb34tc+tp2V6YjCZQ0N1o=; b=LsklDTDyoGbe2ZYbIvbGUEuWLS
	D8gYZXJZQV1V4o05mURsaBB+4gwxMHx8mnY2RxDG1M2N+y+Wd0glSIAyDHLj3YklInZUbcGorYQET
	7ybc5MUV8FHyqE3AUi+KgtTwH58P8E3b26SVaJ8pdLWLw7RH86DEZ/M+GsNIHBK2P+eTvrVngl0DY
	KwL3knaDQyRJ18ucivm8eJCJQuZYLTQrlBtp9vUKEk8V3u+W/OUXwfWd05R4eE0wyXLwBh5/qYByU
	WnoYV2w7xckYFa6IRMlliiFRZArLHUOInPyQCzlEC1hZmf7R91DsN//ACJSnjnBYR0+M2dTaTspYb
	5bxaMYNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOya8-00000000U9D-0Clp;
	Fri, 28 Nov 2025 13:32:16 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOya5-00000000U8F-06lD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Nov 2025 13:32:14 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 72984175A;
	Fri, 28 Nov 2025 05:32:00 -0800 (PST)
Received: from [10.44.160.62] (e126510-lin.lund.arm.com [10.44.160.62])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 315553F66E;
	Fri, 28 Nov 2025 05:32:02 -0800 (PST)
Message-ID: <8c55c2a1-995e-44a1-8d48-b7d794f5176f@arm.com>
Date: Fri, 28 Nov 2025 14:32:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 11/12] arm64: entry: Convert to generic entry
To: Jinjie Ruan <ruanjinjie@huawei.com>, catalin.marinas@arm.com,
 will@kernel.org, oleg@redhat.com, tglx@linutronix.de, peterz@infradead.org,
 luto@kernel.org, shuah@kernel.org, kees@kernel.org, wad@chromium.org,
 charlie@rivosinc.com, akpm@linux-foundation.org, ldv@strace.io,
 macro@orcam.me.uk, deller@gmx.de, mark.rutland@arm.com, efault@gmx.de,
 song@kernel.org, mbenes@suse.cz, ryan.roberts@arm.com,
 ada.coupriediaz@arm.com, anshuman.khandual@arm.com, broonie@kernel.org,
 pengcan@kylinos.cn, dvyukov@google.com, kmal@cock.li,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
References: <20251126071446.3234218-1-ruanjinjie@huawei.com>
 <20251126071446.3234218-12-ruanjinjie@huawei.com>
 <c6cf8755-34d0-468d-99c4-ac6d266f9efb@arm.com>
 <bfdd914c-4c3a-9af7-d530-f57f3532c3d5@huawei.com>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <bfdd914c-4c3a-9af7-d530-f57f3532c3d5@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251128_053213_199683_EAB10279 
X-CRM114-Status: GOOD (  22.69  )
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

On 28/11/2025 04:34, Jinjie Ruan wrote:
>
> On 2025/11/27 21:31, Kevin Brodsky wrote:
>> On 26/11/2025 08:14, Jinjie Ruan wrote:
>>> Currently, x86, Riscv, Loongarch use the generic entry which makes
>>> maintainers' work easier and codes more elegant. arm64 has already
>>> switched to the generic IRQ entry, so completely convert arm64 to use
>>> the generic entry infrastructure from kernel/entry/*.
>>>
>>> The changes are below:
>>>  - Remove TIF_SYSCALL_* flag, _TIF_WORK_MASK, _TIF_SYSCALL_WORK,
>> _TIF_WORK_MASK is now removed in patch 1.
>>
>>>    and remove has_syscall_work(), as _TIF_SYSCALL_WORK is equal with
>>>    SYSCALL_WORK_ENTER.
>>>
>>> [...]
>>>
>>> +static __always_inline void arch_ptrace_report_syscall_exit(struct pt_regs *regs,
>>> +							    int step)
>>> +{
>>> +	unsigned long saved_reg;
>>> +	int regno;
>>> +
>>> +	saved_reg = ptrace_save_reg(regs, PTRACE_SYSCALL_EXIT, &regno);
>>> +	if (!step) {
>> A difference I noticed here is that the generic report_single_step()
>> always returns false if SYSCALL_EMU is set. I don't know if the
>> combination of SYSCALL_EMU and SINGLESTEP is meaningful, but if it is
>> then I think that's a behaviour change.
> commit 64eb35f701f0 ("ptrace: Migrate TIF_SYSCALL_EMU to use
> SYSCALL_WORK flag") has changed the following code:
>
> Therefore, the original logic returns false in these cases for
> report_single_step() :
>
> - Only _TIF_SYSCALL_EMU is set.
>
> - Both _TIF_SINGLESTEP and _TIF_SYSCALL_EMU are set.
>
> - Neither TIF_SINGLESTEP nor _TIF_SYSCALL_EMU is set;
>
>
>     #define SYSEMU_STEP    (_TIF_SINGLESTEP | _TIF_SYSCALL_EMU)
>
>     static inline bool report_single_step(unsigned long ti_work)
>     {
>        return (ti_work & SYSEMU_STEP) == _TIF_SINGLESTEP;
>     }

The code did look different before this commit, but AFAICT it was
functionally equivalent w.r.t. SYSEMU / SINGLESTEP.

> I think the "returns false if SYSCALL_EMU is set" behaviour is correct
> according to the Man's Manual， both PTRACE_SYSEMU and
> PTRACE_SYSEMU_SINGLESTEP need to report the syscal only once on syscall
> entry.
>
>     “For PTRACE_SYSEMU, continue and stop on entry to the next
>       system call, which will not be executed.  See the
>       documentation on syscall-stops below.  For
>       PTRACE_SYSEMU_SINGLESTEP, do the same but also singlestep
>       if not a system call. “

That seems sensible (based on my very limited understanding of SYSEMU),
nevertheless it is not what arm64 currently does AFAIU. To follow the
same logic as the rest, this change should be made in a separate patch.

> Link：https://man7.org/linux/man-pages/man2/ptrace.2.html
>
>>> [...]
>>>
>>>  #define TIF_UPROBE		5	/* uprobe breakpoint or singlestep */
>>>  #define TIF_MTE_ASYNC_FAULT	6	/* MTE Asynchronous Tag Check Fault */
>>>  #define TIF_NOTIFY_SIGNAL	7	/* signal notifications exist */
>>> -#define TIF_SYSCALL_TRACE	8	/* syscall trace active */
>>> -#define TIF_SYSCALL_AUDIT	9	/* syscall auditing */
>>> -#define TIF_SYSCALL_TRACEPOINT	10	/* syscall tracepoint for ftrace */
>>> -#define TIF_SECCOMP		11	/* syscall secure computing */
>>> -#define TIF_SYSCALL_EMU		12	/* syscall emulation active */
>>> +#define TIF_SECCOMP		11      /* syscall secure computing */
>>> +#define TIF_SYSCALL_EMU		12      /* syscall emulation active */
>> These seem to have reappeared in v8 for some reason?
> v8 add "ARCH_SYSCALL_WORK_EXIT" to be defined as "SECCOMP | SYSCALL_EMU"
>   to keep the arm64 behaviour unchanged as mentioned in v7.

Ah then that is where the issue is, I missed that: surely switching to
generic entry means that we are using SYSCALL_WORK_BIT_* rather than
TIF_* for all these flags?

- Kevin

