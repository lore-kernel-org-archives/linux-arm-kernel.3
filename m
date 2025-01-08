Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62CC8E77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 14:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tGOb+QzXOCupJHbixt2wd4hm1wKT1vTFMOcKSfrV7BU=; b=HsWtGTzGV1fp2SQteDYAvHrFDI
	Ek+0P6FmeHrWH9fcrK2PAGyqQ+ddqnNEdXLF+rRhbnRFTrJhTNb+rGp7ArJHFsL/8UcAxuwhoDx6U
	/eZeZPXopYhY9kCeyAnsxPb0IAEv+VxSgrrJ/V7CXCgVElE9Xo3rV6fE/yGnKDNaZykOyO1x6StmG
	WCmN1me1GxDtG8/x7KFSHNv/yNe6IChKtFnUQdnuC04B4qQolxKhLHSlhxosiDbDUoCtF9Sjmbeyb
	FgjAp4shNdT2j4+XO/q76PMZSxDT2gnmolbnsaNoLV4kX+L5yMkLS4A0OEdM9JOCXT0bDSrXbiGgu
	I6fF5xzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVX6v-00000008nrb-04n3;
	Wed, 08 Jan 2025 14:32:41 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVX4Y-00000008nDm-3o7Y
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jan 2025 14:30:16 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-436345cc17bso122176065e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jan 2025 06:30:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736346613; x=1736951413; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tGOb+QzXOCupJHbixt2wd4hm1wKT1vTFMOcKSfrV7BU=;
        b=cMxUjcF8RT2n4ml4eVzRq8NVhQELzu0YahWoWQ0wkOZbnv4iiMcsUjFDuzH0cABOil
         E7kXy4FA8GS9UX9zmWqkoLDXZgXzP+VN67/UPGRclk6ypmzqUOLmywVeBmHETrwe1kkL
         8LXaMM0OI6JpjGZP3kGgsgDvfCumpR797R/x8IVT2Tpzm+DOsZceVk7+eTjAE4ly4Sfj
         1LHqRuhCLuffRFJvNii6DZIpTWC3Sx/6yfcx4zVNdM6wwsD9UWVKLZYBSBQ0Ktj8B8uv
         XudUHRgNwlF0Wak3vZf9Ew3/y5w2ZBHAda4tdYsswjclQFRV2xWuVCYXVnJrtCB2NLlp
         wrlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736346613; x=1736951413;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tGOb+QzXOCupJHbixt2wd4hm1wKT1vTFMOcKSfrV7BU=;
        b=tNpaeKNRSriBIIrUyEzhJXCSKItYEUTBbue4OFZGkvEFQ9TxkUbNbJ+gDR1xUtkZmt
         zAFu5OdcCb8TaRGkPKhYiLRDFPYjgy122Ng2ifU1kXDtTsAFQvaKDch2wqLYxCci+aSt
         6sRf90Cqp7EOm2Hz0IciHuBqBiQNNvwx7Uf6ZLc/zD5r2JBUmd48PsQuz9V9fRDWa51l
         ZZ7nBh3lf63yR3CAgFSvL2s0/mqgQlelPb6rZkwN2iTbWHpFgVDYHiOvYYTSmwE4UP6B
         CTbKH0Rh1EiZhJZLyMdTrc+oVFp8nbcHC4iT6pBuD4s6LSS58rST1IjC0eWo0zOHjGu5
         CR3A==
X-Gm-Message-State: AOJu0Yw5yITLgJR7H60oymrqtcwp1+dNDBGMUMzUQ9tKAV9EOLS+nNZZ
	hYUFxssFJffDetosPhx9T0kgLfD18EgKMUzCBOTADROIIpiZIq/51RfEsXNY1Ft/ovoPqQA4L2h
	K
X-Gm-Gg: ASbGnctCqWa7O1kyIkYFoezBoPPXcXBA0II7h9BKzT8S6s8LcFKO2ElK20UK8wv0lIY
	idkjEzx7XzqXhlM5CHbQHazyqcnCMddgDNzpQKo9rJDJwHoQn4JVyTMIqTd2CeB28+F4OR+neb4
	xZsQpK8MdILdu058wX6ZWq9B/njaN+sOLA9ROsD0ZYIttBPJpUNSE8tKetsDmPHxZvPVkx0DmzC
	Bk2Akf6XL6mWQA0d7g7I1pCMjhPa6aHoUUkNCg/B7vW6pjTQKMvnlj5
X-Google-Smtp-Source: AGHT+IHN1A9cX6z/xhhtgrQjHkaDM0PpDq23z/ArfmpMTg/+JIa+MQk4qZUtvdK5AFfi/widPNwZ7g==
X-Received: by 2002:a05:600c:1d07:b0:434:9934:575 with SMTP id 5b1f17b1804b1-436e26a8f4dmr28940535e9.16.1736346612923;
        Wed, 08 Jan 2025 06:30:12 -0800 (PST)
