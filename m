Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AB45CAC582
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Sep 2025 11:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XOBGx5UfQF1cbSUEX3Z3Fdo9tcNmtD8DWDihqQ0/EZc=; b=asDre17Jp1zboQB3hpT8Admt6H
	2lS9hbkympM1OMN31LagNhqw2RF76wmCH86qhcvZf99rae+5YW1hnqgs7Rb7KtS2jS8S7YAKTH4iq
	uXCXhDNfLUCFCengoE0T30b+fkr7Ut+kC6PicOQtj4xPgP+UbHgWQm24ADW7e4XyRBxEwumoqs4Rk
	fZ0eChayuEZreQaNqShRlQVNa5WGSWqoj6cAReQKNObAH49l+aQUMBr2nOWGHTxVEoTbCxbtfeAcm
	JZlZarZjptd3AyiyvP8phtACr2oHg3TgEiEsHQ/I06i2CVdsaplnShepJwEcJ8vud0oenCm5TnRRd
	G5ay1/sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxlAR-00000000zsW-0lr1;
	Sun, 14 Sep 2025 11:45:15 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxlAJ-00000000znd-12ZY
	for linux-arm-kernel@lists.infradead.org;
	Sun, 14 Sep 2025 11:45:08 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-3e9042021faso541407f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 14 Sep 2025 04:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757850305; x=1758455105; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XOBGx5UfQF1cbSUEX3Z3Fdo9tcNmtD8DWDihqQ0/EZc=;
        b=QzhwDn5a4G01gz7sLcLwnKV2dcN58gDQGU+Y26D6iQXgyaPY67nseJ32Pt6sF2UZ+V
         TVIo5M02J2pYveEzaWLoC2C/R8YriU64fk5SnqH/pXc7TPCgR3u0DyJOBLrqLABXV7EM
         vRssbMc7TVEFAk7NIgw5VSJnPnKGbjXBtokFaQyNEgOlrnVOfsNpwcyU5R8mXvxZOpkY
         3pdVPuxQ0PZz1xPPQrUZ7XtD9PkwDLI65pqANyQyGALNTIbmktaxWxFQEiqUp1IpafBI
         UR84F6Lznpe1+E1J5/SxPDpZkvaqXIsNp/FS14Wt6HDIk0ENPJtdiHAVPHFYwglNsWv5
         NIYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757850305; x=1758455105;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XOBGx5UfQF1cbSUEX3Z3Fdo9tcNmtD8DWDihqQ0/EZc=;
        b=nXmPGHqNVi5gV4JFXnHgBDOUrQnNdYJPxxaUCcyMej54g9bQtc4J7udy8VydWO1/bc
         UgVHZQbzxzQe3H8i6dlEbJzVYFNvloa20nSwNth0IYvAy4/kn6lxEFW96cc/v5NNjYQk
         7u6huP2bVhPXRe06+aNrWO9sDNm0GDbY02W1P/Qd9lvnqqqeon4eNm9xlEr9xWOvnoaV
         /wPvT6gENiPmnt/V0u/rRuf45igCAN7tnY207JTHJWGpg2JMOWKaqM2RRVjp7qW2O8Bx
         3Kb+4r4QswGjjExz/Q+BBBg5LDfAi6V3T0/3p7xPvfqVlRxsMKyUtMo1MYOfC2uYYrn3
         xkFw==
X-Forwarded-Encrypted: i=1; AJvYcCVMfzggmtfDYF0jQkJ3osyF7d4VzYVm2twtvuHafYKcLUP6xP2BjBv4bMNdXh3hp1yxWxgXmbtvTf8WROxU4D15@lists.infradead.org
X-Gm-Message-State: AOJu0YzWnKyl0KA5Lcq0w/K79bonO9ZFMvfzATwKhPfh25vOIiT7JWt3
	FzzueMEuNEq1GhKESbZycRvTV7zh94K4diPblashxlPyTCs+HR1ldcsX
X-Gm-Gg: ASbGnctu0LyawqJMNldoZ/Zz/nHs+Z5mjRvHCdMHhPe1UEFnjFBN3Ba8kn0Ld7/EO/L
	2rVRzRPe0wyCLKxWrdeQLR0nXFv0tgmtmehwjrABY7pHYrixH5sHexWCZbEbareb+Vk1+8Mr++C
	K5K9VgMExAC3lJ4pkSijbgkiRzJ12lCA3u5llcsaVNhYPjA5lmXd5BJN7A3W9XfqivtMzxizfjG
	UTApQtSgwD+JqACmmMxiLAnlH3bQVoNj/S00Q+Rg69s47RvKidydmrvCdRq6cK8Bno8tf4zIJjG
	Ju2zjDjwyQL4yHbZtKWDkWZdtSbcyrREFDMYAV8xm5K1gT9FwLWHOUTn3CEgtZvfmW8GQB+z5Hx
	lUAzK7Um7NU5Wsc3qRbLcIwnyBtzicndvAqBpk+lYgvNCjhnKp8L5Ti8MN89+DG/qBAwoKHSq4T
	ijnb94zAf0qAt2qW7s+o4=
