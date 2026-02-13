Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49E7FEDF154
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Feb 2026 11:08:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hgLydv0OAbPSYmy/7mtUdSMM6gy3g70cS63c1sKd/bM=; b=xBBgqTavhzYwEMIKOq4nMokRHi
	8z9Aa7szszg3F4MnnspJmSfkTeTbBkhN41ahkaudWlJwNZw8l7vG70IiEVlYsY6QPQUfqPOdSv3Fv
	BAc0VWskWoyvAGQ5902/oq/oS9LhAdwgKxR3vHvrIeq445rxdNl8IGX9MKpi/0Y1IO/9Wt42sr1Mm
	EJVr6oFhIE6Y/45pGX0SXuFATUax8OXTmIjdloC+bHavXxV+RgZoxkZ5DYkyir1DPx/X0/WUluYPJ
	AtUUWFwXRPX+MqIxTC/jlEjb31gtj0oMQTYx74qXncG0EaQw5umHranuQPTCihQ1GNM4dE61Acxbp
	5jNnVj9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqr1o-00000003MsW-0jj8;
	Fri, 13 Feb 2026 11:08:04 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqr1j-00000003Mpp-3CRX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Feb 2026 11:08:00 +0000
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-38707d4c8b9so6952531fa.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Feb 2026 03:07:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770980878; x=1771585678; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hgLydv0OAbPSYmy/7mtUdSMM6gy3g70cS63c1sKd/bM=;
        b=Kd5xo0qg+3L6PZJci/dLrezE8ZAAxtH7f+JV6OlNt6J41qSXMfi7ERdpBoPSpSLl17
         UH1RgjMvTCzKckL+at18NCMWMAsJCK8OxX/72sJswyrKJyhu1gnDkGDYoeeBWsHLMYD+
         BoGLIQ1LliqsthfqiO6y+jik0NSXZYkZZxhrYcp5osvzScEc74Zrzxtb60Haeru4IIkt
         MiIBG5NYdxWgxgqbj4sfaeQm/oYrvsFiZH8TPbCONcB3nzIcdTfkkPpuQgUXcq4c3nXd
         4S1JzkzNn8+e2bm3wadXoG4W0syK+6hdTW1ZCbHNynbglM3UAXv8PGIUUtoH3NQKQ20E
         mD/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770980878; x=1771585678;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hgLydv0OAbPSYmy/7mtUdSMM6gy3g70cS63c1sKd/bM=;
        b=Z4irNDFFmzOAZn2ZbUvuIjSOVHhlAa8Eh24loO1dHkHhTVyEmkRueg3Anjum50t3vx
         1qKApOdpld4YkO228Kxdz6RgclhmF/AEF/sT1DLeQHMh7aT2+7rjyFxLKGx4nWWGyPFZ
         mcTmrSlRkAbBq8IyvV81bLloIVZjXqHyi7UMMBUbjoKAmfbbcvl/NPz+xVtKtSykJIoy
         5sWyLa9jMej58RI+Yuc7fQyrvrpwXlau1fAzn03tRxJZSRF4rbSnO08hNtmprds73vgN
         AC2vTSC6nUEfR1qbktlNzq+HSumGmDLmWNfNjS+kvn7y1ULZKrRdupzbXxA3+DeNCb5w
         IYTw==
X-Forwarded-Encrypted: i=1; AJvYcCUV4NHa1xENnVQU3gE0ztwuYzV2Wk4XxVZctvW45syPvmpMzXMgrjGXpjj67XPAJ2zQj8/WN9i5x6ZI8RBgq1fj@lists.infradead.org
X-Gm-Message-State: AOJu0YwoErQ46NpfyYke0yW4+s86TWdrMFppIxBjCPsZxi6K34Hlyq0a
	N3AScO8gxgsJrrrYogLiCXM1a2VwTK5iOzVhBCRbQfzcbV75RH+vCnkG
X-Gm-Gg: AZuq6aJPq8tWOAgFFeV1irnnDyKfdm9RtTDFO91p78uASQQPpMQRgOc3B+M9mJzTWt2
	uiaPt48CE89XIUkfjAgJRNaQtVSSpg2mzHAhPmNa817Ti24W6So+MB8ZLbpdfNjlRZzi3IzmGIm
	YPZB4O4b6YXbh1ylQkvh+Pq/9ubP/vKOeG7ep7CUy72h5JSO6c3G2Tt8c3AGqvI3a1ys5z+gwhv
	GYnqVDVPZs/Skfp7hJWQeVfU2CMcrPivQgvKkqyy+2dwAqxLNdwaD+2usvBgqKttdUTxt5Nn6WC
	I1wlHGoteYhAhf2L3HwupZ7c1SevLNl68g69UZfsc2fi1Miya/W+/piCDDFs+AFD7miFW7uBZB6
	+oW4E57nw/d+d4HHmnrNlci4YI1Jb+Wdvb7WGHGMGyOHMJyNpxCtinqJDbUevLSt7zvgPNNw06X
	tP3218E36CHI2+f0ADp06qLSjYVEz+JEBMvRmfmWWXmAHz/oM00aZM2pPXs0IfGVuKncMg
