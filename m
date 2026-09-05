Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0775C624DB
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  5 Sep 2026 09:38:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cdCH0/RB1tBvaj1W6sXWObI//sTHWe8b2CDTC69fJ18=; b=wzrgku/h9rZ30xsC8WsCzssIvz
	IhekfeEj1Vz9/D4zLtQguv4fL9cYWUNOFKIqNK0Ua0ERmshL2gyk9OHLoTFpOTn2bQ3CGxaNDQ/cf
	/fBe3IvRsIIwOnjC1JNO/eYtZd3m4yCsseZHLEz4GvRLCCbrkOdTqlAVQRJuaW3W6YkW16ZQxCVPw
	e9pxlA6Ju57rruU0/gUEQ4sO5kWOQIwSYvuO0sef+f4wpkJXG6S2euG7HG1IeClTY9mPz5QRKHLBV
	7konAwKiqF6ksi0bae6uogbxtNLsHnxb0Hozp06+BN3myavSFCCgZyxkCPPMggg+04EqZoU8w96kP
	jbz9s9LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2mqS-00000003v40-1gD6;
	Sat, 05 Sep 2026 09:37:56 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2mqP-00000003v2a-34fg
	for linux-arm-kernel@lists.infradead.org;
	Sat, 05 Sep 2026 09:37:54 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2d9201076b3so22294865ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 05 Sep 2026 02:37:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788601073; x=1789205873; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cdCH0/RB1tBvaj1W6sXWObI//sTHWe8b2CDTC69fJ18=;
        b=dxKfolb8ahyrWqNbtrMTfHC2FoQiHOWgQtQ58qlKMRshNu/Q8kgmLCB1PaJPbxpTsz
         4PBtprrwJDxiI397J3nq4mP+t4JlSX3ZifpF1Z1Iu36APRjtJtJD5XPxHKOLlDdl3bNo
         kjiBT3uyAGvUZtD04zgT1Ga0ibZdDPaItrwCVfiJSs8rsf5R2Qasyx3ymBbFHmXZkIDY
         Q9g/zyTE9WivpsZAouKoQ3O96FfUe1EoVlIzQpUpGS3Cd+yZiMGTwD1hqw9XgsjcSbcg
         Q+0ehVnnltFfOOhd2hCbKVi2UjlhWW3/4zXimBrW4IGa6SkK/qXwPlv5UEOE3tZ2GieN
         +6uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788601073; x=1789205873;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cdCH0/RB1tBvaj1W6sXWObI//sTHWe8b2CDTC69fJ18=;
        b=VoT8ha4CiTCETHHe5EOSE9T+rnMf5wvD36P4nFSgilezcuorSXtRWw5296IbedjWhq
         lXyYJqI2+bO7LniVg5Sp0XLK7SizYbqi+aBtXo19/vnHzGS6825Inq8mKWKUJ/YSBsfH
         zRiKWhqeY/g1r1Ehielassbuzu5/0IS8qehbe0T7U1BdG0QI3UHfxZoAo4+lh5o8y5dr
         gOS9TJ6j/zlAXDS2jilCPMZx4+bCXh5UCOBLqFdDkim0Abz+qyMAkEp4mT3y8GKHjR3U
         cXD7MuXfIpmMhip0Sn9vr5mmYvopanHHKfFPEL4SJpQuRaZ4pGjmvTUlC+0hlaNr5hO7
         Adsg==
X-Forwarded-Encrypted: i=1; AKwUvBz9aeywufpUIghaFt0fa4xBRERZH1R4xLJPPIcNDqKvGlRjjaIYfdxzaNO0iEEsvjnOHBa6mwWCkhe450P9eSH+@lists.infradead.org
X-Gm-Message-State: AFuF++kqp5ClkGZ2bItMoDWsCx/9OVscoU62pfesIHtyC1RRdd6JsQhx
	V/TXlUYn2IH6G4HGGK0XcqX1Gkg+GhJvw1f34+fvBXJPeA+NPM4RLTLq
