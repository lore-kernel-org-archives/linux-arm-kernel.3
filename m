Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2DF5C531CB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 11:38:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3Vm/pUOpaksqwrAeLPB+SFjhRptlFPQ3mBtxFAX2gIE=; b=MRBFMObXutY3KuE8IBECB/wmWF
	Yki+6cwKO6IDlaL0rTffjOJ2r6jMG8pxs8ZZAXJeL/5kZAzv1RdTOR1CV8GycDakGkmTo8CWQJ2/c
	Z8ePWUNhhGo0Fp6bUiv8NVgOzr30wSEYxk1iPNLl7U3Zh05Jza5QtkfHHVKzXd9lVudlzLBAWA/Q4
	uEt4Z3dSxyq9POkZyMwBOw66frL2M18eWbHY/ZvgEv6eHlpJKAD5FmMezf0IuQ+Rx48lfXpATZuat
	Z21ETQ6ZPbzaCoCCp9L6guAljF/+HgUV54hfurgNJ4/poZeeUGAmVDfh7+koyVhYPULf3p9Me1iaS
	dvsa9Tew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmrlA-0000000EAoP-3RRR;
	Thu, 23 Jul 2026 11:38:40 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmrl8-0000000EAnj-0C90
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 11:38:39 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-69a5ecbbfb2so937906a12.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jul 2026 04:38:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784806716; cv=none;
        d=google.com; s=arc-20260327;
        b=EuLkSTwq20hAfyC6K4Q5rRFOtOBTECKv4na1MyiDFJUcmVxOkUq1sT3dPR4qbdnweB
         x6Bb5InmRlsD+ibgjBeeKDhyh/WWxwhhEYyyMeX5lp/4tvIkS7+q8bLAj3UnGfTBdv+6
         c6Hql+rD3O6ZWUNrfBNVykNXZHJzFp4kMPsvwgpzyhf65uhUtx44e48IEFsF5+qN1WBM
         6PMhLrTdTthZGTsZD+GXlTwYip+uQjPvhOVTmEN6PVwOFtNxv6QtaCkArHon/FSpz+6p
         M8sRc8kFHxKjd3WayzOTLMMKoz+cPVImKV5wqobqEuKMUhYeNn8ULqTjhYH1QrB8IE4m
         Sqjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3Vm/pUOpaksqwrAeLPB+SFjhRptlFPQ3mBtxFAX2gIE=;
        fh=bEfJPLcPtKc/qCTrSPgPx6Hi8cpeVbOvqyU8EeOLGqg=;
        b=eU4wJBjg5rmz/mJ6YPMy0aUat4QLrrzuGtqLlCUiD1ZjOxG0wX2kChSWbTFIUHYxFt
         ZAUdupxY2hoViuNP7C8oKCuXd2+j2KzjUXA+RWWRttv1bSszFo8ybnbEKrgFt3MWv/iM
         xDEn/jT+l60NF1hFU7T2pQSKOKuoYQWtpOY/8U6jHYFd+s/8oZDr1NWDjFuQ43on+0ud
         u0kbGd5f+nmWUzW8djfwpqbvOc16q7kwHxMTIP91b/BzzqS9XBbIPSVSB4ffYPBL4iiZ
         5mM/RJkmfLCA3eUNiUmIs2WCgvXSwS0+qLhzexeGxjJhKZJFizA4UHGt4vFsFD3/BmqF
         fd6A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784806716; x=1785411516; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3Vm/pUOpaksqwrAeLPB+SFjhRptlFPQ3mBtxFAX2gIE=;
        b=ZVNuznbOGYft17A1VOFjXw7DykFN5Pk8fomgrM025KHH2pJslDu2xYNAA7xQZcEeeH
         UIaGG9zDUxkXbrion7d3FiJQm7td737aWAFxYNGlsXb+Q3Ib1ek8JvUaix4hadOwMk+l
         3FzC7Bl5TIB/AFI4JzV+/nI/unmSL6yEuyD/EljCzgbvgTgYbp6vhyGX+7qY4vEBieFb
         x3YNpO/c6Jz4jY74F50RIOyKJcbLjKcuwpA3WPFkDFbVnte38Wnmhf1jtqM1MUhaknKH
         VJZQ2Q4pCUDY1gAbMwTugDLzFCDDTI4QC6SNpuCO8yFMvZ20RKDlkGX6Yova5F1ic9xb
         Hc3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784806716; x=1785411516;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3Vm/pUOpaksqwrAeLPB+SFjhRptlFPQ3mBtxFAX2gIE=;
        b=DnjfM3H5N3mBE7TtqTl7rkvezYzO96kj2CT+MmlNe1y4DmAboNeTLB0PMpkpyvgN2b
         zT7PwSd6Q9kySEMsr7yQ4+rrNM0UC2l+PXHs8i0YKOk15Kd3bnla8pyS08EaMc3fE/MK
         qAEHwG+YeWbSyKup785AcC3LoheMrXLX1zWFAovvjjrVMRhjWoHt//SJAoGQVrV6R1Kh
         xFpIMhecPjkbs6o29nSKaM/aGeEXmVyAb4ueFpZz6RbOwTfTsULUb1Lesih25wuFhpfQ
         Pgf4m+Su5EJrc3pzN1DlXySfLDGvFAOE6S8CKil8t7x5OvKpfhV1378P6vhH/fAsLox7
         eV2A==
