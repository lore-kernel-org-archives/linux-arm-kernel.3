Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15AEBC55ABA
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 02:39:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+19O7nuCCtomwWmgwH/WqZ+QVpHVmBP+p+odMSd16YE=; b=LjPR9yJ6O2L57vMKPf3/UhyuZE
	YPNvpewCzuH3KxtTx4/30yQsDHsvJauiTq4p80wksT9KWOnOGa5/xnrD40m1tJktgaP/gqQroZV09
	0W+1cF23dQY9cto+1U4cly2INDxIinWPiy4FWQ1fCyrAjyYKdpcrlzPVdGk0gJrN7Xwwkh5rWNDSA
	/LpPTe9IDN9ydEwBmL2kywOs0UqslaNL75a1irUfjwssoU1wffGTNk5X2xQU3waFs++YQwhF+sEXz
	x87ZyMNdMIhs5PgIH7DRX+zAuQ1RMhFyeMDpgyVJeoyv+vUOnzLo2VnHJv5SsT1CGoXUW90w1vzwK
	lhhwTB2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wro1F-00000004pBH-2ukE;
	Thu, 06 Aug 2026 02:39:41 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wro1D-00000004pAP-2eui
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 02:39:40 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2caed617615so23198725ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Aug 2026 19:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785983979; x=1786588779; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+19O7nuCCtomwWmgwH/WqZ+QVpHVmBP+p+odMSd16YE=;
        b=KkIDL0SOtgq+l+anGbo/5dbmWuPI9/FlTRzNlYA1fQp1gaJOqi6XrFhGuJtOzX5gjL
         RSpNEt+utFWAjynQogLHIrdr/JzAPiy2ZW6uJ2+RB4VKLmq9tRIYwmVSEuRBEXdCjTor
         OdM4XDxjqaIWM0ySTiXkaPptviHUo4v0mgFz5P94exgnIfbK8GAxf6uiuf4+spehsJ8v
         3kyVBc2q32sFXJ1TKbzOizc7c2jm15vxLyGofR2ivuNufVlDS3RMvvJgy4R59Ie2MSSO
         74GHpinfkX74tQ5zrdBcynsEXJbdyTDeUfl0gPj4/1/DElVXeJsshH/a/eGZ7x11sNhO
         nmfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785983979; x=1786588779;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+19O7nuCCtomwWmgwH/WqZ+QVpHVmBP+p+odMSd16YE=;
        b=Kc/v5LW3a5piT8qXT0hHpMJklht//5gQ+5ssxJp9IQf+Pq4W8v89y+CE4E1sAhMBix
         fZlHRkl8XptIST9Xm0UAO6cKpbiff/MJLHjmC2AItVkgc7xGG2ZtmWdpquKJH7wn4rW1
         KyxSC0rBbFIC3rwezbLhkuPo5KzLD4DjTjfmcsu2biw1Suh/ny/C0snFh00qPgl39RjC
         KO3g29nEND4FQEd/dNpirNgLfpZ8gKmMwIp8IrfTDwE6oJf6r30pzZACoYbxBKBT/EpW
         9NzHQGt2xdahbPTGC+d/86+TzKKyNxJFwgPyc2LNSJ5b0bvDFHtK9+UXRcxk0fqeWbSy
         de5Q==
X-Forwarded-Encrypted: i=1; AHgh+RpbBMBrltsWHSpULcyLMZ2qznG/xbk100VOR51jmO96EdoT5T6CfDeofRhXMF8vSlt3VThT1jbj6BJAXYJ4lbjG@lists.infradead.org
X-Gm-Message-State: AOJu0YyVpbVCjCiM8H14oelxC4nJTkzVLrIJ3/MVX7/14dihLRlmyj6A
	QMJU5jJIwydvHRb9Jp4XCvB8AAwofIo1QYZ7ZGD7W/cQ1Z1EV+/VLrTb
X-Gm-Gg: AR+sD10j3/apMAppDfCYGCQmOHmqKrpXp6/5sCl+ncDbpNK3ujtfPlLwrWvLouNLm97
	tZZFwgp1unT3RE0XasWgXUPQm9jeH2pc5zJZ4fbdujBjO3hMs4nh6olexXqmbmcqBCNu8Sukj1k
	JQsKJp3E4kYYNQwmt+lXCfKOT2EjWndahoA00HoZWeokESkJLAD//B/cTKM01TB6zOdJeOjOXNM
	ZkLaU51pKeyAJ5zlA6Mwl3ZHKhunYZqtM6yXd88dKUBlKXMauyJswN4HxL+eqKlGmoA3C/7bEfQ
	luMrWYscDqVKx/daq+I4aUazwPX4O0PgF2rAEES2rVBRMqpvORgi8vojt3QXxPju1w2lQCcHmWu
	cTbXzzIeoCPrcHHT+PhHEXZCUcg78bOFKMRp3+E0DGcRV6OYmpnDqj0jbnsAJeYjDhgDd/ZX2oP
	DqMbIyPCDJbsPkYSSwKJLYjuv0KDW1hyuh4gOAmwS7LqCQLavZ07gSzK8aJ5PKHB2rjrMpmw==
X-Received: by 2002:a05:6a20:430b:b0:3bf:9b3d:61bb with SMTP id adf61e73a8af0-3cb85ee779fmr13430627637.16.1785983978646;
        Wed, 05 Aug 2026 19:39:38 -0700 (PDT)
Received: from ubuntu.. ([2405:201:8026:213e:3194:1e48:e141:80ab])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315867d4929sm22404383eec.30.2026.08.05.19.39.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 19:39:38 -0700 (PDT)
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
Subject: [PATCH v6 1/3] iio: adc: bcm_iproc_adc: Remove redundant probe error messages
Date: Thu,  6 Aug 2026 08:09:00 +0530
Message-ID: <20260806023902.8608-2-mdshahid03@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260806023902.8608-1-mdshahid03@gmail.com>
References: <20260806023902.8608-1-mdshahid03@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_193939_668868_BFA667F5 
X-CRM114-Status: GOOD (  12.79  )
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


