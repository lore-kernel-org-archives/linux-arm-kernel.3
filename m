Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30A09CF857F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 11:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xGjx4noM1tm5gVaifoDiY0Cc8fekcKfT3Xb17cdNq9w=; b=qZMNF6ifmUFS1F0cbjtvF6zbMR
	19C7aKZcs8KJY4sEcJHvmMBRjo/Xz+n7wDW6g9BEbIbiqy+Cgpb3wWyKGoVcegLrg8Py3YsNzsxZV
	usvTIs7KafwJRL3lbsTcXhuoX01tRGc9NNVX7riz9kouRNCm89sMAYDn0lGbAWPDfFJd8RJHxT2SI
	eH7uWXDBoUgJG6CeW01cXOO+x8Fzt2yrdTU/Pyi5nHdn9YfFN/vHNQESUxh2yxTrCBBV9Gp2NM0T/
	E5YblYKyNvS1cF12e2zNW5/xndQfaYBmewSvQGwiXKOFLEbwrgeAGuJ/O4nSvBb+B4Bc1pcX7NXbJ
	U9s48CBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM2rR-00000006aG6-1FHx;
	Thu, 20 Nov 2025 11:30:01 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM2rC-00000006a6W-0acJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 11:29:47 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-42b32a3e78bso649682f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Nov 2025 03:29:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763638184; x=1764242984; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xGjx4noM1tm5gVaifoDiY0Cc8fekcKfT3Xb17cdNq9w=;
        b=Qk+YjRKKinWKZRd23M+nsImKMtyo26yPL1a2mYwuAiWRXfiz4MKp+DaFpQIfvj1TRc
         8epWdwUXhb12t0wM4w2v3rd7eVMg6fiF4O+0KfvVcpW9tdfso0S5acFUdDyUWyQbYlP4
         c1u0QUQuChE4SaUgJP2UP9hk1nXXM7ckhjfD9swnWRis6R9/WXpGEIyblPBYHip7cXeU
         t3cuPUKYHez1G155w8JO9SqyY8iB+ME3oIn4j1hBzvT0W4TqaLZtUrtyh47cFohNyPVN
         /fp5VCMtNojax7lSzk4vZnq0Empwr3Ykb5xEoPntQL9kkI3TBzC6Jl3GPta5apPisFtd
         OLPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763638184; x=1764242984;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xGjx4noM1tm5gVaifoDiY0Cc8fekcKfT3Xb17cdNq9w=;
        b=TioVfuPVQbjHoOM1kgMgx4a7O0DyCpU8+0WXLAbEh77OQvEchrafdsLAp1a8jcqSyw
         vLXgP14UKFtKGIbgBxSvpmDDZTVl9OfPxzd4ymmRJGi5NhGvC7xfp5hUVULKtzEpJmVn
         x9Jm0bKREDezOmCmokfzkJpVjo8teGbLVrfSvz7/fi8a4WUglHmUX8qJY26j03rmvL7f
         7QyO1GInmr6dFuPaDfIvh2zfjcjxr/0IeVwnOPpjmS6SgYETszAV17vppLxFxxhU5f2s
         OkwZuxGnLALOOtFGnReOw0IwBccJo4bjEWqDjz5UM1F2cnlPuYFIGtz3GTDSI6H4SiXO
         +bJw==
X-Forwarded-Encrypted: i=1; AJvYcCW07r7MYlyqa1YmWKY0VMiaRoFhrNF51o+9SEV8JQdipgza2n6A6evnJcN43bZcTBN6Vcc/eT9EoHWtmkmP++eV@lists.infradead.org
X-Gm-Message-State: AOJu0Yyg0RMZ7anKiBpcNC/ZH2ye8VV5R+4PykkAZYMaHkAHHospI9cc
	jCdegqNCTebdyikSbIUHeOsR2Y27dNKQ/kbMkY6bQINXkSEZlOm0Jw9q4cqBc4BZ9ts=
X-Gm-Gg: ASbGncvsnBPVvK3uoivBJSejzhlvgI40Pl4RLTLq3l/nKEcEOjtVGJ/A2eNqQhf6HOc
	1RbcyUdHDI/LsoAgVh/ULm+LKtwW02lELUqvorIDoZf7IOeqke+jC/y/pdlvCUdx8ielLTJB64G
	UZeU4K4LWnkFAu/Gw5P4w3+jSLe4sxS8qD51J3Ld1oDvlzFRbKHve7KewwxsiIIgCCQyk1a+hU1
	g0Mrq2OVsZTNqX/o7Zt1rUQD+ZIsOQVlXsd1NljiYLA1uTAWU0Tdl2tLTg6/tBpCQt15EhFCX4l
	2X8HK/Re+dSW7QVUThq95Ec9rgO4XtvaS/CK7WRj2ptxVLFv6UL5G8swFP4OHK5+hft7qK1gaLG
	AzoK9FEjH1KAy/joGKUhvuAXvNTJMW/5uuTKdwJ4iVmD/V2YyQQnAzzvFNK2gDN2OkjZAcTGYDa
	oGgvII8SLVQrXbC4PdVGcoJhS999wemlQwY2s0yxpa7rt6I4wUEGD7lFFOhA6EaswyMqY=
