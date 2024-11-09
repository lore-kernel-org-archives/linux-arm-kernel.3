Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDE3ED5E376
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 Nov 2024 16:12:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VUsRfOqzk+CxIITEqQ7Cd8HpiWsMwYdkJCFhMtBclG0=; b=OdcP9PNXOD9walMTY9qTBLLPKh
	D/Lgjn5Dhkc0pOg9trpi2n8iVWHBQw6WRy9dwGmQrDqztgBs0Qjt7gXkJpbOuDsHf6W4seoCdBud9
	1uhxUJVP4ZggxLr6UAZuRpIg18T8XHFYR3/xSsV8KXi0qC87ektasWPmoUNPkMaImLIIP3PO80qA+
	67B+wcVNSqHoZMZg7tDvjfCueKtjB7z987MCBFj2m+q7TW4IXJFpcwvKn7moqKfukIvuzD/4QZInq
	V/Jc0fYvfblWOTSUuk8dIsXAnl81Ijybm9BozZtGlo7VTUnSdE4/41aBnB1VutEv28zbeYx00BFcA
	UtKaeXjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9o4X-0000000DcXd-3Wdy;
	Sat, 09 Nov 2024 16:12:25 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9o2l-0000000DcJP-1Eyv
	for linux-arm-kernel@lists.infradead.org;
	Sat, 09 Nov 2024 16:10:38 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-20c87b0332cso136725ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 09 Nov 2024 08:10:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731168634; x=1731773434; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VUsRfOqzk+CxIITEqQ7Cd8HpiWsMwYdkJCFhMtBclG0=;
        b=ZJmuIUTdzTznwTRlRc28Jo+5IyMum3LKNMtE1IFhoKp+SXlHe/7tjcnYpIPUgA5Q5r
         upesRjytRFjUu0xI5KTNvyBR2SSQ9TNUvNK/9pzzQx5BlvHhOa4xVHq8qM9/9QX5U1wm
         MIudz1kG0FzThz7JS6y9wBGiJOjtkr/bIFFV8GM33untPX7bwI8th0Y8BthTA0DSyTHY
         Zx6hSO788hTUcz88WixsBqvi1LEo2bmU7vUXI2t9r77FQeLV5oCCfWcHKjTwhUdIpA4s
         wKpfn8TfOjevtjjN/NuKCKsYUOhC30ptnvmesxAKFHpKZSHdU72iGQaOcCqyKF2rINx0
         Tsew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731168634; x=1731773434;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VUsRfOqzk+CxIITEqQ7Cd8HpiWsMwYdkJCFhMtBclG0=;
        b=YiFovEPs8MnbmCLN5Sz3QzxUwrxUQxZl9rnGmLGaTox3V0boz2+cfPd9j18c1cs/0q
         QI6wxlvK7fmWuQjLVb3Y6ql0HWoJuO58fDTIF/I6v6jx6qrpyomeCnb7g5vj3i4tPR8Q
         IRznpWazJekA62rXW988Ent1fwbyFX++1M62vWEc9A0+08/axUEyzKZ1GZ0V0LsWrUmP
         4zEQ559Yep5QSns/O5PNI21H7JTGR9n+xDtwwC2LZr7utfwQ9Vkw1PYa/NwW1r9LF1O5
         kMB8pKFAvFhw+auNZzWaecQmzEE/2Te1p7YjbvLJaKt8yh3d9bCrbBup23qK91fkN01J
         TzNw==
X-Forwarded-Encrypted: i=1; AJvYcCW+T6q4QhxKg5T5SQaAnB3spuqeHRdrLBvAZ8K7Xr4nav0POtMg9N2y+a8G14vut+m45jnduvc/bRMH+GDVWK/z@lists.infradead.org
X-Gm-Message-State: AOJu0YysKjfdhref1pOAwxbPEBOLwMHtZ19DuD00s9tuogFBk/F9J6EN
	8u2X49+fVDUFq6wBCnRqwUYLmClhPNTOYn6oeOyfSzJnRV7OwUEXCLcJ+JSLlPCYsc4YHApu+iI
	dWRXetqhNNkMh97pT2xDCcenfV4Qnx8TPOe1C
