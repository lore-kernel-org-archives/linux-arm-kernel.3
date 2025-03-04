Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 988C5C282D0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 12:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z40ANOOvfd3P4W2X49S7Iv8QvMAFYNCvVTkNIaFhhUQ=; b=AxntZZXLw7gJ10gQHv2rKeLYK+
	s0egXLa0Oar8QXUlbR6thFLmM6glKeoXRUUrq2Ct339dRbWKKqtdedAhziir4BRwF+dw6gDUD841r
	tBwU6ZaN/CGwDISMvYtzUEatblb5QyoVH4Le+ywwut4PNbIXJW6hVdm7a6ujWDV+YZsAV1AnS9qUu
	isn/uWz3Iqz+URn1za5BbExL8mtAgW7BbbZPRh5unSfUlvWlYQZ3ZXgtWp3vNYKtse/tA4SWlHPi6
	AffwIr3AS5gZHn+YdHQTEkw6fU6YP/8WhlGN4FApRi8UOLug6x2nibYazcfBYtlNFQLwlwyTMw9kV
	n6W6CIDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpR5M-00000004XYy-2fwK;
	Tue, 04 Mar 2025 12:09:20 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpQCs-00000004Lyu-2v6r
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 11:13:03 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1AE69FEC;
	Tue,  4 Mar 2025 03:13:16 -0800 (PST)
Received: from e132581.cambridge.arm.com (e132581.arm.com [10.2.76.71])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0E0093F5A1;
	Tue,  4 Mar 2025 03:12:59 -0800 (PST)
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
Subject: [PATCH v4 05/12] perf script: Add not taken event for branch stack
Date: Tue,  4 Mar 2025 11:12:33 +0000
Message-Id: <20250304111240.3378214-6-leo.yan@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250304111240.3378214-1-leo.yan@arm.com>
References: <20250304111240.3378214-1-leo.yan@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_031302_786482_AC762718 
X-CRM114-Status: GOOD (  11.42  )
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

Reviewed-by: Ian Rogers <irogers@google.com>
Reviewed-by: James Clark <james.clark@linaro.org>
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 tools/perf/builtin-script.c | 20 +++++++++++++-------
 tools/perf/util/branch.h    |  3 ++-
 2 files changed, 15 insertions(+), 8 deletions(-)

diff --git a/tools/perf/builtin-script.c b/tools/perf/builtin-script.c
index 8ca04293d335..d931c971a100 100644
--- a/tools/perf/builtin-script.c
+++ b/tools/perf/builtin-script.c
@@ -935,19 +935,25 @@ static int perf_sample__fprintf_start(struct perf_script *script,
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
index b80c12c74bbb..7429530fa774 100644
--- a/tools/perf/util/branch.h
+++ b/tools/perf/util/branch.h
@@ -25,7 +25,8 @@ struct branch_flags {
 			u64 spec:2;
 			u64 new_type:4;
 			u64 priv:3;
-			u64 reserved:31;
+			u64 not_taken:1;
+			u64 reserved:30;
 		};
 	};
 };
-- 
2.34.1


