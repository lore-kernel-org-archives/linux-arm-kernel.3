Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 821C9FD461C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 04:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:To:From:Subject:Message-ID:References:Mime-Version:In-Reply-To:
	Date:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p0sd+ZwPNif80S6gNRMMBCY+IhDOwA5QIZbdK/H8ojY=; b=r2qa+etJ7zme5Aia7Kip/z8S/C
	txKT3kBUlFVaRVCGCv7Wa+AGrvKQq2P5sj5P40uijqwil4K8hbE3vSLEfRJmlOn6VywlW4U0GyUYr
	JayuhqaclWigZNd9nS7fyUNN7Qq2/Bsp1fTW8HTLyxQPuGwLNQC5lZ3sWCQwjwW+BaQhkuW52/7hD
	IYsBH//EaZpKvGN33Im5jzXFxWhHIw/NRF4fnDuyWBMPjW0DkSrnGUhj0C/A0jW+djrfM869pB1qx
	ne9C/0KXfPCA1TvIJWOZ6qHtzg1AlLu7JSfBKDAr6jH7P+ChLJThbL3kltrvP3nD2K/+7mSmXNCgB
	+ff6a/bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvTNR-00000005Ntq-4B7s;
	Thu, 26 Feb 2026 04:53:30 +0000
Received: from mail-dy1-x1349.google.com ([2607:f8b0:4864:20::1349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvTNF-00000005Nkk-1bmo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 04:53:20 +0000
Received: by mail-dy1-x1349.google.com with SMTP id 5a478bee46e88-2bdb0c8c5bcso9867837eec.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Feb 2026 20:53:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772081596; x=1772686396; darn=lists.infradead.org;
        h=content-transfer-encoding:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p0sd+ZwPNif80S6gNRMMBCY+IhDOwA5QIZbdK/H8ojY=;
        b=MVdbi5b3E5kURjOYytvSIpbiA0OvyOusWJnXTUPHr89AzB1Xs/3sLjxZ+gE098ZEei
         eP9ZExJNhTxUKQTJbOtfSD+cm26qEikqTLZbGCGsO+Bpz9dKhTfL+zrTqwrfOsaXP3x1
         canPQFKU//cRrnF53iceTQMUHQ/rAErl7AyRvyNLQlkVM7Q+gq4SqA2MNSEooveOUo7f
         dZ9bwfLPCEdDfM9uZxL/xn/NDjOs1XdtBd6TUMnhKFt3pp4I0tve76kkjwD5L6pjS30W
         swivWaxPdmXFPoV3k/NuwWrTgpJat1hREp6GQNaYyqgftsX7RKUDFT+MEtufKNiGylfW
         dCNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772081596; x=1772686396;
        h=content-transfer-encoding:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=p0sd+ZwPNif80S6gNRMMBCY+IhDOwA5QIZbdK/H8ojY=;
        b=RpftAHHOFLCh90o6U/jAJvuiF8p+lE66HugEQA7dXmd5HkeurzLonP9QP4d8WOfU29
         zh6y5Nr6aetqGrVcx86wo+2/G4JOSzf8Wzw/Sx83w52J6TiZL/wRexCYvb4WjykwX1R6
         FV+rYJtnmyM3v6cWCE8q2xB95C+fcqKRsbhDpjL4to3VheZXLYuTzc08x98INfJdyDZS
         wL2cTtvOsBlg37vMSRbqvvoZdgEllZuPLIPs8Uj44Zo9utfMneO8XjXnwdk/dWXrMHny
         Eds+lfaOSe+Fhx3dheMf/GGdYKoUzo4h+wtihbDhipx86fHU3tYyA9foKp2RLrhXMCIu
         8/4w==
X-Forwarded-Encrypted: i=1; AJvYcCUS9+V4iRSowHOdidAqqFuCphOLgFE4URCHlyIhs2PuXRu3sLWpcH2cFHaCQ+U5JarivA8xevVDX8WsT5zQUzoi@lists.infradead.org
X-Gm-Message-State: AOJu0YzF+zRrygFZOYDY3nVA6AQ2zW5NJtp27JvLdJN+jAFQWcwUQ/Al
	rb4nMX8PfMy3dfq1YpUMZjEcM/9NMEXoTeXahLZ7hFP2KsEUtFWBonNLNR5jfRSn4zZZwoUNUWI
	8W/sjbV/V+w==
X-Received: from dybia18.prod.google.com ([2002:a05:7301:312:b0:2ae:3309:a304])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:df41:b0:2b7:1b54:6081
 with SMTP id 5a478bee46e88-2bd7baed292mr8598146eec.11.1772081595621; Wed, 25
 Feb 2026 20:53:15 -0800 (PST)
Date: Wed, 25 Feb 2026 20:52:56 -0800
In-Reply-To: <20260226045301.459948-1-irogers@google.com>
Mime-Version: 1.0
References: <20260226045301.459948-1-irogers@google.com>
X-Mailer: git-send-email 2.53.0.414.gf7e9f6c205-goog
Message-ID: <20260226045301.459948-5-irogers@google.com>
Subject: [PATCH v1 05/10] perf vendor events intel: Update graniterapids
 events from 1.16 to 1.17
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
X-CRM114-CacheID: sfid-20260225_205317_451124_D613D340 
X-CRM114-Status: GOOD (  13.34  )
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
https://github.com/intel/perfmon/commit/c9ebc3ff9c3d408a888fbfbe73d386ef86c=
7306f

With new IO and SNC metrics in:
https://github.com/intel/perfmon/commit/04cf5e1e804afd775401167870d48cd2586=
4be7b
https://github.com/intel/perfmon/commit/98b2602d83de6625bae1e6fcaab3a39b0a3=
41255

Signed-off-by: Ian Rogers <irogers@google.com>
---
 .../arch/x86/graniterapids/frontend.json      | 16 +++++++++++
 .../arch/x86/graniterapids/gnr-metrics.json   | 27 +++++++++++++++++++
 tools/perf/pmu-events/arch/x86/mapfile.csv    |  2 +-
 3 files changed, 44 insertions(+), 1 deletion(-)

diff --git a/tools/perf/pmu-events/arch/x86/graniterapids/frontend.json b/t=
ools/perf/pmu-events/arch/x86/graniterapids/frontend.json
index d580d305c926..1fdeaebb739f 100644
--- a/tools/perf/pmu-events/arch/x86/graniterapids/frontend.json
+++ b/tools/perf/pmu-events/arch/x86/graniterapids/frontend.json
@@ -325,6 +325,22 @@
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
diff --git a/tools/perf/pmu-events/arch/x86/graniterapids/gnr-metrics.json =
b/tools/perf/pmu-events/arch/x86/graniterapids/gnr-metrics.json
index cc3c834ca286..299631fb8d53 100644
--- a/tools/perf/pmu-events/arch/x86/graniterapids/gnr-metrics.json
+++ b/tools/perf/pmu-events/arch/x86/graniterapids/gnr-metrics.json
@@ -143,6 +143,12 @@
         "MetricName": "io_full_write_l3_miss",
         "ScaleUnit": "100%"
     },
+    {
+        "BriefDescription": "The number of times per second that ownership=
 of a cacheline was stolen from the integrated IO controller before it was =
able to write back the modified line",
+        "MetricExpr": "(UNC_I_MISC1.LOST_FWD + UNC_I_MISC1.SEC_RCVD_INVLD)=
 / duration_time",
+        "MetricName": "io_lost_fwd",
+        "ScaleUnit": "1per_sec"
+    },
     {
         "BriefDescription": "Message Signaled Interrupts (MSI) per second =
sent by the integrated I/O traffic controller (IIO) to System Configuration=
 Controller (Ubox)",
         "MetricExpr": "UNC_IIO_NUM_REQ_OF_CPU_BY_TGT.UBOX_POSTED / duratio=
n_time",
@@ -294,6 +300,27 @@
         "MetricName": "memory_bandwidth_write",
         "ScaleUnit": "1MB/s"
     },
+    {
+        "BriefDescription": "All reads to the local sub-numa cluster cache=
 as a percentage of total memory read accesses",
+        "MetricExpr": "(L2_LINES_IN.ALL - (OCR.READS_TO_CORE.SNC_CACHE.HIT=
M + OCR.READS_TO_CORE.SNC_CACHE.HIT_WITH_FWD + OCR.READS_TO_CORE.REMOTE_CAC=
HE.SNOOP_FWD + OCR.READS_TO_CORE.REMOTE_MEMORY + OCR.READS_TO_CORE.L3_MISS_=
LOCAL)) / L2_LINES_IN.ALL",
+        "MetricName": "numa_percent_all_reads_to_local_cluster_cache",
+        "PublicDescription": "All reads to the local sub-numa cluster cach=
e as a percentage of total memory read accesses. Includes demand and prefet=
ch requests for data reads, code reads, read for ownerships (RFO), does not=
 include LLC prefetches",
