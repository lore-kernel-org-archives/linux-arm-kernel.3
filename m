Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 385D2F44874
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 14:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SFH9HkuqRORBaQ1DhfyanXw+/L8CLUaspI4xBL/ZFQc=; b=04QXbT48mcTnNdrKEDNYQqZquV
	dQHPb6MGXxDy5qoKAyaQ0vCfHgXed7/JBGfJUEsdn7GdJNd76ZmA6ISpJZUvD8mqDM7QD/G4RtyMH
	1tbzgWb3az3Hj2N+QmpwfIj/8b5CBAW0JQVuB5k+GqEqX/dQsjnIK986huzQOAVEA2zBqrwEKuivH
	UfU1D2mgs2fgAfkijxdKZt5G9eOz9eVfnuXJGbgxMvZe7sR4CETnHvsF9sTOKxbJkir8i/6YBnfk4
	G++4smSydNs6o9/Vn1Qvt+V1VPHi9iJBDX4KEbtC9HwSH9cZo5nntdpb+85hdtE4IX6fsh82jDpDP
	LYRkajGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBCVq-0000000CMFp-02MJ;
	Fri, 10 Apr 2026 14:07:10 +0000
Received: from mail-wm1-f54.google.com ([209.85.128.54])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBCVn-0000000CMEA-2s2j
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Apr 2026 14:07:09 +0000
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-488aa77a06eso32947085e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Apr 2026 07:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1775830025; x=1776434825; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SFH9HkuqRORBaQ1DhfyanXw+/L8CLUaspI4xBL/ZFQc=;
        b=dyT/x01PmzSBp8JHR1f4oJQsgVaq/+stFwdd2ixe11nNi/Bl4+07wW4vgaPibb54Iz
         rOh6UyBFJ63Pg7Y2uIuTH2Fal+yyWmtmPGjOUE4qTokhscVKKVLiIbFWsectoGX5onnj
         3nPEDNtpOorJ1/ejvl9dxWO6H7OwKpyN6GspWo21dtQ8i5jJziImaRxf+cZ4DM9pf/OA
         C0Pubq8Ip/m2es5gsVVyhf4LGtIQkKnccIEUJLldkrJ7gMjtn0RDWue9DmrjzOYgDxbF
         Vzut4iGmFbL+NADsLhGFNZCy3wwaBO7/V2MBaLyZS2cxlKcb6IQk3KMKHjzjRFCjHwSi
         6ztw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775830025; x=1776434825;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SFH9HkuqRORBaQ1DhfyanXw+/L8CLUaspI4xBL/ZFQc=;
        b=eJfVe8EulYjkOhNBKNKm5R0TM1P7jjTuPF3o0LBF/9dfI+aLDuXEuIUXRYBbW9njR5
         6QvYDMK5xfoI8MpkffbGKeGZWSYGVLn0XRpcFF5110ZrJNcH7kz1hxj4I8gSWzeAlsN4
         d2twbYt1NGbhWxL/ReSoZOByjbREMg4y6wUOZ16eEvhXFdWQFQxpZFPfn/ZpXD8RyA3k
         TBE07ygrB3BQR+d/w4B6ENFSJY/Va4vTCetLNqWagXbbiIjDwhSFz/5m1yvEfY/ptsqZ
         qUAUPLrF8RdqghyizXU3zOHI1UkWp56hCSuRAp/j9f4pcbwEP+LcTCz9gRUZb9y7TOtH
         7quw==
X-Forwarded-Encrypted: i=1; AJvYcCWKCUHqLkpTzzA/pxuJqGDLFur3cxM73cTf4dEqeb880CdWw85CX4RrcvSiB+/4E6G7MEZf0xCkoLiTeV+HMJGe@lists.infradead.org
X-Gm-Message-State: AOJu0YwoEO7qjiJXFWntMp2T6EhrOjtsha9I54h66M4QsGiQ6eChjRWb
	3LRoDhQM5eTz2R8e8azmU3raiKxVsKvyMJJoxYkdaTJO+nkvwDeY/F4eDLqF1hpGF3U=
X-Gm-Gg: AeBDievE6K99+wqVPx2lC24Rx5TET78r0kkVVqW1ZbFx2i92/MBzk/1jtw9QYGvXZqM
	aXgplWCNl868zEjBBSAH7Fzuy2kdGH5IUnRG1nq9KA+7H6DNUBqrs4Ic+sl26FDHC6xg9L+jYxK
	xOAqvfNs9ceEn3K9ChJcM0tdDP5ijoi1VNcvqCyh4E71PigwFBvNfavgSGXe0OhAPR+HFtfW/KB
	5+gwpTQA+3vnKEpIWmuF4mKK0/I2ohRcDkHgCWae3AmAkac0bYtyC9kH4Znrv4ALj6HsSsdJXFs
	fGf+UzZYMVaNJFmiaP9WyJ9avGvJckJRMl0W4VbaZxZOXwbxgSnSkEQzqW/1sXHD/N9lpkOZl2J
	U4KidhW2TBYSj3Ljgn8NnDknH0Tm4OEa3u1Km4tZJNnSuEvCohi1wpG9jmH3RYqHQufCUSwxSHd
	rNxSFwVAoZ0dNwgEJ57cFyQbkWbB5Cy+CmFHWoOjy2LOG3f/7eew==
