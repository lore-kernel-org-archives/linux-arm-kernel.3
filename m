Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40644C98306
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 04:51:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U1o0Fr3SsImGt+aqLrFKoD5OlJOoiuIdG7+nqMI1YN8=; b=d/2Mp7gRIOshciy4evqqTLxxeg
	kwN0ITqo1Jyipnpq5vIUJwjjJSVoDbZnkzM0Skq3Xews0JLpnHST+tj+H5rH+ZSCvZrcrXVvS8VGm
	LhuSoc+eYGPrrTAdmvcPFjYCAw5uusriTKyjxicCBaJHVT3GK/aPhp8z6K1xAflzablauENGBNKo8
	xyKI1Yj/8uwhBP00ZZ8dXTr10SeEMOCQjygRdA9gpI1f30jUOIj/6QhkRS+79zbs1DN1z7CQmMNim
	io2Miik/ChdRMrXNrRxzKR7ujNhuGW3yrxXwwnwYWGZN+ufnr7mp09r7JmzPIzcrBkWWQFe4wbBUz
	5QnkJeJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9xuH-0000000CeRj-0TaE;
	Fri, 25 Sep 2026 04:51:33 +0000
Received: from mail-pz2-x0e.google.com ([2607:f8b0:4864:3b::e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9xtd-0000000Cdu8-04ED
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 04:50:54 +0000
Received: by mail-pz2-x0e.google.com with SMTP id 41be03b00d2f7-cc1cebad4adso137114a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 21:50:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790311852; x=1790916652; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U1o0Fr3SsImGt+aqLrFKoD5OlJOoiuIdG7+nqMI1YN8=;
        b=Jsf5UI/40WJF/D8X9lP5CHLc3uwvHrFoRESTQ6b+aTcF/Tg+Tcjtnbh/FtWQqMXeDp
         UreR5JquiWlUDBEhI9VWyNOxgU9WBZUKVd8165fGJfDr/JLfs54VtJtolHC0CNyCSZy9
         37yn2mILpHFAbQ2AIDcdlIdAF529LgdLDgZkOc72nKFrnH6autp63u3AnJGpiVCOvCUf
         uc9fX4nrxpa0vkwXerKQpACTiEK2cjliIlHc/IO76GlgVqWi9JSC213zN9FmKn4e+/3W
         t0lmMP0SD66VeZ7Cceb9eaXgnGEkZaQiTsbYz3C9jZTvAeCbVzRHDxafR3UVC8ihBrcI
         cokg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790311852; x=1790916652;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=U1o0Fr3SsImGt+aqLrFKoD5OlJOoiuIdG7+nqMI1YN8=;
        b=QGiQiOBpLZwtken22b3vUJoecYZhyKTN8fvXtdK4gkx9kR70/WifLmS7u9fZah3Q0R
         MAMOKkpinZDTmpCB8caBO+Pu54uLX9utYjzZ751ozKkvF90Afa8yBX1JR2ujMUBYXJ7t
         Q8wVx0LftCvIt8iKsCAICRlLMR1yGP0uq4z7+arPA+Kmvhdn0pMTqLe/7QBfvN+lPYlg
         sQdXBA3lR7kzjh9V9Gl3x5yo9mE3qWE4ReQL7fELrPXmG07DnUiiv82KACYTYkWK5LqK
         GSY2gxcrJZOxBLDFV5TRy3yNFwud7LNGNdn70BjOP5N4Vn+sHC6bOZeFm8TmVHnierky
         9MsQ==
X-Forwarded-Encrypted: i=1; AKwUvBw6HVgKrNaXifZpeSrvJ7ZZMRZ119oFukDggE0Eeq8ivzegcZ6IQrTCWRjvokD50B4inHQbSKg7o4TqB1nNV7IW@lists.infradead.org
X-Gm-Message-State: AFuF++l+FVu4bm419CItc8s3QKwlD69sI/Cg12cgVPwMJVnp8pNTREHi
	5tpODXva2ibB+hE5EqKVoeiZxlINPn5lqMtNWbgnx7o/skV2pMWw+7Zh
X-Gm-Gg: AYBFou3i3HJuwVSymKwWwQk18bS57t6wcZH460GPfFPpoTfsHzs0O2k+wWM4gmnPS3Y
	Ltzq0zWKNDyXI7Fh4Rp0og0ThkESas8w1Uml6bys1lfs0GV9ioaVsGHZoWkI30V9bOzTaxOlp4s
	b32Hr3P+ZqKBMyOSkQtHq01kmu75GKCM+s12q2GHcrGxupPwHJveF56PN26RC0qq0MGQW2xtpvY
	N3NjBsHlpXJkPA/jogy+yzlHCUBB+RUCsvMx6ILwzYvN7SAMdLx9Bcm5z4Mz+rJf4xuBg3+zqJ3
	7JdfmDjgA4uN55JCcSXElMJfJ4ngAM9sh9Bakl0GInr+PVwi4Ie28FHHOzWnlBnu+AZ10XqG6yV
	e3UjKashD8++dy//Xeqs1pDgwlaimnaoAwXHWPVn9l1TKAmMPtrr+rt98JkIha3wu9QNcyMCJKL
	vAIkphdEVpr2IaWkm6D22/Gds9YkA9rc6iDH4WUnJI+y2/F9gAaE6TPvoM1StSGLHFu5RjIRpGl
	som3t7RSpW0EMjVb2BZSTvzNkP4B4tuKSX/e/3oPS3oqoBO4WJQngnKgMG2Fkuz74Xe43hJyPT5
	AljJoLisT5aXsFNBHb3V4EKy
X-Received: by 2002:a17:90b:17c6:b0:3a0:516d:9f88 with SMTP id 98e67ed59e1d1-3a098761df2mr3859051a91.26.1790311852041;
        Thu, 24 Sep 2026 21:50:52 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0976cacbesm8151528a91.13.2026.09.24.21.50.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 21:50:51 -0700 (PDT)
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
Subject: [PATCH 13/14] ASoC: mediatek: mt8195: Fix ETDM probe error handling
Date: Fri, 25 Sep 2026 11:49:07 +0700
Message-ID: <20260925044908.450775-14-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260925044908.450775-1-phucduc.bui@gmail.com>
References: <20260925044908.450775-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_215053_072288_A5A53FEF 
X-CRM114-Status: GOOD (  12.98  )
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

Use pm_runtime_resume_and_get() to properly handle runtime PM errors
during ETDM probe.

Propagate errors from MCLK configuration and enabling instead of
ignoring them.

Fixes: 1de9a54acafb ("ASoC: mediatek: mt8195: support etdm in platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8195/mt8195-dai-etdm.c | 27 ++++++++++++++-------
 1 file changed, 18 insertions(+), 9 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c b/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
index 11317cdd14ab..8fa830a57502 100644
--- a/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
+++ b/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
@@ -2503,6 +2503,7 @@ static int mtk_dai_etdm_probe(struct snd_soc_dai *dai)
 	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
 	struct mt8195_afe_private *afe_priv = afe->platform_priv;
 	struct mtk_dai_etdm_priv *etdm_data;
+	int ret;
 
 	dev_dbg(dai->dev, "%s id %d\n", __func__, dai->id);
 
@@ -2510,15 +2511,23 @@ static int mtk_dai_etdm_probe(struct snd_soc_dai *dai)
 		return -EINVAL;
 
 	etdm_data = afe_priv->dai_priv[dai->id];
-	if (etdm_data->mclk_freq) {
-		dev_dbg(afe->dev, "MCLK always on, rate %d\n",
-			etdm_data->mclk_freq);
-		pm_runtime_get_sync(afe->dev);
-		mtk_dai_etdm_mclk_configure(afe, dai->id);
-		mtk_dai_etdm_enable_mclk(afe, dai->id);
-		pm_runtime_put_sync(afe->dev);
-	}
-	return 0;
+	if (!etdm_data->mclk_freq)
+		return 0;
+
+	dev_dbg(afe->dev, "MCLK always on, rate %d\n",
+		etdm_data->mclk_freq);
+	ret = pm_runtime_resume_and_get(afe->dev);
+	if (ret)
+		return ret;
+	ret = mtk_dai_etdm_mclk_configure(afe, dai->id);
+	if (ret)
+		goto err_put_pm;
+	ret = mtk_dai_etdm_enable_mclk(afe, dai->id);
+
+err_put_pm:
+	pm_runtime_put_sync(afe->dev);
+
+	return ret;
 }
 
 static const struct snd_soc_dai_ops mtk_dai_hdmitx_dptx_ops = {
-- 
2.43.0


