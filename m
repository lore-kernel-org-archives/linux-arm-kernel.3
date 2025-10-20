Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33AE3CCD199
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 07:18:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ahXnYEIy0Y1Nce01ca/pyKJBMfwBwWqGfxBJ5FNQLYM=; b=VQSOadlys5rQcCzmNxwfz0VxOD
	M3WcdbxGcd7OOJ4YJil0gF2QrJveXIWR8dML64pBcmdrDki19IutLM0E4Jckte+HBj9LpL8diJ/hm
	Q2fQMDEwr7g2H+mAeGFP8ILMa4DOIyoZEUiQiYNMLvsZDCFc5UWbrz1cKW6fbxXFKBXm7m1d63zdG
	iRAMy00pAgjnA1jpSvV6BQRRJXOVZNYy+lh2jGI7GgWxOAAIGAcXeN/JDIlPmNj8QApfkDeKsJQaD
	MQKQ/v1Up2btvjm7sjBItwzLou44nX0naDfg13s9i7JGJiK3oMwTXqwRJAE9wzEPTrupPnfxYlk6W
	YZ+xjxwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAk9i-0000000CB8U-05G4;
	Mon, 20 Oct 2025 07:18:10 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAk9b-0000000CB4U-2q7l
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 07:18:04 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-36a6a39752bso39646041fa.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Oct 2025 00:18:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760944682; x=1761549482; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ahXnYEIy0Y1Nce01ca/pyKJBMfwBwWqGfxBJ5FNQLYM=;
        b=hEqU0l7Z0JpXFcxsIgVS7yZW8RYVyxp9kmONI/10fzz1+kUfengY34LPphRR0krhZk
         fVhGrQ8lR9XbchTl6ZQwuJPotKQZLQXvgeu/4mox4nJivGso8qXHHJBe8y4zePZGdfTH
         b87TTuvp7lLG9MY5/ed+fm4/15703rYpySSssQ3ehAkApL2Z666lMOz1pxi+ZP+s3gbP
         hVlRAUDnJ7e9smvKdaWOlRPwP7JHeTG5viTX+luTsfgX/unk0ESW5kTlpSq0+HcCFZKT
         wGyf7Cnnp+H2aERPqlBsHlb5h+VoufedFxw9yI0xBYvgC0KLZdL2RhUrPal1ZtKStwxY
         X0Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760944682; x=1761549482;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ahXnYEIy0Y1Nce01ca/pyKJBMfwBwWqGfxBJ5FNQLYM=;
        b=EsI9t0TljAjXq6dcvl3VRfPI3RKtdR+nTwkQ3Mn5wLT4TQ/v/bfsgeycm3fFM5Dvvx
         Z+5/mfKDXG7Wd1k2AusB5fXjzpZeMVf/W3WqRDfGUuvqtOe3+ytkMBdT6UoUvQG/rqgu
         lk8XtaWOChek8+/G0GtxZq6AM5MW/nFIzrwYIMZGCjX3s/xlIIvHWqF5WKuv5uJv4nbB
         EevCOmiCYuPhm9HWGckUNLA2/EmsM3HhQ8dXKTe5Fwz0hRHeGfw5WeUbbwTGG/nzvtm/
         QxVGCzxvIxjEG9cMaH5zPvrbA6/kTuMHIZv4s0sPcNw4Sr4eR6HAvZ6+D9ONmcmlTC6h
         vqRQ==
X-Forwarded-Encrypted: i=1; AJvYcCXs21Ln8vmr1cK+FPRSc+V0PnFScW0KI/hJbDuq2G1PvX4zM11goON3GVvvsbvPNtcVR5jRzXGT1GzI5K2Y8UCL@lists.infradead.org
X-Gm-Message-State: AOJu0YzjzFuhghw7o6eM6gQQQPW+38gL2/DRlZESBKTUOryw4Kkovjpo
	VJabc21C3SUSNQf1q27drrGh05JzKrkdZ8hajMediw/Fk0HSza8kNmzG
