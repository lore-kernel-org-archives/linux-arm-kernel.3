Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40FAFC36010
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Apr 2025 01:23:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wptZ3tNfETWSP5KmatzEV9b0isyJtCFqvayiJ7W6mUQ=; b=Di/xXPOGDlcOFYBNH7b6oYdBca
	HVgyX+cBbo7Gg5KWohECNWgXVCppGEDeQ2ryzFvZkID3IxGaIEtZmUQpjnUSBIggxTHMJ4ZopAKJy
	7jNm9lwo9uHJm1CWmZ94vW7ZswZRJhPckCPni1bKeBAzzqfyxfchaTZbHvEmtYOHTYn8d55/bUVZv
	gNqtSmBW3ac3apYoG6wQaw+PpdJ2kEmREaUyaeiWi2UyWmRiOzgb69u9flmb0Rvt7btVtK/QRl80P
	Ks7yuXg9AxujEEil8XovJE0r/Lj/RTtx06wPfCDQ2hL1QQf85/sbLz+yWf22ndovZ/9/m1qWxYvfX
	Li6rkHoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzmoj-00000004pYm-2fst;
	Wed, 02 Apr 2025 01:22:57 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzmlW-00000004p57-0oTT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Apr 2025 01:19:39 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-2ff68033070so10415070a91.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Apr 2025 18:19:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743556777; x=1744161577; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=wptZ3tNfETWSP5KmatzEV9b0isyJtCFqvayiJ7W6mUQ=;
        b=vgMTqJ72J1q6YAplrWmw9T/LWWsUzt2lKV0K2jGJiJs3BYsnvzWXXwz+nnCz+jPOn7
         7heRpnECAiVP42nSl0df1aIF5fYW2SDR78WUmPLu6P6F0esVtqkFe27RS3pI1AqZWdIP
         uQ+lQuqIxlzg0j7/FFW9N3XxQV2MmKtBuQ6+Q4nSKufKr2sPgr6b7EhwQiIwkrkJZZQK
         9WJ+/S7Ke9XEXR98MtsijgTy8veJcEz57AfloqrR/1adkKcgpXXARZ5KAwYm76Saf9kV
         IkR0yGjGeU96sMxcL8hBn/af9zDvVkvslS4LMIzdnsQPPNEOyWwzAhLj+ulTEFeszfww
         5khQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743556777; x=1744161577;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wptZ3tNfETWSP5KmatzEV9b0isyJtCFqvayiJ7W6mUQ=;
        b=Xna6R8z7YA2HjLTeKeiTnSawCXAiNAqe4aGF8cyson9v2EF7AktzmF2zuKHlbfWnRt
         eFKRBZAZ++fQVhU3gAvEUjqr5CYdVy7VuBJvh57NVZPwQ6WnJEfZHgUmgeo2ZrsDP3iN
         Y7w91mVpEc2+2M5xzSAWEYH65LuSqhOIJHouLdmrFHRKYkuM3S90IX3dDJk6PUZYxCAC
         mBGqfK7pqMtOcEj3OJ2k8dZ+vCqPzyzf29R3ABvYWtbsneCazM2jLC6PVw6xgm11A5zR
         lsPav8/WAuH6pC1C3307mg1JeZk5jFA/1bRExomF0AS1HaYaE8UGupb/CP749iGi+0j6
         2liA==
X-Forwarded-Encrypted: i=1; AJvYcCVuG7qyq+5sIWC02xKGEmf74wiM1TamKujCIFy4ju6Ks4PF8pzbrIWEfm2wNWAHjffvAzW1yRgyFNE0LHQCVmrU@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5/WR1fPPsbQnqmEKcboVvnf92BIdZo5z6h87MDYp3v8bMHvYw
	wanXP9mr58lsrGJXrIs5TuRlDqHYai+4cLpc5r6v2nenlcxb0X70vGeNR5s6rSL8Swj6jwDBkwH
	W
X-Google-Smtp-Source: AGHT+IFhUbws0ZJvMef3veFQxaSe4aJtMLCMuoVX0WIkPdjismgC1ZQ/waL+Ou51y9waTjtiUX0U/6YkFjw=
X-Received: from pjbdj15.prod.google.com ([2002:a17:90a:d2cf:b0:2ff:611c:bae8])
 (user=yabinc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2807:b0:2ee:d371:3227
 with SMTP id 98e67ed59e1d1-305608aa9b7mr9144422a91.17.1743556777029; Tue, 01
 Apr 2025 18:19:37 -0700 (PDT)
Date: Tue,  1 Apr 2025 18:18:30 -0700
In-Reply-To: <20250402011832.2970072-1-yabinc@google.com>
Mime-Version: 1.0
References: <20250402011832.2970072-1-yabinc@google.com>
X-Mailer: git-send-email 2.49.0.472.ge94155a9ec-goog
Message-ID: <20250402011832.2970072-2-yabinc@google.com>
Subject: [PATCH v2 1/3] coresight: catu: Introduce refcount and spinlock for enabling/disabling
From: Yabin Cui <yabinc@google.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@linaro.org>, 
	James Clark <james.clark@linaro.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Yabin Cui <yabinc@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_181938_231214_9379FB09 
X-CRM114-Status: GOOD (  20.63  )
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
 drivers/hwtracing/coresight/coresight-catu.c | 27 ++++++++++++++------
 drivers/hwtracing/coresight/coresight-catu.h |  1 +
 2 files changed, 20 insertions(+), 8 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-catu.c b/drivers/hwtracing/coresight/coresight-catu.c
index fa170c966bc3..b1d490dd7249 100644
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
 
@@ -486,12 +491,17 @@ static int catu_disable_hw(struct catu_drvdata *drvdata)
 
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
+	} else {
+		rc = -EBUSY;
+	}
 	return rc;
 }
 
@@ -550,6 +560,7 @@ static int __catu_probe(struct device *dev, struct resource *res)
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
2.49.0.472.ge94155a9ec-goog


