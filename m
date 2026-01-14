Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4C6ED37E59
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 15:58:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OmYihNLb0KLD+tzX8PoHToNOa0/csgr96GD3/RY6Ics=; b=B0W2IEGmwMxBft45qxrz9o1FRC
	7/wc904+ephrb9WFpjIJqhCf/MldZkTSLiIxLnlw76+pjqttHETv9A1gBnpV8aiCH2ejcdZpI+Qgm
	5vZwPDuLWs11ehPJ/wnWfE9mnUaJNwbNdCIxLNT5S1pcStF5sRqdt/3EKalSDa9a06dGyCZGePIew
	JCnMjCyRyTyZK/cA3zYjCzDTC9rw6gXMwEh8rIGlEXOtrf96/nfLwHyGZMren5+ZeOO/dLEuXmf29
	JUM/M7UhZFK/hsld1go4AiqLj2VEgLcxoVsvS3LdEWzs0u7d2e60eSZrpT1LucaDWloMsA/ia0aAm
	hmu50zsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg3Ft-00000009oGB-3HSk;
	Wed, 14 Jan 2026 15:57:57 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg3Fj-00000009o5I-46H2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 15:57:50 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-47ee3da7447so6305e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Jan 2026 07:57:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768406266; x=1769011066; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OmYihNLb0KLD+tzX8PoHToNOa0/csgr96GD3/RY6Ics=;
        b=YCwkcpymIE+Az0XN9CKZufTMGnAEMUAWoi2uFqjGJiQyfjHqJ3XEZXQiZDI70Lnmaz
         md3HMMqC5hWk6qr50U0oLtRgryOdAcxMlMuAbfU++xILbPAEn0wwIs4MNnqzZbnAralQ
         4ddZ39dSPgEzxPB/DzAtUh2FqaR5YV1FxVEwthixRz4UEnZYeBtMUcKLgK9W4uXddKlR
         +Tt0bm8epV+Gatf43ijJGZaAvQlO6jdsSz4SRC1GFWHpM2P8UVYokpc2y52qDDAOAMAx
         xC2CVOEs52vLgWZRIhLWUKW8RQaIIUuJb3pPh8y26DYzZ9ZpRdfm7PSCN2nOX734OBRU
         y6qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768406266; x=1769011066;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OmYihNLb0KLD+tzX8PoHToNOa0/csgr96GD3/RY6Ics=;
        b=vz2x/YoFG2TbcJnXcZ5xqrQ3bQmslX/t+PSkYGlJzHg5x/JdcySpsFSFrWOot/UkCR
         OgMwgk8KGnzzWbk2703bGkWr+/Whk596Uu6aF5aHzXg5Y+8ooCA2CaHbWp6U0E/zifcK
         kz+iNiEQiwv/nQbDi+CyidAYl6AETOz0kkylkwocVeu58jn1upJTRSYBEiNJD3NmkSbH
         LX3YdMOKDkrsj1iYNcS9Ek2EILmWwclxL1PMkx54IiiGihv6jvz4Z1SNpMiiuxiHdCJx
         joiWbktQfpqCoMry/Jv+vp6DWQBkNnwtysrC5hE8Vg6okZF0XAmB11Ukzm0EicFD6EUr
         /lpg==
X-Forwarded-Encrypted: i=1; AJvYcCWMpePoVyTxhLG9imnqzAgep+ZzXfQdlsENsz+iO1DUMOjWwjdVGj17hL9hRwZglV6Y0vAx14Ni1P5ZluYOde80@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/+schRGbksCJ/ti7UgaYNiD4I/cRk0dh7z7tVLBrtPf9d73Tw
	JXhfF5uw/ebVkRgFHGl3xI02IZcb7ojGWNaCB/l8UiX5gcG0N8l2ARMGIlF65eszhL9LKQs0Do8
	AWFYG
X-Gm-Gg: AY/fxX6bcrrTBfbUZWtPtEFr5g72nXRBAm99YZth18mj+rL7IFOqesO/VYS7JbSJ44Y
	nk/C6EIa2maxeVmFTUbzVovx4/xPVBPQPIeBN6H1NfGWqPzOVG2sVXWBv1GF9UsX5HyU1VeKAPI
	wNB1wBK5J15ETnhWqv5XzwMAktyzSvHm5UBnb4s0fLtZicjBZ6FvqJ/bYXHdIIEONNJvcM+kfxz
	hP0xSnRiDTrXinpUl8X9n/od/el4/XE8tmP7kC7f4Mjj8QxJpaP9aWnBlW3KhBikkauz+MwchWm
	ObbF2M/hROfflYkgGjkPZpvEen3s7uTRhLOktUfgaCFl1Nz965t32lNKsySDWHWxDMCXQuHB1zQ
	HZoi9Ju+2Rxw+uQoMOdwQl7wTGLkdKnzV4+ka9ZbnrX4EJcmx102ddJlbL3pu7X1RYbSMdsio64
	8NQLH9yad0408DyzJuMimS
