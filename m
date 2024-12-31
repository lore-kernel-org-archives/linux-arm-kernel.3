Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2152E77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Dec 2024 04:26:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8V9K9na5hi5DyccRbFjWLo7NIv+AoHV6qIzmsllDmA8=; b=4Uq09uM8E3sVpzaRcwbWKkfSoe
	iqbXXZ4zxF0wtsAXy5cdMbQQn4NGcTFRHj+Y2HbKxpJ1whu4r2r9UsUe9xVZwWOC+W1G7jhY+woGg
	Da5tVRacPHw/VFQJ6UPG6nT7bSPRGbZanF6uCzvUBsnFRC2yGrStHWK1xt7CJWbpB5Fzgn4VrZxZa
	izZcRDdFD5r93WJR6XZgW1Ztd6l9FqL8U0GpeSE7aUh4Agr8VrPcH0plJnoAS276p0Ry+xlNJUOMx
	AW/luQwFiBAMWWmOOvKuNjVfmcX7E6e2ruMGQ3zAXqGrQvGkOG35787XLQb+oGFe8NMHr6N6W2ctF
	VC13LWZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tSTpd-00000006Tdv-4B0J;
	Tue, 31 Dec 2024 04:26:14 +0000
Received: from mail-io1-xd31.google.com ([2607:f8b0:4864:20::d31])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tSToT-00000006TPq-3Rjj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Dec 2024 04:25:02 +0000
Received: by mail-io1-xd31.google.com with SMTP id ca18e2360f4ac-844ce213af6so369569739f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Dec 2024 20:25:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735619100; x=1736223900; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8V9K9na5hi5DyccRbFjWLo7NIv+AoHV6qIzmsllDmA8=;
        b=IC1KK+P92dciCXKcNJ7ewNhlnQ00HUZPTmzclT8bm2LudYlyoBtekasPi6Wwm0X7R7
         tIk1pc16f5FdcMcZ9EecWIwA2WxSlhWNoCuUJ03oavrxqv7LmI1mVYBZMLSvVhXSXI1j
         CDJ5ujeds1+IEP1gU7m60umE2opw3QOW4titI7QybiKgbK3nJTMFdu89oj779XanV3tn
         f5vplJPAJZBsMdyBuzgPgqePIhXxf2CNRiVPcS9J+LlCvLZywCirGYE5p6nS9bFeyoJJ
         bZ7c55ety+Sc6X8rX3GWjoYg4aqlWn8rKpD+YMB4vJYCmnkfzoyholiygS8VOb/ltCMm
         SbFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735619100; x=1736223900;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8V9K9na5hi5DyccRbFjWLo7NIv+AoHV6qIzmsllDmA8=;
        b=FcmrejF/ggo0w4GGixvPSG6aY2ZY30nX9sTILPtAB2zJcoloII5Ub4PMlKA4dG/JmG
         i31oHiEGEqax29qx96hW/OVkX8+wbCELmxjSgs1fMRCk7pSKnjBDrpZnBbhWJnwvDgYP
         5MKpdaafWTx7qAq6cj344IdjKiHcEbDkU+8cgj1K59Lk3z/3xN7gZKKiWWuPNRh29HIl
         cLUMCAIXFGVfMxq5kfgh6SMUHMZtF7RGP0AsznnYIz8+nmUPrI6MAEtGgLFDqi76cTkw
         6pOGiAQ2zHEi5pUhoCFKMFG4fUCQsFMrEiwDVROtu/bTuOWbXyDAFovBzP7BgR47MktF
         mttQ==
X-Forwarded-Encrypted: i=1; AJvYcCVWQufvAUp/cpgd1S0BsN/Eq/O546AOhH+ReLSXAUEDpffFzkNPnsEwfCPoMk6y+mTUXtbFripu0/1y3HABe68Q@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3qmqUt+5S3RT/czkUxtW3Z1ysVPw1w6Si+uywZaanIV2qo6mZ
	9uVEnfj9/jASqSBqbHHpPFvy4JLsPeqTYoapuDq45vkOs0H7foGe
X-Gm-Gg: ASbGnctH3xMIECvA6Bbc9LmI8lHoR8iHVskkslZLGsiqnrMB9vmY8q3wBk2A0JF1Pn0
	MaRtOj8iaVvEfPe64IBDfMIBzwI9p/BWDJFbBHRFhG0IEzOD8uPzSK2zsZ8Y4DJsDG/CSANcwr9
	PcY7EkpAhjOOKuKHDJ1pnaO4lbbAt9Ullh+wO3vo+7HAoAVT9zGmVSvdsF8uTC203M5yCD757w5
	hbFZxYM95Wn4rHAHHLmlbAdSD8w36avgZ2kPl1wcUYC8C8B+vbtUwjNMEtvvBxqY/8n
X-Google-Smtp-Source: AGHT+IFWciUZBXof1ClsDUD8qKNSVi/Is3uvZ/OcdGpT3wvFKtaZF6hzKy2H4IWFdlhfBLpQxrowkQ==
X-Received: by 2002:a05:6602:1503:b0:834:d7b6:4fea with SMTP id ca18e2360f4ac-8499e4cf6admr3595656639f.6.1735619099986;
        Mon, 30 Dec 2024 20:24:59 -0800 (PST)
Received: from localhost.localdomain ([128.10.127.250])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4e698e2e985sm5286933173.38.2024.12.30.20.24.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Dec 2024 20:24:58 -0800 (PST)
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
Subject: [PATCH v8] pinctrl: stm32: Add check for clk_enable()
Date: Mon, 30 Dec 2024 23:27:56 -0500
Message-Id: <20241231042756.3166495-1-zmw12306@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241230_202501_880986_A98B628F 
X-CRM114-Status: GOOD (  18.09  )
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

v7 -> v8:
1. Remove all previously registered GPIO chips before disabling 
the clocks.

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
 drivers/pinctrl/stm32/pinctrl-stm32.c | 76 ++++++++++++---------------
 1 file changed, 34 insertions(+), 42 deletions(-)

diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.c b/drivers/pinctrl/stm32/pinctrl-stm32.c
index 5b7fa77c1184..32c04391e2a0 100644
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
+			goto err_register;
 		}
 
 		pctl->nbanks++;
@@ -1658,6 +1642,16 @@ int stm32_pctl_probe(struct platform_device *pdev)
 	dev_info(dev, "Pinctrl STM32 initialized\n");
 
 	return 0;
+
+err_register:
+	for (i = 0; i < pctl->nbanks; i++) {
+		struct stm32_gpio_bank *bank = &pctl->banks[i];
+
+		gpiochip_remove(&bank->gpio_chip);
+	}
+
+	clk_bulk_disable_unprepare(banks, pctl->clks);
+	return ret;
 }
 
 static int __maybe_unused stm32_pinctrl_restore_gpio_regs(
@@ -1726,10 +1720,8 @@ static int __maybe_unused stm32_pinctrl_restore_gpio_regs(
 int __maybe_unused stm32_pinctrl_suspend(struct device *dev)
 {
 	struct stm32_pinctrl *pctl = dev_get_drvdata(dev);
-	int i;
 
-	for (i = 0; i < pctl->nbanks; i++)
-		clk_disable(pctl->banks[i].clk);
+	clk_bulk_disable(pctl->nbanks, pctl->clks);
 
 	return 0;
 }
@@ -1738,10 +1730,11 @@ int __maybe_unused stm32_pinctrl_resume(struct device *dev)
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


