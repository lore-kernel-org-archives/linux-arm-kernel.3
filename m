Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18090C61DBD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 17:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kGjwYaAGAPpb5UsGnRRTSugqMWHugUl+MPT7Fj23bh0=; b=N8MCCbmbgBM3C21y9/1fH1t6z4
	xm4JA9FhG+FKO/4aPbjpmrjxQO/Pc+/kB4hJcFm3XEeJevs0HM0efGej8TJ98PmcN27b1ounOe14h
	3jH+gaa7ja618LNEHq5XZqpw3qEopRa5IY+lYYh08XO4vSlrrB47Vd08q2WbKIRKwkLE8oEFRAQYa
	kZjd0sy7WYNFGNAJM3b1BqW2h+MwGfKr61cszEdvJwH3MMizjj5NOetJNshe0aybmBEFfsTYO9wl6
	YMgIy4lk5F6tIedIOVf0aZWXbUAQ+ESn68itY23iqmsXgrSVTVLBTv/i9396AQs2jS7fMF+JwX5vf
	OFomHRKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyurL-00000001CuN-1sQi;
	Tue, 25 Aug 2026 17:22:51 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyurJ-00000001CtT-0nbp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Aug 2026 17:22:50 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-38ec1402b05so123459a91.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Aug 2026 10:22:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787678568; x=1788283368; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kGjwYaAGAPpb5UsGnRRTSugqMWHugUl+MPT7Fj23bh0=;
        b=b8RaG/qRr1HbWYvAr8ratcx6e/jWydtFZPJ6DOxL9Yht0idD20ETiH4eptG2pn/DoP
         P7Whagbe2v8FIuav4EKNNHj6D2tPxWWy0duXg2mfTSukuS5FfjVWDZ8W+ygWn98YmXFI
         qsZMIrY2uoRDpciTBdTzfrMf7zXEPrTHoV9J4qBFSZCE5OWZWHtX5Eu4nbxSSgoY1VDd
         oPEwJkc4jleM94NQs+2VtB4BZLJ13TeNEECMBcPNt+OQOWP8lPLZhNOUgI8j2H42Oft0
         5KtgR6ZYoJkzq6PobCqC24ORRv2UFkNQbx3DnCGrJKPdbhHWjF4h3a0E7Clr+chDMo/3
         OWUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787678568; x=1788283368;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kGjwYaAGAPpb5UsGnRRTSugqMWHugUl+MPT7Fj23bh0=;
        b=XDFqgcEIuROnKWluQ7vtBChv6vQlQzSXdHsFYpLiNeRciC0qAO98fzQ1BLRe/nTcYQ
         ZI6VTIJCfjLrrj2r3+0rqIgZvDPIR14yV+Wi+LF3t2IWMpGZLtCU4rB3Nhrycpqs6LkT
         2Gvqi9OZu62v9S91LnLD8eVwZssS4CAa0mvLAxeI1obK2gm6lxsV4WeGgBReQsss4xdV
         DxDupTrm1TyUPkkHpk18uqUuYjmolRnkVlyb5QqngIFWF5yPY1EhqWS5pMjxp0rOpaoZ
         dYO8AZF3s7T4KCnzvj6ZDfK7jiVsdL8BNchjlZMbDv5FKwLwPl+78JPde1FeyUAlnCZD
         33Ig==
X-Forwarded-Encrypted: i=1; AHgh+Rrmysvge/3g/fxKAQW4Ma6mv2Gh0uDCXiSG3Yn/l2jF+cydKesJLJ0ZItB0iR3hF52ePNTTfsoZj71KDZTZsL+f@lists.infradead.org
X-Gm-Message-State: AFuF++kTyk2FbbNh0V1xLQOek5LDug4eSD3L/x98zj59sp7EB8K0pvgt
	RNm0+6Lgr2R1mbCAQk+s/ae1hGojmpiPw7++rJQ0r8Ba/Od/k2dKq31A
