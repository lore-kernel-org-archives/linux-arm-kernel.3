Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD36DD3B7F4
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Dec 2025 14:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SsInU0t5SsRXwndpS/OaiCaWG6xiu+JNwIsRwUuzGhw=; b=qWLNRI9VHCL6TQvaniICO4LD9a
	mbMCEN7JYg6ZHQVBtpAsEIhbcFHzuVY0YB+VpCm9zap+ph5x5kH3G0RUvt83RKodMuGCLpxOXqBUd
	JHzgrgppsd1ag4BTRSkfXWvB/GjiW6oCAJla0uWsjvPUFUSxUob/1E+Ec+XyLfiAzjGg1B0dTLha/
	/FzfOLVdGrXIixjUtBEs1N39pKGI5FOdnlUbMO4nGwRc2B41U3kLhk+vWluEi8jFWyw9VUreaV6UE
	pQJj4GtUzrlZ0puCBN9SifG03B0feQ2qTTH10P+5Bbtr8Jr7dvkVaRX0HZrW4si4oFk91JyRsOlSv
	J4ko3fKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSc9K-0000000DBGd-2Yld;
	Mon, 08 Dec 2025 14:23:38 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSc9H-0000000DBBy-48g5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Dec 2025 14:23:37 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-47774d3536dso42814975e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Dec 2025 06:23:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765203814; x=1765808614; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SsInU0t5SsRXwndpS/OaiCaWG6xiu+JNwIsRwUuzGhw=;
        b=tFUremMVLqjlrNKvNdcL0fFyXJFZHzB43zevZfsolZGjuSItSc196oqdPd7JdbVDBK
         zET5wN+7GVyphTM9AK/4jVFG/DDa62Tda7AyS84ymBeew/uQFjMhWfSSascZ3lOVsESG
         eGIL/xahh5RG00RFOsmerkmX82C7UJP0QdnjEP79KyYrEWQCLdzcyoieDyIoGF5CVf6T
         EmRD9fpG8PfE6kIfi473orNP0WnCNzNT48hozMxgSGse7ip7FtAIr8WsKI0qE5KfdpEO
         g9ZW2fLvnpT+HomzMa4TL4abtPpO3YVlSs+zZsB+aC+1i3H7tUjb+F7iKXjlJwplkTUA
         jIog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765203814; x=1765808614;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SsInU0t5SsRXwndpS/OaiCaWG6xiu+JNwIsRwUuzGhw=;
        b=vlGFYhOUBSUbX3FD+TKtROnif45YCLRzyGcVtn37UbFPlV+WfcYyG3/66+NF/V3A+/
         ANfcG7hNAsVfjvvUxoVXLk8Mqmtm4XxdmIXCkTMjfUMoxkHv8UHt0+R4QlDLpB4Lzyfe
         0/si8iJ+YkwzHvE7KIgUo9TZ9qajDP8qukkqM3vLTNgG/U26TPSMdXcjD9bKLlatVIg0
         JM/L4cFYdco/MZD0b7DR+8uAmXefhxPt1UmRlLMK8lzoKduk9357plxXiGjtLsn/A/hE
         5v7D1AB4aK+g/+Ypb4VaQ7+ee9H2Ul0a3ctMqtQblu1sbju00NrekIzp0f71T085WDhG
         8hoA==
X-Forwarded-Encrypted: i=1; AJvYcCUJCL1tmezSeKImkc8xzt2tlZ2825oDgcxdywE9v2Y+etarPYfEvm2xtvzEddzU6VHjU7h2WoVJu8LCNtjzcJts@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+egwiwLwe8lbOfCsTDCw0b5XKEyqadrntq25+GfgzX9V2qhsd
	W9/arup/k0cyIS7IIIahTZN86yCStX5jd6OTp22GYOCCnN0/b9aBxzia/L4mOdBHfsHvSfOYhBz
	pw5Sv
X-Gm-Gg: ASbGncszxf5wsls/DiAq8xvYpGvbDYidOWD3rQsCIGqAcHR5M6+CPTQYoNOwWKNtfTz
	rE1RNL2FfVTygc0BUIyubprJZe9ULiu7XiSTmFuU+UVI7EWu2LmuweT519HqC1dw3si11heaR2X
	7QbViFHZwYte1I8CNdtejwiIgEVWnbbMG08ROKRLpxQB+kT7ZAubVT0iGh+WhTlzTPB6x137mbL
	2L4M4R8LvaC5N3bbDyI7TUq5QB8b0hpS82jE5tx5fcBtQX5jBXPR32SR5afyL035FpMdXlsJJto
	XF0cw40/5rtq5WuiOa6DGsSZZ30S+enoIdWdtHbdsRRBwvCOH8neLiVFUdx9W2On0JfXm9kQhk8
	wjD0uSl1AohgG6Z2G67aShCnualBOv2qMjBL8syIuIQUd7itmfJ0uWMAQghLsCkoCB48dPH+wl+
	yWps8JKAFKp3UPcrGcw6LN
