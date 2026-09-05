Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15129C624D3
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  5 Sep 2026 09:37:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wQgZhvROIqcSSraACFKP6/ol+N08WZO9uWFrqbiZaYY=; b=THp4xq7Z4DkidMHTFr58GYTzT1
	k5V8qhqCcXeEvQnQoPQFFCB0uDzFXn5xmlB6RwUgwJrbh4EDxiHrrPScwLttfZRzaBO4Y8ri4L9ub
	BwVPDP4uQ9kvRzj0WyZ6tV1pavOjy1TBHhwL1B+5ZghYhG+dG4i2QyE9e0DKZWpVSIojZxZKnC5bX
	h3FHN11kD0uu1zRWN2S4EYuBz3czyK12k37VP9trt1V6M2LF+OjMsE5neT+7x9boT7I+En2t9DtCB
	aAySa2qME8ktb0rIfOhray8giKj3De0LTKmlK1wLJVKfOLjJ8yNoFa+PXiih7S2lXOrRhOQs2yD4Q
	4kf9fYyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2mqI-00000003uzq-0gfq;
	Sat, 05 Sep 2026 09:37:46 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2mqG-00000003uyo-00pQ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 05 Sep 2026 09:37:45 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-39647184c73so2847111a91.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 05 Sep 2026 02:37:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788601063; x=1789205863; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wQgZhvROIqcSSraACFKP6/ol+N08WZO9uWFrqbiZaYY=;
        b=QdJqlb9hA3eHOOzAWKH4ZYkY4AwtnDD4q832280qDztb9TfyMmVP8NQoz81rYFLw6/
         fiuzyxr7oJ7WxeXTGiPC1M/wfdmaSeiKeuj65qUMdeLZMv/o3/YJF/O789hoIH2CLo+O
         lk67bbeGDgkdTVNlPgpfnajEaeqO5H/k14D7WjNMJox32cgioTvSSPQNnd4p/gYVOTwG
         ugGONxhZldZr/914XQLQxIafXH1leeGRf+9t+rL6Of4Ury6nAhXThSZmF32QLf7imyf7
         L8HbzZSnz91wS1MNFjjL58XY6+rV2RMrLE6ORnUGOc2LnVK5CyfL6KNMh0AgxUQxuT//
         adrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788601063; x=1789205863;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wQgZhvROIqcSSraACFKP6/ol+N08WZO9uWFrqbiZaYY=;
        b=qqZfEKEYDGH5jCi/1FC6rSMlbZRUY5EYf95xls/7ZW9xQX6UM7TLfpv0ymSTEapgMD
         vvl0EvfOfIt60hkWInzx1W3B5mcjVoFfCP5KltLIA0BBLJMbRJoocaIrGKenoCl/NUMq
         n+tWOzZxbhSt2Lj+PGY25VP5bloaXbnHDhFhktRdvKA2O+hJzprkq8C0NdvOmdN/UsdF
         ANZGPeFsIqeayHHHX3vpz2Wk1c/J6ZyKQpN+I+/xyQk3PQJv4cKeHf2fG3zX/CqGsd+l
         qZDFKMF0QHfAuFBCl19RWNMhqj6loMIZn5YJFZDoDAn1H/GtVbbh5qaKlcEEZuHPBPIx
         B0kA==
X-Forwarded-Encrypted: i=1; AKwUvBxJtzDk2vXqnXgQCgLwpv3msuHyFsU52uX10NvNVL9MInvqrr72VNLzilDRBk3W/M8XZU6ZRWLSI8lJi4ovFaJs@lists.infradead.org
X-Gm-Message-State: AFuF++mcsk9QAzwdfGkaT5nTYnuCsk+IJvjzS4SkjLx0HeWQoLqa2JU2
	oJhVhXrjaK0fEgpkUK1Yq7ufDEBw8Z5N4YPAMb1hQMqkxQw+ANz19m4F
