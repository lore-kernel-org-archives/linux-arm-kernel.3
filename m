Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA863C79FB9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 12:59:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vlGnqVAUzYoXB3nTaQam08DX17fuCUu75lyq1+U5jAU=; b=i/5mDSU03+qU2nfZzdM8WRMiIB
	zoLQJY7lihMzgDyDF4fEQDn+OK1POe8vKU0H/eL7smGO1DcvETfoO1/XcZcuI+811YiZWI0F9VrFH
	xXqf2Zu+PUzsxcsFleRPTTgy7lw7hfn3RWxMxf/RthF2xL9oOxZzMvRPpKydpCw9qoF5jUs1u9UUX
	pOvwyj1dMPBE6dW/Gsm4iEl/etB40aQnAVeuA6a3NnT02biI+0m8VCHiHC30OZYb4a+z0GCpd5Eyl
	JntT5xC/r8mHQw4GUqxNQTm54OGMtESIT5LgXGQTNFu+ZaRatYBrP9luGZIHyGyAPIxhouAwux2vy
	frFvns7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4eMn-0000000EP8r-1MEB;
	Thu, 10 Sep 2026 12:59:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4eMm-0000000EP6n-0fJk
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 10 Sep 2026 12:59:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=vlGnqVAUzYoXB3nTaQam08DX17fuCUu75lyq1+U5jAU=; b=DMXWQUiZy11Zq3I2iFofvMH1xF
	iMaU8FYhHZYNxRaR0bYzmmgU+HkwOfnJnthGU6oOrQFce+cMVwSvnZEy40eAKy0Lj2xnT+GspEIc3
	RNlpvdKrSwBLr7yj8Al4q/A+/Tk35vMmWzs2gjiS3U62DDtm8QmyooCPFWTb1CSjPZdb3cRrVET9Q
	f0wByNbawMxBDHdrLbVAjVXH3HIXQdI2M04XsGz3LdiZbXyc9mb/bxtYLiBKb0yYpsewb3ExwzICd
	XkPwXzXfajxsAFseMOL9xAtTV9AXXtMd3QrbgGLzgk1e2ynMzndaijngpIqn35Ik1mbGS44GLJw7A
	vihdW5vw==;
Received: from mail-pz2-x10.google.com ([2607:f8b0:4864:3b::10])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x4eMj-00000002V6w-0maQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 12:58:58 +0000
Received: by mail-pz2-x10.google.com with SMTP id 41be03b00d2f7-cc1cebad4adso1868709a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Sep 2026 05:58:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789045135; x=1789649935; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vlGnqVAUzYoXB3nTaQam08DX17fuCUu75lyq1+U5jAU=;
        b=myOcXLvp9vNt7ik4Vmv1Fh9rUKmAvFbjla9iSvoiqGa6K/T5i8oL7OjfVDVpd/szmd
         Ic0SDwlWHw1jDusIUUlJPLRdwLLxLpxiZlAq25M2I2YlETmrh3kUyQvfT+pOKUs+t/9/
         2W0RRGTx1KCj2U7pJH2HUW0H9kOhcfyMGZ1MUChNuye3YCFLjskB7y+jtcAjomNAGPP/
         /Opzx91Xer4DDLFZZ7ieWNG42X7iOmvY3iPHjCGGlyAzEAbJfsRdOzhOmYdXpEQU8tXj
         wiMjHdHdhN5tyPG27ORjvCArSPSk7Un8PSaEi0qqzh3RQQ0JtZ3ZttLTDWJ8IKY9VW3y
         O4Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789045135; x=1789649935;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vlGnqVAUzYoXB3nTaQam08DX17fuCUu75lyq1+U5jAU=;
        b=Zqna6N2m/ZO8GeNU3jMuvQDjMTMoKnJMkasteah7jeVot/GVXAphQkmUyk5dR8CM4o
         R+0bZ8oxX70wxDWGn1z9qG/v/I9CYMyykB9s7o+aRMmpGVCjtIe6O2ITCpwF+CkNbM1D
         5SmtPQvqlwOHDLycxH8YPWuFrYfNXUYimFYprCC6/sPL5p8Hy/HexS2/TCrwHM9hiKkW
         WA40W7NNIWPPE6Pzr2DYQxfx70DzrhpxWnYLIxA5VoKj4yYOVAZHgpvHElFbSzg4svJh
         cIO0RAlaWa3pqqBFnAiZ2vCdokyoegCGwjSfyot8EOl9I0jF3ZSFNHmhUTT3/bdLC2sY
         0IMg==
X-Forwarded-Encrypted: i=1; AKwUvBz6019NJFYmpawWWSQh/V+oOSuaYKnbvBdM8iSvnIectW2odwSHV4BB7Uty/lReRNvXqQrZE8XZd7lS4Io0uByS@lists.infradead.org
X-Gm-Message-State: AFuF++mp9gB5S0ZtbNvuGFxcAVly28mMNRYhEQvQ5A6dKTwB7OZ+O1H0
	dzK6QCJPLP7LVfGNNFArXWk7Blsjm15ym/nucQ6QV/hpwrEbcEsDc7rp
X-Gm-Gg: AYBFou0AP/rnwDkICOliDHOP4KyCUWOs3Zsf1yupibvc4lJ304plcAzms/j146KlHaM
	o1ayA7jxrRTV2PddX5rIFhk2tgZDnVnV2DpuOOqwyeNvJWOvNLTusICZaiu4yqcNVGx/9oW8vwY
	cPcJFL92f/HgZbhlwwLhtfosLGsy7SlHXdSpwjsRubu3/cMBVJeUJE4ZQr/GI7qoxvHILPiTREP
	r0s6wKkS3ak+oGYARujn7tZwmI0dALroy8tp+R5sOg7m78BPklqdFchJSnMTsneqNRoaxuNKwxm
	mdDNsGm31hMagh/W5CEfZIIcTio6E8uJKvxL5+wNvvG5gt1mobE5Ao21MLoaiYDYekKuExUpGWL
	sgfbxzl7EpqSaLGd7/N6VflPwKJGtM0nWEg923onLX+3pbG84dnMeRkyKv16w8hX2txbsTOiHQ1
	iZKRjMTLZUJdkCRrhqaqd0NO6pthD37XTDB+VZbGyYXRR0HPxh1DTaIhJw38Td6lkW5S7g1t380
	KQgK5C1yr+ifta44usJoqkF97GHH7+pxdL2t3hiLEM9p2rGiTJFV9UaPOmoYhx9c/AEkflVgynn
	kBbiJ6FohFUH/QY=
X-Received: by 2002:a17:90b:520e:b0:398:9be8:ea65 with SMTP id 98e67ed59e1d1-39bac3c452dmr19487586a91.18.1789045135450;
        Thu, 10 Sep 2026 05:58:55 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d7e77b1afsm4891592a91.5.2026.09.10.05.58.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 05:58:55 -0700 (PDT)
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
Subject: [PATCH 12/13] ASoC: mediatek: mt8189: Propagate TDM clock errors
Date: Thu, 10 Sep 2026 19:57:41 +0700
Message-ID: <20260910125742.150902-13-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260910125742.150902-1-phucduc.bui@gmail.com>
References: <20260910125742.150902-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_135857_374207_EA8BB3DF 
X-CRM114-Status: GOOD (  12.10  )
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