X-Gm-Gg: AYBFou1Dbrw92hikGBYNuaT83aj+fsoEXVqR2yrtFoEGMTGF3cjx2EuB9rmZXpZ8L0T
	soU56odJ1GZwBPPVUAk5YKJqVhlzzrVGFpB9cJN4XfXr3Ckie18QLEd5tZyUGhnkOqha1sAk2fK
	smlhi2AC1CQHAiJ6N6wFq+I4JBnsbnkJpYRGXNTRKJSTb6WLHINKTkMEafIbTNVndeWUnK/bSRr
	lMPgAj8BtUYGpiAPtQ62wD5LHzAxBWRo3Af/X4yidmlCRJcP1q6shVzxSkfv4bitT240iwb3fpQ
	okECudMQZrUVrY3hoD1GEIZURbTDF8Kivyiie2yap8i0tSQKpXVtou3/GvZDi5qZurFnCAjbMXt
	aKMaiIjFFhhgZvM3ctGBUkjc2qyNGpkKxfLS7niIOrNNMdt3GmkihfQS/8gCiVRt9o98dUf76es
	jlCnAady9ZWNDap6SqiwD+PUKFN+qJF/drxp4Vh+Di82h1fG8EZpY1Y4g8Jw==
X-Received: by 2002:a17:90b:3b8c:b0:398:9bd4:d13 with SMTP id 98e67ed59e1d1-39b26242a75mr15470856a91.18.1788601072809;
        Sat, 05 Sep 2026 02:37:52 -0700 (PDT)
Received: from ubuntu.. ([2405:201:8026:213e:5b5:60e7:9f67:1689])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08d086adsm15763353a91.15.2026.09.05.02.37.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 02:37:52 -0700 (PDT)
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
Subject: [PATCH v3 4/6] iio: adc: bcm_iproc_adc: use devm-managed ADC cleanup
Date: Sat,  5 Sep 2026 15:06:29 +0530
Message-ID: <20260905093631.48667-5-mdshahid03@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260905093631.48667-1-mdshahid03@gmail.com>
References: <20260905093631.48667-1-mdshahid03@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260905_023753_911868_B7CA4738 
X-CRM114-Status: GOOD (  14.45  )
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

Use devm_add_action_or_reset() to disable the ADC automatically when
the device is detached or probe fails.

This removes the manual ADC cleanup from the remove and error paths
and ties the ADC cleanup to the device lifetime.

Signed-off-by: Mohammad Shahid <mdshahid03@gmail.com>
---
 drivers/iio/adc/bcm_iproc_adc.c | 24 ++++++++++++++----------
 1 file changed, 14 insertions(+), 10 deletions(-)

diff --git a/drivers/iio/adc/bcm_iproc_adc.c b/drivers/iio/adc/bcm_iproc_adc.c
index 3bbf814d4c8f..24fb41751e93 100644
--- a/drivers/iio/adc/bcm_iproc_adc.c
+++ b/drivers/iio/adc/bcm_iproc_adc.c
@@ -450,6 +450,13 @@ static void iproc_adc_disable(struct iio_dev *indio_dev)
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
@@ -551,7 +558,11 @@ static int iproc_adc_probe(struct platform_device *pdev)
 
 	ret = iproc_adc_enable(indio_dev);
 	if (ret)
-		goto err_adc_enable;
+		return ret;
+
+	ret = devm_add_action_or_reset(dev, iproc_adc_disable_action, indio_dev);
+	if (ret)
+		return ret;
 
 	indio_dev->name = "iproc-static-adc";
 	indio_dev->info = &iproc_adc_iio_info;
@@ -560,17 +571,11 @@ static int iproc_adc_probe(struct platform_device *pdev)
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
-	return ret;
 }
 
 static void iproc_adc_remove(struct platform_device *pdev)
@@ -578,7 +583,6 @@ static void iproc_adc_remove(struct platform_device *pdev)
 	struct iio_dev *indio_dev = platform_get_drvdata(pdev);
 
 	iio_device_unregister(indio_dev);
-	iproc_adc_disable(indio_dev);
 }
 
 static const struct of_device_id iproc_adc_of_match[] = {
-- 
2.43.0