X-Received: by 2002:a05:600c:4f0b:b0:477:c71:1fc1 with SMTP id 5b1f17b1804b1-47ee4819f30mr30484755e9.19.1768406266018;
        Wed, 14 Jan 2026 07:57:46 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47ee85e8807sm7426475e9.16.2026.01.14.07.57.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 07:57:45 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Wed, 14 Jan 2026 15:57:19 +0000
Subject: [PATCH v5 07/14] perf evsel: Add a helper to get the value of a
 config field
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260114-james-perf-config-bits-v5-7-0ef97aaf1ac0@linaro.org>
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
X-CRM114-CacheID: sfid-20260114_075748_808293_93395885 
X-CRM114-Status: GOOD (  19.42  )
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

This will be used by aux PMUs to read an already written value for
configuring their events and for also testing.

Its helper perf_pmu__format_unpack() does the opposite of the existing
pmu_format_value() so rename that one to perf_pmu__format_pack() so it's
clear how they are related.

Reviewed-by: Ian Rogers <irogers@google.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/util/evsel.c | 42 +++++++++++++++++++++++++++++++++++++++++-
 tools/perf/util/evsel.h |  2 ++
 tools/perf/util/pmu.c   | 35 ++++++++++++++++++++++++++++-------
 tools/perf/util/pmu.h   |  4 +++-
 4 files changed, 74 insertions(+), 9 deletions(-)

diff --git a/tools/perf/util/evsel.c b/tools/perf/util/evsel.c
index 3162bfc0ccfe..ec74dce3211c 100644
--- a/tools/perf/util/evsel.c
+++ b/tools/perf/util/evsel.c
@@ -1378,7 +1378,47 @@ void evsel__set_config_if_unset(struct evsel *evsel, const char *config_name,
 			return;
 
 	/* Otherwise replace it */
-	pmu_format_value(format->bits, val, vp, /*zero=*/true);
+	perf_pmu__format_pack(format->bits, val, vp, /*zero=*/true);
+}
+
+
+int evsel__get_config_val(const struct evsel *evsel, const char *config_name,
+			  u64 *val)
+{
+	struct perf_pmu_format *format = pmu_find_format(&evsel->pmu->format, config_name);
+
+	if (!format || bitmap_empty(format->bits, PERF_PMU_FORMAT_BITS)) {
+		pr_err("Unknown/empty format name: %s\n", config_name);
+		*val = 0;
+		return -EINVAL;
+	}
+
+	switch (format->value) {
+	case PERF_PMU_FORMAT_VALUE_CONFIG:
+		*val = perf_pmu__format_unpack(format->bits,
+					       evsel->core.attr.config);
+		return 0;
+	case PERF_PMU_FORMAT_VALUE_CONFIG1:
+		*val = perf_pmu__format_unpack(format->bits,
+					       evsel->core.attr.config1);
+		return 0;
+	case PERF_PMU_FORMAT_VALUE_CONFIG2:
+		*val = perf_pmu__format_unpack(format->bits,
+					       evsel->core.attr.config2);
+		return 0;
+	case PERF_PMU_FORMAT_VALUE_CONFIG3:
+		*val = perf_pmu__format_unpack(format->bits,
+					       evsel->core.attr.config3);
+		return 0;
+	case PERF_PMU_FORMAT_VALUE_CONFIG4:
+		*val = perf_pmu__format_unpack(format->bits,
+					       evsel->core.attr.config4);
+		return 0;
+	default:
+		pr_err("Unknown format value: %d\n", format->value);
+		*val = 0;
+		return -EINVAL;
+	}
 }
 
 void __weak arch_evsel__set_sample_weight(struct evsel *evsel)
diff --git a/tools/perf/util/evsel.h b/tools/perf/util/evsel.h
index 2cf87bc67df7..95c4bd0f0f2e 100644
--- a/tools/perf/util/evsel.h
+++ b/tools/perf/util/evsel.h
@@ -575,6 +575,8 @@ void evsel__uniquify_counter(struct evsel *counter);
 	((((src) >> (pos)) & ((1ull << (size)) - 1)) << (63 - ((pos) + (size) - 1)))
 
 u64 evsel__bitfield_swap_branch_flags(u64 value);
+int evsel__get_config_val(const struct evsel *evsel, const char *config_name,
+			  u64 *val);
 void evsel__set_config_if_unset(struct evsel *evsel, const char *config_name,
 				u64 val);
 
diff --git a/tools/perf/util/pmu.c b/tools/perf/util/pmu.c
index dc5dab69151f..bb399a47d2b4 100644
--- a/tools/perf/util/pmu.c
+++ b/tools/perf/util/pmu.c
@@ -1337,6 +1337,26 @@ void perf_pmu__warn_invalid_formats(struct perf_pmu *pmu)
 	}
 }
 
