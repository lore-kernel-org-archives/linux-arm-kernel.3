Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7900D3B7FC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Nov 2024 10:17:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oDoI35vgzWYdRkhFYrikjsIy3ZO44dxkmnBmhP1BVms=; b=pCQ7twdE0WTgpLZezsHyIbS+sV
	jZJWNx90rxuoslSWeCib1sDpcIeQX6Zdw3mM7bej24OUpMwI6AvN4BVSHnBa2M63W9c5SMwFdg5yz
	w/2f0BcPq7FY6TcZMBmjy7GnLyq6jV45YYwqQkUEBkt2QJUJaulKibMFZXS9lz42LoOxNpKGax4v1
	5pny2ykNwbdnKvCnCZ9NlQHhAKAmXcQSJeOgFVnx7gJZVyXrR3mJzEJ0kWcMEQ4wsNKIFU1huawXs
	hnyizrgGaXqx3CYxHVCuBUJj1rLxUiXqhjxJHK9ZM4WEl8mvEKNnbJF5GOQkrcjEVDrT1NrkuNThy
	dkppo/Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFWA2-00000007hzA-0zYB;
	Mon, 25 Nov 2024 10:17:42 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFVi0-00000007dpO-0Rwd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Nov 2024 09:48:45 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C26FB1756;
	Mon, 25 Nov 2024 01:49:13 -0800 (PST)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 8EF163F66E;
	Mon, 25 Nov 2024 01:48:41 -0800 (PST)
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: suzuki.poulose@arm.com,
	mike.leach@linaro.org,
	james.clark@linaro.org,
	alexander.shishkin@linux.intel.com,
	bigeasy@linutronix.de,
	clrkwllms@kernel.org,
	rostedt@goodmis.org
Cc: coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rt-devel@lists.linux.dev,
	nd@arm.com,
	Levi Yun <yeoreum.yun@arm.com>
Subject: [PATCH 9/9] coresight/ultrasoc: change cti_drvdata spinlock's type to raw_spinlock_t
Date: Mon, 25 Nov 2024 09:48:16 +0000
Message-Id: <20241125094816.365472-10-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241125094816.365472-1-yeoreum.yun@arm.com>
References: <20241125094816.365472-1-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_014844_236117_1622EBF9 
X-CRM114-Status: GOOD (  14.20  )
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

From: Levi Yun <yeoreum.yun@arm.com>

In ultrasoc-smb drivers, smb_drv_data->spinlock can be held
during __schedule() by perf_event_task_sched_out()/in().

Since smb__drv_data->spinlock type is spinlock_t and
perf_event_task_sched_out()/in() is called after acquiring rq_lock,
which is raw_spinlock_t (an unsleepable lock),
this poses an issue in PREEMPT_RT kernel where spinlock_t is sleepable.

To address this, change type smb_drv_data->spinlock in ultrasoc-smb drivers,
which can be called by perf_event_task_sched_out()/in(),
from spinlock_t to raw_spinlock_t.

Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 drivers/hwtracing/coresight/ultrasoc-smb.c | 12 ++++++------
 drivers/hwtracing/coresight/ultrasoc-smb.h |  2 +-
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/hwtracing/coresight/ultrasoc-smb.c b/drivers/hwtracing/coresight/ultrasoc-smb.c
index ef7f560f0ffa..9ab4aec6955e 100644
--- a/drivers/hwtracing/coresight/ultrasoc-smb.c
+++ b/drivers/hwtracing/coresight/ultrasoc-smb.c
@@ -98,7 +98,7 @@ static int smb_open(struct inode *inode, struct file *file)
 	struct smb_drv_data *drvdata = container_of(file->private_data,
 					struct smb_drv_data, miscdev);
 
-	guard(spinlock)(&drvdata->spinlock);
+	guard(raw_spinlock)(&drvdata->spinlock);
 
 	if (drvdata->reading)
 		return -EBUSY;
@@ -152,7 +152,7 @@ static int smb_release(struct inode *inode, struct file *file)
 	struct smb_drv_data *drvdata = container_of(file->private_data,
 					struct smb_drv_data, miscdev);
 
-	guard(spinlock)(&drvdata->spinlock);
+	guard(raw_spinlock)(&drvdata->spinlock);
 	drvdata->reading = false;
 
 	return 0;
@@ -245,7 +245,7 @@ static int smb_enable(struct coresight_device *csdev, enum cs_mode mode,
 	struct smb_drv_data *drvdata = dev_get_drvdata(csdev->dev.parent);
 	int ret = 0;
 
-	guard(spinlock)(&drvdata->spinlock);
+	guard(raw_spinlock)(&drvdata->spinlock);
 
 	/* Do nothing, the trace data is reading by other interface now */
 	if (drvdata->reading)
@@ -280,7 +280,7 @@ static int smb_disable(struct coresight_device *csdev)
 {
 	struct smb_drv_data *drvdata = dev_get_drvdata(csdev->dev.parent);
 
-	guard(spinlock)(&drvdata->spinlock);
+	guard(raw_spinlock)(&drvdata->spinlock);
 
 	if (drvdata->reading)
 		return -EBUSY;
@@ -378,7 +378,7 @@ static unsigned long smb_update_buffer(struct coresight_device *csdev,
 	if (!buf)
 		return 0;
 
-	guard(spinlock)(&drvdata->spinlock);
+	guard(raw_spinlock)(&drvdata->spinlock);
 
 	/* Don't do anything if another tracer is using this sink. */
 	if (csdev->refcnt != 1)
@@ -563,7 +563,7 @@ static int smb_probe(struct platform_device *pdev)
 
 	smb_reset_buffer(drvdata);
 	platform_set_drvdata(pdev, drvdata);
-	spin_lock_init(&drvdata->spinlock);
+	raw_spin_lock_init(&drvdata->spinlock);
 	drvdata->pid = -1;
 
 	ret = smb_register_sink(pdev, drvdata);
diff --git a/drivers/hwtracing/coresight/ultrasoc-smb.h b/drivers/hwtracing/coresight/ultrasoc-smb.h
index a91d39cfccb8..c4c111275627 100644
--- a/drivers/hwtracing/coresight/ultrasoc-smb.h
+++ b/drivers/hwtracing/coresight/ultrasoc-smb.h
@@ -115,7 +115,7 @@ struct smb_drv_data {
 	struct coresight_device	*csdev;
 	struct smb_data_buffer sdb;
 	struct miscdevice miscdev;
-	spinlock_t spinlock;
+	raw_spinlock_t spinlock;
 	bool reading;
 	pid_t pid;
 };
-- 
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}


