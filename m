Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43C1AC624A4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 09:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H9qD0sFZ2P4s6++zHyN8ZE8Rd94yZI/MQR/y8ugP8/g=; b=DRSyMkbtbVYVnukxWGkFRdxSkv
	9T3gMb2WTq3SSlG6QianeW+kFSMYuVImW6a+/wB352fPxp09lr3wc3MZn0I9AKyTo2nRbdV6KIMBT
	hTd8Z4AVhP9wnDkuqUn18ifFm7Oe8zK8+NLnaxolzArSOw0uwjRXnIrC9wDomiSIfr4ydGfe1y2aG
	yzDPS7MmeNbBR1Hs0lVWMAFlJ+kWNwEU9iKptYyfyswCXRA4KOfO9bvhuq0Ibjc54SKv5nDP65D0i
	LLsyiYP+/T0bFO9cOA47UAtNqJW3x0wRRUNn/PUlgHMqqhcHVcISkOphQUtf6LqjOsoAGh+4iHLJI
	r9m+GMZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x23ZX-0000000Guyo-1JJi;
	Thu, 03 Sep 2026 09:17:27 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x23ZU-0000000Guwk-13gf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 09:17:25 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-482dd6ee390so2025626f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Sep 2026 02:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wirenboard.com; s=google; t=1788427042; x=1789031842; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=H9qD0sFZ2P4s6++zHyN8ZE8Rd94yZI/MQR/y8ugP8/g=;
        b=D2AAWZ3blAa9hYTJyxVU70JLl6kbAUuCjEzoNXi49S/4ZafO1yTDUi2MAkHEw+sik4
         RA5k7BSM50BIseNzot4pJloCdUItM8kUrXHuIwOOvd5Gvt5gkYzfYt/gKXIl0DfG/0kG
         PtMwe4KviKhOwECjanmZz46Qk7+SNKUozXWlkK6qOYPAO0QSOrUDWxUoviKA4tSHv08+
         /xDocHmaBsOOYpC/fBgG658D58Y+wtEkVFdRbmUzv54XfbdyO39iYgLbKnccW6vqM+F2
         fvQxDNz+IKVcqEy8pJDVg3I9Ne65qws9/DrXdII2QAgp1xmTDFqmIAExAMF+Vg6czX57
         u+Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788427042; x=1789031842;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H9qD0sFZ2P4s6++zHyN8ZE8Rd94yZI/MQR/y8ugP8/g=;
        b=D98hWTY6AfjKeKi6VqduTplUe5t8cBFs3XLEszJcUVqRvL98c0QxQKyE7B3s8ZuOzu
         1hbnAYGvBTCjsGwJU5hrexFWX2MO8/21KKws30Yw3al3pm0oWEE+NPTTGYqVOoVPcXK2
         rI7MYZIRxNXMXQV14NFAhTzScLpYwzdu2IhPnuLnOTSlkjKkbtMr+c+SNq9YjyBzHiyE
         75hSnLnN/0af++7QVIDrRF/cB5jBTvDZV3IAnFdYKY/OmNIZzLxmdCIZBKd5kQdSye/D
         HxptJTHrSRkOLYGORIMadyr9lGMFDgGV5VHUHqfc44YHWNo/XCfE/imNCiY730Vn8VkF
         ChZg==
X-Forwarded-Encrypted: i=1; AKwUvBzj26xTnW9LBVwTZNGJl7J0EOFlxemnoll2RUfwTtPXjsF5BpuR250Iq9nOZAu4n2nT8nHrZT/NgmjrX0DliMey@lists.infradead.org
X-Gm-Message-State: AFuF++kKJbGgfPAh8kZyknpCMvWjd102L8bsD36hn9m5l2WhqRWmLmMp
	6NsL8MIIycao2kZvVhkyZLxvc6kRSK4rnEczmfDkrvSKtmG+U7/xeAvmKL4BrXrbGu2tmm+DyJ2
	t3zFjpbpbNw==
X-Gm-Gg: AYBFou1vstMTcLBLUDuY1dglBaD5sRnAmuBJTtfm4EvknCSM7dqdhUZjTn+teIc3pZM
	MsrbRzIaafoLGcd+3a5mY/tJ723vDpf5ipEvWzTaUi9AWiHXXOQYzpxhRD/1zqiBGoAesgeo4vu
	b6nCg+ZstrdScGfb9uQutg6I2nuOkRxxjE1qtK9L25KETKmC/IqkJ1IIQAJqw5xvJ9mFH+jC6Ll
	JEhlgQaG/IfzRO6Btuc4UKLGg2z9KebFWJ+sapFtLNRDXEM7Kcrr1K8Y3aF+3krwdTo0AQzgl28
	P5wxnaIsuoBWBD4UlzwdcjOKOBsuay6fjTaHbmWz0fhyFsQlpeVJ/c/2HDPRfwOO0fN0x7s1KcR
	w0oxqPWMccIbFn9g6BDfRA5JB5qH9iYdumkTX9lvj6Hx7P0JowflBtLE/WPHYiO9lIfozeuww6y
	Sj5LyYEKCdBNXBk2/cpfo1YbBm3iWop+eWsoXLkV/I6vrubbEfXpPea9N66ckOkO356vFyY1ZAL
	PTTr50bHFNgnBSMc7q+5lNo4UtWhxb7
X-Received: by 2002:a05:6000:471a:b0:484:3311:3176 with SMTP id ffacd0b85a97d-48488f22290mr20813888f8f.23.1788427041742;
        Thu, 03 Sep 2026 02:17:21 -0700 (PDT)
Received: from localhost.localdomain ([85.137.25.106])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448e72f02sm12073755f8f.3.2026.09.03.02.17.20
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 03 Sep 2026 02:17:21 -0700 (PDT)
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
Subject: [PATCH v2] pinctrl: sunxi: keep a shadow copy of the data register output latches
Date: Thu,  3 Sep 2026 12:17:18 +0300
Message-ID: <20260903091718.44042-1-ilya.titov@wirenboard.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260812120114.32501-1-ilya.titov@wirenboard.com>
References: <20260812120114.32501-1-ilya.titov@wirenboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_021724_348189_50647812 
X-CRM114-Status: GOOD (  34.13  )
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
v2:
 - compute nbanks with DIV_ROUND_UP(last_pin + 1 - pin_base, PINS_PER_BANK)
   instead of round_up(last_pin, PINS_PER_BANK).  last_pin is the highest
   pin number, not a count, so the old form allocated one bank too few
   whenever it was an exact multiple of PINS_PER_BANK, which would let
   sunxi_pmx_set() write past the end of dat_shadow.  No current SoC hits
   this (the closest are PL1 on h616-r and PN1 on a80-r), but a bank with
   a single pin in a future table would.  Reported by Sashiko AI review.
   The allocation size is unchanged for every SoC description in tree.

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
index 25489beeb312..2881a83be99c 100644
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
+	nbanks = DIV_ROUND_UP(last_pin + 1 - pctl->desc->pin_base,
+			      PINS_PER_BANK);
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


