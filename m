Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E393C282CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 13:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/r0MuZTH6RnCwiU0BqdZFY1e9Cm3LvOPjQ1muaLpSVA=; b=ZbmbpaLmgnPfvtbaMi2bDm833A
	fig3DbW5/U5ODDLycyzbtb2e6NuJrQXZ5xeeLE/lG/u8ibwGvpaFGfkKaqEcQ/ymyI21SOSqxL/+G
	EOQbE+OFK5v8rjDYNZFsVkST8ElzkOQ7N82hGhoXJVDd3WyVFlJo8TCYuVhJHcP8q1o1NVrWp+Gkm
	plgiGIkOWE662bUVbrz6GU6rsA0MbBUBayfBbWF10pczFt+UC+qTfGRq/d8If6vQ9Y/gERMZJcoPQ
	Bf0T60Ify4nE+GflefaI35TGL1dVj7vsNq8EjZq73JilIBsQi2CemEWjcZKxS1z0KQwMgYBRe6Wqe
	Rw7dg1Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp5wo-00000000wPH-0XWO;
	Mon, 03 Mar 2025 13:35:06 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp5h1-00000000sZy-2tg8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 13:18:48 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-43690d4605dso28099155e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Mar 2025 05:18:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1741007926; x=1741612726; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/r0MuZTH6RnCwiU0BqdZFY1e9Cm3LvOPjQ1muaLpSVA=;
        b=EUgs8ZZtuq0fdEoeyY7XeQODCuqejya2DEcbx1IhdtEjd0/M7IeBGNcGfMTG16fP88
         4BiH4m0Yha0Y+LheT2tl7cPO6Lefc+wRWk0BUxZLYUuJmAJdWMaAGLrdz0yo6SFpCtmv
         tphQuPqdKr4dRBeMwRbQMeiipJaL2JqzzC5rLpGcyc5maCYXwnmq9+CYMvFCC708N0Fj
         wrviVakK2qiTuFSpfxghAvcZBNuES74356RHLW8YvqJRTIOQ2qlpeCpHAqPmKKFxWOya
         SuMLWQhz/XKbPYvblyExI1hnc6GxJh3BHHnpaxb6bi+5aEaFPKuiuyay0JcxyXqFXun6
         i4OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741007926; x=1741612726;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/r0MuZTH6RnCwiU0BqdZFY1e9Cm3LvOPjQ1muaLpSVA=;
        b=FLnOHr+c6jB188jJtg9EvQkMGYPFopbVcWJziXEOOEFkV+GAqYzkXon4RPoM17UAYw
         mactUsyNHDGSY46hKsdDYEmd5LCUCt+c7CDilBsZJysxPgXSBKyQc6aBulist7Adv4Xi
         uzpdUPDtRER/DbrXfMYQPArbzfNZaYzEGE0ow0wBmBAN3YnO/FhsUCMAIMg+LRJjE8/J
         NBtYti6JjGr1t9l05GKVWx3yVVqBg+wBkttkatKXv/DyzkMSsPY9dGxbLlIAHzeH50z8
         nfw9/idVbLW8tGVfWDf3ykxhyO8ntQ8NO2aXcZsOkxkWK2k3YXUjjw6M5PPHdYeR4RiD
         KzMA==
X-Forwarded-Encrypted: i=1; AJvYcCWbHoXEE4Z2EcbQUp/Aej+WLlWTpWszvV1aG8ClV8qkpu5PQPOQV6wcuV4cb/oYrsF4TyCkLj8nFbEoM3HtJW2a@lists.infradead.org
X-Gm-Message-State: AOJu0Yzgf2evzt+zVebY5gg+iA9rPB6sy7NadZGywVcFwvjN7PYszaCW
	pVqM8h+tosUE1tDeCleMxyT4kSP7nilS7kEjS7bCPQerNr8qh8GkbrM82czmLvM=
X-Gm-Gg: ASbGncvHUBt8wbGBebUnBRe5hCu/Sn7oEIxee8a8B/hOEpytxRO7XrD8TlUUMnvp0Y6
	3W4TLxR7dhHiOVJPSu2AwNVuOPE4I3RWVNMn9NIbUnX4bZezx3yfz/kpVVfnQhoI9XHWPIjFojP
	efbw5fw5PQ6B6Ila+CrGmTmL5WxKZO7JkHXGK7ZsSmEpiQw2HVSuM93obZQj0p9A4eupj142weS
	58mUesyi7RTFedeGxfFn1x8aaaTKUY4LsOMeYimB2fl499mDxB4iNiXGMEUHg7RJRpZpcyIlEdH
	UDXMJHrdGYssZuZx6YBeEYnaB4AW5U7dp9lalQ==
