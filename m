Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B31AC4450A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 19 Jul 2026 15:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0P1wZkKY3oPnYRFvFJO5fhl20ZxgiT2muLo4/CwDf7A=; b=XCY5/OvAgVxib2/0PAf37y/JXX
	qPLtiFffuozA7rowonrTCW0WV/cOl+ytZHVxyzOlZBYTgb9PKANSihfkJ8fkkth1JxzWnFdgI76do
	UhnnpNbtG5pNe83ecLCM9x6KBB8ol/hkhub7N4/OwsErfr09mADyG93zI3p375GPG34DT3MQHmGhk
	pspNmAnKO3Hd6vJHWZ+MiAMBEokzWBny6OvPPEGnTTXJvGpWgm19VFHTPS1M/o7if8TnhKhaqUski
	rNaBYjaS8ubiNYTUKlXSMBMK6L+kvttBuOjJ+I5hUhDFNBldcdDytHSzB/k+KgqWiv8GIepE6NrqC
	0/qUDr3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlTGr-000000056Pj-3d6y;
	Sun, 19 Jul 2026 15:17:37 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlTGl-000000056Ln-3xlS
	for linux-arm-kernel@lists.infradead.org;
	Sun, 19 Jul 2026 15:17:33 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-39669bcaadfso71058421fa.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 19 Jul 2026 08:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784474250; x=1785079050; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0P1wZkKY3oPnYRFvFJO5fhl20ZxgiT2muLo4/CwDf7A=;
        b=lzAohbh6/HlT1E5gq6pNekYsIAiNfgemcR0huCwMnmQ+WG3RThU7sHJ8J5uEukfCof
         aHVogND2hGreYC0x516gK0rgk8MRmI0CMcx//PDM9qQg7tV5zpaUPJXzzlYODkEMrWS8
         w0FzRn9fo86TE66xUiPGpCTZLnkm0gErOuD7CDyLv1MKkuXdT6BIq0awDU6qxXxnyw4w
         M+004FCTHOTaNSEpk0FuCfV1n5NAHk31G/2VwIEm0TnzGDjdx16ytpOaMz4qkC/9j9Jw
         spPnncHDAgjAeD7ndj4mommAG7nUgn/X3uCj0me96okgTCnjq2+Pwe6yCrjpuED/7BGy
         8meA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784474250; x=1785079050;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0P1wZkKY3oPnYRFvFJO5fhl20ZxgiT2muLo4/CwDf7A=;
        b=cG+vABpIB+Jw2ifHP88aIMT5LLmkrM7Djv6+mv1E6H4+AHS1V+cgG1asl/JIc/7VCR
         UZdAXGNB03CZrBIR6pRNOlfI02jfcseYzWbBCtNiMK1Du3bOhhw3ZOJfaTIPB6nW19hf
         xhUTIXiXx3ZJGl5OcYuGyqEybTSA7bIw8gPmxK0eI2CaS5252qiIZwa4Anop8fvjrtz4
         VwIlua6EsDiJeTvNbYZA6MIVijIYsoFU0u1AWxUf64b3V+Wg8rS8pj0c0v6vZeCfxI5M
         yqbS5h/IFJwsaTkRx2zP58cfOr1V+LkcOJYaJ8l/su6RRSa7cAdBSUV1qBqi/UhMrPsv
         OYsg==
X-Forwarded-Encrypted: i=1; AHgh+RrpLks6ViHYkohrAgXVbpO+2RJmObsbkiIu22JsHbKfH8nXZRHhAQjW+rgiBWMdEOWeIQYeJ8YEpnHGdGt32iry@lists.infradead.org
X-Gm-Message-State: AOJu0YzwNTekkWz/PYgXXIWFZDvRJYYlkzo4nUOlU6nPTkc62l3QkRjD
	uQhLpQk/8ds131eCEaV0ZbPpc2bVgAlljl/4oME8suE0p0qPd0dcw4+i8zmRNSnuC4Q=
X-Gm-Gg: AfdE7cmqk0vMzq6nwaugkfp5K5mdCdGtRgflKj92hFiDAOT7A/m6ivfhtdtOFEEbOh9
	4HOOxGwvBPnIqj9jN3mT3HqIyjRgHjiez13pPQqTLzQvBaXKYfwtSzRXKS7CGjTo840Of6Uge3F
	2xih5Hy4KalFes7z2SmTxEJtphUPrmuRxJ/Y+m0FXWsNpVPxp+b4f3T5jDEnCsLI3FebcZaM5f8
	ueWdlsCscbm7hwnnxDXoxW2Jl0GHig1S9ixNZ1fxM8v0kIeFBB5Lv5xovOGmeRH51dLEEMjedSL
	QW68i90GD6AJ2OFQSslGUBSuWhI0Zn036nXWemY6cyMWAeTpNefMLjuJ2EdokhfoVAIvsBrQ/Gb
	X5PsRvJfrFt9BO+EFlcbucmTDi1NxG2434YGOBaRCr5AmJEaFy+bs6IrKqaRRMf2mAO0n3jnXbg
	d/GNWt5o2t9SztVS1rb2igac4fc6ri9NJ8LndVOa3lOtww8I4=
