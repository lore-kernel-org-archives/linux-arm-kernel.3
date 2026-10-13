Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4985CCC6B08
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 14:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=G1GyLkCKnAiN014lfl07/pCTFzLksaMF6L6zvIyCD/0=; b=DgOIsmTeCF5bhT9EqxbRXw6WeJ
	H33J2D0mVSivpL+iGl5y4fJk81v8NKzljfC2xN3QBfABbiZIC5kCyfmR3cRORJbUcGsgL6ZrCPRWp
	uezL2m88kc3w/pShypYEbnAUqVM8P33uOd33n51Nw5xS+1NQ+1EOjIxs6oqGGLlGtcWlRsyB15MMf
	VV4b69M1U9eu6g4/186Hr/PwoI4hZyQSUIEEg4qrl2WHQxnbfPaWduu5mHb2XC0gOxDbSPuxA9E12
	BrHsUePdBV2qxIyFQlHqz1qaOSXyiM62FtI8NKffQbYWQnfw5lNfcXC1NkYzodseOgXi5t27AKxvN
	jYTx/8fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGdQD-0000000D4zV-3qKV;
	Tue, 13 Oct 2026 14:24:05 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGdQ8-0000000D4yB-2nMv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 14:24:04 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3FC0F169E;
	Tue, 13 Oct 2026 07:23:56 -0700 (PDT)
Received: from e142021.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3F5F23F7B4;
	Tue, 13 Oct 2026 07:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791901439; bh=whUjOSqtfOK9pxOtHaz50htccwvvfbQtHEljKwrDPWo=;
	h=From:To:Cc:Subject:Date:From;
	b=pXbS3sdNnJAfqEGVkOA7dZb/w7Lrk7RzRAv0U4smbTPNTcOJCSE8VABrDftx8j6KX
	 pdzzXYC4OsY/fxxVl36ImPa66t4rWupakqeM5Qup7nd8pa7Z37XlcuFOJNXsgblbNP
	 bQFXLKy57px6ktdEHaF1lir8YqLXXahxA34AdV0I=
From: Andre Przywara <andre.przywara@arm.com>
To: Linus Walleij <linusw@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Yixun Lan <dlan@gentoo.org>,
	Enzo Adriano <enzo.adriano.code@gmail.com>,
	Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH RFT] pinctrl: sunxi: Fix A733 withstand programming
Date: Tue, 13 Oct 2026 16:23:51 +0200
Message-ID: <20261013142351.771229-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_072400_788172_7FF3C986 
X-CRM114-Status: GOOD (  18.24  )
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

On top of the other pinctrl changes that the Allwinner A733 introduced, it
also uses a different layout for the GPIO_POW_MOD_SEL register, to set up
the GPIO input threshold voltage for each port. For no apparent reason,
it uses now 2 bits per bank, though effectively just always setting the
higher bit to 1 is all that's needed to make it work.

Add a new BIAS_VOLTAGE_PIO_POW_SEL variant, that behaves similar to the
existing one, but uses the 2-bit encoding. Use that variant for the A733
pinctrl driver.

Fixes: 0535bfbfa97b ("pinctrl: sunxi: add support for the Allwinner A733")
Reported-by: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
Hi,

this goes on top of LinusW's pinctrl/for-next branch, which contains
both the A523 withstand fix and the A733 pinctrl bits.
Did not test on hardware, please have a look!

Cheers,
Andre

 drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c |  2 +-
 drivers/pinctrl/sunxi/pinctrl-sunxi.c       | 12 +++++++++---
 drivers/pinctrl/sunxi/pinctrl-sunxi.h       |  4 ++++
 3 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c b/drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c
index ca82f08a3a65b..dcc2254e4089f 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c
@@ -24,7 +24,7 @@ static const u8 a733_irq_bank_muxes[SUNXI_PINCTRL_MAX_BANKS] =
 static struct sunxi_pinctrl_desc a733_pinctrl_data = {
 	.irq_banks = 10,
 	.irq_read_needs_mux = true,
-	.io_bias_cfg_variant = BIAS_VOLTAGE_PIO_POW_MODE_SEL,
+	.io_bias_cfg_variant = BIAS_VOLTAGE_PIO_POW_MODE_SEL_2BIT,
 };
 
 static int a733_pinctrl_probe(struct platform_device *pdev)
diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
index 3ee5012463da3..7f4ce73bdc670 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
@@ -783,6 +783,7 @@ static int sunxi_pinctrl_set_io_bias_cfg(struct sunxi_pinctrl *pctl,
 		raw_spin_unlock_irqrestore(&pctl->lock, flags);
 
 		fallthrough;
+	case BIAS_VOLTAGE_PIO_POW_MODE_SEL_2BIT:
 	case BIAS_VOLTAGE_PIO_POW_MODE_SEL:
 		val = uV <= 1800000 ? 1 : 0;
 		if (inverted)
@@ -790,9 +791,14 @@ static int sunxi_pinctrl_set_io_bias_cfg(struct sunxi_pinctrl *pctl,
 
 		raw_spin_lock_irqsave(&pctl->lock, flags);
 		reg = readl(pctl->membase + pctl->pow_mod_sel_offset);
-		reg &= ~(1 << bank);
-		writel(reg | val << bank,
-		       pctl->membase + pctl->pow_mod_sel_offset);
+		if (pctl->desc->io_bias_cfg_variant == BIAS_VOLTAGE_PIO_POW_MODE_SEL_2BIT) {
+			reg &= ~(3U << (bank * 2));
+			reg |= (val | 0x2) << (bank * 2);
+		} else {
+			reg &= ~BIT(bank);
+			reg |= val << bank;
+		}
+		writel(reg, pctl->membase + pctl->pow_mod_sel_offset);
 		raw_spin_unlock_irqrestore(&pctl->lock, flags);
 		return 0;
 	default:
diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.h b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
index 7c2f29e75519a..0945890a921b6 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.h
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
@@ -122,6 +122,10 @@ enum sunxi_desc_bias_voltage {
 	 * register, as seen on H6 SoC, for example.
 	 */
 	BIAS_VOLTAGE_PIO_POW_MODE_SEL,
+	/*
+	 * Same as above, but using a 2-bits-per-bank encoding.
+	 */
+	BIAS_VOLTAGE_PIO_POW_MODE_SEL_2BIT,
 	/*
 	 * Bias voltage is set through PIO_POW_MOD_SEL_REG
 	 * and PIO_POW_MOD_CTL_REG register, as seen on
-- 
2.43.0


