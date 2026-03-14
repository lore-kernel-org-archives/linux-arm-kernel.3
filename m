Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1175105F7B0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Mar 2026 09:22:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eSO1H+xcwrtQSAme0jF26QT4KzRAqEvRrObp3E2vgew=; b=CKoUeWjNiqZb4bbHZWenUJhRMY
	syFU/RwZIuFskXrLNtzDSmdMoBttTbvIFF1raNfjpX9F18cavS/wl97pCRKOGdifwaHtu6fangM2H
	JZ2iobFB7b6tz8Pk/0ehIXoxpUNAqSl6Tu3p8LVO3gysVtHAsfI6Kt2uciIOKRgV5FLpDqlSF6dbD
	8hGZQEH2MPDiJZieMd/S4ryWwt+/vqoz33gXMy890/wOY/Sy1UFOBvibEWEGcgRWVarq4Vwi8pbHL
	EJz6pOWXxsimdKnMhuXz9i9j1wpeSruSGlutWeN/7P0Ly3SJup0295tPoY6r1R3T9prWYkJ8Os+3a
	simDx3SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1LCg-00000001fo1-3TuT;
	Sat, 14 Mar 2026 09:22:38 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1LCc-00000001flO-3Ycl
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Mar 2026 09:22:36 +0000
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-38a2a59baa6so24864941fa.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Mar 2026 02:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773480153; x=1774084953; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eSO1H+xcwrtQSAme0jF26QT4KzRAqEvRrObp3E2vgew=;
        b=d/yL1v5muka1si2VGdZvj8CtbFiy5AoIwBEndISJjft+2kushjBuBl7vTtX+nv2vcB
         8VeWhMMqzveQNsqSAJzW4LV+9XNlL5dMa0sF9oLGlWOAPctRqBDChgvH4j1wivw9Eyev
         EYmeR2v01YDCF0YnkmnhxAk9jAqP/IdEEhxP+ZoDfCuE56OMwiQdpMaczS4+/emsaDv9
         iyhuDE+vrjZKNSmLDGMT3xYi33TYy2FmNHeM6rctnNWuKE9slQTthAZj0XXK8ZuiirSv
         7//f5MXsnbdtshp7fM/X9tov1FV2L8xCn+J2VCWOoQvKZHY0cVRC+2EmYf1MhdebfLFK
         D1LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773480153; x=1774084953;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eSO1H+xcwrtQSAme0jF26QT4KzRAqEvRrObp3E2vgew=;
        b=K9U+2b4NOBGQXCzfzML9SwtxSamgPS49aL/cp6lr2rdxXQuG0EqmLmVrAZRkq5ZKdl
         V3ShEUdmDIyf2NTvame239Wm6ww+4vQ1tPgG4gPWOjMJCSYXekDwnH35+YgPL0qc3ZEb
         K77+Z1wSwgt7w0HbX/j2nXllIRub6AyvQ+nhVP1MmFz8y/7+rdb2EzBucmbVVE5xRQUa
         pHHNAq24BElSaV8Pfds1c3V56fiULEJ2ykRFxV30uwy9O7hFVk5NSFcwRl+bP4DYaC7e
         OXpRySZMh3p3fcbhc0tFWYZcAekeejtMgI9cA/W2Ha62UJDz9o1+VJWUAG0CutcWuffo
         J6ww==
X-Forwarded-Encrypted: i=1; AJvYcCVPc5s6qKJD8AuzGtMIazvWTP9u/gilm0aZXNwduLpcKAqUONAGjnz5ShzTD+f/thQI6ApfBEdIDMqsRzXEA4zH@lists.infradead.org
X-Gm-Message-State: AOJu0YxK2TIxKeelTF7mlR+cTa1E+5EWuGPVFtJ1puyuL7azdGh15Ks6
	Bx5bltgnaJf9GrQMNbMnXRH2FDCFoi7RRQj9Tvbg1WbaIlP3g5CBhHRn
