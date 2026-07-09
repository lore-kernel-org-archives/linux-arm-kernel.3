Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE517C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 15:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LIokI2pa1AcM6PxvAETcFVc4Fio6uc/VkJsrcD6qFu0=; b=TPxvEEwhfmbx1Wm2I+aN2DzldV
	J4dz+rSsacTQRg7T8b5+Bk8xXgFvlSy9CmZd95uJggsr47xQx6Qn63BbqTULiqSTqRag+33JOml0D
	iEisw8NuzSvjv6aS90rZ/H9DyP0vLAOfbQ1jC5JuEWjqeV+48vwKLKch1cH7/Wi82ZYmyE/9ew1d5
	Km6jHjtd2TGNia3ZT0wMSpHbvba2bwSsQYwnXFWS3Ni9VvAsft7CRd5Vq01cvzTOzsl9yfYsHhYjf
	87BUycXUC/fgIEiQe4MnbmTLYsazPy5g6PMAEqYX6M9kS2tOP798+5mCjb1gpd2p+oveZW/ihjKLV
	vmiNlQeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whqdM-00000002ufF-1YP8;
	Thu, 09 Jul 2026 15:25:52 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whqdD-00000002uZD-2SYe
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 15:25:44 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-493f25d47dcso450075e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jul 2026 08:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783610742; x=1784215542; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LIokI2pa1AcM6PxvAETcFVc4Fio6uc/VkJsrcD6qFu0=;
        b=fsZZjcsUeHXWwGWdDzzixbfuzuqsdDMxicQnQ9DN3DG4WavDU4jRbplfJleN9w6C9V
         63EPgprJZe33vPvK9YPRlApJGDsREY/+O5ufiU8WUgp3pCeB1WOsqHyJANj9lJeNEN/Z
         p2Cv729OXneagA0p5FMYNbc+033gL+RoLrHpcvDjPDsicmQy5DopxdB3VtziJFSHOvpS
         HwjlcyxLfZXc5tIaoNZ9KnIgwHR5SqhJSuBRxmlrsOYhOgeuvo08CXZxrh7m2NLH3vcx
         3oCOjjQL/XGYA8of8VuOMWqpcSSIVXVDLbv+0zz8R5wl2UwunfT3j8wIEgLg+HS8FSej
         yQwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783610742; x=1784215542;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LIokI2pa1AcM6PxvAETcFVc4Fio6uc/VkJsrcD6qFu0=;
        b=VdGAuMYljnOKPlAT76IijgicFIqXgG0pyDNSfNcD0NBVGbQcmasNHxKHBFM08J7K9W
         KFUrjZj5zPBxz/MybTAlPbqMnDsdf0gB9clB8wamZa6twvp9+15bnZERTVNnZWSC4y6i
         l43zaIy6Zr7kyKtI73YrmidFuh94fy1oXh7izJ6YGdS7aKe3sBS86WA1sG70BhMDlTSD
         TCAqfJtxOzW1gz45EwFaPoQ5e7MEKdDtKsbCCHJzN0cojCMD57ORDb8ww7aXsau2kkw2
         25klAiPzdkuuyyLaCE30Yq9Y3QV1MNTNZnKlfkHcOC132fd3XBFquFFHmCk1ZAcMOrfM
         NXAw==
X-Forwarded-Encrypted: i=1; AHgh+RpWyWac7iN51v3buBW7ZGFhQzE+bOqwX6DkaQW+CapnO9eHBsZmwFJlfRJbOPMEr6mpeM61ID6KhBUmuBNnSBEl@lists.infradead.org
X-Gm-Message-State: AOJu0YxhAAys3L6GKd6UPDn2clUcU8Szxcewg24t+O93fghTn+xDLGDV
	KO2Lj0ecMtAtYXXvmMgQwtbDVw3kaI243eZjAASecCgCr4sB2wVJ56D61pq/LvQ2vsc=
X-Gm-Gg: AfdE7clgkt0spUUkAFcagZwYgVnYApx1AkMp1HY2HiynZvzvb0en4Tj09Rp0af5eyfw
	Cz5GtiFSQcX2Blzlyef/qgThO6NLqlkI3+G8jK3gD1Wm7urKs8XFAfGh4pSMOoWRMhiWqDztsKd
	++/p1+bEGn0VXRiEnuCsyhNbtLVxe1ec2POG9L/nHY316EpuDYbxBoioMUIX3mgL7t4rl+VZpoj
	Y59fJYd/Q7UMRK//SzLQcFGUfRqpbZPVpq4laHe0uwiPYTu2MtSut7gqPbr3an77x31VBsT6tw8
	00L7bDoUEH8XKpuPPCrfkTbcKw/VC5ed7qlC1ZFUuPUB8PrXZSHbws5M6MH/OxWrQ3zM1t30YBV
	Iuic9187PSsRj6YpPfY8gY81Xx91waEJJ0DnndZfLe2q6OjBDkGcnVC21wYaUzAl7W31TRjhv5W
	32gpDvgXwrNJ8zCwunTXQkDg==
X-Received: by 2002:a05:600c:8a17:10b0:492:4723:166b with SMTP id 5b1f17b1804b1-493e689a70dmr58360205e9.13.1783610742002;
        Thu, 09 Jul 2026 08:25:42 -0700 (PDT)