X-Gm-Gg: AR+sD12nTgPAGFeGpt7UFxaIcPfEOuDxGqWQWyROrkWrIk+aPhl363H8aQm1ToFIFQU
	nALNlWNad5Iy1BHpdiQ0D5gkTeyomqY7ln41AEcrYC6oBphtWxSaNFItmyDOQnjDKPzZj1pXSfA
	mA0CTFuzwO9rKmwlGRxzIB/BXizWj5x1VZeIJhUmHE2zzr+PVJC5w7WfdaGDvzf8SKhnpLDO6yn
	YVXELhpnK6NYCfK31vEVrPYfrfC2iDRbO3WbdPpizOJ5sQQ22ZlIPp8sobznguuecaZIxQChtx6
	yKyy65KUFeW3SUhMNrFEzVAay6fvO7qilV+Y2R4xJNGT+iYoGXBvuhXtIYKKp1vJjZj2GRSaAe1
	M+xWcFBU0BnaT1hEFrdHS4h2hGKRDGDt573n4+kl6MQnfmyH61lsLPmnLC8KfhIq9mL7QESSbGv
	F/GNCNgPx2un+aKkgOW15UwAEfx3U/pNyUunYRxxEbCfPM7GZwziTbr3TsTnY=
X-Received: by 2002:a17:90b:3b52:b0:396:602a:5bb6 with SMTP id 98e67ed59e1d1-3966d20f12cmr1147836a91.8.1787678568310;
        Tue, 25 Aug 2026 10:22:48 -0700 (PDT)
Received: from ubuntu.. ([2405:201:8026:213e:7ed1:605d:3bd6:fefb])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3283d8d208csm327637eec.23.2026.08.25.10.22.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 10:22:47 -0700 (PDT)
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
Subject: [PATCH v1 2/3] iio: adc: bcm_iproc_adc: use devm_add_action_or_reset()
Date: Tue, 25 Aug 2026 22:51:54 +0530
Message-ID: <20260825172155.250484-3-mdshahid03@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260825172155.250484-1-mdshahid03@gmail.com>
References: <20260825172155.250484-1-mdshahid03@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_102249_235748_AE4390E8 
X-CRM114-Status: GOOD (  14.81  )
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

Replace the manual ADC and clock cleanup in probe error paths
and remove() with devm_add_action_or_reset().

Register cleanup actions immediately after enabling the clock and
ADC so that the resources are automatically released on probe
failure and device removal.

This also allows the cleanup labels to be removed and the
iio_device_register() failure path to return directly.

Signed-off-by: Mohammad Shahid <mdshahid03@gmail.com>
---
 drivers/iio/adc/bcm_iproc_adc.c | 39 +++++++++++++++++++++------------
 1 file changed, 25 insertions(+), 14 deletions(-)

diff --git a/drivers/iio/adc/bcm_iproc_adc.c b/drivers/iio/adc/bcm_iproc_adc.c
index e46e3761993a..1464c60bc83e 100644
--- a/drivers/iio/adc/bcm_iproc_adc.c
+++ b/drivers/iio/adc/bcm_iproc_adc.c
@@ -448,6 +448,20 @@ static void iproc_adc_disable(struct iio_dev *indio_dev)
 	}
 }
 
+static void iproc_adc_disable_action(void *data)
+{
+	struct iio_dev *indio_dev = data;
+
+	iproc_adc_disable(indio_dev);
+}
+
+static void iproc_adc_clk_disable(void *data)
+{
+	struct clk *clk = data;
+
+	clk_disable_unprepare(clk);
+}
+
 static int iproc_adc_read_raw(struct iio_dev *indio_dev,
 			  struct iio_chan_spec const *chan,
 			  int *val,
@@ -551,9 +565,17 @@ static int iproc_adc_probe(struct platform_device *pdev)
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to enable clock\n");
 
+	ret = devm_add_action_or_reset(dev, iproc_adc_clk_disable, adc_priv->adc_clk);
+	if (ret)
+		return ret;
+
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
@@ -562,29 +584,18 @@ static int iproc_adc_probe(struct platform_device *pdev)
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
-	clk_disable_unprepare(adc_priv->adc_clk);
-
-	return ret;
 }
 
 static void iproc_adc_remove(struct platform_device *pdev)
 {
 	struct iio_dev *indio_dev = platform_get_drvdata(pdev);
-	struct iproc_adc_priv *adc_priv = iio_priv(indio_dev);
 
 	iio_device_unregister(indio_dev);
-	iproc_adc_disable(indio_dev);
-	clk_disable_unprepare(adc_priv->adc_clk);
 }
 
 static const struct of_device_id iproc_adc_of_match[] = {
-- 
2.43.0


