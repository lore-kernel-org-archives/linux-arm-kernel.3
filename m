Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98C7310F9313
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 18:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JbUXx02EcsbJy2QSE93SLzv73GclEVLzodGeI1M/Vmg=; b=wrFMZrwi6hWaNTBl6TY8ewKPte
	OuruRwMZc2YHhoG5FuRVIG79yU/KVnpopUMOzDgt2uLxtolza3u6PaJl3NoYvY9J+vRzPIBHWgfUq
	66gMGkdrFVtCshDBvsJ37F+iILpHntuJFv2TWtdnfJHklqEdmteuGvMUhwwdWdo9ROlG8N0e0ODbZ
	2e8R4o9rZ1Rycqt9naMRkJJMgnyxp+Z29mQAncpjl+dMUNhDrdFzuzF5uprdV3rfg8+DFNZE1QXXW
	y0U0577K8bHZyb4yl/uw5D0XXhUTrpMJFMX1uVmP5EuFtczJSRgv+Nkg+iM285wsX7/O3ZGgNGktg
	DjmdDf5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7zxb-0000000FvAC-1ah4;
	Wed, 01 Apr 2026 18:06:35 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7zxV-0000000Fv33-254V
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Apr 2026 18:06:30 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0A0AD16F2;
	Wed,  1 Apr 2026 11:06:23 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D8CAC3F7D8;
	Wed,  1 Apr 2026 11:06:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775066788; bh=BT/AGHpymeHpObXZJPmjQfOsVXDb8E16F/tBMi6qrUk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=iMd4GRBvXgQ6Jpl+NtFKMRZCSzao8gkJU8APJIS9LOQW9fXc9dRDZIRXLeSaVKn7e
	 pTbjsf/lNUe3+RSaYlai9JkN1ivVJRbWJcGjgj+6H4/kuVk29BYX4JCvhrmWu46tJ1
	 nGcxot/loAl8EVJ7c+LVL2qaPPW4QrfTC1Dsz5lw=
From: Leo Yan <leo.yan@arm.com>
Date: Wed, 01 Apr 2026 19:05:48 +0100
Subject: [PATCH v9 19/20] coresight: Move CPU hotplug callbacks to core
 layer
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260401-arm_coresight_path_power_management_improvement-v9-19-091d73e44072@arm.com>
References: <20260401-arm_coresight_path_power_management_improvement-v9-0-091d73e44072@arm.com>
In-Reply-To: <20260401-arm_coresight_path_power_management_improvement-v9-0-091d73e44072@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>, 
 Yeoreum Yun <yeoreum.yun@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
 Will Deacon <will@kernel.org>, Yabin Cui <yabinc@google.com>, 
 Keita Morisaki <keyz@google.com>, 
 Yuanfang Zhang <quic_yuanfang@quicinc.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Tamas Petz <tamas.petz@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775066742; l=6713;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=BT/AGHpymeHpObXZJPmjQfOsVXDb8E16F/tBMi6qrUk=;
 b=DCglyNslGvp5cRpu6RHZI1pqgKRseCMqo45AC3abvuUZjb8MW1wcm1/QYFD3e+nzc53/YiV5d
 f9tFxhR3a4EAWlTuKzLgJqpl63h8QgkD2rIKSbqwqMbzR1d8Ui9z5Bm
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_110629_645394_0DB89D4D 
X-CRM114-Status: GOOD (  19.04  )
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

This commit moves CPU hotplug callbacks from ETMv4 driver to core layer.
The motivation is the core layer can control all components on an
activated path rather but not only managing tracer in ETMv4 driver.

The perf event layer will disable CoreSight PMU event 'cs_etm' when
hotplug off a CPU.  That means a perf mode will be always converted to
disabled mode in CPU hotplug.  Arm CoreSight CPU hotplug callbacks only
need to handle the Sysfs mode and ignore the perf mode.

