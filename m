Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80145C83F07
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 08:33:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7KIguw26t4x0LRcjdNKl7u8c5ct1I3xgnx7WNCV/df4=; b=jxMGz7P6YdxzQKWWrGudeEG4eh
	j2p3nApJuGe9QT5i/goX2JJnesMZnGPNm6DGtUfX3plTPwgRwerNUEX5XfNaCTUWFH42O3HYMrIZg
	5xCu/WbkKpL83yf+3AY6x2g0CdGCY+pM9H6VgRIDptGV4RAmp2/ZF2lkGcfyl43PjQJsPqG9aJqMN
	s6QxyLiZZ33fz5MpDY83JkQJtPQPHwC0tQ11TJqgwb4z8pPotrZEtfwelfOrGSgDZ5E4Nxe/UJ4x2
	FjAE3EF8YH3D/rFv3T8vhdv8dzODXE0Ka5D/D4xCat1o4a6yx/vAxKib1vqxkUcbd9L4H/7nKDPHN
	2T5vYuPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYhHk-00000001rhG-3HiS;
	Mon, 07 Jul 2025 08:33:12 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYgcJ-00000001kHx-3AXL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Jul 2025 07:50:24 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-453066fad06so18664445e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Jul 2025 00:50:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751874622; x=1752479422; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7KIguw26t4x0LRcjdNKl7u8c5ct1I3xgnx7WNCV/df4=;
        b=DtE06rtRyQNtOil2diKlkX5yNQVCvY9SoYgg+DaTQgCbb2U13IOh4hyyMAzDYexwC/
         ZYAxEVmnkcTVOsTRlra7h13YXpDf+bC4tlKTZcJXIdJzDbLh63xQynEFABohm9qaj5WP
         uIXLi3c5AR5TWOzuEGyRbkzmRNebvBVxtVEQrQheQYncTiHDPfLeqjNSvZfPycZXOfIK
         cdxbPy/SyBM+WIb4UQvXBRiip6MdZC01+mVbReNLL4lTyIMa7vjJDZS6MSgWe3om9y3+
         X2mUH4ncrfBFA3I8judnwB3f3ZsJn7SbND+FWL0Y0SyZUC2pwZJvUuUUmIuVCwqogpdM
         4Jew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751874622; x=1752479422;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7KIguw26t4x0LRcjdNKl7u8c5ct1I3xgnx7WNCV/df4=;
        b=lDDg9Vb6GvbrC2mJXr5hqJH2rlpBbfITgUx536NCnPqT7hKJ664DUY3/SQGo3yTRSM
         PTK3VOYBGPNNavPJEvQIobkrlzZFj4sE2jAWh18f5KJ2ZpivpvI/Hfverkz4po0VEiEH
         E5IZVCefn/MzY7+0yWG0KuwYmVbBJvttpenuYM2hDiU4yAkUl21OKNpqJVTLt0FUME4i
         enf3XcDvgYx3pVn1OMUV6w/BYcGX7Ua8r+BdVpkC+BZyK4NptWRvkkQORRhfKdRpcfZJ
         gac0wbsDOR/GcmHfYtwxbW1ZvKTjc9yCag++eQWnCQhbmi3P29br3ywbynWeoof6V0S+
         wsjg==
X-Forwarded-Encrypted: i=1; AJvYcCXxkaIMss4SbbAbEZ58bQeJuPXatiph0CesaeZ5O2NJ27z5P0w4Bl2mUPYWqGbkfS/MFuovCPxsTV9r2/Gx5xu6@lists.infradead.org
X-Gm-Message-State: AOJu0YwAeSyshYInTlDYEYbaI6Kz+d+3PjWe9l5PqPinYW743JU4ds62
	An1aOU7cV7UhmQBpP1ecd/U4xwPV2rk6SQTU4Q0vMAxiTJ7GMGEgukkd4FiejKBXQNQ=
X-Gm-Gg: ASbGncvkcGgmuNa2NHuBk8QuQrj1Z45a3Fe20PdwRO/JzjOJ5hyHBkcmV+PMxLDI3g/
	i6xQiPeUazLcNVlhxzObKxJMkarOk75CUlXrAKUR3eYFoBkLWtZa275yu2QPcrCcb2tUR4n26VX
	DTbxlOuCR4q3Vh5qe084EutFf6dY18J+KuTO5QGQN67S7C5PX4XTd6+HpXNcb3LzXETPgozmOes
	ZTPaDLS6Ld2NG6qpM+Tz66zT+pljnZNzxgv3bcVZXGymhbeV5HHl55T1VXpA04NRZFboZWGNh0x
	qcYbORKDc3Ddw2e77eZj6G8frtK6B1vM5SxkO3icFZUY+hUBMfOEn9Ni
X-Google-Smtp-Source: AGHT+IH0BRfaJT6Ja/4oOAwTU9Pk8TniKor/Tf4bstFHxPXhtytwSi8RMT0ZGyIHaXzOhXpOamh8gw==
X-Received: by 2002:a05:600c:1386:b0:453:5c30:a1fd with SMTP id 5b1f17b1804b1-454bb7f613amr61571815e9.8.1751874622098;
        Mon, 07 Jul 2025 00:50:22 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:3cf3:a61f:85ed:69db])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454b1893479sm104215455e9.39.2025.07.07.00.50.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 00:50:21 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 07 Jul 2025 09:50:14 +0200
