Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AB79CCFA05
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 12:56:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AwIK/V4pnfd3q3cRM1eF0IWydHjyhl1l5vitzaGuW2U=; b=TUXvnEWsyivBJkYeM2/Rl1Kjcx
	KFfgs92mJGHyNHy01frBjSeyVN+Go5zHkYriYgNvrh3ZhqyZzfvC9yjBn270+YgLMExwd8PUqxadK
	wPGcjrupZUqm44cGeVOzeXxPGdTKEv0eAEiH6+G6TwjIGKHv1lWvj+zUD5NQN+qhdl8Mwl70k8rom
	cyelJE2zFyf3o+rhwLCL3DNJgkaX4bz173ZQaqeS80QTJQWZuokdXk8ICi+MOhoiVrUGNE9krhOs6
	cUpybQToU59gYIIQnSk7sAEbOowP022U7wOYxupDznyOWQBeEcg0ZzefDYKciCSmbrXLglFamQhY8
	SD8gkVXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEog0-000000067V1-0j5K;
	Fri, 31 Oct 2025 12:56:20 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEofq-000000067OR-3Nqb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 12:56:12 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-471191ac79dso24608355e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Oct 2025 05:56:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761915369; x=1762520169; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AwIK/V4pnfd3q3cRM1eF0IWydHjyhl1l5vitzaGuW2U=;
        b=BGN7W8AA5tyvuwiqealghxois3sZSVNWg+23/7NQ2usJdM9zeJxDVP3UDnQVfsxIEE
         dax/DY14rc/fyJ/1uu3RoX4mMDhyxsy+Ck0h2lwuUVQ0ji27//UMgBqUQYQ01kL0JS9Y
         wXGAYs1Q7fB4A31lmtVN9hp5mfZaYOxhKeV2rRNmdTxolLcVKSGP5CAZyMsvrLA6dGYW
         uPYDm93sAEJiACY6MxVwVMNINthCqAlauuTDoOWYqmNEckByXcW/jo+A+LMKMH889dgK
         ZF1hEXvayeich5ehpGje/dwE3hQXrZVJPyDeIYGRmJnJCB0lJ7YbNWxSnMfPCXWRKdxb
         YQvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761915369; x=1762520169;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AwIK/V4pnfd3q3cRM1eF0IWydHjyhl1l5vitzaGuW2U=;
        b=M8F77QS07ShWtVFkxvqshwQ0CfugSESXBKjYLR0XO5rharo+EZ65Dn96hP3HJwVWaH
         prPFF3vSAyhzt55T03yQ42Se3du615BkQASUW6Sg6eF07aszDbHoaFuMr1iQHuG/OWRF
         EJ6WvpVJB01PH6k/0MBVgceX5RGUaXg35QtEup5MP6Aomn7QUKlm1jnGntYLOxNAqQ2C
         Gv3AzLfE4dR2mH93IEAYAYxgFWDYB31KPoGYnpRmQHE2RUEhhRmAeakgZmDWnIGzEApz
         zKyTKDbROUJpl1baYykbn0ylfByuCPs2dV12MKcpUlG6RrPc0M+1I12gOgiLvsu5I6Yx
         PAoA==
X-Forwarded-Encrypted: i=1; AJvYcCX6N+r/8xuTeQwZY8a3mCeneWTKvNaywTimhjBb38urHc+6O9KoVsw7p81yUpbhnhqjXMvYYCV+WzrVt01L2se8@lists.infradead.org
X-Gm-Message-State: AOJu0YxLuzaXd/XM3O4+KCM068P1kwa/2YTUlgkuvBQy9o2kdBU8tDP6
	pX8XGqpRd7EcI+ePBZmGHiVHrBcczG3ZfMZ22LpiZsQ23V7OCPNxnnfXOJgEvA444Rc=