X-Gm-Gg: ATEYQzzZR98Kr2GX+OvnqwjGKc8CIG6g7uU5M1haa4nqO+9SvIUNfkHTg2zB+5XkdhG
	8o7YKi/C2RUAVf0TD3XBlEuzoah/JQIHRrRVr2w1wQ7m8fHBRBPHnFKQ61V8LZLRqbzwBFk21ug
	dkFbIGqxNNzEDDBBF08gruLxmjA7pAbe6cfxouoCZD92j+tcw9wTTTKUPC3oQ2Z1yykr8fZNZmJ
	t36e/inyUAcxpPyRhyno/Gs81xPQ4ypodXeYs+HRwkZkAHsETiM6ocUqmwjf9mNIPA4WXnXzEWQ
	gdn3Tg42DgkxmGNlzh8qIuSHoc+xdMF905EfTu6uevcS+/NQ+sly8VOe3MXtf2KKsM7PjMR67Lb
	SXGDQZ10W3tQjV032m2YGUBYoAyonjRU1ITw6mrjO/C3aI6KjyaVxRWtSyMK36Y8cXD0sRRu6mq
	1uZ8hnW3zVZQqZq3bTJWu1/ry8Pil66vhyFWpWB/8RCReamEk1Em6Jre89Xr6toSZ1e8DCN1tnc
	3QOyqM=
X-Received: by 2002:a05:651c:3242:b0:389:ff39:d36f with SMTP id 38308e7fff4ca-38a896663e5mr20481001fa.8.1773480152498;
        Sat, 14 Mar 2026 02:22:32 -0700 (PDT)
Received: from [192.168.1.135] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a67e5ec94sm18454261fa.22.2026.03.14.02.22.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Mar 2026 02:22:32 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Sat, 14 Mar 2026 10:22:43 +0100
Subject: [PATCH v8 4/5] i2c: davinci: add support for setting bus frequency
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260314-i2c-mux-v8-4-fb1738a4df0a@gmail.com>
References: <20260314-i2c-mux-v8-0-fb1738a4df0a@gmail.com>
In-Reply-To: <20260314-i2c-mux-v8-0-fb1738a4df0a@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3885;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=Lh7Dkm+/uvcdStnc/oNui4Wy85cMEfrtDS4KN8XCm1g=;
 b=owEBbQKS/ZANAwAKAYiATm9ZXVIyAcsmYgBptSj+uCJIvW+lUyvN1DTR+9pw5rD1oPcFBJd9x
 1nuXwaGxiCJAjMEAAEKAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCabUo/gAKCRCIgE5vWV1S
 MhQZD/sHVDGLWGQz/rWMZl6TcG+2SxgXoflaNlMTf+9HfNzomB/WDqheVJpLoxDWh5iEwNXutiZ
 /DgfKzqGuSOn3iEvj7s8BUcZrvBvhpsq/sRDTT0IFZwBa2TmdVpPhYfKEzSyZ/IZGnp/IL5s1Cw
 iEMsMwEAb70BG4Gg1ilq3tht6S94zis2zZvJ05IW8VcKMwYr0hUSnj5DryTk2ezOEIu3VIyQmTU
 GSCoqlhQC2m8dyaPs/LulYuIWXnrW1UAw0hVphSjYnv5lJfQ0UAMkRPF0bRoR7MFK0yWsrF35TC
 bvODG0nal5qsZdVDsWEHl6H6JHvU+bKK8HR3+LCJD42H58CkR24NukoCSU3xFbdPO5N0Wxxx6zv
 PDcP00RPve20HdiXIpprLCkno7w+Hg5plcX6yHOwH0d+9FDCfj/qLGTmf4+Xq/rg33qV2RHX+5i
 E4TAYLNtopB3xGeSZpDF7an18Z2Bm/Whq6Ts2c5/0pIJD6NrnqkrHiz+I6263E3vBlXEGBcn9pg
 Cl7jY/3ErUwyvF9epMwo2rM1kvoi/0yUJRrYanC3tMu4QRVox5nB+VK6MLTN7EMjlJqov7HrRNM
 BpbzImykbv5BLCd8LH2ia6RCf5EwxSDpLxFUxPfpBcnMnMJi+7J8KwACRweT5+GF4fE366haoaV
 kOzKtpnTA+6lUXA==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260314_022234_930337_20EB5CF3 
X-CRM114-Status: GOOD (  17.42  )
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
 drivers/i2c/busses/i2c-davinci.c | 36 +++++++++++++++++++++++++++++-------
 1 file changed, 29 insertions(+), 7 deletions(-)

diff --git a/drivers/i2c/busses/i2c-davinci.c b/drivers/i2c/busses/i2c-davinci.c
index 549fb22cdf4f..72bc3b286d20 100644
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
 
-	clk = (input_clock / (psc + 1)) / (dev->bus_freq_hz);
+	clk = (input_clock / (psc + 1)) / (bus_freq_hz);
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
2.53.0


