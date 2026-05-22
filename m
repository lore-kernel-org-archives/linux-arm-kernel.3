Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE61BCD4F3D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 22:04:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z/+HEhIM0CuAiUIGSBtN5Di7oH577MecmGkJLn3Zk00=; b=rvVKSAWxcnKxWvKLyXYk26iTcN
	LtgmwP06HZzAv7WtHtKGC0NGKGUIXWLb3FntgHJvp/CDt88v81uOOdeTuQQWoKpK0D+a1g7kmchzA
	WLXjKGcjbcHJ1QB7zJ3EqM43tW1iwbQcxzu0Ri8mlRQ8ElO+PA3Zo7tbrGRffVdXb8jufW2WqdTKY
	zjJ5wfgR3mUHgj4ZcvX9gJQ3jvhW/ebR++XACzHgdK/z4xOX8eoCJsJZ5hPKBghxRg0A+iP7fq574
	ZOU5pC5lcLVeuhqK+o6n/jbSyRSWweDfOH+81XJ1GmWQJO+hxU2SJ9jJttDrh73bdAqm5UMvzs+A+
	I+WvRBPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQXz2-0000000C2TU-2GVO;
	Fri, 22 May 2026 22:04:44 +0000
Received: from mail-dy1-x1349.google.com ([2607:f8b0:4864:20::1349])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQXyz-0000000C2SB-17bJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 22:04:43 +0000
Received: by mail-dy1-x1349.google.com with SMTP id 5a478bee46e88-2fded513994so520354eec.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 15:04:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779487480; x=1780092280; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=z/+HEhIM0CuAiUIGSBtN5Di7oH577MecmGkJLn3Zk00=;
        b=EGs3a5CDdNvQ6eXheCO61IY2mTcpKHeGDyAAUCpUTGl7Vt9k41TNk/Bg2IkDP7T0Ws
         ufZEPojOl4bYJwPHgopOskaMEwZ8s5HebVsuW1xWM1wmM4iHVcDpAqcFBb1trwpGCVJb
         mUsLIT2H4v3pitzDmuAS9i5ZFmZEOx6jLedCGrK4wpUwyDENMN51gMIrLL5BNZqYyv8Z
         1tshnVprl73LXRtIr4XscevtpGnpjEDZWhuhEQJiessemKMhNmcJpj6fLtfoNhrqzGaU
         EaCY4VcIX7nIv2ChIWzGvpBwARCF9cavx6N1YBA2NR7SWGJi5J+AYHD7TtYKF04KpBqb
         7v1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779487480; x=1780092280;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z/+HEhIM0CuAiUIGSBtN5Di7oH577MecmGkJLn3Zk00=;
        b=RhSIUswLDWSM6nloBpED56FJliB94cbDKk6bmbqVVHc66YdnFpc6Ob5ZFBGSBxIpFr
         +SzKScgOrb/CBUats1b2fx9euNbjs4535dRGczhKG0UpSBOUp5+NBgPVkbNsOyUyRVA3
         P0cJcjHOB3g72RzsRnAzdAPeB7c2Ih0whvbokDdhlUriih2ugAzfgL0EkiiJG2j93XO/
         Blvv8V2brRB6cdQPYxiNd1XANrpt290aae9O28XuvMf+CastbohVKpfsCweCI9j+EqIC
         HYvfDLPLAtkmk0HyibWv6+jyOoOzAWw6VE8Qf8Ppis/xC3mehPqI9OiIJO4CfXNVn5yr
         pqcQ==
X-Forwarded-Encrypted: i=1; AFNElJ+o0FKYimlsK68louEXRgR1RJFY2O6PNxmq47l2rvbQEo/LucnkRR8EWp6h7JyvtxeUYHjbHnVqIG7xNtnLWoZQ@lists.infradead.org
X-Gm-Message-State: AOJu0YyYPvv5JuLeBMyE7KtEpHCR0E+oqaeCB0wJq+xMLIjTmawzJXJy
	cm1UNcipweENanNWc2GrRdcx92p/GqZDcEH+YM0fgltgomG0vSL+Z1I95sWQpACPnqq6ObX8jXL
	xf5MTjzedgg==