X-Google-Smtp-Source: AGHT+IFSZGwfFwJSYKaBVY3GQ2FBMVbPJczh0bZwQlbrmePS7rzEeSRqZHVvyMQWkuI4F0AEn+gDQg==
X-Received: by 2002:a05:600c:8b6c:b0:477:9e0c:f59 with SMTP id 5b1f17b1804b1-47939df17f6mr81324235e9.2.1765203814305;
        Mon, 08 Dec 2025 06:23:34 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47930920e0dsm248561065e9.2.2025.12.08.06.23.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Dec 2025 06:23:33 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Mon, 08 Dec 2025 14:22:14 +0000
Subject: [PATCH v2 11/12] perf cs-etm: Don't hard code config attribute
 when configuring the event
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251208-james-perf-config-bits-v2-11-4ac0281993b0@linaro.org>
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
X-CRM114-CacheID: sfid-20251208_062336_070411_A382775B 
X-CRM114-Status: GOOD (  19.67  )
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

These instances of hard coded config attributes are used for configuring
and validating the event options. Use the config attribute that's
published by the driver by replacing the open coded operations with
evsel__get_config_val() and evsel__set_config_if_unset().

Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/arch/arm/util/cs-etm.c | 57 +++++++++++++++++++--------------------
 1 file changed, 28 insertions(+), 29 deletions(-)

