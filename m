Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 598BBE7718B
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Dec 2024 17:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5XQIe8BfN2MFHT5QdaU7R5vbkT7+t9yOtNslc2hlrPs=; b=EVM6YLVHuWN7+/6/EQKVihJdoP
	aafIOIoWWNp1kaSjOobCK3SKfpoQ91CfW7Jgw0em863okKLcckMffyhi/TbfsO9G9kJPyWywC5/4Y
	oLmd8aRqqCqFw/2zQ6mkxdK6ntg29vaB9/+SCrka8SN+noaKYYil1eA9AZQ4em6I2TilpTU0XKY+s
	OlgE/zsHaPOnhfDs9vge8N8RpVsZ7AnyLQfMJ9FKaaiAL0KfFgUl/1ro0J4aEuW8sDZVAZSHZYJ4n
	1v0tY5tlUQSycYpLuNNlukbxvoCVHpdWTN7E5SOcAOypik/fw5aLbFxOArsuTomxx67GHZnjSpGXG
	84ps1Geg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tP2vG-00000007DML-3f1G;
	Sat, 21 Dec 2024 17:05:50 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tP2pK-00000007Ch4-3c4i
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Dec 2024 16:59:55 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 33A981A25;
	Sat, 21 Dec 2024 09:00:10 -0800 (PST)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D15FB3F528;
	Sat, 21 Dec 2024 08:59:40 -0800 (PST)
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: suzuki.poulose@arm.com,
	mike.leach@linaro.org,
	james.clark@linaro.org,
	alexander.shishkin@linux.intel.com
Cc: coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yeoreum Yun <yeoreum.yun@arm.com>
Subject: [PATCH 3/4] coresight/etm3x: disallow altering config via sysfs while enabled
Date: Sat, 21 Dec 2024 16:59:33 +0000
Message-Id: <20241221165934.1161856-4-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241221165934.1161856-1-yeoreum.yun@arm.com>
References: <20241221165934.1161856-1-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241221_085942_990746_E477AC3A 
X-CRM114-Status: UNSURE (   9.58  )
X-CRM114-Notice: Please train this message.
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

When etm3x configuration is modified via sysfs while etm3x is being
enabled via perf, enabled etm3x could run with different configuration
from perf_event.

To address this, disallow altering config via sysfs while csdev is enabled.

Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 .../coresight/coresight-etm3x-sysfs.c         | 120 ++++++++++++++++++
 1 file changed, 120 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c b/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c
