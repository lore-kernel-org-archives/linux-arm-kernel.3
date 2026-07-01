Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5D70C43602
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 14:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9N6CtO1bgehmWwTTgyUu2bc11wWbYbsQZEik4Yom5Vg=; b=ETi7rzG8srR6Mq/C3RD849NVCj
	aZB7R0FgjP/5Qrkkd1f4jVjlX7nOqlMsUOxfZoP4r2IlOg38arz9rLLHH7hKutvqyJY1ym+qGcuM0
	p9gyxPAKGLI4EBk9YQjbt+sj6o56+xWFt5vne75Wc4EuIBr0mLP4WtldEnUn9zBkYf6EoWamFsTgf
	S/7W178CSYizwuD1I+62Qsjjniq1st/8gYhXt/xAKBKrSq7gi3UreWZlEnNF6EBCOGaRgNGG/240s
	SsVNwr+kIHtwGClglz4HFoMAxw5Gs0/LsA3AEq37ZW86n3lcNB3HMU7pXE4Vvlcbdd2AOXlb2cKa6
	5UGipHiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wevks-00000002GKO-2D7x;
	Wed, 01 Jul 2026 14:17:34 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wevkp-00000002GJI-0nHv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 14:17:33 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-493b966dd74so3036105e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Jul 2026 07:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782915449; x=1783520249; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9N6CtO1bgehmWwTTgyUu2bc11wWbYbsQZEik4Yom5Vg=;
        b=NFNP2Jl22+GdCLMCVFqwleBtrFOPxRt7WldTzZUn5RZ1yNy4rIqffXYRaTCguQ/edB
         Ex+t6WH2wHjd8oaPr1ZoAfRT0HdhAWtXUnmsY+4ReFJZE3MAxjzwnmRWe093h8sJNDVQ
         wGW7G81Fjyuj49Vc4WFaBDWeu9mm9ItZTF4rNdWkm+5x/6jL/qQArvmqsbHVysE3RQBl
         oXsrVQHt4ij224NCO3HFAOZh2GvlwdfbyxsDSOVqm8RFMJ8ZIyejv8PCjZDujOh60fPK
         ds1D2EVUDFiooSpMmI57x29jmmudSDuixMk9Jfcfp/D+4Cco/ceWpsUhp4Q2MVXC29iC
         1h/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782915449; x=1783520249;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9N6CtO1bgehmWwTTgyUu2bc11wWbYbsQZEik4Yom5Vg=;
        b=k06EN/740+O0MuKl6iNPZ7L9WvPL1oJj87NrhXI02NZaQLZdp7bkrD0aceACBDCe4C
         wkgbbRk1AFuptx9CbhGo05snk7DIUKcnb8/8H8C31flDk+0Rs3qZt6Vo4HCYpWU3sP6Q
         Pu9nbVsYKIoHK+FyxfuQShogkz/vj+GJNvqdw6xEbJuYVOwmKNelwltTjcfqWRtjeoEj
         c3DdChuAb8axiQizq9AXARFDOf0De7nmPY32qPP7Qb+pGSrJIkfslcjeaYx9ZJWJovrs
         q9FlMptmTRAdGC/Qg47j/Sq/2M7/e2hkIS5ySlStZy0OmVUiMk/C3D8hUrnhQND2jdak
         WPVQ==
X-Forwarded-Encrypted: i=1; AFNElJ+cghwOmVk1Lktbrck9Jb6SeyFbyXg3zs+mFqVECpgqJxNoremzLzxlU+usRwtixNSBFpBAXTArze0PgkosP7+2@lists.infradead.org
X-Gm-Message-State: AOJu0YzTR1YO89NbUPE2uGbjUUhAvaJPgbzfKS3hu48w0pISgPg58hXO
	CIa8BxbdL4O0AbqS7FGAbOcX3QDqKkfJfO8u8eV2gH/650N7tPYTcvRX7yUkZo4iQgn40s9UgOs
	pKMtt
