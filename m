Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64D58C55173
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 18:24:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gsS73bmDoxyOch7pFT+GXYXN7OXiaTwdO6oVVnU6ol0=; b=fPogDQEdpa4PbMaxcycgRfFmFY
	pwFduSAiAGXmlCk8E5HClEIce6pXCp2D/UKxcZz2586ccCUGDrlx9Fl8y/kEx2HE74qEyPvxflEhg
	JOe3YOuFRgn5xfEQsIR5rv6WeWyfTrXmuunWYs58/OuZna/eNSiyK3qwnHUznYu2EPkA4LOhPYmMH
	54tJPgI4OU120UbQRkKkgfvzFw5RlgfCibCp3KAE2SAiD7rVZPvnj1qtRqWRaToQdXT9KWP1P/ssV
	QDTutexDkFxFlYLlfMWvHzQ7ZI3jfmTRATJg/jpEyyLyFTqi98JcqmuFh7CLT+n7oU3MZqp47rat+
	FpUWcpIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpruO-0000000DM9U-1DVg;
	Fri, 31 Jul 2026 18:24:36 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpruK-0000000DM7W-44pZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jul 2026 18:24:34 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-ca913a601fbso910586a12.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Jul 2026 11:24:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785522272; x=1786127072; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gsS73bmDoxyOch7pFT+GXYXN7OXiaTwdO6oVVnU6ol0=;
        b=VwIy/Ry8tKQ5PDB8EoJKzPKrjtsgkCc/RhjaFi1Jstg3xkP0qoXQezidPXauLuwGOh
         LEbsaHxBcrq9LL3ArKw1hl5g58Q2wOFxoBEKt6oo46hdmZXpVEj6RsM+5DxPOaElevJc
         Ms2R5aGneSD2D/Q9GDilPzhb7I3EtEnDtZiYubYw/TXByYiLUMNat0CjrfBHyWJZXLEZ
         7gp5f5tWp1GhuZ0m9R+FV+6Q01QU3U09xXAvGOl8Kr5omARuOEINu6wYx83kmOEmxWrJ
         9cFFHPGUDsWBhWab+QG0JAaEb3nq+jv/TlWdNlrq5yXhgiBpdv2Vaax/wGcoDqUA491Q
         qtQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785522272; x=1786127072;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gsS73bmDoxyOch7pFT+GXYXN7OXiaTwdO6oVVnU6ol0=;
        b=oaWcCJ1IKyLTmooddMuWBjg0+E/jU0KXNdd1deDFD4qGtKTlRs6VZ1YgwxAHHhcsVi
         Sjr0Bb7QqdVuh7u9o75wTotGYZDLNdbdeh0Iq+4/tQUanq5+FShe4FSQ3Q7VYXfVvFQQ
         MR7q2lfiH95rZqDzEHOT+StKPO4F0ULW763qTCrlLaraiLjBEJSp1++76vuBlQp+sFlx
         f8FL3ZCa4ZVRHql67GmTSeXZzYcMQNL7PRHgWWPAyMjdZrsPbK9/upkNC9XfitSrRoHO
         f00HDamL4lIVySO4V3AHN99fzLLnLFWBTzu4igOrVSAVIKwamXQU+9XjKE2iAtWh2jnX
         bD7g==
X-Forwarded-Encrypted: i=1; AHgh+RpWaGvYVY3H339xFhUY1+/wdolQcWyLxUdhAlPIak94TGZ58FcrSvQPIoGJ7txaHI6hpmjnOVYJoxMyEgFrYqn0@lists.infradead.org
X-Gm-Message-State: AOJu0YyOhEnHBWQUGR8sq8qmTt7vB2fgJ1nMfaCPsR53OQUUcBoyaswW
	bly4AchfiM/+RCIl0MmMtTJIAYHJwidxSuqpKo8d86h0hm0MZT43DXDD
X-Gm-Gg: AR+sD10wGSw+qwUg9qB5NTuxiROxbyjymvLY9o+PqvF9Z40lzHJ8ehrTlbFbUglyxeP
	qB4EXaA37ltxxTVc5JJ95+zNgcy3lNGIyIztZmoRqWtmVvnwdlo6EW7lwJ/GJXdZxKex1ThNNN+
	0gB0TsYKM/UFrXyxp0oZ+WRvBFjikWVUFLoROlD8poeKN0kLVzF4hVnCb3O0N/gAKUJ0SVLOQ+E
	SY1OHk9n9RE/ixj6kByoLbjuV3uFF0+l0AdhVKPozadGnNeDrzorqckpjVUNW6iQh7qUcEgo2h0
	/gBFfaGZE63ej+gmKHjk/wwLy+lJlsBvjQtnYjDooBtEfyfa1EVnGp5PzqZsGDRKle1rYg0rHUm
	zjyYEksKHIQ286v1UhNyAmYpWAJr5Hgi/oPvfe2C0+hBiveLmcgR77wJAm0YQGA1ZMDUOdQ724n
	FYWqASXHBtT50DpzWRvfElHhVQnUc/g6SNJKYYmlDLNGlYpoViLQFXZJxkr2MQ
