Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D8C7E9D809
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Apr 2026 15:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=223VdwBZIdMRTg1d5OCfW3V0S7eeBNMu20o3iGXzpio=; b=LlH0G/PL9jfWXzFe1IKucwD49G
	vf/ur3RdSPvYtu+2WUijkKa1/WMozAz32tKp5JoRNRN6FJ7SGjmIasaA81fKIhu8byDmV1b28BKRE
	84lEEtgGbML4ePoiziapXORojiAu2JcPhnKhHJVlOgTFhVpPQTha09X7DsAl5hpu1LXX6g9/+s452
	xdW4xAxu77+WuUkDM9oyZOdGjcTr8UkpW1kK9s9vOmZvFpkLbp2n8Sk1zwHm4LWRgGgwLfFrxiyYf
	3vV9fyLMyRoXwxh+Tx4l8HBTVJMZZiyBRrg9dHBpcRe5ZaSVGXQXiw0x/BMGGAsf7JIh+TRdhFtC+
	LQ14wI0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9P1I-00000004IFv-06Xf;
	Sun, 05 Apr 2026 15:04:12 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9P17-00000004I3P-3Sb5
	for linux-arm-kernel@lists.infradead.org;
	Sun, 05 Apr 2026 15:04:09 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9AA9A26BE;
	Sun,  5 Apr 2026 08:03:54 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A40973F62B;
	Sun,  5 Apr 2026 08:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775401440; bh=Ma/NcEmGNHsG/IED5KKOMrp65E+82YphMPimp1I3fkI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=kmjE4jb2Q8T7tPFrhazw+3ZAL4lDD7dB8An+irm/w3Vf8r+ac+NLOLuHONyVpisep
	 8caYUO12n1N5l2zJ8no8BzR44NEI8/Q/hU41Mia4k550hzn3eTi8dhrgNMo/h6O+3/
	 MNKQqebtSRKU89dSY6ZM+d9zseNEv6Ag3uW+r5gc=
From: Leo Yan <leo.yan@arm.com>
Date: Sun, 05 Apr 2026 16:02:55 +0100
Subject: [PATCH v10 19/20] coresight: Move CPU hotplug callbacks to core
 layer
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260405-arm_coresight_path_power_management_improvement-v10-19-13e94754a8be@arm.com>
References: <20260405-arm_coresight_path_power_management_improvement-v10-0-13e94754a8be@arm.com>
In-Reply-To: <20260405-arm_coresight_path_power_management_improvement-v10-0-13e94754a8be@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>, 
 Yeoreum Yun <yeoreum.yun@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
 Will Deacon <will@kernel.org>, Yabin Cui <yabinc@google.com>, 
 Keita Morisaki <keyz@google.com>, 
 Yuanfang Zhang <quic_yuanfang@quicinc.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Tamas Petz <tamas.petz@arm.com>, Thomas Gleixner <tglx@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775401378; l=7636;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=Ma/NcEmGNHsG/IED5KKOMrp65E+82YphMPimp1I3fkI=;
 b=XFCtaBIwOxm2mN2x2a2iO8zIJ3z8d+WjeNrrdjb7WetEd3NsptpLrJH8w6W7ZM6EY3ShSnDym
 HAZcyUITM2IAWiO7yRhogGnMNAOVv0cXlFjgcluqGgVvr9KfpsMcp5m
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260405_080402_055457_E3FA3D22 
X-CRM114-Status: GOOD (  19.47  )
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

Change CPUHP_AP_ARM_CORESIGHT_STARTING to CPUHP_AP_ARM_CORESIGHT_ONLINE
so that the CPU hotplug callback runs in the online state and thread
context, allowing coresight_disable_sysfs() to be called directly to
disable the path.

