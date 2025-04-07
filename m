Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2218EC36010
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 07:15:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P54VA/QfQ5VWCZa2DrfOM44F5qJ8PR9WzkkmyLvWpKo=; b=JoJpR+wK82lc44dtu69Vu16A3y
	h/O42UnOcsIZZSp8mTnXEwa3GvmGKAgbsuYtRMBZkzpu4Ay9zBqFMWLWlTJI8WuWBOMGDsqsGHBjh
	dKFg8ot35m3nAJqPSfO6DMQnwWRpOqdOGHOINBXzRvjg8pw4JIJwg7oLMppEnQs6yzus0LgKXU7dz
	qmsbKAUg0rB2MOkhgC+1kd74lfrCQ2y1RBr4RkzMopnwB8fnFpWgtTRQThSTKA5c7SFC++3/sSREK
	pexOmKG8uN3267T57xuq8g158StDLwZgWfrvbZteb5rkf4djxDRGkPQgn5OXr7ewAiPIVg+ZN18Cf
	GvD7C0bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1gh0-0000000GhqL-4A4v;
	Mon, 07 Apr 2025 07:14:50 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1gbp-0000000GgS9-0Nx4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Apr 2025 07:09:30 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-43cf3192f3bso39855855e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Apr 2025 00:09:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744009767; x=1744614567; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P54VA/QfQ5VWCZa2DrfOM44F5qJ8PR9WzkkmyLvWpKo=;
        b=euOLtTeaqSgeMDntojDiDHdjgyqNhpzlAhHtBong3cnsxy4GenoY9iRhgYA85YyGSQ
         0/wOIZRQptiNRdEzwag9BK104cCw2pLWOMlXW1zUaqq9BBmBp6Z4aMD2UpIO4eDdspcm
         RwTzE896nMuT4A7fUB+IChx2+GrfpOUqdl5vRFM1bqxWwgoIjD1njdFBBkkWqfTlf9FB
         1xUgztiCPorWeAes+tSAMWKokC4soJUARijlyBetgj5LEgF3T1aejrh3GCrkLrzDbZ7q
         Zc1jEFvHoEeYYRZ+fDAtTjKgwctH6qzkT8ADx5rE9kD2E9iogVK1OOBE1eUcM/adyyV0
         n1VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744009767; x=1744614567;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P54VA/QfQ5VWCZa2DrfOM44F5qJ8PR9WzkkmyLvWpKo=;
        b=dwLKWnf7l5osKMO0Eks+GGNfpYhO4m+L4k66ELsD8s3Tty+ZKmbTDD6XEP2meLFdlp
         jdTXS//fZ2/+Rmo5+ZyeoZGReeQmAyfrwCE5P8WvcC3PERMP2QiwX1G5CK3LRt2nq8I8
         jYBiPUka1kOtWO7LshzGphVM1Sa8GC4nN7C1IHhOFCOVO5Db/RKtcSCAECkMunP9Jtbb
         HpqHhojjwAaAhnDvqCrA4tQso+8x7wrHGON5ZuVHOHqRYX0YmbRX1RmX2hcY6u7VjW2L
         FVex1BB95f/W1fUMKMzJpJj9JLG65M5xiK2dSNZ/MYfaf1KPcCwS/ySa8tlcyts1Fn0K
         xrGg==
X-Gm-Message-State: AOJu0Yzj7OElmri9UYR9LetmMQkWrpd9TGCz5siTggX0cePOSz+JSbBC
	/fY4k6Osp7ukNotgt3K8T7rz2Umoc/xG3IGbCBzKSODODi3gSqPdMQQEz6LPU36Zx7E9WIH7sF/
	ajv8=
X-Gm-Gg: ASbGncslAKQCUEjTrLdZ+AEXRDXVJuy2GP5u8hooiBt6WecsVGOPLl/5oPRUC7XtQgT
	gQ7bHhUvGmcRJ5P1vPK6omijSOG0haTSeUSgJq58s/tMzTKlAOsPj+mqtxo3WEdPCpTJeoziJ6c
	451/xFXMxbhwiF3YmrARS252bIo7BzTmC2Ksd0GVHJ7pUYRXVER5DfzNT4Nq7RbpqxPAINY3yNK
	IQvQ1SzGg1yns7j2fIPe/LTW4PPBAgEg7ju6tcU11fGvlqJXW2AgOy3lGU2JNibEWoUKCDLsrPS
	/czpitcrM7qtroEz4ls4FxJp/P7yNRxRhXSH9Q==
X-Google-Smtp-Source: AGHT+IHlbYVaSeQ4i6pCJ+5QwB6SPB1j4w0/Dq7AFXUieSOfltPppg5yQl42lc4SWdhOL/4TY1MnaQ==
X-Received: by 2002:a05:600c:1912:b0:43c:fcbc:9680 with SMTP id 5b1f17b1804b1-43ed0d98e11mr66774425e9.25.1744009767393;
        Mon, 07 Apr 2025 00:09:27 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:8c64:734d:705a:39a7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec1663060sm124622795e9.14.2025.04.07.00.09.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 00:09:26 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 07 Apr 2025 09:09:19 +0200
