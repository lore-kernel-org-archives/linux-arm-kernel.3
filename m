Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D873C44521
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 19 Jul 2026 15:17:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4Qa1P3gWmqXciURmGpT5GI4VZVYIEIGJapqmcZUGuQg=; b=xUJhZ/CWeplfmFvu//Y1W6s73P
	DrCcgWRF0Q9mFoHc5ded7eIG76N/aG9oBU9NMxSW2MVb+F4Z+KQUUJXlYqREWGOtnu5UvWaiz+yWU
	JzCq2auGUimj6llhlIGYw1t+f0l69lKDQyEIwqmKDgoUfQJDkBJSCflI6u0hSw5s8LgVLjkrVfaNF
	w2+O18D/2tiqO/BCBckgdeuT7aC5yLa8vnaJ79cyn8IHxBCqi8mSvZjn67OmpZJ7JTNBZnJaEQCip
	9JLgO7DyyAiiJzGmMa+L0vYWCvxLhmVA67OtJFeCUJxILQ5WJMmex6tCDhJiOBaa1i4mjVZJxT6Y1
	MBUgxI+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlTGr-000000056PN-39Lt;
	Sun, 19 Jul 2026 15:17:37 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlTGi-000000056J6-2wvc
	for linux-arm-kernel@lists.infradead.org;
	Sun, 19 Jul 2026 15:17:29 +0000
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-39eb257e9fbso15407301fa.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 19 Jul 2026 08:17:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784474246; x=1785079046; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4Qa1P3gWmqXciURmGpT5GI4VZVYIEIGJapqmcZUGuQg=;
        b=M9HZ+0b4dZzkpWWZ7jikVJmbYP8DXkV2HaHYyA1O7RxcIMg1znW3ez7m5EYWuj/sXb
         RoGppWls1l7DzvWpVUj7Y+4xhkZfxOm/qnyTImP8J+9NxJ/eaGzMfidSSVMFdGNXpQR+
         WRi5UjkZayx7UBcaxpciUBzNSiZuQltyiMLpixxM0DgxH/52UOH6WAM947nRBAt3+YU3
         Ry6PEJ3szoYixn+l2oxusK2iLcQJzUqrU+yd89lPvUwPxM3P+hAEqeulU5B2ew5y6laq
         j45nmn1et20Gd3QLXZeLTFbgvv5LGQIbVHEuVU9TZUO47sMtQHwF7ZdfPdyHZUEY3W0p
         aPTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784474246; x=1785079046;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4Qa1P3gWmqXciURmGpT5GI4VZVYIEIGJapqmcZUGuQg=;
        b=Z51tqBPo9fFzU9Ec2HVt8swXN9lLnqSoFu7GZO2jLHghiCNNQCOHXbxg1WsIJPfLda
         ACoouW0D7VmskVDVAxBVDw0XPSTls44lrGEigrx2q2WKx8SUWWMbpX7tzyMPHpT4FDKf
         AP+o8LhTRAgQyqyxJpTlFoCaC32moC7YRP0dq7csAi+SKf/VRxObazIadDKG7uaiWbEb
         5p/jmopXfoa8AIGwht+D5MRAhHeOvTDUmsKIBEHhtiGkTCdp3P7JxnuWg/6WSOKHeZoz
         RU5UzxDQOiM91/7XFiYN7JUB3oZxlcAd29CyqWb1Q/ISRF/J5gIqTPqRcXSnqA/CDYFE
         P5Ww==
X-Forwarded-Encrypted: i=1; AHgh+RpXDk6uVoOKRfiXFmSyim1qm8zRhm7vXq3G5GOnLFDiRlVUIVzUTnFz2MiOd1KVrk3rONMdixg9A9unmQEUyRJy@lists.infradead.org
X-Gm-Message-State: AOJu0YyotM8UuP5q/6Fondnbqat0x7NGpcek1le5lH/61TUfudKWWwwE
	qFhEp2ODyWXl3DSc26vbrs2QmrvKj/lPnaVf3M2KLneCb0at9pRx8ED8F3F3pkWizW4=
