Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC68CC5516F
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Aug 2026 09:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PgxBTc/eAxhpXNXIIpPZ/eJLF5hZIUUNMPVKiLuD+Wo=; b=F00TPpY3F2I4Hq+Lgsy0XvsXa0
	pywiHh9AGRmi0kI98FI/HF+Wby4ZtAyvEH7GT04umJUNgPhuq+fcXS/6BeaTB6Xt1U8FXAJ8GoqvI
	syWw/QFwdRbT14VeXOr0H5ElDdEfWSXIl/cciU49DgMprax7pU5kQ7L3s+P8jDfz3/auSJIFg+kCZ
	H8q/BgaFeUiYCnKcwhKmCWJFK8z1tVjy7j+Sq9eqhDS50PANxrfnIUtNLWdDUcIGaSWlyojiZijz1
	Q0NbxkisPHsr85btqKf/lxs3iORMtpeSP9tUZYK6dx7wNFOhnL7Xi9UzMTNKuq/o3z1t+GoxTUdDe
	+t8vl3VQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wq5k3-0000000E70W-1Skd;
	Sat, 01 Aug 2026 09:10:51 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wq5k1-0000000E6zs-3NEP
	for linux-arm-kernel@lists.infradead.org;
	Sat, 01 Aug 2026 09:10:51 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-c9e607d81fcso1028849a12.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 01 Aug 2026 02:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785575449; x=1786180249; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PgxBTc/eAxhpXNXIIpPZ/eJLF5hZIUUNMPVKiLuD+Wo=;
        b=CDPFRzAd4m5o05lMMBHyTtF3Vfbdk9yng6ZAfQhyyqNyiuL3rDsNT6qh6vLMgqGkyj
         fFsWj7knolDj7lL4BX50SugIt49IZrQnX4gJDm9xTSkmzeiIkjxnz4vrx+7uzpS89CR3
         p+AtNNoTvhXurBjxoOaOwu3SLQOJ1zkAja94qChGFK15iDj7CVJtZL5uLaIyllmcVrLw
         +Tx25iOSItchpwxNDLlMn6k9RSaGArZJ/p0ExVzn7As5kV3KfMe3snmhu5zRTQN2neRG
         8U90i5eexN0NSe5aEmrLpAeuDfHqUj7TXvYhF+ogPEdACDUA0iJ9vLfysB7RDR4HlZfh
         rSbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785575449; x=1786180249;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PgxBTc/eAxhpXNXIIpPZ/eJLF5hZIUUNMPVKiLuD+Wo=;
        b=SHA+DeQSQHSybw18OrH/xKmDMtPQauFYw2AkkSO6XyN8hw5CTYkzGcGD+7JtUZRk84
         lOcBadp5lriU2y+9c/N+7VZHIhG1dSuVZqIgA9PVcJxZCU5hf6PrXrVXGdUA0ccZ94zd
         pOquTd/K8PRur5FqFC0L6/j/Ti/oPz07OfKWYl5j8/Y6gicXaIoeG+HOi/KMkGR0H2Iz
         3fI0UCFz8CeCqQWVS3oAf5YfgCEGsPxupxxNtFa9EX1kt0O+IjNfVvj0v4q2TLsYFbHv
         Fzcmyird9Ij5uEEokYZSJ9vVZcbU2xwyxjkgWfYOgEyvN1k+kS7lNuhASeUJKcaAt68u
         BwFA==
X-Forwarded-Encrypted: i=1; AHgh+Rqbqz8lYvsw8geiad/xBo/RvUpVebLgIl5kMXpKc4aaqsy8/TLW+uzZv2YUIAcLvSPbo+GmUBwufWfBup61ZDuK@lists.infradead.org
X-Gm-Message-State: AOJu0YwzV3suegXBIUSSP5Sms2ueKMctEf7GnKuEnTJszGUtYlmIcZrY
	YqN3VxvQ7Vgzjssg9mBTlMUmm9p28AJkne7f8DUBLlKTkeIEbcGmEsXB
X-Gm-Gg: AR+sD12WQ8V2fSP6CoAFLe+Tn/iIG96PQ+yXUSOCHjlXHQMSRjbFSCB8H76LlI166n9
	qZoFFlsk4cXopZhv3N8YdZQ4ThsUP7zi7wbmIB4gYbXrqOLHvWrbJTVmRALjVDIJ4yWziMio4QF
	lOMR/6KllTKGGlRQc+bkDP0wfBLLabdmidegwzVNAKteUFzWI+OWKWS2eQTrA8FV119MvhE9jAu
	5J0sUJk5GlVKg9/sF2sbhztoqmYK0IJX5jU+SRl2IyyvIkMhkLZqxdgsg5sYQVRQmhJ4l37MGdr
	jDZKiYpUumm/+FKLwoWNzkD5mG5y0w2V92cPVQfV1hhOEPNoFB0hjmtwqMdaim8LTmDQS85Yd3Z
	etE+1UrPWCqV8cNRfxYWXF8+e135olHzyn+lOHrrBKYatu0KdRSROdPFENccKo9FBp/j8OhBwSr
	ZfMucXb9CPtmglDC6+xqVvoHu931gYPbjOVxOm9QbF4YvHWBWztNsaVU9xSg==
X-Received: by 2002:a05:6a21:2212:b0:3bf:9b61:f7ae with SMTP id adf61e73a8af0-3c92a75b245mr2888824637.14.1785575448667;
        Sat, 01 Aug 2026 02:10:48 -0700 (PDT)
Received: from ubuntu.. ([2405:201:8026:213e:36ae:7de2:5cca:938])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153dd9c96asm15432431eec.7.2026.08.01.02.10.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 02:10:48 -0700 (PDT)
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
Subject: [PATCH v4 3/3] iio: adc: bcm_iproc_adc: Convert probe error handling to dev_err_probe()
Date: Sat,  1 Aug 2026 14:39:53 +0530
Message-ID: <20260801090953.61603-4-mdshahid03@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260801090953.61603-1-mdshahid03@gmail.com>
References: <20260801090953.61603-1-mdshahid03@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260801_021049_854669_26C0AAB3 
X-CRM114-Status: GOOD (  12.44  )
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
dev_err() and return sequences while preserving the existing
messages.

Signed-off-by: Mohammad Shahid <mdshahid03@gmail.com>
---
 drivers/iio/adc/bcm_iproc_adc.c | 39 +++++++++++++++------------------
 1 file changed, 18 insertions(+), 21 deletions(-)

diff --git a/drivers/iio/adc/bcm_iproc_adc.c b/drivers/iio/adc/bcm_iproc_adc.c
index 4acd9c3f089b..5fcd528eb88a 100644
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
@@ -556,11 +553,10 @@ static int iproc_adc_probe(struct platform_device *pdev)
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
 	if (ret)
@@ -574,7 +570,8 @@ static int iproc_adc_probe(struct platform_device *pdev)
 
 	ret = iio_device_register(indio_dev);
 	if (ret) {
-		dev_err(dev, "iio_device_register failed:err %d\n", ret);
+		dev_err_probe(dev, ret,
+			      "failed to register IIO device\n");
 		goto err_clk;
 	}
 
-- 
2.43.0


