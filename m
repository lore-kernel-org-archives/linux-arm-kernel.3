Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8354FC88E64
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 07:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5ogPK4CkcC4kib57hvAPxClAgqXSK/aMlcwvCEMuXLo=; b=3uKmC3Bs/J+3DvOPtcW+fUgnJo
	BRTzm9akPeXjCDZG+a1KiEo59xXwHW5dIhT78FmALzE/354VWMrctfooXUPEYtYsHXFXAtX+jSbfc
	4fhWTJoXqwWQnybZmt6mEGBvYhet/cD4ZB6PxKwtB2aSJiCvwiMQaiGFDn35ZD+iFdqM/4gGQxkfr
	tZ5ni+WJj/XtSxiVH0Tedak7IZRYMrJc/UHRJ7X3KoHXeigCoaxbmZG0o4xLDMFRZSGclwegGOQB4
	dHP9ROaJbgsG+g8Rsj4uzKzz6Hmo9+BoRxLTzZ7IwVaTMOjBgdcDIvemtQiIzV+UdHlW4O/t3AYBd
	kf2zbQRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x617n-00000002YCJ-1gjo;
	Mon, 14 Sep 2026 07:29:11 +0000
Received: from mail-pz2-x23.google.com ([2607:f8b0:4864:3b::23])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x617j-00000002Y9I-3AYS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 07:29:09 +0000
Received: by mail-pz2-x23.google.com with SMTP id 41be03b00d2f7-cc1ceb47d55so157025a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 00:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789370947; x=1789975747; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5ogPK4CkcC4kib57hvAPxClAgqXSK/aMlcwvCEMuXLo=;
        b=Yq/zcObLTMbt6fKelDJcSGc7zD8aWs8ix8CKH0Bj7kQB36qM+Fmv36Y0PjrXlppi/B
         ao6ffvuzm64LI5SMlhkYhGwvNhkWYeW5kTUT7JOyPPuI3P22++AZ+uyslxGyVNP+K7nZ
         zUFq+xV2a3rr/bmICFDIArs6Ftujxl+0KbvS8yPRv5rA+JtzKRIhc3fK7lRMEqgInd82
         hEWV0UX+r5C7wm53NAP0IHFsVyUcBh9EZ5Tg1UNjt4XPcIb/Eacwk9Mqe2gPEqSBg2yQ
         6WN9k+VNhZc2BF1jWpEN37gBEtoY8+SGh/yzV1FFK6mC08AuCoTDd2t8u76eFt+vZBV+
         ZBOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789370947; x=1789975747;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5ogPK4CkcC4kib57hvAPxClAgqXSK/aMlcwvCEMuXLo=;
        b=QV12g9eoAl5F2AIwWPUKN3E0tdaRwuBnsDSVMZ6+QN6dsM+Wy1u3f0oRXCYZPTedTT
         QpsFXWDkB7cvf1JEG7pVOaP+eNhGUIsGKtyEJIRw2AsixU+Ed9VlBW+He9DCEroY/4+6
         5b4XqIBAb9dcbYKoltB/H+vR5Ee8Y5cmqoVJ4WLC4Z2uODxMSeMGn5udZLwxaFFps8bQ
         VDUX8evVFGxcpHUvR9fam0bJkj3t7OM+ivq3H1EqvjCk3UksXqPKOt0AC5EzsHosroHx
         Lf0UE4EgA7CjrkPu2al0U494MnngBkXUrYbHJWZqTSaTQcDP0TH2GSNF7SaGxBCl+A2X
         wDow==
X-Forwarded-Encrypted: i=1; AKwUvByWDz1D2kGOZAV29oa/zmSOmK73byoEXqhS/snPkL9xjNRp90lrmAbWaK+hJeP7dtXr6Qszd9lfMOta46cBwK/R@lists.infradead.org
X-Gm-Message-State: AFuF++mv4BOrFREr7ShSGh2Sn8948gu7+UCZWoAtN7MBWxnGV0hd8DD1
	TE8cHx/aCjBqw74DiEFNnUyXsC+Qlck3X23lgxFT3W6e0aqJTTBUZ+3A
