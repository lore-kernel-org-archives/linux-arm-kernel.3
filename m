Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 850F2E77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Dec 2024 19:58:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TpbE32YrRX7k68vHgrK8mf3gbDDES5zEOdwfZIy6I+0=; b=dkOMiBroExDhFVueV8QvkeH8h2
	Rx8wJV0Ua66IfO3y1zfFmXnBfB8WelAB2El5ZwFGUgb4cADtM8xxYTqfaQpc96cpgmTmQO+hHxBqJ
	kpMCBkj5AXJSSJm/QfmRXeFc19S6+3/2F57zKWjuY9g3lQixJr8U2wqcwisslm5LKAo85DyHRw9I3
	pm7ioqqD0Fz5p0R7Gqzs5YTIxsxRukUfxPASgDZASdX4SQ1VKApOz3LDKRz0ka1OM8DpmAy3qC2un
	X8vQSw90s7ozSCa6Fvlnsy+f0HwmNF+0Op6dUwikQZS/OVMhtrvOyahd2tI7v+sfynO2n5embVME6
	DNfZBNHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQB2k-0000000ChbK-1D0V;
	Tue, 24 Dec 2024 19:58:14 +0000
Received: from mail-io1-xd35.google.com ([2607:f8b0:4864:20::d35])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQB1W-0000000ChWZ-3vFI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Dec 2024 19:57:01 +0000
Received: by mail-io1-xd35.google.com with SMTP id ca18e2360f4ac-844ce6d0716so443257339f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Dec 2024 11:56:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735070217; x=1735675017; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TpbE32YrRX7k68vHgrK8mf3gbDDES5zEOdwfZIy6I+0=;
        b=gA0ChmohfwIkFyuUr3N9upcvjiZMSejCWw/oc8qkByqRBKRE2ENnnIcF3Fv0eMKdW5
         7zVlkCM7Ka+w1GwSTQfFJd4x0PJjEj7RpQJnuL/5IyXzOl2HvMfILyq2xxeaFhpq3VQh
         N/10ahyGut0GWx64PU+lxzqwhRAWgivlLdJxVh46Vxl/ggCemcqqB4VOm+UPtdbEdeOX
         G7SbE0V1Qv80ulOUcHgDLzAzwSPlJiAJ1dVc25JpjeoA5HccELTzdHZyqLbuiQn10r6Y
         L0aLDi+9lABm2wK4dUytw9V+uD1TZvg4IvrdYMIxkRcP+S3Hr4GTdXtBvE8I3dch+Z9k
         bVgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735070217; x=1735675017;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TpbE32YrRX7k68vHgrK8mf3gbDDES5zEOdwfZIy6I+0=;
        b=p16jAuEm3FzFORYiNMBdXwpV4ljqQBkrvMRHXFVnlr3L6xUzuxh2vuqyw+b70hcv5D
         3lCQ2JMtLnxoHQqeZUH4J/kJ5HhrYev3H0Ojvj1N37gZ7P5xOU1AcLJvb74/Un6wCSLy
         QMCBCwm8nLXlL6YNEH4ddJydJr4jx9aaSJAMsb7S9GbYmintIpuA26t83E9dplBwxkfJ
         r/qfVni+gI3EPwG4xDmOKtRcT+PraXidgIxAIzYhiX0xqHlK4jZI2HI6pl0+1GA6xx+W
         mM0uvyUMC6BPRnF9VVZf62PrFoKBv/sHHgRckZUEt9Zfp0LGWM08veU7+7e2S66pu0Pz
         vRyw==
X-Forwarded-Encrypted: i=1; AJvYcCVsb+/XO/1KSIcWBPjNh3Vzi5vARGS8CH/3nEMlf/5+EoNtiKJdyigtCqQAN39ha3UH0zGbfzBoAfnGpEnh1iIG@lists.infradead.org
X-Gm-Message-State: AOJu0YwfEBDflr4TxRboD47bov0lPjvEha4ER1WdUqlQGZCoxgfjtTBM
	/FxDM9ckpfvkxQjU7s/glpNX8WIzPeKp9Duq6p9hNH7kOYABiA2y
