Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43EC0C8303F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 19:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AxPihWEE9okM75l8p7+ohG5rL5D7+pdcAJ7iXomcZQ8=; b=jn8FearA4c02HCBE2XNiSFlh67
	Qydtz7uetbIBPyMYBzztt6dILKQ6vnNtrOb/BAHeXGSsCaL74RNmjNLCnu88+lcD/R7FCB0CYVN6J
	9ldBQkFlLVdg7Sv6JcRWvL+9tMbdAdOXXfEbclm4xKez5YwcVX6/93wbt8vZ0LslYdv5UtUTuThAR
	nieg0IBjJySjsTFNs9T/D23CN0Pw2eAmE3hUKJPsjRBAXeRQLm1Zf3qZ3AEduWjUFweoQA7d6b5za
	PH/Z3u0hYzcpaUaipdMAHkH+pR+TeECk5kKy+H+r/4OCSh3yzqfuf5MRUHU1Qvw4au+36MFohnz7l
	aZ2S7/Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urhrH-00000002tir-1Ktn;
	Thu, 28 Aug 2025 19:00:27 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urf34-00000002BHa-2ihX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Aug 2025 16:00:27 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-45b4d8921f2so9987335e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 Aug 2025 09:00:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756396825; x=1757001625; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AxPihWEE9okM75l8p7+ohG5rL5D7+pdcAJ7iXomcZQ8=;
        b=20GZC3ba2B0WMoKDDH9cRKiJMUI+bWIexKFMf7NoFid1p/LxkmMTcvF71PTIwASwTb
         q2Ip64h+kZ5Saiq3rJLAzXbu7dz9D4g7Sg2s2AEg3+kMWLs+uRZI0U6QnyEZgnsX/BSt
         VYLp0K3fw7p15A1F8VstCA7WiieFQo/LeVa7gsa2G/m5KfqGhy9062F+ZMdEnPhY5PxT
         4P3AP+XIpFAEIhNbYIEb+xbWT2W27BYc501lobn1Bdw7MuZOeKo4HXZHsOlJcXCL2VJU
         NUfIyaxqIypR5GU930B4MontHAC8PEuzJkXrUjft7HAG2kgXj5IMDW+A/I9/ceW4P99j
         Kp1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756396825; x=1757001625;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AxPihWEE9okM75l8p7+ohG5rL5D7+pdcAJ7iXomcZQ8=;
        b=uT7X/lMGWQWCXbyTX7AzO/+lIo5aPi44q1EppPtI+j1LuIalnDi4s8Nb4fX/AAK/Cw
         MPR/styZ6sNaDdlasaEieG/ENcukD9Nc/hpeAjDuvorFLpggSwNrhbG7+DWdABLijehu
         agL5aiXeU6VDt2Ig+XN5BOtmV5pGnFyhrpNrEAXhRJ5ugUu6oFEP0RX3mXHhm/M1O4Do
         z+6fl7wcTd4ZPMphTXA5AXibPAYz1T0BR8Lab3THUCYqumaofLwB6fqJkNl5+1qm5Upt
         ew6EPc9dG11corjwnMRs0HsmeU6Fmd4pR9EriTIsMf+gJjCgJgbMwU25ZPGNaHPUj4Ab
         r7rQ==
X-Forwarded-Encrypted: i=1; AJvYcCWCLN6W25QHZ3kdgquYfA7qzg4mSvUZdfIn5x03GWlMiLIe909m0ECxS6ZriQYZtojEdIbpCcYIi+BMWlBR12C1@lists.infradead.org
X-Gm-Message-State: AOJu0Yxd2tiMphjqZJ/bNeVgLcwl3iw3jjNEH2grIHXtyCfZpa05D10L
	t3t7+glrVBujiGGM7aQFDzVhU2W/gM3KkmdXk0DnKCuU+CZ3Zf4RHkN6U8GmlzaahaI=
