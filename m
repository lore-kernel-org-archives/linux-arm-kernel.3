Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB3BBD59D66
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Dec 2025 15:33:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kIyylrKuVnmfqhBbx84gIScsHXdr4noRfgmns9UOCBc=; b=QgDphVCLwA46LV0OcEXxxykPx6
	GgZED25uZNem3dHUkLPU9jXepbFiBJ673IsqfTvWBi6Rxfrl9laROcxqW8uAnd1b8rgViExWa+AAC
	ON1AFLJLxVZNptnzgFbKMenKYnzKfdm8sq95Ylt1oU2Wm+G3uQNnyNoAnpkhvD6ry+9v+mwjiCLZn
	h3MAvim5kpOKDELjz8uUOEJOc+3R2DTtuneEIDYvi4W0I4ZycHF2M1cavAwAOboDxixgrO3gNTMHs
	h7n/A7FooF8cObfSfvRr1G1qIFsNG4Br3T6atZdBal1S/qQnlDHO6SqHYp5cE8HQBIdsAUq1rWG10
	ikl3cLxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vU58t-00000000jPh-1VO8;
	Fri, 12 Dec 2025 15:33:15 +0000
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vU58i-00000000jDQ-0amT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Dec 2025 15:33:07 +0000
Received: by mail-ed1-x542.google.com with SMTP id 4fb4d7f45d1cf-6418b55f86dso1846416a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Dec 2025 07:33:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765553582; x=1766158382; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kIyylrKuVnmfqhBbx84gIScsHXdr4noRfgmns9UOCBc=;
        b=yUR6SVrl4segjKjMveHARMGOPZoWTga35+1nfuoMaTQJJF+Z/DcJuLtJsA9YwS4Pqf
         yHt5iWizfKUQxBZz6rqyhJxVwXkfWDLxqlPSrGM74URInJRT8Z3yYC7ZOHYvcK4ahFj5
         f0qT2Yzniulk3mrXBw2cLB7vb+HoSl1BfvxlsovEh/EeJQbl8AScKTD8iBzne/Efugbk
         o5C0adxQGAtnRWLtk3+PNpoCYZetTJjsBvspX7a9monUtD18noySDEDZmI0xR6FXKOFw
         n5TzrY2D3lmZhZi8E4m5wvofS0SLDR3eL4eWc+6PzZd2gfD53mt1b6dE1B5aAjYTVkcY
         3OWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765553582; x=1766158382;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kIyylrKuVnmfqhBbx84gIScsHXdr4noRfgmns9UOCBc=;
        b=aFOEhCqSOY3lku+jOKSJx3YPeZVXxTilIDrXIlhvGYO/Ush7nijm3HM+R29NOcriUI
         ALRou/XN+qoMT3sQx/c8mHCygmEDchVoesOPA+QZy6WedQCVGKuFECuASUycOGcAOjZ8
         5T9js8mKYtLOQH6CtCaRq/bNw7p/yHlnjvfmpDyUKMVB6tHnbXDOEmrQfsJIl3ELeh5N
         BQVY8HU0wj3TeE/BRBAPqZXD7fCroZxUkbqF1hKQhB7jfFBHaWSW4K9GVZXteX9DFFFw
         gI/0EDvx8L2OU1sbEHzxrBqx1lh43F0CaV3BcCL5/cGhZWUlfxUbhmq410+JIVKeoqs0
         gvtQ==
X-Forwarded-Encrypted: i=1; AJvYcCUoJ5/rgV1WA3k6MJqzy9uTCDtc/wo3FbMKHQUCzeesdbcE/7w0JyTIvThY0CeRPMrND4xPQSd/lt1pd0VsEI7g@lists.infradead.org
X-Gm-Message-State: AOJu0YwxHrcseir33L1y+jfZKzQumu+JZU9POrnhWCCWBhxaKO/HiJr+
	e/VrKyjubl07WwK7z1eDnAJmpB08N2fE0iubifFpRUzhcvJo3+dk384oLLrde8sqGzk=
X-Gm-Gg: AY/fxX7E8dWmTdgc2bIUfk+llZoANrKZFF7o5YxlJkgWdoGXonKjIIKWeXNGnABvXZA
	9oK4X4JsYO7cX6M+ACnOK6Tl1MmVyzspW+wBsQpjcB3EyCyiEF+385nFvRbf8FoOWyThIBT20tv
	uBB7Pno72j0MCZrvUr6BBLvIjnSBr5K+RdWhJCAvBSAlxYovXwcldiwDLyO3eMi230ECsFkOBg9
	icgjJje+N0pXTGr327H22Jkf7+I13cjmMpKiGOFDbqMvc/Y2YQFWTkZnP7vAFQV1BWd3bGG8eVn
	aj2h1eWl+Y9aMcl/7g/IbsRXHHwZouvlZQpTXKtA00xrvTBrsU5MZUZ50T5tWF9yMixNUA4bCx7
	qIcIKXDxk9QqwPz6hqAOmew/uK6A8FxtJ5gJ5VY/SAP08rnrSJYc7KuuCZjXp0w6lg4aUbKYvPz
	taWbaxhF65iiPHku6TYMVr
