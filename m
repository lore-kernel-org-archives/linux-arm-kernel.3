Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A414CFD4616
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 04:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:To:From:Subject:Message-ID:References:Mime-Version:In-Reply-To:
	Date:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7SUhHGcSvPdY3f2YHlFAaLTVvEMlxJuiazk0owD9tgg=; b=QXlZoDfn6NFyqPx6R0gJtJlMY/
	ZF78+jf6LCzFerc3Cgt2UgBf2g+0/pLQJjPzJphkFq+zaSfcBAdjrmuxH4HbyJI5IQ6DLmaz+aihq
	scYQb2vj3qjRhFtXalV2Ki8UNPZom3KdQWjiNDFZdv5ok9WHNQ5xUm5ts4K2jlMVtzTBgkYlO0Rd0
	cAKVIuQxqBcl6yWPvIm/T+AlJ41sfJ1SNVX5mxMumhZjLIH+lBUqZ3TJ6mAWXLp+gwtWikkUDhD+v
	B4c1y2KrHUhoxIOA8/tIHA4t/OI+Z8Bg8+B2FRlTYfF0nNSjRFNlB/CvG/309M9Crh6ZJSKcAKO10
	Ojdm9W+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvTNE-00000005NlD-492i;
	Thu, 26 Feb 2026 04:53:16 +0000
Received: from mail-dl1-x1249.google.com ([2607:f8b0:4864:20::1249])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvTN8-00000005NiN-2T8H
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 04:53:11 +0000
Received: by mail-dl1-x1249.google.com with SMTP id a92af1059eb24-1273665df8fso652029c88.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Feb 2026 20:53:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772081589; x=1772686389; darn=lists.infradead.org;
        h=content-transfer-encoding:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7SUhHGcSvPdY3f2YHlFAaLTVvEMlxJuiazk0owD9tgg=;
        b=yzCQTPqxYIND6cSWlNjOGrnA95WKwmA8eVtFBb9x8M9qeYqRyL8KDJs8beLj7y91jQ
         2rEGXbUttWF6n9cmSK+7onsOqw2ZeEYWgPxwZFGYcRbpsmslV4nzhTdHkfJ5tU2sehX9
         via2BSGZB/RLufxdld9AbgRsKHOP0Shoty0KAMah3/JYSZQPuflscGjnvwNfvP7Mc5kg
         qxAagmgudOqbSFvEbbC07IG6FYyd4f/EjFcynPtDlJkSMXZSNd89Mhf+RsqqGBTFdNiD
         +BNhiXhOexZ8hI53/M/YToyqM1Y/rMVjQ5pwKuJwwpuRZDJs6taT6UVkKOPIslUASm1R
         LhBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772081589; x=1772686389;
        h=content-transfer-encoding:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=7SUhHGcSvPdY3f2YHlFAaLTVvEMlxJuiazk0owD9tgg=;
        b=YOLFR/293T+M1J7rSMKv7bz72yA9HOiIPSg1ZE6uGeiazMZbs3gcH4OaTrms9ukDQz
         jkYJ1EqauWa8ShikX8ZbKMvZ+d+L43ABsVrMW4J/roW5mHGWbBTkxxiGnAuLgHw4z5Qh
         bwAzlsTj5siBBc6xeFOG77s4001eU7TQ55GpZKOqtxeivEgTp4ErOAUvqyVUXfmqzmJ1
         mEqDk9ti9jcMhwlYTFFBc3SVkqhHR4d9F3mZzNWAX0qO2VqpDsY04bweqgeErjhCbkTJ
         ccTB+yeUlsOM9fOJvMsiK2IxLfKDTTTQbUD7vVci7pYoBd14Glm6KC9jGZAgmDMwrHT1
         u1hA==
X-Forwarded-Encrypted: i=1; AJvYcCVu7djDeiTr12/sFdVd6kzrunlFMKossHpbW5WaKT4FsbupwvknU3hFxJ3rf4xSmLO652hb/ndSt7DXnbht6SEV@lists.infradead.org
X-Gm-Message-State: AOJu0YyHVjjoSXQg7Qbbcp3Xy9EISmOwp0qyARo9xv38Mdl7FelhLFKX
	g63bqPFsmJDfzl3fA/xjpNsfXJXmAfqIFzb5y9HZpFg3hm7HrT9if4olSKsIib/+sUbFV4Yg+Hv
	bmLRj4ukikw==
