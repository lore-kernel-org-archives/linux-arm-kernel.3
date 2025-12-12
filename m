Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEC82D59D66
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Dec 2025 15:33:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e7fahmTBI9kipCQMheuyeZUpREbzXH29kA76YEVRHtk=; b=WcKXY00QXvHcWQ4NSDq2OHuTh4
	up2p62kd83DLRk++HehYJTQjynNxbQSJBV8kWlQqFjJD+LsoRIJbOdgZmpEcmlCeWVB1hhfOs/zNX
	7ErAuLpDLn9/iTDPTD/zv7ag6zVuF4B1xETvCpXqW/tVmpX80Eg00jbrya183ATcNJGkIQf1KhQHk
	xXmuPUGhRpgICMm47pfaQgr3GCRPjSRbk7yUNspjlK+B1XIfhS95I9dHltdZTbmnEDczTUeG1rkLQ
	+Ga0vOEUKfEhKD03FPnPCErWj9xRPxfxq3M/+jUZ1NNcnuemVhQbeuLJnkekAMBTsrNENzpIpS5Xk
	bKoQHn+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vU58l-00000000jI5-3iD5;
	Fri, 12 Dec 2025 15:33:07 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vU58d-00000000j95-0YgY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Dec 2025 15:33:01 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-b75c7cb722aso271454366b.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Dec 2025 07:32:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765553577; x=1766158377; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e7fahmTBI9kipCQMheuyeZUpREbzXH29kA76YEVRHtk=;
        b=Oxuzwy3ikq0LfFwlG4Evpte8WZaDIUt3so2XEsIc9DlOPJluLTjHknBe8pj6HcWgjF
         JrmZI4hS8rvTqUgfBAjJnv7eN61u//1UE1lOHT1buhh2KTHPNcUq3wp3ezl7kOxsdOnF
         deaEkGA+F6sf1bK0rlncOuix8sh3SqA5e8jCZPGAAxia3YZLzTTd+LQBVKzI0ONT+A19
         s1xrBbutjl9a9JNc7W3oKCm7c9/bNjnw5ukvJwx37WiYUvD70WIcqxJCfUKY11pQ9AOg
         XDeGi9L8KFyp1q71dqnh6/TC4e/gnQLeFa1YkzpCX7QDFdMNSbMQ0yazO+0wwbkgZgio
         tvoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765553577; x=1766158377;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=e7fahmTBI9kipCQMheuyeZUpREbzXH29kA76YEVRHtk=;
        b=t6dais8yl50ZzXIB0c0a5RvivOX84KW1Dj/cK6IdM+ZEm6oUtuJjSumy32w8Ih2lQM
         eulRCXng+oG3k6XyyxBuvDF3L07TqUCoh7dZoBLQSjnXZ2M4Ez/t0d0YcmUk0Y0qNd/x
         xoJH/RNKXyWH7srxbVNSdRv634aPArnc+KmzBXDW//ZT61Q6MMf1Oml92chvZpRHj56w
         XZr5s0+VPIRA0qEAKFTiXDsitxrUO6t3tQJk7BcC4rbbAAeci1b2PhL95hNpbxfi29hX
         VKQp725KenJRmube2eFosxVVhoDgVE+snyBiAjk0r8Nd2TMptmC35jhaZIcaIySuhf+G
         HKxw==
X-Forwarded-Encrypted: i=1; AJvYcCWW2E3vf5PLaIbMCrIrFWSUEllRRQ+s/Y65MhsJ5ZkrOSOcGiVniE84cACTK2EW6WdZkyM3tiYFBhznvpeVXJmK@lists.infradead.org
X-Gm-Message-State: AOJu0YxmRhQXz5BqwIXvoSehqTQw0TXHCHaZNCqIve0jb4k2fUq4wnXt
	cnUiw12Nhus0xqIq8B/sTFxaabDMn464Vupw4KJ325XPHJGFs/IeTS2/nYlT+D6/ZWc=
X-Gm-Gg: AY/fxX6vxrKAcTC0rl68wc8AhSzdxwkTc7hNRzQgSmibBakdy11WuoMjP/yDFfAGmIN
	b7FK4BONsEygU4x2rUZimvJFPgFvE8IfjckS7kAopxTH7JeoQBUAewKfp76cwFbocIlXSxM3IMx
	TFzysbq8K3Dad+0t70D4Kw4aDiUY5erUvy96MDVNgMkLlrVAokeOOHMCaY0p289AOsYhQjH1vjy
	7zEnxxiF41DAfYI7nGHy8aRJPBschNHlNX2LyLUZlarV6qTsR0mL3mKJWKPaiNb/hs2D3poIxsa
	DPLL8R0nkdQtmoFIblK9Y54nagoe1Tp7N6IHvpPeT658L+E8owbzxfvFFeWc8g0LxUuy2lV/R3r
	w7YhjCOztu3mH5xFACmgEP5UoOw5pvpDxHjla6xDnEzfyxoGvQ0VuQUUQvJ+Q8l5fOlZYIYS0Fj
	edoziE4MrfraibG85LUarI
X-Google-Smtp-Source: AGHT+IEQFiVpXtjTbT1nEBymPVvwKhgGbHnTLlvzOpyqaM6FBur+TFlEfnGCvotgjkxj0qijhEHzow==
X-Received: by 2002:a17:907:6095:b0:b72:3765:eda9 with SMTP id a640c23a62f3a-b7d23a7988cmr220274966b.60.1765553577012;
        Fri, 12 Dec 2025 07:32:57 -0800 (PST)
Received: from e133063.arm.com ([130.185.218.160])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6498210ed32sm5433234a12.29.2025.12.12.07.32.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Dec 2025 07:32:56 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Fri, 12 Dec 2025 17:32:24 +0200
Subject: [PATCH v3 07/12] perf tests: Test evsel__set_config_if_unset() and
 config change tracking
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251212-james-perf-config-bits-v3-7-aa36a4846776@linaro.org>
References: <20251212-james-perf-config-bits-v3-0-aa36a4846776@linaro.org>
In-Reply-To: <20251212-james-perf-config-bits-v3-0-aa36a4846776@linaro.org>
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
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251212_073259_205839_199E919D 
X-CRM114-Status: GOOD (  15.59  )
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
 tools/perf/tests/pmu.c | 91 ++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 91 insertions(+)

diff --git a/tools/perf/tests/pmu.c b/tools/perf/tests/pmu.c
index cbded2c6faa4d5b422936e81bde83bc328fcdfe7..9e313a9a44fdebd0d417c7558b15e5db89241867 100644
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
 
+	evsel__set_config_if_unset(pmu, evsel, "krava23", 0);
+	evsel__get_config_val(pmu, evsel, "krava23", &val);
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


