Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B347DEA4FC9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 14:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ML132/96OtzaPEHr0g2FW3hc1YN90nAUiFVEwcI9LI0=; b=t9Z8n8SZseNQCOhcDitmd96lib
	0Uq7urS4CxcFqAIhkCUawjStV0zE7D2FXdDBJvqX+hOao3vNOmcedkIIe8fLEhuVoA93yuacfYFjC
	jV7+O6eiYBtPxhJYGlaOm98McORTPmbXCr6ykMmwuGkgNswTxKqMJsLnNk6XeamQqio6KXZiZlAyj
	bentnpphOcuv13XAX5gQw34YnQijd3PkK7hb82kywIvpmEnqDkzf6YADa8YvGQOPvvYwZOaxEJNFt
	oU7KJRhAgPbqcnuETpAlgjdW7X/QK9RRReNtLKBvOyCPHatpAnPURwBdgTTJHgZOpUU/xMIswix2A
	dn2bmm7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuX0g-00000000Tcu-14Bt;
	Mon, 23 Feb 2026 14:34:06 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuX0V-00000000TVU-3mlp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 14:33:57 +0000
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-385bc6910eeso41381441fa.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 06:33:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771857234; x=1772462034; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ML132/96OtzaPEHr0g2FW3hc1YN90nAUiFVEwcI9LI0=;
        b=gfd9jNWtqs//o8tRc5+2Rb8mIDM44u/3zg4+uTjZRz+d5JMXqAI96bX1D6mFd3pjv5
         mOBM+b/aQ65qRovDabD/txPQRg5DS1UEcEHRxHm7Ww5obyqz0spB2+mR74+JALmc3f6i
         rBhsgBipxEfqrKK0jtw4lig1yu8ISqLrW74nKIzNaszzfDGfAd2XVWrlvvLFZnd8aTyu
         61YV/6LmMTIIg1VJHVbXEvJ+3UKq4pOlvBnIgQqboRjw0m6Sx5d6eNTmS0wK2OMRnaER
         GRxEffbbT9Fe95dYtfV3D5mqpMxQZ5YG7pBPjATU2lx3Jvc3w9CNeZVgkezDXU9n37dp
         WSuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771857234; x=1772462034;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ML132/96OtzaPEHr0g2FW3hc1YN90nAUiFVEwcI9LI0=;
        b=QEm2EJdNjQHLthOsRro2duXeMoiuZbX+wFZu7YL7cL3HtuSW7YHeRXIq1ql9fMGo1Z
         nAbmgPHyNNNuDHXhRVkaHflZHxUEOKF5FQZuVpqTty6bOtbdaAqE7eKLJaTL8zqHNDIi
         BJYAQSeWLSvWeq6VB4LoJPpUs9Vr0Q5oKpBhv1NQd4W1KcjaWbmFv6jG2y4NSQSshxT3
         8Ug/mvzcX+YI+WNGZrcEsmpu7z8vCJWXY/W2z68ab8L9Gpki2hRDfViaOvzoyt82l96y
         1MVoRSo+vxDT6JAmAdf3GQVQmRnyaHoo8zDPklCc+Kck7PkgcUUC15T5P2XZ7QQCA2ZF
         IRbg==
X-Forwarded-Encrypted: i=1; AJvYcCVsZR+Y76mRwTlELhp1+vINLSxVRdJzzJ5O5P8M9PZ8yp347TVwWYOHBBu+dGKvsQFrDJmWfJVpuQMB17Z0RxbS@lists.infradead.org
X-Gm-Message-State: AOJu0YyKDSlduv/Ra4Sylln0yxSV9X9s5AJD7RqopyOAbNm4DDHflc+I
	2TNHjswftn1ZrMbfglAgy61j1SQOWw+STpA7YhZ7dLI1x/xo8jTBp5tO
