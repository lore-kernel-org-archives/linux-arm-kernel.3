Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61638E77180
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Dec 2024 02:15:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2c/XwSCr59KYiV5COV+QijUTe/cctADBA4FfAWvsC6E=; b=ZKKuekYdrLB6x07+B9xitgTb/V
	ILh2qkZGw97YiKRHXdx4m2hNPEGe+G2MayMJs9QNu4fwcQtuhMEXw7Q8VTMvXUyiHDdCkypzCG0ul
	PUymL9byqBhF/Y5qaIWydhcctHUwQAz384nEIbPR8+DgDU4p5trepPoNM0NGV2xBFnSvdT5PDZbp4
	7F+JS0jrbnE0TpYfv0xgw1rVBWnFNjXjlL+cHW5dgIv81iXZG2br3M6H5LgCJdWdW04BP60VBb6SQ
	ufIzwLVtdrpW8cb1Fpigr1/iVTpj1kLuP4xsycneLJIU1GpVuWHW1R7nUs1LTgNniKIibz01LckNl
	UasMxifA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLvDL-00000002U69-2Te1;
	Fri, 13 Dec 2024 02:15:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLu8y-00000002Mp2-1vfY
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 13 Dec 2024 01:07:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=2c/XwSCr59KYiV5COV+QijUTe/cctADBA4FfAWvsC6E=; b=qI4G1oxPJWGqGZ2IoCnd5ZByTM
	TA1GtGZDp3CAKWM9MxOMKqHOQZCasvkiMsF8QfNjXoWznpOJuYLwTIhwEDnQrPeKUBsgwOHCzmuDj
	Vy3HY5fA7/prwCV0eRr5LD9BZIa33EP/9BYpVTagGVxXCw6k1n6tqIGVObaDSb5FWvUgSRBHFPIQw
	Qc17U5uuM8rDAeWSeaKI9LAsJxegslE9j2nt5hafPsB48s1297mGPVQAKITSUbB121lIHbuvwpIjo
	GrU7tnUil1P2NVtVpomKI1NHw+XeLAoyapYVxEXr8lP8r144nz87B8yhhWJ8ICXzfY4LH6IhrAOcI
	PpA/6b5w==;
Received: from mail-io1-xd2a.google.com ([2607:f8b0:4864:20::d2a])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLu8u-00000004AJO-3kyI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Dec 2024 01:06:59 +0000
Received: by mail-io1-xd2a.google.com with SMTP id ca18e2360f4ac-844c825ab4cso38458439f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Dec 2024 17:06:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734052013; x=1734656813; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2c/XwSCr59KYiV5COV+QijUTe/cctADBA4FfAWvsC6E=;
        b=eRzvALBd3EN5GXoaLnq4CiwWBpRtiZ60S/f7dW4BMHgEVJtaIqtBmWo1XvhQmbbulQ
         3GcSsVYyF2aPF9nM2DsrgRdSWPYK10kS3wTjrBm1PoNt17yskyu6oBnJAZ9jGleJMXoB
         vzD2qqqyfgHouTZteD1eBSg/irpIrhlxlsvPDBD8g73Ossh/hv5oNaEoj6h2WkMdFXxh
         sFndceNYPAtBe1ors4UdxHm7T8Fg0BgeJRwWmeUbr2GKudEOCnOZLH580pSNEOG9eNds
         gs5Xoer7NLuHfMgBy0dEdaYDWmDblvXJNlA4Hhs80jdnHpxVyNphpJJDI7BlMwn9Un8+
         yYXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734052013; x=1734656813;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2c/XwSCr59KYiV5COV+QijUTe/cctADBA4FfAWvsC6E=;
        b=eu+OzF3GC+I+6sP4xXfNTBhBKWZGTKCdCEinkL6Z1CkKfZPL4DRxYpp9PZKmcjlf1z
         XNb8PcVvyrTTJAzyCzXQhN6aZdqBdYuOeJ0zp5eI3YmxvI+EBDQcaPZkjZ9vuzVfhYRH
         9A5OI5E+QSryN8r+ilzZbM/EXWTH2769Xoubw1fhUTb90Ft2CiN0QAlu+qIf7h+kgNmb
         00dqHu+uJcZoVumUIgtO0lWWjL7ji0G/2kuR9/9D22ZqIPlkNMC9OCiyZREdS0ptTc8D
         sdKSrAjl2MQCrmVAkm78PkN6d1b53nQdu36+VwvPYlrNkfI4/rJpdGbsZm35xnJNkWR6
         n5dg==
X-Forwarded-Encrypted: i=1; AJvYcCWzyNzXZnhNISdjfxsQZhMDtA2bP0rIsOCbdf1cCmBp87Yvo1SE+AD2d9F+QCM9MYXXzZUSEdkOmN4Ce6OCYTRJ@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+QMPcoGRCmjag+8c8DOgWgivD96XdZ/NU9JJqEH5X+7c/XI5I
	iadvUAF/otwD2WQ79LHe+9Y/TEq0uN5F4hgD8oR+4AgG78L9tUbc
