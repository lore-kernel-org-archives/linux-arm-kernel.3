Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD5F9C43602
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 12:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o9uIFX9gmwYckmh1V7qFtkicRfJ2rKc/mhUOwAgiSoc=; b=N4WojF/xagO7c3G1aq/IvUmXpR
	mC/PM9+SwNAzgf5gCOG1r4AbUcfsuDOBekadYH8tZlZFbZ/KlGkSNYRvPIuBbfozZzJnq6xfn3c31
	96Fl2Y0wd5Tc/Ez+1EnRPl7IGs4VsXyNgaMPsMGsQz07oUw3bbNN8iEZE9weaWQNcN49RMYQ6ugn4
	UgF6mwRhEOuiq3pRHDXkePzDkr0EwucHc0Pm0gVHoOX8qya25wGaaZSrfFOm6WGq6mcupaWZz1W3V
	Um72bCfu9cPxy8exWVQzmsmzy+DbQUmZ7IuPIuBPniv93FuHfZ64RoK3Pve+TDeDGUpdAteqqje3D
	QSZQKWIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whRD0-0000000H5OI-1H5d;
	Wed, 08 Jul 2026 12:16:58 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whRCu-0000000H5I2-2Cy2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 12:16:53 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-5aebd52488cso647733e87.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jul 2026 05:16:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783513010; x=1784117810; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o9uIFX9gmwYckmh1V7qFtkicRfJ2rKc/mhUOwAgiSoc=;
        b=ZN0GeaCMbWkT+7Vn1DJreSpxn15YhrVlu6MMqWe8hhaZIvUZQtwPhxtgAuax72wP/v
         JiRhD3s/XUG6OKfDj3tuJUAb8rx3F9DRvZ5t6kDYKNwKd46dYCrzRuJ7MHwUDqJzUNW8
         8DBhGjBZnrCqpmnuxSE8Oee+z70TlioYpSvVYvuHFVOG0v7JNj9FQpL+B98xwUhZmIP2
         Q/sukEMqFHduaSYHGaB5rBiFHZpV4IHi8MwZpxRw9K7YMkjgeHTEuZ//kj4QEfDI0Zj5
         I/4+jNc+ycaECr0kwFBGaycBj37edHwIRdh/dqvqqop4Rs8oA/vB6dH0zMtABcbK36I8
         O/ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783513010; x=1784117810;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=o9uIFX9gmwYckmh1V7qFtkicRfJ2rKc/mhUOwAgiSoc=;
        b=iyb/Ehh7yR2nwFQQRY0Eb7VhmzBdc1PAnFjkfO4K5bRf/BCiN/4V3P22T7IAihCgEM
         NiTbdOQ/LadAfN6kz+MbiOqXqAjOfC5nJU1sWKG3WOSQ8EESMBEegsOZ9Snpd/0IoDrp
         tsIe7JFdJ9Kdg9YDONe6xPlY58ThdmkGW0BOlYImqs7PDadJ8enenJpAwyX+3L4JSxAy
         FDoIwRLlxbkjeAFCNm5Qbc2tIvJemSprjqBsqCVBPhKBOO+YTndxPoi6OCUZOg8jxmBE
         0Ux05a13po6QtPXxrYDgHlxtXXjQ/qLQTIIZxbOMH9ARv5TisMZ7+WHh3qtZ1oKZvtfz
         9r0g==
X-Forwarded-Encrypted: i=1; AHgh+RrjejR4JF90iPHtB6kOSJXK5fDwJ3I7DaGYdH0fVDkJDNmiacGsu8WIc4hbYZho4tYpc5oICgcCYoB7gnJ1X3yZ@lists.infradead.org
X-Gm-Message-State: AOJu0YwGIoX8eHuO+2OLwu1wqsjBfq6lwEO9iQkrV0CB9ZjWeYEuZ4IO
	9v33XBszS/3hTr9pkXqOvq3HSd8Wp6Q2b5x9KBafCVMGuITx7iekMf/YR1oqf82Cmtg=
