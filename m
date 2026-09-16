Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3916C982C5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 05:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pql7MOYwKZW3o6yhPXEQuRrMz6C0eX70Gy/W9byUq7w=; b=X9WSPClyZV48KIR8x2l8zIr9CO
	gP4ldoy8t3RDOigAkLQxGYJJ/7kwfeeF0TK2qvVjvpG8Gm0VRuertsxzdCqpLOwmhsCMoR9KrZ8To
	7ZbmWDLNPhGUn8uvNp0txswqo6GP3RPtFTSpba7b2Aq5aMO2WVOHtXYluGIo7iY+7+YDg89y2IQnl
	5SlLLHsqKefS5JPFKKY9BGjobi8uZAcDB/ln+oLDR1AHTa3LHw5v6rECyuAdfg2dLOs6I9WzYdAyo
	LIdc7E3wM66z/oOtfEtaCJXuOVxuX6ot/Hsa1XrhlL9KqOTfZIwx1ljus0RDUnnI8NFng/bBn8w1N
	0l8IpA2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6hld-00000008LH8-49GY;
	Wed, 16 Sep 2026 05:01:12 +0000
Received: from mail-pz2-x0d.google.com ([2607:f8b0:4864:3b::d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6hlS-00000008LCS-0kcv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 05:01:01 +0000
Received: by mail-pz2-x0d.google.com with SMTP id d2e1a72fcca58-85469f204f6so274564b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Sep 2026 22:00:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789534857; x=1790139657; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Pql7MOYwKZW3o6yhPXEQuRrMz6C0eX70Gy/W9byUq7w=;
        b=WxKmIoHcsi9QqaZ07pT/988JMDPYHsx7nXdR5THZk8w2apFJUUnXT6KL+Tb1huC2NV
         6/+KjmFVcuo+1Su7vCgGxUNBDR1dvD0WmAi5nEf7zz+jzPrAZLKFjlHEniqY/jJmh7JJ
         s022EpwibULNrM0MFhWpnk12TOJbils5aeoGBBxcKiimUN66VFbyWgITLqxG2MY8Ybzg
         OkpN2wu8Xx2voxZREuKj+moAUh0DBsMSFHRnP/T/Qc95LNv2ti+/287EAPXSuKR+KsfW
         dq+Hk1BVH17jdlex1pYAzpZi9JcxASFE0IzHM1GRh1GYtQWPCfYNezEy2zvFZqWigvs8
         D8iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789534857; x=1790139657;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Pql7MOYwKZW3o6yhPXEQuRrMz6C0eX70Gy/W9byUq7w=;
        b=MYeNAcinhCBtfh9tkP5CxxQd8n0jS587eYoL4552OI8ky1sBn+s6ldsUrbko0UpL9F
         xAylhi9CSi+nlwyyxt//9CR4SruMfX2ZWXLrfXedJLimCvEZs4AwZ9Ttn+sjySAa7CF9
         gA/h97o44hlKj/nq/GUkpjPKiPiizQ4pZdflMO8r7NnspLJvbhwCGidb7uACpeyOzfWJ
         rddu8X11pVVVd/qcfE0lXSMFj9qcuq4szVXulfZPOM4/7Smcoj/CtrF/iiGYaW6r2Jc6
         SpPq2KNOz5HSKwU7etbCziYK63bvkT1Na6nZjP9VVNJI6NkTx0Qwjt26TsIZDAmOdUh7
         1H9g==
X-Forwarded-Encrypted: i=1; AKwUvBw4Qu54SrVzfMlcU+6e5Dyj3hsUo6I9RGXlfe4GBW/zYkAd8Bdl7i7aZqgPgkmUrciy4V54cYmNhmGuFrouuyQH@lists.infradead.org
X-Gm-Message-State: AFuF++lW3vEcfvBfgIMhGBX46grkRHWIiZ9wPE3Os8I52g5M1wu1AfqF
	iok7Dy0nE8pb6wfkyCLWsh6aBRKZ83nOKtx9em9DYJE3NPngWlR5Ep/f
X-Gm-Gg: AYBFou0EAUsdLXdjQy2G95sRDrXUrOluU0gjGqc5N0JtrgwjtqiOjVf6TWU7qdjbeRK
	eji1Ko27lH/3dxN5OyWBil0DEoreEoedvJYElxO3qvipLeLr4gL60cwbYkZivyjtFAnU1RAWGbb
	/F0wURJ82vNxHHZiw9NEYV75ecX1JBbdxMKh92Ygz3hSKJHV0BsY+Jg95qR86cQ8IeCAOulDw0K
	SZVgSuUKa0xyc0v4sela1gtywolr7VT2s4PQ6O+Dy0An6a5TSD6SJJEFaF/oxA/T5LLq/KtizN6
	5NHRUabmOBi8uXzXNmIwKKg3ECRISarHFwNeVNmwsNM9VTfjdWfOtCqMOTVtfn5PvaBKrqp0x+G
	yL3/Ix2zuvWXShepGnlCjQYPIdttnGEnzQw9XSQRZvXBE8a7XcrGYKERg4bV15Dh7oN4xq//Cx6
	sCLcvla78fP3iFGIyj2zBDy/q3vVPRC88/khqYuiTIyAubNfRE+tpoifPofufp3T5D8d2xSWdjZ
	UL3poiEDjDaOGTez/SVaGBlk7I8dcAWUvzOkYujrnCowthk9i3NhvZBagX5gRak9Ox4kCxruYjB
	0VtbuDAshaP+5jw=
X-Received: by 2002:a05:6a00:b8a:b0:86c:f33d:e3b4 with SMTP id d2e1a72fcca58-872378b6fc0mr2276748b3a.8.1789534842957;
        Tue, 15 Sep 2026 22:00:42 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc50abb1776sm850589a12.27.2026.09.15.22.00.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 22:00:42 -0700 (PDT)
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
Subject: [PATCH v3 01/12] ASoC: mediatek: mt8189: Propagate APLL enable errors
Date: Wed, 16 Sep 2026 12:00:08 +0700
Message-ID: <20260916050020.14575-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260916050020.14575-1-phucduc.bui@gmail.com>
References: <20260916050020.14575-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_220100_067356_F0D1F292 
X-CRM114-Status: GOOD (  12.05  )
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
index fc7a7a73b0cf..f088ccf80448 100644
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


