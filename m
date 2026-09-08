Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D0ECC79F99
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 17:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fYdCGwR2PPQ+VhuIDyakmIiYQ5Y15ZgMmXSqFF9HOCc=; b=BwvfYrSwmyOL5OdeddPfhMOwo2
	3VceipLMUaEJtHEvfxJqvXNaJnOeQJbLJuYOkxQ99GQXibPCWS3rVvEWjYa5FYy+ADn1diNa9W1ch
	G9fQQbIuoTApENLSZyTnHLUX95y6bUkMjvhNHLjYUUgv9sOvmPx1WeX/fUG1ABW750FaHY7+drjGl
	VOpFBXdI8q656Frr2ZtvZdjsHtzgxg1QdVaXCBrDCjTweZH7DMh47aX180qPFRfh9PMy9OcVCuh+I
	W+g2h3+jKqZ7oRgWbA0bSrHXwXSO5vlFSV0UoffmOLKySeguQ9ijxEiGb0jmToNpCmclnzRxNG5o0
	IY+sZNtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3zZx-00000009oat-3SFZ;
	Tue, 08 Sep 2026 17:25:53 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3zZt-00000009oWN-3QIb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 17:25:52 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-cc1c8d4a959so3288964a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Sep 2026 10:25:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788888349; x=1789493149; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fYdCGwR2PPQ+VhuIDyakmIiYQ5Y15ZgMmXSqFF9HOCc=;
        b=mBGoOlne49e0yeKP2xdg2BBMWt5dCj23KHV4AV0yYZIbHBPOZ/zCvzuizfGp9/BrgO
         By/hmYE95vmGiLaYmUjvF4q8miQGsedyBQfDGc4UQSugJF1XG33/1yJZaT7ohHqDS396
         gqyFraRyiPvoUoIcThMFxVcNIbYuwSHy4kTywx447YfRyZWsKRHiMGMAlX6eDdYCbwG8
         jk4EDKmt8+PrFnlr1e4f6+ALrPZbtXn2gCK5+UfIb4evP3hlV4DyqSxvYnlmA6NjxzEi
         C6JlRcx+dH0CnJ+r7/QqiE8cBSj9AqZOpvvgCQKauh4M8Zj0FEipTG1TLO0JzmqFr2cn
         JWIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788888349; x=1789493149;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fYdCGwR2PPQ+VhuIDyakmIiYQ5Y15ZgMmXSqFF9HOCc=;
        b=py7/b1HjuvfPR0Q5yOXXBJJeXBcrmWV/nbDpOuJJF1+hBO1iY7yeT0bemfXv8V6Bjb
         O3o94VkVq4t6rD69ML2IR8MjH49xAc4GMTkRoEScH5xsETS4m/YxBR849qy77ev7o6D0
         cdDZ/xgn6Bgr23ZsFU9j8dMq9iZLDI47IJMh1wxbalz1W9CbqIBNJ9yo6eOsyL0usi1W
         HxUWvHjX4QKczTyVocmNe8kDOEk1kaTdNQUpgoZvf/SyA0i2V9MjW65mp91wvOPBDyuA
         jIjYpNo8Iz95CZEcx9vYuWBii+QQIwYhFk6ZvVTZMkK/awgnbEb5cpu/t1nLIKhITzXQ
         Gnyg==
X-Forwarded-Encrypted: i=1; AKwUvBzCwMjk+8G7LUMKBN8iAF8U5hXqAHGRwx7wsMmUiu9lVDoY7/fl5M95Pc05+0eSyaMKTRHSQXMNPQHHjwcaa3Am@lists.infradead.org
X-Gm-Message-State: AFuF++l22QK5mIrWvxEAwnp2JsWtfXfs+4UXWhFp1p6eKZX/KbwScFCu
	T3xsYfThJPK/9tJdVtaY1YsyV6HZwMqv4TT9ed9sCDAKNJpYfs1y03HC
