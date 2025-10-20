Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED4BDCCD193
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 14:37:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fx5UJrzS36PVxVU6im8pH4mB1mBGzlo1nOoA/Rr/B+8=; b=1y/MGMhW5tWJH05PRApfPUnXaI
	5aU9jgB8h8Q6t5ZvUKSfbT/qvXAOfIKaP5/eJ6OEr12FO6uDOSgflMBOYASNLpU92cNGl55HFludx
	cJP8p+ypoWh5sM0OX9r5dvCR/c4iHXZBehe0M90xh2hBbA+Y7ZVNob9bf3uPNkU2VmgnNMRbLshIS
	GHF2QXcDGU07hNFmCBdfiZWczeaUTbs6ljU32rMaJg/Hznfrf//bROwUZVPJjl7LIHyANk4FYa0v1
	jigipiKh9JaRRqUdjN7Q3hvHIIqdhZ2us7iq8fHECOEKfkzlJyXwHKoaqOwd5k4eAGJEl0cOCPP7G
	u6zSbwFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAr0o-0000000DyzV-08wq;
	Mon, 20 Oct 2025 14:37:26 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAr0k-0000000DyyQ-1kUi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 14:37:23 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2222A1063;
	Mon, 20 Oct 2025 07:37:13 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 95D9D3F63F;
	Mon, 20 Oct 2025 07:37:20 -0700 (PDT)
Date: Mon, 20 Oct 2025 15:37:18 +0100
From: Leo Yan <leo.yan@arm.com>
To: Xiaoqi Zhuang <xiaoqi.zhuang@oss.qualcomm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] coresight: ETR: Fix ETR buffer use-after-free issue
Message-ID: <20251020143718.GH281971@e132581.arm.com>
References: <20251020-fix_etr_issue-v1-1-902ab51770b4@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251020-fix_etr_issue-v1-1-902ab51770b4@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_073722_547675_6C7F71DA 
X-CRM114-Status: GOOD (  33.89  )
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

On Mon, Oct 20, 2025 at 05:06:46PM +0800, Xiaoqi Zhuang wrote:
> When ETR is enabled as CS_MODE_SYSFS, if the buffer size is changed
> and enabled again, currently sysfs_buf will point to the newly
> allocated memory(buf_new) and free the old memory(buf_old). But the
> etr_buf that is being used by the ETR remains pointed to buf_old, not
> updated to buf_new. In this case, it will result in a memory
> use-after-free issue.

I struggled to understand how to reproduce the issue under the condition
"if the buffer size is changed and enabled again."

I don't think the flow below where the trace is re-enabled would cause
an issue:

  - Step 1: Enable trace path between ETM0 -> ETR0;
  - Step 2: Change the buffer size for ETR0;
  - Step 3: Disable trace path between ETM0 -> ETR0;
  - Step 4: Enable again trace path between ETM0 -> ETR0.

In this case, step3 releases the buffer and update "drvdata->etr_buf" to
NULL, and step 4 allocates a new buffer and assign it to
"drvdata->etr_buf".

The problem should occur when operating on two trace paths, E.g.,

  - Step 1: Enable trace path between ETM0 -> ETR0;
  - Step 2: Change the buffer size for ETR0;
  - Step 3: Enable trace path between ETM1 -> ETR0;

In step3, the driver releases the existed buffer and allocate a new one.
At the meantime, "drvdata->etr_buf" still holds the buffer allocated in
step 1.

> Fix this by checking ETR's mode before updating and releasing buf_old,
> if the mode is CS_MODE_SYSFS, then skip updating and releasing it.

Given that we now have a couple of reported issues related to ETR mode,
I'd like to refactor the ETR mode handling and its reference counting
thoroughly.  I've drafted a large change (it's quite big, but we can
split it into small patches if we agree to proceed).

Thanks for reporting the issue!

Leo

---8<---

diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
index b07fcdb3fe1a..d0fac958c614 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
@@ -1241,6 +1241,8 @@ static struct etr_buf *tmc_etr_get_sysfs_buffer(struct coresight_device *csdev)
 	struct tmc_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
 	struct etr_buf *sysfs_buf = NULL, *new_buf = NULL, *free_buf = NULL;
 