X-Received: from dlbeg32.prod.google.com ([2002:a05:7022:fa0:b0:123:2800:6acb])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:50d:b0:127:5c70:930
 with SMTP id a92af1059eb24-12789ce8a88mr323568c88.43.1772081588738; Wed, 25
 Feb 2026 20:53:08 -0800 (PST)
Date: Wed, 25 Feb 2026 20:52:53 -0800
In-Reply-To: <20260226045301.459948-1-irogers@google.com>
Mime-Version: 1.0
References: <20260226045301.459948-1-irogers@google.com>
X-Mailer: git-send-email 2.53.0.414.gf7e9f6c205-goog
Message-ID: <20260226045301.459948-2-irogers@google.com>
Subject: [PATCH v1 02/10] perf vendor events intel: Update arrowlake events
 from 1.14 to 1.16
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
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_205310_651067_74F7C9B1 
X-CRM114-Status: GOOD (  15.02  )
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
https://github.com/intel/perfmon/commit/f0267f720eeab3b5416886c9e0e132fafcb=
38bbd
https://github.com/intel/perfmon/commit/d40cfa317e567fb5e8f6cbd92c81feeb7e6=
bd3dd

Signed-off-by: Ian Rogers <irogers@google.com>
---
 .../pmu-events/arch/x86/arrowlake/cache.json  | 103 ++++++++++++++----
 .../arch/x86/arrowlake/frontend.json          |  18 +++
 .../arch/x86/arrowlake/pipeline.json          |  40 +++++--
 tools/perf/pmu-events/arch/x86/mapfile.csv    |   2 +-
 4 files changed, 135 insertions(+), 28 deletions(-)

diff --git a/tools/perf/pmu-events/arch/x86/arrowlake/cache.json b/tools/pe=
rf/pmu-events/arch/x86/arrowlake/cache.json
index fba4a0672f6c..4c3aa1fab5a8 100644
--- a/tools/perf/pmu-events/arch/x86/arrowlake/cache.json
+++ b/tools/perf/pmu-events/arch/x86/arrowlake/cache.json
@@ -628,6 +628,15 @@
         "UMask": "0x7f",
         "Unit": "cpu_atom"
     },
+    {
+        "BriefDescription": "Counts the number of unhalted cycles when the=
 core is stalled due to an instruction cache or TLB miss.",
+        "Counter": "0,1,2,3,4,5,6,7",
+        "EventCode": "0x35",
+        "EventName": "MEM_BOUND_STALLS_IFETCH.ALL",
+        "SampleAfterValue": "1000003",
+        "UMask": "0x7f",
+        "Unit": "cpu_lowpower"
+    },
     {
         "BriefDescription": "Counts the number of cycles the core is stall=
ed due to an instruction cache or TLB miss which hit in the L2 cache.",
         "Counter": "0,1,2,3,4,5,6,7",
@@ -731,6 +740,24 @@
         "UMask": "0x6",
         "Unit": "cpu_atom"
     },
+    {
+        "BriefDescription": "Counts the number of unhalted cycles that the=
 core is stalled due to a demand load miss which hit in the LLC, no snoop w=
as required, and the LLC provided data",
+        "Counter": "0,1,2,3,4,5,6,7",
+        "EventCode": "0x34",
+        "EventName": "MEM_BOUND_STALLS_LOAD.LLC_HIT_NOSNOOP",
+        "SampleAfterValue": "1000003",
+        "UMask": "0x2",
+        "Unit": "cpu_atom"
+    },
+    {
+        "BriefDescription": "Counts the number of unhalted cycles when the=
 core is stalled due to a demand load miss which hit in the LLC, a snoop wa=
s required, the snoop misses or the snoop hits but no fwd. LLC provides the=
 data",
+        "Counter": "0,1,2,3,4,5,6,7",
+        "EventCode": "0x34",
+        "EventName": "MEM_BOUND_STALLS_LOAD.LLC_HIT_SNOOP",
+        "SampleAfterValue": "1000003",
+        "UMask": "0x4",
+        "Unit": "cpu_atom"
+    },
     {
         "BriefDescription": "Counts the number of unhalted cycles when the=
 core is stalled due to a demand load miss which missed all the local cache=
s.",
         "Counter": "0,1,2,3,4,5,6,7",
@@ -749,6 +776,24 @@
         "UMask": "0x78",
         "Unit": "cpu_lowpower"
     },
