Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1B52C4453A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 20:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r+zTFoTWUUJ+4b3U4GZ5sdW+uFxLxmihuq+hef+CKeU=; b=thPSz0Ml67GC9hbkePmUFuHeFW
	ZUf84EZPrC1BEwGGSmN9DCJoE3dHKn86vHdP4AjTx4M33QGWnL62z7uYcw62qGYxsu82CaRti/EEU
	WGPS6D9elQ6xV6wOc7hVF9JeQh2K5dXefKzadjCebirKXyH9M568Mka6Mupb3fhOAxyDVqfrF59Yw
	HUoWr7SFZ7e5D2B+JIwymgp/rSl4vFSlC3b7eCp1OuTWfSFcgb8kCcm/SXUmHQeSxjN8K2bArcLc4
	Y1WXJVJtqI2erqDvftgRFLmE7bfU4o+9xvMAREn0QIkJdHW+ZCaqJ2baviJ5pV/KKoNXUAKD/J7a1
	NSnHxIbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmddo-0000000Cjra-3rJp;
	Wed, 22 Jul 2026 20:34:08 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmddj-0000000CjpZ-0oWW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 20:34:04 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4953de5be0aso49883215e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 13:34:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784752441; x=1785357241; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=r+zTFoTWUUJ+4b3U4GZ5sdW+uFxLxmihuq+hef+CKeU=;
        b=D+ce7dLd0vX1uE2SRwIrhr41MQxhXFW+ixdYCYeDdDlWuFS+zInJa2SMcbNjo2SEfJ
         Rz4o+88GmhyqBECp5h+40JbD7phYkjq4KTvsfmQE4uREAH8YrNvfl1DxRfb9p6JGc22f
         PFIzZmdi6FlH27zxLMYXC0r2wVFcYurbI0T+GBsG1Xk8GlCpaZhPkm3FiYG120aw3xOT
         4wVjKTjh1kdUHaqZNAnmddv5sAMRa4TooBdUddctRbSnXK8XEfhhRwhwHmtNxLsrOKJu
         nBLnLqV+YHyA373iGyvHnDI1qROUfT2AMfoivtXtF3e4IRc84VQx3BdlaHaJBGvm7eGD
         kgeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784752441; x=1785357241;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r+zTFoTWUUJ+4b3U4GZ5sdW+uFxLxmihuq+hef+CKeU=;
        b=OwmQ6ta+WhAWRso70L/tXuU/bPK74SSmQ+M67ggOnIRLvzdfYwJnsfEjxgK9T45k8j
         JGXmFOLDO2aXQszzfYFX8nXPC5JrG3wCctnTkrdChLoFrnn1ZdFnYBUrte9OUW6PLF1f
         1oaGXr/ie89HIqFEgPhXYZcR99JXxzrx1i7sL7+Ew0wiRLbAroIEN/iyZMqxIAhlKiE/
         7JzzFlCQpzhxxe1GZ++7FxeDxYajY+c6iOFQDlzzg/h6dDKImKINnUF9CASRajWutL9z
         10yDN8fupVC99Nnt1Jr8qvtRMq8qPLGGG1YaKsNA5lp4NviH2COlgTy/nrIdNE7gNyti
         CKlQ==
X-Forwarded-Encrypted: i=1; AHgh+RrA/8b+vLuYA/AoehPdj25/L6050eGlc80iqFJkJOMEVeYn7Pmsh9PIZY/zBgohhQavLQkimn7o6N+9r0uZIHlp@lists.infradead.org
X-Gm-Message-State: AOJu0YyUSgn7MD52hBKo3WayvJ5Lez3EB176ed3j6AQrCQpYGTBNtEyX
	zYucWq1cY+mDTrlQZBksMx+XubxyAgnI2kkdzVnXycJA//5Ze+7YbMZd
X-Gm-Gg: AR+sD10W3lXdaubqnCLkNGzboNXk3Oi35OHuErFr3RXpxxeyItCiGfpc9pO6bsnzI1F
	NheXATY1muP9RksUgnCVzU95jNoS1te6CEg77kL20FRz4EUi2DoFzeA/pRV3vmgE4UsFp5RY9pS
	/bp9XG/h/BUkbbO/TSNO+B3bQF/FpIrjWpM55EzDPxzI44wown4Km5yE2KaIQH9a38gEOn2ExQk
	bzA54EtwnwLfBV81FVUcBIcs9yc3YG0aPGS4PA8Ga9CmpbGNvBv4CZCtI1ORqpQlYy5GnzTvp5c
	+jMIDI/Nu7Psiwl0OtrxtKiTbzVWdtji1l3sylvTU2QzzXDOKSx6SnJhATubSCwuU/ThSoNLLA2
	FQzI6sOi5mtagHRdbyL8+rgpNmqWM/Yi3if29c0Z/lPqr9JYtXNTqht/JhatWj6lAkiyn8d2Bws
	CVj/F5Zxr7UngxnQSRRXYWpsQz0LK+rGGoWyU=
