Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 873B8FF885C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Apr 2026 22:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2j+/G/gLHQ7NZrTXlwU5UyQ2EY4+32u+JcYzqEO/fuc=; b=OwQ45HGqGjwG6Dv6ESssVILN/Y
	Vnw2m/0pmcFl0z184IuFQtj484acJLZAJFAkBxVNK/GbsQMr09v9Ur7wyuhDDFrfmAJGu1ckxKvzS
	KgPSNWIpbWBVYoIFayYgV5w8Rpp/TPX0E03YmP3Q29rqeHCKqSZffLfPUzIeDs4O5Re9AAHOJAT0G
	bVfLtx0ZObsJbwYnKkQf/SFJU9O7yU94477rOuucROtsgprzN2CJm/sEy0gU1NvuxJjK2137qr9QQ
	b5Xb7mul8J+hZ1UD3wqwMSbF+Cz0h0YJ2EOMIwxzqb3iHPt3NyTYE6GQZl7GG5fLIQTHAYQMECoKl
	kh2azpMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGlqX-0000000Ez9C-2i1E;
	Sat, 25 Apr 2026 22:51:33 +0000
Received: from mail-dy1-x1349.google.com ([2607:f8b0:4864:20::1349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGlq4-0000000EybV-2q8C
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Apr 2026 22:51:17 +0000
Received: by mail-dy1-x1349.google.com with SMTP id 5a478bee46e88-2c16233ee11so12492888eec.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 25 Apr 2026 15:51:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777157461; x=1777762261; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=2j+/G/gLHQ7NZrTXlwU5UyQ2EY4+32u+JcYzqEO/fuc=;
        b=RXgq3zdqUJVq0UtSWC8weTmBWHZUr1dnHU86d77JSwxZ1q7X+vffuGjIQTPsETk6tL
         dv3faJ52yUrxztOHVfO0bZOyVi37qs/jQ0eJa2ZNIz2uAqWHspuH2SySo/Ou1fCbCVSN
         JDyZaVHU2OWa54KeN3onh4fTxo9GTDai7sMq4mzHbCai1pVq364g4oQ3ryqrNl0F7F6W
         apDj8EG0F0ZfAt4AXJDwPbEI/oXtcFC+CqlpSSlrQ63Ex/Fb5gZJJFcERftflR1KEi49
         fnjHBs/xPw9D1NFqpAkT7FHuYMB9qGNqF6mLqQo/Ufjh8PEwMbwwmaJuVeXGFUoFBZ7v
         Im9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777157461; x=1777762261;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2j+/G/gLHQ7NZrTXlwU5UyQ2EY4+32u+JcYzqEO/fuc=;
        b=VpaGudjxICVH0B+3cIx3Nxb3buHPAReNy3pxrwzFdZJDpFOxKTrn3J+I0Vkp1fCPU+
         BUgz73/YkzTgWLIw5mvtEkrbKrDBB0Awm4ie7Rxy0+rbFOqA1zv6ZGSejj3hW2HcUcRc
         D4uqYfeGN5s7t9sgvUXTVqo1VdBGXiuyxyl5wO5V57lox5MUWgaDEEevszzfFrfwTZCf
         us7pTbzHRTZj/zdNdgwGGz/UIeeXFzomwKe8ogBxeww+pghCe+qYEllZMgyQSAdbWSWA
         voQev8DB+2J3qRBSob3Fztc5rQligANlimQUTJdQMWgIlxbRtGy6c0WqvYrEU8BRvuGD
         GQAw==
X-Forwarded-Encrypted: i=1; AFNElJ90eyAQiZSMqHwov+o26Oct3zXValsBVwXUIxZfXAmfaDvLWcNoEwbJG4mXiKAFtZFhmrUzpRK/TCiJFGOzA/tU@lists.infradead.org
X-Gm-Message-State: AOJu0Yxz9n9mnYRw7RA4rpbo3QKKHvlJmuPx8ir1DGjNiXU2vCMn4NZZ
	zW/kA2PSbNiCOWcJ1tk8LDyxO4HIEEGAOoo9x0Kl1NLDUkpqwok0Y3zUwateAnrooRJcSEI6tBS
	6fL6scSmM2A==
X-Received: from dybnj5.prod.google.com ([2002:a05:7300:d085:b0:2dd:4573:2897])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7301:1f01:b0:2c7:5a7b:e8c0
 with SMTP id 5a478bee46e88-2e4657714d1mr19141205eec.12.1777157460756; Sat, 25
 Apr 2026 15:51:00 -0700 (PDT)
Date: Sat, 25 Apr 2026 15:49:15 -0700
In-Reply-To: <20260425224951.174663-1-irogers@google.com>
Mime-Version: 1.0
References: <20260425174858.3922152-1-irogers@google.com> <20260425224951.174663-1-irogers@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260425224951.174663-24-irogers@google.com>
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
X-CRM114-CacheID: sfid-20260425_155104_894283_DCC8F03B 
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


