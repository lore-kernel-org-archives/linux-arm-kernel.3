Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D71ACFF886F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 07:21:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C1LwLJ/S5+yYNXf1JRm+e96X+YoT2PYO4quJ+4E0ZMc=; b=urPpRVHFB/NGFaqx76GU0rNGAp
	7VF+rhzUIu8oUoRS3SNo8lnN8YbcK9d32WzJzdtCYZ6V8V7y7lUmVGadgQYXOpwQE/fPVo7vCstp0
	9Vj4j97yqPelUAVXdSMdgPcUoI4dEuEVwjXYV0uf4MosEple6ZqO3Zv89t3QqYZENnsGMlKW1ODDn
	R9ZDY4j5rAwegmLX0GTQpEiPDLIL8ZHBaq18BH7hERm6HOBNc6lejxM5+OuaYfYS6FbwvAo2867Me
	7dvC76LwB9iJolZ+vZ90Fn2k+omCkCNMAATCiAP4rVhUZlMnW2SOhxy0h0qiRt3TjXZ+blxP0a+KJ
	0e+qsmTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHclH-00000000ihp-0bSK;
	Tue, 28 Apr 2026 07:21:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHckX-00000000hlG-2PcU
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 28 Apr 2026 07:20:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=C1LwLJ/S5+yYNXf1JRm+e96X+YoT2PYO4quJ+4E0ZMc=; b=gpx+mUYNENdXRAIqa3lqo7mpT1
	6vivvw03LoKCTxMmWPZfnfYtrdck5AxgE6ynPPktElAZBi1wOEBJ1qBP9BHiIjSliu6As6q+mdgox
	HyrXmEIXuV9U2OPmCQKXB0mLxZc7eufZtg2vd+TDoSCkeVQkwHJAp0vzZadgfrzJuv/zUxfTJ/LgC
	jOjskop6WTFwOPKLM/5fdMXWsvkdWz4eAAmdbqvnEEb1sta9Y9hF2r7upsrT0PrWnMXeA/+Za2ffN
	oM0GAdt2rIdVJiUdhAtIN5+lQu1DTRUxMPtHmYKStpAyeZLs6B0W+L+aXezeGhC4QHLICIzG3tWHR
	XYNjpkWw==;
Received: from mail-dy1-x1349.google.com ([2607:f8b0:4864:20::1349])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHckU-00000002Djv-0Hih
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 07:20:52 +0000
Received: by mail-dy1-x1349.google.com with SMTP id 5a478bee46e88-2eaed3d96d7so3084659eec.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 00:20:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777360848; x=1777965648; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=C1LwLJ/S5+yYNXf1JRm+e96X+YoT2PYO4quJ+4E0ZMc=;
        b=TI871mKiNwu8BKNYswRc9KTW7E2iBK7VEgdSS/ElpEbLcZv1/uLgpQ6QerdbYvXTHV
         5opnEH6iluAEugUJ9Jrru01rKRjixp5WC/Q5NZajqRRJhZF5JiiO1cj0cTckS1IjE/8f
         ZcaxJfjcLx9gxpO7XiD1103ivqLS/NM8rVyAh2KvDoXJHeAZYzOyLBerYT40ClDaFUw5
         DKBdK2/GII8NegWk7oy/Jf8kepZ7qcO+N9lEQAKHexdiOs021VaWmCu3gux3IaKp7kvC
         K6YwJzalGvw+uRV19pqVmMCcXcvc5n1QIlZplsSgDvxvgLM9LYSLpw1floFoKevBCGHC
         xlrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777360848; x=1777965648;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C1LwLJ/S5+yYNXf1JRm+e96X+YoT2PYO4quJ+4E0ZMc=;
        b=Jh6EchvsrgRN6Z3O09dtgSPtST2tLY5TjhJgN8hkMLCFcpxwRt+Q4qE+10pd91DN6o
         yi1OfSLl+HVOMscgwJsEc7E0XcwY1AAjclbkNq0l0SZjrdx0PPRdE+0NCkjDMfa6cJNj
         1IwRENFQhmcCv66gc4XMTFbs8KVGiFClAs5mSdq5awOVzqZKCx+vaJUFmSL06bszKYFA
         YB4MhNxQ2xHZpdVEU+4E4D1fICV3ZbUMd7ZLyMNUJhiUNGdR+0gCwGHFNe5GKJXQYPWC
         SF0qDk7ownaizxiwjnPwz7aoeZaxaX7LfkDeLVippucB35Ok8gctC7gLwf+9MHIP8lWZ
         i4yQ==
