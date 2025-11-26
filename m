Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F01CD10F24
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 10:58:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=izIPWfoS9urp2dV3KvMRs2YvnYc7bdRi1OjC6bRCVDU=; b=jl92OOdT9ZgYIsbqngVMEvE35g
	OgBVJkRwOyN6ymDMDIB3juRgOTncUBOY2sEffERbxFP3I8NEqyPsyzX+NMRsN+qSt2G5Hqq8LsTIg
	Ov2t32AaMSVzCzTyIWn7gdkvTH4od5adRCkFFVc4PEXmGVIkuHb4NJU4O9W14pNVVs8fZQqpdgVzX
	tvwgryzmVTPlef401c/VnBiPstJqT3cT69j1qZar2mmCUzkNCYqGL8mG8e/Fm5veg4umDmb+VUv2e
	V7QrmGccTdm6elU5Hr6+w4mK0AcWm7L0omUmQYbslSdQUMhl87GwVCkK3DgznODBuek2Elj1dLIGW
	TGVTbltQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vODE0-0000000ErHC-2UAE;
	Wed, 26 Nov 2025 10:58:16 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vODDd-0000000Eqv1-3BEy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 10:57:55 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-477632b0621so43675975e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Nov 2025 02:57:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764154672; x=1764759472; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=izIPWfoS9urp2dV3KvMRs2YvnYc7bdRi1OjC6bRCVDU=;
        b=ek7vJTozAb+EQf//KaElo0QKmPgpvYgizrpOJlKJkIp8Y5V1JB5gfk+zcBzH0zwH3m
         x28oSU84K5q7OCtqJJKB9WK9M/bzb6C402AsAdzpC23htx6T2xgUX4dy7uESnQDIrseb
         zncf8vYOaBnd1nWUbQcnqdjhh9KkQMmdD9+suUcGFES4h+8wN/tTKkx0EbOIQzAJYdpU
         tWUZR9ivd3vV/0AWcwpGbURazTR4i5xGMVWv+Ls3ZLEF3Su/aqMh7Kg9SfjMWXEA3IPC
         rj1nEjq952rFJi9IVvB8Y6Twa/D7R7ODHk27ZY5OZUE+Kfxb1S/rW8AGQ6cosMVNInOW
         hqpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764154672; x=1764759472;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=izIPWfoS9urp2dV3KvMRs2YvnYc7bdRi1OjC6bRCVDU=;
        b=dojjstid7UrMt5OfkqLjb/9EnsAlvNknd7TcTnb/Zv6zMFGdOgKBvY76NyBi6jlEj8
         m97GIbvnyY261m/d/xGym/OVcPXvN2XJgN6C25DzliR4GLB8vKCRRwtIUXBSRZH9ZyEa
         DxWcX2iHuHWavw51p2qFeodL9ONdelZwmqwokJY5sXuKLDhuuMRxGmz1zdRXm1VON6nU
         +A66b3NzQyafkZqFS4XoosnOVsebuOsLmocibqcg+5PiQ2DD2bLGiReaw6lugeVXcc8u
         VWP3SrdQnw+17N8JnApznAq1RCi1s9kt/pzusC1z4RNw9RwH6J0j2aevF1TBerHYEWIV
         jvAQ==
X-Forwarded-Encrypted: i=1; AJvYcCUTioSEdfMOBilY/X7SUIhUcVF8ct4YtLOH6E0oSG8R+lhHNUk3xUyhGzW1KHYi3l/6+JrPYBBt0VGVuwCtJk7z@lists.infradead.org
X-Gm-Message-State: AOJu0YxXvlvcGFEiEUIN2cpyPQrp04aCZ1A8fN2ng+8+ZxZy9baGOm7m
	Dnb3PmgAmUecPawI1wrd44xidKGYTxutlDrlmDTy9a0XEzI8ex/uab9/UDDLodnQ0Y6WpPOWtDU
	AYEfvirk=
