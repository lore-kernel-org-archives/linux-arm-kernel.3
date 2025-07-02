Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DC82C7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 09:48:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L4z7uLdvG+/iHUHRwUBjtv9RcP8yTkbhvtYl1/Q8RRI=; b=q9g2jrDnAhCSPPG+Yv5LrK71Te
	Jrcnvy5JF1J5Q+/UN4CAjRENgWFVpl+nSjZXL5TB4cmdOIXxLQ2ftfrhsNEcRHMR34RbL+JBc7v/r
	FLM9trFTDe/bSdWtVnmtA8yS/hvS0nkVrDWhcjrJ9C1kvdyoM+7zGDgZqh+17vG1ihPjViAuY8mXK
	kbsq7n4sXjaidxaGoRGo1pJwmdtnyqk7YCM029PmhQEK1mxnkN7iaRhNdU5FGJ7dOGNvnBifrDCOY
	M9vrsYVHB7gEAWebXeQ7OgLsVoWIQozzHtXK8MSxUCBalE3fS++vUxFEOFG0UYnRMYmcyipUnB5D6
	0OP4zO1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWu4Y-00000007pzE-2Zoy;
	Wed, 02 Jul 2025 09:48:10 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWtfY-00000007kcE-2WP8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Jul 2025 09:22:21 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-453749af004so36005455e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Jul 2025 02:22:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751448139; x=1752052939; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L4z7uLdvG+/iHUHRwUBjtv9RcP8yTkbhvtYl1/Q8RRI=;
        b=jaVmF1a2h51aL3z/mV1GW3bp5mQOsdvb6X+z8T40wHwxAGOCUp9OLDoZhqnoyDz7Z2
         wVdnLGTK411h72rajn3+KhXnLCH1Vqp8vov3UYNgtpkrB2wJuQxNl2sk89aBY95ymf/O
         cry3UwmpSqll4jLAIl0OTCMPYL5Ujzgtwkzl8gvS2MF9XAp4283yNQMH7h7rwdheRd/G
         iOmkr0i33/CvAZqhLPfE7t1w4cno6vWY/OP2WMCK+zrDaWorfMakRw01MqIavR2/fIKC
         M3ZYNNJcusikXgYEVjNLiFESKMv/qDx39+0/OFOXkhVDtFfWsX90E8tpayXibLDa1WEW
         c8gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751448139; x=1752052939;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L4z7uLdvG+/iHUHRwUBjtv9RcP8yTkbhvtYl1/Q8RRI=;
        b=BR81+3c5ylNy1fRwQuO9SWtEY/AHshP3DjMkctwNQT/o4TDXOeZCXIps+tgSBfF2Pm
         cgw+G8eiQl/ciIWScsDpUXOmhaBD9y8bkoqu19Ng5huXsXHwz11c9wJWQdmo7DgLggdo
         een5rD8D+4np+6YOPZrWao0ybTqiRiuYz1YHNzbiZ/b+/mI0WUL65tRLVTskbmVPtgdh
         FLR/KcBHh6rEB3L3zRNKVqxoV2BlYgv7kvzoBeqEjpS7EREVY0JoDE65SPoeHJqIwlGK
         fTdNVRWkMyWqO18tGrixYqc3hmu1J6cyxWQz8dLcxIKGlE6Ckp9RySCSVn2MKUNnGRHW
         MyJw==
X-Forwarded-Encrypted: i=1; AJvYcCUS0gog9oDpsCbrCYuev1B+P5+s4Qkfxql+1QPvT++Xj8Z+u+3gXm5wCEidn7BuMx7Rs6cZPmDIy6JYku+2ZrFO@lists.infradead.org
X-Gm-Message-State: AOJu0YxIWXZdSJOCtZ5p7PlhmS6SGrIMev0r6TKvzYEiuThoh13YycC2
	+iLEAKgIyDL4NnwHDDUX8Rb7Xpyz/8Bd41IWxNM1b5k4prMKC0zU9drMajh7oXxUDBs=
