Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 141AAD2A00B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 15:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NZnllZdyzmPDgDLg3NsetnXCFaQjqpO0nxPQg2XzMvs=; b=JZwPJISru6+qO3Ii1i2+HUgAvM
	XtNv5LZjcC/TWrKEooSWEsApU8UjWVhR4cXQzGaQUn1r+fPMocksnu07b6THEwyXQvNreAup+wSzU
	R1DufZ357+qAM/wKDdzBmdrA82d0/IxmvSToKQU+UPgPcD3+p5G7PqCgOcx4o/lfqgwk+7Cn5vhgZ
	gS3gyz5GdWdkK6zIqEiBGbC36feJU7cV5p9vd8BS+t5pWQzwtZbar34ckh8xOQ88WbpnJlsCxaAG0
	ta3NynolcJ6dwnHi6zKILPHvd1oBo7kK+PLrxxbL0aYS3qKad9t0IIS44mBBMPUi0TYX4Vzh0zwtP
	TxZcTTCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg3G5-00000009oU8-0OFk;
	Wed, 14 Jan 2026 15:58:14 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg3Fr-00000009oCH-2vd9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 15:57:57 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-47ee0291921so12802555e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Jan 2026 07:57:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768406274; x=1769011074; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NZnllZdyzmPDgDLg3NsetnXCFaQjqpO0nxPQg2XzMvs=;
        b=RcxTzEmI/wfE3/pSG1hGv5k1S0Hygozb2k+1lMvzQ15z0iQFfIJn2/7RMMNHFFSrmH
         vS/2cKr9+WmIOBnnXEDRyOZaViT+w/k4K2ipdcdZpTYxUqLEFQM9u1OYcZEeztz9FeQk
         +NMwwQWILpdgA7FaiCdMRMQ4g/m0bzDS7Md/b+rwxNAIPaKuIHly1hB20XN3FDGVCprx
         EwAH9d+fgt3YXSPWdSur7JjtvCYXiwAWtpYrxdXfmC8icRP2SS/RkpFHZRttlDuE+lXI
         DWA/xfs/BEVoQ7lk+atlE/PH3uBIBnWLi4VVrL+dEC/Ek5sYqVxhQKRuw6BXArfFmkv8
         oUlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768406274; x=1769011074;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NZnllZdyzmPDgDLg3NsetnXCFaQjqpO0nxPQg2XzMvs=;
        b=U31W/uevf5xxt0uPg8pAZuCaKk9md7fmXLu5COmMUS7We4J0Dn5XP5XXdFezxAMDzp
         gXreD4+Tug1l2IOckIflNqHeJEDIcA+PPZ/vWFiXhxiqKf1VFr9+lSxk90iJTubJQXVO
         ZAzV1uCbqBDALKv3rYkVMdLkAWBMzxmeiU2pDKvDz4r9lKet80Oi5MHFSOuuMCnmMAEc
         VLS0XBqIsOOVgR6xKwqyLMLIg7d1f9YQzWJH8/m+EhulQ+Pwpyy5t+7tcjuvKUEJJYVH
         vTzPjIAnYUvMhXh3fJZhBrBoSuJOUudlk2+Sswzv20EwS2hzf+Kb42oxVaSmYh/+b5gf
         y7Dg==
X-Forwarded-Encrypted: i=1; AJvYcCUDauOoYWGgjD5elQ08qbUCDctA84VPsckkFFKQtulGOA+sdH4uAZXbhJ3/ts3qdsKrAQhEDH4apnvTgvpPsMKT@lists.infradead.org
X-Gm-Message-State: AOJu0Yy61IMZqBYCxdBwn787XZdSMmlqomH/D+DXIef0eqd21x2JRfsB
	4ZG0Rtm8qMEtcxXGo+P+F04358vP9a86m57LfmnjqwTe2MP02jEEUo+bT6NrQzKVGVA=
X-Gm-Gg: AY/fxX4hZtlmw8c8BxQRE0vxOQ/ws9ka1yPIos32TBqdYjVKUVSl51hlcgskZ5jSZGK
	1stWubjE3t1pV0EpS9VLMslYrVZmzkHDu0cj/Od9fMhV9UA8g5gel7fk5bmOkonZe48IGuL5o6O
	bBCt6jLwZ5yEPqY0TYbbDJ9vNotQS58yMAETCq8t9H+vRNib3dMJx8Kw97UCtGERZc5KtTjnpdp
	Fs5v7G/6HsnoDim7g8cwyI6KT0jkiKrBhRIA51C25n0YUg5kP9fmSQgDgPQ4CLhvPOfmsJPofJA
	ZHLP86QJ8sD4SY0K5EFBf0U2dj5rRGqGtc3RjPbDJa+//ILzgY+KbHIYszvOujLl18kCcvOgpOc
	4jk5Tm+Csl4Bk4uoYibud+4DfVRoZZYtYRED1xM0Z89zowAGuzC2dsOzyjeShBaDykkI1n+UHoy
	C6oJ1T6zLS55XgpV5QqeDtNvlW3NMfMYs=
X-Received: by 2002:a05:600c:c4b8:b0:471:1765:839c with SMTP id 5b1f17b1804b1-47ee3394887mr36283365e9.20.1768406273776;
        Wed, 14 Jan 2026 07:57:53 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47ee85e8807sm7426475e9.16.2026.01.14.07.57.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 07:57:53 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Wed, 14 Jan 2026 15:57:25 +0000
Subject: [PATCH v5 13/14] perf cs-etm: Don't hard code config attribute
 when configuring the event
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260114-james-perf-config-bits-v5-13-0ef97aaf1ac0@linaro.org>
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
X-CRM114-CacheID: sfid-20260114_075755_770231_2B7B2C32 
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


