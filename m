Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6053C55173
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 18:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:Reply-To:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:To:From:
	Date:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VY0MSaV3PofK/ZpiBnnhgDYItAmKtwQIdDAPUmiK8iM=; b=mjbOUeRLigImtNQVUOtiGYIr77
	5hvTRC60IouHWdYWEhHauHtbnKqFRsIfQrWW7+WeORtTT1RTLVAH35QEAm3B2290jgTkjM3u8GLfL
	0gy4K75gObOeqaMxVNvwdhL+C2ZD6FbfK+JJgr4u09Pi1CjBaspt4DSQxe7Q2hSnQxEwcyEGNfzce
	Nm4iCUGAFpufNJxz89zPvutMhPUsF8fPJ0nt9ACbBK5CGR27fqItxXu/GXvKaG3R9yxXbhr4OWRKz
	MMAQl7kp/5xKgjEknNZ87LazAt+q5PHWsY5WfuE5XGGmY9e48du/sNzGlwacP/Z3P+Ym3TzMBkuw+
	ru3rxBcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wps8b-0000000DObR-2oHa;
	Fri, 31 Jul 2026 18:39:17 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wps8Z-0000000DOaq-2lmE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jul 2026 18:39:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 650294030B;
	Fri, 31 Jul 2026 18:39:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47E9F1F00AC4;
	Fri, 31 Jul 2026 18:39:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785523155;
	bh=VY0MSaV3PofK/ZpiBnnhgDYItAmKtwQIdDAPUmiK8iM=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To;
	b=PFYk1BU2q0dCBL0ecWw9YLQAXB5OxBx7/AXXGILd7YITVeQu28Um9ihq5CtCnQgA7
	 VD0uljKtopdObBdZGEm2ytg6E1nE9S9kR7PijcQGmtZpcilCejVdLt89Fu+rgE37Z4
	 WpEGFJEi/WgF4TtbjssL1AQJf6RvqdZlpt+4hQ+dC+cNM7X9IYCvZZsJBYWAr1oQnp
	 1roHUcsnxLFkue/7gBlXgyVVmPxuV8VBih89bAQj+pNXRWOmx5tYcXggKrBCGimRRW
	 RzLQg73Y4WZjjN75PGkqbw4h+NWnC3QIEhMUPIAqDHIVRSJI06bo2ywWwyXM4djFIF
	 +NTsLb+3R6+Qg==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id F0BD0CE11BE; Fri, 31 Jul 2026 11:39:14 -0700 (PDT)
Date: Fri, 31 Jul 2026 11:39:14 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH RFC] arm64: Mark set_preempt_need_resched() access to
 .need_resched
