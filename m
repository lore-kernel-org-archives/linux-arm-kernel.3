Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71BA5C678DA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 22:48:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3vEDD/3+oN2wHSmEz8et4qIfjvLbGI5jfICcYbOiL3E=; b=fKnZdNVWg4cUZSGBpIGPsuUUE+
	rm12QyPngcmyvTm66hnjJDv+axQlJiQ4sIm3eqiEbE42d0xcq8XcmyUK9HxrRauj22GQx7OFIJ8st
	lIAB+E0JoZGCnOknUxjhFnuLnsjQe+FFCgRjJr6WgqerGg3YDlhVlO9ZhCpp97+j9calHts9fPFM8
	XNEI8Og9JdTGUQfkMi8hNg5pBzLh+4q3TzLWviZwvPpbC5RcJuB9p9We0TrMEvKjn3SQHrlJyExSY
	V4kXr07rQRxtd0oucz5ThQJPwXv2h39HcPY0o+Re+ss9ybEVIaE9G+331J06PSBj9xNGipxH7iAY2
	f08QM+Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP7lY-00000008FGu-1XO6;
	Tue, 10 Jun 2025 22:48:24 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP3bK-00000007nKN-01ck
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 18:21:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id EA430A51566;
	Tue, 10 Jun 2025 18:21:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18387C4CEED;
	Tue, 10 Jun 2025 18:21:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749579692;
	bh=RxyG1Rz0N9PG+NOxTZum7EJceB7Pk5gEOyuxNQXUgBM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F8AL8ClABol+43UeqcYFqj4KTp3okDMlM8SbcLZ3uG0Cbu0jQKh27VUKVryenTKE6
	 zY6V5Jhn5Orlr1zeXJkqfINwKrSCkeLVaUAN1K0l/zvmhvgMAtH9DtVyVcHoPo1i5X
	 gZW5Cf9KSzwreugpH6E2o7KTCJPBlkunVVeVXE9j19rXk+4fzxQ7j5Ssz3IJJu1b+u
	 fJgMTmxN+/4HokxqzFrdUPAE+uYF0U1njItyys5VNeWjg0ImY+eh9COe0knhKTJxdB
	 tYqeslmfJYc6DmI6/c3Te4wmkd7T2SuGrt+vKDbHIohf0xEwrP8JkkDi7c6Rlv3QBx
	 4rnt7nbxwqyVA==
Date: Tue, 10 Jun 2025 11:21:29 -0700
From: Namhyung Kim <namhyung@kernel.org>
To: Ian Rogers <irogers@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Kan Liang <kan.liang@linux.intel.com>,
	John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>,
	James Clark <james.clark@linaro.org>,
	Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>,
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>,
	Ravi Bangoria <ravi.bangoria@amd.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Colin Ian King <colin.i.king@gmail.com>,
	Andi Kleen <ak@linux.intel.com>, Dmitry Vyukov <dvyukov@google.com>,
	Graham Woodward <graham.woodward@arm.com>,
	Ilkka Koskinen <ilkka@os.amperecomputing.com>,
	Zhongqiu Han <quic_zhonhan@quicinc.com>,
	Yicong Yang <yangyicong@hisilicon.com>,
	Athira Rajeev <atrajeev@linux.ibm.com>,
	Kajol Jain <kjain@linux.ibm.com>, Li Huafei <lihuafei1@huawei.com>,
	"Steinar H. Gunderson" <sesse@google.com>,
	Stephen Brennan <stephen.s.brennan@oracle.com>,
	Chun-Tse Shao <ctshao@google.com>, Yujie Liu <yujie.liu@intel.com>,
	"Dr. David Alan Gilbert" <linux@treblig.org>,
	Levi Yun <yeoreum.yun@arm.com>, Howard Chu <howardchu95@gmail.com>,
	Weilin Wang <weilin.wang@intel.com>,
	Thomas Falcon <thomas.falcon@intel.com>,
	Matt Fleming <matt@readmodwrite.com>,
	Veronika Molnarova <vmolnaro@redhat.com>,
	Krzysztof =?utf-8?Q?=C5=81opatowski?= <krzysztof.m.lopatowski@gmail.com>,
	Zixian Cai <fzczx123@gmail.com>,
	Steve Clevenger <scclevenger@os.amperecomputing.com>,
	Ben Gainey <ben.gainey@arm.com>,
	Chaitanya S Prakash <chaitanyas.prakash@arm.com>,
	Martin Liska <martin.liska@hey.com>,
	Martin =?utf-8?B?TGnFoWth?= <m.liska@foxlink.cz>,
	Song Liu <song@kernel.org>, linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 00/24] perf: Make code more generic with modern
 defaults
