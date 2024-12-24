Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E25AE77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Dec 2024 10:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zHAl/iVdRpFZ4l6Mby+FrJoyVvI8kLZuzTqR3xsa9gY=; b=0wKCncNEdcudbRjtoOpxn2buor
	JTVp4+iXNDhfGP2qhuZQQxhIfY9bYJHFNryyrGUD4X3ClOv4plLiawCwloCep4xyG7RpVtSEiC38Z
	rSWA2yUfkz2EWGxY4uCD7Dj65Uwwah1D6wgSo82Pr0fgk6bPWBKJQHWWgeG2MkiVKUf7lnS3m1fbH
	GOSqClyedEfnqUN2Gw2HQSDh8qvQjstJHJdNSD3HY/IExSHHozWBMVmfbbjYziTjAhCe2U+SoQV2z
	oWPIKq4dWVtCF/E7YTVRRrENVtB2/AIn76X5sbw7slpB9i0vDLejSlklqD4lhV7CRr1ng/awHr/At
	5KkLOKkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ2SY-0000000Bnyq-3MJb;
	Tue, 24 Dec 2024 10:48:18 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ2P1-0000000Bn9u-1Yy8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Dec 2024 10:44:41 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-385df53e559so4002252f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Dec 2024 02:44:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735037077; x=1735641877; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zHAl/iVdRpFZ4l6Mby+FrJoyVvI8kLZuzTqR3xsa9gY=;
        b=OtqJtOLykQE9b9FJH8tEde8E3CqbXUn0nAyu+FE7jEco8qzHSUKkzpkxRN/3Vgztaq
         67/0IRmVNNNNPZlKnoZnqtVp6VU0ubws5/OTfsYa6ADRFWMXrgLghYRs4Wii6qcf7bGE
         xbQ+KVZXTriewVvFidUDR8gRlDjJYFnvJfMNsSl2RbL+3lIeTcHyaAQFxGPHo6GI8gqc
         taRR3AXMXehVtdW3fj3lKxiLahOSzJ7R30BRM6pJMwZv8m6uZlFSYwyNQZF9+Djy1EsR
         NsAgYSYNjNTEegjHW1qk+TA53eUvIirG+eT6wcTQadiDrr/V2GxV5d/ZfKYCjnYgwRr0
         l2Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735037077; x=1735641877;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zHAl/iVdRpFZ4l6Mby+FrJoyVvI8kLZuzTqR3xsa9gY=;
        b=kB0egfYgS/NBg5KXdRHXCvAknl3xOzzDJZgaq8Mzq7G6aMtC6wWtM25HgWbJwRFJf5
         BmtFSUiJ9IqMcK3CFTGkz4z7OGSh0zj54dsAKoDzEmx5ayUwpZmykkE+GxrgQrn1bcdg
         ltO9Gj8uT9zvYcPaQ/6M5hC+XjHbp7GYd79mzOiwjrSgUJF8CD80iysig9jKxpPvz1Y6
         B1dmKK8oIJpI4lfQlTGCp/l3F185yCx57IgD9bq/lQ2a8pDewrUL65ErdW5c9dvOJffC
         8BdDJ4VHMQOiHd+ciEH+RpaYxeANrdqprWOBP/vIDzzGKS25yxnfjgq25OopRRwJaJJA
         zItw==
X-Gm-Message-State: AOJu0Yx8nwkV9lr9i5fvYifqftg1aIgMoUWr0gny1Yx+RNcg7+/rvx2x
	eNMtrdehgK6xduMy51VQS2rQXEimlsIYE8rxc9Hbm/JF18XvzZh8YJMTpWrKSoNugEznqYfcowh
	D
X-Gm-Gg: ASbGnctQbGdM5JQQa4ZZ/CDgLsXZ1MmZAyJ02gI+tZmWHsD+hWc6Apjrs3EVs/BJvYM
	VxoDmbEdTrw29iBVzorIj3yH5EXTPwW3j/CjlzYcAHiM3wzS6EMrsz/gaLDQWxRgJ0ohu9xFoYO
	kIWY/hvPPV6QEXT39/vnssGEFVd6kuDzjFf4tjlmB+QHGQEV+Ft9bXsxrTREqWaEobch6IpBdWc
	Fgf6PPRygJV0kZJwiVtcdzmr0DjmyWYrIr7iasB15InLsIW1pSDo2Q=
X-Google-Smtp-Source: AGHT+IH7n+am9veH0sjuso0VQt6cOhLb48Ywipt9+tQpA2guKm2WC+9l0VoxKlK8wBiZB7S6GwshiQ==
X-Received: by 2002:a05:6000:154f:b0:385:eeb9:a5bb with SMTP id ffacd0b85a97d-38a221f698amr13901717f8f.17.1735037077544;
        Tue, 24 Dec 2024 02:44:37 -0800 (PST)
Received: from pop-os.. ([145.224.66.70])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c847714sm13938184f8f.54.2024.12.24.02.44.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Dec 2024 02:44:37 -0800 (PST)
From: James Clark <james.clark@linaro.org>
To: linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	irogers@google.com,
	yeoreum.yun@arm.com,
	will@kernel.org,
	mark.rutland@arm.com
