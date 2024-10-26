Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45952D10C06
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Oct 2024 20:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JAqXyJ+sd57/HN5TRgePj1d+VaJoxJ/E5Im16zWHmNY=; b=HNn4mTzKEFmyShCHWzy5oiFBqy
	BCaFwwczousJ6tD1D1YnjBfUeIYGhzkv2GDAp6oC8UsPl2DFKlg+oIu5Q/II88e9ptJAfRH/wSsTB
	uGNcTbYz5yAajE/s37lv8CM/MagAd4gl2mIEBVOq9jn2u+xFKb02Ney0hvnPbncUle7zma5bYQVhl
	O5eHRi7gaMzz3rIg/ZTrhFMTgyHI1UsctCkcJNDdiY+1/xwwsRlRt9OZckAEDW282AKJ0tHj2h5tK
	mffXvDYgwJrszbHRqFddUQORkNy3QpTcHbMkTgeLKjsdRXHFccks1dgFFutF1zSA0FeYHMomG+4V5
	SnzPKcpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4nbW-00000007DL5-0CHz;
	Sat, 26 Oct 2024 20:41:46 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4nT5-00000007CCE-34Br
	for linux-arm-kernel@lists.infradead.org;
	Sat, 26 Oct 2024 20:33:05 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-539f76a6f0dso2845893e87.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 26 Oct 2024 13:33:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729974782; x=1730579582; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JAqXyJ+sd57/HN5TRgePj1d+VaJoxJ/E5Im16zWHmNY=;
        b=BAzgdotL5uuVTdwxcekWKalZmBrrqdWiMIUQJFt6lz1IKeDGpPhATOlmexWFBnJi9h
         kM8SWZP8NwXAOfySkqWxA0F+Wf+WQIWeIfAONdm4g8Wg4m7pbRNolQhQsbBWo0O+KFyn
         /bM6qfe/58sOu96Q6YU0oYkCsxMmN2KXIl5suv/DD25DvqfXzMt2IWbWSTdEPyRnHhnn
         qZWA3xq3RZFgu48VhZDNbr/tfoSzPTZgKnw7b3zHW9oPnVspFU+kikjzrjGVq4bslmMQ
         PPSpseHJNHu15FZ3SWPLqTg09Mbfa0ao9hyLwtqE3e4Y2dKsVhjv1w5F08K4u3UnW55y
         RzHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729974782; x=1730579582;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JAqXyJ+sd57/HN5TRgePj1d+VaJoxJ/E5Im16zWHmNY=;
        b=dWoiLZOl5HJqFRMtLqpNKcXZedmTBzts6c0+EwxV4GY/404Cdfh4A8ZkcMMzQW3c0k
         SzFRmJjp36PAPdGxvH1GUJCaQTAM+YPTzlBZx0/6vpvQzCjgA2Hq1ai/vjqXgvXgYXHB
         Y/j6M5S/IPF0T4TkCsFGKot+A7VDWrpcM34YaIneoA9APJWxN2mcvZdelGpoAJ3+sNeO
         LcGL9svsBdC3s8sGrwdlHggyEBGFjAN2Gx5hgrx1kkEWzJOSusTDMKGJzpXO5QIxF2k3
         kaVjWcDLoKPtBPVq9kX3dUduP/7EUEjJ5ueATZiBDLH2llk85hQRjAx2yOwG2gvp63ON
         z/PA==
X-Forwarded-Encrypted: i=1; AJvYcCXV3e/1lHsX0rGtO++RPZRnicS9/FO7d9RQXhL5GJ5osyA/bjUwZuhEnlbiq2Kw0R+Dvd7GGY1iwlilTMbFjtql@lists.infradead.org
X-Gm-Message-State: AOJu0YzZ0rCGJLqcSDDCv8hSKpfMf4a930lL2NX1C0sAaqJjobn6FEWe
	eur6IhuZN93tAmOsVI8vtS4UJiFc0FSMe92nJ7u5hsDMH91ydYja
