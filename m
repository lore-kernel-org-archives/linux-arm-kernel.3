Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ADA5F99355
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Apr 2026 08:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j/r+sxkDGMGerd40rxwnYytW5e5CyayQAfIXup8Qqkg=; b=voCj06IXjxa5+8t6X6ABDrfCDs
	gbReWjj2r/uDit/MQlHdkLsc8oMi/nb9/PGtq1MJWUDZ5hGkaFIFAw7KXPaVPiNUTTvX2DmCRHJd+
	oDbHGWtnUnd4DKrR4Bo5b4G0hzDUokzvPNvhjlEZeUTYuXskDsG2VP2Kp6rgr3WNuskWquu8DqaXR
	+DVu8dvlIjduz5OLylv/img4KDHOQOYrHqVxxYTKODu6oEJhtfLFXyu5v19XPNbdLV7KQYHDlMeYe
	Fh85ER18tHqq9LEQ3NQ3T1z4c+KaJrgZT05IrWmSGMhIVLOKPMqyNBUM/nhTxfCCYx6PN6DHqCjI2
	b2CeRy8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFpPS-0000000BFNh-15pe;
	Thu, 23 Apr 2026 08:27:42 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFpPI-0000000BFII-1khJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Apr 2026 08:27:36 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4891e86fabeso57487265e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Apr 2026 01:27:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1776932850; x=1777537650; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j/r+sxkDGMGerd40rxwnYytW5e5CyayQAfIXup8Qqkg=;
        b=WAkIkGDMLjvX2+RPtlHR5oaopHKIcX5EjrEzphDEtVleD/87UL3vw6L94JS3cM6NfH
         w33gK6la0Kbue02Zk74DzRQEsjImZtDyeEspxJbGpKM6IyKn6hzifW1CtwRB1Q0Kt/AZ
         exXgqF1+uLTCgkFOD/b6TXW/klx+VPI9kW/ShI+Rei73+w8dJrbke8bhMsGENMJccZUj
         2Qkhw0nRhmCf9v6PIsjECmqlANlPnEcPO8VVqKGWf9GTdFlAWGrnZOg9hmczftwDEiBj
         Uw1+Ij84DdISgvr4JuFHVzg6VtEMh91RA1j8Xiu3WrM5acpbKK9J2DV105bKp69R6+5o
         6oeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776932850; x=1777537650;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=j/r+sxkDGMGerd40rxwnYytW5e5CyayQAfIXup8Qqkg=;
        b=Gzg00QnTca0nNnZ0MolxEHB+4yYuFvI99E3iGJm5UoEvw6FcP1TvtKRE5rffo9HK0A
         S1NkGU417vq9xdO8cgq6hkiwnw3RmR6QEQG6XdgsBJvekLrF36tvKyylEmBj3zvpdv0R
         xVJaVIMpq1mQvznknkCadLEpNnT3FDCf4OrFAE2euceQXwiMC+ZoJzcqNJlA/DdJQIr7
         fntfaOXnj5jWC0kW62rapHrfQ/Poml88P7DkBky3qv6xKngivGVG3Kb6MFgtTuGOKODN
         eJSrNWmxs8XMtmHLmrhW96GbphOQsFsof+2ioFTLt+3SYCdelUlwh3xq9bKCGxALeeIP
         98XQ==
X-Forwarded-Encrypted: i=1; AFNElJ/csIJ7tOfpDbIuUIbvr/Qek6Bh11/LoGqU9lK9hYFjd8BJ9JDz4jRxWmjSH9n5ScsVMEjIikc5vwzb90pcd5al@lists.infradead.org
X-Gm-Message-State: AOJu0YwADdmLG4Qyr2xaJN7Be7AtdbWz1h6SENJKkGcYdYKGDk6VYQAD
	KMkVmyrBuRd5FvbBqwBtPcTuCE0kBd88/g8MLmkGOo11rLk3ATgJI23T82cEDuy1aoI=
