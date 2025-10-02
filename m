Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6990CAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Oct 2025 10:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+nwhvpaffB2pXp/ljo/Ru9JZ/V74Q4XqKzNaVtDeMyw=; b=bJ+y5XYITefusijYoHscYk6Dfh
	DQBqZ9ksx+7CyOgyz9QpJZXkBoTw+5cGhoKL367r1Z4ELOaQVRk+xXD/cSPAX9aihraY/itydfR9U
	bMPeY12Ot6FAEiJD5+HLEczT7kWNVxi3kjdl6ZKkWgYnnze93TlgqPEasuuIKthTteW/N547tvNrp
	6yzu4X0Jp8ft42fOVeYjhiOuaG3KVZ+67Fwu44xeRmUaAF9163Qd+vF187IhddYqwNnbnfBmVtLNU
	4yQtMAT/mambNJY2gFdB/RlLwOMXLrTrujms0pTJNm90yf6ewoz6XxyWzeakYYsR7eoxTVdm28u2D
	WXaE7nlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4GGB-0000000ACso-3a2Z;
	Thu, 02 Oct 2025 10:10:03 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4GG9-0000000ACoi-1jSI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Oct 2025 10:10:02 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-46e6a689bd0so4893415e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Oct 2025 03:10:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759399799; x=1760004599; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+nwhvpaffB2pXp/ljo/Ru9JZ/V74Q4XqKzNaVtDeMyw=;
        b=y9k3IMPF3yfXtd7JMySH3StSxYlP6LsSAJrQET/Vio8KQRn8GYlCQQNPi2DFdhwwdK
         P7adsJCFev+w85mD5pg1v1VkuIJjZU7Myvbtg5cjqH1Q3Wt4ZQmW9W1rwK+dmVWWpast
         DGTUbqO81DlD7wzH4Cr9uBRF9oItEzs66i0r95aXKVAhkRC/uaKhXWZa2gTHM/r0DffQ
         LGvX18bQfLYLGPMLIMN7+mFw8A7Huk4S4xtujl2Ta2+9vH8EamSEo7IAkKT1m0Q+eIa3
         s9RTxtEbEyg10ktfbwo2PJ/DcYj9ufa1yo90DdPqSBCSe6WxYn3yQJW06rcM7I4EPrGi
         07Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759399799; x=1760004599;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+nwhvpaffB2pXp/ljo/Ru9JZ/V74Q4XqKzNaVtDeMyw=;
        b=IOC4tgfg89KyWX7Rk8BIZgLZmjLIvbW5kgmC6/5LSTv92R4aWv5NyKEu95JTjHE6mz
         QSIs5S5e0zUp8a4mASQRWLPQpBwoquMmNR7h+ql7HrxCuW3vMk4DV3fQVTR/uX4px2eu
         vxZ6FPIgpjgGnRP2zzsKCBaK5J/wSmnWC1qVq0tv1rdmFc6UVm/qW3zppVKQDDt8qkSm
         RNQXYn9fwAvfjSq0FzgxtUBrB1VtuCrMZE+l0QkWOnKhz4e3oioLJZEvCpLyjkAdJ3gn
         mz/a/Sgub542D8LuPpUpXthtdjL/Kdq+YqwnWdsMRa2dNtwXYz+FhHNfaq51PT8wSJWn
         E2Cw==
X-Forwarded-Encrypted: i=1; AJvYcCUMlZhQZCerAPBwDr1adDh8jhqMF2PZKMGlUxJaAXjwPM4/yCSL0T2hy9y53qRMmB1gsb6sXS72D1FuJAIIGkX4@lists.infradead.org
X-Gm-Message-State: AOJu0YwvIEwax5qKZFCnPvtHPMamvKNPL6RAch/QqgyS9mVZoEIqAn1s
	5MUfPLF0Vx0QeQ1/CRuMSMP2ss3oMTw8XKyjyphUpZu6NpOAkhQGNU4f0cbhji7KFRo=
X-Gm-Gg: ASbGncsm4KGAoAw50tH0kZwFWhwxdlMmZR5kCJe4WKE8ETz3+MpxOJiJ6DpCmJO6MiB
	xws1t6C3rnAejPu4l5Vylnv/TTxWKt7+kOyKmFPU2kDdea+olN1Uf1ppwvn0x7lIXkTViCKaADO
	hI1caGr06rjH2prvfWSsLauRStOsJJirqu8IM+vjfbcBAcrtDoaS07/+Dq4qzNm0MNBsx8zOBFa
	jTRxD9wIDro4N25h96zwl7yJhNztWOsKsTY+tJBvJbdc1pyaLO/36dJwK+VtVbyTP1Jmy/b/60C
	ehGdlLIs2NYTxIwIEWiODHfzdIJnMWik6T0OiFHYYi8foORfQsLCPbtteYOSUEogtttHV5Y8xBF
	RHmujFiqvqF84cIKq/MOH5lkOMP1SZLfmqLiiePtOLcquSX7B1J+P2E/RFe68
X-Google-Smtp-Source: AGHT+IHr08HxjkRp93BXV80HRH/1LL0M5XuhCuT5Z8qI/nr9hlsv++b8qZOSGz24catkR5X862GWCA==
X-Received: by 2002:a05:600c:a08e:b0:45b:7d77:b592 with SMTP id 5b1f17b1804b1-46e6127b7a9mr57468195e9.12.1759399799467;
        Thu, 02 Oct 2025 03:09:59 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4255d8ab960sm3017289f8f.13.2025.10.02.03.09.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 03:09:58 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Thu, 02 Oct 2025 11:09:32 +0100
