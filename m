Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5E6EFF885C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Apr 2026 22:44:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cF1Joyi8qfkVdlOn+yMtqrXIVsPBBbn9slQYje9uqkM=; b=efLZKViaqPJcS84RMNZQicxRfE
	EUwayf72swre60K6ygAFMybMn6H80EfvCUznoPW+Fq73m5P3mrvpSLMGhxmUSIYBc2MuVvNY0gX40
	oAFTw3CCFTmoS/GxJ4lmHXRP+WLJ7GJJ8D6cs/VxVqe/W3O5vOwhQJrmolkdBQwZW3RUXoepUbU36
	frYf7J/1wpH/hl9NPcIlo4z7SnOHIFAkmHw4LEmO3tRtBq7YNw/x4RWpbmkPl298GQrVth4Ja3aqK
	GDh5YmISJEe9BIp38sgUoIUr5ivLwoyaqTIYwkRYPE4t5MgH0GDypaCrDAJ1kc6ILXZ38I3uLft4M
	A9w9ikzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGljP-0000000EvE2-0QBd;
	Sat, 25 Apr 2026 22:44:11 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGli0-0000000Etre-4BbD
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Apr 2026 22:43:01 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-2b7aba0af02so28812975ad.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 25 Apr 2026 15:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777156963; x=1777761763; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=cF1Joyi8qfkVdlOn+yMtqrXIVsPBBbn9slQYje9uqkM=;
        b=luv01L92LKaum0ddfsdHgeebqT6PQwkpjQLuyYEa/xI1PmJbL9VtJ0Qe+pusumAx8D
         pFvPWK3LEOmVSx2Kt6SexXWPEeOEcEPJ7KznQADuKLCk/M0KdOa+sWKj87EvQ6XTzAK9
         VFZeRaGOeL/0474cG7KlFqMg/+SB9hObTkiP3VQSPDhudyI4ita7GYoQkQ9tspOmFH5i
         scr7xw78BdNwk+98h3V4F88QFHScs+WamP4enNeqSr0TtRgfyBZLKolhj0Dg80YnUlcN
         +Gr84Tj0dWMcleWxh3pzaC/0FGZpcVWRzCDFvZSlESMvyRut9p4b9Ch9IpGOUrTyrgsh
         hong==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777156963; x=1777761763;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cF1Joyi8qfkVdlOn+yMtqrXIVsPBBbn9slQYje9uqkM=;
        b=aSYSSiJiO9Tzd5tui9e1Lia570Lmxw2n+B2xCUC9aLoL0+gK7F5DZPExjgiz7nsnlA
         QlD2DfhiUHeMOvYRagD/eGpu99zS8MF+/tHeeB2wiQ2YhHAZJMMnz5yy6Dp8YTgr02fk
         ZXTiFn08P5CoiSq5v4nS92HQ+7Jv/WZW9Xh6zoUlzE7StSdLnT6/h6xoMTvqumm1QH5d
         pTrtffaloeaOtgeuwbKfXQ02B+znb4zVOJuf+tpD5ozfvx/j5H4IufztFRXhMRfQCzrj
         JrWP7ab2WZjAHwBInKr3qyZldB7X9a2vXkYI8ieBxMC69870vVKPJ5NwLSvSe4iY41/k
         UDxw==
X-Forwarded-Encrypted: i=1; AFNElJ8ISEooqdTHQJLMlSxuzlb5ORXXnm94jAeJ56sSYzODvoM8gIGRzApWdTXBDAwKUBPKtwmeP9EbJH1MIMmm8QQs@lists.infradead.org
X-Gm-Message-State: AOJu0YwkVxsUKQzPYUEGLOOO81pjtF0IJ6e4Vh25qtyEqIdIvl6vGbBF
	qHmh5Rm0o0K75vWspNJBFchSj52c9NeNCPV6m9aGsoMWRVwzgs1OvLk9GIoPfYjfuU0ogmD12PT
	t6PkNwDz5pg==
X-Received: from pgcm27.prod.google.com ([2002:a63:711b:0:b0:c79:7757:4178])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:72a4:b0:3a2:d79c:416c
 with SMTP id adf61e73a8af0-3a2d79c4401mr29762954637.32.1777156962934; Sat, 25
 Apr 2026 15:42:42 -0700 (PDT)
Date: Sat, 25 Apr 2026 15:41:00 -0700
In-Reply-To: <20260425224125.160890-1-irogers@google.com>
Mime-Version: 1.0
References: <20260425174858.3922152-1-irogers@google.com> <20260425224125.160890-1-irogers@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260425224125.160890-36-irogers@google.com>
Subject: [PATCH v7 35/59] perf event_analyzing_sample: Port
 event_analyzing_sample to use python module