X-Received: by 2002:a05:6512:124f:b0:5b0:21e3:6716 with SMTP id 2adb3069b0e04-5b28fac5c62mr2539868e87.58.1784474249617;
        Sun, 19 Jul 2026 08:17:29 -0700 (PDT)
Received: from [192.168.1.135] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b291e26e5fsm1835096e87.80.2026.07.19.08.17.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 08:17:26 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Sun, 19 Jul 2026 16:59:48 +0200
Subject: [PATCH v12 5/7] i2c: davinci: add support for setting bus
 frequency
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260719-i2c-mux-v12-5-a5010d623a57@gmail.com>
References: <20260719-i2c-mux-v12-0-a5010d623a57@gmail.com>
In-Reply-To: <20260719-i2c-mux-v12-0-a5010d623a57@gmail.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Michael Hennerich <michael.hennerich@analog.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@intel.com>, 
 Bartosz Golaszewski <brgl@kernel.org>, Peter Rosin <peda@lysator.liu.se>, 
 Peter Rosin <peda@lysator.liu.se>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Marcus Folkesson <marcus.folkesson@gmail.com>, 
 Bartosz Golaszewski <brgl@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4119;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=0IooApVNJrr/TWFtnF3D0qsEG9K3kvelVRC/Qgvjyuk=;
 b=owEBbAKT/ZANAwAKAYiATm9ZXVIyAcsmYgBqXOqIy07xsgS56s5AGnVfEIWyzaYloyGKeNoyc
 U7m1aeCzuWJAjIEAAEKAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCalzqiAAKCRCIgE5vWV1S
 MmJbD/daqz3ho1lBvy0xeHIGX1v57Lk/kAo72SLucpqluzWuCi1bBXX0mpaFqtO2f835GkyrVPC
 CH2/Nxtkp82UcdYdO3ss+JncrpWdcFFbz7gWMMkhw/NEuHU25mSkAsuXzzle3RU0BxpJpH9jLjv
 FbCbRp3f8Yn58WIBaNq/7ii43QFAdL2tAxBfm5klQSbFRIFFiIqXvWKJxlwEpCvB0fAaJHoEWbw
 bvrewVsQwcDrzWakzh1wJ+xeXaJGaGD5cMlLXf5nsZHUGiyVruxzUh4U/kG6rFd2hJKx7D5jWy5
 z7vh2JMQ82NSKxeLCZS5ZDj15jMdXUtmZf5PoOt7kp/CQXBcMBtQJEIWj/Q//1cGmuEsF+07gTd
 EevJD/AIIiTOwTh9DN82llPVJwMWsM/pnbOmRgDfMayaVPVBKLVVLsXiwjbJ53aAHUMEZEqI4y2
 nGXvlmAl8YkE3LRTnCj/48DjZes9tahbt4hoVNd7xCTjHkJzxzaG4ZphMW7gG31oA/l8TJhFnDu
 93In1lrjS1JUz6P7JIhOzlmaz2BU/78XzpOf9IsItrEJ6LVGWeMo5ZVbS9Z1vqLBvNXlC8VnIDT
 E593gorOQhn95pSjfdilpVBY3pwmbTujLAPzr8afOcUpxVvXynVIBGO3Cu9zPpupYKSkNwQeotc
 he3tYFNLYAYmY
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260719_081732_020846_34FB26BA 
X-CRM114-Status: GOOD (  19.59  )
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

Populate adapter with clock_Hz and .set_clk_freq() to enable support for
dynamic bus frequency.

Remove bus_freq_Hz entirely and only use clock_Hz instead.

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 drivers/i2c/busses/i2c-davinci.c | 33 +++++++++++++++++++++++++--------
 1 file changed, 25 insertions(+), 8 deletions(-)

diff --git a/drivers/i2c/busses/i2c-davinci.c b/drivers/i2c/busses/i2c-davinci.c
index f543997c31e9..87fef17bca55 100644
--- a/drivers/i2c/busses/i2c-davinci.c
+++ b/drivers/i2c/busses/i2c-davinci.c
@@ -132,8 +132,6 @@ struct davinci_i2c_dev {
 #ifdef CONFIG_CPU_FREQ
 	struct notifier_block	freq_transition;
 #endif
-	/* standard bus frequency */
-	unsigned int		bus_freq_Hz;
 	/* Chip has a ICPFUNC register */
 	bool			has_pfunc;
 };
