Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 709E5FED3F0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Apr 2026 16:49:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2j+/G/gLHQ7NZrTXlwU5UyQ2EY4+32u+JcYzqEO/fuc=; b=eqmMM5NoJ21Icjl2THfD+WDUZV
	x0XPqqopHOlXY57xwGeSdWtDi4s67v/VTAl23vX1ZaY3BGhWt4YvvC5phpF71fGqUuA/FqRXkvbH/
	xDTz6Uo0gMeydFR+vD/J0Dxg14ybXCKWT4orckdEfRUvDnpmOdFH6bMyA9AEpAZckCj0pRDqIGXZH
	uKXb7ObaJyb2ZExZBwI1NtsnttD2QzuXSN00N7V9TmBiwj4iqDKAEj0MoWm7pSMkqv7NR/1qni7I4
	W6RUZ1+or3cl6mEW3jQuWY2HIt4ANYNp6UnHOVyhBLDiVxYEFWYLIhbm/Y00ixuTkM/HXWIV8epcG
	96ZV4PKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGJiC-0000000DUOT-3zAn;
	Fri, 24 Apr 2026 16:49:04 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGJhk-0000000DTqm-1dcX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Apr 2026 16:48:40 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-2b24308165dso104208105ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Apr 2026 09:48:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777049315; x=1777654115; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=2j+/G/gLHQ7NZrTXlwU5UyQ2EY4+32u+JcYzqEO/fuc=;
        b=WfQEIQCXMZaJSSphBOUkzz2JOkHf438CkNjdN1Q0HZZx91c0fTDgSf054lE4snnt6A
         tQtwPy9sfFqeligMxknwT4coMU1HYUalnemjJv+8WC6T5X9sIeC+BexGPPaqGQUv+NMP
         OmKODp7hOiR+GRDpbqimWTmLmdfQ9tJ8QX6KtRVZ5YwJKPQ3w/nMcN8OJyte+FXpN3M6
         Oqj4TbzsiojjA2U3mrQdq/rGYohFnRtshO60DjPcpRJ44QGo/YSKgJcr7/yBxHUGyjr9
         9KHxzkCYLfwDZavFFqwUSTNFqPvkDenQVWEctbPPU1Bk26/X7XztmbHdplCUyDzrNrCg
         L8CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777049315; x=1777654115;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2j+/G/gLHQ7NZrTXlwU5UyQ2EY4+32u+JcYzqEO/fuc=;
        b=Mbfh7wcnf3wo75f+zvyT+MlvYYKVvwzordOaL/288Ji9e8Vl/xbF6efx1lruthAXb7
         9UV1okQ3DVflR9LtZ93uRAjSBrWpN/XS81sIu7YJ04FASSj9FF5lP9gMKTSXtydoFkBk
         fnScbjuVjgH/cZBTb8FRctfw/U92+GnnUnMquOKJHux3J9zK8y8twUmTUqmxyNS1Ccwh
         m/Wce4C2qGBOq7+4es3pphPjR383F839SgJWuMjsZ3pFVAJpFtiqA7DBR/yzW1vVWAnv
         bPRwNqHElnF+CLalp0owui5WXq+Ci9hlR091EGGsG+hjf9k/diB8GMH8hOu9SM7bMb32
         sAXg==
X-Forwarded-Encrypted: i=1; AFNElJ88Jb/z5HKX2X0Xtd6iQ+zbfpAgnIoi4yc/EQi3MweLfGzzNLnmCLEUEpu3wUuxToypF0dCk3idZh5htg0lxiN5@lists.infradead.org
X-Gm-Message-State: AOJu0YxtOPe626brWcVy0v+WoeqLq0H0vuQNbMEttGhub9u9foLId022
	lt2CN0+4LKCYEy97YKFhivvP1ezugDr8ga7IGtrDRTlS8nj+dD9gzW7iw/mkkwZD2HKzJz5KVOv
	y3o0lxe+TcQ==
