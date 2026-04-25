Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E173FF885C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Apr 2026 17:50:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2j+/G/gLHQ7NZrTXlwU5UyQ2EY4+32u+JcYzqEO/fuc=; b=rob8QpveCwKahHW92dzhzuai5k
	RMLdIuuYIDKzhv7kF0zQkEbbcKRiH/L6wT+f6ds5O1jGG8qPCfkbNMwtkLv/3hH5DMbQFEmAe98Og
	xoCCpl59dQ1n5kDdtOZwFagZ/lbUsJQZdhXiAby8E7GCsuvUiOjXDzxDYWjuo+vfMs80uvvQC6XFO
	TD5KZlYfme16WHrFeysN8rK/+nVrQqNz7jaNIIbU2RL3YWIWvVlzWcKG7crCbgYu1zjxzZCuq0cr6
	v7dWSv5/QaJjwtbbPcSxU8D2fiwWefVrmzzn25pEaURFe+nWaju7bzXRI78M9Jy8G4hByTepkDg26
	ilLqmgew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGh97-0000000EdSm-3ZuN;
	Sat, 25 Apr 2026 17:50:25 +0000
Received: from mail-dy1-x1349.google.com ([2607:f8b0:4864:20::1349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGh8W-0000000Ecjh-1buT
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Apr 2026 17:49:55 +0000
Received: by mail-dy1-x1349.google.com with SMTP id 5a478bee46e88-2d93379001eso19589138eec.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 25 Apr 2026 10:49:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777139387; x=1777744187; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=2j+/G/gLHQ7NZrTXlwU5UyQ2EY4+32u+JcYzqEO/fuc=;
        b=s1EfmvJO06TfGuIKdzUynPFHlJxrR0Z1uRXpDp3dlVYCeQCTe1Y81MIWpAhq0zx85G
         hBqnZk/Ra7NhrPV1bhkad0FMe7mHbWxxmXZm5pSQvGHCabQLEyzv06rVMKE2kdotD2m+
         19enakHUoIrMQc5KNIhsBPKKtpgXKur+GcQJOxnT/Uv3JEdIk3oOBmIBXbF+4SkY4TPA
         n0vJjdDTo/Azl6tqoCGhAQRefhETMnRRvsszRrSh4I5cjH1vxV3L3hWZQIXCk4Zv8tIC
         lx5MpWvSsqUslXEUre2Y1qxkZ2IPHlOyQgJUr/qqgtmjwu3k7vDR2niE8Lrcpz2zik3p
         2h1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777139387; x=1777744187;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2j+/G/gLHQ7NZrTXlwU5UyQ2EY4+32u+JcYzqEO/fuc=;
        b=ANCMf+BDyZH3A5TIh0mWIhSVkbZhqKAYrkARtb/Xs3gvGoTEOltWzijfIt/5sWMMz7
         MUzRgGNIfcXjmMyd+9ST78Dd7HZYer11NE7GMLCAi9rMhgpxkdDxJEJr7aFB9CZP2wpH
         Cjf873Ddid2svW6QQbeAE/NRBeBayI/Vd1ThDKm+O9uq0K22oSU7mfcOcZ47TTc8nXMJ
         EWFz4GvvABjux0UQ0N2WkENXfTWWWr8cUsa8lZzHUZFq21vbWm+zDtVmZUHrD7wQihhe
         8ZfbukkZqzOEZ7F2ShyZGw/nZxB9VpMJ/aYSNYJIFyjZKm0WzdSmnarBZcQAOUUjSZgj
         nxeQ==
X-Forwarded-Encrypted: i=1; AFNElJ9poC+5AVziq63xosKFFqS6xbMt5UjBhxVT7nbqLWMFwO0Toh7propojoBBHCSGP/oacXW+aRgVGbqJuo+tKVZD@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/VnNbEKeovYl/T7LTzmfcbb6mAPaW3qP10Z7qexkAuhoQy/x7
	a5jIj/YJz9yLTqwzvhmhIq0r4Ee4E2SDgbevMmioOAxhA43Wy+Uc/DdNpK4a6XEHvECcjUS6uMf
	9Jw3zKl/7qw==
X-Received: from dybb21.prod.google.com ([2002:a05:693c:6095:b0:2d9:61d4:4d0e])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7301:fd16:b0:2e7:af57:3b72
 with SMTP id 5a478bee46e88-2e7af57404cmr11412940eec.29.1777139386471; Sat, 25
 Apr 2026 10:49:46 -0700 (PDT)
Date: Sat, 25 Apr 2026 10:48:21 -0700
In-Reply-To: <20260425174858.3922152-1-irogers@google.com>
Mime-Version: 1.0
References: <20260424164721.2229025-1-irogers@google.com> <20260425174858.3922152-1-irogers@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260425174858.3922152-24-irogers@google.com>
Subject: [PATCH v6 23/59] perf python: Add LiveSession helper
From: Ian Rogers <irogers@google.com>
To: acme@kernel.org, adrian.hunter@intel.com, james.clark@linaro.org, 
	leo.yan@linux.dev, namhyung@kernel.org, tmricht@linux.ibm.com
Cc: alice.mei.rogers@gmail.com, dapeng1.mi@linux.intel.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, mingo@redhat.com, peterz@infradead.org, 
	Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260425_104948_457251_091418D4 
X-CRM114-Status: GOOD (  16.78  )
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


