Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70A73C282CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 13:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N2T+qUj1+rhYU/lDMmm7CtWMW53IZ3sreca30Qhdgoo=; b=MjBi+jZ7EgQ4QNi4g0w11VXN8G
	E9GnS5fSrkVzPrgb0xPzMdNe6WEC5ZHaAyM+ogUM/4nnVbTUmSzkhtwXpCpXpKuPq4GHTon9+TtBb
	D23YDA4uKsZsoV8xX/Nts9uvBboLTtRk0gQC2p4+R/bXRgl+d6qs8AsAkF+fcCrIQKoPiSzzxMaeC
	KREIQClYT4Bf9eJ9k7UrSIEimLLu3OQGLFMD7TAjIzuRgtO/U0iW8311WA6m86oxygD6YBWYFb2Jc
	9pM9usGLzH7KcEKcQUZy5MR/YeuTYpOCwdWxVW+Pf+uBH5k0OhEUjHDWQEQ3nVMK33hN8lCRSGvgt
	vkTCKufg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp64W-00000000y2L-2hVq;
	Mon, 03 Mar 2025 13:43:04 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp5h7-00000000sci-40UQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 13:18:55 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-439950a45daso27922865e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Mar 2025 05:18:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1741007932; x=1741612732; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N2T+qUj1+rhYU/lDMmm7CtWMW53IZ3sreca30Qhdgoo=;
        b=2rOvlRhiDG+KNHFNSXw3z/m7ad7FvNfyU1mlYpxrLZ0Q44+cShpP2UvehsN4j2haR2
         DqN5VLtZjJI91mxnEyZus8o6fB2cV0prOOpzjCOamU+pdjmu8wqwVQaOUJSKdY9uCJMj
         wLyZliYp6aB22wXN7DOlfI/U/Uc+S04sEVr1MYPHb3jTGcrC6i2HTS43swNZG2my3syD
         9f57XSh4GlOn6yboI7Vpa1VQFOGqftE/EICmi6RTLnGjCO1iBCvWXrM4+XWDv70vdF6A
         wFEEWPTgRNyLXwaHtGjnv1G9HXMlkfIpa6y/M4nllnhQWyFR52wXoRuM5X5iQiVX6sgu
         LA3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741007932; x=1741612732;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N2T+qUj1+rhYU/lDMmm7CtWMW53IZ3sreca30Qhdgoo=;
        b=F5pDybRKEuBTp/pnC7JoY5hoFEq6Unc9kl2RLSMCj/fbmi4u1l9TNXHXkv41K7pK/q
         PyxWwmlz3u9R/jcoSvCwtIqI3ae7hz8loe06xBtohJ7Wv1YmTdIMOfgFIDYAJxqOq4X4
         7dTolvi4Yqw/SLZBwnVpoWY9WelVvyUrPC+XF5BkwetXsh+43GszYY0OOI2lhL0uH4Bb
         jWLEYW2uroGnUqKXBdUcElObmvmko9BMfUF7hPAw5fY06lQPETHJEEnqVm9jU58KyEbT
         vqoJL1zoJS9bLIlxIluqUhhKIiWhyb7nJ9h88ekghaWT4I/wgITKLLvFBkHrg8rwGoKU
         Pm+g==
X-Forwarded-Encrypted: i=1; AJvYcCUXNHV7N5pn4f1YV/yq16HqAxLDM9lkwuf0UeFzs19wLbmm3uuq6aD5cLZbK25HRWR2M8FGYG6CsJe7K7nLPVIP@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5cu6+5z6VQ0ja+/JQSNNMyDZNZexLI+qi/nkXbg1N7++QQ6B/
	ptusfkgrgYir4O25zzCb3q6XBqc1qIx1/UNPJ5YASHDbaSRu02oI/h5qc4OCtflSX2bRVRb7HPI
	7
X-Gm-Gg: ASbGnct89aSwgt1Sl2x4G5eLGvC0EfjFvWvVSrrA4gS2/L7vQOONu5sO39wbjlmh/Ap
	tI0hXRiWut4tApyIQ3/TAR2gncpvodfWInwARAAbqHoTuewuHQeRv0fYKs6hRhVPTFy1mhUH0Zv
	J+W8LTDhqUPWs0g2jXH2asr1GTBa2BtWkXQTeof70blyyHkIiy8GmRvC4b0T9QX9aRK2wx20Suf
	mp/REGSx0z/FJ641I/hcIArtjLwxBXSuZRmILW2kHnocuY97jmRyZHTONIQ1Ia7pfkttiDJr+3y
	1JkuedGysO/sRcwoyBe5j9ur0UHHVJEVaBg6lw==
