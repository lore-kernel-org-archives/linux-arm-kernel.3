Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 416E3FC5913
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 09:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WLMGzJnkeatTSpm4GRVispmO8RSWnefXR7FySJtxYVw=; b=kPNyGyJK44jaIrIFXZCsh2zdoM
	rehArbP0yp421sXUdOyvv6JHm7+GNj45C8xx+8m+etEn4sbGe9dT7JtY1ZETiRHrHVp2zAFwqoZy7
	NpYdsqYNAAKtUMLLY4IxIazMuxWDx2de5BCRi1lp4W2YSpDwaH6ofKkpHF+rhoEsHYuwl6iXGBIre
	Vm15MLXzeJhiuTQe5BIDE21Q5mA/HiDAzKZDG9ViyI1RIfAQBFDxPK+BAQ1l9nuvLO+9vde+EGaLv
	Nm0MKK/ToN3HnybRQZ1wBRyRkWPzWT2qgRlkleBgEdztifbPjHZpFcHAEVZla1FoyUeyZZXQ29BkL
	9R75peKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvXbd-00000005n5n-1Mpa;
	Thu, 26 Feb 2026 09:24:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvXbS-00000005mxq-1Jpw
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 26 Feb 2026 09:24:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=WLMGzJnkeatTSpm4GRVispmO8RSWnefXR7FySJtxYVw=; b=mOdzFvk5POVeJZocDCVmEaVSnv
	UhOXpA42JC+2kN2xGJnKxqKCDheL1UOnawYvBS6sSKqh/+ESzTzapmTOUlxTjNsmROKrUKi6Zn4dm
	dI0XX19ukh/uAQ3VSoFiEOyaqK913IWZxWQ9I3FiaJR1THCLsvYaJtHS9UDVR1r6++1VMkpH/ZNwE
	1N7Heq5n0xCd82JxkdKi3cHM6UhNjqGCHNcL2jaMXO4oVxiiUx32J1jKEk8gTnu6A069k3CjxywcB
	7rQqDcuCiP/u9oiiF+bTr6b2sCjkFk/Wdw7QmWgV2xuAz6TsSu6jchcHPXJ8qCdeCd4hlZ68efqOt
	+gODWzUg==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvXbP-0000000AbV7-0raW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 09:24:13 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0A2C91516;
	Thu, 26 Feb 2026 01:24:04 -0800 (PST)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 76F243F62B;
	Thu, 26 Feb 2026 01:24:08 -0800 (PST)
From: Leo Yan <leo.yan@arm.com>
Date: Thu, 26 Feb 2026 09:23:53 +0000
Subject: [PATCH v2 5/8] coresight: cti: Rename cti_active() to
 cti_is_active()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260226-arm_coresight_cti_refactor_v1-v2-5-b30fada3cfec@arm.com>
References: <20260226-arm_coresight_cti_refactor_v1-v2-0-b30fada3cfec@arm.com>
In-Reply-To: <20260226-arm_coresight_cti_refactor_v1-v2-0-b30fada3cfec@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Tingwei Zhang <quic_tingwei@quicinc.com>, 
 Yingchao Deng <yingchao.deng@oss.qualcomm.com>, 
 Jie Gan <jie.gan@oss.qualcomm.com>, Yabin Cui <yabinc@google.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772097837; l=4970;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=LKf0+zIOAvFxqwOjIyBxQWi1rV+ios78mbayLWnkfbE=;
 b=7jHHz9JREV2rs03Tnvu6TEp76RCmoMPIYDGMmji9pat3YQh+teFeOagTiTVewSKoChSoazFcC
 GH8f/+RulT2AXBwjj/j79QWu41Ld+79a6ma67JwHrAgkQjQlM8YPapv
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_092411_747994_6FDA2C6B 
X-CRM114-Status: GOOD (  13.42  )
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

Reviewed-by: Mike Leach <mike.leach@arm.com>
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-cti-core.c  |  8 ++++----
 drivers/hwtracing/coresight/coresight-cti-sysfs.c | 14 +++++++-------
 drivers/hwtracing/coresight/coresight-cti.h       |  2 +-
 3 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-cti-core.c b/drivers/hwtracing/coresight/coresight-cti-core.c
index 3aa081f28a18dc4987feeb57244aa384e80702ac..28f995263433c8727a7fdeff94fbe0a4286767e8 100644
--- a/drivers/hwtracing/coresight/coresight-cti-core.c
+++ b/drivers/hwtracing/coresight/coresight-cti-core.c
@@ -155,7 +155,7 @@ void cti_write_intack(struct device *dev, u32 ackval)
 	guard(raw_spinlock_irqsave)(&drvdata->spinlock);
 
 	/* write if enabled */
-	if (cti_active(config))
+	if (cti_is_active(config))
 		cti_write_single_reg(drvdata, CTIINTACK, ackval);
 }
 
@@ -342,7 +342,7 @@ int cti_channel_trig_op(struct device *dev, enum cti_chan_op op,
 		config->ctiouten[trigger_idx] = reg_value;
 
 	/* write through if enabled */
-	if (cti_active(config))
+	if (cti_is_active(config))
 		cti_write_single_reg(drvdata, reg_offset, reg_value);
 
 	return 0;
@@ -380,7 +380,7 @@ int cti_channel_gate_op(struct device *dev, enum cti_chan_gate_op op,
 	}
 	if (err == 0) {
 		config->ctigate = reg_value;
-		if (cti_active(config))
+		if (cti_is_active(config))
 			cti_write_single_reg(drvdata, CTIGATE, reg_value);
 	}
 
@@ -429,7 +429,7 @@ int cti_channel_setop(struct device *dev, enum cti_chan_set_op op,
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
index a4b3968d8d3d19a20604fb09db14cf41962f5a79..2edc0d01812c93fe5a817da366a2862b8490c0a3 100644
--- a/drivers/hwtracing/coresight/coresight-cti.h
+++ b/drivers/hwtracing/coresight/coresight-cti.h
@@ -236,7 +236,7 @@ coresight_cti_get_platform_data(struct device *dev);
 const char *cti_plat_get_node_name(struct fwnode_handle *fwnode);
 
 /* cti powered and enabled */
-static inline bool cti_active(struct cti_config *cfg)
+static inline bool cti_is_active(struct cti_config *cfg)
 {
 	return cfg->hw_powered && cfg->hw_enabled;
 }

-- 
2.34.1


