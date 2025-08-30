Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AD2ECA0FFF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Aug 2025 16:54:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kwHNHld86Ahk+TRbfmt7h72W95FfFhoR7W7sL+uYmow=; b=MqwvADnAMvdEHwPW1Dv5LtzN8l
	yIV7giVMvY7OGL8VujAgkFwkAN9YRd7GNKCPKXhaqMEoqfz+sSQW7CmHAAGGKal5IgW2x9S8RyIM1
	MP8TePBLGcP3t9WWldsCFahDtKbF9VQSBNA1LupYDobXWkOGmQcNT4rdnCesjA4hP5ijKs2yVkEnn
	pw3qSIuovhATujtmjjfNqcmrDJfVzeMe1OLBkFv1x/BH7ClX+NGV0SiK5SCSIDVvj1ZRKl1m/ADam
	tTX6pVSsoA0JK0mUaegdlX8bDw3O6Og3auRf0CCMOLBY4TaY3LJasR3zEEKWhS45wG+2Cndv/Gi2L
	lEfKgcSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usOqR-00000008An9-1WIS;
	Sat, 30 Aug 2025 16:54:27 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usOku-00000008A9G-1sC3
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 Aug 2025 16:48:45 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-3ceed75169cso252502f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 30 Aug 2025 09:48:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756572523; x=1757177323; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kwHNHld86Ahk+TRbfmt7h72W95FfFhoR7W7sL+uYmow=;
        b=EvdgYtKThGIUq/7e2Ahk7Bt4qv1uxspHT8GZe4skdDF0q/Z+/rnTdpAfTSUMpDsbEu
         BCyIuwz5mYP6WGcHVa1Wp10JJ+E/IQvgZfyBjq3YgHHLBdHWtVMXFHN5MHohJMRJ3HAv
         ekrrz0YAq6nbifTKOjN/Grn7Cc1Q4U8gj8s0juCWqRUC+rT6t6ksI9nrL93Hn03HMQs8
         1WDnH7uwa+d9pZ0fxwnIQYbzEJtmI9soktarGwAc+uU00F7mhGvTnTk+iSHagpppfqnM
         jvZ5RgCp5JZXIclP3MTvxd/tZ9U90iJ5ucc4bEen5c1LkrpcQZ1Yj6rVgKrrbvFcILEu
         Crrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756572523; x=1757177323;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kwHNHld86Ahk+TRbfmt7h72W95FfFhoR7W7sL+uYmow=;
        b=bW5Ad1Imbab0asVCY4WmMjF4Llg1ojfg9aDsvZz1OLQiGPWmZPgtqTPuMvHaWN70tw
         iaoTpecZOytZqFza74tWAqFPmc2eOqTF6+rALgaGO/gefKDOUq/8guOc5ERE7OXigvnw
         6lM0UEMZq5x2bfFxuzaKgyqeEsbeqpnNN/9FJ3uLgHmRc5bTeN/iY1Bx64sZKQ1emDf5
         XKr3sq7CEL5zboxGtOjrjPYov4dzPeWZhS/HDCdkxMqsYXrXGDzgvz25TlBDLK07webo
         cHu7kIBa9eFSDuVnWYPOuA/uzY9kL+Fa78pXnTBFCBXjukGvdXCBlUjQgnKBsvfh08oG
         7VsA==
X-Forwarded-Encrypted: i=1; AJvYcCW+aMKShqzTM54CWlNtT5hdqSTIAzMtmgvTnTTZU0O3+8q1gJhzZD0qfCexBQ9oC8YtAlveqA7DVO9EOspv/Mut@lists.infradead.org
X-Gm-Message-State: AOJu0YzH4lqAfMLqOxFv8KTzbBH10Zvj69kO8kBnYA68xagBRVDjGF0E
	8bVqEUoLG3r6oHixwhsW9LvYVluk4KoYaKTAgXy/SmFryjK+kSP7tausX8f+ve1//GY=
