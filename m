Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8BCDC54F4D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 15:02:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6irnWQqchvDZHnaA1/Tl45cb8j/7gKVA44kzoAlrHu4=; b=HZZyK0yJIKGt60UwiOqassXFCa
	fQbOZadHeyzKSUEO0EmKpXIak+dp2CZxdCW/xXZEKAG1158T7qskZCD/frfyowH5DFhRPHuN1DaQC
	raJjqbK+iW6Q5yH7UWdp5+d1LIwZUJdzLv0gvwWpJmIaYS1hrww+hYe1pA6MkykS3XphDh1AO6XLP
	BbwDb8ox6ZhNIegJ367dy4jMtrTrWq3J3Ld/YMKybBX5bRNXs3BcgVeeLeE6JDZQhM26jUTKH5gqT
	al1lLTdAbLc95Ocq6xrps2iAEEm4d3olb6xXI6KN3JogjwCyzd6XlYjN0eDiLF8XYn7PtgYJj3rjL
	dfRKVnOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wojJZ-00000005a05-40N8;
	Tue, 28 Jul 2026 15:01:53 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wojIu-00000005ZeL-2I2S
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 15:01:13 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4954c0833b4so29566425e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jul 2026 08:01:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785250870; x=1785855670; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6irnWQqchvDZHnaA1/Tl45cb8j/7gKVA44kzoAlrHu4=;
        b=ZPPYA0lAPFB8NGhyPm3KsKaYkULBCMyrOxxNoiAykYK4kSz3gtJ9UdmEYVoJ2YGI6q
         vlVxlUjpun+Wp99ssJ+2fLsf0fDnyA0HU+Sc4VZjfgUX0qM01U/3HYY0xtpn4N+rKL4P
         r2m0wJ9HinqtCxLK809to7ikAZHQNKKXnwhOwkszmcqKrrJjd95b5k/96NI+jKkg94jo
         g3fpq23i+r6yM1FqT64WAS4IcsrMTtzHDumKZ/k2zEYkLrTvL+KZD5rNIEliVtYbZCJF
         fDqEWUSgNXVjNe1kcnmVtBeqci6ygCf5A6yKo9uudSmuGZXRRFHhtwBIvRYjo/FwDf9m
         rbng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785250870; x=1785855670;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6irnWQqchvDZHnaA1/Tl45cb8j/7gKVA44kzoAlrHu4=;
        b=bglsEmGWCo4kZ9E+hnk54FUM3TnnWZOPG3c8c4SRsA5EyE8EiF0QkYhwl02jIrcVEB
         SbOOq2LRnEqgxG7KfrnBKVkPfqu1GQxPSGCdeN5C7/MHuBVuDkxAdHmlSt7pyutDvbav
         c/3ooNb+3+GU9iMQQhUqIPNICVlaxmfBI7NQrAFIm616cJLU9pjE+yUGJfIf5LRVEBKK
         DLI5pIJvITUILMnssvvmY06XfmyaN7hsxMc/kAGxncsZ2rahD4PmPsFP1VLI0+qbGTPR
         qCghQZmwYvDdFQz9pB72J5ONHuwRkCQkbww73cRabfEnfLnhEu6DpC+xkVt1d7PcS0u5
         4eAQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq+BW1dGKVX3ty+VSMjcWTutkYlk1M1WxyMu9kpCGAdHD/1A6X2rOURdCRxY7vDnI+66RBeJYqN0WBdyZuKZHAC@lists.infradead.org
X-Gm-Message-State: AOJu0Yyb4LYxvnqsqISBP6lx45hdXxJ+8wSlwQ6NiTSiOEBY6z84IFoD
	ssovbvX/xZJZFATQf8mF1e0XeQYAtLeopT7PSl2kgcobF8REntpfimaP3HnONHNSLTU=
X-Gm-Gg: AR+sD10x62QhhhQhRKI77SgIUSUkS5S9jgGk/kG3pk9PC7z0vw/eVMLuPZjyJeRvzcz
	GdPmg+/06q3vGfxqXSTKj/zMsTNUXtkcM4r/xXVDMr1F2ZefuKb38n6neTw+yiqQDo8dObUpQfk
	n569ldoxhSMbPd3zbYcM62FrD//Y43Bh/mAzknPD5X4+6GtNtzQl5uvu+mdjaNQxkOLyJF8VDyM
	ZkLeVzR1GjEz5FDD40OJDyuOs02O0LB7LLbq8/RLKDOWvhrfN7O21ob77T9GAn1hj1dq4HyIagk
	AMwA+rVm2xw6qg3et3LDEW6rNPhlkPfXhundR0DVCIR6QZbrvsGZCecNFm+hIwryvdTvSWrMmlu
	m3UkESrhsoI1ltXa5WqwTnojh4B/j25KLYxv2gJl8IlSxwYPPgWuEj74yuAlXE+hwyCYp82vFZJ
	f1vXcjPJ7kmkpr4nB0jw==
