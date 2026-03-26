Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBC5B106F304
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 08:57:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WSjnQNvspGmmDZsOu+XUcYNWj5wosTqN8XrzdpzoIi0=; b=EBUx8ewjCBm0QE2mcvbA+ZzvxZ
	Qlni5diz57ZLLFYFDAH8J1K8DdI7BTaoboWrPS9FbWFH60qDpj3YrolBvWw+hYIIDbOiEumkr53W3
	NFaLx1OwW+oj7oBdVZxSYsQ7RqFqO3GtNsgkRp7KBxgbk+WqtZBgbj9r51S8Mq6GugPUewXvfvhcb
	ip+oIeIl5iVjlzz7aWLfStwDQBP3edmZ9a5ka5p7OZ+C5+sZultNMIfZGen1+c9SHwR+c9T2K2LvI
	z4HqDvttzqCxlU32NSOmnJDeDTVt/vFGKo8P3WKQAOqR6xj7nshYppokrZBB21mBCINabfcr0TmWf
	4DntJMzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5gWy-0000000552s-0zuj;
	Thu, 26 Mar 2026 08:57:32 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5gWv-0000000551z-048q
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 08:57:30 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-6634bb959a2so897351a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Mar 2026 01:57:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774515446; cv=none;
        d=google.com; s=arc-20240605;
        b=apDEBcIfx8ErZLA8ojwf6k3HmzCUfFhoYhuDWvyF9ZkLeD1ALAUVshBYH4n/3CcA+P
         +gXbc7K0t0HtT1GFxX5OBcydjbNl69TfaN0agYIfk/O0cBzlTEbCebYIARexmsEIUfRT
         C80iNz8V2SvQ/dgg9sQbSONeQd2BczyISB5gnshQqh/qeNznNLFaWJ7GpmqRL6pmbOZV
         L1s0QmZ19e9WepEEGKcDL0xCQUZVxB8zJyJTky8/nTi88CDSWW9VSCVXNiJIXmAidTE/
         1Yx5S795hK52pjzJyd4JQ2n2DPARLXRDDrWOrCkTqyxT1M1KBsNHL+qsjSKr/jZL9Km4
         X0lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WSjnQNvspGmmDZsOu+XUcYNWj5wosTqN8XrzdpzoIi0=;
        fh=Pvwl0EDiHQYQbkmX+mWc/I/mc4m6pC5sLemtAxksSfo=;
        b=DUM4J91K7ZTyHUzZ1DlwVbmJb8VYk5HDxQNxyX2QCnRgrPflT2SPX5IQ3bAEZ3dTUs
         2vXOjiohXrWyo/5giBll2kq0/NcFyyesBh6rKP0Yss52NBwzdF0fqucTkQ+0XJ57VjbN
         XSTS0OoAmpGiHx49Ov5DpIQmz4bzFdrpmKT/WZGC69ND/LpxL6QcW0VHpBaBaS0HEj9q
         eZKPoeZ5Xo4Eu5uIj0AKWuiUpDjqWur7+TmrTpyzxe2nAg/lTnBbihiUXz7wxlwdyYM3
         lCnpvpOZPXo8I7pbFb0rnmxu78VJz5KjyvdeIjgYB7VlL6z9nQz8rcxAnA7TnBPwBp9d
         WnoA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774515446; x=1775120246; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WSjnQNvspGmmDZsOu+XUcYNWj5wosTqN8XrzdpzoIi0=;
        b=NswiVfE6DIfdvKx9UkiBT+JgksWUo5htHCnaR5lVRKe/5fuKKtCt/BN0i8eY6I7YHn
         mNJaQeCS6lKJvdmCFl/9SM7QUe06oRjJamGfIE2TegekXa941P/bCySbb22JbHMn7EVn
         PK1r2Sn8S0CeiOHkxD/HxeiEjj1mlJ/jWvARQLgNspC/g5IJ1BV5csf5XsqY5Urc7QT3
         UEfu+tAuw4lp/DP1Q0YmvvBzHJVWw8qVN8qzGrJHjgGgZSQeUh38XtzZRdAtjaM6zGYr
         pSO+29EWSgPFlserQm4LV2KcL2Bq/XCOOxzEgWYn36rhPiV4a8Kvqp7kEVHzJ0LsECm7
         D1Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774515446; x=1775120246;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WSjnQNvspGmmDZsOu+XUcYNWj5wosTqN8XrzdpzoIi0=;
        b=E33Cr+VXO1I/vkbARKOHnX0A8p0wnk/6s70aNR8dzHWwboTlDNwpc3Xp+KQmUnRqU4
         oka4skS9BcEpJuibk4+Y5OXWFMMT6tZl4JRIGwhA6Yo9kkNVRzD04FK7Rg5jPg8ROVkx
         zWNZGKdto4RGeYhk62B2pZ6JF20hCwQFbmGNzG+dexO35i0gVrzvu8tOAPdY9588SLE1
         VTos0vFTCFVO2+yqO+DyNH+K2t+60CkES8NaQopVMxqhvx75w9Cy4V5/AYrlVWDBjhxB
         CHu2X0UNB1v3XGrxbBeZ8WF6ho6u48598oxT452kEyachg5ZPz5P7cW8qEQ/wEE6VnuJ
         +jwA==
