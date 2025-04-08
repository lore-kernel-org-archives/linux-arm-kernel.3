Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3018C3600C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 07:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kgKpi2eMQzrwoQvXzcbqAzy5xxQOgpVGvK0+n6zqybM=; b=h0Bl8yygYB+hQsQ5yEBd/Wri2U
	LZYYuBJ7kzFKuNgNwxbIIE2Dal8IsjkPbkqmkZuCB+6/W3rlupy4g7pEHLuGA65jlQxkgLS03Bxbr
	iHkH5mEi79tu2nLLtCX0VCBiyPH2Lj6EdbKlsqGhDYyB8e8LYm9CyJmg2uvBixKVUyd+3Vp6cIw/W
	wgEUy2k0qEA4QNZvRYy1fY6YlCL1MqfgJPC/AGeSgchdSScF8hZLLh0QFtN3RcgMY/WsbcO0qdp/1
	ZSM60mCdejyp/8v4DvgrP0Rf62BJEUWEpp6vpZPtdzN5lZmohHpTYfXqqtZTg6wX5e8iPoT4FaHzo
	zl9oP6aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u23Ii-000000032p4-1Jmb;
	Tue, 08 Apr 2025 07:23:16 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u23DW-000000031eI-3bIN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Apr 2025 07:17:56 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-3913d129c1aso3548063f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Apr 2025 00:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744096673; x=1744701473; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kgKpi2eMQzrwoQvXzcbqAzy5xxQOgpVGvK0+n6zqybM=;
        b=WJww3g8PjrYpTaphVdOKHc2Nh+nHI+oACWaNsBvm7Y8368n4bE1nmqz25mkgitMVrQ
         9yd4i1HdD017vEtzjOe73UjN7pPUax61onolN7YGmUzSTtqwCDZgEqJ+IEyKt+fIa/1U
         yK7ASpQK2SFrM7WF6tYz2Jcxv+GYM+qkL+m+Dfd3C3+4yHI1Z8D3Z5nbroLVtRQtlG8V
         oRkL/qJFGG+TV2ACQlmB96tm6JyAAJtVluz3H7uD8KN49mv1QUZwRTkDBwsk3dHXt/CZ
         I7+GNC8Tfclofi/kfGZLDrtgf0Cy5QOCVX9MehN8F07B6dnFX/ceAZfd/GWrkK4TmdtD
         iOzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744096673; x=1744701473;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kgKpi2eMQzrwoQvXzcbqAzy5xxQOgpVGvK0+n6zqybM=;
        b=G5rQGrov3l6WQKPSXsD7r/Ph/jCuQzOr9EaASp2ZRLf2mEQQsZ5/Q2mqTjFR/aszrK
         zN9a5jYgW6WLe14LkTqrAjXS/ojUKuWVwMK42Geyy3gbQQZ3nbT0oOjlYyMYoSpr3BP/
         AdUFbs+LHdP8UHZFPtEmlrurvzIt54dj36a5fYKSJ7L+Fbyft2ntJc+OVhi9+6GJt1PJ
         gO47xXtqboxztwYdhVz77W0HOf1naY/XWlHyY6AQyoLArtSHsO+n5qx4g8qub7GQLff8
         p4G7S/ausOmPwowkqnBDcUc8pjuuiBcgq2/ojMUgOetDfu4AAp9qdT77rIA8Rej1+z0F
         lUbQ==
X-Gm-Message-State: AOJu0Yxlnw2lyOeP7zObYuP4I4MJ28PuB6qNKwtIjKhLPK5LXM8jKDd8
	p1B3GS/O0Hc+DluKCkNTsxcRBUiCZI0e3/2heSGJFREasTSrZi8EWDuWa7rfZJU=
X-Gm-Gg: ASbGncuwCe4WU0+S2gRo70tuK4ajUiLIbwqtn2NVHIbYCSjIJT6GE494MZWNB9+IUtc
	I0/44SKYNVGDo+1OkIIkG2GoFkyePCirTVjJcmpvwM0E3+JGjLUruKb4CuNerxCyYUD4+XDeJt6
	0RIxSxuIxdzrxr0B+8Ap6i9X6SujfP7X//NZjnUoTPvj0akA39wvrxp3XLswYuGnyTModuaBr+G
	k9jGwjSZ8zlLENwN6+Dijr68sL6CQNF7hAhjhkE4JCTY163LzozhQ7fXi7zr4R7TNlNKc+tT9Yl
	bV3vI5FlJHFhMCxaNpw3pDdGbIpQpQLXbRbGPQ==
