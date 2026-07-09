Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2442BC44501
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 10:57:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=19hQZt1oscfsX0v/FVihRWpox5A079jThjyKRh+QFR4=; b=1W7EXfbszQb9tSgbey4fPTAn9R
	RqzH54qFvOaRnJnB5n2k9wr++2//W4NVDMeK5KHf6isdE2ChRNKrQpqX5Z4rKqlvwBHTPtiDK7is4
	Jd7KJMwtdj5ZVw/iWL/jlRmr6Jygj2/kpLk49IHCm6TQUw5CNcC7ndWvm+Qlz7yNFrvZ+LA+fFAI0
	QJrGVkvKNh2hI83nqeVcUsoXoSs0ZTu4IfmLj48e3fyOJqgsglGXxOpBTjpf1CYRiM8WQljF/Bv3S
	PLj+Jahzmk+p3pgoPjgnR+JITuBr+pM9s0aKf15r2vQuI58ZjNNKju2b6LAfnEnqNvMox6euxt5zb
	BZKnc/dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whmRv-000000023R2-1ou3;
	Thu, 09 Jul 2026 10:57:47 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whmRr-000000023Nf-1m4g
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 10:57:44 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-470174001a0so981315f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jul 2026 03:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783594661; x=1784199461; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=19hQZt1oscfsX0v/FVihRWpox5A079jThjyKRh+QFR4=;
        b=SbFB92cLBXPsVY6niqNqsxfXJYE4Nt01e4SfKIgk/8NNwklzeFmjzbyDlG6tRO+lJX
         U5g3dTzcGAbnkKWbBXCEhhcObpYO/7rR7JPnapnhX2EJytffeA94Lo/Jl52KUxgkahoj
         HvikxmUeqHPfRMQLI1qf1/fM+O9TRIpHhRZ4RakxYvse5kqpn5h1rf8FnTMn+1ecp7Hr
         IWW7rLpYJIvOHkieWkkTsHsMsUT/mx6+6tcc08lfqRcNUq3fmj2D/+Xml2M1fWw8ZuGI
         gkHrue+xBVnwVuiFGOy1Bd7FYDjf+oiKb6VbhahJfedubDH7OdECyUwxkgGViVGaj2o0
         /eTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783594661; x=1784199461;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=19hQZt1oscfsX0v/FVihRWpox5A079jThjyKRh+QFR4=;
        b=TeCbCSUgRVksrA+/LiDytqmsD4d+cTqnza6OMiDdmyxVmpAfIIstB8x3Vyd9I1X7YW
         Spa+4FkWmH967p3ZPOXTzeTjyQC/AxOBHzihOl82T6V32KcuF0MSADSgJHY5lcYot2sW
         RbuR+YVXDXCJETJgLIHWrjfkYOELU94a8CtQR0lHMZ9hD1SBg6MqDGJE3MXK6vSRSbAn
         97LYKII+n5l6oP/sBVzVW4ak08c7JvhaW31fWAwbm/9xSBFB2rIyIB0sHT1Zvsm+ZVem
         UjvUG10m5drfCtlxrFsghEsCLt3WiwykD8S0NEk6DeuCzzl0Kgr4c+f1aNQjyQQ4dBOL
         CJdA==
X-Forwarded-Encrypted: i=1; AHgh+RroSOfwYEOJHIQK3yPoZlelL/vB5bWsc56S9LojdPtl5jM4OaBTLGNN1ed5sOl5dT1gI51Wg/3u/99r6NdS3/nD@lists.infradead.org
X-Gm-Message-State: AOJu0YysGc9E+aODCUSjOB5kl/Izx36KHy/9eyrS+WkQQnYvxFF7tZIu
	YW5xh3c7UZYpxkbItHreUuUuusv7LtcLwiFAqpQxflPgCmHjgb+dZNpYJx6uvVG5O8s=
