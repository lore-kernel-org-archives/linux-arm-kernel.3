Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E442D116F6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Nov 2025 11:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5368MuIG36Hb0NYODGe1O8EB5VRQ12WYq9XYGie/B4g=; b=CM8lgZSsy1AuuVbALGNobcKzgD
	6oIrr8DgnG08EoNHE3UqnMtn5CmHORwWeaktnlTg+b6gLjOl15dl3Oei9Yff/APmxxwtnaSnkYtLm
	23IKxnAouC872iq0eZGL8cGHzM+c1eF0Efl2ValLmkbU1Y0lirpnohtoBRufYBq+rhZi6LbQOmGWC
	QzPRjpBwLrkoSvZMcHB8RgEsE+YyzJ1Uzpmni8T4gNaZ3JCzjg16uuKQI2daF0XbaOJ0Vitmp0L8i
	IrjCcbpkYDohePBmaqbXMC9cqpz+43CpTf+IcDcjQ8wCzszRt9WZIOPF9mOR6XHgDCMGtATv3+AGB
	YhwuY2nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOx5C-00000000NvW-46Fp;
	Fri, 28 Nov 2025 11:56:14 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOx51-00000000Nm5-0Gmc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Nov 2025 11:56:04 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-47774d3536dso14571645e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Nov 2025 03:56:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764330961; x=1764935761; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5368MuIG36Hb0NYODGe1O8EB5VRQ12WYq9XYGie/B4g=;
        b=YEc8HTcNNf/drzrP2T5/zn38KLZrJzAauIkQr42IrrNgbI8KtehBIzN1XFYMK6bdsl
         eLdvCZvCWWU2f2lSUhdTWqHLokUi0gteZDxePUEKgcjG25uqogOraWt35P+j+KGTydtN
         Fkzl4/yj35bq/G7YGcOSmQgvcU2uTsel20MurU/EfNfwojnmr1R9N6C/Adg+rv0AgMgm
         FSGUqzDUtObiZZ+zReUMs4oLRm/riFD4IeuKlMmdJvYyLgc4kXEvubRUE1JlRqZO+9dy
         bYEHLGvoq0I49EnRtYyQTTd9YQxuHd0qf1Ub/MVCZ7/Gxe0uHyM0JPOLEcIWfGymQSD3
         +ZJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764330961; x=1764935761;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5368MuIG36Hb0NYODGe1O8EB5VRQ12WYq9XYGie/B4g=;
        b=M/AuBXAfUF+nwSZfJGP4oZ6l2Q/teAz6WHxrYthxhvQWf5JU9aU+viB7jiw4n5PV4z
         mf31GwJbwq8++rJMbaWlxD0juNitXdYE631tIynwnid/yHEuEopz7ZCalpn4ggaNH7TQ
         raQMjJFjHXZPMFpOwPOLlLVdsQQv7OJeUynNj45QvMduxSpb92TeJEHyzlnid6TuISWX
         OHzUv4EBLRxXTta+GspXVa8bLpeNySlwrhIxoC8DkDlXIZ6DZgdXbxIGojnn5Be+f7lf
         thC7VZ25nfpJZL04V7SR+kSWqwhtfIDVX9VqnEjf55S0996vFi+JV1i1gunZ2+w5T0Wz
         +l0A==
X-Forwarded-Encrypted: i=1; AJvYcCXJS0JFtmX4ICDhISDp4c6ouJK55kqTNxR1lc69r+GbJxlrCjz/BbjH6eYeMtHLyA4QAkv9Jj5jljxRlLrW3rmd@lists.infradead.org
X-Gm-Message-State: AOJu0Yxq6UhR/HiPtGD4oWdZ2BV4u3JlX6ChGBta5oZwxrJ2Cnl2vDdA
	DVKDEcCzDe+7TcnJ2hwyHv5cMBWEEn5DDjmxovXlSa8K+UmfeFTVTo0fYzOaTheTqgg=
