Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F372AC54ED1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 May 2025 06:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:From:Subject
	:Message-ID:Mime-Version:Date:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kcV28N5+sBWjxRZkVWUHsu8deeFtQ4ZFy7tqc4CjbTQ=; b=TZPAeFCSuAyoqCUV0YrwS6Pq23
	hEmyBVucVU/JtACMpW1DLHMMgcUTACJtLS+AvS6rYuBtnFmbAW07lEf2yT7PoBH/1HAPO4lCyhWqe
	+vpDYGyTR8kfzH8plxiDSVLdhtEcCmYglP3x4OCK5ba9g71JMlnSV6ZmR3eZrUGCSeTMyJzf23yg0
	V8ruYOvpq50AeEKw8o0acf0RTNkCBWZ9yAopc5WrBUcxY24xTBu/YVKq9iSJ98FHXhDbaX2gpg8pE
	1HJzz8XuKCK2s5FkWs0ULVFBr0Rt5Jkw8u8GvAmtQK47XobkZsagKnXlGjIF2ndqFfXiuwGN38Xyn
	x9D9jMYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJo3c-0000000A485-2kOv;
	Tue, 27 May 2025 06:45:04 +0000
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJo0j-0000000A3Qr-31EO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 May 2025 06:42:07 +0000
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-740270e168aso2167883b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 May 2025 23:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748328124; x=1748932924; darn=lists.infradead.org;
        h=to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=kcV28N5+sBWjxRZkVWUHsu8deeFtQ4ZFy7tqc4CjbTQ=;
        b=MSUkotfEKUHRWMHScsHCereQd6AY+RK2BJWQtFQ6e8bEPkNT/fIsECjuTyB1foNI2R
         fRB7mFHMcdkqnXkuoGtdsg5FgS18/FW7aFtqjG2YT2iHTtft4EGZA+JpYWe3eOuQR3Do
         Mf4LeftHBMYykHaIr9JCRgPuHyev7JtPAzBMIQVhEoG9MWRf5zIav0Uvl9B1XGwUiPqe
         v3YIkspluGlRou8WFIYMMSiuSKjsgnAzlRs/qs+U/RITiV5ALt0kQhoB9pMX4jHzT5NF
         p5WlnIpkjKvBe6+8ApuRGo6ybfhbz0DEKFw2Hj+L7WSgR+E3TBucnerOg4W+tNGLFfvd
         ur8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748328124; x=1748932924;
        h=to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kcV28N5+sBWjxRZkVWUHsu8deeFtQ4ZFy7tqc4CjbTQ=;
        b=h534RqSszu5uHzMvVdqYMkIvP7Ac6IgWmhlbhuncBWu9i3e5eOi3h/lIBIqsRg4Xex
         y3w2Ogbz6+il/ijPI+fAA5JnZZTIr8hK3WlBM92UUynu6IDup8WRe2i0hr+kVD1ur4Pl
         DuY60yg+R6M31lJh7WiVM3emR6WdT6HKv6sgsHNfS+kG7TZ3giGQHznvKjXSdEhhtqfh
         l4F1ACOWCwkcKhV1fq6nJ9sQnJ4dx60mZeVNfccjhxhMI7Kbr70fyc1cYJIvj1SKS7mS
         ds/0eyd7/DuhjuXf7tmil52ivC7ApTlnGy7vUUmPOqxnCe3SDkH9fA2cLPxwO03BQI6r
         eC8Q==
X-Forwarded-Encrypted: i=1; AJvYcCW5M9aVFoJ+dJoa4k8PR4UMuJZL8rqDERnz/rYB5wBsf+PDyIDTveqaxstlbmQY39ZRnPD75rz5uaRsg0rvbtDi@lists.infradead.org
X-Gm-Message-State: AOJu0YwJsOR1ii6onVagDYK3KeBcgQsWH80AD85VX7jPqPZ/oyVzEKCQ
	eCb3XvesgubFLKxn0WgZ8ejPJWJwjXv40y+850jJZQLGLoQWkQu/+W3b0frkJsAB5j4jSyatk1F
	ys5mBw5IWsQ==
X-Google-Smtp-Source: AGHT+IGUN0fzVTWfN5BSgaJmYPqCEB1x73YKDQNWO3sa567CFbM07VnpKZotlJY8dhXy0AXzIRWeiHbPcWWi
X-Received: from pfbfb3.prod.google.com ([2002:a05:6a00:2d83:b0:736:9d24:ae31])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:3cc3:b0:740:a85b:7554
 with SMTP id d2e1a72fcca58-745fde777d1mr17188534b3a.2.1748328123817; Mon, 26
 May 2025 23:42:03 -0700 (PDT)
