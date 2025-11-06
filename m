Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B163CCFA05
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 16:16:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iuhfmQr7uINSDkC4BFuRhNQ4HVMgm7l+cfZeaeFW1fQ=; b=t0Qw2g74BX/DFw/EuL+lf4YZ1j
	IENl5PO05qZMfZNsNLBsplnpCY1e7wRRoCd9vJWAn5r3sxzDNObtmnNu8pLAhh8fp9m2pO4fxJrxz
	yoDMVTsBfbEfuWWq+9wLQBP1GLrXGa40bbEO9r2jwBQ0BZ+eU72T8CGUt23hcGlwE0x7iaw2XEsTw
	mJsM6PnUk+DFFvEIw2c8pNGq68j3SkvZg5AuDQkChukMkqLFJsWPfxVcJMUlXsQgtmy2trD/GQkkD
	cTNI6Ji2iky6XY6v9xk6/4wcYFqSWUCqm9c2P79JgG55bfyQrB54unU2t+csuGhqt61e1yd9wwlet
	rshDYtBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH2fD-0000000FtxA-0YCV;
	Thu, 06 Nov 2025 16:16:43 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH2fA-0000000FtvJ-1DMG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 16:16:41 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-64124874e6dso128794a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Nov 2025 08:16:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762445798; x=1763050598; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iuhfmQr7uINSDkC4BFuRhNQ4HVMgm7l+cfZeaeFW1fQ=;
        b=PfpuCZgoHAGkBvhOdQJydTjp0D5DQclnIG2aNCUoMh+rPYqMD5XhG8jGXmcrUrhaQg
         IKTK4dCcrump+xBGLjrkjU9/0IOPonBSXJIUeAytTXmDBfY6ZA+xBLtq2zkgJf1Ec1tR
         uX3Fde5kc7nvd/NCSDf0ojjjB6PXLfpVAYadONALYfgxdIsK/FV/UTLWw3lfKfrHh38q
         V1X6Lmo7ht4xE9lpxPhuLcwfqq1jXxw01QZhR44tkCCL7APZsrXrnPy5j1f8vvVUQJgd
         7MCUk12Kah7GBPDhBjql3QU9kjxCZg0aJ3kqe2iZVRP9u1bDGVC2lXZYfXyB5a0K0KDS
         3PoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762445798; x=1763050598;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iuhfmQr7uINSDkC4BFuRhNQ4HVMgm7l+cfZeaeFW1fQ=;
        b=hDypvTTqY8GQfrfwW6M+45S/+aaiLsD+ldxJn7/bnCusQsWO9B23avsOi86hpA5u0N
         kuAyG7sycdX7EY68wuGQGdOYGaWLRqdYX0GZBJMuCQLFBjkAz4xtF6pKTCMW9rvFHeGX
         Ev6rfcWB/TYXpgYSTpEeD9DxPUeqvsu1B8U3xvLRu717qCxZ5mlhQOtn5HLB6MpIuPPg
         Vv8pFTQGNli/jaVQL11urk9G2ofXJl29U9OHGTtId9QVAEfe5edy7rTMIbkVRhXHoO9P
         BjpfQcn5NANbjGeucK7PvTFUKrscgzJSJzgrfpyrc4M5pProQSE6dc/gPAiYfZ+0wjTM
         L7XQ==
X-Forwarded-Encrypted: i=1; AJvYcCWegQe4TAz9tI78ZSlzH4fChcblXeHtUnMod6YzwEYWftyzt+flMn9rhMzxRAzqXyqmUGGBvqzLtoKryw+qBeLw@lists.infradead.org
X-Gm-Message-State: AOJu0YwNODsfR/KtMO8CxcwOyS7IIU+Lg9L+nT7CYnfvtF9zQKf7GDWF
	Jf7q7VTJttR/YaHHzlOImWsJfHuyrIvI04sUnRXli9YdwaEqkBmSZTu//CgnsgWKWnA=
X-Gm-Gg: ASbGncuxMRK7pnpupHSOLsbew4d+P3TdGNI2ZOse9mYBRpdnk8cHHz8Eu1WplfyOA+9
	2bv5G+B5fJxInZFzpcF6UT1zIctmJ+QJGSdHZCST9Kz+yChnhj7je4YKtIHME8Kbn/aDBCAcFKA
	avGrxdmqAtDHUS8UamfUEo5WYjqQM/cjWa7cXNm2rqxr2rwdvjKstTPscM3QrA/+IPt0KChIrKK
	9xuJtrAgPGyX1hGIXcm7n7cpRN0xwmS600XKCjvBbQZh0De1ESwZgQAPjRm+ThYXnM1UvWtx2hr
	rrxQMz4f8ezBbjQfD/7XFCeCxpyK2ucFuCGukt08nXf8r0Phg8Ctu1uQxNxLt2z3Pu4kNyFDyMo
	Jgc+8jKFT7aQefzDggoNDUlWJe2w7jjvU3S2801X2jsQ6voy1QNyBSR8af7yCscBySva7DWYivD
	GV3BkgCZA+tHwqB/vFoWuRPNQE8Z0=
