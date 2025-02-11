Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99A7CC0219B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 11:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2zZ0OrtQMgfnUz7Pqgs5oe7tlQZDOHSDEQQYtTNC+PI=; b=E782obnLouykFsfk0caeWlfniQ
	3Nk4Lr77De6s3t64piuzLfAVlqZ1J7FEI80SYlrdOPgCMhaiD3Tq/YK7jmWUBlBJccbn3rXFAjKz1
	4fKqL/27Hq85zSVm9u+I5hD7muj1bG9vVcdrwhlDNYYwCJQZmWz4G04gTywt1s73cFDJ52K1qxhJ/
	VaHFAGdmqLTZTLPsaHq7xztPTL+sVKyUR8ryGYZBb5I49wnGDzvYW2T054Fb+CFncGa5IZlNJkLon
	BQQd+VEBBZYqrotxarbCdoCiSpW9We1ztSZe+JimKe1AOWfTT1lT0PZLrS60CJia8eBCF9mxjmQkB
	yJKN1glg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thort-00000003f7B-0pYN;
	Tue, 11 Feb 2025 11:55:57 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thngx-00000003NtF-47iE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 10:40:37 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4361e89b6daso37010905e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Feb 2025 02:40:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739270434; x=1739875234; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2zZ0OrtQMgfnUz7Pqgs5oe7tlQZDOHSDEQQYtTNC+PI=;
        b=GHVEN29U1V6yJJOeiRCCfqgUpIkpBjcJ2Ay0kmJWVtmUgiYM0JYxCAqm6MMKfIqmJo
         q1nNcIZJZbS8NpapVvSQtirRHpiGfBG6jmFlnzcIz+nJb6Y8iR9rEWsRqbnNTCYGofDq
         dqBVkkOnC6igtcDPSlgLTNqdweQ083l8P1tvuK6xz6uS4Hh6wGiNjTcdMcyDkmxPckTo
         aLtmfpwGliL9iVn7dHNzTDZb5hrLzS0Wk5Z/Md/P7q93tUoPS1CH5TfNdoe3VKpUUMdu
         GLYPS7jWhXvuWNaAd6tyOqR9PELDOzPHANaeOK1/sqTLll5Eq8y6peyaXkbMPxt+PdTn
         decg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739270434; x=1739875234;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2zZ0OrtQMgfnUz7Pqgs5oe7tlQZDOHSDEQQYtTNC+PI=;
        b=nb3rHfMFzpejOHSwmgwcjrJ7c4eZ6FdOluKpOY1lTLo2+sOJ8BQyDhDpIoqHt36+qH
         sYDn39dcWN68moX71Ou+chwd2KccIaZjw8J3WHminGFKpB8qZf/CI/6RbsfBQdsU/gG0
         RlYBJBmrRJRbGPpBC6yhK7dlPzg4556Y/bw+MVwadcXD643QKLgOYrMrrM1fnXWGuxvn
         vBoWiWEf9/++XhsFLEsVAPEAAXHwU9Jxd4jyWb6WL4K7VKTnXFS5N+K5SJRuZ5voCy9H
         A5Dpex6qPZhECpPsIQUERfDskMQuTQF85ppHKaYeFVyrtSW2h3P3CMzkkErkiicVECzQ
         /k+A==
X-Forwarded-Encrypted: i=1; AJvYcCXdE+5E9PS9yABEhIMTQm2ugwAoLy4pIGD8HY5MlCwJiE6ZZNY16RnboV3wqHMBAVDZqo0UCiwUiHCfMxE7LTcW@lists.infradead.org
X-Gm-Message-State: AOJu0YwAmBEC/9p+400PcYxGKscxpUHtfZ/26MGUxzblbInsHcm4BOqw
	p10xJzn3Br7qEknjHA0CrkTp4earC0p1utTq/Ttaz6hchX7KQ+tX1m5XUqf2lzc=
X-Gm-Gg: ASbGncszQNS3EMAmfGdz3/7pb9t/wZ7hu3fUFmXi9T8NPRPwnaUn2BsjAYbPCYTKVpV
	0OM7GF9OmUw2D0kEZYqtql9+YBCAtIgHWi6p/C7M0gn1liEZhckJakrHSFJohlYFc/9RGh+u/72
	iFKCazYoX/uT2X4c4atE6DP/r8B3M+9rauO0XrmUuVFVGExFbTvgF+V6Ej7/fTHPf+k4wxru98T
	QyovEZZpxvZZa04mXlJaXZzqf4B4raAK+HDFMLJH0zAoT0k43UsXzzMAHlLADYZL7UicNcjT9v/
	YRBljTpPU8jT
