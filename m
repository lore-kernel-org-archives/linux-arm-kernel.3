Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 178DDCA0EEC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Aug 2025 13:14:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kU3pVBhaBY5D1ADCXJFCOl8E+cDESMwoM3MT+w6qdBg=; b=H25DsbnoognrpQKp5vm1inxxA8
	iegQ7gaUCgo5PFItM5Q4IX0BfdhPwGfWFm1bJakxfpHH55WZnyhjr2swiOHDcRu5rM8wU66g9XTUg
	ALRh2/tUd4hDMexA1kVd5EShvyz8L8LJBnVSJ6gO73Ce8nEXWymf4AevIu3bSX5uBhvbDGeeouJ0U
	Rt8IUHziTmf7QlhJwP0K2LKqaQfOUAV0fJnljw9ey3EDA5yTbvOXOvlaDKmEZqsv0Rv0akGNET2Fw
	LntdmT97s2/TstpnAWUgwMMARfDmoZk+Fp7I8YP76HNaxcTgeklmpl7JjQbE9YNM7eN8UCgQelS8J
	GCh5WaXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umXmy-0000000GxVG-09LD;
	Thu, 14 Aug 2025 13:14:40 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umUDr-0000000GOnZ-0qRy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Aug 2025 09:26:12 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-45a1b004a31so4887605e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 Aug 2025 02:26:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755163570; x=1755768370; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kU3pVBhaBY5D1ADCXJFCOl8E+cDESMwoM3MT+w6qdBg=;
        b=UGcM0D2D34hKx9AEGCG+DyCq+GoRNtCpigBFI3+Nw1P/5vUwlk3cLM3wFrUcxit3mG
         mfwvmtSLcA0aJWwuFlKdmsr09asDRufFQN1yRF32dRJ0Em1RTUjjG7couZZjF/Fn8TfN
         kzDNfYoRFpXvC0zks9rNaTYjlhIKeqP+zpzS86DN97BTJdYuD6nOYq4U3HOxP0lxjUrJ
         KyMhCq2fuVR2KJioZbZz+CByuudEpcsiDb533CY5RuIBho1MX8Q49HRcMAnld3q+m6fs
         /prLD/WCBYmpzg87fx8bLhDFwE0BtSKJ1SK28JtdswSFii6K6LCZLs4Db4uYZlov0mRu
         AM5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755163570; x=1755768370;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kU3pVBhaBY5D1ADCXJFCOl8E+cDESMwoM3MT+w6qdBg=;
        b=wENpqRhidOZrdXcQ+y7ZfJ//u+k3oWTfjmluYmL4Lcn5BR/8Ho7azWB5XosqUeDIWl
         Z5C1fuminxdhHISB8Y4VZYIbITE9FF3vOrNjqoE2HnkE1I73O9deb373OeW8nG+g33rK
         RQ/s0IfG39sdu6JsmuKA7Johrm/uNPRDGsi7Dqgvjp23ls3FLyoBE5Rqvk5BTbEURvi3
         P/2MyYR7862QZvtPcGjGjAnqi9yNdysTWu0Q6eFlqzProUBEUIn8nZ6Tm7Fw0JA2gOOZ
         kDERD9YJ+Bx2jXqhB1pmvGrlOPwP68fXLEKJyahgKrL6IdyMEvOAEgrAuvphgeBTropX
         9P4g==
X-Gm-Message-State: AOJu0Yx3dzVwyQQOVs1bdERL44kjnFFAuF+KiAjtBsWJScJKWIHB5O0B
	VdJAYQBZ5klUDhz4pOWnsqu3ixe5121455jT1vLAD6uSDdBiAoKOCL4wQcvgHAFYSZ0=
X-Gm-Gg: ASbGncvswK2IIq0rGkwRCwjAj85yKohb8Z9uCFlY/7Mk2SR9o65X0Ts8rEgrEXYFEN7
	TLRPplxn4Zv9gyEuYc4yHFQUYOYs32RDTAzRl13KdPbXvn3Q7ljTlVeg1TA1BZ11il3Y0Y6tRZw
	TbKDGyWe75LBdFnnMQhKGeo52Hw8R9orA9PosGTafpd1WkLAr0yzbtLkUevOTrgJCCu7VTjNays
	oCWosWAxQhWJ0WyE5gmUAT9fdBgu1hfFCHCOBOvNmyNc2kgzbrsQKT+eS7Whs/M+y7boKlWueCa
	hdc0XnIdR8NzXjDMrF0atVbxNlSQfJQj8jF6x3WKIvcpB0Dxk81PijSGlpN45sRZkZLWUqAPS8g
	9WNicd1KqbrUWPzVls3pSBdC+1zytvlw=
X-Google-Smtp-Source: AGHT+IG7VtJU6yEctLHSbbPHQRJt83DmrEVIyD4UvM5HiNPb8kIWkjAaSB91zdHiKQMYUKW7kzxcGA==
X-Received: by 2002:a05:600c:5486:b0:456:25aa:e9b0 with SMTP id 5b1f17b1804b1-45a1b646a96mr22322175e9.16.1755163569549;
        Thu, 14 Aug 2025 02:26:09 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a1c76e9basm14536775e9.21.2025.08.14.02.26.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 02:26:09 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Thu, 14 Aug 2025 10:25:31 +0100
