Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05DE9C54F4C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 15:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kyldpWdr+agt4WTnOhFl2wnppMTguRaoBzlozBAALhg=; b=v3gt1qEHjEvfJDQXDfK4DqDC2D
	k/lxqWJ3jLmPsZ/0jPh2ay0EqRGFjtTkfpABZuoh2k88KsePFqkdzuyVGk9yqiqXHCIg6CuaNEROB
	A3uT4KYX/bOtgAmahkWtEnPy7tPL7GApy2H8tDaWbmjrbSMY/4xv9kCMg9iyzHOHEmYMr7FTUNxBT
	AdZ8/So9EWlrcXSdRZcc+3y4CHGhlGDEYixQnIgWMi03qJxMVMT5l+1jZfaSCytI/Bu5ZEgiRxX0T
	5elmXCgSNOozHxxi9Ut7WFrYhaOTyy+Ubx3UbGo09s2KfDh6q4c+rLEawxRVsA5oRl52NexVY3/XE
	liHgF86A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wojIu-00000005Zey-29xZ;
	Tue, 28 Jul 2026 15:01:12 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wojIl-00000005Zal-0quT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 15:01:05 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-47f93b2fe4cso2843447f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jul 2026 08:01:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785250861; x=1785855661; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kyldpWdr+agt4WTnOhFl2wnppMTguRaoBzlozBAALhg=;
        b=Nt62Pfrmxld2RcPhSlIh8CW75UZAVq4l/43DPbR0ZRXvpTC2pDY4OLyjR0MluZLIRh
         vuce/S3a977kY6sevhzLR4aawUQFeF6hLgKV5EpzGe0vLLhyXM5hIoHbzQ8OAciMmWta
         /jvvRniMxVY3U/CvqaCfV3o9ovY9o+RN+O6VCASh+xCJvmbWoQcLPhbBqqrUJ29hZtWG
         q5BfoySb9Yv+nKlkTaB/gqJ+s0d2AWvOei/dHOBzpwpHMf+mZMxfcAx41Y3KCL2YADo7
         GYKWIpjgzjoEM7elwk1+ihduk5E29IJXkLb6MU11FWkCh4NElraZULYXJz5RMU/xBRf1
         wpWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785250861; x=1785855661;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kyldpWdr+agt4WTnOhFl2wnppMTguRaoBzlozBAALhg=;
        b=nez2TBWt/Z7xfAD803mh3rCzskDrBYdIPmAD7e+yz9lJ/D2reVRq6yKcnxDX7G50FI
         PeML+ZpaTwEDbirkzDmvixxF5eimbAr8ruDqFuDKC4pJYrMxaWCqxKSBnOVyhg8CpRtX
         UMWzJL/B9SNuwU6FHKlHLbJYi4XIarI3k765ks8PQlcFf92z3dtS2BjhlO+DpNKxEXRE
         PCXyiK9IOYdddYuQ1SI+jyncHTjwJN3hI/fFCTsa0GmL+qdDgnxAoGvxY8GUrT6BrlI4
         NIz2FniShtvaK4o7pdek7/LIL4Zw3tp/2mJvnt+3WHGHR6wh93WxlsQDhx+fmZ2agV63
         TI9w==
X-Forwarded-Encrypted: i=1; AHgh+RrJQWRV6jbiOFW6YSM6peyAs3rNyghwKh4/XhNZn+A15Rxy54qNiF+wi8XFI0JhOrn/LVFkM/YdTSbpDefP9/Qq@lists.infradead.org
X-Gm-Message-State: AOJu0YxVH9Nc4j5/hep8vcHZSMmyzyuTHNnRigNGZ4piqwamPdyxe8QD
	fg95cOlZrBSp0gG78WxduqCmTqW1EO/o+yFnEtiXXZVdweJqKpGDXQ8R38BIFJ8D3xo=
