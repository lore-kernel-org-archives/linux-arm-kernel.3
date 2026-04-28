Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EF45FF886F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 07:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M8WtGEmeyg2yDzdn++CmlJWRHF3Nic6slUsof+bTFao=; b=BBo9JvKNbz+NXVC1d53zhX/DQB
	eqdSc/QUszYlwzVMGcYTdsKtebHOmgHFLrs+zBariDBP640ohySvJnLVThALLHl0IxpaomKDQD3VL
	Acfm4X1EOEMvQd5IyiQ3PO3Mw0I6y/jyUBQx4V2YI/e2SvtF1rm29tMnyDO2Q1mj/p7bpbigzglHt
	K8DzXEGLwPbMaVvLjGIDoo6xd7kT5c6tYtjuGBug2rSpJkAldmIKvWaZkNCMUeCaGds7wqq7pElEb
	ByPu2U9Oh0k4TMCpoV1iMzwYSB4jJV3DN2weZi53bGcKAczH7c++eSW8o5QAfUmywZxFEZmmcDe2J
	qMDKEMkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHcka-00000000hp3-0DV0;
	Tue, 28 Apr 2026 07:20:56 +0000
Received: from mail-dl1-x1249.google.com ([2607:f8b0:4864:20::1249])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHcjm-00000000gtK-09cV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 07:20:08 +0000
Received: by mail-dl1-x1249.google.com with SMTP id a92af1059eb24-12c8ccc7593so14029157c88.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 00:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777360804; x=1777965604; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=M8WtGEmeyg2yDzdn++CmlJWRHF3Nic6slUsof+bTFao=;
        b=YyblKSjuOj+OwTFuIWoE8FL3P+CLtNoPrhv1OpxxoZz+BLdLiHMxIpMx7n7A66mxPB
         /ZNJ58LcVjlTiOVxahdjLfveW1bc2uQhfvqyjjvBwrFXjOQvrAiWDMNIIuC+aX7iw12C
         PYXt19pcQzT68x3FBpolqD3Ew7dQyj4/5m2iPmizo0tHZ5ZwSX5mv2EwXfGJrrWpCq8v
         aq79AO6j+wwkuM/rPEFwx7TFIyzYLOLZGGEHAsokvGrO9Uhz4YewBFZMGyUvNVitmuVG
         1rO6vig0dLyaN2mOQlm9ROSiTTHWc4jctMfUNlWQm6QSiRD29bEBE7rQFcoPnsYbi6u6
         2O7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777360804; x=1777965604;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M8WtGEmeyg2yDzdn++CmlJWRHF3Nic6slUsof+bTFao=;
        b=CNL9zOdgUpL3fN40uNR9uX2lKpaqsZzSbS95csFjH8RsthxaWQabigQPKt8jDyW1ZU
         VGrb6YdoDdq80dgCOgYd4eOlp1y48FrKsFuXRxfqULccTnf1f+n55kZE0JE57mZ+F2RQ
         kJu7ssdeQCa55/1K5SoDrhJ05l8WEErUPOknsGYiI5tK7IvRvDPvd0+54Ssiu0DUqYu1
         YJKDneME7FpPFcDV+cPXT+yZ33dtj6DegJnB2r0rbXidt0zT+o78ODyNr6FFtY+MgtBi
         WwMA1j9f34IFjNsqHLzutlGH2SQMcqWjtoYDTYy7XxHsdf9m3N/PC3uZqtRbsVpDdouI
         kE7w==
X-Forwarded-Encrypted: i=1; AFNElJ/utO9zEiBsBDqAFSq2BmbjQSch7EVpB8kZqlePorU2hX0+rJZxtdiYprh/vLvK9ciJJp+W92pn3m+QOwKzDnek@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5C1OAP4xR+Rw57zrnRMcVnHeCwyIt2TXXbeNm8vbZhLEBfVX8
	7kAhDDEP/J3wiE5EuHeE0wjynq5BHb968V4PKfcdkbm4VKuTI9hs3hR1RB2k5MSZR0NvdIuQS1D
	V6EwZ3ctp+A==
X-Received: from dybfe3.prod.google.com ([2002:a05:7300:bf83:b0:2e6:1dc6:691e])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:6725:b0:128:bae0:e043
 with SMTP id a92af1059eb24-12ddd9ee91dmr807802c88.31.1777360803997; Tue, 28
 Apr 2026 00:20:03 -0700 (PDT)
Date: Tue, 28 Apr 2026 00:18:28 -0700
In-Reply-To: <20260428071903.1886173-1-irogers@google.com>
Mime-Version: 1.0
References: <20260425224951.174663-1-irogers@google.com> <20260428071903.1886173-1-irogers@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260428071903.1886173-24-irogers@google.com>
Subject: [PATCH v8 23/58] perf python: Add LiveSession helper
From: Ian Rogers <irogers@google.com>
To: acme@kernel.org, namhyung@kernel.org
Cc: adrian.hunter@intel.com, alice.mei.rogers@gmail.com, 
	dapeng1.mi@linux.intel.com, james.clark@linaro.org, leo.yan@linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, mingo@redhat.com, peterz@infradead.org, 
	tmricht@linux.ibm.com, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_002006_149955_DD366595 
X-CRM114-Status: GOOD (  18.69  )
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

v8:
- Drain all events from a CPU before moving to the next.
---
 tools/perf/python/perf_live.py | 52 ++++++++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)
 create mode 100755 tools/perf/python/perf_live.py

diff --git a/tools/perf/python/perf_live.py b/tools/perf/python/perf_live.py
new file mode 100755
index 000000000000..d7f4269299a7
--- /dev/null
+++ b/tools/perf/python/perf_live.py
@@ -0,0 +1,52 @@
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
+                    while True:
+                        try:
+                            event = self.evlist.read_on_cpu(cpu)
+                            if event is None:
+                                break
+                            if event.type == perf.RECORD_SAMPLE:
+                                self.sample_callback(event)
+                        except Exception as e:
+                            import sys
+                            print(f"Error processing event on CPU {cpu}: {e}", file=sys.stderr)
+        except KeyboardInterrupt:
+            pass
+        finally:
+            self.evlist.close()
-- 
2.54.0.545.g6539524ca2-goog