X-Forwarded-Encrypted: i=1; AFNElJ+Q1lVg1RzcSW2gxWPOfU4mS41u49JbFfUFmHPTRDX9i3Y8Q8uNV9sfAsF9AV0pk7qNGeytfo7b31pCr1+qKF7Q@lists.infradead.org
X-Gm-Message-State: AOJu0YxH8j1iZELFKxN1rao6O5EE1eHoPx2MASS8an2bFGh3OBvoYHG6
	D5Op5IXlMxKW5xV0WjbgK40RmW0+mxP2QUOLVrZVnZtQTuc2lndk6l2yz/ka6aLdUv95blyFaoc
	sG4Bnne9Vaw==
X-Received: from dycui24.prod.google.com ([2002:a05:693c:6018:b0:2de:e63d:7daa])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:6ba1:b0:12d:de3f:f3dc
 with SMTP id a92af1059eb24-12dde3ff91emr365882c88.38.1777360847456; Tue, 28
 Apr 2026 00:20:47 -0700 (PDT)
Date: Tue, 28 Apr 2026 00:18:49 -0700
In-Reply-To: <20260428071903.1886173-1-irogers@google.com>
Mime-Version: 1.0
References: <20260425224951.174663-1-irogers@google.com> <20260428071903.1886173-1-irogers@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260428071903.1886173-45-irogers@google.com>
Subject: [PATCH v8 44/58] perf sctop: Port sctop to use python module
From: Ian Rogers <irogers@google.com>
To: acme@kernel.org, namhyung@kernel.org
Cc: adrian.hunter@intel.com, alice.mei.rogers@gmail.com, 
	dapeng1.mi@linux.intel.com, james.clark@linaro.org, leo.yan@linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, mingo@redhat.com, peterz@infradead.org, 
	tmricht@linux.ibm.com, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_082050_677314_B90D9227 
X-CRM114-Status: GOOD (  15.60  )
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

This commit ports sctop.py from tools/perf/scripts/python/ to
tools/perf/python/ using a class-based structure. It also adds live mode
support using the LiveSession helper with a fallback strategy for
tracepoint names.

Assisted-by: Gemini:gemini-3.1-pro-preview
Signed-off-by: Ian Rogers <irogers@google.com>
---
v5:
1. Fix Fallback Logic: Check `__syscall_nr` and `nr` fields for syscall ID
   if `id` is missing on fallback tracepoints.
2. Fix Thread Lookup Crash: Added try-except block around `session.process()`
   to handle missing PIDs gracefully.
---
 tools/perf/python/sctop.py | 186 +++++++++++++++++++++++++++++++++++++
 1 file changed, 186 insertions(+)
 create mode 100755 tools/perf/python/sctop.py

