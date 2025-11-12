Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34B6DCCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 15:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WTx9IrqWxLtZaQBaoNbG+/dbV5fx8CFro3lQ5MrSIGY=; b=WdedcNDLKO+eEtXM2KlMVL8yuX
	/IkACOCqIQL0f1PV7kQJ8HKNv3TRnBw7fY7mgFUpnFqq8qmzesd+s9/nhlrtc+lK1BwY4Dfji7B5i
	BNeRwNdow11A4XmlTZSFSSdDZmvO2XDNgA8QKdZbIiQwRN72G9nIP7KBjt4aI4AueEswTWOsdfaOP
	sHKawp3SYpsHt9qpzixCg1EizDsyHm/F9Mho58Cf2wBhWwylWbM7GNfjPHuics22pYMnXVLWHKcKm
	mPxLDOi5zHRQ0SuxM0iULaKdvImsBAdDK5PO5y4G7WS3DgNfldEEID+W+8+VyZMpJeTcWkxnC0+AF
	6Bh6de6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJCgI-000000092QE-15by;
	Wed, 12 Nov 2025 15:22:46 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJCg8-000000092Hb-1Dj0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 15:22:37 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-47775fb6cb4so7058955e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Nov 2025 07:22:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762960954; x=1763565754; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WTx9IrqWxLtZaQBaoNbG+/dbV5fx8CFro3lQ5MrSIGY=;
        b=VXy8o4mGBJ/BB3jf+fVV/fn23PwxVQWM2ePaWjUPdFtW8X4ssF1wwzVC0wDj58Q6Mg
         hD/D5ct74gT3ixQz5luvOtua+mtFbYFQlRazPCYDp0Ix5S7hPdveRTbOQGUYO1DtPHs4
         70+PK5FgXNEq2IMz5zYhLWTKxxDQ5a+ScS/T30nP9e1QWvCT/ic810OLBPMgJSqgYflt
         gHnYn3aunjIu0YhDZBSA8PQWIDxxpNFDwmTtuj+3lcvgMEQgbGh/+bcHPmP0vTftQ2jR
         SK7B1zKTBVXpls5gXXXt6/mQmXsxm1s8EM88hCxEaT1l9J48TQW6CGfn6egrrdG6EhWB
         EHNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762960954; x=1763565754;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WTx9IrqWxLtZaQBaoNbG+/dbV5fx8CFro3lQ5MrSIGY=;
        b=A3/k8IzR8yYc0cTtxELYTVwZSwNHElLItWzG45fcVcoQuKe4jf9ZHp8g05gRwHhb7B
         10KKGeiO1Em72RWmCSpvXyDuks/IS9NAhzQ22iSvaN4DDraIM6ezg7QgicpBeBMJ4ygK
         mB8MBYUjHDNq2hYr+UIYaOZXd3iVFH3gkC1N7WYAl49VKQKLTVlYxNhCxvAddrYXSo+2
         MElqPY0KtsTlOEd+BZYz3shpGHz+S9OwmVCqhQjKUoNDn7MbpO1QNnv85Mb4QVsP1voj
         BSkDe7Ylwru1061c6F56VVBkd+m588xuWNaFJkh5Q0rRLZM4diDFUke/68rKUDDfqYJk
         +l9g==
X-Forwarded-Encrypted: i=1; AJvYcCUL5rWE8hf9w/JG7KWXb0q63GhhToVo1GlBMvltrEi+AOLb/uVyL4ZK+GNwygNAHREx0XnIWmPsC5phf6hLx8Wl@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6+OqWSE0JC3pnbO0bkAVFJsLfC0XfaUZBj82e2Y+ioYH/vvrk
	eBYAn87ND6G8ZgzgUGlyHamlPh11Dben4g3oT8SGIIVYA5v9lAr+saucLKo8GevFPFE=
X-Gm-Gg: ASbGncvlEW6BLcO778a2ZuYqwpbn+FTITqy9QYmAs1ElyJGZGkofHPEEonP+TAkYKEC
	sTWXxDVLQ26Ju6nVjKCM2Li8IvKripTlIvPlk1s9VNqm/ibmZcCYYBrwO78rmxOKtmAuqtdIk1P
	1fImYfJ0adULnPXSehAX4BImYnDXAL7CzUBzT0V4RCQD1FEAjHmoIajRjA9NrT7SoXMN9KPvA2E
	VJPblD1e78eP73I+UwjzeqkLF7KPnUtbpSzbe9dhM/hn4iZZSXGcQZ4d20OL7e+wKTEjUyDV8PI
	5lz37+s2dMf0SQg4sKmo9xILbdhtnkvvUBMaKLsi4HVHJCMYzn4W+NOPX99eCQG4hgWrNKMSjpE
	BoJuaXouCoaP8c7PsNV7mDJZpS4xfYLS1FzB7YoxU2d1Sv4HORUa1ByJS1XW/PX2vhCaRvc2fcP
	9nRPYMDI90yg==
X-Google-Smtp-Source: AGHT+IFw5cqZamC5mYofHQFAGIs+CpErGeW7hJbNKdZt2prmVHC1gv1dK5HcvPNjN2fBGVGfPd1yoA==
X-Received: by 2002:a05:600c:c4a1:b0:477:63b5:6f3a with SMTP id 5b1f17b1804b1-477870b2d84mr28776855e9.27.1762960954356;
        Wed, 12 Nov 2025 07:22:34 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42ac677ab75sm33573485f8f.35.2025.11.12.07.22.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 07:22:34 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Wed, 12 Nov 2025 15:22:12 +0000
Subject: [PATCH v4 06/13] coresight: Interpret ETMv3 config with
 ATTR_CFG_GET_FLD()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251112-james-cs-syncfreq-v4-6-165ba21401dc@linaro.org>
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
X-CRM114-CacheID: sfid-20251112_072236_360624_042CE14B 
X-CRM114-Status: GOOD (  18.03  )
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


