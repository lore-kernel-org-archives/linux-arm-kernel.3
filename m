Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1E30C3ABAC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 10:01:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RViy5sXSyCVllDQ7MtbJFUrGShqaZa6Mlg+17kGovwY=; b=vyGBOdscbDAUbau6ZiKGCS7CkX
	GMqZ+2A2a9nHrgaRjsC3JKXeaXBLZTRuQ/nQbARHS86SWYyzPyFy3GJvjQMGdinHhlCfotAg2iEhn
	+BxBn5GxMA7N79OblBDHLpQywFYUJ0BsVRIX1TH85NM6wnbwa/+auWXRHmxw+lCTmWZLnzdjKquC0
	5Le7EFwOS7GFFaBqJs2rU5MZTNTzrU2vGJkNb5KzeK7O3rTHRxcwdk5dLNIPnYW/mnGHHYx3Tsrvp
	VYJxbrF9abHsCqSla+IkUliMGwJCbmZkdo5NRKlvdff0nGOkb26itnbC6BN6ESC1vfi9OyrJiyP6l
	X6yLE+hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCF7B-0000000BUoN-1GZc;
	Tue, 06 May 2025 10:01:29 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCEBg-0000000BFyb-0YSb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 09:02:05 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-43d07ca6a80so20873525e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 May 2025 02:02:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1746522122; x=1747126922; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RViy5sXSyCVllDQ7MtbJFUrGShqaZa6Mlg+17kGovwY=;
        b=EQIMNkjJXKGEhI2Kurkqr52X/wT5HzEG6gjjDu2HfaXLxqmCqH7mw/PXR1CDwpD3a2
         6nrB6NA0xqoEMFDBM+CzDy+pLy5EBsDFRRvj1XrsVTZOulCHXVcbiWgGxXjMmA/Cu1bz
         kMdKAEA8irMVuC3RxaNHb2fwzdoNbT3EHlwufp/7zNUtNC/6A/fxA4DTgqnYOOQpnpa5
         mrQX50UUqGnVydPKbDsMEhwBTn/CtXRQhZLZERiPYzHeSvf6UZZ7UONqekXhI+LgVy8w
         kH1Z+5Ly1s4qklswg6OtR4OYLWlJr/F84EGxbC/nulqyMLdcOn99KZSfcTev6lvmkUMB
         t3FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746522122; x=1747126922;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RViy5sXSyCVllDQ7MtbJFUrGShqaZa6Mlg+17kGovwY=;
        b=hdWKAOd4qYCkS/oNiD52DDTVNeJNM/5nsixN1VfTOOq9gbk03qelVjwX2pT4rJnYlK
         n81g3c6mFtoYauJzYFuVv7iTvlMlTTphlI7LNYhDvkDDbX42bvioIvEogkjvgFvzbH7b
         lN9nm/V9N5qisVmJEwBSBgd+k3RdUd3KbOkKRhenJL6UjKiSd9O13DCIYH41pbz/IpM7
         QuHsYnAsx5PuZjYSFAIHRjRNHUvM1F1jkeGx0vfKyb2dX2NnlcPkkWWqEdxWwG0+2lqP
         R21yPiApLyKXBSMHDhmT4G+N7MMkSdwh/+fqaUSMFM6E+ziVRZrL/P8oNbDgPXcZFQuo
         3Glg==
X-Forwarded-Encrypted: i=1; AJvYcCXXByJZFR+qt9dKwhBLTdVe4lckJND6+t67b1pTlZfQ5BW7Z4CQvzwz9vcpwiI+3GRXjeH2vYYeznKbgCbAsNr2@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2vdvkQdloNXAhIGgYHqeW5wpVP27pLKJpJ1lEfTdcw5u2nDRJ
	gYnl9QTAxP8rHzwhQ5thatytRql86gQulOhO2vyHAwkkVSU8kPwCXUE9ikRUcdQ=
X-Gm-Gg: ASbGncusFFxNnmITHaf6bjw8uEaD5Wz8t68cJqA3XWCitAZfPpEp8S81RwanRQ+98LL
	HUixIeBjrBTopTEPLKw92SeDAmS+MXhj7mEg6oKTCosMuvf+iR4ZGdALbPSrOqAavlkA0qcnPPt
	FzEUO2tq1XNdySh9oR+0ZsDC8zoAf0NIrhADPRkvm0OQtzAhiK0LYwtxN8zHQC/MKlwq4bvmhZQ
	SzeWrDdD9V8OMXtp5vXIbnLfuzG4uaYjh18dzeGtr33YqL6Yko6Akd3LiqbjQiJd1y897T0LC+2
	jDS7NmN926GOkrLR6CEssPzMczIc8hJALcE=
X-Google-Smtp-Source: AGHT+IGdutjQDLWY4nxQmqNnyyXxS0dNKsu0ias92lCYMh/g/yYLkvUyWFqlVczz1tB/yWiChJXrVg==
X-Received: by 2002:a05:600c:1c9b:b0:440:54ef:dfdc with SMTP id 5b1f17b1804b1-441d04fe785mr18148395e9.8.1746522122499;
        Tue, 06 May 2025 02:02:02 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:bfd0:3ad7:fd8a:fe95])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441bc83d471sm138125725e9.26.2025.05.06.02.02.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 02:02:02 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 06 May 2025 11:01:52 +0200
