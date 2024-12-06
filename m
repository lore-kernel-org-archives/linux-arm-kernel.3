Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B41FAE77179
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Dec 2024 21:05:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tIsQxVZOmSisxuVH5z4x+NyiZyPKlPsv2rD1mEtYR5Y=; b=gDh+Zodz1J65CJDbjT5DMiVGMm
	LAER3uAS1u6VEMau5CeZoPNv6tWzERvnx43S6HxUdC5Z/OGC74fahrdpA1rV0n0Sbdq6OKgvtJnZc
	UgU0TER0a/tFKyzwzLQtLRNhIhdKtIFCXwoM/kstE4kA74R7sqt77VmOBV7tg0MgIBwAYsZYKvQl6
	2FW3Fr0Bh80wxQzUl+1bP+cA19yQw3VQUxkT6B1ppwf8sOEibGBS1E/G/SImE7NhtuLlu1qqhmJQx
	FccIMXdjT/aEjQPu8p42Hz4U5SLSo96rOVP03mvVb+3qfAX/odvxRkxaTDY9TNedDNfIxph8Uy2f5
	xCAEa5TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJfWF-00000002k35-1hKI;
	Fri, 06 Dec 2024 21:05:47 +0000
Received: from mail-qv1-xf2e.google.com ([2607:f8b0:4864:20::f2e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJfVD-00000002jxv-34p5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Dec 2024 21:04:45 +0000
Received: by mail-qv1-xf2e.google.com with SMTP id 6a1803df08f44-6d8f65ef5abso2633136d6.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Dec 2024 13:04:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733519082; x=1734123882; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tIsQxVZOmSisxuVH5z4x+NyiZyPKlPsv2rD1mEtYR5Y=;
        b=SN0EpVlX/kNkHa07pjhUoHmf/E6DUIjn7fM44JEseWu6OTS96pX9BncHSlQLpTqTJi
         PFTohkrAx+Vo06fd3aEWR1Y8qI0XYgFI5HnqNDA1M+NX0X+Me89/na0BSIb7BbfFf16n
         x3jCu6fkrQc3ftpKPrw9XqKoULLkBXhGMoFICv9alV+323ijGC5YJgHiC0oZevq/Rfmb
         47T8EvUFnj0IwqREKrLMkZGfdNX1GHm3Vp80gzNE0EfnbjXph+ep88V/pxgtfeUWRirJ
         29kpoS6WeKlR7hFJiNuBFSPGHHER3xR9XqfyDaePuJjKNhFYmrDrTcT9syX7CS2qw9oj
         G6sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733519082; x=1734123882;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tIsQxVZOmSisxuVH5z4x+NyiZyPKlPsv2rD1mEtYR5Y=;
        b=OCu/MO/ehkeJWVyvVO4e4gcuEpW0pcNE5FjByupIEu2Tr6IxMzYH4lIiDRXDQXXt9b
         jl5e9gDmaYXq4TqWKZhw0b61qjhrlPK1UClaSOmOv8bilKC1Ekjy9/0Hy0YXT3mmcsF1
         8ezMEMFWu6DxVo8x7N91FOHQVH5fpbI5Iwxb11MWTqaO++9drJQq8xs5wjkJLdCNSic+
         EzZ73oqmMfNQ1HAxMLPa3Bx7k3OypNUz4R3m3HPXCzxVvK0REQr4k/XpLULJtHXyIKTX
         omOJdnIze4vwhqZ7rKXwTZlqSW6xWECNSXIldbqQNKiS4tBke7fzRjvqW7uPHsXY0PM0
         1NLA==
X-Forwarded-Encrypted: i=1; AJvYcCV51HGKDeijMy7YCngbQ2XFkxQMDbIepkoxaDT5AuI48lzTc3oZPdQgICWibKHIFQY40n6lXFwXxFYe/cq55cR1@lists.infradead.org
X-Gm-Message-State: AOJu0YzNlieUoCIuhBJTH05xoPLkYGgTDGhGYQop/aqJ2kO2HidB1PZI
	fw6TZel+/mMb0R0vEXM7UrkvNrqrJQhq78CI2b17ddDejsZ6eYPU
X-Gm-Gg: ASbGncvP04a+hm+QkOWcs81ll7J+O/e4lnx0Zu1+BNDO/NJdXbYVE2K4NSF67gu569n
	uha3EfC2XQsKBvujm7GKoqRoqYzVFBAMvnhpqpwPjfzGyWXFAY9/7Ov/lNnVyuBRGTU4UjeoW4R
	cSBp2BlTWfFQYkEVf25v4u2jHlgOE/fT2krBmucQteYx6n9M5DUlrEVfU51xMAWSNAyLv167z96
	EwUl9KpJoPgStF2Hw9Z23uEbnvyfuRa572TsAAbkSO0G4dI5bz3vZcvjgrGpw==
X-Google-Smtp-Source: AGHT+IEQdKZujTj7jjBxjOcAodQ9XvJwI3WBewZCeAsZZLW6wO5g4aM64JIpWh3fzo/92H8adS9G7Q==
X-Received: by 2002:a05:6214:20c3:b0:6d4:36ff:4358 with SMTP id 6a1803df08f44-6d8e718552amr89532996d6.25.1733519082094;
        Fri, 06 Dec 2024 13:04:42 -0800 (PST)
Received: from localhost.localdomain ([128.10.127.250])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d8da675214sm23068256d6.11.2024.12.06.13.04.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 13:04:41 -0800 (PST)
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
Subject: [PATCH v2] pinctrl: stm32: Add check for clk_enable()
Date: Fri,  6 Dec 2024 16:08:00 -0500
Message-Id: <20241206210800.3346579-1-zmw12306@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_130443_774755_48B64E0C 
X-CRM114-Status: GOOD (  14.97  )
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

v1 -> v2:

1. Convert the driver to clk_bulk*() API.
---
 drivers/pinctrl/stm32/pinctrl-stm32.c | 26 ++++++++++++--------------
 1 file changed, 12 insertions(+), 14 deletions(-)

diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.c b/drivers/pinctrl/stm32/pinctrl-stm32.c
index 5b7fa77c1184..188de29ac281 100644
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
@@ -1647,7 +1646,7 @@ int stm32_pctl_probe(struct platform_device *pdev)
 			fwnode_handle_put(child);
 
 			for (i = 0; i < pctl->nbanks; i++)
-				clk_disable_unprepare(pctl->banks[i].clk);
+				clk_disable_unprepare(pctl->clks[i].clk);
 
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


