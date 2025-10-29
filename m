Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B0ECCCF9F7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 15:46:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ib/m0uUPLSkVp1ZlpwY6PmfsEKy79muQ35cF6NAqDLw=; b=ppxujEOYgLxlA2X8Rh5K5pdblH
	pYGBwxXPL4UaA2IbfmC1YGPs28jeyEhGzU+K0dxgWlYxiUmsUOCr5arRBLdy9643TachV5iISRNj/
	dVZQP8bkLD6xdUB6AW+3JPBcq2gUisA6j8b/ZF77umdz/OXbbtC+Ommv8/Ps1iX3RaE4TzfExEEcu
	NG9AdeSsNUflWMidQqlYapkgn9K3pPp1Nqaw8bC+g/+xezgwZOtejcMKGvvUdSg2dIT7RHI0Xxy+0
	apNlq5nOeZM3DGtCitbdr+QM7VcG83LcIQ7WWI/PELZ3cY63Q3QNJb8Ju6fIm/9CTnE12d9POizVj
	cgAi+h/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE8Nt-00000001qzu-0ZRs;
	Wed, 29 Oct 2025 15:46:49 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE8Nn-00000001qve-1Pxc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 15:46:44 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-475dc6029b6so48744015e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Oct 2025 08:46:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761752801; x=1762357601; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ib/m0uUPLSkVp1ZlpwY6PmfsEKy79muQ35cF6NAqDLw=;
        b=iGhg6x2JSnMdoM/WYW41HBR92WrPE1+6JSJYdgUCsOh3ZABy2yOV9fzU3dRQjpMNwf
         pzpjtfc9lchn5OByAX4Q7a1Uor7GdvwWVbQZYSodp853vkPaV5xUlkNdkkF0RTIHZ+hk
         66KC9TOeGp9DH62i7YuSOzZbKz5F7HRrTILcYENar+7tYCfNyslo9tA32dOKXCji1uf9
         ETZg1GMThDXZWvdOdC5/Y9DfC0i0U/3Uc0xemMGSf9XqTta4idOzszHjfKP4QiQwkVY1
         zWUt9+Y0iTEc+OEl1bJVAI+6NeoxvSHtovcGOs8hvQzJzx1rdM85Ymyq+CUwOltnuH6T
         feSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761752801; x=1762357601;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ib/m0uUPLSkVp1ZlpwY6PmfsEKy79muQ35cF6NAqDLw=;
        b=nguoncK4dxfvoVoOIz91Y6WxDn02LGl98P1ry7wYPY1fyRKFLepvCfgK4ZKSEa+TO9
         wOnf9Fe6dvslw3a6lLpfkpLsBnKhVhIlbbj5chITlRayzM/m48jh1GP4p26PLXBnytaz
         m+PSm2iwwDuJsZSKWdjBz4MBEvv7z5Me/dOEVmA+xnQdaTXlxeX2l1A+phpeQCQf+0n0
         5VVaGE3G2Ib3ZSWv+dUwCcYGcsxSVBzCFcNNoULMThEThFqsZspz4h2TNjba/q3+kdep
         +aRLeB6vGx5vVB5gmkr0X3JQlT5g4LEppoCvLx4liAMU47lLXRD/mugNXoTuGH0tBbp0
         xJ5Q==
X-Gm-Message-State: AOJu0Yznfe03hCQ4sfbAocZ9OoL+pb9dg4mgtnfXgY5EzI2XYK6CSIUp
	l1RNUVyD+FYh8bUPpAxRuKbrZDQzUkxFcPYWD0SBjnDf9DUEx49gpYs9y32uIAjXlfE=
X-Gm-Gg: ASbGncseSxxGsxWjlI6riRK7nH9LTesX1WJQ9G+0UQj9lpdajk9sSEEBDYsFmoTkwgJ
	/i532RDMZzqsMNYbTNGmCn45UaVvo8bXPzCD3pfyrqV4DC0WD/fN/55B1OCX/X0gggDrl4nb6Oo
	+zSIHIKF9Znf/m+7Xlkd96zxZwxf0VRpbgHl5lbEHkQJHuDw1a1ZFTIXwF7CZ8xmGiaY8eIaZ+j
	bE00OckbGvoOnrcacKXm2A/FCd4N9m0NoRZxVQf/AQb+hkckToCrX+m5wijoyXblOh2vJaK3Sxx
	hUAAnDTlsJn0rlWaEAGqGnSgyMZ7xardvNcBbdi1HSF5+bzRWfLzHRZH0h+d5vX9fawRA/NtjXr
	HfD/9B8EvInis3lezbdeYJjn2UWl/F/3IfmpAkA+v3TrlvRwg7LZEu+rVv62LgvMZ1mKS1Lpp3h
	yMR7WN/Uw1tg==
