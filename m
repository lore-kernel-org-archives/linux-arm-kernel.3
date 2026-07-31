Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6936C55174
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 18:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S96pVSc6qSK7JNjBnWVrJfF1KAwOzUVlXD18tkrIn6w=; b=a7xkKFb4dxN1RJDa4lJjB4gcii
	JGP4csSQZx/sKVxokH8jurAUHedPDaKQ08kc66TKPZ33/biozlPUcd2qimQw3VxN8TnC4w3b2L19M
	tnrDz8GfG5jhiI+eo0RnIANNfyolrjegjWEuquNbJDKdC+s2C2kNzcP9o4YP3ZcxbyWj0wFDlCkBc
	B9dJda/TTT6sM/ufaR5xrnZXsVYgwCT9ayquatZwr9Yj40aTzvSsUkih7VUYzP3ClEIbKxqoaSRuB
	fepxAr07N7K6xHMgvDpLoAcRYhmrcSe1knKBTdGpL5CwkRGDhel/S0SqkcwZbP7OVFvpjq0iHkUkW
	PAMJ+rLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpruW-0000000DMDM-2MdR;
	Fri, 31 Jul 2026 18:24:44 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpruV-0000000DMCS-0jIT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jul 2026 18:24:44 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2cea3004256so15460275ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Jul 2026 11:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785522282; x=1786127082; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S96pVSc6qSK7JNjBnWVrJfF1KAwOzUVlXD18tkrIn6w=;
        b=YxRvsFs/XYChzzoaGqTkwpB5WeEDyhKUcBHOZ66+7s8mu1/pbxPLfzEjb/Z4DD+C7N
         3VBlq9044tNbvd5UKxf83KcEKakHRyXgcO0hwC+Sxgw8WAByUgBlaXLjlwyi3FiCnShp
         buADQMZbj70oOxhY3dwqYV+rO23QtletWKnlFgIPKCuIgJQPmd56hRV7VE2TaOOLVxzt
         DZD8eSbtzIdr/fY42mCf6bJATzjcEXpemgnXTPnB0BLVU1Qd48+zApH5Sm8w/nHb9lUe
         WOumXfB8VQGMoaBZj9FN5E/cvc4Gj6JMrlPkalYkp17eJzLSJ7ZihDYCga/2IMbd9znT
         TSbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785522282; x=1786127082;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=S96pVSc6qSK7JNjBnWVrJfF1KAwOzUVlXD18tkrIn6w=;
        b=jAPGR3a2qa1XEmHpxOmHIRW9yFbUITYnvkaYJRleTVc1FRUOUwtEXO2FMWE75++2zs
         CFNeM/pQSnJ82s5Qs/dZEGlbJBFHeB3SjYnXFDf95Wz6PMgZhAxI7i8gyuFD6cbJf7rj
         P0KKvGGUVfOUjBMqNfBV/csVUlQSVM5Dtl6EKKkbGwXB+75eNi5CVpWjJS6ov/2M6XOf
         rpZVZoxtq93goDva7rurwcW3+ZSmqw5vV1G+IZUTxtdmX0p2i9tN1/Mgkhl5T2/mNwdP
         4LkPHNDeUw+wXtRg1eCm6Y77yv4yd+tISncEgFcGhiPbbRyfS4zRyI1zbEdj8VwKBzZ0
         Py2g==
X-Forwarded-Encrypted: i=1; AHgh+RrYe9R+7cHfzrzh18ZNnQ2ntgZ8R9CgZOBdMcNuaeZKk9v51BkL+20blie5tqn1BnuF1OJXRSV/ISRzxkhbkiKL@lists.infradead.org
X-Gm-Message-State: AOJu0YxmpFzlr1wfCSxbrkRT5KvlDHcgiEe5P8rZ7S94ez1vVbyqAAZh
	XEQL8kynkhs1rlRqrPxQaeqZZT24+T1f3JHQabnYnA0z70tG5ELNNa4Z
X-Gm-Gg: AR+sD110XHFt8PXos3L65NrN3B28sqHSuubxZgDxjCuriv6LoFmKLunV52bRQS214vz
	JE3Hb03Z2EAuEZGDWiEfM2M74td/lRMdf3NJ5PVP3Pi9/meanVajoR924TRn6u2byDo9qw6cpLz
	bDC91GUCsif5IHw3LcQcDKheLC5wL2u7qOIxezlzcHjp7CUhH5DWFBfK1Prshm0+3ELo8FvtP4J
	xWaVpZ5KuxODJmpkBNxeXveK2lcyY95qAQrlvkaRyvmjnJixBtHzmkCtKlKgAiX+GtI+791A4gx
	EqKUnC3VrXYWEQbi9yi5GdE80Tl7WMiyTS791zEXJtPskmCTykC5o27upxAJBhAxqzOwrhXhWWl
	TUPVmuLnTJl43iPEquFI2/vvuzB3LcDsOPEFqDWRcowlGLAPDaXtskkFzCplHlftDhFj1D9BYVY
	z5BDnYGjnfPamC3+GmKKkFOwoOFqQr9TiDFs3ypGX5UEsElRiPv1mlpXuIv5Q=