X-Google-Smtp-Source: AGHT+IHLwhppa11NSu0fg35jlo/DjGMaiLuTQ/yFrCLaSK5ubFNizQXGeSmz5gWNNC42PHU7x92MmA==
X-Received: by 2002:a05:6000:288a:b0:42b:3746:3b85 with SMTP id ffacd0b85a97d-42cb9a5c1c9mr2024241f8f.45.1763638184091;
        Thu, 20 Nov 2025 03:29:44 -0800 (PST)
Received: from ta2.c.googlers.com (17.83.155.104.bc.googleusercontent.com. [104.155.83.17])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7f34fd1sm4961040f8f.11.2025.11.20.03.29.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Nov 2025 03:29:43 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Thu, 20 Nov 2025 11:29:39 +0000
Subject: [PATCH v3 5/6] soc: samsung: exynos-chipid: add google,gs101-otp
 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251120-gs101-chipid-v3-5-1aeaa8b7fe35@linaro.org>
References: <20251120-gs101-chipid-v3-0-1aeaa8b7fe35@linaro.org>
In-Reply-To: <20251120-gs101-chipid-v3-0-1aeaa8b7fe35@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Srinivas Kandagatla <srini@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, semen.protsenko@linaro.org, 
 willmcvicker@google.com, kernel-team@android.com, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763638176; l=6167;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=Hx0Wk3GLsyUiGvEN/qp5B6nJmnx3EpkHuI8i+qqhClA=;
 b=tAcT5R8w819O9dIOPhFo9z2LAc7AhyX1zJ2nQpev2tr5239eUppOc+DfySeDBbmPZIRtuXl7y
 SGEQQBpFilmCBQ1nTDK/qRBO4HJ1oNoxhRljdDsF7IckRFf6T92p/M9
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_032946_226798_E1F688E8 
X-CRM114-Status: GOOD (  24.25  )
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

GS101 is different (but also e850 and autov9 I assume) from the SoCs
that are currently handled by the exynos-chipid driver because the
chip ID info is part of the OTP registers. GS101 OTP has a clock, an
interrupt line, a register space (that contains product and chip ID,
TMU data, ASV, etc) and a 32Kbit memory space that can be
read/program/locked with specific commands. On GS101 the "ChipID block"
is just an abstraction, it's not a physical device. When the power-on
sequence progresses, the OTP chipid values are loaded to the OTP
registers.

Add the GS101 chip ID support. The support is intentionally added in the
exynos-chipid driver, and not in a dedicated Exynos OTP driver, because
we estimate that there will not be any OTP consumers in the kernel other
than the chip ID/SoC interface. The downstream GS101 drivers confirm
this supposition.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/soc/samsung/exynos-chipid.c | 87 ++++++++++++++++++++++++++++++++-----
 1 file changed, 75 insertions(+), 12 deletions(-)

diff --git a/drivers/soc/samsung/exynos-chipid.c b/drivers/soc/samsung/exynos-chipid.c
index 5c8660374269c87ec38ebca242918bd7b1d362e5..06eb6ef8740d3f58eda52c8e71cf40074d2deb1f 100644
--- a/drivers/soc/samsung/exynos-chipid.c
+++ b/drivers/soc/samsung/exynos-chipid.c
@@ -13,9 +13,11 @@
  */
 
 #include <linux/array_size.h>
+#include <linux/clk.h>
 #include <linux/device.h>
 #include <linux/device/devres.h>