X-Gm-Gg: ASbGnct1f8xu3lhO5BV/rrG+dp50sO+xoDd07ftJTs67+y+IQyhfqoZojU3ENzENt2u
	DjuizcHzotkU7R1k5YDva4Wb8upxS1pzDW3lhuxSphOej5D5hKP3eH9Zq2XJBnScreI3PAE8jc6
	sEmVBYnoXED2gKdohz1rojxotGgTmcYnJ4jR66OvrUYodMuVUP+8cBz1n321Qk1/4pxZ/6hYnkk
	9sYeRMW+eve3ydWDj+44xgfCn2Nqm9rOZFAU3Q1uW0wE9NXVfqJVxVB7UdO1LU9oMpepRgjZMd2
	CFLZfyw9/O+Dm9U44FhqjzIif55faMl/te/ub3GIugbfcR012SZkceaSuLog9aKUa5DolmqCM4y
	BYbM6GDDWLut8UkS72VUJRR5zzW6XPV4isxhyBWKORtWPCHBGM+T9e1KbhTfzJoMbX+2N87CLqs
	4gcfS+Fb6VwQpUXO+ULFsN
X-Google-Smtp-Source: AGHT+IFAR6c195gOhTQz8dx6OF6n9ZtTYJ2jnLXbzOQvfTE9XO9dATUae/AlsEqPzIc2s5OhSaCgDQ==
X-Received: by 2002:a05:600c:46cd:b0:475:dc5c:3a89 with SMTP id 5b1f17b1804b1-477c1136b7fmr175263115e9.34.1764154671907;
        Wed, 26 Nov 2025 02:57:51 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4790ade13ddsm36991765e9.8.2025.11.26.02.57.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 02:57:50 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Wed, 26 Nov 2025 10:54:38 +0000
Subject: [PATCH v7 09/13] coresight: Interpret ETMv4 config with
 ATTR_CFG_GET_FLD()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251126-james-cs-syncfreq-v7-9-7fae5e0e5e16@linaro.org>
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
X-CRM114-CacheID: sfid-20251126_025753_855646_A6243E79 
X-CRM114-Status: GOOD (  19.18  )
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

Remove hard coded bitfield extractions and shifts and replace with
ATTR_CFG_GET_FLD().

ETM4_CFG_BIT_BB was defined to give the register bit positions to
userspace, TRCCONFIGR_BB should be used in the kernel so replace it.

Reviewed-by: Leo Yan <leo.yan@arm.com>
Reviewed-by: Mike Leach <mike.leach@linaro.org>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 44 ++++++++++------------
 1 file changed, 19 insertions(+), 25 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index 2ec2ae1fef58..b457f182efbe 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -29,6 +29,7 @@
 #include <linux/seq_file.h>
 #include <linux/uaccess.h>
 #include <linux/perf_event.h>
