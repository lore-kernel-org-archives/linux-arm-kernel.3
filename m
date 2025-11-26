Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 090C4D1039D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 10:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+aV97bb+2uBMzq9jHPPNimq5cmAOBpE8XZ5NB2YnSTE=; b=Sm0pk+aamAW28QU4L/v8QJZHRf
	pCGS/A+UUO0XO5r93veaaL1DPBfO3hJj5YxGOLLOAzzn26SjSP+0IeNC10NWYrT7QvF3EgVvv0d0t
	/6T4lCIxVs8+bI3sB6XRTQDgXMK1dTYopUgC56F0HATgo1g7/Wx5vRqJhgLpcbGr+F6NOWtuuzUao
	XlthPDIbrZPGDJLWqTMiKyfhknLdAXWMG9HY2mb8OscX5jYH2kuBUT/0q0fkaVPzfwMMA8USJ0/rR
	1KOhjHAC1/DLdUZJelWx5Ci5Jh/J+EieovlB/LQRcf62a1pVodgyJ/ImcCBH3ldFV6cxHMwLTli3q
	auygw0zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vODDd-0000000EqwK-1NLr;
	Wed, 26 Nov 2025 10:57:53 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vODDZ-0000000Eqr9-1YnW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 10:57:51 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-477aa218f20so40415965e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Nov 2025 02:57:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764154667; x=1764759467; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+aV97bb+2uBMzq9jHPPNimq5cmAOBpE8XZ5NB2YnSTE=;
        b=xmeEaC86XM/TEG6fsToVg2EC5vu4FLSZUrXP7bA5LTVLWbTiRO3CUtCdJ+l7yN9vHH
         B/i9XeGR2RsztXmgDiJdkCYtyiqSPs1h0l9M15u8XjPRc9CJo3zNSeMFbJEwGBppyaCR
         rqMBZ/NsJMQajxQRFdmH3wf2GjHd19C6VHmxrJyvQ4yy6RGouyQVplzx+glec0CqLRjR
         AMRhTmotWxuFC5RtR9IETyjBAJkiF3WuzamlifBzIuJp/5nOOUqBiwUzLeLy3W2EH9/x
         FK/JSbjCO2PLQhQ9KPeA6IMMbwAdrLbPls5od8D7gILUz3+i34a6dyxmdJV6ALNVvhkM
         kxpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764154667; x=1764759467;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+aV97bb+2uBMzq9jHPPNimq5cmAOBpE8XZ5NB2YnSTE=;
        b=e5wnXHsYUYT0l3P+/ZvEJWpdz/Nuv94ii79aIQ3mZSzt/0YqCJxPscG6W8qNGUqQmC
         PJ1QiT2TUiiqAR9WLReVFjkwF8cx17zzb+F7MvoRu8DuUGpn1eptK2BalQ1BMfbiON5+
         rurH8yCCprLjsaLqQh1ltu6nvJRAu0tWEA+qltqAw2cJc2sLCBW6XSXtJZf0FeeDzoPv
         Jb/n5ypg62YnYjFilVHd2uM4y2vqHhVq5SJE4ljpSEaZE6KuIz6pHgQuW+Jl5gVu2qGk
         Ds68txwAQ4DHF7NOClvm4agTqXTampgiyz8v1ZFnFIIyuA5Zl4pG25Enl+u6cY2R9aOb
         f4qQ==
X-Forwarded-Encrypted: i=1; AJvYcCVKgj13cofogi6S+6eJIPVmGWe3l0K3fAQ/BRvpGOkN/nGC5b9eu5qs3XXUf65dBZ4fF9P1McIchnAG7oBGAaO3@lists.infradead.org
X-Gm-Message-State: AOJu0YxQup8VirKsIV9b/tDj7Z2wg+ErWkObCeQEcuFqemlzJ2lPCFpd
	yTZ6nEf3jIto8t+vmLIIySJeU+74HtAhy3H7CnU4OH4Aj33eXwrM45IDRgDFJ/0+v1M=
