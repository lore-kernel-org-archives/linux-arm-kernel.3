Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11F12C36010
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 20:06:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OGOL9Pd6k9CF55B36skDPeiu4f1DCBf3D97J1ryfge0=; b=BYspBHKtJeh7d3TZU3cBlKgA7l
	7S/i5iAscRSq+5PR6na90E3efSImgpzqlr5/5lMEU2Dg4lDz7fER2dHZPfQQ82P23kU7V5cdITShi
	7hgfZKPANjBeUKh6CUEFVp/BNPz6f3UWa8kJ5bLVyeg/TnYDrkKdbdiKXaY5+rhfIQgVq/K/uhQP3
	qFKi7ROJvmiPxZezuLURutNylXnf1SS51QCMleX0hrX/jkpDyuZTAWGxmDNdILuhlE5O4fFgVpbyn
	v0RLQAGdJMqS4/kni4X40Eqpd49k9Z/boQHcrWPU8QLo9OHz1aZ99bNCilDtQovWl848oIGUPRG9r
	/yqOn7TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2FCz-00000005IkL-0k3H;
	Tue, 08 Apr 2025 20:06:09 +0000
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2F6y-00000005I9A-1be7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Apr 2025 19:59:57 +0000
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-af59547f55bso3564733a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Apr 2025 12:59:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744142395; x=1744747195; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=OGOL9Pd6k9CF55B36skDPeiu4f1DCBf3D97J1ryfge0=;
        b=h5VfeDwdzPxOu85aUQNJWFM8O5igZHa1XEf2Gd98ki3K1NDtj3elFCkGGhQtLRST6W
         UqJcxJ8l+YbSyT9+6yJpltPqORAbh3mjfqRgB30exHSqQzylDN5/ndsytxpGz+mJ5ueE
         9EkC+R6UD8QpRqS0BWg4vHs3C354EbVD9xpePy3tK1kXF8OVW2HEIc1X+YQY1G7onu6Y
         EW9aLUAkb++ob+cpmM0qPM8AsoB0/vwZb3/X12K1vGiFwNeolG7Ekzpn7CHlre4twzxg
         kspepP/mxnngAWgbbajucQVx6tMgtv5hz0eLiN4+sKusTgakabPYxXolV25fAytMVAwV
         C0mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744142395; x=1744747195;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OGOL9Pd6k9CF55B36skDPeiu4f1DCBf3D97J1ryfge0=;
        b=Q04lqacLRH5APRLXJExt5rWhC2ACwtJ1uo6suOZEn3ka0fo1eUMyn3G5m0PwuUWDLY
         559CrHeAwsx6gDNJp1lBu2A/jRkaF6+ZtC/+/vLY1p0lLZxz4RndW140B6mEwtw3tD3e
         La1LZ/bMQp6RKvnPKq1/3gqTQKAxV2v3NGego+srmM0GQNoCrDQItvMI5qaMfwZBGkSG
         sgRALxGibLUnPkCRoNfjeDpT1JqhoiZxSpdzHKQjHTdl8DnFUeVDlnREiOmMAALxB4ym
         1ajzAUmuYVMEjlqT8WfQW8JkXWLQrtqe1Ot+voKOkuqStqlXMmKtsYw5tP5M+fvZPUy8
         CXOg==
X-Forwarded-Encrypted: i=1; AJvYcCULpdWEazrXs66whfxZcSeGcXk0Gz9sIGAUo/nfuD2nOrUAdgZ/OTGzzlA9XWoqS71yJ+30ydfE7XqoEMrGmQHd@lists.infradead.org
X-Gm-Message-State: AOJu0YwQKu/M6Te76Lg2UPddM5d8T1gFUCeTq+Vco3KL2bDtkCpt1VDh
	kaMUineCqy/i25XwKouTkIjRG/bSZ0PkrObrACTero6RY1+23lFA3VtY4iKt8fjzgZTv6vtxgrO
	w
X-Google-Smtp-Source: AGHT+IE7TnlNx9bjwfIhkbEL6D7Vucr8oUw1PVFiQcKtOgd3cuck9+KyF9HLeNJHrK1+IjYCXP9NYIhrumE=
X-Received: from pgc4.prod.google.com ([2002:a05:6a02:2f84:b0:af9:9efd:c78f])
 (user=yabinc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:9003:b0:1f5:79c4:5da0
 with SMTP id adf61e73a8af0-201592b886amr372451637.31.1744142395143; Tue, 08
 Apr 2025 12:59:55 -0700 (PDT)
Date: Tue,  8 Apr 2025 12:59:21 -0700
In-Reply-To: <20250408195922.770377-1-yabinc@google.com>
Mime-Version: 1.0
References: <20250408195922.770377-1-yabinc@google.com>
X-Mailer: git-send-email 2.49.0.504.g3bcea36a83-goog
Message-ID: <20250408195922.770377-2-yabinc@google.com>
Subject: [PATCH v3 1/2] coresight: catu: Introduce refcount and spinlock for enabling/disabling
From: Yabin Cui <yabinc@google.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@linaro.org>, 
	James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>, 
	Jie Gan <quic_jiegan@quicinc.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Yabin Cui <yabinc@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_125956_422458_8C9DCBFB 
X-CRM114-Status: GOOD (  20.25  )
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
 drivers/hwtracing/coresight/coresight-catu.c | 25 +++++++++++++-------
 drivers/hwtracing/coresight/coresight-catu.h |  1 +
 2 files changed, 18 insertions(+), 8 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-catu.c b/drivers/hwtracing/coresight/coresight-catu.c
index fa170c966bc3..30b78b2f8adb 100644
--- a/drivers/hwtracing/coresight/coresight-catu.c
+++ b/drivers/hwtracing/coresight/coresight-catu.c
@@ -458,12 +458,17 @@ static int catu_enable_hw(struct catu_drvdata *drvdata, enum cs_mode cs_mode,
 static int catu_enable(struct coresight_device *csdev, enum cs_mode mode,
 		       void *data)
 {
-	int rc;
+	int rc = 0;
 	struct catu_drvdata *catu_drvdata = csdev_to_catu_drvdata(csdev);
+	guard(raw_spinlock_irqsave)(&catu_drvdata->spinlock);
 
-	CS_UNLOCK(catu_drvdata->base);
-	rc = catu_enable_hw(catu_drvdata, mode, data);
-	CS_LOCK(catu_drvdata->base);
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
+	guard(raw_spinlock_irqsave)(&catu_drvdata->spinlock);
 
-	CS_UNLOCK(catu_drvdata->base);
-	rc = catu_disable_hw(catu_drvdata);
-	CS_LOCK(catu_drvdata->base);
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
2.49.0.504.g3bcea36a83-goog


