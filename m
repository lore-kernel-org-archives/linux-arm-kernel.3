Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8337BC54FCD
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Aug 2026 09:10:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+19O7nuCCtomwWmgwH/WqZ+QVpHVmBP+p+odMSd16YE=; b=kUEKtsV4/XB9oW6tSQBjgyNcyB
	JpE+biYr8UHJ3auNFfzesj3gLDJrKJstvVCmUBeugduFxXY81dzXH/qA06madjEfCHCsGGTfVeaLK
	kAIyoXvZ0vHkPORp7bUmyCI5OPmIt85VaudmFJGlpHPOcYJQuSxeZCSwEwBMEmV3zAzDUQ8SVOjjY
	26GpBqDO6Dzqdd/+fu0gpJPlvzQPZOsJLPi2UkCy3RM0ngvjccL3zet21fOn1bS+QqfQP8bTShrjR
	0vpGZWZEvBXXp95CGPSzZ8gTwBfgFO/g7TXvhYnq5vdxR84hf1uB6vH3cfLgn2DLPpXdwmtIv6u2t
	zLH2LMVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wq5jm-0000000E6us-0XwO;
	Sat, 01 Aug 2026 09:10:34 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wq5jj-0000000E6tu-0lNT
	for linux-arm-kernel@lists.infradead.org;
	Sat, 01 Aug 2026 09:10:32 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-cb5a6aa8760so955169a12.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 01 Aug 2026 02:10:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785575430; x=1786180230; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+19O7nuCCtomwWmgwH/WqZ+QVpHVmBP+p+odMSd16YE=;
        b=i/uzV3Memb/9doJX73w3Iv3hbQGqOKpyJNUd7WeTd+CuaMud3nQm/JyaiE71DdKN//
         zHsDsuk/XsA+pNmGFL9qglSvETYMF4Y+c+nPhcsBAHHEIq2JYntq3kW0T+RddEJZ4FaQ
         KgB+UZQ+4/W736MXuiSLBuGXvLozhG+sIXsogOBiVAfAoWd1KWEVMD5nX6IG9Ab7eaNl
         n0ZpYaNPHctfc6sgpeMuIAv6GQlH6rTHAZuslFQB48klZ8AZpqtvUnBdMnazqGcNVvgg
         J8bksvIdLK5u9M8149Oza3f2cJTRrJMSV06OptzVE3P5ZlqLf2pdAmwf+NbIjLEa/Rk5
         94JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785575430; x=1786180230;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+19O7nuCCtomwWmgwH/WqZ+QVpHVmBP+p+odMSd16YE=;
        b=TV91FTr+x6pGzGqiR1Fs021TzV6WZgolJXd86MMloftXgVeEmWaX6XIlKDWj/Gu3KQ
         4x04YiAvY1b7OsnHdfo31tZ4+3g8+HnG54VV8SUWvj2SXiG7GjLIUU9a9nEfDJ7+/n0N
         OanZF55swmyp14H29Ie3TOtw9RUVYKff9sg5qlgWwuSW2651uTNW6hJWhmG/l38Zsnq9
         ZlMgKDqq/+rjzfjwkxhv9qTzgdgc9Ood3hk2EqWamtq0N6aKeo1GtEddwNxOzIEh49K5
         6tUzgpuOER4iI03klgxCYeZIxaoXFwIRN2ruDx2oOrJoU1YTsbwHavyt2RDG7wC/3Y0S
         SXJw==
X-Forwarded-Encrypted: i=1; AHgh+RqKd25YjcgohF/JW7EdAZ2q+Te1K5aMDcMyU4Ua7JVpoyWDNASjhQ/zlPeNV5gjGGbbYtj4yEnpHjf5JQ3mFAM/@lists.infradead.org
X-Gm-Message-State: AOJu0YxG+3ut+ugbKVAd2pTc5AH1KO2SvqXzEA01QcbgCTWOhAVGFXxm
	DdCBb7m4nSWmhJJWsh3T5TmKomMmn/x69L60uR+FV4tIdAJDRRyhIER1
X-Gm-Gg: AR+sD11BZoOqsOjp/5VNsnLod1Hq7IWu2JM8iS3OBmGNYPguifhv9LsLThM47Y0JIaA
	KzXLtWtT8pWF11+M8/xSmiAck+adGn7l/xOxQtj/Uz/ytxWoz++BGe5QnSCS6vQCAKptuK0kmWh
	QtnbvLKXSoX1PlJSTiV+0AHvYDJEL6+APX952VF8Q31LF1qxXwNgIMITKj5t7c6i/eqARnmafnD
	ahd9WUkIm27sgsjhSBuXM5KrDmiddl1anL9ynF9wNFjmdmCXl87l8532MII51pt4oG/r5k4a7xO
	aR9F6xclfSdRePaeaDvejkiLR2hgyjpyZ8H5k/WwZUTj1q4TKkPz40WOecI8p+HOMmidN4kMFQs
	OV4OAOk549N8gN81DcS9d9prOzpiaBQzncwYScuJ8TRhkoa38PKFEcby9tpeKce8Z7AS6jMj1z2
	8F8v6Q0yOfeC0xrL1nI+ku98owwR+BT8fywqdJ5cZg/c7xkY9GQ5xwZmxiNQ==
X-Received: by 2002:a05:6a21:d88:b0:3c3:6544:5eb2 with SMTP id adf61e73a8af0-3c92aa5d51emr3029824637.55.1785575430377;
        Sat, 01 Aug 2026 02:10:30 -0700 (PDT)
Received: from ubuntu.. ([2405:201:8026:213e:36ae:7de2:5cca:938])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153dd9c96asm15432431eec.7.2026.08.01.02.10.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 02:10:29 -0700 (PDT)
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
Subject: [PATCH v4 1/3] iio: adc: bcm_iproc_adc: Remove redundant probe error messages
Date: Sat,  1 Aug 2026 14:39:51 +0530
Message-ID: <20260801090953.61603-2-mdshahid03@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260801090953.61603-1-mdshahid03@gmail.com>
References: <20260801090953.61603-1-mdshahid03@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260801_021031_228597_5B672C4D 
X-CRM114-Status: GOOD (  12.44  )
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


