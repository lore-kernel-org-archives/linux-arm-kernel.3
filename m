Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23636CD37B5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 11:12:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NG7jRPHoBNuuIjchU93mJsdpGwfuuwgKyMQfI5gTIuo=; b=lrYJ9RzVyvzVe7o0WYyzU3epYN
	jauxWoaY4bnpJSJkOIVwDtsNpn5/C2aWuj1j3uMtNidD1Lf9tRgLg/s4eTS3OkBwxf26aUqhm+erf
	VTV45c4IgOZZ6QJISwYxLRrp9fm1ASbMdfX40x1bGLK+Xshar5IPTeogL4iIZs0qausuHg2eKB+K5
	3BTaK1R6C8CqqM7HzoB/YqmucsZd5p1gVjOuheXPvoGFKALYC1rp8LpLQILBddfbpkbFBWxD211lE
	4Fps14ZYJQ9CkX0zJ2rbWbgyptUF1vLrqA70BiTQcJS9PjVAU1+wcDp4Dap9hs7HiepIJY4UddKt+
	QE92TzMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMOYN-0000000DFki-1jtt;
	Mon, 11 May 2026 11:12:03 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMOY5-0000000DFM4-0wgm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 11:11:48 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7445116F8;
	Mon, 11 May 2026 04:11:39 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 348583F85F;
	Mon, 11 May 2026 04:11:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778497904; bh=SchapTxrN4TVWiNI0N9O2rNdFt+OW0JK5K20P+inEt4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=U8YlE8SJBqWGS048mPoC0ucFvRYpgDcH5CHKXUHFI1iNCuEajaok9KAgQYfJ4gVAE
	 gDk/PGChvoDS5ZPqZzKvdRMq1UrohrQLx9r3piR2+Cff2riJSlgSaD+TO07U3BVXOp
	 aEQkE+ZJ+MtPMvM5+H4mDDG4C8pSMwIP/FLhaAqs=
From: Leo Yan <leo.yan@arm.com>
Date: Mon, 11 May 2026 12:10:58 +0100
Subject: [PATCH v12 14/28] coresight: syscfg: Use IRQ-safe spinlock to
 protect active variables
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260511-arm_coresight_path_power_management_improvement-v12-14-1c9dcb1de8c9@arm.com>
References: <20260511-arm_coresight_path_power_management_improvement-v12-0-1c9dcb1de8c9@arm.com>
In-Reply-To: <20260511-arm_coresight_path_power_management_improvement-v12-0-1c9dcb1de8c9@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>, 
 Yeoreum Yun <yeoreum.yun@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
 Will Deacon <will@kernel.org>, Yabin Cui <yabinc@google.com>, 
 Keita Morisaki <keyz@google.com>, Jie Gan <jie.gan@oss.qualcomm.com>, 
 Yuanfang Zhang <quic_yuanfang@quicinc.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Tamas Petz <tamas.petz@arm.com>, Thomas Gleixner <tglx@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778497860; l=4374;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=SchapTxrN4TVWiNI0N9O2rNdFt+OW0JK5K20P+inEt4=;
 b=PLT3l7ioJsjBPUraa5gFBTtinoBWiSYP4WgXfLBcEiVboJ1QBPcAyzftPai32iLAU1J/G1CCP
 DI54Ijcs/n1C0jTgdU3qcts6J8jlp5nqu0w64kV/c5N50FtfYVd3ZSn
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_041147_130546_E7A49B5E 
X-CRM114-Status: GOOD (  16.76  )
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

cscfg_config_sysfs_get_active_cfg() will be used from idle flows, while
sleeping locks are not allowed.  Introduce sysfs_store_lock to replace
the mutex to protect sysfs_active_config and sysfs_active_preset
accesses, with IRQ-safe locking to avoid lockdep complaint.

Refactor cscfg_config_sysfs_activate() to use spinlock for
sysfs_active_config and activate/deactivate config.

Tested-by: Jie Gan <jie.gan@oss.qualcomm.com>
Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
Reviewed-by: James Clark <james.clark@linaro.org>
Tested-by: James Clark <james.clark@linaro.org>
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-syscfg.c | 38 ++++++++++++++------------
 drivers/hwtracing/coresight/coresight-syscfg.h |  2 ++
 2 files changed, 22 insertions(+), 18 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-syscfg.c b/drivers/hwtracing/coresight/coresight-syscfg.c
