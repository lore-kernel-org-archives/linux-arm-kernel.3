Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6430D59D67
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Dec 2025 15:33:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HW9vySL1eLI2H1Kn0+dJzMzzH5Eo6siVgDQRHUDflG4=; b=us+W0mMDCb4rhZzxueeaVQwugn
	4FrOiByGabDaUUyAvsAXHuB8eiJHsUBHAjuPkY5CXuncU2TsGDkTNa6w8U6hkRBQXuoXHnQMj9bmO
	19ecczl2NEyBP1KgRn+XqIwi9sGzeDjR4+nFeWVPyKnBORQtKo09HCQ2P0hvq6xfGWu9L4/blkLQ1
	aFiHogl9OX19BzbLhd6Uii7ems81nWISv7pFH/gFZSAfkwB2jB8s4WoWx+hBVRYnRGzXAEG7Evmob
	Am+Mj75BbShBjnGkhNS0E68I1BQirZGXN2KRmIgQqTtowihBd4gaZzXRPyArXxuan+7LhBw18NddI
	086U9OIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vU58u-00000000jR9-2jsg;
	Fri, 12 Dec 2025 15:33:16 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vU58k-00000000jEc-3vWD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Dec 2025 15:33:08 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-b735487129fso233655066b.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Dec 2025 07:33:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765553585; x=1766158385; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HW9vySL1eLI2H1Kn0+dJzMzzH5Eo6siVgDQRHUDflG4=;
        b=GEDFUxox1Rh1cf1+zYPtSw5nsuNQ468AZUoiwWJ/6EUOB18yvaohTOQcqqydfJw2zh
         0PP3BSRhJv2joh0BZAmxnvQQKD4A24kpoP6toIzgiBgZMqfzRT7WSMpyfF9h9/Xp4vc0
         Q8tBheCb00frAIjjh/dJjrI6eNibLUh3afxeITGJDWCmkdGLQBaFyPOw8UCZZ3jlQrkV
         0kd/N3MVcTJvfEbh2U2tkFwd8mwYT79w9fSx/76yvCZyDyVoWeiGuJ9TgPdFTKQc75az
         HnXR8D48dZWyOnaH4GuiPbbVe54UoAgtsw2uMwdv8dyj6I+fX9Mj6Kk3KR6TlbWMGiAz
         GuJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765553585; x=1766158385;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HW9vySL1eLI2H1Kn0+dJzMzzH5Eo6siVgDQRHUDflG4=;
        b=YnXmfAHeWoFAHSVS2HzFPoKO8ytul+u2RwiNX7ludlEhq0f57QRITa4hskkcc0ff1Q
         Se1ryOq62f7fPCzvjT5FMIbqlN/4VvRYT0eanC+7cUSCIcV3C/OOWK36yrEfaEaL0+iW
         HpJWiI8p2/W1lXb3fs6n6uTM5+mFZHe0AFP7GKUN69Zd9TWIKlUzFDIOlT9yYIUOse1C
         8USvhTtTYN6+j/hxmvk0zYjlD54Yu4D//v8Hai5ivx1Lyr/J09YONrdwEaipuqVQvZ+D
         sPnbDQBGuxIITagm5GcMsbNwVMOcqoLt+m2019Vtw3VWyySkPWPMK0hxAhyhSW/ZphHf
         IFzQ==
X-Forwarded-Encrypted: i=1; AJvYcCX3kRDIMgLuhVMNgwoPjA6GcgV2IyrtCB/2Kik5zNrsnWBHZacFduMNa/+MWJGivsvChF6FNIZl7NhC66PyLCf3@lists.infradead.org
X-Gm-Message-State: AOJu0YxM77PvTGCbTsjy4VZ4Us6j1VDIv3VA8r7AjRj98MbzAtJyd52p
	N4cYvEjV9DkQt/4PxLoLE/JOaIcy1oyK2CbAwTHkuWEUyk2FokNJ9SSUt5YOQ84PnBg=
X-Gm-Gg: AY/fxX4P16rZ1anY4pPEjerH0U010CQ44iSdSXBMO4MhJo17x1RTepRYuQjwMsjkZpB
	8+HiYzxPv55V2TQ5A2HpkuR9h4vzaOxAIOKRyAUZBOtS5t+jNqOOFVQXlGgvd327HEFJALVegJ6
	tqsHFiySGsSM8uEQSpkg5gs33FR8CKc5DCys9kRpPGqcwaUesxhTxWgNKQIr7ITJ1COk7DShwnd
	h07N8KLhVmQar5habFWQbWMpFLkbkmFD/C5sVhqMNkovJQ6rnLln5oEpYMndMDOX+3Wn2VCY2IH
	By7MXeOqh2W0ErMMclCPiVtjxIPKFoB5gxC6fbpHTMy1YRwEPLpZ/rrqYDrpFiskI+bk0bNDojs
	CSE+2sO/r8YinGoBc/DO5CJKrD/LKrc+jv9FvwkwEzbOY4C15FdKY4edb0ksZH5g3qD/VoEd6Nz
	vpv5Izrtjllc4LieG2Bjg9
X-Google-Smtp-Source: AGHT+IFzKlUxyQ53WXrw5hS/OfPtHid1213GH5FkblCTWns2qdDPxDDyZ/WVIFJPhZGFwV5zxjVgZA==
X-Received: by 2002:a17:907:d22:b0:b76:b76e:112a with SMTP id a640c23a62f3a-b7d235c7f18mr229365366b.11.1765553584541;
        Fri, 12 Dec 2025 07:33:04 -0800 (PST)
Received: from e133063.arm.com ([130.185.218.160])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6498210ed32sm5433234a12.29.2025.12.12.07.33.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Dec 2025 07:33:04 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Fri, 12 Dec 2025 17:32:28 +0200
Subject: [PATCH v3 11/12] perf cs-etm: Don't hard code config attribute
 when configuring the event
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251212-james-perf-config-bits-v3-11-aa36a4846776@linaro.org>
References: <20251212-james-perf-config-bits-v3-0-aa36a4846776@linaro.org>
In-Reply-To: <20251212-james-perf-config-bits-v3-0-aa36a4846776@linaro.org>
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
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251212_073307_033570_327140B1 
X-CRM114-Status: GOOD (  19.63  )
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
index 4a606b1e90f227aef9915e90439b2a024eeabcfe..bfb573cb587893b7d91b92fed4c61f421392fbcf 100644
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


