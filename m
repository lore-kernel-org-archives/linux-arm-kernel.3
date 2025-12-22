Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2A2DE674B5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Dec 2025 15:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Dusq4givPs/+MmVLybQAr0PfVhdx73n3zpPLiMfCBqA=; b=E+XSeIIJEOyRkb3yWOYtg4F3dQ
	wmeFYMOwmbhOcvd3v/GvoNfsGZ+pwL81/bNsWo4hkstMVmBeAAL+24M8hroOHJD59P28cj3rFRGGP
	krGQCYzCfzAPIodoSS/bsgeY/HQ6YScYF4B8CUpJXZ9P7qwYjhMdF8h8m4YAgtPOEAMUDxbDBRTbl
	3oIwGpC/qzFummg5bkjwLUS83ss+/TwRKnMeqo1A9OUe/MCbMlJckRQYYdcVVrQLPZW+nrv9g0va/
	TlIuLyUnQZf1rc4W5cObeeuvA69fNZFYFALCJMR2gp0G0rgn/i5QJXuajNWQH4wS+RgoAs9iZPeZ5
	EwurELOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXhct-0000000DttF-1bR4;
	Mon, 22 Dec 2025 15:15:11 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXhce-0000000Dti2-2QN8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Dec 2025 15:14:57 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-42fb2314eb0so3081452f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Dec 2025 07:14:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766416494; x=1767021294; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dusq4givPs/+MmVLybQAr0PfVhdx73n3zpPLiMfCBqA=;
        b=fJBS7urxtrz7wJD12kqiJSeZS/zDNNHPTC3v2v9NLWK3saHkZaOC5r8jD66c7VNRI4
         MWA7tF+R3nE94Lbv6BeGpnLr40FqMMOw9DQFYQpkCorU9JifhJSMgz+79qjxAG7mu+qu
         z1FCcWRuRj2M6SgSsIp1QuLCzyFkXGm/hsKKxxB/YSRtrhGdLBtfo0seY9VODW0lS/Ij
         xyK7/RTzoURTpsLX7jyKvsaMja4J7QlRTdvZykg+uwZw4IwPgBXyFCei625cW4trsmQT
         +alKCcL1Nz6ugoky7mqIz2AuQfEnzf6D3pvN3sNh9DKBm/9ykTNOAGOIWvw62BDqy7Oc
         tctQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766416494; x=1767021294;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Dusq4givPs/+MmVLybQAr0PfVhdx73n3zpPLiMfCBqA=;
        b=YwU/ax8bfmqY6Kj7iJO2dk7ldNXC9ry+hrATBOW1E7/zAjPXNJdUXTIDkLLSWuRnPm
         apZunkNljIGu5p8C1Tt+TzElOCHC30pagGHTRnsIpACViTFgnYpfTuTJE3CALeWCWeR+
         7Pa1SM4gPD8Cfon4MBF/8FYJ4r2ywpX0D/+/cbrEmxJgGw2ZePTdmmBKYgTE2xk3qweX
         5m3epsRkBPrwNSYUsm6bMxImoEN/L3yxof2GbfJIybFeIqWUr7foK5vPze0ga/jJWRT3
         Vi6fT0wW0BlcJuDZMkVHOTaehm7pnPVxR8iOr30F/V6NadFzCcaFrKyzV+lSXB5qT54H
         BhoQ==
X-Forwarded-Encrypted: i=1; AJvYcCWQKcNpSNxLKSTPn/xI5plam6Wi8yDz2UgUgI+7c3mdDEET3AucYqpvWFI24xS04byuIwVrVUTVPwHKKhEcmIb5@lists.infradead.org
X-Gm-Message-State: AOJu0YyFDcB9I3U83wD7r4mkD0nvoj+8MWd4DrDN1rt7m4vEjxqJqcpp
	LGfChyqlpkPMsD5+rMdthYV/izxIpnHhqrsoGb5C+qgaX8YE/k1VCjLdXzQygzmv9Xs=