Message-ID: <aEh3qcfleSr4B9j9@google.com>
References: <20250529044000.759937-1-irogers@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250529044000.759937-1-irogers@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_112134_177102_932CD170 
X-CRM114-Status: GOOD (  34.93  )
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

Hi Ian,

On Wed, May 28, 2025 at 09:39:36PM -0700, Ian Rogers wrote:
> This patch series combines:
> "perf: Default use of build IDs and improvements"
> https://lore.kernel.org/lkml/20250428213409.1417584-1-irogers@google.com/
> "Remove global perf_env"
> https://lore.kernel.org/lkml/20250527064153.149939-1-irogers@google.com/
> "Generic weight struct, use env for sort key and header"
> https://lore.kernel.org/lkml/20250521135500.677508-1-irogers@google.com/
> This is done as the last 2 series depend on each other and the
> cleanups in the 1st have the potential to conflict with them.
> 
> "perf: Default use of build IDs and improvements"
> 
> Build ID mmap2 events have been available since Linux v5.12 and avoid
> certain races. Enable these by default as discussed in:
> https://lore.kernel.org/linux-perf-users/CAP-5=fXP7jN_QrGUcd55_QH5J-Y-FCaJ6=NaHVtyx0oyNh8_-Q@mail.gmail.com/
> 
> The dso_id is used to indentify a DSO that may change by being
> overwritten. The inode generation isn't present in /proc/pid/maps and
> so was already only optionally filled in. With build ID mmap events
> the other major, minor and inode varialbes aren't filled in. Change
> the dso_id implementation to make optional values explicit, rather
> than injecting a dso_id we want to improve it during find operations,
> add the buildid to the dso_id for sorting and so that matching fails
> when build IDs vary between DSOs.
> 
> Mark the callchain for buildids and not just the sample IP, fixing
> missing DSOs.
> 
> Fix sample__for_each_callchain_node to populate the map even when
> symbols aren't computed.
> 
> Other minor bits of build_id clean up.

I've tried to pick the build-id part, but I got a build error like this:

  util/probe-finder.c: In function 'find_probe_point_lazy':
  util/probe-finder.c:863:25: error: implicit declaration of function 'build_id__sprintf';
  did you mean 'build_id__snprintf'? [-Werror=implicit-function-declaration]
    863 |                         build_id__sprintf(&bid, sbuild_id);
        |                         ^~~~~~~~~~~~~~~~~
  --
  util/probe-event.c: In function '__show_line_range':
  util/probe-event.c:1093:17: error: implicit declaration of function 'build_id__sprintf'; 
  did you mean 'build_id__snprintf'? [-Werror=implicit-function-declaration]
   1093 |                 build_id__sprintf(&bid, sbuild_id);
        |                 ^~~~~~~~~~~~~~~~~
  tests/sdt.c: In function 'build_id_cache__add_file':
  tests/sdt.c:40:9: error: implicit declaration of function 'build_id__sprintf'; 
  did you mean 'build_id__snprintf'? [-Werror=implicit-function-declaration]
     40 |         build_id__sprintf(&bid, sbuild_id);
        |         ^~~~~~~~~~~~~~~~~

> 
> "Remove global perf_env"
> 
> The global perf_env is used to hold host information, but it is also
> used as a fallback in a number of cases where the information may be
> bogus. Restructure the code so that the perf_env of the session is
> accessed. When necessary a locally scoped host perf_env is created and
> used.
> 
> Cleaning up the inconsistency was requested by Kan Liang in:
> https://lore.kernel.org/lkml/c56c9e23-cf6e-4040-aee8-da13d5157dcf@linux.intel.com/

And I got some conflicts here.

Please take a look, thanks!
Namhyung

