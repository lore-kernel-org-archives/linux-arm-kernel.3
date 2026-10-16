Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFA5CCCA48B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 10:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qGm4SLdWsex3TDK4XDh52mYFdu6ojIEx0Vd3ILXjiGU=; b=ZRzCygIwCENUOUCRVFoZm7PeKY
	S2euMjXgDkRdlwjKYDRmcas57YPsRQn6ZAyeYNbAxU6T+P9oFBbZLh/uDL2emKAuRUEDsouPEekCg
	3Nlz1dB+5uvf2qo/YZHq2KKQ3x59S4uTKOYb02jYERepzdACWpenbNddE3xmDrcyYe7s6QHMD0aZk
	MdTxMIZw+7pJXDaZr4WNZTtxGZdPkOQf3hX1sBikxqT5DGVotFsjpbK8UKbLUgHc1jneGD0CpwBZa
	57M5x1OP2TbDE6sMmB5emC7UPdnNidzNe+TWzH6oPx9/e8Tq/5/HxNegTM1YhAdotaRacrBxsHnVs
	DsfsiP9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHfT7-00000002i8g-3jt6;
	Fri, 16 Oct 2026 10:47:21 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHfSl-00000002hoB-37RT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 10:47:01 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-48df8fe8513so1321922f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Oct 2026 03:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792147618; x=1792752418; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qGm4SLdWsex3TDK4XDh52mYFdu6ojIEx0Vd3ILXjiGU=;
        b=xkcwFf1Rpgwo5oxYFEJsv4cNn4bONArhtUnyvPPx1S2BAzw2tegmsQNZCENh4q8E1p
         WFaBXWsUc9SG+xxwT0UdlDydnTuxMaBc2l58xcvJrvFZESjGDV1c7WlJwb3p72vRo3Hh
         p5ry0uKv6uSTfHunfigpqqHZaAcwJi8HR1ynQOKoyzsn2VGmG9KnMTAGwHer4Z+yD8i9
         uGeIHKahtxSvJXQz61ineeXvJmRX9VvrsDMfaCQqpq8KDsa5Jv9yu4sMDQJBkevPZbNW
         WPUjoXb6079c8d700RsVpiGRiuU+hmqn1r8mX/qYf+4JlvM9wN+1+p0GyH6Am9XWuqK9
         18Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792147618; x=1792752418;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qGm4SLdWsex3TDK4XDh52mYFdu6ojIEx0Vd3ILXjiGU=;
        b=fhZH4n7E3/RfEjiDi7UDnMVnNkEJWN6ceb9skd7sB35IcWK6xikBxARjkPLpCTzHhK
         cW32Bzg9XVLnLVQaj0vXWT8te/++EzWjg5aj5veK9gsWNTm/TAkJo5LkPVYFcdKj9JAE
         Hr3Pl623Hhhz5Y0jt06x80TK2tPuUdySvPUKUGpU2ROkxXUmetC7KfQ9I8gLb87XYzQg
         4QVbxs9Ibx55w/ZrWZrTggXJX+alziGzToJHeEuTNkIx4XWfp0+cKQPaQdlsgL29xHeZ
         rPjQNNvr78WL10JRBzp15XJNfq0/shTNc10A+6XPtbu8nq9wVW6XEIdqWjc9HE/g6SGi
         sriw==
X-Forwarded-Encrypted: i=1; AKwUvBxvZ+rjCYNyseuvfE2VSKmlcXwcm1RL/huNG6H/yQD/DYRP/E6WqF9dve9hYq5ABvpH6jr8c+5vJXnyMHhjLYhH@lists.infradead.org
X-Gm-Message-State: AFq9FYLmPa4NqOoIQsLpw8yDEhgJU2eTrm2Anz5zUajIlsiG0+UiCjst
	R0i5Xj/dsGoNE7gweVsBlI4vrHRaJ4SHasmebG6v9GRQS1iOC0oFvdhkthjdcU46j1U=
X-Gm-Gg: AYBFou1/yoOrFQHHQSB2VMUPU2dD4AQ49uH5or9j6ETMjcOiy32wpHVpwuZVLQfG2nr
	P/SiQm3JOY/J2k2KTIGfWcXWy7KJc8DqoVuEJbZ9Ut+2ttXDi8XAZgGMUKSH2jM7P0doq2HGZz3
	toRuDtnyekJpfXLuK6ath+wfsIfXunNkFqQSFoW+zzx/yFXaTgCkIvGS1A8vvsMU2yBVQWzBHxd
	woHPCF4AIwzVqiljl8tPid0m3+AmfW4pNEN4a8s6PCy+Enp9DlSVsIN4ia1VaXAEwZHIPZ5UcSZ
	kWzt+EA5qIwZUGFcILBgTXQEQQxIXMvlJZAJsbMhO4hq6/nLMKptM2BifzETL+sTU+t5gIPM14z
	2zAew3hO/OQGjqZ6VcQLQoDLFqIYaYFXafA2F/mjXQpkf29LLP92ibRG3VlZsFTDbjS7SLkjj63
	6clCFNk/33fZpFrmLLTFbJwrbtra2rRt+ts0wQGRRasmGfBNtKEMYRJXj3+1J6PV9/qGgKHR6CB
	A==
