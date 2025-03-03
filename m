Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AB86C282CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 13:40:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5Axi8YRJzHoLHKP7VK2GqIyJfaSqTW3LqYKFDfDPjWc=; b=4k7SXF3VbUrD9Nj5gU4VrmF5h4
	qQElPYFV1lrJqvy4IwHNWP3Xd2uZtKv7zVb9yWZ+QvRrRFLzs0s1VpRphIXWPFHqyDdYjsopVuWZX
	/qkiHVUHnZKEzlvjHUNVy40Vqn09aJHZO/J3ocs21uf9MQCEukFlccJRB8srEGIlUliA2rQClo1Rm
	w4t3cq3Yyeg88yA9VWqUaOanBVBSI4iNLPGAMZbZra6PAh7FPhzcpJ/UX4qwZG24m3+zMCwz5Yoed
	CnBbOUsu0umLPRIZdF/ZlkkmVIcPnN0bC1ZtvhvqB5oFpotrxSrRuIIwDVgo22/VvsNGDcR8CiaJD
	H9gWpLnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp61R-00000000xUH-0v5c;
	Mon, 03 Mar 2025 13:39:53 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp5h5-00000000sbx-2oVM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 13:18:52 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-43995b907cfso27907265e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Mar 2025 05:18:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1741007930; x=1741612730; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5Axi8YRJzHoLHKP7VK2GqIyJfaSqTW3LqYKFDfDPjWc=;
        b=qWICj+QubDuxUm+75B0RndzFrRK4S8TULRnYVjO8CfutdVzQow7cjfWqvC2CKFgFkk
         OKQSGZuICb+49WKPO1HICPQmbQAZh2I8sXkNSI2YrV55MYu+Bt9AWncu0bpIJmXzegkU
         muDIYF7C+fGa8LJV/oOq8bSFYizuKCgl5FeJWqIYERz0USw3MqgH1ZpKMZI9R5uYxZ+y
         NcYQIaY7kaXyedSZHPWXtPFf3jE/x9fu2CV/YyE+hJYN0pcKY9x6nKcDL27YRzxvITyB
         bpKmd3rO229megWdoqZ5dPo0n/NEyDUVTb4yqEkx9l9ECJfLykZCDbZoDPjVTbnuFmPz
         F0sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741007930; x=1741612730;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5Axi8YRJzHoLHKP7VK2GqIyJfaSqTW3LqYKFDfDPjWc=;
        b=EF9USO98rG2dRaMgwEJR96ajR+/kOmwfEfq+HJ8HJNdbFgGEBHsoFbxjby5nAa0Zj/
         lgMjpvzCZJQgRCYqlKewmgL2EiwyQHQpS6WwlxtloVu6zTBKLwFlSJ5skFyKkua5xm3i
         t0BEhzPXTnV+/3p+zZYNhjyGzwc8MhcyPXprm1CUx3sFUVoozjeFe+HCWi5HAoRFpRd3
         K6iHOEbHUi0KJuVB73xDCoHYnyh8Avkp7BMj1pqEyX+Vo4gw+MyxM83tfhUG9ogbmtdw
         xYh/oYVfZ40ID09MNGpy72zY4tZ7JozvbRjFE1UtC6KpvAlwiSwVOrCLu7a2nWAbFAW7
         Pwvw==
X-Forwarded-Encrypted: i=1; AJvYcCXFAKM67C1xT4tSomv9LNFxU/jR/xlmg+Q5NMxflCaOnZJusbL9ECv9iyL5Q+JgVOPMC9FipoR61+oVL0cDUzGK@lists.infradead.org
X-Gm-Message-State: AOJu0Yzvk/ZgesPuCrw2cgl/jHnMSOzJatqxiiqYAu0wBkHYrRDieTLq
	HXKmkVB0K5e+ZhIMtukRFZnMxpNRyy1n+x0Gziw9lvbAlIitD3AD2+szuVVR1AbYFczt3DCgJFz
	A
X-Gm-Gg: ASbGncsxQTe7nu7jjPZU2NmnKcjqFVi6591d3L24e/hsEHvAGBHUHD7V0nSwJJ3kAe7
	lLjdYlqIoWUTuG5wNM1IF14mH5V7Zk7qZ1Zte0KuH/L7lcZGkq7EDu2GtwW6gce67FqjU9r3JNY
	+Fhq1pjSj28CkjSbB8SSQ8Ig+7oh4PspSCHaC8VUcr4kItQ0vyyIm5gKZ3jtUGdSwobw+AwwC+I
	C4+I3oOaRxB3Hy6aSSRvEqwY95nBHUWM+igfDB0221305T24LIRucQiRpWQ6huhgYHgbmIEYhzU
	VLNnA1LNRpEfHx23hEL8ZFptaDktm4usk9gJkg==