> 
> "Generic weight struct, use env for sort key and header"
> 
> The arch directory is a barrier to cross-platform development as files
> and behaviors within it are inherently platform specific. Sample
> parsing should be generic but the PERF_SAMPLE_WEIGHT_STRUCT handling
> was only present if building for x86 or powerpc. The sort key and
> headers should be specific to the session that is being executed and
> not to the machine perf is being run upon. These patches clean this
> and associated code up.
> 
> v4: Shorten to "weight3" histogram and sample variable, but comment
>     its use (Namhyung). Fix evsel__env use in `perf trace` where no
>     session was present. Assert the session is never passed a NULL
>     host_env when there is no data file and its associated env.
> 
> Ian Rogers (24):
>   perf callchain: Always populate the addr_location map when adding IP
>   perf build-id: Reduce size of "size" variable
>   perf build-id: Truncate to avoid overflowing the build_id data
>   perf build-id: Change sprintf functions to snprintf
>   perf build-id: Mark DSO in sample callchains
>   perf build-id: Ensure struct build_id is empty before use
>   perf dso: Move build_id to dso_id
>   perf jitdump: Directly mark the jitdump DSO
>   perf record: Make --buildid-mmap the default
>   perf session: Add accessor for session->header.env
>   perf session: Add an env pointer for the current perf_env
>   perf evlist: Change env variable to session
>   perf header: Clean up use of perf_env
>   perf test: Avoid use perf_env
>   perf session: Add host_env argument to perf_session__new
>   perf top: Make perf_env locally scoped
>   perf bench synthesize: Avoid use of global perf_env
>   perf machine: Explicitly pass in host perf_env
>   perf auxtrace: Pass perf_env from session through to mmap read
>   perf trace: Avoid global perf_env with evsel__env
>   perf env: Remove global perf_env
>   perf sample: Remove arch notion of sample parsing
>   perf test: Move PERF_SAMPLE_WEIGHT_STRUCT parsing to common test
>   perf sort: Use perf_env to set arch sort keys and header
> 
>  tools/perf/arch/powerpc/util/Build            |   1 -
>  tools/perf/arch/powerpc/util/event.c          |  60 ------
>  tools/perf/arch/x86/include/arch-tests.h      |   1 -
>  tools/perf/arch/x86/tests/Build               |   1 -
>  tools/perf/arch/x86/tests/arch-tests.c        |   2 -
>  tools/perf/arch/x86/tests/sample-parsing.c    | 125 ------------
>  tools/perf/arch/x86/util/event.c              |  46 -----
>  tools/perf/bench/inject-buildid.c             |   2 +-
>  tools/perf/bench/synthesize.c                 |  30 +--
>  tools/perf/builtin-annotate.c                 |   6 +-
>  tools/perf/builtin-buildid-cache.c            |  22 +--
>  tools/perf/builtin-buildid-list.c             |  11 +-
>  tools/perf/builtin-c2c.c                      |  69 ++++---
>  tools/perf/builtin-diff.c                     |   2 +-
>  tools/perf/builtin-inject.c                   |  41 ++--
>  tools/perf/builtin-kallsyms.c                 |  21 +-
>  tools/perf/builtin-kmem.c                     |   2 +-
>  tools/perf/builtin-kvm.c                      |   4 +-
>  tools/perf/builtin-kwork.c                    |   2 +-
>  tools/perf/builtin-lock.c                     |   4 +-
>  tools/perf/builtin-mem.c                      |   2 +-
>  tools/perf/builtin-record.c                   |  63 +++---
>  tools/perf/builtin-report.c                   |  27 ++-
>  tools/perf/builtin-sched.c                    |   8 +-
>  tools/perf/builtin-script.c                   |  18 +-
>  tools/perf/builtin-stat.c                     |  23 +--
>  tools/perf/builtin-timechart.c                |   2 +-
>  tools/perf/builtin-top.c                      |  58 ++++--
>  tools/perf/builtin-trace.c                    |  38 ++--
>  tools/perf/include/perf/perf_dlfilter.h       |   2 +-
>  tools/perf/perf.c                             |   3 -
>  tools/perf/tests/code-reading.c               |   6 +-
>  tools/perf/tests/dlfilter-test.c              |  51 ++---
>  tools/perf/tests/dwarf-unwind.c               |  10 +-
>  tools/perf/tests/hists_cumulate.c             |   8 +-
>  tools/perf/tests/hists_filter.c               |   8 +-
>  tools/perf/tests/hists_link.c                 |   8 +-
>  tools/perf/tests/hists_output.c               |  10 +-
>  tools/perf/tests/mmap-thread-lookup.c         |   6 +-
>  tools/perf/tests/pe-file-parsing.c            |   2 +-
>  tools/perf/tests/sample-parsing.c             |  14 ++
>  tools/perf/tests/sdt.c                        |   2 +-
>  tools/perf/tests/symbols.c                    |  12 +-
>  tools/perf/tests/topology.c                   |  39 ++--
>  tools/perf/ui/browser.h                       |   4 +-
>  tools/perf/ui/browsers/header.c               |   4 +-
>  tools/perf/ui/browsers/hists.c                |   2 +-
>  tools/perf/util/amd-sample-raw.c              |   2 +-
>  tools/perf/util/arm-spe.c                     |   2 +-
>  tools/perf/util/auxtrace.c                    |  13 +-
>  tools/perf/util/auxtrace.h                    |   6 +-
>  tools/perf/util/bpf-event.c                   |   2 +-
>  tools/perf/util/branch.c                      |   2 +-
>  tools/perf/util/build-id.c                    |  63 +++---
>  tools/perf/util/build-id.h                    |   8 +-
>  tools/perf/util/data-convert-bt.c             |  16 +-
>  tools/perf/util/data-convert-json.c           |  36 ++--
>  tools/perf/util/debuginfo.c                   |   2 +-
>  tools/perf/util/disasm.c                      |   2 +-
>  tools/perf/util/dlfilter.c                    |   2 +-
>  tools/perf/util/dso.c                         | 111 ++++++-----
>  tools/perf/util/dso.h                         |  75 ++++----
>  tools/perf/util/dsos.c                        |  20 +-
>  tools/perf/util/env.c                         |   3 +-
>  tools/perf/util/env.h                         |   2 -
>  tools/perf/util/event.c                       |   2 +-
>  tools/perf/util/event.h                       |   5 -
>  tools/perf/util/evlist.h                      |   2 +-
>  tools/perf/util/evsel.c                       |  29 ++-
>  tools/perf/util/evsel.h                       |   1 +
>  tools/perf/util/header.c                      | 182 ++++++++++--------
>  tools/perf/util/hist.c                        |   4 +-
>  tools/perf/util/hist.h                        |   3 +-
>  tools/perf/util/intel-tpebs.c                 |   4 +-
>  tools/perf/util/jitdump.c                     |  21 +-
>  tools/perf/util/machine.c                     |  42 ++--
>  tools/perf/util/machine.h                     |   4 +-
>  tools/perf/util/map.c                         |  15 +-
>  tools/perf/util/map.h                         |   5 +-
>  tools/perf/util/probe-event.c                 |   8 +-
>  tools/perf/util/probe-file.c                  |   4 +-
>  tools/perf/util/probe-finder.c                |   3 +-
>  tools/perf/util/s390-cpumsf.c                 |   2 +-
>  tools/perf/util/sample-raw.c                  |   7 +-
>  tools/perf/util/sample-raw.h                  |   2 +-
>  tools/perf/util/sample.h                      |   6 +-
>  .../scripting-engines/trace-event-python.c    |   7 +-
>  tools/perf/util/session.c                     |  20 +-
>  tools/perf/util/session.h                     |   9 +-
>  tools/perf/util/sort.c                        |  95 +++++----
>  tools/perf/util/sort.h                        |   5 +-
>  tools/perf/util/symbol-minimal.c              |   2 +-
>  tools/perf/util/symbol.c                      |   7 +-
>  tools/perf/util/symbol_conf.h                 |   2 +-
>  tools/perf/util/synthetic-events.c            |  54 ++++--
>  tools/perf/util/thread.c                      |   8 +-
>  tools/perf/util/thread.h                      |   2 +-
>  tools/perf/util/tool.c                        |   2 +-
>  98 files changed, 919 insertions(+), 894 deletions(-)
>  delete mode 100644 tools/perf/arch/powerpc/util/event.c
>  delete mode 100644 tools/perf/arch/x86/tests/sample-parsing.c
> 
> -- 
> 2.49.0.1204.g71687c7c1d-goog
> 

