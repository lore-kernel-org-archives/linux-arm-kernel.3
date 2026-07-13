Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0D90C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 07:20:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4Qa1P3gWmqXciURmGpT5GI4VZVYIEIGJapqmcZUGuQg=; b=pMOVWjZtRoXqHzXeo1YU1dqy3d
	gOfTmXg1CNqXU0H/ad7BnafLeOWeb6zn10wPUbiCIgO9zlONMVXAKLcxQQG0QBayRs5RYZqqDX7R9
	jjI6gP+mHQRpND1/j8qvREX8sNgMOa9RaVDhLGHmNfCYmehW3z+jJxgz9BSEfQkQIVMCGJLVZVaYY
	73CqV/iqFBh4xHXgcrZbVKHMdBXwfkarLgV9AbMMCDjI/Dy+/0bcRtxI4mlxjuNLtc0zcOm566aHJ
	VJvfm91h68sKNmbB++yQWgUcIV8SwLcO09iwBrLdB45RKdwedRSo5p6AMh07ZZC4hu2QrC5OZ8Zje
	1JFJJqvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjAyB-00000008NKm-3rYS;
	Mon, 13 Jul 2026 07:20:51 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjAy1-00000008NDb-3sPR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 07:20:43 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-5aeb8c19017so4132123e87.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 00:20:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783927240; x=1784532040; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4Qa1P3gWmqXciURmGpT5GI4VZVYIEIGJapqmcZUGuQg=;
        b=mmTiqkNQ4hp0A4IGtQRgj2Mlti7FvXLpOWbCpPgodCmyZLElDwXmiOa2lfABYrHdU2
         6eM9YPivUv8V7uFOSPfF2W0MQI245AGPLzAzVHyqEotA3gpESAuijaIJcu1D5qBUTAaf
         6p6qTJZ2Z3AmCOTnqa68EziiE2YmJCowmkvD8aCQzYXGQfsu4oDLCkKpVqd2p4psZ8Ye
         ym1O2OPutrTHcEVZ82ESpmEkPZAm3hzy7BWGQAmrtFcGEc5GCGYYWirOWplIANZ+E48j
         IxaG0pDOht3BzjGnRvAfS/3p7Yd6oPtMHTgczzO0nPYHrtWYK95W/7sYQApDSXd6IniE
         dEdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783927240; x=1784532040;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4Qa1P3gWmqXciURmGpT5GI4VZVYIEIGJapqmcZUGuQg=;
        b=nQtpB7jQAolVBUkocuRaZd7mp6uJ+OdXoPsUl/itdrjRDUXupJQJAypcTeSm8ewYmD
         J3S6c4P4ZjClpfFJUu67HCzls1idQhtaEIeEMVW8BaYzgNQUzEL0uOx8Tc8dOuxLFK7Y
         dhuDi/irUhH6p9kmqieLOq+SqfgXcoG1M8d/5D3cOLqEc5JXOJRrgyxKe8muGOeM2TpO
         Ul4s/V5SXfqk+eklY360NlVVbM8g7nw/b28NLHfJ5BUvAhBYeTF2yyS80hON34ZVoA3c
         zGs3GefPEna24pPFAXPPRVFCsKhAzpAwme2Kvp9KJzR5sNVZLDodUNHMejou6iW4OhS9
         nHHw==
X-Forwarded-Encrypted: i=1; AHgh+Rowxe7StsMcN4MIBOsiuT3WW6LSJrHudMsXc60+TAqbjvkA1knGqZPLmbHGN/ZX2jbQR52zeOAXtgwSzGugYCmK@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6PqIoJxo69MhNB9RNo3O9oxCGTDU8YfJtgEkaMp1ZPHB+j5iX
	svYiA2Jh1nsi6FuofV7MGHmVd1Az4JMVuSlsTEC7Y9/snaQp3Iz3P6Um