X-Google-Smtp-Source: AGHT+IHrsk8va2f9jUFz0ftD8VEqOjTpXEeQwyIxP0GRFd+ut72EYxcmyfAXXHA/8ZZERm1Ku2/BTQ==
X-Received: by 2002:a05:600c:4595:b0:439:955d:c4e2 with SMTP id 5b1f17b1804b1-43ba66f9f99mr109740985e9.13.1741007932175;
        Mon, 03 Mar 2025 05:18:52 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:664a:9e92:6aa8:6007])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43aba538b9fsm194821915e9.17.2025.03.03.05.18.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 05:18:51 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 03 Mar 2025 14:18:38 +0100
Subject: [PATCH 13/15] gpio: aspeed: use new line value setter callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250303-gpiochip-set-conversion-v1-13-1d5cceeebf8b@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1579;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=LYFIGRtuwl4aJkBrIp7QZ91bKDFoO6rlmaJc/Y3YEoE=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBnxaws9K4avm5a3/nXOZWmIQcBvBwL1Vb6W/sh9
 OznmQXSmESJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ8WsLAAKCRARpy6gFHHX
 chT8EADTj6ZZXdeJj6Iyu1AzAb4IyTbPKUbO8J/z8nzq3PyDc5bnoj4WHzueOKKmjcxZKh/WYoI
 FFA/pLjrW+4GZKcD9eBnMz4mRz8lpCmTpcNAFjkQQHqmQULsLzb+wtCk9oR1vgC13G+/mWED0EC
 pTlhcx4vALIKG+WXXE9jWt7TlQvoM0lE0PXKW30/ll3nG7gFQOS7PA4eNP9PgMrlv7jX0HurDoi
 KbgabP3JdgvBY1MD2E4m+O3cRHM98gJTDS5qKQEvlC3GzHeppaYDJDPd03NBaAwPtLZ7as52saM
 +vGxlehYqbNPl92p66PzhTnKVa2rmQy/9MnGUrxoDJFuLkLi4S8CkMbqZRu+qy+yt9tpeIzFUL1
 eXoBzY9hs+kO9qq0cPab32Cs4kvJ0pj6cgWnTlXqwbpk8isnBLDd5Dvy8O5E4y6zlGSWa5qiTC3
 MBRxF/68eGz1AeVeDcCuH4xz9FZd0EGTeNoH4nuC5S8kVMwn6hD1lD+nCEs3Y52xMNLU6PHLk5F
 5lCN56djX30Hd2YWYLdCvEYrZzprzHncFQgl6CmHJcvnFt4Ln7gVNj1zjO5eY9ZRw9z0JHHY6F3
 GUnF5ZKdktPzZ+VnH9pYOOyEqrPpcBmkG24xaMnAg+8iGk6JJVKLigkXXE4Q6aQOsSnvnLWmH32
 7R+I4hEhoMhBI9g==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_051854_006639_54F760A9 
X-CRM114-Status: GOOD (  13.51  )
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
 drivers/gpio/gpio-aspeed.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-aspeed.c b/drivers/gpio/gpio-aspeed.c
index e2535aad1026..2d340a343a17 100644
--- a/drivers/gpio/gpio-aspeed.c
+++ b/drivers/gpio/gpio-aspeed.c
@@ -424,8 +424,7 @@ static void __aspeed_gpio_set(struct gpio_chip *gc, unsigned int offset,
 	gpio->config->llops->reg_bit_get(gpio, offset, reg_val);
 }
 
-static void aspeed_gpio_set(struct gpio_chip *gc, unsigned int offset,
-			    int val)
+static int aspeed_gpio_set(struct gpio_chip *gc, unsigned int offset, int val)
 {
 	struct aspeed_gpio *gpio = gpiochip_get_data(gc);
 	bool copro = false;
@@ -438,6 +437,8 @@ static void aspeed_gpio_set(struct gpio_chip *gc, unsigned int offset,
 
 	if (copro)
 		aspeed_gpio_copro_release(gpio, offset);
+
+	return 0;
 }
 
 static int aspeed_gpio_dir_in(struct gpio_chip *gc, unsigned int offset)
@@ -1351,7 +1352,7 @@ static int aspeed_gpio_probe(struct platform_device *pdev)
 	gpio->chip.request = aspeed_gpio_request;
 	gpio->chip.free = aspeed_gpio_free;
 	gpio->chip.get = aspeed_gpio_get;
-	gpio->chip.set = aspeed_gpio_set;
+	gpio->chip.set_rv = aspeed_gpio_set;
 	gpio->chip.set_config = aspeed_gpio_set_config;
 	gpio->chip.label = dev_name(&pdev->dev);
 	gpio->chip.base = -1;

-- 
2.45.2