X-Gm-Gg: AfdE7ckWqcCR03VKBhVnlb58EciRmGaRmXcw/BXr5OdrcZ2htt6mc0nm8B2mZXO2PeB
	NcURcxsbvCSAeC5gA4v5dFsijfqQV3Nj0M1u2/kwqJYfEEo3kYUQMxCbAkynPWV39IJ5sMHVV64
	9hYCCnYvFFAoM3XV8IzxYaZkc1IILSj05a4qqvYB5uuVKgFb2g/wfrZd+I9KGyfoeHfTlooGQTF
	vsZuXRcz5g1zwcqmzaXVNjv742ZJntgnft2nlc/bb2uMxzQv6rClLlrHD1jj0/gVFEhmxJ9xlbb
	fIzn+ljhgxDWbaE0IyHrd5DJGK1IpCFgjnmoF30Lq7WXOJnBZHk5WR+fXZ8IHCy3KjT55v25h3X
	OZkfXldkhCzJ1uxQU87lnrdrw73qIjCKIcdyxY308ISmgUduEW2WSYDaW6BuyuUPlBqMSaXF7Vt
	ugJAAABgCe9FxWTWVw9Thfe3Olgq06oZrm/O4hZKfHljLvLb9ZXXc1nIkUuQ==
X-Received: by 2002:a05:6512:4604:b0:5ae:bf31:54ed with SMTP id 2adb3069b0e04-5b01141b97emr562782e87.7.1783513010229;
        Wed, 08 Jul 2026 05:16:50 -0700 (PDT)
Received: from [192.168.1.135] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed13bbbc6sm4471459e87.41.2026.07.08.05.16.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 05:16:49 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Wed, 08 Jul 2026 14:16:16 +0200
Subject: [PATCH v10 4/7] i2c: davinci: calculate bus freq from Hz instead
 of kHz
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-i2c-mux-v10-4-09dca03c8a15@gmail.com>
References: <20260708-i2c-mux-v10-0-09dca03c8a15@gmail.com>
In-Reply-To: <20260708-i2c-mux-v10-0-09dca03c8a15@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3236;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=rB67qOCn48aLRV8HAmCeHp1RUlscq2JCZSkPmgPhVzA=;
 b=owEBbQKS/ZANAwAKAYiATm9ZXVIyAcsmYgBqTj+jLNWA8FIa1T/o8BCVuE3HLi/7ll+OQIOga
 YdoyWScpUiJAjMEAAEKAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCak4/owAKCRCIgE5vWV1S
 Mk4zD/9d8cJ3ypeLwdc6f9ef8oHp6LU3OlAg2V13Gw/gtp40jcVdUdH9TdBF2SmY8pwBhmOgCvm
 cV0TWsiy/EaAjFbqPf8pzhFN8hsB00kdoRl16tuumSAscuYt34olo8iLYoVj2RvZQEzaCQ89HKY
 5MHuhI8iMKEcaT1L4+0Q/lZOv4pOAU7FMm9OqDSxcuGb9fbw780FyhPG954UzkVUFle3XTl5CoY
 Ty26dlqlgEp3uPB6ZI48kI0mHGMbKUWYbe9U1DOjBVUMhojRUmjL0MoWMYd1xEa3CB3kTuJfHRa
 woxNHopGmelRRWAoUnToOS1+QN5JRUtvfivOuuwtcgp7fb6lgRaZ0U1m4hbBscItnpDTcvOyxnS
 pAh+diBahUlkoSE/JT2TpOVw3e6EgRySw5ldWxh1uj0Lg46vbKrFVFIbdZaYM5y3CnE2St21upv
 i2aKPB/8xrsvTaxloVh2jy17qKEjL6pKE92jKF9wwYeMVTuU9EsfbC/sDUFhanB5W+I/W/iNEPE
 k+X4RAwcMJe98J0hisTnE2whxsMK5kATxSzcxh428Dzn5FFtikr49aniKsELpHwFOx6y2UvC1qD
 d9sSBZfM4lNdG/tAXlsYtYFVfLU5tYcDOngle7Xoa/rK+ArGmtRC4HU4dNiwoBJSQyw4pLdvokG
 Gy1xiRPAn7JqyPA==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_051652_608242_3F39388E 
X-CRM114-Status: GOOD (  20.23  )
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

The bus frequency is unnecessarily converted between Hz and kHz in
several places.
This is probably an old legacy from the old times (pre-devicetrees)
when the davinci_i2c_platform_data took the bus_freq in kHz.

