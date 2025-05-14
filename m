Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C118C3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 19:23:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e+3rMB7TgpOuv4MciTDXaw4O2zORwfW5g8/Gm6AF5Sc=; b=Lufs/P8Jf0shoLVo2ON2As/Xy9
	nwad+HYxFBzEm/B0E0gsOKi8e8mVKe/0SDTXNPPNVcUbdlmNGKrQXs2ANW3BKVdh8/1n1bVGCruXG
	FklGwpjqXByx4uQBH4ZIk5QvKYOFihscZB/Xi2pd/KC1a13S87IoR2u6rxi6svgcuBIMkNmwF7ntg
	4g5oZdKoIH8GGHWW8NwclZ4JHWd4pl9OU46+FaJwaFuUdS5KNWIE8pMgaU6NOXFsjOALFuJGTY9dI
	bLotAWSEnvRApPWpVv4q2i12NCWy+7Q2YicnsXoJ5j9Id+gs9ogvBUXM+qq3OYTNip6u9BV5oYRsV
	8ZlbMidA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFHgw-0000000GAED-2JC0;
	Wed, 14 May 2025 19:22:58 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFHcu-0000000G9UL-1OMg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 May 2025 19:18:50 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-441ab63a415so1649485e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 May 2025 12:18:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747250327; x=1747855127; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e+3rMB7TgpOuv4MciTDXaw4O2zORwfW5g8/Gm6AF5Sc=;
        b=IsabWwLW1XLdNAd4V/JDlH5Sir0jtoz9kKR7KLuA2Buxg388sig26qMuS60qHVUROH
         ZsnqmVCdnXMVmB2l61p4Xy8Qjg5cLUSJFJRHGbdhUVsS7TtDjE03ErgjQ2l24Mrq5Vh9
         BHY3q7cB2EmwqZjE3eQ98HTt0X/itvVQ8d90ggcqwa7g2aaJzFoC8bcxiwjLM2RIWrG4
         b/W/I+ATSeRz4WWWojLngswK5XZ/suGqD3SijdV9S5zqUULE7w3bJvD/4Niqtxhex8Md
         Kd9Ad0OzuYX4JGopicto8nL9CkLz4Qxt07U/i+dxN3YQcvUUTPkq6DCsfOZ7V/5bMut8
         wNLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747250327; x=1747855127;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e+3rMB7TgpOuv4MciTDXaw4O2zORwfW5g8/Gm6AF5Sc=;
        b=ZORWbttKedytWHa9jPiAaDySOkG7QP0akxqIMXvbGZ55VmOAr2rrFZGuDkJ4Ppn16Q
         tsLj9BaTaDyVEF2Na1q6KCFyHNFt5XQiQzC6zNizjtXadrv/e/rtlriK9jBfF2dpX1ds
         C11jGuuEg8aVlGjdzDz01S2idzboZJG0fkKMN/TNHLVW4K3VfiSenTxr6CrSUKmoD/aY
         Xn46eZuTg+UCi41qGcMbr+HqnPZq1/q4Rj3qJFQWIHVj6XbYb0Y0K+D1onR21vUhow7m
         ig9e7pM3nDejLIZIesbpUD4rYl09RcBZCvIrSTKHP8KuvOio8fE4kkjZY2mimcVTJ2eH
         +a9Q==
X-Forwarded-Encrypted: i=1; AJvYcCU3oK1H+EKvQHaYEyjZuiK3oQA/UkzHY5Vyh8sY313ngATCk9X2jB8792y0qFXXm/Ll5PxzW3jSpTy7dRmZ1oeO@lists.infradead.org
X-Gm-Message-State: AOJu0YyMnZkrbDQ/l8gpzDHTBxcaLpBf1d9g9svAD9bSr5fAa5MSP9QD
	AIC7wUrX6X+0obMyWPF/SDtYxY94IpWeREA1oIeUfX0QCACLnY1v+nCbvw==
X-Gm-Gg: ASbGncuT0Z+ZpnTcl/HgOmgZOkevwot8xGQs6lxISEZdAHq8UYaDTiUWwMoNzTRNqjZ
	WBtctKAt/lzhv7oPOHVB8xPfduz7vm6WE9KoYKeq/W6Dl/g5x7SwkmH/Xr1LneA0dcg8P/J/Lqx
	BIIZNpxZWGq1a3dkg+tZZbAbtkGcxAZxdYEnr7NRAGp7gHjnWUpmpfK+4qbP9lIb1FckDPNfZVB
	4eJly/pffdxhd5CCOJWBHA0unsf1atKznV22vNkp5+D7unIHbn5Agqe9SmzYEqs41nvafoewWOW
	AGdYuh5fIPPsjcsSdjGc6KgRNLFNhAEa5kTS3y46Styic8It6tY53MEci43YNB157ozCf4G70cc
	SKdCpwtJQb4MlLTw=
X-Google-Smtp-Source: AGHT+IF3E6LnoIX6JTtY3lxfeZ+NzzfzZnch+kPaMH0wTlfbXodC8lOmf+uaRXXzGO1KAKLVlDBUUA==
X-Received: by 2002:a05:600c:1f96:b0:43c:f78d:82eb with SMTP id 5b1f17b1804b1-442f2107a53mr42040395e9.15.1747250326663;
        Wed, 14 May 2025 12:18:46 -0700 (PDT)
Received: from [192.168.0.253] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-442f39ef811sm38707525e9.35.2025.05.14.12.18.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 12:18:45 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Wed, 14 May 2025 21:18:32 +0200
Subject: [PATCH v2 1/7] pinctrl: armada-37xx: use correct OUTPUT_VAL
 register for GPIOs > 31
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250514-pinctrl-a37xx-fixes-v2-1-07e9ac1ab737@gmail.com>
References: <20250514-pinctrl-a37xx-fixes-v2-0-07e9ac1ab737@gmail.com>
In-Reply-To: <20250514-pinctrl-a37xx-fixes-v2-0-07e9ac1ab737@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>, 
 Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Imre Kaloz <kaloz@openwrt.org>, linux-arm-kernel@lists.infradead.org, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Gabor Juhos <j4g8y7@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_121848_378222_DEA598E4 
X-CRM114-Status: GOOD (  16.25  )
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
Signed-off-by: Imre Kaloz <kaloz@openwrt.org>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
Changes in v2:
  - add 'Reviewed-by' tag from Andrew
  - reorder 'Signed-off-by' tags (result of 'b4 trailers -u')
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


