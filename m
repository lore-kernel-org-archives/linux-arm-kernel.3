Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DE6ECCFA04
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 15:23:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6ITH0xOWy8fGfc+DYIzHbgXbCb0+EoOdeaSeSJcyy+c=; b=O7kGXfMGQQy/oim3MlfmFBIyr0
	1MLCspOkxW5tI74BQ+pk0TeeUOmKZHuZl4JMW6p0/QG8rx7f9QBpXZrkJVZfohGfOlw3dJolKD3d7
	vSnmPYXw0NIs0RIqk96Bu8w/VqgXxU2cpCBHRMmBXWAfnkg7D18wnWmCoosqTHmc/ThMxaxeipWuj
	AgTm7ZYCpHmEe8Zqq1mRA2SKlwZfZfK1ZY3Ct6g9r4LIOiJ9L8ej5dQJUkW3BwHPYg7ozJ6088SlY
	s+SlkPZupWc97IRi2Nz77ZEGynbjenof3HmSG/MRnzdtW6UGpurdxauUc3UrYpsm7WrM5E6HlCCgh
	vphrYLIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGIsG-0000000C4ai-2BK5;
	Tue, 04 Nov 2025 15:23:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGIsD-0000000C4WS-3JPd
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 04 Nov 2025 15:23:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=6ITH0xOWy8fGfc+DYIzHbgXbCb0+EoOdeaSeSJcyy+c=; b=eRih7d0lBZNyuI77MTDSA8ImE+
	Y5fDK1bXSeIfIMZ2SMpTu6SAIU87LNTy6acVxf1BA+sg1op6utXeUiYYpxUA/fHtR9w82CfJw4Kzd
	p3T68/9oUQQ3C87BRGPofVElJSb4N/5uH/IW18S0BCVA9o/ySTXaAiulIxpOpAONuaN89EFMDxgij
	KNmMnA4ch7JgInQv6TEe+nUHWaixqCt7wOP5sEvIWIjIigWTxbdtd33MImnLxTmoqaYHK+iasN9uh
	+dWO4/iCPQCZYJ9rJWPH0TxOvIk0EYqQPnZbw2gjuNKK86d9nsIzxoS+kONOMk9RqjUd9X5lNV938
	StcO1Z/Q==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGI0T-00000000ISL-0Kel
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 14:27:35 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 515D22E99;
	Tue,  4 Nov 2025 07:22:53 -0800 (PST)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 75CED3F66E;
	Tue,  4 Nov 2025 07:22:59 -0800 (PST)
From: Leo Yan <leo.yan@arm.com>
Date: Tue, 04 Nov 2025 15:21:59 +0000
Subject: [PATCH v4 15/15] coresight: Move CPU hotplug callbacks to core
 layer
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251104-arm_coresight_path_power_management_improvement-v4-15-3d4bba674709@arm.com>
References: <20251104-arm_coresight_path_power_management_improvement-v4-0-3d4bba674709@arm.com>
In-Reply-To: <20251104-arm_coresight_path_power_management_improvement-v4-0-3d4bba674709@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, 
 Yeoreum Yun <yeoreum.yun@arm.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Yabin Cui <yabinc@google.com>, Keita Morisaki <keyz@google.com>, 
 Yuanfang Zhang <quic_yuanfang@quicinc.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762269750; l=4910;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=A3xsbIiQQnLr5LjS2fG+zWafCEQTaRpeLR4WlH+16fQ=;
 b=aSD0VGuZCZ+Jfb17TSd9H+Ug4Kg8YScnGbErVM1KiVpIT5m+jU8KB/lMAtxgUzbgxkvHVcGoR
 173Gvp7FgNQA+qEmFlLKRtRutHMz5xztxtGQYunIxIECv5iNYrzD9ut
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_142733_528558_D110D7CF 
X-CRM114-Status: GOOD (  18.89  )
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

The core layer disables a source and the path when hotplug-off a CPU.

When hotplug-in a CPU, it does not re-enable even the trace was enabled
before hotplug-off, in this case, users are asked to re-enable the trace
via Sysfs interface.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-core.c       | 41 +++++++++++++++++++++-
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 37 -------------------
 2 files changed, 40 insertions(+), 38 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index 7095f9befa98c7d638f857466351ef7cd960fde7..9149f028031808dc2b7285f621b97f3631a02b01 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -1726,6 +1726,32 @@ static void coresight_pm_restore(struct coresight_device *csdev)
 	coresight_ops(csdev)->pm_restore_enable(csdev);
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
+	return 0;
+}
+
 static int coresight_cpu_pm_notify(struct notifier_block *nb, unsigned long cmd,
 				   void *v)
 {
@@ -1757,11 +1783,24 @@ static struct notifier_block coresight_cpu_pm_nb = {
 
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
 
diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index 7bea3d2c6f49a2169b8e3de1cb07cc22147aae3a..1730cee3c3e1845efb2be815553085aba1246cca 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -1802,33 +1802,6 @@ static int etm4_online_cpu(unsigned int cpu)
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
-		etm4_enable_hw(etmdrvdata[cpu], true);
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
@@ -1915,13 +1888,6 @@ static int __init etm4_pm_setup(void)
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
@@ -1932,14 +1898,11 @@ static int __init etm4_pm_setup(void)
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


