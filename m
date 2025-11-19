Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70345CF394D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 16:18:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mAj6+rTtj7ATosP9M3WMDyWCja/Ic0j8s2EkvfB39Kc=; b=Xwh2SpqwjvQBZyX4qodw+MRgjh
	0EgQSTOCeDLvXZ1ysoAaUirE2FTWsy2stWU+omGYoNPvx38MEhUFTvkHJkDdO2ZyNLCwCXnlFXdKg
	XS/K7V4JpnSAk7flN5jfn3wXT+ztnsu0N5MYloK1Esn8gG2a7wXs+2Iscxp6zetskearTMGVYvTF9
	lB+Bp+Z7N7TVAgDQdSBtp6wcD4TaCGX+nvKljJqZgPAOa06fxmv+/x7W1xOOlh7HgdoveS2fTUp85
	OP8meFPyXQqmeHnpNorBBCBEd+uMxvy+8e/4ZHSWGeiCmS9VMBoe3u3eVj451M6eQso/sK8qNlg8A
	hKU/i7wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLktG-00000003fAP-0Ohl;
	Wed, 19 Nov 2025 16:18:42 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLkt1-00000003euF-02cv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 16:18:28 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4779cc419b2so48806135e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Nov 2025 08:18:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763569105; x=1764173905; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mAj6+rTtj7ATosP9M3WMDyWCja/Ic0j8s2EkvfB39Kc=;
        b=gAidcwio1+fU5pyGrBoeouyHanPNdeQY4Er8gzTGQnex/CmWBQbvk4KedoDfKc2+gP
         G1V+ZFmxZsEl4sHar5wRxXUMThI0e1ruHxH7936ZooLXetsggy+EKjOLCvl8frRaQFBa
         sk7hASEGdhP47XiTbxZwFhdeEAqMNsUHOaiKlQOItKyOuEZ2Y/jpP+jLlq5aab7xcuNW
         K9KMHkHqm6zBAK7SWz10unl+CLo4DEEQMBGKsYncnfvU6YjgAuwgJnKVOGm5iBD8oRLK
         YE97J0guUK8bdLTM0xOiUzv3hw31bo5aZiU++SyzwVEEqp2+7dKnnllTb1jJg1QnE3Ts
         PcOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763569105; x=1764173905;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mAj6+rTtj7ATosP9M3WMDyWCja/Ic0j8s2EkvfB39Kc=;
        b=cLEruzyYkWwK1znOQv/yvnLEj9CausBfjVYu0wLPC8UzdfNxGTYQbNGCn+wmAh/Y0H
         C+MuqnRyCclK8jVTZMKfnhHUac1xKgsMTssy5Ia1JjwsWEGcn1Rc9rX7t7QFP/AJZr/N
         xvc1ztvzK9bTLZG1ouAzr19h6Yuq87OpyOuRybHhkCfPBandVnz5YHATRKwmAikOd+ha
         s/JgSqJc7dQfTvL3ZWk8YTxj5TE18HwlBWVo4Yg75zMMT6Clce1c2srz+CpTbeP+VlHe
         DcacWzObR2fAmMihx08vcdbBBepXRgHOzv2fMPmD09kHTOiP5lgRLWhxrGG9hTvHDLqz
         13Ew==
X-Forwarded-Encrypted: i=1; AJvYcCVw43TIWfJJX/nkKW9XUhj8722jv+xWTSe1qp6CXwjr250aO4YnMcT+bT4HmhD2YiqNtTb+/8RsOMvXdpuCSFGq@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0GTNyaOjbdYdQLfwjJD+DKJmunqDbEXPZ3vU5CBLB91MrwVBS
	+zUqpJFlFyKIrVNnAS5fDbkektLvkS8PZpsga6XoruUpk+ITR5kUkHzSklmTQHgmBKQ=
X-Gm-Gg: ASbGncuRzKXF1qs0W/UhOmaKeSm/cGg26tgT9UIrfS7mUd5UWdkqEIfJECLnZcntaSv
	DQbngr7h0kiv7/QTyFYURkXpzkplf1BpwHtxe5Eos+i8vp2fWQ8o3QahfkhkeC/GnS6syZWU6Gj
	BeMHDsmOLNa05skfDptxVDhbTlfGathLMUDYGU+LrQEA8RnSKmkj7OemqJaYr7rN9ra0q/xvZq6
	367/fQX9cIkOaRvDC6IVPIEAtIdDuCmkCLDaVwsh4OVGcDHbv7PznKW8XXJZl2cdYTpvY4+IlC2
	D6r+aVTxM1FkAYBpDdHL4AG8fjFMlKvgmB+XjSvN0tNeqb+4SirRoW9DOGXZNVvvZQc10WtXTyp
	1dNP9vvjmuvW6b8BwHf57E9yxlW5OPOLEJBhj6s0IVQgP9IJXfs5eohmO/OUZyvFuKG+1qo6d4E
	MYtBR1PVa83lfTvxLJG6PtYNnbtCq7I+o=
X-Google-Smtp-Source: AGHT+IHL0Xxnsgm5QROIs0jK7YmdMNHqvM4TUjjLTcMhfd+KYuc1AUdTBzLfbEK0Xqm07NedRv3Q6Q==
X-Received: by 2002:a05:600c:4fc5:b0:477:b0b9:312a with SMTP id 5b1f17b1804b1-477b0b932damr42861065e9.7.1763569104659;
        Wed, 19 Nov 2025 08:18:24 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477b10142d3sm63205425e9.5.2025.11.19.08.18.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 08:18:24 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Wed, 19 Nov 2025 16:18:02 +0000
Subject: [PATCH v6 06/13] coresight: Interpret ETMv3 config with
 ATTR_CFG_GET_FLD()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251119-james-cs-syncfreq-v6-6-740d24a29e51@linaro.org>
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
X-CRM114-CacheID: sfid-20251119_081827_094674_0D4B3087 
X-CRM114-Status: GOOD (  18.69  )
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


