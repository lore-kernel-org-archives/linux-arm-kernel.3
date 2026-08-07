Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 162AFC5AC7A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 18:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:Reply-To:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:To:From:
	Date:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2JNym8hvpmaG5EXMxvJb/6Eqk3r61YHmAwcMvDGB21c=; b=L/TO4/pbssK+8YQM6ZR/qfbZpT
	+4YtFq+30eMhI2drHVtl2tu33PnxE2dzjOmykyhsbw0tL/6xxW8FYwKb/1euDHxGBmM+vKg0wMCdP
	GBdeahQV39PfnG27Jd2ur5mJebPfdUobIr2tICN/xjVA+cc32ak1QAnLRjL/Qxo9YQ853/ut+VW9g
	FKqa3wHcjj3FTubtmjO1SGZhnCvZ6vmNLJlxnTmN0InSKgmF2fI5GfdXfGwnYzKd5BqZheCpx/TzP
	J0BzG6cnbGEIlUR7JY6fjRRzO7BKIsGfqOQmUgJ9O4yUjg8i4a8Zcnc/sK3Vf/LnE1fGFzVBiuPkk
	2E9P4V9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsPYx-00000008cm7-2hXo;
	Fri, 07 Aug 2026 18:44:59 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsPYv-00000008cls-3aBT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 18:44:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0F8D9600B0;
	Fri,  7 Aug 2026 18:44:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB1CA1F000E9;
	Fri,  7 Aug 2026 18:44:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786128296;
	bh=2JNym8hvpmaG5EXMxvJb/6Eqk3r61YHmAwcMvDGB21c=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To;
	b=PYTZU5jpV4NJlgJ2LR4U/u0T7JnEzpw9OAAOX897A0ZAEyBq3hPqDyKjcFrgshBlo
	 gyZZa7E+OAuS3oKcSidykeXRgl/pc0piJTTMVopDavXCU3DL/tIYWpsRn3elF0sszk
	 YpWeu5qoagc1G8oTZqqsN9HsFP2kcZ1lrj3wQljNVjZ9/qB0O7EOZaPb2WxLuBcEcw
	 ocmGrGMUC9YFYD/Y/bbHjXKgAPT5HNOMFarJbAfJGQQrNaVextw61b1XS76SJ8Ui5M
	 1igToGe5guUj4iS/2zsSpJt+PkDkErK26gcGSe7IhuRCiHGLkKRhLJlI339+1xmJAM
	 wfYPrgOEXq1JA==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 7F188CE1A04; Fri,  7 Aug 2026 11:44:56 -0700 (PDT)
Date: Fri, 7 Aug 2026 11:44:56 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Marco Elver <elver@google.com>
Subject: Re: [PATCH RFC] arm64: Mark set_preempt_need_resched() access to
 .need_resched
Message-ID: <5c607693-7fce-4b24-a648-95ab96db6691@paulmck-laptop>
References: <d345dc9f-c61e-4db5-a342-11b0ff3fb846@paulmck-laptop>
 <amyaRXx8zXxOMgTL@J2N7QTR9R3>
 <13df4ff4-8594-4c37-b25f-860248a222cf@paulmck-laptop>
 <4fa802e7-6cfc-4cce-afee-c29b28171ad3@paulmck-laptop>
 <anR28GyRtCpApQYX@willie-the-truck>
 <ca54b283-3349-43d4-9460-32b084709d67@paulmck-laptop>
 <anXKRdA9sUziFda5@willie-the-truck>
 <CANpmjNPCM0NV1EN2pNBf3EBBk8eLjbGGAiZ_+rJkoROJtG3jFQ@mail.gmail.com>
 <anXbTwhaWZCIxxTg@willie-the-truck>
 <anXheKZ7zKNw1oD_@elver.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <anXheKZ7zKNw1oD_@elver.google.com>
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
Reply-To: paulmck@kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, "Peter Zijlstra \(Intel\)" <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, Jinjie Ruan <ruanjinjie@huawei.com>, linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, linux-arm-kernel@lists.infradead.org, Will Deacon <will@kernel.org>, dvyukov@google.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Fri, Aug 07, 2026 at 01:45:28PM +0000, Marco Elver wrote:
> On Fri, Aug 07, 2026 at 02:19PM +0100, Will Deacon wrote:
> [...]
> > Ok, but then I don't understand how these accesses can race. They appear
> > to be on the same CPU, in the same IPI handler.
> 
> The only way this could happen is with an NMI, but that's not the case
> here? I should have looked at the 2nd stack trace, and it seems to be
> clear that this is a false positive: KCSAN sets up a watchpoint on an
> address that is also accessed by __delay.
> 
> One problem with disabling KCSAN in this CPU's context is that we'd fail
> to detect data races from nested interrupts.
> 
> So yes, the best way forward is to disable KCSAN in the delay
> implementation. And I recall doing this for x86, which has this:
> 
> 	[arch/x86/lib/Makefile]
> 	...
> 
> 	# KCSAN uses udelay for introducing watchpoint delay; avoid recursion.
> 	KCSAN_SANITIZE_delay.o := n
> 
> So let's do this for arm64, too. Sorry for the noise.