diff --git a/tools/perf/python/sctop.py b/tools/perf/python/sctop.py
new file mode 100755
index 000000000000..b94f66a8307d
--- /dev/null
+++ b/tools/perf/python/sctop.py
@@ -0,0 +1,186 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: GPL-2.0
+"""
+System call top
+
+Periodically displays system-wide system call totals, broken down by
+syscall.  If a [comm] arg is specified, only syscalls called by
+[comm] are displayed. If an [interval] arg is specified, the display
+will be refreshed every [interval] seconds.  The default interval is
+3 seconds.
+
+Ported from tools/perf/scripts/python/sctop.py
+"""
+
+import argparse
+from collections import defaultdict
+import sys
+import threading
+from typing import Optional
+import perf
+from perf_live import LiveSession
+
+
+
+
+class SCTopAnalyzer:
+    """Periodically displays system-wide system call totals."""
+
+    def __init__(self, for_comm: str | None, interval: int, offline: bool = False):
+        self.for_comm = for_comm
+        self.interval = interval
+        self.syscalls: dict[int, int] = defaultdict(int)
+        self.lock = threading.Lock()
+        self.stop_event = threading.Event()
+        self.thread = threading.Thread(target=self.print_syscall_totals)
+        self.offline = offline
+        self.last_print_time: int | None = None
+        self.session: Optional[perf.session] = None
+
+    def syscall_name(self, syscall_id: int) -> str:
+        """Lookup syscall name by ID."""
+        try:
+            return perf.syscall_name(syscall_id)
+        except Exception:  # pylint: disable=broad-exception-caught
+            pass
+        return str(syscall_id)
+
+    def process_event(self, sample: perf.sample_event) -> None:
+        """Collect syscall events."""
+        name = str(sample.evsel)
+        syscall_id = getattr(sample, "id", -1)
+        if syscall_id == -1:
+            syscall_id = getattr(sample, "__syscall_nr", -1)
+        if syscall_id == -1:
+            syscall_id = getattr(sample, "nr", -1)
+
+        if syscall_id == -1:
+            return
+
+        comm = "Unknown"
+        if hasattr(self, 'session') and self.session:
+            try:
+                proc = self.session.find_thread(sample.sample_pid)
+                if proc:
+                    comm = proc.comm()
+            except (TypeError, AttributeError):
+                pass
+        else:
+            comm = getattr(sample, "comm", "Unknown")
+
+        if name in ("evsel(raw_syscalls:sys_enter)", "evsel(syscalls:sys_enter)"):
+            if self.for_comm is not None and comm != self.for_comm:
+                return
+            with self.lock:
+                self.syscalls[syscall_id] += 1
+
+        if self.offline and hasattr(sample, "time"):
+            interval_ns = self.interval * (10 ** 9)
+            if self.last_print_time is None:
+                self.last_print_time = sample.time
+            elif sample.time - self.last_print_time >= interval_ns:
+                self.print_current_totals()
+                self.last_print_time = sample.time
+
+    def print_current_totals(self):
+        """Print current syscall totals."""
+        # Clear terminal
+        print("\x1b[2J\x1b[H", end="")
+
+        if self.for_comm is not None:
+            print(f"\nsyscall events for {self.for_comm}:\n")
+        else:
+            print("\nsyscall events:\n")
+
+        print(f"{'event':40s}  {'count':10s}")
+        print(f"{'-' * 40:40s}  {'-' * 10:10s}")
+
+        with self.lock:
+            current_syscalls = list(self.syscalls.items())
+            self.syscalls.clear()
+
+        current_syscalls.sort(key=lambda kv: (kv[1], kv[0]), reverse=True)
+
+        for syscall_id, val in current_syscalls:
+            print(f"{self.syscall_name(syscall_id):<40s}  {val:10d}")
+
+    def print_syscall_totals(self):
+        """Periodically print syscall totals."""
+        while not self.stop_event.is_set():
+            self.print_current_totals()
+            self.stop_event.wait(self.interval)
+        # Print final batch
+        self.print_current_totals()
+
+    def start(self):
+        """Start the background thread."""
+        self.thread.start()
+
+    def stop(self):
+        """Stop the background thread."""
+        self.stop_event.set()
+        self.thread.join()
+
+
+def main():
+    """Main function."""
+    ap = argparse.ArgumentParser(description="System call top")
+    ap.add_argument("args", nargs="*", help="[comm] [interval] or [interval]")
+    ap.add_argument("-i", "--input", help="Input file name")
+    args = ap.parse_args()
+
+    for_comm = None
+    default_interval = 3
+    interval = default_interval
+
+    if len(args.args) > 2:
+        print("Usage: perf script -s sctop.py [comm] [interval]")
+        sys.exit(1)
+
+    if len(args.args) > 1:
+        for_comm = args.args[0]
+        try:
+            interval = int(args.args[1])
+        except ValueError:
+            print(f"Invalid interval: {args.args[1]}")
+            sys.exit(1)
+    elif len(args.args) > 0:
+        try:
+            interval = int(args.args[0])
+        except ValueError:
+            for_comm = args.args[0]
+            interval = default_interval
+
+    analyzer = SCTopAnalyzer(for_comm, interval, offline=bool(args.input))
+
+    if not args.input:
+        analyzer.start()
+
+    try:
+        if args.input:
+            session = perf.session(perf.data(args.input), sample=analyzer.process_event)
+            analyzer.session = session
+            session.process_events()
+        else:
+            try:
+                live_session = LiveSession(
+                    "raw_syscalls:sys_enter", sample_callback=analyzer.process_event
+                )
+            except OSError:
+                live_session = LiveSession(
+                    "syscalls:sys_enter", sample_callback=analyzer.process_event
+                )
+            live_session.run()
+    except KeyboardInterrupt:
+        pass
+    except IOError as e:
+        print(f"Error: {e}")
+    finally:
+        if args.input:
+            analyzer.print_current_totals()
+        else:
+            analyzer.stop()
+
+
+if __name__ == "__main__":
+    main()
-- 
2.54.0.545.g6539524ca2-goog


