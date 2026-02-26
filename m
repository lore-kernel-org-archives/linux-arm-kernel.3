Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02B00FD8FE4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 18:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:From:Subject
	:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ThXHpIwX96Kri+Lw+1W21ZJXtSkm2MpZVgq630ABzrY=; b=dnaflE6sjv2LmmDJAxmyvCHhEy
	kAPr5IfeFgeL/9M0esiy+PWSszL/aYZdfFN7sKBHnUKXipw9IFAxXyYDuzd2u+c90R+pwnwLjAPDD
	Zw2hd2kX3PIfMTR7yPcI1tU5k5ig4kXed72J4vzyDiuF06hq/lDRkWMIvNFFCUo6Zk/dDgrTo1zIU
	wquceJyqzaBr4rA2tz4EU6dnpttXnLoKDENsW5rtrcu7i/dIakY7Kl2hOMIzit2N8dXWgs5SyfE2j
	X9vdzGcxLs7q4xab+PPlfZoOqlyGOwaNH0rZCMjiUAYHBHAl88Rl0CXoed16ImalgG7riogIYHRZm
	Lp35Ymjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvfed-00000006u0T-3BiT;
	Thu, 26 Feb 2026 18:00:03 +0000
Received: from mail-dy1-x134a.google.com ([2607:f8b0:4864:20::134a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvfeT-00000006trH-05Ef
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 17:59:54 +0000
Received: by mail-dy1-x134a.google.com with SMTP id 5a478bee46e88-2bdd5089976so10710573eec.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Feb 2026 09:59:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772128791; x=1772733591; darn=lists.infradead.org;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ThXHpIwX96Kri+Lw+1W21ZJXtSkm2MpZVgq630ABzrY=;
        b=Ux/pvr09NBnWKEbGxNqKUKVeMTOKcomRj1iurIPbwSlXVuKk0pRnyU6RlkrD4Wgy6Q
         5UNQWLHu8XScRh5IYAVQXuO2/ELXG933F44kbfFA+bOTRLHyeCVBDZk0GG7WOt0OKN8b
         9ZmNssfgkwHhh1QBJ/tXUH8nY2HRdwfpyc1BNdPNYOD+j3hk1h6U1DPTX7yYgU7uAmH3
         VpWQ9bl77yEUSoYtf74dD8/3tee7f9rlOxKryNpYV4+6FYhf0Jeglpua/dZQHFU1I1Ef
         Fe6TVsAatyEQ9UNHhHgF6WnNgePDaRQ2uh5kDe9l4i19urnaAwZi4dqxaIlOFiuC2w7C
         KiGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772128791; x=1772733591;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ThXHpIwX96Kri+Lw+1W21ZJXtSkm2MpZVgq630ABzrY=;
        b=k260dlJuxbM9etmgKm5MNfpGSX7ETqJX8wn33B62t2lJqArvv5oqXVJatsm9y6hDnB
         2QA5TW1KXVGxmY/Yc6aGk8XbreYOy9VWsdxCciB5cVCO73CzAql4cvPToVLCGzemCD9a
         WP19fmJamhrQzYgglb4kj4Q/nWOmsOn/xWyoVs6Jauk83S7Aht9TUECBccVL9ee4CiQM
         sMtchDRAnmZu+gspHC3nTeywOvWsHJUhVTbwaodIIeLTY8WkmENKiv8aYKrSQFXIOheG
         Iup67XA2HwBpNPl2wu14ZHdtUjSimcxwgdKHLBIayJvQEpgMwiE8HZF4keDUTN4e1+dl
         5M7A==
X-Forwarded-Encrypted: i=1; AJvYcCVRXc5V9czTh2arJur/OPYqkVPhgsSzO06HFNq6HbbVW0TH5ZUsj+7Le87nqSb+YNcF708lsk7g/HFTV5BXia6H@lists.infradead.org
X-Gm-Message-State: AOJu0YwPfGXcJn5EAn8sScRKWZwRFleXM6SmZjxt/xbSlWtNzU0JvXKr
	nxkKgCq7+LtOlTshgCtWCz5iy9lk5ONNH1F0O9BVPEMeUkDa29qPooIbrbNfVizjTso6+8JLyek
	m2t8Lz5GHEA==
X-Received: from dybfe10.prod.google.com ([2002:a05:7300:bf8a:b0:2ba:a7a3:e4eb])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:7492:b0:2b8:6abf:5ebf
 with SMTP id 5a478bee46e88-2bdcbf7c168mr2321626eec.12.1772128791306; Thu, 26
 Feb 2026 09:59:51 -0800 (PST)
Date: Thu, 26 Feb 2026 09:59:32 -0800
In-Reply-To: <20260226175936.593159-1-irogers@google.com>
Mime-Version: 1.0
References: <20260226175936.593159-1-irogers@google.com>
X-Mailer: git-send-email 2.53.0.473.g4a7958ca14-goog
Message-ID: <20260226175936.593159-6-irogers@google.com>
Subject: [PATCH v2 06/10] perf vendor events intel: Update lunarlake events
 from 1.19 to 1.21
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
X-CRM114-CacheID: sfid-20260226_095953_069110_4A1B9FF3 
X-CRM114-Status: GOOD (  14.81  )
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
https://github.com/intel/perfmon/commit/d6755a30419d02930889497741552309343bdb1e
https://github.com/intel/perfmon/commit/6c9f684ae1de6229511fd56d1196fdc2db242a41

Signed-off-by: Ian Rogers <irogers@google.com>
---
 .../pmu-events/arch/x86/lunarlake/cache.json  | 36 ++++++++++++++-----
 .../arch/x86/lunarlake/frontend.json          | 27 ++++++++++++++
 .../arch/x86/lunarlake/pipeline.json          | 10 +++---
 tools/perf/pmu-events/arch/x86/mapfile.csv    |  2 +-
 4 files changed, 61 insertions(+), 14 deletions(-)

diff --git a/tools/perf/pmu-events/arch/x86/lunarlake/cache.json b/tools/perf/pmu-events/arch/x86/lunarlake/cache.json
index 3d2616be8ec1..2db3e8a51fbd 100644
--- a/tools/perf/pmu-events/arch/x86/lunarlake/cache.json
+++ b/tools/perf/pmu-events/arch/x86/lunarlake/cache.json
@@ -550,6 +550,24 @@
         "UMask": "0x7e",
         "Unit": "cpu_atom"
     },
+    {
+        "BriefDescription": "Counts the number of unhalted cycles when the core is stalled due to an icache or itlb miss which missed all the caches.",
+        "Counter": "0,1,2,3,4,5,6,7",
+        "EventCode": "0x35",
+        "EventName": "MEM_BOUND_STALLS_IFETCH.LLC_MISS",
+        "SampleAfterValue": "1000003",
+        "UMask": "0x78",
+        "Unit": "cpu_atom"
+    },
+    {
+        "BriefDescription": "Counts the number of unhalted cycles when the core is stalled due to an icache or itlb miss which missed all the caches. Local DRAM, MMIO or other local memory type provides the data.",
+        "Counter": "0,1,2,3,4,5,6,7",
+        "EventCode": "0x35",
+        "EventName": "MEM_BOUND_STALLS_IFETCH.LLC_MISS_LOCALMEM",
+        "SampleAfterValue": "1000003",
+        "UMask": "0x50",
+        "Unit": "cpu_atom"
+    },
     {
         "BriefDescription": "Counts the number of unhalted cycles when the core is stalled due to an L1 demand load miss.",
         "Counter": "0,1,2,3,4,5,6,7",
@@ -1088,7 +1106,7 @@
         "Unit": "cpu_atom"
     },
     {
-        "BriefDescription": "Counts the number of tagged load uops retired that exceed the latency threshold defined in MEC_CR_PEBS_LD_LAT_THRESHOLD - Only counts with PEBS enabled",
+        "BriefDescription": "Counts the number of tagged load uops retired that exceed the latency threshold of 128.",
         "Counter": "0,1",
         "Data_LA": "1",
         "EventCode": "0xd0",
@@ -1100,7 +1118,7 @@
         "Unit": "cpu_atom"
     },
     {
-        "BriefDescription": "Counts the number of tagged load uops retired that exceed the latency threshold defined in MEC_CR_PEBS_LD_LAT_THRESHOLD - Only counts with PEBS enabled",
+        "BriefDescription": "Counts the number of tagged load uops retired that exceed the latency threshold of 16.",
         "Counter": "0,1",
         "Data_LA": "1",
         "EventCode": "0xd0",
@@ -1112,7 +1130,7 @@
         "Unit": "cpu_atom"
     },
     {
-        "BriefDescription": "Counts the number of tagged load uops retired that exceed the latency threshold defined in MEC_CR_PEBS_LD_LAT_THRESHOLD - Only counts with PEBS enabled",
+        "BriefDescription": "Counts the number of tagged load uops retired that exceed the latency threshold of 256.",
         "Counter": "0,1",
         "Data_LA": "1",
         "EventCode": "0xd0",
@@ -1124,7 +1142,7 @@
         "Unit": "cpu_atom"
     },
     {
-        "BriefDescription": "Counts the number of tagged load uops retired that exceed the latency threshold defined in MEC_CR_PEBS_LD_LAT_THRESHOLD - Only counts with PEBS enabled",
+        "BriefDescription": "Counts the number of tagged load uops retired that exceed the latency threshold of 32.",
         "Counter": "0,1",
         "Data_LA": "1",
         "EventCode": "0xd0",
@@ -1136,7 +1154,7 @@
         "Unit": "cpu_atom"
     },
     {
-        "BriefDescription": "Counts the number of tagged load uops retired that exceed the latency threshold defined in MEC_CR_PEBS_LD_LAT_THRESHOLD - Only counts with PEBS enabled",
+        "BriefDescription": "Counts the number of tagged load uops retired that exceed the latency threshold of 4.",
         "Counter": "0,1",
         "Data_LA": "1",
         "EventCode": "0xd0",
@@ -1148,7 +1166,7 @@
         "Unit": "cpu_atom"
     },
     {
-        "BriefDescription": "Counts the number of tagged load uops retired that exceed the latency threshold defined in MEC_CR_PEBS_LD_LAT_THRESHOLD - Only counts with PEBS enabled",
+        "BriefDescription": "Counts the number of tagged load uops retired that exceed the latency threshold of 512.",
         "Counter": "0,1",
         "Data_LA": "1",
         "EventCode": "0xd0",
@@ -1160,7 +1178,7 @@
         "Unit": "cpu_atom"
     },
     {
-        "BriefDescription": "Counts the number of tagged load uops retired that exceed the latency threshold defined in MEC_CR_PEBS_LD_LAT_THRESHOLD - Only counts with PEBS enabled",
+        "BriefDescription": "Counts the number of tagged load uops retired that exceed the latency threshold of 64.",
         "Counter": "0,1",
         "Data_LA": "1",
         "EventCode": "0xd0",
@@ -1172,7 +1190,7 @@
         "Unit": "cpu_atom"
     },
     {
-        "BriefDescription": "Counts the number of tagged load uops retired that exceed the latency threshold defined in MEC_CR_PEBS_LD_LAT_THRESHOLD - Only counts with PEBS enabled",
+        "BriefDescription": "Counts the number of tagged load uops retired that exceed the latency threshold of 8.",
         "Counter": "0,1",
         "Data_LA": "1",
         "EventCode": "0xd0",
@@ -1274,7 +1292,7 @@
         "Unit": "cpu_atom"
     },
     {
-        "BriefDescription": "Counts the number of  stores uops retired same as MEM_UOPS_RETIRED.ALL_STORES",
+        "BriefDescription": "Counts the number of stores uops retired.",
         "Counter": "0,1,2,3,4,5,6,7",
         "Data_LA": "1",
         "EventCode": "0xd0",
diff --git a/tools/perf/pmu-events/arch/x86/lunarlake/frontend.json b/tools/perf/pmu-events/arch/x86/lunarlake/frontend.json
index b21d602e9f1a..798eebf77436 100644
--- a/tools/perf/pmu-events/arch/x86/lunarlake/frontend.json
+++ b/tools/perf/pmu-events/arch/x86/lunarlake/frontend.json
@@ -424,6 +424,15 @@
         "UMask": "0x1",
         "Unit": "cpu_atom"
     },
+    {
+        "BriefDescription": "Counts the number of instructions retired that were tagged because empty issue slots were seen before the uop due to Instruction L1 cache miss, that missed in the L2 cache.",
+        "Counter": "0,1,2,3,4,5,6,7",
+        "EventCode": "0xc9",
+        "EventName": "FRONTEND_RETIRED_SOURCE.ICACHE_L2_MISS",
+        "SampleAfterValue": "1000003",
+        "UMask": "0xe",
+        "Unit": "cpu_atom"
+    },
     {
         "BriefDescription": "Counts the number of instructions retired that were tagged because empty issue slots were seen before the uop due to ITLB miss that hit in the second level TLB.",
         "Counter": "0,1,2,3,4,5,6,7",
@@ -500,6 +509,24 @@
         "UMask": "0x4",
         "Unit": "cpu_core"
     },
+    {
+        "BriefDescription": "Cycles where a code fetch is stalled due to L1 instruction cache In use-full",
+        "Counter": "0,1,2,3,4,5,6,7,8,9",
+        "EventCode": "0x83",
+        "EventName": "ICACHE_TAG.STALLS_INUSE",
+        "SampleAfterValue": "200003",
+        "UMask": "0x10",
+        "Unit": "cpu_core"
+    },
+    {
+        "BriefDescription": "Cycles where a code fetch is stalled due to L1 instruction cache ISB-full",
+        "Counter": "0,1,2,3,4,5,6,7,8,9",
+        "EventCode": "0x83",
+        "EventName": "ICACHE_TAG.STALLS_ISB",
+        "SampleAfterValue": "200003",
+        "UMask": "0x8",
+        "Unit": "cpu_core"
+    },
     {
         "BriefDescription": "Cycles Decode Stream Buffer (DSB) is delivering any Uop",
         "Counter": "0,1,2,3,4,5,6,7,8,9",
diff --git a/tools/perf/pmu-events/arch/x86/lunarlake/pipeline.json b/tools/perf/pmu-events/arch/x86/lunarlake/pipeline.json
index 97797f7b072e..d98723b3cd78 100644
--- a/tools/perf/pmu-events/arch/x86/lunarlake/pipeline.json
+++ b/tools/perf/pmu-events/arch/x86/lunarlake/pipeline.json
@@ -634,7 +634,7 @@
         "Unit": "cpu_core"
     },
     {
-        "BriefDescription": "Fixed Counter: Counts the number of unhalted core clock cycles.",
+        "BriefDescription": "Fixed Counter: Counts the number of unhalted core clock cycles. [This event is alias to CPU_CLK_UNHALTED.THREAD]",
         "Counter": "Fixed counter 1",
         "EventName": "CPU_CLK_UNHALTED.CORE",
         "SampleAfterValue": "2000003",
@@ -725,7 +725,7 @@
         "Unit": "cpu_core"
     },
     {
-        "BriefDescription": "Fixed Counter: Counts the number of unhalted core clock cycles.",
+        "BriefDescription": "Fixed Counter: Counts the number of unhalted core clock cycles. [This event is alias to CPU_CLK_UNHALTED.CORE]",
         "Counter": "Fixed counter 1",
         "EventName": "CPU_CLK_UNHALTED.THREAD",
         "SampleAfterValue": "2000003",
@@ -1530,8 +1530,9 @@
         "Unit": "cpu_atom"
     },
     {
-        "BriefDescription": "Counts the number of accesses to KeyLocker cache.",
+        "BriefDescription": "This event is deprecated.",
         "Counter": "0,1,2,3,4,5,6,7",
+        "Deprecated": "1",
         "EventCode": "0xe1",
         "EventName": "MISC_RETIRED2.KEYLOCKER_ACCESS",
         "SampleAfterValue": "1000003",
@@ -1539,8 +1540,9 @@
         "Unit": "cpu_atom"
     },
     {
-        "BriefDescription": "Counts the number of misses to KeyLocker cache.",
+        "BriefDescription": "This event is deprecated.",
         "Counter": "0,1,2,3,4,5,6,7",
+        "Deprecated": "1",
         "EventCode": "0xe1",
         "EventName": "MISC_RETIRED2.KEYLOCKER_MISS",
         "SampleAfterValue": "1000003",
diff --git a/tools/perf/pmu-events/arch/x86/mapfile.csv b/tools/perf/pmu-events/arch/x86/mapfile.csv
index 96580ffda7bf..a2dde3faad5e 100644
--- a/tools/perf/pmu-events/arch/x86/mapfile.csv
+++ b/tools/perf/pmu-events/arch/x86/mapfile.csv
@@ -22,7 +22,7 @@ GenuineIntel-6-3A,v24,ivybridge,core
 GenuineIntel-6-3E,v24,ivytown,core
 GenuineIntel-6-2D,v24,jaketown,core
 GenuineIntel-6-(57|85),v16,knightslanding,core
-GenuineIntel-6-BD,v1.19,lunarlake,core
+GenuineIntel-6-BD,v1.21,lunarlake,core
 GenuineIntel-6-(AA|AC|B5),v1.18,meteorlake,core
 GenuineIntel-6-1[AEF],v4,nehalemep,core
 GenuineIntel-6-2E,v4,nehalemex,core
-- 
2.53.0.414.gf7e9f6c205-goog


