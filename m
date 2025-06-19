Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99A29C7115A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 09:09:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fUxEFCxSV+En4LdALjtxQKt1K3KufAQa0J+EdQHN8Wk=; b=wWaKbKr24BmnirJw5K3Vee3idg
	vb1a+SPov/BOFWFIw/Mk8M7rOIohEgWgprLgY4Jr79I7zn0TopwN1nMFw67suEqWEYWBRxQLWF6wj
	gJNsRDtj4jKJ0uHlZUs4XanwCMsP0KhD8eBCvnqB/qGyP+pOy0wwu0V99XBUfaq/VPVZCmMpgigYr
	tPT7QgsQB73SAVr0ePA96a1tczVgTmtgaiq90B+Den3N5OMw+JQGf2UHmMYGMjxMZwLu4RXiFhWja
	dBsn6iBaz0wkOEx6/TDA/R/r6hRDrJH2YW0gzD+tPPXKuGgn1kPdV0DlZ5VxM56hJlVf7Vt5eKn6d
	ByomTrgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSBGO-0000000CZ73-0VS5;
	Thu, 19 Jun 2025 09:08:52 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSAiH-0000000CRKK-3dFe
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Jun 2025 08:33:38 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-3a548a73ff2so521804f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Jun 2025 01:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750322016; x=1750926816; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fUxEFCxSV+En4LdALjtxQKt1K3KufAQa0J+EdQHN8Wk=;
        b=p2WIJVa6IBb2LZkmBBswuXCA6WSbQX6LzKg6qXBxwiNhxgtJcqAc/OPka3bSMLq8P/
         /GJsOrFPLX6Q0vTzszdkQBe1sfN3FSy97c+81ysYOyDOoAKsKD8u+psYDI7V7sPsu7zj
         w4AuFfTivpBF3xW+z2nEdL5nQvlIagr0bs4i9i8jr8+H0cwMk0GbvdWg1karDpHwTN91
         EMuTGprXkaXdQaLQc+3RfaJH7fWY5j3tJFUmXlTKHzfgRbmZhZ9jghyNYweyaKMhC8j2
         1T2giOTAbi6K+ixOL+cg7iXAv1cfrTnlxHKdISHQk8T5QFfIiPotJET56tUMREwcYgPj
         Ujjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750322016; x=1750926816;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fUxEFCxSV+En4LdALjtxQKt1K3KufAQa0J+EdQHN8Wk=;
        b=m4mAEKM8Z2FDpZ/NDQfyteCIelPOJU1b2zH4EeoHTVTk5u3pJjJICa+Lx6eqVrZsyN
         LNOjh0P8XgCNlTH8bJm1+lLO+Flg4J8VdR6IakbKWRKyyBFGI6q6aGIdLFHlgDe4Ccx5
         R8LufqMjXge9A3CYfxcEgDKVaqolT5tKrx22EtTt+RSwDGTGz2lc2eFxm72Zeb5NXIZO
         1GuqNYiFsKitPFroyXy+58xWaRw/tgrwzIZhxglCTMkbW0hf0D1AAMnKmxKUVa2aM6bp
         qexyXKviYPUv1Je5qFDphJt1i0h72xIvIDfkdBPCAUbA3CCfcuWgECgFO83cS9/jISQZ
         HVtQ==
X-Forwarded-Encrypted: i=1; AJvYcCUTIKPlPuQIbmmLp9SXA0BT2VI1pKLxILV3O814yjyHfTCZv6T0TtTaXCrPxwoat6b/Sh7a8FGPZHwjgdAkdASP@lists.infradead.org
X-Gm-Message-State: AOJu0YzT+teRZtUauaA8XWXdn57AKaPlyXR2RTf4PF7IWhk6K9rMS5xL
	y/CEHXQK908Mi6FY/17n0m/NXkMvInLXHYS4Fe8t5KTrf7x5FISx0OBH2qDy0Wc/AjQ=
X-Gm-Gg: ASbGnctNagS9VIbhh+mOZEqxfAVRQf+8qtxiFSrspE96JKLEb6TNFMCNq+uemP6UsNc
	7yqZPPEEiFPRIWSjzvK2UuKqVbiWbhwgV+PgdID3WYkUClEY0/RsfNVKRDIHqUlDZ533qIDO61l
	a8nec3+GHPILDvyN2eORme1F5VrERbxzTg+F6+5vUPWJKKdyws2/nEcvShu9ZMUi8sFjLMn93Qt
	K/vgRIc2YSX3OjBZT+fnyuuAbQM3ocBn7SgX0HXzrGjEgPFwjmi54NjmYsyghcnMa1C9dPsn1va
	lxs94pI8yuap55AFgtp1LyM9gbsqxeQYo2U7zpyPGVd+zolU285XogXg4jTZItfDHPk=
