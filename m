Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7264CA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Aug 2025 17:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RdB5MqNC+p3bmf/ntWx5h3e+QQrokyQ+em8wO8bj1sc=; b=E2Ptpx1plXq288+Z2eRuRtVdUj
	dow1W7qz1f3/bXu+SQegKpoggCdgGbuI6Rv7gjtWMVmB0YTzP0Dy7PsC63z1CfQUC82N4SYTdp3GL
	9h6mYf9LIUzK+mcZqXskYuBl8451oyBPxK55UB4TeiXWi4ChPb4YVEpoggtchWzbCWlOgqGIjllvD
	EPj8faANnau+uPd1ZP4FaqMX0nwZesYDeTRIaI5tyVzoFPO6E1O8sZ1+KfwuOZot0FLkkOprIL86c
	wJQiD8Fj+Xsqf65kqY1/dhbx/PCZaaTg0IZwAUIS/4ySG4GpnOD7C5xYw859DBgND1BJSoqqsDDGI
	sTfnXpnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usP6o-00000008Cu2-1p3x;
	Sat, 30 Aug 2025 17:11:22 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usOx5-00000008BaO-1saE
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 Aug 2025 17:01:20 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-afe7584b6c1so43091866b.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 30 Aug 2025 10:01:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756573278; x=1757178078; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RdB5MqNC+p3bmf/ntWx5h3e+QQrokyQ+em8wO8bj1sc=;
        b=t2xuC+iCdyBtBkSsEGhE8swIH6NQrJDVL4waM+Hxas3qNRadpxQTukAE8od6DcgFh5
         s9DJTA06SP9uBjGamrNf2xJ+l8tN81wfTiSbPSeD8pwrhYpUTPTYFQB/CiQMc6C0uFGd
         0UY67rvXvMSr72PbKEkmdpPhxabdHHf7NrLCMQgqOnfPL+RjSGcZEVM1AampXRTyfYBJ
         CWNjj3OgjgAdDZqFCOZJdpmmMPT89fIbpyYK47qmmD6UvSFarNnSJHWQwxDo3qXar48l
         xHfhTTnbX8s/7TcRJtTBN4XvQ+VwQ8N6jWCxrjBBwkbDhaTXj/jxiQSGK8HTNXqq6xem
         qWGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756573278; x=1757178078;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RdB5MqNC+p3bmf/ntWx5h3e+QQrokyQ+em8wO8bj1sc=;
        b=nkIYowF8g/eWwKlwVbx615jDBeDqg0BSUq8fA44pdi83hQ35cV9rpsmF81625/d5mz
         0ig9kVbUCSn3BDw4U6oc62qRFKsRkGWklmHlHiqOXoKX5RptOPrmaWftBCXkLpnhvp51
         9+jfLnvyM7SKDib6WST6o7eVmp6SeXkJFjIJUCoDaopM/9j/M41CX+xtPRZdB5jVKer5
         m/oLXUFGBrNX9sD7WPq1qmm1EIH+e4ebtLxEYhl8mpCujb3Y1kO/p7euQ39FVeo72wOK
         7ri6VyAgWAARkiolS2D74hd3ZPzib8LdAIgzK1IQXStn6ZkTc0JhWzUg8cuPoztxIGW6
         5r2Q==
X-Forwarded-Encrypted: i=1; AJvYcCUkLNeMX6NhWCrfcGKp8sSFi/4IMR1RZj0q1NigJTDX0EXYay4GHAkWr16k8e0XqGOnPtfAneCfDrMIR6UMbEnz@lists.infradead.org
X-Gm-Message-State: AOJu0YwJdYtC0mtWc4SbeUsuVV3mOEC8kLGrERhllqK81a3f2HBhJBZw
	vDUfGZzca8vq62FLFTdhCN55RAewGMk0T4T000yJo+PgqlR6ru3RPPMfq1Dgv4B5qrw=
X-Gm-Gg: ASbGncsA4xSdOVikh4SG36lVHpNHsgLc6TVwIpm/pywT+vUBl2ibhOfAcLsGSwgTTDE
	iXdmnyqMZr+5PWqn5CZjWmGTZezFLk5UY+6hRiy8YDyTpihrflp8VkXktuECjq443bwGUjGQADB
	tiZEZ1WRQQzN+7w/6JneIXpO1+OItaJzaA8fxdF58zFwmab0dKPHokPBC9y1nQTHg2Lcs3ijEXt
	LrSGDi+HAsQ3dzqKMTzGHyZO2Xpg6Kwv1bpxqMKmvQSPKXJbsKRrmTItJWe1s4FdYhby6zN5AZw
	Zhud0BIRghGP5sFL5/mOvbAFeLwbNtldVFfNJy2aegKJ79uHbO9wnJEHxUorpsLkEYB8MzmvRok
	sWxktgNkZOZ7Am9ifjokeD9GSjPJfPh23cRE1WJG4n/EVPU9h+Q==
X-Google-Smtp-Source: AGHT+IHe++mZhWzLj+V2kR1/YfRvNVOIAhKLNUILUb6vPmc6HP8S/l0mFC1K58GUtxiQDbdzEfLucA==
X-Received: by 2002:a17:906:9f85:b0:afe:ae6c:4141 with SMTP id a640c23a62f3a-aff0ee05414mr274464566b.2.1756573277761;
        Sat, 30 Aug 2025 10:01:17 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aff12a6b404sm309038766b.88.2025.08.30.10.01.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Aug 2025 10:01:17 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sat, 30 Aug 2025 19:01:09 +0200
