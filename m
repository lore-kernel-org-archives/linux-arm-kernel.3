Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A361CD98C6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 21:51:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:
	In-Reply-To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MaiEQ/PXTwGRZQYD3ScxYmEyaLiXVa9NcHT4VrbEDkU=; b=K0aiX1XJ6nll62sqNyn6TPzUWw
	iwBJkByUyLj7GYYlv0c6a92kXRu+fEhZwsNoxt5g/lKBZFl5qoLbWrDIxo7wcSDzM5R+OttIR15tg
	G+FYzp/2Rnfi0mOVFKGQ77l9qcBXGRai+iYpE2ccTu1Zmw+JyxCZtZ23Qs0E0Z8GbBGJMvsrPLA/Y
	dc8pgZomBMn0Mxkb01x30gLg7qGqfdIgzLEkcRrT17ohRp83HncitVIGdYe6tztC+crviLfqFmAY/
	A8IBw5KUhWQQSu/VmwUv4nzHFtp9sdaEgMRr1SKRhf5r36avzY44HRtTOZd3UFn1SaoxOnjFx7kKT
	5ajzDMxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX4LZ-00000006PiY-2hwj;
	Tue, 09 Jun 2026 21:50:57 +0000
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX4LU-00000006PeQ-17Xq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 21:50:55 +0000
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-84245e2bb00so5373688b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 14:50:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781041850; x=1781646650; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MaiEQ/PXTwGRZQYD3ScxYmEyaLiXVa9NcHT4VrbEDkU=;
        b=v55nTIw7VhlXrZEKcHWpd9dUAFo/A/zGlQn/1qnicUrUxWKO5njHaOYFJO6WIva7zU
         FohMsuwr7Ip8koyEHhry9P0fz2U5Q01F4u6obWGlBu3FE+yKUz9tjbs1NHbT+ME+0SwI
         gkReXDqYtGpi5D6Zw2DPfDw6pB6Ba3hMdgHKRu7+1WWyYQTLO/BIKCEFgWpEBmLef3G4
         CrEYVL411FMcay9phv92yoo92L3USv9TBhx/gBscTgJbn7Z6vbU3DmjxK0khY1mUPLOQ
         Ru2DCLLlwdLQQ/ETwpQpBL23xXj4n3laMJvy1vAGXhhFDFJiBiKWugcYOsH3cyvPjJg5
         6V0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781041850; x=1781646650;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=MaiEQ/PXTwGRZQYD3ScxYmEyaLiXVa9NcHT4VrbEDkU=;
        b=Aypfvqr+DMeo+L38UElmEo0A5aG9SoP+uXS5zoFzMzJQY+Vme9GAVaw2bX7fd713UZ
         A9kqC4TTYjv00tZDlSxqyZzdoYkgK1o9NcEtuAk2wa1fL4ULD+73P6Emtrpd/JX3lJI/
         MHX54EUYP3aaTfTHjqUDOWn+JGV/FL6MV8gUgxGdz45GO9uCB9feF5nXA094NCttqAak
         hOqOvEW1b2cTMN6XTaI7hOe8JLFc6RalnWyIkMPj8lMZ6wJQjMPFlxqE+ntVvqnwr4KH
         7btF8Tf4qOdhab78W66hNLgF3HrcvgudSjIFO0VwXYKasDykP5rUznBQ9sKgt0zOWsZr
         +6BA==
X-Forwarded-Encrypted: i=1; AFNElJ+TeJXyj7j+VQVUuhavqayqG2mym9wo83PMwH1X3wOSJsZI/bn5ivaSGgi9ND5x8PsEcEkU1w6PKteQ4VCL+39g@lists.infradead.org
X-Gm-Message-State: AOJu0YxTpLyti/ulBG/LZ/XXO2/xN49mlkGe58g4M27uFNJjfqXIkXD+
	Ctx8hkUZ1B74oj5ymL6C0UR48FzF4egqngQQ5wtiBiq9elRYXJIhF0MXRvmoHsw8ladiNnyw5In
	EfTxflA==
