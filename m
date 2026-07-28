Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3106C53219
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 15:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+vpaJNvpoUmEak1pga/I7fEICTsiogr6kwDxnUKRL9k=; b=iEoWz5cm4UYHCDa97Nnv0SiSeT
	4dc1zV0AJqYooGAYZu7Z162OfjISmMpaL8ngBtsvfR9kG/30VtSECW6Xvt/ImMb5x34BbgkYVt7Cq
	z+OmdHQ8m92fp2aer6o4jCMQspBNmvdO92If2VpLR85qTHdG1iUNAS214VsazIfLNTT6m/fhXKKIP
	EmMZhZRtVAjKkNPxCHQKJB0husvhT1Mn5f2jAFPuqdcwmIVrnQ/9t+76xOGXL7grk1TMCN4GHaKgH
	wublll7WnV7boO12UdD4uar4XAo0gK4nWhOmb+qfPEEEvtPHwcep/26dBRZHQJVt9raYHm8ZMweQx
	1Of8IIkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wojJZ-00000005Zzn-3Zqu;
	Tue, 28 Jul 2026 15:01:53 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wojIt-00000005Ze6-0doY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 15:01:12 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-4728c12ba97so2392451f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jul 2026 08:01:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785250869; x=1785855669; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+vpaJNvpoUmEak1pga/I7fEICTsiogr6kwDxnUKRL9k=;
        b=vTUCiehfJfIzW5dD0qK2CvYFkuirZSeWNv1xK2IxSDI54+qJbMdfaExLCCjPFbxXsP
         V1JjH0CynuQ/gsgmOfnIf4vNg1hmXme08+3rbCPJjdzQnajY0kQolw0HWwr3QzE8sg7L
         l1yZqUZr5eEgZjVoMLpETG8zR1E5n3hgxVTgXEV4Hbe6ntArZ9WpvjH3ur2TBEelqMfs
         Txyf304A0BwGBOY/QBMW98acN9LZz9nrQ7gMZgFGlyfZ4JhMACLvCkw3wchBtznONmO1
         qCpx8OrK8J8QxRBKXPMtAL0wrWu30Cjm3glvmlM79SPXmotl8AHPsnOlYHeDCclFWJc7
         HICw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785250869; x=1785855669;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+vpaJNvpoUmEak1pga/I7fEICTsiogr6kwDxnUKRL9k=;
        b=FpMFmgFjjuP0ki72ahlYz40VXASiaq53on4FyYXOCu0ei8Z+2BvwfQ9TMBAdxCQPFU
         RMqcC8bjzRW5zBWrYAuwFqubDdEFHEZbukSg9YrQaBgeJMMpkIfMehZOi4OXdEmeQi9Z
         GUyefH6iWkLouim5TpaBwoyFv7K4u4FBbifOH797AB5mFAzU0WlXfSZIphRMgLAAyPJd
         ZnQrEmG39LvPayD2a/swGdD9GiLOIK6gm2DFV8WTbiJ2RRtD3VuhvsXQCKYp43l9byyN
         MfUkBMsPlXQi/C0dZOOWbl+UReo3KH/oU8oDrqUvb3gzx1gziw0zX7+997DTr3hwNzjW
         LL3g==
X-Forwarded-Encrypted: i=1; AHgh+RoodF5L+ZgQwMST51JHXgALLvG59/bgLlFzDI271ox68Mo0BUAoaQfMnk+iFyyCCh3iZnoOF62NbH5pCH4kIAJG@lists.infradead.org
X-Gm-Message-State: AOJu0YyRFoNW611bwGz3cH9j4R00R6HDwOxeqX3XFCXXV+hxrku7s2s7
	vV445l2ClBCHUhP0AFDhOR65BJTTo12TAgTjbFE4H1OFhCmqykT288k2u7uZaxq+J8M8J0r/OkD
	D2S3ssyQ=
X-Gm-Gg: AR+sD10DZaPX/ibbTzcPnIGAeHyR4ghGmpfyBPx5kvUVudIyoTfdW3U+GQJl773D9q0
	xvzYE41RpD0Jus7M3OUOrtpoQHYlK85im0slQimDF5IzfUBxx3GB5DPyADrglGU1W0XBGqtg8Tm
	9dySOHhvV7sbR8RPfiTEwp7fpEe+6BzGLmw/48OLiXQ0CdfKjENoqWxJGti96l+nxzWJvHWqRsh
	Z1LnChbKtrYdp7NiKLf5KWXR0fxPhocxVfgnHqvyx19FrskmHMpDg5kcW8pvpWSx5UDz936l+in
	5Zzcimj9iSQ9yMt5w1W6h6qM/MOL7FUkfCOkBPIceRiMMaYSM4/0nyYupMcJkIO8QkU62rkOoeQ
	8ibGuVyWwJOK0nXPi4aNEy+pUY35ELIeByBXQ+/JtRc2mnQTmLGRuU1SHsA48AAypZHbLnsVSaP
	610gKzIOk=
X-Received: by 2002:a05:6000:2910:b0:47f:85a1:32fe with SMTP id ffacd0b85a97d-47fb1f14b12mr3311643f8f.38.1785250869142;
        Tue, 28 Jul 2026 08:01:09 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c52fa9sm61036324f8f.20.2026.07.28.08.01.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 08:01:08 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Tue, 28 Jul 2026 16:00:19 +0100
