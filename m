Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D95E6C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 15:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PjhDYf9y6EuvwS1bzG74pgfv+zF3H7PqlliS5Dv+cFI=; b=hPyOFjLOGG22be0Sbbvhbymzmu
	izgAXQW81DKxtbd2VxObs/Ma9xV9B39Pjotbm6SvBd2FFNx1pzrIPB0Ng22FHYV6mAhk0JUAOP3Bw
	scudLmLKJxhrPQCQ+UQQwTs5w1vL3NLhEmc6bOSTJIFzLTuyOTpIPRNMeM+Jr81cL3SiA/DjzwZ5I
	cy6yguMqQxvHj2nZnUdT9ecLLWT+bziXK2q9TiUVqPVdUg/SxmcVB4ealvC6NVnWV/NAic9YE53T5
	mJ4UMRvijXAm8aDne8cb/IF2CP6TWuFfiWVzS3qMix+mzoWjFPvL4w3GGjwQLbGvxpDwO5HmvElc5
	0zcPpZvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uds2y-000000001z5-0KKD;
	Mon, 21 Jul 2025 15:03:20 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udq24-0000000HIdz-2Im1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Jul 2025 12:54:18 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4561ca74829so47498085e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Jul 2025 05:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753102455; x=1753707255; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PjhDYf9y6EuvwS1bzG74pgfv+zF3H7PqlliS5Dv+cFI=;
        b=KcfjJpcAddr7tBL69m+Lt8LmbSfA+Pwqpgav6MjmQoueRSMtILEa1GcJNoSWZ+crtA
         ZB2Jl5b09N0f/5WXnPgYqNVFcYAwL+YC6wg7bo0v0M8DlnCUquPSMSEr/S36Uu6CreGo
         CBYwlV4nftFugz/ErF7N64uJWzcguPGDY1HvkouK9JFBIIWFbP6ofYM3vS6Bhpub2K3e
         GPxamHxSqjs/B09kFKWLrGz/6M2LfUPJjdd/L9/REyhbdtBwvwm5FLrrAzBRqyRAFk2l
         3fRKnp5sp9eF4wOEjbkWeeURn8zhPBt67t+JheGJXyp5T6FupaeZ4tPnLtNWSiXG8x73
         O/Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753102455; x=1753707255;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PjhDYf9y6EuvwS1bzG74pgfv+zF3H7PqlliS5Dv+cFI=;
        b=U0dCr6PCEcvZfJexnHCLEewgiQHjng3JKZ/AkCfpIoMgasGFE9S6cqem3J/1uJy4uN
         522wYdTPQdBS5nWa4+Z6ZIF82F+Uf8hgJEg+O0f2XrgQaG0L7QgCZjIfTXuINjq4JnGp
         yW698iNoePO6dKSjbKUoT2cvgngt97VbGRv56PN9dDslNf4I1DAPVvxjqvQjVBI8dzKQ
         wJZxui50bhgbjn1Drst6krR/O62pVr7hiF495XjthGiwoKtebEsjUR/driepe7i6XEnd
         Xi4rHotmfFk1bHkx5zRioE71TVrU/vPkfF9Qwg4q65lShLoxx7uefr4rIRXIAzDJYNNw
         84ug==
X-Gm-Message-State: AOJu0YyRuoZDZV4WA1i3g0n715BQgLqyCdmVf0PE0v425Hi2traxZ3Yp
	5teY9PDVdKMywBPAXCf9TV6pvJxRh79aEsBaeH5k3fCZ2CqVjMGu/eEL3JwW/OUJMYw=
X-Gm-Gg: ASbGncvlU94cr+QGxUmysnRFh7NBGzhqA6DirFxPzHwXW3WPf8Ab4ge/RHHEaum9pPF
	ReNGmNO3MOSye8E9HSc3HsM4hdmgMwgYfvSWx2X2MI2fdpFSEF5Qo1sWJBVW8DmEGoqO2AYCZ6v
	uZKFGz0RZlhi8uG2ou1eSdzNnon+81V63um8cAqSsclxOrPLRW3dqaRA7DBU8prs5ds1VjmHKuD
	zav7LlBZOjzdcUVmHHTKwQ8cpz/MPoGfslOotQ6+sLMA+ZdU7u3mxlscfQXLJ1QFNOQXGz+7GtY
	X9sy32f6a1X+rOahnOBrRqcJiLYGUtMQd5pHstK0XiLzSMyIw+63LYR8tsYYCJ8zzOWUPuwIBYF
	Yo1GPAMAdEFmtxTGeW8cYVuhBWTt11dE=
