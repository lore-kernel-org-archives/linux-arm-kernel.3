Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28D44CC6B38
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 10:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8Ww7vw1cHbaS0OK0U15aIuOd34iFtx9vG454ZZ5dnpQ=; b=w4eTpzWsJZkUASvW5WFip5Atlt
	V91II7sWtTw5FmeTkFPKf7/9ARMhAo3FKCcRUcLXATV1nmxrZZ68LZJ5k1SHL80e8gomWDxJbdXf/
	YADjgX17cPnFuKvdXlFLX7EtmEg8NaK+WqulKP3wenuykwT6ryWDpiTU6yMKp5yzrVI5sNp2SPCqI
	PUiGiI0LlQFhx916w3yeLo9pXIqCzIuuAvzQA7FGEpFA8Q5k1T1Hk+nfWlcxbkHq9yFO1UuEuRSk3
	eQ46CtvnHt932w7WcT6skFPf6Hjuylg/wSQBygLMx887n9phPebSIZ1Hm7f5cwdEE+iToSkYcS7oC
	aQPsDJHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHfSj-00000002hme-2434;
	Fri, 16 Oct 2026 10:46:57 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHfSd-00000002hfk-1upd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 10:46:53 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-49ff680331aso33239665e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Oct 2026 03:46:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792147610; x=1792752410; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8Ww7vw1cHbaS0OK0U15aIuOd34iFtx9vG454ZZ5dnpQ=;
        b=wMInrAm2HdvHP9un+lOAJmy3p+h1tqra1RapNwRXn53Da8FzpMNbSdMD+GDxQ/oslu
         W1v2nKnm07LX/HrMaD/IsjIxKI08H0rf9JQB7uPuL1uFEwUsGYVx+p2+Mu41k/kS1wgI
         uPIp4DHwOq1Hm2+ANFPvpzwdcZ8hZ6M+b5WAHRhpZq5NSnNRiQC1LEC3T3FyDwXpe6AP
         GCSFWGSzMdHaHlY9QOSnoUPi9+6cnzwVkxEgpX0H3o5aNagEo2lxYXAUgJtgn7pSpRAp
         UalEOSQBZhciIAsgcmNv4ogFU66SA/1nM/A4DKUye0V3FPxb4A/3CVKQY9PTEymjb0QD
         Lk8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792147610; x=1792752410;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8Ww7vw1cHbaS0OK0U15aIuOd34iFtx9vG454ZZ5dnpQ=;
        b=dBDWz6+6LNkBBVEL7r/29NgOp9aBz1jU2mB34lf6ABI6INNO6fcIFTwE+DrIn9GcMj
         utimp5wEaEd5oY/PauGITfc/LbSgdaXdXNsGswObhFVus+A121tjzoy76ClNhEIW6KPc
         vdJbq/zuVSx6RjrE2l1r3qfQAcg97pVVTJIRfcbmcuPr/Uubs0aZYXxZBtdZ0uBoROHi
         wL0NtlHtdKpE0goMuX6uQ2XstMgwd0lylAcj2A7ZvAyXUnxdiyeBHFqnpMoXFP8spOc6
         J5oL+GnuVY9hy6eZoxJyBqBchwIkPdhwpV1XExX16HTomJoLFA7jsKFmlPcVTxGxr3s0
         G/Xg==
X-Forwarded-Encrypted: i=1; AKwUvBwNjMU0osAt+ErlyCLPHrfMfhRUXZVfYfGCOCfhM7PkYKP0gSCEbfCu47oE3yZ/ywr/jD+ftOjGiuyVsTsxm0mH@lists.infradead.org
X-Gm-Message-State: AFq9FYKba7ZButT1OzSGEuEbspFvPMAKm3JmvlWwY3LD6akzcHhIjSgd
	wmj0uyoCTnpEuneDNJz9rhzaa7grYoTd3XMJocQeXFF1w30XLoYOd/y+sC48z02PgbA=
