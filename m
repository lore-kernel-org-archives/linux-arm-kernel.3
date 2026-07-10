Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01DA1C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 11:07:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QMK3eVT0/oAQlr0eGKAyS3VOV21a/B1AmoQDrAJ9a3s=; b=T9lH/9dgZYdQUT+N5Q9AxjYgEu
	eS/3VGWyJJAUjy0Qocct3QwGqoTlhRo4gM4GIJe/eQtjE+jcgfN6jh43LcDCSNhaEjz7K2CuFs8Rx
	wXdu/MFajeh1bHJmXVa2Klwo84cu8pmBxfbSec8ySfxo8YLekgJDRm5UpFVokX1zkoIbmzVFsmiqR
	fqvFmEjrV+A5Xy7LAwWQSiG4583kvM/CfmFJ89O/j65LRusJNBk/xpma2DIPccAEn9g6wkkmbgQBX
	YZjlpW01/lFalJxHQIRF+pnV+M7w1RjoTggl37HjCp9IDs0mVwd/BIrST0Zpw+nsJXvKbpmc5uH3c
	P89QFwWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi955-00000004mNi-1I2F;
	Fri, 10 Jul 2026 11:07:43 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi952-00000004mN1-1tQM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 11:07:41 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-381018b9375so1024522a91.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jul 2026 04:07:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783681659; x=1784286459; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QMK3eVT0/oAQlr0eGKAyS3VOV21a/B1AmoQDrAJ9a3s=;
        b=eOu8ev/ETtOu5UlacOpn0e9jJ4SuK412L2NUtgkcuDcV1SZb3D+db8YrmszZ6sFkOd
         UmYz2jFb0LvLGY9vjTSa+i7QIwx0Bw4Go5m8hisD8qxshj9aTvlzLws+XMQZUgwSuuML
         oj9FBW0BaLTGx/js5Gm5KzSR4/9yGNvHSRTSAMxkY45tyJ1z39RDDwjvcuyFOZuMzjtS
         j/RMUEtU62fCYkfQHXwSHN35lna6RsCcKSr9ep5HLEBFFPCfwmW6p02KypgpWiZ0Qn6C
         GtDNN3ehP7JlvdacX6rzmmqkwhzH/Ft/RoDpIr4gKI70eLvaYZspNTgLb/OpPB4bzYok
         J70A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783681659; x=1784286459;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QMK3eVT0/oAQlr0eGKAyS3VOV21a/B1AmoQDrAJ9a3s=;
        b=jWERdfU82sOtaPT7NR5dWTWtdyUOsBbW+y0Cv6K2e/mJcuvnTfkAiam2fn6wDPa1d/
         6r6CNp4P/atoQYrJ6he3ILxtEB3lNlgAGBV2F2RgwQUcl7g/j7H8QPOYoEqLBKei7hQa
         KNRkIzWW+aByxtTGaYbP7VZs7Jo/5DSEKJANBi8jQPj6JC/mA6GrzJgz30nO358ZV8nn
         7BODaMkWnRnWe3ZBxkLwd6OwGuc/a2VKLBZKNFynStj6XJAFlvB53+yiyp88cTNFf9QE
         YOnm/OmWOqiifSBNscQ9NsdjTXeku0e+VigAq/O6KIlcqFQ9WofeXFTjUMqro3sjGNB6
         TSDg==
X-Forwarded-Encrypted: i=1; AHgh+Rr0vOI6g2CkfiOFnyEKovmMWq4AAKRubG3EcdMHNq1CC6zoa9i9oQE3GLVU8R9Qg5AdHv0bGPfNhWdG1BzWBS5n@lists.infradead.org
X-Gm-Message-State: AOJu0YxpcYELFLW4T6AwH/ZWLdmczRRM8Xl2/eg33LuFlzZOkcZgGD1T
	p0Jkvca/hVkX9cFcuNa+kMoBppJTglo2Xfz+LJwdEQPd9AKoSTYYXCzo
