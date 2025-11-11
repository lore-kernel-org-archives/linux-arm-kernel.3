Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31089CCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 18:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UfA96deVT2rGEENMCQOR3XCF8ZEIK5Uhga9RBv6VAZ8=; b=Rb46LqqWRZ2oxPjDFvi4pZSgtP
	99hGUMPBKDyEh7GtSgr8CO/ek5fuO/yNmhxjy+aaB06MCEYqasnvDZqhFc/zozXDDKWBM0EAO5UKw
	wLa5xDdRUY10RoYGouLV/o3G6K1hKzm2WZjd16IDBdaJI3s+NBH+kFn7rV9LygfxTeg4+DkJ5Bxla
	3t+OzTAkU7Ksu5Ae8yRE1UgNxYUhm9iars3HREaIGng711lTcQPVlg3g11/BuoTpK9q6MlRbmUrbD
	9SxqqWt+WK3EUv5vMHyhk9ShuOdYaNG6TByOEG0RNoCS7Kkp9Mwr4B7afGBZ/nX8ZjkziHOpPzyMQ
	9t2FAGMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vItab-00000007eVh-3XaV;
	Tue, 11 Nov 2025 18:59:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vItaX-00000007ePu-1sxH
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 11 Nov 2025 18:59:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=UfA96deVT2rGEENMCQOR3XCF8ZEIK5Uhga9RBv6VAZ8=; b=mC2b4YWiKqr/4VMX9CtzHNY0AM
	8m8rUVKxvDkNTb4XD6voGg/HEdFrLbkAPpw+TN74itQeE9+jYfhHERGy5rEXrZfHTHtr1airZ+mCC
	AFsGd7JkLBRFewuLN+lhSsf5YvUrX2QqM5DjV+xu0rkalWeSZ4ksBHYHiGdHMOHNFMpPv1BFE2+xB
	yANCxWVXQw7Latoe05xpv4/eCJc1fGi0giW0pg+o2C2Try5ZvBlbESyDDDCkrozZ51U4wEqwJNuFy
	ZX3JEkVD6IIVQdP5Mc/sS5oVPB1+dwWj0sz88VHkt3GC/rEWcUrYVeOlpC1xWf/I3Ro5O4w/tpdYU
	u+iyzbrA==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIsio-0000000E0sB-3Q1V
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Nov 2025 18:04:04 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D47BC497;
	Tue, 11 Nov 2025 10:59:21 -0800 (PST)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E720D3F63F;
	Tue, 11 Nov 2025 10:59:27 -0800 (PST)
From: Leo Yan <leo.yan@arm.com>
Date: Tue, 11 Nov 2025 18:58:45 +0000
Subject: [PATCH v6 11/11] coresight: etm4x: Reuse normal enable and disable
 logic in CPU idle
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251111-arm_coresight_power_management_fix-v6-11-f55553b6c8b3@arm.com>
References: <20251111-arm_coresight_power_management_fix-v6-0-f55553b6c8b3@arm.com>
In-Reply-To: <20251111-arm_coresight_power_management_fix-v6-0-f55553b6c8b3@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762887546; l=15506;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=EyLKM8ullWR7O5n5m7GOCSQaslDjUlCb0Eu85uK4SkE=;
 b=+Mkys6OurfEGHJFdC1P5gSXJOwKvMj37a2WXzlMZL3nREOwXEIsijyPyr2wsDyYSDE8ZKA6a2
 PwvXW6/bHIDB2uXJzZ1QjZBZs6xnWdR2wALGrRThr/YXJWT16l9VXjl
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_180403_265869_B409FF8C 
X-CRM114-Status: GOOD (  25.15  )
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

The etm4_enable_trace_unit() function is almost identical to the restore
flow, with a few differences listed below:

1) TRCQCTLR register

   The TRCQCTLR register is saved and restored during CPU idle, but it
   is never touched in the normal flow. Given the Q element is not
   enabled (TRCCONFIGR.QE bits), it is acceptable to omit saving and
   restoring this register during idle.

