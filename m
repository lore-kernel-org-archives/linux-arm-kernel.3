Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 553BEC021A0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Feb 2025 11:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DpEidbjY1/GWQgLUniwezom/J83sdftbQdc1o2m+qsw=; b=3mA3GoFSwVmI4uFhbsEwjS5Y9C
	VM4aQGPygJs4QOkAborXf7x3iL7Rc1Hxvt22d8c4AYXTVzWxq69xy4NxKR73Psnnnlq2ntPGHOYMj
	e2qDSR9qN4uf7i3GItg8d9rUQV6R3JSdH3YSxfjcemmwAvAhd6zL1KYrjVa+f9OTE/krKWlkIhGp1
	yNxznRV5LpVCTSb2HGT+b7O8eWnbOU4u2th66jj+vuKMSTh9uiprcdZB0c7jfswEDbymUJbLZNWMk
	AHgnO0I5V38uTAfoU0zfR8eyPkLKK4PgLDlthfeUsUtb8ntDBBsHU925IVBpdBfXSWQLAf5m4pkiy
	7n4KfZSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjGaB-0000000HZoP-20al;
	Sat, 15 Feb 2025 11:43:39 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjGQ2-0000000HYa4-1pKy
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Feb 2025 11:33:11 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4396e9ee133so2619995e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 15 Feb 2025 03:33:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739619189; x=1740223989; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DpEidbjY1/GWQgLUniwezom/J83sdftbQdc1o2m+qsw=;
        b=V02xQ1gYtJAh+38q9aDm/wghhUsT3Yjviv+h8Tycnxl0dDOzpcsFilbDgwtvyV1buO
         DSLX1Sfqox2dwWyOgDByLDYFV8zuDvJmOd5C7oqCsXErVcZd/EMBUdZhOTLYWuuw7Gvd
         3NHAJMSGB8NP87DHlr+B5jYVw5a8KQuQd/U2SnmyK/n4Pj8UEFEx+IobZb1+OXAEIe2M
         Dxtn//6IhnfLFciMam9bJm/OsNf0kcRdtAc4kOEKNRPApU8kmQlxbeSmHbUgjx26QBYl
         2lQajkA502gKF3tjcY9kMTiIzfLycNnXBDaECiWc38IGBAzWvGfPAG/GdsT4SGGb4w3m
         OVIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739619189; x=1740223989;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DpEidbjY1/GWQgLUniwezom/J83sdftbQdc1o2m+qsw=;
        b=oHBiLE3nI4Pc99JMsKJVnbWaK1koHWsdg7Ktvq9DcIuSV1cUuWQBzAP1Pl0M6a4iek
         v8NjZlytaUH+3deyNE7B0pZwsRiKd1yHM6v/TYSKOm0AxuzeFWNpb96lJ8HTm94ixAuG
         dpYAcPKw1dy/cq7AFR2gzvQW2OXaPla5YBahnuQAdT3kC6na5Asm8yFgtzDeSHgY+LrA
         MLViBydy5kln0tp+8LOC0riiLKsUMBOKxwnY4Rm1ApwTcspn9YIffqDw+Mx78j8Uyui9
         4CwpPjA0+bi2PTwa0zVD+CqAXQnffr4CDixQ6/n7VXqqpAMETsG1sZphiupKAzvbPOR3
         +4GQ==
X-Gm-Message-State: AOJu0Yzkwkw3zIL0mVY7C0CqdX9G9kYcylMzp5z4jrTGNeZRJts9K3hD
	ToDjRxHye9E8PzciYbZQobnUJIbe/hXOMlYPygbf5qwhbePEvEhV