index d7f5037953d6ba7fb7f83a8012a1abc5ffd0a147..2bfdd7b45e49c8bec88428545069577431083bda 100644
--- a/drivers/hwtracing/coresight/coresight-syscfg.c
+++ b/drivers/hwtracing/coresight/coresight-syscfg.c
@@ -953,39 +953,41 @@ int cscfg_config_sysfs_activate(struct cscfg_config_desc *config_desc, bool acti
 	unsigned long cfg_hash;
 	int err = 0;
 
-	mutex_lock(&cscfg_mutex);
+	guard(mutex)(&cscfg_mutex);
 
 	cfg_hash = (unsigned long)config_desc->event_ea->var;
 
 	if (activate) {
 		/* cannot be a current active value to activate this */
-		if (cscfg_mgr->sysfs_active_config) {
-			err = -EBUSY;
-			goto exit_unlock;
-		}
-		err = _cscfg_activate_config(cfg_hash);
-		if (!err)
+		if (cscfg_mgr->sysfs_active_config)
+			return -EBUSY;
+
+		scoped_guard(raw_spinlock_irqsave, &cscfg_mgr->sysfs_store_lock) {
+			err = _cscfg_activate_config(cfg_hash);
+			if (err)
+				return err;
+
 			cscfg_mgr->sysfs_active_config = cfg_hash;
+		}
 	} else {
-		/* disable if matching current value */
-		if (cscfg_mgr->sysfs_active_config == cfg_hash) {
+		if (cscfg_mgr->sysfs_active_config != cfg_hash)
+			return -EINVAL;
+
+		scoped_guard(raw_spinlock_irqsave, &cscfg_mgr->sysfs_store_lock) {
+			/* disable if matching current value */
 			_cscfg_deactivate_config(cfg_hash);
 			cscfg_mgr->sysfs_active_config = 0;
-		} else
-			err = -EINVAL;
+		}
 	}
 
-exit_unlock:
-	mutex_unlock(&cscfg_mutex);
-	return err;
+	return 0;
 }
 
 /* set the sysfs preset value */
 void cscfg_config_sysfs_set_preset(int preset)
 {
-	mutex_lock(&cscfg_mutex);
+	guard(raw_spinlock_irqsave)(&cscfg_mgr->sysfs_store_lock);
 	cscfg_mgr->sysfs_active_preset = preset;
-	mutex_unlock(&cscfg_mutex);
 }
 
 /*
@@ -994,10 +996,9 @@ void cscfg_config_sysfs_set_preset(int preset)
  */
 void cscfg_config_sysfs_get_active_cfg(unsigned long *cfg_hash, int *preset)
 {
-	mutex_lock(&cscfg_mutex);
+	guard(raw_spinlock_irqsave)(&cscfg_mgr->sysfs_store_lock);
 	*preset = cscfg_mgr->sysfs_active_preset;
 	*cfg_hash = cscfg_mgr->sysfs_active_config;
-	mutex_unlock(&cscfg_mutex);
 }
 EXPORT_SYMBOL_GPL(cscfg_config_sysfs_get_active_cfg);
 
@@ -1201,6 +1202,7 @@ static int cscfg_create_device(void)
 	INIT_LIST_HEAD(&cscfg_mgr->load_order_list);
 	atomic_set(&cscfg_mgr->sys_active_cnt, 0);
 	cscfg_mgr->load_state = CSCFG_NONE;
+	raw_spin_lock_init(&cscfg_mgr->sysfs_store_lock);
 
 	/* setup the device */
 	dev = cscfg_device();
diff --git a/drivers/hwtracing/coresight/coresight-syscfg.h b/drivers/hwtracing/coresight/coresight-syscfg.h
index 66e2db890d8203853a0c3c907b48aa66dd8014e6..658e93c3705f1cb3ba3523d0bc27ac704697dd70 100644
--- a/drivers/hwtracing/coresight/coresight-syscfg.h
+++ b/drivers/hwtracing/coresight/coresight-syscfg.h
@@ -42,6 +42,7 @@ enum cscfg_load_ops {
  * @sysfs_active_config:Active config hash used if CoreSight controlled from sysfs.
  * @sysfs_active_preset:Active preset index used if CoreSight controlled from sysfs.
  * @load_state:		A multi-stage load/unload operation is in progress.
+ * @sysfs_store_lock:	Exclusive access sysfs stored variables.
  */
 struct cscfg_manager {
 	struct device dev;
@@ -54,6 +55,7 @@ struct cscfg_manager {
 	u32 sysfs_active_config;
 	int sysfs_active_preset;
 	enum cscfg_load_ops load_state;
+	raw_spinlock_t sysfs_store_lock;
 };
 
 /* get reference to dev in cscfg_manager */

-- 
2.34.1


