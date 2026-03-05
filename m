Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 513D3F3092D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 10:18:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fz6JFb6A0ECOUNeLX2r9pTty7nGn7EzR0hWU0HvFPwE=; b=UhuLLmijXdgFbjY42n8I9XTllL
	6Udxf6sPnof3l44xJ3TUfEgfPab5fKo25QuHFBxwyukCa+oranPvfhQPi6JF4gDZDRIDghxN8ZtR2
	ZDFkR7/DYQsaFp/49LpaWd82oDal2cPxT0nBnClU2KNO7C7ZDlHDlsUAojG0OkXlMcaqapA734Z74
	47c4EzYg2dRnLFyfrjuBXJOgqIbykRZfq2HYX07DP1Tsct3eIGPtlFAz8BQcizzgCogVHZp09Upkr
	WivCo36BazE/nKgaok4MHRm+6VXl7BbrsIF/e2kwiFNEt3anCsN8WIITWRMblxol6eiM7K0olcJRA
	fF25VZNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy5ml-00000001YLj-2g0O;
	Thu, 05 Mar 2026 10:18:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy5mj-00000001YFp-1RWG
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 05 Mar 2026 10:18:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=Fz6JFb6A0ECOUNeLX2r9pTty7nGn7EzR0hWU0HvFPwE=; b=VMhHIKXiQoiud1OoEsrrTa9Pnl
	rgBFpJybZ3Rdmpav5QjNWZ/nmoFJP5UcfGflfk1ZGLAPzv+wPPXlLwSLwcnsgEg+6vtQUP57CyEOd
	xwAOJXEMwJRZzNExklYA6wiUH89hdRhgFD3dbIig6nO6xdjA3pwziufDsM05upKV0QlTAZ/FnJfhW
	bfRoIMkntGkmPUkHSusVrUJZE1uZgZhEHdS+l86Il334LakXFFLc2hLc/0xfhgJsPxe61jVW9PO+r
	8qEpm+O78Ut8G3FXqXh2/6w2H6Vwz7Ky5NZQLrbIQRRnwwCCGxzf2CsmnCQ6ObZDKemr34ZrfKioe
	poUUxhSQ==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy5mf-00000006SnB-3nl5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 10:18:23 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B5881497;
	Thu,  5 Mar 2026 02:18:14 -0800 (PST)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1FADE3F694;
	Thu,  5 Mar 2026 02:18:19 -0800 (PST)
From: Leo Yan <leo.yan@arm.com>
Date: Thu, 05 Mar 2026 10:17:47 +0000
Subject: [PATCH v6 16/19] coresight: trbe: Save and restore state across
 CPU low power state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-arm_coresight_path_power_management_improvement-v6-16-eff765d211a9@arm.com>
References: <20260305-arm_coresight_path_power_management_improvement-v6-0-eff765d211a9@arm.com>
In-Reply-To: <20260305-arm_coresight_path_power_management_improvement-v6-0-eff765d211a9@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>, 
 Yeoreum Yun <yeoreum.yun@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
 Will Deacon <will@kernel.org>, Yabin Cui <yabinc@google.com>, 
 Keita Morisaki <keyz@google.com>, 
 Yuanfang Zhang <quic_yuanfang@quicinc.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772705864; l=4072;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=NomkRO1bQb5sNzBNQKwNP0bWcEgUSXMct3kaDyqye1I=;
 b=BfhnWoLFk1k+tXjNgBDGtXi9YBUQrAWEixzDRuj/zJTq91JZLocBX10ByWNcHvDDmpB8bZb55
 NPFylxusVGlAFxeCxW3VMHr5ps9d3ia6c5IO2NE66dfXujZsZBSardo
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_101822_327570_CA40D576 
X-CRM114-Status: GOOD (  17.57  )
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

Given that some bit fields may be reset to an unknown value after a CPU
power cycle, this commit always save and restore all register contexts.

Signed-off-by: Yabin Cui <yabinc@google.com>
Co-developed-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-trbe.c | 59 +++++++++++++++++++++++++++-
 1 file changed, 58 insertions(+), 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
index fc6e3551b7002634bcf6a154080a142dfe32c890..8ce8074a298024fcb1df35f0243b68c7d80a3b58 100644
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


