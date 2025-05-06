Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BEDAC3ABBF
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 09:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B5xX5xDK1LhTZKmUeFagQY4z7X//bT5WMr4CQHakD5w=; b=0vVLwJn2xWHYFUN2Jix8cUU228
	SVxKlrlc9Hv5hIaAL6jBAqDhgntSjHkdFcpHNOy18YgXWCFOCsnxTFvStPll7h1E51XGxmXBUyjQe
	VGY+uJ+tNxozRP3ykdS96eKp6JMJUyHOz4JtDBTd3kseF/FAjgroTbMv+GJf2mOKfKap4Hz1ROP5g
	kD+VvU4TW3J4UVjkmKPUcTHYZQaUTat4ic/pqEFZtHJVRS6TfSse2qlFodEI220GQVn/GCxvlN6P3
	dQvfolBmycDcSwS3toZvZ9ppY7ktDK01S2J7pDtpVbTReF7hOYbcuKZ3F3kjQQW9H1Bv3AqKGdVY/
	FIu1E3/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCEvk-0000000BSLD-2VCd;
	Tue, 06 May 2025 09:49:40 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCEBZ-0000000BFvB-1hYg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 09:01:58 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-43ce71582e9so35257355e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 May 2025 02:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1746522116; x=1747126916; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B5xX5xDK1LhTZKmUeFagQY4z7X//bT5WMr4CQHakD5w=;
        b=vDwTe+zduQF1qIAZFLMKdzIUIuMd4Tq7mQWvlR8WTGzNwo2SjAD/INz/pcz3gGyrqu
         h04I/KVoNPyH10cMg6FqJzyvK3T5AwWkiNW/Oi6PrbftjWcmEw3nyvNH4AOR4ywG0eoE
         8w706a5FoHo6+tIm5oBuhRb4MUcBGEN61ZLpVkfm+BBQbQtB9Zqu+QiPnVeGsdc+s/7T
         6VXeW3g/MCovnebUMfYCtZ6TpzRCspk1PpC7ie36aRXudK+QxDxo7YZgV30fLNi0ukdi
         cOTaHTUpz5tSzbR11h/Js9TJuBMcnnhkEvIwoZLxo+57rm8TtK6EzkKl3tjP1HMzvszl
         hkrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746522116; x=1747126916;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B5xX5xDK1LhTZKmUeFagQY4z7X//bT5WMr4CQHakD5w=;
        b=S1Q8PbN3APUl5pZWVWkqkwd3NEzsp/l6jpxrhE+06cds2IPX9zGH0jL7T5kSvhhyOE
         IQU5cK+8wf9MOKfUuIyGbj8PLRlathMFQpYACvOit9OJdmBP/Xauzks/XLwKBUNt3m4w
         Y6NezkVbbhG8DBdUlQ4IrdB1YdBTnu2A5I8c2v6FGUZ/T17Dzx1yRyStmokCN7sljiQR
         /hjL0VKWqxxccE3dxlpuurkb1r+7F/SCCNMMrEd6OJL+pRXuci06AOaJI7Dy/6YMMQdN
         4fCuM85f4aCkQYh3mz5UUZHTNNPyAcL+ZVnW29URp7joYzp9KVYZB7jJt2fuNxgsESmp
         B/dA==
X-Forwarded-Encrypted: i=1; AJvYcCUEF0GkaTpu7Z5sJEdpkpwkpti2H8Xk8tPp9yWnLN6i17+/hR5D59LAHAYlt9obpm3xCWmOtjV39yHHNftrvz8L@lists.infradead.org
X-Gm-Message-State: AOJu0YwThVjT8PwWu3VX8j7yp3vlqPlhqpup2cfHb56MsXixtWg8pAKj
	jvQSihMSFV8zoRYS5wy6M2z8urq2xeGehSuVyH0AFEmDcQ6HoZPBtrBn9tl6+LY=
X-Gm-Gg: ASbGncuJx5GPVCiTzZRDjmApx6DGkFyXEzd4wnDFoPhB4IPxAdnWAfXs1Frmsknbsby
	z7mlxaybdD537s7ao5I5HfYHO40mn0GDhREiSGv7HFrrjIzJYgcY2Ei6wm6Es9jy4OBZ2/kL5pn
	hk2BTNNNdTKU4DCS+2xuC3onkPo/Ak/vmywvHUkAYxVcQtV1peOPtQ0hBog+yh43vdWHE35GGCl
	oamjftkM6hZhnZ50q7vUaiE8GftFnPszIxON61zx7Ed01UDnaL89wwP3cvcz8WbydNu1Lzd15S1
	5SfHeO1JlwlEQCGW5t0BUp6t6+624nI/tCg=
