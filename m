Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6280C79F99
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 17:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZQcP2F4emeVQ9JpkX9Int2YPn5v7ZeGN+IRcU4vsCsU=; b=IE8S6v8c0OHSOj2hkfMj993NVQ
	wERGBqdSjGzjN6Ggf5+UfZoLAZSWrnY80T8jVM/ah2pLjBH86QQJNG/pf7h3CdaLbgw4twF5q6ky6
	ecxLGppaRqwgcpMD9z2orhPZbH42EhLwSSup+GO6BJa5IwMQ9pGIprdEYKuVvQQnRDJ+e2Ympthsl
	08tbASt3kv6Q3cIEdUXCDRBvweXVI9/L0+jzltawaoaRGzEA7wn0j6sOwmwegiY1lxUUAEFD3h2OK
	m0PegDrtXqsU6XKnSk706T5Ehr4qf0SbfrPcUDUXTXNXO4kRrAsHq03m/9bQt3QDrgwGeCf75xB23
	4qa7nIQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3zZY-00000009oOk-2zhi;
	Tue, 08 Sep 2026 17:25:28 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3zZN-00000009oLI-0wUj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 17:25:27 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-38ea87caafeso4056792a91.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Sep 2026 10:25:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788888316; x=1789493116; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZQcP2F4emeVQ9JpkX9Int2YPn5v7ZeGN+IRcU4vsCsU=;
        b=DUuM3n2GOP4bipW5dLp/6y4fg/M2mEhCYhczJNm272byE7vb4VbxrIKJCV6BHqAG6W
         vsb7le8PngXkyiVWEXUMqA1xc/llbhyBjflrJoxneMFoWwgqs/9g4HPwSo8YA/uw4u4I
         kORPzYx1UETgermds1S5D/rH60KeJ1LwsCeJ9l7RyQeVMzLsZawNbv422JaWu3aes5Tj
         CACi1d9W7T7yoZjrxfZ5llwnjEqbRzQSvkawfU0QQ0tkv+Fp4iZE/7dQWS/60Av8ZiKG
         nrLCyEQXooGumipYO1jrbyFpayhyebE71QuGE0X/84dG9dW9aGn+tHzx/OPS/zPnow6P
         q22Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788888316; x=1789493116;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZQcP2F4emeVQ9JpkX9Int2YPn5v7ZeGN+IRcU4vsCsU=;
        b=ULC5HG0Pfr0aaR+xmPPS6LiWVXaVYa4loM/5qnnBK9E64EnxvLUYsiF0bCeCraK5E4
         OI73BySqn8KJVGX3OHOpnhpMSlIx51G9BBpKntusPoqlfKUmE/VpmqrtZq0bJ+sJeI5B
         CJjQcARrSSJJ2Z3HHkumFH7rD3bBib7R+pfaK/Vacsr6Faji1u/iwbRNUYVhC3NRjr+R
         +yNTJ2F58wbpdMQIOJSJeqGlqkOMNBBJSl/c4KJNK9CIZtpRyISwGloooUs2H4ZTX72L
         EZXpAeWJUXcGrHo8Ol3oIC1KYhg2JT/qBozcWdDfRA7Lt+cGk08C1PhijtkALWoj0LTV
         fqUQ==
X-Forwarded-Encrypted: i=1; AKwUvBx10Xo7vkijyn9MMRj104nldC2MxKobHS/+5KfhLcxG8pBMfbGLejtfjE8QYFB6TvhCinYdkeVEEGJX6WJeIC5l@lists.infradead.org
X-Gm-Message-State: AFuF++m9hW5oWlIvkSyn/hx15+3x10uqKz7K8q5MmAL0leY05EDGkUfa
	o99zUzpek1C4nj7QqBRpeOJmGQMy7r+frtr/8a9qgyxkFPHbYiGaEn3L
