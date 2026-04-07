Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53088FEEF49
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Apr 2026 14:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4KE4LNWE9ei5fXKZj9AAb4uKojrTcY8EpFDsm6Wly7w=; b=wITKzOoB4s1zuR/GLAXvuaEbgs
	iQ1m/+VVOB10LJ0V8I8clo9JotYxrQggmf8gJeTRKdIJnsmCvLq5xsK504r/ZNrMfIlOkHClGggvV
	XHV5FhazIYi6rC+O1X7R1vszLom/c2JlsS5dziMC1pPFtb4b5vUA+xFO+JKB9Dv5xhhag1/EU2uvS
	IwS7smK+YI9XY/n0Z0TbCYgGORZpdRHizv8sHTqYdJj42K2fm2dXgqDW5Cpql5oGaHny2Eh8wgKu/
	wBosUIwWUGLkRNKcc/yU8/shJ90KCPP0zrQjlPObpAgWeabYe/ZBTg2bviFST9FQiDLjvTtPOlSxb
	fFc+ffcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA741-00000006YvU-3rOh;
	Tue, 07 Apr 2026 14:05:57 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA740-00000006Yu0-05Ie
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Apr 2026 14:05:57 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-488c21c636dso2578415e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Apr 2026 07:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775570754; x=1776175554; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4KE4LNWE9ei5fXKZj9AAb4uKojrTcY8EpFDsm6Wly7w=;
        b=Q99psMHykhPG1VXRlho4vLTcQ9BaW2xSGtJ1eQkKciV9w6BVbfWM+FXvfvNYYQDNrg
         bCYEowg6eTwnQiC3OHSVesJnGYfl/3X1plkxsLHjfwwqLkNW3riZ7FBKVUf3B1ZpOgrF
         aBNE8KD1eiMGrV/M9bGN/iMj5bzPiM/AkbutxoV0jl48O/KvJPwSOCfo+GzAzOX7785Q
         DlkTKpOR8Wax6esCAGGSF7Z6/snDDLXz9lJkqA5BFLyo9aAQyjMM/WyyCeRktT/SirFn
         asJUSgxljPUQND8htLfoYgoQloLol84wokpEZaE7N3CySaLbbP5xOB1AEsRlABKi9kJj
         rL8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775570754; x=1776175554;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4KE4LNWE9ei5fXKZj9AAb4uKojrTcY8EpFDsm6Wly7w=;
        b=qwT1K1sRGp3I8FeQhcesPBG2LUBaD5aJxbTmtjJ2fBUp1d3qdPalli3mUUMfxV68am
         6nCchHMWMCinfqwkjYg80p+tpFkqXAETXowmkpWHp3AQ+1HjrJrDPWlz8hhuNHFU9Ihd
         oDNDaIB1EJ2p716rw+SF+cxdSZimdcQ0WYlm6Qwj34I1+rEb93IeUY0XOfwnhSwvGGfQ
         Nipqd18+OXGHmX4KNQKrbUSW8rguLotEO2/2xlG/HMsVLJ01+6CaH2lYlpPUaOs4b5UL
         02TSt+iHx1xe+imn9FPVOLLQJCvVgEQHetxxWDsqtF3URJRQLOT4NZSjQ9R6RzrGYh8q
         bcSA==
X-Gm-Message-State: AOJu0YwZyFHD2ybJ5SzOX2Lgmoy45iM8VnB4LgFG8eT7KhhRLqcTDa4b
	xFAo4K6InB+xrTqqjC13EiKJmigVBVHCi3kT8SpgaAAYL9tGWhk32ahHsWy0udwi2Bs=
X-Gm-Gg: AeBDiesVThfnWWaBzckqwAU4as5QHc8MiNklCtZWcg71Wj/aetxGN/kPzf9bhDWgQyA
	9xXi4CLv2/6W7Qc4rBwRCIPRo28blSFPWOIT0Hc5EUpNp1367A5jraIDfeyIU9+Ex18ADbZ8tRV
	fJWhZ/sUOB3lrzcxMNnzZ9mmlmLw7CvR7xpoGUVaDu831Johz0exqhuOd750lmdBHBr8MF79J1P
	1i8SOm29eLoFB4GEtkTk+7TSLHeRJf50WAPObIz0G0FOQM2J+A2nQo1Ql6YmA6fJbklLHmmhC5Z
	LJM8wg5fQEXoAGOmTwiDdBECcqM+NiEanpIXl6Udq32li2T5u/1MWFkpiNJVGROuhdd3fkBMoXB
	DAwvEnUAOhQGwOyfjdVSexHeB26p6y9FbDDHn2vMXt2L9tFvYHfsnY5YctCakCj1kwAaD98Kpgn
	umaDnJpH1l85HsxkQ3xlO1pkXKLTLIYvOu
X-Received: by 2002:a05:600c:638e:b0:487:59c:2bb8 with SMTP id 5b1f17b1804b1-488997dec25mr232506695e9.27.1775570753935;
        Tue, 07 Apr 2026 07:05:53 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e822227sm626876145e9.4.2026.04.07.07.05.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 07:05:53 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Tue, 07 Apr 2026 15:05:15 +0100
Subject: [PATCH v2 1/6] perf arm_spe: Make a function to get the MIDR
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260407-james-spe-impdef-decode-v2-1-55d3ef997c48@linaro.org>
References: <20260407-james-spe-impdef-decode-v2-0-55d3ef997c48@linaro.org>
In-Reply-To: <20260407-james-spe-impdef-decode-v2-0-55d3ef997c48@linaro.org>
To: John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>, 
 Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>, 
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, Al Grant <al.grant@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
 linux-kernel@vger.kernel.org, James Clark <james.clark@linaro.org>, 
 Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_070556_081741_7AF3D541 
X-CRM114-Status: GOOD (  17.62  )
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
index 70dd9bee47c7..7447b000f9cd 100644
--- a/tools/perf/util/arm-spe.c
+++ b/tools/perf/util/arm-spe.c
@@ -958,14 +958,9 @@ static void arm_spe__synth_memory_level(struct arm_spe_queue *speq,
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
@@ -973,15 +968,28 @@ static void arm_spe__synth_ds(struct arm_spe_queue *speq,
 
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


