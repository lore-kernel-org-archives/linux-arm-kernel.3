Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D5BFC7115C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 13:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nyQ3PrYj0vw+ZbLfSxsjtcAJfx4MxDD9O7DR/JlwJVg=; b=gfK54CRyGYqhD7OXUiA47ULjrz
	cMndWzN9b854hC7NEL580zG7dkD8A1F/ry5K9nrYa0J9ObmWE4prh7QA83hHPaSLcir3ruTtwZ13X
	OJ+e+giIGaAaV5JWS6kzB7lkzGYYPEVd+VPRf5d99Sxt1MwJpZ1ifSlJ98zk58DYAmqk3vEP+JOPa
	64RQ0Srtsqwei1rKrliPjned+0X/MR7LVaQMkibp3qmTxQgrCuzS6aMDoc7Hy+oXSiBJeXUqO+9Rv
	Rl0fHDEe5ZIz4izbFaNMGOSntQwqwPrSHAvsw9csyG1A6BrspRAhdBwtwKCSTRUsiw8lrmr7ZPBkY
	A7/PwFvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUQZP-00000008s0p-2jSh;
	Wed, 25 Jun 2025 13:53:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUNRv-00000008K7L-1kBI
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 25 Jun 2025 10:33:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=nyQ3PrYj0vw+ZbLfSxsjtcAJfx4MxDD9O7DR/JlwJVg=; b=PZljCXXw2TZkwuHpyqH6yRWNU2
	eWEb9FPRoVg52/XOO1v9aF8MHEmOneZvSCjye8vBtSxojIQFo5UeIwTp/SOMk7q+L//IB8P54RtbN
	w0FL0MijJUnLVnuLCraDx44VgHtqJugHxm0nVOlQSq1HGX4xTNDGnealYaty8QV+J2hYgzd5IfMph
	uyqTzQr8e2sBvjxojnayvLfNbREJgp26ASxxqinfQ7I0TdqmYLKtru2QAjvRP9f7tZrtS/7KsSmKC
	XcrS+bo3S8L9Cc4sfQokbOnjcnNiElrG5gDaood/sUOZEQpCTDlMBmJk88SKUFK7eMTyoUjB591Kl
	kM4NxoCQ==;
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUNRs-00000005mpU-1Nzx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Jun 2025 10:33:50 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4530921461aso11642685e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Jun 2025 03:33:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750847626; x=1751452426; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nyQ3PrYj0vw+ZbLfSxsjtcAJfx4MxDD9O7DR/JlwJVg=;
        b=bedo+YBitS9rdRDV5yB670H+QLrprj+Iu+XMc3Wl0GW/U7FjMnhJDA/VJHp8nOIyGh
         29TzO8RuNlC1Zd7nvFkKuqPa7s54Te8ql+GIF2FBZ/R7igo7sEW7OQ7VM9sp44veoI2z
         Hj6sbOsbc6jq3V7U8iK7wAUsrLtoQ3ZkbDWjrd4dDbb579nT/FqPgGSOU3l6j5Sc5Q3m
         geSkeQopHGewztz+5DEc3r1GTqbm/BvS258ed/Df4AD3lWe4Tw/YIX9w+P+Cg8UA/TyP
         D6DJl5eWxDN2D2FbIkMOrqxSTs/ALEkfu68fJxE2nbFteyh+iYas6bjlaG2nM8nFGsFh
         t4cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750847626; x=1751452426;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nyQ3PrYj0vw+ZbLfSxsjtcAJfx4MxDD9O7DR/JlwJVg=;
        b=vsc9xkZFsyGSpy/FsDy6KHMHRI6+VHjP4nMVW9iunWIaRokTaRiKOWr/LZo/fBwdWN
         mOUXLRnIOmkZgUIni4swTE07rXv7b3hIOqEciPfIqkT8X13Q+AyHMWjEMRGupGgKiBHD
         jke8eHVysaUTEX0Vo5ljGoQ+CR1kLmRePXaj3DKxYvDi8U35uN70lnGj6/MGntVxzrKP
         7ksPq+FSViyb+SWMgRRJ13/M5Ev/wny5GdBgLi/AE3yzuuyoUqCW8taoNrqrqmwW2kTh
         MEpRFsr2RTogMx+TZkYTC4c2+4+bVkXAtQkLbNDG0GesHYAtuHi2Njv4/+c7l9ZAfTTf
         0RUA==
X-Gm-Message-State: AOJu0YyU251NUzQjAdE4LQ6tRQpP9HSJt/9HDForHCm4DlTpLFqeGBs1
	Ry7ePZyEIQx8c3msPywDi1PYzw+ZqLfedRQ4AcJf8tNnu4YvkOqLfMv0hHMki7N8I3I=
X-Gm-Gg: ASbGncssxND+GIumTH1Gguiuz1kR/+O7mlX+Do8w/f8Xi021gUoE+B+fHD/d+hPQ72s
	eBFqCeZsOEpeGaHlGs3sS/l0q63SeVXMHbj3qMCwf3l57vTPqKn7wdombbyP7R2/oz+5ovPRjnD
	R/9lbnRcJKaNKfm/MLJV9SPfAZHAY9DE7j3QVWncP5dYfqMn+bzD51Vm1SUgkTx4O6wqRsWl2Ku
	Ox7xkX3IskrVH+HsFslsITVOt1/yyxDOoJT/lAmlNmFBzXazQCdlUAz8PXAd0ORNv0hFs5vKVtV
	LxcB4qnV2sFofz20c2iInSggCalY05z9gW/boHN3f9pakeWaVvWptr1E
