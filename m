Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0553FCAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Oct 2025 14:42:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b2uUwOXeOx+ZJwhfggQur4FjGWmefpICu6kR9jNyeuE=; b=M0+oPT0BPIp5dTaeu+IWTtQFUz
	zC3s/MD/XbJH6wGNfhNG7agjHEp/92F3fGvEzkRyolK4INKglAna8IuP3EVtcilJIhDvf5HZKZKaE
	EfQxX9B7ShlbKIlt2pTvSok/25NjESDRrhrQvajJGHB68qsz6puqPr1hIewDxLiHJT9C9AqLETlH8
	DpKmpInxre0zSIseLMQvCAmM7PDRuefi6rktufG14Dz67HTt0UH8wiyJ+SRZQl1I5I72Vx2ySh22G
	cbg0kizXYGl+TMcH0eCg2rfM0PdT2OAgJBPCnmGYvJqkLK0D/KrHXPBQq0Ti1VG9Q4ZC9eKuMInCT
	dEvbT9xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4KVg-0000000Adsa-3eZt;
	Thu, 02 Oct 2025 14:42:20 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4KVd-0000000Adod-36rb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Oct 2025 14:42:18 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-57edfeaa05aso1379081e87.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Oct 2025 07:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759416136; x=1760020936; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b2uUwOXeOx+ZJwhfggQur4FjGWmefpICu6kR9jNyeuE=;
        b=hnv60S29y75xXu9ZKEgHRlbMzjcOlb+WVq8tL+GRfEwmQSgZoaZc42sNkPNZOBIkAt
         h0y/GZzgRgfp/r9NFTyD8qSB9i5kzs7Kru1z4xzhQ5W7tcDMLpUh28WudbyG3U7fxROX
         qJ7Fu1CfWzTaZJHC6ONt6GYyxGbmC2w/sBXwRn6qSFuqWxZKNA7u4eKDvp/cfx+lMj6W
         gMETiIrlHbBUnLN0gWWa6y2aLLHO+jQO5KC6FAAzW5k+3d+8yjd93brHcsOHslh+S/QN
         m1Cnz2l2NkirfEAaqX8FDfFLiwHcNZT7QUI0Y9SjxIrMYDla7f/hMSvuMfUUF+D0wv/O
         o2/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759416136; x=1760020936;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b2uUwOXeOx+ZJwhfggQur4FjGWmefpICu6kR9jNyeuE=;
        b=jwm7d0VD/b9RcSJrLMG3LI5Ns48ultu+yuBpaivz0KRuDvoTEvbj++WeQh0yBh8RxV
         Ak+AnwLUolDfEdaaewZu6tATTi6O87vNMtGqY7PLZJGX4eUKXNALm+irFgYlwVnQfQo0
         1pWcC2198gM+HoqRh7bW+DpReLGa5Zin8jJDhH3/IOqGeK3RqbDKtx/1+BCLeuOqZnfA
         BlfJqFFNTMnWeyJlsr3aeUbpiqOsgG3KBxAPQmfMk+/WXZ+Tn6Br6tq3xDjlqwcDc4/Q
         asjQ996kVK0Mh7Nu1aKvccDn8dzV1sW2rnFkp/uaS5AM7xrUhi6dfLvVIzQ2asxEp0nO
         fuNw==
X-Forwarded-Encrypted: i=1; AJvYcCWBtMzS6KpycTG6vtbik+/UFaOoKZ3D9SUW6Bc9PC5g+CK9WxODSsCDJ/SGLs7J1igNKNugHLX3fW0Voc4dofr/@lists.infradead.org
X-Gm-Message-State: AOJu0Yyf6ZvAh8TGh5Vcu4tOHWp8Q7HjYMJJVKW+OUCwFFGnN1ITr0zn
	xeoHDuqZfWyCPP8eFciWJ2cGZ8/h+7OvH51P3RyX/NaHDMXVIvzuVHdh/g6xrgshChc=
X-Gm-Gg: ASbGncvzGQaZzbmE/BVuxQBnX4bcxSTeHT7itXR7EUh/DNV8UxGeubpZvSb4wTfi7mU
	ohQYnGziIOy95XeaQL+Vh3UXjFQVfaoTrfgDAF+dAQ4zNqoIluHaq1ahqqBuWWPySybCHCV0AX5
	Wiou4JVk17KPV9oYJn7sQGNio6C+hTVTjLH1mPSjGVjF8kUng1sFrllnIUzkTG5RzmJ/00/VM1Z
	Y+bSWkZ4IZwRLwlkrUCzbb4duPcfy1Zd/0O6TrIW4cnCrGRxCrhJHDeCAFqE9hbN0EHjuTccRsY
	Bd3UCF0lB1tWqxhv+GWvgrupdoTJaAeGIO/1odm/98snQVz1FPsc4P4T2K7TPLGCfFwjmgP3m2L
	2XnB6qEtX2PAktHmZ7CFiIZCAfC4+lLYgvazV2AHa2i2oGnOmWybBPczxaMsnURU541XsAARIWl
	JajCOGKDqKoHGD96IPrP28NsRdLQ==
X-Google-Smtp-Source: AGHT+IGhPnOc8T9NtMczj2X/q8cc3NRXoSP7R5os6ByTZSjWiGkW7WZLddjDX41weWGkosgmQFMyOw==
X-Received: by 2002:a05:6512:2356:b0:57b:8675:e35b with SMTP id 2adb3069b0e04-58af9f0e6d6mr2525880e87.5.1759416135487;
        Thu, 02 Oct 2025 07:42:15 -0700 (PDT)
