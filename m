Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 589EBE7E0BC
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Feb 2026 18:01:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cw0KsSSzrmpcOuoSxQXv0tOF5VcQhvHq5oTgK/pkOeg=; b=Bl3MX9m4RLMVyordGlvRYMAoGK
	9t52qWcrEIULtrbRXKoNPD45EY7+bmDki+ShgAt0KVDDvOsOvY8AdpgM0N7Rh9xvqEckOwuHv5aoA
	IGxMCi1u7l5Zj+ShIAMN+J5cccZ43X67diPrAzdBnDNAZWEjn1x6CbzUJYD1yCaDuD2nRB4ogiwgW
	QTFsFRIVa9dxpPdgrB80cYBIyOfIFobArsLkVfiqL00SHXbuEFv8QeyJyOxitBEOOQwlXcQGLtVCT
	BEhtjSVo8Dz7lVk4KvNZGAcLueGGDVs/EuRwslmARg3MCj6YxCTZ8ExsCkw7PhonTJVjPSZ+6Zwwn
	sziExSnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpVZt-0000000FoyI-44jI;
	Mon, 09 Feb 2026 18:01:41 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpVZr-0000000Fow5-2ZnV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Feb 2026 18:01:40 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1BA0A497;
	Mon,  9 Feb 2026 10:01:32 -0800 (PST)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6AA563F63F;
	Mon,  9 Feb 2026 10:01:36 -0800 (PST)
From: Leo Yan <leo.yan@arm.com>
Date: Mon, 09 Feb 2026 18:01:15 +0000
Subject: [PATCH 5/8] coresight: cti: Rename cti_active() to cti_is_active()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260209-arm_coresight_cti_refactor_v1-v1-5-db71ab4d200b@arm.com>
References: <20260209-arm_coresight_cti_refactor_v1-v1-0-db71ab4d200b@arm.com>
In-Reply-To: <20260209-arm_coresight_cti_refactor_v1-v1-0-db71ab4d200b@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Tingwei Zhang <quic_tingwei@quicinc.com>, 
 Yingchao Deng <yingchao.deng@oss.qualcomm.com>, 
 Jie Gan <jie.gan@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770660084; l=4924;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=mbk3E3j7k4OfZjCxykO4M67npdEg7jSt6l7f6PV18Cc=;
 b=Aam9+PdKMhoJhnypGkL+htXLTGYhgacKGjzoEFOPX2mDeAHHq1jpyjRYft2AdjEWg6whR873B
 09TDhJLC+ZtBmqXCPtjMp++TOCrrBEulu4CPE2MQGU8DPujmVgSCTSQ
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_100139_741050_05EE66BE 
X-CRM114-Status: GOOD (  13.25  )
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

Rename cti_active() to cti_is_active() to clarify that it checks whether
the CTI device is active.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-cti-core.c  |  8 ++++----
 drivers/hwtracing/coresight/coresight-cti-sysfs.c | 14 +++++++-------
 drivers/hwtracing/coresight/coresight-cti.h       |  2 +-
 3 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-cti-core.c b/drivers/hwtracing/coresight/coresight-cti-core.c
index 3becef607e5ec5225cb6fd616da804903651fdf1..48db87e2fd0f1a669f2d20a0014108da215e26fd 100644
--- a/drivers/hwtracing/coresight/coresight-cti-core.c
+++ b/drivers/hwtracing/coresight/coresight-cti-core.c
@@ -164,7 +164,7 @@ void cti_write_intack(struct device *dev, u32 ackval)
 	guard(raw_spinlock_irqsave)(&drvdata->spinlock);
 
 	/* write if enabled */
-	if (cti_active(config))
+	if (cti_is_active(config))
 		cti_write_single_reg(drvdata, CTIINTACK, ackval);
 }
 
