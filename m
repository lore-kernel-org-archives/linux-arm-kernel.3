Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A96C7D3B7F4
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Dec 2025 14:23:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y0SkqXfoDch2Crrep+7q41phmdji29dr3SE6FUuXCaY=; b=092x6CwTYFfuvemxGcwQ94cml9
	O/hPPtPujVmz9ELR0DjW0BaP/tAuuBu/dafCcpD1G2cAVm27AxEfnSlObsWfaBsEw0iZd8lr5k5e4
	ABBeNDvJ9ZnPWkgotii4wcuItQaNV4J+MdOrNNv8bA5gpSehBLWY4uiHQbvDtyBLPdFHrwgoU5j/8
	og5aCq2U1sPtfSbwH9rBXGFC4qEfZ4ofHNlLlTIh1yAIVREvJSM1txGC0vEMOno7nvwCuoyJl6pkq
	vW8HGq7igDounS2gL0qtcmfdrSBYHII8i3CNH//kTKlyyrPvwOfHZ4op0pVWlK9tPmlUArY4LSjIL
	kkUNImLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSc9C-0000000DB84-1ajJ;
	Mon, 08 Dec 2025 14:23:30 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSc97-0000000DB4B-3ki5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Dec 2025 14:23:27 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-477b91680f8so50577465e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Dec 2025 06:23:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765203804; x=1765808604; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y0SkqXfoDch2Crrep+7q41phmdji29dr3SE6FUuXCaY=;
        b=siSfNxaK9Cd/JMgdg6ZcC3lca0dbmAhv42e9AAeo7eh+a02KBGPIG0lRXv6HwLZHxO
         N6OGKFxs74rmkurJp0r9UId36+KNed+d6IbCh37BWS+xbKVhAfoDR5ZqMRoowEkeFYTa
         zA2s4T9//4Qnph6LwoPAKiVDqPF9HiXiYAUkoDzQfySSDH4+AXJChRk1RYs4xGq4tASv
         5Cv3sATx3ZyMDBjhT4VPHrDpO9KK/qxe/WmhBfBiXKt60GrTZdkE8d2Ee3SJi7RnGg/n
         QGmCyT7bHlhx0bLelu2ydkZeelPF920L4oOSDcvLAB4nzkNhmYc8SUda/nFl8zpe/7hR
         GZdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765203804; x=1765808604;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Y0SkqXfoDch2Crrep+7q41phmdji29dr3SE6FUuXCaY=;
        b=Nkkkg26bNPz4qTNsIXVxrwq1CWFxg5tAtoDbI8cwtmINMKAFZnSwccECTXOH0wTh1q
         mWNP44wUiseXwY6GlXYVkGpQixRr2uJHSzX4xQCyxYV/EW11STwh5USS/gqAVv2DvcU/
         ofCu3XGQwW8FPLLw9BLzVjtbicEX9zL692bfOxaxGHs01Y798DNnCVeBaDLoGBhiUT/E
         Acc9C/Eu/iJWIxSTAfLd8Nsl3mJCW3yOF3hHwCDgsUBivGhR/jWFHepF7/n2ucOQRJO7
         b5oRj6h9EFUAw98pbenp2co2Ob2bCnx9T0s8vaZ/JvU0yrnmOk2wWyOpd8QxDT17YyDh
         xBhw==
X-Forwarded-Encrypted: i=1; AJvYcCWZ5N3bNJBTNmrbjgWScaqU7QEcSnbTu0uUAM2C9AMxaGyt9REeav60iQg3744MMPo1BwZl1V+TLWXE8jFl6QXW@lists.infradead.org
X-Gm-Message-State: AOJu0YxJqfjdsM2gKc6RXhG5XEYzceHUmj8U+CVhWP3w634DaiAkT4Vx
	3tSZFftsRtMx+TQAq9ULMKYIrvdK2kSnfnIDuvUKhoCOpyutIKKOgfWG4NG8viV8kDbn5HvplL7
	4Yqx9
