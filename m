Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE72EE81BD3
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Feb 2026 18:01:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rl6RF5QDPXvjR003X+adFKfUN1VVLmaYRYa92Oxn8c0=; b=NyQzOf57iFBqzJFepds5K7/SWE
	3oHJF04rhmvyDUOWCHeYpotFnMWdnyay+6ij8PidUj6gdgnLJBKd/f6bmno8b6Vtpq0iS89BJfrto
	aQUn4P9rTch91lX3KDw5sn91xj2zW2V6Z6CmHQwPUJGIJb/0VUiMFfn4rNgmf9TqCX02A4Dy70fCr
	hw7MQEBTvpCkvNvva7BAcwq9w8yV6Ecz0kZjEqlWYCFvEbzMP2oi1xX0m7fUPPXRzC+pCNqPDr4vB
	6rHzrl0BMBVhamWyejXLotZkNuwvRJtzBB1MFK9VrSyJKI7j847kzHxJKZg0MLCKny3ZJEWqp8Rb3
	jY89qStQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpVZr-0000000FowT-2opb;
	Mon, 09 Feb 2026 18:01:39 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpVZo-0000000FouC-3ig3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Feb 2026 18:01:38 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BBDF6497;
	Mon,  9 Feb 2026 10:01:29 -0800 (PST)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 151EE3F63F;
	Mon,  9 Feb 2026 10:01:33 -0800 (PST)
From: Leo Yan <leo.yan@arm.com>
Date: Mon, 09 Feb 2026 18:01:14 +0000
Subject: [PATCH 4/8] coresight: cti: Remove CPU power management code
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260209-arm_coresight_cti_refactor_v1-v1-4-db71ab4d200b@arm.com>
References: <20260209-arm_coresight_cti_refactor_v1-v1-0-db71ab4d200b@arm.com>
In-Reply-To: <20260209-arm_coresight_cti_refactor_v1-v1-0-db71ab4d200b@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Tingwei Zhang <quic_tingwei@quicinc.com>, 
 Yingchao Deng <yingchao.deng@oss.qualcomm.com>, 
 Jie Gan <jie.gan@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770660084; l=7460;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=SSkMQr1rTvpHtLSfdjSwI0fBtXOFg/h/JfLgqYuaa9s=;
 b=QcHQ+c+Gf+J9GrwoCmGDExOKnFsSmx9kUwHhucMIs3JXrmj+wLeHVttO+xHCJojMzHXqxvPKB
 mjZgK/9txAiBysEP4A/7afCio2yU5dzteYcm0J1CtrHogopyNq0JsWt
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_100137_020440_2D1708D8 
X-CRM114-Status: GOOD (  20.75  )
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

According Arm ARM, the CTI ASICCTL register:

  "It is IMPLEMENTATION DEFINED whether ASICCTL is implemented in the
   Core power domain or in the Debug power domain."

This is the only CTI register that may reside in the core power domain.
However, it has been confirmed that Arm designed CTIs place ASICCTL in
the debug power domain.  Furthermore, ASICCTL is implemented only when
CTIDEVID.EXTMUXNUM is non-zero, which is a rare case for CPU CTIs.

For these reasons, it is safe to conclude that all CTI registers are not
located in the CPU power domain. Therefore, the CTI driver does not need
CPU power management.

This commit removes the CPU power management from CTI driver.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-cti-core.c | 186 +----------------------
 1 file changed, 3 insertions(+), 183 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-cti-core.c b/drivers/hwtracing/coresight/coresight-cti-core.c
index 1950e9b757ae4879a2671ddaf5675c54aa7956d5..3becef607e5ec5225cb6fd616da804903651fdf1 100644
--- a/drivers/hwtracing/coresight/coresight-cti-core.c
+++ b/drivers/hwtracing/coresight/coresight-cti-core.c
@@ -42,12 +42,6 @@ static DEFINE_MUTEX(ect_mutex);
 #define csdev_to_cti_drvdata(csdev)	\
 	dev_get_drvdata(csdev->dev.parent)
 
