Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E15EC4453A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 21:01:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B4bcrjfjaOxCTjFJ1nEuge+dwYCIOai8f6MdCth28oQ=; b=HHJfq0c7DwMQ/g3bvGuqS8jLoM
	qsYEDVZbhPsGfTYQvOMiVVZqaG94PTapwHgwBsLjlyu9V0HIlNqHHxxKSzUB974v7+YhGD4Je5eft
	uDd3Rsh+2ZG8bnV7Ola7LUzzVbINBnXHfFxGIAq47So/o2+zKZQuySpbuuqZXRuvLxYs4+4StDSWk
	ove4kdpDtnDTv5Y/GZA/PIg+mq9jHDSsUmyWg1msK/witLyCwfy0G/mbTSHSs80RdpCmUbh1jJ4Cj
	DzjtHQiIm3hIF1I6ZCyZesGNj+J+0c2PDi1qYneP4Oay01EkYtmF8k29naqAjdqgQ3Qd1yf2k2gn/
	TDgwFQLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wme4K-0000000CmBL-0e4T;
	Wed, 22 Jul 2026 21:01:32 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wme46-0000000Cm66-3FNJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 21:01:20 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-47f81a3ccf9so1727614f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 14:01:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784754077; x=1785358877; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=B4bcrjfjaOxCTjFJ1nEuge+dwYCIOai8f6MdCth28oQ=;
        b=BCmZFoqp29u2Iegx8zEYTuxAjUu7ntJUkjzc7AqFicvv/GF+DIMsVS+PYUc9gNPgKj
         3YeK7ayx3/82Ut1oE6L1SA+uYbIQqtY8Z0mwXQrDg0fh+uIOgLFBeuBfyYNa6PsKKPdF
         HQIzcl8hthhORi5GnC/6uNTHpiLMbJFu2MdRGm/pltdp+6rrAvODTaPerdslUufPs2AZ
         W/2nLgcDghHenx6DobhfThCS/LUgQNcWB23u74uBJ2F3V5PBbWHSBNWRAEtsQ7jTPPbu
         wZjU/JhPvxkMyi+A1ioFZqyHSdJ9WeVhxK7mdji4Z84gN/nGKqmUCEK379cO9n7IADfD
         t0yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784754077; x=1785358877;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B4bcrjfjaOxCTjFJ1nEuge+dwYCIOai8f6MdCth28oQ=;
        b=jb69KKB2y+doshdiBO2fQ81dgNmWhJGaNvgi47ChQNjT68Ol4htmEaw3NU6RIeIgfi
         SMYZPBIrtD3QSSOivWItgMec0jPHCTeGBjNpkLmP7yql6NWAOxEuzb881HUvb/Uh1vAu
         LNhXgdbdF8VXlk3gd5AxKinWcuJhNx11iaVa5MdPTXCJLFXT1Dyul1g0Syh9CQOBsoHG
         TIK5aRZqEk+JpwXTTxBBpzUF1rUE+gkEIqAdj4qE6zzZ+i9/IFw4jgsp+jJicnhz6k63
         DpojA1GRfGW6SFJKe3qsTgH78Hisfgm6U9JkGHnGMOoVXIS3AEmwmyv5IV7lBfcwb0Zt
         B6iQ==
X-Forwarded-Encrypted: i=1; AHgh+RrgfFKU9jt90mZeWEtHFcyOd+hg7tMKojjkQJZI+si/T6BMJaPLf/MC6AQnxUNw81TU5rjITRSKaG/jx7aGjNNx@lists.infradead.org
X-Gm-Message-State: AOJu0Yx8RHao0i9PVXjQSIPYwVM4mq2HWPZg8ZBkZ8TdYHDvKV+/3AjW
	dxXf4yKFxkSXE/ERuui5/L6wiD3kWpP8Fr6PRZrE+8lwC4ZblvU5qkdhcHyqmY97Pglczw==
X-Gm-Gg: AR+sD11mUIqgkfidWcRLuGRb9G1pS7yBF4wZppVlXN57jmVc9LCxbzyuP073nGuRWhN
	95cwQdD5MbaIXA/ceBCS0lbeKGongOq/KyNM5Bc58F2/EmNTS88nDEdI6BAP/penGx7XKFO9ZTV
	G4hkHoQdfi0nZohs1DiUO1O7gbuXu0Hrb4C5+SUepWEMChWTpEQiS2JtUvJZt9LaSXA6aTftPrn
	7YG+09f0WjMunGbtRTb/mWQbs5b/IrD/ztz7qpjSHqpMIYGToijTUROMmsKk5VLZo+NHscZK0R9
	dWqxWe94sgdNugNUNY2Ucr2MAR82VrRIw0aN5xz9Rnc1ESekPl/bGvyZrMQvwDnCZLewdG2pdG4
	U4TWPpLqltF4kaqRCwNMiHFZcdEQn6/czptqzZgpA2oje73gvYFRZE/3I/z7X59jaYSCAATu9PS
	oY2wUCnLr97V60rXDhEIAbxMDN
