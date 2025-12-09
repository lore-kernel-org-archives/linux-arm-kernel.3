Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28170D3B7EA
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Dec 2025 13:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+Pl1Fk928zYnrRLZ4APVssyo/qm2shtlz4lkrpJfIW8=; b=YWm6kx93qu1lnWDP1hOTWRHbwJ
	hx0hSLR9GYupHAmCo3hfhpOoXtENXXwzPWdWVL8em7wKUrd9sa0yfy0dGebaKOfoaOfqCfzpXOWIv
	OkALcvcxoDduAa3fNEZ6DusMrf7KuPusTiSTTx2pEtC42lE6Fjlg58C8itywLo2PlGHX/pCNuyJbC
	6J7CwObKs0sW237haC88wvyldwH4tG8EwXEDM1NDEPjXc/nXIkcDuvCc5fJFQJh1ziYkejbtHvFq/
	Nuf4eOV9ZhalZWLosiefG097axT+e8z1aPjUlVR25C7HSM7K58w4TEgI94MsVvnB/U1R8l9LcmRmj
	iEUx96hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSy5P-0000000ELGc-0BFX;
	Tue, 09 Dec 2025 13:49:03 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSy5M-0000000ELF7-1YMZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Dec 2025 13:49:01 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 99A52175A;
	Tue,  9 Dec 2025 05:48:51 -0800 (PST)
Received: from [10.57.45.100] (unknown [10.57.45.100])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5B3343F762;
	Tue,  9 Dec 2025 05:48:54 -0800 (PST)
Message-ID: <b382cc8a-3ce9-4fb1-bc0a-a3d9796251d1@arm.com>
Date: Tue, 9 Dec 2025 14:48:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 15/16] entry: Inline syscall_exit_work()
To: Jinjie Ruan <ruanjinjie@huawei.com>, catalin.marinas@arm.com,
 will@kernel.org, oleg@redhat.com, tglx@linutronix.de, peterz@infradead.org,
 luto@kernel.org, shuah@kernel.org, kees@kernel.org, wad@chromium.org,
 deller@gmx.de, macro@orcam.me.uk, charlie@rivosinc.com, ldv@strace.io,
 mark.rutland@arm.com, song@kernel.org, ryan.roberts@arm.com,
 ada.coupriediaz@arm.com, anshuman.khandual@arm.com, broonie@kernel.org,
 pengcan@kylinos.cn, dvyukov@google.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
References: <20251204082123.2792067-1-ruanjinjie@huawei.com>
 <20251204082123.2792067-16-ruanjinjie@huawei.com>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <20251204082123.2792067-16-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_054900_541324_8DF4F375 
X-CRM114-Status: GOOD (  18.97  )
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

On 04/12/2025 09:21, Jinjie Ruan wrote:
> After switch arm64 to Generic Entry, a new hotspot syscall_exit_work()
> appeared because syscall_exit_work() is no longer inlined. so inline

Before this series the call to syscall_trace_exit() in el0_svc_common()
could not be inlined, so "no longer inlined" doesn't seem to be accurate.

> syscall_exit_work(), and it has 2.6% performance uplift on perf bench
> basic syscall on kunpeng920 as below.

That seems strange. syscall_exit_work() is only called if some flag in
SYSCALL_WORK_EXIT is set, which means that we're doing something special
like tracing. That shouldn't be the case when running a simple perf
bench syscall.

Also worth nothing that its counterpart (syscall_trace_enter())) is not
currently inlined, the asymmetry would have to be justified.

>     | Metric     | W/O this patch | With this patch | Change    |
>     | ---------- | -------------- | --------------- | --------- |
>     | Total time | 2.171 [sec]    | 2.114 [sec]     |  ↓2.6%    |
>     | usecs/op   | 0.217192       | 0.211453        |  ↓2.6%    |
>     | ops/sec    | 4,604,225      | 4,729,178       |  ↑2.7%    |
>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
>  include/linux/entry-common.h  | 63 ++++++++++++++++++++++++++++++++++-
>  kernel/entry/syscall-common.c | 59 ++------------------------------

These changes are purely generic, surely all architectures using
GENERIC_ENTRY should get similar benefits (assuming LTO isn't used)?

>  2 files changed, 64 insertions(+), 58 deletions(-)
>
> diff --git a/include/linux/entry-common.h b/include/linux/entry-common.h
> index cd6dacb2d8bf..2f84377fb016 100644
> --- a/include/linux/entry-common.h
> +++ b/include/linux/entry-common.h
> @@ -2,6 +2,7 @@
>  #ifndef __LINUX_ENTRYCOMMON_H
>  #define __LINUX_ENTRYCOMMON_H
>  
> +#include <linux/audit.h>
>  #include <linux/irq-entry-common.h>
>  #include <linux/ptrace.h>
>  #include <linux/seccomp.h>
> @@ -128,6 +129,41 @@ static __always_inline long syscall_enter_from_user_mode(struct pt_regs *regs, l
>  	return ret;
>  }
>  
> +/*
> + * If SYSCALL_EMU is set, then the only reason to report is when
> + * SINGLESTEP is set (i.e. PTRACE_SYSEMU_SINGLESTEP).  This syscall
> + * instruction has been already reported in syscall_enter_from_user_mode().
> + */
> +static __always_inline bool report_single_step(unsigned long work)
> +{
> +	if (work & SYSCALL_WORK_SYSCALL_EMU)
> +		return false;
> +
> +	return work & SYSCALL_WORK_SYSCALL_EXIT_TRAP;
> +}
> +
> +/**
> + * arch_ptrace_report_syscall_exit - Architecture specific
> + *				     ptrace_report_syscall_exit.
> + *
> + * Invoked from syscall_exit_work() to wrap ptrace_report_syscall_exit().
> + *
> + * The main purpose is to support arch-specific ptrace_report_syscall_exit
> + * implementation.
> + */
> +static __always_inline void arch_ptrace_report_syscall_exit(struct pt_regs *regs,
> +							    int step);
> +
> +#ifndef arch_ptrace_report_syscall_exit
> +static __always_inline void arch_ptrace_report_syscall_exit(struct pt_regs *regs,
> +							    int step)
> +{
> +	ptrace_report_syscall_exit(regs, step);
> +}
> +#endif

If we want syscall_exit_work() to be inline, then why would we define
this hook in syscall-common.c in patch 12? Might as well define both
hooks in entry-common.h right away and avoid some noise here.

- Kevin

> [...]

