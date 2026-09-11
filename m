Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A5DBC88E4D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 12:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HtKZQct/qW4J5I+VejgYdZtvYsRIM1Drv1Z+7+Cq5s8=; b=da2gt4sSO3gP2PLwe1+XhnAFU6
	8RJhTkhuHal/gahJsd0LbGaXYxtCd1zkyI2W+vWP0nxn2tVE+CI4qhD/ybjyyk24QjQVnECZF8LNR
	P5ypEYrzWxH2pMWZBnxbDp6pIB1tH8fIJ3ipD535rSozcYsq+CyqFECNZSGFW13VbJ+OPIB/8wUtJ
	ChaK+4+tgEJ8Q2qdIRWfCt9I0D5V4pFfgVa7qSJBlqekP0+cwQdNe2oBCztJ+86Aqukx21js8Y9+J
	zQjK9rjs5gQ4fDTp/z2UdqegVQol4p1TYs4V30iFsgSRIhCB5Tv4BfUImPG9lI4+Fo8EcZzSioblH
	osIuGXDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x50AN-0000000GaaH-1GOv;
	Fri, 11 Sep 2026 12:15:40 +0000
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x50AK-0000000GaZC-2LM2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 12:15:38 +0000
Received: by mail-pj2-x10.google.com with SMTP id d9443c01a7336-2d747ed9866so7992515ad.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 05:15:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1789128933; x=1789733733; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HtKZQct/qW4J5I+VejgYdZtvYsRIM1Drv1Z+7+Cq5s8=;
        b=XFdALlAd57Dw3NxWH/xX9IMvCjY5h0uxsTVAiDUVU6/w2hujP9ZvHlo+Jt1wQZrXl2
         OJHWZxNSkdyLz/Pk07+YDSFlld9rxDSTriGkCG1Nem+lo0v/L2xyQLEC1c5Lvfv1kDSR
         8YUp7wkQKD3PaEnBdtTOPsxFtQdhavgDvRCflKDonj5D5t9owgPfIJqtfx+XKcTG+tVe
         dPE0vV9bsnq4lrKEiROPiy/nx80zQN415QQyLrgOEibh4r7FrMklnQl+2hpnSAbHI0UU
         hpd1Go4T4sZ14NYBQ5pglrRsoYKLmAc2ofDStuVvmEQR8x2mXbEbliovslUlzzdo6s4h
         i5qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789128933; x=1789733733;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HtKZQct/qW4J5I+VejgYdZtvYsRIM1Drv1Z+7+Cq5s8=;
        b=MCOfzr5E117Fxuisd2hqHE7qdUZ1A9km7gA8fnP0V608Z8z+RBxlW5bqNl+SRe6Y9E
         YsS1Fb6C1nvkvRbhglCV+yB9ziXVPhhEgZHr3HX2T0nq2M4N10ta9kF2thDA3l477k2c
         eRKjgRIxkvTjD+N7o/wUX57z3qiv9Us+s1nbNAc9q1K/dUIwBxWyX33YfE2tBx8sn08u
         Xs5NB3u/9p90JwQyhe9YS6Z5JBYYf5ECDWCsw0ELdDgIDMC5R87W7zpf4+IHf0tGBe5N
         wvCkvyDbTfAKOtFsm5DH2iK4ZFP5ooqqhnYlha4fF61gZg8DXbxsaW6loCcpVt97REgM
         x1kQ==
X-Forwarded-Encrypted: i=1; AKwUvBwAcly6tF1fff863fLgOOPCxjvmNVfyOK3TJAJb8ZFnspKYcET2/Ms6nw8Vg0iYXfZ68CdsnTMnQNUnqUJBbUXc@lists.infradead.org
X-Gm-Message-State: AFuF++lqGsVa/vYZMDMPRkhN3pCbgQZcbTuoxrON+UEkFD7FMUv41OF+
	KspBvH5S8/QEK1y0Wo5T3oVihzQlyboRVajg13L10Ujc1ILRB0FOMtYNo+WoV0Bf5fs=
