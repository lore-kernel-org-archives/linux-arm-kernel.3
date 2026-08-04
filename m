Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72EF6C5518F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 17:06:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/WxyWYexSwoS0Xhfap20Ecck/ANPlEcZKb1zpjgFsT0=; b=Sqrpy5fSAOMNA2sbONnXgxf1LC
	xd3UJgVMCASuzTilMgXDWYNc4J0n16h5FOBh/H3nAguuQ/c5USfBtxcdakQvZs5HZ7085trtSSjCx
	OepbUJJG1Wzr2WNf7IslARQ5kwcU9zv7L7g0ppG8esToicUs6zGfsIjMcjtMda19iefk5C1b2GRYX
	coCUe9rlFeuqhpiRRLWQsHQuI233kOxEH9bKPcvpKdiNd/870am7Smptsjv9+DHhAssCco4msyDHs
	XiEB7stsh0Bsv42XJ/QpR0r9XGFISH+nIRKWhd/IAhO48YoggQBixLeJ/jv7T/47KkIwEZAinNnY+
	MVcWjJCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrIau-00000002Qh6-3OjF;
	Tue, 04 Aug 2026 17:06:24 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrIar-00000002Qam-0Gkr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 17:06:22 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2cc7ef7ec27so1273345ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Aug 2026 10:06:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785863180; x=1786467980; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/WxyWYexSwoS0Xhfap20Ecck/ANPlEcZKb1zpjgFsT0=;
        b=tC6LqXIdg3MbyrK6Uqxb0NNwanwtzq9tm2yHYvoQ0+Mth+UM5KcEiGj7CxlsRbfqvq
         a64Hl9QLLc49zhqOt90I84ZmhXgNiBdod8k6aCCqBsN9hPRDkQq70qGFLn7dE+dETb7K
         y2e9njetMo2Ol5jjUoDKJgXfuhlozP7JbDSYAozZJmiGsIqd9yfsiGR2DB8RKg2c/cGI
         oB1NuqeY2cumYVea+fTv3Mo0oq8QrzWYXIAa8gL8dgWJex0B/F6SaclbIF6b19qQUTwV
         x2DXpds/rdg4E8w3LPP8ruR2VbAsxY4S2i/7CQGKhsNWW+y4nnZkf44TZIy6FtYT8h/k
         pEUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785863180; x=1786467980;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/WxyWYexSwoS0Xhfap20Ecck/ANPlEcZKb1zpjgFsT0=;
        b=BM//fVP2ozH5drqG8/loFuRxjGTblMrkrmgHVh8Q4LYqKgWnYvD0xoR9V6DN+oNe5A
         xWeHVLYB/iCgF/kmP19rwVEkmy8NjDR7sFKy7ucqKH8y7K62rpF9U2b3PFsdCVNksiEr
         ycSKL/snN8w0lTLdzzLq/ULb4RhmV907znjRPio67DJowMsGqKwcmFFxvGaudizfpdol
         uB3NQkLtcssKmV9a5dRZyAou+bszCPke8Gb9NZobZUALMMO+LTZtvjGY8x3X0E7yPUTr
         ZBek0f9d1oBT5jl/y6kbZkepiqlVj3y0yVlyyju5Lv41NYF0kjH9x0oWLwlSGs8yEWNF
         CtHA==
X-Forwarded-Encrypted: i=1; AHgh+RonAsc0ocj7kU/MBX2apCzdNHTXYgw05JLl7HtTdNv1DbajqRY4P549QxOjxTNRvvUZFIEqu+TuK/RANbUnwUd8@lists.infradead.org
X-Gm-Message-State: AOJu0YyuH9TcquyVUuDl6WNltrOv0eekN6xr3bJjAdZn7I6J8VYppecc
	vuTCwoQ4v3JIWbh349owy2VmdrfC0jVh5K1RkYmJHL0cJF822zHmvMXf
X-Gm-Gg: AR+sD107+SzBsSv4OFTAfWSD6Bnefo0HykF/KZoT6+QP1rxY0Wei922bPoz4wNocXBJ
	syq6ExZBdDCu7m/Lla85T78o1iB/pqX/FJjA+7A84zE9PWiMie+IxtRFTx8ZrWZcjfNP6fJmE9M
	OEF2oMiTHKdOxUPzHIE6Dvzv6xunvAWVMoPLmQl+5kGuYtkHLfKagcRAlKGwZV3ClSQ3r3zAtzY
	tDyC3yuYAKkufhlhUWWp1MK5DMHE140B8xEr9uerLwvIDtgSghdU27YgsicRTVR/efTfmQDzXo0
	cp+9UjaT2td6eESMuv0hSLxAgIdMJllZ06AOA1Rp7hXFlbD2ZSIwLl8dxz5IDWYoHqUVh9LzxE8
	kVRQqp2pMk0gHFURZLpDeUriUQPY8/hJiNck9p4+wzPH6jTAVJQ0XqzMrHz0U7oASO31mkNIl3X
	kGn8o0R48KZUMH7jNLS6+5MTkgNkcohHtvNGdkldEtJ2MfVSHrw7ghVjSS1wR0MZWo8TvbRB74h
	M6E9r1Bmw==