X-Google-Smtp-Source: AGHT+IEYGtm956aiE024ARJ2YI+wm6oMviFmiaVF8KsdIN5Clg89Ip+CqvEtma0/pMlgb+be7pTlmA==
X-Received: by 2002:a05:600c:3ca8:b0:439:84d3:f7ee with SMTP id 5b1f17b1804b1-43ba675d56fmr88856985e9.24.1741007929922;
        Mon, 03 Mar 2025 05:18:49 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:664a:9e92:6aa8:6007])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43aba538b9fsm194821915e9.17.2025.03.03.05.18.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 05:18:49 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 03 Mar 2025 14:18:36 +0100
Subject: [PATCH 11/15] gpio: arizona: use new line value setter callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250303-gpiochip-set-conversion-v1-11-1d5cceeebf8b@linaro.org>
References: <20250303-gpiochip-set-conversion-v1-0-1d5cceeebf8b@linaro.org>
In-Reply-To: <20250303-gpiochip-set-conversion-v1-0-1d5cceeebf8b@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Michael Hennerich <michael.hennerich@analog.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mun Yew Tham <mun.yew.tham@intel.com>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pwm@vger.kernel.org, patches@opensource.cirrus.com, 
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1667;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=/sU8cBlWkrzRnahs8pB2nRSYYvpui0zCRmMzsOLe/tU=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBnxawraFYt3OLPOcsUJTdWtbmDf7jf8fWbJTlqG
 F0x+3X77liJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ8WsKwAKCRARpy6gFHHX
 csaTD/9Lb0FTC8KUiNCwa8U+38+asQjGBBJIpJ4m2oHxZOZqIc4wVOq47KeugpmygKJZbDzH9nY
 VokyB5RQQdWl9/JvjKQkDl3oDwemi0Seq6VX97lRYJ+aTkwO7BQjHHEEVIP3muwuoNhsXDPa579
 7wAsmgYPxunC4nioaY9ezXw4eenqB88jwUU/o3+BqgopQAJ5e8X/2JoxQZSo/xAYurmoqiOY6wd
 p73NKeItCF2pHZyCLxxR6p82URyBidDFAHMLpCd3HfTvKxmRBNm6Ce4obmLcD3HyhPJSLtXiDhZ
 9TADKmuz64mhdRBi2DnAlxh2m0pxFAyAt495sG1RU+RFeiDmoqfTcLETX01ozNEpfQanlH2Hu2g
 srX9bkbJu9VNN5aVa26Uu4H2jn1vnWuc21drG00Uff6xB6M0MhwXu96GWPhbCkTxXPUz4CFlDN5
 rNpsy2TmVoIqAOdK/ikHR8/N+/XlOkpvUZzLEwREHABI/4GLxoLb0lACmmtAamOHcDr0JlPrbhL
 UyNV2+Lmcy1PkrODKfKTXG99i5mDcXnhnbMjTP8DVFB8gyg3nfYwrFUJ2OE98ffd+bZBl6q8Q9m
 C0z8DgLTTNUabyQIJqqEx6wQDenlo2nt/gKTANo0OX/oLyK0VWh4qHPLHtqQY1XJ9zgAioTCALv
 zkNFecD6T7gJS9g==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_051851_715833_8F979D17 
X-CRM114-Status: GOOD (  12.57  )
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
 drivers/gpio/gpio-arizona.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-arizona.c b/drivers/gpio/gpio-arizona.c
index c15fda99120a..e530c94dcce8 100644
--- a/drivers/gpio/gpio-arizona.c
+++ b/drivers/gpio/gpio-arizona.c
@@ -121,7 +121,8 @@ static int arizona_gpio_direction_out(struct gpio_chip *chip,
 				  ARIZONA_GPN_DIR | ARIZONA_GPN_LVL, value);
 }
 
-static void arizona_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
+static int arizona_gpio_set(struct gpio_chip *chip, unsigned int offset,
+			    int value)
 {
 	struct arizona_gpio *arizona_gpio = gpiochip_get_data(chip);
 	struct arizona *arizona = arizona_gpio->arizona;
@@ -129,8 +130,8 @@ static void arizona_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
 	if (value)
 		value = ARIZONA_GPN_LVL;
 
-	regmap_update_bits(arizona->regmap, ARIZONA_GPIO1_CTRL + offset,
-			   ARIZONA_GPN_LVL, value);
+	return regmap_update_bits(arizona->regmap, ARIZONA_GPIO1_CTRL + offset,
+				  ARIZONA_GPN_LVL, value);
 }
 
 static const struct gpio_chip template_chip = {
@@ -139,7 +140,7 @@ static const struct gpio_chip template_chip = {
 	.direction_input	= arizona_gpio_direction_in,
 	.get			= arizona_gpio_get,
 	.direction_output	= arizona_gpio_direction_out,
-	.set			= arizona_gpio_set,
+	.set_rv			= arizona_gpio_set,
 	.can_sleep		= true,
 };
 

-- 
2.45.2