X-Google-Smtp-Source: AGHT+IGnR0gQMQNB1+wHObkuQkoO/WDhs9GeM7GP+ll44IR076qgwRjFu3Xp62OThbWfaYmyOQtqjA==
X-Received: by 2002:a05:6402:518b:b0:63c:690d:6a46 with SMTP id 4fb4d7f45d1cf-6499b190338mr2329332a12.13.1765553582073;
        Fri, 12 Dec 2025 07:33:02 -0800 (PST)
Received: from e133063.arm.com ([130.185.218.160])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6498210ed32sm5433234a12.29.2025.12.12.07.33.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Dec 2025 07:33:01 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Fri, 12 Dec 2025 17:32:27 +0200
Subject: [PATCH v3 10/12] perf cs-etm: Don't use hard coded config bits
 when setting up TRCCONFIGR
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251212-james-perf-config-bits-v3-10-aa36a4846776@linaro.org>
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
 James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251212_073305_423388_3F433AC6 
X-CRM114-Status: GOOD (  19.38  )
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
Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/arch/arm/util/cs-etm.c | 79 +++++++++++++++++----------------------
 1 file changed, 34 insertions(+), 45 deletions(-)

diff --git a/tools/perf/arch/arm/util/cs-etm.c b/tools/perf/arch/arm/util/cs-etm.c
index a5135b743e6f18789026323ea75b2a78d6495d73..4a606b1e90f227aef9915e90439b2a024eeabcfe 100644
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
@@ -520,56 +528,37 @@ static u64 cs_etm_synth_etmcr(struct auxtrace_record *itr)
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
+	if (!evsel__get_config_val(cs_etm_pmu, evsel, "cycacc", &val) && val)
+		trcconfigr |= TRCCONFIGR_CCI;
+	if (!evsel__get_config_val(cs_etm_pmu, evsel, "contextid1", &val) && val)
+		trcconfigr |= TRCCONFIGR_CID;
+	if (!evsel__get_config_val(cs_etm_pmu, evsel, "timestamp", &val) && val)
+		trcconfigr |= TRCCONFIGR_TS;
+	if (!evsel__get_config_val(cs_etm_pmu, evsel, "retstack", &val) && val)
+		trcconfigr |= TRCCONFIGR_RS;
+	if (!evsel__get_config_val(cs_etm_pmu, evsel, "contextid2", &val) && val)
+		trcconfigr |= TRCCONFIGR_VMID | TRCCONFIGR_VMIDOPT;
+	if (!evsel__get_config_val(cs_etm_pmu, evsel, "branch_broadcast", &val) && val)
+		trcconfigr |= TRCCONFIGR_BB;
+
+	return trcconfigr;
 }
 
 static size_t
@@ -691,7 +680,7 @@ static void cs_etm_save_etmv4_header(__u64 data[], struct auxtrace_record *itr,
 	struct perf_pmu *cs_etm_pmu = ptr->cs_etm_pmu;
 
 	/* Get trace configuration register */
-	data[CS_ETMV4_TRCCONFIGR] = cs_etmv4_get_config(itr);
+	data[CS_ETMV4_TRCCONFIGR] = cs_etmv4_synth_trcconfigr(itr);
 	/* traceID set to legacy version, in case new perf running on older system */
 	data[CS_ETMV4_TRCTRACEIDR] = cs_etm_get_legacy_trace_id(cpu);
 
@@ -723,7 +712,7 @@ static void cs_etm_save_ete_header(__u64 data[], struct auxtrace_record *itr, st
 	struct perf_pmu *cs_etm_pmu = ptr->cs_etm_pmu;
 
 	/* Get trace configuration register */
-	data[CS_ETE_TRCCONFIGR] = cs_etmv4_get_config(itr);
+	data[CS_ETE_TRCCONFIGR] = cs_etmv4_synth_trcconfigr(itr);
 	/* traceID set to legacy version, in case new perf running on older system */
 	data[CS_ETE_TRCTRACEIDR] = cs_etm_get_legacy_trace_id(cpu);
 

-- 
2.34.1


