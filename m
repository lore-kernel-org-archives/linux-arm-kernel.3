Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB92BC71136
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 19:41:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SYW0+B04sInxcyPw7RL4odLCTvi8nL12cX8+rIobfUQ=; b=lNz7jJNLWntWQ9dHFJdUiHAIS3
	wp9yI2V8DW5zzvArSgrnN888v3uAFTAoIAJGx/Yw6BDY661IQls2Qqi5HPwrF3G5UUOJTlfKqyM30
	s21NoRaS40Ep+7WVZ6Q2nRMcRrdssyLM2BZRraIaCcP+V3xSmgPnR3NlZ2flsBWJh4rYtp9qJfmXy
	7lPbXMF47wLlz0vOQ/K4iiQWAGo5Ci/nSGUF7Hkv9xAF2Qu07BE3U651coU5zhNbHALBO4Uy0X66P
	dqbl6guYbieKqczJBuA8ZxihPWs/WeS2RfvDQVhbea8sEaOZZ9e3R/afn7FavYM0THf3wpAytnrim
	I9fon+vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPnnU-0000000EEQt-1F9X;
	Thu, 12 Jun 2025 19:41:14 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPhmQ-0000000DLoY-3mRw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 13:15:43 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-442e9c00bf4so7994935e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Jun 2025 06:15:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749734141; x=1750338941; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SYW0+B04sInxcyPw7RL4odLCTvi8nL12cX8+rIobfUQ=;
        b=XfNA3MKHs/mmnBX2fpoTL/czd7RiBNu6yCus653FhIxhq66TxPtvOaapYPwkZN2v1l
         SdIgBtmBoHEiB76NIWaMirBskSnjaaMM+m0edxoAMjg3kWoD9K+WscwUaa/TiKH+9Dn5
         Kra3QA6slcYxjwhrRMTgLQZioMeNhVbahl3qVZyNITV0izQG51G6NlW5NkYDvLogjrmZ
         NwFYAh/Wg83OX5Gr6G5fgSWSKLY05G4h2gWBvkT8qgp/okipLX4OUsV7jKSqMbrqQZV8
         Zi4ihZQNmnGSCqRWBHvKw3Vvgi15gd7ki/RkBChxXq3B6eSBFBuNNyxs4IQMG39TPdWM
         0QUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749734141; x=1750338941;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SYW0+B04sInxcyPw7RL4odLCTvi8nL12cX8+rIobfUQ=;
        b=XQzphGXYz8hQMma/6/5TI1X8Gt5dUlbWv4IZYUoHrmJ0t5dlqpA+OdeSDjvVYZm8QZ
         j1F6uTZYOHeb7hdnMtN4E9aagFaKYkU06eikewqxoTK6YVsyhrW4J42pO2jsTyGYy5Ln
         +WqzgfIYVTXA3c7XTs0ooulPqPnIkvS/NI4WBlwl5mlLOTYq4Qy+jJYhhQ3FN3ZcBhjo
         EUIhXqDvBU0qcHgPF51HZUqla7WOP2dlq0rk9Aj5pvFRLzacGgXp6zimunG/LfMPf7VJ
         MEqohss250WIHCwBrCCIE7prHQZpKNxn39xfOlnZ+igqIkyT+nDaSJwFsU9PGBX79YaE
         sUig==
X-Gm-Message-State: AOJu0YxDZtoDVzmrOuaabkQtMJgUF6bMD1SSm0erGv/Ee7BhuXUjpC+o
	ARtaB5SMJd/IDS2YQBJVz11u2+1Ir+xTYbQr/LfmkYUjSE3sV6l6d6kBVf1d7Wob5hU=
X-Gm-Gg: ASbGncsmANBfIHalJ+Zq4zpf21tta1vjRHaSTcGoTe3QKymo3+1OMGEcURyKBI89MMo
	dneqDsvzSEESgZ83lhde/MKwtZ6MH8+CB3vvdcb446Sq8eA5nIzJCGKdmcnwHpBmo1RtWhywUnB
	4/0HsjyA67NvVY7yFdnK1/ULtxdji+rlBx3+yH0849ZED45q/d0NL5JmFZIFwCsF7WS15TR2y/h
	DcFUrg25q3pyuqu5h60f3DCWLl6MyBw38IecVFq1TZWhJqz1qbvuZ0nAroXMxhMg3oGYD+6vfTQ
	37aoxt8wc6J4IsWruuAPn0t+RDRuG/hfR8USJibO5t4xUbWqgS9/3y0=
