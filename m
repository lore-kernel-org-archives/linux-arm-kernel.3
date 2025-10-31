Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98021CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 12:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HSaQ1fMzBn62httc+1ynJ5lZCTonhSY3jc12jXK/iU4=; b=NWnbJqVt6w7kWWkFXtWLR7mLoy
	ooa90fNbK8B1jnO98CFXWv2Ojh+o2bfFZwdpWUZTG+4CgLZuIRAulGwu4HpF1IkHheOsUbIZNXF9V
	FTEShVYxNwK2x5Qb20/b1+ntpy0R/E/o7q7w80n862sAu5TueJz/yDUSf1S1HYyVrIvJSveDKs9r2
	0MozeYTk+f8m6hPIE9DwnLYBRSg0mMFgplLNhUrAjXBEbgX57mY6d40bnTF8l/pHUTPWoOUPlInMP
	jny7ruxatjiLNYQwtfQhELSxZ+Cagx8iZRg01DObQ6ek19jKCAwDF+sOO7KDQGKW4iLmzQtfLV+as
	e1SCvrxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEofy-000000067TB-3j9q;
	Fri, 31 Oct 2025 12:56:18 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEofn-000000067Lv-2c0X
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 12:56:08 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-474975af41dso16216205e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Oct 2025 05:56:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761915366; x=1762520166; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HSaQ1fMzBn62httc+1ynJ5lZCTonhSY3jc12jXK/iU4=;
        b=qgTuEaAcSUtJTqifuQCmpXDiUYDjG2q8CKNtWODZiaAz7N4k8L+rAAeA7bgTNZc7XU
         N6Tp1+rFWpJqV/3COzgl9kfon9mnaN1P9Oct5VgkQkTcd1GX26KnN231rCbRLgLts1rb
         QjVxmxRZqCMIwSdvnzG0KZzHlAK7Quebig5UzOiX71W4/vhXpyM8GsyHo7iAeCfF4lzv
         2SysO74apJalnwIVT+9jVHFBUPYDQMnTqzUrlqHsO1dB2Bru9m6jy0Ks6RdExdW69rhP
         L/hsgWYe45TTrqZ4Q7BKagrNqnxAWTlcUQ4jF+s37P0DeUvlp2RN9Wch9rBCPLlPcqQ2
         UelA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761915366; x=1762520166;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HSaQ1fMzBn62httc+1ynJ5lZCTonhSY3jc12jXK/iU4=;
        b=tlNsNUzoBO7Ez9IqNzEew+tuYU+PkDNhRvtWUmwOvK3V3sDGcdkiNBvIyK3z717cMY
         QgzrSP4t4wFVCC65IhL/qOyTniDxloMM/C3Nd9wdb00ERWivGxgc8g+GoxJ9WOIEcaFz
         zT+T9cAYhQEP6jcLdJOi6nwGFdwb4PPGxCPcYli3W0gP7k62yWYmTAjYLDfFAc1F3mZE
         +6wsePCMebAJ+3T+EwzVaENK9GBfS/FnKLEuIwRBujroS9ArFpq8etXJw/pkd2nvyt04
         sVkYC665XKCKGAZKE8ULyDXDNHXZvfyDT/Pdvk3uwouRmN7Z9YCRk0WRN5Ea+gbw8vgC
         Gl+A==
X-Forwarded-Encrypted: i=1; AJvYcCVXk7T6I4UMnqgd1VIMi7BmGAVkadLOptnijAKVHyheXkdyBK9gbYtbo33ErX9qcfFoLAFlvvWE2KS3ag4ke4I7@lists.infradead.org
X-Gm-Message-State: AOJu0YzxiNKXtPZi1hXdKbJNIO4cEYhfTT4wAItquGe3yteJjuA+sojJ
	aZOwPNoqb3XStte+5tK/bU4aZImile/6HyJuYtDuq7d75bQQUtc2DbcBhhpMUG6DACc=
X-Gm-Gg: ASbGncswxtiFM99wRc2qUbIKi51TK+BYzDFPOVIIcbGKNygi+Y84cjtxveE1rZat3O0
	j9iS/AIckEe9JG/Rv4vYLLbo63sc6u0wYWS5Sj3/3PysOgMVZKTCA/dX9DjOSP4mNG8wzxDz+0w
	S0EtLVl3eE12csFoGd6AJDQHJxOfddbJ+Xmu1g1zvVpW+jBaxzB8Jiz4NVgtzxU26X1SDE8upbX
	TFvlUVtdl8/vk6lhPJHP9xurG3hhs/YbDe4S7s7/EU5g1l2Uq3b+ymrF2n8OBPraO0C3S8DiuYB
	sAHDw59xdaG4ZcEgdKwNiuao36xF/fLQrYuEJxg5Ijw87PefKWD9c+WYWxCzd/QokFM66W525oq
	p9rKDRq8jKxY9onvNRcX0VUqgNRHaghNeEc89d6/EruSN6IsHhpLVVyDZzG4T3hQhzxRVv1+TqW
	ZH3GBGNxOqByxCHfogWu7Sx2wkvcmlK1UFQkLGlp9gqqvbpeJjNESV
X-Google-Smtp-Source: AGHT+IEMG1uBB/nM2ExhUoSIALv5lI0e6AJa+tuQvPuDL99NpDZ3UQgWksFzIXH5FeMHLGmGMsY+Mw==
X-Received: by 2002:a05:600c:699a:b0:477:1326:7b4b with SMTP id 5b1f17b1804b1-47730872322mr35934675e9.19.1761915365648;
        Fri, 31 Oct 2025 05:56:05 -0700 (PDT)
