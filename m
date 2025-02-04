Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92E7FC02193
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Feb 2025 17:34:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0PYzXjvsquXcuMSC+z/lM7F/lFFrKruUQntDKpcfZBw=; b=UxG6zR3zkUomKxsH/hyYnPfOeO
	jH7mN3fonTfnnvOkaa79tAlzG1Mbw7gaLKnLko1+wacJbL+stWxwOLvm3irBdGaZLgnrg14o09Epx
	FZPiRhjVBLPAhEj0Gw03+/asRWazPSSuWs4T9lLSvjP8gBWOvfw4DYC30/cIo2iVzpP8a7dPPJD+d
	47QBkcVNNX3Wi1p9LKI9s7y3Ue3q6clW2+gW2/fU8H6IKNXTXWTkHD1XHVek7pHC1WKPE9cl74x2J
	3+IuI4gi7FuUcLPCZaA9KYH4ezlBdz8toluIOx2lJwt5Ywxd+Dsvihtpo/ZOSgLZKbYIrsRoJc/Ph
	oby2Hvhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfMog-000000016eD-19r9;
	Tue, 04 Feb 2025 17:34:30 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfMjV-000000015ua-1Zcr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Feb 2025 17:29:10 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-5d982de9547so11338646a12.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Feb 2025 09:29:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738690147; x=1739294947; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0PYzXjvsquXcuMSC+z/lM7F/lFFrKruUQntDKpcfZBw=;
        b=DYQcm12nsgVgCLcPgKneVQ0CIntyTkGMuko1iaKe/WvR64drrcg7s2HZ6FfFZfiQI9
         X1UoYsJeklEmzthttDHyW1zzGhhwwfi0mYYjv5tTtLXF72g1hZrRnlDqBO2T0B0QdX5L
         4MZNJEIKt6dfsBf6z291WwsVvukDg5Am/Y8mf/ujA9fG3EvyH5XZDeLFQ2S1tRQLG3Pm
         MBHLEMrjFdqnsUg5ruK+Z69MjShcat24yN5R5XHnPs2Bk/2/ZTuG8OzwqI5rcWctO3y7
         iy2waehCGPplwKxvYCAxl8iN7KXZI4DEFLbDdOkEDuB4wGMoDfDow3jkpfFTSOHfzBUM
         AlJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738690147; x=1739294947;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0PYzXjvsquXcuMSC+z/lM7F/lFFrKruUQntDKpcfZBw=;
        b=IPEMSJ4Fw/5IKsV4LoclJf0UmckJENPvgfIBBufiIgqwbvp05z6r1VFMAV5DtaXGiS
         Lta0yOlYpW9RtUg7waKKSLB+XsJBeqy7WqU4lZQEJ0tovlWHVJIVyXodeIPnf6mxss3Z
         BBCPSaTl8reE6Yo0icxS/pyh0jFgjvX1JEaLZh/8/gidB4P+/1nVBgbsb7Kg/qaK3NIM
         IVgc1yfAwBC4eoo/dEWezJnFKO8ggQqgxaxXnAtxZhmLLOUpGGPb+4+VVvIDyPQmFpnQ
         2n/z3GXjGGIp8adDjT6NOf0v3Ec8j/bVu4clwqQdfTpQPNjYyf5AQR6XC/ZsXKqew8ZF
         iguA==
X-Forwarded-Encrypted: i=1; AJvYcCXXYUx0TnTheGjNu7AJNH5e0cPeYYX1JYiNOdmRBc8LKBNNqAZsjw1UZaMdBX+jR88Afge1bawvJBEw/E+K42Ib@lists.infradead.org
X-Gm-Message-State: AOJu0Ywv4ieacqVrDyXKggFfD1HXuB9cmVPaRF7SvumyYdvdqTDox7ql
	BNewBeEnHUeFbfhuEyy8YL129itszb4PiEhjZz0aeLR88ndi1JF0
