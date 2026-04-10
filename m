Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18068F364DB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 11:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=A6RQ1iN4kZujA3tCfjxC7Q5lmyqTavIYDLPFwYDheVU=; b=QSrTLcnFsCmT+rXCUEVxxD7fnR
	iFE+gnJ1fUDTmOVpOZebHy6ByUyBNpJ98lA9L5Zw/9S4gRwes15B1Fbp4kmK2HRsGensWKCUpFQl3
	3Jvym15QbbLSbVujajb+Nhpg1ewR46mj38TRLboWSHqGOOqLNdLumFcH6a2t9dEa2NtUCc/Fpinxp
	JTw3JThd7NyLWCW2TSe2oaUAfmZSy0fWpmH6oj0hwLDSWddglA+777y/U+h+8PgmUPUqgqk4XrhiW
	zsm/ElLrNuhphWfIGallrBaZ1ymonXC1wOn+dKNE0EEsJOTGToFwlAHBQZL0ey+shPM5iC9jr0UsO
	e2rAxMCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB9g1-0000000C3Te-2zrc;
	Fri, 10 Apr 2026 11:05:29 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB9g0-0000000C3TG-0MgC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Apr 2026 11:05:29 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-43cf906b007so1187171f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Apr 2026 04:05:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775819126; x=1776423926; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=A6RQ1iN4kZujA3tCfjxC7Q5lmyqTavIYDLPFwYDheVU=;
        b=OXhiXvMNcmIW4jkQp9HemWSLCi0F7uOP96VR1foGs6glPASTJ8wkVbfHD7H844e0g/
         ASCalWUnLsrW+N11WbQMwlAso+ZlGFmpk+sNQIw5H+W6edXn7ILXcBJBKXgGy2hpA6a3
         WnBQt89UsMsFXospCKq6LgUGpwtYdMHR4QNwEhjAkwHuDIfWAPICuhPIo/2K2hHSgP8B
         dlNsSGsBgpAO31Ji19gncRfvgit7+Ex7Q/wFjdaQ+t703QzFtYvwI5Y9OGrij+z74+a6
         +aazO7b0EoQ+o/FmW34rXrn1WZtLL4gKO3EqpCmepgdHuV4RMkDhHN8AIVjJR+d/BQiC
         DqtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775819126; x=1776423926;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A6RQ1iN4kZujA3tCfjxC7Q5lmyqTavIYDLPFwYDheVU=;
        b=PsPywTHVSpppmZhu82If2APCvt/JfNpFeJegZ71pMXUV4LAV8QyLQQwHm8dC1BTUc0
         HPd/ZpUD6cQjbNgr75F8coxYtaRBg7xtGDbEJGO/gOaEgk1gxffj7+GNK+T92jC+NipL
         jarPIwyGDLMBMySpWJ6ETSw4hSpemD/y6L8RE11HS03gge7aAbp6JZGnAofDw/YF5Bbe
         /QaeT9GCLzF6UytH1M2TRPFy/a97R1oIadp1IdWYL7NVZcqHJXmQio6cwgBtaATWTVYW
         GNUK8MJj+ho7zyORQDT/aG8WaAZFvza6jKrlKRK1cyLCe72HudzaaiNQ/m3RzevnvMSm
         vwtg==
X-Gm-Message-State: AOJu0YylaNwMeg/6s5HcDTxpGRC0GMtf7781cAl66GOXwjVnWFlLkm2i
	oBkrl4DKYqm4gXHJvCLuo7UbMX8+Z7u6x92c6rA/4w6H4ROAnPHTECHpIDunjN8fZz8=
X-Gm-Gg: AeBDieut6T28MSU/zT9urDQ7Y4k33joomKHbCdiKv1pRTGqAnhZreFRyOOJ+Csw1D7k
	TIHThNmUjuNn7Qhk5esEXubi0ljpBRtxdMMNLxGgKKnOzDM0R3NV2Qx3OYohx/I5fMPCJHc43Ei
	Qd/hojGMUBZGuIbaFDEtk70G0T/l133ZoPR+qWlsOcz2UDakmk7O1U+wWRdRmAwLgtlDShS5Tke
	oVTDbz6N9HkY5F6t0hN7fCMY20nF7L2Hx8yytts/ZhaWfoOCrQTcD+s4XjndBQE8kbEJ9VHh7xP
	B92DhFvybEekQbg3h5keQiKOfRGNZ+rAVyYWPnY2rwFcPZTyznnQspCf3V4ptM58VODq6oHTftp
	GQYK8JOIC+yJ2j7X9i8tMC2aPlxPNNjbC07Gtidmgzf7ZhfXw4LAa8TfFn2StlDAF4csCdogLhA
	T8Bnsv20qHgEYdF0HSJwm6VVwOUwxY1x6E
X-Received: by 2002:a5d:5d83:0:b0:43d:30af:a173 with SMTP id ffacd0b85a97d-43d64259b7emr3790576f8f.5.1775819125672;
        Fri, 10 Apr 2026 04:05:25 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63e5ccdasm6896930f8f.34.2026.04.10.04.05.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 04:05:25 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Fri, 10 Apr 2026 12:05:12 +0100
Subject: [PATCH] perf arm-spe: Don't warn about the discard bit if it
 doesn't exist
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260410-james-spe-discard-warning-v1-1-985c02756ee4@linaro.org>
X-B4-Tracking: v=1; b=H4sIAGfZ2GkC/x3MTQqDQAxA4atI1gbGqT+0VxEX6UzUCJ1KAlaQu
 btDl9/ivQuMVdjgVV2gfIjJNxU0dQVhpbQwSiwG73zv2sbhRh82tJ0xigXSiD/SJGlB1z7ffqD
 uQRSg9LvyLOf/PU453y4G0kJrAAAA
