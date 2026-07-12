Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2950FC43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Jul 2026 21:05:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=76fARbTyu0qdrrH8D7924DNiR5qZurH1xIxVFjOxQhY=; b=4PjGVjNMOIwxoRYW8k9czJQO2A
	7J6I8TLUhuBs886NoWcFQ1rlxpYpylrRvixpK4G85p/fjyaOwDv0ew4TP0N+g+CkstTlnsYSlUD4X
	RsKyBTKtkWnWFFVtEtlKBFXiRYTofh31zsRuD6Mf1cJua21gGW5buvYQtQsiZ0pvS4x9QXuwmXGgV
	UtWPWYOMmOs9FT1HJKgvSu58OOv7qQ59u5umFkaQ/y8utob57KFd5nHtg5TClURb5UFRdGP7ovSwC
	PdPmtQOgBVTNT2JQNZq4IAL7BxKdF0ctoUFRoHv5kcAlj71D3wggXjhKoSVWc11lCOGNcA7whxxcM
	Y24nncRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj1MQ-00000007kWo-2JIx;
	Sun, 12 Jul 2026 21:05:14 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj1ML-00000007kVx-3otN
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Jul 2026 21:05:13 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-476d8e647e9so2605076f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Jul 2026 14:05:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783890308; x=1784495108; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=76fARbTyu0qdrrH8D7924DNiR5qZurH1xIxVFjOxQhY=;
        b=IljAeDqCrA6QFKUyf0MQStqdG71NoLWGHtce/n9X7akOHB5ZNHdzIFbMdt5PnWyV+j
         ulFjFpabuf8WpqIqAw5SJeahfZEFnLf4FrWPxmeH/moml1cOpXjBMBbtvJ7cRi1m8mUl
         ehchgCzZSPI8Y+qmfC3CRSIDnX5nPPrzwJO6P8KpKG03lk5wRnx9Pp5hAFXxpKq8PWmx
         AJtySL8TTjWVT9veau87f83ohs+FVf7eOYKU+vAIqX+V1+FvgI9S08nS2TS6hTsI7r8S
         Tq4eHj1+8QXNHEyhProKzeOiElolupf+WnY/Z1knatRXbeiheyZ5SWiT6hAncdOVsAKN
         Lemg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783890308; x=1784495108;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=76fARbTyu0qdrrH8D7924DNiR5qZurH1xIxVFjOxQhY=;
        b=jKAiFY2EsvRxbzk8m/rvWGTlRmfamXaD2I+j3dVoklIO1ioQDwBjyeKuT+T19v0uPi
         9oHFhigK0J5ftXALfQgyx2Pj+UAmYzBJdJkaVJ2LT2FIt6R4f/1QQlwZkh4k33tpUh12
         EEO0a5ADdSZDZ1tm0L5efwOFktX7f7uvDW0qAxsK5WxQxdz1O9j9HeMxVAqz+eu9JxOm
         Vl4Kiw2yBVZhHvnp67EQ1UpsJPZIL8Ivw7k2MB1xx5nfcPjAb14rM+aHyyXFs59OwIFJ
         0RnX/5DgRlhR66bavlleAikAhOzxU+VbHJmR59SJCozyXnUXfmppPjzjLbuCbZ1DCQVS
         2Imw==
X-Forwarded-Encrypted: i=1; AHgh+Rq/h0S2lQ3/oVNFNMssvZD6vzFM8MMraEhYjF54T8yVGaSE+5KljeulukCCN8EqGlra5Y8E2HGNKvUHokp+2n4U@lists.infradead.org
X-Gm-Message-State: AOJu0YzcFQsRGL/WcJ07DoQ9h04vSggEbTwDxtWQBQ1RDVfh4UIiIHq8
	t5CU+ykcI0JbUvVN6FVkHZEQDZcYeK7NiRb3sP99WAW4jqgeALsiDd25
X-Gm-Gg: AfdE7cn7eHRf2Owih3lRKPAoewL+71HJR2BU2Zswi5uwwh7E1P0X0ULIzNwZrgrNsoM
	nukK4tOKm3rvEhacSI4P18F3onerxjXMYd5rsnDL/QW6LbB06gCl83nAdpRGXE1dXswAbVg+gum
	RR8qy9Q0US8VemdMOLOAc9Q6H0Hg9OgJwj6zR2uS4DTvsz1P/rk1zBcE8yv9qYEAzKmH3hYX1Ln
	9kT/Faz1p7xIKQ2EjzMIKFWsMPCDMbs5G0PWhLqu1L1rCG+AnlAzhWRHLYfb0t+VGE6UYyEfXOz
	zQsapSVCL1w4P7ZcjarNU/cW5DHcWILHYppiyP32ikD6UGDrs8Xo15FYk071tRo10Y5Qe3/nc+A
	2DrCqpM4SfEx1CGqmbkwBHRsPmV4SJeabvneXeLABszIf9QxqhWQsTl95nTVG8LgglOz3FhTGUV
	qOnZuyHyqWbcI3yvvZO+XSBsczM3qvDMXo8+Wt7Ax6ic30rXVrhA==
