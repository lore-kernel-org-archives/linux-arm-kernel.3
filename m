Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D0BCF0183A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 14:09:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tdnYy4pqHOHDMEp3XhdGrBeoVKwJbjAtI69wSRa1lMc=; b=DzYzSDsp/FjA2XdNFMcx8UDu2E
	N2OYHY9eUtQvuzAJzyMiRjfz+L4AzBM+0Y/+BfXZjaFnTjIH2PqwEVvNZ3yFpiAJuEY/uRgD6c1dp
	hS3o2V7ugjF2Y4d9x/4S+zScj9uFGkFW417jSUl521yBjvCyhMD5+G43nlTT2LubsIA1hHkrAgN1I
	+wpZboSjsz1gTv6xaIEa8MjOaNXJmgqM4AC4Q6fRCV9rJwMP9EBP4HvPi+DAps0pUlW8+W2QwX3WC
	cG+MuBI9yIuQhO6COu6hK3/hg6rK8QK7WM1f/jDm12BaTaIYjmgHaJUkb7SWwElvNBRGyYjECzw/j
	ZolW91jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyVrL-00000003rcH-0uRn;
	Fri, 06 Mar 2026 14:08:55 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyVrH-00000003raO-2XfI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 14:08:52 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-48069a48629so97319535e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Mar 2026 06:08:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772806130; x=1773410930; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tdnYy4pqHOHDMEp3XhdGrBeoVKwJbjAtI69wSRa1lMc=;
        b=d7X3iw4fy7w3BQwwwBkBnb5MzOxTpX0Cikkthhh0tPXe90rK7vH6UppVKKnWypLOZ1
         6YgCwMg3zGJv7h6/gzYHjYVD9atnnxUGV150VhtX/7qxQwRB4Vt7QdUEB+nf40/mJam0
         WIUblHn4rYeEHn3xBGLS1NQIc0Da9rlAQ2VX4La3R0HkSrufjqiva03s6ltq7pT6sarL
         Xf/k9McStcg0JQaQzN9VGiIWfs/aKH97pM6R7U6vbrUyjvzuu0eVLvII9Q1UxJ2dzfgt
         C+f4vX+kLDlY72hRz7Iy4lvgpdfzT3uItgWPZJmnUiVs/PH42CAp5YJq7+9fQVeNxAvr
         j8TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772806130; x=1773410930;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tdnYy4pqHOHDMEp3XhdGrBeoVKwJbjAtI69wSRa1lMc=;
        b=JidCZ2/uPKvcDggibz7clyCWu1aiEP9MR2h/PzhAsgC100qIK1nyRmP+xoJnV0reIK
         TZNdOtl1tT4ZKa180n/xzTAPjQc96XlNrxnV2/PygQLsFY2KVFwrPxJmGN9/EfbA1fKO
         p+3wT6hhkyU9tquLWKrQL3pFK5/xU1fbh0qToPP9D4mFpm6Gn3hJWlVYv+C0fGsoBBg/
         xo28EqdkIkYNOfkLUtwv+F5mpxowP2I0+DM6HDzFFeqJRP1d2nt1XX6rmGVoeg79qwUl
         CcJDPc655QfRp6aVp6YjXg2NRDKGWRvb2zmlXYJieOFXq2/ql2YLfN+t23faxm56ltZ4
         sCog==
X-Forwarded-Encrypted: i=1; AJvYcCV10tX8nJ64xYPLqoxz5Qcd1IGIWlgXCOfsZ/w1XUPY0PNv06+MCAtwud+60nlGZw+4Uj+8GJD75YFYwR83Vr8w@lists.infradead.org
X-Gm-Message-State: AOJu0YwhXEaactl+YrWxumiBL6yhZuuqKMsxlH2ZNlDD5pCHdlRfv8a6
	BOcRmMucJrisFXtBb0qAVr9XWH6TSjYwpSg2SxvZuq9ubftygw08jgt9drFrzXS+/fwochflEls
	IVGrvPjI=
X-Gm-Gg: ATEYQzw8jgVXlN51TJGnOT0F74opzuFoEs/ozdL6ou9fxAiwKQ2Y9K4OpUZjRVclPUv
	hJRuF5wYMRIHduTJOEeKtkd5V5RiM4zTpV36DnQr0PzXFVztRzWDzkMjdyD9TC1q2bsqLB48diT
	AzStHvvownRoXSFci/stAVJ8vHxuTf7TnKJ9kGW6M/4IAwazd9edoixfNQlEllEwQomG8YDoYes
	eVojDTZKsaUYZPZ+ZDGhxt+H0pWoQ7zMQOPKeBGZheaO/j3jug1Yo4n+FBjeQyS9U+kLwf31LD8
	mwu5/qzoOhjxJIDa2SfIg8m5UtbBEw520O1Qe2/OwOUNy+Aj1rvFYVTdP3BUm2TJTYaMwuBb/QI
	HmZIVKYh/AIBMcBwZI2g3pzt6J4NDcyffO9Mm4KjckyWe20k+kRX9xwWdq1gpWq3yvjDAesqG9Q
	82m06uU6vCiZRjUf6MrfV0Aog0zMfFLxx5
