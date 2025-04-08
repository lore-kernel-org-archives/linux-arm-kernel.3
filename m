Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67386C369A2
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 13:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QpjJOYg7jSkUYji4gBAVIjaJF8y07XmWIjQukpjQ2aE=; b=umfSm/mYJE8+ajEUdXfrP74vYk
	8B2zCyhqv9CS6XLJw4iOrbO/aHD8iFQmBLZmJPtsInDqAR0LMRZRuedoivC6yFOIPv090LGDq9X56
	mW5g4JNv/JcS7D6wgFhTF8wEh5BGOABY5Bf6dV8mns44aHW5n/Ep+Ro+C/mwDglvqR7EoMpvCAjh3
	SvtlSyAFFjOGafOo66dF80mPqU7Ow8zNR/tb/886hBnvT8zKNeUIwn43dtH3QS09C3Wf35EQrOp81
	WVIiP3jikf1whv8HxTG+fsOBED85M8op+mBG55qNankFDWFOpPQOpHd+Vb/IalD1rHDUy6mKh4EdK
	klh+Vutg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u28wP-00000004Bq4-1Z6w;
	Tue, 08 Apr 2025 13:24:37 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u289m-00000003zwF-1AlA;
	Tue, 08 Apr 2025 12:34:28 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1744115650; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=cQOKXw2kNB40VGHmExQtPmKe232vDxf0VfzoCaO7IqJTtTz2oLyXDZSbXyqLEGKx2KIim5unx2g1Fhq5FBZVy+f/BqAcRaXFPKrQMgbzJYUlaIOd9Da4dSgZIgd3z3x2joaQ/BgvZ2TDVyzXxbDd2o8D5zI28MBwA+gC+UJB5V0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1744115650; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=QpjJOYg7jSkUYji4gBAVIjaJF8y07XmWIjQukpjQ2aE=; 
	b=W9s7torYJp67W2w2tjq5HndWhNBKGV+cQ/B8vlSDbg6Uh/ci67Pv79dwp1c8ONBwuUUwCDNnzisDCKGJFsqwC0iQVAejfTvTKuCXkYlRbi5GBHJstzrqfVOXNO+W7jPUPQT9c9G+p2vuyqo7u1ROAX4CSLQ036JnS7gxm64/KdU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1744115650;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=QpjJOYg7jSkUYji4gBAVIjaJF8y07XmWIjQukpjQ2aE=;
	b=SGdh3oYlFNTj7WsGnpRHIFLIIV2vVJd5IQsMa2bnfkHLswVCsdGboRzILbO01a3e
	GAaPYjet8JKkqr768YQHGEdua1jTfnr2cLCIO3ExxfcEPAlu3Z1esruF69wMPCsC2rX
	DuI6WZQzYC6RqZOxi82CCe9QHE5WPy4xDxdganxo=
Received: by mx.zohomail.com with SMTPS id 1744115648789996.6677210966698;
	Tue, 8 Apr 2025 05:34:08 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Tue, 08 Apr 2025 14:32:18 +0200
Subject: [PATCH 6/7] counter: Add rockchip-pwm-capture driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-rk3576-pwm-v1-6-a49286c2ca8e@collabora.com>
References: <20250408-rk3576-pwm-v1-0-a49286c2ca8e@collabora.com>
In-Reply-To: <20250408-rk3576-pwm-v1-0-a49286c2ca8e@collabora.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 William Breathitt Gray <wbg@kernel.org>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Kever Yang <kever.yang@rock-chips.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org, 
 linux-iio@vger.kernel.org, kernel@collabora.com, 
 Jonas Karlman <jonas@kwiboo.se>, 
 Detlev Casanova <detlev.casanova@collabora.com>, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_053422_389536_CC3DB4FD 
X-CRM114-Status: GOOD (  37.79  )
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

Among many other things, Rockchip's new PWMv4 IP in the RK3576 supports
PWM capture functionality.

Add a basic driver for this that works to capture period and duty cycle
values and return them as nanoseconds to the user. It's quite basic, but
works well enough to demonstrate the device function exclusion stuff
that mfpwm does, in order to eventually support all the functions of
this device in drivers within their appropriate subsystems, without them
interfering with each other.

