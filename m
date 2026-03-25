Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EAE0109C026
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 14:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lZDD/NuelnkGmI/b1/P1Qb29xvULHA5dTx5V5XR8W5Q=; b=ClKn75OK5bcXmPMkBWRn0E83kr
	yQgZ0I8+OPAP3bSEKZwMglLPXYsk3xzCh2Gswo5+C1JG7dZxy4qC+cb9NOYYllkIFVXA8vnDbaqOp
	WewR12nzj6ygbqc264ZGACCzlHuOH2cwvP/IOocGaWF4KO1mhn/rrfy5mxF4tUZwqVthUOFA7nhyu
	QAfrXC/eHTYaPaiS3dNU7ncJZDSN2Q/tit7orZtZHG9t01i9JIqjW/gUVYJasdhKDg0ACltuAU19w
	RuKDU2UH1Bn5WJIVY928YLA7eK4czyKsLzNvpnEUNlqeRhqFyw44cd/70Zw3SS0COPXrret/G39vA
	vifViqWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5PCp-00000003Zvq-2DjE;
	Wed, 25 Mar 2026 14:27:35 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5PCZ-00000003Zkp-3ZeY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 14:27:21 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E93CF1F02;
	Wed, 25 Mar 2026 07:27:12 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 04D8E3F836;
	Wed, 25 Mar 2026 07:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1774448838; bh=XMgfscbfbvP9VxDvxpQ6YwlsaVsOQdS232j0BgQtvdw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=b4Tot4mECHicuepSN+DCPFwRa++zxCcNYZY8VikrtGp8u29NSMRh5PvQkEBGhVwhh
	 TiTfY5MkxHW3l/1fAEbZ3W6Ae1E6OtQjb6ZcBlWcZK+Wzrm+shJKVrnoZ5g8/euEO2
	 qu2/2VbcvPrizRGGsiD39H1UZOPg1PSP6snLCAZI=
From: Leo Yan <leo.yan@arm.com>
Date: Wed, 25 Mar 2026 14:26:46 +0000
Subject: [PATCH v8 09/23] coresight: syscfg: Use spinlock to protect active
 variables
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260325-arm_coresight_path_power_management_improvement-v8-9-7b1902e18041@arm.com>
References: <20260325-arm_coresight_path_power_management_improvement-v8-0-7b1902e18041@arm.com>
In-Reply-To: <20260325-arm_coresight_path_power_management_improvement-v8-0-7b1902e18041@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774448816; l=4214;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=XMgfscbfbvP9VxDvxpQ6YwlsaVsOQdS232j0BgQtvdw=;
 b=yyl4kH2vzAS+Uz+r9c0beeKlENbzkGW3+QWOjRZAOxBcDDnz7YigpS3lS3U7+b1pUEEaHfA0a
 AiVDcooy+/EC8TD7YQjmub4XSs6/hvRRlBtI8F8o3pUVtdEu7lKwbER
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_072720_006971_E879A14A 
X-CRM114-Status: GOOD (  17.73  )
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

Acquire the raw spinlock with IRQ-safe to avoid lockdep complaint.

Reviewed-by: James Clark <james.clark@linaro.org>
Tested-by: James Clark <james.clark@linaro.org>
Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-syscfg.c | 21 ++++++++++-----------
 drivers/hwtracing/coresight/coresight-syscfg.h |  2 ++
 2 files changed, 12 insertions(+), 11 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-syscfg.c b/drivers/hwtracing/coresight/coresight-syscfg.c
index d7f5037953d6ba7fb7f83a8012a1abc5ffd0a147..7e070787e18b47bc4be17b0f9821267268600513 100644
--- a/drivers/hwtracing/coresight/coresight-syscfg.c
+++ b/drivers/hwtracing/coresight/coresight-syscfg.c
@@ -953,19 +953,21 @@ int cscfg_config_sysfs_activate(struct cscfg_config_desc *config_desc, bool acti
 	unsigned long cfg_hash;
 	int err = 0;
 
-	mutex_lock(&cscfg_mutex);
+	guard(mutex)(&cscfg_mutex);
 
 	cfg_hash = (unsigned long)config_desc->event_ea->var;
 
+	guard(raw_spinlock_irqsave)(&cscfg_mgr->sysfs_store_lock);
+
 	if (activate) {
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
 	} else {
 		/* disable if matching current value */
 		if (cscfg_mgr->sysfs_active_config == cfg_hash) {
@@ -975,17 +977,14 @@ int cscfg_config_sysfs_activate(struct cscfg_config_desc *config_desc, bool acti
 			err = -EINVAL;
 	}
 
-exit_unlock:
-	mutex_unlock(&cscfg_mutex);
 	return err;
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
@@ -994,10 +993,9 @@ void cscfg_config_sysfs_set_preset(int preset)
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
 
@@ -1201,6 +1199,7 @@ static int cscfg_create_device(void)
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


