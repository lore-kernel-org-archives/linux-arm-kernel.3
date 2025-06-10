Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5512C71131
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 13:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZhzmZkaOysW/GCSYD6XdHL+fOaPlZnqEL0PQsaxb3p8=; b=GOR4KlhYZfRPmQ
	wnh4tOaaDsouXdgr6qEvG7Sr/PZCZJNTHx4M++zueurlgff39bWvr9QN3rJmD3IvMOxob7qlX7/Kr
	wtIUcFvvy5BgYE4a+uPzW/kQ1HLXnwi1hg+8qQDpHElVe0Ex2wrWI6JM/358EavGyfo/4c/g5hH9W
	D+1MoYb9gdi5vee2cjCSein6HYh1BCUWzt45VrWqM/CD0jG+YTY6FmYZCsO7sclhat8M9PWteEyuJ
	1U7muxUtHaewdKyo0PobKc5p0MgwJu9wLC58+MAPxXo1CzWj7Tl85K0FBpGERf5OVt3qyipPWCI0e
	RdO0ImXQR0vZDGEosM+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOz9J-00000006zj5-3GBr;
	Tue, 10 Jun 2025 13:36:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOyAT-00000006mLF-33Hw
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 10 Jun 2025 12:33:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:From:Sender:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=ZhzmZkaOysW/GCSYD6XdHL+fOaPlZnqEL0PQsaxb3p8=; b=G2tyQ6JbTFTlyiYZUPVfF01rTA
	3KG5f0XHLRRGfXFBTMnA3p3dD4bgeInJ2hpTxPlrzx8a2g5NB+lzIrHfOgHb5TSQwOaYwzMdXYI9Y
	XUePAX8ewUKRIMNTPU+9L//ObpGxBlEGfRy16QihVIezCU3HBBMxd2P8BO42Z+F4U8/a8FYa70kFt
	S3Rjrt6axwWTFT7+YDubtUTlgGqvBm3OHEfzBAGfn9YLvE6qjn0tzh+5IRoVucVndA4LqLQFKukyC
	tYJWdbZsyDNWmrWxjfX+C999gPhWQdSE9rFb6d7V73QgtSI9JPv/YZLuG44nrrump29I2xy2baDBG
	7D5xc1JA==;
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOyAQ-00000001oTV-19xd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 12:33:29 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-441d437cfaaso34045335e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Jun 2025 05:33:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749558802; x=1750163602; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZhzmZkaOysW/GCSYD6XdHL+fOaPlZnqEL0PQsaxb3p8=;
        b=Dw84WdrFST4PSUi9SC/voryiXKBdVdQMaz4V/o+EbKs+toQ/hxuFZdg+lpbRztoGdf
         WUw9G9cg+causVGIiQcuSY29iUaNTOf1JsDToTifxCUgnADrxMB6v9c8DW2lqnDQpuyp
         6JoecxTpPZsOJ0G7/94IB0YGZ1jMR5Icfc+PG8hzeWpBhDyDiL/5fnB4W9kizIuEMUCi
         dL2bMQgoJIV7INIUN58CG3YELgbgLKjBS10lZMQqQyGMUmwBHYfHWppY592U+kyqR+yj
         YTHJDAwYUm5nb3sLRTDql05D7FNrTvI335/LOj3/NZNA/g+QYYy4eUWVMwHn3IvTFZqo
         yvHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749558802; x=1750163602;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZhzmZkaOysW/GCSYD6XdHL+fOaPlZnqEL0PQsaxb3p8=;
        b=u7TyL2hOLpxDjIWtLaZTJGAQxoxBeNwrTc1opGkbLzxTRRvZcD+tPFr3/dNmR5+iJq
         Bbhk8gwWPIacAUt0V/NEwB8Z4UXGMG5aTRV0zNLRxNeulmEjtPNp/vFwI7cdd8fkb89b
         tYGOe1lK/49QE/GPAXXqpiP+eztM2immnb1QwQB7PGQttthkzWqG6Zr1FkPwo1X4SJmi
         okmkeu/zKllHu766vHSk9aPMPn0cXz50e4Xx0W6jJMlxNcYJCnGNcLq6ijKegoZ4qSys
         E5onw0xZcaJgLT8oCuDlRL/I5qXYgDXVDpPrTITT2GuDj2Sk2cK4ELaK1klI+TsB2fEg
         2MmA==
X-Forwarded-Encrypted: i=1; AJvYcCUlqIb8kDK+nTDslxB3sk7GVNMcNXyBvwS2tRAueT4HdCUZNOu51Y/Nkxp6XTRsQDcl4UHQ6kXz541ou/up/nhM@lists.infradead.org
X-Gm-Message-State: AOJu0YwM4MX5KUtmS5h8+3pSxfsGdcvc9+tlVZBm+R5jlI6m3kOM+nPf
	ZbBHhDjyipVb4n9whq/+iCDuBfVsHDVszRnoWcgTQbuoIxk4ZewHnaU2RrBB26BT41s=
X-Gm-Gg: ASbGncs5HgepI8MT+Vnerlx7ma/0Z/+ZkLt7f1sZ25teJNWLCnGFmm2Ctrl3v+TEdd1
	YexnT3uqE8rRAQ/GeXUdOXa0AKK9UAJdjnwKcUbVcyTVE0Obnbf2zx28s+uGRfy+DbVRAeLcYw8
	RUB0FzOk1J8+v2F5MsEsBk4cb+7lY6v54WdcpFm++gY8UT4lwDXMYlN+PSxK1mSEpEZIoSUCbii
	nrz9b24ZvqfMFnUAt3mvO38u6vtcr/HidF966XkVMEGXBmxkuQ6mbS/QgLsMEp/eZk7Rl2rV1x4
	0z1T6naaepgwWKiU+iw+cMpuwgfQruLBoOlm2ZKrAIjoc6qlgti0WQ==
