Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A9D6C624D3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 19:26:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Au4Zowwhgt90eKNQsRrHmDjhWALjzLV/Ep727GpNnYw=; b=BJOUATtW/G8JyFshrnzKIrZDpm
	TE1vaNs4Jcgi1ggIjd5vywd8zva42D3ZBQRIE8dYMNOIvSLZ50OOdP3oBwq/6Pgmk3BEM/ubkoGUH
	pJx5a5CeVWES1vBQHxJiZRyIKlHTF4hcw9sItJSwIrqHzCTj20uLsgJGXJIbHwOkYnjNfxPHlhw+x
	AA2Ke0/W/B1hz0ogi0UmvsqKHgGrSDHrxUQXs1IOkvluW3phMgAIqcj/TSouzO2TbzWgZDUPNUP8e
	9mwN9kn3NVuCHVP4zyRY0o48PpHvNhMqkFnfKbj2Qv1lJw/ny6KtSbvom8QYGcGyvc6NpYdnSA/9S
	4xy6X6Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1U80-0000000DCSW-0qAm;
	Tue, 01 Sep 2026 19:26:40 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1U7w-0000000DCQK-1pcE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 19:26:37 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-69c108fee7fso324190a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Sep 2026 12:26:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788290795; x=1788895595; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Au4Zowwhgt90eKNQsRrHmDjhWALjzLV/Ep727GpNnYw=;
        b=Vht2RoUKwfNNX+EEI4bcYYyGNDeRtEbmToTxylLdBVZYarBv8qyH0RQ90oYd996xqH
         yolJ3KcoTL7rgAtM5t74I6Bs8TtvHuV0acsCXKhCXg/cfWJLCMCRs9bGuI09qJyNa8aO
         GgwpVKfA8ghvxKo/VH06m9Wc48kXObI0pekAXheXpcQ94FZuyFQialkM734H6wbN/iH2
         P0wT6TVz4eR4uDK8Jdk/eq0lh3gTqlN2I9c3u2i6w9nb0qBN0a1CFkcMsJwNSbnujj4q
         hk6iwh1wanjeX7QxO9fKCt4x7sTXw3w45B0oXJQPXTJ/MnoMhBYmYiyQBKVDtKmo/eFx
         XBNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788290795; x=1788895595;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Au4Zowwhgt90eKNQsRrHmDjhWALjzLV/Ep727GpNnYw=;
        b=cxP4LlmnN86Y/DarV71lmR97/YfUPQ9Qej7VAR4X6Adk0nTv/Lnqajokd7LoRx6yHs
         Xw5aiJapbN4PfE2oEKn88NSl5VjeaQWU25cPngSBy8LBaK/TgRQK8LTDbX+yMOaSAe5e
         mmTbt56v+8uy+65BMJi25hax1nwDnOpcgHY/R1Zf2Osxo8EUwsVicF2qdYDt/9dkqNr6
         7tm2UhAeyd36wjzsSnta3HGw0ZGOpyAnmhzG5k1mWo+TQwzsvzXTkInqEtk0lrQClJay
         GeOoCIk7sgxWYIhdwNqwrtfSWw7eKY5oZW8po3MGZ5hpiTYL2QLOgN2UGnjmJLAlGrFA
         ja7Q==
X-Forwarded-Encrypted: i=1; AKwUvBzmADwjNHRf71HKf3Pf+ebTcayZd+lHwFNc22CTX589CPlHyj4iitHqVNWEao5f+0MC47jdp9TwUDvVYBtrqkki@lists.infradead.org
X-Gm-Message-State: AFuF++kAcXm0oH7X/PJTVziiDgpyzVOZIGSaBAU2Kl72QSJ2PgaOkPEg
	WGHQPBw0a9IGUj1DzLdRR18U+PTDK13hTFwH8wY6zZRij6u4mPpuBwRq
