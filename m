Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A192DE7BDB6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Feb 2026 12:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cGd9MnZZeJn6tPn8V3/jY050merklc3RKXS0iFKCy0A=; b=skYUcsOy6qeF2sHcI2ZX8VqI1x
	/YEf28f1UD9gCALY1QI2eeBgLb2oME8BQUMrmH005PlAEqzyUGHlDL0XobaccCr6TG71BYxZxmtuD
	HwGjZ4UbdxhCOgeVmx2JbnsQRBAHyl6RgOARMmbtRF4+ln0TFy+Jdnd2GJNdV9VTSJJrLcbijtjRm
	1e1Ry1SVWsnUpwvTND6cb4JFtfsCGFIXD08Oo8YC/sW3neDAYfHIOk1bXczDFfAlHjwRtjGNvr+hi
	Azh/MiuO+eh5KgVJGp9eajCy5D/LwV1PqbloyDkVAjnsqCf4tuI4OaqKZnSGXGsCbkNqn0J+UmFZi
	X0bIEKSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrxsD-00000006Wfa-0OuZ;
	Mon, 16 Feb 2026 12:38:45 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrxs7-00000006WbP-2T3l
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Feb 2026 12:38:41 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-59dd54b1073so3518102e87.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Feb 2026 04:38:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771245517; x=1771850317; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cGd9MnZZeJn6tPn8V3/jY050merklc3RKXS0iFKCy0A=;
        b=hmPKZp5o5LoBNE4n4aBFX/Ul0QCq1S0KSIma4ZYje0QlkYiyat5PWriYj3Mer8WQfR
         PX/ddiHISvszQaJGmvfPUqX9cqTztSuTVjtUDCFr2+4qUdE4zFB94NdXCc6DPGHv1VR3
         PgcOFQMlCBJztYgcWEpBlj7fIUMZUtygKiA7eOL0x9ixVz9Sb1ru4fAJJD7zXOyIHWTA
         dWvLgyorNtcXokx9SsoNbEIH3DqmGMEwy6/7CUeqB9B8c15hv1r2BDhUD4s3gBeueKDc
         1wymT5t1BbCKn+5OqadFmEgw4+Ifk9TBDW+sOk+RNz7dacSBBMqsB/ELe9ltuqaThIZT
         kFrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771245517; x=1771850317;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cGd9MnZZeJn6tPn8V3/jY050merklc3RKXS0iFKCy0A=;
        b=qK0fo53yp1DPu41KTD2w7j5RN9ZdiWeT/FyHZWqOpCGDuJFAoP9aZ/qWLvfPQDgRfu
         n5/v/DYZQWaynM2wtcTK2H2gXyiW0KyBCFs+qIqBvCMJogLFqL6l5MdnOUvdRaZN4zDH
         0j7apST37F8dT6ko8tgcO3iIJYmhDF+iWlPmpJLU/psNnGI/bgY5xhrxZDchvVPLwLtr
         WgUhORMAY/sZoFUZkLLJtG6MyXPuYjrH2tEnPa6jbQ2mjRUnw0nceBpauKC8UmKu8Jlp
         rz7TK27ev5MniIj8at49rQeVgK1lK5YElwzRJLX392xqMOjnpnYMXO3d2sQ7/iPv7O7y
         LkWQ==
X-Forwarded-Encrypted: i=1; AJvYcCX4tjfXcipw64uwDNwqe63uTqeq4k2W51/a6hPgPPx7IknQV9WkedGcaNIxwglXzHaiuWT9FacgG1L82fI7wY0W@lists.infradead.org
X-Gm-Message-State: AOJu0YwjDm1OBlDTWuQ1FAaq3ikR8EpegLNtYDjiNdV0xz38lINllGVV
	qcDGnwzTo4f1yHwXPJh27N9Xdt2+gSnuojYYQ7/m6NY4GbQjtdPVv7kc
X-Gm-Gg: AZuq6aIfcg/c0QPARZ1q8xlkIppL911ohDXMYguHzMn93a8D2cnH+rshlnIXdAnUFO/
	EshX7KddQOLolo6BQ3bkQzXXcDy1JpeRUgC7N9kXM8E7iK5vjAt1+QUKeVbaNh7hyrARG0JLHjd
	csTh/Di9V3o4hf+2eEdyBNkPTAG8WQfI2pdWOCBZc5lU/VjGQeW+OulJ4TChP3Ch6Bjj8TPU2HB
	uVC14T7c7SBc6IucxpjMahxoS35jkyZ7U4u36RPB4n3zzvi7CXrWihLnj0zaInbndbwMvMzVk17
	55xLS1bOPMBlUBC2XA6kF8UZ3yC/ag+kD9F2Z0+Q/59w033aFmo+t80GUOkduzf6yrSvFswkUT/
	uvUKEOts1Yw+o7QTninSUx1lMcID5haSJnKn7BydHXLM5R84EyDatKu0gNZJ13PVvKNV4d/xBbW
	CMeXymR4pkscVI6+FAB9Qq9zkERd2/C3LR36Fk55QCk7KIPGxq5cJCk3xxuyEVgsv9AE/g
