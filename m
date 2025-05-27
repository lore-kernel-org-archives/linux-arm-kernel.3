Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8540C5B543
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 May 2025 22:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NtL25+x2x7tW+LP+uVFdYVOdezBzc1auuPCpudqddks=; b=cC4qS/KGEeN5vSPBVXv2groNef
	opzHkNUZb/5QDWId7EZ1A2/MQpn0x1AW85IhoBDnzKFhcRob4PQgUaKY6wlN0IEO2YZmwEkjLt9/D
	RIzZIax0aSZyybDQdFEmN6THgP9kz04ha6qxoCAs7lj/FsEMafdH3wqRSWiAVXlj8HmmCEgs4eW9U
	+Sf8b0r85el2KY5/x0eLP33JhZjPTx1dfe/WFZ8R8rgY4ErjLd7m5b2qnuKoKr/01v7jg29w2LUnh
	zMuKOwsN5WDXb8TaIQDMgjELP+a7mMFGF22afBUDe+MqBs84he16IQBMsdMylJ+zDRd6oSoabiGPX
	dKTL0CZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uK2q4-0000000Bizx-2k5V;
	Tue, 27 May 2025 22:32:04 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uK2fb-0000000Bh4K-0bkM;
	Tue, 27 May 2025 22:21:16 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-44b1f5b917fso23884225e9.3;
        Tue, 27 May 2025 15:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748384473; x=1748989273; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NtL25+x2x7tW+LP+uVFdYVOdezBzc1auuPCpudqddks=;
        b=kmlnN5HuDLJ1vgRJf9cUewPPOEEXo/CvqqCrz23n4XdgM7pE6yPm6FibXDyS3eV0Ef
         2mrfGn3nvBUH6Q/GsQ36Rhtswv8CB2IcVINKEbq6JU6Sy/ciyo412BAzV4a0HGREuJL7
         ZHu7ZGau9UnyDTQX6B2beB2Yen/7orDxi1kHnoBVToYDysTiTsNckPJuXxmb1CHFx+ks
         QOJXGDk/g27GtpGcw8LXu2UTsNeNe6eXYPxX0Dm93J2ytlPER8sd0VRq7xjAPE+sOtBc
         IAEGY+7YDmSulT01r58hK/I3RphruZNnAY+QcAJFpWolcnwPjHhaSnMqHpslWFnqbWp+
         Pyag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748384473; x=1748989273;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NtL25+x2x7tW+LP+uVFdYVOdezBzc1auuPCpudqddks=;
        b=M/P6aoyu7qvd1h8dBLbIr8T9fJ8dOcPnCOIT/GT/IXrrtQwdCZG61fXyOoT+x3hSgl
         61+PeE0tg9MxZsz7jhsOPWlEn+DDZ/fc5aVILMpSLPxWmsHlw43QojXKjwguqLfAKnLT
         FhzcBa0o9ozKSGO7Q/V88LzepQfkHmMLTmEO55edjYe2bxr4V9PDdRbZM0XcjFfJASSb
         Jumi5WW2/ZCSXgZHGZ9MMfjWCyJEf351SpboaCkv5Rir82UKmDAb526DdMTKhWPbkwit
         IE1iYuZv1BtsAHkxibI/24lJekefSD4doy0wXPPVS96FK5x+qyKyFRJqMvvFxBwDTMvx
         rD5g==
X-Forwarded-Encrypted: i=1; AJvYcCV49To1e6q/0ObL3u2h69QYUAtSOo6C8KmbvufeWA1QPTLOYRj7cqRgT+JA0U/iJSocnZlwIJo8KrFFMyTPriY=@lists.infradead.org, AJvYcCVY6M1eikv7+7xX62kwsUcQ5npJ9jArCN6+jiwNz9sagNWRxALqd4VQ/P7c2cphBRFQcWLHUyp0Y0MwewIcx/3R@lists.infradead.org
X-Gm-Message-State: AOJu0YxQyGaQYCHK74hGdElCy6WThoth4MzDgda1zd83x7A79+VsAivn
	+ZgQWFWbJxR1H0+aV4j95LjwiZXq56U47dWeRUsFIR4HOcO/vS7YC+GS
