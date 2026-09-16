Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 734BCC88E5C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 04:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kv7K+NQDwkzVit4t1U8RT9Xbw/6Dvr8ewgY1vIfRASQ=; b=tpXpgW/khIFE1/vqPPKGiziLkf
	yzI5zHHycBaLB4b5YChZoX7Q+SaPHEcH6M29EDkeNvouon37uckYAb/j2ZKSMXLO/RdLzQvjBeW0j
	HhTHaruelsBChXvmb4AhKOWqNdgfs/gRE7uS/6+gnJvsBui8kpog6B64LVqL3ESbSGkP5dJB4lhLA
	VfQXr2cdG/ibARZXvHZRNfqwUwSnhzAAaTbZLRfTcZ0UAzJln9U3qc3ezvj90jIitjbEycMxj/N2j
	5DsUeK5e+BG9+QeV/tANE53VtZ/Sf13VNXQZJmmUtV6wb9prJrXz/+jTq2trpFt10GV4h3nEgW9Ka
	vUBFmm9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6h3f-00000008I51-2mZo;
	Wed, 16 Sep 2026 04:15:43 +0000
Received: from mail-oo2-x04.google.com ([2607:f8b0:4864:31::4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6h3U-00000008HzK-3crQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 04:15:34 +0000
Received: by mail-oo2-x04.google.com with SMTP id 46e09a7af769-7f4e2118db8so1880518a34.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Sep 2026 21:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789532132; x=1790136932; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kv7K+NQDwkzVit4t1U8RT9Xbw/6Dvr8ewgY1vIfRASQ=;
        b=nDVc8yaQtcW1uO0s8RLvYanUron9WPOhoglwYwnrWvag2XEkBXjNHyer3DMXgFQbfI
         3c1TEPBHv4OFFvJr34CS8tP0B3IireEPLVyS59dY4iApwo569pVfazrKFdq0BL8Amo0O
         SeN6FGm2Kd7+XD/hhDk1JeYr68TnuA8fircFgPtP3iBG6u7CVV5AHAX7asXDnGsb2bDA
         ImFWf1QOPUneJbJyl3b0wruhAaknJ09ekvuJMiCsVLWwQczBwOuilGJCJtanJ15UeSvV
         /SBmJjbaSlRxQwEx/7R9cvQithMsJepf5a+dpKviPgamOj6ybecMPSxrgYBaarxqTEtL
         29GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789532132; x=1790136932;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kv7K+NQDwkzVit4t1U8RT9Xbw/6Dvr8ewgY1vIfRASQ=;
        b=xKwt4j3AulnTyvczS8XZIy4BFQsS1DZEWy8C7no7GmrSTuHohWQZd3jPxpPGSYiF9C
         Bny0CD/0StuvOZ6ZKfO7oUKBPnUrFPD4+/uIWUQnN2eLhjjMwbubVIim8O0lMr1WKjRX
         8UrH/O9P9KRQuZTO9FQLOdVLTazXqBwKCNlbvGR3o3R/+lVie2nwBiL8q4gGK1iNAaWq
         oR4fLlu3nwK8MfT6nqnbcxwGNEu/cDVzuTGXbFEgzaJJEYgZCzcAyt5Dps1ubuRZn6f0
         /KonELrXjy2wLXvuWQhStYCa90A1dKMvw5LMejx3q1FeP+E8igbxtAWjDyWxLCurYMh4
         FuKA==
X-Forwarded-Encrypted: i=1; AKwUvBwqiP0EpqG/vWiwWSS15c/Wjb6ibSBYd+vkw+znEYxKqSEDAvGRzbCBwfoZss75chpSaVA6vq4ZO+Pb6eJKiQPz@lists.infradead.org
X-Gm-Message-State: AFuF++lRNgpULU2aImtTJEi71pr6zinsXgqtHZ5XPsZEFV6eFA7sFGWy
	m/IRtV5z3MUjgmAsIFFKHSx99nGYupsPW41RFTH1JJqTknV0Pw4dtSEn
X-Gm-Gg: AYBFou1zjtkXPwcGjnCjuokiz79Mif2PdwMOhE++LKtB+hlxhrn7uTj4XjbMMWfuU/5
	5A8Di4wL9XaPArVq3OhSmBERpsIzU3RVVnPB0GMNyFleRTAV7IjVQypubxU0W5NG1BYPxyH+I3c
	F/SRWUos8ofIieSB22BlkB9bmewWY8FQrp2886JMSzbDRh+hK8ktqCb8aygPXAvgDs4qnnsaaTd
	mkLDmcIUDdukoJG+Wt+lODi9qNbzwMFqOpxgXphycLqEFWQlADvfthTJDSsV5/0GnoIDX6nyT2D
	tuvdMBiqpmlHHavYG/TVCVv7R71BoC1iVfBZ4ZEWbpyiJnITJuiFNgFiRXFs0QVxRFXfDY7RnKM
	nCt3gi3+4SbL6kfQf9CZSpVP3NeeNXPOu+lMnHUbY4KFz7dZukO+G7w58sRjv+bjbRjIURIajGy
	SmQj0nqzN/Mb9BqhIBV4sgVjt2rjVQrCu6wZLR6GDXxmqx8eXxRUz+VY4IeN6ZwC6ce8eht0Kwe
	c/s1Q==
X-Received: by 2002:a05:6830:6105:b0:7f8:4ac8:bd2a with SMTP id 46e09a7af769-80b2e558715mr3543149a34.12.1789532132103;
        Tue, 15 Sep 2026 21:15:32 -0700 (PDT)
Received: from [192.168.18.164] ([2600:8804:5716:d800::b712])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-80b07ad0373sm1440484a34.26.2026.09.15.21.15.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 21:15:31 -0700 (PDT)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Tue, 15 Sep 2026 23:15:27 -0500
Subject: [PATCH 2/3] iio: adc: mt6397-auxadc: add mt6397 PMIC AUXADC driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-rbrue-suez-upstreaming-mt6397-auxadc-v1-2-d35d2ac3d6f0@gmail.com>
References: <20260915-rbrue-suez-upstreaming-mt6397-auxadc-v1-0-d35d2ac3d6f0@gmail.com>
In-Reply-To: <20260915-rbrue-suez-upstreaming-mt6397-auxadc-v1-0-d35d2ac3d6f0@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Lee Jones <lee@kernel.org>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, mfd@lists.linux.dev, 
 Roman Vivchar <rva333@protonmail.com>, 
 Luca Leonardo Scorcia <l.scorcia@gmail.com>, 
 Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789532127; l=14253;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=eMXlSZo1VOCw8RXDlIOWEe10ScLpRFrd7gnttzf71Ac=;
 b=0u2/Akbf2ysKhB6fTs57++wLo5QOOioVh1JTcrpvIUVHzF0WcH9IzQUB4W9MZgVlp4+hFTAFa
 Gayu3Z55t2tBvFvV5tZJF6KAb7aIpbF2tRBEIWvC6nuqoqcp4bKDJ8N
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_211532_969886_D518053F 
X-CRM114-Status: GOOD (  32.43  )
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

The mt6397 AUXADC is a 10-bit ADC behind the SoC's PMIC wrapper. On boards
built around this PMIC it is the only way to read the battery: the SoC's
AUXADC is wired to board thermistors and the charger ICs these boards use
have no ADC of their own.

Add a driver exposing the battery voltage and battery temperature
channels. Only those two are described, so a channel ID in the device tree
is an index into the driver's channel array rather than the PMIC's channel
number, as mt6323-auxadc does. The ready bit lives in a channel's raw
result register, but the value comes from the chip's trimmed copy of it,
which is what the vendor driver reads for a measurement.

Both channels need more than that, as the vendor programs them. The
battery voltage is measured through ISENSE, because a board with a
switching charger in the power path leaves BATSNS on the charger's system
rail instead of on the pack. The thermistor only reads correctly with the
PMIC's battery-detect bias and input buffer enabled, which take 20 ms to
settle. Both are switched back off afterwards.

Reads average sixteen conversions in software; the chip's sample
accumulator makes no measurable difference at any setting, so it is left
at one sample per conversion.

Assisted-by: LLM
Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
 MAINTAINERS                     |   7 +
 drivers/iio/adc/Kconfig         |  11 ++
 drivers/iio/adc/Makefile        |   1 +
 drivers/iio/adc/mt6397-auxadc.c | 340 ++++++++++++++++++++++++++++++++++++++++
 4 files changed, 359 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index c2414447892c..9b254f98b5d7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16713,6 +16713,13 @@ S:	Maintained
 F:	drivers/iio/adc/mt6323-auxadc.c
 F:	include/dt-bindings/iio/adc/mediatek,mt6323-auxadc.h
 
+MEDIATEK MT6397 PMIC AUXADC DRIVER
+M:	Ryan Brue <ryanbrue.dev@gmail.com>
+L:	linux-iio@vger.kernel.org
+S:	Maintained
+F:	drivers/iio/adc/mt6397-auxadc.c
+F:	include/dt-bindings/iio/adc/mediatek,mt6397-auxadc.h
+
 MEDIATEK MT6735 CLOCK & RESET DRIVERS
 M:	Yassine Oudjana <y.oudjana@protonmail.com>
 L:	linux-clk@vger.kernel.org
diff --git a/drivers/iio/adc/Kconfig b/drivers/iio/adc/Kconfig
index 415e519ad4eb..9a1d36ed53cb 100644
--- a/drivers/iio/adc/Kconfig
+++ b/drivers/iio/adc/Kconfig
@@ -1233,6 +1233,17 @@ config MEDIATEK_MT6370_ADC
 	  This driver can also be built as a module. If so, the module
 	  will be called "mt6370-adc".
 
+config MEDIATEK_MT6397_AUXADC
+	tristate "MediaTek MT6397 PMIC AUXADC driver"
+	depends on MFD_MT6397
+	help
+	  Say yes here to enable support for MediaTek MT6397 PMIC Auxiliary ADC.
+	  This driver provides the battery voltage and battery temperature
+	  channels used by the fuel gauge on boards built around this PMIC.
+
+	  This driver can also be built as a module. If so, the module will be
+	  called mt6397-auxadc.
+
 config MEDIATEK_MT6577_AUXADC
 	tristate "MediaTek AUXADC driver"
 	depends on ARCH_MEDIATEK || COMPILE_TEST
diff --git a/drivers/iio/adc/Makefile b/drivers/iio/adc/Makefile
index dcec0abb03b7..13cb4206bdb7 100644
--- a/drivers/iio/adc/Makefile
+++ b/drivers/iio/adc/Makefile
@@ -105,6 +105,7 @@ obj-$(CONFIG_MEDIATEK_MT6323_AUXADC) += mt6323-auxadc.o
 obj-$(CONFIG_MEDIATEK_MT6359_AUXADC) += mt6359-auxadc.o
 obj-$(CONFIG_MEDIATEK_MT6360_ADC) += mt6360-adc.o
 obj-$(CONFIG_MEDIATEK_MT6370_ADC) += mt6370-adc.o
+obj-$(CONFIG_MEDIATEK_MT6397_AUXADC) += mt6397-auxadc.o
 obj-$(CONFIG_MEDIATEK_MT6577_AUXADC) += mt6577_auxadc.o
 obj-$(CONFIG_MEN_Z188_ADC) += men_z188_adc.o
 obj-$(CONFIG_MESON_SARADC) += meson_saradc.o
diff --git a/drivers/iio/adc/mt6397-auxadc.c b/drivers/iio/adc/mt6397-auxadc.c
new file mode 100644
index 000000000000..dbfa82341d6c
--- /dev/null
+++ b/drivers/iio/adc/mt6397-auxadc.c
@@ -0,0 +1,340 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * MediaTek MT6397 PMIC AUXADC IIO driver
+ *
+ * Copyright (c) 2026 Ryan Brue <ryanbrue.dev@gmail.com>
+ *
+ * Based on drivers/iio/adc/mt6323-auxadc.c
+ */
+
+#include <linux/array_size.h>
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/cleanup.h>
+#include <linux/delay.h>
+#include <linux/iio/iio.h>
+#include <linux/math.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/stringify.h>
+#include <linux/time.h>
+#include <linux/types.h>
+
+#include <linux/mfd/mt6397/core.h>
+
+#include <dt-bindings/iio/adc/mediatek,mt6397-auxadc.h>
+
+/* The ready bit is in the raw result register, the value in the trimmed one. */
+#define MT6397_AUXADC_ADC(n)		(0x0514 + 2 * (n))
+#define MT6397_AUXADC_ADC_RDY		BIT(15)
+#define MT6397_AUXADC_ADC_VAL		GENMASK(9, 0)
+#define MT6397_AUXADC_ADC_TRIM(n)	(0x052a + 2 * (n))	/* ADC11 + n */
+
+/* The thermistor needs the battery-detect bias and the input buffer on. */
+#define MT6397_AUXADC_CON0		0x0542
+#define MT6397_AUXADC_CON0_BUF_PWD_B	BIT(1)
+#define MT6397_AUXADC_CON0_BUF_PWD_ON	BIT(3)
+#define MT6397_CHR_CON7			0x000e
+#define MT6397_CHR_CON7_BATON_TDET_EN	BIT(2)
+#define MT6397_AUXADC_BATTEMP_SETTLE_US	(20 * USEC_PER_MSEC)
+
+#define MT6397_AUXADC_CON1		0x0544
+#define MT6397_AUXADC_CON1_CHSEL	GENMASK(10, 7)
+#define MT6397_AUXADC_CON1_START	BIT(0)
+
+/*
+ * CHR_CON16 and the two SOURCE_CH0 selects route either BATSNS or ISENSE onto
+ * the battery channel. Only ISENSE is used: with a switching charger in the
+ * power path BATSNS sits on the system rail rather than on the pack.
+ */
+#define MT6397_CHR_CON16		0x0020
+#define MT6397_CHR_CON16_ADCIN_VSEN_EN	BIT(11)
+#define MT6397_CHR_CON16_ADCIN_VBAT_EN	BIT(10)
+#define MT6397_CHR_CON16_ADCIN_SEL	(MT6397_CHR_CON16_ADCIN_VSEN_EN | \
+					 MT6397_CHR_CON16_ADCIN_VBAT_EN)
+#define MT6397_AUXADC_CON14		0x055e
+#define MT6397_AUXADC_CON14_CH0_NORM_SEL BIT(2)
+#define MT6397_AUXADC_CON14_CH0_LBAT_SEL BIT(0)
+#define MT6397_AUXADC_ISENSE_SETTLE_US	USEC_PER_MSEC
+
+/* Samples accumulated per conversion; the chip's accumulator is left off. */
+#define MT6397_AUXADC_CON0_SPL_NUM	GENMASK(11, 7)
+
+/* Conversions averaged in software per read. */
+#define MT6397_AUXADC_SAMPLES		16
+
+/* Hardware limitation: the result is not ready for this long after START. */
+#define MT6397_AUXADC_START_US		30
+
+/* The battery channel is divided down by 4; the thermistor is not divided. */
+#define MT6397_AUXADC_ISENSE_DIVIDER	4
+
+/* The PMIC's own channel numbers, as the CON1 select field takes them. */
+#define MT6397_AUXADC_HWCHAN_BATSNS	0
+#define MT6397_AUXADC_HWCHAN_BAT_TEMP	3
+
+struct mt6397_auxadc {
+	struct regmap *regmap;
+	/* AUXADC doesn't support reading multiple channels simultaneously. */
+	struct mutex lock;
+};
+
+#define MTK_PMIC_IIO_CHAN(_name, _chan, _hwchan)                \
+{                                                               \
+	.type = IIO_VOLTAGE,                                    \
+	.indexed = 1,                                           \
+	.channel = _chan,                                       \
+	.address = _hwchan,                                     \
+	.datasheet_name = __stringify(_name),                   \
+	.info_mask_separate = BIT(IIO_CHAN_INFO_RAW) |          \
+			      BIT(IIO_CHAN_INFO_SCALE),         \
+}
+
+/*
+ * A device tree channel ID indexes this array; .address holds the PMIC channel
+ * number. The thermistor reports as a voltage because that is all the PMIC
+ * measures: the divider across an NTC whose curve belongs to the board.
+ */
+static const struct iio_chan_spec mt6397_auxadc_channels[] = {
+	MTK_PMIC_IIO_CHAN(isense,   MT6397_AUXADC_ISENSE,
+			  MT6397_AUXADC_HWCHAN_BATSNS),
+	MTK_PMIC_IIO_CHAN(bat_temp, MT6397_AUXADC_BAT_TEMP,
+			  MT6397_AUXADC_HWCHAN_BAT_TEMP),
+};
+
+static int mt6397_auxadc_read_once(struct mt6397_auxadc *adc,
+				   const struct iio_chan_spec *chan, int *val)
+{
+	struct regmap *map = adc->regmap;
+	unsigned int reg;
+	int ret;
+
+	ret = regmap_update_bits(map, MT6397_AUXADC_CON1,
+				 MT6397_AUXADC_CON1_CHSEL,
+				 FIELD_PREP(MT6397_AUXADC_CON1_CHSEL,
+					    chan->address));
+	if (ret)
+		return ret;
+
+	/* START is edge triggered: it has to be lowered before being raised. */
+	ret = regmap_clear_bits(map, MT6397_AUXADC_CON1,
+				MT6397_AUXADC_CON1_START);
+	if (ret)
+		return ret;
+
+	ret = regmap_set_bits(map, MT6397_AUXADC_CON1,
+			      MT6397_AUXADC_CON1_START);
+	if (ret)
+		return ret;
+
+	fsleep(MT6397_AUXADC_START_US);
+
+	ret = regmap_read_poll_timeout(map, MT6397_AUXADC_ADC(chan->address),
+				       reg, reg & MT6397_AUXADC_ADC_RDY,
+				       100, 100 * USEC_PER_MSEC);
+	if (ret)
+		return ret;
+
+	ret = regmap_read(map, MT6397_AUXADC_ADC_TRIM(chan->address), &reg);
+	if (ret)
+		return ret;
+
+	*val = FIELD_GET(MT6397_AUXADC_ADC_VAL, reg);
+
+	return 0;
+}
+
+static int mt6397_auxadc_battemp_bias(struct mt6397_auxadc *adc, bool on)
+{
+	struct regmap *map = adc->regmap;
+	int ret;
+
+	if (on) {
+		ret = regmap_set_bits(map, MT6397_AUXADC_CON0,
+				      MT6397_AUXADC_CON0_BUF_PWD_ON);
+		if (ret)
+			return ret;
+		ret = regmap_set_bits(map, MT6397_AUXADC_CON0,
+				      MT6397_AUXADC_CON0_BUF_PWD_B);
+		if (ret)
+			return ret;
+		return regmap_set_bits(map, MT6397_CHR_CON7,
+				       MT6397_CHR_CON7_BATON_TDET_EN);
+	}
+
+	ret = regmap_clear_bits(map, MT6397_CHR_CON7,
+				MT6397_CHR_CON7_BATON_TDET_EN);
+	ret = ret ?: regmap_clear_bits(map, MT6397_AUXADC_CON0,
+				       MT6397_AUXADC_CON0_BUF_PWD_B);
+	return ret ?: regmap_clear_bits(map, MT6397_AUXADC_CON0,
+					MT6397_AUXADC_CON0_BUF_PWD_ON);
+}
+
+static int mt6397_auxadc_isense_enable(struct mt6397_auxadc *adc)
+{
+	struct regmap *map = adc->regmap;
+	int ret;
+
+	ret = regmap_update_bits(map, MT6397_CHR_CON16,
+				 MT6397_CHR_CON16_ADCIN_SEL,
+				 MT6397_CHR_CON16_ADCIN_VSEN_EN);
+	if (ret)
+		return ret;
+
+	return regmap_set_bits(map, MT6397_AUXADC_CON14,
+			       MT6397_AUXADC_CON14_CH0_NORM_SEL |
+			       MT6397_AUXADC_CON14_CH0_LBAT_SEL);
+}
+
+static int mt6397_auxadc_isense_disable(struct mt6397_auxadc *adc)
+{
+	struct regmap *map = adc->regmap;
+	int ret;
+
+	ret = regmap_clear_bits(map, MT6397_AUXADC_CON14,
+				MT6397_AUXADC_CON14_CH0_NORM_SEL |
+				MT6397_AUXADC_CON14_CH0_LBAT_SEL);
+
+	return ret ?: regmap_clear_bits(map, MT6397_CHR_CON16,
+					MT6397_CHR_CON16_ADCIN_SEL);
+}
+
+static int mt6397_auxadc_read_channel(struct mt6397_auxadc *adc,
+				      const struct iio_chan_spec *chan,
+				      int *val)
+{
+	unsigned int i, sum = 0;
+	int ret, sample;
+
+	/* Held across the whole burst: the channel select is shared state. */
+	guard(mutex)(&adc->lock);
+
+	if (chan->channel == MT6397_AUXADC_ISENSE) {
+		ret = mt6397_auxadc_isense_enable(adc);
+		if (ret)
+			return ret;
+		fsleep(MT6397_AUXADC_ISENSE_SETTLE_US);
+	} else {
+		ret = mt6397_auxadc_battemp_bias(adc, true);
+		if (ret)
+			return ret;
+		fsleep(MT6397_AUXADC_BATTEMP_SETTLE_US);
+	}
+
+	for (i = 0; i < MT6397_AUXADC_SAMPLES; i++) {
+		ret = mt6397_auxadc_read_once(adc, chan, &sample);
+		if (ret)
+			break;
+
+		sum += sample;
+	}
+
+	/* Lower START so the converter is not left armed between reads. */
+	regmap_clear_bits(adc->regmap, MT6397_AUXADC_CON1,
+			  MT6397_AUXADC_CON1_START);
+
+	if (chan->channel == MT6397_AUXADC_ISENSE)
+		mt6397_auxadc_isense_disable(adc);
+	else
+		mt6397_auxadc_battemp_bias(adc, false);
+
+	if (ret)
+		return ret;
+
+	*val = DIV_ROUND_CLOSEST(sum, MT6397_AUXADC_SAMPLES);
+
+	return 0;
+}
+
+static int mt6397_auxadc_read_raw(struct iio_dev *indio_dev,
+				  const struct iio_chan_spec *chan,
+				  int *val, int *val2, long mask)
+{
+	struct mt6397_auxadc *adc = iio_priv(indio_dev);
+	int ret;
+
+	switch (mask) {
+	case IIO_CHAN_INFO_RAW:
+		ret = mt6397_auxadc_read_channel(adc, chan, val);
+		if (ret)
+			return ret;
+
+		return IIO_VAL_INT;
+
+	case IIO_CHAN_INFO_SCALE:
+		/* 1200 mV full range with 10-bit resolution. */
+		*val = 1200;
+		if (chan->channel == MT6397_AUXADC_ISENSE)
+			*val *= MT6397_AUXADC_ISENSE_DIVIDER;
+		*val2 = 10;
+
+		return IIO_VAL_FRACTIONAL_LOG2;
+
+	default:
+		return -EINVAL;
+	}
+}
+
+static int mt6397_auxadc_init(struct mt6397_auxadc *adc)
+{
+	return regmap_update_bits(adc->regmap, MT6397_AUXADC_CON0,
+				  MT6397_AUXADC_CON0_SPL_NUM,
+				  FIELD_PREP(MT6397_AUXADC_CON0_SPL_NUM, 1));
+}
+
+static const struct iio_info mt6397_auxadc_info = {
+	.read_raw = mt6397_auxadc_read_raw,
+};
+
+static int mt6397_auxadc_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct mt6397_chip *chip = dev_get_drvdata(dev->parent);
+	struct mt6397_auxadc *adc;
+	struct iio_dev *indio_dev;
+	int ret;
+
+	indio_dev = devm_iio_device_alloc(dev, sizeof(*adc));
+	if (!indio_dev)
+		return -ENOMEM;
+
+	adc = iio_priv(indio_dev);
+	adc->regmap = chip->regmap;
+
+	ret = devm_mutex_init(dev, &adc->lock);
+	if (ret)
+		return ret;
+
+	ret = mt6397_auxadc_init(adc);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to initialize auxadc\n");
+
+	indio_dev->name = "mt6397-auxadc";
+	indio_dev->info = &mt6397_auxadc_info;
+	indio_dev->modes = INDIO_DIRECT_MODE;
+	indio_dev->channels = mt6397_auxadc_channels;
+	indio_dev->num_channels = ARRAY_SIZE(mt6397_auxadc_channels);
+
+	return devm_iio_device_register(dev, indio_dev);
+}
+
+static const struct of_device_id mt6397_auxadc_of_match[] = {
+	{ .compatible = "mediatek,mt6397-auxadc" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, mt6397_auxadc_of_match);
+
+static struct platform_driver mt6397_auxadc_driver = {
+	.driver = {
+		.name = "mt6397-auxadc",
+		.of_match_table = mt6397_auxadc_of_match,
+	},
+	.probe = mt6397_auxadc_probe,
+};
+module_platform_driver(mt6397_auxadc_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Ryan Brue <ryanbrue.dev@gmail.com>");
+MODULE_DESCRIPTION("MediaTek MT6397 PMIC AUXADC Driver");

-- 
2.55.0


