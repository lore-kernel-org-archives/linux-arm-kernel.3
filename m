Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82826C44501
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 08:12:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xKgxKCWrar3l4e+Y6xInmD7AMTeWU1vfBzWTKqdgZ8M=; b=DcyWqwxlcp+1qezgJWSxHAdHPS
	wer3HIfOQyaqFHK7R3Kg6P7KpoRijhMoYloV3L+UH18daBfdAOaShwngDoCmwC/j1LwnnMWgkp8Os
	x3OqqOUscK6d0Fm4FOStfGGrfCg3T8ckojZyOx9Bx57bOG1BCkmwfBfDCSb0+O5AcJZ00XTcneMXL
	RkYSqCvL7iE3gKHTJ3HMnc+By+YDvsEvjWbElaZ7fY8V5dJgnHno3U3d8pSXs8L+Q/lYxJA01chq6
	CfOtKVTzDhRLbwHyTPnSfK0OTTTj7HUGhyj7ww3O9i5Ow1vmQW65GBqbEc4DhetBh21Ulp1k5lWRP
	ZBtj+ROg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjBm4-00000008Xoq-2ouu;
	Mon, 13 Jul 2026 08:12:24 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjBm2-00000008Xo4-0cKr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 08:12:23 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-3811e59df58so1850587a91.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 01:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783930341; x=1784535141; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xKgxKCWrar3l4e+Y6xInmD7AMTeWU1vfBzWTKqdgZ8M=;
        b=BHqGdLdbJpuDHd/v9Gpbv4eqfRBKWZc3VtWg5MUi0LTNK2fQE2u3S3NH9wYvisNV+p
         QAs+vmM2WEjbFWHexOtNoW7YZ1ynt/Y4ueJD8pqJ5KRwSTrqeVCU+sCePgwnhOZjz1YW
         Pp51adfA4K0YpoPxrucIhiTgs1imauyH03NPml2lWm4HPkOrc828FRHkYjyY7K77PPVA
         r/zVeC1ZoTO+OUd2PbomTfOPiZqzgWHRoT3R4CTxURcspvaRMRfJn0h4QLb5fVm+Y3wg
         P+OGg0lpvZ9KhMhbg78Mhla/y9pqsXgxTAR/fGmgGf/qnteiExRP+oDXOOQcA9JmcztU
         zS8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783930341; x=1784535141;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xKgxKCWrar3l4e+Y6xInmD7AMTeWU1vfBzWTKqdgZ8M=;
        b=VARBbgk4pgyVQvg1nHPSDrBe+9cjyBTML2g/7607+odckgZ/VpuvfyXo8O74b3tWc8
         Vao5QqjozP7ZmQDzHvo6mWXrIM2RFEU+G/ZICGlEuMVk97OAOJTDN14wPfgcU1tPn9Ia
         gZRbQ7MB617BzFvaY8vWJ8hu1HZuV5XGszdrrHxs5oLKhayf/RwAOOF1Ke7Vj768VAO+
         DUMtwdaxrhlqi7oMAA3Y+2fmoiyqFN35nn3RQ72NzfSBnwM0xJIKxOsrN0CIY9HnufEa
         Y2OHT44l5oCOO93ugQfftoO/wtG/dO8hQc9Do1mx9Mq11KJxFhmqHoIlix5x3TTtLHRL
         lwdA==
X-Forwarded-Encrypted: i=1; AHgh+RotQ7vApHrmGSRzGTt81ts0jZicQX+EOv7A/y8Mqh0FRCI47s80DLbTvy6jhxZcT0xs1yQxFdMluBW+fMqDH3MH@lists.infradead.org
X-Gm-Message-State: AOJu0YwdZ8w0azgtzItN22hnrF1v+EQfBTy9DV6dty9GDlXXt+BYkdh/
	Ct2UJiucQ3ImPEDhLwKPSxnsz572QbpPyPSmQ9yb9oGGo2rdR9n7r7f+DlzyXg==
