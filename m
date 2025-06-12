Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AABDC61CE8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 19:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3kdCtMGqd8snTnoQ+DvH1UQEd/O3oxtCQF39dSuJ39Y=; b=O8FOWkBElIzk7EvdQabaTSYia9
	UZvG6NjVjkeJCgh/sJv8+AIBTZI82jaZME3wGAlKETyK+UuxopzSugHp5FqD0UZQUt7MqPldeNTck
	BtHpl1KkHGuWkuspJbls34yWC8KavH/IpZpKIdiDCVgkmtcvTs8JIr6UxRcRF4jXMbNs73elg0fqr
	NxyBmS+8gjUlxz1XYo7klrRAejd3rVTA/LGXzWTUByX0SSWCi7TnTkQxE1QyCaMWZFGkDHWL0vZNb
	TAfLO7USjSzhgKle2Tn+JJU1KkDgTLhrYYfJusVAPueT4P3bQfAL2URFlEj3AnCfuW3kfYE298iZe
	u3AttBww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPnnR-0000000EEN2-2yYB;
	Thu, 12 Jun 2025 19:41:09 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPhmO-0000000DLnA-1TJJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 13:15:41 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-451dbe494d6so11736505e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Jun 2025 06:15:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749734139; x=1750338939; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3kdCtMGqd8snTnoQ+DvH1UQEd/O3oxtCQF39dSuJ39Y=;
        b=IzcqFrVInHgMKabjtegupn6hZOlU1mED4bCudZQ5Xv+OtGP7fKiQWkugV1qMJzPu2W
         bEq/US4Wm4+BAMAo9oiELcJRasqT4d1kD2yjfoXbfo4Z1qIQMvw7f1TemoS1Dn5/NOOg
         4AnEc+EPGjWXDNV2wJ53KhjqQg0Q/X9S99vdtW1xutuzcL6rdXKyJDtztPSdtVqRTEbd
         g9uwXg5mc9puhQZr1JMDIFBIev1rNbY2Urim40dpbCgJcvcB0pXGdxH8/mDS2ZSHelkT
         ZB3wEYpV7WJq/JaTzrBvrMsH1vqkFnbdGkzTf59cfxui0xoFlAVHXPFwnhk/l+XTFBTv
         K7pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749734139; x=1750338939;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3kdCtMGqd8snTnoQ+DvH1UQEd/O3oxtCQF39dSuJ39Y=;
        b=tDaSNbIcdGnXDr8/C5uEXy6qRBEBar25g/U1LrknGeXs6kbIVIjxtZibSITBBFnVZ1
         qYbO4RedHSepa+JaPztSoESQ+pRC38RUbDQ8+9P+1qMAg4QMc56qoZftAk0tXiO+rCKA
         DvMoxr0v5jQy5DTtgDHPqhafkstf5fBUVvO/GUDyNc99zTQI+kiOYFx5jfYLZuiybNod
         hVANIvEZK/Amq8vnCv++X9obfHIsbxoH7ynYo0jYZHVa5Azq74EOSutFvTF04iJBcSWw
         depLd7CnGGup5ZWyvfeJNIijNBVmEcZPc36dqURpA3q+Ol0IpmPoKRjUPghJLEPSEsig
         B1wA==
X-Gm-Message-State: AOJu0YwC7t7uaCJBm8XAm7Hijtufe2FImj+VdbEJsku2rGRydXy5hCFV
	vore4Ac21wLLD38jD0ekp82gZShz+byFixb9mOg3ZSIgLwf8bILolNYP9J+Ukh4g1IY=
X-Gm-Gg: ASbGncv0/Q8rs1vOZrt/yPBucvbnVHJKMwMwrnUpqzp/jjbD6HNfFbLSgoja9lxk0gT
	7ymb+TFJLESujZjoe4lpHc4o5BSfPeDqcIvg2z6CHOeKu301KtaeSbRkVekBg0TOFeR0QZfeie1
	r9JxsFGpEqxoeBQaUfUq8//OXGgPolkSErAIt5DMvTqAEFIEkFRaKK3tbX8NpLRH6YNFTRGW5zt
	UsVGqZcAbgw6rIzpc8AtShJ8xxozBkdULNS0tueuA0z0/xECEypya2DoZNxdYQfyEIr5gwLnwZ+
	otZK5c0tSyNSY5srwH9Y0uFQ0sZ1q7PSXVjLOv79vWw2KX9WRxdOj3q9GALwWuDL6A==
X-Google-Smtp-Source: AGHT+IGl8eW8WnL+cIAddPc5eM66HwVHrNHEeYaEVb5oP5iPREXvfn5SVQ58c3fSGe7nsIDDe/S61w==
X-Received: by 2002:a05:600c:1386:b0:450:cfe1:a827 with SMTP id 5b1f17b1804b1-4532d3299f5mr29713045e9.31.1749734138978;
        Thu, 12 Jun 2025 06:15:38 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:8b99:9926:3892:5310])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532dea17d7sm20619795e9.10.2025.06.12.06.15.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 06:15:38 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 12 Jun 2025 15:15:21 +0200
