Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA0F8CA0FFD
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Aug 2025 11:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mt6BHImGK+4nyxlNYHkaJPBTdr1Pfx4Jy5o27YwNXXE=; b=KhVf1ziMKXSQ0ihic5Su8L5bwZ
	/JG20IO7j4ImnmusU73x1xWnsQ+vliOy3Jw8V9pbPhgodOttUtqhlWNclQVYbC+bwXX9WgEzlVsmq
	wUooZMW1i4y1zeOmTrVQbBO/jEtyyBX3Yx5Ob1OSV4pMLH2wmsBzBYHd0YlxhQbn09MqpcED0KJI8
	Nhp8rsXZdQdf8t7hNfJ0stTpsPk1AJHi8BzceBVqzremFjo/7Vaj1B/AvLAwHYpdXsBbYjFl0zilW
	e2Vu9gN7eRb4GI/dV+Hx3PvUpZ3RrZkCfPzI57q1Rj+AfluU1UoMXBEdnKUyq1O5aup2M9UAY7Pb4
	h0XtMPbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usJZi-00000007nTX-0kOk;
	Sat, 30 Aug 2025 11:16:50 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usJSx-00000007msP-0teN
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 Aug 2025 11:09:52 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-6188b5e3de6so402338a12.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 30 Aug 2025 04:09:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756552190; x=1757156990; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mt6BHImGK+4nyxlNYHkaJPBTdr1Pfx4Jy5o27YwNXXE=;
        b=AToFcaDXoTwLRchkLiKIfIng3uP34VhRswnFVrqlrwg8UdX1BXQOowjYnsr61NBiC/
         DOlrAw/oTgQexlAFpHpmdXg7Dxhs8JDQ+gavKOQ9UyT7j5PIBmFhKlvQgzH0BDLOeJeq
         h+i47Ko1nCLcnv3hKKTiLVQQYRFfmS1kLpojNTJwOskn/Vx2ORd/vk+TRScsPDX0Vvcg
         fxhKuGkxHKB7IbL8dgCQRLR68ZbgwCn6y0NipFYJirPEV6YZxU8H4slHI74nRuQEiZ7w
         qqjxX4dx5sl7oae05EZco9L0cAINYuhVEipZTQ4E9CVcnu6xfWE7/KGK4160FNghqWA0
         sY4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756552190; x=1757156990;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mt6BHImGK+4nyxlNYHkaJPBTdr1Pfx4Jy5o27YwNXXE=;
        b=AHPEDz6fMk059UqN/0SGKgVHwI3x1onu21gS1P8PBRsWY2Em2HWUanAnC5tnhOScrv
         Zq642nFSrVzLAhghPiFiJldXE/W22YlVVDo3Wu2FjJIin48KezNsVpbLT+0RVLsUAv79
         +8j/LwWthP1++KuTuHqDvG743uz1dqj6Dxr7WQY05wSzppfmszjMUiBzedkW8RPEtXWX
         JDlirEn3v8cuqRIGc7i+aq8njlKWWmi+6C4mT/cfDXFEZDCfxhNfRwf3oLVvDaW3+cwv
         F82xa3Shux81vrO2lF5VXwF489Tbuz2NbLqqB7Cjl2QBELxk14mXi9wNpcf5FZAPEoSV
         yN3w==
X-Forwarded-Encrypted: i=1; AJvYcCXffbs0/8nwHNLFYrjwFjRfNYA16oun7IAhb0J0XthzxacoKHW/J+Ow+qutjJQPjfAGsdeiRBogmAxk/ZYwkI5m@lists.infradead.org
X-Gm-Message-State: AOJu0Yw66iQJ8vND5MOOERyj5UUNYOMMA7t0F8sf3yPbTJnMThbfkXHn
	3N98gQy2CqqaMRfz4hVNh6WbR2d6djNIjEE7xRx0hQEUR4FlncXC6+kPyUgqRg2xWUE=
X-Gm-Gg: ASbGncvDL7+VrELxJbc4PSKa+fosjtd8M0pkGIoBqP3uhDtWcScT2e4XFehraIKXL1G
	rOpz+7wvOxeGIhp444m49WWJCUSq9Ff2ttotYhlANvF+/6JqnDgyRjuxH3RIxPzhGN+exAJ0WgN
	iKC6S/3mJUZ9f/eYT5Tl0epnaBCJgIkBvuYGbKVo58hqh/0JmRk3BvluYD4m7kK3IEzjKBq56FH
	FZwmlgqxCh09x+b3CkrEias7HKDWeDmX0G/HViGCE/jyM50KYtfZK7e6hB5l9PtL/j44FqlcfVg
	omkE8R+wLO4BqGxc9Mt7y7FVum8ObVZPhX3qZVsPKMw7LYSpB+ZKhZZBgIhG1cayPyF7nlHarV9
	HZh7425iB7RpRV7hkepBwKwBeAdRgGSp6nZwy+OwSi1khEDreCQ==