+        "ScaleUnit": "100%"
+    },
+    {
+        "BriefDescription": "All reads to the local sub-numa cluster memor=
y as a percentage of total memory read accesses",
+        "MetricExpr": "OCR.READS_TO_CORE.L3_MISS_LOCAL / L2_LINES_IN.ALL",
+        "MetricName": "numa_percent_all_reads_to_local_cluster_memory",
+        "PublicDescription": "All reads to the local sub-numa cluster memo=
ry as a percentage of total memory read accesses. Includes demand and prefe=
tch requests for data reads, code reads, read for ownerships (RFO), does no=
t include LLC prefetches",
+        "ScaleUnit": "100%"
+    },
+    {
+        "BriefDescription": "All reads to a remote sub-numa cluster cache =
as a percentage of total memory read accesses",
+        "MetricExpr": "(OCR.READS_TO_CORE.SNC_CACHE.HIT_WITH_FWD + OCR.REA=
DS_TO_CORE.SNC_CACHE.HITM) / L2_LINES_IN.ALL",
+        "MetricName": "numa_percent_all_reads_to_remote_cluster_cache",
+        "PublicDescription": "All reads to a remote sub-numa cluster cache=
 as a percentage of total memory read accesses. Includes demand and prefetc=
h requests for data reads, code reads, read for ownerships (RFO), does not =
include LLC prefetches",
+        "ScaleUnit": "100%"
+    },
     {
         "BriefDescription": "Memory read that miss the last level cache (L=
LC) addressed to local DRAM as a percentage of total memory read accesses, =
does not include LLC prefetches",
         "MetricExpr": "(UNC_CHA_TOR_INSERTS.IA_MISS_DRD_LOCAL + UNC_CHA_TO=
