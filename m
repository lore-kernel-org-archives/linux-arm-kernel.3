Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFB83C54FCD
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Aug 2026 09:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4sMBazdEJYTe6pzd45qpWokzuIgSbldBJhe0jeEanG8=; b=wCB5XOR65rnvsUqdDdEXLpgWPA
	wLfvBjfh6psHp/3YLRl0ZqVo0q4WyHsM2okEUJwSDkPUsgNnwpr+SblGPz912TQMxZ+QpTWnueqzA
	GZch9RzEV14d1SyZUTjEE/vkHQjnHB1+HpqscVW79kdoCfVOQHELEX5XSjxMwSQo3WBi5ybzqMGQX
	AaFBxNvx/Ld5U4AKtTt23dsC1iTLGrycO16JaDPLktFSiQMOgO7QZ6AvnzfPg/WVT4FpMDjrxo7J+
	A+FI8lM7ZL8lLReQ/AzVVdzCM379OEoz9MGMiLsopMkXLiODC9sn9DJKSLBmXS3Gem6P3IrS1JzZt
	ot0RyPFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wq5ju-0000000E6xM-11aD;
	Sat, 01 Aug 2026 09:10:42 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wq5js-0000000E6wO-10pv
	for linux-arm-kernel@lists.infradead.org;
	Sat, 01 Aug 2026 09:10:41 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-ca80d708489so1084948a12.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 01 Aug 2026 02:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785575439; x=1786180239; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4sMBazdEJYTe6pzd45qpWokzuIgSbldBJhe0jeEanG8=;
        b=GdYQRDlgIITYBn5JpwPAOxK6Ieq/LkbI7fVcdKLThWkO8dVj4fZ1NsSmhY1noFvskh
         lJwDX86TBKHlmaqBhA0sBEEcHyasIeUEPyG8hLS5pH2XePTluyLmQG86Y/Y3CT71q/7Q
         fnECzvLkgjFCSnOK3a9rzPVgGZt/3vH+Wyon6xYoSN4kuPqUi7DfrmbgUE7Bip21jBOP
         pysfLL1ABNqhllsY1yCk2OMs5PBkc+UtcPrv6WeH1SybYR3C9aJ2zDs7Y1n8wbDUM1P7
         WQGJcwjATOT5amE2s77I2i/HfhyroiuYz8BiVPsrQRnOXVaM2uMM7vteQgC1MPtmFZkh
         gaPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785575439; x=1786180239;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4sMBazdEJYTe6pzd45qpWokzuIgSbldBJhe0jeEanG8=;
        b=NRlaLcUPc95hfjjs/SlR6b8yuUPsPS4ct/lvJFJ+TKdG2j6GcR48q6kb4Vjex+cGYR
         C1L07dLwDCPSAzDmkkrS8fdkCyGlAtdxeu3yLVybZ6Gw2WWi6wCEeENHt3F7/6CZgy41
         363UKqeuROEltOY0ZrEl101Bc29ryR7hFmYe9smu/6alFwgXlzKsNySdYM/Fhcmqmpy8
         d8gTHmbkl1trYLgNZ7cy1O8XcJ6WO7wKqMPymS47/9zkuOML9unCG6DgSG9DuKohgaQ9
         S3rJMGXRr2CN2aVggtceL1YAYGo448akX/W05yeKNOhItP4EyG2KU28OANB9iQiSNOBH
         0YcA==
X-Forwarded-Encrypted: i=1; AHgh+RrMiMx+BNVKLUiXK2F7ErsxzyOtbzzZKOT6OQV4SU2lPum6bMaOCUai+Cbd3q/XT9DXEfMOUdlMHFfRt+5FPX3o@lists.infradead.org
X-Gm-Message-State: AOJu0YxRhzOg/nh6DZaIJHPhjRIqna3TpkDRmrffcnyoxlgbK/fJB+bY
	HjU4xVqCuf73pqNCO2bbrFcb7dE2nR5T1JUkxw/vbeFmH8lb6aoPBUDq
X-Gm-Gg: AR+sD11a6y5ctk9EBe6R3zZB5ZegRJrx9k0Ws1HMHB601K71ln8YphWhlarJcvF+nJi
	0W9uHyEqIj0tC0WT8z1Gh245ZrQZIYGDT39cAa3lpgPgGlkKT0LSRphH7Ssptj1Q+NxNgz8BVT6
	0FFiyJlAKc+XsZ6fFp8Z3fIiDttIaPOPRyb5kxRurgYJGdnnLq5v4Oy2UHts3/NsgnY1XD0HSSV
	V3gUdqKElXoxutXptN+g1HN1OT2KpEAdaYs44Bus6vApLNZokDAVXCa/u4+Toba3qShR3BjJcgk
	3eW3rDLp4O+y2n+p0q9Iqtau3Ct2NO3z0P0PT1Lg1e8Bvl03J9fdZpTVACFvnXWzPxcO4oytYtj
	hWnw6qUX+i/RZCe/WZoivohakdSYz6WyzJ2upzSvCMhtEmCQ5TV1yfWcofWabOyH5PaAiMizuZg
	J2GcUOQM8dKu3mV6ryDTJEGfHHDZarihJa5CdBaoD/31lv7R+no4MfXyFlVA==