X-Gm-Gg: AfdE7cnzxh49j5CPibNdpABpbRPJgMryLW1bFUwvhTiheOOHkxWlSV1Yr4SC9Sd1z0O
	C65b2lOLKZ0BDqhTfcQTSuzc6kN2sHoP71eRGQduiYFcFn+pKsJ0AoYEYvOxQ2POIXD7XOX6BT7
	2XjYzJ1mXVJu4tZb5eDVXilWe3ChS5bW2rWJYeWVxIOfhjyYGfFtkLZv31KN7OZgOT5z8i7bbR9
	1zcwsiIvIiLZLXIslzdUZEsKbVRvYM9wUeKtRbcb3toOXtzlIyfUHxeYgQjq8Xfcv6ZD4D6L2Y/
	m8M+up/wjcYyCKLID+dOGMUherTO/r+SdPm65VNUgHZRaJ/smokTLhRQP21VzfrRW6f/HuCZVzX
	sMh72Tocb8qsQ/QjI1dFnCNuoGDv8b5P9HezWUgLapzFcWsiSJbUQL2FdnoocgvEaAqdPIxhy9g
	qGnRbGiZBVlm4sn+1/F93j4UFo1hzNcjBX9eagbPIBxUAuAnAQxfvtwB/63E/9xDZoFtHYznW3d
	6A=
X-Received: by 2002:a17:90b:510a:b0:36a:c4b:76cf with SMTP id 98e67ed59e1d1-38dc7b37b5emr8139235a91.23.1783930341019;
        Mon, 13 Jul 2026 01:12:21 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e0e033de6sm269636a91.13.2026.07.13.01.12.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 01:12:19 -0700 (PDT)
From: Chi-Wen Weng <cwweng.linux@gmail.com>
To: jic23@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	cwweng@nuvoton.com,
	cwweng.linux@gmail.com
Subject: [PATCH v2 2/2] iio: adc: Add Nuvoton MA35D1 EADC driver
Date: Mon, 13 Jul 2026 16:11:27 +0800
Message-Id: <20260713081127.115197-3-cwweng.linux@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260713081127.115197-1-cwweng.linux@gmail.com>
References: <20260713081127.115197-1-cwweng.linux@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_011222_227678_83C81DBD 
X-CRM114-Status: GOOD (  24.83  )
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

From: Chi-Wen Weng <cwweng@nuvoton.com>

Add an IIO driver for the Nuvoton MA35D1 Enhanced ADC controller.

The driver supports interrupt-driven direct raw reads and triggered
buffered capture paced by an external IIO trigger. Buffered capture is
limited to a single enabled voltage channel per scan in this initial
implementation.

Channels are described by firmware child nodes. Single-ended external
channels and the fixed hardware differential input pairs are supported.
The driver reports IIO scale from either an optional external reference
supply or the internal 1.6 V reference.

The driver also handles the functional clock and optional reset line.
DMA support is not used by this initial driver.

Signed-off-by: Chi-Wen Weng <cwweng@nuvoton.com>
---
 drivers/iio/adc/Kconfig       |  12 +
 drivers/iio/adc/Makefile      |   1 +
 drivers/iio/adc/ma35d1_eadc.c | 740 ++++++++++++++++++++++++++++++++++
 3 files changed, 753 insertions(+)
 create mode 100644 drivers/iio/adc/ma35d1_eadc.c

diff --git a/drivers/iio/adc/Kconfig b/drivers/iio/adc/Kconfig
index 1c663c98c6c9..509118dc5643 100644
--- a/drivers/iio/adc/Kconfig
+++ b/drivers/iio/adc/Kconfig
@@ -981,6 +981,18 @@ config LTC2497
 	  To compile this driver as a module, choose M here: the module will be
 	  called ltc2497.
 
+config MA35D1_EADC
+	tristate "Nuvoton MA35D1 EADC driver"
+	select IIO_BUFFER
+	select IIO_TRIGGERED_BUFFER
+	select REGMAP_MMIO
+	help
+	  Say yes here to build support for the Nuvoton MA35D1
+	  Enhanced Analog to Digital Converter.
+
+	  To compile this driver as a module, choose M here: the module will be
+	  called ma35d1_eadc.
+
 config MAX1027
 	tristate "Maxim max1027 ADC driver"
 	depends on SPI
diff --git a/drivers/iio/adc/Makefile b/drivers/iio/adc/Makefile
index 707dd708912f..7b9b38688223 100644
--- a/drivers/iio/adc/Makefile
+++ b/drivers/iio/adc/Makefile
@@ -85,6 +85,7 @@ obj-$(CONFIG_LTC2471) += ltc2471.o
 obj-$(CONFIG_LTC2485) += ltc2485.o
 obj-$(CONFIG_LTC2496) += ltc2496.o ltc2497-core.o
 obj-$(CONFIG_LTC2497) += ltc2497.o ltc2497-core.o
+obj-$(CONFIG_MA35D1_EADC) += ma35d1_eadc.o
 obj-$(CONFIG_MAX1027) += max1027.o
 obj-$(CONFIG_MAX11100) += max11100.o
 obj-$(CONFIG_MAX1118) += max1118.o
