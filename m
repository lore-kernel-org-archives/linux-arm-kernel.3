Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BECFFED3F0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Apr 2026 16:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vWpfQspTuHMw7nQ4RI+J7bB0lzo0yDBeexGW3s3bnr0=; b=giCt08Z0xQJ1rFyGlFhgEvmX/n
	8FeeMKjw48fQeq8eZBfCcxWB8eVd5wQdESJnSKK3MQxE6AKjv6QenX61J7/mRGhbuO1IgQu9ZwLrq
	50bgfQu9Yytl4LsKCqp1GDW66DGUL4T6ZaV8B/6X1n9N61QUaWvarCKDTudWr6ZHn5Qsp0tcsFpGM
	9qWT8c2pQ3iBIIla6Kn3P6eJRaakZqs+Edj3bnfJJLFKbgReNWFsnsRoTAVSlys/Nh1IoTDoweHWU
	niWkkTcQUdwxqNtB8ojy5hVghDQW30/9piKB+RGKnVzBC1pvrpRiapAHwNqXHzGEKiCEsMw4lnqeB
	GH7kdRmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGJje-0000000DVwq-0Hvz;
	Fri, 24 Apr 2026 16:50:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGJiX-0000000DUjA-1XMr
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 24 Apr 2026 16:49:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=vWpfQspTuHMw7nQ4RI+J7bB0lzo0yDBeexGW3s3bnr0=; b=AUHWsJKHbItzWmi51/QQ4hXekJ
	4rGy+uJbcKghT18gl9wsOoZwYiN2B8o1WnU2qwEX80YhFh6Z2/lDhf0hhUPbz5eVyCWFDGPCYXiiw
	/EB2fCFEmoMPAs8hOj3VFK6jD8ch7o4HdB+d6eRIgnlydNLd28VFOJzlYlJk06Mh2MuaR56md8TzH
	ru4j5Rn2+AwVdpndIX6V7zebilt6gcdeMgNsQJoc3K+sTAPSFfyvv26vu+Kk0acfSwti+PVnOoQB9
	TSbVFVLuSQ5X+QIPZIFuFsPskWz7DbsO1Wn1+lNv8u/CqTLezv/aLB//dqBAulfG1JT9HKrMlp53R
	awE5kcYg==;
Received: from mail-dy1-x1349.google.com ([2607:f8b0:4864:20::1349])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGJiS-0000000F9XP-1wHf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Apr 2026 16:49:23 +0000
Received: by mail-dy1-x1349.google.com with SMTP id 5a478bee46e88-2c0ba59a830so12543349eec.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Apr 2026 09:49:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777049358; x=1777654158; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=vWpfQspTuHMw7nQ4RI+J7bB0lzo0yDBeexGW3s3bnr0=;
        b=fap7cP99b+rRDtBFmyLs9AX9ACF6wIiCEHNLPLIrgMD0iTt2fY1bhGmZS2LonExYAi
         B6IS5CvFUQY+us9aPAT7I0NZDxYTiKvpt4oApERBil328lCq+RkL/uQR6chgWchVgZ0t
         PnULIXKDVj0qzBNPUlIrPQTLn1vzFWwQ9TYKVsm2ctyldxV3lcoc64W2lBBSvfbw0tPX
         16u4sQS8/LZ4WQPKC6PqqDdT2uQNqrU+7UsFU/XUWRg/agToC0+okOxNXqXJ5nt3neFd
         cIB2BSA6L/IYR/0a1RrFVm8qjIFOcuJfI2ZsMjAcVVGgUNn76x02trH5UOEegoX+8RKu
         fOow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777049358; x=1777654158;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vWpfQspTuHMw7nQ4RI+J7bB0lzo0yDBeexGW3s3bnr0=;
        b=jbqtwH5r6utB8NkYMPvdCOf6G570zbVEpgklvLtbRNnRpehJ8rAl+YOCrS+PBIh4E2
         TVCncqEzVjP02HNLYttpByGBGjZAZjsW6Gp5zIIbdVQ6oR+3UvHdfVdHWx2qWlbdxYUI
         O0tJyNkOS8iJAT28n6HPnvk7IX6Ryaagw9Kewc/7CEN4vajHKIDrge5kQ7/Vwv/+5eAB
         4upHme4LXDdu8SggnrSfdq45VMlEZSucQGggwDu4NjZRSSXmLXGGZoLXpqjMvPbHgEnK
         PR6BhE5mun3byzg4fDfQRwISDJ+HkXBiZVjs96d0XEmKip+ZCWc3IsMtOU3eDnuUG95L
         qRyg==
