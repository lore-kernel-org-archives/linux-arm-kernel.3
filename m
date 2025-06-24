Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79B07C71157
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 13:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yz5UgUcfJE5/vvcmcGQA+0Z6POYK3b+XtNUBsVCQb4k=; b=EWB6t4slxof5PmRQuMJmpaquB2
	xpBaqOX7stX05uKo6PF+4oOIWfy/UsVTPCWuOFE9we0kl7TkUO8WyEqVrobjZHCMY8N0pqDYuM5V2
	5AA27vFy5ZzziSAvjhmoETaNliz2IMerfjgWQQ+QzjLFmNcvZsaNRLXKNhr2gXZPrkr2Wtz7JU+Wj
	H7MmrM+TdYcTyMwwr9bvS4BElQGlNZm7fTqOHPMAQZ5NkXVQ4Q/5Z/JdXIn+gwkmM221U/xLHBvVR
	q/DH0EJlAVGFAIhjEUkzHcZaVUpjKq2iNXXgYFBAtR0Dmf7VxpbSUS2hk37OhUAsFjObnUSvUSDV0
	MXC9aNTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU48j-00000005nsZ-3Xvr;
	Tue, 24 Jun 2025 13:56:45 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU3gj-00000005i7p-2JRV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Jun 2025 13:27:50 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-453608ed113so47086295e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Jun 2025 06:27:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750771668; x=1751376468; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yz5UgUcfJE5/vvcmcGQA+0Z6POYK3b+XtNUBsVCQb4k=;
        b=lzpXiRUz5rlblh2Vjz6HhUfT+KdFcpRE7VC1Y6GD8GuYyQp3jYfH+tT0GH+MBOfv3M
         Kk9g49I4RJU3togKkSfkDUe+eL8PIlTJO/MbUF17MATQr2l7gdZaBaVJq/04Hs7oCFN2
         PMDl+IKRyFMR+10HCuOO3pGy3gzRAOjDG1FoHK/xfpjk4hGRx5ef9OxdoV82+4WOm9oo
         FrB5WXiYDlyah8PCjUizVFmXDDAzDW8TxLXztc9UAZNJwvV6gAXU+GNytpktfNFpqpt/
         XTGraNNOXuCeMOaPIIlTzr7zsMGg7Kpjm/0dJBmXihuaWdhUJML7vAqSwvqlxKxjxUAI
         kTrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750771668; x=1751376468;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yz5UgUcfJE5/vvcmcGQA+0Z6POYK3b+XtNUBsVCQb4k=;
        b=ArNk+w5b/v/htqmB1+a9S2MBvfSeQMM2fzAgenN2ap0MDekEKcom6a+QdgiHkCVGqX
         /Go9amVRo9nL1AJYHIwHZkZBt1putb0zEA3PqSn/PqHBkcmacCdXjLOGw2MNKk+dxdG8
         R9gJKaK7gdCjJA5dvMPtoUV69oXS7rHZZ86VC9C8ybT3jtibNdd/9KvTyiAlvOthdUNO
         zRU4ZwlJCpXRCxSZVAAvnY5dAnIO7P5zJijPQJN8nEE7DUeDx+j1jVUSZO5X0XA4tIVO
         5giye5JZmS6/tgIcY6Wby7CxmOYPmP3c89HQnQalu24CSnlwkyi00rS2oGAswHNupyFO
         aEvA==
X-Forwarded-Encrypted: i=1; AJvYcCVUFcNSz0A1v30iqc3ebMjMGj573/zijnk+wEk67ZpWPLo7lw8AG7zcw2eeFm12lYef/vv7852LqP/Fl1k9YsBv@lists.infradead.org
X-Gm-Message-State: AOJu0YzcEbkaqXunVimo0y1xZOgP6bEmuBwj6XT1UwKT23ivslghgl+d
	kMsg0Njesorv2+aVMcPNYQauFnJEF94Eaps/VCfUrxu+9BGl0+8qfe/qB91iL6lx1t8=
X-Gm-Gg: ASbGncv9Mn7wg79sTc507/jE9jvhdgI2v3qOBG9oKf3unfKPgdmCMQss/In7C79K9v3
	0777BSbFEl8PXG+nb0+WqBMfzBFoKanBIKb5APorYc+kISXCcPtoYhv6toIaE+TNpTbp5QBChlj
	upDZ/LtF3zN9CLRVCN6ue4WEkakTXswmuga4kvUhTDEA0c72z1qEkeTw5pn4XUQfMI6SmZyFvPz
	XgMumLRKNoJf0pQO0l5VZRzUnvD05EluFHFTyUaEXmMIJM8rNnJxQ8eCAPHK2KTD6SliOwnkec/
	8wCEGZPOjE5PzNczKVxpQc7rvkqRFRL6jWgcZExAOY2xgtJx47dLrjY=
X-Google-Smtp-Source: AGHT+IG/rMIA1tRjVdj3q4SOViQlyMWTekKDIwuSgQnLjsVI8uTdmmUZ8XoTL0DwczoQXfHr+oFANw==
X-Received: by 2002:a05:600c:4fc5:b0:453:2066:4a26 with SMTP id 5b1f17b1804b1-453659ee9famr163886375e9.16.1750771667661;
        Tue, 24 Jun 2025 06:27:47 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:34d2:109c:3293:19e9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453632312a3sm152588485e9.1.2025.06.24.06.27.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 06:27:46 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 24 Jun 2025 15:27:36 +0200
