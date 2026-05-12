Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 967D3CD4F30
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 05:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dHWDV9RuEwW110HR/Vdd4lNdFte+bfbkw7lr+Pn8io8=; b=Ovj3jA57JmBxLtcSlhT2eBuAQv
	qUwQxiU2vNERmJrEYyRpmnUG/KcZvQadyYBCq7Tn2zFrGFLQaEof5Y0rsdU+nsnAxPR9hc+X6R4ho
	9DYtZNOhMPbA1REMTbmHHulIUgtFdZa2eDbR0WBdJxM9fOpkKPKwV8UuouaAJZ6xvuzcAgZYQKVt8
	1maW1nZuAJu7sjQt85g09248BYaCVRZAhM0eVNwQZNIq3NBnkRsEmqBhK/gUyLsIUQo6GgIcQGqSQ
	maoLcR6gVEeQP9ymrr0hYh3s9Lxf0kWPUzpWwpQHI37HqRNjtK1cl835YOS40fq9SaQr3ykCHKbQO
	+VpyQFGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMfZ3-0000000FZ60-1MXA;
	Tue, 12 May 2026 05:21:53 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMfYr-0000000FYmW-0vh5;
	Tue, 12 May 2026 05:21:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2EA7D44516;
	Tue, 12 May 2026 05:21:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0570FC32782;
	Tue, 12 May 2026 05:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778563300;
	bh=W8EUMiQRE9KA/DLtLhnbe6pO5t4G4rZjz/6nl2JdvKc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=PU3Ifrt2M5UN+v+JS4vG2JrNHafMX9cdnW8zJBcS0e4FZG4jKeyeZg0Kw4gsOoBAf
	 y8aoHw8oGbZma7ONsIRT7O8kYFlxlOehFydnRszqpmi0TFCgGk4YKPZo/T6DB3hTrO
	 +yUs5KE1+eaoxc4xZ9EqLqoYq0ZMAy+C/hfPhekeRbU5j6orUHSgNMAv7NxAxbLL/0
	 A4ODn0Hr5tOXUhTU6KWr596uPSVFsaNQSWKcYxhOYECxeuOF5Y0RaGFYWgkTBHoxhs
	 kD4I8ez2HrdArMaJfCfvkHB8bg//QwduiEY+/QQZnAHgRKLIDZbWNLte6ItrGqWJrW
	 aKQZlyT1aJnng==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA71BCD4851;
	Tue, 12 May 2026 05:21:39 +0000 (UTC)
From: Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org>
Date: Tue, 12 May 2026 08:18:19 +0300
Subject: [PATCH v2 05/16] iio: adc: mediatek: add mt6323 PMIC AUXADC driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260512-mt6323-v2-5-3efcba579e88@protonmail.com>
References: <20260512-mt6323-v2-0-3efcba579e88@protonmail.com>
In-Reply-To: <20260512-mt6323-v2-0-3efcba579e88@protonmail.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Macpaul Lin <macpaul.lin@mediatek.com>, Lee Jones <lee@kernel.org>, 
 Roman Vivchar <rva333@protonmail.com>, 
 Srinivas Kandagatla <srini@kernel.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org, 
 Ben Grisdale <bengris32@protonmail.ch>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778563297; l=11321;
 i=rva333@protonmail.com; s=20260510; h=from:subject:message-id;
 bh=RLYc/zS9ZtBnqAKYVrA3V130ClHJHxTKAJlhkAp8z5Y=;
 b=e+xyk49Jd2eQSijGXugouq7Mf9vFdRRnevVcZ/akMP3BNIhdw8dz7f6c0R0QE3A1gE0BxLQsM
 Jyc0moxoNFrBOyL3DI7EYeCsFfXuFOAupRO8bZ7iJKly4f4yY8eH1/P
X-Developer-Key: i=rva333@protonmail.com; a=ed25519;
 pk=zww/nWjBGoQ4POXCG0BV6fx2iuXK6jx77rsKPA5YK5Y=
X-Endpoint-Received: by B4 Relay for rva333@protonmail.com/20260510 with
 auth_id=777
