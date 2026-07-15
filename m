Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E82A1C44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 13:25:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MIyXXD/1ObhjMvzQvOK5SfD5jJjoFUQVdkb8pW0CIHs=; b=inGdOfs+oYK7PC3/15cHs0EWck
	nFQ9oqqt0TexqpR2vqElAW+fMV8DjJ+l25qx4uAf7irpSxRvSpCJvvjFrlNIDDWwd92P4ELyqrsPz
	I+xQsImkarXZ1Kq9C0dTn9SpptLjIHWGMmbBxFwa27ZGX7qNM+pcGixFf9kKdaiqEpVTnD5ll1xsx
	yKmhEMh4VmHSiJRKrLbbI2gi0WdmuGEYoywn9E6NpI8QhZp150hqtJApjksMY6r/Q7/k0uF3tvJ7L
	rIQ6hEzX4EX8ZGXJfmEefyltWiFC2sR0LmbAfZXOrmnKVOl8rVbiod/L5+sunwcokCe6dda/lTajl
	SXR9+rrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjzbl-0000000EwDD-04ZF;
	Wed, 15 Jul 2026 13:25:05 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjzbi-0000000EwCd-3gax
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 13:25:04 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2caf228a910so41009625ad.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 06:25:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784121901; cv=none;
        d=google.com; s=arc-20260327;
        b=OZkiRJ1Hy6ZIUDuJ7K78Uml9pJMu5axFKGflvUsYf4SeK7MfQoXQzMrQ9CD90pRfeU
         gK48nWML7AIDliSoqgeNwnJy6Fvg1G3DuXi6UYvBdTYqLtJufRag8YNJVRBAIV3haz1l
         aK75I1hWx8xZb1dCiNF3lZyQ9YgCEj3Yw4qtcLSLxHoLneS6tL5/TM3uxDAktENoKbBz
         GA27oX8m12D9CDzXFaxZlIhVgVar8d7f03YcFpeaViqbuF4goCBcjl+26LXYLugVCoLP
         mBzCZMTPl9jRf038XoQxfpw1H8u/SE4L9sy21QJh5RnLckRNftVwC5dicZk5TZlne/jR
         bBaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MIyXXD/1ObhjMvzQvOK5SfD5jJjoFUQVdkb8pW0CIHs=;
        fh=8iNL/k6RHSlT2303RG5Zh+FC/25K8nk/yLM1BimMxaE=;
        b=AVzrS/DKubplPeBepZKlykwo+B7k/NRaUVL0KugzxX1HMpplPVQFhEKe8vljqK5g90
         GvJYk6m9TqLyfFA+DaOK44weLT7QxUxV51kKGvX65f4kOy7o3j5YDI3IdXrVRbj6/i/M
         xkz9gZj8t33HhiyTSFbeGf4aDL960Ywm1rSnfPPkVGmA35gSJT62RepzCkPr93YL2f6z
         Ih8vbqxrCXBVsAPXsDGmwuDaMCDvrDNruvjOQL/XwT3yeAPUuNcQrHbswqtGw2I23hkS
         HIaWjZ1S8h5A9BTmhNhUnbMILYxRVohSQZX75fUImkL36+bLrg0yOALHnTTLoIzYn7+9
         EwWQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784121901; x=1784726701; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MIyXXD/1ObhjMvzQvOK5SfD5jJjoFUQVdkb8pW0CIHs=;
        b=n4e6cUxqNJxT7TUQU3tKG8B2WQr70OrF4lb01Op/ylrMTDLAw7bpJpqX3xG7JXfSDe
         FSHEkEE2olgoW48tw/+CM8p07msVUXCtyzsMC/0hQAbfRnFOTmJQqjIYKH8lO8xbRwrl
         hLOyzl+nKS+rL2A+6NCqaJFzzpE2pUhlieZTk8T81VqPYoaz/ecIw/7zUnrWEs7BFtGG
         7MV6Ie4leeQF3JGgN2bUtEet13HkR2xxNhA88hxF/q/6h0Y8FzFHYVOka+Qo/Xg0Re1G
         ygmx7wn/aS+2naLwzqXcqc1xVsizDhoYqdlEPfN/HebRhe8IarMy05f57llSZU3r1cWC
         xh+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784121901; x=1784726701;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MIyXXD/1ObhjMvzQvOK5SfD5jJjoFUQVdkb8pW0CIHs=;
        b=IzMrnQ0FlwnNx6i/V8MJQX3tByO0nf2DA/n3raGjk/pm7v9/bPFfp69FFtYPwWp/Gp
         L1rN8qRNoQ09PVFhQwqeBlyaLadWkEEEvcD0S5S2aGunkVT6dBSZDe6lJUJGl1wwpfzu
         L4CM8M5XDiCk1LrAr7zdKu0OIUWuvDjiwC66RUIbo1Vd83fIdSi/xN5t84uyNSHTcUGy
         87+B9pTlgbONRX3JO5wow/0lG/3UsKl+J6PnDGCOqz/8v8L5VzSkFpiLyYfdoVZ+iArT
         RmOoJcQn0T5tSgrh/BrwTAoUKkxyMlRpa0Rfl20CXVQpGYTJgQPlayzr2wNXVD5GHcNF
         m35A==
