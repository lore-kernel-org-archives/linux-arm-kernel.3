Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADA2BFC591A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 09:24:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2231+xC95O7VFOcXgC8Y9IfifnVhQ7USzf4Koap6nsA=; b=dYhAsGuyR27lDEK57UH88MK0C3
	0eG1+X/0nOIUyL13mhXf6Bp4or57BnO0LmFW6jcm5WuSea0PrjThlk7+usMUj3k5lz9T4S+AluMn/
	1UMZ4+gLWjEYM8Dq+9o1iizE6OEYznaF6Hn/0SaqiXbHuj0UfuKURHMaKAXSx01FvdznTLonpN73G
	wSwhJX9DpDhFzGXfy768Ei6oqaZdQL4o31nR0DqYFojC8dmKPGxV/0ZjcLVSeLk8a30eO1qiQZg15
	1bML4Aagpp0cFnijltXvvEEYoBKuHwlvO0j38c4Y8olj+Jibzc8PC3+US30Qzp9ZDac8H7hCGNG84
	H5NfjSFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvXbT-00000005myz-1sG6;
	Thu, 26 Feb 2026 09:24:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvXbQ-00000005mxI-2bSj
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 26 Feb 2026 09:24:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=2231+xC95O7VFOcXgC8Y9IfifnVhQ7USzf4Koap6nsA=; b=dzliB1E0XkVyontUBnddNMrE8N
	Z68zZuA7HjUT1g41q+V26fyHSIyTCLgxaGkIEaZuiIrbSiVgWiCiEVweKe0+XPGFyjqvUXzE+yZB2
	Xl2GuA5TQeDVb5osbyNQMAFUOvQ+tZLzQ+nYD1dGAjHmOG7GGs2N9SwZyTr47FOBnskLQ91DK0uYF
	UY72U+38lmenzl04wbqvIKyWIvU8ew9UHZUQ/La02ADk5yD/Rvd99on9O1yC6VGU+Vg8ZMby3JUzW
	VnWKiLVJL4RIfnluNe5bqxL/DRec8tIlJyzkq1WpG9vuh/uLWVuy/74P2oktQCclPf2I/RC5tPjjN
	TfWZaF7w==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvXbN-0000000AbTs-2NCn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 09:24:11 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DB6F4153B;
	Thu, 26 Feb 2026 01:24:01 -0800 (PST)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 541C03F62B;
	Thu, 26 Feb 2026 01:24:06 -0800 (PST)
From: Leo Yan <leo.yan@arm.com>
Date: Thu, 26 Feb 2026 09:23:52 +0000
Subject: [PATCH v2 4/8] coresight: cti: Remove CPU power management code
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260226-arm_coresight_cti_refactor_v1-v2-4-b30fada3cfec@arm.com>
References: <20260226-arm_coresight_cti_refactor_v1-v2-0-b30fada3cfec@arm.com>
In-Reply-To: <20260226-arm_coresight_cti_refactor_v1-v2-0-b30fada3cfec@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Tingwei Zhang <quic_tingwei@quicinc.com>, 
 Yingchao Deng <yingchao.deng@oss.qualcomm.com>, 
 Jie Gan <jie.gan@oss.qualcomm.com>, Yabin Cui <yabinc@google.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772097837; l=7475;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=mdbLwyTm6Utwn6BUDv5t9NwB7q+u7LCs3OuT4P2ZvRA=;
 b=nlM+vxhL9vvs7OOBgAjuPhOHGzP19a0i3NykDPUlOltCrLeqeumj6soRz+56HC/Swqm5Eslz5
 LeZIbWvV/8kB/dIpQSPDf+CYgTgR6rm3RI6d7pFW83l9VMS/BZeFZ3w
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_092410_003223_605F32DD 
X-CRM114-Status: GOOD (  20.62  )
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

Reviewed-by: Mike Leach <mike.leach@arm.com>
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-cti-core.c | 186 +----------------------
 1 file changed, 3 insertions(+), 183 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-cti-core.c b/drivers/hwtracing/coresight/coresight-cti-core.c
index 726970d852dee3b962e5147311dfadd0b741cfe0..3aa081f28a18dc4987feeb57244aa384e80702ac 100644
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
 /* write set of regs to hardware - call with spinlock claimed */
 void cti_write_all_hw_regs(struct cti_drvdata *drvdata)
 {
@@ -104,28 +98,6 @@ static int cti_enable_hw(struct cti_drvdata *drvdata)
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
@@ -643,146 +615,6 @@ static void cti_remove_conn_xrefs(struct cti_drvdata *drvdata)
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
@@ -815,7 +647,6 @@ static void cti_remove(struct amba_device *adev)
 
 	mutex_lock(&ect_mutex);
 	cti_remove_conn_xrefs(drvdata);
-	cti_pm_release(drvdata);
 
 	/* remove from the list */
 	list_for_each_entry_safe(ect_item, ect_tmp, &ect_net, node) {
@@ -889,17 +720,12 @@ static int cti_probe(struct amba_device *adev, const struct amba_id *id)
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
@@ -912,10 +738,8 @@ static int cti_probe(struct amba_device *adev, const struct amba_id *id)
 
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
@@ -928,10 +752,6 @@ static int cti_probe(struct amba_device *adev, const struct amba_id *id)
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


