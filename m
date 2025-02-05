Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE4E0C02192
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 18:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BTF7zivQO57Zz+4eXfVQ6YOQEXOlt3ajf2OeasH6ni0=; b=zkLp3SOeUueOMalhgQbi/JQOn3
	idDlx2HqgiTCS2zSSdL5jXfSlNGwTO4d4BnQRwx1ihm/BsRBkqMBrVWUDi8pFM56OiEH0JL0meEaz
	gT9Z3mQYMrAcEJjHMU7sFRCuSMEqVU5lHfQkknxvp0tiFgYLfDtIJ+udp+srTDTTeVbOw0F5hRO4p
	aJu0+LRwo5KcrbPgZPcJ8IW4+RHQehumazNZydGmCGWV1x0fFjwurr2HGYEMXylBwGbwu+ItNR82B
	FOT4S+arTMVLbfTQhhEMlpJPlxAl1QCUuJbMUe98o8DQBH/kNTy4LEz/0MsACWKVP4zWp641wDG4R
	8bhG2hfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfkML-00000004Imd-1UFK;
	Wed, 05 Feb 2025 18:42:49 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfkAI-00000004GYo-0Iy4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Feb 2025 18:30:23 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B62981063;
	Wed,  5 Feb 2025 10:30:44 -0800 (PST)
Received: from e132581.cambridge.arm.com (e132581.arm.com [10.2.76.71])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 48C4E3F58B;
	Wed,  5 Feb 2025 10:30:19 -0800 (PST)
From: Leo Yan <leo.yan@arm.com>
To: Arnaldo Carvalho de Melo <acme@kernel.org>,
	James Clark <james.clark@linaro.org>,
	Namhyung Kim <namhyung@kernel.org>,
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
Subject: [PATCH] perf arm-spe: Report error if set frequency
Date: Wed,  5 Feb 2025 18:30:09 +0000
Message-Id: <20250205183009.224182-1-leo.yan@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_103022_154361_B5504D7A 
X-CRM114-Status: GOOD (  13.61  )
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

  perf record -F 100 -e arm_spe_0// -- sleep 1
  Arm SPE: Frequency is not supported. Check manual 'man perf-record' on how to set period.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 tools/perf/arch/arm64/util/arm-spe.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/tools/perf/arch/arm64/util/arm-spe.c b/tools/perf/arch/arm64/util/arm-spe.c
index 4301181b8e45..baef0812dc19 100644
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
@@ -389,6 +402,13 @@ static int arm_spe_recording_options(struct auxtrace_record *itr,
 				return -EINVAL;
 			}
 			opts->full_auxtrace = true;
+
+			if (opts->user_freq != UINT_MAX ||
+			    arm_spe_is_set_freq(evsel)) {
+				pr_err("Arm SPE: Frequency is not supported. "
+				       "Check manual 'man perf-record' on how to set period.\n");
+				return -EINVAL;
+			}
 		}
 	}
 
-- 
2.34.1


