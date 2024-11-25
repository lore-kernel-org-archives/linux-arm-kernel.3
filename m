Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6DC2D3B7FD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Nov 2024 10:17:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iYlo1/NurxSLgJe/iRNqYykt64ZIWrcPQtcs8oooGqs=; b=mbD4Xlz4gAWgRAjhRr1g51Gjg+
	bccZ0BMIlj9mkrQuf02atsFeB4Dw2EKi52P7ynrcJl8cu4NRbAxFG7RwTOzIxMDhWhnfknVNU/uO1
	Km+OiNZH2rTSZj2e16l6qgoPFzpRWBd1q++8FIsk60L1/iWMoUhwpsV0QcMnfkbVr6VVJ0YP/TYOL
	ppDx7n/BY+IsEf3iGWnRd8imsKNhRMdKqEerurNJvRr1hsyIRXXfVsOm1Fw4MURK3+YPuQxhdgAdB
	pxzdMOiAV+1PKf09D71lw1EWO0LYttk/SpW6nT5SFWUU4mPtDE7FRTGr97RSnLvAvlnW4NXLFmRL1
	YLTHNXbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFW9t-00000007hnF-3cYK;
	Mon, 25 Nov 2024 10:17:33 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFVhl-00000007dkc-0Txr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Nov 2024 09:48:30 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C02D81FCD;
	Mon, 25 Nov 2024 01:48:58 -0800 (PST)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 8CE293F66E;
	Mon, 25 Nov 2024 01:48:26 -0800 (PST)
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: suzuki.poulose@arm.com,
	mike.leach@linaro.org,
	james.clark@linaro.org,
	alexander.shishkin@linux.intel.com,
	bigeasy@linutronix.de,
	clrkwllms@kernel.org,
	rostedt@goodmis.org
Cc: coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rt-devel@lists.linux.dev,
	nd@arm.com,
	Levi Yun <yeoreum.yun@arm.com>
Subject: [PATCH 3/9] coresight: change coresight_trace_id_map's lock type to raw_spinlock_t
Date: Mon, 25 Nov 2024 09:48:10 +0000
Message-Id: <20241125094816.365472-4-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241125094816.365472-1-yeoreum.yun@arm.com>
References: <20241125094816.365472-1-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_014829_241434_439D4E9E 
X-CRM114-Status: GOOD (  18.49  )
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

From: Levi Yun <yeoreum.yun@arm.com>

coresight_trace_id_map->lock can be acquired while coresight devices'
drvdata_lock.

But the drvdata_lock can be raw_spinlock_t (i.e) coresight-etm4x.