X-Received: by 2002:a05:6000:220f:b0:474:7bf8:15d4 with SMTP id ffacd0b85a97d-47f2dcd720bmr7244179f8f.36.1783890307565;
        Sun, 12 Jul 2026 14:05:07 -0700 (PDT)
Received: from ST.. ([102.185.196.44])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa039b126sm76460144f8f.24.2026.07.12.14.05.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 14:05:07 -0700 (PDT)
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
Subject: [PATCH] coresight: Fix scheduling while atomic in coresight_device_release()
Date: Mon, 13 Jul 2026 00:04:45 +0300
Message-Id: <20260712210446.14290-1-mohamedaymanworkspace@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260712_140509_973544_698FD94A 
X-CRM114-Status: GOOD (  18.74  )
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

Dropping the last reference to a coresight_device can trigger a kernel
panic on PREEMPT_RT builds due to a "scheduling while atomic" violation.

When the CPU enters an idle state, coresight_cpu_pm_notify() is invoked
with local interrupts disabled (atomic context). This function eventually
calls coresight_put_percpu_source_ref(), which drops the device reference
via put_device(). If this is the last reference, it triggers the release
chain:

  coresight_cpu_pm_notify() (IRQs off)
    -> coresight_put_percpu_source_ref()
      -> put_device()
        -> coresight_device_release()
          -> free_percpu()

On a PREEMPT_RT kernel, free_percpu() acquires pcpu_lock, which is
implemented as a sleeping rt-mutex. Sleeping while in an atomic context
causes a system crash.

Fix this by deferring the teardown of the coresight_device to process
context. Add a work_struct to `struct coresight_device` and use
schedule_work() inside coresight_device_release() to safely execute
free_percpu() and kfree() in a worker thread, away from the atomic PM
notifier path.

Additionally, remove the redundant raw_spinlock_irqsave guard in
coresight_put_percpu_source_ref(). The lock was originally intended to
protect the per-CPU pointer table, but dropping a reference does not
touch this table.

Signed-off-by: Mohamed Ayman <mohamedaymanworkspace@gmail.com>
---
 drivers/hwtracing/coresight/coresight-core.c | 28 +++++++++++++-------
 include/linux/coresight.h                    |  2 ++
 2 files changed, 21 insertions(+), 9 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index 6d65c43d5..9dbdb2977 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -165,13 +165,6 @@ void coresight_put_percpu_source_ref(struct coresight_device *csdev)
 
 	guard(raw_spinlock_irqsave)(&coresight_dev_lock);
 
-	/*
-	 * TODO: coresight_device_release() is invoked to release resources when
-	 * the device's refcount reaches zero. It then calls free_percpu(),
-	 * which acquires pcpu_lock — a sleepable lock when PREEMPT_RT is
-	 * enabled. Since the raw spinlock coresight_dev_lock is held, this can
-	 * lead to a potential "scheduling while atomic" issue.
-	 */
 	put_device(&csdev->dev);
 }
 
@@ -1257,13 +1250,30 @@ static void coresight_clear_default_sink(struct coresight_device *csdev)
 	}
 }
 
+static void coresight_device_release_work(struct work_struct *work)
+{
+	struct coresight_device *csdev =
+		container_of(work, struct coresight_device, free_work);
+
+	free_percpu(csdev->perf_sink_id_map.cpu_map);
+	kfree(csdev);
+}
+
 static void coresight_device_release(struct device *dev)
 {
 	struct coresight_device *csdev = to_coresight_device(dev);
 
 	fwnode_handle_put(csdev->dev.fwnode);
-	free_percpu(csdev->perf_sink_id_map.cpu_map);
-	kfree(csdev);
+
+	/*
+	 * This release callback can run with the last reference dropped
+	 * from atomic/IRQs-off context (e.g. coresight_put_percpu_source_ref()
+	 * called from the CPU_PM notifier). free_percpu() takes pcpu_lock,
+	 * which is a sleeping lock under PREEMPT_RT, so defer the actual
+	 * teardown to process context.
+	 */
+	INIT_WORK(&csdev->free_work, coresight_device_release_work);
+	schedule_work(&csdev->free_work);
 }
 
 static int coresight_orphan_match(struct device *dev, void *data)
diff --git a/include/linux/coresight.h b/include/linux/coresight.h
index ddf18c970..63253f6c4 100644
--- a/include/linux/coresight.h
+++ b/include/linux/coresight.h
@@ -13,6 +13,7 @@
 #include <linux/perf_event.h>
 #include <linux/sched.h>
 #include <linux/platform_device.h>
+#include <linux/workqueue.h>
 
 /* Peripheral id registers (0xFD0-0xFEC) */
 #define CORESIGHT_PERIPHIDR4	0xfd0
@@ -293,6 +294,7 @@ struct coresight_device {
 	struct csdev_access access;
 	struct device dev;
 	struct coresight_path *path;
+	struct work_struct free_work;
 	atomic_t mode;
 	int refcnt;
 	int cpu;
-- 
2.34.1


