Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BB87CA0EE6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Aug 2025 15:37:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DqVfHeCT5TjsbIyweENQ6jJYwaBKt/ltAWn8RP0BaME=; b=F9p++gLX+jshc8eNSq6YoHBF+1
	lKX1GrjW9EkHT7jtjbX6v+y+YwlRO0oYoL0+d67jbrwwW+9g8al0tc+8lB/N50fSazb7fbUDb0i3+
	ujDj7fxTc/+8WHyCMe57uHcfRNJsBi1fac0UkBW56EuNTBI4dXH6Wmi3U1t2INms+L5f9t+mUTiW4
	euSuag06zmYqV10CxCe3QxSusX1HcJMbiRi13+rG65h4JM/evwc/jSOOg3EQj1+n7jEt1hLKKRorz
	VNw9+Vhk9vOZMvEZTfVeRugtOKY9tvd1FfzlY+yo5pj/e2cjL5U1fqFY+ppmr271GLsK0uYOfzSoI
	BlLn2UiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uma0d-0000000HT9q-0OQc;
	Thu, 14 Aug 2025 15:36:55 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umVYM-0000000Gf8J-2zE4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Aug 2025 10:51:27 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-45a1b097037so4383415e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 Aug 2025 03:51:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755168685; x=1755773485; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DqVfHeCT5TjsbIyweENQ6jJYwaBKt/ltAWn8RP0BaME=;
        b=BSV5kzV3mfKjC/6/Smb8m20tq3XO8xKFIfvIhliNSpu0VFRt4HUZZaeiXgN8mpSYzW
         QkM5RwlPDPudlN9AZ1TFQx3/7703GVqO/PRPYrmPQ8+tsBYr/JM2AAnYm4rwgjXodwp5
         QAOIdNCpcVi3q01/mFji5Mly9gcE1c7/wPz8MeSE+EgkjU2c4vgSyPPqrkmtV+dY0CK3
         9Iu201iMJ4LbHZr6PWOKHBJ28HGfkl89WevUSBe7vzfYFQk53gEWf0EJlqFHHP8xeahn
         otI9bVcBt4SxaAb4I/4SVYNYtA7J+Ka0UN/F0IRtwifOvVHLdFakqGcf6YFVmS7ENB2Q
         CYkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755168685; x=1755773485;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DqVfHeCT5TjsbIyweENQ6jJYwaBKt/ltAWn8RP0BaME=;
        b=p/smC6tFp+egiz1kG926lmbSkKFINC6/RQ1BQCFD/MK5ieIlZxxHumQ16LC99inDeV
         3xRjymZydTHPjaKVllyvnqBaukIh9+0nd2no11IFrya7ldmBGoUGFDH8+WT7TsVCf2bA
         LQdqMT5p3HRUoJXAG815l4FzX7Ks83UpwcoBtIefJjDGWdg7mNh9BNl4yXpc1fw5ahNl
         pTbjdSv0oMGc4qtez9f+v9efhdsn8iHW6npy+DbvusWsSP/9qrokAarjL80ZxhlAWojj
         nod2SiGhuW/bLDtosUbkevx/FcN90oUHh/2VJA+u/5U3W3uIGEkveXG2CRW35gQ0KTHj
         17gQ==
X-Forwarded-Encrypted: i=1; AJvYcCX6MFuYCUXaBup06AHWUdvTuXFjk3cvJwRCHzaEEKnfJ8hvnVhk0qX/Pd0vbagZGOWAo2UrRHP8hB1oLLn/Oec5@lists.infradead.org
X-Gm-Message-State: AOJu0YxRbK+KL37V0VqMh1pbbBo4zxBQYxzpd6sR8pllkxAa2MfrhFc3
	bWvp+8obvGMI9IiglWW8ytc3HCKPHvlVQSE49H+M7zAVeCN1VhdZTiZXPcrhD1p/JAs=
