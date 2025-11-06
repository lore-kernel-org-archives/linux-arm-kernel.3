Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 610B8CCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 23:57:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rTkcK2RQSdHwCwFi+jloB7ukY3+VfI48ITRyLxnM3ok=; b=TGdHc0ZJvflbK2sm/y++NqGhTJ
	Btqzj8YpoEpBSUzwNf92BAHKqytDqw4RhQpbitcLnCVF6rpyfs+C8TrvSHbI02SJC+tJ5N+MZOAkW
	dddJm6qD8gLQxZZGAviZUsU6b4Yiit6dSGjN+X+qJrCxEirEr/WGWjY+Yk/uFY+fdMUsqPR3t9d44
	Qowvf2lxQZmI3O0O857bAi5NONg0iluQ014J/Ya3infSEc6k+E5RcEOuoBoZSwIZNT9hR6+t7cukF
	0ZLduXS7ZPbzXMQFrNNOvKNurMZEcvhZcMolyRHg2/O3p9y3SNc+4KfrA0Q7+i3QjJzYQE9ia62Yx
	maMPpzjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH9r7-0000000GQD3-2ktV;
	Thu, 06 Nov 2025 23:57:29 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH9r2-0000000GQ6Z-1DwE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 23:57:26 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4710683a644so1078425e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Nov 2025 15:57:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762473442; x=1763078242; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rTkcK2RQSdHwCwFi+jloB7ukY3+VfI48ITRyLxnM3ok=;
        b=UgVPxmp7Mb6GXiVLGSJkyuYm0V344641J35ybR8SiYJrMWZPeKBtE2Ypd/UxqSWp3c
         Vk/Me+55qZBx9JnL8y0i9ZAp7oqUVQkLrJ9ld5lNeASb+T2vVJDjPgHQvf4KqR5EdfxZ
         IO0mJI8CFMyWetRRs5pzfyIpmZrkSyfUsyvuCbX3a8kGnINC4ndPt6w8PrX7yBqQYjuo
         iwx0fgIJi/+wa2zgLv5KOso71eWvhc+YWtiVrmPVGWYZHKZgE3/Dqx3WKUR8hxwpwxgb
         X/qXl8wEepfJYa8X7X2zibv4KWGuabHiCUc98rkSzxw4Ks2tCUFgQffBC8325Pju1gG2
         Wprg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762473442; x=1763078242;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rTkcK2RQSdHwCwFi+jloB7ukY3+VfI48ITRyLxnM3ok=;
        b=p8h4MxUL3KxS5yQlYLp6Ses4uGD+frJYznryS2eUpmNbq01Z/3frlPsrMjB3mIvNlD
         kJEkkgh+rQizeOaAX64j2YMPIPO1Hn/8l4YpljlVlskMgmHc+96uNZe3PKq+z7wVo+He
         +LY45QGR6iBCkHCL4LGHb2IAfGWy7CYrJ/10ikPKSv8qOvGJslbexURi/ilmJp0tT+uc
         L9Gln33o7v82wnd+hy3KPOWR8K+0Q1Eul9COIClx/i5XP2n98v6COfKXwRQXFuG6b8Fa
         Bkgjo4h2IsdsOs/uve8kON9hyyKd+rfNz8uDsAoI0hUjLY1WTEhIMxt2mHpuElEP2SWa
         2iZw==
X-Forwarded-Encrypted: i=1; AJvYcCUeBk9I6MTF2JxtZVFDmFRHhu/2DfnsFg2b2T43QaBjs8/cRnLHyTTQj+54ZXxjojhu4738dDNpohlW8hTE+Kf8@lists.infradead.org
X-Gm-Message-State: AOJu0YwwxzUdMpE6s+FBcCZo7qD9hA1b7NPm746vHlj02FbNfYrTCv18
	8MYOkamy//O2ZLtMciJ9ZllFhc1sdEPzNPru8pfmDrBcAtiHXmRQRHa3