diff --git a/tools/perf/arch/arm/util/cs-etm.c b/tools/perf/arch/arm/util/cs-etm.c
index 4a606b1e90f2..bfb573cb5878 100644
--- a/tools/perf/arch/arm/util/cs-etm.c
+++ b/tools/perf/arch/arm/util/cs-etm.c
@@ -103,13 +103,14 @@ static int cs_etm_validate_context_id(struct perf_pmu *cs_etm_pmu, struct evsel
 				      struct perf_cpu cpu)
 {
 	int err;
-	__u64 val;
-	u64 contextid = evsel->core.attr.config &
-		(perf_pmu__format_bits(cs_etm_pmu, "contextid") |
-		 perf_pmu__format_bits(cs_etm_pmu, "contextid1") |
-		 perf_pmu__format_bits(cs_etm_pmu, "contextid2"));
+	u64 ctxt, ctxt1, ctxt2;
+	__u64 trcidr2;
 
-	if (!contextid)
+	evsel__get_config_val(cs_etm_pmu, evsel, "contextid", &ctxt);
+	evsel__get_config_val(cs_etm_pmu, evsel, "contextid1", &ctxt1);
+	evsel__get_config_val(cs_etm_pmu, evsel, "contextid2", &ctxt2);
+
+	if (!ctxt && !ctxt1 && !ctxt2)
 		return 0;
 
 	/* Not supported in etmv3 */
@@ -120,12 +121,11 @@ static int cs_etm_validate_context_id(struct perf_pmu *cs_etm_pmu, struct evsel
 	}
 
 	/* Get a handle on TRCIDR2 */
-	err = cs_etm_get_ro(cs_etm_pmu, cpu, metadata_etmv4_ro[CS_ETMV4_TRCIDR2], &val);
+	err = cs_etm_get_ro(cs_etm_pmu, cpu, metadata_etmv4_ro[CS_ETMV4_TRCIDR2], &trcidr2);
 	if (err)
 		return err;
 
-	if (contextid &
-	    perf_pmu__format_bits(cs_etm_pmu, "contextid1")) {
+	if (ctxt1) {
 		/*
 		 * TRCIDR2.CIDSIZE, bit [9-5], indicates whether contextID
 		 * tracing is supported:
@@ -133,15 +133,14 @@ static int cs_etm_validate_context_id(struct perf_pmu *cs_etm_pmu, struct evsel
 		 *  0b00100 Maximum of 32-bit Context ID size.
 		 *  All other values are reserved.
 		 */
-		if (BMVAL(val, 5, 9) != 0x4) {
+		if (BMVAL(trcidr2, 5, 9) != 0x4) {
 			pr_err("%s: CONTEXTIDR_EL1 isn't supported, disable with %s/contextid1=0/\n",
 			       CORESIGHT_ETM_PMU_NAME, CORESIGHT_ETM_PMU_NAME);
 			return -EINVAL;
 		}
 	}
 
-	if (contextid &
-	    perf_pmu__format_bits(cs_etm_pmu, "contextid2")) {
+	if (ctxt2) {
 		/*
 		 * TRCIDR2.VMIDOPT[30:29] != 0 and
 		 * TRCIDR2.VMIDSIZE[14:10] == 0b00100 (32bit virtual contextid)
@@ -149,7 +148,7 @@ static int cs_etm_validate_context_id(struct perf_pmu *cs_etm_pmu, struct evsel
 		 * virtual context id is < 32bit.
 		 * Any value of VMIDSIZE >= 4 (i.e, > 32bit) is fine for us.
 		 */
-		if (!BMVAL(val, 29, 30) || BMVAL(val, 10, 14) < 4) {
+		if (!BMVAL(trcidr2, 29, 30) || BMVAL(trcidr2, 10, 14) < 4) {
 			pr_err("%s: CONTEXTIDR_EL2 isn't supported, disable with %s/contextid2=0/\n",
 			       CORESIGHT_ETM_PMU_NAME, CORESIGHT_ETM_PMU_NAME);
 			return -EINVAL;
@@ -163,10 +162,11 @@ static int cs_etm_validate_timestamp(struct perf_pmu *cs_etm_pmu, struct evsel *
 				     struct perf_cpu cpu)
 {
 	int err;
-	__u64 val;
+	u64 val;
+	__u64 trcidr0;
 
-	if (!(evsel->core.attr.config &
-	      perf_pmu__format_bits(cs_etm_pmu, "timestamp")))
+	evsel__get_config_val(cs_etm_pmu, evsel, "timestamp", &val);
+	if (!val)
 		return 0;
 
 	if (cs_etm_get_version(cs_etm_pmu, cpu) == CS_ETMV3) {
@@ -176,7 +176,7 @@ static int cs_etm_validate_timestamp(struct perf_pmu *cs_etm_pmu, struct evsel *
 	}
 
 	/* Get a handle on TRCIRD0 */
-	err = cs_etm_get_ro(cs_etm_pmu, cpu, metadata_etmv4_ro[CS_ETMV4_TRCIDR0], &val);
+	err = cs_etm_get_ro(cs_etm_pmu, cpu, metadata_etmv4_ro[CS_ETMV4_TRCIDR0], &trcidr0);
 	if (err)
 		return err;
 
@@ -187,10 +187,9 @@ static int cs_etm_validate_timestamp(struct perf_pmu *cs_etm_pmu, struct evsel *
 	 *  0b00110 Implementation supports a maximum timestamp of 48bits.
 	 *  0b01000 Implementation supports a maximum timestamp of 64bits.
 	 */
-	val &= GENMASK(28, 24);
-	if (!val) {
+	trcidr0 &= GENMASK(28, 24);
+	if (!trcidr0)
 		return -EINVAL;
-	}
 
 	return 0;
 }
@@ -273,16 +272,20 @@ static int cs_etm_parse_snapshot_options(struct auxtrace_record *itr,
 	return 0;
 }
 
+/*
+ * The sink name format "@sink_name" is used, lookup the sink by name to convert
+ * to "sinkid=sink_hash" format.
+ *
+ * If the user has already manually provided a hash then "sinkid" isn't
+ * overwritten. If neither are provided then the driver will pick the best sink.
+ */
 static int cs_etm_set_sink_attr(struct perf_pmu *pmu,
 				struct evsel *evsel)
 {
 	char msg[BUFSIZ], path[PATH_MAX], *sink;
 	struct evsel_config_term *term;
-	int ret = -EINVAL;
 	u32 hash;
-
-	if (evsel->core.attr.config2 & GENMASK(31, 0))
-		return 0;
+	int ret;
 
 	list_for_each_entry(term, &evsel->config_terms, list) {
 		if (term->type != EVSEL__CONFIG_TERM_DRV_CFG)
@@ -305,14 +308,10 @@ static int cs_etm_set_sink_attr(struct perf_pmu *pmu,
 			return ret;
 		}
 
-		evsel->core.attr.config2 |= hash;
+		evsel__set_config_if_unset(pmu, evsel, "sinkid", hash);
 		return 0;
 	}
 
-	/*
-	 * No sink was provided on the command line - allow the CoreSight
-	 * system to look for a default
-	 */
 	return 0;
 }
 

-- 
2.34.1


