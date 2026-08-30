Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8492C61DD9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 30 Aug 2026 17:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ri0QbBDUdQXRFUs7t8FRY1qNhNj6rQaG5ZybdVVmKl0=; b=1VSbSKbm4bfFnKHtx/o7LKWqzt
	BR2mmVRcVXyCaiHPg018RQAwI8b9n1sqI2qFY5uiyoATcrbCrq+bdKY1GZV/iFTUa6Uy6/JAJ7kPp
	zBbxI7FGh6fYH4AQJ7AAvp1liFQyTzO6FsYybnQNGyZLgOK32WOdyqTpfQ3hDJqP2TLAgnS2cfeGO
	ux7I1+kFjJV8+1RJmVMBU1L7v+h6kcLdOezl0teBDSadQXvT/IbA3GFYewrDV7NdxdBoox7LeOydw
	f0bnA5Zz+CkyywJ3+8YFAzUlsGX7ijaY78562gbklyCP5wvSXq86b3bopGfZZKfaO+Ja5KsXEseLM
	d+xoxIEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0j3A-00000007wD3-1c9M;
	Sun, 30 Aug 2026 17:10:32 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0j38-00000007wC3-0PLn
	for linux-arm-kernel@lists.infradead.org;
	Sun, 30 Aug 2026 17:10:31 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-38dfe910e9dso3075747a91.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 30 Aug 2026 10:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788109829; x=1788714629; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ri0QbBDUdQXRFUs7t8FRY1qNhNj6rQaG5ZybdVVmKl0=;
        b=VCmC/bqU8KIgXMu6rlWYnHYNdr4gCz3pihBrDsAl2X7u9jaqtUNsHQuWnVkMvlUnLh
         IGHjomY9cyBCQ8qGFyuibPwkJLmXFyNWHaK0LFtzTiWZ9YGc+ZOEtdbSKdHn6fk8dlcZ
         xGe8fzvtVs+dSsVcBiTYW2IONBBTqWUV/OsNrzBx6WCUsuZHGvCYAM0IJQxnvU7RTUEK
         m2fSh6LRKocrait382MFHKa8XMRqgsElZrrcMVJ453WMGeaWt6Fm5WDTgl8QXtB25vHI
         cmQQBxPKAr667OC+6f2lvJC7QWjExyOW9MGO/IYW+0slc04cDZS8G2jhAG5oN7KJESLw
         XGVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788109829; x=1788714629;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ri0QbBDUdQXRFUs7t8FRY1qNhNj6rQaG5ZybdVVmKl0=;
        b=Ft4rWcwV8Mor23oJtbGtRBdwk54A80f37lwYNKt3bn65RdcTFEe3cfH7WHh3scv8GN
         p3LPfEbaUjJxWzI5CRFZUi4trn8qn+VaJPAGOZnHib2tlxv1aLbzxpNl4ESGTWUwOuId
         GTzu1ObKKRdCIjcYvz8Xvhwvd+X4rcc/z3F5JUSxnoruorf6971b4nq/cKVu9OYEGnDb
         +CsHOjfF/YiNkKu/Qor7kXC12qPU/vlBFM7VflXYTpzgpDE7ePMkM3jzwp2NhBbVP60G
         4Vxid/Q/C5/KkQjG93XJF50p7Kql2CaLgauDS/esYYXDXkF1A6n5mmTMM80OxVMM74jc
         zOiA==
X-Forwarded-Encrypted: i=1; AKwUvBxDoJiDULIdAPqn6+f7qdS49E0q6si9vF2x2/v/KxAc6n3d1G9MaaLjS5v9gjYiK3L72KjU1LnTH3hyGnIcs35z@lists.infradead.org
X-Gm-Message-State: AFuF++ndVZOAIHrjRon+a0T0j7kQpx5XnqDo6FfB28P8bN4P8y8yix+E
	lIOcIoEv7pPIyjJj9LcuiruNtQ4aUYybvxozr/ePoGvmBDeIS6jIkoWQ
X-Gm-Gg: AYBFou1rsd+AmyRKZC3B8zBNIfc2WxlrGoqQz/QxdZJmPIs8jNDqBOEwhI834d3PFL6
	2rlxpacKQcfubOUlMuXWJGPfrFXgrUP7t5pUWe4Zy/6GO2JQUgU/E/8vU/O4OZdyiSY8/Q059Gx
	Ob9rftXq4KDIZe0Q/jOVlRP3vmawBK09Hz3SqLlulJvdWHUPIEDdPPSSEuWpcS2zE8TjaO2vEk1
	qDKNo67G4xZZbmdD+qTlgZP0/oT6R+22hgGH2ov2Cp8abISfc7zflKVwOlD6qrwuQThFRbBShDc
	v4brzO3/A7HBSj6cw3HQKPLONwqcOkKlwKvRcRMKO51GG9kmaGR3vCNzsDJX09UorRMAmg5D9Ap
	kKOqhr9Aayoq7z5yd5l2r7r7HSaaOXPme2bNu2MeSY3KnNGxDBEn2nUmOr3WxvEvbHEeJUTGcwW
	7UA/rtI5StbW5IEGkvkTiQSMxkCxN91Ut5xRZyYtn3Ua0dXt1spOCEqoMHfQ==
X-Received: by 2002:a17:90b:440c:b0:381:6c5:3f63 with SMTP id 98e67ed59e1d1-396d0eab08bmr31913392a91.6.1788109829049;
        Sun, 30 Aug 2026 10:10:29 -0700 (PDT)
