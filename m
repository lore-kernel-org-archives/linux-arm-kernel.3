Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97705FF886F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 07:23:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nQeNxtOSoOXwV2zRr64LvO5u7apubipAzZoDUg3KnRw=; b=vDrdqIQROv7H6gAM3YVIBgcHye
	kurzKBzeNBEqIhmOBWQUhBNVoOuOJdk9dQBzQg6E3WTHsFxEV0mZh7unc1oluXoANb3FlPI8Cg7sq
	SmrLIcPW4qarymp2w3ugUS82Td9YQiBiRqX+dAfGX4suCulS396/WlEMjA6jk1RQ52KEQYeB7pLKj
	zq+Pj6e9dbOrJVywDtvjSoXPgBneMGVJeADJvlsuCYbXHHsFucnh8jsZ0Rba9F24vPEsTr6wgPXTM
	lrybOocxEh2uZgPJUE8Ha0gLmgF1cajHTc14lX7vhW6ZiG2wpn/iwgn7TEqY3HsGWRp+025puG7kf
	JpmsNKjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHcmp-00000000kBM-1Iyp;
	Tue, 28 Apr 2026 07:23:15 +0000
Received: from mail-dy1-x1349.google.com ([2607:f8b0:4864:20::1349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHckU-00000000hid-3ZvN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 07:21:08 +0000
Received: by mail-dy1-x1349.google.com with SMTP id 5a478bee46e88-2c0f6593ef5so14539074eec.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 00:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777360850; x=1777965650; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=nQeNxtOSoOXwV2zRr64LvO5u7apubipAzZoDUg3KnRw=;
        b=KTFs91AzYEQPAufwBMGq/7h1dXVMi/N+mAVBB8MGiYHuMlqayzz97UFsb59R+d+Zn4
         Hbo3KjuwU3XEmb/eDnFpmWz5JB+JkJ/QP+klDUKpy/atoHLqMKtEplFUadlA2clu+mEA
         RhFK/aujRtDIft3+PiYgq8Xh7SUF2cWtq+lvQ/8iGNzwhz3rdPzMkxqMkIW0FsovSyCb
         Rqc9chuKyrJrs6mE0jN/kNGF7/jID5jWLk3cpKPL4XCx4ryBN1Jb8FoBExCxyVJvLkwk
         B0mQMnHzwxkm9YLVA5bu2hOmstHg23jwuvjLPiGn616fRj+xXw45oPGn5r5dX60KsEkC
         9/wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777360850; x=1777965650;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nQeNxtOSoOXwV2zRr64LvO5u7apubipAzZoDUg3KnRw=;
        b=YiZTqMKavLp89f3GV/jzlb+v1wdxDtCHYnk7Tn+Cq9X9Z8ndX/d3RtRaD20fILyONB
         4dDIFR/tSDPJSOi65LvSDsXTvpzJon36qJuGz2k39V42eDs+bWfCXd/NDVVEyFjKVDFC
         J5mz7ukx/Svr5+txKfa931bpgh4XZIvFljlTDrlmA8H77a7BP2y2TgUgOQm/Ds5pslS3
         dK5uSjfENjgvXN8NzgtKE+0NBFtJH8FgzHV7WmJvjyyC720gYa591K0lpvC9Bv7BLfGT
         krEYTAWI1rqWaAMn90LPiUDnOJ5dHc3lWE74E7KQWHXdZr2VpUq7et9hzmM3v2cbFAfF
         fNVw==
X-Forwarded-Encrypted: i=1; AFNElJ+bwUReflHWeovPINLvGfeFJvVJ4YF3yqwrlDKiFrXpiMVCk7NGIs3wZ3FVNYHw5Vrc8OR/8dgkBI6C1L1Dj494@lists.infradead.org
X-Gm-Message-State: AOJu0Ywa3Ix44hdq/W1vwTw9iEBph/FrbSekxrf1zTPOl6PmhS+VrQSD
	iUjkwU/OGVoTzg6z89KYe4Ei1FsHS9xZlYqQRVEC8t2gZcoHTbvujXeoANhyfruv/YkqNCKiWf/
	McdmyhOWzGw==
X-Received: from dlbqc1.prod.google.com ([2002:a05:7023:a81:b0:12c:87ba:191d])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:251f:b0:12d:de3f:d84b
 with SMTP id a92af1059eb24-12dde3fdd81mr457375c88.36.1777360849585; Tue, 28
 Apr 2026 00:20:49 -0700 (PDT)
Date: Tue, 28 Apr 2026 00:18:50 -0700
In-Reply-To: <20260428071903.1886173-1-irogers@google.com>
Mime-Version: 1.0
References: <20260425224951.174663-1-irogers@google.com> <20260428071903.1886173-1-irogers@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260428071903.1886173-46-irogers@google.com>
Subject: [PATCH v8 45/58] perf stackcollapse: Port stackcollapse to use python module
From: Ian Rogers <irogers@google.com>
To: acme@kernel.org, namhyung@kernel.org
Cc: adrian.hunter@intel.com, alice.mei.rogers@gmail.com, 
	dapeng1.mi@linux.intel.com, james.clark@linaro.org, leo.yan@linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, mingo@redhat.com, peterz@infradead.org, 
	tmricht@linux.ibm.com, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_002050_907403_28B58976 
X-CRM114-Status: GOOD (  17.26  )
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


