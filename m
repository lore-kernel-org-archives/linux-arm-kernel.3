Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17A65F531E8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Apr 2026 11:06:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LkEHFh887Es+jtZSLZuibHtBrvBj/V7mtq/pJJpeMMk=; b=O/G+a0yPpd1QwPocBTbZqz/2YF
	4UYa3D21IcEJKiY+Uvxj/i4MbKuYakVKsmeb0KTZOVjmC/mEJMVsFFWeDJWCDV8WpiQIb8laefTkT
	MieAH3DlZlB5efMFVb81STMT+t+ZzoJtfnQeZAlXS+bAxulVjOGEPrcWTotD5v/3zvsRuUXgzD9+z
	gcRIOMI+K/No0jx6obkjHjDZ6abwIhSNlS2yYDLXvGHKBhAmha36nmyMshjflxSgu4z6/6zYw6n2e
	sykGN6muH6iwQt01WIItb3t1tnW/jnZySQTz4O/EV6m9/0gbFEnnSHdvpPjd0OWK1s7C6P3WRk7OE
	OapJWDrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCbb2-0000000HCMF-0Qho;
	Tue, 14 Apr 2026 11:06:20 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCbaz-0000000HCL8-2KvJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Apr 2026 11:06:18 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4852b81c73aso51448705e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Apr 2026 04:06:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776164775; x=1776769575; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LkEHFh887Es+jtZSLZuibHtBrvBj/V7mtq/pJJpeMMk=;
        b=TmTftvrI2OFwvb4Q9yf9bdZ9KFCsN7ilfgw0YnTcWXrEaOMwGVEKEP7nNjbA1zfOTJ
         +Y7K2NVZE/wfhZtIUIYRewjRuK29zYgPLmla46MXpYGFcISQZdtZQNP4cjENDF1SsVVM
         iWaXG7GI+q4hcVB8i7peJWj/cdpNrKPHvhf4uNRH/5ScbJJMlyZDMEpITVs76wZciN4a
         FTiAbnVustKX+x/Y87yX0ToDqS/b3WvtgdubrZFBvElOSukDKTeI2pFWun41jYuNmQTM
         QSwOq4HFePtfs/nC3B52MUFgVlyXKP5ox1cJdBx/3FQ8OvwbWBzTHvNdKY7zgZwgxPRj
         Ry+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776164776; x=1776769576;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LkEHFh887Es+jtZSLZuibHtBrvBj/V7mtq/pJJpeMMk=;
        b=ph5Tt8/Zmp8EjAw3MRVF7dw+0llf22uIiFR9d/Uq7SAzh662ZhqdkmA0MZ99MwuS9Q
         I7RV69dMg5hedeSLEhz+27RKnCJBZwQ61zdKY42YK6+lPu0qumiON+cxwmf3SO5fwF15
         eSFG/epzLIzIaL6lJCRLMEAgHnjHTZsP2CzkR5UEu7OHx8mxxA+bJD93sntsHEDBXb4u
         sgj4hMdgpweQ+e4Cbz/C2O8bkwHczM82JuAB0J0FdxEBxmUDdSTx3vXSsGyAHj9fWZ5m
         o07WtMCBvJr+tdWdijYBxYWwWT60K7w/gIBO+B7uZDrJXFnvaPDLgkHnnLDJirRhVRhK
         g2QA==
X-Gm-Message-State: AOJu0YzLHv0SfftCF/mQE0JAQm+tZvm9/8jz+B89DGPEEbFOjRGzU+5a
	vA00ody0wWPJqmVfQc3pv1ojv9FdLTtPnj3zjaDX5S6OqoTwYIrlk8QaKHHCrAuxqMM=
X-Gm-Gg: AeBDieuiSpj3lTvC31FD1bUyWar9OagRvWdibGaFuoe1jy53tj7WkioyP5AL3fOAtLa
	6MggJZv2G5cd1dUM0pF7qu7n/XESxpboSHF3jWwWkWMAYAzK59sBVGj5e2/wPHPIRgjNuBj6kMt
	CTPJAHpbQMXC8+o26ue2vCMw9QV0uk7YoI+bODIQzmV6/OfU7Ovts87BCsFvtkmt/n9gpa/3EUB
	zgjAgvyC4qdkLGpwVhqILC6IlHrhKQBvW9JtXScqBt24GjHyP7N2uCEHhd68iMSEZbWAEvv0Cvt
	IB0NVGRLiACnts6/MrKTMdQGKnSWZOaQhQJSL1I9hw5QWBSnHgfpD4V2507w6zt299WmfcH9Cyh
	St7Uhq5X/qVvpltoR77vf+WizmYf79P7oC277b709jSovHLLP5ek2S4gtxuVfCo3NH7/tAauXNE
	TqGIytSTQObo0jl+/w0LcL2XtnjBhau4Wa/FvSPTuBpg==
