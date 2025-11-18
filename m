Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EBB4CEE33A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 16:28:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1J9cD8iib5vPgkzAOKKPeHwOoJIQqK3mSiazT8xg6Hc=; b=GN0L+NtDxqs13GimIJT3OEtwF7
	51PjjUHQb4x95mWCZ30eGPevDVH3A6zW2T3P4WNlPPVW1mSHg/EhsYmvgLuG3EiVCJUty6l2LUHh+
	EsXloApSKXJ/1Txm5K56NtfQT3lt2KvXcG+aqJ23sbgo0VY8mlTywRg1Ut3psHfc0OIhVPubCKeML
	NvUhQxCTxFeB5zWDkkQv5ldQ3dnYYYBYDxn7Vpsmy+6X07HA7kFovYMHA4P93qYwO62OqUToqY0bg
	Mp7bQppEWDpRcmAbVph23ZW2nxPOm433Lakut2k3hkJRbl9Q41b5NM89HKPPlZ2ShkRyWOzqnSNpr
	ndA3SB+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLOZS-00000000jpw-2I0G;
	Tue, 18 Nov 2025 16:28:46 +0000
Received: from mail-wm1-f50.google.com ([209.85.128.50])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLOZA-00000000jXt-47yP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 16:28:30 +0000
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4779adb38d3so26953235e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Nov 2025 08:28:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763483306; x=1764088106; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1J9cD8iib5vPgkzAOKKPeHwOoJIQqK3mSiazT8xg6Hc=;
        b=j8ykTlT4bb0xZyxvOgUAvv+VWXaVsgNPUNOWrnS3vdstYSS8O2QYCYu8CfLbwSf7XY
         coa6j8fMSycbtfCAyraUSQwoQX5ESL+JtwfKGjR1Hcz635G8qDVEPXkPg33aKIlVxQ4U
         f/KYUVJhwJJkPiToB8lJ+tQjKlC2vIkbZXMFidtT0gu82VZcXxkLHvaaKLlNirH7EQC0
         wxMbiJp5Od7HtdcEXJPL0tbFjvSSH8SEo3JThgadpA1xfvD0CYxqDfQJzgbiNRkXoYb7
         voEBiay7tbX1MI6czh05tW6U1/SU/VDHfKo3zBk4G/N0gLhdz7WDFq0bPQUCUShTjfgS
         slyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763483306; x=1764088106;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1J9cD8iib5vPgkzAOKKPeHwOoJIQqK3mSiazT8xg6Hc=;
        b=g+pcclukg9MgRDi7Bq1w4c0xRbuqgZ46E2bg6YH+7H56PmtIfvKHkeNAOR1Ls7WzQy
         rP4fE8XtuxWex1MsCJpKcLcV61pzliqU+AcX/Gv9QvQFMXIfveANIwnc+HhBRwKCbFNf
         ySNxt6/VUdfgvWNcNHTWPgieFI3UgToMaHhxg6Yrj4FwMHVpU1t5mrXxz4QKhO6KVuNf
         7F64DZjq0Sk6beWAfaryztYax5oH4B1FdjtzDmQYFDtqatWi8Rix2+sFpCYxqtMV0ynO
         8tLtvznkRWioGftwCPlDbO10meu6Na9AG/dfWXPG0hkQymGjLTNfBDGYaBRF+FMmuJvy
         pR/w==
X-Forwarded-Encrypted: i=1; AJvYcCUUmQfUGNV7nAmYSuSPuAAKd3aXMAVx9KLLk10gO0jIFyzIOr/iMsZXrjtcY9MwkDVUJWzEcn015Ib2GLGUyVZw@lists.infradead.org
X-Gm-Message-State: AOJu0YwvSJCNi8dVNF/CqkANz2+Ib86gpp5pa5U91ZXf7mmsh59Hu3lN
	dH6MJ2JCJHOBvrLZenn0yIYNU7k2hT6tj96nquLs0dUeclVm5BXeEdV0vkffkqg3dXmwuIUpNQc
	8QNEUF1k=
X-Gm-Gg: ASbGnctnGW6UcS31S+6ulIhWHEhwoxS+E+WF59kpDifNzbvGs10tg+mFtnVvWq2nVCS
	q4UnSsfScx7iE+FoPmShwA6lYPzIyXL6TlaT+PovkRmXS05shtrZbiB77o97m9HbfeLxKBqvxn+
	t+kYzsX4uqr5Cf1nrdqg6akAfsovugGIOdp87KAf0SWyFvGfX93SI5XCHrn9A069NpfkfPfC4Qr
	XZiDEF+knlJQxs8mqDB+hdvGbdR1Pij+hM5++Epe6qWPc7ypxpUC/T6Y+PM7jQg0pRvJQohxiLe
	qvw+XqcR1twvQoeDJJHlmZ7rau0bPFx1E1LyL1ot5p/kEAF17NGPjuSZGSFkfycGL9fPkhznNCm
	Lj2LxH6pnTYvbvt+UI7nA1BOIySSdrnO9AeXiJZiCSZMAb2afjzMCnxrCf/779bFswzZlYjMh1i
	PPCC2BlHy6pzFZZbElenUgYRSWo/Pahf0=
X-Google-Smtp-Source: AGHT+IEIHAY0ieYvrIgM/ktEZhU04EJXyQVK6L5dD7sCe4rwbzMBqRPJwRy/+JJXUFQoMVJ2eeuntA==
X-Received: by 2002:a05:600c:3b19:b0:46e:4246:c90d with SMTP id 5b1f17b1804b1-4778fe68378mr157000715e9.11.1763483306313;
        Tue, 18 Nov 2025 08:28:26 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477a9dea7fcsm20369125e9.8.2025.11.18.08.28.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 08:28:25 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Tue, 18 Nov 2025 16:28:02 +0000
Subject: [PATCH v5 12/13] coresight: Allow setting the timestamp interval
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251118-james-cs-syncfreq-v5-12-82efd7b1a751@linaro.org>
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
X-CRM114-CacheID: sfid-20251118_082829_081144_15F936E4 
X-CRM114-Status: GOOD (  19.21  )
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


