Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1141BC3ABCB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 14:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=77V/U3O+cTLaLaQfV/pKGfAWbRyDYwBVlD6FPlR2wRI=; b=Y/jgdMaYV6hoNUQfmzF1YsJjMa
	vsFNKFMje5fhXKAh4qPJqqx+JZI0MlMpt1SS/5xv2q62Y3mBdB9wwsGUjCXIbkUpRMyNmQyTy+Y4Y
	b5TGXQXNWGl/wXjgBEdvoeu/3L6kesg6yVqlvmp+r1qJWZMbOe3hwBcuWqrqJlNiyXyqH8WOLo0WI
	i6NI0Biyn7fHSpP1K4q99NLRceyzLtnaeGe5pJzPyTbW1beUdhhIISrAtGL+ckAmyx7Efl8M1cJNS
	zPl3msCOqLRFoVdCSaDGHBhyIwymjR7gckKTjEztgyvg+VjrQTeRRFPaM8w9XuxwqhqBAPqHHW1ID
	tpg6D6+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEUKo-00000009lVr-32zI;
	Mon, 12 May 2025 14:40:50 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEU3e-00000009hmy-119f
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 May 2025 14:23:07 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-ad2440926adso275642966b.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 May 2025 07:23:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747059784; x=1747664584; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=77V/U3O+cTLaLaQfV/pKGfAWbRyDYwBVlD6FPlR2wRI=;
        b=KZNo6zKhmYKwRPeCECpv0du/S9bSRpTyImQppMqYNg47zWFOwa92n3NvKPH/Ty1H2S
         PJQjiTE8cjKL1cvjmfegs5ZAysNnatIhiD2maue+qc5WwgXqRHkJAiL+MasE8BDeW3GB
         eq5T+HTGPtkrZ5bO4jNBgSzVelpFSQRtHeWR5GiTvOd9OsYslEnwcg8LSCuRjQsFPxay
         D3XDmNPhjotUP3u74dY2K+RjwwqG4ZQFwjymXRmZGCvN+pbHEoHT+HmsFGX7GtcLlCDV
         rL1YTPJGWGy1hKjwJRFCSo3Q4f7rbjStZg3O5HXauH1Gqn+6+uAnRpurTgncdiUeF7ic
         wkvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747059784; x=1747664584;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=77V/U3O+cTLaLaQfV/pKGfAWbRyDYwBVlD6FPlR2wRI=;
        b=GAXA1I/JrZjSJsk1nd5Zc/VpElCLcj8pheR5FXyEu5RIpTSbF9fg0GDQu5pc1pfVBO
         faZeN5eX8aBkKRVmelY3Mhs5lODAX78Z3ykqd1w5PhZPgeYgq+5EZbV+uSJ3B31OJ4a/
         1CD5I1vHeAp6X2pLymoHRJg8dMqSV+L5J/A9qY9GAccWJ9ND+yM7zZEh+RJ4H8a8ypka
         OM7//f1vKTBZif7AaiyR/ZUHBJq8sPliUdafbHnQ+161vh/MHziG1ySwGVt9l45aHY/i
         up3gwbilhMtahASmBa08rYL6ZGGxI70N+Pg7a3TcnD/XtHqd/5Ye42z5Dmqoe+0gZNwo
         wilQ==
X-Gm-Message-State: AOJu0Yzh3+cTMcbyLjvlXldJTu10k1y6s9wS6ZL93Ho8wKkbKm4rXP9y
	fLnZ0NK7sA659Rv8widUBskFyLN+WqXd8D8I1Q2251v6kxqyuflFo0HwTQ==
X-Gm-Gg: ASbGncsN3LYdqq00Li/qaNSHyN868RDOWSWGUFtqUiFN0SbZ8UZANjsX5DYA+0HCVKP
	ISEobsik6rYet7jF7oC6oPWEwWJo6IJfENeNqvyYDQtfD6hJ4ETjb8OptwN984sMbBVJdqugydF
	QwcYGxqffQXaK2+An1lrkEMiJCfBp+AgD9jbXw3DPtz5PKE2OaAnh2ck4/s1W5PvQu8NRBNrnaO
	9Ez1ex5dqT4KSq49NKGByYQglZQTNruuR8j/dwTQr2WyA6X3k4jOvZD0YY2jyn1eF2aDkXPVuOS
	Qum+yv3Gx7RUXGNnxKYKEs1rHukBGYJ8hE0QdWXt6MejqTeIYPAcMRVqJjcfBVgemBb4j4ay4v6
	yevrM
X-Google-Smtp-Source: AGHT+IGkK/w/ZuLuBloF3PZd71dqrbQ/RypwZRAUlWpdxXu8MgumDQHdx4Av9Rps6vM9mbswRaiYOg==
X-Received: by 2002:a17:907:7208:b0:ad4:d0ba:ef93 with SMTP id a640c23a62f3a-ad4d0baefd5mr32106266b.11.1747059784452;
        Mon, 12 May 2025 07:23:04 -0700 (PDT)
Received: from [192.168.0.253] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-ad2197be0c5sm619626866b.153.2025.05.12.07.23.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 07:23:03 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Mon, 12 May 2025 16:22:37 +0200
Subject: [PATCH 1/7] pinctrl: armada-37xx: use correct OUTPUT_VAL register
 for GPIOs > 31
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250512-pinctrl-a37xx-fixes-v1-1-d470fb1116a5@gmail.com>
References: <20250512-pinctrl-a37xx-fixes-v1-0-d470fb1116a5@gmail.com>
In-Reply-To: <20250512-pinctrl-a37xx-fixes-v1-0-d470fb1116a5@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>, 
 Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Gabor Juhos <j4g8y7@gmail.com>, 
 stable@vger.kernel.org, Imre Kaloz <kaloz@openwrt.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_072306_294769_94D010FF 
X-CRM114-Status: GOOD (  15.60  )
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

The controller has two consecutive OUTPUT_VAL registers and both
holds output value for 32 GPIOs. Due to a missing adjustment, the
current code always uses the first register while setting the
output value whereas it should use the second one for GPIOs > 31.

Add the missing armada_37xx_update_reg() call to adjust the register
according to the 'offset' parameter of the function to fix the issue.

Cc: stable@vger.kernel.org
Fixes: 6702abb3bf23 ("pinctrl: armada-37xx: Fix direction_output() callback behavior")
Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
Signed-off-by: Imre Kaloz <kaloz@openwrt.org>
---
 drivers/pinctrl/mvebu/pinctrl-armada-37xx.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c b/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
index 335744ac831057576473dd62c5533168b243a656..43034d29292687e875136aafa530b62479dc55ec 100644
--- a/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
+++ b/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
@@ -417,6 +417,7 @@ static int armada_37xx_gpio_direction_output(struct gpio_chip *chip,
 					     unsigned int offset, int value)
 {
 	struct armada_37xx_pinctrl *info = gpiochip_get_data(chip);
+	unsigned int val_offset = offset;
 	unsigned int reg = OUTPUT_EN;
 	unsigned int mask, val, ret;
 
@@ -429,6 +430,8 @@ static int armada_37xx_gpio_direction_output(struct gpio_chip *chip,
 		return ret;
 
 	reg = OUTPUT_VAL;
+	armada_37xx_update_reg(&reg, &val_offset);
+
 	val = value ? mask : 0;
 	regmap_update_bits(info->regmap, reg, mask, val);
 

-- 
2.49.0