X-Gm-Gg: ASbGncvFaEkdT7QkyPn9h2n2BM6oyCsRv30VM/rfvobDKZG6oEg0Vk3rYW5sfCnRwuL
	O4PhO/9JQttlYP2iXtN1CUPVt60IhCXvg
X-Google-Smtp-Source: AGHT+IEFahqbyg4ShZb8bLJQRctx82oVDw24lkFpnx3mxhwv7OQOUeemMadNRPSFS+4YbURaLpoe1k0Z9UZo+0sxOk8=
X-Received: by 2002:a17:902:d4cb:b0:20b:a6f5:2770 with SMTP id
 d9443c01a7336-2118dea0992mr2205275ad.6.1731168634033; Sat, 09 Nov 2024
 08:10:34 -0800 (PST)
MIME-Version: 1.0
References: <20241107162035.52206-1-irogers@google.com> <20241107162035.52206-9-irogers@google.com>
 <5a57de7c-924e-ccd6-8981-b9fddc647465@huawei.com>
In-Reply-To: <5a57de7c-924e-ccd6-8981-b9fddc647465@huawei.com>
From: Ian Rogers <irogers@google.com>
Date: Sat, 9 Nov 2024 08:10:22 -0800
Message-ID: <CAP-5=fWw04Qi+3=y7M4uMrhgrFWpnF7mZ09yb4v0P0qFT1Gfnw@mail.gmail.com>
Subject: Re: [PATCH v2 8/8] perf pmu: Move pmu_metrics_table__find and remove
 ARM override
To: Yicong Yang <yangyicong@huawei.com>
Cc: Xu Yang <xu.yang_2@nxp.com>, John Garry <john.g.garry@oracle.com>, 
	Will Deacon <will@kernel.org>, James Clark <james.clark@linaro.org>, 
	Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Kan Liang <kan.liang@linux.intel.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Huacai Chen <chenhuacai@kernel.org>, 
	Bibo Mao <maobibo@loongson.cn>, Athira Rajeev <atrajeev@linux.vnet.ibm.com>, 
	Ben Zong-You Xie <ben717@andestech.com>, Alexandre Ghiti <alexghiti@rivosinc.com>, 
	Sandipan Das <sandipan.das@amd.com>, Benjamin Gray <bgray@linux.ibm.com>, 
	Ravi Bangoria <ravi.bangoria@amd.com>, =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>, 
	Yicong Yang <yangyicong@hisilicon.com>, 
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>, Dima Kogan <dima@secretsauce.net>, 
	"Dr. David Alan Gilbert" <linux@treblig.org>, linux-arm-kernel@lists.infradead.org, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Junhao He <hejunhao3@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241109_081035_375510_E2763AC3 
X-CRM114-Status: GOOD (  32.07  )
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

On Sat, Nov 9, 2024 at 2:54=E2=80=AFAM Yicong Yang <yangyicong@huawei.com> =
wrote:
>
> Hi,
>
> On 2024/11/8 0:20, Ian Rogers wrote:
> > Move pmu_metrics_table__find to the jevents.py generated pmu-events.c
> > and remove indirection override for ARM. The movement removes
> > perf_pmu__find_metrics_table that exists to enable the ARM
> > override. The ARM override isn't necessary as just the CPUID, not PMU,
> > is used in the metric table lookup. On non-ARM the CPU argument is
> > just ignored for the CPUID, for ARM -1 is passed so that the CPUID for
> > the first logical CPU is read.
>
> Since the logic here's already been touching, is it possible to step it f=
urther to just
> ignore the CPUID matching when finding the system metrics/events tables? =
It's may not be
> that reasonable for finding a system metrics/events from the CPUID, since=
 one system PMU may
> exists on different platforms with different CPU types.