X-Received: by 2002:a17:903:2b0d:b0:2ce:faa6:7cbb with SMTP id d9443c01a7336-2d0ca7afcc1mr2775625ad.4.1785863180300;
        Tue, 04 Aug 2026 10:06:20 -0700 (PDT)
Received: from ubuntu.. ([2405:201:8026:213e:1461:a94d:d559:948d])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31586162e80sm7230582eec.0.2026.08.04.10.06.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 10:06:19 -0700 (PDT)
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
Subject: [PATCH v5 3/3] iio: adc: bcm_iproc_adc: Convert probe error handling to dev_err_probe()
Date: Tue,  4 Aug 2026 22:35:21 +0530
Message-ID: <20260804170521.196393-4-mdshahid03@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260804170521.196393-1-mdshahid03@gmail.com>
References: <20260804170521.196393-1-mdshahid03@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_100621_103338_2B29F3A1 
X-CRM114-Status: GOOD (  13.18  )
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

Replace open-coded dev_err() followed by return with dev_err_probe()
for probe failures that immediately return.

Leave error paths that jump to cleanup labels unchanged to reduce code
churn. These paths will be converted separately together with the
planned devm-managed cleanup using devm_add_action_or_reset().

Signed-off-by: Mohammad Shahid <mdshahid03@gmail.com>
---
 drivers/iio/adc/bcm_iproc_adc.c | 31 ++++++++++++-------------------
 1 file changed, 12 insertions(+), 19 deletions(-)

diff --git a/drivers/iio/adc/bcm_iproc_adc.c b/drivers/iio/adc/bcm_iproc_adc.c
index 312be7c12e58..9238dc8c8873 100644
--- a/drivers/iio/adc/bcm_iproc_adc.c
+++ b/drivers/iio/adc/bcm_iproc_adc.c
@@ -522,18 +522,14 @@ static int iproc_adc_probe(struct platform_device *pdev)
 
 	adc_priv->regmap = syscon_regmap_lookup_by_phandle(pdev->dev.of_node,
 			   "adc-syscon");
-	if (IS_ERR(adc_priv->regmap)) {
-		dev_err(&pdev->dev, "failed to get handle for tsc syscon\n");
-		ret = PTR_ERR(adc_priv->regmap);
-		return ret;
-	}
+	if (IS_ERR(adc_priv->regmap))
+		return dev_err_probe(dev, PTR_ERR(adc_priv->regmap),
+				     "failed to get handle for tsc syscon\n");
 
 	adc_priv->adc_clk = devm_clk_get(dev, "tsc_clk");
-	if (IS_ERR(adc_priv->adc_clk)) {
-		dev_err(&pdev->dev, "failed getting clock tsc_clk\n");
-		ret = PTR_ERR(adc_priv->adc_clk);
-		return ret;
-	}
+	if (IS_ERR(adc_priv->adc_clk))
+		return dev_err_probe(dev, PTR_ERR(adc_priv->adc_clk),
+				     "failed getting clock tsc_clk\n");
 
 	adc_priv->irqno = platform_get_irq(pdev, 0);
 	if (adc_priv->irqno < 0)
@@ -541,10 +537,9 @@ static int iproc_adc_probe(struct platform_device *pdev)
 
 	ret = regmap_clear_bits(adc_priv->regmap, IPROC_REGCTL2,
 				IPROC_ADC_AUXIN_SCAN_ENA);
-	if (ret) {
-		dev_err(&pdev->dev, "failed to write IPROC_REGCTL2 %d\n", ret);
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "failed to write IPROC_REGCTL2\n");
 
 	ret = devm_request_threaded_irq(dev, adc_priv->irqno,
 				iproc_adc_interrupt_handler,
@@ -554,11 +549,9 @@ static int iproc_adc_probe(struct platform_device *pdev)
 		return ret;
 
 	ret = clk_prepare_enable(adc_priv->adc_clk);
-	if (ret) {
-		dev_err(&pdev->dev,
-			"clk_prepare_enable failed %d\n", ret);
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "failed to enable clock\n");
 
 	ret = iproc_adc_enable(indio_dev);
 	if (ret)
-- 
2.43.0