+    {
+        "BriefDescription": "Counts the number of unhalted cycles when the=
 core is stalled due to a demand load miss which missed all the caches.  DR=
AM, MMIO or other LOCAL memory type provides the data",
+        "Counter": "0,1,2,3,4,5,6,7",
+        "EventCode": "0x34",
+        "EventName": "MEM_BOUND_STALLS_LOAD.LLC_MISS_LOCALMEM",
+        "SampleAfterValue": "1000003",
+        "UMask": "0x50",
+        "Unit": "cpu_atom"
+    },
+    {
+        "BriefDescription": "Counts the number of unhalted cycles when the=
 core is stalled to a demand load miss and the data was provided from an un=
known source. If the core has access to an L3 cache, an LLC miss refers to =
an L3 cache miss, otherwise it is an L2 cache miss.",
+        "Counter": "0,1,2,3,4,5,6,7",
+        "EventCode": "0x34",
+        "EventName": "MEM_BOUND_STALLS_LOAD.LLC_MISS_LOCALMEM",
+        "SampleAfterValue": "1000003",
+        "UMask": "0x50",
+        "Unit": "cpu_lowpower"
+    },
     {
         "BriefDescription": "Counts the number of unhalted cycles when the=
 core is stalled to a store buffer full condition",
         "Counter": "0,1,2,3,4,5,6,7",
@@ -1081,6 +1126,15 @@
         "UMask": "0x20",
         "Unit": "cpu_core"
     },
+    {
+        "BriefDescription": "Counts the number of retired load ops with an=
 unknown source",
+        "Counter": "0,1,2,3,4,5,6,7",
+        "EventCode": "0xd4",
+        "EventName": "MEM_LOAD_UOPS_MISC_RETIRED.LOCAL_DRAM",
+        "SampleAfterValue": "1000003",
+        "UMask": "0x2",
+        "Unit": "cpu_atom"
+    },
     {
         "BriefDescription": "Counts the number of load ops retired that mi=
ss the L3 cache and hit in DRAM",
         "Counter": "0,1,2,3,4,5,6,7",
@@ -1181,6 +1235,15 @@
         "UMask": "0x1c",
         "Unit": "cpu_lowpower"
     },