Message-ID: <4fa802e7-6cfc-4cce-afee-c29b28171ad3@paulmck-laptop>
References: <d345dc9f-c61e-4db5-a342-11b0ff3fb846@paulmck-laptop>
 <amyaRXx8zXxOMgTL@J2N7QTR9R3>
 <13df4ff4-8594-4c37-b25f-860248a222cf@paulmck-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <13df4ff4-8594-4c37-b25f-860248a222cf@paulmck-laptop>
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
Cc: "Peter Zijlstra \(Intel\)" <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, Jinjie Ruan <ruanjinjie@huawei.com>, linux-kernel@vger.kernel.org, Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Fri, Jul 31, 2026 at 09:44:16AM -0700, Paul E. McKenney wrote:
> On Fri, Jul 31, 2026 at 01:51:26PM +0100, Mark Rutland wrote:
> > Hi Paul,
> > 
> > On Thu, Jul 30, 2026 at 04:59:57PM -0700, Paul E. McKenney wrote:
> > > The .need_resched field can be accessed from both task level and
> > > from interrrupt handlers, so apply WRITE_ONCE() to the update in
> > > set_preempt_need_resched().  This also brings arm64 in line with s390
> > > (which uses atomic operations) and x86 (which uses inline assembly).
> > > Other architectures avoid this issue via the empty definition in
> > > include/asm-generic/preempt.h.
> > > 
> > > KCSAN located this issue.
> > 
> > Do you have the KCSAN splat to hand? Seeing the exact race (and the
> > relevant reader(s)) would be handy.
> > 
> > > Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
> > > Cc: Catalin Marinas <catalin.marinas@arm.com>
> > > Cc: Will Deacon <will@kernel.org>
> > > Cc: Jinjie Ruan <ruanjinjie@huawei.com>
> > > Cc: Ada Couprie Diaz <ada.coupriediaz@arm.com>
> > > Cc: <linux-arm-kernel@lists.infradead.org>
> > > 
> > > ---
> > >  preempt.h |    2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/arch/arm64/include/asm/preempt.h b/arch/arm64/include/asm/preempt.h
> > > index 932ea4b6204289..610853da140a78 100644
> > > --- a/arch/arm64/include/asm/preempt.h
> > > +++ b/arch/arm64/include/asm/preempt.h
> > > @@ -28,7 +28,7 @@ static inline void preempt_count_set(u64 pc)
> > >  
> > >  static inline void set_preempt_need_resched(void)
> > >  {
> > > -	current_thread_info()->preempt.need_resched = 0;
> > > +	WRITE_ONCE(current_thread_info()->preempt.need_resched, 0);
> > >  }
> > 
> > I was under the impression that we only used this in a context where we
> > couldn't have a nested writer (e.g. within a scheduler IRQ hook, with
> > IRQs disabled).
> > 
> > If we have concurrent writers, this is probably broken regardless of
> > whether it is single-copy-atomic, and I worry WRITE_ONCE() will mask a
> > bug.
> > 
> > If you can share the KCSAN splat, that'd really help.
> 
> Let me regenerate it...

And please see below.

> > I think we need READ_ONCE() in test_preempt_need_resched(), but today
> > that's only used by tracing to determine what to log.
> 
> I do have tracing enabled on some of my runs.

I did build with CONFIG_TRACEPOINTS=y.  Or let me know what sort of tracing
you are interested in.  Or I can send you this guy from my ARM test system:

tools/testing/selftests/rcutorture/res/2026.07.31-10.25.08-torture/results-rcutorture-kcsan/TREE01/.config

							Thanx, Paul

------------------------------------------------------------------------