Received: from ubuntu.. ([2405:201:8026:213e:88d5:45ce:40e:490f])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396b0fcfa3asm17047101a91.6.2026.08.30.10.10.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 10:10:28 -0700 (PDT)
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
Subject: [PATCH v2 3/5] iio: adc: bcm_iproc_adc: use devm-managed cleanup
Date: Sun, 30 Aug 2026 22:39:16 +0530
Message-ID: <20260830170919.470974-4-mdshahid03@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260830170919.470974-1-mdshahid03@gmail.com>
References: <20260830170919.470974-1-mdshahid03@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260830_101030_143619_55142B40 
X-CRM114-Status: GOOD (  18.24  )
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

Use devm_clk_get_enabled() to manage the ADC clock and
devm_add_action_or_reset() to manage ADC cleanup.

Since the clock is only needed during probe, keep it as a local
variable instead of storing it in struct iproc_adc_priv.

Register the ADC cleanup action immediately after enabling the ADC
so that it is automatically performed on probe failure and device
removal.

This removes the manual clock cleanup callback and simplifies the
probe error paths.

Signed-off-by: Mohammad Shahid <mdshahid03@gmail.com>
---
 drivers/iio/adc/bcm_iproc_adc.c | 39 ++++++++++++++-------------------
 1 file changed, 17 insertions(+), 22 deletions(-)

diff --git a/drivers/iio/adc/bcm_iproc_adc.c b/drivers/iio/adc/bcm_iproc_adc.c
index 2b59819c4ca4..c7fbdc21f8cc 100644
--- a/drivers/iio/adc/bcm_iproc_adc.c
+++ b/drivers/iio/adc/bcm_iproc_adc.c
@@ -107,7 +107,6 @@ do { \
 
 struct iproc_adc_priv {
 	struct regmap *regmap;
-	struct clk *adc_clk;
 	struct mutex mutex;
 	int  irqno;
 	int chan_val;
@@ -449,6 +448,13 @@ static void iproc_adc_disable(struct iio_dev *indio_dev)
 	}
 }
 
+static void iproc_adc_disable_action(void *data)
+{
+	struct iio_dev *indio_dev = data;
+
+	iproc_adc_disable(indio_dev);
+}
+
 static int iproc_adc_read_raw(struct iio_dev *indio_dev,
 			  struct iio_chan_spec const *chan,
 			  int *val,
@@ -508,6 +514,7 @@ static int iproc_adc_probe(struct platform_device *pdev)
 	struct iproc_adc_priv *adc_priv;
 	struct iio_dev *indio_dev = NULL;
 	struct device *dev = &pdev->dev;
+	struct clk *adc_clk;
 	int ret;
 
 	indio_dev = devm_iio_device_alloc(dev, sizeof(*adc_priv));
@@ -527,10 +534,9 @@ static int iproc_adc_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(adc_priv->regmap),
 				     "failed to get handle for tsc syscon\n");
 
-	adc_priv->adc_clk = devm_clk_get(dev, "tsc_clk");
-	if (IS_ERR(adc_priv->adc_clk))
-		return dev_err_probe(dev, PTR_ERR(adc_priv->adc_clk),
-				     "failed getting clock tsc_clk\n");
+	adc_clk = devm_clk_get_enabled(dev, "tsc_clk");
+	if (IS_ERR(adc_clk))
+		return dev_err_probe(dev, PTR_ERR(adc_clk), "failed to enable clock\n");
 
 	adc_priv->irqno = platform_get_irq(pdev, 0);
 	if (adc_priv->irqno < 0)
@@ -548,13 +554,13 @@ static int iproc_adc_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	ret = clk_prepare_enable(adc_priv->adc_clk);
+	ret = iproc_adc_enable(indio_dev);
 	if (ret)
-		return dev_err_probe(dev, ret, "failed to enable clock\n");
+		return ret;
 
-	ret = iproc_adc_enable(indio_dev);
+	ret = devm_add_action_or_reset(dev, iproc_adc_disable_action, indio_dev);
 	if (ret)
-		goto err_adc_enable;
+		return ret;
 
 	indio_dev->name = "iproc-static-adc";
 	indio_dev->info = &iproc_adc_iio_info;
@@ -563,29 +569,18 @@ static int iproc_adc_probe(struct platform_device *pdev)
 	indio_dev->num_channels = ARRAY_SIZE(iproc_adc_iio_channels);
 
 	ret = iio_device_register(indio_dev);
-	if (ret) {
-		dev_err(&pdev->dev, "iio_device_register failed:err %d\n", ret);
-		goto err_clk;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "iio_device_register failed\n");
 
 	return 0;
 
-err_clk:
-	iproc_adc_disable(indio_dev);
-err_adc_enable:
-	clk_disable_unprepare(adc_priv->adc_clk);
-
-	return ret;
 }
 
 static void iproc_adc_remove(struct platform_device *pdev)
 {
 	struct iio_dev *indio_dev = platform_get_drvdata(pdev);
-	struct iproc_adc_priv *adc_priv = iio_priv(indio_dev);
 
 	iio_device_unregister(indio_dev);
-	iproc_adc_disable(indio_dev);
-	clk_disable_unprepare(adc_priv->adc_clk);
 }
 
 static const struct of_device_id iproc_adc_of_match[] = {
-- 
2.43.0


