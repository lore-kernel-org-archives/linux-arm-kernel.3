Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AFF1CCD194
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 09:09:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=giyJvu+P/c/zBlzgMeJooxdfh7qZjl2zxl4gZFBxF6g=; b=nqA6IsH/zVZ8D7hBEixfFtIYna
	AAikqNivFHmDtThEPaTXAfw48sN5jLFHG+IktnCJH8ifaD7Yq0Wswwv0bnmz9aSKQVT9+Ys7WC6hf
	z3T1xbktqz6mHvOH/6PmLIAijq/Am4xYsJhywR4T8Dg84p2/72f3nVGb1qPVPpL3xtCnCPP3YNjki
	ZRKaQ9enFvGLKvl0YBC6Gqd4/tV59BcNvPbaVeFWE0siLY+8ZZQsn6VSFAIQA+wlo7DS+gQ51ojRR
	coRXUnu8yZFIuJO2maBxeQwc2Rf0YwauJyPAdXXda6tpQn/Jj6fLbhlkTvZSjtNa8/YIaYdyLY5kE
	kqtywhuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9JzZ-000000047i5-2VwT;
	Thu, 16 Oct 2025 09:09:49 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9JzP-000000047bV-3oKW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Oct 2025 09:09:41 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-470ffbf2150so8501755e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Oct 2025 02:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1760605778; x=1761210578; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=giyJvu+P/c/zBlzgMeJooxdfh7qZjl2zxl4gZFBxF6g=;
        b=nrsTIB571ZM0mU7krVB1Dg5hbDJyyjiUbjWdZ7lR8Sl8SC8e3UUPz5r+PULXyO0+xo
         Th8q9+JMhS2SNIbmkkfpjjtL2iS2MlnfflNuTmNeT8QmOnnRm6nA2gREu47aNdGi5m9t
         f354HQn75R1+Y1LuSeyO/M9Tx3Ql/b/xa9AbwR86oXBOxcDpLdOPtEGXlhOEI4rw7i3h
         u5dx1CsKxhKni0GLlPJnDW/2u+8EAsS03msqimNSKlDT0MEreICvLB+0X2YrrI2JEqRq
         IPz3RfvZV6WfAECbXa5V+DLrA9Jl6o688pjnZhWWa9FDENU3go0jECbL5vHWIewxh7n1
         jw2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760605778; x=1761210578;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=giyJvu+P/c/zBlzgMeJooxdfh7qZjl2zxl4gZFBxF6g=;
        b=llOynpSsvm3mXR8zPc4ecpl5XjBFxpz74RcJjtlanZNwE9QkrVLXfMREEGhfhNIzod
         cvE4xU9fzw5Kw33hFHC3rdwc7f/6NeD9/cVYDD6t4LycSyvE8V0+R+kLNx6j0daVxKbz
         GFqOLWWDKhfTvx6XErfjRvlr60LAOXnuXelilsrW5DBtZKBcUPlPPe4hlIyowRv6+hmb
         IaPiu0mupqvuCDMKGdyKx2Sb8ksm6Nh/lnXmT/F+yrfVvUfh+2UvhY6QfsRLXIMIMXQS
         5s00AuA8MpX6czSchasu16L8pg4wmSqNL8mMq/LTbsfK8Bka5kdEup+o4doDU0YcS+ag
         eGAQ==
X-Forwarded-Encrypted: i=1; AJvYcCX3mcWGEAeF6AGKVxj1gTu5wCJMQHR424kCAJh9r7Vwrb3g972HC9ecmaV6jOGkTFKcsLMvgpK+aKjqHs+sHKh3@lists.infradead.org
X-Gm-Message-State: AOJu0YzIoSZdLtFeASjBYNAFUkDw/WKLcOb8Ungt8QmnPDvfKWKg1t2g
	10/pb1MCnw/0rcPYpe93t4lCx9y8scJHaXhjZ00geU4BgmbTUd8biAwbFfPp2SyAWyMMIvr+bX/
	RvHaVq9E1YQ==
X-Gm-Gg: ASbGncscK1kfVvYKI07qeRn64J8pDy/GMsA4TkNFRtZXw46oBP635VA1Ay52u/wCTVv
	P0z69lYzTX7w2XS6INGrDw6RnhxfSMd39GEnhkoY48W/XABj89CTAf81AZGPPAogL8fRD4yKlbq
	YczTYCKco4l2KbUUL7Li+o3wF/eMiv5vVNgPdYPpzUChjvFWEM4W6Kla1xI20W4KrqfpZ7LQ/0Z
	G4gPMEU6yOQ/hx+XU92wdGiFOEKxmrP9Yc+5shvt6JzWKXdqt5xffKqjiZpbm2xX6uNNk5vvxrU
	RKTcDlWzwQY0aPEXXdlen8B9BwYKEYPnrMqOoj2loT1vXYHa1/gOLrYB/G+q1Exad1hJ6uN840U
	mSChGWWqpskQiSaJVWEjSFZYj6t8ZWpPrIDlDTZRUwBoJ27CggWP36WxEskeJA/h4NYavqyQ=
