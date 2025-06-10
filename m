Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A270C5B543
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 14:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5efislHrp/JRAcyS3DpceL6NreL8VPyCFAzfIt/z8uY=; b=PxPElAPL7llEk0i3p8a7jOHoY0
	nAWiQnxgqVibqgsIx+ZGhc+u9RMsI2uaepfDELzfLUqpns02MgApWGaQCNE71KUy34gywIuL7IC8T
	0/jcG+wQQRa37rATYT5KxzhupPi1YRAg63quIpHT2ecAJAwfoHwN/a3yNzQJcqcCPeKjf+WY+nnD4
	FNCiOAZdX80Id81bJLpPnQXYiLckicMgVCtZ5d7QLc/E8gIx/RHH6F8RJMxzMzD7pP1A0TafBufn4
	kdUqiB2TxqbKr+Bvb20SZPc52jEZuOGG5lrfnzdGzUVvAwTzh6KfbSOQZ1zvNonxsezcuXGCOyHaz
	+wvnRPMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOzYs-000000074VI-1gyg;
	Tue, 10 Jun 2025 14:02:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOyAb-00000006mOl-3Gix
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 10 Jun 2025 12:33:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=5efislHrp/JRAcyS3DpceL6NreL8VPyCFAzfIt/z8uY=; b=AJj3AKZ1qJr/eA18jcUax0Fffm
	s2ddoHpD3kkUtxxirc1pCf/XdtdUlqY4pBHm8WxMnDEmjvVr6kZBmVX0+zUK+gSKF2BxrqQGCHvQV
	nr5gX2jZe5ZY6CdMRc5mLqNySb1PfzngDRdJPPYLy5rxXtezLlCQbPBk5wnJX0+B/luerkpgrGk97
	+DWlHTkLPYDaHmsd0BtDYdJf0HkjHQ0Bn2yD0VATC8gvdH2PiBGIKuD4/+O6gPi/XE0WYjv1+qCIH
	wqpfNOslckchJLulw9Fe3Sj5B6tztFcTXcbAY6YgJm0qgdNMSLEE7v4QH8KjdviM2i3h8lw4n9r5y
	1qrUvXeQ==;
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOyAZ-00000001oaJ-2ad5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 12:33:37 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-3a51481a598so3128691f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Jun 2025 05:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749558813; x=1750163613; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5efislHrp/JRAcyS3DpceL6NreL8VPyCFAzfIt/z8uY=;
        b=U6uOspt1QN0WWdN2jKs2nVxxZjbA5MtXJ8aVAyuIhwB6f5cDhtvfFbYe0DyNxY0KEX
         OkOWuX0AR1uor4n2yCjWeQF29+YHE0yzYXlx6MF1zkot8MM0VYb3gjmHYw6LmstXEP0+
         Qr6DwHUb5PB1Uw3Qw+flWO6AEyEe4XDOrv7GLx/htzW2u+Dw5XRF8H06hGtaqzVvyZ2M
         xkr9w+3ohmFAujDuCIBHnQQVz92RCxkW4u7hj5lRjqNZWxvuAJi5Xv0zGDtQJxbJYanN
         JFlIuF8QNoZNca+Crq1txMjCoRw2MWdkVh8HxI3sT3xoelKoIM8tHTrjFe5syqFb6m0z
         aH2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749558814; x=1750163614;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5efislHrp/JRAcyS3DpceL6NreL8VPyCFAzfIt/z8uY=;
        b=sXvVpDvGGIq9S83hDkclIz04ZO8si96HbYjOTIwtP516LDBB+7THai8FJkpMwhYjFs
         PciGeIRYedvGJaGhoN/YBL4zUFZjvCd5HS+2g4u90Jxt1iwnW97XJu2ql8OTfTw6jHCi
         m6C8CLaxyyGzrVGmT90D9CJX8kX6Wm6wRV0HIgCs12J3yTzPNvE292G/XtDuJfmjO9hu
         XSXJvbVudjEq8ThmtQNdCfvhGYWSM3UmGDE/EeelsOcid7R4if/3jnuOVFn3gCAnqCGk
         XN2fU1fWJeGtK1pUt8duVlsZnsEr0LtqdxM/p4Yz9nzKCZkGu4hBv8FhrniwSHXRjLiE
         owAw==
X-Forwarded-Encrypted: i=1; AJvYcCVn9Q/cwBf1Pfp75QyD7nyZsT+PaZLDLoeIT1drdxnt4BfZJEJ7Pot4SiodlhAmFW3Pw1wzqsd40XJU67X+SWrj@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/SiOFKL7ASqrynm5sDprskli0GDGC4khDoC0FftY2murA5h1A
	H7q+dX+5f2YhPrytBApO7iCgTtSy2oyBmoATSRsGH/njTc68f9iOXkR7s97k3M7ryH4=
X-Gm-Gg: ASbGncsVkCNStFX3ankJG6hgWxQK382nrmItd7Df+XQJuJajA4YIYzKIc3cGqx/hRXs
	tvr+cSbqXfdBLAn2ozzKBBZ9EXryCWzIaWB1+oNdP07Lm0EPvziU9BxqO99HNmk8Y2YCbyDk/lk
	eD9dx7SrwXbjBy23xmehMV/V6pcEiCUWQ3w+SuYncRoA4+xR7K6bgSM8zNbD5XGzyDsIf1ur14+
	OU63x1R1h6i2qSfx1spTaz8+RfOBuupHVyBcIJX2MV+MjrbVoC5tcO4iGcWhEaZZ6ehLs4qJoDq
	noFCEs0PHd1MP4wBM16lkeF3Uufd2vgxrfXWlaoLhusD+eXLEcg5JA==
