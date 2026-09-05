Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91C41C624DB
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  5 Sep 2026 09:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FKhaAa1V6dcazyDIDdMRIu/saWb8D7tpQe+JyGNOhTA=; b=EN/z6ozL3bxIpp6HHADDjIsXWm
	sdIFAqZp+zQtBQudYL5tiUCEe4tcTQRmAGB5sAIsuXDGuGG3bHeX3xaQhP7Pziflw6hsOK+s1xsUW
	0fpBriWo/WheMAeoqNOtgSf2908LHKcFjFgkw3rmbgb7gvsKGb/It7fdQy9u5CLSYDBEvwQT2X8bG
	kwQGPggSuN7F2+F29zNh6Er6VtHf1QbVAT4HW8+JyM7aG0P/D5ar2ZphLxyC0kR1xfrWlqly7yNyv
	guu/ddYSyJPUFQszm/WQsDqLVkC66+I7YSdJK69TpGsZY0BozPva2Ff0e8ot5UPkCKB67O0EcBbON
	7rjmBrrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2mqh-00000003vCm-2m4B;
	Sat, 05 Sep 2026 09:38:11 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2mqf-00000003vBX-3CCQ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 05 Sep 2026 09:38:10 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-38dfe910e9dso2190348a91.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 05 Sep 2026 02:38:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788601089; x=1789205889; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FKhaAa1V6dcazyDIDdMRIu/saWb8D7tpQe+JyGNOhTA=;
        b=oUyeW1dsCafWYquvcWrgTMVkfxNVU64W9B22fjfykb7MWSwv5rxkZn8IOB21m8jtmk
         JIDgT+hKmcQwRXyZD3Qk2/okX0mFsDfClRwwVjsvG/11lW/NXxTEyCKVLNuG2GxAPqbq
         7wuBoxjTvqjZR3kOp3jog14+K0uMj5h8y4XlFVKNA5Z7m9h1JuTeyutQ5/0O7l2t+TgE
         0L4bY3VXXtNE642iueRK33k0goXKy43zJk/tDetRylGcWoTPMXx+Nqavhh/BzLXV0cLI
         YGEminsCnyUZRxyHsi4qp0XhY+CgaYFNDP8x0Z8Ilv8J6gb7KgUWCG2wwJ5O+GbyQPDR
         19Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788601089; x=1789205889;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FKhaAa1V6dcazyDIDdMRIu/saWb8D7tpQe+JyGNOhTA=;
        b=D71fziP/Bo4QClIwVBi8iqEtUuEYn2s75XCgebrIA/FvE01pL1c3BQXOWyWWxImULT
         zcEZzRNdUDHfFDI6EpRrUqpiIgovsuLQZOudPAutFxtRQ/b38/u6dSkCwg4x3wYa+XCV
         qsQWJaGmaLCFljKg4VXpGwp+8878RKePmksbNQ/cc0fk8kyKThE1yvzh7jTuvk3pbSr+
         c6ISN0QR5WQIYbaZkxy7NdcpuaRlTA8+ePFpgHdj47vPz8KYY5FWkYKOZFXijsvyiu8U
         v6DhmeK5bXPhn/uUi5xFUp1951r6fN33AZycHuNUrUQidViWVuFBmRLFvNIXJsIeGR3A
         QYyg==
X-Forwarded-Encrypted: i=1; AKwUvByGMU3SgOwxTPizPZYdAnstBU4jt6eLdbdDpYvCaN/OOF3g2rwKGJX+mEU+sRYytjg9S4CMIyDKx1rZ70wClCEK@lists.infradead.org
X-Gm-Message-State: AFuF++mztvBXsInfJXjCA1dW3DNQtfxtcagvKNxDFPk1W9slgvdrhWPP
	3JKesuKw2OzRaMLvfg3EWgBiwMyRRVQlD0qFrf4lzsPvBBAU0QzSwoyB
X-Gm-Gg: AYBFou1Ywq/cnil25VLVnJ5uzh3kbjQKO8ecDntBIpWmh4JwctxLmRtFuROS4dnN2xB
	iToKjwQxwK0Tl7NUUoqwPGvkk6Sd231TYxTe9FQNy1+JuIUxEojVYInMvUzcjbUzwNQizCMHQI7
	y7/mIOMOjMkFRRvOmTPkEtt5b74CRdbJUVwXwM22aifIPJUrNQhYGDODhXWv+b+Y2E1ez4knQP3
	uEEbF5vAzeAG52x+m6EWP7msDWJWFJQvpdmchh98dGDQyc9xlzsSw372LzTG6LFuz/FV4VA99aT
	IwhxoYxZp1Hi7X1tagsrz1xRThuBtz+zvA0ZI37Yh3rinUIw5mJQ6e0ZPg2mZpsliNP/gcM0e2y
	Jm37PNFR/Uz5h8C6y9hX5anrGqHBVEya1DhzQss/JAfkCcIZ4/K1tMpDfHz7HwRhBPaUXU0g6Ia
	VlAIAFoSKk0xc/vBfVUI/2Zwz401K7SWknNnKan7PEnMYYBmt3UTZPDIHYRw==
X-Received: by 2002:a17:90b:3d89:b0:398:9be8:ea69 with SMTP id 98e67ed59e1d1-39b262167e7mr19037767a91.22.1788601089070;
        Sat, 05 Sep 2026 02:38:09 -0700 (PDT)
Received: from ubuntu.. ([2405:201:8026:213e:5b5:60e7:9f67:1689])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08d086adsm15763353a91.15.2026.09.05.02.38.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 02:38:08 -0700 (PDT)
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
Subject: [PATCH v3 6/6] iio: adc: bcm_iproc_adc: use devm_iio_device_register()
Date: Sat,  5 Sep 2026 15:06:31 +0530
Message-ID: <20260905093631.48667-7-mdshahid03@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260905093631.48667-1-mdshahid03@gmail.com>
References: <20260905093631.48667-1-mdshahid03@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260905_023809_804972_547133B7 
X-CRM114-Status: GOOD (  14.59  )
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
index f4676607682b..6eae7596ac8d 100644
--- a/drivers/iio/adc/bcm_iproc_adc.c
+++ b/drivers/iio/adc/bcm_iproc_adc.c
@@ -524,7 +524,6 @@ static int iproc_adc_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	adc_priv = iio_priv(indio_dev);
-	platform_set_drvdata(pdev, indio_dev);
 
 	ret = devm_mutex_init(dev, &adc_priv->mutex);
 	if (ret)
@@ -572,19 +571,8 @@ static int iproc_adc_probe(struct platform_device *pdev)
 	indio_dev->channels = iproc_adc_iio_channels;
 	indio_dev->num_channels = ARRAY_SIZE(iproc_adc_iio_channels);
 
-	ret = iio_device_register(indio_dev);
-	if (ret)
-		return dev_err_probe(dev, ret, "iio_device_register failed\n");
-
-	return 0;
-
-}
-
-static void iproc_adc_remove(struct platform_device *pdev)
-{
-	struct iio_dev *indio_dev = platform_get_drvdata(pdev);
+	return devm_iio_device_register(dev, indio_dev);
 
-	iio_device_unregister(indio_dev);
 }
 
 static const struct of_device_id iproc_adc_of_match[] = {
@@ -595,7 +583,6 @@ MODULE_DEVICE_TABLE(of, iproc_adc_of_match);
 
 static struct platform_driver iproc_adc_driver = {
 	.probe = iproc_adc_probe,
-	.remove = iproc_adc_remove,
 	.driver = {
 		.name = "iproc-static-adc",
 		.of_match_table = iproc_adc_of_match,
-- 
2.43.0


