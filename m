Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 109F1C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 09:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oFnnyTfsIXQpJhF+/WGQapUuTCZXSiHk8q2X23fZOlU=; b=2N6k5hZIyMLWLnygClP1Fvg+rZ
	EmqUmA4BkuzgS/l3GaEL85p81NAZE2AQ+d+w2a6t4BgNuegFsZvcuTSJKEr2tczPZFPWTzQknNfTQ
	pi8ZzkCbum/8xST9rkfCVNqGzWuMMrO87FoLZtEFIJ3QgR7T/gapAi0n+8bRPhIkCKFQVt9jibaVK
	+EeECU/mPNI1IAyGTByotEjN+XS8Ed78bC/FwknotV9Fw5VMkr7fq5ZyX69weXaS2DWe7z7umq7fC
	ni5f0yKAjWru/XJqir+m3g1AiZzW9RYzQTIgCCl2b3ySgq/0ds8s9DffYVGN9nwLcSkjSpiwAswcB
	Q1OktVIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubbWD-00000004bf7-2zpH;
	Tue, 15 Jul 2025 09:00:09 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubatI-00000004Uv1-3VnQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Jul 2025 08:19:58 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-451d41e1ad1so36335885e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Jul 2025 01:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1752567595; x=1753172395; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oFnnyTfsIXQpJhF+/WGQapUuTCZXSiHk8q2X23fZOlU=;
        b=Kl6fKUJl9slMKa7oDTUbJvVSQIv3VA6PE6pcFCVcNUa/9V3FtMyuRzBHl7Rcuk2JfN
         642mS7cHq+lW6YuIgp78SrbdkZQyivSWj6sUN/hLbeFNuR59Fn6NmDMA7fAr3OeDrI4F
         MsUfETyr6wMut3gkABoySCwCIN9BV5xE3evYWzVwr+pmoX15YO77Z5PouGl/HLMG6MX+
         hKBColNWbgvUr5t77lSr6cmG3BVsR9pjHQ/jSlEX+uMEsCLvGxvhJMazPq8Vv3KXV31y
         NNp08Hga5/rwaurnr5+zoIFOoely2BTcz58ztyh6EsSOVjK5aBbAZJpQlfoQh0vpDip9
         LT+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752567595; x=1753172395;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oFnnyTfsIXQpJhF+/WGQapUuTCZXSiHk8q2X23fZOlU=;
        b=NcRixXi/OnYawyjuWdD+wn+xg80zD24dzMyBtSwHTMhfsmOQqTEWFX+Az3mFbcsUPx
         kfdCNMQruVm17PaR5P1/gghrUznPMVK6NNJE1x1c8YDsyrFeRgrlQriYgwLQ+f0gvIkn
         zmvKHuuOLSAfZzCwpSVcicI4tuevJ2qhoRhZpiqJwiHh/I3OsQ7vShBaM7zlH+EMh2ZT
         ACI0GMuchDxBOPUhQ10Z2FINlCD9q9AHkc3KhYyhI4DfmgDk8qMUgCD5UfOpwOTFdzVN
         5OHdVWLVwKTBVUHv/BqSaiVEqIHXNeRw7z3Z4Ff7r1MJXqyi5QG07zYqxKm6O5aTP8Wy
         BOkg==
X-Forwarded-Encrypted: i=1; AJvYcCW/R0vnfd/1mad33ehEoaQSBf57154SC0pyILuIJqu/fWWQ/UvMvlpxF48Id1kb1hP2eefrtqCl9hw3lOR2ijuH@lists.infradead.org
X-Gm-Message-State: AOJu0YyDYYCzfjPuW3e4a4+ZW7WMWDpdqrITb6VfBY6jfuJvJSuH/w0p
	Y5Rm7zY0gcUmKN8CNR2SaFSHYb7/J4rUDQwu5iYUXPw4s4/Nelilo1LMh7F7Lj+imzY=
X-Gm-Gg: ASbGncvrbIlrT+bodnaViPuu/apk6+zvW+QuMC5JgjAq1x7En/bnb89j11C+ESR3uEE
	zjnEYFX9W5qwyZFeSQXxMWKokx2ORHIGX7/dFuBgFxPdPBjIPEH6ilmY1bd6CW6116SRvbgNK3X
	PrbmLLIYaqwcIW5zjRiQ3/pmmMGxX7wq7miP7XfIyyjqiqAaMMqAOzgcpum/7iJ2Xve0KJFWMAN
	J+FNl+QKB69H1uOnL7GuYCpjFc+ChAGdUJTphmoftj2czEDOWqRZFovwrMR3nXlooMZVVHkch0i
	wAFGoUrRaVxLvfRmCzqlepodyxWykJdu9S7wGvB6eLd1q5ZyRW1o9ogH38FL0zNw5CSv5FV0/Ui
	Gn6TxPP+Pg9NRd4hWKXDIZpeOgMk=
