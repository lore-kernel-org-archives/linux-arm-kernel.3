Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CE10C8303C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 08:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qnquyqvd+FVIVtLd1Ux9gRwnVLnxC1Ivy7WluAJ5AJU=; b=g823vnldGCjJ5GWgHOc35KIFN5
	YEIB2HTC7CvR4Gg28QO7OzgnHXEEjo5Q4ctUFlai1e9Ti2AQwJU/vp9GH5NIncuzMO6EMFa9l1nys
	UKaoUtsQ+E9fvz8edtZBT6mMIhgJY7TWyCi79irF2rZD+riM9rG4+uzGH4FvfnUVIiCqwof6oBvYA
	dNZoVn4/toA4BIwXc3TRME9tFOZoQnvyWoJx2ndNAFB2cNfVMw/TStgi2UoKDWe123m9gQ2Ai/dle
	u2s62pC0864zYzq+Pzv1ya/V54lxK7yWyc6CphLp14lSj2ONNLB4UBy3neEp97XuUcSmrQpxyOhrw
	9HZeoZ1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYhTC-00000001srY-1o7A;
	Mon, 07 Jul 2025 08:45:02 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYgcQ-00000001kKD-2aoe
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Jul 2025 07:50:31 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-3a54690d369so2769856f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Jul 2025 00:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751874629; x=1752479429; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qnquyqvd+FVIVtLd1Ux9gRwnVLnxC1Ivy7WluAJ5AJU=;
        b=E2lNlG5xXYQmdE0t8yZ5xfpIojuhZEmLXUCHEAQLPiE4/kECuCYwWacBGf1cSUC+eC
         AMMMA9FWzsqthF0PSBB2oX34+7zPPCZVtUe4kUU0QeBxrQkc1e6E905+vc8szg4mq8oM
         v/dgnP/ll0YYv7H1YBnIUpbfoWSVZ+CJSVuTgp1nBS5NZhmXcMQo+qxT9T1sqkcaGZ6r
         JbQAEC8G2ZM4IV2OfxULDbrgs09TUnhsw1uI1Ds5zU4RzPATF9oFXSeVotrNLCh05/vg
         vNR+d+wR4X6sa8P1PhRjjR8Vn6rjvih3n7K7y5hKG2zgPM+i2Jz/4IreiEyYC6g5GQ9L
         V0eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751874629; x=1752479429;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qnquyqvd+FVIVtLd1Ux9gRwnVLnxC1Ivy7WluAJ5AJU=;
        b=ZLG/WT7RHnaBJboa9P/28sWeJ/9agxSFirNaf771c4rZOyc3dRNxOsnKwrUYPBWT+0
         ZsrA+D1t1zI4jtHKCvx+iX75r3Azp9IVANe2hNfWN7AHlJTF4A+T4vwOhxr15jSu4BDj
         fwTtYVUMmTRi0d7+cOEKQvVV8cs75Y15hgeriThyVqMlIonimG3hLO7XE3TGMoGL6/7P
         8l9pdTHtQGypdahPgPHmqtQ4iPnHGabOlxNOal7PN1jMJw7Adi3Wc+BwE/OSzjGK3Y/Z
         3i/vOQ1lwJf5T73lKe9ByGkq8xZ2EX6VnXhCcotbWjmJBuXgnJjd8/Y26/Q2AZOXXhXz
         FyCg==
X-Forwarded-Encrypted: i=1; AJvYcCUIapT4S31PlHR+BRGZnbQQsBJH9AWgubY5nCtRZ3qv19vUBFFfCJJGtlK+KCkU4yePvdFykAWi/Bv0TAYXxrol@lists.infradead.org
X-Gm-Message-State: AOJu0Yytc0ieSL8dtCSUtbEQfIMTFYJegzFBEV9STVfwABOFa3oGcKW8
	Mi4ZNwa2V+vwUJG8TtD4DKFOYicHXoDwDiop0RR8AWjxylS6ce3lYcnhCsTM1W2Lkws=
X-Gm-Gg: ASbGncs5zah9Jjw8LzbgolHii9KBB3PPir0f+fth9ymLmk0uLutke9DB2Qkw8M02ceE
	fVq4Z4BMu00+D/as6h+IGFmN6v0Pxr5uGoWjNUtFoK1nGZA+ReGEHo42L1dN55WjaBpTHphD5ta
	YpQMEhUwo4asnYeNmsbKxndWbpsdoPBrMm3puQbHhi2/XxHOJxRmTXgwym9xyaWM+88/pqtte2j
	Nufj3pBxzRcKfT29EqOicpdn80GOLxIFd4T0APib8lB+JJ9a5LgtV9AIbM9Wt1b5XDMcy1GLzob
	kzvnGd8ntREDnxawmchL3fBVS+wvWQTaZbf70eHlcH0hVQAIX244HiGF
