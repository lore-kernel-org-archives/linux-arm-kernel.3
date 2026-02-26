Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6AEEFD8FDA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 18:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:To:From:Subject:Message-ID:References:Mime-Version:In-Reply-To:
	Date:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y9IYxdgBLU5Ki2XKkdZb6JYvsW9cUiH1hG77z1/Bhhw=; b=M902OU53tSwvsvZrIGbafAEXNJ
	D8xhgO15AugoJ3G03HRcF3fDaf6rWJDfKapERI7PIGf9ZP7BiZpysFEILa5gkqJWg5JvvyGEMDt9V
	w9OztsImKka0XaNJNBVMOuEPL8ZnEjcGxTMbhT/h2eHmGKa+PeP8j0UOR5EPxUw7YAbDPwN3IFQXY
	/4BB1RJXk9wqegctgrCc5w2Zasz3BWCkqEhwZqFO4mRMCqBykW4d4KsPspZ2kc7o2pEPDUI0XDz6E
	p5DKGVlBzloJT3Ov8zWJnPFoO8y8VYgA3VsPFcj31KFdoFJ317Z1VOWQLTj2THKkjMSxITJ5vJVs5
	b8D3en8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvfef-00000006u2U-0N8S;
	Thu, 26 Feb 2026 18:00:05 +0000