R_INSERTS.IA_MISS_DRD_PREF_LOCAL) / (UNC_CHA_TOR_INSERTS.IA_MISS_DRD_LOCAL =
+ UNC_CHA_TOR_INSERTS.IA_MISS_DRD_PREF_LOCAL + UNC_CHA_TOR_INSERTS.IA_MISS_=
DRD_REMOTE + UNC_CHA_TOR_INSERTS.IA_MISS_DRD_PREF_REMOTE)",
diff --git a/tools/perf/pmu-events/arch/x86/mapfile.csv b/tools/perf/pmu-ev=
ents/arch/x86/mapfile.csv
index b84035dc5b4f..96580ffda7bf 100644
--- a/tools/perf/pmu-events/arch/x86/mapfile.csv
+++ b/tools/perf/pmu-events/arch/x86/mapfile.csv
@@ -13,7 +13,7 @@ GenuineIntel-6-CF,v1.21,emeraldrapids,core
 GenuineIntel-6-5[CF],v13,goldmont,core
 GenuineIntel-6-7A,v1.01,goldmontplus,core
 GenuineIntel-6-B6,v1.11,grandridge,core
-GenuineIntel-6-A[DE],v1.16,graniterapids,core
+GenuineIntel-6-A[DE],v1.17,graniterapids,core
 GenuineIntel-6-(3C|45|46),v36,haswell,core
 GenuineIntel-6-3F,v29,haswellx,core
 GenuineIntel-6-7[DE],v1.24,icelake,core
--=20
2.53.0.414.gf7e9f6c205-goog