The core layer disables and releases the active path when hotplug-off a
CPU.  When hotplug-in a CPU, it does not re-enable the path, in this
case, users need to re-enable the trace via Sysfs interface.

Tested-by: James Clark <james.clark@linaro.org>
Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
Reviewed-by: James Clark <james.clark@linaro.org>
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-core.c       | 36 ++++++++++++++++++-
 drivers/hwtracing/coresight/coresight-etm3x-core.c | 40 ----------------------
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 37 --------------------
 3 files changed, 35 insertions(+), 78 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index a41e77da4f083d4b5d162e7b70905f22bddf7ca2..5ebe0640129ade401de9d2ebb97819c6d1809d83 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -1847,13 +1847,47 @@ static struct notifier_block coresight_cpu_pm_nb = {
 	.notifier_call = coresight_cpu_pm_notify,
 };
 
+static int coresight_dying_cpu(unsigned int cpu)
+{
+	struct coresight_path *path = coresight_get_percpu_local_path();
+	struct coresight_device *source = coresight_get_source(path);
+
+	if (!path || !source)
+		return 0;
+
+	/*
+	 * The perf event layer will disable PMU events in the CPU hotplug.
+	 * CoreSight driver should never handle the CS_MODE_PERF case.
+	 */
+	if (coresight_get_mode(source) != CS_MODE_SYSFS)
+		return 0;
+
+	coresight_disable_source(source, NULL);
+	coresight_disable_path(path);
+	coresight_release_path(path);
+	return 0;
+}
+
 static int __init coresight_pm_setup(void)
 {
-	return cpu_pm_register_notifier(&coresight_cpu_pm_nb);
+	int ret;
+
+	ret = cpu_pm_register_notifier(&coresight_cpu_pm_nb);
+	if (ret)
+		return ret;
+
+	ret = cpuhp_setup_state_nocalls(CPUHP_AP_ARM_CORESIGHT_STARTING,
+					"arm/coresight-core:starting",
+					NULL, coresight_dying_cpu);
+	if (ret)
+		cpu_pm_unregister_notifier(&coresight_cpu_pm_nb);
+
+	return ret;
 }
 
 static void coresight_pm_cleanup(void)
 {
+	cpuhp_remove_state_nocalls(CPUHP_AP_ARM_CORESIGHT_STARTING);
 	cpu_pm_unregister_notifier(&coresight_cpu_pm_nb);
 }
 
diff --git a/drivers/hwtracing/coresight/coresight-etm3x-core.c b/drivers/hwtracing/coresight/coresight-etm3x-core.c
index 46ea66b5cf1985bd7129688f175f6f92372d04ad..5c6b131465c52fd8ab9161bf36fc78ba9a7dd99b 100644
--- a/drivers/hwtracing/coresight/coresight-etm3x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm3x-core.c
@@ -699,35 +699,6 @@ static int etm_online_cpu(unsigned int cpu)
 	return 0;
 }
 