X-Received: from plsu12.prod.google.com ([2002:a17:902:bf4c:b0:2b0:5ad5:b5af])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:37c4:b0:2b7:abc0:3bd7
 with SMTP id d9443c01a7336-2b7abc0448fmr82802385ad.9.1777049314589; Fri, 24
 Apr 2026 09:48:34 -0700 (PDT)
Date: Fri, 24 Apr 2026 09:46:45 -0700
In-Reply-To: <20260424164721.2229025-1-irogers@google.com>
Mime-Version: 1.0
References: <20260423163406.1779809-1-irogers@google.com> <20260424164721.2229025-1-irogers@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260424164721.2229025-24-irogers@google.com>
Subject: [PATCH v5 23/58] perf python: Add LiveSession helper
From: Ian Rogers <irogers@google.com>
To: acme@kernel.org, adrian.hunter@intel.com, james.clark@linaro.org, 
	leo.yan@linux.dev, namhyung@kernel.org, tmricht@linux.ibm.com
Cc: alice.mei.rogers@gmail.com, dapeng1.mi@linux.intel.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, mingo@redhat.com, peterz@infradead.org, 
	Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_094836_464066_2BE3DCC7 
X-CRM114-Status: GOOD (  16.74  )
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

Add LiveSession class in tools/perf/python/perf_live.py to support
live event collection using perf.evlist and perf.parse_events,
avoiding the need to fork a separate perf record process.

Signed-off-by: Ian Rogers <irogers@google.com>
Assisted-by: Gemini:gemini-3.1-pro-preview
---
v2:

1. Fixed File Descriptor Leak: I moved self.evlist.mmap() inside the
   try block so that if it raises an exception, the finally block will
   still be executed and call self.evlist.close() , preventing file
   descriptor leaks.

2. Handled InterruptedError in poll() : I wrapped the poll() call in a
   try-except block to catch InterruptedError and continue the
   loop. This prevents the live session from crashing on non-fatal
   signals like SIGWINCH .

3. Added evlist.config() : I added a call to self.evlist.config() in
   the constructor after parse_events() . This applies the default
   record options to the events, enabling sampling and setting up
   PERF_SAMPLE_* fields so that the kernel will actually generate
   PERF_RECORD_SAMPLE events.

4. Enable the evlist and be robust to exceptions from reading unsupported
   events like mmap2.
---
 tools/perf/python/perf_live.py | 48 ++++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)
 create mode 100755 tools/perf/python/perf_live.py

diff --git a/tools/perf/python/perf_live.py b/tools/perf/python/perf_live.py
new file mode 100755
index 000000000000..d1dcbab1150b
--- /dev/null
+++ b/tools/perf/python/perf_live.py
@@ -0,0 +1,48 @@
+# SPDX-License-Identifier: GPL-2.0
+"""
+Live event session helper using perf.evlist.
+
+This module provides a LiveSession class that allows running a callback
+for each event collected live from the system, similar to perf.session
+but without requiring a perf.data file.
+"""
+
+import perf
+
+
+class LiveSession:
+    """Represents a live event collection session."""
+
+    def __init__(self, event_string: str, sample_callback):
+        self.event_string = event_string
+        self.sample_callback = sample_callback
+        # Create a cpu map for all online CPUs
+        self.cpus = perf.cpu_map()
+        # Parse events and set maps
+        self.evlist = perf.parse_events(self.event_string, self.cpus)
+        self.evlist.config()
+
+    def run(self):
+        """Run the live session."""
+        self.evlist.open()
+        try:
+            self.evlist.mmap()
+            self.evlist.enable()
+
+            while True:
+                # Poll for events with 100ms timeout
+                try:
+                    self.evlist.poll(100)
+                except InterruptedError:
+                    continue
+                for cpu in self.cpus:
+                    try:
+                        event = self.evlist.read_on_cpu(cpu)
+                        if event and event.type == perf.RECORD_SAMPLE:
+                            self.sample_callback(event)
+                    except Exception:
+                        pass
+        except KeyboardInterrupt:
+            pass
+        finally:
+            self.evlist.close()
-- 
2.54.0.545.g6539524ca2-goog


