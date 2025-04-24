Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C8B9C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 20:39:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=idgVGL6g4QaZWwBvT7pD7vd7IkM4X5ShmrP8Se1lMVw=; b=MIoEEL5i5z1QXb8t1VAK1P51pg
	vzLvIDXGmzkE9Boh96D+EZpdekhUH9SCQe1lB94CbNFije3sH3gp+QwDjYjvdyg0hB0pY2F/0s1nf
	5/OPNGW8ATLiDQhrYG6znWpPirm621Ik5itQYorOSepQ0bFlRI0A8uXaBPJ1LYpkWXbOLeRSsIwWo
	fWKTsroCpy+sjILBz98HSc7LK7NH8E6XCUv9qwR2qZTT503THl3u975iD5G++N8z1g5QbmYChU6xk
	bU4hbYVOUw/jmFbK4pGeklMa8XgRVq5rcQlmlcLc3W/yQa/TKfLxX6ye4uJg5rVng4J7XPlLGNAK/
	Z+CQ8NCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u83LW-0000000FM4s-0OQt;
	Thu, 24 Apr 2025 20:38:58 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u83G2-0000000FLej-3cEZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 20:33:20 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-3913290f754so173236f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Apr 2025 13:33:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745526797; x=1746131597; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=idgVGL6g4QaZWwBvT7pD7vd7IkM4X5ShmrP8Se1lMVw=;
        b=iW5sqfiSmYJ9qVi/SRUrQfh+Rrg7Zxs4EQqBftgUzygYdylaeu1pS028DuOpuUBeSW
         NG1Z2zPpkQqXsizCeOZw8L9LLETRbW7uWq/b3ZoZT3SyclWvIfdS2oXCpvwZqMAc1u9h
         8NW7bD+ycPNtTvsUEJE93pCUCZv5pwCu7FMCP+XebyFL+/OjXmW0Hy14oB392/AjOV7r
         lJBfIGpua8zptASw5VlwXSo2IrWfBdhyb5R06rZkYAGkO3GvcrD5bJDf7JVUR16I6OsP
         T87gO0JnqjkaqBLP0Z/0WmrSqa26yUVCTM+/QjpGfT0tWWDTGz1DY4ESx5YjLkNGKqWf
         S7Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745526797; x=1746131597;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=idgVGL6g4QaZWwBvT7pD7vd7IkM4X5ShmrP8Se1lMVw=;
        b=Ne61LAbM+K/oW2IYiRxgCROxjpIeWavM5L9Tnvol3skEVxq59ooMuZ7ysJl2MzVzDa
         iVJugVszh/zz/xbPFZRFp+HZ3jptVRV1Ixd3wd9Dk9CApbWjoGnjPdTcVCvAH9eOwCiQ
         rEawXih697ZiHnyjJRnEx1DiGq0KqdVY8W/tU2UQOU1P57HE9xcmGj863rPNrVZK7ZsB
         vyRfcBy5UxgLth38XbmDg7PI8hd1Zb0MTsSJDBqeXW2cAAkZcbRu3scyLnkSe0LhICDU
         lRLAcjj4FQa270cIDJdk/gz5+hb+Ute6KDUDv4GIHZNGBM+ODxiXEg05JsOFuYrPsTNV
         5oHQ==
X-Forwarded-Encrypted: i=1; AJvYcCXgj4nehkJRmuUKtbJhhHJ3SiM8Q3E09PP0r3WM8jNict8s67cRAixF6svEgopmr14y2XWVZmZ1X6m813r6MVcT@lists.infradead.org
X-Gm-Message-State: AOJu0YwOn9QSFf18zmkFfSP6MrnYMr2PGQTvTEVh13KeebiYx0YZ6VGS
	teQgm0Z2fYbTi5qXYs0u4e5G/pcZG79JVlfdnoCqJypXQRiHeavZCrKSopHR9II=
X-Gm-Gg: ASbGncu8+a4DEpGc9shPx2lfovCxEcekVDwPZWDvE/o54fO36eIlIfoQY3ObVOUjBzl
	RxSGLjuux6rNo47KUUgi0844d9CCG3Po2KOljS5iQvwJeFlLuZf5gvse6Yr6IZ2h4uwpqsBkSNM
	RbsPTqB4vVt8qOOjMqjFSTQCUjxxLpDLQUsSG2clVK7JZKGTWsJzX4srkd/xTqDAkYLbWd7aD0D
	bS/T4Q+QOnw3vfQCf9W44yR9gTrneld3WZqjiWiG8F2TsTcP0igj+CkuDKf5r18pxtnJeYzT8ZS
	lwNGdl9AltSkhwZvCAhfpX+2qiBs1WjlIJghDerRFKjiBqL7OA==
