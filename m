Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B93A7C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 05:12:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bQlCZdv6KNUR0PACOoD9lgtTeqoM7wiIPRUAOQBrgJY=; b=PS4zAgfV0/2Fr7xLuDTI8rf4Qg
	nk6r+iDkK2AVOf7h/oI17pK+XzIbkewzGQVncQ2qJ9r/slG++dNfbJIUCyaoPJYrOE88foP2DdpMq
	FzNbsGX2KJ35+vujXtCkvhBxVQQtYyGf9UyI8HxNK1crBLIggMcqngHNkAVOjhLQKpvUp5YazgsvD
	gl6nQz6U5FmVvoXOqIjW8dMWpX0pM9lDgH6NW82I5pvNhfT78TGU39QVTm666cOr08hzFqaKVA3kP
	ivUealRWyW3RgOl/lP0zoiqB4BZUlxTYVTdnbuYN8xBvDyp64NGpawSsQQrv9ZyeTIi7O78mJ8ri3
	jtB5hpGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1zkY-0000000GN4m-3tTc;
	Thu, 03 Sep 2026 05:12:34 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1zkW-0000000GN1i-1Mki
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 05:12:33 +0000
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-cc1c8d4a959so1605443a12.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 22:12:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788412351; x=1789017151; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bQlCZdv6KNUR0PACOoD9lgtTeqoM7wiIPRUAOQBrgJY=;
        b=ASxTis7lB8R/OLtfv0HrmSuXgg1BKyzQoO3sp/uqavczj3pIjnUFta56GsH57+NrrC
         /rdeCLLtyFb0IdsZNDhlG1X8wQJTpEPVLSsH246GNj069NomGCY3Z+V7A36ektwVai0U
         htfkbYDh9lBmEZOdveP4ZHw8j/99U/QDViWva3xDQ26OUvwU7aKDHAggvSHLPskAJov1
         ACOnUC2I7xHeqZ26WbwpKp65OaP2V6cWg1vFfQ0F8YF830QmVX0CkeKdawaD6W0V9PvF
         vbfQfLqzij0OqrtXVohPdwznESveiKMliJ8oaLP2NcmUexZIbg79OlP7ZXfRvh1BQtP9
         E31Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788412351; x=1789017151;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bQlCZdv6KNUR0PACOoD9lgtTeqoM7wiIPRUAOQBrgJY=;
        b=gxYv453zI34M9YId0OHR1yKoGX7paiuSXq4YAMroM5JqkdNMrOtRyVuI3a73NWOnbf
         TIvPkIZTGn26XCE3mSZLmubWG0UPYAC4sduNwo+lzsqMGBBlaWTRFA22DiZKsSYvkk4S
         jVL8xNVqxVQ6CaxGkeWXBh7WCwIqdaY8/uHiGWgSp/HhzW3pz429TU4Qm61TXQImjRHf
         bkPkKyS+rwmAMs132bVelnp/ijiyFoDdMLgE7m2Zvo533OkJ89KIYU5MqKcjcHxxF/0u
         Z2fRFAcTgAu86Gd5mn3biEqCrisC1zgPFAeE9JHNunnFEtQM7nrzgfZrVy5A/TXpbaxo
         46Gg==
X-Forwarded-Encrypted: i=1; AKwUvBxbb2r2gL1AEFDcfMuegf6r+pi6OIh6HmE/wrfJ7rmbsccosNhIbGZ5TNE4Naf/wL2fzfoXHUwfjbumcm25oc6V@lists.infradead.org
X-Gm-Message-State: AFuF++l6VWKwUCvpeQtHAuhcuxLXcOgLJGQcvIP4BMLiJSj+BjimNLZC
	qATejPcSVdUpue+h8hWahYoZQ4b6cAimIEm2A9gnnHHWh+j5IoyeZLbb