X-Gm-Gg: AYBFou2tq914Mx02KOCq7bBTwXCRzsz/8JrNgejQHVEMKczsr6bElPGmSPJlv/2isBI
	8YD3cpVLTNu+ir8B3drna+vULkhcoq74ak+kvnRiBb4TZqqA2MQf9ENdk9EWQox3NTmZUxqtLU4
	36Y0T9y3t03aubCzgsb5WyOYRuGiCguwfFBJjCC25ZluB9bYoGLFE5uti24+gw1LYNHxbwFhBEv
	FcJeB4tmQMyYMlHFaBZ9zrtfxVSjduz2YWVre3LgPYIEgkpLoz3GABd2JWRdT9Mti6Vdv65HgKv
	s6as3hVHuW/kd8vrgQqpjOv4Gq+8pPE4m7TO+U03Pl1KChqRN3Gs1SFDmEitU+PmnTa4XbQ5SE7
	pDtZj+URqGdQI9TYpOyeT5/7R38cO9J7VWk7y5Vvq0ORN9IJJnbprs9hWZsI5nahQU4z6ey3P49
	bphUXaFKdp1sseaUMYIBsmU3dqLIeSU2bOjsK06Bp4vmL/d38FmH8tzfxo8E9NNxtEByFC5FXKy
	dwoRBCYtjNJPy5I11QKDzHc1vjfJ2dfIZmzcTc3LANIDD2pJQzj
X-Received: by 2002:a17:90b:1d44:b0:38e:57a3:f218 with SMTP id 98e67ed59e1d1-39d9c234a8emr6774079a91.13.1789128931521;
        Fri, 11 Sep 2026 05:15:31 -0700 (PDT)
Received: from FJ7FR2JRQ3 ([2409:8a28:f48:3091:908c:b537:572a:4db0])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33baf0ea9a1sm3178278eec.8.2026.09.11.05.15.11
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 11 Sep 2026 05:15:30 -0700 (PDT)
From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>,
	Conor Dooley <conor@kernel.org>,
	Anup Patel <anup@brainfault.org>
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Yunhui Cui <cuiyunhui@bytedance.com>,
	Atish Patra <atish.patra@linux.dev>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	James Clark <james.clark@linaro.org>,
	Will Deacon <will@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Randy Dunlap <rdunlap@infradead.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Shuah Khan <shuah@kernel.org>,
	Yuanzhu <yuanzhu@bytedance.com>,
	Yicong Yang <yang.yicong@picoheart.com>,
	Susheng Yang <yang.susheng@zte.com.cn>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
Subject: [PATCH v10 0/9] riscv: add SBI Supervisor Software Events support
Date: Fri, 11 Sep 2026 20:14:47 +0800
Message-ID: <20260911121456.33223-1-zhangzhanpeng.jasper@bytedance.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_051536_655910_2FCFCF75 
X-CRM114-Status: GOOD (  25.79  )
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

RISC-V does not architecturally define a supervisor-mode non-maskable
interrupt (NMI). An interrupt that arrives while Linux has cleared SIE stays
pending and is not observed until interrupts are enabled again. That is
correct for ordinary interrupt handling, but some kernel work needs an
NMI-like notification that can run even inside an interrupt-disabled region:
sampling a PMU overflow at the instruction that caused it, or taking a
high-priority RAS report promptly, cannot wait for the next unmask boundary.

The SBI Supervisor Software Events (SSE) extension [1] fills this gap. It lets
Linux register handlers for events that the SBI implementation can deliver
ahead of ordinary traps and interrupts, giving RISC-V the NMI-like supervisor
notification mechanism it otherwise lacks.

SSE can carry several event sources: high-priority RAS reports, double traps,
and PMU overflow, with room for further standard and platform events. This
series focuses on PMU overflow, its first user. Delivering overflows through
SSE lets perf sample the code that was actually running while interrupts were
disabled, rather than the later point where execution reached an
interrupt-unmask boundary.

This series implements the Linux side of that interface: the architecture
entry machinery, a firmware driver that exposes SSE events to in-kernel
clients, PMU overflow delivery, and regression tests. Per-hart local events
and system-wide global events share one client API.

SSE delivery model
==================