X-Gm-Gg: ASbGncuFk+gsF8lklEQyWL+i4SkMyKnz4xNEcpYGDInQbI7SQyz/man3rECI7kKmStN
	s9QyEdZ7140v6/VdD2tqPjfS/VCz+SDoZdb4x+JtcEgPFNqVh4HWLanzkZUOifL6icBv/AYJkBS
	nvQ77QD2j5M3BOrDwnXXbs1AMV/79SI/dRoLOrjyA/2K3/jE/ElhUs8erJyBp1JGczZlwpyFuLx
	LsKyVQ/OSIsI8Ua2QdzJN1fCIG9EyCjG5LhEL9QZIWiXvGIyZvkEwJTpSFDvgkGS52R0K2YjADp
	3RrHRVnYOBVkOImzFOcNgmwQz6QTLsfK3wGUxn2TI1Yzqrzyj4FAjToBkqSXwdwHtNk=
X-Google-Smtp-Source: AGHT+IHyCPSEBmQlx/qhu1ncVuarnzN6MoZNJ/ZDMmDp1+v3FMsG5gLX645v3LFJP5PZT4Gw8eYXbA==
X-Received: by 2002:a05:600c:2319:b0:438:9280:61d5 with SMTP id 5b1f17b1804b1-43960bcb171mr115812385e9.5.1739619188837;
        Sat, 15 Feb 2025 03:33:08 -0800 (PST)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f259d5e9esm7147538f8f.61.2025.02.15.03.33.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Feb 2025 03:33:08 -0800 (PST)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 3/3] pinctrl: samsung: add exynos2200 SoC pinctrl configuration
Date: Sat, 15 Feb 2025 13:32:48 +0200
Message-ID: <20250215113248.159386-4-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250215113248.159386-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250215113248.159386-1-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250215_033310_474264_F021CD96 
X-CRM114-Status: GOOD (  14.73  )
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

Add support for the pin-controller found on the Exynos2200 SoC
used in Samsung Galaxy S22, S22 Plus and S22 Ultra phones.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 .../pinctrl/samsung/pinctrl-exynos-arm64.c    | 168 ++++++++++++++++++
 drivers/pinctrl/samsung/pinctrl-samsung.c     |   2 +
 drivers/pinctrl/samsung/pinctrl-samsung.h     |   1 +
 3 files changed, 171 insertions(+)