X-Received: by 2002:a5d:64cc:0:b0:48d:f7ef:cd1d with SMTP id ffacd0b85a97d-48df959a7a5mr7175683f8f.9.1792147613239;
        Fri, 16 Oct 2026 03:46:53 -0700 (PDT)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4e7ff1sm4556570f8f.25.2026.10.16.03.46.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 03:46:52 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Fri, 16 Oct 2026 11:46:19 +0100
Subject: [PATCH v4 09/10] coresight: etb10: Remove sharing guards from
 ETB10
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-james-cs-multiple-per-threads-v4-9-dedf961aca0e@linaro.org>
References: <20261016-james-cs-multiple-per-threads-v4-0-dedf961aca0e@linaro.org>
In-Reply-To: <20261016-james-cs-multiple-per-threads-v4-0-dedf961aca0e@linaro.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, Leo Yan <leo.yan@arm.com>, 
 Suyash Mahar <smahar@meta.com>, Yeoreum Yun <yeoreum.yun@arm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Qi Liu <liuqi115@huawei.com>, Junhao He <hejunhao3@huawei.com>, 
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, James Clark <james.clark@linaro.org>, 
 Jonathan Cameron <jic23@kernel.org>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_034659_836843_EA4B59E3 
X-CRM114-Status: GOOD (  19.75  )
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

Potential sink sharing is now identified during AUX setup. Trust the
core sharing rules when enabling an event and use the sink reference
count to avoid reconfiguring hardware that is already active.

Remove the redundant PID tracking from ETB10 and its buffer allocation.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/hwtracing/coresight/coresight-etb10.c | 28 ++-------------------------
 1 file changed, 2 insertions(+), 26 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etb10.c b/drivers/hwtracing/coresight/coresight-etb10.c
index a827f76b8144..75c5a71d8d68 100644
--- a/drivers/hwtracing/coresight/coresight-etb10.c
+++ b/drivers/hwtracing/coresight/coresight-etb10.c
@@ -71,8 +71,6 @@
  * @miscdev:	specifics to handle "/dev/xyz.etb" entry.
  * @spinlock:	only one at a time pls.
  * @reading:	synchronise user space access to etb buffer.
- * @pid:	Process ID of the process being monitored by the session
- *		that is using this component.
  * @buf:	area of memory where ETB buffer content gets sent.
  * @buffer_depth: size of @buf.
  * @trigger_cntr: amount of words to store after a trigger.
@@ -84,7 +82,6 @@ struct etb_drvdata {
 	struct miscdevice	miscdev;
 	raw_spinlock_t		spinlock;
 	atomic_t		reading;
-	pid_t			pid;
 	u8			*buf;
 	u32			buffer_depth;
 	u32			trigger_cntr;
@@ -168,11 +165,9 @@ static int etb_enable_sysfs(struct coresight_device *csdev)
 static int etb_enable_perf(struct coresight_device *csdev, struct coresight_path *path)
 {
 	int ret = 0;
-	pid_t pid;
 	unsigned long flags;
 	struct etb_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
 	struct perf_output_handle *handle = path->handle;
-	struct cs_buffers *buf = etm_perf_sink_config(handle);
 
 	raw_spin_lock_irqsave(&drvdata->spinlock, flags);
 
@@ -182,19 +177,8 @@ static int etb_enable_perf(struct coresight_device *csdev, struct coresight_path
 		goto out;
 	}
 
-	/* Get a handle on the pid of the process to monitor */
-	pid = buf->pid;
-
-	if (drvdata->pid != -1 && drvdata->pid != pid) {
-		ret = -EBUSY;
-		goto out;
-	}
-
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
@@ -210,8 +194,6 @@ static int etb_enable_perf(struct coresight_device *csdev, struct coresight_path
 
 	ret = etb_enable_hw(drvdata);
 	if (!ret) {
-		/* Associate with monitored process. */
-		drvdata->pid = pid;
 		coresight_set_mode(drvdata->csdev, CS_MODE_PERF);
 		csdev->refcnt++;
 	}
@@ -361,8 +343,6 @@ static int etb_disable(struct coresight_device *csdev)
 	/* Complain if we (somehow) got out of sync */
 	WARN_ON_ONCE(coresight_get_mode(csdev) == CS_MODE_DISABLED);
 	etb_disable_hw(drvdata);
-	/* Dissociate from monitored process. */
-	drvdata->pid = -1;
 	coresight_set_mode(csdev, CS_MODE_DISABLED);
 	raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
 
@@ -383,7 +363,6 @@ static void *etb_alloc_buffer(struct coresight_device *csdev,
 	if (!buf)
 		return NULL;
 
-	buf->pid = task_pid_nr(event->owner);
 	buf->snapshot = overwrite;
 	buf->nr_pages = nr_pages;
 	buf->data_pages = pages;
@@ -754,9 +733,6 @@ static int etb_probe(struct amba_device *adev, const struct amba_id *id)
 	if (!drvdata->buf)
 		return -ENOMEM;
 
-	/* This device is not associated with a session */
-	drvdata->pid = -1;
-
 	pdata = coresight_get_platform_data(dev);
 	if (IS_ERR(pdata))
 		return PTR_ERR(pdata);

-- 
2.43.0


