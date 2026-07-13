Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECE6CC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 23:00:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qo7IAvthG118m/JTtLFPGSZtzV4fU1ihRDscsFNE2qM=; b=e2aN206vFdi31zNm8G5Hwp1WMU
	74dqtqJg06bZcOem1e8rSb6cGNDpQqsdv/nBgs+W93fbM2FqhjGsb/9HPacGqT/3I94TKnMzD7HLB
	TCTASCT5LCE6AFfVLf95qiqkpVDn6QfTnDpLVHkODS5qogWbwgr/p1z5reKukPUAARpiy97DZXQ7l
	c+L1Qe7eH63QlF0m3clnBsrw8+BQAbIxzflRYepeifiy2r/nQVG8/zeuwy7kZx5KYlQYcZmgLn33o
	JcfMLCRcLauCqUJfcKSyhGxOVaK4BA1zRv9oAPbvTLOS9a3t2kY4LHO5tm407nitrpkuJ8ulgWrx4
	aC2iOpCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjPdr-0000000AX0f-0YOk;
	Mon, 13 Jul 2026 23:00:51 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjPdo-0000000AX0E-2rRv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 23:00:49 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-698beff7178so6391608a12.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 16:00:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783983646; x=1784588446; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Qo7IAvthG118m/JTtLFPGSZtzV4fU1ihRDscsFNE2qM=;
        b=aWtlAEfsE56eaRQrzuBJRUfECLHVopI4q+Fr/wn3soZXKQ/NWmn2sQt1xh0wjFC+hD
         CNk20iCYSqDSqLNXwSehDsJjcIaX0R8jzpXbeqdNoC1o86LgNWFFpRg9MHVtBrkNKP3n
         kz1kqIba0wLlslUS2PxSNUMXEm6AvEX71AB7hsRxYQYS9DGrx0QJvH45Sn4f9B8UwoJ8
         vZFMjfHTR4YC/e08oH51zGO85SWFDvhaJtMHjTcLxX4YL6IoxcXRksNfyUBlrIY5YYAG
         k7WdX7505Lr/Ugc+1fNj5YWC4HyiAkKr4UqcSNfYRcJYCNnvButIaM3UC07atds3SDZ2
         CHWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783983646; x=1784588446;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Qo7IAvthG118m/JTtLFPGSZtzV4fU1ihRDscsFNE2qM=;
        b=fhl7mQVxQ34DE61u0PBvC3XU+ND86+658cyZLNvCot5KMBtCVk8r7nNlFxVKVREWKR
         cdpg8roJnVjaboLqCY2YTAYwWxoYQw46aG07HqmJ+/WYl0itvC+e0RGBbEHuD1fxeZNS
         QZfyIdPqc++PM53Mz1pYGl+1u8ZgjHa+tMlMkgGNi/1Hzd/J4B/uFj1nPr61OLfNMjZT
         TuAYfqFsvAGbZEn+kH0AHCg6PTs2eNyeZpVmT6jhC3sKWsM83GgitZaajarObFNpOaC3
         o9bYhRAPcPToCA1ueirSgOXDomZ1OkBNGsyaPytEQtWlVcHvEEd2TL0jw2TrqeNhyk/e
         S4CA==
X-Forwarded-Encrypted: i=1; AHgh+RpkxVDvP8EnyWUvammy/jXb+h5ptIpuK5wW8zH/aSUsfNiNBSE8z8mOP4p+XSi6UASEUHu4nqZInKFdIlwiQJe7@lists.infradead.org
X-Gm-Message-State: AOJu0Yzndy3h31o+lVSCb5mGrhoyX3Sj+GlbZQRhxy7ovqXYj3RHa7rD
	JlpCqd4WIwP8LgvzSUaWFBj5pDuN27FvvQpDh5e9Bf7A/FEjthFiYTZE