Subject: [PATCH 01/12] gpio: tps65910: use new GPIO line value setter
 callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250707-gpiochip-set-rv-gpio-round4-v1-1-35668aaaf6d2@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2445;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=PFt654WU5Bje33IYcMH6++mqWC/NhCeC1UEL+Yp3IeI=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoa3w5QHqDYMrZJ+NhTqLDhhpPk4MYxtgOqLT6j
 l09IjyBav6JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaGt8OQAKCRARpy6gFHHX
 chs7D/47U4VHP5YhUMqlgJvviv29pJWoT7ECD7eEwNL78AHuoyS/KQzoyrTPBim2otsR4VTVKGD
 lfqBwX7VDQe0JLHsF63g9plpkWjiLM4YMRarfFU2/DS6rKpyflaraI1JPAzyU6Wfa/P9wjWkw10
 2gsDHVDkFoHyF9xgJWVOMB+iIBqmTemBD0kyqAmseZ7RY5ym2ke4ea9q7MS0tD65PBMUd3cqZFc
 Qt/AOSuv1Vx+1i0CGwIi6V1pRjvRQ/MqW4GmP4L/A04D0Q7axr1Tizt2axy7FzHhYqjcWUToj3q
 WdQsgPuPuD2gdjqZPEjeYJRFEOqo9NfFSrJeQYd6u+j0cXBNP7tC67mvTOrYh1eq460orTbfHe9
 i3XiycOdEFQ1Azjlq7BhC1ORmlj0NAuk4UzKU3Dg/FsivFpgOOr4zxqAMDdl/mnVYKD5idAO/1q
 43yFE7MRLxwuSYTnOArL/AjYVUebH39gNlVs8eTPHZ685b2GChWc0OX+PN4ooEd0HRDxGWofpkm
 EQA3PohnW6TPPN81ZY6thUVgu+hiqJ3jfZxacEcACayJcTorzD6W/axrrmeM5QB+C4iQ3BePpDy
 VGkDtKHecrsrLemuFI+lXY9GYMrIq1zFFzgZ6h6B48Thf7CDqgspOciJAYW6KwcYVYlM7+y6fna
 eeYYyQNl5cxl3hQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_005023_799947_9D8F7DA0 
X-CRM114-Status: GOOD (  13.68  )
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
 drivers/gpio/gpio-tps65910.c | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/drivers/gpio/gpio-tps65910.c b/drivers/gpio/gpio-tps65910.c
index 187d21580573fb1d896d90642a537a90aced8276..3204f55394cff12dc1b462cdce60342ed1b32fc1 100644
--- a/drivers/gpio/gpio-tps65910.c
+++ b/drivers/gpio/gpio-tps65910.c
@@ -36,18 +36,18 @@ static int tps65910_gpio_get(struct gpio_chip *gc, unsigned offset)
 	return 0;
 }
 
-static void tps65910_gpio_set(struct gpio_chip *gc, unsigned offset,
-			      int value)
+static int tps65910_gpio_set(struct gpio_chip *gc, unsigned int offset,
+			     int value)
 {
 	struct tps65910_gpio *tps65910_gpio = gpiochip_get_data(gc);
 	struct tps65910 *tps65910 = tps65910_gpio->tps65910;
 
 	if (value)
-		regmap_set_bits(tps65910->regmap, TPS65910_GPIO0 + offset,
-						GPIO_SET_MASK);
-	else
-		regmap_clear_bits(tps65910->regmap, TPS65910_GPIO0 + offset,
-						GPIO_SET_MASK);
+		return regmap_set_bits(tps65910->regmap,
+				       TPS65910_GPIO0 + offset, GPIO_SET_MASK);
+
+	return regmap_clear_bits(tps65910->regmap, TPS65910_GPIO0 + offset,
+				 GPIO_SET_MASK);
 }
 
 static int tps65910_gpio_output(struct gpio_chip *gc, unsigned offset,
@@ -55,9 +55,12 @@ static int tps65910_gpio_output(struct gpio_chip *gc, unsigned offset,
 {
 	struct tps65910_gpio *tps65910_gpio = gpiochip_get_data(gc);
 	struct tps65910 *tps65910 = tps65910_gpio->tps65910;
+	int ret;
 
 	/* Set the initial value */
-	tps65910_gpio_set(gc, offset, value);
+	ret = tps65910_gpio_set(gc, offset, value);
+	if (ret)
+		return ret;
 
 	return regmap_set_bits(tps65910->regmap, TPS65910_GPIO0 + offset,
 						GPIO_CFG_MASK);
@@ -136,7 +139,7 @@ static int tps65910_gpio_probe(struct platform_device *pdev)
 	tps65910_gpio->gpio_chip.can_sleep = true;
 	tps65910_gpio->gpio_chip.direction_input = tps65910_gpio_input;
 	tps65910_gpio->gpio_chip.direction_output = tps65910_gpio_output;
-	tps65910_gpio->gpio_chip.set	= tps65910_gpio_set;
+	tps65910_gpio->gpio_chip.set_rv	= tps65910_gpio_set;
 	tps65910_gpio->gpio_chip.get	= tps65910_gpio_get;
 	tps65910_gpio->gpio_chip.parent = &pdev->dev;
 

-- 
2.48.1