Linux first registers a handler and an event stack with the SBI
implementation, then enables the event. When an event source is signalled, the
M-mode SBI implementation preempts Linux even in an interrupt-disabled region:
it saves the interrupted supervisor state and constructs an S-mode context
that enters the registered handler. Linux can now run its own handler, for
example to take a perf sample or process a RAS report, then completes the
event with another SBI call, allowing the interrupted context to resume.

The typical hardware-triggered delivery flow is (software-injected events skip
the hardware trigger):

       <--------- Linux kernel ----------->  <-- Firmware --->  <- Hardware ->
     interrupted context  SSE handler             OpenSBI          Hardware
              |                 |                    |                 |
[1] setup     |                 |-register & enable-->                 |
              |                 |                    |                 |
[2] trigger   |                 |                    <----trigger------|
              |                 |                    |                 |
[3] save      |                 |            +--------------+          |
              |                 |            | context save |          |
              |                 |            +--------------+          |
              |                 |                    |                 |
[4] inject    |                 |        +-----------------------+     |
              |                 |        | handler context setup |     |
              |                 |        +-----------------------+     |
              |                 <---inject (mret) ---|                 |
              |                 |                    |                 |
[5] handle    |        +----------------+            |                 |
              |        | event handling |            |                 |
              |        +----------------+            |                 |
              |                 |                    |                 |
[6] complete  |                 |-----complete------->                 |
              |                 |                    |                 |
[7] restore   |                 |           +-----------------+        |
              |                 |           | context restore |        |
              |                 |           +-----------------+        |
              |                 |                    |                 |
[8] resume    <------------resume (mret) ------------|                 |
              |                 |                    |                 |

The context used to enter the handler exists only for this handoff; it is not
the task context that the event interrupted. The architecture entry code joins
the two sides: it moves execution onto the event's dedicated stack and shadow
call stack, establishes the current task, and presents the interrupted
registers to the callback as a normal pt_regs. Clients can therefore operate
on the original interrupted context without depending on the firmware entry
details.

Linux implementation
====================

An SSE handler runs in NMI-like context: it must not sleep, must not take a
page fault, and may interrupt code that holds arbitrary locks or is partway
through kernel entry. The implementation is shaped by those constraints.

Because it is NMI-like, an SSE can arrive at any point where interrupts are
disabled, including while Linux is midway through exception entry, a task
switch, or a KVM guest transition, where the normal kernel entry state is only
partially established. The SSE entry wrapper (the architecture assembly that
runs before the client callback) copes with this: it preserves Linux-owned
stvec, hstatus, and task stack metadata across the handler and any nested
exception, and its earliest instructions, which run before the event stack and
current task are set up, are kept outside kprobe instrumentation.

The callback receives the interrupted registers as a pt_regs and is allowed to
edit them. On RISC-V a6 and a7 carry SBI call arguments and results, so a
callback that wants to influence an in-flight SBI call the event interrupted
edits them there. The entry wrapper copies just a6 and a7 from that pt_regs
back into the context handed to the completion SBI call, so the edit takes
effect when the interrupted code resumes; the rest of the interrupted state is
restored by firmware and left untouched.

The firmware driver maps the SBI event state machine onto kernel resource
ownership. A callback, stack, and attribute buffer stay alive until firmware
has removed every registration that can refer to them. Failed partial
operations remain tracked for later cleanup, an aborted CPU-offline operation
restores the requested event state, and shutdown and kexec mask SSE before
Linux stops servicing handlers.

PMU overflow and perf
=====================

The RISC-V SBI PMU driver delivers overflows through ordinary interrupts by
default. When firmware implements SSE and the local PMU-overflow event, the
driver routes overflows through SSE instead. The choice is made once at setup
and is not switched at runtime; an operational failure disables sampling
rather than risking two active routes for the same overflow.

This changes where perf can observe an overflow, not how applications use
perf. A normal PMU interrupt raised while S-mode interrupts are masked is
handled only once they are enabled again, so the resulting sample often points
at the unmask boundary rather than at the code that consumed the cycles. SSE
can enter Linux at the original point and remove that source of sampling bias.
No new perf option or perf.data format is introduced.

