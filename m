Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 083ABC5B572
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Aug 2026 10:50:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SlrFw8orvz3TJpMVjqa7zWk7IHsR8vKJ7UcbrcCP+74=; b=V/f3HH2XJhqz21Syq97X8HQTm5
	cxAZ4XwatLJjpI7LlHEriqcJE/slf8AScUmjlpQ9DqiBD1T4LRDwnZbJ3fL7bt3h2T2BqavOAifXT
	HPa0XvZZ8NMSnK/nlTPeyTUQOT812o604GlGzSnyH3gnJpfA4g5lejhwRfIkS88p2SYftFNtIepFV
	gRGNNGnMTa9eY33Gk5u6imtKNsHRfSo7Ax9MtPxmebtnyLQWTkUSg11BK+DDFbRES+k4KSi6EqzS3
	LLxAduImfUMJH6DIt5vp2oWxMGvJ5yVvpv4pN9DkvDmkCyxtD0KZTg6uUW8ICI6zY9ahVHHwF9Ns3
	WWh/b42Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvuui-00000005xcg-1yA0;
	Mon, 17 Aug 2026 10:49:56 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvuug-00000005xbQ-1cC7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Aug 2026 10:49:55 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-38759bcd877so3699866a91.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Aug 2026 03:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786963793; x=1787568593; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SlrFw8orvz3TJpMVjqa7zWk7IHsR8vKJ7UcbrcCP+74=;
        b=b3ZzdApGQqEhQq02bkKKDdCSrkuEY96Z2+pbCbJicYx+3maTCL1GWgUFHvN2elDdVE
         xOOvsKB7mtcwFKJENG7w6bRmrltC2G68cRFGD6ESpkmGpI6Py1YezyfqYtek0i1KLTiO
         WL7EYG6wJJTu4F3paFwqwaVU4dW29UuBUrSfA2i3RrBLAAuAew1SOzofn26zXHSPzGHP
         MXOYsoHQzszfNTvLgHxyiqxfQAufKFp8kS/a4vLavIoJ1IXE4NMBj0joRvbvFJTSn6sH
         aoX8yxe2OcPXp7dlGAYDduAs1o4NQhk7UFOHecm9KjtYik9PullzPrCaUrjpD4eZEd9b
         Zmlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786963793; x=1787568593;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SlrFw8orvz3TJpMVjqa7zWk7IHsR8vKJ7UcbrcCP+74=;
        b=c7/s/L5GLgGALwh3d+tJVxU/In+VDajkDkrxqFm7FfI3Mft5D8whGDmz70baVmoOeo
         U5vTxAozmU+GVATO79lZRoaERa2PV4AgNkgwMvhoWWZ3sc55BoWgl8YRPY97YpnwOIVk
         BBrOrNuCtlJT7lHMz+68K9trCphZUnEuD8zjKy4re3LS7Gf3oL7Ad0RpRgavfZGk9ATr
         zDFj/uIJtBnRI8QtkPuHk/tyQcJ1G25CQPcuxR9Fc9dsgPAjmXGy2xstkthVW03OPFPI
         6kxe358dxBhQUsSJPkKr9grx01c2vdhXwawz903oppQPOoRv6x7QQHftqFAyl9upwdOJ
         Ya5A==
X-Forwarded-Encrypted: i=1; AHgh+RpbpAfZqHi1fQnIvJdpc+73Fm/j01jG5ASmq6ZsXPBmSs5+J+NteqSHT2td3AHOinXz02+PQYtDJQyZJ0Bdnlz8@lists.infradead.org
X-Gm-Message-State: AOJu0YzTf2KKPwdeSWlSN/pXcOikD7FnbpyuM8bjbAseZfyveuPSUfBo
	qoKHlXB81Uwoasca7D4nA1A4NeTlZvmIKOyutuXGGHQYKpcnRruS6cV96+xMuQ==
X-Gm-Gg: AR+sD12MEfqHSkL54bjjqZFF5CYfy0MQMFsX6iYtGBqqtgxzqj4pcfIoGfm7Zd4F1LW
	0Tq1+G4p6A1W3hAZpmb56cWoEATw5kq1zdaeAhnvOBLCufBispZr348xXVQKu0sUPJPSbi43djk
	FinyIPZf67B0LPU2qxtwgVgYaVRr3P49Eqp+xQ1KnFCYt8fqHNtm0ZBgA8jv1ZvYoAVVIVbbi+O
	pD6JvgPkUSMncINUaKG4uDa3x+GQrG1E07Pq/W0Esp/Qo5MT4k6jppBx3LMHLqsdwzoSIj5q11w
	hNa0STh4xqgMbfmBgx0dpQwyRvOQ2vHojJNBNAZEcIIls3HB0lcz0uldmGlZJXAqDt+x0qIitk/
	ezGIHyxvYUF5QsHZOMyOpPHKsqREkRlMzB5j5lN+H2DyW3qAcn60n8ett37Cnwhwh7q184ljeZU
	PrJaYOF2VMlgf97reIXTsm/nwU/bl0lgbNh2viNvySPKcBPe/ABjqWjoqBSm5shvG1mwxBLT/z/
	VCy4pAw9MoOxhlQZlyDuzbFMjLZZOX8BA3Jlcei2I7Qmyb12urw9jS32xUqbz4FFHS3R/H5B3FA
	U6BG
X-Received: by 2002:a17:90b:384f:b0:390:b41a:b92f with SMTP id 98e67ed59e1d1-3933e648702mr22943522a91.18.1786963793327;
        Mon, 17 Aug 2026 03:49:53 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3954d38bd51sm1885413a91.12.2026.08.17.03.49.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 03:49:52 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Rosen Penev <rosenp@gmail.com>,
	Daniel Golle <daniel@makrotopia.org>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 2/3] ASoC: mediatek: mt2701: Use dev_err_probe() for error handling
