Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CB1EE77188
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jan 2025 20:44:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+SWMDb5TwBTJZaeNs4VRkHzpMH/ioBBi8zegRfy/sYU=; b=IrLwMZwCAQaPMCRzcXy/LKVj45
	oDIfA6hGvbmBfXCReRe/ZyuX3Hs4SXM0fhjtAcvdMaSbCGLGsSxFQd/jFpm4ycgqbQ0XqH512XCS5
	+Bh8LQ9rkq0xA/4OLCk9bBJu/VmCR71SOsSHrGh44ZWUEL3hY2kvUwTokPjQfs+tp/cSb9Gp4gcrT
	ElT103SG1DzsUtqlyuHMco2caSHWOkoK9F+ikRV9I+JczdJFiFLgmY3FXhiGr5LGls2gTsvXoPPeG
	GhyQvhxvA8F1EfpsOGnyX5t+LmrU+8tJgZ29nPoS6I9I7WwjDJrjixW9I85j6vKsMKKKLiPgN2r0L
	dTj6GsAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTS3Y-0000000BQ1F-3QKq;
	Thu, 02 Jan 2025 20:44:36 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTRzy-0000000BPQV-1kef
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jan 2025 20:40:55 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-aaf6b1a5f2bso530587566b.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Jan 2025 12:40:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735850452; x=1736455252; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+SWMDb5TwBTJZaeNs4VRkHzpMH/ioBBi8zegRfy/sYU=;
        b=FYT89FDtHl5RyO9/HrqKSn8qDR/3oZo4q/S4b/0iiHg0y41/2XksRqknSpKTbtIpGE
         HOh29wAqe7QO/TDS7nYP8/LXrTXTywL2/1WXfqtF5IqZKUBNbygyYYzOSSFuY1AoodGr
         sPpGC3DkyR079G+Iuc9eNTUwpuzDGXxidHVQhHCDl7rPJvo6BuWLtXuhKtTtokmPzw0a
         7c9csXbBSQCWU6AN1RJzZ0YC4HGNFDgXEgCk71CJBI+LWNtlOWxuID33VMAFbINBFc/E
         vYF1zfmpjAXmwVYKqqVE3xPZlM4QHKUG8unpS4gMRc87Eoq4OJmQZwwWbUtClPhxDUDQ
         Blfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735850452; x=1736455252;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+SWMDb5TwBTJZaeNs4VRkHzpMH/ioBBi8zegRfy/sYU=;
        b=I8tuyO7Nj/f65KyVkAFwyOR9UzClxA2kgPxQVvHjHRD/HOBqxrvgaXYDr8wpEiGcfX
         OREGlE4VSX2E+XzuFbzLqzYuhwfzK9Ye6rNuHmOFtDsShvwz4Y8M1MSwAfOGdc5cvrz+
         jW7NaD20X2vpSreg7J2L2fjTfAsghLDFOVZsWHdNOeG7ym7ZGVQYYK4Xz2GyoLn1R4cl
         M01bm+TwRMvRqnfNGB/sF6fA+EWam9lK0bVT3a9a7C+MSp4lpSwaC1wjdVXhKIf8NtvR
         bJp9IjwpfKXAhuLc04lQ8nt7KDpHHhMF13q5hyR6R2DOAfvJUD150lNk4g6PmX34hWdW
         CZ2A==
X-Forwarded-Encrypted: i=1; AJvYcCUDP2bSiLbKWIjFHZQyEHh/EwvXnMBFhh2BP8Ku9h2iUAjpnmQ8SRRplIRuqDGpoKXYFLtnrZewLLIr/fLnLucj@lists.infradead.org
X-Gm-Message-State: AOJu0YyXt1OfppkencV7AP5kqLymRHyngCE/f45BVxXQJO25kfIN+iUn
	aiUOHqc2Ceq5E+E/4+G3aSt9EQYzNVpqNvy7RZpqmkD73n2NhAzb
