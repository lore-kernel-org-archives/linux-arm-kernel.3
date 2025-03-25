Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACB12C35FFC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Mar 2025 12:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t0FL0/PaTjmurz0zokO5kHDNFvUG8fD8mEqSjB4BeZM=; b=vuFyRjnDT8ND22+McYmPRaXCfZ
	qPW6APuGSdJ6j0arjOuuzvfSRlBwhFKg1kfL9Q8yX60lXmpf3X0b/61NMn+2jQ2JKjO0Zk4jULaiT
	anILd1IXEIvF3dbKKq69sfZb9TpsM3vbzpmQOZ6jj76wG2P9xO1blCeWZtkqfcie1LMhRgaDvGnJ3
	38+njNEL/2vVGWcSHv9lRgd3kgtx/2Y1FJ2bf2C6u6UDtyAv0pwcjJ7tpkGmaaO8AAzTYr9zIKXuD
	ZVQvxZEqfy9oI2ZfRqEPV3DTIYqIRHJfV0Z5CUgs4j/lQaZlH5TitS9BzxCDgkn4aEZiJWsIs5gR4
	xrQ+M/ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx3CE-00000005lkG-3uFB;
	Tue, 25 Mar 2025 12:15:54 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx2w4-00000005iPj-0Yep
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Mar 2025 11:59:13 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-3913d129c1aso3930595f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Mar 2025 04:59:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742903950; x=1743508750; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t0FL0/PaTjmurz0zokO5kHDNFvUG8fD8mEqSjB4BeZM=;
        b=BGwrE8NNTO4mc3We8wXOF0rxy3vTBDI7FgVUkR79yIt+lWzxuMbsWuy/eLK9livh0M
         jIlNM+LDvctugIJjoISiToVxu9pMO16M4yWkTHGi0w0kYBYOR9yu2E/w0eeztJ9kq3IX
         zxG6xw3kXGvMkhjVo8iYddJAONFcPFoL8LZiW+xvlqGMdj9gn4URUclOnAx5cjhknWIS
         Yu4t8BwOEC7ZawBdXGzF+p6nnLeoYvaP+Lv8MPFlpW6fVIPsUu+A0Mj1YzwRYawHtuvx
         8pNurVfim+9tzyU8ZbzFvETTpko/7oYcyyupakHn6/vvto7xrMAGRpc5LGdcZFTOuGe8
         53dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742903950; x=1743508750;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t0FL0/PaTjmurz0zokO5kHDNFvUG8fD8mEqSjB4BeZM=;
        b=vDJV42aZLmSYPDT9yLJUtkncxmqsz+/NDwwtpCKbeHoeWb7I8NGtJaKsa/QqxSRMUv
         Q9a8Veus0iNpuqSg8r8eMdotjP0SHFvA9GTeD2F86Q3Nety5O/f646bqn+Zb2Bsuqp9J
         sSYwds+Axr4KWdMhEWpDGGBwvZ9DnetngEQsI0UrgkLqEinvRZTAAMkNmjJ2IAhErQOf
         UiPdhfj8+cfzMQXx5Ra0qNUahNtTqSA3g4V32Dt7fJ8iy8fngLvPSmKN3iKVt4Bn+0/L
         VVEkE1vByAKdmek+wvomcLuZqWxN6LDkOcvvRVtEjMHrVMIMge8xi7u2YDbYtgjFjQfW
         f6NQ==
X-Forwarded-Encrypted: i=1; AJvYcCXaNZC6ZLKrZn9DiAu8fDd1ZOs0GSmaqtDXAgVntHU6oHF1FMZKybYAJwIkYc+MZcbaROy+O37xtG33X/kHHCIo@lists.infradead.org
X-Gm-Message-State: AOJu0YxAYJ/lnJsJEE6tMAnnmee4S/NJqWCzH1lt8RZzzxE3T3mHfpSf
	7KPlniZn4cfgSMS6El4BO60g8vA+NjeHWINqHcVXHqnMTROvTQRbgoOzKo4U6bc=
X-Gm-Gg: ASbGnctF8RFT33fsrsvRgOoHnHkZUVxqiqp4JcLG9oPC+XDk+aGaUBmIMPnQ691fXY9
	5Rz/0Pp97rTgVF+mNHzSRHqKYW782I+LfH6geSGHCS3bgX+jHIK6kxi4w5W13sjlNBzsEymJFPO
	L0PUoEebvZV6zHgRPn2K5Xx2SxR7aHQACNpggRA9f/ehYk0RjzHm8HTDSZJVLtBjfuRKi0c5k5k
	AagAgeDFtsqKO2LkWTFN/hkSOFYBio9xuW3mqSKzRzefGsGHcjR6mZxkPM4MiSoaIdmRH599nZh
	2UbkTKHL0mDNVKS3fKXiIQanMc0bpdiULYF1lo3/2R53ro9h
