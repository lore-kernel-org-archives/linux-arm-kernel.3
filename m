Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB7F6D116F1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Dec 2025 16:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cKUhf7S/zq7XInwoT4BCbYa77L5aJsIA3yCxD0J3mf4=; b=AnKHp75jXSaEkicW5GPDIT0Kfl
	Ssd/0p81boWIAt8HS6kMhTtOhR8A28xTgKaqN639Q/ybhk+0qThy0jD9mr8rFOexvAsOjNuEfT//F
	7ijFGEeFegam4HByPo5YsYPLv3fMwjupGd8I30dLviFAHJFV9OaiSy2/TrOE1ZcrAgMGv+33rlgCK
	eJdq3kT+7S/5d/NQo6pjkKNGJL6PjeXIoRvbjscKJSjTuDvQWO3ddfjv7kajMGXxhheoq7pL1PSoj
	tkOzk62UwjjTua8ykemujDnDjXD4b5pVjKpTVnwnG5HB4jODJ9TKHyDbKqkYi/ijNo8OlN5cWQ6rR
	ixNbtWyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ6yK-00000004I6e-0zx0;
	Mon, 01 Dec 2025 16:41:56 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ6yH-00000004I2J-35Ec
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Dec 2025 16:41:54 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-477a1c28778so50822465e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Dec 2025 08:41:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764607312; x=1765212112; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cKUhf7S/zq7XInwoT4BCbYa77L5aJsIA3yCxD0J3mf4=;
        b=nt0mz21H8awTTf11SeV74S42j2TT0rS/j/YE5cfexsfkBnuR9HmbzM5sskIg5j8AwA
         H0G6eBmJGe6y0cUmqEiqCOp2Wp+aVR/yFD9iBUXnfx1BEOm7e5YhxPzlJ+wffj3ls3cn
         +fiPUuXwpvUNWJpLNIDla2wIvTFtiEU9ClLJlVu7W+MCtutXuI7OrXFiv90dx3uLhxXx
         1d9JTqFanZ3KgHch2VMglBN/Os/KgiBfYBShuCBAeX020rivGeBRycqrPPvGcDuGNOEU
         wtrLX6i6mDYaAHEIONYuWzqLd6fAhSyQ/olXhLC0DNYqR1/u92DD2P+3GDhwUotn28xc
         jswA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764607312; x=1765212112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cKUhf7S/zq7XInwoT4BCbYa77L5aJsIA3yCxD0J3mf4=;
        b=Dgeb3poAp2wOe/JCc7HOmSbVd1IEsUG5UCeUe9+jVSFtZ7AW558bbwLt1D/FN9sGUE
         PaOiV+7L93a+6dZg3MOUFBFiqNcugGsVVZYNbOiDPdY+S0TAdjDR8DTRKRgiD3J26ZJt
         EIroNnfsdRvz+an+uehxQ+ckBBAnmnoStrOb2B3Y04sokbXifkGqMmLoZT47s5R2G6sW
         GzMMRdAYKDJ2UjJ1PyyIB+eB8QU8Rp3pUy/3oCXiTZWNcYCj0qWkvPngSS4uytwMHrIl
         96QA6QIBtMRBcjYbvIm8guIp13LPF9RBpyX4scvUXSz+W7SEaBiG29mzSs+wLhC80e3Y
         fYOg==
X-Forwarded-Encrypted: i=1; AJvYcCU+g8AyAU8H9TF4d3hAB2nXhe/IY7ovDBYIh3a8F4CDG6Usyn5FZ8PJ2KZaEXI7ycuOHhlp4Xbhk3zwF2j+CSsy@lists.infradead.org
X-Gm-Message-State: AOJu0YymYF7DYKXG3Rgyupomldx1hThs/A/H4DSvJ7y357cTqEXKUo2g
	5YoFPafUArC4+KSTi4yYhvXk5FuVQ4+zvmB0BpD48UcOCqf4lcnlLp14EyFkEJLqSA8=
X-Gm-Gg: ASbGnctI5QXaxD0KWuPgUicBDmrOZpx3jPsiBixVr9UYW5Y5ouZRCFjFZU+HZrTIPou
	4kfl+jBMNjwE74o8oSBKbkUjVQBIrolSzEI62BduJGfmxqzaYMAUxHZsYXXp4V8Mxc3L9JqWam9
	qR6K2n/nOTPF1l5TdZgaySzmZCTuyDFfMEGBADpdCANMPt/ys0l/zRLH09BfXWymfUS4dU5egHi
	lnQVvVLI65Cjy0RRUrRdPwLqeWfZRM7SONdH3XOga/Re0pGp0Sa28j5HDtoS2byJ19JTQfBfDIH
	cyuvDgBSWxLlWnxjDT4MAp2C5yau25oAVKn6YOR24iLwPu/uvzM21rSpUh6aT15xC7nCHIsxs9T
	0POyIZ90eTq/hfTnlrqzuwiAX7k3bADCy1VvGlXhpl2jm/zfRw8R/9P5UFI22HEqUt4nYr86ZnM
	7RxiaTULUbk6lzf66skegV
