Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1A7AC54F4C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 15:01:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JOI4iqJGtfH03pNuTKdAQXn1ZscdYwSeAfZivBz9ZJY=; b=AgeYGPAdNKWx9E4JcP37Dn3zq0
	b7fyGFynL0QNf5Vi3Hb8eNJ3UoOeDaVIfXD/wDuYxf0P2ZJLqiL2GilxchvYrKC6afS1g9W3kba6J
	PPLJMueGojJNejJvUt96UVV1p5W/9wIpRIjYFGNzz63eccqz1HF47uaFvt4zT50/q2f8GpGy7PceY
	uRRR1yyKuENnue435bPUZg/BivHR/KdWQfuailBQ9QYu+EFiXudfGqfxHUjpG2XxVtJiTkFrUhBJ8
	YuQHqHSOFVnPwJyTbWoSHK7upFlsCywtQvKGfSJq9k5HFA8vvNSe5+V/7wFSF87ObXlFn0OcJ4gqa
	Pdvmetxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wojIv-00000005Zgt-0va5;
	Tue, 28 Jul 2026 15:01:13 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wojIr-00000005Zcv-1azu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 15:01:10 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-47f7027ca11so2234361f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jul 2026 08:01:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785250867; x=1785855667; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JOI4iqJGtfH03pNuTKdAQXn1ZscdYwSeAfZivBz9ZJY=;
        b=r27ZWIS1sP5/F1DBODWS1f7j9YmQs1ksy2UsOMhZgYhYRSpPSmD6vMiAWIX5OP/kKP
         j1MpXqexk7QyOs5a+GXkXPbwgjTDG+ufn6CaGWUljRV5NRlsSbWwMwUdlhP+6JHz468g
         UZfd/PKUP5Is+3WNGrttzz3tYmBJs3/SjA/vQiCXL3p4/S/SrRC2WKmFKZHJltyG/3BW
         WGsabClF49T3Gj9ky6GVUuO1qbcekH0FjAXsXn5cXS+wCPyH2dXrq2jw8mF46MLLcm/C
         KOkBxiQBCxd4yYy0YjjWT7dQInwbnv3QuhIOwVF2KXF5F9iOlq/0sg46/uGJwxbCU4Dv
         NbNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785250867; x=1785855667;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JOI4iqJGtfH03pNuTKdAQXn1ZscdYwSeAfZivBz9ZJY=;
        b=MZb8W74/m1RbQ3FrM0yEXAEK6RneA4+ZHvQ1CVeHAlmpBCl2GPf4VOhe0TqKfKniRB
         8I1cshAfUpwd9IJFp+xUNpSgY0z1XDkxYVlKG0ZdSKZro+hUoacjHhJn4y4PMeVi0pN/
         DbXS0lB/FvFa/pztpyCZX04u0DGw0xlEJLLWGLppO6owCJNPBr00ywVX3/c9OFf2Btk8
         QERy240wnHDfersGTABUY4O1QsOMjCO0pq3KC7bGqd2vi0GDT2O3Hy2glSN5aQSaBsNU
         H0rUHvPtnkmrTs/atnIJFTictuvfvlOE6GDjYOslSq1pjFKyPxKDy5NWEFYFHMNifDOS
         tArg==
X-Forwarded-Encrypted: i=1; AHgh+RqlsISp+m5OXdfT06BMwrSfHCMFRa5I4tulicnEVzMfd+Pl+CzEhpGG0xrruot1JDnh5FIkEnoYdZAY8En+QraX@lists.infradead.org
X-Gm-Message-State: AOJu0YwSIbIsm2v3qUOCcMP2CCiwwwzAVnQCE5otTnt9ci5BLHPQSWLP
	nzB+U4WcKygws7AceSXYHGh8w1PvBjQpZcKyctNbJ6YhmVCQb7P/03138uS4PXqa9jo=
X-Gm-Gg: AR+sD12FMW1vi3V3Ut1x5X681YymeoI2m8FWHEvE7edj5nvsAhiiCnf1AT3grerBDOF
	ZUfYBo5+lunsw/7xa18wImqxx0EnzMuz+RuJHPiqyLhjs3Sm2b4+Tivs19wys/Zu9N94sgn1RJB
	yYGORKanMC7q1ahit2N5VxBUIthFGrbggp7bPXIL8UGvZzfz1Hd1KZPo69///ZOsvnLYlaXkoUa
	0oV/X65deYHRYu/QOWPtOBeqjTGnRu/5tW/zP02hdRApLt1Vy+oMH490bR2CItf9V+EJ+DrKHWK
	E0kWSWyCvtzGS6bWzCrAB6sl2y1xovshpHoUd5dHSbySPWu7bXoF12/+RUumeuZLIGYdokObslq
	OaZlrPjCHZDM7Cr3DQKK1sBDaFzsDaHICmEwK93jWzyQGrGvfVvGHHz9iJcIjVXM0AiC3y1eIWl
	VhaoGAELIMvR9j9AK+Jw==
X-Received: by 2002:a05:6000:4918:b0:47f:86af:8fdd with SMTP id ffacd0b85a97d-47fb1e5cde7mr3215692f8f.3.1785250867183;
        Tue, 28 Jul 2026 08:01:07 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c52fa9sm61036324f8f.20.2026.07.28.08.01.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 08:01:06 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Tue, 28 Jul 2026 16:00:18 +0100
