Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E933CCF9FF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 12:56:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2E8O1HVfDYkA0RiCP/aCuaFM9xdalT+JDcjuD9x3xgE=; b=G7kDp5qCOJm4w0HQ4JV8QshX5J
	+t7VTgN6zgbg0z397oN3/+qgEF7XtQi2xaybjq6xTpRrj6pPUe23Za6QeCFsZ7k0ZkIVS720y+Rlh
	aLmdRSzE9It6IyLo6to8nP6NrRYRZCEN1ACtpGx41J04L0LUtti5fbfenJ748YjMOLVuXOOSW9tQP
	/cb2Al17DQlaeZGda7p/Kh5M0K90zOpn0I/7WMQRp+3CyomlO7zH0g1nl+9sgS1Hkxi/QPoVsfqrh
	IAWoC0ZL8CdWMapTgFoj2CXmwuQImhObzCzSpW3o/AjLvnE6xp3eNfFryiE+8s4IODudjyc2b9XHs
	czifq16A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEofz-000000067U8-2AnC;
	Fri, 31 Oct 2025 12:56:19 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEofp-000000067NC-1u9i
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 12:56:10 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-429c4c65485so284334f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Oct 2025 05:56:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761915367; x=1762520167; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2E8O1HVfDYkA0RiCP/aCuaFM9xdalT+JDcjuD9x3xgE=;
        b=LLD+SuAXSJEY6NjQBt3m9OSflXLtAa6WEAgkDlAHuOJ2JsW51H7KIMiCtHIRk6iYRJ
         br54mPWFueszatedG7nSkctwWob1Rzut68QLhysUilOnnP9/5H9UXntyE4TlCVZALe6v
         ql3k+5VabDt+EspCYu3wNBz+iM7Rl+HfnW+98CBNlh7YPuUWt3jhoAgf8OWGpPoDOW2f
         D5aXkhQCW3ma+FLqZ61mDGOpEBfSpT2Yh0ae9VjA+90Uy9ADpc1iJ/KBKii9NlGPI0Ci
         1VFsPG7Zd1LZPd4TJPojHqlBSkBnwPSSQcPlSo8wZNRNd/CpyoR/tpfeJbE+mwhOJW+Q
         ZIYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761915367; x=1762520167;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2E8O1HVfDYkA0RiCP/aCuaFM9xdalT+JDcjuD9x3xgE=;
        b=D9zKwjAW1ejD9torGwJfNqGqWYuKBnvTYHv/3drSl2yhj8ch7BXW1Pa+gbGe/XFaNf
         nGnmE+etE/2CkctVisJ2LsjngO8trQlIHOvU+5zwCxivn8DUuTvBFRmp8jQc2QlViA7V
         1JhfPWIZn9TmJ2u6cj+y2sfEIXSZQ7GDmSM79wbm5GTO5s6N3D90/lCPmbeg0aSpDQiE
         FfHsYpHfqP0oURqHAieYzRlk27mT9zUKMQIoGk8hTT1AJ6nFSPEqsNTcDzO7rMpBnWRs
         C6sxNdVkTLD8pL3SWpn/LjUAJVjVhEoj7/0J34qWuMNqprKbQUhSs8ea1M75go1ZUOHb
         wW3A==
X-Forwarded-Encrypted: i=1; AJvYcCX9U2yTev6zkyw9yZsfZVN3muBnVpk5nhvZ4qjChjitAXXKVdk6VYpTGClUWMmK9+1x2IZHUBBmiwB4pnclMojb@lists.infradead.org
X-Gm-Message-State: AOJu0YywngRoYosnSsepEaVbTvvR/hzvDELh/46+Pa0oUGik9UdWt3zG
	N5Nt5uWKCOE6hvb91498xXM0UuwbhDP+Z57Yny1RfqEMQYqWpJM6fXQf9Oi3CYYdt2Q=
X-Gm-Gg: ASbGncsIsZFnsudwTLu3qT+R0Wf4JK9OJdp9qA7pm9SpNICyZHUzLc0Hp8w1KbNxPia
	U2O+wknBapsWfdO3gML+TljeAm14mIgR6abBWfl02cxsewf1mGFvfY+xoPuLkImON5JcEUAO5Qi
	w6D1hUfivFbfsMhD0rCY/reNwU6C2ZYDiHBwn18WDag3eI2k4KZXwlwoZgNcsNeeL0eSUqIeNZW
	pSCw+vE7j3rKkQcGqAi7/HiK75ZD3eqvRG2Kxz5uagGS3oJyM/eF5nak7My8jOmWD8qeQ/ucmXN
	QyUOFZwYybpJq3lQQ/AjT/fi5e4I50rvzLDQv8Dj/DjjclVdLO0XIGp102zn+tGeHmFHOVGzud4
	d6Wv4MP5MjwVKjvBKQooRm1oErULqh9m4fgqt3JvMWo9PIhZcZoI2qaeG0Y2rflpja6VrH+GzBL
	wg/ajHWt7/K6B8G2gBR/KHBO5BZkEGRWaL/avq1ZVcPwaTLtOKGIY2
X-Google-Smtp-Source: AGHT+IEM0IizIY6zKHHTUoU/7maB6WNMbu7DQNWYaZmsDz61aQ66cg1D8Vspw9HQMEmMkaFXkgjmuQ==
X-Received: by 2002:a05:6000:4813:b0:429:89c2:d933 with SMTP id ffacd0b85a97d-429bd6a661bmr3174422f8f.36.1761915367453;
        Fri, 31 Oct 2025 05:56:07 -0700 (PDT)
