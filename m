Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62BB8FF8870
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 07:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N4Nf17+iE4TpFXICTEQCjer2ymy7/ZPQXwIyAydjrk8=; b=a0/o7Ld68lASiXgMS4658DlLXj
	V5LEwRJbtQUgnJ8EzhGEykQXyAzxw+iVtDnoaJBe1Ds9IRVnlExJd8Ap3Zc7yJQonQieXirGJU44b
	HQnt2owz5ErY/w/Ewtkx2lirj3XHyZv1+e1urR4v+v3xRWTao0uENvU9dYjrJR3R4OQcOPiBBRb9P
	go7ItKPr63hVNyEiBnLSimow9iuIwpmzRfYZKPKxDm5uwIfs49iEFxVI/blMOtdYAWmV11GAx3D7N
	wHSUZRZD2sKZXbYfIvyk+meMKeuUVwf23wlluhUjjqE3YddX+ZraNAqNGxDvBZgtokfBsL/RtxeUD
	yX4x3JiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHckv-00000000iGE-3393;
	Tue, 28 Apr 2026 07:21:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHckH-00000000hVl-3v68
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 28 Apr 2026 07:20:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=N4Nf17+iE4TpFXICTEQCjer2ymy7/ZPQXwIyAydjrk8=; b=JnzGjsbP/aKr29Pwj+v2j/VRPo
	ez/m33+Jgp7Onke7l0r9gCR/2CJFzKyeMV17mTuYM03YPznVeI3MnzgcqoTctKIne4Paz3XulRoWW
	TOuJ4vaBQkEeInBwVuMn6VlWbAG/Hg3gVZpw41T0+mjtIPbiTOGpHIKBTQOM8xqlx4b/AyTr7jUBH
	EDfHvPR8gbILCDAMRkDviXd9vCTcsLeCOJSNFQEtCAzP9FORG3eDM+LdneGO6vy9S5xdyjRqDzZVX
	jcKED7LdedNg3RyYxAuO+NBfkfRpwevLal/Ja4iqDpzoS1x6WY8sSTDnYsi2Q7H+UBmUPzXCbmYP3
	M+kCY/Cg==;
Received: from mail-dl1-x124a.google.com ([2607:f8b0:4864:20::124a])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHckE-00000002DcI-22ek
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 07:20:36 +0000
Received: by mail-dl1-x124a.google.com with SMTP id a92af1059eb24-12c66fdd4aeso16633347c88.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 00:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777360832; x=1777965632; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=N4Nf17+iE4TpFXICTEQCjer2ymy7/ZPQXwIyAydjrk8=;
        b=PVFbyWdepIghJOqz/ws/4A4U2BQfDz5fGoqe1uc161MgCfF36pamNAqDsnMxSRDhCi
         5dmNTmPfKhDv98rhAq1TXkMNrYa8CGG0trP1ol3oRLLv8+/KQ0g8Z+WePoZcdXi7+ukd
         Df8sMtT2pNRPr/ilLlgZr7PhL1BcwOcurangaT8IK52a1sxjJTRsHpYEIE9V208fqRbL
         IolbmeMwyMIIl/2cNKZJEWioN0dpPa/xqxtnRWHdjp9kW6CYABiwLVR1zv4jsBMUNrYI
         4XpBlSoLhyMyhj5LLDuOWrbfprrjr2TiVJhstwyPXxlN/IqPR0XY+S2aaJuYmLNScORk
         MLTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777360832; x=1777965632;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N4Nf17+iE4TpFXICTEQCjer2ymy7/ZPQXwIyAydjrk8=;
        b=nZM8zJdyDkAevqFBmTFh1Gns3nCpWRGaNzg2ZNGDGlWdC1hFkQewoNkEmI8uXsVQhk
         /d7JbGu8eH4Yq4ecc95bsBWT1D+N0dR10tTggLXdmwpqaScDqcuDKwusIF+o90NdjDMx
         PiY3o0Wkja2a1gQVe7gKfPhrkAG99+N9UkrQLOpyj5pyPhTJKRgWE+lc8JKkuG61j0Ea
         74uIRdguc6rQ3twinlTrmNesMSWHgnNv7BHJjoi8/sbtjUSbD8lzpYDuHw4jkHqqXSA6
         Mr7HHCXGMjMaAVXB3jtYnmQf9r5aqOnWgJ4FtC/UG6+pyBX7+3RbxKS4Y9/soLyB3VBW
         610Q==
