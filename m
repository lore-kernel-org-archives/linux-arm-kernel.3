Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26F8DD116F5
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Dec 2025 16:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zABew4dqD3IbbU1tyEn5D3f43+dljvZpz0Ak8Px/2GQ=; b=3uNLa+LX7eKaNl0Px4fn7fMY1N
	+govd2eLJPjv7JlZwipBjhKPWO24TJ0aeeYrN6Y6fq50e3mrplhy9y27lWcjmYe8r/qC+Y1MawFeN
	aZnN+PuPswev7MNL9qiQxBCAI4cR3QzyoKoV3wOne6vor2mmZgdu6YGY+k3wGp8uydIn535Q5U5Oy
	GtFYEoGtYDx3ADJipACEVsUVVCUu67eNguw5qqCOGPhrwpgjjAKBM9NWLXbFyvFeZVqMWTR8H9AT6
	F94CjkCHn1Hvb9YgSRAFwnqREj8fnIaO4TnxlYQpsRNMuh7XSimQ84CbnJwyf9U4kRMNoqnGGt3UX
	hyJbE1jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ6yH-00000004I2Z-03VM;
	Mon, 01 Dec 2025 16:41:53 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ6yD-00000004HzL-3f6P
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Dec 2025 16:41:51 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-47775fb6c56so40473195e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Dec 2025 08:41:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764607308; x=1765212108; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zABew4dqD3IbbU1tyEn5D3f43+dljvZpz0Ak8Px/2GQ=;
        b=bf6COfP11mRbinp2hzi8Atr2mgMLyRhvOeEhoh7NVX0MglPscGuuY/OQTXJv9Q4VEB
         2D7sGoWSlC6pAYS460YC9vQAv58Vbwce6XV5R6StIvxrHnh44BFy4kxj2fvW4tpkdQrO
         ECJOAO5tf44sCQLTf3nwVrF8E3rX48IQiSwITCfG0hHGR2VKOWAmNyLsKmGRdtLp2j/W
         quTvOdb1rVr0GEyXWf2Lh/C3o/omDjHxprECd0uUHGDJ/a26v5hSOu221/YyjnWVrvPa
         047JeVWK2nXDXp2RKFraQlyds9h29G+0W8I+phQKbmbaZw65wveTxkTsb7vwio+2DyYi
         jeNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764607308; x=1765212108;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zABew4dqD3IbbU1tyEn5D3f43+dljvZpz0Ak8Px/2GQ=;
        b=il+cttyveC4KSEWU+jwJnnR9yAnJmGhpSR9QY6xiW0m8yfgmnkaDlf3H2zDp10dv/K
         fltC7ooW+Ba9+4EvO3FC9rrU3De8s3PnuTs/z1DDwScapMTutiHgWviZ0K3rks+3gg7U
         Jo/GgBZbJmDUkRa+MOaLS2OIrgstJjxi3iY867G4EyLpd0CziYstT/S1sB5eT7/a+dEJ
         nauJI3eziZuFpGP3egrMHOrV+Mo0yPhudfmPXQ1V4ZFTpjOjjL54uyKoVsRUDZuEb1aO
         vSdlMIVsKnmX/QiFg1tKvTnT8Su5BiU6F6Sdzpq/i0UgPWHWuo/qYd9AW5PaGtCNqK1m
         cRVg==
X-Forwarded-Encrypted: i=1; AJvYcCVpFoHATTk1CdE3WDNX0SizxIGU3MnMGSfrZWRnY1aXL9ohrBebLS3vZ2d4K9kGZS1C8CrnzXXfSBj8q+yVq/+7@lists.infradead.org
X-Gm-Message-State: AOJu0YwCIn7uSmjniaVuk3IXcqh0fD7RwFaiKMmd9pYuIL6xFLu8aWKR
	agrlGv5biJ2Mtc4aB3B9JahG3s8r9sPZw5gGZRxFcDqYmA9kH7vqy9QVe7Tg+X5aJIs=