X-Gm-Gg: AeBDievXxO2g89aiOiQrNl9Qcgp4Jz2cpOluFd1I27snpYBrVkmkarCvJ1s7eyS+pbB
	LGPlQxbaSzg5M5Cx5uzGTZ+aoI/n494ygfEdDqKP7SqH3Hl006bXazgmy6AjLu15j+9KnSkOAdh
	++8b4j3FvYSOPnGduWgmxK750ympSsuwuyWtaHevwjXRYH40diH1//oN3ze1rH5S6fe8a7pGjJa
	epvAHExPFGOqIqSOe9H0hN+Kf7qxxHi6HUXwO+gXGhOrTK2DLf7hTPcqZMYhTwtTPdUlLv4nFII
	dEMSFbg41mEtoya17ZbUptmZIWRuBl8DwQPp6GrpXyrwzsBlnEZIdAi5DqY4nk2rQw7VI0HMs2D
	pBWPpvcI8OmmSmUTkNwcHg1JuHVrWsMLsRKqmXpCTvjpIXyI6+LoPsEXw+Kj3h+dKLsE5KSRNTP
	od5ku+3J47f7VAJZRy45F+l1Y2Y9r2Hxr60aEK+B8/rRq2mb2BKmBLjpUiyL4YL4pw7zKlvI3Xs
	B2Nbjs=
X-Received: by 2002:a05:600c:64c7:b0:488:a2ac:a334 with SMTP id 5b1f17b1804b1-488fb73aa3bmr388775135e9.3.1776932850256;
        Thu, 23 Apr 2026 01:27:30 -0700 (PDT)