X-Gm-Gg: ASbGncudg8i+qQeiEGHEECRb0DTHHft2bl1fpIVdEOaTBjbX/RxENksYEC/tLAUlbCb
	sUw/LKlda7L/g1qbFOY115ql7qdcXkk1fgZJk2KR60rGDO6sRbms/VTYIkZPwKYRqVjQMBD7KIV
	pJwFWS/LGz18r2yPg1BvK13uFqkmh7vVG+A6HAkcadyXWJM/gAch3JlFVDs0t//JI01wTY/zS85
	7KUqoGo9+h2iVF2ykvyhvGS/HiOKPlR+/+tOjczTLuDEv2gDOCh8lc+RXSSlA+GFyzzGbQsYSq3
	nnhUh4UCgPIgT0sXeU+1VHAkT8Sd5jFZmRd+8RLK6H9uaddtSYS6+Y71nmsvCnCY/XlQIr+EACr
	qVsAmMU8ozkC+pLrPd/FP8h+FjZ1gIDthafPqQ2iGE87tZt5H+0mC3ieVhaDk3Uh89CCVc+7Mca
	kNIRaHzohG/QO6xhm6z3Nk
X-Google-Smtp-Source: AGHT+IHwhLKOnPQJeWTWX0qTh2VoeWymbnjL3OsZC8/GHM1ActCoWHWUVxRUFsk4tnHyrFVHMqEDIg==
X-Received: by 2002:a05:600c:3e8c:b0:475:d8b3:a9d5 with SMTP id 5b1f17b1804b1-47939dfa460mr81661905e9.10.1765203804015;
        Mon, 08 Dec 2025 06:23:24 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47930920e0dsm248561065e9.2.2025.12.08.06.23.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Dec 2025 06:23:23 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Mon, 08 Dec 2025 14:22:08 +0000
Subject: [PATCH v2 05/12] perf evsel: Add a helper to get the value of a
 config field
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251208-james-perf-config-bits-v2-5-4ac0281993b0@linaro.org>
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
X-CRM114-CacheID: sfid-20251208_062326_060218_294E0839 
X-CRM114-Status: GOOD (  21.92  )
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

Its helper pmu_format_unpack() does the opposite of the existing
pmu_format_value() so rename that one to pmu_format_pack() so it's clear
how they are related.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/util/evsel.h |  2 ++
 tools/perf/util/pmu.c   | 77 ++++++++++++++++++++++++++++++++++++++++++-------
 2 files changed, 68 insertions(+), 11 deletions(-)

diff --git a/tools/perf/util/evsel.h b/tools/perf/util/evsel.h
index a08130ff2e47..092904a61ec7 100644
--- a/tools/perf/util/evsel.h
+++ b/tools/perf/util/evsel.h
@@ -575,6 +575,8 @@ void evsel__uniquify_counter(struct evsel *counter);
 	((((src) >> (pos)) & ((1ull << (size)) - 1)) << (63 - ((pos) + (size) - 1)))
 
 u64 evsel__bitfield_swap_branch_flags(u64 value);
+int evsel__get_config_val(struct perf_pmu *pmu, struct evsel *evsel,
+			  const char *config_name, u64 *val);
 void evsel__set_config_if_unset(struct perf_pmu *pmu, struct evsel *evsel,
 				const char *config_name, u64 val);
 
diff --git a/tools/perf/util/pmu.c b/tools/perf/util/pmu.c
index 514cba91f5d9..ef7358ad1fb9 100644
--- a/tools/perf/util/pmu.c
+++ b/tools/perf/util/pmu.c
@@ -144,8 +144,8 @@ struct perf_pmu_format {
 };
 
 static int pmu_aliases_parse(struct perf_pmu *pmu);
-static void pmu_format_value(unsigned long *format, __u64 value, __u64 *v,
-			     bool zero);
+static void pmu_format_pack(unsigned long *format, __u64 value, __u64 *v,
+			    bool zero);
 static struct perf_pmu_format *pmu_find_format(const struct list_head *formats,
 					       const char *name);
 
@@ -1377,6 +1377,61 @@ bool evsel__is_aux_event(const struct evsel *evsel)
 	return pmu && pmu->auxtrace;
 }
 