X-Gm-Gg: ASbGnctQ21v7JuJAz7OyYoqXY5NwwrOt6n6G/IHDhTSzVVvzZ7foFKF8UYfLui/MqPw
	63faqmonTbGt9OAzfgW54MUCJ6L9ure2St7Wl49kp1JSYNg03uhvlIsjZ1KFzjMfEsRzq09/etL
	WQeSGd8klwM0OtQLkAaAUDS/QxRz3TRCx9XuTSWTyt5ncGABvOUBXWihmITm809o0YSIbB6D9ik
	bMcrYOPednPQ8HhiMOhfnfPz85pypLiIRYYhYa6UDN5Sq0e/J2rJIpBGBxNdXDnOYY9trlvt3z9
	84Q1yYfqP0EL4BrBNNnTlvqGi7hjjFkmQK8DObKkqy25azmNKvJUpW2jw2dCVV5EEoLz3L4sisa
	x2GxgkMCpPW7y7rpa5ghMVKGR9BJQ102gHfMvijAmsbhJJnWmbrzr/IaGxxMZ3mvryuQM0uel16
	R4gaPb/sHOue2vqTJ1tlCbSShWuu9PLik=
X-Google-Smtp-Source: AGHT+IH4qlSHOHlP9FoC3pEYptApY3iIhEO5qtBZvowYnB5XerIVCpLZUtOXG+kLqnlpOo12ry8aAw==
X-Received: by 2002:a05:600c:4685:b0:477:5b0a:e616 with SMTP id 5b1f17b1804b1-47904acaf28mr248918075e9.5.1764607307979;
        Mon, 01 Dec 2025 08:41:47 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4791164d4f3sm255901275e9.13.2025.12.01.08.41.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 08:41:47 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Mon, 01 Dec 2025 16:41:07 +0000
Subject: [PATCH 4/7] perf cs-etm: Don't use hard coded config bits when
 setting up ETMCR
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251201-james-perf-config-bits-v1-4-22ecbbf8007c@linaro.org>
References: <20251201-james-perf-config-bits-v1-0-22ecbbf8007c@linaro.org>
In-Reply-To: <20251201-james-perf-config-bits-v1-0-22ecbbf8007c@linaro.org>
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
X-CRM114-CacheID: sfid-20251201_084149_949942_1E1DB81D 
X-CRM114-Status: GOOD (  21.26  )
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

Perf only looks at attr.config when determining what was programmed into
ETMCR. These bits could theoretically be in any of the config fields.
Add a generic helper to find the value of any named format field in any
config field and then use it to get the attributes relevant to ETMCR.

The kernel will also stop publishing the ETMCR register bits in a header
[1] so preempt that by defining them here.

[1]: https://lore.kernel.org/linux-arm-kernel/20251128-james-cs-syncfreq-v8-10-4d319764cc58@linaro.org/
Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/arch/arm/util/cs-etm.c | 35 ++++++++++++++++++++++++++++++++++-
 tools/perf/util/evsel.h           |  2 ++
 tools/perf/util/pmu.c             | 33 +++++++++++++++++++++++++++++++++
 3 files changed, 69 insertions(+), 1 deletion(-)