X-Gm-Gg: ASbGnctXdbD36ZkPvaXpv6ltvLlnXoV2E8hbpW3oPmeBorlHNn1bLkcMqcfzRk3j/VF
	/94k3UEaaaGWoro/+MQAj7Vz+lQ1W1ZNIuGwpIKwz9F/TgFmlxvXZT3m57oBHbtT2dIdG7jHBWQ
	0CMO/Oh7I+xmWiYB7eIRMKn1qhtpWlogvyTwrFEhLwqSCIJcqx7pvfnPhHTt1hdQ3bPwq0L+nqH
	7LDvUl/n3VUpyxYJ21j1Md99O83AdSt58nDpa9ILfJzj6GFcEOVNDqjBMLrNgMDa8f1G8bN2svh
	m0fsyxQhcxMKM0h8snvSx14JaKpzYbVsMdVo/qQMjKPK+SJ2cn1tLcI/3ARZLNzp1io=
X-Google-Smtp-Source: AGHT+IGKE1UpcPEwktj0pXPn+Jx+dBmAbbftJr17dD9s3ZCquQy0mlrfmNUjz/1zZKoEyVZO7n5A4A==
X-Received: by 2002:a05:6402:388c:b0:5dc:90e7:d43 with SMTP id 4fb4d7f45d1cf-5dc90e7101amr15411085a12.26.1738690147137;
        Tue, 04 Feb 2025 09:29:07 -0800 (PST)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dcd3156ec7sm664981a12.67.2025.02.04.09.29.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 09:29:06 -0800 (PST)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Sam Protsenko <semen.protsenko@linaro.org>,
	Peter Griffin <peter.griffin@linaro.org>
Cc: devicetree@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 3/4] soc: samsung: usi: implement support for USIv1 and exynos8895
Date: Tue,  4 Feb 2025 19:28:02 +0200
Message-ID: <20250204172803.3425496-4-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250204172803.3425496-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250204172803.3425496-1-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_092909_415908_2D09831D 
X-CRM114-Status: GOOD (  22.58  )
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
any setup before the given protocol becomes accessible apart from
enabling the APB clock and the protocol operating clock.

Modify the existing driver in order to allow USIv1 instances in
Exynos8895 to probe and set their protocol. While we're at it,
make use of the new mode constants in place of the old ones.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 drivers/soc/samsung/exynos-usi.c | 71 ++++++++++++++++++++++++++------
 1 file changed, 58 insertions(+), 13 deletions(-)

