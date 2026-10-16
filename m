Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B9AFCCA491
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 10:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R3o+D2T9+mE2UaEqtdIwi+Nu/PVJ5FMXv6s2fBXuxgw=; b=4jmoPNM6RGGTi/410S6hyWTn/D
	uUVkw25sG2WNgoJY1n5jkWfkL8dRVZdcZeodxUlc8X/Z7IcHuN2hyNOTHPsEaRw1mL112JS8SAuq9
	r4aeICy+O82725S7zX101IZNGl6ekBnCx2j1CMt6NMzR/Gi4wRpf9v/opFjCD4i+rk3qKLA6WECRq
	XY52ZHAw/xqJVD2CPFq0bXJv5t1kS9FhOI9z70oBYARkh3Og0oqW4eLYetQxrFXqVaiYL+mKDwaNS
	TbUWN+qi+dVci1w3Pjwgm/rQpASpD2G7eDBoyi9V8E48DN1e1s/lvDu34evhvN9Y7CtDFNzqOussT
	+F5dndUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHfT7-00000002i8E-2iGQ;
	Fri, 16 Oct 2026 10:47:21 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHfSi-00000002hkB-1vqy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 10:46:57 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-487049569b6so4371012f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Oct 2026 03:46:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792147615; x=1792752415; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R3o+D2T9+mE2UaEqtdIwi+Nu/PVJ5FMXv6s2fBXuxgw=;
        b=QB6evXt0+3IsaTXaeZyzR+Penxu6Eyn6omDF7HejVFv8FoGTamFfmj0xq7ShIRjpOh
         aAu0j+VGA8n29Z/5gqVToiTZpTk7qVIwKr17i4h62FTpvrbdMPqh4//niw+hYA/QpRBg
         2/CEiOT0JvGzd9Drt1l2vowied58RsZ8RxW5OWjjusf2iF+8fmD4Yvr11TbQ0B5oiJMU
         5jFnyIgQ3emvHM8ForSY25HmTKiBHgRedjhDESfvdkHCPaRhZD8CkuuiC8w4NQPy/qPQ
         vSXsaHagYp6gT0d2l9WcenZMZmh3nIqVFP6GBuwfxaLISf03RQwsgmgTdQaLsFBLobPF
         +qvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792147615; x=1792752415;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R3o+D2T9+mE2UaEqtdIwi+Nu/PVJ5FMXv6s2fBXuxgw=;
        b=Gr8q048Qwz9WFBW+yacSkyCqrGC4Q0QB/mw3i78Bdj+T3f6BKIyLK7gqUF+kDXqNmz
         ovFM25sfH9KfBh8z558WK7IHKb/Z2Q7cZqponfm3c+bU0tePQ9Pp4132TnJJb46tj4tW
         8M0VO9AkK3mOtAqe68+VDTEpE2i4EcSOlpgDkJzcLd5EvewM8bmn//55LRzZxL6l8Og4
         1/RfeVxijbOWM+9vZ4UvKJkN2nUiqvBks7BtPJMuKLBXbbzWJ5Kwkg71hJbcUS5URtOB
         So4JiGivqtnJyvbfEyFB2w0HmqlvHXkJNZwrRQYjD8F8cWKjBl8yzlNaf2iCGBQWDqCp
         hMqQ==
X-Forwarded-Encrypted: i=1; AKwUvByXTc958dWc3b2zAD7dNcn/xIf3hsFYOqflQDPjGPhmsF92feFs2I/mpO9rz4pR36Cn9roy2sN0sBBzRx/rbspk@lists.infradead.org
X-Gm-Message-State: AFq9FYK9URvmORqZvIIbHFIs/I/K3te+VBTDT3ewL44B2J76UUtBIcVa
	+cWicIg1CqI766S+Hs18X+LreGb0o95MjyJ97w5GIN97x1X4PIxhAB0XLL8K+N5qBf4=
X-Gm-Gg: AYBFou0GX3s4uRzcnmbDW14ljQUFqReoVOODMW1egjgEI3bCtMmySY7UkhmU6jDzsFd
	MKhh8naBhjp5oglwon5oCBX4KUb1aKqkbu0j7oUo/9EpHXI0jp7c3W49WX+XQxh7FQ3gqScKbVR
	IqwbeSwwoJaZC0CFkRy5s0o1gOm0bcRT0cUQR8naCVdRDFQUDRAMENNTx9tUW0uz3ONMd7cI5+y
	xdlEOQ4Nfxk05FwUL69YT26+l/Hh+Fftv5Cgq5ve6hIyf6fuMiJNkT84mxKZC7TOIEM621+wy9b
	zzDSIcBux84jdYFAenCop8ZDjDbNCtNkTog8gf6tLtsXaz4VouUlD1ncNxbwXMFuNBd1RpNWwvV
	NSGtHCK68yS1ZJwGziGVIvcDqTN2+jVo46XlQu8iXjZzrMj8117YGJfWmzY2/MHEDWoyDkAaE8i
	rdGzCRrp6DrkhjU+YOvgzgx97aPdbegrE4RaEb2s84r+X4Mx96URRROyx/Ig9H4MsEfvu/UjXqJ
	SSJDKgNpg4s