X-Gm-Gg: ASbGnct+AyQwC1mGdC4A2CLSCubvRIuFGoeIqsZVTqF2Aw6T52HorAU01jZvdwfColv
	y73ttdsqt0xskPYfHO70smGK/ed6WVBlR5tjlZ9+EsxC8xzMExzhdLs6Rs7pguO2nMMnAS/WnBN
	hKZpeBxxc3Jrxr2/KOI/O/C+GX0/CQLKJQ6Rq+ZyoJx/GLNlN49arEtbHWVxiRhC/UTBPnFGxVA
	4e9gleANC8shjNzUerK8w6zkkfLoVpmE6HKwncXdko2TOL7qnMRhaktFEqMWjLnlK3CbkOVt0Sa
	/m2rWJNiH7y2UKccHL5cI7yDBnTljT+ItYuPuANutF+0mTEEzwI5Dv40jnlCrEAWUA1setEPO3n
	KWQhwCKhc9SK3G79y7XUG
X-Google-Smtp-Source: AGHT+IFXrLC/3TDzlVpVBCT5kPNh9gS4EkdPFS5QcaYLS+WN965lf7LRn2Ai/4ECmdf0cRui3enRJg==
X-Received: by 2002:a05:6000:248a:b0:3a4:dd16:a26d with SMTP id ffacd0b85a97d-3a4dd16a2e9mr7513089f8f.38.1748384473183;
        Tue, 27 May 2025 15:21:13 -0700 (PDT)
Received: from localhost.localdomain (93-34-88-225.ip49.fastwebnet.it. [93.34.88.225])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a4e8bc377asm233366f8f.72.2025.05.27.15.21.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 15:21:12 -0700 (PDT)
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
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH 4/6] pinctrl: airoha: convert PWM GPIO to macro
Date: Wed, 28 May 2025 00:20:36 +0200
Message-ID: <20250527222040.32000-5-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250527222040.32000-1-ansuelsmth@gmail.com>
References: <20250527222040.32000-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250527_152115_195221_1130B7C1 
X-CRM114-Status: GOOD (  13.16  )
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

The PWM GPIO struct definition follow the same pattern for every GPIO
pin hence it can be converted to a macro.

Create 2 macro one for normal mux and one for ext mux and convert all
the entry to these new macro to reduce code size.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/pinctrl/mediatek/pinctrl-airoha.c | 465 ++++------------------
 1 file changed, 68 insertions(+), 397 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-airoha.c b/drivers/pinctrl/mediatek/pinctrl-airoha.c
index 2b532334d759..8c8d5b598f4f 100644
--- a/drivers/pinctrl/mediatek/pinctrl-airoha.c
+++ b/drivers/pinctrl/mediatek/pinctrl-airoha.c
@@ -1075,404 +1075,75 @@ static const struct airoha_pinctrl_func_group pcie_reset_func_group[] = {
 };
 
 /* PWM */