+/*
+ * Unpacks a raw config[n] value using the sparse bitfield that defines a
+ * format attr. For example "config1:1,6-7,44" defines a 4 bit value across non
+ * contiguous bits and this function returns those 4 bits as a value.
+ */
+static u64 pmu_format_unpack(u64 format, u64 config_val)
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
+int evsel__get_config_val(struct perf_pmu *pmu, struct evsel *evsel,
+			  const char *config_name, u64 *val)
+{
+	struct perf_pmu_format *format = pmu_find_format(&pmu->format, config_name);
+	u64 bits = perf_pmu__format_bits(pmu, config_name);
+
+	if (!format || !bits) {
+		pr_err("Unknown/empty format name: %s\n", config_name);
+		*val = 0;
+		return -EINVAL;
+	}
+
+	switch (format->value) {
+	case PERF_PMU_FORMAT_VALUE_CONFIG:
+		*val = pmu_format_unpack(bits, evsel->core.attr.config);
+		return 0;
+	case PERF_PMU_FORMAT_VALUE_CONFIG1:
+		*val = pmu_format_unpack(bits, evsel->core.attr.config1);
+		return 0;
+	case PERF_PMU_FORMAT_VALUE_CONFIG2:
+		*val = pmu_format_unpack(bits, evsel->core.attr.config2);
+		return 0;
+	case PERF_PMU_FORMAT_VALUE_CONFIG3:
+		*val = pmu_format_unpack(bits, evsel->core.attr.config3);
+		return 0;
+	case PERF_PMU_FORMAT_VALUE_CONFIG4:
+		*val = pmu_format_unpack(bits, evsel->core.attr.config4);
+		return 0;
+	default:
+		pr_err("Unknown format value: %d\n", format->value);
+		*val = 0;
+		return -EINVAL;
+	}
+}
+
 /*
  * Set @config_name to @val as long as the user hasn't already set or cleared it
  * by passing a config term on the command line.
@@ -1432,7 +1487,7 @@ void evsel__set_config_if_unset(struct perf_pmu *pmu, struct evsel *evsel,
 		return;
 
 	/* Otherwise replace it */
-	pmu_format_value(&bits, val, vp, /*zero=*/true);
+	pmu_format_pack(&bits, val, vp, /*zero=*/true);
 }
 
 static struct perf_pmu_format *
@@ -1477,8 +1532,8 @@ int perf_pmu__format_type(struct perf_pmu *pmu, const char *name)
  * Sets value based on the format definition (format parameter)
  * and unformatted value (value parameter).
  */
-static void pmu_format_value(unsigned long *format, __u64 value, __u64 *v,
-			     bool zero)
+static void pmu_format_pack(unsigned long *format, __u64 value, __u64 *v,
+			    bool zero)
 {
 	unsigned long fbit, vbit;
 
@@ -1595,23 +1650,23 @@ static int pmu_config_term(const struct perf_pmu *pmu,
 		switch (term->type_term) {
 		case PARSE_EVENTS__TERM_TYPE_CONFIG:
 			assert(term->type_val == PARSE_EVENTS__TERM_TYPE_NUM);
-			pmu_format_value(bits, term->val.num, &attr->config, zero);
+			pmu_format_pack(bits, term->val.num, &attr->config, zero);
 			break;
 		case PARSE_EVENTS__TERM_TYPE_CONFIG1:
 			assert(term->type_val == PARSE_EVENTS__TERM_TYPE_NUM);
-			pmu_format_value(bits, term->val.num, &attr->config1, zero);
+			pmu_format_pack(bits, term->val.num, &attr->config1, zero);
 			break;
 		case PARSE_EVENTS__TERM_TYPE_CONFIG2:
 			assert(term->type_val == PARSE_EVENTS__TERM_TYPE_NUM);
-			pmu_format_value(bits, term->val.num, &attr->config2, zero);
+			pmu_format_pack(bits, term->val.num, &attr->config2, zero);
 			break;
 		case PARSE_EVENTS__TERM_TYPE_CONFIG3:
 			assert(term->type_val == PARSE_EVENTS__TERM_TYPE_NUM);
-			pmu_format_value(bits, term->val.num, &attr->config3, zero);
+			pmu_format_pack(bits, term->val.num, &attr->config3, zero);
 			break;
 		case PARSE_EVENTS__TERM_TYPE_CONFIG4:
 			assert(term->type_val == PARSE_EVENTS__TERM_TYPE_NUM);
-			pmu_format_value(bits, term->val.num, &attr->config4, zero);
+			pmu_format_pack(bits, term->val.num, &attr->config4, zero);
 			break;
 		case PARSE_EVENTS__TERM_TYPE_LEGACY_HARDWARE_CONFIG:
 			assert(term->type_val == PARSE_EVENTS__TERM_TYPE_NUM);
@@ -1749,7 +1804,7 @@ static int pmu_config_term(const struct perf_pmu *pmu,
 		 */
 	}
 
-	pmu_format_value(format->bits, val, vp, zero);
+	pmu_format_pack(format->bits, val, vp, zero);
 	return 0;
 }
 

-- 
2.34.1