X-Gm-Gg: AfdE7clxTWxavKX4HAKKHNow6M3DYGvyZEKtvZ4jSAQOQbuCBZZdEh/TjxtxJa4nTvj
	NjNEx95r7fhsiFoUV5SC3DALxw+MoSz6Pe5fftzB6rUwO/gswZ8aVrbvjhgMVUcImLJXOQO0/Ia
	plIdahVmnzqZVTpXE4sEMFJxZS80iL4l4a3U0FqWz2jBCTqEPh4XNn4iYLpqkiV6c1aQHoJcb00
	Vp6aF+lhGxbJLkPlGM4P1tgBjPAmts5+AmYR+h97eElltiLl10LMLssHLdR3AHDhmOUzF5AKrJ6
	JRKSRyk54TpSAkgaz/SmOordLUataYNSqhrRkWT+A4m+o0vqydVSxxIQ699+bK7giwvDd8Zk70N
	oCjCI0Jsens474lLzsUXla4ge6ELJOPCZErwFFCAgDPSD/+QtdOs/Q7oBpFnRpsV/O1n7xWd1Vw
	fWpsnJu3glt76l0boUYQgpcvQycp5MOPJmkkZ0XAdgDg3wRG2AzA==
X-Received: by 2002:a05:6402:1e8f:b0:698:1973:1daa with SMTP id 4fb4d7f45d1cf-69c5f10c9b9mr4960904a12.18.1783983646028;
        Mon, 13 Jul 2026 16:00:46 -0700 (PDT)
Received: from ST.. ([154.189.248.22])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69cd2878e74sm512640a12.4.2026.07.13.16.00.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 16:00:44 -0700 (PDT)
From: Mohamed Ayman <mohamedaymanworkspace@gmail.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>,
	Leo Yan <leo.yan@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	coresight@lists.linaro.org (moderated list:ARM/CORESIGHT FRAMEWORK AND DRIVERS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/CORESIGHT FRAMEWORK AND DRIVERS),
	linux-kernel@vger.kernel.org (open list),
	linux-rt-devel@lists.linux.dev (open list:Real-time Linux (PREEMPT_RT):Keyword:PREEMPT_RT)
Cc: Mohamed Ayman <mohamedaymanworkspace@gmail.com>,
	coresight@lists.linaro.org (moderated list:ARM/CORESIGHT FRAMEWORK AND DRIVERS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/CORESIGHT FRAMEWORK AND DRIVERS),
	linux-kernel@vger.kernel.org (open list),
	linux-rt-devel@lists.linux.dev (open list:Real-time Linux (PREEMPT_RT):Keyword:PREEMPT_RT)
Subject: [PATCH v2] coresight: Fix scheduling while atomic in coresight_put_percpu_source_ref()
Date: Tue, 14 Jul 2026 02:00:27 +0300
Message-Id: <20260713230028.8046-1-mohamedaymanworkspace@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260712210446.14290-1-mohamedaymanworkspace@gmail.com>
References: <20260712210446.14290-1-mohamedaymanworkspace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_160048_793176_5B9BBB06 
X-CRM114-Status: GOOD (  22.38  )
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

Dropping the last reference to a coresight_device triggers a kernel panic
on PREEMPT_RT builds due to a "scheduling while atomic" violation.

During CPU idle transitions, coresight_cpu_pm_notify() runs with
interrupts disabled. It eventually calls put_device(), which can
synchronously trigger the device's release callback and drop the parent
device's reference. On PREEMPT_RT, free_percpu() takes a sleeping lock
(rt-mutex), and the parent's release callback might also sleep. Sleeping
in this atomic PM context crashes the system.

A previous patch tried deferring just the coresight_device_release() body,
but this still left the synchronous put_device() call dangerously exposed
to sleeping parent release functions.

Fix this by entirely deferring the put_device() call to process context.
We add a pending counter (put_pending) and a work_struct to the coresight
device. When releasing a reference, we increment the counter and queue
the work. A worker thread then safely drains the counter and calls
put_device(). The counter prevents leaking references if multiple puts
are queued before the worker even has a chance to run.

To prevent a use-after-free race condition during module unload, the work
is queued on a dedicated coresight_wq which is safely drained and
destroyed in coresight_exit().

Finally, remove the unnecessary raw_spinlock_irqsave in the put path,
as dropping a reference doesn't require protecting the per-CPU table.

