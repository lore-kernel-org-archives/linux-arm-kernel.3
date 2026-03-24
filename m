Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEBC2F54ABB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 13:55:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oz1kP6mGnYmsV3pNCXtV9G7tgVBh7BnFUeruC1cPFLw=; b=dflFw/KTjZreHsaJ8N8cVHFFXO
	Ay8hTrzv2WbxFIiJYjvG8uR5ERgDmc7JfYbeKuLbCCgi2G+8bGrnkLKI3/NybEX4M77+V6B41CRR1
	G4Abx4kX2SAgDihNuOPZf95Ob9rutoeectoG3Y5IZjKHdYknNXS9ONtfS1bVbhRYUKPQzOJIqUfsj
	J3sw+QLR7+cZZhCm4FXT3sadMI6D0vjfiTSunehzrrFPEWzeB8Z2E3hbc2REUhuQa5r53w6cwPLc8
	ob1Da2Bw8LrMEumtE7BEKR0nw4OFSNMSP7w4Iurhvx+IQA5DkuHE3yW6l5TRiQ0XVWxE2AUbH6XZe
	MzFVpZVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w52Dh-00000001aPG-2BYb;
	Tue, 24 Mar 2026 13:54:57 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w52Da-00000001aKo-3Nka
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 13:54:51 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-5a142464316so5698308e87.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Mar 2026 06:54:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774360489; x=1774965289; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oz1kP6mGnYmsV3pNCXtV9G7tgVBh7BnFUeruC1cPFLw=;
        b=PX3IQfEO0RhqzSLuKcxVuYSRSDYyXP8sbZDIsHoT5nIpq6dKT+0bb1NtyK17ctwhHF
         HBrGBTQIkSZ2ZPrJXiVr2xoxm8PfUJI4J+GXGAhEuViUEb3SYburxfVrBeTTNIUaNAvh
         bJ8r/5p77X5Dy7YkGO4I2/Ub0eT1rWe+fIZZUhuQgTkGQf7hFeoThJyB5vmRPY24NSUT
         muFClhrkw2f/gS5BGxcKgRibEm86cNabI6IsMhZbmqPLRCNxXm3srJFQr3Ta8OuTbGKB
         J3prA8fDOrwz+171VC4LEmmffJN8r7Xim7UbabOmzPuJNhXgCw1orPsp0gaq1RXbfTL3
         Ae7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774360489; x=1774965289;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oz1kP6mGnYmsV3pNCXtV9G7tgVBh7BnFUeruC1cPFLw=;
        b=QfwY9RgLcEQkvpwzj661sT0IaPE6JSd6Wg/l9zRV1HmeBHn5QnmATqwzLx+CrGrDOd
         rUec3GSJZYRmXjglqQJ+FavzpbQl7/Z7V9MrWyGZFsVA76g1XBCwrfQQY/GtUIZArHOs
         d7S3ZOz6W3KhxB1W50BY0PDSUnii0ldHNUIoU3GTLujJYtV4f2Z1c4ErzspTKcgAg0Kr
         jbVN1002nYVcnlVq2t5K6wNzrcf9VW8aS8MP3YLh1F6bJjuO8vp2ZWx5FDfjMO5zuxe+
         o0nz54jutcXdxydHIle/hG1oR3Axej4aK1p2VCITuVIVBtopYEqdVBh7aEAZKrgV0aId
         5nNw==
X-Forwarded-Encrypted: i=1; AJvYcCV8AJjweX386uZl/yiLsVFGYCl2NtvZZT48qRcl4vWt6zRf85NqhyZNVBSi4tcmwsIq7Fm8I8aEaT6J9NU1uR7Z@lists.infradead.org
X-Gm-Message-State: AOJu0YyJ92U/FOm+IXa6/FWqDHpPdGuMHEvGl9mGrYKlEg9e66CBFZVS
	KneJo2bKJr4ncVawNB/RqyKqkpWn1Xo6GdRbnvt9XefdHpR3vCn0RZxv
