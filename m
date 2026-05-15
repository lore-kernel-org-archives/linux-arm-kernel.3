Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE9CBCD4F48
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 18:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gJNxFW6Vk3MweHIHiRIiUNGVF1bAnakuWo1taEAlzLQ=; b=cCGkYiyv/DDQdcgdEW76mwg4IU
	zPbcBxvSwzs9scFdDAQ+JviOh1Yrp5fr4wbQHFaGUHWYSczgVGM4xU7EfczYQPdXWYHg6kEJgote+
	dHMeGX2NlrhI3uZEqD0UjZA/eK/NfDq5LL6TMAycKdb9+tp2JuD/3NGaoRabwlDBlkrpDxAm+cAAO
	CWO9qM4XFnoQW5e2e5jFgzrOEu7hQ//PaqbPk9PAI7V77160mL5n/hFktmLlNBaU+nqnEK3jMJI+J
	0V4tbdlFVCfxtRyLvOctMlH/VPzyVmVAiajA9OyyMR6dfL3aeD7ni0U/H5Ru7ex9j0aVz5Dl2vCBF
	1/nCV9dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNxf0-000000099KY-1Jy5;
	Fri, 15 May 2026 18:53:22 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNxel-000000098cN-0boZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 18:53:14 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0FDFF35D5;
	Fri, 15 May 2026 11:53:01 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 783F83F836;
	Fri, 15 May 2026 11:53:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778871186; bh=4lw52HGBsvRjmf2rD2OZS+qbGWIcWAuZyD2X9mK7Bec=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=BSo4DTviNYCxoEZ4pEopwdqKIdJPcxCx3wbFoi5vaT2mSw9l/fnuUn7rfeeXcGacT
	 OhYxmrFApR+U/+f0iozWDllOeYEpbY42TZbMfhYz8dZFOUqjc1UYaQ0Hj2STSVCpcb
	 /tXHkrjLq11I/d0TBPD37W/w+RwWt7aJhwn5N6og=
From: Leo Yan <leo.yan@arm.com>
Date: Fri, 15 May 2026 19:51:50 +0100
Subject: [PATCH v13 27/28] coresight: Move CPU hotplug callbacks to core
 layer
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-arm_coresight_path_power_management_improvement-v13-27-9dfc558ed65e@arm.com>
References: <20260515-arm_coresight_path_power_management_improvement-v13-0-9dfc558ed65e@arm.com>
In-Reply-To: <20260515-arm_coresight_path_power_management_improvement-v13-0-9dfc558ed65e@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778871097; l=9870;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=4lw52HGBsvRjmf2rD2OZS+qbGWIcWAuZyD2X9mK7Bec=;
 b=7KO6Iem/vPmKXZtqUkn4n/SKFyvOdezSTIbcOteXv7bH7ftjxDXXzY7J3TZdv4R7fEG5s/KGD
 IQcgM814YtmBI+xz0EYmBF7VdwsiSGkX0yPY0f3CMm0503hCAO4Pif9
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_115307_295024_1D6C8F21 
X-CRM114-Status: GOOD (  25.46  )
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

Add a 'mode' argument to coresight_pm_get_active_path() so it only
returns active paths for the relevant mode. Define the enum with bit
flags so it is safe for bitwise operations.

Change CPUHP_AP_ARM_CORESIGHT_STARTING to CPUHP_AP_ARM_CORESIGHT_ONLINE
so that the CPU hotplug callback runs in the online state and thread
context, allowing coresight_disable_sysfs() to be called directly to
disable the path.

Tested-by: James Clark <james.clark@linaro.org>
Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
Reviewed-by: James Clark <james.clark@linaro.org>
Tested-by: Jie Gan <jie.gan@oss.qualcomm.com>
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-core.c       | 48 ++++++++++++++++++----
 drivers/hwtracing/coresight/coresight-etm3x-core.c | 40 ------------------
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 37 -----------------
 include/linux/coresight.h                          |  6 +--
 include/linux/cpuhotplug.h                         |  2 +-
 5 files changed, 43 insertions(+), 90 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index 7c7503d7eeb3967efd179d5f91df578d5827bcd3..6e827cfee85efac39f94ccbb7451449d01bd36d6 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -1847,7 +1847,7 @@ static void coresight_release_device_list(void)
 	}
 }
 
