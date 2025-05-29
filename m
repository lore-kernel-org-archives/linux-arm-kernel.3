Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 806BDC5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 May 2025 12:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hFtizqLb9AdbPIP2xG9Ud/C06SCBb70bCrr/xyknRBQ=; b=gVo/q1C2exI1D1rD50hMvTi+mU
	3G+QdM7hQQpwYH9oVWIJ/lTcGgBEXrPcHkIMbQus/uv72GJVhvXGknqIGW2XZ4+moQ+KfiKUcR3mH
	ztD6YQvpMeAlNr+jz9pu7HcX6FVmsLsQlcXQgs7vxxoNpzkDfGBjxVK2X/pL7FmyvPAN23xL0F8zZ
	2CrK9dgL/4Iwm6vLNKxga6LYH5o+7eufYuAc2+xFW7pWtxxgbMDJwEHEjdQlVzvxCfZ3vZ3nabS0r
	9+W2aHrBSwi4H8At4O0OazWbitBJngYJD/RsTCr4LXHIRwaee8j6gHcrURv/leOFrfD2pjEwtQdpI
	ZY1CB+3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKcQU-0000000FjoJ-1pTV;
	Thu, 29 May 2025 12:32:02 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKbVh-0000000FdEN-1y5M
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 May 2025 11:33:24 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-43cfe574976so6795145e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 May 2025 04:33:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748518400; x=1749123200; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hFtizqLb9AdbPIP2xG9Ud/C06SCBb70bCrr/xyknRBQ=;
        b=nueD7t0OUQOzq+LgvIUe1mIP/OH/hOxcQTV53/g0H2xCs/SgslXqEsOtxhmyG5hK/P
         2a56UWczpz0i4Es0BTcl6Wn6nuLFNMjmqfXlxV/zKKdo5raEk2/kZS7YvvBdFbRNyVnv
         fQeNrLFoaWBr1tJIjSCefwaLvxJB4IVbG9TBJvoyEkETbR9j/ocbNdGJA7suenbMfwhn
         Kn/g3Y7Ns+f6qUygnNAn8nj+3/46OnKyCovzPbglsN+ueL0CsBEx8YURadJcwZdfxaXS
         aqx4HNRTbliD2i6xptVgSjCellQcJUY4hazEtNqEuhWinH6VTCY7EvKw+TOwdaj2m/2m
         XFHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748518400; x=1749123200;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hFtizqLb9AdbPIP2xG9Ud/C06SCBb70bCrr/xyknRBQ=;
        b=ejQNJy42GFjghuyNApTMINSbhltcc2l5NI/IsejJTFZ2qvfoO7YGV0vHOxBUV2deyL
         2h1jw6QtvA+EjI8KDdxUf2a5l0zfjH+oS7rdFg1vOohj53g1YnTG8kCkJKP20amlirM9
         nPfNocQxsMsina+TV0zc3LMr7IDufSvCfAsfABEkOZhLV55Lj7zwMyeDTSin1YqoudfS
         R+GRQjbCTvJjtllLBgXif+5ddoNOmbmzfj4j4ZQlIYoV83URrkGIU1FjbZBlvsJqdcUz
         KAXI2nFzXcrhZpyt9z4TrcWTiAjfsnq3jRY7oLfUHCs8X6VYcLk6cfiT0DsUHXiqnukC
         gadQ==
X-Gm-Message-State: AOJu0YzG6puT0a1pWJmAn1Bb2mqCUhQUnnPZNhCti9DsbErJenQOKRSF
	yDnlQ4mlOyRQlAJWK85HflMVXIQihvipX7qHBv/OV+lEW0vxHWJjV9Tip12HtgE+Rb8=
X-Gm-Gg: ASbGncue/OhbecWfjbJ63NQWfOF4hku0oIeDl6MVsgeTbAyOZHqJB9ubjbKWe4KyA5J
	JK1Cpnb5qP4axqEpUXuE4nmSn7L2dwSG7F9OTx+FYvbcT9SbXI4F9enhwTM/ZDOBohRvr6Kljpd
	aixS59PCoAfRiPAWC33YbC5nNXgmS9GlhHlJ3HQCyFk7ShOolGmbiZx8kDDnU0Ad7fsB8Y3Fb6a
	TU+YH7KoGB0x6CMcroSw9qW+SZ8pct6A2xKkbxMMKuBn7PZpgg1Cen5+pEFbI63M3ai4OyORRzc
	kAGDsPk24InNLHAOTeS/T09x212BUsPxK3+VZBZ160yonFT659rJrMAqliDK
X-Google-Smtp-Source: AGHT+IGimy6ZJ9K4F4atDZc7N5EcbAuC+37QDbioDnIXH/PmwoUz6QxTIrXaAGlqmLwxYEe63f5+gQ==
X-Received: by 2002:a05:600c:810e:b0:445:1984:2479 with SMTP id 5b1f17b1804b1-45072545a3emr53537625e9.5.1748518399707;
        Thu, 29 May 2025 04:33:19 -0700 (PDT)
Received: from ho-tower-lan.lan ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450cfc3785bsm17443945e9.40.2025.05.29.04.33.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 04:33:19 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Thu, 29 May 2025 12:30:29 +0100
Subject: [PATCH v2 08/11] perf: arm_spe: Add support for filtering on data
 source
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250529-james-perf-feat_spe_eft-v2-8-a01a9baad06a@linaro.org>
References: <20250529-james-perf-feat_spe_eft-v2-0-a01a9baad06a@linaro.org>
In-Reply-To: <20250529-james-perf-feat_spe_eft-v2-0-a01a9baad06a@linaro.org>
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
X-CRM114-CacheID: sfid-20250529_043321_976415_516881EF 
X-CRM114-Status: GOOD (  18.72  )
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
all the bits, so for example setting bits 0 and 3 filters packets from
data sources 0 OR 3.

