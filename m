Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B493C103E179
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 13:37:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D6/bqSpW5+Oi9AxGrrozyndN6Q4jPcmDt6bbbs+htOc=; b=BFzwnTJPTK8yfFY22UD+jQJlsg
	qMZvJiJAhY9W0izNWEuWyc19TlbohD66d6lZGeavegZFZW5ksOiEsiYaLTTVLhn6dlC3DYJWFB4eL
	KiVIzGhgL5t3aCXIeejaGwqfuVgq5hq/v0P1sb9sUdsbfk3TdqRBJ1lbEw9oT0yRyMiajobdw6Zht
	UOmpEVr5gkYhZ1IUeUh0GnL1ZiQgGV/dT0dkqbutp+vFsNVmZ2PaplIiDRKA9cVkN84x16yAzMA+A
	Ug383rw4so7iECjL5afv2HH2bn6Q30vrKD52EZLg47QTq41ThcdTP5ZLwyAup4w64n53ba8w7atPh
	SISnO3LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2r53-00000008Ub0-2xni;
	Wed, 18 Mar 2026 13:37:01 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2r50-00000008UaN-3xY1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 13:37:00 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-b97905516faso583559466b.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Mar 2026 06:36:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773841016; cv=none;
        d=google.com; s=arc-20240605;
        b=CqM9aP110XksBUPil74E+QZrqOcRx1Au+hOUZ0eWKFnsakeo1VwFOw9VSjqyaPIp1S
         Xowcp+bo9reeBKNWNX8VLFOXMYD6/1oCIoBxtxhycUhL2bJ3TFDhuhszHhxfArzITltm
         IJwhx1YrzCF1wO7sI3ZoC4rPW5ojhVmKcLMPDrWUyqvuQnl+jFOxOM4sHW5feXUZaleQ
         rQawN9f+fKipNEr7IMawEDjEZpLkI5d2tBxwMtfmfsIasXsCZrAkvfNbSGF8EyuTCogc
         Sy/GH7LXhBGfjRysdLy27HOhzB9NcSgNZxJm19Bpb4k3YfGhZXyGVmE+o2Mu6Os77VHM
         D0Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=D6/bqSpW5+Oi9AxGrrozyndN6Q4jPcmDt6bbbs+htOc=;
        fh=cI7ykWeZUQueHHAd+SpuDl9k4x8S7gh5ZW+1ynDV0yc=;
        b=A3faZfviam/IXHZDvg3Io5JMWrsbjps5BN8CRvGGMBLsy5T9BSuLKskiJEGzmNcjGX
         GShz0ki3BiX0dy3zrMtOkytstGwM0c3Ww9RLHyI6LmbXX+RG7sedYzg1kIPPieZtxT9k
         TqIMtWEXHNoEPeHThOcab0+xlEk+ulWkZEYPIh0nibMZq1fILDG/z3u3HMw8lLjmnqqI
         iCNHET9N2g7RiRemkDPqF+4iW/JVRMyubX7dNJdj3j7CzODPTsxOxt16B5CIoqoDhBaY
         o6NizC6Wqsz18b7VXWg78KpVho/1J9y9NAbPIm8LvIHWsSvM1q3b15FWV8Tt0oP/bBNT
         YO7Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773841016; x=1774445816; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D6/bqSpW5+Oi9AxGrrozyndN6Q4jPcmDt6bbbs+htOc=;
        b=XOR3IDd1F+t2ZFU9yPgXK08iBnSE6Wuwk+aPwvpGC90nAfTKvrVM8+64Sk3mB9Zeqa
         9enHYY1ZS74swHzKcagGMAf/gF3tl9ttaG/v7YRV63GBuXyrtaRP1fxS2rKU8NXovPqs
         EIJ4nGuj2NQQlphbHLcf15WnbnSUcMh8kLF62VpiWl5U5XjXP+fGOwjYDb1pkoVBqjHx
         rnq8hQF6BfQPpMJfzWcgYgN1ySK4bOgggOnjkXD4FbDYlRhCeWehRHT7eeBKCWLxsOyp
         uOCy3Y3GwK/oj+OYSTpKl+dytH7xXsqmvoPSLTmx+ljSzqWgO+XemQqyl9vIWgRadLu3
         ptbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773841016; x=1774445816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=D6/bqSpW5+Oi9AxGrrozyndN6Q4jPcmDt6bbbs+htOc=;
        b=NpsOfx/6CKJvtoEcB8WXjgVuQEH2U+wRZAk/hMph4DHyEo1HY4ncpjPmQwvEjy6YoG
         gtJIYpLoS+cgNqq6IkJ2hfPsnmPH5fhHy1D9XV/oRmjHOCWvNtpWG5tbM6rgnPUQS+lQ
         FA4EQGQ+Ur+lprb7PZEQ/pOUjHuO3bUJL3lK9AGrb90znfP/rVlBTOSwmJj1K8duhud9
         4gPKFM7OuFD/ZK8zeXUH7g4PlETtAxrcWQ0lccsR+oABEg6RF2nb9lRkvesecKB+9DRb
         D60XJX9qtqK2TvxPoLzQY/p1PLtjKXWbsxbPl45lhAeDfW+iLhKQn5h3+bKk6+rudyiW
         P47Q==
