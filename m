Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85998C02192
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 12:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LwDx1Um4rB36eK7434KDwsGlcO9OTUtYN4hiTbu2N8s=; b=QHctwF+V2y9v4BRyOchoNGOrs3
	cmLGVbkS+ZqP0QMglQFuTr2OP+NjXeoqSUqTIn6BSuVf3yCyC9J9k8WR7vTHX+qtoUL9E3nvx9waf
	Z0jMrBu9myBzC1AwxXNJd4GeIhmFLlcxwHXJngDkmXrctWehrzPCBmULxyt7buaUhR6nmeWBVdtLi
	s75AGSyr3nXFIgEuaMXQKCJ7mBUj0YVusm/62J2a2ACYnCxg6FJUebWqiiI0WmJ1oIkyK2FlFDeip
	+VW9bd7g9hc3gS4FwitwJHRLFntEo/E5QsdLQ0dSn/7+rvuZDGg6pPis0BjYZG3Mhon45A0EnWzFs
	0l+R6nLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfeOH-00000003B02-21Vr;
	Wed, 05 Feb 2025 12:20:25 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfeKG-000000039xA-0CCu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Feb 2025 12:16:17 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5F9971007;
	Wed,  5 Feb 2025 04:16:39 -0800 (PST)
Received: from e132581.cambridge.arm.com (e132581.arm.com [10.2.76.71])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 589FF3F63F;
	Wed,  5 Feb 2025 04:16:13 -0800 (PST)
From: Leo Yan <leo.yan@arm.com>
To: Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	"Liang, Kan" <kan.liang@linux.intel.com>,
	John Garry <john.g.garry@oracle.com>,
	Will Deacon <will@kernel.org>,
	James Clark <james.clark@linaro.org>,
	Mike Leach <mike.leach@linaro.org>,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Graham Woodward <graham.woodward@arm.com>
Cc: Leo Yan <leo.yan@arm.com>
Subject: [PATCH v1 02/11] perf script: Refactor sample_flags_to_name() function
Date: Wed,  5 Feb 2025 12:15:46 +0000
Message-Id: <20250205121555.180606-3-leo.yan@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250205121555.180606-1-leo.yan@arm.com>
References: <20250205121555.180606-1-leo.yan@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_041616_183466_31008821 
X-CRM114-Status: GOOD (  19.36  )
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

When generating a string for sample flags, the sample_flags_to_name()
function lacks the ability to parse the trace start bit or trace end bit.
Therefore, the function is invoked multiple times after clearing its
unsupported bits.

This commit improves the sample_flags_to_name() function to parse sample
flags in one go for three kinds of information:
- The prefix info for trace start, trace end, etc.
- Branch types.
- Extra info for transaction and interrupt related info.

As a result, the code is simplified to call the sample_flags_to_name()
only once.  No expectation for any changes in the perf script output.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 tools/perf/util/event.h                 |  5 ++
 tools/perf/util/trace-event-scripting.c | 85 ++++++++++++++++---------
 2 files changed, 59 insertions(+), 31 deletions(-)