X-Gm-Gg: ASbGncv6QGCYQXMJ1Q+iZS+gzhR00TAln5KQTsaEPfy12ipuQmwIN7onBT5qNHSDRQ9
	MPR+XAwF9vptJmI22JVHM9HpG3gzU7C5TLoIVqP06Ak4t4MjMijwZYrshsprmjERdVYDi9hqo5L
	PHXdvs9FJa7Z03K7NA92SZSFCxoGppTQsRnPfaUEO8yB5Fi6ADVlxvQDzqs4Hgn8+I3+VpjFmKC
	kPVMTmU2HDoTlzmzDF9r4vMYD5ZSFBDZnBoO8u8iTx6SSsBYLrbUY0po55sZ6ZJ2RxJ+C8xzTDg
	ZxvasFdLBi4=
X-Google-Smtp-Source: AGHT+IG0vgfb4FgN57tXEfkHjnmpOfckgtD12j0nD5bwvPiabxtx4gUIJFAmIiVnbYZPp6OFyrGsUQ==
X-Received: by 2002:a17:907:9482:b0:aa6:8096:2049 with SMTP id a640c23a62f3a-aac3350c059mr4142824666b.13.1735850452149;
        Thu, 02 Jan 2025 12:40:52 -0800 (PST)
Received: from ivaylo-T580.. (85-118-76-61.mtel.net. [85.118.76.61])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0efe490asm1814251866b.98.2025.01.02.12.40.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jan 2025 12:40:51 -0800 (PST)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Sam Protsenko <semen.protsenko@linaro.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 3/3] soc: samsung: usi: implement support for USIv1
Date: Thu,  2 Jan 2025 22:40:15 +0200
Message-ID: <20250102204015.222653-4-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250102204015.222653-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250102204015.222653-1-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_124054_458463_1F23D257 
X-CRM114-Status: GOOD (  20.43  )
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

USIv1 IP-core is found on some ARM64 Exynos SoCs (like Exynos8895) and
provides selectable serial protocols (one of: HSI2C0, HSI2C1, HSI2C0_1,
SPI, UART, UART_HSI2C1).

USIv1, unlike USIv2, doesn't have any known register map. Underlying
protocols that it implements have no offset, like with Exynos850.
Desired protocol can be chosen via SW_CONF register from System
Register block of the same domain as USI.

In order to select a particular protocol, the protocol has to be
selected via the System Register. Unlike USIv2, there's no need for
any setup before the given protocol becomes accessible.

Modify the existing driver in order to allow USIv1 to probe and set
its protocol.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 drivers/soc/samsung/exynos-usi.c | 58 +++++++++++++++++++++++++++++---
 1 file changed, 54 insertions(+), 4 deletions(-)

diff --git a/drivers/soc/samsung/exynos-usi.c b/drivers/soc/samsung/exynos-usi.c
index 114352695..29c3770e3 100644
--- a/drivers/soc/samsung/exynos-usi.c
+++ b/drivers/soc/samsung/exynos-usi.c
@@ -16,6 +16,18 @@
 
 #include <dt-bindings/soc/samsung,exynos-usi.h>
 
+/* USIv1: System Register: SW_CONF register bits */
+#define USI_V1_SW_CONF_NONE		0x0
+#define USI_V1_SW_CONF_I2C0		0x1
+#define USI_V1_SW_CONF_I2C1		0x2
+#define USI_V1_SW_CONF_I2C0_1		0x3
+#define USI_V1_SW_CONF_SPI		0x4
+#define USI_V1_SW_CONF_UART		0x8
+#define USI_V1_SW_CONF_UART_I2C1	0xa
+#define USI_V1_SW_CONF_MASK		(USI_V1_SW_CONF_I2C0 | USI_V1_SW_CONF_I2C1 | \
+					 USI_V1_SW_CONF_I2C0_1 | USI_V1_SW_CONF_SPI | \
+					 USI_V1_SW_CONF_UART | USI_V1_SW_CONF_UART_I2C1)
+
 /* USIv2: System Register: SW_CONF register bits */
 #define USI_V2_SW_CONF_NONE	0x0
 #define USI_V2_SW_CONF_UART	BIT(0)