2) TRCSSCSRn.STATUS bit

   The restore flow does not explicitly clear the TRCSSCSRn.STATUS bit
   but instead directly loads the saved value. In contrast, the normal
   flow clears this bit to 0 when re-enabling single-shot control.

   Therefore, the restore function passes the restart_ss argument as
   false to etm4_enable_hw() to avoid re-enabling single-shot mode.

3) Claim Tag Handling

   The claim tag is acquired and released in normal flow, on the other
   hand, the claim protocol is not applied in CPU idle flow - it simply
   restores the saved value.

   The claim bits serve two purpose:

   * Exclusive access between the kernel driver and an external
     debugger. During CPU idle, the kernel driver locks the OS Lock,
     ensuring that the external debugger cannot access the trace unit.
     Therefore, it is safe to release the claim tag during idle.

   * Notification to supervisory software to save/restore context for
     external debuggers. The kernel driver does not touch the external
     debugger's claim bit (ETMCLAIM[0]).

   Based on this, it is safe to acquire and release claim tag in the
   idle sequence.

4) OS Lock Behavior

   The OS Lock should be locked during CPU idle states. This differs
   from the normal flow, which unlock it. This special handling remains
   in the CPU save path.

This commit reuses the normal enable and disable logic in the CPU idle
path. The common disable logic is moved into a new function
__etm4_disable_hw(), which omits the etm4_cs_{unlock|lock}() pairs and
is convenient to call from the save callback.

The resume callback sets the 'retain_ss_status' flag to avoid
restarting the single-shot mode, and then directly calls
etm4_enable_hw().

The save context in the driver data is no longer needed and has been
removed.

Tested-by: James Clark <james.clark@linaro.org>
Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 215 ++-------------------
 drivers/hwtracing/coresight/coresight-etm4x.h      |  57 ------
 2 files changed, 16 insertions(+), 256 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index afee54ac0aec0c0e521fa1885a95f48555a369de..1c17d54729200671ec6339f43755ea4267dd61dc 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -1002,7 +1002,7 @@ static void etm4_disable_trace_unit(struct etmv4_drvdata *drvdata)
 	isb();
 }
 
