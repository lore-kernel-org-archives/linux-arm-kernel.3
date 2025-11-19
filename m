Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB636CF3957
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 16:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1J9cD8iib5vPgkzAOKKPeHwOoJIQqK3mSiazT8xg6Hc=; b=ChyzzFMqRxCjo9sER7fvwFw1a3
	GoJt0fFuLL8d6ljm9DzoDAqoQnLhWJf+rZ45NSi9f4yqjMi3C9FbbZjTbYx7pOkFiMbqkKvc6V2se
	s4MjgXNt1bTs5PAN6vet5JJ/u2haZahtodEpg/TDTgCIJJ1lCzZHviyLAnHIf9rVZqjlaQcogQCH7
	ov/aA/CbBCh1vjaPn6wISrUv53XtjXapf4tmntf9HB8h/wX6EBDk3AA/HgSeHfGL0l3cTE3SOcPU4
	cYyoDduLs+kNZ3abDXruZFUe2xtKnYabXjL8HDfd+9j+p4mRRnbGDVc2+CmOoSgv9l+fTBKRDIP4r
	1zGvrmiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLktI-00000003fE6-2TUP;
	Wed, 19 Nov 2025 16:18:44 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLkt6-00000003f1t-2Lzo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 16:18:33 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-477632d45c9so51223255e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Nov 2025 08:18:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763569110; x=1764173910; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1J9cD8iib5vPgkzAOKKPeHwOoJIQqK3mSiazT8xg6Hc=;
        b=J3I21UTVnCDYl8lfHE4BbSd8yeaHHkEjtkYcen4ZThFddmlhwckhupK02HWdQG2ZUJ
         UxDozE4JsgO0XlzR/Mn44U9jFRn0HPMW7eMLTbF4gpIEKq4s76T3yRNBDONNfNhndOiV
         NsatPWHT0ivZ0853U35Joo0R1HRNViYooKIlgm6KNpcPNL0SdihE4ukZoigEV74+DbWF
         1uITNYKw9hqY7pasTN1BYrGIcdSLKrAu/M11KxGgTqgmyI1Hxe9B00mley1CdqVe5Q6S
         kT4Y56GS2Ad0UgFT3aP6Sf5456RbzinACGleOJlGQjNsfFLebMlTq7/YhdHmhpZyGTh4
         cUyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763569110; x=1764173910;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1J9cD8iib5vPgkzAOKKPeHwOoJIQqK3mSiazT8xg6Hc=;
        b=ro0Psi5XhbSRy10NHZ2hhmM1vsjj8rywMjghjd54dCYX4Vxu5q3fye09T4lGqIvTi3
         1wO2mloRvqPEBRPygUCaO+coHWJOT5LsUC6JbGGx7zitcy9Jmk7Rq1XkHqb+Xr5H14mV
         1Ws50y8oRjyCmPpaJ3POpkVXDrLeOv13JWXoCe7H+e3hWIg4NAdV+ZukgU5eZfxd/DJu
         J0gwMvjhBqDBeo4SPjnw50sOKqe3bE/6OokpgWvrfu1D4MezYhgTkMNkyksEWpUNpjXF
         VoGQlW7jNRsSjjSOa2k1klJpGlrQLcshfFnexnuyITlU8ghZn89IZf+8JpxG2i0u4cb5
         CBaQ==
X-Forwarded-Encrypted: i=1; AJvYcCXjlhZ/55qWF6WzFFHXeYKoKEpsd4XgCElOtBv1B7lWWCPumULaW7d67jMv/eSdz1zhCQdUohoos96P+1b+ycaS@lists.infradead.org
X-Gm-Message-State: AOJu0YyMtKCOFlpzd43dm6KOJjR6+E2MQQBXyWnY0g+Bg1eP1kkjd/V1
	xsXH7h1NN04b16cfiFm4jPLZKo0uOYg2riIpOVUKZt1E9Epa8XUFNpt2uSFpneRztsqAd3qbV82
	dztATOT0=
X-Gm-Gg: ASbGncvxuky7o5rk7ELpFOGOaC9rTSRKz/5KjfUTWkeuX/t3fPHyuEKnA3FsKmLYPyZ
	WNx+lpAdNi86QprvnDgNTCXgzQEeQOiIP5rhHMJHZwxWTtriJdugHRJXT8X/6fhQ9ZjWcULhUSA
	8Jegken68yWEW1e2+O3GWFL6ENd0+DyVFQh3J9TV7+mUyFhIFIxU6YnnawRMGmircmAv5xAF/eG
	JaDMEJYlap66JH0rINhhyNrVQJAf/o0eaJzZOBgcYQzEpTrQELV0sqIBdPxwLgMqnBCl9oSgN+Q
	MqxXfZ94YeP/NUh0MnPGIClGReNigqaojhG8NFNPMYS8nJgZC/kJWGu41LAGrTK1Fv9ENWF8iYV
	nNUpAL7JT51XjQDRI2Q8CqaT8vP6BbxSrGtpkRZDhi3ol0xupl1UkGb93RXAYqfhHYw5ojxZaCa
	ekNAeJ3RCmeai2RyifRRXX
X-Google-Smtp-Source: AGHT+IHM6yKtwK40W5LgZNymtrK6A18IlWWcGf9RLGOtTtAdPxJ7lod3/117k5kVxzXBlztAnW+0mQ==
X-Received: by 2002:a05:600c:1f10:b0:477:8b77:155e with SMTP id 5b1f17b1804b1-4778fe4a046mr196974135e9.15.1763569110327;
        Wed, 19 Nov 2025 08:18:30 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477b10142d3sm63205425e9.5.2025.11.19.08.18.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 08:18:30 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Wed, 19 Nov 2025 16:18:08 +0000
Subject: [PATCH v6 12/13] coresight: Allow setting the timestamp interval
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251119-james-cs-syncfreq-v6-12-740d24a29e51@linaro.org>
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
X-CRM114-CacheID: sfid-20251119_081832_637236_D78C06FE 
X-CRM114-Status: GOOD (  19.69  )
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
index cfd6d2b7bc50..a91981a651e7 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -651,7 +651,7 @@ static void etm4_enable_sysfs_smp_call(void *info)
  *  +--------------+
  *         |
  *  +------v-------+
- *  | Counter x    |   (reload to 1 on underflow)
+ *  | Counter x    |   (reload to 2 ^ timestamp on underflow)
  *  +--------------+
  *         |
  *  +------v--------------+
@@ -662,11 +662,25 @@ static void etm4_enable_sysfs_smp_call(void *info)
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
@@ -704,12 +718,8 @@ static int etm4_config_timestamp_event(struct etmv4_drvdata *drvdata)
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
@@ -799,7 +809,7 @@ static int etm4_parse_event_config(struct coresight_device *csdev,
 		 * order to correlate instructions executed on different CPUs
 		 * (CPU-wide trace scenarios).
 		 */
-		ret = etm4_config_timestamp_event(drvdata);
+		ret = etm4_config_timestamp_event(drvdata, attr);
 
 		/*
 		 * No need to go further if timestamp intervals can't

-- 
2.34.1


