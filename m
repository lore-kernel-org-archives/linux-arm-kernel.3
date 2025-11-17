Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94F7FCEBF96
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 09:05:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pPjU1ecCTuWGBAgFie+Qqi/4OOu+1k326jCWsM9etTg=; b=LNxCfiO2UraBGKsR+E5zA8C+en
	YJ/gN2v5yYZ1C9fmQpQ7cYA5n0ecj9EL+9tH/QDy2LYhWIus4vWvGKzOspQNw42iI8qO9ZBjlklf6
	NEQSUmjRp4RTp3gRAmO98/h6/sA7A58GJda7sVcsmrNdlbgXlvNLIf99j/0M2hbAFYMXc2tO24eWL
	NV2GKyrKR4+UZES8IwPqEs4EOc+iOia6ye4NDMV612r6NbdgWxiaWyt95nE+lpJxLQaam9CP8Aq7U
	g0vycbdtd3XguKZJiTh2FZ7mdL2NyROBruY900DEwd99l0Hulxu+jsyi7LFt617P/alGMRB3oIXUW
	CYSWKEyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKvBE-0000000Fk1o-2VhL;
	Mon, 17 Nov 2025 09:05:48 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKvB7-0000000FjyH-2r7V
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Nov 2025 09:05:42 +0000
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-37b99da107cso35990931fa.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Nov 2025 01:05:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763370339; x=1763975139; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pPjU1ecCTuWGBAgFie+Qqi/4OOu+1k326jCWsM9etTg=;
        b=DawumlirfYELhk+e/rTLQMA5I5tnPhyJkOwtaPDN+BeWwQtH8RHB+NFAgMwBjTfiLQ
         cCI4jEuGgsjzGl/vopQ9LrZYbKaxiyRF/BaI76Q2MTckrG5r8qVJyy9m1qHukgZ76wDC
         PxTfZCP8O2wEF6DShwCLFjeBiKyshG1RlWv6UzXJ/Hk/j9VhGSVGavtXIeD6yKi6+jr8
         geYd+21eHexFChCfaSRFrd96VSgcHkwusl9J4qnbq3idFh49Zf3xNhOXFVM1CGyuUXro
         MgTtujskbTYNuU1lC6KGgJyYF+fEuDiSKFVuRpODPI6akgQIJk6ig5EwyU6mHyqANqvI
         dp/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763370339; x=1763975139;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pPjU1ecCTuWGBAgFie+Qqi/4OOu+1k326jCWsM9etTg=;
        b=UlWxFVZiyBS4cLQjM+ikJI2yIlnY+xryKKim7L4g+DdyLvdRDiQWbn3ZQjVaiPRXED
         dRrL5u4DlPje64bxxmAQLdxcNC/97JmH4qvQOJ0nuUSiIoW1MCYjx4gyyebztsjYeA+e
         7AUTz//X16/7u8ZVYL0CL/bsUrz0MKofXfHldmWOkbCyfL00c1dYstddfkSKr47ci4Ka
         DPxgIqCKSznCC49KsRJDU2m7SY+BjlUNg5jnZorr7MzFGBcC9XIiCrIr2B60lN4w6TIm
         7S/wzqqCO15FwXBT/nGWlbNeVCZAP0ugXCvhZSAfgmYHGZx+PJ7wr4359msCRXL1yvi1
         5LbQ==
X-Forwarded-Encrypted: i=1; AJvYcCVK03U1VkQIJ73OobsE4Kwb5XOK/2y6HxZBU2F0KzWBdcm1mJr2z16v+rs2OjdxHwslfpDe6HlhgQfXfctdQWA2@lists.infradead.org
X-Gm-Message-State: AOJu0Yzqd5mdL/yiEHzdk7EKjUjdlFMTx8YR8xNQe9UHtH91xFdluLLs
	l9vvJKejoKECejOv2kPpolEg6KFw/DeYKazBHaEQlc3/W7QBXKYyArtm
