Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89B0DF30928
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 10:18:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5Efh0Azw6Mq2yfGwQjfPfY8bZcJbkqV8xbWIEo1KZrg=; b=d9ofonMkxs7tcJgImBDUewJ6FJ
	L9QcsmF9hJIRp3QgW8V2mW7PNEfDPMOMUZfvfEQuy9XIsYaFfIRKG2EXKEuP1cVxTbcNPKzQU2RG5
	QUdBFOSbf2dflYMdHexuWhdwaKMWdpx4RPtHyp1vtqPyLlCeSFBzh/nQf3jxqlgt8i8TV/iqwgITV
	qnPpr2iHvmIJSIKCQXoCajjtAqduEWnwe+mqMyOT0N48I8bBmbnJFwHX54axjTiBpQYYUaFE3Lgc/
	unQSoo+de1RYcjF7otk1PtMHWnODRPck6CabI0G9vUry+4twpLaQXMtcHja5oJgsydhpAII1O7k30
	JWtjeclQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy5mP-00000001Xsj-16rO;
	Thu, 05 Mar 2026 10:18:05 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy5mN-00000001XpP-0Sh2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 10:18:04 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 55632339;
	Thu,  5 Mar 2026 02:17:55 -0800 (PST)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B6DE13F694;
	Thu,  5 Mar 2026 02:17:59 -0800 (PST)
From: Leo Yan <leo.yan@arm.com>
Date: Thu, 05 Mar 2026 10:17:38 +0000
Subject: [PATCH v6 07/19] coresight: syscfg: Use spinlock to protect active
 variables
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-arm_coresight_path_power_management_improvement-v6-7-eff765d211a9@arm.com>
References: <20260305-arm_coresight_path_power_management_improvement-v6-0-eff765d211a9@arm.com>
In-Reply-To: <20260305-arm_coresight_path_power_management_improvement-v6-0-eff765d211a9@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>, 
 Yeoreum Yun <yeoreum.yun@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
 Will Deacon <will@kernel.org>, Yabin Cui <yabinc@google.com>, 
 Keita Morisaki <keyz@google.com>, 
 Yuanfang Zhang <quic_yuanfang@quicinc.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772705864; l=4063;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=kGNnWcHgiXMa4UoW24yv2GYhFrwqXNWHoI3WmaiTf3c=;
 b=caDj9DzB/aX/vhRok1XAIX/WSA6SWLTzQcKf5jlmzEXO9Anaiep7U5Mtvy+KfeFoshrEij7GV
 UmkjPLeSk4eC81zAvSHq031iIAgmDMH+OE6HTETLyT6QYkseT0stQNF
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_021803_252672_191D1824 
X-CRM114-Status: GOOD (  16.68  )
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

To support dynamically enabling and disabling the CoreSight path during
CPU idle, cscfg_config_sysfs_get_active_cfg() may be called by the ETM
driver in an atomic context. However, the function currently acquires a
mutex, which is a sleepable lock, and this is not allowed in atomic
context.

To make cscfg_config_sysfs_get_active_cfg() called in the idle flow,
replace the mutex with a raw spinlock to protect the active
variables.

Reviewed-by: James Clark <james.clark@linaro.org>
Tested-by: James Clark <james.clark@linaro.org>
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-syscfg.c | 22 +++++++++++++---------
 drivers/hwtracing/coresight/coresight-syscfg.h |  2 ++
 2 files changed, 15 insertions(+), 9 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-syscfg.c b/drivers/hwtracing/coresight/coresight-syscfg.c