X-Received: from pfbfk4.prod.google.com ([2002:a05:6a00:3a84:b0:842:4def:be29])
 (user=ctshao job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:b806:b0:842:6a97:52f3
 with SMTP id d2e1a72fcca58-842b0e1c969mr23556939b3a.7.1781041849699; Tue, 09
 Jun 2026 14:50:49 -0700 (PDT)
Date: Tue,  9 Jun 2026 14:50:40 -0700
In-Reply-To: <20260609215046.2391903-1-ctshao@google.com>
Mime-Version: 1.0
References: <20260609215046.2391903-1-ctshao@google.com>
X-Mailer: git-send-email 2.54.0.1099.g489fc7bff1-goog
Message-ID: <20260609215046.2391903-2-ctshao@google.com>
Subject: [PATCH v1 1/6] perf vendor events intel: Update arrowlake events from
 1.17 to 1.19
From: Chun-Tse Shao <ctshao@google.com>
To: peterz@infradead.org, mingo@redhat.com, acme@kernel.org, 
	namhyung@kernel.org
Cc: alexander.shishkin@linux.intel.com, jolsa@kernel.org, irogers@google.com, 
	adrian.hunter@intel.com, james.clark@linaro.org, afaerber@suse.de, 
	mani@kernel.org, dapeng1.mi@linux.intel.com, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-actions@lists.infradead.org, Chun-Tse Shao <ctshao@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_145052_328133_D34D6AE5 
X-CRM114-Status: GOOD (  16.86  )
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
https://github.com/intel/perfmon/commit/b84e75626ae78558b8f526a276e4597c5ca=
6c429

Signed-off-by: Chun-Tse Shao <ctshao@google.com>
---
 .../pmu-events/arch/x86/arrowlake/cache.json  |  30 +++-
 .../arch/x86/arrowlake/floating-point.json    |  45 ++++++
 .../pmu-events/arch/x86/arrowlake/memory.json |  18 +++
 .../arch/x86/arrowlake/pipeline.json          | 129 +++++++++++++++++-
 tools/perf/pmu-events/arch/x86/mapfile.csv    |   2 +-
 5 files changed, 217 insertions(+), 7 deletions(-)

diff --git a/tools/perf/pmu-events/arch/x86/arrowlake/cache.json b/tools/pe=
rf/pmu-events/arch/x86/arrowlake/cache.json
index fe6b9ad68f87..142f62c59531 100644
--- a/tools/perf/pmu-events/arch/x86/arrowlake/cache.json
+++ b/tools/perf/pmu-events/arch/x86/arrowlake/cache.json
@@ -1,6 +1,6 @@
 [
     {
-        "BriefDescription": "Counts the number of request that were not ac=
cepted into the L2Q because the L2Q is FULL.",
+        "BriefDescription": "Counts the number of requests that were not a=
ccepted into the L2Q because the L2Q is FULL.",
         "Counter": "0,1,2,3,4,5,6,7",
         "EventCode": "0x31",
         "EventName": "CORE_REJECT_L2Q.ANY",
@@ -8,6 +8,15 @@
         "SampleAfterValue": "1000003",
         "Unit": "cpu_atom"
     },
+    {
+        "BriefDescription": "Counts the number of requests that were not a=
ccepted into the L2Q because the L2Q is FULL.",
+        "Counter": "0,1,2,3,4,5,6,7",
+        "EventCode": "0x31",
+        "EventName": "CORE_REJECT_L2Q.ANY",
+        "PublicDescription": "Counts the number of (demand and L1 prefetch=
ers) core requests rejected by the L2Q due to a full or nearly full w condi=
tion which likely indicates back pressure from L2Q.  It also counts request=
s that would have gone directly to the XQ, but are rejected due to a full o=
r nearly full condition, indicating back pressure from the IDI link.  The L=
2Q may also reject transactions  from a core to insure fairness between cor=
es, or to delay a cores dirty eviction when the address conflicts incoming =
external snoops.  (Note that L2 prefetcher requests that are dropped are no=
t counted by this event.) Counts on a per core basis.",
+        "SampleAfterValue": "200003",
+        "Unit": "cpu_lowpower"
+    },
     {
         "BriefDescription": "Counts the number of L1D cacheline (dirty) ev=
ictions caused by load misses, stores, and prefetches.",
         "Counter": "0,1,2,3,4,5,6,7",
@@ -310,6 +319,15 @@
         "SampleAfterValue": "1000003",
         "Unit": "cpu_atom"
     },
+    {
+        "BriefDescription": "Counts the number of demand and prefetch tran=
sactions that the External Queue (XQ) rejects due to a full or near full co=
ndition.",
+        "Counter": "0,1,2,3,4,5,6,7",
+        "EventCode": "0x30",
+        "EventName": "L2_REJECT_XQ.ANY",
+        "PublicDescription": "Counts the number of demand and prefetch tra=
nsactions that the External Queue (XQ) rejects due to a full or near full c=
ondition which likely indicates back pressure from the IDI link.  The XQ ma=
y reject transactions from the L2Q (non-cacheable requests), BBL (L2 misses=
) and WOB (L2 write-back victims).",
+        "SampleAfterValue": "200003",
+        "Unit": "cpu_lowpower"
+    },
     {
         "BriefDescription": "Counts the number of L2 Cache Accesses Counts=
 the total number of L2 Cache Accesses - sum of hits, misses, rejects  fron=
t door requests for CRd/DRd/RFO/ItoM/L2 Prefetches only, per core event",
         "Counter": "0,1,2,3,4,5,6,7",
@@ -1382,6 +1400,16 @@
         "UMask": "0x83",
         "Unit": "cpu_atom"
     },
+    {
+        "BriefDescription": "Counts the number of memory uops retired.  A =
single uop that performs both a load AND a store will be counted as 1, not =
2 (e.g. ADD [mem], CONST)",
+        "Counter": "0,1,2,3,4,5,6,7",
+        "Data_LA": "1",
+        "EventCode": "0xd0",
+        "EventName": "MEM_UOPS_RETIRED.ALL",
+        "SampleAfterValue": "200003",
+        "UMask": "0x83",
+        "Unit": "cpu_lowpower"
+    },
     {
         "BriefDescription": "Counts the number of load uops retired.",
         "Counter": "0,1,2,3,4,5,6,7",
diff --git a/tools/perf/pmu-events/arch/x86/arrowlake/floating-point.json b=
/tools/perf/pmu-events/arch/x86/arrowlake/floating-point.json
index c54fc201a6ca..8dc3a11350c5 100644
--- a/tools/perf/pmu-events/arch/x86/arrowlake/floating-point.json
+++ b/tools/perf/pmu-events/arch/x86/arrowlake/floating-point.json
@@ -510,6 +510,15 @@
         "UMask": "0x1f",
         "Unit": "cpu_atom"
     },
+    {
+        "BriefDescription": "Counts the number of uops executed on all flo=
ating point ports.",
+        "Counter": "0,1,2,3,4,5,6,7",
+        "EventCode": "0xb2",
+        "EventName": "FP_VINT_UOPS_EXECUTED.ALL",
+        "SampleAfterValue": "1000003",
+        "UMask": "0xf",
+        "Unit": "cpu_lowpower"
+    },
     {
         "BriefDescription": "Counts the number of uops executed on floatin=
g point and vector integer port 0.",
         "Counter": "0,1,2,3,4,5,6,7",
@@ -519,6 +528,15 @@
         "UMask": "0x2",
         "Unit": "cpu_atom"
     },
+    {
+        "BriefDescription": "Counts the number of uops executed on floatin=
g point and vector integer port 0.",
+        "Counter": "0,1,2,3,4,5,6,7",
+        "EventCode": "0xb2",
+        "EventName": "FP_VINT_UOPS_EXECUTED.P0",
+        "SampleAfterValue": "1000003",
+        "UMask": "0x2",
+        "Unit": "cpu_lowpower"
+    },
     {
         "BriefDescription": "Counts the number of uops executed on floatin=
g point and vector integer port 1.",
         "Counter": "0,1,2,3,4,5,6,7",
@@ -528,6 +546,15 @@
         "UMask": "0x4",
         "Unit": "cpu_atom"
     },
+    {
+        "BriefDescription": "Counts the number of uops executed on floatin=
g point and vector integer port 1.",
+        "Counter": "0,1,2,3,4,5,6,7",
+        "EventCode": "0xb2",
+        "EventName": "FP_VINT_UOPS_EXECUTED.P1",
+        "SampleAfterValue": "1000003",
+        "UMask": "0x4",
+        "Unit": "cpu_lowpower"
+    },
     {
         "BriefDescription": "Counts the number of uops executed on floatin=
g point and vector integer port 2.",
         "Counter": "0,1,2,3,4,5,6,7",
@@ -537,6 +564,15 @@
         "UMask": "0x8",
         "Unit": "cpu_atom"
     },
+    {
+        "BriefDescription": "Counts the number of uops executed on floatin=
g point and vector integer port 2.",
+        "Counter": "0,1,2,3,4,5,6,7",
+        "EventCode": "0xb2",
+        "EventName": "FP_VINT_UOPS_EXECUTED.P2",
+        "SampleAfterValue": "1000003",
+        "UMask": "0x8",
+        "Unit": "cpu_lowpower"
+    },
     {
         "BriefDescription": "Counts the number of uops executed on floatin=
g point and vector integer port 3.",
         "Counter": "0,1,2,3,4,5,6,7",
@@ -555,6 +591,15 @@
         "UMask": "0x1e",
         "Unit": "cpu_atom"
     },
+    {
+        "BriefDescription": "Counts the number of uops executed on floatin=
g point and vector integer port 0, 1, 2.",
+        "Counter": "0,1,2,3,4,5,6,7",
+        "EventCode": "0xb2",
+        "EventName": "FP_VINT_UOPS_EXECUTED.PRIMARY",
+        "SampleAfterValue": "1000003",
+        "UMask": "0xe",
+        "Unit": "cpu_lowpower"
+    },
     {
         "BriefDescription": "Counts the number of uops executed on floatin=
g point and vector integer store data port.",
         "Counter": "0,1,2,3,4,5,6,7",
diff --git a/tools/perf/pmu-events/arch/x86/arrowlake/memory.json b/tools/p=
erf/pmu-events/arch/x86/arrowlake/memory.json
index 05cc46518232..44922186c2b0 100644
--- a/tools/perf/pmu-events/arch/x86/arrowlake/memory.json
+++ b/tools/perf/pmu-events/arch/x86/arrowlake/memory.json
@@ -173,6 +173,15 @@
         "UMask": "0x2",
         "Unit": "cpu_atom"
     },
+    {
+        "BriefDescription": "Counts the number of cycles that the head (ol=
dest load) of the load buffer is stalled due to request buffers full or loc=
k in progress.",
+        "Counter": "0,1,2,3,4,5,6,7",
+        "EventCode": "0x05",
+        "EventName": "LD_HEAD.WCB_FULL",
+        "SampleAfterValue": "1000003",
+        "UMask": "0x2",
+        "Unit": "cpu_lowpower"
+    },
     {
         "BriefDescription": "Counts the number of cycles that the head (ol=
dest load) of the load buffer and retirement are both stalled due to reques=
t buffers full or lock in progress.",
         "Counter": "0,1,2,3,4,5,6,7",