Signed-off-by: Mohamed Ayman <mohamedaymanworkspace@gmail.com>
---
 drivers/hwtracing/coresight/coresight-core.c | 37 ++++++++++++++------
 include/linux/coresight.h                    |  3 ++
 2 files changed, 30 insertions(+), 10 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index 6d65c43d5..e931e6bdc 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -63,6 +63,8 @@ static LIST_HEAD(coresight_dev_idx_list);
 
 static const struct cti_assoc_op *cti_assoc_ops;
 
+static struct workqueue_struct *coresight_wq;
+
 static struct coresight_node *
 coresight_path_first_node(struct coresight_path *path)
 {
@@ -132,6 +134,16 @@ static void coresight_clear_percpu_source(struct coresight_device *csdev)
 	per_cpu(csdev_source, csdev->cpu) = NULL;
 }
 
+static void coresight_put_device_work(struct work_struct *work)
+{
+	struct coresight_device *csdev =
+		container_of(work, struct coresight_device, put_work);
+	int n = atomic_xchg(&csdev->put_pending, 0);
+
+	while (n--)
+		put_device(&csdev->dev);
+}
+
 struct coresight_device *coresight_get_percpu_source_ref(int cpu)
 {
 	struct coresight_device *csdev;
@@ -163,16 +175,9 @@ void coresight_put_percpu_source_ref(struct coresight_device *csdev)
 	if (!csdev || !coresight_is_percpu_source(csdev))
 		return;
 
-	guard(raw_spinlock_irqsave)(&coresight_dev_lock);
+	atomic_inc(&csdev->put_pending);
 
-	/*
-	 * TODO: coresight_device_release() is invoked to release resources when
-	 * the device's refcount reaches zero. It then calls free_percpu(),
-	 * which acquires pcpu_lock — a sleepable lock when PREEMPT_RT is
-	 * enabled. Since the raw spinlock coresight_dev_lock is held, this can
-	 * lead to a potential "scheduling while atomic" issue.
-	 */
-	put_device(&csdev->dev);
+	queue_work(coresight_wq, &csdev->put_work);
 }
 
 struct coresight_device *coresight_get_source(struct coresight_path *path)
@@ -1563,6 +1568,9 @@ coresight_init_device(struct coresight_desc *desc)
 	csdev->dev.release = coresight_device_release;
 	csdev->dev.bus = &coresight_bustype;
 
+	INIT_WORK(&csdev->put_work, coresight_put_device_work);
+	atomic_set(&csdev->put_pending, 0);
+
 	return csdev;
 }
 
@@ -2090,9 +2098,13 @@ static int __init coresight_init(void)
 {
 	int ret;
 
+	coresight_wq = alloc_workqueue("coresight_wq", 0, 0);
+	if (!coresight_wq)
+		return -ENOMEM;
+
 	ret = bus_register(&coresight_bustype);
 	if (ret)
-		return ret;
+		goto exit_wq;
 
 	ret = etm_perf_init();
 	if (ret)
@@ -2121,6 +2133,8 @@ static int __init coresight_init(void)
 	etm_perf_exit();
 exit_bus_unregister:
 	bus_unregister(&coresight_bustype);
+exit_wq:
+	destroy_workqueue(coresight_wq);
 	return ret;
 }
 
@@ -2133,6 +2147,9 @@ static void __exit coresight_exit(void)
 	etm_perf_exit();
 	bus_unregister(&coresight_bustype);
 	coresight_release_device_list();
+
+	if (coresight_wq)
+		destroy_workqueue(coresight_wq);
 }
 
 module_init(coresight_init);
diff --git a/include/linux/coresight.h b/include/linux/coresight.h
index ddf18c970..589a6c20d 100644
--- a/include/linux/coresight.h
+++ b/include/linux/coresight.h
@@ -13,6 +13,7 @@
 #include <linux/perf_event.h>
 #include <linux/sched.h>
 #include <linux/platform_device.h>
+#include <linux/workqueue.h>
 
 /* Peripheral id registers (0xFD0-0xFEC) */
 #define CORESIGHT_PERIPHIDR4	0xfd0
@@ -293,6 +294,8 @@ struct coresight_device {
 	struct csdev_access access;
 	struct device dev;
 	struct coresight_path *path;
+	struct work_struct put_work;
+	atomic_t put_pending;
 	atomic_t mode;
 	int refcnt;
 	int cpu;
-- 
2.34.1