X-Gm-Gg: AYBFou39so4xt6YuqrX7D01RdM3SqGyUI9mfveLO12+mGlvQ82GVSUG130qHsVYAUZK
	jOuUq+IJj68qAV2bUOE7+syp1sWT6MxL3OETXbl96EQFwms/yf+epYiiOFTXyQil8+Gcni3oQ5b
	PsT767o3wy8O80OdbgOZxhZX3QF8NI5JO/3bFANZg2h6gfOtjrAN+Z1rqHnUovoFxjtzXnwZ84A
	lOUD+siie+XutXFsPr4ZlDM429lrp1iHznmJCzqPCeff6ZB+42pN6TWkp4w9I7dEISPCC8N9B2W
	zUjYFCsS83uDjj+ef5QgBfGOIJXGGsYaeLCAdr2iLzaYAe4Byb3K1DKMEOq4vOhJNin2nNfyDzm
	UgPg+Vy270uZEkeiYnrHPPh+mrAGjKUiq2BKMuhfe/QQTOd7TOaX0Y7DraN2dzo65R9rQ3GxiAP
	2luuYThT7QvE0y3sjicsVS31XFq7s9x5xiDoqFT6ARP13Ax+x6T4jeEhFIuckFul4onYXB62Plr
	A==
X-Received: by 2002:a05:600c:4747:b0:4a1:77db:45d9 with SMTP id 5b1f17b1804b1-4a18e47aa9amr459852675e9.6.1792147609652;
        Fri, 16 Oct 2026 03:46:49 -0700 (PDT)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4e7ff1sm4556570f8f.25.2026.10.16.03.46.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 03:46:49 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Fri, 16 Oct 2026 11:46:16 +0100
Subject: [PATCH v4 06/10] coresight: tmc-etr: Reflect new sharing rules in
 allocator
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-james-cs-multiple-per-threads-v4-6-dedf961aca0e@linaro.org>
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
X-CRM114-CacheID: sfid-20261016_034652_644249_F0C9091C 
X-CRM114-Status: GOOD (  31.86  )
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

The IDR map is now unused because only one owner can use a shared sink
at a time. Replace it with a single sink local buffer,
'shared_perf_buf'.

And now that we don't have the IDR map to store buffers for different
sessions, allocate a private buffer for 1:1 per-cpu sessions as well as
per-thread sessions. We didn't eliminate any allocations by sharing
buffers in 1:1 scenarios anyway, and we allow multiple per-cpu
PERF_ATTACH_TASK events. Obviously multiple users can't use a single
shared_perf_buf buffer, so use a per-event one.

Use the single-source classification saved during AUX admission so that
buffer allocation follows the same sharing mode as existing sessions.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/hwtracing/coresight/coresight-tmc-core.c |   4 +-
 drivers/hwtracing/coresight/coresight-tmc-etr.c  | 103 ++++++++---------------
 drivers/hwtracing/coresight/coresight-tmc.h      |  10 +--
 3 files changed, 43 insertions(+), 74 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
index bc5a133ada3e..864da1eea52c 100644
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
+		mutex_init(&drvdata->perf_buf_mutex);
 		dev_list = "tmc_etr";
 		break;
 	case TMC_CONFIG_TYPE_ETF:
diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
index 361a433e6f0c..b4b186c605c6 100644
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
@@ -1396,16 +1395,13 @@ alloc_etr_buf(struct tmc_drvdata *drvdata, struct perf_event *event,
 	return ERR_PTR(-ENOMEM);
 }
 