X-Gm-Gg: AYBFou2g0T0+IU6LhTLFqsJuyew74N31keU+Ax1nmi292kuj8oUKeN8j3RPDLU5enW7
	8IsCPizykikNDfwYaPtOGpTVnwewRt9jcy2UCVhLKyBdnLVrF5fyts0tdfn3FgVnSEXVzIq2ZeF
	qXZDVig/vNZ/FWPkGAGPmVmz48ooXuoDOt94iI50684xGJyQLA8/ahavQsnLWYMntiDplXvY9p5
	gD9IdXrngAwo5InCOI0lepJruqTCc/OBYz+/HBhus9vs/qbx4qFKsUmbm9B+z+9F3XY5TiYk1mt
	MM4uQi1GLCNSUJ3A/GgV6cUmoqSKIzrN9bRYIMA/bK9QzLzsOOAFywuSJlyoZatYSxFIlgl+unV
	Ep/CTvfWg/CgMBya/fptN66zy/KDlGdsZmOn61TFYDymaWZCHQArD/DA0051y22/YfucvWZT7Il
	xXtuuvdq7edUakdNorWSitygoP6vaGQCDTuGPsZQEuWmCDAe9jFgBYNVAO0Z0dTTGcdS8WEs/Q
X-Received: by 2002:a05:6402:210c:b0:6a5:f528:ff48 with SMTP id 4fb4d7f45d1cf-6a6825668eemr51905a12.5.1788290794393;
        Tue, 01 Sep 2026 12:26:34 -0700 (PDT)
Received: from khalil-hp.home ([62.250.116.161])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a67f94242csm146373a12.21.2026.09.01.12.26.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 12:26:34 -0700 (PDT)
From: Khalil <khalilst@gmail.com>
X-Google-Original-From: Khalil <khalil@rentman.nl>
To: Mark Brown <broonie@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Richard Fitzgerald <rf@opensource.cirrus.com>,
	patches@opensource.cirrus.com,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	linux-spi@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Khalil <khalil@rentman.nl>,
	Khalil <khalilst@gmail.com>
Subject: [PATCH v3 2/3] platform/x86: serial-multi-instantiate: Fix SPI chip select on platforms with incomplete ACPI cs-gpios
Date: Tue,  1 Sep 2026 21:26:24 +0200
Message-ID: <20260901192625.1497791-3-khalil@rentman.nl>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260901192625.1497791-1-khalil@rentman.nl>
References: <20260901192625.1497791-1-khalil@rentman.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_122636_524640_6EB8F95B 
X-CRM114-Status: GOOD (  30.60  )
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

Some HP laptops with Intel Lunar Lake and dual Cirrus Logic CS35L56
amplifiers over SPI have an incomplete cs-gpios property in the SPI
controller's _DSD - it only declares the first chip select. The
remaining chip select GPIOs are defined as GpioIo resources in the
peripheral's ACPI node but are not referenced by the controller.

This causes the SPI framework to reject devices whose chip select
exceeds num_chipselect with -EINVAL, preventing the second amplifier
from probing.

Fix this on known affected platforms by:

1. Adding a DMI quirk table to identify affected systems
2. For devices with chip selects outside the controller's range,
   acquiring the GPIO from the peripheral's ACPI GpioIo resource
3. Extending num_chipselect and reallocating the controller's
   cs_gpiods array to install the GPIO descriptor
4. Setting SPI_CONTROLLER_GPIO_SS so the framework calls both
   the GPIO toggle and controller->set_cs (needed for clock
   gating on Intel LPSS controllers)

Only chip selects beyond the controller's num_chipselect are fixed up.
Chip selects within range with a NULL cs_gpiods entry are left alone,
as NULL means "native chip select" which is intentional.

Tested on HP EliteBook 8 G1i 16 inch (board 8D8A) with 2x CS35L56
Rev B0 amplifiers. Both amplifiers probe and produce audio.

Signed-off-by: Khalil <khalilst@gmail.com>
---
 .../platform/x86/serial-multi-instantiate.c   | 168 ++++++++++++++++++
 1 file changed, 168 insertions(+)

diff --git a/drivers/platform/x86/serial-multi-instantiate.c b/drivers/platform/x86/serial-multi-instantiate.c
index 1a369334f9..0d30bd0a7b 100644
--- a/drivers/platform/x86/serial-multi-instantiate.c
+++ b/drivers/platform/x86/serial-multi-instantiate.c
@@ -8,6 +8,10 @@
 
 #include <linux/acpi.h>
 #include <linux/bits.h>
+#include <linux/delay.h>
+#include <linux/dmi.h>
+#include <linux/gpio/consumer.h>
+#include <linux/gpio/machine.h>
 #include <linux/i2c.h>
 #include <linux/interrupt.h>
 #include <linux/kernel.h>
