Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A9CDE77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 19:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HTSJOfzZPahbxlAY3P7hXeWy8oLFvuzfh5AkQx6x1+I=; b=Nz6K1Uum9PsI/ASAsk/pU2yZow
	3eIIpLnDBMR1cXv9o73GOnsiRyqBXE16glt7giwWe2Ju60LlUSukE0bwPVSbKsyWZ2bJWez2G7/4g
	lk4OCRVi5L5wQ6Ul6ls+jQExU4Xt1WkFOU6sdhaq6kNWCSdLBF9gP2igBKcFK2hVbL4FAgt2VeQVx
	52SEwzaxaA5GDvv6PtJz781BBMV9ezoFNZuw6JrUXVD2CoCDZBsf199+qfsf2vjfo1TBTGFVqLnv0
	zY8gmuJiaYAmUFlVF5NFx/uOf/0SL7W7poFs7hQOjwfi7JOxOBdiTrEeCRXR8x4g3a7VZmfPNxUGO
	gGb/hLdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXmck-00000009XtL-273c;
	Tue, 14 Jan 2025 19:30:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXmZf-00000009XOI-3eLx
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 14 Jan 2025 19:27:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=HTSJOfzZPahbxlAY3P7hXeWy8oLFvuzfh5AkQx6x1+I=; b=gdCg1USQCkEgttO6S6Q2IjLNrl
	/XG/PDYjDEr4NQ8TurDKClSooE6gYcQktq7aQT0WBpwHBM+pvcnME/p7FLD19zdOdie2cEM+p2Glv
	CcuLVvUiyqsmgqJIWUaQVIsVMq3fgt8WFXOUQ+yfsOIOd3wjqdpOFEbSURpshx/qP7jPcDb+Du3Uq
	E2AZptnv0c4f3Tw5nUMThm9qTx/X8gwEsp5QoddJB08Mbo2SaQAPKTFSIZOjPMu7CHxxPyKFfNjkz
	PzCM3cqyFJ+FCDFcIqTS4A1ohGG7LFQR700N6j3h8IYRmUkdFUFpIDAs3HxY4K2GpvfQVKYijwHf6
	N+lm8jhw==;
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXmZd-0000000Aa7f-0TNZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jan 2025 19:27:38 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-385d851e7c3so273881f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jan 2025 11:27:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736882855; x=1737487655; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HTSJOfzZPahbxlAY3P7hXeWy8oLFvuzfh5AkQx6x1+I=;
        b=koRyoSod7SzNeV99ohUGM7fCsXe6CZyBNuyFC45zgncpCrel2UYNx4qYsOBnRg2LN+
         dO7mQeeZA02mHkAYOr+WnG/SR42E2toHeZV7T0znorvIHzs0tjauDw1uh7gasI3B7u4w
         hRLYMMsV5mZIQhU70WAzRlBp/onYedlyO+Ilq0rjp6+bjAX/2f2lc/+uxBKHpFr8l93F
         Pg+Ytqc0cWrwUycKIQPGp+GjKmo4aT0is2MBegWCD/lndgIF8AX6QxgQlsn4qN1pMHOy
         MFUN1/lqoSLejjElS+lWxCr0nLRYxPqPU8qIBgGtKbPPm44v+Wt450N4FDTWJNSdAfhc
         Q4sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736882855; x=1737487655;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HTSJOfzZPahbxlAY3P7hXeWy8oLFvuzfh5AkQx6x1+I=;
        b=KHGT4nLPDZCsDT/rUOh+eSxlfDeUIn0NXoRs2go8IAceWxmJTtu0pAPniGkSbuq5SO
         zOXf85AWDbNmqndQGgIn9yp/utmBXAxcIO6gnY/Tu0xRRxLnP58hST8fTd+s9jFitJtR
         P5/u/6FlOlDKsCqeRNPsaX1Tqz4obkPUKvEPEfTimjBu5Y7HdW93k+a5ssjJHAhpeCbX
         ZbFiwoHFNJToEjjepHkiVKSy0GSvOjfSZ/+AonNxB2ksoB9zzMhQPYyWfqBz0K4Uc+78
         ci19XgizRzq22NfGoyyntR0WtRGP7QUUSfw/yaIGR+56kK49Rnn4UQh9QirthUtKeb+I
         8UyA==
