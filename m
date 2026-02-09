Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8979CE7E0D0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Feb 2026 18:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/SocDputoEdxAGvn8DxBwTK33h+k75L/u+xJH5H2sPY=; b=hdYbM/e8TNgE2WVdHezE82iD4M
	ZT8ot33+MY2dxIvNx6GX4o8/OHBgRRrdiwtfLQ/OCnE7mYYKRGinq/kyyI00bm9pe/LymDlgE+CJB
	ORzcK3sezCHoDp/P9Y3ELg44X9yVk6PZKcJL1FfysEzQpmq0r5GfO+gYPocr5F2MNKjEHZ2WLKYTq
	6Vwwr9jU213MIPDrA3btMsVVHaTcOQXAovQpP3sVKcOypK8a3r2Z9HOe6V6CLwuTKMSVf+8EXpJ1l
	pbuz1hP+MqX6MSW/zqsFJ3EYLtZYwoderJO9RJmLXsn55oK/jEBTLqH0MMxFGNuXqU7Xl+1wGGV5x
	xD8P5u6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpVa1-0000000Fp5v-2AgR;
	Mon, 09 Feb 2026 18:01:49 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpVZy-0000000Fp2f-3Nm2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Feb 2026 18:01:48 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2B8AE497;
	Mon,  9 Feb 2026 10:01:39 -0800 (PST)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 782E03F63F;
	Mon,  9 Feb 2026 10:01:43 -0800 (PST)
From: Leo Yan <leo.yan@arm.com>
Date: Mon, 09 Feb 2026 18:01:18 +0000
Subject: [PATCH 8/8] coresight: cti: Refactor cti_reg32_{show|store}()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260209-arm_coresight_cti_refactor_v1-v1-8-db71ab4d200b@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770660084; l=1825;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=X+rCPPEil1abF6EWziwOHKrhx04dGSDzEHi0srI8XKI=;
 b=KNwHqSQ6ZfHOyXJVPgVv+wNhzKYANWrqYCCJYL+o6VD2uh+F2ShC5RCa9RJ0uerhwUyV1C8Kj
 T9cy8M6jX6OBVD6HHGdVMDynyx5kElKZ4XjtVV4YDZ6PRy7Nir/2CRL
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_100146_900945_34D04161 
X-CRM114-Status: GOOD (  13.07  )
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

Return an error for any negative offset.  Since the cached value is used
to store user config, it is not updated when reading back the register
in cti_reg32_show().

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-cti-sysfs.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-cti-sysfs.c b/drivers/hwtracing/coresight/coresight-cti-sysfs.c
index 9ef44956ebdc7781717d773fa014165989df2048..baac2a5dd467032fafbc6523d8885de59cb2665b 100644
--- a/drivers/hwtracing/coresight/coresight-cti-sysfs.c
+++ b/drivers/hwtracing/coresight/coresight-cti-sysfs.c
@@ -252,14 +252,14 @@ static ssize_t cti_reg32_show(struct device *dev, char *buf,
 	struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);
 	struct cti_config *config = &drvdata->config;
 
+	if (reg_offset < 0)
+		return -EINVAL;
+
 	scoped_guard(raw_spinlock_irqsave, &drvdata->spinlock) {
-		if ((reg_offset >= 0) && cti_is_active(config)) {
+		if (cti_is_active(config))
 			val = cti_read_single_reg(drvdata, reg_offset);
-			if (pcached_val)
-				*pcached_val = val;
-		} else if (pcached_val) {
+		else if (pcached_val)
 			val = *pcached_val;
-		}
 	}
 
 	return sprintf(buf, "%#x\n", val);
@@ -280,13 +280,16 @@ static ssize_t cti_reg32_store(struct device *dev, const char *buf,
 	if (kstrtoul(buf, 0, &val))
 		return -EINVAL;
 
+	if (reg_offset < 0)
+		return -EINVAL;
+
 	scoped_guard(raw_spinlock_irqsave, &drvdata->spinlock) {
 		/* local store */
 		if (pcached_val)
 			*pcached_val = (u32)val;
 
 		/* write through if offset and enabled */
-		if ((reg_offset >= 0) && cti_is_active(config))
+		if (cti_is_active(config))
 			cti_write_single_reg(drvdata, reg_offset, val);
 	}
 

-- 
2.34.1