Tested-by: James Clark <james.clark@linaro.org>
Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
Reviewed-by: James Clark <james.clark@linaro.org>
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-core.c       | 42 +++++++++++++++++++++-
 drivers/hwtracing/coresight/coresight-etm3x-core.c | 40 ---------------------
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 37 -------------------
 include/linux/cpuhotplug.h                         |  2 +-
 4 files changed, 42 insertions(+), 79 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index a918bf6398a932de30fe9b4947020cc4c1cfb2f7..af0ec6d1df7baea2a7beb9ee0a28bb969eb4ccf2 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -1889,13 +1889,53 @@ static struct notifier_block coresight_cpu_pm_nb = {
 	.notifier_call = coresight_cpu_pm_notify,
 };
 
+static int coresight_dying_cpu(unsigned int cpu)
+{
+	struct coresight_device *source;
+	struct coresight_path *path;
+
+	/* Disable interrupt to avoid race with perf session */
+	scoped_guard(irqsave) {
+		path = coresight_get_percpu_local_path();
+		if (!path)
+			return 0;
+
+		source = coresight_get_source(path);
+		if (!source)
+			return 0;
+
+		/*
+		 * The perf event layer will disable PMU events in the CPU
+		 * hotplug. Here only handles SYSFS case.
+		 */
+		if (coresight_get_mode(source) != CS_MODE_SYSFS)
+			return 0;
+	}
+
+	coresight_disable_sysfs(source);
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
+	ret = cpuhp_setup_state_nocalls(CPUHP_AP_ARM_CORESIGHT_ONLINE,
+					"arm/coresight-core:starting",
+					NULL, coresight_dying_cpu);
+	if (ret)
+		cpu_pm_unregister_notifier(&coresight_cpu_pm_nb);
+
+	return ret;
 }
 
 static void coresight_pm_cleanup(void)
 {
+	cpuhp_remove_state_nocalls(CPUHP_AP_ARM_CORESIGHT_ONLINE);
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
index 5ccbf792fe71bec7d5b74c24288c5313afdb7cd0..879950ec0f527c0151f00266f6bf5d569ad460d8 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -1829,33 +1829,6 @@ static int etm4_online_cpu(unsigned int cpu)
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
 static inline bool etm4_pm_save_needed(void)
 {
 	return pm_save_enable == PARAM_PM_SAVE_SELF_HOSTED;
@@ -2116,13 +2089,6 @@ static int __init etm4_pm_setup(void)
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
@@ -2133,14 +2099,11 @@ static int __init etm4_pm_setup(void)
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
diff --git a/include/linux/cpuhotplug.h b/include/linux/cpuhotplug.h
index 62cd7b35a29c94f214fec3b55f9462eceffad694..b9196ef6d83471400bb8bc5a8c4fd486c0acd4cc 100644
--- a/include/linux/cpuhotplug.h
+++ b/include/linux/cpuhotplug.h
@@ -181,7 +181,6 @@ enum cpuhp_state {
 	CPUHP_AP_DUMMY_TIMER_STARTING,
 	CPUHP_AP_ARM_XEN_STARTING,
 	CPUHP_AP_ARM_XEN_RUNSTATE_STARTING,
-	CPUHP_AP_ARM_CORESIGHT_STARTING,
 	CPUHP_AP_ARM_CORESIGHT_CTI_STARTING,
 	CPUHP_AP_ARM64_ISNDEP_STARTING,
 	CPUHP_AP_SMPCFD_DYING,
@@ -201,6 +200,7 @@ enum cpuhp_state {
 	CPUHP_AP_IRQ_AFFINITY_ONLINE,
 	CPUHP_AP_BLK_MQ_ONLINE,
 	CPUHP_AP_ARM_MVEBU_SYNC_CLOCKS,
+	CPUHP_AP_ARM_CORESIGHT_ONLINE,
 	CPUHP_AP_X86_INTEL_EPB_ONLINE,
 	CPUHP_AP_PERF_ONLINE,
 	CPUHP_AP_PERF_X86_ONLINE,

-- 
2.34.1