X-Gm-Gg: ASbGncsl6lThwAhv+oSroWYxCrCiGeQOxCn6Dok3tfHugKnTwwKAVmNRnl0nri7qm83
	20XZP71NRrz6yXIOnXxX4MP48GFi+LUwP89Y8296R7pQ44KXRsfG/o8ADLuaFRn4SyUJfwi1nPK
	U8Zb7yGyDhzD1ZQawQb/ucmE4aZ4IDrS1cFe5leo3gVcm2We+DMIINfIutT3wSYgdlKBSRvsyjb
	b6TrDhx/1tyBcWcXEf69YQO3riPzL9JJaH8jbeMoYsyvNc2l5itJccWUvJqxLVyFMwOoTUitf6V
	TjotgHn1fbCLmvaL0oYTE++VqN3hYowR5Q758Y/h9R3SRf05l9KiPCKap7+mtC6CGidD8+ZWE/r
	hsqRR00kYT6KRu8fyrC7FkyyXpkIHhcXDoS+d+xoQUg==
X-Google-Smtp-Source: AGHT+IHDChGA1M3koaJTPEReHQ1naKvyBQUGZKbVCxvANx+2eQKbWPeXZwN0lTI5x4qlNeP7iC6e4w==
X-Received: by 2002:a05:600c:35ca:b0:459:dc99:51bf with SMTP id 5b1f17b1804b1-45a1b656c57mr17079495e9.25.1755168684997;
        Thu, 14 Aug 2025 03:51:24 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a1b226eecsm14228345e9.1.2025.08.14.03.51.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 03:51:24 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Thu, 14 Aug 2025 11:49:56 +0100
Subject: [PATCH v2 5/6] coresight: Add format attribute for setting the
 timestamp interval
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250814-james-cs-syncfreq-v2-5-c76fcb87696d@linaro.org>
References: <20250814-james-cs-syncfreq-v2-0-c76fcb87696d@linaro.org>
In-Reply-To: <20250814-james-cs-syncfreq-v2-0-c76fcb87696d@linaro.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jonathan Corbet <corbet@lwn.net>, Leo Yan <leo.yan@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_035126_759991_5A080953 
X-CRM114-Status: GOOD (  21.79  )
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

Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/hwtracing/coresight/coresight-etm-perf.c   | 13 ++++++++++++-
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 21 ++++++++++++---------
 drivers/hwtracing/coresight/coresight-etm4x.h      |  6 ++++++
 3 files changed, 30 insertions(+), 10 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
index f677c08233ba..af937bbb933c 100644
--- a/drivers/hwtracing/coresight/coresight-etm-perf.c
+++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
@@ -25,6 +25,11 @@
 #include "coresight-syscfg.h"
 #include "coresight-trace-id.h"
 
+#if IS_ENABLED(CONFIG_CORESIGHT_SOURCE_ETM4X)
+#include <linux/perf/arm_pmu.h>
+#include "coresight-etm4x.h"
+#endif
+
 static struct pmu etm_pmu;
 static bool etm_perf_up;
 
@@ -69,7 +74,10 @@ PMU_FORMAT_ATTR(sinkid,		"config2:0-31");
 /* config ID - set if a system configuration is selected */
 PMU_FORMAT_ATTR(configid,	"config2:32-63");
 PMU_FORMAT_ATTR(cc_threshold,	"config3:0-11");
-
+#if IS_ENABLED(CONFIG_CORESIGHT_SOURCE_ETM4X)
+/* Interval = (2 ^ ts_level) */
+GEN_PMU_FORMAT_ATTR(ts_level);
+#endif
 
 /*
  * contextid always traces the "PID".  The PID is in CONTEXTIDR_EL1
@@ -103,6 +111,9 @@ static struct attribute *etm_config_formats_attr[] = {
 	&format_attr_configid.attr,
 	&format_attr_branch_broadcast.attr,
 	&format_attr_cc_threshold.attr,
+#if IS_ENABLED(CONFIG_CORESIGHT_SOURCE_ETM4X)
+	&format_attr_ts_level.attr,
+#endif
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


