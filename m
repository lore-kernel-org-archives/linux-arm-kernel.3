Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CAB4CEDD8C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 13:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yKYlMIfAWjT0Z4v8dS+9AJxviT6d1hSBxbFdrwjdNQA=; b=IczNniXe8jk95W8nvokrrxa24E
	pcU+VKutuGsbqbBz8SW0nU9oXztG3cV6lPaMvRMBKDQ00mLlOCCtI+gL2PU4jd4bb5oSsqm9tmic4
	0Ga/LyNjhRGjG05TyB3Pe9W7FmaSIjSH4VKJL+KkM2XFTcDCgrtwU0bEBGt1e3ro2I8RZGtm8zqu/
	GOzJxLhwksCPQ4+FDxbpKMYVeQNx0qJwUCAtmEu/yikaXTvQ3NtkNR2kFZL29Y8srQUu+cT+zNrnH
	2+sZXfM8Jv/WN5SlPWZCoYaujuRAWZngGAU4SXBS6c2tWPINXlUOICKyop+c4R769xo1hCbd225kp
	uGr/Z+7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLMCA-00000000VG1-297z;
	Tue, 18 Nov 2025 13:56:34 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLMBy-00000000V2w-2m6k
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 13:56:24 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-42b3c965df5so3278475f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Nov 2025 05:56:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763474181; x=1764078981; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yKYlMIfAWjT0Z4v8dS+9AJxviT6d1hSBxbFdrwjdNQA=;
        b=D9Y73hO63QoFnA5L17vRchfWmo5YJZD1sHFfHWbVew1DFgvTTGSutg8WIqpZNflH6m
         qiCP95hvAMqQ4ZHQAz5ARzMdJYuclY0LxIKqjyGgKjVPkGOaXekXczns3Tfy5OQ5W4Fd
         k5BM+4OSAbJzL9Y8lsle6fIu2P6RC47P8d8R8+0dr93JyHfN5Jr4YacFwibVGvIUYn+u
         sPrKs6iCL1MonvNCb7FAG/FYMyBa7bVK9qCJVfiPQQvHzF0wZbDAE53AY/RmU8gEEjHq
         s+xLUcpQpyLM+WHSD3JlKfJC8UKw8xDkSs8yjqitshP7bfAoJQqtW2aw0rLyl8/Gtwvm
         A2cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763474181; x=1764078981;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yKYlMIfAWjT0Z4v8dS+9AJxviT6d1hSBxbFdrwjdNQA=;
        b=GCOXlXJ7fW8N6ayAnxAdHLb/MLFmzWdamoMt8RXN4dHSk5Ua7397R/oYqn3qKFXOgP
         28EU9XUhb/myulj9NsJkeB5BD4ZXDjtC5gQkBEagZmL7pc7pgRZsAbHiMdQN9xwWK2PJ
         rEXtTPRz4ThgqJcYcYNGDFN9uIUgrc+3vqyUbcZCqcRIQUq/J+Ipq6XHdknSi+09hHBD
         fva9NR34rRaHa7kXZu8jYAQbK26/RVePZd+0dimVPmjWzI6/patcO9qQiAjyA5GqE0lD
         fTDtCbTNXAT7m7uuGcf77tYJ6MJEwcqMhOp67jwwWwC9DATOmp6GPHcXksa2qzU9nHZZ
         lyJw==
X-Forwarded-Encrypted: i=1; AJvYcCVYHF5OK8aDVGFtUbjHnxFonE4Jo36qKwrXhAUKUppNOyifGbwWVGw7A1KjDclc6SH6+Gj+hc1ha4wuLdSfe4vX@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8fNF6RzYmh6pbIVMITf2UcJ50EOdMe72bIK3fgOca4fTIRIvD
	rgAmg4CdEsp117Nl5kzl8s1X60FJeSPYBTDrkyxrYctn8KRS09CCXIwHzacBbSDK3JE=
X-Gm-Gg: ASbGncvs199cNj4CVUNJ15FGL4GUBL1PNcs3DVn7TMtmCy7jEt1Y5udXcubtw8zEqTl
	Nwggf9L0tdiCb+JhA+VgQ20/aZKJOPaCkf9Kz3RxCbIVI6/ffPMiq3D1TyWQ/FQJAxKHbgAEv2g
	zUIp93DjcIyi8fvaRBSJ4bLQ7riklhTaedo0eD/tPaD3XTGiKdnGTgJUwoovVViTk1esZRKxvv7
	/i77UD5o+7RXWUU20MWGdI/OoxYOyqmV+HAOo/jMweD8WUpEih0IussTbmV4+8Wz1TRCeZV6/XC
	M6rY53pXqqx3s7SYqsgdFAfI3R7gr9TIq36BzCHN1cBchupy++ptQbhM16dXKRlGKk2D9NeY9jo
	kW7azPC1z6jG2nbeYLe6V7WLsLKmRvLpuFuoWJtfOAPlC4ZXYcKzwXlkHvENvZB9jC6PO9hL1tT
	pzCZqayktuMg9GMkvsjDl5+2vfMIhZXSAFrmMk6AgbnivUZ04+VTXGwvgoT+nMOWGOaFYQK+cwK
	almbg==
X-Google-Smtp-Source: AGHT+IFLEPtny/4M/qrsELeJqriFmtfSC8sisj+iye0XhMUpxvpy0r10rHp5Vjj+6+CEqyh5vAEHSA==
X-Received: by 2002:a05:6000:186e:b0:429:cbba:b246 with SMTP id ffacd0b85a97d-42b592dccc4mr15022527f8f.0.1763474180971;
        Tue, 18 Nov 2025 05:56:20 -0800 (PST)
