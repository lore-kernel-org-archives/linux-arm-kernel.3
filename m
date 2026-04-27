Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E609DFF8860
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 17:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FKZ5BDfUoGSXLU0w1MWPlV5LMvkb03z+QF+9r7Lf5mM=; b=VILcR/MzJ7diqVu+eOh3OFWxFE
	mY194SxGXlpko23A+44tmGdrsPIX3M6diNNDCMjbAW1K4UvmmQGVtJ+b3WmD93SJfPQZdrIeE6luZ
	+bbewhOHViU0ruVaXxqegwa+D4oOWKG7Pdh0QTK413y9vVtor6bsk2dSPA/YQvzRKRxNpCbOfGv8U
	1qkPTLxf3hoRsRPZRR4nRBbrPB0lF/yuebPHy29ZNS/Z3NroZzYdhgJYVwhBtDRBB0Vi5CvOoQBsg
	iLEaFtIrEyzsF14HvtPA6S5Rcm7Ro1x9qxzm5OjRnru+F9A9OgQX/zd8OxaXQRpZzDWd8hBU91n2S
	WuI2X9vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHQ39-0000000HVWc-1m4M;
	Mon, 27 Apr 2026 17:47:15 +0000
Received: from mail-dl1-x1229.google.com ([2607:f8b0:4864:20::1229])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHQ37-0000000HVWC-25oT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 17:47:14 +0000
Received: by mail-dl1-x1229.google.com with SMTP id a92af1059eb24-12c8d0945b3so221c88.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 10:47:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777312032; cv=none;
        d=google.com; s=arc-20240605;
        b=SSH+qc3FIy9m6Yy9/iCz+avBr4G9JTE/0Xnn9ZCGT4HdOAPEccTqoNXWnlzhkMsiI4
         HU9BgpaIks7VcA2aCBubB73hGM8+IeSRiNZGz47syw8kd9NzYwmyXESvBGUwD+MBs5po
         RKqhOsHoDt2RoYGAhDtTTlsfKGE5IYkbbgMEqCdM/c25F9xxBmpCc6iKjmrUV2gBI8eV
         NcRc4i10Lv0imjuZ1jFnbOp6ea/qQT0aecZHY4oKOlL389oFKStwEGSXRJHVC4wyJHCW
         NhIeCdSXPTM8lsydcvWhU0fnPnS+a2NOU9Fo1S+hm3AZ9yoeOMlzXBcfHAC5PEtKKMVJ
         GlqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FKZ5BDfUoGSXLU0w1MWPlV5LMvkb03z+QF+9r7Lf5mM=;
        fh=5Yo32eUBZTm3E/fTgFrggNDv7TWvmgtaGuGMk9bbhXY=;
        b=SGJFq8h9DiWO0/8GZizmdpZ51OmHYp2L4SbV4ZVGytEuGnCx3R0eQVJEsYG66YqF21
         yIFCCvDjF1CRfj9Yf4U8DYWSCCnYkqNX7/3F8NVB6XgeX80bzSn15Qj+IbaXNMXJjrGE
         X4mlGxtqWQN5MNlS/pTLhA2cQ0Dep3R7gcI/srXeAXm+D1Pc/Dx6e6ekj0BaLDz+6uND
         OnDhcck+qn8tUvWN44bGgKuh9JmjDx/lSusuch9bqQhNU7RWRG7KDh9zjBhZ3v4cZwJH
         QzqYoWBWZ7QEkFbWAOWUweU2bqvjp7ve8zEYZtqrLywVzLQvDNC27e9j2YqTyyKNpy97
         cJRA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777312032; x=1777916832; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FKZ5BDfUoGSXLU0w1MWPlV5LMvkb03z+QF+9r7Lf5mM=;
        b=UxeFi4ldlpEu7cQOoqWlcpibfzQf5O/BQy3oFPEh2BHmCpOCqBufqh028VwK2iEXYJ
         p7fg5I6KME9rlzXpDOez9gkoH0GzU0O6ELMJBRts11PVbLDNRdMgmPY9rMkeAmo6rXzP
         u1FRYirSl9r05gEXmwKf1tUyff76AfJvgcO6bE3hux3tvD5URZl7hBhpuecUl/bYRnbd
         xVInkzSTde0nMt8hV+ZNPrHTsvXvkY8OXQUiHH/4vxaXU/q9q1+qpqx0yLHxpQouuWLH
         RGSCSxEIX78rdpbJ+d6KI0kOot4os/8J63Ghg4Z1b5c6sjF/dVrlRHSsFDyf8kYqcjme
         //uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777312032; x=1777916832;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FKZ5BDfUoGSXLU0w1MWPlV5LMvkb03z+QF+9r7Lf5mM=;
        b=l1fTUKcywbd4rbdToxOinJSdS9rTFQihPNq0A4rejWW4fACP88q47E09C1w8XKB05b
         vatIlZ3dM8OS5ZsqOBi6niN9RyDQoOAjgrt02d1QyfHdu9kiLA8v2V0V0eRIYC3G7ziU
         r8uwum7SW3j0vXWldudQJja9RfeXaNq0phHZDF0p073hsp3eu0uJDT4w0qCqesQiNutz
         AG2cqhviU72jkZ7PK4AupKdDe85I2y6VNhN3p9UBLhrLwJYYBRcwASZEeSqPNeJOOMFj
         8B7w4ncrN4fPIXZoETTFMGVkm1L8QCpeFqKIbU/T9dO32VHt8wFsZ5OPJeypvQcckKRO
         7rgw==
