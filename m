Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0077C55ABA
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 02:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j1R+uohEcau7J3FUtUcinA4r58oNSFhdAhr/+2ENdYk=; b=bCjOj/T13zf7nxYJfzCQSQ2bKN
	DkU2qI1A8KElcIdSHLo9uOparXcCEZo4RiH39mLWUIt6qZbNXUp5lJEMnSUsyUKtjQJ2s+jm0u0Py
	kDN1zNTctgssa2CRwGonFM8L19mwVZaxLeRtkcaF7GBfBV9jQvTwyHO+pRpo1YWHTIrkvuUnXO/qS
	5ElpA+ZVGHR+9wGCOo5JRc6D/dzcwdk4ojf+5CtrN8UKJjlL1bszRgd2hdaNVyv4Xsp8gvSVVjfvu
	5p99THY8oM8gTSNGHCoGmYFWbVtFKepQ3qoX8bvY/uW7dUwdp8nofDrjVPa1GuLdKmkoGHXEH6eeO
	/rdX3SCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wro1X-00000004pI1-3g27;
	Thu, 06 Aug 2026 02:39:59 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wro1V-00000004pGb-2s7S
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 02:39:58 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2ccf2360620so16971435ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Aug 2026 19:39:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785983997; x=1786588797; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j1R+uohEcau7J3FUtUcinA4r58oNSFhdAhr/+2ENdYk=;
        b=B5YAV6BnuMJN+N6rB4EQizr/SIHB7hkeDIaCjmiQMPSpfMe8aeVsRAZDrc5ZlRL2xX
         0YnLx/zxu2ddktzTpmd004CMa+AT2YGQjJfuh8jUQKeHYwM4dD4RWHZRBhNLec9tKuB+
         fjKusxY52jN5mCRAK1xigBUZC/X4n2uSeAemqlR/B9O7mh7anBaeXNowwLAmMkGbRhpb
         VcZHtBFLOQ4eLYnNsI9bRjNiddphWiZG9q6ANl748LtcY9z2cyk11bJ97v1QMOhoeHm7
         gz16AAXlpOjIf9QtqY45v9pAw2yLQwogTPHGWq2heWl9xNIE/RmVhVF+Gw0n8wm0MRIe
         fQ1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785983997; x=1786588797;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=j1R+uohEcau7J3FUtUcinA4r58oNSFhdAhr/+2ENdYk=;
        b=HuYuA3xkyR4/Yx13UOG3Kfm6Uo9n3RVPuKCqi6Z34QQCOfDK+5wdNs+r670fhSbAiS
         hpIJIwR1Ee3CcBG1wWHrHYjHIYzhZVc81yxIiJy2COwPRmu5KJkJdJBUWEZweRWWFCI/
         mjkeXCwzws8VW6IxSVy8Fah267POf10A60j36VdPv3KWDLJWKgwTz2R05jzHziKtJlRp
         FXYIK6Clb1Rs45j37dpVtNnUFVRqqsBSZV1tSxXKkJgbYkdssbk6SR2cfJyxj8kT1h5g
         05BXS63S/7cG2iEfA2Qs2P9M5Ra24cyTGn5UDzFa37B42SzpM6Dz1Aw5llS6INyIQBt6
         qW8A==
X-Forwarded-Encrypted: i=1; AHgh+RptF3UDI6NeWZKJmimQODovyF2lITJPi7yQjWolSOr9/5MyfNjfD3jeNig8fD3CJiiGTrnF6lGQO15KEIrFWWQ5@lists.infradead.org
X-Gm-Message-State: AOJu0Yxeb6bK1Ap3tam3ukgfAMHRP4wZjJ+bSsU6dKaWb0m+fqw8nf+P
	AzqrfCodN2j/6eHdBBrtPrOrPs2DxW8FEDa8YL/7GPXptyGFWPSjvuDy
X-Gm-Gg: AR+sD11IMh0DWo2SwCHY9mPnkeqE9vgy5hidoXFdP55cRETVWNCpX7rrskaSMh0AoaL
	PVA5CSJd+43HtTOy922dLo81biQrHOfzxqpUxktyIQ7GFglFNHXxC4GIyX4v2MhfL7lJARlyO5H
	YIOXeaI4DkB43tT36e3KxJ1wU8zeQCi9K4BC5KO+epGZjSBwyMfqz+lTOYJh27oeo6SY9PBjF7F
	m5an2g/5dKse+tRvXrrL2GIPGuKj1TSElNAlp2OGwDQyRzEb4ovKKMnuP4g3jjOZAlyiKnvyYZc
	CV6YvHPqJFG/rzIUqp/vXQnpHtoikZPH9GBe/2ZOfF6DNGO/rnUgoTyu1H7gC9cysaFYXX27p70
	RjNETSRA6z++X9fIfsEtWL2zydhWj6RzwrrjVtKj/xi2FbBqyGHX/rs8AoKih9s76n16MQW/4bF
	jbbQMSweQLrT/pE7ssiGECGCLeZx8fjwhlB8My3tRLMiZn63Kus3svs9rcVIA=
