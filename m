Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E836E77199
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 17:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6JzPvA0H/89i5/gahmYu9BPklNwzNVxS1154LbM6jMk=; b=rG3eZ6FD+kdPA3ltj+CezGvS0m
	bWP7+jtxy36JNXMukIVHouV4PXxcRTRYH9AOBQCL0WoKIDJyfyz1PRXuRa66QFZr5Zdl7luOfa44y
	YkGg8yJldptF+pTCQCQxM5B7E+6jCtQ0/jZ0ISxEX75LZbD6qdZcyxuCdGTPM1RPeop9qLHgheheW
	kotXFGd9x9ZVxDZLPAJ+zCfzVidI3PHFZyn254n/B+eJiti3j50afsUqVVxeXL3gwENaYaKhbD2+S
	0tgDg4+vM77SVbvNB1WBgaQme9jv14r6qSVWK5+ATwPqeUwwWmjFwloBGTn06XP4mZxAkHuUTYblv
	3Q9aFoLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVwDg-0000000CpMN-3fjW;
	Thu, 09 Jan 2025 17:21:20 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVwCS-0000000Cp74-2Hg3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jan 2025 17:20:06 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B496A13D5;
	Thu,  9 Jan 2025 09:20:29 -0800 (PST)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 044DB3F673;
	Thu,  9 Jan 2025 09:19:59 -0800 (PST)
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: suzuki.poulose@arm.com,
	mike.leach@linaro.org,
	james.clark@linaro.org,
	alexander.shishkin@linux.intel.com
Cc: coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yeoreum Yun <yeoreum.yun@arm.com>
Subject: [PATCH v3 1/1] coresight: prevent deactivate active config while enabling the config
Date: Thu,  9 Jan 2025 17:19:56 +0000
Message-Id: <20250109171956.3535294-1-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_092004_675048_BDD7FDE4 
X-CRM114-Status: GOOD (  19.50  )
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

While enable active config via cscfg_csdev_enable_active_config(),
active config could be deactivated via configfs' sysfs interface.
This could make UAF issue in below scenario:

CPU0                                          CPU1
(sysfs enable)                                load module
                                              cscfg_load_config_sets()
                                              activate config. // sysfs
                                              (sys_active_cnt == 1)
...
cscfg_csdev_enable_active_config()
  lock(csdev->cscfg_csdev_lock)
  // here load config activate by CPU1
  unlock(csdev->cscfg_csdev_lock)

                                              deactivate config // sysfs
                                              (sys_activec_cnt == 0)
                                              cscfg_unload_config_sets()
                                              unload module

  // access to config_desc which freed
  // while unloading module.
  cfs_csdev_enable_config

To address this, use cscfg_config_desc's active_cnt as a reference count
which will be holded when
    - activate the config.
    - enable the activated config.
and put the module reference when config_active_cnt == 0.

Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
from v2 to v3:
    - add cscfg_config_desc_get()/put() (from Suzuki).
    - remove sys_enable_cnt.

from v1 to v2:
    - modify commit message.
---
 .../hwtracing/coresight/coresight-config.h    |  2 +-
 .../coresight/coresight-etm4x-core.c          |  3 +
 .../hwtracing/coresight/coresight-syscfg.c    | 55 ++++++++++++++-----
 3 files changed, 44 insertions(+), 16 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-config.h b/drivers/hwtracing/coresight/coresight-config.h