diff --git a/tools/perf/util/event.h b/tools/perf/util/event.h
index 2744c54f404e..cd75efc09834 100644
--- a/tools/perf/util/event.h
+++ b/tools/perf/util/event.h
@@ -71,6 +71,11 @@ enum {
 
 #define PERF_IP_FLAG_CHARS "bcrosyiABExghDt"
 
+#define PERF_ADDITIONAL_STATE_MASK	\
+	(PERF_IP_FLAG_IN_TX |		\
+	 PERF_IP_FLAG_INTR_DISABLE |	\
+	 PERF_IP_FLAG_INTR_TOGGLE)
+
 #define PERF_BRANCH_MASK		(\
 	PERF_IP_FLAG_BRANCH		|\
 	PERF_IP_FLAG_CALL		|\
diff --git a/tools/perf/util/trace-event-scripting.c b/tools/perf/util/trace-event-scripting.c
index 4e81e02a4f18..712ba3a51bbe 100644
--- a/tools/perf/util/trace-event-scripting.c
+++ b/tools/perf/util/trace-event-scripting.c
@@ -313,49 +313,72 @@ static const struct {
 	{0, NULL}
 };
 
-static const char *sample_flags_to_name(u32 flags)
+static int sample_flags_to_name(u32 flags, char *str, size_t size)
 {
 	int i;
-
-	for (i = 0; sample_flags[i].name ; i++) {
-		if (sample_flags[i].flags == flags)
-			return sample_flags[i].name;
+	const char *prefix;
+	int pos = 0, ret;
+	u32 xf = flags & PERF_ADDITIONAL_STATE_MASK;
+	char xs[16] = { 0 };
+
+	/* Clear additional state bits */
+	flags &= ~PERF_ADDITIONAL_STATE_MASK;
+
+	if (flags & PERF_IP_FLAG_TRACE_BEGIN)
+		prefix = "tr strt ";
+	else if (flags & PERF_IP_FLAG_TRACE_END)
+		prefix = "tr end  ";
+	else
+		prefix = "";
+
+	ret = snprintf(str + pos, size - pos, "%s", prefix);
+	if (ret < 0)
+		return ret;
+	pos += ret;
+
+	flags &= ~(PERF_IP_FLAG_TRACE_BEGIN | PERF_IP_FLAG_TRACE_END);
+
+	for (i = 0; sample_flags[i].name; i++) {
+		if (sample_flags[i].flags != flags)
+			continue;
+
+		ret = snprintf(str + pos, size - pos, "%s", sample_flags[i].name);
+		if (ret < 0)
+			return ret;
+		pos += ret;
+		break;
 	}
 
-	return NULL;
+	if (!xf)
+		return pos;
+
+	snprintf(xs, sizeof(xs), "(%s%s%s)",
+		 flags & PERF_IP_FLAG_IN_TX ? "x" : "",
+		 flags & PERF_IP_FLAG_INTR_DISABLE ? "D" : "",
+		 flags & PERF_IP_FLAG_INTR_TOGGLE ? "t" : "");
+
+	/* Right align the string if its length is less than the limit */
+	if ((pos + strlen(xs)) < SAMPLE_FLAGS_STR_ALIGNED_SIZE)
+		ret = snprintf(str + pos, size - pos, "%*s",
+			       (int)(SAMPLE_FLAGS_STR_ALIGNED_SIZE - ret), xs);
+	else
+		ret = snprintf(str + pos, size - pos, " %s", xs);
+	if (ret < 0)
+		return ret;
+
+	return pos + ret;
 }
 
 int perf_sample__sprintf_flags(u32 flags, char *str, size_t sz)
 {
-	u32 xf = PERF_IP_FLAG_IN_TX | PERF_IP_FLAG_INTR_DISABLE |
-		 PERF_IP_FLAG_INTR_TOGGLE;
 	const char *chars = PERF_IP_FLAG_CHARS;
 	const size_t n = strlen(PERF_IP_FLAG_CHARS);
-	const char *name = NULL;
 	size_t i, pos = 0;
-	char xs[16] = {0};
-
-	if (flags & xf)
-		snprintf(xs, sizeof(xs), "(%s%s%s)",
-			 flags & PERF_IP_FLAG_IN_TX ? "x" : "",
-			 flags & PERF_IP_FLAG_INTR_DISABLE ? "D" : "",
-			 flags & PERF_IP_FLAG_INTR_TOGGLE ? "t" : "");
-
-	name = sample_flags_to_name(flags & ~xf);
-	if (name)
-		return snprintf(str, sz, "%-15s%6s", name, xs);
-
-	if (flags & PERF_IP_FLAG_TRACE_BEGIN) {
-		name = sample_flags_to_name(flags & ~(xf | PERF_IP_FLAG_TRACE_BEGIN));
-		if (name)
-			return snprintf(str, sz, "tr strt %-7s%6s", name, xs);
-	}
+	int ret;
 
-	if (flags & PERF_IP_FLAG_TRACE_END) {
-		name = sample_flags_to_name(flags & ~(xf | PERF_IP_FLAG_TRACE_END));
-		if (name)
-			return snprintf(str, sz, "tr end  %-7s%6s", name, xs);
-	}
+	ret = sample_flags_to_name(flags, str, sz);
+	if (ret > 0)
+		return ret;
 
 	for (i = 0; i < n; i++, flags >>= 1) {
 		if ((flags & 1) && pos < sz)
-- 
2.34.1


