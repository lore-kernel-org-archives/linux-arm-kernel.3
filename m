Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF11FCEE338
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 16:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eb0nZRqG3wPO7nucW1Po+d3Kj8IK/8D9zMABw4V5b10=; b=2UB8eXXVIyPHE458LDsyG7U9el
	N2R+CR7olMKi4AjeKS2TjrWBLs1QgFe/3UuY6sA37l2N4B3w6Bw+TmUFxCe4kWa0vEbQdlPvvw627
	7ETvyK1cEOp1bAR5sYsmPgYc3XOYapuuTJqLGn3eyPaHT3zvqQgWYWhDt6u45Ucrie2/G6g6whlrb
	FHmMX6Rgp93c4vE8OF1eGp8nx42TYLVyf3i0dWhAIbEXf1/YPOWUL/LEtGyoRKGr+NDYRGABHA8Ie
	8L6AxZsQYIFj07QDHRkpGMESW56JoDVlMkmhD+n7y17THi6H+8eAP7iz0cjqvCjdC5JuoyVekZt+k
	+0dsSy8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLOZS-00000000jpX-10HY;
	Tue, 18 Nov 2025 16:28:46 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLOZ9-00000000jVZ-0w7q
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 16:28:29 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-477a219db05so17598705e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Nov 2025 08:28:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763483305; x=1764088105; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eb0nZRqG3wPO7nucW1Po+d3Kj8IK/8D9zMABw4V5b10=;
        b=GpDVp8Q+Dn8AKcBDINqf5KbU8uksB+aYMMuNtuiYc3SrHcS5kU2NCgReT0wOX+Upo8
         LPTa3jvF4tqcN6ulPEdJ10jgveGdEqsro6SF9d+FBVf5gx6zfECrAXsPZ7OxXr0eRMDG
         EnoZnh+jw6NKEzXlNkl/vZiD6nzGTlSf/F6tRhd/npTwc+KPA/HdJJUI078E/2+rC7bi
         /ME9dn7riyC8QhCt9XYyK64QBlLgy/TfsnQ73IC2lyCZH6WcklgiQ6sg6w0trZn+IO8n
         PbeRpSQ+mm2wQIVwx05p4vpUBaDGagIm0MXDMAB+Ov9uLQXTP6OamiOD7qWXzfsV/Iu8
         9uqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763483305; x=1764088105;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eb0nZRqG3wPO7nucW1Po+d3Kj8IK/8D9zMABw4V5b10=;
        b=aqill8cfrlnC1zGA5UFZgOmbRcRd0qPJwc7S2OcLWuhthxXVwGImDrd+7VLgZP7cH6
         5LonpcyxtytOrVSVVW369uPKxZwlDlu2ObybPISKPKRTooa7hOwHI0z1Pw9FJKfZTB9T
         4gDc0C6zCtLm2ipuSC+lHMeQZuubXYUNslZwH0D4Y5inZXd6ikA70XaDn6K5C1+KXzP3
         snr2/pmhI9dpWB5k17ZxdOhKzCOydoRwkVufKUWGIAJPnw/NuUr+AqbwCCOo1l08mS3c
         QtkTvnOZyoM/78UaF6qmqPxQK0tJ0AWNuuxHepJ0y6zS/+/0d8K5HfGk2ucQx5TS6cgr
         9GbA==
X-Forwarded-Encrypted: i=1; AJvYcCUSml+Biefsxc1r3Ef2cVvWFpgoOQAJNBa25JBOG46NfFD276z61yrGs4kE+AtbLw8aEO5aZehQbQI/EvWPaDS0@lists.infradead.org
X-Gm-Message-State: AOJu0YxFBAsyAoUC3XNtV0/V2nVn8grTabxG+EwlqGyjSQ49cN+RENRA
	HijoMmFnzsUTDD2zctnFMm+h5FzJBYAuCyO+dcY2yEAvpiy6UuNbIh537M/vZKQJ7m9ot6EICXZ
	SzYOMTzc=
X-Gm-Gg: ASbGncs40hKYxETxsxAjc9ivXUy0cKEY4qoOlkoocxwZeoyvJxIk4hmXEytYEjNzpIn
	/SBzgZBNsBgM5DQTvJywj2waHaeQr4tAxAtZtCrLlJuKhfjYEzvhQeWyeEINeIstQPgIXjKzAAe
	Gg802XTXlCfiEedfTVApifkwR/eWFGCURaSxP5q2FsGzg72+SHe90bXjcHl49Xylf0gDlIpwTo7
	8tudvzvoCuWkstLIQXSfCZgMnteOVDox4Z4t76terg3Ommh7AaDxU39tQvMY6k5Syemam4/t9aF
	uewKkZcsQBuu8Yac0EOGBJZyBqUY4BXg4ilDHtcX2sZ7i9hm0PhDeq+3y6YPle9j2BQzAUfI7O5
	Xbi1jC2+o6o8tzGMaWePNSp3wL1pPA3U9wZ7fJ8WL4hbOCyERipb6/MImOxsPt3M0VFQCkRcOCd
	RIVsteklc2tWXFTtzzQYLjHwDHIfee8/nWOtT7t5zSuA==
X-Google-Smtp-Source: AGHT+IEgxjocht+zd5sgZk9UgQUOz1bPvElgaDdpvXL42GO6HQTKk5jhNzNQ67G2WTvucSd0gdRSKg==
X-Received: by 2002:a05:600c:8b5b:b0:477:7768:8da4 with SMTP id 5b1f17b1804b1-4778fe59f99mr148261815e9.7.1763483305277;
        Tue, 18 Nov 2025 08:28:25 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477a9dea7fcsm20369125e9.8.2025.11.18.08.28.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 08:28:24 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Tue, 18 Nov 2025 16:28:01 +0000
Subject: [PATCH v5 11/13] coresight: Extend width of timestamp format
 attribute
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251118-james-cs-syncfreq-v5-11-82efd7b1a751@linaro.org>
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
X-CRM114-CacheID: sfid-20251118_082827_368162_AAF349D9 
X-CRM114-Status: GOOD (  20.63  )
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