X-Gm-Gg: ASbGncupFce9v/YFZMmxgjdWFhKDF/93LvYqVPAUMPr8digRIbxU24JbJWBv1nLT6cG
	1mYNwrsCgYT7wC6NV8DaxWsrIARHnB0oblwuZ1hExd4jK1AvBKFuHrQUckwwwdLH2Lv6fIRNVOl
	8BHVO7fZmEa/oUODlr5REbAiMMPTfDvDxatKehEzlCfjbUlfrGPlqSptVCu4cX1g8FEaPNBWTIh
	g77+6Yg18M5iL9xztZ7h/+qcLrtLZuI+exapQqvtHOvasBody3GVE19MOpHWiNTSqjL04lzddMz
	yQ9c4B2JzfjgW0MlgBixauU8UYvtBUmoLq/2upqb4Jhrj52G6P/unu7tNG9c1ReL8Yv5eqZlwYi
	187nGXIKpwrfaD4XgY3oTJ4EiWEGsqhzzJWPmONo8/kiBllPkq1uFUoHujaD+yKnqWwzWJs2knG
	0bpLMnlV3Lfxtli7SWhP5xHJqMQZQE/I0=
X-Google-Smtp-Source: AGHT+IHgGpVirZ77PpHdvUsmYCeB9BGpEg9syRMr1tRkkyQMuBNBfGSh/HLgcNOGSzBrV7ZuKkcwdA==
X-Received: by 2002:a05:600c:4e8e:b0:477:9f34:17b8 with SMTP id 5b1f17b1804b1-477c0165bf3mr187105765e9.1.1764154667542;
        Wed, 26 Nov 2025 02:57:47 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4790ade13ddsm36991765e9.8.2025.11.26.02.57.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 02:57:47 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Wed, 26 Nov 2025 10:54:35 +0000
Subject: [PATCH v7 06/13] coresight: Interpret ETMv3 config with
 ATTR_CFG_GET_FLD()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251126-james-cs-syncfreq-v7-6-7fae5e0e5e16@linaro.org>
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
X-CRM114-CacheID: sfid-20251126_025749_463962_54108F2B 
X-CRM114-Status: GOOD (  18.10  )
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

Currently we're programming attr->config directly into ETMCR after some
validation. This obscures which fields are being used, and also makes it
impossible to move fields around or use other configN fields in the
future.

Improve it by only reading the fields that are valid and then setting
the appropriate ETMCR bits based on each one.

The ETMCR_CTXID_SIZE part can be removed as it was never a valid option
because it's not in ETM3X_SUPPORTED_OPTIONS.

Reviewed-by: Leo Yan <leo.yan@arm.com>
Reviewed-by: Mike Leach <mike.leach@linaro.org>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/hwtracing/coresight/coresight-etm3x-core.c | 24 ++++++++++++----------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm3x-core.c b/drivers/hwtracing/coresight/coresight-etm3x-core.c
index a5e809589d3e..4511fc2f8d72 100644
--- a/drivers/hwtracing/coresight/coresight-etm3x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm3x-core.c
@@ -28,6 +28,7 @@
 #include <linux/uaccess.h>
 #include <linux/clk.h>
 #include <linux/perf_event.h>
+#include <linux/perf/arm_pmu.h>
 #include <asm/sections.h>
 
 #include "coresight-etm.h"
@@ -339,21 +340,22 @@ static int etm_parse_event_config(struct etm_drvdata *drvdata,
 	if (attr->config & ~ETM3X_SUPPORTED_OPTIONS)
 		return -EINVAL;
 
-	config->ctrl = attr->config;
+	config->ctrl = 0;
 
-	/* Don't trace contextID when runs in non-root PID namespace */
-	if (!task_is_in_init_pid_ns(current))
-		config->ctrl &= ~ETMCR_CTXID_SIZE;
+	if (ATTR_CFG_GET_FLD(attr, cycacc))
+		config->ctrl |= ETMCR_CYC_ACC;
+
+	if (ATTR_CFG_GET_FLD(attr, timestamp))
+		config->ctrl |= ETMCR_TIMESTAMP_EN;
 
 	/*
-	 * Possible to have cores with PTM (supports ret stack) and ETM
-	 * (never has ret stack) on the same SoC. So if we have a request
-	 * for return stack that can't be honoured on this core then
-	 * clear the bit - trace will still continue normally
+	 * Possible to have cores with PTM (supports ret stack) and ETM (never
+	 * has ret stack) on the same SoC. So only enable when it can be honored
+	 * - trace will still continue normally otherwise.
 	 */
-	if ((config->ctrl & ETMCR_RETURN_STACK) &&
-	    !(drvdata->etmccer & ETMCCER_RETSTACK))
-		config->ctrl &= ~ETMCR_RETURN_STACK;
+	if (ATTR_CFG_GET_FLD(attr, retstack) &&
+	    (drvdata->etmccer & ETMCCER_RETSTACK))
+		config->ctrl |= ETMCR_RETURN_STACK;
 
 	return 0;
 }

-- 
2.34.1


