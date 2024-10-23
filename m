Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCFC9D0BB47
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 22:55:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ml4tZn5HyFNzt6Y4nPtF9skfxOEWkeIh9z2SY/9hfwo=; b=wKz9rnvAueaZbOEh/tpENVG3gs
	4KUojLfXoCwnCknCx/6yEwu3BKEyZtfOe4TGRwYaxIcJi+3ngQ4Q8o0kqT/3qv9ZY+HiW+PFhceUb
	/CNav/Egbx5xmSqXT/8FITLvF1mNn+QZIi1CNXm50k/AW8cA2Rzmr9nNuGwcyizW+c2KZBSauEuGi
	KL1OraI/D0fT26Vo1ul9QsNr6eO0sQ2vRfRbysgYdxsuxQjAqZ2i2YlmB2hbc6woXk/TWQvZrqCJv
	SRNJ3ZeRAfT7Emf9/rLN0ApBUe9r2QGlnq8sh62s84Pvs1wTvi9LQetGPIGJ5ZktAG7dCPqwcYG1d
	nRXO3SKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3kGR-0000000GAZH-0Gzx;
	Wed, 23 Oct 2024 22:55:39 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3jyr-0000000G705-2Hgz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 22:37:30 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-5c9404c0d50so275324a12.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Oct 2024 15:37:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729723047; x=1730327847; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ml4tZn5HyFNzt6Y4nPtF9skfxOEWkeIh9z2SY/9hfwo=;
        b=Z3L1dFYkrcW/q+R8sye8OZWztC8bs0mkrvrDs+xouEub9XF/QcvcH6Awd9lrTacVH2
         YJHrvuPwxKzyEXZpMBgCo1eD9D1vYkZvwabBmOaUVblRVyk47Sw6BWFEijlnOrXpKBhR
         Wi456jIqQojmgXbEVDzueAZpwNhMQSA7G1TtynP7cV/7EsM61ddorn3BfjsclXfsAlCU
         leiJvQavvcTq/5e8L8AXAQhmkxeKpdF6wgz7HjhsMnTJMeHNazhysRZOVbGqZMB0JBV7
         gAQqUweNAJz1lldfj8+NsszDTOnbaF4QvxF0yRP38OK0McyjxZFIaEqMl8GhQkHXei4b
         hEEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729723047; x=1730327847;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ml4tZn5HyFNzt6Y4nPtF9skfxOEWkeIh9z2SY/9hfwo=;
        b=RKvCmqaI5AarbYXsRnBPklUw501KaYlt/IOeLWmxTXb0ohrBglgt1cIuHy5IC6b1mk
         MPxHkVoJBbrk364GFFFKPmd98YP+itqfsqw/+K8D8fKRaSn7hXaN8027CEt9W/Sd3uQi
         Z4wTTz2zD7k7v2+5p8k5G/cyzKnVeFpTz2blgKLF6ehIquOZtJ6XOfpjhinPakVacEWU
         Yh0WA00mWXL2DNH2WtUxJEqnw2ALobJs29jt2y93/Gly3rT9j52kBsX/09HE3HWcLGrT
         JDPkfSH3xLyBMoNF09oajtDFxZ95qhWdqbIrK+rxZ8Kj6d37C2xK591nIfbPFy4TYERv
         Ob6g==
X-Forwarded-Encrypted: i=1; AJvYcCX/Dq0wjbQbDAB79AfCnEf5Jz7zKMrB/vnfYUrs0xbwGSENNPh+XS+9fRPz5rauT7KN21X7RrLaZ35vlzAcQa3F@lists.infradead.org
X-Gm-Message-State: AOJu0YxWZIHnevG9FSCMusgfcchBSX734tJjU98096o9aDseKmYvmQ4l
	3XyrZkVahlWsIhbiSYT00rMVkvH0rZbD9WGRDuthc4fcn4I35J01
X-Google-Smtp-Source: AGHT+IG0mGC3boq+yTYuzDWOTAPZG8zjt7VmG0RpKlJyko8TFMCPKrosNA9CRKTqttYLcKKQeTeHdg==
X-Received: by 2002:a05:6402:51d1:b0:5c5:b90a:5b78 with SMTP id 4fb4d7f45d1cf-5cb8ac6369cmr3977928a12.5.1729723047434;
        Wed, 23 Oct 2024 15:37:27 -0700 (PDT)
Received: from [192.168.122.1] (93-190-140-122.hosted-by-worldstream.net. [93.190.140.122])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cb6696b4easm4907816a12.12.2024.10.23.15.37.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 15:37:27 -0700 (PDT)
From: Markuss Broks <markuss.broks@gmail.com>
Date: Thu, 24 Oct 2024 01:36:41 +0300
Subject: [PATCH 10/12] pinctrl: samsung: Add Exynos9810 SoC specific data
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241024-exynos9810-v1-10-ed14d0d60d08@gmail.com>
References: <20241024-exynos9810-v1-0-ed14d0d60d08@gmail.com>
In-Reply-To: <20241024-exynos9810-v1-0-ed14d0d60d08@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729723025; l=9443;
 i=markuss.broks@gmail.com; s=20241024; h=from:subject:message-id;
 bh=TiIPfYt0RbveUi7nl+E5H8W22i+gt+I/IW+gTN3LGVI=;
 b=ys8MFnZ47aYyWibdD8vyNhiwzfo6GJsmFHH20zw/a2X4b0ROVXgiywHp54YMkmloTSnA0m4GO
 yF/2tcu80qiCaMA67AdrXUwIY0/pEjLfKtWNBjsnhXnHHiooLtbRLjH
X-Developer-Key: i=markuss.broks@gmail.com; a=ed25519;
 pk=p3Bh4oPpeCrTpffJvGch5WsWNikteWHJ+4LBICPbZg0=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_153729_631251_83F1B673 
X-CRM114-Status: GOOD (  13.23  )
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

Co-authored-by: Maksym Holovach <nergzd@nergzd723.xyz>
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