@@ -182,6 +191,15 @@
         "UMask": "0x82",
         "Unit": "cpu_atom"
     },
+    {
+        "BriefDescription": "Counts the number of cycles that the head (ol=
dest load) of the load buffer and retirement are both stalled due to reques=
t buffers full or lock in progress.",
+        "Counter": "0,1,2,3,4,5,6,7",
+        "EventCode": "0x05",
+        "EventName": "LD_HEAD.WCB_FULL_AT_RET",
+        "SampleAfterValue": "1000003",
+        "UMask": "0x82",
+        "Unit": "cpu_lowpower"
+    },
     {
         "BriefDescription": "Counts the number of memory ordering machine =
clears triggered due to a snoop from an external agent. Does not count inte=
rnally generated machine clears such as those due to disambiguations.",
         "Counter": "0,1,2,3,4,5,6,7",
diff --git a/tools/perf/pmu-events/arch/x86/arrowlake/pipeline.json b/tools=
/perf/pmu-events/arch/x86/arrowlake/pipeline.json
index a0fd63cace22..bdfee0347cc5 100644
--- a/tools/perf/pmu-events/arch/x86/arrowlake/pipeline.json
+++ b/tools/perf/pmu-events/arch/x86/arrowlake/pipeline.json
@@ -209,7 +209,6 @@
         "EventName": "BR_INST_RETIRED.COND_TAKEN_FWD",
         "PublicDescription": "Counts taken forward conditional branch inst=
ructions retired. Available PDIST counters: 0,1",
         "SampleAfterValue": "400009",
-        "UMask": "0x102",
         "Unit": "cpu_core"
     },
     {
@@ -608,7 +607,7 @@
         "EventName": "BR_MISP_RETIRED.COND_TAKEN_BWD_COST",
         "PublicDescription": "number of branch instructions retired that w=
ere mispredicted and taken backward. This precise event may be used to get =
the misprediction cost via the Retire_Latency field of PEBS. It fires on th=
e instruction that immediately follows the mispredicted branch. Available P=
DIST counters: 0,1",
         "SampleAfterValue": "400009",
-        "UMask": "0x8001",
+        "UMask": "0x41",
         "Unit": "cpu_core"
     },
     {
@@ -637,7 +636,7 @@
         "EventName": "BR_MISP_RETIRED.COND_TAKEN_FWD_COST",
         "PublicDescription": "number of branch instructions retired that w=
ere mispredicted and taken forward. This precise event may be used to get t=
he misprediction cost via the Retire_Latency field of PEBS. It fires on the=
 instruction that immediately follows the mispredicted branch. Available PD=
IST counters: 0,1",
         "SampleAfterValue": "400009",
-        "UMask": "0x8002",
+        "UMask": "0x140",
         "Unit": "cpu_core"
     },
     {
@@ -773,11 +772,11 @@
         "Unit": "cpu_core"
     },
     {
-        "BriefDescription": "This event counts the number of mispredicted =
ret instructions retired. Non PEBS",
+        "BriefDescription": "This event counts the number of mispredicted =
ret instructions retired.",
         "Counter": "0,1,2,3,4,5,6,7,8,9",
         "EventCode": "0xc5",
         "EventName": "BR_MISP_RETIRED.RET",
-        "PublicDescription": "This is a non-precise version (that is, does=
 not use PEBS) of the event that counts mispredicted return instructions re=