The entry code supplies the interrupted pt_regs needed for register samples
and for kernel and user callchains. DWARF callchains additionally require a
copy of the interrupted user stack. Since an SSE handler cannot take a normal
page fault, this series takes a temporary reference to the resident user pages
with fast-only GUP, copies them through their kernel mappings, and truncates
the sample at the first page that is not immediately available. The existing
in-atomic copy remains unchanged outside SSE context.

The PMU integration retains perf's throttling and stopped-event semantics. It
restarts only runnable counters and orders the CPU power-management callbacks
so that counters cannot resume after a hart has failed to restore its SSE
delivery path.

Hardware results
================

We measured this on a RISC-V server platform. The same kernel source
and perf binary were used for both routes; one delivered PMU overflows through
ordinary interrupts and the other through SSE. The table shows the mean of
three runs of three million single-CPU "perf bench sched pipe" operations. The
"ops/s" columns are workload throughput (higher is better, so they show the
profiling overhead); the "samples/s" columns are the sampling rate perf
actually achieved against the requested -F frequency:

  rate       IRQ ops/s   SSE ops/s   delta   IRQ samples/s   SSE samples/s
  -F 99        337,707     339,555   +0.55%            98.0            98.6
  -F 999       338,352     338,289   -0.02%           995.7           998.0
  -F 5000      329,002     333,034   +1.23%          5001.7          5001.6

There were no lost samples. Across these normal frequency settings, both
delivery modes reached the requested sample rate and workload throughput
differed by no more than 1.23%.

The "perf bench sched pipe" workload also shows why the delivery mechanism
matters to the resulting profile. Ordinary PMU interrupts cannot enter an
interrupt-disabled kernel critical section. Overflows raised there remain
pending until interrupts are enabled again. Samples consequently accumulate
at the enable boundary rather than at the code that consumed the cycles. In
the IRQ profile, finish_task_switch() and _raw_spin_unlock_irqrestore()
therefore accounted for 54.99% of all samples.

SSE can enter Linux while S-mode interrupts are disabled. The PMU-SSE
profile therefore samples inside those critical sections and exposes the
scheduler, locking, address-space switching, and wake-up paths doing the
actual work. The leading entries from the two -F 999 reports show the
difference.

With ordinary PMU interrupt delivery:

  overhead   symbol
    36.63%   finish_task_switch.isra.0
    18.36%   _raw_spin_unlock_irqrestore
     7.66%   __internal_syscall_cancel
     7.55%   do_trap_ecall_u
     4.19%   mutex_lock
     3.64%   mutex_unlock
     3.06%   exit_to_user_mode_loop

With PMU-SSE delivery:

  overhead   symbol
     5.48%   __kprobes_text_end
     5.29%   __schedule
     5.10%   ret_from_exception
     4.71%   do_raw_spin_lock
     4.01%   do_trap_ecall_u
     3.99%   mutex_lock
     3.66%   switch_mm
     3.43%   mutex_unlock
     3.29%   exit_to_user_mode_loop
     3.28%   psi_group_change

The ordinary interrupt profile is dominated by two interrupt-enable
boundaries. With SSE, those two entries account for only 3.37%. The samples
are instead distributed across scheduler paths within the critical sections.

At perf's configured limit of 100,000 samples per second, both routes still
made progress without lost samples. In this deliberately saturated regime SSE
reduced workload throughput by 2.7% to 5.8%, which exposes the additional
firmware-entry cost and marks a practical upper boundary for sampling.
Thirty-second perf top runs at the same rate each processed about 3.1 million
samples with no loss, stalls, or kernel failures.

The DWARF callchain path gets dedicated coverage because it was the source of
the corruption this series fixes. On the same platform,
"perf record -a -g --call-graph dwarf,512 -F 999" layered on a concurrent
"hackbench -g25 -l600" -- the configuration that previously corrupted
spinlocks and mutexes under SSE -- now completes cleanly, with no lost
samples, lockups, RCU stalls, or faults, including a 431-iteration soak.
Patch 9 adds a regression test that drives the non-faulting user-stack copy
through the SSE handler with 32 concurrent samplers and checks perf's
truncation semantics.

