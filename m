Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07D2EFF885A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Apr 2026 22:52:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C1LwLJ/S5+yYNXf1JRm+e96X+YoT2PYO4quJ+4E0ZMc=; b=MZXGvHJu4H/Q0Q2AQULTw2rnmV
	2z4dBTNQF3Z2JLnQpu83F6EZSGeZy0GOTlYZJ1XgLgJYxPMIjgQezFZoaNPdF6OZzyp59uTi51dXx
	1yHDuOAUIgSutmSasbxY6GroLf2fEPCKZmAxxHJvzbhgLTze5md25eNGUEp14SVwvaDUvRt2oYhs/
	Rpf2xuuY9+O7/yN/8Bd+pFUQVVJBx9WmP9MoFwnZ8/THHPKpwLhW8TrzUxho7hskVdwmCdDf/NibJ
	50NlPCVosAtUY+2R0mL8IXWn4n++XYs8Eu82Yvt/6/jio1grtgR0u3g+/Fm+WrRv2BaJF7WyZAb9V
	2awk+cGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGlrY-0000000F0KM-1Rax;
	Sat, 25 Apr 2026 22:52:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGlqq-0000000EzUJ-0XYF
	for linux-arm-kernel@bombadil.infradead.org;
	Sat, 25 Apr 2026 22:51:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=C1LwLJ/S5+yYNXf1JRm+e96X+YoT2PYO4quJ+4E0ZMc=; b=qn21OW+V2CQLyRnwKjgGWppBp3
	StA1MExShLo+7XH7eoZ+pFS0MXZVfzSAfvGO2NAWKwoQdXaTccU6Rpib0rQ9lTVk0P9pN9I3hV9P1
	i7Qm++s1Ptbpf4L6SP3Ecm9I5gQn6g6vMdRP6tX1FYGkPfPrO6ceki/0TxaEKqVGV4FvRzeiCXMU7
	N7MnUgswTFa0oDiuAqxf01cpTS7N+IJMMSbh29XwugugB6gBqh/QOMWmn0JZjHg1uUeu2d9kvmo1O
	sk0QhoqSNtmeLs9ktjWVvoBZyrLU6cIdiue+tjUAAkFnTy80pCg+OdgL2Qud8R6xYIEcAJ0oSuiIm
	PPQ5pCng==;
Received: from mail-dy1-x1349.google.com ([2607:f8b0:4864:20::1349])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGlqm-0000000GMs3-0b0j
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Apr 2026 22:51:50 +0000
Received: by mail-dy1-x1349.google.com with SMTP id 5a478bee46e88-2ddd8ef5343so8847215eec.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 25 Apr 2026 15:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777157506; x=1777762306; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=C1LwLJ/S5+yYNXf1JRm+e96X+YoT2PYO4quJ+4E0ZMc=;
        b=fF1Hr90dgYzpQY3QG8l+iUISgx/xsiaXej54aTc6I9uFUOBp2seVnPVjMUphjdWs5t
         dt79fmfezgbP+aSEM4a+Cxv41GAjrMVZicVpJ5/MFfNWKv+yCTNC8W23OpUeiY7eCAZ6
         3H0M6WFyJSc2/nawqpM3mx4L1I9pIsazMqCpKAP7npKVOU5ZW2rhJr2y2kbXT2JcqfMJ
         eItYzZYReFE/FfQgkU/TrcmKw42LlzoJaXau+LgE4XRvhUjUtDRvLQ3eH5QZtDU9gSoZ
         9UM8qSHL9As/yaSN2G/8r04UQ/S64hwaum+ClK6ffJ0KP6ftgaW2p6vhYVs4F25W1zOG
         aTOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777157506; x=1777762306;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C1LwLJ/S5+yYNXf1JRm+e96X+YoT2PYO4quJ+4E0ZMc=;
        b=PVcG7qR8qqIkSDQTIynuhvqCiDVlkIvh93cIlzlu46SCX2hQ8p7lIJUnpF6sJsp1GU
         8a6sG9WDHTsVukctbjr42yN457qE973heDx83jK3HZYdFKtzTlCJixWGBJA1jFzwvLGf
         FZ73LdXWj47l3Bf03aEJGuNhn8HzP10jLkjRea/O9R0+2O43D+yeXXi9zVsa5s037M/g
         mvYRMO1tBY+SsuamgjENpplui5wI5hho7yn8yKuaKb/5qqmEvVNJHFCJE6iblBc9Ktym
         1tna6CfWzaIpGx7yqNpEcZ8dIQeU3hB6CNyHiwirteZKgO6MnO3TeRKQNgi/SHYYf26B
         3HCA==
X-Forwarded-Encrypted: i=1; AFNElJ+wYsrqpDyNZQbEobd6LYUDg8iYDcxUdXyKjmhIMOQVs98EqpZVRuSu7B80XZJb62DVJ98FuScSk77JGDpcWyTE@lists.infradead.org
X-Gm-Message-State: AOJu0YygwD6opiGWHYAAbu6x/3kVJ6259s/GlVc+aO+sWvEMSy2Fw/Ok
	7kSJ6MsaiyEF+KvrABfPz49mevimoCoDe2Zqfxp0h0aFH1pqI27AGoA26dqTe0gGM4onD5+rylf
	i2fyk4VR6kw==
X-Received: from dycnr11-n1.prod.google.com ([2002:a05:7300:e9cb:10b0:2e5:fa99:f6e4])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:693c:2c84:b0:2d9:2b54:ea9c
 with SMTP id 5a478bee46e88-2e477c9bc5bmr22454427eec.18.1777157505556; Sat, 25
 Apr 2026 15:51:45 -0700 (PDT)
Date: Sat, 25 Apr 2026 15:49:36 -0700
In-Reply-To: <20260425224951.174663-1-irogers@google.com>
Mime-Version: 1.0
References: <20260425174858.3922152-1-irogers@google.com> <20260425224951.174663-1-irogers@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260425224951.174663-45-irogers@google.com>
Subject: [PATCH v7 44/59] perf sctop: Port sctop to use python module
From: Ian Rogers <irogers@google.com>
To: acme@kernel.org, adrian.hunter@intel.com, james.clark@linaro.org, 
	leo.yan@linux.dev, namhyung@kernel.org, tmricht@linux.ibm.com
Cc: alice.mei.rogers@gmail.com, dapeng1.mi@linux.intel.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, mingo@redhat.com, peterz@infradead.org, 
	Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260425_235148_563536_C94348DC 
X-CRM114-Status: GOOD (  14.66  )
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