X-Forwarded-Encrypted: i=1; AHgh+RovKGc2d4uOE8CLmslNNDNwlHhqcPwZ2ITAbfV5a1VggCtqvo4Zqz63biKmiaMLOZH9PGVPdxKEgn9GjrZW9T3G@lists.infradead.org
X-Gm-Message-State: AOJu0YwRIl9taseNbh7LEjAHXgCZb6yPm5yLlwDPJwYVfcXh5ZZ+AGtb
	LMr3E0cjgBBfFrAHfZN3O0Ihp+6YDAH3e4vHh/83rN47nx/stCh/fhcOIzkwylXquFa963Gevrz
	Yhx0hJFPRoCH2FMkgbJK8NVxk3/o9MYo=
X-Gm-Gg: AfdE7clPn5FpT9xCEI5o2E5vBBtQrhUk0JNm7vlFr7a86ZeHpzIyzJTY8cjZ5eDsIL8
	zWUiE+qHhET9RUmRt7TZ577B4nfby0Rw8gyJcHiUP/nREtQ4t5a7O5JYpcXA+uI7Jol2Znz0gd3
	tIlfNW8er/i0RmKdLEDzSsQLdsyq+zlH203O3CtNP9olpJoPe/HxitPm02VioLipH7s1npxpAR8
	Pxcg9aUDz8BlEoRju012OqQjWEjhjf3E9x2Kdc0l17OrSGbo8crmFQPsG34cmbpcL+V2iaZoJZy
	VwNvmy/zhdFB
X-Received: by 2002:a17:903:32c8:b0:2cc:9179:325 with SMTP id
 d9443c01a7336-2cf03c10898mr24774215ad.13.1784121901140; Wed, 15 Jul 2026
 06:25:01 -0700 (PDT)
MIME-Version: 1.0
References: <20260616155716.2631508-1-puranjay@kernel.org>
In-Reply-To: <20260616155716.2631508-1-puranjay@kernel.org>
From: Puranjay Mohan <puranjay12@gmail.com>
Date: Wed, 15 Jul 2026 14:24:44 +0100
X-Gm-Features: AUfX_mwWBOKbyfSmJxs0-FaIwsp_KQBgG-zpi2QhGXcbzGJBUKacwgaiXD7t2Qs
Message-ID: <CANk7y0j0j9GH7GpN6ahjiUwab_884csZcecrVsfBHupUANMgNw@mail.gmail.com>
Subject: Re: [PATCH v5 0/4] arm64: Add BRBE support for bpf_get_branch_snapshot()
To: bpf@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, 
	Will Deacon <will@kernel.org>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	John Fastabend <john.fastabend@gmail.com>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Catalin Marinas <catalin.marinas@arm.com>, 
	Leo Yan <leo.yan@arm.com>, Rob Herring <robh@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	James Clark <james.clark@linaro.org>, Ian Rogers <irogers@google.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, Shuah Khan <shuah@kernel.org>, 
	Breno Leitao <leitao@debian.org>, Ravi Bangoria <ravi.bangoria@amd.com>, 
	Stephane Eranian <eranian@google.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, Usama Arif <usama.arif@linux.dev>, 
	linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_062502_953858_5A7C1BFE 
