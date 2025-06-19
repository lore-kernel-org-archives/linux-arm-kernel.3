Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC707C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 08:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BunBstoheAwjjbUHp5liz9ofrsXDKVHtZqsL4Aji7Bo=; b=qeaU+D7itrBAf+ttoIGKLEYBq2
	Q7fVHNQamOS/0FcZBZXdhdnNHAFqvVFj1gMjbOAfaO2aBYtP6z9LpT0VPHU/0MWy3/MFqccHaqqfn
	DA+lAP+x9ExGK6aPtJ4ATL69VoIR31XTjMCy0DgTN54erAknKNRvCc+n2351rQfUTwMl2GKvd998E
	Cf1hO+1cmsbOlj8C6Kqc+C0hqSLisQPu1oSure8TfDJUrDUmPeN/QUnkmtLF0q3oo7DTY+jdqnwx/
	wsgfQu695BbPkke+jHJ+U+d+dOP5LEwRC27nEIJwNNZtV61Fo1cU650RF+mQii5VrnPLQwOZQcwcW
	DwwCU8fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSB5R-0000000CW2j-26rW;
	Thu, 19 Jun 2025 08:57:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSAiD-0000000CRIJ-1qXI
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 19 Jun 2025 08:33:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=BunBstoheAwjjbUHp5liz9ofrsXDKVHtZqsL4Aji7Bo=; b=oc9kbob6OlgsdfHO3OBV+rVW+6
	RX9IlfDmAU9MpoI3rCO11q+/dEYkD6q/Bc68svxwHe7bZfXAUTCJzDyABOXl6nn2g9JBu+c4v2xAx
	RUXG/BGh+PjRueURzRGbIND7ROAs1ke1VoHf0XJCCx3Vlk8mnjTEBUU9+TSLN5LKlDHO85tRVGfw+
	1LLdrwqKe9Kg+hKSfTeCuLdu98ACF/EtQnEHdXuneqfGwLD7+9g/Ga6o1ItKMdK3zPUcF5BK751ow
	RuZIX4TU9STU4dKsJ/xpM6ADFlerZDZRO16HuzY4KPOTFgjr8nnslmSHk4OtLGndqXRuqupNclPLD
	/FkmHT7A==;
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSAiA-00000004No6-3qhJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Jun 2025 08:33:32 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-3a589d99963so524141f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Jun 2025 01:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750322009; x=1750926809; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BunBstoheAwjjbUHp5liz9ofrsXDKVHtZqsL4Aji7Bo=;
        b=yDgqit01RflsFo/A9xXUBQfRlhu8IWdde0cqfeVFp/1hIMriatLzq30wKn5UYRnyXz
         Bw5/x0e7PK23cVPoedgpqr+Wlg2ftykphU8MEx+vn4xMlefwBOnOmYrgeXl62YgacZo0
         iZtUQwxa3Eo4XbNciS1s7eKMpkf21iEa6sFivjI2HXnQBj2Dm5TXqXLY0DyGP32q+dlB
         1iDmhUhrUwpu3usjQYrG+pXv2O38UroPjxmESRyGqov48Vdv/zo41NDE15ukCZs4YCXp
         RBo0jwaLMQJ64Yp9PtXJGkgOZWxyw2PaRojAmmefPgP+p9BfEGmwKTaFFPqCZ4MO92Ty
         /nlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750322009; x=1750926809;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BunBstoheAwjjbUHp5liz9ofrsXDKVHtZqsL4Aji7Bo=;
        b=GPnwTG41LgaCpQuFCxyi13lspnuF3FlGl9+erHVnBfzUC0wFylMD2P1sMVKURZa1OK
         DO9eJEKHaizJ0pqwAUaKXU5ThfAZJgfpbKwRBtAdRnj4ek60LgjgKUYDXc6yZvZSmz3m
         CBP/LvVzHdiYlSfLg4M67R7Hl4wyJnrrW4TKXyi1oFibSHBIW7Re6jnj6v9PRmuU41yb
         p1rD8I7eaJayM0oYkA56+2xAUHME/j7EOCkgyaq2G88vTiuJDpkDSrSFPi7yPiXMW8BL
         ZrEvNeF+GudPw4tPdqxMhRwr8vlikSaLcvYDojXvvBHoi9VW5eRvRWEi1FT2hbcSF4kx
         s4Jw==
X-Forwarded-Encrypted: i=1; AJvYcCU6OrU0OQ0iFpvDqMoOu6FgnCLWIR5wRHvP3N8ITA4b8l60SdNgM+I0TEQVH5J7AjIGknT+g+22KxDISoOQvZZv@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0E+l/YVWZSTsDKrgzZN8GproYrH1+NxaG7hEPQ2Bn8Qdt9buN
	Fq88xYKbN1RFTDSRcczCFutVTDM8wN7+w66XE7+capx4tRoIVxu/54u+61Z8mXogryA=
X-Gm-Gg: ASbGnctOeT8uXEjJY+H5oZniNUx91g6AqlRofutJXFFFjgsJqeOWt9aRq2jrEKL3Xor
	bQNg4tGNuAdjM9wjT0bT95nZ/JbGy4oIXZKa57YZFOhuUs1YIeHZhWSJ82h3duTfr+bkEHhAA04
	svx2/xSGUtPeqB3UtbdU7lb7CXcsPCyTJNvPOROru8BrnMaJSgxA3QZS1b+/bZD1FcNTVkewcR5
	3Y4s39NBz3G9/7dXadu6c+mzLG3RDoBKf5JvItPayXKlRwZwgCD+Phsa7p6cdOlhV+26NjnV2z0
	2nNE+WFFgr/GzwSqw4+nZAjqTsV+v9np3ogqtZWHoU/wi8OpNBSE2erA