X-Forwarded-Encrypted: i=1; AFNElJ+dDha2MZSIuoTQrJVkg8ucA5U1Un++VbBALni1fjJYwd2a5RA1dBKyYCgpO8S+5hPG6QkzGAR9+kGBDval/jy4@lists.infradead.org
X-Gm-Message-State: AOJu0YzKnnH+bwRhYFztWZctbc7u7hGObAgRRW+8ON5Orpo/5sCfk6Kb
	qD9kZsBBVPAITw+zlLy0/cGHjl9SCaHJ7v/lFGiAkVFjY137wXV6MlXh1Sw+BnALVCcNTkacvyJ
	FEeIHeCcU0w==
X-Received: from dleb18-n1.prod.google.com ([2002:a05:701b:4252:10b0:12d:d43c:4120])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:698c:b0:12a:6fb7:8801
 with SMTP id a92af1059eb24-12ddd99a48amr980737c88.14.1777360831732; Tue, 28
 Apr 2026 00:20:31 -0700 (PDT)
Date: Tue, 28 Apr 2026 00:18:41 -0700
In-Reply-To: <20260428071903.1886173-1-irogers@google.com>
Mime-Version: 1.0
References: <20260425224951.174663-1-irogers@google.com> <20260428071903.1886173-1-irogers@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260428071903.1886173-37-irogers@google.com>
Subject: [PATCH v8 36/58] perf export-to-sqlite: Port export-to-sqlite to use
 python module
From: Ian Rogers <irogers@google.com>
To: acme@kernel.org, namhyung@kernel.org
Cc: adrian.hunter@intel.com, alice.mei.rogers@gmail.com, 
	dapeng1.mi@linux.intel.com, james.clark@linaro.org, leo.yan@linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, mingo@redhat.com, peterz@infradead.org, 
	tmricht@linux.ibm.com, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_082034_792852_B78223AD 
X-CRM114-Status: GOOD (  17.48  )
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

This commit ports the export-to-sqlite.py script to use the modern perf
Python module and the standard library sqlite3 module. It drops the
dependency on PySide2.QtSql.

Assisted-by: Gemini:gemini-3.1-pro-preview
Signed-off-by: Ian Rogers <irogers@google.com>
---
v5:
1. Fix Callchain Resolution: Corrected attribute lookups on callchain
   nodes. The `dso` and `symbol` properties already return strings, so
   attempting to get a `.name` attribute from them failed and caused
   fallback to "Unknown_...".
---
 tools/perf/python/export-to-sqlite.py | 372 ++++++++++++++++++++++++++
 1 file changed, 372 insertions(+)
 create mode 100755 tools/perf/python/export-to-sqlite.py