X-Google-Smtp-Source: AGHT+IFIDoEgtgjZmRm76oLe4qBixaJVFcxIWBxSgP9eQc/+muRPjB5OZ4DhcXqFSFfMWbn8IPCLNw==
X-Received: by 2002:a05:6000:2484:b0:38d:ae1e:2f3c with SMTP id ffacd0b85a97d-39d820eb1f9mr1593525f8f.25.1744096673169;
        Tue, 08 Apr 2025 00:17:53 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:2adf:eaae:f6ea:1a73])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c3020d5d1sm14257694f8f.77.2025.04.08.00.17.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 00:17:52 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 08 Apr 2025 09:17:40 +0200
Subject: [PATCH 03/10] pinctrl: abx500: enable building modules with
 COMPILE_TEST=y
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-gpiochip-set-rv-pinctrl-part1-v1-3-c9d521d7c8c7@linaro.org>
References: <20250408-gpiochip-set-rv-pinctrl-part1-v1-0-c9d521d7c8c7@linaro.org>
In-Reply-To: <20250408-gpiochip-set-rv-pinctrl-part1-v1-0-c9d521d7c8c7@linaro.org>
To: Ludovic Desroches <ludovic.desroches@microchip.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>, 
 Patrick Rudolph <patrick.rudolph@9elements.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1197;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=7gT59a+ieEBoRyUfHtp8d/jvYbZrPQXR8M3Rkb54480=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn9M2Z62HjgrUOk13umM6zCKtt5wsF8hMyPqGii
 +FbeYzWZu2JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/TNmQAKCRARpy6gFHHX
 cr+9D/4pVK6myjhrhbvOnoR4PHJ367IIWOAh/Zh8cc762qftCq98AjRSHWjpi3KMWk+T1SoewR6
 yd9FAaYyN5ggStwHN8ifchYiv+JA8sO+i6UuSIOQUVQzey/SsbW1SeTgmZ3o/GsdKPG/HjoxejZ
 M1kbfrXMCRWGU5zTxGwLAZl126dUhXDTKScOqGDG6ZLFctZH0MSBmu4Nu7uWpRWQK3R+Xr6OGfa
 +BSLVhz77RThlP5bmwNejIlKFQNdlTKOpKLwZ4d0FEN5QJPa8Epbb+Vvkputkda+ERCCbCEvjf9
 8ZSHC0SCNCcLyorbyOA6rgYWiPo+GZMHSqoF/Pl1OFZzp2mCtAXPyQrKJ2wv0I5KYUJSLuNstbX
 pAA8HtMWVKN2o8VTfFf0kYbEFAo7BM5D+3B86ctemR78XtjX9vA/33qPRw6qbRuWNjF2jLMxwGg
 7sr3CLWFwcyqt8oNdhyjEWmfnIO2z+BYPCo7Btr52pKon7rbGIyJAAG4gxmUqgjRO/PJ06aCPjV
 erKdtcafZvxLT9Mf2jX/+expNbOTo5PKgOvekHmSlI2xdATbBZgMQPxFNUNJVlXLL3UGV8fR/Zh
 +ApMwVs12NjHuf/sT9aZDxPH2zbKJvARpXLKynmGD52HIn+u06LPHHbZH2+obwAez7+Tde1ydSJ
 G1AuErL37JcATMA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_001754_900242_DDF9D9F5 
X-CRM114-Status: GOOD (  10.88  )
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

Increase the build coverage by enabling the abx500 modules with
COMPILE_TEST=y.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/nomadik/Kconfig | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/nomadik/Kconfig b/drivers/pinctrl/nomadik/Kconfig
index aafecf348670..2c1f8a4f5d24 100644
--- a/drivers/pinctrl/nomadik/Kconfig
+++ b/drivers/pinctrl/nomadik/Kconfig
@@ -1,20 +1,20 @@
 # SPDX-License-Identifier: GPL-2.0-only
-if ARCH_U8500
+if (ARCH_U8500 || COMPILE_TEST)
 
 config PINCTRL_ABX500
 	bool "ST-Ericsson ABx500 family Mixed Signal Circuit gpio functions"
-	depends on AB8500_CORE
+	depends on AB8500_CORE || COMPILE_TEST
 	select GENERIC_PINCONF
 	help
 	  Select this to enable the ABx500 family IC GPIO driver
 
 config PINCTRL_AB8500
 	bool "AB8500 pin controller driver"
-	depends on PINCTRL_ABX500 && ARCH_U8500
+	depends on PINCTRL_ABX500 && (ARCH_U8500 || COMPILE_TEST)
 
 config PINCTRL_AB8505
 	bool "AB8505 pin controller driver"
-	depends on PINCTRL_ABX500 && ARCH_U8500
+	depends on PINCTRL_ABX500 && (ARCH_U8500 || COMPILE_TEST)
 
 endif
 

-- 
2.45.2