X-Gm-Gg: ASbGncuTQk8UjgUBxN/RSDdDhtMWGzAyQp2tTzvalPniZiEr5fbEuxaiJ9z9FE0X/O9
	1ADTrEBFtVzT1ovU92wyI3Apwf46SJkAsWpD3WTRRprfXBKie5R+KHG1+n+W83KoLlVpbefJEKD
	Q8oWezeaPv5jx0YUduSPoGb5bEFjD9PoO9E5i5dO+l0jgVES5xXsYl1OCvK7+6CKfIHOFqzvuJ+
	h/mAw1H/6illBv4646ukK+BW2IUKpIyUm0izywyI1td58cmnJQGY/vzwm23dWTRqxtZ
X-Google-Smtp-Source: AGHT+IE0aRqUJwlA5+FNU6Sqc7UszAClayD0xVEQXFIIaM793yvcNU2uDJsHlxIEfHs4it75DfgO/g==
X-Received: by 2002:a05:6e02:13a5:b0:3a7:e0c0:5f0d with SMTP id e9e14a558f8ab-3aff4616f35mr9786085ab.3.1734052013275;
        Thu, 12 Dec 2024 17:06:53 -0800 (PST)
Received: from localhost.localdomain ([128.10.127.250])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3a9628ba832sm32644325ab.64.2024.12.12.17.06.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 17:06:51 -0800 (PST)
From: Mingwei Zheng <zmw12306@gmail.com>
To: marex@denx.de,
	antonio.borneo@foss.st.com
Cc: linus.walleij@linaro.org,
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
Subject: [PATCH v4] pinctrl: stm32: Add check for clk_enable()
Date: Thu, 12 Dec 2024 20:09:48 -0500
Message-Id: <20241213010948.2623382-1-zmw12306@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_010657_360430_2A912BF6 
X-CRM114-Status: GOOD (  16.57  )
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

v3 -> v4:
1. Add initialization for  pctl->clks.
2. Adjust alignment.

v2 -> v3:

1. Convert clk_disable_unprepare to clk_bulk_disable
and clk_bulk_unprepare.

v1 -> v2:

1. Move int ret declaration into if block.
---
 drivers/pinctrl/stm32/pinctrl-stm32.c | 37 +++++++++++++++------------
 1 file changed, 21 insertions(+), 16 deletions(-)

diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.c b/drivers/pinctrl/stm32/pinctrl-stm32.c
index 5b7fa77c1184..427749d4f6a5 100644
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
@@ -1308,7 +1308,7 @@ static int stm32_gpiolib_register_bank(struct stm32_pinctrl *pctl, struct fwnode
 	if (IS_ERR(bank->base))
 		return PTR_ERR(bank->base);
 
-	err = clk_prepare_enable(bank->clk);
+	err = clk_prepare_enable(pctl->clks[pctl->nbanks].clk);
 	if (err) {
 		dev_err(dev, "failed to prepare_enable clk (%d)\n", err);
 		return err;
@@ -1397,7 +1397,7 @@ static int stm32_gpiolib_register_bank(struct stm32_pinctrl *pctl, struct fwnode
 	return 0;
 
 err_clk:
-	clk_disable_unprepare(bank->clk);
+	clk_disable_unprepare(pctl->clks[pctl->nbanks].clk);
 	return err;
 }
 
@@ -1617,10 +1617,18 @@ int stm32_pctl_probe(struct platform_device *pdev)
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
@@ -1631,11 +1639,10 @@ int stm32_pctl_probe(struct platform_device *pdev)
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
@@ -1646,8 +1653,7 @@ int stm32_pctl_probe(struct platform_device *pdev)
 		if (ret) {
 			fwnode_handle_put(child);
 
-			for (i = 0; i < pctl->nbanks; i++)
-				clk_disable_unprepare(pctl->banks[i].clk);
+			clk_bulk_disable_unprepare(pctl->nbanks, pctl->clks);
 
 			return ret;
 		}
@@ -1726,10 +1732,8 @@ static int __maybe_unused stm32_pinctrl_restore_gpio_regs(
 int __maybe_unused stm32_pinctrl_suspend(struct device *dev)
 {
 	struct stm32_pinctrl *pctl = dev_get_drvdata(dev);
-	int i;
 
-	for (i = 0; i < pctl->nbanks; i++)
-		clk_disable(pctl->banks[i].clk);
+	clk_bulk_disable(pctl->nbanks, pctl->clks);
 
 	return 0;
 }
@@ -1738,10 +1742,11 @@ int __maybe_unused stm32_pinctrl_resume(struct device *dev)
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