X-Google-Smtp-Source: AGHT+IGnKjqzbkhuvdWC2zI52BeV7MMIvf9OsVAI4XiKB15JDfOLSX5YIo7aBUdC8ZUdmjSM/iA6Sw==
X-Received: by 2002:a05:6402:358a:b0:640:be87:a86b with SMTP id 4fb4d7f45d1cf-6411f6b3baamr1693540a12.5.1762445798504;
        Thu, 06 Nov 2025 08:16:38 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6411f813eabsm2113408a12.11.2025.11.06.08.16.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 08:16:37 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Thu, 06 Nov 2025 17:16:25 +0100
Subject: [PATCH 1/4] gpio: tb10x: Drop unused tb10x_set_bits() function
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251106-gpio-of-match-v1-1-50c7115a045e@linaro.org>
References: <20251106-gpio-of-match-v1-0-50c7115a045e@linaro.org>
In-Reply-To: <20251106-gpio-of-match-v1-0-50c7115a045e@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, 
 Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, 
 Srinivas Neeli <srinivas.neeli@amd.com>, 
 Michal Simek <michal.simek@amd.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1295;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=bV1csp2rWHEChhH2wtc+ipip96VeBDB9QOyjlvKNG/s=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpDMne//1G4nx6sAjk0fip9F0NwApN5hshBoZuD
 RHWNh/iIoOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaQzJ3gAKCRDBN2bmhouD
 15IED/0XzrXZAYuaXb8FfmaclQ0RY6jfzxQrHGsf/WmuK02ww2efB75Exltpwwtm91fHOTkDU+T
 d2Kykn+OUAn6bPtd7LG5TSjCDI1tyM+/Nmd1wpAecJLUwG74wFPmu/ofjaxFh7lT6wZihV7lyHt
 8YmM+qnYuUolGhcqcfv7MDurJ8J2Bsqpat4m7N5nHOw++bPTo+SUOojVuhOwrXUI+9kKJ7myKLI
 cKXvLFDL0IOZDKcsJ6iq5nunmneht/iT7YFCKW6+gD1WTJpoziwV/6SXm8XJ6upKBSlnq9KxPSj
 NJ5fAe4+xkXGcBrd5oN7v7sbLM7FSPVyKlmrmHlv8YD3Vxl/t+0CwfwD/YkXVuUYFGOhPzRq1p1
 2eYQ0DqHsM9ulF4ZqHMFaRpLmHwNu1noNDT8MzzuoMNAWW4XN5JJtqeYlHHvlrcSFufrmyWAMpm
 5gZv8IPPiJx3Zw/XyFAwIepY+evhUcdg39kj+D/DVwWnTUGrdKgT/OYrpvvcE3Lxa+MjtAD3lji
 3DB8a4wIM9Y6xyQDaN3gtz5pxIPJGG+kyoN1ctUWXZlnUPRzzb20y01PoVvuhmiyPqOvVHa4+8O
 qGOKxXXWJBJOE+bPEc1yIlencBqk4SY4CpcNcxsvQ8A5Av5IswK60aumWzlZL+3v+oM/XHcxZeo
 xNC7jP93MIRL56Q==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_081640_391479_38FAE649 
X-CRM114-Status: UNSURE (   9.11  )
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

tb10x_set_bits() is not referenced anywhere leading to W=1 warning:

  gpio-tb10x.c:59:20: error: unused function 'tb10x_set_bits' [-Werror,-Wunused-function]

After its removal, tb10x_reg_write() becomes unused as well.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/gpio/gpio-tb10x.c | 19 -------------------
 1 file changed, 19 deletions(-)

diff --git a/drivers/gpio/gpio-tb10x.c b/drivers/gpio/gpio-tb10x.c
index 09a448ce3eec..3c8fd322a713 100644
--- a/drivers/gpio/gpio-tb10x.c
+++ b/drivers/gpio/gpio-tb10x.c
@@ -50,25 +50,6 @@ static inline u32 tb10x_reg_read(struct tb10x_gpio *gpio, unsigned int offs)
 	return ioread32(gpio->base + offs);
 }
 
-static inline void tb10x_reg_write(struct tb10x_gpio *gpio, unsigned int offs,
-				u32 val)
-{
-	iowrite32(val, gpio->base + offs);
-}
-
-static inline void tb10x_set_bits(struct tb10x_gpio *gpio, unsigned int offs,
-				u32 mask, u32 val)
-{
-	u32 r;
-
-	guard(gpio_generic_lock_irqsave)(&gpio->chip);
-
-	r = tb10x_reg_read(gpio, offs);
-	r = (r & ~mask) | (val & mask);
-
-	tb10x_reg_write(gpio, offs, r);
-}
-
 static int tb10x_gpio_to_irq(struct gpio_chip *chip, unsigned offset)
 {
 	struct tb10x_gpio *tb10x_gpio = gpiochip_get_data(chip);

-- 
2.48.1


