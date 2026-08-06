Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CC0AC55174
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 02:39:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xYUmODFIR/IRQId3RZvFC3D9rE53RZwWUE1u52S9Ovc=; b=MUnkMVRPi3XSLfguae9+pAeaLk
	ymzMhWoAGKInI0U7TA2BPlj/2Y4ZqY3rpjXQHA5ay23mcQ670lWdF6uEBv6iYwoehCYFOq9V1jjJx
	5GO2K3fyp/aS9Xz1p1jmk9X1zL456vPtMLSZmQNJV7K8Vsg5UhDcTLfR0k1O5x1IsdmxDZU4Kf3Hd
	GzFvFVHrOKDIIzvfxDO+vKr0LRDLuTuKZJo/ELwoFzhyxCbgHoI2WMzZrzHqpadLikX24F/+Xj04G
	0NR9XeljDT9lE0/QlFzEp2nFRsZjK2AbpdgR++P0sKzZ98o9SEdoWupzexyACTcfvBFymHvcW3sbf
	ZJ4PE5OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wro1N-00000004pDh-3IbU;
	Thu, 06 Aug 2026 02:39:49 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wro1L-00000004pCx-42hq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 02:39:49 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2caced6038eso5645115ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Aug 2026 19:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785983987; x=1786588787; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xYUmODFIR/IRQId3RZvFC3D9rE53RZwWUE1u52S9Ovc=;
        b=hoFloupXuniD4oitU7hx2+pa/BRjqdqmaH1No4fNmL6nGdu0fnFF0NGSzgsZZcRpk0
         NjptO69ogSOWH6VrV5buewoMF6xqm4XD/g9yFpX3l/DOg6qaw+GQJS7dqIi2vZhToGY1
         bHElpeJ3apnqpBoqa5d1L6u3jZjKR7XN1vONGJU4l7iMe8YZPRTQYm3ficeI16h9tAqp
         nJ30inrDmi8na0hjpz2PUwQjgYThgAtP9ZKpGpvWMGTUybTMsYAu8t6dYKG4HZ0OM3O3
         hZ9MHCQ9aV9oXwFF8sgSqpGSrllINIhAalZ8jM0mP0sfwnwO91iEPoVckCM3jxXQphrc
         ypTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785983987; x=1786588787;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xYUmODFIR/IRQId3RZvFC3D9rE53RZwWUE1u52S9Ovc=;
        b=CwqUDOjfiHhSfwPQ/mur0eZ8iZScNR9SiLKceW27fHMXznYiDU2zC2GevUH4JAGfpr
         ZnOIqQ0xtwKq8jFhv4wwy+4pS6pz8gAe3LMrVzMGOO9QVOtDx+dErqMrErSNM6Aj2fVb
         H8uNgcq01VJxhF58BTfGUTUQdEAnd1ImRsXRsc0SVnySA1BarOgoL/C/cuWjDs1d+w+q
         iiRrN701ynHZlK3nBfPZ0kbPGhadrYHtRh4P5NqPwoZOQRJWzb4lwOLXnoBRWVLOZvWs
         dz3i0Npup9Bx4+49AFSMGJx9bm0RrJC/CFBdfnNj2/PBZlAFrx2upw8Egv9O7yWyVetL
         a4Jw==
X-Forwarded-Encrypted: i=1; AHgh+Rq6Hgck12cpmlUWHNgACKZyfI4LicDS1XVhTYi/lXxodXGgHgrzEDa4LLIE3s4I04zGmwJLPrfqslyICiGwQOjo@lists.infradead.org
X-Gm-Message-State: AOJu0Ywe933ha0CeBKk1tYki8av/rWL89zWwd1l5J2Ma9a1F8axiVlN6
	ad8BfZocH3lv1AGz++7UyPSFI1vHH2vLTXsZsSh/TGH0cxtBwunyEhdW