X-Google-Smtp-Source: AGHT+IHm6EaYBn70SJkUBa0sIwAoFeDNkswqub4neNrYccFomXUwUOGpuKJlkXEU0LDo4dNArOpzqQ==
X-Received: by 2002:a05:600c:3ba9:b0:439:9828:c425 with SMTP id 5b1f17b1804b1-43ba66e0a61mr112280175e9.7.1741007926409;
        Mon, 03 Mar 2025 05:18:46 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:664a:9e92:6aa8:6007])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43aba538b9fsm194821915e9.17.2025.03.03.05.18.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 05:18:45 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 03 Mar 2025 14:18:33 +0100
Subject: [PATCH 08/15] gpio: altera: use new line value setter callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250303-gpiochip-set-conversion-v1-8-1d5cceeebf8b@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1725;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=SMOq2xgstETx1JyBNH5vYamCTElxv0DKa/FsWx+nPds=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBnxawrqlWF7E8xNzhaiQDDre2OcEVZwl9/RTexY
 M26Lfz22DaJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ8WsKwAKCRARpy6gFHHX
 cmqwD/4phcgUzCpl6mKnD/IdnZIH9RNk3LmcqASY0VFf4EbXRAfUJVTaMQeDgSgk24dtEjEosuC
 bpBw1QzXfAFamKZKIQDyNKjXPzE/Hoe1EDCF34rZuNHNHPI0UBjmxJ1HQiXsaiOvcp6YuN90LqU
 IruTx8dSh8NomvJYZNovzKeon6/LRWzKlWb+uZYczW7uUFTXZL+T5oLS7DO99kqZsTCTfVU6Ul0
 3OFRD6NQ0Ihy9l2k1V7lqCDuH+qJyDeuUNq2LtUBuuX+2I8AY3ESBJp2i+MBGELCLWfwR6b1xxT
 LeM5r6nSFUOHN/2f46OZqPlXo+/06oFEI5JqVGow8tZdNrM6mq6cPa5erpnMrWDBhkLZOUeMhCt
 DWHujIwH4kTX+GRjsbuNjNbgHqGEDhX4l7xuIqaQFgkjS5/dRaSQ62lfMxG5PRYtYAOb417XaMv
 6t9tvs9wnV8Sijw4pvvP23BSDop9+n7LfOH20zHB8z38ZXbJcRKZJoWG+Brj5qdvrQmskwcQC0u
 MK94saNiUr6TGH1b7JaI0RM1SXCnT+wdiP5hdJBrPc9ZvTC7wVF5ruvBjzyMXjf9DAdh/hou8W1
 S4LR1Rq4rbXXTZk3VddxFwUqAmWQKWmlpqvYKvAjKmoq6Au2FAByQj/JHUPyd3iJAIjpfvDLzrN
 e1HgWPF2h6MAoxw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_051847_739010_F3F830C4 
X-CRM114-Status: GOOD (  13.38  )
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
 drivers/gpio/gpio-altera.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-altera.c b/drivers/gpio/gpio-altera.c
index 17ab039c7413..1b28525726d7 100644
--- a/drivers/gpio/gpio-altera.c
+++ b/drivers/gpio/gpio-altera.c
@@ -113,7 +113,7 @@ static int altera_gpio_get(struct gpio_chip *gc, unsigned offset)
 	return !!(readl(altera_gc->regs + ALTERA_GPIO_DATA) & BIT(offset));
 }
 
-static void altera_gpio_set(struct gpio_chip *gc, unsigned offset, int value)
+static int altera_gpio_set(struct gpio_chip *gc, unsigned int offset, int value)
 {
 	struct altera_gpio_chip *altera_gc = gpiochip_get_data(gc);
 	unsigned long flags;
@@ -127,6 +127,8 @@ static void altera_gpio_set(struct gpio_chip *gc, unsigned offset, int value)
 		data_reg &= ~BIT(offset);
 	writel(data_reg, altera_gc->regs + ALTERA_GPIO_DATA);
 	raw_spin_unlock_irqrestore(&altera_gc->gpio_lock, flags);
+
+	return 0;
 }
 
 static int altera_gpio_direction_input(struct gpio_chip *gc, unsigned offset)
@@ -257,7 +259,7 @@ static int altera_gpio_probe(struct platform_device *pdev)
 	altera_gc->gc.direction_input	= altera_gpio_direction_input;
 	altera_gc->gc.direction_output	= altera_gpio_direction_output;
 	altera_gc->gc.get		= altera_gpio_get;
-	altera_gc->gc.set		= altera_gpio_set;
+	altera_gc->gc.set_rv		= altera_gpio_set;
 	altera_gc->gc.owner		= THIS_MODULE;
 	altera_gc->gc.parent		= &pdev->dev;
 	altera_gc->gc.base		= -1;

-- 
2.45.2


