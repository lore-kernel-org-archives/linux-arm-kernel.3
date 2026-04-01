Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90E3E109B497
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 18:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AeE4x1k+5lIDC8eNdBLts9nA1lG0Rg5HtnHiFFYlcXE=; b=Bo12B9JBOlQNX0U6UVvYqoWwT7
	Pa+GsT3X4599ULB4oNqzdeG/y0ezqBzo7KwWzYN0vG0HGys559WvIOKjOWNxI9ruOGw5zdSay3QBw
	cZ270SU+vxmLB/mcewLazc8NPBnhHignUY1NgZTOFIqwB3EscA37hY5oLLVAn1D+aV60iIGU2tvoO
	lx/AqQQfWtVa/f40Fwkwok4cin4ZK4OYr8eK1lkEc/GANMRUherjLWagIlEEAhUmDM8uC5o4+fVHN
	xQWF5/CGhTiKkEXxQrYIA4jELarckeILE/WCXQH7tTEhLz4KSm4RHz8u9tbWgzHjI/WzV5cjTBdAD
	FjTT7WVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7zxD-0000000FuhQ-2Mwr;
	Wed, 01 Apr 2026 18:06:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7zx9-0000000Fuc9-3DAG
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 01 Apr 2026 18:06:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=AeE4x1k+5lIDC8eNdBLts9nA1lG0Rg5HtnHiFFYlcXE=; b=IEq9NXTzUaw7h/wlvIaJz7xPhJ
	QQ1qoYp06ffqMDCJnFJFJGUIlZNLiISdYLlvwAxsET45HsjSG1W7zvdV5K884c2uaDMJeZ8qhlm2b
	ue9BeGhQ8azhjhamgVfUlY6QfHaU6mhu4mo2mmdRgOLSAtX2RlBZ2zi6kHt0xE1GLNeWpgVZs+pVG
	KXGGT72BgI/KQ4ZPr7wUVMxlZIoLs+19EARGLiGK2Hz6m+62Xps7iB1CV8dw1zwFplCfzzo7Ys6Yy
	24ZRGwTaLzsqTod2M2pfRGeyy7mUOpl4qQYRKUPk7s2S0ZPOBHV1TAGACohWf/GC7zF2qN1ny9/Ck
	xqVDY7aQ==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7zx6-000000014Vp-24kL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Apr 2026 18:06:06 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8F2C21A25;
	Wed,  1 Apr 2026 11:05:57 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6676A3F7D8;
	Wed,  1 Apr 2026 11:06:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775066763; bh=YRgxCUECametv2/t2kqX2UJN7Txn6p9AxN2syZGQOfc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=df+9T0nZYv0E7LuEHHTePTbMdq2Uw7y+KCgusmYNKVR1EOgijCCpsgxdsm1WjF1wZ
	 ewcdndvfDVbQbm3VkfSkic9Ksm9HwwtsnJOC4ba5+lI6NWjMvPkCAFmi4lAcl6DCUT
	 A/MvKtwT2LTkDNAE0vZPg3IgBMm5Cgfj6v34jCV8=
From: Leo Yan <leo.yan@arm.com>
Date: Wed, 01 Apr 2026 19:05:37 +0100
Subject: [PATCH v9 08/20] coresight: etm4x: Hook CPU PM callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260401-arm_coresight_path_power_management_improvement-v9-8-091d73e44072@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775066742; l=4252;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=YRgxCUECametv2/t2kqX2UJN7Txn6p9AxN2syZGQOfc=;
 b=+HS+3NAVvd5bkWToPU67Y24/HhsQ656va93jntax7KFNTyjHBfuMKG0t8IWVrMKN7ZStFVWDB
 f8EmX7/J2rjB1pwcymy9m3XBqaKkDzuXUoIVrOMrNUWGOrYAPoUPFj1
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_190604_896542_EDC7B4A0 
X-CRM114-Status: GOOD (  16.47  )
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

Hook the CPU save and restore callbacks when the self-hosted state is
enabled (pm_save_enable == PARAM_PM_SAVE_SELF_HOSTED) so they can be
invoked by the core layer.

The CPU PM notifier in the ETMv4 driver is no longer needed, remove it
along with its registration and unregistration code.

Reviewed-by: James Clark <james.clark@linaro.org>
Tested-by: James Clark <james.clark@linaro.org>
Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 59 +++++-----------------
 1 file changed, 13 insertions(+), 46 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index 7b91fab9895d7b2a65ebb1161b117d9d3f5fca1b..6d13fa29d178627e3f0918d265634ab63e24803d 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -1203,7 +1203,7 @@ static const struct coresight_ops_source etm4_source_ops = {
 	.pause_perf	= etm4_pause_perf,
 };
 
