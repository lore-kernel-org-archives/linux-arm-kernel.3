Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92C51107BCD3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 18:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3Tz6fVpfEBKXB5VFqqsK0lZuyWZ7BlogikT47tMWkXI=; b=njodp9nQOXkICvVOA5n+wHLL7Q
	qIXJ0hgNW4+lBIhbxf7EoWq6ni1vGshwvo+aSKR291iGIzKY6t9nOjYzSk9GRTZCZeOnHTkjSytLj
	ppZl6FLDk6DmUctrm5LuPWiGA3BjtJBgTgV6JNAJPwiLErdXU+iAQSeGEt/8vySo49NemNf9Rdy1o
	yY3G+C6zfQFD/i7oXXNns6GIrH68yGZe/CPXkpj+L+ct9/oWpyR4CLukv0DxuBUCX9P6oANLPRIyO
	FWq/T8eTBmSds/k8EGHoIiZFaFw48njrUEqN/4V+FeUvpaVxEmSLtL0yXviLfWscIMHh/32S3evvK
	DkY8S/zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w16ry-00000000qHg-486b;
	Fri, 13 Mar 2026 18:04:18 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w16rx-00000000qHQ-0SKf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 18:04:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2D5596183F;
	Fri, 13 Mar 2026 18:04:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2C80C19421;
	Fri, 13 Mar 2026 18:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773425055;
	bh=+4lUwDCn4bRvjfObGVzBiu5D9cZeYyd56OjA6Nl8Th0=;
	h=From:To:Cc:Subject:Date:From;
	b=euK8F/mMg/jLsaYUwS1rO5tCLBcd4pXg+AsPJwEVjZg+kpufS5rUWJd/nVS5VsbK2
	 l7DOo9BLaG6RmLOa+14LUCfn8qfG69R6tyNk0nQZEdg/iP004LGAsQmcnR0eCpnijF
	 /KgVe2uZfkmGeFHQt9HdVixxK8S32xvlQX3eIZsdN3lTzy/3ao3QASmI57ZP3VMkCa
	 Y+oVQt7AFq3qama9HooFh0fa8oIsyJ8Te+IwcVlsB5XNXiHUnsAyuIVp2i8jx0quWe
	 m4y8Or5bdEpyneXC8HhvkZ+O9gcNBK8vqIba/QWnFVQsp0XjtAXqccpSpsvfYZe90+
	 aKjpdcIF8bXwg==
From: Puranjay Mohan <puranjay@kernel.org>
To: bpf@vger.kernel.org
Cc: Puranjay Mohan <puranjay@kernel.org>,
	Puranjay Mohan <puranjay12@gmail.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Andrii Nakryiko <andrii@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Martin KaFai Lau <martin.lau@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Leo Yan <leo.yan@arm.com>,
	Rob Herring <robh@kernel.org>,
	Breno Leitao <leitao@debian.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	kernel-team@meta.com
Subject: [PATCH bpf 0/3] arm64: Add BRBE support for bpf_get_branch_snapshot()
Date: Fri, 13 Mar 2026 11:03:31 -0700
Message-ID: <20260313180352.3800358-1-puranjay@kernel.org>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

RFC: https://lore.kernel.org/all/20260102214043.1410242-1-puranjay@kernel.org/
Changes from RFC:
 - Fix pre-existing NULL pointer dereference in armv8pmu_sched_task()
   found by Leo Yan during testing (patch 1)
 - Pause BRBE before local_daif_save() to avoid branch pollution from
   trace_hardirqs_off()
 - Use local_daif_save() to prevent pNMI race from counter overflow
   (Mark Rutland)
 - Reuse perf_entry_from_brbe_regset() instead of duplicating register
   read logic, by making it accept NULL event (Mark Rutland)
 - Invalidate BRBE after reading to maintain record contiguity for
   other consumers (Mark Rutland)
 - Adjust selftest wasted_entries threshold for ARM64 (patch 3)
 - Tested on ARM FVP with BRBE enabled