+	WARN_ON(coresight_get_mode(csdev) != CS_MODE_SYSFS);
+
 	/*
 	 * If we are enabling the ETR from disabled state, we need to make
 	 * sure we have a buffer with the right size. The etr_buf is not reset
@@ -1263,7 +1265,7 @@ static struct etr_buf *tmc_etr_get_sysfs_buffer(struct coresight_device *csdev)
 		raw_spin_lock_irqsave(&drvdata->spinlock, flags);
 	}
 
-	if (drvdata->reading || coresight_get_mode(csdev) == CS_MODE_PERF) {
+	if (drvdata->reading) {
 		ret = -EBUSY;
 		goto out;
 	}
@@ -1292,30 +1294,14 @@ static int tmc_enable_etr_sink_sysfs(struct coresight_device *csdev)
 	int ret = 0;
 	unsigned long flags;
 	struct tmc_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
-	struct etr_buf *sysfs_buf = tmc_etr_get_sysfs_buffer(csdev);
+	struct etr_buf *sysfs_buf;
 
+	sysfs_buf = tmc_etr_get_sysfs_buffer(csdev);
 	if (IS_ERR(sysfs_buf))
 		return PTR_ERR(sysfs_buf);
 
 	raw_spin_lock_irqsave(&drvdata->spinlock, flags);
-
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
-		csdev->refcnt++;
-	}
-
-out:
 	raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
 
 	if (!ret)
@@ -1735,11 +1721,6 @@ static int tmc_enable_etr_sink_perf(struct coresight_device *csdev, void *data)
 	struct etr_perf_buffer *etr_perf = etm_perf_sink_config(handle);
 
 	raw_spin_lock_irqsave(&drvdata->spinlock, flags);
-	 /* Don't use this sink if it is already claimed by sysFS */
-	if (coresight_get_mode(csdev) == CS_MODE_SYSFS) {
-		rc = -EBUSY;
-		goto unlock_out;
-	}
 
 	if (WARN_ON(!etr_perf || !etr_perf->etr_buf)) {
 		rc = -EINVAL;
@@ -1759,18 +1740,14 @@ static int tmc_enable_etr_sink_perf(struct coresight_device *csdev, void *data)
 	 * No HW configuration is needed if the sink is already in
 	 * use for this session.
 	 */
-	if (drvdata->pid == pid) {
-		csdev->refcnt++;
+	if (drvdata->pid == pid)
 		goto unlock_out;
-	}
 
 	rc = tmc_etr_enable_hw(drvdata, etr_perf->etr_buf);
 	if (!rc) {
 		/* Associate with monitored process. */
 		drvdata->pid = pid;
-		coresight_set_mode(csdev, CS_MODE_PERF);
 		drvdata->perf_buf = etr_perf->etr_buf;
-		csdev->refcnt++;
 	}
 
 unlock_out:
@@ -1778,17 +1755,76 @@ static int tmc_enable_etr_sink_perf(struct coresight_device *csdev, void *data)
 	return rc;
 }
 
+static int tmc_acquire_mode(struct coresight_device *csdev, enum cs_mode mode)
+{
+	struct tmc_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
+
+	if (mode != CS_MODE_SYSFS && mode != CS_MODE_PERF)
+		return -EINVAL;
+
+	scoped_guard(raw_spinlock_irqsave, &drvdata->spinlock);
+
+	if (coresight_get_mode(csdev) == CS_MODE_DISABLED) {
+		if (!csdev->refcnt)
+			coresight_set_mode(csdev, mode);
+		csdev->refcnt++;
+	} else if (coresight_get_mode(csdev) != mode) {
+		ret = -EBUSY;
+	}
+
+	return csdev->refcnt;
+}
+
+static void tmc_release_mode(struct coresight_device *csdev, enum cs_mode mode)
+{
+	struct tmc_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
+
+	scoped_guard(raw_spinlock_irqsave, &drvdata->spinlock);
+
+	if (WARN_ON(coresight_get_mode(csdev) != mode))
+		return;
+
+	csdev->refcnt--;
+	if (!csdev->refcnt)
+		coresight_set_mode(csdev, CS_MODE_DISABLED);
+}
+
 static int tmc_enable_etr_sink(struct coresight_device *csdev,
 			       enum cs_mode mode, void *data)
 {
+	unsigned long flags;
+	struct tmc_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
+	int ret;
+
+	ret = tmc_acquire_mode(csdev, mode);
+	if (ret < 0)
+		return ret;
+
+	/*
+	 * For sysfs mode, the higher level mutex ensures exclusively
+	 * enabling sink, it is safe to bail out if this is not the
+	 * first time to enable sink.
+	 *
+	 * A perf session can enable the same sink simultaneously, fall
+	 * through to call tmc_enable_etr_sink_perf() to ensure the sink
+	 * has been enabled.
+	 */
+	if (mode == CS_MODE_SYSFS && ret > 1)
+		return 0;
+
 	switch (mode) {
 	case CS_MODE_SYSFS:
-		return tmc_enable_etr_sink_sysfs(csdev);
+		ret = tmc_enable_etr_sink_sysfs(csdev);
 	case CS_MODE_PERF:
-		return tmc_enable_etr_sink_perf(csdev, data);
+		ret = tmc_enable_etr_sink_perf(csdev, data);
 	default:
-		return -EINVAL;
+		ret = -EINVAL;
 	}
+
+	if (ret)
+		tmc_release_mode(csdev, mode);
+
+	return ret;
 }
 
 static int tmc_disable_etr_sink(struct coresight_device *csdev)
@@ -1796,30 +1832,20 @@ static int tmc_disable_etr_sink(struct coresight_device *csdev)
 	unsigned long flags;
 	struct tmc_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
 
-	raw_spin_lock_irqsave(&drvdata->spinlock, flags);
+	tmc_release_mode(csdev, mode);
 
-	if (drvdata->reading) {
-		raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
-		return -EBUSY;
-	}
+	scoped_guard(raw_spinlock_irqsave, &drvdata->spinlock);
 
-	csdev->refcnt--;
-	if (csdev->refcnt) {
-		raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
+	if (csdev->refcnt || drvdata->reading)
 		return -EBUSY;
-	}
 
-	/* Complain if we (somehow) got out of sync */
-	WARN_ON_ONCE(coresight_get_mode(csdev) == CS_MODE_DISABLED);
+	if (drvdata->pid == -1)
+		return 0;
+
 	tmc_etr_disable_hw(drvdata);
-	/* Dissociate from monitored process. */
-	drvdata->pid = -1;
-	coresight_set_mode(csdev, CS_MODE_DISABLED);
 	/* Reset perf specific data */
 	drvdata->perf_buf = NULL;
 
-	raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
-
 	dev_dbg(&csdev->dev, "TMC-ETR disabled\n");
 	return 0;
 }

