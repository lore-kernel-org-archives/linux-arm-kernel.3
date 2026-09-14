Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97130C88E64
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 07:29:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B5j422sp7IgKzOpG0gt3MXA3l3kQYxqi7If+zAVtiI8=; b=AQo7smVZO4kBlzdoD4lmF4YShl
	gSr7R1AkUMQ+g8sbw1EoLqh+5rk51sZrWj/H5DGe9jUKxbu96gQogA2VivI0ZxoaJ8/FXrcMv6Y4l
	v1OTg4RpBJqpvolaBehRbGvMitOZE+Dl1p6yLuWGL7d8IG4P0tsJOeYc1KoNRPomm5xbl35eUfIwg
	IHiJA3ESp2qzIoBJqQ5xqB+jO1TzbXsCYyBJoXb5zFO1JVbb0/rtdRKx4BpIOYu9v9X9E67+5uDov
	LcyQTrPDTIvlyJcsfnwR0NnEDU2gW1zFLoE6u9eg9oxCFaufR0JhQ1f0jP8qKVLzjGYUcGvT1sfuI
	6C9z1rSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6185-00000002YT6-1m7g;
	Mon, 14 Sep 2026 07:29:29 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x617w-00000002YKV-2s7L
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 07:29:24 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2dd4b3c752fso28576885ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 00:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789370960; x=1789975760; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B5j422sp7IgKzOpG0gt3MXA3l3kQYxqi7If+zAVtiI8=;
        b=ADcm1kuYFPdR0BYlDcmrZHm7j9poCGUY8K+7gTt8zSHM02YnIqYj9KCjCDuusnsU2l
         ee9NKF5D8nSEDn6zlXvdwtrkZ4aWWWDg27ZUse4s8+gEwIKXXykVSpImz1DnJGTIKCr6
         Uu7+GoGibqMu8iQ3WZdZ8qVwTs24jgmf6o0wI8oRx7bIa99vkwWaeiIAC3XIZm2bcyfI
         Ff2lRxu3u6hwc0bg357tl8xzoDVFWxpgVBFNLfrYzGd7U5f8NELEKI4tiLuzqjHRsJDP
         eU4iWES3U8PD8elWhi2YUU+xWTQk/8JTiAFFGLbdm9j4JyGmmEZJORbXZa+f8LAleWZw
         Hh3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789370960; x=1789975760;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=B5j422sp7IgKzOpG0gt3MXA3l3kQYxqi7If+zAVtiI8=;
        b=Aq7iq5yTida1YLqb/nV+xQ6QyLRNUheUEh4s3B3kKThwxfUlQsWOT/vUmKShFbivwW
         pG+ftzTR+IsxPucU1x+X3b62yfRF4dARRh6c3Qvlt7QWBNzF0kXufmfdlsucBbeiNYXg
         xe3xhms/Z+rqZCunlyA4eBkG4QTF8FHJ+8KC8CLxKO4uosQV/biOtX+fHQUKcyb8RLZm
         kRzVTGT0mxYZIMkjKGkvnMwVsDHHcWd5FqorGmJyZLyU+xPLXwHojkizujVT6HfNhytp
         PHKViSG2dNwjn+A3jp8+Q7Y4EbV/GoOIlfnOlPZw40DNjzRaiA3DqDXsV+7XAGa08DXI
         qHfQ==
X-Forwarded-Encrypted: i=1; AKwUvByvKiBxifcPNgnrc8sWCG6AyWBjLBKobqc94WRddadsfrKonuNg8iokqMBcNwN7Fhs3G6FfJfSxXjuI8ZM9jMRu@lists.infradead.org
X-Gm-Message-State: AFuF++lBbmxSVdY5ZctUk5NjETwCt+5RoCpoeQ4cXHlDsep7IvG77qu2
	vjck2hBe7wN0MRiZTO/H3wiGRb19U0vnArP9YSeSCTwhWAwhPvkZzUzI
X-Gm-Gg: AYBFou3UG0uaKDW3LKFIDTl+Obpn1VqE7kCokv0oNMUV5tifSBxvUqlCf10xN38bYiH
	l3uMqCMo9X17TCzf8Zd+JENCA6+4oSm1DM6/pKFXrddqp1Ds0u5OOO8KaoihePt7yCEcTrQpAmr
	VxFnBrXkOK5kW5VWpXfBbYmJM2cZ0QZYl2+6FN3PyE0Q2F5+tWRsjqs09w9K/WQS4rRRqWOvG26
	sgS9+PQCEWY1Z0wgTA+WE1Zx+93wi662rjBDtUMgyAi7gDnXq/7mtCylnkW4zn+0FBCWVDGyKJj
	bCxXJv64qfLURtaAdm2tz3QDBIn5NI9U5utAdj6OXN+aqK180Hljf97ou85PmagSWgh9zgxTJl8
	qTvGsapmo4gmT4RN1gyLMdivYOzGeJ5G17meifhkgN1d6zygnzkw2ATtSSFGo7pmvmKfQzRQnbA
	5TofqEeVRqSoU07jrq460BsEFDkz4GwDt54x7IwoJ9uNAtIUnzSp+KLam2ibmJCWie89S3UN99W
	l+tA/ambvaX67owmA/zUTzIKxpQJwa87SofcMK01BiInPCNLrdJQu+9YUsVIERXd6+yCuwnDLCs
	JwElOBz6bmhs/tQ=
