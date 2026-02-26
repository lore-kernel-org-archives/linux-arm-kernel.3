Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C56BDFD8FEC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 18:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:To:From:Subject:Message-ID:References:Mime-Version:In-Reply-To:
	Date:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lMWIeXWUQgyzJ0fPnV+0pSMPvgSBdF0XsAMHNN5+mYc=; b=0BIlPcbTuO37p8/QGcNhu17Sll
	IXoxNjxLctN9c5ZBs1XMSXc4qqZWQ+39o9BXPW2ZtD4JSYtMlulMffM8+gT/Df0rSHVN9Gtnk71/V
	I4ob3jQW4StKvU/FNhmWyKOFSubEf4DEIhahWKq9mTqcJ0+MTgFmHvQQB/EVGpbmCDpOC9gkvDLBn
	S6wjyryrH8d56fx+ud1iBwEQuM0qG9gKpJySq7zHO2EQ1kkwiKfksdXB78TzBSpK+XlKdklnv9Xmp
	DhTbh72oTVUbw2ugwqrLdM0rnPCHrh5hsR5gOKOPFvxVDINC5wjdUtweuuBEnCvxdg7ehE0iYQ9y3
	g2UgH1vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvfeS-00000006trU-2cjn;
	Thu, 26 Feb 2026 17:59:52 +0000
Received: from mail-dl1-x1249.google.com ([2607:f8b0:4864:20::1249])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvfeM-00000006tnv-0DFp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 17:59:47 +0000
Received: by mail-dl1-x1249.google.com with SMTP id a92af1059eb24-1276e71652fso2091908c88.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Feb 2026 09:59:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772128785; x=1772733585; darn=lists.infradead.org;
        h=content-transfer-encoding:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lMWIeXWUQgyzJ0fPnV+0pSMPvgSBdF0XsAMHNN5+mYc=;
        b=TsncQfbOlhcbHQb3YqQ3++YD9diyoapAiisR+gTX/Ul+yLZmMkcuUA8OjaSyfF2oCF
         tpfDtd6ukxmqChb8ezDTXl7DZP2vE80K6qaIPge5jxrcyqSTGJSqcB24eFHE4fIxeHBa
         p8Q51Fz0R9eknIK9ocIma2pWFSmcQm37xv5ZAPwltRzpYeHcIJRr7h1qeIhYVttFg3Rn
         wFAfeoWB3dZ/FPUw70S7xNjY/l95mAKfESfx2g/5SqH1brv9YHQ4Xwp+ggLGbyWzq6P4
         EYEDY+tRrPGCdfr0np6jwsRSSAuiqCk8gZxITxWTrFJXkm7zKEHXMv83LGo8TqA3DlcC
         H8bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772128785; x=1772733585;
        h=content-transfer-encoding:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=lMWIeXWUQgyzJ0fPnV+0pSMPvgSBdF0XsAMHNN5+mYc=;
        b=QgGAGPouoL2CIKAZJbpoHIZT1pkU8fvzFEpiTjp+8hRApjB1m0knEXR4qKd2fiTYXc
         Sa6OFBbccfyguT+V1A4Ik3VKugBqMvU6MEmQAIKjLQyavU8PcBfL362Od6B9x+YuiHv7
         c5/zx3mqNY0OR/72SxJrJUfmydIGGUAfvoRwqcGXXm0KGdZ15Zd543iirYpVlGSU8LGZ
         rz09MmlQdafBllA6mLXbqAIhreQLuscwHSh3rk513FGfalPKJaFmgNlDWZ1nqMMqlXqd
         t0NK9TAtUZYkivPbNigTrg0m/IceC28Xt2dHPes7O1pT1rKKndS1n3JVL3Cs2CJxUr7y
         YxJg==
