Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4495BE77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 11:51:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gqDmrb7wdqzZK6I0pwduaWYZCuiYxjV8FAOJs0XrSB4=; b=5BIaHPDOLZG35kqp7H6lSZWgd8
	cNy0n/OOBY3XWZiYMvwBc/xPz9Muni7TNl3GvQOkMUbaw7T+hVRkgi9C0mhtlwa7xyi3NjDkZljS2
	k2IQZ3LJ9DizhYP9fgGXSuQ60IMeUPWGy7cXmsiBaGyA7WomjsLwvS+WR//xvI1U6CW1VOLwHO9D4
	xnUOF1tYAwqXCyAEGWD4bIKxB1iRbCrwO6xf/Es5xBaciGL2wmTKv3ALzQefTAWctbTEKCVjoWKaN
	nUtkXmH+j+T6UTfrPWTw2jcCEfA4opiyowHd/mKPrPLgKvPaLF4yL5eSXv3b1sfbUgNJ0BQex1Z+k
	+h8PSM2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV87N-00000004dop-0pc3;
	Tue, 07 Jan 2025 11:51:29 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tV7rq-00000004a2q-0bZG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 11:35:27 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-5d84179ef26so2897194a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jan 2025 03:35:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736249725; x=1736854525; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gqDmrb7wdqzZK6I0pwduaWYZCuiYxjV8FAOJs0XrSB4=;
        b=HHh2i/FMnRBHYd7qw+wBixp94lVxKcV76EBPjzABMNlg2s64Ruie91nibZC6rohQlE
         3UJNzktoyuzMBP3G++ef1DUKw9xIyoJe+KtvyQ/FHm0eRmyDEBdacLZ5W5z+7Y8M60Fb
         03nA7urXrdfV2TVnSOQ0fmOEYyZK1Rj0ILpcWaUUMyU5mMxMABJO/LUdG81jHbC1IZpg
         X/l1ha8VBGg8gkELyL4XSoRia8fdUehk5HtxhoAZFf6fyCWarrRAADoqiwk3Xx0kV6YV
         erul9wP48e9x5OEvGfXu2wnkfHNl44rK9T8h2TYfUZ2b5wb1EmW9gAFdqP2VVKhJoFvh
         VGnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736249725; x=1736854525;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gqDmrb7wdqzZK6I0pwduaWYZCuiYxjV8FAOJs0XrSB4=;
        b=MnNuY7t150Px8VmG8eS65CvGDLCRJnU0SwfQ0W4nZgdPI/0sA1pAJjv2QR+wPOz+u7
         poFht1SbSUYq0bE5w4MVLH398YX78DjGcXCmvxaOz2S2utJJs4cxsIu/bwODkZmcL3EK
         1HySmx5o5nv0FXoMPmHAUKAXBjxiBXyzwxV5H/TxKd9CbRBiNTGtV9G027JKqZs4YVl9
         i7kpflCHmUX1daEHNRUMbkDxmPLVIYxElusNdccL7jFimliK7Gr/QLKAIYo/hwW472G9
         NurQAvON3i85CH06dwTDvZ4PX7OKj2JJCZrEs44rqTe213EAZfzEfO4HBAnoqCAuCf6P
         z5tA==
X-Forwarded-Encrypted: i=1; AJvYcCXPoOpJob+0O1joXExG09scvPVReCySCMwTFlst4Paz1S+BfsAymgfYUJnJJpRwEvGNOYDESBcR7bp1KbEiI95A@lists.infradead.org
X-Gm-Message-State: AOJu0YzVHjNkxZXfeqHDHE0pSwGHVerg9jn/KorCpEhyFOOR0KQDbx01
	4flrVAwn7VD8F7jO5YzXpnnQYMD+RE8xBjNEe9IMKPy7hz7GP0p7
X-Gm-Gg: ASbGncuWDE52489+TFORwEkvEB7Rj1X4bbPwXIMSAXTu49V6FXqH9RusPInq8+Yv876
	RSsV0IatEtvP0oAMRTIji7mFLYEx4/uAFaijQKwRFe+GYpJFwWr2GR/uZYZNi/f/CNjXFc93DZU
	gL4yEyOIIx4KJaVksDDm5HHMmmoNqwFDswuJ4Me5QHCw9HSrTXx+ZEMjMZ1YyktOOsfmgM7xtyR
	/j+byn1VPYt99fl2Hb1Ptexx4RSmkVBZx7iDmg42usz5kgWY8ajXUssi4GLg3t4A7+PCdBxWppT
	ah2bU3dxduJpDh2Z6Q0=