X-Forwarded-Encrypted: i=1; AJvYcCUbn4OF32AMlZydIPsoGuIPeeRStZVnpWY5fqiv+SIOx+amxHeQhZEHK2hNAFHTtqWFgzt2iB8CvsR7l1U5PgUI@lists.infradead.org
X-Gm-Message-State: AOJu0Ywasak+6ftXOetZ4+DupwrjkFfULg31opEAQ8rbIUTJr2XR2t0T
	YVYP6HhTJSV+WbWk+b20wYa+2rUBcCk1uOLbv70O1vrQpcdpRP7ml1+sX6Efe0gWEoHO6sLx/kf
	PIO1nqOojHxfXsmsAtXMKcgTAhStyEKY=
X-Gm-Gg: ATEYQzx6s0/zRHbyalGzPrtvzYLCNIOnxcV0u2xqwNhdDJfNJPMmHCup8JDiiUJAOtq
	eItpexdVSXDJwotwCJUN51u3y9gLIeItIWEapPHoZRUdPCwl/hYRgtAAoF1F6gVuF53MUFf4zaF
	k04SLwZ4re7/G1lnqJTBYK5ld2t9RhQzDOlNjNnZBZdRq2/Lnlku187FVd+4UqDLC6X7yl7D8V3
	F27w/tHMesvduYDTIfpbhVRyJ+tiBBlcPAyL7v9rBcZ4okXvJVq26dGiJth1LWo/HpimW4anIrP
	b12LNK7YzI9uGv06Pqcrw9s=
X-Received: by 2002:a17:907:3f19:b0:b98:5d8:4fcb with SMTP id
 a640c23a62f3a-b9805d85532mr115473766b.33.1773841015811; Wed, 18 Mar 2026
 06:36:55 -0700 (PDT)
MIME-Version: 1.0
References: <20260313180352.3800358-1-puranjay@kernel.org>
In-Reply-To: <20260313180352.3800358-1-puranjay@kernel.org>
From: Puranjay Mohan <puranjay12@gmail.com>
Date: Wed, 18 Mar 2026 13:36:44 +0000
X-Gm-Features: AaiRm500ICMe5FjGPFHKAmejEpH_zDzyFcFIWkH-r90t0VjGj-E8ZcJxEcK1X7c
Message-ID: <CANk7y0jmnraKP7k4Rzapq5jio4GGZwFadT0X12bTc-LoKBkzCg@mail.gmail.com>
Subject: Re: [PATCH bpf 0/3] arm64: Add BRBE support for bpf_get_branch_snapshot()
To: bpf@vger.kernel.org
Cc: Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Martin KaFai Lau <martin.lau@kernel.org>, 
	Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Leo Yan <leo.yan@arm.com>, Rob Herring <robh@kernel.org>, Breno Leitao <leitao@debian.org>, 
	linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
	kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_063659_040507_54B6CCF4 
X-CRM114-Status: GOOD (  30.04  )
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

I will send v2 of this patch with minor changes that I discovered are
needed, will remove the bpf tag and send it based off the arm64 tree
as that is the correct place for this set to go.

On Fri, Mar 13, 2026 at 6:04=E2=80=AFPM Puranjay Mohan <puranjay@kernel.org=
> wrote:
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
> Puranjay Mohan (3):
>   perf/arm_pmuv3: Fix NULL pointer dereference in armv8pmu_sched_task()
>   perf/arm64: Add BRBE support for bpf_get_branch_snapshot()
>   selftests/bpf: Adjust wasted entries threshold for ARM64 BRBE
>
>  drivers/perf/arm_brbe.c                       | 70 ++++++++++++++++++-
>  drivers/perf/arm_brbe.h                       |  9 +++
>  drivers/perf/arm_pmuv3.c                      | 16 ++++-
>  .../bpf/prog_tests/get_branch_snapshot.c      |  9 +--
>  4 files changed, 95 insertions(+), 9 deletions(-)
>
>
> base-commit: ca0f39a369c5f927c3d004e63a5a778b08a9df94
> --
> 2.52.0
>