Subject: [PATCH v3 7/8] coresight: etb10: Prevent per-thread events from
 sharing a sink
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260728-james-cs-multiple-per-threads-v3-7-6aee7579f1dc@linaro.org>
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
X-CRM114-CacheID: sfid-20260728_080111_253073_5EBB7F2F 
X-CRM114-Status: GOOD (  21.84  )
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

Like the previous commit to ETR, ETB10 sinks shouldn't share per-thread
events. Fix it by returning -EBUSY if a second per-thread event tries to
use the same sink.

Fixes: 75d7dbd38824 ("coresight: etb10: Add support for CPU-wide trace scenarios")
Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/hwtracing/coresight/coresight-etb10.c | 30 +++++++--------------------
 1 file changed, 8 insertions(+), 22 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etb10.c b/drivers/hwtracing/coresight/coresight-etb10.c
index 6a4a1edf46ba..ee0f20c30153 100644
--- a/drivers/hwtracing/coresight/coresight-etb10.c
+++ b/drivers/hwtracing/coresight/coresight-etb10.c
@@ -71,8 +71,7 @@
  * @miscdev:	specifics to handle "/dev/xyz.etb" entry.
  * @spinlock:	only one at a time pls.
  * @reading:	synchronise user space access to etb buffer.
- * @pid:	Process ID of the process being monitored by the session
- *		that is using this component.
+ * @perf_session: Session identity of the Perf event currently using this sink.
  * @buf:	area of memory where ETB buffer content gets sent.
  * @buffer_depth: size of @buf.
  * @trigger_cntr: amount of words to store after a trigger.
@@ -84,7 +83,7 @@ struct etb_drvdata {
 	struct miscdevice	miscdev;
 	raw_spinlock_t		spinlock;
 	atomic_t		reading;
-	pid_t			pid;
+	struct etm_session_id	perf_session;
 	u8			*buf;
 	u32			buffer_depth;
 	u32			trigger_cntr;
@@ -168,11 +167,10 @@ static int etb_enable_sysfs(struct coresight_device *csdev)
 static int etb_enable_perf(struct coresight_device *csdev, struct coresight_path *path)
 {
 	int ret = 0;
-	pid_t pid;
 	unsigned long flags;
 	struct etb_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
 	struct perf_output_handle *handle = path->handle;
-	struct cs_buffers *buf = etm_perf_sink_config(handle);
+	struct etm_event_data *event_data = perf_get_aux(handle);
 
 	raw_spin_lock_irqsave(&drvdata->spinlock, flags);
 
@@ -182,19 +180,13 @@ static int etb_enable_perf(struct coresight_device *csdev, struct coresight_path
 		goto out;
 	}
 
-	/* Get a handle on the pid of the process to monitor */
-	pid = buf->pid;
-
-	if (drvdata->pid != -1 && drvdata->pid != pid) {
+	if (!etm_perf_sink_can_share(csdev, &drvdata->perf_session, handle)) {
 		ret = -EBUSY;
 		goto out;
 	}
 
-	/*
-	 * No HW configuration is needed if the sink is already in
-	 * use for this session.
-	 */
-	if (drvdata->pid == pid) {
+	/*  No HW configuration is needed if the sink is already in use. */
+	if (csdev->refcnt) {
 		csdev->refcnt++;
 		goto out;
 	}
@@ -210,8 +202,7 @@ static int etb_enable_perf(struct coresight_device *csdev, struct coresight_path
 
 	ret = etb_enable_hw(drvdata);
 	if (!ret) {
-		/* Associate with monitored process. */
-		drvdata->pid = pid;
+		drvdata->perf_session = event_data->session_id;
 		coresight_set_mode(drvdata->csdev, CS_MODE_PERF);
 		csdev->refcnt++;
 	}
@@ -361,8 +352,7 @@ static int etb_disable(struct coresight_device *csdev)
 	/* Complain if we (somehow) got out of sync */
 	WARN_ON_ONCE(coresight_get_mode(csdev) == CS_MODE_DISABLED);
 	etb_disable_hw(drvdata);
-	/* Dissociate from monitored process. */
-	drvdata->pid = -1;
+	drvdata->perf_session = (struct etm_session_id) {};
 	coresight_set_mode(csdev, CS_MODE_DISABLED);
 	raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
 
@@ -384,7 +374,6 @@ static void *etb_alloc_buffer(struct coresight_device *csdev,
 	if (!buf)
 		return NULL;
 
-	buf->pid = task_pid_nr(event->owner);
 	buf->snapshot = overwrite;
 	buf->nr_pages = nr_pages;
 	buf->data_pages = pages;
@@ -755,9 +744,6 @@ static int etb_probe(struct amba_device *adev, const struct amba_id *id)
 	if (!drvdata->buf)
 		return -ENOMEM;
 
-	/* This device is not associated with a session */
-	drvdata->pid = -1;
-
 	pdata = coresight_get_platform_data(dev);
 	if (IS_ERR(pdata))
 		return PTR_ERR(pdata);

-- 
2.34.1


