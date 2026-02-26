Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B158FD4616
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 04:53:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:From:Subject
	:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ThXHpIwX96Kri+Lw+1W21ZJXtSkm2MpZVgq630ABzrY=; b=KIQoBNgKIN8oSoE/LEQptHcJ6F
	PYqSYRsXZIuRxQAdvGOWNtX6sedmLmOU0+hOfpKgRrdS2hwXiEcAsw2hE9+4u5vEXf9Sp4h02Q/Gr
	w5HHjNnPHOVzrhgRyYhclwhMsWFgv9bNyxtLBhKOsp47mp6zEDKbw44nHrncoD83e506W8nDmzKIF
	woM8Z/hzM92Z8Bh3Zz8TU7ty/aFIQxAAdkum5mUkb0DLBfT3YL/xLgFznmdej+0WpuqEbIbAkJq57
	zEVu1i9pWeuiZ91TkQ2mrHMPT5eZ+cGp2+7pkQ10bFCSXF28P+swtxL/Q0plWpyHBy+HLdBm51Lqg
	tHdMeP8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvTNS-00000005NuN-1eLD;
	Thu, 26 Feb 2026 04:53:30 +0000
Received: from mail-dl1-x1249.google.com ([2607:f8b0:4864:20::1249])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvTNH-00000005NmW-1yLB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 04:53:20 +0000
Received: by mail-dl1-x1249.google.com with SMTP id a92af1059eb24-12733e595e5so796704c88.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Feb 2026 20:53:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772081598; x=1772686398; darn=lists.infradead.org;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ThXHpIwX96Kri+Lw+1W21ZJXtSkm2MpZVgq630ABzrY=;
        b=UPI+z65NWmMVu6Scz1vqIkcLU9qHj8b54dqOZEjnYr6PkSXmVL1HiZRjqq2PqD+zyi
         Z9TkWPCW1LNNHW4nHN/QQQrzjL6qiKacPFUx8WpVmd6eMUs68L8ObXNIkjx8FAczavqS
         pcfNoBSrUR3knJd8gRaHJ5lRdnNx+1jQ+zLpOFhar+/yUXb4fmILQMiUsCCkFWgl1WC7
         Rj4B44J5jMcxjNmtOisQTx4lEHBGX0YukXNbw8pVhmlZPaolfUgT8xWFyjJVNbpKzRqN
         cVU1UVjduAyOQePpeHZCbM6CfFILM1hPYMNXlz00xIHqVqgnTuxgW4++L7REPGN5OmEq
         2euA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772081598; x=1772686398;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ThXHpIwX96Kri+Lw+1W21ZJXtSkm2MpZVgq630ABzrY=;
        b=Qfrx4Rt5YzxLDAcd98MU0GA/D4bURzmE7sOd28IwE3iRNtK8Q3p7lpA77b4mScSMzf
         ISdo04uOZ9/FvvXkOnECY8W4p2mpA0FVhqbvyRGYaPcjIqlGS5LbDqFWNGZcG3K1ZPWr
         EZ7pKpXwuMcL+a28RQfT3ZtayIr5dTBBcEw1wMpZoBuEE+HdrAqu6weVN1c6tpOAksaL
         AnqL/EVqaSCzwf2WnSr8T96b0OtJb2iu6EyJInqDjNNwjR+HRe0i3boPSwT7oDCrSUZm
         Y65j/MJpHLKVrlmpCUYv8KfaJqMNOTN63+wDepJbCUcA0NzNSmZhzMkm9i5ZDuAtYdJZ
         djZA==
X-Forwarded-Encrypted: i=1; AJvYcCX3Y/oaTDetXM3EeNcAtIynSGvn4WzxVW66eLHD1GJd15FWEz9oMJkEQ4ogqMDwzXet/T0aWH/efs9HSIOMYhZB@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+nKgCCaiSbrWTqVpGXkmN+Oh7LIxunrl8xJMIh1JxPgpbWttl
	MPZydNsGJDZJZaSiJE2mk+ZFzfoWteZWYZ9+mH5owyt2BYUZn129mDzOkHaS7JyZ+RuuSi+do+c
	hC35n3/egSg==
X-Received: from dlbtz9.prod.google.com ([2002:a05:7022:eac9:b0:127:597a:3442])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:4581:b0:127:3b1e:7e0e
 with SMTP id a92af1059eb24-12786966ab1mr1336156c88.20.1772081597866; Wed, 25
 Feb 2026 20:53:17 -0800 (PST)
Date: Wed, 25 Feb 2026 20:52:57 -0800
In-Reply-To: <20260226045301.459948-1-irogers@google.com>
Mime-Version: 1.0
References: <20260226045301.459948-1-irogers@google.com>
X-Mailer: git-send-email 2.53.0.414.gf7e9f6c205-goog
Message-ID: <20260226045301.459948-6-irogers@google.com>
Subject: [PATCH v1 06/10] perf vendor events intel: Update lunarlake events
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
X-CRM114-CacheID: sfid-20260225_205319_523612_B1330BC2 
X-CRM114-Status: GOOD (  15.13  )
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