X-Gm-Gg: ASbGncvg75aMB2SUY2XVNA/m8a7hxJWs1p2ukRvPrVUJ4dTR4ZGoZ3Psa26h/lPGHeF
	GT3PIhpUqPupj4RCzTsKyzYHmmNw9RBjt29TvMLhOAP8JrnTExs4XyFYl+geZx3v+A6iQnMJSBp
	nhFmjzu2kW3vszwrvGPCiDHkzZnKVrh9TJy1y6MfTtD4Ei543K6WxhqdhvyUEiB6WtQl2GAr/T0
	Oxqk66fxQDFWOGx3BPOntHqB2RYiD51qrBwbAoTc2Lq/r7ZeNlRf9Hx+rQ8dDvpfEPV3YF6xadw
	8TOyr2bfVXWoMcmcIhnhRsnd9yQJsWPMu8UBYl3UQogX08U2RY/65KGsoiwQZLUAeL7z4OyoQsQ
	kt2N/pAigcCZeOBWwcKOktIKu/NDp
X-Google-Smtp-Source: AGHT+IGRMyHayDmkLGW7+TAO1iROYIwKh5FOICjdfcZ0105VGTYnJRy0SkhUfojn9IN8Mk3CuNpnVQ==
X-Received: by 2002:a05:600c:35c4:b0:45b:7bba:c7b1 with SMTP id 5b1f17b1804b1-45b7bbacbc1mr17635415e9.32.1756396824905;
        Thu, 28 Aug 2025 09:00:24 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:4933:4d7c:cf69:9502])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b6f0c6fe5sm80211675e9.5.2025.08.28.09.00.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 09:00:24 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 28 Aug 2025 18:00:12 +0200
Subject: [PATCH v6 04/15] pinctrl: mediatek: mt7988: use
 PINCTRL_PIN_FUNCTION()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250828-pinctrl-gpio-pinfuncs-v6-4-c9abb6bdb689@linaro.org>
References: <20250828-pinctrl-gpio-pinfuncs-v6-0-c9abb6bdb689@linaro.org>
In-Reply-To: <20250828-pinctrl-gpio-pinfuncs-v6-0-c9abb6bdb689@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2921;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=79i9CgDBpTwy0KAMS4vozziB177zSWYhoWrySFXqKM4=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBosH0Nb2Lfmw6OgPTm+UKi/evxFaUCjOaMgc4KJ
 G/Jl7qtg3uJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaLB9DQAKCRARpy6gFHHX
 cmd1D/9O9r1DDeMjfZpJc7L4WQYFg4NpL4bsKIEQD/4HTfJtY0F0AbCzTUVX8wvtO6G7Oz7Ckl1
 JGsGL2ePPaPSOhC4u0K4c6e8AGfOLuS65Aup1ZPjk9dByafrLUoaeoI1SM2rk0Ff93R5dCbWAhV
 O+zwBzL4wpnwF6q8j7vEmnrERbfUK4DJyPUYU8dEMlQpCvM2xq3vX+6M9aRECpcDSDIgjXsJaiC
 3SEQGGSpuSWLH4vgWbPAhYTv2uA//5mK/J93r57YZIjbfUe7EN+xvbqFhkUX8sFPTTQ1K5nSV3I
 1xJamJF6MUu1lz6b7z/ZIRwkLcp9NWTEKBcIA5UbweTZFziTMjOdWQ+wncqGqm/jw3vitwXbUp/
 DaSwfS6lcv7zefvLHYddAx3HLAixXjkS/XVFAC9VZW2ZtNpqJXBMl8S9+hfVpwXFc3OlVI+764g
 v9EF9SWddtxMvleCD6Cw2vOD0URS5JtaEfX8/draXvRAklHRp8xnNS6tXVnx/pQWNt/SKMcxHfi
 EuioUyf3YE+ywH7kBFazoYHGSt5+i0XaiWxZPkvXjk1A/9V/nJyroGXDVvC6IJKNSYJSkbmxsm5
 6AQHNTKZD1aoqjMJa0hcJdLtcBCZCHyZup13Wvn6cJC7D3MAy+LWRbAi9MJMBS4G00bSg2oJCqw
 6ccAd8cQ8L3Zydg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_090026_696357_375C6A95 
X-CRM114-Status: GOOD (  12.22  )
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