X-Forwarded-Encrypted: i=1; AHgh+RrhDyYZQ9cJmofB6cDGg86h98zwvCNAdcBz/E0V0MR09C3HWQZVVeOLMl7LfMeuW5EZq9Iu01XJ8UPWT5wYdnol@lists.infradead.org
X-Gm-Message-State: AOJu0YxEnQfUCCs3Zw743rG1pvnBsXH0tTF4XDFcHYvjM6TlHcQSIXoA
	QHPOPTGZYWvj5haG1koL1UOHl/wi8fm9GtJ1vBJoSGhB41JjLWuXs4IDnXt0JLnaw6wzmLcCwr+
	FmqKhU773hE8amcJ95yDfwFK3cJXiqhw=
X-Gm-Gg: AR+sD11Mrcn5qX60pzZcw4bt6/NDcTo494ij0iPpkR+RcWLAVH+UrVX0sUnuXG0d8T0
	ztBZq2U98x2CZbp+UozUPskBLQj6GGLSNWOS3gDPtdttw55Py041tsT12Q3Vgjj+ebUl83GOz5i
	iL2Hy0Bm8PuIH+YNta08AvDmrQ80MQ9K6hIghxaHmTXOmGCIK8+twRxbs+H4gQYbM9KK+pqBh6G
	k0xFecuiRsOleZHUoy+N1+WXwxjqa59GzWrIFa++Wl4zfpQZifapy0zPOCneIS3VulHjYV0Bi1c
	9A==
X-Received: by 2002:a17:907:7b97:b0:c12:34f0:f7b9 with SMTP id
 a640c23a62f3a-c1c509e5e46mr148807066b.56.1784806715357; Thu, 23 Jul 2026
 04:38:35 -0700 (PDT)
MIME-Version: 1.0
References: <20260616155716.2631508-1-puranjay@kernel.org> <CANk7y0j0j9GH7GpN6ahjiUwab_884csZcecrVsfBHupUANMgNw@mail.gmail.com>
In-Reply-To: <CANk7y0j0j9GH7GpN6ahjiUwab_884csZcecrVsfBHupUANMgNw@mail.gmail.com>
From: Puranjay Mohan <puranjay12@gmail.com>
Date: Thu, 23 Jul 2026 12:38:21 +0100
X-Gm-Features: AUfX_myZif7IV3J6fY3GEVJfNHdIvEqNpLWP5QqsObegWnRGod8mf5TyRQGbYSc
Message-ID: <CANk7y0jv7dYpmts0RpoZT305rXvFQicfEXRsJ4f2_PR2Y4WYxA@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20260723_043838_149124_39F0E4EC 
X-CRM114-Status: GOOD (  43.46  )
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

Gentle ping for this.

I have been waiting for feedback for 7 months now. Please let me know
how I can make this patchset better.

Thanks,
Puranjay

