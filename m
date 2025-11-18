Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8B58CEE33B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 16:28:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iqeQCDNzyERvoI4uJsKzrMugXzNJjWTyKx7GIItRI68=; b=IL6FwnWdysHL8rQRcnuDiWAIRy
	YVI46IpD6RHkBv287qshMRFQDzjLrqIuKrHD3Vl4PYI+bc85agqWSoGMqiqN/WKe3GXSdHeFnVQPL
	UNVTHQ6w866zRZOHepdt0xdKM6k2k5KnszZl89AlB9qvyar3Kqc023qGsT0Q+RCFY29TLn82qSZoo
	fmFkh/1IN2HuGQ/d6hLjIwPJ+MHaqvJKSqR/vdz9On9+7jdrlRXAmCf/re8kVoxuBAeGbrfbViu6v
	vUOmHF0a3PezGD9AomCMSdvhk2eOXTTveonph35pL8ax7SyOjre9FAx7/eCpxiH/Ylm1ocFNDV2rH
	fu0WpoQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLOZR-00000000joF-24i9;
	Tue, 18 Nov 2025 16:28:45 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLOZ7-00000000jSW-1b7h
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 16:28:27 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-477563e28a3so39663285e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Nov 2025 08:28:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763483303; x=1764088103; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iqeQCDNzyERvoI4uJsKzrMugXzNJjWTyKx7GIItRI68=;
        b=I/H+fDCb2yr5iRgNsDGksnjsSeSz6CQwu9avUeO0jEVQoR6DvjsX8nI1nXZF3vgRMq
         WLT3IKbWZR4H48TXi95nLNcLFHXiUcSu9aGe2w9ZTAISr/5P+LYpqebariLXy+g4kLgD
         wxY8JWK0bYWeK9ihQM2DJgGD1SUiZdvdyOxDILMRdgxkOUsR8BjV9/9MOcNN02CSNqVP
         QDWLmznILPO5n2oFcPApjV3guMCdRFPvE1RqpjiYJyjLHn7coNe5pJBOwLZBU8O7RWuJ
         4EogwGz5cy+UJo+2gfsqlcZP83qg6hnjlA/f2GSQwCiVdy7PQjk3mEeUQSCyREvnueLV
         gLsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763483303; x=1764088103;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iqeQCDNzyERvoI4uJsKzrMugXzNJjWTyKx7GIItRI68=;
        b=B1Byl2w2R1fpHINx7s6fz8C53ULVmwf5zaU1f++a0jAqqVdRNpLmDfmIxbjgGcIbhD
         3A8l8TiKslCNkHBLSLn9X/C1F92bRfFQdN1oHQgfHoGXweoTYXaxqIVtlwa7lpqpge8a
         0xRQn03iYZdjcjqtisC4OqxN1LiNZKm+XNw0OuGhe1shAvKGf0cu2vvU6b0eAhSHim/8
         83bAJ3TY3I1lddWJ3ZXxNfsTF4POEtV+rjVwG7kkpKdKO/9bAZ1XnLazsSyBfCQL4wZ8
         tVJJfuoXXH/efYLfH30f0sjU0D/MwgqpeVFeGQueMwj4fRBnzD8zUaO59Vn663mNvBdg
         8XQw==
X-Forwarded-Encrypted: i=1; AJvYcCU5xep36s15b4rhHFRjlbFQw4fp/UuIVnR+/sQIXNXQBNrDP1xhxh4MP0F8jg+1EiiwpeLIIFziSOpXSsIxbc4m@lists.infradead.org
X-Gm-Message-State: AOJu0Yxe/MRaZihdd78dfmDKW+1CDxzCQTVjmsR4/JkHk/qPKMXQ9CTC
	ak71TWWuvVHuXK0jFa9Lz/u5/qt1neAGax3zP3y2WpsSjFBWlEfvm8MqXz0wurgDlTRS4seud7o
	bgC3Tfl4=
