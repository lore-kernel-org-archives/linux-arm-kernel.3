Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E730E77187
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 08:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Y2aGI0OX91gzE0bTRqmLkBDMGMP6Dec08Hvq5sw/LrY=; b=gVpY68OgNZx839McnIZuwKgV62
	8JKVrnSc9v49whEguyMt7wNqZJ6/euwZ1iaKhi2GpUunf7xYVrbglR3nI1LD3ExzPJ4TrAk1ngXSy
	Oq48relzv0wzRPfli4DdU6OMNoBu0zcPsS3SyPzJHtIw8npsrGLItI3eGKf/7iIiaHE4mz5LhYrIy
	RvYMMdrmIp4w6H3EXN7l2ed199542R+Fy4jbxM4NUkvwK5bD2b5x4QszoTxqcYtvfxHDGdoBqwNJ+
	rJG0V/iuHzsFU5SF0vWMkbrtWG+Qn+cIAhxmx9T0egKgyNuz65n+AwSHWZ+aFaFCNGtoA+He2PGWs
	9X3gIq2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNpko-0000000Fyio-0jRD;
	Wed, 18 Dec 2024 08:50:02 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNpjR-0000000FyMb-1Axp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Dec 2024 08:48:38 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B07321063;
	Wed, 18 Dec 2024 00:49:04 -0800 (PST)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3555F3F720;
	Wed, 18 Dec 2024 00:48:35 -0800 (PST)
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: suzuki.poulose@arm.com,
	mike.leach@linaro.org,
	james.clark@linaro.org,
	alexander.shishkin@linux.intel.com
Cc: coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	nd@arm.com,
	Yeoreum Yun <yeoreum.yun@arm.com>
Subject: [PATCH 1/1] coresight: prevent deactivate active config while enable the config
Date: Wed, 18 Dec 2024 08:48:33 +0000
Message-Id: <20241218084833.609876-1-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_004837_400155_2CE4820C 
X-CRM114-Status: GOOD (  16.16  )
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
(perf or sysfs enable)                        load module
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

To address this, introduce sys_enable_cnt in cscfg_mgr to prevent
deactivate while there is enabled configuration.

Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 .../hwtracing/coresight/coresight-etm4x-core.c |  3 +++
 drivers/hwtracing/coresight/coresight-syscfg.c | 18 ++++++++++++++++--
 drivers/hwtracing/coresight/coresight-syscfg.h |  2 ++
 3 files changed, 21 insertions(+), 2 deletions(-)

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
index a70c1454b410..dfa7dcbaf25d 100644
--- a/drivers/hwtracing/coresight/coresight-syscfg.c
+++ b/drivers/hwtracing/coresight/coresight-syscfg.c
@@ -953,7 +953,8 @@ int cscfg_config_sysfs_activate(struct cscfg_config_desc *config_desc, bool acti
 			cscfg_mgr->sysfs_active_config = cfg_hash;
 	} else {
 		/* disable if matching current value */
-		if (cscfg_mgr->sysfs_active_config == cfg_hash) {
+		if (cscfg_mgr->sysfs_active_config == cfg_hash &&
+		    !atomic_read(&cscfg_mgr->sys_enable_cnt)) {
 			_cscfg_deactivate_config(cfg_hash);
 			cscfg_mgr->sysfs_active_config = 0;
 		} else
@@ -1055,6 +1056,12 @@ int cscfg_csdev_enable_active_config(struct coresight_device *csdev,
 	if (!atomic_read(&cscfg_mgr->sys_active_cnt))
 		return 0;
 
+	/*
+	 * increment sys_enable_cnt first to prevent deactivate the config
+	 * while enable active config.
+	 */
+	atomic_inc(&cscfg_mgr->sys_enable_cnt);
+
 	/*
 	 * Look for matching configuration - set the active configuration
 	 * context if found.
@@ -1098,6 +1105,10 @@ int cscfg_csdev_enable_active_config(struct coresight_device *csdev,
 			raw_spin_unlock_irqrestore(&csdev->cscfg_csdev_lock, flags);
 		}
 	}
+
+	if (!config_csdev_active || err)
+		atomic_dec(&cscfg_mgr->sys_enable_cnt);
+
 	return err;
 }
 EXPORT_SYMBOL_GPL(cscfg_csdev_enable_active_config);
@@ -1129,8 +1140,10 @@ void cscfg_csdev_disable_active_config(struct coresight_device *csdev)
 	if (config_csdev) {
 		if (!config_csdev->enabled)
 			config_csdev = NULL;
-		else
+		else {
 			config_csdev->enabled = false;
+			atomic_dec(&cscfg_mgr->sys_enable_cnt);
+		}
 	}
 	csdev->active_cscfg_ctxt = NULL;
 	raw_spin_unlock_irqrestore(&csdev->cscfg_csdev_lock, flags);
@@ -1179,6 +1192,7 @@ static int cscfg_create_device(void)
 	INIT_LIST_HEAD(&cscfg_mgr->config_desc_list);
 	INIT_LIST_HEAD(&cscfg_mgr->load_order_list);
 	atomic_set(&cscfg_mgr->sys_active_cnt, 0);
+	atomic_set(&cscfg_mgr->sys_enable_cnt, 0);
 	cscfg_mgr->load_state = CSCFG_NONE;
 
 	/* setup the device */
diff --git a/drivers/hwtracing/coresight/coresight-syscfg.h b/drivers/hwtracing/coresight/coresight-syscfg.h
index 66e2db890d82..2fc397919985 100644
--- a/drivers/hwtracing/coresight/coresight-syscfg.h
+++ b/drivers/hwtracing/coresight/coresight-syscfg.h
@@ -38,6 +38,7 @@ enum cscfg_load_ops {
  * @config_desc_list:	List of system configuration descriptors to load into registered devices.
  * @load_order_list:    Ordered list of owners for dynamically loaded configurations.
  * @sys_active_cnt:	Total number of active config descriptor references.
+ * @sys_enable_cnt:	Total number of enable of active config descriptor references.
  * @cfgfs_subsys:	configfs subsystem used to manage configurations.
  * @sysfs_active_config:Active config hash used if CoreSight controlled from sysfs.
  * @sysfs_active_preset:Active preset index used if CoreSight controlled from sysfs.
@@ -50,6 +51,7 @@ struct cscfg_manager {
 	struct list_head config_desc_list;
 	struct list_head load_order_list;
 	atomic_t sys_active_cnt;
+	atomic_t sys_enable_cnt;
 	struct configfs_subsystem cfgfs_subsys;
 	u32 sysfs_active_config;
 	int sysfs_active_preset;
-- 
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}


