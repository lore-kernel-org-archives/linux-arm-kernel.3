Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25697C44506
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 10:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HCkYIoh99j9QSJsZKH/gxtvsOoqy4xG+UTQcTHEmvbc=; b=kAskaWj+sMp+mnz1Nt6Q1Mui/2
	sX7pcwizas53C5imMHj7FBbqjiFXD+Xwh9NLaEn01PXPWFnuHabl3SVvZLYzQwHYDtL5a7s+Wfe5Y
	MzWOtNkbaOUZ1PnfkLcPUjGu7a/dZGDcuKUxFfOZKkCH+iVETEMpNYEeeurzVwWttUTG3skuVzZKn
	Rs/x5xwljeN5mKByzRAbRtckc6PqymmxLHNzhsLpsFKNvDJ1jOCeyq7L9LEA8YWTYI2dKDwXSBczS
	oeh66Dtoa0qHzF5W7EKg7kyEyby9HgC0EGO/c88CdiK5CRfZ62aKp5akuhy8s3Us+y2YxaOh3/Iku
	ukuNmWxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whmRv-000000023RK-2JQM;
	Thu, 09 Jul 2026 10:57:47 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whmRs-000000023OD-38JK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 10:57:45 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-493c733f15aso7677525e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jul 2026 03:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783594663; x=1784199463; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HCkYIoh99j9QSJsZKH/gxtvsOoqy4xG+UTQcTHEmvbc=;
        b=Hks4alv4dU0SWqZPXfeRnbbIFZjSVyATgnxSAE+nyHjjdYFdElkGBy5IjxVJWqykkX
         u74rzt1u+C0gfY+hR45z601CP9ZlcSQmSS42uzm+RNk/D3zO8ZcGDL8RK8b7s629y/s4
         +bjXuuTBgQfoDdB4d7P67PKAN2+AQcGLZLfu1EbEl/m4bN2H4vxVhSQvEno/jJPLIxTM
         sp7eIZUyk5QaLXyFtCb4Ogt3YBYv/zCQz0IgtN1Advxa0gastDDwoePCfDsa5wRQeyA9
         EL+WzkKvLuenJfUVBvkE0GmeXdD1PFxi9xPscHIZvoKv7fCDcZYerpWr3/6GGjwEhEmZ
         xKFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783594663; x=1784199463;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HCkYIoh99j9QSJsZKH/gxtvsOoqy4xG+UTQcTHEmvbc=;
        b=RA1IfSJJrfHQvEcExyLyBosG/3CrNiyAXg9Qk8CyF6Xfh0cFsO5w/9MmtlnoqrlD4T
         3y85JfvLEM6lV8eX+6xXAcGty6QmIa08KOLkNZ7ahTjUdVT/hajFLsJ9EFmnjwB6LD0f
         PnZjcZehvLXvvAT3MDTwv59tOGUsI8KAqGMVG6dbT3sNYlid1EDmUGenZQqopGt05Jrn
         mJVXR4GlKgONP4H/mGJNee2J8T/THNO8TecW84oFcBTBTd4G1MUC3gWo80kM17gaUkPG
         /cSTsYjY6i1rTgiLIoEErxnc2dQEt7CIidbxUywm4NBZUho/oNvcHdRJvJTYdNqfmRGX
         GrEA==
X-Forwarded-Encrypted: i=1; AHgh+Rr7uctpJTvd4oQDHbhrTD5EpGAKQ4cowbz5EiOQGK02OLS+6opS0nfAFJdoTl4rRPQPC0kzH1zqbHFcxuRebuYl@lists.infradead.org
X-Gm-Message-State: AOJu0YxJY+fp5RMll85GDAvSiJHIqmpVZVEKpy+cq8W5rjs6EOc0lUMO
	Pf04FXXXQHbE1JXrF7fgLEYK4249/lGoNfPme+CB7YRNPSlghY1Y4GMTdsEePXOcIHM=
X-Gm-Gg: AfdE7cm9uyAkhM882nOAEDvuZEf5+FIcuHcoF5JwZJygaYPadioZkCh3UScOPv7CndM
	YeR5ADvsurQfEXhQuCwWmL9t8XO6yoCGAPDOn19BEX48q1BIwjFP0AIfiLVhWOTcYSGFC0L7cy6
	SSGSoWdf028olqbySwckIvk4D3TaaEBtfCOorP5jJd+lDS69Kz0dvfezMO/zcFGKAjeaSBxxIiw
	6Z78442UP6xMSieF4zrDfCeDZjmoKGxOD5T+NC7yqd2PjqpoHmp0lCT7FgLtD0BdtxndM87eqox
	3eamopYP/yhc7GwcKNX66N2eGe0y+aaPs2H9kChUJi0BdpQN67DcEBhR2b/YTwMPHCabFMmv1Nj
	t8nyCakSyMv2FSVRb9f/mbWmeHoBp6EQNj8594Ija2uloK3xnlo9bnOU1U6MDUjt+NSt5OumNz5
	tMV1txxKcYpD8OnWAgJnu5A1Bk0qn0LkjZ
X-Received: by 2002:a05:600c:8b05:b0:493:aaa2:f034 with SMTP id 5b1f17b1804b1-493e68cf39amr64454755e9.26.1783594662856;
        Thu, 09 Jul 2026 03:57:42 -0700 (PDT)
Received: from ho-tower-lan.lan ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9b4d850dsm51927408f8f.0.2026.07.09.03.57.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 03:57:42 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Thu, 09 Jul 2026 11:57:25 +0100
Subject: [PATCH 3/4] coresight: etb10: Prevent per-thread events from
 sharing a sink
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-james-cs-multiple-per-threads-v1-3-d384e6d477ac@linaro.org>
References: <20260709-james-cs-multiple-per-threads-v1-0-d384e6d477ac@linaro.org>
In-Reply-To: <20260709-james-cs-multiple-per-threads-v1-0-d384e6d477ac@linaro.org>
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
X-CRM114-CacheID: sfid-20260709_035744_818650_10BFCE32 
X-CRM114-Status: GOOD (  21.29  )
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