-static const struct coresight_ops etm4_cs_ops = {
+static struct coresight_ops etm4_cs_ops = {
 	.trace_id	= coresight_etm_get_trace_id,
 	.source_ops	= &etm4_source_ops,
 };
@@ -2003,8 +2003,9 @@ static int __etm4_cpu_save(struct etmv4_drvdata *drvdata)
 	return ret;
 }
 
-static int etm4_cpu_save(struct etmv4_drvdata *drvdata)
+static int etm4_cpu_save(struct coresight_device *csdev)
 {
+	struct etmv4_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
 	int ret = 0;
 
 	if (pm_save_enable != PARAM_PM_SAVE_SELF_HOSTED)
@@ -2120,8 +2121,10 @@ static void __etm4_cpu_restore(struct etmv4_drvdata *drvdata)
 	etm4_cs_lock(drvdata, csa);
 }
 
-static void etm4_cpu_restore(struct etmv4_drvdata *drvdata)
+static void etm4_cpu_restore(struct coresight_device *csdev)
 {
+	struct etmv4_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
+
 	if (pm_save_enable != PARAM_PM_SAVE_SELF_HOSTED)
 		return;
 
@@ -2129,55 +2132,17 @@ static void etm4_cpu_restore(struct etmv4_drvdata *drvdata)
 		__etm4_cpu_restore(drvdata);
 }
 
-static int etm4_cpu_pm_notify(struct notifier_block *nb, unsigned long cmd,
-			      void *v)
-{
-	struct etmv4_drvdata *drvdata;
-	unsigned int cpu = smp_processor_id();
-
-	if (!etmdrvdata[cpu])
-		return NOTIFY_OK;
-
-	drvdata = etmdrvdata[cpu];
-
-	if (WARN_ON_ONCE(drvdata->cpu != cpu))
-		return NOTIFY_BAD;
-
-	switch (cmd) {
-	case CPU_PM_ENTER:
-		if (etm4_cpu_save(drvdata))
-			return NOTIFY_BAD;
-		break;
-	case CPU_PM_EXIT:
-	case CPU_PM_ENTER_FAILED:
-		etm4_cpu_restore(drvdata);
-		break;
-	default:
-		return NOTIFY_DONE;
-	}
-
-	return NOTIFY_OK;
-}
-
-static struct notifier_block etm4_cpu_pm_nb = {
-	.notifier_call = etm4_cpu_pm_notify,
-};
-
 /* Setup PM. Deals with error conditions and counts */
 static int __init etm4_pm_setup(void)
 {
 	int ret;
 
-	ret = cpu_pm_register_notifier(&etm4_cpu_pm_nb);
-	if (ret)
-		return ret;
-
 	ret = cpuhp_setup_state_nocalls(CPUHP_AP_ARM_CORESIGHT_STARTING,
 					"arm/coresight4:starting",
 					etm4_starting_cpu, etm4_dying_cpu);
 
 	if (ret)
-		goto unregister_notifier;
+		return ret;
 
 	ret = cpuhp_setup_state_nocalls(CPUHP_AP_ONLINE_DYN,
 					"arm/coresight4:online",
@@ -2191,15 +2156,11 @@ static int __init etm4_pm_setup(void)
 
 	/* failed dyn state - remove others */
 	cpuhp_remove_state_nocalls(CPUHP_AP_ARM_CORESIGHT_STARTING);
-
-unregister_notifier:
-	cpu_pm_unregister_notifier(&etm4_cpu_pm_nb);
 	return ret;
 }
 
 static void etm4_pm_clear(void)
 {
-	cpu_pm_unregister_notifier(&etm4_cpu_pm_nb);
 	cpuhp_remove_state_nocalls(CPUHP_AP_ARM_CORESIGHT_STARTING);
 	if (hp_online) {
 		cpuhp_remove_state_nocalls(hp_online);
@@ -2311,6 +2272,12 @@ static int etm4_probe(struct device *dev)
 				sizeof(struct etmv4_save_state), GFP_KERNEL);
 		if (!drvdata->save_state)
 			return -ENOMEM;
+
+		/* Setup CPU PM callbacks */
+		if (!etm4_cs_ops.pm_save_disable) {
+			etm4_cs_ops.pm_save_disable = etm4_cpu_save;
+			etm4_cs_ops.pm_restore_enable = etm4_cpu_restore;
+		}
 	}
 
 	raw_spin_lock_init(&drvdata->spinlock);

-- 
2.34.1


