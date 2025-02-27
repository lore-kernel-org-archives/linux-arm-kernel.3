Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35530C021BE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 05:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UzjZ4pQVne3JBvx8ciYeMX9Pta6CKqT0/YbZxDiM7+g=; b=W6uC7unepAwocA7L09yh3bkyfH
	jRp7fNz+5O4VA1Hz353XtKSJb39nx9q/dgfYnuFMaDVJTcrx2g9+yh+2RH4FPOLj2nRTJLSOsLxAc
	ekF6cRz7p5Vc3GTAAt8OxqmTpW1d443v2RoUjLUKodzK7A1e2ZdFHapp+q2CZIE46Nm41Q/VxXMgO
	gMoV5nXcgP3UgRnJ7+B0Ou+iVunbZROcaRGhpVf480COzgkQzOUF6e9s5Sj/DnJ91HmqNMPltV2Ki
	i8Nc6t7SL0UTxUSm+8YUNwYWX5jNWseMJ2jUnNFJVlnVJ0Lprb9vCAFRBtSxpqq7QIIyG50QJZr8Z
	MN/61+1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnWgI-00000006OJb-06Q7;
	Thu, 27 Feb 2025 05:43:34 +0000
Received: from esa10.hc1455-7.c3s2.iphmx.com ([139.138.36.225])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnWej-00000006O8H-3xkO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 05:41:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1740634918; x=1772170918;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=7ioaoaFEqmOjduVcLT1zN2cDU+hoCGDa+V7RfZiay3o=;
  b=Ec6aIarh86lOFpek21xJ/hQU/sQ1QcTyC7m7hHTjtEqIaCN2ZRtDv9tR
   RLuZMQ6D0eHlA9craQecPOpLBA3odiyZ4VYnreBKmIsbIIfDMByH+jzMq
   8O5z/jAxBWWi/yMiBArC6U+vKXmgY+rCYwlSLR5EcMAVfLttGmNwIyJK4
   YO1l/lpIqZgIXxpoVzwJ2wdEESMLIpNCry6tpUHOKyxTDodZ34Zqt1w3s
   dRqaYA6lyUrTjSCmtqvyOcrCFi96gjVDo7qPeGqSCSVn6wVOJCIhS9+aI
   TzohnDXlx7/f253w/wQubWrW8oSNaTO7LxGWbdfjC8vAzmrSYo7WXk0Mw
   Q==;
X-CSE-ConnectionGUID: cfyxIWBLTbOd0ZHTVSJm3A==
X-CSE-MsgGUID: z+7MZkGVTsmlI0sHyytM7Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11357"; a="178703517"
X-IronPort-AV: E=Sophos;i="6.13,319,1732546800"; 
   d="scan'208";a="178703517"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2025 14:41:52 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id EAC77E8521
	for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Feb 2025 14:41:49 +0900 (JST)
Received: from yto-om3.fujitsu.com (yto-om3.o.css.fujitsu.com [10.128.89.164])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id C0F44D091B
	for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Feb 2025 14:41:49 +0900 (JST)
Received: from sm-x86-mem01.ssoft.mng.com (sm-x86-stp01.soft.fujitsu.com [10.124.178.20])
	by yto-om3.fujitsu.com (Postfix) with ESMTP id 04DE54005847B;
	Thu, 27 Feb 2025 14:41:48 +0900 (JST)
From: Yoshihiro Furudera <fj5100bi@fujitsu.com>
To: John Garry <john.g.garry@oracle.com>,
	Will Deacon <will@kernel.org>,
	James Clark <james.clark@linaro.org>,
	Mike Leach <mike.leach@linaro.org>,
	Leo Yan <leo.yan@linux.dev>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	"Liang, Kan" <kan.liang@linux.intel.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Akio Kakuno <fj3333bs@aa.jp.fujitsu.com>,
	Yoshihiro Furudera <fj5100bi@fujitsu.com>
Subject: [PATCH] Remove some PMU events for FUJITSU-MONAKA
Date: Thu, 27 Feb 2025 05:40:45 +0000
Message-Id: <20250227054045.1340090-1-fj5100bi@fujitsu.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_214158_363214_C90B00AF 
X-CRM114-Status: GOOD (  10.55  )
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

The following events are not counted properly:

0x0037 LL_CACHE_MISS_RD
0x400B L3D_CACHE_LMISS_RD
0x0396 L2D_CACHE_REFILL_L3D_MISS
0x039A L2D_CACHE_REFILL_L3D_MISS_PRF
0x039B L2D_CACHE_REFILL_L3D_MISS_HWPRF
0x039C L2D_CACHE_REFILL_L3D_HIT
0x03A0 L2D_CACHE_REFILL_L3D_HIT_PRF
0x03A1 L2D_CACHE_REFILL_L3D_HIT_HWPRF

Specifically, these events are always counted as misses,
regardless of whether the L3 prefetch is a hit or a miss.
So I remove these events in l3_cache.json, ll_cache.json

