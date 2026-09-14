Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18EBEC88E50
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 07:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vlGnqVAUzYoXB3nTaQam08DX17fuCUu75lyq1+U5jAU=; b=ojgfEr9C/eMm7FAwT3EoEd8IsA
	8bMhjQuAeghQR2cLU5/3ZUyP21p/5kvjVwD61EmoxuqDRCUWEr20j49n+BT5wFzTV73VFxHWqsCXW
	b2KcpQ5ibTImpMWm+vAh5F8IVSRzMSDhsD1jkYbY/wbyl7NA/aoIPZAQXH+XguejsNzenXJCWGgfP
	aeXeV5hNcAxhmRaFcLPDlchBZBYrEz2xEB+LH+JwVMH2uN+bA5q8+Y891yy1Z8xY3EENOU79nhFnU
	b+brsocH9IMOebRonD3SeLHcFw4n37TAzqnYFX4rAwyE/EH8hoIShoHO+dSca8CkWgxfLjMcMqLzg
	LrmV2QZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x618X-00000002Z2x-2LX9;
	Mon, 14 Sep 2026 07:29:57 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x618Q-00000002Yt4-02jF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 07:29:52 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2dcff8f44f2so44160285ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 00:29:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789370989; x=1789975789; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vlGnqVAUzYoXB3nTaQam08DX17fuCUu75lyq1+U5jAU=;
        b=gamSCxY4rx9cn1jx+A7r+zDU4NG/3hlqprf8IvbkbVtOy1tdTJUUtUnuZYSnaUEUTP
         LPaQxRnMwEwPBMeQcVOZDEBWm8JV4hFWmNeO0iEGutK/5658qPkbnqUrYtIKThuU4KaG
         erzBmbOHE2fJp2JmZW3hz3CT0Rvfob47m2kYJaY/JJwdd96WkjZr8qxt+m1MVZtx2hkk
         QH32R+QX3++/Un4g8YSw/1N3aX8YGZxFLYJatSPXcAF5OsRkT6g6zP4jeu1KibE0nP4o
         Ar8q2vGbquyaZVASzU3BrdDYyjjiexlooezojmfM8PtG1fKlaNlON08WI9GiOquK9fbs
         8dzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789370989; x=1789975789;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vlGnqVAUzYoXB3nTaQam08DX17fuCUu75lyq1+U5jAU=;
        b=c6qOujDv+Zqwe50i4idjeSaZenphhs9hL5+GIrS9R2vTTfV06k0Fq8mqOe7Zp2Vtwk
         yFFth+lJjgKxP2LAIZXnHyVeUYuqL4hqketOneZAXbOgvmsohxajbKuvT7YjzHsqb+by
         bsA1oIzlLzHgvO/YS0WMDbQp7OlvQA3Ws29J0270oMwrTj/wuahArsCYwsf9kYFDMsGN
         YvumOgsF2h4cfKAptLKA3m6nv7hILA2OeCWP0eqNNYPOuBCIjLHv9ESGZdVh+r1dcj6v
         Z09leT+0Rs2Yae8YQIdTEh/G8CWDrzTX6nFFRG6LG7xpHZuaBHUcGlwHW+9TXUPbbz5w
         nXTA==
X-Forwarded-Encrypted: i=1; AKwUvByWcLqBr9HMSotAl3UyyV4MX+L8sIcgmyplK/9JLOmrKRPi3D0ReFJ8HT1ZwqKXCRXY2kyFlNmD5rRxck++uwGZ@lists.infradead.org
X-Gm-Message-State: AFuF++kWrA4KykyCILOQkITRQRBVYQHDwPt+d7XQGira/0U3uB+cFjlJ
	DpqvYFSlLgkD/mQNXPeWDvudQOyRcyt6Hk1KnW4mnp75dsBsV9okUEaE
X-Gm-Gg: AYBFou3ApEwSk34Jy1u8k4KnBZ8K1CPW+FVZaJ+87m6EszK6clW/IEXEg0F31sJ8vfZ
	Y8xRm/ztS9dKEwIlesQevVvYOTnhLlMHqUXC/QisQPsDL5w93Ox2cgJ7FIKYnotihCjP2zd4Wpn
	5pxzLcDh6lnUqLD5is2lvWZ/Lu5f+zajYzenzNtidy6BFKSsh5+H21S81ZtKh/P/Mnp/byiJypF
	r7BtSWzCef1kB1vuZDZidiCY3zcV8t2Lpdd2uxXcSgKDucSOwGUpItoHgoe2UPZCm4TrAuWlUXU
	L6MN2xt2TbfpMnJvRYvEkDdGXm7P2JSIjwYZarqfO9s6X7klqyOQ8l8varbrMJimph5r9M90402
	VjkWdNw6XjrG7jAMzw0Kx56C3HJQEyKg/9qRoru+5uWa5O6SVNR5KAgV+cMEXu2rsRZvnydwOvJ
	SzhS5KxGCDrRe4g+St76YwB4oyVTFoALjIGrDSJCROkg+C0kQizZUofny6w+rPLJXnJ/DWDTm8x
	mC84+fQOEh+G55tBHqPypvJB6lu0rDzgz9ZOHAHsVS8aLdOEiYH7bO79NggNIt+ui0PkQAGqXYq
	lTLsSFCE9bZlEQ4=
