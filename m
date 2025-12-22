Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9363AE677E3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Dec 2025 15:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tc92yWKQZM+B64gHggXneBOLYCdgUjGdgIDlKi2hgGI=; b=HTiFDzzDbe+AbQnwsbVnyPqMMn
	eT+mXS/yZz8yALhZxCLkasom15sJV4q52JTdcQJkpN9PWGoiy9h6unghwECS+fZe0QtwbmwmpvtI6
	0PdO2DHLShafqK5FP4cabXACsQWs1UQdJ3WNi5FF03q/k0JiF0tRyjQNWnZnBMdwjLyT3oru4suxU
	V3SoIz6REVc8K1C9iWne/YWKRYwdWTL4o3uadgwYFXThKziKG8d9FQV64dV29MH6pY8vHIfFWMqHC
	TlwG1did0K4Lt81JtHAmcHBFv0j5frGD3TS3dIzneTuwJALpW3j28br7ZfUUaLNiZAWCrrV+WmhAN
	AybqKF5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXhcs-0000000Dtsl-3u5Y;
	Mon, 22 Dec 2025 15:15:10 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXhcd-0000000DthW-1nMO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Dec 2025 15:14:56 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4779cc419b2so32110965e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Dec 2025 07:14:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766416493; x=1767021293; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tc92yWKQZM+B64gHggXneBOLYCdgUjGdgIDlKi2hgGI=;
        b=LwZqhBTb4UceaIlth3o1ou0x4lifwQry6M3yyjN9zTP0aW0q94XhAO0RNxJVwMBiyo
         KbCz3mJJGqMipE3DYr7nWwNz2lbYVWKX4hCklI9HR6M8WWRl8eKLiadx1jWYWxP8Z5Rw
         u9uFW/nL0AcUFWngqfjdiO0VYzD0Qa8qzZTTEvjOLKvBQAd/VDVXxprfQ4Q7z8GaGiqJ
         0Z1xdu+UoYKsHdt/7dwlpwEenby/IC3RJxrvJti7ZugkFaCKXbHUrJTcZaTtgJiktoyx
         1/J0vC89WBF+pGFgU6j70wcV0KtkfCF7my9noBVpjTdeg64phVxqEhmVe/LDogrWSbjX
         /gCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766416493; x=1767021293;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Tc92yWKQZM+B64gHggXneBOLYCdgUjGdgIDlKi2hgGI=;
        b=eFvmfbCQIKoUeCn9Zo1vTh1NyT7lz8qzNJHu99+ylxWlD9ZLS61UreA++cbb3sQoFa
         FnKpsKn5fvGWYkxfxPya0bklid2nMjzE2s3uoo9soZVE9bDQQxryqTBVrLs2doU9fysL
         stg0OrSFhVuxcBpLUffh0oiEkqadxmTvR4jwwl38XsIRrSauzDkwZacuDFkUUCPkSHTw
         ww+hXRAOMCK+FU9/K7ISHt3R7D0kutzPhx053ExezBXQef/QIF6FY6tQNEpPWA9ZbHIK
         /BMtOMNvtxwY0itR4OCWCkVjEnwq/YGdMSNd/S4L+UKNxAaqQGRxOrsJDYgZQUD4acx8
         tDpw==
X-Forwarded-Encrypted: i=1; AJvYcCWGAIaoz7+eZgIHDYKnG97uIj9nzX8csq/BbGe0anZyYmCpjo2WpRgw4n+YJhCTEuZnImqwjan4YXhqdpf2bwfb@lists.infradead.org
X-Gm-Message-State: AOJu0YxLIoJNHnJwDgU2tzbWxnD9IMFGSCQiVUz0NNaDM5WqDzxeETHV
	dOJC9ZxS7L+3pEd6zOsjqQoBYhtxx6aexDJlrUirIMxB5Xp0X1bZQJujwkpL9MjNhAY=
X-Gm-Gg: AY/fxX7M45u50mcffb/xI/fjetnEBZQcKcaJJmSxQd/lMrgdmxEDROqQE6p/kEWbSrt
	z7w9d8HmXmlGW80p8B/I7Zq7O/cK7PXOSh9MZ9lEPoIpTwmvvRHxdCsaIkz6DFEFLj8p/buw6vC
	IjntHsZfaVLpQu6CtkmggHOWT+snHmpAHoqDbViRDymqYjIYJjpDykyG4swyYG6UVCX8zYWrsl5
	lmFVFwkmFPN7rkUsFaWHrAs2G4Cvu/xnv5gySdPExGjUq9tb7/kvwR5TfH1r5sg2XndWKV0pEUR
	iw3yyBr2KTDMTkBg56ErwxRXtvoIFTztSr62hKz6ONsSy4vqCfjODqFc565b3vUZaV1FqIKxS49
	a6HJQmRRVigCDq9sfFJ17/tYcBsg6kc51nqqqLeKD2CP848gfxnr/JG/YjpDYMyn2OqJVGmxzZb
	+mC9BhiyTxXpEATb0PUX/ulHMlWDpfWFw=