diff --git a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
index 3ea7106ce..0e310c095 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
+++ b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
@@ -70,6 +70,174 @@ static const struct samsung_pin_bank_type exynos8895_bank_type_off  = {
 /* Pad retention control code for accessing PMU regmap */
 static atomic_t exynos_shared_retention_refcnt;
 
+/* pin banks of exynos2200 pin-controller - ALIVE */
+static const struct samsung_pin_bank_data exynos2200_pin_banks0[] __initconst = {
+	EXYNOS850_PIN_BANK_EINTW(8, 0x0, "gpa0", 0x00),
+	EXYNOS850_PIN_BANK_EINTW(8, 0x20, "gpa1", 0x04),
+	EXYNOS850_PIN_BANK_EINTW(8, 0x40, "gpa2", 0x08),
+	EXYNOS850_PIN_BANK_EINTW(8, 0x60, "gpa3", 0x0c),
+	EXYNOS850_PIN_BANK_EINTW(2, 0x80, "gpa4", 0x10),
+	EXYNOS_PIN_BANK_EINTN(4, 0xa0, "gpq0"),
+	EXYNOS_PIN_BANK_EINTN(2, 0xc0, "gpq1"),
+	EXYNOS_PIN_BANK_EINTN(2, 0xe0, "gpq2"),
+};
+
+/* pin banks of exynos2200 pin-controller - CMGP */
+static const struct samsung_pin_bank_data exynos2200_pin_banks1[] __initconst = {
+	EXYNOS850_PIN_BANK_EINTW(2, 0x0, "gpm0", 0x00),
+	EXYNOS850_PIN_BANK_EINTW(2, 0x20, "gpm1", 0x04),
+	EXYNOS850_PIN_BANK_EINTW(2, 0x40, "gpm2", 0x08),
+	EXYNOS850_PIN_BANK_EINTW(2, 0x60, "gpm3", 0x0c),
+	EXYNOS850_PIN_BANK_EINTW(2, 0x80, "gpm4", 0x10),
+	EXYNOS850_PIN_BANK_EINTW(2, 0xa0, "gpm5", 0x14),
+	EXYNOS850_PIN_BANK_EINTW(2, 0xc0, "gpm6", 0x18),
+	EXYNOS850_PIN_BANK_EINTW(2, 0xe0, "gpm7", 0x1c),
+	EXYNOS850_PIN_BANK_EINTW(2, 0x100, "gpm8", 0x20),
+	EXYNOS850_PIN_BANK_EINTW(2, 0x120, "gpm9", 0x24),
+	EXYNOS850_PIN_BANK_EINTW(2, 0x140, "gpm10", 0x28),
+	EXYNOS850_PIN_BANK_EINTW(2, 0x160, "gpm11", 0x2c),
+	EXYNOS850_PIN_BANK_EINTW(2, 0x180, "gpm12", 0x30),
+	EXYNOS850_PIN_BANK_EINTW(2, 0x1a0, "gpm13", 0x34),
+	EXYNOS850_PIN_BANK_EINTW(1, 0x1c0, "gpm14", 0x38),
+	EXYNOS850_PIN_BANK_EINTW(1, 0x1e0, "gpm15", 0x3c),
+	EXYNOS850_PIN_BANK_EINTW(1, 0x200, "gpm16", 0x40),
+	EXYNOS850_PIN_BANK_EINTW(1, 0x220, "gpm17", 0x44),
+	EXYNOS850_PIN_BANK_EINTW(1, 0x240, "gpm20", 0x48),
+	EXYNOS850_PIN_BANK_EINTW(1, 0x260, "gpm21", 0x4c),
+	EXYNOS850_PIN_BANK_EINTW(1, 0x280, "gpm22", 0x50),
+	EXYNOS850_PIN_BANK_EINTW(1, 0x2a0, "gpm23", 0x54),
+	EXYNOS850_PIN_BANK_EINTW(1, 0x2c0, "gpm24", 0x58),
+};
+
+/* pin banks of exynos2200 pin-controller - HSI1 */
+static const struct samsung_pin_bank_data exynos2200_pin_banks2[] __initconst = {
+	EXYNOS850_PIN_BANK_EINTG(4, 0x0, "gpf0", 0x00),
+};
+
+/* pin banks of exynos2200 pin-controller - UFS */
+static const struct samsung_pin_bank_data exynos2200_pin_banks3[] __initconst = {
+	EXYNOS850_PIN_BANK_EINTG(7, 0x0, "gpf1", 0x00),
+};
+
+/* pin banks of exynos2200 pin-controller - HSI1UFS */
+static const struct samsung_pin_bank_data exynos2200_pin_banks4[] __initconst = {
+	EXYNOS850_PIN_BANK_EINTG(2, 0x0, "gpf2", 0x00),
+};
+
+/* pin banks of exynos2200 pin-controller - PERIC0 */
+static const struct samsung_pin_bank_data exynos2200_pin_banks5[] __initconst = {
+	EXYNOS850_PIN_BANK_EINTG(4, 0x0, "gpb0",  0x00),
+	EXYNOS850_PIN_BANK_EINTG(4, 0x20, "gpb1",  0x04),
+	EXYNOS850_PIN_BANK_EINTG(4, 0x40, "gpb2",  0x08),
+	EXYNOS850_PIN_BANK_EINTG(4, 0x60, "gpb3",  0x0c),
+	EXYNOS850_PIN_BANK_EINTG(4, 0x80, "gpp4",  0x10),
+	EXYNOS850_PIN_BANK_EINTG(2, 0xa0, "gpc0",  0x14),
+	EXYNOS850_PIN_BANK_EINTG(2, 0xc0, "gpc1",  0x18),
+	EXYNOS850_PIN_BANK_EINTG(2, 0xe0, "gpc2",  0x1c),
+	EXYNOS850_PIN_BANK_EINTG(7, 0x100, "gpg1",  0x20),
+	EXYNOS850_PIN_BANK_EINTG(2, 0x120, "gpg2",  0x24),
+};
+
+/* pin banks of exynos2200 pin-controller - PERIC1 */
+static const struct samsung_pin_bank_data exynos2200_pin_banks6[] __initconst = {
+	EXYNOS850_PIN_BANK_EINTG(4, 0x0,  "gpp7",  0x00),
+	EXYNOS850_PIN_BANK_EINTG(4, 0x20, "gpp8",  0x04),
+	EXYNOS850_PIN_BANK_EINTG(4, 0x40, "gpp9",  0x08),
+	EXYNOS850_PIN_BANK_EINTG(4, 0x60, "gpp10", 0x0c),
+};
+
+/* pin banks of exynos2200 pin-controller - PERIC2 */
+static const struct samsung_pin_bank_data exynos2200_pin_banks7[] __initconst = {
+	EXYNOS850_PIN_BANK_EINTG(4, 0x0, "gpp0",  0x00),
+	EXYNOS850_PIN_BANK_EINTG(4, 0x20, "gpp1",  0x04),
+	EXYNOS850_PIN_BANK_EINTG(4, 0x40, "gpp2",  0x08),
+	EXYNOS850_PIN_BANK_EINTG(4, 0x60, "gpp3",  0x0c),
+	EXYNOS850_PIN_BANK_EINTG(4, 0x80, "gpp5",  0x10),
+	EXYNOS850_PIN_BANK_EINTG(4, 0xa0, "gpp6",  0x14),
+	EXYNOS850_PIN_BANK_EINTG(4, 0xc0, "gpp11", 0x18),
+	EXYNOS850_PIN_BANK_EINTG(2, 0xe0, "gpc3",  0x1c),
+	EXYNOS850_PIN_BANK_EINTG(2, 0x100, "gpc4",  0x20),
+	EXYNOS850_PIN_BANK_EINTG(2, 0x120, "gpc5",  0x24),
+	EXYNOS850_PIN_BANK_EINTG(2, 0x140, "gpc6",  0x28),
+	EXYNOS850_PIN_BANK_EINTG(2, 0x160, "gpc7",  0x2c),
+	EXYNOS850_PIN_BANK_EINTG(2, 0x180, "gpc8",  0x30),
+	EXYNOS850_PIN_BANK_EINTG(2, 0x1a0, "gpc9",  0x34),
+	EXYNOS850_PIN_BANK_EINTG(5, 0x1c0, "gpg0",  0x38),
+};
+
+/* pin banks of exynos2200 pin-controller - VTS */
+static const struct samsung_pin_bank_data exynos2200_pin_banks8[] __initconst = {
+	EXYNOS850_PIN_BANK_EINTG(7, 0x0, "gpv0", 0x00),
+};
+
+static const struct samsung_pin_ctrl exynos2200_pin_ctrl[] = {
+	{
+		/* pin-controller instance 0 ALIVE data */
+		.pin_banks	= exynos2200_pin_banks0,
+		.nr_banks	= ARRAY_SIZE(exynos2200_pin_banks0),
+		.eint_gpio_init = exynos_eint_gpio_init,
+		.eint_wkup_init = exynos_eint_wkup_init,
+		.suspend	= exynos_pinctrl_suspend,
+		.resume		= exynos_pinctrl_resume,
+	}, {
+		/* pin-controller instance 1 CMGP data */
+		.pin_banks	= exynos2200_pin_banks1,
+		.nr_banks	= ARRAY_SIZE(exynos2200_pin_banks1),
+		.eint_gpio_init = exynos_eint_gpio_init,
+		.eint_wkup_init = exynos_eint_wkup_init,
+		.suspend	= exynos_pinctrl_suspend,
+		.resume		= exynos_pinctrl_resume,
+	}, {
+		/* pin-controller instance 2 HSI1 data */
+		.pin_banks	= exynos2200_pin_banks2,
+		.nr_banks	= ARRAY_SIZE(exynos2200_pin_banks2),
+	}, {
+		/* pin-controller instance 3 UFS data */
+		.pin_banks	= exynos2200_pin_banks3,
+		.nr_banks	= ARRAY_SIZE(exynos2200_pin_banks3),
+		.eint_gpio_init = exynos_eint_gpio_init,
+		.suspend	= exynos_pinctrl_suspend,
+		.resume		= exynos_pinctrl_resume,
+	}, {
+		/* pin-controller instance 4 HSI1UFS data */
+		.pin_banks	= exynos2200_pin_banks4,
+		.nr_banks	= ARRAY_SIZE(exynos2200_pin_banks4),
+		.eint_gpio_init = exynos_eint_gpio_init,
+		.suspend	= exynos_pinctrl_suspend,
+		.resume		= exynos_pinctrl_resume,
+	}, {
+		/* pin-controller instance 5 PERIC0 data */
+		.pin_banks	= exynos2200_pin_banks5,
+		.nr_banks	= ARRAY_SIZE(exynos2200_pin_banks5),
+		.eint_gpio_init = exynos_eint_gpio_init,
+		.suspend	= exynos_pinctrl_suspend,
+		.resume		= exynos_pinctrl_resume,
+	}, {
+		/* pin-controller instance 6 PERIC1 data */
+		.pin_banks	= exynos2200_pin_banks6,
+		.nr_banks	= ARRAY_SIZE(exynos2200_pin_banks6),
+		.eint_gpio_init = exynos_eint_gpio_init,
+		.suspend	= exynos_pinctrl_suspend,
+		.resume		= exynos_pinctrl_resume,
+	}, {
+		/* pin-controller instance 7 PERIC2 data */
+		.pin_banks	= exynos2200_pin_banks7,
+		.nr_banks	= ARRAY_SIZE(exynos2200_pin_banks7),
+		.eint_gpio_init = exynos_eint_gpio_init,
+		.suspend	= exynos_pinctrl_suspend,
+		.resume		= exynos_pinctrl_resume,
+	}, {
+		/* pin-controller instance 8 VTS data */
+		.pin_banks	= exynos2200_pin_banks8,
+		.nr_banks	= ARRAY_SIZE(exynos2200_pin_banks8),
+	},
+};
+
+const struct samsung_pinctrl_of_match_data exynos2200_of_data __initconst = {
+	.ctrl		= exynos2200_pin_ctrl,
+	.num_ctrl	= ARRAY_SIZE(exynos2200_pin_ctrl),
+};
+
 /* pin banks of exynos5433 pin-controller - ALIVE */
 static const struct samsung_pin_bank_data exynos5433_pin_banks0[] __initconst = {
 	/* Must start with EINTG banks, ordered by EINT group number. */
diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.c b/drivers/pinctrl/samsung/pinctrl-samsung.c
index cfced7afd..04a8a23f4 100644
--- a/drivers/pinctrl/samsung/pinctrl-samsung.c
+++ b/drivers/pinctrl/samsung/pinctrl-samsung.c
@@ -1469,6 +1469,8 @@ static const struct of_device_id samsung_pinctrl_dt_match[] = {
 #ifdef CONFIG_PINCTRL_EXYNOS_ARM64
 	{ .compatible = "google,gs101-pinctrl",
 		.data = &gs101_of_data },
+	{ .compatible = "samsung,exynos2200-pinctrl",
+		.data = &exynos2200_of_data },
 	{ .compatible = "samsung,exynos5433-pinctrl",
 		.data = &exynos5433_of_data },
 	{ .compatible = "samsung,exynos7-pinctrl",
diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.h b/drivers/pinctrl/samsung/pinctrl-samsung.h
index bb0689d52..a43803027 100644
--- a/drivers/pinctrl/samsung/pinctrl-samsung.h
+++ b/drivers/pinctrl/samsung/pinctrl-samsung.h
@@ -373,6 +373,7 @@ struct samsung_pmx_func {
 };
 
 /* list of all exported SoC specific data */
+extern const struct samsung_pinctrl_of_match_data exynos2200_of_data;
 extern const struct samsung_pinctrl_of_match_data exynos3250_of_data;
 extern const struct samsung_pinctrl_of_match_data exynos4210_of_data;
 extern const struct samsung_pinctrl_of_match_data exynos4x12_of_data;
-- 
2.43.0


