Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D915CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 11:38:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gwCuT4qpbf858s5dq2pagCIko/kgMzJ+Cwp9chp+q6I=; b=SXw57mgNWkgLsLJt2b95PcwN8F
	O7WObVQwE0NKyknhNWBwd+VQCVGQlZyKly7ev4W7EB1Td8P9HrFQuwwGz1YqV7+LAyBjo/plEFOrk
	mzHz3ru0MHWfoVcsHjemOwVLMiYJWYFpkKB0MobvTjWfoxc85K9U1rkKV2JWWUOCQDtKVvOftGF/O
	zzX3M4UmixK7joxZSmod4BTdVpYgr5UZNGyP926juluvCY0lCJvNkz+lVzBv33xtb6B9i9xRk08xw
	ABfu5cUvqOHjr0CGXxgboA6Ce12VBsMbNN6AiXavHMT8lNaS9hs127xEMvoRoCUMndqj4XQeTroNL
	88Yn1QNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vImhr-000000075Gs-1Ug6;
	Tue, 11 Nov 2025 11:38:39 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vImhl-000000075Cm-3KLE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Nov 2025 11:38:34 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-42b32900c8bso1377941f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Nov 2025 03:38:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762861112; x=1763465912; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gwCuT4qpbf858s5dq2pagCIko/kgMzJ+Cwp9chp+q6I=;
        b=P1Bn33bbIyfP1CziVgdiXZj6mY5QoTpvJ8jLUWzDOU70neQ5JT/4BejnUBz3m0HfFO
         HSBJuMN4WLilwPm6lNyhMtG7mo5lTtra9WQ0sw4+uvmN8IQewy5hadGRv317wro3dUuc
         AMw6LPZLLY2NH7QoiTiHFRGTW6OcngRecJIs44lY5yldS+pfuD4x731KxiiDw0Wq37om
         /+TNyVAdSNG42PeHU+1clDb/Xfd5QVujDhhnAr5i80YosL+jknVJrZks0r+oLwdgTFM/
         aTtia1H+PFchIFRYUHn1eCOb3c5OVUOfV+HHO8vlUVfTYzIKA8JRzZnvYBSr2PHbr1QP
         Wi7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762861112; x=1763465912;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gwCuT4qpbf858s5dq2pagCIko/kgMzJ+Cwp9chp+q6I=;
        b=CW2CABJiEeGfyr0FiYPi+xkHcMxskK/2QOunDCDYuBOwShMAzJcM/ir3CNGa8xfGK1
         pzxhL7QfgIq07PlUT2xtwCCfbPlmyxrLYVQSXOHDNZFj8YmsluiqnUFT1yUTkTJ1tA0P
         EixNvtEflIFDUEdK2vqzfTmm3bQLhBV4qhcA2VY53TsFfvuJD7W/3QpFSNfd4iljD/pV
         PPkHrZAUfCpe7nz12DA/VQ1FnxwIRa8r9zDTjLh+XsYFyv4mk0heIxOJjNSR9d9Oeuir
         ZgDTy7LG/u1N/GJ8GxEpWuRIXmNRNXJjrcP90IuYylCR7oVPTo/KQH50h78vORgVZ+HO
         dk/w==
X-Gm-Message-State: AOJu0YzM2WMlS8WRcjOjDuArDWUavju35dZ1rCUVgHqm0E2fskDA9q7g
	qTRSm/RDUhxKgqApGMRHoJTLEAd9R6NGnd/8aOeNkgTkVgaVvrvNhyixONEk33TkeXs=
X-Gm-Gg: ASbGncsGQAO8vYXabDmaIRcHnwTV4C1UK9YqQ53efe0tJVj6EggIU40A9LGknaAoeQe
	BT5l4T3+ycV+jwe4ikaIFqu35L2YjEDWILBA8Ff3gayHq7xVoxV6LnPi7QHmLb4/nstLMKqIUTr
	CVaL4pVtDFN5MZrK/ifgyJ44Ho67jthylqpdVgzHwagCtuSpP9cP1tU18K2nYsoOWSnkA+4npxC
	gWgz9cX4oCRFacfNqvm0AMXDZv6ywE9FJyRG8HO8XtvBFKORX+4cL40XBtwQXJyTMOxnhFLZPqr
	0gkzKh/Pb2yDpFj2xqDA2eOfceH2QxkTjSp9YdliHwxU7Aa1najaS0Hmx9W//sDJTW7Fk7J+lTj
	lb6Mgo1nORCTfaM02Tq1GeuGRRrujnpykNZkoqfRvl/cXyuQlbowmSeMJgMkSIgdOidopmQ/3dL
	0sT2fgCRScYg==
X-Google-Smtp-Source: AGHT+IHoaAdyno4PCEkIfLITG0AGBI1bC/mX+D1DG/Yst4Q/794Wn0/d79DNOynMvzJ3hrqergaE6g==
X-Received: by 2002:a5d:588a:0:b0:42b:3e20:f1b4 with SMTP id ffacd0b85a97d-42b3e20f5bdmr5248092f8f.5.1762861111797;
        Tue, 11 Nov 2025 03:38:31 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42ac675cd25sm28133486f8f.22.2025.11.11.03.38.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 03:38:31 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Tue, 11 Nov 2025 11:37:56 +0000
Subject: [PATCH v10 2/5] perf: arm_spe: Add support for filtering on data
 source
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251111-james-perf-feat_spe_eft-v10-2-1e1b5bf2cd05@linaro.org>
References: <20251111-james-perf-feat_spe_eft-v10-0-1e1b5bf2cd05@linaro.org>
In-Reply-To: <20251111-james-perf-feat_spe_eft-v10-0-1e1b5bf2cd05@linaro.org>
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
X-CRM114-CacheID: sfid-20251111_033833_875890_F8CECDC2 
X-CRM114-Status: GOOD (  22.26  )
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

Each bit position of the 64 bit filter maps to numerical data sources
0-63 described by bits[0:5] in the data source packet (although the full
range of data source is 16 bits so higher value data sources can't be
filtered on). The filter is an OR of all the filter bits, so for example
clearing filter bits 0 and 3 only includes packets from data sources 0
OR 3.

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


