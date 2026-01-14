Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08F4ED37E5F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 15:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i4eLrNTmJYNZqrOFXMkgnCrs/v9XFpKSoUUWAD+1qM0=; b=TrW9RN93KmoJJ4ai/w5hFzOB5t
	iAiTB9Ne7rdj73Wj7sPACGssxnX+eRvH2oC3/MntI0Z4POb64UvOXCJfBwAGHghhRLHhmXwuVL7fN
	nYT2z9ZIgtRGu0EIsZToO/dUYKn0aNGZmyZO+duF4/9yD5g8g4TMeuk8Qiep9NW1NBiaQth+/j8ry
	GK2XpOPY2CKG1bRQTJrdyOQzLWxjc+dvzcbRr3JGXJtm7VkodkpKM7FTHYu0Z2vdp0Tk+Vp6acwif
	B9G6JUOLNmdCeC1BWPmA8OkaoX63F3W8y8U9MlhX7t+RxDSfesKhgz+f4uEp04vyzkTNM96yTe5Ky
	2Fq1B+fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg3Fw-00000009oKM-40RP;
	Wed, 14 Jan 2026 15:58:01 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg3Fm-00000009o8I-1zb0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 15:57:51 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-47edd6111b4so16197125e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Jan 2026 07:57:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768406269; x=1769011069; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i4eLrNTmJYNZqrOFXMkgnCrs/v9XFpKSoUUWAD+1qM0=;
        b=A4ImrDVUtdWchOYFy+NpOYT1RBMiV+BBwyz5UXTWCdvX0SOXlbdyV6hJQMo6oNQRZC
         SLG3c8MkTK3OF7BnCFXt+zzmZXEuPxzwIQjUHOWrMpBUTuIArKo7wEW3UyOcv8z+nCFz
         oI3LwfwE3QM0hgAniXOb99aYz6U8bfnPsR5pCc7JCs4H0izSXQFrYaT6N43OFtUWLUUw
         nQRv3wP/6IdbPrmjVGiinbJFWgMaoNcDatO3al3C4G7TSKTVnQRCQr2YMs8DBRKoJfyx
         wOW3VGdYwFudUe5bjIY6n8HuqeMHhiQbo0SzNtHvZmtC/79ZT6ijRhQQ22As2NcDMQZg
         jMJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768406269; x=1769011069;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=i4eLrNTmJYNZqrOFXMkgnCrs/v9XFpKSoUUWAD+1qM0=;
        b=jLGOY9fRtoLI5tj1YKXB+9w5iL4CcyJulJ9ICxJPyQxlQlKp5MdpDAgk7Z08cTagZ2
         aAr/qrYeqopF8BENbW4FuUESHGcJBsZvu5woFljln4kBJo7ssTuW1M1cgb/cO4s0BOQw
         xihzxdT93GbA1Ic0nseMgzEapsdBl6o67lNAB8rJ9Qo0oZYU+lQKcZe0eropLz3nPumw
         1I/XzDLtm4Noqkxhe/V24xWVA0u3UxYqhSuOTIn576+IrTPl0aSNvMeMjBzBoxpBZjPf
         K5q87h04J8+oY/J5Cfpb8wOVAiCIltBAFeAjWU5HFu7IKVLl6BacObhgN5bUPkX+iwjg
         rlDQ==
X-Forwarded-Encrypted: i=1; AJvYcCW1QlolhmCU2jjm6JGknrQhog2Ml25K+ap9vdKiLdCWs7MUh/l5/9Px14v5QTG+SDQ3iaeeHCic9TjD7txKQsNo@lists.infradead.org
X-Gm-Message-State: AOJu0YxbsNVdOvg/qj8J2UYClkznmWV9/3DvaWdzbaNSrkn2dD0CX+1/
	1s8Oqzj5I5NG5CXbGYBqNd+75tAZWMcIsJPyryY5qXho6JUQUXIFja3CfdFyxYYXJcw=
X-Gm-Gg: AY/fxX4BlFCBL/O13auNhlOlJAT4OqFLeOJjXRVt+IRIe2lqb0v++p2IfmfyaZfq8Bm
	V62T4lJmEjGiTtY3QoBls9YKxjJyQ7YcC14q8Y2vKVkUL6VIdRbMNiRKyRxGxvgX5uZZO0NTDqr
	nJpaUlTXdCWXE7NHrzXj78mEk7O/n8dtDibBwBjogxhixK1b8VXBQ07by8nCTZOHlsZRGlqrgXd
	sbcf9C/lIWp3QC081tj0aTiLDXL/j0QTWxEs1eqvFZYwYoCDz7L25ICV9WuzLTr+Jn8XHq9GSSb
	Nxb58jb+a2iPEMWZG7Un3DZdqNnVlKPTY/5mD0UX6Fnah/go86jTdCOprD17H6onN9ynumyZnkA
	b2Ef4+pbfWjy0aRam9grgKmOmh1lr/kWwZaHdJJuKOHQL7AdgJMM6s9viyDajC5tJ8KMvs/vs83
	LrGZIiMRhSF4NwoJHoeZAp
X-Received: by 2002:a05:600c:81c5:b0:477:755b:5587 with SMTP id 5b1f17b1804b1-47ee47bbe97mr31179035e9.8.1768406268797;
        Wed, 14 Jan 2026 07:57:48 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47ee85e8807sm7426475e9.16.2026.01.14.07.57.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 07:57:48 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Wed, 14 Jan 2026 15:57:21 +0000