Received: from mail-dy1-x1349.google.com ([2607:f8b0:4864:20::1349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvfeZ-00000006tvh-3nqc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 18:00:01 +0000
Received: by mail-dy1-x1349.google.com with SMTP id 5a478bee46e88-2bdc1b30ac8so18390150eec.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Feb 2026 09:59:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772128798; x=1772733598; darn=lists.infradead.org;
        h=content-transfer-encoding:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y9IYxdgBLU5Ki2XKkdZb6JYvsW9cUiH1hG77z1/Bhhw=;
        b=itTB9YcfbemHyqpOw89yR4dQbH19KpQD+7DPEABJnF3nlVWNpPSrwuOXiKpXShJmBN
         8NjoYt5FFbU1uzi2w1wktOxeE/S/2BjKDdAUR+2atnBGzXAPdHRziSRjwwN5uaQBrjue
         Dqqawn8mS5G9fOE2hBSepR1EqfnxsqK6ckEETQLBLbbhTqDlEt9o4RcDa5bLUNFSzXcS
         SLsT6WZMq+gOR+jHtCqQkbjYYi0qexscUY+MowzKn47z1MyEpSueBdRHHkSXTUjh0GAH
         jfRZy9bhMj+CDi9kyAk6ocXOD0w1s+1Ggyg4SSDgGPQN1y8bUiFmTSHKJ/8PyZ1eiS7G
         QisA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772128798; x=1772733598;
        h=content-transfer-encoding:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Y9IYxdgBLU5Ki2XKkdZb6JYvsW9cUiH1hG77z1/Bhhw=;
        b=gSwe1jCQF793M+tq+ACa9bGP3wz772qcyWBydqAlFtcw7PtgtW+cLpvGmwaaS4DkRa
         Wy4qBWCdcN78ijvv5eN7Y8tcVlfoYcsg1QnE2Kr9k/puwYtaz/GGu0pOp8v90H74yltN
         1hHAKTVg61NSbJk2dOGa5DJGNoGwt7Uw6PunnMiAd1FxNX472pD8JKnphEt2ot9d5vgP
         qO2LeI9d3GNpE41GVnOteMSMx9gNX5kkhh923/PWnxdhJxBRK2mzTu4etmlEAGmBUph2
         uqOB0EzfAa02JE5PnQQByJ2Onl3Py6dYi0dkMVU0dzBt053nUp6UJV2PB8VrluiYTwN9
         ProQ==
X-Forwarded-Encrypted: i=1; AJvYcCUhCCz1WORfRqH3QDxgTZZwd/IO4lXAjoVKK9qWZTFRlBjqTK/6N2MCs/x8yZHgKu44G3LS2hBjhV13lUut8air@lists.infradead.org
X-Gm-Message-State: AOJu0YyVmNn9X3fwZk3YX20GNJq31Z7Jrj2A5QkwZwox3ZSb97+oMK0x
	9iSyLLlRbg16KBzEbSj56IEoq1eS5ohYdiBVk5WGFhvCA5lf2IetMltEKf85PdOIRCIBdyevUP/
	NA9v7lkJMxA==
X-Received: from dycsb15.prod.google.com ([2002:a05:693c:300f:b0:2bd:df3a:f2c3])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7301:434b:b0:2b0:571a:28a5
 with SMTP id 5a478bee46e88-2bd7bd2aacemr10303684eec.18.1772128798073; Thu, 26
 Feb 2026 09:59:58 -0800 (PST)
Date: Thu, 26 Feb 2026 09:59:35 -0800
In-Reply-To: <20260226175936.593159-1-irogers@google.com>
Mime-Version: 1.0
References: <20260226175936.593159-1-irogers@google.com>
X-Mailer: git-send-email 2.53.0.473.g4a7958ca14-goog
Message-ID: <20260226175936.593159-9-irogers@google.com>
Subject: [PATCH v2 09/10] perf vendor events intel: Update sapphirerapids
 events from 1.35 to 1.36
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
X-CRM114-CacheID: sfid-20260226_095959_957816_3272B5A4 
X-CRM114-Status: GOOD (  14.38  )
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
https://github.com/intel/perfmon/commit/bda7f1e1839e2f9ea1ac45da338e6fe5ca6=
fdbb0

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/pmu-events/arch/x86/mapfile.csv      |  2 +-
 .../arch/x86/sapphirerapids/cache.json          |  4 ++--
 .../arch/x86/sapphirerapids/frontend.json       | 16 ++++++++++++++++
 .../arch/x86/sapphirerapids/uncore-cache.json   |  4 ++--
 .../arch/x86/sapphirerapids/uncore-io.json      | 17 +++++++++--------
 5 files changed, 30 insertions(+), 13 deletions(-)

diff --git a/tools/perf/pmu-events/arch/x86/mapfile.csv b/tools/perf/pmu-ev=
ents/arch/x86/mapfile.csv
index 0839e21d4006..8ef03af9f150 100644
--- a/tools/perf/pmu-events/arch/x86/mapfile.csv
+++ b/tools/perf/pmu-events/arch/x86/mapfile.csv
@@ -29,7 +29,7 @@ GenuineIntel-6-2E,v4,nehalemex,core
 GenuineIntel-6-CC,v1.04,pantherlake,core
 GenuineIntel-6-A7,v1.04,rocketlake,core
 GenuineIntel-6-2A,v19,sandybridge,core
-GenuineIntel-6-8F,v1.35,sapphirerapids,core
+GenuineIntel-6-8F,v1.36,sapphirerapids,core
 GenuineIntel-6-AF,v1.13,sierraforest,core
 GenuineIntel-6-(37|4A|4C|4D|5A),v15,silvermont,core
 GenuineIntel-6-(4E|5E|8E|9E|A5|A6),v59,skylake,core
diff --git a/tools/perf/pmu-events/arch/x86/sapphirerapids/cache.json b/too=
ls/perf/pmu-events/arch/x86/sapphirerapids/cache.json
index c66324d41a89..373b26c84448 100644
--- a/tools/perf/pmu-events/arch/x86/sapphirerapids/cache.json
+++ b/tools/perf/pmu-events/arch/x86/sapphirerapids/cache.json
@@ -514,7 +514,7 @@
         "EventCode": "0xd3",
         "EventName": "MEM_LOAD_L3_MISS_RETIRED.REMOTE_DRAM",
         "PublicDescription": "MEM_LOAD_L3_MISS_RETIRED.REMOTE_DRAM Availab=
le PDIST counters: 0",
-        "SampleAfterValue": "1000003",
+        "SampleAfterValue": "100007",
         "UMask": "0x2"
     },
     {
@@ -534,7 +534,7 @@
         "EventCode": "0xd3",
         "EventName": "MEM_LOAD_L3_MISS_RETIRED.REMOTE_HITM",
         "PublicDescription": "MEM_LOAD_L3_MISS_RETIRED.REMOTE_HITM Availab=
le PDIST counters: 0",
-        "SampleAfterValue": "1000003",
+        "SampleAfterValue": "100007",
         "UMask": "0x4"
     },
     {
diff --git a/tools/perf/pmu-events/arch/x86/sapphirerapids/frontend.json b/=
tools/perf/pmu-events/arch/x86/sapphirerapids/frontend.json
index 793c486ffabe..e51f5e85ffd1 100644
--- a/tools/perf/pmu-events/arch/x86/sapphirerapids/frontend.json
+++ b/tools/perf/pmu-events/arch/x86/sapphirerapids/frontend.json
@@ -271,6 +271,22 @@
         "SampleAfterValue": "200003",
         "UMask": "0x4"
     },
+    {
+        "BriefDescription": "ICACHE_TAG.STALLS_INUSE",
+        "Counter": "0,1,2,3",
+        "EventCode": "0x83",
+        "EventName": "ICACHE_TAG.STALLS_INUSE",
+        "SampleAfterValue": "200003",
+        "UMask": "0x10"
+    },
+    {
+        "BriefDescription": "ICACHE_TAG.STALLS_ISB",
+        "Counter": "0,1,2,3",
+        "EventCode": "0x83",
+        "EventName": "ICACHE_TAG.STALLS_ISB",
+        "SampleAfterValue": "200003",
+        "UMask": "0x8"
+    },
     {
         "BriefDescription": "Cycles Decode Stream Buffer (DSB) is deliveri=
ng any Uop",
         "Counter": "0,1,2,3",
diff --git a/tools/perf/pmu-events/arch/x86/sapphirerapids/uncore-cache.jso=
n b/tools/perf/pmu-events/arch/x86/sapphirerapids/uncore-cache.json
index 1bdda3c3ccbf..59f6fd2c7a8f 100644
--- a/tools/perf/pmu-events/arch/x86/sapphirerapids/uncore-cache.json
+++ b/tools/perf/pmu-events/arch/x86/sapphirerapids/uncore-cache.json
@@ -3501,7 +3501,7 @@
         "EventName": "UNC_CHA_SNOOP_RESP.RSPIFWD",
         "Experimental": "1",
         "PerPkg": "1",
-        "PublicDescription": "Counts when a a transaction with the opcode =
type RspIFwd Snoop Response was received which indicates a remote caching a=
gent forwarded the data and the requesting agent is able to acquire the dat=
a in E (Exclusive) or M (modified) states.  This is commonly returned with =
RFO (the Read for Ownership issued before a write) transactions.  The snoop=
 could have either been to a cacheline in the M,E,F (Modified, Exclusive or=
 Forward)  states.",
+        "PublicDescription": "Counts when a transaction with the opcode ty=
pe RspIFwd Snoop Response was received which indicates a remote caching age=
nt forwarded the data and the requesting agent is able to acquire the data =
in E (Exclusive) or M (modified) states.  This is commonly returned with RF=
O (the Read for Ownership issued before a write) transactions.  The snoop c=
ould have either been to a cacheline in the M,E,F (Modified, Exclusive or F=
orward)  states.",
         "UMask": "0x4",
         "Unit": "CHA"
     },
@@ -3523,7 +3523,7 @@
         "EventName": "UNC_CHA_SNOOP_RESP.RSPSFWD",
         "Experimental": "1",
         "PerPkg": "1",
-        "PublicDescription": "Counts when a a transaction with the opcode =
type RspSFwd Snoop Response was received which indicates a remote caching a=
gent forwarded the data but held on to its current copy.  This is common fo=
r data and code reads that hit in a remote socket in E (Exclusive) or F (Fo=
rward) state.",
+        "PublicDescription": "Counts when a transaction with the opcode ty=
pe RspSFwd Snoop Response was received which indicates a remote caching age=
nt forwarded the data but held on to its current copy.  This is common for =
data and code reads that hit in a remote socket in E (Exclusive) or F (Forw=
ard) state.",
         "UMask": "0x8",
         "Unit": "CHA"
     },