diff --git a/tools/perf/arch/arm/util/cs-etm.c b/tools/perf/arch/arm/util/cs-etm.c
index 22c6272e8c36..414cafb21c98 100644
--- a/tools/perf/arch/arm/util/cs-etm.c
+++ b/tools/perf/arch/arm/util/cs-etm.c
@@ -68,6 +68,12 @@ static const char * const metadata_ete_ro[] = {
 
 enum cs_etm_version { CS_NOT_PRESENT, CS_ETMV3, CS_ETMV4, CS_ETE };
 
+
+/* ETMv3 ETMCR register bits */
+#define ETMCR_CYC_ACC		BIT(12)
+#define ETMCR_TIMESTAMP_EN	BIT(28)
+#define ETMCR_RETURN_STACK	BIT(29)
+
 static bool cs_etm_is_ete(struct perf_pmu *cs_etm_pmu, struct perf_cpu cpu);
 static int cs_etm_get_ro(struct perf_pmu *pmu, struct perf_cpu cpu, const char *path, __u64 *val);
 static bool cs_etm_pmu_path_exists(struct perf_pmu *pmu, struct perf_cpu cpu, const char *path);
@@ -487,6 +493,33 @@ static int cs_etm_recording_options(struct auxtrace_record *itr,
 	return err;
 }
 
+static u64 cs_etm_guess_etmcr(struct auxtrace_record *itr)
+{
+	struct cs_etm_recording *ptr =
+		container_of(itr, struct cs_etm_recording, itr);
+	struct perf_pmu *cs_etm_pmu = ptr->cs_etm_pmu;
+	struct evsel *evsel = cs_etm_get_evsel(ptr->evlist, cs_etm_pmu);
+	u64 etmcr = 0;
+	u64 val;
+
+	if (!evsel)
+		return 0;
+
+	/*
+	 * Roughly guess what the kernel programmed into ETMCR based on
+	 * what options the event was opened with. This doesn't have to be
+	 * complete or 100% accurate, not all bits used by OpenCSD anyway.
+	 */
+	if (!evsel__get_config_val(cs_etm_pmu, evsel, "cycacc", &val) && val)
+		etmcr |= ETMCR_CYC_ACC;
+	if (!evsel__get_config_val(cs_etm_pmu, evsel, "timestamp", &val) && val)
+		etmcr |= ETMCR_TIMESTAMP_EN;
+	if (!evsel__get_config_val(cs_etm_pmu, evsel, "retstack", &val) && val)
+		etmcr |= ETMCR_RETURN_STACK;
+
+	return etmcr;
+}
+
 static u64 cs_etm_get_config(struct auxtrace_record *itr)
 {
 	struct cs_etm_recording *ptr =
@@ -746,7 +779,7 @@ static void cs_etm_get_metadata(struct perf_cpu cpu, u32 *offset,
 	case CS_ETMV3:
 		magic = __perf_cs_etmv3_magic;
 		/* Get configuration register */
-		info->priv[*offset + CS_ETM_ETMCR] = cs_etm_get_config(itr);
+		info->priv[*offset + CS_ETM_ETMCR] = cs_etm_guess_etmcr(itr);
 		/* traceID set to legacy value in case new perf running on old system */
 		info->priv[*offset + CS_ETM_ETMTRACEIDR] = cs_etm_get_legacy_trace_id(cpu);
 		/* Get read-only information from sysFS */
diff --git a/tools/perf/util/evsel.h b/tools/perf/util/evsel.h
index 3ae4ac8f9a37..1c567cc70a82 100644
--- a/tools/perf/util/evsel.h
+++ b/tools/perf/util/evsel.h
@@ -574,6 +574,8 @@ void evsel__uniquify_counter(struct evsel *counter);
 	((((src) >> (pos)) & ((1ull << (size)) - 1)) << (63 - ((pos) + (size) - 1)))
 
 u64 evsel__bitfield_swap_branch_flags(u64 value);
+int evsel__get_config_val(struct perf_pmu *pmu, struct evsel *evsel,
+			  const char *config_name, u64 *val);
 void evsel__set_config_if_unset(struct perf_pmu *pmu, struct evsel *evsel,
 				const char *config_name, u64 val);
 
diff --git a/tools/perf/util/pmu.c b/tools/perf/util/pmu.c
index c8968cddc0a9..5501b0230097 100644
--- a/tools/perf/util/pmu.c
+++ b/tools/perf/util/pmu.c
@@ -1384,6 +1384,39 @@ pmu_find_format(const struct list_head *formats, const char *name)
 	return NULL;
 }
 
+int evsel__get_config_val(struct perf_pmu *pmu, struct evsel *evsel,
+			  const char *config_name, u64 *val)
+{
+	struct perf_pmu_format *format = pmu_find_format(&pmu->format, config_name);
+	u64 bits = perf_pmu__format_bits(pmu, config_name);
+
+	if (!format || !bits) {
+		pr_err("Unknown/empty format name: %s\n", config_name);
+		return -EINVAL;
+	}
+
+	switch (format->value) {
+	case PERF_PMU_FORMAT_VALUE_CONFIG:
+		*val = FIELD_GET(bits, evsel->core.attr.config);
+		return 0;
+	case PERF_PMU_FORMAT_VALUE_CONFIG1:
+		*val = FIELD_GET(bits, evsel->core.attr.config1);
+		return 0;
+	case PERF_PMU_FORMAT_VALUE_CONFIG2:
+		*val = FIELD_GET(bits, evsel->core.attr.config2);
+		return 0;
+	case PERF_PMU_FORMAT_VALUE_CONFIG3:
+		*val = FIELD_GET(bits, evsel->core.attr.config3);
+		return 0;
+	case PERF_PMU_FORMAT_VALUE_CONFIG4:
+		*val = FIELD_GET(bits, evsel->core.attr.config4);
+		return 0;
+	default:
+		pr_err("Unknown format value: %d\n", format->value);
+		return -EINVAL;
+	}
+}
+
 /*
  * Set @config_name to @val as long as the user hasn't already set or cleared it
  * by passing a config term on the command line.

-- 
2.34.1


