Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68E78D35698
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 09:55:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hgLydv0OAbPSYmy/7mtUdSMM6gy3g70cS63c1sKd/bM=; b=2c/5+4O+SJrE+a8feqTR2Pf+nV
	710+B53mlb7Cl21F5uNx3p8LvPFpOPvFum54ps/o1kNA1jhre5FAqf4YFWmjpQUKXfea/aFHJ7DJ7
	31IBT67PiPHZtkyqdrQfDMPIP92iddN+IzK8her1WDfSfcfv0X0HVomrjHP2IUvVG4wbSQ+5gOtJR
	1UhYtnV1xcgVHVTdzU11vdEBPtdJ4sIMmBlMt7n4det+/e3dDJjjebGvffx0Fe6iW4iSu3MMm5ED4
	54mEdyXbf90S8xCVBmRJknSBwzyrz1oU/67Hnhh9nszTfKzV2x6slC3OGRtwqR5zwHZlk0plxLV1A
	mlSQEevA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl2GZ-0000000Fmk1-1Ozv;
	Wed, 28 Jan 2026 09:55:15 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl2GV-0000000Fmgp-2Yfm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 09:55:13 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-59dd490be5fso8682198e87.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Jan 2026 01:55:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769594109; x=1770198909; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hgLydv0OAbPSYmy/7mtUdSMM6gy3g70cS63c1sKd/bM=;
        b=j5oCIxKQxPdHmRxxSI8ME2T4QcUWlqC5AYkZW7+dUNzjFgFO2qT48ozRhKGpfVufCh
         ZTbG3gj0P3DqpuZ105lkXeP2XOrMv1vz3kPXu2ChCzRHUz92Z6nEYKBgmjOw4KjgZ04j
         j8xW/S/AYBZqkEMq1XS2g+u/CRrGSwou+0UHuG7UI24/lMLUoXw53Pmt1xAHV2CIrwd6
         poWkQhha+ied3lBIzQDUT41sP51q/f8gTmfMgHlacfMjS4mkbx/8DJKQQe/cs0jZZxTY
         Xi/Hz+t3Z0ZjBGWv5HDGoRfExqs4pIawdfJ9p6QtDHvDlhUqgD+VUdd/2BZ/ptqlWSNO
         oIEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769594109; x=1770198909;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hgLydv0OAbPSYmy/7mtUdSMM6gy3g70cS63c1sKd/bM=;
        b=H6pnt08OhfmQFnS25CyeMq1SzywkNXOrDPsbk1DpjIIdj0f5pWucjlk0Mhr/XRl9R0
         o9Rqj357fJY8I/cn+6hVdiYSj3eIaniFM7tG47YhxAU8709JMygCNYajlpedkUjnuKzI
         DbrFBkITVvNjG2Vh6VDl/3GhuMZJ3pnT8gOpCSpGC/SDhMNmeu0hRUjvcG9akXPldGj3
         g8btwDZH7knOK5Z0AoXP/ILzj7o9FjzBGtVF/XsJRR1bqhf628NDixxoaTH8OdqI3fb0
         6hs8nr9g4IgaVkYYLPLKilyvNlFGnnTLJ4CJ8QstbI64rwUTz4R0x4Q6WZHvqbF1xscZ
         c4Ag==
X-Forwarded-Encrypted: i=1; AJvYcCWR2AQ62KoFi7si4Y+clmaMQ6CK/R265+PhNONScOwW+9CxBAbdNL6qoq6l6Z4dPrMQ4wkX8Ux6276oFQyxw0ei@lists.infradead.org
X-Gm-Message-State: AOJu0YywO9pkcy6CvNgJBSdQjr9G2wfsEiPKTeBZUer/Vff05Tj2kpIE
	zKM8b1Svp8ostPU+ZR18Nkb3ZFhUmhD1lJjrqwaG6Yvmlf9A6SLI8jYg
