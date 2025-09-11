Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECDCFCAC587
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 15:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ff/wyuZO5UIQVkCR2N2KX4E1vX6xd5TgHmsu3ejak7Q=; b=00DbDQES5Dk1InWzSAC4bDbMBx
	WMzVuHmCJ7xqff737UOZoC/Btwamo69mcgnuJwuMsT1GZFEWzbvck4uXA0w2wQz/mWqXQzdC6YbFG
	OYHDnRuJ3svE1mNEYV0Id04W6cuulH0OKd6JdJ0KfG9qP9vwVjsU1X3fBFsvq1me24QT3M3sztOkx
	M3WLSLvjZyNgTa6gIz0Nqig0Z/vEUMrh3CTkWXVe5dd8CYRVhVnPC6lk2m49h5WqylGRBiRQkEQQi
	UIEyPqhz79HpPjqpcF4iwINbVWki1fvsyql6gmvzcc/5Jz8jB7BVoYoMtPwF0Yq5eLSErjdM5KB5B
	DbMoDSiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwjIj-00000003v9b-1Qty;
	Thu, 11 Sep 2025 15:33:33 +0000
Received: from out-180.mta1.migadu.com ([2001:41d0:203:375::b4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwjIg-00000003v6a-0cSc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 15:33:32 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1757604806;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ff/wyuZO5UIQVkCR2N2KX4E1vX6xd5TgHmsu3ejak7Q=;
	b=C37DQb3OEJOJsqSu2+34RxAJXBOa8EL9L4biqD5chRL3DhDnVB9duDnfJvNl+Ip2kBMf+o
	W6h0neeBYXplrNbQuxWPsow9OirZjuPEsGMhg46k+mXfF82dQTipBWqLVlWwLWn79w8NVX
	33OYtb0xp0cVFt4l9QgolRLmDJTm8Y8=
From: Sean Anderson <sean.anderson@linux.dev>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org
Cc: Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Mike Leach <mike.leach@linaro.org>,
	Linu Cherian <lcherian@marvell.com>,
	James Clark <james.clark@linaro.org>,
	linux-kernel@vger.kernel.org,
	Sean Anderson <sean.anderson@linux.dev>
Subject: [PATCH v2] coresight: Fix possible deadlock in coresight_panic_cb
Date: Thu, 11 Sep 2025 11:33:15 -0400
Message-Id: <20250911153315.3607119-1-sean.anderson@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_083330_935664_83D49F80 
X-CRM114-Status: GOOD (  15.89  )
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

coresight_panic_cb is called with interrupts disabled during panics.
However, bus_for_each_dev calls bus_to_subsys which takes
bus_kset->list_lock without disabling IRQs. This will cause a deadlock
if a panic occurs while one of the other coresight functions that uses
bus_for_each_dev is running.

Maintain a separate list of coresight devices to access during a panic.

Fixes: 46006ceb5d02 ("coresight: core: Add provision for panic callbacks")
Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
---

Changes in v2:
- Add a comment describing csdev_lock/list
- Consolidate list removal in coresight_device_release

 drivers/hwtracing/coresight/coresight-core.c | 43 +++++++++++---------
 include/linux/coresight.h                    |  1 +
 2 files changed, 25 insertions(+), 19 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index fa758cc21827..4e28e56f2e30 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -1042,10 +1042,19 @@ static void coresight_clear_default_sink(struct coresight_device *csdev)
 	}
 }
 
+/*
+ * Dedicated list of devices for use by during panic (which may occur with
+ * interrupts disabled).
+ */
+static DEFINE_SPINLOCK(csdev_lock);
+static LIST_HEAD(csdev_list);
+
 static void coresight_device_release(struct device *dev)
 {
 	struct coresight_device *csdev = to_coresight_device(dev);
 
+	scoped_guard(spinlock_irq, &csdev_lock)
+		list_del(&csdev->csdev_list);
 	fwnode_handle_put(csdev->dev.fwnode);
 	free_percpu(csdev->perf_sink_id_map.cpu_map);
 	kfree(csdev);
@@ -1357,6 +1366,10 @@ struct coresight_device *coresight_register(struct coresight_desc *desc)
 			goto err_out;
 		}
 	}
+
+	scoped_guard(spinlock_irq, &csdev_lock)
+		list_add(&csdev->csdev_list, &csdev_list);
+
 	/*
 	 * Make sure the device registration and the connection fixup
 	 * are synchronised, so that we don't see uninitialised devices
@@ -1563,28 +1576,20 @@ const struct bus_type coresight_bustype = {
 	.name	= "coresight",
 };
 
-static int coresight_panic_sync(struct device *dev, void *data)
-{
-	int mode;
-	struct coresight_device *csdev;
-
-	/* Run through panic sync handlers for all enabled devices */
-	csdev = container_of(dev, struct coresight_device, dev);
-	mode = coresight_get_mode(csdev);
-
-	if ((mode == CS_MODE_SYSFS) || (mode == CS_MODE_PERF)) {
-		if (panic_ops(csdev))
-			panic_ops(csdev)->sync(csdev);
-	}
-
-	return 0;
-}
-
 static int coresight_panic_cb(struct notifier_block *self,
 			       unsigned long v, void *p)
 {
-	bus_for_each_dev(&coresight_bustype, NULL, NULL,
-				 coresight_panic_sync);
+	struct coresight_device *csdev;
+
+	guard(spinlock)(&csdev_lock);
+	list_for_each_entry(csdev, &csdev_list, csdev_list) {
+		/* Run through panic sync handlers for all enabled devices */
+		int mode = coresight_get_mode(csdev);
+
+		if ((mode == CS_MODE_SYSFS || mode == CS_MODE_PERF) &&
+		    panic_ops(csdev))
+			panic_ops(csdev)->sync(csdev);
+	}
 
 	return 0;
 }
diff --git a/include/linux/coresight.h b/include/linux/coresight.h
index 4ac65c68bbf4..a5e62ebd03b5 100644
--- a/include/linux/coresight.h
+++ b/include/linux/coresight.h
@@ -302,6 +302,7 @@ struct coresight_device {
 	/* system configuration and feature lists */
 	struct list_head feature_csdev_list;
 	struct list_head config_csdev_list;
+	struct list_head csdev_list;
 	raw_spinlock_t cscfg_csdev_lock;
 	void *active_cscfg_ctxt;
 };
-- 
2.35.1.1320.gc452695387.dirty


