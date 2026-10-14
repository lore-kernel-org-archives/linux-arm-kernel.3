Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3460CC6B2D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 11:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pMNn1l9smvshEEs2IzaD7z/sVzU8/2Okzf/aYOfP2ok=; b=JzMGCRtOS0fQTzFaejEDh4BjNy
	qCYDfAP1A5braHPMYOb3XSqUBkSGX81dWcpuKI6RZ9dP2qB5VfCB50tKFejnxjp/5xZaU9kVmrbm9
	gSyySk2tglzZcg60LPhCexOC+kpwQiRsv7xbLCfSsBSSJocJCEQjrkTXEdbs9ZY8nfP2Y10Khl0p7
	w/dFkUJyzbk+CK5dehz8TwseVlFpx1FW+af7rs1bJJrcE4+pUSmx5rI6JZ74V+KsedjH7r/M0+nIm
	fEzW3U+naktR7LChnWwEpU+v9H8Tizigsuop8hK1IUrUwqbHNig7heWlwpbg2/YYMXv8fyyskzIuv
	EJq8ouMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGxBE-0000000FKa2-0vNq;
	Wed, 14 Oct 2026 11:29:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGxAz-0000000FKP1-1sWC
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 14 Oct 2026 11:29:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=pMNn1l9smvshEEs2IzaD7z/sVzU8/2Okzf/aYOfP2ok=; b=JFHzyMyFcolUfLZrz2UmD+pZ2O
	32h/Wyjt1+ZyePRA2tsOHDidkorT+qUZdiZunc/baAE8EZlHE6xN5uKasuyjKbrA5Xj5JEHY3smTy
	UXuP2qC9vHY5g1RMer6ZdZUKTgfp9Ui10fZiH0jrSuhaFNI/gyv1m97W2eDkbZ2c1Ijxno/uTScR+
	vyAVlwlKtFIBx7vg5FwbHHs8hpuAxRJtrn4eXSasoX5qFC3FOXCAsXUTxZ7wil9PUlz8+hFZexZz8
	dYy8sLOfHh52acShVonthwtXNgcTAq3p3vgMwp100yWeRxJJTorl0+0he9kcdu/oeeyUwHykb7lcJ
	pOHwdZXg==;
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xGxAv-0000000Ggoi-05uR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 11:29:40 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-cd5d2dafeccso1571469a12.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Oct 2026 04:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791977375; x=1792582175; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pMNn1l9smvshEEs2IzaD7z/sVzU8/2Okzf/aYOfP2ok=;
        b=pqQ1lAbi6hWAmTNliudOVWeleheo9rbjf0Xu1YMl4crcjdeC8wDZ6PQ9PyCOSpexcx
         oa8fwlTQMwlbOunvlg7bLm+83bXiN3pemAOgi4VbovIXqQbRPg9rJ+eZ9VJTVe3ZqXB2
         BlJzugIVaYWBuNg2RDPoQAdPGEDmGA2Cq42EJYEo5kmAENxrH7zdvUnNvcmOvb6X04Wa
         i5HCvfIT3ZIkVlwAbImdAqedH62QCUChdZffLjVYAXGR2BCOFapT26sNsELOm5fVHhvl
         rxCQOEq2qsctxSztfX+3jT4W9CVYo9kVod0B3KGKgqPsMYnDENS05eOGAZhLQ77Sdpch
         mV3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791977375; x=1792582175;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pMNn1l9smvshEEs2IzaD7z/sVzU8/2Okzf/aYOfP2ok=;
        b=VJzuNJ3sAKy4JO5Ox6L9mvn2sqsMfAbRfJo0jHTYgcwHkbF6Olt7EpTzOlNERzVyEe
         dCFAKluw4OQ4XyK9bK8dVQ/IgmiyIi1Kdz6c5Y1u32hJhSjyDiG22wb5rfyudJI11K26
         NEq11wna54jqjER4PfAjGIvW1Do6dM8jxcaWLaO8AUKerzwU93bZV/1xI8Hzp0T8fl8Q
         l95ki9D65momyVzWWYtIygNi5ruwACvtQ9yseOeZ4SgdazrkSb0F32/i8rNLTSL7XMnM
         WY+q8xAakEjRodN9JsNBfraLWRKx90a/QxUTvD47BdVjV9a2Y4NfKZQlGDEXAXpeXsKz
         aAsw==
