Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5684C44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 12:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M4ngO6LQ445yVIm+0Mq73SpzwdNfhUAJBkx6M7Jo6mI=; b=mkln1eh02RlZG4kXSX3/8MNyGG
	0uEUUMUG8XqnadwMLEnPN9du3nAcSSAe1uH82wM14v2X+vas4ogXUyU3wOCtHhGgwrJ6keJc5Lq2e
	/5jtZXr4URnDuD+170aepf5zkUXVbDo+ZGmOipz1tWEVfAaaD2OB7nTNSWwh5mRVQxaz/E1T4Oo0T
	7r8eG2lFYdDd2PBSfhymJigWN2W2H7zUKA4gnKCXHtxZb+cGJNXCjsfHEMR7WFxyF2ES59HDjLpQx
	+Z6Pnu4US3fyPhn87Py+xZA3giR5Avr3j/a5xE3OtfsmnnFtfU9DIiAfsQvbxBTpACjrqhaAWaPgQ
	2nA7HzxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whRD0-0000000H5Ol-1qSX;
	Wed, 08 Jul 2026 12:16:58 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whRCv-0000000H5Ib-2f0m
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 12:16:54 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-5b011edaf7dso420147e87.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jul 2026 05:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783513011; x=1784117811; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M4ngO6LQ445yVIm+0Mq73SpzwdNfhUAJBkx6M7Jo6mI=;
        b=hKVlLp6BsYrMvmuXFn7VJ6qFwPgDREDSQkCQbs5y4CWN57WRodaDKUDZ8HGWfkpP3s
         H6JUCpYDAM4VRqxXLy5OR4sSleWv+rGBg7EsUE/Obyg27lEwMhPG0RlOd+ru4f1Esx24
         7DEPIQ6ia/CmGYDold+CCw2qe8o2KwCAQ5gmOproU0o1PWjG2SbYXWW1uWzfFqsvZIdj
         zk22tAN18Y0OqGdrNB6BauHRyAclVDa2WkefBt/nXmf7kdRVYRysiuRw2vCWCwuotXsD
         l54Y1KQrqQfXzNEmIZwpFKE5D7ztO4xaRCeFBsDZvV8BsREZUl5LHzuTFugER7DpWtpA
         oowQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783513011; x=1784117811;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=M4ngO6LQ445yVIm+0Mq73SpzwdNfhUAJBkx6M7Jo6mI=;
        b=hJYcvsHTuGVSTVgyowtyKLvWDryaf72b5oT8Z7dyxqWPsgNGOVRDPQwbIYxmPHUx8b
         jBY+4Gz3dZng+Q43DeR0zPQ3smZS5GF61Mw8dHQoIIjYZGsDYtL8mglKXh8rv8cYNsGl
         DqL+DTqrnpLi8JSazb3JCK3Yw+FXNuCutQ8VGW6q4ZU85R8sBl2szSt99vo3B+Sosg5X
         XPZqjmAH/E25KRhXCmIAXUJWGcDu3QKhV3jcWxL0qTL/ccdaaxXyvtIMy3PoW3pdLfPe
         ql/rANGU/HyXD3DNkw3+ZarbHXLFSNg9vlCCN/QvvEuUkwo+54cwRqkVGHtLWWx+xAlx
         ielw==
X-Forwarded-Encrypted: i=1; AHgh+Rq0FTVjhCIbdB2v5FeVFDF4IWNMVOhI53mWNbqutamLYsM7I4qcfzhysDwaupnmxeka+jpLTusuF5tuyvW50cJd@lists.infradead.org
X-Gm-Message-State: AOJu0Yys+nTd3z8ifpNivQj6uB2X7gt7uRsnu9U4EUOJGfKyRx0XzAAh
	cMAgT1tSrdLKRDaOPmOUyksDy+0emEb9GYbt+JCnZypjpg/x21ZSX0xZEM4ETBwFInw=
