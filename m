Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73566E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 11:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LmEIgAdG7I77Lmy/EJIbJ6DkTA3vVYUkhkE5mP+SPGE=; b=itUw3x1OMWWnceYWALH1gGsabE
	duHTV4HPxfVP06XgS15qikCZPHrMQMbPC2kzIdkwLomJcT1tebxJh5O6jK2ivO2QBqxzG/51JyJua
	yLoz8CMakZOJjdTBPwq81oVPtxQ8OICK2MavDfACL8lahQHGuZE52amU7WTvJps0JhNssgDqxFHUL
	f0hdeIF9SlhNqGsKM1lj0I0Mwac3g3mBYSq95k6u1tnISQjG/mByvgi97rnT0W6fmbiOQeGNO5HXM
	zst01AUtsOGD+WluRqdM7YztF2T4GG3rVNapbgxuuWeAdi50vj7zaAhP/WiY/a3EuH0+8Wjr/OZ1y
	cpe0+X5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNWDi-0000000DKBi-47qd;
	Tue, 17 Dec 2024 11:58:34 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNWBe-0000000DJhO-3jsu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 11:56:28 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-43624b2d453so57566095e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Dec 2024 03:56:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734436585; x=1735041385; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LmEIgAdG7I77Lmy/EJIbJ6DkTA3vVYUkhkE5mP+SPGE=;
        b=BploJmyEboY0ZViHEtZ3TtIYM2RHE+qxz6i6OMECu/EfVqKKsqg5VT0IT0z4LJ0VDv
         9SY8NRHO1AlaevLUnrpE6HMuBiHLXwGkbkLt+2eVteEFZnpDiPyAjm9Q04Eba/QPWzvs
         0F+ezVrqLFM3gNaLZt5yuGp+dlItzA7IPyP0KgCeOXD1LOHh8P+SISedhIEpKqP5kUro
         7gSdr0SK++edEK3Wn8X2AAk6/Z9FcFJrzjBs9wrg4kgZu1aZy3DfEl69A/PR/ssadxWa
         hgmhEk/GB1vWOJQxXrOPnH1PX8LAX82OMDjhS1APADMyQ+MrhKtWEtIt+5pqL/l48O3H
         3nfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734436585; x=1735041385;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LmEIgAdG7I77Lmy/EJIbJ6DkTA3vVYUkhkE5mP+SPGE=;
        b=uijPIW8cElwlTNWWSIbVW7oO94REzU7vNhErIjMth2EHrI0rySvnFh3kBH3H9Sb8z7
         GrtYn0PgeIa/3eQUbNw4PkWrzsY3mmj2p6rFwhwzIMCUQA3LGZPk3x8gRPDohbT4CyBt
         YKgRpg+tktueIxi7iFFSjIeGsuMq0irrRsr1uQnue/0Il21tOperPWIQzuSfBPFNsJL3
         j5YHVBW8/yQw7RpT6J3zyqfryC18LvnOc+e0mMFUYpdKYZZ2E8x5LrKpo2XcyU8t1aWE
         K2zly5SfJPGs6MHzJbmRdG2ErD+nXg20lbnjBmeFsjRSyF+ugOYJ4ZXL+bKJy3DumLep
         6I2Q==
X-Gm-Message-State: AOJu0YzYvGZYi5hfSA5qJoY66nHy8vpaKAkeirr4OIO7RFz3UHFPJGxU
	lwyiTIaN9qWODnPHjITZoObItei7dVLDn3XXBB57l+3WXJhVtRC86l174GBaXZmLf8GvH9uF7PK
	8
X-Gm-Gg: ASbGncvPzMFBF4GYqzrVicRYLuAK8n5F7F8zGIjl8SEVxmQp4xo5DWOmkW5iHKFm6E3
	thl8y8GNe1xu1VHaD4rc7eLpjolR/Z8PWAmdTOzQzNSi/diEkPaBMBh50pTk6ccw5bPBE5IkKxB
	S8Bc0ULt3pgH9nb/n4mHhQIoteBO3AZLDWm1DdUok7jgQbwnTnf+gmYcsn7HRd6Ng0zEkPGV1u1
	+0H3GwGzhfVu9nCptNjnpe5aNA7RsiY4V9/FxBnJUQcohLapXo2Obug
X-Google-Smtp-Source: AGHT+IGNJedMudEIFVaDxE+oFB3UvniCIpMWZQiyQUFW16zagcfc+ek6kUelO/SpR4GWuh2tlAEkwA==
X-Received: by 2002:a05:600c:364b:b0:436:18d0:aa6e with SMTP id 5b1f17b1804b1-4362aa1b077mr127025825e9.5.1734436585066;
        Tue, 17 Dec 2024 03:56:25 -0800 (PST)
Received: from pop-os.. ([145.224.66.247])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436360159aasm114935825e9.6.2024.12.17.03.56.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2024 03:56:24 -0800 (PST)
From: James Clark <james.clark@linaro.org>
To: linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org
Cc: James Clark <james.clark@linaro.org>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	"Liang, Kan" <kan.liang@linux.intel.com>,
	John Garry <john.g.garry@oracle.com>,
	Mike Leach <mike.leach@linaro.org>,
	Leo Yan <leo.yan@linux.dev>,
	Graham Woodward <graham.woodward@arm.com>,
	linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org
Subject: [PATCH 1/5] perf: arm_spe: Add format option for discard mode
Date: Tue, 17 Dec 2024 11:56:04 +0000
Message-Id: <20241217115610.371755-2-james.clark@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241217115610.371755-1-james.clark@linaro.org>
References: <20241217115610.371755-1-james.clark@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_035626_930528_667BE467 
X-CRM114-Status: GOOD (  19.25  )
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


