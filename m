Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46849C83038
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 16:43:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oK53X7braw4Bsn+WTKLpj1VjSJfGiWXpIZd+pWrsvxw=; b=W7IH5wmITlbWzMVUoCONKpajCU
	sQ2ymLckV/ZurfkTxvsWaSDwGgDyrY2ZOsm2ycV0JCDFXhIMmO66ZDrEuHLQSlXeTH/1YIrVeUqu+
	mjNgsQ2pK5yUR6FEqru0Ex9gu3AjXQFvWQ83Js45bvabL3eY+zFzZVj7DBv+G6Ud0BJXnUKFAi064
	M38i6UaWnLWQqJxM2JgxLOWBDMfT0WG0s28Q8H6WvH9RRk7N6bm3tXoHVEJmZgz+bPaB7dMKQLiXL
	Fmwp7lhFEaC+nDCqwROmp6Gil5me5kfHBPqxpYcUUoF9lZEtVYtb2Tym+9wS26arjh7sEUjZDxnrr
	Yk6UFDSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWe4w-000000065JY-3yKt;
	Tue, 01 Jul 2025 16:43:30 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWcN4-00000005mj3-2Vjg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 14:54:07 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E980212FC;
	Tue,  1 Jul 2025 07:53:50 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3A7193F66E;
	Tue,  1 Jul 2025 07:54:04 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
Date: Tue, 01 Jul 2025 15:53:32 +0100
Subject: [PATCH v2 07/28] coresight: etm4x: Properly control filter in CPU
 idle with FEAT_TRF
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250701-arm_cs_pm_fix_v3-v2-7-23ebb864fcc1@arm.com>
References: <20250701-arm_cs_pm_fix_v3-v2-0-23ebb864fcc1@arm.com>
In-Reply-To: <20250701-arm_cs_pm_fix_v3-v2-0-23ebb864fcc1@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, 
 Levi Yun <yeoreum.yun@arm.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Yabin Cui <yabinc@google.com>, Keita Morisaki <keyz@google.com>, 
 Yuanfang Zhang <quic_yuanfang@quicinc.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751381627; l=4836;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=BqleQhyDumPHbLJDugJW+CZ4s3i1pvXMNPBBYFbmyH0=;
 b=utbokSSdqJds9R2oxP1FugD5viiNN3uOwhh9yzRbKLTOOJaB3tdNWAKUkL+Axe7VMxXs+05+v
 237DvJsILrhDCg0bh+OlpTbh+/ZMnVk01xp1fE3ANgAWQ/qU7pifSzC
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_075406_726454_5649C897 
X-CRM114-Status: GOOD (  16.97  )
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

If a CPU supports FEAT_TRF, as described in the section K5.5 "Context
switching", Arm ARM (ARM DDI 0487 L.a), it defines a flow to prohibit
program-flow trace, execute a TSB CSYNC instruction for flushing,
followed by clearing TRCPRGCTLR.EN bit.

To restore the state, the reverse sequence is required.

This differs from the procedure described in the section 3.4.1 "The
procedure when powering down the PE" of ARM IHI0064H.b, which involves
the OS Lock to prevent external debugger accesses and implicitly
disables trace.

To be compatible with different ETM versions, explicitly control trace
unit using etm4_disable_trace_unit() and etm4_enable_trace_unit()
during CPU idle to comply with FEAT_TRF.

As a result, the save states for TRFCR_ELx and trcprgctlr are redundant,
remove them.

Fixes: f188b5e76aae ("coresight: etm4x: Save/restore state across CPU low power states")
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 28 ++++++++++++++++------
 drivers/hwtracing/coresight/coresight-etm4x.h      |  3 ---
 2 files changed, 21 insertions(+), 10 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index e3a73718d0c903ee9c72b97028b56565f5ee1053..6cd76a2527cf11752963a7cb1b3b0e9a8be241f0 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -1881,9 +1881,18 @@ static int __etm4_cpu_save(struct etmv4_drvdata *drvdata)
 		goto out;
 	}
 
