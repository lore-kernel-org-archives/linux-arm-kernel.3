Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BC86CA100C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 09:32:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DUs5a2nDRMHuDXCRanrQ8mp2SPyokL2I7XG6/L9Iqfs=; b=x/DwRdyzWP0Ss67u0G2LgaFTcR
	bvQZ4H+9J+LDonF31xxy7upEoVXsK7juani3oYr1fqqUtjXp2T+Lbeu1nW8pUZZZB3oR2x+uBLT+u
	YGY9Q4Z6OA4prdDDLQQnNhCaoxaFmwjsUOS52nWjxVsluOGxqrTGRMSAv3w5AbiMgCksChAaEE/OS
	nuUJj63sCgYHdapr/ChirYae9k3we2iqNPv0GEgrrfEpwZoJ+qUBlCBE7/EPBD/wZWU+sxau3sLSd
	ard8uWDpYbYCouJylhIYcaFoZ5iUKXVj9eB/D4NE1j0DpmybPugTJMUqn+tPmihXmcWURdS2Bz9ey
	WTzXlzQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utjql-00000005waA-1vTF;
	Wed, 03 Sep 2025 09:32:19 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utiPz-00000005Lsj-271x
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 08:00:36 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-45a1b065d59so42562915e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Sep 2025 01:00:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756886434; x=1757491234; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DUs5a2nDRMHuDXCRanrQ8mp2SPyokL2I7XG6/L9Iqfs=;
        b=XzQp7r7wpy9S+wcODcMh6n0JilONkv1JFvPIhMRXdxIDNoBsd8Qo8zdkv/FV2WRUbG
         rb/mA+Wmmmegm40YfSub/7bZVy+j4hSTF36RiPRQLZTg5+8mmjcM87FCWgY3UoqX8Yoi
         Be2L9AXoBeohwTBAiyIH2aVZTSaJ97rKu+dVnGC+7VuEbwy49GeWiQhXP2Dukc+G7D23
         Y3ctlUwnXM9mGSLitQXmxge2CYWXgUEqhc+zFBiXcSYCmmliG5PEXd9CiA60ERlRaR6V
         XaJ71rUvJxgOL9jRYup0Ybf4KXGA1vs6db7zsTTZ3Fp55+8Lm0z04diSirLgT42VNYNa
         Wrww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756886434; x=1757491234;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DUs5a2nDRMHuDXCRanrQ8mp2SPyokL2I7XG6/L9Iqfs=;
        b=kHn+yxf+LJg/ni207dpHckmnxsyztJbP5C0RqYP6mVDsy1mZ5kUFa4YLy5jGFBg0WM
         IHKvaeg8KkDwnYlLJ4KGNq751hUXrKM7PAwkKgC8JjZcAFLomW2ARNSXsrgGfdJqGlEE
         vABqvYlM7WQ3/sX7+a5SIYcQuWJmZWT9crBegZ0jwqeyRoQ8D37+Fi+bEU7ymoHGH1je
         sW/Sdgk5jDOR+bY6IhqsLSMyNCEHWmc2XUHGaA54MO+CfXXppkVKx7Zh+z6FUHoDXf7R
         yTum5LjD2ddk/Pm3gTI2BUUIEgIlIHDIOusxwU3AgtU6O0Xw7WP2BSBXK7gyxqU5UO8F
         cXkQ==
X-Forwarded-Encrypted: i=1; AJvYcCVjIBbm0V0PXzucLZoNSpLpMpzSsfY3KZWVZ3lPKXawQxY5jjkNJcea9U+XUbtOTGBqfMqJkUr9+q6QqMgkiThb@lists.infradead.org
X-Gm-Message-State: AOJu0YyZaoL15izkvtdPPs1Lv4aPMeDyLFfxEQ6Bp/hKQ5VCLCTcUi+V
	z7+hf/vGvEalXqAsRrTcaOWyhsgmzGyUQj+FzvNzWT6qtYOCTmxUD6iuWWj2nSiJ4TQ=
X-Gm-Gg: ASbGncvfnM/QEjWbdnuCEKuV1HrjJY8HeQa2gRRpGhyADo+DM+kZgVKhKp/pYEj+3cX
	MNZ+bQWwmPwlLvT/aYHEM2L/+NTWerJK/+Zxntt0Xuuvc+w718nIdhS9NTLKgtfeHgWVpijQ3Qw
	Vp5+S4k1UaZaOcpmVycqbA6pJcaTDFp+sb6epRg/LL88Cj/lv5hZ3U2Bu2ZtFI8hUcTCabWYbHx
	oY38wdcvvcn3soG/xqogHCy6yia7LlAbdMn9rC2d189mZ8HZxRYOR5uMn+LbF+n1Kj4IWjE21h3
	2vG13+RlwkdyIfICmtS2N4uu1U8UlIug4d0he9F91sQub9wIbNH0SBdNmgkqEdRWHYSt9WBl7A9
	wj4Bt+GYzrlNHWOiH
X-Google-Smtp-Source: AGHT+IEMba6q0Svy6j05dV6GpujDBA44kyoLSyxy6GrAMJf+eSO5tVzoWY8RSOQG3GEyGuAntTfqZw==
X-Received: by 2002:a05:600c:3b8e:b0:45c:b5eb:b0c6 with SMTP id 5b1f17b1804b1-45cb5ebb1b1mr10144145e9.5.1756886433580;
        Wed, 03 Sep 2025 01:00:33 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:2f8b:4799:6bd6:35df])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b83e954b7sm113331635e9.1.2025.09.03.01.00.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 01:00:32 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 03 Sep 2025 10:00:15 +0200
