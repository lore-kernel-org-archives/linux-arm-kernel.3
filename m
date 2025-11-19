Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FA02CF395D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 16:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eb0nZRqG3wPO7nucW1Po+d3Kj8IK/8D9zMABw4V5b10=; b=I8Oh67KZZ+Ge7JqarTpD1OW784
	OqW2m4qbrqS9IHW7y393Zz4ytUN7+/ysx8wXAwTIy+mvJK2x2IJsnOeWN7XxB2o6tdRJAEs5PBegy
	p+GAae+wMiusnk2MgpleYe3CMPedhniDCWY0q2mgiINsiqzZak2Bx2CbC4TGzbjhIES3ioFOE9waf
	pTXuv5PlKkR3i9jCHFGFt7TzlqWJAheKginUXdZZQ+HXOhhN2iXYjs/yeufUeEPcXTsN0c3gDyg4m
	hBVeM1wudpTSm9B7VXspIhUzAyHquRpeiIPoZNNAJCi/QP6Ao0ZTdHG/OnPkO2yHnxVabWLrygDuM
	zetH9Vew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLktI-00000003fDS-0k7R;
	Wed, 19 Nov 2025 16:18:44 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLkt5-00000003f0O-0aFI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 16:18:32 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-477549b3082so57158345e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Nov 2025 08:18:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763569109; x=1764173909; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eb0nZRqG3wPO7nucW1Po+d3Kj8IK/8D9zMABw4V5b10=;
        b=q80RWqdCt99Fo1qoeklEutlQp5nGIhwzCF7b2Zyql9gDQaKRxpgeV/w+91tCWa7ym4
         mWB+Jx3RBABsY7gz+F9Xxc/PH+d6vxxS6XwGvSz7NskxQnpd/gqFYrZvgg8ft+j3JiT0
         R0NPFSwxMLzi8plkruS+dVLa/FmTt99vzqToAlBkKtzql2YjZpWl5t0oY+gOnBaAnBlz
         hhNUQI8nkucATtHJCbFbjIX6xwVAQtTga6UmtXu3XJGS+mQZ6EczndT/fCFIjjQf4S1C
         DkXSFdFum4teGLIE21gVKkysdOoqa9ny5kPzfblietYpnefVCoggVypflxIC3IFYoR6R
         Q7WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763569109; x=1764173909;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eb0nZRqG3wPO7nucW1Po+d3Kj8IK/8D9zMABw4V5b10=;
        b=ATD2kdKzWXxqEWAE6yzK/WSOPqtSUNIZh+CgFkOeXBdC/X/XAca8F0HpaTHAm+7RJB
         +c9AicYMdfzoBqLF/ppu+xRfP3pueOPht32/yILMuYF+SYKVV0ipX8KzLLVYEbBuS/EH
         qh16ePMWB2vvZxD3JVfleau74s0UcvJFiB2uNd96f/jdXNkvyh9tKPUbgT0Dfdevsgbe
         RCKgQ3HHnnDgflCnunvu1qclpamo8LSYCWdDCA37SWJIrQwC1Rgo/df6zHevocM9cmVe
         ItpmTwjdP6xWt7LnCXRN6VJ6wF7UER1/G30Awwzz+2g0kJM0CgDJTgyjhr7BNsofKnWV
         Kzbg==
X-Forwarded-Encrypted: i=1; AJvYcCU/zggFJZpnwUPErcMoDJbBsiqgZh4Z2T/Dcig4/plPnF+qJ+q8gUeCnQNo/kOEXovqTfdJJH1p7rR8kYpOyBpv@lists.infradead.org
X-Gm-Message-State: AOJu0YzpDORqK3P/qjfLJIcBmd9XpC46Ub0niRptexDMVgdU2CEIdgJN
	B+3E0hh8wDa3JdQ7E5Du3b5SdV5U/QY9M9x9Sb4HcAizXIcYlsY9wQuD0esDPVB93TQ=
