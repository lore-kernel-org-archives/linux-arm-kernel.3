Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5498DCA5FAE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 06:13:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3W1Z4z2ziqkLTLfdGWsmv+b1vbrImgZWrkJME4neunc=; b=1JsROxgucY0OVAZ3SbZXUyqitK
	2R9iPIwYSDqIjYI9XNy2PnzKFHvsJRf+bNcgLdHOKw7iFhaCPrzDfmByNMR5aK35fE3qYeheU0OGy
	kt/B3zrjtJmVytu1iASg3ELXV8qtILrGJI9JEgIwdr0gN+32hYRTWaCPszzoOuP2EcvveH0dZGXYd
	O4e2RmSjy9Rk43n11+LVdiNWeuD/i6IMUJMO46fGMsOdfa9MJCSVBekHy5KkbicqrDRuQi0TZAj+a
	OrGubrZlzmZ5TxOYa10QRrIabuAG2YhrjWrmiQlpn5I3dk/k3UbwjFkZN3T/QhhPbsi1COytCQWx1
	H0HsxEfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBR5D-00000002QAg-3Qda;
	Tue, 29 Sep 2026 06:12:55 +0000
Received: from mail-pj2-x0f.google.com ([2607:f8b0:4864:39::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBR52-00000002Q4c-2Mlx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 06:12:45 +0000
Received: by mail-pj2-x0f.google.com with SMTP id 98e67ed59e1d1-3a494638445so513368a91.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 23:12:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790662364; x=1791267164; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3W1Z4z2ziqkLTLfdGWsmv+b1vbrImgZWrkJME4neunc=;
        b=B9rVnqt6b9lgIhk4DR7Q6TI7Fr2ItNruY/Qut5ZwLlD3xlKcVOnVcwSxzflDh1YDIk
         bsApXGMeo8DSAtF6hEkOyJ+TkQgZrYJro7zgvqtYRVbCJRT8LEELiQ+Ya9lggMRV+UCo
         DggTPmXgMuWFwOSZ8UYlOnPjqt8WvexeH8EGt7gt6OzkdIBXCyrGrmUgZ6o4nEw4u8zR
         X2JYavb6Z0tVv671S1vi051qwjd2sHKv4hJ5Yitla3Fic4syh9m5BYNzxuuuR3G37ZHF
         JSos7QUwZ+NHGtactKml7phCb/o3D1NxJ1g4SGJbpMpgzPbEySHSNTcj/1oepsjbE/1u
         116w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790662364; x=1791267164;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3W1Z4z2ziqkLTLfdGWsmv+b1vbrImgZWrkJME4neunc=;
        b=r3plT73Y8mKIOgCGdFYzoenbXtaUMTeH9SZqa/A+sN/+pArxPMq4IZPUaHzWxkZ5OO
         88d8UwqMyG76Udb+XL4CmO9PDuiIsgVN+IlzI3bhy33NJ22etBFX15eq4CljNw+klS7/
         VmwC5hjtShuf4KUjU7lU11VauLVim78on8xwCretvyTm28Y6Tfc07aXwBJzxN1lMSCCi
         DXE4FR0kpPFk+Qo9R1+IiYLre7AegLcPZSyqCo5PMJRdpceNNpXk3pSzRf6CQjnXndB+
         LRRvptPNTctWdTIlJ4Y28XzrNBXczM1ho0cWNix2C3kl7mJ2xQj6f/T3RkFAoDHg2Mmr
         +DHQ==
X-Forwarded-Encrypted: i=1; AKwUvBzOobiyLDrWM/va6/fc+jEokWhNauJEnsQ83feC4r6KMm2JYTsSKGAeHoTLncoXh9OT6tD8U/JYPROejPaZE8Jw@lists.infradead.org
X-Gm-Message-State: AFq9FYI4TD0Y7TbAPvCJa52hgrLGPbOKuoVVbihIUYjjRnalIyvv43SH
	3jEiG5XSb46Bv0pofRquBzpNpbsYHFfME9SEH/Yx8osSQg31185x7CJb
X-Gm-Gg: AYBFou11Z9T7zbowvS5FBvvXTM3eVTh6DVadNCUHvm9icTWhTRZjfdw/rIgRaq59Xva
	H9YKO3fZyMTjkRuNoul0TTCZb21BjJ6/0QVf83WLoJwQBKxKYp85ItDl79qrFMuTChyR/z01ILJ
	ft4EVEd87+N6++kPWie1ycNgEKKSmHmeQLCsXS+ytdRe/g50z4a0twnhH5sEaMlr0jPqFBIxBJ9
	PYVXnwKraBNni1I4pNJz2i8hzm8UCwZi1sMJOXto96mfzZ+g7e4SMKLjl3n615nLSUZLoiFdiqm
	iL0xjmK/dsrV+H2U+mXkgm/3uX4l/kS9V2Epepsvg5vLE+2XyxLvzn4skOxPWeZVBR72aDYDDaA
	1s+lokhvQsoaRSBFnHdpRJZPKH2PcA2oiTH3ajyrET0EMP5z14+wdTgFov61SLTmTnI5hdczNuA
	/2DFKuKGO5H1nGerEYGlqodQeZbmgnE8b7ew2MiH3tH6JHmmxHvJ5JUwlgbuwKekH9pEwYhDZPN
	ZGy4kTPEcFGaBdkER+VsJH5Uuvmqr1/p8pNW5HXU/P6YW+xyZV0lWO4PUszjaTR7dMgM+H+msP7
	Jv1/ZxCf++ePyXQRgXiMtwH3
X-Received: by 2002:a17:90b:3908:b0:3a0:c20b:2fdf with SMTP id 98e67ed59e1d1-3a0c20b3132mr7441393a91.17.1790662363889;
        Mon, 28 Sep 2026 23:12:43 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a498726d63sm3280965a91.17.2026.09.28.23.12.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 23:12:43 -0700 (PDT)
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
Subject: [PATCH 10/10] ASoC: mediatek: mt8196: propagate TDM clock errors
Date: Tue, 29 Sep 2026 13:11:21 +0700
Message-ID: <20260929061121.124001-11-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260929061121.124001-1-phucduc.bui@gmail.com>
References: <20260929061121.124001-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_231244_609209_D7D4E7FC 
X-CRM114-Status: GOOD (  12.54  )
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

Propagate errors from BCK and MCK clock operations in the DAPM event
callbacks instead of always returning success.

Fixes: ede4d841111a ("ASoC: mediatek: mt8196: support TDM in platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8196/mt8196-dai-tdm.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/sound/soc/mediatek/mt8196/mt8196-dai-tdm.c b/sound/soc/mediatek/mt8196/mt8196-dai-tdm.c
index b7aeee939d88..44bd08f5c1fb 100644
--- a/sound/soc/mediatek/mt8196/mt8196-dai-tdm.c
+++ b/sound/soc/mediatek/mt8196/mt8196-dai-tdm.c
@@ -256,22 +256,24 @@ static int mtk_tdm_bck_en_event(struct snd_soc_dapm_widget *w,
 	struct mt8196_afe_private *afe_priv = afe->platform_priv;
 	int dai_id = get_tdm_id_by_name(w->name);
 	struct mtk_afe_tdm_priv *tdm_priv = afe_priv->dai_priv[dai_id];
+	int ret;
 
 	dev_dbg(cmpnt->dev, "name %s, event 0x%x, dai_id %d\n",
 		w->name, event, dai_id);
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
-		mt8196_mck_enable(afe, tdm_priv->bck_id, tdm_priv->bck_rate);
+		ret = mt8196_mck_enable(afe, tdm_priv->bck_id, tdm_priv->bck_rate);
 		break;
 	case SND_SOC_DAPM_POST_PMD:
-		mt8196_mck_disable(afe, tdm_priv->bck_id);
+		ret = mt8196_mck_disable(afe, tdm_priv->bck_id);
 		break;
 	default:
+		ret = 0;
 		break;
 	}
 
-	return 0;
+	return ret;
 }
 
 static int mtk_tdm_mck_en_event(struct snd_soc_dapm_widget *w,
@@ -283,23 +285,25 @@ static int mtk_tdm_mck_en_event(struct snd_soc_dapm_widget *w,
 	struct mt8196_afe_private *afe_priv = afe->platform_priv;
 	int dai_id = get_tdm_id_by_name(w->name);
 	struct mtk_afe_tdm_priv *tdm_priv = afe_priv->dai_priv[dai_id];
+	int ret;
 
 	dev_dbg(cmpnt->dev, "name %s, event 0x%x, dai_id %d\n",
 		w->name, event, dai_id);
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
-		mt8196_mck_enable(afe, tdm_priv->mclk_id, tdm_priv->mclk_rate);
+		ret = mt8196_mck_enable(afe, tdm_priv->mclk_id, tdm_priv->mclk_rate);
 		break;
 	case SND_SOC_DAPM_POST_PMD:
 		tdm_priv->mclk_rate = 0;
-		mt8196_mck_disable(afe, tdm_priv->mclk_id);
+		ret = mt8196_mck_disable(afe, tdm_priv->mclk_id);
 		break;
 	default:
+		ret = 0;
 		break;
 	}
 
-	return 0;
+	return ret;
 }
 
 static const struct snd_soc_dapm_widget mtk_dai_tdm_widgets[] = {
-- 
2.43.0


