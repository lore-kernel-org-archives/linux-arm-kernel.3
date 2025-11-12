Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12806CD13DA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 15:22:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KsbUilQ/qm8vmmBkUOmxmlvBhtXtwp/NWlCF2+8uaAM=; b=4RKbsIVDuVCewmMIBwxrwEDHdV
	dZnuPAxLGGjPJ+xBNjL/JbwfgwBE4CRu/2rjLRg7JmtpXg/jjnBEsZh5k4kFfkmnUlQkG5wV0gCFe
	OcDEz6YixP9KerkiF+ZXZpviiS9BMNX4z9A0MOabwiFlLBPhPBApnS5LoDmSebJQkf3/OLUgliYEm
	bc0zpC2xbeR5PppNxejqeQ2/l/16i2TMW+8e8iv4vF1rwDQhlMhgMtUAXuZqj7iyf428gOgTLMF3O
	g16JBwHIMPuS05YM8vdfPauOw1GP0X0FpaY5/04D0u8NexdgR4MrTAyK28BnHGZD76ott5aJIsCE3
	A9gs7/4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJCgK-000000092UM-1VFC;
	Wed, 12 Nov 2025 15:22:48 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJCgD-000000092ML-1g9g
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 15:22:43 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4710a1f9e4cso7327435e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Nov 2025 07:22:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762960960; x=1763565760; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KsbUilQ/qm8vmmBkUOmxmlvBhtXtwp/NWlCF2+8uaAM=;
        b=ijEOcDB481JMhALqAOvy1xxPLGBwzrzb+0YUGp2nBsZ6kiG07lBjz/xhMNF+R5lQcw
         umEuuVh5g2Iw7b+bXWrhj6CQJqjaq4h+dKXIKXeyajGrdB8NSdmkxu4uHkzrV5kb2XOj
         IQmch5P/gHxI0zi9iFPr61VlETeQoZQvQ9/lPHNixE46wfuBcZ2OMkfEgCdnm5nNaDLh
         L+asvf8p3z59u1o6QI8tMxaYVcGe+SY6XHdEV5ypvGCAuECy6Exn2xzVUC/imZ5FzYx0
         j+lHKv2n/j4eqxoDJQt19w8KophU/LvF/ky1sJxGLetEp9/v8Ohy2m11bwq+IRdPCDWK
         uNvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762960960; x=1763565760;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KsbUilQ/qm8vmmBkUOmxmlvBhtXtwp/NWlCF2+8uaAM=;
        b=IaiNmO2xsSeisv2l/jL5dF+kzUc0faEDCdwZF41uFxrOHmu1na26RkPNQbchsq8lQF
         RVisgaiYrp8eAPLkTnEzOgOxTMxa+1xyLIDBkEK/lGfWmWProT00CtmzPcIBr33AHzSe
         JAAh68uj0F+X98BqSzwrtpi3pKdxNLYL/If+NmfgMY4EGhUSt35Bb+GPRylkbrDGTwOJ
         odtpmRrqicHDyzebRqqEaKNwxMgFfZU0qgE+orqpzwNnRnFWBPuYNp66f6+63UCTCQCc
         L15ccltCj64luZfv0MwPPvN0OkDUUd0GbIHTMPAUDVaVstt2esdaSHE+m9h4bBJPjjvC
         VHMQ==
X-Forwarded-Encrypted: i=1; AJvYcCUaWGMYUBzZK/KrWrjZ9GJYk50tiKWoT81dGLJznk4P7tjZs0l591tvMjZsBZToPv1UTo2krRy85Q3vChrssUga@lists.infradead.org
X-Gm-Message-State: AOJu0YwK/VRJIfQkXpGw7ZJvG9ElWtQR7eXvroBmt7eeqsdVSrjnduKe
	eGw1SCk5f3dJaM0Gn05U3b5J1lVk8j2CyeIB7vLicuTHi3gUdXHykm5iJaB38dnZHKk=
X-Gm-Gg: ASbGncs08jgHG0jUIpotNHdkONNLVGdl7MhaRnZC8isuaogdWiqc/dgH5pSAi4pasTc
	96blYFOaPJZdLQDj28eXwknkIQKwT0xrJ3AistlgsuqzLsE0wilsKkT+L2vP5kHO23M8U2ni20K
	UmYTSnAx1ueHQvwiwJ1tYNBBPRfzH1j9e6ST1ZoMK5mrQNpsCCeexWjsi3vGjlLkRU+6j8dS6xP
	KG9g/RVzdI2gY2p4wA3xlAqhGVLon0YvaSvjOwixzBid004pqgVjM4hdjY/LmKqkWSYFAwmYQlL
	KhzfCQqMPyAu55zljJPVXrfUWxeGGpQjq50PzYYATLDddEsrQBs8kEuRVD/XCBGDsCYfBZmdnqb
	/oylvBddhegqIo6pXVL3b4QlF9IvQJ0aEMsA1lQWMD1YyZmKhqYpiSPpV4xU1tCwFeGJfp3W4eN
	OOCFecIR5ffA==