X-Gm-Gg: AfdE7clumLteNTK8MIKqzhBujrzieX/RTDfOQVldXrifTARZ9Qj0APRpisHxt1v8IOA
	XCOPbXeTmbBGB+7XXACfCAxy369EpQjZg4tDwas5k+N7ApJ8OvNotFndUPSiaJ5Yrbzb+0yoefa
	xsz2xkHawb4/pdCPdMEMuBi2eyszWKDXikovaAGxjGZzJn1kkldSCAsE/iiRWG8XctDDcLvKkpa
	jtr4aM2uYH80MjzgzhRaDcaXV5K6vPXE90maQTC7Gxextqy4fGJzwWuqgxll6xu1Pq5oAdZOyFL
	QY0zsazo/a3/P/5L3cyzESPvGUMsfYIiqtJeYDiyDDSedDsxcAeaqBB8Au3LZKnL/Os2+SK+oxh
	i1oS7hmyRwP+IIkzOb+oC4GjidBMeFgV/K9+GP7wQUBgAjOBC1hPquF9WbEJo+6WD3Aj/ZNqn2C
	PCtQLuBnOnONQ5+t/T1rTahZBznCL0JkziX7UdLnw/S606EKs=
X-Received: by 2002:a05:6512:1328:b0:5b0:eda:de2a with SMTP id 2adb3069b0e04-5b28f998d04mr2011866e87.35.1784474246449;
        Sun, 19 Jul 2026 08:17:26 -0700 (PDT)
Received: from [192.168.1.135] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b291e26e5fsm1835096e87.80.2026.07.19.08.17.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 08:17:25 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Sun, 19 Jul 2026 16:59:47 +0200
Subject: [PATCH v12 4/7] i2c: davinci: calculate bus freq from Hz instead
 of kHz
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260719-i2c-mux-v12-4-a5010d623a57@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2874;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=+XcNRIzkmbYbd4RGr5v7OnmsIYyLQ+F0lGI6snUGPQo=;
 b=owEBbQKS/ZANAwAKAYiATm9ZXVIyAcsmYgBqXOqE/w5Wcpd25qcAvrFAjK3btR4TTYV0g3nYj
 Q+vQkEjIFyJAjMEAAEKAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCalzqhAAKCRCIgE5vWV1S
 MmWREACFw4mZ0lyDuuMASrzJzBxVPUctzhs1qzkgD7P+hxIwUA+pLpprcm+lx9cRyhyK6rFSaEJ
 aZr+3zq1YkjlTBFA/bWRi+Cr3OjkFKQak4R4VIXyFugMisWaoip2bl4RkiX8qJUN+I24+0AJlm/
 3ylO6g6xOkN4xhHceP8UyhBw+XvV/RcyEOU0JYVna8P++m2bZ9yCQJqIIRTAccQCjFlGWwo+AXh
 I8LVC9cDr4B5i9HeznRF106/Xmpc+kt6lO7dxmpgcmBPExT0SoWvDuBMa3Csaif7xrFKqQ9+9n2
 9kW3Hz0WdTSkvWt9r8gh59o1EXQDIeB7S+pLDbqPzsv6MhzRiCZUiWsokGkHleo2CUZZO1ilb6N
 4hZSiqMQqEPpEX2HaFDQxdldaCl/qB9IVOF78d6CgckpQyugrlr7x+M/hKGVOqQM/XDkBFiSbwd
 0PUc86K2mWfmNDmzHVsnfVYpf4r1+uvTJwRyMO5lkXtEoGaeZFhBB7Dj3Fy5rfh7eW9goILdxqQ
 4jKFv4QfxyTUbmSeoapiS+n7G+PLBOwgNS38vKBphONvE3rbLLOH4nOq/RUAXPPr5qu10ODxZIh
 46+AUK9+Zyn7EwZQeHXsAP1ld+2GTWzpdFZEaUqX6fuFZDJTSBFnnU18LfRDs9fAm5KfKo4Hm2O
 7KZB9P0XaDTYlLQ==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260719_081728_779926_64E888D9 