X-Gm-Gg: ATEYQzxfItJ7U0M6FwpOPYHXL/s5B7hsdFytAV3vrR7YreXF1rAKm8LX3geQI1a0lzv
	06SRhXsuCkRUT8mn4rKXshfFbh0dd1kOn0vepZRiRLt5h05SPvOyQ/iVPMa6dZuNVl2TAwX8Di+
	cGvZZLuTPZmw15QmJP5u1Ztb4wArgKFLiZbfZk9hr+TiZSMF2WEnV1+p/KishIHXPdaKxIJwSgY
	no1ryjCqLa2yhQlomoDAxuoXPV6XjjhbRgm/lyNYTf9ObXAAXL3I56WXUnCTzetot5UYhoXD4Ts
	W9KaLKpT8DNUrjMpDHDJw00SKb+r26hE2TbGagoV53lCmNFrULWETDUpb6TagSgaGiQHI+Uvmzg
	rrOqHd08/NaqDt0n4P88urZAaNrl+8V0YBf8KVfBXuRqy/2YzNOUeRhTT+RYBppuAxJeUQn6Kvs
	McXxz4CBbwAnxQy4TxorEN8bwOcxH+VTX5adavAQiJGpTrLrafV7iDzI8lEX2KkM1cnXew
X-Received: by 2002:a05:6512:124c:b0:5a1:6c86:b945 with SMTP id 2adb3069b0e04-5a285afdc41mr5770590e87.12.1774360488477;
        Tue, 24 Mar 2026 06:54:48 -0700 (PDT)
Received: from [192.168.1.135] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a285207454sm3162823e87.48.2026.03.24.06.54.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 06:54:47 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Tue, 24 Mar 2026 14:54:18 +0100
Subject: [PATCH v9 4/5] i2c: davinci: add support for setting bus frequency
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260324-i2c-mux-v9-4-5292b0608243@gmail.com>
References: <20260324-i2c-mux-v9-0-5292b0608243@gmail.com>
In-Reply-To: <20260324-i2c-mux-v9-0-5292b0608243@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3881;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=ryrI9MAQVwCIRRCngn0KDdHz7g1aMSsslONZvQCRx8g=;
 b=owEBbQKS/ZANAwAKAYiATm9ZXVIyAcsmYgBpwpecpKtb2LQM74bmvDz0req+77DcvmlflCxyE
 W4Thx+y7rWJAjMEAAEKAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCacKXnAAKCRCIgE5vWV1S
 MlCUD/wPBVoCUV1xDm82HsdePvpFTI2QRLF6oP9tMPcFfNn5gKnix7i6IZSK70o5JGbRZP2Oqt0
 krIWM96uzXsZY1ahQOTrC//PEKTVZLYgv8Lek7pJ8fNJV70Nd2DzkaovUlBXeGWQUeHcSX0rrc2
 jw8muH/LXYI4RgA3nxwZlX3lLNEb0nNbxv/rDf0jYPs+j9mcGXH0WnRwsoVv1JO/UovW6am8AkH
 tvgbfHNliDmVpPJPeE6U4SxgwY8Otxk3b7cw7L1y2bcqxDZFIzflpxzuNNkQj5DnW+llnIAzgP0
 sjO8H0ms1lOrTt5+f4i3I9gWz5CAdvaAmZwbG0n5JEwpG1CI5BnJVlFMwld+yEJBaU4HyAexUOY
 SnRNTR5ot1h1CREUoKB90y7hEflr+pzSwtaqZNYhU2WtZAYyqB7HRwV0TpoCOUGhndf0HXHMqyJ
 iljSssZsBtgHzvWyxdh885YIt54nIFeggj3YJs8prKmAiM305wftGDGIK2xLfY+IMdwQq/cJAPq
 +/5/7exap9aoXdqA8WVdd/gAnHS4L0bLoN7UzcALDmF4Am49BXowNySUrTaEqHHiQfTMe5uDwlE
 L7+KTQ7rWJCda0niD3xovRf+f7DUKsLQsSep5U2cweJQW4WJ0R5W443R0ez0yJwVRLlnoxAR3m7
 UorDwjz3rJvMstw==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_065450_889152_36C81EE9 