X-Google-Smtp-Source: AGHT+IH1kZMIQbcvz/AkhF5xVxViOePUrcgSUXzqMg2mlEpuTjv12GDP+FNhK68LyJiGfMQXmrywGA==
X-Received: by 2002:a05:6000:2584:b0:3e7:5edd:ce07 with SMTP id ffacd0b85a97d-3e7659f3bc0mr9211873f8f.40.1757850305268;
        Sun, 14 Sep 2025 04:45:05 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3ea21a6e4basm1503252f8f.11.2025.09.14.04.45.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 04:45:04 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Tomasz Figa <tomasz.figa@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 3/3] pinctrl: samsung: add exynos8890 SoC pinctrl configuration
Date: Sun, 14 Sep 2025 14:44:57 +0300
Message-ID: <20250914114457.2610013-4-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250914114457.2610013-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250914114457.2610013-1-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250914_044507_332434_F6836ABE 
X-CRM114-Status: GOOD (  14.61  )
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

Add support for the pin-controller found on the exynos8890 SoC, used in
Samsung Galaxy S7.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 .../pinctrl/samsung/pinctrl-exynos-arm64.c    | 157 ++++++++++++++++++
 drivers/pinctrl/samsung/pinctrl-samsung.c     |   2 +
 drivers/pinctrl/samsung/pinctrl-samsung.h     |   1 +
 3 files changed, 160 insertions(+)

diff --git a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
index 5fe7c4b9f..901047a72 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
+++ b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
@@ -1476,6 +1476,163 @@ const struct samsung_pinctrl_of_match_data exynosautov920_of_data __initconst =
 	.num_ctrl	= ARRAY_SIZE(exynosautov920_pin_ctrl),
 };
 