Subject: [PATCH 4/8] gpio: clps711x: use new generic GPIO chip API
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250624-gpio-mmio-rework-v1-4-aea12209d258@linaro.org>
References: <20250624-gpio-mmio-rework-v1-0-aea12209d258@linaro.org>
In-Reply-To: <20250624-gpio-mmio-rework-v1-0-aea12209d258@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2507;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=OkRIBmYFSPotnoBgPQDP6/8HKcnoOvUDc41iS6fYioA=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoWqfMbPu3QHXEoC8paJDXYv/gt/g9kEj7UXkyU
 u/AkDzJ9XyJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaFqnzAAKCRARpy6gFHHX
 cqvQEADRUtAfEOV7Ay2ZXGRBZi9QFKTOR5D69z+0IPw3vm3QCtGQZRlJ8JDtArb68wwxcn8W9Xl
 bhesTMoqW8ZvfiB9SwP1m0/MxRR4ur7gidUJir2mToNygsd2gZVzc1FiqtO7x5me/mGGdmR50jm
 AbhJMd74VIf8ONYDGvoR8+U3eaERIjx+FXy/ejzHQX0UYqSRyDMYYDC5n/Hsr+Su9Yi9R12eaoi
 Hnl8sa1QLcOO5vMmtjPkAQxkW8qKb3j59l7jv5w+6V5I8vlrb+gh5hTTMoIwuPwi79puS9eayf0
 AfL010thQXzq4JCkj3VnOpVabnqPMLND3RChr/ia906jXkX+A7IsE05MJcgrp0/be8cdSsvDcAu
 QrdjcI+YcElqlb0waB/hQvNub7yYf+TOlrKYpalE0O1Pfyc/8OdTWoPbzjQjXGoXHpDZUSxgtN4
 PGDp1IW/2933ZGNBxSqcHVaCIuOVTk5Cd2Su+YrheH83MGWIUgXVnufHgv85OTKuuK4ZTpq6SZ8
 4lI8d3sYUme9PeKZUPwbjh6p/nZGIDS3bpbENzlhuW8kLayIz2Ej4Rxe/fpY+GFgplPQDtJc3mp
 rKv/wXaVXbZGFr3G+dBjmdGrNM4B1oCPPb68byPwhd1GCP0/Z4jbqdK+TXRfwhUuINbZ9BetAMh
 PE1c7oyln4QHdhg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_062749_605252_EF17E3D5 
X-CRM114-Status: GOOD (  15.48  )
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

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Convert the driver to using the new generic GPIO chip interfaces from
linux/gpio/generic.h.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-clps711x.c | 29 +++++++++++++++++------------
 1 file changed, 17 insertions(+), 12 deletions(-)

diff --git a/drivers/gpio/gpio-clps711x.c b/drivers/gpio/gpio-clps711x.c
index d69a24dd4828975b4d62f66b011964456976bfa6..397b347ad6e8b036edbfff75b6a31f2170334f66 100644
--- a/drivers/gpio/gpio-clps711x.c
+++ b/drivers/gpio/gpio-clps711x.c
@@ -8,13 +8,15 @@
 #include <linux/err.h>
 #include <linux/module.h>
 #include <linux/gpio/driver.h>
+#include <linux/gpio/generic.h>
 #include <linux/platform_device.h>
 
 static int clps711x_gpio_probe(struct platform_device *pdev)
 {
+	struct gpio_generic_chip_config config = { };
 	struct device_node *np = pdev->dev.of_node;
+	struct gpio_generic_chip *gen_gc;
 	void __iomem *dat, *dir;
-	struct gpio_chip *gc;
 	int err, id;
 
 	if (!np)
@@ -24,8 +26,8 @@ static int clps711x_gpio_probe(struct platform_device *pdev)
 	if ((id < 0) || (id > 4))
 		return -ENODEV;
 
-	gc = devm_kzalloc(&pdev->dev, sizeof(*gc), GFP_KERNEL);
-	if (!gc)
+	gen_gc = devm_kzalloc(&pdev->dev, sizeof(*gen_gc), GFP_KERNEL);
+	if (!gen_gc)
 		return -ENOMEM;
 
 	dat = devm_platform_ioremap_resource(pdev, 0);
@@ -36,35 +38,38 @@ static int clps711x_gpio_probe(struct platform_device *pdev)
 	if (IS_ERR(dir))
 		return PTR_ERR(dir);
 
+	config.dev = &pdev->dev;
+	config.sz = 1;
+	config.dat = dat;
+
 	switch (id) {
 	case 3:
 		/* PORTD is inverted logic for direction register */
-		err = bgpio_init(gc, &pdev->dev, 1, dat, NULL, NULL,
-				 NULL, dir, 0);
+		config.dirin = dir;
 		break;
 	default:
-		err = bgpio_init(gc, &pdev->dev, 1, dat, NULL, NULL,
-				 dir, NULL, 0);
+		config.dirout = dir;
 		break;
 	}
 
+	err = gpio_generic_chip_init(gen_gc, &config);
 	if (err)
 		return err;
 
 	switch (id) {
 	case 4:
 		/* PORTE is 3 lines only */
-		gc->ngpio = 3;
+		gen_gc->gc.ngpio = 3;
 		break;
 	default:
 		break;
 	}
 
-	gc->base = -1;
-	gc->owner = THIS_MODULE;
-	platform_set_drvdata(pdev, gc);
+	gen_gc->gc.base = -1;
+	gen_gc->gc.owner = THIS_MODULE;
+	platform_set_drvdata(pdev, &gen_gc->gc);
 
-	return devm_gpiochip_add_data(&pdev->dev, gc, NULL);
+	return devm_gpiochip_add_data(&pdev->dev, &gen_gc->gc, NULL);
 }
 
 static const struct of_device_id clps711x_gpio_ids[] = {

-- 
2.48.1