X-Gm-Gg: ASbGncvVOLlaBn0lJ+VvhQiXtD3HXXhGnVUendhCr7Jksga0hGxW9gho7+ucNTgzYm3
	qa/D/hCyFt/YlQLSZzkPMKQiuGCOLodJ3LWAtqVCuspnQaZR3D5jxXOpX5zbGwnRhf43+VQ1Xb2
	WNPul2oReJRZqUYKXI28bvWcjdoFGE2qKjdQFzQCwrwuoDtmB5bkPbQSPj+ieKxlqhNxQQTdSuC
	3TcEvslbPXjv3P0E60LwTFks3w6qNf//dhWBpmOEi7OSYu42zs4GpCFMXUmKBuIK3xF/TgrBPo3
	I0pv++e9fA6sN52emomkc3/InAWLDe9UQ3LBqjnTrepim02J0dFqdxzZPCMBJwG67n0qkz8x0/+
	xR9xTX0HMnKk+xrb3p0FdBdD1Bin26x9vSGz+SdUtMnLZWdLS4X5Hn92zKJpHWqoehtJyuBFSvF
	d9EZyHxf+8CKnnnWMx9HawkKdsKZnSUfmIO60tSGmRo1ZQ9XHhjek/1INpWro+twE=
X-Google-Smtp-Source: AGHT+IFt/W8OfN0wmotc2k2dZiu/wdYB093masEn025f2GkQDw06G564MPjZck4rgVdGwtFbw/tSNg==
X-Received: by 2002:a05:600c:358d:b0:46d:b665:1d95 with SMTP id 5b1f17b1804b1-4773b1fb273mr5102695e9.32.1761915369135;
        Fri, 31 Oct 2025 05:56:09 -0700 (PDT)