X-Received: by 2002:a05:6512:ac9:b0:59e:49f3:657e with SMTP id 2adb3069b0e04-59f6d3590aamr1998626e87.21.1771245517227;
        Mon, 16 Feb 2026 04:38:37 -0800 (PST)
Received: from [192.168.1.135] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e5f5b0577sm3175920e87.71.2026.02.16.04.38.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 04:38:36 -0800 (PST)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Mon, 16 Feb 2026 13:38:16 +0100
Subject: [PATCH v6 4/5] i2c: davinci: add support for setting bus frequency
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260216-i2c-mux-v6-4-9be28ecfd7e3@gmail.com>
References: <20260216-i2c-mux-v6-0-9be28ecfd7e3@gmail.com>
In-Reply-To: <20260216-i2c-mux-v6-0-9be28ecfd7e3@gmail.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Peter Rosin <peda@axentia.se>, 
 Michael Hennerich <michael.hennerich@analog.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@intel.com>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Marcus Folkesson <marcus.folkesson@gmail.com>, 
 Bartosz Golaszewski <brgl@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4136;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=FZLb5XRyW3qJmkpIPIeOUrGpSdB/lOwxjtGV8G6aT1w=;
 b=owEBbQKS/ZANAwAKAYiATm9ZXVIyAcsmYgBpkw/SjhxPbOdl6PzzFXxkG7V00Yfw6LrO32v8G
 AJ5G3J/oZaJAjMEAAEKAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCaZMP0gAKCRCIgE5vWV1S
 MuWAD/sEgcqRDjfv4dBtPGn2rMygDHEQ/WhM8LZZY/ZsUdTu9IEazfaetDhsq19yVFasDasuKDN
 DsYRv1P0iG0tx5+MlZkmLfN/5UETYd/30vekBJhObSat5hw6ipvIhKzQG9pPCIJ+T5K5yhRhITn
 KU1Bt0hFa+0TF4vhsVUfP0pgEEsdTUDu/b7b0LZIv5hCUbk1pv56Y0uM65puMV8FuIh+4MH1Pkl
 8q4lVmWLYnbUEevmJTy3eEHw+BTKzwAf6NnpVAZL8MZd8e8+jdZkZbGMUdTfmIsMKb+GQZ/9Y3h
 rArQXnWUk/5sOPLjlwlMe5hBpv16OmHWtjkJ6e0U3mUBzEHYtlNpZ/T1Mmh8JYVMwIyA4QJAJdM
 dWrqg9RbU8x+499vybmgDvEaDqG/4O916z0m1G4mXHJ3cus79TG2Mt3Px8821pcBdxEoA/5QRPE
 dMmaylJHuhoBgEgAOkufNDCMbbFWI/xF/lXnN5QFUlOKsR5c3BI7OZ8F/q9gF0x4uEGRtEnkYjl
 SmtX+sYiLL/WDiNd+tTD/4Q0W3vbS7c7sGjeAlLk9tv5nR9Cj2kMz8qi3jHLFtQtcy+CRzm3Ij9
 R3K6H+G6lIuuHpi/0pBxr13dJSVrUk8cTbSJWAU00Yi0MNC6zTaBMcg8nmqx9yDLb88ehl1xQAZ
 7m+FV3jxrMt5h7Q==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260216_043840_168029_28DCDAB3 
X-CRM114-Status: GOOD (  19.55  )
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

Populate adapter with clock_hz and set_clk_freq to enable support for
dynamic bus frequency.

Remove bus_freq_hz entirely and only use clock_hz instead.

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 drivers/i2c/busses/i2c-davinci.c | 38 ++++++++++++++++++++++++++++++--------
 1 file changed, 30 insertions(+), 8 deletions(-)

diff --git a/drivers/i2c/busses/i2c-davinci.c b/drivers/i2c/busses/i2c-davinci.c
index 761de5a814df..ca41e6d6b623 100644
--- a/drivers/i2c/busses/i2c-davinci.c
+++ b/drivers/i2c/busses/i2c-davinci.c
@@ -132,8 +132,6 @@ struct davinci_i2c_dev {
 #ifdef CONFIG_CPU_FREQ
 	struct notifier_block	freq_transition;
 #endif
-	/* standard bus frequency */
-	unsigned int		bus_freq_hz;
 	/* Chip has a ICPFUNC register */
 	bool			has_pfunc;
 };
