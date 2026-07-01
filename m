Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2CD3C43327
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 16:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o2O8g8Db5b5I21/nPDlKVMMKnQYMRRmUA/SB/cdxABs=; b=Q8MXaF8WpmNJj3a3OOQPuWqqD8
	yBratSS2C81Hx4J1n38EgwilYdd9L/LTsUXWwPktJZ7T7cI08iNSfQX2DT8V5E68xKE7C2LZOLBEz
	5na52Npe2Etr+hdO4h4zYb0ytgX3PMK3Z8R5FUQCJ5Xot/Zi8Z79OgSVwtCbQ/3DWZzJ0tXkXbZr/
	hiRSoFQXlRFPUKwFyVvBX13jhJGAhifXaxidv5aasvNtRCtRHD7SpyL9M0SwP4yw58xIolAblvtjH
	oV/sumbYItdxRTTm6Hs/diSQ90obMKmIrMmUcmVjB6CIQX45zJog02k4HeJmlh0BasiBrHs10OgRs
	1hQ4kemQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weyFK-00000002dVN-1nt7;
	Wed, 01 Jul 2026 16:57:10 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weyFG-00000002dRL-0qPU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 16:57:09 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id CCDD31A0DC3;
	Wed,  1 Jul 2026 16:57:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 99AFA5FD9D;
	Wed,  1 Jul 2026 16:57:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 95C8C104C9688;
	Wed,  1 Jul 2026 18:57:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782925022; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=o2O8g8Db5b5I21/nPDlKVMMKnQYMRRmUA/SB/cdxABs=;
	b=gt9ENIliZ32mgrUzE2kwt9mfwxdjDm71T12KARKTSEp8bhrL9fpEMQIKD5ZIXaRx+qqqkZ
	ceJKpnUY94E4E8m0jY/KcmB7FeVL/OsKEh4T/KnCw5A0iHjUqQUdxfOwH/0HRvAXaALqk1
	j3n9iC/FGve3lFSa5sfatvQy2C7eY+qBe/1XTmJKGQII9BWnh7a0e02S5cjj48XNONk+d8
	/wFXgDx5Mcmz69CMsWL2WMSwwmSdMyoUY3x1WV8tyc2PD41tjl1WdQTEbCt8OGY/ZVStE0
	eV6SKk9ILOgGbuJFo5dCxC7Ck12WjCMshVdhtflyFWaJ5DivsMdgHlhwTnBeyQ==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Date: Wed, 01 Jul 2026 18:56:58 +0200
Subject: [PATCH 1/5] gpio: nomadik: convert nmk_gpio_populate_chip() to
 goto cleanup
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260701-gpio-nomadik-silent-v1-1-644d10316cef@bootlin.com>
References: <20260701-gpio-nomadik-silent-v1-0-644d10316cef@bootlin.com>
In-Reply-To: <20260701-gpio-nomadik-silent-v1-0-644d10316cef@bootlin.com>
To: Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Gregory CLEMENT <gregory.clement@bootlin.com>, 
 =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_095706_381527_A91AC76F 
X-CRM114-Status: UNSURE (   8.66  )
X-CRM114-Notice: Please train this message.
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

Remove duplicate teardown code that is found in all error if
statements. Replace by goto-based cleanup labels.

Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
---
 drivers/gpio/gpio-nomadik.c | 44 +++++++++++++++++++++++---------------------
 1 file changed, 23 insertions(+), 21 deletions(-)