Signed-off-by: Yoshihiro Furudera <fj5100bi@fujitsu.com>
---
 .../arch/arm64/fujitsu/monaka/l3_cache.json   | 34 -------------------
 .../arch/arm64/fujitsu/monaka/ll_cache.json   |  4 ---
 2 files changed, 38 deletions(-)

diff --git a/tools/perf/pmu-events/arch/arm64/fujitsu/monaka/l3_cache.json b/tools/perf/pmu-events/arch/arm64/fujitsu/monaka/l3_cache.json
index 3f3e0d22ac68..917b9b5bf8bb 100644
--- a/tools/perf/pmu-events/arch/arm64/fujitsu/monaka/l3_cache.json
+++ b/tools/perf/pmu-events/arch/arm64/fujitsu/monaka/l3_cache.json
@@ -37,11 +37,6 @@
         "EventName": "L2D_CACHE_REFILL_L3D_CACHE_HWPRF",
         "BriefDescription": "This event counts L2D_CACHE_REFILL_L3D_CACHE caused by hardware prefetch access."
     },
-    {
-        "EventCode": "0x0396",
-        "EventName": "L2D_CACHE_REFILL_L3D_MISS",
-        "BriefDescription": "This event counts operations that cause a miss of the L3 cache."
-    },
     {
         "EventCode": "0x0397",
         "EventName": "L2D_CACHE_REFILL_L3D_MISS_DM",
@@ -57,21 +52,6 @@
         "EventName": "L2D_CACHE_REFILL_L3D_MISS_DM_WR",
         "BriefDescription": "This event counts L2D_CACHE_REFILL_L3D_MISS caused by demand write access."
     },
-    {
-        "EventCode": "0x039A",
-        "EventName": "L2D_CACHE_REFILL_L3D_MISS_PRF",
-        "BriefDescription": "This event counts L2D_CACHE_REFILL_L3D_MISS caused by prefetch access."
-    },
-    {
-        "EventCode": "0x039B",
-        "EventName": "L2D_CACHE_REFILL_L3D_MISS_HWPRF",
-        "BriefDescription": "This event counts L2D_CACHE_REFILL_L3D_MISS caused by hardware prefetch access."
-    },
-    {
-        "EventCode": "0x039C",
-        "EventName": "L2D_CACHE_REFILL_L3D_HIT",
-        "BriefDescription": "This event counts operations that cause a hit of the L3 cache."
-    },
     {
         "EventCode": "0x039D",
         "EventName": "L2D_CACHE_REFILL_L3D_HIT_DM",
@@ -87,16 +67,6 @@
         "EventName": "L2D_CACHE_REFILL_L3D_HIT_DM_WR",
         "BriefDescription": "This event counts L2D_CACHE_REFILL_L3D_HIT caused by demand write access."
     },
-    {
-        "EventCode": "0x03A0",
-        "EventName": "L2D_CACHE_REFILL_L3D_HIT_PRF",
-        "BriefDescription": "This event counts L2D_CACHE_REFILL_L3D_HIT caused by prefetch access."
-    },
-    {
-        "EventCode": "0x03A1",
-        "EventName": "L2D_CACHE_REFILL_L3D_HIT_HWPRF",
-        "BriefDescription": "This event counts L2D_CACHE_REFILL_L3D_HIT caused by hardware prefetch access."
-    },
     {
         "EventCode": "0x03A2",
         "EventName": "L2D_CACHE_REFILL_L3D_MISS_PFTGT_HIT",
@@ -151,9 +121,5 @@
         "EventCode": "0x03AC",
         "EventName": "L2D_CACHE_REFILL_L3D_MISS_FR_L3",
         "BriefDescription": "This event counts the number of L3 cache misses where the requests access L3 cache in the different socket from the requests."
-    },
-    {
-        "ArchStdEvent": "L3D_CACHE_LMISS_RD",
-        "BriefDescription": "This event counts access counted by L3D_CACHE that is not completed by the L3D cache, and  a Memory-read operation, as defined by the L2D_CACHE_REFILL_L3D_MISS events."
     }
 ]
diff --git a/tools/perf/pmu-events/arch/arm64/fujitsu/monaka/ll_cache.json b/tools/perf/pmu-events/arch/arm64/fujitsu/monaka/ll_cache.json
index a441b84729ab..c2325855eda3 100644
--- a/tools/perf/pmu-events/arch/arm64/fujitsu/monaka/ll_cache.json
+++ b/tools/perf/pmu-events/arch/arm64/fujitsu/monaka/ll_cache.json
@@ -2,9 +2,5 @@
     {
         "ArchStdEvent": "LL_CACHE_RD",
         "BriefDescription": "This event counts access counted by L3D_CACHE that is a Memory-read operation, as defined by the L2D_CACHE_REFILL_L3D_CACHE events."
-    },
-    {
-        "ArchStdEvent": "LL_CACHE_MISS_RD",
-        "BriefDescription": "This event counts access counted by L3D_CACHE that is not completed by the L3D cache, and a Memory-read operation, as defined by the L2D_CACHE_REFILL_L3D_MISS events."
     }
 ]
-- 
2.43.0


