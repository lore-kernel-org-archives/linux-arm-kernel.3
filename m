Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2E71C44506
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 15:25:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HCkYIoh99j9QSJsZKH/gxtvsOoqy4xG+UTQcTHEmvbc=; b=OJYkTfIHiZ/hOcpNx1EhHJK5+T
	+Os1Hhb7Yp9GqDJUnN3wGNtUaKcoM+kdxUcrJ8SAfv6ia+Ydl2G3ImB4EVhSrhp47AdYPDv6o1SX3
	uI9N0RKMNEgMJiZg8JPBdMzEcRSdJVkxMBu6RscXFp9sblicvF71+qAoKTG+DU/Vxfsv9rFuwhb8Y
	/tq3ibyBp/J2g3o90olN52/hYkfEPGV9gMzfXLW8oNs69e9/gntZkKCw8E2rFqr95cw/cQORa9EQR
	O4Ziqwxnqjzfb+QV5VMrp+p/BjErYkZDX5vDDgU+nueHWRApVzkXxrasK59jASs7JNCSnfVc8SL1P
	cOdW8ZPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whqdF-00000002ubN-0Usi;
	Thu, 09 Jul 2026 15:25:45 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whqdC-00000002uYX-38Fj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 15:25:43 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-493c83474ddso18346705e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jul 2026 08:25:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783610741; x=1784215541; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HCkYIoh99j9QSJsZKH/gxtvsOoqy4xG+UTQcTHEmvbc=;
        b=ruVnK398xAcweFxYJ/UB/dQeU0EaCnX6W04hUo54yxeG10uh43vq2j/xqUF5n3+Ydr
         XZiVubStII89iUzfHYP7vg0z2k37AybG1GnijjEJd+QJ3N+ttHDt3qKxKilgVIUdOOWm
         1k+PBqt1Zq0K21pgq1Or7tPs981BPnvbARowvZpxbo3MAd9Fc6dtVtt30mzJt1dF784h
         OCYnbq+HQPSS9rsKW5Xe73TUZFC8xcppSasN83jQgYQ4ivLN6zkFBh1NEGYRuVIctlK4
         kbPvHiLdo/KeCh47ff63vsSoSFD/KIcbLLcP08CNY2wchFV/5/YnLqBiqjRep71vrpJ7
         qDJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783610741; x=1784215541;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HCkYIoh99j9QSJsZKH/gxtvsOoqy4xG+UTQcTHEmvbc=;
        b=RLe4WE9kMOC/N4ynoVlBhF4NJ5uYm+DzT6fQlhFzkDKjfRIOnMmuiiYUAWxA9anwwD
         GizuzsG2x3wvHVqSqvZwVOFPTwCXhvbYRWV33XWDmV5X9Xi02ZU3okOD+HeUaDlGR7/f
         VQOCe0e4ZczlSSGuNEVKQ4llYVtHdLnlU/+x9ZdD2mBuoE3nUijZSOYkmrMOupa340Dd
         xmOsXqsxGS4fuWirvsjJJ47H8oxS7LjVGydPHdZh8b/eWEqFd2ieA2KtnYOfikyfx3DW
         k/Je8H/nAYj4h9tfRLpecA6Tnq/zFIoQUV4hPuVC46kJH0wglHub2U+6uH/IuNAnUvPl
         hUqw==
X-Forwarded-Encrypted: i=1; AHgh+RoWKCmpKmvg24HLMB0GU4oi82V+d8EsDQrDyTcTKeP+AuvQkHBYMhERrxLkxPoOb+gvbRCfv15hDIfwlYie6KE3@lists.infradead.org
X-Gm-Message-State: AOJu0Yxu+tpdD17GGPc40t3t/ouyzMfKwdILOQ4r1w+Rm1ND3yvw8J9u
	O0MHsnp7lReovoUh5VIKFLvm7igTLjPDTOJHgtA35+EzFrV0ZIfxPnv7/qm+P5bxDF4=
X-Gm-Gg: AfdE7clLyUL6Qqii2260nhEmuqAnt/MA0G8OKRG2yThMT8oLq9g952I0ePYG6nQpgh7
	HUwxAQB/m7v0YfKVZI+IPVzEKYrCt1hIqwjpBcclz8hgrIGNNN7GBsiT/VXJAH9j0itUmjxxjjM
	mqavtee2+BwOb7NTBNuEdWxxwECeL9GwozHTZusNMAFfJOfVeroNnBUJV1KOrBuTkMvfxy2iPfu
	5EfesDe3g62/lAZEG1/s1TcRjqb19tA2VUONO2HwAiFaCGOQDvpBZVrdEHnAhl0t1JPMHDllXmI
	IpAG0Wg6z6AL/1MP74H9c3dfGmZOEGPZnp8p6mR1GX9j9zEPrGCdb2nLcI/APT4IIIPEPtEtQl/
	PGVSDK10zuA6Rbn3IMH+SIFTNWUobfOTEl3CCkO/wKgNlT9r2GbkhTAloY5BeFdy/Vya5qPe1or
	/BvMdAB6EjMl48b9w3e24eQA==
