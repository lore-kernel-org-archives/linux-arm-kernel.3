Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAC0CCA0EF2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 13:37:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zQ5GYt25ox6qkFf4mOc2jz/LSdvCA15gm2S1HUzF1FI=; b=tXUjsgHVItkZ3nqiq1yLh3WpbV
	p22czpWL5CuInRI/L3Doo8eUHyC9q4vM7wzpPtaUs91Qda2Y7Pp5UaMJ+kpf69JMR7MLHgjPLqVPr
	AC8WhxBf0rw7xnmtq+W0qigeboinrJu3S8VwfsLduRWxnnydUAkG7TVTEQPQzU2i5zYkL3DJHUt/W
	h+tHP8qknU/zF0d2aHmEPW+Bmm7XC4PjrccX/ZntI5qKDMvOVuFeCvpFKy/Y9On/vm85cEDOD4+Q1
	gTCTMnZFpfeqZjtQG/2HYpAI8/z8z/NGjl5cM78u5EHt+LfYDhZFU8AO0oW2FdmvJeWHFIqe0Drz7
	vYwvOg4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo03D-00000007Ttv-4AQw;
	Mon, 18 Aug 2025 13:37:27 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unusx-00000006uPc-45Hu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Aug 2025 08:06:33 +0000
Received: from mail.maildlp.com (unknown [172.19.88.234])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4c54w46bknz2Dc8H;
	Mon, 18 Aug 2025 16:03:16 +0800 (CST)
Received: from dggemv706-chm.china.huawei.com (unknown [10.3.19.33])
	by mail.maildlp.com (Postfix) with ESMTPS id EE2BA140259;
	Mon, 18 Aug 2025 16:06:02 +0800 (CST)
Received: from kwepemn500004.china.huawei.com (7.202.194.145) by
 dggemv706-chm.china.huawei.com (10.3.19.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 18 Aug 2025 16:06:02 +0800
Received: from localhost.localdomain (10.50.165.33) by
 kwepemn500004.china.huawei.com (7.202.194.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 18 Aug 2025 16:06:02 +0800
From: Junhao He <hejunhao3@huawei.com>
To: <suzuki.poulose@arm.com>, <james.clark@arm.com>,
	<anshuman.khandual@arm.com>, <leo.yan@arm.com>
CC: <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linuxarm@huawei.com>,
	<jonathan.cameron@huawei.com>, <yangyicong@huawei.com>,
	<prime.zeng@hisilicon.com>, <hejunhao3@huawei.com>
Subject: [PATCH v3 2/3] coresight: tmc: refactor the tmc-etr mode setting to avoid race conditions
Date: Mon, 18 Aug 2025 16:05:59 +0800
Message-ID: <20250818080600.418425-3-hejunhao3@huawei.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20250818080600.418425-1-hejunhao3@huawei.com>
References: <20250818080600.418425-1-hejunhao3@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.165.33]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemn500004.china.huawei.com (7.202.194.145)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_010632_400152_077FD61D 
X-CRM114-Status: GOOD (  23.81  )
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
 .../hwtracing/coresight/coresight-tmc-etr.c   | 80 ++++++++++---------
 1 file changed, 42 insertions(+), 38 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
index b07fcdb3fe1a..06c74717be19 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
@@ -1263,7 +1263,7 @@ static struct etr_buf *tmc_etr_get_sysfs_buffer(struct coresight_device *csdev)
 		raw_spin_lock_irqsave(&drvdata->spinlock, flags);
 	}
 