Received: from localhost (host-79-33-140-232.retail.telecomitalia.it. [79.33.140.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a55b8baaesm280918355e9.10.2026.04.23.01.27.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 01:27:29 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	linux-pwm@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Andrea della Porta <andrea.porta@suse.com>,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Naushir Patuck <naush@raspberrypi.com>,
	Stanimir Varbanov <svarbanov@suse.de>,
	mbrugger@suse.com
Subject: [PATCH v3 2/3] pwm: rp1: Add RP1 PWM controller driver
Date: Thu, 23 Apr 2026 10:30:20 +0200
Message-ID: <bf46348985e9c89b8c3f40cd3d00f5bca9d97097.1776932336.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1776932336.git.andrea.porta@suse.com>
References: <cover.1776932336.git.andrea.porta@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_012732_691104_B97C3A5D 
X-CRM114-Status: GOOD (  32.74  )
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

From: Naushir Patuck <naush@raspberrypi.com>

The Raspberry Pi RP1 southbridge features an embedded PWM
controller with 4 output channels, alongside an RPM interface
to read the fan speed on the Raspberry Pi 5.

Add the supporting driver.

Signed-off-by: Naushir Patuck <naush@raspberrypi.com>
Co-developed-by: Stanimir Varbanov <svarbanov@suse.de>
Signed-off-by: Stanimir Varbanov <svarbanov@suse.de>
Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 drivers/pwm/Kconfig   |   9 +
 drivers/pwm/Makefile  |   1 +
 drivers/pwm/pwm-rp1.c | 414 ++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 424 insertions(+)
 create mode 100644 drivers/pwm/pwm-rp1.c

diff --git a/drivers/pwm/Kconfig b/drivers/pwm/Kconfig
index 6f3147518376a..32031f2af75af 100644
--- a/drivers/pwm/Kconfig
+++ b/drivers/pwm/Kconfig
@@ -625,6 +625,15 @@ config PWM_ROCKCHIP
 	  Generic PWM framework driver for the PWM controller found on
 	  Rockchip SoCs.
 
+config PWM_RASPBERRYPI_RP1
+	bool "RP1 PWM support"
+	depends on MISC_RP1 || COMPILE_TEST
+	depends on HAS_IOMEM
+	select REGMAP_MMIO
+	select MFD_SYSCON
+	help
+	  PWM framework driver for Raspberry Pi RP1 controller.
+
 config PWM_SAMSUNG
 	tristate "Samsung PWM support"
 	depends on PLAT_SAMSUNG || ARCH_S5PV210 || ARCH_EXYNOS || COMPILE_TEST
diff --git a/drivers/pwm/Makefile b/drivers/pwm/Makefile
index 0dc0d2b69025d..59f29f60f9123 100644
--- a/drivers/pwm/Makefile
+++ b/drivers/pwm/Makefile
@@ -56,6 +56,7 @@ obj-$(CONFIG_PWM_RENESAS_RZG2L_GPT)	+= pwm-rzg2l-gpt.o
 obj-$(CONFIG_PWM_RENESAS_RZ_MTU3)	+= pwm-rz-mtu3.o
 obj-$(CONFIG_PWM_RENESAS_TPU)	+= pwm-renesas-tpu.o
 obj-$(CONFIG_PWM_ROCKCHIP)	+= pwm-rockchip.o
+obj-$(CONFIG_PWM_RASPBERRYPI_RP1)	+= pwm-rp1.o
 obj-$(CONFIG_PWM_SAMSUNG)	+= pwm-samsung.o
 obj-$(CONFIG_PWM_SIFIVE)	+= pwm-sifive.o
 obj-$(CONFIG_PWM_SL28CPLD)	+= pwm-sl28cpld.o
diff --git a/drivers/pwm/pwm-rp1.c b/drivers/pwm/pwm-rp1.c
new file mode 100644
index 0000000000000..15087917a18e9
--- /dev/null
+++ b/drivers/pwm/pwm-rp1.c
@@ -0,0 +1,414 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * pwm-rp1.c
+ *
+ * Raspberry Pi RP1 PWM.
+ *
+ * Copyright © 2026 Raspberry Pi Ltd.
+ *
+ * Author: Naushir Patuck (naush@raspberrypi.com)
+ *
+ * Based on the pwm-bcm2835 driver by:
+ * Bart Tanghe <bart.tanghe@thomasmore.be>
+ *
+ * Datasheet: https://pip-assets.raspberrypi.com/categories/892-raspberry-pi-5/documents/RP-008370-DS-1-rp1-peripherals.pdf?disposition=inline
+ *
+ * Limitations:
+ * - Channels can be enabled/disabled through a global update flag, while the
+ *   period and duty per-channel registers are independently updatable, and
+ *   they are latched on the end of (specific channel) period strobe.
+ *   This means that period and duty changes might result in glitches if the
+ *   period/duty is changed exactly during an end of period strobe.
+ * - Since the duty/period registers are freely updatable (do not depend on
+ *   the global update flag), setting one of them close to the period end and
+ *   the other right afterwards results in a mixed output for that cycle because
+ *   the write ops are not atomic.
+ * - The global update flag prevents mis-sampling of multi-bit bus signals in
+ *   the PWM clock domain. This ensures that all PWM channel settings update
+ *   on the same PWM clock cycle. Channels start in sync only if they share the
+ *   same period.
+ * - If both duty and period are set to 0, the output is a constant low signal
+ *   if polarity is normal or a constant high signal if polarity is inversed.
+ * - When disabled the output is driven to 0 if polarity is normal, or to 1
+ *   if polarity is inversed.
+ * - Disabling the PWM stops the output immediately, without waiting for current
+ *   period to complete first.
+ * - Channels are phase-capable, but on RPi5, the firmware can use a channel
+ *   phase register to report the RPM of the fan connected to that PWM
+ *   channel. As a result, phase control will be ignored for now.
+ */
+
+#include <linux/bitops.h>
+#include <linux/clk.h>
+#include <linux/err.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/pwm.h>
+#include <linux/regmap.h>
+#include <linux/mfd/syscon.h>
+#include <linux/units.h>
+
+#define RP1_PWM_GLB_CTRL			0x000
+#define RP1_PWM_GLB_CTRL_CHANNEL_ENABLE(chan)	BIT(chan)
+#define RP1_PWM_GLB_CTRL_SET_UPDATE		BIT(31)
+
+#define RP1_PWM_CHAN_CTRL(chan)			(0x014 + ((chan) * 0x10))
+#define RP1_PWM_CHAN_CTRL_POLARITY		BIT(3)
+#define RP1_PWM_CHAN_CTRL_FIFO_POP_MASK		BIT(8)
+#define RP1_PWM_CHAN_CTRL_MODE			GENMASK(2, 0)
+enum rp1_pwm_ctrl_mode {
+	RP1_PWM_CHAN_CTRL_MODE_ZERO,
+	RP1_PWM_CHAN_CTRL_MODE_TE_MS,
+	RP1_PWM_CHAN_CTRL_MODE_PC_MS,
+	RP1_PWM_CHAN_CTRL_MODE_PD_ENC,
+	RP1_PWM_CHAN_CTRL_MODE_MSB_SER,
+	RP1_PWM_CHAN_CTRL_MODE_PPM,
+	RP1_PWM_CHAN_CTRL_MODE_LE_MS,
+	RP1_PWM_CHAN_CTRL_MODE_LSB_SER,
+};
+
+#define RP1_PWM_CHAN_CTRL_DEFAULT		(RP1_PWM_CHAN_CTRL_FIFO_POP_MASK +  \
+						FIELD_PREP(RP1_PWM_CHAN_CTRL_MODE, \
+						RP1_PWM_CHAN_CTRL_MODE_TE_MS))
+
+#define RP1_PWM_RANGE(chan)			(0x018 + ((chan) * 0x10))
+#define RP1_PWM_PHASE(chan)			(0x01C + ((chan) * 0x10))
+#define RP1_PWM_DUTY(chan)			(0x020 + ((chan) * 0x10))
+
+#define RP1_PWM_NUM_PWMS			4
+
+struct rp1_pwm {
+	struct regmap *regmap;
+	struct clk *clk;
+	unsigned long clk_rate;
+	bool clk_enabled;
+};
+
+struct rp1_pwm_waveform {
+	u32 period_ticks;
+	u32 duty_ticks;
+	bool enabled;
+	bool inverted_polarity;
+};
+
+static const struct regmap_config rp1_pwm_regmap_config = {
+	.reg_bits = 32,
+	.val_bits = 32,
+	.reg_stride = 4,
+	.max_register = 0x60,
+};
+
+static void rp1_pwm_apply_config(struct pwm_chip *chip, struct pwm_device *pwm)
+{
+	struct rp1_pwm *rp1 = pwmchip_get_drvdata(chip);
+	u32 value;
+
+	/* update the changed registers on the next strobe to avoid glitches */
+	regmap_read(rp1->regmap, RP1_PWM_GLB_CTRL, &value);
+	value |= RP1_PWM_GLB_CTRL_SET_UPDATE;
+	regmap_write(rp1->regmap, RP1_PWM_GLB_CTRL, value);
+}
+
+static int rp1_pwm_request(struct pwm_chip *chip, struct pwm_device *pwm)
+{
+	struct rp1_pwm *rp1 = pwmchip_get_drvdata(chip);
+
+	/* init channel to reset defaults */
+	regmap_write(rp1->regmap, RP1_PWM_CHAN_CTRL(pwm->hwpwm), RP1_PWM_CHAN_CTRL_DEFAULT);
+	return 0;
+}
+
+static int rp1_pwm_round_waveform_tohw(struct pwm_chip *chip,
+				       struct pwm_device *pwm,
+				       const struct pwm_waveform *wf,
+				       void *_wfhw)
+{
+	struct rp1_pwm *rp1 = pwmchip_get_drvdata(chip);
+	u64 period_ticks, duty_ticks, offset_ticks;
+	struct rp1_pwm_waveform *wfhw = _wfhw;
+	u64 clk_rate = rp1->clk_rate;
+	int ret = 0;
+
+	if (!wf->period_length_ns) {
+		wfhw->enabled = false;
+		return 0;
+	}
+
+	period_ticks = mul_u64_u64_div_u64(wf->period_length_ns, clk_rate, NSEC_PER_SEC);
+
+	/*
+	 * The period is limited to U32_MAX - 1
+	 * to allow 100% duty cycle.
+	 */
+	if (period_ticks > U32_MAX) {
+		period_ticks = U32_MAX - 1;
+	} else if (!period_ticks) {
+		period_ticks = 2;
+		ret = 1;
+	}
+
+	duty_ticks = mul_u64_u64_div_u64(wf->duty_length_ns, clk_rate, NSEC_PER_SEC);
+	offset_ticks = mul_u64_u64_div_u64(wf->duty_offset_ns, clk_rate, NSEC_PER_SEC);
+	if (duty_ticks && offset_ticks &&
+	    duty_ticks + offset_ticks >= period_ticks) {
+		wfhw->duty_ticks = period_ticks - duty_ticks;
+		wfhw->inverted_polarity = true;
+	} else {
+		wfhw->duty_ticks = duty_ticks;
+		wfhw->inverted_polarity = false;
+	}
+	/* Account for the extra tick at the end of the period */
+	wfhw->period_ticks = period_ticks - 1;
+
+	wfhw->enabled = true;
+
+	return ret;
+}
+
+static int rp1_pwm_round_waveform_fromhw(struct pwm_chip *chip,
+					 struct pwm_device *pwm,
+					 const void *_wfhw,
+					 struct pwm_waveform *wf)
+{
+	struct rp1_pwm *rp1 = pwmchip_get_drvdata(chip);
+	const struct rp1_pwm_waveform *wfhw = _wfhw;
+	u64 clk_rate = rp1->clk_rate;
+	u32 ticks;
+
+	*wf = (struct pwm_waveform){ };
+
+	if (!wfhw->enabled)
+		return 0;
+
+	wf->period_length_ns = DIV_ROUND_UP_ULL((u64)(wfhw->period_ticks + 1) * NSEC_PER_SEC,
+						clk_rate);
+
+	if (!wfhw->inverted_polarity) {
+		wf->duty_length_ns = DIV_ROUND_UP_ULL((u64)wfhw->duty_ticks * NSEC_PER_SEC,
+						      clk_rate);
+	} else {
+		ticks = wfhw->period_ticks + 1 - wfhw->duty_ticks;
+		wf->duty_length_ns = DIV_ROUND_UP_ULL((u64)ticks * NSEC_PER_SEC, clk_rate);
+		wf->duty_offset_ns = wf->period_length_ns - wf->duty_length_ns;
+	}
+
+	return 0;
+}
+
+static int rp1_pwm_write_waveform(struct pwm_chip *chip,
+				  struct pwm_device *pwm,
+				  const void *_wfhw)
+{
+	struct rp1_pwm *rp1 = pwmchip_get_drvdata(chip);
+	const struct rp1_pwm_waveform *wfhw = _wfhw;
+	u32 value, ctrl;
+
+	/* early exit if disabled */
+	regmap_read(rp1->regmap, RP1_PWM_GLB_CTRL, &ctrl);
+	if (!wfhw->enabled) {
+		ctrl &= ~RP1_PWM_GLB_CTRL_CHANNEL_ENABLE(pwm->hwpwm);
+		goto exit_disable;
+	}
+
+	/* set period and duty cycle */
+	regmap_write(rp1->regmap,
+		     RP1_PWM_RANGE(pwm->hwpwm), wfhw->period_ticks);
+	regmap_write(rp1->regmap,
+		     RP1_PWM_DUTY(pwm->hwpwm), wfhw->duty_ticks);
+
+	/* set polarity */
+	regmap_read(rp1->regmap, RP1_PWM_CHAN_CTRL(pwm->hwpwm), &value);
+	if (!wfhw->inverted_polarity)
+		value &= ~RP1_PWM_CHAN_CTRL_POLARITY;
+	else
+		value |= RP1_PWM_CHAN_CTRL_POLARITY;
+	regmap_write(rp1->regmap, RP1_PWM_CHAN_CTRL(pwm->hwpwm), value);
+
+	/* enable the channel */
+	ctrl |= RP1_PWM_GLB_CTRL_CHANNEL_ENABLE(pwm->hwpwm);
+exit_disable:
+	regmap_write(rp1->regmap, RP1_PWM_GLB_CTRL, ctrl);
+
+	rp1_pwm_apply_config(chip, pwm);
+
+	return 0;
+}
+
+static int rp1_pwm_read_waveform(struct pwm_chip *chip,
+				 struct pwm_device *pwm,
+				 void *_wfhw)
+{
+	struct rp1_pwm *rp1 = pwmchip_get_drvdata(chip);
+	struct rp1_pwm_waveform *wfhw = _wfhw;
+	u32 value;
+
+	regmap_read(rp1->regmap, RP1_PWM_GLB_CTRL, &value);
+	wfhw->enabled = !!(value & RP1_PWM_GLB_CTRL_CHANNEL_ENABLE(pwm->hwpwm));
+
+	regmap_read(rp1->regmap, RP1_PWM_CHAN_CTRL(pwm->hwpwm), &value);
+	wfhw->inverted_polarity = !!(value & RP1_PWM_CHAN_CTRL_POLARITY);
+
+	if (wfhw->enabled) {
+		regmap_read(rp1->regmap, RP1_PWM_RANGE(pwm->hwpwm), &wfhw->period_ticks);
+		regmap_read(rp1->regmap, RP1_PWM_DUTY(pwm->hwpwm), &wfhw->duty_ticks);
+	} else {
+		wfhw->period_ticks = 0;
+		wfhw->duty_ticks = 0;
+	}
+
+	return 0;
+}
+
+static const struct pwm_ops rp1_pwm_ops = {
+	.sizeof_wfhw = sizeof(struct rp1_pwm_waveform),
+	.request = rp1_pwm_request,
+	.round_waveform_tohw = rp1_pwm_round_waveform_tohw,
+	.round_waveform_fromhw = rp1_pwm_round_waveform_fromhw,
+	.read_waveform = rp1_pwm_read_waveform,
+	.write_waveform = rp1_pwm_write_waveform,
+};
+
+static int rp1_pwm_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *np = dev->of_node;
+	unsigned long clk_rate;
+	struct pwm_chip *chip;
+	void __iomem	*base;
+	struct rp1_pwm *rp1;
+	int ret;
+
+	chip = devm_pwmchip_alloc(dev, RP1_PWM_NUM_PWMS, sizeof(*rp1));
+	if (IS_ERR(chip))
+		return PTR_ERR(chip);
+
+	rp1 = pwmchip_get_drvdata(chip);
+
+	base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	rp1->regmap = devm_regmap_init_mmio(dev, base, &rp1_pwm_regmap_config);
+	if (IS_ERR(rp1->regmap))
+		return dev_err_probe(dev, PTR_ERR(rp1->regmap), "Cannot initialize regmap\n");
+
+	ret = of_syscon_register_regmap(np, rp1->regmap);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to register syscon\n");
+
+	rp1->clk = devm_clk_get(dev, NULL);
+	if (IS_ERR(rp1->clk))
+		return dev_err_probe(dev, PTR_ERR(rp1->clk), "Clock not found\n");
+
+	ret = clk_prepare_enable(rp1->clk);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to enable clock\n");
+	rp1->clk_enabled = true;
+
+	ret = devm_clk_rate_exclusive_get(dev, rp1->clk);
+	if (ret) {
+		dev_err_probe(dev, ret, "Failed to get exclusive rate\n");
+		goto err_disable_clk;
+	}
+
+	clk_rate = clk_get_rate(rp1->clk);
+	if (!clk_rate) {
+		ret = dev_err_probe(dev, -EINVAL, "Failed to get clock rate\n");
+		goto err_disable_clk;
+	}
+	/*
+	 * To prevent u64 overflow in period calculations:
+	 * mul_u64_u64_div_u64(period_ns, clk_rate, NSEC_PER_SEC)
+	 * If clk_rate > 1 GHz, the result can overflow.
+	 */
+	if (clk_rate > HZ_PER_GHZ) {
+		ret = dev_err_probe(dev, -EINVAL, "Clock rate > 1 GHz is not supported\n");
+		goto err_disable_clk;
+	}
+	rp1->clk_rate = clk_rate;
+
+	chip->ops = &rp1_pwm_ops;
+
+	platform_set_drvdata(pdev, chip);
+
+	ret = pwmchip_add(chip);
+	if (ret) {
+		dev_err_probe(dev, ret, "Failed to register PWM chip\n");
+		goto err_disable_clk;
+	}
+
+	return 0;
+
+err_disable_clk:
+	clk_disable_unprepare(rp1->clk);
+
+	return ret;
+}
+
+static void rp1_pwm_remove(struct platform_device *pdev)
+{
+	struct pwm_chip *chip = platform_get_drvdata(pdev);
+	struct rp1_pwm *rp1 = pwmchip_get_drvdata(chip);
+
+	pwmchip_remove(chip);
+
+	if (rp1->clk_enabled) {
+		clk_disable_unprepare(rp1->clk);
+		rp1->clk_enabled = false;
+	}
+}
+
+static int rp1_pwm_suspend(struct device *dev)
+{
+	struct rp1_pwm *rp1 = dev_get_drvdata(dev);
+
+	if (rp1->clk_enabled) {
+		clk_disable_unprepare(rp1->clk);
+		rp1->clk_enabled = false;
+	}
+
+	return 0;
+}
+
+static int rp1_pwm_resume(struct device *dev)
+{
+	struct rp1_pwm *rp1 = dev_get_drvdata(dev);
+	int ret;
+
+	ret = clk_prepare_enable(rp1->clk);
+	if (ret) {
+		dev_err(dev, "Failed to enable clock on resume: %pe\n", ERR_PTR(ret));
+		return ret;
+	}
+
+	rp1->clk_enabled = true;
+
+	return 0;
+}
+
+static DEFINE_SIMPLE_DEV_PM_OPS(rp1_pwm_pm_ops, rp1_pwm_suspend, rp1_pwm_resume);
+
+static const struct of_device_id rp1_pwm_of_match[] = {
+	{ .compatible = "raspberrypi,rp1-pwm" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, rp1_pwm_of_match);
+
+static struct platform_driver rp1_pwm_driver = {
+	.probe = rp1_pwm_probe,
+	.remove = rp1_pwm_remove,
+	.driver = {
+		.name = "rp1-pwm",
+		.of_match_table = rp1_pwm_of_match,
+		.pm = pm_ptr(&rp1_pwm_pm_ops),
+		.suppress_bind_attrs = true,
+	},
+};
+module_platform_driver(rp1_pwm_driver);
+
+MODULE_DESCRIPTION("RP1 PWM driver");
+MODULE_AUTHOR("Naushir Patuck <naush@raspberrypi.com>");
+MODULE_AUTHOR("Andrea della Porta <andrea.porta@suse.com>");
+MODULE_LICENSE("GPL");
-- 
2.35.3