To address this, change type of coresight_trace_id_map->lock to
raw_spinlock_t

Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 drivers/hwtracing/coresight/coresight-core.c  |  2 +-
 .../hwtracing/coresight/coresight-trace-id.c  | 93 +++++++++----------
 include/linux/coresight.h                     |  2 +-
 3 files changed, 44 insertions(+), 53 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index ea38ecf26fcb..cc2d87b2f248 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -1164,7 +1164,7 @@ struct coresight_device *coresight_register(struct coresight_desc *desc)
 
 	if (csdev->type == CORESIGHT_DEV_TYPE_SINK ||
 	    csdev->type == CORESIGHT_DEV_TYPE_LINKSINK) {
-		spin_lock_init(&csdev->perf_sink_id_map.lock);
+		raw_spin_lock_init(&csdev->perf_sink_id_map.lock);
 		csdev->perf_sink_id_map.cpu_map = alloc_percpu(atomic_t);
 		if (!csdev->perf_sink_id_map.cpu_map) {
 			kfree(csdev);
diff --git a/drivers/hwtracing/coresight/coresight-trace-id.c b/drivers/hwtracing/coresight/coresight-trace-id.c
index d98e12cb30ec..1818a353ac5f 100644
--- a/drivers/hwtracing/coresight/coresight-trace-id.c
+++ b/drivers/hwtracing/coresight/coresight-trace-id.c
@@ -16,7 +16,7 @@
 static DEFINE_PER_CPU(atomic_t, id_map_default_cpu_ids) = ATOMIC_INIT(0);
 static struct coresight_trace_id_map id_map_default = {
 	.cpu_map = &id_map_default_cpu_ids,
-	.lock = __SPIN_LOCK_UNLOCKED(id_map_default.lock)
+	.lock = __RAW_SPIN_LOCK_UNLOCKED(id_map_default.lock)
 };
 
 /* #define TRACE_ID_DEBUG 1 */
@@ -118,50 +118,46 @@ static void coresight_trace_id_free(int id, struct coresight_trace_id_map *id_ma
  */
 static void coresight_trace_id_release_all(struct coresight_trace_id_map *id_map)
 {
-	unsigned long flags;
 	int cpu;
 
-	spin_lock_irqsave(&id_map->lock, flags);
-	bitmap_zero(id_map->used_ids, CORESIGHT_TRACE_IDS_MAX);
-	for_each_possible_cpu(cpu)
-		atomic_set(per_cpu_ptr(id_map->cpu_map, cpu), 0);
-	spin_unlock_irqrestore(&id_map->lock, flags);
+	scoped_guard(raw_spinlock_irqsave, &id_map->lock) {
+		bitmap_zero(id_map->used_ids, CORESIGHT_TRACE_IDS_MAX);
+		for_each_possible_cpu(cpu)
+			atomic_set(per_cpu_ptr(id_map->cpu_map, cpu), 0);
+	}
+
 	DUMP_ID_MAP(id_map);
 }
 
 static int _coresight_trace_id_get_cpu_id(int cpu, struct coresight_trace_id_map *id_map)
 {
-	unsigned long flags;
 	int id;
 
-	spin_lock_irqsave(&id_map->lock, flags);
-
-	/* check for existing allocation for this CPU */
-	id = _coresight_trace_id_read_cpu_id(cpu, id_map);
-	if (id)
-		goto get_cpu_id_out_unlock;
-
-	/*
-	 * Find a new ID.
-	 *
-	 * Use legacy values where possible in the dynamic trace ID allocator to
-	 * allow older tools to continue working if they are not upgraded at the
-	 * same time as the kernel drivers.
-	 *
-	 * If the generated legacy ID is invalid, or not available then the next
-	 * available dynamic ID will be used.
-	 */
-	id = coresight_trace_id_alloc_new_id(id_map,
-					     CORESIGHT_LEGACY_CPU_TRACE_ID(cpu),
-					     false);
-	if (!IS_VALID_CS_TRACE_ID(id))
-		goto get_cpu_id_out_unlock;
-
-	/* allocate the new id to the cpu */
-	atomic_set(per_cpu_ptr(id_map->cpu_map, cpu), id);
+	scoped_guard(raw_spinlock_irqsave, &id_map->lock) {
+		/* check for existing allocation for this CPU */
+		id = _coresight_trace_id_read_cpu_id(cpu, id_map);
+		if (id)
+			return id;
 
-get_cpu_id_out_unlock:
-	spin_unlock_irqrestore(&id_map->lock, flags);
+		/*
+		 * Find a new ID.
+		 *
+		 * Use legacy values where possible in the dynamic trace ID allocator to
+		 * allow older tools to continue working if they are not upgraded at the
+		 * same time as the kernel drivers.
+		 *
+		 * If the generated legacy ID is invalid, or not available then the next
+		 * available dynamic ID will be used.
+		 */
+		id = coresight_trace_id_alloc_new_id(id_map,
+						     CORESIGHT_LEGACY_CPU_TRACE_ID(cpu),
+						     false);
+		if (!IS_VALID_CS_TRACE_ID(id))
+			return id;
+
+		/* allocate the new id to the cpu */
+		atomic_set(per_cpu_ptr(id_map->cpu_map, cpu), id);
+	}
 
 	DUMP_ID_CPU(cpu, id);
 	DUMP_ID_MAP(id_map);
@@ -170,7 +166,6 @@ static int _coresight_trace_id_get_cpu_id(int cpu, struct coresight_trace_id_map
 
 static void _coresight_trace_id_put_cpu_id(int cpu, struct coresight_trace_id_map *id_map)
 {
-	unsigned long flags;
 	int id;
 
 	/* check for existing allocation for this CPU */
@@ -178,25 +173,23 @@ static void _coresight_trace_id_put_cpu_id(int cpu, struct coresight_trace_id_ma
 	if (!id)
 		return;
 
-	spin_lock_irqsave(&id_map->lock, flags);
-
-	coresight_trace_id_free(id, id_map);
-	atomic_set(per_cpu_ptr(id_map->cpu_map, cpu), 0);
+	scoped_guard(raw_spinlock_irqsave, &id_map->lock) {
+		coresight_trace_id_free(id, id_map);
+		atomic_set(per_cpu_ptr(id_map->cpu_map, cpu), 0);
+	}
 
-	spin_unlock_irqrestore(&id_map->lock, flags);
 	DUMP_ID_CPU(cpu, id);
 	DUMP_ID_MAP(id_map);
 }
 
 static int coresight_trace_id_map_get_system_id(struct coresight_trace_id_map *id_map)
 {
-	unsigned long flags;
 	int id;
 
-	spin_lock_irqsave(&id_map->lock, flags);
-	/* prefer odd IDs for system components to avoid legacy CPU IDS */
-	id = coresight_trace_id_alloc_new_id(id_map, 0, true);
-	spin_unlock_irqrestore(&id_map->lock, flags);
+	scoped_guard(raw_spinlock_irqsave, &id_map->lock) {
+		/* prefer odd IDs for system components to avoid legacy CPU IDS */
+		id = coresight_trace_id_alloc_new_id(id_map, 0, true);
+	}
 
 	DUMP_ID(id);
 	DUMP_ID_MAP(id_map);
@@ -205,11 +198,9 @@ static int coresight_trace_id_map_get_system_id(struct coresight_trace_id_map *i
 
 static void coresight_trace_id_map_put_system_id(struct coresight_trace_id_map *id_map, int id)
 {
-	unsigned long flags;
-
-	spin_lock_irqsave(&id_map->lock, flags);
-	coresight_trace_id_free(id, id_map);
-	spin_unlock_irqrestore(&id_map->lock, flags);
+	scoped_guard(raw_spinlock_irqsave, &id_map->lock) {
+		coresight_trace_id_free(id, id_map);
+	}
 
 	DUMP_ID(id);
 	DUMP_ID_MAP(id_map);
diff --git a/include/linux/coresight.h b/include/linux/coresight.h
index 924b58c343b3..6446ca1f09d8 100644
--- a/include/linux/coresight.h
+++ b/include/linux/coresight.h
@@ -233,7 +233,7 @@ struct coresight_trace_id_map {
 	DECLARE_BITMAP(used_ids, CORESIGHT_TRACE_IDS_MAX);
 	atomic_t __percpu *cpu_map;
 	atomic_t perf_cs_etm_session_active;
-	spinlock_t lock;
+	raw_spinlock_t lock;
 };
 
 /**
-- 
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}