X-Gm-Gg: ASbGncsa4gxd2QDZQ5tfYm/UReaHro/TJbblAMzfUdR5vskflY1j7Nd1IDHxPimjoyW
	mTm7FrEsOiUAtlFB6xupdbt3UGQeC324/7o27qd0BqhTE/do1MxRalkOD+ksPLevl5r1tSrjUM8
	7jzmAqNdGRzio1wE15RSoUmvjP7eTLnHXA82/06iJxRt8cncIRBOwRthobKIK4xliBG6ArMtcAE
	ShIcfX2TD0u9cCiEJvYn6kY4z5oWMddsY/bco2PjoIOabAHVSd2Tj5DrltuaM1GhpQ+iWPg72Ok
	Ex4U+xUQxTgtG7FZj6SDt/89xxuezw8L4VRPQ39jOYR4TIzpajuJcTh6TQRW/SGGfZVSeU8wrgx
	BvbQ7Z0ApOTTpUj7C313oAimlQlC/fWnNsltQhBA=
X-Google-Smtp-Source: AGHT+IGUYbZV5y47P6lmjYscKjNdQ2Uw8ELxYIkx4OD71yfrs+H4TcNwkmZsQ6P3v/fHNbcN0w5aPQ==
X-Received: by 2002:a5d:4490:0:b0:3d1:6e71:4915 with SMTP id ffacd0b85a97d-3d16e714b0dmr1046081f8f.4.1756572522774;
        Sat, 30 Aug 2025 09:48:42 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3cf274dde69sm7818129f8f.14.2025.08.30.09.48.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Aug 2025 09:48:42 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sat, 30 Aug 2025 18:48:30 +0200
Subject: [PATCH v2 1/5] iio: adc: exynos_adc: Drop S3C2410 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250830-s3c-cleanup-adc-v2-1-4f8299343d32@linaro.org>
References: <20250830-s3c-cleanup-adc-v2-0-4f8299343d32@linaro.org>
In-Reply-To: <20250830-s3c-cleanup-adc-v2-0-4f8299343d32@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4264;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=7uER2DvoLLE6z6epL6HrNFtjDW4TWlnYFUC2TNnSIPk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBosytjN2yInA7p39V8n1XoJXYzoAUFvLq/xOHS6
 dqUEsdByBGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaLMrYwAKCRDBN2bmhouD
 1x9QD/wP0Tzu8mof+pIAGOVInqw3xEGpRCv4RnJN0E5qMXRG9QqqJNdBW2jeKvNmvYaYzO6zJAY
 Ev7ZpFXpiRZNKoGRbe6yPsfoVCLfXL2htcCeFgoSPKj9r0dsVJ5vQcDYEJ61UrmOdbd5IeB8Iaa
 z2yx4V+eF/xCz/UUS1JKcwo5saIq8aqQlxNjufJK/RxTUi/z6kPnczOXA+jali0A3lXVphMABDf
 9dN7bnsGgy4Tzl+3OME5+VoQRNpiRnOXcKpnOa8Ljpx7V5zgZTsGF4hpL2nLD/ACLBIbNxvSLAL
 7Vx2vi0K83YcWGQ+sugWZ+VZ0uiCEbpNU31k2QuhDk+1U55VbN6RnjOSP6HrVu1Y5dTcvu2z4LV
 Asmjc+u/KHPBJTSbfmxzAv/USAuaZDK5sVodbVSlKABJasrieBwAmse0NRU5kQilaHgkL4cTA+J
 q/pxj0YOSEL1sR6EWpxwyg8dWsdsWoxW2C1R8dn66ur9rBN82aqcxuHA5TfuUpN59A/Ub5W8/Kx
 O8+joypsCNHDmOH+1jvCa4j8kYfae2PVTplVv12sZFYCVsmB0U0ouzZajd+ozTIaN+KA3+ZNBc4
 8n9gIcZFRJBgjeoX3l0ghSLrEJji28t/r8xm1hANzB4Am+xtEioguys9BdSsk//SRbElZE5I6Ck
 9lClcMh5sUUutag==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250830_094844_497637_0C94D60C 
X-CRM114-Status: GOOD (  14.67  )
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

Reviewed-by: Andy Shevchenko <andy@kernel.org>
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