X-Forwarded-Encrypted: i=1; AJvYcCVWk51KXKjizDWcWhyP9ouSi5EQpXr+3laHsG9ITO5efw1qvQw1r7oL8SNrXnNgibE+rVKZLV9+ZXCoOVKScshs@lists.infradead.org
X-Gm-Message-State: AOJu0YyAl/KIwTumJhhLF3V29zR1mlcJGv6C9qSswPnBEOhX/EC9qCrt
	37WIWMjC032xs2uTHyuNCXGmcMagWMUC9In0Ph4TlE2jsMwgPaeIp35RfzG2U3Jw38lEkavGbKm
	xafJK6DxLcoOdHs8xmEzXWuC4ZC0giVc=
X-Gm-Gg: ATEYQzxhHrllOB7uD8VgXgKdvZp8kQhwUJP9Fnmnzf5DsCcbR5IQqd7oun1ypyK/Rw1
	x5Esg95PJjlQmDch5YFSE5Mm8JyHChtYvX3+F5m7CuiFgooc6l0qjrF5h49MIrLjKvYVW9zk19d
	R3By7YIp1YwtJWY7TJsYe25QM5Rh//dhEznV55QStSt2joZhBJ9ykQAed8C3brli6L++SL84fsV
	ArfBoJaTix2Lb4PaZC1ZlS4V0FpWnNXOxvNSeHNuV8St4Ggj2XV5aOu6iZE2sn/WM4ty6QySwOb
	DnXjlM7EG2xxBrLQX7HBFP8=
X-Received: by 2002:a05:6402:27d4:b0:665:5e1b:de04 with SMTP id
 4fb4d7f45d1cf-66a82622630mr4696822a12.8.1774515445904; Thu, 26 Mar 2026
 01:57:25 -0700 (PDT)
MIME-Version: 1.0
References: <20260318171706.2840512-1-puranjay@kernel.org>
In-Reply-To: <20260318171706.2840512-1-puranjay@kernel.org>
From: Puranjay Mohan <puranjay12@gmail.com>
Date: Thu, 26 Mar 2026 08:57:14 +0000
X-Gm-Features: AQROBzB7QhJ548_kCWv2yOw_2QglR5rh_u7vEtjQXGJvuYjl-MbQL5_xSVj3SE8
Message-ID: <CANk7y0jnY-V7Hv912gwc45jSx2UqLw5PBcdOdoFfS175bNuDmg@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] arm64: Add BRBE support for bpf_get_branch_snapshot()
To: bpf@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Martin KaFai Lau <martin.lau@kernel.org>, 
	Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, Leo Yan <leo.yan@arm.com>, 
	Rob Herring <robh@kernel.org>, Breno Leitao <leitao@debian.org>, 
	linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
	kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_015729_108119_2DC53260 
X-CRM114-Status: GOOD (  31.95  )
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

Hi Catalin, Mark, and Will,

Would you mind taking a look at this patchset when you have a chance?

Thanks,
Puranjay