X-Google-Smtp-Source: AGHT+IHpC4zA9rHyOq1xNedwh/vBadqHyptjOa8+6vrhjj8123XYNoSFYmp8q1PCWiMuh3tVBr2dqQ==
X-Received: by 2002:a05:600c:190d:b0:46e:32d4:46a1 with SMTP id 5b1f17b1804b1-4771e1ccb50mr30318945e9.22.1761752801364;
        Wed, 29 Oct 2025 08:46:41 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4771e3b9994sm53745535e9.16.2025.10.29.08.46.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 08:46:40 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Wed, 29 Oct 2025 15:46:02 +0000
Subject: [PATCH v9 2/5] perf: arm_spe: Add support for filtering on data
 source
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251029-james-perf-feat_spe_eft-v9-2-d22536b9cf94@linaro.org>
References: <20251029-james-perf-feat_spe_eft-v9-0-d22536b9cf94@linaro.org>
In-Reply-To: <20251029-james-perf-feat_spe_eft-v9-0-d22536b9cf94@linaro.org>
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
 Adrian Hunter <adrian.hunter@intel.com>, Leo Yan <leo.yan@arm.com>, 
 Anshuman Khandual <anshuman.khandual@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-perf-users@vger.kernel.org, linux-doc@vger.kernel.org, 
 kvmarm@lists.linux.dev, James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_084643_407257_200A6F51 
X-CRM114-Status: GOOD (  22.05  )
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

SPE_FEAT_FDS adds the ability to filter on the data source of packets.
Like the other existing filters, enable filtering with PMSFCR_EL1.FDS
when any of the filter bits are set.

