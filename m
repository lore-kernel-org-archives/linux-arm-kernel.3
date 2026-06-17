Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A500FCD98F0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 02:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qlq7rf7D7jnIOwcFham5QcmoXd7kahsZXkCesqlAf3g=; b=IULG3956hbq6Puk3G1fdDjRJYM
	RZTC9c1GsSSJplorQ1pGt+HP+hx7qvLdXefafyDHSVXRc7IHDFMb/mEzfCdGFaX+4GEqHLid1LkfE
	5WPEjSEKOrvVgCwBYCyVwEyG4sh9iNgpiiS1VzoGNpKGiqzPTkPBZ86BaiXR1hptn3cpp0GGAS/++
	GppgLWBt5N/chJ7SSm13cbSJkBFDY8oViPTng8W4DB9EAalTBuqVdGpGNpepr0gNOUfivGQDuJclN
	Ahxbea7HIpOylbPEYRS9QFP+UBNJJ/mn8OnjEUd5PjQFpH6zYVmP0j2wEuvDE28rd6kIiufmC87Et
	X1HyPDlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZgVD-0000000GXE1-3d80;
	Wed, 17 Jun 2026 02:59:43 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZgVB-0000000GXDL-1E2D
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Jun 2026 02:59:43 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-84237c55ef9so3351671b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Jun 2026 19:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781665181; x=1782269981; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qlq7rf7D7jnIOwcFham5QcmoXd7kahsZXkCesqlAf3g=;
        b=O89uTYOFW7L9UZnVJmxG5Au7Skby8Gm98XkkEIySWvua8C9YYg692KpoC92JvRIOvt
         mx0uGfsE982bY4DMPbG5/Dh85zoEKPV8aD2YZ0XUky6gz7yJkJEI9y/7Gkqb9aHTCz45
         KN3mxyonubGsqng0pvDcCMkXobwJTMlKE2XeGdt9cNoLeZ3g2o0jIUlZYQ+FjY1xdVfx
         co71x96rFuTPiMA20P1Nih1SM9NxybSJjpLD2gzOhLR8hvgvnRrn198vNIAarIeD+eAd
         t5nGsIpssQmWmQMChHAYE9pPBGW1A6Hx+ZWTbS6j05MP/JRMJDON9PQKt7a2S63VAAUB
         91eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781665181; x=1782269981;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Qlq7rf7D7jnIOwcFham5QcmoXd7kahsZXkCesqlAf3g=;
        b=DNzJRHi6VpbS8ohl/JjZgIUbNsXRHrCkwgtJcwhpEUDjgFYR6h5SN4ZX4HjYuSmXfD
         rhBgcdeuqfE4vX6/B0flbDt4VfbGAAy3Z+3/8NjboaKOgoYYZKnZos1tHStDFfe0R5A8
         DCWy8XlZu/YNMK3Xgrl6BzKqm2XVXCnAc2wlByPLZd7nMzPGrDxHSFe/bAYlJpQGJGeM
         CbP7gOSs/G/Qxtg5YSnreevmm/nK0IFLJUZA04nz9wlwXiGZmxDNd22i39TCRmSGmkN3
         j4AzJypRV6dy+Amt0SnvNBKrucPXBHwXlhswODIajoTWTmpI/JiveJIgqwkICKVAisk9
         2wZg==
X-Gm-Message-State: AOJu0YxCfh+WzDT7FtsG8CUMuOPyK/Rgb+fEqU6y8iV5Xt3l29T3u2fx
	99OBt8XapsFw8ApW0e6PZv/3CNnIj6gb9CK3agyzdl2pV9BMiEsQ5mCr
X-Gm-Gg: Acq92OFhyNu4JnKJinSDi/xAJWXzIoWnZlTQa6pZ+WpxymYc5l6qFllw2i2IocqgSz9
	cQXgzDFu/9wSD2BziVdL5Zy35H49uyShdAqgDaK0PWlYJkiPhf/hrjdm7C5KUuzkPRLu4K3vi+m
	DvAoZsNo+Mkp3Oyqi2juvwYxrAMi65NlFQD6L+XcevYSbZ3xjwPB7P4geyprbrdoMEGnSGzvKoc
	Xp44y/OV+XG2B8qXSH1Zbp8u89xvLLzHJWcWZMoAHUUk8DgJKjv/UKPYpZC1OmFa6bYKedS7NEI
	1D9oByivs1T4yiahZ615QJQYPwpXu6QWo/7M+VgaB1Yu+RVmOEEoSHJuwujqa83Gl1yGUMllkyB
	OmMJLD90PG7AYwHUxCG9q9mK6lJtzb1alUVNxoA8onRzdik/Y8x3n+4whHIUYQX7A2Z1H7g2+1z
	JT8ri10XgI+uJjhaMqMIDomMa7DRAWmx3xDnsrYSZStIGT7xAWWKUlJkXSuEV1/tyxKtCzUXfTT
	dk=
