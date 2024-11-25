Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD406D3B7FC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Nov 2024 10:17:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=59I0/vHTvZdRA/FMZFvzsAbUnl48zuqRPemMMUg6j8U=; b=WxvvqgQdoJ6auWBtcW8TpFtIS2
	vZgtkyXaCHww4RKhuCwvo+HNSKgziY1Dj4po2myxvzQgEzumpdd/WXBy4XAPadRYBWasH2g7mjhLm
	0naHaLNsYtAgA9ZVg9iFAgdfIc6Ysop31tbte2X7yCrEyu5dSDcnrAGQw1r3OYTDmYwIugbyS2Tda
	XEE+SsA1JMPaK56S53RxzYCdnaSB+mHIdls9vBepO/nlvmqj0XGNYmcesE4vG61MUbTmj67B0ESpq
	oPHRYWsLuxXGteiMu63XS0HR6man97pL41wpJlfk4T+vRdmpmdm9xqwguvc2ghjUE0yZHSpQfq3Kz
	2bCiZE5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFW9y-00000007hsg-04jg;
	Mon, 25 Nov 2024 10:17:38 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFVhs-00000007dnH-2cUQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Nov 2024 09:48:37 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 470A01FC7;
	Mon, 25 Nov 2024 01:49:06 -0800 (PST)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 138D73F66E;
	Mon, 25 Nov 2024 01:48:33 -0800 (PST)
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
Subject: [PATCH 6/9] coresight-funnel: change funnel_drvdata spinlock's type to raw_spinlock_t
Date: Mon, 25 Nov 2024 09:48:13 +0000
Message-Id: <20241125094816.365472-7-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241125094816.365472-1-yeoreum.yun@arm.com>
References: <20241125094816.365472-1-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_014836_750467_FC20A3D7 
X-CRM114-Status: GOOD (  13.54  )
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

In coresight-funnel drivers, cti_drvdata->spinlock can be held
during __schedule() by perf_event_task_sched_out()/in().

Since funnel_drvdata->spinlock type is spinlock_t and
perf_event_task_sched_out()/in() is called after acquiring rq_lock,
which is raw_spinlock_t (an unsleepable lock),
this poses an issue in PREEMPT_RT kernel where spinlock_t is sleepable.

To address this, change type funnel_drvdata->spinlock in
coresight-funnel drivers, which can be called by
perf_event_task_sched_out()/in(), from spinlock_t to raw_spinlock_t.

Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 .../hwtracing/coresight/coresight-funnel.c    | 34 +++++++++----------
 1 file changed, 16 insertions(+), 18 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-funnel.c b/drivers/hwtracing/coresight/coresight-funnel.c
index 5a819c8970fb..dbc2891a10e1 100644
--- a/drivers/hwtracing/coresight/coresight-funnel.c
+++ b/drivers/hwtracing/coresight/coresight-funnel.c
@@ -47,7 +47,7 @@ struct funnel_drvdata {
 	struct clk		*pclk;
 	struct coresight_device	*csdev;
 	unsigned long		priority;
-	spinlock_t		spinlock;
+	raw_spinlock_t		spinlock;
 };
 
 static int dynamic_funnel_enable_hw(struct funnel_drvdata *drvdata, int port)
@@ -82,19 +82,18 @@ static int funnel_enable(struct coresight_device *csdev,
 {
 	int rc = 0;
 	struct funnel_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
-	unsigned long flags;
 	bool first_enable = false;
 
-	spin_lock_irqsave(&drvdata->spinlock, flags);
-	if (atomic_read(&in->dest_refcnt) == 0) {
-		if (drvdata->base)
-			rc = dynamic_funnel_enable_hw(drvdata, in->dest_port);
+	scoped_guard(raw_spinlock_irqsave, &drvdata->spinlock) {
+		if (atomic_read(&in->dest_refcnt) == 0) {
+			if (drvdata->base)
+				rc = dynamic_funnel_enable_hw(drvdata, in->dest_port);
+			if (!rc)
+				first_enable = true;
+		}
 		if (!rc)
-			first_enable = true;
+			atomic_inc(&in->dest_refcnt);
 	}
-	if (!rc)
-		atomic_inc(&in->dest_refcnt);
-	spin_unlock_irqrestore(&drvdata->spinlock, flags);
 
 	if (first_enable)
 		dev_dbg(&csdev->dev, "FUNNEL inport %d enabled\n",
@@ -126,16 +125,15 @@ static void funnel_disable(struct coresight_device *csdev,
 			   struct coresight_connection *out)
 {
 	struct funnel_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
-	unsigned long flags;
 	bool last_disable = false;
 
-	spin_lock_irqsave(&drvdata->spinlock, flags);
-	if (atomic_dec_return(&in->dest_refcnt) == 0) {
-		if (drvdata->base)
-			dynamic_funnel_disable_hw(drvdata, in->dest_port);
-		last_disable = true;
+	scoped_guard(raw_spinlock_irqsave, &drvdata->spinlock) {
+		if (atomic_dec_return(&in->dest_refcnt) == 0) {
+			if (drvdata->base)
+				dynamic_funnel_disable_hw(drvdata, in->dest_port);
+			last_disable = true;
+		}
 	}
-	spin_unlock_irqrestore(&drvdata->spinlock, flags);
 
 	if (last_disable)
 		dev_dbg(&csdev->dev, "FUNNEL inport %d disabled\n",
@@ -266,7 +264,7 @@ static int funnel_probe(struct device *dev, struct resource *res)
 	}
 	dev->platform_data = pdata;
 
-	spin_lock_init(&drvdata->spinlock);
+	raw_spin_lock_init(&drvdata->spinlock);
 	desc.type = CORESIGHT_DEV_TYPE_LINK;
 	desc.subtype.link_subtype = CORESIGHT_DEV_SUBTYPE_LINK_MERG;
 	desc.ops = &funnel_cs_ops;
-- 
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}


