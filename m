Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB673C021BE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 08:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Zqqn76tBcmgg67I26WGIeUiSFECu7h79iavy4/FuRVs=; b=t5IK33BIBIgeXqwyLu7YsUE6mp
	bjvhHziI+0SX7VRRr6klyTUCbZVfAc/WgyBzHuG5viNSccOUDetIc6b3IJ8kvA1UfJxAMc4ucgpZN
	FII9IL71jZH4SJHSMiVPzFk/DwVBjIzxOrARJ8EaNKKCggrlrVtLHtsT55xCwjMcku7FNwSkaLf/j
	mmOA8IbI0hYjlAkZLUaWP5S8FJ8kRnB1lc7rcgYXNzhESKuMGSB5eSlRcU1Ufwt129OmP0CR3RX1S
	SCyoPaMO3XhrExiCMBH080V08px3arMq7sworre4Dp2A9PGQH8omlo73S0pX6/sz4X7avmp9eYoXJ
	QpGqGl0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnZhz-00000006mmE-2asV;
	Thu, 27 Feb 2025 08:57:31 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnZgS-00000006mVY-1PM2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 08:55:57 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CE8102BCA;
	Thu, 27 Feb 2025 00:56:10 -0800 (PST)
Received: from e132581.cambridge.arm.com (e132581.arm.com [10.2.76.71])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 11EFD3F6A8;
	Thu, 27 Feb 2025 00:55:52 -0800 (PST)
From: Leo Yan <leo.yan@arm.com>
To: Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Will Deacon <will@kernel.org>,
	James Clark <james.clark@linaro.org>,
	Mike Leach <mike.leach@linaro.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	"Liang, Kan" <kan.liang@linux.intel.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Leo Yan <leo.yan@arm.com>
Subject: [PATCH v2] perf arm-spe: Report error if set frequency
Date: Thu, 27 Feb 2025 08:55:44 +0000
Message-Id: <20250227085544.2154136-1-leo.yan@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_005556_418419_CBA25320 
X-CRM114-Status: GOOD (  14.06  )
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

When users set the parameter '-F' to specify frequency for Arm SPE, the
tool reports error:

  perf record -F 1000 -e arm_spe_0// -- sleep 1
  Error:
  Invalid event (arm_spe_0//) in per-thread mode, enable system wide with '-a'.

The output logs are confused and it does not give the correct reminding.
Arm SPE does not support frequency setting given it adopts a statistical
based approach.

Alternatively, Arm SPE supports setting period.  This commit adds a
for frequency setting.  It reports error and reminds users to set period
instead.

After:

  perf record -F 1000 -e arm_spe_0// -- sleep 1
  Arm SPE: Frequency is not supported. Set period with -c option or PMU parameter (-e arm_spe_0/period=NUM/).

Signed-off-by: Leo Yan <leo.yan@arm.com>
---

Changes from v1:
- Sugguested users for '-c' option or PMU parameter 'period' in the log
  (Namhyung)

 tools/perf/arch/arm64/util/arm-spe.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/tools/perf/arch/arm64/util/arm-spe.c b/tools/perf/arch/arm64/util/arm-spe.c
index 4301181b8e45..4f2833b62ff5 100644
--- a/tools/perf/arch/arm64/util/arm-spe.c
+++ b/tools/perf/arch/arm64/util/arm-spe.c
@@ -40,6 +40,19 @@ struct arm_spe_recording {
 	bool			*wrapped;
 };
 
+/* Iterate config list to detect if the "freq" parameter is set */
+static bool arm_spe_is_set_freq(struct evsel *evsel)
+{
+	struct evsel_config_term *term;
+
+	list_for_each_entry(term, &evsel->config_terms, list) {
+		if (term->type == EVSEL__CONFIG_TERM_FREQ)
+			return true;
+	}
+
+	return false;
+}
+
 /*
  * arm_spe_find_cpus() returns a new cpu map, and the caller should invoke
  * perf_cpu_map__put() to release the map after use.
@@ -389,6 +402,14 @@ static int arm_spe_recording_options(struct auxtrace_record *itr,
 				return -EINVAL;
 			}
 			opts->full_auxtrace = true;
+
+			if (opts->user_freq != UINT_MAX ||
+			    arm_spe_is_set_freq(evsel)) {
+				pr_err("Arm SPE: Frequency is not supported. "
+				       "Set period with -c option or PMU parameter (-e %s/period=NUM/).\n",
+				       evsel->pmu->name);
+				return -EINVAL;
+			}
 		}
 	}
 
-- 
2.25.1


