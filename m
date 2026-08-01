Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C1BAC55173
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Aug 2026 17:51:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=s9EB+RS//J1LVLQYmJ1F9JsoVjN8nQoD7T3vVQUG2DI=; b=yFC0N/j9eQOdyjxzJK7T/8UbpH
	Fo5yXqysXc+2SL8N7cN9CPkTCDKh+Q2OW7vNrYFnO9hNJhpS2SAxaTJX+k7O4bGKPz9FNn/mvvvWM
	9TGyudWgw0wd7DUvq1Xn71un6wNPlwvJj1HBlWIEl2/U6yf3S+e4H32aWysYF8K8wJu9VO9d5JOb2
	RnjitFo54Uo9Ih00yYAbORUBgSO6wtdqzfdDQFUusu8nu3zdQX8/yjK8S4ZgMN1YmxeOO3dA3ijWI
	/rjokNZnb9q5IJXjlbOdAfnvR3bz9fBky7KciqY9r3PgHP7Hj6sMJV8P0O7Vg5a29krodBfVJHzXA
	LMClkyBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqDs2-0000000Ew7K-29i5;
	Sat, 01 Aug 2026 17:51:38 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqDrw-0000000Ew6S-31ue
	for linux-arm-kernel@lists.infradead.org;
	Sat, 01 Aug 2026 17:51:36 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-84a2dcede83so2969572b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 01 Aug 2026 10:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785606691; x=1786211491; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=s9EB+RS//J1LVLQYmJ1F9JsoVjN8nQoD7T3vVQUG2DI=;
        b=FPCQlo3YE7Whw8hplz5FjTtHCOb/Y17rK1JX1UdwlYdWMchz03GPZyoKmgkArofoZO
         rnC6IAFQU1Te1wpObvaBDid/cDwMdaJ/6i7Yjk2zU2UoRRTnR8SfcKqhy4hPYmvIyj5i
         e3mcZ4UI4LTBhvNSJLlUInIyOQZ2SsxIxjBHMekX73J5qTdH6MtckJITEoVb6OJQQ4Uh
         7n0ye3KqvgLOzbToPcvIjxb5z+Ks9Y/TjhAyCiU3V7ZLr7N+LDMhLniKyZi2mwYuA6uZ
         sg3m1aZXr83thGFJ0eUOh5e5rv8UEVnFpwHUp/ZtrfyZsOlaiX3Qlgt/KVdQH5h0C+FF
         6Gig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785606691; x=1786211491;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=s9EB+RS//J1LVLQYmJ1F9JsoVjN8nQoD7T3vVQUG2DI=;
        b=k6xt/rKUyIEmF3czNqLylTuD7EK1Tx77PKDOwGdXeR7Kjf4Nz+eIFsCC1xfhoi2m8m
         Q/IdHJf79WG3qx7sdVClokMB8eanupaNGWvjZdmI3Bz7DgRb03+h+6vszup/AAIdbak1
         rEgl+1i399b93UrtCLM3KuOqoqW0sDMNhiuB5QfDVynBQkPl+W65gUipbxG/CaurTPMZ
         UJCjMREaf7kJBuO1CA0TI7XSVjSpiO+rPuuRtAMilabfUbQwbSg/12KHqm3oCbuzcQoR
         0R5nABXnHB02MrH4d0G4AnTU3iTF1+RgNZu51OdO7kYwjI1z2ImUF8Ro6sLCzDCqbxUl
         mtuA==
X-Forwarded-Encrypted: i=1; AHgh+Rq/Z5CDZZoVpedS4nVaskCTI+PrRUp/FETloaOx+lX2prwF0jhTdgklviqVgjArYFYS1XpGVLS+5/WWAk0cWJ09@lists.infradead.org
X-Gm-Message-State: AOJu0Yxi7H5bojwKVibH1sObi3JivilDEbme7zdg/wHYt4obhkpg2dVk
	Mi5yLIsXaAakq0y+tpS+tfCcAEao8fEfVRmneqdFIXwgWx9jL+iykim3
X-Gm-Gg: AR+sD108XqSdnZ+KtbOWdpttY0lM+lsTbP0m6CJvBn31gme4T5BNY85QHAN5Jt3J6ll
	oxfvt4+OhzHrnovZy/KVPq9puImmcseRelc8fs8/xGMZi1fW2hQoD3vrTsM3AhbLEjFuYH+R2ch
	XqDzdCfgSVIyNLXtsBL9fnIhQ73N7EYsYzYoKEDElGjDG8+Y9lrTSGA2kTDE9PkygCm/btRzgBX
	51YYnu2iJk0g66nIEYPRQXCad7jy5qGFtsOd9JDaJj+59j27vh9QVeqBM8OtbQDRTqCO+7vzdEr
	7HAlCSlPVJ4kgQZhIoGLXNTqhBbFBtTyHwq4+00LC8B34si/wqsaTGaJ1ligRNtrSDTDqNup1NV
	908Rxb5/GqvJ415/3/M+rRqpK1Pi69v+hBkDkw+gRTm/iRtF1KU321jwYVY/H8EX8FP2z957Eca
	+CfN0ji5gw3Cwqr2vcUYWdr5DMbY2CgR3+bZEXv3iFZYGX9TIy5uXYkAQUEuCIwysvGAEOwV/j0
	QGBGU2busCHKUFKtEQVO2KQXDtGNk+Q1Qzu/g==
