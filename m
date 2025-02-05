Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66D60C02192
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 12:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7hIZT8m8tITmmkW/FupPXEh/qSc0/YdKRbhB8PlKUkY=; b=Vo9YULO/3piNNj2GYZPUJezOKV
	8R2mpM+9HQ7W1w0IHYgyFtH7MrDb94B2aEPeHaWWm93FTErGnhQNqEIonKTN7c1J7ng85qMHntudm
	7SALSh0eN0B76dQxhVxK9VUb4wXbAONX9PhbBnuz/nplOU2HmMwuUzVVXAj7HmmygozHlpyxb9OHI
	Pnz9tKlVjt+cdN2n8piGOBzv7ZXGtuQ1qsGk7mSqV5itB7YrEAHo8P4Yv2kDeCg2jT+dlDIWiGiZ/
	PyCEYXebvHk6iGsSjH5GackTqzrhxfrQc4s/KZiU+mCorx9qLhznFHkGyePGvuESjABNQoceNG59P
	6FJYUT0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfeMv-00000003AhB-3LkT;
	Wed, 05 Feb 2025 12:19:01 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfeKD-000000039wX-21uP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Feb 2025 12:16:14 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B3FDF11FB;
	Wed,  5 Feb 2025 04:16:36 -0800 (PST)
Received: from e132581.cambridge.arm.com (e132581.arm.com [10.2.76.71])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id ACABE3F63F;
	Wed,  5 Feb 2025 04:16:10 -0800 (PST)
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
Subject: [PATCH v1 01/11] perf script: Make printing flags reliable
Date: Wed,  5 Feb 2025 12:15:45 +0000
Message-Id: <20250205121555.180606-2-leo.yan@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250205121555.180606-1-leo.yan@arm.com>
References: <20250205121555.180606-1-leo.yan@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_041613_561141_44C0E92B 
X-CRM114-Status: GOOD (  12.39  )
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

In another case, if the string length is longer than the aligned size,
allow the completed string to be printed.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 tools/perf/builtin-script.c   | 10 ++++++++--
 tools/perf/util/trace-event.h |  2 ++
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/tools/perf/builtin-script.c b/tools/perf/builtin-script.c
index 33667b534634..e7f79a3f1fd2 100644
--- a/tools/perf/builtin-script.c
+++ b/tools/perf/builtin-script.c
@@ -1703,9 +1703,15 @@ static int perf_sample__fprintf_bts(struct perf_sample *sample,
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
+	ret = max(ret, SAMPLE_FLAGS_STR_ALIGNED_SIZE);
+	return fprintf(fp, "  %-*s ", ret, str);
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