diff --git a/drivers/iio/adc/ma35d1_eadc.c b/drivers/iio/adc/ma35d1_eadc.c
new file mode 100644
index 000000000000..b2733e816c49
--- /dev/null
+++ b/drivers/iio/adc/ma35d1_eadc.c
@@ -0,0 +1,740 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Nuvoton MA35D1 EADC driver
+ *
+ * Copyright (c) 2026 Nuvoton Technology Corp.
+ */
+
+#include <linux/bitfield.h>
+#include <linux/bitmap.h>
+#include <linux/bitops.h>
+#include <linux/cleanup.h>
+#include <linux/clk.h>
+#include <linux/completion.h>
+#include <linux/delay.h>
+#include <linux/err.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/jiffies.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/platform_device.h>
+#include <linux/pm.h>
+#include <linux/property.h>
+#include <linux/regmap.h>
+#include <linux/regulator/consumer.h>
+#include <linux/reset.h>
+#include <linux/types.h>
+
+#include <linux/iio/buffer.h>
+#include <linux/iio/iio.h>
+#include <linux/iio/trigger.h>
+#include <linux/iio/trigger_consumer.h>
+#include <linux/iio/triggered_buffer.h>
+
+#define MA35D1_EADC_DAT(n)		(0x00 + (n) * 0x04)
+#define MA35D1_EADC_CTL			0x50
+#define MA35D1_EADC_SWTRG		0x54
+#define MA35D1_EADC_SCTL(n)		(0x80 + (n) * 0x04)
+#define MA35D1_EADC_INTSRC0		0xd0
+#define MA35D1_EADC_STATUS2		0xf8
+#define MA35D1_EADC_SELSMP0		0x140
+#define MA35D1_EADC_REFADJCTL		0x150
+
+#define MA35D1_EADC_CTL_ADCEN		BIT(0)
+#define MA35D1_EADC_CTL_ADCIEN0		BIT(2)
+#define MA35D1_EADC_CTL_DIFFEN		BIT(8)
+#define MA35D1_EADC_CTL_DMOF		BIT(9)
+#define MA35D1_EADC_CTL_VREFSEL_MASK	GENMASK(11, 10)
+#define MA35D1_EADC_CTL_VREFSEL_1V6	FIELD_PREP(MA35D1_EADC_CTL_VREFSEL_MASK, 0)
+
+#define MA35D1_EADC_SCTL_CHSEL_MASK	GENMASK(3, 0)
+#define MA35D1_EADC_SCTL_TRGSEL_MASK	GENMASK(21, 16)
+
+#define MA35D1_EADC_DAT_RESULT_MASK	GENMASK(15, 0)
+#define MA35D1_EADC_DAT_RESULT_12BIT	GENMASK(11, 0)
+#define MA35D1_EADC_DAT_OV		BIT(16)
+#define MA35D1_EADC_DAT_VALID		BIT(17)
+
+#define MA35D1_EADC_INTSRC0_SPLIEN(n)	BIT(n)
+#define MA35D1_EADC_STATUS2_ADIF0	BIT(0)
+#define MA35D1_EADC_REFADJCTL_PDREF	BIT(0)
+#define MA35D1_EADC_SELSMP0_SMPT0_MASK	GENMASK(1, 0)
+#define MA35D1_EADC_SELSMP_LONG		FIELD_PREP(MA35D1_EADC_SELSMP0_SMPT0_MASK, 3)
+
+#define MA35D1_EADC_MAX_EXT_CHANNELS	8
+#define MA35D1_EADC_INTERNAL_VREF_MV	1600
+#define MA35D1_EADC_TIMEOUT		msecs_to_jiffies(1000)
+#define MA35D1_EADC_RESET_DELAY_US	10
+#define MA35D1_EADC_REF_STABLE_US	1000
+
+struct ma35d1_adc {
+	struct regmap *regmap;
+	struct clk *clk;
+	struct reset_control *rst;
+	struct regulator *vref;
+	struct completion completion;
+	/* Protects conversion state and register accesses from PM transitions. */
+	struct mutex lock;
+	const struct iio_chan_spec *scan_chan;
+	unsigned int vref_mv;
+	int irq;
+	bool suspended;
+};
+
+static const struct regmap_config ma35d1_adc_regmap_config = {
+	.reg_bits = 32,
+	.val_bits = 32,
+	.reg_stride = 4,
+	.max_register = MA35D1_EADC_REFADJCTL,
+};
+
+static bool ma35d1_adc_valid_diff_pair(unsigned int vinp, unsigned int vinn)
+{
+	return (vinp == 0 && vinn == 4) ||
+	       (vinp == 1 && vinn == 5) ||
+	       (vinp == 2 && vinn == 6) ||
+	       (vinp == 3 && vinn == 7);
+}
+
+static int ma35d1_adc_set_bits(struct ma35d1_adc *adc, unsigned int reg,
+			       unsigned int bits)
+{
+	return regmap_set_bits(adc->regmap, reg, bits);
+}
+
+static int ma35d1_adc_clear_bits(struct ma35d1_adc *adc, unsigned int reg,
+				 unsigned int bits)
+{
+	return regmap_clear_bits(adc->regmap, reg, bits);
+}
+
+static int ma35d1_adc_disable_irq(struct ma35d1_adc *adc)
+{
+	return ma35d1_adc_clear_bits(adc, MA35D1_EADC_CTL,
+				     MA35D1_EADC_CTL_ADCIEN0);
+}
+
+static int ma35d1_adc_setup_reference(struct ma35d1_adc *adc)
+{
+	int ret;
+
+	if (adc->vref) {
+		ret = regmap_set_bits(adc->regmap, MA35D1_EADC_REFADJCTL,
+				      MA35D1_EADC_REFADJCTL_PDREF);
+		if (ret)
+			return ret;
+	} else {
+		ret = regmap_clear_bits(adc->regmap, MA35D1_EADC_REFADJCTL,
+					MA35D1_EADC_REFADJCTL_PDREF);
+		if (ret)
+			return ret;
+
+		ret = regmap_update_bits(adc->regmap, MA35D1_EADC_CTL,
+					 MA35D1_EADC_CTL_VREFSEL_MASK,
+					 MA35D1_EADC_CTL_VREFSEL_1V6);
+		if (ret)
+			return ret;
+	}
+
+	fsleep(MA35D1_EADC_REF_STABLE_US);
+
+	return 0;
+}
+
+static int ma35d1_adc_hw_init(struct ma35d1_adc *adc)
+{
+	int ret;
+
+	ret = ma35d1_adc_disable_irq(adc);
+	if (ret)
+		return ret;
+
+	ret = ma35d1_adc_setup_reference(adc);
+	if (ret)
+		return ret;
+
+	ret = regmap_update_bits(adc->regmap, MA35D1_EADC_SELSMP0,
+				 MA35D1_EADC_SELSMP0_SMPT0_MASK,
+				 MA35D1_EADC_SELSMP_LONG);
+	if (ret)
+		return ret;
+
+	ret = regmap_write(adc->regmap, MA35D1_EADC_STATUS2,
+			   MA35D1_EADC_STATUS2_ADIF0);
+	if (ret)
+		return ret;
+
+	return ma35d1_adc_set_bits(adc, MA35D1_EADC_CTL, MA35D1_EADC_CTL_ADCEN);
+}
+
+static int ma35d1_adc_hw_disable(struct ma35d1_adc *adc)
+{
+	int ret;
+
+	ret = ma35d1_adc_disable_irq(adc);
+	if (ret)
+		return ret;
+
+	return ma35d1_adc_clear_bits(adc, MA35D1_EADC_CTL, MA35D1_EADC_CTL_ADCEN);
+}
+
+static void ma35d1_adc_hw_disable_action(void *data)
+{
+	ma35d1_adc_hw_disable(data);
+}
+
+static void ma35d1_adc_vref_disable(void *data)
+{
+	regulator_disable(data);
+}
+
+static int ma35d1_adc_reset(struct ma35d1_adc *adc)
+{
+	int ret;
+
+	if (!adc->rst)
+		return 0;
+
+	ret = reset_control_assert(adc->rst);
+	if (ret)
+		return ret;
+
+	fsleep(MA35D1_EADC_RESET_DELAY_US);
+
+	return reset_control_deassert(adc->rst);
+}
+
+static int ma35d1_adc_config_channel(struct ma35d1_adc *adc,
+				     const struct iio_chan_spec *chan)
+{
+	unsigned int ctl;
+	int ret;
+
+	ctl = chan->differential ? MA35D1_EADC_CTL_DIFFEN |
+					  MA35D1_EADC_CTL_DMOF : 0;
+
+	ret = regmap_update_bits(adc->regmap, MA35D1_EADC_CTL,
+				 MA35D1_EADC_CTL_DIFFEN |
+				 MA35D1_EADC_CTL_DMOF, ctl);
+	if (ret)
+		return ret;
+
+	ret = regmap_update_bits(adc->regmap, MA35D1_EADC_SCTL(0),
+				 MA35D1_EADC_SCTL_CHSEL_MASK |
+				 MA35D1_EADC_SCTL_TRGSEL_MASK,
+				 FIELD_PREP(MA35D1_EADC_SCTL_CHSEL_MASK,
+					    chan->channel));
+	if (ret)
+		return ret;
+
+	return regmap_update_bits(adc->regmap, MA35D1_EADC_INTSRC0,
+				  MA35D1_EADC_INTSRC0_SPLIEN(0),
+				  MA35D1_EADC_INTSRC0_SPLIEN(0));
+}
+
+static int ma35d1_adc_read_conversion(struct ma35d1_adc *adc,
+				      const struct iio_chan_spec *chan, u16 *raw)
+{
+	unsigned int val;
+	long timeout;
+	int ret;
+
+	reinit_completion(&adc->completion);
+
+	ret = regmap_write(adc->regmap, MA35D1_EADC_STATUS2,
+			   MA35D1_EADC_STATUS2_ADIF0);
+	if (ret)
+		return ret;
+
+	ret = ma35d1_adc_config_channel(adc, chan);
+	if (ret)
+		return ret;
+
+	ret = ma35d1_adc_set_bits(adc, MA35D1_EADC_CTL, MA35D1_EADC_CTL_ADCIEN0);
+	if (ret)
+		return ret;
+
+	ret = regmap_write(adc->regmap, MA35D1_EADC_SWTRG, BIT(0));
+	if (ret)
+		goto disable_irq;
+
+	timeout = wait_for_completion_timeout(&adc->completion,
+					      MA35D1_EADC_TIMEOUT);
+
+	ret = ma35d1_adc_disable_irq(adc);
+	if (ret)
+		return ret;
+
+	if (!timeout)
+		return -ETIMEDOUT;
+
+	ret = regmap_read(adc->regmap, MA35D1_EADC_DAT(0), &val);
+	if (ret)
+		return ret;
+
+	if (!(val & MA35D1_EADC_DAT_VALID))
+		return -EIO;
+
+	if (val & MA35D1_EADC_DAT_OV)
+		return -EOVERFLOW;
+
+	*raw = FIELD_GET(MA35D1_EADC_DAT_RESULT_MASK, val);
+
+	return 0;
+
+disable_irq:
+	ma35d1_adc_disable_irq(adc);
+
+	return ret;
+}
+
+static irqreturn_t ma35d1_adc_isr(int irq, void *data)
+{
+	struct iio_dev *indio_dev = data;
+	struct ma35d1_adc *adc = iio_priv(indio_dev);
+	unsigned int status;
+	int ret;
+
+	ret = regmap_read(adc->regmap, MA35D1_EADC_STATUS2, &status);
+	if (ret || !(status & MA35D1_EADC_STATUS2_ADIF0))
+		return IRQ_NONE;
+
+	regmap_write(adc->regmap, MA35D1_EADC_STATUS2,
+		     MA35D1_EADC_STATUS2_ADIF0);
+	complete(&adc->completion);
+
+	return IRQ_HANDLED;
+}
+
+static int ma35d1_adc_sign_extend(u16 raw)
+{
+	return sign_extend32(raw & MA35D1_EADC_DAT_RESULT_12BIT, 11);
+}
+
+static int ma35d1_adc_read_raw(struct iio_dev *indio_dev,
+			       const struct iio_chan_spec *chan,
+			       int *val, int *val2, long mask)
+{
+	struct ma35d1_adc *adc = iio_priv(indio_dev);
+	u16 raw;
+	int ret;
+
+	switch (mask) {
+	case IIO_CHAN_INFO_RAW: {
+		IIO_DEV_ACQUIRE_DIRECT_MODE(indio_dev, claim);
+
+		if (IIO_DEV_ACQUIRE_FAILED(claim))
+			return -EBUSY;
+
+		guard(mutex)(&adc->lock);
+		if (adc->suspended)
+			return -EBUSY;
+
+		ret = ma35d1_adc_read_conversion(adc, chan, &raw);
+		if (ret)
+			return ret;
+
+		if (chan->differential)
+			*val = ma35d1_adc_sign_extend(raw);
+		else
+			*val = raw & MA35D1_EADC_DAT_RESULT_12BIT;
+
+		return IIO_VAL_INT;
+	}
+	case IIO_CHAN_INFO_SCALE:
+		*val = adc->vref_mv;
+		*val2 = chan->differential ? 11 : 12;
+		return IIO_VAL_FRACTIONAL_LOG2;
+	default:
+		return -EINVAL;
+	}
+}
+
+static int ma35d1_adc_update_scan_mode(struct iio_dev *indio_dev,
+				       const unsigned long *scan_mask)
+{
+	struct ma35d1_adc *adc = iio_priv(indio_dev);
+	const struct iio_chan_spec *scan_chan = NULL;
+	unsigned long bit;
+	unsigned int count;
+
+	count = 0;
+	for_each_set_bit(bit, scan_mask, indio_dev->masklength) {
+		scan_chan = &indio_dev->channels[bit];
+		count++;
+	}
+
+	if (count != 1 || scan_chan->type != IIO_VOLTAGE)
+		return -EINVAL;
+
+	adc->scan_chan = scan_chan;
+
+	return 0;
+}
+
+static int ma35d1_adc_buffer_postenable(struct iio_dev *indio_dev)
+{
+	struct ma35d1_adc *adc = iio_priv(indio_dev);
+
+	guard(mutex)(&adc->lock);
+
+	if (adc->suspended)
+		return -EBUSY;
+
+	return adc->scan_chan ? 0 : -EINVAL;
+}
+
+static int ma35d1_adc_buffer_predisable(struct iio_dev *indio_dev)
+{
+	struct ma35d1_adc *adc = iio_priv(indio_dev);
+	int ret;
+
+	guard(mutex)(&adc->lock);
+
+	ret = ma35d1_adc_disable_irq(adc);
+	if (ret)
+		return ret;
+
+	return regmap_write(adc->regmap, MA35D1_EADC_STATUS2,
+			    MA35D1_EADC_STATUS2_ADIF0);
+}
+
+static irqreturn_t ma35d1_adc_trigger_handler(int irq, void *p)
+{
+	struct iio_poll_func *pf = p;
+	struct iio_dev *indio_dev = pf->indio_dev;
+	struct ma35d1_adc *adc = iio_priv(indio_dev);
+	IIO_DECLARE_BUFFER_WITH_TS(u16, scan, 1) = { };
+	u16 raw;
+	int ret;
+
+	guard(mutex)(&adc->lock);
+	if (adc->suspended || !adc->scan_chan)
+		goto done;
+
+	ret = ma35d1_adc_read_conversion(adc, adc->scan_chan, &raw);
+	if (ret)
+		goto done;
+
+	scan[0] = raw & MA35D1_EADC_DAT_RESULT_12BIT;
+	iio_push_to_buffers_with_timestamp(indio_dev, scan, pf->timestamp);
+
+done:
+	iio_trigger_notify_done(indio_dev->trig);
+
+	return IRQ_HANDLED;
+}
+
+static const struct iio_buffer_setup_ops ma35d1_adc_buffer_ops = {
+	.postenable = ma35d1_adc_buffer_postenable,
+	.predisable = ma35d1_adc_buffer_predisable,
+};
+
+static const struct iio_info ma35d1_adc_info = {
+	.read_raw = ma35d1_adc_read_raw,
+	.update_scan_mode = ma35d1_adc_update_scan_mode,
+};
+
+static void ma35d1_adc_init_channel(struct iio_chan_spec *chan, u32 vinp,
+				    u32 vinn, unsigned int scan_index,
+				    bool differential)
+{
+	chan->type = IIO_VOLTAGE;
+	chan->indexed = 1;
+	chan->channel = vinp;
+	chan->scan_index = scan_index;
+	chan->info_mask_separate = BIT(IIO_CHAN_INFO_RAW) |
+					 BIT(IIO_CHAN_INFO_SCALE);
+	chan->scan_type.format = differential ? IIO_SCAN_FORMAT_SIGNED_INT :
+					      IIO_SCAN_FORMAT_UNSIGNED_INT;
+	chan->scan_type.realbits = 12;
+	chan->scan_type.storagebits = 16;
+	chan->scan_type.endianness = IIO_CPU;
+
+	if (differential) {
+		chan->differential = 1;
+		chan->channel2 = vinn;
+	}
+}
+
+static struct iio_chan_spec
+ma35d1_adc_timestamp_channel(unsigned int scan_index)
+{
+	struct iio_chan_spec chan = IIO_CHAN_SOFT_TIMESTAMP(scan_index);
+
+	return chan;
+}
+
+static int ma35d1_adc_parse_channels(struct iio_dev *indio_dev,
+				     struct device *dev)
+{
+	DECLARE_BITMAP(used_channels, MA35D1_EADC_MAX_EXT_CHANNELS);
+	struct iio_chan_spec *channels;
+	unsigned int scan_index;
+	int num_channels;
+	int ret;
+
+	bitmap_zero(used_channels, MA35D1_EADC_MAX_EXT_CHANNELS);
+
+	num_channels = device_get_child_node_count(dev);
+	if (!num_channels)
+		return dev_err_probe(dev, -ENODATA,
+				     "no ADC channels configured\n");
+
+	if (num_channels > MA35D1_EADC_MAX_EXT_CHANNELS)
+		return dev_err_probe(dev, -EINVAL, "too many ADC channels\n");
+
+	channels = devm_kcalloc(dev, num_channels + 1, sizeof(*channels), GFP_KERNEL);
+	if (!channels)
+		return -ENOMEM;
+
+	scan_index = 0;
+	device_for_each_child_node_scoped(dev, child) {
+		u32 diff[2];
+		u32 reg;
+		u32 vinn;
+		bool differential;
+
+		ret = fwnode_property_read_u32(child, "reg", &reg);
+		if (ret)
+			return dev_err_probe(dev, ret,
+					     "missing channel reg property\n");
+
+		if (reg >= MA35D1_EADC_MAX_EXT_CHANNELS)
+			return dev_err_probe(dev, -EINVAL,
+					     "invalid ADC channel %u\n", reg);
+
+		if (test_and_set_bit(reg, used_channels))
+			return dev_err_probe(dev, -EINVAL,
+					     "duplicate ADC channel %u\n", reg);
+
+		differential = false;
+		vinn = 0;
+		if (fwnode_property_present(child, "diff-channels")) {
+			ret = fwnode_property_read_u32_array(child, "diff-channels", diff,
+							     ARRAY_SIZE(diff));
+			if (ret)
+				return dev_err_probe(dev, ret,
+						     "invalid diff-channels for channel %u\n",
+						     reg);
+
+			if (diff[0] != reg ||
+			    !ma35d1_adc_valid_diff_pair(diff[0], diff[1]))
+				return dev_err_probe(dev, -EINVAL,
+						     "invalid differential ADC channel %u-%u\n",
+						     diff[0], diff[1]);
+
+			if (test_and_set_bit(diff[1], used_channels))
+				return dev_err_probe(dev, -EINVAL,
+						     "ADC channel %u already used\n",
+						     diff[1]);
+
+			vinn = diff[1];
+			differential = true;
+		}
+
+		ma35d1_adc_init_channel(&channels[scan_index], reg, vinn,
+					scan_index, differential);
+		scan_index++;
+	}
+
+	channels[scan_index] = ma35d1_adc_timestamp_channel(scan_index);
+
+	indio_dev->channels = channels;
+	indio_dev->num_channels = scan_index + 1;
+	indio_dev->masklength = indio_dev->num_channels;
+
+	return 0;
+}
+
+static int ma35d1_adc_init_vref(struct ma35d1_adc *adc, struct device *dev)
+{
+	int ret;
+
+	adc->vref = devm_regulator_get_optional(dev, "vref");
+	if (IS_ERR(adc->vref)) {
+		if (PTR_ERR(adc->vref) != -ENODEV)
+			return dev_err_probe(dev, PTR_ERR(adc->vref),
+					     "failed to get VREF supply\n");
+
+		adc->vref = NULL;
+		adc->vref_mv = MA35D1_EADC_INTERNAL_VREF_MV;
+
+		return 0;
+	}
+
+	ret = regulator_enable(adc->vref);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to enable VREF supply\n");
+
+	ret = devm_add_action_or_reset(dev, ma35d1_adc_vref_disable, adc->vref);
+	if (ret)
+		return ret;
+
+	ret = regulator_get_voltage(adc->vref);
+	if (ret <= 0)
+		return dev_err_probe(dev, ret ?: -EINVAL,
+				     "failed to get VREF voltage\n");
+
+	adc->vref_mv = ret / 1000;
+
+	return 0;
+}
+
+static int ma35d1_adc_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct iio_dev *indio_dev;
+	struct ma35d1_adc *adc;
+	void __iomem *regs;
+	int irq;
+	int ret;
+
+	indio_dev = devm_iio_device_alloc(dev, sizeof(*adc));
+	if (!indio_dev)
+		return -ENOMEM;
+
+	adc = iio_priv(indio_dev);
+	init_completion(&adc->completion);
+
+	ret = devm_mutex_init(dev, &adc->lock);
+	if (ret)
+		return ret;
+
+	regs = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(regs))
+		return dev_err_probe(dev, PTR_ERR(regs),
+				     "failed to map registers\n");
+
+	adc->regmap = devm_regmap_init_mmio(dev, regs, &ma35d1_adc_regmap_config);
+	if (IS_ERR(adc->regmap))
+		return dev_err_probe(dev, PTR_ERR(adc->regmap),
+				     "failed to initialize regmap\n");
+
+	adc->clk = devm_clk_get_enabled(dev, NULL);
+	if (IS_ERR(adc->clk))
+		return dev_err_probe(dev, PTR_ERR(adc->clk),
+				     "failed to get and enable ADC clock\n");
+
+	adc->rst = devm_reset_control_get_optional_exclusive(dev, NULL);
+	if (IS_ERR(adc->rst))
+		return dev_err_probe(dev, PTR_ERR(adc->rst),
+				     "failed to get reset control\n");
+
+	ret = ma35d1_adc_reset(adc);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to reset ADC\n");
+
+	ret = ma35d1_adc_init_vref(adc, dev);
+	if (ret)
+		return ret;
+
+	indio_dev->name = "ma35d1-eadc";
+	indio_dev->modes = INDIO_DIRECT_MODE;
+	indio_dev->info = &ma35d1_adc_info;
+
+	ret = ma35d1_adc_parse_channels(indio_dev, dev);
+	if (ret)
+		return ret;
+
+	ret = ma35d1_adc_hw_init(adc);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to initialize ADC\n");
+
+	ret = devm_add_action_or_reset(dev, ma35d1_adc_hw_disable_action, adc);
+	if (ret)
+		return ret;
+
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0)
+		return irq;
+
+	adc->irq = irq;
+	ret = devm_request_irq(dev, irq, ma35d1_adc_isr, 0, dev_name(dev),
+			       indio_dev);
+	if (ret)
+		return ret;
+
+	ret = devm_iio_triggered_buffer_setup(dev, indio_dev,
+					      iio_pollfunc_store_time,
+					      ma35d1_adc_trigger_handler,
+					      &ma35d1_adc_buffer_ops);
+	if (ret)
+		return ret;
+
+	platform_set_drvdata(pdev, indio_dev);
+
+	return devm_iio_device_register(dev, indio_dev);
+}
+
+static int ma35d1_adc_suspend(struct device *dev)
+{
+	struct iio_dev *indio_dev = dev_get_drvdata(dev);
+	struct ma35d1_adc *adc = iio_priv(indio_dev);
+	int ret;
+
+	guard(mutex)(&adc->lock);
+
+	ret = ma35d1_adc_disable_irq(adc);
+	if (ret)
+		return ret;
+
+	synchronize_irq(adc->irq);
+
+	ret = ma35d1_adc_hw_disable(adc);
+	if (ret)
+		return ret;
+
+	clk_disable_unprepare(adc->clk);
+	adc->suspended = true;
+
+	return 0;
+}
+
+static int ma35d1_adc_resume(struct device *dev)
+{
+	struct iio_dev *indio_dev = dev_get_drvdata(dev);
+	struct ma35d1_adc *adc = iio_priv(indio_dev);
+	int ret;
+
+	guard(mutex)(&adc->lock);
+
+	ret = clk_prepare_enable(adc->clk);
+	if (ret)
+		return ret;
+
+	ret = ma35d1_adc_hw_init(adc);
+	if (ret) {
+		clk_disable_unprepare(adc->clk);
+		return ret;
+	}
+
+	adc->suspended = false;
+
+	return 0;
+}
+
+static DEFINE_SIMPLE_DEV_PM_OPS(ma35d1_adc_pm_ops,
+				ma35d1_adc_suspend, ma35d1_adc_resume);
+
+static const struct of_device_id ma35d1_adc_of_match[] = {
+	{ .compatible = "nuvoton,ma35d1-eadc" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, ma35d1_adc_of_match);
+
+static struct platform_driver ma35d1_adc_driver = {
+	.probe = ma35d1_adc_probe,
+	.driver = {
+		.name = "ma35d1-eadc",
+		.of_match_table = ma35d1_adc_of_match,
+		.pm = pm_sleep_ptr(&ma35d1_adc_pm_ops),
+	},
+};
+module_platform_driver(ma35d1_adc_driver);
+
+MODULE_AUTHOR("Chi-Wen Weng <cwweng@nuvoton.com>");
+MODULE_DESCRIPTION("Nuvoton MA35D1 EADC driver");
+MODULE_LICENSE("GPL");
-- 
2.25.1