X-Google-Smtp-Source: AGHT+IE5CxSoPEz79M3b2KsWjJiw0uzjukQ0YP919W2/8RkiUkIdp8+Z/9VGZ+bFdhXZq+DK5qs1xA==
X-Received: by 2002:a05:600c:4ecf:b0:456:24aa:958e with SMTP id 5b1f17b1804b1-45624aa9786mr31613475e9.0.1752567595198;
        Tue, 15 Jul 2025 01:19:55 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:5631:db97:f06d:3c45])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8dc1de0sm14334589f8f.24.2025.07.15.01.19.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 01:19:54 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 15 Jul 2025 10:19:45 +0200
Subject: [PATCH v2 2/2] gpio: wcove: use new GPIO line value setter
 callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250715-gpiochip-set-rv-gpio-remaining-v2-2-072b4cf06330@linaro.org>
References: <20250715-gpiochip-set-rv-gpio-remaining-v2-0-072b4cf06330@linaro.org>
In-Reply-To: <20250715-gpiochip-set-rv-gpio-remaining-v2-0-072b4cf06330@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, 
 Andy Shevchenko <andy@kernel.org>, 
 Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, 
 Srinivas Neeli <srinivas.neeli@amd.com>, 
 Michal Simek <michal.simek@amd.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com, linux-arm-kernel@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1715;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=z2UHcP7yBHuV8GRZRJsQoBcY/v7e8il86W/BXroX7Y0=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBodg8nFBlshsE7nY3S8PAEF/CXu7BeLsjIPJYtb
 4REQY135GOJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaHYPJwAKCRARpy6gFHHX
 ckkED/9pBgqbllDUrAo09NJa8jA5HnKqg4PGJgMgpdgJJvmOgF+LHMgHEtnWdtTUXATKzuUNQtI
 Mj1bDWKIKcJffkdYnkFTJ4zgmK6I9gJAWMH8+sILozHX/EMsRnnLhcEcXJOcLHOo+BNpAIJ/t5+
 KpSQwT2/Q/FzsvjDTBo65Ys33ferUWzNggsXT6DWIhDLTCNKS7pImS8ovYnE7nBuN2TVytI6kte
 CtUV/BSzebhvKPQ6Fof3639P+uP+/yd88jMEn6KLTPltAizbBO/WssixIFuCSl5csX1qQR1U5Us
 8Ch6GvvOl/9tie0kmAGtWtUnJevLiVIZ9/CWp4miMEFzEcAlGDxvbHIre3DN3/60gs/Ub2se21g
 qro4ppYi3ZOgI8zS861hV0MvNqRTro+9TWqt5Dou2raa8pPmdXryQKFZygBkL9r3QDgGBCwYATj
 bmdT6/4IAUKQkK++zSvPiOItckNebbinKD/z2m9jPwMXCrRm2sf6HtUQ+XDWba16AkFFNXStz3u
 fnrHD+sF5NJXj8wBk36FUEa8OCHxxaEL/+KG0v/+e6s9odmOkN8NAJW/EMwZ5buiHGpsMYqhTpc
 y2PuwGRtEolF7gYNUznK3gizd/dC0tpE5g5vtl5fyAR5uEHfpEXEJboOQEI7dgA4hRmRLKtbN/4
 4vw4SgCt4dkDX2g==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_011956_884564_CF561C08 
X-CRM114-Status: GOOD (  13.45  )
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

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Reviewed-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Reviewed-by: Andy Shevchenko <andy@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-wcove.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-wcove.c b/drivers/gpio/gpio-wcove.c
index 816fb8d113e66b27070f286755f3192b2a8f8512..f7df3d5fc71c17fcd1050afdad4187d69dc99012 100644
--- a/drivers/gpio/gpio-wcove.c
+++ b/drivers/gpio/gpio-wcove.c
@@ -200,15 +200,15 @@ static int wcove_gpio_get(struct gpio_chip *chip, unsigned int gpio)
 	return val & 0x1;
 }
 
-static void wcove_gpio_set(struct gpio_chip *chip, unsigned int gpio, int value)
+static int wcove_gpio_set(struct gpio_chip *chip, unsigned int gpio, int value)
 {
 	struct wcove_gpio *wg = gpiochip_get_data(chip);
 	int reg = to_reg(gpio, CTRL_OUT);
 
 	if (reg < 0)
-		return;
+		return 0;
 
-	regmap_assign_bits(wg->regmap, reg, 1, value);
+	return regmap_assign_bits(wg->regmap, reg, 1, value);
 }
 
 static int wcove_gpio_set_config(struct gpio_chip *chip, unsigned int gpio,
@@ -439,7 +439,7 @@ static int wcove_gpio_probe(struct platform_device *pdev)
 	wg->chip.direction_output = wcove_gpio_dir_out;
 	wg->chip.get_direction = wcove_gpio_get_direction;
 	wg->chip.get = wcove_gpio_get;
-	wg->chip.set = wcove_gpio_set;
+	wg->chip.set_rv = wcove_gpio_set;
 	wg->chip.set_config = wcove_gpio_set_config;
 	wg->chip.base = -1;
 	wg->chip.ngpio = WCOVE_VGPIO_NUM;

-- 
2.48.1