tired. Available PDIST counters: 0,1",
+        "PublicDescription": "This event counts the number of mispredicted=
 ret instructions retired. Available PDIST counters: 0,1",
         "SampleAfterValue": "100007",
         "UMask": "0x8",
         "Unit": "cpu_core"
@@ -1326,6 +1325,15 @@
         "UMask": "0xff",
         "Unit": "cpu_atom"
     },
+    {
+        "BriefDescription": "Counts the number of uops executed on all Int=
eger ports.",
+        "Counter": "0,1,2,3,4,5,6,7",
+        "EventCode": "0xb3",
+        "EventName": "INT_UOPS_EXECUTED.ALL",
+        "SampleAfterValue": "1000003",
+        "UMask": "0xff",
+        "Unit": "cpu_lowpower"
+    },
     {
         "BriefDescription": "Counts the number of uops executed on a load =
port.",
         "Counter": "0,1,2,3,4,5,6,7",
@@ -1336,6 +1344,16 @@
         "UMask": "0x1",
         "Unit": "cpu_atom"
     },
+    {
+        "BriefDescription": "Counts the number of uops executed on a load =
port.",
+        "Counter": "0,1,2,3,4,5,6,7",
+        "EventCode": "0xb3",
+        "EventName": "INT_UOPS_EXECUTED.LD",
+        "PublicDescription": "Counts the number of uops executed on a load=
 port.  This event counts for integer uops even if the destination is FP/ve=
ctor",
+        "SampleAfterValue": "1000003",
+        "UMask": "0x1",
+        "Unit": "cpu_lowpower"
+    },
     {
         "BriefDescription": "Counts the number of uops executed on integer=
 port 0.",
         "Counter": "0,1,2,3,4,5,6,7",
@@ -1345,6 +1363,15 @@
         "UMask": "0x8",
         "Unit": "cpu_atom"
     },