@@ -46,6 +50,53 @@ struct smi {
 	int spi_num;
 	struct i2c_client **i2c_devs;
 	struct spi_device **spi_devs;
+	struct gpio_desc *cs_gpio;
+};
+
+/*
+ * Quirk data for platforms with broken ACPI SPI chip select descriptions.
+ * cs_gpio_idx: index of the GpioIo resource in the ACPI _CRS that provides
+ *              the chip select GPIO for devices missing a proper cs-gpios
+ *              entry on the SPI controller.
+ */
+struct smi_cs_gpio_quirk {
+	int cs_gpio_idx;
+};
+
+static const struct smi_cs_gpio_quirk hp_elitebook_8g1i_quirk = {
+	.cs_gpio_idx = 0,
+};
+
+/*
+ * DMI table of platforms with broken SPI chip select ACPI descriptions.
+ *
+ * These systems have multiple SPI peripherals (e.g., dual CS35L56
+ * amplifiers) but the SPI controller's _DSD cs-gpios property is
+ * incomplete - it only declares the first chip select. The remaining
+ * chip select GPIOs are defined as GpioIo resources in the peripheral's
+ * ACPI node but are not referenced by the controller.
+ */
+static const struct dmi_system_id smi_cs_gpio_dmi_table[] = {
+	{
+		.ident = "HP EliteBook 8 G1i 16 inch",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "HP"),
+			DMI_MATCH(DMI_BOARD_NAME, "8D8A"),
+		},
+		.driver_data = (void *)&hp_elitebook_8g1i_quirk,
+	},
+	{ }
+};
+
+/*
+ * ACPI GPIO mapping for the chip select GpioIo resource.
+ * Maps "cs-gpios" to the GpioIo resource at index 0 of the ACPI _CRS.
+ */
+static const struct acpi_gpio_params smi_cs_gpio_params = { 0, 0, false };
+
+static const struct acpi_gpio_mapping smi_cs_gpio_mapping[] = {
+	{ "cs-gpios", &smi_cs_gpio_params, 1 },
+	{ }
 };
 
 static int smi_get_irq(struct platform_device *pdev, struct acpi_device *adev,
@@ -99,6 +150,101 @@ static void smi_devs_unregister(struct smi *smi)
 	}
 }
 
