Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA074C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 12:09:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DovHiFkS365bHoIydr70YQBU31NNAZaaV/7cicQP0YI=; b=v2dW5uzmsKihLDavQQtbrSplJN
	wcID0O8Uowh0aqATpyaLpNO7vUylGttn2m0Sgo0yeiZ20sFrwuxlz9F/zMtUgnQAt+gzIQcqN0SRv
	p3bjhm+JWsYJ+rGZ+J+DpxAwUkqVBUMUI0i5mvQQiOif5bSbZGGwyLDFnQBgZQuF+GpJK61pLkW/W
	2tbQStEK2FMz5Z1LsBlqnMBe92bWHLVxw45aJgkSh1PKcJB+fvFKxpQYOP5FPnUPPVXaw3gYyOQ1N
	6nbtDSubWAAQxYjntZ+SYWZBzNcdG7aNItUuBfGHxjPQGLd3vjiwvl9NpMjLifU0bww0hDjdibjLd
	T0ZO0WLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpR5G-00000004XMo-2Krj;
	Tue, 04 Mar 2025 12:09:14 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpQCn-00000004LxF-3q6y
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 11:12:59 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 00D51FEC;
	Tue,  4 Mar 2025 03:13:11 -0800 (PST)
Received: from e132581.cambridge.arm.com (e132581.arm.com [10.2.76.71])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 004A83F5A1;
	Tue,  4 Mar 2025 03:12:54 -0800 (PST)
From: Leo Yan <leo.yan@arm.com>
To: Arnaldo Carvalho de Melo <acme@kernel.org>,
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
	Paschalis.Mpeis@arm.com,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Leo Yan <leo.yan@arm.com>
Subject: [PATCH v4 03/12] perf script: Separate events from branch types
Date: Tue,  4 Mar 2025 11:12:31 +0000
Message-Id: <20250304111240.3378214-4-leo.yan@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250304111240.3378214-1-leo.yan@arm.com>
References: <20250304111240.3378214-1-leo.yan@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_031258_084132_A7414977 
X-CRM114-Status: GOOD (  18.44  )
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

Branch types and events are two different things.  A branch type can be
a conditional branch, an indirect branch, a procedure call, a return, or
an exception taken, etc.  The extra event information is provided for
what happens during a branch, e.g. if a branch is mispredicted or not
taken (specific to conditional branches).

To deliver information about branches, this commit separates events from
branch types.  It parses branch types first, then appends event strings
embraced by the '/' character.  If multiple events occur, the events is
separated with a comma (,).

Also add a minor improvement by adding char 'm' in char array for branch
mispredict event.

Below are extracted sample flags.

Before:
        branch:   br miss
  instructions:   br miss

After:
        branch:   jmp/miss/
  instructions:   jmp/miss/

Reviewed-by: Ian Rogers <irogers@google.com>
Reviewed-by: James Clark <james.clark@linaro.org>
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 tools/perf/util/event.h                 |  5 +++-
 tools/perf/util/trace-event-scripting.c | 36 ++++++++++++++++++++++---
 2 files changed, 37 insertions(+), 4 deletions(-)

diff --git a/tools/perf/util/event.h b/tools/perf/util/event.h
index cd75efc09834..962fbc1714cf 100644
--- a/tools/perf/util/event.h
+++ b/tools/perf/util/event.h
@@ -69,7 +69,7 @@ enum {
 	PERF_IP_FLAG_BRANCH_MISS	= 1ULL << 15,
 };
 
-#define PERF_IP_FLAG_CHARS "bcrosyiABExghDt"
+#define PERF_IP_FLAG_CHARS "bcrosyiABExghDtm"
 
 #define PERF_ADDITIONAL_STATE_MASK	\
 	(PERF_IP_FLAG_IN_TX |		\
@@ -90,6 +90,9 @@ enum {
 	PERF_IP_FLAG_VMENTRY		|\
 	PERF_IP_FLAG_VMEXIT)
 
+#define PERF_IP_FLAG_BRACH_EVENT_MASK	\
+	PERF_IP_FLAG_BRANCH_MISS
+
 #define PERF_MEM_DATA_SRC_NONE \
 	(PERF_MEM_S(OP, NA) |\
 	 PERF_MEM_S(LVL, NA) |\
diff --git a/tools/perf/util/trace-event-scripting.c b/tools/perf/util/trace-event-scripting.c
index 712ba3a51bbe..55d7e4e612d5 100644
--- a/tools/perf/util/trace-event-scripting.c
+++ b/tools/perf/util/trace-event-scripting.c
@@ -309,7 +309,14 @@ static const struct {
 	{PERF_IP_FLAG_BRANCH | PERF_IP_FLAG_TRACE_END, "tr end"},
 	{PERF_IP_FLAG_BRANCH | PERF_IP_FLAG_CALL | PERF_IP_FLAG_VMENTRY, "vmentry"},
 	{PERF_IP_FLAG_BRANCH | PERF_IP_FLAG_CALL | PERF_IP_FLAG_VMEXIT, "vmexit"},
-	{PERF_IP_FLAG_BRANCH | PERF_IP_FLAG_BRANCH_MISS, "br miss"},
+	{0, NULL}
+};
+
+static const struct {
+	u32 flags;
+	const char *name;
+} branch_events[] = {
+	{PERF_IP_FLAG_BRANCH_MISS, "miss"},
 	{0, NULL}
 };
 
@@ -317,8 +324,9 @@ static int sample_flags_to_name(u32 flags, char *str, size_t size)
 {
 	int i;
 	const char *prefix;
-	int pos = 0, ret;
+	int pos = 0, ret, ev_idx = 0;
 	u32 xf = flags & PERF_ADDITIONAL_STATE_MASK;
+	u32 types, events;
 	char xs[16] = { 0 };
 
 	/* Clear additional state bits */
@@ -338,8 +346,9 @@ static int sample_flags_to_name(u32 flags, char *str, size_t size)
 
 	flags &= ~(PERF_IP_FLAG_TRACE_BEGIN | PERF_IP_FLAG_TRACE_END);
 
+	types = flags & ~PERF_IP_FLAG_BRACH_EVENT_MASK;
 	for (i = 0; sample_flags[i].name; i++) {
-		if (sample_flags[i].flags != flags)
+		if (sample_flags[i].flags != types)
 			continue;
 
 		ret = snprintf(str + pos, size - pos, "%s", sample_flags[i].name);
@@ -349,6 +358,27 @@ static int sample_flags_to_name(u32 flags, char *str, size_t size)
 		break;
 	}
 
+	events = flags & PERF_IP_FLAG_BRACH_EVENT_MASK;
+	for (i = 0; branch_events[i].name; i++) {
+		if (!(branch_events[i].flags & events))
+			continue;
+
+		ret = snprintf(str + pos, size - pos, !ev_idx ? "/%s" : ",%s",
+			       branch_events[i].name);
+		if (ret < 0)
+			return ret;
+		pos += ret;
+		ev_idx++;
+	}
+
+	/* Add an end character '/' for events */
+	if (ev_idx) {
+		ret = snprintf(str + pos, size - pos, "/");
+		if (ret < 0)
+			return ret;
+		pos += ret;
+	}
+
 	if (!xf)
 		return pos;
 
-- 
2.34.1