-static void etm4_disable_hw(struct etmv4_drvdata *drvdata)
+static void __etm4_disable_hw(struct etmv4_drvdata *drvdata)
 {
 	u32 control;
 	struct etmv4_config *config = &drvdata->config;
@@ -1010,7 +1010,6 @@ static void etm4_disable_hw(struct etmv4_drvdata *drvdata)
 	struct csdev_access *csa = &csdev->access;
 	int i;
 
-	etm4_cs_unlock(drvdata, csa);
 	etm4_disable_arch_specific(drvdata);
 
 	if (!drvdata->skip_power_up) {
@@ -1039,12 +1038,21 @@ static void etm4_disable_hw(struct etmv4_drvdata *drvdata)
 		config->seq_state = etm4x_relaxed_read32(csa, TRCSEQSTR);
 
 	coresight_disclaim_device_unlocked(csdev);
-	etm4_cs_lock(drvdata, csa);
 
 	dev_dbg(&drvdata->csdev->dev,
 		"cpu: %d disable smp call done\n", drvdata->cpu);
 }
 
+static void etm4_disable_hw(struct etmv4_drvdata *drvdata)
+{
+	struct coresight_device *csdev = drvdata->csdev;
+	struct csdev_access *csa = &csdev->access;
+
+	etm4_cs_unlock(drvdata, csa);
+	__etm4_disable_hw(drvdata);
+	etm4_cs_lock(drvdata, csa);
+}
+
 static void etm4_disable_sysfs_smp_call(void *info)
 {
 	struct etmv4_drvdata *drvdata = info;
@@ -1852,8 +1860,7 @@ static int etm4_dying_cpu(unsigned int cpu)
 
 static int __etm4_cpu_save(struct etmv4_drvdata *drvdata)
 {
-	int i, ret = 0;
-	struct etmv4_save_state *state;
+	int ret = 0;
 	struct coresight_device *csdev = drvdata->csdev;
 	struct csdev_access *csa;
 	struct device *etm_dev;
@@ -1884,91 +1891,7 @@ static int __etm4_cpu_save(struct etmv4_drvdata *drvdata)
 		goto out;
 	}
 
-	if (!drvdata->paused)
-		etm4_disable_trace_unit(drvdata);
-
-	state = drvdata->save_state;
-
-	if (drvdata->nr_pe)
-		state->trcprocselr = etm4x_read32(csa, TRCPROCSELR);
-	state->trcconfigr = etm4x_read32(csa, TRCCONFIGR);
-	state->trcauxctlr = etm4x_read32(csa, TRCAUXCTLR);
-	state->trceventctl0r = etm4x_read32(csa, TRCEVENTCTL0R);
-	state->trceventctl1r = etm4x_read32(csa, TRCEVENTCTL1R);
-	if (drvdata->stallctl)
-		state->trcstallctlr = etm4x_read32(csa, TRCSTALLCTLR);
-	state->trctsctlr = etm4x_read32(csa, TRCTSCTLR);
-	state->trcsyncpr = etm4x_read32(csa, TRCSYNCPR);
-	state->trcccctlr = etm4x_read32(csa, TRCCCCTLR);
-	state->trcbbctlr = etm4x_read32(csa, TRCBBCTLR);
-	state->trctraceidr = etm4x_read32(csa, TRCTRACEIDR);
-	if (drvdata->q_filt)
-		state->trcqctlr = etm4x_read32(csa, TRCQCTLR);
-
-	state->trcvictlr = etm4x_read32(csa, TRCVICTLR);
-	state->trcviiectlr = etm4x_read32(csa, TRCVIIECTLR);
-	state->trcvissctlr = etm4x_read32(csa, TRCVISSCTLR);
-	if (drvdata->nr_pe_cmp)
-		state->trcvipcssctlr = etm4x_read32(csa, TRCVIPCSSCTLR);
-
-	for (i = 0; i < drvdata->nrseqstate - 1; i++)
-		state->trcseqevr[i] = etm4x_read32(csa, TRCSEQEVRn(i));
-
-	if (drvdata->nrseqstate) {
-		state->trcseqrstevr = etm4x_read32(csa, TRCSEQRSTEVR);
-		state->trcseqstr = etm4x_read32(csa, TRCSEQSTR);
-	}
-
-	if (drvdata->numextinsel)
-		state->trcextinselr = etm4x_read32(csa, TRCEXTINSELR);
-
-	for (i = 0; i < drvdata->nr_cntr; i++) {
-		state->trccntrldvr[i] = etm4x_read32(csa, TRCCNTRLDVRn(i));
-		state->trccntctlr[i] = etm4x_read32(csa, TRCCNTCTLRn(i));
-		state->trccntvr[i] = etm4x_read32(csa, TRCCNTVRn(i));
-	}
-
-	/* Resource selector pair 0 is reserved */
-	for (i = 2; i < drvdata->nr_resource * 2; i++)
-		state->trcrsctlr[i] = etm4x_read32(csa, TRCRSCTLRn(i));
-
-	for (i = 0; i < drvdata->nr_ss_cmp; i++) {
-		state->trcssccr[i] = etm4x_read32(csa, TRCSSCCRn(i));
-		state->trcsscsr[i] = etm4x_read32(csa, TRCSSCSRn(i));
-		if (etm4x_sspcicrn_present(drvdata, i))
-			state->trcsspcicr[i] = etm4x_read32(csa, TRCSSPCICRn(i));
-	}
-
-	for (i = 0; i < drvdata->nr_addr_cmp * 2; i++) {
-		state->trcacvr[i] = etm4x_read64(csa, TRCACVRn(i));
-		state->trcacatr[i] = etm4x_read64(csa, TRCACATRn(i));
-	}
-
-	/*
-	 * Data trace stream is architecturally prohibited for A profile cores
-	 * so we don't save (or later restore) trcdvcvr and trcdvcmr - As per
-	 * section 1.3.4 ("Possible functional configurations of an ETMv4 trace
-	 * unit") of ARM IHI 0064D.
-	 */
-
-	for (i = 0; i < drvdata->numcidc; i++)
-		state->trccidcvr[i] = etm4x_read64(csa, TRCCIDCVRn(i));
-
-	for (i = 0; i < drvdata->numvmidc; i++)
-		state->trcvmidcvr[i] = etm4x_read64(csa, TRCVMIDCVRn(i));
-
-	state->trccidcctlr0 = etm4x_read32(csa, TRCCIDCCTLR0);
-	if (drvdata->numcidc > 4)
-		state->trccidcctlr1 = etm4x_read32(csa, TRCCIDCCTLR1);
-
-	state->trcvmidcctlr0 = etm4x_read32(csa, TRCVMIDCCTLR0);
-	if (drvdata->numvmidc > 4)
-		state->trcvmidcctlr0 = etm4x_read32(csa, TRCVMIDCCTLR1);
-
-	state->trcclaimset = etm4x_read32(csa, TRCCLAIMCLR);
-
-	if (!drvdata->skip_power_up)
-		state->trcpdcr = etm4x_read32(csa, TRCPDCR);
+	__etm4_disable_hw(drvdata);
 
 	/* wait for TRCSTATR.IDLE to go up */
 	if (etm4x_wait_status(csa, TRCSTATR_IDLE_BIT, 1)) {
@@ -1976,17 +1899,8 @@ static int __etm4_cpu_save(struct etmv4_drvdata *drvdata)
 			"timeout while waiting for Idle Trace Status\n");
 		etm4_os_unlock(drvdata);
 		ret = -EBUSY;
-		goto out;
 	}
 
-	/*
-	 * Power can be removed from the trace unit now. We do this to
-	 * potentially save power on systems that respect the TRCPDCR_PU
-	 * despite requesting software to save/restore state.
-	 */
-	if (!drvdata->skip_power_up)
-		etm4x_relaxed_write32(csa, (state->trcpdcr & ~TRCPDCR_PU),
-				      TRCPDCR);
 out:
 	etm4_cs_lock(drvdata, csa);
 	return ret;
@@ -2010,103 +1924,13 @@ static int etm4_cpu_save(struct etmv4_drvdata *drvdata)
 
 static void __etm4_cpu_restore(struct etmv4_drvdata *drvdata)
 {
-	int i;
-	struct etmv4_save_state *state = drvdata->save_state;
-	struct csdev_access *csa = &drvdata->csdev->access;
-
 	if (WARN_ON(!drvdata->csdev))
 		return;
 
-	etm4_cs_unlock(drvdata, csa);
-	etm4x_relaxed_write32(csa, state->trcclaimset, TRCCLAIMSET);
-
-	if (drvdata->nr_pe)
-		etm4x_relaxed_write32(csa, state->trcprocselr, TRCPROCSELR);
-	etm4x_relaxed_write32(csa, state->trcconfigr, TRCCONFIGR);
-	etm4x_relaxed_write32(csa, state->trcauxctlr, TRCAUXCTLR);
-	etm4x_relaxed_write32(csa, state->trceventctl0r, TRCEVENTCTL0R);
-	etm4x_relaxed_write32(csa, state->trceventctl1r, TRCEVENTCTL1R);
-	if (drvdata->stallctl)
-		etm4x_relaxed_write32(csa, state->trcstallctlr, TRCSTALLCTLR);
-	etm4x_relaxed_write32(csa, state->trctsctlr, TRCTSCTLR);
-	etm4x_relaxed_write32(csa, state->trcsyncpr, TRCSYNCPR);
-	etm4x_relaxed_write32(csa, state->trcccctlr, TRCCCCTLR);
-	etm4x_relaxed_write32(csa, state->trcbbctlr, TRCBBCTLR);
-	etm4x_relaxed_write32(csa, state->trctraceidr, TRCTRACEIDR);
-	if (drvdata->q_filt)
-		etm4x_relaxed_write32(csa, state->trcqctlr, TRCQCTLR);
-
-	etm4x_relaxed_write32(csa, state->trcvictlr, TRCVICTLR);
-	etm4x_relaxed_write32(csa, state->trcviiectlr, TRCVIIECTLR);
-	etm4x_relaxed_write32(csa, state->trcvissctlr, TRCVISSCTLR);
-	if (drvdata->nr_pe_cmp)
-		etm4x_relaxed_write32(csa, state->trcvipcssctlr, TRCVIPCSSCTLR);
-
-	for (i = 0; i < drvdata->nrseqstate - 1; i++)
-		etm4x_relaxed_write32(csa, state->trcseqevr[i], TRCSEQEVRn(i));
-
-	if (drvdata->nrseqstate) {
-		etm4x_relaxed_write32(csa, state->trcseqrstevr, TRCSEQRSTEVR);
-		etm4x_relaxed_write32(csa, state->trcseqstr, TRCSEQSTR);
-	}
-	if (drvdata->numextinsel)
-		etm4x_relaxed_write32(csa, state->trcextinselr, TRCEXTINSELR);
+	/* Instruct etm4_enable_hw() not to restart the single-shot mode */
+	drvdata->config.retain_ss_status = 1;
 
-	for (i = 0; i < drvdata->nr_cntr; i++) {
-		etm4x_relaxed_write32(csa, state->trccntrldvr[i], TRCCNTRLDVRn(i));
-		etm4x_relaxed_write32(csa, state->trccntctlr[i], TRCCNTCTLRn(i));
-		etm4x_relaxed_write32(csa, state->trccntvr[i], TRCCNTVRn(i));
-	}
-
-	/* Resource selector pair 0 is reserved */
-	for (i = 2; i < drvdata->nr_resource * 2; i++)
-		etm4x_relaxed_write32(csa, state->trcrsctlr[i], TRCRSCTLRn(i));
-
-	for (i = 0; i < drvdata->nr_ss_cmp; i++) {
-		etm4x_relaxed_write32(csa, state->trcssccr[i], TRCSSCCRn(i));
-		etm4x_relaxed_write32(csa, state->trcsscsr[i], TRCSSCSRn(i));
-		if (etm4x_sspcicrn_present(drvdata, i))
-			etm4x_relaxed_write32(csa, state->trcsspcicr[i], TRCSSPCICRn(i));
-	}
-
-	for (i = 0; i < drvdata->nr_addr_cmp * 2; i++) {
-		etm4x_relaxed_write64(csa, state->trcacvr[i], TRCACVRn(i));
-		etm4x_relaxed_write64(csa, state->trcacatr[i], TRCACATRn(i));
-	}
-
-	for (i = 0; i < drvdata->numcidc; i++)
-		etm4x_relaxed_write64(csa, state->trccidcvr[i], TRCCIDCVRn(i));
-
-	for (i = 0; i < drvdata->numvmidc; i++)
-		etm4x_relaxed_write64(csa, state->trcvmidcvr[i], TRCVMIDCVRn(i));
-
-	etm4x_relaxed_write32(csa, state->trccidcctlr0, TRCCIDCCTLR0);
-	if (drvdata->numcidc > 4)
-		etm4x_relaxed_write32(csa, state->trccidcctlr1, TRCCIDCCTLR1);
-
-	etm4x_relaxed_write32(csa, state->trcvmidcctlr0, TRCVMIDCCTLR0);
-	if (drvdata->numvmidc > 4)
-		etm4x_relaxed_write32(csa, state->trcvmidcctlr0, TRCVMIDCCTLR1);
-
-	etm4x_relaxed_write32(csa, state->trcclaimset, TRCCLAIMSET);
-
-	if (!drvdata->skip_power_up)
-		etm4x_relaxed_write32(csa, state->trcpdcr, TRCPDCR);
-
-	/*
-	 * As recommended by section 4.3.7 ("Synchronization when using the
-	 * memory-mapped interface") of ARM IHI 0064D
-	 */
-	dsb(sy);
-	isb();
-
-	/* Unlock the OS lock to re-enable trace and external debug access */
-	etm4_os_unlock(drvdata);
-
-	if (!drvdata->paused)
-		etm4_enable_trace_unit(drvdata);
-
-	etm4_cs_lock(drvdata, csa);
+	etm4_enable_hw(drvdata);
 }
 
 static void etm4_cpu_restore(struct etmv4_drvdata *drvdata)
@@ -2293,13 +2117,6 @@ static int etm4_probe(struct device *dev)
 		pm_save_enable = coresight_loses_context_with_cpu(dev) ?
 			       PARAM_PM_SAVE_SELF_HOSTED : PARAM_PM_SAVE_NEVER;
 
-	if (pm_save_enable != PARAM_PM_SAVE_NEVER) {
-		drvdata->save_state = devm_kmalloc(dev,
-				sizeof(struct etmv4_save_state), GFP_KERNEL);
-		if (!drvdata->save_state)
-			return -ENOMEM;
-	}
-
 	raw_spin_lock_init(&drvdata->spinlock);
 
 	drvdata->cpu = coresight_get_cpu(dev);
diff --git a/drivers/hwtracing/coresight/coresight-etm4x.h b/drivers/hwtracing/coresight/coresight-etm4x.h
index d82ec1559b34787dffc7debf4643d948e3850b2a..8d4a1f0f1e52a38a280b7fbe978129287a8ba60c 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x.h
+++ b/drivers/hwtracing/coresight/coresight-etm4x.h
@@ -864,61 +864,6 @@ struct etmv4_config {
 	u8				s_ex_level;
 };
 
-/**
- * struct etm4_save_state - state to be preserved when ETM is without power
- */
-struct etmv4_save_state {
-	u32	trcprocselr;
-	u32	trcconfigr;
-	u32	trcauxctlr;
-	u32	trceventctl0r;
-	u32	trceventctl1r;
-	u32	trcstallctlr;
-	u32	trctsctlr;
-	u32	trcsyncpr;
-	u32	trcccctlr;
-	u32	trcbbctlr;
-	u32	trctraceidr;
-	u32	trcqctlr;
-
-	u32	trcvictlr;
-	u32	trcviiectlr;
-	u32	trcvissctlr;
-	u32	trcvipcssctlr;
-
-	u32	trcseqevr[ETM_MAX_SEQ_STATES];
-	u32	trcseqrstevr;
-	u32	trcseqstr;
-	u32	trcextinselr;
-	u32	trccntrldvr[ETMv4_MAX_CNTR];
-	u32	trccntctlr[ETMv4_MAX_CNTR];
-	u32	trccntvr[ETMv4_MAX_CNTR];
-
-	u32	trcrsctlr[ETM_MAX_RES_SEL];
-
-	u32	trcssccr[ETM_MAX_SS_CMP];
-	u32	trcsscsr[ETM_MAX_SS_CMP];
-	u32	trcsspcicr[ETM_MAX_SS_CMP];
-
-	u64	trcacvr[ETM_MAX_SINGLE_ADDR_CMP];
-	u64	trcacatr[ETM_MAX_SINGLE_ADDR_CMP];
-	u64	trccidcvr[ETMv4_MAX_CTXID_CMP];
-	u64	trcvmidcvr[ETM_MAX_VMID_CMP];
-	u32	trccidcctlr0;
-	u32	trccidcctlr1;
-	u32	trcvmidcctlr0;
-	u32	trcvmidcctlr1;
-
-	u32	trcclaimset;
-
-	u32	cntr_val[ETMv4_MAX_CNTR];
-	u32	seq_state;
-	u32	vinst_ctrl;
-	u32	ss_status[ETM_MAX_SS_CMP];
-
-	u32	trcpdcr;
-};
-
 /**
  * struct etm4_drvdata - specifics associated to an ETM component
  * @pclk:       APB clock if present, otherwise NULL
@@ -981,7 +926,6 @@ struct etmv4_save_state {
  *		at runtime, due to the additional setting of TRFCR_CX when
  *		in EL2. Otherwise, 0.
  * @config:	structure holding configuration parameters.
- * @save_state:	State to be preserved across power loss
  * @skip_power_up: Indicates if an implementation can skip powering up
  *		   the trace unit.
  * @paused:	Indicates if the trace unit is paused.
@@ -1036,7 +980,6 @@ struct etmv4_drvdata {
 	bool				lpoverride;
 	u64				trfcr;
 	struct etmv4_config		config;
-	struct etmv4_save_state		*save_state;
 	bool				skip_power_up;
 	bool				paused;
 	DECLARE_BITMAP(arch_features, ETM4_IMPDEF_FEATURE_MAX);

-- 
2.34.1