X-Google-Smtp-Source: AGHT+IG9+YPot+b+QaDWCuQamvFnTs1arej/50qBF58IBiHamnww69TGhn7gm30P7ZLTOf4+6BWvrg==
X-Received: by 2002:a05:6000:2505:b0:42b:2c54:d9ba with SMTP id ffacd0b85a97d-42b4bb7ce86mr3285791f8f.20.1762960959666;
        Wed, 12 Nov 2025 07:22:39 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42ac677ab75sm33573485f8f.35.2025.11.12.07.22.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 07:22:39 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Wed, 12 Nov 2025 15:22:18 +0000
Subject: [PATCH v4 12/13] coresight: Allow setting the timestamp interval
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251112-james-cs-syncfreq-v4-12-165ba21401dc@linaro.org>
References: <20251112-james-cs-syncfreq-v4-0-165ba21401dc@linaro.org>
In-Reply-To: <20251112-james-cs-syncfreq-v4-0-165ba21401dc@linaro.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jonathan Corbet <corbet@lwn.net>, Leo Yan <leo.yan@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_072241_474197_3DE0A7FB 
X-CRM114-Status: GOOD (  19.14  )
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
much too frequent for most use cases. Set the interval using the value
from the timestamp field. Granular control is not required, so save
space in the config by interpreting it as 2 ^ timestamp. And then 4
bits (0 - 15) is enough to set the interval to be larger than the
existing SYNC timestamp interval.

No sysfs mode support is needed for this attribute because counter
generated timestamps are only configured for Perf mode.

Reviewed-by: Leo Yan <leo.yan@arm.com>
Tested-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/hwtracing/coresight/coresight-etm-perf.h   |  1 +
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 28 +++++++++++++++-------
 2 files changed, 20 insertions(+), 9 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.h b/drivers/hwtracing/coresight/coresight-etm-perf.h
index 24d929428633..128f80bb1443 100644
--- a/drivers/hwtracing/coresight/coresight-etm-perf.h
+++ b/drivers/hwtracing/coresight/coresight-etm-perf.h
@@ -7,6 +7,7 @@
 #ifndef _CORESIGHT_ETM_PERF_H
 #define _CORESIGHT_ETM_PERF_H
 
+#include <linux/bits.h>
 #include <linux/percpu-defs.h>
 #include "coresight-priv.h"
 
diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index d4e294cd48ae..cb6f08510dc0 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -660,7 +660,7 @@ static void etm4_enable_sysfs_smp_call(void *info)
  *  +--------------+
  *         |
  *  +------v-------+
- *  | Counter x    |   (reload to 1 on underflow)
+ *  | Counter x    |   (reload to 2 ^ timestamp on underflow)
  *  +--------------+
  *         |
  *  +------v--------------+
@@ -671,11 +671,25 @@ static void etm4_enable_sysfs_smp_call(void *info)
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
+	struct perf_event_attr max_timestamp = {
+		.ATTR_CFG_FLD_timestamp_CFG = U64_MAX,
+	};
+
+	/* timestamp may be 0 if deprecated_timestamp is used, so make min 1 */
+	u8 ts_level = max(1, ATTR_CFG_GET_FLD(attr, timestamp));
+
+	/*
+	 * Disable counter generated timestamps when timestamp == MAX. Leave
+	 * only SYNC timestamps.
+	 */
+	if (ts_level == ATTR_CFG_GET_FLD(&max_timestamp, timestamp))
+		return 0;
 
 	/* No point in trying if we don't have at least one counter */
 	if (!drvdata->nr_cntr)
@@ -713,12 +727,8 @@ static int etm4_config_timestamp_event(struct etmv4_drvdata *drvdata)
 		return -ENOSPC;
 	}
 
-	/*
-	 * Initialise original and reload counter value to the smallest
-	 * possible value in order to get as much precision as we can.
-	 */
-	config->cntr_val[ctridx] = 1;
-	config->cntrldvr[ctridx] = 1;
+	/* Initialise original and reload counter value. */
+	config->cntr_val[ctridx] = config->cntrldvr[ctridx] = 1 << (ts_level - 1);
 
 	/*
 	 * Trace Counter Control Register TRCCNTCTLRn
@@ -808,7 +818,7 @@ static int etm4_parse_event_config(struct coresight_device *csdev,
 		 * order to correlate instructions executed on different CPUs
 		 * (CPU-wide trace scenarios).
 		 */
-		ret = etm4_config_timestamp_event(drvdata);
+		ret = etm4_config_timestamp_event(drvdata, attr);
 
 		/*
 		 * No need to go further if timestamp intervals can't

-- 
2.34.1


