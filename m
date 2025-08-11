Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 118B0CA0EC0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Aug 2025 09:50:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+wY/wlxwOBKXlk5tbUQnKyA0OI06WJcUCTjg68F176k=; b=2AfmtHDqGtDDw6iaJ+k/RJRPAb
	tJLOt/fncYxzvvdvabGk906ZRS5FBHFJwiYL9c5F5UvQwjrdUzzOlefkEkk3PsoXS3kwFc0RBbH7U
	Cif6+PObs8G0Jdtu3hoyN+ymREAuDUr4O5UFeFrI4SqU5ZHHiCivDYa4Y7MATcLtsfhkcH1ozhbLt
	k7dVywElsP/SRHSPld0MnGUKD3l3NlWFTBhzrU6PquPFmO2HCgoeaNz4JZDlwlXLIPbN2MH639fVi
	lSr40qDytVx7ajquCLfoND/4I+NpEUmbb6UY/Q/BE1XjYhly0XfAXqsB+ydj3c/fuNfnLWIQUiIPL
	AwOyVYrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulPAV-00000007DXu-2wow;
	Mon, 11 Aug 2025 09:50:15 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulOta-000000078kL-476c
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Aug 2025 09:32:48 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-459fdc391c6so14820715e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 Aug 2025 02:32:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754904765; x=1755509565; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+wY/wlxwOBKXlk5tbUQnKyA0OI06WJcUCTjg68F176k=;
        b=w5iohYMXiNSu+iMPsC77KhLrHGSQx1ScXEw7VVb6WUrMmeGr0qxuAajSLdwt3JkGF7
         0yzx8WYFu2ORB504tBmh1wmHni9OfXvsrGau0ZCQoiwQuQuLaBKaOC0wzgFQ4cokqiEY
         YMZw/7Ycved/wAZ6+ze6HIpT7+8GgVRYBrnLn/GRow24ocliiPe/QLagPxVACvRlI73X
         islMMhDounVP8uMDGg0cOPVKkYtaHEJlDWTyxxhbUcaOcjKeTi6LGs6FbOYzSwNyh3g8
         R5WSWVXHf57QwWh6UHImmR00tRoa5z6tXUGarDn/mgzjbTEGn5OzBvFcSIgOrCghHmbI
         NgYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754904765; x=1755509565;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+wY/wlxwOBKXlk5tbUQnKyA0OI06WJcUCTjg68F176k=;
        b=hT2m1wgt2r9fjntW+Z/xA4SNFi1G4IFy9LSGZccmKdWnCA6mS/OOkt6vqUpOVayV0U
         aCNaZt0P8BEQks3OXq5Td9yrYRu0cZGNe5tQq5EoyXjfMUrj7hHXWlNp4m3wqznRuP0o
         xNGDSxA20STqpGiqNwaRf/5JARolf3lhZMbVLDc9PTk41Vmzt2kMvpPvrjjVQlSX7bdq
         5IE3Ha5oT2hqwt5rC7wagqpMfOcJT9TmSbkDPmmCfq2feZj7aajTDbMQNTj6kAP8fcz6
         nCRxBMVlx4q2SDL0rGStDrE144pRvhdKK9xRwti89ql9Lzx9sC9ZdjHRP/kUDUj6n4IH
         btQQ==
X-Forwarded-Encrypted: i=1; AJvYcCVUHzugW1DsQn3RXibDgMxK0GX0xG9nvnqOm4OwRK9vJqWAKUI3Se1niecYWtND5ReZa8gtcnQ2Z9pLh+OdYHvt@lists.infradead.org
X-Gm-Message-State: AOJu0YzB4spvZO5o3bN7ZR+9OAH74w6PBvJO1bZu33/0uWhnb2PvweFZ
	o1SdSbIltXhyoSo6x97hM5AjhZ0VlJYqpSIi8CWoUne076OYBk0eLrVgkiKzGpIhEAI=