This series enables the bpf_get_branch_snapshot() BPF helper on ARM64
by implementing the perf_snapshot_branch_stack static call for ARM's
Branch Record Buffer Extension (BRBE).

bpf_get_branch_snapshot() [1] allows BPF programs to capture hardware
branch records on-demand from any BPF tracing context. This was
previously only available on x86 (Intel LBR) since v5.16. With BRBE
available on ARMv9, this series closes the gap for ARM64.

Usage model
-----------

The helper works in conjunction with perf events. The userspace
component of the BPF application opens a perf event with
PERF_SAMPLE_BRANCH_STACK on each CPU, which configures the hardware
to continuously record branches into BRBE (on ARM64) or LBR (on x86).
A BPF program attached to a tracepoint, kprobe, or fentry hook can
then call bpf_get_branch_snapshot() to snapshot the branch buffer at
any point. Without an active perf event, BRBE is not recording and
the buffer is empty.

On-demand branch snapshots from BPF are useful for diagnosing which
specific code path was taken inside a function. Stack traces only show
function boundaries, but branch records reveal the exact sequence of
jumps, calls, and returns within a function -- making it possible to
identify which specific error check triggered a failure, or which
callback implementation was invoked through a function pointer.

For example, retsnoop [2] is a BPF-based tool for non-intrusive
mass-tracing of kernel internals. Its LBR mode (--lbr) creates per-CPU
perf events with PERF_SAMPLE_BRANCH_STACK and then uses
bpf_get_branch_snapshot() in its fentry/fexit BPF programs to capture
branch records whenever a traced function returns an error.

Consider debugging a bpf() syscall that returns -EINVAL when creating
a BPF map with invalid parameters. Running retsnoop on an ARM64 FVP
with BRBE to trace the bpf() syscall and array_map_alloc_check():

  $ retsnoop -e '*sys_bpf' -a 'array_map_alloc_check' --lbr=any \
             -F -k vmlinux --debug full-lbr
  $ simfail bpf-bad-map-max-entries-array  # in another terminal

