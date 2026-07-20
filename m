Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53918C44525
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 09:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eap+XzADpwE1kgYoDgVzv+ZEjUkajQS2L5TIi0QGnoA=; b=cZIJhfr7XJjb7004725g9eZk91
	lHW1lQV8A/SS2Aqp93ErZjYdosJgjzwv14ogboXdrv14kjnN34D0JB4JypTHBwhamEd0tQiVrDdKy
	ioKAks6CjQkliAbw7pSb/Jn7gzHaOKGlT1I1tIE7cnbLqhvORF12yAm6bA174bKdLoI96mh3EsSCV
	tVJRhPrknjVJOfJNEYHYDLrsA+03QZREkZEWIbxR1UE+ESwAtIX9yXAO3ZLZiH3MvchI+/x0gf8Yl
	wup88Y4qugPP3NhmrmvFoBK0HDFA4o5/K7rVQrIki08AV/Jq887QSalmTH4/BXWU/1CFtyz47zrcK
	aKKPI86Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlkUd-00000006LmR-3IlG;
	Mon, 20 Jul 2026 09:40:59 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlkUR-00000006LgT-2meX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 09:40:49 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-49547fc63a0so12874925e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 02:40:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1784540446; x=1785145246; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eap+XzADpwE1kgYoDgVzv+ZEjUkajQS2L5TIi0QGnoA=;
        b=dUv0tvsBSBnAthUuJZdRuxaa8mQMwLJvgP9l9RS2AT5458FfuHeNcpDdmIyASUM5Zj
         8wNmVybkY1ih/mdlHkybmBXvQikMCX1hZxG/bsci3uRhKC9whroXvQ5H1IlIpgToYf3E
         Rm8y7jjzro1MrkvBrUrjf9iEUW8qp4MkbnXEiQC4UaHc38GKTbZ1hbbyFR+MSPpOW54s
         Y0bl8jvv3XlQF/um0IYPvBDkxPtaIius71v8yLGHFbleupA9ptZXQhSgF8aaJS32RAGj
         7+pZIjOk6v9XqNCqQlGMIBy0qrKzGXtD1S0taJ5CcMKukXGvgf9MFeQXYeqiWY5dFDxB
         U06A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784540446; x=1785145246;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eap+XzADpwE1kgYoDgVzv+ZEjUkajQS2L5TIi0QGnoA=;
        b=foe/cehkO4+sV51gh28RlxlaW1y32WhRbeoVmFbhbCty20LySFOxzkgW4rraaSvRID
         gn66yqvnJipmvqwk1o3rbEZVh6SPD0GYJlMdX2Tk6D6rMokxeFr2jfT7XjrVvQe0sbOQ
         5/M8gzASK7Oo25KUyA6Lo/CP+35EDO4Jn6bJSFU0lo4fh8+0UdgHXLCxdJ5usjCesoG3
         vcgyUn9WH+9w8lzj1acEcYLROhQU3rqAtvTZG8PvdTOJPeuqdrmKPn2e8b6Z9qQOJphG
         KkBNzFWVJnvU12SvE5i5ZqJB6kOO6YLSpITB/0KzmEcCoeLJ9gzjyR/ER23/TK/IE3kh
         PxNg==
X-Forwarded-Encrypted: i=1; AHgh+Rp+VxKYDUo6SZjcjPkU8TR4oaAlTtpMLPik9VFbsB9WDiTDXKd/l6Wvwn+1Lt7J/DdXHtFvfuKaUAS+Nx0QsTfl@lists.infradead.org
X-Gm-Message-State: AOJu0YyG9sLESVV9PaN7r5MkAvvL+WiWNA5WGexTX0onI99LPDk2ivWK
	fl6C+tiIZo6nj+JK0nC1J2E/zELFNUawQrz1RT8foXMpuZfaNu7JtxJjroUpQQ0p2gs=
X-Gm-Gg: AfdE7cn3VHoCgwsoo36In9CvSL1JyXNRX6AfIlOGiYz/FXtq3znztTVayKPN6bRz0Bo
	eq82iM5bLCFNs/HwrudOXoUuVH1wtRQzDjG6v3eIDYoY8W0uO5AVbhIF9+Z/aTXhGiw9cRtpqSw
	Ujf3QjNAlb8E/xeW9/JbF7F2XOxxSeGR8MnHRE1ki5KW9xYWK/VDmeN/0uDk/iLyQ/s05VmYmZk
	jzSD3VoFP89p6OUVg+0O47J66n1gEaFSRwm9fKw04Mc2l5K4xmt14MiMDAyw29XF8pvDZeMjMmr
	wRngayE/45DS6Xsi6M310/JiLL1GfKFN5w2ckQ+1cm/4ahVZFCgEosSicE71UdWRxCH1Wq/3bot
	Iyfk+VEn3eJmqZSfsrL9ZxCbqwgM/bbII2BarV0pzai2g5EfpdSC8p6Uya9UPypeYuP6RoxkD6N
	3vrgo+rsahdbM=