X-Google-Smtp-Source: AGHT+IE5Mc9hxBHCR2InV+3GYjWm+yX48MSznxSGfJQ+nJnypxIRQDaL1uLviaLHAXTFGuG4bu8Mbw==
X-Received: by 2002:a05:600c:198f:b0:43d:745a:5a49 with SMTP id 5b1f17b1804b1-4409bd77f64mr15358405e9.4.1745526797180;
        Thu, 24 Apr 2025 13:33:17 -0700 (PDT)
Received: from kuoka.. ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-440a53870f9sm797625e9.33.2025.04.24.13.33.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 13:33:16 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	linux-kernel@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] firmware: exynos-acpm: Correct kerneldoc and use typical np argument name
Date: Thu, 24 Apr 2025 22:33:09 +0200
Message-ID: <20250424203308.402168-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2015; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=4QeWTXypptQJXSP2hw72WicyVT12KyhEiOJC2dhD6mA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoCqAE1H7molI2SrPDwvMlO3UDSVTRVDm+gevDd
 knoDzWIWGyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaAqgBAAKCRDBN2bmhouD
 11FzEACRaBawm3jRXDBKOuAGgA7XIz7w2537aCM6EOBi6nKWKvWSPJeGtPKK+sAXHBvWzom7pxw
 pdsqKgUW9MVmcs6W/nIUTPKdyy78eyx4luOQLpXbNjQOTY1qoxUWJvF4Niwaj4oqlobww//yOo1
 0sQs0QbiLddmFdBjNdaLj1pPG2ojQwnsfKZcfS2G8IXqnc6EYKw75xkwoazdQvrdizqmJ0C32Pu
 Kcb8qYpr22iEqmc+rpKZhGoz7Pe0MSJlYwNuMsd0JhtEm0geN2l8b/bmqXrNGNKZ+CUbjPKcldJ
 ad9h6C2syO0/kA8akIOy9kM0VPb6nDup8gqmxVHugYGvVP3gc4R16BNMklOV3GU0f2+BKtmAHOh
 f0EdX5gz14N4wiE0Q2gWaNYRxdORLjPrx1MiJrnL8E/8pE1wB0K12jIKIrsaqEN5B6hOpkDIbno
 jE7+odrH+wztsqozQoDuzPhA+Wn/eRpfwSRNeb691pM2N86mbE6UDaGEpzFG5OJZzEs1URFPMUe
 Lr5k+RH6GmaB3TpoQMjoyACrwkIqglxwZAoFb4znIBOH7jtBVKJ6fhxD51HXH4TVS2IuqcwCuXb
 B7+L3G37ogeJzckbACLv6cRtBxByNsMZxrxhv3NekNF6FuCpsmhQqae5r3GM3YDSxbdIa9NyUUi gXCBG3mKlOq5AYg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_133318_909151_B96B0266 
X-CRM114-Status: GOOD (  12.16  )
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

Correct kerneldoc warnings after commit a8dc26a0ec43 ("firmware:
exynos-acpm: introduce devm_acpm_get_by_node()") changed the function
prototype:

  exynos-acpm.c:672: warning: Function parameter or struct member 'acpm_np' not described in 'acpm_get_by_node'
  exynos-acpm.c:672: warning: expecting prototype for acpm_get_by_phandle(). Prototype was for acpm_get_by_node() instead

While touching the lines, change the name of device_node pointer to
'np' to match convention.

Fixes: a8dc26a0ec43 ("firmware: exynos-acpm: introduce devm_acpm_get_by_node()")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202504222051.7TqaSQ48-lkp@intel.com/
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/firmware/samsung/exynos-acpm.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/firmware/samsung/exynos-acpm.c b/drivers/firmware/samsung/exynos-acpm.c
index b3afb2069fd1..e02f14f4bd7c 100644
--- a/drivers/firmware/samsung/exynos-acpm.c
+++ b/drivers/firmware/samsung/exynos-acpm.c
@@ -677,20 +677,20 @@ static void devm_acpm_release(struct device *dev, void *res)
 }
 
 /**
- * acpm_get_by_phandle() - get the ACPM handle using DT phandle.
- * @dev:        device pointer requesting ACPM handle.
- * @property:   property name containing phandle on ACPM node.
+ * acpm_get_by_node() - get the ACPM handle using node pointer.
+ * @dev:	device pointer requesting ACPM handle.
+ * @np:		ACPM device tree node.
  *
  * Return: pointer to handle on success, ERR_PTR(-errno) otherwise.
  */
 static const struct acpm_handle *acpm_get_by_node(struct device *dev,
-						  struct device_node *acpm_np)
+						  struct device_node *np)
 {
 	struct platform_device *pdev;
 	struct device_link *link;
 	struct acpm_info *acpm;
 
-	pdev = of_find_device_by_node(acpm_np);
+	pdev = of_find_device_by_node(np);
 	if (!pdev)
 		return ERR_PTR(-EPROBE_DEFER);
 
-- 
2.45.2