Reviewed-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/perf/arm_spe_pmu.c | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/drivers/perf/arm_spe_pmu.c b/drivers/perf/arm_spe_pmu.c
index 9309b846f642..d04318411f77 100644
--- a/drivers/perf/arm_spe_pmu.c
+++ b/drivers/perf/arm_spe_pmu.c
@@ -87,6 +87,7 @@ struct arm_spe_pmu {
 #define SPE_PMU_FEAT_INV_FILT_EVT		(1UL << 6)
 #define SPE_PMU_FEAT_DISCARD			(1UL << 7)
 #define SPE_PMU_FEAT_EFT			(1UL << 8)
+#define SPE_PMU_FEAT_FDS			(1UL << 9)
 #define SPE_PMU_FEAT_DEV_PROBED			(1UL << 63)
 	u64					features;
 
@@ -232,6 +233,10 @@ static const struct attribute_group arm_spe_pmu_cap_group = {
 #define ATTR_CFG_FLD_inv_event_filter_LO	0
 #define ATTR_CFG_FLD_inv_event_filter_HI	63
 
+#define ATTR_CFG_FLD_data_src_filter_CFG	config4	/* PMSDSFR_EL1 */
+#define ATTR_CFG_FLD_data_src_filter_LO	0
+#define ATTR_CFG_FLD_data_src_filter_HI	63
+
 GEN_PMU_FORMAT_ATTR(ts_enable);
 GEN_PMU_FORMAT_ATTR(pa_enable);
 GEN_PMU_FORMAT_ATTR(pct_enable);
@@ -248,6 +253,7 @@ GEN_PMU_FORMAT_ATTR(float_filter);
 GEN_PMU_FORMAT_ATTR(float_filter_mask);
 GEN_PMU_FORMAT_ATTR(event_filter);
 GEN_PMU_FORMAT_ATTR(inv_event_filter);
+GEN_PMU_FORMAT_ATTR(data_src_filter);
 GEN_PMU_FORMAT_ATTR(min_latency);
 GEN_PMU_FORMAT_ATTR(discard);
 
@@ -268,6 +274,7 @@ static struct attribute *arm_spe_pmu_formats_attr[] = {
 	&format_attr_float_filter_mask.attr,
 	&format_attr_event_filter.attr,
 	&format_attr_inv_event_filter.attr,
+	&format_attr_data_src_filter.attr,
 	&format_attr_min_latency.attr,
 	&format_attr_discard.attr,
 	NULL,
@@ -286,6 +293,9 @@ static umode_t arm_spe_pmu_format_attr_is_visible(struct kobject *kobj,
 	if (attr == &format_attr_inv_event_filter.attr && !(spe_pmu->features & SPE_PMU_FEAT_INV_FILT_EVT))
 		return 0;
 
+	if (attr == &format_attr_data_src_filter.attr && !(spe_pmu->features & SPE_PMU_FEAT_FDS))
+		return 0;
+
 	if ((attr == &format_attr_branch_filter_mask.attr ||
 	     attr == &format_attr_load_filter_mask.attr ||
 	     attr == &format_attr_store_filter_mask.attr ||
@@ -406,6 +416,9 @@ static u64 arm_spe_event_to_pmsfcr(struct perf_event *event)
 	if (ATTR_CFG_GET_FLD(attr, inv_event_filter))
 		reg |= PMSFCR_EL1_FnE;
 
+	if (ATTR_CFG_GET_FLD(attr, data_src_filter))
+		reg |= PMSFCR_EL1_FDS;
+
 	if (ATTR_CFG_GET_FLD(attr, min_latency))
 		reg |= PMSFCR_EL1_FL;
 
@@ -430,6 +443,12 @@ static u64 arm_spe_event_to_pmslatfr(struct perf_event *event)
 	return FIELD_PREP(PMSLATFR_EL1_MINLAT, ATTR_CFG_GET_FLD(attr, min_latency));
 }
 
+static u64 arm_spe_event_to_pmsdsfr(struct perf_event *event)
+{
+	struct perf_event_attr *attr = &event->attr;
+	return ATTR_CFG_GET_FLD(attr, data_src_filter);
+}
+
 static void arm_spe_pmu_pad_buf(struct perf_output_handle *handle, int len)
 {
 	struct arm_spe_pmu_buf *buf = perf_get_aux(handle);
@@ -788,6 +807,10 @@ static int arm_spe_pmu_event_init(struct perf_event *event)
 	if (arm_spe_event_to_pmsnevfr(event) & arm_spe_pmsevfr_res0(spe_pmu->pmsver))
 		return -EOPNOTSUPP;
 
+	if (arm_spe_event_to_pmsdsfr(event) &&
+	    !(spe_pmu->features & SPE_PMU_FEAT_FDS))
+		return -EOPNOTSUPP;
+
 	if (attr->exclude_idle)
 		return -EOPNOTSUPP;
 
@@ -857,6 +880,11 @@ static void arm_spe_pmu_start(struct perf_event *event, int flags)
 		write_sysreg_s(reg, SYS_PMSNEVFR_EL1);
 	}
 
+	if (spe_pmu->features & SPE_PMU_FEAT_FDS) {
+		reg = arm_spe_event_to_pmsdsfr(event);
+		write_sysreg_s(reg, SYS_PMSDSFR_EL1);
+	}
+
 	reg = arm_spe_event_to_pmslatfr(event);
 	write_sysreg_s(reg, SYS_PMSLATFR_EL1);
 
@@ -1116,6 +1144,9 @@ static void __arm_spe_pmu_dev_probe(void *info)
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


