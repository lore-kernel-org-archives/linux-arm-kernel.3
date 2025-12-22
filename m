Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FA81E674BE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Dec 2025 15:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RFlRacjoMKjxtVCuFA3rtMsDNUnCiwPHWXGI0rppnjk=; b=OxdcdABUw2FKUl6LSJQSMgNx07
	xFGNsb026WoPn4Zr8LsBmexN4/TfvuJn2dV9pXyNF06rTgIeSsf/Ry4ncHIs72k3TtkA7bFzS9bN9
	A0WvY4+ETPem3aF5uUb5flsPwGElCFU3qAZiCpwBt9soDlJrqXKPrzBfyEpq711Ek3r96oNlgBsRU
	uDzI9Q2IbdPiWShhZkdH4nqRc79Ai24II762b27kWVGORgQWxypeDRDHc4ah2Pu9VOxuB8i/piV5c
	iRaxBe9kYNei4vBzp1UfKV1uQJK8vB5gMAWACjA/yMLbfdpS4EUgIsaD3VvhG3bc9bZ3baZnjzM7o
	Yp3SY+jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXhcv-0000000Dtx6-3z2w;
	Mon, 22 Dec 2025 15:15:14 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXhck-0000000Dtlj-0NyW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Dec 2025 15:15:03 +0000
Received: by mail-wr1-x444.google.com with SMTP id ffacd0b85a97d-4308d81fdf6so1900147f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Dec 2025 07:15:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766416500; x=1767021300; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RFlRacjoMKjxtVCuFA3rtMsDNUnCiwPHWXGI0rppnjk=;
        b=lXRtCiJaV2b8MYDwoVjXZCgQkt1cU1179O92WYkJinva1nOs6v1kvUdMetQqGrytOH
         EdKjRiQwfhG0JC1fy3ykAayJix5HV9nZNXERD9Cxg5yWBI+Pfc3Bl3HQVQZQXC0qqQbK
         qwOD3E4jSZpSZIyqGh8++9CLxcjmRBMh1DsKJSWEEbIHc4XDiIxjEkTDoTAP9OL+Q6O5
         ShDjrCedPj0rUQga4cQ3kdAx/RtI/ykfc9U6wyofHYyfGUi/1umYa+OPNtgoiXqBK3o2
         WCdPzVsynQYlp6cHoLBUuj3AUojIUa2rCnpQN5uNReJfeqri06loXGOZoabveT53qi8r
         +GyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766416500; x=1767021300;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RFlRacjoMKjxtVCuFA3rtMsDNUnCiwPHWXGI0rppnjk=;
        b=OcEOBfkgSlhiAbkcTGGI0Kg1xasBozAOUiz7Bcb6C8RasDseQ+kv5pmpVfOxaZfC/z
         p5EEVzcV6ulbMPs6YWR+TNcqZ1x4BWXNPWhqK8X7lGP0BunQualGSersw2v6qn8uh6+m
         yUF0//OmSIgTaZTh0WvyqnzEuAmgFaypAT569mQYKKsjC7/xMlMSJdtvWW0bRPhUD1oo
         SrKnEsEDmkfV7r1wM80Jroum7jmA86OobzX7zkWI+bjCMKXloHqtMuOot+4nqIhD3RUr
         ffr7TTmdUc8EAMO0oCZrjveIxC1/E5ccRJBG+FxsMaaoYqYz9MYaRVIAj/n+ZVjWl2kB
         5yZA==
X-Forwarded-Encrypted: i=1; AJvYcCU5dJpEjggFBbtHeVzWDQgOvJumoQwsBZmEfyVNBL5nKYULPcn3Yr9BElSfJyDZ4UmlUJ+RH9qUHR8yXesPfT6I@lists.infradead.org
X-Gm-Message-State: AOJu0YzojBLVWA383BSgeoImAQMCLeWHDfCIGEfHxtP0WtoPV5YHJZqV
	Lr6FjMHAtpPfPKn0bmAJVykhoIQW5O8mf9KLYcXgYthLFAGZ1xGMCAVf6mSWMn8m+hM=