Received: from ta2.c.googlers.com (213.53.77.34.bc.googleusercontent.com. [34.77.53.213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47732fe1075sm31814585e9.11.2025.10.31.05.56.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 05:56:06 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Fri, 31 Oct 2025 12:56:04 +0000
Subject: [PATCH 05/11] soc: samsung: exynos-chipid: introduce
 match_data->get_chipid_info()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251031-gs101-chipid-v1-5-d78d1076b210@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761915362; l=4101;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=YpELVcKRbuAd/GhEt+Uw8ZWb+caf7nBbVVxyl3NyrsE=;
 b=UEW6/PQ3Egxk62/OqWjiQypCQ7SA35bhWD5liiLVFOeTb2m9dp8f2u0wl2seB2jO2g9zYq8Fk
 afYP3a8tYFeD0XpzgeLk+q2Cd1vzo0fyR4BP8LIeZPeNIStcCkLZEiC
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_055609_538555_C3C945B5 
X-CRM114-Status: GOOD (  19.11  )
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

Newer SoCs, like GS101, don't have a dedicated Chip ID controller.
The GS101 Chip ID info is available as part of the OTP controller
registers, among other things. For GS101 we will read the Chip ID from
the OTP controller using the nvmem API.

Extend the match_data with a get_chipid_info() method, to allow nvmem
integration.

`struct exynos_chipid_info` is moved to the top of the file to avoid a
forward declaration. The structure is extended with pointers to device
and regmap to allow current implementation to obtain the regmap in the
newly introduced exynos_chipid_get_regmap_chipid_info() method. The
nvmem consumer support that will follow won't use the regmap, and
instead will use the nvmem API. It will need the pointer to the device
to report errors.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/soc/samsung/exynos-chipid.c | 35 ++++++++++++++++++++++-------------
 1 file changed, 22 insertions(+), 13 deletions(-)

diff --git a/drivers/soc/samsung/exynos-chipid.c b/drivers/soc/samsung/exynos-chipid.c
index ab6bdf24a754a0faf974190c1fa1f99735cbef8e..7b1951f28e8d4958ab941af91dab4b0183ceda5f 100644
--- a/drivers/soc/samsung/exynos-chipid.c
+++ b/drivers/soc/samsung/exynos-chipid.c
@@ -26,17 +26,21 @@
 
 #include "exynos-asv.h"
 
+struct exynos_chipid_info {
+	struct regmap *regmap;
+	struct device *dev;
+	u32 product_id;
+	u32 revision;
+};
+
 struct exynos_chipid_variant {
+	int (*get_chipid_info)(const struct exynos_chipid_variant *data,
+			       struct exynos_chipid_info *exynos_chipid);
 	unsigned int rev_reg;		/* revision register offset */
 	unsigned int main_rev_shift;	/* main revision offset in rev_reg */
 	unsigned int sub_rev_shift;	/* sub revision offset in rev_reg */
 };
 
-struct exynos_chipid_info {
-	u32 product_id;
-	u32 revision;
-};
-
 static const struct exynos_soc_id {
 	const char *name;
 	unsigned int id;
@@ -80,13 +84,19 @@ static const char *product_id_to_soc_id(unsigned int product_id)
 	return NULL;
 }
 
-static int exynos_chipid_get_chipid_info(struct regmap *regmap,
-		const struct exynos_chipid_variant *data,
+static int exynos_chipid_get_regmap_chipid_info(const struct exynos_chipid_variant *data,
 		struct exynos_chipid_info *exynos_chipid)
 {
 	int ret;
+	struct regmap *regmap;
 	unsigned int val, main_rev, sub_rev;
 
+	regmap = device_node_to_regmap(exynos_chipid->dev->of_node);
+	if (IS_ERR(regmap))
+		return PTR_ERR(regmap);
+
+	exynos_chipid->regmap = regmap;
+
 	ret = regmap_read(regmap, EXYNOS_CHIPID_REG_PRO_ID, &val);
 	if (ret < 0)
 		return ret;
@@ -112,7 +122,6 @@ static int exynos_chipid_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct soc_device *soc_dev;
 	struct device_node *root;
-	struct regmap *regmap;
 	int ret;
 
 	data = of_device_get_match_data(dev);
@@ -123,11 +132,9 @@ static int exynos_chipid_probe(struct platform_device *pdev)
 	if (!exynos_chipid)
 		return -ENOMEM;
 
-	regmap = device_node_to_regmap(dev->of_node);
-	if (IS_ERR(regmap))
-		return PTR_ERR(regmap);
+	exynos_chipid->dev = dev;
 
-	ret = exynos_chipid_get_chipid_info(regmap, data, exynos_chipid);
+	ret = data->get_chipid_info(data, exynos_chipid);
 	if (ret < 0)
 		return ret;
 
@@ -156,7 +163,7 @@ static int exynos_chipid_probe(struct platform_device *pdev)
 	if (IS_ERR(soc_dev))
 		return PTR_ERR(soc_dev);
 
-	ret = exynos_asv_init(dev, regmap);
+	ret = exynos_asv_init(dev, exynos_chipid->regmap);
 	if (ret)
 		goto err;
 
@@ -182,12 +189,14 @@ static void exynos_chipid_remove(struct platform_device *pdev)
 }
 
 static const struct exynos_chipid_variant exynos4210_chipid_data = {
+	.get_chipid_info = exynos_chipid_get_regmap_chipid_info,
 	.rev_reg	= 0x0,
 	.main_rev_shift	= 4,
 	.sub_rev_shift	= 0,
 };
 
 static const struct exynos_chipid_variant exynos850_chipid_data = {
+	.get_chipid_info = exynos_chipid_get_regmap_chipid_info,
 	.rev_reg	= 0x10,
 	.main_rev_shift	= 20,
 	.sub_rev_shift	= 16,

-- 
2.51.1.930.gacf6e81ea2-goog