+    {
+        "BriefDescription": "Counts the number of uops executed on integer=
 port 0.",
+        "Counter": "0,1,2,3,4,5,6,7",
+        "EventCode": "0xb3",
+        "EventName": "INT_UOPS_EXECUTED.P0",
+        "SampleAfterValue": "1000003",
+        "UMask": "0x8",
+        "Unit": "cpu_lowpower"
+    },
     {
         "BriefDescription": "Counts the number of uops executed on integer=
 port 1.",
         "Counter": "0,1,2,3,4,5,6,7",
@@ -1354,6 +1381,15 @@
         "UMask": "0x10",
         "Unit": "cpu_atom"
     },
+    {
+        "BriefDescription": "Counts the number of uops executed on integer=
 port 1.",
+        "Counter": "0,1,2,3,4,5,6,7",
+        "EventCode": "0xb3",
+        "EventName": "INT_UOPS_EXECUTED.P1",
+        "SampleAfterValue": "1000003",
+        "UMask": "0x10",
+        "Unit": "cpu_lowpower"
+    },
     {
         "BriefDescription": "Counts the number of uops executed on integer=
 port 2.",
         "Counter": "0,1,2,3,4,5,6,7",
@@ -1363,6 +1399,15 @@
         "UMask": "0x20",
         "Unit": "cpu_atom"
     },
