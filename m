Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79C2AE7716A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Dec 2024 20:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CTfdf5nMQc4EWge5pFOY3vdTy/j5chcCgYemMh7oSNk=; b=0HasMJ/C2RJVOfdXN61hELgkLk
	r9SRtZWeAgPeZR/CUOiDyqkNLwoU5J0Zsa2DfXk88TN4RodRmI3jJ/bwb+7ICItpqOTgP7ve9PqnM
	FzaB/GEOABWbH3C5szzHr57nNRCMlv6rmULCJMTOLCVUvbC//uL+NHpf7FLd3ndKJFP4VyRZliVyI
	GX47epnN2PTkT68uBSmkqAl5cZqLayyr6lkXJeCMhPNWxrAuwknOdj3usXXeOgOZkPpZwFl4I3oLV
	/DyEWTZg6xB7z+bJGeGWAG+ViieHH0gpvztKQOnQeoPp2gdQDZfSTwCY0dM+yAxRdb/ZYzKMaKKne
	Y+Svg47Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tMvNV-00000008QtZ-1Dh1;
	Sun, 15 Dec 2024 20:38:13 +0000
Received: from mail-io1-xd34.google.com ([2607:f8b0:4864:20::d34])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tMvMP-00000008Qlu-0lpu
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Dec 2024 20:37:06 +0000
Received: by mail-io1-xd34.google.com with SMTP id ca18e2360f4ac-844e10ef3cfso262746139f.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Dec 2024 12:37:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734295024; x=1734899824; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CTfdf5nMQc4EWge5pFOY3vdTy/j5chcCgYemMh7oSNk=;
        b=dTtJqGWXDnOw83UjwfP8n+3ux0JbxH5tSaaNnArZjHSYNNAnydpt4MARyPWcpe4ug1
         3Axm2NJJAt1sanaad8dVjcL0oWV6MpiCEl/G27pqpnG9l1/VLkdb6Hx6HKN29G8qzB+j
         L7DX0GjEEJxX/XdiUnmizMb+RksR6iasw27apd3jFHarxbNSVhwYbU9uly9LSLg6Qj3N
         ZrtLFAteD6IfarZWuk1R+9mPolImCQcd008RTueHtSHcgyuBKb2A4CPU3EkxpTy7fRlW
         dy6wd/Iqvf7U6L4R5Xq7u0yZ3zVPEFipbmCiftm+TcNLm7r1EiEs3ZAtW+myCmjvhIYO
         eroQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734295024; x=1734899824;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CTfdf5nMQc4EWge5pFOY3vdTy/j5chcCgYemMh7oSNk=;
        b=ChvW7JzPhc+PEm20SbMADVmp4+qjwJzo7dd2iCHiVpcOmwFLd/e319eB6Mq8NUHkcr
         c8nNwrETHhEa0TOYlqGXdsgnztv3QjI6OHx6nUDeTs7yoVO8sUjUGMUOfYiLabct5lPs
         OkOsKsbyKTJwTlFMfjEhtCZTjq4e8bHyWVQTcQJYzw5xGiLAqfLz+xPb00t5jbWUnt3h
         +Xlq5cyawBqsgmD39zqQUqb3F5ONNxnNYV0vBcDDSScZrqkKDsGxR4No9BFakxZrqygk
         P8uDL8kiQXIdJE8EXZ+GE96Wipo7v6hD5OdDvZSLFyfe2EA3I7PV38ih3vCmA4yLdhbp
         PwLg==
X-Forwarded-Encrypted: i=1; AJvYcCWxVqkUGD9O1/TTsZ4FCFXAhOdZ7qm1/3Z/3mzNhIUm9cj8x5BYe0cW8Wqkp4g7aHUUYKriFYw73uSq6kl4mofs@lists.infradead.org
X-Gm-Message-State: AOJu0YzmCjL2jPxhrdzG0RHKp0pWfDrtUDW1TfpVc3v7h4lexGphtwG0
	eOW0Vdo+Xh4VqvbUD7KoPY48vYJlOqFBbrWi3HOBxvkKEQsi4Nyb
X-Gm-Gg: ASbGncuX5elRl2OMybZI99zMZSL1+cU2/Y86ERmZfeP60UYFaQBJwo6bE2Kb+uvLbp4
	3iiJtnL3jRgRiDhKGcoWnisdLUdHSFvQoTSAyJe3I4a/HhtXNpttTjYt7taTRQE4UwNENzq854y
	qvxmmUqx0XOQw2Xrqtn2zThqRTbATYUfK/alJ9ZaahPom2Mo18uMXJieZFwAqxDXIM7TQrM5Gfh
	TY6HcbQ2anpsuZhhpr9JAel1BR0jYfjnuQAbUilHt+7YrUZA+LrbPKG9GBbbBpaSMK1
