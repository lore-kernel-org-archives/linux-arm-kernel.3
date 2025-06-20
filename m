Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 453D0C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 08:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cODsUbUOkSRYUD/jzWOqld+P+cUtWR1zSvULF/JVorM=; b=oWi9tWKkk1LXesjn/W0P75SHlB
	ihnA9cm86vVqO7+rLlAk6om+JsjOm2hIylQdDdklbmeXntOp8MwUWY2l5XaeGn4tcLYaslTEbPD1v
	utWPoWK5nx6fXwV/4S/qnZCDZVFW6emU3YgI5QEhvXWZs9EqvVvVmeRNJBcWSzr8IURabL0fCfy1d
	2hgXHD/uDp51UpAFlhTEzpUZTDXaXMPGtmWutiZUaODT5A4IpwRI3juvlPdqXGSK7M/dvirjKS+J8
	MVzGNH81qm6/PudlYqyhw1aGxnMhtau+8KsO4ywNqc5wdm8cNRGTkrbpwI8DkxDzzOZT04uF2UaPq
	dfVdmoyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSWfF-0000000EzXb-1sRs;
	Fri, 20 Jun 2025 07:59:57 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSWZx-0000000Ez06-1XtM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Jun 2025 07:54:31 +0000
Received: from mail.maildlp.com (unknown [172.19.88.163])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4bNqS52g5Qz28fWv;
	Fri, 20 Jun 2025 15:51:49 +0800 (CST)
Received: from dggemv705-chm.china.huawei.com (unknown [10.3.19.32])
	by mail.maildlp.com (Postfix) with ESMTPS id F2CDB1800B2;
	Fri, 20 Jun 2025 15:54:14 +0800 (CST)
Received: from kwepemn500004.china.huawei.com (7.202.194.145) by
 dggemv705-chm.china.huawei.com (10.3.19.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 20 Jun 2025 15:54:14 +0800
Received: from localhost.localdomain (10.50.165.33) by
 kwepemn500004.china.huawei.com (7.202.194.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 20 Jun 2025 15:54:14 +0800
From: Junhao He <hejunhao3@huawei.com>
To: <suzuki.poulose@arm.com>, <james.clark@arm.com>, <leo.yan@arm.com>,
	<anshuman.khandual@arm.com>
CC: <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linuxarm@huawei.com>,
	<jonathan.cameron@huawei.com>, <yangyicong@huawei.com>,
	<prime.zeng@hisilicon.com>, <hejunhao3@huawei.com>
Subject: [PATCH v2 2/3] coresight: tmc: refactor the tmc-etr mode setting to avoid race conditions
Date: Fri, 20 Jun 2025 15:54:11 +0800
Message-ID: <20250620075412.952934-3-hejunhao3@huawei.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20250620075412.952934-1-hejunhao3@huawei.com>
References: <20250620075412.952934-1-hejunhao3@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.50.165.33]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemn500004.china.huawei.com (7.202.194.145)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_005429_765667_2819EDC9 
X-CRM114-Status: GOOD (  19.86  )
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

When trying to run perf and sysfs mode simultaneously, the WARN_ON()
in tmc_etr_enable_hw() is triggered sometimes:

 WARNING: CPU: 42 PID: 3911571 at drivers/hwtracing/coresight/coresight-tmc-etr.c:1060 tmc_etr_enable_hw+0xc0/0xd8 [coresight_tmc]
 [..snip..]
 Call trace:
  tmc_etr_enable_hw+0xc0/0xd8 [coresight_tmc] (P)
  tmc_enable_etr_sink+0x11c/0x250 [coresight_tmc] (L)
  tmc_enable_etr_sink+0x11c/0x250 [coresight_tmc]
  coresight_enable_path+0x1c8/0x218 [coresight]
  coresight_enable_sysfs+0xa4/0x228 [coresight]
  enable_source_store+0x58/0xa8 [coresight]
  dev_attr_store+0x20/0x40
  sysfs_kf_write+0x4c/0x68
  kernfs_fop_write_iter+0x120/0x1b8
  vfs_write+0x2c8/0x388
  ksys_write+0x74/0x108
  __arm64_sys_write+0x24/0x38
  el0_svc_common.constprop.0+0x64/0x148
  do_el0_svc+0x24/0x38
  el0_svc+0x3c/0x130
  el0t_64_sync_handler+0xc8/0xd0
  el0t_64_sync+0x1ac/0x1b0
 ---[ end trace 0000000000000000 ]---

Since the sysfs buffer allocation and the hardware enablement is not
in the same critical region, it's possible to race with the perf

mode:
  [sysfs mode]                   [perf mode]
  tmc_etr_get_sysfs_buffer()
    spin_lock(&drvdata->spinlock)
    [sysfs buffer allocation]
    spin_unlock(&drvdata->spinlock)
                                 spin_lock(&drvdata->spinlock)
                                 tmc_etr_enable_hw()
                                   drvdata->etr_buf = etr_perf->etr_buf
                                 spin_unlock(&drvdata->spinlock)
 spin_lock(&drvdata->spinlock)
 tmc_etr_enable_hw()
   WARN_ON(drvdata->etr_buf) // WARN sicne etr_buf initialized at
                                the perf side
  spin_unlock(&drvdata->spinlock)

A race condition is introduced here, perf always prioritizes execution, and
warnings can lead to concerns about potential hidden bugs, such as getting
out of sync.

To fix this, configure the tmc-etr mode before invoking enable_etr_perf()
or enable_etr_sysfs(), explicitly check if the tmc-etr sink is already
enabled in a different mode, and simplily the setup and checks for "mode".
To prevent race conditions between mode transitions.

Fixes: 296b01fd106e ("coresight: Refactor out buffer allocation function for ETR")
Reported-by: Yicong Yang <yangyicong@hisilicon.com>
Closes: https://lore.kernel.org/linux-arm-kernel/20241202092419.11777-2-yangyicong@huawei.com/
Signed-off-by: Junhao He <hejunhao3@huawei.com>
---
 .../hwtracing/coresight/coresight-tmc-etr.c   | 73 +++++++++++--------
 1 file changed, 43 insertions(+), 30 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
index b07fcdb3fe1a..252a57a8e94e 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
@@ -1263,11 +1263,6 @@ static struct etr_buf *tmc_etr_get_sysfs_buffer(struct coresight_device *csdev)
 		raw_spin_lock_irqsave(&drvdata->spinlock, flags);
 	}
 
