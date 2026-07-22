Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99E31C44539
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 12:09:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JnCZkgkGfZi2Ykzq8Jw5LKRVV2duYzk4jC1BEsMVF60=; b=nwhoEuve+/u5/xOdMBwcy2jmet
	SIlmgEkwJQRAumNAKC5C1z261IuMaHMpoEgvv89e6s7gfUfQaa/fgS/horau/cXk9bIQPUrSAWROd
	COk9uZvfMGzSrYTbf9Z4i0XnbV4eakd8Og27m9Ue6GjskpdSlE7R3Z+SVyi56nJP0xwmIh5m6u8vu
	0K36vlRxAPCydg1H7+WJhabjLPfmDSkqo9j0CoCUULkvJWS2ni/nbFrTXSd41SrXFZ010ccHpVN+s
	ICjIn8lb+r2iTDxEptrzzaF+qv5RQUVHUntyFd1A+FqsOqNHU2XbAdPZgETarK23d+XTvEdo+djjm
	ZV0IXzSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmVlN-0000000BiIY-0mRn;
	Wed, 22 Jul 2026 12:09:25 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmVlK-0000000BiHb-3rlk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 12:09:24 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-ca766c1c9ccso7483695a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 05:09:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784722161; x=1785326961; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=JnCZkgkGfZi2Ykzq8Jw5LKRVV2duYzk4jC1BEsMVF60=;
        b=Kdo9470Mgy3hB+wedcBCiLhaOSIt4/MkNLe+liimcwgzTEEnBhFptTLeQvTvTCSvTy
         kR1jVhIuUeFQMdBYcuyvlLrHHbotJP1cJVh5QsofglAZzF647B1lKC3h7iTbX3xV37BH
         nNXbS/USJDAgHo0PRzDmLHEM6+8eHho/zdEJLQLPSGfth1a1bTg2vhXQOlT/pjN9M9Ip
         UCpY9lovLCny77S2IHa62+1ADavjXo56QasWPjdgGTuyuCL6jk7zZ7D5j0VLx50tGG8Z
         weqjsRIKBtAcKCxW9IadU2MdQvfSYkdCNbTp53bB2gQDQ0FSy7SNbB4KAH4i2odSm/wQ
         gH1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784722161; x=1785326961;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=JnCZkgkGfZi2Ykzq8Jw5LKRVV2duYzk4jC1BEsMVF60=;
        b=C7mcDgRYlZtZuCeiG3Fg1W+iVrhGTcyKk3OENW7GdN4mxVK8zyk3KBWzQBTOt492zR
         X7WhuZKQU9pZ3kJLz9cXFTjykBEzR1Pb7VLshBSdum4ai4fchwsqWgm4rcT4GDAO+0XC
         gQFrd4AteIvLG/EE/ZZf1aux+y7SfE0/iqYHLGHzIMpATYAidp8szfpPsSMkVQe+7SB1
         hlGDrJ+kUrXDLmBUkLgQrwIGK9osUl+TS81L5FhkqykS7JOedEDpUgqL+tAkbpE0rnsY
         h25shyxA3Egvt/BPnWHmHK7L7jFo1oWzlcY/3ffT3pklDm35bBVXR3OTpCSiuf5/0L+g
         ijnA==
X-Forwarded-Encrypted: i=1; AHgh+Rr3TTb/SUjvqlzOwV3+KLE5pnaN41ltyT+JPQqvtSma7tZnT/2YmoolbrnWjgNfdhdumGkNzgsOWV32uRre3HzI@lists.infradead.org
X-Gm-Message-State: AOJu0YxOE64YK/yZmP42g+83ZV+oaaMPSpauINGM1nl3PsyudjeK4QuS
	DztddH1YN1qm+ZpPLw4OTH71XnkQu6FUDgOUv0R8es8Vdzyi5QHaTOoL
