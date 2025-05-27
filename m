Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A66FAC54ED1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 May 2025 22:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qtRNQ56JCfgrnMcDjdIFoHIc0A/gd+Rgg9E20WRMEWg=; b=gXs4Dd+8ZqXWrDm+Vg2a8z9v0A
	3x9GbUdYO3MvH8fAJlshvhrJ0LGpR0be1A8eSzqeW+PgehFxZYkxZePzMRnotwHju5yqTPBXz85cm
	7FrNezS/lrkuRNHmO0WaKb8Oc01Hx90P66eHeBlR0f5WTYyKdxVjHhxTu1gfHNyA6vHjNoVFqDpde
	ezFxQJ9eOYRMV+w3x0D6viZ1tgmC7f/PQ+VmmXZWNU0olbZt3ItM/lmZRZNRmPmW/2li30u/C2y+q
	JjMGlnOLm+2jZWIgt8aiS7plu2gDSq0+MzmcS4Ek+pu+ZuXfoYeELSYFMV/v2ptX8qiYt62nI32YK
	uShBowUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uK2jl-0000000Bi5F-3HHz;
	Tue, 27 May 2025 22:25:33 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uK2fV-0000000Bh1w-2LhQ;
	Tue, 27 May 2025 22:21:10 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-3a3798794d3so3899724f8f.1;
        Tue, 27 May 2025 15:21:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748384468; x=1748989268; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qtRNQ56JCfgrnMcDjdIFoHIc0A/gd+Rgg9E20WRMEWg=;
        b=FN2xEcTtDfaAcb4FeUPHfgyhTFAHROX1dPsBj1GZbQCMqEX2M3g6fuItvbk/+b8YHZ
         hezyUkEKpTdN77G1ZzKpgMQVOb78ZMUf0xGBbK/YEkOKcfBWgYEbzzKMK41LTh6yzfKs
         KZtqTFbUKjKxZ2nYgwwZxa4vTHQ3tXZIS36agEf6Tw2w9RDl3XDq9LhmDjH/88CXw/km
         LUUrct4sUJLsaPymzMqCGMZtmjpqyG8SlXxUb8WRfJHHNvS7rynTvb3DPP5ne9d4jChQ
         y2jMgghGGqRTsS9X9TEjq3sK+42ZyYQdf0pIpRYj79cm1ONCZyAkOvnPzU5D7w0UrT+o
         FFbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748384468; x=1748989268;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qtRNQ56JCfgrnMcDjdIFoHIc0A/gd+Rgg9E20WRMEWg=;
        b=L8ab6XKORiKYM6IOZMcTOwQLPwjcI0i8L/nt7XXLlSXjE3BUmrtgsv2R++iA0oSPwN
         rBbTq2bVxWyMqY55Wi1JGEGrakdXu132n+p/IQa8WOQ04bD0GMLDWFBktGLczMxCpmxZ
         eWboHQXS7GVNDPhEEdLv9kDi0gSC8upUIFsCz+8VzfJPSlBaYX93xUEqBOBtElHgpkzi
         xZBP9Q1VYUUvOeDIq/Q7da+RwQZxphwrdOvOX/NAVGE7CGPqdsJXyaaCIV/fDHGglyA1
         3Jap/epSrW2Z6MqUwbt59ypyt3jjuvo9u10Q6MQoiAL82u2ccjQIaoyfB33jKr/yRKg9
         gPEA==
X-Forwarded-Encrypted: i=1; AJvYcCU/bi/NNnHwgYAlKB0EDO7aweaQqYmgoE8eaT1j2DVyfdFb/akalD6NJadjg8ehOXuauJBq71Ub/JF5zRefy/TZ@lists.infradead.org, AJvYcCXeELKm+x8jyDUlA5MuWh3BfeXSlJFzrOQXaecPboa1wmqLkEnCpD7stWejm4UrsfzttQhTPcaTQE1V5O1Sgc4=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+oA9dSqcQxiRNLv7HzcXB8j00pDM3RISWfVwnP77sd1dRF4Jq
	yR/+VHaIfcx26CgBdLYLAOL6bAQd2g3sSiz4guZvZEPW8khVvhZPWK6PNRZ7aA==
X-Gm-Gg: ASbGncv+gut8h5rpytZnxW8cIwq2wA6BAZbUNOnPE5QU9fphyD/GGN0iYolYITRSSvt
	sMwUgi9NPGGYW+e2xbyjaSkQGwYvOxM3e8QQcuuuIU5oHN5mmskOFJXlkZtJbVkSAsI5tx4WVtp
	4Njq4iTQZdD1I9vjrLmUq52dhqZ7yExaFPWPGwZwpufqGoVqK3OGk1QNrveEBXTInKILpDpyi3d
	446hZsJVdzX0orfPoWxDprWbiE/YD2mMdX5iatYRiGqm2gL4bNMCqy0ntKk8jejyEdnp0UVOU50
	kz5LdmsuJRelTYz1ZKHlOvFL/dQ7GGyZxoSYsKEG1yy2nDmiwYKFKTn3rnYgULExN6E3eRvOPNp
	oZChnCa8OGlM1xPky+cZl