X-Gm-Gg: AYBFou0p8cKyNZPXqqA48F2Saeo8GTNmCAOOclULL0k3UWCMg7xSfSg7RkKldANnABs
	rfLavHqmAid06fBXA0aLCMiGXf/58UBgxel4m8JK+lMboR9kkMoBuAK0KheMHCgqvtbeaXf90Wn
	G7UXVIXYn4iaDf9IIQF1sypTW9En12cAwqY3SdauKK9kLO5+1jTuWVQ+ZQIUMo+G7Vy7b0C0IhG
	MgJReJgvJGBdEhLPwzaPLeMfLXBUNw2fNnXnQc+V+lzM6gQZ5771I9qjHD7ZSkSnJP4/AUJBAF5
	LbgTJWzYpsmU5cJ/c332U5cxUfjDtUyERpeVoqB/JWma+kkC3yXjZ0RuSwTeTB5gvUUdn634Mw0
	LoTquHO+QCrL8ZIjh9OdLm/JnYBYr6rFrRhuzd8MSbT9E8fPGwNBuOraL5C8Poua0S/PTtuK8n7
	5GhImL72C/VKdzc+CB0ThZm/nrpqnDjb5Juh3r2YxlbkVeH9l2iACDqlfwTA==
X-Received: by 2002:a17:90b:1d4c:b0:38e:6d55:b1a6 with SMTP id 98e67ed59e1d1-39b27c121dcmr8907641a91.3.1788601063050;
        Sat, 05 Sep 2026 02:37:43 -0700 (PDT)
Received: from ubuntu.. ([2405:201:8026:213e:5b5:60e7:9f67:1689])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08d086adsm15763353a91.15.2026.09.05.02.37.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 02:37:42 -0700 (PDT)
From: mdshahid03@gmail.com
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com,
	linux-iio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mohammad Shahid <mdshahid03@gmail.com>
Subject: [PATCH v3 3/6] iio: adc: bcm_iproc_adc: use devm-managed clock
Date: Sat,  5 Sep 2026 15:06:28 +0530
Message-ID: <20260905093631.48667-4-mdshahid03@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260905093631.48667-1-mdshahid03@gmail.com>
References: <20260905093631.48667-1-mdshahid03@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260905_023744_049746_E1F58EAB 
X-CRM114-Status: GOOD (  14.72  )
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

Convert the ADC clock to use devm-managed APIs to simplify
resource cleanup.

Signed-off-by: Mohammad Shahid <mdshahid03@gmail.com>
---
 drivers/iio/adc/bcm_iproc_adc.c | 17 ++++-------------
 1 file changed, 4 insertions(+), 13 deletions(-)

diff --git a/drivers/iio/adc/bcm_iproc_adc.c b/drivers/iio/adc/bcm_iproc_adc.c
index e54f613d266a..3bbf814d4c8f 100644
--- a/drivers/iio/adc/bcm_iproc_adc.c
+++ b/drivers/iio/adc/bcm_iproc_adc.c
@@ -109,7 +109,6 @@ do { \
 
 struct iproc_adc_priv {
 	struct regmap *regmap;
-	struct clk *adc_clk;
 	struct mutex mutex;
 	int  irqno;
 	int chan_val;
@@ -510,6 +509,7 @@ static int iproc_adc_probe(struct platform_device *pdev)
 	struct iproc_adc_priv *adc_priv;
 	struct iio_dev *indio_dev = NULL;
 	struct device *dev = &pdev->dev;
+	struct clk *adc_clk;
 	int ret;
 
 	indio_dev = devm_iio_device_alloc(dev, sizeof(*adc_priv));
@@ -529,10 +529,9 @@ static int iproc_adc_probe(struct platform_device *pdev)
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
@@ -550,10 +549,6 @@ static int iproc_adc_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	ret = clk_prepare_enable(adc_priv->adc_clk);
-	if (ret)
-		return dev_err_probe(dev, ret, "failed to enable clock\n");
-
 	ret = iproc_adc_enable(indio_dev);
 	if (ret)
 		goto err_adc_enable;
@@ -575,19 +570,15 @@ static int iproc_adc_probe(struct platform_device *pdev)
 err_clk:
 	iproc_adc_disable(indio_dev);
 err_adc_enable:
-	clk_disable_unprepare(adc_priv->adc_clk);
-
 	return ret;
 }
 
 static void iproc_adc_remove(struct platform_device *pdev)
 {
 	struct iio_dev *indio_dev = platform_get_drvdata(pdev);
-	struct iproc_adc_priv *adc_priv = iio_priv(indio_dev);
 
 	iio_device_unregister(indio_dev);
 	iproc_adc_disable(indio_dev);
-	clk_disable_unprepare(adc_priv->adc_clk);
 }
 
 static const struct of_device_id iproc_adc_of_match[] = {
-- 
2.43.0