X-Google-Smtp-Source: AGHT+IGJBQOkw6eJT7V+Tc/6OJa3rfu5ZRr5gF6yKyzRI/QtnAOx+SjmcHMjXnKIxCo+GCFyhzPYEw==
X-Received: by 2002:a05:600c:c04b:10b0:43b:c0fa:f9dd with SMTP id 5b1f17b1804b1-4538269fd07mr10337845e9.25.1750847626370;
        Wed, 25 Jun 2025 03:33:46 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:d216:42f3:1e7e:472e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45382373c86sm16133195e9.33.2025.06.25.03.33.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 03:33:45 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 25 Jun 2025 12:33:29 +0200
Subject: [PATCH 06/12] gpio: spear-spics: use new GPIO line value setter
 callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-gpiochip-set-rv-gpio-round2-v1-6-bc110a3b52ff@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1861;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=vMdNPd5jRPkJ9QwKPdJC9QQNnWlRPg8OHEfjS70PZL8=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoW9B/CBkqsRRCcLd0UFu9RXVYmSHO9jQsckaJE
 pp2PCUKjOGJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaFvQfwAKCRARpy6gFHHX
 ctwSD/9Mp/zVOVvyZVeHYqyme3BxhbzcR9pcx5ATfalyilg7HNmKg/32h7u72xZD3I1wE5lhqu7
 w1czMVrQqd7UfT4/BpolTbZNq9c4D3ZR6dAUhktF/cx5bXVfMauk7BkwSn/SJ585lE4Rgj7ZYes
 0IFjVz8KTIXc/AA23Ck60F7M//fVSTCpR1IWgTGE1a9T/V9chKJksSUZ5JBQZ1ipj4wfDSEQzhf
 1lFx4i72i4HLleD2elpfccU1Z0Cor3a0tMywrN+NIfQfzrEG+7Y7qHyaxkLWDEar4rv7Vc+o0V0
 jy1ZuwHHuNu4SKKem9Lj4cKuaTkMACootTDGvZUNhooPVv0m2fGdM3yp+5i6jR0GGwXBt9mwBfu
 QxawwHxMpmWMlppx0csAhOiLpiVq+BSklp/hxYTLzJJl0D5g699IYJyJNdZtHYm5tE+jpt5pT5J
 DHx9ueCiReim7jnqdaBEvDJcE8BjSaO3VjKA5GfwRzcoJ7qxZdVKxg8K6dHxTXxop8RnO1nd74z
 g2tQcIMknTnWHIgH6qp0O919ogwx8HRPwKJ765jHeAi13F7btqMOI3SivTQSSRwVxBhG/3zGbp+
 YQhLXkbn8Z1A2YZoc4REvxRZeJ3E4dSx3HuNv92T8bO1c9MPNpwQRjNICxgXuDOuXAGDFcdwZ9M
 etbIQJG4192v+3A==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_113348_643990_DED2858A 
X-CRM114-Status: GOOD (  13.84  )
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
 drivers/gpio/gpio-spear-spics.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-spear-spics.c b/drivers/gpio/gpio-spear-spics.c
index 964b7dcb30b7a5bccda964a637f7fec97fe02aa4..55f0e8afa29143649e868a02edc19d920e10c31c 100644
--- a/drivers/gpio/gpio-spear-spics.c
+++ b/drivers/gpio/gpio-spear-spics.c
@@ -51,7 +51,8 @@ struct spear_spics {
 	struct gpio_chip	chip;
 };
 
-static void spics_set_value(struct gpio_chip *chip, unsigned offset, int value)
+static int spics_set_value(struct gpio_chip *chip, unsigned int offset,
+			   int value)
 {
 	struct spear_spics *spics = gpiochip_get_data(chip);
 	u32 tmp;
@@ -68,13 +69,14 @@ static void spics_set_value(struct gpio_chip *chip, unsigned offset, int value)
 	tmp &= ~(0x1 << spics->cs_value_bit);
 	tmp |= value << spics->cs_value_bit;
 	writel_relaxed(tmp, spics->base + spics->perip_cfg);
+
+	return 0;
 }
 
 static int spics_direction_output(struct gpio_chip *chip, unsigned offset,
 		int value)
 {
-	spics_set_value(chip, offset, value);
-	return 0;
+	return spics_set_value(chip, offset, value);
 }
 
 static int spics_request(struct gpio_chip *chip, unsigned offset)
@@ -138,7 +140,7 @@ static int spics_gpio_probe(struct platform_device *pdev)
 	spics->chip.request = spics_request;
 	spics->chip.free = spics_free;
 	spics->chip.direction_output = spics_direction_output;
-	spics->chip.set = spics_set_value;
+	spics->chip.set_rv = spics_set_value;
 	spics->chip.label = dev_name(&pdev->dev);
 	spics->chip.parent = &pdev->dev;
 	spics->chip.owner = THIS_MODULE;

-- 
2.48.1


