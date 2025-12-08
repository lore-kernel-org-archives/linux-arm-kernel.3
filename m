Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BEB4D3B7F4
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Dec 2025 14:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5kd2R0ME/G1mScEH97Zt/42ug6RvhAVhA6QI6GEroJM=; b=3uIuuMHg0ZZsA00XsWi+bv3+Im
	TItG+qooednwbmwt49sN4tufOQMBfHV7VZZEENNsADgl0dwvNoWzC2UrIOSQ+R/Y4CY7Q4ZiRHD9i
	Kl4XhtxxXgDl06bbSGm9Cv3VRU+J5lhhjSZOqFXxIQ9SDM62jo2n0mUIhkMxiCb29dJVEngDTJEcx
	xCSzkqJKNUEcKEiKOx0NZdw4F1iCno9ydm7H/hLs1jz8H9aT6LmZpDlRKNvU3KTSDqYYX9g0QUPVQ
	w/GtZ/U1NvDlvkv8Kb3H6KAOgFtolEula7Rmtyra6RNg7Fs+NrWcYzapMYb9LbM2uuMvcPC5O6oHW
	wRdPW/2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSc9G-0000000DBAT-0Bix;
	Mon, 08 Dec 2025 14:23:34 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSc9A-0000000DB6A-2EY0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Dec 2025 14:23:29 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-47775fb6cb4so37918765e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Dec 2025 06:23:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765203807; x=1765808607; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5kd2R0ME/G1mScEH97Zt/42ug6RvhAVhA6QI6GEroJM=;
        b=Jva1Jg5pDoIeKsnjmCMfwc+fhiwhaKVMIsAw4bJijmxp9DXwtefqIVhoA2vosTpaef
         gzRVMEKC4ynvF3eBMCQFImfYmbmtAejNAqupJfJisgUzdUk8Jnh85dMHjMYp4C5X9EC1
         8pCywjBSqO9NOhPG6tTCg0wPRcw8thfSlYpfmykowLb2UceBDY/1I9or3a+t49QqbL7I
         AcCfI/Ja+L0SLNG7IuIFmzaJoIPWiMlsM5ybBtg03qpr+fcLezLyCOdW49ptXs0i6eLv
         mXlz+HqdrhD/BSgHYOt9+KfD1V5AW22x7CI25WkYleQndpSC9+KzKenpA3hDF8qqI+c1
         3ExQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765203807; x=1765808607;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5kd2R0ME/G1mScEH97Zt/42ug6RvhAVhA6QI6GEroJM=;
        b=MzY4Bfy+BitE1fwEifsr5fxqjE8Y0D7xviZYEg7tZ/imUPGU37PyazLIx+XT6yky82
         EJEFC5aV28wQYuxkUb11LLd3oG6Zxr57Qm/B4E4j7sOmlaXijnkrmVxJsaobTtX6fqTC
         lbaWTurhUiOCvBjUsrhAmEpDIrlQUgDe1xicTeJY8+JZa4vppLf3DLEeAYnKAvms14ah
         10Lg9PODxG8FOIiUn0ABWkPKpVYov4O4GPRzlsblZ4gQ2BbE4mUfQ49Y2FDYGzlk/8dM
         bEjYGWdDh2PbUsD1LY1ksB7AgcKGSbZZr6PPH7BntntXY3JNXkJpPiWmCM6/xt5ltLEl
         HPhQ==
X-Forwarded-Encrypted: i=1; AJvYcCWhFcY7cB9oTbvCDT5D0PgGHtTK3f3wuR07C8I2KLVRO1DiNF4yFf2TzZMIAArnNMp10KRnKQAovzrFisNwgGoo@lists.infradead.org
X-Gm-Message-State: AOJu0YxaC1MobYe32UU9vkaP9Y6deoZIZKjGuEVdgOQqQtA+8F/L+NII
	4y3NWMAgpRAV5DPz/h0tgwD9Zp2MhSn5plcmKk2Cwq8c9m2j3JQgqyB8+tsjOGMbSD9thXUqj1c
	NQvqW
X-Gm-Gg: ASbGncvRjXRLY++6do7LgrpR/REtjnE8ruAUE0NfdYE9d8tBuiNdOIlwcw2DYkKt8oE
	gLQRH2mqftxuVlRJWKiX3cAYfj3ZZPGTauHYWx3DP+2c9fmMfNWb6BDAgHAwERGRZbJaiPcX7hA
	FIjuy6vFST0mIQ5FdcG9W0suNfF/oZOK9ElQvSYy76C4RLTaapiJb9Lre+BEYY5jEUgq3COVG7K
	7mKLQtmTCxbN/EuCmbbWcF+0Ot5fCrkAcldibqdVdm8O3q1I2GwSBY4GUwdHIw0B1kaFaWCvKLq
	HdUseEVETQjPXwZeqPCND8UGLh9/V+NnJsCgn87KlacEw4tfF7q+kn5Uk/tDstkDVOn4Barq5PI
	BniD3hWAZnP69tXhdIl6T17I7Wvzbfyr3scErQDe2gFRCbDVBIzqtuPsLCAw3tkGxCB9r5DGiEA
	M7fjDFgVQS/3p+vqQO2x4P