X-Google-Smtp-Source: AGHT+IEY4wsnu5t7RxRAb+lDOwrk2bVHKf8Daq/FFegD/RxGqBitL9q7Mn4TMWImABd/xtV4q+gq4A==
X-Received: by 2002:a05:600c:19ce:b0:477:79c7:8994 with SMTP id 5b1f17b1804b1-47904b25e63mr271343655e9.30.1764607311924;
        Mon, 01 Dec 2025 08:41:51 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4791164d4f3sm255901275e9.13.2025.12.01.08.41.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 08:41:50 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Mon, 01 Dec 2025 16:41:09 +0000
Subject: [PATCH 6/7] perf cs-etm: Don't hard code config attribute when
 configuring the event
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251201-james-perf-config-bits-v1-6-22ecbbf8007c@linaro.org>
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
X-CRM114-CacheID: sfid-20251201_084153_824344_E3F7EC2E 
X-CRM114-Status: GOOD (  19.80  )
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
 tools/perf/arch/arm/util/cs-etm.c | 66 ++++++++++++++++++++++-----------------
 1 file changed, 37 insertions(+), 29 deletions(-)

diff --git a/tools/perf/arch/arm/util/cs-etm.c b/tools/perf/arch/arm/util/cs-etm.c
index 51ca8fa66ef8..52e304584095 100644
--- a/tools/perf/arch/arm/util/cs-etm.c
+++ b/tools/perf/arch/arm/util/cs-etm.c
@@ -103,13 +103,20 @@ static int cs_etm_validate_context_id(struct perf_pmu *cs_etm_pmu, struct evsel
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
+	err = evsel__get_config_val(cs_etm_pmu, evsel, "contextid", &ctxt);
+	if (err)
+		return err;
+	err = evsel__get_config_val(cs_etm_pmu, evsel, "contextid1", &ctxt1);
+	if (err)
+		return err;
+	err = evsel__get_config_val(cs_etm_pmu, evsel, "contextid2", &ctxt2);
+	if (err)
+		return err;
+
+	if (!ctxt && !ctxt1 && !ctxt2)
 		return 0;
 
 	/* Not supported in etmv3 */
@@ -120,12 +127,11 @@ static int cs_etm_validate_context_id(struct perf_pmu *cs_etm_pmu, struct evsel
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
@@ -133,15 +139,14 @@ static int cs_etm_validate_context_id(struct perf_pmu *cs_etm_pmu, struct evsel
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
@@ -149,7 +154,7 @@ static int cs_etm_validate_context_id(struct perf_pmu *cs_etm_pmu, struct evsel
 		 * virtual context id is < 32bit.
 		 * Any value of VMIDSIZE >= 4 (i.e, > 32bit) is fine for us.
 		 */
-		if (!BMVAL(val, 29, 30) || BMVAL(val, 10, 14) < 4) {
+		if (!BMVAL(trcidr2, 29, 30) || BMVAL(trcidr2, 10, 14) < 4) {
 			pr_err("%s: CONTEXTIDR_EL2 isn't supported, disable with %s/contextid2=0/\n",
 			       CORESIGHT_ETM_PMU_NAME, CORESIGHT_ETM_PMU_NAME);
 			return -EINVAL;
@@ -163,10 +168,14 @@ static int cs_etm_validate_timestamp(struct perf_pmu *cs_etm_pmu, struct evsel *
 				     struct perf_cpu cpu)
 {
 	int err;
-	__u64 val;
+	u64 val;
+	__u64 trcidr0;
 
-	if (!(evsel->core.attr.config &
-	      perf_pmu__format_bits(cs_etm_pmu, "timestamp")))
+	err = evsel__get_config_val(cs_etm_pmu, evsel, "timestamp", &val);
+	if (err)
+		return err;
+
+	if (!val)
 		return 0;
 
 	if (cs_etm_get_version(cs_etm_pmu, cpu) == CS_ETMV3) {
@@ -176,7 +185,7 @@ static int cs_etm_validate_timestamp(struct perf_pmu *cs_etm_pmu, struct evsel *
 	}
 
 	/* Get a handle on TRCIRD0 */
-	err = cs_etm_get_ro(cs_etm_pmu, cpu, metadata_etmv4_ro[CS_ETMV4_TRCIDR0], &val);
+	err = cs_etm_get_ro(cs_etm_pmu, cpu, metadata_etmv4_ro[CS_ETMV4_TRCIDR0], &trcidr0);
 	if (err)
 		return err;
 
@@ -187,10 +196,9 @@ static int cs_etm_validate_timestamp(struct perf_pmu *cs_etm_pmu, struct evsel *
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
@@ -273,16 +281,20 @@ static int cs_etm_parse_snapshot_options(struct auxtrace_record *itr,
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
@@ -305,14 +317,10 @@ static int cs_etm_set_sink_attr(struct perf_pmu *pmu,
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


