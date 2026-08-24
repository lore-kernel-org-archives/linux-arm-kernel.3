Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3DF4C5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 07:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lC5MM22huTp0dT7hKZcsej4v4Z3Lw+J55ZIrFMzyqRI=; b=Ov8gSS0OHEF5HW0p8zWREe51Ds
	ACz3aVfxQ+zeVCMHnxB1FIVtUjf+3FCgeryqFsd1gJ3Qt1hWmpK80rv1Hdl/lpxYHA/bPgc7v4oTp
	dT3DDgehn+LCgQ0uWnZxWRGu2sQ32Ghg6WIwM/+KJhr5tdZtgQc+rV+usk1J/CvOvKje+WQDpEdSm
	mbC7xvV/RTCD+rZv1uBe8QGTedgr1wgSlsz3FORRwoYuQI4E+2SIAPWKJHTSLmAZtLddmj6VNfWs8
	YtlwPMSmE/nJNXsZ7thv9L371Zmnznq2JFjO3iPSbm2rlCSeRn0xklFK/BcSyBxZiN+8ThzOimVRL
	fPA5KfNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyPBP-0000000G5t2-1G8x;
	Mon, 24 Aug 2026 07:33:27 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyPBL-0000000G5rk-1M6t
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 07:33:25 +0000
X-UUID: 0f0421289f8e11f19a56ed5b684f684d-20260824
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:5fbf96f2-bab7-49b6-8e5b-e03aab24d547,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:7db8b62,CLOUDID:a8d68a42f966896fd9983d420b7143d5,BulkI
	D:nil,BulkQuantity:0,SF:102|865|898,TC:nil,Content:0|15|50,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 0f0421289f8e11f19a56ed5b684f684d-20260824
