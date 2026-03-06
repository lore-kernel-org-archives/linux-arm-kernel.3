Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A47AF01828
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 11:25:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JR6LjrnAwci0LUUBKanGpetesFih9FEDm0wqajrsPkQ=; b=F0S0fb4AVogY9yHm7DbuUpSvyp
	548+gkWSyuTQTZhX5gy/LcAtWBtgooh+0ivuCGUDwN1XN4Ekb3Zirh00nL0tG50v+n2Y5BFAYMX3O
	NXzlWMZg+iNlLynMJN3o1TQW1lXPbrUyWfM6aPbz9RbLAEDQUzAUhnQeT53MWc3jTxsFfp65oExNr
	v6MHUiR5Lvj9azxp7xwQ5e7usnYPssjeNhUSihl2HwU53jE3nZzuzA97OJudRJggRP0dVq07ycGQ9
	3adXm5eNyyuJ0aQ0cEe2RdE5DXfVPH4GxLIpW8BcpG7E5ozEr3wJCrInC4MkBFaoiy82l6oFHiCli
	D+zXd16Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyTIl-00000003Yrc-0k2D;
	Fri, 06 Mar 2026 11:25:03 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyTIh-00000003Ypf-2Gmt
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 11:25:00 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-48375f10628so60477585e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Mar 2026 03:24:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772796298; x=1773401098; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JR6LjrnAwci0LUUBKanGpetesFih9FEDm0wqajrsPkQ=;
        b=kYZNJVcEcLX+pYtQ7R6Y/bdtOMZjP5R49peD+UUaH2qPzC4sc/iGmP1ZYW/ifgYV7+
         EIiKnPYrhBGwjB8CW6hNG/xx0xhbFU4WwaFOagcRFJstEGufMxKePjszEnSkYpDyucIE
         Hk8DyzddH9zTyK2pgRSYhLWP/xcnrrbBN2s/zg25aKpCH6Czv5EUJrbgTxeHWkTrOWaV
         tHCC2NsIS5N0f334I5vFvuD1bQMgDF86bYqQLUEUtyxCwYkMoZiRDfScgnLn6wRyqaqZ
         A5v3jIsTAelMO44jaNtnxxsmO2WRNnInvEXcAd9WM6yaWJPF1PyO9+SOAVXYWhh+zeJy
         mnWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772796298; x=1773401098;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JR6LjrnAwci0LUUBKanGpetesFih9FEDm0wqajrsPkQ=;
        b=HSFypCxue6GcpbtEblYmUZLtfdwy5yeW1SECqZvvqutoYeRA/RbL7Rmd66E1VwEiUp
         1jbk9caOQyyQTzUaI25z5OOp3IMq84HtaFTEvqwauPwQ0WgDlnK3JX8G7Jx5CgCn4V3v
         cgeJy3eLNeN7NrZNCSbjuMcLoYcjsDj/PT8oezms9TbX+8f6hcS3L/h9fG/Uw5+X2ukv
         WR/S+dCShvGM3AbFpwMt6XtYPyg1eYyp8rnoHgIFytcNdoDLqeqwl6B9ww6D1Kfg3Iyc
         o8yTVn5MwmvYEovHnsimHmHdMU5QMh40WuFvyVrlpdERCHY2DeilsAqKjH/RYDH9koDQ
         ggcw==
X-Forwarded-Encrypted: i=1; AJvYcCU4CNPtT+ElQXaJLcm4BuR41Xyhbm/Q70ShNN986lQd1sBMxDlNq55kP9PlKFR6LA4p8v0Aufl2gZWcdtTqpjtO@lists.infradead.org
X-Gm-Message-State: AOJu0YwB+VT/NclYZQxaEAz/RfQzXpT/Kj3dQiALZ6iXZWTLYqqzdZBJ
	UcAnttA9okwMFIhG9h0xygg+jayjJW3XV6MB6pq+XcMskwab2XvjhyyHPwBC+z83YzU=
X-Gm-Gg: ATEYQzx2s4xJ6uce+rQBRX0IurdHk4AkjMP4h78CSv8krLgy6Ps1PF5oG88fMw/9JA3
	srfWdjZIKd1E3h4oaL46ykRkl8uB+Ri5N3rAROJh6n0fYF0qahKbg+qwQp4zu5VYEI9bh7bXJcP
	E9Bz+qpCLYFHNMgK766s26COu+PavZLtaE4vvhZb+9Ia82QUbn6OHqT6B3s7YJVLKPrI11YheRA
	9uhjqC/64pWoJ0TlkhPrVjQ8Sn4S0f0QM/EeaWw8bI22on6LAiViBkOTu1RUVRGaLEMZAAzbZQj
	wiZIpMDxGuL0lzVbItZYm2XJ/q/HQabLUuzO2iBt39bGYwiYSCZPBsqh+lE5kMIenbq5aPQBy+D
	fhrt33bnxesvgjqIBGaIqJ5g1uNesgmAIpqHeyMOdDEx1PKs5hGbwY6yxVAoIIl0U1dN4PtxIat
	C26InoRn9C15x1eyJNCSlRInEJ/GCQYQydImq7Ctpakk0=
X-Received: by 2002:a05:600c:3b0c:b0:480:3ad0:93bf with SMTP id 5b1f17b1804b1-48526979668mr26034545e9.24.1772796297511;
        Fri, 06 Mar 2026 03:24:57 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48527681a3esm66542245e9.4.2026.03.06.03.24.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 03:24:57 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Fri, 06 Mar 2026 11:24:45 +0000
Subject: [PATCH 1/2] perf cs-etm: Finish removal of ETM_OPT_*
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260306-james-perf-remove-etm_opt-v1-1-03c662380361@linaro.org>
References: <20260306-james-perf-remove-etm_opt-v1-0-03c662380361@linaro.org>
In-Reply-To: <20260306-james-perf-remove-etm_opt-v1-0-03c662380361@linaro.org>
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
 linux-kernel@vger.kernel.org, James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_032459_652341_DF32E465 
X-CRM114-Status: GOOD (  24.72  )
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

Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/arch/arm/util/cs-etm.c               | 14 ----------
 tools/perf/util/cs-etm-decoder/cs-etm-decoder.c |  2 +-
 tools/perf/util/cs-etm.c                        | 36 +++++++++----------------
 tools/perf/util/cs-etm.h                        | 15 +++++++++++
 4 files changed, 28 insertions(+), 39 deletions(-)

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
index 95f439c96180..6c907c01635b 100644
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
 
@@ -2914,29 +2914,19 @@ static int cs_etm__process_auxtrace_event(struct perf_session *session,
 	return 0;
 }
 
-static int cs_etm__setup_timeless_decoding(struct cs_etm_auxtrace *etm)
+static void cs_etm__setup_timeless_decoding(struct cs_etm_auxtrace *etm,
+					    u64 *metadata)
 {
-	struct evsel *evsel;
-	struct evlist *evlist = etm->session->evlist;
-
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
@@ -3499,9 +3489,7 @@ int cs_etm__process_auxtrace_info_full(union perf_event *event,
 	etm->auxtrace.evsel_is_auxtrace = cs_etm__evsel_is_auxtrace;
 	session->auxtrace = &etm->auxtrace;
 
-	err = cs_etm__setup_timeless_decoding(etm);
-	if (err)
-		return err;
+	cs_etm__setup_timeless_decoding(etm, metadata[0]);
 
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