@@ -171,6 +169,8 @@ static void i2c_davinci_calc_clk_dividers(struct davinci_i2c_dev *dev)
 	u32 clkh;
 	u32 clkl;
 	u32 input_clock = clk_get_rate(dev->clk);
+	u32 bus_freq_hz = dev->adapter.clock_hz;
+
 
 	/* NOTE: I2C Clock divider programming info
 	 * As per I2C specs the following formulas provide prescaler
@@ -207,16 +207,16 @@ static void i2c_davinci_calc_clk_dividers(struct davinci_i2c_dev *dev)
 	if (device_is_compatible(dev->dev, "ti,keystone-i2c"))
 		d = 6;
 
-	clk = ((input_clock / (psc + 1)) / (dev->bus_freq_hz));
+	clk = ((input_clock / (psc + 1)) / (bus_freq_hz));
 	/* Avoid driving the bus too fast because of rounding errors above */
-	if (input_clock / (psc + 1) / clk > dev->bus_freq_hz)
+	if (input_clock / (psc + 1) / clk > bus_freq_hz)
 		clk++;
 	/*
 	 * According to I2C-BUS Spec 2.1, in FAST-MODE LOW period should be at
 	 * least 1.3uS, which is not the case with 50% duty cycle. Driving HIGH
 	 * to LOW ratio as 1 to 2 is more safe.
 	 */
-	if (dev->bus_freq_hz > 100000)
+	if (bus_freq_hz > 100000)
 		clkl = (clk << 1) / 3;
 	else
 		clkl = (clk >> 1);
@@ -267,7 +267,7 @@ static int i2c_davinci_init(struct davinci_i2c_dev *dev)
 		davinci_i2c_read_reg(dev, DAVINCI_I2C_CLKL_REG));
 	dev_dbg(dev->dev, "CLKH = %d\n",
 		davinci_i2c_read_reg(dev, DAVINCI_I2C_CLKH_REG));
-	dev_dbg(dev->dev, "bus_freq_hz = %dHz\n", dev->bus_freq_hz);
+	dev_dbg(dev->dev, "bus_freq_hz = %dHz\n", dev->adapter.clock_hz);
 
 
 	/* Take the I2C module out of reset: */
@@ -279,6 +279,27 @@ static int i2c_davinci_init(struct davinci_i2c_dev *dev)
 	return 0;
 }
 
+static int davinci_i2c_set_clk(struct i2c_adapter *adap, u32 clock_hz)
+{
+	struct davinci_i2c_dev *dev = i2c_get_adapdata(adap);
+
+	if (adap->clock_hz == clock_hz)
+		return 0;
+
+	adap->clock_hz = clock_hz;
+
+	/* put I2C into reset */
+	davinci_i2c_reset_ctrl(dev, 0);
+
+	/* compute clock dividers */
+	i2c_davinci_calc_clk_dividers(dev);
+
+	/* Take the I2C module out of reset: */
+	davinci_i2c_reset_ctrl(dev, 1);
+
+	return 0;
+}
+
 /*
  * This routine does i2c bus recovery by using i2c_generic_scl_recovery
  * which is provided by I2C Bus recovery infrastructure.
@@ -755,12 +776,13 @@ static int davinci_i2c_probe(struct platform_device *pdev)
 	dev->dev = &pdev->dev;
 	dev->irq = irq;
 	platform_set_drvdata(pdev, dev);
+	adap = &dev->adapter;
 
 	r = device_property_read_u32(&pdev->dev, "clock-frequency", &prop);
 	if (r)
 		prop = I2C_MAX_STANDARD_MODE_FREQ;
 
-	dev->bus_freq_hz = prop;
+	adap->clock_hz = prop;
 
 	dev->has_pfunc = device_property_present(&pdev->dev, "ti,has-pfunc");
 
@@ -800,7 +822,6 @@ static int davinci_i2c_probe(struct platform_device *pdev)
 		goto err_unuse_clocks;
 	}
 
-	adap = &dev->adapter;
 	i2c_set_adapdata(adap, dev);
 	adap->owner = THIS_MODULE;
 	adap->class = I2C_CLASS_DEPRECATED;
@@ -809,6 +830,7 @@ static int davinci_i2c_probe(struct platform_device *pdev)
 	adap->dev.parent = &pdev->dev;
 	adap->timeout = DAVINCI_I2C_TIMEOUT;
 	adap->dev.of_node = dev_of_node(&pdev->dev);
+	adap->set_clk_freq = davinci_i2c_set_clk;
 
 	if (dev->has_pfunc)
 		adap->bus_recovery_info = &davinci_i2c_scl_recovery_info;

-- 
2.52.0


