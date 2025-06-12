Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52C4DC71136
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 19:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ddos4D+qX7/1EnT+iqN5KagM9V0p0W2P3w/4kWY208s=; b=t91/I4bBz0+IfG32pRGVdoAgLv
	hEu5ZfpsH3SM/64M/YnuX7Rhz7z+iKp/9ZrC376jgeIREGH8/HsQrpWRC8foEFc2j6l0qoU3ZKoKz
	5eOAtH/sP5tb0SQ5tHlJoqELJvBL24UUcN3ykJEACjTqOPTEPFwzlDyFBOEBvYgVm4kiF55cXhXuL
	vmLC7n/O5uelNpeZU24NKpcODeonmqDAo0LzX2xufTQOcmURqn5Z3keNkaWlDazBsQZv7URv3NMlA
	+j+QJN05RM0vifGhKYj4X5cytpP7MJDJPzBOY7Vu9aXmov9PRyGBF8iOJ47DrtzImO4f27WJXU3mI
	7/OC8Lfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPnnC-0000000EE6M-1sx5;
	Thu, 12 Jun 2025 19:40:54 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPhmF-0000000DLjw-3t5c
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 13:15:33 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-43edecbfb46so7577855e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Jun 2025 06:15:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749734130; x=1750338930; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ddos4D+qX7/1EnT+iqN5KagM9V0p0W2P3w/4kWY208s=;
        b=DrZTZuwyksc3oY3nPcccXXn9gRvufh0CqDg4Gf6/FQ5b8Onr16tCJKn1xepR71ROp4
         GztdSfkwtBTJpOJvhtiRYf2riNsIBbPrTHlMHs80wXvpbAJe0rnaZ7nlX9aXyn4/R2Gj
         K2iIAZbKm6QijykQr3Z9x7lE5n5dSHEeiTAL5I2BVcH2QGDec2MUO92MWANEkyNjs64i
         lO2oI96co+0lchKDqc0+YRODveTCG62pQQqNgP0VwB7Pmi56KXBYGTk5tso83rMczz0+
         nWU9VaOZA8oD0Zti8s0Q9iUK7cNuXtKNE36fE3m8y9xPphczBJCacS5Voiozjl/fzjFl
         8yVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749734130; x=1750338930;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ddos4D+qX7/1EnT+iqN5KagM9V0p0W2P3w/4kWY208s=;
        b=MloQDdgfjD0wXyLrAuf2TH2fBxk+tCqahA+Oo9nT799nIYd7ajVm/r2q8WNgBv1Yzs
         8GcokR2xkgn6HHx7kz9SO40iJNCQdaMw4V3z3JCYrcZVMXdVPCTYkwBv4mfG6mobeXyY
         EipioDN6spcP6gmdJfW8bvIbXNd8d4x2ZCADgCvbatkfMxx5HUBfzvagjJ0VKB//LXSw
         cZQy2VLaxgReHEeugAFQRLgrR+PM7nmJiNcRuCoEO3OpJuUBB1/XZynKVPxENYOSU8+Y
         VQoK3sY1L3NMhEh72QoXNBoSkdGNDyGWT4nplELUhW3pQ2wEUt52CVlk0svQEkwT1iHS
         RvZA==
X-Gm-Message-State: AOJu0YyoeRMuaeFP0E1URUyLTJyTHBZSojsWkGOjp6rjNBJJ1wI+eU52
	1dhF9bskInzE5v8OcuKcyr3FjbYLybscSd8yk77T7pVGcohvMhm1lkSJfizt2wXJIIk=
X-Gm-Gg: ASbGnctHJgHadClFJlUZM7/8HTAdnbJAOJUgfKEBl/jFmMXXuViK02x/vU996PJy8BV
	7iXUxRxD4mPMWWyKni36emUuvtRIWl8Db+r0NPRHjrLhSPIiyHrwr4KJo9gCCRPnTfela5eL+o8
	Ywm5w3Lkpg6yuJmNeztUKoRZUrX1m4Z9EKaZv5WXrzStPPjoisGrsD/GJtBrcVc2L/2MuI3BPpb
	HHHnkxD0HsR9U/VtKdArKKxVWW20sD4ZNraYSE9dUzTssq7UyaEmd0wXw9Etu8F8jP3mQC/jHZ7
	TAmP2c+gYWnED/Ql9Xa/4ETbQnQnm+ijctaFlOvM6daOUj/k1yRy1Mg=
X-Google-Smtp-Source: AGHT+IEjm92mzG6iTvPU0aaqMJR5tJjcC1kKUVwpXp7/ZRJdx/YJfK1/AxyJNMPRaZiUgO8dI0ZM0g==
X-Received: by 2002:a05:6000:18a2:b0:3a5:3b56:974e with SMTP id ffacd0b85a97d-3a560694b22mr2626108f8f.6.1749734130365;
        Thu, 12 Jun 2025 06:15:30 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:8b99:9926:3892:5310])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532dea17d7sm20619795e9.10.2025.06.12.06.15.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 06:15:30 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 12 Jun 2025 15:15:17 +0200
Subject: [PATCH 08/16] pinctrl: xway: use new GPIO line value setter
 callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250612-gpiochip-set-rv-pinctrl-remaining-v1-8-556b0a530cd4@linaro.org>
