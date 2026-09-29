Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E137CA5FA1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 06:13:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k60ENxxvKqkmqFX3C6HWvuRoh61RAwKi/dliyQ5+2AI=; b=Lwoh1ITFJHIfKFXPcMGZffLjcO
	snt+xrd4L1am3adOn05rBmQ2vuHstE7vv8lOxyYPkxofY2yzO//b7YVhoQdEB/gglwbo1d9D2M5bJ
	/rq/hEZDSvx8dcn2ssUGoa2CAMEMB7VMBhUnD3qgN3tTCLA+KT0XGftrlQb0c9FWv8NCzPiK2st0d
	8HUfm1535W4Uc+jb4B0ed/N/qoOFJ4ZN+2JP353P9oPH6/LmyzYlqWAHskXl1MjSz2rEDqT+JCHnd
	Wro1ueDpJcRaT+OldKek6gNglfPTsp+cVHlWqrLeUQVMgXummzaxN8uva1DyhinJvoq8GjV1E+kfu
	SpDY30Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBR5D-00000002QAR-2zdo;
	Tue, 29 Sep 2026 06:12:55 +0000
Received: from mail-pz2-x10.google.com ([2607:f8b0:4864:3b::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBR4y-00000002Q2q-10Du
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 06:12:41 +0000
Received: by mail-pz2-x10.google.com with SMTP id 41be03b00d2f7-cc4c08393b0so1593063a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 23:12:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790662359; x=1791267159; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k60ENxxvKqkmqFX3C6HWvuRoh61RAwKi/dliyQ5+2AI=;
        b=gUqKqqYROPWu4qLBDOY9b6XtboKaFFCl5uTqLZpRz7vWl30WpEOahjd5njWxwsiqFK
         DrfYrNfgjWWNFcJVPB6sKxcC0ZMAjXt3Lc0x6HH3/FoKJ15T0h9yHnUP5IEx/elhUpBZ
         mEU7956oYDDZI7GCHoNIgKscDPguR0YGMDA1qUOIMyaZ+x3kiDPTMqrawe8adQ3yWIuf
         G3VxAuFV8mQPuYFccaJWT6DkQ/WDmEVLVwRxBxgTSqa60uTRtlUChOpJCaMfuhbs3/uT
         6S3mO4io6FD6OpPycV2yu7HejQVkC6xJZ5GJsfmD1yiwGtbkUyPrDX3wAe4oQEhSpJM9
         vQxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790662359; x=1791267159;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=k60ENxxvKqkmqFX3C6HWvuRoh61RAwKi/dliyQ5+2AI=;
        b=g48hvqaHQ5xjszmMdA6Qu5nbWiAV5oTaMJOqZKrwh5nbkA5nP2Ix3BJYH5c6DKLkwv
         qAXVEE3NFP4m4zse9u0+8q/rzJOn4yRCV3Idy/qkxo2ZV0AZmlKVugpQLaPu9dX5B1BT
         q2/r2tUaIy2jSwORiuTXmXjlKJpg8TV4pqxqnzDDb2ibrtBELBDH5gZxqY2ElCT5Mm/2
         FFxhaoQgOeHIq664ZxYODOh8aPsCuEIQT/oUIfm+f6atTC4A/zbgS+HcAEIYU2LU8oX/
         enbrOGhjZUP0ll+m+Ak/0vnJVP3kr1ZLOmJaQNVI6W5PtXHYHdRP4JjV7s5RWuxLPMaF
         TCBQ==
X-Forwarded-Encrypted: i=1; AKwUvBw3pDTrA+ifOFXqNnc5JO7E0T1a/lbHdgr8ywDBhiuYCWt99WdMcJSpMHeqo94IJwMRjlyPar40h9HezCqxDRL/@lists.infradead.org
X-Gm-Message-State: AFq9FYLwHBUqaF/vAMElNCV8MUQ3HID6FTBRmqUnB4EDi3erY1GDz/vT
	qiK2oKbMJquNexybZfltrhDXS89J6nniv9RElu4iljNdZTcepoh9/966
X-Gm-Gg: AYBFou3uz7txdCiKHFgG2R07RiMhhc2qU5N4sPPUTWwpbT5kL4xjaldDIYqNbW1opDV
	Lz9rBfwBzvUo1dlqhIFqUM5nWDgqHb5rNTptbKZoxrh/oHtbgbKUqhLQvVyIqLmWXiQ4KWWEJK2
	CRCuhM433Vazz0iuAOBZKfk/lZNlTm9FJaM2tcF6HMZ/TNSPlkCTWV/r7q4ZlfLdxb781kmjCb5
	STOFTxl74Gn3Nzkbjj+FfSrOLM7+km/Cxn5CrjVagLYRfw3k7yAxFGhGpmWU9bHdYlILp/Bn4yx
	GeDK2yU+hWVpeWPTmrhOAHigC7nm/gDNYxpvFtiVmRAE8PWBWhRoTcmez5ncSPOjZv78rumk/tN
	l7t7YcDRJRbJTn5xrxYBmfS686vZe/GTi5/aconduo/Qu6R2jw4D360sDmkytrqViNAaw4WIYWO
	ctDu/2mHaFrnQ7vt45A2c4QBMV4tmu1JzG5klEZfyy2vuqv67k38rSIi7Y92qkdFC8eK98Tx/In
	bHcsoKKWKKztHKXyKRrHnRZ+hHXnJ97WVd7m7Ir7Y9P4uPu0Rt75+4rJG+3ZGlkvBPvm7ivd/J+
	RL9mpWYndSB3wQ==
X-Received: by 2002:a17:90b:2b45:b0:3a0:8a03:2a2d with SMTP id 98e67ed59e1d1-3a098d35687mr13123807a91.29.1790662359209;
        Mon, 28 Sep 2026 23:12:39 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a498726d63sm3280965a91.17.2026.09.28.23.12.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 23:12:38 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Darren Ye <darren.ye@mediatek.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	cassiogabrielcontato@gmail.com,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Cyril Chao <Cyril.Chao@mediatek.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 09/10] ASoC: mediatek: mt8196: propagate I2S clock errors
Date: Tue, 29 Sep 2026 13:11:20 +0700
Message-ID: <20260929061121.124001-10-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260929061121.124001-1-phucduc.bui@gmail.com>
References: <20260929061121.124001-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_231240_273254_CF491C82 
X-CRM114-Status: GOOD (  14.25  )
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

Propagate errors from APLL and MCK clock operations in the DAPM event
callbacks instead of always returning success.

Fixes: 65a195132669 ("ASoC: mediatek: mt8196: support I2S in platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8196/mt8196-dai-i2s.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/sound/soc/mediatek/mt8196/mt8196-dai-i2s.c b/sound/soc/mediatek/mt8196/mt8196-dai-i2s.c
index ef5cde0ba829..adebf75629be 100644
--- a/sound/soc/mediatek/mt8196/mt8196-dai-i2s.c
+++ b/sound/soc/mediatek/mt8196/mt8196-dai-i2s.c
@@ -985,27 +985,30 @@ static int mtk_apll_event(struct snd_soc_dapm_widget *w,
 {
 	struct snd_soc_component *cmpnt = snd_soc_dapm_to_component(w->dapm);
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
+	int ret;
 
 	dev_dbg(cmpnt->dev, "name %s, event 0x%x\n", w->name, event);
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
 		if (strcmp(w->name, APLL1_W_NAME) == 0)
-			mt8196_apll1_enable(afe);
+			ret = mt8196_apll1_enable(afe);
 		else
-			mt8196_apll2_enable(afe);
+			ret = mt8196_apll2_enable(afe);
 		break;
 	case SND_SOC_DAPM_POST_PMD:
 		if (strcmp(w->name, APLL1_W_NAME) == 0)
 			mt8196_apll1_disable(afe);
 		else
 			mt8196_apll2_disable(afe);
+		ret = 0;
 		break;
 	default:
+		ret = 0;
 		break;
 	}
 
-	return 0;
+	return ret;
 }
 
 static int mtk_mclk_en_event(struct snd_soc_dapm_widget *w,
@@ -1015,6 +1018,7 @@ static int mtk_mclk_en_event(struct snd_soc_dapm_widget *w,
 	struct snd_soc_component *cmpnt = snd_soc_dapm_to_component(w->dapm);
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
 	struct mtk_afe_i2s_priv *i2s_priv;
+	int ret;
 
 	dev_dbg(cmpnt->dev, "name %s, event 0x%x\n", w->name, event);
 
@@ -1025,17 +1029,18 @@ static int mtk_mclk_en_event(struct snd_soc_dapm_widget *w,
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
-		mt8196_mck_enable(afe, i2s_priv->mclk_id, i2s_priv->mclk_rate);
+		ret = mt8196_mck_enable(afe, i2s_priv->mclk_id, i2s_priv->mclk_rate);
 		break;
 	case SND_SOC_DAPM_POST_PMD:
 		i2s_priv->mclk_rate = 0;
-		mt8196_mck_disable(afe, i2s_priv->mclk_id);
+		ret = mt8196_mck_disable(afe, i2s_priv->mclk_id);
 		break;
 	default:
+		ret = 0;
 		break;
 	}
 
-	return 0;
+	return ret;
 }
 
 static const struct snd_soc_dapm_widget mtk_dai_i2s_widgets[] = {
-- 
2.43.0


