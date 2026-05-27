Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60C8FCD5BD5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 13:42:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LPQMUeKZPxsEa24h/tMGbugrrlbgcKdXRN5CjzvNfg0=; b=5B3IrguJqRRV4dn1HJL4LYvlWp
	4Cz8OnV0VCCI/qwuzpIFqpp2fVj1lH0pGlwq+u6jMQaxvdySxdmgUa3mvW6L6vOQdQ/RhkacyWlMU
	EgBVF0vXK2vakGNpsSkauHyKehWErL3RxtbZSQRMKWyDzfO9A5oMatnTpKKAqsazIkCQS5Ilx+oqj
	ME0Jv8R/KeCT3gK6+PIjofZYHqUmKyEE7GEV30nkfiYn3bncLxCO/UgR9kknF4ZUPcPdLp8jDNEd3
	KLoFbKXZi6A8fMF0gL7DtAI4s1bJQcwBil7+uzIFJYBYS6qGuQvhlGgnX87UKLaJ6izCxeSmejlJa
	LcRnUkpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSEWb-00000004De9-2TVl;
	Wed, 27 May 2026 13:42:21 +0000
Received: from mail-dy1-x1335.google.com ([2607:f8b0:4864:20::1335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSEWX-00000004Dat-1P18
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 May 2026 13:42:18 +0000
Received: by mail-dy1-x1335.google.com with SMTP id 5a478bee46e88-303dbfbec77so13902571eec.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 May 2026 06:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779889336; x=1780494136; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LPQMUeKZPxsEa24h/tMGbugrrlbgcKdXRN5CjzvNfg0=;
        b=YDfQmLWaJohv844P+8eY7Gm6WKTk8bhLINADykV2KgA4+qemBEEnBHGLWfJ5NI8JUl
         AhrC4gyAi4Q5yQbSA/ZmGxCj8wn32Pk2Ibh4Ss5tvJmEwLgr6kjvJj8pzp4etmvYb0C+
         j8QnzJk4c3Wongd7EDSxtVzqHCgELYSUyvQv0dxqUiPoPTlrBP0kJqn84TjyEda7TOdA
         4RpnbIs/GQJyfX19KvQZS7pjeFTD+8zCwx6WUN1OzFIGPlV4O2uw8qSFdlU9BYTJ1Y/v
         cdiQ/D0L5GNW+7vhOW8ZFu3B33bpUjuYY0lFyUb3NQWV3IInHT5mHyItZ5eMwjVeUcQ1
         LPhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779889336; x=1780494136;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LPQMUeKZPxsEa24h/tMGbugrrlbgcKdXRN5CjzvNfg0=;
        b=eI1qChxn/qXUOyAvV7xQAseDHYSOevA8o1FP19027Buz5/8yWoSy5WXxYa/qvktMFI
         gDNNEqa4vVoQgjBjp12khpFf9mWERVvwZxf3+1c83mhRnHCobkKhDuM6QnZWU8JxAtcM
         B/M6LkKhoS1/J5G40jQYE/4xeAbIJKGdu+dsNOfO44qYSYUj+8lyBzIZq3LuEpPToKRt
         T8nSi2oCu6IuS2gN0LaVE+ZEGGq7R2cNNlTDSuapSj5rBd6EDtQgz+/QYR4odTJ6dK37
         aMOVmqLMT/NWqv4bZdhSfzNk1jR0YG6tsMeAjbr8yzJ2jPEDqGlNF6VWTIJP415za0wQ
         RGXw==
X-Forwarded-Encrypted: i=1; AFNElJ8qAcQUXkqv/DOL6yiTuyi23R2aNK8fhVctQZ5r5Phj3PZG/e2m/BTqap0ZWayP7OPbY1u5E73pRKtJQtJOYBQA@lists.infradead.org
X-Gm-Message-State: AOJu0Yx43SYFFRgdWWtcfFDWdLkRts8+4jufAr0DjWu5QQRJWlmasIxC
	kxYhCqyVZJpychNBrf4LHHUFT53DUcBIwRVwjtCC+NLcP+bfU84BhQ9q
X-Gm-Gg: Acq92OH32EACyXSijHT99Mb6yBqX49gkaY/iNitHGr1czyQG+/LsvQXSO+ZI1HL3xuh
	pSbvieTR5aL0JImSP2qllEgM3zVqOJ/cGiqOXOhOHIlK8IV7KWlmmAri0Zc/tphjh2EDXbVpWHH
	FPM9IbWt2Gpenu8UHY4OjLX/2GZoV8U5x96zAjnHNESliVmnPOeOzzfAK5rdeWJaBCt9SzZwqcQ
	qhx1ciIfKU8WlAqfMEW9XRlwkotbXv+7W/Z2gimW0DzeXXVryv+x4SRaV+IZSr9Tv/xs/mJB0ek
	lGkNCtBZIaVs0sDHtyh7VtTo92VvkisbB6v//Dk1/BKMFloA0Lk76mCz1gt7RRKAO3OALBib6a1
	Yqxd3D8sLAQPtatSJwfBOS84p59yhiBiQjKJwS+1Dk2B8Yec0y77YQP6nYOFeL1hNWp1sK6Kzya
	oaG9an8XVTaWmBI7Sv1WodIWPKdhs3kL81RnGbNsMz0VFSoHTZ+4BpaWgTiB7gFY/erWnWXpLFm
	vUunef/DpGw
X-Received: by 2002:a05:7301:a84:b0:303:f2fc:c483 with SMTP id 5a478bee46e88-30448f30872mr10369074eec.1.1779889336443;
        Wed, 27 May 2026 06:42:16 -0700 (PDT)
Received: from [192.168.1.18] (177-4-162-74.user3p.v-tal.net.br. [177.4.162.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-304ccdaa124sm311702eec.11.2026.05.27.06.42.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 06:42:16 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Date: Wed, 27 May 2026 10:41:49 -0300
Subject: [PATCH 2/2] ASoC: mediatek: mt8183: Check runtime resume during
 probe
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260527-asoc-mt8183-probe-cleanup-v1-2-4f4f5593c8d1@gmail.com>
References: <20260527-asoc-mt8183-probe-cleanup-v1-0-4f4f5593c8d1@gmail.com>
In-Reply-To: <20260527-asoc-mt8183-probe-cleanup-v1-0-4f4f5593c8d1@gmail.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Chen-Yu Tsai <wenst@chromium.org>, Shunli Wang <shunli.wang@mediatek.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 notify@kernel.org, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1813;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=InHqJ2PNAaclYU6DB/4BCMiDFr1sW1hmcux0hzUPPiE=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDFliX1YZNC5ZftYw1+3/caOwl8IefBtEl/fymm+WYIh0t
 VtzMUaso5SFQYyLQVZMkWV10iLLPV0PrtbHrfCAmcPKBDKEgYtTACaS/oiRYaI35zZxrdy1CmEm
 DqssLOu3sKvesLk43WZ6wGIT1fwCe4afjEW/dq9n3H5PYsbpJ0KVHS++HFYIfaoRmLz5eE3/+xk
 2/AA=
X-Developer-Key: i=cassiogabrielcontato@gmail.com; a=openpgp;
 fpr=AB62A239BC8AE0D57F5EA848D05D3F1A5AFFEE83
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_064217_378413_D2892764 
X-CRM114-Status: GOOD (  13.13  )
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

The MT8183 AFE probe uses pm_runtime_get_sync() before reading hardware
defaults into the regmap cache, but does not check whether runtime resume
failed. If regmap_reinit_cache() then fails, the temporary runtime PM
usage count is also not released.

Use pm_runtime_resume_and_get() so resume failures abort probe without
leaking a usage count, and release the temporary reference before
handling the regmap cache result.

Fixes: a94aec035a12 ("ASoC: mediatek: mt8183: add platform driver")
Cc: stable@vger.kernel.org
Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
---
 sound/soc/mediatek/mt8183/mt8183-afe-pcm.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c b/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
index 49a69728fd72..2634699534db 100644
--- a/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
+++ b/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
@@ -844,17 +844,21 @@ static int mt8183_afe_pcm_dev_probe(struct platform_device *pdev)
 
 	/* enable clock for regcache get default value from hw */
 	afe_priv->pm_runtime_bypass_reg_ctl = true;
-	pm_runtime_get_sync(dev);
-
-	ret = regmap_reinit_cache(afe->regmap, &mt8183_afe_regmap_config);
+	ret = pm_runtime_resume_and_get(dev);
 	if (ret) {
-		dev_err(dev, "regmap_reinit_cache fail, ret %d\n", ret);
+		afe_priv->pm_runtime_bypass_reg_ctl = false;
 		goto err_pm_disable;
 	}
 
+	ret = regmap_reinit_cache(afe->regmap, &mt8183_afe_regmap_config);
 	pm_runtime_put_sync(dev);
 	afe_priv->pm_runtime_bypass_reg_ctl = false;
 
+	if (ret) {
+		dev_err(dev, "regmap_reinit_cache fail, ret %d\n", ret);
+		goto err_pm_disable;
+	}
+
 	regcache_cache_only(afe->regmap, true);
 	regcache_mark_dirty(afe->regmap);
 

-- 
2.54.0