X-Google-Smtp-Source: AGHT+IHPLcB8/29mYtkUt8iKok7FC37biZwWB/Q/SP56+aQt/F1bk12ty9NxJOh//CgnB0DvwIlwFg==
X-Received: by 2002:a05:6000:2884:b0:3a4:cb4f:ac2a with SMTP id ffacd0b85a97d-3a572374884mr18221393f8f.21.1750322008719;
        Thu, 19 Jun 2025 01:33:28 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:c485:fe15:c9ab:c72f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a63a42sm18828151f8f.28.2025.06.19.01.33.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 01:33:28 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 19 Jun 2025 10:33:16 +0200
Subject: [PATCH v2 03/12] gpio: pch: use new GPIO line value setter
 callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250619-gpiochip-set-rv-gpio-v2-3-74abf689fbd8@linaro.org>
References: <20250619-gpiochip-set-rv-gpio-v2-0-74abf689fbd8@linaro.org>
In-Reply-To: <20250619-gpiochip-set-rv-gpio-v2-0-74abf689fbd8@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>, 
 Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, 
 Robert Jarzmik <robert.jarzmik@free.fr>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1483;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=mZa8mgQmqtI4o68XMiXnsHjV4blkeihaJT265+ul6Aw=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoU8tRA5Lt5tCecOg14IUXcT8lEaMqPIFkzeDus
 xIhrJVliUeJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaFPLUQAKCRARpy6gFHHX
 csRrD/0X4kU8CvgNicRwRcPWkiYI5uyEKdHA44BuqB296GSDxiSMQlry3tpH3bDB615ncgTzJma
 OeW1E/h2/kWDyXb/rNf+JC8p6+Vp2CybgFfPoOITgwBlsGU94i2zsJVj59QgKSr+zQy/72qvBHn
 30sFm5mbKzrutIuUP6hJcSCzDOlVbid1hEET+ln/VekIRRKHcacMTBTUZ0WWa/nfcUZRTZzAX2L
 tFfYnE55xhV5+Ol+XjM9Z9Mq/lCTwzhN2RBjrgLNtGizgzogE7BB3D1HB+DnRNGG9MY4m9dVllv
 3OxtMEmV0j6XpjJIYQjMNDJFdRJgoMbELkgGEgBPprC6VEPHwtkQVpt8lk+IxBBa/qHDuyusXaf
 7ov5BUaSMqQwsumEzkNW99h2bcqbJ/5v+eU/7YJeMAed+Ayi4yN2/UGvuQwxTH7gPEhgYLrlwzR
 8UCVpkgDo5KYQ0WCsn+HvBworLov88KlUpjNIBrq/cV+Xmp95zE7w2JscdCfsFoclXHa1JsL4+i
 m1+oxV36y02XpfZ2aTxmzR4poQQrGV7KNVIehnHYTNdmNfXIhcHi6ksh5yv3TnZq6PtvyGM7wZb
 L1a0SsyjT037zulwfvX0arMDLrHDEDL4AFJENcGpmVSVfgEDcvQNQ3jHDR/tmWO3BUf6Lz+Se5A
 d+JfGKVb7WYgPOQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_093331_194380_A2B25974 
X-CRM114-Status: GOOD (  12.91  )
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
 drivers/gpio/gpio-pch.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-pch.c b/drivers/gpio/gpio-pch.c
index 63f25c72eac2fb98156eb7682e780247a893d7e7..c6f313342ba06a1386d8ff8a882c9344a9e809e7 100644
--- a/drivers/gpio/gpio-pch.c
+++ b/drivers/gpio/gpio-pch.c
@@ -99,7 +99,7 @@ struct pch_gpio {
 	spinlock_t spinlock;
 };
 
-static void pch_gpio_set(struct gpio_chip *gpio, unsigned int nr, int val)
+static int pch_gpio_set(struct gpio_chip *gpio, unsigned int nr, int val)
 {
 	u32 reg_val;
 	struct pch_gpio *chip =	gpiochip_get_data(gpio);
@@ -114,6 +114,8 @@ static void pch_gpio_set(struct gpio_chip *gpio, unsigned int nr, int val)
 
 	iowrite32(reg_val, &chip->reg->po);
 	spin_unlock_irqrestore(&chip->spinlock, flags);
+
+	return 0;
 }
 
 static int pch_gpio_get(struct gpio_chip *gpio, unsigned int nr)
@@ -217,7 +219,7 @@ static void pch_gpio_setup(struct pch_gpio *chip)
 	gpio->direction_input = pch_gpio_direction_input;
 	gpio->get = pch_gpio_get;
 	gpio->direction_output = pch_gpio_direction_output;
-	gpio->set = pch_gpio_set;
+	gpio->set_rv = pch_gpio_set;
 	gpio->base = -1;
 	gpio->ngpio = gpio_pins[chip->ioh];
 	gpio->can_sleep = false;

-- 
2.48.1


