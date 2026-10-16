Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6216CCCA48B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 10:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DCU7cJAIMxdxXXb/6ug/lUYU81eTYh4+NwDNWzudWtU=; b=JiC0Vh7eIXDf4zeVo/VyrnOOiQ
	Ek2vCCujaCEto9DVA/FiiwXhusQKFBGibaPZsSDeeQeyOcm6gKJJR4HipWkb1NS9t6v7jNjalXIgP
	xW2OWGmLk7j20DyOZGQDXamMybdiBeGDEKpciANn7uHyFZ17AY62xQIwkdYanYSzDwZ7Ocd1f4VPS
	iu8hyjoRwLwj+lSqpqd+VZXL7iYmSOyvg9UavT9aLxpQdxWYPu3+5Y6xXnBKJ564RAs1jfOiG1u5C
	JVoM2iWcIZfVTrWFomBpbuaz+QRJOPRMX3u15u+BdAxf0QdpbTGnItop9eL+Yv0Q9acI4DMeRH2ZY
	VGrS8a3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHfSb-00000002hfD-2Wmp;
	Fri, 16 Oct 2026 10:46:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHfSZ-00000002hcn-1cbu
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 16 Oct 2026 10:46:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=DCU7cJAIMxdxXXb/6ug/lUYU81eTYh4+NwDNWzudWtU=; b=oK93iQK/eBkTAloybEXY5Vzvug
	05WwU/nmDSFGL0gCOec7811sTD6h7yinkAPmE2Jgxiimd+mIetjjVHY8TjWZh3lR9azJlzyJvT1Cq
	eusooo4yb+YvxbnmPGoNyZIrSdPrPshW1Z4XvA7zOQJskGvctiZekeeC8Oq2k4icPhDbAuF6L06AB
	w7T3Hvpz1TH8ZyAPraJeR1jTWYlf5XqF9thI6edbUT6nSj7YYobkl6kzXZ9N402ZgBX9h9YLr7fTq
	80G5BdKFLitgfAY3AEZfvXZgiWw/41wptVE1rTJUNG/mEi0aguIYzNHjDApre0gkh5v4u4+v/NKoe
	r3xiVsZg==;
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xHfSW-00000001PHZ-2Lrz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 10:46:46 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-48c4649b35bso1306876f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Oct 2026 03:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792147603; x=1792752403; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DCU7cJAIMxdxXXb/6ug/lUYU81eTYh4+NwDNWzudWtU=;
        b=qqkKavPMLRRtA8icYs5fMVezxtx+IpVXtaMhmErreCXXMziBYlmV/QOwORA5cRQuPW
         aZDX1AwjMFixOzEouH9p9x+r05rRIlbarPkcDozeAymFN0O1PSwgksSfJNNfcx9pOj2n
         Xm5oqcvj+oKrCL9hoiFLDsL2q8ZXOMG/EdtvC1p3ajmfblwWzlksff0gAF1PxRl374fU
         fzty+hiS0kSMokhjqt2Ce8ouX6odcPQiCM8pd4Gl4cE+F9yqNONgcDXetOIvyV2jFXx+
         WhOSQqF9bYqGMR8mYNcWD5iNWTphvyNiIOERQykev0s5wDEBctQBKJP31oIlLViZXxB2
         Q2vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792147603; x=1792752403;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DCU7cJAIMxdxXXb/6ug/lUYU81eTYh4+NwDNWzudWtU=;
        b=sLCvAiPX/MMTsV4LT44CCpeZ9rITIRfWdGzaY0VLALmUjdJhrqFAz91sVs7Kj0sjWC
         /xjhXns8ALoZ2cXJcevhTfXMc0Y5NeQiF7dHmZ2hna7Zp87oOpLIL5d/PmtYGlTlRHpx
         SFO3jvg2Jq4HayzgwBk09hr2Jg6JLvt761r2vJENdAv+h5Nhqvhy4kF64kkkHBO/N7aA
         BbwTKIOPtHTS0duDeJrng+9BPEFYgHAf3tQshgkUukmgGUwz0hn8OhLM/LFgbDWGpxEu
         egioe87KLmNxzKgCu3k6KpcWdATaSV2aaaeOvdZHbgWlijd7mo5iZsrej5cNssd9USl8
         fczw==
X-Forwarded-Encrypted: i=1; AKwUvBzNuGm+PC/oeMCM6zfEbnJFSd3iznJJ4tETIkAUTYRqDi2I/hprHHifYeuh/ogy1nKkWVjYpOBOcpOgX0dnsiok@lists.infradead.org
X-Gm-Message-State: AFq9FYLxKmZRpd5Pdc/niHyj/zW6qAcInxqmXIWfY9SyWR6NsrPAZj0U
	7JZmHK3ruzcSN2NCFxQXd9AeYDkS6IE/umWoP+f46oaIlmHeWJtlsKS4EPy+i9qZdFg=