X-Gm-Gg: ASbGncu9MhkEuUOwGd5EaISc3LwQfx3GHH44CXqzea46jefNfIxgsG4ZGmqz77F8hem
	qpQH4a1FZXPIN4flU7eIGxPyZKIDXBY0E1jqmj6gvkyVJo8bv9S5nmhBmfm1wepD6O/2xghF3N5
	f4J3v8bTtBR3w/r+IVYJr/v+Hi4FZAc/+kTd3A2q/pfI6wAMSnDB5PdToiOzGuQbcvjPNh+cGSe
	egqi+SW1N7sfzZ7P8JkdrP6Rn4Rsldrvyso/RuTGrIPE+9C49jTaPIzUWMOt5/lIrciDqlFMKe9
	I4oHNPdmIBF8cbqt17OXqSlANh7jUv6KWmbcX0vGqfgJBb150A91m+oBuYxcS+DconX7wqQ0+Wz
	s7a8vOvAngmr/k/s5/UhHdXbaiLZrAPJhzxDThEeHlQgN/HIYi2tfmoK57UPSahTTsIdVnauF6B
	dcxNSbOWSmFCwyvOsG1DYeyxJf2Hm96seVtBmePQchGHAc
X-Google-Smtp-Source: AGHT+IHc20f5dVJc4cXk+lySAahWKiNgFNk1yyb9uo2f2CQAkVWvE8JLzorsxqq/7Nc7apWUcybs5A==
X-Received: by 2002:a2e:bd02:0:b0:376:3a83:4287 with SMTP id 38308e7fff4ca-37797ad9579mr41086221fa.49.1760944681398;
        Mon, 20 Oct 2025 00:18:01 -0700 (PDT)
Received: from [192.168.1.168] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-377a921ae62sm18863341fa.21.2025.10.20.00.17.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 00:18:00 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Mon, 20 Oct 2025 09:17:26 +0200
Subject: [PATCH v3 3/5] i2c: davinci: calculate bus freq from Hz instead of
 kHz
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251020-i2c-mux-v3-3-908ac5cf9223@gmail.com>
References: <20251020-i2c-mux-v3-0-908ac5cf9223@gmail.com>
In-Reply-To: <20251020-i2c-mux-v3-0-908ac5cf9223@gmail.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Peter Rosin <peda@axentia.se>, 
 Michael Hennerich <michael.hennerich@analog.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Marcus Folkesson <marcus.folkesson@gmail.com>, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2905;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=FTihK6uYT4ixjF50Vw4ynXL5CEP05/iNF9Xq9F5RApY=;
 b=owEBbQKS/ZANAwAKAYiATm9ZXVIyAcsmYgBo9eITJgL8eZ4mgTF7Sje1LcSSVkFjVx0hh55ZX
 UtvDGMzVRaJAjMEAAEKAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCaPXiEwAKCRCIgE5vWV1S
 MqBmD/9zCdk4ai36HV8z4fap4cJ5nFGwa+6KluAzekdnmMs0wj78o9UrLZbVDEJnMFlPu+WDe/X
 9XiAy6rx/lR3jqukyWAfHrVdo1a0XnaZf6J7SvWJ6shWdnWpjUiEwOGSsv8X+kTR1Cb1ARvWanQ
 KvaGaiduD3gMq48ISJ4bHdWx0QCSetCnP2H5n9TLm0dh7hI1CJbq/OcQIUUuR6a+wRl9S3TdLLR
 xIIr8NlRS/ZxbpkhYqSXTnCyFWwPFaC1p6O1zYZC9ysbwZN28wjRWoSl7kbAkA9d33kaNlA5XvP
 30hYgo4s7zQbI/eTbK453pWv0HG0yIZevd3mk56cUypMoNcH/JNaEGW0WIGubADCELJXJnAsmar
 UaAm6hOL0FQApzNYUNSAy/sYN0jZtnoC6SlkKfZf+odNAw02mIL1Y8Eu+80UsDzUY7fdbPFv6GD
 x6zWB1uPfQ42kdkknvYXw2crH42kAn9jTAPIiEmMzIltaQ/Gg6sBFxrfyDMikqTshhygltgDJjB
 xTdqO2ptb0vpNLWTm70c2+BUU8BVkHaKwsvGXd9Em7M2NEDph+iKIhrfQXE88aVXg8GNymcZSug
 3RP1LH83VcZMwAXMscQkTYojDmMRABe9Ch3NYXyqzq5M6/sFK39GKfznPjbfVh/00JmAh6cWpjN
 JHx4QmCeU2r52aA==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_001803_752244_16D999D5 
X-CRM114-Status: GOOD (  19.43  )
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