Changes in v10
==============

V10 turns the earlier feature series into a path suitable for sustained perf
use. In particular, it:

  - reconstructs and publishes the interrupted context for perf register
    samples and kernel and user callchains;
  - preserves current, task stack metadata, stvec, hstatus, and shadow-call
    stack state across synthetic entry and nested exceptions;
  - prevents fault-disabled accesses from entering the generic RISC-V page
    fault path and provides a non-faulting SSE user-stack copy;
  - makes event lifetime and rollback explicit across partial firmware
    operations, CPU hotplug, shutdown, crash, and kexec;
  - closes PMU throttle, counter restart, CPU power-management, and cleanup
    races without adding a runtime SSE-to-IRQ transition; and
  - expands the framework stress coverage and adds a regression test for
    high-frequency DWARF user-stack sampling.

Changes in v9:
  - Rebased the original series onto RISC-V for-next.
  - Preserved Linux-owned trap, virtualization, and supervisor state across
    the synthetic SSE handler.
  - Added framework stress modes and updated MAINTAINERS.

Previous versions:
  v9:
    https://lore.kernel.org/r/cover.1778331862.git.zhangzhanpeng.jasper@bytedance.com
  v8:
    https://lore.kernel.org/r/20251105082639.342973-1-cleger@rivosinc.com

How to test
===========

Enable the SSE framework and SSE overflow delivery:

  CONFIG_RISCV_SBI_SSE=y
  CONFIG_RISCV_PMU_SBI=y
  CONFIG_RISCV_PMU_SBI_SSE=y

PMU-SSE also requires two OpenSBI fixes:

  f30a54f3b3a0 ("lib: sbi: pmu: Remove MIP clearing from pmu_sse_enable()")
    [2], included since OpenSBI v1.7,
    which keeps an overflow pending while its SSE event is temporarily
    disabled; and
  35511bc6ee1c ("lib: sbi: sse: clear SPV for non-virtualized events") [3],
    not yet included in a tagged release,
    which stops a stale HSTATUS.SPV from being applied to a non-virtualized
    event.

Build tools/testing/selftests/riscv, then run:

  for stress in 0 1 2; do
          ./run_sse_test.sh stress=$stress || break
  done
  ./sse_perf_ustack

Useful perf regression workloads include:

  perf record -e cycles -a -- sleep 1
  perf top
  perf record -g -F 999 -- hackbench
  perf record --call-graph dwarf,8192 -F 999 -- hackbench
  perf record -a -C 3 -e cycles -F 999 -- \
          taskset -c 3 perf bench sched pipe -l 3000000

Limitations and follow-up work
==============================

This series does not yet deliver SSE events into a guest or unwind a guest
stack; a later KVM-SSE series will let the host receive an event from firmware
and inject the corresponding event into the guest.

Hibernation and crash kernels are unsupported: the current SBI interface
cannot reconstruct firmware registrations after an image is restored, and a
crash kernel cannot take over the registrations left by the crashed kernel, so
it leaves SSE masked.

[1] https://docs.riscv.org/reference/sbi/ext-sse.html
[2] https://github.com/riscv-software-src/opensbi/commit/f30a54f3b3a091c225a00476f4039bf399badd1f
[3] https://github.com/riscv-software-src/opensbi/commit/35511bc6ee1c9c17b6a89b44c52e2044bb51b979

Acknowledgements
================

The original five feature patches were developed by Clément Léger and
Himanshu Chauhan. Thanks to Susheng Yang for reporting the perf callchain
failure and for providing a workload that made it reproducible.

Sorry for keeping you waiting. Since v9 I spent a good deal of time hardening
the lifecycle and error paths and reproducing and analysing the bugs that only
show up in the callchain path, until the series finally passed both functional
and sustained stress testing on hardware. I am confident in v10, but, echoing
Clément, SSE is a genuinely complex feature: it adds a new NMI-like entry path
into the kernel to stand in for a hardware NMI. I would therefore welcome wider
community testing and feedback, especially under high-frequency delivery and
more complex handlers.

---

