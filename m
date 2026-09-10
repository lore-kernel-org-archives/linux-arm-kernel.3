Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDAF2C79FBF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 12:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g3KOEHZTQKUIeB5kbh5OXuF9axs2TgY2RpwsVG2WXZc=; b=J3OrbPE51eUdf26C+o+u55fAv2
	EhDvqcp+tuJBVpaQ4xxr1jO265z+ArARVBIWLps9yPn2u/PhGAQtqcBfgMcCl624KFTT2K4hGKYgh
	G9dLotMBY7cB7oer/DAwNsXqJQ8u1R3SOByRAWZw0RCPH+ieimnX3aAtnRuoH83jGtBzKVHSoX55I
	FYYVE/Rajdzaqu3O7GqfuWj9qqK1NUpTggD8q9LQvKJ9cT6sg0Udf6LyIhSU3lqeSd6yfh4HtchAj
	fAMIKpnjtCvBCTWFvUUmcl6DpMj/vwC2Zv2r7blEm0JUEeBI7fKWHSv4wKTj+NdUxG9IjNke3iesc
	1rSs01XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4eM1-0000000EOPK-31Mz;
	Thu, 10 Sep 2026 12:58:13 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4eLz-0000000EON9-0GYI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 12:58:12 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2d71d1cc8b2so54619255ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Sep 2026 05:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789045090; x=1789649890; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g3KOEHZTQKUIeB5kbh5OXuF9axs2TgY2RpwsVG2WXZc=;
        b=RW8Dp+o2/iz1atW0gXy+XKXo4VCJgMQ9MWZDjNcM0zaeR/F4ONgbSx8yqo0qDSpfrR
         9a0/sE/uFvxjO7yn/lXVdp6cw6B6wMVUg0eRFF3jlI/4UWv/jxtlD2lIgKr779O6ByIp
         EMt7U9zB2LX0lzoYB4ksWIkAuORaExiGVEduIcf4ULhoNvNq985ZIjvmmdmyaPa6zmJf
         8sFNewAyt5PJv7JdnE8EWQYKkn2tsd6i554gXbDcWs4X9S53cLZdNwOaLwTBZnfjBBx5
         rJB4upjiiN8r8ZsYduzZl+S+Jmx2nSk826H2IQvQFERs8PX7Di443WvVnSgLCHKhpmw/
         UEdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789045090; x=1789649890;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=g3KOEHZTQKUIeB5kbh5OXuF9axs2TgY2RpwsVG2WXZc=;
        b=FBuafYFTXIPw2BC5qCguNElhrwUIP3019NSqne7XQBqTYmtcjmjsKJONvKzdIDPH5W
         jxRjOr1IcxeE+C19CqE9cGrhHJdYbcL9UGgkauWm0mV2mW7E3b7/NKzDSdFk3/K4e8/D
         x9ZDDBCKunIiseP4PYDPIWx4wkqMGrBXcLhKLw6g5kaWERGfOgiFMD7ekZNyG3+XUp1I
         Qd9lnqgdihzStDFGyv88FqY3rq/HLI2okm1jGHrNyBN3AXpf2pQzVACafk1Yw0Rpz+fs
         sNJ21SWv7/k9npcQX1veQl/C2yJIkQhS8mCNcjGAsiq/VgMTnqvsSPRyWFKKCE6L7ZKA
         Dkbw==
X-Forwarded-Encrypted: i=1; AKwUvBz0TrTmEtOWZr6ovsGHrCT8mkueLWfg7Tk3p4gCNpUiU4aBG5dSOQRsIgLzuCI+MdfXySvHzcFozPJ0Q6zue2Kt@lists.infradead.org
X-Gm-Message-State: AFuF++mqgSRvisb6uyb1HaQjKylXq51tFfjwRzdj5CDlQYkOb9MiZu6i
	lKxWaNpVSOxHcSPicgO4c1i4+WBRuU3bBLQJM55okH7fV5EFHBBzhzwn
X-Gm-Gg: AYBFou0PoJzDLWf/jnmt9JaBt8oySmo0vftXbavBNhCUbTpghW1Oh0Ts4+njUdgFMQY
	0xYyqiBb/qaC7g96TIYr6Dlz2k2mwYl+dYhXDZ+BWVZO5CG1191anXbONI7CZoU6EHxGuok62Zg
	awnISoFSCcefPiQWbkF/m/D1tZSxyO7Qh/xmwqPNdShN2AK1auTxftIzbiZWvpEPwGSjszgxenU
	bWNOGGUv9nJ3ZV5mtaepQA6of5J/ZUGdNH8DgRO3hSAf+xW2CzHOzj2pl5PzJOvA4O6JLIHVSIY
	s15ZMa934y3ure8hEPVKx93Row28ziy1hhiBeOsMUkWNMgPBUJjpTqqSOnl9cqI8S9Cl1Q+ZdZk
	WhPuUp6YotZV3dA9Ewt0pM2mkHlrI5LFA99RSvo6Ppb+18/pDMyMR5b+QeJ5LCI9skiBsCxfy6N
	SyAUp68WeJMtr1COiIEZ1o+BQPc8bdDH3Ys4ZpOeqAYbdN/bm2P9Kej9syRLxKWdOPjo7f3TwHZ
	L/Nz6Y5YsDuwongixG99ovtpFV/fVuuwXNJB5rRg3VLN6SJgnAHAB9Sh2XlkrVPYluW8BsnTyrN
	HVWA0VpqoDw5gfQ=