X-Google-Smtp-Source: AGHT+IFPUYrCOBhBYch7XpKYen230Je9Z5xpOKaPCblTTpx9bDmGjGtMDMft0HEPU2hDXiMz8h3IzA==
X-Received: by 2002:a05:6512:3e0d:b0:53a:bb7:ed77 with SMTP id 2adb3069b0e04-53b348c6cacmr1278783e87.14.1729974781561;
        Sat, 26 Oct 2024 13:33:01 -0700 (PDT)
Received: from [192.168.1.105] ([178.136.36.129])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e1c9439sm595872e87.200.2024.10.26.13.33.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Oct 2024 13:33:01 -0700 (PDT)
From: Markuss Broks <markuss.broks@gmail.com>
Date: Sat, 26 Oct 2024 23:32:39 +0300
Subject: [PATCH v3 08/10] pinctrl: samsung: Add Exynos9810 SoC specific
 data
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241026-exynos9810-v3-8-b89de9441ea8@gmail.com>
References: <20241026-exynos9810-v3-0-b89de9441ea8@gmail.com>
In-Reply-To: <20241026-exynos9810-v3-0-b89de9441ea8@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Tomasz Figa <tomasz.figa@gmail.com>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>, 
 Markuss Broks <markuss.broks@gmail.com>, 
 Maksym Holovach <nergzd@nergzd723.xyz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729974770; l=9499;
 i=markuss.broks@gmail.com; s=20241024; h=from:subject:message-id;
 bh=772kJCnYOtiOBy++PT2wl3V88OlSm4ef4aJGY+fHLYg=;
 b=F92Ag5kxO4BZPCtvP7uOevuw+TQi4vq4CN6Sbve8uNXX1Mq7JsgnwphEaH1kF2gpBaUBojaBm
 HfZ0Y4WS4NAAFLEC3xtT+W8l5BOfL1Mw1DYspUFlso00YvjPDz5dmoU
X-Developer-Key: i=markuss.broks@gmail.com; a=ed25519;
 pk=p3Bh4oPpeCrTpffJvGch5WsWNikteWHJ+4LBICPbZg0=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241026_133303_799731_DD5E3E2B 
X-CRM114-Status: GOOD (  13.12  )
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

Add Samsung Exynos9810 SoC specific data to enable pinctrl
support for platforms based on Exynos9810.

Co-developed-by: Maksym Holovach <nergzd@nergzd723.xyz>
Signed-off-by: Maksym Holovach <nergzd@nergzd723.xyz>
Signed-off-by: Markuss Broks <markuss.broks@gmail.com>
---
 drivers/pinctrl/samsung/pinctrl-exynos-arm64.c | 154 +++++++++++++++++++++++++
 drivers/pinctrl/samsung/pinctrl-samsung.c      |   2 +
 drivers/pinctrl/samsung/pinctrl-samsung.h      |   1 +
 3 files changed, 157 insertions(+)

diff --git a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
index f07c26d374425505019447161150929f7677f91d..3ea7106ce5eae3c21f11790b5a40037042c1d407 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
+++ b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
@@ -767,6 +767,160 @@ const struct samsung_pinctrl_of_match_data exynos990_of_data __initconst = {
 	.num_ctrl	= ARRAY_SIZE(exynos990_pin_ctrl),
 };
 
