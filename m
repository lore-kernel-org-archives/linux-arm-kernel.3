Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7B5DC7115C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 11:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o6ZfGeAkXZ73Y1KWGs+ss+amnyN2DFHuOZR9Jo0dyjk=; b=R3MuN0OAih4LOocjldtblLC72o
	wzYOhStIOD27Xe8+avjcA/pimPRAosEWs5kldnpNK3Jcx8b12TbrO+7ofOQQU0LU032RvsT4nweuO
	TK+awn50tISvgmKqFSuAx7GL8KHfDgg4+Vr5ZeNg2Rhv9X2sIgsc5KP1aZ9aA9jhyXFgKbUIaevz1
	Ten5YIaMEK0p91KoHBYkbBsKPUmv3w8lUypLFn4buqfUW/LhYNFiJQ7s2OHMgGUDYgGZr/5zSXfuX
	JqLebCStrC5n4SJTKQ4w/Mpqyl0D1sbc13GeQ0h2DQtSqTbXWy70kNLKKbrscLBUvvmBbpJ+N+LVA
	PsgZhIlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUOJE-00000008TTG-0msR;
	Wed, 25 Jun 2025 11:28:56 +0000
Received: from mail-wm1-f46.google.com ([209.85.128.46])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUNRx-00000008K8o-46HJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Jun 2025 10:33:55 +0000
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-451d54214adso9943685e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Jun 2025 03:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750847632; x=1751452432; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o6ZfGeAkXZ73Y1KWGs+ss+amnyN2DFHuOZR9Jo0dyjk=;
        b=j7A1KzugC62jFcHkVwFOLV0+AkJND4nbDKTNJDoMLYNaYrBfkmsuNIFeuKKOJvTC62
         mW5NyNBJzi1I2cfWstyhUpzMx3yScdsVYoiYsS5JFgzIluLKaO5Kc2IjK6bcn0/tJHfM
         HaGjSRGL23iTEI3cSJetsxZSBVuKlan74zJPTLKVpxbIUyUr2OKK3TFFxsWuz4Ba9/sU
         5bn+AxaWCNpguIkek1bvNkfzDeTH46B2CzgYldDCnUwadqkZ87wAbqK61682AsvHaPEB
         g13EZzgYFpEzmMtKGc7n/kVnscgAp+TCYlAmJp9oZMeqMrndwckSqBlT8ks9yOPdLNzv
         P1dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750847632; x=1751452432;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o6ZfGeAkXZ73Y1KWGs+ss+amnyN2DFHuOZR9Jo0dyjk=;
        b=jKUqqvcFnEAb7aEYCgjmwfiYalD+kiM5UZuLE5MRKJC3OUPBd9j65HHT6xjOLy/pZf
         Cg+8ZRpwi2U+MTjWFV9BEhwyqy00BwmogegVDGCnUcO3TL5EJ3ojJAQkIwgEIPSymLhe
         HPYnmS2thdLIvM2PBX3mHCkteehpAne9NxJyAkLl53L9I/xgCTcaclEfNXZYhXqGdo6D
         CFPCmNiCsmWnc4vmrwIt5FROGldQ+V7htlscKFkKpu/1brEgg/OHDdWrQsQGQamMesHk
         PspC+4IyaWBKexXleNYO+QUMouqQruAmbs673Ht+sOzbLFZETE8iAGgmAl/wglugqQm3
         j0XA==
X-Gm-Message-State: AOJu0Yw4C4+GxOvUw2AClJpZQoPB1Gza1npS16nZ6ygwuGJHXF+yVGph
	cjsLFv9m+WhIcnQ36K8PbCzZ2lTe1aGQ8wXGvYaKoX0O0p8ZWJNhK9lD39r8fy+wZ6k=
X-Gm-Gg: ASbGnct6KOpIHCBBMxM+2PLSzwagYHZtCTouQIF0jpqsxub3X+ZtLqHXMiIxJR+beKB
	ezNatT5l9iQePrIqZnH/jDdKPT41VupHXGR1pJRE3N1NVwHQ8L/kM+xsqKpaMrMHJxHa5J+8u4c
	YeFTrvzxXbWzVszW4VaJooxumYMkq5moBGZYML7yAr7gCYZoXLFsdkTtifZjO1MHPx/XUaWs8qj
	rcduPEj6rTYK+X/gcTge3yY7rjp/OMTFGqPBd8j+gi0vgKZrGTAcpeNIloLLyraLw5T1FgOWsy+
	e22HgsGymvys4nkUxoAqrS2c+WX7sAwLd58YrN2nf7teQUiRA+cZc1ROtKdPlT8UPcI=
