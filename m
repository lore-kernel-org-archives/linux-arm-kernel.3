Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02937C28B20
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Mar 2025 22:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NRoSmZerjcWNJMKApvxHU572E9gAzbyUGVwA014Um5g=; b=vveplus3rNhfD8uYhP0uX+o9qU
	NuT32hhfkcNMO1DboarCHe8E3jD47d7uzlRrJjIyqwB+a6QQbamS8IKqE3wZT9lwcTVnn5la2FG7x
	we1K5as1KA6a/T4ckMg301n2Arkd+/eNCYpD6j91kf9YvR5aLPWpNXLF4NEmei5ADpyfZQ45tTIO5
	7JutdSA3PjPpD8fekfCLjEhDJpV1rYk9IDgTlmqoyvsQ0jCrEgV+/daqOLSOD45+9XIRTTpg3jeQ9
	gCS7XZGpVWVyvCh0mflDjdtbfsFrKQFJXD65lwqVVtTBLS/YoWR2+o+SPqzGBPW0g2ClU7WIREWrJ
	ivNGbjAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyINM-0000000EQ7Z-3jte;
	Fri, 28 Mar 2025 22:40:32 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyILb-0000000EPr3-0p2F
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Mar 2025 22:38:44 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-2ff7cf599beso4707586a91.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Mar 2025 15:38:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743201522; x=1743806322; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=NRoSmZerjcWNJMKApvxHU572E9gAzbyUGVwA014Um5g=;
        b=2UGZDMThT284w55Pt43SfDXiUwbvMSgAVta+7n9390BQDN8vl+QdbhuSKOjZq4JfQO
         4+EdL6/sHO7ygosJM28Y283IUW3/+7Mk20vPB6nyJzSIZlTIpUbANMocs0dC7CcASsZc
         pzb5KDjIdLOyqEN8aFr6sEhy1X0XqfBwdp8mpfZLNPqNVs2uhWuApAqlNu2OltyLQd5h
         1EqKP96j14kU/4qEVGr3j6+B2Ulst9Xc7bTjQsWRLRpiKLgOW59eKz69MNuZK8c0gKw7
         2u6MdnASSTwUaz6Xj3Pyywv3Bov5rzFBkIaaBqk7Fgc85d4t4eulbvBlXB8AimoGyGcd
         MnfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743201522; x=1743806322;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NRoSmZerjcWNJMKApvxHU572E9gAzbyUGVwA014Um5g=;
        b=iKItbsxEElW6fImK7LWgmzM7V2+T9cCymKTQAVVu2LO2cNAhQcwgR/AneN+eu40lp2
         soF1I0U8PHB8v+HbBZLSy/z+5Zfq8lveRNMDK3zFm65kD5IzSGwLEyI79l7EwM+CLhOc
         iLHJB8E+gBEWz3ioOvMxgYV/0mfPU+VWny1lcY2LHPHQ0nObrwkKDlhXuMM/YQIz1J0K
         vL24U/M0YdexbURXDq38i8O/yYtLQkvwwPCvZpR7Nzvvv56tMk0p4MY9uyzcvPOBgpyk
         BnZ5UC/TMzbBdCcxGPxTfe3J8j+/xCOeYEQGTtANkRNU8RlIypp3KQsWThY0mAwMMJHC
         fg0Q==
X-Forwarded-Encrypted: i=1; AJvYcCW9k/PDw9pLLcERFqkfhQ8Zz8Ao+9SDNwGg9tc5V3dFJbfEUBH8lRVfPQGm/2aGeWdkTk5VVZ6FMsqairrdkfsG@lists.infradead.org
X-Gm-Message-State: AOJu0Yyw1UeL1AwQ41FyutHR/+2/nOkVjs8PEHZ9Q3X+bmXN2wUN4dp9
	XM03FCyLQ2WFDLptBWpXCUHNBYJAuhWDSHpeiQwAb4YPxN0ojnTcTKUngrBW+AFF+2n8cjsKfJY
	l
