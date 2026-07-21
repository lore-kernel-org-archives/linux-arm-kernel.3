Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AB35C4452B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 22:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=T/Lp4Et0rF78cjX8T7D97uqtnWmnwRZE3o3rKvJzf6Q=; b=03pVSSRvUiNkGTxk1azLqqoZjy
	oqS2+rOqJcMOwhJpSVBuxP3UnHQ2LmDUkPKEWakuFLYIDrGdeaOr679KrQq9WcbBIWa2KS+wxrXDP
	TKe31dzRh07Rs6NHr4xpvQnr07mJ5vA6L7eLwtiqpyen4dcSGjHSHbhufGM8FIFjA+15EtN5v5eWK
	P02kV2kV71GExsDCrC2OhcDpgBE4wtxpQkTZpZJra8EaB0nmSciKbLo5BRJkttw1ibQZUQjmojRAU
	6AQPfNK9WsRa2LcvL0RF7mWgr+u55hUguerANj8Fztgnv4ZBq5YQyLtuQsJ4eHBo7fq2gYG+OweqC
	2KIk8oaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmJBm-0000000AWiT-2qm1;
	Tue, 21 Jul 2026 22:43:50 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmJBk-0000000AWhz-0jWN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 22:43:49 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D63B41476;
	Tue, 21 Jul 2026 15:43:42 -0700 (PDT)
Received: from ryzen.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 19A2C3F86F;
	Tue, 21 Jul 2026 15:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784673827; bh=NC1bky+acfLwTsjurpqc+/kjtHv9qCg2mKfAW+C9+rI=;
	h=From:To:Cc:Subject:Date:From;
	b=GV+/kFJiqsVT19lm9KF/nIvdn8b2MCW5wU46buSKeDiEStrjGBlhHJTEOQWqRHDKV
	 AsP6mHukioKLwN0RYZYxhK+9Uu/ULoKPfq8j5qcsLS+a4of6xsWFZmv4DqQulm8XIX
	 G8piU3GaNXqWLwEYy7/ZgcfoVumdPmqmY0RXr6fY=
From: Andre Przywara <andre.przywara@arm.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] pinctrl: sunxi: A523: fix voltage withstand encoding
Date: Wed, 22 Jul 2026 00:39:56 +0200
Message-ID: <20260721223956.13665-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_154348_334525_D9EE0719 
X-CRM114-Status: GOOD (  18.56  )
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

The Allwinner A523 uses the same GPIO voltage "withstand" programming
(setting the input level voltage thresholds) as the previous SoCs, but
for some odd reason inverts the encoding of 1.8V vs. 3.3V.

Add a new bias voltage type to note this difference, and select it for
the A523. At the same time also use the newer "CTL" version, which in
addition allows to turn off the withstand programming for I/O voltages
other than exact 1.8V or 3.3V (for instance for 2.5V sometimes used for
Ethernet PHYs). The A523 has that enable register, but didn't use it
so far.

This fixes eMMC and reportedly Ethernet operation on some A523 boards.

Fixes: 648be4cd9517 ("pinctrl: sunxi: Add support for the Allwinner A523")
Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c | 2 +-
 drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c   | 2 +-
 drivers/pinctrl/sunxi/pinctrl-sunxi.c         | 6 ++++++
 drivers/pinctrl/sunxi/pinctrl-sunxi.h         | 2 ++
 4 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c b/drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c
index dfdcfa740ecc9..cffc1e53eef14 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c
@@ -26,7 +26,7 @@ static const u8 a523_r_irq_bank_muxes[SUNXI_PINCTRL_MAX_BANKS] =
 static struct sunxi_pinctrl_desc a523_r_pinctrl_data = {
 	.irq_banks = ARRAY_SIZE(a523_r_irq_bank_map),
 	.irq_bank_map = a523_r_irq_bank_map,
-	.io_bias_cfg_variant = BIAS_VOLTAGE_PIO_POW_MODE_SEL,
+	.io_bias_cfg_variant = BIAS_VOLTAGE_PIO_POW_MODE_CTL_INV,
 	.pin_base = PL_BASE,
 };
 
diff --git a/drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c b/drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c
index 801f62abc93df..001bd42afa3ef 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c
@@ -26,7 +26,7 @@ static const u8 a523_irq_bank_muxes[SUNXI_PINCTRL_MAX_BANKS] =
 static struct sunxi_pinctrl_desc a523_pinctrl_data = {
 	.irq_banks = ARRAY_SIZE(a523_irq_bank_map),
 	.irq_bank_map = a523_irq_bank_map,
-	.io_bias_cfg_variant = BIAS_VOLTAGE_PIO_POW_MODE_SEL,
+	.io_bias_cfg_variant = BIAS_VOLTAGE_PIO_POW_MODE_CTL_INV,
 };
 
 static int a523_pinctrl_probe(struct platform_device *pdev)
diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
index cabcb8b6f38e5..634d9f1f23947 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
@@ -718,6 +718,7 @@ static int sunxi_pinctrl_set_io_bias_cfg(struct sunxi_pinctrl *pctl,
 {
 	unsigned short bank;
 	unsigned long flags;
+	bool inverted = false;
 	u32 val, reg;
 	int uV;
 
@@ -757,6 +758,9 @@ static int sunxi_pinctrl_set_io_bias_cfg(struct sunxi_pinctrl *pctl,
 		writel(reg | val, pctl->membase +
 		       sunxi_grp_config_reg(pctl, pin));
 		return 0;
+	case BIAS_VOLTAGE_PIO_POW_MODE_CTL_INV:
+		inverted = true;
+		fallthrough;
 	case BIAS_VOLTAGE_PIO_POW_MODE_CTL:
 		val = uV > 1800000 && uV <= 2500000 ? BIT(bank) : 0;
 
@@ -771,6 +775,8 @@ static int sunxi_pinctrl_set_io_bias_cfg(struct sunxi_pinctrl *pctl,
 		fallthrough;
 	case BIAS_VOLTAGE_PIO_POW_MODE_SEL:
 		val = uV <= 1800000 ? 1 : 0;
+		if (inverted)
+			val = !val;
 
 		raw_spin_lock_irqsave(&pctl->lock, flags);
 		reg = readl(pctl->membase + pctl->pow_mod_sel_offset);
diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.h b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
index d0936a32123ba..2c8648c3301b6 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.h
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
@@ -128,8 +128,10 @@ enum sunxi_desc_bias_voltage {
 	 * Bias voltage is set through PIO_POW_MOD_SEL_REG
 	 * and PIO_POW_MOD_CTL_REG register, as seen on
 	 * A100 and D1 SoC, for example.
+	 * Some SoCs invert the encoding for 1.8V vs. 3.3V.
 	 */
 	BIAS_VOLTAGE_PIO_POW_MODE_CTL,
+	BIAS_VOLTAGE_PIO_POW_MODE_CTL_INV,
 };
 
 struct sunxi_desc_function {
-- 
2.46.4