Thank you both!

I will revert my arm64-specific patch and apply this one.  Testing will
take some time, and I will get you know how it goes.

							Thanx, Paul

> ------ >8 ------
> 
> >From cfea3a0c12b2e685ce04c28b1bd207f0e4c05a56 Mon Sep 17 00:00:00 2001
> From: Marco Elver <elver@google.com>
> Date: Fri, 7 Aug 2026 13:37:32 +0000
> Subject: [PATCH] arm64: Disable KCSAN instrumentation in delay.o
> 
> KCSAN relies on udelay() for injecting delays. To avoid recursively
> triggering a watchpoint, where KCSAN sets up watchpoint on an address
> that is accessed by udelay() in the same thread, disable instrumentation
> in arm64's delay implementation.
> 
> Paul found a manifestation of this as follows:
> 
> | BUG: KCSAN: data-race in __delay / set_need_resched_current
> |
> | read (marked) to 0xffff000005899b48 of 8 bytes by interrupt on cpu 8:
> |  __delay+0xb0/0x378
> |  __udelay+0x4c/0x60
> |  kcsan_setup_watchpoint+0x3b4/0x820
> |  __tsan_unaligned_write4+0x228/0x26c
> |  set_need_resched_current+0x138/0x1a8
> |  rcu_exp_handler+0x418/0x4a0
> |  __flush_smp_call_function_queue+0x36c/0x4a0
> |  generic_smp_call_function_single_interrupt+0x20/0x30
> |  ipi_handler+0xec/0x558
> |  handle_percpu_devid_irq+0x220/0x2a0
> |  generic_handle_domain_irq+0x84/0xb4
> |  gic_handle_irq+0x64/0x144
> |  call_on_irq_stack+0x30/0x48
> |  do_interrupt_handler+0x80/0xb8
> |  el1_interrupt+0x3c/0x60
> |  el1h_64_irq_handler+0x18/0x24
> |  el1h_64_irq+0x6c/0x70
> |  smp_call_function_single+0x18c/0x25c
> |  sync_rcu_exp_select_node_cpus+0x534/0x8bc
> |  rcu_exp_sel_wait_wake+0x358/0xef4
> |  wait_rcu_exp_gp+0x30/0x44
> |  kthread_worker_fn+0x1b4/0x5dc
> |  kthread+0x1d8/0x204
> |  ret_from_fork+0x10/0x20
> |
> | write to 0xffff000005899b4c of 4 bytes by interrupt on cpu 8:
> |  set_need_resched_current+0x138/0x1a8
> |  [...]
> 
> This matches what is already done in arch/x86/lib/Makefile.
> 
> Reported-by: "Paul E. McKenney" <paulmck@kernel.org>
> Fixes: dd03762ab608 ("arm64: Enable KCSAN")
> Signed-off-by: Marco Elver <elver@google.com>
> ---
>  arch/arm64/lib/Makefile | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm64/lib/Makefile b/arch/arm64/lib/Makefile
> index 448c917494f3..b33e1ca4a781 100644
> --- a/arch/arm64/lib/Makefile
> +++ b/arch/arm64/lib/Makefile
> @@ -1,4 +1,8 @@
>  # SPDX-License-Identifier: GPL-2.0
> +
> +# KCSAN uses udelay for introducing watchpoint delay; avoid recursion.
> +KCSAN_SANITIZE_delay.o := n
> +
>  lib-y		:= clear_user.o delay.o copy_from_user.o		\
>  		   copy_to_user.o copy_page.o				\
>  		   clear_page.o csum.o insn.o memchr.o memcpy.o		\
> -- 
> 2.55.0.654.g21b8a5bc05-goog
> 