X-Received: by 2002:a05:6000:4903:b0:46f:a0f1:c33f with SMTP id ffacd0b85a97d-47f8d7565a2mr481160f8f.32.1784754076687;
        Wed, 22 Jul 2026 14:01:16 -0700 (PDT)
Received: from coolemuke.fritz.box ([2a00:6020:b320:1a00:c256:1463:a40b:d8c6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c63678sm8610812f8f.29.2026.07.22.14.01.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 14:01:16 -0700 (PDT)
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
Subject: [PATCH v2 2/3] thermal/drivers/sun8i: Add support for the A80 THS
Date: Wed, 22 Jul 2026 23:00:45 +0200
Message-ID: <20260722210046.2932498-3-fugininsane@googlemail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260722210046.2932498-1-fugininsane@googlemail.com>
References: <20260722203341.2917852-1-fugininsane@googlemail.com>
 <20260722210046.2932498-1-fugininsane@googlemail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_140118_873315_392B8379 
X-CRM114-Status: GOOD (  25.52  )
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
rate (tens of kHz), and the level triggered alarm interrupt would
retrigger for as long as an over-temperature condition persists, so
both stay disabled and the thermal core polls the sensors; only the
emergency shutdown event keeps its interrupt enabled.

Since the A80 chip description has no calibrate callback, guard the
callback invocation in sun8i_ths_calibrate(); the A80 SID is not yet
supported by the sunxi nvmem driver anyway, so calibration data is
currently unavailable and the driver falls back to the defaults,
which yield plausible results (idle temperatures around 40 degC,
full-load peaks in the mid 50s on a Cubieboard4).

Tested on a Cubietech Cubieboard4: all four zones report load-reactive
temperatures via polling.

Co-authored-by: Claude Fable 5 <noreply@anthropic.com>
Signed-off-by: Sören Hantel <fugininsane@googlemail.com>
---
 drivers/thermal/sun8i_thermal.c | 98 ++++++++++++++++++++++++++++++++-
 1 file changed, 97 insertions(+), 1 deletion(-)

diff --git a/drivers/thermal/sun8i_thermal.c b/drivers/thermal/sun8i_thermal.c
index 2267479..c906dea 100644
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
@@ -307,6 +326,9 @@ static int sun8i_ths_calibrate(struct ths_device *tmdev)
 	size_t callen;
 	int ret = 0;
 
+	if (!tmdev->chip->calibrate)
+		return 0;
+
 	calcell = nvmem_cell_get(dev, "calibration");
 	if (IS_ERR(calcell)) {
 		if (PTR_ERR(calcell) == -EPROBE_DEFER)
@@ -413,7 +435,8 @@ static int sun8i_ths_resource_init(struct ths_device *tmdev)
 			return PTR_ERR(tmdev->mod_clk);
 	}
 
-	ret = clk_set_rate(tmdev->mod_clk, 24000000);
+	ret = clk_set_rate(tmdev->mod_clk, tmdev->chip->mod_clk_rate ?:
+			   24000000);
 	if (ret)
 		return ret;
 
@@ -596,6 +619,78 @@ static int sun8i_ths_probe(struct platform_device *pdev)
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
+	 * conversion rate (tens of kHz), and the level triggered alarm
+	 * interrupt would retrigger for as long as the over-temperature
+	 * condition persists. Leave both disabled and let the thermal
+	 * core poll the data registers; only the emergency shutdown
+	 * interrupt stays enabled, as by the time it fires the hardware
+	 * is powering off anyway.
+	 */
+	regmap_write(tmdev->regmap, SUN9I_THS_IC, SUN9I_THS_SHUT_IRQ_EN);
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
@@ -711,6 +806,7 @@ static const struct ths_thermal_chip sun50i_h616_ths = {
 
 static const struct of_device_id of_ths_match[] = {
 	{ .compatible = "allwinner,sun8i-a83t-ths", .data = &sun8i_a83t_ths },
+	{ .compatible = "allwinner,sun9i-a80-ths", .data = &sun9i_a80_ths },
 	{ .compatible = "allwinner,sun8i-h3-ths", .data = &sun8i_h3_ths },
 	{ .compatible = "allwinner,sun8i-r40-ths", .data = &sun8i_r40_ths },
 	{ .compatible = "allwinner,sun50i-a64-ths", .data = &sun50i_a64_ths },
-- 
2.43.0