-static struct etr_buf *
-get_perf_etr_buf_cpu_wide(struct tmc_drvdata *drvdata,
-			  struct perf_event *event, int nr_pages,
-			  void **pages, bool snapshot)
+static struct etr_buf *get_perf_shared_etr_buf(struct tmc_drvdata *drvdata,
+					       struct perf_event *event,
+					       int nr_pages, void **pages,
+					       bool snapshot)
 {
-	int ret;
-	pid_t pid = task_pid_nr(event->owner);
 	struct etr_buf *etr_buf;
 
-retry:
 	/*
 	 * An etr_perf_buffer is associated with an event and holds a reference
 	 * to the AUX ring buffer that was created for that event.  In CPU-wide
@@ -1424,64 +1420,45 @@ get_perf_etr_buf_cpu_wide(struct tmc_drvdata *drvdata,
 	 * allocated for this session.  If so it is shared with this event,
 	 * otherwise it is created.
 	 */
-	mutex_lock(&drvdata->idr_mutex);
-	etr_buf = idr_find(&drvdata->idr, pid);
+	mutex_lock(&drvdata->perf_buf_mutex);
+	etr_buf = drvdata->shared_perf_buf;
 	if (etr_buf) {
 		refcount_inc(&etr_buf->refcount);
-		mutex_unlock(&drvdata->idr_mutex);
-		return etr_buf;
+		goto out;
 	}
 
 	/* If we made it here no buffer has been allocated, do so now. */
-	mutex_unlock(&drvdata->idr_mutex);
-
 	etr_buf = alloc_etr_buf(drvdata, event, nr_pages, pages, snapshot);
-	if (IS_ERR(etr_buf))
-		return etr_buf;
-
-	/* Now that we have a buffer, add it to the IDR. */
-	mutex_lock(&drvdata->idr_mutex);
-	ret = idr_alloc(&drvdata->idr, etr_buf, pid, pid + 1, GFP_KERNEL);
-	mutex_unlock(&drvdata->idr_mutex);
-
-	/* Another event with this session ID has allocated this buffer. */
-	if (ret == -ENOSPC) {
-		tmc_free_etr_buf(etr_buf);
-		goto retry;
-	}
-
-	/* The IDR can't allocate room for a new session, abandon ship. */
-	if (ret == -ENOMEM) {
-		tmc_free_etr_buf(etr_buf);
-		return ERR_PTR(ret);
-	}
-
-
+	if (!IS_ERR(etr_buf))
+		drvdata->shared_perf_buf = etr_buf;
+out:
+	mutex_unlock(&drvdata->perf_buf_mutex);
 	return etr_buf;
 }
 
-static struct etr_buf *
-get_perf_etr_buf_per_thread(struct tmc_drvdata *drvdata,
-			    struct perf_event *event, int nr_pages,
-			    void **pages, bool snapshot)
-{
-	/*
-	 * In per-thread mode the etr_buf isn't shared, so just go ahead
-	 * with memory allocation.
-	 */
-	return alloc_etr_buf(drvdata, event, nr_pages, pages, snapshot);
-}
-
 static struct etr_buf *
 get_perf_etr_buf(struct tmc_drvdata *drvdata, struct perf_event *event,
 		 int nr_pages, void **pages, bool snapshot)
 {
-	if (event->cpu == -1)
-		return get_perf_etr_buf_per_thread(drvdata, event, nr_pages,
-						   pages, snapshot);
+	struct coresight_perf_session_id *session = &drvdata->csdev->perf_sink_id_map.session;
 
-	return get_perf_etr_buf_cpu_wide(drvdata, event, nr_pages,
-					 pages, snapshot);
+	/*
+	 * Migratable events and 1:1 sinks use private buffers. Don't create a
+	 * drvdata->shared_perf_buf because these type of events support
+	 * multiple concurrent users. The path's session reference keeps the
+	 * saved single-source classification stable throughout this allocation.
+	 */
+	if (event->cpu == -1 || session->single_source)
+		return alloc_etr_buf(drvdata, event, nr_pages, pages, snapshot);
+
+	/*
+	 * Sharing rules defined in coresight_trace_id_perf_start() mean that
+	 * only one user can own the sink now, so we can allocate a sink local
+	 * bounce buffer. If that user had requested events with different aux
+	 * sizes, we'll use the size of the first event to create the buffer.
+	 */
+	return get_perf_shared_etr_buf(drvdata, event, nr_pages, pages,
+				       snapshot);
 }
 
 static struct etr_perf_buffer *
