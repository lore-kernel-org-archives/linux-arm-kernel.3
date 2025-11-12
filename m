Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD0ECCD1297
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 15:22:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YETsnt5LWQuxxsuLBsy1SxsGYRqR4GjZ60Oc430mZIU=; b=fS7jEYsyQ9Y0Pf9TlFxsSHkPqA
	JWn52j/TNNAJklrEBb+kOtpGvVU9SadpQCvC7BTDDNXTxVQEKMqU8WDC0iiU52wx2xBvJXG1d3Sf1
	5mX2p9yeCxZpubwfRGDNb1iQ/OHVTUjbwIiI3chzYiPIRNhZuvA7IubN/lxQf9ECDjDb27S6e2IRL
	aEMTdAmStoEgXhgIOizkHLn0XopvSfqKgYm6XN5RK3TjTYhsu1OC9eVAMjL8WuWX3SzknClZt0l36
	1u0tCnQ8IYnmfZ4SOJXymoAtJPmp3aMqY6d/aCeQtEzbPVBwNrzzilGNV3tT/moRQaOQXmw8Jk3AF
	UQHeBO3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJCgJ-000000092Th-45QS;
	Wed, 12 Nov 2025 15:22:47 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJCgA-000000092K4-47eA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 15:22:42 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-42b3c965ca9so558783f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Nov 2025 07:22:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762960957; x=1763565757; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YETsnt5LWQuxxsuLBsy1SxsGYRqR4GjZ60Oc430mZIU=;
        b=lDo6+WHlvCFy2DH3ADTKWVLMd1ZOEAigBB9Bu+Ps3gBArMDtPmXIUg3eARxxdBC+ng
         6TPNYyvqicDY4yaeyngYLQvwWgxuRXv3mJu4xmgN0ct69x7Cz92J2th13UOg2FrcdrVh
         XmLZDt0mVO+wNiG8e3JZBp7kj/jCrFrnvecU5nd619n630L2xjIKSgAcMhlvsDmDSBr9
         fRt8nYPQ4NRk1j8UIsz6D2S94M+TQfbDO8pSe2nPBuTeLHkCuVqA5pfMtUU+tmwmWMsq
         TsvnnpRChWMe2OH0CDjsVfI24bNhg2V38HbxUqquahH50OMqfD8kRmZ0sGvLvDN6EsYJ
         dY2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762960957; x=1763565757;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YETsnt5LWQuxxsuLBsy1SxsGYRqR4GjZ60Oc430mZIU=;
        b=QPBIIyWVUtZZqZjDQx6cbSqNStBKtAm7acylh/K+kvXXmC9ntGYMOkD81gZdrgyEDh
         wPPzxyLtmSc7nsSDyfyycyaT6IYAfb/9I4Zcz5vHBIEtOmokmyKgXRtN6bBBOxf8fzjL
         8HyFZ8ruOi8m+fjmpyldNXPp7LitCBz6qNGlRkLn6dpY/zQYa4gYUe2FjkHJQ0pfagDh
         WLmu/qPTTcH0bhqYl0NvyCBb57CkjY24YYT6hI4Hf2j8KW+Ez7qIhou53il8zKq3RJ1x
         yVyZxpcwL1UK7MXwrQ7zlxdMyF4mRab8C82mS0XaQ4YhsN8sRDqs8GWnthzaEO1TrVeT
         7YyA==
X-Forwarded-Encrypted: i=1; AJvYcCWv6PbTlJDLN7MnAdz86KLRCuf9DKzw9ARXqXGr2QEm4+XePdQ1UpphXjV8ZKmlUhan1o7DQA5wrB1qnIGSO2yA@lists.infradead.org
X-Gm-Message-State: AOJu0YwUPhFoFpiNmG+iZzacfKCOSNKUDY6foBYDe//JJsE3H15AaxAH
	x/L4Q+NPX3Fmk92tuNrK/zh93PoX8IO1+/abE+iz7zqq2i9PRgSZIaYeCIHhMtQaWoI=
