Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D972FCCF9FE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 12:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2aK59j1ErAGwj9CcBo7BjIb+jh09BV6QpI7OzF04L64=; b=yrvlEnD1Lj9tWQ+00cBw9OlDu4
	8D9v68ip/85Yo17Th0+dn5rNN74zeSUvSHHfM+vVzyfNlrdYUbBYlEDCSIFxhFjbYJisOhenAl0sE
	1YDG9GkdLdrCS3UwA+byClRsnWq6zYdOo0ZV3cWIYxeHy7dAoQHNSjvATPBnV2cYH22cnpeJjuoVN
	7fecr9CW9ydh2jD5/8rleSUU0gnz8JGqk7YXTyy6nJ67mgp9USL+NK6CwC4Hw/RCA3GEdvMkPECwg
	jIQbErIRV3m9rys+uenHVJ8yAuOs9a2E+gjE+17cipvVleBdpulYtXM+i3Np9crLTs+FlBOGzKljM
	XXHQir2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEofy-000000067Sq-2UyX;
	Fri, 31 Oct 2025 12:56:18 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEofm-000000067Lg-3JIA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 12:56:07 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-475ca9237c2so12467775e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Oct 2025 05:56:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761915365; x=1762520165; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2aK59j1ErAGwj9CcBo7BjIb+jh09BV6QpI7OzF04L64=;
        b=Ng993ntXnbK42NZltmTSzPve0vBwovoD92l3ERTveUScxOEJyN1HBHVGOtC5jRIPex
         /loRhG8mk1u1xdKZPt/WlKlhSyIn6pOqAcugZLCqx+DXZziPGkFDrQniog3uESM+Mdgm
         U1tif56wK1xiiTIVej4drH9fJQF30erz0pLqaJpcVBrL3WzFAI5s7CJu2qGW4XSLLOFt
         xYIaNCr2KSIDzqACdo9MePeuXXhcE4mCtm7ZFxUol2B4eZB/rh7XrXLaCbhgw71IyBG7
         7esrtfkBSbu9APJH7vB2sH/4xOo+58jb0idlnDImUU7sU1nASMlYuSDsNB90Vt6D9DFp
         Owxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761915365; x=1762520165;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2aK59j1ErAGwj9CcBo7BjIb+jh09BV6QpI7OzF04L64=;
        b=wWbk6jdLEeDmwiuStiugfaiNvT9zChOcOdl9vCe6bXcFqdfoPq73upvQz76Yk3PzQq
         26ig0odyVowdSlf31+o2bBZuJra4ljULBO41PgCuHou4AK8AGmCTbo2cHbNePhg9D6KH
         GG6p64qPkWXwbJlIsCu85EfxTslEFCR1lDzjkR310cD/ywJHvA7yWWu5dJRR91Ng1Xuq
         TTvCmIlyiJ9cXh4tPNBMTYucHLpOAzMsmrAivo0mUNdDUISfQOa7x2TNN5OhLV58gUaW
         z63LP+aXW8FP5XBX+kVcCWni3LI3OLuOHIokSUV81ceAh+yW+QWieUA9m0NhBZ4iPsz2
         OSpA==
X-Forwarded-Encrypted: i=1; AJvYcCX9eT0MboA6fg3xQAafbc3oc/aE1pAayFCOQ0ZUKb3Df5F7ta1JERdK+jcZdknmDFD7C2E0DvbZvT9BNHbLL0KK@lists.infradead.org
X-Gm-Message-State: AOJu0YyJrb+REwW5V8zBg0fZpwCMWoJTXUMqNCfJjOn+YM0Y6Vzv37uq
	zDHq4A2zs1ZvyzkMEW1D9fw84uNAEXyq8SqBy02Ze8MOgzNZ8BvahGPw+o3OFXdsBl4=
X-Gm-Gg: ASbGnctWsxaP37CtN5H4BPo+xZmA0hxD7o3OMu2xKzC2kj7O2cq/2WaPYT91JP5/nry
	fOzOcqwcccNOIkTYedxIrWFQC8ncxDaBXPffXCS/BR3yG+lUeYXUznGT4nzOpwo/3a6cowGOQWl
	YIxzT0PakznqqMvdCJv4MY1WC1fdaDQ7HcN+hkVlFSTZSF7nZmxCHcd1zN7hG1JAEOowYHDNJtt
	6rLd20fZDLxPScmotyFk8q3Dap9XKmBaSqpHbYfZ3yAWfpmGp70cyjpFwpVz62rv+QT/2ubksJN
	yHVjLg7X3zQfGr3HOTSbIVJqjzlU3JSiGzC4L23zgaGuA6pBH0GV1tNhVhz/F2Ly++Tj/QALXfF
	eNPNyJ0+96eYPlrnMVseKXoplmy0ginUjOzoEDJjWYgTGUAuPyhRGKrXXaHi4AFWMSQ3+6tsCmj
	JUcTlTQUHXlEJm1qOoOLBIh7bWp04oD+f3qM8qHNtnsNRjr3xJZ6pU
