Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC7B5FF885A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Apr 2026 22:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nQeNxtOSoOXwV2zRr64LvO5u7apubipAzZoDUg3KnRw=; b=Yd+7f+ekzmyyI7VDsDwWT49MLR
	23QOP4FEaKuQBQLRAg+irHqLhBZ8xcnXwHS3eFZq9WcvUghlkrb7/05tczDORo2hmytZzwiomxjKh
	AKYcYho7Jk9L+AJUlKxln5a7iYDLFIT7M57TWDlXI3g4M+PI6baj2aM90xmp7PtheQ+LiMulmd6ba
	8S9B7pV+w2JiNqW+C8e5JI/80joet9ZJvJ86vgz7OVeoX6LX60XvUw/sp67gWfXUcmEccYygI3NTH
	pTP3Uu0RkspnXYZPTNyt6UfOoKmePhPwxnk1gtXEu8zrKsk3jMNQv9xajEP5vkuydxk4e4J6woDXR
	CzQrRurA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGlkh-0000000EwQ0-2Smx;
	Sat, 25 Apr 2026 22:45:35 +0000
Received: from mail-dl1-x1249.google.com ([2607:f8b0:4864:20::1249])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGlkP-0000000EwDW-2R0l
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Apr 2026 22:45:24 +0000
Received: by mail-dl1-x1249.google.com with SMTP id a92af1059eb24-12c21dbc9c1so33844433c88.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 25 Apr 2026 15:45:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777157112; x=1777761912; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=nQeNxtOSoOXwV2zRr64LvO5u7apubipAzZoDUg3KnRw=;
        b=IlrzUzULJpwHefnMfn4BhPOGsTOqnPIVzzNUtV04vBIZYuaK8Ac3jfbKRfd67WOsi6
         f8zfQHE02VwP2MXfutEjLPHK1IVgPJUKJNYqeyB2Q8ItrzWqMAd5kL55g7DHvTSkLZLz
         uDm0708Xl3pnfqqEBSrAK97hCN/ROvZ1R15qNmGbKbZ0oInmwEgIS3q9rQd4/RcE2Qoi
         KMpYepaA2XoOWpy3/YWSr5wYuxAv8qOJkRFR9In3QwCeydqCzKfNt3FN9FJ14Dpt5O52
         d4o4Ukd6ynEkf2cm1Ho/40yKUJfjlaKDvnjDTeheX7ouNPU/6ieqO8OkM3iZyo800DLK
         ryGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777157112; x=1777761912;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nQeNxtOSoOXwV2zRr64LvO5u7apubipAzZoDUg3KnRw=;
        b=Nbm0DSCYfhuCaIni61EWrTJNkYadVJqCjRt/6WvikMuTWXhFws+kidq9gIqSEKyatv
         Q5RiFdEsFd4oBeZc9tXfQTm52W+ETE6MePxD1MhMpHxjYRNyZpQ0toa2DQU1jVuoH5FT
         g0mMqKfxfkYBG8Fu/w2KQNN7ZS/N9odDDNuUwaXS4An1DyeTx2ZIeK94LTb4duPwx73K
         v/y7tEUznR6v1Xt0W9/cQTIYBrGDEYhXPzPDzRITmFEfNi9Gq/nu8CN5ikVWIe4bToQ6
         4OCzGzZS8/xgGo6T+HpbC1Zvz3IjI8tQVfzHWV/wpYEJdDbnYpKElNS/H57TgTf502np
         w0zw==
X-Forwarded-Encrypted: i=1; AFNElJ+7Pm0wC6NRK0xv7ikt0hMMX09NYi8WLzGn99cEn6SddTHqWDQl/2sd7Wwz33Ut+2sDZT/cPlVThaeDdjBCtEiR@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+L3X3TOewt9Bj4nAxfAHHkUKnFDdCzpLZMt138qBxjGR1pS13
	kjAKyHxMWYmtSXSrLBJNzHhHZQDWMKxtLj9t0FxD49ZItQmKHLqtbVVDmneiG7kfCy4W0w52tPi
	5P1JlDlbLwg==
X-Received: from dlbur21-n2.prod.google.com ([2002:a05:7022:ea55:20b0:12d:c516:f51])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:6728:b0:12b:ec67:3529
 with SMTP id a92af1059eb24-12c73f781e0mr20677481c88.14.1777157111966; Sat, 25
 Apr 2026 15:45:11 -0700 (PDT)
Date: Sat, 25 Apr 2026 15:44:49 -0700
In-Reply-To: <20260425224503.170337-1-irogers@google.com>
Mime-Version: 1.0
References: <20260425174858.3922152-1-irogers@google.com> <20260425224503.170337-1-irogers@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260425224503.170337-3-irogers@google.com>
Subject: [PATCH v7 45/59] perf stackcollapse: Port stackcollapse to use python module
From: Ian Rogers <irogers@google.com>
To: acme@kernel.org, adrian.hunter@intel.com, james.clark@linaro.org, 
	leo.yan@linux.dev, namhyung@kernel.org, tmricht@linux.ibm.com
Cc: alice.mei.rogers@gmail.com, dapeng1.mi@linux.intel.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, mingo@redhat.com, peterz@infradead.org, 
	Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260425_154513_628161_25EDBF4D 
X-CRM114-Status: GOOD (  16.32  )
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

Modernize the legacy stackcollapse.py trace script by refactoring it
into a class-based architecture (StackCollapseAnalyzer).
The script uses perf.session for event processing and aggregates call
stacks to produce output suitable for flame graphs.