X-Received: by 2002:a17:90b:268f:b0:398:c3a3:dbd0 with SMTP id 98e67ed59e1d1-39b2612eb96mr63642021a91.8.1789045090094;
        Thu, 10 Sep 2026 05:58:10 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d7e77b1afsm4891592a91.5.2026.09.10.05.58.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 05:58:09 -0700 (PDT)
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
Subject: [PATCH 02/13] ASoC: mediatek: mt8189: Propagate APLL enable errors
Date: Thu, 10 Sep 2026 19:57:31 +0700
Message-ID: <20260910125742.150902-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260910125742.150902-1-phucduc.bui@gmail.com>
References: <20260910125742.150902-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_055811_137716_68D92A20 
X-CRM114-Status: GOOD (  11.28  )
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
 sound/soc/mediatek/mt8189/mt8189-afe-clk.c | 78 ++++++++++++++++------
 1 file changed, 56 insertions(+), 22 deletions(-)

diff --git a/sound/soc/mediatek/mt8189/mt8189-afe-clk.c b/sound/soc/mediatek/mt8189/mt8189-afe-clk.c
index 63e03a40dbbe..a901be97e75f 100644
--- a/sound/soc/mediatek/mt8189/mt8189-afe-clk.c
+++ b/sound/soc/mediatek/mt8189/mt8189-afe-clk.c
@@ -454,30 +454,47 @@ int mt8189_apll1_enable(struct mtk_base_afe *afe)
 
 	ret = mt8189_afe_enable_top_cg(afe, MT8189_CG_APLL1_CK);
 	if (ret)
-		return ret;
+		goto err_apll1_ck;
 
 	ret = mt8189_afe_enable_top_cg(afe, MT8189_PDN_APLL_TUNER1);
 	if (ret)
-		return ret;
+		goto err_apll_tuner1;
 
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
+		goto err_tuner;
 
 	/* apll1 freq tuner enable */
-	regmap_update_bits(afe->regmap, AFE_APLL1_TUNER_CFG,
-			   FREQ_TUNER_EN_MASK_SFT,
-			   0x1 << FREQ_TUNER_EN_SFT);
+	ret = regmap_update_bits(afe->regmap, AFE_APLL1_TUNER_CFG,
+				 FREQ_TUNER_EN_MASK_SFT,
+				 0x1 << FREQ_TUNER_EN_SFT);
+	if (ret)
+		goto err_tuner;
 
 	/* audio apll1 on */
 	ret = mt8189_afe_enable_top_cg(afe, MT8189_AUDIO_APLL1_EN_ON);
 	if (ret)
-		return ret;
+		goto err_apll1_en_on;
 
 	return 0;
+
+err_apll1_en_on:
+	regmap_update_bits(afe->regmap, AFE_APLL1_TUNER_CFG,
+			   FREQ_TUNER_EN_MASK_SFT,
+			   0x0);
+err_tuner:
+	mt8189_afe_disable_top_cg(afe, MT8189_PDN_APLL_TUNER1);
+err_apll_tuner1:
+	mt8189_afe_disable_top_cg(afe, MT8189_CG_APLL1_CK);
+err_apll1_ck:
+	apll1_mux_setting(afe, false);
+
+	return ret;
 }
 
 void mt8189_apll1_disable(struct mtk_base_afe *afe)
@@ -506,30 +523,47 @@ int mt8189_apll2_enable(struct mtk_base_afe *afe)
 
 	ret = mt8189_afe_enable_top_cg(afe, MT8189_CG_APLL2_CK);
 	if (ret)
-		return ret;
+		goto err_apll2_ck;
 
 	ret = mt8189_afe_enable_top_cg(afe, MT8189_PDN_APLL_TUNER2);
 	if (ret)
-		return ret;
+		goto err_apll_tuner2;
 
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
+		goto err_tuner;
 
 	/* apll2 freq tuner enable */
-	regmap_update_bits(afe->regmap, AFE_APLL2_TUNER_CFG,
-			   FREQ_TUNER_EN_MASK_SFT,
-			   0x1 << FREQ_TUNER_EN_SFT);
+	ret = regmap_update_bits(afe->regmap, AFE_APLL2_TUNER_CFG,
+				 FREQ_TUNER_EN_MASK_SFT,
+				 0x1 << FREQ_TUNER_EN_SFT);
+	if (ret)
+		goto err_tuner;
 
 	/* audio apll2 on */
 	ret = mt8189_afe_enable_top_cg(afe, MT8189_AUDIO_APLL2_EN_ON);
 	if (ret)
-		return ret;
+		goto err_apll2_en_on;
 
 	return 0;
+
+err_apll2_en_on:
+	regmap_update_bits(afe->regmap, AFE_APLL2_TUNER_CFG,
+			   FREQ_TUNER_EN_MASK_SFT,
+			   0x0);
+err_tuner:
+	mt8189_afe_disable_top_cg(afe, MT8189_PDN_APLL_TUNER2);
+err_apll_tuner2:
+	mt8189_afe_disable_top_cg(afe, MT8189_CG_APLL2_CK);
+err_apll2_ck:
+	apll2_mux_setting(afe, false);
+
+	return ret;
 }
 
 void mt8189_apll2_disable(struct mtk_base_afe *afe)
-- 
2.43.0