X-Forwarded-Encrypted: i=1; AJvYcCXmclx+VWqz+QKF5WAbV4tBpysFs2WKLg5ybi6bGvaS9GA4H5CkeGioE6uIn+P0vxiZwvPdYVPs0p1F+eon0lTw@lists.infradead.org
X-Gm-Message-State: AOJu0Yzj/wQiqww3pEt5L27Qq2ZF5cuKE6mqwo8nrU5U3MGtfwk2C4kg
	Uq6EUV85T7GZXKb18u2hXI9RhUjt0t6taqxiEFaBSAQSe76bn0Cz0kdXFaRQi3hUfP14sNKRl68
	S2d6O9AlxEw==
X-Received: from dlbrd7.prod.google.com ([2002:a05:7022:f107:b0:127:37cd:f16d])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:4392:b0:127:dd7:2062
 with SMTP id a92af1059eb24-127869d3b95mr1480189c88.43.1772128784769; Thu, 26
 Feb 2026 09:59:44 -0800 (PST)
Date: Thu, 26 Feb 2026 09:59:29 -0800
In-Reply-To: <20260226175936.593159-1-irogers@google.com>
Mime-Version: 1.0
References: <20260226175936.593159-1-irogers@google.com>
X-Mailer: git-send-email 2.53.0.473.g4a7958ca14-goog
Message-ID: <20260226175936.593159-3-irogers@google.com>
Subject: [PATCH v2 03/10] perf vendor events intel: Update emeraldrapid events
 from 1.20 to 1.21
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
X-CRM114-CacheID: sfid-20260226_095946_096135_3415AC88 
X-CRM114-Status: GOOD (  14.77  )
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
https://github.com/intel/perfmon/commit/210676cfa8743cd5b9e7cc984fdef1a4854=
2eda4

Signed-off-by: Ian Rogers <irogers@google.com>
---
 .../arch/x86/emeraldrapids/cache.json           |  4 ++--
 .../arch/x86/emeraldrapids/frontend.json        | 16 ++++++++++++++++
 .../arch/x86/emeraldrapids/uncore-cache.json    |  4 ++--
 .../arch/x86/emeraldrapids/uncore-io.json       | 17 +++++++++--------
 tools/perf/pmu-events/arch/x86/mapfile.csv      |  2 +-
 5 files changed, 30 insertions(+), 13 deletions(-)

diff --git a/tools/perf/pmu-events/arch/x86/emeraldrapids/cache.json b/tool=
s/perf/pmu-events/arch/x86/emeraldrapids/cache.json
index 26568e4b77f7..b2f8947f6741 100644
--- a/tools/perf/pmu-events/arch/x86/emeraldrapids/cache.json
+++ b/tools/perf/pmu-events/arch/x86/emeraldrapids/cache.json
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
diff --git a/tools/perf/pmu-events/arch/x86/emeraldrapids/frontend.json b/t=
ools/perf/pmu-events/arch/x86/emeraldrapids/frontend.json
index 793c486ffabe..e51f5e85ffd1 100644
--- a/tools/perf/pmu-events/arch/x86/emeraldrapids/frontend.json
+++ b/tools/perf/pmu-events/arch/x86/emeraldrapids/frontend.json
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
diff --git a/tools/perf/pmu-events/arch/x86/emeraldrapids/uncore-cache.json=
 b/tools/perf/pmu-events/arch/x86/emeraldrapids/uncore-cache.json
index 92cf47967f0b..3c8dcd9cff7c 100644
--- a/tools/perf/pmu-events/arch/x86/emeraldrapids/uncore-cache.json
+++ b/tools/perf/pmu-events/arch/x86/emeraldrapids/uncore-cache.json
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
diff --git a/tools/perf/pmu-events/arch/x86/emeraldrapids/uncore-io.json b/=
tools/perf/pmu-events/arch/x86/emeraldrapids/uncore-io.json
index d4cf2199d46b..ddb0f65307f4 100644
--- a/tools/perf/pmu-events/arch/x86/emeraldrapids/uncore-io.json
+++ b/tools/perf/pmu-events/arch/x86/emeraldrapids/uncore-io.json
@@ -223,6 +223,7 @@
         "Experimental": "1",
         "FCMask": "0x07",
         "PerPkg": "1",
+        "PortMask": "0xff",
         "UMask": "0xff",
         "Unit": "IIO"
     },