Received: from [192.168.1.166] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58b0119e60fsm884712e87.94.2025.10.02.07.42.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 07:42:14 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Thu, 02 Oct 2025 16:41:34 +0200
Subject: [PATCH v2 3/5] i2c: davinci: calculate bus freq from Hz instead of
 kHz
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251002-i2c-mux-v2-3-b698564cd956@gmail.com>
References: <20251002-i2c-mux-v2-0-b698564cd956@gmail.com>
In-Reply-To: <20251002-i2c-mux-v2-0-b698564cd956@gmail.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Peter Rosin <peda@axentia.se>, 
 Michael Hennerich <michael.hennerich@analog.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Marcus Folkesson <marcus.folkesson@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2838;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=w+MZYaVZ02IqzT3KVbIc8v+JL5IabUx7ix7rNxqMcO4=;
 b=owEBbQKS/ZANAwAKAYiATm9ZXVIyAcsmYgBo3o8zNqj3vWMKZsDPeq2WJrbZnQsZi3dBQR9Mo
 6gj5akCgoSJAjMEAAEKAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCaN6PMwAKCRCIgE5vWV1S
 MmgTD/9icKEup0hYMJO82jco9VRXMaEsGVKncS5vll1JbZPr8WQ2r4IJnYUWXxqBKADQMZ2U/hk
 V+o3PNP8BlHsaBMwKztFGDfcHgBO/6+wn0e8DWNAF6tAKZsuZW6E6zkjfjDFcuXfiUC5ydl53ym
 iVpyETHBXPuRv5W7GuwzvT5+gr6GES41OtLRiK/Gi1vXMayKzY2nJTjSykw9sqm0xcsuxIqW8/B
 ZGzl2qCIqcwlkhnu1+mCjQend/g6a8D/kdVie8E/NyWPd7ksKbR0vMPPPA653lY8WLwAYJpfifT
 z0xNjGM+YON2rgCpnfiJlnacm0IrDZ+A8eDHwe0xM3RvD/uC88Cn/haIjm8FnyYnT4xleV1/9IA
 4iNhKsnrYiivRvKXL8hIQaLbGmH7lHxK4WrSMHJLjIO38PgUojiz02X/BKGQ8GnO1Ej1wgGQZOA
 NNUvNirR0LynQEehGbyx7EOfXxT6jTqAMLHeA9pAYaxR2a72f5eCzslBktQ2lp3Zz6RzNvR71eo
 /REyhcaxkOQ2n/ngZculFBggFBTcmG4n07/ibjVjpHIsYzbGBtioGjbdtiJF7ljmcEJfpWq3Rsg
 JQrNfVKRru5T5oYP2lcaD7ExPYbdb7M/p+rIbBYUW+6kILoPMH2Ix1gSNiyGmiIZmhqBmBCuHYy
 cVXz3ZtyG79o0Ag==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251002_074217_815179_F9D678CA 
X-CRM114-Status: GOOD (  19.39  )
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

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 drivers/i2c/busses/i2c-davinci.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/drivers/i2c/busses/i2c-davinci.c b/drivers/i2c/busses/i2c-davinci.c
index 6a3d4e9e07f45ecc228943e877cde1fd9d72e8cb..82f295619c4d0ef108c57d13c10004aa25014cbf 100644
--- a/drivers/i2c/busses/i2c-davinci.c
+++ b/drivers/i2c/busses/i2c-davinci.c
@@ -117,8 +117,6 @@
 /* timeout for pm runtime autosuspend */
 #define DAVINCI_I2C_PM_TIMEOUT	1000	/* ms */
 
-#define DAVINCI_I2C_DEFAULT_BUS_FREQ	100
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
+	clk = ((input_clock / (psc + 1)) / (dev->bus_freq_hz));
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
+	if (dev->bus_freq_hz > 100000)
 		clkl = (clk << 1) / 3;
 	else
 		clkl = (clk >> 1);
@@ -269,7 +267,7 @@ static int i2c_davinci_init(struct davinci_i2c_dev *dev)
 		davinci_i2c_read_reg(dev, DAVINCI_I2C_CLKL_REG));
 	dev_dbg(dev->dev, "CLKH = %d\n",
 		davinci_i2c_read_reg(dev, DAVINCI_I2C_CLKH_REG));
-	dev_dbg(dev->dev, "bus_freq = %dkHz\n", dev->bus_freq);
+	dev_dbg(dev->dev, "bus_freq_hz = %dHz\n", dev->bus_freq_hz);
 
 
 	/* Take the I2C module out of reset: */
@@ -761,9 +759,9 @@ static int davinci_i2c_probe(struct platform_device *pdev)
 
 	r = device_property_read_u32(&pdev->dev, "clock-frequency", &prop);
 	if (r)
-		prop = DAVINCI_I2C_DEFAULT_BUS_FREQ;
+		prop = I2C_MAX_STANDARD_MODE_FREQ;
 
-	dev->bus_freq = prop / 1000;
+	dev->bus_freq_hz = prop;
 
 	dev->has_pfunc = device_property_present(&pdev->dev, "ti,has-pfunc");
 

-- 
2.50.1