X-Gm-Gg: ASbGncudTc/KMcPg1BGRfFtIzcOohtnP1Fdi+G3I7sQT9/AAfV6aoSjPoGSa4dsBm4A
	Gv1VSVs6GC3v+mLRdzRvfs6RaTr+GBZzH6w6hIQ+1T/oxa9i7WcLZSPsI6b5iY2RvyrdwzyZcir
	R9r3h+vNqc2+5QuvRYLk6+OX1HNNhKVQnyVJqx3WGAuYXnU0JPuUN0All83YLof/azBAere/W6f
	/KC/FMGncXMc9O4mYxk9M4U1hp3LM9mOtouVEyNeXSlld18C6gJUmPLpXTEWN8zvI2UFqVoAM5j
	CdULC6X9IxMRuOudr3yG7IEV9BfG+/3qsgNp4jENY5dJ4dRQNvqo2xmzcr4HcgMAS23eKFE0hjt
	JNFmtei/Hy/07ViXBVRroildUPKsN3OzG64bRR8kC+RoUCQGC4kNKICnhesOhTmiuV3HFAxCuZh
	ZLaXFslG7Q0yX0ePxl1TP06hI2fYGSg1M=
X-Google-Smtp-Source: AGHT+IGDAoHjrNiuL0wt3S1CON20jtX8GRGXrTHnizlFbQ1DR9gz3tuquij5PgE+xexhigojLp1k8A==
X-Received: by 2002:a05:600c:c4a2:b0:477:c37:2ea7 with SMTP id 5b1f17b1804b1-4778fe9ac28mr192009635e9.21.1763569109415;
        Wed, 19 Nov 2025 08:18:29 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477b10142d3sm63205425e9.5.2025.11.19.08.18.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 08:18:29 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Wed, 19 Nov 2025 16:18:07 +0000
Subject: [PATCH v6 11/13] coresight: Extend width of timestamp format
 attribute
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251119-james-cs-syncfreq-v6-11-740d24a29e51@linaro.org>
References: <20251119-james-cs-syncfreq-v6-0-740d24a29e51@linaro.org>
In-Reply-To: <20251119-james-cs-syncfreq-v6-0-740d24a29e51@linaro.org>
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
X-CRM114-CacheID: sfid-20251119_081831_206578_AA6CF0AE 
X-CRM114-Status: GOOD (  21.11  )
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
different intervals in a later commit, extend it to 4 bits wide. Keep
the old bit position for backward compatibility but don't publish in the
format/ folder. It will be removed from the documentation and can be
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
Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/hwtracing/coresight/coresight-etm-perf.h   | 13 ++++++++++---
 drivers/hwtracing/coresight/coresight-etm3x-core.c |  9 ++++++++-
 drivers/hwtracing/coresight/coresight-etm4x-core.c |  4 +++-
 3 files changed, 21 insertions(+), 5 deletions(-)

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
index 584d653eda81..d4c04e563bf6 100644
--- a/drivers/hwtracing/coresight/coresight-etm3x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm3x-core.c
@@ -338,9 +338,16 @@ static int etm_parse_event_config(struct etm_drvdata *drvdata,
 	if (ATTR_CFG_GET_FLD(attr, cycacc))
 		config->ctrl |= ETMCR_CYC_ACC;
 
-	if (ATTR_CFG_GET_FLD(attr, timestamp))
+	if (ATTR_CFG_GET_FLD(attr, deprecated_timestamp) ||
+	    ATTR_CFG_GET_FLD(attr, timestamp))
 		config->ctrl |= ETMCR_TIMESTAMP_EN;
 
+	if (ATTR_CFG_GET_FLD(attr, timestamp) > 1) {
+		dev_dbg(&drvdata->csdev->dev,
+			"timestamp format attribute should be 0 (off) or 1 (on)\n");
+		return -EINVAL;
+	}
+
 	/*
 	 * Possible to have cores with PTM (supports ret stack) and ETM (never
 	 * has ret stack) on the same SoC. So only enable when it can be honored
diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index c7208ffc9432..cfd6d2b7bc50 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -28,6 +28,7 @@
 #include <linux/amba/bus.h>
 #include <linux/seq_file.h>
 #include <linux/uaccess.h>
+#include <linux/perf/arm_pmu.h>
 #include <linux/perf_event.h>
 #include <linux/perf/arm_pmu.h>
 #include <linux/platform_device.h>
@@ -791,7 +792,8 @@ static int etm4_parse_event_config(struct coresight_device *csdev,
 			cc_threshold = drvdata->ccitmin;
 		config->ccctlr = cc_threshold;
 	}
-	if (ATTR_CFG_GET_FLD(attr, timestamp)) {
+	if (ATTR_CFG_GET_FLD(attr, deprecated_timestamp) ||
+	    ATTR_CFG_GET_FLD(attr, timestamp)) {
 		/*
 		 * Configure timestamps to be emitted at regular intervals in
 		 * order to correlate instructions executed on different CPUs

-- 
2.34.1


