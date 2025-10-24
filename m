Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7062CCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Oct 2025 16:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rDWHL+FGYNpPVN24viydH0X2WrApCGhpBRyvNDDHtRM=; b=KaAJ8+pVlYF/daikfjiRf0l3JY
	R2qC0lxsbXLLJ0VBg7rEpRyXWH6jLDwGLAUR5ZeURFPnMYinzOPxIT5MFfmN5Bt3khRGbJ4Uwy+Ac
	Ji+DMFRJMzoljx4ITUBuz5LIZ322gTup63pUCN1V14lT0N9YDc5x4a3qcvCV+FQeaX6KytI/zU79y
	6Ri2v7MhamPwb6nnZ19b8MJH8sieeJNPQ/2KFm+NxnumTVi/FUMjTWieKm/9/XsvK9pjD5O2uFSfy
	cGTKKY0nMnnQrMxIIbEuEn932qy9Lcds9gULFFrk8TDzA6qhBwZOikMmXxwIeHahm9/126ve9xe8V
	Ewhvc6kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCKwA-0000000A11v-2TmC;
	Fri, 24 Oct 2025 16:46:46 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCKw1-0000000A0uL-2pZm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Oct 2025 16:46:39 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0D6BA175A;
	Fri, 24 Oct 2025 09:46:29 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 47DB13F66E;
	Fri, 24 Oct 2025 09:46:35 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
Date: Fri, 24 Oct 2025 17:45:55 +0100
Subject: [PATCH v4 07/11] coresight: etm4x: Properly control filter in CPU
 idle with FEAT_TRF
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251024-arm_coresight_power_management_fix-v4-7-690e69ae6977@arm.com>
References: <20251024-arm_coresight_power_management_fix-v4-0-690e69ae6977@arm.com>
In-Reply-To: <20251024-arm_coresight_power_management_fix-v4-0-690e69ae6977@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761324381; l=4934;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=IgLcxRSFvkIpKezlvsDGYW0oRRy2bNXOeDkHH6icN10=;
 b=xRDi1NS2zJjfKd/66UERM5bzz0owjEz+QyntVem0O0fuVqrCRd08ERbMtiQ3TwsARtQCd7QNL
 gWlQ6XpHgtbAwl3Ol5h0KW/jy3CWW/cx3h9DHERfMAWQp4GrT/HXk7L
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_094637_801100_6F5A07D9 
X-CRM114-Status: GOOD (  16.07  )
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
Reviewed-by: Mike Leach <mike.leach@linaro.org>
Tested-by: James Clark <james.clark@linaro.org>
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 28 ++++++++++++++++------
 drivers/hwtracing/coresight/coresight-etm4x.h      |  3 ---
 2 files changed, 21 insertions(+), 10 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index 7eb30e85bf03d1eda8212faa3c831338b70f86c3..df3260f2dfa72456c60fba4a8fa655fb6b48b95b 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -1882,9 +1882,18 @@ static int __etm4_cpu_save(struct etmv4_drvdata *drvdata)
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
@@ -1994,9 +2003,6 @@ static int etm4_cpu_save(struct etmv4_drvdata *drvdata)
 {
 	int ret = 0;
 
-	/* Save the TRFCR irrespective of whether the ETM is ON */
-	if (drvdata->trfcr)
-		drvdata->save_trfcr = read_trfcr();
 	/*
 	 * Save and restore the ETM Trace registers only if
 	 * the ETM is active.
@@ -2018,7 +2024,6 @@ static void __etm4_cpu_restore(struct etmv4_drvdata *drvdata)
 	etm4_cs_unlock(drvdata, csa);
 	etm4x_relaxed_write32(csa, state->trcclaimset, TRCCLAIMSET);
 
-	etm4x_relaxed_write32(csa, state->trcprgctlr, TRCPRGCTLR);
 	if (drvdata->nr_pe)
 		etm4x_relaxed_write32(csa, state->trcprocselr, TRCPROCSELR);
 	etm4x_relaxed_write32(csa, state->trcconfigr, TRCCONFIGR);
@@ -2103,13 +2108,22 @@ static void __etm4_cpu_restore(struct etmv4_drvdata *drvdata)
 
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
index 13ec9ecef46f5b60a38c464e8ebde3ef72e7d50b..b8796b4271025f6aba79fe3cd6e4d17d0b56952d 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x.h
+++ b/drivers/hwtracing/coresight/coresight-etm4x.h
@@ -866,7 +866,6 @@ struct etmv4_config {
  * struct etm4_save_state - state to be preserved when ETM is without power
  */
 struct etmv4_save_state {
-	u32	trcprgctlr;
 	u32	trcprocselr;
 	u32	trcconfigr;
 	u32	trcauxctlr;
@@ -980,7 +979,6 @@ struct etmv4_save_state {
  *		at runtime, due to the additional setting of TRFCR_CX when
  *		in EL2. Otherwise, 0.
  * @config:	structure holding configuration parameters.
- * @save_trfcr:	Saved TRFCR_EL1 register during a CPU PM event.
  * @save_state:	State to be preserved across power loss
  * @state_needs_restore: True when there is context to restore after PM exit
  * @skip_power_up: Indicates if an implementation can skip powering up
@@ -1037,7 +1035,6 @@ struct etmv4_drvdata {
 	bool				lpoverride;
 	u64				trfcr;
 	struct etmv4_config		config;
-	u64				save_trfcr;
 	struct etmv4_save_state		*save_state;
 	bool				state_needs_restore;
 	bool				skip_power_up;

-- 
2.34.1