X-Received: by 2002:a05:600c:4710:b0:480:20f1:7abd with SMTP id 5b1f17b1804b1-48526978dc0mr34177745e9.31.1772806129556;
        Fri, 06 Mar 2026 06:08:49 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dae2bdf8sm4212967f8f.25.2026.03.06.06.08.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 06:08:49 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Fri, 06 Mar 2026 14:08:34 +0000
Subject: [PATCH v2 1/2] perf cs-etm: Finish removal of ETM_OPT_*
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260306-james-perf-remove-etm_opt-v2-1-b411d3ae24b3@linaro.org>
References: <20260306-james-perf-remove-etm_opt-v2-0-b411d3ae24b3@linaro.org>
In-Reply-To: <20260306-james-perf-remove-etm_opt-v2-0-b411d3ae24b3@linaro.org>
To: Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Leo Yan <leo.yan@linux.dev>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>
Cc: John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, coresight@lists.linaro.org, 
 linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
 linux-kernel@vger.kernel.org, James Clark <james.clark@linaro.org>, 
 Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_060851_686699_3D546150 
X-CRM114-Status: GOOD (  25.44  )
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

These #defines have been removed from the kernel headers in favour of
the string based PMU format attributes. Usages were previously removed
from the recording side of cs-etm in Perf. Finish the removal by
removing usages from the decode side too.

It's a straight replacement of the old #defines with the new register
bit definitions. Except cs_etm__setup_timeless_decoding() which wasn't
looking at the saved metadata and was instead hard coding an access to
'attr.config'. This was vulnerable to the same issue of .config being
moved to .config2 etc that the original removal of ETM_OPT_* tried to
fix. So fix that too.

Tested-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/arch/arm/util/cs-etm.c               | 14 ----------
 tools/perf/util/cs-etm-decoder/cs-etm-decoder.c |  2 +-
 tools/perf/util/cs-etm.c                        | 36 +++++++++----------------
 tools/perf/util/cs-etm.h                        | 15 +++++++++++
 4 files changed, 29 insertions(+), 38 deletions(-)