X-Received: from dybgh3.prod.google.com ([2002:a05:7301:3:b0:303:521c:29a5])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7301:4918:b0:2e6:e868:4f38
 with SMTP id 5a478bee46e88-30449024c7bmr2594440eec.3.1779487479475; Fri, 22
 May 2026 15:04:39 -0700 (PDT)
Date: Fri, 22 May 2026 15:04:11 -0700
In-Reply-To: <20260428071903.1886173-1-irogers@google.com>
Mime-Version: 1.0
References: <20260428071903.1886173-1-irogers@google.com>
X-Mailer: git-send-email 2.54.0.794.g4f17f83d09-goog
Message-ID: <20260522220435.2378363-1-irogers@google.com>
Subject: [PATCH v9 00/23] perf python: Modernize and extend Python API (Phase 1)
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, namhyung@kernel.org
Cc: adrian.hunter@intel.com, alice.mei.rogers@gmail.com, 
	dapeng1.mi@linux.intel.com, james.clark@linaro.org, leo.yan@linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, mingo@redhat.com, peterz@infradead.org, 
	tmricht@linux.ibm.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_150441_343189_E4F15B9B 
X-CRM114-Status: GOOD (  22.14  )
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

The perf script command has long supported running Python and Perl scripts by
embedding libpython and libperl. This approach has several drawbacks:
 - overhead by creating Python dictionaries for every event (whether used or
   not),
 - complex build dependencies on specific Python/Perl versions,
 - complications with threading due to perf being the interpreter,
 - no clear way to run standalone scripts like ilist.py.

This series takes a different approach with some initial implementation posted
as an RFC last October:
https://lore.kernel.org/linux-perf-users/20251029053413.355154-1-irogers@google.com/
with the motivation coming up on the mailing list earlier:
https://lore.kernel.org/lkml/CAP-5=fWDqE8SYfOLZkg_0=4Ayx6E7O+h7uUp4NDeCFkiN4b7-w@mail.gmail.com/

The ultimate goal is to remove the embedded libpython and libperl support from
perf entirely, expanding the existing perf Python module to provide full access
to perf data files and events, allowing scripts to be run as standalone Python
applications.

To make the review process more manageable, the original 58-patch series has
been split. This v9 series represents "Phase 1: API & Infrastructure" (23 patches).
It contains:
1. Missed explicit dependency cleanups and header sorting.
2. Crucial core safety infrastructure (reference counting for evlist/evsel)
   to support safe lifecycle management in garbage-collected Python.
3. The core Python API extensions (session wrappers, perf_data wrappers,
   sample accessors, stubs, and LiveSession helper).

The subsequent "Phase 2" series will contain the actual porting of all
existing Python/Perl scripts to the new API (which yields up to 35x speedups
as demonstrated previously) and the final removal of embedded interpreters.

---
v9 Changes
----------
- This series is now split, containing only the first 23 patches of the
  previous 58-patch series. This "Phase 1: API & Infrastructure" set focuses
  on modernizing and extending the Python API and adding crucial safety
  infrastructure (reference counting). The script porting and legacy
  interpreter removal will be sent in a subsequent Phase 2.
- Fixed Type Confusion in `pyrf_evlist__init`: Added strict type validation
  to CPU and Thread map arguments (using O!O!) to prevent crashes from unsafe
  casts.
- Fixed Infinite Loop in `LiveSession.run`: Added a break statement in the
  exception block of the event reading loop to prevent 100% CPU spinning on
  persistent OS errors (like mmap read init failures).