Assisted-by: Gemini:gemini-3.1-pro-preview
Signed-off-by: Ian Rogers <irogers@google.com>
---
v2:

 - Fixed Callchain Check: Replaced hasattr(sample, "callchain") with
   getattr(sample, "callchain", None) and checked if it is not None .
   This avoids attempting to iterate over None when a sample lacks a
   callchain, which would raise a TypeError.
 - Fixed Comm Resolution: The code already used
   self.session.process(sample.sample_pid).comm() to resolve the
   command name using the session object (if available), avoiding the
   missing comm attribute on perf.sample_event.
 - Code Cleanup: Broke a long line in process_event to satisfy pylint.
---
 tools/perf/python/stackcollapse.py | 126 +++++++++++++++++++++++++++++
 1 file changed, 126 insertions(+)
 create mode 100755 tools/perf/python/stackcollapse.py

diff --git a/tools/perf/python/stackcollapse.py b/tools/perf/python/stackcollapse.py
new file mode 100755
index 000000000000..996c73246ebc
--- /dev/null
+++ b/tools/perf/python/stackcollapse.py
@@ -0,0 +1,126 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: GPL-2.0
+"""
+stackcollapse.py - format perf samples with one line per distinct call stack
+
+This script's output has two space-separated fields.  The first is a semicolon
+separated stack including the program name (from the "comm" field) and the
+function names from the call stack.  The second is a count:
+
+ swapper;start_kernel;rest_init;cpu_idle;default_idle;native_safe_halt 2
+
+The file is sorted according to the first field.
+
+Ported from tools/perf/scripts/python/stackcollapse.py
+"""
+
+import argparse
+from collections import defaultdict
+import sys
+import perf
+
+
+class StackCollapseAnalyzer:
+    """Accumulates call stacks and prints them collapsed."""
+
+    def __init__(self, args: argparse.Namespace) -> None:
+        self.args = args
+        self.lines: dict[str, int] = defaultdict(int)
+
+    def tidy_function_name(self, sym: str, dso: str) -> str:
+        """Beautify function names based on options."""
+        if sym is None:
+            sym = "[unknown]"
+
+        sym = sym.replace(";", ":")
+        if self.args.tidy_java:
+            # Beautify Java signatures
+            sym = sym.replace("<", "")
+            sym = sym.replace(">", "")
+            if sym.startswith("L") and "/" in sym:
+                sym = sym[1:]
+            try:
+                sym = sym[:sym.index("(")]
+            except ValueError:
+                pass
+
+        if self.args.annotate_kernel and dso == "[kernel.kallsyms]":
+            return sym + "_[k]"
+        return sym
+
+    def process_event(self, sample: perf.sample_event) -> None:
+        """Collect call stack for each sample."""
+        stack = []
+        callchain = getattr(sample, "callchain", None)
+        if callchain is not None:
+            for node in callchain:
+                stack.append(self.tidy_function_name(node.symbol, node.dso))
+        else:
+            # Fallback if no callchain
+            sym = getattr(sample, "symbol", "[unknown]")
+            dso = getattr(sample, "dso", "[unknown]")
+            stack.append(self.tidy_function_name(sym, dso))
+
+        if self.args.include_comm:
+            if hasattr(self, 'session') and self.session:
+                comm = self.session.find_thread(sample.sample_pid).comm()
+            else:
+                comm = "Unknown"
+            comm = comm.replace(" ", "_")
+            sep = "-"
+            if self.args.include_pid:
+                comm = f"{comm}{sep}{getattr(sample, 'sample_pid', 0)}"
+                sep = "/"
+            if self.args.include_tid:
+                comm = f"{comm}{sep}{getattr(sample, 'sample_tid', 0)}"
+            stack.append(comm)
+
+        stack_string = ";".join(reversed(stack))
+        self.lines[stack_string] += 1
+
+    def print_totals(self) -> None:
+        """Print sorted collapsed stacks."""
+        for stack in sorted(self.lines):
+            print(f"{stack} {self.lines[stack]}")
+
+
+def main():
+    """Main function."""
+    ap = argparse.ArgumentParser(
+        description="Format perf samples with one line per distinct call stack"
+    )
+    ap.add_argument("-i", "--input", default="perf.data", help="Input file name")
+    ap.add_argument("--include-tid", action="store_true", help="include thread id in stack")
+    ap.add_argument("--include-pid", action="store_true", help="include process id in stack")
+    ap.add_argument("--no-comm", dest="include_comm", action="store_false", default=True,
+                    help="do not separate stacks according to comm")
+    ap.add_argument("--tidy-java", action="store_true", help="beautify Java signatures")
+    ap.add_argument("--kernel", dest="annotate_kernel", action="store_true",
+                    help="annotate kernel functions with _[k]")
+
+    args = ap.parse_args()
+
+    if args.include_tid and not args.include_comm:
+        print("requesting tid but not comm is invalid", file=sys.stderr)
+        sys.exit(1)
+    if args.include_pid and not args.include_comm:
+        print("requesting pid but not comm is invalid", file=sys.stderr)
+        sys.exit(1)
+
+    analyzer = StackCollapseAnalyzer(args)
+
+    try:
+        session = perf.session(perf.data(args.input), sample=analyzer.process_event)
+        analyzer.session = session
+        session.process_events()
+    except IOError as e:
+        print(f"Error: {e}", file=sys.stderr)
+        sys.exit(1)
+    except KeyboardInterrupt:
+        pass
+
+    analyzer.print_totals()
+
+
+if __name__ == "__main__":
+    main()
-- 
2.54.0.545.g6539524ca2-goog