Once enabled, the counter driver waits for enough high-to-low and
low-to-high interrupt signals to arrive, and then writes the cycle count
register values into some atomic members of the driver instance's state
struct. The read callback can then do the conversion from cycle count to
the more useful period and duty cycle nanosecond values, which require
knowledge of the clock rate, which requires a call that the interrupt
handler cannot make itself because said call may sleep.

To detect the condition of a PWM signal disappearing, i.e. turning off,
we modify the delay value of a delayed worker whose job it is to simply
set those atomic members to zero. Should the "timeout" so to speak be
reached, we assume the PWM signal is off. This isn't perfect; it
obviously introduces a latency between it being off and the counter
reporting it as such. Additionally, periods longer than the timeout
value will cause the count to "flicker" between the correct period and
duty cycle values, and zero. This is because there doesn't appear to be
a way to reset the hardware's internal counters, even when writing to
the registers.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 MAINTAINERS                            |   1 +
 drivers/counter/Kconfig                |  13 ++
 drivers/counter/Makefile               |   1 +
 drivers/counter/rockchip-pwm-capture.c | 341 +++++++++++++++++++++++++++++++++
 4 files changed, 356 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 3ddd245fd4ad8d9ed2e762910a7a1f6436f93e34..e5d26256d05a04a9642371cf3dbb4dd0c1c34e68 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20891,6 +20891,7 @@ L:	linux-rockchip@lists.infradead.org
 L:	linux-pwm@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/pwm/rockchip,rk3576-pwm.yaml
+F:	drivers/counter/rockchip-pwm-capture.c
 F:	drivers/pwm/pwm-rockchip-v4.c
 F:	drivers/soc/rockchip/mfpwm.c
 F:	include/soc/rockchip/mfpwm.h
diff --git a/drivers/counter/Kconfig b/drivers/counter/Kconfig
index d30d22dfe57741b145a45632b6325d5f9680590e..01b4f5c326478c73b518041830ee0d65b37f6833 100644
--- a/drivers/counter/Kconfig
+++ b/drivers/counter/Kconfig
@@ -90,6 +90,19 @@ config MICROCHIP_TCB_CAPTURE
 	  To compile this driver as a module, choose M here: the
 	  module will be called microchip-tcb-capture.
 
+config ROCKCHIP_PWM_CAPTURE
+	tristate "Rockchip PWM Counter Capture driver"
+	depends on ARCH_ROCKCHIP || COMPILE_TEST
+	depends on ROCKCHIP_MFPWM
+	depends on HAS_IOMEM
+	help
+	  Generic counter framework driver for the multi-function PWM on
+	  Rockchip SoCs such as the RK3576.
+
+	  Uses the Rockchip Multi-function PWM controller driver infrastructure
+	  to guarantee exclusive operation with other functions of the same
+	  device implemented by drivers in other subsystems.
+
 config RZ_MTU3_CNT
 	tristate "Renesas RZ/G2L MTU3a counter driver"
 	depends on RZ_MTU3
diff --git a/drivers/counter/Makefile b/drivers/counter/Makefile
index fa3c1d08f7068835aa912aa13bc92bcfd44d16fb..2bfcfc2c584bd174a9885064746a98f15b204aec 100644
--- a/drivers/counter/Makefile
+++ b/drivers/counter/Makefile
@@ -17,3 +17,4 @@ obj-$(CONFIG_FTM_QUADDEC)	+= ftm-quaddec.o
 obj-$(CONFIG_MICROCHIP_TCB_CAPTURE)	+= microchip-tcb-capture.o
 obj-$(CONFIG_INTEL_QEP)		+= intel-qep.o
 obj-$(CONFIG_TI_ECAP_CAPTURE)	+= ti-ecap-capture.o
