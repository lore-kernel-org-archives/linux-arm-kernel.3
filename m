Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C1A6CCA464
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 10:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zbXD4ITQsH/XxraaXqLBFVLwXTKmDzFktFWBm9+M5nM=; b=jU2R378iNyS4RfBManIgGax20Q
	Pvrw/DhSJ0nQnmQfRFZaYiHITmg1SvEXeIKsGzEc+ScNuBzqsuGqO8CPPnouJw18oCJAxAMXPTEUN
	XcprxW/KinNSLZ4NXkImaM46ruogNNAvE4567cA1M1W2MI6YbElx7xX8zLEqPfS6sF/OcNx6YkWOy
	MVne4JGTJ7UD+FEaDTiTU0GH6PkyPpd1iVwiZMuQ10n65Bzcg0i8Jda3o37pUQNuZGaYraHxj006Z
	DRlDWTxlZEITEelQcHtym/yY/3egI8pzdGow/eObATCm4O1eNb7WiN7ZTzTHvAMbWUupAqv0TbPpZ
	DDCuD8tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHfSj-00000002hnJ-3okD;
	Fri, 16 Oct 2026 10:46:57 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHfSf-00000002hhb-3wD9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 10:46:55 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-48dfdd0678dso431655f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Oct 2026 03:46:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792147612; x=1792752412; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zbXD4ITQsH/XxraaXqLBFVLwXTKmDzFktFWBm9+M5nM=;
        b=giy4mVmct23OVAvki5GWf/jK+THdNGWsGfwTcqTuTjlX08PH8lA/h+5c9fMjCOWkdK
         YT9oPqtTagpkLom2Oi5kApylubwVsYoaRNqJ01LV3NZTWK2ybCRkWxYfX6mXUfHzCBSz
         TRM/tDdhREG0tx7Au/N6NW+5qjxXu7DdSlnUeZkwfwnc2zUQ7f7TiaTAClfkGeXessqi
         zsgFmI74ZEOV+P1UFq3QdcJF7XnznoLPcIskrDBbrdXnt2tLOxe6Bb9x0cVVj3ClL91f
         f/EsxkpsNiU0F1l2gS6aN813JOqjTEl0nvjXEoFHmzaqJnP2vaFvx22mi2mNkf8408HB
         ZGEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792147612; x=1792752412;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zbXD4ITQsH/XxraaXqLBFVLwXTKmDzFktFWBm9+M5nM=;
        b=zkFD/kp1+bH1brHFuujm7CbHs3GFu5i/I1l/NSZ07SRk4Bx0vZKrFdSHhBabq6V5Wj
         1/X592aRFhMRTAdn6eB+CpiX6ZSaXVTsVy/uFrAGU/cvmtlyCqU/twbeRaEfxSteMVbd
         Cbp0lz1akhilaxG5dDuWUqSVneC9dPUhs64biAL8SONoB5nMPh0ZgU1S4a5dEH1Ca4fU
         7Oh0g41GX/JGiBxt5G7SuEPLiVHp+gMaUZSmwt18JUHTBfXrcbRRtQ6gTtskPjOoswV9
         8dgUb4RgxhTh7tV90oQPGrmpZM6btT1XIqsvuvjPhyJXnHSqFl3Yw38Oj7XR9/7PNZV+
         MdPA==
X-Forwarded-Encrypted: i=1; AKwUvBwQblaziJanLH1SektSG62qMqY0nnEik3lGyVqb5XR89an/htgw3Z8M8sGJIndlJlapG1YZUO5x2LnBXBGjFlGO@lists.infradead.org
X-Gm-Message-State: AFq9FYLUP6HIUdpiF+ie/ozndXV7Hb4Wy8qhaWlDcLInbSYlJsH29I3z
	a/yN3OYmXXuYqA2WAIHFHQnxuGJWs8c/etTpDUJQ4ZmV0s7h5ObhOTwhjYl/IXoFPQE=
X-Gm-Gg: AYBFou0JzOP3IdMJ0lEOVdu8vNuEX4qfYaHpzASBt5G9sXk3K2OZB6ZT4HRUAm0Tr1G
	VoU+b5aIxyFaQC2MIgg0RU9V/LOBUTG48tRhwSsUvkv0ZercpeiUJJjijbjD2yiJ3KaZRnvF9+8
	66iW4Qu4zJFwBVIQacvMko4xj92McsZB7Rx0SzDVv1ddNVSgYy6MdwHVuAcVtAgQs/S3IIumFJR
	a1EEcIl4dKXLcsNBeTsfIuuHhs8eqhMCdVMyqpnfRk1UDD5JSslu186dkKqAvsQObQzzLQf+jun
	maU4HR0tiB6GERBZlNH/oMiSThQiO3cCVPj8IBNmphGivC8yvQ6sZ/NtvX6aKFl8xFbzhnvel9G
	Jlu5rNraSq1LBzEJck0eL8hYwntxTSkOKLlCQglq7zb7Wz4DMiGslsKFRnD22s/5ubhbVwch3yq
	aKJpt0e6EXWANHSM5ndmJVEp4TAho6pwrO8+AIFCz1g5ZT5+8FAv3eKkRV6gJAh9nX7CLpoAqu5
	w==