diff --git a/drivers/soc/samsung/exynos-usi.c b/drivers/soc/samsung/exynos-usi.c
index 85329d4e8..773038770 100644
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
+	USI_VER1 = 0,
+	USI_VER2,
 };
 
 struct exynos_usi_variant {
@@ -66,19 +79,39 @@ struct exynos_usi_mode {
 	unsigned int val;		/* mode register value */
 };
 
-static const struct exynos_usi_mode exynos_usi_modes[] = {
-	[USI_V2_NONE] =	{ .name = "none", .val = USI_V2_SW_CONF_NONE },
-	[USI_V2_UART] =	{ .name = "uart", .val = USI_V2_SW_CONF_UART },
-	[USI_V2_SPI] =	{ .name = "spi",  .val = USI_V2_SW_CONF_SPI },
-	[USI_V2_I2C] =	{ .name = "i2c",  .val = USI_V2_SW_CONF_I2C },
+#define USI_MODES_MAX (USI_MODE_UART_I2C1 + 1)
+static const struct exynos_usi_mode exynos_usi_modes[][USI_MODES_MAX] = {
+	[USI_VER1] = {
+		[USI_MODE_NONE] =	{ .name = "none", .val = USI_V1_SW_CONF_NONE },
+		[USI_MODE_UART] =	{ .name = "uart", .val = USI_V1_SW_CONF_UART },
+		[USI_MODE_SPI] =	{ .name = "spi",  .val = USI_V1_SW_CONF_SPI },
+		[USI_MODE_I2C] =	{ .name = "i2c",  .val = USI_V1_SW_CONF_I2C0 },
+		[USI_MODE_I2C1] =	{ .name = "i2c1", .val = USI_V1_SW_CONF_I2C1 },
+		[USI_MODE_I2C0_1] =	{ .name = "i2c0_1", .val = USI_V1_SW_CONF_I2C0_1 },
+		[USI_MODE_UART_I2C1] =	{ .name = "uart_i2c1", .val = USI_V1_SW_CONF_UART_I2C1 },
+	}, [USI_VER2] = {
+		[USI_MODE_NONE] =	{ .name = "none", .val = USI_V2_SW_CONF_NONE },
+		[USI_MODE_UART] =	{ .name = "uart", .val = USI_V2_SW_CONF_UART },
+		[USI_MODE_SPI] =	{ .name = "spi",  .val = USI_V2_SW_CONF_SPI },
+		[USI_MODE_I2C] =	{ .name = "i2c",  .val = USI_V2_SW_CONF_I2C },
+	},
 };
 
 static const char * const exynos850_usi_clk_names[] = { "pclk", "ipclk" };
 static const struct exynos_usi_variant exynos850_usi_data = {
 	.ver		= USI_VER2,
 	.sw_conf_mask	= USI_V2_SW_CONF_MASK,
-	.min_mode	= USI_V2_NONE,
-	.max_mode	= USI_V2_I2C,
+	.min_mode	= USI_MODE_NONE,
+	.max_mode	= USI_MODE_I2C,
+	.num_clks	= ARRAY_SIZE(exynos850_usi_clk_names),
+	.clk_names	= exynos850_usi_clk_names,
+};
+
+static const struct exynos_usi_variant exynos8895_usi_data = {
+	.ver		= USI_VER1,
+	.sw_conf_mask	= USI_V1_SW_CONF_MASK,
+	.min_mode	= USI_MODE_NONE,
+	.max_mode	= USI_MODE_UART_I2C1,
 	.num_clks	= ARRAY_SIZE(exynos850_usi_clk_names),
 	.clk_names	= exynos850_usi_clk_names,
 };
@@ -87,6 +120,9 @@ static const struct of_device_id exynos_usi_dt_match[] = {
 	{
 		.compatible = "samsung,exynos850-usi",
 		.data = &exynos850_usi_data,
+	}, {
+		.compatible = "samsung,exynos8895-usi",
+		.data = &exynos8895_usi_data,
 	},
 	{ } /* sentinel */
 };
@@ -109,14 +145,15 @@ static int exynos_usi_set_sw_conf(struct exynos_usi *usi, size_t mode)
 	if (mode < usi->data->min_mode || mode > usi->data->max_mode)
 		return -EINVAL;
 
-	val = exynos_usi_modes[mode].val;
+	val = exynos_usi_modes[usi->data->ver][mode].val;
 	ret = regmap_update_bits(usi->sysreg, usi->sw_conf,
 				 usi->data->sw_conf_mask, val);
 	if (ret)
 		return ret;
 
 	usi->mode = mode;
-	dev_dbg(usi->dev, "protocol: %s\n", exynos_usi_modes[usi->mode].name);
+	dev_dbg(usi->dev, "protocol: %s\n",
+		exynos_usi_modes[usi->data->ver][usi->mode].name);
 
 	return 0;
 }
@@ -168,10 +205,13 @@ static int exynos_usi_configure(struct exynos_usi *usi)
 	if (ret)
 		return ret;
 
-	if (usi->data->ver == USI_VER2)
-		return exynos_usi_enable(usi);
+	if (usi->data->ver == USI_VER1)
+		ret = clk_bulk_prepare_enable(usi->data->num_clks,
+					      usi->clks);
+	else if (usi->data->ver == USI_VER2)
+		ret = exynos_usi_enable(usi);
 
-	return 0;
+	return ret;
 }
 
 static void exynos_usi_unconfigure(void *data)
@@ -180,6 +220,11 @@ static void exynos_usi_unconfigure(void *data)
 	u32 val;
 	int ret;
 
+	if (usi->data->ver == USI_VER1) {
+		clk_bulk_disable_unprepare(usi->data->num_clks, usi->clks);
+		return;
+	}
+
 	ret = clk_bulk_prepare_enable(usi->data->num_clks, usi->clks);
 	if (ret)
 		return;
-- 
2.43.0