X-Forwarded-Encrypted: i=1; AFNElJ8JBz4l/LQhmgL7oAO3YcX4SvTfXdpEADjXmXfDYo/7Qiyvudnyvs5Fst49aj4eOKEtcUo9vDTKtf6lSuuM+95Y@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+wNlKNPHVWm2aoT2A+QZ8ci4chxRQmJ5EtDFsVUgn6uEcov4O
	UgaJHBUCoG9ujlBkZTsAUhzWU4ELYXTta2l9Uc5bxRmbnmr7mD/o3yhKhS1ZWOrk+l1YwotJt4K
	6QzVXVsxfSnkInfiYOryQGIvtE7tAxFJitCCuClAt
X-Gm-Gg: AeBDiesYvc9jVgUpVjlEkOVgPfN9EavZhDe/IFiLEJW5+d/xnB2XmQna4DwXq5Gqol4
	I/exNj7JE5nMng64h/PUEgXyn22VoZuv03MxtLaYgIFv1wzvWF3YJVjGohwxoDn8PtdjSdBo/7O
	CI6Ka8+Yt3VfDfxwiGBXtOX8f9nywvdc04+T9Ek2Ycyeb2N/PKXbKcavm7IgFyOFXx9OGpRIavT
	9+IwxAeeM4lXUySGh9Fwdf00H9pMaS266BH+LTrCvZnJ5Ix6HNa8Z3Z/v9dq4I5gFnCh1erk0h0
	WK3UCdc00o2N2MfNXaI2fnTKNQzjQLRc/CXaLxuQQD3jeQUsLb9SLrYJPx6Lj6ijOJQHQg==
X-Received: by 2002:a05:7022:ea33:b0:11a:2c18:9e70 with SMTP id
 a92af1059eb24-12ddd6543cbmr14886c88.11.1777312030880; Mon, 27 Apr 2026
 10:47:10 -0700 (PDT)
MIME-Version: 1.0
References: <20260425174858.3922152-1-irogers@google.com> <20260425224951.174663-1-irogers@google.com>
 <20260425224951.174663-2-irogers@google.com> <ae7-jS-TeQ-TUXSF@google.com>
In-Reply-To: <ae7-jS-TeQ-TUXSF@google.com>
From: Ian Rogers <irogers@google.com>
Date: Mon, 27 Apr 2026 10:46:58 -0700
X-Gm-Features: AVHnY4LsDRkfVepD4FyKV2U7rVGw6tRg639K826XHLiE37CUsM_mU6g0pS_Z9Ow
Message-ID: <CAP-5=fXRa5qbdG81Ws_+KfsaH9BCYUgJ-HgRhdRjtEF4s4tvUQ@mail.gmail.com>
Subject: Re: [PATCH v7 01/59] perf inject: Fix itrace branch stack synthesis
To: Namhyung Kim <namhyung@kernel.org>
Cc: acme@kernel.org, adrian.hunter@intel.com, james.clark@linaro.org, 
	leo.yan@linux.dev, tmricht@linux.ibm.com, alice.mei.rogers@gmail.com, 
	dapeng1.mi@linux.intel.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	mingo@redhat.com, peterz@infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_104713_569259_792BF0F8 