X-Gm-Gg: AfdE7ckxqsgLo8Sg6fnZMy8xO5wlclk2Bb31e/Qfw8I5Kf0oMlqK21ttw+AzpHd1K70
	1qsVu8gAMl0pgDfnmrRNbVSTHZ7xJ55ovKImM23rrancYP44LA1B4cQHkflwwoOn+Jhl3OoMxEO
	lfrthHzpVNYaTwcrESFDdriAHkRqZIPcV8bspPy8sEtc1JRyqzTcnHEfGQLK18Cbb2OwD1MOIhg
	Qfx7rtKjBzWDOEehQ1khovDWgTshDPNnVJOqmM1ch703K61TSO06QwGz8ks/hpeQ36Ztd1z+rTq
	Mzfi6q69CMiDbPqjt2loN3D3xEiP+IcGcu8tySAMIHyWVJdqwWeYeqhoV1F3bLLQ8oH1hyWIKKP
	J00V+wQhRkhkfEM7Q4Rv4DOJKzEoLrKdNZfVbfssGJp2k8hvrJ1CTLYnZ30GnbpV/jpZKns5R4o
	PYpzhytjjDTgDLeO7BxU7I+GnbqOlt1cjR8nu72E5PqzR3YF9MKUOA
X-Received: by 2002:a05:600c:190a:b0:493:c068:db11 with SMTP id 5b1f17b1804b1-493c2b94615mr28255625e9.26.1782915448853;
        Wed, 01 Jul 2026 07:17:28 -0700 (PDT)
Received: from [192.168.0.2] (host93-7-32-195.dimensionesrl.eu. [195.32.7.93])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493be81df2asm152552155e9.12.2026.07.01.07.17.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 07:17:28 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Date: Wed, 01 Jul 2026 16:17:23 +0200
Subject: [PATCH v7 1/2] iio: dac: add mcf54415 DAC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-wip-stmark2-dac-v7-1-ff8fdcc8010a@baylibre.com>
References: <20260701-wip-stmark2-dac-v7-0-ff8fdcc8010a@baylibre.com>
In-Reply-To: <20260701-wip-stmark2-dac-v7-0-ff8fdcc8010a@baylibre.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, 
 linux-m68k@lists.linux-m68k.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, 
 Angelo Dureghello <adureghello@baylibre.com>, 
 Andy Shevchenko <andriy.shevchenko@intel.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_071731_305348_3273F96B 
X-CRM114-Status: GOOD (  29.39  )
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

From: Angelo Dureghello <adureghello@baylibre.com>

Add basic version of mcf54415 DAC driver. DAC is embedded in the SoC and
DAC configuration registers are mapped in the internal IO address space.

The DAC accepts a 12-bit digital signal and creates a monotonic 12-bit
analog output varying from DAC_VREFL to DAC_VREFH. The DAC module
consists of a conversion unit, an output amplifier, and the associated
digital control blocks. Default register values for DAC_VREFL and DAC_VREFH
are respectively 0 and 0xfff, left untouched in this initial version.

This initial version of the driver is minimalistic, "output raw" only, to
be extended in the future. DMA and external sync are disabled, default mode
is high speed, default format is right-justified 12-bit on 16-bit word.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>
---
Changes in v2:
- remove tests from commit message, moved to patch 0
- remove additional blank lines
- remove dead code and unused definitions
- use regmap
- add limit check on raw write
- non functional style fixes
- add COMPILE_TEST to Kconfig
Changes in v3:
- add comments where needed
- code style changes
- remove unneeded variables
- use regmap_set_bits where possible
- remove macro not needed to define a single channel
- set up regmap to big_endian accesses for next patches that will come,
  that will adjust ColdFire readx/writex as standard LE (links in 0/x).
- add return value check on regmap calls
- sashiko: remove unneeded .io_port from regmap init.
- sashiko: add select REGMAP_MMIO in Kconfig
Changes in v4:
- remove unused includes
- sashiko: return "ret" as regmap_read ret value in case of error
- sashiko: using u32 as regmap_read value
- use local variable in mcf54415_dac_init() for better readability
- sashiko: check mcf54415_dac_init return value also in resume()
Changes in v5:
- commit syntax fixes
- minor code style fixes
- use include <linux/type.h>
- removed unneeded cast
- disable clock in case of DAC init error
- use unsigned int for regmap_read and GENMASK for masking 12 bits
- add id table to match "mcfdac" platform device name
Changes in v6:
- removed pm ops, can't be tested for mcf54415 with mmu enabled
- Kconfig desc line rewrap
- minor coding style fixes
Changes in v7:
- remove unused includes
- remove unneeded call to platform_set_drvdata()
---
 drivers/iio/dac/Kconfig        |  11 +++
 drivers/iio/dac/Makefile       |   1 +
 drivers/iio/dac/mcf54415_dac.c | 180 +++++++++++++++++++++++++++++++++++++++++
 3 files changed, 192 insertions(+)

