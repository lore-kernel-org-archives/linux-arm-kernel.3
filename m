Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F527D116F6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Dec 2025 08:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pPjU1ecCTuWGBAgFie+Qqi/4OOu+1k326jCWsM9etTg=; b=K5bElPUGHz2czu8WaLl6QoLUk7
	eortLD5JukgGrQC9EfPxM7/Ovxk+ttglztAitQrGKuqgHPOIFR4L2sBddVgAgCfMBz9ZejHXyBdC5
	6+r4BAl5CkNhgwK8J4QQ2bjkrnSwn6n3MQVIS+fQHVsZOwHnVyIXvOfie2oMDSQABN61SjF/8nsZl
	G9E4LI2PlBBDSG9jldbKTzyi5CHcSr91NyPJZN1pKdULLNB0QFzk0o3eqSrLHTKgcmo08Jk79lnx4
	FR8TedsGRUud+oAuXM7wYErv54ZdEqLQT7OExuu+93XTco2eWEd3mTb3phmYnN0iS8aaW1Do6vHGm
	UZNc1b2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQLTh-000000051wq-1gjM;
	Tue, 02 Dec 2025 08:11:17 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQLTe-000000051uO-2pSl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Dec 2025 08:11:15 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-596ba05aaecso4539343e87.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Dec 2025 00:11:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764663072; x=1765267872; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pPjU1ecCTuWGBAgFie+Qqi/4OOu+1k326jCWsM9etTg=;
        b=W2bNN28lwDUL/bDpSQpSOobEbtHSWS952gyidXcOZlOwO5PIObkDJs3g6NuiNAP9Hu
         YEFws8trdEI5rltemG+pACiIXEEjdpdugRogYTf94faT2cf8CYzb3+NHk7hdExs8aAuS
         TEITYqW8BI8DdcbYVU3cs/pOEQwYayvsC15LDvSq3P9S9H6AjJereZt8ttoAIFDPUyie
         IMM5dCRYvfxfv7zdCDTc0gxdiWjlM5xIAUWcpF1QuqQwR4BT/4tG++P4to+xUNwWJh50
         xf97gefwi20/C0W2TkVEPwvo7lzm7tkjg5T6RSL5ouPIEs5uJShPBYEpjp4eIgCfwaCa
         lPDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764663072; x=1765267872;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pPjU1ecCTuWGBAgFie+Qqi/4OOu+1k326jCWsM9etTg=;
        b=JIDgZ2QEux7ems/ZuYaZwh45ouFJioEsGwSWg26Q+dw2jvqRvIUvyI8/mi2t6n8YSw
         1wR88oW6Qkr+arKzkS0vjQxSNYf1q08F51OGBRySSc/AV0mWTV6MWreHz7kCseGWOKqG
         DKtpFT4UgN2GY1SLyH3b9jBbBIgpLcTuWOC6WdzNg8YtPddKDhqyx7D050PKuCwG9vEe
         p6meT9iE6JKX2tGzIakBfz11+eWx4NZOM08bATAaWEIYxY0TqKr8wdi83oQUDhxzVgF9
         49a1bXKgee5gfrli3N/ZhxQhb8Ha8Xbrhwt/8mEch7Mh50IAfbkHfs8jYXU4H/NVPyNk
         9Tyw==
X-Forwarded-Encrypted: i=1; AJvYcCWysGRoZ/TwdpoHT9/NFMC1d6HnJIPvtycFsq169RiBLbRBDlFfHhNH81Sd8TPSdQfcH9NkZ2UhCqyb4/42r/Hf@lists.infradead.org
X-Gm-Message-State: AOJu0YzyIuiF2bv+W6ARiaqTRdyZWH21Yu8FXihNfrqcJrcPpX47sWft
	UtMa90s9kjakvU5qPc/rIcXA7K9acu0MZj0aGdeXGzz55ywyLCzpJw3i