X-Forwarded-Encrypted: i=1; AJvYcCXk/0mTxjKSDsYfskbzQatL+DLuWbLjYDNmSTu2ZHOOXoySQRV+ikb026jS8cvf3cW2UgivzDpLdBaSrzeBBemI@lists.infradead.org
X-Gm-Message-State: AOJu0YydGEcLsNGTljxgC4QAA0UXInbJ2ls5wbIaYgmrrh6W9B9h8j3R
	HvntiLdNqlPUTG5qJNLjt7MEaU9qH9/KYYFkkhpdWl9BwAIFwJxUlhNrukeQx9DC3XjIvFb4ojz
	p
X-Gm-Gg: ASbGncvAYArWJfcH0Sx8YxPj0R6KoQbP38+7x/77AEB+1YcwKEcrQncNamWAWynbH+x
	WZacEf/sFQOKhIZPtrphfF/uU3w5VD7m9rMEuHyMF2AhuG1OsxRVHHssF5p8nN5vu1B7cTpsQJ5
	bgEyspDrtMV/aP1wcUWmzK4vIgUtA9ExVrnyree1wPlhMhh1FduUJC3pOLsHDK76+bl6Vmw7rUO
	tPp8p3+Y9/CNwRpLmU0G32A5SYGpPpoEwXi27PquBywRtuYDXTal1qUNHO2XPFUS13TSUA=
X-Google-Smtp-Source: AGHT+IGQkcr1cTwSTvAF2YE99vpYPyDtXZhOFWe+GMekQEoYqOpL4CVdJ4pQ1l8pqB2eNnBi3aKDCg==
X-Received: by 2002:a05:6000:1f86:b0:38a:9118:c07f with SMTP id ffacd0b85a97d-38a9118c3b0mr7163744f8f.13.1736882854533;
        Tue, 14 Jan 2025 11:27:34 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e4c1b44sm15813124f8f.90.2025.01.14.11.27.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 11:27:33 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] coresight: Use str_enable_disable-like helpers
Date: Tue, 14 Jan 2025 20:27:30 +0100
Message-ID: <20250114192730.912515-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_192737_270687_9CDD9B67 
X-CRM114-Status: GOOD (  11.92  )
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

Replace ternary (condition ? "enable" : "disable") syntax with helpers
from string_choices.h because:
1. Simple function call with one argument is easier to read.  Ternary
   operator has three arguments and with wrapping might lead to quite
   long code.
2. Is slightly shorter thus also easier to read.
3. It brings uniformity in the text - same string.
4. Allows deduping by the linker, which results in a smaller binary
   file.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/hwtracing/coresight/coresight-config.c    | 3 ++-
 drivers/hwtracing/coresight/coresight-cpu-debug.c | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-config.c b/drivers/hwtracing/coresight/coresight-config.c
index 4723bf7402a2..d39887f22df5 100644
--- a/drivers/hwtracing/coresight/coresight-config.c
+++ b/drivers/hwtracing/coresight/coresight-config.c
@@ -4,6 +4,7 @@
  * Author: Mike Leach <mike.leach@linaro.org>
  */
 
+#include <linux/string_choices.h>
 #include <linux/sysfs.h>
 #include "coresight-config.h"
 #include "coresight-priv.h"
@@ -233,7 +234,7 @@ static int cscfg_prog_config(struct cscfg_config_csdev *config_csdev, bool enabl
 		feat_csdev = config_csdev->feats_csdev[i];
 		csdev = feat_csdev->csdev;
 		dev_dbg(&csdev->dev, "cfg %s;  %s feature:%s", config_csdev->config_desc->name,
-			enable ? "enable" : "disable", feat_csdev->feat_desc->name);
+			str_enable_disable(enable), feat_csdev->feat_desc->name);
 
 		if (enable)
 			err = cscfg_set_on_enable(feat_csdev);
diff --git a/drivers/hwtracing/coresight/coresight-cpu-debug.c b/drivers/hwtracing/coresight/coresight-cpu-debug.c
index 342c3aaf414d..d93d8d480e05 100644
--- a/drivers/hwtracing/coresight/coresight-cpu-debug.c
+++ b/drivers/hwtracing/coresight/coresight-cpu-debug.c
@@ -23,6 +23,7 @@
 #include <linux/pm_qos.h>
 #include <linux/slab.h>
 #include <linux/smp.h>
+#include <linux/string_choices.h>
 #include <linux/types.h>
 #include <linux/uaccess.h>
 
@@ -496,7 +497,7 @@ static ssize_t debug_func_knob_write(struct file *f,
 
 	if (ret) {
 		pr_err("%s: unable to %s debug function: %d\n",
-		       __func__, val ? "enable" : "disable", ret);
+		       __func__, str_enable_disable(val), ret);
 		goto err;
 	}
 
-- 
2.43.0