X-CRM114-Status: GOOD (  18.81  )
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
 drivers/i2c/busses/i2c-davinci.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/i2c/busses/i2c-davinci.c b/drivers/i2c/busses/i2c-davinci.c
index e15eef163a8f..f543997c31e9 100644
--- a/drivers/i2c/busses/i2c-davinci.c
+++ b/drivers/i2c/busses/i2c-davinci.c
@@ -132,8 +132,8 @@ struct davinci_i2c_dev {
 #ifdef CONFIG_CPU_FREQ
 	struct notifier_block	freq_transition;
 #endif
-	/* standard bus frequency (kHz) */
-	unsigned int		bus_freq;
+	/* standard bus frequency */
+	unsigned int		bus_freq_Hz;
 	/* Chip has a ICPFUNC register */
 	bool			has_pfunc;
 };
@@ -207,16 +207,16 @@ static void i2c_davinci_calc_clk_dividers(struct davinci_i2c_dev *dev)
 	if (device_is_compatible(dev->dev, "ti,keystone-i2c"))
 		d = 6;
 
-	clk = ((input_clock / (psc + 1)) / (dev->bus_freq * 1000));
+	clk = (input_clock / (psc + 1)) / (dev->bus_freq_Hz);
 	/* Avoid driving the bus too fast because of rounding errors above */
-	if (input_clock / (psc + 1) / clk > dev->bus_freq * 1000)
+	if (input_clock / (psc + 1) / clk > dev->bus_freq_Hz)
 		clk++;
 	/*
 	 * According to I2C-BUS Spec 2.1, in FAST-MODE LOW period should be at
 	 * least 1.3uS, which is not the case with 50% duty cycle. Driving HIGH
 	 * to LOW ratio as 1 to 2 is more safe.
 	 */
-	if (dev->bus_freq > 100)
+	if (dev->bus_freq_Hz > I2C_MAX_STANDARD_MODE_FREQ)
 		clkl = (clk << 1) / 3;
 	else
 		clkl = (clk >> 1);
@@ -240,7 +240,7 @@ static void i2c_davinci_calc_clk_dividers(struct davinci_i2c_dev *dev)
 	davinci_i2c_write_reg(dev, DAVINCI_I2C_CLKH_REG, clkh);
 	davinci_i2c_write_reg(dev, DAVINCI_I2C_CLKL_REG, clkl);
 
-	dev_dbg(dev->dev, "input_clock = %d, CLK = %d\n", input_clock, clk);
+	dev_dbg(dev->dev, "input_clock = %u, CLK = %u\n", input_clock, clk);
 }
 
 /*
@@ -267,7 +267,7 @@ static int i2c_davinci_init(struct davinci_i2c_dev *dev)
 		davinci_i2c_read_reg(dev, DAVINCI_I2C_CLKL_REG));
 	dev_dbg(dev->dev, "CLKH = %d\n",
 		davinci_i2c_read_reg(dev, DAVINCI_I2C_CLKH_REG));
-	dev_dbg(dev->dev, "bus_freq = %dkHz\n", dev->bus_freq);
+	dev_dbg(dev->dev, "bus_freq_Hz = %dHz\n", dev->bus_freq_Hz);
 
 
 	/* Take the I2C module out of reset: */
@@ -760,7 +760,7 @@ static int davinci_i2c_probe(struct platform_device *pdev)
 	if (r)
 		prop = I2C_MAX_STANDARD_MODE_FREQ;
 
-	dev->bus_freq = prop / 1000;
+	dev->bus_freq_Hz = prop;
 
 	dev->has_pfunc = device_property_present(&pdev->dev, "ti,has-pfunc");
 

-- 
2.54.0