+    {
+        "BriefDescription": "Counts the number of load ops retired that hi=
t in the L3 cache in which no snoop was required",
+        "Counter": "0,1,2,3,4,5,6,7",
+        "EventCode": "0xd1",
+        "EventName": "MEM_LOAD_UOPS_RETIRED.L3_HIT_NO_SNOOP",
+        "SampleAfterValue": "1000003",
+        "UMask": "0x4",
+        "Unit": "cpu_atom"
+    },
     {
         "BriefDescription": "Counts the number of loads that hit in a writ=
e combining buffer (WCB), excluding the first load that caused the WCB to a=
llocate.",
         "Counter": "0,1,2,3,4,5,6,7",
@@ -1331,7 +1394,7 @@
         "Unit": "cpu_lowpower"
     },
     {
-        "BriefDescription": "Counts the number of tagged load uops retired=
 that exceed the latency threshold defined in MEC_CR_PEBS_LD_LAT_THRESHOLD =
- Only counts with PEBS enabled.",
+        "BriefDescription": "Counts the number of tagged load uops retired=
 that exceed the latency threshold of 1024. Only counts with PEBS enabled."=
,
         "Counter": "0,1",
         "Data_LA": "1",
         "EventCode": "0xd0",
@@ -1343,7 +1406,7 @@
         "Unit": "cpu_lowpower"
     },
     {
-        "BriefDescription": "Counts the number of tagged load uops retired=
 that exceed the latency threshold defined in MEC_CR_PEBS_LD_LAT_THRESHOLD =
- Only counts with PEBS enabled",
+        "BriefDescription": "Counts the number of tagged load uops retired=
 that exceed the latency threshold of 128.",
         "Counter": "0,1",
         "Data_LA": "1",
         "EventCode": "0xd0",
@@ -1355,7 +1418,7 @@
         "Unit": "cpu_atom"
     },
     {
-        "BriefDescription": "Counts the number of tagged load uops retired=
 that exceed the latency threshold defined in MEC_CR_PEBS_LD_LAT_THRESHOLD =
- Only counts with PEBS enabled.",
+        "BriefDescription": "Counts the number of tagged load uops retired=
 that exceed the latency threshold of 128. Only counts with PEBS enabled.",
         "Counter": "0,1",
         "Data_LA": "1",
         "EventCode": "0xd0",
@@ -1367,7 +1430,7 @@
         "Unit": "cpu_lowpower"
     },
     {
-        "BriefDescription": "Counts the number of tagged load uops retired=
 that exceed the latency threshold defined in MEC_CR_PEBS_LD_LAT_THRESHOLD =
- Only counts with PEBS enabled",
+        "BriefDescription": "Counts the number of tagged load uops retired=
 that exceed the latency threshold of 16.",
         "Counter": "0,1",
         "Data_LA": "1",
         "EventCode": "0xd0",
@@ -1379,7 +1442,7 @@
         "Unit": "cpu_atom"
     },
     {
-        "BriefDescription": "Counts the number of tagged load uops retired=
 that exceed the latency threshold defined in MEC_CR_PEBS_LD_LAT_THRESHOLD =
- Only counts with PEBS enabled.",
+        "BriefDescription": "Counts the number of tagged load uops retired=
 that exceed the latency threshold of 16. Only counts with PEBS enabled.",
         "Counter": "0,1",
         "Data_LA": "1",
         "EventCode": "0xd0",
@@ -1391,7 +1454,7 @@
         "Unit": "cpu_lowpower"
     },
     {
-        "BriefDescription": "Counts the number of tagged load uops retired=
 that exceed the latency threshold defined in MEC_CR_PEBS_LD_LAT_THRESHOLD =
- Only counts with PEBS enabled.",
+        "BriefDescription": "Counts the number of tagged load uops retired=
 that exceed the latency threshold of 2048. Only counts with PEBS enabled."=
,
         "Counter": "0,1",
         "Data_LA": "1",
         "EventCode": "0xd0",
@@ -1403,7 +1466,7 @@
         "Unit": "cpu_lowpower"
     },
     {
-        "BriefDescription": "Counts the number of tagged load uops retired=
 that exceed the latency threshold defined in MEC_CR_PEBS_LD_LAT_THRESHOLD =
- Only counts with PEBS enabled",
+        "BriefDescription": "Counts the number of tagged load uops retired=
 that exceed the latency threshold of 256.",
         "Counter": "0,1",
         "Data_LA": "1",
         "EventCode": "0xd0",
@@ -1415,7 +1478,7 @@
         "Unit": "cpu_atom"
     },
     {
-        "BriefDescription": "Counts the number of tagged load uops retired=
 that exceed the latency threshold defined in MEC_CR_PEBS_LD_LAT_THRESHOLD =
- Only counts with PEBS enabled.",
+        "BriefDescription": "Counts the number of tagged load uops retired=
 that exceed the latency threshold of 256. Only counts with PEBS enabled.",
         "Counter": "0,1",
         "Data_LA": "1",
         "EventCode": "0xd0",
@@ -1427,7 +1490,7 @@
         "Unit": "cpu_lowpower"
     },
     {
-        "BriefDescription": "Counts the number of tagged load uops retired=
 that exceed the latency threshold defined in MEC_CR_PEBS_LD_LAT_THRESHOLD =
- Only counts with PEBS enabled",
+        "BriefDescription": "Counts the number of tagged load uops retired=
 that exceed the latency threshold of 32.",
         "Counter": "0,1",
         "Data_LA": "1",
         "EventCode": "0xd0",
@@ -1439,7 +1502,7 @@
         "Unit": "cpu_atom"
     },
     {
-        "BriefDescription": "Counts the number of tagged load uops retired=
 that exceed the latency threshold defined in MEC_CR_PEBS_LD_LAT_THRESHOLD =
- Only counts with PEBS enabled.",
+        "BriefDescription": "Counts the number of tagged load uops retired=
 that exceed the latency threshold of 32. Only counts with PEBS enabled.",
         "Counter": "0,1",
         "Data_LA": "1",
         "EventCode": "0xd0",
@@ -1451,7 +1514,7 @@
         "Unit": "cpu_lowpower"
     },
     {
-        "BriefDescription": "Counts the number of tagged load uops retired=
 that exceed the latency threshold defined in MEC_CR_PEBS_LD_LAT_THRESHOLD =
- Only counts with PEBS enabled",
+        "BriefDescription": "Counts the number of tagged load uops retired=
 that exceed the latency threshold of 4.",
         "Counter": "0,1",
         "Data_LA": "1",
         "EventCode": "0xd0",
@@ -1463,7 +1526,7 @@
         "Unit": "cpu_atom"
     },
     {
-        "BriefDescription": "Counts the number of tagged load uops retired=
 that exceed the latency threshold defined in MEC_CR_PEBS_LD_LAT_THRESHOLD =
- Only counts with PEBS enabled.",
+        "BriefDescription": "Counts the number of tagged load uops retired=
 that exceed the latency threshold of 4. Only counts with PEBS enabled.",
         "Counter": "0,1",
         "Data_LA": "1",
         "EventCode": "0xd0",
@@ -1475,7 +1538,7 @@
         "Unit": "cpu_lowpower"
     },
     {
-        "BriefDescription": "Counts the number of tagged load uops retired=
 that exceed the latency threshold defined in MEC_CR_PEBS_LD_LAT_THRESHOLD =
- Only counts with PEBS enabled",
+        "BriefDescription": "Counts the number of tagged load uops retired=
 that exceed the latency threshold of 512.",
         "Counter": "0,1",
         "Data_LA": "1",
         "EventCode": "0xd0",
@@ -1487,7 +1550,7 @@
         "Unit": "cpu_atom"
     },
     {
-        "BriefDescription": "Counts the number of tagged load uops retired=
 that exceed the latency threshold defined in MEC_CR_PEBS_LD_LAT_THRESHOLD =
- Only counts with PEBS enabled.",
+        "BriefDescription": "Counts the number of tagged load uops retired=
 that exceed the latency threshold of 512. Only counts with PEBS enabled.",
         "Counter": "0,1",
         "Data_LA": "1",
         "EventCode": "0xd0",
@@ -1499,7 +1562,7 @@
         "Unit": "cpu_lowpower"
     },
     {
-        "BriefDescription": "Counts the number of tagged load uops retired=
 that exceed the latency threshold defined in MEC_CR_PEBS_LD_LAT_THRESHOLD =
- Only counts with PEBS enabled",
+        "BriefDescription": "Counts the number of tagged load uops retired=
 that exceed the latency threshold of 64.",
         "Counter": "0,1",
         "Data_LA": "1",
         "EventCode": "0xd0",
@@ -1511,7 +1574,7 @@
         "Unit": "cpu_atom"
     },
     {
-        "BriefDescription": "Counts the number of tagged load uops retired=
 that exceed the latency threshold defined in MEC_CR_PEBS_LD_LAT_THRESHOLD =
- Only counts with PEBS enabled.",
+        "BriefDescription": "Counts the number of tagged load uops retired=
 that exceed the latency threshold of 64. Only counts with PEBS enabled.",
         "Counter": "0,1",
         "Data_LA": "1",
         "EventCode": "0xd0",
@@ -1523,7 +1586,7 @@
         "Unit": "cpu_lowpower"
     },
     {
-        "BriefDescription": "Counts the number of tagged load uops retired=
 that exceed the latency threshold defined in MEC_CR_PEBS_LD_LAT_THRESHOLD =
- Only counts with PEBS enabled",
+        "BriefDescription": "Counts the number of tagged load uops retired=
 that exceed the latency threshold of 8.",
         "Counter": "0,1",
         "Data_LA": "1",
         "EventCode": "0xd0",
@@ -1535,7 +1598,7 @@
         "Unit": "cpu_atom"
     },
     {
-        "BriefDescription": "Counts the number of tagged load uops retired=
 that exceed the latency threshold defined in MEC_CR_PEBS_LD_LAT_THRESHOLD =
- Only counts with PEBS enabled.",
+        "BriefDescription": "Counts the number of tagged load uops retired=
 that exceed the latency threshold of 8. Only counts with PEBS enabled.",
         "Counter": "0,1",
         "Data_LA": "1",
         "EventCode": "0xd0",
@@ -1707,7 +1770,7 @@
         "Unit": "cpu_lowpower"
     },
     {
-        "BriefDescription": "Counts the number of  stores uops retired sam=
e as MEM_UOPS_RETIRED.ALL_STORES",
+        "BriefDescription": "Counts the number of stores uops retired.",
         "Counter": "0,1,2,3,4,5,6,7",
         "Data_LA": "1",
         "EventCode": "0xd0",
@@ -1717,7 +1780,7 @@
         "Unit": "cpu_atom"
     },
     {
-        "BriefDescription": "Counts the number of  stores uops retired sam=
e as MEM_UOPS_RETIRED.ALL_STORES",
+        "BriefDescription": "Counts the number of stores uops retired.",
         "Counter": "0,1,2,3,4,5,6,7",
         "Data_LA": "1",
         "EventCode": "0xd0",
diff --git a/tools/perf/pmu-events/arch/x86/arrowlake/frontend.json b/tools=
/perf/pmu-events/arch/x86/arrowlake/frontend.json
index a15de050a76c..21f00eafa98a 100644
--- a/tools/perf/pmu-events/arch/x86/arrowlake/frontend.json
+++ b/tools/perf/pmu-events/arch/x86/arrowlake/frontend.json
@@ -627,6 +627,24 @@
         "UMask": "0x4",
         "Unit": "cpu_core"
     },