+/*
+ * smi_spi_setup_cs_gpio - Fix up chip select for a device on a platform
+ * with broken ACPI cs-gpios description.
+ *
+ * On affected platforms, the SPI controller's cs-gpios property is incomplete,
+ * so the framework has no GPIO descriptor for some chip selects. This causes
+ * __spi_add_device() to reject the device with -EINVAL (cs >= num_chipselect).
+ *
+ * This function:
+ * 1. Extends num_chipselect if the device's CS is out of range
+ * 2. Reallocates cs_gpiods to match, preventing out-of-bounds access
+ *    in __spi_add_device()
+ * 3. Installs the GPIO from the peripheral's ACPI node into the
+ *    controller's cs_gpiods array so __spi_add_device() propagates
+ *    it to the device
+ * 4. Sets SPI_CONTROLLER_GPIO_SS so the framework calls both the GPIO
+ *    toggle and controller->set_cs (needed for clock gating on Intel
+ *    LPSS controllers)
+ */
+static int smi_spi_setup_cs_gpio(struct device *dev,
+				 struct spi_device *spi_dev,
+				 struct smi *smi,
+				 const struct smi_cs_gpio_quirk *quirk)
+{
+	struct spi_controller *ctlr = spi_dev->controller;
+	struct gpio_desc **new_gpiods;
+	u16 cs = spi_get_chipselect(spi_dev, 0);
+
+	/*
+	 * Only fix up chip selects that the controller doesn't know about.
+	 * A NULL cs_gpiods[cs] within the controller's num_chipselect range
+	 * means "native chip select" - that's intentional, not broken.
+	 * The broken case is when cs >= num_chipselect, meaning the ACPI
+	 * cs-gpios property on the controller was incomplete.
+	 */
+	if (cs < ctlr->num_chipselect)
+		return 0;
+
+	/* Extend num_chipselect to cover this device */
+	dev_info(dev, "Extending num_chipselect from %u to %u for CS%u\n",
+		 ctlr->num_chipselect, cs + 1, cs);
+	ctlr->num_chipselect = cs + 1;
+
+	/* Acquire the CS GPIO from the ACPI GpioIo resource if not yet done */
+	if (!smi->cs_gpio) {
+		int ret;
+
+		ret = devm_acpi_dev_add_driver_gpios(dev, smi_cs_gpio_mapping);
+		if (ret) {
+			dev_warn(dev, "Failed to add CS GPIO mapping: %d\n", ret);
+			return ret;
+		}
+
+		smi->cs_gpio = devm_gpiod_get(dev, "cs", GPIOD_OUT_HIGH);
+		if (IS_ERR(smi->cs_gpio)) {
+			dev_warn(dev, "Failed to get CS GPIO: %ld\n",
+				 PTR_ERR(smi->cs_gpio));
+			smi->cs_gpio = NULL;
+			return -ENOENT;
+		}
+		dev_info(dev, "Acquired CS GPIO for CS%u from ACPI GpioIo[%d]\n",
+			 cs, quirk->cs_gpio_idx);
+	}
+
+	/*
+	 * Reallocate the controller's cs_gpiods array to accommodate the
+	 * new num_chipselect, and install the GPIO descriptor. This is
+	 * necessary because __spi_add_device() unconditionally reads
+	 * ctlr->cs_gpiods[cs] to set the device's cs_gpiod.
+	 */
+	new_gpiods = devm_kcalloc(&ctlr->dev, ctlr->num_chipselect,
+				  sizeof(*new_gpiods), GFP_KERNEL);
+	if (!new_gpiods)
+		return -ENOMEM;
+
+	if (ctlr->cs_gpiods) {
+		unsigned int i;
+
+		for (i = 0; i < cs; i++)
+			new_gpiods[i] = ctlr->cs_gpiods[i];
+	}
+	new_gpiods[cs] = smi->cs_gpio;
+	ctlr->cs_gpiods = new_gpiods;
+
+	/*
+	 * SPI_CONTROLLER_GPIO_SS ensures the framework calls both the
+	 * GPIO CS toggle and controller->set_cs(). This is required on
+	 * Intel LPSS controllers where set_cs handles clock gating.
+	 */
+	ctlr->flags |= SPI_CONTROLLER_GPIO_SS;
+
+	dev_info(dev, "Installed GPIO CS on controller for CS%u\n", cs);
+	return 0;
+}
+
 /**
  * smi_spi_probe - Instantiate multiple SPI devices from inst array
  * @pdev:	Platform device
@@ -112,10 +258,19 @@ static int smi_spi_probe(struct platform_device *pdev, struct smi *smi,
 {
 	struct device *dev = &pdev->dev;
 	struct acpi_device *adev = ACPI_COMPANION(dev);
+	const struct dmi_system_id *dmi_id;
+	const struct smi_cs_gpio_quirk *quirk = NULL;
 	struct spi_controller *ctlr;
 	struct spi_device *spi_dev;
 	char name[50];
 	int i, ret, count;
+	u16 cs;
+
+	dmi_id = dmi_first_match(smi_cs_gpio_dmi_table);
+	if (dmi_id) {
+		quirk = dmi_id->driver_data;
+		dev_info(dev, "Applying CS GPIO quirk for %s\n", dmi_id->ident);
+	}
 
 	ret = acpi_spi_count_resources(adev);
 	if (ret < 0)
@@ -139,6 +294,19 @@ static int smi_spi_probe(struct platform_device *pdev, struct smi *smi,
 		}
 
 		ctlr = spi_dev->controller;
+		cs = spi_get_chipselect(spi_dev, 0);
+
+		/*
+		 * On quirked platforms, fix up the chip select GPIO for
+		 * devices that would otherwise fail due to incomplete
+		 * ACPI cs-gpios on the SPI controller.
+		 */
+		if (quirk) {
+			ret = smi_spi_setup_cs_gpio(dev, spi_dev, smi, quirk);
+			if (ret)
+				dev_dbg(dev, "CS GPIO setup returned %d for CS%u\n",
+					ret, cs);
+		}
 
 		strscpy(spi_dev->modalias, inst_array[i].type);
 
-- 
2.43.0


