Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52F28E77188
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  4 Jan 2025 16:34:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dmwJdSWcH80KR9c9ophGs9zgU8sQ51fKGw8dpXKN/Fw=; b=TBCoYf+Z3XvdPrQG++P2tuO0Zp
	nlBaUbI+3LMr997YoZ32ObSivdLbdg+fIeyTdzjblv4CU9XRArwhjAqdIuMyvr7IusJKBDyKCFRqY
	/ZcuX11yjpVwSSnu/o5UbrmLVDc4DVp01NEfHfM2iOLIcp0N/VmC/Zc+nQiJef0jnswvruvW+QIPB
	4GFS1K12VVJi29m6sKpj0Fg+eBM/rkl+vVI5rEybFUArkbltaYGJ1CK1tZXwvsFAw/yab2yR6HIYc
	3I3AdZThlJ1mWcVOjCgJsjeEDLkG6REGaf5g8iBRD8A5nzVnKcqCkWZgOMZ31BYYhQqRKtU6rqazB
	pia5AHww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tU76C-0000000FHIV-0Qxk;
	Sat, 04 Jan 2025 16:34:04 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tU71g-0000000FGqg-3PLI
	for linux-arm-kernel@lists.infradead.org;
	Sat, 04 Jan 2025 16:29:25 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-38632b8ae71so9235935f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 04 Jan 2025 08:29:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736008163; x=1736612963; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dmwJdSWcH80KR9c9ophGs9zgU8sQ51fKGw8dpXKN/Fw=;
        b=mO7oLyXzRf96iUCsixZkTT07sjOuFlOijDDufre/Pdb/wk796Yaw76o0ON5OGVfedz
         Q+C9cxBFrVf5F7EDUIrL2oR2BpllI6i5cgP/G7MSSmuz+ES2Vjtu+Qg0mgieStIyEb8g
         PSrOu+c6cMAhvOeNfpZb3TrFj6xOmFfkOyghGBD9qFZhEaiLK7wqWAG0xmK2SxQdEwiD
         X4E2aXhiGwZb2qx/FUKM8l4LmiwbJ4JPGOusgRVt2WCGXukUBfQM1rPpvIYf1qSZHjZR
         uk7nlchnfv0cCezXeGr0yn7YeTOzRwslpFRRU/lHrFE3OGANwSpQZxMIo3QhWkA4Z0EV
         1pow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736008163; x=1736612963;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dmwJdSWcH80KR9c9ophGs9zgU8sQ51fKGw8dpXKN/Fw=;
        b=RsxuTGPgabZKthaQsRygSNGrsvgH/AlwfMO7aIjEcMncl9HjxCcPf5riSCL0OINxlR
         3DR2/pf69GqbboTky3YOtAKJb6+36vM8azACCbADSsgCuCKqEiDPnFoSescBa6MADQJw
         GZIQJQImpqer+06nxAe54cE5fGZ1a036IlL2n8p2DwZLnSrX0Y/OfiX5wZQkWG8EdxLd
         aN2bzhYK8ULfoLwaC9WN0trzIKM0+W59lQXetM/Ij4idylfnTvj92eF9AqvjA6uATuO2
         rd1tZclDOx6hhR600bX32sm8ZEmNOCwN6suzU9acQIJNrkrnpfM/fTI0c6EC8KBo1krv
         ejzg==
X-Forwarded-Encrypted: i=1; AJvYcCXKC4yri5VzFj3bAGt0b+vmENGlYjoHTV/PLM86M8a2prIuetpQIl2Orr8wUI73wlVwMYWMnHb60OaaArDyze8J@lists.infradead.org
X-Gm-Message-State: AOJu0YwJr7Rq3JI6oTq0TTLObkNwwdJh0pUt2jg6FNIA3zJCeLPdiE8O
	1tcm1oLquDa+uK9fqtTm7aYwY9G/RnioGtgN5aMjORJVljOFtw01
X-Gm-Gg: ASbGncvi7WqI8T98NoXhx/0BaCmUu0iEjwWg+itdApnNtcS2ZDtKwZl7pdSEfzrs2In
	z9n7YSGhlyAWYHGyBlKR6Gq8BIgEkP54rbgdJrPnAQLFxy67X+0B9Y+8wEl6YHigIIo28chfD7d
	M906vqD+ObIpV78RSggGk5RGMVD0vq5SRP7QGaCp/CcWrZ/58UW3BmvoMn58113wigDtO2CTEte
	T1VpvwaN6dZetiNWCxJPzudSf85eeIf+oYIGw0lCoZsK/sU90U1izEiUwY7/72YX4WjxXE=
X-Google-Smtp-Source: AGHT+IF04mnEX9YaKH4594VC9VtYs+3GhiR+7PJ1S6ap8REf6mYZMEBFBnoifIGMwao8P0+yM/FY2w==
X-Received: by 2002:a5d:5f51:0:b0:385:dedb:a12f with SMTP id ffacd0b85a97d-38a221e27a4mr43531508f8f.6.1736008162851;
        Sat, 04 Jan 2025 08:29:22 -0800 (PST)
Received: from ivaylo-T580.. ([94.131.202.183])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4366127c4fcsm522807895e9.29.2025.01.04.08.29.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jan 2025 08:29:22 -0800 (PST)
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
Subject: [PATCH v2 3/3] soc: samsung: usi: implement support for USIv1
Date: Sat,  4 Jan 2025 18:29:15 +0200
Message-ID: <20250104162915.332005-4-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250104162915.332005-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250104162915.332005-1-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250104_082924_849390_397D9C2F 
X-CRM114-Status: GOOD (  19.29  )
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

Modify the existing driver in order to allow USIv1 to probe and set
its protocol.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 drivers/soc/samsung/exynos-usi.c | 42 +++++++++++++++++++++++++++++---
 1 file changed, 39 insertions(+), 3 deletions(-)

diff --git a/drivers/soc/samsung/exynos-usi.c b/drivers/soc/samsung/exynos-usi.c
index 114352695..e57d2c274 100644
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
@@ -71,6 +84,13 @@ static const struct exynos_usi_mode exynos_usi_modes[] = {
 	[USI_V2_UART] =	{ .name = "uart", .val = USI_V2_SW_CONF_UART },
 	[USI_V2_SPI] =	{ .name = "spi",  .val = USI_V2_SW_CONF_SPI },
 	[USI_V2_I2C] =	{ .name = "i2c",  .val = USI_V2_SW_CONF_I2C },
+	[USI_V1_NONE] =	{ .name = "none", .val = USI_V1_SW_CONF_NONE },
+	[USI_V1_I2C0] =	{ .name = "i2c0", .val = USI_V1_SW_CONF_I2C0 },
+	[USI_V1_I2C1] =	{ .name = "i2c1", .val = USI_V1_SW_CONF_I2C1 },
+	[USI_V1_I2C0_1] = { .name = "i2c0_1", .val = USI_V1_SW_CONF_I2C0_1 },
+	[USI_V1_SPI] =	{ .name = "spi", .val = USI_V1_SW_CONF_SPI },
+	[USI_V1_UART] =	{ .name = "uart", .val = USI_V1_SW_CONF_UART },
+	[USI_V1_UART_I2C1] = { .name = "uart_i2c1", .val = USI_V1_SW_CONF_UART_I2C1 },
 };
 
 static const char * const exynos850_usi_clk_names[] = { "pclk", "ipclk" };
@@ -83,11 +103,24 @@ static const struct exynos_usi_variant exynos850_usi_data = {
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
@@ -169,9 +202,12 @@ static int exynos_usi_configure(struct exynos_usi *usi)
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
-- 
2.43.0