X-Google-Smtp-Source: AGHT+IEgLKb6YqAkp/sb/aFLexcbRJzAt4rZw2ltZ964YL9/S1xZekP6D1npsz0NfYXIDmMoBDXGeA==
X-Received: by 2002:a05:6602:2b0e:b0:83d:e526:fde7 with SMTP id ca18e2360f4ac-844e87be5c6mr1146615539f.6.1734295023634;
        Sun, 15 Dec 2024 12:37:03 -0800 (PST)
Received: from localhost.localdomain ([128.10.127.250])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4e5e32a336bsm892166173.100.2024.12.15.12.37.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Dec 2024 12:37:02 -0800 (PST)
From: Mingwei Zheng <zmw12306@gmail.com>
To: antonio.borneo@foss.st.com
Cc: marex@denx.de,
	linus.walleij@linaro.org,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	make24@iscas.ac.cn,
	peng.fan@nxp.com,
	fabien.dessenne@foss.st.com,
	linux-gpio@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mingwei Zheng <zmw12306@gmail.com>,
	Jiasheng Jiang <jiashengjiangcool@gmail.com>
Subject: [PATCH v5] pinctrl: stm32: Add check for clk_enable()
Date: Sun, 15 Dec 2024 15:40:14 -0500
Message-Id: <20241215204014.4076659-1-zmw12306@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241215_123705_227560_611B021B 
X-CRM114-Status: GOOD (  18.49  )
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

Convert the driver to clk_bulk*() API.
Add check for the return value of clk_bulk_enable() to catch
the potential error.

Fixes: 05d8af449d93 ("pinctrl: stm32: Keep pinctrl block clock enabled when LEVEL IRQ requested")
Signed-off-by: Mingwei Zheng <zmw12306@gmail.com>
Signed-off-by: Jiasheng Jiang <jiashengjiangcool@gmail.com>
---
Changelog:

v4 -> v5:
1. Move the clock handling from stm32_gpiolib_register_bank() 
and moving it to its caller.
2. Call clk_bulk_prepare_enable() in stm32_pctl_probe() 
and clk_bulk_disable_unprepare() for error.

v3 -> v4:
1. Add initialization for  pctl->clks.
2. Adjust alignment.

v2 -> v3:

1. Convert clk_disable_unprepare to clk_bulk_disable
and clk_bulk_unprepare.

v1 -> v2:

1. Move int ret declaration into if block.
---
 drivers/pinctrl/stm32/pinctrl-stm32.c | 70 ++++++++++++---------------
 1 file changed, 32 insertions(+), 38 deletions(-)

diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.c b/drivers/pinctrl/stm32/pinctrl-stm32.c
index 5b7fa77c1184..5874a054dc48 100644
--- a/drivers/pinctrl/stm32/pinctrl-stm32.c
+++ b/drivers/pinctrl/stm32/pinctrl-stm32.c
@@ -86,7 +86,6 @@ struct stm32_pinctrl_group {
 
 struct stm32_gpio_bank {
 	void __iomem *base;
-	struct clk *clk;
 	struct reset_control *rstc;
 	spinlock_t lock;
 	struct gpio_chip gpio_chip;
@@ -108,6 +107,7 @@ struct stm32_pinctrl {
 	unsigned ngroups;
 	const char **grp_names;
 	struct stm32_gpio_bank *banks;
+	struct clk_bulk_data *clks;
 	unsigned nbanks;
 	const struct stm32_pinctrl_match_data *match_data;
 	struct irq_domain	*domain;
@@ -1308,12 +1308,6 @@ static int stm32_gpiolib_register_bank(struct stm32_pinctrl *pctl, struct fwnode
 	if (IS_ERR(bank->base))
 		return PTR_ERR(bank->base);
 
-	err = clk_prepare_enable(bank->clk);
-	if (err) {
-		dev_err(dev, "failed to prepare_enable clk (%d)\n", err);
-		return err;
-	}
-
 	bank->gpio_chip = stm32_gpio_template;
 
 	fwnode_property_read_string(fwnode, "st,bank-name", &bank->gpio_chip.label);
@@ -1360,26 +1354,21 @@ static int stm32_gpiolib_register_bank(struct stm32_pinctrl *pctl, struct fwnode
 							   bank->fwnode, &stm32_gpio_domain_ops,
 							   bank);
 
-		if (!bank->domain) {
-			err = -ENODEV;
-			goto err_clk;
-		}
+		if (!bank->domain)
+			return -ENODEV;
 	}
 
 	names = devm_kcalloc(dev, npins, sizeof(char *), GFP_KERNEL);
-	if (!names) {
-		err = -ENOMEM;
-		goto err_clk;
-	}
+	if (!names)
+		return -ENOMEM;
 
 	for (i = 0; i < npins; i++) {
 		stm32_pin = stm32_pctrl_get_desc_pin_from_gpio(pctl, bank, i);
 		if (stm32_pin && stm32_pin->pin.name) {
 			names[i] = devm_kasprintf(dev, GFP_KERNEL, "%s", stm32_pin->pin.name);
-			if (!names[i]) {
-				err = -ENOMEM;
-				goto err_clk;
-			}
+			if (!names[i])
+				return -ENOMEM;
+
 		} else {
 			names[i] = NULL;
 		}
@@ -1390,15 +1379,11 @@ static int stm32_gpiolib_register_bank(struct stm32_pinctrl *pctl, struct fwnode
 	err = gpiochip_add_data(&bank->gpio_chip, bank);
 	if (err) {
 		dev_err(dev, "Failed to add gpiochip(%d)!\n", bank_nr);
-		goto err_clk;
+		return err;
 	}
 
 	dev_info(dev, "%s bank added\n", bank->gpio_chip.label);
 	return 0;
-
-err_clk:
-	clk_disable_unprepare(bank->clk);
-	return err;
 }
 
 static struct irq_domain *stm32_pctrl_get_irq_domain(struct platform_device *pdev)
@@ -1617,10 +1602,18 @@ int stm32_pctl_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 	pctl->banks = devm_kcalloc(dev, banks, sizeof(*pctl->banks),
-			GFP_KERNEL);
+				   GFP_KERNEL);
 	if (!pctl->banks)
 		return -ENOMEM;
 
+	pctl->clks = devm_kcalloc(dev, banks, sizeof(*pctl->clks),
+				  GFP_KERNEL);
+	if (!pctl->clks)
+		return -ENOMEM;
+
+	for (i = 0; i < banks; ++i)
+		pctl->clks[i].id = "";
+
 	i = 0;
 	for_each_gpiochip_node(dev, child) {
 		struct stm32_gpio_bank *bank = &pctl->banks[i];
@@ -1631,11 +1624,10 @@ int stm32_pctl_probe(struct platform_device *pdev)
 			fwnode_handle_put(child);
 			return -EPROBE_DEFER;
 		}
-
-		bank->clk = of_clk_get_by_name(np, NULL);
-		if (IS_ERR(bank->clk)) {
+		pctl->clks[i].clk = of_clk_get_by_name(np, NULL);
+		if (IS_ERR(pctl->clks[i].clk)) {
 			fwnode_handle_put(child);
-			return dev_err_probe(dev, PTR_ERR(bank->clk),
+			return dev_err_probe(dev, PTR_ERR(pctl->clks[i].clk),
 					     "failed to get clk\n");
 		}
 		i++;
@@ -1646,15 +1638,18 @@ int stm32_pctl_probe(struct platform_device *pdev)
 		if (ret) {
 			fwnode_handle_put(child);
 
-			for (i = 0; i < pctl->nbanks; i++)
-				clk_disable_unprepare(pctl->banks[i].clk);
-
 			return ret;
 		}
 
 		pctl->nbanks++;
 	}
 
+	ret = clk_bulk_prepare_enable(pctl->nbanks, pctl->clks);
+	if (ret) {
+		dev_err(dev, "failed to prepare_enable clk (%d)\n", ret);
+		return ret;
+	}
+
 	dev_info(dev, "Pinctrl STM32 initialized\n");
 
 	return 0;
@@ -1726,10 +1721,8 @@ static int __maybe_unused stm32_pinctrl_restore_gpio_regs(
 int __maybe_unused stm32_pinctrl_suspend(struct device *dev)
 {
 	struct stm32_pinctrl *pctl = dev_get_drvdata(dev);
-	int i;
 
-	for (i = 0; i < pctl->nbanks; i++)
-		clk_disable(pctl->banks[i].clk);
+	clk_bulk_disable(pctl->nbanks, pctl->clks);
 
 	return 0;
 }
@@ -1738,10 +1731,11 @@ int __maybe_unused stm32_pinctrl_resume(struct device *dev)
 {
 	struct stm32_pinctrl *pctl = dev_get_drvdata(dev);
 	struct stm32_pinctrl_group *g = pctl->groups;
-	int i;
+	int i, ret;
 
-	for (i = 0; i < pctl->nbanks; i++)
-		clk_enable(pctl->banks[i].clk);
+	ret = clk_bulk_enable(pctl->nbanks, pctl->clks);
+	if (ret)
+		return ret;
 
 	for (i = 0; i < pctl->ngroups; i++, g++)
 		stm32_pinctrl_restore_gpio_regs(pctl, g->pin);
-- 
2.34.1


