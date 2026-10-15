Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1BCBCC6B3A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 11:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=81xDklTWGU+AmdrjBK/MxEzrPsfFoRwViVGtyxcHsTY=; b=xlA9mXoSOfpybm6n3jxOOImNvB
	FAQuyFjoE4Xb1sJGwB50rDcGeghS+wNpIsNx93Ph5tCUJLZe2oQBXIyjZgerB+9AJvKRcHiIylBzX
	7HGihuVV+srFQiuBL8gGZXQeP9U8RWLK9tEQu7+8B/bDnaAmbXyzHkZEO/0KhURlyJd5UmzDuZEOe
	UlRc/ez2dkoPWQWOMQD8p88LOsn3D8uJHMOQt780HE3HqgETPGtZYF7fb8KNmk03GLMtnCtlRA6C2
	CyXEAPoAW4Qg41l6IEvb+Jm6mozhJfN2JiFFL5nT9gfBb4ugJRgp1wIVQLiY2TlCJ7D56KXuIPQaS
	LKNMjaUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHJEe-0000000HVkQ-2Q9h;
	Thu, 15 Oct 2026 11:02:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHJER-0000000HVbf-1JCG
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 15 Oct 2026 11:02:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=81xDklTWGU+AmdrjBK/MxEzrPsfFoRwViVGtyxcHsTY=; b=gGTKdI+Gu59US2U2t2OqzDPaUD
	6tOTIe9jXZs6pLCGAVry/MuABc4IEYVgYLqXqzrHGKav/KgWNZ9Q98pLjCqqPrj9QOrayPSOVHF5h
	XnZW+/Mi3TI+qPY+K8r8qQf7jtqyY06EygssxzbagekGT3Q5FoMxfu/3Lyc016wD/mUlYuivOG/Fp
	IjZIuzy+aDeozNUFmr3SN9ZXZUGq+ArSNtiaFCyUnXMJL/Z0xXlOQoaQojb17AVGfTZeUCFp/jAYN
	BoxvTaulzdMpUVU8/mp4Ab3+E/tItCq/GMWLUDTXLH4KqNQxb8eoZcxa8R0fl8MJPpe6nBAIOOINs
	dZ5D/71A==;
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xHJEO-00000000HTP-1XAV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 11:02:42 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-5bccc73eea4so2634332e87.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Oct 2026 04:02:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792062159; x=1792666959; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=81xDklTWGU+AmdrjBK/MxEzrPsfFoRwViVGtyxcHsTY=;
        b=GxBuc9vfotyRDC8T929vBOcbfW052bgGizuFe2bJEUyWAduHoy6FiRbSx5svRpgu1s
         uB3UckK4XpXfHYvjv5SAd2PQM96uz4Lb9EmZS7BpEhRpFWM/gdg/u6Rwzh4yLdbfKtqG
         XffYUyA5vLM7ysRKHoLuLleNYz/emUO8FBtFjopo7sc5aOdSGTT5rORnIgF8GFmDdNyq
         uyFMIT1UCNt985q/Usmp5MPksHpIbzKh0X/OQUDLQYJ0qsJ8Oftb20CqcacCtYlh5MMo
         Br72LnsG4UM8aRZzkReLQiDPy5alaC3aKi0dQuyXiT1V51U74brbB4uuD1rXPKQ8f6gd
         Kv3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792062159; x=1792666959;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=81xDklTWGU+AmdrjBK/MxEzrPsfFoRwViVGtyxcHsTY=;
        b=b3JzUaXjaylD9JbYRxbeN6FPPdEN8N3hfuzLrgXx8pJM/xG//cofd5MAlWl3AhVF23
         v4NNzBVO7tQBQvBM5nVFdaIhx7LKGxtnd3WfZ4gNe18NokVF9IilYozmjMb5+ZFpBZ3s
         L5hRV7q+G57cKHy59AVnzPyI9kD6R/PM8XdzlZAISHT4wbceYbkoKC9jVBMFVOdAWKyz
         9n48LsBYXMSd2wXPx7X5i1BKJmNIg00x/pp9YT33tRLE49agcj6sByvStm+GS7j/R/Uc
         Qa5S4kANSy/EyKnQK9i/R9xDeb4kurh68SGO4t3ZxgFRsEVslEPJ0k4DVJ32sAYm2mVL
         1M4Q==
X-Forwarded-Encrypted: i=1; AKwUvBzvHyZPOAFJZ/o9BXOsB4gRgg5sSMCMBrlf20uCw6Jtte1TBA944LMCcVPynPzm1/LFXHH7kCRPyazYeJ+J8CKx@lists.infradead.org
X-Gm-Message-State: AFq9FYI/+eVyZPyLVGNtqXUHY/4h9LP91hLdY9GS/dezPyevLlxaXnlR
	hUkVbdD251hm9hZ74a4II2gqbizlb+PTBXJCpNgrZ/Pbeg1EHb26xBB4HWFTO6VP