X-Google-Smtp-Source: AGHT+IFlnKIx2sPK6MrXH51mtosjIEJBmZxPRvw+nyl9XpBpBAq4wOuT9n5DEtW3OFTtEqksbAo5Kw==
X-Received: by 2002:a05:600c:1909:b0:450:d019:263 with SMTP id 5b1f17b1804b1-45201437502mr155154265e9.18.1749558802123;
        Tue, 10 Jun 2025 05:33:22 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:4d:e52b:812d:eb7c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53243661csm12290668f8f.53.2025.06.10.05.33.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 05:33:21 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 00/12] gpio: convert another round of GPIO drivers to using
 new line value setters
Date: Tue, 10 Jun 2025 14:33:10 +0200
Message-Id: <20250610-gpiochip-set-rv-gpio-v1-0-3a9a3c1472ff@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAYmSGgC/x3MQQqAIBBA0avErBvQAYm6SrSQnHQ2KhoShHdPW
 r7F/y9ULsIVtumFwk2qpDig5wnOYKNnFDcMpMgoQwv6LOkMkrHyjaX9RqMWbclZp2mFkebClzz
 /dj96/wDxMn9UZgAAAA==
X-Change-ID: 20250527-gpiochip-set-rv-gpio-5071a2dad129
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2048;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=fWmHYF76bW96bFem7JRqwAgfxRBoy5ySHaPTeItooXg=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoSCYLDKKT/3+Muqt6vpoLhH2yAyeaiX8AvzjKc
 lz6bLAcJ8CJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaEgmCwAKCRARpy6gFHHX
 clG5EADX3eLse0M6879cp/rXFPzvNb0m0LUCg25b/7UyMAlntaEe6vfqpVdDnOymoShonFCkXzv
 UAW5igUaY4Qv+2V2lp3v0/nKaaYeJrOCDfUqrVQOxgrjQbfGFE5/gVuucblr0r0CSv06TL7XYn3
 95jvOjxXJS1R46cvDsFOvc8iY/Ysk5EE2kaHqYX1Zez3Fxe0j+P+AhjsjUgxExgTaYkgj9X9zLp
 Iu+nAJxFgnOojFHrmzm9mK4lntAhEgFQO/F1JWyaM3iBwo9mt6sM1y9VSJTI7BPRFEKas0gge/c
 +WO+kKXAYEQ6wmlUILezREVVJGDIx+bRxn5AIWBFuOd/Z3PfayT5w1/Y9xACMAhzLxl9yx5XesP
 nrKUhNloMEin8f0em+DkP0y8cvuSlidQRetWsqPNH0toyKsndjNNLfj2la3e3jr7a+jT80cJPNI
 1Avz+GrNf2pfgD4bWKTCV/os10gXRX886aWYB597vDmJtcg02a1ir2uHO7jVDLBeCnTA70tWjZI
 N5X9rUNrlBfLU0A2y3Fuu4E2H5BoAFR97vPSCLg63FIrfsm7vPc6BLdNICULsKJ1K+aw/vp9fWi
 KLUZjmJAwGPKjiCr8Wsw4Awh8QL0olPep0PXVM0IxA58xDrvoZkvlp/2/NT0SUetVd8mNoJ6G8j
 rmFYfB/NS4+mWZg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_133326_548522_1E3DEA3D 
X-CRM114-Status: UNSURE (   8.71  )
X-CRM114-Notice: Please train this message.
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

Commit 98ce1eb1fd87e ("gpiolib: introduce gpio_chip setters that return
values") added new line setter callbacks to struct gpio_chip. They allow
to indicate failures to callers. We're in the process of converting all
GPIO controllers to using them before removing the old ones. This series
converts another round of GPIO drivers.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Bartosz Golaszewski (12):
      gpio: mmio: use new GPIO line value setter callbacks
      gpio: mm-lantiq: use new GPIO line value setter callbacks
      gpio: moxtet: use new GPIO line value setter callbacks
      gpio: mpc5200: use new GPIO line value setter callbacks
      gpio: mpfs: use new GPIO line value setter callbacks
      gpio: mpsse: use new GPIO line value setter callbacks
      gpio: msc313: use new GPIO line value setter callbacks
      gpio: nomadik: use new GPIO line value setter callbacks
      gpio: npcm-sgpio: use new GPIO line value setter callbacks
      gpio: octeon: use new GPIO line value setter callbacks
      gpio: omap: use new GPIO line value setter callbacks
      gpio: palmas: use new GPIO line value setter callbacks

 drivers/gpio/gpio-mm-lantiq.c  | 12 +++++-----
 drivers/gpio/gpio-mmio.c       | 53 ++++++++++++++++++++++++++----------------
 drivers/gpio/gpio-moxtet.c     | 16 ++++++-------
 drivers/gpio/gpio-mpc5200.c    | 12 ++++++----
 drivers/gpio/gpio-mpfs.c       | 11 +++++----
 drivers/gpio/gpio-mpsse.c      | 22 ++++++++----------
 drivers/gpio/gpio-msc313.c     |  6 +++--
 drivers/gpio/gpio-nomadik.c    |  8 ++++---
 drivers/gpio/gpio-npcm-sgpio.c |  6 +++--
 drivers/gpio/gpio-octeon.c     |  7 ++++--
 drivers/gpio/gpio-omap.c       | 14 +++++++----
 drivers/gpio/gpio-palmas.c     | 15 ++++++------
 12 files changed, 105 insertions(+), 77 deletions(-)
---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250527-gpiochip-set-rv-gpio-5071a2dad129

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


