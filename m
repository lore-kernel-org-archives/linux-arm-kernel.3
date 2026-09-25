Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8175AC98306
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 04:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pMNn1l9smvshEEs2IzaD7z/sVzU8/2Okzf/aYOfP2ok=; b=FxgMDvkwCI/VLjImBKURZEOPPA
	JCrpxhlyDgPJ+SHptrI90eTdhOjKweWi5RU2RFbAm6+08tlXotO8eQjnQVgwEfC+pdtpaCobP46vE
	dgY15lSGAArgE8FzMw4o/qvmLKcrN3Dp9iMkNe20RW/RBTJon+8m/mqNjB1D+CtrRsXFl0G2JpCsS
	rHYCzzE1d9zZZp/l0oXF2Nk1w/wrr+xDJ1mcUa17jDIq3YyBX/jDHoQWvjmr9Q+uMOVrC0HHvOUkg
	3AnO4saEgW1wfhao/v7Ai1NxxDx9s+w8bILhW+k9XyDXaLDC3rqoi0w6XJ9S2jVHFKVMd7K3hCW/2
	nHj7dgKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9xtx-0000000CeCd-44Mk;
	Fri, 25 Sep 2026 04:51:13 +0000
Received: from mail-pj2-x11.google.com ([2607:f8b0:4864:39::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9xtY-0000000CdrM-1tE7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 04:50:49 +0000
Received: by mail-pj2-x11.google.com with SMTP id 98e67ed59e1d1-398cb5615deso431536a91.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 21:50:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790311848; x=1790916648; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pMNn1l9smvshEEs2IzaD7z/sVzU8/2Okzf/aYOfP2ok=;
        b=r45m2IFF3CT622db7E/cD1zvb3Xh8xG640sZT+4OBHS8cjgGi6Q5f+0O2p6KiwWAFX
         J0Ymz/eK+cpf62B8molZsmg0pKfySl/1vrBsanE1dDcsLmEillxHXf5oHdMAbGSkAiDN
         OoKYfNTDPlA/Y4/ZZEs4ioWnIBv1FWjBW93dG+Zu/gXfMGCwyypwKUnyh/1bMXiKqhY1
         mW6TLONqr/weL9E+0qDK96477+MoznLXKqqjDlkJjwdGe5Q8VlzdobzyoNQ7yA/dyeTt
         dsPpIbIY6JQ6FAC9rZU65aDvOhjZ0NkeZGSEvBeaoZG2GMYYg3Wp2MgH4Y1EWk09Mybk
         fBXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790311848; x=1790916648;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pMNn1l9smvshEEs2IzaD7z/sVzU8/2Okzf/aYOfP2ok=;
        b=DGMIujJjJXRy0fUdw5uHOkjI7tMolKkYF3SVSKdkkLzXPh7Ra7Fc6k6mIwOOeMEKcz
         PFLLovO5rilPsTzGeyOPSMyeNdAVjfca3Uvot1fIwR4GaYdXraW+uj3P2/oKsacqeIhR
         YeLKKKws/oWY05GnbaOLId4TdVq7WjfqeqdUTbe/sg0y2mtQtbfmj+vQEqNhTHYMBNUg
         GHyw90Crh/hN8cdEW0QGxZdXzxl8t1oUoiSkC1qcHtZgDcuQVslFWkxmtiNAF9m3PMsm
         nrg9szrS4rdR3ReuLQ4S9ZuJgn6QgaOwf2b6ALY+OfdezIILSIKJhULdcS1PP2Y/+KMv
         2MbA==
X-Forwarded-Encrypted: i=1; AKwUvBxfeCn+rub92jvufnoEJ0UV68nM0XJW8yoGm0UmRst9wFnDVXY9KJJwvWDBFyYGUVPW1wkHd2FuiXxxmHYAAzKK@lists.infradead.org
X-Gm-Message-State: AFuF++m7XJ0eB/BJkwIp63U77jHDfpxjjiB2JAmLxZSebIdaZVl0Yr5P
	2mhy0OQyIJEu7H/x40JaubSKeiWX+oblz8gJXA+MDx/iujj+yBbtDV4S
X-Gm-Gg: AYBFou03G//qlhOAUbfod0k9CkG37H9UooywXTMLbRAT0aAOV2BM4AjWGa0adttM+pV
	Hl8u06lyfq7inm3Tk0wBs/asL0BUWaR/83QL9oYMgtiQfQlaUSvHofWFPD1b91a4zacQQcWPEB8
	Jhfll4hDkWCa+HAncmG5P4yM/Pw8a1SGWRt1JRnZsVYZpqhqqr9dR0vM4eeVPkMcPujNHEULSdU
	dYl77o2ljWaUhqkMORGSFTtGhs/3GC45soH8goadvf/w0n2RZ2B6/k1kC35x67xexuOifivGZwr
	9ugVByCQQ+ow9ZxqyXh4cjSXGVg8D0cOyLOZehjy2oCZ7pxSBMpHP6LWKq1AtVnLmCHuMRkNzYW
	xPhlxnfOLYiPZlIgQTtDGKS5ATLcyTL5ApC+5eHdnY+iYRjOJS4kg5IXqfVLcVR1PDpEbSOGmr0
	nyW9WIuUOa8ApJ+d8f/e1vWc6CHuvdy6v5NwjLM9wlEigq2of4WU47YJkb3N9yIZutCRKoVe4oU
	abjiO/BnaGwuXLgj5De2qZglQwvfQMsxvY5JgzRthfZK5u4XEapCwfGWP2EU/20Bo9POwSvlkOM
	TJgFE1pnv9rwSQ==
X-Received: by 2002:a17:90b:3dc6:b0:39e:24ab:9fb0 with SMTP id 98e67ed59e1d1-3a098d43b17mr4135466a91.6.1790311847757;
        Thu, 24 Sep 2026 21:50:47 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0976cacbesm8151528a91.13.2026.09.24.21.50.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 21:50:47 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Trevor Wu <trevor.wu@mediatek.com>
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
Subject: [PATCH 12/14] ASoC: mediatek: mt8195: Fix HDMI TX startup error handling
Date: Fri, 25 Sep 2026 11:49:06 +0700
Message-ID: <20260925044908.450775-13-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260925044908.450775-1-phucduc.bui@gmail.com>
References: <20260925044908.450775-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_215048_507116_071AC545 
X-CRM114-Status: GOOD (  13.57  )
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


