Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C8BBC44506
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 07:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LK67j8GtIdgh2zXDGYw/AI9RtdfrjczxIkn8lzlmvug=; b=keoDOK1m/ZOa2mhMaYSNvPaa+V
	Ssl7DjhVRltsPLDipCqX18H5Xw0+QkTVhyIulA8LotcPbCY57SJDKd6/TD7sIGh1JfCYsXJmxCwSy
	ATZUsCc8+4nBWWTcZ1HlPlQmlusmL9rysHHBCOidMT5W3VkRzdaJ1SiGbTtHZ7xH6ZdyjTi+7+fOe
	j6Ed/ylenzSaeDCEBCycmjDPD9fKxUgx89bwMYwwsI2v4rMldFDdjRBHu/Kb4tkt2aPlNd63MrsLz
	fRDSBiuUR2jiGC0n7AwkfEdR4KaR3EW09zgOpJqmoL3SZMl2V+Mkgm/K/VASf0e5Na7NArXBrhOFs
	RqwYCsKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjAyC-00000008NLC-0AOC;
	Mon, 13 Jul 2026 07:20:52 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjAy4-00000008NEi-2Nyo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 07:20:45 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-5b14d1f9315so1110774e87.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 00:20:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783927242; x=1784532042; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LK67j8GtIdgh2zXDGYw/AI9RtdfrjczxIkn8lzlmvug=;
        b=cljBtcJJcKlmuYglwjlJk6hb5gS9SFD5joBcUKzpzVsG3V5z6JhXL28omSwZdCtadf
         rorFeauCFsYEXgrliBhEBfg+aWpo8aFOCarLb5/roJrH+0COwph/iU4e26+mddVrjclY
         oq5uG/yvNGtXZO3pu/ZGH9zc36sJg1lxEjegvYcJrZwO11IKuvA/oBqszuI1nUCk6jk3
         3GZW2VPTd+mOTMBlF+HEOu1jsZVsNpcuc8pGfyiXSOdow5CMdQzGdm0H9qYxFPguSmok
         HIYLZ2O/rZn8svYDJyJnFdt/b7sWOCJA3Hv0e6Lb5TF6RzxoJBGR9T3W5EAsAjWY+I4p
         1wlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783927242; x=1784532042;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LK67j8GtIdgh2zXDGYw/AI9RtdfrjczxIkn8lzlmvug=;
        b=sev3iVd1RHMQCLtG4z3c2yCKnp/fKaQS/x0IlGEBUTFMmEBU0hUhlRdkyL2uKYINJZ
         biIeamN1epIR0u4ofTrXAOcUWO6L2zu+hfd3joW2Kt7EujruMWZ3StWNqkSQ03K2WjyA
         1u0G/0UfKJ3BxG4fiyls0MkIwZrfdbYDSGPUfeTe2WST6xbjFrOZUcL3daX9vA1iUhH5
         0S8oPfjWAikW4qcsjcukHtcIt/3AuYN332mHLvs7odD44VTsiRfl3Y7o4ICVhz+5xUVT
         446/ThJWzHqquaDphv+EIAEeZYKIM1RFiaBJ9uzRFHt0RMMAO596SmbG/OgflHd39txf
         Zpuw==
X-Forwarded-Encrypted: i=1; AHgh+RqPG0WfJgrn050Lqm3UxkDmf18e9Q1Xgum300rBAf4WKis/wsGN56zk4ymYs0ePksaAE3nX6GI/FiqqPbntCkyr@lists.infradead.org
X-Gm-Message-State: AOJu0YxMnJEmNrAct/FxuOrB/DY9w6LpnqkOpXNRZN5jEc9d1vEskWi1
	scJPOP9dppw5AiP70ACJflZImg1VtaJ2xq2YbSAc8FoX/5gtO3e8FegySXgzTX9ghSs=
X-Gm-Gg: AfdE7clN76xL9b8lgaFmtgfbNJ8IQLDmN+Ia+IfYQr59UOrhr9KWTA+8iEZ4TBupc+K
	SfNCyuUVOFkXlapftUEFJLCMhhKR+dyInkzqVjN56G77NQM8iG6R4XOjD8ba2SnVs6TuT9fleil
	Aljy8AUEEvmP4wSXkNpath1l6NPOP3PEslBgkYlAougVMTeSKrMXyNhX+gH5uJ6HeSdziGpEsvv
	cpQ8exDgvNoz2LAvFOus3515YFvfj4n3TiJlD/rBr2TRAJehSm58NK6wa76sdAla8U4tVpXwJAm
	RSEW8f6JD2+dR06jPLlLcJnwKPT4bbeKqwcB2jnjbK8+WO8HHXqjMfaRuMw8syYjE0VRDq8ct7k
	ar9WxDzXCf8Nby/8PFRz9BVuCrcIE4fyCztyVOpcCkrIz+G6/ZrLLwyEI3Ov5a2IFWydz3+0nuB
	uj+oXojf6s9I5hqEwnhuwDaNd0VqmTsyaufudNyMG08iFxBWFQbkq2/7ciNw==