X-Gm-Gg: AYBFou26FH8n3kpkLzAWMM1uXNrFSLGeNQoNv2+BvSqjUMMdTGhKfOKuPGI7zgwHAAr
	cqnIwqbrwfFN+n6E5TwRRQCADvyNOmo5gW/9mVU7NLbWqy3H1bO9L+z/ddvy02W6frG5SQl40pM
	qu0fau0ObxxIz5/5jUa9/L+XfDvbxSt4i+JFCbSruCJLuHhD5W7uKHsphgHDOxFupbNfmd89ogF
	mMZZyDmyb58AsjBYeXqF9KQKp2j/QsHJEt50Koc8EdYh9OI5OB+ITnJ5z176OWkU1wbkWjBILs2
	Hlda2N8J93qwik1T27a7NqR2Cs0bg3aeS44+7E+Ytwg5QJrZvL8ieOu1xCTxRLXzGtM9sy1YDR1
	/lzZV0/O7AcBJKIWdn3Hyw27NZUwNOZKigIWGtWo5prgqLeWAAYjwxsx9USt54APZHp6o8wrzAB
	F04j1XjB+hNpR68pUscqFSWKFgc6hAk+XKS0Ixly7NHPM+2G1gYZ6Y0fpb4T0XMer4vDNfsn4L2
	g==
X-Received: by 2002:a05:6000:611:b0:48d:f5c6:1a0d with SMTP id ffacd0b85a97d-48df5c61b34mr9447610f8f.15.1792147602990;
        Fri, 16 Oct 2026 03:46:42 -0700 (PDT)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4e7ff1sm4556570f8f.25.2026.10.16.03.46.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 03:46:42 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Fri, 16 Oct 2026 11:46:12 +0100
Subject: [PATCH v4 02/10] coresight: etm-perf: Remove workqueue for freeing
 AUX data
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-james-cs-multiple-per-threads-v4-2-dedf961aca0e@linaro.org>
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
X-CRM114-CacheID: sfid-20261016_114644_763175_F573ECBC 
X-CRM114-Status: GOOD (  18.18  )
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

AUX cleanup is deferred to a workqueue which is never flushed on module
unload. Pending work items can therefore run after coresight-config is
cleaned up or the module text is unloaded.

Since commit 95ff4ca26c49 ("perf/core: Free AUX pages in unmap path"), Perf
core stops AUX transactions and frees the PMU AUX data from the unmap
path in non-atomic context. Release the resources directly from the
free_aux() callback and remove the workqueue.

Fixes: 0bcbf2e30ff2 ("coresight: etm-perf: new PMU driver for ETM tracers")
Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/hwtracing/coresight/coresight-etm-perf.c | 14 ++------------
 drivers/hwtracing/coresight/coresight-etm-perf.h |  2 --
 2 files changed, 2 insertions(+), 14 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
index 09b21a711a87..2323a68584d4 100644
--- a/drivers/hwtracing/coresight/coresight-etm-perf.c
+++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
@@ -18,7 +18,6 @@
 #include <linux/slab.h>
 #include <linux/stringhash.h>
 #include <linux/types.h>
-#include <linux/workqueue.h>
 
 #include "coresight-config.h"
 #include "coresight-etm-perf.h"
@@ -211,13 +210,12 @@ static void free_sink_buffer(struct etm_event_data *event_data)
 	sink_ops(sink)->free_buffer(event_data->snk_config);
 }
 
-static void free_event_data(struct work_struct *work)
+static void etm_free_aux(void *data)
 {
 	int cpu;
 	cpumask_t *mask;
-	struct etm_event_data *event_data;
+	struct etm_event_data *event_data = data;
 
-	event_data = container_of(work, struct etm_event_data, work);
 	mask = &event_data->mask;
 
 	/* Free the sink buffers, if there are any */
@@ -288,13 +286,6 @@ static void *alloc_event_data(int cpu)
 	return event_data;
 }
 
-static void etm_free_aux(void *data)
-{
-	struct etm_event_data *event_data = data;
-
-	schedule_work(&event_data->work);
-}
-
 /*
  * Check if two given sinks are compatible with each other,
  * so that they can use the same sink buffers, when an event
@@ -436,7 +427,6 @@ static void *etm_setup_aux(struct perf_event *event, void **pages,
 	event_data = alloc_event_data(cpu);
 	if (!event_data)
 		return NULL;
-	INIT_WORK(&event_data->work, free_event_data);
 
 	/* First get the selected sink from user space. */
 	sink_hash = ATTR_CFG_GET_FLD(&event->attr, sinkid);
diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.h b/drivers/hwtracing/coresight/coresight-etm-perf.h
index 24d929428633..5e8d985522bd 100644
--- a/drivers/hwtracing/coresight/coresight-etm-perf.h
+++ b/drivers/hwtracing/coresight/coresight-etm-perf.h
@@ -84,7 +84,6 @@ struct etm_filters {
 
 /**
  * struct etm_event_data - Coresight specifics associated to an event
- * @work:		Handle to free allocated memory outside IRQ context.
  * @mask:		Hold the CPU(s) this event was set for.
  * @aux_hwid_done:	Whether a CPU has emitted the TraceID packet or not.
  * @snk_config:		The sink configuration.
@@ -92,7 +91,6 @@ struct etm_filters {
  * @path:		An array of path, each slot for one CPU.
  */
 struct etm_event_data {
-	struct work_struct work;
 	cpumask_t mask;
 	cpumask_t aux_hwid_done;
 	void *snk_config;

-- 
2.43.0