X-Google-Smtp-Source: AGHT+IEhbbXGKkuGD/fbdNeyATAFNtzV6xXJwj6vpDm344XgOyf9yieISnwZUUrfZfDQkKbisoBK8g==
X-Received: by 2002:a05:600c:6748:b0:471:9da:5232 with SMTP id 5b1f17b1804b1-47939dfdc35mr82272095e9.15.1765203806602;
        Mon, 08 Dec 2025 06:23:26 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47930920e0dsm248561065e9.2.2025.12.08.06.23.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Dec 2025 06:23:26 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Mon, 08 Dec 2025 14:22:10 +0000
Subject: [PATCH v2 07/12] perf tests: Test evsel__set_config_if_unset() and
 config change tracking
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251208-james-perf-config-bits-v2-7-4ac0281993b0@linaro.org>
References: <20251208-james-perf-config-bits-v2-0-4ac0281993b0@linaro.org>
In-Reply-To: <20251208-james-perf-config-bits-v2-0-4ac0281993b0@linaro.org>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, John Garry <john.g.garry@oracle.com>, 
 Will Deacon <will@kernel.org>, Leo Yan <leo.yan@linux.dev>, leo.yan@arm.com
Cc: linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251208_062328_605329_ACBFFB66 
X-CRM114-Status: GOOD (  15.56  )
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

Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/tests/pmu.c | 90 ++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 90 insertions(+)

diff --git a/tools/perf/tests/pmu.c b/tools/perf/tests/pmu.c
index cbded2c6faa4..f938135e62aa 100644
--- a/tools/perf/tests/pmu.c
+++ b/tools/perf/tests/pmu.c
@@ -192,9 +192,98 @@ static int test__pmu_format(struct test_suite *test __maybe_unused, int subtest
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
 		goto err_out;
 	}
 
+	parse_events_terms__init(&terms);
+	ret = parse_events(evlist, event, &err);
+	if (ret) {
+		pr_debug("failed to parse event '%s', err %d\n", event, ret);
+		parse_events_error__print(&err, event);
+		if (parse_events_error__contains(&err, "can't access trace events"))
+			ret = TEST_SKIP;
+		goto err_out;
+	}
+	evsel = evlist__first(evlist);
+
+	/*
+	 * Set via config=15, krava01 bits 0-1
+	 * Set via config1=4, krava11 bit 1
+	 * Set values: krava02=170, krava03=1, krava11=27, krava12=1
+	 *
+	 * Test that already set values aren't overwritten.
+	 */
+	evsel__set_config_if_unset(pmu, evsel, "krava01", 16);
+	evsel__get_config_val(pmu, evsel, "krava01", &val);
+	TEST_ASSERT_EQUAL("krava01 overwritten", (int) val, (15 & 0b11));
+
+	evsel__set_config_if_unset(pmu, evsel, "krava11", 45);
+	evsel__get_config_val(pmu, evsel, "krava11", &val);
+	TEST_ASSERT_EQUAL("krava11 overwritten", (int) val, (27 | (4 << 1)));
+
+	evsel__set_config_if_unset(pmu, evsel, "krava02", 32);
+	evsel__get_config_val(pmu, evsel, "krava02", &val);
+	TEST_ASSERT_EQUAL("krava02 overwritten", (int) val, 170);
+
+	evsel__set_config_if_unset(pmu, evsel, "krava03", 0);
+	evsel__get_config_val(pmu, evsel, "krava03", &val);
+	TEST_ASSERT_EQUAL("krava03 overwritten", (int) val, 1);
+
+	/*
+	 * krava13 doesn't have any bits set by either krava13= or config1=
+	 * but setting _any_ raw value for config1 implies that krava13
+	 * shouldn't be overwritten. So it's value should remain as 0.
+	 */
+	evsel__set_config_if_unset(pmu, evsel, "krava13", 5);
+	evsel__get_config_val(pmu, evsel, "krava13", &val);
+	TEST_ASSERT_EQUAL("krava13 overwritten", (int) val, 0);
+
+	/*
+	 * Unset values: krava21, krava22, krava23
+	 *
+	 * Test that unset values are overwritten.
+	 */
+	evsel__set_config_if_unset(pmu, evsel, "krava21", 13905);
+	evsel__get_config_val(pmu, evsel, "krava21", &val);
+	TEST_ASSERT_EQUAL("krava21 not overwritten", (int) val, 13905);
+
+	evsel__set_config_if_unset(pmu, evsel, "krava22", 11);
+	evsel__get_config_val(pmu, evsel, "krava22", &val);
+	TEST_ASSERT_EQUAL("krava22 not overwritten", (int) val, 11);
+
+	evsel__set_config_if_unset(pmu, evsel, "krava23", 0);
+	evsel__get_config_val(pmu, evsel, "krava23", &val);
+	TEST_ASSERT_EQUAL("krava23 not overwritten", (int) val, 0);
 	ret = TEST_OK;
 err_out:
 	parse_events_terms__exit(&terms);
@@ -539,6 +628,7 @@ static struct test_case tests__pmu[] = {
 	TEST_CASE("PMU name combining", name_len),
 	TEST_CASE("PMU name comparison", name_cmp),
 	TEST_CASE("PMU cmdline match", pmu_match),
+	TEST_CASE("PMU user config changes", pmu_usr_chgs),
 	{	.name = NULL, }
 };
 

-- 
2.34.1