To: John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>, 
 Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>, 
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
 linux-kernel@vger.kernel.org, James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_040528_166911_17DFD5B2 
X-CRM114-Status: GOOD (  18.79  )
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

Opening an SPE event shows a warning that doesn't concern the user:

  $ perf record -e arm_spe
  Unknown/empty format name: discard

Perf only wants to know if the discard bit is set for configuring the
event, not in response to anything the user has done. Fix it by adding
another helper that returns if a config bit exists without warning.

We should probably keep the warning in evsel__get_config_val() to avoid
having every caller having to do it, and most format bits should never
be missing.

Add a test for the new helper. Rename the parent test function to be
more generic rather than adding a new one as it requires a lot of
boilerplate.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/arch/arm64/util/arm-spe.c |  3 ++-
 tools/perf/tests/pmu.c               | 11 +++++++++--
 tools/perf/util/evsel.c              |  6 ++++++
 tools/perf/util/evsel.h              |  1 +
 4 files changed, 18 insertions(+), 3 deletions(-)

diff --git a/tools/perf/arch/arm64/util/arm-spe.c b/tools/perf/arch/arm64/util/arm-spe.c
index f00d72d087fc..91bb28cad79a 100644
--- a/tools/perf/arch/arm64/util/arm-spe.c
+++ b/tools/perf/arch/arm64/util/arm-spe.c
@@ -428,7 +428,8 @@ static int arm_spe_recording_options(struct auxtrace_record *itr,
 	evlist__for_each_entry_safe(evlist, tmp, evsel) {
 		if (evsel__is_aux_event(evsel)) {
 			arm_spe_setup_evsel(evsel, cpus);
-			if (!evsel__get_config_val(evsel, "discard", &discard_bit))
+			if (evsel__config_exists(evsel, "discard") &&
+			    !evsel__get_config_val(evsel, "discard", &discard_bit))
 				discard = !!discard_bit;
 		}
 	}
diff --git a/tools/perf/tests/pmu.c b/tools/perf/tests/pmu.c
index 0ebf2d7b2cb4..d7be9d1c6f52 100644
--- a/tools/perf/tests/pmu.c
+++ b/tools/perf/tests/pmu.c
@@ -201,7 +201,8 @@ static int test__pmu_format(struct test_suite *test __maybe_unused, int subtest
 	return ret;
 }
 
-static int test__pmu_usr_chgs(struct test_suite *test __maybe_unused, int subtest __maybe_unused)
+static int test__pmu_config_helpers(struct test_suite *test __maybe_unused,
+				    int subtest __maybe_unused)
 {
 	const char *event = "perf-pmu-test/config=15,config1=4,krava02=170,"
 			    "krava03=1,krava11=27,krava12=1/";
@@ -236,6 +237,12 @@ static int test__pmu_usr_chgs(struct test_suite *test __maybe_unused, int subtes
 	}
 	evsel = evlist__first(evlist);
 
+	/* Test evsel__config_exists() */
+	TEST_ASSERT_EQUAL("krava01 should exist",
+			  evsel__config_exists(evsel, "krava01"), true);
+	TEST_ASSERT_EQUAL("krava99 should not exist",
+			  evsel__config_exists(evsel, "krava99"), false);
+
 	/*
 	 * Set via config=15, krava01 bits 0-1
 	 * Set via config1=4, krava11 bit 1
@@ -629,7 +636,7 @@ static struct test_case tests__pmu[] = {
 	TEST_CASE("PMU name combining", name_len),
 	TEST_CASE("PMU name comparison", name_cmp),
 	TEST_CASE("PMU cmdline match", pmu_match),
-	TEST_CASE("PMU user config changes", pmu_usr_chgs),
+	TEST_CASE("PMU config helpers", pmu_config_helpers),
 	{	.name = NULL, }
 };
 
diff --git a/tools/perf/util/evsel.c b/tools/perf/util/evsel.c
index 2ee87fd84d3e..685c4118aef3 100644
--- a/tools/perf/util/evsel.c
+++ b/tools/perf/util/evsel.c
@@ -1396,6 +1396,12 @@ void evsel__set_config_if_unset(struct evsel *evsel, const char *config_name,
 	perf_pmu__format_pack(format->bits, val, vp, /*zero=*/true);
 }
 
+bool evsel__config_exists(const struct evsel *evsel, const char *config_name)
+{
+	struct perf_pmu_format *format = pmu_find_format(&evsel->pmu->format, config_name);
+
+	return format && !bitmap_empty(format->bits, PERF_PMU_FORMAT_BITS);
+}
 
 int evsel__get_config_val(const struct evsel *evsel, const char *config_name,
 			  u64 *val)
diff --git a/tools/perf/util/evsel.h b/tools/perf/util/evsel.h
index 339b5c08a33d..a255ae2b1f8e 100644
--- a/tools/perf/util/evsel.h
+++ b/tools/perf/util/evsel.h
@@ -578,6 +578,7 @@ void evsel__uniquify_counter(struct evsel *counter);
 	((((src) >> (pos)) & ((1ull << (size)) - 1)) << (63 - ((pos) + (size) - 1)))
 
 u64 evsel__bitfield_swap_branch_flags(u64 value);
+bool evsel__config_exists(const struct evsel *evsel, const char *config_name);
 int evsel__get_config_val(const struct evsel *evsel, const char *config_name,
 			  u64 *val);
 void evsel__set_config_if_unset(struct evsel *evsel, const char *config_name,

---
base-commit: 4cf1f549bbcdfea9c20df52994bb342677472dcd
change-id: 20260410-james-spe-discard-warning-049b27a53aac

Best regards,
-- 
James Clark <james.clark@linaro.org>


