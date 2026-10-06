Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF99CCA5FFC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 17:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WlOvKCLQ6DzAGYFVTM/1xQte9uvosH8fvN2hHk710O4=; b=UP/4XXPYTydCpu
	pHGmwii28+fJHLDjFbV+DNHfhm6syG4Q2j/eRMVG5bGJr4pjl1cNIVzFPpPCT+ex3n7RlVL5MhuTq
	uCtmTvtZk7Zh7y1RFDiXRvrcS3/ji70GhFnnasWpTbn2/8DHSQ0jDu0lpueBLSINwuawQi6DdwVJB
	XqNSd5b2oGqoBT4j9ZNOR6CjuGddO40QFHUVXz9hmNr8OgsceWc437RwrXKHPz9Q6MavnRbn3Zri9
	ybmAv4JeqQGpjlbdIz5UseOESG/4goodDLzBhYc2HQFPVJ7T6UjYUL7NSDV59zrdYZW/GE8pQa0C6
	dDjiYh4In3/lnaBaV5fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE8no-00000001CUg-033f;
	Tue, 06 Oct 2026 17:18:08 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE8nl-00000001CU3-2Md3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 17:18:07 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C63CC1516;
	Tue,  6 Oct 2026 10:17:58 -0700 (PDT)
Received: from [10.2.213.24] (e137867.arm.com [10.2.213.24])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0E0883F763;
	Tue,  6 Oct 2026 10:17:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791307082; bh=ldhidRQkpbXIfBHpxregDRh7fkE0mKVToAxs/apJWsk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ABNIjXMk/egPevczmKqd/PHJ8uZgO+6b/7Hi9v0ZrE05RS4vB03gBVFFwCnm3fBuI
	 mDnZXcYKjRQciMKu6qGeaLmJXkhiq0B43HorYKsVkusdl8UUydCqUOAOAPJAuPj5Xc
	 1Agf9kFu/a8qDLvNBdPLXLGPNz8iqtV6BfRHX2IQ=
Message-ID: <fd405cda-51bd-4b1c-803c-f2597b2b128e@arm.com>
Date: Tue, 6 Oct 2026 18:17:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] ARM, ARM64, LONGARCH, XTENSA: Delay HW BP notification
 to task_work()
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rt-devel@lists.linux.dev, linux-perf-users@vger.kernel.org,
 loongarch@lists.linux.dev