X-Google-Smtp-Source: AGHT+IFgyML87FC7sXwU9H5OuYAASfbZLFGVxDzw97GzCafTQDbHfQzd+kDvtAb5xiwbEFxqnYxW+Q==
X-Received: by 2002:a05:6000:250f:b0:3a4:d02e:84af with SMTP id ffacd0b85a97d-3a5319b5ca5mr13136061f8f.58.1749558813586;
        Tue, 10 Jun 2025 05:33:33 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:4d:e52b:812d:eb7c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53243661csm12290668f8f.53.2025.06.10.05.33.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 05:33:33 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 10 Jun 2025 14:33:20 +0200
Subject: [PATCH 10/12] gpio: octeon: use new GPIO line value setter
 callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-gpiochip-set-rv-gpio-v1-10-3a9a3c1472ff@linaro.org>
References: <20250610-gpiochip-set-rv-gpio-v1-0-3a9a3c1472ff@linaro.org>
In-Reply-To: <20250610-gpiochip-set-rv-gpio-v1-0-3a9a3c1472ff@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 =?utf-8?q?Marek_Beh=C3=BAn?= <kabel@kernel.org>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Daire McNamara <daire.mcnamara@microchip.com>, 
 Daniel Palmer <daniel@thingy.jp>, Romain Perier <romain.perier@gmail.com>, 
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
 Grygorii Strashko <grygorii.strashko@ti.com>, 
 Santosh Shilimkar <ssantosh@kernel.org>, Kevin Hilman <khilman@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 openbmc@lists.ozlabs.org, linux-omap@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1497;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=inYE0B+JIbFcYN8GhgAuP7ekd2fsyKlPqwAEHBeRQ6M=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoSCYQkSSfeELcCg3oaC15IzD7nqU50aRHnj20R
 3Vt+fMHWlqJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaEgmEAAKCRARpy6gFHHX
 cqyAD/96GLYr1WlD8IQwvSvdKxhhNMNdPLuDvV+muwAcy6JTo0yVwtFi29APezY85UQRA1fBdH8
 tBj9XT9r93hwmuW1csYQjI0Y+hbNfmuqJcmQBr6Dzc+ADZk0/dhgqr5t3VHtV/Ur5QvhQGvn+k0
 2lsUOiGUQvMHc8A04WFfw6ek64gegW0vBC+68qMehtMzvgGAwtsk3D9VnjQ0GjZmqeVb/r9sGrz
 Eu41NcHjU6rXmgqDfSm2H1qMh+Ak5Dp49H9cDZbQ0wM2ODNFF3rLCiuZSdMco7jGPXJhK+BIvQ4
 hi7fC69+1/XtsXP59x7xhKZjX5bYObsb9oC6CwW5BaOxMmXKR7Pt47oshFdfYmzRxaJDNYTPcdu
 gSxBr29xktm4DI9JI+25hY4hJQpSsrQOKCBxGiU+55W8miBMG8h9pe71LysUt8Fr8AR8LbZG5sa
 Iqj+eIMUujT95lGnffsd7RwYWfvennBwTykRmBumWcA1HNt7m/gzgU8Ktm6ZF8fkNzEtgu5yWrk
 ijJFq/SPI2UnsQcs5HEbTJe7Ujvsck3MfkGILvNmjHgK9NVsdY+Kla3dGFC0oqKxRSxxlo19Vvq
 mg3UGgaOALMKfIcTu1FOeAv+aBJudryS+uU0V2ore5yflhFusBi8OdDuO+BF/7pbSoZ7qOIkPV3
 QRPFnoLRMWGdKnw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_133335_771591_EA57C961 
X-CRM114-Status: GOOD (  13.47  )
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
 drivers/gpio/gpio-octeon.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-octeon.c b/drivers/gpio/gpio-octeon.c
index afb0e8a791e5a8f1b3029c4ca890a5eb9b8efe44..24966161742a96082baeb850f124c71b894e9057 100644
--- a/drivers/gpio/gpio-octeon.c
+++ b/drivers/gpio/gpio-octeon.c
@@ -47,12 +47,15 @@ static int octeon_gpio_dir_in(struct gpio_chip *chip, unsigned offset)
 	return 0;
 }
 
-static void octeon_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
+static int octeon_gpio_set(struct gpio_chip *chip, unsigned int offset,
+			   int value)
 {
 	struct octeon_gpio *gpio = gpiochip_get_data(chip);
 	u64 mask = 1ull << offset;
 	u64 reg = gpio->register_base + (value ? TX_SET : TX_CLEAR);
 	cvmx_write_csr(reg, mask);
+
+	return 0;
 }
 
 static int octeon_gpio_dir_out(struct gpio_chip *chip, unsigned offset,
@@ -105,7 +108,7 @@ static int octeon_gpio_probe(struct platform_device *pdev)
 	chip->direction_input = octeon_gpio_dir_in;
 	chip->get = octeon_gpio_get;
 	chip->direction_output = octeon_gpio_dir_out;
-	chip->set = octeon_gpio_set;
+	chip->set_rv = octeon_gpio_set;
 	err = devm_gpiochip_add_data(&pdev->dev, chip, gpio);
 	if (err)
 		return err;

-- 
2.48.1