X-Gm-Gg: AZuq6aLejv6OaN9Orojxebm8LjS84PuDi8kBHPw0ewjM2tJyozf4WA8esZQnL3HyN8B
	Nspp324AvK0Pr5vlMRlOt/olv0xjz52ZgHcjzzeIizUUqqXVse/npH08+narm+3lb3Vcvz2tR6N
	gEd0CJnJRkk0bu9mjsDNO2BJvES0ujbnDCFn/Bn003ZTg1KvEaApOrnM9FDiZk5JzYQHzaXs9A8
	wzVelis7QlZuSldzgo6RnYhjdU8TtRD2A6zJRTzYQEQt1so9Jaqy9AQH/eEEM4xDPllTskx7vD3
	zthPFvlUtHyg5onKnc/LIktPdNL/UadYmRYXLJcyFrP6yW/tjlzbxdCWvJDUX9DJR83pCbBC7kd
	InuBAFkbyXa5dAUuxffxrWXRffAkISKf2MaKHdR6VA9aYPpXQUoUm5L29x9t7UHb+cw/HSDOhn1
	AcwEAqC4aQZtVvgW3LVv9UxSnirwOH9cMEWyaiS0SjCCR0yclv0CUGKRkm+wizEb9cyDb6+3lFd
	b7CjY0=
X-Received: by 2002:a05:6512:68e:b0:59f:6b45:84cd with SMTP id 2adb3069b0e04-5a0ed89c965mr2597861e87.22.1771857233501;
        Mon, 23 Feb 2026 06:33:53 -0800 (PST)
Received: from [192.168.1.135] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a0eeb16344sm1631709e87.37.2026.02.23.06.33.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 06:33:52 -0800 (PST)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Mon, 23 Feb 2026 15:33:53 +0100
Subject: [PATCH v7 4/5] i2c: davinci: add support for setting bus frequency
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-i2c-mux-v7-4-ec75b214718a@gmail.com>
References: <20260223-i2c-mux-v7-0-ec75b214718a@gmail.com>
In-Reply-To: <20260223-i2c-mux-v7-0-ec75b214718a@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3886;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=Rjlezx60T8d1CxFV2XLRaRAysWKBz62yOQI2I7gCYFM=;
 b=owEBbQKS/ZANAwAKAYiATm9ZXVIyAcsmYgBpnGVhzIZ66cT2UEVAdWdoZR6qcWocMoWj6ZvKn
 hmeycXUtVKJAjMEAAEKAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCaZxlYQAKCRCIgE5vWV1S
 MivUEACBk2EPV07U5h65ZnqBjP+Cy+p4X5YZKG6D4zgckGExFXmlEdcRGt7E62qoatNghWgmKzR
 lggqGF7c+SWIuyG5yZ+EkmViPiiumjqxdVjoP5vAd9X/ntfLcZkeC7+foO8svMqfwa9h9tylvsq
 he/CgCc+SUT6ou9I2FiwTCiRIPVnGzE0scsXQFbv90PZ4HfIGwRITiVXpaA3Fax2JEM4ha4lt1F
 Wwa3sqycWdmKpNqnhrIn9cJYN1Edht2beIk26F058Tyni7LrdOchQAlDZMS3f83erTCecv5ycIT
 BMJnBvxXQuqYN77I7Yl4kcJ3V0eZNQN0RrWrAjH2lNiDhD1O6/gItq9XkTzTDPNDM12qMZ/8ri0
 fy/38HH6WhovvX1ddnvk75EGwk9iSaF4aET3+VSe1fxNi1PGm95uySm3ZoAlyjmZC1hzLZwWOv3
 awfbuw9yYTbwTD0QsHvbxMztkYYG+f/bwOJI5lRzN4QOp5A50NO91eDPx/uvcYjGRmPcXHWkLQg
 QRbeoEbSC+bv+3QebrLbUwIbBIQe9Yd8unvHDCrP2SgDLamMfi9RzmdNI5FQY8UCs4gaA1+MV0a
 1db9GZAsypspQweAv+J5BWwoLZpuSSCugLu8I98gvX4QZrCr8jlCErAKq1gWwkZfKqlWWbPBs4l
 74DcwBD1h5jtkzg==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_063355_982358_D0585419 
X-CRM114-Status: GOOD (  17.51  )
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
 drivers/i2c/busses/i2c-davinci.c | 36 +++++++++++++++++++++++++++++-------
 1 file changed, 29 insertions(+), 7 deletions(-)

diff --git a/drivers/i2c/busses/i2c-davinci.c b/drivers/i2c/busses/i2c-davinci.c
index a2b578e0a534..96b78014aa51 100644
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
@@ -207,9 +207,9 @@ static void i2c_davinci_calc_clk_dividers(struct davinci_i2c_dev *dev)
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