diff --git a/tools/perf/pmu-events/arch/x86/sapphirerapids/uncore-io.json b=
/tools/perf/pmu-events/arch/x86/sapphirerapids/uncore-io.json
index dac7e6c50f31..45675a1099e2 100644
--- a/tools/perf/pmu-events/arch/x86/sapphirerapids/uncore-io.json
+++ b/tools/perf/pmu-events/arch/x86/sapphirerapids/uncore-io.json
@@ -303,6 +303,7 @@
         "Experimental": "1",
         "FCMask": "0x07",
         "PerPkg": "1",
+        "PortMask": "0xff",
         "UMask": "0xff",
         "Unit": "IIO"
     },
@@ -314,7 +315,7 @@
         "Experimental": "1",
         "FCMask": "0x07",
         "PerPkg": "1",
-        "PortMask": "0x0000",
+        "PortMask": "0x01",
         "PublicDescription": "x16 card plugged in to stack, Or x8 card plu=
gged in to Lane 0/1, Or x4 card is plugged in to slot 0",
         "UMask": "0x1",
         "Unit": "IIO"
@@ -327,7 +328,7 @@
         "Experimental": "1",
         "FCMask": "0x07",
         "PerPkg": "1",
-        "PortMask": "0x0000",
+        "PortMask": "0x02",
         "PublicDescription": "x4 card is plugged in to slot 1",
         "UMask": "0x2",
         "Unit": "IIO"