X-Gm-Gg: AR+sD11zVgLAzGv+qsrnh30FXcEigxBIdAGoPPPvYoCQJu4W36xV+yVqMwSZbHn0ieL
	6SpU04LkuHYn/SV2J5jFOyEqeFAA/YVv9WbqwaN2rnHFUrzrpNiMeMN/TMEaFspR/ul+u8E7gXd
	pA3RENr75rlkmtMlbusZc4XZaDUCR8onw3vARjtNMcfKvtYbRkopwgmbYyXrKJ3CbS3CM57WSB1
	UVBqAZ6f2NE7DoyIN4nscGYdSlA7y9R83fFSmH/BhTQGV72l5nOdhoBGuH1XBDl5q7cCJTPxptT
	QVJTpWDOeXm9AggATk2H5SfW9+7D0ArWTYH0pbPEroedreyBLVuS+bNcG5WtKIKHzTfqouvj8as
	d5mAmTm+Iw4SVMFeSx8bermRSXtBWM64TsWUVBOS5vQEjok2a9Kzy+63DzlDOlcHO6I4n1xZVsV
	e5oJ06bTY=
X-Received: by 2002:a05:600c:4703:b0:493:fa66:4861 with SMTP id 5b1f17b1804b1-496c6565dfamr35119935e9.25.1785250861215;
        Tue, 28 Jul 2026 08:01:01 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c52fa9sm61036324f8f.20.2026.07.28.08.01.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 08:01:00 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Tue, 28 Jul 2026 16:00:13 +0100
Subject: [PATCH v3 1/8] coresight: tmc-etr: Don't stop Perf cleanup for
 active sysfs reads
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260728-james-cs-multiple-per-threads-v3-1-6aee7579f1dc@linaro.org>
References: <20260728-james-cs-multiple-per-threads-v3-0-6aee7579f1dc@linaro.org>
In-Reply-To: <20260728-james-cs-multiple-per-threads-v3-0-6aee7579f1dc@linaro.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, Leo Yan <leo.yan@arm.com>, 
 Suyash Mahar <smahar@meta.com>, Yeoreum Yun <yeoreum.yun@arm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Qi Liu <liuqi115@huawei.com>, Junhao He <hejunhao3@huawei.com>, 
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, James Clark <james.clark@linaro.org>, 
 Jonathan Cameron <jic23@kernel.org>, sashiko-bot <sashiko-bot@kernel.org>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_080103_306314_FCCA20A4 
X-CRM114-Status: GOOD (  27.85  )
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

The linked fixes commit deliberately allows reads of an old sysfs buffer
while in Perf mode because they are separate software buffers. However
it didn't modify tmc_disable_etr_sink() to match this relaxation. The
result is that when a Perf event ends while the sysfs buffer is being
read, clean up will be skipped.

Fix it by ignoring the sysfs_reading flag unless the active session is
a sysfs one.

When sysfs and Perf share the same memory in ETR_MODE_RESRV mode, a new
Perf session needs to overwrite an old inactive sysfs session by zeroing
len. This avoids sysfs from reading stale data because it has a separate
set of offsets in its etr_buf struct, even if that's backed by the same
memory as the Perf one.

Reported-by: sashiko-bot <sashiko-bot@kernel.org>
Fixes: cad5f8d399bb ("coresight: tmc-etr: Relax collection of trace from sysfs mode")
Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/hwtracing/coresight/coresight-tmc-etf.c | 16 ++++----
 drivers/hwtracing/coresight/coresight-tmc-etr.c | 50 +++++++++++++++++++++----
 drivers/hwtracing/coresight/coresight-tmc.h     |  7 +++-
 3 files changed, 55 insertions(+), 18 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-etf.c b/drivers/hwtracing/coresight/coresight-tmc-etf.c
index 8882b1c4cdc0..3836063031d7 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etf.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etf.c
@@ -198,7 +198,7 @@ static int tmc_enable_etf_sink_sysfs(struct coresight_device *csdev)
 		raw_spin_lock_irqsave(&drvdata->spinlock, flags);
 	}
 
