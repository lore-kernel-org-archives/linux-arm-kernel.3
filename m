Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31411CAC597
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 10:34:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=enSQQgsO1SJ4Qx3Dqa+OVGWaJW5IZsHix8PK1qcDRBI=; b=gCwqKZBenPrEQdMzzSomRQMUVA
	w/whJMko+8n4LY6wXMjRSLepZT1H5EGHLQhLelbfsDMEy60qn+kxUtBXmEwRe0iYOFj6hE/6O5jGe
	ewvHcjk3PPnfK6rxmLUQr6oBD9Foalsvqe9B6u4ZNReow/1xXAF1NuKLHrFEjT0mo2d01MFlKessI
	eIWR9V79sfW25Lu5MC+Vo1Vn4WA9nl0i/hyUyfxElwWr8SA4WHpCFHPiqsxhUHpFu8vmD+WpeR0N7
	x9fqNGsC1lDBviowJEA4k3NiU4YbwYy4aocnQtPXX1urlCoV0YbVHv+k4bIL67zYOAbMgIUckBbL1
	BYU+8Vfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy6X3-00000003fXS-28Yz;
	Mon, 15 Sep 2025 10:34:01 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy6Wy-00000003fRq-07Ip
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 10:33:57 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2C9451C2B;
	Mon, 15 Sep 2025 03:33:47 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C6B5F3F66E;
	Mon, 15 Sep 2025 03:33:53 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
Date: Mon, 15 Sep 2025 11:33:30 +0100
Subject: [PATCH v3 07/31] coresight: etm4x: Properly control filter in CPU
 idle with FEAT_TRF
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250915-arm_coresight_power_management_fix-v3-7-ea49e91124ec@arm.com>
References: <20250915-arm_coresight_power_management_fix-v3-0-ea49e91124ec@arm.com>
In-Reply-To: <20250915-arm_coresight_power_management_fix-v3-0-ea49e91124ec@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757932420; l=4836;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=I4uG4XpSIDL0lysrn24RVyAUqho0wBsHh047W+QMO1Y=;
 b=13X0/oQ5K0IDRvL/XslxZDE4sq4V5YESVz6KpdSCTBDenMgYZhPC7TsRUCVxMJOAXew/Xhw7k
 0MAa8AIZE7TD5wf9NcpgW52R+biXGXckMZifpoS5R+cwhhDsfmTaCux
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_033356_799292_EFF7963B 
X-CRM114-Status: GOOD (  16.53  )
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
index 999bceef4cd771e46aec891f4c814a95e0921c2f..2d2ef58393db10d058b3e29c5b270dd2d62e1a49 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -1884,9 +1884,18 @@ static int __etm4_cpu_save(struct etmv4_drvdata *drvdata)
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
@@ -1996,9 +2005,6 @@ static int etm4_cpu_save(struct etmv4_drvdata *drvdata)
 {
 	int ret = 0;
 
-	/* Save the TRFCR irrespective of whether the ETM is ON */
-	if (drvdata->trfcr)
-		drvdata->save_trfcr = read_trfcr();
 	/*
 	 * Save and restore the ETM Trace registers only if
 	 * the ETM is active.
@@ -2020,7 +2026,6 @@ static void __etm4_cpu_restore(struct etmv4_drvdata *drvdata)
 	etm4_cs_unlock(drvdata, csa);
 	etm4x_relaxed_write32(csa, state->trcclaimset, TRCCLAIMSET);
 
-	etm4x_relaxed_write32(csa, state->trcprgctlr, TRCPRGCTLR);
 	if (drvdata->nr_pe)
 		etm4x_relaxed_write32(csa, state->trcprocselr, TRCPROCSELR);
 	etm4x_relaxed_write32(csa, state->trcconfigr, TRCCONFIGR);
@@ -2105,13 +2110,22 @@ static void __etm4_cpu_restore(struct etmv4_drvdata *drvdata)
 
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