Each bit maps to data sources 0-63 described by bits[0:5] in the data
source packet (although the full range of data source is 16 bits so
higher value data sources can't be filtered on). The filter is an OR of
all the bits, so for example clearing bits 0 and 3 only includes packets
from data sources 0 OR 3.

Invert the filter given by userspace so that the default value of 0 is
equivalent to including all values (no filtering). This allows us to
skip adding a new format bit to enable filtering and still support
excluding all data sources which would have been a filter value of 0 if
not for the inversion.

Tested-by: Leo Yan <leo.yan@arm.com>
Reviewed-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/perf/arm_spe_pmu.c | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/drivers/perf/arm_spe_pmu.c b/drivers/perf/arm_spe_pmu.c
index fa50645fedda..617f8a98dd63 100644
--- a/drivers/perf/arm_spe_pmu.c
+++ b/drivers/perf/arm_spe_pmu.c
@@ -87,6 +87,7 @@ struct arm_spe_pmu {
 #define SPE_PMU_FEAT_INV_FILT_EVT		(1UL << 6)
 #define SPE_PMU_FEAT_DISCARD			(1UL << 7)
 #define SPE_PMU_FEAT_EFT			(1UL << 8)
+#define SPE_PMU_FEAT_FDS			(1UL << 9)
 #define SPE_PMU_FEAT_DEV_PROBED			(1UL << 63)
 	u64					features;
 
@@ -252,6 +253,10 @@ static const struct attribute_group arm_spe_pmu_cap_group = {
 #define ATTR_CFG_FLD_inv_event_filter_LO	0
 #define ATTR_CFG_FLD_inv_event_filter_HI	63
 
+#define ATTR_CFG_FLD_inv_data_src_filter_CFG	config4	/* inverse of PMSDSFR_EL1 */
+#define ATTR_CFG_FLD_inv_data_src_filter_LO	0
+#define ATTR_CFG_FLD_inv_data_src_filter_HI	63
+
 GEN_PMU_FORMAT_ATTR(ts_enable);
 GEN_PMU_FORMAT_ATTR(pa_enable);
 GEN_PMU_FORMAT_ATTR(pct_enable);
@@ -268,6 +273,7 @@ GEN_PMU_FORMAT_ATTR(float_filter);
 GEN_PMU_FORMAT_ATTR(float_filter_mask);
 GEN_PMU_FORMAT_ATTR(event_filter);
 GEN_PMU_FORMAT_ATTR(inv_event_filter);
+GEN_PMU_FORMAT_ATTR(inv_data_src_filter);
 GEN_PMU_FORMAT_ATTR(min_latency);
 GEN_PMU_FORMAT_ATTR(discard);
 
@@ -288,6 +294,7 @@ static struct attribute *arm_spe_pmu_formats_attr[] = {
 	&format_attr_float_filter_mask.attr,
 	&format_attr_event_filter.attr,
 	&format_attr_inv_event_filter.attr,
+	&format_attr_inv_data_src_filter.attr,
 	&format_attr_min_latency.attr,
 	&format_attr_discard.attr,
 	NULL,
@@ -306,6 +313,10 @@ static umode_t arm_spe_pmu_format_attr_is_visible(struct kobject *kobj,
 	if (attr == &format_attr_inv_event_filter.attr && !(spe_pmu->features & SPE_PMU_FEAT_INV_FILT_EVT))
 		return 0;
 
+	if (attr == &format_attr_inv_data_src_filter.attr &&
+	    !(spe_pmu->features & SPE_PMU_FEAT_FDS))
+		return 0;
+
 	if ((attr == &format_attr_branch_filter_mask.attr ||
 	     attr == &format_attr_load_filter_mask.attr ||
 	     attr == &format_attr_store_filter_mask.attr ||
@@ -430,6 +441,9 @@ static u64 arm_spe_event_to_pmsfcr(struct perf_event *event)
 	if (ATTR_CFG_GET_FLD(attr, inv_event_filter))
 		reg |= PMSFCR_EL1_FnE;
 
+	if (ATTR_CFG_GET_FLD(attr, inv_data_src_filter))
+		reg |= PMSFCR_EL1_FDS;
+
 	if (ATTR_CFG_GET_FLD(attr, min_latency))
 		reg |= PMSFCR_EL1_FL;
 
@@ -454,6 +468,17 @@ static u64 arm_spe_event_to_pmslatfr(struct perf_event *event)
 	return FIELD_PREP(PMSLATFR_EL1_MINLAT, ATTR_CFG_GET_FLD(attr, min_latency));
 }
 
+static u64 arm_spe_event_to_pmsdsfr(struct perf_event *event)
+{
+	struct perf_event_attr *attr = &event->attr;
+
+	/*
+	 * Data src filter is inverted so that the default value of 0 is
+	 * equivalent to no filtering.
+	 */
+	return ~ATTR_CFG_GET_FLD(attr, inv_data_src_filter);
+}
+
 static void arm_spe_pmu_pad_buf(struct perf_output_handle *handle, int len)
 {
 	struct arm_spe_pmu_buf *buf = perf_get_aux(handle);
@@ -791,6 +816,10 @@ static int arm_spe_pmu_event_init(struct perf_event *event)
 	if (arm_spe_event_to_pmsnevfr(event) & spe_pmu->pmsevfr_res0)
 		return -EOPNOTSUPP;
 
+	if (arm_spe_event_to_pmsdsfr(event) != U64_MAX &&
+	    !(spe_pmu->features & SPE_PMU_FEAT_FDS))
+		return -EOPNOTSUPP;
+
 	if (attr->exclude_idle)
 		return -EOPNOTSUPP;
 
@@ -866,6 +895,11 @@ static void arm_spe_pmu_start(struct perf_event *event, int flags)
 		write_sysreg_s(reg, SYS_PMSNEVFR_EL1);
 	}
 
+	if (spe_pmu->features & SPE_PMU_FEAT_FDS) {
+		reg = arm_spe_event_to_pmsdsfr(event);
+		write_sysreg_s(reg, SYS_PMSDSFR_EL1);
+	}
+
 	reg = arm_spe_event_to_pmslatfr(event);
 	write_sysreg_s(reg, SYS_PMSLATFR_EL1);
 
@@ -1125,6 +1159,9 @@ static void __arm_spe_pmu_dev_probe(void *info)
 	if (FIELD_GET(PMSIDR_EL1_EFT, reg))
 		spe_pmu->features |= SPE_PMU_FEAT_EFT;
 
+	if (FIELD_GET(PMSIDR_EL1_FDS, reg))
+		spe_pmu->features |= SPE_PMU_FEAT_FDS;
+
 	/* This field has a spaced out encoding, so just use a look-up */
 	fld = FIELD_GET(PMSIDR_EL1_INTERVAL, reg);
 	switch (fld) {

-- 
2.34.1


