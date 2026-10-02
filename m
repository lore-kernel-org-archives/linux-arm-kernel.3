Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC8D9CA5FD4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 04:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QDkTuoIx7co8Z+KTX/+/iuusl+fatSzZsp7l8WaBTtc=; b=4lVh7EDMJgDTj8h5XDmuV6QXq5
	+wP0FeIlQ8UOLdFJdSD4kRUlEvXj93e0Mc1OTXvSWjVoyP1zmFvPhSVdUAicZNrs3xnoCoNOANvpa
	Wi9lrgrjmH2jvsrshlqxPXwne8hSoufMVTmUnJpIloXPnU1kTIcNXbIFKj8ce1Qyg7H0+1nxhxcHP
	bHvWx0Vc3MxOFwtdQTur0vkfUTNbEaDBYhVlx9YBD4+c3W9q6fK3SBjUo+EKnGzItwgLmiYZs2ddD
	4Z1yNaDh62ZnaKDlNWMxMdW246+d3FDohYk/IDnABPuQbrpd485m+4g+/bdwNTsL5xpg7aqiWY7Ko
	30TvKTcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCV3d-0000000Ac7a-15lb;
	Fri, 02 Oct 2026 04:39:41 +0000
Received: from mail-pj2-x2b.google.com ([2607:f8b0:4864:39::2b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCV3b-0000000Ac68-2BQK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 04:39:40 +0000
Received: by mail-pj2-x2b.google.com with SMTP id d9443c01a7336-2e2c7eb3b8cso18040405ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Oct 2026 21:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790915978; x=1791520778; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QDkTuoIx7co8Z+KTX/+/iuusl+fatSzZsp7l8WaBTtc=;
        b=hrbVKyiNPH2rZfyLQLMUh2X1hP9mzJs1JIfiizmHx9auP3Fa1jhWKNluiCbX/9PlaC
         TrAoFHcwAjLqVRKAGOapAjxKtDwOEZw8E5BNBnAeJKPbrog3mKTk9R43wvJKsHyLay36
         TGwNjU9fotRV0Yho6xLFRyG6Q02WBLGi352sMk93mA9bOSqP2BpI9uT/ZMOuSW2BG4ay
         i9VNFTAdVGmtDwH0XK0vfF30V+CzI1XALuTJ61+Pc3B4G9r09MF/CvXoBxP2GvdI5hrD
         WGXjCG7FM9ZyW3BmCjHO28BnZQX1S9J8xKH3uPznm9Z3BM3EvxuyxlipdTg96fFkGS3v
         Zi8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790915978; x=1791520778;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QDkTuoIx7co8Z+KTX/+/iuusl+fatSzZsp7l8WaBTtc=;
        b=ClaNhpkno9/Tdz6iYSlc9vAHDbf680BgCWBa1hQ6XNAhjEXakSAd33PQWeutXFdUNS
         44xhFyLu7Ar6tli+Zc5Fm/HWXCXq9qSvZh7LFFW8j/hhEhEN6l7cPB/GEoU/mC08+3G2
         Dv4I9Q8qwqfiA7uIdKlpL4IttOkYTx41HpP88VOt55Tlu4SrhTqdCc52+0ha1mJQAXqG
         VrcPLcIrYSaw/eFZxnXMB8E5y0orhETYPcYR3DcZ+qCYUi2e/fYb/NcP1h8iVeF9EKTw
         +5YV+yaVfzRReGCkbFTDnL3QvJL574AZVR3+ZWPqK0FfkrfiY2Ij+Ichwdo5jmt4lum1
         0Slg==
X-Forwarded-Encrypted: i=1; AKwUvBxmeHAgM/T8vhu2f8RXMuQJDoxPTyAp4gERR/3rJkTH/XyAx/IrMbjTnD9RoUSDz8bHQIdrrErxHU3+c8MhHcXX@lists.infradead.org
X-Gm-Message-State: AFq9FYI3/IvpcjoM/SH+peli4g3xCdwcRufaLSTpXZX7Wse42EeDVDh2
	Nf7YOomr60C55gJcXJ5zuuA1G18N1K4DxX7KFOZmdqDWqs+4LWCcHfBi
X-Gm-Gg: AYBFou0E9yfC0KtbVQ0XXrC/KVZa7ST4YqeSpKxN7Mblbob9FCUHQ9wGsS5GulCsvdM
	fjNGVxiuR5moMp2dB28bbh2jLwXvSEB2m19Q8Y070DxCrWh9Lxsc2wzuPPQIhX7X3IxAnA7oqmm
	9Lpi8+M0KkzUx4IehbSAf64fWA5jWTaUlPkZPNGAFb+MRmbrbUa11IZmMxmgNdUhRBARp5qlTxr
	7mckE63I7POmPJwfU2NSpgX0qUFamYuTTiXGf7d0l5IByq6tAL4NeJMXV7QiIem0KhpmSty5Xlp
	kH809i7mNUBx6xTPhBnd1EVCj9/TKtNOvmEgCbDeKJiIkxmjqinEnmahnM8UaBM7H4SWkvIPP+B
	pvtGDlK+bIOH8AfOZ/XhDKlVmqCqCk0bfjR/wvgmTKvXApB8vvQ3+yJxewEim+mq7hSke0kNfhp
	FCTxiwxlR6hY+ynFWxYQ2WfEdkT/dYmJ0dFK5ds94PEZ37iDJp15LCV1wrYn6iG2KEWiyCD4Nqa
	os92X/8jEVZm2P1wTSizTt4TQ8qaovAJ470alF1CCJkHUal54dTTnmzBZlcK5Apcy9ynxVPvaGn
	C4xTr0rqzKKoKQ==
X-Received: by 2002:a17:902:e892:b0:2e2:f2f9:b1f9 with SMTP id d9443c01a7336-2e49b7f3714mr12668385ad.44.1790915978480;
        Thu, 01 Oct 2026 21:39:38 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e49f67c413sm3713985ad.20.2026.10.01.21.39.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 21:39:38 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Andrei Simion <andrei.simion@microchip.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
	Cyrille Pitchen <cyrille.pitchen@atmel.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 4/5] ASoC: atmel-i2s: use dev_err_probe() for pclk errors
Date: Fri,  2 Oct 2026 11:38:55 +0700
Message-ID: <20261002043856.97295-5-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261002043856.97295-1-phucduc.bui@gmail.com>
References: <20261002043856.97295-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_213939_569012_DEF859FC 
X-CRM114-Status: GOOD (  12.38  )
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

Use dev_err_probe() when obtaining clocks to avoid redundant error
messages, particularly for probe deferral.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/atmel/atmel-i2s.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/sound/soc/atmel/atmel-i2s.c b/sound/soc/atmel/atmel-i2s.c
index 6ca230f8adc8..9b651eb4f0a4 100644
--- a/sound/soc/atmel/atmel-i2s.c
+++ b/sound/soc/atmel/atmel-i2s.c
@@ -662,12 +662,9 @@ static int atmel_i2s_probe(struct platform_device *pdev)
 
 	/* Get the peripheral clock. */
 	dev->pclk = devm_clk_get(&pdev->dev, "pclk");
-	if (IS_ERR(dev->pclk)) {
-		err = PTR_ERR(dev->pclk);
-		dev_err(&pdev->dev,
-			"failed to get the peripheral clock: %d\n", err);
-		return err;
-	}
+	if (IS_ERR(dev->pclk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(dev->pclk),
+				     "failed to get the peripheral clock\n");
 
 	/* Get audio clock to generate the I2S Master Clock (I2S_MCK) */
 	dev->gclk = devm_clk_get_optional(&pdev->dev, "gclk");
-- 
2.43.0


