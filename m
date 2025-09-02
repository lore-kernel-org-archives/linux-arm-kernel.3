Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C80FCA1005
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 15:06:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hmF0qpL5oboyNo2+RmqzBhbIr3GiIG0yX04mHf79OJ4=; b=j5nNDodCm777sydzvOBReLOZh/
	+XS6uiwZaBH8aLHWFCJwVzhElA/Fzmd6ovCAS6k+PAPGNa5uIIjQb6G7u8rCicO3WHYeJC3BK9Fzt
	iHoNVycGPZc6U0O6U0IoE53REf9hOiGw9Blt2H6TVgEdMuKALmDS68GWIzqno3XVynA8b26yGMdFY
	l7m7GvXoqhUUj0QBX23+4wQGKwloljxkZj9Yw5qOHvXhaSKYVIU9u4JEgYW/COw8ztpEYluT5+Z25
	MVTCHkk7V/3/CUxB7x+tUM8QDsK5amUljw7iaNRLy3GqXYGE9yhmTTjLLjLTgl74+17+xF03+Bizl
	JZzOZcmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utSaH-00000000a35-0j32;
	Tue, 02 Sep 2025 15:06:09 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utPfd-0000000H4MR-0tqc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 11:59:30 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-3c46686d1e6so3605028f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Sep 2025 04:59:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756814368; x=1757419168; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hmF0qpL5oboyNo2+RmqzBhbIr3GiIG0yX04mHf79OJ4=;
        b=inq+xqIf1hEh/hexn6Kj3szT3UMCISHB1tfb2w77ikujUvaopwNMWNOjS0wWdHz1IV
         KnDoGgw3oTzah3bpFCe6ND7xykGghxFCpW/bzkojoJTJi4WkeBUzs0fWjfDS57XMVH/5
         ItwEOnRuecO4lov9plZvgPTGGnefsOcOrViFUCgKJ+t9DbKcvcE6vkfHbKKlzjFayeIW
         6GB84wzfe9cbmoANNqe9Qn2eZgaiJ25kMF4YlS5CK/lxr5VJcSee5K8gzfNedA3WxVoH
         7Mir8Kok2TDeK+x/OZ6JrYB2JZ0K6ZM6Nh35Rfhm7+F1gKf2sqpoNyhggthQsAD0hJlg
         ElDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756814368; x=1757419168;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hmF0qpL5oboyNo2+RmqzBhbIr3GiIG0yX04mHf79OJ4=;
        b=YOE7w76D9SyCRbkumsqo43/KV6my+OKvrl3DJJizTJzJa5O8EX17bTc6+tPBinwyjx
         zfQ+eC8upZPl/DDf64VoTTc7E8isLbi8TiyGgw6xAB7HruSw9mJLJ986LjHEYolEx/wN
         RbkfG4gVFSQ6IA1uMf8m6Lbneq51WBbJJk0WnWjQ/WZbjkJdchfPl95TOeFT2x6oWSMe
         FBuVnlYYqe/1qU2eqZHEu7prNqRWnzNsDP7LEheKqMtpXrO+9IqR9q+6dKPGFoKWQN75
         GCyZ1muxRQy1Bmo5JuU7b2MD2menSXq58rQ5n6CbUrp+siJ/sjDRAP6fwFH6x4UJ2KtD
         Sk0w==
X-Forwarded-Encrypted: i=1; AJvYcCVIOtHjAeSg6xiB2Q8C1IP/XZSnzWcr6VZZqWVhpapQ39NfKW6KeCYl6b1kRGM8VsNBN4KyrlbyITOTzurcf3wM@lists.infradead.org
X-Gm-Message-State: AOJu0YwQIRKslW4MHf4/A9H0dEoGHzllehGeJHW4hOgbB8jE1sEIipHA
	+53kN4LPort0O2UKuqSZ6DLDLfcZVq7a4WlYSpFN9wZbXPqeBsd67TOhr9xS9Y/Kh8E=