-static int etm_starting_cpu(unsigned int cpu)
-{
-	if (!etmdrvdata[cpu])
-		return 0;
-
-	spin_lock(&etmdrvdata[cpu]->spinlock);
-	if (!etmdrvdata[cpu]->os_unlock) {
-		etm_os_unlock(etmdrvdata[cpu]);
-		etmdrvdata[cpu]->os_unlock = true;
-	}
-
-	if (coresight_get_mode(etmdrvdata[cpu]->csdev))
-		etm_enable_hw(etmdrvdata[cpu]);
-	spin_unlock(&etmdrvdata[cpu]->spinlock);
-	return 0;
-}
-
-static int etm_dying_cpu(unsigned int cpu)
-{
-	if (!etmdrvdata[cpu])
-		return 0;
-
-	spin_lock(&etmdrvdata[cpu]->spinlock);
-	if (coresight_get_mode(etmdrvdata[cpu]->csdev))
-		etm_disable_hw(etmdrvdata[cpu]);
-	spin_unlock(&etmdrvdata[cpu]->spinlock);
-	return 0;
-}
-
 static bool etm_arch_supported(u8 arch)
 {
 	switch (arch) {
@@ -795,13 +766,6 @@ static int __init etm_hp_setup(void)
 {
 	int ret;
 
-	ret = cpuhp_setup_state_nocalls(CPUHP_AP_ARM_CORESIGHT_STARTING,
-					"arm/coresight:starting",
-					etm_starting_cpu, etm_dying_cpu);
-
-	if (ret)
-		return ret;
-
 	ret = cpuhp_setup_state_nocalls(CPUHP_AP_ONLINE_DYN,
 					"arm/coresight:online",
 					etm_online_cpu, NULL);
@@ -812,15 +776,11 @@ static int __init etm_hp_setup(void)
 		return 0;
 	}
 
-	/* failed dyn state - remove others */
-	cpuhp_remove_state_nocalls(CPUHP_AP_ARM_CORESIGHT_STARTING);
-
 	return ret;
 }
 
 static void etm_hp_clear(void)
 {
-	cpuhp_remove_state_nocalls(CPUHP_AP_ARM_CORESIGHT_STARTING);
 	if (hp_online) {
 		cpuhp_remove_state_nocalls(hp_online);
 		hp_online = 0;
diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index 087a32fe34890528c6fa6ada601aeb742f04c41b..a10a40098659e9814b4d20c15f01bf7d0c2fbe26 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -1834,33 +1834,6 @@ static int etm4_online_cpu(unsigned int cpu)
 	return 0;
 }
 
-static int etm4_starting_cpu(unsigned int cpu)
-{
-	if (!etmdrvdata[cpu])
-		return 0;
-
-	raw_spin_lock(&etmdrvdata[cpu]->spinlock);
-	if (!etmdrvdata[cpu]->os_unlock)
-		etm4_os_unlock(etmdrvdata[cpu]);
-
-	if (coresight_get_mode(etmdrvdata[cpu]->csdev))
-		etm4_enable_hw(etmdrvdata[cpu]);
-	raw_spin_unlock(&etmdrvdata[cpu]->spinlock);
-	return 0;
-}
-
-static int etm4_dying_cpu(unsigned int cpu)
-{
-	if (!etmdrvdata[cpu])
-		return 0;
-
-	raw_spin_lock(&etmdrvdata[cpu]->spinlock);
-	if (coresight_get_mode(etmdrvdata[cpu]->csdev))
-		etm4_disable_hw(etmdrvdata[cpu]);
-	raw_spin_unlock(&etmdrvdata[cpu]->spinlock);
-	return 0;
-}
-
 static int etm4_cpu_save(struct coresight_device *csdev)
 {
 	int i, ret = 0;
@@ -2110,13 +2083,6 @@ static int __init etm4_pm_setup(void)
 {
 	int ret;
 
-	ret = cpuhp_setup_state_nocalls(CPUHP_AP_ARM_CORESIGHT_STARTING,
-					"arm/coresight4:starting",
-					etm4_starting_cpu, etm4_dying_cpu);
-
-	if (ret)
-		return ret;
-
 	ret = cpuhp_setup_state_nocalls(CPUHP_AP_ONLINE_DYN,
 					"arm/coresight4:online",
 					etm4_online_cpu, NULL);
@@ -2127,14 +2093,11 @@ static int __init etm4_pm_setup(void)
 		return 0;
 	}
 
-	/* failed dyn state - remove others */
-	cpuhp_remove_state_nocalls(CPUHP_AP_ARM_CORESIGHT_STARTING);
 	return ret;
 }
 
 static void etm4_pm_clear(void)
 {
-	cpuhp_remove_state_nocalls(CPUHP_AP_ARM_CORESIGHT_STARTING);
 	if (hp_online) {
 		cpuhp_remove_state_nocalls(hp_online);
 		hp_online = 0;

-- 
2.34.1