X-Gm-Gg: AY/fxX4meJlyACoEzj4U/HoBjndMF3E3BcMcFHGKsS5Rkv8K4Ymh7rGLwu+hmJ6iRXr
	nVxk8a8A7oADopvmQ57y3jXPIfEV/gxlK7k+QsMlUe6EcnEx4prspsQz6NwkSI9Y4gIVUpCbZc/
	5Uz7WVOQZWRFsERk3yHoiKNH+frD6ZrBhDQ3S5MQS5053uq6fYuEp7lu6CSDRo4OaIhNwA1l+HK
	w3HZnWQ8rndtCcehwFWdYrQ1oLiB9bALd8cxqgC0pIPKw6pWVMacvmtTzbAfHWda2vllknXI1oH
	nOJSMDs7y2zs9dVxEQcHYlu+YTnBioNUX76n0dbv9K4AneVlQPlipEqEcbUT9RXhojAcHT4wswA
	r3+XCWHsTIZFje6RfTrpMizhmC8S/pLJPFZrlFowEEo5qMDrohuCVcmssAYDmrpj/+jpUWiOJZa
	+USlwylgCYy6HVGoWX+/52
X-Google-Smtp-Source: AGHT+IEPUJNPy274HZi+qkvi/OeAVZd7MGQfUITqEL+CFL0dU4WibIBI9+G5uNVA8U0GZWyYh6O1PQ==
X-Received: by 2002:a05:6000:2881:b0:430:96bd:411b with SMTP id ffacd0b85a97d-4324e70111dmr11870001f8f.58.1766416499926;
        Mon, 22 Dec 2025 07:14:59 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea830fesm22750093f8f.20.2025.12.22.07.14.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 07:14:59 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Mon, 22 Dec 2025 15:14:37 +0000
Subject: [PATCH v4 12/14] perf cs-etm: Don't use hard coded config bits
 when setting up TRCCONFIGR
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251222-james-perf-config-bits-v4-12-0608438186fc@linaro.org>
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
 Leo Yan <leo.yan@arm.com>, James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_071502_208775_733D8C36 
X-CRM114-Status: GOOD (  19.72  )
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
TRCCONFIGR. These bits could theoretically be in any of the config
fields. Use the evsel__get_config_val() helper so it's agnostic to
which config field they are in.

The kernel will also stop publishing the TRCCONFIGR register bits in a
header [1] so preempt that by defining them here.

[1]: https://lore.kernel.org/linux-arm-kernel/20251128-james-cs-syncfreq-v8-10-4d319764cc58@linaro.org/

Reviewed-by: Leo Yan <leo.yan@arm.com>
Reviewed-by: Ian Rogers <irogers@google.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/arch/arm/util/cs-etm.c | 79 +++++++++++++++++----------------------
 1 file changed, 34 insertions(+), 45 deletions(-)

diff --git a/tools/perf/arch/arm/util/cs-etm.c b/tools/perf/arch/arm/util/cs-etm.c
index f535027ce862..12b28562c2f3 100644
--- a/tools/perf/arch/arm/util/cs-etm.c
+++ b/tools/perf/arch/arm/util/cs-etm.c
@@ -68,6 +68,14 @@ static const char * const metadata_ete_ro[] = {
 
 enum cs_etm_version { CS_NOT_PRESENT, CS_ETMV3, CS_ETMV4, CS_ETE };
 
+/* ETMv4 CONFIGR register bits */
+#define TRCCONFIGR_BB		BIT(3)
+#define TRCCONFIGR_CCI		BIT(4)
+#define TRCCONFIGR_CID		BIT(6)
+#define TRCCONFIGR_VMID		BIT(7)
+#define TRCCONFIGR_TS		BIT(11)
+#define TRCCONFIGR_RS		BIT(12)
+#define TRCCONFIGR_VMIDOPT	BIT(15)
 
 /* ETMv3 ETMCR register bits */
 #define ETMCR_CYC_ACC		BIT(12)
@@ -517,56 +525,37 @@ static u64 cs_etm_synth_etmcr(struct auxtrace_record *itr)
 	return etmcr;
 }
 
-static u64 cs_etm_get_config(struct auxtrace_record *itr)
+static u64 cs_etmv4_synth_trcconfigr(struct auxtrace_record *itr)
 {
+	u64 trcconfigr = 0;
 	struct cs_etm_recording *ptr =
-			container_of(itr, struct cs_etm_recording, itr);
+		container_of(itr, struct cs_etm_recording, itr);
 	struct perf_pmu *cs_etm_pmu = ptr->cs_etm_pmu;
-	struct evlist *evlist = ptr->evlist;
-	struct evsel *evsel = cs_etm_get_evsel(evlist, cs_etm_pmu);
-
-	/*
-	 * Variable perf_event_attr::config is assigned to
-	 * ETMv3/PTM.  The bit fields have been made to match
-	 * the ETMv3.5 ETRMCR register specification.  See the
-	 * PMU_FORMAT_ATTR() declarations in
-	 * drivers/hwtracing/coresight/coresight-perf.c for
-	 * details.
-	 */
-	return evsel ? evsel->core.attr.config : 0;
-}
-
-#ifndef BIT
-#define BIT(N) (1UL << (N))
-#endif
+	struct evsel *evsel = cs_etm_get_evsel(ptr->evlist, cs_etm_pmu);
+	u64 val;
 