X-Received: by 2002:a05:600c:5298:b0:485:3ee1:eba5 with SMTP id 5b1f17b1804b1-488d68820abmr45138605e9.27.1775830025295;
        Fri, 10 Apr 2026 07:07:05 -0700 (PDT)
Received: from localhost (93-41-3-120.ip79.fastwebnet.it. [93.41.3.120])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d5344e28sm81284895e9.7.2026.04.10.07.07.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 07:07:04 -0700 (PDT)
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
Subject: [PATCH v2 2/3] pwm: rp1: Add RP1 PWM controller driver
Date: Fri, 10 Apr 2026 16:09:58 +0200
Message-ID: <0d99317b9150310dfbd98de1cb2a890f0bffe7cd.1775829499.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1775829499.git.andrea.porta@suse.com>
References: <cover.1775829499.git.andrea.porta@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_070707_771262_01E8C007 
X-CRM114-Status: GOOD (  29.35  )
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
 drivers/pwm/Kconfig   |   9 ++
 drivers/pwm/Makefile  |   1 +
 drivers/pwm/pwm-rp1.c | 344 ++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 354 insertions(+)
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
index 0000000000000..b88c697d9567e
--- /dev/null
+++ b/drivers/pwm/pwm-rp1.c
@@ -0,0 +1,344 @@
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
+ * - Channels can be enabled/disabled and their duty cycle and period can
+ *   be updated glitchlessly. Update are synchronized with the next strobe
+ *   at the end of the current period of the respective channel, once the
+ *   update bit is set. The update flag is global, not per-channel.
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
+
+#define RP1_PWM_GLOBAL_CTRL	0x000
+#define RP1_PWM_CHANNEL_CTRL(x)	(0x014 + ((x) * 0x10))
+#define RP1_PWM_RANGE(x)	(0x018 + ((x) * 0x10))
+#define RP1_PWM_PHASE(x)	(0x01C + ((x) * 0x10))
+#define RP1_PWM_DUTY(x)		(0x020 + ((x) * 0x10))
+
+/* 8:FIFO_POP_MASK + 0:Trailing edge M/S modulation */
+#define RP1_PWM_CHANNEL_DEFAULT		(BIT(8) + BIT(0))
+#define RP1_PWM_CHANNEL_ENABLE(x)	BIT(x)
+#define RP1_PWM_POLARITY		BIT(3)
+#define RP1_PWM_SET_UPDATE		BIT(31)
+#define RP1_PWM_MODE_MASK		GENMASK(1, 0)
+
+#define RP1_PWM_NUM_PWMS	4
+
+struct rp1_pwm {
+	struct regmap	*regmap;
+	struct clk	*clk;
+	unsigned long	clk_rate;
+	bool		clk_enabled;
+};
+
+struct rp1_pwm_waveform {
+	u32	period_ticks;
+	u32	duty_ticks;
+	bool	enabled;
+	bool	inverted_polarity;
+};
+
+static const struct regmap_config rp1_pwm_regmap_config = {
+	.reg_bits    = 32,
+	.val_bits    = 32,
+	.reg_stride  = 4,
+	.max_register = 0x60,
+};
+
+static void rp1_pwm_apply_config(struct pwm_chip *chip, struct pwm_device *pwm)
+{
+	struct rp1_pwm *rp1 = pwmchip_get_drvdata(chip);
+	u32 value;
+
+	/* update the changed registers on the next strobe to avoid glitches */
+	regmap_read(rp1->regmap, RP1_PWM_GLOBAL_CTRL, &value);
+	value |= RP1_PWM_SET_UPDATE;
+	regmap_write(rp1->regmap, RP1_PWM_GLOBAL_CTRL, value);
+}
+
+static int rp1_pwm_request(struct pwm_chip *chip, struct pwm_device *pwm)
+{
+	struct rp1_pwm *rp1 = pwmchip_get_drvdata(chip);
+
+	/* init channel to reset defaults */
+	regmap_write(rp1->regmap, RP1_PWM_CHANNEL_CTRL(pwm->hwpwm), RP1_PWM_CHANNEL_DEFAULT);
+	return 0;
+}
+
+static int rp1_pwm_round_waveform_tohw(struct pwm_chip *chip,
+				       struct pwm_device *pwm,
+				       const struct pwm_waveform *wf,
+				       void *_wfhw)
+{
+	struct rp1_pwm *rp1 = pwmchip_get_drvdata(chip);
+	struct rp1_pwm_waveform *wfhw = _wfhw;
+	u64 clk_rate = rp1->clk_rate;
+	u64 ticks;
+
+	ticks = mul_u64_u64_div_u64(wf->period_length_ns, clk_rate, NSEC_PER_SEC);
+
+	if (ticks > U32_MAX)
+		ticks = U32_MAX;
+	wfhw->period_ticks = ticks;
+
+	if (wf->duty_offset_ns + wf->duty_length_ns >= wf->period_length_ns) {
+		ticks = mul_u64_u64_div_u64(wf->period_length_ns - wf->duty_length_ns,
+					    clk_rate, NSEC_PER_SEC);
+		wfhw->inverted_polarity = true;
+	} else {
+		ticks = mul_u64_u64_div_u64(wf->duty_length_ns, clk_rate, NSEC_PER_SEC);
+		wfhw->inverted_polarity = false;
+	}
+
+	if (ticks > wfhw->period_ticks)
+		ticks = wfhw->period_ticks;
+	wfhw->duty_ticks = ticks;
+
+	wfhw->enabled = !!wfhw->duty_ticks;
+
+	return 0;
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
+	memset(wf, 0, sizeof(*wf));
+
+	if (!wfhw->enabled)
+		return 0;
+
+	wf->period_length_ns = DIV_ROUND_UP_ULL((u64)wfhw->period_ticks * NSEC_PER_SEC, clk_rate);
+
+	if (wfhw->inverted_polarity) {
+		wf->duty_length_ns = DIV_ROUND_UP_ULL((u64)wfhw->duty_ticks * NSEC_PER_SEC,
+						      clk_rate);
+	} else {
+		wf->duty_offset_ns = DIV_ROUND_UP_ULL((u64)wfhw->duty_ticks * NSEC_PER_SEC,
+						      clk_rate);
+		ticks = wfhw->period_ticks - wfhw->duty_ticks;
+		wf->duty_length_ns = DIV_ROUND_UP_ULL((u64)ticks * NSEC_PER_SEC, clk_rate);
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
+	u32 value;
+
+	/* set period and duty cycle */
+	regmap_write(rp1->regmap,
+		     RP1_PWM_RANGE(pwm->hwpwm), wfhw->period_ticks);
+	regmap_write(rp1->regmap,
+		     RP1_PWM_DUTY(pwm->hwpwm), wfhw->duty_ticks);
+
+	/* set polarity */
+	regmap_read(rp1->regmap, RP1_PWM_CHANNEL_CTRL(pwm->hwpwm), &value);
+	if (!wfhw->inverted_polarity)
+		value &= ~RP1_PWM_POLARITY;
+	else
+		value |= RP1_PWM_POLARITY;
+	regmap_write(rp1->regmap, RP1_PWM_CHANNEL_CTRL(pwm->hwpwm), value);
+
+	/* enable/disable */
+	regmap_read(rp1->regmap, RP1_PWM_GLOBAL_CTRL, &value);
+	if (wfhw->enabled)
+		value |= RP1_PWM_CHANNEL_ENABLE(pwm->hwpwm);
+	else
+		value &= ~RP1_PWM_CHANNEL_ENABLE(pwm->hwpwm);
+	regmap_write(rp1->regmap, RP1_PWM_GLOBAL_CTRL, value);
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
+	regmap_read(rp1->regmap, RP1_PWM_GLOBAL_CTRL, &value);
+	wfhw->enabled = !!(value & RP1_PWM_CHANNEL_ENABLE(pwm->hwpwm));
+
+	regmap_read(rp1->regmap, RP1_PWM_CHANNEL_CTRL(pwm->hwpwm), &value);
+	wfhw->inverted_polarity = !!(value & RP1_PWM_POLARITY);
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
+		dev_err_probe(dev, ret, "Fail to get exclusive rate\n");
+		goto err_disable_clk;
+	}
+
+	clk_rate = clk_get_rate(rp1->clk);
+	if (!clk_rate) {
+		ret = dev_err_probe(dev, -EINVAL, "Failed to get clock rate\n");
+		goto err_disable_clk;
+	}
+	rp1->clk_rate = clk_rate;
+
+	chip->ops = &rp1_pwm_ops;
+
+	platform_set_drvdata(pdev, chip);
+
+	ret = devm_pwmchip_add(dev, chip);
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
+		dev_err(dev, "Failed to enable clock on resume: %d\n", ret);
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