X-User: liwanwu@kylinos.cn
Received: from kylinos.cn [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <liwanwu@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 230518548; Mon, 24 Aug 2026 15:33:11 +0800
From: Wanwu Li <liwanwu@kylinos.cn>
To: linux-kernel@vger.kernel.org,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Wei Xu <xuwei5@hisilicon.com>,
	Yicong Yang <yangyicong@hisilicon.com>,
	linux-arm-kernel@lists.infradead.org,
	Li Wanwu <liwanwu@kylinos.cn>,
	Bing Huang <huangbing@kylinos.cn>,
	Jackie Liu <liuyun01@kylinos.cn>
Subject: sched/core: sporadic stale rq->curr (rq->curr != current) causing scheduler crashes on long-running arm64 servers
Date: Mon, 24 Aug 2026 15:33:08 +0800
Message-Id: <20260824073308.13-1-liwanwu@kylinos.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_003323_674042_9DFC2B82 
X-CRM114-Status: GOOD (  15.21  )
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

From: Li Wanwu <liwanwu@kylinos.cn>

Hi,

We are chasing a rare scheduler failure mode on arm64 servers and would
like to ask whether anyone has seen anything similar, and for advice on
how to narrow down the root cause.


1. Background
=============

Starting in 2025, we have observed sporadic kernel panics and crashes
on more than ten customer-site ARM64 production servers. Uptime before
the crash ranges from 23 to ~300 days.

All affected systems share the same SoC generation - HiSilicon Kunpeng
920 (HIP08) with TaiShan v110 cores (boot CPU MIDR 0x481fd010):
96/128/256 CPUs across 4 NUMA nodes, 64 KB pages, 48-bit VA,
UEFI/ACPI firmware. Among the dumps, two OEM machine models are
present:

  - Case A: KunLun 2280 (BC82AMDYA), BIOS 7.15 (2024-06-20)
  - Case B: HuaKun TG225 B1 (BC82AMDDRA), BIOS 7.38 (2025-01-04)

All affected machines use downstream distribution kernels based on
v4.19 with identical scheduler-related options (PREEMPT_VOLUNTARY,
HZ_100, NO_HZ_FULL + CONTEXT_TRACKING + CPU_ISOLATION, cgroup fair/RT
group scheduling with CFS bandwidth control, NUMA balancing enabled by
default, SCHED_DEBUG/SCHEDSTATS).

So far every dump shows the same signature: the crashing CPU was running
its idle task, while rq->curr still pointed to some *previous* task -
i.e. current != rq->curr. We suspect that at some point the update
rq->curr = next in __schedule() did not take effect (or was subsequently
reverted), leaving rq->curr stale while the CPU moved on.

Below are two representative cases with the full crash-utility analysis.
Both vmcores were analyzed with crash(8); since the dumps contain
freed/stale data, some commands (bt/runq on the affected CPU) abort
early, so most evidence below was collected by reading raw memory at
symbolic+offset addresses (offsets taken from the matching vmlinux DWARF
info):

    offsetof(struct rq, curr)            = 0xa68
    offsetof(struct rq, idle)            = 0xa70
    offsetof(struct task_struct, state)  = 0x18
    offsetof(struct task_struct, stack)  = 0x20
    offsetof(struct task_struct, usage)  = 0x28
    offsetof(struct task_struct, cpu)    = 0x44
    offsetof(struct task_struct, on_rq)  = 0x68
    offsetof(struct task_struct, pid)    = 0x6b0
    offsetof(struct task_struct, comm)   = 0x890
    offsetof(struct task_struct, se)     = 0x100
    offsetof(struct sched_entity, on_rq)   = 0x40
    offsetof(struct sched_entity, depth)   = 0x158
    offsetof(struct sched_entity, parent)  = 0x160
    offsetof(struct sched_entity, cfs_rq)  = 0x168


2. Case A: !se->on_rq warning followed by hard lockup (~36 days uptime)
=======================================================================

Console log (CPU 15, PID 0, comm swapper/15):

    ------------[ cut here ]------------
    !se->on_rq
    WARNING: CPU: 15 PID: 0 at kernel/sched/fair.c:7145 set_next_buddy+0x6c/0x88
    Call trace:
     set_next_buddy+0x6c/0x88
     dequeue_task_fair+0xb8/0x768
     deactivate_task+0xa8/0xf8
     __schedule+0x440/0x840
     schedule_idle+0x24/0x40
     do_idle+0x178/0x268
    ...
    NMI watchdog: Watchdog detected hard LOCKUP on cpu 15
    pc : newidle_balance+0x1fc/0x440
    Call trace:
     newidle_balance+0x1fc/0x440
     pick_next_task_fair+0xdc/0x548
     __schedule+0x134/0x840
     schedule_idle+0x24/0x40
     do_idle+0x178/0x268
    Kernel panic - not syncing: Hard LOCKUP

Observation: do_idle() -> schedule_idle() implies prev == the idle task,
and an idle task is never deactivated. Yet __schedule() went through
deactivate_task()/dequeue_task_fair() on a sched_entity whose ->on_rq
was already 0. That is only possible if __schedule() obtained its
'prev' from a stale rq->curr: the dequeued entity belonged to a task
that had already been dequeued (and even exited). The CPU then
got stuck in newidle_balance() of the very same __schedule() invocation
and was killed by the hard lockup watchdog ~18 seconds later.

Memory evidence from the vmcore (rq15 = 0xffff807fef5c1640, taken from
the newidle_balance frame register x19 = this_rq):

    crash> rd 0xffff807fef5c20a8 1        # rq15->curr (+0xa68)
    ffff807fef5c20a8:  ffffa080024de780
    crash> rd 0xffff807fef5c20b0 1        # rq15->idle (+0xa70)
    ffff807fef5c20b0:  ffff804119dc2700
    crash> rd ffff804119dc2f90 2          # idle->comm (+0x890)
    ffff804119dc2f90:  swapper/15

So current (swapper/15 = 0xffff804119dc2700) != rq15->curr
(0xffffa080024de780). Inspecting the stale task:

    state       (@+0x18) = 0x80        # TASK_DEAD
    stack       (@+0x20) = 0           # kernel stack already released
    usage       (@+0x28) = 0           # last reference dropped
    exit_state  (@+0x64c)= 0x10
    on_rq       (@+0x68) = 0
    pid         (@+0x6b0) = 956301
    comm        (@+0x890) = "calico-node"

i.e. rq15->curr still points to a fully exited, freed task_struct (crash
also reports "active task ffffa080024de780 on cpu 15 not found in PID
hash"). Its sched_entity chain additionally leads into freed memory
(se->parent points to a zeroed-out region), which is what eventually
tripped the !se->on_rq warning and probably kept newidle_balance()
spinning.


3. Case B: NULL deref in check_preempt_wakeup (~285 days uptime)
================================================================

Console log (CPU 9, PID 0, comm swapper/9):

    Unable to handle kernel NULL pointer dereference at virtual address 0000000000000168
    pc : check_preempt_wakeup+0xc8/0x248
    lr : check_preempt_curr+0x4c/0xd0
    x29: ffff807fef700b80 x28: 0000000000000000 x27: 0000000000000003
    x26: 0000000000000000 x25: ffff8041762fa800 x24: ffffa0404768eb00
    x23: ffff8041762fa900 x22: ffff807fef701640 x21: ffffa0404768ea00
    x20: 0000000000000000 x19: 0000000000000000 ...
    Call trace:
     check_preempt_wakeup+0xc8
     check_preempt_curr
     ttwu_do_wakeup
     ttwu_do_activate
     try_to_wake_up
     wake_up_process
     hrtimer_wakeup
     __hrtimer_run_queues
     hrtimer_interrupt
     ...
     arch_cpu_idle            <-- CPU was idle

Disassembling check_preempt_wakeup():

    <+44>:  add  x23, x25, #0x100        // x23 = pse = &p->se
    <+48>:  ldr  x21, [x22, #2664]       // x21 = rq->curr   (x22 = rq)
    <+56>:  add  x24, x21, #0x100        // se = &rq->curr->se
    ...
    <+192>: ldr  x19, [x19, #352]        // se = se->parent (find_matching_se)
    <+196>: ldr  x20, [x20, #352]
    <+200>: ldr  x0, [x19, #360]         // <-- faulting insn: se->cfs_rq
                                         //     360 = 0x168 = offsetof(se, cfs_rq)

The registers prove the state directly: x21 (loaded once at function
entry from [rq + 0xa68], callee-saved and never written again) holds
rq->curr, x19 became NULL by following se->parent up the hierarchy, and
the load of se->cfs_rq from NULL produced the fault at address 0x168.

From the vmcore (rq9 = 0xffff807fef701640 = x22; cross-checked against
the runqueues symbol plus __per_cpu_offset[] with the expected 0xa0000
stride):

    crash> rd 0xffff807fef7020a8 1        # rq9->curr
    ffff807fef7020a8:  ffffa0404768ea00   <-- exactly matches x21 above
    crash> rd 0xffff807fef7020b0 1        # rq9->idle
    ffff807fef7020b0:  ffff804119b4fd80
    crash> rd 0xffff804119b50610 2        # idle->comm
    ffff804119b50610:  swapper/9

Again current (swapper/9 = 0xffff804119b4fd80) != rq9->curr
(0xffffa0404768ea00). The stale task:

    state      (@+0x18) = 0x1             # TASK_INTERRUPTIBLE (alive, sleeping)
    on_rq      (@+0x68) = 0
    cpu        (@+0x44) = 11              # last ran on CPU 11 (!)
    pid        (@+0x6b0) = 195708
    comm       (@+0x890) = "pnio1"
    se.depth   (@+0x258) = 0
    se.parent  (@+0x260) = 0              # root-level entity
    se.cfs_rq  (@+0x268) = ffff807fef8416c0

And 0xffff807fef8416c0 is precisely rq11 + 0x80, i.e. *CPU 11's* root
cfs_rq (the per-CPU runqueue stride on this machine is 0xa0000;
rq9 + 0x80 = 0xffff807fef7016c0 is visible in register x1 as the cfs_rq
the waking task p belongs to).

This explains the crash mechanically: rq->curr pointed to a task whose
CFS hierarchy belongs to CPU 11, while the task being woken was enqueued
on CPU 9's hierarchy. In check_preempt_wakeup() -> find_matching_se(),
the two entities can never be found in the same group, so the loop walks
both ->parent chains beyond their roots, se becomes NULL, and the next
se->cfs_rq load dereferences NULL. With a correct rq->curr (the idle
task, whose se sits in CPU 9's own root cfs_rq) this path cannot fail.


4. What we believe happened / ruled out
=======================================

In both dumps the affected CPU was provably executing its idle task
while rq->curr still referenced a stale old task (in case A the stale
task even exited and its task_struct was freed afterwards).

We could not find any software path in a 4.19-based kernel that writes
rq->curr outside of the owning CPU's __schedule(), which performs
exactly one store (RCU_INIT_POINTER(rq->curr, next)) under rq->lock with
interrupts disabled - we verified the built binary really has only that
one store site.

Furthermore, that store is followed by several ordering/visibility
barriers before the CPU can park in idle: finish_lock_switch() releases
rq->lock (STLR, release semantics on arm64) after switch_to(), our
__switch_to() executes a dsb(ish), and entering idle via
default_idle_call() -> __cpu_do_idle() executes a dsb(sy) right before
WFI. To the best of our understanding of the arm64 memory model, by the
time the CPU sits in WFI the rq->curr store must already be globally
visible - yet the dumps show otherwise.

An additional observation narrows things down further: our kernels keep
a per-CPU variable __entry_task in sync during context_switch() via
entry_task_switch() -> __this_cpu_write(__entry_task, next), essentially
adjacent to the rq->curr update. In both dumps __entry_task is correct
and consistent with the actually running task (the idle task), so the
paired per-CPU update took effect while the rq->curr store did not.
This suggests the anomaly hits the specific location holding rq->curr
rather than the CPU's scheduling state machinery in general.

Given that this happens on many different machines of the same arm64
platform family but only after weeks/months of uptime, we currently
suspect a platform/hardware level issue (e.g. a lost or delayed store /
coherency anomaly), but no hardware error logs (ECC, etc.) have been
found so far. Before jumping to that conclusion we would like to make
sure we are not missing a software race.

Some additional data points:

- All observed crashes involve the idle transition (do_idle/
  schedule_idle or wakeups delivered to an idle CPU via timer
  interrupt).
- The systems run mixed workloads (KVM hosts, containers, storage/DB),
  nothing exotic in common except the platform.
- No preceding scheduler warnings in the logs; failures appear out of
  nowhere.


5. Questions
============

1) Has anyone seen rq->curr (or similar per-CPU scheduler state)
   silently diverging from the actually running task, especially on
   arm64 servers with long uptime? Any known software races in that area
   we should look at?

2) In case B the stale rq->curr came from a task associated with another
   CPU's CFS hierarchy. If the store in context_switch-to-idle were lost,
   would you expect the stale value to be the immediately preceding task
   (which matches what we see), or does any known scenario explain a
   cross-CPU value?

3) Considering the release-unlock + dsb(ish) + dsb(sy)-before-WFI chain
   described above, is our reading correct that the rq->curr store must
   already have been globally visible by the time the CPU parked in WFI?
   Are there known memory-model corner cases or errata where a committed
   store can effectively revert/become invisible afterwards?

Any hints or prior experience would be highly appreciated. We can
provide full vmcores, disassembly, and console logs if needed.

Thanks!

