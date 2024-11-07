Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84B87D5AE6E
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 07:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:From:Subject
	:Mime-Version:Message-Id:Date:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wIF/aFyjH0swzXh//3pYKGTGeXLDfUk5PCZEh9QeTEg=; b=Vr6Ce2bFqfohM2EoT94VIic/Fy
	Yo6ybHZzBPWA+EpxyZMKFKnEEcs5LkczwkajsBfn0jCF1PBqrhKyzq8vozghvfMXbi1fkA8dlnsTr
	WHmGgjPad6YLTQuspieyAWdQLN4z4/mSmucI3tUMXS6ourH4vGD17w/uAgEtpFKufvwE5QVwwRgfO
	ZBpVUPfKyQN7CrTUk50710LW3p5pv7aMK0uY7ZDjHcx4NcpeNLO70dazZtPpnNaT2xtFARpCv1wz7
	gvTMHLelBm/YwvPENUDFS7uJngtDvc9DMKcE+mr65DngZ4SD7bnF0AXZIwoVV72WP+5WZA4FlpLwP
	GBu3zWVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8wmI-00000005xTU-3u0A;
	Thu, 07 Nov 2024 07:18:03 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8wkR-00000005wng-2ibM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Nov 2024 07:16:10 +0000
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-e330f65bcd9so1073535276.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 Nov 2024 23:16:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730963763; x=1731568563; darn=lists.infradead.org;
        h=to:from:subject:mime-version:message-id:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wIF/aFyjH0swzXh//3pYKGTGeXLDfUk5PCZEh9QeTEg=;
        b=GPjAsAp0hZHJkaillkkdthRVabxpIYe3a/RQ+eexxMfJ7BhmPERvxfoWIZaXkTE/Zy
         hR/wOqE03Ntu6Mr30cbM5TDBYoeeiMJ2cu3INVq+jBbofk3RWb6O0YnKX5RyNRBHTXLN
         UIGBq5FavRWHFj2GtlNsxvE51DmTSI8FjzmQfw8L1YzwkmRQRkKBSpyCueHSHBA72nsH
         SVB3lPn5yVFAqGirJHnlMbuE41AfMiW2QKUwf5EmpEsZXjZ3HJIUgz9bfKYC27qN1TB0
         WHKS7RCo0gVegXvkPU+Xpdd6rmIXMMbJn9DWWXf9i3DCPZg5CcN3ujYamTj7hdRKmtXK
         G+zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730963763; x=1731568563;
        h=to:from:subject:mime-version:message-id:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wIF/aFyjH0swzXh//3pYKGTGeXLDfUk5PCZEh9QeTEg=;
        b=s9p8vv+zsuZ3pNlWzITgOK16YP6oF/l0b7iYLLt0TuvVgZbp3+G563l3V9KUlM12dC
         QfVJFeoRUE4flym2LUufEwSGJOt4wdVPFNGRHxPvxjywFcvvwztWPA4TeipTXVa3Hpy/
         KcHPnv2N6LAguQyUNXxAlc/lY7HxtgCkB9EFod1reZYjQUhT4mhTRx9o5glcxNvVjuXJ
         KyC+VZflTUz7HX+orXXlweVTbSnr2U8R+Okr03MvBz6LEJeHSyao/rCeQykg7RdTiy6s
         GracmhpaHk11WWNuaw3TXEvWiDuUvPXgjzjKumKO3DyO3tZ14CfJywDhHaW1QNW99UU2
         apVg==
X-Forwarded-Encrypted: i=1; AJvYcCUv8oPcNX2txdeWMf8dSSuH1EZF0hruG4++NL6lC3KW67uRm20M3HQuMYWhl4IFO7lhaWtCLZAfHx3RjuSRW9V8@lists.infradead.org
X-Gm-Message-State: AOJu0YyALJQuohMZNZM06h1KP4+xxNcmbJU/S/E28rtvK9Zhq3lCiXRh
	2iUTskXT8y+vE2WkCCkMrq0sImCx18+RwtWfHPldnAKmuh8NMgJciMBRPUwUviaZ2d/KlJhrtrJ
	ZzAWHCQ==