X-CRM114-Status: GOOD (  36.67  )
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

Hi Mark and Will,

Could you please have a look at this patchset when you get a chance?

It has been reviewed by Rob.

Thanks,
Puranjay

On Tue, Jun 16, 2026 at 4:57=E2=80=AFPM Puranjay Mohan <puranjay@kernel.org=
> wrote:
>
> Changelog:
>
> v4: https://lore.kernel.org/all/20260527121207.2312181-1-puranjay@kernel.=
org/
> Changes in v5:
> - Rework patch 2: drop the UAPI union. Instead rename the helper to perf_=
clear_branch_entry() and
>   clear the entry with a single
>         *br =3D (struct perf_branch_entry){ }.
>   This stays kernel-internal, with no changes to the uapi/ or tools/ head=
ers (James Clark).
> - Add an isb() to the BRBCR_EL1 =3D=3D 0 early-exit in the snapshot, for =
consistency with the other
>   two exit paths (bpf-ci).
> - Add Rob Herring's Reviewed-by to patch 3
>
> v3: https://lore.kernel.org/all/20260413185740.3286146-1-puranjay@kernel.=
org/
> Changes in v4:
> - Fix leaking branch records when scheduled task has an unrelated perf ev=
ent (Sashiko)
> - Update tools/include/uapi/linux/perf_event.h as well for patch 2
> - Introduce cpu_has_brbe() and use it in
>   arm_brbe_snapshot_branch_stack(0 to make sure we don't run on a CPU
>   without BRBE.
> - Add explicit isb() after after writing to SYS_BRBFCR_EL1.
> - Rebase on latest arm64 tree.
>
> v2: https://lore.kernel.org/all/20260318171706.2840512-1-puranjay@kernel.=
org/
> Changes in v3:
> - Move NULL pmu_ctx fix from arm_pmuv3.c to perf core (Leo Yan)
> - Use union to clear branch entry bitfields instead of per-field
>   zeroing (Leo Yan)
> - Remove per-CPU brbe_active flag; check BRBCR_EL1 =3D=3D 0 instead (Rob
>   Herring)
> - Remove redundant valid_brbidr() check in snapshot path (Rob Herring)
> - Introduce for_each_brbe_entry() iterator to deduplicate bank
>   iteration (Rob Herring)
> - Include perf core maintainers (Leo Yan, Rob Herring)
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
>   perf/core: Fix sched_task callbacks for CPU-wide branch stack events
>   perf/core: Clear the whole branch entry in perf_clear_branch_entry()
>   perf/arm64: Add BRBE support for bpf_get_branch_snapshot()
>   selftests/bpf: Adjust wasted entries threshold for ARM64 BRBE
>
>  arch/x86/events/amd/brs.c                     |   2 +-
>  arch/x86/events/amd/lbr.c                     |   2 +-
>  arch/x86/events/intel/lbr.c                   |   6 +-
>  drivers/perf/arm_brbe.c                       | 130 +++++++++++++++---
>  drivers/perf/arm_brbe.h                       |   9 ++
>  drivers/perf/arm_pmuv3.c                      |   5 +-
>  include/linux/perf_event.h                    |  16 +--
>  kernel/events/core.c                          |  17 ++-
>  .../bpf/prog_tests/get_branch_snapshot.c      |  13 +-
>  9 files changed, 150 insertions(+), 50 deletions(-)
>
>
> base-commit: 61c19a9feb1d87156e46e38d7759f3ad23710e24
> --
> 2.53.0-Meta
>