X-Gm-Gg: AYBFou0zGxOdl4S+kD4ZwpeJXuJ+y6C2w6YEmx+Oy3+U+Utaa1Kyfn9cDzkMhiLav5x
	GFN9egM5zIxoN+i3L0nRPnUMKwoY35I13ZfkD5vAkiV6sLrz6CUGaiG8IMRMkbptB1e6RcEFQSt
	d9gAcjQm+8ndQk5l19kj8u1kvaec4iOy7F75Qn0M5vFed6fFjKc8IYlLZEGbgGmAXFfv5LLlP1l
	uanYpgw4IgjniSpeYNcVx3DFNFXl+6P5y4BwQSl3cTUIpoOYmK4dTMVAMXVEBtpXIwUU1vHUupe
	elvr1KNCwywvOr7x6rxewJ9otLnvNqIqU9Hh1DRkQHf3CLZ7GJFscHFeFr1gvW0K8GXNh2LKeJj
	kg2xuE5xWwpE8OBRlw4S8BpBN0mlPr/fIZsN4kF+a0/dD14MfBvocqV5Yxsx937QQTLeYDkl2Ai
	ORYa0C2koRYy6n5YNN6tXWBpdCA+e6FclOykHmGHX8msL+y76U2XM3d2KQOnc=
X-Received: by 2002:a05:6a20:bea6:b0:3bf:7e2a:e874 with SMTP id adf61e73a8af0-3da39b5c429mr46679411637.1.1788888348747;
        Tue, 08 Sep 2026 10:25:48 -0700 (PDT)
Received: from ubuntu.. ([2405:201:8026:213e:43ae:bf76:d99a:e5ff])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33688cfc714sm19297176eec.20.2026.09.08.10.25.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 10:25:48 -0700 (PDT)
From: mdshahid03@gmail.com
To: Jonathan Cameron <jic23@kernel.org>
Cc: Marcelo Schmitt <marcelo.schmitt1@gmail.com>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com,
	linux-iio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mohammad Shahid <mdshahid03@gmail.com>
Subject: [PATCH v4 6/6] iio: adc: bcm_iproc_adc: use devm-managed IIO device registration
Date: Tue,  8 Sep 2026 22:53:59 +0530
Message-ID: <20260908172359.30003-7-mdshahid03@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260908172359.30003-1-mdshahid03@gmail.com>
References: <20260908172359.30003-1-mdshahid03@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_102549_931006_03A9E9B2 
X-CRM114-Status: GOOD (  15.15  )
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

Use devm_iio_device_register() to automatically unregister the IIO
device when the device is detached.

This removes the manual iio_device_unregister() call and makes the
iproc_adc_remove() callback unnecessary.

Signed-off-by: Mohammad Shahid <mdshahid03@gmail.com>
---
 drivers/iio/adc/bcm_iproc_adc.c | 15 +--------------
 1 file changed, 1 insertion(+), 14 deletions(-)

diff --git a/drivers/iio/adc/bcm_iproc_adc.c b/drivers/iio/adc/bcm_iproc_adc.c
index 9881a3104c26..ca81e0edd24d 100644
--- a/drivers/iio/adc/bcm_iproc_adc.c
+++ b/drivers/iio/adc/bcm_iproc_adc.c
@@ -523,7 +523,6 @@ static int iproc_adc_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	adc_priv = iio_priv(indio_dev);
-	platform_set_drvdata(pdev, indio_dev);
 
 	ret = devm_mutex_init(dev, &adc_priv->mutex);
 	if (ret)
@@ -571,18 +570,7 @@ static int iproc_adc_probe(struct platform_device *pdev)
 	indio_dev->channels = iproc_adc_iio_channels;
 	indio_dev->num_channels = ARRAY_SIZE(iproc_adc_iio_channels);
 
-	ret = iio_device_register(indio_dev);
-	if (ret)
-		return dev_err_probe(dev, ret, "iio_device_register failed\n");
-
-	return 0;
-}
-
-static void iproc_adc_remove(struct platform_device *pdev)
-{
-	struct iio_dev *indio_dev = platform_get_drvdata(pdev);
-
-	iio_device_unregister(indio_dev);
+	return devm_iio_device_register(dev, indio_dev);
 }
 
 static const struct of_device_id iproc_adc_of_match[] = {
@@ -593,7 +581,6 @@ MODULE_DEVICE_TABLE(of, iproc_adc_of_match);
 
 static struct platform_driver iproc_adc_driver = {
 	.probe = iproc_adc_probe,
-	.remove = iproc_adc_remove,
 	.driver = {
 		.name = "iproc-static-adc",
 		.of_match_table = iproc_adc_of_match,
-- 
2.43.0


