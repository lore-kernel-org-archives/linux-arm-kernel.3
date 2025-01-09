Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EEC2E77197
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 09:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZCpmmMifUuuJ9+tjCbBNOmX8W+9L1QauRjSWCr7/+E4=; b=zQi4CL1JVrT76qEkSLR7FsLI5l
	2+4SOKK4r4vW7mi3xmfQM6TMVp7GUO+HSvLNvyVGbUkCJLDhsiK0qbPbGo2cBnwWalXBvxZeIQAEl
	iku9V787/DV26d5cGfsFpJCpnWKWQ0N8sd2wq/IEIWnnwzf0cPbHDDvJJwDde3GV9r40wH/JwhkOu
	uAEpzqvqmRKPy2DA+lv1wRXWeQBrxseXK4nyXznCX/CVlchO2oxT0sZ0kfYuUo5wTsO5pqwyTiy72
	NlxtKGp/gA7fGl3zjSzI79LI9791UYv6zrYFp14wzWLuy/MI4ct2iSpp0K8dykSL9o5lYo27N5KQG
	Fdwrc+/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVoXG-0000000BHRr-1nd1;
	Thu, 09 Jan 2025 09:09:02 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVoSU-0000000BGJy-1plz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jan 2025 09:04:07 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4368a293339so8223435e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jan 2025 01:04:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736413445; x=1737018245; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZCpmmMifUuuJ9+tjCbBNOmX8W+9L1QauRjSWCr7/+E4=;
        b=CkgahICeYUz8i8RcZ9JRfXTrEWHF9Ag0EoQ4O4+wu7TIbyR+TV/1HR/K3uCrIth6aM
         FHF1XuowJ+M82RGAWwi01OBTUZ9XKk8FBaAesFEQ8ATO1b78Vb6yRqJWIYlPIjZBdhSs
         1HKzdbQnB9pr+EU6HE4wGS4VXVoWwwOoB3Avx+uhIFUvFccDcAOQoS0+xz82OaeOUC/b
         bwm1crHQIxs9b4pFSg8rvhrygc/LsSlEJcrst8XzowebKjzFTSh7IfWw/BOj5IJ94GQQ
         JyDDbAyXsF1BRMEAocshKZVXwCXsxWR4O//7Va9ddZLQmp1LSkw5VQeLSsmpyIkHOmBY
         uynA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736413445; x=1737018245;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZCpmmMifUuuJ9+tjCbBNOmX8W+9L1QauRjSWCr7/+E4=;
        b=HnqC+UyAtUeSe3RXdyUnIjKO7VlpLHBCzcprDr3Z2G0S3+aGmUzQzBDZEz3gtOqL31
         DOkh+jXgaydInuSgDDTB+4hGYLo+8AZKPVupHVTqnkLJX0EyS0+tPQspWZQsMusHkZyj
         y0kM6wPUYDvtCEQhNUy8j0T6Qw78bFgmYm9PLOEezwvCLKcwmGzd/FNQr2T86oVaW3Nt
         VXhn2EXW28W7yp4WSlRf0fR77w7jVkmUjjwEhXjmrIVnP0HtHlR/9XyeIurKzYqCgHrM
         A+E76wa2C4CH7pN68nHxArUMsnN8LWF43aD6Vb2eArk/UGaQ3TGZXNT3NUlppxRhe3sf
         Qtfg==
X-Forwarded-Encrypted: i=1; AJvYcCV9ZS/FkVAeLcbzCZ3CSO+42BawcbE3FLEFDU/uoitEkYxXKto98rigAypEz++Qtr+i8xcRYrNiuIQLvw+Q+8ln@lists.infradead.org
X-Gm-Message-State: AOJu0YyI9IUfHPVr/xvDpg571cFG0TfPAM+nEG/SraiTPJ9HZNwu9J23
	iB+53hJpRkz32uVD4TuoO0rPMPWrIQWukX7qnDyM7pONBuT1uGX1
X-Gm-Gg: ASbGnctYNb/LdnMMO9XNEM1S+QNfdH5zZeaN7aMI55DXp0U9+dwktFET1y6yddSlFP9
	jLrFs+0mF14qKB6H5mWS3fSkl3WKPE6CXx6wI4TunbZZlL7festj6Ndoc/DRBLzROESJ3xrC6ia
	lC7nDK1EPT0PiLA7WlZ4i7BXbTDQnP3Kq+biJ2bI0Da/pQqK/EKHn+PA+wNTuKDg5BnMeyfJr06
	ESx3FHg/QKhXolMg2P9oRhaSVPpGt6Yg1RLqk4A0sJzDZhoeRl1ZEyiWxUayfOYmET1Mw1s7TiG
	RC5ukKXf0AX9T4ut/1E=
X-Google-Smtp-Source: AGHT+IEaR7svee5aX+rCiKsRbOx8w2O2GiuW0Y3cJUpXD1c0W5ZNdo+enti2VyZXNrnvGKRyED0uZw==
X-Received: by 2002:a5d:6da2:0:b0:385:fc70:7f6 with SMTP id ffacd0b85a97d-38a872fadf3mr5135537f8f.7.1736413444389;
        Thu, 09 Jan 2025 01:04:04 -0800 (PST)
Received: from ivaylo-T580.. (62-73-104-42.ip.btc-net.bg. [62.73.104.42])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e4b80b2sm1196692f8f.80.2025.01.09.01.04.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2025 01:04:03 -0800 (PST)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Sam Protsenko <semen.protsenko@linaro.org>,
	Peter Griffin <peter.griffin@linaro.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 3/4] soc: samsung: usi: implement support for USIv1 and exynos8895
Date: Thu,  9 Jan 2025 11:03:24 +0200
Message-ID: <20250109090325.595475-4-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250109090325.595475-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250109090325.595475-1-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_010406_482550_0E4F8351 
X-CRM114-Status: GOOD (  21.45  )
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
index 4b84f481b..8a56d6040 100644
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
@@ -179,6 +219,11 @@ static void exynos_usi_unconfigure(void *data)
 	struct exynos_usi *usi = data;
 	u32 val;
 
+	if (usi->data->ver == USI_VER1) {
+		clk_bulk_disable_unprepare(usi->data->num_clks, usi->clks);
+		return;
+	}
+
 	/* Make sure that we've stopped providing the clock to USI IP */
 	val = readl(usi->regs + USI_OPTION);
 	val &= ~USI_OPTION_CLKREQ_ON;
-- 
2.43.0


