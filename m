Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70D48C282CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 13:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qYy3OxmCTfeXmKWW1VbewLs6rP6H3oG1fco894i6r5M=; b=FaKiS+YNaVDKvmkO7grOeJrSew
	9k7YEwc+wmRfA8UEgajqwraM1cPNyRfDuUdVnUxLfPxkZZ4ZYFnn1w3aihe/0ziGSj+LjcR9aXpXf
	rZSjG+EDm1R1HhwJFD3eP421rsv/k6Y4zOEbsU5eqzDrRbvVfgRnaoQoj2Odp+EOOd2YVH1IfMvEE
	SnWa+B33z7xlrMMhTl3awzF4UxnldPlmUXz3Rux0GCKUfOdgfq6vnFcBv81TgFX35mEdtaB8TDzmQ
	xcxC5rl6ofIeYMr+gq7AhYPWJ4/d6UCEqkINAbgRkXzGlx3OePOqR28IT9pMYt0cu9LwhZLyXwYW3
	rB8rATMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp67b-00000000yLV-0O1q;
	Mon, 03 Mar 2025 13:46:15 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp5hB-00000000set-3KRc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 13:18:58 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-43bc31227ecso5381885e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Mar 2025 05:18:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1741007936; x=1741612736; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qYy3OxmCTfeXmKWW1VbewLs6rP6H3oG1fco894i6r5M=;
        b=gDV3EGJidMRvdSjmKba2H89Xv+uLsAXxHExoDFbVlfS3G49Hu3TkEdGwZ0eiStO7Ua
         F0Vl/ugKTlBPcscqX7WkYrW0gr5lYSr9b73d9vV0WqWfNsG5ATIBchxJtqDc78594jvm
         hmTNchVbsU2FzlB2zC9ZocB55JFbQXDJkPOr5Wj2eXNIwkVJcMceNraIqtU9eaybnysQ
         9wiqiRhQQz9ZOnWu/LErvsyh1BKzMD6doEsSEZpCAQP+ka2tKHeJ2bFdVh5o0wp9Enq3
         yvgXmJeth9TVb41FkmdSgLjouq/H9/d7C+AHMGKbsrkynRCOL3TBkGt/5wBy/eeo6NB0
         5cow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741007936; x=1741612736;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qYy3OxmCTfeXmKWW1VbewLs6rP6H3oG1fco894i6r5M=;
        b=JnkbdLdRtrBYZupy1ivDKcrpsJZj3eRgh8CWTEkdDIuZWNFznEpTzKCYfYs+7/uOmv
         8x7GBwrT0+FdGup0+pCB2uA45tuDNXtsikGzK2OKMzXrv2KIHVFCl6nCs9i8rso+hpkC
         D4gRY/7HGvMPVKLN0JikQKGTvg89iwWUYkKC6Tvxyod8yhJwI0rXUPPRELKEd+Xnt05r
         nUK4tM5vE1PZfdPu6qCzWkc7m1JNRST6KvE2b+Xa074uAzaHkIt+DWFrQHID82z3eGjN
         pAw5ekFvY0goEHEmmx0YvfcGsGWehI2yZqL52kqR7dPrOwLhtwjMMPGj8PNwiBz4vZnn
         vabw==
X-Forwarded-Encrypted: i=1; AJvYcCU3wXiPwOuqu9ELjdKwy7bTVJu+hUwQFXXdAa2UXJ11BF3niyiojRCCK2EswaGqqqjWuVP9c4LrvP5Q+CCjFw+0@lists.infradead.org
X-Gm-Message-State: AOJu0YwmeBOcPQXu2pT+bOZvtEaUJ0/lsxTmrKbwpsEqsCCiEA6e/k9s
	SXOWBNTtwSxhSX7cDAt53W/4I44d5Gl0Lhi9qqjGX4+gGZWq6/FNmHZWlcfnai8=
X-Gm-Gg: ASbGnctRplt57gax2gq/Gi7pZdegn73a72qvImUeOcB0KBuuFXohtSaOkCw+mtWlTBN
	pVO0pPhFu7XGaYVphXlgO45cQuTB/PUYm9CRQDqWO6ucFAKb2f0DiwTNDZvWXrxZ8Q5PoRtqYZU
	uz1LuO8eY6PcDQVDZW8okj+I6F5u7KHk6i2sX3T4KWzE7HrIC9JATYLsaJfMcEb0IbY5fRqnqXK
	coIv5u7kmUcRdtMLIZwL7vMmxFIZmGOd3BRmx9qNP35N0N5oY6+jN/s5JyNKsNeYd7ZGloL8NgI
	ojJJCDk+p+7rCumuv6yZUCjsgzAiLYNYqpTeZQ==