@@ -1508,7 +1485,7 @@ tmc_etr_setup_perf_buf(struct tmc_drvdata *drvdata, struct perf_event *event,
 done:
 	/*
 	 * Keep a reference to the ETR this buffer has been allocated for
-	 * in order to have access to the IDR in tmc_free_etr_buffer().
+	 * in order to clear the shared buffer in tmc_free_etr_buffer().
 	 */
 	etr_perf->drvdata = drvdata;
 	etr_perf->etr_buf = etr_buf;
@@ -1543,28 +1520,22 @@ static void tmc_free_etr_buffer(void *config)
 {
 	struct etr_perf_buffer *etr_perf = config;
 	struct tmc_drvdata *drvdata = etr_perf->drvdata;
-	struct etr_buf *buf, *etr_buf = etr_perf->etr_buf;
+	struct etr_buf *etr_buf = etr_perf->etr_buf;
 
 	if (!etr_buf)
 		goto free_etr_perf_buffer;
 
-	mutex_lock(&drvdata->idr_mutex);
+	mutex_lock(&drvdata->perf_buf_mutex);
 	/* If we are not the last one to use the buffer, don't touch it. */
 	if (!refcount_dec_and_test(&etr_buf->refcount)) {
-		mutex_unlock(&drvdata->idr_mutex);
+		mutex_unlock(&drvdata->perf_buf_mutex);
 		goto free_etr_perf_buffer;
 	}
 
-	/* We are the last one, remove from the IDR and free the buffer. */
-	buf = idr_remove(&drvdata->idr, etr_perf->pid);
-	mutex_unlock(&drvdata->idr_mutex);
-
-	/*
-	 * Something went very wrong if the buffer associated with this ID
-	 * is not the same in the IDR.  Leak to avoid use after free.
-	 */
-	if (buf && WARN_ON(buf != etr_buf))
-		goto free_etr_perf_buffer;
+	/* Clear the CPU-wide cache before freeing its last reference. */
+	if (drvdata->shared_perf_buf == etr_buf)
+		drvdata->shared_perf_buf = NULL;
+	mutex_unlock(&drvdata->perf_buf_mutex);
 
 	tmc_free_etr_buf(etr_perf->etr_buf);
 
diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
index 319a354ede9f..95e5623ea881 100644
--- a/drivers/hwtracing/coresight/coresight-tmc.h
+++ b/drivers/hwtracing/coresight/coresight-tmc.h
@@ -8,7 +8,6 @@
 #define _CORESIGHT_TMC_H
 
 #include <linux/dma-mapping.h>
-#include <linux/idr.h>
 #include <linux/miscdevice.h>
 #include <linux/mutex.h>
 #include <linux/refcount.h>
@@ -235,8 +234,8 @@ struct tmc_resrv_buf {
  * @etr_caps:	Bitmask of capabilities of the TMC ETR, inferred from the
  *		device configuration register (DEVID)
  * @etr_mode:	User preferred mode of the ETR device, default auto mode.
- * @idr:	Holds etr_bufs allocated for this ETR.
- * @idr_mutex:	Access serialisation for idr.
+ * @shared_perf_buf: CPU-wide perf buffer shared by this ETR's owner.
+ * @perf_buf_mutex: Protects shared_perf_buf and its reference count.
  * @sysfs_buf:	SYSFS buffer for ETR.
  * @perf_buf:	PERF buffer for ETR.
  * @resrv_buf:  Used by ETR as hardware trace buffer and for trace data
@@ -269,8 +268,9 @@ struct tmc_drvdata {
 	u32			trigger_cntr;
 	u32			etr_caps;
 	enum etr_mode		etr_mode;
-	struct idr		idr;
-	struct mutex		idr_mutex;
+	struct etr_buf		*shared_perf_buf;
+	/* Protects shared_perf_buf and its reference count. */
+	struct mutex		perf_buf_mutex;
 	struct etr_buf		*sysfs_buf;
 	struct etr_buf		*perf_buf;
 	struct tmc_resrv_buf	resrv_buf;

-- 
2.43.0


