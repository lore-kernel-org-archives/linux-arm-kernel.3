Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FA92FD8FDA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 18:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:From:Subject
	:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JebxhsuRXpmS99sqoEAcdewBCf+xeG1RAop12duRn7Q=; b=DGFdNu8a0kPuiVZX6ftvyJRoOJ
	n2dSx4/G0EM5x0X3dg5bGH/UEvgBqmIsZDyTamFnwfEcTb2dFcsn9VcDvx8EHXK/K5XIUE2sLbC7U
	LmN/OWnL5JgKaonuPmVf9MuJxUamCBQIvg2YI4Ly9wOAnSkeXxNwDYuJpraCAkE11nDGuncirVpnf
	x3J5iuYGnEdKuFxt531H9BfhefdmIP6CZdNXqlUhW6dPH1L49jWKIjCV/WjcYt7ovNRu2Yh9SDX+N
	rOzfirAXHZ+WWdNYG3QELiOgJRMTN95mzuSTMOa8kAZYcUQAoUaSZmC1NU3DiWEuRfhhh1dCDaY5x
	Mo/0CWIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvfer-00000006uEU-01YU;
	Thu, 26 Feb 2026 18:00:17 +0000
Received: from mail-dl1-x124a.google.com ([2607:f8b0:4864:20::124a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvfec-00000006tyf-3Rze
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 18:00:04 +0000
Received: by mail-dl1-x124a.google.com with SMTP id a92af1059eb24-12711967e0eso1542186c88.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Feb 2026 10:00:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772128802; x=1772733602; darn=lists.infradead.org;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JebxhsuRXpmS99sqoEAcdewBCf+xeG1RAop12duRn7Q=;
        b=V59hvLotxmls6XRaetWcx9jJid+tEnzFvBprYOH40hJ+vXcbkdvHkB1aSFR3oQuPGl
         QQdCDAHWjgZNt1qUUAk9Qcs8izHjIGwIX2EOEp+ZTxzKfBXw8vbnDHU6OUR49QUCzluz
         +e17AUCjfInxN6SIRC/aStVAP5FlOMkChUKi9LAMbvDAMYoeC5kzYocrATKqeqBvRe9B
         P4vchKXIH00MhU5KgD5tcH9Q0UFsm0S1Z11e/ggdajImyMYTW/3w5BoCBISGLFSLCkZU
         3uWQOUQ4/rz8ksKXYDEi9u2oCQU+FWQMIqDf0MrwpIvrOZiB+evBjRuzSihMLQp35/vI
         0h6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772128802; x=1772733602;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JebxhsuRXpmS99sqoEAcdewBCf+xeG1RAop12duRn7Q=;
        b=p2s2m7ap9o1W1CuX8FhuXD7zWR0fcZha0yjy4xSEWP3k3qjurn8VypvRRnUPTwSDbU
         QGEyiqFLIdsafcV//oHf3mRgM9wID8mTcMB//HJH5pV4N6VjAwbhks3QUxHeQIQcoePq
         vu/Gl5CEK2foEzy0RIoxxgQmNrolK2qJEZqZ7gjyp0xOYVPgX/SxXRUlG7geL8b7WHPE
         bJvlZMLnC9nfTgbfjbRsP4T0bcF2SiNRRy9UibHx4iZGxdokFpTUm2i4W8llzw8rbX9X
         2bJJFXX/gKP6fvrFx9e+7G63/zGAmXBUZIlU4z1pwciLE6E9rw1BFGHdqpEpsKsFibYf
         0lfw==
X-Forwarded-Encrypted: i=1; AJvYcCWdEG+ys2PeKzQNhlm80eZ7Js6NnON1Gh5ysOv+6L7STq4vgGrye2Lg0IpDRMw3tnW7fE57CBl0lSWrhP0SKqAA@lists.infradead.org
X-Gm-Message-State: AOJu0YzKL4ZXAaIV5Kq6hh786wz76lFwvg/SsNZjdyGrO/VYQj1RCclA
	dq0OCDXa5m5Lsp2KPSQ0IM8IH5uvDuvoYZyqa+68BKY8EeS7vuFvhFrODekasjSTEKhTPOAGcfC
	4anr8IF4VfQ==
X-Received: from dlw4.prod.google.com ([2002:a05:7022:44:b0:124:9d31:3581])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:45a8:b0:11b:82b8:40ae
 with SMTP id a92af1059eb24-1276acc4a5cmr9814942c88.18.1772128801157; Thu, 26
 Feb 2026 10:00:01 -0800 (PST)
Date: Thu, 26 Feb 2026 09:59:36 -0800
In-Reply-To: <20260226175936.593159-1-irogers@google.com>
Mime-Version: 1.0
References: <20260226175936.593159-1-irogers@google.com>
X-Mailer: git-send-email 2.53.0.473.g4a7958ca14-goog
Message-ID: <20260226175936.593159-10-irogers@google.com>
Subject: [PATCH v2 10/10] perf vendor events intel: Update sierraforest events
 from 1.13 to 1.15
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, 
	"=?UTF-8?q?Andreas=20F=C3=A4rber?=" <afaerber@suse.de>, Manivannan Sadhasivam <mani@kernel.org>, 
	Dapeng Mi <dapeng1.mi@linux.intel.com>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_100002_869333_5F52C589 
X-CRM114-Status: GOOD (  12.21  )
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

The updated events were published in:
https://github.com/intel/perfmon/commit/996bacad8f144e675b32f0096b9fe6813380695c
https://github.com/intel/perfmon/commit/93b6ef08ca9b01788458e8f5a0e7cbb716715b7c

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/pmu-events/arch/x86/mapfile.csv    |  2 +-
 .../arch/x86/sierraforest/cache.json          | 22 +++++-----
 .../arch/x86/sierraforest/pipeline.json       | 42 ++++++++++++++++---
 3 files changed, 49 insertions(+), 17 deletions(-)

diff --git a/tools/perf/pmu-events/arch/x86/mapfile.csv b/tools/perf/pmu-events/arch/x86/mapfile.csv
index 8ef03af9f150..8a9e1735e21e 100644
--- a/tools/perf/pmu-events/arch/x86/mapfile.csv
+++ b/tools/perf/pmu-events/arch/x86/mapfile.csv
@@ -30,7 +30,7 @@ GenuineIntel-6-CC,v1.04,pantherlake,core
 GenuineIntel-6-A7,v1.04,rocketlake,core
 GenuineIntel-6-2A,v19,sandybridge,core
 GenuineIntel-6-8F,v1.36,sapphirerapids,core
-GenuineIntel-6-AF,v1.13,sierraforest,core
+GenuineIntel-6-AF,v1.15,sierraforest,core
 GenuineIntel-6-(37|4A|4C|4D|5A),v15,silvermont,core
 GenuineIntel-6-(4E|5E|8E|9E|A5|A6),v59,skylake,core
 GenuineIntel-6-55-[01234],v1.37,skylakex,core
diff --git a/tools/perf/pmu-events/arch/x86/sierraforest/cache.json b/tools/perf/pmu-events/arch/x86/sierraforest/cache.json
index de0e7661a52d..168f43557a0e 100644
--- a/tools/perf/pmu-events/arch/x86/sierraforest/cache.json
+++ b/tools/perf/pmu-events/arch/x86/sierraforest/cache.json
@@ -326,7 +326,7 @@
         "UMask": "0x82"
     },
     {
-        "BriefDescription": "Counts the number of tagged load uops retired that exceed the latency threshold defined in MEC_CR_PEBS_LD_LAT_THRESHOLD - Only counts with PEBS enabled.",
+        "BriefDescription": "Counts the number of tagged load uops retired that exceed the latency threshold of 1024. Only counts with PEBS enabled.",
         "Counter": "0,1",
         "Data_LA": "1",
         "EventCode": "0xd0",
@@ -337,7 +337,7 @@
         "UMask": "0x5"
     },
     {
-        "BriefDescription": "Counts the number of tagged load uops retired that exceed the latency threshold defined in MEC_CR_PEBS_LD_LAT_THRESHOLD - Only counts with PEBS enabled.",
+        "BriefDescription": "Counts the number of tagged load uops retired that exceed the latency threshold of 128. Only counts with PEBS enabled.",
         "Counter": "0,1",
         "Data_LA": "1",
         "EventCode": "0xd0",
@@ -348,7 +348,7 @@
         "UMask": "0x5"
     },
     {
-        "BriefDescription": "Counts the number of tagged load uops retired that exceed the latency threshold defined in MEC_CR_PEBS_LD_LAT_THRESHOLD - Only counts with PEBS enabled.",
+        "BriefDescription": "Counts the number of tagged load uops retired that exceed the latency threshold of 16. Only counts with PEBS enabled.",
         "Counter": "0,1",
         "Data_LA": "1",
         "EventCode": "0xd0",
@@ -359,7 +359,7 @@
         "UMask": "0x5"
     },
     {
-        "BriefDescription": "Counts the number of tagged load uops retired that exceed the latency threshold defined in MEC_CR_PEBS_LD_LAT_THRESHOLD - Only counts with PEBS enabled.",
+        "BriefDescription": "Counts the number of tagged load uops retired that exceed the latency threshold of 2048. Only counts with PEBS enabled.",
         "Counter": "0,1",
         "Data_LA": "1",
         "EventCode": "0xd0",
@@ -370,7 +370,7 @@
         "UMask": "0x5"
     },
     {
-        "BriefDescription": "Counts the number of tagged load uops retired that exceed the latency threshold defined in MEC_CR_PEBS_LD_LAT_THRESHOLD - Only counts with PEBS enabled.",
+        "BriefDescription": "Counts the number of tagged load uops retired that exceed the latency threshold of 256. Only counts with PEBS enabled.",
         "Counter": "0,1",
         "Data_LA": "1",
         "EventCode": "0xd0",
@@ -381,7 +381,7 @@
         "UMask": "0x5"
     },
     {
-        "BriefDescription": "Counts the number of tagged load uops retired that exceed the latency threshold defined in MEC_CR_PEBS_LD_LAT_THRESHOLD - Only counts with PEBS enabled.",
+        "BriefDescription": "Counts the number of tagged load uops retired that exceed the latency threshold of 32. Only counts with PEBS enabled.",
         "Counter": "0,1",
         "Data_LA": "1",
         "EventCode": "0xd0",
@@ -392,7 +392,7 @@
         "UMask": "0x5"
     },
     {
-        "BriefDescription": "Counts the number of tagged load uops retired that exceed the latency threshold defined in MEC_CR_PEBS_LD_LAT_THRESHOLD - Only counts with PEBS enabled.",
+        "BriefDescription": "Counts the number of tagged load uops retired that exceed the latency threshold of 4. Only counts with PEBS enabled.",
         "Counter": "0,1",
         "Data_LA": "1",
         "EventCode": "0xd0",
@@ -403,7 +403,7 @@
         "UMask": "0x5"
     },
     {
-        "BriefDescription": "Counts the number of tagged load uops retired that exceed the latency threshold defined in MEC_CR_PEBS_LD_LAT_THRESHOLD - Only counts with PEBS enabled.",
+        "BriefDescription": "Counts the number of tagged load uops retired that exceed the latency threshold of 512. Only counts with PEBS enabled.",
         "Counter": "0,1",
         "Data_LA": "1",
         "EventCode": "0xd0",
@@ -414,7 +414,7 @@
         "UMask": "0x5"
     },
     {
-        "BriefDescription": "Counts the number of tagged load uops retired that exceed the latency threshold defined in MEC_CR_PEBS_LD_LAT_THRESHOLD - Only counts with PEBS enabled.",
+        "BriefDescription": "Counts the number of tagged load uops retired that exceed the latency threshold of 64. Only counts with PEBS enabled.",
         "Counter": "0,1",
         "Data_LA": "1",
         "EventCode": "0xd0",
@@ -425,7 +425,7 @@
         "UMask": "0x5"
     },
     {
-        "BriefDescription": "Counts the number of tagged load uops retired that exceed the latency threshold defined in MEC_CR_PEBS_LD_LAT_THRESHOLD - Only counts with PEBS enabled.",
+        "BriefDescription": "Counts the number of tagged load uops retired that exceed the latency threshold of 8. Only counts with PEBS enabled.",
         "Counter": "0,1",
         "Data_LA": "1",
         "EventCode": "0xd0",
@@ -499,7 +499,7 @@
         "UMask": "0x12"
     },
     {
-        "BriefDescription": "Counts the number of  stores uops retired same as MEM_UOPS_RETIRED.ALL_STORES",
+        "BriefDescription": "Counts the number of stores uops retired.",
         "Counter": "0,1,2,3,4,5,6,7",
         "Data_LA": "1",
         "EventCode": "0xd0",
diff --git a/tools/perf/pmu-events/arch/x86/sierraforest/pipeline.json b/tools/perf/pmu-events/arch/x86/sierraforest/pipeline.json
index 70af13143024..cf67ff6135e0 100644
--- a/tools/perf/pmu-events/arch/x86/sierraforest/pipeline.json
+++ b/tools/perf/pmu-events/arch/x86/sierraforest/pipeline.json
@@ -186,7 +186,7 @@
         "UMask": "0xf7"
     },
     {
-        "BriefDescription": "Fixed Counter: Counts the number of unhalted core clock cycles",
+        "BriefDescription": "Fixed Counter: Counts the number of unhalted core clock cycles. [This event is alias to CPU_CLK_UNHALTED.THREAD]",
         "Counter": "Fixed counter 1",
         "EventName": "CPU_CLK_UNHALTED.CORE",
         "SampleAfterValue": "2000003",
@@ -200,7 +200,7 @@
         "SampleAfterValue": "2000003"
     },
     {
-        "BriefDescription": "Fixed Counter: Counts the number of unhalted reference clock cycles",
+        "BriefDescription": "Fixed Counter: Counts the number of unhalted reference clock cycles.",
         "Counter": "Fixed counter 2",
         "EventName": "CPU_CLK_UNHALTED.REF_TSC",
         "SampleAfterValue": "2000003",
@@ -216,7 +216,7 @@
         "UMask": "0x1"
     },
     {
-        "BriefDescription": "Fixed Counter: Counts the number of unhalted core clock cycles",
+        "BriefDescription": "Fixed Counter: Counts the number of unhalted core clock cycles. [This event is alias to CPU_CLK_UNHALTED.CORE]",
         "Counter": "Fixed counter 1",
         "EventName": "CPU_CLK_UNHALTED.THREAD",
         "SampleAfterValue": "2000003",
@@ -230,10 +230,10 @@
         "SampleAfterValue": "2000003"
     },
     {
-        "BriefDescription": "Fixed Counter: Counts the number of instructions retired",
+        "BriefDescription": "Fixed Counter: Counts the number of instructions retired.",
         "Counter": "Fixed counter 0",
         "EventName": "INST_RETIRED.ANY",
-        "PublicDescription": "Fixed Counter: Counts the number of instructions retired Available PDIST counters: 32",
+        "PublicDescription": "Fixed Counter: Counts the number of instructions retired. Available PDIST counters: 32",
         "SampleAfterValue": "2000003",
         "UMask": "0x1"
     },
@@ -309,6 +309,38 @@
         "SampleAfterValue": "1000003",
         "UMask": "0x1"
     },