X-Gm-Gg: AYBFou0u94R4/PMHcNka9aFvO9MqNdpQSnz1ap6zvgCYJPg6y+Jea2FNj4by8hEBHtI
	SDE9Q+gziGjQxHRbVgZtw3tl/izi5AL8NDHW9KKSs+LGPcFtfAqc5ZCH5KhfJ1Lk/BaHIU23wRI
	qaSv2fi8fj1fwSmgorcXHZ0tLkezyyYsQiRhYGHZYq/9NykSYtWgItsl4cpkHFwG7ybnFaMk2My
	M4/+7MH0ceXC+CHu0Q5YfKY5Q54nyISwlTTQG8hEvrPkOcDhf8O5uw9QAXchNEDwEb4f2jtz6E+
	L49+MDg1KkFFGG8tN0CRobX+jx+82KRPwHGZtfMKXR8W1oNmxgzyNNFcxvF8amKICsoSukwFfIV
	a/nxo70B22LplsHFQuYZIYi5KlDR9V4UvcDvghv73vMoZqjnyblbm1ltkeh6SLjTrxv+dOkWrEi
	uog+7bw8QqFK8BoiPz95yusPOte5cKxAFFLqh0fR3vrmzWdIJBYTgI8wvDlYQ=
X-Received: by 2002:a17:90b:3a81:b0:398:c292:ac80 with SMTP id 98e67ed59e1d1-39b2612eaa4mr42334724a91.10.1788888316179;
        Tue, 08 Sep 2026 10:25:16 -0700 (PDT)
Received: from ubuntu.. ([2405:201:8026:213e:43ae:bf76:d99a:e5ff])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33688cfc714sm19297176eec.20.2026.09.08.10.25.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 10:25:15 -0700 (PDT)
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
Subject: [PATCH v4 3/6] iio: adc: bcm_iproc_adc: use devm-managed clock
Date: Tue,  8 Sep 2026 22:53:56 +0530
Message-ID: <20260908172359.30003-4-mdshahid03@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260908172359.30003-1-mdshahid03@gmail.com>
References: <20260908172359.30003-1-mdshahid03@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_102517_267226_41722DE4 
X-CRM114-Status: GOOD (  15.68  )
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
 drivers/iio/adc/bcm_iproc_adc.c | 19 +++++--------------
 1 file changed, 5 insertions(+), 14 deletions(-)

diff --git a/drivers/iio/adc/bcm_iproc_adc.c b/drivers/iio/adc/bcm_iproc_adc.c
index 21bd51da9cd6..d6f82f8ddee1 100644
--- a/drivers/iio/adc/bcm_iproc_adc.c
+++ b/drivers/iio/adc/bcm_iproc_adc.c
@@ -110,7 +110,6 @@ do { \
 
 struct iproc_adc_priv {
 	struct regmap *regmap;
-	struct clk *adc_clk;
 	struct mutex mutex;
 	int  irqno;
 	int chan_val;
@@ -511,6 +510,7 @@ static int iproc_adc_probe(struct platform_device *pdev)
 	struct iproc_adc_priv *adc_priv;
 	struct iio_dev *indio_dev = NULL;
 	struct device *dev = &pdev->dev;
+	struct clk *adc_clk;
 	int ret;
 
 	indio_dev = devm_iio_device_alloc(dev, sizeof(*adc_priv));
@@ -530,10 +530,9 @@ static int iproc_adc_probe(struct platform_device *pdev)
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
@@ -551,13 +550,9 @@ static int iproc_adc_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	ret = clk_prepare_enable(adc_priv->adc_clk);
-	if (ret)
-		return dev_err_probe(dev, ret, "failed to enable clock\n");
-
 	ret = iproc_adc_enable(indio_dev);
 	if (ret)
-		goto err_adc_enable;
+		return ret;
 
 	indio_dev->name = "iproc-static-adc";
 	indio_dev->info = &iproc_adc_iio_info;
@@ -575,8 +570,6 @@ static int iproc_adc_probe(struct platform_device *pdev)
 
 err_clk:
 	iproc_adc_disable(indio_dev);
-err_adc_enable:
-	clk_disable_unprepare(adc_priv->adc_clk);
 
 	return ret;
 }
@@ -584,11 +577,9 @@ static int iproc_adc_probe(struct platform_device *pdev)
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


