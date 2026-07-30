Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63AE1C55165
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 14:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hJ72M8reVIZqxbhzSXS1Mi2+37hAcyZSuGI4YdKYzKM=; b=nEgktyAhNW0Thyt4iwRzJFkmAX
	3moI/dZ8SwVLb67XzVbCNKITjiBe8m0nq+XHDkP+RRUVPMw4XZJAWNNYbjG23xhFdEv+iDvmqtioe
	aHDGaidYJxScVtWt3+15gepTxq1Kuj32N/mU0dSWe55pKS5D0RfgDOdYEU65HUaJhq/7KiSk7GgaZ
	Wsxm45fxEjmZX05hawTCnBhYMnJe+WCetMqcjD1Xl85oTD46PiAIkSTCjZ+H8H0V+vyVsB6J5LCXk
	6zxH/5bgCE6GrR6szYAVMr3XxdGL+LepwdvXk9LlfuAD+tFcqUHk64EftodX4eo49L8k6ye8ro5LC
	Ye0z0Hzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpRPK-0000000Ahku-23pR;
	Thu, 30 Jul 2026 14:06:46 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpRPG-0000000AhkH-2Aql
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 14:06:44 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-848d21bbaffso2406704b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jul 2026 07:06:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785420402; x=1786025202; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hJ72M8reVIZqxbhzSXS1Mi2+37hAcyZSuGI4YdKYzKM=;
        b=M2DKQVozv0ACwO/HGlnbHAklHJqTBRoCC4GMYEzg+lQRn+jdFND/jUyB3HxpK4suDh
         8hFJ2PKeYFNkJvdM+mqvYoUDfS7GTFIjip0N/uJ1YHD53C8+UZzzAd9rSnxFJKeUSoPM
         EmU4oDk9ruNw1VYA9r3jBsU6Qg9TfG2b8olDYlscvmuDUYN+yOK3LjmECpG1ayIMe7Nt
         0ZKP7TWMKM/1zt7QSdqPkQNexOvw5MIqw+24BjZmp8U29d6vhh24pbhZqjFIiHeVFPHB
         Vk4MgZ83mNDwPuY2wTqMsIr9HmRN2tcPJBAk2zAbopU0Fx5Gl0c4bjIoZlC2CYtfs/oq
         AqAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785420402; x=1786025202;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hJ72M8reVIZqxbhzSXS1Mi2+37hAcyZSuGI4YdKYzKM=;
        b=iRM1Q8Y7gshyCw9CMEf9t2Gshjez6lUKa2UP0Boys8fyQ3sOP1hB1kC/otAbLKajsB
         I+oJQQdmzrRoCeRtsz0pURitIz6bheXZN4lEeL8J6WbW3UaOcrpnMfGbHidwPXkqnrj5
         LEeaqGBLRmdQZD0jJjHwvMLU6kR6rdKNXIZOJzAhBrypJwIk/D19EgvVflcBwi2Oa+Wf
         7FasbUtKODhnakYzzh/KxWZOa8u7EWwZ2/RBW93nDF/6ELvQZJR06ycqgMdRhJrveuQK
         g7+32cfyRgdAMcpUxcqGORhhrZdfJ/Mm1gswrDkv+E/9WcpN2f+pdOvko7yjwQ064e97
         ccPQ==
X-Forwarded-Encrypted: i=1; AHgh+RotFsViGsznD0wveWFO/Ya+tqIDKBmkprpSQuBu1V/pDG3VayuevqRGNkzsGGMV2mf1oIx/RIeCHmST1237jl4g@lists.infradead.org
X-Gm-Message-State: AOJu0YydFTbeJAmEVmrkhdhPgZcuzTUT+uOtqPZ1iKcUTEN0yC/jcrRn
	PpJ9ycj5pcBLrG17XEfD+Xjy/u1g7z2giuoRzZoEey2BqwpZNDoLAou8
X-Gm-Gg: AR+sD11V+HMG8EFoagV8v2ZI1X3Vur23JqnX2A31nECvOkcQ0S0M0srqh73vsRC9Ndt
	Goprc/bpAMh7dminbp5KlHqRKQSm9F5EwvzgL0EbiNZdVn/hxXI/gFZ4DRJbA+8XYOkxMfFIE6p
	5wZoSH2C5SFdziPG3OLvBRqEH2bZUdUZhrfPgnJJ+6e/hX/GIryIEzaPlkbD0qefitSY3B0CSY2
	wwIwTvNhcBZfkox1FSBfYc7PloyHkn5Unpt/BGTWcNLSXsQc0UQ59ZUxSiN4If5u+JlScwCWuVW
	ROPB6VVaVUkU5ibfN7TZk5vUadT0qmHOnmQJlTjbNTDeB5l1YTjHMIeVaPZO/VY/mZEU/csxZJ8
	K3EyL8BqmXdKl3ZsiN3q5Z0j0EGiWTe9QcD0LQsAzn+svwWopst7BKZwOXxVCzNqxTID5bPCf6e
	nrImqh/phWGH977/eU5FOsFUz0zKfBgxXHm+BqQtSNuvCGFJbI72cCzZrw0F4WS5D8jQJjbT8=
X-Received: by 2002:a05:6a20:7346:b0:3bf:d0c8:2aa4 with SMTP id adf61e73a8af0-3c90067d9a9mr2533292637.8.1785420401598;
        Thu, 30 Jul 2026 07:06:41 -0700 (PDT)
Received: from ubuntu.. ([2405:201:8026:213e:5fd6:849a:c1fd:20ef])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31504b15f77sm23551069eec.4.2026.07.30.07.06.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 07:06:41 -0700 (PDT)
From: mdshahid03@gmail.com
To: Jonathan Cameron <jic23@kernel.org>
Cc: Andy Shevchenko <andy@kernel.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	David Lechner <dlechner@baylibre.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mohammad Shahid <mdshahid03@gmail.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>
Subject: [PATCH v2] iio: adc: bcm_iproc_adc: Convert probe() to use dev_err_probe()
Date: Thu, 30 Jul 2026 19:32:45 +0530
Message-ID: <20260730140405.369634-2-mdshahid03@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260730140405.369634-1-mdshahid03@gmail.com>
References: <20260727034009.5c6b0be9@jic23-huawei>
 <20260730140405.369634-1-mdshahid03@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_070642_581525_6B189B8C 
X-CRM114-Status: GOOD (  12.73  )
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


