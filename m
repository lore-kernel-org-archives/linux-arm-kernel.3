Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED243C88E50
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 10:08:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mkwfyVViN+1WLW6U/qo5MfyiYU5V0fDVxX5b4cmEXn4=; b=hqC5R49hFHrNyodzy+UdFCg6EF
	Hb095+Ri0ofmlJojgTuDwPURSw+g3qXVBAMgzAsvoGG68ccD6WUTElUuKNXjCrAjVgscUjDrb9UTK
	ejr8dfIjASfuYr3IhYSojgJy9OAvRFlObbEYsQnEycjYzx4KKmh679tOLtONsVD98fgAqWqk4Soaj
	sf6K+h04Kh3z53zxtXbam9n7FwFVpLJ0fI1hw1kcSlcgzfcPpmtC1D+9muGKRHASREVuPCAPmymuv
	YB6bVT3Xrmir304vx9ghwl485ChMCdQ1adhlWzDJDd7NG6bvbkpYoeyOkRuWJ1EOdLltqV9xEAH3c
	LIpCm5+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x63bS-000000033V4-3B5p;
	Mon, 14 Sep 2026 10:07:58 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x63bR-000000033UR-0FM8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 10:07:58 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F0E261570;
	Mon, 14 Sep 2026 03:07:49 -0700 (PDT)
Received: from e142021.arm.com (unknown [10.57.9.62])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 330613F7B4;
	Mon, 14 Sep 2026 03:07:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789380473; bh=bhzDysUXJICZl4HNbtJ5X4V1LqWu56fbacBAFiJlnow=;
	h=From:To:Cc:Subject:Date:From;
	b=s2sD3+9jTNlgFv1NggzXPIaf+b0VAmi72PP4mTnukXKdJfjYJab5PNdMWKr0Z2EuM
	 PG043kOuFqIsn22mAZCcR3t2F41jH8ZqU9fiKv7bl1L6MBoKQrvS4is7lgG9sCtCEA
	 Ibdje8hB6rl0ySp3xFIWEHiRwzDzKj15nT0t6Js0=
From: Andre Przywara <andre.przywara@arm.com>
To: Linus Walleij <linusw@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v2] pinctrl: sunxi: A523: fix voltage withstand encoding
Date: Mon, 14 Sep 2026 12:07:44 +0200
Message-ID: <20260914100744.1039050-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_030757_185790_4AD1612D 
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
Tested-by: Per Larsson <per@palvencia.se>
Tested-by: Juan Manuel Lopez Carrillo <juanmanuellopezcarrillo@gmail.com>
Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
Tested-by: Chen-Yu Tsai <wens@kernel.org> # Fixes eMMC on Orange Pi 4A
---
Hi,

just added tags and rebased on v7.3-rc1 (but just a context change).
Linus, my apologies, I missed you on the first post, instead CC:ed DT
people for some odd reason.
Can you please take this as a fix ASAP?

Cheers,
Andre

 drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c | 2 +-
 drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c   | 2 +-
 drivers/pinctrl/sunxi/pinctrl-sunxi.c         | 6 ++++++
 drivers/pinctrl/sunxi/pinctrl-sunxi.h         | 2 ++
 4 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c b/drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c
index 462aa1c4a5fa6..e27e4945def26 100644
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
index b6f78f1f30ac4..88d8acd5bc245 100644
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
index 25489beeb3125..7b33bcb7f840a 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
@@ -728,6 +728,7 @@ static int sunxi_pinctrl_set_io_bias_cfg(struct sunxi_pinctrl *pctl,
 {
 	unsigned short bank;
 	unsigned long flags;
+	bool inverted = false;
 	u32 val, reg;
 	int uV;
 
@@ -766,6 +767,9 @@ static int sunxi_pinctrl_set_io_bias_cfg(struct sunxi_pinctrl *pctl,
 		reg &= ~IO_BIAS_MASK;
 		writel(reg | val, pctl->membase + sunxi_grp_config_reg(pin));
 		return 0;
+	case BIAS_VOLTAGE_PIO_POW_MODE_CTL_INV:
+		inverted = true;
+		fallthrough;
 	case BIAS_VOLTAGE_PIO_POW_MODE_CTL:
 		val = uV > 1800000 && uV <= 2500000 ? BIT(bank) : 0;
 
@@ -780,6 +784,8 @@ static int sunxi_pinctrl_set_io_bias_cfg(struct sunxi_pinctrl *pctl,
 		fallthrough;
 	case BIAS_VOLTAGE_PIO_POW_MODE_SEL:
 		val = uV <= 1800000 ? 1 : 0;
+		if (inverted)
+			val = !val;
 
 		raw_spin_lock_irqsave(&pctl->lock, flags);
 		reg = readl(pctl->membase + pctl->pow_mod_sel_offset);
diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.h b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
index 0daf7600e2fb0..b09df32a3073a 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.h
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
@@ -116,8 +116,10 @@ enum sunxi_desc_bias_voltage {
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
2.43.0