- Fixed Inconsistent Exception Handling in Session Callbacks:
    - Removed the swallowing `PyErr_Print()` call from `pyrf_session_tool__stat`
      to preserve exceptions.
    - Updated `pyrf_session_tool__stat_round` to check the callback return value
      and return -1 on failure, aborting the event loop and propagating the
      exception cleanly.
- Fixed Uninitialized State in `pyrf_session__new`: Added explicit
  `psession->pdata = NULL` initialization immediately after allocation to prevent
  potential crashes in `tp_dealloc` on early failures.

v8 Changes
----------
- Make schedstat and itrace=L fixes separate patches:
https://lore.kernel.org/lkml/20260428070328.1880314-1-irogers@google.com/
https://lore.kernel.org/lkml/20260428070811.1883202-1-irogers@google.com/
- Fixed Heap Out-Of-Bounds / Uninitialized Memory in `pyrf_event__new`:
  Use `/*all=*/true` in `perf_sample__init` to prevent garbage memory in
  sample structures.
- Fixed Type Confusion in `pyrf_evlist__add`: Added strict `O!` type
  validation to avoid unsafe casts when adding evsels to an evlist.
- Exposed Thread Identifiers: Added `pid`, `tid`, `ppid`, and `cpu`
  attributes to the Python `perf.thread` type to allow thread identification.
- Fixed Process Resolution: Wrapped thread resolution in `compaction-times.py`,
  `check-perf-trace.py`, and `task-analyzer.py` in `try-except` blocks to
  safely handle untracked PIDs instead of raising uncaught `TypeError` crashes.
- Fixed Potential Data Loss in `futex-contention.py`: Updated process
  resolution in `handle_start` to fall back to `'unknown'` on lookup errors,
  ensuring events are always tracked.
- Synchronized Type Stubs File: Added the `mmap2_event` class and new `evsel`
  and `thread` attributes to `perf.pyi`.

v7 Changes
----------
- Fixed heap out-of-bounds in `pyrf_event__new` by adding comprehensive
  size checks for all event types.
- Fixed undefined symbol `syscalltbl__id` when building without
  libtraceevent by making `syscalltbl.o` unconditional in `Build`.
- Fixed several issues in `python.c`:
    - Handled NULL return from `thread__comm_str` in `pyrf_thread__comm`.
    - Avoided swallowing exceptions in module initialization.
    - Added custom `tp_new` methods for `evlist`, `evsel`, and `data` types
      to zero-initialize pointers and avoid crashes on re-initialization.
- Fixed lower priority review comments:
    - Avoided permanent iterator exhaustion on `brstack` in
      `perf_brstack_max.py` by converting it to a list.
    - Removed dead code (unused `self.unhandled` dictionary) in
      `failed-syscalls-by-pid.py`.

v6 Changes
----------
- Refactored `pyrf_event__new` to take `evsel` and `session` arguments,
  and use dynamic allocation based on the actual event size to improve
  memory safety and efficiency.
- Moved callchain and branch stack resolution logic from
  `pyrf_session_tool__sample` into `pyrf_event__new`, centralizing
  initialization.
- Added an optional keyword-only `elf_machine` argument to `syscall_name`
  and `syscall_id` functions to allow specifying non-host architectures,
  defaulting to `EM_HOST`.
- Renamed `process` method to `find_thread` in the Python API and C
  implementation for better intention-revealing naming.
- Fixed a terminal injection vulnerability in `flamegraph.py` by not
  printing unverified downloaded content in the prompt.
- Fixed CWD exposure and symlink attack risks in `gecko.py` by using a
  secure temporary directory for the HTTP server.
- Fixed a severe performance issue in `event_analyzing_sample.py` by
  removing SQLite autocommit mode and batching commits.
- Fixed `AttributeError` crashes in `rw-by-file.py` and `rw-by-pid.py` by
  correctly extracting event names.
- Fixed man page formatting issues in `perf-script-python.txt` by using
  indented code blocks.
