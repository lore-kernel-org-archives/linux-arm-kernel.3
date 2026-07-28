Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12AB8C54F4C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 15:01:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QOEYf/i/y8hM8e66YYYZ3xaBR1Z79na4dvF0VbsaZ7A=; b=BUmVQMabqPHyDarcdABtWjlkHB
	YyYCWjyNvY8U3SB0sa5HZZ0onAXtkeuODCdjXYJrBkCW5kI/MJ982Cf9FntMlz02nrLQ9V0UOPHh4
	/Ll7f2syijRDcjAMqYb4rl2ltDstWOR+XrHv1PI4QCo5Pp/Y5D7neBWNFlnt1V1h8TEhbKEIZ5UYg
	jL37IUs6DGuz+AA4kxHpvnGw/l0l4Uu9rKKqwnZBS2wgdnv4gRhWcuoINvumsPnWBUxpsnpb7CQ3u
	9zfsolNEXELCL0IzdhJfFRGljVCQ0fIC1Vyn3ZDMFR8aUm/bhmkvbMaBnYrHgPinFJ5CX8D7sLzwR
	+NAwfmIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wojIv-00000005ZgU-0How;
	Tue, 28 Jul 2026 15:01:13 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wojIq-00000005ZcV-2dxR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 15:01:10 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-47f707e5d75so2722649f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jul 2026 08:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785250866; x=1785855666; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QOEYf/i/y8hM8e66YYYZ3xaBR1Z79na4dvF0VbsaZ7A=;
        b=qMXjNJVDdOrMJrOThFbCO8L0Fw2R0kKYktRRGYl98IbDPPyC++FymXTtRAtbVRL3c3
         TYW9oyqNW9gPzuEhoq55aMk8mXA2AjxRTdlVp7nXMZN0eLmjRhcukn1qE2xo6v8/5wmZ
         prntGV0A67mmyOdSSX8gANY8YJ5bRLxPKmV97LKQivTugZaQ4tksA0eV20ZcCba6mztC
         JpsJf4AONwnG2EuAiq/J53S2kx97qq4Dv18mDxO5E/SNs5HgLsWPh1sgHKdZKwuZOarb
         CjKDb+GXT765MJzGB43j3VzMZ7DaYhoffFW1WlaeQyYAqsSWwNrcli2Q/Z+VJdBasg5H
         e1Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785250866; x=1785855666;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QOEYf/i/y8hM8e66YYYZ3xaBR1Z79na4dvF0VbsaZ7A=;
        b=JHwe0XSLyT++IdHXrKD5RwE1/AInqORmW9J8ouezDAyCAnHXyjuILNkwV6u8xkJNxb
         +tUn0r7c35hPZygGKrq0uqlHwfumxL/5H41u/qIifFR81Z5zYDVPvlh+O4tgNyezTxjw
         RSzUxQxOiLbmM8MLa5GmgBxh0VN4TegYTCytwB2E8mO6T3uV/pA3RM/Qw76grvtzlP9/
         eJrbHBQHX5uTjRNPqrSMrxUDkS6crvMUT+0PUNlC2iCBqswdd83C0cf3kGy0jiHAfQ1p
         WFse5yzduErtIEMooTSI9xk9nwSYn3Dx2RUly/YMVW6sizUNZx41m1l8eBuR00CVF/uV
         lRag==
X-Forwarded-Encrypted: i=1; AHgh+Rr7BGSQ55dvRWDfrMefWLn+sKtAcWk6WR9wuGxSC6q9KJg5C0CTpI9B3sLfWxnG3P2vdbb+TnUW1ji7w8aCMd3l@lists.infradead.org
X-Gm-Message-State: AOJu0YyIoXcwrvQSd7AgYUJpAE0yayCOjKjlyMhtjB/WCe2DaM1f2x73
	bzdiOgPTR6pCBQ/wtln/QZDWAAscslk6DWFTMh+vrN1+QYVONPdgP8TyGhtfo+zB9CM=
