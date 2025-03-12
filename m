Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A64D1C28B28
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 08:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3Z6Mxx2aA1iwPXb06aMUzTtJSbyAylr73vTs/l/zuYQ=; b=WBQKClQhOIzoE431IMyHh5AR31
	2GiqWbjPY0Su6ht7wPvRBiZBx8oo5z3TuY+vZj92jSR0opHBnyzYuVrUB/1N4y7xoo2UZB0zswBnk
	narAmEuY9QQAJgXgR1OIU7LZSZkS4AZkMqZbw4djmemSXL72ymMdntkbZeZwGODYedXCf3p3bOcgl
	lKsEaIUbj3SThBuxzZ4OCLcH11rV7aIPkjVlz/Jq1WHtf1K2cgUMcu8GgRaMvvstq49ssWWQ/4zfW
	7mhoyQogrAJzBNEXzZXDwovSyvMZ0kxRJ/U2s8KWy93BxI3MPd+Lwr7kRWBi3Ko/7eFY52K8Uyn/o
	yXvAu0XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsHA1-00000007nND-0bvZ;
	Wed, 12 Mar 2025 08:09:53 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsGxK-00000007lQw-3VTJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Mar 2025 07:56:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741766206; x=1773302206;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=9j32Q9ko3nzPeg45xM2NtQmpmXTW//lBQJ+uN6+5dN8=;
  b=d4Yu3UOdbVtLrYTgKAms0QOjVg2DOYjbMdLFFR220m3VzyKC+5PT7Z0w
   4yjMKfWNuU8YCvZhKmtZSBKjeEsT/bpip/9FH2OloKmP/o34UZh2UZyTZ
   8vMb9SR2NCP5W8nD5eqrSj6Bgz2Qk5N1guffrzInlYsm75ck40uFeCOmI
   GPe6axcCJ6sJX0Je2a++p68Jvd585egiLNnHhk+zMO7qEA1fJOgdDYbNx
   Sb2LnR91EVsSdpFVC8P3tWSigxMmRiKRDxNJVdNkJc4Hxgy8D0X4zvGU8
   DAv3kUzXtgHRBbycjNovVpRHLpkvmBbs40E2cH8wRtoMKCSWyVxaB2zdn
   A==;
X-CSE-ConnectionGUID: Q0vBAicORneGosxi8xM7MQ==
X-CSE-MsgGUID: 7FmLE//lSUajVy9dtodleg==
X-IronPort-AV: E=McAfee;i="6700,10204,11370"; a="42869907"
X-IronPort-AV: E=Sophos;i="6.14,241,1736841600"; 
   d="scan'208";a="42869907"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2025 00:56:43 -0700
X-CSE-ConnectionGUID: je2W3usmSyC6bdqstz/sZw==
X-CSE-MsgGUID: nhpioELPS3+NzVxrnVtM3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,241,1736841600"; 
   d="scan'208";a="125462623"
Received: from yujie-x299.sh.intel.com ([10.239.159.77])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2025 00:56:39 -0700
From: Yujie Liu <yujie.liu@intel.com>
To: linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Leo Yan <leo.yan@arm.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Ian Rogers <irogers@google.com>,
	James Clark <james.clark@linaro.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	"Liang, Kan" <kan.liang@linux.intel.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Will Deacon <will@kernel.org>,
	Mike Leach <mike.leach@linaro.org>,
	Graham Woodward <graham.woodward@arm.com>,
	Paschalis.Mpeis@arm.com
Subject: [PATCH] perf script: Fix typo in branch event mask
Date: Wed, 12 Mar 2025 15:56:36 +0800
Message-Id: <20250312075636.429127-1-yujie.liu@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_005646_939352_FCACF267 
X-CRM114-Status: GOOD (  11.58  )
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

BRACH -> BRANCH

Fixes: 88b1473135e4 ("perf script: Separate events from branch types")
Signed-off-by: Yujie Liu <yujie.liu@intel.com>
---
 tools/perf/util/event.h                 | 2 +-
 tools/perf/util/trace-event-scripting.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/perf/util/event.h b/tools/perf/util/event.h
index c7f4b4b841ca..664bf39567ce 100644
--- a/tools/perf/util/event.h
+++ b/tools/perf/util/event.h
@@ -91,7 +91,7 @@ enum {
 	PERF_IP_FLAG_VMENTRY		|\
 	PERF_IP_FLAG_VMEXIT)
 
-#define PERF_IP_FLAG_BRACH_EVENT_MASK	\
+#define PERF_IP_FLAG_BRANCH_EVENT_MASK	\
 	(PERF_IP_FLAG_BRANCH_MISS |	\
 	 PERF_IP_FLAG_NOT_TAKEN)
 
diff --git a/tools/perf/util/trace-event-scripting.c b/tools/perf/util/trace-event-scripting.c
index 29cc467be14a..72abb28b7b5a 100644
--- a/tools/perf/util/trace-event-scripting.c
+++ b/tools/perf/util/trace-event-scripting.c
@@ -347,7 +347,7 @@ static int sample_flags_to_name(u32 flags, char *str, size_t size)
 
 	flags &= ~(PERF_IP_FLAG_TRACE_BEGIN | PERF_IP_FLAG_TRACE_END);
 
-	types = flags & ~PERF_IP_FLAG_BRACH_EVENT_MASK;
+	types = flags & ~PERF_IP_FLAG_BRANCH_EVENT_MASK;
 	for (i = 0; sample_flags[i].name; i++) {
 		if (sample_flags[i].flags != types)
 			continue;
@@ -359,7 +359,7 @@ static int sample_flags_to_name(u32 flags, char *str, size_t size)
 		break;
 	}
 
-	events = flags & PERF_IP_FLAG_BRACH_EVENT_MASK;
+	events = flags & PERF_IP_FLAG_BRANCH_EVENT_MASK;
 	for (i = 0; branch_events[i].name; i++) {
 		if (!(branch_events[i].flags & events))
 			continue;

base-commit: b10f74308e1305275e69ddde711ec817cc69e306
-- 
2.34.1