Subject: [PATCH 09/12] gpio: max77620: use new GPIO line value setter
 callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250506-gpiochip-set-rv-gpio-part3-v1-9-0fbdea5a9667@linaro.org>
References: <20250506-gpiochip-set-rv-gpio-part3-v1-0-0fbdea5a9667@linaro.org>
In-Reply-To: <20250506-gpiochip-set-rv-gpio-part3-v1-0-0fbdea5a9667@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Vladimir Zapolskiy <vz@mleia.com>, 
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Andy Shevchenko <andy@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org, 
 patches@opensource.cirrus.com, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1910;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=N25xpJo8Wn4hKIWS80X1OeMM9GyN+r2jXu3hvoWtCc0=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoGc//2ujX9nyCkowWcEn/X2y1T3zJBYnvdxiIf
 DI/74eJ1XSJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaBnP/wAKCRARpy6gFHHX
 cglrD/9d2BqfRFTo/ZvbXdSOrxA5s7AwPuYI4BfypgQhHVodS2YDBzc38ssqw2XFiZLwZWBz3H1
 yT5wAUAQQWE5s9wPYMUmf1RoawcD7o1WoJQHOR8SBDCgNxqt6AAw5p3Upal0icQAj1onotwcC42
 oNnVxsffJn0EcIybOmVUS3TyWy//M9EPvurNHwQ1vHB57HsRCTqVyhlAVuSKDpPsUVQgJArFX/I
 24hJt5bDP3QjFBrYQdhuHUdaAT7Mebw5Pf8e2tAfjCmsWaVwl0B7Q/0lx+ER809GOfvtwmlr6dr
 e8+bhQwIDDfkfDahHnGbsvEpeFgNvweIilQIyD9TWa6E0gO9dF4Wt3MZBAbTlAXXLDIt9zvBDiV
 FHzaje/uSGCjxE9b56QumVVPfB/u60CwCfAGv30O1Ftc8Nlm+t7vPOHzSuCLvIwVIq0uBgCdXTx
 6vSsM1FOpiW8Wpxh1AVdHMAWNGJjhOMCjA9P/qc9UixgIihxDtU8XCvCGxjWNUkc3ozxh6LzXGz
 tRO2yeelJaxSePVRjF+pIuA7t4GLAlbuH7QCABaWhi9/cQI2fv557qemD5P1yTrLqvVyKzQP6fq
 lYkOBAWGLMIM+8AHGQ+5CXXpTGrzzE5LP/N0ABm64t1B3Uzn5AJ0cpN5WBiA5KuY61hBME/RAxd
 hntlJwr9tShuI5g==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_020204_176468_A8DF170F 
X-CRM114-Status: GOOD (  13.39  )
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

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-max77620.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/gpio/gpio-max77620.c b/drivers/gpio/gpio-max77620.c
index 8c2a5609161fd..af7af8e40afe4 100644
--- a/drivers/gpio/gpio-max77620.c
+++ b/drivers/gpio/gpio-max77620.c
@@ -223,20 +223,17 @@ static int max77620_gpio_set_debounce(struct max77620_gpio *mgpio,
 	return ret;
 }
 
-static void max77620_gpio_set(struct gpio_chip *gc, unsigned int offset,
-			      int value)
+static int max77620_gpio_set(struct gpio_chip *gc, unsigned int offset,
+			     int value)
 {
 	struct max77620_gpio *mgpio = gpiochip_get_data(gc);
 	u8 val;
-	int ret;
 
 	val = (value) ? MAX77620_CNFG_GPIO_OUTPUT_VAL_HIGH :
 				MAX77620_CNFG_GPIO_OUTPUT_VAL_LOW;
 
-	ret = regmap_update_bits(mgpio->rmap, GPIO_REG_ADDR(offset),
-				 MAX77620_CNFG_GPIO_OUTPUT_VAL_MASK, val);
-	if (ret < 0)
-		dev_err(mgpio->dev, "CNFG_GPIO_OUT update failed: %d\n", ret);
+	return regmap_update_bits(mgpio->rmap, GPIO_REG_ADDR(offset),
+				  MAX77620_CNFG_GPIO_OUTPUT_VAL_MASK, val);
 }
 
 static int max77620_gpio_set_config(struct gpio_chip *gc, unsigned int offset,
@@ -314,7 +311,7 @@ static int max77620_gpio_probe(struct platform_device *pdev)
 	mgpio->gpio_chip.direction_input = max77620_gpio_dir_input;
 	mgpio->gpio_chip.get = max77620_gpio_get;
 	mgpio->gpio_chip.direction_output = max77620_gpio_dir_output;
-	mgpio->gpio_chip.set = max77620_gpio_set;
+	mgpio->gpio_chip.set_rv = max77620_gpio_set;
 	mgpio->gpio_chip.set_config = max77620_gpio_set_config;
 	mgpio->gpio_chip.ngpio = MAX77620_GPIO_NR;
 	mgpio->gpio_chip.can_sleep = 1;

-- 
2.45.2