X-Google-Smtp-Source: AGHT+IEen8rgH8y7zo72nmcazSBpBM/gAUMmQggkgYQ2cpkTx7B7kTbDS6/45ddfno1IY5QEnPSQJQ==
X-Received: by 2002:a05:600c:5021:b0:477:1709:1f32 with SMTP id 5b1f17b1804b1-4773087266fmr25975815e9.26.1761915364886;
        Fri, 31 Oct 2025 05:56:04 -0700 (PDT)
Received: from ta2.c.googlers.com (213.53.77.34.bc.googleusercontent.com. [34.77.53.213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47732fe1075sm31814585e9.11.2025.10.31.05.56.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 05:56:04 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Fri, 31 Oct 2025 12:56:01 +0000
Subject: [PATCH 02/11] soc: samsung: exynos-chipid: use a local dev
 variable
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251031-gs101-chipid-v1-2-d78d1076b210@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761915362; l=2538;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=WFBXv1nyzbfw8zq+ghHGpCgVYngil2VfWMf3BgFxbsY=;
 b=QAW3wttm1FRERcy6yo9M/wXhR8vnpJD3NM/zeyw5mPRiA76Sag5UI/o7TUwkB0LqIEVC4cDVu
 cutaZOoGKzzD6K6kvEKA4luo67bc7xnKrARcCebzI1DVxlOHjiQLoeF
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_055606_852430_8A7723D2 
X-CRM114-Status: GOOD (  12.86  )
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

Use a local variable for struct device to avoid dereferencing.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/soc/samsung/exynos-chipid.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/soc/samsung/exynos-chipid.c b/drivers/soc/samsung/exynos-chipid.c
index 0f9f83a006795df08dae556ef37c2b78bd599ef5..d3b4b5508e0c808ee9f7b0039073ef57915d60fc 100644
--- a/drivers/soc/samsung/exynos-chipid.c
+++ b/drivers/soc/samsung/exynos-chipid.c
@@ -109,16 +109,17 @@ static int exynos_chipid_probe(struct platform_device *pdev)
 	const struct exynos_chipid_variant *drv_data;
 	struct exynos_chipid_info soc_info;
 	struct soc_device_attribute *soc_dev_attr;
+	struct device *dev = &pdev->dev;
 	struct soc_device *soc_dev;
 	struct device_node *root;
 	struct regmap *regmap;
 	int ret;
 
-	drv_data = of_device_get_match_data(&pdev->dev);
+	drv_data = of_device_get_match_data(dev);
 	if (!drv_data)
 		return -EINVAL;
 
-	regmap = device_node_to_regmap(pdev->dev.of_node);
+	regmap = device_node_to_regmap(dev->of_node);
 	if (IS_ERR(regmap))
 		return PTR_ERR(regmap);
 
@@ -126,8 +127,7 @@ static int exynos_chipid_probe(struct platform_device *pdev)
 	if (ret < 0)
 		return ret;
 
-	soc_dev_attr = devm_kzalloc(&pdev->dev, sizeof(*soc_dev_attr),
-				    GFP_KERNEL);
+	soc_dev_attr = devm_kzalloc(dev, sizeof(*soc_dev_attr), GFP_KERNEL);
 	if (!soc_dev_attr)
 		return -ENOMEM;
 
@@ -137,8 +137,8 @@ static int exynos_chipid_probe(struct platform_device *pdev)
 	of_property_read_string(root, "model", &soc_dev_attr->machine);
 	of_node_put(root);
 
-	soc_dev_attr->revision = devm_kasprintf(&pdev->dev, GFP_KERNEL,
-						"%x", soc_info.revision);
+	soc_dev_attr->revision = devm_kasprintf(dev, GFP_KERNEL, "%x",
+						soc_info.revision);
 	if (!soc_dev_attr->revision)
 		return -ENOMEM;
 	soc_dev_attr->soc_id = product_id_to_soc_id(soc_info.product_id);
@@ -152,13 +152,13 @@ static int exynos_chipid_probe(struct platform_device *pdev)
 	if (IS_ERR(soc_dev))
 		return PTR_ERR(soc_dev);
 
-	ret = exynos_asv_init(&pdev->dev, regmap);
+	ret = exynos_asv_init(dev, regmap);
 	if (ret)
 		goto err;
 
 	platform_set_drvdata(pdev, soc_dev);
 
-	dev_info(&pdev->dev, "Exynos: CPU[%s] PRO_ID[0x%x] REV[0x%x] Detected\n",
+	dev_info(dev, "Exynos: CPU[%s] PRO_ID[0x%x] REV[0x%x] Detected\n",
 		 soc_dev_attr->soc_id, soc_info.product_id, soc_info.revision);
 
 	return 0;

-- 
2.51.1.930.gacf6e81ea2-goog


