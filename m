Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D23FFD116F3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Nov 2025 11:56:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EF8yFRu7uobTFdxOcMGHqxmlNjOlv3Yom5cRf9iiNv0=; b=SEKPmY4gRdPdQxylmmFR/T1caD
	+ycv5SsWTSgchO/N+mNAOwd6ugx52ocJBtbjbqJbfmJuaMsZ9JlTCTvubd/ix+wa1GK7fYwFd84ly
	fr/AKYDbvuB94llrUCXTqIff7hPxlicHAiTLn+Z78SenPN719A0DVnhd8kcMv2fWeqIBboL7N1wNG
	JD0C9Vxyc93jApW0jLtFT1HjZxh8aVxyFu/yqDZ1OF/RycE0AV4b4aWGXY1UBT6jrwxNUvyYzukB8
	YKu1ftfTGUKLRgMcp/7VJzVHJwxFmpC3wRQ9IiXZWprVpCf2UE5VHQGJsHekSVHalJu71X1qH8WBi
	X5paxpIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOx5C-00000000NuC-1A2l;
	Fri, 28 Nov 2025 11:56:14 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOx50-00000000NlX-1LmG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Nov 2025 11:56:03 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-477a219dbcaso15029715e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Nov 2025 03:56:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764330960; x=1764935760; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EF8yFRu7uobTFdxOcMGHqxmlNjOlv3Yom5cRf9iiNv0=;
        b=YbiQDPkwIvyVXbi35elrrwMMEmDdgvEcwvnWJQG+UFvHZbysjvD9LMEEPzQAh1vYET
         N84ZWDbHqD3XTkzGiIBMTiFHepgDUMUkvyPNih9vrAWiLjy4nGHazXSv/tvoKEK7AC+2
         QjafRucA3O6koQvRHNBLW+ClQpA+jWH/TB/zZe1bAvN4mbL+eurec/XFhVceKmhQpt0o
         F2MgMTCIsxsOGtoA/TYbpxnHMJBDYPvueHiGhWQ8W2+KxF4oV5U7FtoFM4SUP3hYJRnT
         pyMWMtv4wN3KZ2uUq2Ku+kiLxULnsVnW6AICoxwUNNbE6X6p1nljJBjlVSjEDTtAbTok
         CBZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764330960; x=1764935760;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EF8yFRu7uobTFdxOcMGHqxmlNjOlv3Yom5cRf9iiNv0=;
        b=GkS7AlZ+FFhTyM+EQbR+VxwDi9b7Ab23EM7o3tBsnd5rbZF76aZznbNpK15OL957tj
         XK/XkUAec8ebfnm7wFlfYwDr9/yCEhPM0BUakhqHQ5+wUjyRrm7Axm1FvqlEe5vfXMSz
         9Tnme0LsRnntugqpBIyRt+xSIsCAUCQkH9mHKZSC7ccH+OXn84U9MxznZyrHstVcyF9c
         LEum2M6wvdXyvjC9kd1Yfh8YCSpg/AUtMpJ9HmNakMXXRzoj6s9ZD3ayg89fKJmoTZ4j
         5/T1XVHh/+DeecjRMHJgrS0sNyNjIia/qBOFllTipFoRvBzviwnqSa/X/Si7sYbn6WZg
         X8LA==
X-Forwarded-Encrypted: i=1; AJvYcCVsuYwp8Vp/I7PYeHMoZteG5f2A/nxSBPJiyiZezyCcp+DamzjeTlEao/gZUEeHdEHU1kTB0DilKPatOEsetAoD@lists.infradead.org
X-Gm-Message-State: AOJu0YyIdqKIbiEfeE1qaHIZrWqG5Z1fyD4vgDfbQLlYsVeUjHuRViCn
	g3x2oOSql8m/vUtahIhFTD9+AWnqNvBMYFIaQgPq62iir973HNG28KB6P6ImbLNOSGI=
