Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 687CAC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 16:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WRSIoJtQEht7L+lhpKZdRykVgJI6cMPKCHCjNInEcQk=; b=vt11wfr0cZPaEvKY3q4PIMpe0d
	mB/Lz+obrRP5Nb/3Ih0QzVyus5MIe8PDIxelgkYvSXPMmoUFzVpmsL/M94S0DCqMK2aUcFScZH9ys
	L6OVfuS92J5HhyrPaXEK5wAFMzTIfBov0kJPf//NJpzaBYk2IesfcxwePcFnZQP3rk1I2OlI7UN6Y
	an6xqN1AjnUCb8Iej8He6udACEbn75xo/LTqYNNy7uvGndd4TLC9S8rLB1hHihDXascPCKP417vYW
	M2QrrLROCqTnUfPqpuwoRdqqd+r+8Zv0vZSUuSoF4tHGjXJ22R3+uBYmyypJjGmitxDM6nHPjLfjU
	8ThOtPmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuZrz-00000006Xyx-0VX6;
	Tue, 18 Mar 2025 16:32:47 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuZi4-00000006Vrv-008e
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Mar 2025 16:22:33 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-390f5f48eafso3779372f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Mar 2025 09:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742314951; x=1742919751; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WRSIoJtQEht7L+lhpKZdRykVgJI6cMPKCHCjNInEcQk=;
        b=PxR0dXtNuXmHxXZDTySmpCG9jFAPmmSe/OYaK5Uz6y+9BoWkLAeHHgq693o0bu206j
         kMlL6RKfSQwQK74Pb+jy7RCyeet7K2KwGTeeBirP16DNCMVvFAHibK7sisdTpK589X+M
         YbtWcztFIhiGehvkQlLRRJkwJrPX6MHrSWpPyKk0OUZQu4yX5zGNHJ2YeUTJxITYVhFY
         tEhKD0vKWy+GW9hsFsjE1nitgtvyYh+jMOFrKPEBnO+H4X9NHZMqvjNt5AHKTdGiDycC
         6/dOGgx9iz9QGJiC/MmixyMnSXc6Lc5sr5lcQX6EDlX+sxetcCAbyeBY2Ar4uzII2ykA
         H/rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742314951; x=1742919751;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WRSIoJtQEht7L+lhpKZdRykVgJI6cMPKCHCjNInEcQk=;
        b=InQuYIy2qJAez5nHczYaZ+YkOohrzVKkIfwH+EBgzk5VepFwkXDMAHR7YrgrlJ0U1h
         tAVT2/doCymgRFJ/3T4JlmKZFmBTSlwo1dVuGFgFxVGI5xxf2EaAFryIBpPATWjgFOt6
         24cdVXevbdV6yej1XtnD413eKDc2sq3+0NvoPO5rixqFn2FqdnfVmWcFqpE8NP1p0Hlx
         jc7qa2fSmZKtOLi52VzqPXFgP4kW7MRV/E4+sSrJgoYrm0g48Xaaq2sosS+P8jUD/R9J
         vICUYjHmWD3pbsZ8isnD32tE0W78DNXZm7IZit6WPAbF20K5v3ukdPUXGf0geabi18DF
         95dg==
X-Forwarded-Encrypted: i=1; AJvYcCV9jMxi88hoRKQ/4Vyv7zWb/m96Z4jWZr/gi56SIvBh1Tk95Wmg8agtk47B0i2BtvzF6BTR2CbkBZ48w/s1zega@lists.infradead.org
X-Gm-Message-State: AOJu0YzUtmgxr/YDeHrUJ5zqc0jKSChumpsFNFzo0hypMmbuL9DtboQm
	z62f0/1I35R4CCzXIxVXOmtvgEJZI6rGba9Qf1Y0D5EtIjT3Qyxm0RSJqkor/q8=
X-Gm-Gg: ASbGncuD0u4knsC7Nrne/ktvPwAbXS+RYPQau41ehaCdxJemohDEJ5/BRgfjnkQYJfl
	l6mSv77cTFDg/lnql5RAQ1Hg5hU/p6DiKQysLDcfpF6lYCnc4+H4XFzuB9Ez1HmELbx3LjIwE/N
	yu26pHLoHpFxU5Bg3glBpAxsG4k9v1u2YVjnLEy1jhOXR/7rZgb4GOfDvy97Ow9Au6kCWQLuHts
	GpomHmnZoUHx3p5hL7ltauf3aJ2OamRJuAAR9ykOdSuRJ/Fo+SUGOBNHtq0BMh/l/BlbrJUEU7P
	iHeJTD6QFph76DLHB+wI6G/fAf+RPs5ILDSuP/5BT+UvlkXuvwr4eFFpWA==
X-Google-Smtp-Source: AGHT+IE9oZFsPwz083sEIt1xLxpkaeWDmU244cuNkbu74PheoYY6+y+/eO82rufHd0nZQ7vu7yeTIQ==
X-Received: by 2002:a5d:5f95:0:b0:38d:dffc:c133 with SMTP id ffacd0b85a97d-3996b49984dmr3916452f8f.44.1742314950657;
        Tue, 18 Mar 2025 09:22:30 -0700 (PDT)
Received: from pop-os.lan ([145.224.67.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395c8975ae2sm18914732f8f.51.2025.03.18.09.22.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 09:22:30 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Tue, 18 Mar 2025 16:21:59 +0000
Subject: [PATCH v2 5/8] coresight: etm3x: Convert raw base pointer to
 struct coresight access
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250318-james-coresight-claim-tags-v2-5-e9c8a9cde84e@linaro.org>
References: <20250318-james-coresight-claim-tags-v2-0-e9c8a9cde84e@linaro.org>
In-Reply-To: <20250318-james-coresight-claim-tags-v2-0-e9c8a9cde84e@linaro.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Suzuki.Poulose@arm.com, 
 leo.yan@arm.com
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_092232_065561_8D7A2CEC 
X-CRM114-Status: GOOD (  15.21  )
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