X-Gm-Gg: ASbGncvO7PF6Bb7EjPvEAA1eATn6Q2azL7yIO9CTNhL2f+LDFJamCZJ8eu2hPfqWhwG
	DuC+Q+yTE1rs0AJ8mK8Fp7S0nNRIhQynmk8IFogC3o6IY5wz3kNRf8/KkT4S7vn2R4XXkoCjsVF
	IrPXSUYvXlSTM4AIAFVWkzEaqNrgMbqXATWa+gwQISRhRQQoquae2ly690E23jELRDVCCYU1F5R
	Wcwes2yjMI44DJFeg0C4uEeUkBnjaa9dkcO/IhdSTKr2Uag0Do2OvD7BHLfMk9VO9+aJ4M5d+RX
	09IiH4y+0QLBf7Fg+K/jWARrOOKeILpIsFOI4yQp4zF98d869cHvYkFy0pg1DRv1Qu/0zYrDcEK
	6dXt7poOdL0gvyyCajMhQJgulG3s=
X-Google-Smtp-Source: AGHT+IFZ7E4qbu9GejC27onbw6mbXjiRANVPMdB54XgewR8O68DakFlPRZsFccnnckZXTOfFslbDVg==
X-Received: by 2002:a05:6000:22ca:b0:3d0:64c1:1a40 with SMTP id ffacd0b85a97d-3d1e01d67bemr9364150f8f.46.1756814367522;
        Tue, 02 Sep 2025 04:59:27 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:3327:447f:34e9:44f7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b9c234b24sm10224195e9.16.2025.09.02.04.59.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 04:59:27 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 02 Sep 2025 13:59:14 +0200
Subject: [PATCH v7 05/16] pinctrl: mediatek: mt7988: use
 PINCTRL_PIN_FUNCTION()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250902-pinctrl-gpio-pinfuncs-v7-5-bb091daedc52@linaro.org>
References: <20250902-pinctrl-gpio-pinfuncs-v7-0-bb091daedc52@linaro.org>
In-Reply-To: <20250902-pinctrl-gpio-pinfuncs-v7-0-bb091daedc52@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Alexey Klimov <alexey.klimov@linaro.org>, 
 Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Paul Cercueil <paul@crapouillou.net>, Kees Cook <kees@kernel.org>, 
 Andy Shevchenko <andy@kernel.org>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@redhat.com>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
 Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
 Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 NXP S32 Linux Team <s32@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Tony Lindgren <tony@atomide.com>, 
 Haojian Zhuang <haojian.zhuang@linaro.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Mark Brown <broonie@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
 linux-hardening@vger.kernel.org, linux-mm@kvack.org, imx@lists.linux.dev, 
 linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 Chen-Yu Tsai <wenst@chromium.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3024;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=8RlOPiRQytIjx4Cw4oHKC1GB2mrKTE7YNwjd+43Fzro=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBottwSF8whOHOZFyDolz0PilXXDCaAKXuSMNm60
 NzxyV+0c/yJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaLbcEgAKCRARpy6gFHHX
 cvhOD/0doe9DrmFXc7kS6/vcFyVXmEZSMqBFgmLcg4AZiHNYSGgE6MREhSdt5aBNKA7+rTuFQSi
 Y/nixATKCNYzUBUbmWqID2G2AlCMLLQF+VWSCfX96j9ieWw3V3tRY45UwvKNYSEI5W7wMZpg2ZL
 fGGgah3dEUWiT2yUVsG+X1PwKZUR+ocw23x6qt2tkI9gdKNBYBM6bbVnBdoob0hyIWU1FWq/ysj
 yu8gwxPTG6/t7oEbmaG0azFzobwcBLlkzhmh2ogg10CIoW1biAP1md+rFvJr8gkJ6AEMCn1KTea
 WxXvATAgG0gcYNkyN3NERiEgy2JVZeIYRuv0K7EBHjdLOQpdK4giSrbqvTT24ukwhxk3VA6jl4H
 ejWypun21rg7T47OE46nHQCqtQ2yXtCJm1igGFiO2iisi3fTz//i+JWB3HFjnENnD481g4p8Zia
 l0YU3rQjP6ZF5hhPoatjaPN3JFdOjiNef99swA2bw56a2SlzEhj942caTD93krzqPAB5YJtsEU1
 C5BK073g6ZsIuQS7ZTy5mT5vEJ/wMHxuEEoMlKMOVayopJtGpV+QRvurnIVM1XST8tvP9kO/7Rb
 xRGlJWaE3kTp+D03w1FSXjJl9hi41w95tXiebDHXYqVg5NOe1p3i352a2x6yvwfMSAsYY62sRx9
 sPSneWtt5XmEl7A==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_045929_265226_E106BE50 