X-Google-Smtp-Source: AGHT+IGGcN7WUw8zzW4bU1XVR3qpO9sgtito9/eGMkKkDd29OeHegSc8qveoQUTN22kyvswbIXCBvg==
X-Received: by 2002:a05:600c:4443:b0:451:edc8:7806 with SMTP id 5b1f17b1804b1-45381af21fdmr18915265e9.32.1750847632081;
        Wed, 25 Jun 2025 03:33:52 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:d216:42f3:1e7e:472e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45382373c86sm16133195e9.33.2025.06.25.03.33.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 03:33:51 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 25 Jun 2025 12:33:34 +0200
Subject: [PATCH 11/12] gpio: tangier: use new GPIO line value setter
 callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-gpiochip-set-rv-gpio-round2-v1-11-bc110a3b52ff@linaro.org>
References: <20250625-gpiochip-set-rv-gpio-round2-v1-0-bc110a3b52ff@linaro.org>
In-Reply-To: <20250625-gpiochip-set-rv-gpio-round2-v1-0-bc110a3b52ff@linaro.org>
To: Ludovic Desroches <ludovic.desroches@microchip.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>, 
 Thorsten Scherer <t.scherer@eckelmann.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1682;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=UPda8VLJo3OBoIL/W0Ct/orzjZK2QuSKpe06Y6G7WUo=;
 b=kA0DAAoBEacuoBRx13IByyZiAGhb0ICioo+hAcr5UWIJINtVh6Z8N/KKejk5v7M1jOjhd43zG
 4kCMwQAAQoAHRYhBBad62wLw8RgE9LHnxGnLqAUcddyBQJoW9CAAAoJEBGnLqAUcddydWIP/1eE
 oAzYegzqMKV/tKdTsVzHqG8LAUBTYy84VakX8ZVlCBMOxbOsqhsV9zsazPR8Up7wrITUsChfuxM
 cwrvui0/hpZ7ORdDbpBzEeoH00USXn8aecQGgCDgEYHHFo9JT9qlFjni0J/EyDHxO1JrQzfuCAR
 AILY81G6ibxRYHjZJX2OSyLo2mvUDArUHYDF9JglLbCDUSRBEPD1Mdf9fVqDzTKVwu7mvX/tRrM
 97xQAAawd2ZCERvP/NXtVvGXt0AG02D2ADMi4EmswH1vMdqbl0PaSEUt6eIK4XbjXPck3OFwpju
 Kn30+92qMYfPstHocKD3IKjIhx+tDmkFyvxoMmaITqWSuLaph9yNeyZ/Zf1risZLckcYed2DthQ
 o+zOyM0bGYCXSWlQC+qwNuUvEcvC/8J3cjpCmcoKQHJBlZP9KAR32qoxDJRePob3kfrqL01CCWf
 mMfiUIf7nBJ6gDCiYFkf5dNtJ+iWYTcwhYbuNTCwVzJGNWfypYncBMpqyrBFKd9+jB35i0BUydO
 xPW/5f3ASSR8yBBVO+zk9LwuoTxw6vUlF76Go6Tp7eRs6ugeiNUJFj9XVquFifCUsm6RNTsaQz6
 IsM0MdJekXnvMTkmwguqfs6dcCqdDtFcujyJ4LtJOoqPAa1z5qYV9wfb3nWM/INEUfs5i5C7agn
 jNnJO
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_033354_028904_065939F3 
X-CRM114-Status: GOOD (  12.48  )
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
 drivers/gpio/gpio-tangier.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-tangier.c b/drivers/gpio/gpio-tangier.c
index a415e6d361731e809d137a92b6c4658b447c26bd..ce17b98e0623ea6c0c2146430da38833dfd16cbe 100644
--- a/drivers/gpio/gpio-tangier.c
+++ b/drivers/gpio/gpio-tangier.c
@@ -90,7 +90,7 @@ static int tng_gpio_get(struct gpio_chip *chip, unsigned int offset)
 	return !!(readl(gplr) & BIT(shift));
 }
 
-static void tng_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
+static int tng_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
 {
 	struct tng_gpio *priv = gpiochip_get_data(chip);
 	void __iomem *reg;
@@ -101,6 +101,8 @@ static void tng_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
 	guard(raw_spinlock_irqsave)(&priv->lock);
 
 	writel(BIT(shift), reg);
+
+	return 0;
 }
 
 static int tng_gpio_direction_input(struct gpio_chip *chip, unsigned int offset)
@@ -428,7 +430,7 @@ int devm_tng_gpio_probe(struct device *dev, struct tng_gpio *gpio)
 	gpio->chip.direction_input = tng_gpio_direction_input;
 	gpio->chip.direction_output = tng_gpio_direction_output;
 	gpio->chip.get = tng_gpio_get;
-	gpio->chip.set = tng_gpio_set;
+	gpio->chip.set_rv = tng_gpio_set;
 	gpio->chip.get_direction = tng_gpio_get_direction;
 	gpio->chip.set_config = tng_gpio_set_config;
 	gpio->chip.base = info->base;

-- 
2.48.1


