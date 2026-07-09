Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AA57C44506
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 10:58:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LIokI2pa1AcM6PxvAETcFVc4Fio6uc/VkJsrcD6qFu0=; b=JSjoi/ho8vk3q7OEsTnoW8U+bP
	Uvwf6ZZuuBo8DxwyC//cfEWeDbGViS5kuzM1xSBJHdsYL769cSwr6Bagu/kiTEJ1n81b4V1HirPLX
	lNak2G4na0THuLoxXhCcb7YVy9j++y+xUfZsoiyxJRJEJiUMRrDtxVDyenZrVpaPLuxdSC3W7jzOC
	F2ACY4C2d44aFxVcq1oVtyd2W2PX5rJJy+sdzPs2pOX4A1Qayky7NEf9RVP/0jQcNW5JFYPGbebyZ
	0a9BPdQffi/nio0FYla0EWqkd0gFBBHzT1eP1zkEJSmip7FS9hzTeM7uH0vu+BzCxJU4OMLNEnQ/A
	fEpmklYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whmS4-000000023Wa-08Jf;
	Thu, 09 Jul 2026 10:57:56 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whmRu-000000023P1-0kYz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 10:57:47 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-47c2b362ee2so1504173f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jul 2026 03:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783594664; x=1784199464; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LIokI2pa1AcM6PxvAETcFVc4Fio6uc/VkJsrcD6qFu0=;
        b=WR5a7Urm/MvnyyXvVb1mL39VBObUlfMSw6NXS1jiFoWAIeYM7VMR65/wsdBJQZIKqB
         LFm9a3HML0rff8t/OO5YWFtCXmslK5uVr9uaKzCty+8I9JfHjlm5/hdF905g8NrF6KeM
         mawUPDhPzlc2ePdcgFs2Sfm2fUMPVuOu1Z+TtvNVWI0Kxbw6d+VIk8luJ6YbXl4A0akg
         b9GlYeGjaergYxa0XL+a2goCwV9pfYwOMAESLO8iHbMys0SPgfjLAAV/GECxO1CceJQs
         vobkJNNTy6invdEqtWNp53kJqO3+Sl5sx276b9oPUrU2I5k/dClIivSQy3TmAbq+114n
         eyRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783594664; x=1784199464;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LIokI2pa1AcM6PxvAETcFVc4Fio6uc/VkJsrcD6qFu0=;
        b=cd5O8+9bwNQ6GahOqEdQRNtkVZZWw/6490fU/3rvOIjkj0nqg/8Zq7rzNhdxq4WCG6
         dHfqFoyuC/qWCeno43+0GXSbedkFXejkoyWbanqPYCkNWseYV1L2Vc9sr1tyBRhI8Y9p
         cZpr3Z80lVNuURnu2Kw5zwo3OpnyIRnZ35WHFxd/oGGc8QQgu+NNSP/NUsB14r4ZcXnT
         MwbrxDhdEKkEsNVcb0I6gBrkyIcDbZw4iKiBjX2etjvH+g+8ZwgHGsBwxCbE9BJIobJ4
         xEqDO20aqExsHoYKzjuhLROIy5Da8OBBc9uDTLJWes74hHN3C0dUV3AP8/Va4QiJ6R/c
         vRdg==
X-Forwarded-Encrypted: i=1; AHgh+Rpv7BprlaLaLDQuPqT1XP2EmaRppvR2CeS+p2QBcPNzwekKkIBah9nUDasUvjElgHlaaaRaFlZNUApHgIVMxmIV@lists.infradead.org
X-Gm-Message-State: AOJu0Yyy3tRquRET18QBMLKm1aSGManuSQlwlOWNsdiT3qqjdMsa2Y0w
	iX8pbEIEQWc1OUFcE+JFKLeyyDHZYbyGsVR/m8kybdIWccAiX3xkbWoCKHbTm+m8TlU=
X-Gm-Gg: AfdE7cmVmJdQR7aHJyP6CdiRB/vMEtJiEyfUHYlfQ80biUUJJhkRHHeR0vZmVFdn5jb
	NI48BYq6amFU2WPodepiXPkZI0qZAFSYw8Ef0uFxEAXghiBH/SJfLsgO8rVFz6LRTMT/D1CLXLc
	nqu5ulBez8mvkzJt6EWw3HNSrwEjfraqkiObNtBEL9cHF617jlYpCLWrzpTgcJFOZk7BCbyQ7Vq
	PG+nQhaQBBkbYpLF9CApQ/u4Fl6v9Z0Am6U8WJCkyNsTT1z+Gc2FcFh+qL6nZPJv4ndMqj7BLHS
	MQCwKsnSF3GOMQYHGX+AD66NoTqDOcD1SVA2TxF2HATvedxT/F/Sqw+MyOv/+HqCvzhjg2jTDjJ
	OyaCn8HxVxXY9xfMXbFf0WobIaamVJzYSa39lHAGlVUlD4jmHp1UMBQ2Snnp4gAgSX2/jWKjOO8
	nXdUMrXGWwZz3SL6AfEeTqbg==
X-Received: by 2002:a05:6000:29c2:b0:47d:f620:557a with SMTP id ffacd0b85a97d-47df6205603mr2183463f8f.6.1783594664327;
        Thu, 09 Jul 2026 03:57:44 -0700 (PDT)
Received: from ho-tower-lan.lan ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9b4d850dsm51927408f8f.0.2026.07.09.03.57.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 03:57:43 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Thu, 09 Jul 2026 11:57:26 +0100
Subject: [PATCH 4/4] coresight: ultrasoc-smb: Prevent per-thread events
 from sharing a sink
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-james-cs-multiple-per-threads-v1-4-d384e6d477ac@linaro.org>
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
X-CRM114-CacheID: sfid-20260709_035746_259046_15102339 
X-CRM114-Status: GOOD (  20.98  )
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


