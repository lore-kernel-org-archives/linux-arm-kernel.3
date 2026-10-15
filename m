Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 881E4CC6B3C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 11:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zdHsOUWdQleiQ3bqPDEase/uBeWKF7GnXYiyr391KAk=; b=r0XirFjae5gBqlB+bSqKHqvYG8
	+1vKfCPE/JBV0To6cp8kY3vqFcyQjbPlM/hNJ8YeQNbBy6LmqazCV/5xQE7GU2LZpU1M5rPNaMUQK
	asZVQvU/nZMQCkh6akyj0y9eNUiU1n6CrM6oaJowMya4GQj+zHwFUySbYrPpuILsMKVPutOLuzFRo
	FJnZL5survcZzJ0VS1bBVnWzC39UpeGyAWy4x4k7eUPsWQZ9FWKmKseFvpas4aq+wf2dAQgRxouQ5
	qJfFX0AUg6+DCqzbNGOTF4dmWAW30kScImLAePpnYKO8+1AKkLS2K2mKsHsjiUFTWqa+12Oq3Mwfh
	zGWuz2CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHJER-0000000HVcO-09ze;
	Thu, 15 Oct 2026 11:02:43 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHJEN-0000000HVZz-1o9j
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 11:02:40 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-5bb7c6980f1so4111747e87.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Oct 2026 04:02:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792062157; x=1792666957; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zdHsOUWdQleiQ3bqPDEase/uBeWKF7GnXYiyr391KAk=;
        b=fQ9d6EX1Q5z3df5/qJGZr/xnjJ7XRaKzD6x7IsKJOMaQnYbePDSvnuGh9hIb8qHyz/
         gnXkA3m4YmWE+j8kDQbX78qClbcPBbaCwFriglPyJfEPnjp3K0YzjfxBwKsHSsvLvPA3
         SSJWq4OMvkkBkP5DbS+aw9jyVVGfq1XJDrroOvIuXH89v345IXpIql4hB0zMLb1fiyIy
         rg1ClvD7Crut05f6XupMmqdiFl4MwvGApt7ZSK2p32IrQXyCHqysEn5pbqA0UhI5PpjW
         4ox8P9AcWOvuRP59Jw2YVVgazFsk5DOmDrzLkLsW7KDtvdFe1akVVSsHhOAEDlc2/U/u
         qoow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792062157; x=1792666957;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zdHsOUWdQleiQ3bqPDEase/uBeWKF7GnXYiyr391KAk=;
        b=JzIc3d69ZKN1cwVyuur8gYB8j5hGLMmvMJXftLZpvE8aZXXbInEQRYSy2F4BXwI86/
         4v1l/VydSDUQ9LNQA4AdoL0hgvDQJUmBnuz0UdRGj69zqatxeZhj2oukhMMG0XH3/SjT
         gJ4cJYNeTXnJCEBFBRDZ+gnz3JnauI1Lfm7qVImwxdcE5+uBtL2/ir5EtUIhBNuqtWhV
         o48OnQNmRkuwtg+smTy7KE1fbaTA4+Hg3mvVw3bN/4e2jb6871CkXT/CeaEixNYPjLEi
         rHHYAyxcDFw3A+C6y4nUNWLnNTiJcWjNkffQzlPYwpuTNKX1ZF/gcjegbWTNkZ3djOI+
         rxjw==
X-Forwarded-Encrypted: i=1; AKwUvBxRiv6cFYC3EvQc+bVjefs83wMDxp8VKrrG6M2sLUq7AzqHwl8+0Tt7Z/zKt8CBMZ57O5RnfEBh+v+Xcukwg/fz@lists.infradead.org
X-Gm-Message-State: AFq9FYK0epFxNPK4hG0RhnotkB7jzsM0+Qe3ck+MnOdNIzaxhuhHLhtv
	vBKuDdjl9r/S6YyceSpleTQbS+fqtQtpXIykmSfrPzQGqCnf2Ulu9zw3RHmzLdUu