+    {
+        "BriefDescription": "Counts the number of uops executed on integer=
 port 2.",
+        "Counter": "0,1,2,3,4,5,6,7",
+        "EventCode": "0xb3",
+        "EventName": "INT_UOPS_EXECUTED.P2",
+        "SampleAfterValue": "1000003",
+        "UMask": "0x20",
+        "Unit": "cpu_lowpower"
+    },
     {
         "BriefDescription": "Counts the number of uops executed on integer=
 port 3.",
         "Counter": "0,1,2,3,4,5,6,7",
@@ -1372,6 +1417,15 @@
         "UMask": "0x40",
         "Unit": "cpu_atom"
     },
+    {
+        "BriefDescription": "Counts the number of uops executed on integer=
 port 3.",
+        "Counter": "0,1,2,3,4,5,6,7",
+        "EventCode": "0xb3",
+        "EventName": "INT_UOPS_EXECUTED.P3",
+        "SampleAfterValue": "1000003",
+        "UMask": "0x40",
+        "Unit": "cpu_lowpower"
+    },
     {
         "BriefDescription": "Counts the number of uops executed on integer=
 port  0,1, 2, 3.",
         "Counter": "0,1,2,3,4,5,6,7",
@@ -1381,6 +1435,15 @@
         "UMask": "0x78",
         "Unit": "cpu_atom"
     },
+    {
+        "BriefDescription": "Counts the number of uops executed on integer=
 port  0,1, 2, 3.",
+        "Counter": "0,1,2,3,4,5,6,7",
+        "EventCode": "0xb3",
+        "EventName": "INT_UOPS_EXECUTED.PRIMARY",
+        "SampleAfterValue": "1000003",
+        "UMask": "0x78",
+        "Unit": "cpu_lowpower"
+    },
     {
         "BriefDescription": "Counts the number of uops executed on a Store=
 address port.",
         "Counter": "0,1,2,3,4,5,6,7",
@@ -1391,6 +1454,16 @@
         "UMask": "0x2",
         "Unit": "cpu_atom"
     },
+    {
+        "BriefDescription": "Counts the number of uops executed on a Store=
 address port.",
+        "Counter": "0,1,2,3,4,5,6,7",
+        "EventCode": "0xb3",
+        "EventName": "INT_UOPS_EXECUTED.STA",
+        "PublicDescription": "Counts the number of uops executed on a Stor=
e address port. This event counts integer uops even if the data source is F=
P/vector",
+        "SampleAfterValue": "1000003",
+        "UMask": "0x2",
+        "Unit": "cpu_lowpower"
+    },
     {
         "BriefDescription": "Counts the number of uops executed on an inte=
ger store data and jump port.",
         "Counter": "0,1,2,3,4,5,6,7",
@@ -1400,6 +1473,15 @@
         "UMask": "0x4",
         "Unit": "cpu_atom"
     },
+    {
+        "BriefDescription": "Counts the number of uops executed on an inte=
ger store data and jump port.",
+        "Counter": "0,1,2,3,4,5,6,7",
+        "EventCode": "0xb3",
+        "EventName": "INT_UOPS_EXECUTED.STD_JMP",
+        "SampleAfterValue": "1000003",
+        "UMask": "0x4",
+        "Unit": "cpu_lowpower"
+    },
     {
         "BriefDescription": "Number of vector integer instructions retired=
 of 128-bit vector-width.",
         "Counter": "0,1,2,3,4,5,6,7,8,9",
@@ -1691,6 +1773,15 @@
         "UMask": "0x88",
         "Unit": "cpu_atom"
     },
