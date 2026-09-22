Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41996C98302
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 20:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pt1Jvyl7y2ucT15n2cP/CxwuiPgjJqJ1dgsK6z+frno=; b=ztssa8wgYKf2+wXhr2pE1cigVd
	Fo/UJ7Po1hT+nfJatpzsMeKmXTQbcq/rs69IFcIJAoF/4ygFDupO4Ob3lsQdQEVjAwi5vDMKc8TEW
	Jhs9NKuOU03ps1wgt7Op91rxZ53JNxt5tIijrxY3F3kacJXY1ZopRxhCCByDwRuOvyRQdBvqZ2aJc
	/pRPrhxwC0gZBue40enKZ8aPvCOy3UxXIeHdpbFu/vY5LvEZfHdGGMdU2RxQWbG94ziM46rjOMISl
	q6c2s89Cb/s/7+hGRNrkpX+dmOdOOqaqyO5t3CP/5y/ExX7gDfFPoGbXAyXlE3B9iAi4Gev5ahZ4S
	LZd8oDrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x97Ht-00000006YOB-3wtZ;
	Tue, 22 Sep 2026 20:40:25 +0000
Received: from mail-pz2-x10.google.com ([2607:f8b0:4864:3b::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x97Hq-00000006YNW-3aTv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 20:40:24 +0000
Received: by mail-pz2-x10.google.com with SMTP id 41be03b00d2f7-cc4aa0f1a94so187052a12.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 13:40:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790109622; cv=none;
        d=google.com; s=arc-20260327;
        b=gZRjWoGRzgjbJlU1EJBdvqywuJ86hguOOAwlFQVlpP3gyVZdgrkp6dqp1To5tVhjoZ
         sE6nMA47Avc+OLxsA4gKB3am7F9o0aGhKPLt7tZc//62vuhWMsBXrvZFDNnxvxntjDHZ
         AtF8K4Kde4i7dNQLhea3yFw9Q1f303BhaFoftfCkwB0JXla8VZKiISl6nPfGTUazvDhr
         dH42y+hLx2vg3pLR3j3Ra6mU7OlYKFdnXgk7kTg9X9ALugjhvC1MCyE4vB7yCtrS2V7Z
         IDEIYFKPksbib8vV2mXFspuqLRuqFoMG31nvGxvV2dxpzRttluOblRh9RSyQWCof3hXf
         /yxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pt1Jvyl7y2ucT15n2cP/CxwuiPgjJqJ1dgsK6z+frno=;
        fh=YQ2yXEXJcFaqHatj+OkDGR9RdvQ+8TRi3Pc+SpSWpfI=;
        b=ThfXQ3aH9j6DYBV5sNmRdRw+7SnaigJ+wjxOOpTNhena6kYnbQLDQj4wGHEA9Kk2e3
         ySKZ8TlUyP5R9ANohsSA2ix5HLQt0DkioteF7awcbHX2o/zQk7w1Y117JqwU+wLSZgrB
         +KCX2y+meiX+2jeV82TAoUwKdJuPRaNGyHIGwOfRTIdv8HB/ppQ4KZm3myzp1K7bAjXc
         c0AvL08dgd0pecyfshF5iJIJ+Rk3K3ZPtITaK9v3r89LjqrrEwWCh19MeV6sdFsqD7bM
         edT6Gv2mP9ceB3yeTSOFWK7sAhrtoBnCWivbzPpvOl4XWQpKjWaTTXVfT33XN6W+KY5z
         kN9w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790109622; x=1790714422; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pt1Jvyl7y2ucT15n2cP/CxwuiPgjJqJ1dgsK6z+frno=;
        b=m35Xy7CsHJYEbKV+Ajp5gye0EFkQgF9Lu8+Zoylqx7o+TJV+UgKy9VsCTrNZCmGcFu
         yF0MjyQkKQZ6tQhlMxhe5UGmfuFWOqv9AXG22VJAENvG0ZUP2JeA9+jZSXBabKrK72YQ
         DYsWfG3GW+1c8ESuKctkelOtab+8+NMRafdlFuZrgW93nvv+JPcCRdJ1jvuZ6Q3FTYFD
         U0b4/8aXmZ0YbY0JaeBWTpMp38GnnKyFvPS/u4YKyEo+IYDN5OOOwCtC30EQaYd8/sbF
         I1gCRAOjK62xpE41126l+8QtUltQE7IjNZTL3RkU1bbeGTYWuQwBQy4TTP9od/1/Kosa
         l82g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790109622; x=1790714422;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pt1Jvyl7y2ucT15n2cP/CxwuiPgjJqJ1dgsK6z+frno=;
        b=e1oLEp7+iTnU1jdXyTMiRWtv6x7xAXPuyKiGWoOPZDe/9dx73QynkDLorzoWmrpVCX
         cEho9DLMMg5FB3sj1sXPk51h3WFUTmz++578gaWH2OqK+bDniUc+cqMNDqZxRoifCjP1
         bzrDhQB11guL8IPpOlP7aSs5gnqYlbTLz7+rJ/C3Q4FLUclRRz3o6G1kwlPq9A0lBvQe
         QynvsZ76it3D7TziT5hdD7ZgMNZ0Ihwp0Pc2f1zcSYDrnFZSpLcevb3vuo/MwAzbobva
         19UXLGoaocubJ0QiXb6mwA/pBEkyPDkbTKzunFP81yRmN1uN3qiLMTJmYnWmM73vohsr
         DU0g==
X-Forwarded-Encrypted: i=1; AKwUvBypheFmW9iVZe6syAzUn3GKPekS3PQUaV0zlPkWaC7d7C5tbJ1IHtCqcb9IQ1jcYyLKGcWZwvSWLsPXlNmu0FXQ@lists.infradead.org
X-Gm-Message-State: AFuF++mSj/85N3iV5TthddKf7nKiqs0O2VIJmrnLBNX8/lKXUJ4gKxBV
	IMdLaSf1UKw/q/pqBMTI0uJZu/lkHKP/PIVW9mIDn8rkX/Qg9KXM+V7Fjvug7Vl73CxZNnSeOHF
	4FYjrfriITZKHOzMyLPtORICu+snhZNc=
X-Gm-Gg: AYBFou1TKoT5YE6qrwhZ+QGu9UR99OMl3Iimo2zj9tY0O4LXXA6a5KXbY31OblYFN8s
	DI2UXVm1C2nR7SRbYqlFXjkFrOHcVbYmgaYUip9BgRBkhjbF6FOkVyrTwKGM9CIHXpceUsmwKSD
	qsUP7HxKfxSbETJ+5MgxJQU6vI8DvlnyMnqsQCBGkkVxlVh/cfKInP/q8rIeqa9MkxU5PTBHWVy
	yqvmv4h2FHmQC5A8DiZf4Otl09TbleB93TFdgCaZJP7YAI8Na1sjOqoKwRTOPsWGmzHbNbAlGXd
	MsDEPq+bZ5QAmj8mXDFNrlbd93gZEyDvAEQTK9DJ/vCOkXnKkFI0HRCJNHBKrKpnwRWpCR+jalr
	0xp7EVZUnmFOD8U36II2eHt5yMv1CyKaUCilov9PGRx8kjToklkxL
X-Received: by 2002:a17:90b:1dc9:b0:398:9bd5:490b with SMTP id
 98e67ed59e1d1-3a07e5e929amr377167a91.18.1790109621759; Tue, 22 Sep 2026
 13:40:21 -0700 (PDT)
MIME-Version: 1.0
References: <20260810164622.1829843-1-puranjay@kernel.org> <CANk7y0ixo5a3Vfzj_HVhVHRNce2Rsit4pP27GCtXd4jHHzmiKg@mail.gmail.com>
In-Reply-To: <CANk7y0ixo5a3Vfzj_HVhVHRNce2Rsit4pP27GCtXd4jHHzmiKg@mail.gmail.com>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Tue, 22 Sep 2026 13:40:06 -0700
X-Gm-Features: AcwNN1VfX9BxvsRTDOPajUz-x6IR-_JlVRJ0qqTEHps-VTBBc72fFFdiYC1A20M
Message-ID: <CAEf4BzapC=7YM2QLMyKKfyOWGgBTfEJmPPN8e9Jf5xT9SutBTQ@mail.gmail.com>
Subject: Re: [PATCH v6 0/3] arm64: Add BRBE support for bpf_get_branch_snapshot()
To: Mark Rutland <mark.rutland@arm.com>, Will Deacon <will@kernel.org>, 
	James Clark <james.clark@linaro.org>
Cc: bpf@vger.kernel.org, Puranjay Mohan <puranjay12@gmail.com>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, John Fastabend <john.fastabend@gmail.com>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Leo Yan <leo.yan@arm.com>, Rob Herring <robh@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Ian Rogers <irogers@google.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, Shuah Khan <shuah@kernel.org>, 
	Breno Leitao <leitao@debian.org>, Ravi Bangoria <ravi.bangoria@amd.com>, 
	Stephane Eranian <eranian@google.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, Usama Arif <usama.arif@linux.dev>, 
	linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_134022_928401_29ABA35D 
X-CRM114-Status: GOOD (  52.32  )
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

On Tue, Sep 1, 2026 at 6:45=E2=80=AFAM Puranjay Mohan <puranjay12@gmail.com=
> wrote:
>
> Hi James,
>
> Can you review this version of the patchset? It is implementing what
> we discussed in the thread on the last version.
>

James, do you mind reviewing the patches again, seems like Puranjay
went with the implementation you suggested, would be nice to review
and ack, if it looks good to you.

Mark, Will, you guys seems to be designated as maintainers for
drivers/perf/arm_brbe.c, can you please take a look and give your
feedback as well? This is important and useful feature for newer arm64
CPUs, it would be great to get access to this functionality that we
had on x86-64 side for a long while now. Please help get this upstream
or, if it's not in the right shape, guide Puranjay towards a better
implementation. Thank you!

> Thanks,
> Puranjay
>
> On Mon, Aug 10, 2026 at 5:46=E2=80=AFPM Puranjay Mohan <puranjay@kernel.o=
rg> wrote:
> >
> > Changelog:
> > v5: https://lore.kernel.org/all/20260616155716.2631508-1-puranjay@kerne=
l.org/
> > Changes in v6:
> > - Split the two perf/core patches out into their own series [3]. They
> >   fix bugs of their own and do not depend on this one.
> > - Add raw_local_daif_save() and raw_local_daif_restore(), so the
> >   snapshot can mask exceptions without trace_hardirqs_off() evicting
> >   the records it is about to read (new patch 1).
> > - Rework the snapshot. Clear PMCR_EL0.E across the BRBFCR_EL1
> >   read-modify-write so that a freeze cannot set PAUSED behind the saved
> >   value, and unpause before restarting the counters, since a paused
> >   BRBE cannot freeze for its own overflow handler (James Clark).
> > - Skip the pause entirely when BRBE is disabled or already frozen, and
> >   invalidate only when the snapshot was the one to pause it.
> > - Run valid_brbe_version() before masking exceptions; the static call
> >   is only reached from BPF programs, which run with migration disabled.
> > - Fold cpu_has_brbe() into valid_brbe_version() and drop the
> >   arm_brbe_ prefix from the snapshot callback (James Clark).
> > - Derive the selftest skip threshold from the waste and hit limits it
> >   depends on, so the two cannot drift apart.
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
> >   [#00] dump_bpf_prog+0xd340        -> brbe_snapshot_branch_stack+0x0  =
   (arm_brbe.c:814)
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
> > into brbe_snapshot_branch_stack().
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
> > [3] https://lore.kernel.org/all/20260810133540.1947118-1-puranjay@kerne=
l.org/
> >
> > Puranjay Mohan (3):
> >   arm64: Add raw variants of local_daif_save() and local_daif_restore()
> >   perf/arm64: Add BRBE support for bpf_get_branch_snapshot()
> >   selftests/bpf: Adjust entry thresholds for ARM64 BRBE
> >
> >  arch/arm64/include/asm/daifflags.h            |  41 +++++-
> >  arch/arm64/kernel/suspend.c                   |   7 +-
> >  drivers/perf/arm_brbe.c                       | 135 ++++++++++++++----
> >  drivers/perf/arm_brbe.h                       |   9 ++
> >  drivers/perf/arm_pmuv3.c                      |   5 +-
> >  .../bpf/prog_tests/get_branch_snapshot.c      |  28 ++--
> >  6 files changed, 175 insertions(+), 50 deletions(-)
> >
> >
> > base-commit: 03a2e393994ca27567fe060e066806589c547fbc
> > --
> > 2.53.0-Meta
> >

