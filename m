Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BB77CA100C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 09:18:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BTuRpSb/cqzor7io9mL/6axrUs4fHV3EPX6PfmfRG/o=; b=Fb0qSTDUkl1CqMoZSx1LJuDE+r
	x6t/MVu/EZjaa1qacj1FSpJRju8u/XO7RxjFyl6xtLnEfPfLic06gRUcgZU3nXZiA7+WlSKklxU9R
	uxE3N68bKvAFv3OGWtq47M1avCE6g5HRdKA5RlKzMbCS4ATR/CkZeBso5pogV5+nM/Qzd+AFsNJJ9
	fReYV//fpoI9yJ7MookgiupqMkQQiXZf+KIb7XjHkifaSZZ+2q4TJ7yFmNcZeRlGDzpqc4kagMshj
	buH2K+4Wfy+mSRVDkSf+/GQcyvLVW7mubso6Hpu/iLBK4CbUopJtTBlf8Hwx+EyHqXXlsalc7IjPf
	j+Zp3zVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utjdM-00000005uTY-0mVv;
	Wed, 03 Sep 2025 09:18:28 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utiPs-00000005Lkm-2mcY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 08:00:30 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-45b7d485173so38448605e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Sep 2025 01:00:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756886427; x=1757491227; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BTuRpSb/cqzor7io9mL/6axrUs4fHV3EPX6PfmfRG/o=;
        b=UKtYCPj+l3sR128P0ePRA4iLC3OtO16qR3rWkGliWGUOu7ixEMB1OhjklPlhfQp8WG
         59Nn8y6loqAGfF1LuU8CR71839wwQ68o8zC6KNs9XwaAbBvnk/gosFp5Rp1wmhRnaBdu
         t54fEh6nqotnYiV9xbR4z6Pa4XqJ133k7ZeeybXz+RgFVC+ugaOqUfFIZTbzqr18atY2
         N4FA3WPAdvxv2udckEkUGwTpD++IydJ+p8tXzJnOioaM73cnKqmpT7Bttl8VMyFTo52e
         YiQ5+CcNWm0fPKKWLlKwb5+gPb+zkHVCsgiFhOWg5pL9VJnUFSOxT68gJyeiZcO7+LdG
         vp1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756886427; x=1757491227;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BTuRpSb/cqzor7io9mL/6axrUs4fHV3EPX6PfmfRG/o=;
        b=uRJj41m3Y3SiktY8e3VmtDrW8x0PtbD0e1C7HsaR30OeamCQbnq0v5CyQhWh7lp56b
         nxu70WudNZfbdcmkjdvD0mXMDhXbEc2u+P7SwFiWjtiov0QSu7J40Tan9FUi4EXo6GB1
         d+gJxiN1FC+M/e4afOC+RuQq0IGeS1/ltqyDB8Zi5xGxKlZ5w4qq728j0bvJl94E6JhY
         jrcONa0eaiG1GS5UItjyWUtXWuuG6eydwm09ON+8zOcR5RmI0P2UD3YXI62bZMhAQNZj
         /c1EpzwixgBiXuurkDy36tjNlnUVw60A50zOsVK/N+vw4uK1tf8einu2pG9q7066c7Vw
         Y09g==
X-Forwarded-Encrypted: i=1; AJvYcCWqD9ymFkCXrUCAXFk5xw/TsFJe7wheqxQ3rm+y1yS+0XUNA39A/lwfMEf2R78AuyHNzOQbHnzPdopPjSuaUlMF@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9PMcPgmxnMhm1sZmyV701fqXYfc7cUPmeHjBuKH1uO0VaiowP
	mURhSNVvO5OsEs0XhekJNND/4/bRWLT54des+RhmKseQNRzkASgkwWflbyfyAV2dHk4=
X-Gm-Gg: ASbGnct2qHja/t+dnY7Woxqn+E3jGcF2uv1O03yUFOhAVLIcyDqRKc3gBQEn+j8ARjd
	fOHJHaXcczB7Bnqtu7DRmmY2+gtQIfN3sgMa77f292piS4ws3zbUAatUjaP16YzCfmz5ZC0sWbM
	yXvV5ioe90ZE+qvvi3JQs59JlJP+4dgPo4hHirqaW3P0TeILwYwfjD1vPLqQRuFOlLgtsbq+Qbp
	Sqv03oCsIm1Xouckv0qUYfSU2htSlU/1fSbB0MwvhiEBduqUGsefpsA7nZhchU+xLonJ+C0n6fe
	MS4t4sNFElUFcjclyPaLTXJVX1HPA6Ts+/bgI3BSTuuhOv0n5mo1VSzVSaEo2mq5ytfAgs5p62Q
	fRdAw0QVlhNhim7SSwOhuLit0F1g=
