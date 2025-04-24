Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4F69C369D9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 11:07:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IcE3wUuPhjxXCt0ZMpAZ5x8qSYr01DaOTal5Jl8GTWc=; b=1imBwnIjKhtYy9+722LuVyAfo4
	eZilYsLT+rNTUoSi37F+ot2oTbF8qtnICBM6cBotcQX7WDJGOU6n0a1lZLn3r2QPjIaAKy3vLRuX/
	gYLc53ApuaP1H1UVfbeHT6dkq+/jBaL9lX1egZuSpDZnYxdRhmm4q7k+Idtrz88KzSrwTOSyAA/Kp
	gBGYc0brUa0iNlOTSdCbGWwixgJ4wmtjfEl5hz1irm5n4YXBimKLe53OqV9wecudsj8sFT9/hNvZX
	PWx1Rle+jP3+kXCib3nlKIY6JJC2EaeRNQ/LDfrn0pcoScf86AJKkeydMecbuaEjHAOWgxHX/iuqr
	w79j4tVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7uQK-0000000DnbX-0icr;
	Thu, 24 Apr 2025 11:07:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7s3n-0000000DLAg-0YSY
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 24 Apr 2025 08:35:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=IcE3wUuPhjxXCt0ZMpAZ5x8qSYr01DaOTal5Jl8GTWc=; b=mSTZJNOqxVJW7L1vCN2dpjMyEC
	tzhZTnYj/mKoVMjq++ZzzTMZlj0pzv4vKJY2oGmAy4sh8kIbuvBPzYHt5EQcDZ4qIDLFoAVuTse/P
	JZqmbH/1EfSy3JmdgH50NcGSpwM9I7ygp/w65/cHpiLBiesnqsue8QSlGRlRdBb/N25Xt+s+DfUDL
	rtramurHCytrqYABkBuE5BuvdwL19XO6SMHQ83oRHAgsf81iEiwuTcgw7n8GZ+Qn50DRtcIF3y698
	5nPLERveTypUtf7kg+OuGx9ytFpJtCKIOJe3vWMONWEKgC5lWnjQSsECCi5HYZIwnx2IJLGIYaB5z
	aqyD9q6A==;
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u7s3k-0000000Bciw-1B2s
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 08:35:54 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-39bf44be22fso507489f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Apr 2025 01:35:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1745483750; x=1746088550; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IcE3wUuPhjxXCt0ZMpAZ5x8qSYr01DaOTal5Jl8GTWc=;
        b=JoxgCgsn2jZ9MLMX0mmEMvzr/gyzzboLG4F58c3hJShEg0tyEJiFtGOtWlbeVuDipv
         d0o1yuTul+k1Xx8tY3gbrVxjYG3ZUibAe+hhqCPgIUDUHIaDlK/tStrVubuXrynODAwj
         SCyIpANgoGUmqBU+9+2hcUcOnYCKyAjCwNsIZwEA01LCw8tqSmIjgPpQexAZ0Z/fzJuS
         gnDK4H11bAKfzYsJG/pYgXOV3JzHOuuQryjd2MJtRECUJnQMVZdujQ1kwtrFOlQ2I7JN
         p2yu4H2x7ixQUbz8PMMDMx5gW5jVE+A9TMGRghQuEbhe6GV7TmZgjfbS+1PQrDff4m3+
         NS+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745483750; x=1746088550;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IcE3wUuPhjxXCt0ZMpAZ5x8qSYr01DaOTal5Jl8GTWc=;
        b=i4JO0Z7lWJvYxLOD63kUz38F+0lGqFGwX+pDTCglIcf6fgD2W991jvDfOa3MMWwf9z
         Ztqt8rpeOnKQUmXVMvlEkbhHUEG0yWYKe3bdEp/3rsjD6TYLk9HFq6V563xWQbzaItXg
         U+YuheWGRYDA874XUR7I0YaSlCQ6y2l/Ez9lYbol0d0cojMBk6oPdSEHN9rdnxT6nSjs
         ZhVHndexBaYCGNsSAUtwDjtzBw85gGupVBFYBx1LhQciVLIg+QA6TGB7s/dKx1rvyjvU
         S1I4cDxD86imyS5vmQaQkNJnzTODU4GXQ0y2GoRAh/CcWZu0MncQUjyM6BLFYfjzfvVS
         Vq5Q==
X-Forwarded-Encrypted: i=1; AJvYcCWvApMVBBBSDD5WuFemDZ2uOnY25STWmt5G2l12GmUiWRH4xGdfM1x09HcA+mTn1CMS0Aw8NAKVl50ijNf40MLN@lists.infradead.org
X-Gm-Message-State: AOJu0YzA6hCx3ZIwLWY/l+aRuaW2piOE8JiGjtU7zG7wBofMCLHrZKn0
	OJo39zdr1aHz7c8yl/udbHiPLQRMuW8qCHFJVQt6QFUzchD9dME88f1GEFVCbHI=
X-Gm-Gg: ASbGnct1yZSoQfVNUHkjA7FwkiyC6hatylfKyvj0qyeVAFh4VpttnaiCs0Psu4m5iFg
	Z4MMlT2nytVFzuolCVpUCU+HX76QGi4Phn4lqplTm5uJSVny/vbRBp+wXs6nVFXJJOVgJHR7FKE
	mOy/0AgJZhiJOuR8AsWAS2dU5X9lWAgWKBIYYkk5O/TCcWIKQ8sjxXscplaSw2Q6TZ9WxljwMUX
	OMjTLhPrv6awQAL6Mv+dRmmImrcKyIGQk9ONejHMjVX4HInFhVDZI7BeXP+bjV1IYHfctzGyW9Q
	yoNHmAw4MgCdtsRkF354RTiV5LoUj6zOog==
