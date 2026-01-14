Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92F3ED37E5E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 15:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RFlRacjoMKjxtVCuFA3rtMsDNUnCiwPHWXGI0rppnjk=; b=WqGCaL57LeiqKwRIF/Z/X+KWMu
	YSPifShpUtSfFOHVyoGIIBgf7TN0nxVfEyBecwa7lBbuuga+Nf2dMTc5CfGpYgbEMFo4JS27f41TW
	J/CHGDY4T32owezQhg20vmORJF1nRhgnhHjATNlu9M4Vk4ohwCtKW1oEKwpLawjhU417fflqObeOR
	eiuMfn7UCKQd9AyNxX7Kbp+ri10O6LFk/j0xMDpwDjb1yBfHryNrfcBF8I1QERDWBNkeSG/AyDjfw
	WIWbqJnGxYEFuXGIfs6SIUvfgYdjsWcZB98XtrMqJOgdRTncZT1XE8fTmkxY6fJ6zz19Z9CkZ1/2I
	c8rSLx0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg3G4-00000009oTI-38cq;
	Wed, 14 Jan 2026 15:58:08 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg3Fq-00000009oBS-1JoD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 15:57:56 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-47edffe5540so4155e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Jan 2026 07:57:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768406273; x=1769011073; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RFlRacjoMKjxtVCuFA3rtMsDNUnCiwPHWXGI0rppnjk=;
        b=BfGX5WDRoGxX+0fi81I0M/y40sMYMnvaL2A1CWqn/8pzAmzZRi2hYh6mtfE8U3QVLj
         PGcHXl+PsV2JDFBdMR/fd84ZVAoKFFl14MX7FAgtK6DpJVa3pOksqUftWUD+DKTGml2a
         VTKsnzxnJj5V1WMJRZ4KrH+RdrK1ZmLRT/W2tenpkwIcXTpo61nVCpaKYpddoMZkUEOD
         pMSR0x4Y2Yjda0qtPp4vUTjjtgBIhsilqjoYQUli7pWMx5p3BAzWgARorIt+PL4apJK4
         sgmiowmoh5md62HFDR5RZVx59rT2EzunovzgdRYYgQiuwEyjLBF5f02vchFPO/sOq8/T
         XERQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768406273; x=1769011073;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RFlRacjoMKjxtVCuFA3rtMsDNUnCiwPHWXGI0rppnjk=;
        b=RK4VimdIY3xEK5Ex0Gm5zYfeOAG8wNbNQwMdUgEMtPg8f9+RiXRr6IJVm3wkV7fJ8y
         G4U6MQA/FOuObr23B0YyjTe1DbwaRJi2kPpFIVENY06Hffr2ZXK/RPAkc5kiNbWE+R2u
         RFoM9+fQirumaH8m7y+Oj48frZ5ShoKNlbsGTjDBCTJL03EGdU7uWeEh8WbUxijxGQCf
         OymZB8iBnI/TOJmtAAWH4VvpLiH1DhaiVAjUPadVKOFU0067Ihrbk9xdcqcLLpq1E9xT
         6YwP5BijZBpwxoRTEik61l0wk44w2rrhOYs4PG/+0gqszPc6ssWKJvN5FlPeLDSueOB5
         9Iew==
X-Forwarded-Encrypted: i=1; AJvYcCUDeQfR4VMN+1xBh700Ct/J3CkUObQJkVXK0mX5g/MNteu9YesXq0vSly5yPvVN1EXO42YiVvwWVmyAzL6o33Ni@lists.infradead.org
X-Gm-Message-State: AOJu0YwQjFml1HhR5Y2ufmShwp2L+0vZr+rmu+vTphPKcMJCMXoZ1I6+
	ISTQpcTBciCKCXfQtZWhBVkXb9P7JoMPkmBOx02rzfRpcRlh4JNBAqOp4+h84NNCFUA=
X-Gm-Gg: AY/fxX4+/Hq94JvjLuoDLRFXFKKam45b9taFFZ3crBAbiNn/spli/s0sAHDi1YwqhR1
	nFfcPHCFUS0b/tEtJikVDFpMN1MBLeMvYpr0fQBkIh6pQsJYOGB2VVjswlLg7ogC/h2bmmdx+T4
	7izwtOXnNarBm/9kUd/4EQCiy1yC1z8SYd3iNT6yNFiyLOr7OzmiWoYo+32+zt1UVCftzasvUhm
	bFtBalYpWS3amVWqSlPRw8xeLx6eLZjP6TNecl11UfuLh0G8jXvCcoi25re4FkRKzEXpK7WqI8J
	Ib1dQrL6B0N+i1eSZhelu8yHNupjyEloEMahx8KsZ8WSpO+bAxPXFXNXy6rqC36BWv7xjbNWLwh
	pjohvNYOixNpEeLd0vSQquSes1NCBoh0DQr1YORe2tXLlkRruWhWqMJ1L9ZTGVxXKV8H6lWd/v6
	46GmsIgTmZdnFyGPgmfnGVqj1mYjbWAyk=
X-Received: by 2002:a05:600c:3586:b0:477:9814:6882 with SMTP id 5b1f17b1804b1-47ee32e09c0mr40202995e9.5.1768406272596;
        Wed, 14 Jan 2026 07:57:52 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47ee85e8807sm7426475e9.16.2026.01.14.07.57.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 07:57:52 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Wed, 14 Jan 2026 15:57:24 +0000
Subject: [PATCH v5 12/14] perf cs-etm: Don't use hard coded config bits
 when setting up TRCCONFIGR
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260114-james-perf-config-bits-v5-12-0ef97aaf1ac0@linaro.org>
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
 Leo Yan <leo.yan@arm.com>, James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_075755_102562_9B3B0470 
X-CRM114-Status: GOOD (  19.48  )
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