-/* power management handling */
-static int nr_cti_cpu;
-
-/* quick lookup list for CPU bound CTIs when power handling */
-static struct cti_drvdata *cti_cpu_drvdata[NR_CPUS];
-
 /*
  * CTI naming. CTI bound to cores will have the name cti_cpu<N> where
  * N is the CPU ID. System CTIs will have the name cti_sys<I> where I
@@ -113,28 +107,6 @@ static int cti_enable_hw(struct cti_drvdata *drvdata)
 	return 0;
 }
 
-/* re-enable CTI on CPU when using CPU hotplug */
-static void cti_cpuhp_enable_hw(struct cti_drvdata *drvdata)
-{
-	struct cti_config *config = &drvdata->config;
-
-	guard(raw_spinlock_irqsave)(&drvdata->spinlock);
-
-	config->hw_powered = true;
-
-	/* no need to do anything if no enable request */
-	if (!drvdata->config.enable_req_count)
-		return;
-
-	/* try to claim the device */
-	if (coresight_claim_device(drvdata->csdev))
-		return;
-
-	cti_write_all_hw_regs(drvdata);
-	config->hw_enabled = true;
-	return;
-}
-
 /* disable hardware */
 static int cti_disable_hw(struct cti_drvdata *drvdata)
 {
@@ -652,146 +624,6 @@ static void cti_remove_conn_xrefs(struct cti_drvdata *drvdata)
 	}
 }
 
-/** cti PM callbacks **/
-static int cti_cpu_pm_notify(struct notifier_block *nb, unsigned long cmd,
-			     void *v)
-{
-	struct cti_drvdata *drvdata;
-	struct coresight_device *csdev;
-	unsigned int cpu = smp_processor_id();
-	int notify_res = NOTIFY_OK;
-
-	if (!cti_cpu_drvdata[cpu])
-		return NOTIFY_OK;
-
-	drvdata = cti_cpu_drvdata[cpu];
-	csdev = drvdata->csdev;
-
-	if (WARN_ON_ONCE(drvdata->ctidev.cpu != cpu))
-		return NOTIFY_BAD;
-
-	guard(raw_spinlock_irqsave)(&drvdata->spinlock);
-
-	switch (cmd) {
-	case CPU_PM_ENTER:
-		/* CTI regs all static - we have a copy & nothing to save */
-		drvdata->config.hw_powered = false;
-		if (drvdata->config.hw_enabled)
-			coresight_disclaim_device(csdev);
-		break;
-
-	case CPU_PM_ENTER_FAILED:
-		drvdata->config.hw_powered = true;
-		if (drvdata->config.hw_enabled) {
-			if (coresight_claim_device(csdev))
-				drvdata->config.hw_enabled = false;
-		}
-		break;
-
-	case CPU_PM_EXIT:
-		/* write hardware registers to re-enable. */
-		drvdata->config.hw_powered = true;
-		drvdata->config.hw_enabled = false;
-
-		/* check enable reference count to enable HW */
-		if (drvdata->config.enable_req_count) {
-			/* check we can claim the device as we re-power */
-			if (coresight_claim_device(csdev))
-				goto cti_notify_exit;
-
-			drvdata->config.hw_enabled = true;
-			cti_write_all_hw_regs(drvdata);
-		}
-		break;
-
-	default:
-		notify_res = NOTIFY_DONE;
-		break;
-	}
-
-cti_notify_exit:
-	return notify_res;
-}
-
-static struct notifier_block cti_cpu_pm_nb = {
-	.notifier_call = cti_cpu_pm_notify,
-};
-
-/* CPU HP handlers */
-static int cti_starting_cpu(unsigned int cpu)
-{
-	struct cti_drvdata *drvdata = cti_cpu_drvdata[cpu];
-
-	if (!drvdata)
-		return 0;
-
-	cti_cpuhp_enable_hw(drvdata);
-	return 0;
-}
-
-static int cti_dying_cpu(unsigned int cpu)
-{
-	struct cti_drvdata *drvdata = cti_cpu_drvdata[cpu];
-
-	if (!drvdata)
-		return 0;
-
-	guard(raw_spinlock_irqsave)(&drvdata->spinlock);
-
-	drvdata->config.hw_powered = false;
-	if (drvdata->config.hw_enabled)
-		coresight_disclaim_device(drvdata->csdev);
-
-	return 0;
-}
-
-static int cti_pm_setup(struct cti_drvdata *drvdata)
-{
-	int ret;
-
-	if (drvdata->ctidev.cpu == -1)
-		return 0;
-
-	if (nr_cti_cpu)
-		goto done;
-
-	cpus_read_lock();
-	ret = cpuhp_setup_state_nocalls_cpuslocked(
-			CPUHP_AP_ARM_CORESIGHT_CTI_STARTING,
-			"arm/coresight_cti:starting",
-			cti_starting_cpu, cti_dying_cpu);
-	if (ret) {
-		cpus_read_unlock();
-		return ret;
-	}
-
-	ret = cpu_pm_register_notifier(&cti_cpu_pm_nb);
-	cpus_read_unlock();
-	if (ret) {
-		cpuhp_remove_state_nocalls(CPUHP_AP_ARM_CORESIGHT_CTI_STARTING);
-		return ret;
-	}
-
-done:
-	nr_cti_cpu++;
-	cti_cpu_drvdata[drvdata->ctidev.cpu] = drvdata;
-
-	return 0;
-}
-
-/* release PM registrations */
-static void cti_pm_release(struct cti_drvdata *drvdata)
-{
-	if (drvdata->ctidev.cpu == -1)
-		return;
-
-	cti_cpu_drvdata[drvdata->ctidev.cpu] = NULL;
-	if (--nr_cti_cpu == 0) {
-		cpu_pm_unregister_notifier(&cti_cpu_pm_nb);
-		cpuhp_remove_state_nocalls(CPUHP_AP_ARM_CORESIGHT_CTI_STARTING);
-	}
-}
-
 /** cti ect operations **/
 int cti_enable(struct coresight_device *csdev, enum cs_mode mode,
 	       struct coresight_path *path)