Received: from ta2.c.googlers.com (213.53.77.34.bc.googleusercontent.com. [34.77.53.213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47732fe1075sm31814585e9.11.2025.10.31.05.56.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 05:56:08 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Fri, 31 Oct 2025 12:56:06 +0000
Subject: [PATCH 07/11] soc: samsung: exynos-chipid: add support for
 google,gs101-chipid
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251031-gs101-chipid-v1-7-d78d1076b210@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761915362; l=4142;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=qrePO2TK/xL/G9ZFtgdmHMhzoS09DkAF2L3GWw8CmWM=;
 b=hXnqliaCMtZnuuW9qt7shGlniwBylvdPQspx1a5Nl22QLeoTw3pMOicddtAPTuVX2e3cN6Wuc
 qURFvBTuIWlDmEKKbpcfO9tnJFNcQWFRXrBpaxzeMi114ttbt659pry
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_055610_913823_888DAC80 
X-CRM114-Status: GOOD (  16.35  )
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

GS101 reads the Product ID and the Chip ID from the OTP controller
registers. Add suppot for google,gs101-chipid.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/soc/samsung/exynos-chipid.c | 76 +++++++++++++++++++++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/drivers/soc/samsung/exynos-chipid.c b/drivers/soc/samsung/exynos-chipid.c
index 5678bc85c4d93547e446caade64a0b650d06a332..9c43c615167e4bbf15d00d42c2e52cc64d7dae1a 100644
--- a/drivers/soc/samsung/exynos-chipid.c
+++ b/drivers/soc/samsung/exynos-chipid.c
@@ -13,10 +13,12 @@
  */
 
 #include <linux/array_size.h>
+#include <linux/bitfield.h>
 #include <linux/device.h>
 #include <linux/errno.h>
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
+#include <linux/nvmem-consumer.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
@@ -26,6 +28,11 @@
 
 #include "exynos-asv.h"
 
+#define EXYNOS_GS101_MAIN_REV		GENMASK(3, 0)
+#define EXYNOS_GS101_SUB_REV		GENMASK(19, 16)
+#define EXYNOS_GS101_CHIP_ID_SIZE	16
+#define EXYNOS_GS101_PRODUCT_ID_SIZE	4
+
 struct exynos_chipid_info {
 	struct regmap *regmap;
 	struct device *dev;
@@ -73,6 +80,8 @@ static const struct exynos_soc_id {
 	{ "EXYNOS990", 0xE9830000 },
 	{ "EXYNOSAUTOV9", 0xAAA80000 },
 	{ "EXYNOSAUTOV920", 0x0A920000 },
+	/* Compatible with: google,gs101-chipid */
+	{ "GS101", 0x09845000 },
 };
 
 static const char *product_id_to_soc_id(unsigned int product_id)
@@ -85,6 +94,66 @@ static const char *product_id_to_soc_id(unsigned int product_id)
 	return NULL;
 }
 
+static int exynos_chipid_get_efuse_data(struct device *dev,
+					const char *nvmem_cell_name,
+					u32 **efuse, size_t *size,
+					size_t expected_size)
+{
+	struct nvmem_cell *cell;
+
+	cell = nvmem_cell_get(dev, nvmem_cell_name);
+	if (IS_ERR(cell)) {
+		dev_err(dev, "no \"%s\"? %ld\n", nvmem_cell_name,
+			PTR_ERR(cell));
+		return PTR_ERR(cell);
+	}
+
+	*efuse = nvmem_cell_read(cell, size);
+	nvmem_cell_put(cell);
+	if (IS_ERR(*efuse))
+		return PTR_ERR(*efuse);
+
+	if (*size != expected_size) {
+		dev_err(dev, "Invalid efuse data size %zu\n", *size);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int exynos_chipid_get_efuse_chipid_info(const struct exynos_chipid_variant *data,
+		struct exynos_chipid_info *exynos_chipid)
+{
+	struct device *dev = exynos_chipid->dev;
+	size_t product_id_size, chip_id_size;
+	u32 *product_id, *chip_id;
+	u32 main_rev, sub_rev;
+	int ret;
+
+	ret = exynos_chipid_get_efuse_data(dev, "product-id", &product_id,
+					   &product_id_size,
+					   EXYNOS_GS101_PRODUCT_ID_SIZE);
+	if (ret)
+		return ret;
+
+	ret = exynos_chipid_get_efuse_data(dev, "chip-id", &chip_id,
+					   &chip_id_size,
+					   EXYNOS_GS101_CHIP_ID_SIZE);
+	if (ret)
+		return ret;
+
+	exynos_chipid->product_id = product_id[0] & EXYNOS_MASK;
+
+	main_rev = FIELD_GET(EXYNOS_GS101_MAIN_REV, product_id[0]);
+	sub_rev = FIELD_GET(EXYNOS_GS101_SUB_REV, chip_id[3]);
+	exynos_chipid->revision = (main_rev << EXYNOS_REV_PART_SHIFT) | sub_rev;
+
+	kfree(product_id);
+	kfree(chip_id);
+
+	return 0;
+}
+
 static int exynos_chipid_get_regmap_chipid_info(const struct exynos_chipid_variant *data,
 		struct exynos_chipid_info *exynos_chipid)
 {
@@ -191,6 +260,10 @@ static void exynos_chipid_remove(struct platform_device *pdev)
 	soc_device_unregister(soc_dev);
 }
 
+static const struct exynos_chipid_variant gs101_chipid_data = {
+	.get_chipid_info = exynos_chipid_get_efuse_chipid_info,
+};
+
 static const struct exynos_chipid_variant exynos4210_chipid_data = {
 	.get_chipid_info = exynos_chipid_get_regmap_chipid_info,
 	.rev_reg	= 0x0,
@@ -209,6 +282,9 @@ static const struct exynos_chipid_variant exynos850_chipid_data = {
 
 static const struct of_device_id exynos_chipid_of_device_ids[] = {
 	{
+		.compatible	= "google,gs101-chipid",
+		.data		= &gs101_chipid_data,
+	}, {
 		.compatible	= "samsung,exynos4210-chipid",
 		.data		= &exynos4210_chipid_data,
 	}, {

-- 
2.51.1.930.gacf6e81ea2-goog