+    {
+        "BriefDescription": "Counts the number of CLFLUSH, CLWB, and CLDEMOTE instructions retired.",
+        "Counter": "0,1,2,3,4,5,6,7",
+        "EventCode": "0xe0",
+        "EventName": "MISC_RETIRED1.CL_INST",
+        "SampleAfterValue": "1000003",
+        "UMask": "0xff"
+    },
+    {
+        "BriefDescription": "Counts the number of LFENCE instructions retired.",
+        "Counter": "0,1,2,3,4,5,6,7",
+        "EventCode": "0xe0",
+        "EventName": "MISC_RETIRED1.LFENCE",
+        "SampleAfterValue": "1000003",
+        "UMask": "0x2"
+    },
+    {
+        "BriefDescription": "Counts the number of accesses to KeyLocker cache.",
+        "Counter": "0,1,2,3,4,5,6,7",
+        "EventCode": "0xe1",
+        "EventName": "MISC_RETIRED2.KEYLOCKER_ACCESS",
+        "SampleAfterValue": "1000003",
+        "UMask": "0x10"
+    },
+    {
+        "BriefDescription": "Counts the number of misses to KeyLocker cache.",
+        "Counter": "0,1,2,3,4,5,6,7",
+        "EventCode": "0xe1",
+        "EventName": "MISC_RETIRED2.KEYLOCKER_MISS",
+        "SampleAfterValue": "1000003",
+        "UMask": "0x11"
+    },
     {
         "BriefDescription": "Counts the number of issue slots in a UMWAIT or TPAUSE instruction where no uop issues due to the instruction putting the CPU into the C0.1 activity state.",
         "Counter": "0,1,2,3,4,5,6,7",
-- 
2.53.0.414.gf7e9f6c205-goog