X-Gm-Gg: AfdE7ckL/i+JNCpYRj05O3Q3kOoT5KdlA40ooxVmxV0G8aJW9ZS0tsHXvVzoQZQL/g4
	KN1NyXRYr9D+6gqDF1lBpp9BPoh0q+SW0VbU8ZyqYrzsXDLtACGk/S5n6oNdD7LNbEFd6uuIAjC
	Uzs6MIJbXhem+eH7/kVYTjbl9fteX/4QiAwzuMyjK1DnzuUOqBDlgVrJE4F1qcl6pyWTUwi13mX
	dXOfWLYTKm3UV3vyGxJtJHwZNu4Bt2ODi0vuyvjxsVCG+TWbgZ47No8qvB3Plbiyddj0g/QyEPb
	gQVBLUWm1+rmEgIU1CW/wR54ctlIBA4khgFFSop8HTNT+UfrTvGRMzW2XIFB8s4FvRDT8zkXqCO
	Zgv+jAI9yDxKM36bEMdDiOMd+WwQusQl3hxUiUOQemV9n6FAqZqaGDnBuAIW0ZoFBDiycSjsuMS
	UzPTYl4fRi4c7dLdq/ASp5VEeaIWWPIDFaxbImwEg6hRY6cOM6wjmNBaPzqrwihfxxzBIr
X-Received: by 2002:a05:6512:358d:b0:5ae:b62d:3205 with SMTP id 2adb3069b0e04-5b01147ac43mr433734e87.14.1783513011316;
        Wed, 08 Jul 2026 05:16:51 -0700 (PDT)
Received: from [192.168.1.135] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed13bbbc6sm4471459e87.41.2026.07.08.05.16.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 05:16:50 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Wed, 08 Jul 2026 14:16:17 +0200
Subject: [PATCH v10 5/7] i2c: davinci: add support for setting bus
 frequency
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-i2c-mux-v10-5-09dca03c8a15@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3829;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=i0MzyPSyCHemenGFkixpELNTDZX3XPRlllD75eljshA=;
 b=owEBbQKS/ZANAwAKAYiATm9ZXVIyAcsmYgBqTj+ots8cu+FKDeonoFwNBgioHD05/dGsQ3jPv
 g0dgiOw4veJAjMEAAEKAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCak4/qAAKCRCIgE5vWV1S
 Mhu+EADeGzF68my1I2YE3fmzMrHzVkJDP0KAchf3oIBo2pkG91mfjP7htpTWpt8DvkRkFPSeJfq
 afoVZ9JAKBNRujeVE8YO24LmeW60z67pXHY4TYmpgeTHwaGQCNRsICgsnGpaxrdCxYwi9jpnPwW
 mAd0BGOrwTXiC8tjEATc/oXkv2KC0/F7LuuetYIlsmAtAuD5EHslg3LCm+aqlyP1cmocHn1n5BF
 CUMniC0hguGN75+2cwGgEsMx1gW1Reh26HyLgTnyGV3C6wy6ghRlzvrc/mrITL2eHTvAUgm9YPb
 /3hZtgU1vPVYba3jiA2jDZqwM7y4bQ4rtS0rpFPlZSJrdQ5/IeEFN7ohqriVfS138XyYZuVd3rs
 /OGCky9BuD8tAXFxyoBUasl0x5cma06qWcac3O1fm+vVcNDL+5tV7bIsXPbfp2Fw90VHnj9FldY
 e47Fqnl9cpO6XhB9l0X6Mn9wnct6QXFycg8gf6g4YvN8jGo1PoxyeY92yMv/kEfPliN6775ZL0n
 bjA9/QwkF0A3XSdkpJiokaDUbtnutIHzML+uGutj6TKXOoTV1mDNaujF1BUTtK5mtzTd6C+Ka+E
 WJnSK8PUeQ6XD3oq2kReuaNVXwIpOL+logmHm1FySStrbDm76XhR4ou7cdh5AVAg+MsXA79rqFg
 lj98HqrZ6f2SPIQ==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_051653_709465_0AD13523 
X-CRM114-Status: GOOD (  17.78  )
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
 drivers/i2c/busses/i2c-davinci.c | 31 ++++++++++++++++++++++++-------
 1 file changed, 24 insertions(+), 7 deletions(-)

diff --git a/drivers/i2c/busses/i2c-davinci.c b/drivers/i2c/busses/i2c-davinci.c
index 549fb22cdf4f..fd87dc661ecb 100644
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
 
-	dev->bus_freq_hz = prop;
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


