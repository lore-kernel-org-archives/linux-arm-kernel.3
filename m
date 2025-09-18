Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12488CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 14:08:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=b3jtPOVR/Qh9IZ/OmR2ja7xClQUBdSd//rUxpdfZTIk=; b=JG6huVPnn9dZJgUsJCPcADa+RX
	1SGJfuiG3Tyo1ldgO26gTtEMl6iMFFQMVIx76urDVGODap/iz3eAgiAimp/0c2Qsq+6GskPjyh0F9
	SM8OrqmLrAZ5y7hrgW4Y/5Up26Xso/Bd2UY72gue0ZiaiwqFR5++rqAKMkCIHdptSnGc2MQhPUYZT
	PFr5Lu6DXWGnYKJ+E92xr+Z0wPhW0bl79k6OYPpkJNc+Om+KtURqmoYNRgKUcCRZB6+hfCu/DWybA
	I2lM+R88K16c26b7hSXWwCaIMQVqGERRU9jIFlbWS8bkfnc/ymwCtg7Fjq6pWsXwvZ4BK+OK9x4Tx
	i2epA1gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzFJZ-0000000034i-2w84;
	Thu, 18 Sep 2025 14:08:49 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzFJX-00000000333-3IUX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 14:08:48 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2697899a202so8391025ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Sep 2025 07:08:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758204527; x=1758809327; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=b3jtPOVR/Qh9IZ/OmR2ja7xClQUBdSd//rUxpdfZTIk=;
        b=l/u/fdesx7HmGIlCmbo3Q3GzW6e/TqHYkEW8Zn9KdfDVsH5zHi1ZD3M76iwOXzJAwg
         vFL3FTnjAY4N/khfKp3R57xEb8jx/oYywxWMjgcNlMJ86IACMXCJEDYXChklAOG4cEbF
         Bdu1Do4hAUFag07oGEzLt1KY/gCo1Ve+6UMyuKUwQa+GS8xYsrNdEfwYMaEOFPGqaXUA
         6cBLaH/L6k2fAhGQcVnEANQcfnpj9nKb3gYPGm+cPMj/gApzrd7U/OKxoRzHZ71kZOUW
         WNXbmMqSAimmstG42ma5EFEfC0brUcMwGrAVAmEKyvnqe9Ps6oVqiN2dY5D1AHFm6yi5
         JkNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758204527; x=1758809327;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b3jtPOVR/Qh9IZ/OmR2ja7xClQUBdSd//rUxpdfZTIk=;
        b=Pn/2cc92luMGmmqAdZJsuQpxho7AOoUabCBEBfDbH8CuTXWtv5xOLFqpXR3ce594VI
         WsNxeW8ZPLE08guXNXnyJumKuf2EjJ+p5BNtHYmjSjFYED1HPqGyGG8ZamzesOspuKYf
         McMfc1sISQ1uFIeFc0OuytIo0HMSw4sNoPn3dKZFSHVfcREjR5w81VYht22mmjOhfUek
         JrJQka9MnGdtmUzDqBq5uKNSyX0SHXFE3YnmhNWMENCDHPQYcnUEn+EkBni3//BgNmWe
         OXoSBxP7nvSnx+tTT6rTtAEp/rTEEiOlWyE1og81M4FVt4DKX2Vxfq20Bs8y2jEX7AFG
         zNQA==
X-Forwarded-Encrypted: i=1; AJvYcCW5GeLxRyk/HAsk6KqnSHE/Klpq2StkYheml1GVUyTfWiHR+08ujGDnfEHx6EhHLvZgZ+4CGfZrqAZBL2m13C6k@lists.infradead.org
X-Gm-Message-State: AOJu0Yzq4tHfKRVuU2NBHWxGkPgOP66532DWXk1iy2Uhq3ez4VuG0iF+
	BvKk7fpyRwvQlC4+FUun5IC1BbsEcpENbRibU1akgdssC77U0QgzNcM0