Received: from ta2.c.googlers.com (17.83.155.104.bc.googleusercontent.com. [104.155.83.17])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53e7ae16sm32728666f8f.3.2025.11.18.05.56.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 05:56:20 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Tue, 18 Nov 2025 13:56:11 +0000
Subject: [PATCH v2 4/7] soc: samsung: exynos-chipid: use dev_err_probe
 where appropiate
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251118-gs101-chipid-v2-4-e9f1e7460e35@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763474177; l=3298;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=gyjJc742Xp7x3M1wMCcAQq2+Hzs2mbWAJ0525DJRzCk=;
 b=Dkbia94LbiSf/CBO+A1kJVBcYCRosgXFGkXFNUhm+Xo18ZKD9i0afT0aoz5prjd2k8c8oWq+O
 tEsgaKaT06PDq+XRCKwTR2CS+JpUmPQ00PQ9Th9PlQNtlhuRbjlUreJ
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_055622_732672_FFFB74A4 
X-CRM114-Status: GOOD (  15.11  )
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

Use dev_err_probe() to benefit of the standardized format of the error
code (e.g. "ENODEV" instead of -19), to get meanigful error messages, and
for more compact error paths.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/soc/samsung/exynos-chipid.c | 26 ++++++++++++++------------
 1 file changed, 14 insertions(+), 12 deletions(-)

diff --git a/drivers/soc/samsung/exynos-chipid.c b/drivers/soc/samsung/exynos-chipid.c
index db73dfad4e1b4fb001cb653bc8caf8aa08d85f2d..e7dbe1bc45d6af58527125f512c0ff22c03a9629 100644
--- a/drivers/soc/samsung/exynos-chipid.c
+++ b/drivers/soc/samsung/exynos-chipid.c
@@ -87,8 +87,8 @@ static const char *product_id_to_soc_id(unsigned int product_id)
 	return NULL;
 }
 
-static int exynos_chipid_get_chipid_info(struct regmap *regmap,
-		const struct exynos_chipid_variant *data,
+static int exynos_chipid_get_chipid_info(struct device *dev,
+		struct regmap *regmap, const struct exynos_chipid_variant *data,
 		struct exynos_chipid_info *soc_info)
 {
 	int ret;
@@ -96,7 +96,7 @@ static int exynos_chipid_get_chipid_info(struct regmap *regmap,
 
 	ret = regmap_read(regmap, EXYNOS_CHIPID_REG_PRO_ID, &val);
 	if (ret < 0)
-		return ret;
+		return dev_err_probe(dev, ret, "failed to read Product ID\n");
 	soc_info->product_id = val & EXYNOS_MASK;
 
 	if (data->sub_rev_reg == EXYNOS_CHIPID_REG_PRO_ID) {
@@ -108,7 +108,8 @@ static int exynos_chipid_get_chipid_info(struct regmap *regmap,
 
 		ret = regmap_read(regmap, data->sub_rev_reg, &val2);
 		if (ret < 0)
-			return ret;
+			return dev_err_probe(dev, ret,
+					     "failed to read sub revision\n");
 
 		if (data->main_rev_reg == EXYNOS_CHIPID_REG_PRO_ID)
 			/* gs101 case */
@@ -163,7 +164,8 @@ static int exynos_chipid_probe(struct platform_device *pdev)
 
 	drv_data = of_device_get_match_data(dev);
 	if (!drv_data)
-		return -EINVAL;
+		return dev_err_probe(dev, -EINVAL,
+				     "failed to get match data\n");
 
 	if (drv_data->efuse) {
 		struct clk *clk;
@@ -180,10 +182,11 @@ static int exynos_chipid_probe(struct platform_device *pdev)
 	} else {
 		regmap = device_node_to_regmap(dev->of_node);
 		if (IS_ERR(regmap))
-			return PTR_ERR(regmap);
+			return dev_err_probe(dev, PTR_ERR(regmap),
+					     "failed to get regmap\n");
 	}
 
-	ret = exynos_chipid_get_chipid_info(regmap, drv_data, &soc_info);
+	ret = exynos_chipid_get_chipid_info(dev, regmap, drv_data, &soc_info);
 	if (ret < 0)
 		return ret;
 
@@ -202,15 +205,14 @@ static int exynos_chipid_probe(struct platform_device *pdev)
 	if (!soc_dev_attr->revision)
 		return -ENOMEM;
 	soc_dev_attr->soc_id = product_id_to_soc_id(soc_info.product_id);
-	if (!soc_dev_attr->soc_id) {
-		pr_err("Unknown SoC\n");
-		return -ENODEV;
-	}
+	if (!soc_dev_attr->soc_id)
+		return dev_err_probe(dev, -ENODEV, "Unknown SoC\n");
 
 	/* please note that the actual registration will be deferred */
 	soc_dev = soc_device_register(soc_dev_attr);
 	if (IS_ERR(soc_dev))
-		return PTR_ERR(soc_dev);
+		return dev_err_probe(dev, PTR_ERR(soc_dev),
+				     "failed to register to the soc interface\n");
 
 	ret = devm_add_action_or_reset(dev, exynos_chipid_unregister_soc,
 				       soc_dev);

-- 
2.52.0.rc1.455.g30608eb744-goog