Subject: [PATCH v3 4/5] coresight: Add format attribute for setting the
 timestamp interval
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251002-james-cs-syncfreq-v3-4-fe5df2bf91d1@linaro.org>
References: <20251002-james-cs-syncfreq-v3-0-fe5df2bf91d1@linaro.org>
In-Reply-To: <20251002-james-cs-syncfreq-v3-0-fe5df2bf91d1@linaro.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jonathan Corbet <corbet@lwn.net>, Leo Yan <leo.yan@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251002_031001_507216_7744E509 
X-CRM114-Status: GOOD (  23.35  )
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

Only show this attribute for ETM4x because timestamps aren't configured
in the same way for ETM3x. The attribute is only ever read in
coresight-etm4x-core.c.

Reviewed-by: Leo Yan <leo.yan@arm.com>
Tested-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/hwtracing/coresight/coresight-etm-perf.c   | 16 +++++++++++++++-
 drivers/hwtracing/coresight/coresight-etm-perf.h   |  7 +++++++
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 21 ++++++++++++---------
 3 files changed, 34 insertions(+), 10 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
index f677c08233ba..0c1b990fc56e 100644
--- a/drivers/hwtracing/coresight/coresight-etm-perf.c
+++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
@@ -13,6 +13,7 @@
 #include <linux/mm.h>
 #include <linux/init.h>
 #include <linux/perf_event.h>
+#include <linux/perf/arm_pmu.h>
 #include <linux/percpu-defs.h>
 #include <linux/slab.h>
 #include <linux/stringhash.h>
@@ -69,7 +70,8 @@ PMU_FORMAT_ATTR(sinkid,		"config2:0-31");
 /* config ID - set if a system configuration is selected */
 PMU_FORMAT_ATTR(configid,	"config2:32-63");
 PMU_FORMAT_ATTR(cc_threshold,	"config3:0-11");
-
+/* Interval = (2 ^ ts_level) */
+GEN_PMU_FORMAT_ATTR(ts_level);
 
 /*
  * contextid always traces the "PID".  The PID is in CONTEXTIDR_EL1
@@ -103,11 +105,23 @@ static struct attribute *etm_config_formats_attr[] = {
 	&format_attr_configid.attr,
 	&format_attr_branch_broadcast.attr,
 	&format_attr_cc_threshold.attr,
+	&format_attr_ts_level.attr,
 	NULL,
 };
 
+static umode_t etm_format_attr_is_visible(struct kobject *kobj,
+					  struct attribute *attr, int unused)
+{
+	if (attr == &format_attr_ts_level.attr &&
+	    !IS_ENABLED(CONFIG_CORESIGHT_SOURCE_ETM4X))
+		return 0;
+
+	return attr->mode;
+}
+
 static const struct attribute_group etm_pmu_format_group = {
 	.name   = "format",
+	.is_visible = etm_format_attr_is_visible,
 	.attrs  = etm_config_formats_attr,
 };
 
diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.h b/drivers/hwtracing/coresight/coresight-etm-perf.h
index 5febbcdb8696..d2664ffb33e5 100644
--- a/drivers/hwtracing/coresight/coresight-etm-perf.h
+++ b/drivers/hwtracing/coresight/coresight-etm-perf.h
@@ -7,6 +7,7 @@
 #ifndef _CORESIGHT_ETM_PERF_H
 #define _CORESIGHT_ETM_PERF_H
 
+#include <linux/bits.h>
 #include <linux/percpu-defs.h>
 #include "coresight-priv.h"
 
@@ -20,6 +21,12 @@ struct cscfg_config_desc;
  */
 #define ETM_ADDR_CMP_MAX	8
 
+#define ATTR_CFG_FLD_ts_level_CFG	config3
+#define ATTR_CFG_FLD_ts_level_LO	12
+#define ATTR_CFG_FLD_ts_level_HI	15
+#define ATTR_CFG_FLD_ts_level_MASK	GENMASK(ATTR_CFG_FLD_ts_level_HI, \
+						ATTR_CFG_FLD_ts_level_LO)
+
 /**
  * struct etm_filter - single instruction range or start/stop configuration.
  * @start_addr:	The address to start tracing on.
diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index 920d092ef862..034844f52bb2 100644
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
@@ -616,7 +617,7 @@ static void etm4_enable_hw_smp_call(void *info)
  *  +--------------+
  *         |
  *  +------v-------+
- *  | Counter x    |   (reload to 1 on underflow)
+ *  | Counter x    |   (reload to 2 ^ ts_level on underflow)
  *  +--------------+
  *         |
  *  +------v--------------+
@@ -627,11 +628,17 @@ static void etm4_enable_hw_smp_call(void *info)
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
@@ -667,12 +674,8 @@ static int etm4_config_timestamp_event(struct etmv4_drvdata *drvdata)
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
@@ -762,7 +765,7 @@ static int etm4_parse_event_config(struct coresight_device *csdev,
 		 * order to correlate instructions executed on different CPUs
 		 * (CPU-wide trace scenarios).
 		 */
-		ret = etm4_config_timestamp_event(drvdata);
+		ret = etm4_config_timestamp_event(drvdata, attr);
 
 		/*
 		 * No need to go further if timestamp intervals can't

-- 
2.34.1