Date: Mon, 26 May 2025 23:41:42 -0700
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.1151.ga128411c76-goog
Message-ID: <20250527064153.149939-1-irogers@google.com>
Subject: [PATCH v1 00/11] Remove global perf_env
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, John Garry <john.g.garry@oracle.com>, 
	Will Deacon <will@kernel.org>, James Clark <james.clark@linaro.org>, 
	Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>, 
	Charlie Jenkins <charlie@rivosinc.com>, Colin Ian King <colin.i.king@gmail.com>, 
	Andi Kleen <ak@linux.intel.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Ravi Bangoria <ravi.bangoria@amd.com>, Graham Woodward <graham.woodward@arm.com>, 
	Ilkka Koskinen <ilkka@os.amperecomputing.com>, Zhongqiu Han <quic_zhonhan@quicinc.com>, 
	Yicong Yang <yangyicong@hisilicon.com>, Howard Chu <howardchu95@gmail.com>, 
	"Dr. David Alan Gilbert" <linux@treblig.org>, Levi Yun <yeoreum.yun@arm.com>, 
	Weilin Wang <weilin.wang@intel.com>, Michael Petlan <mpetlan@redhat.com>, 
	"=?UTF-8?q?Krzysztof=20=C5=81opatowski?=" <krzysztof.m.lopatowski@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, 
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>, Chun-Tse Shao <ctshao@google.com>, Ben Gainey <ben.gainey@arm.com>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250526_234205_778565_B66A5A93 
X-CRM114-Status: GOOD (  15.45  )
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

The global perf_env is used to hold host information, but it is also
used as a fallback in a number of cases where the information may be
bogus. Restructure the code so that the perf_env of the session is
accessed. When necessary a locally scoped host perf_env is created and
used.

Cleaning up the inconsistency was requested by Kan Liang in:
https://lore.kernel.org/lkml/c56c9e23-cf6e-4040-aee8-da13d5157dcf@linux.intel.com/

Ian Rogers (11):
  perf session: Add accessor for session->header.env
  perf session: Add an env pointer for the current perf_env
  perf evlist: Change env variable to session
  perf header: Clean up use of perf_env
  perf test: Avoid use perf_env
  perf top: Make perf_env locally scoped
  perf session: Add host_env argument to perf_session__new
  perf bench synthesize: Avoid use of global perf_env
  perf machine: Explicitly pass in host perf_env
  perf auxtrace: Pass perf_env from session through to mmap read
  perf env: Remove global perf_env

 tools/perf/bench/synthesize.c         |  30 +++--
 tools/perf/builtin-annotate.c         |   4 +-
 tools/perf/builtin-buildid-cache.c    |   2 +-
 tools/perf/builtin-buildid-list.c     |   5 +-
 tools/perf/builtin-c2c.c              |  16 ++-
 tools/perf/builtin-inject.c           |   5 +-
 tools/perf/builtin-kallsyms.c         |  21 ++-
 tools/perf/builtin-kmem.c             |   2 +-
 tools/perf/builtin-kvm.c              |   4 +-
 tools/perf/builtin-kwork.c            |   2 +-
 tools/perf/builtin-lock.c             |   4 +-
 tools/perf/builtin-mem.c              |   2 +-
 tools/perf/builtin-record.c           |  30 +++--
 tools/perf/builtin-report.c           |  14 +-
 tools/perf/builtin-sched.c            |   8 +-
 tools/perf/builtin-script.c           |  16 ++-
 tools/perf/builtin-stat.c             |  23 ++--
 tools/perf/builtin-timechart.c        |   2 +-
 tools/perf/builtin-top.c              |  40 ++++--
 tools/perf/builtin-trace.c            |  26 ++--
 tools/perf/perf.c                     |   3 -
 tools/perf/tests/code-reading.c       |   6 +-
 tools/perf/tests/dlfilter-test.c      |  51 ++++----
 tools/perf/tests/dwarf-unwind.c       |  10 +-
 tools/perf/tests/mmap-thread-lookup.c |   6 +-
 tools/perf/tests/symbols.c            |   8 +-
 tools/perf/tests/topology.c           |  39 +++---
 tools/perf/ui/browser.h               |   4 +-
 tools/perf/ui/browsers/header.c       |   4 +-
 tools/perf/ui/browsers/hists.c        |   2 +-
 tools/perf/util/amd-sample-raw.c      |   2 +-
 tools/perf/util/arm-spe.c             |   2 +-
 tools/perf/util/auxtrace.c            |  13 +-
 tools/perf/util/auxtrace.h            |   6 +-
 tools/perf/util/bpf-event.c           |   2 +-
 tools/perf/util/branch.c              |   2 +-
 tools/perf/util/data-convert-bt.c     |  16 +--
 tools/perf/util/data-convert-json.c   |  36 +++---
 tools/perf/util/env.c                 |   3 +-
 tools/perf/util/env.h                 |   2 -
 tools/perf/util/evlist.h              |   2 +-
 tools/perf/util/evsel.c               |  12 +-
 tools/perf/util/evsel.h               |   1 +
 tools/perf/util/header.c              | 180 +++++++++++++++-----------
 tools/perf/util/machine.c             |   8 +-
 tools/perf/util/machine.h             |   4 +-
 tools/perf/util/probe-event.c         |   5 +-
 tools/perf/util/s390-cpumsf.c         |   2 +-
 tools/perf/util/sample-raw.c          |   7 +-
 tools/perf/util/sample-raw.h          |   2 +-
 tools/perf/util/session.c             |  17 ++-
 tools/perf/util/session.h             |   9 +-
 tools/perf/util/tool.c                |   2 +-
 53 files changed, 424 insertions(+), 300 deletions(-)

-- 
2.49.0.1151.ga128411c76-goog


