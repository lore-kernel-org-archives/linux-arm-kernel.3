Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2A23FF885A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Apr 2026 22:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2j+/G/gLHQ7NZrTXlwU5UyQ2EY4+32u+JcYzqEO/fuc=; b=Jsi9Ran2IyC09Z/NIv7kk3SQAq
	aQWBZueUxijntKM8zDU2kVWIIcdZxIGkLKzbBkIGaes3i0bwGqE/LMGJLOBIphgz8R1p7l5OiBeV/
	WC/glXGK1EiqVbbvhHIPGgJO04iphW13ePp06czxPCiZtRNIxYb6v4my9aEpLpc+ggAHb4wQac+H5
	RUwLtkvRLZkHyy99j1jJcEapujarMAtoON115ieOGqt1Sevkeo86i5/fBYzAPkeqFlGCU0YDNY9UV
	qMcQSkCv4yv2I2u1xsPNk0VhYPxtsYaozE4BXgJEwfEj1IkfoB4XNtDwXcyhbt4D4pVWGKTM4xTV1
	spIqOEIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGli6-0000000Etzu-43Sb;
	Sat, 25 Apr 2026 22:42:50 +0000
Received: from mail-dl1-x124a.google.com ([2607:f8b0:4864:20::124a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGlhc-0000000EtO2-0WGg
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Apr 2026 22:42:21 +0000
Received: by mail-dl1-x124a.google.com with SMTP id a92af1059eb24-1273dfdaf5dso7499454c88.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 25 Apr 2026 15:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777156939; x=1777761739; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=2j+/G/gLHQ7NZrTXlwU5UyQ2EY4+32u+JcYzqEO/fuc=;
        b=Nwr16hBHvPFTpe0Ur5sYtIMXTVjmNxIWNeLlEsJq20eiHT2DYryB5JvoZUXknF2ChC
         Dra/kFsF5U1p1H7v7RExLsYN8/BZCc5h288KeZ4vL8AvOY1YrGPRADgpKFGig9OcArYC
         K4ofGBgj/HkbA+0v1xwNl8idFluw0VsHhxc9NFMSe9PPxnzUaf5QnqFSwAFU4d4zMSvm
         bo2hAxgEoha5lCq1FLMIn5WHrGJRoRu2UJaoBrVK/BknwFjkrtgwgj8cMJNaRlJ4E/tC
         0mqsMqYwtTyAd6OMfbq/cLNFubws3p8qEd+7NrS52N8ZRozlpa/mQ6nCQIYc24r4MSBN
         UkYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777156939; x=1777761739;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2j+/G/gLHQ7NZrTXlwU5UyQ2EY4+32u+JcYzqEO/fuc=;
        b=S2ygh7bHttYf1Y5psrl4Wpy6BmF5jw83E2GLEeTa3IypmCovMSBb5zrMiV0vf6jfjm
         NV5kKAeWS1rCAqtmBCcfwr7dliNgKVgUlZrPLFHzsIhNYGVLppB1heeanr7LT2hrxxsT
         IlJiQ9uLcJlicEzmKmQeyzHpEh2fNkuTWPjCav2AjKt/hWdBpzCgPCpxo9TVNKXro/yH
         QG1+xe9xdU2o900Tou0W2JCWO0yaxgXlzd8kTQW5tDxsigGd+drIkv3nbquO/vNEgo0C
         Ek5/mAtNLdI+QqhBSYHYpYBRKgpzM8oAfsNKY6QsILHVTaq68XAbR5poxHEbQkCOIjdT
         Dy6g==
X-Forwarded-Encrypted: i=1; AFNElJ/MtUeqYVQGMo0gl6/qT960z3mjlP28KEQBnksXj37c92Y/DtkORbtViJKFYScN2/aWpLkhKf7zxUPzRKjBm1tp@lists.infradead.org
X-Gm-Message-State: AOJu0YyY3YK7eDB/pnQyDMzoAYBVdUmwv5y/TJZNTFaOgmzTxrfKZ/GG
	I5lCZ/p8roaABguCs7OBsdHOzfpPK0QpOH5HSrkn/c6DhN4Shimol5+lCUyL5Da/ZrSfxZ3JL0V
	5ghcoE1JYVg==
X-Received: from dlee7.prod.google.com ([2002:a05:7022:6287:b0:12c:1fa5:ab7c])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:6289:b0:12c:6ec9:3f1
 with SMTP id a92af1059eb24-12c73b4b076mr15847534c88.21.1777156938655; Sat, 25
 Apr 2026 15:42:18 -0700 (PDT)
Date: Sat, 25 Apr 2026 15:40:48 -0700
In-Reply-To: <20260425224125.160890-1-irogers@google.com>
Mime-Version: 1.0
References: <20260425174858.3922152-1-irogers@google.com> <20260425224125.160890-1-irogers@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260425224125.160890-24-irogers@google.com>
Subject: [PATCH v7 23/59] perf python: Add LiveSession helper
From: Ian Rogers <irogers@google.com>
To: acme@kernel.org, adrian.hunter@intel.com, james.clark@linaro.org, 
	leo.yan@linux.dev, namhyung@kernel.org, tmricht@linux.ibm.com
Cc: alice.mei.rogers@gmail.com, dapeng1.mi@linux.intel.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, mingo@redhat.com, peterz@infradead.org, 
	Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260425_154220_201401_09EE25F9 
X-CRM114-Status: GOOD (  16.68  )
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