Date: Mon, 17 Aug 2026 17:49:28 +0700
Message-ID: <20260817104929.63152-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260817104929.63152-1-phucduc.bui@gmail.com>
References: <20260817104929.63152-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_034954_431640_5C59FDD9 
X-CRM114-Status: GOOD (  11.24  )
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

Replace dev_err() with dev_err_probe() to prevent log spam when probe
returns -EPROBE_DEFER.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 .../mediatek/mt2701/mt2701-afe-clock-ctrl.c   | 51 +++++++++----------
 1 file changed, 23 insertions(+), 28 deletions(-)

diff --git a/sound/soc/mediatek/mt2701/mt2701-afe-clock-ctrl.c b/sound/soc/mediatek/mt2701/mt2701-afe-clock-ctrl.c
index 18f0f27bd8c0..1cf66ca44a33 100644
--- a/sound/soc/mediatek/mt2701/mt2701-afe-clock-ctrl.c
+++ b/sound/soc/mediatek/mt2701/mt2701-afe-clock-ctrl.c
@@ -30,10 +30,9 @@ int mt2701_init_clock(struct mtk_base_afe *afe)
 
 	for (i = 0; i < MT2701_BASE_CLK_NUM; i++) {
 		afe_priv->base_ck[i] = devm_clk_get(afe->dev, base_clks[i]);
-		if (IS_ERR(afe_priv->base_ck[i])) {
-			dev_err(afe->dev, "failed to get %s\n", base_clks[i]);
-			return PTR_ERR(afe_priv->base_ck[i]);
-		}
+		if (IS_ERR(afe_priv->base_ck[i]))
+			return dev_err_probe(afe->dev, PTR_ERR(afe_priv->base_ck[i]),
+					     "failed to get %s\n", base_clks[i]);
 	}
 
 	i2s_num = min(afe_priv->soc->i2s_num, MT2701_BASE_CLK_NUM);
@@ -45,47 +44,43 @@ int mt2701_init_clock(struct mtk_base_afe *afe)
 
 		snprintf(name, sizeof(name), "i2s%d_src_sel", i);
 		i2s_path->sel_ck = devm_clk_get(afe->dev, name);
-		if (IS_ERR(i2s_path->sel_ck)) {
-			dev_err(afe->dev, "failed to get %s\n", name);
-			return PTR_ERR(i2s_path->sel_ck);
-		}
+		if (IS_ERR(i2s_path->sel_ck))
+			return dev_err_probe(afe->dev, PTR_ERR(i2s_path->sel_ck),
+					     "failed to get %s\n", name);
 
 		snprintf(name, sizeof(name), "i2s%d_src_div", i);
 		i2s_path->div_ck = devm_clk_get(afe->dev, name);
-		if (IS_ERR(i2s_path->div_ck)) {
-			dev_err(afe->dev, "failed to get %s\n", name);
-			return PTR_ERR(i2s_path->div_ck);
-		}
+		if (IS_ERR(i2s_path->div_ck))
+			return dev_err_probe(afe->dev, PTR_ERR(i2s_path->div_ck),
+					     "failed to get %s\n", name);
 
 		snprintf(name, sizeof(name), "i2s%d_mclk_en", i);
 		i2s_path->mclk_ck = devm_clk_get(afe->dev, name);
-		if (IS_ERR(i2s_path->mclk_ck)) {
-			dev_err(afe->dev, "failed to get %s\n", name);
-			return PTR_ERR(i2s_path->mclk_ck);
-		}
+		if (IS_ERR(i2s_path->mclk_ck))
+			return dev_err_probe(afe->dev, PTR_ERR(i2s_path->mclk_ck),
+				       "failed to get %s\n", name);
 
 		snprintf(name, sizeof(name), "i2so%d_hop_ck", i);
 		i2s_ck = devm_clk_get(afe->dev, name);
-		if (IS_ERR(i2s_ck)) {
-			dev_err(afe->dev, "failed to get %s\n", name);
-			return PTR_ERR(i2s_ck);
-		}
+		if (IS_ERR(i2s_ck))
+			return dev_err_probe(afe->dev, PTR_ERR(i2s_ck),
+					     "failed to get %s\n", name);
+
 		i2s_path->hop_ck[SNDRV_PCM_STREAM_PLAYBACK] = i2s_ck;
 
 		snprintf(name, sizeof(name), "i2si%d_hop_ck", i);
 		i2s_ck = devm_clk_get(afe->dev, name);
-		if (IS_ERR(i2s_ck)) {
-			dev_err(afe->dev, "failed to get %s\n", name);
-			return PTR_ERR(i2s_ck);
-		}
+		if (IS_ERR(i2s_ck))
+			return dev_err_probe(afe->dev, PTR_ERR(i2s_ck),
+					     "failed to get %s\n", name);
+
 		i2s_path->hop_ck[SNDRV_PCM_STREAM_CAPTURE] = i2s_ck;
 
 		snprintf(name, sizeof(name), "asrc%d_out_ck", i);
 		i2s_path->asrco_ck = devm_clk_get(afe->dev, name);
-		if (IS_ERR(i2s_path->asrco_ck)) {
-			dev_err(afe->dev, "failed to get %s\n", name);
-			return PTR_ERR(i2s_path->asrco_ck);
-		}
+		if (IS_ERR(i2s_path->asrco_ck))
+			return dev_err_probe(afe->dev, PTR_ERR(i2s_path->asrco_ck),
+					     "failed to get %s\n", name);
 	}
 
 	/* Some platforms may support BT path */
-- 
2.43.0


