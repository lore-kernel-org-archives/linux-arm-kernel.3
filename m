Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D304EFC5913
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 09:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vHO2xJqiAGROaEXTqyV1v+U6HXTXkvdHtO4f5G9GqA0=; b=gn2aZUvJu/qldM1PIwp956Kp+D
	1hRVxTF/PKJxRGbNTGKUHQqzVHY5EH2Z02bEki910A8YvYI+ThQynIeJ3t7EGA70LClCO145f862y
	dvtjkhz2vWhzs7+Ql2mtuWdMLpTxJqTXt4gzJxp6uKtBI1LopxX+TLbknqeGhW39H9e1QmAAXDh6Q
	lN2EIXPm38kYPnls8D9N6Ehu4Nn2SziSW8DC18e8fqz5Q1xVv5pmU4OeKWG52N1YeMs+A4je3wfs6
	CAOCKwvqn690hXjWPRSl88FCM7Fy8/orP/6cQsTZrI0UEHrdA/3w0DPyEo3K+c5M29pVn46R0q4Ux
	6GcpPt1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvXbS-00000005my6-3aka;
	Thu, 26 Feb 2026 09:24:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvXbM-00000005muY-0EO7
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 26 Feb 2026 09:24:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=vHO2xJqiAGROaEXTqyV1v+U6HXTXkvdHtO4f5G9GqA0=; b=CkY8vjCNxfzMyRV1UoEu6m+q1x
	Pqks6W/LL0ZPeFp6SckYWNBwQadviPqtv2QvcpLRjrUJpLYqQI/pNn95J/eD9wiN+pYZAND06c8K3
	YzQCHX3qfPhMEeuUTpIx/dMaBpgMI4r0icmM5oiVzcdz6KvKKjwT2dk83ecSLcb7j+cDDfXohJSnv
	1CJ+eYjIXWV0YX+J5GLPElJqn8o6reNXufS3OFsVZ1XjoX9nAJTPoOT35h2RowgPWv+7znfdd9k23
	BSvaIEQ4tLhvcXX9j5DT1xzzuM+ht4hIqpJJXlBT6Z5ixs34w5/7fHn7yj43ExUux0KRRNL+KMFe5
	3idAV/uA==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvXbI-0000000AbSv-3y5Q
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 09:24:06 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 96C4B15A1;
	Thu, 26 Feb 2026 01:23:57 -0800 (PST)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0CEB13F62B;
	Thu, 26 Feb 2026 01:24:01 -0800 (PST)
From: Leo Yan <leo.yan@arm.com>
Date: Thu, 26 Feb 2026 09:23:50 +0000
Subject: [PATCH v2 2/8] coresight: cti: Fix register reads
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260226-arm_coresight_cti_refactor_v1-v2-2-b30fada3cfec@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772097837; l=3389;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=2bQ69Z5ouesbi+b2Bz2ZVyq089jUDRdtmH85bguxG+k=;
 b=k+kMKN3OT97s4KtA2QvxnO51Usv4KLzWaUnRqYONXAfCuTXwavXsxV/+NilWag42GKw3vgHmF
 2fmwV5/nbr/AhaQTsFZWg8/qH8tP+Qr0kkUKO2lHtJKzoeExpNjfUAL
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_092405_407120_3C93FEDA 
X-CRM114-Status: GOOD (  11.41  )
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
Reviewed-by: Mike Leach <mike.leach@arm.com>
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-cti-core.c  | 11 +++++++++++
 drivers/hwtracing/coresight/coresight-cti-sysfs.c |  6 ++----
 drivers/hwtracing/coresight/coresight-cti.h       |  1 +
 3 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-cti-core.c b/drivers/hwtracing/coresight/coresight-cti-core.c
index e3c98d89c987c10faafa02d1dbd721cfd4187edb..6a53c3ceebf41645e599017e076d12b8b158b10f 100644
--- a/drivers/hwtracing/coresight/coresight-cti-core.c
+++ b/drivers/hwtracing/coresight/coresight-cti-core.c
@@ -156,6 +156,17 @@ static int cti_disable_hw(struct cti_drvdata *drvdata)
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
index daff9e32a6daca90f4d5f4726f163fdd9106191c..45735526fe55b0e4746ba856443f0fcc807d82bb 100644
--- a/drivers/hwtracing/coresight/coresight-cti.h
+++ b/drivers/hwtracing/coresight/coresight-cti.h
@@ -220,6 +220,7 @@ int cti_disable(struct coresight_device *csdev, struct coresight_path *path);
 void cti_write_all_hw_regs(struct cti_drvdata *drvdata);
 void cti_write_intack(struct device *dev, u32 ackval);
 void cti_write_single_reg(struct cti_drvdata *drvdata, int offset, u32 value);
+u32 cti_read_single_reg(struct cti_drvdata *drvdata, int offset);
 int cti_channel_trig_op(struct device *dev, enum cti_chan_op op,
 			enum cti_trig_dir direction, u32 channel_idx,
 			u32 trigger_idx);

-- 
2.34.1