Output of retsnoop:

  --- fentry BPF program (entries #63-#17) ---

  [#63-#59] __htab_map_lookup_elem: hash table walk with memcmp        (hashtab.c)
  [#58] __htab_map_lookup_elem+0x98  -> dump_bpf_prog+0xc850           (hashtab.c:750)
  [#57-#55] ... dump_bpf_prog internal branches ...
  [#54] dump_bpf_prog+0xcab8        -> bpf_get_current_pid_tgid+0x0    (helpers.c:225)
  [#53] bpf_get_current_pid_tgid+0x1c -> dump_bpf_prog+0xcabc          (helpers.c:225)
  [#52-#51] ... dump_bpf_prog -> __htab_map_lookup_elem ...
  [#50-#47] __htab_map_lookup_elem: htab_map_hash (jhash2), select_bucket
  [#46-#42] lookup_nulls_elem_raw: hash chain walk with memcmp         (hashtab.c:717)
  [#41] __htab_map_lookup_elem+0x98  -> dump_bpf_prog+0xcaf8           (hashtab.c:750)
  [#40-#37] ... dump_bpf_prog -> bpf_ktime_get_ns ...
  [#36] bpf_ktime_get_ns+0x10       -> ktime_get_mono_fast_ns+0x0      (helpers.c:178)
  [#35-#32] ktime_get_mono_fast_ns: tk_clock_read -> arch_counter_get_cntpct
  [#31] ktime_get_mono_fast_ns+0x9c -> bpf_ktime_get_ns+0x14           (timekeeping.c:493)
  [#30] bpf_ktime_get_ns+0x18       -> dump_bpf_prog+0xcd50            (helpers.c:178)
  [#29-#25] ... dump_bpf_prog internal branches ...
  [#24] dump_bpf_prog+0x11b28       -> __bpf_prog_exit_recur+0x0       (trampoline.c:1190)
  [#23-#17] __bpf_prog_exit_recur: rcu_read_unlock, migrate_enable     (trampoline.c:1195)

  --- array_map_alloc_check (entries #16-#12) ---

  [#16] dump_bpf_prog+0x11b38       -> array_map_alloc_check+0x8       (arraymap.c:55)
  [#15] array_map_alloc_check+0x18  -> array_map_alloc_check+0xb8      (arraymap.c:56)
        . bpf_map_attr_numa_node       . bpf_map_attr_numa_node
  [#14] array_map_alloc_check+0xbc  -> array_map_alloc_check+0x20      (arraymap.c:59)
        . bpf_map_attr_numa_node
  [#13] array_map_alloc_check+0x24  -> array_map_alloc_check+0x94      (arraymap.c:64)
  [#12] array_map_alloc_check+0x98  -> dump_bpf_prog+0x11b3c           (arraymap.c:82)

  --- fexit trampoline overhead (entries #11-#00) ---

  [#11] dump_bpf_prog+0x11b5c       -> __bpf_prog_enter_recur+0x0      (trampoline.c:1145)
  [#10-#03] __bpf_prog_enter_recur: rcu_read_lock, migrate_disable     (trampoline.c:1146)
  [#02] __bpf_prog_enter_recur+0x114 -> dump_bpf_prog+0x11b60          (trampoline.c:1157)
  [#01] dump_bpf_prog+0x11b6c       -> dump_bpf_prog+0xd230
  [#00] dump_bpf_prog+0xd340        -> arm_brbe_snapshot_branch_stack+0x0 (arm_brbe.c:814)

                   el0t_64_sync+0x168
                   el0t_64_sync_handler+0x98
                   el0_svc+0x28
                   do_el0_svc+0x4c
                   invoke_syscall.constprop.0+0x54
    373us [-EINVAL] __arm64_sys_bpf+0x8
                    __sys_bpf+0x87c
                    map_create+0x120
     95us [-EINVAL] array_map_alloc_check+0x8

The FVP's BRBE buffer has 64 entries (BRBE supports 8, 16, 32, or
64). Of these, entries #63-#17 (47) are consumed by the fentry BPF
trampoline that ran before the function, and entries #11-#00 (12)
are consumed by the fexit trampoline that runs after. Entry #00
shows the very last branch recorded before BRBE is paused: the call
into arm_brbe_snapshot_branch_stack().

The 5 useful entries (#16-#12) show the exact path taken inside
array_map_alloc_check(). Record #14 shows a jump from line 56
(bpf_map_attr_numa_node) to line 59 (the if-condition), and #13
shows an immediate jump from line 59 (attr->max_entries == 0) to
line 64 (return -EINVAL), skipping lines 60-63. This pinpoints
max_entries==0 as the cause -- a diagnosis impossible with stack
traces alone.

[1] 856c02dbce4f ("bpf: Introduce helper bpf_get_branch_snapshot")
[2] https://github.com/anakryiko/retsnoop

Puranjay Mohan (3):
  perf/arm_pmuv3: Fix NULL pointer dereference in armv8pmu_sched_task()
  perf/arm64: Add BRBE support for bpf_get_branch_snapshot()
  selftests/bpf: Adjust wasted entries threshold for ARM64 BRBE

 drivers/perf/arm_brbe.c                       | 70 ++++++++++++++++++-
 drivers/perf/arm_brbe.h                       |  9 +++
 drivers/perf/arm_pmuv3.c                      | 16 ++++-
 .../bpf/prog_tests/get_branch_snapshot.c      |  9 +--
 4 files changed, 95 insertions(+), 9 deletions(-)


base-commit: ca0f39a369c5f927c3d004e63a5a778b08a9df94
-- 
2.52.0


