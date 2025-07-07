Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81C7BC83F07
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 08:54:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0OLMIgUvqZFqepdWJ/QtRpBNQs7JrMTTPQY6qVJ+Q4M=; b=kcBcB3+7vLghnluGDc2iH6U66A
	SQ2GOzpRRRGlZbjktZ0cqBRK08a2o2fAbgKb69QAoqvQhGV8lEjeOQBlI2y/qDhNwoRgjW/eOq47w
	/J+oYGf0CJpKXJXEssTJZbUK6J/0/MMhXWD8iOOtwEIla5Dis75dPZIEzbL0G2T3u7cMbZTOLVYnJ
	sVV3ZMLz5f+2q6mRNU5pxtDCdyS7EJk6l7PZ4YEiXVUyhFL4k0eWot9kHZle4zB2yCnAy/ruZMIqZ
	FZxLe7UOsSsm1xg94Nu5/G4jYQbf3jwqxwlkiTu8xvG9ALU48BTJzBhk0uU+ACO9UxZWIQP9/eghE
	xNd5VBFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYhcM-00000001u0x-3eau;
	Mon, 07 Jul 2025 08:54:30 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYgcV-00000001kMd-16oI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Jul 2025 07:50:36 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4537fdec39fso6949155e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Jul 2025 00:50:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751874634; x=1752479434; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0OLMIgUvqZFqepdWJ/QtRpBNQs7JrMTTPQY6qVJ+Q4M=;
        b=wcLVKVYIuhdHt+vqkLWSAePcutQFzY4Jpggg9NGJic4nDa3PbrH10hRfHXseQ3eW4J
         2RcPQh0jaIBamAW2HPTOymgEFrF/NK5qAfHZloCpWSwsjS8AGjJMMxvRhxnUI9tqolhQ
         5Uiw039wUyES6VJr2AEkHfi7gkPnLlZ3WaI2mLfCMrQ9uRtZ6TBbPIm1jn/RRZ3sFH3L
         cEUJj++SstC5ISNWf9DyxKvL4DuIjz6mvXOrHnl8BeXwSqSP3ShrCN/Y8jiLeFnaPADl
         jhSGG64bcv0yhNVE3XmB6NqA+OZDQGq0dWxbQ5GcQt5dT7IkSAKR878KnPMcXOE7rr/7
         E/Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751874634; x=1752479434;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0OLMIgUvqZFqepdWJ/QtRpBNQs7JrMTTPQY6qVJ+Q4M=;
        b=FBcREUZeyEWdUag6JB+pS2CE7/Oe/CqT1BHvDCMDjg+kKpgPsVULVbilo5CIg6yaPy
         tHauB3AKTd78WvAB6kTT1Thwr1g732ob8tX2RtyXm5W+8jmNuIO6fTX8e1Qoh2B8JzrK
         Eap7taOiUik+ONEBYePP1Q1SvwSwSFuHGKwHoGzmH1gDBpBVMPPFgzXpF3/cWxqBZF/k
         ABtpHveAGLUgZYNanPFlWpH2M8OtHvxRuGL5YSeWcv3/13GDErGklBBCKOtotgeIybyl
         hUf6/+YaICH06BjeqVpUepQtFDVPmTj4IPmmO8+Smc2qHnWfdYKCR5YBxW5cj4oADjAQ
         vjTg==
X-Forwarded-Encrypted: i=1; AJvYcCVYEmSWTGgJzrBDk+JjVk1muuniLny3Fs0JGnUce/KGJTc+kL9HUjEjMjtyl/VzE15W0JxW2EeCov0Dd1zuZ331@lists.infradead.org
X-Gm-Message-State: AOJu0YydmrAEAcpBNlEZwtnfEyWeLIZEZds3kvl7ET0muZBjJSV1uwR5
	ZK6382wv3uTfrwqNn639Usw0V++4SQHocxxF9HtSA/kGxCSJFk8B/o2vpDVbC/AN3/o=
X-Gm-Gg: ASbGncuIDtWbQdUuvlJgaHQGDKFqR1dG1jkZuCoSWv1Wqgdi0dZq+/1zZqJsMO3BtAs
	et3wdPVxMidJKHieRVtRnplZHOiVAJp17Z5iIYoZjp4Cw1gWODy1GReLpC+AAHGDasQnn6HkTTg
	ZZbys8TkFAJs/1gkrPAuebIQQqXSQqKtwu5Ejsl2OKbWHwJinIUyyYYTV0OkTJkV7iJzoWpu2Bc
	OGpmWcqmSuGFiqv8gHOfcxsjc6uvQy38+sakADVUqZGA9Ph142tDs0uQni3yqFyLpeQzdcvoUBm
	JdkesCBYCcCwvwvwfFtmb1/TvL9xurP+nh/jD7LBCxapMcUe2kd6YOjf
X-Google-Smtp-Source: AGHT+IHAOHk+mHfjKvwjgBKOqjbU1RDQFfLqi0h6aJoDwCDCNVP+Dwq37QC+iDaw8oAhBHzhcT+d9A==
X-Received: by 2002:a05:600c:8112:b0:450:cd50:3c64 with SMTP id 5b1f17b1804b1-454b318d3e5mr111532785e9.31.1751874633791;
        Mon, 07 Jul 2025 00:50:33 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:3cf3:a61f:85ed:69db])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454b1893479sm104215455e9.39.2025.07.07.00.50.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 00:50:32 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 07 Jul 2025 09:50:23 +0200