References: <20261001143516.Ew8C97WS@linutronix.de>
From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Content-Language: en-US, en-GB, fr
Organization: Arm Ltd.
In-Reply-To: <20261001143516.Ew8C97WS@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_101805_703222_D6A9853C 
X-CRM114-Status: GOOD (  43.15  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Ian Rogers <irogers@google.com>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Catalin Marinas <catalin.marinas@arm.com>, Oleg Nesterov <oleg@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>, WANG Xuerui <kernel@xen0n.name>, Will Deacon <will@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, Russell King <linux@armlinux.org.uk>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Waiman Long <longman@redhat.com>, Clark Williams <clrkwllms@kernel.org>, "Luis Claudio R. Goncalves" <lgoncalv@redhat.com>, James Clark <james.clark@linaro.org>, Steven Rostedt <rostedt@goodmis.org>, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Chris Zankel <chris@zankel.net>, Linus Walleij <linusw@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, Jiri Olsa <jolsa@kernel.org>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi Sebastian,

Sorry for the long wait, finally taking a look at this !
(+Linus Walleij for the `arch/arm/` side)

On 01/10/2026 15:35, Sebastian Andrzej Siewior wrote:
> Waiman, Luis, Ada reported that HW breakpoints on ARM64 trigger
> "sleeping while atomic" warnings on PREEMPT_RT. The hardware event is
> delivered with disabled interrupts and perf intrastrucure expects
> disabled interrupts while the overflow callback is invoked.
>
> The callback then sends a SIGTRAP signal for which it acquires
> sighand_struct::siglock, a spinlock_t which becomes a sleeping lock and
> must not be acquired in atomic context.
>
> Delay the event callback until the return to userland.
> Add perf_arch_hwbp_notify(), a generic perf callback which delayes the
> actual callback invocation to task_work_add() callback. This callback
> invokes the architecture defines callback arch_hwbp_send_sig().
Typo : `[...] architecture defined [...]`
> This requires struct callback_head and the functions require
> ARCH_NEED_PERF_HW_NOTIF to be defined.
>
> This was reported against ARM64. ARM, LongARCH and Xtensa follow the
> same pattern are also converted. Xtensa is the only not supporting
> PREEMPT_RT but now we have all architectures using the same pattern.
>
> Reported-by: Luis Claudio R. Goncalves <lgoncalv@redhat.com>
> Reported-by: Waiman Long <longman@redhat.com>
> Closes: https://lore.kernel.org/all/aho0eqjMESuHxECr@redhat.com/
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> ---
>
> v2…v3: https://lore.kernel.org/all/20260814085118.OPEA_Ssn@linutronix.de/
>   - Add Xtensa for completion
>   - sashiko complains and wants TWA_SIGNAL instead TWA_RESUME. His
>     argument is that a syscall will trap via get_user() and loop forever
>     instead making progress. This is wrong IMHO. ARM64 will single step
>     over the watchpoint and continue execution. The only downside is that
>     userland will get notified after the syscall completed. So my theory.
>     Using TWA_SIGNAL is worse: Assume we have a watchpoint on UADDR and
>     are in a futex() syscall. The get_user() invocation will trigger the
>     exception, the debug handler will step over and queue a signal. The
>     futex code will notice this and return ERESTARTNOINTR. A signal will
>     be sent, the syscall restarts, traps onto UADDR again, the loop
>     continues. But this should be case now, too…
>     Now that I look into arch_build_bp_info() and do actual testing I must
>     say arm64 does not support mixed breakpoints. This means there is no
>     breakpoint in kernel on a userland address. \o/

For the record, the comment on `task_work_add()` reads :
> @TWA_SIGNAL works like signals, in that the it will interrupt the targeted
> task and run the task_work, regardless of whether the task is currently
> running in the kernel or userspace.
> [...]
> @TWA_RESUME work is run only when the task exits the kernel and returns to
> user mode, or before entering guest mode.

At least on arm64, we are explicitly not preemptible while handling
hardware breakpoint/watchpoint exceptions. (See `debug_exception_enter()`
in `arch/arm64/kernel/entry-common.c`). So `TWA_RESUME` is definitely
the behaviour we want in my opinion.

>
> v1…v2: https://lore.kernel.org/all/20260713144939.FuCj9yvZ@linutronix.de/
>   - sashiko complained that a memory breakpoint might trigger several
>     times before a signal is sent if the syscall touches the memory (via
>     get_user()) more than once before returning back. This would lead to
>     list corruption in task_work_add(). To handle this, there is now a
>     variable which is set via xchg before task_work_add() and cleared
>     after the signal has been sent.
>
>   arch/arm/include/asm/hw_breakpoint.h       |  1 +
>   arch/arm/kernel/ptrace.c                   |  6 ++---
>   arch/arm64/include/asm/hw_breakpoint.h     |  1 +
>   arch/arm64/kernel/ptrace.c                 |  6 ++---
>   arch/loongarch/include/asm/hw_breakpoint.h |  1 +
>   arch/loongarch/kernel/ptrace.c             |  6 ++---
>   arch/xtensa/include/asm/hw_breakpoint.h    |  1 +
>   arch/xtensa/kernel/ptrace.c                |  6 ++---
>   include/linux/hw_breakpoint.h              |  3 +++
>   include/linux/perf_event.h                 |  4 ++++
>   kernel/events/core.c                       | 26 ++++++++++++++++++++++
>   11 files changed, 45 insertions(+), 16 deletions(-)
>
> [...]
>
> diff --git a/include/linux/perf_event.h b/include/linux/perf_event.h
> index 915c6fd3f0845..4e0cea7f59e4c 100644
> --- a/include/linux/perf_event.h
> +++ b/include/linux/perf_event.h
> @@ -215,6 +215,10 @@ struct hw_perf_event {
>   
>   	/* Last sync'ed generation of filters */
>   	unsigned long			addr_filters_gen;
> +#ifdef ARCH_NEED_PERF_HW_NOTIF
> +	struct callback_head		arch_hw_notif;
> +	int				arch_hw_notif_busy;
> +#endif
>   
>   /*
>    * hw_perf_event::state flags; used to track the PERF_EF_* state.
> diff --git a/kernel/events/core.c b/kernel/events/core.c
> index 634d2ccbab82d..9b38a14880361 100644
> --- a/kernel/events/core.c
> +++ b/kernel/events/core.c
> @@ -13381,6 +13381,28 @@ static void account_event(struct perf_event *event)
>   	account_pmu_sb_event(event);
>   }
>   
> +#ifdef ARCH_NEED_PERF_HW_NOTIF
> +static void perf_arch_hwbp_send_sig(struct callback_head *head)
> +{
> +	struct perf_event *bp;
> +
> +	bp = container_of(head, struct perf_event, hw.arch_hw_notif);
> +	arch_hwbp_send_sig(bp);
> +	xchg_relaxed(&bp->hw.arch_hw_notif_busy, 0);
> +	put_event(bp);
> +}
> +
> +void perf_arch_hwbp_notify(struct perf_event *bp, struct perf_sample_data *data,
> +			   struct pt_regs *regs)
> +{
> +	if (WARN_ON_ONCE(!atomic_long_inc_not_zero(&bp->refcount)))
> +		return;
> +	if (xchg_relaxed(&bp->hw.arch_hw_notif_busy, 1) ||
> +	    WARN_ON_ONCE(task_work_add(current, &bp->hw.arch_hw_notif, TWA_RESUME)))
> +		put_event(bp);
> +}
> +#endif

I find the function names a bit counter-intuitive, compared to the other
arch-specific perf functions.
Given the name `perf_arch_...`, I would have expected them to be defined
in arch code, rather than in the generic perf code.
 From what I can see, usually perf functions calling an arch-specific
function lack the `_arch_` infix of their `arch_` counterpart.

I do not know very well what we expect in perf, so I might be off-base,
but would calling them `perf_hwbp_send_sig()` and `perf_hwbp_notify()`
make sense ?


Otherwise, it looks good to me on the arm64 side !
I had a look on the arm side as well, given the debug handling architecture
is similar, and I think it is OK on there as well, though I wouldn't mind
a more experienced arm review :)

Reviewed-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>

I also tested the patch with pNMI and CONFIG_PREEMPT_RT on arm64 : I can
confirm that the atomic sleep warning is gone and everything works
as expected !

Tested-by: Ada Couprie Diaz <ada.coupriediaz@arm.com> (arm64)

Thanks a lot for looking into this, combined with[0] the hardware debug
handling should be much cleaner ! :)
Kind regards,
Ada

[0]: https://lore.kernel.org/r/20260907163101.131569-1-ada.coupriediaz@arm.com