X-Gm-Gg: AR+sD10RIhzbbf7bVW0lngmnw4WSfjFFOM1rKebKE4oE7b2+CO5TuibRA/AzIo5TFbG
	wHoc19lzuG3iv/FmHtDd1TtYnVN8QR9GRY6VMpxTdIiDwr8Zs76if7LVWf9ucAKPe7srRXFuBfJ
	IWnK6dMbbi7bQgdP4+H31ojY32/bDk3SqiGNZcxKx5zYwJ878ahAczJIgSfEJQ4En9ypJwHPJDl
	/JukcikeHWtHqjEQd5r7JQLiHweAElrxnIfxO2DOMJaUzFWHWyqDL+kRgfITf3RvzpNGCMWF2VP
	/xYNK8i1stZPLtNlNgVcHC5uC2A5OUK4zun+Qf/qw7ekBV47dN2bVypasyJtXYorOEgllhRW5u4
	GOxrUVyqem+KLbtqg05cTMFdHVK4NuA/SdaZfMLCyQgV9ZMWGeE65mxm5GlqFdWbgeFB9DPbk5M
	SyroPTwrA=
X-Received: by 2002:a5d:5f48:0:b0:47f:9425:1a2a with SMTP id ffacd0b85a97d-47fb1ea7954mr3109872f8f.30.1785250866035;
        Tue, 28 Jul 2026 08:01:06 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c52fa9sm61036324f8f.20.2026.07.28.08.01.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 08:01:05 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Tue, 28 Jul 2026 16:00:17 +0100
Subject: [PATCH v3 5/8] coresight: tmc-etr: Use session ID for buffer
 ownership
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260728-james-cs-multiple-per-threads-v3-5-6aee7579f1dc@linaro.org>
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
X-CRM114-CacheID: sfid-20260728_080108_743153_5EA59405 
X-CRM114-Status: GOOD (  31.16  )
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

Comparing numeric PIDs for ownership no longer matches the sharing rules
in coresight_sink_can_share(), change it to compare the session identity
instead.

Now that we're not using a numeric PID for ownership we can't use the
IDR map. Change it to a simple linear realloc'd array, it's unlikely the
performance difference is measurable, systems wouldn't have more than a
handful of shared sources for one sink, and this is only accessed once
at setup.

Assisted-by: Codex:GPT-5.6-Sol
Fixes: 8d03cfd16a72 ("coresight: tmc-etr: Add support for CPU-wide trace scenarios")
Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/hwtracing/coresight/coresight-etb10.c    |   3 +-
 drivers/hwtracing/coresight/coresight-etm-perf.c |   4 +-
 drivers/hwtracing/coresight/coresight-tmc-core.c |   4 +-
 drivers/hwtracing/coresight/coresight-tmc-etf.c  |   5 +-
 drivers/hwtracing/coresight/coresight-tmc-etr.c  | 139 ++++++++++++-----------
 drivers/hwtracing/coresight/coresight-tmc.h      |  16 ++-
 drivers/hwtracing/coresight/coresight-trbe.c     |   3 +-
 drivers/hwtracing/coresight/ultrasoc-smb.c       |   3 +-
 include/linux/coresight.h                        |   4 +-
 9 files changed, 100 insertions(+), 81 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etb10.c b/drivers/hwtracing/coresight/coresight-etb10.c