X-Gm-Gg: ASbGnctlGP/SCgu3evA/LReGX89+sHzJ7h9jBS7PNogReIvLGDDFVoGLEuP3jlZdGIj
	zXQSCZdGdaso4wjX0HX0aqXOor2OAZrhfnpmrL7D6/vmw5ushKA9tH+RxgISNJprE7SVc/ktsH9
	eEJSd0uRujsal5tjlKBKcNqkO9T8nD5pD6unAQ3tYxldv5G5xJWdUAmNjFf7Nc+tPDsJmITUnp2
	m+xDeHXfZ56rmHLzoMaJx+EQCc+cGhPRfvxEHdbgDZ/LsqXwmxwBLLPxD1X9O2baPsEDgueLU/l
	4K7MeTPRRi9MKJLr3BvJCK+5D2KMiiQh/KULoo70Ha/ToIEkv9Qj9EigaSaDjT31x23QMrazCBG
	3ZnqyBKPkRl5Qd9ADzLkjDjeprm+7BJpYYPZvDXK9iA==
X-Google-Smtp-Source: AGHT+IHL4igJxg5AwA7L1D1p01uU/62u44PEnlUK/eOY3G/4bPrg+RD9PUmGGbiLH93nITnKJ0zvSg==
X-Received: by 2002:a17:903:1212:b0:267:d7f8:405b with SMTP id d9443c01a7336-2697c6afddamr56831825ad.0.1758204525753;
        Thu, 18 Sep 2025 07:08:45 -0700 (PDT)
Received: from lgs.. ([2408:8417:e00:1e5d:70da:6ea2:4e14:821e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-269802e00b3sm27037455ad.90.2025.09.18.07.08.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Sep 2025 07:08:45 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Guangshuo Li <lgs201920130244@gmail.com>,
	Alexandre Mergnat <amergnat@baylibre.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: stable@vger.kernel.org
Subject: [PATCH] ASoC: mediatek: mt8365: Add check for devm_kcalloc() in mt8365_afe_suspend()
Date: Thu, 18 Sep 2025 22:07:58 +0800
Message-ID: <20250918140758.3583830-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_070847_818448_58B0B096 
X-CRM114-Status: GOOD (  15.32  )
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

devm_kcalloc() may fail. mt8365_afe_suspend() uses afe->reg_back_up
unconditionally after allocation and writes afe->reg_back_up[i], which
can lead to a NULL pointer dereference under low-memory conditions.

Add a NULL check and bail out with -ENOMEM, making sure to disable the
main clock via the existing error path to keep clock state balanced.

Fixes: e1991d102bc2 ("ASoC: mediatek: mt8365: Add the AFE driver support")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 sound/soc/mediatek/mt8365/mt8365-afe-pcm.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/sound/soc/mediatek/mt8365/mt8365-afe-pcm.c b/sound/soc/mediatek/mt8365/mt8365-afe-pcm.c
index 10793bbe9275..9f398d1249ce 100644
--- a/sound/soc/mediatek/mt8365/mt8365-afe-pcm.c
+++ b/sound/soc/mediatek/mt8365/mt8365-afe-pcm.c
@@ -1971,22 +1971,26 @@ static int mt8365_afe_suspend(struct device *dev)
 {
 	struct mtk_base_afe *afe = dev_get_drvdata(dev);
 	struct regmap *regmap = afe->regmap;
-	int i;
+	int i, ret = 0;
 
 	mt8365_afe_enable_main_clk(afe);
 
-	if (!afe->reg_back_up)
-		afe->reg_back_up =
-			devm_kcalloc(dev, afe->reg_back_up_list_num,
-				     sizeof(unsigned int), GFP_KERNEL);
+	if (!afe->reg_back_up) {
+		afe->reg_back_up = devm_kcalloc(dev, afe->reg_back_up_list_num,
+						sizeof(unsigned int), GFP_KERNEL);
+		if (!afe->reg_back_up) {
+			ret = -ENOMEM;
+			goto out_disable_clk;
+		}
+	}
 
 	for (i = 0; i < afe->reg_back_up_list_num; i++)
 		regmap_read(regmap, afe->reg_back_up_list[i],
 			    &afe->reg_back_up[i]);
-
+out_disable_clk:
 	mt8365_afe_disable_main_clk(afe);
 
-	return 0;
+	return ret;
 }
 
 static int mt8365_afe_resume(struct device *dev)
-- 
2.43.0