X-Gm-Gg: ASbGnctpZ2VuehEawPtkmDw1NAAnIzJyBeik9/w/WjKQFCUBz3P6WZ5X9TJPK/k8g78
	xWS/3q1ZLstG7vduWl87YTQOdmlE1DCz1yXum/25RH2M2uGn7jHNROqdI+JL2dNHTtKfX+HQuQT
	t5nk01oiu4wcUa9J1mORccteQgfJ8DKENB0+OleDiekzG6BhsTVJk8J/QsuR33HUPyU25UUta+1
	g+0MzglTZptWkjWAzdYZWAZBj84S3oPIbZE+HxKbtyOIQdcSMkd08FczBr/8ICIUk/LwbLv0BY2
	oPEMWi2cO2D4NOIZCzXj2objknxKA/jYavhjJwdCjPziVunCcuA7byGGSIjmozFbkPhVWIEVV3E
	iCE9te8q1mBFAEW2wKegWKf8kkCpSIBi43+6Eag/+2WryOgMOjbXZ1QjqY4hA9s8WzO6im+ooxs
	AApKe5bO6uyDlNhJZNBNVjH52jjOpzt4z/dOP16rc21DCv//wY/GafyzZ7
X-Google-Smtp-Source: AGHT+IGPFRnF1JlsylxIguYCMgo0UnvFghOw9F7rpNrbszZotcQLK1KLhFurv2Yk69urNHDaAj27Yw==
X-Received: by 2002:a05:6512:e9d:b0:595:7e2f:cc61 with SMTP id 2adb3069b0e04-596a3e987abmr15387967e87.3.1764663072367;
        Tue, 02 Dec 2025 00:11:12 -0800 (PST)
Received: from [192.168.1.168] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-596bfa4f8a2sm4342412e87.88.2025.12.02.00.11.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Dec 2025 00:11:11 -0800 (PST)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Tue, 02 Dec 2025 09:09:50 +0100
Subject: [PATCH RESEND v3 3/5] i2c: davinci: calculate bus freq from Hz
 instead of kHz
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251202-i2c-mux-v3-3-877dcf478a9f@gmail.com>
References: <20251202-i2c-mux-v3-0-877dcf478a9f@gmail.com>
In-Reply-To: <20251202-i2c-mux-v3-0-877dcf478a9f@gmail.com>
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
 b=owEBbQKS/ZANAwAKAYiATm9ZXVIyAcsmYgBpLp8LfCH80Z2/O1kVVMD9letrKwmIKdAN6JBZI
 KxyKBifmRaJAjMEAAEKAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCaS6fCwAKCRCIgE5vWV1S
 MoSfEADZmQbGCD7jr8sNaQSRLQ3o92mH9KkrlHwUSmibVB3H7pggLXptlMozSNW95T1ztcjqJGK
 uk6pkcWjE6PQJw75ekICw7EFDv1jtt8I/+377dGiLM2/hLTm2yKHkErWvbJze8hUCKzFZNTzBCx
 zJoCorS5lOAMvQzbAG7/u/LGgqc1jBnj3l9uliynlRUq4tp8LqCNn+mv03IjVvLvimVBWnzxzbd
 cp7KxdVlhcyB0NJt4BeYcLSDL86JCK3NzZKE+e74y0mjhiVNHWIrYBlem1NdkMye4d7FjHWYmv1
 eiBRDFCr1oIaz8GbUdlsmsc/FgXRoNfP+7IJ7R44c2bFZiFOX7Nj0/p6oJZw5qheehGcM6FakrN
 0yooDdWcZkbitZDC8DpH3UMnhDXZ8CL8p/BHaeRTALTSRD4JjGKU9C85KHgZK9iyENebYUc4YFM
 dz/6T8nkuYgIUamE2cKGxkcWcs4+aAtXkuGSVjOc0C29UW/40Mps2MjcxZ9+//rvEZGssM6OLgP
 VCoeGDuhz3ljdxbAiTJK6bAiOtLYrbV6Tc8p3LVM3DqtnAwIZpnYzlTGgv871I1lP3NsAUtDQ43
 mAHSkuhFrEiWSlcUa+F6lDBfscbw7f0NcJ9jgHejzdWoa6bJlYXeVXespdx7YVYJKA1pSgKQUEu
 UW8CC8AOTMTCH4w==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251202_001114_768272_F0A24DDA 
X-CRM114-Status: GOOD (  18.90  )
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


