Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82CD6FEC0F1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 18:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HHa+g9Yvknw/nsgWzBDeK9srp0wKwbZMTd0+ms6kC4c=; b=rZG//NEhx+Ovw1C8/xc0uNUVmt
	E1OuJZ4WPW7M1oVXVqXqjNBO29oMLdx+TWgrd92U3Prr+dErecuJnECmlB2OuKbLODLsjiuzZ86qJ
	w80pgsfyyx6Dwq9PXyIb3emkVnaW77BJPCvu3/7dkDM+n+gpwP2zCevfwJetF6V4bmS9jz5BRTpFh
	fz1grDhPDXzTE6dZOuRnTNgnJE+rAopOuznH+atAnJ7knC3jj1C7/xxUewUA2XAOfxZ7bfAVKVTAa
	U3WVhTqqPzNGNGUjulTIfqVGVJT+YDbWinFoiewBhIWhQfqBpqUSFLRPNP7VpsEOYxW78wqXSqcoV
	Gd3d6vAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w56Tz-000000024Ii-3X1K;
	Tue, 24 Mar 2026 18:28:03 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w56Tx-000000024HB-0Q7f
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 18:28:02 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-3591cc98871so2452573a91.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Mar 2026 11:28:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774376880; x=1774981680; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HHa+g9Yvknw/nsgWzBDeK9srp0wKwbZMTd0+ms6kC4c=;
        b=qUmnXV+I8Wjg4pgniYLUEnWvMc3I5lJiAHZ5j8XEQGdRk+N4wgEQJFLd0FbuB9MSeN
         lzp2uwcYjiJhJ+V3SXenAUMVGjZHubWVqEz8LFznamxgF9bV+Zs+JhO/X4/VWVOPALja
         FsA4X2z3seHDcy022VGnGdvxyiCJ8LPWmyGJQBvTpTPAtlNTQrUgf1oEnav0DIiA7vEO
         e5vAauV+8gaCjjzwMTMujBMY2OosOQi6yXashaGtk79c6VoyINtgY8ErMJbY+B8sLN+F
         NishPMdgjDLBChnf6S9H/rFRZ/2ljjUKt1A8xg2WZ89YYW/dQgXZpzDQfrku8hYP+7tm
         V5PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774376880; x=1774981680;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HHa+g9Yvknw/nsgWzBDeK9srp0wKwbZMTd0+ms6kC4c=;
        b=dsY8R8LExlWZefWZ2ZrhArZk5OGUp8BHQqcWQ58tb7AJ6qKlhECw8ybkHQf5tWYQO0
         ENabMBXu5cBMrifOR2f6qDHSMBOzdxFlbSaj4SE6dh4UluZgXSmCWXpj0e5iyfP2wqN5
         DQ7mn4p4Dp7DL6Wh1QVG8dWAh1CuD6QFy+OqLHqTd2ifgDvZQfm889gKfT9uBY4YTe0N
         O8+CeUzZARVwlYOpR4yxB9baYyHEwe0+Fye0VnXYQAk1UtVCuIHcWOenbcDsnRm1uW2v
         vEWqIk0KbKt0mNL6g27pgQpC/H8GCaBwca5TCVleJtEFKFIvW7vrNaE+WiehlCESSS2C
         chhQ==
X-Forwarded-Encrypted: i=1; AJvYcCUS1IH2L4Se9+7/okrYy3g61lfSKLGp63jRr07eRzIbt0a+v4PQ4k+/UdtX4VUzFlZTYwmXS6JeX7ZIITsg3cLH@lists.infradead.org
X-Gm-Message-State: AOJu0YwlcL0XbUq4L0ly5JuYOTXB2vuiBGWr1pMtVIZpLosV5DlKMs7O
	mbn+pjddXftGwcuBh3HmfeMruoipVymyaQI0fD/ieR7VQYFRV8+Mz4JS