diff --git a/drivers/iio/dac/Kconfig b/drivers/iio/dac/Kconfig
index 657c68e75542..ebf7144f922a 100644
--- a/drivers/iio/dac/Kconfig
+++ b/drivers/iio/dac/Kconfig
@@ -527,6 +527,17 @@ config MAX5821
 	  Say yes here to build support for Maxim MAX5821
 	  10 bits DAC.
 
+config MCF54415_DAC
+	tristate "NXP MCF54415 DAC driver"
+	depends on M5441x || COMPILE_TEST
+	select REGMAP_MMIO
+	help
+	  Say yes here if you want to build support for NXP ColdFire
+	  MCF54415/6/7/8 12-bit DAC module.
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called mcf54415_dac.
+
 config MCP4725
 	tristate "MCP4725/6 DAC driver"
 	depends on I2C
diff --git a/drivers/iio/dac/Makefile b/drivers/iio/dac/Makefile
index 003431798498..5d20d37e44ce 100644
--- a/drivers/iio/dac/Makefile
+++ b/drivers/iio/dac/Makefile
@@ -52,6 +52,7 @@ obj-$(CONFIG_MAX517) += max517.o
 obj-$(CONFIG_MAX22007) += max22007.o
 obj-$(CONFIG_MAX5522) += max5522.o
 obj-$(CONFIG_MAX5821) += max5821.o
+obj-$(CONFIG_MCF54415_DAC) += mcf54415_dac.o
 obj-$(CONFIG_MCP4725) += mcp4725.o
 obj-$(CONFIG_MCP4728) += mcp4728.o
 obj-$(CONFIG_MCP47FEB02) += mcp47feb02.o