X-Received: by 2002:a7b:cb86:0:b0:493:bc4b:b8c with SMTP id 5b1f17b1804b1-49573cf1557mr1519575e9.38.1784752440278;
        Wed, 22 Jul 2026 13:34:00 -0700 (PDT)
Received: from coolemuke.fritz.box ([2a00:6020:b320:1a00:c256:1463:a40b:d8c6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4956ab2f0a2sm63134945e9.1.2026.07.22.13.33.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 13:33:59 -0700 (PDT)
From: "=?UTF-8?q?S=C3=B6ren=20Hantel?=" <fugininsane@gmail.com>
X-Google-Original-From: =?UTF-8?q?S=C3=B6ren=20Hantel?= <fugininsane@googlemail.com>
To: linux-pm@vger.kernel.org
Cc: Vasily Khoruzhick <anarsoul@gmail.com>,
	Yangtao Li <tiny.windzz@gmail.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Rossak <embed3d@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?S=C3=B6ren=20Hantel?= <fugininsane@googlemail.com>,
	Claude Fable 5 <noreply@anthropic.com>
Subject: [PATCH 2/3] thermal/drivers/sun8i: Add support for the A80 THS
Date: Wed, 22 Jul 2026 22:33:40 +0200
Message-ID: <20260722203341.2917852-3-fugininsane@googlemail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260722203341.2917852-1-fugininsane@googlemail.com>
References: <20260722203341.2917852-1-fugininsane@googlemail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_133403_295097_8C79D393 
X-CRM114-Status: GOOD (  25.64  )
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

The Allwinner A80 thermal sensor is an early relative of the THS found
in the A83T and later SoCs. It shares its register block, bus gate,
4 MHz module clock and reset line with the GPADC; the THS registers
live at offset 0x40 of the shared block, with four data registers for
the four sensors (0: big cluster, 1: DRAM, 2: GPU, 3: little cluster).

Register layout, initialization values and the temperature formula
(T = 190 - raw * 1000 / 14543, i.e. offset 190000 / scale 688 in this
driver's convention) are taken from the vendor BSP kernel. The init
sequence also programs the hardware alarm (~90 degC) and emergency
shutdown (~105 degC) thresholds the BSP uses, since their reset
defaults are undefined.

Unlike on later SoCs the data-ready interrupt fires at the conversion
rate (tens of kHz), so it is left disabled and the thermal core polls
the sensors; the interrupt line only serves the alarm and shutdown
events, matching the vendor BSP behaviour.

The A80 SID is not yet supported by the sunxi nvmem driver, so
calibration data is currently unavailable and the driver falls back to
the defaults, which yield plausible results (idle temperatures around
40 degC, full-load peaks in the mid 50s on a Cubieboard4).

Tested on a Cubietech Cubieboard4: all four zones report load-reactive
temperatures via polling.

Co-authored-by: Claude Fable 5 <noreply@anthropic.com>
Signed-off-by: Sören Hantel <fugininsane@googlemail.com>
---
 drivers/thermal/sun8i_thermal.c | 93 ++++++++++++++++++++++++++++++++-
 1 file changed, 92 insertions(+), 1 deletion(-)

diff --git a/drivers/thermal/sun8i_thermal.c b/drivers/thermal/sun8i_thermal.c
index 2267479..3e7bfda 100644
--- a/drivers/thermal/sun8i_thermal.c
+++ b/drivers/thermal/sun8i_thermal.c
@@ -65,8 +65,27 @@ struct tsensor {
 	int				id;
 };
 
+/*
+ * The A80 thermal sensor shares its register block with the GPADC.
+ * The THS registers start at offset 0x40 within that block.
+ */
+#define SUN9I_THS_CTRL				0x40
+#define SUN9I_THS_IC				0x44
+#define SUN9I_THS_IS				0x48
+#define SUN9I_THS_ALARM_TH(x)			(0x50 + (x) * 0x4)
+#define SUN9I_THS_SHUT_TH(x)			(0x60 + (x) * 0x4)
+#define SUN9I_THS_MFC				0x70
+#define SUN9I_THS_TEMP_DATA			0x80
+#define SUN9I_THS_CTRL_ACQ(x)			((x) << 16)
+#define SUN9I_THS_CTRL_SENSOR_EN		GENMASK(3, 0)
+#define SUN9I_THS_ALARM_IRQ_EN			GENMASK(3, 0)
+#define SUN9I_THS_SHUT_IRQ_EN			GENMASK(7, 4)
+#define SUN9I_THS_ALARM_IRQ_STS(x)		BIT(x)
+#define SUN9I_THS_SHUT_IRQ_STS(x)		BIT(4 + (x))
+
 struct ths_thermal_chip {
 	bool            has_mod_clk;
+	unsigned long	mod_clk_rate;
 	bool            has_bus_clk_reset;
 	bool		needs_sram;
 	int		sensor_num;
@@ -413,7 +432,8 @@ static int sun8i_ths_resource_init(struct ths_device *tmdev)
 			return PTR_ERR(tmdev->mod_clk);
 	}
 
-	ret = clk_set_rate(tmdev->mod_clk, 24000000);
+	ret = clk_set_rate(tmdev->mod_clk, tmdev->chip->mod_clk_rate ?:
+			   24000000);
 	if (ret)
 		return ret;
 
@@ -596,6 +616,76 @@ static int sun8i_ths_probe(struct platform_device *pdev)
 	return 0;
 }
 
+static int sun9i_a80_thermal_init(struct ths_device *tmdev)
+{
+	int i;
+
+	/* clear any pending interrupt status */
+	regmap_write(tmdev->regmap, SUN9I_THS_IS, 0xfff);
+	/* set up the median filter, average over 8 samples */
+	regmap_write(tmdev->regmap, SUN9I_THS_MFC, 0x5);
+
+	/*
+	 * Program the protection thresholds with the values the vendor
+	 * BSP uses (thresholds are in raw sensor units, which decrease
+	 * with rising temperature): an alarm interrupt at ~90 degC and
+	 * an emergency hardware shutdown at ~105 degC.
+	 */
+	for (i = 0; i < tmdev->chip->sensor_num; i++) {
+		regmap_write(tmdev->regmap, SUN9I_THS_ALARM_TH(i),
+			     (1454 << 16) | 0xfff);
+		regmap_write(tmdev->regmap, SUN9I_THS_SHUT_TH(i),
+			     (1231 << 16) | 0xfff);
+	}
+
+	/*
+	 * Unlike on later SoCs, the data-ready interrupt fires at the
+	 * conversion rate (tens of kHz), so leave it disabled and let the
+	 * thermal core poll the data registers; the interrupt line only
+	 * serves the alarm and shutdown events, like in the vendor BSP.
+	 */
+	regmap_write(tmdev->regmap, SUN9I_THS_IC,
+		     SUN9I_THS_ALARM_IRQ_EN | SUN9I_THS_SHUT_IRQ_EN);
+	/* acquire time 0x2f, enable all four sensors */
+	regmap_write(tmdev->regmap, SUN9I_THS_CTRL,
+		     SUN9I_THS_CTRL_ACQ(0x2f) | SUN9I_THS_CTRL_SENSOR_EN);
+
+	return 0;
+}
+
+static unsigned long sun9i_a80_irq_ack(struct ths_device *tmdev)
+{
+	unsigned long irq_bitmap = 0;
+	int i, state;
+
+	regmap_read(tmdev->regmap, SUN9I_THS_IS, &state);
+
+	for (i = 0; i < MAX_SENSOR_NUM; i++) {
+		if (state & (SUN9I_THS_ALARM_IRQ_STS(i) |
+			     SUN9I_THS_SHUT_IRQ_STS(i))) {
+			regmap_write(tmdev->regmap, SUN9I_THS_IS,
+				     state & (SUN9I_THS_ALARM_IRQ_STS(i) |
+					      SUN9I_THS_SHUT_IRQ_STS(i)));
+			set_bit(i, &irq_bitmap);
+		}
+	}
+
+	return irq_bitmap;
+}
+
+static const struct ths_thermal_chip sun9i_a80_ths = {
+	.sensor_num = 4,
+	.has_mod_clk = true,
+	.mod_clk_rate = 4000000,
+	.has_bus_clk_reset = true,
+	.scale = 688,
+	.offset = 190000,
+	.temp_data_base = SUN9I_THS_TEMP_DATA,
+	.init = sun9i_a80_thermal_init,
+	.irq_ack = sun9i_a80_irq_ack,
+	.calc_temp = sun8i_ths_calc_temp,
+};
+
 static const struct ths_thermal_chip sun8i_a83t_ths = {
 	.sensor_num = 3,
 	.scale = 705,
@@ -711,6 +801,7 @@ static const struct ths_thermal_chip sun50i_h616_ths = {
 
 static const struct of_device_id of_ths_match[] = {
 	{ .compatible = "allwinner,sun8i-a83t-ths", .data = &sun8i_a83t_ths },
+	{ .compatible = "allwinner,sun9i-a80-ths", .data = &sun9i_a80_ths },
 	{ .compatible = "allwinner,sun8i-h3-ths", .data = &sun8i_h3_ths },
 	{ .compatible = "allwinner,sun8i-r40-ths", .data = &sun8i_r40_ths },
 	{ .compatible = "allwinner,sun50i-a64-ths", .data = &sun50i_a64_ths },
-- 
2.43.0