From: Ian Rogers <irogers@google.com>
To: acme@kernel.org, adrian.hunter@intel.com, james.clark@linaro.org, 
	leo.yan@linux.dev, namhyung@kernel.org, tmricht@linux.ibm.com
Cc: alice.mei.rogers@gmail.com, dapeng1.mi@linux.intel.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, mingo@redhat.com, peterz@infradead.org, 
	Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260425_154245_190986_748D79B9 
X-CRM114-Status: GOOD (  24.99  )
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

Add a port of the event_analyzing_sample script that uses the perf
python module directly. This approach is significantly faster than
using perf script callbacks as it avoids creating intermediate
dictionaries for all event fields.

Assisted-by: Gemini:gemini-3.1-pro-preview
Signed-off-by: Ian Rogers <irogers@google.com>
---
v2:

1. Dynamic Database Path: Moved DB_PATH to a command-line argument (
  -d / --database ) that defaults to "perf.db" .

2. Security: Avoided using /dev/shm by default to prevent symlink
   attacks, while retaining the performance suggestion in the help
   text.

3. Corrected Closure Call: Fixed the bug where it was trying to call
   .filter() on a closure.

v6:
- Fixed performance issue by removing autocommit mode in SQLite and
  batching commits.
---
 tools/perf/python/event_analyzing_sample.py | 297 ++++++++++++++++++++
 1 file changed, 297 insertions(+)
 create mode 100755 tools/perf/python/event_analyzing_sample.py

