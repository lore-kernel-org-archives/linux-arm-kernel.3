Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00076E677F4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Dec 2025 16:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OdZvrS1dE5qeSW0XzFKBJXtmzMM/4cC+vHFcMxasvWQ=; b=FTWbMIPUfm3KMujOg2ugbcoCQV
	CP3Dh9W/Wyu0zyqgpCjHytgAdgSbKCGuFxjMoWnSimB1UuM0sBMh5PSpq6ybmviSja+bxD6W/Dt9X
	7lWubDgdjNUVZ4n86GDXZeF/wZkRKFpd0WlmQFRrnjlUpIr2VVZCOI4HUm5u/OSyxGKMeudAv1taS
	iUVgOtErGJ5Bi9amUv0zzcyQLkEd5Nv8LuF/ZIuEtlMAt7LBIJImdEg7qOazHOt1ZTW9t06ObY5B+
	lr+05WqCf3mdtloJxZpqMlI0VwxK/tpP/ZWiHXhjWUSrM7qt7yRbQbnKBTxylTMrochqjTpyTPFbh
	4b1tkP9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXio1-0000000DyAT-3fNR;
	Mon, 22 Dec 2025 16:30:45 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXint-0000000Dy7f-3X3Y
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Dec 2025 16:30:39 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-477b198f4bcso27107885e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Dec 2025 08:30:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766421036; x=1767025836; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OdZvrS1dE5qeSW0XzFKBJXtmzMM/4cC+vHFcMxasvWQ=;
        b=RtEvWbjsHQUYyigJUmBU75yCsXrxGxA3JsN2iSbmCOBauLYWYzQooJKSWRvFIBv626
         SP6JBXl9dqPFvLDx9nzN5EJZQzwi8iEniWNSW7UBxLJRcs7IOmanCC0Fg/0WgfzkCvpF
         P0HDapHukWA90tVlDELni9GKTr1KRaEQ43SfvtwmOT3qndNVPboHtkpKuNqvUHq+PAil
         8qIU3d7LcUdHK1ImR2IyX10c7nRoWLLE5KrtnEDekckE2xfdzqFcwXZddzjIElsU6jlz
         9h+vMvlQ173igLr0t+11OC2pHxsyYu5Wnh5gktQZdRgcXVMt3aXqADE22TLLYMqp8HvH
         4efQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766421036; x=1767025836;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OdZvrS1dE5qeSW0XzFKBJXtmzMM/4cC+vHFcMxasvWQ=;
        b=Xvw6p4xK8xmsvy5K9arpQoeRLXKEDNbOwTk9sTu51zREmJ9vuxunkhfWLCudefkh1v
         PWQtvGbQrRIOkzLLafREWrRb5q51qwhOFaBdVP0XD2jKnDHEMVw9tDHgapE2v8wHwLHO
         XhWTwv4N2kT64mIv+ghVm4CwdfVkUFjWZfJYBuzFFNUYWVSFfHM/EzuPBjKCVbGGjvFf
         oYRTA+CbPDJcXTV47nEibiU3Ve011Do4bO7pO5to9lZWxOG7/KLz4LomwyqXFM7R8IuV
         yyWSi789VajkgR3OVEBB5ZgCJRMZdBYjOvQbAFGSBUH+fdRTaXkqRxijzyYK4889XH+1
         mCRg==
X-Forwarded-Encrypted: i=1; AJvYcCXNxBX6zDaCRW4zJzPgXTLuOtlTSuM3lsr7AdbxgVCDoV0JgkoAvLiiccdKzf/T9nFFzVwOT6Q68xjR81kuXe0U@lists.infradead.org
X-Gm-Message-State: AOJu0YyShLct3M78g92LaLT+qjGkyrXHQFgLsDjG02kJJajXeVT1uTq5
	dnXpSzD4CqgjQgpNzCwgBAh4DFxa1tvgPX9feCCZodun3wzeTGjcWyC6Z5hPuvpF36M=
X-Gm-Gg: AY/fxX4e0s8qyPP9CD+y+5g/WTjDWokBb8VIfEwyZ0HQlDIbr+BunE/GXeubHVLxWyT
	z3GyxJRfEKgwZrsSaAJQZej1rwxSkqoiT9i8P6AlYZ8RCI3AaeAPnxxl1lswpmd5HjyAI5hYMax
	Zjl5O7fh9iaMpzSg2LioEw64BkgTSTkN2f8wY5QRSbOL6NG4y6orFcBEuZLcx/64lGNJXDzbqj3
	bK9Q02vfwfOXw5tyyyp1NYY6EzeE6eaUsKtZ5kwnlf7XHqcpnTOk528NtowxjHXG3GebC9SilwQ
	J6Wsl5+W6MWJsJNo93txOtzbY2cLd+V6VWMtqj3IcJPBbE/W/nl1gwhqJ07uBaPSyIaiJcn7ubk
	BuMyv6qIl4gey+U5aEbyw00W17agv7hh4kTvo8EYnZWb0x4e+GTCCpoLUrBwpkjEbHEbvNueO7J
	TPmcUl8nCl2ofR/IoiKRhqmrHiiTUN+ySRb8BVTUnp3/d/IRYt2nZXOgWH6l5RDhx9