-	if (drvdata->reading || coresight_get_mode(csdev) == CS_MODE_PERF) {
+	if (drvdata->reading) {
 		ret = -EBUSY;
 		goto out;
 	}
@@ -1300,20 +1300,18 @@ static int tmc_enable_etr_sink_sysfs(struct coresight_device *csdev)
 	raw_spin_lock_irqsave(&drvdata->spinlock, flags);
 
 	/*
-	 * In sysFS mode we can have multiple writers per sink.  Since this
-	 * sink is already enabled no memory is needed and the HW need not be
-	 * touched, even if the buffer size has changed.
+	 * When two sysfs sessions race to acquire an idle sink, both may enter
+	 * this function. We need to recheck if the sink is already in use to
+	 * prevent duplicate hardware configuration.
 	 */
-	if (coresight_get_mode(csdev) == CS_MODE_SYSFS) {
+	if (csdev->refcnt) {
 		csdev->refcnt++;
 		goto out;
 	}
 
 	ret = tmc_etr_enable_hw(drvdata, sysfs_buf);
-	if (!ret) {
-		coresight_set_mode(csdev, CS_MODE_SYSFS);
+	if (!ret)
 		csdev->refcnt++;
-	}
 
 out:
 	raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
@@ -1729,39 +1727,24 @@ static int tmc_enable_etr_sink_perf(struct coresight_device *csdev, void *data)
 {
 	int rc = 0;
 	pid_t pid;
-	unsigned long flags;
 	struct tmc_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
 	struct perf_output_handle *handle = data;
 	struct etr_perf_buffer *etr_perf = etm_perf_sink_config(handle);
 
-	raw_spin_lock_irqsave(&drvdata->spinlock, flags);
-	 /* Don't use this sink if it is already claimed by sysFS */
-	if (coresight_get_mode(csdev) == CS_MODE_SYSFS) {
-		rc = -EBUSY;
-		goto unlock_out;
-	}
-
-	if (WARN_ON(!etr_perf || !etr_perf->etr_buf)) {
-		rc = -EINVAL;
-		goto unlock_out;
-	}
+	if (WARN_ON(!etr_perf || !etr_perf->etr_buf))
+		return -EINVAL;
 
 	/* Get a handle on the pid of the session owner */
 	pid = etr_perf->pid;
 
 	/* Do not proceed if this device is associated with another session */
-	if (drvdata->pid != -1 && drvdata->pid != pid) {
-		rc = -EBUSY;
-		goto unlock_out;
-	}
+	if (drvdata->pid != -1 && drvdata->pid != pid)
+		return -EBUSY;
 
-	/*
-	 * No HW configuration is needed if the sink is already in
-	 * use for this session.
-	 */
+	/* The sink is already in use for this session */
 	if (drvdata->pid == pid) {
 		csdev->refcnt++;
-		goto unlock_out;
+		return rc;
 	}
 
 	rc = tmc_etr_enable_hw(drvdata, etr_perf->etr_buf);
@@ -1773,22 +1756,43 @@ static int tmc_enable_etr_sink_perf(struct coresight_device *csdev, void *data)
 		csdev->refcnt++;
 	}
 
-unlock_out:
-	raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
 	return rc;
 }
 
 static int tmc_enable_etr_sink(struct coresight_device *csdev,
 			       enum cs_mode mode, void *data)
 {
-	switch (mode) {
-	case CS_MODE_SYSFS:
-		return tmc_enable_etr_sink_sysfs(csdev);
-	case CS_MODE_PERF:
-		return tmc_enable_etr_sink_perf(csdev, data);
-	default:
-		return -EINVAL;
+	struct tmc_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
+	int rc;
+
+	scoped_guard(raw_spinlock_irqsave, &drvdata->spinlock) {
+		if (coresight_get_mode(csdev) != CS_MODE_DISABLED &&
+		    coresight_get_mode(csdev) != mode)
+			return -EBUSY;
+
+		switch (mode) {
+		case CS_MODE_SYSFS:
+			if (csdev->refcnt) {
+				/* The sink is already enabled */
+				csdev->refcnt++;
+				return 0;
+			}
+			coresight_set_mode(csdev, mode);
+			break;
+		case CS_MODE_PERF:
+			return tmc_enable_etr_sink_perf(csdev, data);
+		default:
+			return -EINVAL;
+		}
+	}
+
+	rc = tmc_enable_etr_sink_sysfs(csdev);
+	if (rc) {
+		scoped_guard(raw_spinlock_irqsave, &drvdata->spinlock)
+		coresight_set_mode(csdev, CS_MODE_DISABLED);
 	}
+
+	return rc;
 }
 
 static int tmc_disable_etr_sink(struct coresight_device *csdev)
-- 
2.33.0