X-Gm-Gg: ASbGncs36jdGSyA4fdeIMZAkg8ceBlnLj0S//8ZVMwlacgJ9Fajh38J8Qae6OIUV2rs
	Z8Eah9+a30fzzmt5SHQmRBeYJYprGYTC1y7X/xYcRGmuPqd0kvIlIRHG+V2bSFZjZvxEpcnU0AB
	RDND10sFhVA3XyT5FV1RXgbNjbNvmAobrsUU2pMsWmnvE2fcRgGpnBM/W7s39juKtlEPb0v3+Xo
	0duV+hxWj3tjsktzdQsm6F8si1lfF4jXvodR+A8eyIyFBlRvurQEkLDPtE9QrgYKU0T8KaDObqn
	AJTy/sLi5pbNkMOWPhU3uONHcUIZ38BkdwpFC/GqzpvwjE7PuRyTSH4hCgVIBueuMWLcl9GKcq3
	jaKxULX6xXfRuQYOxxUoA4f5xi8YkoZvmUx7vLzHEIpOJXbid0R+fN/W9bV0cVCBdlEjEQN5ZLz
	Q2TAelTNO6LAn2cSDu5tbSpvGbAunUgc0=
X-Google-Smtp-Source: AGHT+IF59snexuzfEwmE+hbBC+xfTP3fyiFQFy8xP9a0/ylOS8orxBtcZfG9ugUz3WwI+KQC1momlA==
X-Received: by 2002:a05:600c:4fcb:b0:477:557b:691d with SMTP id 5b1f17b1804b1-477c01eea7fmr244407045e9.25.1764330960440;
        Fri, 28 Nov 2025 03:56:00 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4790adc8bc7sm158974465e9.1.2025.11.28.03.55.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 03:56:00 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Fri, 28 Nov 2025 11:55:23 +0000
Subject: [PATCH v8 11/13] coresight: Prepare to allow setting the timestamp
 interval
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251128-james-cs-syncfreq-v8-11-4d319764cc58@linaro.org>
References: <20251128-james-cs-syncfreq-v8-0-4d319764cc58@linaro.org>
In-Reply-To: <20251128-james-cs-syncfreq-v8-0-4d319764cc58@linaro.org>
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
X-CRM114-CacheID: sfid-20251128_035602_390950_DE4E5C15 
X-CRM114-Status: GOOD (  18.00  )
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
much too frequent for most use cases. In the next commit, the timestamp
field will be widened to take a value, so set the interval using the
value now. Granular control is not required, so save space in the config
by interpreting it as 2 ^ timestamp. And then 4 bits (0 - 15) will be
enough to set the interval to be larger than the existing SYNC timestamp
interval.

No sysfs mode support is needed for this attribute because counter
generated timestamps are only configured for Perf mode.

Reviewed-by: Leo Yan <leo.yan@arm.com>
Tested-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index b457f182efbe..7e9c923acf4b 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -650,7 +650,7 @@ static void etm4_enable_sysfs_smp_call(void *info)
  *  +--------------+
  *         |
  *  +------v-------+
- *  | Counter x    |   (reload to 1 on underflow)
+ *  | Counter x    |   (reload to 2 ^ (ts_level - 1) on underflow)
  *  +--------------+
  *         |
  *  +------v--------------+
@@ -661,7 +661,8 @@ static void etm4_enable_sysfs_smp_call(void *info)
  *  | Timestamp Generator  |  (timestamp on resource y)
  *  +----------------------+
  */
-static int etm4_config_timestamp_event(struct etmv4_drvdata *drvdata)
+static int etm4_config_timestamp_event(struct etmv4_drvdata *drvdata,
+				       u8 ts_level)
 {
 	int ctridx;
 	int rselector;
@@ -703,12 +704,8 @@ static int etm4_config_timestamp_event(struct etmv4_drvdata *drvdata)
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
@@ -756,6 +753,7 @@ static int etm4_parse_event_config(struct coresight_device *csdev,
 	struct perf_event_attr *attr = &event->attr;
 	unsigned long cfg_hash;
 	int preset, cc_threshold;
+	u8 ts_level;
 
 	/* Clear configuration from previous run */
 	memset(config, 0, sizeof(struct etmv4_config));
@@ -791,13 +789,15 @@ static int etm4_parse_event_config(struct coresight_device *csdev,
 			cc_threshold = drvdata->ccitmin;
 		config->ccctlr = cc_threshold;
 	}
-	if (ATTR_CFG_GET_FLD(attr, timestamp)) {
+
+	ts_level = ATTR_CFG_GET_FLD(attr, timestamp);
+	if (ts_level) {
 		/*
 		 * Configure timestamps to be emitted at regular intervals in
 		 * order to correlate instructions executed on different CPUs
 		 * (CPU-wide trace scenarios).
 		 */
-		ret = etm4_config_timestamp_event(drvdata);
+		ret = etm4_config_timestamp_event(drvdata, ts_level);
 
 		/*
 		 * No need to go further if timestamp intervals can't

-- 
2.34.1


