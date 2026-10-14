Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 491F7CC6B2C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 11:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wf0tXzvtZuJlGGLGeU2mU+ZL2tYD6FeowFtUppIfdlw=; b=eP5EpoE0TIJHoFJ5uVo7bZWI/M
	LeHdEJTsbr6Lx5OFAgiEab+2psyVzaETfmxyz48TSj82BIGvQS1E7nbPHaszITETNACggm6gfqANd
	00htOu1asDnPB5OuD40UFCanVR7pqjWrqkOVc0lVQhzVN4YfG+8y9CkjZp7r/fn3qHCLrPvJ0gUun
	8ht4wCjyP1EuiAv40j8L1wMuyJJrexlML1/CdseBpSnG6H2Yu2KpZOjTpft7pRAimX6L2VubCNGMU
	qqWymH0wOFoXgKQCNec7oqGsfB7sR7V2uZ0AvlxXQ1vL/v5Sd2yks2WDv9dKuYn01ie7iOlxe2UtQ
	BT1Vc+yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGxBG-0000000FKdN-2Ksu;
	Wed, 14 Oct 2026 11:29:58 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGxAo-0000000FKMF-2su3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 11:29:44 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-3ab9268d90eso2015074a91.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Oct 2026 04:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791977370; x=1792582170; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wf0tXzvtZuJlGGLGeU2mU+ZL2tYD6FeowFtUppIfdlw=;
        b=gdY9u8xZh3aNZ82UVCmbDdxgnlu42nrrof8hLYTElfbpOytKs4Yq2lNiMeg6m8p7HR
         5Y9Y4WLMZhoFHiBwULo+Sel/3yDeO/png1z4mbLHGrWogGigQ3tkj//OQC9F3USYpbcc
         qaMT+Ws8awhFQaC5FIcSCaYNTDg3xPMVWm+uBtXmQm4TIWdWZJSjnkPLEi/ecO+XKoy7
         6KBTXcdXvvymRL2eqkYUFor+BDnDlX165mYHmeuWkxlxErhgmsq6xU+DV5sXRBQsYc7r
         N4a89vfnHfpRGNQIpfLu/iGD2ulncLnQuCOXPlKJ8uYzew7jp9njZWMWuFPbeVO/iCw4
         tJNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791977370; x=1792582170;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wf0tXzvtZuJlGGLGeU2mU+ZL2tYD6FeowFtUppIfdlw=;
        b=HHebYDAMMKrywLRMXzI8ldJSANMW7tDGRb1dmPIoLn3h4DLhw6h3OkZ18m/c0sbCp/
         Uy3GK5nOqc1IbOZn45Ilhh4iUv+UoJXESv1myr/lCufSQoKA0KZo0og30YgdrrbVnC8G
         q55eExb+Ik4v2tA2Ulmv3EUFga4wKlQWYbw7ZGHc0JskZOGRtuB7VdHES9SueKVmoZ5E
         8rlfF32hKZ9J2zUnzzj5yhR5IftsyRSf+Tbf7vgivm+AxkEU/caFlZgJiP3Qkh9uQkRO
         1VIMEWAXJLazB7YIDsnX5Ug/RjW361MCB+29+rRQMUUHMjVOhZMbYOeKpkDS+6YTCdKH
         BO5Q==
X-Forwarded-Encrypted: i=1; AKwUvBwI0jXlV/ZHbV6XBhlVh+zkHC/cQehLFe7Y4fVFHgp6p8DdYVSLPgxbUc9f6L1vNWgnkaCQ8V/Cy3mbimj+dTV4@lists.infradead.org
X-Gm-Message-State: AFq9FYISQPmNh54WBKiLeDfxjWYMLTrP1hIFvnIShboWVVDtBrgP7U6B
	x/+dHbLugzbFJPEIdq/AmZi8RQqProp1N6PINffxz2P5C+JLH5gyF8Zl
X-Gm-Gg: AYBFou0jI7Ia6GFkPVqsuoGgW2WBjQ//QvqNYOaDbCzRrk8CGoLJwWksdXqVHbq7w4F
	MuxKI60hmMAyYX5fEvGkoa5zY2DG8s+RV9+oUcOkQDXHa1EJxx3luK3UaWEIZcLvLAvy2aJGTXf
	CHF6bi3xcNjX/pHffqq05C0vBKvpgLWbovDT0lbcjfIfMTPBSQdaFJbAPWp8Ggefcs+xMOSlLpH
	raFOkhJJFbZU0W41eY09O7FT4qCELbeEcFEDWkdFnv8EcK7e7yif4/Ms+xzV0w2Ugyg/uBVpYbE
	b7nlgjPJng8Asg0jpduu4bdsGx2kF2pejtPoLGDyC3SO5icnf6m1pKHpWEkAwyBz+Iv5IBRC0j1
	kkYHvZu63gChCyCdY24cJ/5s9yADde+Xiwo638EQtlX9w3GoV3ItQ5hfsAcHPwuYIdv2k4diO+a
	mUNebQkmvM8JJYiNOLxj5N5i55Drvx9DG/pujrokjQLFY8OAJsVunasKZAUGJql8svn1sA0LZGV
	W5w6PaFuUpQxLWgmsWKzFEVqN35zK9r5dXQbnUvgCvMrEhDpHzF6JHdn7ouGe0EupHFTiIomJ0U
	bJOpB21X5tVsTQ==