X-Google-Smtp-Source: AGHT+IFwQ1Vj0TPDw4e4cKls5YWKHTovuMxKu9ae74FALGIc/dMLGZ2EBvJ6JtiJA1WjhvYyV1IDeg==
X-Received: by 2002:a05:6000:41d1:b0:426:f9d3:2feb with SMTP id ffacd0b85a97d-426fb7ab9e7mr2401645f8f.23.1760605778274;
        Thu, 16 Oct 2025 02:09:38 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:ef97:57cb:86cb:f7c4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426ce5e1284sm33191287f8f.45.2025.10.16.02.09.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 02:09:36 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 16 Oct 2025 11:09:27 +0200
Subject: [PATCH 3/3] gpio: aspeed: remove unneeded include
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251016-aspeed-gpiolib-include-v1-3-31201c06d124@linaro.org>
References: <20251016-aspeed-gpiolib-include-v1-0-31201c06d124@linaro.org>
In-Reply-To: <20251016-aspeed-gpiolib-include-v1-0-31201c06d124@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Kent Gibson <warthog618@gmail.com>
Cc: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=807;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=AnELVPWhjXwv4nNT8oy1ky6Ra8SlMALj94FDJwWeEnQ=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBo8LZMRCng48xJlmYCAnXgnelIsEpfURlPAafHW
 lkDOwc8RISJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaPC2TAAKCRARpy6gFHHX
 cjRHD/4gn97X2frtT0cloiZdcc6gGioOaf4UKJ2xeM/W83SKU24VRhJufxQDYnRAKZUHwS3vM0i
 5xRJI7ZSCBEnwcdXUYP//E4XMsNeG6l2QtsNGOVTiPZbHyJ3ABGl3gUHq0Yo+l8hgkzmtee8CBv
 izSfKQzKXubIdTaHH4hPG36fHFwPfHqYfWgy2SJhEsD2fqmKm/2bdpMKZFQ2b0rQaCjWjMGSCEE
 SnR3F25qf/1xIPbT41uHEwbR4AYuiNPe0jb1OiA9oZC/8zrXc2vuja1rUHsCdGJ4FJ/oZA2c1vw
 gh8Op0XLF4Z01G1BZNgc7VHxLvbokm0xXzhbogh1mi5KTEkK9F+Zt9N24rsbha3jTZkDkidO6zF
 jymTl5YWnc2pOmONTe8zmUEC4gwXBQWj04uOFs2iUw69r3/q02w6dtJkPdV02tyUVE6OFS9HA9i
 XysJDFCxs6ffsLaYUNaL0zsTTHARF7WVLqqp2wUNjix0lAB5NeoIdGq3cUo454LYGRt5Op56xs3
 MnmGoKC7rP88mtSv9/zVDuGuNW5gXczxzLEMiwfkRkEQlIjuSqHTuTPDT/RcD5cmX/4Zzclpi0k
 LBdw9fVriRvRaBoxsYsIScwPxGHPGgGrEpmwKx6qgVMDvzkur6TQ5U6cJXuDRKo2sOF6Xa0n8H6
 uysm6NlVANuLgOQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_020940_009692_1B024DA5 
X-CRM114-Status: UNSURE (   9.74  )
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

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

This driver no longer uses any symbols from the GPIOLIB internal header.
We can now drop the gpiolib.h include.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-aspeed.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpio/gpio-aspeed.c b/drivers/gpio/gpio-aspeed.c
index 3da37a0fda3fbdcb8077c07706aa41b233e9beeb..2e0ae953dd996ec1dbe7585c4a92f28622f8e39e 100644
--- a/drivers/gpio/gpio-aspeed.c
+++ b/drivers/gpio/gpio-aspeed.c
@@ -29,7 +29,6 @@
  * access to some GPIOs and to arbitrate between coprocessor and ARM.
  */
 #include <linux/gpio/consumer.h>
-#include "gpiolib.h"
 
 /* Non-constant mask variant of FIELD_GET() and FIELD_PREP() */
 #define field_get(_mask, _reg)	(((_reg) & (_mask)) >> (ffs(_mask) - 1))

-- 
2.48.1