X-Original-From: Roman Vivchar <rva333@protonmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_222141_342208_F4C42CD9 
X-CRM114-Status: GOOD (  25.05  )
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
Reply-To: rva333@protonmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Roman Vivchar <rva333@protonmail.com>

The mt6323 AUXADC is a 15-bit ADC used for system monitoring. This driver
provides support for reading various channels including battery and
charger voltages, battery and chip temperature, current sensing and
accessory detection.

Add a driver for the AUXADC found in the MediaTek mt6323 PMIC.

Tested-by: Ben Grisdale <bengris32@protonmail.ch> # Amazon Echo Dot (2nd Generation)
Signed-off-by: Roman Vivchar <rva333@protonmail.com>
---
 drivers/iio/adc/Kconfig         |  11 ++
 drivers/iio/adc/Makefile        |   1 +
 drivers/iio/adc/mt6323-auxadc.c | 319 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 331 insertions(+)

diff --git a/drivers/iio/adc/Kconfig b/drivers/iio/adc/Kconfig
index 60038ae8dfc4..a03614b46041 100644
--- a/drivers/iio/adc/Kconfig
+++ b/drivers/iio/adc/Kconfig
@@ -1137,6 +1137,17 @@ config MCP3911
 	  This driver can also be built as a module. If so, the module will be
 	  called mcp3911.
 
+config MEDIATEK_MT6323_AUXADC
+	tristate "MediaTek MT6323 PMIC AUXADC driver"
+	depends on MFD_MT6397
+	help
+	  Say yes here to enable support for MediaTek MT6323 PMIC Auxiliary ADC.
+	  This driver provides multiple channels for system monitoring,
+	  such as battery voltage, PMIC temperature, and others.
+
+	  This driver can also be built as a module. If so, the module will be
+	  called mt6323-auxadc.
+
 config MEDIATEK_MT6359_AUXADC
 	tristate "MediaTek MT6359 PMIC AUXADC driver"
 	depends on MFD_MT6397
diff --git a/drivers/iio/adc/Makefile b/drivers/iio/adc/Makefile
index c76550415ff1..58161750d6e3 100644
--- a/drivers/iio/adc/Makefile
+++ b/drivers/iio/adc/Makefile
@@ -99,6 +99,7 @@ obj-$(CONFIG_MCP320X) += mcp320x.o
 obj-$(CONFIG_MCP3422) += mcp3422.o
 obj-$(CONFIG_MCP3564) += mcp3564.o
 obj-$(CONFIG_MCP3911) += mcp3911.o
+obj-$(CONFIG_MEDIATEK_MT6323_AUXADC) += mt6323-auxadc.o
 obj-$(CONFIG_MEDIATEK_MT6359_AUXADC) += mt6359-auxadc.o
 obj-$(CONFIG_MEDIATEK_MT6360_ADC) += mt6360-adc.o
 obj-$(CONFIG_MEDIATEK_MT6370_ADC) += mt6370-adc.o
