Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AF17C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 23:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ptubX+4PRxSRuHNuaNIHmOvTzFtHE228lGkthuD+wwo=; b=R8v+bA+HcnhX/mCC6Q+9BzxUEO
	QhqY6vmsPaexnufuH4xNznvoFSGqKrpXcszei0kIYaC7e9UtjxZlIlfMh8rl+eXir7xSxlvtcY15G
	3JFB5QxgpUyIxqd6lGppfucQgsXtgn8fnkekhJ4o5ZlDnpG0yAiIVy+vSx/lu+4LeVlpspRffigb7
	FBDj1rlsOdYo6rJwWdLXc8x7PPu/ivFJYnbLjcTWDydeOu63R88EV4tQqFXRtg4CGwc+I0RLE/4uP
	1BXEspdVMfIEdU2ZGOxFCWLqdgsC6l8N1GJdi4+MhHm71ch+90NsnEqKjkhRNx8gHqgkIxI7pvkyp
	tN6brJWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9uCN-0000000B3JB-1jQU;
	Tue, 29 Apr 2025 23:17:11 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9u8b-0000000B2tP-2xbh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 23:13:18 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-2ff798e8c3bso5147388a91.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Apr 2025 16:13:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745968396; x=1746573196; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ptubX+4PRxSRuHNuaNIHmOvTzFtHE228lGkthuD+wwo=;
        b=HdE2BnNYGh3SyUspQnySmRMqO3/qaKpHoOypaB+iv5g8byDtCjADjQC59BDfPD8b0s
         VOyN4E6mWzu+75j2aloh5ueb2e6E/KXnHFNG3pVqqWD1r0u8UZkCWQj96WJT05sKK2ej
         2525a0OUa5DQ77GnBQQCB8E7sTPoEVBgyKhNAhtb00/XLJ2Y6EQigFkdFeS/zqrDNKNk
         HiKAfKqeAIjQRD/kyNF6ehHHwWYQd8GP3pU0UZkt+bP88GzA27PHcd087gPXsf9X/kqs
         DtCJamvrjqoCAbSIa9Rk0nsySSSlKIuBtB/tTik+f14GpEiF/T/usTIW0QpbBzkYKUtw
         AagQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745968396; x=1746573196;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ptubX+4PRxSRuHNuaNIHmOvTzFtHE228lGkthuD+wwo=;
        b=ZT1hJMZJ1913Sl5//nh+nmKTmgaDt2R8SLpjEpCX57cMa8eXWa4BoRIigTaYXW/nOv
         fH/4Ody1gKkMPM8Z8hk0sDy4qny9qN5MIKrzX4aoiyy9HRI2NK/Le25LHIu1GHQL2aUJ
         m1L+ZE2B79CqIAsSRwvl1NaqbXuBNuo51i76eLc+3ZemTVNpJix5hHu29qhFeVgSxL3I
         XtHmuAVfieEC1srZGTo5jIin5DcgIcrCFwrZAplZAux8MMagxbookgcujBohZvAmRUQl
         +qXnu5O2bNlxoeWSyUrDvUBflTfIYYIELcQDeeDiet2PWVt5sQp3RgN1ZsqynEwYDIY7
         6+7w==
X-Forwarded-Encrypted: i=1; AJvYcCXT0jEfGtlp3jB+TMQxODsqneyRzEKBv82bQ+DXpkht0WGrAPK/fp3gWrXTshGLYSizJg+ldK02/BT316vD7jMT@lists.infradead.org
X-Gm-Message-State: AOJu0YwgpTs+q3UW7FxPNSESOBI8Mt/qOphcdDO0Wiv1DiagxOzF0+qD
	5PTQoCuk/f34iG1s3MvdUfPpSNTVUOlWatzx5AsTMtacEMByEeeg8+XIi/WvchQEPQxUf8hoiGp
	K