X-Gm-Gg: ASbGnculgC3FJYPlMv+sjATKr/UrNtpRrtNn3ps207mAXGgnJAvMfSP0WqYmw5FEak/
	DNQWfS8ARTNfVJvIimmzS9pzV7ZoXEUz0UpP2IWQWYKvz4dcIL7v65GPveMapfxgq98dUEObvSp
	Aq6nAqXCC30rC4yt2R4luqaNXtCCszU9pMkt5f6zDbWBlL2rMAiOE/s0l42H0ORFAcuCiKLhrK1
	W2sLldLpYSauxcuRdbzSkThxDIQBR7+IpfKjsy1/CQLHIVJMi7WuSwHK8aYOBiOp9T8HYGno7l4
	0y4YypjnxTaY2GiTCe1fLJhdeILZK9YZVOVMa+FLywymP0nYZ2pgZxNRpx7im3YsZtF07ACaNcr
	HOLUnLOROlHe7UAn5kBV5Q7iRs/c70BMRFnXskbyg0QU7m++XrkEaszPE9x8/nMfMhJ1p42nmHQ
	VDzgebKaezFZUdDKyA0ZiKC2LNQSfMclk=
X-Google-Smtp-Source: AGHT+IHE0tds7XLxA+n+V0acq2/1sSr+l4IbYfbl7nhPj+Ex3bWfKJpA/SevPoWJ0cpE1jWrYY/WzA==
X-Received: by 2002:a05:600c:1c1f:b0:477:9e0c:f59 with SMTP id 5b1f17b1804b1-477c04c2011mr330672845e9.2.1764330961427;
        Fri, 28 Nov 2025 03:56:01 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4790adc8bc7sm158974465e9.1.2025.11.28.03.56.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 03:56:01 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Fri, 28 Nov 2025 11:55:24 +0000
Subject: [PATCH v8 12/13] coresight: Extend width of timestamp format
 attribute
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251128-james-cs-syncfreq-v8-12-4d319764cc58@linaro.org>
References: <20251128-james-cs-syncfreq-v8-0-4d319764cc58@linaro.org>
In-Reply-To: <20251128-james-cs-syncfreq-v8-0-4d319764cc58@linaro.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jonathan Corbet <corbet@lwn.net>, Leo Yan <leo.yan@arm.com>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 James Clark <james.clark@linaro.org>, Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251128_035603_153192_01884CA2 
X-CRM114-Status: GOOD (  22.40  )
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

'timestamp' is currently 1 bit wide for on/off. To enable setting
different intervals, extend it to 4 bits wide. Keep the old bit position
for backward compatibility ("deprecated_timestamp") but don't publish in
the format/ folder. It will be removed from the documentation and can be
removed completely after enough time has passed.

ETM3x doesn't support different intervals, so validate that the value is
either 0 or 1.

Tools that read the bit positions from the format/ folder will continue
to work as before, setting either 0 or 1 for off/on. Tools that
incorrectly didn't do this and set the ETM_OPT_TS bit directly will also
continue to work because that old bit is still checked.

This avoids adding a second timestamp attribute for setting the
interval. This would be awkward to use because tools would have to be
updated to ensure that the timestamps are always enabled when an
interval is set, and the driver would have to validate that both options
are provided together. All this does is implement the semantics of a
single enum but spread over multiple fields.

Reviewed-by: Leo Yan <leo.yan@arm.com>
Tested-by: Leo Yan <leo.yan@arm.com>
Tested-by: Jie Gan <jie.gan@oss.qualcomm.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/hwtracing/coresight/coresight-etm-perf.h   | 13 ++++++++---
 drivers/hwtracing/coresight/coresight-etm3x-core.c | 12 +++++++++-
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 27 +++++++++++++---------
 3 files changed, 37 insertions(+), 15 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.h b/drivers/hwtracing/coresight/coresight-etm-perf.h
index c794087a0e99..24d929428633 100644
--- a/drivers/hwtracing/coresight/coresight-etm-perf.h
+++ b/drivers/hwtracing/coresight/coresight-etm-perf.h
@@ -23,6 +23,9 @@ struct cscfg_config_desc;
 #define ATTR_CFG_FLD_preset_CFG			config
 #define ATTR_CFG_FLD_preset_LO			0
 #define ATTR_CFG_FLD_preset_HI			3
+#define ATTR_CFG_FLD_timestamp_CFG		config
+#define ATTR_CFG_FLD_timestamp_LO		4
+#define ATTR_CFG_FLD_timestamp_HI		7
 #define ATTR_CFG_FLD_branch_broadcast_CFG	config
 #define ATTR_CFG_FLD_branch_broadcast_LO	8
 #define ATTR_CFG_FLD_branch_broadcast_HI	8