Subject: [PATCH v3 6/8] coresight: tmc-etf: Prevent per-thread events from
 sharing a sink
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260728-james-cs-multiple-per-threads-v3-6-6aee7579f1dc@linaro.org>
References: <20260728-james-cs-multiple-per-threads-v3-0-6aee7579f1dc@linaro.org>
In-Reply-To: <20260728-james-cs-multiple-per-threads-v3-0-6aee7579f1dc@linaro.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, Leo Yan <leo.yan@arm.com>, 
 Suyash Mahar <smahar@meta.com>, Yeoreum Yun <yeoreum.yun@arm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Qi Liu <liuqi115@huawei.com>, Junhao He <hejunhao3@huawei.com>, 
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, James Clark <james.clark@linaro.org>, 
 Jonathan Cameron <jic23@kernel.org>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_080109_502677_C32D3CAA 
X-CRM114-Status: GOOD (  24.56  )
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

Like the previous commit to ETR, ETF sinks shouldn't share per-thread
events. Fix it by returning -EBUSY if a second per-thread event tries to
use the same sink.

Fixes: 880af782c6e8 ("coresight: tmc-etf: Add support for CPU-wide trace scenarios")
Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/hwtracing/coresight/coresight-tmc-core.c |  2 --
 drivers/hwtracing/coresight/coresight-tmc-etf.c  | 23 +++++++----------------
 drivers/hwtracing/coresight/coresight-tmc.h      |  4 ----
 3 files changed, 7 insertions(+), 22 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
index 873868718b14..2c2f2f312e8e 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-core.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
@@ -800,8 +800,6 @@ static int __tmc_probe(struct device *dev, struct resource *res)
 	devid = readl_relaxed(drvdata->base + CORESIGHT_DEVID);
 	drvdata->config_type = BMVAL(devid, 6, 7);
 	drvdata->memwidth = tmc_get_memwidth(devid);
-	/* This device is not associated with a session */
-	drvdata->pid = -1;
 	drvdata->etr_mode = ETR_MODE_AUTO;
 
 	if (drvdata->config_type == TMC_CONFIG_TYPE_ETR) {
diff --git a/drivers/hwtracing/coresight/coresight-tmc-etf.c b/drivers/hwtracing/coresight/coresight-tmc-etf.c
index d90090b846ab..c451f1da3cdd 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etf.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etf.c
@@ -250,11 +250,10 @@ static int tmc_enable_etf_sink_perf(struct coresight_device *csdev,
 				    struct coresight_path *path)
 {
 	int ret = 0;
-	pid_t pid;
 	unsigned long flags;
 	struct tmc_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
 	struct perf_output_handle *handle = path->handle;
-	struct cs_buffers *buf = etm_perf_sink_config(handle);
+	struct etm_event_data *event_data = perf_get_aux(handle);
 
 	raw_spin_lock_irqsave(&drvdata->spinlock, flags);
 	do {
@@ -270,10 +269,8 @@ static int tmc_enable_etf_sink_perf(struct coresight_device *csdev,
 			break;
 		}
 
-		/* Get a handle on the pid of the process to monitor */
-		pid = buf->pid;
-
-		if (drvdata->pid != -1 && drvdata->pid != pid) {
+		if (!etm_perf_sink_can_share(csdev, &drvdata->perf_session,
+					     handle)) {
 			ret = -EBUSY;
 			break;
 		}
@@ -282,19 +279,15 @@ static int tmc_enable_etf_sink_perf(struct coresight_device *csdev,
 		if (ret)
 			break;
 
-		/*
-		 * No HW configuration is needed if the sink is already in
-		 * use for this session.
-		 */
-		if (drvdata->pid == pid) {
+		/*  No HW configuration is needed if the sink is already in use. */
+		if (csdev->refcnt) {
 			csdev->refcnt++;
 			break;
 		}
 
 		ret  = tmc_etb_enable_hw(drvdata);
 		if (!ret) {
-			/* Associate with monitored process. */
-			drvdata->pid = pid;
+			drvdata->perf_session = event_data->session_id;
 			coresight_set_mode(csdev, CS_MODE_PERF);
 			csdev->refcnt++;
 		}
@@ -351,9 +344,8 @@ static int tmc_disable_etf_sink(struct coresight_device *csdev)
 	/* Complain if we (somehow) got out of sync */
 	WARN_ON_ONCE(coresight_get_mode(csdev) == CS_MODE_DISABLED);
 	tmc_etb_disable_hw(drvdata);
-	/* Dissociate from monitored process. */
-	drvdata->pid = -1;
 	coresight_set_mode(csdev, CS_MODE_DISABLED);
+	drvdata->perf_session = (struct etm_session_id) {};
 
 	raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
 
@@ -433,7 +425,6 @@ static void *tmc_alloc_etf_buffer(struct coresight_device *csdev,
 	if (!buf)
 		return NULL;
 
-	buf->pid = task_pid_nr(event->owner);
 	buf->snapshot = overwrite;
 	buf->nr_pages = nr_pages;
 	buf->data_pages = pages;
diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
index 0125f2ad78ed..99601ac9179d 100644
--- a/drivers/hwtracing/coresight/coresight-tmc.h
+++ b/drivers/hwtracing/coresight/coresight-tmc.h
@@ -223,9 +223,6 @@ struct tmc_resrv_buf {
  * @crashdev:	specifics to handle "/dev/crash_tmc_xyz" entry for reading
  *		crash tracedata.
  * @spinlock:	only one at a time pls.
- * @pid:	Process ID of the process that owns the session that is using
- *		this component. For example this would be the pid of the Perf
- *		process.
  * @sysfs_reading: Sysfs mode buffer is being read through "/dev/xyz.tmc" entry.
  *                Note: ETR has a separate software buffer for the two modes so
  *		  the device can still be read while in Perf mode if there is a
@@ -264,7 +261,6 @@ struct tmc_drvdata {
 	struct miscdevice	miscdev;
 	struct miscdevice	crashdev;
 	raw_spinlock_t		spinlock;
-	pid_t			pid;
 	bool			sysfs_reading;
 	bool			stop_on_flush;
 	union {

-- 
2.34.1


