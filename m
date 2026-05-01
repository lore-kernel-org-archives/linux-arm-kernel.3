Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0806ECD3423
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 May 2026 16:49:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=opHSGTf76BSBRHOR/K8cDc/74oddNS+hcFTu/fx8mdE=; b=iouh93SRr8OY24fa7R95V789Zz
	Kt6EVIMS/AAddWD4L73Lq5Wc5ZU8bnpQDkyiLknQarlhE1PFjWpQNYEtngsJTHTAMIQFMr0yVgJFD
	s938VADtepMWY+hDTQCy0KsPdzPRiAl6fzD238+BWU2dZxIkHD/KoZDRybA0OAg7fhIyR8h+KU/dw
	T/PeyZQgB9BZEuV1bJkkR2TeCbPZxahIw5XY08LLNOu+arjTlil7Jt3xOW1kp3LX2qH7DjahiUWqm
	rRGq5R1ACZlMq8WMHK5VJB8R+e+MGfuy4YAGA7l/CehUFwc7uDAKDJ/23mB2JqeCSWM+zc2ywZzJU
	qnmZ5pTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIr3Q-00000007SMH-1loj;
	Fri, 01 May 2026 16:49:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIr3O-00000007SIc-25vf
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 01 May 2026 16:49:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=opHSGTf76BSBRHOR/K8cDc/74oddNS+hcFTu/fx8mdE=; b=VRZvZFESxBOEj7paHhhVu+7+WC
	fOMXsNTmrL2BuUM1TdIFtb2ToDu1sA92vd3oWSKsVUwJEFmjl5Sk1jguLCeM1wzu3mKRC/PRJP0fc
	qydR4h6IJBNgh2UeAkgsdqBQpsu+tVLgBP5tj4gy+lG0KhF/Qf6f+pyBj59hae/r90GqQxP31ZIXV
	tLL+IxjZjOR0oXROPOx66AGxz2Ilx2Gvndx13kpDuZbf+6DzT+gWJfvqnLAjjb5G7Mha30FhUxN5W
	sqoN8FiWQ7cXENk7TqBT4DnQ2xth1or3rhXMwe2MEU0kMyDOmdkqHfwMLZ3Mfap4H3p3y7kZw+u81
	HNE4Eb8Q==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIr3L-00000009BHA-0rjT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 May 2026 16:49:25 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DB969176A;
	Fri,  1 May 2026 09:49:16 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CCC753FB3E;
	Fri,  1 May 2026 09:49:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777654162; bh=VFJc97CFIGNvmE/+dvPACygGCWzyFMvSmONfcruW0ik=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=duJPuEBczJ8l6G/FJ/iMHiXTqUTGmIGLIbeZ6mwu83Q7WBHIsnnsP7XL+8rhjJtxw
	 nWj1kqeXLh4zG4OyLf0cEH7I1SIljIbC+3BO0qsVH4hG9m8qbxcfnOj2yznqPfEJmO
	 erHk9HnEXsz9kZq8PSpEkSZfiXrU6JiirrLG1ZsQ=
From: Leo Yan <leo.yan@arm.com>
Date: Fri, 01 May 2026 17:48:07 +0100
Subject: [PATCH v11 26/27] coresight: Move CPU hotplug callbacks to core
 layer
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260501-arm_coresight_path_power_management_improvement-v11-26-fc7fb9d5af1c@arm.com>
References: <20260501-arm_coresight_path_power_management_improvement-v11-0-fc7fb9d5af1c@arm.com>
In-Reply-To: <20260501-arm_coresight_path_power_management_improvement-v11-0-fc7fb9d5af1c@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777654086; l=9251;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=VFJc97CFIGNvmE/+dvPACygGCWzyFMvSmONfcruW0ik=;
 b=xl3B5QRP+SPHTn8bh8hSGPk90X0c5PGuFQrMFEXHQw+fMFL7Q103aXo79OHMP20a+9xnnOILi
 yw2AaK8hiLgAClkCq8+tNaDnmB7UUDRqp/fYd5q0SODTJifpIxHTb1z
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260501_174923_569678_221D7669 
X-CRM114-Status: GOOD (  24.24  )
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
returns active paths for the relevant mode.

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
 include/linux/cpuhotplug.h                         |  2 +-
 4 files changed, 40 insertions(+), 87 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index b2301ae0fd358242c59b9f4da99faae0db5ff894..015363da12fa8cb46e265bda9eb86c5e9abf0a63 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -1823,7 +1823,7 @@ static void coresight_release_device_list(void)
 	}
 }
 
-static struct coresight_path *coresight_cpu_get_active_path(void)
+static struct coresight_path *coresight_cpu_get_active_path(enum cs_mode mode)
 {
 	struct coresight_device *source;
 	bool is_active = false;
@@ -1832,17 +1832,17 @@ static struct coresight_path *coresight_cpu_get_active_path(void)
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
@@ -1961,7 +1961,8 @@ static void coresight_pm_restore(struct coresight_path *path)
 static int coresight_cpu_pm_notify(struct notifier_block *nb, unsigned long cmd,
 				   void *v)
 {
-	struct coresight_path *path = coresight_cpu_get_active_path();
+	struct coresight_path *path =
+		coresight_cpu_get_active_path(CS_MODE_SYSFS | CS_MODE_PERF);
 	int ret;
 
 	ret = coresight_pm_is_needed(path);
@@ -1988,13 +1989,42 @@ static struct notifier_block coresight_cpu_pm_nb = {
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
index 7c9e0af2f24556e27f6c1bcbb22044c52f13de12..266dec109232ed2e8761485a9ee58b80ba7b5141 100644
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
 static inline bool etm4_pm_save_needed(struct etmv4_drvdata *drvdata)
 {
 	return !!drvdata->save_state;
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


