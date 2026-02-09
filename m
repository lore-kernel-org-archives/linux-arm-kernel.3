Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9C9EE7E0D0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Feb 2026 18:01:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=psCERV1hUM4TIted93KONDFrzmoFNdPb+xZz2LxgixE=; b=PYb46EvhKKKep7Si9aaGRha3s8
	nIeu6t4W9m7fl6gBU5oWBbw+7dBcr6VLeP9K4Yz5jsghly57vVDQudkinYfJxADCNXoSLWJlGy6Uh
	X9NTvvwSobe+EqnfRS4+Ah+7BcK652mO41UU4NHn9+h9ETmlOgzoxX7OSMHLGV2GJjbE+/Ts1yQlf
	V+wWEfmt2dgl85OQOYJifj1MwI9aS9NHIHajJ9FpBNjCYB4KIilsIyR15Fzicdm/h0tFqFZwCG1tr
	DbQEBdz1vpQ3KJQT24ugp5EhLmVsfdKla7MW7FP8niWJBHSfnTxEZUMLsI4Tfq42R0Ld3xCKSX+YM
	jsTpAjYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpVZm-0000000Fosx-2EXY;
	Mon, 09 Feb 2026 18:01:34 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpVZk-0000000ForX-1BS8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Feb 2026 18:01:33 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0D6EB339;
	Mon,  9 Feb 2026 10:01:25 -0800 (PST)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5CB013F63F;
	Mon,  9 Feb 2026 10:01:29 -0800 (PST)
From: Leo Yan <leo.yan@arm.com>
Date: Mon, 09 Feb 2026 18:01:12 +0000
Subject: [PATCH 2/8] coresight: cti: Fix register reads
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260209-arm_coresight_cti_refactor_v1-v1-2-db71ab4d200b@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770660084; l=3343;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=MmL1URcwSUi9s8DaYJ9zEXDeNVy5rQonnGX5BHDL32k=;
 b=FlgQ1fPEMtZ4BJSYrgeP4Oz+PEYD4rvQptmY/aTfEL4W3qmu9jIuuihQxOQKwc4f7r2d/ogWr
 EfWoF4Irhw1BWsSj2iwSGz50UgERgkFXrrbYc1GnUIc5mkXsr8XO8lD
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_100132_456117_B66673A8 
X-CRM114-Status: GOOD (  11.54  )
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

Introduce cti_read_single_reg() as an interface for reading registers
with unlocking the CS lock.  Consolidate register read in sysfs
interfaces using this new helper.

Fixes: b5213376c240 ("coresight: cti: Add sysfs access to program function registers")
Fixes: 1a556ca6cc24 ("coresight: cti: Add sysfs coresight mgmt register access")
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-cti-core.c  | 11 +++++++++++
 drivers/hwtracing/coresight/coresight-cti-sysfs.c |  6 ++----
 drivers/hwtracing/coresight/coresight-cti.h       |  1 +
 3 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-cti-core.c b/drivers/hwtracing/coresight/coresight-cti-core.c
index b75c4ec2c8d5d58da8761334643dba34001b48c7..2d8b1cbe5bf5c9ce0383dc90335f0085b22a7f61 100644
--- a/drivers/hwtracing/coresight/coresight-cti-core.c
+++ b/drivers/hwtracing/coresight/coresight-cti-core.c
@@ -165,6 +165,17 @@ static int cti_disable_hw(struct cti_drvdata *drvdata)
 	return 0;
 }
 
+u32 cti_read_single_reg(struct cti_drvdata *drvdata, int offset)
+{
+	int val;
+
+	CS_UNLOCK(drvdata->base);
+	val = readl_relaxed(drvdata->base + offset);
+	CS_LOCK(drvdata->base);
+
+	return val;
+}
+
 void cti_write_single_reg(struct cti_drvdata *drvdata, int offset, u32 value)
 {
 	CS_UNLOCK(drvdata->base);
diff --git a/drivers/hwtracing/coresight/coresight-cti-sysfs.c b/drivers/hwtracing/coresight/coresight-cti-sysfs.c
index 455d08bcccd49a3f1eac8abd8246806ef73a9ab6..9a997b2f090472761e9734fffc534663df8b06c6 100644
--- a/drivers/hwtracing/coresight/coresight-cti-sysfs.c
+++ b/drivers/hwtracing/coresight/coresight-cti-sysfs.c
@@ -183,7 +183,7 @@ static ssize_t coresight_cti_reg_show(struct device *dev,
 
 	scoped_guard(raw_spinlock_irqsave, &drvdata->spinlock) {
 		if (drvdata->config.hw_powered)
-			val = readl_relaxed(drvdata->base + cti_attr->off);
+			val = cti_read_single_reg(drvdata, cti_attr->off);
 	}
 
 	pm_runtime_put_sync(dev->parent);
@@ -269,11 +269,9 @@ static ssize_t cti_reg32_show(struct device *dev, char *buf,
 
 	scoped_guard(raw_spinlock_irqsave, &drvdata->spinlock) {
 		if ((reg_offset >= 0) && cti_active(config)) {
-			CS_UNLOCK(drvdata->base);
-			val = readl_relaxed(drvdata->base + reg_offset);
+			val = cti_read_single_reg(drvdata, reg_offset);
 			if (pcached_val)
 				*pcached_val = val;
-			CS_LOCK(drvdata->base);
 		} else if (pcached_val) {
 			val = *pcached_val;
 		}
diff --git a/drivers/hwtracing/coresight/coresight-cti.h b/drivers/hwtracing/coresight/coresight-cti.h
index 4f89091ee93f5fb046d93b97a4085051fca6b39d..64f7324f098e8b5f90c6554e3872e3bf01988717 100644
--- a/drivers/hwtracing/coresight/coresight-cti.h
+++ b/drivers/hwtracing/coresight/coresight-cti.h
@@ -222,6 +222,7 @@ int cti_disable(struct coresight_device *csdev, struct coresight_path *path);
 void cti_write_all_hw_regs(struct cti_drvdata *drvdata);
 void cti_write_intack(struct device *dev, u32 ackval);
 void cti_write_single_reg(struct cti_drvdata *drvdata, int offset, u32 value);
+u32 cti_read_single_reg(struct cti_drvdata *drvdata, int offset);
 int cti_channel_trig_op(struct device *dev, enum cti_chan_op op,
 			enum cti_trig_dir direction, u32 channel_idx,
 			u32 trigger_idx);

-- 
2.34.1