X-Received: by 2002:a05:600c:8105:b0:4a1:775b:5eb2 with SMTP id 5b1f17b1804b1-4a18e48362emr469338195e9.13.1792147612021;
        Fri, 16 Oct 2026 03:46:52 -0700 (PDT)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4e7ff1sm4556570f8f.25.2026.10.16.03.46.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 03:46:51 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Fri, 16 Oct 2026 11:46:18 +0100
Subject: [PATCH v4 08/10] coresight: tmc-etf: Remove sharing guards from
 ETF
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-james-cs-multiple-per-threads-v4-8-dedf961aca0e@linaro.org>
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
X-CRM114-CacheID: sfid-20261016_034654_072428_A822726E 
X-CRM114-Status: GOOD (  21.16  )
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

Remove the redundant PID tracking from ETF and the TMC driver state.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/hwtracing/coresight/coresight-tmc-core.c |  2 --
 drivers/hwtracing/coresight/coresight-tmc-etf.c  | 22 ++--------------------
 drivers/hwtracing/coresight/coresight-tmc.h      |  4 ----
 3 files changed, 2 insertions(+), 26 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
index 864da1eea52c..e3c94dca1152 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-core.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
@@ -800,8 +800,6 @@ static int __tmc_probe(struct device *dev, struct resource *res)
 	devid = readl_relaxed(drvdata->base + CORESIGHT_DEVID);
 	drvdata->config_type = BMVAL(devid, 6, 7);
 	drvdata->memwidth = tmc_get_memwidth(devid);
-	/* This device is not associated with a session */
-	drvdata->pid = -1;
 	drvdata->etr_mode = ETR_MODE_AUTO;
 
 	if (drvdata->config_type == TMC_CONFIG_TYPE_ETR) {
diff --git a/drivers/hwtracing/coresight/coresight-tmc-etf.c b/drivers/hwtracing/coresight/coresight-tmc-etf.c
index 8882b1c4cdc0..e2204a47c1f6 100644
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
@@ -270,31 +268,18 @@ static int tmc_enable_etf_sink_perf(struct coresight_device *csdev,
 			break;
 		}
 
-		/* Get a handle on the pid of the process to monitor */
-		pid = buf->pid;
-
-		if (drvdata->pid != -1 && drvdata->pid != pid) {
-			ret = -EBUSY;
-			break;
-		}
-
 		ret = tmc_set_etf_buffer(csdev, handle);
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
 			coresight_set_mode(csdev, CS_MODE_PERF);
 			csdev->refcnt++;
 		}
@@ -351,8 +336,6 @@ static int tmc_disable_etf_sink(struct coresight_device *csdev)
 	/* Complain if we (somehow) got out of sync */
 	WARN_ON_ONCE(coresight_get_mode(csdev) == CS_MODE_DISABLED);
 	tmc_etb_disable_hw(drvdata);
-	/* Dissociate from monitored process. */
-	drvdata->pid = -1;
 	coresight_set_mode(csdev, CS_MODE_DISABLED);
 
 	raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
@@ -432,7 +415,6 @@ static void *tmc_alloc_etf_buffer(struct coresight_device *csdev,
 	if (!buf)
 		return NULL;
 
-	buf->pid = task_pid_nr(event->owner);
 	buf->snapshot = overwrite;
 	buf->nr_pages = nr_pages;
 	buf->data_pages = pages;
diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
index d63fa60ecce8..36b54ebf30ba 100644
--- a/drivers/hwtracing/coresight/coresight-tmc.h
+++ b/drivers/hwtracing/coresight/coresight-tmc.h
@@ -217,9 +217,6 @@ struct tmc_resrv_buf {
  * @crashdev:	specifics to handle "/dev/crash_tmc_xyz" entry for reading
  *		crash tracedata.
  * @spinlock:	only one at a time pls.
- * @pid:	Process ID of the process that owns the session that is using
- *		this component. For example this would be the pid of the Perf
- *		process.
  * @reading:	buffer's in the reading through "/dev/xyz.tmc" entry
  * @stop_on_flush: Stop on flush trigger user configuration.
  * @buf:	Snapshot of the trace data for ETF/ETB.
@@ -252,7 +249,6 @@ struct tmc_drvdata {
 	struct miscdevice	miscdev;
 	struct miscdevice	crashdev;
 	raw_spinlock_t		spinlock;
-	pid_t			pid;
 	bool			reading;
 	bool			stop_on_flush;
 	union {

-- 
2.43.0