X-Received: by 2002:a05:600c:c0da:b0:488:ab5b:d711 with SMTP id 5b1f17b1804b1-488d6864b6cmr191505975e9.23.1776164775580;
        Tue, 14 Apr 2026 04:06:15 -0700 (PDT)
Received: from e133063.arm.com ([213.137.22.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d5d9dd86sm183254655e9.4.2026.04.14.04.06.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 04:06:13 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Tue, 14 Apr 2026 12:04:47 +0100
Subject: [PATCH v3 1/6] perf arm_spe: Make a function to get the MIDR
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260414-james-spe-impdef-decode-v3-1-63baf9c893b1@linaro.org>
References: <20260414-james-spe-impdef-decode-v3-0-63baf9c893b1@linaro.org>
In-Reply-To: <20260414-james-spe-impdef-decode-v3-0-63baf9c893b1@linaro.org>
To: John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>, 
 Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>, 
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
 linux-kernel@vger.kernel.org, James Clark <james.clark@linaro.org>, 
 Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260414_040617_633716_8B8968FD 
X-CRM114-Status: GOOD (  17.30  )
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

We'll need the MIDR to dump IMPDEF events in the next commits so extract
a function for it.

No functional changes intended.

Reviewed-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/util/arm-spe.c | 36 ++++++++++++++++++++++--------------
 1 file changed, 22 insertions(+), 14 deletions(-)

diff --git a/tools/perf/util/arm-spe.c b/tools/perf/util/arm-spe.c
index e5835042acdf7685f95e19665cd45f97ed868275..39046033e1433cff82ef0668074867aba4a462a4 100644
--- a/tools/perf/util/arm-spe.c
+++ b/tools/perf/util/arm-spe.c
@@ -972,14 +972,9 @@ static void arm_spe__synth_memory_level(struct arm_spe_queue *speq,
 	}
 }
 
-static void arm_spe__synth_ds(struct arm_spe_queue *speq,
-			      const struct arm_spe_record *record,
-			      union perf_mem_data_src *data_src)
+static int arm_spe__get_midr(struct arm_spe *spe, int cpu, u64 *midr)
 {
-	struct arm_spe *spe = speq->spe;
-	u64 *metadata = NULL;
-	u64 midr;
-	unsigned int i;
+	u64 *metadata;
 
 	/* Metadata version 1 assumes all CPUs are the same (old behavior) */
 	if (spe->metadata_ver == 1) {
@@ -987,15 +982,28 @@ static void arm_spe__synth_ds(struct arm_spe_queue *speq,
 
 		pr_warning_once("Old SPE metadata, re-record to improve decode accuracy\n");
 		cpuid = perf_env__cpuid(perf_session__env(spe->session));
-		midr = strtol(cpuid, NULL, 16);
-	} else {
-		metadata = arm_spe__get_metadata_by_cpu(spe, speq->cpu);
-		if (!metadata)
-			return;
-
-		midr = metadata[ARM_SPE_CPU_MIDR];
+		*midr = strtol(cpuid, NULL, 16);
+		return 0;
 	}
 
+	metadata = arm_spe__get_metadata_by_cpu(spe, cpu);
+	if (!metadata)
+		return -EINVAL;
+
+	*midr = metadata[ARM_SPE_CPU_MIDR];
+	return 0;
+}
+
+static void arm_spe__synth_ds(struct arm_spe_queue *speq,
+			      const struct arm_spe_record *record,
+			      union perf_mem_data_src *data_src)
+{
+	u64 midr;
+	unsigned int i;
+
+	if (arm_spe__get_midr(speq->spe, speq->cpu, &midr))
+		return;
+
 	for (i = 0; i < ARRAY_SIZE(data_source_handles); i++) {
 		if (is_midr_in_range_list(midr, data_source_handles[i].midr_ranges)) {
 			return data_source_handles[i].ds_synth(record, data_src);

-- 
2.34.1


