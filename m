Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EE92E77188
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Jan 2025 13:45:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bE2H5VemRTsToLsccovLxNOaroqPN7uFot+UTGgYNy8=; b=w826sFoltrSovHL3eaVkpHBwea
	XxdqPsYAquaajJNF8iGwUFC4A7pumK5ahg8ejKrNxHysw3/ZBVz9RyvRzd8unsEvorN9OC2bqmTjo
	d4gmrxaJNzkUH/JylOsNKxBugIS7obiLlyKC24dWVT4upZ2NQ8Rdy/Fx7lZ+eKM2WneQ8vD7UOuES
	64qCnkv6r9LY8ji6PWH6fUQWxO4/oiUZqe5PgFydeaOh7co4Zxm/Fl9KApNa/GXJwhssWVfy8m9Sp
	BWGRo9Q1Sv2bBao3b+ZUY6bZLwIg6Ph1QlhgbBJbrzIbFbVFKVikTdxfGq9zmnR9V8dH6WFumNqNo
	yB4qsIMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWyHc-00000002nr4-3rgg;
	Sun, 12 Jan 2025 13:45:40 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWyBP-00000002mlp-1ezH
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Jan 2025 13:39:16 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-436381876e2so2937035e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Jan 2025 05:39:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736689154; x=1737293954; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bE2H5VemRTsToLsccovLxNOaroqPN7uFot+UTGgYNy8=;
        b=Igw7/7iP1E6PUpUvtGiw50tkOg6bkv0KNMheM7pO2MCf1zOuhTJyG2c5qTLnVtsJ3M
         QiIsymNnGdHx5PKJ3Ed59Z9E79d09yzeS6pHor9ytAaGng7alZchq8vQiN5CKwbmpHuu
         GZLKXzjQrs/E3DNedAVvQnHXL3CYWFK7+9Nj1c9AGSfeADWLvHegebvPx+tk/o++O0qg
         jUJRCeonAkMAF3livPeVDfbSqBEMS0BVtv/GPgb7zb+z8A61SDaweS3hHbp6FdjaGn+S
         UzrLjCZY/X69dkEAhtvJSad+wcVbzVwyHohOLkhtr05hq0Ba6ShqLGxEZpzpfdTZepHg
         5F/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736689154; x=1737293954;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bE2H5VemRTsToLsccovLxNOaroqPN7uFot+UTGgYNy8=;
        b=OISqv1a8J33J5F7dFfVqwGrEdqBei7C2DG3eiwysGMRc6Bz+59thkxmtjdvLCsfyU7
         d2Iq03mSVRveKzyYRFUZyhHBVDY06RNfFPtEjTOQ6IOaQjezOs/VZPmHozHZcqWVFCZU
         rnKVuEtyDu9N3y2+mXg55Sn4R4s3ltFqEtUv3Nr55Tj7pxMW3K5Q0K/ZV1ODZcg1jiN+
         FW+rlAD3LaGIlVq24+xZjjsMFaJtJSlQ86GX7XfJV0TeMuXRHzZfkSEZlsk9eb7yeX4U
         9B6rgsNp6w8SNE89YdrKdSvmLam4EaHG+KTto3Y9EugNEK1hT2Ni3swx8vGnrqRwvNqc
         +mEw==
X-Forwarded-Encrypted: i=1; AJvYcCXlGrIWHmnkM5q19Ih4yJsb4v2Iy7rJ+ZXJDjZkpP9Qhe6u/0dSJNVRql9cKO8FESWWmbxeLUNU+q1fulGkzALI@lists.infradead.org
X-Gm-Message-State: AOJu0YwBWmjre1PO7/LXQDQLmnV1EfykTAKCyV/zANIopKUbgd+KW4mK
	+N8as3CaUX3kJVzFEk+X6u52ZXpBjczADCO2uRe0D/3sh1d6OSa7N/+6UM1F124=
X-Gm-Gg: ASbGncvBbM0zaD9QiXbffnaVrvZ+Fic9aTnk0rbfDsFUoKy3dShqANzv/P6xg2ZXnlw
	Dk4paH2H+WDg//JGU4F6nEkaCvJZdX1JbfPbaM7gqaNYUQEsMmgcae6gTwoznWKMwqgTv00vmZs
	0K+3GHk5w7dHZddgVzMCqWfL58aSJ7ZgG5yIxdTJFoDjXBCjV3pvwAMi5uchNjjP9XcpOY+Y4Fl
	McHUzNRFAPoGZsO+OIOtm1ZcKapLxjBpoWpw/swEWhEfC1iPuATANkVQuHjSCwI9K+hQbCI
X-Google-Smtp-Source: AGHT+IHa/wlOBb5BLOSfZHKhJOKZ66IHreWI0aFAGTr50Xgpw10Wi7ykrB23Ux8LPFxNTSCfVkbaWg==
X-Received: by 2002:a05:6000:18a3:b0:38a:615c:8266 with SMTP id ffacd0b85a97d-38a872d2e1cmr6158761f8f.1.1736689153919;
        Sun, 12 Jan 2025 05:39:13 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e38c006sm9581924f8f.46.2025.01.12.05.39.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jan 2025 05:39:13 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sun, 12 Jan 2025 14:39:03 +0100
