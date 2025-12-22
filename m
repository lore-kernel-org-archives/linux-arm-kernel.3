Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5CE3E677E6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Dec 2025 15:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NZnllZdyzmPDgDLg3NsetnXCFaQjqpO0nxPQg2XzMvs=; b=Y6madQlSfB6ejhgcJnE188ShMs
	7lZIlIEs4RAbzDEXaN9jgLA71msOMXJpDx1JT05wK51eX1vRiC0PAIdlqVWhjBiNs8SsrU7qKyj5G
	OEfuHYedfvekm4OgxSVji2GTpq1iDmtwYV2ECD0e516HLUjBEsggogefEfYvqhkXRCb0KOPlUuGEZ
	2M/ngLXzh/QYcGUHGdWSdzEpIWzsIERSZcsflvB7kY/txp4ZjOp3rldgD0hg9Mm1xE7xc0fYH5JOj
	i0k3HYqIrhELpEgnlHlPcoMEn24TvMFbuxC1Jmv6A5TrkfwOaRACjatMZGXuZzxotIHqWofx7aj+t
	4Y6ocaFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXhcw-0000000DtyA-3C1S;
	Mon, 22 Dec 2025 15:15:14 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXhck-0000000DtnG-3GK2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Dec 2025 15:15:04 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-42e2e628f8aso1734085f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Dec 2025 07:15:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766416501; x=1767021301; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NZnllZdyzmPDgDLg3NsetnXCFaQjqpO0nxPQg2XzMvs=;
        b=d5hBOVK1RBDDMUjiyjSme+KjR9REiUH53HyLgrbOtwMvh9EVX7BUJXKXXNpFUNQW9u
         kiQBr6JVTxasb+6YgRrOJcWwKume89JSaEJdGhep0Fp6bbOT3DbXJi1JaYaeackDGGmo
         A6/IXNLB6W3AV7zrMvPQGbsT2hzaaVCLw9tfasPjff93Z9Z8uMAwDOovMKpv+lGQOoM9
         DFhnIs/dzdtpAWVBn8bm/VbciYXHgZ72VozsrkAWjXU83/vSZgxuxbUnVMx6h8Q95MA/
         FSz2cxE1KEwtkwn6u1sV/WFSov147KoNQNud293wyVJ6YSvi+K5tjB7cCwzCB2eWGC5t
         XbPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766416501; x=1767021301;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NZnllZdyzmPDgDLg3NsetnXCFaQjqpO0nxPQg2XzMvs=;
        b=j3sQpu67+3f8VF0Ez888PPJEXuYnYki6Dxx4WPFvhc+pZhv35++5nroQEWNCz20TIp
         BBvWSn6OZNhQYe4Q5KL9dGhsM6OIXbk1bY6HB6E7N7PQFgHr+PmFobvLsAKZNGizXKuO
         nfWuLcAfWja0ZnwrdfyoQo0IH+eBSFcTBahQ6/YqVWR3Qotvs1A8Sm4whcNIgUZJw3jT
         l7SExuuLlJ0o5efsYSb6lDyHMhPzbrWmExPchkweicCoflNCbqSKJ8LQRGNhLcOFPTJj
         I+JSYAOMvb3PdnAvSF91YSnATK99ebd0G16PGjHj7LfRwyOlUc6EWcM7apmm95QeUZpy
         NkFg==
X-Forwarded-Encrypted: i=1; AJvYcCXKfgVqV4j+Ylf2T2kzs3s80ib+G1A9M/8ZrOWwDxcHrA+IGhsEZGW2KrsWPIvbXWbt1SimuCjbMJuwxpj8YGpr@lists.infradead.org
X-Gm-Message-State: AOJu0Yyok6wNR4p8BP9kzLuLIBKmHE5CslLccwMQLJ+HWaFWcCpN7eo+
	5MpZR7zpXcEQyz6DQY26u86h0uu6ah7cBn/6/LGO1re/xIznGfMLEBUfT3IcLQPKD2c=
X-Gm-Gg: AY/fxX6AdtplMZ3FJ704TkK7t1N+blECfmFsVsOKwNbngmYCoLgM5LUEKv6mlWYjzws
	D/iK9Ww+0RerKOxbkuCtqsu9svVgInc5Bt+FHdrVFZ9Qo6+b05zxt1UotoRFN2l548bBz5RASCY
	oVV/b/fUuVzn+g3GaD/S5JKr7AHjLuKkaLcDfYGcdMAhE6q+2CzR5wV9RFKPCY2TmohWE5dgfP4
	fRKPE6ZE4v+1zvETeXPwWbrfh04Zj7HuCOpvaeIyfZbBJ4XlUZnMcZ5kj0R8fqUORUpDZPXwBpW
	HLs/vOvSt1CAI/732aROJ2xYngBL2L4ltMwTdqO040clmJAxBNWlwr7wPuMWP/vOeFYZrM79If9
	SZm6vxIWh3M8AIgQMvO2438tEzDEG7N+B2V4X6rIO3DwWlppDHA/Mu/Q77ysxO6neylNOfsxAnh
	ar7oRTGnm1mG9UqAoqiQj8
X-Google-Smtp-Source: AGHT+IGJQxCV50ScDAMUPbUoVuouEnRfEx1ZAS/DBqZ58QgrzRh+YFP0A0+P2e7M/HVXKXG4s2eScA==
X-Received: by 2002:a05:6000:144f:b0:430:feb3:f5bb with SMTP id ffacd0b85a97d-4324e715af9mr13951920f8f.60.1766416501000;
        Mon, 22 Dec 2025 07:15:01 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea830fesm22750093f8f.20.2025.12.22.07.15.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 07:15:00 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Mon, 22 Dec 2025 15:14:38 +0000
Subject: [PATCH v4 13/14] perf cs-etm: Don't hard code config attribute
 when configuring the event
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251222-james-perf-config-bits-v4-13-0608438186fc@linaro.org>
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
X-CRM114-CacheID: sfid-20251222_071502_854315_A8AAA895 
X-CRM114-Status: GOOD (  20.11  )
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

Reviewed-by: Ian Rogers <irogers@google.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/arch/arm/util/cs-etm.c | 56 +++++++++++++++++++--------------------
 1 file changed, 27 insertions(+), 29 deletions(-)

diff --git a/tools/perf/arch/arm/util/cs-etm.c b/tools/perf/arch/arm/util/cs-etm.c
index 12b28562c2f3..dc3f4e86b075 100644
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
+	evsel__get_config_val(evsel, "contextid", &ctxt);
+	evsel__get_config_val(evsel, "contextid1", &ctxt1);
+	evsel__get_config_val(evsel, "contextid2", &ctxt2);
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
+	evsel__get_config_val(evsel, "timestamp", &val);
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
@@ -273,16 +272,19 @@ static int cs_etm_parse_snapshot_options(struct auxtrace_record *itr,
 	return 0;
 }
 
+/*
+ * If the sink name format "@sink_name" is used, lookup the sink by name to convert to
+ * "sinkid=sink_hash" format. If the user has already manually provided a hash then
+ * "sinkid" isn't overwritten. If neither are provided then the driver will pick the best
+ * sink.
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
@@ -305,14 +307,10 @@ static int cs_etm_set_sink_attr(struct perf_pmu *pmu,
 			return ret;
 		}
 
-		evsel->core.attr.config2 |= hash;
+		evsel__set_config_if_unset(evsel, "sinkid", hash);
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