X-Gm-Gg: ASbGncsSSbTEBwMDmDGTf/0vyiF5ULHUmy98lJGsrowQvHJd9tKBf90XrbLgc2UTyVR
	mjdxP6wnN2v5PoT9mv6FTKMLrcK1+AMa56XUZQRt3hxwztUIyoQJ5BDbg0Ti21PWuWLUgstoIWl
	J6gzyG1GckEDD+OAnFh+sa8Nkow2jn9SUidmHnFoh4MLc74B0Iml1Im3Tp5k9x8zMCV5r0ZxqHe
	+rhAS4YVnSxtPET4g0tRGlg2wG7R13nZ2WfdvdamYA2ox+tg/gb/KZRYkSgVdfzP83ql/0VRt9I
	EeFUTTq7pks2JbxZK7XIdRoXFn4EwR7dh4Zptp49v1vKJ/qKZNmGRymZ/K5uetv/0qahVI0ZYwj
	gM1jGJeeQN/MJv6KXkni6RYN7vZAED5Tn2/dix0P1qTPXuH0jB8+KheqgtsqaT5fhksiUEmzrUf
	BBHcGrb0wTkO/qqfIFeM3yGsrtZw9eQg==
X-Google-Smtp-Source: AGHT+IHvjxOnyRVvRjpNpCUzBWwh3KDbgeH2FzI9ztIg74cu6NGoEZmbeAo1fnqTA/4amOmCvZaeTQ==
X-Received: by 2002:a05:600c:3b8e:b0:475:f16f:6e10 with SMTP id 5b1f17b1804b1-4776bab8b09mr11673625e9.18.1762473442401;
        Thu, 06 Nov 2025 15:57:22 -0800 (PST)
Received: from Ansuel-XPS24 (93-34-90-37.ip49.fastwebnet.it. [93.34.90.37])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4775cd45466sm129470525e9.0.2025.11.06.15.57.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 15:57:22 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Sean Wang <sean.wang@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH v2 2/5] pinctrl: airoha: convert PHY LED GPIO to macro
Date: Fri,  7 Nov 2025 00:57:05 +0100
Message-ID: <20251106235713.1794668-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251106235713.1794668-1-ansuelsmth@gmail.com>
References: <20251106235713.1794668-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_155724_472555_6ABB8EE4 
X-CRM114-Status: GOOD (  13.51  )
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

PHY LED GPIO pinctrl struct definition is very similar across the
different 4 PHY and 2 LED and it can be generelized to a macro.

To reduce code size, convert them to a common macro.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/pinctrl/mediatek/pinctrl-airoha.c | 588 ++++------------------
 1 file changed, 100 insertions(+), 488 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-airoha.c b/drivers/pinctrl/mediatek/pinctrl-airoha.c
index 32e5c1b32d50..cb0edc2a66a1 100644
--- a/drivers/pinctrl/mediatek/pinctrl-airoha.c
+++ b/drivers/pinctrl/mediatek/pinctrl-airoha.c
@@ -1473,516 +1473,128 @@ static const struct airoha_pinctrl_func_group pwm_func_group[] = {
 	},
 };
 