Subject: [PATCH 2/2] PCI: dwc: layerscape: Use
 syscon_regmap_lookup_by_phandle_args
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250112-syscon-phandle-args-pci-v1-2-fcb6ebcc0afc@linaro.org>
References: <20250112-syscon-phandle-args-pci-v1-0-fcb6ebcc0afc@linaro.org>
In-Reply-To: <20250112-syscon-phandle-args-pci-v1-0-fcb6ebcc0afc@linaro.org>
To: Vignesh Raghavendra <vigneshr@ti.com>, 
 Siddharth Vadapalli <s-vadapalli@ti.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 Minghuan Lian <minghuan.Lian@nxp.com>, Mingkai Hu <mingkai.hu@nxp.com>, 
 Roy Zang <roy.zang@nxp.com>
Cc: linux-omap@vger.kernel.org, linux-pci@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, imx@lists.linux.dev, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1680;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=xwSxcTgpz0V5yXRtTiY4r8e2MzVXviCXnTPUR+OLILk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBng8X583ThdqsNd+ai1Rg32YXT0CpzKBfUsuy7+
 rVM3hECbbqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ4PF+QAKCRDBN2bmhouD
 1xFpD/wLpb8jbZTwROWh7xkacIWp36gfWl8++ftg72bpoJgL1J+cC+JgxcgMYugfFbWP6qRzmUx
 hiaUj96QLiicIo1r1hgKftiuvegGo9HdhvbMVhE+7l0G8O+LtC2e4p0oP2C/UkKFmQ9n3Cv370d
 6Lf7OMg8A5s9Ngoiz4e3Hm3GwAKIYBAbNLTu67FEYwqKABIVtqF17ylKCD2OkbLU3qq4Rci6t0S
 dTgPPWNFq2k2SD6nItw9XUmSythajF3r6e0Bpc4IMb1TnFaijuSvzkZwlMtXrmLUbz2flgLH1TS
 BuhYMNBhpDDaHyMdyrPv/dbwZsgzISRIXyIRttdR8cvTv0tDDnz0bS7tvqnBWHztTjLpA4wSgwQ
 SOokV7tpa4D4XdhoZ9w54GbaKwYvx57guoSBJxmoWaXmDxvejiAcONb6YZ9fM8KpVAdYlemsd0i
 Z5wMMCkDbNUJskVmpA290eOz6cLRUTCSl/Pq7YGLvDsjORqWvs+EsZ2VefmLQ+wIpM046++/UNV
 jzql0Rvpd0glIlC8i6MKRTFuJnxF+HjqVO5LlsMPSnug5oHwkIEUJHaMzlf/Q/ErJsZpR5Scfk7
 QIFMUrZkwPpRWIfXEM7fI2hgVP+OUrs/xnyDNgq9ltdcqBcWM5vMFkxa0yY/aaiuicwh0kiS5Sd
 wYC2d0drGiCb1FA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250112_053915_458608_33548C40 
X-CRM114-Status: GOOD (  12.05  )
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

Use syscon_regmap_lookup_by_phandle_args() which is a wrapper over
syscon_regmap_lookup_by_phandle() combined with getting the syscon
argument.  Except simpler code this annotates within one line that given
phandle has arguments, so grepping for code would be easier.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/pci/controller/dwc/pci-layerscape.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/pci/controller/dwc/pci-layerscape.c b/drivers/pci/controller/dwc/pci-layerscape.c
index ee6f5256813374bdf656bef4f9b96e1b8760d1b5..239a05b36e8e6291b195f1253289af79f4a86d36 100644
--- a/drivers/pci/controller/dwc/pci-layerscape.c
+++ b/drivers/pci/controller/dwc/pci-layerscape.c
@@ -329,7 +329,6 @@ static int ls_pcie_probe(struct platform_device *pdev)
 	struct ls_pcie *pcie;
 	struct resource *dbi_base;
 	u32 index[2];
-	int ret;
 
 	pcie = devm_kzalloc(dev, sizeof(*pcie), GFP_KERNEL);
 	if (!pcie)
@@ -355,16 +354,15 @@ static int ls_pcie_probe(struct platform_device *pdev)
 	pcie->pf_lut_base = pci->dbi_base + pcie->drvdata->pf_lut_off;
 
 	if (pcie->drvdata->scfg_support) {
-		pcie->scfg = syscon_regmap_lookup_by_phandle(dev->of_node, "fsl,pcie-scfg");
+		pcie->scfg =
+			syscon_regmap_lookup_by_phandle_args(dev->of_node,
+							     "fsl,pcie-scfg", 2,
+							     index);
 		if (IS_ERR(pcie->scfg)) {
 			dev_err(dev, "No syscfg phandle specified\n");
 			return PTR_ERR(pcie->scfg);
 		}
 
-		ret = of_property_read_u32_array(dev->of_node, "fsl,pcie-scfg", index, 2);
-		if (ret)
-			return ret;
-
 		pcie->index = index[1];
 	}
 

-- 
2.43.0


