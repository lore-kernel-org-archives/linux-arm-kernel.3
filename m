Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F4238C02192
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 12:24:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M60BvEOI5/f5gRbf+OvNSmrFwcMXCQ/p/I9ik81J6VA=; b=V+9CUmy7zG2EQNFXID8JDGbh4q
	Re648cRPTmLHoUWYE5I6SAXT1y7i5Xmz1U3u0Co5P7KJKBDUgRmEa/ztnKXz705rnkoQTbgz4817C
	+Ta+KU9ytK6QrGW1xglMdw4N8wrv4Agn4qHuUrf1bkMYo5sB9xjHRDM/bWLlnd+winEU3oa5oVe8n
	5qXSku2I/+PJPSENbs7XXkNBbb/bUeKieftYzTChJnB3SBk99PBA3Zoixxuj1si65DyXZraOnrpbd
	BcxgMqX/SQZTzuMPtd/20+I1ufkefB8yFb624WCdDhenGq5kaI/mEpxuHf1zoB2pvA1Qc7og9lwLo
	YFqXbuRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfeSI-00000003Bqt-3gfl;
	Wed, 05 Feb 2025 12:24:34 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfeKQ-000000039zz-2aFf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Feb 2025 12:16:27 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 580131515;
	Wed,  5 Feb 2025 04:16:47 -0800 (PST)
Received: from e132581.cambridge.arm.com (e132581.arm.com [10.2.76.71])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 500A73F63F;
	Wed,  5 Feb 2025 04:16:21 -0800 (PST)
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
Subject: [PATCH v1 05/11] perf script: Add not taken event for branch stack
Date: Wed,  5 Feb 2025 12:15:49 +0000
Message-Id: <20250205121555.180606-6-leo.yan@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250205121555.180606-1-leo.yan@arm.com>
References: <20250205121555.180606-1-leo.yan@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_041626_694572_7FDDC06B 
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

The branch stack has an existed field for printing mispredict, extend
the field for printing events and add support not-taken event.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 tools/perf/builtin-script.c | 20 +++++++++++++-------
 tools/perf/util/branch.h    |  3 ++-
 2 files changed, 15 insertions(+), 8 deletions(-)

diff --git a/tools/perf/builtin-script.c b/tools/perf/builtin-script.c
index e7f79a3f1fd2..5e1c9a803d66 100644
--- a/tools/perf/builtin-script.c
+++ b/tools/perf/builtin-script.c
@@ -929,19 +929,25 @@ static int perf_sample__fprintf_start(struct perf_script *script,
 	return printed;
 }
 
-static inline char
-mispred_str(struct branch_entry *br)
+static inline size_t
+bstack_event_str(struct branch_entry *br, char *buf, size_t sz)
 {
-	if (!(br->flags.mispred  || br->flags.predicted))
-		return '-';
+	if (!(br->flags.mispred || br->flags.predicted || br->flags.not_taken))
+		return snprintf(buf, sz, "-");
 
-	return br->flags.predicted ? 'P' : 'M';
+	return snprintf(buf, sz, "%s%s",
+			br->flags.predicted ? "P" : "M",
+			br->flags.not_taken ? "N" : "");
 }
 
 static int print_bstack_flags(FILE *fp, struct branch_entry *br)
 {
-	return fprintf(fp, "/%c/%c/%c/%d/%s/%s ",
-		       mispred_str(br),
+	char events[16] = { 0 };
+	size_t pos;
+
+	pos = bstack_event_str(br, events, sizeof(events));
+	return fprintf(fp, "/%s/%c/%c/%d/%s/%s ",
+		       pos < 0 ? "-" : events,
 		       br->flags.in_tx ? 'X' : '-',
 		       br->flags.abort ? 'A' : '-',
 		       br->flags.cycles,
diff --git a/tools/perf/util/branch.h b/tools/perf/util/branch.h
index b80c12c74bbb..99338f26f5e5 100644
--- a/tools/perf/util/branch.h
+++ b/tools/perf/util/branch.h
@@ -18,6 +18,7 @@ struct branch_flags {
 		struct {
 			u64 mispred:1;
 			u64 predicted:1;
+			u64 not_taken:1;
 			u64 in_tx:1;
 			u64 abort:1;
 			u64 cycles:16;
@@ -25,7 +26,7 @@ struct branch_flags {
 			u64 spec:2;
 			u64 new_type:4;
 			u64 priv:3;
-			u64 reserved:31;
+			u64 reserved:30;
 		};
 	};
 };
-- 
2.34.1