X-Received: by 2002:a05:6a21:6f13:b0:3c4:2a97:fd2 with SMTP id adf61e73a8af0-3c92a8757b4mr806736637.67.1785522272021;
        Fri, 31 Jul 2026 11:24:32 -0700 (PDT)
Received: from ubuntu.. ([2405:201:8026:213e:d69c:7f00:28b4:311c])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153dd9c1casm8400785eec.10.2026.07.31.11.24.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 11:24:31 -0700 (PDT)
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
Subject: [PATCH v3 2/3] iio: adc: bcm_iproc_adc: Introduce local device pointer
Date: Fri, 31 Jul 2026 23:53:46 +0530
Message-ID: <20260731182347.42888-3-mdshahid03@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260731182347.42888-1-mdshahid03@gmail.com>
References: <20260731182347.42888-1-mdshahid03@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_112433_015261_4CBF10F4 
X-CRM114-Status: GOOD (  12.78  )
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
and use it instead of repeatedly referencing '&pdev->dev'.

This simplifies the code and makes subsequent error handling changes
less verbose.

No functional change intended.

Signed-off-by: Mohammad Shahid <mdshahid03@gmail.com>
---
 drivers/iio/adc/bcm_iproc_adc.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/iio/adc/bcm_iproc_adc.c b/drivers/iio/adc/bcm_iproc_adc.c
index 1b0dd654402f..29ea35972a23 100644
--- a/drivers/iio/adc/bcm_iproc_adc.c
+++ b/drivers/iio/adc/bcm_iproc_adc.c
@@ -506,9 +506,10 @@ static int iproc_adc_probe(struct platform_device *pdev)
 {
 	struct iproc_adc_priv *adc_priv;
 	struct iio_dev *indio_dev = NULL;
+	struct device *dev = &pdev->dev;
 	int ret;
 
-	indio_dev = devm_iio_device_alloc(&pdev->dev,
+	indio_dev = devm_iio_device_alloc(dev,
 					sizeof(*adc_priv));
 	if (!indio_dev)
 		return -ENOMEM;
@@ -523,14 +524,14 @@ static int iproc_adc_probe(struct platform_device *pdev)
 	adc_priv->regmap = syscon_regmap_lookup_by_phandle(pdev->dev.of_node,
 			   "adc-syscon");
 	if (IS_ERR(adc_priv->regmap)) {
-		dev_err(&pdev->dev, "failed to get handle for tsc syscon\n");
+		dev_err(dev, "failed to get handle for tsc syscon\n");
 		ret = PTR_ERR(adc_priv->regmap);
 		return ret;
 	}
 
-	adc_priv->adc_clk = devm_clk_get(&pdev->dev, "tsc_clk");
+	adc_priv->adc_clk = devm_clk_get(dev, "tsc_clk");
 	if (IS_ERR(adc_priv->adc_clk)) {
-		dev_err(&pdev->dev,
+		dev_err(dev,
 			"failed getting clock tsc_clk\n");
 		ret = PTR_ERR(adc_priv->adc_clk);
 		return ret;
@@ -543,11 +544,11 @@ static int iproc_adc_probe(struct platform_device *pdev)
 	ret = regmap_clear_bits(adc_priv->regmap, IPROC_REGCTL2,
 				IPROC_ADC_AUXIN_SCAN_ENA);
 	if (ret) {
-		dev_err(&pdev->dev, "failed to write IPROC_REGCTL2 %d\n", ret);
+		dev_err(dev, "failed to write IPROC_REGCTL2 %d\n", ret);
 		return ret;
 	}
 
-	ret = devm_request_threaded_irq(&pdev->dev, adc_priv->irqno,
+	ret = devm_request_threaded_irq(dev, adc_priv->irqno,
 				iproc_adc_interrupt_handler,
 				iproc_adc_interrupt_thread,
 				IRQF_SHARED, "iproc-adc", indio_dev);
@@ -556,14 +557,14 @@ static int iproc_adc_probe(struct platform_device *pdev)
 
 	ret = clk_prepare_enable(adc_priv->adc_clk);
 	if (ret) {
-		dev_err(&pdev->dev,
+		dev_err(dev,
 			"clk_prepare_enable failed %d\n", ret);
 		return ret;
 	}
 
 	ret = iproc_adc_enable(indio_dev);
 	if (ret) {
-		dev_err(&pdev->dev, "failed to enable adc %d\n", ret);
+		dev_err(dev, "failed to enable adc %d\n", ret);
 		goto err_adc_enable;
 	}
 
@@ -575,7 +576,7 @@ static int iproc_adc_probe(struct platform_device *pdev)
 
 	ret = iio_device_register(indio_dev);
 	if (ret) {
-		dev_err(&pdev->dev, "iio_device_register failed:err %d\n", ret);
+		dev_err(dev, "iio_device_register failed:err %d\n", ret);
 		goto err_clk;
 	}
 
-- 
2.43.0


