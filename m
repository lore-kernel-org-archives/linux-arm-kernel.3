Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AF76D43377
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 16:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:From:Subject
	:Mime-Version:Message-Id:Date:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=v57hY9ptVyUkWxpU5CBHz4hqYdCeNDSYBzpW7YMhHII=; b=x2FEaOoC1n8wY/8DF8TqGCLKEJ
	5r2VDdrmY6cC7lhNq5QxcYjv6gu7/S7rq0EoU1ZTAya74ezj6gV9JKM0mhWKbX+XivowqfPP9DwYc
	ksjO/Vpq6diMHCOd4EMMBtBTr0B5jZfH22qgyYbG4/yC9wESBf202uerX4uJUCyv4MVDT86gBWBbp
	inug3JU8uTQmXTZUWqBosEa3I80kp29dfZ+y17gEf/gzcpIcP3xlX3QFX7O1SZ9Z6Qe6JyC4erwwr
	yYbVEFSiZgUzx9mRdP+9DX20LHOYIqh5adzEd+PMqBd+xheQId7eRqjPfQD4eskm5OfqFLMMYzMJH
	9CnvXXqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t95Ow-00000007ePp-18ap;
	Thu, 07 Nov 2024 16:30:30 +0000
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t95FS-00000007bZD-31aQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Nov 2024 16:20:44 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-6ea82a5480fso22118857b3.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 07 Nov 2024 08:20:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730996441; x=1731601241; darn=lists.infradead.org;
        h=to:from:subject:mime-version:message-id:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=v57hY9ptVyUkWxpU5CBHz4hqYdCeNDSYBzpW7YMhHII=;
        b=QCWlrhEtkTxu0m+acOEHaOxNXNuICDZM79pzUvwprj01prHwqRwSgoCsJxxq8o/5RI
         B+lWy1JBCm+OCo33hbwtI7YNAUAnTDpRrrmofTXhSULwf7K+tgrCkVbJH1hX3Q8ddfaW
         ORV23YsI/VrAA64qIduLpjTAUKErPxnXS12b/h5/wNes6fQ9om7fPSO5GZdOYmPGtOgf
         W5Q+kfy2wyol7mFiSvKUIKQP4kU3pIYFbLw8y5u6L44SUyAKGt1rXtgWe5xg4dr8wRc3
         +TxBRjS/URafxIAzhQZZZ9GW42hyE4sTjiBltIl56NM7m85mciGBaaYOnG73IdzNd1bH
         ZR1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730996441; x=1731601241;
        h=to:from:subject:mime-version:message-id:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=v57hY9ptVyUkWxpU5CBHz4hqYdCeNDSYBzpW7YMhHII=;
        b=s9Fwz23UIOQtiZ//8SbD5srTTFJOgccUNlROSy0WZs+G+39gVpE5a/ppfYVWdWdKN1
         q/n5V/AhSy6lINKQjQ9lmkS9ljnRHjS1Sjb6NRPpdudLM5JJc/fItCTfF2WTk5q5QEGB
         ktcP6s450Xvt5Vr012QyY3OGvuqVfIciTGDLGRzcuFekgj7RkMtgs4ipfHRzUAWlCa62
         bO3NQHrvL/EcX/VXsWZwS4HmagxL5kFSQQOONREkIl8mm/HUVtTUXCC2W5zzG77qiB40
         hLxOYfKyp2uKS9FWX+8mnjbInd23l9HgJTee8nP9MeC7K+mqPm6Holwdu5OBc3Kjf69i
         4S4A==
X-Forwarded-Encrypted: i=1; AJvYcCUuyv2065NvktYT/gS1TTg12ZYv0X0eVh0QEr6pWIrVZ7lie555sgjz/lYEOyvwuaCmCb8X9cTdNbwOnwgW6jnJ@lists.infradead.org
X-Gm-Message-State: AOJu0YwWeu9h3n6kCjqPzYNJf9g8Q/i0CReH4HV0NKfTizGmfGpr7MED
	r00z7a/OGB5VqLzb9jGtXFMLldL0YjYU5v26t4WMADLcjPVGPUoGqcEbVR8Vcn+nVs4PPi5b+Ze
	/BQn8VQ==
X-Google-Smtp-Source: AGHT+IHC0X+WZsmRaD10ygx7XOVdKB/UZb7/tV2Np4btpUBS2SgGAemSgZHBuWrvuUd2DVUs75+KuuMxxrqo
X-Received: from irogers.svl.corp.google.com ([2620:15c:2c5:11:acc7:bda:7167:18d8])
 (user=irogers job=sendgmr) by 2002:a05:690c:13:b0:6ea:8651:4b27 with SMTP id
 00721157ae682-6eadc1065acmr1207b3.5.1730996440734; Thu, 07 Nov 2024 08:20:40
 -0800 (PST)
Date: Thu,  7 Nov 2024 08:20:27 -0800
Message-Id: <20241107162035.52206-1-irogers@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.47.0.199.ga7371fff76-goog
Subject: [PATCH v2 0/8] Refactor cpuid and metric table lookup code
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
X-CRM114-CacheID: sfid-20241107_082042_772714_25633DA5 
X-CRM114-Status: GOOD (  13.58  )
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

Xu Yang (1):
  perf jevents: fix breakage when do perf stat on system metric

 tools/perf/arch/arm64/util/arm-spe.c     | 14 +---
 tools/perf/arch/arm64/util/header.c      | 73 ++++++++++-----------
 tools/perf/arch/arm64/util/pmu.c         | 20 ------
 tools/perf/arch/loongarch/util/header.c  |  4 +-
 tools/perf/arch/powerpc/util/header.c    |  4 +-
 tools/perf/arch/riscv/util/header.c      |  4 +-
 tools/perf/arch/s390/util/header.c       |  6 +-
 tools/perf/arch/x86/util/auxtrace.c      |  3 +-
 tools/perf/arch/x86/util/header.c        |  5 +-
 tools/perf/bench/numa.c                  | 53 +++++++++++++++
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
 22 files changed, 189 insertions(+), 229 deletions(-)

-- 
2.47.0.199.ga7371fff76-goog