X-Gm-Gg: ASbGncum4Le1w7fP1dg6mUMxgtqD20CJ2HzXLYGFETx12NlbPNZI+DPqMgN8ffqbaYI
	ZogFCBCDsxcMLzs/dWWHrhtBsFPVZF0xjjCy8nVnAz07yYCUJIv3z9IE3wPQjo4G+s62iKkknXb
	EXFh/rMeNCM6VDb5/Gao982Y5ihSDKBOQMDFXRCVdlXkxW6rSUPzmd+FwRjAVMHrXfdL897wAit
	dMDwbwIZ7S4rg6bNRIFXSt2RPHYqaCDYpGBU0Ye0aqahQPKQEb3ctRdrPoJKFOBDBqfMBgBvIto
	A7HTVARFBg4CAVVMSLU2QdSDnGGLjOiWDWP/iNigOwBWCJVs/zcmYVb01s1P7+tzLf4DWiS4BEb
	elAw6B4bJIz8O8DJ1T11ZsPJOlWAy+9I=
X-Google-Smtp-Source: AGHT+IF8WeH/oU2owgkUTiVQJ1UjH7XhvycJlh2P4qsYEEoxnO+VLtTmDk7n5fyagJVi0TbZzJM7jA==
X-Received: by 2002:a05:600c:4588:b0:458:f70d:ebdd with SMTP id 5b1f17b1804b1-459f4f9b74cmr107921215e9.16.1754904765407;
        Mon, 11 Aug 2025 02:32:45 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c45346asm39904799f8f.39.2025.08.11.02.32.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 02:32:44 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Mon, 11 Aug 2025 10:32:10 +0100
Subject: [PATCH 5/6] coresight: Add format attribute for setting the
 timestamp interval
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250811-james-cs-syncfreq-v1-5-b001cd6e3404@linaro.org>
References: <20250811-james-cs-syncfreq-v1-0-b001cd6e3404@linaro.org>
In-Reply-To: <20250811-james-cs-syncfreq-v1-0-b001cd6e3404@linaro.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jonathan Corbet <corbet@lwn.net>, Leo Yan <leo.yan@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_023247_036124_39F1063E 
X-CRM114-Status: GOOD (  21.19  )
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

Timestamps are currently emitted at the maximum rate possible, which is
much too frequent for most use cases. Add an attribute to be able to set
the interval. Granular control is not required, so save space in the
config by interpreting it as 2 ^ ts_interval. And then 4 bits (0 - 15) is
enough to set the interval to be larger than the existing SYNC timestamp
interval.

No sysfs file is needed for this attribute because counter generated
timestamps are only configured for Perf mode.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/hwtracing/coresight/coresight-etm-perf.c   |  6 +++++-
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 21 ++++++++++++---------
 drivers/hwtracing/coresight/coresight-etm4x.h      |  6 ++++++
 3 files changed, 23 insertions(+), 10 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
index f677c08233ba..c28ed6e63550 100644
--- a/drivers/hwtracing/coresight/coresight-etm-perf.c
+++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
@@ -12,6 +12,7 @@
 #include <linux/list.h>
 #include <linux/mm.h>
 #include <linux/init.h>
+#include <linux/perf/arm_pmu.h>
 #include <linux/perf_event.h>
 #include <linux/percpu-defs.h>
 #include <linux/slab.h>
@@ -21,6 +22,7 @@
 
 #include "coresight-config.h"
 #include "coresight-etm-perf.h"
+#include "coresight-etm4x.h"
 #include "coresight-priv.h"
 #include "coresight-syscfg.h"
 #include "coresight-trace-id.h"
@@ -69,7 +71,8 @@ PMU_FORMAT_ATTR(sinkid,		"config2:0-31");
 /* config ID - set if a system configuration is selected */
 PMU_FORMAT_ATTR(configid,	"config2:32-63");
 PMU_FORMAT_ATTR(cc_threshold,	"config3:0-11");