Subject: [PATCH v5 09/14] perf tests: Test evsel__set_config_if_unset() and
 config change tracking
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260114-james-perf-config-bits-v5-9-0ef97aaf1ac0@linaro.org>
References: <20260114-james-perf-config-bits-v5-0-0ef97aaf1ac0@linaro.org>
In-Reply-To: <20260114-james-perf-config-bits-v5-0-0ef97aaf1ac0@linaro.org>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, John Garry <john.g.garry@oracle.com>, 
 Will Deacon <will@kernel.org>, Leo Yan <leo.yan@linux.dev>
Cc: linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_075750_558150_231BAC10 
X-CRM114-Status: GOOD (  15.58  )
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

Test that evsel__set_config_if_unset() behaves as expected. This also
tests the user config change tracking mechanism as it depends on it.

Reviewed-by: Ian Rogers <irogers@google.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/tests/pmu.c | 91 ++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 91 insertions(+)

diff --git a/tools/perf/tests/pmu.c b/tools/perf/tests/pmu.c
index cbded2c6faa4..0ebf2d7b2cb4 100644
--- a/tools/perf/tests/pmu.c
+++ b/tools/perf/tests/pmu.c
@@ -192,12 +192,102 @@ static int test__pmu_format(struct test_suite *test __maybe_unused, int subtest
 	}
 	if (attr.config2 != 0x0400000020041d07) {
 		pr_err("Unexpected config2 value %llx\n", attr.config2);
+	}
+
+	ret = TEST_OK;
+err_out:
+	parse_events_terms__exit(&terms);
+	test_pmu_put(dir, pmu);
+	return ret;
+}
+
+static int test__pmu_usr_chgs(struct test_suite *test __maybe_unused, int subtest __maybe_unused)
+{
+	const char *event = "perf-pmu-test/config=15,config1=4,krava02=170,"
+			    "krava03=1,krava11=27,krava12=1/";
+	struct parse_events_terms terms;
+	struct parse_events_error err;
+	LIST_HEAD(config_terms);
+	struct evlist *evlist;
+	struct perf_pmu *pmu;
+	struct evsel *evsel;
+	int ret = TEST_FAIL;
+	char dir[PATH_MAX];
+	u64 val;
+
+	pmu = test_pmu_get(dir, sizeof(dir));
+	if (!pmu)
+		return TEST_FAIL;
+
+	evlist = evlist__new();
+	if (evlist == NULL) {
+		pr_err("Failed allocation");
+		goto err_out;
+	}
+
+	parse_events_terms__init(&terms);
+	ret = parse_events(evlist, event, &err);
+	if (ret) {
+		pr_debug("failed to parse event '%s', err %d\n", event, ret);
+		parse_events_error__print(&err, event);
+		if (parse_events_error__contains(&err, "can't access trace events"))
+			ret = TEST_SKIP;
 		goto err_out;
 	}
+	evsel = evlist__first(evlist);
+
+	/*
+	 * Set via config=15, krava01 bits 0-1
+	 * Set via config1=4, krava11 bit 1
+	 * Set values: krava02=170, krava03=1, krava11=27, krava12=1
+	 *
+	 * Test that already set values aren't overwritten.
+	 */
+	evsel__set_config_if_unset(evsel, "krava01", 16);
+	evsel__get_config_val(evsel, "krava01", &val);
+	TEST_ASSERT_EQUAL("krava01 overwritten", (int) val, (15 & 0b11));
+
+	evsel__set_config_if_unset(evsel, "krava11", 45);
+	evsel__get_config_val(evsel, "krava11", &val);
+	TEST_ASSERT_EQUAL("krava11 overwritten", (int) val, (27 | (4 << 1)));
+
+	evsel__set_config_if_unset(evsel, "krava02", 32);
+	evsel__get_config_val(evsel, "krava02", &val);
+	TEST_ASSERT_EQUAL("krava02 overwritten", (int) val, 170);
+
+	evsel__set_config_if_unset(evsel, "krava03", 0);
+	evsel__get_config_val(evsel, "krava03", &val);
+	TEST_ASSERT_EQUAL("krava03 overwritten", (int) val, 1);
+
+	/*
+	 * krava13 doesn't have any bits set by either krava13= or config1=
+	 * but setting _any_ raw value for config1 implies that krava13
+	 * shouldn't be overwritten. So it's value should remain as 0.
+	 */
+	evsel__set_config_if_unset(evsel, "krava13", 5);
+	evsel__get_config_val(evsel, "krava13", &val);
+	TEST_ASSERT_EQUAL("krava13 overwritten", (int) val, 0);
+
+	/*
+	 * Unset values: krava21, krava22, krava23
+	 *
+	 * Test that unset values are overwritten.
+	 */
+	evsel__set_config_if_unset(evsel, "krava21", 13905);
+	evsel__get_config_val(evsel, "krava21", &val);
+	TEST_ASSERT_EQUAL("krava21 not overwritten", (int) val, 13905);
+
+	evsel__set_config_if_unset(evsel, "krava22", 11);
+	evsel__get_config_val(evsel, "krava22", &val);
+	TEST_ASSERT_EQUAL("krava22 not overwritten", (int) val, 11);
 
+	evsel__set_config_if_unset(evsel, "krava23", 0);
+	evsel__get_config_val(evsel, "krava23", &val);
+	TEST_ASSERT_EQUAL("krava23 not overwritten", (int) val, 0);
 	ret = TEST_OK;
 err_out:
 	parse_events_terms__exit(&terms);
+	evlist__delete(evlist);
 	test_pmu_put(dir, pmu);
 	return ret;
 }
@@ -539,6 +629,7 @@ static struct test_case tests__pmu[] = {
 	TEST_CASE("PMU name combining", name_len),
 	TEST_CASE("PMU name comparison", name_cmp),
 	TEST_CASE("PMU cmdline match", pmu_match),
+	TEST_CASE("PMU user config changes", pmu_usr_chgs),
 	{	.name = NULL, }
 };
 

-- 
2.34.1


