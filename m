Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6BABC9830D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 04:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cC2JxcNZX/PdxSljMsgobXdfIwmK8OmUL2fGB78jIko=; b=CYxdfyGfMMt/RKD82YihmylOmj
	4MV396sT7kwHnDE7QTrU9g+ZwkPutXVUUZ3UNxaVF8VzQ+nV4pp5sIhIg2kojIekXrLsJHsrdS6bw
	2IK1/onljRN4O99ZVMxPpoANFhd94kzzXVfkdn2x/lhs+tCnLMBDze7HGdcq70/GCezfZ1MeIRh5D
	Oq83eIG1h1FU6MLrrPeMjGu578CCPoqtLZaSuAc8WNlV04AvfvWlQDeySchNSm7MvHIZdcDmMLnu0
	5xiA+3Oagjn+dPQwaAQse/m1yHvTgaqwoxtj2u8CGD3VGBkk/KuH9VhHLpnBUvAGgb6jqM1c6MtHu
	dbPJR6kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9xtx-0000000CeC4-32vl;
	Fri, 25 Sep 2026 04:51:13 +0000
Received: from mail-pj2-x0d.google.com ([2607:f8b0:4864:39::d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9xtU-0000000CdoE-0WtI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 04:50:45 +0000
Received: by mail-pj2-x0d.google.com with SMTP id 98e67ed59e1d1-3a0af40d240so292518a91.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 21:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790311843; x=1790916643; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cC2JxcNZX/PdxSljMsgobXdfIwmK8OmUL2fGB78jIko=;
        b=LRi1482o+P+yKBhKWLUn6BJ/qIckW1LvdcBPJtScx8oQIKLQBjvIduxiATSVeisLAq
         ldaMzAmNtOwC1d7RFF+y0XQTkuiY4ySpofapcAn84tfTqSCP3wFWDeF33olKcwoQSS5q
         YjnyxSbmSx61Oc0L2FmK/AEs3TxT4lQBt9r20cSQoqcqUT+58QUvWuaN3P1WkWJmA+W9
         yTi26L/PVUjMbquDTJ3ANrvhc9Sg37g3k9LTgY2qp8lJTZJaTDOlY2WJBn2RV3hvqcpc
         onEn5tLdp/WKoO/JjDTRRAF+vEdzqco/uB+Cke41v9sDnr/og9uOW8cXqRKuaDFRT2dJ
         R6vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790311843; x=1790916643;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cC2JxcNZX/PdxSljMsgobXdfIwmK8OmUL2fGB78jIko=;
        b=lwIeM43pBm2haISZKCTosK/i/4rtoEWeVxcviioEcFePhCNMhc6kDgUw45HOZen/k+
         Ghm/33qxTtWxpQe2/WERoZ2N7gPQ8tXDcVbHaPDiF2XvamNyGFO3whlFNBCWocM55ykP
         53JUttQqxlN1kYhdyZxqwnR02EzVSLdbBHRd6/9d+mz+RrJRMtGsbbNYVlExRfXrHgWm
         ktvmxcy9hq7or38+XjnYkGRWwQAlzBHFr72zEHT/coMYRlf16OjSXVqeBDETAHg10nTQ
         B5+HsZoT1B8mHvX9sWgkDDYefeDt9TZwVNbyqXWZUoK+YrlkG5bOhZ/gv92d9/NUIOtF
         O2ng==
X-Forwarded-Encrypted: i=1; AKwUvBz3qAqJ2PUVM3GOmrXWef8QzR4yopV3zINcwBTzlsQ2+4cvDU+JKowmD+2IEzJ0WjMcZslN5pEoRQapKQKGCCg5@lists.infradead.org
X-Gm-Message-State: AFuF++m72L9YtS27WbRpQhKPIiyTdNIxk0daTLPGnD2pqbT+gKOjNAwk
	0e9H+ww+ug9hOk7KfPKdBQdX+dGp7MpQ8dEcujhbE3++Gh8xDBRRPba/
X-Gm-Gg: AYBFou3HqZENczExeoQLHC/t0H+gbOj3xlgIGKtMSfeFQWgxo2w/k6uV8egip4Qu29v
	6pYVUO7N4mu3a+cMMKPVxd+isvPTEiPQ6ButDTPTZrjkJklYG93a+dpiQJbaddnl29hqiS6PA99
	2TG1bFkv3XWEC7xiI9QMBIOeZv6AjpnIFGihLqwTeFZ1Th3M8L9D0EnSGQLaljR+h8yAtvXK7Sc
	zHGOimpYYW1G73ZviTl+0z6nLtXXNQSxH7PFyjvkYgMIMToKUVmnUKuqKphzr1EjsBJh7tTNJVl
	pZOWlZ5W9MLZBr4NycL3m/k1TP2otlk+bDtWRFxbPmRN5zZ7VyS1M36Os+ZU5nfdBtxUQhihhnN
	L8YbRr2qtE6YoN0Fq9bfazPzTtELyFNEZE0Wo0e1nEry9pCnorg9O4Ezj48hUrAcxoKI1T1o0lh
	gYaWhreUT7EXHk2AdDYZLlPMQjbCosDCwgGLP8R2+cHcySu/py7B870YsnBD0T4d5BaRHgI8d+U
	BAdYU7IArVVWHBG5WYGMJdalpz+bELrzkSVh62XqDiwDO52EY50Zdr4ecUp6bkp+YhuwgOB7snx
	aqlHkz/bY4bJ0Q==
X-Received: by 2002:a17:90b:3908:b0:3a0:c20b:2fdf with SMTP id 98e67ed59e1d1-3a0c20b3132mr301956a91.17.1790311843503;
        Thu, 24 Sep 2026 21:50:43 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0976cacbesm8151528a91.13.2026.09.24.21.50.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 21:50:43 -0700 (PDT)
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
Subject: [PATCH 11/14] ASoC: mediatek: mt8195: Fix ETDM startup error handling
Date: Fri, 25 Sep 2026 11:49:05 +0700
Message-ID: <20260925044908.450775-12-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260925044908.450775-1-phucduc.bui@gmail.com>
References: <20260925044908.450775-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_215044_258055_482240CC 
X-CRM114-Status: GOOD (  15.51  )
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


