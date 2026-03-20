Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C11251099B31
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 17:44:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zGsmby+yKUjzUNCvhm4boSVhmkNEXyH7VTVA58e1R+A=; b=b9vl+hbTuwfBylYOAEmV/Q3iqE
	vd25uUr7SyYUQilbo68QRyr+cPtPMxhfWZBORtwsQjWsrgMq6iGi3XRzvBMQ2sC86uzgrTATqvxS1
	u/Rk2s2f8N5q5bbx3C0eD1QFnuq+NOolNGGKt1wOz0d6j6CZVG+P6iu4ET7Df9/5LBEpkaorVnkh0
	TKuT6Pmk4UdeDoAIeyeHW6jhjlC/Md8iOYXmEY1XjqM8Gu6ooVING8qKv7a0NxSxVrXk/M4uwVhGY
	qbLzyS2atFgq/AujGerCmDp3PMxU/RCq2LA3MKMNt9P6zGolggqdzyTy0l99G0GJWEXBo3vA1/t9a
	C9QQsCiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3dtI-0000000DIag-1fia;
	Fri, 20 Mar 2026 17:44:08 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3dsz-0000000DIH5-0mni
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 17:43:51 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 632FB165C;
	Fri, 20 Mar 2026 10:43:42 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8E8683FA1F;
	Fri, 20 Mar 2026 10:43:46 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
Date: Fri, 20 Mar 2026 17:43:02 +0000
Subject: [PATCH v7 20/20] coresight: Move CPU hotplug callbacks to core
 layer
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260320-arm_coresight_path_power_management_improvement-v7-20-327ddd36b58b@arm.com>
References: <20260320-arm_coresight_path_power_management_improvement-v7-0-327ddd36b58b@arm.com>
In-Reply-To: <20260320-arm_coresight_path_power_management_improvement-v7-0-327ddd36b58b@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774028583; l=6710;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=r44f/shfDf1NM7fTSQSe/Pa3qq7m/AG83CNquo/g6Fc=;
 b=N4PLAFRJGf5h9ycxcNw47vEW/SalWf35QeJDKdh+9gKkHOYkafBkLEGbVQJORrb5pGM9A+e/s
 F3+ImIbzqlrCZLPkgVcbjgxOoRnyzTMKeWmbgjyTMH8+ZU/+bjf6HCh
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_104349_318405_43E318A3 
X-CRM114-Status: GOOD (  17.93  )
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
index e0784e8eecedae5a5121c03d6bb29f6a3ab5026f..fd982c4eafc62b10c01b70e0ec3efe4a4add0afe 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -1903,13 +1903,47 @@ static struct notifier_block coresight_cpu_pm_nb = {
 	.notifier_call = coresight_cpu_pm_notify,
 };
 
+static int coresight_dying_cpu(unsigned int cpu)
+{
+	struct coresight_path *path = coresight_get_local_cpu_path();
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
index c6fe8b25b855a4119110fee4162f55c0154c3d05..862ad0786699c41433eae8683406b3c1340a6cb6 100644
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
index 2870c162fdc1c119f05ee5d92c1f6c71aa1cfb5f..1d7bfa21d7c205ae1b903bd62bc6d675d0fa949d 100644
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


