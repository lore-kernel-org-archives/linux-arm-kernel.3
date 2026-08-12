Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 248A2C5AD5A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 12:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XFMlwpc6tCSzUQMVWNSN4gTByCEbr3imhWdA2ltyOwE=; b=zvdUi7FGjkohvCeoCoT29SfddC
	jvDj9kUWg908xtAPRqvuCcn+GEA4zQPfFRRgtbbb6xhMbeJ9GatRTCyQFftZ7r+iPTcGRm0BA6T2S
	4aXUYEqtUoHikkPcX8MTmTiuZICVPFOm8etPbtPK+u1tMqW3wjeCX75++mm5Thb9ofE5B1GdXPns+
	X12Jw+8GJDKbw+mqbLIKM5CffbVdjV0acUhlCSa7LsdbFYSf8kfHjEVPa7+vOyzGoy5VMXDT6yFcv
	YqkO6pNdpt4RSz3yisRiXSbdJYubSEEhIgWWxV87gdLjwafblk0j4iIz0xI6jyAgnO8R+HojYYvvy
	nst53jiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu7e8-0000000G9Dn-0rZt;
	Wed, 12 Aug 2026 12:01:24 +0000
Received: from mail-wr2-x02.google.com ([2a00:1450:4864:30::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu7e5-0000000G9C8-2AEx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 12:01:22 +0000
Received: by mail-wr2-x02.google.com with SMTP id ffacd0b85a97d-47f7f93b3d4so178740f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Aug 2026 05:01:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wirenboard.com; s=google; t=1786536079; x=1787140879; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XFMlwpc6tCSzUQMVWNSN4gTByCEbr3imhWdA2ltyOwE=;
        b=jRq+GUNYthzFrUclosoNqwOvbtrhoT2Ws3WlVRV4XYVyXn0F3xrVoBW5H2X1iS/Wov
         Y0Ltnm2lGKafKYokCmpcl/oiOpcJSGeBJIBLVtJ0Nawp6lOUQIp7CUXKY346kLOsNRKF
         znwHHUUKEkR4YaJBXIT4sc8iUefqLkt5G7vUt93iPwVvVVoeaJZ4iIFkZ2NwSIFJvfnX
         G88gNCr8bI+DLL6Y46JSzC6tPiRfFAFmfkDWQoszZybmcNq38GXFLtcwqwbqQAcl6qJo
         0RjBI5EbTgEPSo5TNNU0XAc2nd/2hsowcUxkkCDTbkgAWvoR/8lyfB8SCQIh4kVXOSYR
         WMcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786536079; x=1787140879;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XFMlwpc6tCSzUQMVWNSN4gTByCEbr3imhWdA2ltyOwE=;
        b=LMLD/e/4OXPCMs7ZLTjttRBeG9V0x9m7Q2dmX6itS8LBXKFpJiD+3BteSeYsvwrgNp
         pK6Qsim5vMZtdvVDi+GN401/qXVfEi63Z8IWYElxnfsoetnPpHhJ+dGMIGIcpNPNAm63
         yadfL/EsjjAhWQ5RW+PtQ+czOcbUKG8MMOKiUQSZaTmMjBOEBZPCuqZG99/jAydOFXC5
         HbKCyTcLGtojEEcGXVsDuQ+VHW3d2JEwXHI3i/32aXo+dHq84u0bfM9zSbH6GLx4wo9X
         /bGpNfgwa1UyVRlqHX60Xv3OnaABlbHuvPeFhSKAVRbO6pKIm+Dyt9FmKIWpS4E4wUfS
         neng==
X-Forwarded-Encrypted: i=1; AHgh+Rpc66JMOx/ig7jfaV/wPSoBwS3pB+0hm+jPRaO3b2Mmekig7YRzrIu785+xO7NrOVgW2j407b7Ykni384gp8zTC@lists.infradead.org
X-Gm-Message-State: AOJu0YyWialYvCHUXvcSfXqpsVA476iUqEW21EkmlHNnf3t/SZAlpx0s
	4amU9npYQ2avd+SrGvpvD6syLohFfarVMEx0CcYG2Byn/bQUQrPyFo7JART2Zu054vU=
X-Gm-Gg: AR+sD13Lf461hVYIvwdaEpFhXURMXYChpIuNpi9Y7lk1MHeYqw35IxBN317ET5nm1WX
	MuTSFO+RJ037ibz0VFbB9Zg/a4C01rDFX4HffohchAYYpJ2asA8p/vurnYRpYzQIcsVBMggtEE1
	14XHSm+C0ujX5VPWg5E8oOFBIhYAQgl6k6dyI6V1LMfV1FRnfJqA3qU3Bme+9TeJEuBkExBJp6V
	upvurnFPyDXN15p5EMX4cMdccHprqiT8XyHkPyJ3rsF62k+hokX1yTMC8JoYCAY1QSJxzxidTOP
	KrzborioAyOH6yt7eLuO9OCg2SSHXyIN3OZh/T6gy73AfTc43Wj1gQvhqu3ZdSZxpgwX5ZHgQxi
	Zp0uBYA5MpPeHCfkgOh1Trv7doBARTfFox5TB67et1ilJIjExA7vcp68V/L1WobWRnDZ+QIcGO0
	98CJHRzp2lcB/hVjeFiKDbskm+suS34eHdJXJOipvWHaQCMl02Vpwzw7/nAt/BkmCqPcz8B7Wu8
	3mNXwrncDhIBFIbpc/lEKQ=
X-Received: by 2002:a05:6000:240c:b0:47f:e797:41c8 with SMTP id ffacd0b85a97d-481527a0c61mr6728195f8f.4.1786536077716;
        Wed, 12 Aug 2026 05:01:17 -0700 (PDT)
Received: from localhost.localdomain ([85.137.25.106])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48150d4e29bsm6609473f8f.24.2026.08.12.05.01.15
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 12 Aug 2026 05:01:17 -0700 (PDT)
From: Ilya Titov <ilya.titov@wirenboard.com>
To: Linus Walleij <linusw@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	=?UTF-8?q?Emilio=20L=C3=B3pez?= <emilio@elopez.com.ar>,
	linux-gpio@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ilya Titov <ilya.titov@wirenboard.com>
Subject: [PATCH] pinctrl: sunxi: keep a shadow copy of the data register output latches
Date: Wed, 12 Aug 2026 15:01:14 +0300
Message-ID: <20260812120114.32501-1-ilya.titov@wirenboard.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_050121_637332_1FC89AE7 
X-CRM114-Status: GOOD (  32.86  )
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

On Allwinner SoCs, reading a bank's data register returns the pin level,
not the output latch, for pins that are muxed as inputs.  Writing a GPIO
therefore corrupts the output latches of all input-muxed pins in the
same bank: the read-modify-write in sunxi_pinctrl_gpio_set() reads back
their pin levels and writes those into their latches.

This breaks emulated open-drain lines (e.g. a bit-banged I2C bus from
i2c-gpio).  Such a line is released high by muxing it as input and
letting the pull-up raise it, so any concurrent GPIO write in the same
bank stores 1 into its latch.  Driving the line low afterwards is a
non-atomic data-then-mux sequence in sunxi_pinctrl_gpio_direction_output();
if the poisoning write lands between the two steps, the pin actively
drives high (push-pull) instead of low.

Observed in practice as sporadic glitches on a T507 board bit-banging
I2C on port E while other PE GPIOs are toggled.  On a scope the failure
is unmistakable: on a clock pulse where SCL should fall to GND, the line
instead steps *above* its idle high level for the whole low phase — the
pad drives a strong push-pull 3.3 V high, higher than the level the
pull-up sustains on the loaded bus — before the next transition recovers
it.  The same can hit SDA, corrupting data instead of clocks.

Steps to reproduce on any sunxi board with a bit-banged (i2c-gpio) bus:

  # background: toggle any other GPIO of the same bank, e.g. line 21
  gpioset -c <chip> --toggle 100us 21=0 &

  # foreground: keep the bit-banged bus busy
  while :; do i2cdetect -y <bus> 0x50 0x57; done

  # watch SCL/SDA with a scope or logic analyzer: sporadic clock-low
  # phases driven high (above the pull-up level) instead of low

The bank spinlock cannot help: the racing write is a perfectly valid
whole-register RMW that faithfully writes back what the hardware
returned.  There are no set/clear registers on this IP to write a single
bit atomically.

Fix it the same way gpio-mmio handles hardware whose data register read
does not return the output latch: keep a shadow copy of each bank's
latches, base the read-modify-write on the shadow, and only write the
register.  The shadow is seeded from the hardware at probe time so pins
left in output mode by the bootloader keep their state.  Pins that reach
output mode through the gpiolib paths write their value (and thereby
their shadow bit) before the mux switch in
sunxi_pinctrl_gpio_direction_output(); pins muxed to gpio_out directly
through a pinmux node bypass that path, so sunxi_pmx_set() refreshes
their shadow bit from the latch (readable once the pin is in output
mode) to keep them driving their pre-existing level.

Seeding the shadow reads the PIO registers at probe time, which requires
the bus clock to be enabled.  The clock was only requested at the very
end of probe, after devm_pinctrl_register() had already claimed the pin
hogs described in the device tree - which mux pins, and thus access
registers, with the clock still gated.  Move the request ahead of both.
Boards whose bootloader leaves the PIO clock running are unaffected,
which is why the pre-existing hog problem has gone unnoticed since
commit 950707c0eb5c ("pinctrl: sunxi: add clock support").

Fixes: df7b34f4c3d2 ("pinctrl: sunxi: Fix gpio_set behaviour")
Cc: stable@vger.kernel.org
Signed-off-by: Ilya Titov <ilya.titov@wirenboard.com>
---
Tested on a Wiren Board 8.5.1 (Allwinner T507) against a 6.18-based
kernel, where the problem was found: the bit-banged ATECC/RTC bus on
port E survives 200 probe rounds while another PE line is toggled every
100 us in the background, which reliably corrupted transfers before.

The mainline port has not been re-tested on that hardware; it was build
tested on v7.2-rc7 with arm64 allmodconfig and arm allmodconfig (all 28
PINCTRL_SUN* variants, W=1), both without new warnings, and sparse
(v0.6.5) reports nothing for the driver.

 drivers/pinctrl/sunxi/pinctrl-sunxi.c | 76 +++++++++++++++++++++------
 drivers/pinctrl/sunxi/pinctrl-sunxi.h |  7 +++
 2 files changed, 68 insertions(+), 15 deletions(-)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
index 25489beeb312..3cf5cd8ed991 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
@@ -837,6 +837,21 @@ static void sunxi_pmx_set(struct pinctrl_dev *pctldev,
 	writel((readl(pctl->membase + reg) & ~mask) | config << shift,
 	       pctl->membase + reg);
 
+	/*
+	 * A pin muxed to gpio_out directly through a pinmux node bypasses
+	 * sunxi_pinctrl_gpio_set() and drives whatever its output latch
+	 * holds.  Now that the pin is in output mode the data register
+	 * reads back the latch, so refresh the shadow to keep such pins
+	 * driving their pre-existing level.
+	 */
+	if (config == SUN4I_FUNC_OUTPUT) {
+		u32 *shadow = &pctl->dat_shadow[pin / PINS_PER_BANK];
+
+		sunxi_data_reg(pctl, pin, &reg, &shift, &mask);
+		*shadow = (*shadow & ~mask) |
+			  (readl(pctl->membase + reg) & mask);
+	}
+
 	raw_spin_unlock_irqrestore(&pctl->lock, flags);
 }
 
@@ -1017,21 +1032,29 @@ static int sunxi_pinctrl_gpio_set(struct gpio_chip *chip, unsigned int offset,
 				  int value)
 {
 	struct sunxi_pinctrl *pctl = gpiochip_get_data(chip);
-	u32 reg, shift, mask, val;
+	u32 *shadow = &pctl->dat_shadow[offset / PINS_PER_BANK];
+	u32 reg, shift, mask;
 	unsigned long flags;
 
 	sunxi_data_reg(pctl, offset, &reg, &shift, &mask);
 
 	raw_spin_lock_irqsave(&pctl->lock, flags);
 
-	val = readl(pctl->membase + reg);
-
+	/*
+	 * Reading the data register returns the pin level, not the output
+	 * latch, for pins muxed as inputs.  A read-modify-write based on
+	 * the register would therefore corrupt the latches of input-muxed
+	 * pins in the same bank (e.g. an emulated open-drain I2C line
+	 * released high), making them drive the wrong level once switched
+	 * to output.  Base the read-modify-write on a shadow copy of the
+	 * latches instead.
+	 */
 	if (value)
-		val |= mask;
+		*shadow |= mask;
 	else
-		val &= ~mask;
+		*shadow &= ~mask;
 
-	writel(val, pctl->membase + reg);
+	writel(*shadow, pctl->membase + reg);
 
 	raw_spin_unlock_irqrestore(&pctl->lock, flags);
 
@@ -1572,7 +1595,7 @@ int sunxi_pinctrl_init_with_flags(struct platform_device *pdev,
 	struct pinctrl_pin_desc *pins;
 	struct sunxi_pinctrl *pctl;
 	struct pinmux_ops *pmxops;
-	int i, ret, last_pin, pin_idx;
+	int i, ret, last_pin, pin_idx, nbanks;
 	struct clk *clk;
 
 	pctl = devm_kzalloc(&pdev->dev, sizeof(*pctl), GFP_KERNEL);
@@ -1610,6 +1633,37 @@ int sunxi_pinctrl_init_with_flags(struct platform_device *pdev,
 	if (!pctl->irq_array)
 		return -ENOMEM;
 
+	/*
+	 * The bus clock has to be enabled before the pinctrl device
+	 * registers, as the pin hogs claimed from there access registers.
+	 */
+	ret = of_clk_get_parent_count(node);
+	clk = devm_clk_get_enabled(&pdev->dev, ret == 1 ? NULL : "apb");
+	if (IS_ERR(clk))
+		return PTR_ERR(clk);
+
+	/*
+	 * Seed the output latch shadow from the hardware so pins the
+	 * bootloader left in output mode keep their state; see
+	 * sunxi_pinctrl_gpio_set() for why a shadow is needed.  This must
+	 * happen before the pinctrl device registers, as pin hogs can mux
+	 * pins to gpio_out and thereby update the shadow.
+	 */
+	last_pin = pctl->desc->pins[pctl->desc->npins - 1].pin.number;
+	nbanks = (round_up(last_pin, PINS_PER_BANK) - pctl->desc->pin_base) /
+		 PINS_PER_BANK;
+	pctl->dat_shadow = devm_kcalloc(&pdev->dev, nbanks,
+					sizeof(*pctl->dat_shadow), GFP_KERNEL);
+	if (!pctl->dat_shadow)
+		return -ENOMEM;
+
+	for (i = 0; i < nbanks; i++) {
+		u32 reg, shift, mask;
+
+		sunxi_data_reg(pctl, i * PINS_PER_BANK, &reg, &shift, &mask);
+		pctl->dat_shadow[i] = readl(pctl->membase + reg);
+	}
+
 	ret = sunxi_pinctrl_build_state(pdev);
 	if (ret) {
 		dev_err(&pdev->dev, "dt probe failed: %d\n", ret);
@@ -1665,7 +1719,6 @@ int sunxi_pinctrl_init_with_flags(struct platform_device *pdev,
 	if (!pctl->chip)
 		return -ENOMEM;
 
-	last_pin = pctl->desc->pins[pctl->desc->npins - 1].pin.number;
 	pctl->chip->owner = THIS_MODULE;
 	pctl->chip->request = gpiochip_generic_request;
 	pctl->chip->free = gpiochip_generic_free;
@@ -1699,13 +1752,6 @@ int sunxi_pinctrl_init_with_flags(struct platform_device *pdev,
 			goto gpiochip_error;
 	}
 
-	ret = of_clk_get_parent_count(node);
-	clk = devm_clk_get_enabled(&pdev->dev, ret == 1 ? NULL : "apb");
-	if (IS_ERR(clk)) {
-		ret = PTR_ERR(clk);
-		goto gpiochip_error;
-	}
-
 	pctl->irq = devm_kcalloc(&pdev->dev,
 				 pctl->desc->irq_banks,
 				 sizeof(*pctl->irq),
diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.h b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
index 0daf7600e2fb..498e88a19f71 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.h
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
@@ -85,6 +85,7 @@
 #define IO_BIAS_MASK		GENMASK(3, 0)
 
 #define SUN4I_FUNC_INPUT	0
+#define SUN4I_FUNC_OUTPUT	1
 #define SUN4I_FUNC_IRQ		6
 #define SUN4I_FUNC_DISABLED_OLD 7
 #define SUN4I_FUNC_DISABLED_NEW 15
@@ -175,6 +176,12 @@ struct sunxi_pinctrl {
 	int				*irq;
 	unsigned			*irq_array;
 	raw_spinlock_t			lock;
+	/*
+	 * Output latch shadow, one word per bank.  Seeded lockless at
+	 * probe before the pinctrl device registers, protected by @lock
+	 * afterwards.
+	 */
+	u32				*dat_shadow;
 	struct pinctrl_dev		*pctl_dev;
 	unsigned long			flags;
 	u32				bank_mem_size;

base-commit: f5bbbfec59b4e2fb7520a91de3df8a6174325d6a
-- 
2.50.1 (Apple Git-155)


