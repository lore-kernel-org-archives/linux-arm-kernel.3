Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED98DC55164
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 15:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hJ72M8reVIZqxbhzSXS1Mi2+37hAcyZSuGI4YdKYzKM=; b=mo31wOP4LhXaz2co0LtBHQdMih
	yaNzYYz+FgZz222NQSA59JkQUutYzQJAUkiBXyxmFDFMCz+zxtoD985DfLhYNVuFdAdf1eQ5kFOxl
	fMW8wXcdeXIHa/4ZHmq8XLIBGCmQIZAUYgNKEdkNwJGijdzwslUJbK7G66RSwo0C+oU8QnCd2tad6
	ETavDJySs/ucpblVfeSsUcannKej7IhPFE/PHFsBHSqi82izl97jz5NwOuIiMaLGyAk+NOsLURdhG
	ZbxQleFZJFS1OBvGN+hLPeX9mZlr9HyqKwBX1epBwrtDQ6smQSqGOHbhkn4h/BnqMh08Z7TWjzLLN
	ENWvu4ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpT8m-0000000Atue-09oi;
	Thu, 30 Jul 2026 15:57:50 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpT8c-0000000Atnk-1sQY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 15:57:39 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-c9e607d81fcso1414131a12.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jul 2026 08:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785427057; x=1786031857; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hJ72M8reVIZqxbhzSXS1Mi2+37hAcyZSuGI4YdKYzKM=;
        b=Hpy23ksXOarGxzp0RfwkzPB1SxwYJKxwi3hQsRLxAdKQGrom1J+dbOpehteead+EmF
         9ZEgFIsuqjAJ6/3fm4cGf7BVyPsOVYClsVcAArUoUQqggMPz23wb6PGRAaoKeq8vhLVu
         IJMtjD/AoBUIUWlXV3uHJj9MyYx4pb5aClzlOMRKNJEs9/80BIwZpbfRXHa6QYDJLQCw
         TJQRCyw478lXlZxKO045xEBtURdaHm64mrz/0ysPCiCTR7wT4VMyiz2HWt3zdyg0R3hM
         Tk87xatCbJegyjPYKceJfBr0YhADCvs7K7MS4fGitzEhlOfswMgIF/yQ9atddFoB7Flk
         5gTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785427057; x=1786031857;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hJ72M8reVIZqxbhzSXS1Mi2+37hAcyZSuGI4YdKYzKM=;
        b=YI313LJy/fFADbRXGInFaWXVAo1q/ikUJK7hYVjjFgc2hfeYh+mQdwLOBzqcIzbT/S
         O+xesIz+J0aJ02oi2Ir4ZJMXa1cF5pRxQXKdxp9ZV09iH7rolpmv8qMQmXrOCfG1g2tA
         wa77KlzTjK2sWVy7cjPRXxDbxiBQRQVJv9X83YFzPadwMPKFopCzze37z2+aUQLuGutd
         UHGBa+b1/0JzopGwZs/KyVCtYOxLA5J8AZ1PJnHLDu/MedYfR4hD4VTo1YEFu85e33GZ
         8lERCFCDf6ASJAjz1hD09KEzTt5VX6ZgRUmLyUk+VrInXu3xxUcLGrVJrW6VzQYyG2Z5
         tHkg==
X-Forwarded-Encrypted: i=1; AHgh+Ro6KrL8D4B2OocdjeKLsCTN+8yRoAYQSn4HUEw5owAbgHH7pxZfEbD91dT5hdIoS/H7ba6pOLzqCyl8iPzgUdas@lists.infradead.org
X-Gm-Message-State: AOJu0YwkdYbSoCv+Id0bZ59k1WNa3oVz33oUvd0BkpkM7LekVNWCKGOo
	mRJXqJQlrRreOzNe2hwN8vHDDKcOurUEd4PEkmrFms9HSKy6EpFPPjIh
X-Gm-Gg: AR+sD11XJ8la31fZtrmbrOhy3ZHbe5oe7wbJDSX4Xt6lkdNyHj1TfTq5eBCn1BBowuE
	rxS3oPGC578XC5agCZmeKHDSFyYJAyX+HxHTbPO7Soe6CpkbVpOgMgbCQGw77Dz7dxfF2iCk4/w
	eCljxD1Ogh2GmYnrEeYJ4UCUdbw3lgogQBQn3bU5ltwk/e6As9PZucyVv7gMn0HYdpAP5Nm+g0T
	8ZvaMMsbxvGvLnoLUC70BfBhzR4ld2SdJ0dBHFqt3ejLd40Xa97GCgx0HueBr7FpZ0hFncbx9s+
	/qXqPUT29ISkkGzM4sn4szlpFJngmWcILPZhys1bmh6tSyVV7jjm5FAOZ+vfzXKXAzmyzTN2hhH
	oZWjDkaGmlNTgprlAlrnh6gJqAD+7bu4zYcV6gjzUdn7YYFickBiNXWLoX6fkFuwq+RERXiitHT
	82t+2yfhTS2qQ/2RVeTc0Cx3OIfglIxr2ndRwksDz656tbFj0SPidmvJHtbko=