diff --git a/drivers/gpio/gpio-nomadik.c b/drivers/gpio/gpio-nomadik.c
index e22b713166d7..f25f251f4757 100644
--- a/drivers/gpio/gpio-nomadik.c
+++ b/drivers/gpio/gpio-nomadik.c
@@ -527,15 +527,15 @@ struct nmk_gpio_chip *nmk_gpio_populate_chip(struct fwnode_handle *fwnode,
 
 	if (device_property_read_u32(gpio_dev, "gpio-bank", &id)) {
 		dev_err(dev, "populate: gpio-bank property not found\n");
-		platform_device_put(gpio_pdev);
-		return ERR_PTR(-EINVAL);
+		ret = -EINVAL;
+		goto err_put_pdev;
 	}
 
 #ifdef CONFIG_PINCTRL_NOMADIK
 	if (id >= ARRAY_SIZE(nmk_gpio_chips)) {
 		dev_err(dev, "populate: invalid id: %u\n", id);
-		platform_device_put(gpio_pdev);
-		return ERR_PTR(-EINVAL);
+		ret = -EINVAL;
+		goto err_put_pdev;
 	}
 	/* Already populated? */
 	nmk_chip = nmk_gpio_chips[id];
@@ -547,8 +547,8 @@ struct nmk_gpio_chip *nmk_gpio_populate_chip(struct fwnode_handle *fwnode,
 
 	nmk_chip = devm_kzalloc(dev, sizeof(*nmk_chip), GFP_KERNEL);
 	if (!nmk_chip) {
-		platform_device_put(gpio_pdev);
-		return ERR_PTR(-ENOMEM);
+		ret = -ENOMEM;
+		goto err_put_pdev;
 	}
 
 	if (device_property_read_u32(gpio_dev, "ngpios", &ngpio)) {
@@ -569,16 +569,16 @@ struct nmk_gpio_chip *nmk_gpio_populate_chip(struct fwnode_handle *fwnode,
 	res = platform_get_resource(gpio_pdev, IORESOURCE_MEM, 0);
 	base = devm_ioremap_resource(dev, res);
 	if (IS_ERR(base)) {
-		platform_device_put(gpio_pdev);
-		return ERR_CAST(base);
+		ret = PTR_ERR(base);
+		goto err_put_pdev;
 	}
 	nmk_chip->addr = base;
 
 	/* NOTE: do not use devm_ here! */
 	clk = clk_get_optional(gpio_dev, NULL);
 	if (IS_ERR(clk)) {
-		platform_device_put(gpio_pdev);
-		return ERR_CAST(clk);
+		ret = PTR_ERR(clk);
+		goto err_put_pdev;
 	}
 	clk_prepare(clk);
 	nmk_chip->clk = clk;
@@ -586,12 +586,9 @@ struct nmk_gpio_chip *nmk_gpio_populate_chip(struct fwnode_handle *fwnode,
 	/* NOTE: do not use devm_ here! */
 	reset = reset_control_get_optional_shared(gpio_dev, NULL);
 	if (IS_ERR(reset)) {
-		clk_unprepare(clk);
-		clk_put(clk);
-		platform_device_put(gpio_pdev);
-		dev_err(dev, "failed getting reset control: %pe\n",
-			reset);
-		return ERR_CAST(reset);
+		dev_err(dev, "failed getting reset control: %pe\n", reset);
+		ret = PTR_ERR(reset);
+		goto err_unprepare_clk;
 	}
 
 	/*
@@ -601,18 +598,23 @@ struct nmk_gpio_chip *nmk_gpio_populate_chip(struct fwnode_handle *fwnode,
 	 */
 	ret = reset_control_deassert(reset);
 	if (ret) {
-		reset_control_put(reset);
-		clk_unprepare(clk);
-		clk_put(clk);
-		platform_device_put(gpio_pdev);
 		dev_err(dev, "failed reset deassert: %d\n", ret);
-		return ERR_PTR(ret);
+		goto err_put_reset;
 	}
 
 #ifdef CONFIG_PINCTRL_NOMADIK
 	nmk_gpio_chips[id] = nmk_chip;
 #endif
 	return nmk_chip;
+
+err_put_reset:
+	reset_control_put(reset);
+err_unprepare_clk:
+	clk_unprepare(clk);
+	clk_put(clk);
+err_put_pdev:
+	platform_device_put(gpio_pdev);
+	return ERR_PTR(ret);
 }
 
 static void nmk_gpio_irq_print_chip(struct irq_data *d, struct seq_file *p)

-- 
2.55.0


