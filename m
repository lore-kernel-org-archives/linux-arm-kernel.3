Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2D2FFD8FF2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 18:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:From:Subject
	:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T7UyESOxoY8uyeFaFPDUNsLMmM40wZKIi5sdRUJRLzA=; b=27TzIsi7t+TEhJ+SwpByUEO/EL
	nH7CbADWXnU1mz33mk6TkAs/RI6FPzERACAawuBFa7YkUSdTQ0jzjc9pAdLIaK54z88tMWPsNC3Xq
	/BoRQWR2qCTnbQy15U7iPRPXWEHg0cpBg8RRU8UhjO7WJDdPoy1zlGb0Vl++tbk/ls55DvjCpwJDL
	4341EnQjiNqMKTuDA86jGSc3OwAkmybnOiG11qRq2MBjkrDnU5NWQHU8z+gTFq2fYFAR8nm87TDyK
	fHvWf2fCWAm00t0K6ZWQ5/rcMeZBs7rZcsVSrQQ9bkpuxWWQ4mGKew02jO4jE8vxKmZoNjANkwNk1
	F9l7zpkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvfeS-00000006trr-3x8K;
	Thu, 26 Feb 2026 17:59:52 +0000
Received: from mail-dy1-x134a.google.com ([2607:f8b0:4864:20::134a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvfeO-00000006top-07c4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 17:59:49 +0000
Received: by mail-dy1-x134a.google.com with SMTP id 5a478bee46e88-2bdc42265a2so1055264eec.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Feb 2026 09:59:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772128787; x=1772733587; darn=lists.infradead.org;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=T7UyESOxoY8uyeFaFPDUNsLMmM40wZKIi5sdRUJRLzA=;
        b=DTmNITTkQu3l70ZgYOOdwkX1j94mdXc6zCLWrO9EBwT8NvApuYBRU3nPPoDnF6ch2s
         +K9UKrrx+yiDa/RcJMrmtNadAxFFSovjFMH+fyHie/nJ4Z0YLMVnvXEoSmYtWLeRht+H
         lTwmvIVu6+hVo1iuSYunA84Ll4ESt10HYHkW2sBVh+1mSwolrTHMW5H1Uod6/u+s0mzZ
         Op9dki8o8h9Wyfl2enPWf7YRr4aPqifVjfQ5NWxqy4oFp+h2RcEZ3MyqlnIS3w6AhbHe
         Q9UL3d11QdyKTq5s3CU9sSYOE/a01GsYuFbjvhioOWgwJoHhGkSO+oSCSbfzpPkZYIpV
         ETgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772128787; x=1772733587;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T7UyESOxoY8uyeFaFPDUNsLMmM40wZKIi5sdRUJRLzA=;
        b=nMhtYEMSC3sshDcck7uJIXO2R/NgODHE10gQGgJXztXxw1i5IohQPC5VVDIuE15kaY
         czD/rsFWJn4ALraCq62PdwhCPfOHhaWoTgdv1Gd2V2Ffca2IULurvXYyGY8Iv1CQHmyJ
         wVfkCYoBAcDabOJanJg3zuvmzzUkao/jo9BKrntQ+rrMQzc3iHnfFtSLpe9a8BCcyL3J
         cUvbWJzR4FKltOuxnvRz54X+UWzv38GDRZxkNiVpCZahuH/Km8fdV5bbxJ7z/IFVwlYx
         4VbzJz45Cdma/YouPko8W/vI7+osmrsmWjwoEjgngC+lZr6qN+pOjzIcYjOhjJnU4BHi
         e9BQ==
X-Forwarded-Encrypted: i=1; AJvYcCW02EFUNC2Hw+8+NrzLxE+xtdSiMX9IL2nqyeuvx05MxFisWho3WZD/KU9m6KEZPAu5lmCTgdwp8YXtcMuhq8Ne@lists.infradead.org
X-Gm-Message-State: AOJu0Yzjdr5ZiOoSfFtGDJpa+UcYypfxA+R/oKNtkUyao9mRYdElOitu
	EDvqaxrMqYyltZuKvBdyRkqd3gFygUGnlFCRD4QHM7TQPd2NeOJMRGtLXTo13NuHH7rbPNT2kR+
	EzmnFVhNcuw==
X-Received: from dybuo24.prod.google.com ([2002:a05:7301:c018:b0:2bd:ce08:a0d0])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:6c85:b0:2ba:9c19:bdab
 with SMTP id 5a478bee46e88-2bd7bd37204mr8216024eec.28.1772128786722; Thu, 26
 Feb 2026 09:59:46 -0800 (PST)
Date: Thu, 26 Feb 2026 09:59:30 -0800
In-Reply-To: <20260226175936.593159-1-irogers@google.com>
Mime-Version: 1.0
References: <20260226175936.593159-1-irogers@google.com>
X-Mailer: git-send-email 2.53.0.473.g4a7958ca14-goog
Message-ID: <20260226175936.593159-4-irogers@google.com>
Subject: [PATCH v2 04/10] perf vendor events intel: Update grandridge events
 from 1.10 to 1.11
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
X-CRM114-CacheID: sfid-20260226_095948_079106_B83E1E2C 
X-CRM114-Status: GOOD (  12.67  )
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
https://github.com/intel/perfmon/commit/8ada944c087300c4fc79afcd8512aa3b91bd34f2

Signed-off-by: Ian Rogers <irogers@google.com>
---
 .../pmu-events/arch/x86/grandridge/cache.json | 42 +++++++++----------
 .../arch/x86/grandridge/pipeline.json         | 42 ++++++++++++++++---
 tools/perf/pmu-events/arch/x86/mapfile.csv    |  2 +-
 3 files changed, 59 insertions(+), 27 deletions(-)

diff --git a/tools/perf/pmu-events/arch/x86/grandridge/cache.json b/tools/perf/pmu-events/arch/x86/grandridge/cache.json
index 9abddb06a837..0aa921ba89b4 100644
--- a/tools/perf/pmu-events/arch/x86/grandridge/cache.json
+++ b/tools/perf/pmu-events/arch/x86/grandridge/cache.json
@@ -285,8 +285,8 @@
         "UMask": "0x82"
     },
     {
-        "BriefDescription": "Counts the number of tagged load uops retired that exceed the latency threshold defined in MEC_CR_PEBS_LD_LAT_THRESHOLD - Only counts with PEBS enabled.",
-        "Counter": "0,1,2,3,4,5,6,7",
+        "BriefDescription": "Counts the number of tagged load uops retired that exceed the latency threshold of 1024. Only counts with PEBS enabled.",
+        "Counter": "0,1",
         "Data_LA": "1",
         "EventCode": "0xd0",
         "EventName": "MEM_UOPS_RETIRED.LOAD_LATENCY_GT_1024",
@@ -296,8 +296,8 @@
         "UMask": "0x5"
     },
     {
-        "BriefDescription": "Counts the number of tagged load uops retired that exceed the latency threshold defined in MEC_CR_PEBS_LD_LAT_THRESHOLD - Only counts with PEBS enabled.",
-        "Counter": "0,1,2,3,4,5,6,7",
+        "BriefDescription": "Counts the number of tagged load uops retired that exceed the latency threshold of 128. Only counts with PEBS enabled.",
+        "Counter": "0,1",
         "Data_LA": "1",
         "EventCode": "0xd0",
         "EventName": "MEM_UOPS_RETIRED.LOAD_LATENCY_GT_128",
@@ -307,8 +307,8 @@
         "UMask": "0x5"
     },
     {
-        "BriefDescription": "Counts the number of tagged load uops retired that exceed the latency threshold defined in MEC_CR_PEBS_LD_LAT_THRESHOLD - Only counts with PEBS enabled.",
-        "Counter": "0,1,2,3,4,5,6,7",
+        "BriefDescription": "Counts the number of tagged load uops retired that exceed the latency threshold of 16. Only counts with PEBS enabled.",
+        "Counter": "0,1",
         "Data_LA": "1",
         "EventCode": "0xd0",
         "EventName": "MEM_UOPS_RETIRED.LOAD_LATENCY_GT_16",
@@ -318,8 +318,8 @@
         "UMask": "0x5"
     },
     {
-        "BriefDescription": "Counts the number of tagged load uops retired that exceed the latency threshold defined in MEC_CR_PEBS_LD_LAT_THRESHOLD - Only counts with PEBS enabled.",
-        "Counter": "0,1,2,3,4,5,6,7",
+        "BriefDescription": "Counts the number of tagged load uops retired that exceed the latency threshold of 2048. Only counts with PEBS enabled.",
+        "Counter": "0,1",
         "Data_LA": "1",
         "EventCode": "0xd0",
         "EventName": "MEM_UOPS_RETIRED.LOAD_LATENCY_GT_2048",
@@ -329,8 +329,8 @@
         "UMask": "0x5"
     },
     {
-        "BriefDescription": "Counts the number of tagged load uops retired that exceed the latency threshold defined in MEC_CR_PEBS_LD_LAT_THRESHOLD - Only counts with PEBS enabled.",
-        "Counter": "0,1,2,3,4,5,6,7",
+        "BriefDescription": "Counts the number of tagged load uops retired that exceed the latency threshold of 256. Only counts with PEBS enabled.",
+        "Counter": "0,1",
         "Data_LA": "1",
         "EventCode": "0xd0",
         "EventName": "MEM_UOPS_RETIRED.LOAD_LATENCY_GT_256",
@@ -340,8 +340,8 @@
         "UMask": "0x5"
     },
     {
-        "BriefDescription": "Counts the number of tagged load uops retired that exceed the latency threshold defined in MEC_CR_PEBS_LD_LAT_THRESHOLD - Only counts with PEBS enabled.",
-        "Counter": "0,1,2,3,4,5,6,7",
+        "BriefDescription": "Counts the number of tagged load uops retired that exceed the latency threshold of 32. Only counts with PEBS enabled.",
+        "Counter": "0,1",
         "Data_LA": "1",
         "EventCode": "0xd0",
         "EventName": "MEM_UOPS_RETIRED.LOAD_LATENCY_GT_32",
@@ -351,8 +351,8 @@
         "UMask": "0x5"
     },
     {
-        "BriefDescription": "Counts the number of tagged load uops retired that exceed the latency threshold defined in MEC_CR_PEBS_LD_LAT_THRESHOLD - Only counts with PEBS enabled.",
-        "Counter": "0,1,2,3,4,5,6,7",
+        "BriefDescription": "Counts the number of tagged load uops retired that exceed the latency threshold of 4. Only counts with PEBS enabled.",
+        "Counter": "0,1",
         "Data_LA": "1",
         "EventCode": "0xd0",
         "EventName": "MEM_UOPS_RETIRED.LOAD_LATENCY_GT_4",
@@ -362,8 +362,8 @@
         "UMask": "0x5"
     },
     {
-        "BriefDescription": "Counts the number of tagged load uops retired that exceed the latency threshold defined in MEC_CR_PEBS_LD_LAT_THRESHOLD - Only counts with PEBS enabled.",
-        "Counter": "0,1,2,3,4,5,6,7",
+        "BriefDescription": "Counts the number of tagged load uops retired that exceed the latency threshold of 512. Only counts with PEBS enabled.",
+        "Counter": "0,1",
         "Data_LA": "1",
         "EventCode": "0xd0",
         "EventName": "MEM_UOPS_RETIRED.LOAD_LATENCY_GT_512",
@@ -373,8 +373,8 @@
         "UMask": "0x5"
     },
     {
-        "BriefDescription": "Counts the number of tagged load uops retired that exceed the latency threshold defined in MEC_CR_PEBS_LD_LAT_THRESHOLD - Only counts with PEBS enabled.",
-        "Counter": "0,1,2,3,4,5,6,7",
+        "BriefDescription": "Counts the number of tagged load uops retired that exceed the latency threshold of 64. Only counts with PEBS enabled.",
+        "Counter": "0,1",
         "Data_LA": "1",
         "EventCode": "0xd0",
         "EventName": "MEM_UOPS_RETIRED.LOAD_LATENCY_GT_64",
@@ -384,8 +384,8 @@
         "UMask": "0x5"
     },
     {
-        "BriefDescription": "Counts the number of tagged load uops retired that exceed the latency threshold defined in MEC_CR_PEBS_LD_LAT_THRESHOLD - Only counts with PEBS enabled.",
-        "Counter": "0,1,2,3,4,5,6,7",
+        "BriefDescription": "Counts the number of tagged load uops retired that exceed the latency threshold of 8. Only counts with PEBS enabled.",
+        "Counter": "0,1",
         "Data_LA": "1",
         "EventCode": "0xd0",
         "EventName": "MEM_UOPS_RETIRED.LOAD_LATENCY_GT_8",
@@ -458,7 +458,7 @@
         "UMask": "0x12"
     },
     {
-        "BriefDescription": "Counts the number of  stores uops retired same as MEM_UOPS_RETIRED.ALL_STORES",
+        "BriefDescription": "Counts the number of stores uops retired.",
         "Counter": "0,1,2,3,4,5,6,7",
         "Data_LA": "1",
         "EventCode": "0xd0",
diff --git a/tools/perf/pmu-events/arch/x86/grandridge/pipeline.json b/tools/perf/pmu-events/arch/x86/grandridge/pipeline.json
index f56d8d816e53..20986b987e18 100644
--- a/tools/perf/pmu-events/arch/x86/grandridge/pipeline.json
+++ b/tools/perf/pmu-events/arch/x86/grandridge/pipeline.json
@@ -178,7 +178,7 @@
         "UMask": "0xf7"
     },
     {
-        "BriefDescription": "Fixed Counter: Counts the number of unhalted core clock cycles",
+        "BriefDescription": "Fixed Counter: Counts the number of unhalted core clock cycles. [This event is alias to CPU_CLK_UNHALTED.THREAD]",
         "Counter": "Fixed counter 1",
         "EventName": "CPU_CLK_UNHALTED.CORE",
         "SampleAfterValue": "2000003",
@@ -192,7 +192,7 @@
         "SampleAfterValue": "2000003"
     },
     {
-        "BriefDescription": "Fixed Counter: Counts the number of unhalted reference clock cycles",
+        "BriefDescription": "Fixed Counter: Counts the number of unhalted reference clock cycles.",
         "Counter": "Fixed counter 2",
         "EventName": "CPU_CLK_UNHALTED.REF_TSC",
         "SampleAfterValue": "2000003",
@@ -208,7 +208,7 @@
         "UMask": "0x1"
     },
     {
-        "BriefDescription": "Fixed Counter: Counts the number of unhalted core clock cycles",
+        "BriefDescription": "Fixed Counter: Counts the number of unhalted core clock cycles. [This event is alias to CPU_CLK_UNHALTED.CORE]",
         "Counter": "Fixed counter 1",
         "EventName": "CPU_CLK_UNHALTED.THREAD",
         "SampleAfterValue": "2000003",
@@ -222,10 +222,10 @@
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
@@ -301,6 +301,38 @@
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
diff --git a/tools/perf/pmu-events/arch/x86/mapfile.csv b/tools/perf/pmu-events/arch/x86/mapfile.csv
index 92799bc6e9d9..b84035dc5b4f 100644
--- a/tools/perf/pmu-events/arch/x86/mapfile.csv
+++ b/tools/perf/pmu-events/arch/x86/mapfile.csv
@@ -12,7 +12,7 @@ GenuineIntel-6-9[6C],v1.05,elkhartlake,core
 GenuineIntel-6-CF,v1.21,emeraldrapids,core
 GenuineIntel-6-5[CF],v13,goldmont,core
 GenuineIntel-6-7A,v1.01,goldmontplus,core
-GenuineIntel-6-B6,v1.10,grandridge,core
+GenuineIntel-6-B6,v1.11,grandridge,core
 GenuineIntel-6-A[DE],v1.16,graniterapids,core
 GenuineIntel-6-(3C|45|46),v36,haswell,core
 GenuineIntel-6-3F,v29,haswellx,core
-- 
2.53.0.414.gf7e9f6c205-goog


