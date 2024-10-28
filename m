Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F83AD13588
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 09:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lULs5ECe2v/eFZFaOgsynlSrffO8W5NVPtm3h9ZcjLk=; b=FfQmW27syiOVq2poixqWG+ImUP
	CeJbEOLUKAIN7kPH9ap0xz2WuitiHkO32yomfGG3IT9fd0aAiroo8NJOwbQg0Rlf3j2No/0gYa7sb
	iyh7Z+c2GjPZOjGtPo4dx2H3xyuddap8CDq3IYwXHdwCzPXtqWdFdJFmD80l96h6TfPAT16jjr8Pm
	wm9EImOlfmxxlRhVCdSMtnKL0jE6BIAYQ5kJO+bZHSqfIYij2sAfWWjpHBoVgUhpVOX3MgGUsMesN
	B+9tcalHEuVj1WH+49O7D6yKwIsYi4mICv/uq/z5X4p+19CfmOR7aOKFsEc8sXJ5vNcUxbbza9Dqx
	ANqBkQ9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5MCA-0000000AFx2-04B9;
	Mon, 28 Oct 2024 09:37:54 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5Lxo-0000000ADhJ-3vsh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 09:23:06 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-539ee1acb86so4019340e87.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Oct 2024 02:23:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730107383; x=1730712183; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lULs5ECe2v/eFZFaOgsynlSrffO8W5NVPtm3h9ZcjLk=;
        b=An0WyZCmkk6ORkBG39ZlcwEwx1e/u028QXJ6a5KWnSDzVNcSdCs9xV8swv7WE2NdVA
         1NUCp3mw+wec/KMfmGVZF0+HACDQbv8QRp+gq4DLeQncilrvEm44N1dHfrpLJVGJaTx2
         60l/+MlybbIA2pvdYGrkuoPzj5Nm2fCOEj7Wz3RJT4G9cSOCEafhPOtBm1nSJtVQT5kM
         EABtK5OIFfv6tigqFcJ66NszrTT/83Ps+tZo934zJ32N5tPf1yWl18uBF6zgk10cw60a
         oTkV6pX0ZrG2cD2tnzauLmLJH5w+aqibjAadoxbUzDYvmVh3ugCSPLzn4X/LGS8H94hw
         nJBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730107383; x=1730712183;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lULs5ECe2v/eFZFaOgsynlSrffO8W5NVPtm3h9ZcjLk=;
        b=qqbjKhyoSPudDDBvh/naMetdm7FAeyuBWuLagFvelRxNwLGWw53L3AWkEeMfU+ylna
         kK6V5t1GIusqHFlPhY4HTk2j25xp7RW9s5Rdgeyp5xehhoo9644AXl3Qht5Hx/naUlKJ
         YaeB6YmXGIOSAR8cB80BSiRR3oAXmyobTsJTbCKoA36lD0osHnbT8PntRVoCgFEjTIgA
         4MMcf2LGOEFZ3foQ6ndpuFz6UmMcqgaX58QrVLXMW531QNGW0zeWDpq25E42OXOeYcwc
         Oj2zKVLyMHyZ6vN3wOEHH+gFzrK8+6u7TRLllPhTkktL4jSFW/Jec4kJp8gghnEuVlOw
         JQBw==
X-Forwarded-Encrypted: i=1; AJvYcCXbRoQwrQJBNIKmmLCLM8s/t63SIlUpVHl4DblTJMWXp0mCwAIbtMkdRu+D1n74/U0uPIRt9gtlyj00wNQXY89R@lists.infradead.org
X-Gm-Message-State: AOJu0YxvUymsTDCzhD7Zd6opfGj748aUCkBuGfmHlTAcCKIfa3koVOlg
	3ePrGQpaSrVFFar+eZh+b36keT9Qeptbd30F1+AdsKZBS38xDkkO
X-Google-Smtp-Source: AGHT+IEqtnjZtXnnjinm/JZUfiqvF+qabb/BGc98HrsLidXhMPAXZuzXSfOZUI+CMpO8R1g9w5lKaA==
X-Received: by 2002:a05:6512:39c7:b0:52e:9e70:d068 with SMTP id 2adb3069b0e04-53b348c0c88mr3478898e87.4.1730107382508;
        Mon, 28 Oct 2024 02:23:02 -0700 (PDT)