X-Gm-Gg: AYBFou36vqsOVYDHO2PghAscs84BlLkHpefLeCReAcSd/i92U6/mGjL+8kxoIw8sdNo
	FReBPLAyiYGMMnIaoEpss0TKKscTikjv+tarUuQ+nb08CKPW2qSgEfEFQLeEmCz7lo1AQFeRtCe
	bHgbGOl1n8lXieeW9WpnMZuxwERSYwUyUUAEsECRXcP5WfJt/ebewGmREwhHl6MLVjWo+D6f5y6
	Z4Y6sjHCyFO2N0FIH/oDp1OxCQf6QkhWFc2gAzf28uo/HK9PjzIue0XlU0NZIaQf+oUtxig5ZSu
	Blu+UUXuYXRTppYjRCEKPEYuYs1R4Wbb1tkO1sS5nmxLTBiiEs6/2u9dZO6VlNEXLGIm0FsPz5O
	hyKLPjn1Mi5kOzTWF3UfQyU0dVz5sB4B6oPRzd1s/H9es5Gzmcm92BzsbHp8SAO+Ei9HQ065f1g
	vl67oEofnjIx2cv7sbUu/4b7dLAY31gQjZe2Z2bW2TZBo6CuvBaxih9K8Wmm+jOa2vG+M/KVosC
	qvfrU4yatrUyvaN8ni3ZBvVL/Od1Jgx4DpYyj0jbI8cv5ks9BQ=
X-Received: by 2002:a05:6512:6406:b0:5bc:e430:9c8e with SMTP id 2adb3069b0e04-5bce4309e16mr4572278e87.2.1792062158525;
        Thu, 15 Oct 2026 04:02:38 -0700 (PDT)
Received: from [192.168.1.135] (81-229-40-193-no2450.tbcn.telia.com. [81.229.40.193])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be3739b5d1sm905465e87.22.2026.10.15.04.02.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 04:02:37 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Thu, 15 Oct 2026 13:01:52 +0200
Subject: [PATCH v13 5/8] i2c: davinci: add support for setting bus
 frequency
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-i2c-mux-v13-5-778a12cfe93b@gmail.com>
References: <20261015-i2c-mux-v13-0-778a12cfe93b@gmail.com>
In-Reply-To: <20261015-i2c-mux-v13-0-778a12cfe93b@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4390;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=e22RJbTG82qr6LFGcR9T8dUEuzukljfrT5Pej2KkyeY=;
 b=owEBbQKS/ZANAwAKAYiATm9ZXVIyAcsmYgBq0LK3mj507AETOdbw46lZppl0qAw95zzMLoF8o
 0d940H2IMaJAjMEAAEKAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCatCytwAKCRCIgE5vWV1S
 MlAyD/0fe/EPWjUKTiqAoGRE2frTsmsr1CF3v0fMY8hyetxKC0DXLxZXMZlYeRn2LtemqfBE6T0
 d04rmEdaXKko3c/xo5ZlddxD42tl7Eu3+SH8NnZxSXb+x+Z62I/0lcPeAPt3b7nJPEczZIMY3io
 0bkUAm7heIPNHiU+pLd5ejzmRX3OhJLzWBGUmaLxwq0zyKXWO7d4w6jSJ9NgqWClIC1fg1m5t4H
 GcPVhWKDPdketPaclvQw6W6mRZlZU5vtfIaVksVaak5zla5aU9vOY4Xsh0tLUVHV5kKQYgYXnaA
 rl7Sdz5PUnOctAdXxK33Ruqo7nkc42QcVdw8sXvJsL2lRnyZcipEvbB/2E2ACrKrO1y/OKandJ/
 4DSTCv7XE6k0gx7qEZJ/TQh+nSggX5+plUESl6P5POa9hjHjHRyljdsXfyAgLZgCI5AHlJ2nmnl
 7UBYOY19xeyLFbMvjjZNkzHf6y3ZqQVI3l2rZQrt+f9RIowDWFhkrleeUs/109d5FuSW/XwUmWW
 3I2qr74vubjU46fH2MK9BeckQKzBJFzd/6d/rGpaAmyuT9AkO7OtL3yLLkgStVHDCbxeKje2g58
 WBFOgeJR10hvHuo2L+kaQdjBenD1ObHIq8aIdlw20G6O2WYdyGJu+QMETKzicRCp7l4CP7O8WFP
 rxzVLVKoPyaj8vA==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_120240_549079_760DBB60 
X-CRM114-Status: GOOD (  20.25  )
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
 drivers/i2c/busses/i2c-davinci.c | 37 +++++++++++++++++++++++++++++--------
 1 file changed, 29 insertions(+), 8 deletions(-)

diff --git a/drivers/i2c/busses/i2c-davinci.c b/drivers/i2c/busses/i2c-davinci.c
index f543997c31e9..e27cb3bbf34a 100644
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
+	clk = input_clock / (psc + 1) / bus_freq_Hz;
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
@@ -723,6 +739,10 @@ static inline void i2c_davinci_cpufreq_deregister(struct davinci_i2c_dev *dev)
 }
 #endif
 
+static const struct i2c_bus_ops davinci_bus_ops = {
+	.set_clk_freq = davinci_i2c_set_clk,
+};
+
 static const struct i2c_algorithm i2c_davinci_algo = {
 	.xfer = i2c_davinci_xfer,
 	.functionality = i2c_davinci_func,
@@ -755,12 +775,13 @@ static int davinci_i2c_probe(struct platform_device *pdev)
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
 
@@ -800,12 +821,12 @@ static int davinci_i2c_probe(struct platform_device *pdev)
 		goto err_unuse_clocks;
 	}
 
-	adap = &dev->adapter;
 	i2c_set_adapdata(adap, dev);
 	adap->owner = THIS_MODULE;
 	adap->class = I2C_CLASS_DEPRECATED;
 	strscpy(adap->name, "DaVinci I2C adapter", sizeof(adap->name));
 	adap->algo = &i2c_davinci_algo;
+	adap->bus_ops = &davinci_bus_ops;
 	adap->dev.parent = &pdev->dev;
 	adap->timeout = DAVINCI_I2C_TIMEOUT;
 	adap->dev.of_node = dev_of_node(&pdev->dev);

-- 
2.55.0