X-Google-Smtp-Source: AGHT+IG3tFFjhnsevfyoCp/QXQOdkd5Zu53HGqNY8KPYQg06rSyA9f19GT+bUi/B/0Mkzk8vLILsEQ==
X-Received: by 2002:adf:e846:0:b0:390:f0ff:2c10 with SMTP id ffacd0b85a97d-39979586da2mr14592665f8f.19.1742903950371;
        Tue, 25 Mar 2025 04:59:10 -0700 (PDT)
Received: from [10.42.0.1] ([145.224.90.136])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9e6676sm13687169f8f.62.2025.03.25.04.59.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Mar 2025 04:59:09 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Tue, 25 Mar 2025 11:58:49 +0000
Subject: [PATCH v4 4/7] coresight: etm3x: Convert raw base pointer to
 struct coresight access
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250325-james-coresight-claim-tags-v4-4-dfbd3822b2e5@linaro.org>
References: <20250325-james-coresight-claim-tags-v4-0-dfbd3822b2e5@linaro.org>
In-Reply-To: <20250325-james-coresight-claim-tags-v4-0-dfbd3822b2e5@linaro.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Suzuki.Poulose@arm.com, 
 leo.yan@arm.com
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 Yeoreum Yun <yeoreum.yun@arm.com>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_045912_181936_6C7D0187 
X-CRM114-Status: GOOD (  15.35  )
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

This is so that etm3x can use the new claim tag functions which take a
csa pointer in a later commit.

Reviewed-by: Leo Yan <leo.yan@arm.com>
Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/hwtracing/coresight/coresight-etm.h        |  6 ++---
 drivers/hwtracing/coresight/coresight-etm3x-core.c | 27 +++++++++++-----------
 .../hwtracing/coresight/coresight-etm3x-sysfs.c    |  8 +++----
 3 files changed, 20 insertions(+), 21 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm.h b/drivers/hwtracing/coresight/coresight-etm.h
index 171f1384f7c0..1d753cca2943 100644
--- a/drivers/hwtracing/coresight/coresight-etm.h
+++ b/drivers/hwtracing/coresight/coresight-etm.h
@@ -229,7 +229,7 @@ struct etm_config {
  * @config:	structure holding configuration parameters.
  */
 struct etm_drvdata {
-	void __iomem			*base;
+	struct csdev_access		csa;
 	struct clk			*atclk;
 	struct coresight_device		*csdev;
 	spinlock_t			spinlock;
@@ -260,7 +260,7 @@ static inline void etm_writel(struct etm_drvdata *drvdata,
 				"invalid CP14 access to ETM reg: %#x", off);
 		}
 	} else {
-		writel_relaxed(val, drvdata->base + off);
+		writel_relaxed(val, drvdata->csa.base + off);
 	}
 }
 
@@ -274,7 +274,7 @@ static inline unsigned int etm_readl(struct etm_drvdata *drvdata, u32 off)
 				"invalid CP14 access to ETM reg: %#x", off);
 		}
 	} else {
-		val = readl_relaxed(drvdata->base + off);
+		val = readl_relaxed(drvdata->csa.base + off);
 	}
 
 	return val;
diff --git a/drivers/hwtracing/coresight/coresight-etm3x-core.c b/drivers/hwtracing/coresight/coresight-etm3x-core.c
index 8927bfaf3af2..cfd463ac715c 100644
--- a/drivers/hwtracing/coresight/coresight-etm3x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm3x-core.c
@@ -86,9 +86,9 @@ static void etm_set_pwrup(struct etm_drvdata *drvdata)
 {
 	u32 etmpdcr;
 
-	etmpdcr = readl_relaxed(drvdata->base + ETMPDCR);
+	etmpdcr = readl_relaxed(drvdata->csa.base + ETMPDCR);
 	etmpdcr |= ETMPDCR_PWD_UP;
-	writel_relaxed(etmpdcr, drvdata->base + ETMPDCR);
+	writel_relaxed(etmpdcr, drvdata->csa.base + ETMPDCR);
 	/* Ensure pwrup completes before subsequent cp14 accesses */
 	mb();
 	isb();
@@ -101,9 +101,9 @@ static void etm_clr_pwrup(struct etm_drvdata *drvdata)
 	/* Ensure pending cp14 accesses complete before clearing pwrup */
 	mb();
 	isb();
-	etmpdcr = readl_relaxed(drvdata->base + ETMPDCR);
+	etmpdcr = readl_relaxed(drvdata->csa.base + ETMPDCR);
 	etmpdcr &= ~ETMPDCR_PWD_UP;
-	writel_relaxed(etmpdcr, drvdata->base + ETMPDCR);
+	writel_relaxed(etmpdcr, drvdata->csa.base + ETMPDCR);
 }
 
 /**
@@ -365,7 +365,7 @@ static int etm_enable_hw(struct etm_drvdata *drvdata)
 	struct etm_config *config = &drvdata->config;
 	struct coresight_device *csdev = drvdata->csdev;
 
-	CS_UNLOCK(drvdata->base);
+	CS_UNLOCK(drvdata->csa.base);
 
 	rc = coresight_claim_device_unlocked(csdev);
 	if (rc)
@@ -427,7 +427,7 @@ static int etm_enable_hw(struct etm_drvdata *drvdata)
 	etm_clr_prog(drvdata);
 
 done:
-	CS_LOCK(drvdata->base);
+	CS_LOCK(drvdata->csa.base);
 
 	dev_dbg(&drvdata->csdev->dev, "cpu: %d enable smp call done: %d\n",
 		drvdata->cpu, rc);
@@ -549,7 +549,7 @@ static void etm_disable_hw(void *info)
 	struct etm_config *config = &drvdata->config;
 	struct coresight_device *csdev = drvdata->csdev;
 
-	CS_UNLOCK(drvdata->base);
+	CS_UNLOCK(drvdata->csa.base);
 	etm_set_prog(drvdata);
 
 	/* Read back sequencer and counters for post trace analysis */