+/* pin banks of exynos8890 pin-controller 0 (ALIVE) */
+static const struct samsung_pin_bank_data exynos8890_pin_banks0[] __initconst = {
+	/* Must start with EINTG banks, ordered by EINT group number. */
+	EXYNOS7870_PIN_BANK_EINTW(8, 0x000, "gpa0", 0x00),
+	EXYNOS7870_PIN_BANK_EINTW(8, 0x020, "gpa1", 0x04),
+	EXYNOS7870_PIN_BANK_EINTW(8, 0x040, "gpa2", 0x08),
+	EXYNOS7870_PIN_BANK_EINTW(8, 0x060, "gpa3", 0x0c),
+};
+
+/* pin banks of exynos8890 pin-controller 1 (AUD) */
+static const struct samsung_pin_bank_data exynos8890_pin_banks1[] __initconst = {
+	/* Must start with EINTG banks, ordered by EINT group number. */
+	EXYNOS8895_PIN_BANK_EINTG(7, 0x000, "gph0", 0x00),
+};
+
+/* pin banks of exynos8890 pin-controller 2 (CCORE) */
+static const struct samsung_pin_bank_data exynos8890_pin_banks2[] __initconst = {
+	/* Must start with EINTG banks, ordered by EINT group number. */
+	EXYNOS8895_PIN_BANK_EINTG(2, 0x000, "etc0", 0x00),
+};
+
+/* pin banks of exynos8890 pin-controller 3 (ESE) */
+static const struct samsung_pin_bank_data exynos8890_pin_banks3[] __initconst = {
+	/* Must start with EINTG banks, ordered by EINT group number. */
+	EXYNOS8895_PIN_BANK_EINTG(5, 0x000, "gpf3", 0x00),
+};
+
+/* pin banks of exynos8890 pin-controller 4 (FP) */
+static const struct samsung_pin_bank_data exynos8890_pin_banks4[] __initconst = {
+	/* Must start with EINTG banks, ordered by EINT group number. */
+	EXYNOS8895_PIN_BANK_EINTG(4, 0x000, "gpf2", 0x00),
+};
+
+/* pin banks of exynos8890 pin-controller 5 (FSYS0) */
+static const struct samsung_pin_bank_data exynos8890_pin_banks5[] __initconst = {
+	/* Must start with EINTG banks, ordered by EINT group number. */
+	EXYNOS8895_PIN_BANK_EINTG(4, 0x000, "gpi1", 0x00),
+	EXYNOS8895_PIN_BANK_EINTG(8, 0x020, "gpi2", 0x04),
+};
+
+/* pin banks of exynos8890 pin-controller 6 (FSYS1) */
+static const struct samsung_pin_bank_data exynos8890_pin_banks6[] __initconst = {
+	/* Must start with EINTG banks, ordered by EINT group number. */
+	EXYNOS8895_PIN_BANK_EINTG(7, 0x000, "gpj0", 0x00),
+};
+
+/* pin banks of exynos8890 pin-controller 7 (NFC) */
+static const struct samsung_pin_bank_data exynos8890_pin_banks7[] __initconst = {
+	/* Must start with EINTG banks, ordered by EINT group number. */
+	EXYNOS8895_PIN_BANK_EINTG(3, 0x000, "gpf0", 0x00),
+};
+
+/* pin banks of exynos8890 pin-controller 8 (PERIC0) */
+static const struct samsung_pin_bank_data exynos8890_pin_banks8[] __initconst = {
+	/* Must start with EINTG banks, ordered by EINT group number. */
+	EXYNOS8895_PIN_BANK_EINTG(6, 0x000, "gpi0", 0x00),
+	EXYNOS8895_PIN_BANK_EINTG(8, 0x020, "gpd0", 0x04),
+	EXYNOS8895_PIN_BANK_EINTG(6, 0x040, "gpd1", 0x08),
+	EXYNOS8895_PIN_BANK_EINTG(4, 0x060, "gpd2", 0x0c),
+	EXYNOS8895_PIN_BANK_EINTG(4, 0x080, "gpd3", 0x10),
+	EXYNOS8895_PIN_BANK_EINTG(2, 0x0A0, "gpb1", 0x14),
+	EXYNOS8895_PIN_BANK_EINTG(2, 0x0C0, "gpb2", 0x18),
+	EXYNOS8895_PIN_BANK_EINTG(3, 0x0E0, "gpb0", 0x1c),
+	EXYNOS8895_PIN_BANK_EINTG(5, 0x100, "gpc0", 0x20),
+	EXYNOS8895_PIN_BANK_EINTG(5, 0x120, "gpc1", 0x24),
+	EXYNOS8895_PIN_BANK_EINTG(6, 0x140, "gpc2", 0x28),
+	EXYNOS8895_PIN_BANK_EINTG(8, 0x160, "gpc3", 0x2c),
+	EXYNOS8895_PIN_BANK_EINTG(4, 0x180, "gpk0", 0x30),
+	EXYNOS8895_PIN_BANK_EINTG(7, 0x1A0, "etc1", 0x34),
+};
+
+/* pin banks of exynos8890 pin-controller 9 (PERIC1) */
+static const struct samsung_pin_bank_data exynos8890_pin_banks9[] __initconst = {
+	/* Must start with EINTG banks, ordered by EINT group number. */
+	EXYNOS8895_PIN_BANK_EINTG(8, 0x000, "gpe0", 0x00),
+	EXYNOS8895_PIN_BANK_EINTG(8, 0x020, "gpe5", 0x04),
+	EXYNOS8895_PIN_BANK_EINTG(8, 0x040, "gpe6", 0x08),
+	EXYNOS8895_PIN_BANK_EINTG(8, 0x060, "gpj1", 0x0c),
+	EXYNOS8895_PIN_BANK_EINTG(2, 0x080, "gpj2", 0x10),
+	EXYNOS8895_PIN_BANK_EINTG(8, 0x0A0, "gpe2", 0x14),
+	EXYNOS8895_PIN_BANK_EINTG(8, 0x0C0, "gpe3", 0x18),
+	EXYNOS8895_PIN_BANK_EINTG(8, 0x0E0, "gpe4", 0x1c),
+	EXYNOS8895_PIN_BANK_EINTG(8, 0x100, "gpe1", 0x20),
+	EXYNOS8895_PIN_BANK_EINTG(4, 0x120, "gpe7", 0x24),
+	EXYNOS8895_PIN_BANK_EINTG(3, 0x140, "gpg0", 0x28),
+};
+
+/* pin banks of exynos8890 pin-controller 10 (TOUCH) */
+static const struct samsung_pin_bank_data exynos8890_pin_banks10[] __initconst = {
+	/* Must start with EINTG banks, ordered by EINT group number. */
+	EXYNOS8895_PIN_BANK_EINTG(3, 0x000, "gpf1", 0x00),
+};
+
+static const struct samsung_pin_ctrl exynos8890_pin_ctrl[] __initconst = {
+	{
+		/* pin-controller instance 0 Alive data */
+		.pin_banks	= exynos8890_pin_banks0,
+		.nr_banks	= ARRAY_SIZE(exynos8890_pin_banks0),
+		.eint_wkup_init = exynos_eint_wkup_init,
+	}, {
+		/* pin-controller instance 1 AUD data */
+		.pin_banks	= exynos8890_pin_banks1,
+		.nr_banks	= ARRAY_SIZE(exynos8890_pin_banks1),
+		.eint_gpio_init = exynos_eint_gpio_init,
+	}, {
+		/* pin-controller instance 2 CCORE data */
+		.pin_banks	= exynos8890_pin_banks2,
+		.nr_banks	= ARRAY_SIZE(exynos8890_pin_banks2),
+		.eint_gpio_init = exynos_eint_gpio_init,
+	}, {
+		/* pin-controller instance 3 ESE data */
+		.pin_banks	= exynos8890_pin_banks3,
+		.nr_banks	= ARRAY_SIZE(exynos8890_pin_banks3),
+		.eint_gpio_init = exynos_eint_gpio_init,
+	}, {
+		/* pin-controller instance 4 FP data */
+		.pin_banks	= exynos8890_pin_banks4,
+		.nr_banks	= ARRAY_SIZE(exynos8890_pin_banks4),
+		.eint_gpio_init = exynos_eint_gpio_init,
+	}, {
+		/* pin-controller instance 5 FSYS0 data */
+		.pin_banks	= exynos8890_pin_banks5,
+		.nr_banks	= ARRAY_SIZE(exynos8890_pin_banks5),
+		.eint_gpio_init = exynos_eint_gpio_init,
+	}, {
+		/* pin-controller instance 6 FSYS1 data */
+		.pin_banks	= exynos8890_pin_banks6,
+		.nr_banks	= ARRAY_SIZE(exynos8890_pin_banks6),
+		.eint_gpio_init = exynos_eint_gpio_init,
+	}, {
+		/* pin-controller instance 7 NFC data */
+		.pin_banks	= exynos8890_pin_banks7,
+		.nr_banks	= ARRAY_SIZE(exynos8890_pin_banks7),
+		.eint_gpio_init = exynos_eint_gpio_init,
+	}, {
+		/* pin-controller instance 8 PERIC0 data */
+		.pin_banks	= exynos8890_pin_banks8,
+		.nr_banks	= ARRAY_SIZE(exynos8890_pin_banks8),
+		.eint_gpio_init = exynos_eint_gpio_init,
+	}, {
+		/* pin-controller instance 9 PERIC1 data */
+		.pin_banks	= exynos8890_pin_banks9,
+		.nr_banks	= ARRAY_SIZE(exynos8890_pin_banks9),
+		.eint_gpio_init = exynos_eint_gpio_init,
+	}, {
+		/* pin-controller instance 10 TOUCH data */
+		.pin_banks	= exynos8890_pin_banks10,
+		.nr_banks	= ARRAY_SIZE(exynos8890_pin_banks10),
+		.eint_gpio_init = exynos_eint_gpio_init,
+	},
+};
+
+const struct samsung_pinctrl_of_match_data exynos8890_of_data __initconst = {
+	.ctrl		= exynos8890_pin_ctrl,
+	.num_ctrl	= ARRAY_SIZE(exynos8890_pin_ctrl),
+};
+
 /* pin banks of exynos8895 pin-controller 0 (ALIVE) */
 static const struct samsung_pin_bank_data exynos8895_pin_banks0[] __initconst = {
 	EXYNOS_PIN_BANK_EINTW(8, 0x020, "gpa0", 0x00),
diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.c b/drivers/pinctrl/samsung/pinctrl-samsung.c
index 24745e1d7..f58b7b10f 100644
--- a/drivers/pinctrl/samsung/pinctrl-samsung.c
+++ b/drivers/pinctrl/samsung/pinctrl-samsung.c
@@ -1496,6 +1496,8 @@ static const struct of_device_id samsung_pinctrl_dt_match[] = {
 		.data = &exynos7885_of_data },
 	{ .compatible = "samsung,exynos850-pinctrl",
 		.data = &exynos850_of_data },
+	{ .compatible = "samsung,exynos8890-pinctrl",
+		.data = &exynos8890_of_data },
 	{ .compatible = "samsung,exynos8895-pinctrl",
 		.data = &exynos8895_of_data },
 	{ .compatible = "samsung,exynos9810-pinctrl",
diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.h b/drivers/pinctrl/samsung/pinctrl-samsung.h
index 1cabcbe14..4236d7ad8 100644
--- a/drivers/pinctrl/samsung/pinctrl-samsung.h
+++ b/drivers/pinctrl/samsung/pinctrl-samsung.h
@@ -394,6 +394,7 @@ extern const struct samsung_pinctrl_of_match_data exynos7_of_data;
 extern const struct samsung_pinctrl_of_match_data exynos7870_of_data;
 extern const struct samsung_pinctrl_of_match_data exynos7885_of_data;
 extern const struct samsung_pinctrl_of_match_data exynos850_of_data;
+extern const struct samsung_pinctrl_of_match_data exynos8890_of_data;
 extern const struct samsung_pinctrl_of_match_data exynos8895_of_data;
 extern const struct samsung_pinctrl_of_match_data exynos9810_of_data;
 extern const struct samsung_pinctrl_of_match_data exynos990_of_data;
-- 
2.43.0


