Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BED1F3092D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 10:18:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rauDwsN7iCqGO+aJbvddfOiwzNjtdVfBRPP8Oi4s9eQ=; b=sdHSUdRfpb7rgCbEkhs5Rd5qVG
	79DxggvAXkk3nTGxdSt7b5kCEu59sUgKJRzfMeGmoTgpI5OV2IjWb+HWsKSeAIeZeVtSJN4CQVB+U
	irivlfbMALRvBtsCtArPXfW3ZyNdvi7SYCNmtd/gnzu5N+gV6X5qkkxl8q0ZZzxzcWqOEonY4E7WF
	3sAzcbImk1rZlJ/B/NmRSESfS8YIkhSDJa7Hg+3a5pj3buuLNZ2lbpNa+KIwsaegiv0KqoJN6JcqQ
	DxqMHNCp4S0MS8nrCYrC3GgSOAqbcWBF9e2/wm4LZS40XKb2uh1iTEBcEYxOa5uYSxK3sRFIbXN00
	NQuYPGWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy5mr-00000001YUj-3u73;
	Thu, 05 Mar 2026 10:18:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy5mq-00000001YQc-2tvk
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 05 Mar 2026 10:18:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=rauDwsN7iCqGO+aJbvddfOiwzNjtdVfBRPP8Oi4s9eQ=; b=TkuTFCOHcdEBX6pfF+G38xaKW7
	qjBiXPxqk9osn7dq0a96+Y6ECIfmW0XRk/FjEOR05vp9osFXyGUai0MbcISOc5hlBfaSDbtg87/lB
	CobRDzaXlUCjg+9nhEpMd/ejK7azTZJIZMWF/EEWtUFbaD6NZ3D9gjDYVsZbFCniHPSOwTWW/FEtR
	f5yDl8I/mpiUdTwj/VHlCpAircWRxGLFRE8GaopP/nNnD0G5YzPUo45zXpEWRC5nGQwpc/y1/R1GX
	fw1ScZqJOmjKucE8FoSaGHNBrPCiXLGi0KQazTFjx+44cde30R63ndVFDDVLZcsl95n1POGl1b0eZ
	ccvsYJYw==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy5mm-00000006Spm-11yj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 10:18:30 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 294F2339;
	Thu,  5 Mar 2026 02:18:21 -0800 (PST)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8C4C93F694;
	Thu,  5 Mar 2026 02:18:25 -0800 (PST)
From: Leo Yan <leo.yan@arm.com>
Date: Thu, 05 Mar 2026 10:17:50 +0000
Subject: [PATCH v6 19/19] coresight: Move CPU hotplug callbacks to core
 layer
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-arm_coresight_path_power_management_improvement-v6-19-eff765d211a9@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772705864; l=6953;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=LN+ejCksrHF4a9lUvBZAaZIwYr2OppGTd9Ji/Osnd3E=;
 b=v0/pJhiKO5eWnc5QIuL1YuUGRQhmeZRKsg1bOMRfyRqdeIJXkzJgrK05lhSXjS593YjiGulM8
 V1dwp+qQgSvAdtM3V5YPfyGpL5yLwCYa9z25yteggk4WVREZdH11sdU
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_101828_686835_2A805FEC 
X-CRM114-Status: GOOD (  17.80  )
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
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-core.c       | 42 +++++++++++++++++++++-
 drivers/hwtracing/coresight/coresight-etm3x-core.c | 40 ---------------------
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 37 -------------------
 3 files changed, 41 insertions(+), 78 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index 25ed45129375d83adb2e1b30664aef15535e8164..8dd784a5b756ce0a410a1c7d83d6417809b62b4d 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -1786,6 +1786,33 @@ static void coresight_pm_restore(struct coresight_device *csdev)
 	csdev->path->in_idle = false;
 }
 
+static int coresight_dying_cpu(unsigned int cpu)
+{
+	struct coresight_device *source = per_cpu(csdev_source, cpu);
+	struct coresight_path *path;
+
+	if (!source || !source->path)
+		return 0;
+
+	/*
+	 * The perf event layer will disable PMU events in the CPU hotplug.
+	 * CoreSight driver should never handle the CS_MODE_PERF case.
+	 */
+	if (coresight_get_mode(source) != CS_MODE_SYSFS)
+		return 0;
+
+	/*
+	 * Save 'source->path' here, as it will be cleared in
+	 * coresight_disable_source().
+	 */
+	path = source->path;
+
+	coresight_disable_source(source, NULL);
+	coresight_disable_path(path);
+	coresight_release_path(path);
+	return 0;
+}
+
 static int coresight_cpu_pm_notify(struct notifier_block *nb, unsigned long cmd,
 				   void *v)
 {
@@ -1817,11 +1844,24 @@ static struct notifier_block coresight_cpu_pm_nb = {
 
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
index eec3cde45bb4ea59f58271c5e4a521da2a723ffe..cd6a48fa767862cc30e66a6e448c0d7f2e504fd8 100644
--- a/drivers/hwtracing/coresight/coresight-etm3x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm3x-core.c
@@ -706,35 +706,6 @@ static int etm_online_cpu(unsigned int cpu)
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
@@ -802,13 +773,6 @@ static int __init etm_hp_setup(void)
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
@@ -819,15 +783,11 @@ static int __init etm_hp_setup(void)
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
index b74da6f0ad7cc9e7afa3df4d1ab22d902e0a272c..cd7c2f80f103a1b748b471a873a3eb0e67b833dd 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -1837,33 +1837,6 @@ static int etm4_online_cpu(unsigned int cpu)
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
 static bool etm4_need_save_restore_context(struct coresight_device *csdev)
 {
 	if (pm_save_enable != PARAM_PM_SAVE_SELF_HOSTED)
@@ -2136,13 +2109,6 @@ static int __init etm4_pm_setup(void)
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
@@ -2153,14 +2119,11 @@ static int __init etm4_pm_setup(void)
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


