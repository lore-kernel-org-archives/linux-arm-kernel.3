Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9491C5AD7B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 06:35:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Rs1yPzUnIco2rjC6CFhLVWVyr0WMS18/eTcbCTT31s8=; b=t/ZB/Jz4v2IGk2tBnIWbHNrJK+
	c/qcDhZM5dKpoZcWqWM3892oZtw0H9ntv8z7YjxXQSk2ovYAaKYaGUX13U1QsJ4y/MQdq11hL+n2C
	H5/p7K9ddZpvVFTaNexbC+xyrW310zaLl0zuACFUQ10h8lZ4WCqJIPJ/J49vZIaUdmGfELT3Oxmyc
	j1aYcMXLt4Rs1Ff74/8lTBVG5mbEHzxhYnxSL5E2DOYPyjwMWt4WZ4NIE66HsTWJ/efjETRjjDyCh
	wUosNF3M/MQ2jHjvMiF6tf+epuuCdAOGADLRtFFLW0CiT7o1xb4fSvm5e7+Oi+Z8ovYz6UlbVuTnm
	ZYIAQduA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtg4j-0000000DQnP-0cVp;
	Tue, 11 Aug 2026 06:35:01 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtg4g-0000000DQmi-3lm2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 06:35:00 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2d004f135b1so5895245ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Aug 2026 23:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786430098; x=1787034898; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Rs1yPzUnIco2rjC6CFhLVWVyr0WMS18/eTcbCTT31s8=;
        b=UQ4Y60JC7dWCaLSMCYRvda59CS3Ndk8VPBgbv/gPGo+HrIiKAOUq7qCFZyyK/uhY7J
         6iPAcRsIj8894XNBumPF2YcIdn18qZX+XQG6p3bRoK5HlsNHAfhTwEB5f41KDztzbm3n
         ebfb05+NXmADVQmxvAsCXmczf6rGPVBAVEY3mPqZ1tmvWFD3LvpIHxTxMjCrHk+UmkWe
         NwMwwEB113OjmajWBU8IJ6r8Jhrpz1gBPvTBNFuTlQRTERxE0HzPIvFcndGKQz07lN01
         YijmcN/b+ySYRfoJ9/lRV7TIoN7BOoTdK9o2t/6JHAokcaUp86D2VsbXCZL23STkAxBu
         otXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786430098; x=1787034898;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Rs1yPzUnIco2rjC6CFhLVWVyr0WMS18/eTcbCTT31s8=;
        b=RaSLm7FL4m83fPoath6M+Mw0AXPGlO1qWblq0dQOx9ZG13qAz6UaqbwbCg685pmVnf
         iApb0+nWufwmny3ZOyUFb9BIEeXh9RU90V3qQby/xZnNgCGQ8aUZ1FVsCY8AO71PFeXZ
         qjIWY9zXs5wsCk+Y86VosoU8rTvA2RI8Un8hym2+7kOEB4/14LDnSPzAp7Hj+EJ9ntBR
         604xHS5CDnZkaKp9lngB74SMrOaMre+hbLf/MMigHE21f1WSyPVP/RqKCS4imFp47tqP
         sxf0vFl9W0CNNwFEPG4mE9otQDqyfCeumpsYayAgrrSCi5/WEh95rLu1fTWREAdhIHJi
         31Hw==
X-Forwarded-Encrypted: i=1; AHgh+RrTZldd4YVtoHTo1qaJToYoBiwU9rLrfBaTsKutFwHF5yAw6v1BfEoXuqDzHy7sXlYfboKqHdTYF7iEZGceQ3ow@lists.infradead.org
X-Gm-Message-State: AOJu0YzdjGJxmeCGdoODyT+igbiHDMMeWGhOm9xS8a06//QDGcjCalN3
	qafV/g4k+Cj246o/vVjj4ab9bqN57XH50erGNCUgocOolxW8q8WBShjW
