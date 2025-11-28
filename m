Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1C60D116F9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Nov 2025 11:56:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bRvaTUsN/BOLMraF1V/Jx+sgUDlEB4La/1yBhPfFT5o=; b=4VSXxy0XAz835o+f3RdX4c8ger
	lZU8/KARwk24GfTc37RQ4PVcFLIrfjFeukfTBumJb+U0AFf9+lMm+T8aMzT+OJL33kfthV1i3vu76
	VG4dPzQwVN5REXlhCJC3biOcy2EugfEhdpUM+0Sgsegfe4IvCw88R4AyF60FrNB3G4aD7w3dpHM0/
	anK9uDbhR9x3q+geVEZlaDOp2udNan+78YSVfrxSuOA7/4N44oP+UsnvBVpOixsCJFEFQXpeu/N3s
	/IHnAPfMq2/uUxKsPvVnCsCiCUe0kn+cIvZsKR2grrTOk63vJSGwDGLHRFTNMl4dDHGxhh1aY1obA
	BJO5OjXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOx5A-00000000Nqy-0kMS;
	Fri, 28 Nov 2025 11:56:12 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOx4u-00000000Ni0-3BSb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Nov 2025 11:55:57 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-47774d3536dso14570565e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Nov 2025 03:55:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764330955; x=1764935755; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bRvaTUsN/BOLMraF1V/Jx+sgUDlEB4La/1yBhPfFT5o=;
        b=holCDd9pJW3BqLfsnHNgTdOzRWhimodN0pi4+SbP1VQU8z40uidxEn02Cs9SkBbrP9
         ma1wua136zQYcYGpYWCV4VOrnM2HiEtTlfUwJLBE+zoyooDmZD1fN77sGsCchdwngyML
         tG2a+Dvg/tkc3IkKuqYtTaQr3/hZUrVhzsQuSObepS8vs76DI/CTI61KvRMKhIDt+tz3
         FOLNECnuSY8dxWT4vZ3uB+HMMyeW7uNKmDPetz0MDL89wsXeEOJXQHqRDtbLYyp5Ee3H
         HpseOgEXG4Zez3V1XLeKUiYhXOiOaVNbqBxQmuSuvjSAHitwQ00U56ysNUX1tYTTuBdx
         /LDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764330955; x=1764935755;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bRvaTUsN/BOLMraF1V/Jx+sgUDlEB4La/1yBhPfFT5o=;
        b=nVKI1R3XINsKa5P8Peipp0/pVwpO677e6NM4sbFERDAdh59wEA8GBOuq3cxVRvd/Ll
         LrP+Qk4s/mFu/T5iL3J1nO8JoAoOEplhvnOD7TOuK516++wOg5/UoEEnjh7FlIjlUbD/
         qka83JXQZQ9KB33IZ7Ur+eOX2V/dBaF4qhrjeQBfQ28D2XhrJe1NQGrTviGbU9wxx+Dt
         W2TzxlWywyaTQNn294nNKpfS1JBUOXoLEneeWKF/k4XYgpqCUgjB5QQBr1zBdQTovUg3
         j9eSSQKyKVdYmlrg8lBiLmmbEynecQYWZxnbtYeQpAl489teQp1/tMmqkR4dB76DP8Mh
         F3ow==
X-Forwarded-Encrypted: i=1; AJvYcCV8kICKotsN0ElC83FpfJ+EGcC0ivaGZyd2GWIugSF1NZAMTD+caBibff9zuHHNE0nOUa++lq8sz4lK/cNvXzNr@lists.infradead.org
X-Gm-Message-State: AOJu0YwN/sk1vybkL4VszWSb3NR7SseQIpR9m9SWXNu83G95G0C5IgCM
	rh2ABdeaL/K4+zECLptipvZYkglYd2tH2lS2Tdhau9zBLdSs2j2FSLppzqk8XSMQxck=
X-Gm-Gg: ASbGncsArXilYiNkik0SqAH/1aBz8RUWwRndzgJod1XAB+WI/G6zvvGNr9T4Y0OhszU
	ETPXlwFHTkARQlcl/FPs26rqkfXJi39amjALR0+mM0pGJvulYP2JXtmJ7tAk01wdmks+nAkBMTC
	6KpuuC5qiEM805k8o74rcjv5A6Z5Bb9MMyPxm8u/GvL+bhv9w9vACnKRJvteeZyjsPeJ+CQAT5a
	gonxlucydQCHKMy4v3nMZv1nmN4Fm0aYTduSXkNn8UUmHgbX4R+HljQghsE13B+dWNt4D9L4jmh
	EvzXL+xutCz0LolxeAiuXLIh9eTnbH5enjs9XpU2IT3wR4+h2kEtrGZp3keL3bc/+8PiWWU38ts
	+/b/3wehXJXcY8vwGAWpPR997Wt6L1vsPf8DKlOsL3qO1rBoYkZ/UtRrhxzD5+7lFhHStuo0WP6
	ZHaTCT0s1RFNLBrYPbN15d
X-Google-Smtp-Source: AGHT+IHHJp7IXs6ZlGHGDXrAuQH/ZDtq9VItsBGhLegTctnw4skk5g13LG6OujHX1TW9GVSOCqfOjA==
X-Received: by 2002:a05:600c:154e:b0:46e:2815:8568 with SMTP id 5b1f17b1804b1-477c05137f4mr277419485e9.10.1764330955144;
        Fri, 28 Nov 2025 03:55:55 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4790adc8bc7sm158974465e9.1.2025.11.28.03.55.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 03:55:54 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Fri, 28 Nov 2025 11:55:18 +0000
Subject: [PATCH v8 06/13] coresight: Interpret ETMv3 config with
 ATTR_CFG_GET_FLD()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251128-james-cs-syncfreq-v8-6-4d319764cc58@linaro.org>
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
X-CRM114-CacheID: sfid-20251128_035556_826452_8559F96A 
X-CRM114-Status: GOOD (  17.86  )
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
Tested-by: Leo Yan <leo.yan@arm.com>
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