-static u64 cs_etmv4_get_config(struct auxtrace_record *itr)
-{
-	u64 config = 0;
-	u64 config_opts = 0;
+	if (!evsel)
+		return 0;
 
 	/*
-	 * The perf event variable config bits represent both
-	 * the command line options and register programming
-	 * bits in ETMv3/PTM. For ETMv4 we must remap options
-	 * to real bits
+	 * Synthesize what the kernel programmed into TRCCONFIGR based on
+	 * what options the event was opened with. This doesn't have to be
+	 * complete or 100% accurate, not all bits used by OpenCSD anyway.
 	 */
-	config_opts = cs_etm_get_config(itr);
-	if (config_opts & BIT(ETM_OPT_CYCACC))
-		config |= BIT(ETM4_CFG_BIT_CYCACC);
-	if (config_opts & BIT(ETM_OPT_CTXTID))
-		config |= BIT(ETM4_CFG_BIT_CTXTID);
-	if (config_opts & BIT(ETM_OPT_TS))
-		config |= BIT(ETM4_CFG_BIT_TS);
-	if (config_opts & BIT(ETM_OPT_RETSTK))
-		config |= BIT(ETM4_CFG_BIT_RETSTK);
-	if (config_opts & BIT(ETM_OPT_CTXTID2))
-		config |= BIT(ETM4_CFG_BIT_VMID) |
-			  BIT(ETM4_CFG_BIT_VMID_OPT);
-	if (config_opts & BIT(ETM_OPT_BRANCH_BROADCAST))
-		config |= BIT(ETM4_CFG_BIT_BB);
-
-	return config;
+	if (!evsel__get_config_val(evsel, "cycacc", &val) && val)
+		trcconfigr |= TRCCONFIGR_CCI;
+	if (!evsel__get_config_val(evsel, "contextid1", &val) && val)
+		trcconfigr |= TRCCONFIGR_CID;
+	if (!evsel__get_config_val(evsel, "timestamp", &val) && val)
+		trcconfigr |= TRCCONFIGR_TS;
+	if (!evsel__get_config_val(evsel, "retstack", &val) && val)
+		trcconfigr |= TRCCONFIGR_RS;
+	if (!evsel__get_config_val(evsel, "contextid2", &val) && val)
+		trcconfigr |= TRCCONFIGR_VMID | TRCCONFIGR_VMIDOPT;
+	if (!evsel__get_config_val(evsel, "branch_broadcast", &val) && val)
+		trcconfigr |= TRCCONFIGR_BB;
+
+	return trcconfigr;
 }
 
 static size_t
@@ -688,7 +677,7 @@ static void cs_etm_save_etmv4_header(__u64 data[], struct auxtrace_record *itr,
 	struct perf_pmu *cs_etm_pmu = ptr->cs_etm_pmu;
 
 	/* Get trace configuration register */
-	data[CS_ETMV4_TRCCONFIGR] = cs_etmv4_get_config(itr);
+	data[CS_ETMV4_TRCCONFIGR] = cs_etmv4_synth_trcconfigr(itr);
 	/* traceID set to legacy version, in case new perf running on older system */
 	data[CS_ETMV4_TRCTRACEIDR] = cs_etm_get_legacy_trace_id(cpu);
 
@@ -720,7 +709,7 @@ static void cs_etm_save_ete_header(__u64 data[], struct auxtrace_record *itr, st
 	struct perf_pmu *cs_etm_pmu = ptr->cs_etm_pmu;
 
 	/* Get trace configuration register */
-	data[CS_ETE_TRCCONFIGR] = cs_etmv4_get_config(itr);
+	data[CS_ETE_TRCCONFIGR] = cs_etmv4_synth_trcconfigr(itr);
 	/* traceID set to legacy version, in case new perf running on older system */
 	data[CS_ETE_TRCTRACEIDR] = cs_etm_get_legacy_trace_id(cpu);
 

-- 
2.34.1


