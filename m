Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0228C83F07
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 08:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tdiCClurppsFxV5YxKYx5Kg1pHWscHH18i/Vt5HSlV0=; b=pKoxYDqd9tR8NZCJAUtV9QlF2+
	ds5IqMKDrz/iW9+T/EmmnHqwfj8Nyo8kFTL2H8M6OVk9sZ1SkuhKRM8+SZ+MLR96kr/Pnzzt8Nv04
	7xC+fO9baNjQZG+e2MQ0RIz0TqYd5uNV7Nouqr/1Qy5fg/f7q36SGSZOf0gGDsGgxrrZ67cFxpptE
	jl08y6A8aa0ybSSNkF3AipLyAaqO+RvQ+p7uv4lP40CKWzCa7YZe3uhqaDaqGXo+CXQwvr0qACXy/
	YGoLLCrbyvXfIze3zELQTECSp3HYpFM8gBv+6gnG5jyss3zgAqLMEIOHTzHJzDv5+/Cn3AKRR3+Wv
	jHHC7WvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYhK2-00000001rsh-28lF;
	Mon, 07 Jul 2025 08:35:34 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYgcL-00000001kIT-0DWl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Jul 2025 07:50:26 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-450ce3a2dd5so24880205e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Jul 2025 00:50:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751874623; x=1752479423; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tdiCClurppsFxV5YxKYx5Kg1pHWscHH18i/Vt5HSlV0=;
        b=yo2dNBPWDIQzb3B2SwNljzlknQuAAQj6y050SqBW64oyNW6Dxer+KyhdfDJgKPQmmu
         BboDX4sLcGhB0hTOZs093gWpIHwS8qKE4sxpFSeGmyAe31IZRaD+6ECkAyYHXPkteUBr
         Mrgb44h9wRtAuRc6CKJht5f9WO0/zSu8CbAkdtvSTtXPr8aqPl/vI3b38PUJhNDX48Wv
         2yKGH+4jjSf3Af5sR95JySnhH3wAs92+jTvGJI/08Iyu6Mbk0e+ZMiMiduGTGV3mShl9
         bfz5SFyyInzuTJVTfI7+MLYC0zvY2lU4/uJR7NypGVTuiYjtbBGbuU6c48CtWrZsztT+
         NmGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751874623; x=1752479423;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tdiCClurppsFxV5YxKYx5Kg1pHWscHH18i/Vt5HSlV0=;
        b=iQgZAg3v0h2o9p1OgbSltFOQsGwj7W7CUPJ6HtQiLM4q03FZijelwer+2mRGqiaWHz
         8vZTk6W6TZFaHi7F0zotVy0CiDSvxW3aKubMoApQ/ZI4ExYfjNr7foiZyIbgKBP2ZyUK
         +ZxEcLQCmhI7xIRIVMX8LB4N82AqmUtgpfK6oov+vuQy0KjgCTNtBlL2CiIP5zMMwEw7
         rFvK7GA1Ewk+NFyhGTKPb3O5q+mbdrytXt3S/vsJ0UBk0rrJhUHaJf/vv4MDd826L0Dm
         C3dHofwCKt+StY4SV0i0RAvltAZbFXvYKJeMqekJCMJJsH1B2urydCNNhjjq/i5KvHrL
         S9UA==
X-Forwarded-Encrypted: i=1; AJvYcCVQ4A/479BYbptk25Mxu7Uk1k9/8le1QH5pFtNhh8HY1yyHyzx9t3xRy4+zBAzPhyCkI9JzFecg2j7LaBSjyQ75@lists.infradead.org
X-Gm-Message-State: AOJu0YycGuw793aDwSnVQuSBl0/Voj9Np+t6breWsiTA7E17kYJ4wI9a
	TCQSX/szOGYC9xaJccVy71QGLyPROAhmUJ6LTurYT9TidmwSQCG6exVxdRuGL+jkyqE=
X-Gm-Gg: ASbGncuarnfxHR824tvYszoSK3lzObMqYwPZxfiFi1ulxd5M+/6ROUJktpFnx3dLmv0
	UukpdTTnQ4TEfYJThg8LjS/JdFh5ZXF+e5sbpPQcBjw9IfR60aXaUctuUzWLYcAIfGwpoeu5U7n
	jkijZQUNjuRM8ydFqVrAIItxbPxm1c1+0UslXvSUOflgAnSswGA6Q6gCutOR7SCnNP7mx4D892j
	4jglUXvQ40lG6WPC720dDjXJeeGXDRetrWHLGImqfhSjPc49MH3HlhJ+wdGphkCN9r7ICr3ap23
	zRluEe84bgbP0Ft3dkXN4PFDGbLr72OcQQTEo8IuImDipnjH04YDmzaLV7bcIJMuM8E=