X-Gm-Gg: AY/fxX5VlQGHHzz9GTxvk5TRT6Fy6BW0Gp8Y24HxieKBLayGNcz1kY543NOkcObUR3F
	Jzu+1cJSte/CSGT0TsHzX2VT4wqLau4sv0KtngTBH000Fja4ZqrodrEF/yQr2D7FAREotBOj+zh
	2DBVBiyigvh5arPJxtQYU6PBdlaT+YX9B+JDx/UPlinAHFfJVlltkKxV7rVuILjGWVS4FMva7qm
	99vJUrDkabh6P2z9bQ/y2Nhmtj453TrHqLnUbcF2NbLD1RNSZvQHEd3ATEtMaerinI0FELwI6qg
	volz9AvFedeNJEm+9t6XsCPy++vHR5BdzvOFdZCMpRPP7va87Uzg9FrrR7OkM/Nqk9neracSkLH
	GCNU9WrjIsTDZE0XrCCxMPzD0DY2KCzBMfX5VLnqsLYmgtGkRnSTR3y22pVyRpKY2OCrUqcq/10
	oFuipYLooPRKwJS5uzSCUW
X-Google-Smtp-Source: AGHT+IH25mEFFoPaM1cwim0haHxibCkaTMRRATJLhfsMoJuUgN3vVuqjq2nokfYWDZpCL4mdVJFaag==
X-Received: by 2002:a05:6000:26d2:b0:430:fc5a:40ac with SMTP id ffacd0b85a97d-4324e70413emr14627279f8f.54.1766416494435;
        Mon, 22 Dec 2025 07:14:54 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea830fesm22750093f8f.20.2025.12.22.07.14.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 07:14:54 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Mon, 22 Dec 2025 15:14:32 +0000
Subject: [PATCH v4 07/14] perf evsel: Add a helper to get the value of a
 config field
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251222-james-perf-config-bits-v4-7-0608438186fc@linaro.org>
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
X-CRM114-CacheID: sfid-20251222_071456_666346_4234E2A5 
X-CRM114-Status: GOOD (  19.79  )
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
 tools/perf/util/evsel.c | 38 +++++++++++++++++++++++++++++++++++++-
 tools/perf/util/evsel.h |  2 ++
 tools/perf/util/pmu.c   | 35 ++++++++++++++++++++++++++++-------
 tools/perf/util/pmu.h   |  4 +++-
 4 files changed, 70 insertions(+), 9 deletions(-)

diff --git a/tools/perf/util/evsel.c b/tools/perf/util/evsel.c
index b863096ed568..703a6f73d468 100644
--- a/tools/perf/util/evsel.c
+++ b/tools/perf/util/evsel.c
@@ -1374,7 +1374,43 @@ void evsel__set_config_if_unset(struct evsel *evsel, const char *config_name,
 		return;
 
 	/* Otherwise replace it */
-	pmu_format_value(&bits, val, vp, /*zero=*/true);
+	perf_pmu__format_pack(&bits, val, vp, /*zero=*/true);
+}
+
+
+int evsel__get_config_val(const struct evsel *evsel, const char *config_name,
+			  u64 *val)
+{
+	struct perf_pmu_format *format = pmu_find_format(&evsel->pmu->format, config_name);
+	u64 bits = perf_pmu__format_bits(evsel->pmu, config_name);
+
+	if (!format || !bits) {
+		pr_err("Unknown/empty format name: %s\n", config_name);
+		*val = 0;
+		return -EINVAL;
+	}
+
+	switch (format->value) {
+	case PERF_PMU_FORMAT_VALUE_CONFIG:
+		*val = perf_pmu__format_unpack(bits, evsel->core.attr.config);
+		return 0;
+	case PERF_PMU_FORMAT_VALUE_CONFIG1:
+		*val = perf_pmu__format_unpack(bits, evsel->core.attr.config1);
+		return 0;
+	case PERF_PMU_FORMAT_VALUE_CONFIG2:
+		*val = perf_pmu__format_unpack(bits, evsel->core.attr.config2);
+		return 0;
+	case PERF_PMU_FORMAT_VALUE_CONFIG3:
+		*val = perf_pmu__format_unpack(bits, evsel->core.attr.config3);
+		return 0;
+	case PERF_PMU_FORMAT_VALUE_CONFIG4:
+		*val = perf_pmu__format_unpack(bits, evsel->core.attr.config4);
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
index dc5dab69151f..626c7307c8a3 100644
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
+u64 perf_pmu__format_unpack(u64 format, u64 config_val)
+{
+	int val_bit = 0;
+	u64 res = 0;
+	int fmt_bit;
+
+	for_each_set_bit(fmt_bit, &format, PERF_PMU_FORMAT_BITS) {
+		if (test_bit(fmt_bit, &config_val))
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
index 7655d996090a..a1255b3a8f91 100644
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
+u64 perf_pmu__format_unpack(u64 format, u64 config_val);
 
 bool is_pmu_core(const char *name);
 bool perf_pmu__supports_legacy_cache(const struct perf_pmu *pmu);

-- 
2.34.1