index a827f76b8144..6a4a1edf46ba 100644
--- a/drivers/hwtracing/coresight/coresight-etb10.c
+++ b/drivers/hwtracing/coresight/coresight-etb10.c
@@ -371,7 +371,8 @@ static int etb_disable(struct coresight_device *csdev)
 }
 
 static void *etb_alloc_buffer(struct coresight_device *csdev,
-			      struct perf_event *event, void **pages,
+			      struct perf_event *event,
+			      struct etm_session_id *owner, void **pages,
 			      int nr_pages, bool overwrite)
 {
 	int node;
diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
index 28cf319a39da..652beee2edbd 100644
--- a/drivers/hwtracing/coresight/coresight-etm-perf.c
+++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
@@ -517,7 +517,9 @@ static void *etm_setup_aux(struct perf_event *event, void **pages,
 	 * sinks.
 	 */
 	event_data->snk_config =
-			sink_ops(sink)->alloc_buffer(sink, event, pages,
+			sink_ops(sink)->alloc_buffer(sink, event,
+						     &event_data->session_id,
+						     pages,
 						     nr_pages, overwrite);
 	if (!event_data->snk_config)
 		goto err;
diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
index c89fe996af23..873868718b14 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-core.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
@@ -9,7 +9,6 @@
 #include <linux/init.h>
 #include <linux/types.h>
 #include <linux/device.h>
-#include <linux/idr.h>
 #include <linux/io.h>
 #include <linux/iommu.h>
 #include <linux/err.h>
@@ -832,8 +831,7 @@ static int __tmc_probe(struct device *dev, struct resource *res)
 		ret = tmc_etr_setup_caps(dev, devid, &desc.access);
 		if (ret)
 			goto out;
-		idr_init(&drvdata->idr);
-		mutex_init(&drvdata->idr_mutex);
+		mutex_init(&drvdata->perf_bufs_mutex);
 		dev_list = "tmc_etr";
 		break;
 	case TMC_CONFIG_TYPE_ETF:
diff --git a/drivers/hwtracing/coresight/coresight-tmc-etf.c b/drivers/hwtracing/coresight/coresight-tmc-etf.c
index 3836063031d7..d90090b846ab 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etf.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etf.c
@@ -419,8 +419,9 @@ static void tmc_disable_etf_link(struct coresight_device *csdev,
 }
 
 static void *tmc_alloc_etf_buffer(struct coresight_device *csdev,
-				  struct perf_event *event, void **pages,
-				  int nr_pages, bool overwrite)
+				  struct perf_event *event,
+				  struct etm_session_id *owner,
+				  void **pages, int nr_pages, bool overwrite)
 {
 	int node;
 	struct cs_buffers *buf;
diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
index be5ed04a554f..324d94e6d7e1 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
@@ -8,7 +8,6 @@
 #include <linux/coresight.h>
 #include <linux/dma-mapping.h>
 #include <linux/iommu.h>
-#include <linux/idr.h>
 #include <linux/mutex.h>
 #include <linux/refcount.h>
 #include <linux/slab.h>
@@ -37,8 +36,6 @@ struct etr_buf_hw {
  * etr_perf_buffer - Perf buffer used for ETR
  * @drvdata		- The ETR drvdaga this buffer has been allocated for.
  * @etr_buf		- Actual buffer used by the ETR
- * @pid			- The PID of the session owner that etr_perf_buffer
- *			  belongs to.
  * @snaphost		- Perf session mode
  * @nr_pages		- Number of pages in the ring buffer.
  * @pages		- Array of Pages in the ring buffer.
@@ -46,7 +43,6 @@ struct etr_buf_hw {
 struct etr_perf_buffer {
 	struct tmc_drvdata	*drvdata;
 	struct etr_buf		*etr_buf;
-	pid_t			pid;
 	bool			snapshot;
 	int			nr_pages;
 	void			**pages;
@@ -1396,16 +1392,16 @@ alloc_etr_buf(struct tmc_drvdata *drvdata, struct perf_event *event,
 	return ERR_PTR(-ENOMEM);
 }
 
-static struct etr_buf *
-get_perf_etr_buf_cpu_wide(struct tmc_drvdata *drvdata,
-			  struct perf_event *event, int nr_pages,
-			  void **pages, bool snapshot)
+static struct etr_buf *get_perf_etr_buf_cpu_wide(struct tmc_drvdata *drvdata,
+						 struct perf_event *event,
+						 struct etm_session_id *owner,
+						 int nr_pages, void **pages,
+						 bool snapshot)
 {
-	int ret;
-	pid_t pid = task_pid_nr(event->owner);
-	struct etr_buf *etr_buf;
+	struct etr_buf_mapping *perf_bufs;
+	struct etr_buf *etr_buf, *existing;
+	unsigned int i;
 
-retry:
 	/*
 	 * An etr_perf_buffer is associated with an event and holds a reference
 	 * to the AUX ring buffer that was created for that event.  In CPU-wide
@@ -1424,69 +1420,75 @@ get_perf_etr_buf_cpu_wide(struct tmc_drvdata *drvdata,
 	 * allocated for this session.  If so it is shared with this event,
 	 * otherwise it is created.
 	 */
-	mutex_lock(&drvdata->idr_mutex);
-	etr_buf = idr_find(&drvdata->idr, pid);
-	if (etr_buf) {
-		refcount_inc(&etr_buf->refcount);
-		mutex_unlock(&drvdata->idr_mutex);
-		return etr_buf;
+	mutex_lock(&drvdata->perf_bufs_mutex);
+	for (i = 0; i < drvdata->nr_perf_bufs; i++) {
+		if (etm_perf_compare_session(&drvdata->perf_bufs[i].owner, owner)) {
+			etr_buf = drvdata->perf_bufs[i].buf;
+			refcount_inc(&etr_buf->refcount);
+			mutex_unlock(&drvdata->perf_bufs_mutex);
+			return etr_buf;
+		}
 	}
 
 	/* If we made it here no buffer has been allocated, do so now. */
-	mutex_unlock(&drvdata->idr_mutex);
+	mutex_unlock(&drvdata->perf_bufs_mutex);
 
 	etr_buf = alloc_etr_buf(drvdata, event, nr_pages, pages, snapshot);
 	if (IS_ERR(etr_buf))
 		return etr_buf;
 
-	/* Now that we have a buffer, add it to the IDR. */
-	mutex_lock(&drvdata->idr_mutex);
-	ret = idr_alloc(&drvdata->idr, etr_buf, pid, pid + 1, GFP_KERNEL);
-	mutex_unlock(&drvdata->idr_mutex);
-
-	/* Another event with this session ID has allocated this buffer. */
-	if (ret == -ENOSPC) {
-		tmc_free_etr_buf(etr_buf);
-		goto retry;
+	mutex_lock(&drvdata->perf_bufs_mutex);
+	for (i = 0; i < drvdata->nr_perf_bufs; i++) {
+		if (etm_perf_compare_session(&drvdata->perf_bufs[i].owner, owner)) {
+			existing = drvdata->perf_bufs[i].buf;
+			refcount_inc(&existing->refcount);
+			mutex_unlock(&drvdata->perf_bufs_mutex);
+			tmc_free_etr_buf(etr_buf);
+			return existing;
+		}
 	}
 
-	/* The IDR can't allocate room for a new session, abandon ship. */
-	if (ret == -ENOMEM) {
+	perf_bufs = krealloc_array(drvdata->perf_bufs,
+				   drvdata->nr_perf_bufs + 1,
+				   sizeof(*perf_bufs), GFP_KERNEL);
+	if (!perf_bufs) {
+		mutex_unlock(&drvdata->perf_bufs_mutex);
 		tmc_free_etr_buf(etr_buf);
-		return ERR_PTR(ret);
+		return ERR_PTR(-ENOMEM);
 	}
 
+	drvdata->perf_bufs = perf_bufs;
+	perf_bufs[drvdata->nr_perf_bufs].owner = *owner;
+	perf_bufs[drvdata->nr_perf_bufs].buf = etr_buf;
+	drvdata->nr_perf_bufs++;
+	mutex_unlock(&drvdata->perf_bufs_mutex);
 
 	return etr_buf;
 }
 
-static struct etr_buf *
-get_perf_etr_buf_per_thread(struct tmc_drvdata *drvdata,
-			    struct perf_event *event, int nr_pages,
-			    void **pages, bool snapshot)
+static struct etr_buf *get_perf_etr_buf(struct tmc_drvdata *drvdata,
+					struct perf_event *event,
+					struct etm_session_id *owner,
+					int nr_pages, void **pages,
+					bool snapshot)
 {
 	/*
-	 * In per-thread mode the etr_buf isn't shared, so just go ahead
-	 * with memory allocation.
+	 * Events without a CPU must have inherit=false so always target a
+	 * single process. etm_perf_sink_can_share() prevents other single
+	 * process events from sharing sinks, so take a shortcut and go ahead
+	 * with memory allocation without using shared drvdata->perf_bufs.
 	 */
-	return alloc_etr_buf(drvdata, event, nr_pages, pages, snapshot);
-}
-
-static struct etr_buf *
-get_perf_etr_buf(struct tmc_drvdata *drvdata, struct perf_event *event,
-		 int nr_pages, void **pages, bool snapshot)
-{
 	if (event->cpu == -1)
-		return get_perf_etr_buf_per_thread(drvdata, event, nr_pages,
-						   pages, snapshot);
+		return alloc_etr_buf(drvdata, event, nr_pages, pages, snapshot);
 
-	return get_perf_etr_buf_cpu_wide(drvdata, event, nr_pages,
+	return get_perf_etr_buf_cpu_wide(drvdata, event, owner, nr_pages,
 					 pages, snapshot);
 }
 
 static struct etr_perf_buffer *
 tmc_etr_setup_perf_buf(struct tmc_drvdata *drvdata, struct perf_event *event,
-		       int nr_pages, void **pages, bool snapshot)
+		       struct etm_session_id *owner, int nr_pages, void **pages,
+		       bool snapshot)
 {
 	int node;
 	struct etr_buf *etr_buf;
@@ -1498,7 +1500,8 @@ tmc_etr_setup_perf_buf(struct tmc_drvdata *drvdata, struct perf_event *event,
 	if (!etr_perf)
 		return ERR_PTR(-ENOMEM);
 
-	etr_buf = get_perf_etr_buf(drvdata, event, nr_pages, pages, snapshot);
+	etr_buf = get_perf_etr_buf(drvdata, event, owner, nr_pages, pages,
+				   snapshot);
 	if (!IS_ERR(etr_buf))
 		goto done;
 
@@ -1508,7 +1511,7 @@ tmc_etr_setup_perf_buf(struct tmc_drvdata *drvdata, struct perf_event *event,
 done:
 	/*
 	 * Keep a reference to the ETR this buffer has been allocated for
-	 * in order to have access to the IDR in tmc_free_etr_buffer().
+	 * in order to have access to the buffer array in tmc_free_etr_buffer().
 	 */
 	etr_perf->drvdata = drvdata;
 	etr_perf->etr_buf = etr_buf;
@@ -1516,22 +1519,21 @@ tmc_etr_setup_perf_buf(struct tmc_drvdata *drvdata, struct perf_event *event,
 	return etr_perf;
 }
 
-
 static void *tmc_alloc_etr_buffer(struct coresight_device *csdev,
-				  struct perf_event *event, void **pages,
+				  struct perf_event *event,
+				  struct etm_session_id *owner, void **pages,
 				  int nr_pages, bool snapshot)
 {
 	struct etr_perf_buffer *etr_perf;
 	struct tmc_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
 
-	etr_perf = tmc_etr_setup_perf_buf(drvdata, event,
+	etr_perf = tmc_etr_setup_perf_buf(drvdata, event, owner,
 					  nr_pages, pages, snapshot);
 	if (IS_ERR(etr_perf)) {
 		dev_dbg(&csdev->dev, "Unable to allocate ETR buffer\n");
 		return NULL;
 	}
 
-	etr_perf->pid = task_pid_nr(event->owner);
 	etr_perf->snapshot = snapshot;
 	etr_perf->nr_pages = nr_pages;
 	etr_perf->pages = pages;
@@ -1543,28 +1545,33 @@ static void tmc_free_etr_buffer(void *config)
 {
 	struct etr_perf_buffer *etr_perf = config;
 	struct tmc_drvdata *drvdata = etr_perf->drvdata;
-	struct etr_buf *buf, *etr_buf = etr_perf->etr_buf;
+	struct etr_buf *etr_buf = etr_perf->etr_buf;
+	unsigned int i;
 
 	if (!etr_buf)
 		goto free_etr_perf_buffer;
 
-	mutex_lock(&drvdata->idr_mutex);
+	mutex_lock(&drvdata->perf_bufs_mutex);
 	/* If we are not the last one to use the buffer, don't touch it. */
 	if (!refcount_dec_and_test(&etr_buf->refcount)) {
-		mutex_unlock(&drvdata->idr_mutex);
+		mutex_unlock(&drvdata->perf_bufs_mutex);
 		goto free_etr_perf_buffer;
 	}
 
-	/* We are the last one, remove from the IDR and free the buffer. */
-	buf = idr_remove(&drvdata->idr, etr_perf->pid);
-	mutex_unlock(&drvdata->idr_mutex);
+	for (i = 0; i < drvdata->nr_perf_bufs; i++) {
+		if (drvdata->perf_bufs[i].buf != etr_buf)
+			continue;
 
-	/*
-	 * Something went very wrong if the buffer associated with this ID
-	 * is not the same in the IDR.  Leak to avoid use after free.
-	 */
-	if (buf && WARN_ON(buf != etr_buf))
-		goto free_etr_perf_buffer;
+		drvdata->nr_perf_bufs--;
+		drvdata->perf_bufs[i] =
+			drvdata->perf_bufs[drvdata->nr_perf_bufs];
+		if (!drvdata->nr_perf_bufs) {
+			kfree(drvdata->perf_bufs);
+			drvdata->perf_bufs = NULL;
+		}
+		break;
+	}
+	mutex_unlock(&drvdata->perf_bufs_mutex);
 
 	tmc_free_etr_buf(etr_perf->etr_buf);
 
diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
index 9b153b7910fb..0125f2ad78ed 100644
--- a/drivers/hwtracing/coresight/coresight-tmc.h
+++ b/drivers/hwtracing/coresight/coresight-tmc.h
@@ -8,7 +8,6 @@
 #define _CORESIGHT_TMC_H
 
 #include <linux/dma-mapping.h>
-#include <linux/idr.h>
 #include <linux/miscdevice.h>
 #include <linux/mutex.h>
 #include <linux/refcount.h>
@@ -192,6 +191,11 @@ struct etr_buf {
 	void				*private;
 };
 
+struct etr_buf_mapping {
+	struct etm_session_id		owner;
+	struct etr_buf			*buf;
+};
+
 /**
  * @paddr	: Start address of reserved memory region.
  * @vaddr	: Corresponding CPU virtual address.
@@ -239,8 +243,9 @@ struct tmc_resrv_buf {
  * @etr_caps:	Bitmask of capabilities of the TMC ETR, inferred from the
  *		device configuration register (DEVID)
  * @etr_mode:	User preferred mode of the ETR device, default auto mode.
- * @idr:	Holds etr_bufs allocated for this ETR.
- * @idr_mutex:	Access serialisation for idr.
+ * @perf_bufs:	CPU-wide Perf buffers and their owners.
+ * @nr_perf_bufs: Number of entries in @perf_bufs.
+ * @perf_bufs_mutex: Access serialisation for @perf_bufs.
  * @sysfs_buf:	SYSFS buffer for ETR.
  * @perf_buf:	PERF buffer for ETR.
  * @resrv_buf:  Used by ETR as hardware trace buffer and for trace data
@@ -274,8 +279,9 @@ struct tmc_drvdata {
 	u32			trigger_cntr;
 	u32			etr_caps;
 	enum etr_mode		etr_mode;
-	struct idr		idr;
-	struct mutex		idr_mutex;
+	struct etr_buf_mapping	*perf_bufs;
+	unsigned int		nr_perf_bufs;
+	struct mutex		perf_bufs_mutex;
 	struct etr_buf		*sysfs_buf;
 	struct etr_buf		*perf_buf;
 	struct tmc_resrv_buf	resrv_buf;
diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
index c7cbca45f2de..81841dc95e0c 100644
--- a/drivers/hwtracing/coresight/coresight-trbe.c
+++ b/drivers/hwtracing/coresight/coresight-trbe.c
@@ -746,7 +746,8 @@ static unsigned long trbe_get_trace_size(struct perf_output_handle *handle,
 }
 
 static void *arm_trbe_alloc_buffer(struct coresight_device *csdev,
-				   struct perf_event *event, void **pages,
+				   struct perf_event *event,
+				   struct etm_session_id *owner, void **pages,
 				   int nr_pages, bool snapshot)
 {
 	struct trbe_buf *buf;
diff --git a/drivers/hwtracing/coresight/ultrasoc-smb.c b/drivers/hwtracing/coresight/ultrasoc-smb.c
index 20a950b9dd4f..f66ec53070d7 100644
--- a/drivers/hwtracing/coresight/ultrasoc-smb.c
+++ b/drivers/hwtracing/coresight/ultrasoc-smb.c
@@ -302,7 +302,8 @@ static int smb_disable(struct coresight_device *csdev)
 }
 
 static void *smb_alloc_buffer(struct coresight_device *csdev,
-			      struct perf_event *event, void **pages,
+			      struct perf_event *event,
+			      struct etm_session_id *owner, void **pages,
 			      int nr_pages, bool overwrite)
 {
 	struct cs_buffers *buf;
diff --git a/include/linux/coresight.h b/include/linux/coresight.h
index 1c06a9800cfe..9e29f2cbf557 100644
--- a/include/linux/coresight.h
+++ b/include/linux/coresight.h
@@ -37,6 +37,7 @@
 #define CORESIGHT_UNLOCK	0xc5acce55
 
 extern const struct bus_type coresight_bustype;
+struct etm_session_id;
 
 enum coresight_dev_type {
 	CORESIGHT_DEV_TYPE_SINK,
@@ -371,7 +372,8 @@ struct coresight_ops_sink {
 		      struct coresight_path *path);
 	int (*disable)(struct coresight_device *csdev);
 	void *(*alloc_buffer)(struct coresight_device *csdev,
-			      struct perf_event *event, void **pages,
+			      struct perf_event *event,
+			      struct etm_session_id *owner, void **pages,
 			      int nr_pages, bool overwrite);
 	void (*free_buffer)(void *config);
 	unsigned long (*update_buffer)(struct coresight_device *csdev,

-- 
2.34.1