X-Google-Smtp-Source: AGHT+IEEDQfAylHCOtfbDJfAjy6O++lSjcwcu62QI8WIck14KRu39Vhmu2za0cVtvDIlQTaXtZ5IFw==
X-Received: by 2002:a05:600c:1d1f:b0:45b:8f11:8e00 with SMTP id 5b1f17b1804b1-45c055e1774mr27463845e9.37.1756886426610;
        Wed, 03 Sep 2025 01:00:26 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:2f8b:4799:6bd6:35df])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b83e954b7sm113331635e9.1.2025.09.03.01.00.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 01:00:26 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 03 Sep 2025 10:00:10 +0200
Subject: [PATCH 06/12] gpio: tb10x: allow building the module with
 COMPILE_TEST=y
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250903-gpio-mmio-gpio-conv-part3-v1-6-ff346509f408@linaro.org>
References: <20250903-gpio-mmio-gpio-conv-part3-v1-0-ff346509f408@linaro.org>
In-Reply-To: <20250903-gpio-mmio-gpio-conv-part3-v1-0-ff346509f408@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Linus Walleij <linusw@kernel.org>, 
 Imre Kaloz <kaloz@openwrt.org>, James Cowgill <james.cowgill@blaize.com>, 
 Matt Redfearn <matt.redfearn@blaize.com>, 
 Neil Jones <neil.jones@blaize.com>, 
 Nikolaos Pasaloukos <nikolaos.pasaloukos@blaize.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=810;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=KKi5iBWXbZE+HQVIiNlH30Zpf3I7GR7YN3wH//ihyCk=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBot/WRSZbQN81jQTxh6MrWPRLLtHDK0Efr6Qker
 rgp9pyu1VqJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaLf1kQAKCRARpy6gFHHX
 ctddD/9w00XQmxkA4UbvnoqaIlfr7D/wppS64eGYxPzqjHvGw3IkU8d3roaKZGJMxSTP5deq4XF
 w6FBq5C2OJCqIehX1vMSwcQrKGh/nb5BOf6dqUIb2eN4exlRLIITgszMDJQiONRB5N9i5F17hdR
 zKUWoJwzBmPSaD9kxblKle0/wVP2FTg81Xtfa+4rMAna/YgbNYkkwOXUUFa2csQcORy5zAUmw9c
 SX7lKoJzIeLOdayzSxDxZkNe1R0sKDKEbKO5nrfDiQCVMwvP662f3z6VeKkidRSda4+qz6m1BQ/
 JMXa10H3A3oedqoufmB7tihVaQmOXTLiy260HEUhY1mDZiyn9+/JOlXer9YU3Vs7qJ1p+QveleD
 +wrD58nySpKLxYjyIygyXNbVgDlll3jd4Pd7Chs3+jOt5ByNmTGduUYG1g1uZGcWbzUjyeEOfXR
 jEXa+KqoVCFQskb/UiNXrOS9vOHce6mi6KaQhPJozeTrtzrurBXCtbq5/s4HQY9nQSs7MH69dFJ
 7yK/3c8Oxwp5PvcfKvMFtK83TBpFAqsxkRs3hyJphw6BWvCR6WJazuknDwF2fWpmZhIx+Sr6HHi
 WyXgujybN/txaCIugikN3gYBNJYra6I6brjZ/vclUUJLZJUspKhkXdiYjuyQdqALuGG/lH8e44J
 2ljwHxU9L8t39JQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_010028_711906_EFD2E157 
X-CRM114-Status: GOOD (  11.14  )
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

Increase build coverage by allowing the module to be built with
COMPILE_TEST=y. We need an actual prompt entry in this case so add it.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 0fd5b09c499ac8468269b62a306f9ec03c3f7a9b..2fb77eff3b1f2e862a81eb77f2d4d8f14c27873d 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -734,7 +734,8 @@ config GPIO_TANGIER
 	  If built as a module its name will be gpio-tangier.
 
 config GPIO_TB10X
-	bool
+	bool "Abilis Systems TB10x GPIO controller"
+	depends on ARC_PLAT_TB10X || COMPILE_TEST
 	select GPIO_GENERIC
 	select GENERIC_IRQ_CHIP
 	select OF_GPIO

-- 
2.48.1