index 68c644be9813..b3ae9aba7490 100644
--- a/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c
+++ b/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c
@@ -75,6 +75,9 @@ static ssize_t reset_store(struct device *dev,
 	if (ret)
 		return ret;
 
+	if (coresight_get_mode(drvdata->csdev))
+		return -EBUSY;
+
 	if (val) {
 		spin_lock(&drvdata->spinlock);
 		memset(config, 0, sizeof(struct etm_config));
@@ -117,6 +120,9 @@ static ssize_t mode_store(struct device *dev,
 	if (ret)
 		return ret;
 
+	if (coresight_get_mode(drvdata->csdev))
+		return -EBUSY;
+
 	spin_lock(&drvdata->spinlock);
 	config->mode = val & ETM_MODE_ALL;
 
@@ -202,7 +208,12 @@ static ssize_t trigger_event_store(struct device *dev,
 	if (ret)
 		return ret;
 
+	if (coresight_get_mode(drvdata->csdev))
+		return -EBUSY;
+
+	spin_lock(&drvdata->spinlock);
 	config->trigger_event = val & ETM_EVENT_MASK;
+	spin_unlock(&drvdata->spinlock);
 
 	return size;
 }
@@ -232,7 +243,12 @@ static ssize_t enable_event_store(struct device *dev,
 	if (ret)
 		return ret;
 
+	if (coresight_get_mode(drvdata->csdev))
+		return -EBUSY;
+
+	spin_lock(&drvdata->spinlock);
 	config->enable_event = val & ETM_EVENT_MASK;
+	spin_unlock(&drvdata->spinlock);
 
 	return size;
 }
@@ -262,7 +278,12 @@ static ssize_t fifofull_level_store(struct device *dev,
 	if (ret)
 		return ret;
 
+	if (coresight_get_mode(drvdata->csdev))
+		return -EBUSY;
+
+	spin_lock(&drvdata->spinlock);
 	config->fifofull_level = val;
+	spin_unlock(&drvdata->spinlock);
 
 	return size;
 }
@@ -295,6 +316,9 @@ static ssize_t addr_idx_store(struct device *dev,
 	if (val >= drvdata->nr_addr_cmp)
 		return -EINVAL;
 
+	if (coresight_get_mode(drvdata->csdev))
+		return -EBUSY;
+
 	/*
 	 * Use spinlock to ensure index doesn't change while it gets
 	 * dereferenced multiple times within a spinlock block elsewhere.
@@ -343,6 +367,9 @@ static ssize_t addr_single_store(struct device *dev,
 	if (ret)
 		return ret;
 
+	if (coresight_get_mode(drvdata->csdev))
+		return -EBUSY;
+
 	spin_lock(&drvdata->spinlock);
 	idx = config->addr_idx;
 	if (!(config->addr_type[idx] == ETM_ADDR_TYPE_NONE ||
@@ -403,6 +430,9 @@ static ssize_t addr_range_store(struct device *dev,
 	if (val1 > val2)
 		return -EINVAL;
 
+	if (coresight_get_mode(drvdata->csdev))
+		return -EBUSY;
+
 	spin_lock(&drvdata->spinlock);
 	idx = config->addr_idx;
 	if (idx % 2 != 0) {
@@ -464,6 +494,9 @@ static ssize_t addr_start_store(struct device *dev,
 	if (ret)
 		return ret;
 
+	if (coresight_get_mode(drvdata->csdev))
+		return -EBUSY;
+
 	spin_lock(&drvdata->spinlock);
 	idx = config->addr_idx;
 	if (!(config->addr_type[idx] == ETM_ADDR_TYPE_NONE ||
@@ -518,6 +551,9 @@ static ssize_t addr_stop_store(struct device *dev,
 	if (ret)
 		return ret;
 
+	if (coresight_get_mode(drvdata->csdev))
+		return -EBUSY;
+
 	spin_lock(&drvdata->spinlock);
 	idx = config->addr_idx;
 	if (!(config->addr_type[idx] == ETM_ADDR_TYPE_NONE ||
@@ -563,6 +599,9 @@ static ssize_t addr_acctype_store(struct device *dev,
 	if (ret)
 		return ret;
 
+	if (coresight_get_mode(drvdata->csdev))
+		return -EBUSY;
+
 	spin_lock(&drvdata->spinlock);
 	config->addr_acctype[config->addr_idx] = val;
 	spin_unlock(&drvdata->spinlock);
@@ -597,6 +636,10 @@ static ssize_t cntr_idx_store(struct device *dev,
 
 	if (val >= drvdata->nr_cntr)
 		return -EINVAL;
+
+	if (coresight_get_mode(drvdata->csdev))
+		return -EBUSY;
+
 	/*
 	 * Use spinlock to ensure index doesn't change while it gets
 	 * dereferenced multiple times within a spinlock block elsewhere.
@@ -636,6 +679,9 @@ static ssize_t cntr_rld_val_store(struct device *dev,
 	if (ret)
 		return ret;
 
+	if (coresight_get_mode(drvdata->csdev))
+		return -EBUSY;
+
 	spin_lock(&drvdata->spinlock);
 	config->cntr_rld_val[config->cntr_idx] = val;
 	spin_unlock(&drvdata->spinlock);
@@ -671,6 +717,9 @@ static ssize_t cntr_event_store(struct device *dev,
 	if (ret)
 		return ret;
 
+	if (coresight_get_mode(drvdata->csdev))
+		return -EBUSY;
+
 	spin_lock(&drvdata->spinlock);
 	config->cntr_event[config->cntr_idx] = val & ETM_EVENT_MASK;
 	spin_unlock(&drvdata->spinlock);
@@ -706,6 +755,9 @@ static ssize_t cntr_rld_event_store(struct device *dev,
 	if (ret)
 		return ret;
 
+	if (coresight_get_mode(drvdata->csdev))
+		return -EBUSY;
+
 	spin_lock(&drvdata->spinlock);
 	config->cntr_rld_event[config->cntr_idx] = val & ETM_EVENT_MASK;
 	spin_unlock(&drvdata->spinlock);
@@ -752,6 +804,9 @@ static ssize_t cntr_val_store(struct device *dev,
 	if (ret)
 		return ret;
 
+	if (coresight_get_mode(drvdata->csdev))
+		return -EBUSY;
+
 	spin_lock(&drvdata->spinlock);
 	config->cntr_val[config->cntr_idx] = val;
 	spin_unlock(&drvdata->spinlock);
@@ -784,7 +839,13 @@ static ssize_t seq_12_event_store(struct device *dev,
 	if (ret)
 		return ret;
 
+	if (coresight_get_mode(drvdata->csdev))
+		return -EBUSY;
+
+	spin_lock(&drvdata->spinlock);
 	config->seq_12_event = val & ETM_EVENT_MASK;
+	spin_unlock(&drvdata->spinlock);
+
 	return size;
 }
 static DEVICE_ATTR_RW(seq_12_event);
@@ -813,7 +874,13 @@ static ssize_t seq_21_event_store(struct device *dev,
 	if (ret)
 		return ret;
 
+	if (coresight_get_mode(drvdata->csdev))
+		return -EBUSY;
+
+	spin_lock(&drvdata->spinlock);
 	config->seq_21_event = val & ETM_EVENT_MASK;
+	spin_unlock(&drvdata->spinlock);
+
 	return size;
 }
 static DEVICE_ATTR_RW(seq_21_event);
@@ -842,7 +909,13 @@ static ssize_t seq_23_event_store(struct device *dev,
 	if (ret)
 		return ret;
 
+	if (coresight_get_mode(drvdata->csdev))
+		return -EBUSY;
+
+	spin_lock(&drvdata->spinlock);
 	config->seq_23_event = val & ETM_EVENT_MASK;
+	spin_unlock(&drvdata->spinlock);
+
 	return size;
 }
 static DEVICE_ATTR_RW(seq_23_event);
@@ -871,7 +944,13 @@ static ssize_t seq_31_event_store(struct device *dev,
 	if (ret)
 		return ret;
 
+	if (coresight_get_mode(drvdata->csdev))
+		return -EBUSY;
+
+	spin_lock(&drvdata->spinlock);
 	config->seq_31_event = val & ETM_EVENT_MASK;
+	spin_unlock(&drvdata->spinlock);
+
 	return size;
 }
 static DEVICE_ATTR_RW(seq_31_event);
@@ -900,7 +979,13 @@ static ssize_t seq_32_event_store(struct device *dev,
 	if (ret)
 		return ret;
 
+	if (coresight_get_mode(drvdata->csdev))
+		return -EBUSY;
+
+	spin_lock(&drvdata->spinlock);
 	config->seq_32_event = val & ETM_EVENT_MASK;
+	spin_unlock(&drvdata->spinlock);
+
 	return size;
 }
 static DEVICE_ATTR_RW(seq_32_event);
@@ -929,7 +1014,13 @@ static ssize_t seq_13_event_store(struct device *dev,
 	if (ret)
 		return ret;
 
+	if (coresight_get_mode(drvdata->csdev))
+		return -EBUSY;
+
+	spin_lock(&drvdata->spinlock);
 	config->seq_13_event = val & ETM_EVENT_MASK;
+	spin_unlock(&drvdata->spinlock);
+
 	return size;
 }
 static DEVICE_ATTR_RW(seq_13_event);
@@ -975,7 +1066,12 @@ static ssize_t seq_curr_state_store(struct device *dev,
 	if (val > ETM_SEQ_STATE_MAX_VAL)
 		return -EINVAL;
 
+	if (coresight_get_mode(drvdata->csdev))
+		return -EBUSY;
+
+	spin_lock(&drvdata->spinlock);
 	config->seq_curr_state = val;
+	spin_unlock(&drvdata->spinlock);
 
 	return size;
 }
@@ -1008,6 +1104,9 @@ static ssize_t ctxid_idx_store(struct device *dev,
 	if (val >= drvdata->nr_ctxid_cmp)
 		return -EINVAL;
 
+	if (coresight_get_mode(drvdata->csdev))
+		return -EBUSY;
+
 	/*
 	 * Use spinlock to ensure index doesn't change while it gets
 	 * dereferenced multiple times within a spinlock block elsewhere.
@@ -1066,6 +1165,9 @@ static ssize_t ctxid_pid_store(struct device *dev,
 	if (ret)
 		return ret;
 
+	if (coresight_get_mode(drvdata->csdev))
+		return -EBUSY;
+
 	spin_lock(&drvdata->spinlock);
 	config->ctxid_pid[config->ctxid_idx] = pid;
 	spin_unlock(&drvdata->spinlock);
@@ -1112,7 +1214,13 @@ static ssize_t ctxid_mask_store(struct device *dev,
 	if (ret)
 		return ret;
 
+	if (coresight_get_mode(drvdata->csdev))
+		return -EBUSY;
+
+	spin_lock(&drvdata->spinlock);
 	config->ctxid_mask = val;
+	spin_unlock(&drvdata->spinlock);
+
 	return size;
 }
 static DEVICE_ATTR_RW(ctxid_mask);
@@ -1141,7 +1249,13 @@ static ssize_t sync_freq_store(struct device *dev,
 	if (ret)
 		return ret;
 
+	if (coresight_get_mode(drvdata->csdev))
+		return -EBUSY;
+
+	spin_lock(&drvdata->spinlock);
 	config->sync_freq = val & ETM_SYNC_MASK;
+	spin_unlock(&drvdata->spinlock);
+
 	return size;
 }
 static DEVICE_ATTR_RW(sync_freq);
@@ -1170,7 +1284,13 @@ static ssize_t timestamp_event_store(struct device *dev,
 	if (ret)
 		return ret;
 
+	if (coresight_get_mode(drvdata->csdev))
+		return -EBUSY;
+
+	spin_lock(&drvdata->spinlock);
 	config->timestamp_event = val & ETM_EVENT_MASK;
+	spin_unlock(&drvdata->spinlock);
+
 	return size;
 }
 static DEVICE_ATTR_RW(timestamp_event);
-- 
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}