Cc: robh@kernel.org,
	James Clark <james.clark@linaro.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	"Liang, Kan" <kan.liang@linux.intel.com>,
	John Garry <john.g.garry@oracle.com>,
	Mike Leach <mike.leach@linaro.org>,
	Leo Yan <leo.yan@linux.dev>,
	Graham Woodward <graham.woodward@arm.com>,
	linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org
Subject: [PATCH v2 1/5] perf: arm_spe: Add format option for discard mode
Date: Tue, 24 Dec 2024 10:44:08 +0000
Message-Id: <20241224104414.179365-2-james.clark@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241224104414.179365-1-james.clark@linaro.org>
References: <20241224104414.179365-1-james.clark@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241224_024439_419509_DE11493C 
X-CRM114-Status: GOOD (  18.85  )
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

FEAT_SPEv1p2 (optional from Armv8.6) adds a discard mode that allows all
SPE data to be discarded rather than written to memory. Add a format
bit for this mode.

If the mode isn't supported, the format bit isn't published and attempts
to use it will result in -EOPNOTSUPP. Allocating an aux buffer is still
allowed even though it won't be written to so that old tools continue to
work, but updated tools can choose to skip this step.

Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/perf/arm_spe_pmu.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/perf/arm_spe_pmu.c b/drivers/perf/arm_spe_pmu.c
index fd5b78732603..9aaf3f98e6f5 100644
--- a/drivers/perf/arm_spe_pmu.c
+++ b/drivers/perf/arm_spe_pmu.c
@@ -193,6 +193,9 @@ static const struct attribute_group arm_spe_pmu_cap_group = {
 #define ATTR_CFG_FLD_store_filter_CFG		config	/* PMSFCR_EL1.ST */
 #define ATTR_CFG_FLD_store_filter_LO		34
 #define ATTR_CFG_FLD_store_filter_HI		34
+#define ATTR_CFG_FLD_discard_CFG		config	/* PMBLIMITR_EL1.FM = DISCARD */
+#define ATTR_CFG_FLD_discard_LO			35
+#define ATTR_CFG_FLD_discard_HI			35
 
 #define ATTR_CFG_FLD_event_filter_CFG		config1	/* PMSEVFR_EL1 */
 #define ATTR_CFG_FLD_event_filter_LO		0
@@ -216,6 +219,7 @@ GEN_PMU_FORMAT_ATTR(store_filter);
 GEN_PMU_FORMAT_ATTR(event_filter);
 GEN_PMU_FORMAT_ATTR(inv_event_filter);
 GEN_PMU_FORMAT_ATTR(min_latency);
+GEN_PMU_FORMAT_ATTR(discard);
 
 static struct attribute *arm_spe_pmu_formats_attr[] = {
 	&format_attr_ts_enable.attr,
@@ -228,9 +232,15 @@ static struct attribute *arm_spe_pmu_formats_attr[] = {
 	&format_attr_event_filter.attr,
 	&format_attr_inv_event_filter.attr,
 	&format_attr_min_latency.attr,
+	&format_attr_discard.attr,
 	NULL,
 };
 
+static bool discard_unsupported(struct arm_spe_pmu *spe_pmu)
+{
+	return spe_pmu->pmsver < ID_AA64DFR0_EL1_PMSVer_V1P2;
+}
+
 static umode_t arm_spe_pmu_format_attr_is_visible(struct kobject *kobj,
 						  struct attribute *attr,
 						  int unused)
@@ -238,6 +248,9 @@ static umode_t arm_spe_pmu_format_attr_is_visible(struct kobject *kobj,
 	struct device *dev = kobj_to_dev(kobj);
 	struct arm_spe_pmu *spe_pmu = dev_get_drvdata(dev);
 
+	if (attr == &format_attr_discard.attr && discard_unsupported(spe_pmu))
+		return 0;
+
 	if (attr == &format_attr_inv_event_filter.attr && !(spe_pmu->features & SPE_PMU_FEAT_INV_FILT_EVT))
 		return 0;
 
@@ -502,6 +515,12 @@ static void arm_spe_perf_aux_output_begin(struct perf_output_handle *handle,
 	u64 base, limit;
 	struct arm_spe_pmu_buf *buf;
 
+	if (ATTR_CFG_GET_FLD(&event->attr, discard)) {
+		limit = FIELD_PREP(PMBLIMITR_EL1_FM, PMBLIMITR_EL1_FM_DISCARD);
+		limit |= PMBLIMITR_EL1_E;
+		goto out_write_limit;
+	}
+
 	/* Start a new aux session */
 	buf = perf_aux_output_begin(handle, event);
 	if (!buf) {
@@ -743,6 +762,10 @@ static int arm_spe_pmu_event_init(struct perf_event *event)
 	    !(spe_pmu->features & SPE_PMU_FEAT_FILT_LAT))
 		return -EOPNOTSUPP;
 
+	if (ATTR_CFG_GET_FLD(&event->attr, discard) &&
+	    discard_unsupported(spe_pmu))
+		return -EOPNOTSUPP;
+
 	set_spe_event_has_cx(event);
 	reg = arm_spe_event_to_pmscr(event);
 	if (reg & (PMSCR_EL1_PA | PMSCR_EL1_PCT))
-- 
2.34.1