X-Received: by 2002:a05:6a00:4f81:b0:848:2f77:e2e2 with SMTP id d2e1a72fcca58-84ee49b4dfcmr3807979b3a.75.1785606690871;
        Sat, 01 Aug 2026 10:51:30 -0700 (PDT)
Received: from [127.0.0.1] ([103.17.98.26])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbe3963da0asm1851610a12.4.2026.08.01.10.51.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 10:51:30 -0700 (PDT)
From: Felix Gu <ustc.gu@gmail.com>
Date: Sun, 02 Aug 2026 01:51:24 +0800
Subject: [PATCH v2] spi: meson-spifc: use
 devm_pm_runtime_set_active_enabled
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260802-spifc-v2-1-46e9d06a3217@gmail.com>
X-B4-Tracking: v=1; b=H4sIABsybmoC/12NwQ7CIBAFf6XZsxigiNGT/2F6ALpt19jSQCWah
 n+X1pvHSebNWyFiIIxwrVYImCiSnwrIQwVuMFOPjNrCILnU/CwlizN1jtW17myLl5MQFoo7B+z
 ovXfuzY/jyz7QLdt4MwaKiw+f/SiJzftvJsEEQ6W0NMppw/WtHw09j86P0OScv8eNlqKsAAAA
X-Change-ID: 20260722-spifc-336fbde9511b
To: Mark Brown <broonie@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785606686; l=1987;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=yMtI9BK0fNpSFzuJ+wAyM1BWD3SMOzrFcrsFwAmmawo=;
 b=6VtTQY9UDzYuad/EIaTRPmGT2JECVibG+R/klKIvnybHeF+an/RrExy+5fAkpr9Oe+g01/wW8
 UUVpgKTTUSeDht2aim/cUJxJiQ9JMVeQyIA2/Wk55yEu1mpxU2IROTf
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260801_105132_771290_FFC1F8A8 
X-CRM114-Status: GOOD (  14.18  )
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

Use devm_pm_runtime_set_active_enabled to replace
pm_runtime_set_active() + pm_runtime_enable() and drop the out_pm
error label.

Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
Changes in v2:
- Fix Mark's comment.
- Link to v1: https://patch.msgid.link/20260722-spifc-v1-1-e4462a4c6a06@gmail.com

To: Mark Brown <broonie@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
To: Kevin Hilman <khilman@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-spi@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-amlogic@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/spi/spi-meson-spifc.c | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

diff --git a/drivers/spi/spi-meson-spifc.c b/drivers/spi/spi-meson-spifc.c
index e36aa94bbdae..82c1c3c0c84b 100644
--- a/drivers/spi/spi-meson-spifc.c
+++ b/drivers/spi/spi-meson-spifc.c
@@ -325,26 +325,20 @@ static int meson_spifc_probe(struct platform_device *pdev)
 
 	meson_spifc_hw_init(spifc);
 
-	pm_runtime_set_active(spifc->dev);
-	pm_runtime_enable(spifc->dev);
+	ret =  devm_pm_runtime_set_active_enabled(spifc->dev);
+	if (ret)
+		return dev_err_probe(spifc->dev, ret, "failed to set runtime PM\n");
 
 	ret = devm_spi_register_controller(spifc->dev, host);
-	if (ret) {
-		dev_err(spifc->dev, "failed to register spi host\n");
-		goto out_pm;
-	}
+	if (ret)
+		return dev_err_probe(spifc->dev, ret, "failed to register spi host\n");
 
 	return 0;
-out_pm:
-	pm_runtime_disable(spifc->dev);
-
-	return ret;
 }
 
 static void meson_spifc_remove(struct platform_device *pdev)
 {
 	pm_runtime_get_sync(&pdev->dev);
-	pm_runtime_disable(&pdev->dev);
 	pm_runtime_put_noidle(&pdev->dev);
 }
 

---
base-commit: 3fe08b9796f36ef437ab9328e7dd1e5ff2d66603
change-id: 20260722-spifc-336fbde9511b

Best regards,
--  
Felix Gu <ustc.gu@gmail.com>