+	if (!drvdata->paused)
+		etm4_disable_trace_unit(drvdata);
+
+	/*
+	 * As recommended by section 4.3.7 (Synchronization of register updates)
+	 * of ARM IHI 0064H.b, the self-hosted trace analyzer always executes an
+	 * ISB instruction after programming the trace unit registers.
+	 */
+	isb();
+
 	state = drvdata->save_state;
 
-	state->trcprgctlr = etm4x_read32(csa, TRCPRGCTLR);
 	if (drvdata->nr_pe)
 		state->trcprocselr = etm4x_read32(csa, TRCPROCSELR);
 	state->trcconfigr = etm4x_read32(csa, TRCCONFIGR);
@@ -1991,9 +2000,6 @@ static int etm4_cpu_save(struct etmv4_drvdata *drvdata)
 {
 	int ret = 0;
 
-	/* Save the TRFCR irrespective of whether the ETM is ON */
-	if (drvdata->trfcr)
-		drvdata->save_trfcr = read_trfcr();
 	/*
 	 * Save and restore the ETM Trace registers only if
 	 * the ETM is active.
@@ -2015,7 +2021,6 @@ static void __etm4_cpu_restore(struct etmv4_drvdata *drvdata)
 	etm4_cs_unlock(drvdata, csa);
 	etm4x_relaxed_write32(csa, state->trcclaimset, TRCCLAIMSET);
 
-	etm4x_relaxed_write32(csa, state->trcprgctlr, TRCPRGCTLR);
 	if (drvdata->nr_pe)
 		etm4x_relaxed_write32(csa, state->trcprocselr, TRCPROCSELR);
 	etm4x_relaxed_write32(csa, state->trcconfigr, TRCCONFIGR);
@@ -2099,13 +2104,22 @@ static void __etm4_cpu_restore(struct etmv4_drvdata *drvdata)
 
 	/* Unlock the OS lock to re-enable trace and external debug access */
 	etm4_os_unlock(drvdata);
+
+	if (!drvdata->paused)
+		etm4_enable_trace_unit(drvdata);
+
+	/*
+	 * As recommended by section 4.3.7 (Synchronization of register updates)
+	 * of ARM IHI 0064H.b, the self-hosted trace analyzer always executes an
+	 * ISB instruction after programming the trace unit registers.
+	 */
+	isb();
+
 	etm4_cs_lock(drvdata, csa);
 }
 
 static void etm4_cpu_restore(struct etmv4_drvdata *drvdata)
 {
-	if (drvdata->trfcr)
-		write_trfcr(drvdata->save_trfcr);
 	if (drvdata->state_needs_restore)
 		__etm4_cpu_restore(drvdata);
 }
diff --git a/drivers/hwtracing/coresight/coresight-etm4x.h b/drivers/hwtracing/coresight/coresight-etm4x.h
index ac649515054d905fa365203bd35f1d839b03292f..4d32605a84ce91eae2101cd83cad5f5317e2638a 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x.h
+++ b/drivers/hwtracing/coresight/coresight-etm4x.h
@@ -865,7 +865,6 @@ struct etmv4_config {
  * struct etm4_save_state - state to be preserved when ETM is without power
  */
 struct etmv4_save_state {
-	u32	trcprgctlr;
 	u32	trcprocselr;
 	u32	trcconfigr;
 	u32	trcauxctlr;
@@ -978,7 +977,6 @@ struct etmv4_save_state {
  *		at runtime, due to the additional setting of TRFCR_CX when
  *		in EL2. Otherwise, 0.
  * @config:	structure holding configuration parameters.
- * @save_trfcr:	Saved TRFCR_EL1 register during a CPU PM event.
  * @save_state:	State to be preserved across power loss
  * @state_needs_restore: True when there is context to restore after PM exit
  * @skip_power_up: Indicates if an implementation can skip powering up
@@ -1033,7 +1031,6 @@ struct etmv4_drvdata {
 	bool				lpoverride;
 	u64				trfcr;
 	struct etmv4_config		config;
-	u64				save_trfcr;
 	struct etmv4_save_state		*save_state;
 	bool				state_needs_restore;
 	bool				skip_power_up;

-- 
2.34.1