The issue is for conciseness reasons we let metrics and metric
thresholds refer to other metrics, for example:
https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.git/tr=
ee/tools/perf/pmu-events/arch/x86/icelakex/icx-metrics.json#n78
```
    {
        "BriefDescription": "This category represents fraction of
slots where no uops are being delivered due to a lack of required
resources for accepting new uops in the Backend",
        "MetricExpr": "topdown\\-be\\-bound / (topdown\\-fe\\-bound +
topdown\\-bad\\-spec + topdown\\-retiring + topdown\\-be\\-bound) + 5
* cpu@INT_MISC.RECOVERY_CYCLES\\,cmask\\=3D1\\,edge@ / tma_info_slots",
        "MetricGroup": "TmaL1;TopdownL1;tma_L1_group",
        "MetricName": "tma_backend_bound",
        "MetricThreshold": "tma_backend_bound > 0.2",
        "MetricgroupNoGroup": "TopdownL1",
        "PublicDescription": "This category represents fraction of
slots where no uops are being delivered due to a lack of required
resources for accepting new uops in the Backend. Backend is the
portion of the processor core where the out-of-order scheduler
dispatches ready uops into their respective execution units; and once
completed these uops get retired according to program order. For
example; stalls due to data-cache misses or stalls due to the divider
unit being overloaded are both categorized under Backend Bound.
Backend Bound is further divided into two main categories: Memory
Bound and Core Bound. Sample with: TOPDOWN.BACKEND_BOUND_SLOTS",
        "ScaleUnit": "100%"
    },
```

The system metrics were added on top of this and we never rethought
the design. For a metric to refer to another metric there needs to be
some kind of place we look up from and for that we use the CPUID
associated table. Perhaps the easiest thing is that if no CPUID table
is matched we have an empty table.

> FYI, there's a similiar problem when trying to count the system metrics b=
ut fails [1].
> I've tested with this series but the problem still exists.

Not sure what you are asking me for here.

Thanks,
Ian

