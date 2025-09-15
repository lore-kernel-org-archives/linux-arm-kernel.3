Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA334CAC597
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 10:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gt2x5xZd/v2bmnGIxxVUmzvvl/9NBd0wuPTtAlZjLXc=; b=pGMkk+yBuK/Xdl+/KYx4pX8moO
	jdtugdYErDw5aelqAtUidiSSK+ednw1H70XoSDpD+8wRBCdnCvCmQOmQ9T0xeXXQYut5HaVRHtsi0
	hsFgvfW/x10S/S19DHY5mlsIDj5CItxiGH8wvzqSDjlkWvxc2uwXxgd6/WlqyGgD4ysuILEncm0nV
	X+dtuHokcu9xwFjGioVBURBwL7lkuiXHV25iP1CRn/yNSeeOKrFdFbBopYrePPuXEQ6/MICxMwKF4
	Lzd1PDLdIAumG63cPyA6cm69lE5Oc61c40ebiZFclstC96kMTi/wpQwIqa91WYLuVFUwAPkIL/yYf
	EcCzK0hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy6Y0-00000003gol-3U7p;
	Mon, 15 Sep 2025 10:35:00 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy6Xb-00000003gDN-3Hq0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 10:34:37 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3BF431BF7;
	Mon, 15 Sep 2025 03:34:27 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D341C3F66E;
	Mon, 15 Sep 2025 03:34:33 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
Date: Mon, 15 Sep 2025 11:33:51 +0100
Subject: [PATCH v3 28/31] coresight: trbe: Save and restore state across
 CPU low power state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250915-arm_coresight_power_management_fix-v3-28-ea49e91124ec@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757932420; l=4449;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=hZnW+5gP7PQiip7l5HcrbNDH/Hmts/Od4HFW8qyYt2g=;
 b=X7a9YOAskgBRUW2S/MjjycLsfEB/+j61axZMXThaeFuOMHX87RuvdUgGU7x4DVyhLf0242RJN
 cphPihftOOQBeoNQCTbGUTPtmqUjIAW0gtIxkdhVmqZkznveuoZBFY5
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_033435_939970_3A8989B4 
X-CRM114-Status: GOOD (  16.51  )
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

From: Yabin Cui <yabinc@google.com>

Similar to ETE, TRBE may lose its context when a CPU enters low power
state. To make things worse, if ETE is restored without TRBE being
restored, an enabled source device with no enabled sink devices can
cause CPU hang on some devices (e.g., Pixel 9).

The save and restore flows are described in the section K5.5 "Context
switching" of Arm ARM (ARM DDI 0487 L.a). This commit adds save and
restore callbacks with following the software usages defined in the
architecture manual.

Signed-off-by: Yabin Cui <yabinc@google.com>
Co-developed-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-trbe.c | 84 ++++++++++++++++++++++++++++
 1 file changed, 84 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
