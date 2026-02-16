Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA8FFE7BDB7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Feb 2026 12:38:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hgLydv0OAbPSYmy/7mtUdSMM6gy3g70cS63c1sKd/bM=; b=LtyY5Z/ywwEexzataP7pkcd8qY
	z1tksZDEo2juAZIeg9OJwQb51BtDmLoOHj4y/VC+rtHZVyZFG3j/+zeQN1jPwOAphgxmsP143SrfO
	LC67HVSX8ZMe5YtRaZ4HnnFUIuSPQqA8rEg5Pw72V7Nnzb4aZ5lAS70hpEQ3cq2mFYQeCXbs2m12U
	t0uExwCkoKqmbqbs9rK2PhfCEabS1dgIyegP8dlOYo8vwI9VCOKWhAOdPYTJ36K15P5SDbeE01CrU
	Rij1/KB1kWF67AINFtZKx7rnPRAK4OZBxqWSoKFZqxZikfDn3Bt1VajFa0R24LhB07iGDorSDpvAW
	ifYsBsPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrxs8-00000006WdA-2WUo;
	Mon, 16 Feb 2026 12:38:40 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrxs6-00000006WaS-1QFC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Feb 2026 12:38:39 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-59e5c540b9cso2603648e87.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Feb 2026 04:38:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771245516; x=1771850316; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hgLydv0OAbPSYmy/7mtUdSMM6gy3g70cS63c1sKd/bM=;
        b=ZdbQHj++quVJcvHkCrrEs45zakPj+eKWOV7TZd1AZquQR6Rp1Wq3skP0xYafOjzlQs
         Ucf+hwrz6eVhdQFFnflaJV72CkSAlaWhf+AA7mg2vCKITmBUO8uIPMYkJ6hg8NhaiRut
         uXkJyuS958eh2LL0gmX/ixRGXPPXoHFOkj+WBG4qB8EMbNvLjLo38A9PWcRaBLmn9/9t
         fILL0JhujI4iDr0Oy8uT9Z4bU7KhdR/yqioSg5XoOmKor9iMK7HS/5SzVVMEW4uA8Wmt
         AwhWoksVpblitptgZWnaeCLNypYAvE7UObxwqW+Znlluw5oaPkf3jyJlRlISSNJtXlaR
         C3eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771245516; x=1771850316;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hgLydv0OAbPSYmy/7mtUdSMM6gy3g70cS63c1sKd/bM=;
        b=IQ3yEpLHqe5EEHRRLBj2tFodm2t41TN9mOjtOmhaRZPY6AL8bVdQF91ZF7yKcuC50+
         kifanemU+TS1xpEIEEfGz8+uAORVnsmYSOlpN2nQZMK+kS+JLOpCgpX6pUjaEU8pI8yS
         emC5qqQ9R2KZjzxtb35oi5RBrV2lZ/gNEVpUqHOzwl4mEh7KDQMoP2lsrBkrxgXRzWjO
         kRCZ+tbxKKQplIXBFpUxonFVzZv/W+crPPdGBc9dKqJjMTeC1NGyurJOkeFz3yJo26MD
         PQzQhOLkfTrLBsMbUAgAorwL5waOtKyTM398RgYbNZPXcr0hqoMEXK8cW5um04KShmhx
         i0pg==
X-Forwarded-Encrypted: i=1; AJvYcCU8Sp8fv2KrniTYRdd2gIUSdB3rlsehwBecg9sKo9mRlHjKShjKxaYtyLhyXcn2ZnCN/4OpESkONbK9IWHDXay/@lists.infradead.org
X-Gm-Message-State: AOJu0YypQvz/8nnEzZ49pP2OKLfH3/aeABLRZN8mWFkGyGDmEfOzNnBL
	+02X62Z3DqYDPvjSc7vZjapB75ARFwSsSjg0ZN6E+B+k6Mhr7VwdqTue