X-Received: by 2002:a05:600c:1d1e:b0:493:a966:d5b5 with SMTP id 5b1f17b1804b1-4954a3d0cc7mr136283775e9.2.1784540445633;
        Mon, 20 Jul 2026 02:40:45 -0700 (PDT)
Received: from localhost ([195.94.145.62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4955de8895dsm65390975e9.4.2026.07.20.02.40.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 02:40:45 -0700 (PDT)
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
	mbrugger@suse.com,
	Sean Young <sean@mess.org>,
	Julian Braha <julianbraha@gmail.com>
Subject: [PATCH v7 2/3] pwm: rp1: Add RP1 PWM controller driver
Date: Mon, 20 Jul 2026 11:44:06 +0200
Message-ID: <a83d65b2d91865eb722337c547c94dce175e6086.1784539788.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1784539788.git.andrea.porta@suse.com>
References: <cover.1784539788.git.andrea.porta@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_024047_837046_BD1ECBF4 
X-CRM114-Status: GOOD (  34.67  )
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
 drivers/pwm/pwm-rp1.c | 428 ++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 438 insertions(+)
 create mode 100644 drivers/pwm/pwm-rp1.c

diff --git a/drivers/pwm/Kconfig b/drivers/pwm/Kconfig
index e8886a9b64d96..0373dcf8d400d 100644
--- a/drivers/pwm/Kconfig
+++ b/drivers/pwm/Kconfig
@@ -637,6 +637,15 @@ config PWM_ROCKCHIP
 	  Generic PWM framework driver for the PWM controller found on
 	  Rockchip SoCs.
 
+config PWM_RASPBERRYPI_RP1
+	tristate "RP1 PWM support"
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
index 5630a521a7cff..c07fd24f69f39 100644
--- a/drivers/pwm/Makefile
+++ b/drivers/pwm/Makefile
@@ -57,6 +57,7 @@ obj-$(CONFIG_PWM_RENESAS_RZG2L_GPT)	+= pwm-rzg2l-gpt.o
 obj-$(CONFIG_PWM_RENESAS_RZ_MTU3)	+= pwm-rz-mtu3.o
 obj-$(CONFIG_PWM_RENESAS_TPU)	+= pwm-renesas-tpu.o
 obj-$(CONFIG_PWM_ROCKCHIP)	+= pwm-rockchip.o
+obj-$(CONFIG_PWM_RASPBERRYPI_RP1)	+= pwm-rp1.o
 obj-$(CONFIG_PWM_SAMSUNG)	+= pwm-samsung.o
 obj-$(CONFIG_PWM_SIFIVE)	+= pwm-sifive.o
 obj-$(CONFIG_PWM_SL28CPLD)	+= pwm-sl28cpld.o
diff --git a/drivers/pwm/pwm-rp1.c b/drivers/pwm/pwm-rp1.c
new file mode 100644
index 0000000000000..e2d7af80dc071
--- /dev/null
+++ b/drivers/pwm/pwm-rp1.c
@@ -0,0 +1,428 @@
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
+	/* init channel to reset defaults, preserving the polarity bit */
+	regmap_update_bits(rp1->regmap, RP1_PWM_CHAN_CTRL(pwm->hwpwm),
+			   ~(u32)RP1_PWM_CHAN_CTRL_POLARITY, RP1_PWM_CHAN_CTRL_DEFAULT);
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
+		*wfhw = (typeof(*wfhw)){
+			.enabled = false,
+			.inverted_polarity = false,
+		};
+		return 0;
+	}
+
+	period_ticks = mul_u64_u64_div_u64(wf->period_length_ns, clk_rate, NSEC_PER_SEC);
+
+	/*
+	 * The period is limited to U32_MAX, and it will be decremented by one later
+	 * to allow 100% duty cycle.
+	 */
+	if (period_ticks > U32_MAX) {
+		period_ticks = U32_MAX;
+	} else if (period_ticks < 2) {
+		period_ticks = 2;
+		ret = 1;
+	}
+
+	duty_ticks = mul_u64_u64_div_u64(wf->duty_length_ns, clk_rate, NSEC_PER_SEC);
+	duty_ticks = min(duty_ticks, period_ticks);
+	offset_ticks = mul_u64_u64_div_u64(wf->duty_offset_ns, clk_rate, NSEC_PER_SEC);
+	if (offset_ticks >= period_ticks)
+		offset_ticks = period_ticks - 1;
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
+	u64 ticks;
+
+	*wf = (struct pwm_waveform){ };
+
+	if (!wfhw->enabled)
+		return 0;
+
+	wf->period_length_ns = DIV_ROUND_UP_ULL(((u64)wfhw->period_ticks + 1) * NSEC_PER_SEC,
+						clk_rate);
+
+	if (!wfhw->inverted_polarity) {
+		wf->duty_length_ns = DIV_ROUND_UP_ULL((u64)wfhw->duty_ticks * NSEC_PER_SEC,
+						      (u32)clk_rate);
+	} else {
+		if (wfhw->duty_ticks > (u64)wfhw->period_ticks + 1) {
+			/* 100% duty cycle case */
+			ticks = 0;
+		} else {
+			ticks = (u64)wfhw->period_ticks + 1 - wfhw->duty_ticks;
+		}
+		wf->duty_length_ns = DIV_ROUND_UP_ULL(ticks * NSEC_PER_SEC, clk_rate);
+		wf->duty_offset_ns = DIV_ROUND_UP_ULL((u64)(wfhw->period_ticks + 1 - ticks) *
+						      NSEC_PER_SEC, clk_rate);
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
+	/* set polarity */
+	regmap_read(rp1->regmap, RP1_PWM_CHAN_CTRL(pwm->hwpwm), &value);
+	if (!wfhw->inverted_polarity)
+		value &= ~RP1_PWM_CHAN_CTRL_POLARITY;
+	else
+		value |= RP1_PWM_CHAN_CTRL_POLARITY;
+	regmap_write(rp1->regmap, RP1_PWM_CHAN_CTRL(pwm->hwpwm), value);
+
+	/* early exit if disabled */
+	regmap_read(rp1->regmap, RP1_PWM_GLB_CTRL, &ctrl);
+	if (!wfhw->enabled) {
+		ctrl &= ~RP1_PWM_GLB_CTRL_CHANNEL_ENABLE(pwm->hwpwm);
+		/* just disable the channel and bail out early */
+		regmap_write(rp1->regmap, RP1_PWM_GLB_CTRL, ctrl);
+		rp1_pwm_apply_config(chip, pwm);
+		return 0;
+	}
+
+	/* set period and duty cycle */
+	regmap_write(rp1->regmap,
+		     RP1_PWM_RANGE(pwm->hwpwm), wfhw->period_ticks);
+	regmap_write(rp1->regmap,
+		     RP1_PWM_DUTY(pwm->hwpwm), wfhw->duty_ticks);
+
+	/* enable the channel */
+	ctrl |= RP1_PWM_GLB_CTRL_CHANNEL_ENABLE(pwm->hwpwm);
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
+		*wfhw = (typeof(*wfhw)) {
+			.period_ticks = 0,
+			.duty_ticks = 0,
+		};
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
+	chip->atomic = true;
+
+	platform_set_drvdata(pdev, chip);
+
+	ret = pwmchip_add(chip);
+	if (ret) {
+		dev_err_probe(dev, ret, "Failed to register PWM chip\n");
+		goto err_disable_clk;
+	}
+
+	ret = of_syscon_register_regmap(np, rp1->regmap);
+	if (ret) {
+		dev_err_probe(dev, ret, "Failed to register syscon\n");
+		goto err_remove_chip;
+	}
+
+	return 0;
+
+err_remove_chip:
+	pwmchip_remove(chip);
+err_disable_clk:
+	clk_disable_unprepare(rp1->clk);
+
+	return ret;
+}
+
+static int rp1_pwm_suspend(struct device *dev)
+{
+	struct pwm_chip *chip = dev_get_drvdata(dev);
+	struct rp1_pwm *rp1 = pwmchip_get_drvdata(chip);
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
+	struct pwm_chip *chip = dev_get_drvdata(dev);
+	struct rp1_pwm *rp1 = pwmchip_get_drvdata(chip);
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
+	/*
+	 * .remove is not needed because this driver cannot be removed/unbound
+	 * cause it relies on syscon which cannot be removed
+	 */
+	.driver = {
+		.name = "rp1-pwm",
+		.of_match_table = rp1_pwm_of_match,
+		.pm = pm_ptr(&rp1_pwm_pm_ops),
+		.suppress_bind_attrs = true,
+	},
+};
+builtin_platform_driver(rp1_pwm_driver);
+
+MODULE_DESCRIPTION("RP1 PWM driver");
+MODULE_AUTHOR("Naushir Patuck <naush@raspberrypi.com>");
+MODULE_AUTHOR("Andrea della Porta <andrea.porta@suse.com>");
+MODULE_LICENSE("GPL");
-- 
2.35.3