@@ -35,9 +38,13 @@ struct cscfg_config_desc;
 #define ATTR_CFG_FLD_contextid2_CFG		config
 #define ATTR_CFG_FLD_contextid2_LO		15
 #define ATTR_CFG_FLD_contextid2_HI		15
-#define ATTR_CFG_FLD_timestamp_CFG		config
-#define ATTR_CFG_FLD_timestamp_LO		28
-#define ATTR_CFG_FLD_timestamp_HI		28
+/*
+ * Old position of 'timestamp' and not published in sysfs. Remove at a later
+ * date if necessary.
+ */
+#define ATTR_CFG_FLD_deprecated_timestamp_CFG	config
+#define ATTR_CFG_FLD_deprecated_timestamp_LO	28
+#define ATTR_CFG_FLD_deprecated_timestamp_HI	28
 #define ATTR_CFG_FLD_retstack_CFG		config
 #define ATTR_CFG_FLD_retstack_LO		29
 #define ATTR_CFG_FLD_retstack_HI		29
diff --git a/drivers/hwtracing/coresight/coresight-etm3x-core.c b/drivers/hwtracing/coresight/coresight-etm3x-core.c
index 584d653eda81..57e4a21c8fdd 100644
--- a/drivers/hwtracing/coresight/coresight-etm3x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm3x-core.c
@@ -310,6 +310,7 @@ static int etm_parse_event_config(struct etm_drvdata *drvdata,
 {
 	struct etm_config *config = &drvdata->config;
 	struct perf_event_attr *attr = &event->attr;
+	u8 ts_level;
 
 	if (!attr)
 		return -EINVAL;
@@ -338,7 +339,16 @@ static int etm_parse_event_config(struct etm_drvdata *drvdata,
 	if (ATTR_CFG_GET_FLD(attr, cycacc))
 		config->ctrl |= ETMCR_CYC_ACC;
 
-	if (ATTR_CFG_GET_FLD(attr, timestamp))
+	ts_level = max(ATTR_CFG_GET_FLD(attr, timestamp),
+		       ATTR_CFG_GET_FLD(attr, deprecated_timestamp));
+
+	if (ts_level > 1) {
+		dev_dbg(&drvdata->csdev->dev,
+			"timestamp format attribute should be 0 (off) or 1 (on)\n");
+		return -EINVAL;
+	}
+
+	if (ts_level)
 		config->ctrl |= ETMCR_TIMESTAMP_EN;
 
 	/*
diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index 7e9c923acf4b..d565a73f0042 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -750,6 +750,9 @@ static int etm4_parse_event_config(struct coresight_device *csdev,
 	int ret = 0;
 	struct etmv4_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
 	struct etmv4_config *config = &drvdata->config;
+	struct perf_event_attr max_timestamp = {
+		.ATTR_CFG_FLD_timestamp_CFG = U64_MAX,
+	};
 	struct perf_event_attr *attr = &event->attr;
 	unsigned long cfg_hash;
 	int preset, cc_threshold;
@@ -790,21 +793,23 @@ static int etm4_parse_event_config(struct coresight_device *csdev,
 		config->ccctlr = cc_threshold;
 	}
 
-	ts_level = ATTR_CFG_GET_FLD(attr, timestamp);
+	ts_level = max(ATTR_CFG_GET_FLD(attr, timestamp),
+		       ATTR_CFG_GET_FLD(attr, deprecated_timestamp));
 	if (ts_level) {
 		/*
-		 * Configure timestamps to be emitted at regular intervals in
-		 * order to correlate instructions executed on different CPUs
-		 * (CPU-wide trace scenarios).
+		 * Don't do counter generated timestamps when ts_level == MAX.
+		 * Leave only SYNC timestamps from TRCCONFIGR_TS.
 		 */
-		ret = etm4_config_timestamp_event(drvdata, ts_level);
+		if (ts_level != ATTR_CFG_GET_FLD(&max_timestamp, timestamp)) {
+			ret = etm4_config_timestamp_event(drvdata, ts_level);
 
-		/*
-		 * No need to go further if timestamp intervals can't
-		 * be configured.
-		 */
-		if (ret)
-			goto out;
+			/*
+			 * Error if user asked for timestamps but there was no
+			 * free counter.
+			 */
+			if (ret)
+				goto out;
+		}
 
 		/* bit[11], Global timestamp tracing bit */
 		config->cfg |= TRCCONFIGR_TS;

-- 
2.34.1