> [1] https://lore.kernel.org/linux-perf-users/20241010074430.16685-1-hejun=
hao3@huawei.com/
>
> Thanks.
>
> >
> > Signed-off-by: Ian Rogers <irogers@google.com>
> > ---
> >  tools/perf/arch/arm64/util/pmu.c         | 20 --------------------
> >  tools/perf/pmu-events/empty-pmu-events.c | 10 ++++------
> >  tools/perf/pmu-events/jevents.py         | 10 ++++------
> >  tools/perf/pmu-events/pmu-events.h       |  2 +-
> >  tools/perf/util/pmu.c                    |  5 -----
> >  tools/perf/util/pmu.h                    |  1 -
> >  6 files changed, 9 insertions(+), 39 deletions(-)
> >
> > diff --git a/tools/perf/arch/arm64/util/pmu.c b/tools/perf/arch/arm64/u=
til/pmu.c
> > index a0964b191fcb..895fb0d0610c 100644
> > --- a/tools/perf/arch/arm64/util/pmu.c
> > +++ b/tools/perf/arch/arm64/util/pmu.c
> > @@ -1,29 +1,9 @@
> >  // SPDX-License-Identifier: GPL-2.0
> >
> > -#include <internal/cpumap.h>
> > -#include "../../../util/cpumap.h"
> > -#include "../../../util/header.h"
> >  #include "../../../util/pmu.h"
> >  #include "../../../util/pmus.h"
> >  #include "../../../util/tool_pmu.h"
> >  #include <api/fs/fs.h>
> > -#include <math.h>
> > -
> > -const struct pmu_metrics_table *pmu_metrics_table__find(void)
> > -{
> > -     struct perf_pmu *pmu;
> > -
> > -     /* Metrics aren't currently supported on heterogeneous Arm system=
s */
> > -     if (perf_pmus__num_core_pmus() > 1)
> > -             return NULL;
> > -
> > -     /* Doesn't matter which one here because they'll all be the same =
*/
> > -     pmu =3D perf_pmus__find_core_pmu();
> > -     if (pmu)
> > -             return perf_pmu__find_metrics_table(pmu);
> > -
> > -     return NULL;
> > -}
> >
> >  u64 tool_pmu__cpu_slots_per_cycle(void)
> >  {
> > diff --git a/tools/perf/pmu-events/empty-pmu-events.c b/tools/perf/pmu-=
events/empty-pmu-events.c
> > index 17306e316a3c..1c7a2cfa321f 100644
> > --- a/tools/perf/pmu-events/empty-pmu-events.c
> > +++ b/tools/perf/pmu-events/empty-pmu-events.c
> > @@ -587,14 +587,12 @@ const struct pmu_events_table *perf_pmu__find_eve=
nts_table(struct perf_pmu *pmu)
> >          return NULL;
> >  }
> >
> > -const struct pmu_metrics_table *perf_pmu__find_metrics_table(struct pe=
rf_pmu *pmu)
> > +const struct pmu_metrics_table *pmu_metrics_table__find(void)
> >  {
> > -        const struct pmu_events_map *map =3D map_for_pmu(pmu);
> > -
> > -        if (!map)
> > -                return NULL;
> > +        struct perf_cpu cpu =3D {-1};
> > +        const struct pmu_events_map *map =3D map_for_cpu(cpu);
> >
> > -     return &map->metric_table;
> > +        return map ? &map->metric_table : NULL;
> >  }
> >
> >  const struct pmu_events_table *find_core_events_table(const char *arch=
, const char *cpuid)
> > diff --git a/tools/perf/pmu-events/jevents.py b/tools/perf/pmu-events/j=
events.py
> > index e44b72e56ac3..d781a377757a 100755
> > --- a/tools/perf/pmu-events/jevents.py
> > +++ b/tools/perf/pmu-events/jevents.py
> > @@ -1103,14 +1103,12 @@ const struct pmu_events_table *perf_pmu__find_e=
vents_table(struct perf_pmu *pmu)
> >          return NULL;
> >  }
> >
> > -const struct pmu_metrics_table *perf_pmu__find_metrics_table(struct pe=
rf_pmu *pmu)
> > +const struct pmu_metrics_table *pmu_metrics_table__find(void)
> >  {
> > -        const struct pmu_events_map *map =3D map_for_pmu(pmu);
> > -
> > -        if (!map)
> > -                return NULL;
> > +        struct perf_cpu cpu =3D {-1};
> > +        const struct pmu_events_map *map =3D map_for_cpu(cpu);
> >
> > -     return &map->metric_table;
> > +        return map ? &map->metric_table : NULL;
> >  }
> >
> >  const struct pmu_events_table *find_core_events_table(const char *arch=
, const char *cpuid)
> > diff --git a/tools/perf/pmu-events/pmu-events.h b/tools/perf/pmu-events=
/pmu-events.h
> > index 5435ad92180c..675562e6f770 100644
> > --- a/tools/perf/pmu-events/pmu-events.h
> > +++ b/tools/perf/pmu-events/pmu-events.h
> > @@ -103,7 +103,7 @@ int pmu_metrics_table__for_each_metric(const struct=
 pmu_metrics_table *table, pm
> >                                    void *data);
> >
> >  const struct pmu_events_table *perf_pmu__find_events_table(struct perf=
_pmu *pmu);
> > -const struct pmu_metrics_table *perf_pmu__find_metrics_table(struct pe=
rf_pmu *pmu);
> > +const struct pmu_metrics_table *pmu_metrics_table__find(void);
> >  const struct pmu_events_table *find_core_events_table(const char *arch=
, const char *cpuid);
> >  const struct pmu_metrics_table *find_core_metrics_table(const char *ar=
ch, const char *cpuid);
> >  int pmu_for_each_core_event(pmu_event_iter_fn fn, void *data);
> > diff --git a/tools/perf/util/pmu.c b/tools/perf/util/pmu.c
> > index 514cb865f57b..45838651b361 100644
> > --- a/tools/perf/util/pmu.c
> > +++ b/tools/perf/util/pmu.c
> > @@ -818,11 +818,6 @@ static int is_sysfs_pmu_core(const char *name)
> >       return file_available(path);
> >  }
> >
> > -__weak const struct pmu_metrics_table *pmu_metrics_table__find(void)
> > -{
> > -     return perf_pmu__find_metrics_table(NULL);
> > -}
> > -
> >  /**
> >   * Return the length of the PMU name not including the suffix for unco=
re PMUs.
> >   *
> > diff --git a/tools/perf/util/pmu.h b/tools/perf/util/pmu.h
> > index fba3fc608b64..7b3e71194e49 100644
> > --- a/tools/perf/util/pmu.h
> > +++ b/tools/perf/util/pmu.h
> > @@ -260,7 +260,6 @@ void perf_pmu__arch_init(struct perf_pmu *pmu);
> >  void pmu_add_cpu_aliases_table(struct perf_pmu *pmu,
> >                              const struct pmu_events_table *table);
> >
> > -const struct pmu_metrics_table *pmu_metrics_table__find(void);
> >  bool pmu_uncore_identifier_match(const char *compat, const char *id);
> >
> >  int perf_pmu__convert_scale(const char *scale, char **end, double *sva=
l);
> >