X-Gm-Gg: AR+sD11b+4ksXw/Cce11i4xUjHC7ILW41mMbLnsvsTTfXOvJQgFfgWVuaBAVplJMsn0
	H+ffmtdAnwJFoApwnb9jwFzO7tfoNI0Zi9tdeIT1QVrawHYX3CqBGAKOiCA0YUSwEv3+fiJX/v2
	JNn9QUNHgMrbGgcJ0FA820JjT/VoyCK+Os5G25oft6SzRaOoZV1wUeRN/RUZYjljfKJSqu4w007
	JByQ6ODA6b9hqQMpDwlXWdBPU+/hp0Quew/xRyvgerewG25jUlA9Mh6TRVv2eyhWAqQYlJIixtj
	JiYknnHpttP8jY0HrmscJBynv+pYitJ24RCO9qjN225hyLg4/N6Kae5QAMDEXhiAlEYLQ8synH3
	jFEyhPQXLVRX7r7uK8a8b530RDGHY3gv5q/qmMTAECLSi3OAV01WHcKeyatfH92ocZtkl+17+eo
	/jQ+Q8csbaQUU+mnm7rkugI6G7h3W+WZrs/+xvzbweKDahof3MsSaaeKZxTKo=
X-Received: by 2002:a17:903:38c4:b0:2ce:a6a4:451b with SMTP id d9443c01a7336-2d0f1c130bamr41161845ad.11.1785983986900;
        Wed, 05 Aug 2026 19:39:46 -0700 (PDT)
Received: from ubuntu.. ([2405:201:8026:213e:3194:1e48:e141:80ab])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315867d4929sm22404383eec.30.2026.08.05.19.39.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 19:39:46 -0700 (PDT)
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
Subject: [PATCH v6 2/3] iio: adc: bcm_iproc_adc: Introduce local device pointer
Date: Thu,  6 Aug 2026 08:09:01 +0530
Message-ID: <20260806023902.8608-3-mdshahid03@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260806023902.8608-1-mdshahid03@gmail.com>
References: <20260806023902.8608-1-mdshahid03@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_193948_007375_D79A5864 
X-CRM114-Status: GOOD (  12.97  )
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
and use it for device-managed helper calls instead of repeatedly
referencing '&pdev->dev'.

No functional change intended.

Signed-off-by: Mohammad Shahid <mdshahid03@gmail.com>
---
 drivers/iio/adc/bcm_iproc_adc.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/iio/adc/bcm_iproc_adc.c b/drivers/iio/adc/bcm_iproc_adc.c
index 7c2e2770cd61..a07a590662c4 100644
--- a/drivers/iio/adc/bcm_iproc_adc.c
+++ b/drivers/iio/adc/bcm_iproc_adc.c
@@ -506,10 +506,10 @@ static int iproc_adc_probe(struct platform_device *pdev)
 {
 	struct iproc_adc_priv *adc_priv;
 	struct iio_dev *indio_dev = NULL;
+	struct device *dev = &pdev->dev;
 	int ret;
 
-	indio_dev = devm_iio_device_alloc(&pdev->dev,
-					sizeof(*adc_priv));
+	indio_dev = devm_iio_device_alloc(dev, sizeof(*adc_priv));
 	if (!indio_dev)
 		return -ENOMEM;
 
@@ -528,7 +528,7 @@ static int iproc_adc_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	adc_priv->adc_clk = devm_clk_get(&pdev->dev, "tsc_clk");
+	adc_priv->adc_clk = devm_clk_get(dev, "tsc_clk");
 	if (IS_ERR(adc_priv->adc_clk)) {
 		dev_err(&pdev->dev,
 			"failed getting clock tsc_clk\n");
@@ -547,7 +547,7 @@ static int iproc_adc_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	ret = devm_request_threaded_irq(&pdev->dev, adc_priv->irqno,
+	ret = devm_request_threaded_irq(dev, adc_priv->irqno,
 				iproc_adc_interrupt_handler,
 				iproc_adc_interrupt_thread,
 				IRQF_SHARED, "iproc-adc", indio_dev);
-- 
2.43.0