Subject: [PATCH 1/4] mtd: rawnand: s3c2410: Drop S3C2410 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250830-s3c-cleanup-nand-v1-1-05b99ef990fe@linaro.org>
References: <20250830-s3c-cleanup-nand-v1-0-05b99ef990fe@linaro.org>
In-Reply-To: <20250830-s3c-cleanup-nand-v1-0-05b99ef990fe@linaro.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Russell King <linux@armlinux.org.uk>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2620;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=RPUJbg100xa0IEvnoF3u1mdVLmvj7pTfHeSRkyLDqeE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBosy5XzOuvSuRgZYrPBWhcA/8cx0Ta1ZMMtq3VA
 U97dWTDNgGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaLMuVwAKCRDBN2bmhouD
 15CkD/9SA+hmrUU/1U3lo3ofl7xEfszMtOVsHre48VzovCwtJVbvY66wq2HilKGrcKVaCJzaThw
 /0pxt9R8+UI8qBpXmErjOiZoOSArSvZwnPrY2IQiynNufwCqsoBkvKOEuIaOtPTOJnsxkJKCk4H
 x9fLs6FX74gWPS9K38wmcebzL+rWDEy+oVtVB+L78jnjI64mH4xo2bv8HKnBQa9ZfCL1LdLNMbR
 d8VElMJoGEsZkOOZxR/stuuVdZD3dXombq/YjrCw2nRpJtyLap6CcTg5TmpVKGL35wdcmXI/OZI
 MjekuYui0ID1Ft43KT0xlyAQUK/IoESXLBVRuIUChjCFuyEuP7RY1u50r+ETJDQb7y8xTWHBE/D
 ZKRpBXP5BP8IiclImSst1JMUfKoM8+gzYSgQd/mOxY+iiUHv9Gb5j/hzNrkI4XBakbHWlHXd+C+
 ndvykMkA5Ymrasd+5bVN6fSUaY0gMUeu8vf+X1Zo4XP4fdMl6MlC6XXSAMvmwO39AxEt8zKVgZm
 dDoFqaKhVT0CHbg2mQfgG8Wr9wGRZ3Rwo5r+mqebEQ0E7kQ3Y9i4h3c18MrGoGn2HVRYpD/mYee
 C1izWKtMDfyU0Yhn1qP+CovK8XgHtSzrkczRxDC/VAivNBM4SJcrnRlUJt0qeZTRqoRew7wjkQu
 3z+KzqjjHeF0x4w==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250830_100119_498796_40DF2FCC 
X-CRM114-Status: GOOD (  16.52  )
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
2023.  There are no in-kernel users of its compatibles and platform IDs.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/mtd/nand/raw/s3c2410.c | 38 --------------------------------------
 1 file changed, 38 deletions(-)

diff --git a/drivers/mtd/nand/raw/s3c2410.c b/drivers/mtd/nand/raw/s3c2410.c
index 229f2e87d56eeacf5fda0ad29df59655b328658e..33130d75c5bab709a3e5cfd6e95b273cf62e4d46 100644
--- a/drivers/mtd/nand/raw/s3c2410.c
+++ b/drivers/mtd/nand/raw/s3c2410.c
@@ -169,18 +169,6 @@ struct s3c24XX_nand_devtype_data {
 	enum s3c_cpu_type type;
 };
 
-static const struct s3c24XX_nand_devtype_data s3c2410_nand_devtype_data = {
-	.type = TYPE_S3C2410,
-};
-
-static const struct s3c24XX_nand_devtype_data s3c2412_nand_devtype_data = {
-	.type = TYPE_S3C2412,
-};
-
-static const struct s3c24XX_nand_devtype_data s3c2440_nand_devtype_data = {
-	.type = TYPE_S3C2440,
-};
-
 /* conversion functions */
 
 static struct s3c2410_nand_mtd *s3c2410_nand_mtd_toours(struct mtd_info *mtd)
@@ -944,22 +932,6 @@ static const struct nand_controller_ops s3c24xx_nand_controller_ops = {
 	.setup_interface = s3c2410_nand_setup_interface,
 };
 
-static const struct of_device_id s3c24xx_nand_dt_ids[] = {
-	{
-		.compatible = "samsung,s3c2410-nand",
-		.data = &s3c2410_nand_devtype_data,
-	}, {
-		/* also compatible with s3c6400 */
-		.compatible = "samsung,s3c2412-nand",
-		.data = &s3c2412_nand_devtype_data,
-	}, {
-		.compatible = "samsung,s3c2440-nand",
-		.data = &s3c2440_nand_devtype_data,
-	},
-	{ /* sentinel */ }
-};
-MODULE_DEVICE_TABLE(of, s3c24xx_nand_dt_ids);
-
 static int s3c24xx_nand_probe_dt(struct platform_device *pdev)
 {
 	const struct s3c24XX_nand_devtype_data *devtype_data;
@@ -1194,15 +1166,6 @@ static int s3c24xx_nand_resume(struct platform_device *dev)
 
 static const struct platform_device_id s3c24xx_driver_ids[] = {
 	{
-		.name		= "s3c2410-nand",
-		.driver_data	= TYPE_S3C2410,
-	}, {
-		.name		= "s3c2440-nand",
-		.driver_data	= TYPE_S3C2440,
-	}, {
-		.name		= "s3c2412-nand",
-		.driver_data	= TYPE_S3C2412,
-	}, {
 		.name		= "s3c6400-nand",
 		.driver_data	= TYPE_S3C2412, /* compatible with 2412 */
 	},
@@ -1219,7 +1182,6 @@ static struct platform_driver s3c24xx_nand_driver = {
 	.id_table	= s3c24xx_driver_ids,
 	.driver		= {
 		.name	= "s3c24xx-nand",
-		.of_match_table = s3c24xx_nand_dt_ids,
 	},
 };
 

-- 
2.48.1