+#define AIROHA_PINCTRL_PWM(gpio, mux_val)		\
+	{						\
+		.name = (gpio),				\
+		.regmap[0] = {				\
+			AIROHA_FUNC_PWM_MUX,		\
+			REG_GPIO_FLASH_MODE_CFG,	\
+			(mux_val),			\
+			(mux_val)			\
+		},					\
+		.regmap_size = 1,			\
+	}						\
+
+#define AIROHA_PINCTRL_PWM_EXT(gpio, mux_val)		\
+	{						\
+		.name = (gpio),				\
+		.regmap[0] = {				\
+			AIROHA_FUNC_PWM_EXT_MUX,	\
+			REG_GPIO_FLASH_MODE_CFG_EXT,	\
+			(mux_val),			\
+			(mux_val)			\
+		},					\
+		.regmap_size = 1,			\
+	}						\
+
 static const struct airoha_pinctrl_func_group pwm_func_group[] = {
-	{
-		.name = "gpio0",
-		.regmap[0] = {
-			AIROHA_FUNC_PWM_MUX,
-			REG_GPIO_FLASH_MODE_CFG,
-			GPIO0_FLASH_MODE_CFG,
-			GPIO0_FLASH_MODE_CFG
-		},
-		.regmap_size = 1,
-	}, {
-		.name = "gpio1",
-		.regmap[0] = {
-			AIROHA_FUNC_PWM_MUX,
-			REG_GPIO_FLASH_MODE_CFG,
-			GPIO1_FLASH_MODE_CFG,
-			GPIO1_FLASH_MODE_CFG
-		},
-		.regmap_size = 1,
-	}, {
-		.name = "gpio2",
-		.regmap[0] = {
-			AIROHA_FUNC_PWM_MUX,
-			REG_GPIO_FLASH_MODE_CFG,
-			GPIO2_FLASH_MODE_CFG,
-			GPIO2_FLASH_MODE_CFG
-		},
-		.regmap_size = 1,
-	}, {
-		.name = "gpio3",
-		.regmap[0] = {
-			AIROHA_FUNC_PWM_MUX,
-			REG_GPIO_FLASH_MODE_CFG,
-			GPIO3_FLASH_MODE_CFG,
-			GPIO3_FLASH_MODE_CFG
-		},
-		.regmap_size = 1,
-	}, {
-		.name = "gpio4",
-		.regmap[0] = {
-			AIROHA_FUNC_PWM_MUX,
-			REG_GPIO_FLASH_MODE_CFG,
-			GPIO4_FLASH_MODE_CFG,
-			GPIO4_FLASH_MODE_CFG
-		},
-		.regmap_size = 1,
-	}, {
-		.name = "gpio5",
-		.regmap[0] = {
-			AIROHA_FUNC_PWM_MUX,
-			REG_GPIO_FLASH_MODE_CFG,
-			GPIO5_FLASH_MODE_CFG,
-			GPIO5_FLASH_MODE_CFG
-		},
-		.regmap_size = 1,
-	}, {
-		.name = "gpio6",
-		.regmap[0] = {
-			AIROHA_FUNC_PWM_MUX,
-			REG_GPIO_FLASH_MODE_CFG,
-			GPIO6_FLASH_MODE_CFG,
-			GPIO6_FLASH_MODE_CFG
-		},
-		.regmap_size = 1,
-	}, {
-		.name = "gpio7",
-		.regmap[0] = {
-			AIROHA_FUNC_PWM_MUX,
-			REG_GPIO_FLASH_MODE_CFG,
-			GPIO7_FLASH_MODE_CFG,
-			GPIO7_FLASH_MODE_CFG
-		},
-		.regmap_size = 1,
-	}, {
-		.name = "gpio8",
-		.regmap[0] = {
-			AIROHA_FUNC_PWM_MUX,
-			REG_GPIO_FLASH_MODE_CFG,
-			GPIO8_FLASH_MODE_CFG,
-			GPIO8_FLASH_MODE_CFG
-		},
-		.regmap_size = 1,
-	}, {
-		.name = "gpio9",
-		.regmap[0] = {
-			AIROHA_FUNC_PWM_MUX,
-			REG_GPIO_FLASH_MODE_CFG,
-			GPIO9_FLASH_MODE_CFG,
-			GPIO9_FLASH_MODE_CFG
-		},
-		.regmap_size = 1,
-	}, {
-		.name = "gpio10",
-		.regmap[0] = {
-			AIROHA_FUNC_PWM_MUX,
-			REG_GPIO_FLASH_MODE_CFG,
-			GPIO10_FLASH_MODE_CFG,
-			GPIO10_FLASH_MODE_CFG
-		},
-		.regmap_size = 1,
-	}, {
-		.name = "gpio11",
-		.regmap[0] = {
-			AIROHA_FUNC_PWM_MUX,
-			REG_GPIO_FLASH_MODE_CFG,
-			GPIO11_FLASH_MODE_CFG,
-			GPIO11_FLASH_MODE_CFG
-		},
-		.regmap_size = 1,
-	}, {
-		.name = "gpio12",
-		.regmap[0] = {
-			AIROHA_FUNC_PWM_MUX,
-			REG_GPIO_FLASH_MODE_CFG,
-			GPIO12_FLASH_MODE_CFG,
-			GPIO12_FLASH_MODE_CFG
-		},
-		.regmap_size = 1,
-	}, {
-		.name = "gpio13",
-		.regmap[0] = {
-			AIROHA_FUNC_PWM_MUX,
-			REG_GPIO_FLASH_MODE_CFG,
-			GPIO13_FLASH_MODE_CFG,
-			GPIO13_FLASH_MODE_CFG
-		},
-		.regmap_size = 1,
-	}, {
-		.name = "gpio14",
-		.regmap[0] = {
-			AIROHA_FUNC_PWM_MUX,
-			REG_GPIO_FLASH_MODE_CFG,
-			GPIO14_FLASH_MODE_CFG,
-			GPIO14_FLASH_MODE_CFG
-		},
-		.regmap_size = 1,
-	}, {
-		.name = "gpio15",
-		.regmap[0] = {
-			AIROHA_FUNC_PWM_MUX,
-			REG_GPIO_FLASH_MODE_CFG,
-			GPIO15_FLASH_MODE_CFG,
-			GPIO15_FLASH_MODE_CFG
-		},
-		.regmap_size = 1,
-	}, {
-		.name = "gpio16",
-		.regmap[0] = {
-			AIROHA_FUNC_PWM_EXT_MUX,
-			REG_GPIO_FLASH_MODE_CFG_EXT,
-			GPIO16_FLASH_MODE_CFG,
-			GPIO16_FLASH_MODE_CFG
-		},
-		.regmap_size = 1,
-	}, {
-		.name = "gpio17",
-		.regmap[0] = {
-			AIROHA_FUNC_PWM_EXT_MUX,
-			REG_GPIO_FLASH_MODE_CFG_EXT,
-			GPIO17_FLASH_MODE_CFG,
-			GPIO17_FLASH_MODE_CFG
-		},
-		.regmap_size = 1,
-	}, {
-		.name = "gpio18",
-		.regmap[0] = {
-			AIROHA_FUNC_PWM_EXT_MUX,
-			REG_GPIO_FLASH_MODE_CFG_EXT,
-			GPIO18_FLASH_MODE_CFG,
-			GPIO18_FLASH_MODE_CFG
-		},
-		.regmap_size = 1,
-	}, {
-		.name = "gpio19",
-		.regmap[0] = {
-			AIROHA_FUNC_PWM_EXT_MUX,
-			REG_GPIO_FLASH_MODE_CFG_EXT,
-			GPIO19_FLASH_MODE_CFG,
-			GPIO19_FLASH_MODE_CFG
-		},
-		.regmap_size = 1,
-	}, {
-		.name = "gpio20",
-		.regmap[0] = {
-			AIROHA_FUNC_PWM_EXT_MUX,
-			REG_GPIO_FLASH_MODE_CFG_EXT,
-			GPIO20_FLASH_MODE_CFG,
-			GPIO20_FLASH_MODE_CFG
-		},
-		.regmap_size = 1,
-	}, {
-		.name = "gpio21",
-		.regmap[0] = {
-			AIROHA_FUNC_PWM_EXT_MUX,
-			REG_GPIO_FLASH_MODE_CFG_EXT,
-			GPIO21_FLASH_MODE_CFG,
-			GPIO21_FLASH_MODE_CFG
-		},
-		.regmap_size = 1,
-	}, {
-		.name = "gpio22",
-		.regmap[0] = {
-			AIROHA_FUNC_PWM_EXT_MUX,
-			REG_GPIO_FLASH_MODE_CFG_EXT,
-			GPIO22_FLASH_MODE_CFG,
-			GPIO22_FLASH_MODE_CFG
-		},
-		.regmap_size = 1,
-	}, {
-		.name = "gpio23",
-		.regmap[0] = {
-			AIROHA_FUNC_PWM_EXT_MUX,
-			REG_GPIO_FLASH_MODE_CFG_EXT,
-			GPIO23_FLASH_MODE_CFG,
-			GPIO23_FLASH_MODE_CFG
-		},
-		.regmap_size = 1,
-	}, {
-		.name = "gpio24",
-		.regmap[0] = {
-			AIROHA_FUNC_PWM_EXT_MUX,
-			REG_GPIO_FLASH_MODE_CFG_EXT,
-			GPIO24_FLASH_MODE_CFG,
-			GPIO24_FLASH_MODE_CFG
-		},
-		.regmap_size = 1,
-	}, {
-		.name = "gpio25",
-		.regmap[0] = {
-			AIROHA_FUNC_PWM_EXT_MUX,
-			REG_GPIO_FLASH_MODE_CFG_EXT,
-			GPIO25_FLASH_MODE_CFG,
-			GPIO25_FLASH_MODE_CFG
-		},
-		.regmap_size = 1,
-	}, {
-		.name = "gpio26",
-		.regmap[0] = {
-			AIROHA_FUNC_PWM_EXT_MUX,
-			REG_GPIO_FLASH_MODE_CFG_EXT,
-			GPIO26_FLASH_MODE_CFG,
-			GPIO26_FLASH_MODE_CFG
-		},
-		.regmap_size = 1,
-	}, {
-		.name = "gpio27",
-		.regmap[0] = {
-			AIROHA_FUNC_PWM_EXT_MUX,
-			REG_GPIO_FLASH_MODE_CFG_EXT,
-			GPIO27_FLASH_MODE_CFG,
-			GPIO27_FLASH_MODE_CFG
-		},
-		.regmap_size = 1,
-	}, {
-		.name = "gpio28",
-		.regmap[0] = {
-			AIROHA_FUNC_PWM_EXT_MUX,
-			REG_GPIO_FLASH_MODE_CFG_EXT,
-			GPIO28_FLASH_MODE_CFG,
-			GPIO28_FLASH_MODE_CFG
-		},
-		.regmap_size = 1,
-	}, {
-		.name = "gpio29",
-		.regmap[0] = {
-			AIROHA_FUNC_PWM_EXT_MUX,
-			REG_GPIO_FLASH_MODE_CFG_EXT,
-			GPIO29_FLASH_MODE_CFG,
-			GPIO29_FLASH_MODE_CFG
-		},
-		.regmap_size = 1,
-	}, {
-		.name = "gpio30",
-		.regmap[0] = {
-			AIROHA_FUNC_PWM_EXT_MUX,
-			REG_GPIO_FLASH_MODE_CFG_EXT,
-			GPIO30_FLASH_MODE_CFG,
-			GPIO30_FLASH_MODE_CFG
-		},
-		.regmap_size = 1,
-	}, {
-		.name = "gpio31",
-		.regmap[0] = {
-			AIROHA_FUNC_PWM_EXT_MUX,
-			REG_GPIO_FLASH_MODE_CFG_EXT,
-			GPIO31_FLASH_MODE_CFG,
-			GPIO31_FLASH_MODE_CFG
-		},
-		.regmap_size = 1,
-	}, {
-		.name = "gpio36",
-		.regmap[0] = {
-			AIROHA_FUNC_PWM_EXT_MUX,
-			REG_GPIO_FLASH_MODE_CFG_EXT,
-			GPIO36_FLASH_MODE_CFG,
-			GPIO36_FLASH_MODE_CFG
-		},
-		.regmap_size = 1,
-	}, {
-		.name = "gpio37",
-		.regmap[0] = {
-			AIROHA_FUNC_PWM_EXT_MUX,
-			REG_GPIO_FLASH_MODE_CFG_EXT,
-			GPIO37_FLASH_MODE_CFG,
-			GPIO37_FLASH_MODE_CFG
-		},
-		.regmap_size = 1,
-	}, {
-		.name = "gpio38",
-		.regmap[0] = {
-			AIROHA_FUNC_PWM_EXT_MUX,
-			REG_GPIO_FLASH_MODE_CFG_EXT,
-			GPIO38_FLASH_MODE_CFG,
-			GPIO38_FLASH_MODE_CFG
-		},
-		.regmap_size = 1,
-	}, {
-		.name = "gpio39",
-		.regmap[0] = {
-			AIROHA_FUNC_PWM_EXT_MUX,
-			REG_GPIO_FLASH_MODE_CFG_EXT,
-			GPIO39_FLASH_MODE_CFG,
-			GPIO39_FLASH_MODE_CFG
-		},
-		.regmap_size = 1,
-	}, {
-		.name = "gpio40",
-		.regmap[0] = {
-			AIROHA_FUNC_PWM_EXT_MUX,
-			REG_GPIO_FLASH_MODE_CFG_EXT,
-			GPIO40_FLASH_MODE_CFG,
-			GPIO40_FLASH_MODE_CFG
-		},
-		.regmap_size = 1,
-	}, {
-		.name = "gpio41",
-		.regmap[0] = {
-			AIROHA_FUNC_PWM_EXT_MUX,
-			REG_GPIO_FLASH_MODE_CFG_EXT,
-			GPIO41_FLASH_MODE_CFG,
-			GPIO41_FLASH_MODE_CFG
-		},
-		.regmap_size = 1,
-	}, {
-		.name = "gpio42",
-		.regmap[0] = {
-			AIROHA_FUNC_PWM_EXT_MUX,
-			REG_GPIO_FLASH_MODE_CFG_EXT,
-			GPIO42_FLASH_MODE_CFG,
-			GPIO42_FLASH_MODE_CFG
-		},
-		.regmap_size = 1,
-	}, {
-		.name = "gpio43",
-		.regmap[0] = {
-			AIROHA_FUNC_PWM_EXT_MUX,
-			REG_GPIO_FLASH_MODE_CFG_EXT,
-			GPIO43_FLASH_MODE_CFG,
-			GPIO43_FLASH_MODE_CFG
-		},
-		.regmap_size = 1,
-	}, {
-		.name = "gpio44",
-		.regmap[0] = {
-			AIROHA_FUNC_PWM_EXT_MUX,
-			REG_GPIO_FLASH_MODE_CFG_EXT,
-			GPIO44_FLASH_MODE_CFG,
-			GPIO44_FLASH_MODE_CFG
-		},
-		.regmap_size = 1,
-	}, {
-		.name = "gpio45",
-		.regmap[0] = {
-			AIROHA_FUNC_PWM_EXT_MUX,
-			REG_GPIO_FLASH_MODE_CFG_EXT,
-			GPIO45_FLASH_MODE_CFG,
-			GPIO45_FLASH_MODE_CFG
-		},
-		.regmap_size = 1,
-	}, {
-		.name = "gpio46",
-		.regmap[0] = {
-			AIROHA_FUNC_PWM_EXT_MUX,
-			REG_GPIO_FLASH_MODE_CFG_EXT,
-			GPIO46_FLASH_MODE_CFG,
-			GPIO46_FLASH_MODE_CFG
-		},
-		.regmap_size = 1,
-	}, {
-		.name = "gpio47",
-		.regmap[0] = {
-			AIROHA_FUNC_PWM_EXT_MUX,
-			REG_GPIO_FLASH_MODE_CFG_EXT,
-			GPIO47_FLASH_MODE_CFG,
-			GPIO47_FLASH_MODE_CFG
-		},
-		.regmap_size = 1,
-	},
+	AIROHA_PINCTRL_PWM("gpio0", GPIO0_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM("gpio1", GPIO1_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM("gpio2", GPIO2_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM("gpio3", GPIO3_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM("gpio4", GPIO4_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM("gpio5", GPIO5_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM("gpio6", GPIO6_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM("gpio7", GPIO7_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM("gpio8", GPIO8_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM("gpio9", GPIO9_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM("gpio10", GPIO10_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM("gpio11", GPIO11_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM("gpio12", GPIO12_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM("gpio13", GPIO13_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM("gpio14", GPIO14_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM("gpio15", GPIO15_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio16", GPIO16_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio17", GPIO17_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio18", GPIO18_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio19", GPIO19_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio20", GPIO20_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio21", GPIO21_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio22", GPIO22_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio23", GPIO23_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio24", GPIO24_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio25", GPIO25_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio26", GPIO26_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio27", GPIO27_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio28", GPIO28_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio29", GPIO29_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio30", GPIO30_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio31", GPIO31_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio36", GPIO36_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio37", GPIO37_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio38", GPIO38_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio39", GPIO39_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio40", GPIO40_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio41", GPIO41_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio42", GPIO42_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio43", GPIO43_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio44", GPIO44_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio45", GPIO45_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio46", GPIO46_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio47", GPIO47_FLASH_MODE_CFG),
 };
 
 #define AIROHA_PINCTRL_PHY_LED(gpio, mux_val, map_mask, map_val)	\
-- 
2.48.1