X-Received: by 2002:a17:903:3886:b0:2ca:feb:303b with SMTP id d9443c01a7336-2d052429193mr8562495ad.25.1785522282316;
        Fri, 31 Jul 2026 11:24:42 -0700 (PDT)
Received: from ubuntu.. ([2405:201:8026:213e:d69c:7f00:28b4:311c])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153dd9c1casm8400785eec.10.2026.07.31.11.24.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 11:24:41 -0700 (PDT)
From: mdshahid03@gmail.com
To: Jonathan Cameron <jic23@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Joshua Crofts <joshua.crofts@broadcom.com>,
	Broadcom internal kernel list <bcm-kernel-feedback-list@broadcom.com>,
	David Lechner <dlechner@baylibre.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Mohammad Shahid <mdshahid03@gmail.com>
Subject: [PATCH v3 3/3] iio: adc: bcm_iproc_adc: Convert probe error handling to dev_err_probe()
Date: Fri, 31 Jul 2026 23:53:47 +0530
Message-ID: <20260731182347.42888-4-mdshahid03@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260731182347.42888-1-mdshahid03@gmail.com>
References: <20260731182347.42888-1-mdshahid03@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_112443_215125_EE346546 
X-CRM114-Status: GOOD (  13.00  )
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

From: Mohammad Shahid <mdshahid03@gmail.com>

This simplifies the probe error handling by replacing open-coded
dev_err() and return sequences. Also remove the redundant
dev_err() after iproc_adc_enable(), as the helper already reports
the failure.

Signed-off-by: Mohammad Shahid <mdshahid03@gmail.com>
---
 drivers/iio/adc/bcm_iproc_adc.c | 43 +++++++++++++++------------------
 1 file changed, 19 insertions(+), 24 deletions(-)

diff --git a/drivers/iio/adc/bcm_iproc_adc.c b/drivers/iio/adc/bcm_iproc_adc.c
index 29ea35972a23..5fcd528eb88a 100644
--- a/drivers/iio/adc/bcm_iproc_adc.c
+++ b/drivers/iio/adc/bcm_iproc_adc.c
@@ -523,19 +523,16 @@ static int iproc_adc_probe(struct platform_device *pdev)
 
 	adc_priv->regmap = syscon_regmap_lookup_by_phandle(pdev->dev.of_node,
 			   "adc-syscon");
-	if (IS_ERR(adc_priv->regmap)) {
-		dev_err(dev, "failed to get handle for tsc syscon\n");
-		ret = PTR_ERR(adc_priv->regmap);
-		return ret;
-	}
+	if (IS_ERR(adc_priv->regmap))
+		return dev_err_probe(dev,
+				     PTR_ERR(adc_priv->regmap),
+				     "failed to get handle for tsc syscon\n");
 
 	adc_priv->adc_clk = devm_clk_get(dev, "tsc_clk");
-	if (IS_ERR(adc_priv->adc_clk)) {
-		dev_err(dev,
-			"failed getting clock tsc_clk\n");
-		ret = PTR_ERR(adc_priv->adc_clk);
-		return ret;
-	}
+	if (IS_ERR(adc_priv->adc_clk))
+		return dev_err_probe(dev,
+				     PTR_ERR(adc_priv->adc_clk),
+				     "failed getting clock tsc_clk\n");
 
 	adc_priv->irqno = platform_get_irq(pdev, 0);
 	if (adc_priv->irqno < 0)
@@ -543,10 +540,10 @@ static int iproc_adc_probe(struct platform_device *pdev)
 
 	ret = regmap_clear_bits(adc_priv->regmap, IPROC_REGCTL2,
 				IPROC_ADC_AUXIN_SCAN_ENA);
-	if (ret) {
-		dev_err(dev, "failed to write IPROC_REGCTL2 %d\n", ret);
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(dev,
+				     ret,
+				     "failed to write IPROC_REGCTL2\n");
 
 	ret = devm_request_threaded_irq(dev, adc_priv->irqno,
 				iproc_adc_interrupt_handler,
@@ -556,17 +553,14 @@ static int iproc_adc_probe(struct platform_device *pdev)
 		return ret;
 
 	ret = clk_prepare_enable(adc_priv->adc_clk);
-	if (ret) {
-		dev_err(dev,
-			"clk_prepare_enable failed %d\n", ret);
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(dev,
+				     ret,
+				     "failed to enable clock\n");
 
 	ret = iproc_adc_enable(indio_dev);
-	if (ret) {
-		dev_err(dev, "failed to enable adc %d\n", ret);
+	if (ret)
 		goto err_adc_enable;
-	}
 
 	indio_dev->name = "iproc-static-adc";
 	indio_dev->info = &iproc_adc_iio_info;
@@ -576,7 +570,8 @@ static int iproc_adc_probe(struct platform_device *pdev)
 
 	ret = iio_device_register(indio_dev);
 	if (ret) {
-		dev_err(dev, "iio_device_register failed:err %d\n", ret);
+		dev_err_probe(dev, ret,
+			      "failed to register IIO device\n");
 		goto err_clk;
 	}
 
-- 
2.43.0