X-Received: by 2002:a17:90a:d2c7:b0:3a8:13d6:f740 with SMTP id 98e67ed59e1d1-3ab3a99aa95mr13309248a91.22.1791977369735;
        Wed, 14 Oct 2026 04:29:29 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac61171feesm4077076a91.17.2026.10.14.04.29.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 04:29:28 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Trevor Wu <trevor.wu@mediatek.com>,
	Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	cassiogabrielcontato@gmail.com,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Haotian Zhang <vulab@iscas.ac.cn>,
	HariKrishna Sagala <hariconscious@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v3 13/16] ASoC: mediatek: mt8195: Fix ETDM startup error handling
Date: Wed, 14 Oct 2026 18:27:48 +0700
Message-ID: <20261014112752.683032-14-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261014112752.683032-1-phucduc.bui@gmail.com>
References: <20261014112752.683032-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_042937_656042_EB5EDC55 
X-CRM114-Status: GOOD (  15.48  )
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

Check and propagate errors when enabling the ETDM MCLK and clock
gates during startup.

If enabling a clock fails, disable the clocks that were already
enabled to keep the clock state balanced.

Fixes: 1de9a54acafb ("ASoC: mediatek: mt8195: support etdm in platform driver")
Reviewed-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8195/mt8195-dai-etdm.c | 50 ++++++++++++++++-----
 1 file changed, 40 insertions(+), 10 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c b/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
index fba51c552eec..1270fcac6b3f 100644
--- a/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
+++ b/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
@@ -1575,36 +1575,66 @@ static int mtk_dai_etdm_startup(struct snd_pcm_substream *substream,
 	int cg_id;
 	int mst_dai_id;
 	int slv_dai_id;
-	int i;
+	int i, ret;
 
 	if (is_cowork_mode(dai)) {
 		mst_dai_id = get_etdm_cowork_master_id(dai);
 		if (!mt8195_afe_etdm_is_valid(mst_dai_id))
 			return -EINVAL;
 
-		mtk_dai_etdm_enable_mclk(afe, mst_dai_id);
+		ret = mtk_dai_etdm_enable_mclk(afe, mst_dai_id);
+		if (ret)
+			return ret;
 		cg_id = mtk_dai_etdm_get_cg_id_by_dai_id(mst_dai_id);
-		if (cg_id >= 0)
-			mt8195_afe_enable_clk(afe, afe_priv->clk[cg_id]);
+		if (cg_id >= 0) {
+			ret = mt8195_afe_enable_clk(afe, afe_priv->clk[cg_id]);
+			if (ret)
+				goto err_disable_mclk;
+		}
 
 		mst_etdm_data = afe_priv->dai_priv[mst_dai_id];
 
 		for (i = 0; i < mst_etdm_data->cowork_slv_count; i++) {
 			slv_dai_id = mst_etdm_data->cowork_slv_id[i];
 			cg_id = mtk_dai_etdm_get_cg_id_by_dai_id(slv_dai_id);
-			if (cg_id >= 0)
-				mt8195_afe_enable_clk(afe,
-						      afe_priv->clk[cg_id]);
+			if (cg_id >= 0) {
+				ret = mt8195_afe_enable_clk(afe,
+							    afe_priv->clk[cg_id]);
+				if (ret)
+					goto err_disable_slv_clk;
+			}
 		}
 	} else {
-		mtk_dai_etdm_enable_mclk(afe, dai->id);
+		ret = mtk_dai_etdm_enable_mclk(afe, dai->id);
+		if (ret)
+			return ret;
 
 		cg_id = mtk_dai_etdm_get_cg_id_by_dai_id(dai->id);
-		if (cg_id >= 0)
-			mt8195_afe_enable_clk(afe, afe_priv->clk[cg_id]);
+		if (cg_id >= 0) {
+			ret = mt8195_afe_enable_clk(afe, afe_priv->clk[cg_id]);
+			if (ret)
+				goto err_disable_mclk;
+		}
 	}
 
 	return 0;
+
+err_disable_slv_clk:
+	while (--i >= 0) {
+		slv_dai_id = mst_etdm_data->cowork_slv_id[i];
+		cg_id = mtk_dai_etdm_get_cg_id_by_dai_id(slv_dai_id);
+		if (cg_id >= 0)
+			mt8195_afe_disable_clk(afe, afe_priv->clk[cg_id]);
+	}
+
+	cg_id = mtk_dai_etdm_get_cg_id_by_dai_id(mst_dai_id);
+	if (cg_id >= 0)
+		mt8195_afe_disable_clk(afe, afe_priv->clk[cg_id]);
+
+err_disable_mclk:
+	mtk_dai_etdm_disable_mclk(afe, is_cowork_mode(dai) ? mst_dai_id : dai->id);
+
+	return ret;
 }
 
 static void mtk_dai_etdm_shutdown(struct snd_pcm_substream *substream,
-- 
2.43.0