X-Gm-Gg: AfdE7cmQ91QCBvMTPQDDAeQ1Tpp8ZP5wHwstIxu3byukw3wCuMsW1j2dpoNmijP0M7Q
	RyQK3Mas8/Lm04x3JH1Fbx6oO/IzpvBqXkJ3CTtc3RDN3bxhqz1r2MfZE3VZqM9IiOQ/XEXyAPu
	RSfYLEqjoBnxBbyZoYMncmUAVWkRSJ7qhDSexQfPwm35jYWlzy3XsrOonDxCDYeZbFfy1kOuvWs
	/szRQJ8srVyA5CT4T74lbtc/5zqyeMm/jeWjxxO7vaF4/w/d3GtNlWg4srIEu/KrinrPoqwZ+NA
	VkTqD3ISLHK37jQGIy7inxfS/Q975berzghvVAwBgq/TLmH1cR5uyqvgfKe+4u1RhRhqqVEms3c
	yV/G8UMSD8iTRgYGgLdgqWHI4f+t48Dx0FDR0xkRWEPRi3JVUU/rblCUx9RnO3MvhfRjN+3NNbT
	Fx2FxWTY22i4YO38rlz1YDNTiSMDb/vGOl
X-Received: by 2002:a5d:59a5:0:b0:475:f0f0:9eca with SMTP id ffacd0b85a97d-47df08147e4mr6730385f8f.53.1783594661501;
        Thu, 09 Jul 2026 03:57:41 -0700 (PDT)
Received: from ho-tower-lan.lan ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9b4d850dsm51927408f8f.0.2026.07.09.03.57.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 03:57:41 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Thu, 09 Jul 2026 11:57:24 +0100
Subject: [PATCH 2/4] coresight: tmc-etf: Prevent per-thread events from
 sharing a sink
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-james-cs-multiple-per-threads-v1-2-d384e6d477ac@linaro.org>
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
X-CRM114-CacheID: sfid-20260709_035743_512177_9AE4761F 
X-CRM114-Status: GOOD (  20.42  )
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
 drivers/hwtracing/coresight/coresight-tmc.h      |  1 -
 3 files changed, 7 insertions(+), 19 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
index c89fe996af23..77bdf8892617 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-core.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
@@ -801,8 +801,6 @@ static int __tmc_probe(struct device *dev, struct resource *res)
 	devid = readl_relaxed(drvdata->base + CORESIGHT_DEVID);
 	drvdata->config_type = BMVAL(devid, 6, 7);
 	drvdata->memwidth = tmc_get_memwidth(devid);
-	/* This device is not associated with a session */
-	drvdata->pid = -1;
 	drvdata->etr_mode = ETR_MODE_AUTO;
 
 	if (drvdata->config_type == TMC_CONFIG_TYPE_ETR) {
diff --git a/drivers/hwtracing/coresight/coresight-tmc-etf.c b/drivers/hwtracing/coresight/coresight-tmc-etf.c
index 8882b1c4cdc0..4ed83f07eec8 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etf.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etf.c
@@ -250,11 +250,9 @@ static int tmc_enable_etf_sink_perf(struct coresight_device *csdev,
 				    struct coresight_path *path)
 {
 	int ret = 0;
-	pid_t pid;
 	unsigned long flags;
 	struct tmc_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
 	struct perf_output_handle *handle = path->handle;
-	struct cs_buffers *buf = etm_perf_sink_config(handle);
 
 	raw_spin_lock_irqsave(&drvdata->spinlock, flags);
 	do {
@@ -270,10 +268,9 @@ static int tmc_enable_etf_sink_perf(struct coresight_device *csdev,
 			break;
 		}
 
-		/* Get a handle on the pid of the process to monitor */
-		pid = buf->pid;
-
-		if (drvdata->pid != -1 && drvdata->pid != pid) {
+		if (drvdata->event &&
+		    !coresight_sink_can_share(drvdata->event,
+					      handle->event)) {
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
+			drvdata->event = handle->event;
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
+	drvdata->event = NULL;
 
 	raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
 
@@ -432,7 +424,6 @@ static void *tmc_alloc_etf_buffer(struct coresight_device *csdev,
 	if (!buf)
 		return NULL;
 
-	buf->pid = task_pid_nr(event->owner);
 	buf->snapshot = overwrite;
 	buf->nr_pages = nr_pages;
 	buf->data_pages = pages;
diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
index 220fe45fca83..595d6a3b0767 100644
--- a/drivers/hwtracing/coresight/coresight-tmc.h
+++ b/drivers/hwtracing/coresight/coresight-tmc.h
@@ -254,7 +254,6 @@ struct tmc_drvdata {
 	struct miscdevice	miscdev;
 	struct miscdevice	crashdev;
 	raw_spinlock_t		spinlock;
-	pid_t			pid;
 	bool			reading;
 	bool			stop_on_flush;
 	union {

-- 
2.34.1


