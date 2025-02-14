Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2533AC02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 11:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2F5AoGxweZyRxTGsbusA5XqIcYpHtIC+DllxO4NYL30=; b=yCG8Lbf3i90Y4jkfNGWqY/RIKa
	1cFJRg16ahkKn2xLChT4OxQF1bG1uzSYmjhjwVzcRBUOwy82+PDlGU2fQqc8l3DjlqIACzz+xtCPh
	u/TxvowtOXLhSJiLtqIavJxIurd/ib2rONvPcKIelX09YvJ+qeNSNC/ALJ9+vMVhw7imLKleNWllc
	FnicZHUDAnH+p51hI3A6znoT8083i+bYDjztZ7AzObhrLCZCDYPheeidXGtp13BUpBvZayPnMLwDY
	3MTXOhc5R/ixAz1ESlDS6R93acYzNY9rpDHcJVeTQZjLdfMZH96ptnBpMD/0349O+hbBfuX8N7SDA
	DsBrgX0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1titqd-0000000Efit-1oyI;
	Fri, 14 Feb 2025 11:27:07 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1titji-0000000Ee5I-1cNP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 11:19:59 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 543DB113E;
	Fri, 14 Feb 2025 03:20:18 -0800 (PST)
Received: from e132581.cambridge.arm.com (e132581.arm.com [10.2.76.71])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3959C3F6A8;
	Fri, 14 Feb 2025 03:19:55 -0800 (PST)
From: Leo Yan <leo.yan@arm.com>
To: Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Ian Rogers <irogers@google.com>,
	James Clark <james.clark@linaro.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	"Liang, Kan" <kan.liang@linux.intel.com>,
	John Garry <john.g.garry@oracle.com>,
	Will Deacon <will@kernel.org>,
	Mike Leach <mike.leach@linaro.org>,
	Graham Woodward <graham.woodward@arm.com>,
	Paschalis.Mpeis@arm.com,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Leo Yan <leo.yan@arm.com>
Subject: [PATCH v2 04/11] perf script: Add not taken event for branches
Date: Fri, 14 Feb 2025 11:19:29 +0000
Message-Id: <20250214111936.15168-5-leo.yan@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250214111936.15168-1-leo.yan@arm.com>
References: <20250214111936.15168-1-leo.yan@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_031958_471287_3640FFDD 
X-CRM114-Status: GOOD (  11.82  )
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

Some hardware (e.g., Arm SPE) can trace the not taken event for
branches.  Add a flag for this event and support printing it.

Reviewed-by: Ian Rogers <irogers@google.com>
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 tools/perf/util/event.h                 | 6 ++++--
 tools/perf/util/trace-event-scripting.c | 1 +
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/tools/perf/util/event.h b/tools/perf/util/event.h
index 962fbc1714cf..c7f4b4b841ca 100644
--- a/tools/perf/util/event.h
+++ b/tools/perf/util/event.h
@@ -67,9 +67,10 @@ enum {
 	PERF_IP_FLAG_INTR_DISABLE	= 1ULL << 13,
 	PERF_IP_FLAG_INTR_TOGGLE	= 1ULL << 14,
 	PERF_IP_FLAG_BRANCH_MISS	= 1ULL << 15,
+	PERF_IP_FLAG_NOT_TAKEN		= 1ULL << 16,
 };
 
-#define PERF_IP_FLAG_CHARS "bcrosyiABExghDtm"
+#define PERF_IP_FLAG_CHARS "bcrosyiABExghDtmn"
 
 #define PERF_ADDITIONAL_STATE_MASK	\
 	(PERF_IP_FLAG_IN_TX |		\
@@ -91,7 +92,8 @@ enum {
 	PERF_IP_FLAG_VMEXIT)
 
 #define PERF_IP_FLAG_BRACH_EVENT_MASK	\
-	PERF_IP_FLAG_BRANCH_MISS
+	(PERF_IP_FLAG_BRANCH_MISS |	\
+	 PERF_IP_FLAG_NOT_TAKEN)
 
 #define PERF_MEM_DATA_SRC_NONE \
 	(PERF_MEM_S(OP, NA) |\
diff --git a/tools/perf/util/trace-event-scripting.c b/tools/perf/util/trace-event-scripting.c
index 55d7e4e612d5..29cc467be14a 100644
--- a/tools/perf/util/trace-event-scripting.c
+++ b/tools/perf/util/trace-event-scripting.c
@@ -317,6 +317,7 @@ static const struct {
 	const char *name;
 } branch_events[] = {
 	{PERF_IP_FLAG_BRANCH_MISS, "miss"},
+	{PERF_IP_FLAG_NOT_TAKEN, "not_taken"},
 	{0, NULL}
 };
 
-- 
2.34.1


