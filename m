Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A83DEA4FCB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 14:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NlHpayBYcqc/iH584SrkLhfCupAvJIo+BPnQtA6Sgno=; b=snUF409gRlBNKR8nqUPliYrXMg
	ckK5FSur5HPdiPIZXx/iLkDUT/6jwtmxsfEOBbBFlWH8LGlAcPeYD+yxZ+/cNxcCyJaP0Q06+HVbO
	SamWOhFKRsHu2iP+HVJQJamYlb4BU0OC1/PUJJQwlmw/iiTqNenVYRsFvyAJCJVk0WZyN4+9myAgk
	xZL9wzb3nevbufq0gknvGdBK7SqMMKt9XxPAowHhwSPdt5yb5cZn/JcpA5ARCe/ikZPvb5PV1MnCE
	qbWgy6bTRn4paR+Upmy7mqZTe6ulFpRCMmgMGAqVGjs+3x8XLYSsOshCA3b8AI8woTq0HTiLW7/UY
	zViDVzyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuX0X-00000000TXQ-1oDE;
	Mon, 23 Feb 2026 14:33:57 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuX0U-00000000TUf-1gBY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 14:33:55 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-59dd54b1073so4251870e87.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 06:33:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771857232; x=1772462032; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NlHpayBYcqc/iH584SrkLhfCupAvJIo+BPnQtA6Sgno=;
        b=d8EQ/ZyGvOOa21QOaQx57d5kn48fmVCEYh0hTezDOhaqNZZo3HfOTDvh+KONsB0ay2
         Xn+LeES9X7OvrDdO0wMnxGGfQzA3egdnX4wBZuhC9PApua2hK538aRcppniDpok58ufs
         y1Du/8xrd3eMnXiQq5aGwaHCCB92zd7yUvo4pt1wqT48ynKXu8MMZKtfxQg1SIZA7Vhu
         D4djiW47br2Uk42NKLymVnhthIk6HhdPmAGA5mzLAbpU2geLTeyJrFuKchmlFzZ2aqU1
         9yv/Mvv8ploxQNtc8D7q1rOjJkPn2JM/hpS/WiHo0KeYWpcb/zPY9Hu7I2vy3b2Mhmys
         kYvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771857232; x=1772462032;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NlHpayBYcqc/iH584SrkLhfCupAvJIo+BPnQtA6Sgno=;
        b=XQIkfm/TW7YF1TYEOyIMymcI+CEeIW6rBn5pbbyvHqVGk9Jb28eoyQPGjsVGa++NDP
         ChPUzFlSVZd3xW0sj0ztzoQymtABJlWxRDJtO0DW4ewVka+z/qa+PaMWwKtV/HSHJ5C6
         tNY20V5mULxBrGMQBP7GOnpzGKKnmM1Pmx79V4+YRuXq3gZ+bTk1sXv2Pphltr/D9N2R
         ecx6g5PlW1sF+nN6S/WJHBbGAHd+TN7I4UrtUn1/Lzj+Nhmts1Taoj+EO2nyvThImZ+Y
         bYPbD6lRLihWr93bVmYnqlZLcr0dnyz6p0z8CcQtkF8ROtLG9v1hDpKqC/lNpHpmQHif
         d5fQ==
X-Forwarded-Encrypted: i=1; AJvYcCWimlsG7k9LqctrFYxdm1cFck/0NIOIL/sRyWxzHZ/vtoaMVtyBRob9ZPfOtkhifne7H55aPhFWIT1DEmvlpzKy@lists.infradead.org
X-Gm-Message-State: AOJu0YxyIoEomnjHWHcj6r6diq9B8bubQfYDuFccugBt67MpzDe5PvDi
	eHEm2YvTjuEzlDZn06M96GzLpYBZRKIuebF8kXsVGJaXbjv9DehTI20u