X-Google-Smtp-Source: AGHT+IFm3KrQiJLTnoLMRt7QTIhNFVWdnibXFvne96elYLkhnCNgt8ifCrnPRnxK3Ji1sk6Eo0cXfA==
X-Received: by 2002:a05:6402:2546:b0:61c:ba89:fc81 with SMTP id 4fb4d7f45d1cf-61cfe99a87dmr2234309a12.4.1756552189591;
        Sat, 30 Aug 2025 04:09:49 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61cfc21542asm3285666a12.18.2025.08.30.04.09.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Aug 2025 04:09:48 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sat, 30 Aug 2025 13:09:38 +0200
Subject: [PATCH 1/5] iio: adc: exynos_adc: Drop S3C2410 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250830-s3c-cleanup-adc-v1-1-de54dfb1d9ea@linaro.org>
References: <20250830-s3c-cleanup-adc-v1-0-de54dfb1d9ea@linaro.org>
In-Reply-To: <20250830-s3c-cleanup-adc-v1-0-de54dfb1d9ea@linaro.org>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4216;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=xlL9W2A8Ervk1zk4ml7XK13XijuLbMR6cMtKEKCqU4U=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBostv00r+mskd3qVXrYKZh1HyJjhQB2ZnbjdkDE
 GI5PiaBKZ6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaLLb9AAKCRDBN2bmhouD
 11sLD/9HygQMMQRy9yLtFTmoijHCENaBVNvBPHQaTRIreeQUCqjjaiB/JtgGUDjf/6iWHt3e0v6
 7GnfvISOZWlWUAHxggNlJVJrUbVUSNXIxLlwoqWoG0inQ9G8+Hm0M/4PTJFuJMvTmgOonzehjo0
 99VEr8iVewZjA/93YCSw65d9h391VcVlDsyNQk3RNiChvkp2D0qwmIgGHpm5r0pSW5SZ0c3+z/M
 buEcjSS3nrDH82fc5oVxf9udiI/XmQKuYWOyXD99UbNekSBZkVEYE9OqXD1AFutGTaqTcvwoQo8
 0JvJhc9dF8tiR8EdIiKkMoeIdqw22l/jgwLzhlDXGQsAUdpjL38qNJ1JHkrHXFxXg2EugAmx8CT
 aJki8VRB3EwCOtVX/OHlcbT9rqUsfC29p/O/++NHecMyKYxl8ygmrOHA0bE/jFJqt0G3B6uWTnn
 NJ3BypW755mW4TYgeLui8nOCAu5cRqeZoOs9r2l9p7LmVAL0i+QTaCQJrDLHFBBKg7npC/i5aBK
 +RnKyWQzRR13gMTc079rIZohXogU/kNpdlWM5itsmZ3l0SX9TUxOiToxUmyZokzqj7Zes7VjsxU
 4x5q0JF1GRV72ifLNu1qF7eqLnJwWmCkwnV34tY1+066g5SxfGvGhC8tKnVDTmI01dw2BNVNZCE
 RKP77oFSoBRPdlw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250830_040951_259758_8BAE21C0 
X-CRM114-Status: GOOD (  14.64  )
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

Samsung S3C24xx family of SoCs was removed from the Linux kernel in the
commit 61b7f8920b17 ("ARM: s3c: remove all s3c24xx support"), in January
2023.  There are no in-kernel users of its compatibles.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/iio/adc/exynos_adc.c | 75 +-------------------------------------------
 1 file changed, 1 insertion(+), 74 deletions(-)

diff --git a/drivers/iio/adc/exynos_adc.c b/drivers/iio/adc/exynos_adc.c
index 4614cf848535944a41e0ab19f35c5ca0546000c0..17fd33c6bd6d0dcf41771331ecb328e58d820ed0 100644
--- a/drivers/iio/adc/exynos_adc.c
+++ b/drivers/iio/adc/exynos_adc.c
@@ -44,9 +44,6 @@
 #define ADC_V1_MUX(x)		((x) + 0x1c)
 #define ADC_V1_CLRINTPNDNUP(x)	((x) + 0x20)
 
-/* S3C2410 ADC registers definitions */
-#define ADC_S3C2410_MUX(x)	((x) + 0x18)
-
 /* Future ADC_V2 registers definitions */
 #define ADC_V2_CON1(x)		((x) + 0x00)
 #define ADC_V2_CON2(x)		((x) + 0x04)