References: <20250612-gpiochip-set-rv-pinctrl-remaining-v1-0-556b0a530cd4@linaro.org>
In-Reply-To: <20250612-gpiochip-set-rv-pinctrl-remaining-v1-0-556b0a530cd4@linaro.org>
To: Dvorkin Dmitry <dvorkin@tibbo.com>, Wells Lu <wellslutw@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Patrice Chotard <patrice.chotard@foss.st.com>, 
 Support Opensource <support.opensource@diasemi.com>, 
 Baruch Siach <baruch@tkos.co.il>, Sven Peter <sven@kernel.org>, 
 Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>, Viresh Kumar <vireshk@kernel.org>, 
 Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, asahi@lists.linux.dev, soc@lists.linux.dev, 
 linux-sunxi@lists.linux.dev, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1950;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=83dVwDjCWymw8bEavhDOHIM+hxScalMSI8x7KJC7tWY=;
 b=kA0DAAoBEacuoBRx13IByyZiAGhK0uWivjkySga8kTnFeUwUE68bmLo7YM/dAt6M6sI+TJxUj
 4kCMwQAAQoAHRYhBBad62wLw8RgE9LHnxGnLqAUcddyBQJoStLlAAoJEBGnLqAUcddyEcsP/0U/
 lQ+/N8a7qZ3Y1MwY7dHUJKTAx5Dfzvi0QNp3MMjqS8cvsbF+baaAXMW8ngmt+x64NWoYANmZ6bH
 1lRgsQ8pUweyVIBotIf0V1huvpTG5o6r6v6jVRpqLWw6OTMlDXHFcbpZDl9MFXQm1LgD/gNqkaR
 pOAY8yWvG5YXJGzz5PaZOxE8Dn81QWKgYwJh0kY4qgqOrIy5eefHE0LjmtWWWvlpkU3unM5uTWa
 k8Rw37a2U49NeIX1dz7lM8O7RicIdC/a8YqDuRkU99HRBPnMawH93t9cSlWVVqi3rEzt9nMMlZn
 8YZVHGwgC2TaJWyVzd+3zMJy2wqx94f4WFgCMk7oK98TbH6VaT57g3qyYorVUBPJ9DuYeiHN3Kz
 0VXawdCFHV4VwHWhX13VnGIo5tHIFn1PCQxKz6LysoKHrvPDXKdvVduU3lAOX9d4IUiND4hUSPx
 6kD6UrXqaS9XCdctmTZROU1jqUSo+jSET9EqeIsb/TfqSdc7CBrSiyFIKaTXDZNVF0WAhJA8rN1
 yANcZDYks4P2EiL/bRon27uP/947tNFjIXoY4QHGBfTBfi9DSQfyCoIoLs0SbXbofzs4A74Bxgm
 PE5Q269V5ir7Xb+83MPmRPLy4bK/9pOzT3CdEFZfGMhdoZZ9bpHDY0j6tS3nlEPrf6rllqjrk3V
 U+5o7
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_061531_970233_246D6289 
X-CRM114-Status: GOOD (  14.13  )
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
 drivers/pinctrl/pinctrl-xway.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-xway.c b/drivers/pinctrl/pinctrl-xway.c
index 02e65d25e72911b812446ad4b90bfd611c9c1714..53c6c22ff24d752ba66bdd8d46c860bfd9a93731 100644
--- a/drivers/pinctrl/pinctrl-xway.c
+++ b/drivers/pinctrl/pinctrl-xway.c
@@ -1293,7 +1293,7 @@ static struct ltq_pinmux_info xway_info = {
 };
 
 /* ---------  gpio_chip related code --------- */
-static void xway_gpio_set(struct gpio_chip *chip, unsigned int pin, int val)
+static int xway_gpio_set(struct gpio_chip *chip, unsigned int pin, int val)
 {
 	struct ltq_pinmux_info *info = dev_get_drvdata(chip->parent);
 
@@ -1301,6 +1301,8 @@ static void xway_gpio_set(struct gpio_chip *chip, unsigned int pin, int val)
 		gpio_setbit(info->membase[0], GPIO_OUT(pin), PORT_PIN(pin));
 	else
 		gpio_clearbit(info->membase[0], GPIO_OUT(pin), PORT_PIN(pin));
+
+	return 0;
 }
 
 static int xway_gpio_get(struct gpio_chip *chip, unsigned int pin)
@@ -1328,9 +1330,7 @@ static int xway_gpio_dir_out(struct gpio_chip *chip, unsigned int pin, int val)
 	else
 		gpio_setbit(info->membase[0], GPIO_OD(pin), PORT_PIN(pin));
 	gpio_setbit(info->membase[0], GPIO_DIR(pin), PORT_PIN(pin));
-	xway_gpio_set(chip, pin, val);
-
-	return 0;
+	return xway_gpio_set(chip, pin, val);
 }
 
 /*
@@ -1354,7 +1354,7 @@ static struct gpio_chip xway_chip = {
 	.direction_input = xway_gpio_dir_in,
 	.direction_output = xway_gpio_dir_out,
 	.get = xway_gpio_get,
-	.set = xway_gpio_set,
+	.set_rv = xway_gpio_set,
 	.request = gpiochip_generic_request,
 	.free = gpiochip_generic_free,
 	.to_irq = xway_gpio_to_irq,

-- 
2.48.1