@@ -171,6 +169,7 @@ static void i2c_davinci_calc_clk_dividers(struct davinci_i2c_dev *dev)
 	u32 clkh;
 	u32 clkl;
 	u32 input_clock = clk_get_rate(dev->clk);
+	u32 bus_freq_Hz = dev->adapter.clock_Hz;
 
 	/* NOTE: I2C Clock divider programming info
 	 * As per I2C specs the following formulas provide prescaler
@@ -207,16 +206,16 @@ static void i2c_davinci_calc_clk_dividers(struct davinci_i2c_dev *dev)
 	if (device_is_compatible(dev->dev, "ti,keystone-i2c"))
 		d = 6;
 
-	clk = (input_clock / (psc + 1)) / (dev->bus_freq_Hz);
+	clk = (input_clock / (psc + 1)) / (bus_freq_Hz);
 	/* Avoid driving the bus too fast because of rounding errors above */
-	if (input_clock / (psc + 1) / clk > dev->bus_freq_Hz)
+	if (input_clock / (psc + 1) / clk > bus_freq_Hz)
 		clk++;
 	/*
 	 * According to I2C-BUS Spec 2.1, in FAST-MODE LOW period should be at
 	 * least 1.3uS, which is not the case with 50% duty cycle. Driving HIGH
 	 * to LOW ratio as 1 to 2 is more safe.
 	 */
-	if (dev->bus_freq_Hz > I2C_MAX_STANDARD_MODE_FREQ)
+	if (bus_freq_Hz > I2C_MAX_STANDARD_MODE_FREQ)
 		clkl = (clk << 1) / 3;
 	else
 		clkl = (clk >> 1);
@@ -267,7 +266,7 @@ static int i2c_davinci_init(struct davinci_i2c_dev *dev)
 		davinci_i2c_read_reg(dev, DAVINCI_I2C_CLKL_REG));
 	dev_dbg(dev->dev, "CLKH = %d\n",
 		davinci_i2c_read_reg(dev, DAVINCI_I2C_CLKH_REG));
-	dev_dbg(dev->dev, "bus_freq_Hz = %dHz\n", dev->bus_freq_Hz);
+	dev_dbg(dev->dev, "bus_freq_Hz = %dHz\n", dev->adapter.clock_Hz);
 
 
 	/* Take the I2C module out of reset: */
@@ -279,6 +278,23 @@ static int i2c_davinci_init(struct davinci_i2c_dev *dev)
 	return 0;
 }
 
+static int davinci_i2c_set_clk(struct i2c_adapter *adap, u32 clock_Hz)
+{
+	struct davinci_i2c_dev *dev = i2c_get_adapdata(adap);
+
+	/* put I2C into reset */
+	davinci_i2c_reset_ctrl(dev, 0);
+
+	/* compute clock dividers */
+	adap->clock_Hz = clock_Hz;
+	i2c_davinci_calc_clk_dividers(dev);
+
+	/* Take the I2C module out of reset: */
+	davinci_i2c_reset_ctrl(dev, 1);
+
+	return clock_Hz;
+}
+
 /*
  * This routine does i2c bus recovery by using i2c_generic_scl_recovery
  * which is provided by I2C Bus recovery infrastructure.
@@ -755,12 +771,13 @@ static int davinci_i2c_probe(struct platform_device *pdev)
 	dev->dev = &pdev->dev;
 	dev->irq = irq;
 	platform_set_drvdata(pdev, dev);
+	adap = &dev->adapter;
 
 	r = device_property_read_u32(&pdev->dev, "clock-frequency", &prop);
 	if (r)
 		prop = I2C_MAX_STANDARD_MODE_FREQ;
 
-	dev->bus_freq_Hz = prop;
+	adap->clock_Hz = prop;
 
 	dev->has_pfunc = device_property_present(&pdev->dev, "ti,has-pfunc");
 
@@ -800,7 +817,6 @@ static int davinci_i2c_probe(struct platform_device *pdev)
 		goto err_unuse_clocks;
 	}
 
-	adap = &dev->adapter;
 	i2c_set_adapdata(adap, dev);
 	adap->owner = THIS_MODULE;
 	adap->class = I2C_CLASS_DEPRECATED;
@@ -809,6 +825,7 @@ static int davinci_i2c_probe(struct platform_device *pdev)
 	adap->dev.parent = &pdev->dev;
 	adap->timeout = DAVINCI_I2C_TIMEOUT;
 	adap->dev.of_node = dev_of_node(&pdev->dev);
+	adap->set_clk_freq = davinci_i2c_set_clk;
 
 	if (dev->has_pfunc)
 		adap->bus_recovery_info = &davinci_i2c_scl_recovery_info;

-- 
2.54.0