+    {
+        "BriefDescription": "Cycles where a code fetch is stalled due to L=
1 instruction cache In use-full",
+        "Counter": "0,1,2,3,4,5,6,7,8,9",
+        "EventCode": "0x83",
+        "EventName": "ICACHE_TAG.STALLS_INUSE",
+        "SampleAfterValue": "200003",
+        "UMask": "0x10",
+        "Unit": "cpu_core"
+    },
+    {
+        "BriefDescription": "Cycles where a code fetch is stalled due to L=
1 instruction cache ISB-full",
+        "Counter": "0,1,2,3,4,5,6,7,8,9",
+        "EventCode": "0x83",
+        "EventName": "ICACHE_TAG.STALLS_ISB",
+        "SampleAfterValue": "200003",
+        "UMask": "0x8",
+        "Unit": "cpu_core"
+    },
     {
         "BriefDescription": "Cycles Decode Stream Buffer (DSB) is deliveri=
ng any Uop",
         "Counter": "0,1,2,3,4,5,6,7,8,9",
diff --git a/tools/perf/pmu-events/arch/x86/arrowlake/pipeline.json b/tools=
/perf/pmu-events/arch/x86/arrowlake/pipeline.json
index 805616052925..fb973c75be57 100644
--- a/tools/perf/pmu-events/arch/x86/arrowlake/pipeline.json
+++ b/tools/perf/pmu-events/arch/x86/arrowlake/pipeline.json
@@ -822,7 +822,7 @@
         "Unit": "cpu_core"
     },
     {
-        "BriefDescription": "Fixed Counter: Counts the number of unhalted =
core clock cycles.",
+        "BriefDescription": "Fixed Counter: Counts the number of unhalted =
core clock cycles. [This event is alias to CPU_CLK_UNHALTED.THREAD]",
         "Counter": "Fixed counter 1",
         "EventName": "CPU_CLK_UNHALTED.CORE",
         "SampleAfterValue": "2000003",
@@ -839,7 +839,7 @@
         "Unit": "cpu_core"
     },
     {
-        "BriefDescription": "Fixed Counter: Counts the number of unhalted =
core clock cycles",
+        "BriefDescription": "Fixed Counter: Counts the number of unhalted =
core clock cycles. [This event is alias to CPU_CLK_UNHALTED.THREAD]",
         "Counter": "Fixed counter 1",
         "EventName": "CPU_CLK_UNHALTED.CORE",
         "SampleAfterValue": "2000003",
@@ -909,7 +909,7 @@
         "Unit": "cpu_core"
     },
     {
-        "BriefDescription": "Fixed Counter: Counts the number of unhalted =
reference clock cycles",
+        "BriefDescription": "Fixed Counter: Counts the number of unhalted =
reference clock cycles.",
         "Counter": "Fixed counter 2",
         "EventName": "CPU_CLK_UNHALTED.REF_TSC",
         "SampleAfterValue": "2000003",
@@ -947,7 +947,7 @@
         "Unit": "cpu_lowpower"
     },
     {
-        "BriefDescription": "Fixed Counter: Counts the number of unhalted =
core clock cycles.",
+        "BriefDescription": "Fixed Counter: Counts the number of unhalted =
core clock cycles. [This event is alias to CPU_CLK_UNHALTED.CORE]",
         "Counter": "Fixed counter 1",
         "EventName": "CPU_CLK_UNHALTED.THREAD",
         "SampleAfterValue": "2000003",
@@ -964,7 +964,7 @@
         "Unit": "cpu_core"
     },
     {
-        "BriefDescription": "Fixed Counter: Counts the number of unhalted =
core clock cycles",
+        "BriefDescription": "Fixed Counter: Counts the number of unhalted =
core clock cycles. [This event is alias to CPU_CLK_UNHALTED.CORE]",
         "Counter": "Fixed counter 1",
         "EventName": "CPU_CLK_UNHALTED.THREAD",
         "SampleAfterValue": "2000003",
@@ -1134,10 +1134,10 @@
         "Unit": "cpu_core"
     },
     {
-        "BriefDescription": "Fixed Counter: Counts the number of instructi=
ons retired",
+        "BriefDescription": "Fixed Counter: Counts the number of instructi=
ons retired.",
         "Counter": "Fixed counter 0",
         "EventName": "INST_RETIRED.ANY",
-        "PublicDescription": "Fixed Counter: Counts the number of instruct=
ions retired Available PDIST counters: 32",
+        "PublicDescription": "Fixed Counter: Counts the number of instruct=
ions retired. Available PDIST counters: 32",
         "SampleAfterValue": "2000003",
         "UMask": "0x1",
         "Unit": "cpu_lowpower"
@@ -1607,6 +1607,14 @@
         "SampleAfterValue": "20003",
         "Unit": "cpu_atom"
     },