@@ -234,7 +235,7 @@
         "Experimental": "1",
         "FCMask": "0x07",
         "PerPkg": "1",
-        "PortMask": "0x0000",
+        "PortMask": "0x01",
         "PublicDescription": "x16 card plugged in to stack, Or x8 card plu=
gged in to Lane 0/1, Or x4 card is plugged in to slot 0",
         "UMask": "0x1",
         "Unit": "IIO"
@@ -247,7 +248,7 @@
         "Experimental": "1",
         "FCMask": "0x07",
         "PerPkg": "1",
-        "PortMask": "0x0000",
+        "PortMask": "0x02",
         "PublicDescription": "x4 card is plugged in to slot 1",
         "UMask": "0x2",
         "Unit": "IIO"
@@ -260,7 +261,7 @@
         "Experimental": "1",
         "FCMask": "0x07",
         "PerPkg": "1",
-        "PortMask": "0x0000",
+        "PortMask": "0x04",
         "PublicDescription": "x8 card plugged in to Lane 2/3, Or x4 card i=
s plugged in to slot 1",
         "UMask": "0x4",
         "Unit": "IIO"
@@ -273,7 +274,7 @@
         "Experimental": "1",
         "FCMask": "0x07",
         "PerPkg": "1",
-        "PortMask": "0x0000",
+        "PortMask": "0x08",
         "PublicDescription": "x4 card is plugged in to slot 3",
         "UMask": "0x8",
         "Unit": "IIO"
@@ -286,7 +287,7 @@
         "Experimental": "1",
         "FCMask": "0x07",
         "PerPkg": "1",
-        "PortMask": "0x0000",
+        "PortMask": "0x10",
         "PublicDescription": "x16 card plugged in to stack, Or x8 card plu=
gged in to Lane 0/1, Or x4 card is plugged in to slot 0",
         "UMask": "0x10",
         "Unit": "IIO"
@@ -299,7 +300,7 @@
         "Experimental": "1",
         "FCMask": "0x07",
         "PerPkg": "1",
-        "PortMask": "0x0000",
+        "PortMask": "0x20",
         "PublicDescription": "x4 card is plugged in to slot 1",
         "UMask": "0x20",
         "Unit": "IIO"
@@ -312,7 +313,7 @@
         "Experimental": "1",
         "FCMask": "0x07",
         "PerPkg": "1",
-        "PortMask": "0x0000",
+        "PortMask": "0x40",
         "PublicDescription": "x8 card plugged in to Lane 2/3, Or x4 card i=
s plugged in to slot 1",
         "UMask": "0x40",
         "Unit": "IIO"
@@ -325,7 +326,7 @@
         "Experimental": "1",
         "FCMask": "0x07",
         "PerPkg": "1",
-        "PortMask": "0x0000",
+        "PortMask": "0x80",
         "PublicDescription": "x4 card is plugged in to slot 3",
         "UMask": "0x80",
         "Unit": "IIO"
diff --git a/tools/perf/pmu-events/arch/x86/mapfile.csv b/tools/perf/pmu-ev=
ents/arch/x86/mapfile.csv
index 7e9bc4241c61..92799bc6e9d9 100644
--- a/tools/perf/pmu-events/arch/x86/mapfile.csv
+++ b/tools/perf/pmu-events/arch/x86/mapfile.csv
@@ -9,7 +9,7 @@ GenuineIntel-6-4F,v23,broadwellx,core
 GenuineIntel-6-55-[56789ABCDEF],v1.25,cascadelakex,core
 GenuineIntel-6-DD,v1.00,clearwaterforest,core
 GenuineIntel-6-9[6C],v1.05,elkhartlake,core
-GenuineIntel-6-CF,v1.20,emeraldrapids,core
+GenuineIntel-6-CF,v1.21,emeraldrapids,core
 GenuineIntel-6-5[CF],v13,goldmont,core
 GenuineIntel-6-7A,v1.01,goldmontplus,core
 GenuineIntel-6-B6,v1.10,grandridge,core
--=20
2.53.0.414.gf7e9f6c205-goog


