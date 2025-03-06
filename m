Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A346C282D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 11:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=76lVQbWNjuUoixzjxNLQsNuQs/RrcBizTlVzceExqxE=; b=ftcjQ3BemtfpIevT2jYwm6O19Y
	/USGcMMeonvUwiS+NPp5KtMr/DSdk7+rPbo/xE3rMX75ZOrcCppijmnwOcwMbVSD0GUpgxLdWUQTu
	vHoZrW2vXF8W7dsAdSaNN71JPQstgerU2at8BwLFlGA+qi2BEHGiSlj3p/U7Iow95oU05vJPLkwuG
	+XrJJKCisa2ERFRbt65xScsGftwI6EamCqi0YReiIQJl5p1AzadWXFzN3o1CN4rjrX2bBLJNV/WcT
	d7WTdPt7617rBvnudjzZVzu1sKdtriTgDcx7apJI30MiSY5vKo/e/KlPP7mZstrt9gbcqens3RUtz
	rvafTkVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tq9Ff-0000000Al4b-31sX;
	Thu, 06 Mar 2025 11:18:55 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tq7pz-0000000AXFp-0Lw1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 09:48:20 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B589B1007;
	Thu,  6 Mar 2025 01:48:31 -0800 (PST)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id F2AD33F673;
	Thu,  6 Mar 2025 01:48:16 -0800 (PST)
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
	Yeoreum Yun <yeoreum.yun@arm.com>
Subject: [PATCH v5 7/9] coresight-replicator: change replicator_drvdata spinlock's type to raw_spinlock_t
Date: Thu,  6 Mar 2025 09:47:58 +0000
Message-Id: <20250306094800.1082950-8-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250306094800.1082950-1-yeoreum.yun@arm.com>
References: <20250306094800.1082950-1-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_014819_333103_0F36DD96 
X-CRM114-Status: GOOD (  10.64  )
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

In coresight-replicator drivers, replicator_drvdata->spinlock can be held
during __schedule() by perf_event_task_sched_out()/in().

Since replicator_drvdata->spinlock type is spinlock_t and
perf_event_task_sched_out()/in() is called after acquiring rq_lock,
which is raw_spinlock_t (an unsleepable lock),
this poses an issue in PREEMPT_RT kernel where spinlock_t is sleepable.

To address this, change type replicator_drvdata->spinlock in
coresight-replicator drivers, which can be called
by perf_event_task_sched_out()/in(), from spinlock_t to raw_spinlock_t.

Reviewed-by: James Clark <james.clark@linaro.org>
Reviewed-by: Mike Leach <mike.leach@linaro.org>
Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 drivers/hwtracing/coresight/coresight-replicator.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-replicator.c b/drivers/hwtracing/coresight/coresight-replicator.c
index a1181c9048c0..ee7ee79f6cf7 100644
--- a/drivers/hwtracing/coresight/coresight-replicator.c
+++ b/drivers/hwtracing/coresight/coresight-replicator.c
@@ -41,7 +41,7 @@ struct replicator_drvdata {
 	struct clk		*atclk;
 	struct clk		*pclk;
 	struct coresight_device	*csdev;
-	spinlock_t		spinlock;
+	raw_spinlock_t		spinlock;
 	bool			check_idfilter_val;
 };
 
@@ -125,7 +125,7 @@ static int replicator_enable(struct coresight_device *csdev,
 	unsigned long flags;
 	bool first_enable = false;
 
-	spin_lock_irqsave(&drvdata->spinlock, flags);
+	raw_spin_lock_irqsave(&drvdata->spinlock, flags);
 	if (out->src_refcnt == 0) {
 		if (drvdata->base)
 			rc = dynamic_replicator_enable(drvdata, in->dest_port,
@@ -135,7 +135,7 @@ static int replicator_enable(struct coresight_device *csdev,
 	}
 	if (!rc)
 		out->src_refcnt++;
-	spin_unlock_irqrestore(&drvdata->spinlock, flags);
+	raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
 
 	if (first_enable)
 		dev_dbg(&csdev->dev, "REPLICATOR enabled\n");
@@ -179,14 +179,14 @@ static void replicator_disable(struct coresight_device *csdev,
 	unsigned long flags;
 	bool last_disable = false;
 
-	spin_lock_irqsave(&drvdata->spinlock, flags);
+	raw_spin_lock_irqsave(&drvdata->spinlock, flags);
 	if (--out->src_refcnt == 0) {
 		if (drvdata->base)
 			dynamic_replicator_disable(drvdata, in->dest_port,
 						   out->src_port);
 		last_disable = true;
 	}
-	spin_unlock_irqrestore(&drvdata->spinlock, flags);
+	raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
 
 	if (last_disable)
 		dev_dbg(&csdev->dev, "REPLICATOR disabled\n");
@@ -277,7 +277,7 @@ static int replicator_probe(struct device *dev, struct resource *res)
 	}
 	dev->platform_data = pdata;
 
-	spin_lock_init(&drvdata->spinlock);
+	raw_spin_lock_init(&drvdata->spinlock);
 	desc.type = CORESIGHT_DEV_TYPE_LINK;
 	desc.subtype.link_subtype = CORESIGHT_DEV_SUBTYPE_LINK_SPLIT;
 	desc.ops = &replicator_cs_ops;
-- 
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}