X-Received: by 2002:a05:6a00:80a:b0:842:5719:455c with SMTP id d2e1a72fcca58-84524561f5bmr1631613b3a.25.1781665180476;
        Tue, 16 Jun 2026 19:59:40 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434afc825csm14212821b3a.36.2026.06.16.19.59.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 19:59:40 -0700 (PDT)
From: Chi-Wen Weng <cwweng.linux@gmail.com>
To: ukleinek@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	cwweng@nuvoton.com,
	cwweng.linux@gmail.com,
	Trevor Gamblin <tgamblin@baylibre.com>
Subject: [PATCH v4 2/2] pwm: Add Nuvoton MA35D1 PWM controller support
Date: Wed, 17 Jun 2026 10:59:25 +0800
Message-Id: <20260617025925.2539334-3-cwweng.linux@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260617025925.2539334-1-cwweng.linux@gmail.com>
References: <20260617025925.2539334-1-cwweng.linux@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_195941_350808_F93C4217 
X-CRM114-Status: GOOD (  29.27  )
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

From: Chi-Wen Weng <cwweng@nuvoton.com>

Add a PWM framework driver for the Nuvoton MA35D1 PWM controller.

The MA35D1 PWM controller provides 6 PWM channels. The hardware supports
up, down and up-down counter types, auto-reload and one-shot modes, and
independent and complementary output modes. This driver configures all
channels to up-counting mode, auto-reload mode and independent output mode.

The waveform generator is configured to drive the output high at the zero
point and low at the compare-up point. In up-counting mode the counter
counts from 0 to PERIOD inclusive, so the PWM period is PERIOD + 1 cycles.
With the selected waveform actions, CMPDAT = 0 generates 0% duty cycle and
CMPDAT > PERIOD generates 100% duty cycle. Limit PERIOD to 0xfffe so that
CMPDAT = 0xffff can be used for the full-duty case.

PERIOD and CMPDAT updates are buffered by the hardware and take effect at
the end of the current period because IMMLDENn is left disabled. When the
PWM output is disabled, POENn is cleared and the output pin is put into
tri-state.

Reviewed-by: Trevor Gamblin <tgamblin@baylibre.com>
Signed-off-by: Chi-Wen Weng <cwweng@nuvoton.com>
---
 drivers/pwm/Kconfig      |   9 +
 drivers/pwm/Makefile     |   1 +
 drivers/pwm/pwm-ma35d1.c | 344 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 354 insertions(+)
 create mode 100644 drivers/pwm/pwm-ma35d1.c

diff --git a/drivers/pwm/Kconfig b/drivers/pwm/Kconfig
index e8886a9b64d9..355131e6efac 100644
--- a/drivers/pwm/Kconfig
+++ b/drivers/pwm/Kconfig
@@ -463,6 +463,15 @@ config PWM_LPSS_PLATFORM
 	  To compile this driver as a module, choose M here: the module
 	  will be called pwm-lpss-platform.
 
+config PWM_MA35D1
+	tristate "Nuvoton MA35D1 PWM support"
+	depends on ARCH_MA35 || COMPILE_TEST
+	help
+	  Generic PWM framework driver for Nuvoton MA35D1.
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called pwm-ma35d1.
+
 config PWM_MAX7360
 	tristate "MAX7360 PWMs"
 	depends on MFD_MAX7360
diff --git a/drivers/pwm/Makefile b/drivers/pwm/Makefile
index 5630a521a7cf..7ad761ea27d1 100644
--- a/drivers/pwm/Makefile
+++ b/drivers/pwm/Makefile
@@ -40,6 +40,7 @@ obj-$(CONFIG_PWM_LPC32XX)	+= pwm-lpc32xx.o
 obj-$(CONFIG_PWM_LPSS)		+= pwm-lpss.o
 obj-$(CONFIG_PWM_LPSS_PCI)	+= pwm-lpss-pci.o
 obj-$(CONFIG_PWM_LPSS_PLATFORM)	+= pwm-lpss-platform.o