@@ -34,7 +46,8 @@
 #define USI_OPTION_CLKSTOP_ON	BIT(2)
 
 enum exynos_usi_ver {
-	USI_VER2 = 2,
+	USI_VER1 = 1,
+	USI_VER2,
 };
 
 struct exynos_usi_variant {
@@ -66,6 +79,16 @@ struct exynos_usi_mode {
 	unsigned int val;		/* mode register value */
 };
 
+static const struct exynos_usi_mode exynos_usi_v1_modes[] = {
+	[USI_V1_NONE]		= { .name = "none", .val = USI_V1_SW_CONF_NONE },
+	[USI_V1_I2C0]		= { .name = "i2c0", .val = USI_V1_SW_CONF_I2C0 },
+	[USI_V1_I2C1]		= { .name = "i2c1", .val = USI_V1_SW_CONF_I2C1 },
+	[USI_V1_I2C0_1]		= { .name = "i2c0_1", .val = USI_V1_SW_CONF_I2C0_1 },
+	[USI_V1_SPI]		= { .name = "spi", .val = USI_V1_SW_CONF_SPI },
+	[USI_V1_UART]		= { .name = "uart", .val = USI_V1_SW_CONF_UART },
+	[USI_V1_UART_I2C1]	= { .name = "uart_i2c1", .val = USI_V1_SW_CONF_UART_I2C1 },
+};
+
 static const struct exynos_usi_mode exynos_usi_modes[] = {
 	[USI_V2_NONE] =	{ .name = "none", .val = USI_V2_SW_CONF_NONE },
 	[USI_V2_UART] =	{ .name = "uart", .val = USI_V2_SW_CONF_UART },
@@ -83,11 +106,24 @@ static const struct exynos_usi_variant exynos850_usi_data = {
 	.clk_names	= exynos850_usi_clk_names,
 };
 
+static const struct exynos_usi_variant exynos8895_usi_data = {
+	.ver		= USI_VER1,
+	.sw_conf_mask	= USI_V1_SW_CONF_MASK,
+	.min_mode	= USI_V1_NONE,
+	.max_mode	= USI_V1_UART_I2C1,
+	.num_clks	= ARRAY_SIZE(exynos850_usi_clk_names),
+	.clk_names	= exynos850_usi_clk_names,
+};
+
 static const struct of_device_id exynos_usi_dt_match[] = {
 	{
 		.compatible = "samsung,exynos850-usi",
 		.data = &exynos850_usi_data,
 	},
+	{
+		.compatible = "samsung,exynos8895-usi",
+		.data = &exynos8895_usi_data,
+	},
 	{ } /* sentinel */
 };
 MODULE_DEVICE_TABLE(of, exynos_usi_dt_match);
@@ -105,18 +141,32 @@ static int exynos_usi_set_sw_conf(struct exynos_usi *usi, size_t mode)
 {
 	unsigned int val;
 	int ret;
+	const char *name;
 
+	usi->mode = mode;
 	if (mode < usi->data->min_mode || mode > usi->data->max_mode)
 		return -EINVAL;
 
-	val = exynos_usi_modes[mode].val;
+	switch (usi->data->ver) {
+	case USI_VER1:
+		val = exynos_usi_v1_modes[mode].val;
+		name = exynos_usi_v1_modes[usi->mode].name;
+		break;
+	case USI_VER2:
+		val = exynos_usi_modes[mode].val;
+		name = exynos_usi_modes[usi->mode].name;
+		break;
+	default:
+		return -EINVAL;
+	}
+
 	ret = regmap_update_bits(usi->sysreg, usi->sw_conf,
 				 usi->data->sw_conf_mask, val);
+
 	if (ret)
 		return ret;
 
-	usi->mode = mode;
-	dev_dbg(usi->dev, "protocol: %s\n", exynos_usi_modes[usi->mode].name);
+	dev_dbg(usi->dev, "protocol: %s\n", name);
 
 	return 0;
 }
-- 
2.43.0