X-CRM114-Status: GOOD (  37.02  )
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

On Sun, Apr 26, 2026 at 11:13=E2=80=AFPM Namhyung Kim <namhyung@kernel.org>=
 wrote:
>
> Hi Ian,
>
> On Sat, Apr 25, 2026 at 03:48:53PM -0700, Ian Rogers wrote:
> > When using "perf inject --itrace=3DL" to synthesize branch stacks from
> > AUX data, several issues caused failures:
> >
> > 1. The synthesized samples were delivered without the
> >    PERF_SAMPLE_BRANCH_STACK flag if it was not in the original event's
> >    sample_type. Fixed by using sample_type | evsel->synth_sample_type
> >    in intel_pt_deliver_synth_event.
> >
> > 2. The record layout was misaligned because of inconsistent handling
> >    of PERF_SAMPLE_BRANCH_HW_INDEX. Fixed by explicitly writing nr and
> >    hw_idx in perf_event__synthesize_sample.
> >
> > 3. Modifying evsel->core.attr.sample_type early in __cmd_inject caused
> >    parse failures for subsequent records in the input file. Fixed by
> >    moving this modification to just before writing the header.
> >
> > 4. perf_event__repipe_sample was narrowed to only synthesize samples
> >    when branch stack injection was requested, and restored the use of
> >    perf_inject__cut_auxtrace_sample as a fallback to preserve
> >    functionality.
>
> Looks like it does a lot of things in a patch.  I think these are
> independent fixes from this series.  How about moving this out to a
> separate series?