+    {
+        "BriefDescription": "Counts the number of machine clears that flus=
h the pipeline and restart the machine without the use of microcode.",
+        "Counter": "0,1,2,3,4,5,6,7",
+        "EventCode": "0xc3",
+        "EventName": "MACHINE_CLEARS.FAST",
+        "SampleAfterValue": "20003",
+        "UMask": "0x10",
+        "Unit": "cpu_lowpower"
+    },
     {
         "BriefDescription": "Counts number of virtual trap actually taken =
(e.g. highest priority event during retirement). It can count virtual trap =
from FPC port 0 or port 1 (x87/SSE) equally in a single counter.",
         "Counter": "0,1,2,3,4,5,6,7",
@@ -1700,6 +1791,15 @@
         "UMask": "0x40",
         "Unit": "cpu_atom"
     },
+    {
+        "BriefDescription": "Counts the number of virtual traps taken.",
+        "Counter": "0,1,2,3,4,5,6,7",
+        "EventCode": "0xc3",
+        "EventName": "MACHINE_CLEARS.FPC_VIRTUAL_TRAP",
+        "SampleAfterValue": "20003",
+        "UMask": "0x40",
+        "Unit": "cpu_lowpower"
+    },
     {
         "BriefDescription": "Counts the number of nukes due to memory rena=
ming",
         "Counter": "0,1,2,3,4,5,6,7",
@@ -2015,6 +2115,15 @@
         "UMask": "0x8",
         "Unit": "cpu_atom"
     },
+    {
+        "BriefDescription": "Counts the number of issue slots not consumed=
 due to a color request for an FCW or MXCSR control register when all 4 col=
ors (copies) are already in use.",
+        "Counter": "0,1,2,3,4,5,6,7",
+        "EventCode": "0x75",
+        "EventName": "SERIALIZATION.COLOR_STALLS",
+        "SampleAfterValue": "200003",
+        "UMask": "0x8",
+        "Unit": "cpu_lowpower"
+    },
     {
         "BriefDescription": "Counts the number of issue slots where no uop=
 could issue due to an IQ scoreboard that stalls allocation until a specifi=
ed older uop retires or (in the case of jump scoreboard) executes. Commonly=
 executed instructions with IQ scoreboards include LFENCE and MFENCE.",
         "Counter": "0,1,2,3,4,5,6,7",
@@ -2034,6 +2143,16 @@
         "UMask": "0x2",
         "Unit": "cpu_atom"
     },
+    {
+        "BriefDescription": "Counts the number of issue slots not consumed=
 by the backend due to a micro-sequencer (MS) scoreboard, which stalls the =
front-end from issuing from the UROM until a specified older uop retires.",
+        "Counter": "0,1,2,3,4,5,6,7",
+        "EventCode": "0x75",
+        "EventName": "SERIALIZATION.NON_C01_MS_SCB",
+        "PublicDescription": "Counts the number of issue slots not consume=
d by the backend due to a micro-sequencer (MS) scoreboard, which stalls the=
 front-end from issuing from the UROM until a specified older uop retires. =
The most commonly executed instruction with an MS scoreboard is PAUSE.",
+        "SampleAfterValue": "200003",
+        "UMask": "0x2",
+        "Unit": "cpu_lowpower"
+    },
     {
         "BriefDescription": "This event counts a subset of the Topdown Slo=
ts event that were not consumed by the back-end pipeline due to lack of bac=
k-end resources, as a result of memory subsystem delays, execution units li=
mitations, or other conditions.",
         "Counter": "0,1,2,3,4,5,6,7,8,9",
diff --git a/tools/perf/pmu-events/arch/x86/mapfile.csv b/tools/perf/pmu-ev=
ents/arch/x86/mapfile.csv
index 50a403b429b1..613881d04a9a 100644
--- a/tools/perf/pmu-events/arch/x86/mapfile.csv
+++ b/tools/perf/pmu-events/arch/x86/mapfile.csv
@@ -1,7 +1,7 @@
 Family-model,Version,Filename,EventType
 GenuineIntel-6-(97|9A|B7|BA|BF),v1.39,alderlake,core
 GenuineIntel-6-BE,v1.39,alderlaken,core
-GenuineIntel-6-C[56],v1.17,arrowlake,core
+GenuineIntel-6-C[56],v1.19,arrowlake,core
 GenuineIntel-6-(1C|26|27|35|36),v5,bonnell,core
 GenuineIntel-6-(3D|47),v30,broadwell,core
 GenuineIntel-6-56,v12,broadwellde,core
--=20
2.54.0.1099.g489fc7bff1-goog