@@ -827,7 +659,6 @@ static void cti_device_release(struct device *dev)
 	struct cti_drvdata *ect_item, *ect_tmp;
 
 	mutex_lock(&ect_mutex);
-	cti_pm_release(drvdata);
 
 	/* remove from the list */
 	list_for_each_entry_safe(ect_item, ect_tmp, &ect_net, node) {
@@ -906,17 +737,12 @@ static int cti_probe(struct amba_device *adev, const struct amba_id *id)
 	if (!cti_desc.name)
 		return -ENOMEM;
 
-	/* setup CPU power management handling for CPU bound CTI devices. */
-	ret = cti_pm_setup(drvdata);
-	if (ret)
-		return ret;
-
 	/* create dynamic attributes for connections */
 	ret = cti_create_cons_sysfs(dev, drvdata);
 	if (ret) {
 		dev_err(dev, "%s: create dynamic sysfs entries failed\n",
 			cti_desc.name);
-		goto pm_release;
+		return ret;
 	}
 
 	/* set up coresight component description */
@@ -929,10 +755,8 @@ static int cti_probe(struct amba_device *adev, const struct amba_id *id)
 
 	coresight_clear_self_claim_tag(&cti_desc.access);
 	drvdata->csdev = coresight_register(&cti_desc);
-	if (IS_ERR(drvdata->csdev)) {
-		ret = PTR_ERR(drvdata->csdev);
-		goto pm_release;
-	}
+	if (IS_ERR(drvdata->csdev))
+		return PTR_ERR(drvdata->csdev);
 
 	/* add to list of CTI devices */
 	mutex_lock(&ect_mutex);
@@ -949,10 +773,6 @@ static int cti_probe(struct amba_device *adev, const struct amba_id *id)
 	pm_runtime_put(&adev->dev);
 	dev_info(&drvdata->csdev->dev, "CTI initialized\n");
 	return 0;
-
-pm_release:
-	cti_pm_release(drvdata);
-	return ret;
 }
 
 static struct amba_cs_uci_id uci_id_cti[] = {

-- 
2.34.1