X-Gm-Gg: AR+sD12eJFKc9+q2eS6sqksnSwLrSoiUOqF8RhAhf9QgP8HqSn851asuXPC21Cvf/+M
	rqtqHF5bJiLONA6s63FPQXkhVbrQZn64LzHbBCZFSapxOyoGNubSRHNSDYfu4UHjQqf79YJkZhF
	4ZF58KgOJrwc4NHips2ru92rJEUwsFurFRDZOJBz/3uHtmGrk5BE86opq3dy6atTpZ+CGI3VQZn
	Czz+NRw7oPgw2OapDl2By2QDMhGb1KTmtlWruxUP4inxAcKYcUulL+oi2RJ5esrj4vHmug0VWPo
	9UVBCFwLSre7Z6bUcNvuNzI4YKBjO0C++sWyDNzk3+0aN7Zel7kS+qpYeRf+qzjbLPacJ97E+Vn
	vN3IxnHrKOPDGsli1x7uSaXw0yZ2iml7jFEceQWPBNf2tU0rme/EuFl6u3SqNq7urY8+IU6UsrO
	Y9eQwk4CdSOE2as9XlLEQ8th5KL/20EfO994/RZu2L3YwT/2kOCig=
X-Received: by 2002:a17:902:da87:b0:2c6:a772:7e43 with SMTP id d9443c01a7336-2d31798510cmr11974795ad.18.1786430097998;
        Mon, 10 Aug 2026 23:34:57 -0700 (PDT)
Received: from lgs.. ([101.36.106.88])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d315ef11e8sm2383365ad.1.2026.08.10.23.34.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 23:34:57 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Olivia Mackall <olivia@selenic.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Guangshuo Li <lgs201920130244@gmail.com>,
	Daniel Thompson <danielt@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	linux-crypto@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH v2] hwrng: stm32: fix usage_count leak when autosuspend_delay is negative
Date: Tue, 11 Aug 2026 14:34:42 +0800
Message-ID: <20260811063442.3058074-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_233459_152170_FCD45F79 
X-CRM114-Status: GOOD (  15.94  )
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

stm32_rng_probe() calls pm_runtime_use_autosuspend(), but runtime PM is
enabled with pm_runtime_enable() and the matching
pm_runtime_dont_use_autosuspend() is not called on driver teardown.

If the autosuspend delay is set to a negative value while autosuspend
is enabled, the runtime PM core increments usage_count to prevent
runtime suspend. Without calling pm_runtime_dont_use_autosuspend()
during teardown, this reference is not dropped and usage_count remains
unbalanced.

Use devm_pm_runtime_enable() so that pm_runtime_dont_use_autosuspend()
and pm_runtime_disable() are automatically called on probe failure and
driver teardown. With runtime PM cleanup handled by devres,
stm32_rng_remove() is no longer needed.

This issue was found by manual code inspection.

Fixes: c6a97c42e399 ("hwrng: stm32 - add support for STM32 HW RNG")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
v2:
  - Replace pm_runtime_enable() with devm_pm_runtime_enable() to handle
    runtime PM cleanup through devres.
  - Remove stm32_rng_remove() and the manual cleanup on the probe failure
    path.

 drivers/char/hw_random/stm32-rng.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/char/hw_random/stm32-rng.c b/drivers/char/hw_random/stm32-rng.c
index 9a8c00586ab0..f5bfe54c01dc 100644
--- a/drivers/char/hw_random/stm32-rng.c
+++ b/drivers/char/hw_random/stm32-rng.c
@@ -368,11 +368,6 @@ static int stm32_rng_init(struct hwrng *rng)
 	return 0;
 }
 
-static void stm32_rng_remove(struct platform_device *ofdev)
-{
-	pm_runtime_disable(&ofdev->dev);
-}
-
 static int __maybe_unused stm32_rng_runtime_suspend(struct device *dev)
 {
 	struct stm32_rng_private *priv = dev_get_drvdata(dev);
@@ -590,7 +585,9 @@ static int stm32_rng_probe(struct platform_device *ofdev)
 
 	pm_runtime_set_autosuspend_delay(dev, 100);
 	pm_runtime_use_autosuspend(dev);
-	pm_runtime_enable(dev);
+	ret = devm_pm_runtime_enable(dev);
+	if (ret)
+		return ret;
 
 	return devm_hwrng_register(dev, &priv->rng);
 }
@@ -602,7 +599,6 @@ static struct platform_driver stm32_rng_driver = {
 		.of_match_table = stm32_rng_match,
 	},
 	.probe = stm32_rng_probe,
-	.remove = stm32_rng_remove,
 };
 
 module_platform_driver(stm32_rng_driver);
-- 
2.43.0