X-Google-Smtp-Source: AGHT+IGeQZV4YMlQxGu7ri71cw78XHpKeqc/l8mlvDEHbjUvRl4ijS7WcnHjYHx3fHp6/g82yZfeWhv+0gw=
X-Received: from pjbdb4.prod.google.com ([2002:a17:90a:d644:b0:2ef:8055:93d9])
 (user=yabinc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4b41:b0:2ee:ee77:227c
 with SMTP id 98e67ed59e1d1-30531f782c1mr1299876a91.3.1743201521746; Fri, 28
 Mar 2025 15:38:41 -0700 (PDT)
Date: Fri, 28 Mar 2025 15:38:37 -0700
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.472.ge94155a9ec-goog
Message-ID: <20250328223837.2314277-1-yabinc@google.com>
Subject: [PATCH] coresight: catu: Introduce refcount and spinlock for enabling/disabling
From: Yabin Cui <yabinc@google.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@linaro.org>, 
	James Clark <james.clark@linaro.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Yabin Cui <yabinc@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250328_153843_254324_1651072E 
X-CRM114-Status: GOOD (  19.15  )
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
---
 drivers/hwtracing/coresight/coresight-catu.c | 29 ++++++++++++++------
 drivers/hwtracing/coresight/coresight-catu.h |  1 +
 2 files changed, 22 insertions(+), 8 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-catu.c b/drivers/hwtracing/coresight/coresight-catu.c
index 275cc0d9f505..834a7ffbbdbc 100644
--- a/drivers/hwtracing/coresight/coresight-catu.c
+++ b/drivers/hwtracing/coresight/coresight-catu.c
@@ -458,12 +458,19 @@ static int catu_enable_hw(struct catu_drvdata *drvdata, enum cs_mode cs_mode,
 static int catu_enable(struct coresight_device *csdev, enum cs_mode mode,
 		       void *data)
 {
-	int rc;
+	int rc = 0;
+	unsigned long flags;
 	struct catu_drvdata *catu_drvdata = csdev_to_catu_drvdata(csdev);
 
-	CS_UNLOCK(catu_drvdata->base);
-	rc = catu_enable_hw(catu_drvdata, mode, data);
-	CS_LOCK(catu_drvdata->base);
+	spin_lock_irqsave(&catu_drvdata->spinlock, flags);
+	if (csdev->refcnt == 0) {
+		CS_UNLOCK(catu_drvdata->base);
+		rc = catu_enable_hw(catu_drvdata, mode, data);
+		CS_LOCK(catu_drvdata->base);
+	}
+	if (!rc)
+		csdev->refcnt++;
+	spin_unlock_irqrestore(&catu_drvdata->spinlock, flags);
 	return rc;
 }
 
@@ -486,12 +493,17 @@ static int catu_disable_hw(struct catu_drvdata *drvdata)
 
 static int catu_disable(struct coresight_device *csdev, void *__unused)
 {
-	int rc;
+	int rc = 0;
+	unsigned long flags;
 	struct catu_drvdata *catu_drvdata = csdev_to_catu_drvdata(csdev);
 
-	CS_UNLOCK(catu_drvdata->base);
-	rc = catu_disable_hw(catu_drvdata);
-	CS_LOCK(catu_drvdata->base);
+	spin_lock_irqsave(&catu_drvdata->spinlock, flags);
+	if (--csdev->refcnt == 0) {
+		CS_UNLOCK(catu_drvdata->base);
+		rc = catu_disable_hw(catu_drvdata);
+		CS_LOCK(catu_drvdata->base);
+	}
+	spin_unlock_irqrestore(&catu_drvdata->spinlock, flags);
 	return rc;
 }
 
@@ -550,6 +562,7 @@ static int __catu_probe(struct device *dev, struct resource *res)
 	dev->platform_data = pdata;
 
 	drvdata->base = base;
+	spin_lock_init(&drvdata->spinlock);
 	catu_desc.access = CSDEV_ACCESS_IOMEM(base);
 	catu_desc.pdata = pdata;
 	catu_desc.dev = dev;
diff --git a/drivers/hwtracing/coresight/coresight-catu.h b/drivers/hwtracing/coresight/coresight-catu.h
index 141feac1c14b..663282ec6381 100644
--- a/drivers/hwtracing/coresight/coresight-catu.h
+++ b/drivers/hwtracing/coresight/coresight-catu.h
@@ -65,6 +65,7 @@ struct catu_drvdata {
 	void __iomem *base;
 	struct coresight_device *csdev;
 	int irq;
+	spinlock_t spinlock;
 };
 
 #define CATU_REG32(name, offset)					\
-- 
2.49.0.472.ge94155a9ec-goog


