Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42453FF8866
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Apr 2026 17:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=22aR7BdMkfc4F5hxQy/Qmu6pnO70TcMwJUmCFfE13QY=; b=VXMJHNOJlVT9ETjbukHdJ6x74i
	9aczW7Ize+6msKY7zq+kpOQwLcED266sQuC6EDgJ+jHqUHiPvFZIRve2rNyq2YTBaXmWj7yucVXy1
	vNZLBu1nVD61GefJhK+CbzpkTyoxPO2OxCirSDD3sBGia/GGePpvHPfktW+BcOQGhhQXlD30JMFDf
	6x+dbnZt6d85p3/B5gvwxXTjVqOhUDLS6KSgN+puFssZUHq+7lRgtr5bwcVBkg7cYkgIofLxaQaaO
	wJfIUVnE43aSndkIFWc7iL9CfutjZJ8R2JyDiM7YPgmavT0jrK7M1NZzg+OUH4mlAZv52p4rbKqdJ
	+zI05Fjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGhBX-0000000EfHB-3UNN;
	Sat, 25 Apr 2026 17:52:55 +0000
Received: from mail-dy1-x134a.google.com ([2607:f8b0:4864:20::134a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGh9J-0000000EdfI-1XTz
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Apr 2026 17:50:51 +0000
Received: by mail-dy1-x134a.google.com with SMTP id 5a478bee46e88-2d93379001eso19590402eec.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 25 Apr 2026 10:50:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777139435; x=1777744235; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=22aR7BdMkfc4F5hxQy/Qmu6pnO70TcMwJUmCFfE13QY=;
        b=Af7BWW5HpHtPkrpMajOuDjRs0VWLkIljd5xYidTp91pUn2ma6vIOikuZmH0o5/P5V2
         9PCmJcgpv/nnNqHwrqdJ+IkZLpyg99+XXgFLVdH4tNBk8Jae0nI8QCgJdNiS2TeVDpde
         U4yvpxNjRcwbWlW5TxrHnPCjGWRJlWuylcwj8/X28kyIkpN7cL2CctOj1Uvf4J43WjCZ
         Xc6wjpLujz8NbTzLv3ZsQWH7R2ssy29sVrRjPJzU//C8HY0wIqRmLlMyDs9pu9JNcRhN
         f9UbHyPFUnZbMICHRDYsKIPxNu6xsDNGKPmAW/hgyTjH13PvMc8xR6wJw5KL/dhDuLWv
         jzXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777139435; x=1777744235;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=22aR7BdMkfc4F5hxQy/Qmu6pnO70TcMwJUmCFfE13QY=;
        b=O9Wsg8x/d/bJ2KwsoriLgKEAI2EndLmo0u/hcv4qE1GUb4QEyuD0GuSl3Sj6peRRy0
         IZMWsej8I7TRknJU4OvgJ0bEJg/RpKmlWrQPvl7WtQmgiu/cQ+BIYeVyouC1QQ6m1Cpf
         Bn15USBbFvu6jidiO3JM8/2+APvaSlaKjlDFyxF8mcmhIln4/J/MqN70L8d7cpuHW1T/
         AejYgSRSOy9/ItNKz0O5ONZexHvwiNdX7y/M1GZC+HDuMIk+/ff6FaHC1iq/Um4iX5jw
         cM+glQVhRpQULh7h7OAbWVysLTfARcbRgNGBhcY2fdTM82u74h6VHHd+VvWbtj+LynCG
         13Hg==
X-Forwarded-Encrypted: i=1; AFNElJ8ZDjl02Gk42naIdhsStEEc6ubJFrgSTnUgXiV5LgIztutVxJ2bSYT1UbHIamihT9zEwqoNJd+Xfc7ZzS4VNNOu@lists.infradead.org
X-Gm-Message-State: AOJu0YxOTOEZqTAbHfmgUBM2XUm9XSM/XI9vZwA3IWQBzWELIHXBDN4G
	9yapjpasHIsmsn1EPFX8U+yRVTwxOzWRoLglgjEowW9kWCsykY5yU9qEDhs9k3On7bOwkqiYKWn
	FYwaJf8u/eA==
X-Received: from dyji40.prod.google.com ([2002:a05:7300:7a28:b0:2d8:dd18:baee])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7301:6587:b0:2ea:6361:8981
 with SMTP id 5a478bee46e88-2ea63618b8bmr14661160eec.22.1777139435077; Sat, 25
 Apr 2026 10:50:35 -0700 (PDT)
Date: Sat, 25 Apr 2026 10:48:45 -0700
In-Reply-To: <20260425174858.3922152-1-irogers@google.com>
Mime-Version: 1.0
References: <20260424164721.2229025-1-irogers@google.com> <20260425174858.3922152-1-irogers@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260425174858.3922152-48-irogers@google.com>
Subject: [PATCH v6 47/59] perf failed-syscalls: Port failed-syscalls to use
 python module
From: Ian Rogers <irogers@google.com>
To: acme@kernel.org, adrian.hunter@intel.com, james.clark@linaro.org, 
	leo.yan@linux.dev, namhyung@kernel.org, tmricht@linux.ibm.com
Cc: alice.mei.rogers@gmail.com, dapeng1.mi@linux.intel.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, mingo@redhat.com, peterz@infradead.org, 
	Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260425_105037_554334_65322E64 
X-CRM114-Status: GOOD (  14.93  )
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

Port the legacy Perl script failed-syscalls.pl to a python script
using the perf module in tools/perf/python.

The new script uses a class-based architecture and leverages the
perf.session API for event processing, making it a standalone script
that reads perf.data files.

It filters for sys_exit events, checks for failed syscalls (where
return value ret < 0), and aggregates counts per command name.

Complications:
- The script is designed for file-based processing using perf.session.
- pylint warns about the module name not being snake_case, but it is
  kept for consistency with the original script name.

Assisted-by: Gemini:gemini-3.1-pro-preview
Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/python/failed-syscalls.py | 78 ++++++++++++++++++++++++++++
 1 file changed, 78 insertions(+)
 create mode 100755 tools/perf/python/failed-syscalls.py

diff --git a/tools/perf/python/failed-syscalls.py b/tools/perf/python/failed-syscalls.py
new file mode 100755
index 000000000000..c3b58664eb57
--- /dev/null
+++ b/tools/perf/python/failed-syscalls.py
@@ -0,0 +1,78 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: GPL-2.0
+"""Failed system call counts."""
+
+import argparse
+from collections import defaultdict
+import sys
+from typing import Optional
+import perf
+
+class FailedSyscalls:
+    """Tracks and displays failed system call totals."""
+    def __init__(self, comm: Optional[str] = None) -> None:
+        self.failed_syscalls: dict[str, int] = defaultdict(int)
+        self.for_comm = comm
+        self.session: Optional[perf.session] = None
+        self.unhandled: dict[str, int] = defaultdict(int)
+
+    def process_event(self, sample: perf.sample_event) -> None:
+        """Process sys_exit events."""
+        event_name = str(sample.evsel)
+        if not event_name.startswith("evsel(syscalls:sys_exit_") and \
+           not event_name.startswith("evsel(raw_syscalls:sys_exit_"):
+            return
+
+        try:
+            ret = sample.ret
+        except AttributeError:
+            self.unhandled[event_name] += 1
+            return
+
+        if ret >= 0:
+            return
+
+        pid = sample.sample_pid
+        assert self.session is not None
+        try:
+            comm = self.session.find_thread(pid).comm()
+        except Exception: # pylint: disable=broad-except
+            comm = "unknown"
+
+        if self.for_comm and comm != self.for_comm:
+            return
+
+        self.failed_syscalls[comm] += 1
+
+    def print_totals(self) -> None:
+        """Print summary table."""
+        print("\nfailed syscalls by comm:\n")
+        print(f"{'comm':<20s}  {'# errors':>10s}")
+        print(f"{'-'*20}  {'-'*10}")
+
+        for comm, val in sorted(self.failed_syscalls.items(),
+                                key=lambda kv: (kv[1], kv[0]), reverse=True):
+            print(f"{comm:<20s}  {val:10d}")
+
+    def run(self, input_file: str) -> None:
+        """Run the session."""
+        self.session = perf.session(perf.data(input_file), sample=self.process_event)
+        self.session.process_events()
+        self.print_totals()
+
+def main() -> None:
+    """Main function."""
+    parser = argparse.ArgumentParser(description="Trace failed syscalls")
+    parser.add_argument("comm", nargs="?", help="Filter by command name")
+    parser.add_argument("-i", "--input", default="perf.data", help="Input file")
+    args = parser.parse_args()
+
+    analyzer = FailedSyscalls(args.comm)
+    try:
+        analyzer.run(args.input)
+    except IOError as e:
+        print(e, file=sys.stderr)
+        sys.exit(1)
+
+if __name__ == "__main__":
+    main()
-- 
2.54.0.545.g6539524ca2-goog