X-Received: by 2002:a05:6a21:e598:b0:3c6:6f25:594 with SMTP id adf61e73a8af0-3c91aa0a4f5mr5101134637.38.1785575439377;
        Sat, 01 Aug 2026 02:10:39 -0700 (PDT)
Received: from ubuntu.. ([2405:201:8026:213e:36ae:7de2:5cca:938])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153dd9c96asm15432431eec.7.2026.08.01.02.10.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 02:10:38 -0700 (PDT)
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
Subject: [PATCH v4 2/3] iio: adc: bcm_iproc_adc: Introduce local device pointer
Date: Sat,  1 Aug 2026 14:39:52 +0530
Message-ID: <20260801090953.61603-3-mdshahid03@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260801090953.61603-1-mdshahid03@gmail.com>
References: <20260801090953.61603-1-mdshahid03@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260801_021040_296058_980648E1 
X-CRM114-Status: GOOD (  13.24  )
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

Introduce a local 'struct device *dev' variable in iproc_adc_probe()
and use it instead of repeatedly referencing '&pdev->dev'.

This simplifies the code and makes subsequent error handling changes
less verbose.

No functional change intended.

Signed-off-by: Mohammad Shahid <mdshahid03@gmail.com>
---
 drivers/iio/adc/bcm_iproc_adc.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/iio/adc/bcm_iproc_adc.c b/drivers/iio/adc/bcm_iproc_adc.c
index 7c2e2770cd61..4acd9c3f089b 100644
--- a/drivers/iio/adc/bcm_iproc_adc.c
+++ b/drivers/iio/adc/bcm_iproc_adc.c
@@ -506,9 +506,10 @@ static int iproc_adc_probe(struct platform_device *pdev)
 {
 	struct iproc_adc_priv *adc_priv;
 	struct iio_dev *indio_dev = NULL;
+	struct device *dev = &pdev->dev;
 	int ret;
 
-	indio_dev = devm_iio_device_alloc(&pdev->dev,
+	indio_dev = devm_iio_device_alloc(dev,
 					sizeof(*adc_priv));
 	if (!indio_dev)
 		return -ENOMEM;
@@ -523,14 +524,14 @@ static int iproc_adc_probe(struct platform_device *pdev)
 	adc_priv->regmap = syscon_regmap_lookup_by_phandle(pdev->dev.of_node,
 			   "adc-syscon");
 	if (IS_ERR(adc_priv->regmap)) {
-		dev_err(&pdev->dev, "failed to get handle for tsc syscon\n");
+		dev_err(dev, "failed to get handle for tsc syscon\n");
 		ret = PTR_ERR(adc_priv->regmap);
 		return ret;
 	}
 
-	adc_priv->adc_clk = devm_clk_get(&pdev->dev, "tsc_clk");
+	adc_priv->adc_clk = devm_clk_get(dev, "tsc_clk");
 	if (IS_ERR(adc_priv->adc_clk)) {
-		dev_err(&pdev->dev,
+		dev_err(dev,
 			"failed getting clock tsc_clk\n");
 		ret = PTR_ERR(adc_priv->adc_clk);
 		return ret;
@@ -543,11 +544,11 @@ static int iproc_adc_probe(struct platform_device *pdev)
 	ret = regmap_clear_bits(adc_priv->regmap, IPROC_REGCTL2,
 				IPROC_ADC_AUXIN_SCAN_ENA);
 	if (ret) {
-		dev_err(&pdev->dev, "failed to write IPROC_REGCTL2 %d\n", ret);
+		dev_err(dev, "failed to write IPROC_REGCTL2 %d\n", ret);
 		return ret;
 	}
 
-	ret = devm_request_threaded_irq(&pdev->dev, adc_priv->irqno,
+	ret = devm_request_threaded_irq(dev, adc_priv->irqno,
 				iproc_adc_interrupt_handler,
 				iproc_adc_interrupt_thread,
 				IRQF_SHARED, "iproc-adc", indio_dev);
@@ -556,7 +557,7 @@ static int iproc_adc_probe(struct platform_device *pdev)
 
 	ret = clk_prepare_enable(adc_priv->adc_clk);
 	if (ret) {
-		dev_err(&pdev->dev,
+		dev_err(dev,
 			"clk_prepare_enable failed %d\n", ret);
 		return ret;
 	}
@@ -573,7 +574,7 @@ static int iproc_adc_probe(struct platform_device *pdev)
 
 	ret = iio_device_register(indio_dev);
 	if (ret) {
-		dev_err(&pdev->dev, "iio_device_register failed:err %d\n", ret);
+		dev_err(dev, "iio_device_register failed:err %d\n", ret);
 		goto err_clk;
 	}
 
-- 
2.43.0


