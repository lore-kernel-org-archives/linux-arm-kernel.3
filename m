Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 270DACD4F3D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 22:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WoYL3oraokua0mUStpvckCOjCdPI3hrcUVdVldzeRF0=; b=LPY3B2zGTXJMZMjbJhQxxWunSn
	nBEs5px4nNWqbtI2e1Rvia+K9ShwYRhZmGji6M/BGAETCbwYc3vCytROu/iOsbYeVvNd2wmGtypOS
	msC8sCqhBhh3wqJoFimDn0hZNjdUWGt1cm4/OSjjOfmN1B2dO6Zebh1urhiilI5hMEXbjDGQ63Z0i
	SVO5Q9VrIgu0CVP7kxBvbgQ0VaYm2o/aK7tYUbv3CqSe+GihvIXhIWst/bEZNE/+z99i2rRahLMI8
	zIrpdKaUTKcKWQoJHCT50AiAkxrCZgNJWNZ6q//aAXNs15GOzMtqtPCvvX+ely66ll6Fi3sERRr1K
	jQjBN4oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQY00-0000000C3Si-2wv0;
	Fri, 22 May 2026 22:05:44 +0000
Received: from mail-dy1-x1349.google.com ([2607:f8b0:4864:20::1349])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQXzp-0000000C3Cx-1fC0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 22:05:35 +0000
Received: by mail-dy1-x1349.google.com with SMTP id 5a478bee46e88-2ef37c3f773so8143585eec.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 15:05:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779487532; x=1780092332; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=WoYL3oraokua0mUStpvckCOjCdPI3hrcUVdVldzeRF0=;
        b=t7/CRyrkAiO0TrvqFiStisKt2OU2PmfpK+/9DYin7JVWH+JK2QuqhHc1A4QvBP104q
         GAZA7vAYHuXvQ8G8/Md77YbpfUipOZ9St8y4NSEQIcHCcS4H2DH0gPHfbmO4/X3Ab+As
         fv1uK+YuFrvYFxgeG2uLSA6akvKS11nn5e81khJXVL3s129HyTfr7Y/ZR+L2M3TSrj8l
         M+Hhr31brWXwE7ES+NrKy1ulwI9dVSAACQjK3Cld3LBT3yoLdUILO8sSwXSSaOOYJkGw
         5nfBFCjDnoy4TVN+/zHrngC4/ieKRPPP9hmu3cHwSQxC6GkWpxQhgwN65znYBZ1pOHVj
         qyug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779487532; x=1780092332;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WoYL3oraokua0mUStpvckCOjCdPI3hrcUVdVldzeRF0=;
        b=mHw0GH48wqAGqZQZi9eRlhKyqbzc6cSoF4HdhW2Cn3VcI5KAIuWRrngyS+E5f33leg
         O2n/xkoUelUD6NvG2mmZXys5+LV+9onPsD1QsCMACqVf1k2Abzo2xyMmcG/7lOhJiMKz
         PBTBOsPBFSMBd/ErZCQxbpjoR43ZEW0grl2PWa18+QuSslFRZCRxUvyRJg1RNcaJ2w4J
         QAvfGbE0wdTuP/ck1XrAwWI4Wk2SIBAnnRzMFxiE2wAYA+CTRmgVu9wPDosTIxtpurFQ
         rj8GEXqsatEGaLXq6rRbB/NsxppQG6wgOQ3FmaJMuTEpeeUoUZzWiN5aFf0qmBP310rs
         Ym2Q==
X-Forwarded-Encrypted: i=1; AFNElJ+/gT1+z3THS21i5Ue2IRJZTGSspBSuwSkvOYgdqViKiQnvPeLB3INGlymi87bm4b6wJKED+zNgE2LkaXAM6K3n@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/MwIa8SJRR/rC7o23TuSJgb8RUh4F4h12z/sDK1PzAvBjevJ/
	bG9GPzQ6+mjd/U/sFkN5u1x9zxq6qKoqb6DycOCjl6AXcYXx9s09MpM0lQO/O4ytZgLHBL9moaR
	yn8bxEfGDxw==
X-Received: from dyji10.prod.google.com ([2002:a05:7300:7a0a:b0:2ed:b77f:b02a])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7301:6743:b0:2da:a813:a60c
 with SMTP id 5a478bee46e88-30449103945mr2955830eec.20.1779487531932; Fri, 22
 May 2026 15:05:31 -0700 (PDT)
Date: Fri, 22 May 2026 15:04:34 -0700
In-Reply-To: <20260522220435.2378363-1-irogers@google.com>
Mime-Version: 1.0
References: <20260428071903.1886173-1-irogers@google.com> <20260522220435.2378363-1-irogers@google.com>
X-Mailer: git-send-email 2.54.0.794.g4f17f83d09-goog
Message-ID: <20260522220435.2378363-24-irogers@google.com>
Subject: [PATCH v9 23/23] perf python: Add LiveSession helper
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, namhyung@kernel.org
Cc: adrian.hunter@intel.com, alice.mei.rogers@gmail.com, 
	dapeng1.mi@linux.intel.com, james.clark@linaro.org, leo.yan@linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, mingo@redhat.com, peterz@infradead.org, 
	tmricht@linux.ibm.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_150533_477979_A35E0ACC 
X-CRM114-Status: GOOD (  18.29  )
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
 tools/perf/python/perf_live.py | 53 ++++++++++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)
 create mode 100755 tools/perf/python/perf_live.py

diff --git a/tools/perf/python/perf_live.py b/tools/perf/python/perf_live.py
new file mode 100755
index 000000000000..2e5347349760
--- /dev/null
+++ b/tools/perf/python/perf_live.py
@@ -0,0 +1,53 @@
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
+                            break
+        except KeyboardInterrupt:
+            pass
+        finally:
+            self.evlist.close()
-- 
2.54.0.794.g4f17f83d09-goog


