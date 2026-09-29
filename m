Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D6D4C9832A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 06:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vj13ChAHd3bCWGU6cXQ2y/gw1Mtr1ISY+VXDwMotkXI=; b=ZRzFi7/tlHfKjUDRujWQXE5YYw
	6SL2CGslKU4/9MDL7QSw/pKqGeU4u0MUoYKYiA6uaM1FPhmSpm3cJ9Qd1/GcLXC0BdWdzYdcfgBA2
	MggY6BAPiv5Bl4LaUSBYf50Eyl2wAvjhWQoEgsAaMyYih32B1tGa24G2nfPJ3ax1dq+1bOUGSjgfc
	3S0LMIrQAnAAQaioe+lAdSHWZfZubUpxEFOjLYAkq7y9kUmd8ya+TAUM4jabEFdh6arGhW5yksYi/
	gwHHpaR9p9CURU4wtrG+Z3OZpOcZonOZQ6eJAckjschEkl/9VHQ8oT4v1BN8mXLMrGqL/zqbpm0XC
	XLNFb2Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBR4T-00000002Pkg-1lND;
	Tue, 29 Sep 2026 06:12:09 +0000
Received: from mail-pj2-x0f.google.com ([2607:f8b0:4864:39::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBR4Q-00000002PjK-2bHR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 06:12:07 +0000
Received: by mail-pj2-x0f.google.com with SMTP id 98e67ed59e1d1-396ccb1a98fso2772911a91.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 23:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790662326; x=1791267126; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vj13ChAHd3bCWGU6cXQ2y/gw1Mtr1ISY+VXDwMotkXI=;
        b=Q/j/xyVF8CnZAbQ6VgO9f6o3TbAs7OA/xxc1bT2wnJqYjU0TsUxWoRQ5OeN1M+XtjZ
         fYSkV+1YudzIeF/enz4G8RfY/Move1Jf0hZRKdN4/d0peMY9pgIpBfMCVqyzMlhsMdtQ
         o14IKmSLbf4CrXJn8c4XtuzJb80YxjRPYXnST5iJ1JHAAFt7uAYOfevVEIK8tAozuJaI
         vHxmbt/7tm2G5Sg0WJ0jdK0/sqWm7KydP3Wrjd744RWpD4M/KUk24FrbcIkoU1ZiETqq
         TvEqUGrGZKsa3Vd4XSRa4RQB+qi5gI2RXvk2dOK3MYwi9Epz2zG3h0mhZAqvGYC7u8Ps
         tNmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790662326; x=1791267126;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Vj13ChAHd3bCWGU6cXQ2y/gw1Mtr1ISY+VXDwMotkXI=;
        b=bo38nIBTc9I4OuHuiake1UNHTFJYtVqnvq1KPrqh8LpKFe2JmKRdR2zfNOifGTyVOW
         RJxgga74msQXjHvkNWHcptnK+ATfY4bttCAAMNBD42EPQ3P+AbDV9Zj9TOiG+zxJqvZO
         12qXOAUbFTDvfbofxENKGJg9Cm4ABkZVK+9EEQrzmlVy4QG6RLPnQ+6rnxy4HwQfLWTO
         itkzA7c/Cq6ylcWJfx9+bH/NOES5u2Ok9ix3MVDG6WoM0hfonCrcpEDNmzBCLoqn/OhS
         JjtUlZWUXsUd3cpwSzKPGQZt9Xjvv6jbJd1brHScI8sJenlEfQWdnoPuybq7TGeYtSJb
         cYVg==
X-Forwarded-Encrypted: i=1; AKwUvBzuXTN/qJIOxYXcxBq6D+7RxehtN58ztuEaAsq0VxYNpuGk1p9l4HWcOnjH9dETHHBnfTP9EKji/9bi0UCL65kb@lists.infradead.org
X-Gm-Message-State: AFq9FYKJwWfi9uASK86jt6jbnW4W7CsKwIqg0hONI3mC+pcqtWEUF5vc
	bPIAv+e3TyOcdkSZZDYT32VCLUIs34vAq8Pw9cHJecotYT5xDhrcqxBG
X-Gm-Gg: AYBFou3efOshoYY1iEb4igL40sC+vflDUS4BE0apAFtZA5eYw1SdYvBWl5FVSQPYTXt
	NiB/DyVsVibBN+rsTRukA+pLGQN3WdzF8Pi0qE0FHuDkbUOUHa82rOEG+nhofZ0KB9HjswaHktr
	wr1cRWyM5zp5qIoDoXyGUK6hAnSC7gWHImLYnSZ4JoE28vMKgNwuhu/BJmP9xs/70OgMaqcOyzf
	N8mP+jhVnwnsfK7dk5yaMQ60WDfMeczkCK3Bwz+jWXS4YUnBdMlLMa6RlFb9qBHarFonRcc8r8K
	LhR/DTpgBsViuc/RAZICPLOj33NOrSDoYyhJI1AH2J41NjaQ8U3WKqPGO771MmNHnEmsItfqXLZ
	GtR6dy+lguZ2XhFrUwQxkgn1SlVTqVRf8fwQVlRM8aNDJUMOfbbMyBCNUt0TGhsCpU4C5guDbZY
	Ucp745keUat7uIkMtGeE/Ntp+lR//OUumOMiPQKCPB8RJEELA+Jk7DgYoesq38Q8mmjhyJXviMV
	S+eeRgamBK4JqHR0TzV2yZrwXl8VDLXtL0co6dZAelsbV8Nl6E1Q9U4PvXANWIY358ozZJXafS/
	OAdqfRjzRPpt4A==
X-Received: by 2002:a17:90b:548c:b0:39e:6c6a:656c with SMTP id 98e67ed59e1d1-3a0bb63224amr9430503a91.47.1790662325592;
        Mon, 28 Sep 2026 23:12:05 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a498726d63sm3280965a91.17.2026.09.28.23.12.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 23:12:05 -0700 (PDT)
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
Subject: [PATCH 02/10] ASoC: mediatek: mt8196: fix APLL enable error handling
Date: Tue, 29 Sep 2026 13:11:13 +0700
Message-ID: <20260929061121.124001-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260929061121.124001-1-phucduc.bui@gmail.com>
References: <20260929061121.124001-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_231206_698391_55010F46 
X-CRM114-Status: GOOD (  11.67  )
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

Propagate errors from the APLL mux and clock enable operations instead of
ignoring them or returning success on failure.

Clean up previously enabled clocks and disable the APLL tuner when a
later clock operation fails, restoring the APLL mux state before
returning the error.

Fixes: 7384ecab34eb ("ASoC: mediatek: mt8196: support audio clock control")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8196/mt8196-afe-clk.c | 47 ++++++++++++++++------
 1 file changed, 34 insertions(+), 13 deletions(-)

diff --git a/sound/soc/mediatek/mt8196/mt8196-afe-clk.c b/sound/soc/mediatek/mt8196/mt8196-afe-clk.c
index 91ae44024949..1dc4210e58c7 100644
--- a/sound/soc/mediatek/mt8196/mt8196-afe-clk.c
+++ b/sound/soc/mediatek/mt8196/mt8196-afe-clk.c
@@ -314,15 +314,17 @@ int mt8196_apll1_enable(struct mtk_base_afe *afe)
 	int ret;
 
 	/* setting for APLL */
-	apll1_mux_setting(afe, true);
+	ret = apll1_mux_setting(afe, true);
+	if (ret)
+		return ret;
 
 	ret = mt8196_afe_enable_top_cg(afe, MT8196_CG_APLL1_CK);
 	if (ret)
-		goto err_clk_apll1;
+		goto err_disable_mux;
 
 	ret = mt8196_afe_enable_top_cg(afe, MT8196_PDN_APLL_TUNER1);
 	if (ret)
-		goto err_clk_apll1_tuner;
+		goto err_disable_apll1_ck;
 
 	/* sel 44.1kHz:1, apll_div:7, upper bound:3 */
 	regmap_update_bits(afe->regmap, AFE_APLL1_TUNER_CFG,
@@ -336,14 +338,22 @@ int mt8196_apll1_enable(struct mtk_base_afe *afe)
 			   0x1 << FREQ_TUNER_EN_SFT);
 
 	/* audio apll1 on */
-	mt8196_afe_enable_top_cg(afe, MT8196_AUDIO_APLL1_EN_ON);
+	ret = mt8196_afe_enable_top_cg(afe, MT8196_AUDIO_APLL1_EN_ON);
+	if (ret)
+		goto err_disable_tuner;
 
 	return 0;
 
-err_clk_apll1_tuner:
+err_disable_tuner:
+	regmap_update_bits(afe->regmap, AFE_APLL1_TUNER_CFG,
+			   FREQ_TUNER_EN_MASK_SFT,
+			   0x0);
 	mt8196_afe_disable_top_cg(afe, MT8196_PDN_APLL_TUNER1);
-err_clk_apll1:
+err_disable_apll1_ck:
 	mt8196_afe_disable_top_cg(afe, MT8196_CG_APLL1_CK);
+err_disable_mux:
+	apll1_mux_setting(afe, false);
+
 	return ret;
 }
 
@@ -367,15 +377,17 @@ int mt8196_apll2_enable(struct mtk_base_afe *afe)
 	int ret;
 
 	/* setting for APLL */
-	apll2_mux_setting(afe, true);
+	ret = apll2_mux_setting(afe, true);
+	if (ret)
+		return ret;
 
 	ret = mt8196_afe_enable_top_cg(afe, MT8196_CG_APLL2_CK);
 	if (ret)
-		goto err_clk_apll2;
+		goto err_disable_mux;
 
 	ret = mt8196_afe_enable_top_cg(afe, MT8196_PDN_APLL_TUNER2);
 	if (ret)
-		goto err_clk_apll2_tuner;
+		goto err_disable_apll2_ck;
 
 	/* sel 48kHz: 2, apll_div: 7, upper bound: 3*/
 	regmap_update_bits(afe->regmap, AFE_APLL2_TUNER_CFG,
@@ -389,14 +401,23 @@ int mt8196_apll2_enable(struct mtk_base_afe *afe)
 			   0x1 << FREQ_TUNER_EN_SFT);
 
 	/* audio apll2 on */
-	mt8196_afe_enable_top_cg(afe, MT8196_AUDIO_APLL2_EN_ON);
+	ret = mt8196_afe_enable_top_cg(afe, MT8196_AUDIO_APLL2_EN_ON);
+	if (ret)
+		goto err_disable_tuner2;
+
 	return 0;
 
-err_clk_apll2_tuner:
+err_disable_tuner2:
+	regmap_update_bits(afe->regmap, AFE_APLL2_TUNER_CFG,
+			   FREQ_TUNER_EN_MASK_SFT,
+			   0x0);
 	mt8196_afe_disable_top_cg(afe, MT8196_PDN_APLL_TUNER2);
-err_clk_apll2:
+err_disable_apll2_ck:
 	mt8196_afe_disable_top_cg(afe, MT8196_CG_APLL2_CK);
-	return 0;
+err_disable_mux:
+	apll2_mux_setting(afe, false);
+
+	return ret;
 }
 
 void mt8196_apll2_disable(struct mtk_base_afe *afe)
-- 
2.43.0