+    {
+        "BriefDescription": "Counts the total number of machine clears for=
 any reason including, but not limited to, memory ordering, memory disambig=
uation, SMC, and FP assist.",
+        "Counter": "0,1,2,3,4,5,6,7",
+        "EventCode": "0xc3",
+        "EventName": "MACHINE_CLEARS.ANY",
+        "SampleAfterValue": "20003",
+        "Unit": "cpu_lowpower"
+    },
     {
         "BriefDescription": "Counts the number of machine clears that flus=
h the pipeline and restart the machine without the use of microcode.",
         "Counter": "0,1,2,3,4,5,6,7",
@@ -1813,6 +1821,15 @@
         "UMask": "0xff",
         "Unit": "cpu_atom"
     },
+    {
+        "BriefDescription": "Counts the number of CLFLUSH, CLWB, and CLDEM=
OTE instructions retired.",
+        "Counter": "0,1,2,3,4,5,6,7",
+        "EventCode": "0xe0",
+        "EventName": "MISC_RETIRED1.CL_INST",
+        "SampleAfterValue": "1000003",
+        "UMask": "0xff",
+        "Unit": "cpu_lowpower"
+    },
     {
         "BriefDescription": "Counts the number of LFENCE instructions reti=
red.",
         "Counter": "0,1,2,3,4,5,6,7",
@@ -1822,6 +1839,15 @@
         "UMask": "0x2",
         "Unit": "cpu_atom"
     },