index d7f5037953d6ba7fb7f83a8012a1abc5ffd0a147..8d3992753f69cc8108725b566e0ec8380c78625a 100644
--- a/drivers/hwtracing/coresight/coresight-syscfg.c
+++ b/drivers/hwtracing/coresight/coresight-syscfg.c
@@ -957,15 +957,19 @@ int cscfg_config_sysfs_activate(struct cscfg_config_desc *config_desc, bool acti
 
 	cfg_hash = (unsigned long)config_desc->event_ea->var;
 
+	raw_spin_lock(&cscfg_mgr->spinlock);
+
 	if (activate) {
+
 		/* cannot be a current active value to activate this */
 		if (cscfg_mgr->sysfs_active_config) {
 			err = -EBUSY;
-			goto exit_unlock;
+		} else {
+			err = _cscfg_activate_config(cfg_hash);
+			if (!err)
+				cscfg_mgr->sysfs_active_config = cfg_hash;
 		}
-		err = _cscfg_activate_config(cfg_hash);
-		if (!err)
-			cscfg_mgr->sysfs_active_config = cfg_hash;
+
 	} else {
 		/* disable if matching current value */
 		if (cscfg_mgr->sysfs_active_config == cfg_hash) {
@@ -975,7 +979,8 @@ int cscfg_config_sysfs_activate(struct cscfg_config_desc *config_desc, bool acti
 			err = -EINVAL;
 	}
 
-exit_unlock:
+	raw_spin_unlock(&cscfg_mgr->spinlock);
+
 	mutex_unlock(&cscfg_mutex);
 	return err;
 }
@@ -983,9 +988,8 @@ int cscfg_config_sysfs_activate(struct cscfg_config_desc *config_desc, bool acti
 /* set the sysfs preset value */
 void cscfg_config_sysfs_set_preset(int preset)
 {
-	mutex_lock(&cscfg_mutex);
+	guard(raw_spinlock)(&cscfg_mgr->spinlock);
 	cscfg_mgr->sysfs_active_preset = preset;
-	mutex_unlock(&cscfg_mutex);
 }
 
 /*
@@ -994,10 +998,9 @@ void cscfg_config_sysfs_set_preset(int preset)
  */
 void cscfg_config_sysfs_get_active_cfg(unsigned long *cfg_hash, int *preset)
 {
-	mutex_lock(&cscfg_mutex);
+	guard(raw_spinlock)(&cscfg_mgr->spinlock);
 	*preset = cscfg_mgr->sysfs_active_preset;
 	*cfg_hash = cscfg_mgr->sysfs_active_config;
-	mutex_unlock(&cscfg_mutex);
 }
 EXPORT_SYMBOL_GPL(cscfg_config_sysfs_get_active_cfg);
 
@@ -1201,6 +1204,7 @@ static int cscfg_create_device(void)
 	INIT_LIST_HEAD(&cscfg_mgr->load_order_list);
 	atomic_set(&cscfg_mgr->sys_active_cnt, 0);
 	cscfg_mgr->load_state = CSCFG_NONE;
+	raw_spin_lock_init(&cscfg_mgr->spinlock);
 
 	/* setup the device */
 	dev = cscfg_device();
diff --git a/drivers/hwtracing/coresight/coresight-syscfg.h b/drivers/hwtracing/coresight/coresight-syscfg.h
index 66e2db890d8203853a0c3c907b48aa66dd8014e6..f52aba4608dadc1c7666e0e28c9b43dc1c33d1eb 100644
--- a/drivers/hwtracing/coresight/coresight-syscfg.h
+++ b/drivers/hwtracing/coresight/coresight-syscfg.h
@@ -42,6 +42,7 @@ enum cscfg_load_ops {
  * @sysfs_active_config:Active config hash used if CoreSight controlled from sysfs.
  * @sysfs_active_preset:Active preset index used if CoreSight controlled from sysfs.
  * @load_state:		A multi-stage load/unload operation is in progress.
+ * @spinlock:		Exclusive access sysfs_active_* variables.
  */
 struct cscfg_manager {
 	struct device dev;
@@ -54,6 +55,7 @@ struct cscfg_manager {
 	u32 sysfs_active_config;
 	int sysfs_active_preset;
 	enum cscfg_load_ops load_state;
+	raw_spinlock_t spinlock;
 };
 
 /* get reference to dev in cscfg_manager */

-- 
2.34.1


