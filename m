Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40293CCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 15:42:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:References:In-Reply-To:Message-Id:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=padiHrIhpJH3LjeK8yDivxE5Lt6NfOacxMpIG0XUyV0=; b=cfJFbA08kn21qJ5Y2JBu7cydZ+
	A2FJcGyp4Fvml8Og38AvO+goGzGxdB8kPez501wzRiCtJh8zB++1w83pT9qZpTebPTjCJGh4kQceB
	YRboMBsYO8sDz+5jHmHrB8iMQx7gjCNYk5YOiId+rNzk4JMnDrjXPzO0nQANFIF1BRhSYTosvpgKc
	AlPgTw/lZ0oCVKuWnNPms3b2Ph7AeZl5gERQhHT8JqLfRreGWCPCD8AjCCVNSyfGAe4onwSqoni/y
	Z9TePYYp+U+FbjH4mltjQiRwT6xtw/NClgyAPxlbDrIJrtiqqyxc+/bJzL+LQ+CCHzDWgRFvs8lXX
	Ov60+4eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDlq9-0000000GCnS-3EYa;
	Tue, 28 Oct 2025 15:42:29 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDlq6-0000000GClr-4BMG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Oct 2025 15:42:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6C59A43610;
	Tue, 28 Oct 2025 15:42:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E1BFC4CEE7;
	Tue, 28 Oct 2025 15:42:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761666146;
	bh=cTwXXNk/yazHQqObZ+jp4ZVZEgnfPcH4tyN7EE1hfbc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=CBSqhqpiDvSVCBoorZfiWuqmKKOLf3RbBbvI/0ey2715+0aQIozCPcM6PtfsgkyUC
	 Eo09m6w1VxzOLe4xj6zyETxQdPM8ZjHmRvDpPwUHN9yg6sbpY4qArB5Lvn/r02sE/5
	 bwtxn6So0kb4uRlvXWbR5ar7ByHanVxjiObqLj1b2D2xxZAtxdawfZ739O1lTIYV/R
	 crboLtqB/j9E9Qzb0OfsmsjDnPUBs+ypg6wiVZ3h0PJuvqSEghkyaXSTQvBkQyJNV+
	 OFe5JcXnfCD6KoNqOJKDNZk4i2Ityaj6rYLPVQ8z5+MqW97oshY+RUqFZJtuCtp/Vk
	 IBL5L5rVrfKzw==
Date: Wed, 29 Oct 2025 00:42:19 +0900
From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
To: Masami Hiramatsu (Google) <mhiramat@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon
 <will@kernel.org>, Mark Brown <broonie@kernel.org>, Steven Rostedt
 <rostedt@goodmis.org>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar
 <mingo@kernel.org>, x86@kernel.org, Jinchao Wang
 <wangjinchao600@gmail.com>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, Thomas Gleixner <tglx@linutronix.de>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H . Peter Anvin" <hpa@zytor.com>, Alexander Shishkin
 <alexander.shishkin@linux.intel.com>, Ian Rogers <irogers@google.com>,
 linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-perf-users@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Aishwarya.TCV@arm.com
Subject: Re: [PATCH v5 6/8] selftests: tracing: Add a basic testcase for
 wprobe
Message-Id: <20251029004219.dc9cda0eb56ae46c55855844@kernel.org>
In-Reply-To: <20251028105549.ae94e8eeb42f4efc183d2807@kernel.org>
References: <175859019940.374439.7398451124225791618.stgit@devnote2>
	<175859026716.374439.14852239332989324292.stgit@devnote2>
	<aPvwGhMBJqMKcC9D@finisterre.sirena.org.uk>
	<20251027224347.4c887cc956df63602f377550@kernel.org>
	<20251028084222.a3c1ae97d125d9bd88fc565b@kernel.org>
	<20251028105549.ae94e8eeb42f4efc183d2807@kernel.org>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_084227_079430_1B34DCCC 
X-CRM114-Status: GOOD (  24.52  )
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

On Tue, 28 Oct 2025 10:55:49 +0900
Masami Hiramatsu (Google) <mhiramat@kernel.org> wrote:

> On Tue, 28 Oct 2025 08:42:22 +0900
> Masami Hiramatsu (Google) <mhiramat@kernel.org> wrote:
> 
> > ~ # cd /sys/kernel/tracing/
> > /sys/kernel/tracing # echo 'w:my_wprobe w@jiffies' >> dynamic_events 
> > /sys/kernel/tracing # echo 1 > events/wprobes/my_wprobe/enable 
> > [   54.942288] trace_wprobe: enable_trace_wprobe called
> > [   54.945306] trace_wprobe: trying to register wprobes
> > [   54.947367] trace_wprobe: __register_trace_wprobe called
> > [   54.949586] trace_wprobe: registering wprobe at addr: 0xffffb6ce429fb200, len: 4, type: 2
> > [   54.951639] Creating wide hw breakpoint on CPU 0
> > [   54.966390] Creating kernel counter on CPU 0 for event type 5
> > [   54.967758] perf_install_in_context: event 00000000736da1d9 ctx 000000005d4db900 cpu 0
> > [   54.972015] perf_install_in_context2: event 00000000736da1d9 ctx set to 000000005d4db900
> > [   54.976697] cpu_function_call: calling function on CPU 0, func: __perf_install_in_context+0x0/0x2c8
> > 
> > What happen if the cpu calls function on itself by
> > smp_call_function_single() on arm64?
> > 
> >   smp_call_function_single(this_cpu, remote_function, &data, 1);
> 
> Sorry, that was printk buffering issue. I used trace_printk() instead
> and persistent ring buffer[1] to trace it.
> 
> [1] https://docs.kernel.org/trace/debugging.html#persistent-buffers-across-boots
> 
> ~ # echo 1 > /sys/kernel/tracing/instances/boot_map/options/trace_printk_dest
> ~ # echo 'w:my_wprobe w@jiffies' >> /sys/kernel/tracing/dynamic_events 
> ~ # echo 1 > /sys/kernel/tracing/events/wprobes/my_wprobe/enable 
> QEMU 8.2.2 monitor - type 'help' for more information
> (qemu) system_reset
> ...
> 
> ~ # cat /sys/kernel/tracing/instances/boot_map/trace 
> # tracer: nop
> #
> # entries-in-buffer/entries-written: 16/16   #P:1
> #
> #                                _-----=> irqs-off/BH-disabled
> #                               / _----=> need-resched
> #                              | / _---=> hardirq/softirq
> #                              || / _--=> preempt-depth
> #                              ||| / _-=> migrate-disable
> #                              |||| /     delay
> #           TASK-PID     CPU#  |||||  TIMESTAMP  FUNCTION
> #              | |         |   |||||     |         |
>            <...>-63      [000] .....    21.065038: register_wide_hw_breakpoint: Creating wide hw breakpoint on CPU 0
>            <...>-63      [000] .....    21.079678: perf_event_create_kernel_counter: Creating kernel counter on CPU 0 for event type 5
>            <...>-63      [000] .....    21.080051: perf_install_in_context: perf_install_in_context: event 000000000b3ac4d3 ctx 00000000097d6337 cpu 0
>            <...>-63      [000] .....    21.080140: perf_install_in_context: perf_install_in_context2: event 000000000b3ac4d3 ctx set to 00000000097d6337
>            <...>-63      [000] .....    21.080939: cpu_function_call: cpu_function_call: calling function on CPU 0, func: __perf_install_in_context+0x0/0x2f0
>            <...>-63      [000] .....    21.080966: smp_call_function_single: smp_call_function_single: calling function on CPU 0, func: remote_function+0x0/0x78, wait=1
>            <...>-63      [000] ...1.    21.080973: smp_call_function_single: smp_call_function_single: running on CPU 0, call CPU 0
>            <...>-63      [000] ...1.    21.081099: smp_call_function_single: smp_call_function_single: checking for potential deadlock conditions
>            <...>-63      [000] ...1.    21.081259: generic_exec_single: generic_exec_single: preparing to call function on CPU 0, func: remote_function+0x0/0x78
>            <...>-63      [000] ...1.    21.081269: generic_exec_single: Executing smp_call_function_single on self CPU 0, func: remote_function+0x0/0x78
>            <...>-63      [000] d..1.    21.081289: csd_do_func: csd_do_func: CPU 0 executing func remote_function+0x0/0x78
>            <...>-63      [000] d..1.    21.081429: __perf_install_in_context: __perf_install_in_context: event 000000000b3ac4d3 ctx 00000000097d6337
>            <...>-63      [000] d..2.    21.083211: hw_breakpoint_control: hw_breakpoint_control: ops=0
>            <...>-63      [000] d..1.    21.084191: __perf_install_in_context: __perf_install_in_context: event 000000000b3ac4d3 done, ret=0
>            <...>-63      [000] d..1.    21.084237: csd_do_func: csd_do_func: CPU 0 finished func remote_function+0x0/0x78
>            <...>-63      [000] d..1.    21.084243: generic_exec_single: Finished csd_lock_record(NULL)
> ~ # 
> 
> 
> So the last message is right before the local_irq_restore() in
> generic_exec_single().
> 
> static int generic_exec_single(int cpu, call_single_data_t *csd)
> {
> 	...
> 		csd_lock_record(csd);
> 		csd_unlock(csd);
> 		local_irq_save(flags);
> 		csd_do_func(func, info, NULL);
> 		csd_lock_record(NULL);
> 		trace_printk("Finished csd_lock_record(NULL)\n"); <- 
> 		local_irq_restore(flags);
> 		return 0;
> 
> Actually, I added another trace_printk() right after generic_exec_single().
> 
> 	err = generic_exec_single(cpu, csd);
> 	trace_printk("generic_exec_single returned %d for CPU %d, func: %pS\n",
> 		err, cpu, func);
> 
> This means after setting the hw_breakpoint, when enabing the IRQ,
> the machine is frozen - but qemu is running busy.
> 
> Can we specify the kernel memory address to HW breakpoint on arm64?

Hmm, it seems that jiffies related things are updated frequently
and it may cause interrupt storm or infinit recursive call.

Basically, I think it should be temporarily disabled so that the
interrupt does not occur during the extension of the HWBP interrupt,
but I wonder how this works in arm64?

If you know the path, you may be able to prohibit access to the
related variables. But that maybe more difficult than SWBP like
kprobes. Maybe this should add at least taint flag.

Thank you,

> 
> Thank you,
> -- 
> Masami Hiramatsu (Google) <mhiramat@kernel.org>


-- 
Masami Hiramatsu (Google) <mhiramat@kernel.org>