X-Gm-Gg: ASbGncvYoqLbadiIIdYEjM+IMzhMIg8eM79hPr1zR3zaMNNLYWShDTkDXKDY98HCz5I
	i2gWYoccHqB7QORQN7Tf0SkqT4ilxiMEh/uMcfvYFjZT7O2CQKfbiJMBFeGhiuYgSZ29hca7bu+
	VK8li8z+Jn0RzeeEsoStXcsrCdQV5K+0lz8icomjx26ntSBSXQyIE/1o2FYl8YeBgbEAgWXMHeI
	Hx2BPmOGZpgU0ihB6jYx6Ijh/rW+pSDuvjjX2qWjoIm6BNBu8IehXP5Ink0pMhXhrHwoTBozipm
	vhsL1tVSBTjPST0xnI9GX0nPK6YGwyWpwgFhrzRwjos8ZnwC/dCQL1MJIA34fxea9dJn+GNE3qB
	tQLS9F8Rz8oCWmn+GYr7HS9lmWJ6ozLHRjOdt4NvBMxtSRl0uJyujNuJgESzPoI5DnP8t0qEBbB
	UdIcbGaeVJehXrTC9jsNOWMSNHAtzsNxPP2nLEZLlB8sH+ow==
X-Google-Smtp-Source: AGHT+IEgr0MyDzCKNzHmShjCTLcnecyKiJg3t3ocIhl5DpBA56xE4kTsmmmC7cuP3GGPWmtmaAnAlg==
X-Received: by 2002:a05:6512:3e07:b0:595:81ce:ff83 with SMTP id 2adb3069b0e04-59584209400mr3464795e87.25.1763370339347;
        Mon, 17 Nov 2025 01:05:39 -0800 (PST)
Received: from [192.168.1.168] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59580405693sm3023727e87.76.2025.11.17.01.05.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 01:05:38 -0800 (PST)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Mon, 17 Nov 2025 10:05:00 +0100
Subject: [PATCH RESEND v3 3/5] i2c: davinci: calculate bus freq from Hz
 instead of kHz
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251117-i2c-mux-v3-3-696c83e3505a@gmail.com>
References: <20251117-i2c-mux-v3-0-696c83e3505a@gmail.com>
In-Reply-To: <20251117-i2c-mux-v3-0-696c83e3505a@gmail.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Peter Rosin <peda@axentia.se>, 
 Michael Hennerich <michael.hennerich@analog.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Marcus Folkesson <marcus.folkesson@gmail.com>, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2849;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=v2z8hyK1XpH9sRNEh0FTDATeNOoSf0j273yYmUHhCVg=;
 b=owEBbQKS/ZANAwAKAYiATm9ZXVIyAcsmYgBpGuVPakARFkpRXLd2kbW0oIVh4Oo/J5FJfs9vS
 anUBgOwm1SJAjMEAAEKAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCaRrlTwAKCRCIgE5vWV1S
 MtjHD/9Xc/qHnz2R6dEBP2Ga36wZqa2NXUUudlDk+Xq88nyEhsswUc/TN24vSq3bRmDkGlx6WsM
 nsZTYmDMNmbVMTvVQRMpeYuPYDjaDOhfhq/uZQQnButVC6RQ/ywFiiGjf/jY+Z0DK1vKB2IJkUY
 A3foxz9SXndjYgZ81G4ny6E3iyGRSva38/fq6r188Ky9IyyqARqR132g2fWA/aTPLKJYRq37OjO
 HCocln7DTWZU7OYEC6CzoygWXaoU+wm+PXOiC/85JL7sDNd86s1K2PQPo8tnaRYe+A8mQsK62Ox
 fuQoOd3/R1viHSaBfOT9g8aCAXPDXp9IwB7tIblmFUdQqxWiH/rNCEUtbPbSLS06rS0MWBlzmTT
 We4/6CPlM0MQMd20tYck070c38uZd5VEedWp5P97JyLnwsTutHtBkZJO38khQZdyBvEM53X03Jw
 KsIpMMtNTF6bn4HqNNBh6FCiWFbNpISR1JeKG4ikTX3NEEEBn3BrErWUIWgwqu4lAtWpC97yar8
 KEtYTbIuZo9s//8J3qjgTi/EEnfsxWtdv44/zji41hBHQULvVMoA0+AQ1vLNeGuNfgcFV6b+sJk
 veuAQhZqC+yzlE+MKj7j3RaC3YVDNaZRlC8a2LWDfGFHHQl+9eXcoDjMVKCfTtZEjWcLeScQjTT
 ZTtpcB7zsgCM3uQ==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_010541_763179_205E4081 
X-CRM114-Status: GOOD (  19.10  )
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
index 6a3d4e9e07f4..82f295619c4d 100644
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
2.51.2