X-Received: by 2002:a17:90b:4984:b0:39d:f61d:7ca6 with SMTP id 98e67ed59e1d1-39df61d7d1bmr9021a91.15.1789370959820;
        Mon, 14 Sep 2026 00:29:19 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d957131f9sm19598245a91.12.2026.09.14.00.29.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:29:19 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Cyril Chao <Cyril.Chao@mediatek.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Dan Carpenter <error27@gmail.com>,
	cassiogabrielcontato@gmail.com,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 05/13] ASoC: mediatek: mt8189: Propagate reg_rw clock errors
Date: Mon, 14 Sep 2026 14:28:34 +0700
Message-ID: <20260914072842.24420-6-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260914072842.24420-1-phucduc.bui@gmail.com>
References: <20260914072842.24420-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_002922_306297_A6DDE167 
X-CRM114-Status: GOOD (  12.96  )
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

mt8189_afe_enable_reg_rw_clk() currently ignores errors from clock
enable and parent operations.

Propagate these errors and clean up the clocks before returning the
error.

Fixes: dc637ffeed6c ("ASoC: mediatek: mt8189: support audio clock control")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v2:
 - Update the names of the goto labels.

 sound/soc/mediatek/mt8189/mt8189-afe-clk.c | 31 +++++++++++++++++-----
 1 file changed, 25 insertions(+), 6 deletions(-)

diff --git a/sound/soc/mediatek/mt8189/mt8189-afe-clk.c b/sound/soc/mediatek/mt8189/mt8189-afe-clk.c
index 69aa3715c19e..173ee0709b16 100644
--- a/sound/soc/mediatek/mt8189/mt8189-afe-clk.c
+++ b/sound/soc/mediatek/mt8189/mt8189-afe-clk.c
@@ -700,17 +700,36 @@ int mt8189_mck_disable(struct mtk_base_afe *afe, int mck_id)
 int mt8189_afe_enable_reg_rw_clk(struct mtk_base_afe *afe)
 {
 	struct mt8189_afe_private *afe_priv = afe->platform_priv;
+	int ret;
 
 	/* bus clock for AFE internal access, like AFE SRAM */
-	mt8189_afe_enable_clk(afe, afe_priv->clk[MT8189_CLK_TOP_MUX_AUDIOINTBUS]);
-	mt8189_afe_set_clk_parent(afe, afe_priv->clk[MT8189_CLK_TOP_MUX_AUDIOINTBUS],
-				  afe_priv->clk[MT8189_CLK_TOP_CLK26M]);
+	ret = mt8189_afe_enable_clk(afe, afe_priv->clk[MT8189_CLK_TOP_MUX_AUDIOINTBUS]);
+	if (ret)
+		return ret;
+
+	ret = mt8189_afe_set_clk_parent(afe, afe_priv->clk[MT8189_CLK_TOP_MUX_AUDIOINTBUS],
+					afe_priv->clk[MT8189_CLK_TOP_CLK26M]);
+	if (ret)
+		goto err_disable_audiointbus_clk;
+
 	/* enable audio clock source */
-	mt8189_afe_enable_clk(afe, afe_priv->clk[MT8189_CLK_TOP_MUX_AUDIO_H]);
-	mt8189_afe_set_clk_parent(afe, afe_priv->clk[MT8189_CLK_TOP_MUX_AUDIO_H],
-				  afe_priv->clk[MT8189_CLK_TOP_CLK26M]);
+	ret = mt8189_afe_enable_clk(afe, afe_priv->clk[MT8189_CLK_TOP_MUX_AUDIO_H]);
+	if (ret)
+		goto err_disable_audiointbus_clk;
+
+	ret = mt8189_afe_set_clk_parent(afe, afe_priv->clk[MT8189_CLK_TOP_MUX_AUDIO_H],
+					afe_priv->clk[MT8189_CLK_TOP_CLK26M]);
+	if (ret)
+		goto err_disable_audio_h_clk;
 
 	return 0;
+
+err_disable_audio_h_clk:
+	mt8189_afe_disable_clk(afe, afe_priv->clk[MT8189_CLK_TOP_MUX_AUDIO_H]);
+err_disable_audiointbus_clk:
+	mt8189_afe_disable_clk(afe, afe_priv->clk[MT8189_CLK_TOP_MUX_AUDIOINTBUS]);
+
+	return ret;
 }
 
 int mt8189_afe_disable_reg_rw_clk(struct mtk_base_afe *afe)
-- 
2.43.0