X-Gm-Gg: AYBFou1mNDvFvHmwaQdJxoYPm6j9gCD7NkLvbW4eJ/zEPWw9REwXtKXYiyQgWNW+aoH
	YozBpbv/RU+zOMUMKmBa63PeZ03YFTGohebJhZQ8l5Yx5zCy688CqgaBOMc1vZ8HtSd43SMDupI
	TFcxk57w/rOrKCEn9GKwOITF3wBrD5ZEiP7KesTtV9ov2Ps2vJVafo6jjmHhhSnN7iO3JS3zX2b
	lcZzWj2KnrOgSVP9JTvFVuZUZV4cfH28Nxf/eksuiuhotGhcmXvtVcL/2d1Aj3JKuTobrE7Nktw
	hYk8drM3YMGAB7Psa58vB63j0WR4tEfVAvewlvMlHEEGNgubuRwzzr+ombC1xJHL8ket5Is5AjY
	fs5ktqT4uVuc9VPp0ggywDBT5A+TT8U0nYZzkt+SYvWgFqWkLWmk5Zu/Qu5u2FyYgWI9bJ5iRXk
	RRgL0CD23bMCK2cQtvinG/kH3YHoRi4bAChDYULTmNpPi3IPPrzi77gLv85DV+H4dOezUQD8WAR
	4z6ajnvw5daPt86AuYHGgNYUIc2JAGrQOKG/d3ooDaOCwro8tc=
X-Received: by 2002:a05:6512:1289:b0:5bb:7ac7:80e with SMTP id 2adb3069b0e04-5bcde6c271bmr6857078e87.28.1792062156967;
        Thu, 15 Oct 2026 04:02:36 -0700 (PDT)
Received: from [192.168.1.135] (81-229-40-193-no2450.tbcn.telia.com. [81.229.40.193])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be3739b5d1sm905465e87.22.2026.10.15.04.02.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 04:02:36 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Thu, 15 Oct 2026 13:01:51 +0200
Subject: [PATCH v13 4/8] i2c: davinci: calculate bus freq from Hz instead
 of kHz
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-i2c-mux-v13-4-778a12cfe93b@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2874;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=CNWJl5EX3MJMdXQfW83XU/Cuf4vxP6WKM1nBj2uURcI=;
 b=owEBbQKS/ZANAwAKAYiATm9ZXVIyAcsmYgBq0LKyZcoMyB4F8eYwVWTNKj2bL3bo1uzqyDM+Y
 H+6r/V+N6eJAjMEAAEKAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCatCysgAKCRCIgE5vWV1S
 MpNuEACVpIMVYWflxdy/fiYLBASa6kBYSW3zb6an5/MxedA0EV8rVPNc/OzYJK3ydywqNbGahN1
 Hzhc5OVGJuOb49EqVZOhaWyCTqt3dtZChRINBxhW60LYnBlywlzQWxqs72AZRYDjR5vfjsA3GNe
 8WPAXrcgQIxvsXuPIGSJYsZmV5i5iQvCXgGjkxTK9sNOY6A4McaF5YpPSeNN0XaGBN6Zdh6SYxa
 opvpRK3Przntr7rHxX0r+LFTZ98gibPrHx7ov/U1Cp/nu9l2dz/eKgqYf5z9kTqqGJS24waZPa7
 9Bc6w7iuYGrhOWJ+Mqx2sGI7Uzw9fPedEIDbp/7V5NdTdeuEJy+jf6efF5qSE3XCKxB6paqUMow
 qHhB8aomtJAlM/BS/zeQ4Mc5rBhOzGdCbrRAOQeojNsRVzwjxqdbTHTJHMQh3+q/wOjdDSGUGuV
 0jHpa40VbUKI1q74QNaqdydoD6ENpNLXr7wq66F5HsdwHyON+QwFYIWYfyqrdOQsbLvUFIaXpL0
 DT/u9ctNaQwyegO0rUHJMPCwlhkqE5Hr+4YUfXhP3Bykt8jJ9KFS7/yH3opTXq2MVtMyKrJrN8a
 Da2QYlYcWiSfulbTaW4ivSDKdM+7Dch/9CKTrHCPhO6aKc7MN0BlbXqryiVaMkdLosN/391uJ8a
 zgR8hjI01nEq7hQ==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_040239_509777_748891DD 
X-CRM114-Status: GOOD (  18.51  )
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
2.55.0