Clément Léger (5):
  riscv: add SBI SSE extension definitions
  riscv: add support for SBI Supervisor Software Events extension
  drivers: firmware: add riscv SSE support
  perf: RISC-V: add support for SSE event
  selftests/riscv: add SSE test module

Zhanpeng Zhang (4):
  riscv: sse: mask events during shutdown and kexec
  riscv: mm: avoid enabling interrupts for nofault page faults
  perf: RISC-V: support callchains with SSE delivery
  selftests/riscv: add perf user-stack SSE copy regression test

 Documentation/arch/riscv/index.rst            |    1 +
 Documentation/arch/riscv/pmu-sse.rst          |   55 +
 MAINTAINERS                                   |   22 +
 arch/riscv/include/asm/asm.h                  |   14 +-
 arch/riscv/include/asm/perf_event.h           |   10 +
 arch/riscv/include/asm/sbi.h                  |   63 +
 arch/riscv/include/asm/scs.h                  |    7 +
 arch/riscv/include/asm/sse.h                  |   82 ++
 arch/riscv/include/asm/thread_info.h          |    1 +
 arch/riscv/kernel/Makefile                    |    1 +
 arch/riscv/kernel/asm-offsets.c               |   14 +
 arch/riscv/kernel/entry.S                     |   14 +
 arch/riscv/kernel/machine_kexec.c             |   11 +
 arch/riscv/kernel/perf_callchain.c            |  142 +++
 arch/riscv/kernel/reset.c                     |   18 +
 arch/riscv/kernel/sbi_sse.c                   |  246 ++++
 arch/riscv/kernel/sbi_sse_entry.S             |  226 +++
 arch/riscv/kernel/smp.c                       |   17 +
 arch/riscv/mm/fault.c                         |   11 +-
 drivers/firmware/Kconfig                      |    1 +
 drivers/firmware/Makefile                     |    1 +
 drivers/firmware/riscv/Kconfig                |   18 +
 drivers/firmware/riscv/Makefile               |    3 +
 drivers/firmware/riscv/riscv_sbi_sse.c        | 1223 +++++++++++++++++
 drivers/perf/Kconfig                          |   11 +
 drivers/perf/riscv_pmu.c                      |   14 +-
 drivers/perf/riscv_pmu_sbi.c                  |  544 ++++++--
 include/linux/cpuhotplug.h                    |    1 +
 include/linux/perf/riscv_pmu.h                |   20 +-
 include/linux/riscv_sbi_sse.h                 |   95 ++
 tools/testing/selftests/riscv/Makefile        |    2 +-
 tools/testing/selftests/riscv/sse/Makefile    |   10 +
 .../selftests/riscv/sse/module/Makefile       |   22 +
 .../riscv/sse/module/riscv_sse_test.c         | 1154 ++++++++++++++++++
 .../selftests/riscv/sse/run_sse_test.sh       |   59 +
 .../selftests/riscv/sse/sse_perf_ustack.c     |  564 ++++++++
 36 files changed, 4596 insertions(+), 101 deletions(-)
 create mode 100644 Documentation/arch/riscv/pmu-sse.rst
 create mode 100644 arch/riscv/include/asm/sse.h
 create mode 100644 arch/riscv/kernel/sbi_sse.c
 create mode 100644 arch/riscv/kernel/sbi_sse_entry.S
 create mode 100644 drivers/firmware/riscv/Kconfig
 create mode 100644 drivers/firmware/riscv/Makefile
 create mode 100644 drivers/firmware/riscv/riscv_sbi_sse.c
 create mode 100644 include/linux/riscv_sbi_sse.h
 create mode 100644 tools/testing/selftests/riscv/sse/Makefile
 create mode 100644 tools/testing/selftests/riscv/sse/module/Makefile
 create mode 100644 tools/testing/selftests/riscv/sse/module/riscv_sse_test.c
 create mode 100644 tools/testing/selftests/riscv/sse/run_sse_test.sh
 create mode 100644 tools/testing/selftests/riscv/sse/sse_perf_ustack.c

base-commit: 77ae27fd98f3b548797c9f22c10ab5cf1c4ada53
--
2.50.1 (Apple Git-155)

