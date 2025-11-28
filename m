Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B81AECFD376
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Nov 2025 11:56:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f/X8/s0XmEBVcp92RiDvltwq9YKc36aF7AB3/15oKmM=; b=T2jnDgS/vS+XmYgFMfKWusg8gJ
	XXt+BcyUazRvqWNw/bNRfl63GCjoJ+698jbGQQAF2Sq358lGJd4LpnPyh4ebRBwQKYz0cyUQDqCGq
	279x9/CHfoofsM4CtpQrx71X4Ts90GZRcOEEOC78d3FIITo/yNhZyMYKbY/Rh12y1Uwry+PFI0Cki
	h15zLv2zHykrHvq3GXscXfOfP+kfwNC3mW+KHwTpEU606jZ/+TWv0sYQF/82lt5BYWTYexaZpp0ph
	MN1sOkjITnjAbEwXMBGf83tZ3j6aNqGF6YpR2nVYMUq5ae/G/DchRzdHDYZgO3fvUogm+yjET1TQp
	AxUnaOTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOx5B-00000000Nsn-1ZID;
	Fri, 28 Nov 2025 11:56:13 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOx4x-00000000Njx-2a1K
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Nov 2025 11:56:00 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-477563e28a3so12395455e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Nov 2025 03:55:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764330958; x=1764935758; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f/X8/s0XmEBVcp92RiDvltwq9YKc36aF7AB3/15oKmM=;
        b=cNVoNaJXDxHGrQpwijuueuOQIW1zDdhqzV2mnqiivkopCMnhaPMslIYHArY4hWdWuw
         FM6WCz2KJhKCttJ7/C7HnsaIU7ylunKpPcKrVMhEXVJSs+gWv5S6rTO8unR5H7qMHUt3
         1ZM76BE3a1Z6Gju30WLUHMAdjulw6Q0ghBMTXWdcqK68XbtiC7H8BwhV5MlEay2xLyky
         29TnoIxvRkZ4icvo76jQkBnHlcxwCzyLDJBRXBTPjH3F0ZQeIXrHp8UFm0On8iF+Zfkl
         zSe3b7QbdidRtuouURiS2uK9shuiNPbUPskcK0oxCO/q1lRFPDFTNi+C3rUd6wMqRLiB
         j42w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764330958; x=1764935758;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=f/X8/s0XmEBVcp92RiDvltwq9YKc36aF7AB3/15oKmM=;
        b=lfKpIqCK/ft1XGvYy6LmUGmJNRHp7aLCb515hGIN8eBdImnZwQSASLTK7wvXfTKtWp
         y8q+l0EYcjZjWjU4+bH4y9EOcq3EoJ6LVYJZhUARamI5eie7/Xqz4l+XJXVicPdbY/TD
         7HpTr7D0O0P4OSeYcLxA4QJwuc9cd9d8CYJ3pR8t5Q623JbRlYZMkN/2sZHD/Q5vU+Gw
         034IM1570kn/GzdA97ZeHYt8NnDsaQXw5SKzlbNunixcAxC1dwncbtC77vKSxJCtmeJn
         WI+2oE9q624CxwhWRM9DPgZhNnjzvbMjZ3BWz7sVzOSp6NZCMnPBQK+o7jYHeAoMRCxg
         rMCQ==
X-Forwarded-Encrypted: i=1; AJvYcCVhtiaACYWJfsRnt/480tqmUjbY/vXvwMlDRPYmSCNexgK0boq6u+J+2GvqCA+wOUfRUd5+vSEvs0dvmM5NAxOg@lists.infradead.org
X-Gm-Message-State: AOJu0YwTiXdGtXEEncWST85u+dhJ2E5GEqL9BSTrhAPB0hDYSRtHxybQ
	64qRYg5iVCC8+8t3IJMjcCGQalomV0MiOW3xng0U/iStFezYVlAFBAS4MHazSpCw2Ek=
X-Gm-Gg: ASbGncsQJCuwN9LdksK5X0FbpHrqWAwMnRPTOqXTl2orqBxfHivqf6L4sGjmibYkhyw
	7Y1Ag40ZC9fe3FCysncnX9IqjP4WamgVyxGMU7EOvdaYK63O8oWQP/VfMOJDjvWRn3eTsBpG4BJ
	Cx/cz1k3z6QbeM5oBF5CUS7M9pMCfj1MktfVgomFE3dz04UNwjFORRd9C4E675XRIWaqUYdLHQW
	QbHhWF6x6gTUBuPMMfYSMdoQA+8hp5ngPWd5cNox6HzfNmV0BzoW510oMQm5QgGX5oNGeaGxc0t
	lPkYzcJCYsNbiXVMkg3EwQEziFkB7mkjDwKCBJ8G2Wi8yWurAP1qMLP63qtaNjJS3Gg3mlWf6tw
	vw+rOKMGHkghpMQq2a0OdXZrlj6FLGCGnp9HgPKkwW7cU8GgsIOs0JGSvxoSX84UhHnhgMqcYXb
	eJ7tD0CdDXDsRAPTZSMk36
X-Google-Smtp-Source: AGHT+IGaQRyFBvi4xXG1OSwj8+KoP6rOM24a0UhWoYDoOvAcD4TFnR9g6F/aB9eSqTg5kCu4JYRodQ==
X-Received: by 2002:a05:600c:4746:b0:477:a289:d854 with SMTP id 5b1f17b1804b1-477c04cfa31mr284161715e9.5.1764330957915;
        Fri, 28 Nov 2025 03:55:57 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4790adc8bc7sm158974465e9.1.2025.11.28.03.55.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 03:55:57 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Fri, 28 Nov 2025 11:55:21 +0000
Subject: [PATCH v8 09/13] coresight: Interpret ETMv4 config with
 ATTR_CFG_GET_FLD()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251128-james-cs-syncfreq-v8-9-4d319764cc58@linaro.org>
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
X-CRM114-CacheID: sfid-20251128_035559_687103_E73423C4 
X-CRM114-Status: GOOD (  18.94  )
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
Tested-by: Leo Yan <leo.yan@arm.com>
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