-
+/* Interval = (2 ^ ts_level) */
+GEN_PMU_FORMAT_ATTR(ts_level);
 
 /*
  * contextid always traces the "PID".  The PID is in CONTEXTIDR_EL1
@@ -103,6 +106,7 @@ static struct attribute *etm_config_formats_attr[] = {
 	&format_attr_configid.attr,
 	&format_attr_branch_broadcast.attr,
 	&format_attr_cc_threshold.attr,
+	&format_attr_ts_level.attr,
 	NULL,
 };
 
diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index 1a2d02bdcb88..42277c201d4f 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -28,6 +28,7 @@
 #include <linux/amba/bus.h>
 #include <linux/seq_file.h>
 #include <linux/uaccess.h>
+#include <linux/perf/arm_pmu.h>
 #include <linux/perf_event.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
@@ -615,7 +616,7 @@ static void etm4_enable_hw_smp_call(void *info)
  *  +--------------+
  *         |
  *  +------v-------+
- *  | Counter x    |   (reload to 1 on underflow)
+ *  | Counter x    |   (reload to 2 ^ ts_level on underflow)
  *  +--------------+
  *         |
  *  +------v--------------+
@@ -626,11 +627,17 @@ static void etm4_enable_hw_smp_call(void *info)
  *  | Timestamp Generator  |  (timestamp on resource y)
  *  +----------------------+
  */
-static int etm4_config_timestamp_event(struct etmv4_drvdata *drvdata)
+static int etm4_config_timestamp_event(struct etmv4_drvdata *drvdata,
+				       struct perf_event_attr *attr)
 {
 	int ctridx;
 	int rselector;
 	struct etmv4_config *config = &drvdata->config;
+	u8 ts_level = ATTR_CFG_GET_FLD(attr, ts_level);
+
+	/* Disable when ts_level == MAX */
+	if (ts_level == FIELD_GET(ATTR_CFG_FLD_ts_level_MASK, UINT_MAX))
+		return 0;
 
 	/* No point in trying if we don't have at least one counter */
 	if (!drvdata->nr_cntr)
@@ -666,12 +673,8 @@ static int etm4_config_timestamp_event(struct etmv4_drvdata *drvdata)
 		return -ENOSPC;
 	}
 
-	/*
-	 * Initialise original and reload counter value to the smallest
-	 * possible value in order to get as much precision as we can.
-	 */
-	config->cntr_val[ctridx] = 1;
-	config->cntrldvr[ctridx] = 1;
+	/* Initialise original and reload counter value. */
+	config->cntr_val[ctridx] = config->cntrldvr[ctridx] = 1 << ts_level;
 
 	/*
 	 * Trace Counter Control Register TRCCNTCTLRn
@@ -761,7 +764,7 @@ static int etm4_parse_event_config(struct coresight_device *csdev,
 		 * order to correlate instructions executed on different CPUs
 		 * (CPU-wide trace scenarios).
 		 */
-		ret = etm4_config_timestamp_event(drvdata);
+		ret = etm4_config_timestamp_event(drvdata, attr);
 
 		/*
 		 * No need to go further if timestamp intervals can't
diff --git a/drivers/hwtracing/coresight/coresight-etm4x.h b/drivers/hwtracing/coresight/coresight-etm4x.h
index aaa6633b2d67..54558de158fa 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x.h
+++ b/drivers/hwtracing/coresight/coresight-etm4x.h
@@ -598,6 +598,12 @@
 #define ETM_CNTR_MAX_VAL		0xFFFF
 #define ETM_TRACEID_MASK		0x3f
 
+#define ATTR_CFG_FLD_ts_level_CFG	config3
+#define ATTR_CFG_FLD_ts_level_LO	12
+#define ATTR_CFG_FLD_ts_level_HI	15
+#define ATTR_CFG_FLD_ts_level_MASK	GENMASK(ATTR_CFG_FLD_ts_level_HI, \
+						ATTR_CFG_FLD_ts_level_LO)
+
 /* ETMv4 programming modes */
 #define ETM_MODE_EXCLUDE		BIT(0)
 #define ETM_MODE_LOAD			BIT(1)

-- 
2.34.1