-	if (drvdata->reading || coresight_get_mode(csdev) == CS_MODE_PERF) {
-		ret = -EBUSY;
-		goto out;
-	}
-
 	/*
 	 * If we don't have a buffer or it doesn't match the requested size,
 	 * use the buffer allocated above. Otherwise reuse the existing buffer.
@@ -1278,7 +1273,6 @@ static struct etr_buf *tmc_etr_get_sysfs_buffer(struct coresight_device *csdev)
 		drvdata->sysfs_buf = new_buf;
 	}
 
-out:
 	raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
 
 	/* Free memory outside the spinlock if need be */
@@ -1289,7 +1283,7 @@ static struct etr_buf *tmc_etr_get_sysfs_buffer(struct coresight_device *csdev)
 
 static int tmc_enable_etr_sink_sysfs(struct coresight_device *csdev)
 {
-	int ret = 0;
+	int ret;
 	unsigned long flags;
 	struct tmc_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
 	struct etr_buf *sysfs_buf = tmc_etr_get_sysfs_buffer(csdev);
@@ -1299,23 +1293,10 @@ static int tmc_enable_etr_sink_sysfs(struct coresight_device *csdev)
 
 	raw_spin_lock_irqsave(&drvdata->spinlock, flags);
 
-	/*
-	 * In sysFS mode we can have multiple writers per sink.  Since this
-	 * sink is already enabled no memory is needed and the HW need not be
-	 * touched, even if the buffer size has changed.
-	 */
-	if (coresight_get_mode(csdev) == CS_MODE_SYSFS) {
-		csdev->refcnt++;
-		goto out;
-	}
-
 	ret = tmc_etr_enable_hw(drvdata, sysfs_buf);
-	if (!ret) {
-		coresight_set_mode(csdev, CS_MODE_SYSFS);
+	if (!ret)
 		csdev->refcnt++;
-	}
 
-out:
 	raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
 
 	if (!ret)
@@ -1735,11 +1716,6 @@ static int tmc_enable_etr_sink_perf(struct coresight_device *csdev, void *data)
 	struct etr_perf_buffer *etr_perf = etm_perf_sink_config(handle);
 
 	raw_spin_lock_irqsave(&drvdata->spinlock, flags);
-	 /* Don't use this sink if it is already claimed by sysFS */
-	if (coresight_get_mode(csdev) == CS_MODE_SYSFS) {
-		rc = -EBUSY;
-		goto unlock_out;
-	}
 
 	if (WARN_ON(!etr_perf || !etr_perf->etr_buf)) {
 		rc = -EINVAL;
@@ -1768,7 +1744,6 @@ static int tmc_enable_etr_sink_perf(struct coresight_device *csdev, void *data)
 	if (!rc) {
 		/* Associate with monitored process. */
 		drvdata->pid = pid;
-		coresight_set_mode(csdev, CS_MODE_PERF);
 		drvdata->perf_buf = etr_perf->etr_buf;
 		csdev->refcnt++;
 	}
@@ -1781,14 +1756,52 @@ static int tmc_enable_etr_sink_perf(struct coresight_device *csdev, void *data)
 static int tmc_enable_etr_sink(struct coresight_device *csdev,
 			       enum cs_mode mode, void *data)
 {
+	struct tmc_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
+	enum cs_mode old_mode;
+	int rc = -EINVAL;
+
+	scoped_guard(spinlock_irqsave, &drvdata->spinlock) {
+		old_mode = coresight_get_mode(csdev);
+		if (old_mode != CS_MODE_DISABLED && old_mode != mode)
+			return -EBUSY;
+
+		if (drvdata->reading)
+			return -EBUSY;
+
+		/* In sysFS mode we can have multiple writers per sink. */
+		if (old_mode == CS_MODE_SYSFS) {
+			csdev->refcnt++;
+			return 0;
+		}
+
+		/*
+		 * minor note: In sysFS mode, the task1 get locked first, it setup
+		 * etr mode to SYSFS. Then task2 get locked，it will directly return
+		 * success even when the tmc-etr is not enabled at this moment.
+		 * Ultimately, task1 will still successfully enable tmc-etr.
+		 * This is a transient state and does not cause an anomaly.
+		 */
+		coresight_set_mode(csdev, mode);
+	}
+
 	switch (mode) {
 	case CS_MODE_SYSFS:
-		return tmc_enable_etr_sink_sysfs(csdev);
+		rc = tmc_enable_etr_sink_sysfs(csdev);
+		break;
 	case CS_MODE_PERF:
-		return tmc_enable_etr_sink_perf(csdev, data);
+		rc = tmc_enable_etr_sink_perf(csdev, data);
+		break;
 	default:
-		return -EINVAL;
+		rc = -EINVAL;
 	}
+
+	if (rc && old_mode != mode) {
+		scoped_guard(spinlock_irqsave, &drvdata->spinlock) {
+			coresight_set_mode(csdev, old_mode);
+		}
+	}
+
+	return rc;
 }
 
 static int tmc_disable_etr_sink(struct coresight_device *csdev)
-- 
2.33.0