X-Gm-Gg: ASbGncsxT5KYEWDicemhHv5QFc/WfWbxY0UngtwIHzdJhrCaXlosbglH6I+SU10z7MP
	NlRsw6YE1PpxsqK24DyrhPWpqCqEmEZ9Ju57Y0Du4yabMxzIeUxi6/qDHtb+PwlaX2dBOJb9PsT
	JZvqtq34JRYKXgE70/uAz+9lMHa0Ie5ASB7soVzluHW0KeV5Dl62JxgtkPslVL9y0xhKcH1vDr7
	8YQRSjc3T+LrItKZ/MxfZ0ULjOh0/DjIg1tGSSLYOIuZsJebyL/lCBbqqgaUZ/LntG+
X-Google-Smtp-Source: AGHT+IHX4vrmb8xk5P7zI2PSaxST8v5YjWWt+HzJlZhWJGjYPjLwHvnt47dobMyGbrbLFCDBd6cTxQ==
X-Received: by 2002:a92:c24c:0:b0:3a7:c5cb:8bf3 with SMTP id e9e14a558f8ab-3c2d277f5aamr146379315ab.9.1735070217031;
        Tue, 24 Dec 2024 11:56:57 -0800 (PST)
Received: from localhost.localdomain ([128.10.127.250])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3c0de053105sm29963655ab.15.2024.12.24.11.56.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Dec 2024 11:56:56 -0800 (PST)
From: Mingwei Zheng <zmw12306@gmail.com>
To: marex@denx.de
Cc: antonio.borneo@foss.st.com,
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
Subject: [PATCH v7] pinctrl: stm32: Add check for clk_enable()
Date: Tue, 24 Dec 2024 15:00:00 -0500
Message-Id: <20241224200000.76661-1-zmw12306@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241224_115658_983980_0A52561C 
X-CRM114-Status: GOOD (  16.95  )
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
 drivers/pinctrl/stm32/pinctrl-stm32.c | 71 +++++++++++----------------
 1 file changed, 29 insertions(+), 42 deletions(-)

diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.c b/drivers/pinctrl/stm32/pinctrl-stm32.c
index 5b7fa77c1184..9c32ae3e5d45 100644
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
@@ -1621,6 +1606,10 @@ int stm32_pctl_probe(struct platform_device *pdev)
 	if (!pctl->banks)
 		return -ENOMEM;
 
+	ret = devm_clk_bulk_get_all(dev, &pctl->clks);
+	if (ret < 0)
+		return ret;
+
 	i = 0;
 	for_each_gpiochip_node(dev, child) {
 		struct stm32_gpio_bank *bank = &pctl->banks[i];
@@ -1631,25 +1620,20 @@ int stm32_pctl_probe(struct platform_device *pdev)
 			fwnode_handle_put(child);
 			return -EPROBE_DEFER;
 		}
-
-		bank->clk = of_clk_get_by_name(np, NULL);
-		if (IS_ERR(bank->clk)) {
-			fwnode_handle_put(child);
-			return dev_err_probe(dev, PTR_ERR(bank->clk),
-					     "failed to get clk\n");
-		}
 		i++;
 	}
 
+	ret = clk_bulk_prepare_enable(banks, pctl->clks);
+	if (ret) {
+		dev_err(dev, "failed to prepare_enable clk (%d)\n", ret);
+		return ret;
+	}
+
 	for_each_gpiochip_node(dev, child) {
 		ret = stm32_gpiolib_register_bank(pctl, child);
 		if (ret) {
 			fwnode_handle_put(child);
-
-			for (i = 0; i < pctl->nbanks; i++)
-				clk_disable_unprepare(pctl->banks[i].clk);
-
-			return ret;
+			goto err_clk;
 		}
 
 		pctl->nbanks++;
@@ -1658,6 +1642,10 @@ int stm32_pctl_probe(struct platform_device *pdev)
 	dev_info(dev, "Pinctrl STM32 initialized\n");
 
 	return 0;
+
+err_clk:
+	clk_bulk_disable_unprepare(banks, pctl->clks);
+	return ret;
 }
 
 static int __maybe_unused stm32_pinctrl_restore_gpio_regs(
@@ -1726,10 +1714,8 @@ static int __maybe_unused stm32_pinctrl_restore_gpio_regs(
 int __maybe_unused stm32_pinctrl_suspend(struct device *dev)
 {
 	struct stm32_pinctrl *pctl = dev_get_drvdata(dev);
-	int i;
 
-	for (i = 0; i < pctl->nbanks; i++)
-		clk_disable(pctl->banks[i].clk);
+	clk_bulk_disable(pctl->nbanks, pctl->clks);
 
 	return 0;
 }
@@ -1738,10 +1724,11 @@ int __maybe_unused stm32_pinctrl_resume(struct device *dev)
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