@@ -61,10 +58,8 @@
 #define ADC_V1_CON_PRSCLV(x)	(((x) & 0xFF) << 6)
 #define ADC_V1_CON_STANDBY	(1u << 2)
 
-/* Bit definitions for S3C2410 ADC */
+/* Bit definitions for S3C2410 / S3C6410 ADC */
 #define ADC_S3C2410_CON_SELMUX(x) (((x) & 7) << 3)
-#define ADC_S3C2410_DATX_MASK	0x3FF
-#define ADC_S3C2416_CON_RES_SEL	(1u << 3)
 
 /* touch screen always uses channel 0 */
 #define ADC_S3C2410_MUX_TS	0
@@ -307,53 +302,6 @@ static const struct exynos_adc_data exynos_adc_s5pv210_data = {
 	.start_conv	= exynos_adc_v1_start_conv,
 };
 
-static void exynos_adc_s3c2416_start_conv(struct exynos_adc *info,
-					  unsigned long addr)
-{
-	u32 con1;
-
-	/* Enable 12 bit ADC resolution */
-	con1 = readl(ADC_V1_CON(info->regs));
-	con1 |= ADC_S3C2416_CON_RES_SEL;
-	writel(con1, ADC_V1_CON(info->regs));
-
-	/* Select channel for S3C2416 */
-	writel(addr, ADC_S3C2410_MUX(info->regs));
-
-	con1 = readl(ADC_V1_CON(info->regs));
-	writel(con1 | ADC_CON_EN_START, ADC_V1_CON(info->regs));
-}
-
-static struct exynos_adc_data const exynos_adc_s3c2416_data = {
-	.num_channels	= MAX_ADC_V1_CHANNELS,
-	.mask		= ADC_DATX_MASK,	/* 12 bit ADC resolution */
-
-	.init_hw	= exynos_adc_v1_init_hw,
-	.exit_hw	= exynos_adc_v1_exit_hw,
-	.start_conv	= exynos_adc_s3c2416_start_conv,
-};
-
-static void exynos_adc_s3c2443_start_conv(struct exynos_adc *info,
-					  unsigned long addr)
-{
-	u32 con1;
-
-	/* Select channel for S3C2433 */
-	writel(addr, ADC_S3C2410_MUX(info->regs));
-
-	con1 = readl(ADC_V1_CON(info->regs));
-	writel(con1 | ADC_CON_EN_START, ADC_V1_CON(info->regs));
-}
-
-static struct exynos_adc_data const exynos_adc_s3c2443_data = {
-	.num_channels	= MAX_ADC_V1_CHANNELS,
-	.mask		= ADC_S3C2410_DATX_MASK, /* 10 bit ADC resolution */
-
-	.init_hw	= exynos_adc_v1_init_hw,
-	.exit_hw	= exynos_adc_v1_exit_hw,
-	.start_conv	= exynos_adc_s3c2443_start_conv,
-};
-
 static void exynos_adc_s3c64xx_start_conv(struct exynos_adc *info,
 					  unsigned long addr)
 {
@@ -365,15 +313,6 @@ static void exynos_adc_s3c64xx_start_conv(struct exynos_adc *info,
 	writel(con1 | ADC_CON_EN_START, ADC_V1_CON(info->regs));
 }
 
-static struct exynos_adc_data const exynos_adc_s3c24xx_data = {
-	.num_channels	= MAX_ADC_V1_CHANNELS,
-	.mask		= ADC_S3C2410_DATX_MASK, /* 10 bit ADC resolution */
-
-	.init_hw	= exynos_adc_v1_init_hw,
-	.exit_hw	= exynos_adc_v1_exit_hw,
-	.start_conv	= exynos_adc_s3c64xx_start_conv,
-};
-
 static struct exynos_adc_data const exynos_adc_s3c64xx_data = {
 	.num_channels	= MAX_ADC_V1_CHANNELS,
 	.mask		= ADC_DATX_MASK,	/* 12 bit ADC resolution */
@@ -486,18 +425,6 @@ static const struct exynos_adc_data exynos7_adc_data = {
 
 static const struct of_device_id exynos_adc_match[] = {
 	{
-		.compatible = "samsung,s3c2410-adc",
-		.data = &exynos_adc_s3c24xx_data,
-	}, {
-		.compatible = "samsung,s3c2416-adc",
-		.data = &exynos_adc_s3c2416_data,
-	}, {
-		.compatible = "samsung,s3c2440-adc",
-		.data = &exynos_adc_s3c24xx_data,
-	}, {
-		.compatible = "samsung,s3c2443-adc",
-		.data = &exynos_adc_s3c2443_data,
-	}, {
 		.compatible = "samsung,s3c6410-adc",
 		.data = &exynos_adc_s3c64xx_data,
 	}, {

-- 
2.48.1


