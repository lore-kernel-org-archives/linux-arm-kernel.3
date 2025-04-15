Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 226ADC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 18:55:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IegfUhI5gVIS8XkKPR5l9zWak8XwOvvgw8K+zjrd1EM=; b=b2jgT4evgSX24IHQk7oVphhE9z
	yjOUVWlQps39WgA0bD4orgiW5tEAtkDJplSB7FSouBnNb6Q2SjiYSPoKdSHQDUDUw5kVgYtQRSl5G
	QYKRK7CJNpJ4SiwkRq495DnYgkCVnKsd/W9FlPn4VLaU+CeAkU46dGhYRW2Qj5Fx7HFYZHKABQUEh
	xn80vPRl13TwVJg0lyv7BEr5KRLTsddmmwl9YvC46ZYwoQo/wqIbnlTco4+EA5pzG99VkmXrURzLt
	7F+wBQKRAK7WdJhbAOJKBey8tw+toQf8SSGBVoK/DSO2cLUcFzizl2GEgW7W/uf8c8/cewXm3ccp4
	9XiYGnbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4lR3-00000006n58-2dup;
	Tue, 15 Apr 2025 18:55:05 +0000
Received: from mail-oo1-xc49.google.com ([2607:f8b0:4864:20::c49])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4lJD-00000006lJ3-2fYY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Apr 2025 18:47:00 +0000
Received: by mail-oo1-xc49.google.com with SMTP id 006d021491bc7-6049e1c6629so720712eaf.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Apr 2025 11:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744742818; x=1745347618; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=IegfUhI5gVIS8XkKPR5l9zWak8XwOvvgw8K+zjrd1EM=;
        b=L/4/3PVGzHNvZ4EaLcD13SLNBa5H6uhimcA9gbxObqAP6ey1QSP0Yods48hZyVZPPN
         UlZVarzgpIuoAuWkIpkFLO2LmWvguSwFDXMgPRmZHiupF+bOeRMzTyHY8wlBZilBptLG
         31czHhDNyOFYTxi1pqmrzsE7/JdU2/utmTzi/3d/c0CO7E/aFNtLiW2070SBLGaykgMx
         /T0Lkzv1+F89vyCAuIXOcfhMQaF0381Hvg4Z/ZD/8FfmWe3HVRbFr14bY/slv812ny3g
         bDeHAO8Nl0QCZ+HmcpF8/hw5sdk2YhoVrcv70Te3Ou2+lYUAUnGpEoI65fVpF60xMlgt
         dWGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744742818; x=1745347618;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IegfUhI5gVIS8XkKPR5l9zWak8XwOvvgw8K+zjrd1EM=;
        b=uC4l1quHtM57uvK1MecrkU2gsTWgDFZeb3SF05uXqjCsJ13B35JXAGHkWhX0eU4FDC
         6ZF6JsQhrOidTCIkhwe+ks6lGqBjiqgC9juLQOtxeoDVp3JUiDHtU6Eieq590bzzjfhv
         YD4Yb5de2//SXl3ln+jD1WoqMEZ4qqrqEUQaoq0B3OHBtQ4IsLYpnwn5CD2Tt/fsxq7D
         jpI4RsB4ddMYGv4vyCLFN1ClhxK2XptNcv/q2CDMFLqx1Mkc5YpkBvxqx5Rmk36M07gH
         S+9OoW9ot5zn4q3m/ClhoCWWFoK3iDmyz2t0vzi6DLJEoDa7QIYgm+/pT6QqvZyzHMX9
         5+Zw==
X-Forwarded-Encrypted: i=1; AJvYcCVuuN3CrAA83+P/jTtFJtV9StyBgq+bTdAbBLZk4WfneId4fN1gwKpZVVT2LgF3ioIjnmpyP0XPDJy0mriovSSu@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0Usa2IcterPDcWWVu5EoZsPd1S910dV3Hq2fnjcaTLV+nrEWp
	yIiD6H6PSPx3hO+tyt388w7Q3tpc1aSbKQdCF5ZVh8dXiJllcTpmf2X1JCBzGkKb0TinYzvoLcO
	2
X-Google-Smtp-Source: AGHT+IEQi8PNtHVcRy7LuBEXq5xHg4BzdFcTSBuGvgAfDtsQNpuwbpRyY+zu7kia13Vkit4PH+1HBu9PL1E=
X-Received: from oabqw7.prod.google.com ([2002:a05:6870:6f07:b0:2b8:e401:9c8d])
 (user=yabinc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6870:e05:b0:2c2:343d:1368
 with SMTP id 586e51a60fabf-2d4c3eaca2dmr192919fac.29.1744742817901; Tue, 15
 Apr 2025 11:46:57 -0700 (PDT)
Date: Tue, 15 Apr 2025 11:46:48 -0700
In-Reply-To: <20250415184649.356683-1-yabinc@google.com>
Mime-Version: 1.0
References: <20250415184649.356683-1-yabinc@google.com>
X-Mailer: git-send-email 2.49.0.604.gff1f9ca942-goog
Message-ID: <20250415184649.356683-2-yabinc@google.com>
Subject: [PATCH v4 1/2] coresight: catu: Introduce refcount and spinlock for enabling/disabling
From: Yabin Cui <yabinc@google.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@linaro.org>, 
	James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>, 
	Jie Gan <quic_jiegan@quicinc.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Yabin Cui <yabinc@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_114659_671779_00850AE4 
X-CRM114-Status: GOOD (  20.39  )
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
index fa170c966bc3..3909b562b077 100644
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
2.49.0.604.gff1f9ca942-goog