X-Gm-Gg: ASbGncshq1CaWD7dX+GF3DqJWEC9eH0Pk0ahnLWKfEKGXljnS09yPd1EP/XSURVZBWN
	Acesmxz3HUDypwoYU4bL88qUoo9X5VTqpENXCKo/HwDUtJ02QYqF8DxoORvAh24IXFo+iI3E8zu
	gBJX0JXWT/jv4Ixlba85x7Znl9QwHgkVV6qoFpSPzCgm4liMZ44Vue/5iL58TLoyd3PtWHEeCxS
	ScSJaGwzOfjBGaY8MlrgoDUcHqbZl3mtRZbPuBV+0SYhK6gWY54ttTInRSyZACl4gvtnyVq3c9L
	tqBcFnv7zzh4uMrLUCaWCDy49HDa2vHIAM10hXUgK3HXXS5GKAbLvGMKTae/Rb0QATTvjuK92GX
	u8Fz/MVslOO6KW0oqyx1qAyCYBhcaxMfk+HNiPDOGDOdZ10U5NO1oZ2A8CCt/ES31IiyrH38eLw
	IupdmMJ3c5ApLF9y/JKeWJ
X-Google-Smtp-Source: AGHT+IGkUdJ1tT6maJPY0NlY8NR0Mlq7ejN67NI2u5oaHXO9CTIjlAkj6ENeRyhSR6+QoDIl3mZfwA==
X-Received: by 2002:a5d:5f50:0:b0:42b:3661:305c with SMTP id ffacd0b85a97d-42b4bdce2damr2544670f8f.55.1762960957062;
        Wed, 12 Nov 2025 07:22:37 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42ac677ab75sm33573485f8f.35.2025.11.12.07.22.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 07:22:36 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Wed, 12 Nov 2025 15:22:15 +0000
Subject: [PATCH v4 09/13] coresight: Interpret ETMv4 config with
 ATTR_CFG_GET_FLD()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251112-james-cs-syncfreq-v4-9-165ba21401dc@linaro.org>
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
X-CRM114-CacheID: sfid-20251112_072239_068177_77F98D90 
X-CRM114-Status: GOOD (  19.13  )
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

Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 44 ++++++++++------------
 1 file changed, 19 insertions(+), 25 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index 380a7840adb8..1aa0357a5ce7 100644
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
@@ -789,17 +790,17 @@ static int etm4_parse_event_config(struct coresight_device *csdev,
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
@@ -819,17 +820,17 @@ static int etm4_parse_event_config(struct coresight_device *csdev,
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
@@ -840,26 +841,22 @@ static int etm4_parse_event_config(struct coresight_device *csdev,
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
+	if (ATTR_CFG_GET_FLD(attr, configid)) {
+		cfg_hash = ATTR_CFG_GET_FLD(attr, configid);
+		preset = ATTR_CFG_GET_FLD(attr, preset);
 		ret = cscfg_csdev_enable_active_config(csdev, cfg_hash, preset);
 	}
 
 	/* branch broadcast - enable if selected and supported */
-	if (attr->config & BIT(ETM_OPT_BRANCH_BROADCAST)) {
+	if (ATTR_CFG_GET_FLD(attr, branch_broadcast)) {
 		if (!drvdata->trcbb) {
 			/*
 			 * Missing BB support could cause silent decode errors
@@ -868,7 +865,7 @@ static int etm4_parse_event_config(struct coresight_device *csdev,
 			ret = -EINVAL;
 			goto out;
 		} else {
-			config->cfg |= BIT(ETM4_CFG_BIT_BB);
+			config->cfg |= TRCCONFIGR_BB;
 		}
 	}
 
@@ -1104,11 +1101,8 @@ static int etm4_disable_perf(struct coresight_device *csdev,
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