X-Google-Smtp-Source: AGHT+IGrzVhEnfUuDCVxi9rV1+Y2pAX00HYe4ND5tnilxpFNSHjqZm+Q1tO//4HTCcPKf55lo23WTw==
X-Received: by 2002:a05:600c:4ed4:b0:439:98ca:e3a4 with SMTP id 5b1f17b1804b1-43ba67475aamr98841885e9.19.1741007934650;
        Mon, 03 Mar 2025 05:18:54 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:664a:9e92:6aa8:6007])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43aba538b9fsm194821915e9.17.2025.03.03.05.18.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 05:18:53 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 03 Mar 2025 14:18:40 +0100
Subject: [PATCH 15/15] gpio: aspeed-sgpio: use new line value setter
 callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250303-gpiochip-set-conversion-v1-15-1d5cceeebf8b@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1486;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=o1RQkjcxzC+TGloaGMTPuFJzidyh+RPMXxMLz3aV4DI=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBnxaws57keqtznwsHgFtxTpm4rRaKKUe8Z3RX1S
 ld6SfCwJGCJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ8WsLAAKCRARpy6gFHHX
 ckXIEADQhVFh09Iq4tEU1jISNlnEkfP7k1ELSZ2IXMcW2dvNP7VqR81V0ZYPQcclqaZcCttaM/0
 1t5g/NVwoezK7o4qVsmqkqEYmN/nvkOX0UsVySyJw/0dXUPT/CQHlKIC/erIqkDom3R1svtUd31
 J8c4lXQO8LVXCkp4nJAkRYT4Pp8L7ABPoI8raUIP2VV8rjcwdbiVm9WCmlKM4tWAcJUCSL+WNdq
 P08bBozKKrLOq69Uc92O0nJlOwBqmO4bFPrWVqNuqZLcX4lyWblxe8aftcHYJPVLMNkJ/VGuhSd
 scoDcPInDpwb45deB+pQKPmVX+r5jj6vzMfSsD3gtmzzVSbaRkjTrA9B2rqjxRO5+w1AwLup7eD
 dcPbHDmqiZewAlMFEyYu18B6DBXl0+p/kcCHFQHuX+RX7QW5f0TyiwikwKokqYPCvwXVRCDPUUW
 8Ro4zYv2Q4eoLzFPK7GbnD8MQO83Fy90ZIxjT4Hsw21lBZiOmicK28b5uSHvoAziBQurQ/M9+r9
 tMPeMyCpRPfCCwKF4H7RofC7RJGan9UoZtnZ66gpzw7ne2jNJ0rx2YSXzVoxYEwFv+RX2NRP0UD
 SxJc01SMF9zx33J3w0C77IRMrapFhhJcw6Ls1/VbuDECgOkpKtB9qH0Cr/4U9XQuMfQ3uo+w/Gt
 pwY99gL8+uSpR2g==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_051857_839813_D9AE7DE0 
X-CRM114-Status: GOOD (  12.88  )
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
 drivers/gpio/gpio-aspeed-sgpio.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-aspeed-sgpio.c b/drivers/gpio/gpio-aspeed-sgpio.c
index 5ce86de22563..00b31497ecff 100644
--- a/drivers/gpio/gpio-aspeed-sgpio.c
+++ b/drivers/gpio/gpio-aspeed-sgpio.c
@@ -209,13 +209,13 @@ static int sgpio_set_value(struct gpio_chip *gc, unsigned int offset, int val)
 	return 0;
 }
 
-static void aspeed_sgpio_set(struct gpio_chip *gc, unsigned int offset, int val)
+static int aspeed_sgpio_set(struct gpio_chip *gc, unsigned int offset, int val)
 {
 	struct aspeed_sgpio *gpio = gpiochip_get_data(gc);
 
 	guard(raw_spinlock_irqsave)(&gpio->lock);
 
-	sgpio_set_value(gc, offset, val);
+	return sgpio_set_value(gc, offset, val);
 }
 
 static int aspeed_sgpio_dir_in(struct gpio_chip *gc, unsigned int offset)
@@ -596,7 +596,7 @@ static int __init aspeed_sgpio_probe(struct platform_device *pdev)
 	gpio->chip.request = NULL;
 	gpio->chip.free = NULL;
 	gpio->chip.get = aspeed_sgpio_get;
-	gpio->chip.set = aspeed_sgpio_set;
+	gpio->chip.set_rv = aspeed_sgpio_set;
 	gpio->chip.set_config = aspeed_sgpio_set_config;
 	gpio->chip.label = dev_name(&pdev->dev);
 	gpio->chip.base = -1;

-- 
2.45.2