X-Google-Smtp-Source: AGHT+IEqgmgxIURs05JAfURUG58d/fGTkSoIF5JMBPmDKs1K/hlGMbEHQjWnpi3xLDwDfjzJ7sz0Zw==
X-Received: by 2002:a05:600c:3f1a:b0:453:81a:2f3f with SMTP id 5b1f17b1804b1-454b4ec2132mr112400995e9.30.1751874623379;
        Mon, 07 Jul 2025 00:50:23 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:3cf3:a61f:85ed:69db])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454b1893479sm104215455e9.39.2025.07.07.00.50.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 00:50:22 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 07 Jul 2025 09:50:15 +0200
Subject: [PATCH 02/12] gpio: tps65912: check the return value of
 regmap_update_bits()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250707-gpiochip-set-rv-gpio-round4-v1-2-35668aaaf6d2@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1130;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=+7uULFUSxltf0ex+UB4BzvFmHtS6LSFM3eN2nv7RH+A=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoa3w6rlb0lKZwordYdSaGUHH6WK0vpLXF/FNE6
 xp5MrGNYi6JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaGt8OgAKCRARpy6gFHHX
 ckQND/44rNk/9q1R3pU2Outz5DEqJduBUn/8U3Y1HOSmQdGKsD8tdU51T5SNnOeQ2Dd2PYxOG2I
 0Z5Lei5qjeqHDokhfnNQPfUbgQSnOQizLklwP3jkkWKYApDwyNBNbIUVM++5E7DUJ3pdwP3Eg4o
 n/HfqLvpgXbfnkmk5XVHECV1wV45SFW16SA4ii/gEaHUe5R6v8sxCo6J5xzx4EEHknlL9YaunVh
 3as6mh3AIsN+adKhxlHOxvL1IGhEyUSP5ye5RCbfhw0ikPXpd2yo3hzWexAV6HDGqe/ASqFlnYk
 T+J6RT3IZ2EDQlozxOdjtyITvvyctQAnInf5Hn8RLOa97C8/iKwhnY3Wm3mcrWUmvDg3adykPhP
 oz2mGgsq5Effp4JrGCfyScXay76uJwpzWNEFwNB2WEJgWtUdT3jXRXkKgxmq9bgLkg6SWCMt1Hd
 1ow1fsFiOtLq51Z2WQaMjTmrejwCuAYDskBaJYXXmnTJgyp6jsPHa5KRq57W7KmK7fg+jjT7PdX
 CnltUX1lL+ZtFCCpWPuJYgkn8odAcUppUxhc8LCqb2gSTfd55cMInxCRx5R065/1CepadX101H/
 lYsgt+hSV/SPOH4bql717Ym28hXOrQEHkNmRSrwZfhpvfEDZW3K+660pMyexHTAIn4iO0zFeI90
 GFasRoCC+NWTPpw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_005025_096278_ED0F7215 
X-CRM114-Status: GOOD (  12.79  )
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

regmap_update_bits() can fail, check its return value like we do
elsewhere in the driver.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-tps65912.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-tps65912.c b/drivers/gpio/gpio-tps65912.c
index fab771cb6a87bf05b1edc3c062f846bea70ca825..bac757c191c2ea0d103eb0577710065611fd79aa 100644
--- a/drivers/gpio/gpio-tps65912.c
+++ b/drivers/gpio/gpio-tps65912.c
@@ -49,10 +49,13 @@ static int tps65912_gpio_direction_output(struct gpio_chip *gc,
 					  unsigned offset, int value)
 {
 	struct tps65912_gpio *gpio = gpiochip_get_data(gc);
+	int ret;
 
 	/* Set the initial value */
-	regmap_update_bits(gpio->tps->regmap, TPS65912_GPIO1 + offset,
-			   GPIO_SET_MASK, value ? GPIO_SET_MASK : 0);
+	ret = regmap_update_bits(gpio->tps->regmap, TPS65912_GPIO1 + offset,
+				 GPIO_SET_MASK, value ? GPIO_SET_MASK : 0);
+	if (ret)
+		return ret;
 
 	return regmap_update_bits(gpio->tps->regmap, TPS65912_GPIO1 + offset,
 				  GPIO_CFG_MASK, GPIO_CFG_MASK);

-- 
2.48.1


