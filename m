Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F40AACD98CC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 02:01:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GDHiaw71z8q8M2ALF9QoURQ8Hng/rkqvvoaFnmcE27w=; b=H+b1j8ORIoQatt7+/ENK7p3FeA
	MUlNJE8mUkG72oAsgV/wPNNsF5Czz1nJS/zxqeKqV9LTPRlqn1cuziloUQA1+sBVAInpuS7yTK2eu
	HUCQOvC2S0nzgetubv19A1tduDjMnCd4KzyuRZf1INh6Gyx/YuRZk4f9RPgLEZlZnJkbmL5xFJXJA
	DEmpbTWdclvdCKvHDScMWm0Ahu0nTfMWAz+flg64HhOymEazkXSanyV9Tcp4Bldlu2K9biQVYqnfY
	1uwQeuREhBaUDfDXZyqAh1c6WzXwCT6fSHF35l+XJcr5DqfUVQen3rVcln+EutqOMJNtqHMVR3U0l
	8odk1mtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXrD9-0000000AHJs-3842;
	Fri, 12 Jun 2026 02:01:31 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXrD7-0000000AHJD-1cKZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 02:01:30 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2c0c2d8b95bso3541215ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Jun 2026 19:01:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781229688; x=1781834488; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GDHiaw71z8q8M2ALF9QoURQ8Hng/rkqvvoaFnmcE27w=;
        b=OxmGgJ6Wp5ImS7JsWZS8v5jD2bcAmZL2KHfqaI8m4/cUbZ4Pzg3FzDBilY+aFm6zND
         kYjQLhsJIY8bnECSc6K8v+DVUH7Hf2dSpSutYS1x9Lb8u5swBioZyUuV8ylJsVJ2BXpw
         p9pPAaz/jZwSPwWiGZMMgX0zYYa3qNDyUAlw4VkG/bHQ1T/mcVXmbPjMUtbPl5KoDi2j
         uv4W9JAHzphLVY3zLhunaxikGhjZZq1wU7ELBiQy2v0hJ8RmIJPRGa8wufhH2qCHxNX4
         f5ghZ7XCBL707H0gqFL7BAHVh28gfrIwCl9gmeHdtyZDka/O1sIpTCVCs2qKe4K0kkso
         8RdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781229688; x=1781834488;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GDHiaw71z8q8M2ALF9QoURQ8Hng/rkqvvoaFnmcE27w=;
        b=YbOzeEskfeTYZ8Aa+RU878SBXvLPA3MOHSXtJ0rUzWWnmjLBKkpbqp+vP0MH1+8BKP
         Val5ywdhtoTR85LuMhBRUTupvPtwQT8FBmsJmCfjfDRxBuDJmNEu3xyOoLKvYX7H7Na9
         B6aGVOxgAVlNJJU319/OxYuceKWAIrBWrGC0JW1awWy4wZJesQdRL8liDn9cc4ASc0cQ
         r7CpKUz7zTMs8fAUwy0c5G8Ky2NSKpaDu3fKrbpbG6FdNDqOwj1Ev6Dc1gJulb9HTfo2
         ffhNPpIQbV73ZqmoDuCIvfwja7EBpPqvfF586zJ+Cb3KhIb7JIFSrH5GYmL2Cm5c4VbJ
         VLqA==
X-Forwarded-Encrypted: i=1; AFNElJ/AeWRglXFZVFOREd7FFVH3MQsWsgdoO4uj7Swy8wUJ3IID1jDtZvTsEH0wxahlz9hU3ZvDyavFnZrw+HoFBpWg@lists.infradead.org
X-Gm-Message-State: AOJu0YzpusvCWFpwv1/zWaueBRqkAw6l3ZCtjEyA93mgIPNAdUg7IzcD
	wIqYwpskltl/VItNuSSnBl9AVAt2HD9ZImCTt6/LH13sSBzzlltkInoFTilBcg==
