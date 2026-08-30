Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 770C9C61DE1
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 30 Aug 2026 17:11:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+GRZL0uxq37pp9qHzlDeSvEEyunsmZeKfcXgUqg4T+M=; b=1VudIacx3fu9LziVUGAyr12b1o
	e2aRV4H3MgMdWoixyMuatVgGd17uFjKoyOG4N6CJ6pcZsCGYw2o2yHz5q67jgOhNU8q6wbcgZrnn3
	BGjQ+manq0N9o3ywOAF9i4CuCzcsHgCFTpWoHUxOE8mzWfF92WsN73s+WBUU9zmw0iJSKx/sXolqL
	i8NgQBVM7O6dXQOFDQ20k5gxE+izqJlctS37u1YkuNmLr9VXeSWO7a5A85sX1uxS7OdU4+NmRy1Rw
	vxmCvqO9j/bomrn+xssGFdSr9y7+LyLmIpWJkytYnwLhsLeBZL7/+A+F1SfiOgrfIlqDykgS02WkT
	YMkeyfFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0j3R-00000007wL6-2Zf2;
	Sun, 30 Aug 2026 17:10:49 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0j3P-00000007wK1-329Y
	for linux-arm-kernel@lists.infradead.org;
	Sun, 30 Aug 2026 17:10:48 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-cc147d86bebso3023101a12.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 30 Aug 2026 10:10:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788109847; x=1788714647; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+GRZL0uxq37pp9qHzlDeSvEEyunsmZeKfcXgUqg4T+M=;
        b=UGI0IZT9LHBJ+fB8uBj9i+ze6GxJhsQ3cuT1mZrxWk/vbhbXnCodqhKrJJ2q516K9z
         +ktHc7BLFk6gmVEopSQgafTGSfzYUmdRmwnAhCdLwUQ4T9rkkd5JuuBpryErjag4ZmxL
         lN9yleJ9DPuFAk/cQK7RrZyAcJRpsr2oA6R1wX2LAdAXhIh/kz91M7Lbv6/lBCsJEMf6
         O0YEIPaKw5lm1armNjKdnYaGuP9N5xGwRYbfaJs16TuRuRQ0ctzZWP5xFJ88R5J5BadW
         oCWr/4mrCC70g5BwWXQq9IEnEutq4Iz2vWWnP+9wDpAXcajdjhSODMiy85F2YWLvLrEG
         7utg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788109847; x=1788714647;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+GRZL0uxq37pp9qHzlDeSvEEyunsmZeKfcXgUqg4T+M=;
        b=Jf8OdgmJ6VSeItjOfAZBhnApsM+ePhunY1Bd4tC64YuAqUn5KLv+CNTp3uAN7O05qA
         4Q+aer1TgWYoSiJfCroc/2g1DfIpRXnP+KfiuLfbfPgJZS2wQIOtF8XxSZEG48lh6BWN
         MyM1nMRgs649ClfCFauBhLn6u4eL86DBLR5WECAa/MpfmzbK1gjLK4xggF4/HtO50XyN
         VtwvDONLxRbNPH7CzXBCYGBvOhq44d2dhBHfRY+J4NBz0l86puNekRNDBTAnqDiHKRRS
         k6EC5bBGSw8QGkbVVopdN51q3yoR/eUU58rJivQjbod/2SpYqCXMqo4AvJwNO56MeLsk
         AEgw==
X-Forwarded-Encrypted: i=1; AKwUvBxqNPJseD2wkTBjTguamZlMp5mq9jj/hM3/lESrMatFyIcyvWyfi5Pqm95+zdpu54WsnJlYfB8ZLBPrx4L2gzoq@lists.infradead.org
X-Gm-Message-State: AFuF++nT2mI5gc67rcWe/HxMiTDsDGxZ6+0uXpbcaiTg4EybE3jLizz3
	SQUgUnlxqlz5gqJ9yKJsrxJLqT9tPWVbgMhA1vmsY139ivYw0HkfunbM