Subject: [PATCH 12/16] pinctrl: spear: use new GPIO line value setter
 callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250612-gpiochip-set-rv-pinctrl-remaining-v1-12-556b0a530cd4@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1988;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=Quh2BKoDNlMEGO9ydmQRx8uUPC9cI403NRhtbznDNiA=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoStLmiiG0NS7y222qXdi+UK1gYs11zyVNle3ll
 7695Du5fQuJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaErS5gAKCRARpy6gFHHX
 cjHTD/0QOLxxD5opxxXzFfIt89ty+lC0lghLR0yZYrf36EMOnwkkHtmGCsjxHfOnT0/73ea88cP
 BravFuaTrO9sftxm8SdI2BAQv37NtThvkmJF3q0Qbfp5EFXSC5ULs9W/tIdqsYQl69+EvGegQhe
 CDjFPkxd5m2z+aag5lFhpTsTXq3C12nMbgyUA1ycXYTndObv0TbV0zFIYxHnJSMGdkLwLJPQFAv
 PG9wjwBT4L1FzNMTYG98IdDTisCAYEpKsTMq8P3CCHB865IaWhxMRR9b3jKlwY5Da6ChTYY95F6
 VQOHgQrVo6tGqs4P3E+5QmY9RWj20w8wfoGxN187W2WGFS1maDLwfTNRfq1MhixKopBADFwMZfS
 +9d1ElgztrQhn4tIxBfl17thgN/j5PWlirVM7vscR2L6GvE+PXplIUVYURjbz2X2ZJFuSY8x0hy
 GHFLJqI2/2oid1h7jUJJQAPVsJzI9h6fagO8QlxKFWnwQlFieKd8fp7J+o3FimezPmJ1iDZ+Q7j
 AeVH1PN8imcKdY2m+hCwoK4XXTn9Fd4fPAFYRSO8abRFNbd0PcvXzmvsVENjXQlaUTyblsm6txX
 gxDyv8i63/C/D2iK2iAr6J77BMI3gKO9NsdJLWsU3y1BSLFNzNpe5REp2gyzX1i7MgaAL1bA2fS
 1tzGhBqfBBHQqOw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_061540_400832_A638CC7D 
X-CRM114-Status: GOOD (  13.93  )
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
 drivers/pinctrl/spear/pinctrl-plgpio.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/spear/pinctrl-plgpio.c b/drivers/pinctrl/spear/pinctrl-plgpio.c
index a05570c7d833d9b8268989f2a6e54e1873d20de9..e8234d2156daa5ada8adff5848ee4cf136257c3f 100644
--- a/drivers/pinctrl/spear/pinctrl-plgpio.c
+++ b/drivers/pinctrl/spear/pinctrl-plgpio.c
@@ -181,24 +181,27 @@ static int plgpio_get_value(struct gpio_chip *chip, unsigned offset)
 	return is_plgpio_set(plgpio->regmap, offset, plgpio->regs.rdata);
 }
 
-static void plgpio_set_value(struct gpio_chip *chip, unsigned offset, int value)
+static int plgpio_set_value(struct gpio_chip *chip, unsigned int offset,
+			    int value)
 {
 	struct plgpio *plgpio = gpiochip_get_data(chip);
 
 	if (offset >= chip->ngpio)
-		return;
+		return -EINVAL;
 
 	/* get correct offset for "offset" pin */
 	if (plgpio->p2o && (plgpio->p2o_regs & PTO_WDATA_REG)) {
 		offset = plgpio->p2o(offset);
 		if (offset == -1)
-			return;
+			return -EINVAL;
 	}
 
 	if (value)
 		plgpio_reg_set(plgpio->regmap, offset, plgpio->regs.wdata);
 	else
 		plgpio_reg_reset(plgpio->regmap, offset, plgpio->regs.wdata);
+
+	return 0;
 }
 
 static int plgpio_request(struct gpio_chip *chip, unsigned offset)
@@ -579,7 +582,7 @@ static int plgpio_probe(struct platform_device *pdev)
 	plgpio->chip.direction_input = plgpio_direction_input;
 	plgpio->chip.direction_output = plgpio_direction_output;
 	plgpio->chip.get = plgpio_get_value;
-	plgpio->chip.set = plgpio_set_value;
+	plgpio->chip.set_rv = plgpio_set_value;
 	plgpio->chip.label = dev_name(&pdev->dev);
 	plgpio->chip.parent = &pdev->dev;
 	plgpio->chip.owner = THIS_MODULE;

-- 
2.48.1


