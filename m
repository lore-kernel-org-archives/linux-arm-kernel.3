Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6487D3B7F3
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Dec 2025 14:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h3MJH/lNPT8DNNCsCKfxfekwOJGt2219jutaHJgnIdQ=; b=da9065q4girNakHnv3vQtpg6MJ
	t8SVZKtBL6e9FENqUVS5ZA2lxkn6TgbeRPPbTJ242vZsOX7mrl2jrEvr7v6RgDxc6giC7iwljt2Wa
	vZbj3GaQeYx94Zni1o/67aj9yC/hITAF6bsHwa7wrgssk5v15EA5EFwDh8UD7XLWv4gOpU623VEAY
	KIQUBEzdPa6UdWrsIQYGlqLmp5KXcbTHgnJ8K8qHw8lkXAOBG6hc0x/TTPQB7ImjOYLZSabhwX31L
	VufeUYcY4NPOzR4XAPY0thOfZ/tLhiAp356+3E3wn7uJGPBpilHN401gIHAJ3C09Qf2+J3/v9tnzm
	PgDQomjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSc9K-0000000DBFu-10A7;
	Mon, 08 Dec 2025 14:23:38 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSc9G-0000000DB9r-0ZGj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Dec 2025 14:23:35 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-477a2ab455fso53858835e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Dec 2025 06:23:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765203812; x=1765808612; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h3MJH/lNPT8DNNCsCKfxfekwOJGt2219jutaHJgnIdQ=;
        b=XdxIHw9FVW8z90qUa/UwAsSesWolg2d5PRB/3hpdGAwsnslkeHe3ypTJU9QXM84xRf
         SDxXMZ8KZfKs3gYMSvKVvEKY2cGgV8WObT1m69gunyKjymCCiBunVDqTAYoXxqUVZeez
         2m6dSZw+3BysUKH7mWOJzhJ8aU3Mv7D2fe/x5b2RUmkmAL89vnDNM4xs+k+U4ahX9ndc
         ubksgrAsllC1k4JBm7pwKY3VByDf27f8HezdQsvB7P4c59GZGCdHLjC1/izKooD4ZwBo
         vnMb5V67neHAkN6SqOTYpAiJlSFyoQEs5McjpzOmq3mp/xXG1P1iopmNW6JCmk5i1d/U
         qHOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765203812; x=1765808612;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=h3MJH/lNPT8DNNCsCKfxfekwOJGt2219jutaHJgnIdQ=;
        b=np+zHLirag9mmXlnoVSdfA2GEov1febZzuPiYkcbdKZYTTL+gSI39a3UISKoVNT5K/
         mZqau8OHXeinSU5luilRU/J6Ly8pLPthzT3Cr4QiUq3TmSEkBxq/UZS75eQLem6Sskq1
         5x90d1Sgp8cXG26plQeFTUz9PLLZ3ikttr3u6Kzf/X1IIt5TmVBvaTajkCMlhqdagp0c
         bFo/fbcFvPqsdvCcw3md4447PskS8AllyrXrwy7ftGUlrZG94a0TMMTXN2dweVQO98Lq
         NOJRLVpOl/h9R0p4YNzi6D6fiIauZiJl7nWO/mgJD+MDNylqkm7oIKBxAbjufdCFh61V
         WtKw==
X-Forwarded-Encrypted: i=1; AJvYcCXC2dArwr59AA67g0bTmzV2dGAQyInXuWxYTxKfsOL8JwpIt70erHialWfnR2HATfgTWlSWJx1ogqre19A+a4as@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1AmEo4P3jYaanV4NhHmpLOZCQ6lJ3IqUFrJKKnYRSC6a0WXyi
	JeGlm4DVbvT/dhRSXSerxwqZRS9U6vnpdKiSTjXZnGWQAuWgmxRHvcShNG4Jcvl5jGheI1YJnnm
	OUoHT
X-Gm-Gg: ASbGncu4V14opn8G/o5sX0EQ7INu0+rMlWvsOYoRVLjqdClNQs7oeS+Ti9xWDuEHxCd
	NiC50N2tYSnzFBqLn5QZDzaM7a5QpuGQENIyFytL8tBwI35j3vGRivCM3SxNYHfpsum1P2hFv0p
	cQsEZtdU/Zz/kFeACXzxvUilG0z152ihXst7l5sB4f1CTAN5FZdD3U0PwjyP4Op19Y2sMEiDQiU
	iSFhosi5ZMunplfa/WT8WjYlQIS9qOQwr2GPatJjGACFlD0shEfFanZk//YlsunfdntLAnkDzZI
	PJox2+KtexhkHe3dxfpp3sJwm/tISBrARKQqFXrvGo+k05FoTu3cSzQ/IT/fKAPCiadiBlWiLEB
	Epp0asW/KjN1y9zd6gqcJVzS5McHKqV0iUpyaDGrQQNgKrPFugnr2RV6thvO/DQK0aQ2yTfUmHg
	ZzbgIaErH0A+2Q7wVlRhMB
X-Google-Smtp-Source: AGHT+IFyQ2glgXqpcjiC8KcvlMBIRf60rQxQ/nkTZCnm7ai0E3dGboO5ydFiCpMyFkFY0AjK7zhV/Q==
X-Received: by 2002:a05:600c:4ed3:b0:45d:f83b:96aa with SMTP id 5b1f17b1804b1-47939df12f6mr84356285e9.7.1765203812098;
        Mon, 08 Dec 2025 06:23:32 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47930920e0dsm248561065e9.2.2025.12.08.06.23.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Dec 2025 06:23:30 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Mon, 08 Dec 2025 14:22:13 +0000
Subject: [PATCH v2 10/12] perf cs-etm: Don't use hard coded config bits
 when setting up TRCCONFIGR
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251208-james-perf-config-bits-v2-10-4ac0281993b0@linaro.org>
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
X-CRM114-CacheID: sfid-20251208_062334_218415_5D9088BC 
X-CRM114-Status: GOOD (  19.52  )
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
index a5135b743e6f..4a606b1e90f2 100644
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