X-Gm-Gg: AYBFou1LRBC1jWTW6vkCCIoSUKieDCp0YS1mun7ooJAtAL8ZfxtPOsESx9lR7PnSlb1
	BYX1eYpo+JTTRyfo90ioE27D1111SjwEazHOiUU2JZRaQ//blxYvm4raTm6iZCpHrodrhV1NjAO
	5JrH6gxO5XNBRdncebrWkkU9g3ftaTl+VrM0mCR79loJ9WSSzDvtcbIP0XXJjUCptNE4aTijYS+
	XjIdaXEfWuq1RLOmh8NJmy/17DUc0DqUPOlSQcRGmpKrmlQwOycG+KewcfBZBhPrfRG4UCA/ANy
	W+RBn0JN3QaF2iTaiIUSdg9ATg5wDsNGK9sguoYmv2O9GAzMYV4ckgW+al0Sbb6M1004TgiaNWE
	rTGMGNzgyQfeQ0rMjZGA+Ap7CLrlNqH5WRTRCyWLR+lE2/AYuuW5mjwEaOMLVik3tQDDGQcCDAP
	v/Ka+OHBdYpSOPDjQYj9SDZy7J2662vxqy6RFadSbaveOzDYHFNRdDdH0m6Q==
X-Received: by 2002:a17:90a:ec87:b0:390:84db:888e with SMTP id 98e67ed59e1d1-398da62a9f1mr2503612a91.7.1788109846855;
        Sun, 30 Aug 2026 10:10:46 -0700 (PDT)
Received: from ubuntu.. ([2405:201:8026:213e:88d5:45ce:40e:490f])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396b0fcfa3asm17047101a91.6.2026.08.30.10.10.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 10:10:46 -0700 (PDT)
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
Subject: [PATCH v2 5/5] iio: adc: bcm_iproc_adc: use devm_iio_device_register()
Date: Sun, 30 Aug 2026 22:39:18 +0530
Message-ID: <20260830170919.470974-6-mdshahid03@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260830170919.470974-1-mdshahid03@gmail.com>
References: <20260830170919.470974-1-mdshahid03@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260830_101047_771601_951F88F5 
X-CRM114-Status: GOOD (  15.10  )
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

Use `devm_iio_device_register()` to automatically unregister the IIO
device when the device is detached.

This removes the manual `iio_device_unregister()` call and makes the
`iproc_adc_remove()` callback unnecessary.

Signed-off-by: Mohammad Shahid <mdshahid03@gmail.com>
---
 drivers/iio/adc/bcm_iproc_adc.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/iio/adc/bcm_iproc_adc.c b/drivers/iio/adc/bcm_iproc_adc.c
index 11f2bc12c19a..38a153d6fc70 100644
--- a/drivers/iio/adc/bcm_iproc_adc.c
+++ b/drivers/iio/adc/bcm_iproc_adc.c
@@ -570,7 +570,7 @@ static int iproc_adc_probe(struct platform_device *pdev)
 	indio_dev->channels = iproc_adc_iio_channels;
 	indio_dev->num_channels = ARRAY_SIZE(iproc_adc_iio_channels);
 
-	ret = iio_device_register(indio_dev);
+	ret = devm_iio_device_register(dev, indio_dev);
 	if (ret)
 		return dev_err_probe(dev, ret, "iio_device_register failed\n");
 
@@ -578,13 +578,6 @@ static int iproc_adc_probe(struct platform_device *pdev)
 
 }
 
-static void iproc_adc_remove(struct platform_device *pdev)
-{
-	struct iio_dev *indio_dev = platform_get_drvdata(pdev);
-
-	iio_device_unregister(indio_dev);
-}
-
 static const struct of_device_id iproc_adc_of_match[] = {
 	{.compatible = "brcm,iproc-static-adc", },
 	{ }
@@ -593,7 +586,6 @@ MODULE_DEVICE_TABLE(of, iproc_adc_of_match);
 
 static struct platform_driver iproc_adc_driver = {
 	.probe = iproc_adc_probe,
-	.remove = iproc_adc_remove,
 	.driver = {
 		.name = "iproc-static-adc",
 		.of_match_table = iproc_adc_of_match,
-- 
2.43.0