@@ -340,7 +341,7 @@
         "Experimental": "1",
         "FCMask": "0x07",
         "PerPkg": "1",
-        "PortMask": "0x0000",
+        "PortMask": "0x04",
         "PublicDescription": "x8 card plugged in to Lane 2/3, Or x4 card i=
s plugged in to slot 1",
         "UMask": "0x4",
         "Unit": "IIO"
@@ -353,7 +354,7 @@
         "Experimental": "1",
         "FCMask": "0x07",
         "PerPkg": "1",
-        "PortMask": "0x0000",
+        "PortMask": "0x08",
         "PublicDescription": "x4 card is plugged in to slot 3",
         "UMask": "0x8",
         "Unit": "IIO"
@@ -366,7 +367,7 @@
         "Experimental": "1",
         "FCMask": "0x07",
         "PerPkg": "1",
-        "PortMask": "0x0000",
+        "PortMask": "0x10",
         "PublicDescription": "x16 card plugged in to stack, Or x8 card plu=
gged in to Lane 0/1, Or x4 card is plugged in to slot 0",
         "UMask": "0x10",
         "Unit": "IIO"
@@ -379,7 +380,7 @@
         "Experimental": "1",
         "FCMask": "0x07",
         "PerPkg": "1",
-        "PortMask": "0x0000",
+        "PortMask": "0x20",
         "PublicDescription": "x4 card is plugged in to slot 1",
         "UMask": "0x20",
         "Unit": "IIO"
@@ -392,7 +393,7 @@
         "Experimental": "1",
         "FCMask": "0x07",
         "PerPkg": "1",
-        "PortMask": "0x0000",
+        "PortMask": "0x40",
         "PublicDescription": "x8 card plugged in to Lane 2/3, Or x4 card i=
s plugged in to slot 1",
         "UMask": "0x40",
         "Unit": "IIO"
@@ -405,7 +406,7 @@
         "Experimental": "1",
         "FCMask": "0x07",
         "PerPkg": "1",
-        "PortMask": "0x0000",
+        "PortMask": "0x80",
         "PublicDescription": "x4 card is plugged in to slot 3",
         "UMask": "0x80",
         "Unit": "IIO"
--=20
2.53.0.414.gf7e9f6c205-goog


