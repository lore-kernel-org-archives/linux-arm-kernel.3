Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2C7AE7717B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Dec 2024 21:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nhNrtrkwQMSxpIdT9BDntslWAjYECtg/oyySnSEisxE=; b=EgOyXpsRZqX+NwYkccgEiNBjzK
	UEGv2sqHXXsVHWJQHF1h9Pm8HUGHMVjl2uHrxzabC/cp3R2rHQcrWZwEhqyZUTHV2ozbDyaOQIYA8
	c87xAFIX7xETsE85PtlvfhLhKXghblYBfxtgHFu8WoSwRZrf2Wx4o2QLJ+NJqwoAws48bAdOIHYmA
	ezS1pYBgA+QLRPiHIvgbUlYTG1m6ImthspcjUOm93qeEnzO2e0oX4M4JD1ykiqhOc2n1fvOCXcqaN
	wMC64mwSeDhXifD6M8wQzLFR8O1B8uEYtHVsoEQex07mzjBOt48fvQT07cadzWDhHbrB2TVqYaZCm
	IDMEcgAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJg4M-00000002ofl-12t1;
	Fri, 06 Dec 2024 21:41:02 +0000
Received: from mail-qk1-x729.google.com ([2607:f8b0:4864:20::729])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJg3K-00000002oaj-0Lor
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Dec 2024 21:39:59 +0000
Received: by mail-qk1-x729.google.com with SMTP id af79cd13be357-7b6c40a60cbso44794585a.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Dec 2024 13:39:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733521197; x=1734125997; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nhNrtrkwQMSxpIdT9BDntslWAjYECtg/oyySnSEisxE=;
        b=ffyN+bn7XYhdcbEOxUTaTwwJZ9crhbV1vy+wXtxdqN6BL6yZB2XVrZ3iq2/MnBtk2K
         iL2h0t0sjs5V+Y6SqvuDk5OaZPIyq7URQMiYnPQfXVg67hIwrewRz/7aRM7MD/jlfjRK
         6R1/PreA6xarWjHMJFTZaWkBl1HVAND6QQZjEhxAdCxKtb4AlSUEaUYrFjfB7Spr2oq8
         fKucNY4BW0iuMjRvclvICOd3S6vtNLHE2CatBUZ2YeHz5D9rxxWXA9S8vgCenk1jibvN
         A3SWS+23uOzP+WIVKZqsiE8Pv3aKE82Mgby07Vl43VDhomDVVtnGhluls7xtwHJV1jQC
         2NfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733521197; x=1734125997;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nhNrtrkwQMSxpIdT9BDntslWAjYECtg/oyySnSEisxE=;
        b=UKJmSmk3tiUPaoKDpuGMiNvgN1tSUBkRuzQohbHUhKrp7Y8kbkP67Ctw5RJd9ET0fM
         QEOXRVjrdE/O6yoejwe1r60AUZN0DDrtUe8Hpy5WQzNQJ43n3cDBpJehVV1x4Nh3COrm
         FQ43ZEl4cYoU7K8OZWrAoT03lCqddKaTm56+TEEB1RPZ8MXPqiBN3JsvEfm59g02+1rh
         Er0cIxfDSGfVZTGiDQGSOqFkYXKmuDF69Vm8MBNmcQwYi79gQoZ1AKbqzPblZM60AKEq
         uBOqgGuSfzfgUx8/UO8K/5sw5UZ+BclSMqiakcZ5Qa7d4kCBMN2+ZpzBZhw1Xf35pyzm
         6DcA==
X-Forwarded-Encrypted: i=1; AJvYcCWL9CtzUu++gWuuDuNBimAkl/wQIRAyYFM0w73WjO4xKBVRVIBN/NKe8yUmtL1JzMV3/VjjDQVmMb46LXQfrUIS@lists.infradead.org
X-Gm-Message-State: AOJu0Yz1ubsNO6Ooec9+l4TxoEXHJDps6NOwCvkLU22O4ICtEI93DYWD
	d5JY4q786lOq6gvbND5ojjGnwpUqx1yRxvbHToYDhdBzBNNH/HWD
X-Gm-Gg: ASbGncupaYt0hSzRlOr0mP7m6HK9NZpPUZ6w41nKDYQ3uwun1ErKXpuqEDiAzjLErU5
	r1+P1TTxOUyxmI0GAZ+hH4mqsYXM7CpBbRifSc6a2DJJGf3aJl9ghPNjoDcmtZpVZ8Seqh2S3nM
	GeG43NiZrhudkGVhGK+Xek12OQ311fBMrrRNcDQVivM7rWNV8kiDRYXfN2tYY1cfTfym8BTFlmf
	GDopbuH5kRx4dJCmYUUA8468v8GT+B+PoNfzelgFmVIbGg991qLsBtr/QZeJw==
X-Google-Smtp-Source: AGHT+IEEnGwLcZ6wgoSEVpifnZ7n698aIGd7Lu/CBlB0yurAYkGYemOCDvTincbiQGiudFkAp3rHqA==
X-Received: by 2002:a05:620a:2682:b0:7b6:7356:a19e with SMTP id af79cd13be357-7b6bcac22a4mr686886185a.7.1733521196806;
        Fri, 06 Dec 2024 13:39:56 -0800 (PST)
Received: from localhost.localdomain ([128.10.127.250])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-467451fa7fcsm3100801cf.9.2024.12.06.13.39.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 13:39:55 -0800 (PST)
From: Mingwei Zheng <zmw12306@gmail.com>
To: marex@denx.de
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
Subject: [PATCH v3] pinctrl: stm32: Add check for clk_enable()
Date: Fri,  6 Dec 2024 16:43:15 -0500
Message-Id: <20241206214315.3385033-1-zmw12306@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_133958_120843_7010BFF7 
X-CRM114-Status: GOOD (  14.99  )
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

v2 -> v3:

1. Convert clk_disable_unprepare to clk_bulk_disable
and clk_bulk_unprepare.

v1 -> v2:

1. Move int ret declaration into if block.
---
 drivers/pinctrl/stm32/pinctrl-stm32.c | 28 +++++++++++++--------------
 1 file changed, 13 insertions(+), 15 deletions(-)

diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.c b/drivers/pinctrl/stm32/pinctrl-stm32.c
index 5b7fa77c1184..0ef912e82736 100644
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
 
@@ -1631,11 +1631,10 @@ int stm32_pctl_probe(struct platform_device *pdev)
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
@@ -1646,8 +1645,8 @@ int stm32_pctl_probe(struct platform_device *pdev)
 		if (ret) {
 			fwnode_handle_put(child);
 
-			for (i = 0; i < pctl->nbanks; i++)
-				clk_disable_unprepare(pctl->banks[i].clk);
+			clk_bulk_disable(pctl->nbanks, pctl->clks);
+			clk_bulk_unprepare(pctl->nbanks, pctl->clks);
 
 			return ret;
 		}
@@ -1726,10 +1725,8 @@ static int __maybe_unused stm32_pinctrl_restore_gpio_regs(
 int __maybe_unused stm32_pinctrl_suspend(struct device *dev)
 {
 	struct stm32_pinctrl *pctl = dev_get_drvdata(dev);
-	int i;
 
-	for (i = 0; i < pctl->nbanks; i++)
-		clk_disable(pctl->banks[i].clk);
+	clk_bulk_disable(pctl->nbanks, pctl->clks);
 
 	return 0;
 }
@@ -1738,10 +1735,11 @@ int __maybe_unused stm32_pinctrl_resume(struct device *dev)
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