Doesn't seem unreasonable. We can have the itrace=3DL fix for `perf
inject` be one patch and then other patches for the issues sashiko has
detected around this problem.

I think `perf inject --itrace=3DL` being broken is out of scope for
sashiko to detect a regression in the intel-PT testing. Care is needed
to ensure we merge the `perf inject --itrace=3DL` fixes before these
changes to avoid introducing a known regression.

Thanks,
Ian


> Thanks,
> Namhyung
>
> >
> > Assisted-by: Gemini:gemini-3.1-pro-preview
> > Signed-off-by: Ian Rogers <irogers@google.com>
> > ---
> > Issues fixed in v2:
> >
> > 1. Potential Heap Overflow in perf_event__repipe_sample : Addressed by
> >    adding a check that prints an error and returns -EFAULT if the
> >    calculated event size exceeds PERF_SAMPLE_MAX_SIZE , as you
> >    requested.
> >
> > 2. Header vs Payload Mismatch in __cmd_inject : Addressed by narrowing
> >    the condition so that HEADER_BRANCH_STACK is only set in the file
> >    header if add_last_branch was true.
> >
> > 3. NULL Pointer Dereference in intel-pt.c : Addressed by updating the
> >    condition in intel_pt_do_synth_pebs_sample to fill sample.
> >    branch_stack if it was synthesized, even if not in the original
> >    sample_type .
> >
> > 4. Unsafe Reads for events lacking HW_INDEX in synthetic-events.c :
> >    Addressed by using the perf_sample__branch_entries() macro and
> >    checking sample->no_hw_idx .
> >
> > 5. Size mismatch in perf_event__sample_event_size : Addressed by
> >    passing branch_sample_type to it and conditioning the hw_idx size on
> >    PERF_SAMPLE_BRANCH_HW_INDEX .
> > ---
> >  tools/perf/bench/inject-buildid.c  |  9 ++--
> >  tools/perf/builtin-inject.c        | 77 ++++++++++++++++++++++++++++--
> >  tools/perf/tests/dlfilter-test.c   |  8 +++-
> >  tools/perf/tests/sample-parsing.c  |  5 +-
> >  tools/perf/util/arm-spe.c          |  7 ++-
> >  tools/perf/util/cs-etm.c           |  6 ++-
> >  tools/perf/util/intel-bts.c        |  3 +-
> >  tools/perf/util/intel-pt.c         | 13 +++--
> >  tools/perf/util/synthetic-events.c | 25 +++++++---
> >  tools/perf/util/synthetic-events.h |  6 ++-
> >  10 files changed, 129 insertions(+), 30 deletions(-)
> >
> > diff --git a/tools/perf/bench/inject-buildid.c b/tools/perf/bench/injec=
t-buildid.c
> > index aad572a78d7f..bfd2c5ec9488 100644
> > --- a/tools/perf/bench/inject-buildid.c
> > +++ b/tools/perf/bench/inject-buildid.c
> > @@ -228,9 +228,12 @@ static ssize_t synthesize_sample(struct bench_data=
 *data, struct bench_dso *dso,
> >
> >       event.header.type =3D PERF_RECORD_SAMPLE;
> >       event.header.misc =3D PERF_RECORD_MISC_USER;
> > -     event.header.size =3D perf_event__sample_event_size(&sample, benc=
h_sample_type, 0);
> > -
> > -     perf_event__synthesize_sample(&event, bench_sample_type, 0, &samp=
le);
> > +     event.header.size =3D perf_event__sample_event_size(&sample, benc=
h_sample_type,
> > +                                                        /*read_format=
=3D*/0,
> > +                                                        /*branch_sampl=
e_type=3D*/0);
> > +     perf_event__synthesize_sample(&event, bench_sample_type,
> > +                                   /*read_format=3D*/0,
> > +                                   /*branch_sample_type=3D*/0, &sample=
);
> >
> >       return writen(data->input_pipe[1], &event, event.header.size);
> >  }
> > diff --git a/tools/perf/builtin-inject.c b/tools/perf/builtin-inject.c
> > index f174bc69cec4..88c0ef4f5ff1 100644
> > --- a/tools/perf/builtin-inject.c
> > +++ b/tools/perf/builtin-inject.c
> > @@ -375,7 +375,59 @@ static int perf_event__repipe_sample(const struct =
perf_tool *tool,
> >
> >       build_id__mark_dso_hit(tool, event, sample, evsel, machine);
> >
> > -     if (inject->itrace_synth_opts.set && sample->aux_sample.size) {
> > +     if (inject->itrace_synth_opts.set &&
> > +         (inject->itrace_synth_opts.last_branch ||
> > +          inject->itrace_synth_opts.add_last_branch)) {
> > +             union perf_event *event_copy =3D (void *)inject->event_co=
py;
> > +             struct branch_stack dummy_bs =3D { .nr =3D 0 };
> > +             int err;
> > +             size_t sz;
> > +             u64 orig_type =3D evsel->core.attr.sample_type;
> > +             u64 orig_branch_type =3D evsel->core.attr.branch_sample_t=
ype;
> > +
> > +             if (event_copy =3D=3D NULL) {
> > +                     inject->event_copy =3D malloc(PERF_SAMPLE_MAX_SIZ=
E);
> > +                     if (!inject->event_copy)
> > +                             return -ENOMEM;
> > +
> > +                     event_copy =3D (void *)inject->event_copy;
> > +             }
> > +
> > +             if (!sample->branch_stack)
> > +                     sample->branch_stack =3D &dummy_bs;
> > +
> > +             if (inject->itrace_synth_opts.add_last_branch) {
> > +                     /* Temporarily add in type bits for synthesis. */
> > +                     evsel->core.attr.sample_type |=3D PERF_SAMPLE_BRA=
NCH_STACK;
> > +                     evsel->core.attr.branch_sample_type |=3D PERF_SAM=
PLE_BRANCH_HW_INDEX;
> > +                     evsel->core.attr.sample_type &=3D ~PERF_SAMPLE_AU=
X;
> > +             }
> > +
> > +             sz =3D perf_event__sample_event_size(sample, evsel->core.=
attr.sample_type,
> > +                                                evsel->core.attr.read_=
format,
> > +                                                evsel->core.attr.branc=
h_sample_type);
> > +
> > +             if (sz > PERF_SAMPLE_MAX_SIZE) {
> > +                     pr_err("Sample size %zu exceeds max size %d\n", s=
z, PERF_SAMPLE_MAX_SIZE);
> > +                     return -EFAULT;
> > +             }
> > +
> > +             event_copy->header.type =3D PERF_RECORD_SAMPLE;
> > +             event_copy->header.size =3D sz;
> > +
> > +             err =3D perf_event__synthesize_sample(event_copy, evsel->=
core.attr.sample_type,
> > +                                                 evsel->core.attr.read=
_format,
> > +                                                 evsel->core.attr.bran=
ch_sample_type, sample);
> > +
> > +             evsel->core.attr.sample_type =3D orig_type;
> > +             evsel->core.attr.branch_sample_type =3D orig_branch_type;
> > +
> > +             if (err) {
> > +                     pr_err("Failed to synthesize sample\n");
> > +                     return err;
> > +             }
> > +             event =3D event_copy;
> > +     } else if (inject->itrace_synth_opts.set && sample->aux_sample.si=
ze) {
> >               event =3D perf_inject__cut_auxtrace_sample(inject, event,=
 sample);
> >               if (IS_ERR(event))
> >                       return PTR_ERR(event);
> > @@ -464,7 +516,8 @@ static int perf_event__convert_sample_callchain(con=
st struct perf_tool *tool,
> >       sample_type &=3D ~(PERF_SAMPLE_STACK_USER | PERF_SAMPLE_REGS_USER=
);
> >
> >       perf_event__synthesize_sample(event_copy, sample_type,
> > -                                   evsel->core.attr.read_format, sampl=
e);
> > +                                   evsel->core.attr.read_format,
> > +                                   evsel->core.attr.branch_sample_type=
, sample);
> >       return perf_event__repipe_synth(tool, event_copy);
> >  }
> >
> > @@ -1100,7 +1153,8 @@ static int perf_inject__sched_stat(const struct p=
erf_tool *tool,
> >       sample_sw.period =3D sample->period;
> >       sample_sw.time   =3D sample->time;
> >       perf_event__synthesize_sample(event_sw, evsel->core.attr.sample_t=
ype,
> > -                                   evsel->core.attr.read_format, &samp=
le_sw);
> > +                                   evsel->core.attr.read_format,
> > +                                   evsel->core.attr.branch_sample_type=
, &sample_sw);
> >       build_id__mark_dso_hit(tool, event_sw, &sample_sw, evsel, machine=
);
> >       ret =3D perf_event__repipe(tool, event_sw, &sample_sw, machine);
> >       perf_sample__exit(&sample_sw);
> > @@ -2434,12 +2488,25 @@ static int __cmd_inject(struct perf_inject *inj=
ect)
> >                * synthesized hardware events, so clear the feature flag=
.
> >                */
> >               if (inject->itrace_synth_opts.set) {
> > +                     struct evsel *evsel;
> > +
> >                       perf_header__clear_feat(&session->header,
> >                                               HEADER_AUXTRACE);
> > -                     if (inject->itrace_synth_opts.last_branch ||
> > -                         inject->itrace_synth_opts.add_last_branch)
> > +
> > +                     evlist__for_each_entry(session->evlist, evsel) {
> > +                             evsel->core.attr.sample_type &=3D ~PERF_S=
AMPLE_AUX;
> > +                     }
> > +
> > +                     if (inject->itrace_synth_opts.add_last_branch) {
> >                               perf_header__set_feat(&session->header,
> >                                                     HEADER_BRANCH_STACK=
);
> > +
> > +                             evlist__for_each_entry(session->evlist, e=
vsel) {
> > +                                     evsel->core.attr.sample_type |=3D=
 PERF_SAMPLE_BRANCH_STACK;
> > +                                     evsel->core.attr.branch_sample_ty=
pe |=3D
> > +                                             PERF_SAMPLE_BRANCH_HW_IND=
EX;
> > +                             }
> > +                     }
> >               }
> >
> >               /*
> > diff --git a/tools/perf/tests/dlfilter-test.c b/tools/perf/tests/dlfilt=
er-test.c
> > index e63790c61d53..204663571943 100644
> > --- a/tools/perf/tests/dlfilter-test.c
> > +++ b/tools/perf/tests/dlfilter-test.c
> > @@ -188,8 +188,12 @@ static int write_sample(struct test_data *td, u64 =
sample_type, u64 id, pid_t pid
> >
> >       event->header.type =3D PERF_RECORD_SAMPLE;
> >       event->header.misc =3D PERF_RECORD_MISC_USER;
> > -     event->header.size =3D perf_event__sample_event_size(&sample, sam=
ple_type, 0);
> > -     err =3D perf_event__synthesize_sample(event, sample_type, 0, &sam=
ple);
> > +     event->header.size =3D perf_event__sample_event_size(&sample, sam=
ple_type,
> > +                                                        /*read_format=
=3D*/0,
> > +                                                        /*branch_sampl=
e_type=3D*/0);
> > +     err =3D perf_event__synthesize_sample(event, sample_type,
> > +                                         /*read_format=3D*/0,
> > +                                         /*branch_sample_type=3D*/0, &=
sample);
> >       if (err)
> >               return test_result("perf_event__synthesize_sample() faile=
d", TEST_FAIL);
> >
> > diff --git a/tools/perf/tests/sample-parsing.c b/tools/perf/tests/sampl=
e-parsing.c
> > index a7327c942ca2..55f0b73ca20e 100644
> > --- a/tools/perf/tests/sample-parsing.c
> > +++ b/tools/perf/tests/sample-parsing.c
> > @@ -310,7 +310,8 @@ static int do_test(u64 sample_type, u64 sample_regs=
, u64 read_format)
> >               sample.read.one.lost  =3D 1;
> >       }
> >
> > -     sz =3D perf_event__sample_event_size(&sample, sample_type, read_f=
ormat);
> > +     sz =3D perf_event__sample_event_size(&sample, sample_type, read_f=
ormat,
> > +                                        evsel.core.attr.branch_sample_=
type);
> >       bufsz =3D sz + 4096; /* Add a bit for overrun checking */
> >       event =3D malloc(bufsz);
> >       if (!event) {
> > @@ -324,7 +325,7 @@ static int do_test(u64 sample_type, u64 sample_regs=
, u64 read_format)
> >       event->header.size =3D sz;
> >
> >       err =3D perf_event__synthesize_sample(event, sample_type, read_fo=
rmat,
> > -                                         &sample);
> > +                                         evsel.core.attr.branch_sample=
_type, &sample);
> >       if (err) {
> >               pr_debug("%s failed for sample_type %#"PRIx64", error %d\=
n",
> >                        "perf_event__synthesize_sample", sample_type, er=
r);
> > diff --git a/tools/perf/util/arm-spe.c b/tools/perf/util/arm-spe.c
> > index e5835042acdf..c4ed9f10e731 100644
> > --- a/tools/perf/util/arm-spe.c
> > +++ b/tools/perf/util/arm-spe.c
> > @@ -484,8 +484,11 @@ static void arm_spe__prep_branch_stack(struct arm_=
spe_queue *speq)
> >
> >  static int arm_spe__inject_event(union perf_event *event, struct perf_=
sample *sample, u64 type)
> >  {
> > -     event->header.size =3D perf_event__sample_event_size(sample, type=
, 0);
> > -     return perf_event__synthesize_sample(event, type, 0, sample);
> > +     event->header.type =3D PERF_RECORD_SAMPLE;
> > +     event->header.size =3D perf_event__sample_event_size(sample, type=
, /*read_format=3D*/0,
> > +                                                        /*branch_sampl=
e_type=3D*/0);
> > +     return perf_event__synthesize_sample(event, type, /*read_format=
=3D*/0,
> > +                                          /*branch_sample_type=3D*/0, =
sample);
> >  }
> >
> >  static inline int
> > diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
> > index 8a639d2e51a4..1ebc1a6a5e75 100644
> > --- a/tools/perf/util/cs-etm.c
> > +++ b/tools/perf/util/cs-etm.c
> > @@ -1425,8 +1425,10 @@ static void cs_etm__update_last_branch_rb(struct=
 cs_etm_queue *etmq,
> >  static int cs_etm__inject_event(union perf_event *event,
> >                              struct perf_sample *sample, u64 type)
> >  {
> > -     event->header.size =3D perf_event__sample_event_size(sample, type=
, 0);
> > -     return perf_event__synthesize_sample(event, type, 0, sample);
> > +     event->header.size =3D perf_event__sample_event_size(sample, type=
, /*read_format=3D*/0,
> > +                                                        /*branch_sampl=
e_type=3D*/0);
> > +     return perf_event__synthesize_sample(event, type, /*read_format=
=3D*/0,
> > +                                          /*branch_sample_type=3D*/0, =
sample);
> >  }
> >
> >
> > diff --git a/tools/perf/util/intel-bts.c b/tools/perf/util/intel-bts.c
> > index 382255393fb3..0b18ebd13f7c 100644
> > --- a/tools/perf/util/intel-bts.c
> > +++ b/tools/perf/util/intel-bts.c
> > @@ -303,7 +303,8 @@ static int intel_bts_synth_branch_sample(struct int=
el_bts_queue *btsq,
> >               event.sample.header.size =3D bts->branches_event_size;
> >               ret =3D perf_event__synthesize_sample(&event,
> >                                                   bts->branches_sample_=
type,
> > -                                                 0, &sample);
> > +                                                 /*read_format=3D*/0, =
/*branch_sample_type=3D*/0,
> > +                                                 &sample);
> >               if (ret)
> >                       return ret;
> >       }
> > diff --git a/tools/perf/util/intel-pt.c b/tools/perf/util/intel-pt.c
> > index fc9eec8b54b8..2dce6106c038 100644
> > --- a/tools/perf/util/intel-pt.c
> > +++ b/tools/perf/util/intel-pt.c
> > @@ -1731,8 +1731,12 @@ static void intel_pt_prep_b_sample(struct intel_=
pt *pt,
> >  static int intel_pt_inject_event(union perf_event *event,
> >                                struct perf_sample *sample, u64 type)
> >  {
> > -     event->header.size =3D perf_event__sample_event_size(sample, type=
, 0);
> > -     return perf_event__synthesize_sample(event, type, 0, sample);
> > +     event->header.type =3D PERF_RECORD_SAMPLE;
> > +     event->header.size =3D perf_event__sample_event_size(sample, type=
, /*read_format=3D*/0,
> > +                                                        /*branch_sampl=
e_type=3D*/0);
> > +
> > +     return perf_event__synthesize_sample(event, type, /*read_format=
=3D*/0,
> > +                                          /*branch_sample_type=3D*/0, =
sample);
> >  }
> >
> >  static inline int intel_pt_opt_inject(struct intel_pt *pt,
> > @@ -2486,7 +2490,7 @@ static int intel_pt_do_synth_pebs_sample(struct i=
ntel_pt_queue *ptq, struct evse
> >               intel_pt_add_xmm(intr_regs, pos, items, regs_mask);
> >       }
> >
> > -     if (sample_type & PERF_SAMPLE_BRANCH_STACK) {
> > +     if ((sample_type | evsel->synth_sample_type) & PERF_SAMPLE_BRANCH=
_STACK) {
> >               if (items->mask[INTEL_PT_LBR_0_POS] ||
> >                   items->mask[INTEL_PT_LBR_1_POS] ||
> >                   items->mask[INTEL_PT_LBR_2_POS]) {
> > @@ -2557,7 +2561,8 @@ static int intel_pt_do_synth_pebs_sample(struct i=
ntel_pt_queue *ptq, struct evse
> >               sample.transaction =3D txn;
> >       }
> >
> > -     ret =3D intel_pt_deliver_synth_event(pt, event, &sample, sample_t=
ype);
> > +     ret =3D intel_pt_deliver_synth_event(pt, event, &sample,
> > +                                        sample_type | evsel->synth_sam=
ple_type);
> >       perf_sample__exit(&sample);
> >       return ret;
> >  }
> > diff --git a/tools/perf/util/synthetic-events.c b/tools/perf/util/synth=
etic-events.c
> > index 85bee747f4cd..2461f25a4d7d 100644
> > --- a/tools/perf/util/synthetic-events.c
> > +++ b/tools/perf/util/synthetic-events.c
> > @@ -1455,7 +1455,8 @@ int perf_event__synthesize_stat_round(const struc=
t perf_tool *tool,
> >       return process(tool, (union perf_event *) &event, NULL, machine);
> >  }
> >
> > -size_t perf_event__sample_event_size(const struct perf_sample *sample,=
 u64 type, u64 read_format)
> > +size_t perf_event__sample_event_size(const struct perf_sample *sample,=
 u64 type, u64 read_format,
> > +                                  u64 branch_sample_type)
> >  {
> >       size_t sz, result =3D sizeof(struct perf_record_sample);
> >
> > @@ -1515,8 +1516,10 @@ size_t perf_event__sample_event_size(const struc=
t perf_sample *sample, u64 type,
> >
> >       if (type & PERF_SAMPLE_BRANCH_STACK) {
> >               sz =3D sample->branch_stack->nr * sizeof(struct branch_en=
try);
> > -             /* nr, hw_idx */
> > -             sz +=3D 2 * sizeof(u64);
> > +             /* nr */
> > +             sz +=3D sizeof(u64);
> > +             if (branch_sample_type & PERF_SAMPLE_BRANCH_HW_INDEX)
> > +                     sz +=3D sizeof(u64);
> >               result +=3D sz;
> >       }
> >
> > @@ -1605,7 +1608,7 @@ static __u64 *copy_read_group_values(__u64 *array=
, __u64 read_format,
> >  }
> >
> >  int perf_event__synthesize_sample(union perf_event *event, u64 type, u=
64 read_format,
> > -                               const struct perf_sample *sample)
> > +                               u64 branch_sample_type, const struct pe=
rf_sample *sample)
> >  {
> >       __u64 *array;
> >       size_t sz;
> > @@ -1719,9 +1722,17 @@ int perf_event__synthesize_sample(union perf_eve=
nt *event, u64 type, u64 read_fo
> >
> >       if (type & PERF_SAMPLE_BRANCH_STACK) {
> >               sz =3D sample->branch_stack->nr * sizeof(struct branch_en=
try);
> > -             /* nr, hw_idx */
> > -             sz +=3D 2 * sizeof(u64);
> > -             memcpy(array, sample->branch_stack, sz);
> > +
> > +             *array++ =3D sample->branch_stack->nr;
> > +
> > +             if (branch_sample_type & PERF_SAMPLE_BRANCH_HW_INDEX) {
> > +                     if (sample->no_hw_idx)
> > +                             *array++ =3D 0;
> > +                     else
> > +                             *array++ =3D sample->branch_stack->hw_idx=
;
> > +             }
> > +
> > +             memcpy(array, perf_sample__branch_entries((struct perf_sa=
mple *)sample), sz);
> >               array =3D (void *)array + sz;
> >       }
> >
> > diff --git a/tools/perf/util/synthetic-events.h b/tools/perf/util/synth=
etic-events.h
> > index b0edad0c3100..8c7f49f9ccf5 100644
> > --- a/tools/perf/util/synthetic-events.h
> > +++ b/tools/perf/util/synthetic-events.h
> > @@ -81,7 +81,8 @@ int perf_event__synthesize_mmap_events(const struct p=
erf_tool *tool, union perf_
> >  int perf_event__synthesize_modules(const struct perf_tool *tool, perf_=
event__handler_t process, struct machine *machine);
> >  int perf_event__synthesize_namespaces(const struct perf_tool *tool, un=
ion perf_event *event, pid_t pid, pid_t tgid, perf_event__handler_t process=
, struct machine *machine);
> >  int perf_event__synthesize_cgroups(const struct perf_tool *tool, perf_=
event__handler_t process, struct machine *machine);
> > -int perf_event__synthesize_sample(union perf_event *event, u64 type, u=
64 read_format, const struct perf_sample *sample);
> > +int perf_event__synthesize_sample(union perf_event *event, u64 type, u=
64 read_format,
> > +                               u64 branch_sample_type, const struct pe=
rf_sample *sample);
> >  int perf_event__synthesize_stat_config(const struct perf_tool *tool, s=
truct perf_stat_config *config, perf_event__handler_t process, struct machi=
ne *machine);
> >  int perf_event__synthesize_stat_events(struct perf_stat_config *config=
, const struct perf_tool *tool, struct evlist *evlist, perf_event__handler_=
t process, bool attrs);
> >  int perf_event__synthesize_stat_round(const struct perf_tool *tool, u6=
4 time, u64 type, perf_event__handler_t process, struct machine *machine);
> > @@ -97,7 +98,8 @@ void perf_event__synthesize_final_bpf_metadata(struct=
 perf_session *session,
> >
> >  int perf_tool__process_synth_event(const struct perf_tool *tool, union=
 perf_event *event, struct machine *machine, perf_event__handler_t process)=
;
> >
> > -size_t perf_event__sample_event_size(const struct perf_sample *sample,=
 u64 type, u64 read_format);
> > +size_t perf_event__sample_event_size(const struct perf_sample *sample,=
 u64 type,
> > +                                  u64 read_format, u64 branch_sample_t=
ype);
> >
> >  int __machine__synthesize_threads(struct machine *machine, const struc=
t perf_tool *tool,
> >                                 struct target *target, struct perf_thre=
ad_map *threads,
> > --
> > 2.54.0.545.g6539524ca2-goog
> >