[  738.696166] BUG: KCSAN: data-race in __delay / set_need_resched_current
[  738.696184]
[  738.696188] read (marked) to 0xffff000005899b48 of 8 bytes by interrupt on cpu 8:
[  738.696198]  __delay+0xb0/0x378
[  738.696212]  __udelay+0x4c/0x60
[  738.696225]  kcsan_setup_watchpoint+0x3b4/0x820
[  738.696238]  __tsan_unaligned_write4+0x228/0x26c
[  738.696249]  set_need_resched_current+0x138/0x1a8
[  738.696260]  rcu_exp_handler+0x418/0x4a0
[  738.696273]  __flush_smp_call_function_queue+0x36c/0x4a0
[  738.696288]  generic_smp_call_function_single_interrupt+0x20/0x30
[  738.696302]  ipi_handler+0xec/0x558
[  738.696314]  handle_percpu_devid_irq+0x220/0x2a0
[  738.696325]  generic_handle_domain_irq+0x84/0xb4
[  738.696339]  gic_handle_irq+0x64/0x144
[  738.696349]  call_on_irq_stack+0x30/0x48
[  738.696363]  do_interrupt_handler+0x80/0xb8
[  738.696374]  el1_interrupt+0x3c/0x60
[  738.696385]  el1h_64_irq_handler+0x18/0x24
[  738.696397]  el1h_64_irq+0x6c/0x70
[  738.696406]  smp_call_function_single+0x18c/0x25c
[  738.696419]  sync_rcu_exp_select_node_cpus+0x534/0x8bc
[  738.696433]  rcu_exp_sel_wait_wake+0x358/0xef4
[  738.696445]  wait_rcu_exp_gp+0x30/0x44
[  738.696458]  kthread_worker_fn+0x1b4/0x5dc
[  738.696472]  kthread+0x1d8/0x204
[  738.696483]  ret_from_fork+0x10/0x20
[  738.696496]
[  738.696499] write to 0xffff000005899b4c of 4 bytes by interrupt on cpu 8:
[  738.696508]  set_need_resched_current+0x138/0x1a8
[  738.696519]  rcu_exp_handler+0x418/0x4a0
[  738.696532]  __flush_smp_call_function_queue+0x36c/0x4a0
[  738.696545]  generic_smp_call_function_single_interrupt+0x20/0x30
[  738.696559]  ipi_handler+0xec/0x558
[  738.696570]  handle_percpu_devid_irq+0x220/0x2a0
[  738.696580]  generic_handle_domain_irq+0x84/0xb4
[  738.696593]  gic_handle_irq+0x64/0x144
[  738.696602]  call_on_irq_stack+0x30/0x48
[  738.696615]  do_interrupt_handler+0x80/0xb8
[  738.696625]  el1_interrupt+0x3c/0x60
[  738.696636]  el1h_64_irq_handler+0x18/0x24
[  738.696648]  el1h_64_irq+0x6c/0x70
[  738.696657]  smp_call_function_single+0x18c/0x25c
[  738.696670]  sync_rcu_exp_select_node_cpus+0x534/0x8bc
[  738.696684]  rcu_exp_sel_wait_wake+0x358/0xef4
[  738.696696]  wait_rcu_exp_gp+0x30/0x44
[  738.696710]  kthread_worker_fn+0x1b4/0x5dc
[  738.696722]  kthread+0x1d8/0x204
[  738.696735]  ret_from_fork+0x10/0x20
[  738.696748]
[  738.696752] no locks held by rcu_exp_gp_kthr/19.
[  738.696759] irq event stamp: 1427532
[  738.717431] hardirqs last  enabled at (1427531): [<ffffb4646136fbfc>] _raw_spin_unlock_irqrestore+0x48/0xa0
[  738.718368] hardirqs last disabled at (1427532): [<ffffb46461357d80>] el1_interrupt+0x28/0x60
[  738.719022] softirqs last  enabled at (1427262): [<ffffb4645f773ac0>] handle_softirqs+0x508/0x55c
[  738.719776] softirqs last disabled at (1427255): [<ffffb4645f610b4c>] __do_softirq+0x14/0x20
[  738.720431]
[  738.720436] Reported by Kernel Concurrency Sanitizer on:
[  738.720444] CPU: 8 UID: 0 PID: 19 Comm: rcu_exp_gp_kthr Not tainted 7.2.0-rc3-00125-g1a23334a317e #14393 PREEMPT
[  738.720458] Hardware name: linux,dummy-virt (DT)
[  738.720464] ==================================================================

(gdb) l*__delay+0xb0
0xffff800081d11084 is in __delay (./arch/arm64/include/asm/preempt.h:61).
56      }
57
58      static inline bool __preempt_count_dec_and_test(void)
59      {
60              struct thread_info *ti = current_thread_info();
61              u64 pc = READ_ONCE(ti->preempt_count);
62
63              /* Update only the count field, leaving need_resched unchanged */
64              WRITE_ONCE(ti->preempt.count, --pc);
65
(gdb) l*set_need_resched_current+0x138
0xffff80008028b580 is in set_need_resched_current (./arch/arm64/include/asm/preempt.h:31).
26              task_thread_info(p)->preempt_count = PREEMPT_DISABLED; \
27      } while (0)
28
29      static inline void set_preempt_need_resched(void)
30      {
31              current_thread_info()->preempt.need_resched = 0;
32      }
33
34      static inline void clear_preempt_need_resched(void)
35      {