X-Google-Smtp-Source: AGHT+IEsWzX9QhjOfL10bahhvABCZZd6/bNw9ibC716v4NWqAwsMmmJhcU6LjMO+0JhmAyeRMjtJnw==
X-Received: by 2002:a5d:64c7:0:b0:391:4389:f36a with SMTP id ffacd0b85a97d-3a06cfaf773mr1144784f8f.48.1745483749924;
        Thu, 24 Apr 2025 01:35:49 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:6266:7750:57ce:7cb4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a06d54ee11sm1295376f8f.97.2025.04.24.01.35.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 01:35:49 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 24 Apr 2025 10:35:28 +0200
Subject: [PATCH 05/12] pinctrl: stm32: use new GPIO line value setter
 callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-gpiochip-set-rv-pinctrl-part2-v1-5-504f91120b99@linaro.org>
References: <20250424-gpiochip-set-rv-pinctrl-part2-v1-0-504f91120b99@linaro.org>
In-Reply-To: <20250424-gpiochip-set-rv-pinctrl-part2-v1-0-504f91120b99@linaro.org>
To: Basavaraj Natikar <Basavaraj.Natikar@amd.com>, 
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Chen-Yu Tsai <wens@csie.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 =?utf-8?q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Paul Cercueil <paul@crapouillou.net>, 
 Steen Hegelund <Steen.Hegelund@microchip.com>, 
 Daniel Machon <daniel.machon@microchip.com>, UNGLinuxDriver@microchip.com, 
 Ludovic Desroches <ludovic.desroches@microchip.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Andrew Lunn <andrew@lunn.ch>, 
 Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-actions@lists.infradead.org, 
 linux-mips@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1473;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=AUxJDyiCjGLivQstc+QVCLPEZx1XbvG4rMuoF9PwOpA=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoCffbJ94gWt6uen8xm8HSBtLyBXeG+3LKxm5Ag
 6RCSTsSwR6JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaAn32wAKCRARpy6gFHHX
 csj9D/0UiFkS9Foeto0KsdJ24lw9fG4urXmVGhvgv6seCM1EF6eDkw6PCKi4GBqQSeq1yabajRg
 DJXMHRA2AfiRzQqGNnP+t0bEm8pKAY8qKJDpI9ThBQQldJkCol2eNZiexSOlIp+HB5u70AcZKJG
 qzk+58HlR9pOEUN4kaRpkfYa6HeEQH9adnDnZuTt0IzDBPPWb3fefH6xfO79VUAhbX17E3ibf8w
 Zh+ugo2z+8aopq+4jxhsFaY/KgyoW4cURWjpX1D4fFt9WO2EJvHFAZ94pCGsBCDNkKFZDq2PKfl
 VeM1bBsgYFnn4dOFhLSMUbzeN/aEnRIePjyQpJXjmW3l383Ii6unpjfYe5r8UGQ2agPamvsXk79
 XL+90Ned6wgRaRoItB6reFmzOlTkFWVuhDpYtFw76WlTHXdRyuRcHIeWW5GTCbR6T2rwtazHM86
 hTAJY0qL5kAqiwBym23NK2AyHgfDiQo6fLLXkD0L0lDFqeViTNAC6a6ijPeWzs+O6wwM7z9CZCq
 jjCiefFTzSCKU9C2IN3eaizpunc2bYNq4i3MgnxktLJTsxHsi/WGrNlEZxasOkPIOphKYHzXYsx
 n6S2A6WN7t2UBoUeNEArpG8J57u8CB6stqeMrr95xzc0vVgiX+Jxvez4AOXCcBDYLfmDSXTsOwB
 ehvgs5t3m2Tkw1w==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_093552_566622_4D48281A 
X-CRM114-Status: GOOD (  12.34  )
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
 drivers/pinctrl/stm32/pinctrl-stm32.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.c b/drivers/pinctrl/stm32/pinctrl-stm32.c
index cc0b4d1d7cff..ba49d48c3a1d 100644
--- a/drivers/pinctrl/stm32/pinctrl-stm32.c
+++ b/drivers/pinctrl/stm32/pinctrl-stm32.c
@@ -228,11 +228,14 @@ static int stm32_gpio_get(struct gpio_chip *chip, unsigned offset)
 	return !!(readl_relaxed(bank->base + STM32_GPIO_IDR) & BIT(offset));
 }
 
-static void stm32_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
+static int stm32_gpio_set(struct gpio_chip *chip, unsigned int offset,
+			  int value)
 {
 	struct stm32_gpio_bank *bank = gpiochip_get_data(chip);
 
 	__stm32_gpio_set(bank, offset, value);
+
+	return 0;
 }
 
 static int stm32_gpio_direction_output(struct gpio_chip *chip,
@@ -308,7 +311,7 @@ static const struct gpio_chip stm32_gpio_template = {
 	.request		= stm32_gpio_request,
 	.free			= pinctrl_gpio_free,
 	.get			= stm32_gpio_get,
-	.set			= stm32_gpio_set,
+	.set_rv			= stm32_gpio_set,
 	.direction_input	= pinctrl_gpio_direction_input,
 	.direction_output	= stm32_gpio_direction_output,
 	.to_irq			= stm32_gpio_to_irq,

-- 
2.45.2