@@ -561,7 +561,7 @@ static void etm_disable_hw(void *info)
 	etm_set_pwrdwn(drvdata);
 	coresight_disclaim_device_unlocked(csdev);
 
-	CS_LOCK(drvdata->base);
+	CS_LOCK(drvdata->csa.base);
 
 	dev_dbg(&drvdata->csdev->dev,
 		"cpu: %d disable smp call done\n", drvdata->cpu);
@@ -574,7 +574,7 @@ static void etm_disable_perf(struct coresight_device *csdev)
 	if (WARN_ON_ONCE(drvdata->cpu != smp_processor_id()))
 		return;
 
-	CS_UNLOCK(drvdata->base);
+	CS_UNLOCK(drvdata->csa.base);
 
 	/* Setting the prog bit disables tracing immediately */
 	etm_set_prog(drvdata);
@@ -586,7 +586,7 @@ static void etm_disable_perf(struct coresight_device *csdev)
 	etm_set_pwrdwn(drvdata);
 	coresight_disclaim_device_unlocked(csdev);
 
-	CS_LOCK(drvdata->base);
+	CS_LOCK(drvdata->csa.base);
 
 	/*
 	 * perf will release trace ids when _free_aux()
@@ -733,7 +733,7 @@ static void etm_init_arch_data(void *info)
 	/* Make sure all registers are accessible */
 	etm_os_unlock(drvdata);
 
-	CS_UNLOCK(drvdata->base);
+	CS_UNLOCK(drvdata->csa.base);
 
 	/* First dummy read */
 	(void)etm_readl(drvdata, ETMPDSR);
@@ -766,7 +766,7 @@ static void etm_init_arch_data(void *info)
 
 	etm_set_pwrdwn(drvdata);
 	etm_clr_pwrup(drvdata);
-	CS_LOCK(drvdata->base);
+	CS_LOCK(drvdata->csa.base);
 }
 
 static int __init etm_hp_setup(void)
@@ -827,8 +827,7 @@ static int etm_probe(struct amba_device *adev, const struct amba_id *id)
 	if (IS_ERR(base))
 		return PTR_ERR(base);
 
-	drvdata->base = base;
-	desc.access = CSDEV_ACCESS_IOMEM(base);
+	desc.access = drvdata->csa = CSDEV_ACCESS_IOMEM(base);
 
 	spin_lock_init(&drvdata->spinlock);
 
diff --git a/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c b/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c
index b9006451f515..762109307b86 100644
--- a/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c
+++ b/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c
@@ -50,11 +50,11 @@ static ssize_t etmsr_show(struct device *dev,
 
 	pm_runtime_get_sync(dev->parent);
 	spin_lock_irqsave(&drvdata->spinlock, flags);
-	CS_UNLOCK(drvdata->base);
+	CS_UNLOCK(drvdata->csa.base);
 
 	val = etm_readl(drvdata, ETMSR);
 
-	CS_LOCK(drvdata->base);
+	CS_LOCK(drvdata->csa.base);
 	spin_unlock_irqrestore(&drvdata->spinlock, flags);
 	pm_runtime_put(dev->parent);
 
@@ -949,9 +949,9 @@ static ssize_t seq_curr_state_show(struct device *dev,
 	pm_runtime_get_sync(dev->parent);
 	spin_lock_irqsave(&drvdata->spinlock, flags);
 
-	CS_UNLOCK(drvdata->base);
+	CS_UNLOCK(drvdata->csa.base);
 	val = (etm_readl(drvdata, ETMSQR) & ETM_SQR_MASK);
-	CS_LOCK(drvdata->base);
+	CS_LOCK(drvdata->csa.base);
 
 	spin_unlock_irqrestore(&drvdata->spinlock, flags);
 	pm_runtime_put(dev->parent);

-- 
2.34.1