X-Google-Smtp-Source: AGHT+IG1QC0ZJB8Dsyjrd4BKscl8IOtVtmsqNcKjSxhkXZoFddZatFd1vyjkzTkufMPdlU+5dsOvHQ==
X-Received: by 2002:a05:600c:5494:b0:439:5016:3867 with SMTP id 5b1f17b1804b1-43950163b9amr16347735e9.23.1739270433358;
        Tue, 11 Feb 2025 02:40:33 -0800 (PST)
Received: from pop-os.. ([145.224.65.3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dd02e2a90sm10456047f8f.98.2025.02.11.02.40.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 02:40:33 -0800 (PST)
From: James Clark <james.clark@linaro.org>
To: lcherian@marvell.com,
	coresight@lists.linaro.org
Cc: James Clark <james.clark@linaro.org>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH 2/7] coresight: Convert disclaim functions to take a struct cs_access
Date: Tue, 11 Feb 2025 10:39:38 +0000
Message-Id: <20250211103945.967495-3-james.clark@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250211103945.967495-1-james.clark@linaro.org>
References: <20250211103945.967495-1-james.clark@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_024036_023714_37A8842D 
X-CRM114-Status: GOOD (  19.43  )
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

The self hosted claim tag will be reset on device probe in a later
commit. We'll want to do this before coresight_register() is called so
won't have a coresight_device and have to use cs_access instead.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/hwtracing/coresight/coresight-catu.c  |  2 +-
 drivers/hwtracing/coresight/coresight-core.c  | 45 ++++++++-----------
 .../hwtracing/coresight/coresight-cti-core.c  |  6 +--
 drivers/hwtracing/coresight/coresight-etb10.c |  2 +-
 .../coresight/coresight-etm3x-core.c          |  4 +-
 .../coresight/coresight-etm4x-core.c          |  2 +-
 .../hwtracing/coresight/coresight-funnel.c    |  2 +-
 .../coresight/coresight-replicator.c          |  4 +-
 .../hwtracing/coresight/coresight-tmc-etf.c   |  8 ++--
 .../hwtracing/coresight/coresight-tmc-etr.c   |  4 +-
 include/linux/coresight.h                     |  4 +-
 11 files changed, 38 insertions(+), 45 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-catu.c b/drivers/hwtracing/coresight/coresight-catu.c
index 275cc0d9f505..d9259c0b6e64 100644
--- a/drivers/hwtracing/coresight/coresight-catu.c
+++ b/drivers/hwtracing/coresight/coresight-catu.c
@@ -474,7 +474,7 @@ static int catu_disable_hw(struct catu_drvdata *drvdata)
 	struct coresight_device *csdev = drvdata->csdev;
 
 	catu_write_control(drvdata, 0);
-	coresight_disclaim_device_unlocked(csdev);
+	coresight_disclaim_device_unlocked(&csdev->access);
 	if (catu_wait_for_ready(drvdata)) {
 		dev_info(dev, "Timeout while waiting for READY\n");
 		rc = -EAGAIN;
diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index 523dbb381f90..a669872b4118 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -127,31 +127,31 @@ coresight_find_out_connection(struct coresight_device *csdev,
 	return ERR_PTR(-ENODEV);
 }
 
-static inline u32 coresight_read_claim_tags(struct coresight_device *csdev)
+static inline u32 coresight_read_claim_tags(struct csdev_access *csa)
 {
-	return csdev_access_relaxed_read32(&csdev->access, CORESIGHT_CLAIMCLR);
+	return csdev_access_relaxed_read32(csa, CORESIGHT_CLAIMCLR);
 }
 
-static inline bool coresight_is_claimed_self_hosted(struct coresight_device *csdev)
+static inline bool coresight_is_claimed_self_hosted(struct csdev_access *csa)
 {
-	return coresight_read_claim_tags(csdev) == CORESIGHT_CLAIM_SELF_HOSTED;
+	return coresight_read_claim_tags(csa) == CORESIGHT_CLAIM_SELF_HOSTED;
 }
 
 static inline bool coresight_is_claimed_any(struct coresight_device *csdev)
 {
-	return coresight_read_claim_tags(csdev) != 0;
+	return coresight_read_claim_tags(&csdev->access) != 0;
 }
 
-static inline void coresight_set_self_claim_tag(struct coresight_device *csdev)
+static inline void coresight_set_self_claim_tag(struct csdev_access *csa)
 {
-	csdev_access_relaxed_write32(&csdev->access, CORESIGHT_CLAIM_SELF_HOSTED,
+	csdev_access_relaxed_write32(csa, CORESIGHT_CLAIM_SELF_HOSTED,
 				     CORESIGHT_CLAIMSET);
 	isb();
 }
 
-static inline void coresight_clear_self_claim_tag(struct coresight_device *csdev)
+static inline void coresight_clear_self_claim_tag(struct csdev_access *csa)
 {
-	csdev_access_relaxed_write32(&csdev->access, CORESIGHT_CLAIM_SELF_HOSTED,
+	csdev_access_relaxed_write32(csa, CORESIGHT_CLAIM_SELF_HOSTED,
 				     CORESIGHT_CLAIMCLR);
 	isb();
 }
@@ -174,11 +174,11 @@ int coresight_claim_device_unlocked(struct coresight_device *csdev)
 	if (coresight_is_claimed_any(csdev))
 		return -EBUSY;
 
-	coresight_set_self_claim_tag(csdev);
-	if (coresight_is_claimed_self_hosted(csdev))
+	coresight_set_self_claim_tag(&csdev->access);
+	if (coresight_is_claimed_self_hosted(&csdev->access))
 		return 0;
 	/* There was a race setting the tag, clean up and fail */
-	coresight_clear_self_claim_tag(csdev);
+	coresight_clear_self_claim_tag(&csdev->access);
 	return -EBUSY;
 }
 EXPORT_SYMBOL_GPL(coresight_claim_device_unlocked);
@@ -202,14 +202,10 @@ EXPORT_SYMBOL_GPL(coresight_claim_device);
  * coresight_disclaim_device_unlocked : Clear the claim tag for the device.
  * Called with CS_UNLOCKed for the component.
  */
-void coresight_disclaim_device_unlocked(struct coresight_device *csdev)
+void coresight_disclaim_device_unlocked(struct csdev_access *csa)
 {
-
-	if (WARN_ON(!csdev))
-		return;
-
-	if (coresight_is_claimed_self_hosted(csdev))
-		coresight_clear_self_claim_tag(csdev);
+	if (coresight_is_claimed_self_hosted(csa))
+		coresight_clear_self_claim_tag(csa);
 	else
 		/*
 		 * The external agent may have not honoured our claim
@@ -220,14 +216,11 @@ void coresight_disclaim_device_unlocked(struct coresight_device *csdev)
 }
 EXPORT_SYMBOL_GPL(coresight_disclaim_device_unlocked);
 
-void coresight_disclaim_device(struct coresight_device *csdev)
+void coresight_disclaim_device(struct csdev_access *csa)
 {
-	if (WARN_ON(!csdev))
-		return;
-
-	CS_UNLOCK(csdev->access.base);
-	coresight_disclaim_device_unlocked(csdev);
-	CS_LOCK(csdev->access.base);
+	CS_UNLOCK(csa->base);
+	coresight_disclaim_device_unlocked(csa);
+	CS_LOCK(csa->base);
 }
 EXPORT_SYMBOL_GPL(coresight_disclaim_device);
 
diff --git a/drivers/hwtracing/coresight/coresight-cti-core.c b/drivers/hwtracing/coresight/coresight-cti-core.c
index d2b5a5718c29..073f67a41af9 100644
--- a/drivers/hwtracing/coresight/coresight-cti-core.c
+++ b/drivers/hwtracing/coresight/coresight-cti-core.c
@@ -175,7 +175,7 @@ static int cti_disable_hw(struct cti_drvdata *drvdata)
 	writel_relaxed(0, drvdata->base + CTICONTROL);
 	config->hw_enabled = false;
 
-	coresight_disclaim_device_unlocked(csdev);
+	coresight_disclaim_device_unlocked(&csdev->access);
 	CS_LOCK(drvdata->base);
 	spin_unlock(&drvdata->spinlock);
 	return ret;
@@ -683,7 +683,7 @@ static int cti_cpu_pm_notify(struct notifier_block *nb, unsigned long cmd,
 		/* CTI regs all static - we have a copy & nothing to save */
 		drvdata->config.hw_powered = false;
 		if (drvdata->config.hw_enabled)
-			coresight_disclaim_device(csdev);
+			coresight_disclaim_device(&csdev->access);
 		break;
 
 	case CPU_PM_ENTER_FAILED:
@@ -746,7 +746,7 @@ static int cti_dying_cpu(unsigned int cpu)
 	spin_lock(&drvdata->spinlock);
 	drvdata->config.hw_powered = false;
 	if (drvdata->config.hw_enabled)
-		coresight_disclaim_device(drvdata->csdev);
+		coresight_disclaim_device(&drvdata->csdev->access);
 	spin_unlock(&drvdata->spinlock);
 	return 0;
 }
diff --git a/drivers/hwtracing/coresight/coresight-etb10.c b/drivers/hwtracing/coresight/coresight-etb10.c
index aea9ac9c4bd0..d8bc3e776c88 100644
--- a/drivers/hwtracing/coresight/coresight-etb10.c
+++ b/drivers/hwtracing/coresight/coresight-etb10.c
@@ -344,7 +344,7 @@ static void etb_disable_hw(struct etb_drvdata *drvdata)
 {
 	__etb_disable_hw(drvdata);
 	etb_dump_hw(drvdata);
-	coresight_disclaim_device(drvdata->csdev);
+	coresight_disclaim_device(&drvdata->csdev->access);
 }
 
 static int etb_disable(struct coresight_device *csdev)
diff --git a/drivers/hwtracing/coresight/coresight-etm3x-core.c b/drivers/hwtracing/coresight/coresight-etm3x-core.c
index c103f4c70f5d..509f53b69e42 100644
--- a/drivers/hwtracing/coresight/coresight-etm3x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm3x-core.c
@@ -599,7 +599,7 @@ static void etm_disable_hw(void *info)
 		config->cntr_val[i] = etm_readl(drvdata, ETMCNTVRn(i));
 
 	etm_set_pwrdwn(drvdata);
-	coresight_disclaim_device_unlocked(csdev);
+	coresight_disclaim_device_unlocked(&csdev->access);
 
 	CS_LOCK(drvdata->base);
 
@@ -624,7 +624,7 @@ static void etm_disable_perf(struct coresight_device *csdev)
 	 * power down the tracer.
 	 */
 	etm_set_pwrdwn(drvdata);
-	coresight_disclaim_device_unlocked(csdev);
+	coresight_disclaim_device_unlocked(&csdev->access);
 
 	CS_LOCK(drvdata->base);
 
diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index dd8c74f893db..45b30a4b3eba 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -922,7 +922,7 @@ static void etm4_disable_hw(void *info)
 			etm4x_relaxed_read32(csa, TRCCNTVRn(i));
 	}
 
-	coresight_disclaim_device_unlocked(csdev);
+	coresight_disclaim_device_unlocked(&csdev->access);
 	etm4_cs_lock(drvdata, csa);
 
 	dev_dbg(&drvdata->csdev->dev,
diff --git a/drivers/hwtracing/coresight/coresight-funnel.c b/drivers/hwtracing/coresight/coresight-funnel.c
index 8faf51469bb8..e986922d555b 100644
--- a/drivers/hwtracing/coresight/coresight-funnel.c
+++ b/drivers/hwtracing/coresight/coresight-funnel.c
@@ -116,7 +116,7 @@ static void dynamic_funnel_disable_hw(struct funnel_drvdata *drvdata,
 
 	/* Disclaim the device if none of the slaves are now active */
 	if (!(functl & FUNNEL_ENSx_MASK))
-		coresight_disclaim_device_unlocked(csdev);
+		coresight_disclaim_device_unlocked(&csdev->access);
 
 	CS_LOCK(drvdata->base);
 }
diff --git a/drivers/hwtracing/coresight/coresight-replicator.c b/drivers/hwtracing/coresight/coresight-replicator.c
index a1181c9048c0..5d42a9a8c460 100644
--- a/drivers/hwtracing/coresight/coresight-replicator.c
+++ b/drivers/hwtracing/coresight/coresight-replicator.c
@@ -54,7 +54,7 @@ static void dynamic_replicator_reset(struct replicator_drvdata *drvdata)
 	if (!coresight_claim_device_unlocked(csdev)) {
 		writel_relaxed(0xff, drvdata->base + REPLICATOR_IDFILTER0);
 		writel_relaxed(0xff, drvdata->base + REPLICATOR_IDFILTER1);
-		coresight_disclaim_device_unlocked(csdev);
+		coresight_disclaim_device_unlocked(&csdev->access);
 	}
 
 	CS_LOCK(drvdata->base);
@@ -167,7 +167,7 @@ static void dynamic_replicator_disable(struct replicator_drvdata *drvdata,
 
 	if ((readl_relaxed(drvdata->base + REPLICATOR_IDFILTER0) == 0xff) &&
 	    (readl_relaxed(drvdata->base + REPLICATOR_IDFILTER1) == 0xff))
-		coresight_disclaim_device_unlocked(csdev);
+		coresight_disclaim_device_unlocked(&csdev->access);
 	CS_LOCK(drvdata->base);
 }
 
diff --git a/drivers/hwtracing/coresight/coresight-tmc-etf.c b/drivers/hwtracing/coresight/coresight-tmc-etf.c
index d4f641cd9de6..1e4d874a8448 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etf.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etf.c
@@ -53,7 +53,7 @@ static int tmc_etb_enable_hw(struct tmc_drvdata *drvdata)
 
 	rc = __tmc_etb_enable_hw(drvdata);
 	if (rc)
-		coresight_disclaim_device(drvdata->csdev);
+		coresight_disclaim_device(&drvdata->csdev->access);
 	return rc;
 }
 
@@ -99,7 +99,7 @@ static void __tmc_etb_disable_hw(struct tmc_drvdata *drvdata)
 static void tmc_etb_disable_hw(struct tmc_drvdata *drvdata)
 {
 	__tmc_etb_disable_hw(drvdata);
-	coresight_disclaim_device(drvdata->csdev);
+	coresight_disclaim_device(&drvdata->csdev->access);
 }
 
 static int __tmc_etf_enable_hw(struct tmc_drvdata *drvdata)
@@ -136,7 +136,7 @@ static int tmc_etf_enable_hw(struct tmc_drvdata *drvdata)
 
 	rc = __tmc_etf_enable_hw(drvdata);
 	if (rc)
-		coresight_disclaim_device(drvdata->csdev);
+		coresight_disclaim_device(&drvdata->csdev->access);
 	return rc;
 }
 
@@ -148,7 +148,7 @@ static void tmc_etf_disable_hw(struct tmc_drvdata *drvdata)
 
 	tmc_flush_and_stop(drvdata);
 	tmc_disable_hw(drvdata);
-	coresight_disclaim_device_unlocked(csdev);
+	coresight_disclaim_device_unlocked(&csdev->access);
 	CS_LOCK(drvdata->base);
 }
 
diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
index a48bb85d0e7f..7ba4f79191de 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
@@ -1066,7 +1066,7 @@ static int tmc_etr_enable_hw(struct tmc_drvdata *drvdata,
 		rc = __tmc_etr_enable_hw(drvdata);
 		if (rc) {
 			drvdata->etr_buf = NULL;
-			coresight_disclaim_device(drvdata->csdev);
+			coresight_disclaim_device(&drvdata->csdev->access);
 		}
 	}
 
@@ -1156,7 +1156,7 @@ static void __tmc_etr_disable_hw(struct tmc_drvdata *drvdata)
 void tmc_etr_disable_hw(struct tmc_drvdata *drvdata)
 {
 	__tmc_etr_disable_hw(drvdata);
-	coresight_disclaim_device(drvdata->csdev);
+	coresight_disclaim_device(&drvdata->csdev->access);
 	/* Reset the ETR buf used by hardware */
 	drvdata->etr_buf = NULL;
 }
diff --git a/include/linux/coresight.h b/include/linux/coresight.h
index 17276965ff1d..937931d107e0 100644
--- a/include/linux/coresight.h
+++ b/include/linux/coresight.h
@@ -653,8 +653,8 @@ extern int coresight_timeout(struct csdev_access *csa, u32 offset,
 extern int coresight_claim_device(struct coresight_device *csdev);
 extern int coresight_claim_device_unlocked(struct coresight_device *csdev);
 
-extern void coresight_disclaim_device(struct coresight_device *csdev);
-extern void coresight_disclaim_device_unlocked(struct coresight_device *csdev);
+extern void coresight_disclaim_device(struct csdev_access *csa);
+extern void coresight_disclaim_device_unlocked(struct csdev_access *csa);
 extern char *coresight_alloc_device_name(struct coresight_dev_list *devs,
 					 struct device *dev);
 
-- 
2.34.1