X-Google-Smtp-Source: AGHT+IFm8fO/EOznOvJbdJCOyS53ir+LzZX/uOe6DyxtNcMywtrFZXZEtFx5N0SC/FKTCYw47Z0veO+X0js=
X-Received: from pjbpb12.prod.google.com ([2002:a17:90b:3c0c:b0:2ff:5df6:7e03])
 (user=yabinc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:5547:b0:2fe:dd2c:f8e7
 with SMTP id 98e67ed59e1d1-30a332e8d74mr1388130a91.10.1745968396064; Tue, 29
 Apr 2025 16:13:16 -0700 (PDT)
Date: Tue, 29 Apr 2025 16:12:59 -0700
In-Reply-To: <20250429231301.1952246-1-yabinc@google.com>
Mime-Version: 1.0
References: <20250429231301.1952246-1-yabinc@google.com>
X-Mailer: git-send-email 2.49.0.967.g6a0df3ecc3-goog
Message-ID: <20250429231301.1952246-2-yabinc@google.com>
Subject: [PATCH v5 1/2] coresight: catu: Introduce refcount and spinlock for enabling/disabling
From: Yabin Cui <yabinc@google.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@linaro.org>, 
	James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>, 
	Jie Gan <quic_jiegan@quicinc.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Yabin Cui <yabinc@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_161317_744614_C87566CF 
X-CRM114-Status: GOOD (  19.68  )
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

When tracing ETM data on multiple CPUs concurrently via the
perf interface, the CATU device is shared across different CPU
paths. This can lead to race conditions when multiple CPUs attempt
to enable or disable the CATU device simultaneously.

To address these race conditions, this patch introduces the
following changes:

1. The enable and disable operations for the CATU device are not
   reentrant. Therefore, a spinlock is added to ensure that only
   one CPU can enable or disable a given CATU device at any point
   in time.

2. A reference counter is used to manage the enable/disable state
   of the CATU device. The device is enabled when the first CPU
   requires it and is only disabled when the last CPU finishes
   using it. This ensures the device remains active as long as at
   least one CPU needs it.

Signed-off-by: Yabin Cui <yabinc@google.com>
Reviewed-by: James Clark <james.clark@linaro.org>
Reviewed-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-catu.c | 25 +++++++++++++-------
 drivers/hwtracing/coresight/coresight-catu.h |  1 +
 2 files changed, 18 insertions(+), 8 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-catu.c b/drivers/hwtracing/coresight/coresight-catu.c
index 96cb48b140af..d4e2e175e077 100644
--- a/drivers/hwtracing/coresight/coresight-catu.c
+++ b/drivers/hwtracing/coresight/coresight-catu.c
@@ -458,12 +458,17 @@ static int catu_enable_hw(struct catu_drvdata *drvdata, enum cs_mode cs_mode,
 static int catu_enable(struct coresight_device *csdev, enum cs_mode mode,
 		       void *data)
 {
-	int rc;
+	int rc = 0;
 	struct catu_drvdata *catu_drvdata = csdev_to_catu_drvdata(csdev);
 
-	CS_UNLOCK(catu_drvdata->base);
-	rc = catu_enable_hw(catu_drvdata, mode, data);
-	CS_LOCK(catu_drvdata->base);
+	guard(raw_spinlock_irqsave)(&catu_drvdata->spinlock);
+	if (csdev->refcnt == 0) {
+		CS_UNLOCK(catu_drvdata->base);
+		rc = catu_enable_hw(catu_drvdata, mode, data);
+		CS_LOCK(catu_drvdata->base);
+	}
+	if (!rc)
+		csdev->refcnt++;
 	return rc;
 }
 
@@ -486,12 +491,15 @@ static int catu_disable_hw(struct catu_drvdata *drvdata)
 
 static int catu_disable(struct coresight_device *csdev, void *__unused)
 {
-	int rc;
+	int rc = 0;
 	struct catu_drvdata *catu_drvdata = csdev_to_catu_drvdata(csdev);
 
-	CS_UNLOCK(catu_drvdata->base);
-	rc = catu_disable_hw(catu_drvdata);
-	CS_LOCK(catu_drvdata->base);
+	guard(raw_spinlock_irqsave)(&catu_drvdata->spinlock);
+	if (--csdev->refcnt == 0) {
+		CS_UNLOCK(catu_drvdata->base);
+		rc = catu_disable_hw(catu_drvdata);
+		CS_LOCK(catu_drvdata->base);
+	}
 	return rc;
 }
 
@@ -550,6 +558,7 @@ static int __catu_probe(struct device *dev, struct resource *res)
 	dev->platform_data = pdata;
 
 	drvdata->base = base;
+	raw_spin_lock_init(&drvdata->spinlock);
 	catu_desc.access = CSDEV_ACCESS_IOMEM(base);
 	catu_desc.pdata = pdata;
 	catu_desc.dev = dev;
diff --git a/drivers/hwtracing/coresight/coresight-catu.h b/drivers/hwtracing/coresight/coresight-catu.h
index 141feac1c14b..755776cd19c5 100644
--- a/drivers/hwtracing/coresight/coresight-catu.h
+++ b/drivers/hwtracing/coresight/coresight-catu.h
@@ -65,6 +65,7 @@ struct catu_drvdata {
 	void __iomem *base;
 	struct coresight_device *csdev;
 	int irq;
+	raw_spinlock_t spinlock;
 };
 
 #define CATU_REG32(name, offset)					\
-- 
2.49.0.967.g6a0df3ecc3-goog