diff --git a/tools/perf/python/export-to-sqlite.py b/tools/perf/python/export-to-sqlite.py
new file mode 100755
index 000000000000..736b56ff8d59
--- /dev/null
+++ b/tools/perf/python/export-to-sqlite.py
@@ -0,0 +1,372 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: GPL-2.0
+"""
+Export perf data to a sqlite3 database.
+
+This script has been ported to use the modern perf Python module and the
+standard library sqlite3 module. It no longer requires PySide2 or QtSql
+for exporting.
+
+Examples of using this script with Intel PT:
+
+	$ perf record -e intel_pt//u ls
+	$ python tools/perf/python/export-to-sqlite.py -i perf.data -o pt_example
+
+To browse the database, sqlite3 can be used e.g.
+
+	$ sqlite3 pt_example
+	sqlite> .header on
+	sqlite> select * from samples_view where id < 10;
+	sqlite> .mode column
+	sqlite> select * from samples_view where id < 10;
+	sqlite> .tables
+	sqlite> .schema samples_view
+	sqlite> .quit
+
+An example of using the database is provided by the script
+exported-sql-viewer.py. Refer to that script for details.
+
+Ported from tools/perf/scripts/python/export-to-sqlite.py
+"""
+
+import argparse
+import os
+import sqlite3
+import sys
+from typing import Dict, Optional
+import perf
+
+
+class DatabaseExporter:
+    """Handles database connection and exporting of perf events."""
+
+    def __init__(self, db_path: str):
+        self.con = sqlite3.connect(db_path)
+        self.session: Optional[perf.session] = None
+        self.sample_count = 0
+
+        # Caches and counters grouped to reduce instance attributes
+        self.caches: Dict[str, dict] = {
+            'threads': {},
+            'comms': {},
+            'dsos': {},
+            'symbols': {},
+            'events': {},
+            'branch_types': {},
+            'call_paths': {}
+        }
+
+        self.next_id = {
+            'thread': 1,
+            'comm': 1,
+            'dso': 1,
+            'symbol': 1,
+            'event': 1,
+            'branch_type': 1,
+            'call_path': 1
+        }
+
+        self.create_tables()
+
+    def create_tables(self) -> None:
+        """Create database tables."""
+        self.con.execute("""
+            CREATE TABLE IF NOT EXISTS selected_events (
+                    id      INTEGER         NOT NULL        PRIMARY KEY,
+                    name    VARCHAR(80))
+        """)
+        self.con.execute("""
+            CREATE TABLE IF NOT EXISTS machines (
+                    id      INTEGER         NOT NULL        PRIMARY KEY,
+                    pid     INTEGER,
+                    root_dir VARCHAR(4096))
+        """)
+        self.con.execute("""
+            CREATE TABLE IF NOT EXISTS threads (
+                    id      INTEGER         NOT NULL        PRIMARY KEY,
+                    machine_id BIGINT,
+                    process_id BIGINT,
+                    pid     INTEGER,
+                    tid     INTEGER)
+        """)
+        self.con.execute("""
+            CREATE TABLE IF NOT EXISTS comms (
+                    id      INTEGER         NOT NULL        PRIMARY KEY,
+                    comm    VARCHAR(16),
+                    c_thread_id BIGINT,
+                    c_time  BIGINT,
+                    exec_flag BOOLEAN)
+        """)
+        self.con.execute("""
+            CREATE TABLE IF NOT EXISTS comm_threads (
+                    id      INTEGER         NOT NULL        PRIMARY KEY,
+                    comm_id BIGINT,
+                    thread_id BIGINT)
+        """)
+        self.con.execute("""
+            CREATE TABLE IF NOT EXISTS dsos (
+                    id      INTEGER         NOT NULL        PRIMARY KEY,
+                    machine_id BIGINT,
+                    short_name VARCHAR(256),
+                    long_name VARCHAR(4096),
+                    build_id VARCHAR(64))
+        """)
+        self.con.execute("""
+            CREATE TABLE IF NOT EXISTS symbols (
+                    id      INTEGER         NOT NULL        PRIMARY KEY,
+                    dso_id  BIGINT,
+                    sym_start BIGINT,
+                    sym_end BIGINT,
+                    binding INTEGER,
+                    name    VARCHAR(2048))
+        """)
+        self.con.execute("""
+            CREATE TABLE IF NOT EXISTS branch_types (
+                    id      INTEGER         NOT NULL        PRIMARY KEY,
+                    name    VARCHAR(80))
+        """)
+        self.con.execute("""
+            CREATE TABLE IF NOT EXISTS samples (
+                    id              INTEGER         NOT NULL        PRIMARY KEY,
+                    evsel_id        BIGINT,
+                    machine_id      BIGINT,
+                    thread_id       BIGINT,
+                    comm_id         BIGINT,
+                    dso_id          BIGINT,
+                    symbol_id       BIGINT,
+                    sym_offset      BIGINT,
+                    ip              BIGINT,
+                    time            BIGINT,
+                    cpu             INTEGER,
+                    to_dso_id       BIGINT,
+                    to_symbol_id    BIGINT,
+                    to_sym_offset   BIGINT,
+                    to_ip           BIGINT,
+                    period          BIGINT,
+                    weight          BIGINT,
+                    transaction_    BIGINT,
+                    data_src        BIGINT,
+                    branch_type     INTEGER,
+                    in_tx           BOOLEAN,
+                    call_path_id    BIGINT,
+                    insn_count      BIGINT,
+                    cyc_count       BIGINT,
+                    flags           INTEGER)
+        """)
+        self.con.execute("""
+            CREATE TABLE IF NOT EXISTS call_paths (
+                    id              INTEGER         NOT NULL        PRIMARY KEY,
+                    parent_id       BIGINT,
+                    symbol_id       BIGINT,
+                    ip              BIGINT)
+        """)
+        self.con.execute("""
+            CREATE VIEW IF NOT EXISTS samples_view AS
+            SELECT s.id, e.name as event, t.pid, t.tid, c.comm,
+                   d.short_name as dso, sym.name as symbol, s.sym_offset,
+                   s.ip, s.time, s.cpu
+            FROM samples s
+            JOIN selected_events e ON s.evsel_id = e.id
+            JOIN threads t ON s.thread_id = t.id
+            JOIN comms c ON s.comm_id = c.id
+            JOIN dsos d ON s.dso_id = d.id
+            JOIN symbols sym ON s.symbol_id = sym.id;
+        """)
+
+        # id == 0 means unknown. It is easier to create records for them than
+        # replace the zeroes with NULLs
+        self.con.execute("INSERT OR IGNORE INTO selected_events VALUES (0, 'unknown')")
+        self.con.execute("INSERT OR IGNORE INTO machines VALUES (0, 0, 'unknown')")
+        self.con.execute("INSERT OR IGNORE INTO threads VALUES (0, 0, 0, -1, -1)")
+        self.con.execute("INSERT OR IGNORE INTO comms VALUES (0, 'unknown', 0, 0, 0)")
+        self.con.execute("INSERT OR IGNORE INTO dsos VALUES (0, 0, 'unknown', 'unknown', '')")
+        self.con.execute("INSERT OR IGNORE INTO symbols VALUES (0, 0, 0, 0, 0, 'unknown')")
+
+    def get_event_id(self, name: str) -> int:
+        """Get or create event ID."""
+        if name in self.caches['events']:
+            return self.caches['events'][name]
+        event_id = self.next_id['event']
+        self.con.execute("INSERT INTO selected_events VALUES (?, ?)",
+                         (event_id, name))
+        self.caches['events'][name] = event_id
+        self.next_id['event'] += 1
+        return event_id
+
+    def get_thread_id(self, pid: int, tid: int) -> int:
+        """Get or create thread ID."""
+        key = (pid, tid)
+        if key in self.caches['threads']:
+            return self.caches['threads'][key]
+        thread_id = self.next_id['thread']
+        self.con.execute("INSERT INTO threads VALUES (?, ?, ?, ?, ?)",
+                         (thread_id, 0, pid, pid, tid))
+        self.caches['threads'][key] = thread_id
+        self.next_id['thread'] += 1
+        return thread_id
+
+    def get_comm_id(self, comm: str, thread_id: int) -> int:
+        """Get or create comm ID."""
+        if comm in self.caches['comms']:
+            return self.caches['comms'][comm]
+        comm_id = self.next_id['comm']
+        self.con.execute("INSERT INTO comms VALUES (?, ?, ?, ?, ?)",
+                         (comm_id, comm, thread_id, 0, 0))
+        self.con.execute("INSERT INTO comm_threads VALUES (?, ?, ?)",
+                         (comm_id, comm_id, thread_id))
+        self.caches['comms'][comm] = comm_id
+        self.next_id['comm'] += 1
+        return comm_id
+
+    def get_dso_id(self, short_name: str, long_name: str,
+                   build_id: str) -> int:
+        """Get or create DSO ID."""
+        if short_name in self.caches['dsos']:
+            return self.caches['dsos'][short_name]
+        dso_id = self.next_id['dso']
+        self.con.execute("INSERT INTO dsos VALUES (?, ?, ?, ?, ?)",
+                         (dso_id, 0, short_name, long_name, build_id))
+        self.caches['dsos'][short_name] = dso_id
+        self.next_id['dso'] += 1
+        return dso_id
+
+    def get_symbol_id(self, dso_id: int, name: str, start: int,
+                      end: int) -> int:
+        """Get or create symbol ID."""
+        key = (dso_id, name)
+        if key in self.caches['symbols']:
+            return self.caches['symbols'][key]
+        symbol_id = self.next_id['symbol']
+        self.con.execute("INSERT INTO symbols VALUES (?, ?, ?, ?, ?, ?)",
+                         (symbol_id, dso_id, start, end, 0, name))
+        self.caches['symbols'][key] = symbol_id
+        self.next_id['symbol'] += 1
+        return symbol_id
+
+    def get_call_path_id(self, parent_id: int, symbol_id: int,
+                         ip: int) -> int:
+        """Get or create call path ID."""
+        key = (parent_id, symbol_id, ip)
+        if key in self.caches['call_paths']:
+            return self.caches['call_paths'][key]
+        call_path_id = self.next_id['call_path']
+        self.con.execute("INSERT INTO call_paths VALUES (?, ?, ?, ?)",
+                         (call_path_id, parent_id, symbol_id, ip))
+        self.caches['call_paths'][key] = call_path_id
+        self.next_id['call_path'] += 1
+        return call_path_id
+
+    def process_event(self, sample: perf.sample_event) -> None:
+        """Callback for processing events."""
+        thread_id = self.get_thread_id(sample.sample_pid, sample.sample_tid)
+
+        comm = "Unknown_comm"
+        try:
+            if self.session is not None:
+                proc = self.session.find_thread(sample.sample_pid)
+                if proc:
+                    comm = proc.comm()
+        except TypeError:
+            pass
+        comm_id = self.get_comm_id(comm, thread_id)
+
+        dso_id = self.get_dso_id(
+            getattr(sample, 'dso', "Unknown_dso") or "Unknown_dso",
+            getattr(sample, 'dso_long_name', "Unknown_dso_long") or "Unknown_dso_long",
+            getattr(sample, 'dso_bid', "") or ""
+        )
+
+        symbol_id = self.get_symbol_id(
+            dso_id,
+            getattr(sample, 'symbol', "Unknown_symbol") or "Unknown_symbol",
+            getattr(sample, 'sym_start', 0) or 0,
+            getattr(sample, 'sym_end', 0) or 0
+        )
+
+        # Handle callchain
+        call_path_id = 0
+        if hasattr(sample, 'callchain') and sample.callchain:
+            parent_id = 0
+            for node in sample.callchain:
+                dso_name = getattr(node, 'dso', "Unknown_dso") or "Unknown_dso"
+                symbol_name = getattr(node, 'symbol', "Unknown_symbol") or "Unknown_symbol"
+
+                node_dso_id = self.get_dso_id(dso_name, dso_name, "")
+                node_symbol_id = self.get_symbol_id(node_dso_id, symbol_name, 0, 0)
+
+                parent_id = self.get_call_path_id(parent_id, node_symbol_id, node.ip)
+            call_path_id = parent_id
+        else:
+            call_path_id = 0
+
+        # Insert sample
+        self.con.execute("""
+            INSERT INTO samples VALUES (
+                NULL, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?
+            )
+        """, (
+            self.get_event_id(getattr(sample.evsel, 'name', str(sample.evsel))),
+            0, thread_id, comm_id,
+            dso_id, symbol_id, getattr(sample, 'sym_offset', 0),
+            sample.sample_ip, sample.sample_time, sample.sample_cpu,
+            0, 0, 0, 0,  # to_dso, to_symbol, to_sym_offset, to_ip
+            getattr(sample, 'sample_period', 0) or 0,
+            getattr(sample, 'sample_weight', 0) or 0,
+            getattr(sample, 'transaction_', 0),
+            getattr(sample, 'data_src', 0),
+            0,  # branch_type
+            getattr(sample, 'in_tx', 0),
+            call_path_id,
+            getattr(sample, 'insn_count', 0),
+            getattr(sample, 'cyc_count', 0),
+            getattr(sample, 'flags', 0)
+        ))
+
+        self.sample_count += 1
+        if self.sample_count % 10000 == 0:
+            self.commit()
+
+    def commit(self) -> None:
+        """Commit transaction."""
+        self.con.commit()
+
+    def close(self) -> None:
+        """Close connection."""
+        self.con.close()
+
+
+if __name__ == "__main__":
+    ap = argparse.ArgumentParser(
+        description="Export perf data to a sqlite3 database")
+    ap.add_argument("-i", "--input", default="perf.data",
+                    help="Input file name")
+    ap.add_argument("-o", "--output", default="perf.db",
+                    help="Output database name")
+    args = ap.parse_args()
+
+    try:
+        fd = os.open(args.output, os.O_CREAT | os.O_EXCL | os.O_WRONLY)
+        os.close(fd)
+    except FileExistsError:
+        print(f"Error: {args.output} already exists")
+        sys.exit(1)
+
+    exporter = DatabaseExporter(args.output)
+
+    session = None
+    error_occurred = False
+    try:
+        session = perf.session(perf.data(args.input),
+                               sample=exporter.process_event)
+        exporter.session = session
+        session.process_events()
+        exporter.commit()
+        print(f"Successfully exported to {args.output}")
+    except Exception as e:
+        print(f"Error processing events: {e}")
+        error_occurred = True
+    finally:
+        exporter.close()
+        if error_occurred:
+            if os.path.exists(args.output):
+                os.remove(args.output)
-- 
2.54.0.545.g6539524ca2-goog