On Wed, Mar 18, 2026 at 5:17=E2=80=AFPM Puranjay Mohan <puranjay@kernel.org=
> wrote:
>
> v1: https://lore.kernel.org/all/20260313180352.3800358-1-puranjay@kernel.=
org/
> Changes in v2:
> - Rebased on arm64/for-next/core
> - Add per-CPU brbe_active flag to guard against UNDEFINED sysreg access
>   on non-BRBE CPUs in heterogeneous big.LITTLE systems.
> - Fix pre-existing bug in perf_clear_branch_entry_bitfields() that missed
>   zeroing new_type and priv bitfields, added as a separate patch with
>   Fixes tags (new patch 2).
> - Use architecture-specific selftest threshold (#if defined(__aarch64__))
>   instead of raising the global threshold, to preserve x86 regression
>   detection.
>
> RFC: https://lore.kernel.org/all/20260102214043.1410242-1-puranjay@kernel=
.org/
> Changes from RFC:
>  - Fix pre-existing NULL pointer dereference in armv8pmu_sched_task()
>    found by Leo Yan during testing (patch 1)
>  - Pause BRBE before local_daif_save() to avoid branch pollution from
>    trace_hardirqs_off()
>  - Use local_daif_save() to prevent pNMI race from counter overflow
>    (Mark Rutland)
>  - Reuse perf_entry_from_brbe_regset() instead of duplicating register
>    read logic, by making it accept NULL event (Mark Rutland)
>  - Invalidate BRBE after reading to maintain record contiguity for
>    other consumers (Mark Rutland)
>  - Adjust selftest wasted_entries threshold for ARM64 (patch 3)
>  - Tested on ARM FVP with BRBE enabled
>
> This series enables the bpf_get_branch_snapshot() BPF helper on ARM64
> by implementing the perf_snapshot_branch_stack static call for ARM's
> Branch Record Buffer Extension (BRBE).
>
> bpf_get_branch_snapshot() [1] allows BPF programs to capture hardware
> branch records on-demand from any BPF tracing context. This was
> previously only available on x86 (Intel LBR) since v5.16. With BRBE
> available on ARMv9, this series closes the gap for ARM64.
>
> Usage model
> -----------
>
> The helper works in conjunction with perf events. The userspace
> component of the BPF application opens a perf event with
> PERF_SAMPLE_BRANCH_STACK on each CPU, which configures the hardware
> to continuously record branches into BRBE (on ARM64) or LBR (on x86).
> A BPF program attached to a tracepoint, kprobe, or fentry hook can
> then call bpf_get_branch_snapshot() to snapshot the branch buffer at
> any point. Without an active perf event, BRBE is not recording and
> the buffer is empty.
>
> On-demand branch snapshots from BPF are useful for diagnosing which
> specific code path was taken inside a function. Stack traces only show
> function boundaries, but branch records reveal the exact sequence of
> jumps, calls, and returns within a function -- making it possible to
> identify which specific error check triggered a failure, or which
> callback implementation was invoked through a function pointer.
>
> For example, retsnoop [2] is a BPF-based tool for non-intrusive
> mass-tracing of kernel internals. Its LBR mode (--lbr) creates per-CPU
> perf events with PERF_SAMPLE_BRANCH_STACK and then uses
> bpf_get_branch_snapshot() in its fentry/fexit BPF programs to capture
> branch records whenever a traced function returns an error.
>
> Consider debugging a bpf() syscall that returns -EINVAL when creating
> a BPF map with invalid parameters. Running retsnoop on an ARM64 FVP
> with BRBE to trace the bpf() syscall and array_map_alloc_check():
>
>   $ retsnoop -e '*sys_bpf' -a 'array_map_alloc_check' --lbr=3Dany \
>              -F -k vmlinux --debug full-lbr
>   $ simfail bpf-bad-map-max-entries-array  # in another terminal
>
> Output of retsnoop:
>
>   --- fentry BPF program (entries #63-#17) ---
>
>   [#63-#59] __htab_map_lookup_elem: hash table walk with memcmp        (h=
ashtab.c)
>   [#58] __htab_map_lookup_elem+0x98  -> dump_bpf_prog+0xc850           (h=
ashtab.c:750)
>   [#57-#55] ... dump_bpf_prog internal branches ...
>   [#54] dump_bpf_prog+0xcab8        -> bpf_get_current_pid_tgid+0x0    (h=
elpers.c:225)
>   [#53] bpf_get_current_pid_tgid+0x1c -> dump_bpf_prog+0xcabc          (h=
elpers.c:225)
>   [#52-#51] ... dump_bpf_prog -> __htab_map_lookup_elem ...
>   [#50-#47] __htab_map_lookup_elem: htab_map_hash (jhash2), select_bucket
>   [#46-#42] lookup_nulls_elem_raw: hash chain walk with memcmp         (h=
ashtab.c:717)
>   [#41] __htab_map_lookup_elem+0x98  -> dump_bpf_prog+0xcaf8           (h=
ashtab.c:750)
>   [#40-#37] ... dump_bpf_prog -> bpf_ktime_get_ns ...
>   [#36] bpf_ktime_get_ns+0x10       -> ktime_get_mono_fast_ns+0x0      (h=
elpers.c:178)
>   [#35-#32] ktime_get_mono_fast_ns: tk_clock_read -> arch_counter_get_cnt=
pct
>   [#31] ktime_get_mono_fast_ns+0x9c -> bpf_ktime_get_ns+0x14           (t=
imekeeping.c:493)
>   [#30] bpf_ktime_get_ns+0x18       -> dump_bpf_prog+0xcd50            (h=
elpers.c:178)
>   [#29-#25] ... dump_bpf_prog internal branches ...
>   [#24] dump_bpf_prog+0x11b28       -> __bpf_prog_exit_recur+0x0       (t=
rampoline.c:1190)
>   [#23-#17] __bpf_prog_exit_recur: rcu_read_unlock, migrate_enable     (t=
rampoline.c:1195)
>
>   --- array_map_alloc_check (entries #16-#12) ---
>
>   [#16] dump_bpf_prog+0x11b38       -> array_map_alloc_check+0x8       (a=
rraymap.c:55)
>   [#15] array_map_alloc_check+0x18  -> array_map_alloc_check+0xb8      (a=
rraymap.c:56)
>         . bpf_map_attr_numa_node       . bpf_map_attr_numa_node
>   [#14] array_map_alloc_check+0xbc  -> array_map_alloc_check+0x20      (a=
rraymap.c:59)
>         . bpf_map_attr_numa_node
>   [#13] array_map_alloc_check+0x24  -> array_map_alloc_check+0x94      (a=
rraymap.c:64)
>   [#12] array_map_alloc_check+0x98  -> dump_bpf_prog+0x11b3c           (a=
rraymap.c:82)
>
>   --- fexit trampoline overhead (entries #11-#00) ---
>
>   [#11] dump_bpf_prog+0x11b5c       -> __bpf_prog_enter_recur+0x0      (t=
rampoline.c:1145)
>   [#10-#03] __bpf_prog_enter_recur: rcu_read_lock, migrate_disable     (t=
rampoline.c:1146)
>   [#02] __bpf_prog_enter_recur+0x114 -> dump_bpf_prog+0x11b60          (t=
rampoline.c:1157)
>   [#01] dump_bpf_prog+0x11b6c       -> dump_bpf_prog+0xd230
>   [#00] dump_bpf_prog+0xd340        -> arm_brbe_snapshot_branch_stack+0x0=
 (arm_brbe.c:814)
>
>                    el0t_64_sync+0x168
>                    el0t_64_sync_handler+0x98
>                    el0_svc+0x28
>                    do_el0_svc+0x4c
>                    invoke_syscall.constprop.0+0x54
>     373us [-EINVAL] __arm64_sys_bpf+0x8
>                     __sys_bpf+0x87c
>                     map_create+0x120
>      95us [-EINVAL] array_map_alloc_check+0x8
>
> The FVP's BRBE buffer has 64 entries (BRBE supports 8, 16, 32, or
> 64). Of these, entries #63-#17 (47) are consumed by the fentry BPF
> trampoline that ran before the function, and entries #11-#00 (12)
> are consumed by the fexit trampoline that runs after. Entry #00
> shows the very last branch recorded before BRBE is paused: the call
> into arm_brbe_snapshot_branch_stack().
>
> The 5 useful entries (#16-#12) show the exact path taken inside
> array_map_alloc_check(). Record #14 shows a jump from line 56
> (bpf_map_attr_numa_node) to line 59 (the if-condition), and #13
> shows an immediate jump from line 59 (attr->max_entries =3D=3D 0) to
> line 64 (return -EINVAL), skipping lines 60-63. This pinpoints
> max_entries=3D=3D0 as the cause -- a diagnosis impossible with stack
> traces alone.
>
> [1] 856c02dbce4f ("bpf: Introduce helper bpf_get_branch_snapshot")
> [2] https://github.com/anakryiko/retsnoop
>
> Puranjay Mohan (4):
>   perf/arm_pmuv3: Fix NULL pointer dereference in armv8pmu_sched_task()
>   perf: Fix uninitialized bitfields in
>     perf_clear_branch_entry_bitfields()
>   perf/arm64: Add BRBE support for bpf_get_branch_snapshot()
>   selftests/bpf: Adjust wasted entries threshold for ARM64 BRBE
>
>  drivers/perf/arm_brbe.c                       | 79 ++++++++++++++++++-
>  drivers/perf/arm_brbe.h                       |  9 +++
>  drivers/perf/arm_pmuv3.c                      | 16 +++-
>  include/linux/perf_event.h                    |  2 +
>  .../bpf/prog_tests/get_branch_snapshot.c      | 13 ++-
>  5 files changed, 110 insertions(+), 9 deletions(-)
>
>
> base-commit: d118f32246fdabfb4f6a3fd2e511dc5e622bc553
> --
> 2.52.0
>