- Updated `perf.pyi` stubs file to reflect all API changes.
- Verified all commit messages with `checkpatch.pl` and ensured lines are
  wrapped appropriately.
- Fixed segmentation faults in `perf sched stats` in diff mode.

v5 Changes
----------
Resending due to partial send of v4 due to a quota limit.

v4 Changes
----------
1. Git Fixup Cleanups
- Squashed the lingering `fixup!` commit remaining from the previous session back
  into `perf check-perf-trace: Port check-perf-trace to use python module`.

v3 Changes
----------
1. Memory Safety & Reference Counting Fixes
- Stored transient mmap event data inside the Python object's permanent
  `pevent->event` and invoked `evsel__parse_sample()` to safely point
  attributes into it, resolving Use-After-Free vulnerabilities.
- Nullified `sample->evsel` after calling `evsel__put()` in
  `perf_sample__exit()` to protect against potential refcount double-put
  crashes in error paths.
- Reordered operations inside `evlist__remove()` to invoke
  `perf_evlist__remove()` before reference release.
- Patched an `evsel` reference leak inside `evlist__deliver_deferred_callchain()`.

2. Sashiko AI Review Cleanups
- Corrected the broken event name equality check in `gecko.py` to search
  for a substring match within the parsed event string.
- Fixed a latent `AttributeError` crash in `task-analyzer.py` by properly
  assigning the session instance.
- Safeguarded thread reporting in `check-perf-trace.py` by utilizing
  `sample_tid` instead of `sample_pid`, and wrapping the session thread
  resolution in a try-except block.

3. Omitted Minor Issues
- The minor review comments (such as permanent iterator exhaustion on
  `brstack`, or dead-code in `failed-syscalls-by-pid.py`) have been omitted
  because they do not affect correctness, lead to crashes, or require
  significant architectural rework.

v2 Changes
----------
1. String Match and Event Name Accuracy
- Replaced loose substring event matching across the script suite with exact
  matches or specific prefix constraints (syscalls:sys_exit_,
  evsel(skb:kfree_skb), etc.).
- Added getattr() safety checks to prevent script failures caused by
  unresolved attributes from older kernel traces.

2. OOM and Memory Protections
- Refactored netdev-times.py to compute and process network statistics
  chronologically on-the-fly, eliminating an unbounded in-memory list
  that caused Out-Of-Memory crashes on large files.
- Implemented threshold limits on intel-pt-events.py to cap memory allocation
  during event interleaving.
- Optimized export-to-sqlite.py to periodically commit database transactions
  (every 10,000 samples) to reduce temporary SQLite journal sizes.

3. Portability & Environment Independence
- Re-keyed internal tracking dictionaries in scripts like powerpc-hcalls.py to
  use thread PIDs instead of CPUs, ensuring correctness when threads migrate.
- Switched net_dropmonitor.py from host-specific /proc/kallsyms parsing to
  perf's built-in symbol resolution API. 
- Added the --iomem parameter to mem-phys-addr.py to support offline analysis
  of data collected on different architectures.

4. Standalone Scripting Improvements
- Patched builtin-script.c to ensure --input parameters are successfully passed
  down to standalone execution pipelines via execvp().
- Guarded against string buffer overflows during .py extension path resolving.

5. Code Cleanups
- Removed stale perl subdirectories from being detected by the TUI script
  browser.
- Ran the entire script suite through mypy and pylint to achieve strict static
  type checking and resolve unreferenced variables.