X-Gm-Gg: AYBFou2aT16tNYMIEbvqevx9bDhSiew7V9SDA+Rj/0FX+o0IsfpVyGQKNHkrebPkFNw
	7VklNzZF37D9aBPTVQDry4r85liVs9VpPw6MO9ONYThLi+2H0Itv4I4b6zhIx70RTTbnxuL1EUU
	rfFOIgjode8NQ08y8jeUBhzyP7RUJ1OJ0rqfbQlZIfK8xKPfiTs3tg5HH0ahLreg1QWEyoCWDfn
	L1w/JL1X1KZQMcWAQFU6EfxY0X78l/guM4r4N2cH0DQAHK+pz/1Fyn5L+ph8DisveMmA8Dvtk17
	+RjuMfe2gZXNxeLWr2pUW9MM0L4xO2IZLteIufbm8jfPtsMCgw1hQ6gFFt+xFv9Q7DIB3BNITUw
	PNbQd3PfiS0MJ1piPVT9bn4TjeJZwjqS0qbFsUlSMXgxhN8twLPo+bKdLaMwp9OmvOJmcAtqrLh
	7ROrEmFHxMGc9i9So1PB/kPI3VujYBe5ImexKsRjwpk+wP3gbn9NJ4EVVjSUpuQCWyOWJd03AKb
	7cTv38/Y0eS/e9EXqybSVseCy9zr38rEnVjzzc53JsaB3eND6A5BXBnHLj649tL756kho0yenzb
	MfKeGFSe1cpX6gU9
X-Received: by 2002:a17:90b:1a8d:b0:390:84db:888e with SMTP id 98e67ed59e1d1-39dec3d0ddbmr1584578a91.7.1789370946743;
        Mon, 14 Sep 2026 00:29:06 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d957131f9sm19598245a91.12.2026.09.14.00.29.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:29:06 -0700 (PDT)
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
Subject: [PATCH v2 02/13] ASoC: mediatek: mt8189: Propagate APLL enable errors
Date: Mon, 14 Sep 2026 14:28:31 +0700
Message-ID: <20260914072842.24420-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260914072842.24420-1-phucduc.bui@gmail.com>
References: <20260914072842.24420-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_002907_809832_BCF6F4EC 
X-CRM114-Status: GOOD (  11.84  )
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

mt8189_apll1_enable() and mt8189_apll2_enable() currently ignore
errors from regmap_update_bits() and do not clean up resources when
clock enable operations fail.

Propagate these errors and roll back the clocks and tuner state on
errors.

Fixes: dc637ffeed6c ("ASoC: mediatek: mt8189: support audio clock control")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v2:
 - Update the names of the goto labels.

 sound/soc/mediatek/mt8189/mt8189-afe-clk.c | 78 ++++++++++++++++------
 1 file changed, 56 insertions(+), 22 deletions(-)

diff --git a/sound/soc/mediatek/mt8189/mt8189-afe-clk.c b/sound/soc/mediatek/mt8189/mt8189-afe-clk.c
index 63e03a40dbbe..aaf4f7921363 100644
--- a/sound/soc/mediatek/mt8189/mt8189-afe-clk.c
+++ b/sound/soc/mediatek/mt8189/mt8189-afe-clk.c
@@ -454,30 +454,47 @@ int mt8189_apll1_enable(struct mtk_base_afe *afe)
 
 	ret = mt8189_afe_enable_top_cg(afe, MT8189_CG_APLL1_CK);
 	if (ret)
-		return ret;
+		goto err_clear_mux_setting;
 
 	ret = mt8189_afe_enable_top_cg(afe, MT8189_PDN_APLL_TUNER1);
 	if (ret)
-		return ret;
+		goto err_disable_apll1_ck;
 
 	/* sel 44.1kHz:1, apll_div:7, upper bound:3 */
-	regmap_update_bits(afe->regmap, AFE_APLL1_TUNER_CFG,
-			   XTAL_EN_128FS_SEL_MASK_SFT | APLL_DIV_MASK_SFT |
-			   UPPER_BOUND_MASK_SFT,
-			   (0x1 << XTAL_EN_128FS_SEL_SFT) | (7 << APLL_DIV_SFT) |
-			   (3 << UPPER_BOUND_SFT));
+	ret = regmap_update_bits(afe->regmap, AFE_APLL1_TUNER_CFG,
+				 XTAL_EN_128FS_SEL_MASK_SFT | APLL_DIV_MASK_SFT |
+				 UPPER_BOUND_MASK_SFT,
+				 (0x1 << XTAL_EN_128FS_SEL_SFT) | (7 << APLL_DIV_SFT) |
+				 (3 << UPPER_BOUND_SFT));
+	if (ret)
+		goto err_disable_apll_tuner1;
 
 	/* apll1 freq tuner enable */