+obj-$(CONFIG_ROCKCHIP_PWM_CAPTURE)	+= rockchip-pwm-capture.o
diff --git a/drivers/counter/rockchip-pwm-capture.c b/drivers/counter/rockchip-pwm-capture.c
new file mode 100644
index 0000000000000000000000000000000000000000..b2bfa2c6e04dfa0410fa0d7ef1c395217e4a9db2
--- /dev/null
+++ b/drivers/counter/rockchip-pwm-capture.c
@@ -0,0 +1,341 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2025 Collabora Ltd.
+ *
+ * A counter driver for the Pulse-Width-Modulation (PWM) hardware found on
+ * Rockchip SoCs such as the RK3576, internally referred to as "PWM v4". It
+ * allows for measuring the period and duty cycle in nanoseconds through the
+ * generic counter framework, while guaranteeing exclusive use over the MFPWM
+ * device while the counter is enabled.
+ *
+ * Authors:
+ *     Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
+ */
+
+#include <linux/cleanup.h>
+#include <linux/counter.h>
+#include <linux/devm-helpers.h>
+#include <linux/interrupt.h>
+#include <linux/math.h>
+#include <linux/mod_devicetable.h>
+#include <linux/platform_device.h>
+#include <linux/spinlock.h>
+#include <linux/workqueue.h>
+#include <soc/rockchip/mfpwm.h>
+
+#define RKPWMC_INT_MASK			(PWMV4_INT_LPC | PWMV4_INT_HPC)
+/*
+ * amount of jiffies between no PWM signal change and us deciding PWM is off.
+ * PWM signals with a period longer than this won't be detected by us, which is
+ * the trade-off we make to have a faster response time when a signal is turned
+ * off.
+ */
+#define RKPWMC_CLEAR_DELAY		(max(msecs_to_jiffies(100), 1))
+
+struct rockchip_pwm_capture {
+	struct rockchip_mfpwm_func *pwmf;
+	bool is_enabled;
+	spinlock_t enable_lock;
+	atomic_t lpc;
+	atomic_t hpc;
+	atomic_t captures_left;
+	struct delayed_work clear_capture;
+};
+
+static struct counter_signal rkpwmc_signals[] = {
+	{
+		.id = 0,
+		.name = "Channel 1"
+	},
+};
+
+static const enum counter_synapse_action rkpwmc_hpc_lpc_actions[] = {
+	COUNTER_SYNAPSE_ACTION_BOTH_EDGES,
+
+};
+
+static struct counter_synapse rkpwmc_pwm_synapses[] = {
+	{
+		.actions_list = rkpwmc_hpc_lpc_actions,
+		.num_actions = ARRAY_SIZE(rkpwmc_hpc_lpc_actions),
+		.signal = &rkpwmc_signals[0]
+	},
+};
+
+static const enum counter_function rkpwmc_functions[] = {
+	COUNTER_FUNCTION_INCREASE,
+};
+
+static int rkpwmc_enable_read(struct counter_device *counter,
+			       struct counter_count *count,
+			       u8 *enable)
+{
+	struct rockchip_pwm_capture *pc = counter_priv(counter);
+
+	guard(spinlock)(&pc->enable_lock);
+
+	*enable = pc->is_enabled;
+
+	return 0;
+}
+
+static int rkpwmc_enable_write(struct counter_device *counter,
+			       struct counter_count *count,
+			       u8 enable)
+{
+	struct rockchip_pwm_capture *pc = counter_priv(counter);
+	int ret;
+
+	guard(spinlock)(&pc->enable_lock);
+
+	if (!!enable != pc->is_enabled) {
+		ret = mfpwm_acquire(pc->pwmf);
+		if (ret)
+			return ret;
+
+		if (enable) {
+			mfpwm_reg_write(pc->pwmf->base, PWMV4_REG_ENABLE,
+					 PWMV4_EN(false));
+			mfpwm_reg_write(pc->pwmf->base, PWMV4_REG_CTRL,
+					 PWMV4_CTRL_CAP_FLAGS);
+			mfpwm_reg_write(pc->pwmf->base, PWMV4_REG_INT_EN,
+					 PWMV4_INT_LPC_W(true) |
+					 PWMV4_INT_HPC_W(true));
+			mfpwm_reg_write(pc->pwmf->base, PWMV4_REG_ENABLE,
+					 PWMV4_EN(true) | PWMV4_CLK_EN(true));
+
+			ret = mfpwm_pwmclk_enable(pc->pwmf);
+			if (ret)
+				goto err_release;
+
+			ret = mfpwm_acquire(pc->pwmf);
+			if (ret)
+				goto err_disable_pwm_clk;
+
+			atomic_set(&pc->captures_left, 4);
+			pc->is_enabled = true;
+		} else {
+			mfpwm_reg_write(pc->pwmf->base, PWMV4_REG_INT_EN,
+					 PWMV4_INT_LPC_W(false) |
+					 PWMV4_INT_HPC_W(false));
+			mfpwm_reg_write(pc->pwmf->base, PWMV4_REG_ENABLE,
+					 PWMV4_EN(false) | PWMV4_CLK_EN(false));
+			/*
+			 * Do not use cancel_delayed_work here unless you want
+			 * to cause the interrupt handler, which may still be
+			 * running at this point, to stall. Similarly, don't do
+			 * flush_delayed_work since it may sleep.
+			 */
+			mod_delayed_work(system_bh_wq, &pc->clear_capture, 0);
+			mfpwm_pwmclk_disable(pc->pwmf);
+			pc->is_enabled = false;
+			mfpwm_release(pc->pwmf);
+		}
+
+		mfpwm_release(pc->pwmf);
+	}
+
+	return 0;
+
+err_disable_pwm_clk:
+	mfpwm_pwmclk_disable(pc->pwmf);
+err_release:
+	mfpwm_release(pc->pwmf);
+
+	return ret;
+}
+
+static struct counter_comp rkpwmc_ext[] = {
+	COUNTER_COMP_ENABLE(rkpwmc_enable_read, rkpwmc_enable_write),
+};
+
+enum rkpwmc_count_id {
+	COUNT_PERIOD = 0,
+	COUNT_DUTY = 1,
+};
+
+static struct counter_count rkpwmc_counts[] = {
+	{
+		.id = COUNT_PERIOD,
+		.name = "Period in nanoseconds",
+		.functions_list = rkpwmc_functions,
+		.num_functions = ARRAY_SIZE(rkpwmc_functions),
+		.synapses = rkpwmc_pwm_synapses,
+		.num_synapses = ARRAY_SIZE(rkpwmc_pwm_synapses),
+		.ext = rkpwmc_ext,
+		.num_ext = ARRAY_SIZE(rkpwmc_ext),
+	},
+	{
+		.id = COUNT_DUTY,
+		.name = "Duty cycle in nanoseconds",
+		.functions_list = rkpwmc_functions,
+		.num_functions = ARRAY_SIZE(rkpwmc_functions),
+		.synapses = rkpwmc_pwm_synapses,
+		.num_synapses = ARRAY_SIZE(rkpwmc_pwm_synapses),
+		.ext = rkpwmc_ext,
+		.num_ext = ARRAY_SIZE(rkpwmc_ext),
+	},
+};
+
+static int rkpwmc_count_read(struct counter_device *counter,
+			     struct counter_count *count, u64 *value)
+{
+	struct rockchip_pwm_capture *pc = counter_priv(counter);
+	unsigned long rate;
+	u64 period;
+	u64 lpc;
+	u64 hpc;
+	int ret = 0;
+
+	if (count->id != COUNT_PERIOD && count->id != COUNT_DUTY)
+		return -EINVAL;
+
+	ret = mfpwm_acquire(pc->pwmf);
+	if (ret)
+		return ret;
+
+	rate = mfpwm_clk_get_rate(pc->pwmf->parent);
+	if (!rate) {
+		ret = -EINVAL;
+		goto out_release;
+	}
+
+	hpc = (u32) atomic_read(&pc->hpc);
+
+	if (count->id == COUNT_PERIOD) {
+		lpc = (u32) atomic_read(&pc->lpc);
+		period = mult_frac((hpc + lpc), NSEC_PER_SEC, rate);
+		*value = period;
+	} else {
+		*value = mult_frac(hpc, NSEC_PER_SEC, rate);
+	}
+
+out_release:
+	mfpwm_release(pc->pwmf);
+
+	return ret;
+}
+
+static const struct counter_ops rkpwmc_ops = {
+	.count_read = rkpwmc_count_read,
+};
+
+static irqreturn_t rkpwmc_irq_handler(int irq, void *data)
+{
+	struct rockchip_pwm_capture *pc = data;
+	u32 intsts;
+	u32 clr = 0;
+	u32 lpc;
+	u32 hpc;
+
+	intsts = mfpwm_reg_read(pc->pwmf->base, PWMV4_REG_INTSTS);
+
+	if (!(intsts & RKPWMC_INT_MASK))
+		return IRQ_NONE;
+
+	if (intsts & PWMV4_INT_LPC) {
+		clr |= PWMV4_INT_LPC;
+		atomic_dec_if_positive(&pc->captures_left);
+	}
+
+	if (intsts & PWMV4_INT_HPC) {
+		clr |= PWMV4_INT_HPC;
+		atomic_dec_if_positive(&pc->captures_left);
+	}
+
+	/* After 4 interrupts, reset to 4 captures left and read the regs */
+	if (!atomic_cmpxchg(&pc->captures_left, 0, 4)) {
+		lpc = mfpwm_reg_read(pc->pwmf->base, PWMV4_REG_LPC);
+		hpc = mfpwm_reg_read(pc->pwmf->base, PWMV4_REG_HPC);
+
+		atomic_set(&pc->lpc, lpc);
+		atomic_set(&pc->hpc, hpc);
+		mod_delayed_work(system_bh_wq, &pc->clear_capture,
+				 RKPWMC_CLEAR_DELAY);
+	}
+
+	if (clr)
+		mfpwm_reg_write(pc->pwmf->base, PWMV4_REG_INTSTS, clr);
+
+	if (intsts ^ clr)
+		return IRQ_NONE;
+
+	return IRQ_HANDLED;
+}
+
+static void rkpwmc_clear_capture_worker(struct work_struct *work)
+{
+	struct rockchip_pwm_capture *pc = container_of(
+		work, struct rockchip_pwm_capture, clear_capture.work);
+
+	atomic_set(&pc->hpc, 0);
+	atomic_set(&pc->lpc, 0);
+}
+
+static int rockchip_pwm_capture_probe(struct platform_device *pdev)
+{
+	struct rockchip_mfpwm_func *pwmf = dev_get_platdata(&pdev->dev);
+	struct rockchip_pwm_capture *pc;
+	struct counter_device *counter;
+	int ret;
+
+	counter = devm_counter_alloc(&pdev->dev, sizeof(*pc));
+	if (IS_ERR(counter))
+		return PTR_ERR(counter);
+
+	pc = counter_priv(counter);
+	pc->pwmf = pwmf;
+	spin_lock_init(&pc->enable_lock);
+
+	platform_set_drvdata(pdev, pc);
+
+	ret = devm_request_irq(&pdev->dev, pwmf->irq, rkpwmc_irq_handler,
+			       IRQF_SHARED, pdev->name, pc);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret, "Failed requesting IRQ\n");
+
+	ret = devm_delayed_work_autocancel(&pdev->dev, &pc->clear_capture,
+					   rkpwmc_clear_capture_worker);
+
+	counter->name = pdev->name;
+	counter->signals = rkpwmc_signals;
+	counter->num_signals = ARRAY_SIZE(rkpwmc_signals);
+	counter->ops = &rkpwmc_ops;
+	counter->counts = rkpwmc_counts;
+	counter->num_counts = ARRAY_SIZE(rkpwmc_counts);
+
+	ret = devm_counter_add(&pdev->dev, counter);
+	if (ret < 0)
+		return dev_err_probe(&pdev->dev, ret, "Failed to add counter\n");
+
+	return 0;
+}
+
+static void rockchip_pwm_capture_remove(struct platform_device *pdev)
+{
+	struct rockchip_mfpwm_func *pwmf = dev_get_platdata(&pdev->dev);
+
+	mfpwm_remove_func(pwmf);
+}
+
+static const struct platform_device_id rockchip_pwm_capture_id_table[] = {
+	{ .name = "rockchip-pwm-capture", },
+	{ /* sentinel */ },
+};
+MODULE_DEVICE_TABLE(platform, rockchip_pwm_capture_id_table);
+
+static struct platform_driver rockchip_pwm_capture_driver = {
+	.probe = rockchip_pwm_capture_probe,
+	.remove = rockchip_pwm_capture_remove,
+	.id_table = rockchip_pwm_capture_id_table,
+	.driver = {
+		.name = "rockchip-pwm-capture",
+	},
+};
+module_platform_driver(rockchip_pwm_capture_driver);
+
+MODULE_AUTHOR("Nicolas Frattaroli <nicolas.frattaroli@collabora.com>");
+MODULE_DESCRIPTION("Rockchip PWM Counter Capture Driver");
+MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS("ROCKCHIP_MFPWM");
+MODULE_IMPORT_NS("COUNTER");

-- 
2.49.0