X-Google-Smtp-Source: AGHT+IG0Lqf9JLdc82VseKoNnxJV0uPpL0xZ6qrFtfBWK0QI1+SxXgCPXtiSz+6Y7bCTGmIfLohdig==
X-Received: by 2002:a05:600c:3481:b0:43c:fcbc:9680 with SMTP id 5b1f17b1804b1-4562e3c4b8bmr160735325e9.25.1753102455100;
        Mon, 21 Jul 2025 05:54:15 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4563b75de26sm98995225e9.33.2025.07.21.05.54.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jul 2025 05:54:14 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Mon, 21 Jul 2025 13:53:35 +0100
Subject: [PATCH v4 04/12] perf: arm_spe: Add support for FEAT_SPE_EFT
 extended filtering
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250721-james-perf-feat_spe_eft-v4-4-0a527410f8fd@linaro.org>
References: <20250721-james-perf-feat_spe_eft-v4-0-0a527410f8fd@linaro.org>
In-Reply-To: <20250721-james-perf-feat_spe_eft-v4-0-0a527410f8fd@linaro.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, 
 Oliver Upton <oliver.upton@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Zenghui Yu <yuzenghui@huawei.com>, Peter Zijlstra <peterz@infradead.org>, 
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-perf-users@vger.kernel.org, linux-doc@vger.kernel.org, 
 kvmarm@lists.linux.dev, Leo Yan <leo.yan@arm.com>, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_055416_612916_45A2651A 
X-CRM114-Status: GOOD (  20.17  )
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

FEAT_SPE_EFT (optional from Armv9.4) adds mask bits for the existing
load, store and branch filters. It also adds two new filter bits for
SIMD and floating point with their own associated mask bits. The current
filters only allow OR filtering on samples that are load OR store etc,
and the new mask bits allow setting part of the filter to an AND, for
example filtering samples that are store AND SIMD. With mask bits set to
0, the OR behavior is preserved, so the unless any masks are explicitly
set old filters will behave the same.

Add them all and make them behave the same way as existing format bits,
hidden and return EOPNOTSUPP if set when the feature doesn't exist.