+#define AIROHA_PINCTRL_PHY_LED0(gpio, mux_val, map_mask, map_val)	\
+	{								\
+		.name = (gpio),						\
+		.regmap[0] = {						\
+			AIROHA_FUNC_MUX,				\
+			REG_GPIO_2ND_I2C_MODE,				\
+			(mux_val),					\
+			(mux_val),					\
+		},							\
+		.regmap[1] = {						\
+			AIROHA_FUNC_MUX,				\
+			REG_LAN_LED0_MAPPING,				\
+			(map_mask),					\
+			(map_val),					\
+		},							\
+		.regmap_size = 2,					\
+	}
+
+#define AIROHA_PINCTRL_PHY_LED1(gpio, mux_val, map_mask, map_val)	\
+	{								\
+		.name = (gpio),						\
+		.regmap[0] = {						\
+			AIROHA_FUNC_MUX,				\
+			REG_GPIO_2ND_I2C_MODE,				\
+			(mux_val),					\
+			(mux_val),					\
+		},							\
+		.regmap[1] = {						\
+			AIROHA_FUNC_MUX,				\
+			REG_LAN_LED1_MAPPING,				\
+			(map_mask),					\
+			(map_val),					\
+		},							\
+		.regmap_size = 2,					\
+	}
+
 static const struct airoha_pinctrl_func_group phy1_led0_func_group[] = {
-	{
-		.name = "gpio33",
-		.regmap[0] = {
-			AIROHA_FUNC_MUX,
-			REG_GPIO_2ND_I2C_MODE,
-			GPIO_LAN0_LED0_MODE_MASK,
-			GPIO_LAN0_LED0_MODE_MASK
-		},
-		.regmap[1] = {
-			AIROHA_FUNC_MUX,
-			REG_LAN_LED0_MAPPING,
-			LAN0_LED_MAPPING_MASK,
-			LAN0_PHY_LED_MAP(0)
-		},
-		.regmap_size = 2,
-	}, {
-		.name = "gpio34",
-		.regmap[0] = {
-			AIROHA_FUNC_MUX,
-			REG_GPIO_2ND_I2C_MODE,
-			GPIO_LAN1_LED0_MODE_MASK,
-			GPIO_LAN1_LED0_MODE_MASK
-		},
-		.regmap[1] = {
-			AIROHA_FUNC_MUX,
-			REG_LAN_LED0_MAPPING,
-			LAN1_LED_MAPPING_MASK,
-			LAN1_PHY_LED_MAP(0)
-		},
-		.regmap_size = 2,
-	}, {
-		.name = "gpio35",
-		.regmap[0] = {
-			AIROHA_FUNC_MUX,
-			REG_GPIO_2ND_I2C_MODE,
-			GPIO_LAN2_LED0_MODE_MASK,
-			GPIO_LAN2_LED0_MODE_MASK
-		},
-		.regmap[1] = {
-			AIROHA_FUNC_MUX,
-			REG_LAN_LED0_MAPPING,
-			LAN2_LED_MAPPING_MASK,
-			LAN2_PHY_LED_MAP(0)
-		},
-		.regmap_size = 2,
-	}, {
-		.name = "gpio42",
-		.regmap[0] = {
-			AIROHA_FUNC_MUX,
-			REG_GPIO_2ND_I2C_MODE,
-			GPIO_LAN3_LED0_MODE_MASK,
-			GPIO_LAN3_LED0_MODE_MASK
-		},
-		.regmap[1] = {
-			AIROHA_FUNC_MUX,
-			REG_LAN_LED0_MAPPING,
-			LAN3_LED_MAPPING_MASK,
-			LAN3_PHY_LED_MAP(0)
-		},
-		.regmap_size = 2,
-	},
+	AIROHA_PINCTRL_PHY_LED0("gpio33", GPIO_LAN0_LED0_MODE_MASK,
+				LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(0)),
+	AIROHA_PINCTRL_PHY_LED0("gpio34", GPIO_LAN1_LED0_MODE_MASK,
+				LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(0)),
+	AIROHA_PINCTRL_PHY_LED0("gpio35", GPIO_LAN2_LED0_MODE_MASK,
+				LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(0)),
+	AIROHA_PINCTRL_PHY_LED0("gpio42", GPIO_LAN3_LED0_MODE_MASK,
+				LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(0)),
 };
 
 static const struct airoha_pinctrl_func_group phy2_led0_func_group[] = {
-	{
-		.name = "gpio33",
-		.regmap[0] = {
-			AIROHA_FUNC_MUX,
-			REG_GPIO_2ND_I2C_MODE,
-			GPIO_LAN0_LED0_MODE_MASK,
-			GPIO_LAN0_LED0_MODE_MASK
-		},
-		.regmap[1] = {
-			AIROHA_FUNC_MUX,
-			REG_LAN_LED0_MAPPING,
-			LAN0_LED_MAPPING_MASK,
-			LAN0_PHY_LED_MAP(1)
-		},
-		.regmap_size = 2,
-	}, {
-		.name = "gpio34",
-		.regmap[0] = {
-			AIROHA_FUNC_MUX,
-			REG_GPIO_2ND_I2C_MODE,
-			GPIO_LAN1_LED0_MODE_MASK,
-			GPIO_LAN1_LED0_MODE_MASK
-		},
-		.regmap[1] = {
-			AIROHA_FUNC_MUX,
-			REG_LAN_LED0_MAPPING,
-			LAN1_LED_MAPPING_MASK,
-			LAN1_PHY_LED_MAP(1)
-		},
-		.regmap_size = 2,
-	}, {
-		.name = "gpio35",
-		.regmap[0] = {
-			AIROHA_FUNC_MUX,
-			REG_GPIO_2ND_I2C_MODE,
-			GPIO_LAN2_LED0_MODE_MASK,
-			GPIO_LAN2_LED0_MODE_MASK
-		},
-		.regmap[1] = {
-			AIROHA_FUNC_MUX,
-			REG_LAN_LED0_MAPPING,
-			LAN2_LED_MAPPING_MASK,
-			LAN2_PHY_LED_MAP(1)
-		},
-		.regmap_size = 2,
-	}, {
-		.name = "gpio42",
-		.regmap[0] = {
-			AIROHA_FUNC_MUX,
-			REG_GPIO_2ND_I2C_MODE,
-			GPIO_LAN3_LED0_MODE_MASK,
-			GPIO_LAN3_LED0_MODE_MASK
-		},
-		.regmap[1] = {
-			AIROHA_FUNC_MUX,
-			REG_LAN_LED0_MAPPING,
-			LAN3_LED_MAPPING_MASK,
-			LAN3_PHY_LED_MAP(1)
-		},
-		.regmap_size = 2,
-	},
+	AIROHA_PINCTRL_PHY_LED0("gpio33", GPIO_LAN0_LED0_MODE_MASK,
+				LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(1)),
+	AIROHA_PINCTRL_PHY_LED0("gpio34", GPIO_LAN1_LED0_MODE_MASK,
+				LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(1)),
+	AIROHA_PINCTRL_PHY_LED0("gpio35", GPIO_LAN2_LED0_MODE_MASK,
+				LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(1)),
+	AIROHA_PINCTRL_PHY_LED0("gpio42", GPIO_LAN3_LED0_MODE_MASK,
+				LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(1)),
 };
 
 static const struct airoha_pinctrl_func_group phy3_led0_func_group[] = {
-	{
-		.name = "gpio33",
-		.regmap[0] = {
-			AIROHA_FUNC_MUX,
-			REG_GPIO_2ND_I2C_MODE,
-			GPIO_LAN0_LED0_MODE_MASK,
-			GPIO_LAN0_LED0_MODE_MASK
-		},
-		.regmap[1] = {
-			AIROHA_FUNC_MUX,
-			REG_LAN_LED0_MAPPING,
-			LAN0_LED_MAPPING_MASK,
-			LAN0_PHY_LED_MAP(2)
-		},
-		.regmap_size = 2,
-	}, {
-		.name = "gpio34",
-		.regmap[0] = {
-			AIROHA_FUNC_MUX,
-			REG_GPIO_2ND_I2C_MODE,
-			GPIO_LAN1_LED0_MODE_MASK,
-			GPIO_LAN1_LED0_MODE_MASK
-		},
-		.regmap[1] = {
-			AIROHA_FUNC_MUX,
-			REG_LAN_LED0_MAPPING,
-			LAN1_LED_MAPPING_MASK,
-			LAN1_PHY_LED_MAP(2)
-		},
-		.regmap_size = 2,
-	}, {
-		.name = "gpio35",
-		.regmap[0] = {
-			AIROHA_FUNC_MUX,
-			REG_GPIO_2ND_I2C_MODE,
-			GPIO_LAN2_LED0_MODE_MASK,
-			GPIO_LAN2_LED0_MODE_MASK
-		},
-		.regmap[1] = {
-			AIROHA_FUNC_MUX,
-			REG_LAN_LED0_MAPPING,
-			LAN2_LED_MAPPING_MASK,
-			LAN2_PHY_LED_MAP(2)
-		},
-		.regmap_size = 2,
-	}, {
-		.name = "gpio42",
-		.regmap[0] = {
-			AIROHA_FUNC_MUX,
-			REG_GPIO_2ND_I2C_MODE,
-			GPIO_LAN3_LED0_MODE_MASK,
-			GPIO_LAN3_LED0_MODE_MASK
-		},
-		.regmap[1] = {
-			AIROHA_FUNC_MUX,
-			REG_LAN_LED0_MAPPING,
-			LAN3_LED_MAPPING_MASK,
-			LAN3_PHY_LED_MAP(2)
-		},
-		.regmap_size = 2,
-	},
+	AIROHA_PINCTRL_PHY_LED0("gpio33", GPIO_LAN0_LED0_MODE_MASK,
+				LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(2)),
+	AIROHA_PINCTRL_PHY_LED0("gpio34", GPIO_LAN1_LED0_MODE_MASK,
+				LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(2)),
+	AIROHA_PINCTRL_PHY_LED0("gpio35", GPIO_LAN2_LED0_MODE_MASK,
+				LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(2)),
+	AIROHA_PINCTRL_PHY_LED0("gpio42", GPIO_LAN3_LED0_MODE_MASK,
+				LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(2)),
 };
 
 static const struct airoha_pinctrl_func_group phy4_led0_func_group[] = {
-	{
-		.name = "gpio33",
-		.regmap[0] = {
-			AIROHA_FUNC_MUX,
-			REG_GPIO_2ND_I2C_MODE,
-			GPIO_LAN0_LED0_MODE_MASK,
-			GPIO_LAN0_LED0_MODE_MASK
-		},
-		.regmap[1] = {
-			AIROHA_FUNC_MUX,
-			REG_LAN_LED0_MAPPING,
-			LAN0_LED_MAPPING_MASK,
-			LAN0_PHY_LED_MAP(3)
-		},
-		.regmap_size = 2,
-	}, {
-		.name = "gpio34",
-		.regmap[0] = {
-			AIROHA_FUNC_MUX,
-			REG_GPIO_2ND_I2C_MODE,
-			GPIO_LAN1_LED0_MODE_MASK,
-			GPIO_LAN1_LED0_MODE_MASK
-		},
-		.regmap[1] = {
-			AIROHA_FUNC_MUX,
-			REG_LAN_LED0_MAPPING,
-			LAN1_LED_MAPPING_MASK,
-			LAN1_PHY_LED_MAP(3)
-		},
-		.regmap_size = 2,
-	}, {
-		.name = "gpio35",
-		.regmap[0] = {
-			AIROHA_FUNC_MUX,
-			REG_GPIO_2ND_I2C_MODE,
-			GPIO_LAN2_LED0_MODE_MASK,
-			GPIO_LAN2_LED0_MODE_MASK
-		},
-		.regmap[1] = {
-			AIROHA_FUNC_MUX,
-			REG_LAN_LED0_MAPPING,
-			LAN2_LED_MAPPING_MASK,
-			LAN2_PHY_LED_MAP(3)
-		},
-		.regmap_size = 2,
-	}, {
-		.name = "gpio42",
-		.regmap[0] = {
-			AIROHA_FUNC_MUX,
-			REG_GPIO_2ND_I2C_MODE,
-			GPIO_LAN3_LED0_MODE_MASK,
-			GPIO_LAN3_LED0_MODE_MASK
-		},
-		.regmap[1] = {
-			AIROHA_FUNC_MUX,
-			REG_LAN_LED0_MAPPING,
-			LAN3_LED_MAPPING_MASK,
-			LAN3_PHY_LED_MAP(3)
-		},
-		.regmap_size = 2,
-	},
+	AIROHA_PINCTRL_PHY_LED0("gpio33", GPIO_LAN0_LED0_MODE_MASK,
+				LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(3)),
+	AIROHA_PINCTRL_PHY_LED0("gpio34", GPIO_LAN1_LED0_MODE_MASK,
+				LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(3)),
+	AIROHA_PINCTRL_PHY_LED0("gpio35", GPIO_LAN2_LED0_MODE_MASK,
+				LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(3)),
+	AIROHA_PINCTRL_PHY_LED0("gpio42", GPIO_LAN3_LED0_MODE_MASK,
+				LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(3)),
 };
 
 static const struct airoha_pinctrl_func_group phy1_led1_func_group[] = {
-	{
-		.name = "gpio43",
-		.regmap[0] = {
-			AIROHA_FUNC_MUX,
-			REG_GPIO_2ND_I2C_MODE,
-			GPIO_LAN0_LED1_MODE_MASK,
-			GPIO_LAN0_LED1_MODE_MASK
-		},
-		.regmap[1] = {
-			AIROHA_FUNC_MUX,
-			REG_LAN_LED1_MAPPING,
-			LAN0_LED_MAPPING_MASK,
-			LAN0_PHY_LED_MAP(0)
-		},
-		.regmap_size = 2,
-	}, {
-		.name = "gpio44",
-		.regmap[0] = {
-			AIROHA_FUNC_MUX,
-			REG_GPIO_2ND_I2C_MODE,
-			GPIO_LAN1_LED1_MODE_MASK,
-			GPIO_LAN1_LED1_MODE_MASK
-		},
-		.regmap[1] = {
-			AIROHA_FUNC_MUX,
-			REG_LAN_LED1_MAPPING,
-			LAN1_LED_MAPPING_MASK,
-			LAN1_PHY_LED_MAP(0)
-		},
-		.regmap_size = 2,
-	}, {
-		.name = "gpio45",
-		.regmap[0] = {
-			AIROHA_FUNC_MUX,
-			REG_GPIO_2ND_I2C_MODE,
-			GPIO_LAN2_LED1_MODE_MASK,
-			GPIO_LAN2_LED1_MODE_MASK
-		},
-		.regmap[1] = {
-			AIROHA_FUNC_MUX,
-			REG_LAN_LED1_MAPPING,
-			LAN2_LED_MAPPING_MASK,
-			LAN2_PHY_LED_MAP(0)
-		},
-		.regmap_size = 2,
-	}, {
-		.name = "gpio46",
-		.regmap[0] = {
-			AIROHA_FUNC_MUX,
-			REG_GPIO_2ND_I2C_MODE,
-			GPIO_LAN3_LED1_MODE_MASK,
-			GPIO_LAN3_LED1_MODE_MASK
-		},
-		.regmap[1] = {
-			AIROHA_FUNC_MUX,
-			REG_LAN_LED1_MAPPING,
-			LAN3_LED_MAPPING_MASK,
-			LAN3_PHY_LED_MAP(0)
-		},
-		.regmap_size = 2,
-	},
+	AIROHA_PINCTRL_PHY_LED1("gpio43", GPIO_LAN0_LED1_MODE_MASK,
+				LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(0)),
+	AIROHA_PINCTRL_PHY_LED1("gpio44", GPIO_LAN1_LED1_MODE_MASK,
+				LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(0)),
+	AIROHA_PINCTRL_PHY_LED1("gpio45", GPIO_LAN2_LED1_MODE_MASK,
+				LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(0)),
+	AIROHA_PINCTRL_PHY_LED1("gpio46", GPIO_LAN3_LED1_MODE_MASK,
+				LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(0)),
 };
 
 static const struct airoha_pinctrl_func_group phy2_led1_func_group[] = {
-	{
-		.name = "gpio43",
-		.regmap[0] = {
-			AIROHA_FUNC_MUX,
-			REG_GPIO_2ND_I2C_MODE,
-			GPIO_LAN0_LED1_MODE_MASK,
-			GPIO_LAN0_LED1_MODE_MASK
-		},
-		.regmap[1] = {
-			AIROHA_FUNC_MUX,
-			REG_LAN_LED1_MAPPING,
-			LAN0_LED_MAPPING_MASK,
-			LAN0_PHY_LED_MAP(1)
-		},
-		.regmap_size = 2,
-	}, {
-		.name = "gpio44",
-		.regmap[0] = {
-			AIROHA_FUNC_MUX,
-			REG_GPIO_2ND_I2C_MODE,
-			GPIO_LAN1_LED1_MODE_MASK,
-			GPIO_LAN1_LED1_MODE_MASK
-		},
-		.regmap[1] = {
-			AIROHA_FUNC_MUX,
-			REG_LAN_LED1_MAPPING,
-			LAN1_LED_MAPPING_MASK,
-			LAN1_PHY_LED_MAP(1)
-		},
-		.regmap_size = 2,
-	}, {
-		.name = "gpio45",
-		.regmap[0] = {
-			AIROHA_FUNC_MUX,
-			REG_GPIO_2ND_I2C_MODE,
-			GPIO_LAN2_LED1_MODE_MASK,
-			GPIO_LAN2_LED1_MODE_MASK
-		},
-		.regmap[1] = {
-			AIROHA_FUNC_MUX,
-			REG_LAN_LED1_MAPPING,
-			LAN2_LED_MAPPING_MASK,
-			LAN2_PHY_LED_MAP(1)
-		},
-		.regmap_size = 2,
-	}, {
-		.name = "gpio46",
-		.regmap[0] = {
-			AIROHA_FUNC_MUX,
-			REG_GPIO_2ND_I2C_MODE,
-			GPIO_LAN3_LED1_MODE_MASK,
-			GPIO_LAN3_LED1_MODE_MASK
-		},
-		.regmap[1] = {
-			AIROHA_FUNC_MUX,
-			REG_LAN_LED1_MAPPING,
-			LAN3_LED_MAPPING_MASK,
-			LAN3_PHY_LED_MAP(1)
-		},
-		.regmap_size = 2,
-	},
+	AIROHA_PINCTRL_PHY_LED1("gpio43", GPIO_LAN0_LED1_MODE_MASK,
+				LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(1)),
+	AIROHA_PINCTRL_PHY_LED1("gpio44", GPIO_LAN1_LED1_MODE_MASK,
+				LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(1)),
+	AIROHA_PINCTRL_PHY_LED1("gpio45", GPIO_LAN2_LED1_MODE_MASK,
+				LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(1)),
+	AIROHA_PINCTRL_PHY_LED1("gpio46", GPIO_LAN3_LED1_MODE_MASK,
+				LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(1)),
 };
 
 static const struct airoha_pinctrl_func_group phy3_led1_func_group[] = {
-	{
-		.name = "gpio43",
-		.regmap[0] = {
-			AIROHA_FUNC_MUX,
-			REG_GPIO_2ND_I2C_MODE,
-			GPIO_LAN0_LED1_MODE_MASK,
-			GPIO_LAN0_LED1_MODE_MASK
-		},
-		.regmap[1] = {
-			AIROHA_FUNC_MUX,
-			REG_LAN_LED1_MAPPING,
-			LAN0_LED_MAPPING_MASK,
-			LAN0_PHY_LED_MAP(2)
-		},
-		.regmap_size = 2,
-	}, {
-		.name = "gpio44",
-		.regmap[0] = {
-			AIROHA_FUNC_MUX,
-			REG_GPIO_2ND_I2C_MODE,
-			GPIO_LAN1_LED1_MODE_MASK,
-			GPIO_LAN1_LED1_MODE_MASK
-		},
-		.regmap[1] = {
-			AIROHA_FUNC_MUX,
-			REG_LAN_LED1_MAPPING,
-			LAN1_LED_MAPPING_MASK,
-			LAN1_PHY_LED_MAP(2)
-		},
-		.regmap_size = 2,
-	}, {
-		.name = "gpio45",
-		.regmap[0] = {
-			AIROHA_FUNC_MUX,
-			REG_GPIO_2ND_I2C_MODE,
-			GPIO_LAN2_LED1_MODE_MASK,
-			GPIO_LAN2_LED1_MODE_MASK
-		},
-		.regmap[1] = {
-			AIROHA_FUNC_MUX,
-			REG_LAN_LED1_MAPPING,
-			LAN2_LED_MAPPING_MASK,
-			LAN2_PHY_LED_MAP(2)
-		},
-		.regmap_size = 2,
-	}, {
-		.name = "gpio46",
-		.regmap[0] = {
-			AIROHA_FUNC_MUX,
-			REG_GPIO_2ND_I2C_MODE,
-			GPIO_LAN3_LED1_MODE_MASK,
-			GPIO_LAN3_LED1_MODE_MASK
-		},
-		.regmap[1] = {
-			AIROHA_FUNC_MUX,
-			REG_LAN_LED1_MAPPING,
-			LAN3_LED_MAPPING_MASK,
-			LAN3_PHY_LED_MAP(2)
-		},
-		.regmap_size = 2,
-	},
+	AIROHA_PINCTRL_PHY_LED1("gpio43", GPIO_LAN0_LED1_MODE_MASK,
+				LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(2)),
+	AIROHA_PINCTRL_PHY_LED1("gpio44", GPIO_LAN1_LED1_MODE_MASK,
+				LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(2)),
+	AIROHA_PINCTRL_PHY_LED1("gpio45", GPIO_LAN2_LED1_MODE_MASK,
+				LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(2)),
+	AIROHA_PINCTRL_PHY_LED1("gpio46", GPIO_LAN3_LED1_MODE_MASK,
+				LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(2)),
 };
 
 static const struct airoha_pinctrl_func_group phy4_led1_func_group[] = {
-	{
-		.name = "gpio43",
-		.regmap[0] = {
-			AIROHA_FUNC_MUX,
-			REG_GPIO_2ND_I2C_MODE,
-			GPIO_LAN0_LED1_MODE_MASK,
-			GPIO_LAN0_LED1_MODE_MASK
-		},
-		.regmap[1] = {
-			AIROHA_FUNC_MUX,
-			REG_LAN_LED1_MAPPING,
-			LAN0_LED_MAPPING_MASK,
-			LAN0_PHY_LED_MAP(3)
-		},
-		.regmap_size = 2,
-	}, {
-		.name = "gpio44",
-		.regmap[0] = {
-			AIROHA_FUNC_MUX,
-			REG_GPIO_2ND_I2C_MODE,
-			GPIO_LAN1_LED1_MODE_MASK,
-			GPIO_LAN1_LED1_MODE_MASK
-		},
-		.regmap[1] = {
-			AIROHA_FUNC_MUX,
-			REG_LAN_LED1_MAPPING,
-			LAN1_LED_MAPPING_MASK,
-			LAN1_PHY_LED_MAP(3)
-		},
-		.regmap_size = 2,
-	}, {
-		.name = "gpio45",
-		.regmap[0] = {
-			AIROHA_FUNC_MUX,
-			REG_GPIO_2ND_I2C_MODE,
-			GPIO_LAN2_LED1_MODE_MASK,
-			GPIO_LAN2_LED1_MODE_MASK
-		},
-		.regmap[1] = {
-			AIROHA_FUNC_MUX,
-			REG_LAN_LED1_MAPPING,
-			LAN2_LED_MAPPING_MASK,
-			LAN2_PHY_LED_MAP(3)
-		},
-		.regmap_size = 2,
-	}, {
-		.name = "gpio46",
-		.regmap[0] = {
-			AIROHA_FUNC_MUX,
-			REG_GPIO_2ND_I2C_MODE,
-			GPIO_LAN3_LED1_MODE_MASK,
-			GPIO_LAN3_LED1_MODE_MASK
-		},
-		.regmap[1] = {
-			AIROHA_FUNC_MUX,
-			REG_LAN_LED1_MAPPING,
-			LAN3_LED_MAPPING_MASK,
-			LAN3_PHY_LED_MAP(3)
-		},
-		.regmap_size = 2,
-	},
+	AIROHA_PINCTRL_PHY_LED1("gpio43", GPIO_LAN0_LED1_MODE_MASK,
+				LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(2)),
+	AIROHA_PINCTRL_PHY_LED1("gpio44", GPIO_LAN1_LED1_MODE_MASK,
+				LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(2)),
+	AIROHA_PINCTRL_PHY_LED1("gpio45", GPIO_LAN2_LED1_MODE_MASK,
+				LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(2)),
+	AIROHA_PINCTRL_PHY_LED1("gpio46", GPIO_LAN3_LED1_MODE_MASK,
+				LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(2)),
 };
 
 static const struct airoha_pinctrl_func en7581_pinctrl_funcs[] = {
-- 
2.51.0


