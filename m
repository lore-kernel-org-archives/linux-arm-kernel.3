Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B068DCD343F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 20:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EMismW8HkxP/yFkvR3p139QO6M1p1PaYPXOJ62/0Ziw=; b=toDkk8Sm2b/kLW65h8nGPUeOzK
	hDbN6hhAP5IgZkfy3+w9iaA4+U7UikANWZEZ/1aojUNkzVj37lKxXtch4Bpmtjs0/rbVh5+PwuPXe
	NhK6p69rItCNNcSG2M46I2pboE0gWKgAWK2QJim3R/RBipXz4jMyzzWmKtGtTzyssFcH/lgZT2y1D
	ogIWA4AhHU263QnPk2jTi4jPOAlID8U8qPUE8fE51+KLkrhfLaTNHkLxqH91+rFellPBCostKFY+Y
	4VS1Sw+u29AjZiIFWL0Ort3BAsDaTko4VFq1LWEuLW2ykyR0RwvaQ2JG3stiUx1dJZecVKCY1qrSI
	2pjLSd0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNyr7-00000009Jsf-2MJ0;
	Fri, 15 May 2026 20:09:57 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNyqu-00000009JfR-19jt
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 20:09:47 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6162035EA;
	Fri, 15 May 2026 13:09:38 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C38403F836;
	Fri, 15 May 2026 13:09:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778875783; bh=I7aYP9mp0z56D9AcW/2a/0bxYrIXHyqvCTfb0qU5e18=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=TqdxB1lYdSqcHNHo04ceRejzQshy3Okky2T2DqZSKlsbi/ymeRhP8IgmGY6FLZ5JC
	 cujRsd3Fw7Pa13hvLZlVNWbPvWeelRP9suT9CU2DCueDnAeGCiCuJ+t4kCBbVL9meP
	 yOIoL2WV1nEQwp8Tn9QFO0Hl50FHBWtWgrEivwEw=
From: Leo Yan <leo.yan@arm.com>
Date: Fri, 15 May 2026 21:08:32 +0100
Subject: [PATCH v14 25/28] coresight: trbe: Save and restore state across
 CPU low power state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-arm_coresight_path_power_management_improvement-v14-25-f88c4a3ecfe9@arm.com>
References: <20260515-arm_coresight_path_power_management_improvement-v14-0-f88c4a3ecfe9@arm.com>
In-Reply-To: <20260515-arm_coresight_path_power_management_improvement-v14-0-f88c4a3ecfe9@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778875700; l=4297;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=xgjbwD2a6uEV290nE4U3jB8MUYLNI0NRgYU9oyroU3g=;
 b=5MrN17tsQbTC7SeHOathdWRS6syKbAea6YmCS3ryhS/bsYqcT91yYg7v5JhcCbKY96Ezr/BGM
 AI772a9UOr1AdDUc+4W8CviraJGzx/gKsedNA68VkepdDgkVJApx7Ef
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_130944_416568_99D027EA 
X-CRM114-Status: GOOD (  18.30  )
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

TRBE context can be lost when a CPU enters low power states.  If a trace
source is restored while TRBE is not, tracing may run without an active
sink, which can lead to hangs on some devices (e.g., Pixel 9).

The save and restore flows are described in the section K5.5 "Context
switching" of Arm ARM (ARM DDI 0487 L.a). This commit adds save and
restore callbacks with following the software usages defined in the
architecture manual.

During the restore flow, since TRBLIMITR_EL1.E resets to 0 on a warm
reset, the trace buffer unit is disabled when idle resume, it is safe to
restore base/pointer/status registers first and program TRBLIMITR_EL1
last.

Signed-off-by: Yabin Cui <yabinc@google.com>
Tested-by: James Clark <james.clark@linaro.org>
Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
Reviewed-by: James Clark <james.clark@linaro.org>
Co-developed-by: Leo Yan <leo.yan@arm.com>
Tested-by: Jie Gan <jie.gan@oss.qualcomm.com>
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-trbe.c | 59 +++++++++++++++++++++++++++-
 1 file changed, 58 insertions(+), 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
index 14e35b9660d76e47619cc6026b94929b3bb3e02b..c7cbca45f2debd4047b93283ea9fe5dd9e1f2ebf 100644
--- a/drivers/hwtracing/coresight/coresight-trbe.c
+++ b/drivers/hwtracing/coresight/coresight-trbe.c
@@ -116,6 +116,20 @@ static int trbe_errata_cpucaps[] = {
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
@@ -134,6 +148,7 @@ struct trbe_cpudata {
 	enum cs_mode mode;
 	struct trbe_buf *buf;
 	struct trbe_drvdata *drvdata;
+	struct trbe_save_state save_state;
 	DECLARE_BITMAP(errata, TRBE_ERRATA_MAX);
 };
 
@@ -1189,6 +1204,46 @@ static irqreturn_t arm_trbe_irq_handler(int irq, void *dev)
 	return IRQ_HANDLED;
 }
 
+static int arm_trbe_save(struct coresight_device *csdev)
+{
+	struct trbe_cpudata *cpudata = dev_get_drvdata(&csdev->dev);
+	struct trbe_save_state *state = &cpudata->save_state;
+
+	state->trblimitr = read_sysreg_s(SYS_TRBLIMITR_EL1);
+
+	/* Disable the unit, ensure the writes to memory are complete */
+	if (state->trblimitr & TRBLIMITR_EL1_E)
+		trbe_drain_and_disable_local(cpudata);
+
+	state->trbbaser = read_sysreg_s(SYS_TRBBASER_EL1);
+	state->trbptr = read_sysreg_s(SYS_TRBPTR_EL1);
+	state->trbsr = read_sysreg_s(SYS_TRBSR_EL1);
+	return 0;
+}
+
+static void arm_trbe_restore(struct coresight_device *csdev)
+{
+	struct trbe_cpudata *cpudata = dev_get_drvdata(&csdev->dev);
+	struct trbe_save_state *state = &cpudata->save_state;
+
+	write_sysreg_s(state->trbbaser, SYS_TRBBASER_EL1);
+	write_sysreg_s(state->trbptr, SYS_TRBPTR_EL1);
+	write_sysreg_s(state->trbsr, SYS_TRBSR_EL1);
+
+	if (!(state->trblimitr & TRBLIMITR_EL1_E)) {
+		write_sysreg_s(state->trblimitr, SYS_TRBLIMITR_EL1);
+	} else {
+		/*
+		 * The section K5.5 Context switching, Arm ARM (ARM DDI 0487
+		 * L.a), S_PKLXF requires a Context synchronization event to
+		 * guarantee the Trace Buffer Unit will observe the new values
+		 * of the system registers.
+		 */
+		isb();
+		set_trbe_enabled(cpudata, state->trblimitr);
+	}
+}
+
 static const struct coresight_ops_sink arm_trbe_sink_ops = {
 	.enable		= arm_trbe_enable,
 	.disable	= arm_trbe_disable,
@@ -1198,7 +1253,9 @@ static const struct coresight_ops_sink arm_trbe_sink_ops = {
 };
 
 static const struct coresight_ops arm_trbe_cs_ops = {
-	.sink_ops	= &arm_trbe_sink_ops,
+	.pm_save_disable	= arm_trbe_save,
+	.pm_restore_enable	= arm_trbe_restore,
+	.sink_ops		= &arm_trbe_sink_ops,
 };
 
 static ssize_t align_show(struct device *dev, struct device_attribute *attr, char *buf)

-- 
2.34.1