X-Gm-Gg: AfdE7cmoZxcrwqIWnH7/svEaesfo3IXIMR1BC58JDJDIluIh57XJMx2kFHeHAyk0Y5A
	UqlxskvZ725nYq/bgv/TwOgwg9lcUrhHF3N4ATInPI1j+W/SYEqgrBZO3ZzVhaOD36jfBmCmhRk
	rO3BJ2eyksPyuu3BNolnMsts7XJyYsYmtl45kMRCk+5im9QFzEf4apvffqPHkoTR8yg2Sg6szw6
	sZ0PQzCMncohvrj41rZiblP0sx/CERryeUvJFe9uG/+ocUv4dK+hpK1D62swnbejvJPod5fRyxL
	v4WtdqDDUOv7lS6v0qjPlbaJOzjwv2CzV/YPFfvCZ1iO+goMX8Bmij973ZSRIVZWcwzDzxGNPF1
	KScRj/GoM+ie+bSdRq6Fxfy/H5Chd0lPYVwOqXjpT1aOVhpck4saZAGJ6NjagFamfC2kMyG4sDR
	L2xZiLI3rzJ7v/2N0bXE/3Ei1brmQ=
X-Received: by 2002:a17:90b:564f:b0:37f:d6d5:8e8c with SMTP id 98e67ed59e1d1-3893d91fed4mr10524502a91.0.1783681659012;
        Fri, 10 Jul 2026 04:07:39 -0700 (PDT)
Received: from ahmi-PC.. ([2401:4900:88f4:a225:f83:5ab4:33ab:8313])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311838c9235sm35061109eec.21.2026.07.10.04.07.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 04:07:38 -0700 (PDT)
From: Narasimharao Vadlamudi <ahmisaranrao@gmail.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
	"David S . Miller" <davem@davemloft.net>
Cc: Neal Liu <neal_liu@aspeedtech.com>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	YueHaibing <yuehaibing@huawei.com>,
	linux-aspeed@lists.ozlabs.org,
	linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Narasimharao Vadlamudi <ahmisaranrao@gmail.com>
Subject: [PATCH] crypto: aspeed: Propagate platform_get_irq() errors
Date: Fri, 10 Jul 2026 16:37:29 +0530
Message-ID: <20260710110729.224090-1-ahmisaranrao@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_040740_489127_229B9BA9 
X-CRM114-Status: GOOD (  13.63  )
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

platform_get_irq() returns a positive IRQ number on success and a negative
error code on failure. aspeed_acry_probe() and aspeed_hace_probe()
already detect negative returns, but both convert every failure to -ENXIO.

Return the original error code so callers can handle errors such as
-EPROBE_DEFER correctly.

Fixes: 2f1cf4e50c95 ("crypto: aspeed - Add ACRY RSA driver")
Fixes: 70513e1d6559 ("crypto: aspeed - Fix check for platform_get_irq() errors")
Signed-off-by: Narasimharao Vadlamudi <ahmisaranrao@gmail.com>
---
 drivers/crypto/aspeed/aspeed-acry.c | 2 +-
 drivers/crypto/aspeed/aspeed-hace.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/crypto/aspeed/aspeed-acry.c b/drivers/crypto/aspeed/aspeed-acry.c
index 5993bcba9716..301612556a76 100644
--- a/drivers/crypto/aspeed/aspeed-acry.c
+++ b/drivers/crypto/aspeed/aspeed-acry.c
@@ -728,7 +728,7 @@ static int aspeed_acry_probe(struct platform_device *pdev)
 	/* Get irq number and register it */
 	acry_dev->irq = platform_get_irq(pdev, 0);
 	if (acry_dev->irq < 0)
-		return -ENXIO;
+		return acry_dev->irq;
 
 	rc = devm_request_irq(dev, acry_dev->irq, aspeed_acry_irq, 0,
 			      dev_name(dev), acry_dev);
diff --git a/drivers/crypto/aspeed/aspeed-hace.c b/drivers/crypto/aspeed/aspeed-hace.c
index 3fe644bfe037..1f9afa002ae8 100644
--- a/drivers/crypto/aspeed/aspeed-hace.c
+++ b/drivers/crypto/aspeed/aspeed-hace.c
@@ -127,7 +127,7 @@ static int aspeed_hace_probe(struct platform_device *pdev)
 	/* Get irq number and register it */
 	hace_dev->irq = platform_get_irq(pdev, 0);
 	if (hace_dev->irq < 0)
-		return -ENXIO;
+		return hace_dev->irq;
 
 	rc = devm_request_irq(&pdev->dev, hace_dev->irq, aspeed_hace_irq, 0,
 			      dev_name(&pdev->dev), hace_dev);
-- 
2.43.0