X-Gm-Gg: AfdE7clLGmlR0BKaqQ4zkzG4vJzl6qq/45me5oKLo+hxtEKNnveDvj44IuoaydnShNG
	ycTDfzeczJIiaizMI1ItUsifgYwcHJ4SGr62weVNXiZs9LqK9kC3k5Qop5aSAiYJnNLr2Ladid8
	LCKhbe6I2xFVhrppMUUbh9n0E3LrGDBYpYBFMvKsj8n/9rCVlc0c3fgW8mihq2CSVV6r0X94plL
	k2z0fWBfWFhODxVzBXGdfNKhpDYl53u8nicZdBCnzjyDgk08whL23w5NhVBvAT5wmm/nT+8+ivS
	4AdBzy+eA0SugXeh1MU2MDWblh4hulKcnRV8Bt4WeGP0Fy4kFpdd9Stdh4+uAAKZiADmQXRogbb
	TSu6rUu1ngeSX+LmT+Aq2+EziQIT2zVKxiJvDcptPMZ5ZWk9RQlnL38zIIownbraJd3YPANt09D
	gc0rlnZyfhBHV1ARMRCYeaqUePtzvltOCAlPO+c9+Pgq5Bko32fey/1UyX4g==
X-Received: by 2002:ac2:5a5d:0:b0:5b0:1433:13b9 with SMTP id 2adb3069b0e04-5b023666f30mr1407505e87.25.1783927239479;
        Mon, 13 Jul 2026 00:20:39 -0700 (PDT)
Received: from [192.168.1.135] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b01ca55723sm2625636e87.35.2026.07.13.00.20.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 00:20:38 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Mon, 13 Jul 2026 09:20:00 +0200
Subject: [PATCH v11 4/7] i2c: davinci: calculate bus freq from Hz instead
 of kHz
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-i2c-mux-v11-4-72bb8af8ee8c@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2874;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=+XcNRIzkmbYbd4RGr5v7OnmsIYyLQ+F0lGI6snUGPQo=;
 b=owEBbQKS/ZANAwAKAYiATm9ZXVIyAcsmYgBqVJG/pzVMAqizUHvztweXaWVBDpM4y5gVWk5HZ
 S37HT5pyw2JAjMEAAEKAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCalSRvwAKCRCIgE5vWV1S
 Mn4fD/9BwGcAZa8DhnVd9G0RNPbmv8PAuimgGEwGv2EKo9MNof4aHekeKrMnsUgq69rra+8Eucx
 WuHqRPWqmDTknWnCKO25jj/NcfkkIsxm6dTWT1b24R3HzaJLPoterISEl5008f8BQ6mrG+grIKT
 vbRpaa7mP7WKkXNpwb5PtcmyJgHE0jip1M23M0U0ASsIBWaAEkICKzeIZoUtbYqOPCTdvxCT/Yo
 BM7RT92Q5dnxBk9bCRIj1iGQf9copKWeB+MkaPC9VtET8qzAFa/rlnA9LyzhZEiRjXDJ3rdbECQ
 K4MhqmvQwmf5EUznjNDshyB8/PvnD9N6d8scAXHHR846hEHzWQFf3eaeHEUevr/U0+luSCFsxYd
 TxBg+cq7P8czHpkkrHqfZI0i3tATjtOfa5gbfZ+E3yJhtJUToly/m4YzGpHCpBELz2PYFWkNDfT
 viO/1pJJdI/XXrD6RytzcudRIBWY+nkbCq0i9pjUCJFEViwhIJXkNxhn4DdJA9H7aDMO68YoFKq
 x8sFq/6KbvFj8icXJeRag7LhBQtSFuxtaRTjI0i+kkKi6iQoJHalam3I7fqwL8i+37HvvginMad
 827vJNbs/tGlrUkHFRULmozg/hziNe4h7lGsgkZWyWT5zY715reM4pIpdmIlMfmBmIs0YD4EetQ
 RiLIhr7gyEp2R0A==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_002042_020793_C2FE1743 
X-CRM114-Status: GOOD (  18.71  )
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