+/* pin banks of exynos9810 pin-controller 0 (ALIVE) */
+static const struct samsung_pin_bank_data exynos9810_pin_banks0[] __initconst = {
+	EXYNOS850_PIN_BANK_EINTN(6, 0x000, "etc1"),
+	EXYNOS850_PIN_BANK_EINTW(8, 0x020, "gpa0", 0x00),
+	EXYNOS850_PIN_BANK_EINTW(8, 0x040, "gpa1", 0x04),
+	EXYNOS850_PIN_BANK_EINTW(8, 0x060, "gpa2", 0x08),
+	EXYNOS850_PIN_BANK_EINTW(8, 0x080, "gpa3", 0x0c),
+	EXYNOS850_PIN_BANK_EINTN(6, 0x0A0, "gpq0"),
+	EXYNOS850_PIN_BANK_EINTW(2, 0x0C0, "gpa4", 0x10),
+};
+
+/* pin banks of exynos9810 pin-controller 1 (AUD) */
+static const struct samsung_pin_bank_data exynos9810_pin_banks1[] __initconst = {
+	EXYNOS850_PIN_BANK_EINTG(5, 0x000, "gpb0", 0x00),
+	EXYNOS850_PIN_BANK_EINTG(8, 0x020, "gpb1", 0x04),
+	EXYNOS850_PIN_BANK_EINTG(4, 0x040, "gpb2", 0x08),
+};
+
+/* pin banks of exynos9810 pin-controller 2 (CHUB) */
+static const struct samsung_pin_bank_data exynos9810_pin_banks2[] __initconst = {
+	EXYNOS850_PIN_BANK_EINTG(8, 0x000, "gph0", 0x00),
+	EXYNOS850_PIN_BANK_EINTG(5, 0x020, "gph1", 0x04),
+};
+
+/* pin banks of exynos9810 pin-controller 3 (CMGP) */
+static const struct samsung_pin_bank_data exynos9810_pin_banks3[] __initconst = {
+	EXYNOS850_PIN_BANK_EINTW(1, 0x000, "gpm0", 0x00),
+	EXYNOS850_PIN_BANK_EINTW(1, 0x020, "gpm1", 0x04),
+	EXYNOS850_PIN_BANK_EINTW(1, 0x040, "gpm2", 0x08),
+	EXYNOS850_PIN_BANK_EINTW(1, 0x060, "gpm3", 0x0C),
+	EXYNOS850_PIN_BANK_EINTW(1, 0x080, "gpm4", 0x10),
+	EXYNOS850_PIN_BANK_EINTW(1, 0x0A0, "gpm5", 0x14),
+	EXYNOS850_PIN_BANK_EINTW(1, 0x0C0, "gpm6", 0x18),
+	EXYNOS850_PIN_BANK_EINTW(1, 0x0E0, "gpm7", 0x1C),
+	EXYNOS850_PIN_BANK_EINTW(1, 0x100, "gpm10", 0x20),
+	EXYNOS850_PIN_BANK_EINTW(1, 0x120, "gpm11", 0x24),
+	EXYNOS850_PIN_BANK_EINTW(1, 0x140, "gpm12", 0x28),
+	EXYNOS850_PIN_BANK_EINTW(1, 0x160, "gpm13", 0x2C),
+	EXYNOS850_PIN_BANK_EINTW(1, 0x180, "gpm14", 0x30),
+	EXYNOS850_PIN_BANK_EINTW(1, 0x1A0, "gpm15", 0x34),
+	EXYNOS850_PIN_BANK_EINTW(1, 0x1C0, "gpm16", 0x38),
+	EXYNOS850_PIN_BANK_EINTW(1, 0x1E0, "gpm17", 0x3C),
+	EXYNOS850_PIN_BANK_EINTW(1, 0x200, "gpm40", 0x40),
+	EXYNOS850_PIN_BANK_EINTW(1, 0x220, "gpm41", 0x44),
+	EXYNOS850_PIN_BANK_EINTW(1, 0x240, "gpm42", 0x48),
+	EXYNOS850_PIN_BANK_EINTW(1, 0x260, "gpm43", 0x4C),
+};
+
+/* pin banks of exynos9810 pin-controller 4 (FSYS0) */
+static const struct samsung_pin_bank_data exynos9810_pin_banks4[] __initconst = {
+	EXYNOS850_PIN_BANK_EINTG(2, 0x000, "gpf0", 0x00),
+};
+
+/* pin banks of exynos9810 pin-controller 5 (FSYS1) */
+static const struct samsung_pin_bank_data exynos9810_pin_banks5[] __initconst = {
+	EXYNOS850_PIN_BANK_EINTG(7, 0x000, "gpf1", 0x00),
+	EXYNOS850_PIN_BANK_EINTG(6, 0x020, "gpf2", 0x04),
+};
+
+/* pin banks of exynos9810 pin-controller 6 (PERIC0) */
+static const struct samsung_pin_bank_data exynos9810_pin_banks6[] __initconst = {
+	EXYNOS850_PIN_BANK_EINTG(8, 0x000, "gpp0", 0x00),
+	EXYNOS850_PIN_BANK_EINTG(8, 0x020, "gpp1", 0x04),
+	EXYNOS850_PIN_BANK_EINTG(8, 0x040, "gpp2", 0x08),
+	EXYNOS850_PIN_BANK_EINTG(4, 0x060, "gpp3", 0x0C),
+	EXYNOS850_PIN_BANK_EINTG(8, 0x080, "gpg0", 0x10),
+	EXYNOS850_PIN_BANK_EINTG(8, 0x0A0, "gpg1", 0x14),
+	EXYNOS850_PIN_BANK_EINTG(8, 0x0C0, "gpg2", 0x18),
+};
+
+/* pin banks of exynos9810 pin-controller 7 (PERIC1) */
+static const struct samsung_pin_bank_data exynos9810_pin_banks7[] __initconst = {
+	EXYNOS850_PIN_BANK_EINTG(8, 0x000, "gpp4", 0x00),
+	EXYNOS850_PIN_BANK_EINTG(8, 0x020, "gpp5", 0x04),
+	EXYNOS850_PIN_BANK_EINTG(4, 0x040, "gpp6", 0x08),
+	EXYNOS850_PIN_BANK_EINTG(8, 0x060, "gpc0", 0x0C),
+	EXYNOS850_PIN_BANK_EINTG(8, 0x080, "gpc1", 0x10),
+	EXYNOS850_PIN_BANK_EINTG(4, 0x0A0, "gpd0", 0x14),
+	EXYNOS850_PIN_BANK_EINTG(7, 0x0C0, "gpg3", 0x18),
+};
+
+/* pin banks of exynos9810 pin-controller 8 (VTS) */
+static const struct samsung_pin_bank_data exynos9810_pin_banks8[] __initconst = {
+	EXYNOS850_PIN_BANK_EINTG(3, 0x000, "gpt0", 0x00),
+};
+
+static const struct samsung_pin_ctrl exynos9810_pin_ctrl[] __initconst = {
+	{
+		/* pin-controller instance 0 ALIVE data */
+		.pin_banks      = exynos9810_pin_banks0,
+		.nr_banks       = ARRAY_SIZE(exynos9810_pin_banks0),
+		.eint_wkup_init = exynos_eint_wkup_init,
+		.eint_gpio_init = exynos_eint_gpio_init,
+		.suspend        = exynos_pinctrl_suspend,
+		.resume         = exynos_pinctrl_resume,
+	}, {
+		/* pin-controller instance 1 AUD data */
+		.pin_banks      = exynos9810_pin_banks1,
+		.nr_banks       = ARRAY_SIZE(exynos9810_pin_banks1),
+	}, {
+		/* pin-controller instance 2 CHUB data */
+		.pin_banks      = exynos9810_pin_banks2,
+		.nr_banks       = ARRAY_SIZE(exynos9810_pin_banks2),
+		.eint_gpio_init = exynos_eint_gpio_init,
+		.suspend        = exynos_pinctrl_suspend,
+		.resume         = exynos_pinctrl_resume,
+	}, {
+		/* pin-controller instance 3 CMGP data */
+		.pin_banks      = exynos9810_pin_banks3,
+		.nr_banks       = ARRAY_SIZE(exynos9810_pin_banks3),
+		.eint_wkup_init = exynos_eint_wkup_init,
+		.eint_gpio_init = exynos_eint_gpio_init,
+		.suspend        = exynos_pinctrl_suspend,
+		.resume         = exynos_pinctrl_resume,
+	}, {
+		/* pin-controller instance 4 FSYS0 data */
+		.pin_banks      = exynos9810_pin_banks4,
+		.nr_banks       = ARRAY_SIZE(exynos9810_pin_banks4),
+		.eint_gpio_init = exynos_eint_gpio_init,
+		.suspend        = exynos_pinctrl_suspend,
+		.resume         = exynos_pinctrl_resume,
+	}, {
+		/* pin-controller instance 5 FSYS1 data */
+		.pin_banks      = exynos9810_pin_banks5,
+		.nr_banks       = ARRAY_SIZE(exynos9810_pin_banks5),
+		.eint_gpio_init = exynos_eint_gpio_init,
+		.suspend        = exynos_pinctrl_suspend,
+		.resume         = exynos_pinctrl_resume,
+	}, {
+		/* pin-controller instance 6 PERIC0 data */
+		.pin_banks      = exynos9810_pin_banks6,
+		.nr_banks       = ARRAY_SIZE(exynos9810_pin_banks6),
+		.eint_gpio_init = exynos_eint_gpio_init,
+		.suspend        = exynos_pinctrl_suspend,
+		.resume         = exynos_pinctrl_resume,
+	}, {
+		/* pin-controller instance 7 PERIC1 data */
+		.pin_banks      = exynos9810_pin_banks7,
+		.nr_banks       = ARRAY_SIZE(exynos9810_pin_banks7),
+		.eint_gpio_init = exynos_eint_gpio_init,
+		.suspend        = exynos_pinctrl_suspend,
+		.resume         = exynos_pinctrl_resume,
+	}, {
+		/* pin-controller instance 8 VTS data */
+		.pin_banks      = exynos9810_pin_banks8,
+		.nr_banks       = ARRAY_SIZE(exynos9810_pin_banks8),
+	},
+};
+
+const struct samsung_pinctrl_of_match_data exynos9810_of_data __initconst = {
+	.ctrl		= exynos9810_pin_ctrl,
+	.num_ctrl	= ARRAY_SIZE(exynos9810_pin_ctrl),
+};
+
 /* pin banks of exynosautov9 pin-controller 0 (ALIVE) */
 static const struct samsung_pin_bank_data exynosautov9_pin_banks0[] __initconst = {
 	EXYNOS850_PIN_BANK_EINTW(8, 0x000, "gpa0", 0x00),
diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.c b/drivers/pinctrl/samsung/pinctrl-samsung.c
index 42e40860841bcc94e3c11bf313df792da10ab00b..bbedd980ec67234aad847b757f40af5002b11ebb 100644
--- a/drivers/pinctrl/samsung/pinctrl-samsung.c
+++ b/drivers/pinctrl/samsung/pinctrl-samsung.c
@@ -1479,6 +1479,8 @@ static const struct of_device_id samsung_pinctrl_dt_match[] = {
 		.data = &exynos850_of_data },
 	{ .compatible = "samsung,exynos8895-pinctrl",
 		.data = &exynos8895_of_data },
+	{ .compatible = "samsung,exynos9810-pinctrl",
+		.data = &exynos9810_of_data },
 	{ .compatible = "samsung,exynos990-pinctrl",
 		.data = &exynos990_of_data },
 	{ .compatible = "samsung,exynosautov9-pinctrl",
diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.h b/drivers/pinctrl/samsung/pinctrl-samsung.h
index 615048f945243d4173d40142f1e62c8aeefe5b7e..bb0689d52ea0b4392714fa9bcdcbae8d253c73a1 100644
--- a/drivers/pinctrl/samsung/pinctrl-samsung.h
+++ b/drivers/pinctrl/samsung/pinctrl-samsung.h
@@ -385,6 +385,7 @@ extern const struct samsung_pinctrl_of_match_data exynos7_of_data;
 extern const struct samsung_pinctrl_of_match_data exynos7885_of_data;
 extern const struct samsung_pinctrl_of_match_data exynos850_of_data;
 extern const struct samsung_pinctrl_of_match_data exynos8895_of_data;
+extern const struct samsung_pinctrl_of_match_data exynos9810_of_data;
 extern const struct samsung_pinctrl_of_match_data exynos990_of_data;
 extern const struct samsung_pinctrl_of_match_data exynosautov9_of_data;
 extern const struct samsung_pinctrl_of_match_data exynosautov920_of_data;

-- 
2.46.2