Ian Rogers (23):
  perf arch arm: Sort includes and add missed explicit dependencies
  perf arch x86: Sort includes and add missed explicit dependencies
  perf tests: Sort includes and add missed explicit dependencies
  perf script: Sort includes and add missed explicit dependencies
  perf util: Sort includes and add missed explicit dependencies
  perf python: Add missed explicit dependencies
  perf evsel/evlist: Avoid unnecessary #includes
  perf data: Add open flag
  perf evlist: Add reference count
  perf evsel: Add reference count
  perf evlist: Add reference count checking
  perf python: Use evsel in sample in pyrf_event
  perf python: Add wrapper for perf_data file abstraction
  perf python: Add python session abstraction wrapping perf's session
  perf python: Refactor and add accessors to sample event
  perf python: Add mmap2 event
  perf python: Add callchain support
  perf python: Extend API for stat events in python.c
  perf python: Expose brstack in sample event
  perf python: Add syscall name/id to convert syscall number and name
  perf python: Add config file access
  perf python: Add perf.pyi stubs file
  perf python: Add LiveSession helper

 tools/perf/arch/arm/util/cs-etm.c           |   36 +-
 tools/perf/arch/arm64/util/arm-spe.c        |    8 +-
 tools/perf/arch/arm64/util/hisi-ptt.c       |    2 +-
 tools/perf/arch/x86/tests/hybrid.c          |   22 +-
 tools/perf/arch/x86/tests/topdown.c         |    4 +-
 tools/perf/arch/x86/util/auxtrace.c         |    2 +-
 tools/perf/arch/x86/util/intel-bts.c        |   26 +-
 tools/perf/arch/x86/util/intel-pt.c         |   38 +-
 tools/perf/arch/x86/util/iostat.c           |    8 +-
 tools/perf/bench/evlist-open-close.c        |   29 +-
 tools/perf/builtin-annotate.c               |    2 +-
 tools/perf/builtin-ftrace.c                 |   14 +-
 tools/perf/builtin-inject.c                 |    4 +-
 tools/perf/builtin-kvm.c                    |   14 +-
 tools/perf/builtin-kwork.c                  |    8 +-
 tools/perf/builtin-lock.c                   |    2 +-
 tools/perf/builtin-record.c                 |   95 +-
 tools/perf/builtin-report.c                 |    6 +-
 tools/perf/builtin-sched.c                  |   26 +-
 tools/perf/builtin-script.c                 |  126 +-
 tools/perf/builtin-stat.c                   |   81 +-
 tools/perf/builtin-top.c                    |  104 +-
 tools/perf/builtin-trace.c                  |   60 +-
 tools/perf/python/perf.pyi                  |  605 +++++
 tools/perf/python/perf_live.py              |   53 +
 tools/perf/tests/backward-ring-buffer.c     |   26 +-
 tools/perf/tests/code-reading.c             |   14 +-
 tools/perf/tests/event-times.c              |    6 +-
 tools/perf/tests/event_update.c             |    4 +-
 tools/perf/tests/evsel-roundtrip-name.c     |    8 +-
 tools/perf/tests/evsel-tp-sched.c           |    4 +-
 tools/perf/tests/expand-cgroup.c            |   12 +-
 tools/perf/tests/hists_cumulate.c           |    2 +-
 tools/perf/tests/hists_filter.c             |    2 +-
 tools/perf/tests/hists_link.c               |    2 +-
 tools/perf/tests/hists_output.c             |    2 +-
 tools/perf/tests/hwmon_pmu.c                |   21 +-
 tools/perf/tests/keep-tracking.c            |   10 +-
 tools/perf/tests/mmap-basic.c               |   42 +-
 tools/perf/tests/openat-syscall-all-cpus.c  |    6 +-
 tools/perf/tests/openat-syscall-tp-fields.c |   26 +-
 tools/perf/tests/openat-syscall.c           |    6 +-
 tools/perf/tests/parse-events.c             |  139 +-
 tools/perf/tests/parse-metric.c             |    8 +-
 tools/perf/tests/parse-no-sample-id-all.c   |    2 +-
 tools/perf/tests/perf-record.c              |   38 +-
 tools/perf/tests/perf-time-to-tsc.c         |   12 +-
 tools/perf/tests/pfm.c                      |   12 +-
 tools/perf/tests/pmu-events.c               |   11 +-
 tools/perf/tests/pmu.c                      |    4 +-
 tools/perf/tests/sample-parsing.c           |   42 +-
 tools/perf/tests/sw-clock.c                 |   20 +-
 tools/perf/tests/switch-tracking.c          |   10 +-
 tools/perf/tests/task-exit.c                |   20 +-
 tools/perf/tests/time-utils-test.c          |   14 +-
 tools/perf/tests/tool_pmu.c                 |    7 +-
 tools/perf/tests/topology.c                 |    4 +-
 tools/perf/tests/uncore-event-sorting.c     |    2 +-
 tools/perf/ui/browsers/annotate.c           |    2 +-
 tools/perf/ui/browsers/hists.c              |   22 +-
 tools/perf/util/Build                       |    1 -
 tools/perf/util/amd-sample-raw.c            |    2 +-
 tools/perf/util/annotate-data.c             |    2 +-
 tools/perf/util/annotate.c                  |   10 +-
 tools/perf/util/auxtrace.c                  |   14 +-
 tools/perf/util/block-info.c                |    4 +-
 tools/perf/util/bpf_counter.c               |    2 +-
 tools/perf/util/bpf_counter_cgroup.c        |   10 +-
 tools/perf/util/bpf_ftrace.c                |    9 +-
 tools/perf/util/bpf_lock_contention.c       |   12 +-
 tools/perf/util/bpf_off_cpu.c               |   44 +-
 tools/perf/util/bpf_trace_augment.c         |    8 +-
 tools/perf/util/cgroup.c                    |   26 +-
 tools/perf/util/cs-etm.c                    |    5 +-
 tools/perf/util/data-convert-bt.c           |    2 +-
 tools/perf/util/data.c                      |   27 +-
 tools/perf/util/data.h                      |    4 +-
 tools/perf/util/evlist.c                    |  492 ++--
 tools/perf/util/evlist.h                    |  273 +-
 tools/perf/util/evsel.c                     |  109 +-
 tools/perf/util/evsel.h                     |   35 +-
 tools/perf/util/expr.c                      |    2 +-
 tools/perf/util/header.c                    |   51 +-
 tools/perf/util/header.h                    |    2 +-
 tools/perf/util/intel-tpebs.c               |    7 +-
 tools/perf/util/map.h                       |    9 +-
 tools/perf/util/metricgroup.c               |   12 +-
 tools/perf/util/parse-events.c              |   10 +-
 tools/perf/util/parse-events.y              |    2 +-
 tools/perf/util/perf_api_probe.c            |   20 +-
 tools/perf/util/pfm.c                       |    4 +-
 tools/perf/util/print-events.c              |    2 +-
 tools/perf/util/print_insn.h                |    5 +-
 tools/perf/util/python.c                    | 2496 ++++++++++++++++---
 tools/perf/util/record.c                    |   11 +-
 tools/perf/util/s390-sample-raw.c           |   19 +-
 tools/perf/util/sample-raw.c                |    4 +-
 tools/perf/util/sample.c                    |   17 +-
 tools/perf/util/session.c                   |   57 +-
 tools/perf/util/sideband_evlist.c           |   40 +-
 tools/perf/util/sort.c                      |    2 +-
 tools/perf/util/stat-display.c              |    6 +-
 tools/perf/util/stat-shadow.c               |   24 +-
 tools/perf/util/stat.c                      |   20 +-
 tools/perf/util/stream.c                    |    4 +-
 tools/perf/util/synthetic-events.c          |   11 +-
 tools/perf/util/time-utils.c                |   12 +-
 tools/perf/util/top.c                       |    4 +-
 108 files changed, 4320 insertions(+), 1561 deletions(-)
 create mode 100644 tools/perf/python/perf.pyi
 create mode 100755 tools/perf/python/perf_live.py

-- 
2.54.0.794.g4f17f83d09-goog