+obj-$(CONFIG_PWM_MA35D1)	+= pwm-ma35d1.o
 obj-$(CONFIG_PWM_MAX7360)	+= pwm-max7360.o
 obj-$(CONFIG_PWM_MC33XS2410)	+= pwm-mc33xs2410.o
 obj-$(CONFIG_PWM_MEDIATEK)	+= pwm-mediatek.o
diff --git a/drivers/pwm/pwm-ma35d1.c b/drivers/pwm/pwm-ma35d1.c
new file mode 100644
index 000000000000..c07eedeca035
--- /dev/null
+++ b/drivers/pwm/pwm-ma35d1.c
@@ -0,0 +1,344 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Driver for the Nuvoton MA35D1 PWM controller
+ *
+ * Copyright (C) 2026 Nuvoton Corporation
+ *               Chi-Wen Weng <cwweng@nuvoton.com>
+ *
+ * Reference Manual:
+ * https://www.nuvoton.com.cn/resource-download.jsp?tp_GUID=DA05-MA35D16
+ *
+ * Limitations:
+ * - The hardware supports 6 PWM channels.
+ * - The hardware supports up, down and up-down counter types. This driver
+ *   configures all channels to up-counting mode.
+ * - The hardware supports auto-reload and one-shot counter modes. This driver
+ *   configures all channels to auto-reload mode.
+ * - The hardware supports independent and complementary output modes. This
+ *   driver configures all channels to independent output mode.
+ * - The hardware supports programmable waveform actions at zero, period and
+ *   compare points. This driver uses zero point high and compare-up point low
+ *   actions for normal PWM output.
+ * - In up-counting mode, the counter counts from 0 to PERIOD inclusive. With
+ *   zero point high and compare-up point low actions, CMPDAT = 0 produces 0%
+ *   duty and CMPDAT > PERIOD produces 100% duty.
+ * - The driver limits PERIOD to 0xfffe so that CMPDAT can be set greater than
+ *   PERIOD to generate a 100% duty cycle.
+ * - Period and duty cycle changes are buffered by hardware and take effect at
+ *   the end of the current period because IMMLDENn is left disabled.
+ * - Polarity changes are applied directly and may cause a transient output
+ *   change if the PWM output is running.
+ * - When disabled, the output pin is put in tri-state by clearing POENn.
+ */
+
+#include <linux/bits.h>
+#include <linux/clk.h>
+#include <linux/io.h>
+#include <linux/math64.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/pwm.h>
+
+#define MA35D1_REG_PWM_CTL0			0x00
+#define MA35D1_REG_PWM_CTL1			0x04
+#define MA35D1_REG_PWM_CNTEN			0x20
+#define MA35D1_REG_PWM_PERIOD(ch)		(0x30 + 4 * (ch))
+#define MA35D1_REG_PWM_CMPDAT(ch)		(0x50 + 4 * (ch))
+#define MA35D1_REG_PWM_WGCTL0			0xb0
+#define MA35D1_REG_PWM_WGCTL1			0xb4
+#define MA35D1_REG_PWM_POLCTL			0xd4
+#define MA35D1_REG_PWM_POEN			0xd8
+
+#define MA35D1_PWM_CTL1_CNTMODE_MASK(ch)	BIT(16 + (ch))
+#define MA35D1_PWM_CTL1_OUTMODE_MASK(ch)	BIT(24 + ((ch) / 2))
+
+#define MA35D1_PWM_WGCTL_ACTION_MASK		0x3
+#define MA35D1_PWM_WGCTL_ACTION_LOW		1
+#define MA35D1_PWM_WGCTL_ACTION_HIGH		2
+
+#define MA35D1_PWM_WGCTL_ZERO_HIGH(ch)		\
+	(MA35D1_PWM_WGCTL_ACTION_HIGH << (2 * (ch)))
+#define MA35D1_PWM_WGCTL_CMP_UP_LOW(ch)		\
+	(MA35D1_PWM_WGCTL_ACTION_LOW << (2 * (ch)))
+
+#define MA35D1_PWM_CNTEN_EN(ch)			BIT(ch)
+#define MA35D1_PWM_POEN_EN(ch)			BIT(ch)
+#define MA35D1_PWM_POLCTL_INV(ch)		BIT(ch)
+
+#define MA35D1_PWM_MAX_CMPDAT			0xffff
+#define MA35D1_PWM_MAX_PERIOD			0xfffe
+#define MA35D1_PWM_MAX_PERIOD_CYCLES		(MA35D1_PWM_MAX_PERIOD + 1)
+#define MA35D1_PWM_NUM_CHANNELS			6
+
+struct nuvoton_pwm {
+	void __iomem *base;
+	unsigned long clkrate;
+};
+
+static inline struct nuvoton_pwm *nuvoton_pwm_from_chip(struct pwm_chip *chip)
+{
+	return pwmchip_get_drvdata(chip);
+}
+
+static inline u32 nuvoton_pwm_ctl1_cnttype_mask(unsigned int ch)
+{
+	return MA35D1_PWM_WGCTL_ACTION_MASK << (2 * ch);
+}
+
+static inline u32 nuvoton_pwm_wgctl_zero_mask(unsigned int ch)
+{
+	return MA35D1_PWM_WGCTL_ACTION_MASK << (2 * ch);
+}
+
+static inline u32 nuvoton_pwm_wgctl_period_mask(unsigned int ch)
+{
+	return MA35D1_PWM_WGCTL_ACTION_MASK << (16 + 2 * ch);
+}
+
+static inline u32 nuvoton_pwm_wgctl_cmp_up_mask(unsigned int ch)
+{
+	return MA35D1_PWM_WGCTL_ACTION_MASK << (2 * ch);
+}
+
+static inline u32 nuvoton_pwm_wgctl_cmp_down_mask(unsigned int ch)
+{
+	return MA35D1_PWM_WGCTL_ACTION_MASK << (16 + 2 * ch);
+}
+
+static inline u32 nuvoton_pwm_readl(struct nuvoton_pwm *nvtpwm,
+				    unsigned int offset)
+{
+	return readl(nvtpwm->base + offset);
+}
+
+static inline void nuvoton_pwm_writel(struct nuvoton_pwm *nvtpwm,
+				      unsigned int offset, u32 value)
+{
+	writel(value, nvtpwm->base + offset);
+}
+
+static inline void nuvoton_pwm_rmw(struct nuvoton_pwm *nvtpwm,
+				   unsigned int offset, u32 mask, u32 value)
+{
+	u32 reg;
+
+	reg = nuvoton_pwm_readl(nvtpwm, offset);
+	reg &= ~mask;
+	reg |= value & mask;
+	nuvoton_pwm_writel(nvtpwm, offset, reg);
+}
+
+static void nuvoton_pwm_init(struct nuvoton_pwm *nvtpwm)
+{
+	u32 ctl1_mask = 0;
+	u32 wgctl0_mask = 0;
+	u32 wgctl0_val = 0;
+	u32 wgctl1_mask = 0;
+	u32 wgctl1_val = 0;
+	int ch;
+
+	for (ch = 0; ch < MA35D1_PWM_NUM_CHANNELS; ch++) {
+		/* CNTTYPEn = 00: up counter type */
+		ctl1_mask |= nuvoton_pwm_ctl1_cnttype_mask(ch);
+
+		/* CNTMODEn = 0: auto-reload mode */
+		ctl1_mask |= MA35D1_PWM_CTL1_CNTMODE_MASK(ch);
+
+		/* ZPCTLn = 10: output high at zero point */
+		wgctl0_mask |= nuvoton_pwm_wgctl_zero_mask(ch);
+		wgctl0_val |= MA35D1_PWM_WGCTL_ZERO_HIGH(ch);
+
+		/* PRDPCTLn = 00: do nothing at period point */
+		wgctl0_mask |= nuvoton_pwm_wgctl_period_mask(ch);
+
+		/* CMPUCTLn = 01: output low at compare up point */
+		wgctl1_mask |= nuvoton_pwm_wgctl_cmp_up_mask(ch);
+		wgctl1_val |= MA35D1_PWM_WGCTL_CMP_UP_LOW(ch);
+
+		/* CMPDCTLn = 00: do nothing at compare down point */
+		wgctl1_mask |= nuvoton_pwm_wgctl_cmp_down_mask(ch);
+	}
+
+	for (ch = 0; ch < MA35D1_PWM_NUM_CHANNELS; ch += 2) {
+		/* OUTMODEn = 0: independent mode */
+		ctl1_mask |= MA35D1_PWM_CTL1_OUTMODE_MASK(ch);
+	}
+
+	nuvoton_pwm_rmw(nvtpwm, MA35D1_REG_PWM_CTL1, ctl1_mask, 0);
+	nuvoton_pwm_rmw(nvtpwm, MA35D1_REG_PWM_WGCTL0,
+			wgctl0_mask, wgctl0_val);
+	nuvoton_pwm_rmw(nvtpwm, MA35D1_REG_PWM_WGCTL1,
+			wgctl1_mask, wgctl1_val);
+}
+
+static int nuvoton_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
+			     const struct pwm_state *state)
+{
+	struct nuvoton_pwm *nvtpwm = nuvoton_pwm_from_chip(chip);
+	u32 ch = pwm->hwpwm;
+	u64 duty_cycles, period_cycles;
+	u32 cmpdat, period;
+
+	if (!state->enabled) {
+		nuvoton_pwm_rmw(nvtpwm, MA35D1_REG_PWM_POEN,
+				MA35D1_PWM_POEN_EN(ch), 0);
+		nuvoton_pwm_rmw(nvtpwm, MA35D1_REG_PWM_CNTEN,
+				MA35D1_PWM_CNTEN_EN(ch), 0);
+
+		return 0;
+	}
+
+	period_cycles = mul_u64_u64_div_u64(nvtpwm->clkrate,
+					    state->period,
+					    NSEC_PER_SEC);
+	if (!period_cycles)
+		return -EINVAL;
+
+	if (period_cycles > MA35D1_PWM_MAX_PERIOD_CYCLES)
+		period_cycles = MA35D1_PWM_MAX_PERIOD_CYCLES;
+
+	duty_cycles = mul_u64_u64_div_u64(nvtpwm->clkrate,
+					  state->duty_cycle,
+					  NSEC_PER_SEC);
+	if (duty_cycles > period_cycles)
+		duty_cycles = period_cycles;
+
+	if (state->polarity == PWM_POLARITY_NORMAL)
+		nuvoton_pwm_rmw(nvtpwm, MA35D1_REG_PWM_POLCTL,
+				MA35D1_PWM_POLCTL_INV(ch), 0);
+	else
+		nuvoton_pwm_rmw(nvtpwm, MA35D1_REG_PWM_POLCTL,
+				MA35D1_PWM_POLCTL_INV(ch),
+				MA35D1_PWM_POLCTL_INV(ch));
+
+	/*
+	 * In up-counting mode the counter counts from 0 to PERIOD inclusive.
+	 * With zero point high and compare-up point low actions:
+	 * - CMPDAT = 0 produces 0% duty.
+	 * - CMPDAT > PERIOD produces 100% duty.
+	 * PERIOD is limited to 0xfffe, so duty_cycles can be written directly
+	 * to CMPDAT and still fit in the 16-bit compare field for 100% duty.
+	 */
+	period = period_cycles - 1;
+	cmpdat = duty_cycles;
+
+	nuvoton_pwm_writel(nvtpwm, MA35D1_REG_PWM_PERIOD(ch), period);
+	nuvoton_pwm_writel(nvtpwm, MA35D1_REG_PWM_CMPDAT(ch), cmpdat);
+
+	nuvoton_pwm_rmw(nvtpwm, MA35D1_REG_PWM_CNTEN,
+			MA35D1_PWM_CNTEN_EN(ch), MA35D1_PWM_CNTEN_EN(ch));
+	nuvoton_pwm_rmw(nvtpwm, MA35D1_REG_PWM_POEN,
+			MA35D1_PWM_POEN_EN(ch), MA35D1_PWM_POEN_EN(ch));
+
+	return 0;
+}
+
+static int nuvoton_pwm_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
+				 struct pwm_state *state)
+{
+	struct nuvoton_pwm *nvtpwm = nuvoton_pwm_from_chip(chip);
+	u32 ch = pwm->hwpwm;
+	u32 cmpdat, cnten, period, poen, polctl;
+	u64 duty_cycles, period_cycles;
+
+	cnten = nuvoton_pwm_readl(nvtpwm, MA35D1_REG_PWM_CNTEN);
+	poen = nuvoton_pwm_readl(nvtpwm, MA35D1_REG_PWM_POEN);
+	polctl = nuvoton_pwm_readl(nvtpwm, MA35D1_REG_PWM_POLCTL);
+	period = nuvoton_pwm_readl(nvtpwm, MA35D1_REG_PWM_PERIOD(ch)) &
+		 MA35D1_PWM_MAX_CMPDAT;
+	cmpdat = nuvoton_pwm_readl(nvtpwm, MA35D1_REG_PWM_CMPDAT(ch)) &
+		 MA35D1_PWM_MAX_CMPDAT;
+
+	period_cycles = period + 1;
+	if (cmpdat > period)
+		duty_cycles = period_cycles;
+	else
+		duty_cycles = cmpdat;
+
+	state->enabled = (cnten & MA35D1_PWM_CNTEN_EN(ch)) &&
+			 (poen & MA35D1_PWM_POEN_EN(ch));
+	state->polarity = (polctl & MA35D1_PWM_POLCTL_INV(ch)) ?
+			  PWM_POLARITY_INVERSED : PWM_POLARITY_NORMAL;
+	state->period = DIV64_U64_ROUND_UP(period_cycles * NSEC_PER_SEC,
+					   nvtpwm->clkrate);
+	state->duty_cycle = DIV64_U64_ROUND_UP(duty_cycles * NSEC_PER_SEC,
+					       nvtpwm->clkrate);
+
+	return 0;
+}
+
+static const struct pwm_ops nuvoton_pwm_ops = {
+	.apply = nuvoton_pwm_apply,
+	.get_state = nuvoton_pwm_get_state,
+};
+
+static int nuvoton_pwm_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct pwm_chip *chip;
+	struct nuvoton_pwm *nvtpwm;
+	struct clk *clk;
+	int ret;
+
+	chip = devm_pwmchip_alloc(dev, MA35D1_PWM_NUM_CHANNELS,
+				  sizeof(*nvtpwm));
+	if (IS_ERR(chip))
+		return PTR_ERR(chip);
+
+	nvtpwm = nuvoton_pwm_from_chip(chip);
+
+	nvtpwm->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(nvtpwm->base))
+		return PTR_ERR(nvtpwm->base);
+
+	clk = devm_clk_get_enabled(dev, NULL);
+	if (IS_ERR(clk))
+		return dev_err_probe(dev, PTR_ERR(clk),
+				     "Unable to get the clock\n");
+
+	ret = devm_clk_rate_exclusive_get(dev, clk);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "Unable to get exclusive clock rate\n");
+
+	nvtpwm->clkrate = clk_get_rate(clk);
+	if (!nvtpwm->clkrate)
+		return dev_err_probe(dev, -EINVAL,
+				     "PWM clock rate is zero\n");
+
+	if (nvtpwm->clkrate > NSEC_PER_SEC)
+		return dev_err_probe(dev, -EINVAL,
+				     "PWM clock out of range (%lu)\n",
+				     nvtpwm->clkrate);
+
+	nuvoton_pwm_init(nvtpwm);
+
+	chip->ops = &nuvoton_pwm_ops;
+	chip->atomic = true;
+
+	ret = devm_pwmchip_add(dev, chip);
+	if (ret)
+		return dev_err_probe(dev, ret, "Unable to add PWM chip\n");
+
+	return 0;
+}
+
+static const struct of_device_id nuvoton_pwm_of_match[] = {
+	{ .compatible = "nuvoton,ma35d1-pwm" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, nuvoton_pwm_of_match);
+
+static struct platform_driver nuvoton_pwm_driver = {
+	.probe = nuvoton_pwm_probe,
+	.driver = {
+		.name = "nuvoton-pwm",
+		.of_match_table = nuvoton_pwm_of_match,
+	},
+};
+module_platform_driver(nuvoton_pwm_driver);
+
+MODULE_AUTHOR("Chi-Wen Weng <cwweng@nuvoton.com>");
+MODULE_DESCRIPTION("Nuvoton MA35D1 PWM driver");
+MODULE_LICENSE("GPL");
-- 
2.25.1