Received: from pop-os.. ([145.224.90.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e2ddccf4sm22836965e9.19.2025.01.08.06.30.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 06:30:12 -0800 (PST)
From: James Clark <james.clark@linaro.org>
To: linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	irogers@google.com,
	yeoreum.yun@arm.com,
	will@kernel.org,
	mark.rutland@arm.com,
	namhyung@kernel.org,
	acme@kernel.org
Cc: robh@kernel.org,
	James Clark <james.clark@linaro.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	"Liang, Kan" <kan.liang@linux.intel.com>,
	John Garry <john.g.garry@oracle.com>,
	Mike Leach <mike.leach@linaro.org>,
	Leo Yan <leo.yan@linux.dev>,
	Graham Woodward <graham.woodward@arm.com>,
	Michael Petlan <mpetlan@redhat.com>,
	Veronika Molnarova <vmolnaro@redhat.com>,
	Athira Rajeev <atrajeev@linux.vnet.ibm.com>,
	Thomas Richter <tmricht@linux.ibm.com>,
	linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org
Subject: [PATCH v3 1/5] perf: arm_spe: Add format option for discard mode
Date: Wed,  8 Jan 2025 14:28:56 +0000
Message-Id: <20250108142904.401139-2-james.clark@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250108142904.401139-1-james.clark@linaro.org>
References: <20250108142904.401139-1-james.clark@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_063014_947604_9C10B0C2 
X-CRM114-Status: GOOD (  19.85  )
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

Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/perf/arm_spe_pmu.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/perf/arm_spe_pmu.c b/drivers/perf/arm_spe_pmu.c
index fd5b78732603..f5e6878db9d6 100644
--- a/drivers/perf/arm_spe_pmu.c
+++ b/drivers/perf/arm_spe_pmu.c
@@ -85,6 +85,7 @@ struct arm_spe_pmu {
 #define SPE_PMU_FEAT_LDS			(1UL << 4)
 #define SPE_PMU_FEAT_ERND			(1UL << 5)
 #define SPE_PMU_FEAT_INV_FILT_EVT		(1UL << 6)
+#define SPE_PMU_FEAT_DISCARD			(1UL << 7)
 #define SPE_PMU_FEAT_DEV_PROBED			(1UL << 63)
 	u64					features;
 
@@ -193,6 +194,9 @@ static const struct attribute_group arm_spe_pmu_cap_group = {
 #define ATTR_CFG_FLD_store_filter_CFG		config	/* PMSFCR_EL1.ST */
 #define ATTR_CFG_FLD_store_filter_LO		34
 #define ATTR_CFG_FLD_store_filter_HI		34
+#define ATTR_CFG_FLD_discard_CFG		config	/* PMBLIMITR_EL1.FM = DISCARD */
+#define ATTR_CFG_FLD_discard_LO			35
+#define ATTR_CFG_FLD_discard_HI			35
 
 #define ATTR_CFG_FLD_event_filter_CFG		config1	/* PMSEVFR_EL1 */
 #define ATTR_CFG_FLD_event_filter_LO		0
@@ -216,6 +220,7 @@ GEN_PMU_FORMAT_ATTR(store_filter);
 GEN_PMU_FORMAT_ATTR(event_filter);
 GEN_PMU_FORMAT_ATTR(inv_event_filter);
 GEN_PMU_FORMAT_ATTR(min_latency);
+GEN_PMU_FORMAT_ATTR(discard);
 
 static struct attribute *arm_spe_pmu_formats_attr[] = {
 	&format_attr_ts_enable.attr,
@@ -228,6 +233,7 @@ static struct attribute *arm_spe_pmu_formats_attr[] = {
 	&format_attr_event_filter.attr,
 	&format_attr_inv_event_filter.attr,
 	&format_attr_min_latency.attr,
+	&format_attr_discard.attr,
 	NULL,
 };
 
@@ -238,6 +244,9 @@ static umode_t arm_spe_pmu_format_attr_is_visible(struct kobject *kobj,
 	struct device *dev = kobj_to_dev(kobj);
 	struct arm_spe_pmu *spe_pmu = dev_get_drvdata(dev);
 
+	if (attr == &format_attr_discard.attr && !(spe_pmu->features & SPE_PMU_FEAT_DISCARD))
+		return 0;
+
 	if (attr == &format_attr_inv_event_filter.attr && !(spe_pmu->features & SPE_PMU_FEAT_INV_FILT_EVT))
 		return 0;
 
@@ -502,6 +511,12 @@ static void arm_spe_perf_aux_output_begin(struct perf_output_handle *handle,
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
@@ -743,6 +758,10 @@ static int arm_spe_pmu_event_init(struct perf_event *event)
 	    !(spe_pmu->features & SPE_PMU_FEAT_FILT_LAT))
 		return -EOPNOTSUPP;
 
+	if (ATTR_CFG_GET_FLD(&event->attr, discard) &&
+	    !(spe_pmu->features & SPE_PMU_FEAT_DISCARD))
+		return -EOPNOTSUPP;
+
 	set_spe_event_has_cx(event);
 	reg = arm_spe_event_to_pmscr(event);
 	if (reg & (PMSCR_EL1_PA | PMSCR_EL1_PCT))
@@ -1027,6 +1046,9 @@ static void __arm_spe_pmu_dev_probe(void *info)
 	if (FIELD_GET(PMSIDR_EL1_ERND, reg))
 		spe_pmu->features |= SPE_PMU_FEAT_ERND;
 
+	if (spe_pmu->pmsver >= ID_AA64DFR0_EL1_PMSVer_V1P2)
+		spe_pmu->features |= SPE_PMU_FEAT_DISCARD;
+
 	/* This field has a spaced out encoding, so just use a look-up */
 	fld = FIELD_GET(PMSIDR_EL1_INTERVAL, reg);
 	switch (fld) {
-- 
2.34.1