X-Received: by 2002:a17:90b:17c3:b0:398:deed:6e1d with SMTP id 98e67ed59e1d1-39debf6cf10mr3012416a91.5.1789370989442;
        Mon, 14 Sep 2026 00:29:49 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d957131f9sm19598245a91.12.2026.09.14.00.29.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:29:49 -0700 (PDT)
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
Subject: [PATCH v2 12/13] ASoC: mediatek: mt8189: Propagate TDM clock errors
Date: Mon, 14 Sep 2026 14:28:41 +0700
Message-ID: <20260914072842.24420-13-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260914072842.24420-1-phucduc.bui@gmail.com>
References: <20260914072842.24420-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_002950_111280_F6D9F1B1 
X-CRM114-Status: GOOD (  12.19  )
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

mtk_tdm_bck_en_event() and mtk_tdm_mck_en_event() currently ignore
errors returned by the MCK enable and disable functions.

Propagate these errors.

Fixes: 9f202872ba04 ("ASoC: mediatek: mt8189: support TDM in platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8189/mt8189-dai-tdm.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/sound/soc/mediatek/mt8189/mt8189-dai-tdm.c b/sound/soc/mediatek/mt8189/mt8189-dai-tdm.c
index 5d68a55ccc45..1b51027c6cf4 100644
--- a/sound/soc/mediatek/mt8189/mt8189-dai-tdm.c
+++ b/sound/soc/mediatek/mt8189/mt8189-dai-tdm.c
@@ -261,22 +261,23 @@ static int mtk_tdm_bck_en_event(struct snd_soc_dapm_widget *w,
 	struct mt8189_afe_private *afe_priv = afe->platform_priv;
 	int dai_id = get_tdm_id_by_name(w->name);
 	struct mtk_afe_tdm_priv *tdm_priv = afe_priv->dai_priv[dai_id];
+	int ret = 0;
 
 	dev_dbg(cmpnt->dev, "name %s, event 0x%x, dai_id %d, bck: %d\n",
 		w->name, event, dai_id, tdm_priv->bck_rate);
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
-		mt8189_mck_enable(afe, tdm_priv->bck_id, tdm_priv->bck_rate);
+		ret = mt8189_mck_enable(afe, tdm_priv->bck_id, tdm_priv->bck_rate);
 		break;
 	case SND_SOC_DAPM_POST_PMD:
-		mt8189_mck_disable(afe, tdm_priv->bck_id);
+		ret = mt8189_mck_disable(afe, tdm_priv->bck_id);
 		break;
 	default:
 		break;
 	}
 
-	return 0;
+	return ret;
 }
 
 static int mtk_tdm_mck_en_event(struct snd_soc_dapm_widget *w,
@@ -288,23 +289,24 @@ static int mtk_tdm_mck_en_event(struct snd_soc_dapm_widget *w,
 	struct mt8189_afe_private *afe_priv = afe->platform_priv;
 	int dai_id = get_tdm_id_by_name(w->name);
 	struct mtk_afe_tdm_priv *tdm_priv = afe_priv->dai_priv[dai_id];
+	int ret = 0;
 
 	dev_dbg(cmpnt->dev, "name %s, event 0x%x, dai_id %d, mclk %d\n",
 		w->name, event, dai_id, tdm_priv->mclk_rate);
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
-		mt8189_mck_enable(afe, tdm_priv->mclk_id, tdm_priv->mclk_rate);
+		ret = mt8189_mck_enable(afe, tdm_priv->mclk_id, tdm_priv->mclk_rate);
 		break;
 	case SND_SOC_DAPM_POST_PMD:
 		tdm_priv->mclk_rate = 0;
-		mt8189_mck_disable(afe, tdm_priv->mclk_id);
+		ret = mt8189_mck_disable(afe, tdm_priv->mclk_id);
 		break;
 	default:
 		break;
 	}
 
-	return 0;
+	return ret;
 }
 
 static const struct snd_soc_dapm_widget mtk_dai_tdm_widgets[] = {
-- 
2.43.0