X-Google-Smtp-Source: AGHT+IFNrAPWGxzcsoaQLoabTeny92MuV3z4VFx51LTPkZKLWoAPMlDB5aYM21GbjGHuz92+M8hP8w==
X-Received: by 2002:a05:600c:3489:b0:479:2a09:9262 with SMTP id 5b1f17b1804b1-47d1953dabamr123231785e9.9.1766421036091;
        Mon, 22 Dec 2025 08:30:36 -0800 (PST)
Received: from ta2.c.googlers.com (62.221.76.34.bc.googleusercontent.com. [34.76.221.62])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324eaa4749sm23071258f8f.37.2025.12.22.08.30.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 08:30:35 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Mon, 22 Dec 2025 16:30:08 +0000
Subject: [PATCH v4 4/5] soc: samsung: exynos-chipid: add google,gs101-otp
 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251222-gs101-chipid-v4-4-aa8e20ce7bb3@linaro.org>
References: <20251222-gs101-chipid-v4-0-aa8e20ce7bb3@linaro.org>
In-Reply-To: <20251222-gs101-chipid-v4-0-aa8e20ce7bb3@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766421032; l=5635;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=M/Ht02RXnwpyI8/d82bw2pNNTOH9KcOIpttNOEpsz50=;
 b=0wI3TjHRprHCL0MH4xmRPJElU8StjYDtY2qkStptCp0VsYE/h9uYZem6ZSzBlAAqwPiTmCoj4
 eZhUU35XhVfA61saeDelePzXlNVEEF0o5EqhMfSa1e/APSjAs9qjfVa
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_083037_925549_C54DD79F 
X-CRM114-Status: GOOD (  23.32  )
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
 drivers/soc/samsung/exynos-chipid.c | 70 ++++++++++++++++++++++++++++++++-----
 1 file changed, 61 insertions(+), 9 deletions(-)

diff --git a/drivers/soc/samsung/exynos-chipid.c b/drivers/soc/samsung/exynos-chipid.c
index 5c8660374269c87ec38ebca242918bd7b1d362e5..6ef9751e2509c94bd9625072d0b81ddb93048d4a 100644
--- a/drivers/soc/samsung/exynos-chipid.c
+++ b/drivers/soc/samsung/exynos-chipid.c
@@ -15,7 +15,8 @@
 #include <linux/array_size.h>
 #include <linux/device.h>
 #include <linux/device/devres.h>
-#include <linux/errno.h>
+#include <linux/err.h>
+#include <linux/ioport.h>
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/of.h>
@@ -28,9 +29,11 @@
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
@@ -69,6 +72,8 @@ static const struct exynos_soc_id {
 	{ "EXYNOS990", 0xE9830000 },
 	{ "EXYNOSAUTOV9", 0xAAA80000 },
 	{ "EXYNOSAUTOV920", 0x0A920000 },
+	/* Compatible with: google,gs101-otp */
+	{ "GS101", 0x9845000 },
 };
 
 static const char *exynos_product_id_to_name(unsigned int product_id)
@@ -93,19 +98,53 @@ static int exynos_chipid_get_chipid_info(struct device *dev,
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
+	return devm_regmap_init_mmio_clk(&pdev->dev, "pclk", base, &reg_config);
+}
+
 static void exynos_chipid_unregister_soc(void *data)
 {
 	soc_device_unregister(data);
@@ -127,7 +166,11 @@ static int exynos_chipid_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, -EINVAL,
 				     "failed to get match data\n");
 
-	regmap = device_node_to_regmap(dev->of_node);
+	if (drv_data->efuse)
+		regmap = exynos_chipid_get_efuse_regmap(pdev);
+	else
+		regmap = device_node_to_regmap(dev->of_node);
+
 	if (IS_ERR(regmap))
 		return dev_err_probe(dev, PTR_ERR(regmap),
 				     "failed to get regmap\n");
@@ -177,19 +220,28 @@ static int exynos_chipid_probe(struct platform_device *pdev)
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
2.52.0.322.g1dd061c0dc-goog


