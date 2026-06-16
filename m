Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEBB8CD98E1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Jun 2026 14:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AsF52S4DVCRH/8BbA7GHckf/g7Zy/lWl3rGoVF8Athk=; b=uLR4Y+gx+1rymRi3xu3QftW2/z
	5x/UDvcnLDPpMQc4Iw0lyOzoJd27qr7feTkNcUtzfuV+r5DMn/3SeiQkbiM7OxX1TDW4Uk7xL8WIQ
	p9hJIzH+pPnahY7wu9AQ+HXZ0ScWtBtkdESUg/Nq9JlkZz3DnG08cykn/QvqB7GFTbAqj3SAhQbLY
	zZ/45THUgW73iQYoFyM8SXIXUDTPcFKMGotbeI/v09OUssJP5oZtFeClLF+Qg0YQ3Za7jv+gkQSrw
	0VSvnyVVp+yKAd+FJ1PsX0zh80BeN6L3U6pafWrlcn5hpTjh2XyriycfnekiXuvnOiTT/lR8i7H9R
	77yHC4ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZUZr-0000000FtyD-1QVd;
	Tue, 16 Jun 2026 14:15:43 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZUZq-0000000FtxA-0BWj;
	Tue, 16 Jun 2026 14:15:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BC6074374C;
	Tue, 16 Jun 2026 14:15:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9E587C4AF16;
	Tue, 16 Jun 2026 14:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1781619341;
	bh=zUnHunKrdHoxshApGDrk8iSzzzbNBYzio/IrHpjjLnk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=h+O9jL5G3c6DeyY3s5rB7HA88k1cknxF7kv+FuCERja0IB3OjFbBR/UPSbhZ55iMq
	 Os492SW2zS5MpaXblbJVZ3FU/8WhXgj2CfI4+l3Wd5tSGRV//vb0W/7M78Dox1soxy
	 S7EH5t1qSah6GHMFK4YT9BrSKwwJlE0m2gGO1Xsp2B9c1Ub4pjhhaci2iP1k8Tz54q
	 sw985NM4rPOOugDnk2lxNFI8zthy8/mpBX9mjnalBhT2W2qJ8K0zVL/56hE3yGeNPk
	 xfsRxRvecfnyTRHiLBCf9VATQrZ5SKHYdz6u+feaQnz3TGIdgmNm8rq6kvoX+WN7hc
	 ELJ2inY4PKFcg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BA39CD98E4;
	Tue, 16 Jun 2026 14:15:41 +0000 (UTC)
From: Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org>
Date: Tue, 16 Jun 2026 17:15:40 +0300
Subject: [PATCH v3 2/4] iio: adc: mt6323-auxadc: add mt6323 PMIC AUXADC
 driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260616-mt6323-adc-v3-2-1c27c588185d@protonmail.com>
References: <20260616-mt6323-adc-v3-0-1c27c588185d@protonmail.com>
In-Reply-To: <20260616-mt6323-adc-v3-0-1c27c588185d@protonmail.com>
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
 linux-mediatek@lists.infradead.org, Ben Grisdale <bengris32@protonmail.ch>, 
 Roman Vivchar <rva333@protonmail.com>, 
 Andy Shevchenko <andriy.shevchenko@intel.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781619339; l=12020;
 i=rva333@protonmail.com; s=20260510; h=from:subject:message-id;
 bh=6+WTff1Um0TFOK+fZHCYS+scRuk4iZV4iZ6507ecLtg=;
 b=4jetdjo7SwG6KCPpp6rXLH6Enq4ugn7KhFOi9Lp5E/WWONyxLPsk9Gdodwyz/+9kIvlu2R++T
 kU2JFqXUxyVDfPs4oz95ECigC605lkDVEL9vzakRLPxt7Eozd/kCnGd
X-Developer-Key: i=rva333@protonmail.com; a=ed25519;
 pk=zww/nWjBGoQ4POXCG0BV6fx2iuXK6jx77rsKPA5YK5Y=
X-Endpoint-Received: by B4 Relay for rva333@protonmail.com/20260510 with
 auth_id=777
X-Original-From: Roman Vivchar <rva333@protonmail.com>
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
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
---
 MAINTAINERS                     |   1 +
 drivers/iio/adc/Kconfig         |  11 ++
 drivers/iio/adc/Makefile        |   1 +
 drivers/iio/adc/mt6323-auxadc.c | 314 ++++++++++++++++++++++++++++++++++++++++
 4 files changed, 327 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 2551c8cd9e9d..fb40128451dd 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16260,6 +16260,7 @@ MEDIATEK MT6323 PMIC AUXADC DRIVER
 M:	Roman Vivchar <rva333@protonmail.com>
 L:	linux-iio@vger.kernel.org
 S:	Maintained