X-Received: by 2002:a05:600c:46d5:b0:493:ee57:1207 with SMTP id 5b1f17b1804b1-493ee571321mr24765685e9.10.1783610740817;
        Thu, 09 Jul 2026 08:25:40 -0700 (PDT)
Received: from ho-tower-lan.lan ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493eb73b161sm61866165e9.9.2026.07.09.08.25.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 08:25:40 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Thu, 09 Jul 2026 16:25:23 +0100
Subject: [PATCH v2 3/4] coresight: etb10: Prevent per-thread events from
 sharing a sink
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-james-cs-multiple-per-threads-v2-3-10ac7ac6af0b@linaro.org>
References: <20260709-james-cs-multiple-per-threads-v2-0-10ac7ac6af0b@linaro.org>
In-Reply-To: <20260709-james-cs-multiple-per-threads-v2-0-10ac7ac6af0b@linaro.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, Leo Yan <leo.yan@arm.com>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Qi Liu <liuqi115@huawei.com>, Junhao He <hejunhao3@huawei.com>, 
 Jonathan Cameron <jic23@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_082542_814349_84F3BFF3 
X-CRM114-Status: GOOD (  21.30  )
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
index a827f76b8144..6b5caad330d9 100644
--- a/drivers/hwtracing/coresight/coresight-etb10.c
+++ b/drivers/hwtracing/coresight/coresight-etb10.c
@@ -71,8 +71,7 @@
  * @miscdev:	specifics to handle "/dev/xyz.etb" entry.
  * @spinlock:	only one at a time pls.
  * @reading:	synchronise user space access to etb buffer.
- * @pid:	Process ID of the process being monitored by the session
- *		that is using this component.
+ * @event:	Perf event using this sink if in Perf mode.
  * @buf:	area of memory where ETB buffer content gets sent.
  * @buffer_depth: size of @buf.
  * @trigger_cntr: amount of words to store after a trigger.
@@ -84,7 +83,7 @@ struct etb_drvdata {
 	struct miscdevice	miscdev;
 	raw_spinlock_t		spinlock;
 	atomic_t		reading;
-	pid_t			pid;
+	struct perf_event	*event;
 	u8			*buf;
 	u32			buffer_depth;
 	u32			trigger_cntr;
@@ -168,11 +167,9 @@ static int etb_enable_sysfs(struct coresight_device *csdev)
 static int etb_enable_perf(struct coresight_device *csdev, struct coresight_path *path)
 {
 	int ret = 0;
-	pid_t pid;
 	unsigned long flags;
 	struct etb_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
 	struct perf_output_handle *handle = path->handle;
-	struct cs_buffers *buf = etm_perf_sink_config(handle);
 
 	raw_spin_lock_irqsave(&drvdata->spinlock, flags);
 
@@ -182,19 +179,14 @@ static int etb_enable_perf(struct coresight_device *csdev, struct coresight_path
 		goto out;
 	}
 
-	/* Get a handle on the pid of the process to monitor */
-	pid = buf->pid;
-
-	if (drvdata->pid != -1 && drvdata->pid != pid) {
+	if (drvdata->event &&
+	    !coresight_sink_can_share(drvdata->event, handle->event)) {
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
+		drvdata->event = handle->event;
 		coresight_set_mode(drvdata->csdev, CS_MODE_PERF);
 		csdev->refcnt++;
 	}
@@ -361,8 +352,7 @@ static int etb_disable(struct coresight_device *csdev)
 	/* Complain if we (somehow) got out of sync */
 	WARN_ON_ONCE(coresight_get_mode(csdev) == CS_MODE_DISABLED);
 	etb_disable_hw(drvdata);
-	/* Dissociate from monitored process. */
-	drvdata->pid = -1;
+	drvdata->event = NULL;
 	coresight_set_mode(csdev, CS_MODE_DISABLED);
 	raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
 
@@ -383,7 +373,6 @@ static void *etb_alloc_buffer(struct coresight_device *csdev,
 	if (!buf)
 		return NULL;
 
-	buf->pid = task_pid_nr(event->owner);
 	buf->snapshot = overwrite;
 	buf->nr_pages = nr_pages;
 	buf->data_pages = pages;
@@ -754,9 +743,6 @@ static int etb_probe(struct amba_device *adev, const struct amba_id *id)
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