X-Received: by 2002:a05:6512:3509:b0:5ae:a9eb:eff0 with SMTP id 2adb3069b0e04-5b0236b3f00mr1956757e87.57.1783927242235;
        Mon, 13 Jul 2026 00:20:42 -0700 (PDT)
Received: from [192.168.1.135] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b01ca55723sm2625636e87.35.2026.07.13.00.20.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 00:20:40 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Mon, 13 Jul 2026 09:20:01 +0200
Subject: [PATCH v11 5/7] i2c: davinci: add support for setting bus
 frequency
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-i2c-mux-v11-5-72bb8af8ee8c@gmail.com>
References: <20260713-i2c-mux-v11-0-72bb8af8ee8c@gmail.com>
In-Reply-To: <20260713-i2c-mux-v11-0-72bb8af8ee8c@gmail.com>
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
 bh=KipNKAzTJU8VgRjKDoGKNRn5s5XpRFE3NoXWRS5HQQc=;
 b=owEBbQKS/ZANAwAKAYiATm9ZXVIyAcsmYgBqVJHEIYnKNxtWilpVrad41XofG86sGu06CkLzf
 K82KPt+QaWJAjMEAAEKAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCalSRxAAKCRCIgE5vWV1S
 MvUCD/9LWlczj0L1fn2joODNFGQb5woOPuSNDMMw85B4V5Wrc2ForgHkbHfPvwBjF/xVQ6f6JS8
 SuDQDnzIqvsuMFzw8R5LfUmm5ueZIDPhQmZbVGXJgzyCl8xO0tq0uOHYOHbaICriYM0XlkKBWBw
 e1uQ92LgMebc+FmEQJFjjbWHMKWJ14QHVADKqiVF7t6rl6xYixN10JDxEQDJMpXlz2W5OOu220h
 +A+ExVcp3Y770NBaHD57rNHcbddOxCdB6UelwsqFE0sYf33EYrLzV9IK3VnuCbunKM6LIbFPJ+Y
 M5top4ePflHSPJ4VN3z3kH20ou2P6uq+lyEv1/rWbpUhChUyapBwkpLLBY4AB+bxyMA9hq9lLzU
 5C38tYq3hsYE9j/3yG8QwYstzhpDUR40OnPz+IWxZv5iXNf6FMbOxgBePiFGBUKgvHsIhYNK0JU
 gW6wbOettVXjgAWzW1B41Mylp/Duo4a5YVKFFb1luIoAsexGN2xyJLjkBBeB/6AqsX6sD8KlMck
 NgSDCk+V42y/Hd2cJ3a/VCKTjG7qwcvFN8B4SYk0iWMj46H14iBwhsabi4KDbA3Y0dR+8pNu/HP
 zG5OdeqB1JzXFJWR4thJBzZfhQ+SbXhzY2gYYt+pPQ6SAul2lHuvEu1fjEPaCCgsBbb6pyvmNK0
 D2kerlOLYIt/03Q==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_002044_658880_E026CED6 
X-CRM114-Status: GOOD (  19.50  )
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
 drivers/i2c/busses/i2c-davinci.c | 33 +++++++++++++++++++++++++--------
 1 file changed, 25 insertions(+), 8 deletions(-)

diff --git a/drivers/i2c/busses/i2c-davinci.c b/drivers/i2c/busses/i2c-davinci.c
index f543997c31e9..06e8af83df0e 100644
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
+	u32 bus_freq_Hz = dev->adapter.clock_hz;
 
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
+	dev_dbg(dev->dev, "bus_freq_Hz = %dHz\n", dev->adapter.clock_hz);
 
 
 	/* Take the I2C module out of reset: */
@@ -279,6 +278,23 @@ static int i2c_davinci_init(struct davinci_i2c_dev *dev)
 	return 0;
 }
 
+static int davinci_i2c_set_clk(struct i2c_adapter *adap, u32 clock_hz)
+{
+	struct davinci_i2c_dev *dev = i2c_get_adapdata(adap);
+
+	/* put I2C into reset */
+	davinci_i2c_reset_ctrl(dev, 0);
+
+	/* compute clock dividers */
+	adap->clock_hz = clock_hz;
+	i2c_davinci_calc_clk_dividers(dev);
+
+	/* Take the I2C module out of reset: */
+	davinci_i2c_reset_ctrl(dev, 1);
+
+	return clock_hz;
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
+	adap->clock_hz = prop;
 
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