+/*
+ * Unpacks a raw config[n] value using the sparse bitfield that defines a
+ * format attr. For example "config1:1,6-7,44" defines a 4 bit value across non
+ * contiguous bits and this function returns those 4 bits as a value.
+ */
+u64 perf_pmu__format_unpack(unsigned long *format, u64 config_val)
+{
+	int val_bit = 0;
+	u64 res = 0;
+	int fmt_bit;
+
+	for_each_set_bit(fmt_bit, format, PERF_PMU_FORMAT_BITS) {
+		if (config_val & (1ULL << fmt_bit))
+			res |= BIT_ULL(val_bit);
+
+		val_bit++;
+	}
+	return res;
+}
+
 struct perf_pmu_format *pmu_find_format(const struct list_head *formats,
 					const char *name)
 {
@@ -1379,7 +1399,8 @@ int perf_pmu__format_type(const struct perf_pmu *pmu, const char *name)
  * Sets value based on the format definition (format parameter)
  * and unformatted value (value parameter).
  */
-void pmu_format_value(unsigned long *format, __u64 value, __u64 *v, bool zero)
+void perf_pmu__format_pack(unsigned long *format, __u64 value, __u64 *v,
+			   bool zero)
 {
 	unsigned long fbit, vbit;
 
@@ -1496,23 +1517,23 @@ static int pmu_config_term(const struct perf_pmu *pmu,
 		switch (term->type_term) {
 		case PARSE_EVENTS__TERM_TYPE_CONFIG:
 			assert(term->type_val == PARSE_EVENTS__TERM_TYPE_NUM);
-			pmu_format_value(bits, term->val.num, &attr->config, zero);
+			perf_pmu__format_pack(bits, term->val.num, &attr->config, zero);
 			break;
 		case PARSE_EVENTS__TERM_TYPE_CONFIG1:
 			assert(term->type_val == PARSE_EVENTS__TERM_TYPE_NUM);
-			pmu_format_value(bits, term->val.num, &attr->config1, zero);
+			perf_pmu__format_pack(bits, term->val.num, &attr->config1, zero);
 			break;
 		case PARSE_EVENTS__TERM_TYPE_CONFIG2:
 			assert(term->type_val == PARSE_EVENTS__TERM_TYPE_NUM);
-			pmu_format_value(bits, term->val.num, &attr->config2, zero);
+			perf_pmu__format_pack(bits, term->val.num, &attr->config2, zero);
 			break;
 		case PARSE_EVENTS__TERM_TYPE_CONFIG3:
 			assert(term->type_val == PARSE_EVENTS__TERM_TYPE_NUM);
-			pmu_format_value(bits, term->val.num, &attr->config3, zero);
+			perf_pmu__format_pack(bits, term->val.num, &attr->config3, zero);
 			break;
 		case PARSE_EVENTS__TERM_TYPE_CONFIG4:
 			assert(term->type_val == PARSE_EVENTS__TERM_TYPE_NUM);
-			pmu_format_value(bits, term->val.num, &attr->config4, zero);
+			perf_pmu__format_pack(bits, term->val.num, &attr->config4, zero);
 			break;
 		case PARSE_EVENTS__TERM_TYPE_LEGACY_HARDWARE_CONFIG:
 			assert(term->type_val == PARSE_EVENTS__TERM_TYPE_NUM);
@@ -1650,7 +1671,7 @@ static int pmu_config_term(const struct perf_pmu *pmu,
 		 */
 	}
 
-	pmu_format_value(format->bits, val, vp, zero);
+	perf_pmu__format_pack(format->bits, val, vp, zero);
 	return 0;
 }
 
diff --git a/tools/perf/util/pmu.h b/tools/perf/util/pmu.h
index 7655d996090a..7ef90b54a149 100644
--- a/tools/perf/util/pmu.h
+++ b/tools/perf/util/pmu.h
@@ -279,12 +279,14 @@ int perf_pmu__check_alias(struct perf_pmu *pmu, struct parse_events_terms *head_
 			  u64 *alternate_hw_config, struct parse_events_error *err);
 int perf_pmu__find_event(struct perf_pmu *pmu, const char *event, void *state, pmu_event_callback cb);
 
-void pmu_format_value(unsigned long *format, __u64 value, __u64 *v, bool zero);
+void perf_pmu__format_pack(unsigned long *format, __u64 value, __u64 *v,
+			   bool zero);
 struct perf_pmu_format *pmu_find_format(const struct list_head *formats,
 					const char *name);
 void perf_pmu_format__set_value(void *format, int config, unsigned long *bits);
 bool perf_pmu__has_format(const struct perf_pmu *pmu, const char *name);
 int perf_pmu__for_each_format(struct perf_pmu *pmu, void *state, pmu_format_callback cb);
+u64 perf_pmu__format_unpack(unsigned long *format, u64 config_val);
 
 bool is_pmu_core(const char *name);
 bool perf_pmu__supports_legacy_cache(const struct perf_pmu *pmu);

-- 
2.34.1