Subject: [PATCH 11/12] gpio: ep93xx: use new generic GPIO chip API
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250903-gpio-mmio-gpio-conv-part3-v1-11-ff346509f408@linaro.org>
References: <20250903-gpio-mmio-gpio-conv-part3-v1-0-ff346509f408@linaro.org>
In-Reply-To: <20250903-gpio-mmio-gpio-conv-part3-v1-0-ff346509f408@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Linus Walleij <linusw@kernel.org>, 
 Imre Kaloz <kaloz@openwrt.org>, James Cowgill <james.cowgill@blaize.com>, 
 Matt Redfearn <matt.redfearn@blaize.com>, 
 Neil Jones <neil.jones@blaize.com>, 
 Nikolaos Pasaloukos <nikolaos.pasaloukos@blaize.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2399;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=GJsYS9qvoX3QonYp85b//aD9vVTY/JuUBAswwiFS/LU=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBot/WSAvrbmquF95WoAteJAHY3x8R+laWadw/t3
 hnIC2UeZQuJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaLf1kgAKCRARpy6gFHHX
 csBbEAC35337SE4UYd5PJjrBlHCAdiTFv8Z7leMRU9KGJd89RudfjC33kMXkpN8LKsFBbAT3qG7
 TWwq/hVgOeYhxt1k1ltZTEmfjp7kAK2SwV+++EnD4f7loyU9uw2Fy4rAOiCn1G8ElbIJ+g6uMjL
 tBd6oSj2Cg1l749I+DqXJ5OxF7kzttxtdzeu3YrijlZZ/i4TOxmQJeOq9BIqB2nQ6TT9o/w9JFS
 zqwCRi01Plglj60lnPKR5pVByHGL+oTnpIDaXbWuLlckCYoSGANy66JsOdf2yabwVyaHAH+cIAi
 OM7saGCqrI40aL4WQC53x3CHY0klBgQsWxnUjDh6aLqKJY8pKfSc5ZbnyNpVH6VvfR8tuQQriwg
 L4zGWd94RNsGBGrMjmbBL+3pFthDRyRzHHv8pKMALQSroowGCfCAuBvx432ZWS1Yyr9GckqqB2V
 OSFR+7tbbzTLDSZOIVD6/QQfxBjykcY7+c71Vvh8AgoxttD9fU/4TcTC7MUdnKpEH2Kd/StlyNK
 7O9dU2i4sHamnUGpG4sNkhDSkXp5ZM3dBqO8Mps2uSpSO0cKBG7guQbB9nJxNLCipuvnCQvAv4y
 rvrhsSBg9uleehj3Oyq+peSKBqqSddVizZznSVO4RD0GWBEEGeSEuREoQpyeWiJtkDIPHMlg59t
 IV0RNeuOfeyASzQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_010035_548292_40D1A752 
X-CRM114-Status: GOOD (  16.91  )
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
 drivers/gpio/gpio-ep93xx.c | 23 ++++++++++++++++++-----
 1 file changed, 18 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-ep93xx.c b/drivers/gpio/gpio-ep93xx.c
index 08e5ae8bf4d1a80ca26680a3c7bff0b8039fa41a..c6c8170813331be567048980710226792b4b2a02 100644
--- a/drivers/gpio/gpio-ep93xx.c
+++ b/drivers/gpio/gpio-ep93xx.c
@@ -11,6 +11,7 @@
 
 #include <linux/bitops.h>
 #include <linux/gpio/driver.h>
+#include <linux/gpio/generic.h>
 #include <linux/init.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
@@ -31,11 +32,14 @@ struct ep93xx_gpio_irq_chip {
 
 struct ep93xx_gpio_chip {
 	void __iomem			*base;
-	struct gpio_chip		gc;
+	struct gpio_generic_chip	chip;
 	struct ep93xx_gpio_irq_chip	*eic;
 };
 
-#define to_ep93xx_gpio_chip(x) container_of(x, struct ep93xx_gpio_chip, gc)
+static struct ep93xx_gpio_chip *to_ep93xx_gpio_chip(struct gpio_chip *gc)
+{
+	return container_of(to_gpio_generic_chip(gc), struct ep93xx_gpio_chip, chip);
+}
 
 static struct ep93xx_gpio_irq_chip *to_ep93xx_gpio_irq_chip(struct gpio_chip *gc)
 {
@@ -267,7 +271,7 @@ static const struct irq_chip gpio_eic_irq_chip = {
 static int ep93xx_setup_irqs(struct platform_device *pdev,
 			     struct ep93xx_gpio_chip *egc)
 {
-	struct gpio_chip *gc = &egc->gc;
+	struct gpio_chip *gc = &egc->chip.gc;
 	struct device *dev = &pdev->dev;
 	struct gpio_irq_chip *girq = &gc->irq;
 	int ret, irq, i;
@@ -327,6 +331,7 @@ static int ep93xx_setup_irqs(struct platform_device *pdev,
 
 static int ep93xx_gpio_probe(struct platform_device *pdev)
 {
+	struct gpio_generic_chip_config config;
 	struct ep93xx_gpio_chip *egc;
 	struct gpio_chip *gc;
 	void __iomem *data;
@@ -345,8 +350,16 @@ static int ep93xx_gpio_probe(struct platform_device *pdev)
 	if (IS_ERR(dir))
 		return PTR_ERR(dir);
 
-	gc = &egc->gc;
-	ret = bgpio_init(gc, &pdev->dev, 1, data, NULL, NULL, dir, NULL, 0);
+	gc = &egc->chip.gc;
+
+	config = (typeof(config)){
+		.dev = &pdev->dev,
+		.sz = 1,
+		.dat = data,
+		.dirout = dir,
+	};
+
+	ret = gpio_generic_chip_init(&egc->chip, &config);
 	if (ret)
 		return dev_err_probe(&pdev->dev, ret, "unable to init generic GPIO\n");
 

-- 
2.48.1


