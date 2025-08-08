Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B6B2C87FD3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Aug 2025 11:49:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P3kTEULZc8sJ7phkXJvTPn2PvqxIKdhSpNCE5Vha7IE=; b=DEoEVI4bmCPfPTRtJk0bj56TBQ
	KtKgP8OaL8l6ieRAwuREiYh+3GhKgNO7wLUuig71rMpl6uiwOB4LpT2JOhpwwcMXnlnj3zeB3s8/0
	ijb75Zat0kwHpo83CzFkNwQ801bBK9ZrM2Gl+VJMS6zDi/3KR2cEG8qS9BbgqjJYjSVJ0bDppcq+l
	8h+MIqiNhiNkBQMwO+tko/FUGFv0Rik8qhAiJWhyGKW66RSwrOA8PFWDo20pnL8/EFMQVo4L/fVu9
	slNe87Rr4c0pKs6LSfaPBOLT5xQe35SqHpZNfFlw4T1j5LJmDGTjUTLYmAiJStFxhc1t8/7593+hW
	Mh6a9U4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukLat-00000002irP-3xH8;
	Fri, 08 Aug 2025 11:49:07 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukLCY-00000002et0-2Q7b
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Aug 2025 11:24:00 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-459d7726ee6so10270255e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 Aug 2025 04:23:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754652237; x=1755257037; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P3kTEULZc8sJ7phkXJvTPn2PvqxIKdhSpNCE5Vha7IE=;
        b=Yvi+SvAjDkPHnuA8KgYc1AfZHXnDjMJKSPmIEDYHT0xqzyw+QtnbY6HwQplrBmLaNl
         yDs0T614Vyojc49Xm5r458IrM/mJOTm8WkikJY6JtFkvjRJFuIFqKIG1Z2wulBMvzwJH
         gTEh/IE1bJh2gDKJuDQck33sg8m8yQHf2CYAHW9JOuA/J1RJFXJHEE/zEk1eEM5aYK2r
         DR9cbf4ERpSjLzcVui3LbHRekioL5tot5c26aIRONZSQkTWv/I5eXPT9Abgx/7pANdul
         7hj/L18cwpa6LxfjSalqJGTmORzRYseQgBi5h24aOKZmgAbSl+nLTCnf4R66/sZIn206
         acnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754652237; x=1755257037;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P3kTEULZc8sJ7phkXJvTPn2PvqxIKdhSpNCE5Vha7IE=;
        b=Gx3XmNMLShBcjS84gPZEwIohU5cs2dX75oX+h4ogXyjPhnLgIk7OWIJBibrNFFmUj3
         3DYCDOzGZCZ4Q5fT3BMmvY2nyVY6Gq/wQ0JphS9oLRtgnpNm0jUCKFpZnD/tVz/xboLz
         8Uxo1OzoL4JYSOJPeP86z/GHIAlNyFimGKS2bkV2fhzej12HUVWSnbHOC7Xyd2WJ7e9R
         dKuOh6ZtQQ8YsiUVd5rYQX1je7exXs+UfZVGxrpaZLYNPWyHTpeQt4/Q8W5y8BPlGvA+
         JHu6Ciip3Dq1M8CXKpcnGJT735QO7aZ0Xp5hDKLDusElojBRS9lRIqsHAVIuZldx6bkO
         nffQ==
X-Gm-Message-State: AOJu0YycbDuWKEY6VYeISwDTsqA0mxgRosL1QmGPWOVGBFju8UBvvFo0
	avj4rIovNNkXMko5hjRf21DWXfDgtq4KaEoqyWMa6aViTvKxjw/t4xXBwwKTG5++c/Q=
X-Gm-Gg: ASbGncspDfi5IBNcwaNd7Wo/GtUaMaGHhLAJMufjthptfZr7seuq7MjNsHsfi3b4/tI
	yDz9w7siYBCfE4U1MaUTbDElHOwvJYAeaw38H+kf0GRwG2WN4JxU8fAbR4Xzxq5y0PtcBEnX59F
	WdIYNTyJ7pWF8PvEkxRaEjQY64K4xdw4BM1qzqKCn8Diivccfar877Mr2oJARo85TYQ26LDj3cK
	sW6nCaR/7U2qbswDyXY3kMEEI8wlj7DW1+9TK0GT+/NgsndtSBn3868o8hNQTsYnFN5dg+igEss
	quIEDPub7QzZz133HWC161ZeV0nFS4sPThsm0CCIzlhOnFuqNjyGJbejEU6xtsqOt8kK2guby6Z
	KJrrBMAhdrDubmx6GEQqhVyu5ZWWJ3YuS1u+tOp+9bw==
X-Google-Smtp-Source: AGHT+IHGDlpxTqvU8x6CY6HSrShTz3PSFbXeB0d760uYkAX/1NVAzKqdZtpMjiV1FNq3jgKsDT7ssg==
X-Received: by 2002:a05:600c:468d:b0:456:fdd:6030 with SMTP id 5b1f17b1804b1-459f4f98174mr23233005e9.19.1754652236850;
        Fri, 08 Aug 2025 04:23:56 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45923c34af8sm233482635e9.24.2025.08.08.04.23.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Aug 2025 04:23:56 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Fri, 08 Aug 2025 12:23:06 +0100
Subject: [PATCH v6 09/12] perf: arm_spe: Add support for filtering on data
 source
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250808-james-perf-feat_spe_eft-v6-9-6daf498578c8@linaro.org>
References: <20250808-james-perf-feat_spe_eft-v6-0-6daf498578c8@linaro.org>
In-Reply-To: <20250808-james-perf-feat_spe_eft-v6-0-6daf498578c8@linaro.org>
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
X-CRM114-CacheID: sfid-20250808_042358_624309_02BFD58E 
X-CRM114-Status: GOOD (  22.06  )
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