index 3fd379f327eb4f82665b216856d43ec39e4e7d10..5d103f2bb0a9bc851e4d3e9d13a93412bb71b8ed 100644
--- a/drivers/hwtracing/coresight/coresight-trbe.c
+++ b/drivers/hwtracing/coresight/coresight-trbe.c
@@ -115,6 +115,20 @@ static int trbe_errata_cpucaps[] = {
  */
 #define TRBE_WORKAROUND_OVERWRITE_FILL_MODE_SKIP_BYTES	256
 
+/*
+ * struct trbe_save_state: Register values representing TRBE state
+ * @trblimitr		- Trace Buffer Limit Address Register value
+ * @trbbaser		- Trace Buffer Base Register value
+ * @trbptr		- Trace Buffer Write Pointer Register value
+ * @trbsr		- Trace Buffer Status Register value
+ */
+struct trbe_save_state {
+	u64 trblimitr;
+	u64 trbbaser;
+	u64 trbptr;
+	u64 trbsr;
+};
+
 /*
  * struct trbe_cpudata: TRBE instance specific data
  * @trbe_flag		- TRBE dirty/access flag support
@@ -133,6 +147,7 @@ struct trbe_cpudata {
 	enum cs_mode mode;
 	struct trbe_buf *buf;
 	struct trbe_drvdata *drvdata;
+	struct trbe_save_state save_state;
 	DECLARE_BITMAP(errata, TRBE_ERRATA_MAX);
 };
 
@@ -1188,12 +1203,81 @@ static irqreturn_t arm_trbe_irq_handler(int irq, void *dev)
 	return IRQ_HANDLED;
 }
 
+static int arm_trbe_save(struct coresight_device *csdev)
+{
+	struct trbe_cpudata *cpudata = dev_get_drvdata(&csdev->dev);
+	struct trbe_save_state *state = &cpudata->save_state;
+
+	if (cpudata->mode == CS_MODE_DISABLED)
+		return 0;
+
+	/*
+	 * According to the section K5.5 Context switching, Arm ARM (ARM DDI
+	 * 0487 L.a), the software usage VKHHY requires a TSB CSYNC instruction
+	 * to ensure the program-flow trace is flushed, which has been executed
+	 * in ETM driver.
+	 */
+
+	/* Disable trace buffer unit */
+	state->trblimitr = read_sysreg_s(SYS_TRBLIMITR_EL1);
+	write_sysreg_s(state->trblimitr & ~TRBLIMITR_EL1_E, SYS_TRBLIMITR_EL1);
+
+	/*
+	 * Execute a further Context synchronization event. Ensure the writes to
+	 * memory are complete.
+	 */
+	trbe_drain_buffer();
+
+	/* Synchronize the TRBE disabling */
+	isb();
+
+	state->trbbaser = read_sysreg_s(SYS_TRBBASER_EL1);
+	state->trbptr = read_sysreg_s(SYS_TRBPTR_EL1);
+	state->trbsr = read_sysreg_s(SYS_TRBSR_EL1);
+	return 0;
+}
+
+static int arm_trbe_restore(struct coresight_device *csdev)
+{
+	struct trbe_cpudata *cpudata = dev_get_drvdata(&csdev->dev);
+	struct trbe_save_state *state = &cpudata->save_state;
+
+	if (cpudata->mode == CS_MODE_DISABLED)
+		return 0;
+
+	write_sysreg_s(state->trbbaser, SYS_TRBBASER_EL1);
+	write_sysreg_s(state->trbptr, SYS_TRBPTR_EL1);
+	write_sysreg_s(state->trbsr, SYS_TRBSR_EL1);
+	write_sysreg_s(state->trblimitr & ~TRBLIMITR_EL1_E, SYS_TRBLIMITR_EL1);
+
+	/*
+	 * According to the section K5.5 Context switching, Arm ARM (ARM DDI
+	 * 0487 L.a), the software usage PKLXF requires a Context
+	 * synchronization event to guarantee the Trace Buffer Unit will observe
+	 * the new values of the System registers.
+	 */
+	isb();
+
+	/* Enable the Trace Buffer Unit */
+	write_sysreg_s(state->trblimitr, SYS_TRBLIMITR_EL1);
+
+	/* Synchronize the TRBE enable event */
+	isb();
+
+	if (trbe_needs_ctxt_sync_after_enable(cpudata))
+		isb();
+
+	return 0;
+}
+
 static const struct coresight_ops_sink arm_trbe_sink_ops = {
 	.enable		= arm_trbe_enable,
 	.disable	= arm_trbe_disable,
 	.alloc_buffer	= arm_trbe_alloc_buffer,
 	.free_buffer	= arm_trbe_free_buffer,
 	.update_buffer	= arm_trbe_update_buffer,
+	.save		= arm_trbe_save,
+	.restore	= arm_trbe_restore,
 };
 
 static const struct coresight_ops arm_trbe_cs_ops = {

-- 
2.34.1