+    {
+        "BriefDescription": "Counts the number of LFENCE instructions reti=
red.",
+        "Counter": "0,1,2,3,4,5,6,7",
+        "EventCode": "0xe0",
+        "EventName": "MISC_RETIRED1.LFENCE",
+        "SampleAfterValue": "1000003",
+        "UMask": "0x2",
+        "Unit": "cpu_lowpower"
+    },
     {
         "BriefDescription": "Counts the number of RDPMC, RDTSC, and RDTSCP=
 instructions retired.",
         "Counter": "0,1,2,3,4,5,6,7",
diff --git a/tools/perf/pmu-events/arch/x86/mapfile.csv b/tools/perf/pmu-ev=
ents/arch/x86/mapfile.csv
index 9370722dc564..7e9bc4241c61 100644
--- a/tools/perf/pmu-events/arch/x86/mapfile.csv
+++ b/tools/perf/pmu-events/arch/x86/mapfile.csv
@@ -1,7 +1,7 @@
 Family-model,Version,Filename,EventType
 GenuineIntel-6-(97|9A|B7|BA|BF),v1.37,alderlake,core
 GenuineIntel-6-BE,v1.37,alderlaken,core
-GenuineIntel-6-C[56],v1.14,arrowlake,core
+GenuineIntel-6-C[56],v1.16,arrowlake,core
 GenuineIntel-6-(1C|26|27|35|36),v5,bonnell,core
 GenuineIntel-6-(3D|47),v30,broadwell,core
 GenuineIntel-6-56,v12,broadwellde,core
--=20
2.53.0.414.gf7e9f6c205-goog