diff --git a/drivers/iio/dac/mcf54415_dac.c b/drivers/iio/dac/mcf54415_dac.c
new file mode 100644
index 000000000000..e2c12241a534
--- /dev/null
+++ b/drivers/iio/dac/mcf54415_dac.c
@@ -0,0 +1,180 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * NXP mcf54415 DAC driver
+ *
+ * Copyright 2026 BayLibre - adureghello@baylibre.com
+ */
+
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/err.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/types.h>
+
+#include <linux/iio/iio.h>
+
+#define MCF54415_DAC_CR			0x00
+#define MCF54415_DAC_CR_PDN		BIT(0)
+#define MCF54415_DAC_CR_HSLS		BIT(6)
+#define MCF54415_DAC_CR_WMLVL		GENMASK(9, 8)
+#define MCF54415_DAC_CR_FILT		BIT(12)
+
+#define MCF54415_DAC_DATA		0x02
+
+struct mcf54415_dac {
+	struct regmap *map;
+	struct clk *clk;
+};
+
+static const struct regmap_config mcf54415_dac_regmap_config = {
+	.reg_bits = 16,
+	.reg_stride = 2,
+	.val_bits = 16,
+	.max_register = 0x0c, /* DACX_FILTCNT,  R.M. Table 30-2 */
+	.val_format_endian = REGMAP_ENDIAN_BIG,
+	.reg_format_endian = REGMAP_ENDIAN_BIG,
+};
+
+static int mcf54415_dac_init(struct mcf54415_dac *info)
+{
+	u16 val = MCF54415_DAC_CR_FILT | FIELD_PREP(MCF54415_DAC_CR_WMLVL, 1);
+	int ret;
+
+	/* Fixed defaults and enable DAC (bit 0 set to 0) */
+	ret = regmap_write(info->map, MCF54415_DAC_CR, val);
+	if (ret)
+		return ret;
+
+	/* DAC is ready after 12us, from RM table 40-3  */
+	fsleep(12);
+
+	return 0;
+}
+
+static void mcf54415_dac_exit(void *data)
+{
+	struct mcf54415_dac *info = data;
+
+	regmap_set_bits(info->map, MCF54415_DAC_CR, MCF54415_DAC_CR_PDN);
+}
+
+static const struct iio_chan_spec mcf54415_dac_iio_channel = {
+	.type = IIO_VOLTAGE,
+	.output = 1,
+	.info_mask_separate = BIT(IIO_CHAN_INFO_RAW),
+	.info_mask_shared_by_type = BIT(IIO_CHAN_INFO_SCALE),
+};
+
+static int mcf54415_read_raw(struct iio_dev *indio_dev,
+			     struct iio_chan_spec const *chan,
+			     int *val, int *val2, long mask)
+{
+	struct mcf54415_dac *info = iio_priv(indio_dev);
+	unsigned int reg;
+	int ret;
+
+	switch (mask) {
+	case IIO_CHAN_INFO_RAW:
+		ret = regmap_read(info->map, MCF54415_DAC_DATA, &reg);
+		if (ret)
+			return ret;
+		*val = reg & GENMASK(11, 0);
+		return IIO_VAL_INT;
+	case IIO_CHAN_INFO_SCALE:
+		/* Reference voltage as per ColdFire datasheet is 3.3V */
+		*val = 3300 /* mV */;
+		*val2 = 12;
+		return IIO_VAL_FRACTIONAL_LOG2;
+	default:
+		return -EINVAL;
+	}
+}
+
+static int mcf54415_write_raw(struct iio_dev *indio_dev,
+			      struct iio_chan_spec const *chan,
+			      int val, int val2, long mask)
+{
+	struct mcf54415_dac *info = iio_priv(indio_dev);
+
+	switch (mask) {
+	case IIO_CHAN_INFO_RAW:
+		/* Check based on RM 30.3.2 (DACn_DATA) reg. resolution */
+		if (val < 0 || val > 4095)
+			return -EINVAL;
+		return regmap_write(info->map, MCF54415_DAC_DATA, val);
+	default:
+		return -EINVAL;
+	}
+}
+
+static const struct iio_info mcf54415_dac_iio_info = {
+	.read_raw = &mcf54415_read_raw,
+	.write_raw = &mcf54415_write_raw,
+};
+
+static int mcf54415_dac_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct iio_dev *indio_dev;
+	struct mcf54415_dac *info;
+	void __iomem *regs;
+	int ret;
+
+	indio_dev = devm_iio_device_alloc(dev, sizeof(*info));
+	if (!indio_dev)
+		return -ENOMEM;
+
+	info = iio_priv(indio_dev);
+
+	regs = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(regs))
+		return dev_err_probe(dev, PTR_ERR(regs), "failed to get io regs\n");
+
+	info->map = devm_regmap_init_mmio(dev, regs, &mcf54415_dac_regmap_config);
+	if (IS_ERR(info->map))
+		return PTR_ERR(info->map);
+
+	info->clk = devm_clk_get_enabled(dev, "dac");
+	if (IS_ERR(info->clk))
+		return dev_err_probe(dev, PTR_ERR(info->clk), "failed getting clock\n");
+
+	indio_dev->name = "mcf54415";
+	indio_dev->info = &mcf54415_dac_iio_info;
+	indio_dev->modes = INDIO_DIRECT_MODE;
+	indio_dev->channels = &mcf54415_dac_iio_channel;
+	indio_dev->num_channels = 1;
+
+	ret = mcf54415_dac_init(info);
+	if (ret)
+		return ret;
+
+	ret = devm_add_action_or_reset(dev, mcf54415_dac_exit, info);
+	if (ret)
+		return ret;
+
+	return devm_iio_device_register(dev, indio_dev);
+}
+
+static const struct platform_device_id mcf54415_dac_ids[] = {
+	{ .name = "mcfdac" },
+	{ }
+};
+MODULE_DEVICE_TABLE(platform, mcf54415_dac_ids);
+
+static struct platform_driver mcf54415_dac_driver = {
+	.driver = {
+		.name = "mcf54415_dac",
+	},
+	.probe = mcf54415_dac_probe,
+	.id_table = mcf54415_dac_ids,
+};
+module_platform_driver(mcf54415_dac_driver);
+
+MODULE_AUTHOR("Angelo Dureghello <angelo@kernel-space.org>");
+MODULE_DESCRIPTION("NXP MCF54415 DAC driver");
+MODULE_LICENSE("GPL");

-- 
2.54.0