Received: from ta2.c.googlers.com (213.53.77.34.bc.googleusercontent.com. [34.77.53.213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47732fe1075sm31814585e9.11.2025.10.31.05.56.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 05:56:05 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Fri, 31 Oct 2025 12:56:02 +0000
Subject: [PATCH 03/11] soc: samsung: exynos-chipid: use heap allocated
 driver data
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251031-gs101-chipid-v1-3-d78d1076b210@linaro.org>
References: <20251031-gs101-chipid-v1-0-d78d1076b210@linaro.org>
In-Reply-To: <20251031-gs101-chipid-v1-0-d78d1076b210@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, semen.protsenko@linaro.org, 
 willmcvicker@google.com, kernel-team@android.com, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761915362; l=3640;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=X61ET0QayRGQSnh54T5fe6GJ6+lTqv8ZTwap/CsnBTw=;
 b=0K1j4+WDA8muM25w4/AKELtGUQ9BOkhp3k+p+UHT6d2Sl/VE5k+tF31SWP1r7l4Rln/B7iCsy
 lIZmzLBAHceAAjz0RqO96KF1Lw4NqxJTcwe41uEqLf0u+PuxubM62lS
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_055607_694330_B4AAC1BC 
X-CRM114-Status: GOOD (  16.13  )
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

Prepare for GS101 chipid addition, it will requre more driver data. Use
heap allocated driver data, it's easily extensible. Together with
the change s/soc_info/exynos_chipid, it better indicates that it is the
driver data structure.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/soc/samsung/exynos-chipid.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/drivers/soc/samsung/exynos-chipid.c b/drivers/soc/samsung/exynos-chipid.c
index d3b4b5508e0c808ee9f7b0039073ef57915d60fc..f5107b8b339e8884d6a67a80650a95441510c66c 100644
--- a/drivers/soc/samsung/exynos-chipid.c
+++ b/drivers/soc/samsung/exynos-chipid.c
@@ -82,7 +82,7 @@ static const char *product_id_to_soc_id(unsigned int product_id)
 
 static int exynos_chipid_get_chipid_info(struct regmap *regmap,
 		const struct exynos_chipid_variant *data,
-		struct exynos_chipid_info *soc_info)
+		struct exynos_chipid_info *exynos_chipid)
 {
 	int ret;
 	unsigned int val, main_rev, sub_rev;
@@ -90,7 +90,7 @@ static int exynos_chipid_get_chipid_info(struct regmap *regmap,
 	ret = regmap_read(regmap, EXYNOS_CHIPID_REG_PRO_ID, &val);
 	if (ret < 0)
 		return ret;
-	soc_info->product_id = val & EXYNOS_MASK;
+	exynos_chipid->product_id = val & EXYNOS_MASK;
 
 	if (data->rev_reg != EXYNOS_CHIPID_REG_PRO_ID) {
 		ret = regmap_read(regmap, data->rev_reg, &val);
@@ -99,7 +99,7 @@ static int exynos_chipid_get_chipid_info(struct regmap *regmap,
 	}
 	main_rev = (val >> data->main_rev_shift) & EXYNOS_REV_PART_MASK;
 	sub_rev = (val >> data->sub_rev_shift) & EXYNOS_REV_PART_MASK;
-	soc_info->revision = (main_rev << EXYNOS_REV_PART_SHIFT) | sub_rev;
+	exynos_chipid->revision = (main_rev << EXYNOS_REV_PART_SHIFT) | sub_rev;
 
 	return 0;
 }
@@ -107,7 +107,7 @@ static int exynos_chipid_get_chipid_info(struct regmap *regmap,
 static int exynos_chipid_probe(struct platform_device *pdev)
 {
 	const struct exynos_chipid_variant *drv_data;
-	struct exynos_chipid_info soc_info;
+	struct exynos_chipid_info *exynos_chipid;
 	struct soc_device_attribute *soc_dev_attr;
 	struct device *dev = &pdev->dev;
 	struct soc_device *soc_dev;
@@ -119,11 +119,15 @@ static int exynos_chipid_probe(struct platform_device *pdev)
 	if (!drv_data)
 		return -EINVAL;
 
+	exynos_chipid = devm_kzalloc(dev, sizeof(*exynos_chipid), GFP_KERNEL);
+	if (!exynos_chipid)
+		return -ENOMEM;
+
 	regmap = device_node_to_regmap(dev->of_node);
 	if (IS_ERR(regmap))
 		return PTR_ERR(regmap);
 
-	ret = exynos_chipid_get_chipid_info(regmap, drv_data, &soc_info);
+	ret = exynos_chipid_get_chipid_info(regmap, drv_data, exynos_chipid);
 	if (ret < 0)
 		return ret;
 
@@ -138,10 +142,10 @@ static int exynos_chipid_probe(struct platform_device *pdev)
 	of_node_put(root);
 
 	soc_dev_attr->revision = devm_kasprintf(dev, GFP_KERNEL, "%x",
-						soc_info.revision);
+						exynos_chipid->revision);
 	if (!soc_dev_attr->revision)
 		return -ENOMEM;
-	soc_dev_attr->soc_id = product_id_to_soc_id(soc_info.product_id);
+	soc_dev_attr->soc_id = product_id_to_soc_id(exynos_chipid->product_id);
 	if (!soc_dev_attr->soc_id) {
 		pr_err("Unknown SoC\n");
 		return -ENODEV;
@@ -159,7 +163,8 @@ static int exynos_chipid_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, soc_dev);
 
 	dev_info(dev, "Exynos: CPU[%s] PRO_ID[0x%x] REV[0x%x] Detected\n",
-		 soc_dev_attr->soc_id, soc_info.product_id, soc_info.revision);
+		 soc_dev_attr->soc_id, exynos_chipid->product_id,
+		 exynos_chipid->revision);
 
 	return 0;
 

-- 
2.51.1.930.gacf6e81ea2-goog