X-Gm-Gg: ATEYQzxsrTKmZrCBWAUxvZr/3dLZOygSq/hRHWxzf5j4YS9LtArg4ZPv7TIt/Rd08cD
	9dpoFcUrRI/hpTkK3zRh6Fk7HI/IR2fv9IdJ/vmHjI+lV6UhJYjHZjWMFoioRNleghpP1MzqIuc
	6YXKoB0HdsWyaz6hAa9w4dxoGSvcBlbLsvsjMyPdcqa2iyCTU7n3dlxguh2jQ5Ef/8sow1rOai9
	vtNh1l9SKRAZwZijxMczHAOpqQw1YGqsf5OfC5Lxje6O2ChJ7pfRWpI18oO8FQptFuCe3L5dD2M
	f+F4cnJGHCEqhNVg+VYDsAliRSmPsbaQd9bBmX/1LkU0Vy/RPGqLDFbjehHUJx8moeoV6EWi3ed
	PDbLm0NzPz4e6CDCvE/5OaN/D1LIXqKy4KtB+4KHvFY9Km4mEgHJNAH8h9UbEC4e/K0/sFJ0VaV
	V2QHNN4RbKCtypLV0dC9ia0w3lcA==
X-Received: by 2002:a17:90b:4ec6:b0:35b:e551:90d2 with SMTP id 98e67ed59e1d1-35c0dd95828mr337562a91.28.1774376879990;
        Tue, 24 Mar 2026 11:27:59 -0700 (PDT)
Received: from [127.0.1.1] ([103.216.213.160])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c0d6060b5sm350576a91.17.2026.03.24.11.27.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 11:27:59 -0700 (PDT)
From: Atharv Dubey <atharvd440@gmail.com>
Date: Tue, 24 Mar 2026 23:56:53 +0530
Subject: [PATCH 05/10] i2c: stm32f4: Replace dev_err() with dev_err_probe()
 in probe function
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260324-deverr-v1-5-7e591cce33a3@gmail.com>
References: <20260324-deverr-v1-0-7e591cce33a3@gmail.com>
In-Reply-To: <20260324-deverr-v1-0-7e591cce33a3@gmail.com>
To: Till Harbaum <till@harbaum.org>, Andi Shyti <andi.shyti@kernel.org>, 
 Laxman Dewangan <ldewangan@nvidia.com>, Dmitry Osipenko <digetx@gmail.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>, 
 Alain Volmat <alain.volmat@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Patrice Chotard <patrice.chotard@foss.st.com>, 
 Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, Jean Delvare <jdelvare@suse.com>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com, 
 Enrico Zanda <e.zanda1@gmail.com>, Atharv Dubey <atharvd440@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774376818; l=3441;
 i=atharvd440@gmail.com; s=20260314; h=from:subject:message-id;
 bh=fUyekU3vIj3XVF9IEZZuF8p06qRSr8GpHENT4b6dCL0=;
 b=Lv6diY6U8yOO+wFg03BiFqyP3QS+BUZjUWZZhiQKaL58Ge1g8J4dtHf+S+KQwwxbmw5DUKteO
 KpFdph3BhEcCYkTzwZIrFSEDvv+nlC32lTjIg5IZhXq8rp8u8lOOdaA
X-Developer-Key: i=atharvd440@gmail.com; a=ed25519;
 pk=T6i1xWOKT/RUSDYATSgyVG/4X7ac8jPjRSG1mMAcqVk=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_112801_157644_179DA00C 
X-CRM114-Status: GOOD (  12.70  )
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

From: Enrico Zanda <e.zanda1@gmail.com>

This simplifies the code while improving log.

Signed-off-by: Enrico Zanda <e.zanda1@gmail.com>
Signed-off-by: Atharv Dubey <atharvd440@gmail.com>
---
 drivers/i2c/busses/i2c-stm32f4.c | 53 ++++++++++++++++------------------------
 1 file changed, 21 insertions(+), 32 deletions(-)