index b9ebc9fcfb7f..90fd937d3bd8 100644
--- a/drivers/hwtracing/coresight/coresight-config.h
+++ b/drivers/hwtracing/coresight/coresight-config.h
@@ -228,7 +228,7 @@ struct cscfg_feature_csdev {
  * @feats_csdev:references to the device features to enable.
  */
 struct cscfg_config_csdev {
-	const struct cscfg_config_desc *config_desc;
+	struct cscfg_config_desc *config_desc;
 	struct coresight_device *csdev;
 	bool enabled;
 	struct list_head node;
diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index 86893115df17..6218ef40acbc 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -986,6 +986,9 @@ static void etm4_disable_sysfs(struct coresight_device *csdev)
 	smp_call_function_single(drvdata->cpu, etm4_disable_hw, drvdata, 1);

 	raw_spin_unlock(&drvdata->spinlock);
+
+	cscfg_csdev_disable_active_config(csdev);
+
 	cpus_read_unlock();

 	/*
diff --git a/drivers/hwtracing/coresight/coresight-syscfg.c b/drivers/hwtracing/coresight/coresight-syscfg.c
index a70c1454b410..8766f72db33e 100644
--- a/drivers/hwtracing/coresight/coresight-syscfg.c
+++ b/drivers/hwtracing/coresight/coresight-syscfg.c
@@ -391,14 +391,17 @@ static void cscfg_owner_put(struct cscfg_load_owner_info *owner_info)
 static void cscfg_remove_owned_csdev_configs(struct coresight_device *csdev, void *load_owner)
 {
 	struct cscfg_config_csdev *config_csdev, *tmp;
+	unsigned long flags;

 	if (list_empty(&csdev->config_csdev_list))
 		return;

+	raw_spin_lock_irqsave(&csdev->cscfg_csdev_lock, flags);
 	list_for_each_entry_safe(config_csdev, tmp, &csdev->config_csdev_list, node) {
 		if (config_csdev->config_desc->load_owner == load_owner)
 			list_del(&config_csdev->node);
 	}
+	raw_spin_unlock_irqrestore(&csdev->cscfg_csdev_lock, flags);
 }

 static void cscfg_remove_owned_csdev_features(struct coresight_device *csdev, void *load_owner)
@@ -867,6 +870,28 @@ void cscfg_csdev_reset_feats(struct coresight_device *csdev)
 }
 EXPORT_SYMBOL_GPL(cscfg_csdev_reset_feats);

+static bool cscfg_config_desc_get(struct cscfg_config_desc *config_desc, bool enable)
+{
+	if (enable)
+		return atomic_inc_not_zero(&config_desc->active_cnt);
+
+	/* when activate config */
+
+	/* must ensure that config cannot be unloaded in use */
+	if (cscfg_owner_get(config_desc->load_owner))
+		return false;
+
+	atomic_inc(&config_desc->active_cnt);
+
+	return true;
+}
+
+static void cscfg_config_desc_put(struct cscfg_config_desc *config_desc)
+{
+	if (!atomic_dec_return(&config_desc->active_cnt))
+		cscfg_owner_put(config_desc->load_owner);
+}
+
 /*
  * This activate configuration for either perf or sysfs. Perf can have multiple
  * active configs, selected per event, sysfs is limited to one.
@@ -890,22 +915,17 @@ static int _cscfg_activate_config(unsigned long cfg_hash)
 			if (config_desc->available == false)
 				return -EBUSY;

-			/* must ensure that config cannot be unloaded in use */
-			err = cscfg_owner_get(config_desc->load_owner);
-			if (err)
+			if (!cscfg_config_desc_get(config_desc, false)) {
+				err = -EINVAL;
 				break;
+			}
+
 			/*
 			 * increment the global active count - control changes to
 			 * active configurations
 			 */
 			atomic_inc(&cscfg_mgr->sys_active_cnt);

-			/*
-			 * mark the descriptor as active so enable config on a
-			 * device instance will use it
-			 */
-			atomic_inc(&config_desc->active_cnt);
-
 			err = 0;
 			dev_dbg(cscfg_device(), "Activate config %s.\n", config_desc->name);
 			break;
@@ -920,9 +940,8 @@ static void _cscfg_deactivate_config(unsigned long cfg_hash)

 	list_for_each_entry(config_desc, &cscfg_mgr->config_desc_list, item) {
 		if ((unsigned long)config_desc->event_ea->var == cfg_hash) {
-			atomic_dec(&config_desc->active_cnt);
 			atomic_dec(&cscfg_mgr->sys_active_cnt);
-			cscfg_owner_put(config_desc->load_owner);
+			cscfg_config_desc_put(config_desc);
 			dev_dbg(cscfg_device(), "Deactivate config %s.\n", config_desc->name);
 			break;
 		}
@@ -1047,7 +1066,7 @@ int cscfg_csdev_enable_active_config(struct coresight_device *csdev,
 				     unsigned long cfg_hash, int preset)
 {
 	struct cscfg_config_csdev *config_csdev_active = NULL, *config_csdev_item;
-	const struct cscfg_config_desc *config_desc;
+	struct cscfg_config_desc *config_desc;
 	unsigned long flags;
 	int err = 0;

@@ -1062,8 +1081,8 @@ int cscfg_csdev_enable_active_config(struct coresight_device *csdev,
 	raw_spin_lock_irqsave(&csdev->cscfg_csdev_lock, flags);
 	list_for_each_entry(config_csdev_item, &csdev->config_csdev_list, node) {
 		config_desc = config_csdev_item->config_desc;
-		if ((atomic_read(&config_desc->active_cnt)) &&
-		    ((unsigned long)config_desc->event_ea->var == cfg_hash)) {
+		if (((unsigned long)config_desc->event_ea->var == cfg_hash) &&
+				cscfg_config_desc_get(config_desc, true)) {
 			config_csdev_active = config_csdev_item;
 			csdev->active_cscfg_ctxt = (void *)config_csdev_active;
 			break;
@@ -1097,7 +1116,11 @@ int cscfg_csdev_enable_active_config(struct coresight_device *csdev,
 				err = -EBUSY;
 			raw_spin_unlock_irqrestore(&csdev->cscfg_csdev_lock, flags);
 		}
+
+		if (err)
+			cscfg_config_desc_put(config_desc);
 	}
+
 	return err;
 }
 EXPORT_SYMBOL_GPL(cscfg_csdev_enable_active_config);
@@ -1136,8 +1159,10 @@ void cscfg_csdev_disable_active_config(struct coresight_device *csdev)
 	raw_spin_unlock_irqrestore(&csdev->cscfg_csdev_lock, flags);

 	/* true if there was an enabled active config */
-	if (config_csdev)
+	if (config_csdev) {
 		cscfg_csdev_disable_config(config_csdev);
+		cscfg_config_desc_put(config_csdev->config_desc);
+	}
 }
 EXPORT_SYMBOL_GPL(cscfg_csdev_disable_active_config);

--
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}