+F:	drivers/iio/adc/mt6323-auxadc.c
 F:	include/dt-bindings/iio/adc/mediatek,mt6323-auxadc.h
 
 MEDIATEK MT6735 CLOCK & RESET DRIVERS
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
index 000000000000..572466c3f375
--- /dev/null
+++ b/drivers/iio/adc/mt6323-auxadc.c
@@ -0,0 +1,314 @@
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
+#include <linux/regmap.h>
+#include <linux/stringify.h>
+#include <linux/time.h>
+#include <linux/types.h>
+
+#include <linux/mfd/mt6323/registers.h>
+
+#include <dt-bindings/iio/adc/mediatek,mt6323-auxadc.h>
+
+#define AUXADC_STRUP_CON10_RSTB_SEL	BIT(7)
+#define AUXADC_STRUP_CON10_RSTB_SW	BIT(5)
+
+#define AUXADC_TOP_CKPDN2_CTL_CK	BIT(5)
+
+#define AUXADC_TRIM_CH2_MASK		GENMASK(11, 10)
+#define AUXADC_TRIM_CH4_MASK		GENMASK(9, 8)
+#define AUXADC_TRIM_CH5_MASK		GENMASK(5, 4)
+#define AUXADC_TRIM_CH6_MASK		GENMASK(3, 2)
+
+#define AUXADC_CON27_VREF18_ENB_MD	BIT(15)
+#define AUXADC_CON27_MD_STATUS		BIT(0)
+
+#define AUXADC_CON19_GPS_STATUS		BIT(1)
+
+#define AUXADC_CON26_VREF18_SELB	BIT(1)
+#define AUXADC_CON26_DECI_GDLY_SEL	BIT(0)
+
+#define AUXADC_CON11_VBUF_EN		BIT(4)
+
+#define AUXADC_CON19_DECI_GDLY_MASK	GENMASK(15, 14)
+#define AUXADC_ADC19_BUSY_MASK		GENMASK(15, 1)
+#define AUXADC_READY_MASK		BIT(15)
+#define AUXADC_DATA_MASK		GENMASK(14, 0)
+
+#define AUXADC_CON9_OSR_MASK		GENMASK(12, 10)
+#define AUXADC_DEFAULT_OSR		3
+
+#define MTK_PMIC_IIO_CHAN(_name, _chan, _addr)                  \
+{                                                               \
+	.type = IIO_VOLTAGE,                                    \
+	.indexed = 1,                                           \
+	.channel = _chan,                                       \
+	.address = _addr,                                       \
+	.datasheet_name = __stringify(_name),                   \
+	.info_mask_separate = BIT(IIO_CHAN_INFO_RAW) |          \
+			      BIT(IIO_CHAN_INFO_SCALE),         \
+}
+
+/*
+ * AUXADC reports everything in mV, including temperature and
+ * current channels. Channel macros are mapped such that their
+ * ID matches their respective hardware bit position in CON22.
+ */
+static const struct iio_chan_spec mt6323_auxadc_channels[] = {
+	MTK_PMIC_IIO_CHAN(baton2,    MT6323_AUXADC_BATON2,    MT6323_AUXADC_ADC6),
+	MTK_PMIC_IIO_CHAN(ch6,       MT6323_AUXADC_CH6,       MT6323_AUXADC_ADC11),
+	MTK_PMIC_IIO_CHAN(bat_temp,  MT6323_AUXADC_BAT_TEMP,  MT6323_AUXADC_ADC5),
+	MTK_PMIC_IIO_CHAN(chip_temp, MT6323_AUXADC_CHIP_TEMP, MT6323_AUXADC_ADC4),
+	MTK_PMIC_IIO_CHAN(vcdt,      MT6323_AUXADC_VCDT,      MT6323_AUXADC_ADC2),
+	MTK_PMIC_IIO_CHAN(baton1,    MT6323_AUXADC_BATON1,    MT6323_AUXADC_ADC3),
+	MTK_PMIC_IIO_CHAN(isense,    MT6323_AUXADC_ISENSE,    MT6323_AUXADC_ADC1),
+	MTK_PMIC_IIO_CHAN(batsns,    MT6323_AUXADC_BATSNS,    MT6323_AUXADC_ADC0),
+	MTK_PMIC_IIO_CHAN(accdet,    MT6323_AUXADC_ACCDET,    MT6323_AUXADC_ADC7),
+};
+
+/*
+ * The MediaTek MT6323 (as well as a lot of other PMICs) has the following hierarchy:
+ * PMIC AUXADC <- PMIC MFD <- SoC PWRAP (wrapper for PWRAP FSM)
+ *
+ * Therefore, PWRAP regmap should be obtained using dev->parent->parent.
+ */
+struct mt6323_auxadc {
+	struct regmap *regmap;
+	/* AUXADC doesn't support reading multiple channels simultaneously. */
+	struct mutex lock;
+};
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
+	/* The ADC is idle. */
+	if (!(val & AUXADC_CON19_DECI_GDLY_MASK))
+		return 0;
+
+	ret = regmap_read_poll_timeout(map, MT6323_AUXADC_ADC19, val,
+				       !(val & AUXADC_ADC19_BUSY_MASK),
+				       10, 500);
+	if (ret)
+		return ret;
+
+	return regmap_clear_bits(map, MT6323_AUXADC_CON19,
+				 AUXADC_CON19_DECI_GDLY_MASK);
+}
+
+static int mt6323_auxadc_request(struct mt6323_auxadc *auxadc,
+				 unsigned long channel)
+{
+	struct regmap *map = auxadc->regmap;
+	int ret;
+
+	ret = regmap_set_bits(map, MT6323_AUXADC_CON11, AUXADC_CON11_VBUF_EN);
+	if (ret)
+		return ret;
+
+	return regmap_set_bits(map, MT6323_AUXADC_CON22, BIT(channel));
+}
+
+static int mt6323_auxadc_release(struct mt6323_auxadc *auxadc,
+				 unsigned long channel)
+{
+	struct regmap *map = auxadc->regmap;
+	int ret;
+
+	ret = regmap_clear_bits(map, MT6323_AUXADC_CON22, BIT(channel));
+	if (ret)
+		return ret;
+
+	return regmap_clear_bits(map, MT6323_AUXADC_CON11, AUXADC_CON11_VBUF_EN);
+}
+
+static int mt6323_auxadc_read(struct mt6323_auxadc *auxadc,
+			      const struct iio_chan_spec *chan, int *out)
+{
+	struct regmap *map = auxadc->regmap;
+	u32 val;
+	int ret;
+
+	ret = regmap_read_poll_timeout(map, chan->address,
+				       val, (val & AUXADC_READY_MASK),
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
+				  const struct iio_chan_spec *chan,
+				  int *val, int *val2, long mask)
+{
+	struct mt6323_auxadc *auxadc = iio_priv(indio_dev);
+	int ret, mult;
+
+	switch (mask) {
+	case IIO_CHAN_INFO_SCALE:
+		if (chan->channel == MT6323_AUXADC_ISENSE ||
+		    chan->channel == MT6323_AUXADC_BATSNS)
+			mult = 4;
+		else
+			mult = 1;
+
+		/* 1800mV full range with 15-bit resolution. */
+		*val = mult * 1800;
+		*val2 = 15;
+
+		return IIO_VAL_FRACTIONAL_LOG2;
+	case IIO_CHAN_INFO_RAW: {
+		guard(mutex)(&auxadc->lock);
+
+		ret = mt6323_auxadc_prepare_channel(auxadc);
+		if (ret)
+			return ret;
+
+		ret = mt6323_auxadc_request(auxadc, chan->channel);
+		if (ret)
+			return ret;
+
+		/* Hardware limitation: the AUXADC needs a delay to become ready. */
+		fsleep(300);
+
+		ret = mt6323_auxadc_read(auxadc, chan, val);
+
+		if (mt6323_auxadc_release(auxadc, chan->channel))
+			dev_err(&indio_dev->dev,
+				"failed to release channel %d\n", chan->channel);
+
+		if (ret)
+			return ret;
+
+		return IIO_VAL_INT;
+	}
+	default:
+		return -EINVAL;
+	}
+}
+
+static int mt6323_auxadc_init(struct mt6323_auxadc *auxadc)
+{
+	struct regmap *map = auxadc->regmap;
+	int ret;
+
+	ret = regmap_set_bits(map, MT6323_STRUP_CON10,
+			      AUXADC_STRUP_CON10_RSTB_SW |
+			      AUXADC_STRUP_CON10_RSTB_SEL);
+	if (ret)
+		return ret;
+
+	ret = regmap_set_bits(map, MT6323_TOP_CKPDN2, AUXADC_TOP_CKPDN2_CTL_CK);
+	if (ret)
+		return ret;
+
+	ret = regmap_update_bits(map, MT6323_AUXADC_CON10,
+				 AUXADC_TRIM_CH2_MASK | AUXADC_TRIM_CH4_MASK |
+				 AUXADC_TRIM_CH5_MASK | AUXADC_TRIM_CH6_MASK,
+				 FIELD_PREP(AUXADC_TRIM_CH2_MASK, 1) |
+				 FIELD_PREP(AUXADC_TRIM_CH4_MASK, 1) |
+				 FIELD_PREP(AUXADC_TRIM_CH5_MASK, 1) |
+				 FIELD_PREP(AUXADC_TRIM_CH6_MASK, 1));
+	if (ret)
+		return ret;
+
+	ret = regmap_set_bits(map, MT6323_AUXADC_CON27,
+			      AUXADC_CON27_VREF18_ENB_MD |
+			      AUXADC_CON27_MD_STATUS);
+	if (ret)
+		return ret;
+
+	ret = regmap_set_bits(map, MT6323_AUXADC_CON19, AUXADC_CON19_GPS_STATUS);
+	if (ret)
+		return ret;
+
+	ret = regmap_set_bits(map, MT6323_AUXADC_CON26,
+			      AUXADC_CON26_VREF18_SELB |
+			      AUXADC_CON26_DECI_GDLY_SEL);
+	if (ret)
+		return ret;
+
+	return regmap_update_bits(map, MT6323_AUXADC_CON9, AUXADC_CON9_OSR_MASK,
+				  FIELD_PREP(AUXADC_CON9_OSR_MASK, AUXADC_DEFAULT_OSR));
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
+	struct regmap *regmap;
+	struct iio_dev *iio;
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
+		return ret;
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
+	return devm_iio_device_register(dev, iio);
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



