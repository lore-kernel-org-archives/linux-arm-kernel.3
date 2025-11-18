Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D28CACEDD91
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 13:56:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=krmSxhstA40QKaUa91FcpQEPCxCXSSQwFp3fjsLx65I=; b=0AHIuu4wy/40xvdpyQ+6thF+Gd
	rmZ2VJMC6WWf8Gdf/AfsackKOXVWRz0ALUWyduKc+kwwjAp5eR7gX/9nf5AeeE8wGPNwSg/B3zc08
	phGoVTYwHjx8UBy3jNENIT40vDQHlZNCk9QF8rMPMS1U8KSV8qeR3YFiRAGM7bV/hw0kPuBSQ8d8/
	VFbz5gxsGxPCJMepLx7daixMrwb2Irm6TsDUab8zPQMlqZVxRoPecMYcJemhYfZDAJ3MdxOcCPTFt
	K16C5YyOWWSXx39ma8EKu/MehLm5THRz6hMli/FZM1yhEP/u2wR9EkRdz0+iMDbq+exOsTsmrtLr7
	xhs9yflA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLMC5-00000000VBR-1PXD;
	Tue, 18 Nov 2025 13:56:29 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLMBx-00000000V1Q-26yF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 13:56:22 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-42b427cda88so3953204f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Nov 2025 05:56:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763474180; x=1764078980; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=krmSxhstA40QKaUa91FcpQEPCxCXSSQwFp3fjsLx65I=;
        b=lqzdV8QmJ3vjP2eIo7FMbxAngqa6MVlD5lrfBn9Q8VFIIc744gJBmflZJVGNoS5DmA
         Q7uLM7OiWnQBgOuDAM3CSrnIUggQFQuylYN+o7mFIQSLYDS2JMxJ3h0rbSm3g3F+LB2V
         g8sx2QBLd82EIqNfpa2vbwLLydwsy/QCeMe9K1E0BtDeyQtVnuyhxBpwHjmYTdw3ch/Z
         NFA9yTs9v52r5HpXuUGDP55jQEO7upGxcFUg9rQyTVld/k+xYdhXlXAqZhjloXNzOxMG
         0p46pXSbw+kAiyK1Xn8/L2wSLsSz789TCLYeRidgBTEQzZoZwLBOWOVIngvd27j5nnx8
         /KPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763474180; x=1764078980;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=krmSxhstA40QKaUa91FcpQEPCxCXSSQwFp3fjsLx65I=;
        b=ckRTCJWGgdCgwQLRsNfpltBiZz8xWabhPZKTjrA9jytE5cg//RYuELu9DLVD6N+oug
         3Yk1aKJiJEmBGozacOsQCj9PFoZb73vsAtustmbufrwQS2Tm12LRhllvoU71lbOuL3I9
         EQs/8NWWe/shNIe9Pv3oJ2GADW3jbBErb97E7ij6xmBR+WsEaA/i5o1QMM2WVfaAXDMF
         LzJnPBLBGsqM66mssk4AIgNs6jgdtWPkmHznQOYlj+rd68hrLJBzURYzTJ58ewTdnkIF
         0MQRGyRkWmCGa+75iafF4EU0hpAJ+cF0xtiwBuABw0WNhmVloTsmDX2AlpKRDtUezUIG
         z83g==
X-Forwarded-Encrypted: i=1; AJvYcCUHYF1bmDCZpouzxgysj/fzl/hC/pom0zLcTtd9LAAjMT5RVrC0FKdVE1R7sfAKSQtTRIYfa7cxPQWLmw2JfU50@lists.infradead.org
X-Gm-Message-State: AOJu0YwAnRBiPGAzgvDvQ8pLMJpEdCi7NGJhjAtV3NQt+Tn4Un11qbGh
	Zxc3t6LgIKKDBFvUTH8pLq9DAWOIw+HTb64pWYFD0T+vTohgsnNtTiXj9+5ngFXGOjH+hapnxfZ
	/UZfrw6M=
X-Gm-Gg: ASbGnct1gzvinQOlCWa5+CWacjaKsb2+9W4ItfXhF2V6DNFNjjiwfXEd9jtfrtNea5C
	QiyUHfD5u78jNVZfENv3YkE+1W60VQz2vtwWzXSqrxAqEI7GT7fOguwpmT2qvrDKpZ9OkPqtcsK
	NfOgeboNxSYPx7nsTOJ/Eqg2faPLlifxsqLnz5F2Kdb6I0hLs5gyWWXr6car9O5FMMKGCDqcXls
	rAg/yGkMNe+2G+XzIecafUIrXaN9Uu9uKw9lN66iJ954ccNujqBa/GLRg7UvgvQLRSj0M17H0X9
	GnPeZeh0E5Aqpi8kdpp/e6ksxwushdN1R9vSGjAQ3XyehAsVtwI6IkuK7pGtfE6xxYiVkDhgq/A
	Es06DvadAzTxq58h+Xm7cCEXMuQf078i6FreKQDQTxDEAmAMqo7pZVwWEoNjCSlOIbXFymKTOmf
	Qi9m5uN+8NgV4UZeYJxfP0JX/XiZnfAz86L8i3a3gqUA9vSHnA/X8DoAIyTKlqTT/MsKnJjyWGV
	j2rbw==