X-Gm-Gg: ASbGncu5B4SwFa32eN70iAA65JzS+HpVZgCC4SmWcHWhAQdEguHXFd05PFk/3qnwC1j
	Fb6fuGyxVU96rZfLjuf4TvBhPjG2wIhEZOcM3wgf9h5nMxc7fQT5bTWynO9xuzoZdne53hyZXFc
	3LFY0uVPiC5w5ufX8Ci0aCqGodtVkALfXVrwUvHJg+1vuJAIk4Ql38S8aDx5U+Es1Frgbrz8wU9
	0pNhm+w21ClU0mTB1X7ACmt2QR9V8fd2Q5rXKvdYMQuVhjwQiMUKU7vI1kUJ6IfsUsRPURwhr0S
	eCsoTSE/BE2hku3BLho+cgay66FSLknX0G22PuMO2pWhgavwOWEH861Z0pvK0d0cf7S3lI/m1Tg
	ImeL0kV91lJ8jhOEyNJor09zSsENhvC39HoSQ633K6/ijztIDfCFhdo6oQBYsO1RMvzomqnlpc6
	dAlA0maeKBd0bzI8UmlcOsBG0WVT3DyN8=
X-Google-Smtp-Source: AGHT+IHiGNeVqYzY8RnLPJ8E6eZBVePfsLh5VCrTQGhetzIjHKic3zyWZ4+OT6CddGvt4e7P7u0Utw==
X-Received: by 2002:a05:600c:4b2a:b0:475:de06:dbaf with SMTP id 5b1f17b1804b1-477b0cd8812mr392975e9.17.1763483303339;
        Tue, 18 Nov 2025 08:28:23 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477a9dea7fcsm20369125e9.8.2025.11.18.08.28.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 08:28:22 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Tue, 18 Nov 2025 16:27:59 +0000
Subject: [PATCH v5 09/13] coresight: Interpret ETMv4 config with
 ATTR_CFG_GET_FLD()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251118-james-cs-syncfreq-v5-9-82efd7b1a751@linaro.org>
References: <20251118-james-cs-syncfreq-v5-0-82efd7b1a751@linaro.org>
In-Reply-To: <20251118-james-cs-syncfreq-v5-0-82efd7b1a751@linaro.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jonathan Corbet <corbet@lwn.net>, Leo Yan <leo.yan@arm.com>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_082825_480204_04C6F7B2 
X-CRM114-Status: GOOD (  19.28  )
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

Remove hard coded bitfield extractions and shifts and replace with
ATTR_CFG_GET_FLD().

ETM4_CFG_BIT_BB was defined to give the register bit positions to
userspace, TRCCONFIGR_BB should be used in the kernel so replace it.

Reviewed-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 44 ++++++++++------------
 1 file changed, 19 insertions(+), 25 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index 5d21af346799..c7208ffc9432 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -29,6 +29,7 @@
 #include <linux/seq_file.h>
 #include <linux/uaccess.h>
 #include <linux/perf_event.h>