X-Gm-Gg: AR+sD10qkwQXQlj+ihm/zuR4/pi+3soTpaIyYI+lWTK+x6IwYTBJMQVwugyPa0+JQn+
	vbTKK/Qs/p3DoF5TUW5DRXa2RICoAd2i6eqX4Fa4t1qqCCM2KLSZEvNSZ8Bbnjopsb7y1LuR0QZ
	kbM7hrz5tE4Mw2Fm6eCRvjl8Mc6POKK2hHdgjMML53pw4ffj5brXvTDTdAgD9iTlNRW3FXWJI+0
	ELZym2OqgTtVF1/Tbr/0WulO82KRiO2e/rI9vaE1fuKDPiAdwO1op7/v2/WoDfZ/YmZoTql2h8O
	z/464jB1OD5gWzSXOwA1h7IXTNgxCQ2JhK4Jq5GG+608i16hXY9/terNvbfBM04txnH6YZcyuHW
	+vXchzNcYcPhRd39epjiJjlH0aT7M8XEvzpUzY7jSVOoxFUpw43lOMPQ0u+Yznc48L6dK+BVf1b
	f0fhVC9/oDx2kqGBXNTSx1KlVQacy0RNwOKQoPjdBjKOpwX78mnvxNnTncYmoCFLNiNeBICw==
X-Received: by 2002:a05:6a00:3c92:b0:846:bc81:3e29 with SMTP id d2e1a72fcca58-84c29305401mr23707166b3a.2.1784722161238;
        Wed, 22 Jul 2026 05:09:21 -0700 (PDT)
Received: from junjungu-PC.localdomain ([223.166.246.74])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e17286798sm1200884b3a.23.2026.07.22.05.09.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 05:09:20 -0700 (PDT)
From: Felix Gu <ustc.gu@gmail.com>
Date: Wed, 22 Jul 2026 20:09:17 +0800
Subject: [PATCH] spi: meson-spifc: use devm_pm_runtime_set_active_enabled
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260722-spifc-v1-1-e4462a4c6a06@gmail.com>
X-B4-Tracking: v=1; b=H4sIAOyyYGoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDcyMj3eKCzLRkXWNjs7SklFRLU0PDJCWg2oKi1LTMCrA50bEQfnFpUlZ
 qcglIs1JtLQBIqdjmaQAAAA==
X-Change-ID: 20260722-spifc-336fbde9511b
To: Mark Brown <broonie@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784722159; l=1841;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=c3pkZ4yaYJT5mT5XE0KdrjdNHM42/8KaKebxAgWgvPY=;
 b=LoDm1A0vxhBozG2ZbQAhtbUdmBpLnVMM36EGCfhoSXvay3NCvKqH10RJPwYb3BAxDUP0e9oA9
 12dhC8v+Fz+DGwjb2Oc++chA1I4nvnKvYojwuuCva2XpeIw0bXba4yQ
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_050922_994074_EF99C5D6 
X-CRM114-Status: GOOD (  13.32  )
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
error label and now-unnecessary remove function.

Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
 drivers/spi/spi-meson-spifc.c | 23 +++++------------------
 1 file changed, 5 insertions(+), 18 deletions(-)

diff --git a/drivers/spi/spi-meson-spifc.c b/drivers/spi/spi-meson-spifc.c
index e36aa94bbdae..f67a0d10b602 100644
--- a/drivers/spi/spi-meson-spifc.c
+++ b/drivers/spi/spi-meson-spifc.c
@@ -325,27 +325,15 @@ static int meson_spifc_probe(struct platform_device *pdev)
 
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
-}
-
-static void meson_spifc_remove(struct platform_device *pdev)
-{
-	pm_runtime_get_sync(&pdev->dev);
-	pm_runtime_disable(&pdev->dev);
-	pm_runtime_put_noidle(&pdev->dev);
 }
 
 #ifdef CONFIG_PM_SLEEP
@@ -423,7 +411,6 @@ MODULE_DEVICE_TABLE(of, meson_spifc_dt_match);
 
 static struct platform_driver meson_spifc_driver = {
 	.probe	= meson_spifc_probe,
-	.remove = meson_spifc_remove,
 	.driver	= {
 		.name		= "meson-spifc",
 		.of_match_table	= of_match_ptr(meson_spifc_dt_match),

---
base-commit: 3fe08b9796f36ef437ab9328e7dd1e5ff2d66603
change-id: 20260722-spifc-336fbde9511b

Best regards,
--  
Felix Gu <ustc.gu@gmail.com>