Subject: [PATCH v7 09/12] perf: arm_spe: Add support for filtering on data
 source
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250814-james-perf-feat_spe_eft-v7-9-6a743f7fa259@linaro.org>
References: <20250814-james-perf-feat_spe_eft-v7-0-6a743f7fa259@linaro.org>
In-Reply-To: <20250814-james-perf-feat_spe_eft-v7-0-6a743f7fa259@linaro.org>
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
X-CRM114-CacheID: sfid-20250814_022611_248559_FA48FB2D 
X-CRM114-Status: GOOD (  21.74  )
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
Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/perf/arm_spe_pmu.c | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/drivers/perf/arm_spe_pmu.c b/drivers/perf/arm_spe_pmu.c
index 591f72fa0327..e5b36ab90786 100644
--- a/drivers/perf/arm_spe_pmu.c
+++ b/drivers/perf/arm_spe_pmu.c
@@ -87,6 +87,7 @@ struct arm_spe_pmu {
 #define SPE_PMU_FEAT_INV_FILT_EVT		(1UL << 6)
 #define SPE_PMU_FEAT_DISCARD			(1UL << 7)
 #define SPE_PMU_FEAT_EFT			(1UL << 8)
+#define SPE_PMU_FEAT_FDS			(1UL << 9)
 #define SPE_PMU_FEAT_DEV_PROBED			(1UL << 63)
 	u64					features;
 
@@ -251,6 +252,10 @@ static const struct attribute_group arm_spe_pmu_cap_group = {
 #define ATTR_CFG_FLD_inv_event_filter_LO	0
 #define ATTR_CFG_FLD_inv_event_filter_HI	63
 
+#define ATTR_CFG_FLD_inv_data_src_filter_CFG	config4	/* inverse of PMSDSFR_EL1 */
+#define ATTR_CFG_FLD_inv_data_src_filter_LO	0
+#define ATTR_CFG_FLD_inv_data_src_filter_HI	63
+
 GEN_PMU_FORMAT_ATTR(ts_enable);
 GEN_PMU_FORMAT_ATTR(pa_enable);
 GEN_PMU_FORMAT_ATTR(pct_enable);
@@ -267,6 +272,7 @@ GEN_PMU_FORMAT_ATTR(float_filter);
 GEN_PMU_FORMAT_ATTR(float_filter_mask);
 GEN_PMU_FORMAT_ATTR(event_filter);
 GEN_PMU_FORMAT_ATTR(inv_event_filter);
+GEN_PMU_FORMAT_ATTR(inv_data_src_filter);
 GEN_PMU_FORMAT_ATTR(min_latency);
 GEN_PMU_FORMAT_ATTR(discard);
 
@@ -287,6 +293,7 @@ static struct attribute *arm_spe_pmu_formats_attr[] = {
 	&format_attr_float_filter_mask.attr,
 	&format_attr_event_filter.attr,
 	&format_attr_inv_event_filter.attr,
+	&format_attr_inv_data_src_filter.attr,
 	&format_attr_min_latency.attr,
 	&format_attr_discard.attr,
 	NULL,
@@ -305,6 +312,10 @@ static umode_t arm_spe_pmu_format_attr_is_visible(struct kobject *kobj,
 	if (attr == &format_attr_inv_event_filter.attr && !(spe_pmu->features & SPE_PMU_FEAT_INV_FILT_EVT))
 		return 0;
 
+	if (attr == &format_attr_inv_data_src_filter.attr &&
+	    !(spe_pmu->features & SPE_PMU_FEAT_FDS))
+		return 0;
+
 	if ((attr == &format_attr_branch_filter_mask.attr ||
 	     attr == &format_attr_load_filter_mask.attr ||
 	     attr == &format_attr_store_filter_mask.attr ||
@@ -429,6 +440,9 @@ static u64 arm_spe_event_to_pmsfcr(struct perf_event *event)
 	if (ATTR_CFG_GET_FLD(attr, inv_event_filter))
 		reg |= PMSFCR_EL1_FnE;
 
+	if (ATTR_CFG_GET_FLD(attr, inv_data_src_filter))
+		reg |= PMSFCR_EL1_FDS;
+
 	if (ATTR_CFG_GET_FLD(attr, min_latency))
 		reg |= PMSFCR_EL1_FL;
 
@@ -453,6 +467,17 @@ static u64 arm_spe_event_to_pmslatfr(struct perf_event *event)
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
@@ -790,6 +815,10 @@ static int arm_spe_pmu_event_init(struct perf_event *event)
 	if (arm_spe_event_to_pmsnevfr(event) & spe_pmu->pmsevfr_res0)
 		return -EOPNOTSUPP;
 
+	if (arm_spe_event_to_pmsdsfr(event) != U64_MAX &&
+	    !(spe_pmu->features & SPE_PMU_FEAT_FDS))
+		return -EOPNOTSUPP;
+
 	if (attr->exclude_idle)
 		return -EOPNOTSUPP;
 
@@ -865,6 +894,11 @@ static void arm_spe_pmu_start(struct perf_event *event, int flags)
 		write_sysreg_s(reg, SYS_PMSNEVFR_EL1);
 	}
 
+	if (spe_pmu->features & SPE_PMU_FEAT_FDS) {
+		reg = arm_spe_event_to_pmsdsfr(event);
+		write_sysreg_s(reg, SYS_PMSDSFR_EL1);
+	}
+
 	reg = arm_spe_event_to_pmslatfr(event);
 	write_sysreg_s(reg, SYS_PMSLATFR_EL1);
 
@@ -1124,6 +1158,9 @@ static void __arm_spe_pmu_dev_probe(void *info)
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