X-Received: by 2002:a05:600c:46cc:b0:495:737a:7afe with SMTP id 5b1f17b1804b1-496c643b54bmr32514925e9.15.1785250870374;
        Tue, 28 Jul 2026 08:01:10 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c52fa9sm61036324f8f.20.2026.07.28.08.01.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 08:01:09 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Tue, 28 Jul 2026 16:00:20 +0100
Subject: [PATCH v3 8/8] coresight: ultrasoc-smb: Prevent per-thread events
 from sharing a sink
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260728-james-cs-multiple-per-threads-v3-8-6aee7579f1dc@linaro.org>
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
X-CRM114-CacheID: sfid-20260728_080112_638532_19C3D7EA 
X-CRM114-Status: GOOD (  22.60  )
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
 drivers/hwtracing/coresight/ultrasoc-smb.h   |  6 +++---
 3 files changed, 9 insertions(+), 21 deletions(-)

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
index f66ec53070d7..ba4a7a8f6f96 100644
--- a/drivers/hwtracing/coresight/ultrasoc-smb.c
+++ b/drivers/hwtracing/coresight/ultrasoc-smb.c
@@ -216,22 +216,15 @@ static int smb_enable_perf(struct coresight_device *csdev,
 {
 	struct smb_drv_data *drvdata = dev_get_drvdata(csdev->dev.parent);
 	struct perf_output_handle *handle = path->handle;
-	struct cs_buffers *buf = etm_perf_sink_config(handle);
-	pid_t pid;
+	struct etm_event_data *event_data = perf_get_aux(handle);
 
-	if (!buf)
-		return -EINVAL;
-
-	/* Get a handle on the pid of the target process */
-	pid = buf->pid;
-
-	/* Device is already in used by other session */
-	if (drvdata->pid != -1 && drvdata->pid != pid)
+	/* Do not proceed if this device is associated with another session */
+	if (!etm_perf_sink_can_share(csdev, &drvdata->perf_session, handle))
 		return -EBUSY;
 
-	if (drvdata->pid == -1) {
+	if (!csdev->refcnt) {
 		smb_enable_hw(drvdata);
-		drvdata->pid = pid;
+		drvdata->perf_session = event_data->session_id;
 		coresight_set_mode(csdev, CS_MODE_PERF);
 	}
 
@@ -293,8 +286,7 @@ static int smb_disable(struct coresight_device *csdev)
 
 	smb_disable_hw(drvdata);
 
-	/* Dissociate from the target process. */
-	drvdata->pid = -1;
+	drvdata->perf_session = (struct etm_session_id) {};
 	coresight_set_mode(csdev, CS_MODE_DISABLED);
 	dev_dbg(&csdev->dev, "Ultrasoc SMB disabled\n");
 
@@ -317,7 +309,6 @@ static void *smb_alloc_buffer(struct coresight_device *csdev,
 	buf->snapshot = overwrite;
 	buf->nr_pages = nr_pages;
 	buf->data_pages = pages;
-	buf->pid = task_pid_nr(event->owner);
 
 	return buf;
 }
@@ -565,7 +556,6 @@ static int smb_probe(struct platform_device *pdev)
 	smb_reset_buffer(drvdata);
 	platform_set_drvdata(pdev, drvdata);
 	raw_spin_lock_init(&drvdata->spinlock);
-	drvdata->pid = -1;
 
 	ret = smb_register_sink(pdev, drvdata);
 	if (ret) {
diff --git a/drivers/hwtracing/coresight/ultrasoc-smb.h b/drivers/hwtracing/coresight/ultrasoc-smb.h
index 323f0ccb6878..491c2716b835 100644
--- a/drivers/hwtracing/coresight/ultrasoc-smb.h
+++ b/drivers/hwtracing/coresight/ultrasoc-smb.h
@@ -10,6 +10,7 @@
 #include <linux/bitfield.h>
 #include <linux/miscdevice.h>
 #include <linux/spinlock.h>
+#include "coresight-etm-perf.h"
 
 /* Offset of SMB global registers */
 #define SMB_GLB_CFG_REG		0x00
@@ -108,8 +109,7 @@ struct smb_data_buffer {
  * @miscdev:	Specifics to handle "/dev/xyz.smb" entry.
  * @spinlock:	Control data access to one at a time.
  * @reading:	Synchronise user space access to SMB buffer.
- * @pid:	Process ID of the process being monitored by the
- *		session that is using this component.
+ * @perf_session: Session identity of the Perf event currently using this sink.
  */
 struct smb_drv_data {
 	void __iomem *base;
@@ -118,7 +118,7 @@ struct smb_drv_data {
 	struct miscdevice miscdev;
 	raw_spinlock_t spinlock;
 	bool reading;
-	pid_t pid;
+	struct etm_session_id perf_session;
 };
 
 #endif

-- 
2.34.1