diff --git a/drivers/iio/adc/mt6323-auxadc.c b/drivers/iio/adc/mt6323-auxadc.c
new file mode 100644
index 000000000000..2c2b495e3d38
--- /dev/null
+++ b/drivers/iio/adc/mt6323-auxadc.c
@@ -0,0 +1,319 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2026 Roman Vivchar <rva333@protonmail.com>
+ *
+ * Based on drivers/iio/adc/mt6359-auxadc.c
+ */
+
+#include <linux/array_size.h>
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/cleanup.h>
+#include <linux/delay.h>
+#include <linux/iio/iio.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/platform_device.h>
+#include <linux/property.h>
+#include <linux/regmap.h>
+#include <linux/stringify.h>
+#include <linux/types.h>
+
+#include <linux/mfd/mt6397/core.h>
+#include <linux/mfd/mt6323/registers.h>
+
+#include <dt-bindings/iio/adc/mediatek,mt6323-auxadc.h>
+
+#define AUXADC_RSTB_SEL		BIT(7)
+#define AUXADC_RSTB_SW		BIT(5)
+
+#define AUXADC_CTL_CK		BIT(5)
+
+#define AUXADC_TRIM_CH2		(3 << 10)
+#define AUXADC_TRIM_CH4		(3 << 8)
+#define AUXADC_TRIM_CH5		(3 << 4)
+#define AUXADC_TRIM_CH6		(3 << 2)
+
+#define AUXADC_VREF18_ENB_MD	BIT(15)
+#define AUXADC_MD_STATUS	BIT(0)
+
+#define AUXADC_GPS_STATUS	BIT(1)
+
+#define AUXADC_VREF18_SELB	BIT(1)
+#define AUXADC_DECI_GDLY_SEL	BIT(0)
+
+#define AUXADC_VBUF_EN		BIT(4)
+
+#define AUXADC_DECI_GDLY_MASK		GENMASK(15, 14)
+#define AUXADC_ADC19_BUSY_MASK		GENMASK(15, 1)
+#define AUXADC_RDY_MASK			BIT(15)
+#define AUXADC_DATA_MASK		GENMASK(14, 0)
+
+#define AUXADC_OSR_MASK			GENMASK(12, 10)
+#define AUXADC_DEFAULT_OSR		3
+
+#define AUXADC_LOW_CHANNEL_MASK		GENMASK(9, 0)
+#define AUXADC_AUDIO_CHANNEL_MASK	GENMASK(8, 0)
+
+#define VOLTAGE_FULL_RANGE	1800
+#define AUXADC_PRECISE		32768
+
+#define MTK_PMIC_IIO_CHAN(_name, _idx, _ch_type)       \
+{                                                      \
+	.type = _ch_type,                              \
+	.indexed = 1,                                  \
+	.channel = _idx,                               \
+	.address = _idx,                               \
+	.datasheet_name = __stringify(_name),          \
+	.info_mask_separate = BIT(IIO_CHAN_INFO_RAW) | \
+			      BIT(IIO_CHAN_INFO_SCALE) \
+}
+
+static const struct iio_chan_spec mt6323_auxadc_channels[] = {
+	MTK_PMIC_IIO_CHAN(baton2, MT6323_AUXADC_BATON2, IIO_VOLTAGE),
+	MTK_PMIC_IIO_CHAN(ch6, MT6323_AUXADC_CH6, IIO_VOLTAGE),
+	MTK_PMIC_IIO_CHAN(bat_temp, MT6323_AUXADC_BAT_TEMP, IIO_TEMP),
+	MTK_PMIC_IIO_CHAN(chip_temp, MT6323_AUXADC_CHIP_TEMP, IIO_TEMP),
+	MTK_PMIC_IIO_CHAN(vcdt, MT6323_AUXADC_VCDT, IIO_VOLTAGE),
+	MTK_PMIC_IIO_CHAN(baton1, MT6323_AUXADC_BATON1, IIO_VOLTAGE),
+	MTK_PMIC_IIO_CHAN(isense, MT6323_AUXADC_ISENSE, IIO_VOLTAGE),
+	MTK_PMIC_IIO_CHAN(batsns, MT6323_AUXADC_BATSNS, IIO_VOLTAGE),
+	MTK_PMIC_IIO_CHAN(accdet, MT6323_AUXADC_ACCDET, IIO_VOLTAGE),
+};
+
+/**
+ * struct mt6323_auxadc - Main driver structure
+ * @regmap:        Regmap from PWRAP
+ * @lock:          Mutex to serialize AUXADC reading vs configuration
+ *
+ * The MediaTek MT6323 (as well as lot of other PMICs) have the following hierarchy:
+ * PMIC AUXADC <- PMIC MFD <- SoC PWRAP (wrapper for PWRAP FSM)
+ *
+ * Therefore, PWRAP regmap should be get using dev->parent->parent.
+ */
+struct mt6323_auxadc {
+	struct regmap *regmap;
+	struct mutex lock;
+};
+
+static u32 mt6323_auxadc_channel_to_reg(unsigned long channel)
+{
+	switch (channel) {
+	case MT6323_AUXADC_BATON2:
+		return MT6323_AUXADC_ADC6;
+	case MT6323_AUXADC_CH6:
+		return MT6323_AUXADC_ADC11;
+	case MT6323_AUXADC_BAT_TEMP:
+		return MT6323_AUXADC_ADC5;
+	case MT6323_AUXADC_CHIP_TEMP:
+		return MT6323_AUXADC_ADC4;
+	case MT6323_AUXADC_VCDT:
+		return MT6323_AUXADC_ADC2;
+	case MT6323_AUXADC_BATON1:
+		return MT6323_AUXADC_ADC3;
+	case MT6323_AUXADC_ISENSE:
+		return MT6323_AUXADC_ADC1;
+	case MT6323_AUXADC_BATSNS:
+		return MT6323_AUXADC_ADC0;
+	case MT6323_AUXADC_ACCDET:
+		return MT6323_AUXADC_ADC7;
+	default:
+		return MT6323_AUXADC_ADC17;
+	}
+}
+
+static int mt6323_auxadc_prepare_channel(struct mt6323_auxadc *auxadc)
+{
+	struct regmap *map = auxadc->regmap;
+	u32 val;
+	int ret;
+
+	ret = regmap_read(map, MT6323_AUXADC_CON19, &val);
+	if (ret)
+		return ret;
+
+	/* The ADC is idle */
+	if (!(val & AUXADC_DECI_GDLY_MASK))
+		return 0;
+
+	ret = regmap_read_poll_timeout(map, MT6323_AUXADC_ADC19, val,
+				       !(val & AUXADC_ADC19_BUSY_MASK), 10, 500);
+	if (ret)
+		return ret;
+
+	return regmap_clear_bits(map, MT6323_AUXADC_CON19,
+				 AUXADC_DECI_GDLY_MASK);
+}
+
+static int mt6323_auxadc_request(struct mt6323_auxadc *auxadc,
+				 unsigned long channel)
+{
+	struct regmap *map = auxadc->regmap;
+	int ret;
+
+	ret = regmap_set_bits(map, MT6323_AUXADC_CON11, AUXADC_VBUF_EN);
+	if (ret)
+		return ret;
+
+	ret = regmap_clear_bits(map, MT6323_AUXADC_CON22, BIT(channel));
+	if (ret)
+		return ret;
+
+	return regmap_set_bits(map, MT6323_AUXADC_CON22, BIT(channel));
+}
+
+static int mt6323_auxadc_read(struct mt6323_auxadc *auxadc,
+			      const struct iio_chan_spec *chan, int *out)
+{
+	struct regmap *map = auxadc->regmap;
+	u32 val, reg = mt6323_auxadc_channel_to_reg(chan->address);
+	int ret;
+
+	ret = regmap_read_poll_timeout(map, reg, val, (val & AUXADC_RDY_MASK),
+				       1 * USEC_PER_MSEC, 100 * USEC_PER_MSEC);
+	if (ret)
+		return ret;
+
+	*out = FIELD_GET(AUXADC_DATA_MASK, val);
+
+	return 0;
+}
+
+static int mt6323_auxadc_read_raw(struct iio_dev *indio_dev,
+				  const struct iio_chan_spec *chan, int *val,
+				  int *val2, long mask)
+{
+	struct mt6323_auxadc *auxadc = iio_priv(indio_dev);
+	int ret, mult = 1;
+
+	if (mask == IIO_CHAN_INFO_RAW) {
+		guard(mutex)(&auxadc->lock);
+		ret = mt6323_auxadc_prepare_channel(auxadc);
+		if (ret)
+			return ret;
+
+		ret = mt6323_auxadc_request(auxadc, chan->address);
+		if (ret)
+			return ret;
+
+		fsleep(300);
+
+		ret = mt6323_auxadc_read(auxadc, chan, val);
+		if (ret)
+			return ret;
+		return IIO_VAL_INT;
+	} else if (mask == IIO_CHAN_INFO_SCALE) {
+		if (chan->channel == MT6323_AUXADC_ISENSE ||
+		    chan->channel == MT6323_AUXADC_BATSNS)
+			mult = 4;
+
+		*val = mult * VOLTAGE_FULL_RANGE;
+		*val2 = AUXADC_PRECISE;
+
+		return IIO_VAL_FRACTIONAL;
+	} else
+		return -EINVAL;
+}
+
+static int mt6323_auxadc_init(struct mt6323_auxadc *auxadc)
+{
+	struct regmap *map = auxadc->regmap;
+	int ret;
+
+	ret = regmap_set_bits(map, MT6323_STRUP_CON10,
+			      AUXADC_RSTB_SW | AUXADC_RSTB_SEL);
+	if (ret)
+		return ret;
+
+	ret = regmap_set_bits(map, MT6323_TOP_CKPDN2, AUXADC_CTL_CK);
+	if (ret)
+		return ret;
+
+	ret = regmap_set_bits(map, MT6323_AUXADC_CON10,
+			      AUXADC_TRIM_CH2 | AUXADC_TRIM_CH4 |
+				      AUXADC_TRIM_CH5 | AUXADC_TRIM_CH6);
+	if (ret)
+		return ret;
+
+	ret = regmap_set_bits(map, MT6323_AUXADC_CON27,
+			      AUXADC_VREF18_ENB_MD | AUXADC_MD_STATUS);
+	if (ret)
+		return ret;
+
+	ret = regmap_set_bits(map, MT6323_AUXADC_CON19, AUXADC_GPS_STATUS);
+	if (ret)
+		return ret;
+
+	ret = regmap_set_bits(map, MT6323_AUXADC_CON26,
+			      AUXADC_VREF18_SELB | AUXADC_DECI_GDLY_SEL);
+	if (ret)
+		return ret;
+
+	ret = regmap_update_bits(map, MT6323_AUXADC_CON9, AUXADC_OSR_MASK,
+				 FIELD_PREP(AUXADC_OSR_MASK,
+					    AUXADC_DEFAULT_OSR));
+	return ret;
+}
+
+static const struct iio_info mt6323_auxadc_iio_info = {
+	.read_raw = mt6323_auxadc_read_raw,
+};
+
+static int mt6323_auxadc_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct mt6323_auxadc *auxadc;
+	struct iio_dev *iio;
+	struct regmap *regmap;
+	int ret;
+
+	regmap = dev_get_regmap(dev->parent->parent, NULL);
+	if (!regmap)
+		return dev_err_probe(dev, -ENODEV, "failed to get regmap\n");
+
+	iio = devm_iio_device_alloc(dev, sizeof(*auxadc));
+	if (!iio)
+		return -ENOMEM;
+
+	auxadc = iio_priv(iio);
+	auxadc->regmap = regmap;
+
+	ret = devm_mutex_init(dev, &auxadc->lock);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to initialize mutex\n");
+
+	ret = mt6323_auxadc_init(auxadc);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to initialize auxadc\n");
+
+	iio->name = "mt6323-auxadc";
+	iio->info = &mt6323_auxadc_iio_info;
+	iio->modes = INDIO_DIRECT_MODE;
+	iio->channels = mt6323_auxadc_channels;
+	iio->num_channels = ARRAY_SIZE(mt6323_auxadc_channels);
+
+	ret = devm_iio_device_register(dev, iio);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to register iio device\n");
+
+	return 0;
+}
+
+static const struct of_device_id mt6323_auxadc_of_match[] = {
+	{ .compatible = "mediatek,mt6323-auxadc" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, mt6323_auxadc_of_match);
+
+static struct platform_driver mt6323_auxadc_driver = {
+	.driver = {
+		.name = "mt6323-auxadc",
+		.of_match_table = mt6323_auxadc_of_match,
+	},
+	.probe	= mt6323_auxadc_probe,
+};
+module_platform_driver(mt6323_auxadc_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("MediaTek MT6323 PMIC AUXADC Driver");

-- 
2.54.0