X-Received: by 2002:a2e:b8c8:0:b0:385:da34:5182 with SMTP id 38308e7fff4ca-388104d9e2amr4905271fa.13.1770980877740;
        Fri, 13 Feb 2026 03:07:57 -0800 (PST)
Received: from [192.168.1.135] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-387068924c3sm13635831fa.1.2026.02.13.03.07.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Feb 2026 03:07:57 -0800 (PST)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Fri, 13 Feb 2026 12:06:52 +0100
Subject: [PATCH v5 3/5] i2c: davinci: calculate bus freq from Hz instead of
 kHz
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260213-i2c-mux-v5-3-fb2cbf9979b3@gmail.com>
References: <20260213-i2c-mux-v5-0-fb2cbf9979b3@gmail.com>
In-Reply-To: <20260213-i2c-mux-v5-0-fb2cbf9979b3@gmail.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Peter Rosin <peda@axentia.se>, 
 Michael Hennerich <michael.hennerich@analog.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Marcus Folkesson <marcus.folkesson@gmail.com>, 
 Bartosz Golaszewski <brgl@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2849;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=NgWDqx3izSY9aW9W75gFytkLHJndTcTMdemaHAZbfa4=;
 b=owEBbQKS/ZANAwAKAYiATm9ZXVIyAcsmYgBpjwYL/mBgptLRECM6Xhb4gqTFs3FQSjGviRzOv
 JLmo5EhXpSJAjMEAAEKAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCaY8GCwAKCRCIgE5vWV1S
 MvCZD/9WMtRGpgF1nsGmzHotYBXEo3UiFoeK7+Nu+zc50fy5TcIUV8PLiDl9zLOnr/WKONF/c72
 FYdeNB+ufxhjtKxNGOIoqlw+xkIR5HtF1iehNbmPanpjW69FJ45g9dWU8iq491iNx6zyDvINhN3
 AuuhvYJmDzuLsnwgAPMALlDA7WskPKu3uigAhraJNLUb8zbtrZBHzWgY8QVF+70RWB7JjWvrvNX
 zB9eFtd6uA5iowL74VBvk4cJgknFWoo76C2jgFKNawr1E+mOQjHxp5KKcoM+2JtNINsk3R4wjoq
 xPN3TwGPNJO9bA6tS19h9fnEFLJLO+xyXB6GTnEBWo36z7mG5pssbevtsI+kN+na8+H+9+RY0cd
 PxOFsJyIBrcb0XHZ9EV68dZC0LQl7DulfGCLh6hiTn+DwiFn0KH9bNoTk3qbsTQWP/i2hihMyxD
 YV2SbP8oC56SwxAb7hQzx4vpit/Cs7aKxdbGU47uYS9wSkt/DgRpFQld5yhMqbsth2fDte6fRFL
 Y1uo4i70kLXeyP6aUK8w8SH30CO3kmPh3bMdVF6TzMO9MUnYKnmTV9r6W2p1EBW07uB9mLWRf8V
 AzfMPFwJ7l3r5OSOe2FoSOOCe//DzfmZmeMgf90tDRh9jynzenWcEv2iVArE2khhRIvdwa9kLDc
 OF7wPgFWNaWbBzg==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260213_030759_849235_A1AFDEC2 
X-CRM114-Status: GOOD (  18.74  )
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
 drivers/i2c/busses/i2c-davinci.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/drivers/i2c/busses/i2c-davinci.c b/drivers/i2c/busses/i2c-davinci.c
index a773ba082321..761de5a814df 100644
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
@@ -760,9 +758,9 @@ static int davinci_i2c_probe(struct platform_device *pdev)
 
 	r = device_property_read_u32(&pdev->dev, "clock-frequency", &prop);
 	if (r)
-		prop = DAVINCI_I2C_DEFAULT_BUS_FREQ;
+		prop = I2C_MAX_STANDARD_MODE_FREQ;
 
-	dev->bus_freq = prop / 1000;
+	dev->bus_freq_hz = prop;
 
 	dev->has_pfunc = device_property_present(&pdev->dev, "ti,has-pfunc");
 

-- 
2.52.0