X-Google-Smtp-Source: AGHT+IFfsPhVrHgeuWzX3+6sQmR19Vl1yy5xDC5faeBVZQvTDHkV39fKCws88JWALuInD7mjUF9AVg==
X-Received: by 2002:a05:6000:4803:b0:3a5:3062:793a with SMTP id ffacd0b85a97d-3a572e79d41mr16470567f8f.33.1750322016552;
        Thu, 19 Jun 2025 01:33:36 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:c485:fe15:c9ab:c72f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a63a42sm18828151f8f.28.2025.06.19.01.33.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 01:33:35 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 19 Jun 2025 10:33:23 +0200
Subject: [PATCH v2 10/12] gpio: rockchip: use new GPIO line value setter
 callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250619-gpiochip-set-rv-gpio-v2-10-74abf689fbd8@linaro.org>
References: <20250619-gpiochip-set-rv-gpio-v2-0-74abf689fbd8@linaro.org>
In-Reply-To: <20250619-gpiochip-set-rv-gpio-v2-0-74abf689fbd8@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>, 
 Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, 
 Robert Jarzmik <robert.jarzmik@free.fr>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1750;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=bJZscimERewZNLI5pGqQIjH00bD6YcA1Kc9nHnuKKr4=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoU8tTDKdHYa2tugbl7ZgbX8M1+hP8adwm5KKEh
 MqhI//NcwuJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaFPLUwAKCRARpy6gFHHX
 cuAAEACjn7R+KR5/zt3QNdbTEUEkbL3xT1JlWMeyK1RMVSZHp3CYFxhOFf6/8w/Xq04lnJRQ2M/
 lvWSlbFLft/9IseHT/Ism4eMG7xKvNSHWLB3vEONd12JYS9fWNcn47eL61YBQUF1R3LknWWtW/x
 UHnsEEr1iYZB36AYooj0M4Z7raU6Xt8srnztoZ3xhNkaY+Pa+p9KHAhj/8kN/ipuyAphKXdk0r2
 knA1yAb59U2dR1V9Ru5eiUOenbf9shLNvwnW8Wkjl5uOpxFD2lt0mWpFGYVvfoyGaeMw4e/hERJ
 2dNPhzDGhylpw/va5zlOzxFjqzttvo9MzKX/Tvp5HrAsCreSibdjUR28e1VD+CqzNjDsmCpyqTT
 Czq3I7mLvtqc5cDZVsVoYve7pbUWNqsQSxKxo+cztDof+wRRCRb5IbAzrN2BBXg6S74kWSSImTZ
 DOjr+HHnDnLcca18BTWMAYdEXtFdeuvOqMTujZd3kUXVq1qZEOAClLVXpmVgxxDTNkaJ/cFC5jl
 IE3Nhh/5s2pbySabu6Q76yGyMgclCRvVhOsgKIPaeieT2bt/NtlP/vHLqXkK+ouSR/aeYlsX8jq
 5ohEONkE86sx7b0n6GxTh0XkaRULQDsItKSIkMa0QjnJLrB0EGYdtLnfz+ozQ/yxhndBWKEYMww
 QpzQm1rT3j0ULzw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_013337_908940_9F8CA317 
X-CRM114-Status: GOOD (  13.00  )
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
 drivers/gpio/gpio-rockchip.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-rockchip.c b/drivers/gpio/gpio-rockchip.c
index 64700a003f9a17947dd38baea23a066e8c057caf..ecd60ff9e1dd1a090bfad204c8b86c4d7fb68ce7 100644
--- a/drivers/gpio/gpio-rockchip.c
+++ b/drivers/gpio/gpio-rockchip.c
@@ -177,8 +177,8 @@ static int rockchip_gpio_set_direction(struct gpio_chip *chip,
 	return 0;
 }
 
-static void rockchip_gpio_set(struct gpio_chip *gc, unsigned int offset,
-			      int value)
+static int rockchip_gpio_set(struct gpio_chip *gc, unsigned int offset,
+			     int value)
 {
 	struct rockchip_pin_bank *bank = gpiochip_get_data(gc);
 	unsigned long flags;
@@ -186,6 +186,8 @@ static void rockchip_gpio_set(struct gpio_chip *gc, unsigned int offset,
 	raw_spin_lock_irqsave(&bank->slock, flags);
 	rockchip_gpio_writel_bit(bank, offset, value, bank->gpio_regs->port_dr);
 	raw_spin_unlock_irqrestore(&bank->slock, flags);
+
+	return 0;
 }
 
 static int rockchip_gpio_get(struct gpio_chip *gc, unsigned int offset)
@@ -325,7 +327,7 @@ static int rockchip_gpio_to_irq(struct gpio_chip *gc, unsigned int offset)
 static const struct gpio_chip rockchip_gpiolib_chip = {
 	.request = gpiochip_generic_request,
 	.free = gpiochip_generic_free,
-	.set = rockchip_gpio_set,
+	.set_rv = rockchip_gpio_set,
 	.get = rockchip_gpio_get,
 	.get_direction	= rockchip_gpio_get_direction,
 	.direction_input = rockchip_gpio_direction_input,

-- 
2.48.1