X-Google-Smtp-Source: AGHT+IHgxOKlD/HCW2fuVG89O4d1zyNRJfWgVpguHMzHEibk0vk9GJEv0seQmb613A3MAdd1OnnO6g==
X-Received: by 2002:a05:6000:18a9:b0:3a5:2cb5:63f8 with SMTP id ffacd0b85a97d-3b497029583mr8019614f8f.29.1751874629034;
        Mon, 07 Jul 2025 00:50:29 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:3cf3:a61f:85ed:69db])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454b1893479sm104215455e9.39.2025.07.07.00.50.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 00:50:28 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 07 Jul 2025 09:50:19 +0200
Subject: [PATCH 06/12] gpio: ts4900: use new GPIO line value setter
 callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250707-gpiochip-set-rv-gpio-round4-v1-6-35668aaaf6d2@linaro.org>
References: <20250707-gpiochip-set-rv-gpio-round4-v1-0-35668aaaf6d2@linaro.org>
In-Reply-To: <20250707-gpiochip-set-rv-gpio-round4-v1-0-35668aaaf6d2@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
 Masami Hiramatsu <mhiramat@kernel.org>, Viresh Kumar <vireshk@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux@ew.tq-group.com, linux-arm-kernel@lists.infradead.org, 
 virtualization@lists.linux.dev, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1694;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=Hxwco5xikujaT/ZxkZ/bggRaPqpzZXsQM3Uycdv2rNE=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoa3w6jCJ38rKBLEmVT/K9IQDFTn/kWS7yzy5e+
 8+YcbST3eSJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaGt8OgAKCRARpy6gFHHX
 cmJaEACRTemPq7dQtszLFYGQQhrB8GbuvRBdwmylDUTUzHrV0C6NHTU/ixPtpoV82APcyrZBhoA
 IaeLMDdzRNCMbbppt5EVyfM3nMcxuXYbynZ5TqSETkVvGWRD0PKDVcB0uguMi3/9AGgztW+93S2
 1ULcFIewGcEFwSAMT9jPQynovXVkg61ZXo+ag8i/ZHKM6ARelvwNFXZC8itqc6duqYu0RrCZa4x
 h8GYZsy3uDIPyqlBkdo1sMQTHr0/mtzzpfoI7ej1PZS9bdh/wrA7J+QsyMHSDWA3vtVlxF0OryA
 nbXpATzt5JDkV5XP0cih30xwTD/AdEfsbCCPH/7bPVxHLnGC7N8q43eYBjEsQYLUZ4l4j5p/rkW
 duJ/fTvLljmG6LgPNWmchFPUUmum/gk6JSQm8YGGOAEeRFjBsLuLMVGOCUbcw6BeCJBgC6ZPoW9
 rkLqRLCW8Ut0txVrIjT9GM6vGuuhNkjSq9sq9S629v/BchbbBqH3PLaVoVEIyL3RUtVTuFFoFjf
 8hFON6qCC2J+k1O7URKJ23Z5spVoUEJLuLlwY1pyfiVW4bHpplLH1y9RgylYZ8RJTMiPQfHCTI3
 WnZ4OsWJihB8iUPMtsW8teAk7g66+Xd3TPqUF3grAcJgLyc8qrsJCfNsINEmwC10yYtCL82Yfnl
 UisioaJnKelhkhA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_005030_670664_730DCD84 
X-CRM114-Status: GOOD (  12.09  )
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
 drivers/gpio/gpio-ts4900.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpio/gpio-ts4900.c b/drivers/gpio/gpio-ts4900.c
index 5c806140fdf0d6e60f2225824aa18d393f61b607..35dd2d09b4d441256f01d9ac762dd3a2f0a47352 100644
--- a/drivers/gpio/gpio-ts4900.c
+++ b/drivers/gpio/gpio-ts4900.c
@@ -95,16 +95,16 @@ static int ts4900_gpio_get(struct gpio_chip *chip, unsigned int offset)
 	return !!(reg & priv->input_bit);
 }
 
-static void ts4900_gpio_set(struct gpio_chip *chip, unsigned int offset,
-			    int value)
+static int ts4900_gpio_set(struct gpio_chip *chip, unsigned int offset,
+			   int value)
 {
 	struct ts4900_gpio_priv *priv = gpiochip_get_data(chip);
 
 	if (value)
-		regmap_update_bits(priv->regmap, offset, TS4900_GPIO_OUT,
-				   TS4900_GPIO_OUT);
-	else
-		regmap_update_bits(priv->regmap, offset, TS4900_GPIO_OUT, 0);
+		return regmap_update_bits(priv->regmap, offset,
+					  TS4900_GPIO_OUT, TS4900_GPIO_OUT);
+
+	return regmap_update_bits(priv->regmap, offset, TS4900_GPIO_OUT, 0);
 }
 
 static const struct regmap_config ts4900_regmap_config = {
@@ -119,7 +119,7 @@ static const struct gpio_chip template_chip = {
 	.direction_input	= ts4900_gpio_direction_input,
 	.direction_output	= ts4900_gpio_direction_output,
 	.get			= ts4900_gpio_get,
-	.set			= ts4900_gpio_set,
+	.set_rv			= ts4900_gpio_set,
 	.base			= -1,
 	.can_sleep		= true,
 };

-- 
2.48.1


