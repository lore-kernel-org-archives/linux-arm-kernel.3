Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7559FC55838
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 17:06:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+19O7nuCCtomwWmgwH/WqZ+QVpHVmBP+p+odMSd16YE=; b=qVhuv0Dc50uTM/hlskUhWAx/a2
	vto88idJMeckKaiQuWSZud691a1pDzSFcmPhXqu2FhLQ9Mh4Bq+aQesVbDn0l3A2D13mHYuc+oyB2
	0byJFx8jKqvIU78wA959KUSEdWqmFHx/oDvQyITlIS0Qu8sOnjjy0wfp27UUWkc3iEH9jnUKhKQCt
	ZV9bvewcFxacBQ7CPwrB7JEf+HmT07VtAWOxD+8kHJfpYmkYmoPV7ioCOE3HRQe6komZdsBtkWykt
	bAjPh3W/ZZlvldnXX1nagxbInJX3xiKa1Im2+geE0FzFYJnHsgfbCKEzuhiNOCvg4ijs/oTA6L31l
	1y0IWUIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrIaY-00000002QGz-3f8e;
	Tue, 04 Aug 2026 17:06:02 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrIaW-00000002QDF-25j3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 17:06:01 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-381b831d535so81274a91.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Aug 2026 10:06:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785863159; x=1786467959; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+19O7nuCCtomwWmgwH/WqZ+QVpHVmBP+p+odMSd16YE=;
        b=IctyooyWFqu1op4/BFpe5kyDm7+EffrkK5/uJdXyU0l/OpDZFZ8IKTkOLvfrCwZUly
         KyKMcnHwulmwrJsLc9snMUdXEBJaWRKhjHP1OzC7eOViTB2/ozcLTNlssN9BSf50iY9b
         jXPxIbf1fP9GAe8h/SGUM8oUP4wSF+X/OBnZ2+PgNr1kDE05A759kkDinfS5CxBQwEVN
         yHhwfyF8PzbkR0pSycsig/GGzbQJELrckuli5UORo2d+mZXD6fE8DFnGmDQzB+XZbkjg
         2kIsfxdLah6Fn1Y6CoWJvuWgmfoz0O1xY8PzrqQVgWGpgIqp0iDTPXDlNp0V3WwLRH/o
         3p2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785863159; x=1786467959;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+19O7nuCCtomwWmgwH/WqZ+QVpHVmBP+p+odMSd16YE=;
        b=NxNuATlOGd9l3imiK3frCDbg9Jv1pP1Kjkg8UdsJqJZlwYfdDNFSJaxoq8PYKycCJT
         rrpSd+xTsRjT7hrBZsgVqKMtu5duSdmq89pA+QGMCpOACM8/O6e5rcHFBH8xo/Tk1kBz
         wswu/9NtFi948WjMUwGQhGfVD5t30sBHFu1UkUFbfIHDAh59r+lgWaz+JoaToz5DdMbS
         YOhUlcLkrZxBAFkIY17n/LX6JYh3JgUT5hrK9wO8iWGGRDfJBd0D5lczOIZEFHOlC123
         eL1Q5fWuDojdg6p5sHqNrdJUPdB7DnUo3Z3+qjocEsdb4bBXRdclrT9kBfM5k+M1fTqQ
         WoQw==
X-Forwarded-Encrypted: i=1; AHgh+Rp1wAfrxMCaJaW5O2iOXEWcd2A951kjb5+Oc9hUG+F/Z3iDljgAMjcDxW5J07+4PZ5w5CmRZppZkQZpQSYAj97X@lists.infradead.org
X-Gm-Message-State: AOJu0Yx8Lj+AJkDHXwOBHyW1cP0F4zEg1NHMbd+MKE9tInivmcOx/vvL
	5x+UQqL+mKnelwsGQFwbtxQikGK3s04cKNGqaJ0zasztI4Fxsc6fyS77
X-Gm-Gg: AR+sD13iaxl4HVGTxywdpqc9b7YnQO7Cq+ndDzUgGtfHv0z6d3UY099W8NuNS/+JDw/
	YeLviHamStSoFSrcWjYCRSHabrLojVjPRmzE3wflwj3wMXELkOvJRTbGACu4UmW+xwwk6/Wc0ww
	P0tVzXSSnE4i3pRye/M6f7PX03Wiq2qEq0tpnv0Ci60WJKg6JYG4j6TuvP2v+NZuMmJVo96EQcb
	Yg6eojhIznqu8ZZ6PLf4/sEuDJasdKQSDUP53XScXUYgLcdxfjfSJNrxYhPiT7vusHCFM6sOCGe
	0svSNL0qO2IVD0/fwHhcVq9TFE/DaM6lufWvT9IwsOOOpdWgYBMV7BpddCPCmFOBB/5VeeFM3wD
	UUBXBxYDlxUJSi1EFwWQ2dYfS9U7hYFKx0plRqcPEwEWcGW7lq554Nrg2Y/IWAsb/RlHsfXaZqh
	UmNXFQSZbTsmWxbQSLnpNUiv5ZNVy5wlL1nvhWYrxqA9qFKDW1L+xgfTAQd2I=
X-Received: by 2002:a17:90b:5823:b0:38d:dbc7:5178 with SMTP id 98e67ed59e1d1-3903c632441mr378816a91.22.1785863159404;
        Tue, 04 Aug 2026 10:05:59 -0700 (PDT)
Received: from ubuntu.. ([2405:201:8026:213e:1461:a94d:d559:948d])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31586162e80sm7230582eec.0.2026.08.04.10.05.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 10:05:58 -0700 (PDT)
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
Subject: [PATCH v5 1/3] iio: adc: bcm_iproc_adc: Remove redundant probe error messages
Date: Tue,  4 Aug 2026 22:35:19 +0530
Message-ID: <20260804170521.196393-2-mdshahid03@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260804170521.196393-1-mdshahid03@gmail.com>
References: <20260804170521.196393-1-mdshahid03@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_100600_544577_5401D102 
X-CRM114-Status: GOOD (  13.04  )
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

devm_request_threaded_irq() already logs an error when the request
fails, making the explicit dev_err() redundant.

Similarly, iproc_adc_enable() already reports failures, making the
additional dev_err() in the probe path redundant.

Remove both duplicate messages.

Signed-off-by: Mohammad Shahid <mdshahid03@gmail.com>
---
 drivers/iio/adc/bcm_iproc_adc.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/iio/adc/bcm_iproc_adc.c b/drivers/iio/adc/bcm_iproc_adc.c
index cf4738b16e62..7c2e2770cd61 100644
--- a/drivers/iio/adc/bcm_iproc_adc.c
+++ b/drivers/iio/adc/bcm_iproc_adc.c
@@ -551,10 +551,8 @@ static int iproc_adc_probe(struct platform_device *pdev)
 				iproc_adc_interrupt_handler,
 				iproc_adc_interrupt_thread,
 				IRQF_SHARED, "iproc-adc", indio_dev);
-	if (ret) {
-		dev_err(&pdev->dev, "request_irq error %d\n", ret);
+	if (ret)
 		return ret;
-	}
 
 	ret = clk_prepare_enable(adc_priv->adc_clk);
 	if (ret) {
@@ -564,10 +562,8 @@ static int iproc_adc_probe(struct platform_device *pdev)
 	}
 
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