X-Gm-Gg: Acq92OH1w71wKp2MyycNgT1kTDFFeUzt6DOw5TFKDm5xcn2aok8Atu3fqrbWzh2kYvm
	hcdgDguBvewtWNSbmKhGffOkVghD0tqi0S6V3GRTJ18ptzYo4aZaKyQ7FKBMYJsLtIrtOgGc6IT
	O3+JJnAUYAUSGwscaeK8wSO0ljukmLvHbEDDaMb+0dtjxoeeL5GH8rxFN2En0RHa2RPAxNdrCZF
	4kLDf0B4OzYktpbUflnwDZUME6bI6uJPdReF9YOwCsHvXcKbsf1mo8vwQZedtDbGKUnIUx++Md5
	WPgA2l1q5lB8mzALSygKjOaEK6yFp1A/lGDcwBdSSAsBALQmTrcy831CwECvJNfsVEdYiBdjKeY
	l2IT8YYElieFC3DEm2TQbGDPOwoAMaafGM7eNwt1t68WT1na5JyP9XgO7ypL6fo8sKvcePZc8bD
	nf1vZSVXltA7o8D9wcQHhAgZHOf/wXPqYKcV8AeF7L529yS5ORSy/VgFNUvXfhqyb46e47
X-Received: by 2002:a17:902:ebd2:b0:2c0:a373:89bf with SMTP id d9443c01a7336-2c410ae3ec1mr11770185ad.1.1781229688150;
        Thu, 11 Jun 2026 19:01:28 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f2e5590sm2657525ad.14.2026.06.11.19.01.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 19:01:27 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Jerome Brunet <jbrunet@baylibre.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH] ASoC: meson: Use dev_err_probe() for device reset failures
Date: Fri, 12 Jun 2026 09:01:12 +0700
Message-ID: <20260612020113.9557-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_190129_426030_FAAB9744 
X-CRM114-Status: GOOD (  11.33  )
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

From: bui duc phuc <phucduc.bui@gmail.com>

device_reset() may return -EPROBE_DEFER. Switch to dev_err_probe() so
probe failures are reported consistently and deferred probing is handled
properly.
This matches the existing pattern used in aiu_probe().
No functional change intended.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/meson/g12a-toacodec.c | 2 +-
 sound/soc/meson/g12a-tohdmitx.c | 2 +-
 sound/soc/meson/t9015.c         | 6 ++----
 3 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/sound/soc/meson/g12a-toacodec.c b/sound/soc/meson/g12a-toacodec.c
index a95375b53f0a..21941ee552c5 100644
--- a/sound/soc/meson/g12a-toacodec.c
+++ b/sound/soc/meson/g12a-toacodec.c
@@ -312,7 +312,7 @@ static int g12a_toacodec_probe(struct platform_device *pdev)
 
 	ret = device_reset(dev);
 	if (ret)
-		return ret;
+		return dev_err_probe(dev, ret, "failed to reset device\n");
 
 	regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(regs))
diff --git a/sound/soc/meson/g12a-tohdmitx.c b/sound/soc/meson/g12a-tohdmitx.c
index d541ca4acfaf..967109ca2b57 100644
--- a/sound/soc/meson/g12a-tohdmitx.c
+++ b/sound/soc/meson/g12a-tohdmitx.c
@@ -251,7 +251,7 @@ static int g12a_tohdmitx_probe(struct platform_device *pdev)
 
 	ret = device_reset(dev);
 	if (ret)
-		return ret;
+		return dev_err_probe(dev, ret, "failed to reset device\n");
 
 	regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(regs))
diff --git a/sound/soc/meson/t9015.c b/sound/soc/meson/t9015.c
index da1a93946d67..f0b55aee5241 100644
--- a/sound/soc/meson/t9015.c
+++ b/sound/soc/meson/t9015.c
@@ -265,10 +265,8 @@ static int t9015_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(priv->avdd), "failed to AVDD\n");
 
 	ret = device_reset(dev);
-	if (ret) {
-		dev_err(dev, "reset failed\n");
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to reset device\n");
 
 	regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(regs)) {
-- 
2.43.0