Stick to Hz.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 drivers/i2c/busses/i2c-davinci.c | 20 +++++++++-----------
 1 file changed, 9 insertions(+), 11 deletions(-)

diff --git a/drivers/i2c/busses/i2c-davinci.c b/drivers/i2c/busses/i2c-davinci.c
index 66c23535656b..549fb22cdf4f 100644
--- a/drivers/i2c/busses/i2c-davinci.c
+++ b/drivers/i2c/busses/i2c-davinci.c
@@ -117,8 +117,6 @@
 /* timeout for pm runtime autosuspend */
 #define DAVINCI_I2C_PM_TIMEOUT	1000	/* ms */
 
-#define DAVINCI_I2C_DEFAULT_BUS_FREQ	100000
-
 struct davinci_i2c_dev {
 	struct device           *dev;
 	void __iomem		*base;
@@ -134,8 +132,8 @@ struct davinci_i2c_dev {
 #ifdef CONFIG_CPU_FREQ
 	struct notifier_block	freq_transition;
 #endif
-	/* standard bus frequency (kHz) */
-	unsigned int		bus_freq;
+	/* standard bus frequency */
+	unsigned int		bus_freq_hz;
 	/* Chip has a ICPFUNC register */
 	bool			has_pfunc;
 };
@@ -209,16 +207,16 @@ static void i2c_davinci_calc_clk_dividers(struct davinci_i2c_dev *dev)
 	if (device_is_compatible(dev->dev, "ti,keystone-i2c"))
 		d = 6;
 
-	clk = ((input_clock / (psc + 1)) / (dev->bus_freq * 1000));
+	clk = (input_clock / (psc + 1)) / (dev->bus_freq_hz);
 	/* Avoid driving the bus too fast because of rounding errors above */
-	if (input_clock / (psc + 1) / clk > dev->bus_freq * 1000)
+	if (input_clock / (psc + 1) / clk > dev->bus_freq_hz)
 		clk++;
 	/*
 	 * According to I2C-BUS Spec 2.1, in FAST-MODE LOW period should be at
 	 * least 1.3uS, which is not the case with 50% duty cycle. Driving HIGH
 	 * to LOW ratio as 1 to 2 is more safe.
 	 */
-	if (dev->bus_freq > 100)
+	if (bus_freq_hz > I2C_MAX_STANDARD_MODE_FREQ)
 		clkl = (clk << 1) / 3;
 	else
 		clkl = (clk >> 1);
@@ -242,7 +240,7 @@ static void i2c_davinci_calc_clk_dividers(struct davinci_i2c_dev *dev)
 	davinci_i2c_write_reg(dev, DAVINCI_I2C_CLKH_REG, clkh);
 	davinci_i2c_write_reg(dev, DAVINCI_I2C_CLKL_REG, clkl);
 
-	dev_dbg(dev->dev, "input_clock = %d, CLK = %d\n", input_clock, clk);
+	dev_dbg(dev->dev, "input_clock = %u, CLK = %u\n", input_clock, clk);
 }
 
 /*
@@ -269,7 +267,7 @@ static int i2c_davinci_init(struct davinci_i2c_dev *dev)
 		davinci_i2c_read_reg(dev, DAVINCI_I2C_CLKL_REG));
 	dev_dbg(dev->dev, "CLKH = %d\n",
 		davinci_i2c_read_reg(dev, DAVINCI_I2C_CLKH_REG));
-	dev_dbg(dev->dev, "bus_freq = %dkHz\n", dev->bus_freq);
+	dev_dbg(dev->dev, "bus_freq_hz = %dHz\n", dev->bus_freq_hz);
 
 
 	/* Take the I2C module out of reset: */
@@ -760,9 +758,9 @@ static int davinci_i2c_probe(struct platform_device *pdev)
 
 	r = device_property_read_u32(&pdev->dev, "clock-frequency", &prop);
 	if (r)
-		prop = DAVINCI_I2C_DEFAULT_BUS_FREQ;
+		prop = I2C_MAX_STANDARD_MODE_FREQ;
 
-	dev->bus_freq = prop / 1000;
+	dev->bus_freq_hz = prop;
 
 	dev->has_pfunc = device_property_present(&pdev->dev, "ti,has-pfunc");
 

-- 
2.54.0


