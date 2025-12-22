Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 704B9E677E5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Dec 2025 15:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i4eLrNTmJYNZqrOFXMkgnCrs/v9XFpKSoUUWAD+1qM0=; b=SXsX9wXGkVSxLCW33Um8aJotC8
	pYmBb038/s5+APUs1UGh8OUfNmN3GvoSMtc3/zIW787Iu4WesgzdkaiOJpXq9X9Ujtf8E7u0CsGXC
	uKyqN6u+GrPIYFFWFAmYcnCNffnfe/qwfWODbKrMqkq6qvmF8zarnGdxAakK8EjsqsgXAQchNwtml
	so4er+Aoz6E1cmFEMdzF9yTIRKv/EEslPwFyLN4sweinWir4DCDci7lEJYGz1Vt0rdwQcdOjNtA/Q
	iq7tWjmXtSOcwgS955yJtW+Io2PocHt55go5ordQ5QwxgNe2JzUoeDI4YnJNxRq5tSMz7xx1o+AWL
	2U3AzQPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXhcu-0000000DtvI-3D7O;
	Mon, 22 Dec 2025 15:15:12 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXhcg-0000000Dtk0-32iZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Dec 2025 15:15:02 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-431048c4068so2290797f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Dec 2025 07:14:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766416497; x=1767021297; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i4eLrNTmJYNZqrOFXMkgnCrs/v9XFpKSoUUWAD+1qM0=;
        b=w6kqxOVFM3IJMR+Jq9o0noF0Wu9/cc4RSfTT+IByyYev/38qFb0aKxtI8qa9+hgeU+
         oUSyUEdtkbfx4VSkZby+8GAkk5VE++7Npqj02R9XG6mENOdwsarA1yp7CdLEq4OTzHVN
         4tmQ4XPL/khn3vI7Pjlo3IeRwrA8M0eoIH7kl1bGgSAbOYVCNDEXHVEduD+ZnNaM5ePq
         /Jll4UXj3nlywDiZ3WNJhf7vh73x5z8rl6NQed0yFDQEXp8FqYkM/1F6RaR5tVayTade
         V/0Vmpqz9m5lbOFrdU4elXhD4uxnG3jQ29l3pfvd5rUUD8s1Hcbod/aXvyA0N/5EceGX
         rbjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766416497; x=1767021297;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=i4eLrNTmJYNZqrOFXMkgnCrs/v9XFpKSoUUWAD+1qM0=;
        b=CFQLeQoZamh3R7zJ6KrAlkqQvFTaQNp83vJdKcHlPzPQlIjqD1tdvFEoPDM4dmEHjp
         8QZg1UUhEpdYRxwqoTvwQtPoetVmVtOmD8uiWzXIQYZmAWWncYz2deV6F96aO1VjTkw1
         uuwxYmrSz3APva2VYF62abmUqZfoGGO5Xx/X931nM5q/4r6AYYwsF3H+h7ua2NR0lLbP
         oJ+SOoUR6p5vtFOLnSJF3vqU2upSKCs/6CCIBaYyHAuKxwMx1WEzW7GONWYoP0a00JNv
         kBt5BB2WN+WZIZBOsVaTvSSv6EwJyjd1KD7FaX4v9TMhjwt/v6RYL1dB5T6RVJJ1MnCL
         I5Yw==
X-Forwarded-Encrypted: i=1; AJvYcCUtVoIxR0LfJktJ92fiIfuEpzTrS+CFFAfn16YjoBhc0kpe4G3YsI2Usli3D79ypKhTW9rP7LfnVblQmjJnw4Tv@lists.infradead.org
X-Gm-Message-State: AOJu0Yyy/vzEcNf4LpajQJzIEqB5Iz7wMUoyihpf86lmXA4f7fhH6GoI
	aGDyCKORCI0EmjWyoNDSk1I7xx9jpHHIgMnT/PiTjCRvSh0oN4DbyZySQcXFFQr1NXc=
X-Gm-Gg: AY/fxX75o8isdVAB+6NlBrCit6YEiFXZKpedC6533yLXJTYjSCBZXErMp+MLFM86dK2
	me49t0oTXgu+1noyzIuxd7oijSOWf579kqi062Naylv36jtkKuEE83fgCjvkMhn9wG/0Vbe//Ci
	xR0prMyVwQ8FuWAaTbkvJ1Rhy3BX8I5jbp7iIxSQdqmPw/ktOYTWJfWvE/Xcjsa2UNiMkZltYCF
	0ygj321m+wQ+Wj8RI9cNGTKLDu/45XTMfGkivgY5pFpyktK0H+SZGiNVf1s4loyGxifOQXbALA+
	sVSpL/zZpPWiF6hlPlg3Yo56UPWbkDas0fDT4lF0VVNzQFn5DwWaf9moEGm3fdYiagY6IfE/+uN
	NP+jd8YLL34rDd5Odm/zkTMu6YfV02UgBbqza+g6fjBeogAgcm5DxX7JUytLhvmqJvWchGNWDtq
	oJg4DBpKFcK/gJM03Yem32
X-Google-Smtp-Source: AGHT+IEX38PKZ1aYnAoijx5riCeANgTFac47kzzgBW07ko1Xcrdxsb2Y6X78FNQXCIfizNz2p3XEYg==
X-Received: by 2002:a05:6000:18a8:b0:430:f16b:d8cc with SMTP id ffacd0b85a97d-43244795353mr17080981f8f.3.1766416496632;
        Mon, 22 Dec 2025 07:14:56 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea830fesm22750093f8f.20.2025.12.22.07.14.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 07:14:56 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Mon, 22 Dec 2025 15:14:34 +0000
Subject: [PATCH v4 09/14] perf tests: Test evsel__set_config_if_unset() and
 config change tracking
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251222-james-perf-config-bits-v4-9-0608438186fc@linaro.org>
References: <20251222-james-perf-config-bits-v4-0-0608438186fc@linaro.org>
In-Reply-To: <20251222-james-perf-config-bits-v4-0-0608438186fc@linaro.org>
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
X-CRM114-CacheID: sfid-20251222_071500_898508_23F4280F 
X-CRM114-Status: GOOD (  15.79  )
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