+#include <linux/perf/arm_pmu.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/property.h>
@@ -780,17 +781,17 @@ static int etm4_parse_event_config(struct coresight_device *csdev,
 		goto out;
 
 	/* Go from generic option to ETMv4 specifics */
-	if (attr->config & BIT(ETM_OPT_CYCACC)) {
+	if (ATTR_CFG_GET_FLD(attr, cycacc)) {
 		config->cfg |= TRCCONFIGR_CCI;
 		/* TRM: Must program this for cycacc to work */
-		cc_threshold = attr->config3 & ETM_CYC_THRESHOLD_MASK;
+		cc_threshold = ATTR_CFG_GET_FLD(attr, cc_threshold);
 		if (!cc_threshold)
 			cc_threshold = ETM_CYC_THRESHOLD_DEFAULT;
 		if (cc_threshold < drvdata->ccitmin)
 			cc_threshold = drvdata->ccitmin;
 		config->ccctlr = cc_threshold;
 	}
-	if (attr->config & BIT(ETM_OPT_TS)) {
+	if (ATTR_CFG_GET_FLD(attr, timestamp)) {
 		/*
 		 * Configure timestamps to be emitted at regular intervals in
 		 * order to correlate instructions executed on different CPUs
@@ -810,17 +811,17 @@ static int etm4_parse_event_config(struct coresight_device *csdev,
 	}
 
 	/* Only trace contextID when runs in root PID namespace */
-	if ((attr->config & BIT(ETM_OPT_CTXTID)) &&
+	if (ATTR_CFG_GET_FLD(attr, contextid1) &&
 	    task_is_in_init_pid_ns(current))
 		/* bit[6], Context ID tracing bit */
 		config->cfg |= TRCCONFIGR_CID;
 
 	/*
-	 * If set bit ETM_OPT_CTXTID2 in perf config, this asks to trace VMID
-	 * for recording CONTEXTIDR_EL2.  Do not enable VMID tracing if the
-	 * kernel is not running in EL2.
+	 * If set bit contextid2 in perf config, this asks to trace VMID for
+	 * recording CONTEXTIDR_EL2.  Do not enable VMID tracing if the kernel
+	 * is not running in EL2.
 	 */
-	if (attr->config & BIT(ETM_OPT_CTXTID2)) {
+	if (ATTR_CFG_GET_FLD(attr, contextid2)) {
 		if (!is_kernel_in_hyp_mode()) {
 			ret = -EINVAL;
 			goto out;
@@ -831,26 +832,22 @@ static int etm4_parse_event_config(struct coresight_device *csdev,
 	}
 
 	/* return stack - enable if selected and supported */
-	if ((attr->config & BIT(ETM_OPT_RETSTK)) && drvdata->retstack)
+	if (ATTR_CFG_GET_FLD(attr, retstack) && drvdata->retstack)
 		/* bit[12], Return stack enable bit */
 		config->cfg |= TRCCONFIGR_RS;
 
 	/*
-	 * Set any selected configuration and preset.
-	 *
-	 * This extracts the values of PMU_FORMAT_ATTR(configid) and PMU_FORMAT_ATTR(preset)
-	 * in the perf attributes defined in coresight-etm-perf.c.
-	 * configid uses bits 63:32 of attr->config2, preset uses bits 3:0 of attr->config.
-	 * A zero configid means no configuration active, preset = 0 means no preset selected.
+	 * Set any selected configuration and preset. A zero configid means no
+	 * configuration active, preset = 0 means no preset selected.
 	 */
-	if (attr->config2 & GENMASK_ULL(63, 32)) {
-		cfg_hash = (u32)(attr->config2 >> 32);
-		preset = attr->config & 0xF;
+	cfg_hash = ATTR_CFG_GET_FLD(attr, configid);
+	if (cfg_hash) {
+		preset = ATTR_CFG_GET_FLD(attr, preset);
 		ret = cscfg_csdev_enable_active_config(csdev, cfg_hash, preset);
 	}
 
 	/* branch broadcast - enable if selected and supported */
-	if (attr->config & BIT(ETM_OPT_BRANCH_BROADCAST)) {
+	if (ATTR_CFG_GET_FLD(attr, branch_broadcast)) {
 		if (!drvdata->trcbb) {
 			/*
 			 * Missing BB support could cause silent decode errors
@@ -859,7 +856,7 @@ static int etm4_parse_event_config(struct coresight_device *csdev,
 			ret = -EINVAL;
 			goto out;
 		} else {
-			config->cfg |= BIT(ETM4_CFG_BIT_BB);
+			config->cfg |= TRCCONFIGR_BB;
 		}
 	}
 
@@ -1083,11 +1080,8 @@ static int etm4_disable_perf(struct coresight_device *csdev,
 		return -EINVAL;
 
 	etm4_disable_hw(drvdata);
-	/*
-	 * The config_id occupies bits 63:32 of the config2 perf event attr
-	 * field. If this is non-zero then we will have enabled a config.
-	 */
-	if (attr->config2 & GENMASK_ULL(63, 32))
+	/* If configid is non-zero then we will have enabled a config. */
+	if (ATTR_CFG_GET_FLD(attr, configid))
 		cscfg_csdev_disable_active_config(csdev);
 
 	/*

-- 
2.34.1