Subject: [PATCH 10/12] gpio: uniphier: use new GPIO line value setter
 callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250707-gpiochip-set-rv-gpio-round4-v1-10-35668aaaf6d2@linaro.org>
References: <20250707-gpiochip-set-rv-gpio-round4-v1-0-35668aaaf6d2@linaro.org>
In-Reply-To: <20250707-gpiochip-set-rv-gpio-round4-v1-0-35668aaaf6d2@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
 Masami Hiramatsu <mhiramat@kernel.org>, Viresh Kumar <vireshk@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux@ew.tq-group.com, linux-arm-kernel@lists.infradead.org, 
 virtualization@lists.linux.dev, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2143;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=dLGEIzbU8TDVZqvGaRCedogmILNsu70J4+DpSpnnX0Y=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoa3w7DjsCQR2AApkPLj5V687Va9TIBTP7+8Nyc
 3+EIfO6ovCJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaGt8OwAKCRARpy6gFHHX
 cg65D/4jQHONt6migIaVd+z868/lBMX+THBOHa21tj8No2H+WWhF+5Be1Z/3NlxIq+iBJqhClYu
 zF2QfhOEam0By8wx8DDsdWR/peIDZ0iHY2nPDIiQa0IaTIZmR3k21TGkb+2h4kFqGnrM/RyH6hC
 4oKyQuqbrrXVH//N8cdoxXQUbGhwKFA/w0DlH0SyKWU9ieKjf4Ux+slf3AyZfGKlzCuYNy4hDVj
 gKPsZ7IOS5JFO4UCI2c2bmsQO+vNJSiwAT0pZh+qsVLjobRjQ3Tep5ZIIae1Xbb/UfG6XJPeGLB
 6gfVK+PbpLUTVN5Cn4PO6BQ6E0ucK7hEkkj/jfvrH+le/UwqLpwGl35UQm3XXcIe//CC3N7Qn3D
 T8t9IsGnh4HC8R3sqqEIlYLW/mtgmIOimCA4FddOLD2Gx7R3KjheKjhFnLru3Pd2WqEw0whmL4S
 gUMK4NFq0Qi2btwKP+1XXXY7iqMsb6LndhZpvNwLNyLh7CDLBcpuaDTb4My05fijnvU7zLp2J3R
 rWsw1aJo6OELmaFqnkRWPl6bdbgtF4q5yILtnCt3uwCcc9tUj7qVbgveDUbrcPPq5V8mwPoRFtR
 rhfhKMmTGfKVy+soETLeA/IhnGSe8nntXedzByb4Ex5QRUEMlST/3BhjdxOjHCvQhAcNOpFLeho
 bOroCph+x4wzenQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_005035_307713_595D8B76 
X-CRM114-Status: GOOD (  13.10  )
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
 drivers/gpio/gpio-uniphier.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-uniphier.c b/drivers/gpio/gpio-uniphier.c
index d738da8718f9cf52286ebf14dd4d0ae60466db2e..8939556f42b60f32dbf7bff315eb5bbb6f062256 100644
--- a/drivers/gpio/gpio-uniphier.c
+++ b/drivers/gpio/gpio-uniphier.c
@@ -138,14 +138,16 @@ static int uniphier_gpio_get(struct gpio_chip *chip, unsigned int offset)
 	return uniphier_gpio_offset_read(chip, offset, UNIPHIER_GPIO_PORT_DATA);
 }
 
-static void uniphier_gpio_set(struct gpio_chip *chip,
-			      unsigned int offset, int val)
+static int uniphier_gpio_set(struct gpio_chip *chip,
+			     unsigned int offset, int val)
 {
 	uniphier_gpio_offset_write(chip, offset, UNIPHIER_GPIO_PORT_DATA, val);
+
+	return 0;
 }
 
-static void uniphier_gpio_set_multiple(struct gpio_chip *chip,
-				       unsigned long *mask, unsigned long *bits)
+static int uniphier_gpio_set_multiple(struct gpio_chip *chip,
+				      unsigned long *mask, unsigned long *bits)
 {
 	unsigned long i, bank, bank_mask, bank_bits;
 
@@ -156,6 +158,8 @@ static void uniphier_gpio_set_multiple(struct gpio_chip *chip,
 		uniphier_gpio_bank_write(chip, bank, UNIPHIER_GPIO_PORT_DATA,
 					 bank_mask, bank_bits);
 	}
+
+	return 0;
 }
 
 static int uniphier_gpio_to_irq(struct gpio_chip *chip, unsigned int offset)
@@ -382,8 +386,8 @@ static int uniphier_gpio_probe(struct platform_device *pdev)
 	chip->direction_input = uniphier_gpio_direction_input;
 	chip->direction_output = uniphier_gpio_direction_output;
 	chip->get = uniphier_gpio_get;
-	chip->set = uniphier_gpio_set;
-	chip->set_multiple = uniphier_gpio_set_multiple;
+	chip->set_rv = uniphier_gpio_set;
+	chip->set_multiple_rv = uniphier_gpio_set_multiple;
 	chip->to_irq = uniphier_gpio_to_irq;
 	chip->base = -1;
 	chip->ngpio = ngpios;

-- 
2.48.1