+#include <linux/perf/arm_pmu.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/property.h>
@@ -780,17 +781,17 @@ static int etm4_parse_event_config(struct coresight_device *csdev,
 		goto out;
 
 	/* Go from generic option to ETMv4 specifics */
-	if (attr->config & BIT(ETM_OPT_CYCACC)) {
+	if (ATTR_CFG_GET_FLD(attr, cycacc)) {
 		config->cfg |= TRCCONFIGR_CCI;
 		/* TRM: Must program this for cycacc to work */
-		cc_threshold = attr->config3 & ETM_CYC_THRESHOLD_MASK;
+		cc_threshold = ATTR_CFG_GET_FLD(attr, cc_threshold);
 		if (!cc_threshold)
 			cc_threshold = ETM_CYC_THRESHOLD_DEFAULT;
 		if (cc_threshold < drvdata->ccitmin)
 			cc_threshold = drvdata->ccitmin;
 		config->ccctlr = cc_threshold;
 	}
-	if (attr->config & BIT(ETM_OPT_TS)) {
+	if (ATTR_CFG_GET_FLD(attr, timestamp)) {
 		/*
 		 * Configure timestamps to be emitted at regular intervals in
 		 * order to correlate instructions executed on different CPUs
@@ -810,17 +811,17 @@ static int etm4_parse_event_config(struct coresight_device *csdev,
 	}
 
 	/* Only trace contextID when runs in root PID namespace */
-	if ((attr->config & BIT(ETM_OPT_CTXTID)) &&
+	if (ATTR_CFG_GET_FLD(attr, contextid1) &&
 	    task_is_in_init_pid_ns(current))
 		/* bit[6], Context ID tracing bit */
 		config->cfg |= TRCCONFIGR_CID;
 
 	/*
-	 * If set bit ETM_OPT_CTXTID2 in perf config, this asks to trace VMID
-	 * for recording CONTEXTIDR_EL2.  Do not enable VMID tracing if the
-	 * kernel is not running in EL2.
+	 * If set bit contextid2 in perf config, this asks to trace VMID for
+	 * recording CONTEXTIDR_EL2.  Do not enable VMID tracing if the kernel
+	 * is not running in EL2.
 	 */
-	if (attr->config & BIT(ETM_OPT_CTXTID2)) {
+	if (ATTR_CFG_GET_FLD(attr, contextid2)) {
 		if (!is_kernel_in_hyp_mode()) {
 			ret = -EINVAL;
 			goto out;
@@ -831,26 +832,22 @@ static int etm4_parse_event_config(struct coresight_device *csdev,
 	}
 
 	/* return stack - enable if selected and supported */
-	if ((attr->config & BIT(ETM_OPT_RETSTK)) && drvdata->retstack)
+	if (ATTR_CFG_GET_FLD(attr, retstack) && drvdata->retstack)
 		/* bit[12], Return stack enable bit */
 		config->cfg |= TRCCONFIGR_RS;
 
 	/*
-	 * Set any selected configuration and preset.
-	 *
-	 * This extracts the values of PMU_FORMAT_ATTR(configid) and PMU_FORMAT_ATTR(preset)
-	 * in the perf attributes defined in coresight-etm-perf.c.
-	 * configid uses bits 63:32 of attr->config2, preset uses bits 3:0 of attr->config.
-	 * A zero configid means no configuration active, preset = 0 means no preset selected.
+	 * Set any selected configuration and preset. A zero configid means no
+	 * configuration active, preset = 0 means no preset selected.
 	 */
-	if (attr->config2 & GENMASK_ULL(63, 32)) {
-		cfg_hash = (u32)(attr->config2 >> 32);
-		preset = attr->config & 0xF;
+	cfg_hash = ATTR_CFG_GET_FLD(attr, configid);
+	if (cfg_hash) {
+		preset = ATTR_CFG_GET_FLD(attr, preset);
 		ret = cscfg_csdev_enable_active_config(csdev, cfg_hash, preset);
 	}
 
 	/* branch broadcast - enable if selected and supported */
-	if (attr->config & BIT(ETM_OPT_BRANCH_BROADCAST)) {
+	if (ATTR_CFG_GET_FLD(attr, branch_broadcast)) {
 		if (!drvdata->trcbb) {
 			/*
 			 * Missing BB support could cause silent decode errors
@@ -859,7 +856,7 @@ static int etm4_parse_event_config(struct coresight_device *csdev,
 			ret = -EINVAL;
 			goto out;
 		} else {
-			config->cfg |= BIT(ETM4_CFG_BIT_BB);
+			config->cfg |= TRCCONFIGR_BB;
 		}
 	}
 
@@ -1083,11 +1080,8 @@ static int etm4_disable_perf(struct coresight_device *csdev,
 		return -EINVAL;
 
 	etm4_disable_hw(drvdata);
-	/*
-	 * The config_id occupies bits 63:32 of the config2 perf event attr
-	 * field. If this is non-zero then we will have enabled a config.
-	 */
-	if (attr->config2 & GENMASK_ULL(63, 32))
+	/* If configid is non-zero then we will have enabled a config. */
+	if (ATTR_CFG_GET_FLD(attr, configid))
 		cscfg_csdev_disable_active_config(csdev);
 
 	/*

-- 
2.34.1