X-Google-Smtp-Source: AGHT+IH+XDMQ3rlxuM0Gvuwq8tNBEur+OrwI+FlxYWbuxE83bWivfEIsy6eHbB5jrKNX77vHoZIFOQ==
X-Received: by 2002:a05:600c:348a:b0:46e:1a5e:211 with SMTP id 5b1f17b1804b1-47d1958a755mr124164345e9.21.1766416493331;
        Mon, 22 Dec 2025 07:14:53 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea830fesm22750093f8f.20.2025.12.22.07.14.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 07:14:52 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Mon, 22 Dec 2025 15:14:31 +0000
Subject: [PATCH v4 06/14] perf evsel: apply evsel__set_config_if_unset() to
 all config fields
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251222-james-perf-config-bits-v4-6-0608438186fc@linaro.org>
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
X-CRM114-CacheID: sfid-20251222_071455_525962_AAEDAFD2 
X-CRM114-Status: GOOD (  20.77  )
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

Misleadingly, evsel__set_config_if_unset() only works with the config
field and not config1, config2, etc. This is fine at the moment because
all users of it happen to operate on bits that are in that config field.
Fix it before there are any new users of the function which operate on
bits in different config fields.

In theory it's also possible for a driver to move an existing bit to
another config field and this fixes that scenario too, although this
hasn't happened yet either.

Reviewed-by: Ian Rogers <irogers@google.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/util/evsel.c | 37 ++++++++++++++++++++++++++++++++++---
 tools/perf/util/pmu.c   | 29 ++---------------------------
 tools/perf/util/pmu.h   | 27 +++++++++++++++++++++++++++
 3 files changed, 63 insertions(+), 30 deletions(-)

diff --git a/tools/perf/util/evsel.c b/tools/perf/util/evsel.c
index 354e28e94523..b863096ed568 100644
--- a/tools/perf/util/evsel.c
+++ b/tools/perf/util/evsel.c
@@ -1330,8 +1330,39 @@ void evsel__set_config_if_unset(struct evsel *evsel, const char *config_name,
 				u64 val)
 {
 	u64 user_bits = 0, bits;
-	struct evsel_config_term *term = evsel__get_config_term(evsel,
-								USR_CHG_CONFIG);
+	struct evsel_config_term *term;
+	struct perf_pmu_format *format = pmu_find_format(&evsel->pmu->format,
+							 config_name);
+	__u64 *vp;
+
+	if (!format)
+		return;
+
+	switch (format->value) {
+	case PERF_PMU_FORMAT_VALUE_CONFIG:
+		term = evsel__get_config_term(evsel, USR_CHG_CONFIG);
+		vp = &evsel->core.attr.config;
+		break;
+	case PERF_PMU_FORMAT_VALUE_CONFIG1:
+		term = evsel__get_config_term(evsel, USR_CHG_CONFIG1);
+		vp = &evsel->core.attr.config1;
+		break;
+	case PERF_PMU_FORMAT_VALUE_CONFIG2:
+		term = evsel__get_config_term(evsel, USR_CHG_CONFIG2);
+		vp = &evsel->core.attr.config2;
+		break;
+	case PERF_PMU_FORMAT_VALUE_CONFIG3:
+		term = evsel__get_config_term(evsel, USR_CHG_CONFIG3);
+		vp = &evsel->core.attr.config3;
+		break;
+	case PERF_PMU_FORMAT_VALUE_CONFIG4:
+		term = evsel__get_config_term(evsel, USR_CHG_CONFIG4);
+		vp = &evsel->core.attr.config4;
+		break;
+	default:
+		pr_err("Unknown format value: %d\n", format->value);
+		return;
+	}
 
 	if (term)
 		user_bits = term->val.cfg_chg;
@@ -1343,7 +1374,7 @@ void evsel__set_config_if_unset(struct evsel *evsel, const char *config_name,
 		return;
 
 	/* Otherwise replace it */
-	pmu_format_value(&bits, val, &evsel->core.attr.config, /*zero=*/true);
+	pmu_format_value(&bits, val, vp, /*zero=*/true);
 }
 
 void __weak arch_evsel__set_sample_weight(struct evsel *evsel)
diff --git a/tools/perf/util/pmu.c b/tools/perf/util/pmu.c
index 2fe92b4b6e02..dc5dab69151f 100644
--- a/tools/perf/util/pmu.c
+++ b/tools/perf/util/pmu.c
@@ -118,31 +118,6 @@ struct perf_pmu_alias {
 	bool info_loaded;
 };
 
-/**
- * struct perf_pmu_format - Values from a format file read from
- * <sysfs>/devices/cpu/format/ held in struct perf_pmu.
- *
- * For example, the contents of <sysfs>/devices/cpu/format/event may be
- * "config:0-7" and will be represented here as name="event",
- * value=PERF_PMU_FORMAT_VALUE_CONFIG and bits 0 to 7 will be set.
- */
-struct perf_pmu_format {
-	/** @list: Element on list within struct perf_pmu. */
-	struct list_head list;
-	/** @bits: Which config bits are set by this format value. */
-	DECLARE_BITMAP(bits, PERF_PMU_FORMAT_BITS);
-	/** @name: The modifier/file name. */
-	char *name;
-	/**
-	 * @value : Which config value the format relates to. Supported values
-	 * are from PERF_PMU_FORMAT_VALUE_CONFIG to
-	 * PERF_PMU_FORMAT_VALUE_CONFIG_END.
-	 */
-	u16 value;
-	/** @loaded: Has the contents been loaded/parsed. */
-	bool loaded;
-};
-
 static int pmu_aliases_parse(struct perf_pmu *pmu);
 
 static struct perf_pmu_format *perf_pmu__new_format(struct list_head *list, char *name)
@@ -1362,8 +1337,8 @@ void perf_pmu__warn_invalid_formats(struct perf_pmu *pmu)
 	}
 }
 