-#include <linux/errno.h>
+#include <linux/err.h>
+#include <linux/ioport.h>
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/of.h>
@@ -28,9 +30,11 @@
 #include "exynos-asv.h"
 
 struct exynos_chipid_variant {
-	unsigned int rev_reg;		/* revision register offset */
+	unsigned int main_rev_reg;	/* main revision register offset */
+	unsigned int sub_rev_reg;	/* sub revision register offset */
 	unsigned int main_rev_shift;	/* main revision offset in rev_reg */
 	unsigned int sub_rev_shift;	/* sub revision offset in rev_reg */
+	bool efuse;
 };
 
 struct exynos_chipid_info {
@@ -69,6 +73,8 @@ static const struct exynos_soc_id {
 	{ "EXYNOS990", 0xE9830000 },
 	{ "EXYNOSAUTOV9", 0xAAA80000 },
 	{ "EXYNOSAUTOV920", 0x0A920000 },
+	/* Compatible with: google,gs101-otp */
+	{ "GS101", 0x9845000 },
 };
 
 static const char *exynos_product_id_to_name(unsigned int product_id)
@@ -93,19 +99,53 @@ static int exynos_chipid_get_chipid_info(struct device *dev,
 		return dev_err_probe(dev, ret, "failed to read Product ID\n");
 	soc_info->product_id = val & EXYNOS_MASK;
 
-	if (data->rev_reg != EXYNOS_CHIPID_REG_PRO_ID) {
-		ret = regmap_read(regmap, data->rev_reg, &val);
+	if (data->sub_rev_reg == EXYNOS_CHIPID_REG_PRO_ID) {
+		/* exynos4210 case */
+		main_rev = (val >> data->main_rev_shift) & EXYNOS_REV_PART_MASK;
+		sub_rev = (val >> data->sub_rev_shift) & EXYNOS_REV_PART_MASK;
+	} else {
+		unsigned int val2;
+
+		ret = regmap_read(regmap, data->sub_rev_reg, &val2);
 		if (ret < 0)
 			return dev_err_probe(dev, ret,
 					     "failed to read revision\n");
+
+		if (data->main_rev_reg == EXYNOS_CHIPID_REG_PRO_ID)
+			/* gs101 case */
+			main_rev = (val >> data->main_rev_shift) & EXYNOS_REV_PART_MASK;
+		else
+			/* exynos850 case */
+			main_rev = (val2 >> data->main_rev_shift) & EXYNOS_REV_PART_MASK;
+
+		sub_rev = (val2 >> data->sub_rev_shift) & EXYNOS_REV_PART_MASK;
 	}
-	main_rev = (val >> data->main_rev_shift) & EXYNOS_REV_PART_MASK;
-	sub_rev = (val >> data->sub_rev_shift) & EXYNOS_REV_PART_MASK;
+
 	soc_info->revision = (main_rev << EXYNOS_REV_PART_SHIFT) | sub_rev;
 
 	return 0;
 }
 
+static struct regmap *exynos_chipid_get_efuse_regmap(struct platform_device *pdev)
+{
+	struct resource *res;
+	void __iomem *base;
+
+	base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
+	if (IS_ERR(base))
+		return ERR_CAST(base);
+
+	const struct regmap_config reg_config = {
+		.reg_bits = 32,
+		.reg_stride = 4,
+		.val_bits = 32,
+		.use_relaxed_mmio = true,
+		.max_register = (resource_size(res) - reg_config.reg_stride),
+	};
+
+	return devm_regmap_init_mmio(&pdev->dev, base, &reg_config);
+}
+
 static void exynos_chipid_unregister_soc(void *data)
 {
 	soc_device_unregister(data);
@@ -127,10 +167,24 @@ static int exynos_chipid_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, -EINVAL,
 				     "failed to get match data\n");
 
-	regmap = device_node_to_regmap(dev->of_node);
-	if (IS_ERR(regmap))
-		return dev_err_probe(dev, PTR_ERR(regmap),
-				     "failed to get regmap\n");
+	if (drv_data->efuse) {
+		struct clk *clk;
+
+		regmap = exynos_chipid_get_efuse_regmap(pdev);
+		if (IS_ERR(regmap))
+			return dev_err_probe(dev, PTR_ERR(regmap),
+					     "failed to get efuse regmap\n");
+
+		clk = devm_clk_get_enabled(dev, NULL);
+		if (IS_ERR(clk))
+			return dev_err_probe(dev, PTR_ERR(clk),
+					     "failed to get clock\n");
+	} else {
+		regmap = device_node_to_regmap(dev->of_node);
+		if (IS_ERR(regmap))
+			return dev_err_probe(dev, PTR_ERR(regmap),
+					     "failed to get regmap\n");
+	}
 
 	ret = exynos_chipid_get_chipid_info(dev, regmap, drv_data, &soc_info);
 	if (ret < 0)
@@ -177,19 +231,28 @@ static int exynos_chipid_probe(struct platform_device *pdev)
 }
 
 static const struct exynos_chipid_variant exynos4210_chipid_drv_data = {
-	.rev_reg	= 0x0,
 	.main_rev_shift	= 4,
 	.sub_rev_shift	= 0,
 };
 
 static const struct exynos_chipid_variant exynos850_chipid_drv_data = {
-	.rev_reg	= 0x10,
+	.main_rev_reg	= 0x10,
+	.sub_rev_reg	= 0x10,
 	.main_rev_shift	= 20,
 	.sub_rev_shift	= 16,
 };
 
+static const struct exynos_chipid_variant gs101_chipid_drv_data = {
+	.sub_rev_reg	= 0x10,
+	.sub_rev_shift	= 16,
+	.efuse = true,
+};
+
 static const struct of_device_id exynos_chipid_of_device_ids[] = {
 	{
+		.compatible	= "google,gs101-otp",
+		.data		= &gs101_chipid_drv_data,
+	}, {
 		.compatible	= "samsung,exynos4210-chipid",
 		.data		= &exynos4210_chipid_drv_data,
 	}, {

-- 
2.52.0.rc1.455.g30608eb744-goog