Subject: [PATCH 2/4] ARM: sa1100/gpio: use new line value setter callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-gpiochip-set-rv-arm-v1-2-9e4a914c7fd4@linaro.org>
References: <20250407-gpiochip-set-rv-arm-v1-0-9e4a914c7fd4@linaro.org>
In-Reply-To: <20250407-gpiochip-set-rv-arm-v1-0-9e4a914c7fd4@linaro.org>
To: Andrew Lunn <andrew@lunn.ch>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 Gregory Clement <gregory.clement@bootlin.com>, 
 Russell King <linux@armlinux.org.uk>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1726;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=xsWx6NHlIxnhL6jtmZVFoxqhJ5i8IDr9WwAEXelZLcc=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn83ojCLYV8dzwcSNLnX4bkKX+gH1+RDkz/zjfu
 UvxHKlCXuyJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/N6IwAKCRARpy6gFHHX
 chMGD/9WaglQntxBb+rFUYx9pTpsQhM2cuIhUhgxNCX/UTl/3szgAcD06UaZbzpECecUIUvcZcf
 xHvg9m/8zUqjvoulvOdHUUhu1M/64mJr08Mc59L7LYUNUP5DJgPZnDIFvclIIyXxgl2/R2TD2gb
 W1iJTaMePwcZgWSB00BZBRYxN/q8f/2O6XISU6cNUdJ0zYvgkW9M9tZhSzGQ65VB2MsoracdfiO
 Isfwpu60HyoH7bKqnCU3/NT3fn472ynWuWAOAKCLl5g5Bkv810i9mWpnLDn+db8t6hU86JhbldJ
 l/BNF2J2U4O74bHUDEVQwSDyvbHN1YOYCsTfOLgvQmlU7umqx+iCfPGsaqpp52oYItloneBpuWv
 HKWWkhv2YftZY44ytOEUa0y1HknhvANP18iKzjY+k4ZouGO45TXtsRrtHsYDOLk+c/DhqwwOmPF
 aDX2XQ3DsiwI6Jx3zvTNp5vT4FYSEwoSroABjT7ADXDkrS0mfbIwAAPYt60KWKhIQgj3OWAXJuM
 0a7oF0P4c5rvq5KFVG9hl6GsbYufNkx6PVx+uslfrKQBjHZuV0EL7wCO8V6y10cEZBBeeUTTK+n
 kGGs5+XXX1fhdeD5Y3suIaahWADJWI5MkDd+0OajiUpvCEENwVBvEsmdNIW0nm3nk7OTSTKfVTD
 wjA0QNCPuSn2sHA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_000929_135530_7AF0B391 
X-CRM114-Status: GOOD (  13.64  )
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
 arch/arm/common/sa1111.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm/common/sa1111.c b/arch/arm/common/sa1111.c
index 9846f30990f7..70dca9937644 100644
--- a/arch/arm/common/sa1111.c
+++ b/arch/arm/common/sa1111.c
@@ -563,7 +563,7 @@ static int sa1111_gpio_get(struct gpio_chip *gc, unsigned offset)
 	return !!(readl_relaxed(reg + SA1111_GPIO_PXDRR) & mask);
 }
 
-static void sa1111_gpio_set(struct gpio_chip *gc, unsigned offset, int value)
+static int sa1111_gpio_set(struct gpio_chip *gc, unsigned int offset, int value)
 {
 	struct sa1111 *sachip = gc_to_sa1111(gc);
 	unsigned long flags;
@@ -574,6 +574,8 @@ static void sa1111_gpio_set(struct gpio_chip *gc, unsigned offset, int value)
 	sa1111_gpio_modify(reg + SA1111_GPIO_PXDWR, mask, value ? mask : 0);
 	sa1111_gpio_modify(reg + SA1111_GPIO_PXSSR, mask, value ? mask : 0);
 	spin_unlock_irqrestore(&sachip->lock, flags);
+
+	return 0;
 }
 
 static void sa1111_gpio_set_multiple(struct gpio_chip *gc, unsigned long *mask,
@@ -613,7 +615,7 @@ static int sa1111_setup_gpios(struct sa1111 *sachip)
 	sachip->gc.direction_input = sa1111_gpio_direction_input;
 	sachip->gc.direction_output = sa1111_gpio_direction_output;
 	sachip->gc.get = sa1111_gpio_get;
-	sachip->gc.set = sa1111_gpio_set;
+	sachip->gc.set_rv = sa1111_gpio_set;
 	sachip->gc.set_multiple = sa1111_gpio_set_multiple;
 	sachip->gc.to_irq = sa1111_gpio_to_irq;
 	sachip->gc.base = -1;

-- 
2.45.2