X-Gm-Gg: AZuq6aJ5xOct8hj2zcp/862KzIOpoIviMEwBf4LCrbWMhJFhnFmX3P4wkSkyxYYvNIQ
	p0PPe5eyW6mwvS+vi/wvwdu4w9EfI6LWeLB4Gk05HAPFio5xUqYCXcmFM3SfDwNWWyQJpHC+vUx
	K7PENhIiPgQUkipzCzRvsy876mQIT8OaXaRck4/xli4BP2vJ09I7rWoEwfiHp4ZBOZdsRpa/4Sc
	yMw8NuhNj/7xmZ4G7rRU4gia2qm0MZ63J3PE+BIYZSv25Ck2g+KmZw1QvZWRBy4jex1vosM7WOy
	7qSG3NiacMZw2DEFsUuIcwGF1FiQJ9TTSKkG7YSp2BarE23p5I6kEIJCz0aYGtXnTaxfw0hSANy
	D3+961U2ksLqgIjxTKzmjGfX/7/oEkFM1QJKxFpL0zryf7nDAnia9h5HzReUN8mvnyo2s8IVXmZ
	Za/MZ4K6zyZYl2VRZwWd94GdyUfFTdS2eyTczizLM0pXM1/QgQpyN+tk/ADrHhZj7YxLnb
X-Received: by 2002:ac2:5687:0:b0:59f:7ccd:fe96 with SMTP id 2adb3069b0e04-59f7cce0005mr50852e87.28.1771245516024;
        Mon, 16 Feb 2026 04:38:36 -0800 (PST)
Received: from [192.168.1.135] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e5f5b0577sm3175920e87.71.2026.02.16.04.38.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 04:38:35 -0800 (PST)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Mon, 16 Feb 2026 13:38:15 +0100
Subject: [PATCH v6 3/5] i2c: davinci: calculate bus freq from Hz instead of
 kHz
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260216-i2c-mux-v6-3-9be28ecfd7e3@gmail.com>
References: <20260216-i2c-mux-v6-0-9be28ecfd7e3@gmail.com>
In-Reply-To: <20260216-i2c-mux-v6-0-9be28ecfd7e3@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2849;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=NgWDqx3izSY9aW9W75gFytkLHJndTcTMdemaHAZbfa4=;
 b=owEBbQKS/ZANAwAKAYiATm9ZXVIyAcsmYgBpkw/NXf7RWEjJ/IHuBDaOR5YxveNI6Lowg3H3U
 elFFoc1vxCJAjMEAAEKAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCaZMPzQAKCRCIgE5vWV1S
 MrLgEACZHJ0+g5pduSJlFU/RbYUHW2lmuku+IK338ZI1j2QH7T1l+cotOX7Ww5+L/OeSUDrwUy6
 CE8TXG9ijuh9gBJ8N3b7PYGVFEe2PwqQQsgW1RJpLPxwYm6MseTIm2fIRwPUan44PWCwUVV+AyL
 VGnahHqu3Qn8mSTbYdD114xuMzR6XWsZ5hThlJyDijmMCj4aSxtBDWVJgxKHFwl8E0rnfa07wCT
 gYKd/2/18wr61E3xHJXFrhTnSuzIPu8uKRcDVi5hiBfI2LOKnpzluSWqLc8s5nCbPrYyhYne1yO
 Vpv02/spQssfx9PV9Jm7EiFTFg7AxaBHnVoGrGQrLyMkKUUsFNRVd3YqOLSPwKRQ576hGEs6HrN
 n9nQpZUt0SFzlLXEdijzT86rjkKt+tytvnQDRtTiqJ/i1t9YY18jJ7TohSAyAw36vbkat46P9f1
 DEmknjjVwcp/4dbnEtsflYF/SH63toL6P6ZI4ys4FwS57a8ei40VtZFStSko5K2j3K9TuV/z5ZX
 ljs2xYiu5/lz1UosoxgYj+xvbWkdULcj7DOqZKcOSMjPfhKbA3af9Hz3NHBnGiWZ/2zi8DCX/n1
 uP7xRprEudez2VV4YK+S+1BOwPFpzcCFlQpU/9YK++8/JXDX2QoEq8DVS3oWSTGHlR1Bco0RX/C
 kgnMaMsoNUiJ67Q==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260216_043838_410622_A14CF0EE 
X-CRM114-Status: GOOD (  18.76  )
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


