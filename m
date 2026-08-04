Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AD27C55184
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 17:06:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aqQolFyy9CteLDWszj4sftvNtB4+0GIquieHeua55fE=; b=K1RiqJcIoSsTqyJpRI0yUlYpY/
	bXE7VxxcuwtD/mZeKrXtP0StwCDQvpTRXSRnmUAy/4qi5DeTmsyeAHlZFFixkCmajNAl8rfnx0SkF
	odevtneY7nfxv72Zo5kS+vfeizNgftgMkHt3NXamRK55rNUznrIfXk5ddfVkj96mg7QRAWKeRMsN4
	aVQtHqPLOvr2Nmxidh3t5mpQRKz3+RGhTUxUvBwHVLM1gIYJlF70pnpAN7osL0kCIGatoY5O+pwSL
	Axn5N9RxpekIril8kFY8i9KDO1SHbutXnQ7WrGRXG16zgrzx62b9t5paJnS/q6pj1ieFMZ2s/vUmy
	Wdwc+H4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrIaj-00000002QRu-0suC;
	Tue, 04 Aug 2026 17:06:13 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrIag-00000002QOT-2G3G
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 17:06:11 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2cf27856f9cso1073235ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Aug 2026 10:06:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785863170; x=1786467970; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aqQolFyy9CteLDWszj4sftvNtB4+0GIquieHeua55fE=;
        b=ouSxBmS248mNiSE5r4k7TtTK1uCoF+Y6inz6W81PV6/IUqplqA5R+qddqB3187CLiw
         B/NaKdEV2Tdp2VAIM6UvyYK4cyL6iVx24waHgq8x9bhuVOY4CqmwfIRbqJ6HRJa8JS9J
         USNzFNYNZE3fT4M84maXFK1C4GlLzV+efXWjZVB7oKbQOQOKrGz8Y+sP+tA+pVmB6z9T
         cz2BImFd4i8wo3PsWVsTVm4jbgH2n1YrqGf2UtUAdOqXUThLSLVVoLvYjQMCPf0kxYzd
         EIfIRH+gqaUL7/7DttqN7xINptnfr+xsx7p9VBckSNB4xvEqhcWmcAHoc8uIFrwsx22R
         q7cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785863170; x=1786467970;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aqQolFyy9CteLDWszj4sftvNtB4+0GIquieHeua55fE=;
        b=nOoLLfzKtQCDM3bgebIq8aBinlzDL9qxIxmaEw5FhwtzvpiKGkL3BuuOATzB37ds0p
         kkYKLZlYjlHn8WQ3roRkhFZkzqcaf/XLbmRd+EBmt41ALDNk8foNMZyI5/ii8LBEiPCf
         hfb6eZJJSVjhPcJStTe3ENZXML4Jp16491lOmN9tbMwi7fUWvbExn7jSut7SBKBwTo/m
         I78tcT4Url0BNuW39FCb8e6+E6FaI5wEQ7puVAXRUx3R1WgiNA7xZ5ogZzmILfGbMbtd
         7dvmnQAvYnpulsM7FoY54C8/TRU3yYpafDDp5jXeSr8/qYoXdQL3MW1EYU7UbEdAXxOx
         c93A==
X-Forwarded-Encrypted: i=1; AHgh+RqAASIPnYCaBChG+//L5Y+0DjFyUjzXdtCZzZQ2PTn6DkCpD5sGL0qAfpAKZz0m+HbAputI8/Qf+xtonWCZyjib@lists.infradead.org
X-Gm-Message-State: AOJu0YxzyTs668XgfoYhwnkKzo3C2TatLfAtJruMOUX3D+WmYfUzZlXi
	ceXE/dIfP9SNHbRKySwjfKbHg9TT+IWYxQcZdKNQFkJPPNKWefjgvB1/
X-Gm-Gg: AR+sD11nZxUUZ7yHAe6OX/FeqCZzSsv2Xxg1NpK3KUaLfsUNZFCZQOGabRK7mytvlp0
	XpLwsMdAPvDs3k7474wL9/Ca+3Qngwsy3osdP186c1jUJx2P3ndx8vMEPjHpcqFoWvEsx2KzVul
	wM39lWImb/84tkoX68gg9sYddHtMEsfeUp6M1Rg0uEjvIpt+4+2lcoOoGrq/9kQSSZsKhk3YAE1
	zZYFpVU4Nr+QUa7yef49g+in8YTyhFFfls4cVZW074ehbc14KoSBAj7zD59omMQ7UecoLKxfd9p
	+vmPgbd8GLmdMXEYyU38YmmJfh6SqfiRHS+i39VN3LxQUbqbzhjpHUG9SlR3cDVR7cKm4PcXcsb
	H79U1EP1ZSGHhKtgOmLtD//Bes0hT1kX09w01tyotUqcceCqDcljC7QHKIvrNLmO3wmu5+VSK9t
	xoBzcrnfHkXoMa047nVQZKIuWwSL2aNQqjCLfGmbJq+pHXfOw9X3lNJcH2woxQeD/58yJorw==
X-Received: by 2002:a17:902:cecd:b0:2ca:53e9:1277 with SMTP id d9443c01a7336-2d0ca712f17mr2879415ad.1.1785863169414;
        Tue, 04 Aug 2026 10:06:09 -0700 (PDT)
Received: from ubuntu.. ([2405:201:8026:213e:1461:a94d:d559:948d])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31586162e80sm7230582eec.0.2026.08.04.10.06.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 10:06:08 -0700 (PDT)
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
Subject: [PATCH v5 2/3] iio: adc: bcm_iproc_adc: Introduce local device pointer
Date: Tue,  4 Aug 2026 22:35:20 +0530
Message-ID: <20260804170521.196393-3-mdshahid03@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260804170521.196393-1-mdshahid03@gmail.com>
References: <20260804170521.196393-1-mdshahid03@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_100610_578994_468E5005 
X-CRM114-Status: GOOD (  13.12  )
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
 drivers/iio/adc/bcm_iproc_adc.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/iio/adc/bcm_iproc_adc.c b/drivers/iio/adc/bcm_iproc_adc.c
index 7c2e2770cd61..312be7c12e58 100644
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
 
@@ -528,10 +528,9 @@ static int iproc_adc_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	adc_priv->adc_clk = devm_clk_get(&pdev->dev, "tsc_clk");
+	adc_priv->adc_clk = devm_clk_get(dev, "tsc_clk");
 	if (IS_ERR(adc_priv->adc_clk)) {
-		dev_err(&pdev->dev,
-			"failed getting clock tsc_clk\n");
+		dev_err(&pdev->dev, "failed getting clock tsc_clk\n");
 		ret = PTR_ERR(adc_priv->adc_clk);
 		return ret;
 	}
@@ -547,7 +546,7 @@ static int iproc_adc_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	ret = devm_request_threaded_irq(&pdev->dev, adc_priv->irqno,
+	ret = devm_request_threaded_irq(dev, adc_priv->irqno,
 				iproc_adc_interrupt_handler,
 				iproc_adc_interrupt_thread,
 				IRQF_SHARED, "iproc-adc", indio_dev);
-- 
2.43.0


