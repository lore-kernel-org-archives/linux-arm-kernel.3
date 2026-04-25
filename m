Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F144FFF8863
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Apr 2026 22:45:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=22aR7BdMkfc4F5hxQy/Qmu6pnO70TcMwJUmCFfE13QY=; b=JNdqlXyrbnY3PQwHHkLYfc0qIn
	nf4c1x6j9Ek5d/ilJxzc2aBvRg3z0Xz1cQHPUdgcSSGkVfO8zCmJsrlzbxgahZwmvMCKFY4IkeMap
	vRIvbqWNms9jzWcx+y/H23p36iMoiYe8bK3F7GwmUXZR4MAaFnqWvpkJg7bpsDGu+1W+Xuu+Ol+ip
	s1EGIh7JotoHypkcBsx1ybptU46Utie6EaSCgsx9cmdsK2fDZ1rpcl/RzVbVuHiEWSmIyOBrN244Q
	G2c+aqlGk5agd8cBBO0qieyjbc7B+2LR/1nQ3PEkq5ZzwSgfxiuonXf+WCECd8xzsekxO01MIOh7/
	wRaRnlJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGlkl-0000000EwSJ-2LsY;
	Sat, 25 Apr 2026 22:45:35 +0000
Received: from mail-dl1-x124a.google.com ([2607:f8b0:4864:20::124a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGlkU-0000000EwGV-33eu
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Apr 2026 22:45:27 +0000
Received: by mail-dl1-x124a.google.com with SMTP id a92af1059eb24-12c20d5d7f4so43618214c88.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 25 Apr 2026 15:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777157116; x=1777761916; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=22aR7BdMkfc4F5hxQy/Qmu6pnO70TcMwJUmCFfE13QY=;
        b=Bkcz4KDjNunAcM/ARl9W5Vdba43nNYa4UZe6XPkqDG7Is1HHSQaGCfYYpd2YWmI/oE
         NNw1E37PECfmfXj7eHzHQzMTdB/o6sp/8dUE6Gxml/i1HoeVqKHwFMbSgygKzMFojWKS
         64+41vLFdz4LdOmS54OL4HjRkkh7dJdl9q5wt2r/GdomNSF4uxooG7yeZvljn/h6GsV/
         Shz78PoDnICBm7xmqFajAhtw47JH3Ub6SOilh0wU5zW3VJnJylAYzQsbqrbW5fv0AjLy
         SnjJ1fX/b+4qRaMX18VAHMOXHzVyqFDqXvm42/njkzpUH3NsUEXfnBhCjHvg1DyUgG+W
         qmYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777157116; x=1777761916;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=22aR7BdMkfc4F5hxQy/Qmu6pnO70TcMwJUmCFfE13QY=;
        b=MgxBR8M0dkAekxJQH3ax/F+O+OdsEdwq60JEzkn0tL7S2gBrt6myq5Xe9L9mEYH7Jg
         +2tAxYUaMuZsU8wnWQxhAGNJbOS184XOa0jjnopvf0k3jPXS0ICadRARp/3ZAv9BYVlP
         fjEc1b98YsBSDQSZ3TkAnbfMtRKJ6ODWOYAJPhcmkahmATRYVs6RIJ9QLNnBxGjcqEYG
         Vch/VuqmJMSIZ4k6RBO6/SzNeVcq0O+hMdiklFooKJo5+JE1hbS6QreVh7pseuHJVmFT
         vl6LS4zn4fdiJ1AOh2j2A/7GL0qbkDRanEPyaKOVSdRKBi5qTpF90k98ZirJIxV5VhJa
         rCwA==
X-Forwarded-Encrypted: i=1; AFNElJ9eo3n61jFLurEE2O1s/NpUb4eMNZ2dcWHh19WJIhEEevuiTTpCMShmk/ztfJYrlsZspVunn9tiBSh477iVOjwo@lists.infradead.org
X-Gm-Message-State: AOJu0YwCJ0tYzV0ddE3iIZZNODZtvQXVrzPTmh5qSUt8ZSBBlzMjvNjP
	kRKVh8ACE9jskxfNaNxZXT3BtLtf1JsIgE5JA4GZlY5HbE5B4gQ8wgS1ZkNORB6ybXkWOniE9oC
	rJIxfbuaFOw==
X-Received: from dyhd3.prod.google.com ([2002:a05:7300:8283:b0:2e2:b79e:ed06])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:f193:b0:2da:1874:f39c
 with SMTP id 5a478bee46e88-2e4657728eamr20326591eec.12.1777157116025; Sat, 25
 Apr 2026 15:45:16 -0700 (PDT)
Date: Sat, 25 Apr 2026 15:44:51 -0700
In-Reply-To: <20260425224503.170337-1-irogers@google.com>
Mime-Version: 1.0
References: <20260425174858.3922152-1-irogers@google.com> <20260425224503.170337-1-irogers@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260425224503.170337-5-irogers@google.com>
Subject: [PATCH v7 47/59] perf failed-syscalls: Port failed-syscalls to use
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
X-CRM114-CacheID: sfid-20260425_154518_958113_4EBE5617 
X-CRM114-Status: GOOD (  14.82  )
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