Received: from [192.168.1.105] ([178.136.36.129])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e1af331sm1043785e87.152.2024.10.28.02.23.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 02:23:02 -0700 (PDT)
From: Markuss Broks <markuss.broks@gmail.com>
Date: Mon, 28 Oct 2024 11:22:36 +0200
Subject: [PATCH v4 08/10] pinctrl: samsung: Add Exynos9810 SoC specific
 data
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241028-exynos9810-v4-8-6191f9d0c0f1@gmail.com>
References: <20241028-exynos9810-v4-0-6191f9d0c0f1@gmail.com>
In-Reply-To: <20241028-exynos9810-v4-0-6191f9d0c0f1@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1730107370; l=9499;
 i=markuss.broks@gmail.com; s=20241024; h=from:subject:message-id;
 bh=/Wc4BlemWmeccz/B4/h7WpFQZV+ll/cqwv5qNCPJALQ=;
 b=GL5LQZfPY6F0E/mYr3jZGqc9ErIKnedJlvZDed/l/DFoqBUooFxFTmIU4R19ItdaHDxCqcnyD
 ++eyQUs+dqlAdojXwfdhAipcv2Ldqw/DEhz4y0NS24QSoB5OH3KR7n2
X-Developer-Key: i=markuss.broks@gmail.com; a=ed25519;
 pk=p3Bh4oPpeCrTpffJvGch5WsWNikteWHJ+4LBICPbZg0=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_022305_026354_CF2844AA 
X-CRM114-Status: GOOD (  14.04  )
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
index f07c26d374425505019447161150929f7677f91d..c833cb8fb4854e69c92213ef1f53d7b524e56306 100644
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
+	EXYNOS850_PIN_BANK_EINTN(6, 0x0a0, "gpq0"),
+	EXYNOS850_PIN_BANK_EINTW(2, 0x0c0, "gpa4", 0x10),
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
+	EXYNOS850_PIN_BANK_EINTW(1, 0x060, "gpm3", 0x0c),
+	EXYNOS850_PIN_BANK_EINTW(1, 0x080, "gpm4", 0x10),
+	EXYNOS850_PIN_BANK_EINTW(1, 0x0a0, "gpm5", 0x14),
+	EXYNOS850_PIN_BANK_EINTW(1, 0x0c0, "gpm6", 0x18),
+	EXYNOS850_PIN_BANK_EINTW(1, 0x0e0, "gpm7", 0x1c),
+	EXYNOS850_PIN_BANK_EINTW(1, 0x100, "gpm10", 0x20),
+	EXYNOS850_PIN_BANK_EINTW(1, 0x120, "gpm11", 0x24),
+	EXYNOS850_PIN_BANK_EINTW(1, 0x140, "gpm12", 0x28),
+	EXYNOS850_PIN_BANK_EINTW(1, 0x160, "gpm13", 0x2c),
+	EXYNOS850_PIN_BANK_EINTW(1, 0x180, "gpm14", 0x30),
+	EXYNOS850_PIN_BANK_EINTW(1, 0x1a0, "gpm15", 0x34),
+	EXYNOS850_PIN_BANK_EINTW(1, 0x1c0, "gpm16", 0x38),
+	EXYNOS850_PIN_BANK_EINTW(1, 0x1e0, "gpm17", 0x3c),
+	EXYNOS850_PIN_BANK_EINTW(1, 0x200, "gpm40", 0x40),
+	EXYNOS850_PIN_BANK_EINTW(1, 0x220, "gpm41", 0x44),
+	EXYNOS850_PIN_BANK_EINTW(1, 0x240, "gpm42", 0x48),
+	EXYNOS850_PIN_BANK_EINTW(1, 0x260, "gpm43", 0x4c),
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
+	EXYNOS850_PIN_BANK_EINTG(4, 0x060, "gpp3", 0x0c),
+	EXYNOS850_PIN_BANK_EINTG(8, 0x080, "gpg0", 0x10),
+	EXYNOS850_PIN_BANK_EINTG(8, 0x0a0, "gpg1", 0x14),
+	EXYNOS850_PIN_BANK_EINTG(8, 0x0c0, "gpg2", 0x18),
+};
+
+/* pin banks of exynos9810 pin-controller 7 (PERIC1) */
+static const struct samsung_pin_bank_data exynos9810_pin_banks7[] __initconst = {
+	EXYNOS850_PIN_BANK_EINTG(8, 0x000, "gpp4", 0x00),
+	EXYNOS850_PIN_BANK_EINTG(8, 0x020, "gpp5", 0x04),
+	EXYNOS850_PIN_BANK_EINTG(4, 0x040, "gpp6", 0x08),
+	EXYNOS850_PIN_BANK_EINTG(8, 0x060, "gpc0", 0x0c),
+	EXYNOS850_PIN_BANK_EINTG(8, 0x080, "gpc1", 0x10),
+	EXYNOS850_PIN_BANK_EINTG(4, 0x0a0, "gpd0", 0x14),
+	EXYNOS850_PIN_BANK_EINTG(7, 0x0c0, "gpg3", 0x18),
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