X-Google-Smtp-Source: AGHT+IFAvpSIo5Boh9uZGNRz1jnPH4zVkRyDa+XU94Z/sZjJKjAL+c0xF0VcYKBmnlzP3uQx4J36ZQ==
X-Received: by 2002:a05:6000:2dc8:b0:429:d40e:fa40 with SMTP id ffacd0b85a97d-42b5937324cmr15236841f8f.45.1763474179646;
        Tue, 18 Nov 2025 05:56:19 -0800 (PST)
Received: from ta2.c.googlers.com (17.83.155.104.bc.googleusercontent.com. [104.155.83.17])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53e7ae16sm32728666f8f.3.2025.11.18.05.56.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 05:56:19 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Tue, 18 Nov 2025 13:56:09 +0000
Subject: [PATCH v2 2/7] soc: samsung: exynos-chipid: add google,gs101-otp
 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251118-gs101-chipid-v2-2-e9f1e7460e35@linaro.org>
References: <20251118-gs101-chipid-v2-0-e9f1e7460e35@linaro.org>
In-Reply-To: <20251118-gs101-chipid-v2-0-e9f1e7460e35@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763474177; l=5916;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=p4ZObKdORDPs9HTtQcCqfM4Dt9UYXjFKiNvgoGM8eUg=;
 b=LgZlOadmjkQB7OdfDpvgPkVbF7pYjTLOuPDsVJbWNZP7uMGPhhsOLuzdntKh28msuquJ/TRVv
 i0HyigF3mGIALH+Q3JnnxQb5bAsptf+gjuhHFJ+IHOd9/Zjx4XEZM4w
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_055621_586104_00DE95E5 
X-CRM114-Status: GOOD (  25.50  )
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
 drivers/soc/samsung/exynos-chipid.c | 86 ++++++++++++++++++++++++++++++++-----
 1 file changed, 75 insertions(+), 11 deletions(-)

diff --git a/drivers/soc/samsung/exynos-chipid.c b/drivers/soc/samsung/exynos-chipid.c
index d3b4b5508e0c808ee9f7b0039073ef57915d60fc..8904ffdaf9a6f6d069cc6af18a24dd00a2780892 100644
--- a/drivers/soc/samsung/exynos-chipid.c
+++ b/drivers/soc/samsung/exynos-chipid.c
@@ -13,8 +13,11 @@
  */
 
 #include <linux/array_size.h>
+#include <linux/clk.h>
 #include <linux/device.h>
-#include <linux/errno.h>
+#include <linux/device/devres.h>
+#include <linux/err.h>
+#include <linux/ioport.h>
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/of.h>
@@ -27,9 +30,11 @@
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
@@ -68,6 +73,8 @@ static const struct exynos_soc_id {
 	{ "EXYNOS990", 0xE9830000 },
 	{ "EXYNOSAUTOV9", 0xAAA80000 },
 	{ "EXYNOSAUTOV920", 0x0A920000 },
+	/* Compatible with: google,gs101-otp */
+	{ "GS101", 0x9845000 },
 };
 
 static const char *product_id_to_soc_id(unsigned int product_id)
@@ -92,18 +99,52 @@ static int exynos_chipid_get_chipid_info(struct regmap *regmap,
 		return ret;
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
 			return ret;
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
 static int exynos_chipid_probe(struct platform_device *pdev)
 {
 	const struct exynos_chipid_variant *drv_data;
@@ -119,9 +160,23 @@ static int exynos_chipid_probe(struct platform_device *pdev)
 	if (!drv_data)
 		return -EINVAL;
 
-	regmap = device_node_to_regmap(dev->of_node);
-	if (IS_ERR(regmap))
-		return PTR_ERR(regmap);
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
+			return PTR_ERR(regmap);
+	}
 
 	ret = exynos_chipid_get_chipid_info(regmap, drv_data, &soc_info);
 	if (ret < 0)
@@ -177,19 +232,28 @@ static void exynos_chipid_remove(struct platform_device *pdev)
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


