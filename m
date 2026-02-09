Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47C43E81BD3
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Feb 2026 18:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+lOm32a0frBaEBEf+d6yBgnSH6VKYkezdysQFbGB1dM=; b=T9s2+Z8J45htme153kZhnL46y7
	vnHQ2l56OatfTVATgcXujTja+S6XBb5wwk9rSAqjln0Io/yIWc2UXL/sq1FS6dQtIBGWSbtIJDRsm
	tEe0N0Af6pQDuOxDXZc7GT1IpoDK6ZGpT7r5MJ9B66tRr5m6/YPs0o/dpU6Jb8eXyoi3T31YEctMX
	4kv3CY2lM5Dof9pcfHQMp9c3mnu8eH9FUXsFK3Ff1tEVPL65YFiL3Ms1Tb8EjbxhBn4OQixOO4qVN
	LlSMrwOLEOl7oQIS1DF2Y/PuQ/LjE38pvw9yxpEP3JZSaxKRfvV4yZYhwCw8lEEzW1kM7OuEvfBcz
	Ty71BELg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpVZz-0000000Fp3Q-0p6t;
	Mon, 09 Feb 2026 18:01:47 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpVZw-0000000Fp0e-48gP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Feb 2026 18:01:46 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C93DB339;
	Mon,  9 Feb 2026 10:01:36 -0800 (PST)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 224013F63F;
	Mon,  9 Feb 2026 10:01:40 -0800 (PST)
From: Leo Yan <leo.yan@arm.com>
Date: Mon, 09 Feb 2026 18:01:17 +0000
Subject: [PATCH 7/8] coresight: cti: Remove hw_enabled flag
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260209-arm_coresight_cti_refactor_v1-v1-7-db71ab4d200b@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770660084; l=4107;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=WE0rZtazfPljyd7397maVHWXeoTMlfempk/Slh0zJdA=;
 b=YZLPsn8CZxEZA8m5FCo7IQn5TncssFZztdsJY6Fqt5D+IfyccoqYb7hCdslN3J/NLp2dRhlzk
 GqHWodaW3heC7L7eqDhx8om+rrAYuCmiw7RxRyqyiXVE8ukrfJi8vUK
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_100145_123026_D61CD299 
X-CRM114-Status: GOOD (  15.68  )
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

The enable_req_count field already tracks whether the CTI device is
enabled.  A non-zero value indicates that the device is active, the
hw_enabled flag is redundant if so.

Remove hw_enabled and update cti_is_active() to check enable_req_count.
Replace open-coded enable_req_count checks with cti_is_active().

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-cti-core.c  | 11 ++---------
 drivers/hwtracing/coresight/coresight-cti-sysfs.c |  2 +-
 drivers/hwtracing/coresight/coresight-cti.h       |  4 +---
 3 files changed, 4 insertions(+), 13 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-cti-core.c b/drivers/hwtracing/coresight/coresight-cti-core.c
index 3b3b851a018851a8656eba64e638c61f3d04b99f..a7acee27d0aa2c842733f62b7ff88a4c296b51cc 100644
--- a/drivers/hwtracing/coresight/coresight-cti-core.c
+++ b/drivers/hwtracing/coresight/coresight-cti-core.c
@@ -90,7 +90,7 @@ static int cti_enable_hw(struct cti_drvdata *drvdata)
 	guard(raw_spinlock_irqsave)(&drvdata->spinlock);
 
 	/* no need to do anything if enabled */
-	if (config->hw_enabled)
+	if (cti_is_active(config))
 		goto cti_state_unchanged;
 
 	/* claim the device */
@@ -100,8 +100,6 @@ static int cti_enable_hw(struct cti_drvdata *drvdata)
 
 	cti_write_all_hw_regs(drvdata);
 
-	config->hw_enabled = true;
-
 cti_state_unchanged:
 	drvdata->config.enable_req_count++;
 	return 0;
@@ -116,22 +114,17 @@ static int cti_disable_hw(struct cti_drvdata *drvdata)
 	guard(raw_spinlock_irqsave)(&drvdata->spinlock);
 
 	/* don't allow negative refcounts, return an error */
-	if (!drvdata->config.enable_req_count)
+	if (!cti_is_active(config))
 		return -EINVAL;
 
 	/* check refcount - disable on 0 */
 	if (--drvdata->config.enable_req_count > 0)
 		return 0;
 
-	/* no need to do anything if disabled */
-	if (!config->hw_enabled)
-		return 0;
-
 	CS_UNLOCK(drvdata->base);
 
 	/* disable CTI */
 	writel_relaxed(0, drvdata->base + CTICONTROL);
-	config->hw_enabled = false;
 
 	coresight_disclaim_device_unlocked(csdev);
 	CS_LOCK(drvdata->base);
diff --git a/drivers/hwtracing/coresight/coresight-cti-sysfs.c b/drivers/hwtracing/coresight/coresight-cti-sysfs.c
index 9ab586a5c9a4fd2a64c542aaaaa625e2299edd62..9ef44956ebdc7781717d773fa014165989df2048 100644
--- a/drivers/hwtracing/coresight/coresight-cti-sysfs.c
+++ b/drivers/hwtracing/coresight/coresight-cti-sysfs.c
@@ -84,7 +84,7 @@ static ssize_t enable_show(struct device *dev,
 	struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);
 
 	scoped_guard(raw_spinlock_irqsave, &drvdata->spinlock)
-		enable_req = drvdata->config.enable_req_count;
+		enable_req = cti_is_active(&drvdata->config);
 
 	return sprintf(buf, "%d\n", !!enable_req);
 }
diff --git a/drivers/hwtracing/coresight/coresight-cti.h b/drivers/hwtracing/coresight/coresight-cti.h
index c858847a5b80036fb48180ff7fbbfe684028cb89..fbb48eb5b0b6a571235d7fecb2c13fc294d8ba50 100644
--- a/drivers/hwtracing/coresight/coresight-cti.h
+++ b/drivers/hwtracing/coresight/coresight-cti.h
@@ -121,7 +121,6 @@ struct cti_device {
  * @nr_ctm_channels: number of available CTM channels - from ID register.
  * @asicctl_impl: true if asicctl is implemented.
  * @enable_req_count: CTI is enabled alongside >=1 associated devices.
- * @hw_enabled: true if hw is currently enabled.
  * @trig_in_use: bitfield of in triggers registered as in use.
  * @trig_out_use: bitfield of out triggers registered as in use.
  * @trig_out_filter: bitfield of out triggers that are blocked if filter
@@ -144,7 +143,6 @@ struct cti_config {
 
 	/* cti enable control */
 	int enable_req_count;
-	bool hw_enabled;
 
 	/* registered triggers and filtering */
 	u32 trig_in_use;
@@ -238,7 +236,7 @@ const char *cti_plat_get_node_name(struct fwnode_handle *fwnode);
 /* Check if a cti device is enabled */
 static inline bool cti_is_active(struct cti_config *cfg)
 {
-	return cfg->hw_enabled;
+	return !!cfg->enable_req_count;
 }
 
 #endif  /* _CORESIGHT_CORESIGHT_CTI_H */

-- 
2.34.1