X-Received: by 2002:a17:903:3888:b0:2ca:eea:eb5c with SMTP id d9443c01a7336-2d0ca98137amr124962515ad.18.1785983996637;
        Wed, 05 Aug 2026 19:39:56 -0700 (PDT)
Received: from ubuntu.. ([2405:201:8026:213e:3194:1e48:e141:80ab])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315867d4929sm22404383eec.30.2026.08.05.19.39.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 19:39:56 -0700 (PDT)
From: mdshahid03@gmail.com
To: Jonathan Cameron <jic23@kernel.org>
Cc: Andy Shevchenko <andy@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Markus Elfring <Markus.Elfring@web.de>,
	Joshua Crofts <joshua.crofts1@gmail.com>,
	linux-iio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mohammad Shahid <mdshahid03@gmail.com>
Subject: [PATCH v6 3/3] iio: adc: bcm_iproc_adc: Convert probe error handling to dev_err_probe()
Date: Thu,  6 Aug 2026 08:09:02 +0530
Message-ID: <20260806023902.8608-4-mdshahid03@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260806023902.8608-1-mdshahid03@gmail.com>
References: <20260806023902.8608-1-mdshahid03@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_193957_725790_02ED2EC8 
X-CRM114-Status: GOOD (  12.82  )
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

Replace open-coded dev_err() followed by return with dev_err_probe()
for probe failures that immediately return.

Leave error paths that jump to cleanup labels unchanged to reduce code
churn. These paths will be converted separately together with the
planned devm-managed cleanup using devm_add_action_or_reset().

Signed-off-by: Mohammad Shahid <mdshahid03@gmail.com>
---
 drivers/iio/adc/bcm_iproc_adc.c | 30 ++++++++++--------------------
 1 file changed, 10 insertions(+), 20 deletions(-)

diff --git a/drivers/iio/adc/bcm_iproc_adc.c b/drivers/iio/adc/bcm_iproc_adc.c
index a07a590662c4..ab66b97d2f04 100644
--- a/drivers/iio/adc/bcm_iproc_adc.c
+++ b/drivers/iio/adc/bcm_iproc_adc.c
@@ -522,19 +522,14 @@ static int iproc_adc_probe(struct platform_device *pdev)
 
 	adc_priv->regmap = syscon_regmap_lookup_by_phandle(pdev->dev.of_node,
 			   "adc-syscon");
-	if (IS_ERR(adc_priv->regmap)) {
-		dev_err(&pdev->dev, "failed to get handle for tsc syscon\n");
-		ret = PTR_ERR(adc_priv->regmap);
-		return ret;
-	}
+	if (IS_ERR(adc_priv->regmap))
+		return dev_err_probe(dev, PTR_ERR(adc_priv->regmap),
+				     "failed to get handle for tsc syscon\n");
 
 	adc_priv->adc_clk = devm_clk_get(dev, "tsc_clk");
-	if (IS_ERR(adc_priv->adc_clk)) {
-		dev_err(&pdev->dev,
-			"failed getting clock tsc_clk\n");
-		ret = PTR_ERR(adc_priv->adc_clk);
-		return ret;
-	}
+	if (IS_ERR(adc_priv->adc_clk))
+		return dev_err_probe(dev, PTR_ERR(adc_priv->adc_clk),
+				     "failed getting clock tsc_clk\n");
 
 	adc_priv->irqno = platform_get_irq(pdev, 0);
 	if (adc_priv->irqno < 0)
@@ -542,10 +537,8 @@ static int iproc_adc_probe(struct platform_device *pdev)
 
 	ret = regmap_clear_bits(adc_priv->regmap, IPROC_REGCTL2,
 				IPROC_ADC_AUXIN_SCAN_ENA);
-	if (ret) {
-		dev_err(&pdev->dev, "failed to write IPROC_REGCTL2 %d\n", ret);
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to write IPROC_REGCTL2\n");
 
 	ret = devm_request_threaded_irq(dev, adc_priv->irqno,
 				iproc_adc_interrupt_handler,
@@ -555,11 +548,8 @@ static int iproc_adc_probe(struct platform_device *pdev)
 		return ret;
 
 	ret = clk_prepare_enable(adc_priv->adc_clk);
-	if (ret) {
-		dev_err(&pdev->dev,
-			"clk_prepare_enable failed %d\n", ret);
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to enable clock\n");
 
 	ret = iproc_adc_enable(indio_dev);
 	if (ret)
-- 
2.43.0