-static struct coresight_path *coresight_cpu_get_active_path(void)
+static struct coresight_path *coresight_cpu_get_active_path(enum cs_mode mode)
 {
 	struct coresight_device *source;
 	bool is_active = false;
@@ -1856,17 +1856,17 @@ static struct coresight_path *coresight_cpu_get_active_path(void)
 	if (!source)
 		return NULL;
 
-	if (coresight_get_mode(source) != CS_MODE_DISABLED)
+	if (coresight_get_mode(source) & mode)
 		is_active = true;
 
 	coresight_put_percpu_source_ref(source);
 
 	/*
-	 * It is expected to run in atomic context, so it cannot be preempted
-	 * to disable the path. Here returns the active path pointer without
-	 * concern that its state may change. Since the build path has taken
-	 * a reference on the component, the path can be safely used by the
-	 * caller.
+	 * It is expected to run in atomic context or with the CPU lock held for
+	 * sysfs mode, so it cannot be preempted to disable the path. Here
+	 * returns the active path pointer without concern that its state may
+	 * change. Since the build path has taken a reference on the component,
+	 * the path can be safely used by the caller.
 	 */
 	return is_active ? source->path : NULL;
 }
@@ -1985,7 +1985,8 @@ static void coresight_pm_restore(struct coresight_path *path)
 static int coresight_cpu_pm_notify(struct notifier_block *nb, unsigned long cmd,
 				   void *v)
 {
-	struct coresight_path *path = coresight_cpu_get_active_path();
+	struct coresight_path *path =
+		coresight_cpu_get_active_path(CS_MODE_SYSFS | CS_MODE_PERF);
 	int ret;
 
 	ret = coresight_pm_is_needed(path);
@@ -2012,13 +2013,42 @@ static struct notifier_block coresight_cpu_pm_nb = {
 	.notifier_call = coresight_cpu_pm_notify,
 };
 
+static int coresight_dying_cpu(unsigned int cpu)
+{
+	struct coresight_path *path;
+
+	/*
+	 * The perf event layer will disable PMU events in the CPU
+	 * hotplug. Here only handles SYSFS case.
+	 */
+	path = coresight_cpu_get_active_path(CS_MODE_SYSFS);
+	if (!path)
+		return 0;
+
+	coresight_disable_sysfs(coresight_get_source(path));
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
+					"arm/coresight-core:dying",
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
index 343ba9ce946a7ea3776c06d43364cdce823e2c80..14bb31bd6a0b979051dd17963218c00165a0ebb8 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -1833,33 +1833,6 @@ static int etm4_online_cpu(unsigned int cpu)
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
 static inline bool etm4_pm_save_needed(struct etmv4_drvdata *drvdata)
 {
 	return !!drvdata->save_state;
@@ -2120,13 +2093,6 @@ static int __init etm4_pm_setup(void)
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
@@ -2137,14 +2103,11 @@ static int __init etm4_pm_setup(void)
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
diff --git a/include/linux/coresight.h b/include/linux/coresight.h
index 76ef4c0965125cd11830df0151a6707d3e3b638d..add0579cad884c62b8c8e5ff82264966ff0613b7 100644
--- a/include/linux/coresight.h
+++ b/include/linux/coresight.h
@@ -344,9 +344,9 @@ struct coresight_path {
 };
 
 enum cs_mode {
-	CS_MODE_DISABLED,
-	CS_MODE_SYSFS,
-	CS_MODE_PERF,
+	CS_MODE_DISABLED = 0,
+	CS_MODE_SYSFS	 = BIT(0),
+	CS_MODE_PERF	 = BIT(1),
 };
 
 #define coresight_ops(csdev)	csdev->ops
diff --git a/include/linux/cpuhotplug.h b/include/linux/cpuhotplug.h
index 22ba327ec2278c132572950848ade2b814787eb5..0fb3a2a62eb001bcc813422eba2ce8fbf92c260a 100644
--- a/include/linux/cpuhotplug.h
+++ b/include/linux/cpuhotplug.h
@@ -180,7 +180,6 @@ enum cpuhp_state {
 	CPUHP_AP_DUMMY_TIMER_STARTING,
 	CPUHP_AP_ARM_XEN_STARTING,
 	CPUHP_AP_ARM_XEN_RUNSTATE_STARTING,
-	CPUHP_AP_ARM_CORESIGHT_STARTING,
 	CPUHP_AP_ARM_CORESIGHT_CTI_STARTING,
 	CPUHP_AP_ARM64_ISNDEP_STARTING,
 	CPUHP_AP_SMPCFD_DYING,
@@ -200,6 +199,7 @@ enum cpuhp_state {
 	CPUHP_AP_IRQ_AFFINITY_ONLINE,
 	CPUHP_AP_BLK_MQ_ONLINE,
 	CPUHP_AP_ARM_MVEBU_SYNC_CLOCKS,
+	CPUHP_AP_ARM_CORESIGHT_ONLINE,
 	CPUHP_AP_X86_INTEL_EPB_ONLINE,
 	CPUHP_AP_PERF_ONLINE,
 	CPUHP_AP_PERF_X86_ONLINE,

-- 
2.34.1


