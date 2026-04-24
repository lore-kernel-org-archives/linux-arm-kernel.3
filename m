Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0EF5FED3F1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Apr 2026 16:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eIATP8XFfjDQHugGpOui2zhnlJg5I0nHGF4GsUacwsg=; b=gyodyVdgYZb3oMKZZShWcjtS/S
	HPVlSAeCyU1AspKeXDXLEmNmw8IFdm4qhOVq5JVeyzSfZ0S8dB0w3vY+GfIf/3lNaSl2g78FdVnD7
	f8SuyxkwQp8EcqsXDXo3tSBUpwRr2dX22Ta6a1tukZO0vDJvYxp0CuXj8nTjZNDwh72Zp9AHYaj3m
	14uKys1q0Bwy374zVaIwcr1Y8wdmGxxBRnQU+Sdiooja2J47FNzCntEDj33Tk/MWibRncAr7x/r3O
	P4Ww7g4KLKP3D2bqDrCtJuLNXkxK/G7xteU/jWg5PVZAfQmHG1gi/1Z88xJn2d9qChRlDzXuAgEJe
	11f/DcJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGJjk-0000000DW4g-48Io;
	Fri, 24 Apr 2026 16:50:41 +0000
Received: from mail-dl1-x1249.google.com ([2607:f8b0:4864:20::1249])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGJiY-0000000DUjk-1etV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Apr 2026 16:49:33 +0000
Received: by mail-dl1-x1249.google.com with SMTP id a92af1059eb24-12c21dbc9c1so29140268c88.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Apr 2026 09:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777049364; x=1777654164; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=eIATP8XFfjDQHugGpOui2zhnlJg5I0nHGF4GsUacwsg=;
        b=aaMz3w/T2vj56RarTx887lQ8/mrtGYPbGBBzH4U2l0lTSgXyxRixVnetiv4eRUXU5u
         jP3qCQulEgj8+zV5SsjUGKDruSDziZevzFO+oPjAjhNvc3pgTAcas0u9/mMVdsctAbdC
         6Wx4cf4Qn+zFi8kdYH57mJd4lEQX0AgctCTvXFrZEoHzdM4aXzfbXppOOZAHuHhVizDP
         Z0pLzgBKeJedRGaICY02thMVTQwoEK/A3DdyzTckHdbjWzOyMMJGIGI5toB5xtn2GkNG
         u2y87xmsI62wDT5y8M0Prbg8GIUtheb9PRwoXp9M1rFsRVV/k4b+93vn6+dM/X8rCoqe
         M8pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777049364; x=1777654164;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eIATP8XFfjDQHugGpOui2zhnlJg5I0nHGF4GsUacwsg=;
        b=hSM04zuvDLhjA1xSG8NW36guah0VCo8/m2rw2SJRYI1g21af+w9pnbBy4Zi0lnwoFU
         mNUNQzl1BiocrR17AztbUQ2twN/1HkMIsTvofRoj52+2nWwZV7lg/K+Jt5onkQV/nv1w
         TaQM4t9BoWjFiLCjBxSedy577RiSRKAeppr4v6oi8y3+3rhSGTt+Qa/+JhUSTnukP1vr
         9U/mpmsfpzU6/SzCpJML/rKf+EJU08+UdwiA29W65o/Lv95SnOZ+GGQShEwSGL6utxvb
         4/4FUn29Io15ChufXq1qC5bY8WvUmONP+k1dVrGikE0GRMsjCjcJlbTCxGzI26XpNYpl
         w/5w==
X-Forwarded-Encrypted: i=1; AFNElJ/m5fEuZQZRYsa3myj3X6ejb35ulxH8KtL3+E7ssOQcoIG6i0ZdCdDa2nvZAfo14+ijFUf7RGezAY9pcy99SRXE@lists.infradead.org
X-Gm-Message-State: AOJu0YzNEcakRj3kPXPwYtAH4wdAMwTHrus7OzGwVMrS9qjM66t0LlYB
	6hfJQ4jMaiaZho9Eb+ofWNZkmEfrp/uhMm/gpsG+1GHKDJrXCdoez9R8PQJkHOZ2GwiKzDPAaCJ
	M7Hj1+tBrBA==
X-Received: from dlaj3.prod.google.com ([2002:a05:701b:2803:b0:12d:b48e:8597])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:eac8:b0:128:d714:3ca6
 with SMTP id a92af1059eb24-12c73f7167cmr19495331c88.12.1777049364049; Fri, 24
 Apr 2026 09:49:24 -0700 (PDT)
Date: Fri, 24 Apr 2026 09:47:09 -0700
In-Reply-To: <20260424164721.2229025-1-irogers@google.com>
Mime-Version: 1.0
References: <20260423163406.1779809-1-irogers@google.com> <20260424164721.2229025-1-irogers@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260424164721.2229025-48-irogers@google.com>
Subject: [PATCH v5 47/58] perf failed-syscalls: Port failed-syscalls to use
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
X-CRM114-CacheID: sfid-20260424_094926_683999_7303B7E0 
X-CRM114-Status: GOOD (  14.88  )
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
index 000000000000..178c1458430a
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
+            comm = self.session.process(pid).comm()
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