X-Google-Smtp-Source: AGHT+IHvCILyN5DpJxEsgBeXCmm3giFiBD6WLezeO39x4rZhcquIeovnhv7BJuOVaBOHsKZJ7wG2BPFJsN4k
X-Received: from irogers.svl.corp.google.com ([2620:15c:2c5:11:acc7:bda:7167:18d8])
 (user=irogers job=sendgmr) by 2002:a25:600b:0:b0:e30:cbcf:181c with SMTP id
 3f1490d57ef6-e3368e1f4femr4836276.2.1730963763338; Wed, 06 Nov 2024 23:16:03
 -0800 (PST)
Date: Wed,  6 Nov 2024 23:15:53 -0800
Message-Id: <20241107071600.9082-1-irogers@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.47.0.199.ga7371fff76-goog
Subject: [PATCH v1 0/7] Refactor cpuid and metric table lookup code
From: Ian Rogers <irogers@google.com>
To: John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>, 
	James Clark <james.clark@linaro.org>, Mike Leach <mike.leach@linaro.org>, 
	Leo Yan <leo.yan@linux.dev>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Huacai Chen <chenhuacai@kernel.org>, Bibo Mao <maobibo@loongson.cn>, 
	Athira Rajeev <atrajeev@linux.vnet.ibm.com>, Ben Zong-You Xie <ben717@andestech.com>, 
	Alexandre Ghiti <alexghiti@rivosinc.com>, Sandipan Das <sandipan.das@amd.com>, 
	Benjamin Gray <bgray@linux.ibm.com>, Xu Yang <xu.yang_2@nxp.com>, 
	Ravi Bangoria <ravi.bangoria@amd.com>, 
	"=?UTF-8?q?Cl=C3=A9ment=20Le=20Goffic?=" <clement.legoffic@foss.st.com>, Yicong Yang <yangyicong@hisilicon.com>, 
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>, Dima Kogan <dima@secretsauce.net>, 
	"Dr. David Alan Gilbert" <linux@treblig.org>, linux-arm-kernel@lists.infradead.org, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_231607_775310_49719482 
X-CRM114-Status: GOOD (  13.34  )
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

Xu Yang <xu.yang_2@nxp.com> reported issues with the system metric
lookup:
https://lore.kernel.org/linux-perf-users/20241106085441.3945502-1-xu.yang_2@nxp.com/
These patches remove a lot of the logic relating CPUIDs to PMUs so
that the PMU isn't part of the question when finding a metric table.
For time reasons, it doesn't go as far as allowing system metrics
without a metric table as a metric table is needed for metrics to
refer to other metrics, and the refactoring of that resolution is a
hassle.

Ian Rogers (7):
  perf header: Move is_cpu_online to numa bench
  perf header: Refactor get_cpuid to take a CPU for ARM
  perf arm64 header: Use cpu argument in get_cpuid
  perf header: Avoid transitive PMU includes
  perf header: Pass a perf_cpu rather than a PMU to get_cpuid_str
  perf jevents: Add map_for_cpu
  perf pmu: Move pmu_metrics_table__find and remove ARM override

 tools/perf/arch/arm64/util/arm-spe.c     | 14 +---
 tools/perf/arch/arm64/util/header.c      | 73 ++++++++++-----------
 tools/perf/arch/arm64/util/pmu.c         | 20 ------
 tools/perf/arch/loongarch/util/header.c  |  4 +-
 tools/perf/arch/powerpc/util/header.c    |  4 +-
 tools/perf/arch/riscv/util/header.c      |  4 +-
 tools/perf/arch/s390/util/header.c       |  6 +-
 tools/perf/arch/x86/util/auxtrace.c      |  3 +-
 tools/perf/arch/x86/util/header.c        |  5 +-
 tools/perf/bench/numa.c                  | 51 +++++++++++++++
 tools/perf/builtin-kvm.c                 |  4 +-
 tools/perf/pmu-events/empty-pmu-events.c | 39 ++++++-----
 tools/perf/pmu-events/jevents.py         | 39 ++++++-----
 tools/perf/pmu-events/pmu-events.h       |  2 +-
 tools/perf/tests/expr.c                  |  5 +-
 tools/perf/util/env.c                    |  4 +-
 tools/perf/util/expr.c                   |  6 +-
 tools/perf/util/header.c                 | 82 ++++++++----------------
 tools/perf/util/header.h                 | 23 +++----
 tools/perf/util/pmu.c                    | 25 --------
 tools/perf/util/pmu.h                    |  2 -
 tools/perf/util/probe-event.c            |  1 +
 22 files changed, 187 insertions(+), 229 deletions(-)

-- 
2.47.0.199.ga7371fff76-goog