X-Google-Smtp-Source: AGHT+IGJ4GaZDmuiWlWBMloHir3Uikj0Tke7oxruLs3NxHUz24IFjqZ/+AijntCgg1SM/vUTphqGVA==
X-Received: by 2002:adf:f192:0:b0:3a4:e629:6504 with SMTP id ffacd0b85a97d-3a4e6296763mr1500013f8f.49.1748384467687;
        Tue, 27 May 2025 15:21:07 -0700 (PDT)
Received: from localhost.localdomain (93-34-88-225.ip49.fastwebnet.it. [93.34.88.225])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a4e8bc377asm233366f8f.72.2025.05.27.15.21.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 15:21:06 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Lorenzo Bianconi <lorenzo@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sean Wang <sean.wang@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benjamin Larsson <benjamin.larsson@genexis.eu>,
	linux-mediatek@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Christian Marangi <ansuelsmth@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH 1/6] pinctrl: airoha: fix wrong PHY LED mux value for LED1 GPIO46
Date: Wed, 28 May 2025 00:20:33 +0200
Message-ID: <20250527222040.32000-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250527222040.32000-1-ansuelsmth@gmail.com>
References: <20250527222040.32000-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250527_152109_598490_6407D46D 
X-CRM114-Status: GOOD (  14.12  )
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

In all the MUX value for LED1 GPIO46 there is a Copy-Paste error where
the MUX value is set to LED0_MODE_MASK instead of LED1_MODE_MASK.

This wasn't notice as there were no board that made use of the
secondary PHY LED but looking at the internal Documentation the actual
value should be LED1_MODE_MASK similar to the other GPIO entry.

Fix the wrong value to apply the correct MUX configuration.

Cc: stable@vger.kernel.org
Fixes: 1c8ace2d0725 ("pinctrl: airoha: Add support for EN7581 SoC")
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/pinctrl/mediatek/pinctrl-airoha.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-airoha.c b/drivers/pinctrl/mediatek/pinctrl-airoha.c
index b97b28ebb37a..8ef7f88477aa 100644
--- a/drivers/pinctrl/mediatek/pinctrl-airoha.c
+++ b/drivers/pinctrl/mediatek/pinctrl-airoha.c
@@ -1752,8 +1752,8 @@ static const struct airoha_pinctrl_func_group phy1_led1_func_group[] = {
 		.regmap[0] = {
 			AIROHA_FUNC_MUX,
 			REG_GPIO_2ND_I2C_MODE,
-			GPIO_LAN3_LED0_MODE_MASK,
-			GPIO_LAN3_LED0_MODE_MASK
+			GPIO_LAN3_LED1_MODE_MASK,
+			GPIO_LAN3_LED1_MODE_MASK
 		},
 		.regmap[1] = {
 			AIROHA_FUNC_MUX,
@@ -1816,8 +1816,8 @@ static const struct airoha_pinctrl_func_group phy2_led1_func_group[] = {
 		.regmap[0] = {
 			AIROHA_FUNC_MUX,
 			REG_GPIO_2ND_I2C_MODE,
-			GPIO_LAN3_LED0_MODE_MASK,
-			GPIO_LAN3_LED0_MODE_MASK
+			GPIO_LAN3_LED1_MODE_MASK,
+			GPIO_LAN3_LED1_MODE_MASK
 		},
 		.regmap[1] = {
 			AIROHA_FUNC_MUX,
@@ -1880,8 +1880,8 @@ static const struct airoha_pinctrl_func_group phy3_led1_func_group[] = {
 		.regmap[0] = {
 			AIROHA_FUNC_MUX,
 			REG_GPIO_2ND_I2C_MODE,
-			GPIO_LAN3_LED0_MODE_MASK,
-			GPIO_LAN3_LED0_MODE_MASK
+			GPIO_LAN3_LED1_MODE_MASK,
+			GPIO_LAN3_LED1_MODE_MASK
 		},
 		.regmap[1] = {
 			AIROHA_FUNC_MUX,
@@ -1944,8 +1944,8 @@ static const struct airoha_pinctrl_func_group phy4_led1_func_group[] = {
 		.regmap[0] = {
 			AIROHA_FUNC_MUX,
 			REG_GPIO_2ND_I2C_MODE,
-			GPIO_LAN3_LED0_MODE_MASK,
-			GPIO_LAN3_LED0_MODE_MASK
+			GPIO_LAN3_LED1_MODE_MASK,
+			GPIO_LAN3_LED1_MODE_MASK
 		},
 		.regmap[1] = {
 			AIROHA_FUNC_MUX,
-- 
2.48.1