diff --git a/tools/perf/python/event_analyzing_sample.py b/tools/perf/python/event_analyzing_sample.py
new file mode 100755
index 000000000000..2132db7f0e56
--- /dev/null
+++ b/tools/perf/python/event_analyzing_sample.py
@@ -0,0 +1,297 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: GPL-2.0
+"""
+General event handler in Python, using SQLite to analyze events.
+
+The 2 database related functions in this script just show how to gather
+the basic information, and users can modify and write their own functions
+according to their specific requirement.
+
+The first function "show_general_events" just does a basic grouping for all
+generic events with the help of sqlite, and the 2nd one "show_pebs_ll" is
+for a x86 HW PMU event: PEBS with load latency data.
+
+Ported from tools/perf/scripts/python/event_analyzing_sample.py
+"""
+
+import argparse
+import math
+import sqlite3
+import struct
+from typing import Any
+import perf
+
+# Event types, user could add more here
+EVTYPE_GENERIC  = 0
+EVTYPE_PEBS     = 1     # Basic PEBS event
+EVTYPE_PEBS_LL  = 2     # PEBS event with load latency info
+EVTYPE_IBS      = 3
+
+#
+# Currently we don't have good way to tell the event type, but by
+# the size of raw buffer, raw PEBS event with load latency data's
+# size is 176 bytes, while the pure PEBS event's size is 144 bytes.
+#
+def create_event(name, comm, dso, symbol, raw_buf):
+    """Create an event object based on raw buffer size."""
+    if len(raw_buf) == 144:
+        event = PebsEvent(name, comm, dso, symbol, raw_buf)
+    elif len(raw_buf) == 176:
+        event = PebsNHM(name, comm, dso, symbol, raw_buf)
+    else:
+        event = PerfEvent(name, comm, dso, symbol, raw_buf)
+
+    return event
+
+class PerfEvent:
+    """Base class for all perf event samples."""
+    event_num = 0
+    def __init__(self, name, comm, dso, symbol, raw_buf, ev_type=EVTYPE_GENERIC):
+        self.name       = name
+        self.comm       = comm
+        self.dso        = dso
+        self.symbol     = symbol
+        self.raw_buf    = raw_buf
+        self.ev_type    = ev_type
+        PerfEvent.event_num += 1
+
+    def show(self):
+        """Display PMU event info."""
+        print(f"PMU event: name={self.name:12s}, symbol={self.symbol:24s}, "
+              f"comm={self.comm:8s}, dso={self.dso:12s}")
+
+#
+# Basic Intel PEBS (Precise Event-based Sampling) event, whose raw buffer
+# contains the context info when that event happened: the EFLAGS and
+# linear IP info, as well as all the registers.
+#
+class PebsEvent(PerfEvent):
+    """Intel PEBS event."""
+    pebs_num = 0
+    def __init__(self, name, comm, dso, symbol, raw_buf, ev_type=EVTYPE_PEBS):
+        tmp_buf = raw_buf[0:80]
+        flags, ip, ax, bx, cx, dx, si, di, bp, sp = struct.unpack('QQQQQQQQQQ', tmp_buf)
+        self.flags = flags
+        self.ip    = ip
+        self.ax    = ax
+        self.bx    = bx
+        self.cx    = cx
+        self.dx    = dx
+        self.si    = si
+        self.di    = di
+        self.bp    = bp
+        self.sp    = sp
+
+        super().__init__(name, comm, dso, symbol, raw_buf, ev_type)
+        PebsEvent.pebs_num += 1
+        del tmp_buf
+
+#
+# Intel Nehalem and Westmere support PEBS plus Load Latency info which lie
+# in the four 64 bit words write after the PEBS data:
+#       Status: records the IA32_PERF_GLOBAL_STATUS register value
+#       DLA:    Data Linear Address (EIP)
+#       DSE:    Data Source Encoding, where the latency happens, hit or miss
+#               in L1/L2/L3 or IO operations
+#       LAT:    the actual latency in cycles
+#
+class PebsNHM(PebsEvent):
+    """Intel Nehalem/Westmere PEBS event with load latency."""
+    pebs_nhm_num = 0
+    def __init__(self, name, comm, dso, symbol, raw_buf, ev_type=EVTYPE_PEBS_LL):
+        tmp_buf = raw_buf[144:176]
+        status, dla, dse, lat = struct.unpack('QQQQ', tmp_buf)
+        self.status = status
+        self.dla = dla
+        self.dse = dse
+        self.lat = lat
+
+        super().__init__(name, comm, dso, symbol, raw_buf, ev_type)
+        PebsNHM.pebs_nhm_num += 1
+        del tmp_buf
+
+session: Any = None
+
+con = None
+
+def trace_begin(db_path: str) -> None:
+    """Initialize database tables."""
+    print("In trace_begin:\n")
+    global con
+    con = sqlite3.connect(db_path)
+    assert con is not None
+
+    # Will create several tables at the start, pebs_ll is for PEBS data with
+    # load latency info, while gen_events is for general event.
+    con.execute("""
+        create table if not exists gen_events (
+                name text,
+                symbol text,
+                comm text,
+                dso text
+        );""")
+    con.execute("""
+        create table if not exists pebs_ll (
+                name text,
+                symbol text,
+                comm text,
+                dso text,
+                flags integer,
+                ip integer,
+                status integer,
+                dse integer,
+                dla integer,
+                lat integer
+        );""")
+
+def insert_db(event: Any) -> None:
+    """Insert event into database."""
+    assert con is not None
+    if event.ev_type == EVTYPE_GENERIC:
+        con.execute("insert into gen_events values(?, ?, ?, ?)",
+                    (event.name, event.symbol, event.comm, event.dso))
+    elif event.ev_type == EVTYPE_PEBS_LL:
+        event.ip &= 0x7fffffffffffffff
+        event.dla &= 0x7fffffffffffffff
+        con.execute("insert into pebs_ll values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)",
+                    (event.name, event.symbol, event.comm, event.dso, event.flags,
+                     event.ip, event.status, event.dse, event.dla, event.lat))
+
+def process_event(sample: perf.sample_event) -> None:
+    """Callback for processing events."""
+    # Create and insert event object to a database so that user could
+    # do more analysis with simple database commands.
+
+    # Resolve comm, symbol, dso
+    comm = "Unknown_comm"
+    try:
+        if session is not None:
+            # FIXME: session.find_thread() only takes one argument and uses it as both
+            # PID and TID in C. This means it only resolves main threads correctly.
+            # Sub-threads will get the main thread's comm.
+            proc = session.find_thread(sample.sample_pid)
+            if proc:
+                comm = proc.comm()
+    except TypeError:
+        pass
+
+    # Symbol and dso info are not always resolved
+    dso = sample.dso if hasattr(sample, 'dso') and sample.dso else "Unknown_dso"
+    symbol = sample.symbol if hasattr(sample, 'symbol') and sample.symbol else "Unknown_symbol"
+    name = str(sample.evsel)
+    if name.startswith("evsel("):
+        name = name[6:-1]
+
+    # Create the event object and insert it to the right table in database
+    try:
+        event = create_event(name, comm, dso, symbol, sample.raw_buf)
+        insert_db(event)
+    except (sqlite3.Error, ValueError, TypeError) as e:
+        print(f"Error creating/inserting event: {e}")
+
+def num2sym(num: int) -> str:
+    """Convert number to a histogram symbol (log2)."""
+    # As the event number may be very big, so we can't use linear way
+    # to show the histogram in real number, but use a log2 algorithm.
+    if num <= 0:
+        return ""
+    snum = '#' * (int(math.log(num, 2)) + 1)
+    return snum
+
+def show_general_events() -> None:
+    """Display statistics for general events."""
+    assert con is not None
+    count = con.execute("select count(*) from gen_events")
+    for t in count:
+        print(f"There is {t[0]} records in gen_events table")
+        if t[0] == 0:
+            return
+
+    print("Statistics about the general events grouped by thread/symbol/dso: \n")
+
+    # Group by thread
+    commq = con.execute("""
+        select comm, count(comm) from gen_events
+        group by comm order by -count(comm)
+    """)
+    print(f"\n{ 'comm':>16} {'number':>8} {'histogram':>16}\n{'='*42}")
+    for row in commq:
+        print(f"{row[0]:>16} {row[1]:>8}     {num2sym(row[1])}")
+
+    # Group by symbol
+    print(f"\n{'symbol':>32} {'number':>8} {'histogram':>16}\n{'='*58}")
+    symbolq = con.execute("""
+        select symbol, count(symbol) from gen_events
+        group by symbol order by -count(symbol)
+    """)
+    for row in symbolq:
+        print(f"{row[0]:>32} {row[1]:>8}     {num2sym(row[1])}")
+
+    # Group by dso
+    print(f"\n{'dso':>40} {'number':>8} {'histogram':>16}\n{'='*74}")
+    dsoq = con.execute("select dso, count(dso) from gen_events group by dso order by -count(dso)")
+    for row in dsoq:
+        print(f"{row[0]:>40} {row[1]:>8}     {num2sym(row[1])}")
+
+def show_pebs_ll() -> None:
+    """Display statistics for PEBS load latency events."""
+    assert con is not None
+    # This function just shows the basic info, and we could do more with the
+    # data in the tables, like checking the function parameters when some
+    # big latency events happen.
+    count = con.execute("select count(*) from pebs_ll")
+    for t in count:
+        print(f"There is {t[0]} records in pebs_ll table")
+        if t[0] == 0:
+            return
+
+    print("Statistics about the PEBS Load Latency events grouped by thread/symbol/dse/latency: \n")
+
+    # Group by thread
+    commq = con.execute("select comm, count(comm) from pebs_ll group by comm order by -count(comm)")
+    print(f"\n{'comm':>16} {'number':>8} {'histogram':>16}\n{'='*42}")
+    for row in commq:
+        print(f"{row[0]:>16} {row[1]:>8}     {num2sym(row[1])}")
+
+    # Group by symbol
+    print(f"\n{'symbol':>32} {'number':>8} {'histogram':>16}\n{'='*58}")
+    symbolq = con.execute("""
+        select symbol, count(symbol) from pebs_ll
+        group by symbol order by -count(symbol)
+    """)
+    for row in symbolq:
+        print(f"{row[0]:>32} {row[1]:>8}     {num2sym(row[1])}")
+
+    # Group by dse
+    dseq = con.execute("select dse, count(dse) from pebs_ll group by dse order by -count(dse)")
+    print(f"\n{'dse':>32} {'number':>8} {'histogram':>16}\n{'='*58}")
+    for row in dseq:
+        print(f"{row[0]:>32} {row[1]:>8}     {num2sym(row[1])}")
+
+    # Group by latency
+    latq = con.execute("select lat, count(lat) from pebs_ll group by lat order by lat")
+    print(f"\n{'latency':>32} {'number':>8} {'histogram':>16}\n{'='*58}")
+    for row in latq:
+        print(f"{str(row[0]):>32} {row[1]:>8}     {num2sym(row[1])}")
+
+def trace_end() -> None:
+    """Called at the end of trace processing."""
+    print("In trace_end:\n")
+    if con:
+        con.commit()
+    show_general_events()
+    show_pebs_ll()
+    if con:
+        con.close()
+
+if __name__ == "__main__":
+    ap = argparse.ArgumentParser(description="Analyze events with SQLite")
+    ap.add_argument("-i", "--input", default="perf.data", help="Input file name")
+    ap.add_argument("-d", "--database", default="perf.db",
+                    help="Database file name (tip: use /dev/shm/perf.db for speedup)")
+    args = ap.parse_args()
+
+    trace_begin(args.database)
+    session = perf.session(perf.data(args.input), sample=process_event)
+    session.process_events()
+    trace_end()
-- 
2.54.0.545.g6539524ca2-goog