X-Forwarded-Encrypted: i=1; AFNElJ8SeHBHcvDhTfTnUK9u7fSJpt9VdZC87lPxnwAHSJSVSpIXmmwrm8fhcvhLnfT4xL1KofNiI0FDe7on5IXjp+Ee@lists.infradead.org
X-Gm-Message-State: AOJu0YzOeDQ19aQs5xC9KK32lUCfPYrQzpnnHWbQD+vAAriPJyIG3DDm
	N9vch6BrelYRXOn8Cg7G9MYTULuWb4ofoRHYbvAaZLsyA7e/L/9RiRi0TCt3v2hDhHc5qI9ikF4
	dtqEjeF6RjA==
X-Received: from dybso7.prod.google.com ([2002:a05:7301:6907:b0:2d8:e3a6:d707])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7301:168a:b0:2d1:815f:19c1
 with SMTP id 5a478bee46e88-2e479c0427dmr15814195eec.15.1777049357757; Fri, 24
 Apr 2026 09:49:17 -0700 (PDT)
Date: Fri, 24 Apr 2026 09:47:06 -0700
In-Reply-To: <20260424164721.2229025-1-irogers@google.com>
Mime-Version: 1.0
References: <20260423163406.1779809-1-irogers@google.com> <20260424164721.2229025-1-irogers@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260424164721.2229025-45-irogers@google.com>
Subject: [PATCH v5 44/58] perf sctop: Port sctop to use python module
From: Ian Rogers <irogers@google.com>
To: acme@kernel.org, adrian.hunter@intel.com, james.clark@linaro.org, 
	leo.yan@linux.dev, namhyung@kernel.org, tmricht@linux.ibm.com
Cc: alice.mei.rogers@gmail.com, dapeng1.mi@linux.intel.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, mingo@redhat.com, peterz@infradead.org, 
	Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_174920_584370_F9DB6D8C 
X-CRM114-Status: GOOD (  17.17  )
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

Port sctop.py from tools/perf/scripts/python/ to tools/perf/python/,
refactoring it to use a class-based structure (SCTopAnalyzer) and the
perf.session API.

Also add support for live mode using the LiveSession helper when no
input file is specified, with a fallback strategy for tracepoint names
(raw_syscalls:sys_enter or syscalls:sys_enter) to support different
systems.

Assisted-by: Gemini:gemini-3.1-pro-preview
Signed-off-by: Ian Rogers <irogers@google.com>
---
v2:

 - Fixed Missing Final Batch: Extracted the printing logic into a
   dedicated print_current_totals() method. Updated
   print_syscall_totals() to call this method one last time after the
   stop_event is set, ensuring that events accumulated since the last
   interval are not dropped.
 - Fixed Offline Mode Intervals:
   - Added an offline flag to SCTopAnalyzer to distinguish between
     live and offline modes.
   - In offline mode ( -i option), instead of relying on a wall-clock
     timer in a background thread, process_event() now checks the
     sample timestamp ( sample.time ). It triggers a print when the
     trace time advances by the specified interval.
   - Only starts the background thread when running in live mode.
   - Ensured the final batch is printed in the finally block for
     offline mode.
---
 tools/perf/python/sctop.py | 174 +++++++++++++++++++++++++++++++++++++
 1 file changed, 174 insertions(+)
 create mode 100755 tools/perf/python/sctop.py

diff --git a/tools/perf/python/sctop.py b/tools/perf/python/sctop.py
new file mode 100755
index 000000000000..d7ac922da510
--- /dev/null
+++ b/tools/perf/python/sctop.py
@@ -0,0 +1,174 @@
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
+
+        if syscall_id == -1:
+            return
+
+        if hasattr(self, 'session') and self.session:
+            comm = self.session.process(sample.sample_pid).comm()
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