X-Google-Smtp-Source: AGHT+IHrIOLxERc8tVUVtsdAXxpA9NaC14eGzQzXpbh6TJ88dSeqElmNGQhgVuxRdUwM8UEkZybv9w==
X-Received: by 2002:a05:6402:50d2:b0:5d3:d917:dd90 with SMTP id 4fb4d7f45d1cf-5d81dd642e4mr56018413a12.6.1736249724400;
        Tue, 07 Jan 2025 03:35:24 -0800 (PST)
Received: from ivaylo-T580.. (62-73-104-42.ip.btc-net.bg. [62.73.104.42])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d80676f23bsm24881055a12.32.2025.01.07.03.35.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 03:35:23 -0800 (PST)
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
Subject: [PATCH v4 2/3] soc: samsung: usi: implement support for USIv1 and exynos8895
Date: Tue,  7 Jan 2025 13:35:11 +0200
Message-ID: <20250107113512.525001-3-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250107113512.525001-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250107113512.525001-1-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_033526_184317_40B96814 
X-CRM114-Status: GOOD (  26.96  )
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
make use of the new mode constants in place of the old ones
and add a removal routine.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 drivers/soc/samsung/exynos-usi.c | 108 +++++++++++++++++++++++++++----
 1 file changed, 95 insertions(+), 13 deletions(-)

diff --git a/drivers/soc/samsung/exynos-usi.c b/drivers/soc/samsung/exynos-usi.c
index 114352695..43c17b100 100644
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
@@ -88,6 +121,10 @@ static const struct of_device_id exynos_usi_dt_match[] = {
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
@@ -109,14 +146,15 @@ static int exynos_usi_set_sw_conf(struct exynos_usi *usi, size_t mode)
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
@@ -160,6 +198,30 @@ static int exynos_usi_enable(const struct exynos_usi *usi)
 	return ret;
 }
 
+/**
+ * exynos_usi_disable - Disable USI block
+ * @usi: USI driver object
+ *
+ * USI IP-core needs the reset flag cleared in order to function. This
+ * routine disables the USI block by setting the reset flag. It also disables
+ * HWACG behavior. It should be performed on removal of the device.
+ */
+static void exynos_usi_disable(const struct exynos_usi *usi)
+{
+	u32 val;
+
+	/* Make sure that we've stopped providing the clock to USI IP */
+	val = readl(usi->regs + USI_OPTION);
+	val &= ~USI_OPTION_CLKREQ_ON;
+	val |= ~USI_OPTION_CLKSTOP_ON;
+	writel(val, usi->regs + USI_OPTION);
+
+	/* Set USI block state to reset */
+	val = readl(usi->regs + USI_CON);
+	val |= USI_CON_RESET;
+	writel(val, usi->regs + USI_CON);
+}
+
 static int exynos_usi_configure(struct exynos_usi *usi)
 {
 	int ret;
@@ -169,9 +231,12 @@ static int exynos_usi_configure(struct exynos_usi *usi)
 		return ret;
 
 	if (usi->data->ver == USI_VER2)
-		return exynos_usi_enable(usi);
+		ret = exynos_usi_enable(usi);
+	else
+		ret = clk_bulk_prepare_enable(usi->data->num_clks,
+					      usi->clks);
 
-	return 0;
+	return ret;
 }
 
 static int exynos_usi_parse_dt(struct device_node *np, struct exynos_usi *usi)
@@ -253,10 +318,26 @@ static int exynos_usi_probe(struct platform_device *pdev)
 
 	ret = exynos_usi_configure(usi);
 	if (ret)
-		return ret;
+		goto fail_probe;
 
 	/* Make it possible to embed protocol nodes into USI np */
 	return of_platform_populate(np, NULL, NULL, dev);
+
+fail_probe:
+	if (usi->data->ver != USI_VER2)
+		clk_bulk_disable_unprepare(usi->data->num_clks, usi->clks);
+
+	return ret;
+}
+
+static void exynos_usi_remove(struct platform_device *pdev)
+{
+	struct exynos_usi *usi = platform_get_drvdata(pdev);
+
+	if (usi->data->ver == USI_VER2)
+		exynos_usi_disable(usi);
+	else
+		clk_bulk_disable_unprepare(usi->data->num_clks, usi->clks);
 }
 
 static int __maybe_unused exynos_usi_resume_noirq(struct device *dev)
@@ -277,6 +358,7 @@ static struct platform_driver exynos_usi_driver = {
 		.of_match_table	= exynos_usi_dt_match,
 	},
 	.probe = exynos_usi_probe,
+	.remove = exynos_usi_remove,
 };
 module_platform_driver(exynos_usi_driver);
 
-- 
2.43.0