-	if (drvdata->reading) {
+	if (drvdata->sysfs_reading) {
 		ret = -EBUSY;
 		goto out;
 	}
@@ -259,7 +259,7 @@ static int tmc_enable_etf_sink_perf(struct coresight_device *csdev,
 	raw_spin_lock_irqsave(&drvdata->spinlock, flags);
 	do {
 		ret = -EINVAL;
-		if (drvdata->reading)
+		if (drvdata->sysfs_reading)
 			break;
 		/*
 		 * No need to continue if the ETB/ETF is already operated
@@ -337,7 +337,7 @@ static int tmc_disable_etf_sink(struct coresight_device *csdev)
 
 	raw_spin_lock_irqsave(&drvdata->spinlock, flags);
 
-	if (drvdata->reading) {
+	if (drvdata->sysfs_reading) {
 		raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
 		return -EBUSY;
 	}
@@ -371,7 +371,7 @@ static int tmc_enable_etf_link(struct coresight_device *csdev,
 	bool first_enable = false;
 
 	raw_spin_lock_irqsave(&drvdata->spinlock, flags);
-	if (drvdata->reading) {
+	if (drvdata->sysfs_reading) {
 		raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
 		return -EBUSY;
 	}
@@ -401,7 +401,7 @@ static void tmc_disable_etf_link(struct coresight_device *csdev,
 	bool last_disable = false;
 
 	raw_spin_lock_irqsave(&drvdata->spinlock, flags);
-	if (drvdata->reading) {
+	if (drvdata->sysfs_reading) {
 		raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
 		return;
 	}
@@ -718,7 +718,7 @@ int tmc_read_prepare_etb(struct tmc_drvdata *drvdata)
 
 	raw_spin_lock_irqsave(&drvdata->spinlock, flags);
 
-	if (drvdata->reading) {
+	if (drvdata->sysfs_reading) {
 		ret = -EBUSY;
 		goto out;
 	}
@@ -746,7 +746,7 @@ int tmc_read_prepare_etb(struct tmc_drvdata *drvdata)
 		__tmc_etb_disable_hw(drvdata);
 	}
 
-	drvdata->reading = true;
+	drvdata->sysfs_reading = true;
 out:
 	raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
 
@@ -797,7 +797,7 @@ int tmc_read_unprepare_etb(struct tmc_drvdata *drvdata)
 		drvdata->buf = NULL;
 	}
 
-	drvdata->reading = false;
+	drvdata->sysfs_reading = false;
 	raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
 
 	/*
diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
index 361a433e6f0c..be0bbe036d02 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
@@ -1151,7 +1151,7 @@ static int tmc_etr_enable_hw(struct tmc_drvdata *drvdata,
  * starts at anywhere in the buffer, depending on the RRP, we adjust the
  * @len returned to handle buffer wrapping around.
  *
- * We are protected here by drvdata->reading != 0, which ensures the
+ * We are protected here by drvdata->sysfs_reading != 0, which ensures the
  * sysfs_buf stays alive.
  */
 ssize_t tmc_etr_get_sysfs_trace(struct tmc_drvdata *drvdata,
@@ -1268,7 +1268,7 @@ static struct etr_buf *tmc_etr_get_sysfs_buffer(struct coresight_device *csdev)
 		raw_spin_lock_irqsave(&drvdata->spinlock, flags);
 	}
 
-	if (drvdata->reading || coresight_get_mode(csdev) == CS_MODE_PERF) {
+	if (drvdata->sysfs_reading || coresight_get_mode(csdev) == CS_MODE_PERF) {
 		ret = -EBUSY;
 		goto out;
 	}
@@ -1732,6 +1732,16 @@ tmc_update_etr_buffer(struct coresight_device *csdev,
 	return size;
 }
 
+static bool tmc_perf_sysfs_shared(struct tmc_drvdata *drvdata,
+				  struct etr_buf *perf_buf)
+{
+	/* In ETR_MODE_RESRV mode, sysfs and Perf share the same memory. */
+	return perf_buf &&
+	       drvdata->sysfs_buf &&
+	       drvdata->sysfs_buf->mode == ETR_MODE_RESRV &&
+	       perf_buf->mode == ETR_MODE_RESRV;
+}
+
 static int tmc_enable_etr_sink_perf(struct coresight_device *csdev,
 				    struct coresight_path *path)
 {
@@ -1772,6 +1782,18 @@ static int tmc_enable_etr_sink_perf(struct coresight_device *csdev,
 		goto unlock_out;
 	}
 
+	/*
+	 * Don't use if it's shared and being read by sysfs. Sysfs may only
+	 * start reading (the cleared zero length buffer) after the first
+	 * tmc_enable_etr_sink_perf(), which changes the result of this check,
+	 * so it should only be done once.
+	 */
+	if ((drvdata->sysfs_reading &&
+	     tmc_perf_sysfs_shared(drvdata, etr_perf->etr_buf))) {
+		rc = -EBUSY;
+		goto unlock_out;
+	}
+
 	rc = tmc_etr_enable_hw(drvdata, etr_perf->etr_buf);
 	if (!rc) {
 		/* Associate with monitored process. */
@@ -1779,6 +1801,10 @@ static int tmc_enable_etr_sink_perf(struct coresight_device *csdev,
 		coresight_set_mode(csdev, CS_MODE_PERF);
 		drvdata->perf_buf = etr_perf->etr_buf;
 		csdev->refcnt++;
+
+		/* A new Perf session clears an old sysfs one if the buffer is shared */
+		if (tmc_perf_sysfs_shared(drvdata, etr_perf->etr_buf))
+			drvdata->sysfs_buf->len = 0;
 	}
 
 unlock_out:
@@ -1807,7 +1833,13 @@ static int tmc_disable_etr_sink(struct coresight_device *csdev)
 
 	raw_spin_lock_irqsave(&drvdata->spinlock, flags);
 
-	if (drvdata->reading) {
+	/*
+	 * In SYSFS mode an active read is responsible for disabling and
+	 * enabling HW. Otherwise in Perf mode, an old inactive sysfs session
+	 * may be read which Perf should ignore.
+	 */
+	if (drvdata->sysfs_reading &&
+	    coresight_get_mode(csdev) == CS_MODE_SYSFS) {
 		raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
 		return -EBUSY;
 	}
@@ -1928,14 +1960,16 @@ int tmc_read_prepare_etr(struct tmc_drvdata *drvdata)
 		return -EINVAL;
 
 	raw_spin_lock_irqsave(&drvdata->spinlock, flags);
-	if (drvdata->reading) {
+	if (drvdata->sysfs_reading) {
 		ret = -EBUSY;
 		goto out;
 	}
 
 	/*
-	 * We can safely allow reads even if the ETR is operating in PERF mode,
-	 * since the sysfs session is captured in mode specific data.
+	 * We can safely allow reads even if the ETR is operating in PERF mode
+	 * since sysfs has it's own buffer. For ETR_MODE_RESRV the buffers are
+	 * shared but Perf discards sysfs data before starting a session to
+	 * avoid corruption.
 	 * If drvdata::sysfs_data is NULL the trace data has been read already.
 	 */
 	if (!drvdata->sysfs_buf) {
@@ -1947,7 +1981,7 @@ int tmc_read_prepare_etr(struct tmc_drvdata *drvdata)
 	if (coresight_get_mode(drvdata->csdev) == CS_MODE_SYSFS)
 		__tmc_etr_disable_hw(drvdata);
 
-	drvdata->reading = true;
+	drvdata->sysfs_reading = true;
 out:
 	raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
 
@@ -1982,7 +2016,7 @@ int tmc_read_unprepare_etr(struct tmc_drvdata *drvdata)
 		drvdata->sysfs_buf = NULL;
 	}
 
-	drvdata->reading = false;
+	drvdata->sysfs_reading = false;
 	raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
 
 	/* Free allocated memory out side of the spinlock */
diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
index 319a354ede9f..dc1a57ab8011 100644
--- a/drivers/hwtracing/coresight/coresight-tmc.h
+++ b/drivers/hwtracing/coresight/coresight-tmc.h
@@ -221,7 +221,10 @@ struct tmc_resrv_buf {
  * @pid:	Process ID of the process that owns the session that is using
  *		this component. For example this would be the pid of the Perf
  *		process.
- * @reading:	buffer's in the reading through "/dev/xyz.tmc" entry
+ * @sysfs_reading: Sysfs mode buffer is being read through "/dev/xyz.tmc" entry.
+ *                Note: ETR has a separate software buffer for the two modes so
+ *		  the device can still be read while in Perf mode if there is a
+ *		  previous inactive sysfs session.
  * @stop_on_flush: Stop on flush trigger user configuration.
  * @buf:	Snapshot of the trace data for ETF/ETB.
  * @etr_buf:	details of buffer used in TMC-ETR
@@ -255,7 +258,7 @@ struct tmc_drvdata {
 	struct miscdevice	crashdev;
 	raw_spinlock_t		spinlock;
 	pid_t			pid;
-	bool			reading;
+	bool			sysfs_reading;
 	bool			stop_on_flush;
 	union {
 		char		*buf;		/* TMC ETB */

-- 
2.34.1