X-Gm-Gg: AYBFou3O5wvLHDsigWhKEc9GYZ6N4sGbLjJx3gVUVEiVbYB6B26wB/3mstasGmWwU+I
	3Azhf53LmoOzG08tpjcS9/hAf/VDRIa6/CWXOoUvisnau76Vjz+zkbpnETQ70upifrXzdcRsj4Z
	k0phQH1W1/9qMqO8MN7LMoX62virEqUG+KmhveWv3g1xMlhZDbwgHMaATnsBF2z0Nf5gwRRZVpt
	TQGADIQpDBYzV4VdgbRWue314iHpu6+dGRyhrZNW6jkzv7GMTZWgzJMWX4YXozmXaOCnSFoeiwb
	MAscXXpflGFTiuhA4TI0BOL95tFot27zmyDMOR6OtoIrtT00L+ZLtRTh/F8LFb79k6CxzlGHu+f
	1RaIumrYRf3k58auRjMb+TnbwJhvp+xDkeR0TQcXHElQO2T3cW+qtGdzCtQZT3r76En4br2S5Yg
	cQaOdcZgWZx4x8blZoQJDbPM+fTg1XeZXFdUmhxwsB1p4WkSZyMo+USuVvGWvALK1B/f/VG4uD/
	7W1JWVgLppIVVH29AIVY9cBxHR3ZrWG4ohtyX3597HsFPDjMNLkfiCuQF/+vkfblrA2pVExS3lK
	0csJ
X-Received: by 2002:a17:90b:5288:b0:398:9bd1:3214 with SMTP id 98e67ed59e1d1-39aee123ff5mr15589958a91.21.1788412351417;
        Wed, 02 Sep 2026 22:12:31 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b0875ce14sm3218092a91.13.2026.09.02.22.12.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 22:12:31 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Jiaxin Yu <jiaxin.yu@mediatek.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v4 5/8] ASoC: mediatek: mt8186: Fix MCK error handling
Date: Thu,  3 Sep 2026 12:11:47 +0700
Message-ID: <20260903051150.178057-6-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260903051150.178057-1-phucduc.bui@gmail.com>
References: <20260903051150.178057-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_221232_367654_CFEBAC1E 
X-CRM114-Status: GOOD (  11.71  )
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

The mt8186_mck_enable() function returns immediately when a clock
operation fails, leaving previously enabled clocks active.

Add error paths to disable previously enabled clocks before returning
the error.

Fixes: 55b423d5623c ("ASoC: mediatek: mt8186: support audio clock control in platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8186/mt8186-afe-clk.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/sound/soc/mediatek/mt8186/mt8186-afe-clk.c b/sound/soc/mediatek/mt8186/mt8186-afe-clk.c
index 77a0cbc8ee24..62b008b7caca 100644
--- a/sound/soc/mediatek/mt8186/mt8186-afe-clk.c
+++ b/sound/soc/mediatek/mt8186/mt8186-afe-clk.c
@@ -520,7 +520,7 @@ int mt8186_mck_enable(struct mtk_base_afe *afe, int mck_id, int rate)
 		if (ret) {
 			dev_err(afe->dev, "%s(), clk_prepare_enable %s fail %d\n",
 				__func__, aud_clks[m_sel_id], ret);
-			return ret;
+			goto ERR_ENABLE_MCLK;
 		}
 		ret = clk_set_parent(afe_priv->clk[m_sel_id],
 				     afe_priv->clk[apll_clk_id]);
@@ -528,7 +528,7 @@ int mt8186_mck_enable(struct mtk_base_afe *afe, int mck_id, int rate)
 			dev_err(afe->dev, "%s(), clk_set_parent %s-%s fail %d\n",
 				__func__, aud_clks[m_sel_id],
 				aud_clks[apll_clk_id], ret);
-			return ret;
+			goto ERR_SELECT_MCLK;
 		}
 	}
 
@@ -537,16 +537,25 @@ int mt8186_mck_enable(struct mtk_base_afe *afe, int mck_id, int rate)
 	if (ret) {
 		dev_err(afe->dev, "%s(), clk_prepare_enable %s fail %d\n",
 			__func__, aud_clks[div_clk_id], ret);
-		return ret;
+		goto ERR_ENABLE_MCLK_DIV;
 	}
 	ret = clk_set_rate(afe_priv->clk[div_clk_id], rate);
 	if (ret) {
 		dev_err(afe->dev, "%s(), clk_set_rate %s, rate %d, fail %d\n",
 			__func__, aud_clks[div_clk_id], rate, ret);
-		return ret;
+		goto ERR_SET_MCLK_RATE;
 	}
 
 	return 0;
+
+ERR_SET_MCLK_RATE:
+	clk_disable_unprepare(afe_priv->clk[div_clk_id]);
+ERR_ENABLE_MCLK_DIV:
+ERR_SELECT_MCLK:
+	if (m_sel_id >= 0)
+		clk_disable_unprepare(afe_priv->clk[m_sel_id]);
+ERR_ENABLE_MCLK:
+	return ret;
 }
 
 void mt8186_mck_disable(struct mtk_base_afe *afe, int mck_id)
-- 
2.43.0