X-Gm-Gg: AZuq6aJFVbBry3epUYXXMolV8F9R3VXuph+7ugfiMCxhzOPawzuEX6InfpnR5qtqkXC
	gs47hNXXo1ln68Sr7y7lnpgyVa7SQzlzDaLneA+nw/YK5SxcTLHdCt+FodS8NkdJOmukp8b6tvm
	nr/KtaGu4N9kE53qMYpfjWQz3/1k1xirvIjHvQ0mtFlvs4zSHAcGXBdb5KX4N2EgRIaPJGumJAO
	cmAuOEW+8laPQes5cmQ1TdCffIjPYdgvlligBx3kw3ESag3VjO8DZFjfK4eGzbfE8wOZRAYRA5s
	0LP7pz/cL/gwB7pS4RXkoC85TcGrS9o8TRE0dxocNY7HPS8mKL1Kg7lw3sywnFNwOSvsVAQ26rh
	qD+XITVeDHzihwpsNVWUUo6cu65G9X2zP2c40t/1xGPGtqRTjwunIX+EPgGBGknb6Pi+wkENvuv
	3sXAifDmc3ZTQUKOT4RKiXpvyMFoFgO3quvIs8IM+xn3OkTUUgLPq0EJDM6uBf/9yj4A8=
X-Received: by 2002:a05:6512:b97:b0:59b:9ff8:468e with SMTP id 2adb3069b0e04-59e0412c83amr2449893e87.31.1769594108946;
        Wed, 28 Jan 2026 01:55:08 -0800 (PST)
Received: from [192.168.1.135] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e074bfe83sm459483e87.97.2026.01.28.01.55.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 01:55:07 -0800 (PST)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Wed, 28 Jan 2026 10:54:29 +0100
Subject: [PATCH v4 3/5] i2c: davinci: calculate bus freq from Hz instead of
 kHz
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260128-i2c-mux-v4-3-dee49ce276c0@gmail.com>
References: <20260128-i2c-mux-v4-0-dee49ce276c0@gmail.com>
In-Reply-To: <20260128-i2c-mux-v4-0-dee49ce276c0@gmail.com>
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
 b=owEBbQKS/ZANAwAKAYiATm9ZXVIyAcsmYgBpedztECNc3VxUquFpfx8TQoFrSB7cIxNlSZrqJ
 OhN7zzlH9eJAjMEAAEKAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCaXnc7QAKCRCIgE5vWV1S
 MlXrD/sE0/W8x83hap7Dhta6qJH+6wF6kDCcG1nxuNfBbrETgbLx4/lBqTEH+JGM1kh6cLk+cBC
 OXhIvL0znx8Ye6vGhce2X3A05Vxr81wpEbQbRe9QUN6obI9cvRO9lgAgQbU/G1E3LN0WuPUDpGq
 2keTYvwNLTRFhKa3oNJ0jVezTvxaBjegypn7VqGh/2wsAKFBac0He5JPPm5Y0QHZ0HynM7e6eKR
 vLjy2123DV8Y37F8GNwXvsgh/V8ArPWLz/AFWJgKnP1Jg71uGQkpoE/o+KHJg0VPmGzjdhecORg
 INeawLbjnZElkte5DoMf0b3Cgmef5Ai/CydViiGWFB5LtjrnpIOTC6nPXsekboiTW5n+BS5ce0r
 z8mC53lIH+iNWjMK/EloWDzWZRW9c5r+F5fRIedKlapVON883bMtMNPt6rfwpTjUWxPDfeOzbGr
 WAu806t53dfko2sVuyMr9WpeZcneLS+p0leVem6G+fD7tjUPct3N7Rt/g+0IY1ZFsDPZkMXxBq3
 awFcReXJ0Q0+/CwQCoZrfLAo8FZuVAwXO5fShHCu+8VuzXvmOkM+bsW+bF9VkSmRzrtPGDV3P5J
 LIVRvkRAjDPrO5S+pppy0mF3xvBoxjiUycdjY8TxrWA8CkRLSZqyUEosPD2ifkHPGiGF3stiWZs
 PhoubjCsc3jj1wA==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_015511_686780_D0005792 
X-CRM114-Status: GOOD (  18.91  )
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