On Wed, Jul 15, 2026 at 2:24=E2=80=AFPM Puranjay Mohan <puranjay12@gmail.co=
m> wrote:
>
> Hi Mark and Will,
>
> Could you please have a look at this patchset when you get a chance?
>
> It has been reviewed by Rob.
>
> Thanks,
> Puranjay
>
> On Tue, Jun 16, 2026 at 4:57=E2=80=AFPM Puranjay Mohan <puranjay@kernel.o=
rg> wrote:
> >
> > Changelog:
> >
> > v4: https://lore.kernel.org/all/20260527121207.2312181-1-puranjay@kerne=
l.org/
> > Changes in v5:
> > - Rework patch 2: drop the UAPI union. Instead rename the helper to per=
f_clear_branch_entry() and
> >   clear the entry with a single
> >         *br =3D (struct perf_branch_entry){ }.
> >   This stays kernel-internal, with no changes to the uapi/ or tools/ he=
aders (James Clark).
> > - Add an isb() to the BRBCR_EL1 =3D=3D 0 early-exit in the snapshot, fo=
r consistency with the other
> >   two exit paths (bpf-ci).
> > - Add Rob Herring's Reviewed-by to patch 3
> >
> > v3: https://lore.kernel.org/all/20260413185740.3286146-1-puranjay@kerne=
l.org/
> > Changes in v4:
> > - Fix leaking branch records when scheduled task has an unrelated perf =
event (Sashiko)
> > - Update tools/include/uapi/linux/perf_event.h as well for patch 2
> > - Introduce cpu_has_brbe() and use it in
> >   arm_brbe_snapshot_branch_stack(0 to make sure we don't run on a CPU
> >   without BRBE.
> > - Add explicit isb() after after writing to SYS_BRBFCR_EL1.
> > - Rebase on latest arm64 tree.
> >
> > v2: https://lore.kernel.org/all/20260318171706.2840512-1-puranjay@kerne=
l.org/
> > Changes in v3:
> > - Move NULL pmu_ctx fix from arm_pmuv3.c to perf core (Leo Yan)
> > - Use union to clear branch entry bitfields instead of per-field
> >   zeroing (Leo Yan)
> > - Remove per-CPU brbe_active flag; check BRBCR_EL1 =3D=3D 0 instead (Ro=
b
> >   Herring)
> > - Remove redundant valid_brbidr() check in snapshot path (Rob Herring)
> > - Introduce for_each_brbe_entry() iterator to deduplicate bank
> >   iteration (Rob Herring)
> > - Include perf core maintainers (Leo Yan, Rob Herring)
> >
> > v1: https://lore.kernel.org/all/20260313180352.3800358-1-puranjay@kerne=
l.org/
> > Changes in v2:
> > - Rebased on arm64/for-next/core
> > - Add per-CPU brbe_active flag to guard against UNDEFINED sysreg access
> >   on non-BRBE CPUs in heterogeneous big.LITTLE systems.
> > - Fix pre-existing bug in perf_clear_branch_entry_bitfields() that miss=
ed
> >   zeroing new_type and priv bitfields, added as a separate patch with
> >   Fixes tags (new patch 2).
> > - Use architecture-specific selftest threshold (#if defined(__aarch64__=
))
> >   instead of raising the global threshold, to preserve x86 regression
> >   detection.
> >
> > RFC: https://lore.kernel.org/all/20260102214043.1410242-1-puranjay@kern=
el.org/
> > Changes from RFC:
> >  - Fix pre-existing NULL pointer dereference in armv8pmu_sched_task()
> >    found by Leo Yan during testing (patch 1)
> >  - Pause BRBE before local_daif_save() to avoid branch pollution from
> >    trace_hardirqs_off()
> >  - Use local_daif_save() to prevent pNMI race from counter overflow
> >    (Mark Rutland)
> >  - Reuse perf_entry_from_brbe_regset() instead of duplicating register
> >    read logic, by making it accept NULL event (Mark Rutland)
> >  - Invalidate BRBE after reading to maintain record contiguity for
> >    other consumers (Mark Rutland)
> >  - Adjust selftest wasted_entries threshold for ARM64 (patch 3)
> >  - Tested on ARM FVP with BRBE enabled
> >
> > This series enables the bpf_get_branch_snapshot() BPF helper on ARM64
> > by implementing the perf_snapshot_branch_stack static call for ARM's
> > Branch Record Buffer Extension (BRBE).
> >
> > bpf_get_branch_snapshot() [1] allows BPF programs to capture hardware
> > branch records on-demand from any BPF tracing context. This was
> > previously only available on x86 (Intel LBR) since v5.16. With BRBE
> > available on ARMv9, this series closes the gap for ARM64.
> >
> > Usage model
> > -----------
> >
> > The helper works in conjunction with perf events. The userspace
> > component of the BPF application opens a perf event with
> > PERF_SAMPLE_BRANCH_STACK on each CPU, which configures the hardware
> > to continuously record branches into BRBE (on ARM64) or LBR (on x86).
> > A BPF program attached to a tracepoint, kprobe, or fentry hook can
> > then call bpf_get_branch_snapshot() to snapshot the branch buffer at
> > any point. Without an active perf event, BRBE is not recording and
> > the buffer is empty.
> >
> > On-demand branch snapshots from BPF are useful for diagnosing which
> > specific code path was taken inside a function. Stack traces only show
> > function boundaries, but branch records reveal the exact sequence of
> > jumps, calls, and returns within a function -- making it possible to
> > identify which specific error check triggered a failure, or which
> > callback implementation was invoked through a function pointer.
> >
> > For example, retsnoop [2] is a BPF-based tool for non-intrusive
> > mass-tracing of kernel internals. Its LBR mode (--lbr) creates per-CPU
> > perf events with PERF_SAMPLE_BRANCH_STACK and then uses
> > bpf_get_branch_snapshot() in its fentry/fexit BPF programs to capture
> > branch records whenever a traced function returns an error.
> >
> > Consider debugging a bpf() syscall that returns -EINVAL when creating
> > a BPF map with invalid parameters. Running retsnoop on an ARM64 FVP
> > with BRBE to trace the bpf() syscall and array_map_alloc_check():
> >
> >   $ retsnoop -e '*sys_bpf' -a 'array_map_alloc_check' --lbr=3Dany \
> >              -F -k vmlinux --debug full-lbr
> >   $ simfail bpf-bad-map-max-entries-array  # in another terminal
> >
> > Output of retsnoop:
> >
> >   --- fentry BPF program (entries #63-#17) ---
> >
> >   [#63-#59] __htab_map_lookup_elem: hash table walk with memcmp        =
(hashtab.c)
> >   [#58] __htab_map_lookup_elem+0x98  -> dump_bpf_prog+0xc850           =
(hashtab.c:750)
> >   [#57-#55] ... dump_bpf_prog internal branches ...
> >   [#54] dump_bpf_prog+0xcab8        -> bpf_get_current_pid_tgid+0x0    =
(helpers.c:225)
> >   [#53] bpf_get_current_pid_tgid+0x1c -> dump_bpf_prog+0xcabc          =
(helpers.c:225)
> >   [#52-#51] ... dump_bpf_prog -> __htab_map_lookup_elem ...
> >   [#50-#47] __htab_map_lookup_elem: htab_map_hash (jhash2), select_buck=
et
> >   [#46-#42] lookup_nulls_elem_raw: hash chain walk with memcmp         =
(hashtab.c:717)
> >   [#41] __htab_map_lookup_elem+0x98  -> dump_bpf_prog+0xcaf8           =
(hashtab.c:750)
> >   [#40-#37] ... dump_bpf_prog -> bpf_ktime_get_ns ...
> >   [#36] bpf_ktime_get_ns+0x10       -> ktime_get_mono_fast_ns+0x0      =
(helpers.c:178)
> >   [#35-#32] ktime_get_mono_fast_ns: tk_clock_read -> arch_counter_get_c=
ntpct
> >   [#31] ktime_get_mono_fast_ns+0x9c -> bpf_ktime_get_ns+0x14           =
(timekeeping.c:493)
> >   [#30] bpf_ktime_get_ns+0x18       -> dump_bpf_prog+0xcd50            =
(helpers.c:178)
> >   [#29-#25] ... dump_bpf_prog internal branches ...
> >   [#24] dump_bpf_prog+0x11b28       -> __bpf_prog_exit_recur+0x0       =
(trampoline.c:1190)
> >   [#23-#17] __bpf_prog_exit_recur: rcu_read_unlock, migrate_enable     =
(trampoline.c:1195)
> >
> >   --- array_map_alloc_check (entries #16-#12) ---
> >
> >   [#16] dump_bpf_prog+0x11b38       -> array_map_alloc_check+0x8       =
(arraymap.c:55)
> >   [#15] array_map_alloc_check+0x18  -> array_map_alloc_check+0xb8      =
(arraymap.c:56)
> >         . bpf_map_attr_numa_node       . bpf_map_attr_numa_node
> >   [#14] array_map_alloc_check+0xbc  -> array_map_alloc_check+0x20      =
(arraymap.c:59)
> >         . bpf_map_attr_numa_node
> >   [#13] array_map_alloc_check+0x24  -> array_map_alloc_check+0x94      =
(arraymap.c:64)
> >   [#12] array_map_alloc_check+0x98  -> dump_bpf_prog+0x11b3c           =
(arraymap.c:82)
> >
> >   --- fexit trampoline overhead (entries #11-#00) ---
> >
> >   [#11] dump_bpf_prog+0x11b5c       -> __bpf_prog_enter_recur+0x0      =
(trampoline.c:1145)
> >   [#10-#03] __bpf_prog_enter_recur: rcu_read_lock, migrate_disable     =
(trampoline.c:1146)
> >   [#02] __bpf_prog_enter_recur+0x114 -> dump_bpf_prog+0x11b60          =
(trampoline.c:1157)
> >   [#01] dump_bpf_prog+0x11b6c       -> dump_bpf_prog+0xd230
> >   [#00] dump_bpf_prog+0xd340        -> arm_brbe_snapshot_branch_stack+0=
x0 (arm_brbe.c:814)
> >
> >                    el0t_64_sync+0x168
> >                    el0t_64_sync_handler+0x98
> >                    el0_svc+0x28
> >                    do_el0_svc+0x4c
> >                    invoke_syscall.constprop.0+0x54
> >     373us [-EINVAL] __arm64_sys_bpf+0x8
> >                     __sys_bpf+0x87c
> >                     map_create+0x120
> >      95us [-EINVAL] array_map_alloc_check+0x8
> >
> > The FVP's BRBE buffer has 64 entries (BRBE supports 8, 16, 32, or
> > 64). Of these, entries #63-#17 (47) are consumed by the fentry BPF
> > trampoline that ran before the function, and entries #11-#00 (12)
> > are consumed by the fexit trampoline that runs after. Entry #00
> > shows the very last branch recorded before BRBE is paused: the call
> > into arm_brbe_snapshot_branch_stack().
> >
> > The 5 useful entries (#16-#12) show the exact path taken inside
> > array_map_alloc_check(). Record #14 shows a jump from line 56
> > (bpf_map_attr_numa_node) to line 59 (the if-condition), and #13
> > shows an immediate jump from line 59 (attr->max_entries =3D=3D 0) to
> > line 64 (return -EINVAL), skipping lines 60-63. This pinpoints
> > max_entries=3D=3D0 as the cause -- a diagnosis impossible with stack
> > traces alone.
> >
> > [1] 856c02dbce4f ("bpf: Introduce helper bpf_get_branch_snapshot")
> > [2] https://github.com/anakryiko/retsnoop
> >
> > Puranjay Mohan (4):
> >   perf/core: Fix sched_task callbacks for CPU-wide branch stack events
> >   perf/core: Clear the whole branch entry in perf_clear_branch_entry()
> >   perf/arm64: Add BRBE support for bpf_get_branch_snapshot()
> >   selftests/bpf: Adjust wasted entries threshold for ARM64 BRBE
> >
> >  arch/x86/events/amd/brs.c                     |   2 +-
> >  arch/x86/events/amd/lbr.c                     |   2 +-
> >  arch/x86/events/intel/lbr.c                   |   6 +-
> >  drivers/perf/arm_brbe.c                       | 130 +++++++++++++++---
> >  drivers/perf/arm_brbe.h                       |   9 ++
> >  drivers/perf/arm_pmuv3.c                      |   5 +-
> >  include/linux/perf_event.h                    |  16 +--
> >  kernel/events/core.c                          |  17 ++-
> >  .../bpf/prog_tests/get_branch_snapshot.c      |  13 +-
> >  9 files changed, 150 insertions(+), 50 deletions(-)
> >
> >
> > base-commit: 61c19a9feb1d87156e46e38d7759f3ad23710e24
> > --
> > 2.53.0-Meta
> >

