Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA0D7D1039D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 10:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/aL0yo6fi2WmbAku9VkxCsuHLTyCNr7C/0ei4wqWf00=; b=2wk0XmyhdK/GJz1BBLrL/BF1cJ
	2wKA3wAl1g4wm6tPsRyqkbp83l+cShIwb8YjXGJRKSmByEyJg7k3PU9ARQ97a76GuzROi6HD76U8o
	59W7NKpjnX5hCto1KsGxR4h+zDv+7Vmb3sTktFt9CalZfFGiK8Hdu77lalGLa6+V07grL1ADV/iuA
	whi1u0Nje1iD6cG7fK1hIX2ksrJsZW4ci/Eeuu+znfrZMRJAPNLM1MbBvgu/Xq2UAmxA5W8Zc4wqR
	EytF2lPb/JigIcyGYFxKPJHqTR1tuVjaIlxhdut1x295GLwUjKnZHH7OxacS8jay9f8ISmIE7iNa+
	qaUBlMGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vODE2-0000000ErJJ-1SeV;
	Wed, 26 Nov 2025 10:58:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vODDl-0000000Er5g-1ztA
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 26 Nov 2025 10:58:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=/aL0yo6fi2WmbAku9VkxCsuHLTyCNr7C/0ei4wqWf00=; b=S93O3fp4WnOnlv6omaZwd0ru9w
	L9hyhtoAI4Rh+mz4pqx8aBGTL9CT9AB6HQXxhuugp3UMPnM+hHzQfqfSio1BXi+TNlkxL2lYTVj3e
	tZt9Z0Qe2TPlNa+pynB/hu3eRlhyPgS94LLdbB7JRTKtBxoqDrc4sBCThzIhxL7pstYIf6QHun45f
	9WR0hk0tSYE3p10PJ1rwRPHOUxmOT/pz7Gy0Qy8MQsLGvrVAShNXc7EjPkCmb8jAQq1/uEzaP5tFQ
	Q0bohJgjq2v1qHELwAwbPO0li9m6oVGqpxILRf0EXrSdAjj183Oiv2Qhz/dliGzb6sueWvhCdSzq9
	aQ4glpNA==;
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOCM7-00000007lwY-1VlG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 10:02:37 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4775895d69cso27384395e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Nov 2025 02:57:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764154675; x=1764759475; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/aL0yo6fi2WmbAku9VkxCsuHLTyCNr7C/0ei4wqWf00=;
        b=wISSyOQOGs07Sz9BHpMJIERsEQd6qPCdg2MQ2dO+RZaAv4B1SMRcUP6htoXTV8p6Q+
         031DvFy/TfEqRMV0mC9NR1/fCBsDrVL+AG5ri8/+h/Iu/v6G54Czh0X7khxVRmxPpOO2
         PYHSu7rKd0rziWQvo5kN4+8VR/tk867SRzgeGearhfwSttW+rL4WjOv2YA/YRi+UYjyT
         IgREPNxvJcFsz9GmCFKGb5cOagcceZA7o8E2S+o+usTcFGNihAj1jB1jXrf51gJ0YNo5
         YzJ2r76Ly4HtJNKeQX7F0Yazkb7YeH0WCNBXz2en213XF9ut//jDmGIjnsCPMxowMyBk
         dSlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764154675; x=1764759475;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/aL0yo6fi2WmbAku9VkxCsuHLTyCNr7C/0ei4wqWf00=;
        b=e3CXc7ZPM56+J0HJeKGJS/GqwZknWhjCQ4j/Fdv6rUjYV4OnYHVeCyES6VxveIdeX+
         2xpnVqixIm9R6vUM6y3IzMUFbHwCkSR3n9eTkhSENqO1d26+MBdT7QhOCm1KC8DxyvJx
         UVjHUz6E43mKkUVva07CDtE0bu9a0118mZw+Y1y+90B8zsBg4amlOS1DgJa3weMoDRtt
         4EuT/RY//aeiRGfDzz7jg4rla7P+U/KJ2NRT9lzLLoxKAEMxF4dooE8No5FfPDARLXCC
         0j/FvRjrR/Dv2p2n+ocauQeVM2m63ZzObk9BGurvvTAgDdP6pOKZ2Z7PKPJ9NBktILkh
         JBpw==
X-Forwarded-Encrypted: i=1; AJvYcCWCbrj0/EG7Pj7M6p6p8OO8j7INf3G4hbyCylspSgRngQU73AlU1mwDeAjoVPQJ6qa2KBoVujzG2TdtyDjPbqvT@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7wr902v9nB7f8FfgxBJ2wzjkmVieo04eQzEPh8A6n04ReC/Oj
	Rmd4fMeWTbJo7wLysox6Za1OUs/NYGCXNXln9sZoNSSIV7ZAwo8kopeVEin5Zs3FqEM=
X-Gm-Gg: ASbGncuJnHCMdLUTgKIJhoIiCOkTCb9gAJcIETM9DEGVmCGeo6qUrjoZ4f8KJ9mISrP
	SItq/+t3nJa4gKK6BrHEpXUERDrgZFH7S4aRuLS+qlkXAlKsr7xQDSFwSfn3NrK0C10HwEK8kSk
	PB5uuTsTkQkGxTSu4I97nS/h4dm167DalMySu3is7FWJE9DLKN82gxr4b26oAeG0Fod0bD8ESsO
	LCLkpJpLZi/NBqWkmodVG1rdw/TYa8wh7/diDm+ZGpZxFsAcoZGMkDwV43u8uFS3/fFVkRR70PH
	5P3iiYgjHrkKaAE4fvZIwQyeLoB+XxbDeP8B/BwCydYOZKQTs1+cQZ+bYtaYjMQAKsk/ecaHnKJ
	0nKpHKkxh7K82QZ7x8ZOiETOooiZmOCC0YEC6+9fRFfQGbYXJF5N0ib6gAHbWZCpHVbGqzsTyKQ
	PkooPDjFeNt8HVYL1i+qqU
X-Google-Smtp-Source: AGHT+IGviTrM1sSe4rL++DrBqXnogXlxDeacPexepOhL2fMVFW83P2kdlvQXu27F0Wvm9C0S2kRhBA==
X-Received: by 2002:a05:600c:3b11:b0:477:8ba7:fe17 with SMTP id 5b1f17b1804b1-47904ac464bmr56208955e9.7.1764154674704;
        Wed, 26 Nov 2025 02:57:54 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4790ade13ddsm36991765e9.8.2025.11.26.02.57.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 02:57:54 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Wed, 26 Nov 2025 10:54:41 +0000
Subject: [PATCH v7 12/13] coresight: Allow setting the timestamp interval
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251126-james-cs-syncfreq-v7-12-7fae5e0e5e16@linaro.org>
References: <20251126-james-cs-syncfreq-v7-0-7fae5e0e5e16@linaro.org>
In-Reply-To: <20251126-james-cs-syncfreq-v7-0-7fae5e0e5e16@linaro.org>
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
X-CRM114-CacheID: sfid-20251126_100235_708990_0E56D99C 
X-CRM114-Status: GOOD (  18.96  )
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
index c7bf73c8f2d7..0129b0502726 100644
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


