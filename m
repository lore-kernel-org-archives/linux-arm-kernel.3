Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FD00FF8864
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Apr 2026 17:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p5jktYnXLVV3ufAgYuB6nR2y55Mog/bG7LgNxL64ue4=; b=rsK2xCPQ28QCswWtmWQGfbRgz3
	zIwlzFSX6sDmdhYqfsYQuLEdScyB9qp9OPPtlnSemCBTiy8BHh5arn2s/G//MBlkAffIQ+Gtmgx4+
	PoxmYGTAMaBG1dBrUcih7AzW7a2wAenLBgWtPzOV5S9YfcoI3ykYCFW6xjA1u9aEOx+HBbkPlGklV
	w/40IM4UQuXMnG6mm+gdQ/mbs3+5Ka+5em+9isMvi0CcHB+58P1XDyRTDc34ezH7yRv31Amylkpti
	Ud9R3W0IBqqPUZSISumuuZCqQ7fGLG0NCTazdrQnmM3uI5gSy0AU5GkNzCSCLd7ugHYny5gicaY7s
	SrAclacw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGh96-0000000EdRQ-2iYt;
	Sat, 25 Apr 2026 17:50:24 +0000
Received: from mail-dy1-x1349.google.com ([2607:f8b0:4864:20::1349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGh8T-0000000EchP-2a0I
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Apr 2026 17:49:53 +0000
Received: by mail-dy1-x1349.google.com with SMTP id 5a478bee46e88-2e60238adb1so21145738eec.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 25 Apr 2026 10:49:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777139384; x=1777744184; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=p5jktYnXLVV3ufAgYuB6nR2y55Mog/bG7LgNxL64ue4=;
        b=sAYAUpcpokWQ2P1b65tKKKUP9NvTZqNyZGZcR5wKqhvkFZMGGxMDJ8sgwM3HdM7oyG
         ggPdcazWwoUdlt1iqln0QMSkW3Uj0npXqvjgfIjCdH32vssNiLajKTcAYR0WtniYsSIc
         09qijwl4CCqmhvzIr40p9lerpwlBMU7fe/717ptv1MRjUJZYeZkyqIqZmQWIgywnBjex
         KuLBaMJ9Qf6q7bgN98w1uZNBurbvsWfczzwx194Z5h5UiLtjEVLDmxL0c+rVKZaAoKd+
         rwBlnXW480z1bYzPpg1O8BaLxrg7Px+I6uOtkqaxOuCS4EynjkweSjRIQcAvt9jtEXAS
         wB3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777139384; x=1777744184;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p5jktYnXLVV3ufAgYuB6nR2y55Mog/bG7LgNxL64ue4=;
        b=pSl8ueGUDkKtg23zU0s28vHkPyQ/QO9eW+08mHuLBijsT+boEK2/02lTH9zqNWIh3g
         BNvX/HI11GgjxJTaQAEu9soCHRmQiFljnJx+zGyppFRLXw9gbYnTd4X4JtkNha69t6/p
         CYB0PZyI2TDncFaKIr+UbI4AMwHOVsOubRvSYChxDHn1DC4L0Qi8cwxlUobmsTM1K1VX
         7zvktFoR1Ly2oc2a7Vtv6C5k0X4s5avwL4G7BusxyfdJ2CpcPcvTzgFIVRel4mC/fghd
         pkeyIJneZdQ1EbNAOqMCZHOluo/ROae3FUrLnifBwV+1zfydmvWodkRpAGRNenXBFkPD
         YBOw==
X-Forwarded-Encrypted: i=1; AFNElJ/l8ypDOsWMk5KxqR7GoCqAuaBLCmUkAcq2NEUkNyQs0Sa4KN4wAtEzfCGxxZQhEev3pA0MCGecwI+8AMpjx0f9@lists.infradead.org
X-Gm-Message-State: AOJu0YxUVrUFMZyPvjB7UD17tc1Outk5tFFLq4KRx1URgl1gKbnETLxQ
	GDJQHpQ4TnFyRQxmmgCRQBu9pjy3e+tR/r2js5NJGr0WO7YIUnC3cmZlbXF2H8onoH0z/nuxM3C
	tZtHNKtpoZg==
X-Received: from dycak15.prod.google.com ([2002:a05:7301:1c0f:b0:2e7:56e6:76dc])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:f14d:b0:2ea:b7a9:580d
 with SMTP id 5a478bee46e88-2eab7a9593emr7854897eec.9.1777139384097; Sat, 25
 Apr 2026 10:49:44 -0700 (PDT)
Date: Sat, 25 Apr 2026 10:48:20 -0700
In-Reply-To: <20260425174858.3922152-1-irogers@google.com>
Mime-Version: 1.0
References: <20260424164721.2229025-1-irogers@google.com> <20260425174858.3922152-1-irogers@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260425174858.3922152-23-irogers@google.com>
Subject: [PATCH v6 22/59] perf python: Add perf.pyi stubs file
From: Ian Rogers <irogers@google.com>
To: acme@kernel.org, adrian.hunter@intel.com, james.clark@linaro.org, 
	leo.yan@linux.dev, namhyung@kernel.org, tmricht@linux.ibm.com
Cc: alice.mei.rogers@gmail.com, dapeng1.mi@linux.intel.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, mingo@redhat.com, peterz@infradead.org, 
	Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260425_104945_735266_E27C85EF 
X-CRM114-Status: GOOD (  20.39  )
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

Add Python type stubs for the perf module to improve IDE support and
static analysis.  Includes docstrings for classes, methods, and
constants derived from C source and JSON definitions.

Assisted-by: Gemini:gemini-3.1-pro-preview
Signed-off-by: Ian Rogers <irogers@google.com>
---
v2:

1. Added Missing Module Functions: Added parse_metrics and
   pmus. Renamed metrics to parse_metrics to match python.c .

2. Added Constructors: Added __init__ methods for data , evsel , and
   evlist with their appropriate arguments.

3. Removed sample_comm : Removed it from sample_event since it is not
   exported in python.c .

4. Keyword Handling in branch_entry : I used from_ip and to_ip in the
   stubs to match the rename I did in python.c (in turn 145) to avoid
   the Python from keyword conflict.

5. Added Missing Event Classes: Added mmap_event , lost_event ,
   comm_event , task_event , throttle_event , read_event , and
   switch_event .

6. Added Missing evlist Methods: Added get_pollfd and add .

7. Updated Return Types: Changed process_events to return int .

v6:
- Updated `perf.pyi` to use `find_thread` and `elf_machine`.
---
 tools/perf/python/perf.pyi | 581 +++++++++++++++++++++++++++++++++++++
 1 file changed, 581 insertions(+)
 create mode 100644 tools/perf/python/perf.pyi

diff --git a/tools/perf/python/perf.pyi b/tools/perf/python/perf.pyi
new file mode 100644
index 000000000000..91e19704e595
--- /dev/null
+++ b/tools/perf/python/perf.pyi
@@ -0,0 +1,581 @@
+"""Type stubs for the perf Python module."""
+from typing import Callable, Dict, List, Optional, Any, Iterator
+
+def config_get(name: str) -> Optional[str]:
+    """Get a configuration value from perf config.
+
+    Args:
+        name: The configuration variable name (e.g., 'colors.top').
+
+    Returns:
+        The configuration value as a string, or None if not set.
+    """
+    ...
+
+def metrics() -> List[Dict[str, str]]:
+    """Get a list of available metrics.
+
+    Returns:
+        A list of dictionaries, each describing a metric.
+    """
+    ...
+
+def syscall_name(sc_id: int, *, elf_machine: Optional[int] = None) -> str:
+    """Convert a syscall number to its name.
+
+    Args:
+        sc_id: The syscall number.
+        elf_machine: Optional ELF machine type.
+
+    Returns:
+        The name of the syscall.
+    """
+    ...
+
+def syscall_id(name: str, *, elf_machine: Optional[int] = None) -> int:
+    """Convert a syscall name to its number.
+
+    Args:
+        name: The syscall name.
+        elf_machine: Optional ELF machine type.
+
+    Returns:
+        The number of the syscall.
+    """
+    ...
+
+def parse_events(
+    event_string: str,
+    cpus: Optional[cpu_map] = None,
+    threads: Optional[Any] = None
+) -> 'evlist':
+    """Parse an event string and return an evlist.
+
+    Args:
+        event_string: The event string (e.g., 'cycles,instructions').
+        cpus: Optional CPU map to bind events to.
+        threads: Optional thread map to bind events to.
+
+    Returns:
+        An evlist containing the parsed events.
+    """
+    ...
+
+def parse_metrics(metrics_string: str) -> 'evlist':
+    """Parse a string of metrics or metric groups and return an evlist."""
+    ...
+
+def pmus() -> Iterator[Any]:
+    """Returns a sequence of pmus."""
+    ...
+
+class data:
+    """Represents a perf data file."""
+    def __init__(self, path: str = ..., fd: int = ...) -> None: ...
+
+class thread:
+    """Represents a thread in the system."""
+    def comm(self) -> str:
+        """Get the command name of the thread."""
+        ...
+
+class counts_values:
+    """Raw counter values."""
+    val: int
+    ena: int
+    run: int
+
+class thread_map:
+    """Map of threads being monitored."""
+    def __init__(self, pid: int = -1, tid: int = -1) -> None:
+        """Initialize a thread map.
+
+        Args:
+            pid: Process ID to monitor (-1 for all).
+            tid: Thread ID to monitor (-1 for all).
+        """
+        ...
+    def __len__(self) -> int: ...
+    def __getitem__(self, index: int) -> int: ...
+    def __iter__(self) -> Iterator[int]: ...
+
+class evsel:
+    """Event selector, represents a single event being monitored."""
+    def __init__(
+        self,
+        type: int = ...,
+        config: int = ...,
+        sample_freq: int = ...,
+        sample_period: int = ...,
+        sample_type: int = ...,
+        read_format: int = ...,
+        disabled: bool = ...,
+        inherit: bool = ...,
+        pinned: bool = ...,
+        exclusive: bool = ...,
+        exclude_user: bool = ...,
+        exclude_kernel: bool = ...,
+        exclude_hv: bool = ...,
+        exclude_idle: bool = ...,
+        mmap: bool = ...,
+        context_switch: bool = ...,
+        comm: bool = ...,
+        freq: bool = ...,
+        idx: int = ...,
+    ) -> None: ...
+    def __str__(self) -> str:
+        """Return string representation of the event."""
+        ...
+    def open(self) -> None:
+        """Open the event selector file descriptor table."""
+        ...
+    def read(self, cpu: int, thread: int) -> counts_values:
+        """Read counter values for a specific CPU and thread."""
+        ...
+    ids: List[int]
+    def cpus(self) -> cpu_map:
+        """Get CPU map for this event."""
+        ...
+    def threads(self) -> thread_map:
+        """Get thread map for this event."""
+        ...
+
+
+class sample_event:
+    """Represents a sample event from perf."""
+    evsel: evsel
+    sample_cpu: int
+    sample_time: int
+    sample_pid: int
+    type: int
+    brstack: Optional['branch_stack']
+    callchain: Optional['callchain']
+    def __getattr__(self, name: str) -> Any: ...
+
+class mmap_event:
+    """Represents a mmap event from perf."""
+    type: int
+    pid: int
+    tid: int
+    addr: int
+    len: int
+    pgoff: int
+    filename: str
+
+class lost_event:
+    """Represents a lost events record."""
+    type: int
+    id: int
+    lost: int
+
+class comm_event:
+    """Represents a COMM record."""
+    type: int
+    pid: int
+    tid: int
+    comm: str
+
+class task_event:
+    """Represents an EXIT or FORK record."""
+    type: int
+    pid: int
+    ppid: int
+    tid: int
+    ptid: int
+    time: int
+
+class throttle_event:
+    """Represents a THROTTLE or UNTHROTTLE record."""
+    type: int
+    time: int
+    id: int
+    stream_id: int
+
+class read_event:
+    """Represents a READ record."""
+    type: int
+    pid: int
+    tid: int
+    value: int
+
+class switch_event:
+    """Represents a SWITCH or SWITCH_CPU_WIDE record."""
+    type: int
+
+class branch_entry:
+    """Represents a branch entry in the branch stack.
+
+    Attributes:
+        from_ip: Source address of the branch (corresponds to 'from' keyword in C).
+        to_ip: Destination address of the branch.
+        mispred: True if the branch was mispredicted.
+        predicted: True if the branch was predicted.
+        in_tx: True if the branch was in a transaction.
+        abort: True if the branch was an abort.
+        cycles: Number of cycles since the last branch.
+        type: Type of branch.
+    """
+    from_ip: int
+    to_ip: int
+    mispred: bool
+    predicted: bool
+    in_tx: bool
+    abort: bool
+    cycles: int
+    type: int
+
+class branch_stack:
+    """Iterator over branch entries in the branch stack."""
+    def __iter__(self) -> Iterator[branch_entry]: ...
+    def __next__(self) -> branch_entry: ...
+
+class callchain_node:
+    """Represents a frame in the callchain."""
+    ip: int
+    sym: Optional[Any]
+    map: Optional[Any]
+
+class callchain:
+    """Iterator over callchain frames."""
+    def __iter__(self) -> Iterator[callchain_node]: ...
+    def __next__(self) -> callchain_node: ...
+
+class stat_event:
+    """Represents a stat event from perf."""
+    type: int
+    id: int
+    cpu: int
+    thread: int
+    val: int
+    ena: int
+    run: int
+
+class stat_round_event:
+    """Represents a stat round event from perf."""
+    type: int
+    time: int
+
+class cpu_map:
+    """Map of CPUs being monitored."""
+    def __init__(self, cpustr: Optional[str] = None) -> None: ...
+    def __len__(self) -> int: ...
+    def __getitem__(self, index: int) -> int: ...
+    def __iter__(self) -> Iterator[int]: ...
+
+
+class evlist:
+    def __init__(self, cpus: cpu_map, threads: thread_map) -> None: ...
+    def open(self) -> None:
+        """Open the events in the list."""
+        ...
+    def close(self) -> None:
+        """Close the events in the list."""
+        ...
+    def mmap(self) -> None:
+        """Memory map the event buffers."""
+        ...
+    def poll(self, timeout: int) -> int:
+        """Poll for events.
+
+        Args:
+            timeout: Timeout in milliseconds.
+
+        Returns:
+            Number of events ready.
+        """
+        ...
+    def read_on_cpu(self, cpu: int) -> Optional[sample_event]:
+        """Read a sample event from a specific CPU.
+
+        Args:
+            cpu: The CPU number.
+
+        Returns:
+            A sample_event if available, or None.
+        """
+        ...
+    def all_cpus(self) -> cpu_map:
+        """Get a cpu_map of all CPUs in the system."""
+        ...
+    def metrics(self) -> List[str]:
+        """Get a list of metric names within the evlist."""
+        ...
+    def compute_metric(self, metric: str, cpu: int, thread: int) -> float:
+        """Compute metric for given name, cpu and thread.
+
+        Args:
+            metric: The metric name.
+            cpu: The CPU number.
+            thread: The thread ID.
+
+        Returns:
+            The computed metric value.
+        """
+        ...
+    def config(self) -> None:
+        """Configure the events in the list."""
+        ...
+    def disable(self) -> None:
+        """Disable all events in the list."""
+        ...
+    def enable(self) -> None:
+        """Enable all events in the list."""
+        ...
+    def get_pollfd(self) -> List[int]:
+        """Get a list of file descriptors for polling."""
+        ...
+    def add(self, evsel: evsel) -> int:
+        """Add an event to the list."""
+        ...
+    def __iter__(self) -> Iterator[evsel]:
+        """Iterate over the events (evsel) in the list."""
+        ...
+
+
+class session:
+    def __init__(
+        self,
+        data: data,
+        sample: Optional[Callable[[sample_event], None]] = None,
+        stat: Optional[Callable[[Any, Optional[str]], None]] = None
+    ) -> None:
+        """Initialize a perf session.
+
+        Args:
+            data: The perf data file to read.
+            sample: Callback for sample events.
+            stat: Callback for stat events.
+        """
+        ...
+    def process_events(self) -> int:
+        """Process all events in the session."""
+        ...
+    def find_thread(self, pid: int) -> thread:
+        """Returns the thread associated with a pid."""
+        ...
+
+# Event Types
+TYPE_HARDWARE: int
+"""Hardware event."""
+
+TYPE_SOFTWARE: int
+"""Software event."""
+
+TYPE_TRACEPOINT: int
+"""Tracepoint event."""
+
+TYPE_HW_CACHE: int
+"""Hardware cache event."""
+
+TYPE_RAW: int
+"""Raw hardware event."""
+
+TYPE_BREAKPOINT: int
+"""Breakpoint event."""
+
+
+# Hardware Counters
+COUNT_HW_CPU_CYCLES: int
+"""Total cycles. Be wary of what happens during CPU frequency scaling."""
+
+COUNT_HW_INSTRUCTIONS: int
+"""Retired instructions. Be careful, these can be affected by various issues,
+most notably hardware interrupt counts."""
+
+COUNT_HW_CACHE_REFERENCES: int
+"""Cache accesses. Usually this indicates Last Level Cache accesses but this
+may vary depending on your CPU."""
+
+COUNT_HW_CACHE_MISSES: int
+"""Cache misses. Usually this indicates Last Level Cache misses."""
+
+COUNT_HW_BRANCH_INSTRUCTIONS: int
+"""Retired branch instructions."""
+
+COUNT_HW_BRANCH_MISSES: int
+"""Mispredicted branch instructions."""
+
+COUNT_HW_BUS_CYCLES: int
+"""Bus cycles, which can be different from total cycles."""
+
+COUNT_HW_STALLED_CYCLES_FRONTEND: int
+"""Stalled cycles during issue [This event is an alias of idle-cycles-frontend]."""
+
+COUNT_HW_STALLED_CYCLES_BACKEND: int
+"""Stalled cycles during retirement [This event is an alias of idle-cycles-backend]."""
+
+COUNT_HW_REF_CPU_CYCLES: int
+"""Total cycles; not affected by CPU frequency scaling."""
+
+
+# Cache Counters
+COUNT_HW_CACHE_L1D: int
+"""Level 1 data cache."""
+
+COUNT_HW_CACHE_L1I: int
+"""Level 1 instruction cache."""
+
+COUNT_HW_CACHE_LL: int
+"""Last Level Cache."""
+
+COUNT_HW_CACHE_DTLB: int
+"""Data TLB."""
+
+COUNT_HW_CACHE_ITLB: int
+"""Instruction TLB."""
+
+COUNT_HW_CACHE_BPU: int
+"""Branch Processing Unit."""
+
+COUNT_HW_CACHE_OP_READ: int
+"""Read accesses."""
+
+COUNT_HW_CACHE_OP_WRITE: int
+"""Write accesses."""
+
+COUNT_HW_CACHE_OP_PREFETCH: int
+"""Prefetch accesses."""
+
+COUNT_HW_CACHE_RESULT_ACCESS: int
+"""Accesses."""
+
+COUNT_HW_CACHE_RESULT_MISS: int
+"""Misses."""
+
+
+# Software Counters
+COUNT_SW_CPU_CLOCK: int
+"""CPU clock event."""
+
+COUNT_SW_TASK_CLOCK: int
+"""Task clock event."""
+
+COUNT_SW_PAGE_FAULTS: int
+"""Page faults."""
+
+COUNT_SW_CONTEXT_SWITCHES: int
+"""Context switches."""
+
+COUNT_SW_CPU_MIGRATIONS: int
+"""CPU migrations."""
+
+COUNT_SW_PAGE_FAULTS_MIN: int
+"""Minor page faults."""
+
+COUNT_SW_PAGE_FAULTS_MAJ: int
+"""Major page faults."""
+
+COUNT_SW_ALIGNMENT_FAULTS: int
+"""Alignment faults."""
+
+COUNT_SW_EMULATION_FAULTS: int
+"""Emulation faults."""
+
+COUNT_SW_DUMMY: int
+"""Dummy event."""
+
+
+# Sample Fields
+SAMPLE_IP: int
+"""Instruction pointer."""
+
+SAMPLE_TID: int
+"""Process and thread ID."""
+
+SAMPLE_TIME: int
+"""Timestamp."""
+
+SAMPLE_ADDR: int
+"""Sampled address."""
+
+SAMPLE_READ: int
+"""Read barcode."""
+
+SAMPLE_CALLCHAIN: int
+"""Call chain."""
+
+SAMPLE_ID: int
+"""Unique ID."""
+
+SAMPLE_CPU: int
+"""CPU number."""
+
+SAMPLE_PERIOD: int
+"""Sample period."""
+
+SAMPLE_STREAM_ID: int
+"""Stream ID."""
+
+SAMPLE_RAW: int
+"""Raw sample."""
+
+
+# Format Fields
+FORMAT_TOTAL_TIME_ENABLED: int
+"""Total time enabled."""
+
+FORMAT_TOTAL_TIME_RUNNING: int
+"""Total time running."""
+
+FORMAT_ID: int
+"""Event ID."""
+
+FORMAT_GROUP: int
+"""Event group."""
+
+
+# Record Types
+RECORD_MMAP: int
+"""MMAP record. Contains header, pid, tid, addr, len, pgoff, filename, and sample_id."""
+
+RECORD_LOST: int
+"""Lost events record. Contains header, id, lost count, and sample_id."""
+
+RECORD_COMM: int
+"""COMM record. Contains header, pid, tid, comm, and sample_id."""
+
+RECORD_EXIT: int
+"""EXIT record. Contains header, pid, ppid, tid, ptid, time, and sample_id."""
+
+RECORD_THROTTLE: int
+"""THROTTLE record. Contains header, time, id, stream_id, and sample_id."""
+
+RECORD_UNTHROTTLE: int
+"""UNTHROTTLE record. Contains header, time, id, stream_id, and sample_id."""
+
+RECORD_FORK: int
+"""FORK record. Contains header, pid, ppid, tid, ptid, time, and sample_id."""
+
+RECORD_READ: int
+"""READ record. Contains header, and read values."""
+
+RECORD_SAMPLE: int
+"""SAMPLE record. Contains header, and sample data requested by sample_type."""
+
+RECORD_MMAP2: int
+"""MMAP2 record. Contains header, pid, tid, addr, len, pgoff, maj, min, ino,
+ino_generation, prot, flags, filename, and sample_id."""
+
+RECORD_AUX: int
+"""AUX record. Contains header, aux_offset, aux_size, flags, and sample_id."""
+
+RECORD_ITRACE_START: int
+"""ITRACE_START record. Contains header, pid, tid, and sample_id."""
+
+RECORD_LOST_SAMPLES: int
+"""LOST_SAMPLES record. Contains header, lost count, and sample_id."""
+
+RECORD_SWITCH: int
+"""SWITCH record. Contains header, and sample_id."""
+
+RECORD_SWITCH_CPU_WIDE: int
+"""SWITCH_CPU_WIDE record. Contains header, and sample_id."""
+
+RECORD_STAT: int
+"""STAT record."""
+
+RECORD_STAT_ROUND: int
+"""STAT_ROUND record."""
+
+RECORD_MISC_SWITCH_OUT: int
+"""MISC_SWITCH_OUT record."""
-- 
2.54.0.545.g6539524ca2-goog


