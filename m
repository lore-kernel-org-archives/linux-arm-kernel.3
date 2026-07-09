Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63CC1C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 15:25:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=19hQZt1oscfsX0v/FVihRWpox5A079jThjyKRh+QFR4=; b=X7y+SCEyFgJLfjiZEm8/gdho+Q
	YWMrsiZvlowP6fF79XyYP57lUvT7o1+LvpWXGPIgBAclF2Z4697EQsgz2h6Mwep5JMg9t/qzG/634
	NZt1lTtXA0wcvnDRlDW/g5+kTgdUvG4iiOlAKBuC5Pv0FuYo0wTyjI0N+PGA7NoRU5q1l4DbN7OgB
	xfIMCqBaji9+MkNlXy6h74go6y+/YwndVOJV0HNeMEVMKgkE9WaJJIz8XEVa5SbOWMyHXD1arU0nE
	vpn5OWmGgQ23tzDu/6SadZoSW/DpDe7aV1TK/e5Ry/OrDgEDGcPMoD2AgpvudvYCDPwcrJlsowGlB
	uqpho74w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whqdE-00000002uaz-40g0;
	Thu, 09 Jul 2026 15:25:44 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whqdB-00000002uYI-2XAo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 15:25:42 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-493c5220cb7so16289475e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jul 2026 08:25:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783610740; x=1784215540; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=19hQZt1oscfsX0v/FVihRWpox5A079jThjyKRh+QFR4=;
        b=fZs/xpWeOpLryn+X1JQ23MsnXCfZT1tPHfWUsnAFXlQe4U9MyN5508ErlpMyYPRWfT
         8H8/+v14SlIE0jjnZlO2c7tY26ycq3y3yfgwhRJatWK5FNYTU4GYPEsfEfU4Mpmo580m
         o21gOkT51/gioh6qfW/Hc5UPbTKtSBBjGLb4deMDy3lMbU8xQVGl8fiXFaBf25GmbvcY
         AkuKjanITLiTPefrrSNVejGuQx5VzFglx76RV+osiscc3kpN2X9CmBeAd8rmiUI7HmiH
         bq95ep6kjIlEZi0INimkFHYYwssy4J6qxb/RfK6BBW8RBqHmrV7oGkV0qI7jNXypWzDX
         ixkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783610740; x=1784215540;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=19hQZt1oscfsX0v/FVihRWpox5A079jThjyKRh+QFR4=;
        b=oi2PJd9BvnjOtHk0loKH1yO2NDzbeYBMANlz8bFwcO+11Lg7zSuTBLR0m2ucN6UfSW
         yr+g2m83oTPKpIoRSVaLhfWLW9/L2e7e5hUafTlMdBC2ORRx3UiUq9lezwg6+yyKvsPh
         VqD/M1HDcI+nnt0kCdLZp4WWaSnSKMElGW6RznYWbti1ZNZYl52dv08VBJl0EYIS5ber
         XoFXLkOeGVL4q+aPt0YLPx+a11pFcuVDoVk5vi0bu5uH+U3tJmeSB6dMkJv1hILtzOfi
         AxwV0D6hoQMVKKfTUtA9TntmFs7q83NaEaCv5qzo6+TFMDOqdKPfE/RaJcyxDDgATB3y
         Yc+g==
X-Forwarded-Encrypted: i=1; AHgh+Rr2Lhvq8kOSqBfgwXbkNErqs66jtv3+hez7HgsiQAw8ufURVZ9E058YdMzgL9wEVYuutXYG6yO5aapd4Fjb5Jgy@lists.infradead.org
X-Gm-Message-State: AOJu0YyIk6dk+OwbY03x0Z+w7NJ82AzMIlPghxjNv+LJJNnYXQOHvA6Z
	wsGV2MvTzbu9YRJlUL+mAYMvK/1nEZxOwndw2rqu30sKDyfkr3P/Wag7CTuZhV/7jh4=
X-Gm-Gg: AfdE7cnHCQ1hAg6wCl9++3t2d5QstsO5muMElRSErFEz2vU6k13LyxvcaKPQH9kcLYv
	8dGUn1neKO87Fw61r2HR461R6OsJ0CwJ/S2GraAnxxOlflGa6z1puyDaTjEu/uIKn3KNHB6We1+
	+Lm9yO1jIB4W7yRl2G92tXgbPeA/OWoX5Qf3zbZcRcHuHCYNlqRJey7YDQaK0Kb9LhoLMcxvoJn
	dfRGFaOMMRM+H4eYTsapr12MAnoQbSP+YzaRAdpNFiWwaVBdXc7YposfAwfG1SFQ46MBgsVmoI9
	9+Ao+7sivZyFjFChTRoIhrKMRimiPDkc5YJC3owCd6TiNvGWXUtn50XnIzHWzm8XV8IhHG9JzXr
	hCRlMBeh32rp2YU0EW4MTLarkZCVwVfS7oNG6LQfWKUKznyL0CIZOSAZETB0TFUPQsYjek5xqtI
	4KNew1yEhWJ1hOmYWuo/Txjg==
X-Received: by 2002:a05:600c:3b28:b0:492:7142:f46e with SMTP id 5b1f17b1804b1-493e689487dmr78790675e9.2.1783610739703;
        Thu, 09 Jul 2026 08:25:39 -0700 (PDT)
Received: from ho-tower-lan.lan ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493eb73b161sm61866165e9.9.2026.07.09.08.25.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 08:25:39 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Thu, 09 Jul 2026 16:25:22 +0100
Subject: [PATCH v2 2/4] coresight: tmc-etf: Prevent per-thread events from
 sharing a sink
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-james-cs-multiple-per-threads-v2-2-10ac7ac6af0b@linaro.org>
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
X-CRM114-CacheID: sfid-20260709_082541_696807_BCE2C161 
X-CRM114-Status: GOOD (  20.53  )
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