X-Received: by 2002:a05:6a21:4d91:b0:3c0:b766:7500 with SMTP id adf61e73a8af0-3c90075983emr3111077637.68.1785427057464;
        Thu, 30 Jul 2026 08:57:37 -0700 (PDT)
Received: from ubuntu.. ([2405:201:8026:213e:5fd6:849a:c1fd:20ef])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31504e1ff81sm23423608eec.31.2026.07.30.08.57.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 08:57:36 -0700 (PDT)
From: mdshahid03@gmail.com
To: Jonathan Cameron <jic23@kernel.org>
Cc: Andy Shevchenko <andy@kernel.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	David Lechner <dlechner@baylibre.com>,
	Joshua Crofts <joshua.crofts1@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mohammad Shahid <mdshahid03@gmail.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>
Subject: [RESEND PATCH v2] iio: adc: bcm_iproc_adc: Convert probe() to use dev_err_probe()
Date: Thu, 30 Jul 2026 21:27:12 +0530
Message-ID: <20260730155712.374464-1-mdshahid03@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_085738_621118_17FCF05F 
X-CRM114-Status: GOOD (  12.23  )
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

Replace open-coded probe error handling with dev_err_probe() for
resource acquisition and initialization failures.

This simplifies the error paths, avoids repetitive error handling,
and automatically suppresses duplicate messages when -EPROBE_DEFER is
returned while preserving the existing error messages.

Also remove the redundant error message after iproc_adc_enable(),
allowing the error to be propagated without additional logging.

Signed-off-by: Mohammad Shahid <mdshahid03@gmail.com>
---
v2:
- Convert remaining probe error paths to use dev_err_probe().
- Remove redundant error message after iproc_adc_enable()
 drivers/iio/adc/bcm_iproc_adc.c | 52 +++++++++++++++------------------
 1 file changed, 24 insertions(+), 28 deletions(-)

diff --git a/drivers/iio/adc/bcm_iproc_adc.c b/drivers/iio/adc/bcm_iproc_adc.c
index cf4738b16e62..08e056468d8e 100644
--- a/drivers/iio/adc/bcm_iproc_adc.c
+++ b/drivers/iio/adc/bcm_iproc_adc.c
@@ -522,52 +522,48 @@ static int iproc_adc_probe(struct platform_device *pdev)
 
 	adc_priv->regmap = syscon_regmap_lookup_by_phandle(pdev->dev.of_node,
 			   "adc-syscon");
-	if (IS_ERR(adc_priv->regmap)) {
-		dev_err(&pdev->dev, "failed to get handle for tsc syscon\n");
-		ret = PTR_ERR(adc_priv->regmap);
-		return ret;
-	}
+	if (IS_ERR(adc_priv->regmap))
+		return dev_err_probe(&pdev->dev,
+				     PTR_ERR(adc_priv->regmap),
+				     "failed to get handle for tsc syscon\n");
 
 	adc_priv->adc_clk = devm_clk_get(&pdev->dev, "tsc_clk");
-	if (IS_ERR(adc_priv->adc_clk)) {
-		dev_err(&pdev->dev,
-			"failed getting clock tsc_clk\n");
-		ret = PTR_ERR(adc_priv->adc_clk);
-		return ret;
-	}
+	if (IS_ERR(adc_priv->adc_clk))
+		return dev_err_probe(&pdev->dev,
+				     PTR_ERR(adc_priv->adc_clk),
+				     "failed getting clock tsc_clk\n");
 
 	adc_priv->irqno = platform_get_irq(pdev, 0);
 	if (adc_priv->irqno < 0)
-		return adc_priv->irqno;
+		return dev_err_probe(&pdev->dev,
+				     adc_priv->irqno,
+				     "failed to get IRQ\n");
 
 	ret = regmap_clear_bits(adc_priv->regmap, IPROC_REGCTL2,
 				IPROC_ADC_AUXIN_SCAN_ENA);
-	if (ret) {
-		dev_err(&pdev->dev, "failed to write IPROC_REGCTL2 %d\n", ret);
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(&pdev->dev,
+				     ret,
+				     "failed to write IPROC_REGCTL2\n");
 
 	ret = devm_request_threaded_irq(&pdev->dev, adc_priv->irqno,
 				iproc_adc_interrupt_handler,
 				iproc_adc_interrupt_thread,
 				IRQF_SHARED, "iproc-adc", indio_dev);
-	if (ret) {
-		dev_err(&pdev->dev, "request_irq error %d\n", ret);
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(&pdev->dev,
+				     ret,
+				     "failed to request IRQ\n");
 
 	ret = clk_prepare_enable(adc_priv->adc_clk);
-	if (ret) {
-		dev_err(&pdev->dev,
-			"clk_prepare_enable failed %d\n", ret);
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(&pdev->dev,
+				     ret,
+				     "failed to enable clock\n");
 
 	ret = iproc_adc_enable(indio_dev);
-	if (ret) {
-		dev_err(&pdev->dev, "failed to enable adc %d\n", ret);
+	if (ret)
 		goto err_adc_enable;
-	}
 
 	indio_dev->name = "iproc-static-adc";
 	indio_dev->info = &iproc_adc_iio_info;
-- 
2.43.0