X-CRM114-Status: GOOD (  12.38  )
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

We have a dedicated initializer macro for defining pin functions for
mediatek drivers so use it here.

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
Reviewed-by: Andy Shevchenko <andy@kernel.org>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/mediatek/pinctrl-mt7988.c | 42 ++++++++++++-------------------
 1 file changed, 16 insertions(+), 26 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mt7988.c b/drivers/pinctrl/mediatek/pinctrl-mt7988.c
index 68b4097792b88356babe4368db7d0f60194e7309..55c8674d8d66f12d2f2246c215056d4e51296a9b 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt7988.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt7988.c
@@ -1465,32 +1465,22 @@ static const char * const mt7988_usb_groups[] = {
 };
 
 static const struct function_desc mt7988_functions[] = {
-	{ { "audio", mt7988_audio_groups, ARRAY_SIZE(mt7988_audio_groups) },
-	  NULL },
-	{ { "jtag", mt7988_jtag_groups, ARRAY_SIZE(mt7988_jtag_groups) },
-	  NULL },
-	{ { "int_usxgmii", mt7988_int_usxgmii_groups,
-	    ARRAY_SIZE(mt7988_int_usxgmii_groups) },
-	  NULL },
-	{ { "pwm", mt7988_pwm_groups, ARRAY_SIZE(mt7988_pwm_groups) }, NULL },
-	{ { "dfd", mt7988_dfd_groups, ARRAY_SIZE(mt7988_dfd_groups) }, NULL },
-	{ { "i2c", mt7988_i2c_groups, ARRAY_SIZE(mt7988_i2c_groups) }, NULL },
-	{ { "eth", mt7988_ethernet_groups, ARRAY_SIZE(mt7988_ethernet_groups) },
-	  NULL },
-	{ { "pcie", mt7988_pcie_groups, ARRAY_SIZE(mt7988_pcie_groups) },
-	  NULL },
-	{ { "pmic", mt7988_pmic_groups, ARRAY_SIZE(mt7988_pmic_groups) },
-	  NULL },
-	{ { "watchdog", mt7988_wdt_groups, ARRAY_SIZE(mt7988_wdt_groups) },
-	  NULL },
-	{ { "spi", mt7988_spi_groups, ARRAY_SIZE(mt7988_spi_groups) }, NULL },
-	{ { "flash", mt7988_flash_groups, ARRAY_SIZE(mt7988_flash_groups) },
-	  NULL },
-	{ { "uart", mt7988_uart_groups, ARRAY_SIZE(mt7988_uart_groups) },
-	  NULL },
-	{ { "udi", mt7988_udi_groups, ARRAY_SIZE(mt7988_udi_groups) }, NULL },
-	{ { "usb", mt7988_usb_groups, ARRAY_SIZE(mt7988_usb_groups) }, NULL },
-	{ { "led", mt7988_led_groups, ARRAY_SIZE(mt7988_led_groups) }, NULL },
+	PINCTRL_PIN_FUNCTION("audio", mt7988_audio),
+	PINCTRL_PIN_FUNCTION("jtag", mt7988_jtag),
+	PINCTRL_PIN_FUNCTION("int_usxgmii", mt7988_int_usxgmii),
+	PINCTRL_PIN_FUNCTION("pwm", mt7988_pwm),
+	PINCTRL_PIN_FUNCTION("dfd", mt7988_dfd),
+	PINCTRL_PIN_FUNCTION("i2c", mt7988_i2c),
+	PINCTRL_PIN_FUNCTION("eth", mt7988_ethernet),
+	PINCTRL_PIN_FUNCTION("pcie", mt7988_pcie),
+	PINCTRL_PIN_FUNCTION("pmic", mt7988_pmic),
+	PINCTRL_PIN_FUNCTION("watchdog", mt7988_wdt),
+	PINCTRL_PIN_FUNCTION("spi", mt7988_spi),
+	PINCTRL_PIN_FUNCTION("flash", mt7988_flash),
+	PINCTRL_PIN_FUNCTION("uart", mt7988_uart),
+	PINCTRL_PIN_FUNCTION("udi", mt7988_udi),
+	PINCTRL_PIN_FUNCTION("usb", mt7988_usb),
+	PINCTRL_PIN_FUNCTION("led", mt7988_led),
 };
 
 static const struct mtk_eint_hw mt7988_eint_hw = {

-- 
2.48.1