-	regmap_update_bits(afe->regmap, AFE_APLL1_TUNER_CFG,
-			   FREQ_TUNER_EN_MASK_SFT,
-			   0x1 << FREQ_TUNER_EN_SFT);
+	ret = regmap_update_bits(afe->regmap, AFE_APLL1_TUNER_CFG,
+				 FREQ_TUNER_EN_MASK_SFT,
+				 0x1 << FREQ_TUNER_EN_SFT);
+	if (ret)
+		goto err_disable_apll_tuner1;
 
 	/* audio apll1 on */
 	ret = mt8189_afe_enable_top_cg(afe, MT8189_AUDIO_APLL1_EN_ON);
 	if (ret)
-		return ret;
+		goto err_clear_freq_tuner_en;
 
 	return 0;
+
+err_clear_freq_tuner_en:
+	regmap_update_bits(afe->regmap, AFE_APLL1_TUNER_CFG,
+			   FREQ_TUNER_EN_MASK_SFT,
+			   0x0);
+err_disable_apll_tuner1:
+	mt8189_afe_disable_top_cg(afe, MT8189_PDN_APLL_TUNER1);
+err_disable_apll1_ck:
+	mt8189_afe_disable_top_cg(afe, MT8189_CG_APLL1_CK);
+err_clear_mux_setting:
+	apll1_mux_setting(afe, false);
+
+	return ret;
 }
 
 void mt8189_apll1_disable(struct mtk_base_afe *afe)
@@ -506,30 +523,47 @@ int mt8189_apll2_enable(struct mtk_base_afe *afe)
 
 	ret = mt8189_afe_enable_top_cg(afe, MT8189_CG_APLL2_CK);
 	if (ret)
-		return ret;
+		goto err_clear_mux_setting;
 
 	ret = mt8189_afe_enable_top_cg(afe, MT8189_PDN_APLL_TUNER2);
 	if (ret)
-		return ret;
+		goto err_disable_apll2_ck;
 
 	/* sel 48kHz: 2, apll_div: 7, upper bound: 3*/
-	regmap_update_bits(afe->regmap, AFE_APLL2_TUNER_CFG,
-			   XTAL_EN_128FS_SEL_MASK_SFT | APLL_DIV_MASK_SFT |
-			   UPPER_BOUND_MASK_SFT,
-			   (0x2 << XTAL_EN_128FS_SEL_SFT) | (7 << APLL_DIV_SFT) |
-			   (3 << UPPER_BOUND_SFT));
+	ret = regmap_update_bits(afe->regmap, AFE_APLL2_TUNER_CFG,
+				 XTAL_EN_128FS_SEL_MASK_SFT | APLL_DIV_MASK_SFT |
+				 UPPER_BOUND_MASK_SFT,
+				 (0x2 << XTAL_EN_128FS_SEL_SFT) | (7 << APLL_DIV_SFT) |
+				 (3 << UPPER_BOUND_SFT));
+	if (ret)
+		goto err_disable_apll_tuner2;
 
 	/* apll2 freq tuner enable */
-	regmap_update_bits(afe->regmap, AFE_APLL2_TUNER_CFG,
-			   FREQ_TUNER_EN_MASK_SFT,
-			   0x1 << FREQ_TUNER_EN_SFT);
+	ret = regmap_update_bits(afe->regmap, AFE_APLL2_TUNER_CFG,
+				 FREQ_TUNER_EN_MASK_SFT,
+				 0x1 << FREQ_TUNER_EN_SFT);
+	if (ret)
+		goto err_disable_apll_tuner2;
 
 	/* audio apll2 on */
 	ret = mt8189_afe_enable_top_cg(afe, MT8189_AUDIO_APLL2_EN_ON);
 	if (ret)
-		return ret;
+		goto err_clear_freq_tuner_en;
 
 	return 0;
+
+err_clear_freq_tuner_en:
+	regmap_update_bits(afe->regmap, AFE_APLL2_TUNER_CFG,
+			   FREQ_TUNER_EN_MASK_SFT,
+			   0x0);
+err_disable_apll_tuner2:
+	mt8189_afe_disable_top_cg(afe, MT8189_PDN_APLL_TUNER2);
+err_disable_apll2_ck:
+	mt8189_afe_disable_top_cg(afe, MT8189_CG_APLL2_CK);
+err_clear_mux_setting:
+	apll2_mux_setting(afe, false);
+
+	return ret;
 }
 
 void mt8189_apll2_disable(struct mtk_base_afe *afe)
-- 
2.43.0