X-CRM114-Status: GOOD (  18.36  )
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

Populate adapter with clock_hz and .set_clk_freq() to enable support for
dynamic bus frequency.

Remove bus_freq_hz entirely and only use clock_hz instead.

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 drivers/i2c/busses/i2c-davinci.c | 35 ++++++++++++++++++++++++++++-------
 1 file changed, 28 insertions(+), 7 deletions(-)

diff --git a/drivers/i2c/busses/i2c-davinci.c b/drivers/i2c/busses/i2c-davinci.c
index 549fb22cdf4f..d87172408445 100644
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
@@ -171,6 +169,7 @@ static void i2c_davinci_calc_clk_dividers(struct davinci_i2c_dev *dev)
 	u32 clkh;
 	u32 clkl;
 	u32 input_clock = clk_get_rate(dev->clk);
+	u32 bus_freq_hz = dev->adapter.clock_hz;
 
 	/* NOTE: I2C Clock divider programming info
 	 * As per I2C specs the following formulas provide prescaler
@@ -207,9 +206,9 @@ static void i2c_davinci_calc_clk_dividers(struct davinci_i2c_dev *dev)
 	if (device_is_compatible(dev->dev, "ti,keystone-i2c"))
 		d = 6;
 
-	clk = (input_clock / (psc + 1)) / (dev->bus_freq_hz);
+	clk = (input_clock / (psc + 1)) / (bus_freq_hz);
 	/* Avoid driving the bus too fast because of rounding errors above */
-	if (input_clock / (psc + 1) / clk > dev->bus_freq_hz)
+	if (input_clock / (psc + 1) / clk > bus_freq_hz)
 		clk++;
 	/*
 	 * According to I2C-BUS Spec 2.1, in FAST-MODE LOW period should be at
@@ -267,7 +266,7 @@ static int i2c_davinci_init(struct davinci_i2c_dev *dev)
 		davinci_i2c_read_reg(dev, DAVINCI_I2C_CLKL_REG));
 	dev_dbg(dev->dev, "CLKH = %d\n",
 		davinci_i2c_read_reg(dev, DAVINCI_I2C_CLKH_REG));
-	dev_dbg(dev->dev, "bus_freq_hz = %dHz\n", dev->bus_freq_hz);
+	dev_dbg(dev->dev, "bus_freq_hz = %dHz\n", dev->adapter.clock_hz);
 
 
 	/* Take the I2C module out of reset: */
@@ -279,6 +278,27 @@ static int i2c_davinci_init(struct davinci_i2c_dev *dev)
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
@@ -755,12 +775,13 @@ static int davinci_i2c_probe(struct platform_device *pdev)
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
 
@@ -800,7 +821,6 @@ static int davinci_i2c_probe(struct platform_device *pdev)
 		goto err_unuse_clocks;
 	}
 
-	adap = &dev->adapter;
 	i2c_set_adapdata(adap, dev);
 	adap->owner = THIS_MODULE;
 	adap->class = I2C_CLASS_DEPRECATED;
@@ -809,6 +829,7 @@ static int davinci_i2c_probe(struct platform_device *pdev)
 	adap->dev.parent = &pdev->dev;
 	adap->timeout = DAVINCI_I2C_TIMEOUT;
 	adap->dev.of_node = dev_of_node(&pdev->dev);
+	adap->set_clk_freq = davinci_i2c_set_clk;
 
 	if (dev->has_pfunc)
 		adap->bus_recovery_info = &davinci_i2c_scl_recovery_info;

-- 
2.53.0