diff --git a/tools/perf/arch/arm/util/cs-etm.c b/tools/perf/arch/arm/util/cs-etm.c
index dc3f4e86b075..4418d21708d6 100644
--- a/tools/perf/arch/arm/util/cs-etm.c
+++ b/tools/perf/arch/arm/util/cs-etm.c
@@ -68,20 +68,6 @@ static const char * const metadata_ete_ro[] = {
 
 enum cs_etm_version { CS_NOT_PRESENT, CS_ETMV3, CS_ETMV4, CS_ETE };
 
-/* ETMv4 CONFIGR register bits */
-#define TRCCONFIGR_BB		BIT(3)
-#define TRCCONFIGR_CCI		BIT(4)
-#define TRCCONFIGR_CID		BIT(6)
-#define TRCCONFIGR_VMID		BIT(7)
-#define TRCCONFIGR_TS		BIT(11)
-#define TRCCONFIGR_RS		BIT(12)
-#define TRCCONFIGR_VMIDOPT	BIT(15)
-
-/* ETMv3 ETMCR register bits */
-#define ETMCR_CYC_ACC		BIT(12)
-#define ETMCR_TIMESTAMP_EN	BIT(28)
-#define ETMCR_RETURN_STACK	BIT(29)
-
 static bool cs_etm_is_ete(struct perf_pmu *cs_etm_pmu, struct perf_cpu cpu);
 static int cs_etm_get_ro(struct perf_pmu *pmu, struct perf_cpu cpu, const char *path, __u64 *val);
 static bool cs_etm_pmu_path_exists(struct perf_pmu *pmu, struct perf_cpu cpu, const char *path);
diff --git a/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c b/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c
index 3050fe212666..212f17a3dc72 100644
--- a/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c
+++ b/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c
@@ -549,7 +549,7 @@ cs_etm_decoder__set_tid(struct cs_etm_queue *etmq,
 	/*
 	 * Process the PE_CONTEXT packets if we have a valid contextID or VMID.
 	 * If the kernel is running at EL2, the PID is traced in CONTEXTIDR_EL2
-	 * as VMID, Bit ETM_OPT_CTXTID2 is set in this case.
+	 * as VMID, Format attribute 'contextid2' is set in this case.
 	 */
 	switch (cs_etm__get_pid_fmt(etmq)) {
 	case CS_ETM_PIDFMT_CTXTID:
diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
index 95f439c96180..8a639d2e51a4 100644
--- a/tools/perf/util/cs-etm.c
+++ b/tools/perf/util/cs-etm.c
@@ -194,7 +194,7 @@ int cs_etm__get_cpu(struct cs_etm_queue *etmq, u8 trace_chan_id, int *cpu)
  *   CS_ETM_PIDFMT_CTXTID2: CONTEXTIDR_EL2 is traced.
  *   CS_ETM_PIDFMT_NONE: No context IDs
  *
- * It's possible that the two bits ETM_OPT_CTXTID and ETM_OPT_CTXTID2
+ * It's possible that the two format attributes 'contextid1' and 'contextid2'
  * are enabled at the same time when the session runs on an EL2 kernel.
  * This means the CONTEXTIDR_EL1 and CONTEXTIDR_EL2 both will be
  * recorded in the trace data, the tool will selectively use
@@ -210,15 +210,15 @@ static enum cs_etm_pid_fmt cs_etm__init_pid_fmt(u64 *metadata)
 	if (metadata[CS_ETM_MAGIC] == __perf_cs_etmv3_magic) {
 		val = metadata[CS_ETM_ETMCR];
 		/* CONTEXTIDR is traced */
-		if (val & BIT(ETM_OPT_CTXTID))
+		if (val & ETMCR_CTXTID)
 			return CS_ETM_PIDFMT_CTXTID;
 	} else {
 		val = metadata[CS_ETMV4_TRCCONFIGR];
 		/* CONTEXTIDR_EL2 is traced */
-		if (val & (BIT(ETM4_CFG_BIT_VMID) | BIT(ETM4_CFG_BIT_VMID_OPT)))
+		if (val & (TRCCONFIGR_VMID | TRCCONFIGR_VMIDOPT))
 			return CS_ETM_PIDFMT_CTXTID2;
 		/* CONTEXTIDR_EL1 is traced */
-		else if (val & BIT(ETM4_CFG_BIT_CTXTID))
+		else if (val & TRCCONFIGR_CID)
 			return CS_ETM_PIDFMT_CTXTID;
 	}
 
@@ -2914,29 +2914,21 @@ static int cs_etm__process_auxtrace_event(struct perf_session *session,
 	return 0;
 }
 
-static int cs_etm__setup_timeless_decoding(struct cs_etm_auxtrace *etm)
+static void cs_etm__setup_timeless_decoding(struct cs_etm_auxtrace *etm)
 {
-	struct evsel *evsel;
-	struct evlist *evlist = etm->session->evlist;
+	/* Take first ETM as all options will be the same for all ETMs */
+	u64 *metadata = etm->metadata[0];
 
 	/* Override timeless mode with user input from --itrace=Z */
 	if (etm->synth_opts.timeless_decoding) {
 		etm->timeless_decoding = true;
-		return 0;
+		return;
 	}
 
-	/*
-	 * Find the cs_etm evsel and look at what its timestamp setting was
-	 */
-	evlist__for_each_entry(evlist, evsel)
-		if (cs_etm__evsel_is_auxtrace(etm->session, evsel)) {
-			etm->timeless_decoding =
-				!(evsel->core.attr.config & BIT(ETM_OPT_TS));
-			return 0;
-		}
-
-	pr_err("CS ETM: Couldn't find ETM evsel\n");
-	return -EINVAL;
+	if (metadata[CS_ETM_MAGIC] == __perf_cs_etmv3_magic)
+		etm->timeless_decoding = !(metadata[CS_ETM_ETMCR] & ETMCR_TIMESTAMP_EN);
+	else
+		etm->timeless_decoding = !(metadata[CS_ETMV4_TRCCONFIGR] & TRCCONFIGR_TS);
 }
 
 /*
@@ -3499,9 +3491,7 @@ int cs_etm__process_auxtrace_info_full(union perf_event *event,
 	etm->auxtrace.evsel_is_auxtrace = cs_etm__evsel_is_auxtrace;
 	session->auxtrace = &etm->auxtrace;
 
-	err = cs_etm__setup_timeless_decoding(etm);
-	if (err)
-		return err;
+	cs_etm__setup_timeless_decoding(etm);
 
 	etm->tc.time_shift = tc->time_shift;
 	etm->tc.time_mult = tc->time_mult;
diff --git a/tools/perf/util/cs-etm.h b/tools/perf/util/cs-etm.h
index a8caeea720aa..aa9bb4a32eca 100644
--- a/tools/perf/util/cs-etm.h
+++ b/tools/perf/util/cs-etm.h
@@ -230,6 +230,21 @@ struct cs_etm_packet_queue {
 /* CoreSight trace ID is currently the bottom 7 bits of the value */
 #define CORESIGHT_TRACE_ID_VAL_MASK	GENMASK(6, 0)
 
+/* ETMv4 CONFIGR register bits */
+#define TRCCONFIGR_BB		BIT(3)
+#define TRCCONFIGR_CCI		BIT(4)
+#define TRCCONFIGR_CID		BIT(6)
+#define TRCCONFIGR_VMID		BIT(7)
+#define TRCCONFIGR_TS		BIT(11)
+#define TRCCONFIGR_RS		BIT(12)
+#define TRCCONFIGR_VMIDOPT	BIT(15)
+
+/* ETMv3 ETMCR register bits */
+#define ETMCR_CYC_ACC		BIT(12)
+#define ETMCR_CTXTID		BIT(14)
+#define ETMCR_TIMESTAMP_EN	BIT(28)
+#define ETMCR_RETURN_STACK	BIT(29)
+
 int cs_etm__process_auxtrace_info(union perf_event *event,
 				  struct perf_session *session);
 void cs_etm_get_default_config(const struct perf_pmu *pmu, struct perf_event_attr *attr);

-- 
2.34.1


