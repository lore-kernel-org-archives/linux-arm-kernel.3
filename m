Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61F1AE77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Dec 2024 20:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=poncxOnZdDcZKHqz0owUgHxjpuHE1fKkza/gUQopM84=; b=nJivdBBkse9zrDBxcv7yrA9Pgn
	rhzyLrzhHOMvXmLWynALmTx/YvafeOOxsVuUwEWVqOo+fbGDoNStsrORAaUHq1T0bJVIXVzR/182v
	50CTIeOvclKygthjpt+6lxoHKByhfTrzdPdD3pVRLAdGmT2m9T2kMnmyVtjuympSX8tl9GryPYIff
	4GSb/EnxtHRTD00qbZw7LfDrwPwsc6IRt0u9TonBRwq0n4jq4DObfjNevUR3fwgM/loA9g/Wfe3ms
	J9s76bHJMsN0epho2Fambd3P+fkWAVeYdB++ML3F0o3qQOiwIAm3fqUcjim6DgwnRTxY3c+xhSGZ2
	7cnHziKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQB8c-0000000CiRZ-0hc8;
	Tue, 24 Dec 2024 20:04:18 +0000
Received: from mail-io1-xd2c.google.com ([2607:f8b0:4864:20::d2c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQB7Q-0000000CiLL-2aNk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Dec 2024 20:03:05 +0000
Received: by mail-io1-xd2c.google.com with SMTP id ca18e2360f4ac-844e06e5d11so176326539f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Dec 2024 12:03:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735070583; x=1735675383; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=poncxOnZdDcZKHqz0owUgHxjpuHE1fKkza/gUQopM84=;
        b=Z3JHPXO0224AMrKLMbcJKaxdpsytCqhk0EL85bUHUBhS5FWgCC6zCw3/vbu4NK+Kxy
         j6jmBHouNIpDLQcOG61B3SlQ2XPGu9zbcqquFOYhJ5YqXHq2Qs5UEBLOG7yqit50daMT
         Vm0p53OPOhuRSRQfpFeEyqlWhTYNlwGyW4KcFZWTYplEG2vdnkwCKsIAJ1DWfBQyBe73
         Ec5T1eNf9U2jmaaNQzdxcAsmnu10KCAAhfbe01LHKINMHKHt3s7Z/7keQpEzurYE68l8
         nBQj3ea18aZKyByma0FcNvKbXvUCjLxpPFmNEGwdalAjpCQHCwsu8CWee8a1jKhxq1UV
         FOaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735070583; x=1735675383;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=poncxOnZdDcZKHqz0owUgHxjpuHE1fKkza/gUQopM84=;
        b=FH0Fg1nxHdK+L12TB2PK0yHQN+I3seY+XRaQq1todhUrninNndnp8krpINKmeTUrDo
         N02HHZT5DQUO6zO0SIuAxlTMGhBpEFSocKhJ2LggtK2qpyqvGk1ESluksiUzRgi57kCu
         RTFn4Mym2LNFnNn02aWu6+w+HIwj2kXk55TH+0lWPtJnw4yqM1n2rWeKNKJsxXkoY/Dj
         KkWuhwiiMvY7aRX50m96wuRqUi8zFmLYZshjzuykPM9Pfazon9ExcsJ0Ntl1LkZxSZ9g
         hys3S4P8w5Yj2yK2ihgWN2kDxhlEhi0KtGRy7Y/KcOWnuzMKjldPWy+DdG4zR6B5rrIN
         5hzA==
X-Forwarded-Encrypted: i=1; AJvYcCX0glw0EN96g4ImOF2ECLnRZ+ljy6/aPqOMYg1idYI+t7Ujnzw1iHGMrdAGn5wMbQfv+/um8M40Hr7Dvn1RnXkT@lists.infradead.org
X-Gm-Message-State: AOJu0YyFiSFj4EHNLryTlEF3GE2z9g9AFSsHCPARd2KpYCgP+reON2J+
	6Qst/l/CHPU/Hjz/gJ75ELPSu7Of+QP4u/M16O1CCP0gPwcklwAM
X-Gm-Gg: ASbGnctJo7vaE+Tg9hKQO5f5AuLoeB3P0tfixZT/BZVjIBjjOnDXJ4xDKokGaNulaBM
	qeptu4JmuhU8EsQQMhr1iP8cIIzeAfJhdb959bdT3RodDj93MCT2CqIgFQbS3yiIfqGz6C2/Itp
	8Qnbzb/OaPu2RMsYJt9yV8YUsRs0L5b3MJNgTz+8MMGw7/Pof3O+6r/zlc2/TPqsy9W7gSfC3/z
	WBinKu/wSAB8f8aj8IW/7ciW++CC/yI2k9Pkr2mAlE0KtCItBAsUGo+hKNUoxa04cUg
X-Google-Smtp-Source: AGHT+IFCS4C7fNiL6P/tkM9845PTEQ0rb/c/Qe3WOuiYEvVQ+LydZky1ohM7JeCfVoiEmoAcbg9QqQ==
X-Received: by 2002:a05:6e02:174d:b0:3a7:e7a9:8a78 with SMTP id e9e14a558f8ab-3c2d515168fmr129378365ab.17.1735070583459;
        Tue, 24 Dec 2024 12:03:03 -0800 (PST)
Received: from localhost.localdomain ([128.10.127.250])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4e68c1dab95sm2842435173.123.2024.12.24.12.03.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Dec 2024 12:03:02 -0800 (PST)
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
Subject: [PATCH RESEND v7] pinctrl: stm32: Add check for clk_enable()
Date: Tue, 24 Dec 2024 15:06:08 -0500
Message-Id: <20241224200608.84923-1-zmw12306@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241224_120304_662272_9550A7E3 
X-CRM114-Status: GOOD (  17.22  )
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

v6 -> v7:
1. Move clk_bulk_prepare_enable() before calling 
stm32_gpiolib_register_bank().

v5 -> v6:
1. Call devm_clk_bulk_get_all in stm32_pctl_probe().

v4 -> v5:
1. Move the clock handling from stm32_gpiolib_register_bank()
and moving it to its caller.
2. Call clk_bulk_prepare_enable() in stm32_pctl_probe() 
and clk_bulk_disable_unprepare() for error.

v3 -> v4:
1. Add initialization for pctl->clks.
2. Adjust alignment.

v2 -> v3:

1. Convert clk_disable_unprepare to clk_bulk_disable
and clk_bulk_unprepare.

v1 -> v2:

1. Move int ret declaration into if block.
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