X-Forwarded-Encrypted: i=1; AKwUvBwTTfFOiVC+twHH2DOdrQFa1lgCf2TSJqLr6g/GEACeEzVx3Q7a7lja9UP854Wq7tpRAhtEeJmLpHlVoptybTgE@lists.infradead.org
X-Gm-Message-State: AFq9FYKb/qYYT0oMWJkve1rQSvVtNnpWhY4ZdNtFisfbbkMuCwynaanD
	CR641ddRd8uB8obtSFYQpVUGl92p3B1acJExaMzPBMcERpdTnhINQBxW
X-Gm-Gg: AYBFou2KV1z99vFDjT/DRtgS5gbsa5wZ4R0UxSaY78q4ccVozmi96CZJPC6NE5RRETO
	hxpb4z2ShGWWO0cHawgG0eFTIH6HIOVDckibD7jF5NmEhns2j7FLflcUNd6LGvMMvmkr4bPusys
	VhdfV2P6v3KmkWfkEYeKbpSBCYUpVV6qokh48uzjmYs3ZkybT7hU5iCKN2JYDvN+XGqPhDHmv9F
	mzoxwwQbgCxHL7zr1VQiXRgn3PUt1d0x1dfA1DkXX9oh9KG/lasP/fsgRzdxtOz3VneSUCJjMA7
	2Wra4PM07r1X16YDYLsU0QTPvMqvZ5DQMJlwxSh59HTThWkSpxF8dggx8dzfvAxpl1Ih2bXwyfg
	umZDe6Zgp1NirYsaJL9GZevVZeiHt/Dd7t327NZwGjBLmXHget7lIdt3wGv+uRNUnqF7Yj5wYY0
	tA8+A6UgV5UJfQEmruggAgBWl0WGhJ0LZV4bUQY0tWOr7QT1dPOQ5klpDaa0GAU09WCjerQrKSX
	9pZPUzLb/agsUlhbVkMGdl8z8L5CFnlVIt1hiLiqbPvPIptgz9nnVg5sDQXr4qa2zDURHkXBsBZ
	cWSmaE0HNgPcKQ==
X-Received: by 2002:a17:90a:4ca2:b0:3ab:7031:d962 with SMTP id 98e67ed59e1d1-3ab70412990mr8076731a91.41.1791977375198;
        Wed, 14 Oct 2026 04:29:35 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac61171feesm4077076a91.17.2026.10.14.04.29.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 04:29:34 -0700 (PDT)
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
Subject: [PATCH v3 14/16] ASoC: mediatek: mt8195: Fix HDMI TX startup error handling
Date: Wed, 14 Oct 2026 18:27:49 +0700
Message-ID: <20261014112752.683032-15-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261014112752.683032-1-phucduc.bui@gmail.com>
References: <20261014112752.683032-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_122937_329347_A7684FF1 
X-CRM114-Status: GOOD (  14.44  )
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

Check and propagate errors when enabling the clock gate and MCLK
during HDMI TX/DP TX startup.

If MCLK enabling fails, disable the clock gate that was already
enabled before returning the error.

Fixes: 1de9a54acafb ("ASoC: mediatek: mt8195: support etdm in platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8195/mt8195-dai-etdm.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c b/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
index 1270fcac6b3f..11317cdd14ab 100644
--- a/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
+++ b/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
@@ -2321,13 +2321,25 @@ static int mtk_dai_hdmitx_dptx_startup(struct snd_pcm_substream *substream,
 	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
 	struct mt8195_afe_private *afe_priv = afe->platform_priv;
 	int cg_id = mtk_dai_etdm_get_cg_id_by_dai_id(dai->id);
+	int ret;
 
-	if (cg_id >= 0)
-		mt8195_afe_enable_clk(afe, afe_priv->clk[cg_id]);
+	if (cg_id >= 0) {
+		ret = mt8195_afe_enable_clk(afe, afe_priv->clk[cg_id]);
+		if (ret)
+			return ret;
+	}
 
-	mtk_dai_etdm_enable_mclk(afe, dai->id);
+	ret = mtk_dai_etdm_enable_mclk(afe, dai->id);
+	if (ret)
+		goto err_disable_cg_clk;
 
 	return 0;
+
+err_disable_cg_clk:
+	if (cg_id >= 0)
+		mt8195_afe_disable_clk(afe, afe_priv->clk[cg_id]);
+
+	return ret;
 }
 
 static void mtk_dai_hdmitx_dptx_shutdown(struct snd_pcm_substream *substream,
-- 
2.43.0