Reviewed-by: Leo Yan <leo.yan@arm.com>
Tested-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/perf/arm_spe_pmu.c | 66 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/drivers/perf/arm_spe_pmu.c b/drivers/perf/arm_spe_pmu.c
index 3e9221a22a61..e69a0d170702 100644
--- a/drivers/perf/arm_spe_pmu.c
+++ b/drivers/perf/arm_spe_pmu.c
@@ -86,6 +86,7 @@ struct arm_spe_pmu {
 #define SPE_PMU_FEAT_ERND			(1UL << 5)
 #define SPE_PMU_FEAT_INV_FILT_EVT		(1UL << 6)
 #define SPE_PMU_FEAT_DISCARD			(1UL << 7)
+#define SPE_PMU_FEAT_EFT			(1UL << 8)
 #define SPE_PMU_FEAT_DEV_PROBED			(1UL << 63)
 	u64					features;
 
@@ -216,6 +217,27 @@ static const struct attribute_group arm_spe_pmu_cap_group = {
 #define ATTR_CFG_FLD_discard_CFG		config	/* PMBLIMITR_EL1.FM = DISCARD */
 #define ATTR_CFG_FLD_discard_LO			35
 #define ATTR_CFG_FLD_discard_HI			35
+#define ATTR_CFG_FLD_branch_filter_mask_CFG	config	/* PMSFCR_EL1.Bm */
+#define ATTR_CFG_FLD_branch_filter_mask_LO	36
+#define ATTR_CFG_FLD_branch_filter_mask_HI	36
+#define ATTR_CFG_FLD_load_filter_mask_CFG	config	/* PMSFCR_EL1.LDm */
+#define ATTR_CFG_FLD_load_filter_mask_LO	37
+#define ATTR_CFG_FLD_load_filter_mask_HI	37
+#define ATTR_CFG_FLD_store_filter_mask_CFG	config	/* PMSFCR_EL1.STm */
+#define ATTR_CFG_FLD_store_filter_mask_LO	38
+#define ATTR_CFG_FLD_store_filter_mask_HI	38
+#define ATTR_CFG_FLD_simd_filter_CFG		config	/* PMSFCR_EL1.SIMD */
+#define ATTR_CFG_FLD_simd_filter_LO		39
+#define ATTR_CFG_FLD_simd_filter_HI		39
+#define ATTR_CFG_FLD_simd_filter_mask_CFG	config	/* PMSFCR_EL1.SIMDm */
+#define ATTR_CFG_FLD_simd_filter_mask_LO	40
+#define ATTR_CFG_FLD_simd_filter_mask_HI	40
+#define ATTR_CFG_FLD_float_filter_CFG		config	/* PMSFCR_EL1.FP */
+#define ATTR_CFG_FLD_float_filter_LO		41
+#define ATTR_CFG_FLD_float_filter_HI		41
+#define ATTR_CFG_FLD_float_filter_mask_CFG	config	/* PMSFCR_EL1.FPm */
+#define ATTR_CFG_FLD_float_filter_mask_LO	42
+#define ATTR_CFG_FLD_float_filter_mask_HI	42
 
 #define ATTR_CFG_FLD_event_filter_CFG		config1	/* PMSEVFR_EL1 */
 #define ATTR_CFG_FLD_event_filter_LO		0
@@ -234,8 +256,15 @@ GEN_PMU_FORMAT_ATTR(pa_enable);
 GEN_PMU_FORMAT_ATTR(pct_enable);
 GEN_PMU_FORMAT_ATTR(jitter);
 GEN_PMU_FORMAT_ATTR(branch_filter);
+GEN_PMU_FORMAT_ATTR(branch_filter_mask);
 GEN_PMU_FORMAT_ATTR(load_filter);
+GEN_PMU_FORMAT_ATTR(load_filter_mask);
 GEN_PMU_FORMAT_ATTR(store_filter);
+GEN_PMU_FORMAT_ATTR(store_filter_mask);
+GEN_PMU_FORMAT_ATTR(simd_filter);
+GEN_PMU_FORMAT_ATTR(simd_filter_mask);
+GEN_PMU_FORMAT_ATTR(float_filter);
+GEN_PMU_FORMAT_ATTR(float_filter_mask);
 GEN_PMU_FORMAT_ATTR(event_filter);
 GEN_PMU_FORMAT_ATTR(inv_event_filter);
 GEN_PMU_FORMAT_ATTR(min_latency);
@@ -247,8 +276,15 @@ static struct attribute *arm_spe_pmu_formats_attr[] = {
 	&format_attr_pct_enable.attr,
 	&format_attr_jitter.attr,
 	&format_attr_branch_filter.attr,
+	&format_attr_branch_filter_mask.attr,
 	&format_attr_load_filter.attr,
+	&format_attr_load_filter_mask.attr,
 	&format_attr_store_filter.attr,
+	&format_attr_store_filter_mask.attr,
+	&format_attr_simd_filter.attr,
+	&format_attr_simd_filter_mask.attr,
+	&format_attr_float_filter.attr,
+	&format_attr_float_filter_mask.attr,
 	&format_attr_event_filter.attr,
 	&format_attr_inv_event_filter.attr,
 	&format_attr_min_latency.attr,
@@ -269,6 +305,16 @@ static umode_t arm_spe_pmu_format_attr_is_visible(struct kobject *kobj,
 	if (attr == &format_attr_inv_event_filter.attr && !(spe_pmu->features & SPE_PMU_FEAT_INV_FILT_EVT))
 		return 0;
 
+	if ((attr == &format_attr_branch_filter_mask.attr ||
+	     attr == &format_attr_load_filter_mask.attr ||
+	     attr == &format_attr_store_filter_mask.attr ||
+	     attr == &format_attr_simd_filter.attr ||
+	     attr == &format_attr_simd_filter_mask.attr ||
+	     attr == &format_attr_float_filter.attr ||
+	     attr == &format_attr_float_filter_mask.attr) &&
+	     !(spe_pmu->features & SPE_PMU_FEAT_EFT))
+		return 0;
+
 	return attr->mode;
 }
 
@@ -360,8 +406,15 @@ static u64 arm_spe_event_to_pmsfcr(struct perf_event *event)
 	u64 reg = 0;
 
 	reg |= FIELD_PREP(PMSFCR_EL1_LD, ATTR_CFG_GET_FLD(attr, load_filter));
+	reg |= FIELD_PREP(PMSFCR_EL1_LDm, ATTR_CFG_GET_FLD(attr, load_filter_mask));
 	reg |= FIELD_PREP(PMSFCR_EL1_ST, ATTR_CFG_GET_FLD(attr, store_filter));
+	reg |= FIELD_PREP(PMSFCR_EL1_STm, ATTR_CFG_GET_FLD(attr, store_filter_mask));
 	reg |= FIELD_PREP(PMSFCR_EL1_B, ATTR_CFG_GET_FLD(attr, branch_filter));
+	reg |= FIELD_PREP(PMSFCR_EL1_Bm, ATTR_CFG_GET_FLD(attr, branch_filter_mask));
+	reg |= FIELD_PREP(PMSFCR_EL1_SIMD, ATTR_CFG_GET_FLD(attr, simd_filter));
+	reg |= FIELD_PREP(PMSFCR_EL1_SIMDm, ATTR_CFG_GET_FLD(attr, simd_filter_mask));
+	reg |= FIELD_PREP(PMSFCR_EL1_FP, ATTR_CFG_GET_FLD(attr, float_filter));
+	reg |= FIELD_PREP(PMSFCR_EL1_FPm, ATTR_CFG_GET_FLD(attr, float_filter_mask));
 
 	if (reg)
 		reg |= PMSFCR_EL1_FT;
@@ -763,6 +816,16 @@ static int arm_spe_pmu_event_init(struct perf_event *event)
 	    !(spe_pmu->features & SPE_PMU_FEAT_FILT_LAT))
 		return -EOPNOTSUPP;
 
+	if ((FIELD_GET(PMSFCR_EL1_LDm, reg) ||
+	     FIELD_GET(PMSFCR_EL1_STm, reg) ||
+	     FIELD_GET(PMSFCR_EL1_Bm, reg) ||
+	     FIELD_GET(PMSFCR_EL1_SIMD, reg) ||
+	     FIELD_GET(PMSFCR_EL1_SIMDm, reg) ||
+	     FIELD_GET(PMSFCR_EL1_FP, reg) ||
+	     FIELD_GET(PMSFCR_EL1_FPm, reg)) &&
+	    !(spe_pmu->features & SPE_PMU_FEAT_EFT))
+		return -EOPNOTSUPP;
+
 	if (ATTR_CFG_GET_FLD(&event->attr, discard) &&
 	    !(spe_pmu->features & SPE_PMU_FEAT_DISCARD))
 		return -EOPNOTSUPP;
@@ -1054,6 +1117,9 @@ static void __arm_spe_pmu_dev_probe(void *info)
 	if (spe_pmu->pmsver >= ID_AA64DFR0_EL1_PMSVer_V1P2)
 		spe_pmu->features |= SPE_PMU_FEAT_DISCARD;
 
+	if (FIELD_GET(PMSIDR_EL1_EFT, reg))
+		spe_pmu->features |= SPE_PMU_FEAT_EFT;
+
 	/* This field has a spaced out encoding, so just use a look-up */
 	fld = FIELD_GET(PMSIDR_EL1_INTERVAL, reg);
 	switch (fld) {

-- 
2.34.1