X-Google-Smtp-Source: AGHT+IFpZ9SXfAbcx9UYgsykf4kQVZZ7hDQIXoDecEBolRJ+pnmV+MNhvJktOJmHqFQTsif+GRyCYg==
X-Received: by 2002:a05:600c:3586:b0:43d:ea:51d2 with SMTP id 5b1f17b1804b1-4532b8c2f2bmr38451605e9.14.1749734141385;
        Thu, 12 Jun 2025 06:15:41 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:8b99:9926:3892:5310])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532dea17d7sm20619795e9.10.2025.06.12.06.15.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 06:15:40 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 12 Jun 2025 15:15:23 +0200
Subject: [PATCH 14/16] pinctrl: sunxi: use new GPIO line value setter
 callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250612-gpiochip-set-rv-pinctrl-remaining-v1-14-556b0a530cd4@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1804;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=nIb1ERVNbKJsSviHJxgUP0dw0VlXNMpXQSUn3radzBU=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoStLnDirgrB5LayZ6bmpzTb9vnrrWDTKxpwuY6
 6GuRs6+7+OJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaErS5wAKCRARpy6gFHHX
 cjGPD/wNvb4j//YoAIysQkS1R/JAVIQzuJnhYsUG1hvGNE0K/Tj2zywZqHvUHGhwy0MMfY4/IPv
 ipPG/UE5TMpaAfnUreWMO+6gxvRyBKLPdnaXZFXBx84htL1YUquIbzHMfT+cuIwtCnRANTxi9So
 I+0/W4Ejq/+fTnRec5gzwllQdA+qwsjIuNLHh2hmROmHFzBhnrngKJdRyiYjB4n08hMg33DyloF
 R+WMLG5USaOhzS/cXh74PjDCSNab71daGuxVVLjx6sNQm+imFmYb4aAZaHP34eGfUMMInd9XzFM
 SSClmvWkl4TCO/CRIH9s2dok8DZbUhgNwR2461FteN5+z4/wJh7owtQ3RtsRJeriFnI6cdJNxiH
 O/cD4XHBvqloqHTCEeD0KHICq0c4Ka6xKLZZaxo1/eJAtBPvQDdS6VXDNjKjxr4hpedktowfEPL
 8dzAoSnwDri+1MvHu82L2GIfD+vUzkRxP8AhYFQlINlgKg+FSNbV8utKdF7Dp/RvA0AyTR5AygF
 CpNuMQSY+P7pgwk41Y9dwdiFlxRy30of81JlYjV6kdmBpB17p+eWnhfObkprJ5ndF6wY7DM75ri
 VViJexUTAn0tAMuSEcLxSC3FqL/JUCBI8vRA1fvCu2BIbzgjhzOLrsorSrBLj10sqL1w8ZimBia
 8eHbwXrot5DU3sQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_061542_944439_D640FC4B 
X-CRM114-Status: GOOD (  12.66  )
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
 drivers/pinctrl/sunxi/pinctrl-sunxi.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
index bf8612d72daacdde6209b0b5c84e010ef3b846c9..9a94c5276828aca51212f536400897e447c62ecd 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
@@ -955,8 +955,8 @@ static int sunxi_pinctrl_gpio_get(struct gpio_chip *chip, unsigned offset)
 	return val;
 }
 
-static void sunxi_pinctrl_gpio_set(struct gpio_chip *chip,
-				unsigned offset, int value)
+static int sunxi_pinctrl_gpio_set(struct gpio_chip *chip, unsigned int offset,
+				  int value)
 {
 	struct sunxi_pinctrl *pctl = gpiochip_get_data(chip);
 	u32 reg, shift, mask, val;
@@ -976,6 +976,8 @@ static void sunxi_pinctrl_gpio_set(struct gpio_chip *chip,
 	writel(val, pctl->membase + reg);
 
 	raw_spin_unlock_irqrestore(&pctl->lock, flags);
+
+	return 0;
 }
 
 static int sunxi_pinctrl_gpio_direction_output(struct gpio_chip *chip,
@@ -1597,7 +1599,7 @@ int sunxi_pinctrl_init_with_flags(struct platform_device *pdev,
 	pctl->chip->direction_input = sunxi_pinctrl_gpio_direction_input;
 	pctl->chip->direction_output = sunxi_pinctrl_gpio_direction_output;
 	pctl->chip->get = sunxi_pinctrl_gpio_get;
-	pctl->chip->set = sunxi_pinctrl_gpio_set;
+	pctl->chip->set_rv = sunxi_pinctrl_gpio_set;
 	pctl->chip->of_xlate = sunxi_pinctrl_gpio_of_xlate;
 	pctl->chip->to_irq = sunxi_pinctrl_gpio_to_irq;
 	pctl->chip->of_gpio_n_cells = 3;

-- 
2.48.1


