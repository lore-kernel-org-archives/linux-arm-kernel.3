Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 399CDC021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 12:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SHolxYz6QTQ1HHsagx2gHyL4kwCqSTdY5QunOAlDGzM=; b=HT5JyRtyhvaHRdcI/LTAcHm1Ns
	6PO+AmlT8NBk+MKKDn4yi5cHLc312TdmSwdROj1SB9wgCMvWb0PzVbW7ZXccobyol+gHC6aNe4CaP
	rjkUj7o+ZUVkuqSZdgTjaDgIN8DT8YFA1t7TioGzoKShItirBhz5yzoIvre5ExRC5afSc54wYqRY6
	+fD8JRDNcLu4wtQgk9S2U4wzNu7L4CI8IeH/iNnhkRyj5JYnWd3f/E29BBVvPOYDJQpuun7+9oqGa
	EtcZPerGKNigMkltU5EsyXRXvtz4p1olDlQ1n2rWImcmhBBHxYBgm6tEDFxbYiluywlyUoJ7oaSQl
	jw8Bq2/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpR5D-00000004XH1-1O5S;
	Tue, 04 Mar 2025 12:09:11 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpQCk-00000004LvV-2Zcv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 11:12:55 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E12341007;
	Tue,  4 Mar 2025 03:13:05 -0800 (PST)
Received: from e132581.cambridge.arm.com (e132581.arm.com [10.2.76.71])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E52A83F5A1;
	Tue,  4 Mar 2025 03:12:49 -0800 (PST)
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
Subject: [PATCH v4 01/12] perf script: Make printing flags reliable
Date: Tue,  4 Mar 2025 11:12:29 +0000
Message-Id: <20250304111240.3378214-2-leo.yan@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250304111240.3378214-1-leo.yan@arm.com>
References: <20250304111240.3378214-1-leo.yan@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_031254_696750_9EC177CF 
X-CRM114-Status: GOOD (  11.74  )
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

Add a check for the generated string of flags.  Print out the raw number
if the string generation fails.

Use the SAMPLE_FLAGS_STR_ALIGNED_SIZE macro to replace the value '21'.

Reviewed-by: Ian Rogers <irogers@google.com>
Reviewed-by: James Clark <james.clark@linaro.org>
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 tools/perf/builtin-script.c   | 9 +++++++--
 tools/perf/util/trace-event.h | 2 ++
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/tools/perf/builtin-script.c b/tools/perf/builtin-script.c
index d797cec4f054..8ca04293d335 100644
--- a/tools/perf/builtin-script.c
+++ b/tools/perf/builtin-script.c
@@ -1709,9 +1709,14 @@ static int perf_sample__fprintf_bts(struct perf_sample *sample,
 static int perf_sample__fprintf_flags(u32 flags, FILE *fp)
 {
 	char str[SAMPLE_FLAGS_BUF_SIZE];
+	int ret;
+
+	ret = perf_sample__sprintf_flags(flags, str, sizeof(str));
+	if (ret < 0)
+		return fprintf(fp, "  raw flags:0x%-*x ",
+			       SAMPLE_FLAGS_STR_ALIGNED_SIZE - 12, flags);
 
-	perf_sample__sprintf_flags(flags, str, sizeof(str));
-	return fprintf(fp, "  %-21s ", str);
+	return fprintf(fp, "  %-*s ", SAMPLE_FLAGS_STR_ALIGNED_SIZE, str);
 }
 
 struct printer_data {
diff --git a/tools/perf/util/trace-event.h b/tools/perf/util/trace-event.h
index ac9fde2f980c..71e680bc3d4b 100644
--- a/tools/perf/util/trace-event.h
+++ b/tools/perf/util/trace-event.h
@@ -145,6 +145,8 @@ int common_flags(struct scripting_context *context);
 int common_lock_depth(struct scripting_context *context);
 
 #define SAMPLE_FLAGS_BUF_SIZE 64
+#define SAMPLE_FLAGS_STR_ALIGNED_SIZE	21
+
 int perf_sample__sprintf_flags(u32 flags, char *str, size_t sz);
 
 #if defined(LIBTRACEEVENT_VERSION) &&  LIBTRACEEVENT_VERSION >= MAKE_LIBTRACEEVENT_VERSION(1, 5, 0)
-- 
2.34.1