X-Gm-Gg: ASbGncvZU0rznbPiVLC3+dm7lfUHMNXuaAY08foS9Wsi9xLhZKUrTH51HjcnsCvRzRV
	od1Ea5TbcvcKolmHolxjEoWqkQa8XRvtI+xqTUVETsMNHvpD8ZoHFFWHfBPNCN0p2hamjex0Doo
	8/atcLtSd5BBPcXE9G9AKT+g16730jOgfTu/h0L6gfwBHrf6+t20jTMBrQe6p9E3fsuZcOBC9yn
	ejrJ/Dj2OhzLGmEy6676gO/oNGIYwxKcnxaMFGw9D88qJqYVcmmmWHwdftuxA4xdKMOkgbu/Jlk
	i/i11EH63nt89VHnRn/rpxSQPJSlpH3YuV+5PUFghpnyCkDwi2rLBw==
X-Google-Smtp-Source: AGHT+IHBXvE7b446X64FYR5qJVVdlVXFYhv2VtwqkK3inSCOodlHyO04CC6RTEHbQPm8wwAvG7hKEg==
X-Received: by 2002:a05:600c:b8d:b0:43d:4686:5cfb with SMTP id 5b1f17b1804b1-454a3726701mr19897745e9.27.1751448138880;
        Wed, 02 Jul 2025 02:22:18 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:8827:d0e:25e:834a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538a406489sm195844165e9.27.2025.07.02.02.22.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 02:22:18 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 02 Jul 2025 11:22:11 +0200
Subject: [PATCH v2 4/8] gpio: clps711x: use new generic GPIO chip API
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250702-gpio-mmio-rework-v2-4-6b77aab684d8@linaro.org>
References: <20250702-gpio-mmio-rework-v2-0-6b77aab684d8@linaro.org>
In-Reply-To: <20250702-gpio-mmio-rework-v2-0-6b77aab684d8@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2481;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=1VKAdAKKIoL9buozcarUr5qCb4Dsa0/LBFXC4LmZLHs=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoZPpE4+oOICtUp+FSaA4fJrpU6lwXsLCylgffQ
 z9f02V0pbGJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaGT6RAAKCRARpy6gFHHX
 coKlEACz8yJTnbagZm7wSx+ar/VBtkbPGeTQLH3onIRqkVA55DttopeidlxnERomP/YLLzMNape
 F923qXs8eDJBz/SC3gHrOKQptACBL9Oyg99fbXuIQrhVWtFdM7ZEq9mD1I9ChioOehf+2+C3FPI
 H1Gr4emOk3uUDreRP9GX5Q+HdPwJxBEqEow5SuDvkISSMC132pbZonfSOlu+ncFLK2oWQJaR7NF
 tY1q5cEvv7cyWqbqG9ZhI57J6SZlSPHrtfBdeUsj8H+SLgZZyK0gMkCde7anLZMs5Eigzj4mBcf
 jMZmlt4pReLvYejapfEQALgacsFQsZODdhaQsWYS3Jq0a0cQt1G32JXJHE7LCNVsXLdkaZ4cYYU
 zvE3UK80VfdFLGLirYISO8mSc/RF5P0foFaIV/kW1UP6WexYiSRpl55knz43Br5z+Dl06scoI7p
 5gLyrPzx12ZUjMfb/Or2RLnk0SjX0mJQhP1pneZwGX0yiI/umEbd51GsCWu5DMdWCkhRVczrPlB
 pm1Po3R3M4Gf5Pk3tpSXZEN7Fd+JJRAoJhgjj6un9LZSbcJmvZHJoRcSI+QuTKGdSRW1YwGcCzp
 TMybDr69MmHi/UzRfNEAstUg/tExr6NtSqNcEe9GcRXwWBGWBgSjhpWRpRd5NH63REsSjlZtoOM
 wvG0YPPlgAlu8RA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_022220_644578_3F6CAD5B 
X-CRM114-Status: GOOD (  17.34  )
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

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-clps711x.c | 27 ++++++++++++++++-----------
 1 file changed, 16 insertions(+), 11 deletions(-)

diff --git a/drivers/gpio/gpio-clps711x.c b/drivers/gpio/gpio-clps711x.c
index c0c8d29d0dce7617c240daab6597692118b348cf..24ff2347d59974c5b1b43595a157d190e7fb4864 100644
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
@@ -36,34 +38,37 @@ static int clps711x_gpio_probe(struct platform_device *pdev)
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
+	gen_gc->gc.base = -1;
+	gen_gc->gc.owner = THIS_MODULE;
 
-	return devm_gpiochip_add_data(&pdev->dev, gc, NULL);
+	return devm_gpiochip_add_data(&pdev->dev, &gen_gc->gc, NULL);
 }
 
 static const struct of_device_id clps711x_gpio_ids[] = {

-- 
2.48.1