diff --git a/drivers/i2c/busses/i2c-stm32f4.c b/drivers/i2c/busses/i2c-stm32f4.c
index b3d56d0aa9d0..44e8b04962bb 100644
--- a/drivers/i2c/busses/i2c-stm32f4.c
+++ b/drivers/i2c/busses/i2c-stm32f4.c
@@ -163,11 +163,9 @@ static int stm32f4_i2c_set_periph_clk_freq(struct stm32f4_i2c_dev *i2c_dev)
 		 * to hardware limitation
 		 */
 		if (freq < STM32F4_I2C_MIN_STANDARD_FREQ ||
-		    freq > STM32F4_I2C_MAX_FREQ) {
-			dev_err(i2c_dev->dev,
-				"bad parent clk freq for standard mode\n");
-			return -EINVAL;
-		}
+		    freq > STM32F4_I2C_MAX_FREQ)
+			return dev_err_probe(i2c_dev->dev, -EINVAL,
+					     "bad parent clk freq for standard mode\n");
 	} else {
 		/*
 		 * To be as close as possible to 400 kHz, the parent clk
@@ -175,11 +173,9 @@ static int stm32f4_i2c_set_periph_clk_freq(struct stm32f4_i2c_dev *i2c_dev)
 		 * maximum value of 46 MHz due to hardware limitation
 		 */
 		if (freq < STM32F4_I2C_MIN_FAST_FREQ ||
-		    freq > STM32F4_I2C_MAX_FREQ) {
-			dev_err(i2c_dev->dev,
-				"bad parent clk freq for fast mode\n");
-			return -EINVAL;
-		}
+		    freq > STM32F4_I2C_MAX_FREQ)
+			return dev_err_probe(i2c_dev->dev, -EINVAL,
+					     "bad parent clk freq for fast mode\n");
 	}
 
 	cr2 |= STM32F4_I2C_CR2_FREQ(freq);
@@ -772,22 +768,19 @@ static int stm32f4_i2c_probe(struct platform_device *pdev)
 		return PTR_ERR(i2c_dev->base);
 
 	irq_event = irq_of_parse_and_map(np, 0);
-	if (!irq_event) {
-		dev_err(&pdev->dev, "IRQ event missing or invalid\n");
-		return -EINVAL;
-	}
+	if (!irq_event)
+		return dev_err_probe(&pdev->dev, -EINVAL,
+				     "IRQ event missing or invalid\n");
 
 	irq_error = irq_of_parse_and_map(np, 1);
-	if (!irq_error) {
-		dev_err(&pdev->dev, "IRQ error missing or invalid\n");
-		return -EINVAL;
-	}
+	if (!irq_error)
+		return dev_err_probe(&pdev->dev, -EINVAL,
+				     "IRQ error missing or invalid\n");
 
 	i2c_dev->clk = devm_clk_get_enabled(&pdev->dev, NULL);
-	if (IS_ERR(i2c_dev->clk)) {
-		dev_err(&pdev->dev, "Failed to enable clock\n");
-		return PTR_ERR(i2c_dev->clk);
-	}
+	if (IS_ERR(i2c_dev->clk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(i2c_dev->clk),
+				     "Failed to enable clock\n");
 
 	rst = devm_reset_control_get_exclusive(&pdev->dev, NULL);
 	if (IS_ERR(rst))
@@ -807,19 +800,15 @@ static int stm32f4_i2c_probe(struct platform_device *pdev)
 
 	ret = devm_request_irq(&pdev->dev, irq_event, stm32f4_i2c_isr_event, 0,
 			       pdev->name, i2c_dev);
-	if (ret) {
-		dev_err(&pdev->dev, "Failed to request irq event %i\n",
-			irq_event);
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "Failed to request irq event %i\n", irq_event);
 
 	ret = devm_request_irq(&pdev->dev, irq_error, stm32f4_i2c_isr_error, 0,
 			       pdev->name, i2c_dev);
-	if (ret) {
-		dev_err(&pdev->dev, "Failed to request irq error %i\n",
-			irq_error);
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "Failed to request irq error %i\n", irq_error);
 
 	ret = stm32f4_i2c_hw_config(i2c_dev);
 	if (ret)

-- 
2.43.0