X-Gm-Gg: AZuq6aKdais4OkTuH0GBOg376gAqhr0LB2RXV4MQl9PS1MWyFEaJVQMo6JwwVBMUauF
	vGLFEziQvVzt+ckqC9bf5jZaNs4MwsTskyHFxWuybsN3m0cuB7sz0exo3DPBJTkiMRojXnchFfZ
	pUQrzIEqCBYV4PFF+D8KE/+6FBEx+i4Tsy+m3zwZYkCtgufOgbpmnNMOWAA7lDFrpcHxA3o+JFK
	fJmTFy9Kcx+usGMWLbZbjJS0140T0xDm5rlqh1B3Lf3E71p+5hdziJ4UD/N4+tmPzDAGhaeMC7D
	R4XAXvEEaOIVSh1MEdQXDmuG5FiH8VbcNe5FvMNF3uarroxVLgpM8+55F5GFODLjhOrkXDniDg6
	A0O+6QTcsQePWMdCVkNx7TQKhdCZSTnTeohH7R+EZgbJ//0f9qPvzPBy+DQivgSGHq/3k4BjRep
	6hi9MDuY0fUgV6BLAgOKr2+Od8P/Nowd/bOtcFNT6hlzJ5Mz+bAsR2o1mVWL+xNyv2OLHChAUGx
	0BoUiM=
X-Received: by 2002:a05:6512:b05:b0:59f:71b7:4850 with SMTP id 2adb3069b0e04-5a0ed9b12a2mr2729556e87.49.1771857232010;
        Mon, 23 Feb 2026 06:33:52 -0800 (PST)
Received: from [192.168.1.135] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a0eeb16344sm1631709e87.37.2026.02.23.06.33.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 06:33:50 -0800 (PST)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Mon, 23 Feb 2026 15:33:52 +0100
Subject: [PATCH v7 3/5] i2c: davinci: calculate bus freq from Hz instead of
 kHz
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-i2c-mux-v7-3-ec75b214718a@gmail.com>
References: <20260223-i2c-mux-v7-0-ec75b214718a@gmail.com>
In-Reply-To: <20260223-i2c-mux-v7-0-ec75b214718a@gmail.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Peter Rosin <peda@axentia.se>, 
 Michael Hennerich <michael.hennerich@analog.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@intel.com>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Marcus Folkesson <marcus.folkesson@gmail.com>, 
 Bartosz Golaszewski <brgl@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2864;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=ZEEqeaCS8i/fQh/ydJoSPQSgfBIk2Lb7weS4NuofoIc=;
 b=owEBbQKS/ZANAwAKAYiATm9ZXVIyAcsmYgBpnGVdlhV+iSt5NluQ7dVjtjXvoIJaeUg0f+eo0
 AqUwP+2YXiJAjMEAAEKAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCaZxlXQAKCRCIgE5vWV1S
 MmINEAC5kZvmViAk8BONTPcbB5SK2etSLrO/aaqbtq9S801JoBGC+bUGSqLUbTRFbjMEbU7lXDs
 e9lj5kcKnupgjtUm2s33OJv0jnNeoAM/A7nk4485z35RDLF3DKJ1Ys2Fuk5jZnf5mHnFEjR0Rx3
 d2CakuaiCutPI8iEbaeKnivoiXYEZi45aCE1CIKoCN3OnWZa9KEPGOoxORg8x1/ZXNgDpF3FvNi
 4Tkm+CYfcA/jCfxe0FUv8me8RuZkqCi5mTr9pAk8NUMTelNOhdQQst6u3pCc/w6xYkxzCVrDcMo
 5lJFYyRpbbB4Uz+THhyTK4S6mRG7s+uku57/IzsfZDuuIcs/D0TpOu9OSfXO7OKyR2+c8u6PwoW
 wm5D9MpHBXpsHpSOU/EIvStAyo6jUWG0tovc+BORJwrc7fraWfj9AQENmNv/Nr0HofHVoap7TwO
 VoxOcShSKptyQjOburpGIFXjTXtKXThbTiMkRIsodWdV2vOslifczyEYbpFraopHfgaydkIUTlA
 rPqy6ndq0hAExeJDrhl9V4vCEUrZRWWxBO95IxhDhT04bPqPGH2yNE31w5Fr6/i/Pa04FtoKNg+
 OfWAWsV7DcHhaDYRPh4xnCG/OnGZd5PfsPEpikLYVS9DXiDeP68fcD39sZ0K1d2zdSwJ7nU8qt5
 yWtGr1duEV6RazA==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_063354_480017_0502F5E1 
X-CRM114-Status: GOOD (  18.78  )
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
index a773ba082321..a2b578e0a534 100644
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
+	if (bus_freq_hz > I2C_MAX_STANDARD_MODE_FREQ)
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


