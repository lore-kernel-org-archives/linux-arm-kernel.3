Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A189FD461D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 04:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:To:From:Subject:Message-ID:References:Mime-Version:In-Reply-To:
	Date:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y9IYxdgBLU5Ki2XKkdZb6JYvsW9cUiH1hG77z1/Bhhw=; b=MD60dgjqWn7zHL1upmS9BGBNgD
	IDDZSUtltF4Tk/2b80PoDcH2JdWBBj+vgR1+q87Ia7g69cQ2CByBiWlfhyfotc5G9KPPgf537XziG
	SAMRdI2O+qo4tDH4pnZAGbMpyohrCZ/a8ExTs+m0GqwOeDTA7oTkiN0KSnCNJ1zYxIWZf7zFJnS8T
	Ljj3pgJ1rNOdo5FR2LtZlJczZmtLg1B+oYE329R7GOoB0Z2e6oTJ2z6s37wGG/w64maRPlFytl93n
	2d5D1UaniIXvUsKun+0pRqlGHxTN7Czw6jwHUmuJeb0vT+NaToi2ifi7k/IyB3i+W/oUL1jDFfXUk
	I/5p+iJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvTNT-00000005Nw7-3fXx;
	Thu, 26 Feb 2026 04:53:31 +0000
Received: from mail-dl1-x1249.google.com ([2607:f8b0:4864:20::1249])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvTNO-00000005Npx-1Ttc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 04:53:27 +0000
Received: by mail-dl1-x1249.google.com with SMTP id a92af1059eb24-1275c2ae713so9514818c88.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Feb 2026 20:53:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772081605; x=1772686405; darn=lists.infradead.org;
        h=content-transfer-encoding:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y9IYxdgBLU5Ki2XKkdZb6JYvsW9cUiH1hG77z1/Bhhw=;
        b=ejjicUQ92gScQ5gnKpn7Y3XJiutiIRoCFgRsSO9yJU9toz0h5mUrwx8GKPAOQrnySH
         /clP2WtFfNRuCiw7bz/xRD6JzgphhM/NJLPSWqvi/UTxsbbh3uVNEydHE8338k6BehUS
         JxlJUbnA0XjRlUBT4XYkPYcoHqX5QRtbbxg+8LTZG3Rkg5lhTSc32id0WLGxehsVvBql
         4jh7hrp76jRQmY5R/1DpG4qawCLUM8EbXXNRPeNZ+sV/v3iWfm8jI2VDpw18VA/uVdgj
         gK1gxyMrB6V+BZAnLu1GbcT4f54J/ESHQquhYn7NOmdSGcLemc2c0Qg6iFGk1y4q1URY
         VAxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772081605; x=1772686405;
        h=content-transfer-encoding:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Y9IYxdgBLU5Ki2XKkdZb6JYvsW9cUiH1hG77z1/Bhhw=;
        b=Cfz4OrL4S3XUfPm6E/vIjYjqlBrZKy3yoljH7smjp+nXOHP+eh+Qsm0zbb+SdXMeV3
         s0pLsHVhKYnBZFaPZ91YmAaLuwwa5aHl+kIq9lo1lMoT3LbTDLE0eqRjGJeJsPgiQ71o
         VNnig+LiHWU14lWscD+BW1J+R/a5AysbTbmLfcIvwS0AbDIbQEqtFV1MNc3hdGi0XdjO
         2aBVG0f4JKjVxOkId2NIEteF43sXa8cYPbUCFiqE50Dmuk1ENgN3BKN5/RR55coEOCjL
         O0+Eu5Ey75vwMDBXy8xRURAF+Y8wGxUyrTUqrvYYnFDaKTjl+VigYtPWewmOlmr1toxo
         EzmA==
X-Forwarded-Encrypted: i=1; AJvYcCW/0MuTEiQKS24Dlci+/608JRWsKbPng/7yQTcusnaEG8mYqiY+Q1w2jjELKvYev9iEENHKV02r6lmzsne1jU0i@lists.infradead.org
X-Gm-Message-State: AOJu0YzAjiq4J2Ff2+Xw7Y2684Q2W6e3YcbhXQsiXN07AnvJut6nY7Te
	tD1TTcQkyOvt1kNMXT5ANrn5iAY/Sy+QO8RzD4UgYxp9h5TIhKKhIWs/2eMW3BmJ4mhgXHv2ib+
	XyLb/r7mpKg==
X-Received: from dlbeg37.prod.google.com ([2002:a05:7022:fa5:b0:127:2bdd:909])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:f96:b0:11b:7970:ea3f
 with SMTP id a92af1059eb24-1276ad11866mr8875971c88.25.1772081604772; Wed, 25
 Feb 2026 20:53:24 -0800 (PST)
Date: Wed, 25 Feb 2026 20:53:00 -0800
In-Reply-To: <20260226045301.459948-1-irogers@google.com>
Mime-Version: 1.0
References: <20260226045301.459948-1-irogers@google.com>
X-Mailer: git-send-email 2.53.0.414.gf7e9f6c205-goog
Message-ID: <20260226045301.459948-9-irogers@google.com>
Subject: [PATCH v1 09/10] perf vendor events intel: Update sapphirerapids
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
X-CRM114-CacheID: sfid-20260225_205326_423481_52B47B14 
X-CRM114-Status: GOOD (  14.70  )
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