-static struct perf_pmu_format *
-pmu_find_format(const struct list_head *formats, const char *name)
+struct perf_pmu_format *pmu_find_format(const struct list_head *formats,
+					const char *name)
 {
 	struct perf_pmu_format *format;
 
diff --git a/tools/perf/util/pmu.h b/tools/perf/util/pmu.h
index 7bf5b23d0ea1..7655d996090a 100644
--- a/tools/perf/util/pmu.h
+++ b/tools/perf/util/pmu.h
@@ -233,6 +233,31 @@ struct pmu_event_info {
 	bool deprecated;
 };
 
+/**
+ * struct perf_pmu_format - Values from a format file read from
+ * <sysfs>/devices/cpu/format/ held in struct perf_pmu.
+ *
+ * For example, the contents of <sysfs>/devices/cpu/format/event may be
+ * "config:0-7" and will be represented here as name="event",
+ * value=PERF_PMU_FORMAT_VALUE_CONFIG and bits 0 to 7 will be set.
+ */
+struct perf_pmu_format {
+	/** @list: Element on list within struct perf_pmu. */
+	struct list_head list;
+	/** @bits: Which config bits are set by this format value. */
+	DECLARE_BITMAP(bits, PERF_PMU_FORMAT_BITS);
+	/** @name: The modifier/file name. */
+	char *name;
+	/**
+	 * @value : Which config value the format relates to. Supported values
+	 * are from PERF_PMU_FORMAT_VALUE_CONFIG to
+	 * PERF_PMU_FORMAT_VALUE_CONFIG_END.
+	 */
+	u16 value;
+	/** @loaded: Has the contents been loaded/parsed. */
+	bool loaded;
+};
+
 typedef int (*pmu_event_callback)(void *state, struct pmu_event_info *info);
 typedef int (*pmu_format_callback)(void *state, const char *name, int config,
 				   const unsigned long *bits);
@@ -255,6 +280,8 @@ int perf_pmu__check_alias(struct perf_pmu *pmu, struct parse_events_terms *head_
 int perf_pmu__find_event(struct perf_pmu *pmu, const char *event, void *state, pmu_event_callback cb);
 
 void pmu_format_value(unsigned long *format, __u64 value, __u64 *v, bool zero);
+struct perf_pmu_format *pmu_find_format(const struct list_head *formats,
+					const char *name);
 void perf_pmu_format__set_value(void *format, int config, unsigned long *bits);
 bool perf_pmu__has_format(const struct perf_pmu *pmu, const char *name);
 int perf_pmu__for_each_format(struct perf_pmu *pmu, void *state, pmu_format_callback cb);

-- 
2.34.1