Received: from ho-tower-lan.lan ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493eb73b161sm61866165e9.9.2026.07.09.08.25.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 08:25:41 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Thu, 09 Jul 2026 16:25:24 +0100
Subject: [PATCH v2 4/4] coresight: ultrasoc-smb: Prevent per-thread events
 from sharing a sink
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-james-cs-multiple-per-threads-v2-4-10ac7ac6af0b@linaro.org>
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
X-CRM114-CacheID: sfid-20260709_082543_648843_3716B32D 
X-CRM114-Status: GOOD (  21.09  )
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

Like the previous commit to ETR, SMB sinks shouldn't share per-thread
events. Fix it by returning -EBUSY if a second per-thread event tries to
use the same sink.

Fixes: 06f5c2926aaa ("drivers/coresight: Add UltraSoc System Memory Buffer driver")
Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/hwtracing/coresight/coresight-priv.h |  2 --
 drivers/hwtracing/coresight/ultrasoc-smb.c   | 22 ++++++----------------
 drivers/hwtracing/coresight/ultrasoc-smb.h   |  5 ++---
 3 files changed, 8 insertions(+), 21 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/hwtracing/coresight/coresight-priv.h
index dddac946659f..492f050eb698 100644
--- a/drivers/hwtracing/coresight/coresight-priv.h
+++ b/drivers/hwtracing/coresight/coresight-priv.h
@@ -94,7 +94,6 @@ enum etm_addr_type {
  * struct cs_buffer - keep track of a recording session' specifics
  * @cur:	index of the current buffer
  * @nr_pages:	max number of pages granted to us
- * @pid:	PID this cs_buffer belongs to
  * @offset:	offset within the current buffer
  * @data_size:	how much we collected in this run
  * @snapshot:	is this run in snapshot mode
@@ -103,7 +102,6 @@ enum etm_addr_type {
 struct cs_buffers {
 	unsigned int		cur;
 	unsigned int		nr_pages;
-	pid_t			pid;
 	unsigned long		offset;
 	local_t			data_size;
 	bool			snapshot;
diff --git a/drivers/hwtracing/coresight/ultrasoc-smb.c b/drivers/hwtracing/coresight/ultrasoc-smb.c
index 20a950b9dd4f..12d2f855de25 100644
--- a/drivers/hwtracing/coresight/ultrasoc-smb.c
+++ b/drivers/hwtracing/coresight/ultrasoc-smb.c
@@ -216,22 +216,15 @@ static int smb_enable_perf(struct coresight_device *csdev,
 {
 	struct smb_drv_data *drvdata = dev_get_drvdata(csdev->dev.parent);
 	struct perf_output_handle *handle = path->handle;
-	struct cs_buffers *buf = etm_perf_sink_config(handle);
-	pid_t pid;
 
-	if (!buf)
-		return -EINVAL;
-
-	/* Get a handle on the pid of the target process */
-	pid = buf->pid;
-
-	/* Device is already in used by other session */
-	if (drvdata->pid != -1 && drvdata->pid != pid)
+	/* Do not proceed if this device is associated with another session */
+	if (drvdata->event &&
+	    !coresight_sink_can_share(drvdata->event, handle->event))
 		return -EBUSY;
 
-	if (drvdata->pid == -1) {
+	if (!drvdata->event) {
 		smb_enable_hw(drvdata);
-		drvdata->pid = pid;
+		drvdata->event = handle->event;
 		coresight_set_mode(csdev, CS_MODE_PERF);
 	}
 
@@ -293,8 +286,7 @@ static int smb_disable(struct coresight_device *csdev)
 
 	smb_disable_hw(drvdata);
 
-	/* Dissociate from the target process. */
-	drvdata->pid = -1;
+	drvdata->event = NULL;
 	coresight_set_mode(csdev, CS_MODE_DISABLED);
 	dev_dbg(&csdev->dev, "Ultrasoc SMB disabled\n");
 
@@ -316,7 +308,6 @@ static void *smb_alloc_buffer(struct coresight_device *csdev,
 	buf->snapshot = overwrite;
 	buf->nr_pages = nr_pages;
 	buf->data_pages = pages;
-	buf->pid = task_pid_nr(event->owner);
 
 	return buf;
 }
@@ -564,7 +555,6 @@ static int smb_probe(struct platform_device *pdev)
 	smb_reset_buffer(drvdata);
 	platform_set_drvdata(pdev, drvdata);
 	raw_spin_lock_init(&drvdata->spinlock);
-	drvdata->pid = -1;
 
 	ret = smb_register_sink(pdev, drvdata);
 	if (ret) {
diff --git a/drivers/hwtracing/coresight/ultrasoc-smb.h b/drivers/hwtracing/coresight/ultrasoc-smb.h
index 323f0ccb6878..5129afa1dfc8 100644
--- a/drivers/hwtracing/coresight/ultrasoc-smb.h
+++ b/drivers/hwtracing/coresight/ultrasoc-smb.h
@@ -108,8 +108,7 @@ struct smb_data_buffer {
  * @miscdev:	Specifics to handle "/dev/xyz.smb" entry.
  * @spinlock:	Control data access to one at a time.
  * @reading:	Synchronise user space access to SMB buffer.
- * @pid:	Process ID of the process being monitored by the
- *		session that is using this component.
+ * @event:	Perf event using this sink if in Perf mode.
  */
 struct smb_drv_data {
 	void __iomem *base;
@@ -118,7 +117,7 @@ struct smb_drv_data {
 	struct miscdevice miscdev;
 	raw_spinlock_t spinlock;
 	bool reading;
-	pid_t pid;
+	struct perf_event *event;
 };
 
 #endif

-- 
2.34.1