X-Received: by 2002:a05:6000:1ac5:b0:487:91e:d8ed with SMTP id ffacd0b85a97d-48dba784ca9mr43925807f8f.2.1792147614732;
        Fri, 16 Oct 2026 03:46:54 -0700 (PDT)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4e7ff1sm4556570f8f.25.2026.10.16.03.46.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 03:46:54 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Fri, 16 Oct 2026 11:46:20 +0100
Subject: [PATCH v4 10/10] coresight: ultrasoc-smb: Remove sharing guards
 from SMB
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-james-cs-multiple-per-threads-v4-10-dedf961aca0e@linaro.org>
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
X-CRM114-CacheID: sfid-20261016_034656_579928_22E7AB24 
X-CRM114-Status: GOOD (  19.06  )
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

Remove the redundant PID tracking from SMB and the now-unused PID
field from the common cs_buffers structure.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/hwtracing/coresight/coresight-priv.h |  2 --
 drivers/hwtracing/coresight/ultrasoc-smb.c   | 20 +-------------------
 drivers/hwtracing/coresight/ultrasoc-smb.h   |  3 ---
 3 files changed, 1 insertion(+), 24 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/hwtracing/coresight/coresight-priv.h
index 51313fe2cd0e..9eabfdfa32e1 100644
--- a/drivers/hwtracing/coresight/coresight-priv.h
+++ b/drivers/hwtracing/coresight/coresight-priv.h
@@ -95,7 +95,6 @@ enum etm_addr_type {
  * struct cs_buffer - keep track of a recording session' specifics
  * @cur:	index of the current buffer
  * @nr_pages:	max number of pages granted to us
- * @pid:	PID this cs_buffer belongs to
  * @offset:	offset within the current buffer
  * @data_size:	how much we collected in this run
  * @snapshot:	is this run in snapshot mode
@@ -104,7 +103,6 @@ enum etm_addr_type {
 struct cs_buffers {
 	unsigned int		cur;
 	unsigned int		nr_pages;
-	pid_t			pid;
 	unsigned long		offset;
 	local_t			data_size;
 	bool			snapshot;
diff --git a/drivers/hwtracing/coresight/ultrasoc-smb.c b/drivers/hwtracing/coresight/ultrasoc-smb.c
index b107d4606fcd..f2efbb615cda 100644
--- a/drivers/hwtracing/coresight/ultrasoc-smb.c
+++ b/drivers/hwtracing/coresight/ultrasoc-smb.c
@@ -214,23 +214,9 @@ static int smb_enable_perf(struct coresight_device *csdev,
 			   struct coresight_path *path)
 {
 	struct smb_drv_data *drvdata = dev_get_drvdata(csdev->dev.parent);
-	struct perf_output_handle *handle = path->handle;
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
-		return -EBUSY;
-
-	if (drvdata->pid == -1) {
+	if (!csdev->refcnt) {
 		smb_enable_hw(drvdata);
-		drvdata->pid = pid;
 		coresight_set_mode(csdev, CS_MODE_PERF);
 	}
 
@@ -292,8 +278,6 @@ static int smb_disable(struct coresight_device *csdev)
 
 	smb_disable_hw(drvdata);
 
-	/* Dissociate from the target process. */
-	drvdata->pid = -1;
 	coresight_set_mode(csdev, CS_MODE_DISABLED);
 	dev_dbg(&csdev->dev, "Ultrasoc SMB disabled\n");
 
@@ -315,7 +299,6 @@ static void *smb_alloc_buffer(struct coresight_device *csdev,
 	buf->snapshot = overwrite;
 	buf->nr_pages = nr_pages;
 	buf->data_pages = pages;
-	buf->pid = task_pid_nr(event->owner);
 
 	return buf;
 }
@@ -563,7 +546,6 @@ static int smb_probe(struct platform_device *pdev)
 	smb_reset_buffer(drvdata);
 	platform_set_drvdata(pdev, drvdata);
 	raw_spin_lock_init(&drvdata->spinlock);
-	drvdata->pid = -1;
 
 	ret = smb_register_sink(pdev, drvdata);
 	if (ret) {
diff --git a/drivers/hwtracing/coresight/ultrasoc-smb.h b/drivers/hwtracing/coresight/ultrasoc-smb.h
index 323f0ccb6878..561e42dc0870 100644
--- a/drivers/hwtracing/coresight/ultrasoc-smb.h
+++ b/drivers/hwtracing/coresight/ultrasoc-smb.h
@@ -108,8 +108,6 @@ struct smb_data_buffer {
  * @miscdev:	Specifics to handle "/dev/xyz.smb" entry.
  * @spinlock:	Control data access to one at a time.
  * @reading:	Synchronise user space access to SMB buffer.
- * @pid:	Process ID of the process being monitored by the
- *		session that is using this component.
  */
 struct smb_drv_data {
 	void __iomem *base;
@@ -118,7 +116,6 @@ struct smb_drv_data {
 	struct miscdevice miscdev;
 	raw_spinlock_t spinlock;
 	bool reading;
-	pid_t pid;
 };
 
 #endif

-- 
2.43.0