@@ -351,7 +351,7 @@ int cti_channel_trig_op(struct device *dev, enum cti_chan_op op,
 		config->ctiouten[trigger_idx] = reg_value;
 
 	/* write through if enabled */
-	if (cti_active(config))
+	if (cti_is_active(config))
 		cti_write_single_reg(drvdata, reg_offset, reg_value);
 
 	return 0;
@@ -389,7 +389,7 @@ int cti_channel_gate_op(struct device *dev, enum cti_chan_gate_op op,
 	}
 	if (err == 0) {
 		config->ctigate = reg_value;
-		if (cti_active(config))
+		if (cti_is_active(config))
 			cti_write_single_reg(drvdata, CTIGATE, reg_value);
 	}
 
@@ -438,7 +438,7 @@ int cti_channel_setop(struct device *dev, enum cti_chan_set_op op,
 		break;
 	}
 
-	if ((err == 0) && cti_active(config))
+	if ((err == 0) && cti_is_active(config))
 		cti_write_single_reg(drvdata, reg_offset, reg_value);
 
 	return err;
diff --git a/drivers/hwtracing/coresight/coresight-cti-sysfs.c b/drivers/hwtracing/coresight/coresight-cti-sysfs.c
index c15a580f6e90f57b1376e0b883a27700966feb1a..a22cc9a2bee24eb6115e7adb61880cc86d03e12e 100644
--- a/drivers/hwtracing/coresight/coresight-cti-sysfs.c
+++ b/drivers/hwtracing/coresight/coresight-cti-sysfs.c
@@ -268,7 +268,7 @@ static ssize_t cti_reg32_show(struct device *dev, char *buf,
 	struct cti_config *config = &drvdata->config;
 
 	scoped_guard(raw_spinlock_irqsave, &drvdata->spinlock) {
-		if ((reg_offset >= 0) && cti_active(config)) {
+		if ((reg_offset >= 0) && cti_is_active(config)) {
 			val = cti_read_single_reg(drvdata, reg_offset);
 			if (pcached_val)
 				*pcached_val = val;
@@ -301,7 +301,7 @@ static ssize_t cti_reg32_store(struct device *dev, const char *buf,
 			*pcached_val = (u32)val;
 
 		/* write through if offset and enabled */
-		if ((reg_offset >= 0) && cti_active(config))
+		if ((reg_offset >= 0) && cti_is_active(config))
 			cti_write_single_reg(drvdata, reg_offset, val);
 	}
 
@@ -393,7 +393,7 @@ static ssize_t inen_store(struct device *dev,
 	config->ctiinen[index] = val;
 
 	/* write through if enabled */
-	if (cti_active(config))
+	if (cti_is_active(config))
 		cti_write_single_reg(drvdata, CTIINEN(index), val);
 
 	return size;
@@ -434,7 +434,7 @@ static ssize_t outen_store(struct device *dev,
 	config->ctiouten[index] = val;
 
 	/* write through if enabled */
-	if (cti_active(config))
+	if (cti_is_active(config))
 		cti_write_single_reg(drvdata, CTIOUTEN(index), val);
 
 	return size;
@@ -476,7 +476,7 @@ static ssize_t appclear_store(struct device *dev,
 	config->ctiappset &= ~val;
 
 	/* write through if enabled */
-	if (cti_active(config))
+	if (cti_is_active(config))
 		cti_write_single_reg(drvdata, CTIAPPCLEAR, val);
 
 	return size;
@@ -497,7 +497,7 @@ static ssize_t apppulse_store(struct device *dev,
 	guard(raw_spinlock_irqsave)(&drvdata->spinlock);
 
 	/* write through if enabled */
-	if (cti_active(config))
+	if (cti_is_active(config))
 		cti_write_single_reg(drvdata, CTIAPPPULSE, val);
 
 	return size;
@@ -763,7 +763,7 @@ static ssize_t chan_xtrigs_reset_store(struct device *dev,
 	config->xtrig_rchan_sel = 0;
 
 	/* if enabled then write through */
-	if (cti_active(config))
+	if (cti_is_active(config))
 		cti_write_all_hw_regs(drvdata);
 
 	return size;
diff --git a/drivers/hwtracing/coresight/coresight-cti.h b/drivers/hwtracing/coresight/coresight-cti.h
index 7a3e7f806dcb093e504f1aacb3b29564bea28f6c..400c1545b22bfe631144d24faceb354ff2d49166 100644
--- a/drivers/hwtracing/coresight/coresight-cti.h
+++ b/drivers/hwtracing/coresight/coresight-cti.h
@@ -238,7 +238,7 @@ coresight_cti_get_platform_data(struct device *dev);
 const char *cti_plat_get_node_name(struct fwnode_handle *fwnode);
 
 /* cti powered and enabled */
-static inline bool cti_active(struct cti_config *cfg)
+static inline bool cti_is_active(struct cti_config *cfg)
 {
 	return cfg->hw_powered && cfg->hw_enabled;
 }

-- 
2.34.1


