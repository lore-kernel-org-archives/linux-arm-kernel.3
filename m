Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C637C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 00:43:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gcaewZV2w/xAY7WDlrMHxSsuzFCrVzNehbCR3+80PyQ=; b=O4D9WTwD6SJvb4J7RkWTXByOs7
	zMynqvN/FPd8WOiaEV+OBgd0x8Ci3lIVLnB4zXhUr+CStJrOqkKaPUHK+IgCgl/UCMh6EtvN7AQVO
	KKxYRtiUeCQmG2Gk+VwkRAXu6xLz7E1rT6OoOhmKPTRuzYTORgsH0SDDPLDluKiUSZ16rFCMO2+7P
	2oaEaZ3yyIRMzMeAwKFWx1wdSnte7RqWUdFxecEOi3nWDXi3BwGJ5kar2xF5kseCoEbWf7BiVNJeD
	WujWxL7xqqBNYRCafme46rWBkqZebOWJ3s6S/mg8BDYLqITC5vhVbgf2xEJS/s7e31GngT6X4V+Jm
	YJ+RinWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkBhI-00000006MWV-2eXH;
	Tue, 18 Feb 2025 00:42:48 +0000
Received: from mail-il1-x134.google.com ([2607:f8b0:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkBfo-00000006MG6-3oCx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 00:41:18 +0000
Received: by mail-il1-x134.google.com with SMTP id e9e14a558f8ab-3d18c325ee4so443375ab.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Feb 2025 16:41:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739839275; x=1740444075; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gcaewZV2w/xAY7WDlrMHxSsuzFCrVzNehbCR3+80PyQ=;
        b=ShBc0nZgbBGKmAF0ca+410gZJYvdT8Zv4FNtFUHIXjP2//6a3wsKrZyleMUtfok+ff
         Tp53ARDWTeSmuyDOwCqL77ViCgnFvSzn2BCA5vHgvQs0nvbvwnR+HQ/QQtv1oOkazT1o
         qEOJvFB9m83t6ox8xCs+5p9OhJkZZOubb6eeEC2kl/zyMmw//rOodM7Piz5MucuXBAoe
         ppKzQ1+H9LC9xhbhIgVJRpTwy3wfdwmXubsFeGfKENwPOeRoLmlM3k2kZtK/arsSBP0+
         RJZ2tKVfPShMImCUGiB7YNkYG0Yxu2JqyV5P6OAaKGxC1coibsDoNw5sUOHMjSpVvjQI
         7zvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739839275; x=1740444075;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gcaewZV2w/xAY7WDlrMHxSsuzFCrVzNehbCR3+80PyQ=;
        b=QiYFqNKA4rdFX1LgJSN4CtfE6w2v3k6T6X0Q7agWovizDwVXdHymWdu815ZJqCQsVA
         ynKHrZazbvsEgOe5wNjRbc4E8SM0KtAcqc0BH8TLKra3WfS1PTkhiCwYy68NbxyGg67m
         76ZV0/igDaMlBMzjwpnTl3lcHOch8ANDOlgn43fwJYaHpyhjz5G8Wox0w223sJXoY7NY
         NbjzLM8Z+JbVu8VL9T32sGCgd5pkpUE4BETXOoT+NB0vqfm8ssqvsN330QrHKj8xq1tR
         LIrZhkoifaUDA/y6CYacvfcIdBdGwiyN3Ky57dVL2ZJwdfN8B0eflixgI2FkPEWsJIBa
         jFyw==
X-Forwarded-Encrypted: i=1; AJvYcCUQWKO0d4VuDq6aqdRb7Uf2MPrkvxxnZRISnxv8W2GzoRag44yneLkf+dGbQ/6Vs/dfAZd378iF7NZIV+h84TpU@lists.infradead.org
X-Gm-Message-State: AOJu0Yz1IfVuZIrQ966m6SZbgcoDXwB8CYT3A0HMoQloh0hKhydR/pfb
	QZf5fKMWLGyy2yGhFVWl5ztoVqLpTArrue4WNeJcDsOQ9wuabT9L45MRXdGc88g5bETnZwZYF+0
	W6lEd7ZQEPhH5ZxXJdOviwZ3rNwtd5pQsnyyt
X-Gm-Gg: ASbGncsz43LxEI8A2B6o+7wy7hNJI878AqfS2O9HG2M+OKyHScwRl78s9nfC+24WlhL
	E56AyXHSAI2ED3ih1qBzVq1tsSrqJBGNr1c5u0CKkFXM1hV8av1qHjCCuBjz3BvHxSpbaapzdPw
	==
X-Google-Smtp-Source: AGHT+IHXvaTfT4v1tmvC1J02ZtCA554QJNiA8MCodvX0sdZgxo1uoWF5abKOcGHasd3qudKxx8Y4IvU2a9qmJhEPy5M=
X-Received: by 2002:a05:6e02:1a01:b0:3cf:c98a:ceba with SMTP id
 e9e14a558f8ab-3d2824a2ef1mr7040345ab.22.1739839274924; Mon, 17 Feb 2025
 16:41:14 -0800 (PST)
MIME-Version: 1.0
References: <tencent_5360DA048EE5B8CF3104213F8D037C698208@qq.com>
 <Z66YjGvjD_yzEHUg@google.com> <tencent_45B4E91CA370C563D6420A1A25F992056D09@qq.com>
 <1b8b234f-6435-45cf-83e7-8e86c84f075f@linaro.org>
In-Reply-To: <1b8b234f-6435-45cf-83e7-8e86c84f075f@linaro.org>
From: Ian Rogers <irogers@google.com>
Date: Mon, 17 Feb 2025 16:41:03 -0800
X-Gm-Features: AWEUYZnUSweoLhqqG88szbjCL3SjQ1zmQ5OCU6cYy08Ob1dcPF71ufs0IS27ejw
Message-ID: <CAP-5=fVAhLLH-a0_wLo8dPoMLOb6rOJiTgGh-OFZJJoaLFE-8Q@mail.gmail.com>
Subject: Re: [PATCH 0/2] perf vendor events arm64: Add A720/A520 events/metrics
To: James Clark <james.clark@linaro.org>
Cc: Yangyu Chen <cyy@cyyself.name>, Namhyung Kim <namhyung@kernel.org>, 
	linux-perf-users@vger.kernel.org, John Garry <john.g.garry@oracle.com>, 
	Will Deacon <will@kernel.org>, Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Liang Kan <kan.liang@linux.intel.com>, 
	Yoshihiro Furudera <fj5100bi@fujitsu.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_164116_966139_F84D9412 
X-CRM114-Status: GOOD (  25.27  )
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

On Fri, Feb 14, 2025 at 2:02=E2=80=AFAM James Clark <james.clark@linaro.org=
> wrote:
>
>
>
> On 14/02/2025 5:49 am, Yangyu Chen wrote:
> >
> >
> >> On 14 Feb 2025, at 09:12, Namhyung Kim <namhyung@kernel.org> wrote:
> >>
> >> Hello,
> >>
> >> On Thu, Feb 13, 2025 at 11:11:01PM +0800, Yangyu Chen wrote:
> >>> This patchset adds the perf JSON files for the Cortex-A720 and Cortex=
-A520
> >>> processors. Some events have been tested on Raxda Orion 6 with Cix P1=
 SoC
> >>> (8xA720 + 4xA520) running mainline Kernel with ACPI mode.
> >>
> >> I'm curious how the name of PMUs look like.  It is cortex_a720 (or a52=
0)?
> >
> > The name of PMUs comes from Arm's documentation. I have included these
> > links in each patch.
> >
> >> I remember there's a logic to check the length of hex digits at the en=
d.
> >>
> >
> > Could you provide more details about this?
> >
> >> Ian, are you ok with this?
> >>
>
> I think they wouldn't be merged because they're core PMUs, so should be
> fine? Even though they would otherwise be merged because they're more
> than 3 hex digits.

Do we know the PMU names? If they are cortex_a520 and cortex_a720 then
this comment at least reads a little stale:
https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.git/tr=
ee/tools/perf/util/pmus.c?h=3Dperf-tools-next#n76
```
/*
* There is a '_{num}' suffix. For decimal suffixes any length
* will do, for hexadecimal ensure more than 2 hex digits so
* that S390's cpum_cf PMU doesn't match.
*/
```
James is right that core PMUs aren't put on the same list as uncore/other P=
MUs.

Thanks,
Ian

> >> Thanks,
> >> Namhyung
> >>
> >>>
> >>> Yangyu Chen (2):
> >>>   perf vendor events arm64: Add Cortex-A720 events/metrics
> >>>   perf vendor events arm64: Add Cortex-A520 events/metrics
> >>>
> >>> .../arch/arm64/arm/cortex-a520/bus.json       |  26 ++
> >>> .../arch/arm64/arm/cortex-a520/exception.json |  18 +
> >>> .../arm64/arm/cortex-a520/fp_operation.json   |  14 +
> >>> .../arch/arm64/arm/cortex-a520/general.json   |   6 +
> >>> .../arch/arm64/arm/cortex-a520/l1d_cache.json |  50 ++
> >>> .../arch/arm64/arm/cortex-a520/l1i_cache.json |  14 +
> >>> .../arch/arm64/arm/cortex-a520/l2_cache.json  |  46 ++
> >>> .../arch/arm64/arm/cortex-a520/l3_cache.json  |  21 +
> >>> .../arch/arm64/arm/cortex-a520/ll_cache.json  |  10 +
> >>> .../arch/arm64/arm/cortex-a520/memory.json    |  58 +++
> >>> .../arch/arm64/arm/cortex-a520/metrics.json   | 373 +++++++++++++++
> >>> .../arch/arm64/arm/cortex-a520/pmu.json       |   8 +
> >>> .../arch/arm64/arm/cortex-a520/retired.json   |  90 ++++
> >>> .../arm64/arm/cortex-a520/spec_operation.json |  70 +++
> >>> .../arch/arm64/arm/cortex-a520/stall.json     |  82 ++++
> >>> .../arch/arm64/arm/cortex-a520/sve.json       |  22 +
> >>> .../arch/arm64/arm/cortex-a520/tlb.json       |  78 ++++
> >>> .../arch/arm64/arm/cortex-a520/trace.json     |  32 ++
> >>> .../arch/arm64/arm/cortex-a720/bus.json       |  18 +
> >>> .../arch/arm64/arm/cortex-a720/exception.json |  62 +++
> >>> .../arm64/arm/cortex-a720/fp_operation.json   |  22 +
> >>> .../arch/arm64/arm/cortex-a720/general.json   |  10 +
> >>> .../arch/arm64/arm/cortex-a720/l1d_cache.json |  50 ++
> >>> .../arch/arm64/arm/cortex-a720/l1i_cache.json |  14 +
> >>> .../arch/arm64/arm/cortex-a720/l2_cache.json  |  62 +++
> >>> .../arch/arm64/arm/cortex-a720/l3_cache.json  |  22 +
> >>> .../arch/arm64/arm/cortex-a720/ll_cache.json  |  10 +
> >>> .../arch/arm64/arm/cortex-a720/memory.json    |  54 +++
> >>> .../arch/arm64/arm/cortex-a720/metrics.json   | 436 +++++++++++++++++=
+
> >>> .../arch/arm64/arm/cortex-a720/pmu.json       |   8 +
> >>> .../arch/arm64/arm/cortex-a720/retired.json   |  90 ++++
> >>> .../arch/arm64/arm/cortex-a720/spe.json       |  42 ++
> >>> .../arm64/arm/cortex-a720/spec_operation.json |  90 ++++
> >>> .../arch/arm64/arm/cortex-a720/stall.json     |  82 ++++
> >>> .../arch/arm64/arm/cortex-a720/sve.json       |  50 ++
> >>> .../arch/arm64/arm/cortex-a720/tlb.json       |  74 +++
> >>> .../arch/arm64/arm/cortex-a720/trace.json     |  32 ++
> >>> .../arch/arm64/common-and-microarch.json      |  15 +
> >>> tools/perf/pmu-events/arch/arm64/mapfile.csv  |   2 +
> >>> 39 files changed, 2263 insertions(+)
> >>> create mode 100644 tools/perf/pmu-events/arch/arm64/arm/cortex-a520/b=
us.json
> >>> create mode 100644 tools/perf/pmu-events/arch/arm64/arm/cortex-a520/e=
xception.json
> >>> create mode 100644 tools/perf/pmu-events/arch/arm64/arm/cortex-a520/f=
p_operation.json
> >>> create mode 100644 tools/perf/pmu-events/arch/arm64/arm/cortex-a520/g=
eneral.json
> >>> create mode 100644 tools/perf/pmu-events/arch/arm64/arm/cortex-a520/l=
1d_cache.json
> >>> create mode 100644 tools/perf/pmu-events/arch/arm64/arm/cortex-a520/l=
1i_cache.json
> >>> create mode 100644 tools/perf/pmu-events/arch/arm64/arm/cortex-a520/l=
2_cache.json
> >>> create mode 100644 tools/perf/pmu-events/arch/arm64/arm/cortex-a520/l=
3_cache.json
> >>> create mode 100644 tools/perf/pmu-events/arch/arm64/arm/cortex-a520/l=
l_cache.json
> >>> create mode 100644 tools/perf/pmu-events/arch/arm64/arm/cortex-a520/m=
emory.json
> >>> create mode 100644 tools/perf/pmu-events/arch/arm64/arm/cortex-a520/m=
etrics.json
> >>> create mode 100644 tools/perf/pmu-events/arch/arm64/arm/cortex-a520/p=
mu.json
> >>> create mode 100644 tools/perf/pmu-events/arch/arm64/arm/cortex-a520/r=
etired.json
> >>> create mode 100644 tools/perf/pmu-events/arch/arm64/arm/cortex-a520/s=
pec_operation.json
> >>> create mode 100644 tools/perf/pmu-events/arch/arm64/arm/cortex-a520/s=
tall.json
> >>> create mode 100644 tools/perf/pmu-events/arch/arm64/arm/cortex-a520/s=
ve.json
> >>> create mode 100644 tools/perf/pmu-events/arch/arm64/arm/cortex-a520/t=
lb.json
> >>> create mode 100644 tools/perf/pmu-events/arch/arm64/arm/cortex-a520/t=
race.json
> >>> create mode 100644 tools/perf/pmu-events/arch/arm64/arm/cortex-a720/b=
us.json
> >>> create mode 100644 tools/perf/pmu-events/arch/arm64/arm/cortex-a720/e=
xception.json
> >>> create mode 100644 tools/perf/pmu-events/arch/arm64/arm/cortex-a720/f=
p_operation.json
> >>> create mode 100644 tools/perf/pmu-events/arch/arm64/arm/cortex-a720/g=
eneral.json
> >>> create mode 100644 tools/perf/pmu-events/arch/arm64/arm/cortex-a720/l=
1d_cache.json
> >>> create mode 100644 tools/perf/pmu-events/arch/arm64/arm/cortex-a720/l=
1i_cache.json
> >>> create mode 100644 tools/perf/pmu-events/arch/arm64/arm/cortex-a720/l=
2_cache.json
> >>> create mode 100644 tools/perf/pmu-events/arch/arm64/arm/cortex-a720/l=
3_cache.json
> >>> create mode 100644 tools/perf/pmu-events/arch/arm64/arm/cortex-a720/l=
l_cache.json
> >>> create mode 100644 tools/perf/pmu-events/arch/arm64/arm/cortex-a720/m=
emory.json
> >>> create mode 100644 tools/perf/pmu-events/arch/arm64/arm/cortex-a720/m=
etrics.json
> >>> create mode 100644 tools/perf/pmu-events/arch/arm64/arm/cortex-a720/p=
mu.json
> >>> create mode 100644 tools/perf/pmu-events/arch/arm64/arm/cortex-a720/r=
etired.json
> >>> create mode 100644 tools/perf/pmu-events/arch/arm64/arm/cortex-a720/s=
pe.json
> >>> create mode 100644 tools/perf/pmu-events/arch/arm64/arm/cortex-a720/s=
pec_operation.json
> >>> create mode 100644 tools/perf/pmu-events/arch/arm64/arm/cortex-a720/s=
tall.json
> >>> create mode 100644 tools/perf/pmu-events/arch/arm64/arm/cortex-a720/s=
ve.json
> >>> create mode 100644 tools/perf/pmu-events/arch/arm64/arm/cortex-a720/t=
lb.json
> >>> create mode 100644 tools/perf/pmu-events/arch/arm64/arm/cortex-a720/t=
race.json
> >>>
> >>> --
> >>> 2.47.2
> >>>
> >
>