X-Google-Smtp-Source: AGHT+IEhEQmtTeTN7IWRZ8t6vAkVX+cpAae/AbxZLwUc76/VgMs/gN09VBYqk+ftARkXwaYPcjiIdA==
X-Received: by 2002:a05:600c:3d8f:b0:441:c1ea:ac35 with SMTP id 5b1f17b1804b1-441c48dc3e2mr82793035e9.18.1746522116150;
        Tue, 06 May 2025 02:01:56 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:bfd0:3ad7:fd8a:fe95])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441bc83d471sm138125725e9.26.2025.05.06.02.01.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 02:01:55 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 06 May 2025 11:01:46 +0200
Subject: [PATCH 03/12] gpio: lpc18xx: use new GPIO line value setter
 callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250506-gpiochip-set-rv-gpio-part3-v1-3-0fbdea5a9667@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1404;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=gRCbKDYWwPPaQt6l4gb0BixRmpWGNrb8kCwxis9bt0g=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoGc/9i0uQJY2BhC2Zrkvn3BoBUEcrSA7AXU5Qy
 HhV9DYw8tSJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaBnP/QAKCRARpy6gFHHX
 cgjwD/93U00fkkxaHhdkDkIlVUsJezLok4i7YHaxAuCQXD7314SjDuTfb66TE169HcoiHhxuRCh
 oZ9hw3ekQ6adWrpAosQzSS8Y2ZhLhCox7bdRrgm5fVQOOH1Q8G+DOyHbaKjLc7aI1ntaZQNaxCX
 KhvlUhTFYk5VEjQAbMqTNCXOpK/wnoHjaB5G/FCOgPrBygbAgZm+HYGVLCkqBh0KmgQQopw5qFB
 bTbl+qG/kj7i1rjObZx6DLtTURDsJj28sztaAM5lHt9fGhrBD28XodsWCb5vU1v9qM7OZIFJ3JO
 cHAed/Ei61otC4cOXACJIOumlsXwVyGXf/W0Ca7VBmdUgSk6PjnVxGMjfEZK77/8dJtBPucS55R
 6SeGYrN6R9bybkiF/oOdzmWfh+VsJHoqcgMgzMJxLUQP3iM1zxxyMADvjoT2dxh/H5GWR0FVzWa
 Kb1/HsMmdhOY+yazJo2P0qrsLQsk3HoHrh3fMzUPgDNd66E2ZIHTGEq4DQSHRg89IbZGY9f40eJ
 276sGF0uzhjcKzLq1iBiDTi8iti8/9WYhenl30CK/2wkos6A9sIbIgTjGKy8VF9+Rf0lGaCS6dv
 LPjIK06bWcIcR8WWzwbvk1lHdjbt5yhXnftqAT3zT9PhSxFX6miZo++KAtjyw2zQnBAicckizWw
 n85veXeo0akuOxg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_020157_452251_EE057524 
X-CRM114-Status: GOOD (  13.05  )
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
 drivers/gpio/gpio-lpc18xx.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-lpc18xx.c b/drivers/gpio/gpio-lpc18xx.c
index 2cf9fb4637a2b..8bb8a87ec1e99 100644
--- a/drivers/gpio/gpio-lpc18xx.c
+++ b/drivers/gpio/gpio-lpc18xx.c
@@ -263,10 +263,14 @@ static int lpc18xx_gpio_pin_ic_probe(struct lpc18xx_gpio_chip *gc)
 	return ret;
 }
 
-static void lpc18xx_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
+static int lpc18xx_gpio_set(struct gpio_chip *chip, unsigned int offset,
+			    int value)
 {
 	struct lpc18xx_gpio_chip *gc = gpiochip_get_data(chip);
+
 	writeb(value ? 1 : 0, gc->base + offset);
+
+	return 0;
 }
 
 static int lpc18xx_gpio_get(struct gpio_chip *chip, unsigned offset)
@@ -316,7 +320,7 @@ static const struct gpio_chip lpc18xx_chip = {
 	.free			= gpiochip_generic_free,
 	.direction_input	= lpc18xx_gpio_direction_input,
 	.direction_output	= lpc18xx_gpio_direction_output,
-	.set			= lpc18xx_gpio_set,
+	.set_rv			= lpc18xx_gpio_set,
 	.get			= lpc18xx_gpio_get,
 	.ngpio			= LPC18XX_MAX_PORTS * LPC18XX_PINS_PER_PORT,
 	.owner			= THIS_MODULE,

-- 
2.45.2


